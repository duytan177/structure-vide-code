---
description: Bước 7 — Implementation (Git Worktree + Coding)
argument-hint: [PROJECT-XXX]
---

Thực hiện **Bước 7 — IMPLEMENTATION** cho task: $ARGUMENTS

1. Tạo Git Worktree cô lập theo `.claude/skills/git-worktree-flow/SKILL.md`.
   Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-<desc>` (rule 03).
2. Move task `tasks/backlog/PROJECT-XXX.md` → `tasks/in-progress/`.
3. Đọc spec trước khi code: `.claude/skills/write-spec/SKILL.md`.
4. Code trong `workspace/<ten-du-an>/` theo `01-code-style.md` + `02-architecture-principles.md`; ưu tiên TDD (`.claude/skills/tdd-workflow/SKILL.md`).
5. Gắn traceability trong code: `.claude/skills/code-traceability/SKILL.md`.
6. Phần FE/UI: dùng skill `.claude/skills/ui-ux-promax/SKILL.md` (Figma-to-code, checklist thẩm mỹ, a11y) — `/fe`.

Kết thúc: `/validate`.
