# INITIAL CLIENT REQUIREMENTS DIRECTORY (docs/client-requirements/)

This directory holds all the **Initial Requirement Documents (Raw Requirements / BRD - Business Requirement Documents)** provided by the Client or Product Owner (PO) at the very start of project initialization.

---

## 📌 SUPPORTED FILE FORMATS
You can place the following file formats into this directory:
- Markdown (`.md`), Text (`.txt`) files
- Word (`.docx`, `.doc`), PDF (`.pdf`) files
- Process diagram files, business-problem description documents

---

## ⚡ GUIDE TO INITIALIZING A PROJECT FROM THE ORIGINAL REQUIREMENTS

When you have just initialized the project and placed the client's documents into this directory, simply instruct the AI Agent:
> *"AI Agent, read the initial requirement documents in docs/client-requirements/ and initialize the feature specs in docs/specs/ along with the initial Jira task set in tasks/backlog/"*

The AI Agent will automatically activate the Skill [`.claude/skills/write-spec/SKILL.md`](.claude/skills/write-spec/SKILL.md) to:
1. Read and analyze all the original requirement documents.
2. Extract the list of Actors, Modules, Functional Requirements, and Business Rules.
3. Generate standardized Markdown spec files in `docs/specs/`.
4. Initialize the initial Jira Backlog Task set in `tasks/backlog/`.
