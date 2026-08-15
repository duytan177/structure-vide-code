---
trigger: always_on
---

# Vide-Coder Workflow (Windsurf entry-point)

This is a pointer. The single source of truth: `.agent/rules/00-ai-workflow.md` — always read it before working.

## MANDATORY (11 steps)
Discovery → Impact Analysis → Architecture → Specification → Planning → Task Breakdown →
Implementation → Self Validation → AI Review → Human Review → Knowledge Update → Merge/Release.

- Do not skip Discovery, Impact Analysis, Self-Validation.
- Each task runs in its own Git Worktree.
- Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-desc`. Commit: Conventional Commits + Jira ID.
- Definition of Done: `docs/DEFINITION-OF-DONE.md`.

## Further reading
`.agent/rules/01-code-style.md`, `02-architecture-principles.md`, `03-git-jira-workflow.md`,
`04-testing-qa.md`; skills in `.claude/skills/` (SKILL.md standard); plugins in `.agent/plugins/README.md`.
