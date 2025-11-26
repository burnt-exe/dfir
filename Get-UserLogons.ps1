<#
.SYNOPSIS
    Show Windows user logon sessions for the past week (default).

.DESCRIPTION
    Reads Security event log (Event ID 4624) and lists successful
    interactive / RDP logons. You can filter by username and change
    the lookback period (in days).

.PARAMETER UserName
    Optional. Filter to a specific user (e.g. "raydo" or "DOMAIN\raydo").

.PARAMETER Days
    Optional. Number of days to look back (default = 7).
#>

param(
    [string]$UserName,
    [int]$Days = 7
)

# --- Config ---
$startTime = (Get-Date).AddDays(-$Days)

# 4624 = Successful logon
$filterHash = @{
    LogName   = 'Security'
    Id        = 4624
    StartTime = $startTime
}

Write-Host "Collecting logon events since $startTime ..." -ForegroundColor Cyan

# Pull events from Security log
$rawEvents = Get-WinEvent -FilterHashtable $filterHash -ErrorAction SilentlyContinue

if (-not $rawEvents) {
    Write-Warning "No logon events found in the specified time range."
    return
}

# Parse XML and extract useful fields
$logons = $rawEvents | ForEach-Object {
    $xml = [xml]$_.ToXml()
    $data = $xml.Event.EventData.Data

    # Helper to read a field by name
    function Get-Field([string]$name) {
        ($data | Where-Object { $_.Name -eq $name }).'#text'
    }

    # LogonType values:
    # 2 = Interactive (console)
    # 3 = Network
    # 7 = Unlock
    # 10 = RemoteInteractive (RDP)
    $logonType    = Get-Field 'LogonType'
    $targetUser   = Get-Field 'TargetUserName'
    $targetDomain = Get-Field 'TargetDomainName'
    $ipAddress    = Get-Field 'IpAddress'
    $workstation  = Get-Field 'WorkstationName'

    # Build DOMAIN\user if domain present
    if ($targetDomain -and $targetUser -and $targetDomain -ne '-') {
        $fullUser = "$targetDomain\$targetUser"
    } else {
        $fullUser = $targetUser
    }

    # Output as object
    [PSCustomObject]@{
        TimeCreated = $_.TimeCreated
        User        = $fullUser
        LogonType   = [int]$logonType
        IpAddress   = if ($ipAddress -and $ipAddress -ne '::1' -and $ipAddress -ne '127.0.0.1') { $ipAddress } else { $null }
        Workstation = if ($workstation -and $workstation -ne '-') { $workstation } else { $null }
        Machine     = $env:COMPUTERNAME
    }
}

# Only keep "real" user logons (console / RDP / unlock / some network)
$interactiveTypes = 2,3,7,10
$logons = $logons | Where-Object { $_.LogonType -in $interactiveTypes -and $_.User -and $_.User -notlike 'DWM-*' -and $_.User -notlike 'UMFD-*' }

# Optional user filter
if ($UserName) {
    Write-Host "Filtering for user: $UserName" -ForegroundColor Yellow
    $logons = $logons | Where-Object {
        $_.User -like "*$UserName*"    # partial match
    }
}

if (-not $logons) {
    Write-Warning "No matching interactive/RDP logons found."
    return
}

# Sort by time
$logons = $logons | Sort-Object TimeCreated

Write-Host "`n=== Detailed Logon Events ===`n" -ForegroundColor Cyan
$logons | Select-Object TimeCreated, User, LogonType, IpAddress, Workstation, Machine |
    Format-Table -AutoSize

# Quick summary per user
Write-Host "`n=== Summary: Logons per User (last $Days day(s)) ===`n" -ForegroundColor Green
$logons |
    Group-Object User |
    Sort-Object Count -Descending |
    Select-Object @{Name='User';Expression={$_.Name}}, Count |
    Format-Table -AutoSize

# Optional: export to CSV for reporting
$csvPath = Join-Path $env:USERPROFILE "Desktop\UserLogons_Last${Days}Days.csv"
$logons | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

Write-Host "`nCSV exported to: $csvPath" -ForegroundColor Cyan
