---
name: code-traceability
description: >
  Attach traceability links REQ→SPEC→TASK→commit→PR in code & update the traceability matrix. Use WHEN
  implementing/completing a task; or the user says "traceability", "trace", "link task".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Code Traceability

Ensure all code can be traced back to Jira + spec.

## Workflow
1. **Extract IDs**: Jira Ticket (e.g. `PROJECT-102`) + the corresponding spec section in `docs/specs/`.
2. **Traceability comment** on important modules/functions:
   ```ts
   /**
    * @JiraTicket PROJECT-102
    * @SpecRef docs/specs/auth-spec.md#FR-1
    * @Description JWT tokens with refresh rotation
    */
   ```
3. **Record traces in the task** `tasks/in-progress/PROJECT-XXX.md`: link file + line range when a sub-task is done.
4. Keep `docs/traceability-matrix.md` in sync (REQ→SPEC→PLAN→TASK→commit→PR).
