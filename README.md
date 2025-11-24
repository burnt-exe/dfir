# DFIR301 Lab & Classwork Hub

[![GitHub Pages](https://img.shields.io/badge/demo-online-brightgreen?style=for-the-badge&logo=github)](https://burnt-exe.github.io/dfir/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
![Status](https://img.shields.io/badge/status-active-success?style=for-the-badge)
![Made with](https://img.shields.io/badge/made%20with-HTML%20%26%20PDF-orange?style=for-the-badge&logo=html5)

> **DFIR for the guys** – a GitHub Pages–hosted collection of **digital forensics & incident response (DFIR)** labs, worksheets, quizzes and study guides aligned with DFIR301-style training.

---

![DFIR ToDo Dashboard](https://raw.githubusercontent.com/burnt-exe/dfir/main/todo.png)

---

## 🌐 Live Site

**GitHub Pages:**  
➡️ https://burnt-exe.github.io/dfir/

Open this link in a browser to access all labs and classwork directly as interactive web pages (no install required).

---

## 🎯 Purpose

This repo is a **DFIR training companion** for students and practitioners.  
It gives you:

- Ready-to-use **homework and lab templates**
- **Triage workflows** aligned with NIST guidance
- **Chain-of-custody** exercises & forms
- **Quizzes & study guides** for quick revision
- Real-world incident research tasks (especially **Critical Cyber Infrastructure**)

Perfect for:

- DFIR301 / Incident Response modules  
- SOC analyst bootcamps  
- Self-paced DFIR learning  

---

## 📁 Key Content

### 1. Triage & NIST IR

- **`triage.html`**  
  Interactive triage helper with:
  - Triage overview  
  - Severity decision matrix  
  - Checklist & notes  
  - Embedded quiz and links to PDF playbooks

- **`NIST_IR_Triage_Section.pdf`**  
  Printable reference section for integrating triage into a NIST-style IR plan.

- **`Triage_Decision_Matrix.pdf`**  
  Matrix for classifying incidents (Critical / Major / Minor).

- **`Triage_Form.pdf`**  
  Fillable triage capture form.

- **`Triage_Playbook.pdf`**  
  Step-by-step triage playbook for analysts.

---

### 2. Chain of Custody & Evidence Handling

- **`chain-of-custody.html`**  
  Classwork / lab page for practicing chain of custody documentation.

- **`cci.pdf`**  
  Additional reference for critical infrastructure incidents (used in related classwork).

---

### 3. Homework & Study Tools

- **`dfir-detection-homework.html`**  
  Web-based **Homework 04.01 – Detection Monitoring Plan** helper:
  - Step-by-step guide  
  - Hints for SIEM/EDR/log sources  
  - Sample answer  
  - NIST alignment pointers

- **`dfir-homework-form.html`**  
  Browser-fillable generic **DFIR homework form**:
  - Fill in the browser  
  - Print / “Save as PDF”  
  - Download answers as `.txt` (client-side only)

- **`dfir301-study-guide.html`**  
  Compact DFIR301 study guide with key terms and phases.

---

### 4. Quizzes & Classwork

- **`quiz-1.html`**  
  Quiz on DFIR fundamentals and module material (up to slide 40).

- **`quiz-2.html`**  
  Additional practice quiz with scenario-based questions.

- **`real-world-incidents-cci.html`**  
  Guided classwork: research **real-world cyber incidents** affecting critical infrastructure.

- **`classwork-4.html`** & **`case-study.html`**  
  Extra classwork and structured case study for deeper incident-handling practice.

---

### 5. Visual Assets

- **`stuxnet what happened.png`**  
- **`stuxnet what was the impact.png`**  
- **`stuxnet why it matters.png`**  

Used to illustrate the Stuxnet 2010 incident (what happened, impact, why it matters).

- **`to-do.png` / `todo.png`**  
DFIR to-do style graphics used for homework / classwork summaries.

---

## ⚙️ How to Use Locally

You don’t *have* to clone the repo to use the materials, but if you want to customize:

```bash
git clone https://github.com/burnt-exe/dfir.git
cd dfir

Then either:
	•	Open *.html files directly in your browser, or
	•	Serve locally (optional):

# Python 3
python -m http.server 8000
# then browse to http://localhost:8000/


⸻

🧩 Integration with “PyForensics Studio” (Planned)

This repo is also a content source for the upcoming PyForensics Studio:
	•	A Python/PyQt-based FTK-inspired DFIR tool
	•	Case management, evidence hashing, keyword search
	•	DFIR-first features:
	•	Triage checklists (backed by triage.html & PDFs)
	•	Chain-of-custody forms & examples
	•	Detection & monitoring plan templates

Future direction:
	•	Link GUI actions in PyForensics Studio to these HTML/PDF assets
	•	Embed the quizzes and forms as help/learning modules inside the tool
	•	Use this repo as a training content pack for junior analysts

⸻

🧱 Repo Structure (High Level)

dfir/
  ├─ LICENSE
  ├─ README.md                # You are here
  ├─ triage.html
  ├─ chain-of-custody.html
  ├─ dfir-detection-homework.html
  ├─ dfir-homework-form.html
  ├─ dfir301-study-guide.html
  ├─ quiz-1.html
  ├─ quiz-2.html
  ├─ real-world-incidents-cci.html
  ├─ classwork-4.html
  ├─ case-study.html
  ├─ NIST_IR_Triage_Section.pdf
  ├─ Triage_Decision_Matrix.pdf
  ├─ Triage_Form.pdf
  ├─ Triage_Playbook.pdf
  ├─ cci.pdf
  ├─ stuxnet what happened.png
  ├─ stuxnet what was the impact.png
  ├─ stuxnet why it matters.png
  ├─ todo.png
  └─ to-do.png


⸻

🤝 Contributing

This repo is intentionally simple and content-focused.
Ideas for contributions:
	•	New DFIR labs (HTML or PDF)
	•	Additional quizzes (web-based)
	•	Updated case studies / incident scenarios
	•	Translations (especially Arabic, French, Portuguese for African markets)
	•	Accessibility & mobile-view improvements

Workflow:
	1.	Fork the repo
	2.	Create a feature branch: feature/new-lab-name
	3.	Add your HTML/PDF assets + update this README.md
	4.	Submit a pull request

⸻

📜 License

This project is licensed under the MIT License – see LICENSE￼ for details.

⸻

“Every hour you spend understanding today saves you days of chaos tomorrow.”
DFIR is just structured curiosity with timestamps."