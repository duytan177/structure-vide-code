---
trigger: always_on
---

# Vide-Coder Workflow (Windsurf entry-point)

Đây là pointer. Nguồn chân lý duy nhất: `.agent/rules/00-ai-workflow.md` — luôn đọc trước khi làm.

## BẮT BUỘC (11 bước)
Discovery → Impact Analysis → Architecture → Specification → Planning → Task Breakdown →
Implementation → Self Validation → AI Review → Human Review → Knowledge Update → Merge/Release.

- Không bỏ qua Discovery, Impact Analysis, Self-Validation.
- Mỗi task chạy trong Git Worktree riêng.
- Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-desc`. Commit: Conventional Commits + Jira ID.
- Definition of Done: `docs/DEFINITION-OF-DONE.md`.

## Đọc thêm
`.agent/rules/01-code-style.md`, `02-architecture-principles.md`, `03-git-jira-workflow.md`,
`04-testing-qa.md`; skills tại `.claude/skills/` (chuẩn SKILL.md); plugin tại `.agent/plugins/README.md`.
