# TRACEABILITY MATRIX

An end-to-end traceability table ensuring every line of code can be traced back to its original requirement.
Standard ID chain: **REQ → SPEC → PLAN → TASK(Jira) → COMMIT/PR**.

## ID conventions
| Type | Prefix | Location |
| :--- | :--- | :--- |
| Requirement | `REQ-XXX` | `docs/client-requirements/` |
| Specification | `SPEC-XXX` | `docs/specs/SPEC-XXX.md` |
| Architecture Decision | `ADR-XXX` / `RFC-XXX` | `docs/adr/` |
| Plan | `PLAN-XXX` | `plans/` |
| Task (Jira) | `PROJECT-XXX` | `tasks/` |

## Matrix
| REQ | SPEC | ADR/RFC | PLAN | TASK (Jira) | PR | Status |
| :-- | :--- | :------ | :--- | :---------- | :- | :--------- |
| REQ-001 | SPEC-001 | — | PLAN-001 | PROJECT-101 | #— | ⬜ Backlog |
<!-- Add a new row for each requirement. Update at Step 6 and Step 11. -->

> Status: ⬜ Backlog · 🟡 In-progress · 🔵 In-review · ✅ Done
