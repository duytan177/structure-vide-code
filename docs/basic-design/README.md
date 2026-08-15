# BASIC DESIGN DIRECTORY (docs/basic-design/)

This directory holds the original **Basic Design** files in Excel (`.xlsx`, `.xls`), CSV, or Word/PDF form, provided by the PO, Client, or Business Analyst (BA) at project kickoff.

---

## 📌 EXCEL FILE NAMING AND FORMAT CONVENTIONS

So the AI Agent can automatically read and extract data accurately, Excel files placed in this directory should be named per the standard:

1. **Screen & Feature List**: `BasicDesign_ScreenList.xlsx`
2. **Screen Detail & Form Validation Spec**: `BasicDesign_Screen_<ScreenID>.xlsx` (Example: `BasicDesign_Screen_SCR001_Login.xlsx`)
3. **API List & Database Structure**: `BasicDesign_API_Database.xlsx`

---

## ⚡ HOW TO TRIGGER THE AI AGENT TO AUTO-CONVERT INTO SPECS & TASKS

When you upload the Basic Design Excel files into this directory, simply instruct the AI Agent:
> *"AI Agent, read the Basic Design Excel files in docs/basic-design/ and create the feature spec files in docs/specs/ along with the Jira tasks in tasks/backlog/"*

The AI Agent will automatically activate the Skill [`.claude/skills/write-spec/SKILL.md`](.claude/skills/write-spec/SKILL.md) to:
1. Read all sheets in the `.xlsx` file.
2. Create the corresponding Markdown spec files: `docs/specs/SPEC-SCR001-login-screen.md`, `docs/specs/SPEC-SCR002-dashboard.md`, etc.
3. Pre-create the standard Backlog Jira task skeletons in `tasks/backlog/PROJECT-SCR001.md`.
