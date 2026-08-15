# ARCHITECTURE DECISION HISTORY & LESSONS LEARNED (decision-log.md)

This file keeps a short log of the architecture decisions that have been approved and the lessons learned during development.

---

## 📜 DECISION LOG

| Date | Decision | Approver / ADR | Notes |
| :--- | :--- | :--- | :--- |
| 2026-07-23 | Initialize the Vide-coder project structure following the AI Workflow standard | ADR-000 | Separate `.agent/`, `docs/`, `plans/`, `tasks/`, and `src/` |

---

## 💡 LESSONS LEARNED

- Always check the `docs/spec-changes/` directory before working on a task to avoid violating the latest spec from meetings/Jira Q&A.
- Always call GitNexus to analyze the Blast Radius before refactoring a core function.
