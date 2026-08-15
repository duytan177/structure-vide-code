# GitHub Copilot — Entry point

Pointer file. The single source of truth for the workflow: [`.agent/rules/00-ai-workflow.md`](../.agent/rules/00-ai-workflow.md).

Follow the 11-step workflow: Discovery → Impact Analysis → Architecture → Specification → Planning →
Task Breakdown → Implementation → Self Validation → AI Review → Human Review → Knowledge Update.

- Do not skip Discovery, Impact Analysis, or Self-Validation.
- Branch `feature|fix|refactor|hotfix/PROJECT-XXX-desc`; commit Conventional Commits + Jira ID.
- Code style / architecture / testing: see `.agent/rules/01..04`. Definition of Done: `docs/DEFINITION-OF-DONE.md`.
