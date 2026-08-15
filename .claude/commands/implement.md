---
description: Step 7 — Implementation (Git Worktree + Coding)
argument-hint: [PROJECT-XXX]
---

Perform **Step 7 — IMPLEMENTATION** for task: $ARGUMENTS

1. Create an isolated Git Worktree following `.claude/skills/git-worktree-flow/SKILL.md`.
   Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-<desc>` (rule 03).
2. Move the task `tasks/backlog/PROJECT-XXX.md` → `tasks/in-progress/`.
3. Read the spec before coding: `.claude/skills/write-spec/SKILL.md`.
4. Code in `workspace/<project-name>/` following `01-code-style.md` + `02-architecture-principles.md`; prefer TDD (`.claude/skills/tdd-workflow/SKILL.md`).
5. Attach traceability in the code: `.claude/skills/code-traceability/SKILL.md`.
6. FE/UI parts: use the skill `.claude/skills/ui-ux-promax/SKILL.md` (Figma-to-code, aesthetics checklist, a11y) — `/fe`.

Wrap-up: `/validate`.
