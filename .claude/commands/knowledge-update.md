---
description: Bước 11 — Knowledge Update (ADR + Memory + Graph + Changelog)
argument-hint: [PROJECT-XXX]
---

Thực hiện **Bước 11 — KNOWLEDGE UPDATE** cho: $ARGUMENTS

1. Áp dụng skill `.claude/skills/knowledge-update/SKILL.md`.
2. Re-index Graphify / GitNexus / Superpower Knowledge Graph.
3. Cập nhật `.agent/memory/decision-log.md` và `.agent/memory/context.md`.
4. Cập nhật `docs/traceability-matrix.md` (TASK → PR, trạng thái ✅).
5. Ghi changelog vào `docs/spec-changes/` nếu spec thay đổi.
6. Move task `tasks/in-progress/PROJECT-XXX.md` → `tasks/completed/`.
7. Dọn Git Worktree đã dùng.

Kết thúc: sẵn sàng MERGE / RELEASE.
