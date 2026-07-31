# GitHub Copilot — Entry-point

Pointer file. Nguồn chân lý duy nhất của quy trình: [`.agent/rules/00-ai-workflow.md`](../.agent/rules/00-ai-workflow.md).

Tuân thủ quy trình 11 bước: Discovery → Impact Analysis → Architecture → Specification → Planning →
Task Breakdown → Implementation → Self Validation → AI Review → Human Review → Knowledge Update.

- Không bỏ qua Discovery, Impact Analysis, Self-Validation.
- Branch `feature|fix|refactor|hotfix/PROJECT-XXX-desc`; commit Conventional Commits + Jira ID.
- Code style / kiến trúc / test: xem `.agent/rules/01..04`. Definition of Done: `docs/DEFINITION-OF-DONE.md`.
