---
description: Step 8 — Self Validation (Lint + Typecheck + Unit + E2E)
---

Perform **Step 8 — SELF VALIDATION** for the current change.

1. Run Linter + Typecheck (per the stack in `src/`).
2. Run Unit Tests following `.claude/skills/tdd-workflow/SKILL.md` (coverage ≥ 80%).
3. Run E2E Playwright via the subagent `.agent/agents/e2e-runner.md` (if there is UI), covering all Acceptance Criteria.
4. If the build fails → use `.agent/agents/build-error-resolver.md`.

Only proceed when everything passes. Wrap-up: `/ai-review`.
