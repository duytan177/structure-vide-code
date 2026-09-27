---
description: Step 8 — Self Validation (Lint + Typecheck + Unit + E2E)
---

Perform **Step 8 — SELF VALIDATION** for the current change.

1. Run Linter + Typecheck (per the stack in `workspace/<project-name>/`).
2. Run Unit Tests following `.claude/skills/tdd-workflow/SKILL.md` — actually execute the stack's coverage tool and read the measured number; 🔴 BLOCKER if <80%, don't just assert it passes.
3. Run E2E Playwright via the `e2e-runner` persona (Claude Code: Task/Agent tool, `.claude/agents/e2e-runner.md`; others: `.agent/agents/e2e-runner.md`) if there is UI, covering all Acceptance Criteria.
4. If the build fails → use the `build-error-resolver` persona (Claude Code: Task/Agent tool, `.claude/agents/build-error-resolver.md`; others: `.agent/agents/build-error-resolver.md`).

Only proceed when everything passes. Wrap-up: `/ai-review`.
