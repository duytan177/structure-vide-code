---
description: Bước 7 — Implementation (Git Worktree + Coding)
argument-hint: [PROJECT-XXX]
---

Thực hiện **Bước 7 — IMPLEMENTATION** cho task: $ARGUMENTS

1. Tạo Git Worktree cô lập theo `.agent/skills/core/git-worktree-flow.md`.
   Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-<desc>` (rule 03).
2. Move task `tasks/backlog/PROJECT-XXX.md` → `tasks/in-progress/`.
3. Đọc spec trước khi code: `.agent/skills/core/read-spec-first.md`.
4. Code trong `workspace/<ten-du-an>/` theo `01-code-style.md` + `02-architecture-principles.md`; ưu tiên TDD (`.agent/skills/core/tdd-workflow.md`).
5. Gắn traceability trong code: `.agent/skills/core/code-traceability-linkage.md`.

Kết thúc: `/validate`.
