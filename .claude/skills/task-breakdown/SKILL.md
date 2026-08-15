---
name: task-breakdown
description: >
  Break work down Epic→Story→Task→Subtask to Jira backlog standard + attach traceability. Use AFTER Planning, BEFORE
  Analyze; or when the user says "breakdown", "split tasks", "create tasks", "backlog", "Jira".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Task Breakdown (Step 6)

Break work into 15–30 minute steps with clear ACs.

## Workflow
1. **Task file**: `tasks/backlog/PROJECT-XXX.md` following `tasks/backlog/jira-task-template.md`; backlink SPEC/PLAN.
2. **Acceptance Criteria (Gherkin)**: Given [precondition] · When [action] · Then [expected result].
3. **AI Technical Checklist** by layer:
   - `[ ]` Data Layer / Migration / Models
   - `[ ]` Business Logic / Service
   - `[ ]` API Controller / Routes
   - `[ ]` Frontend UI + State
   - `[ ]` Unit Tests + Playwright E2E
4. Update `docs/traceability-matrix.md`.

Command `/breakdown`. Next: `/analyze`.
