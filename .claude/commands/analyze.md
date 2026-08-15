---
description: Gate soát nhất quán chéo REQ↔SPEC↔ADR↔PLAN↔TASK trước khi code
argument-hint: [PROJECT-XXX | SPEC-XXX]
---

Chạy **GATE /analyze** cho: $ARGUMENTS theo skill `.claude/skills/analyze-consistency/SKILL.md`.

1. Đọc `docs/traceability-matrix.md` + REQ/SPEC/ADR/PLAN/TASK liên quan.
2. Kiểm tra: coverage (không sót), traceability (ID có thật), mâu thuẫn nội dung, vi phạm `docs/CONSTITUTION.md`.
3. In bảng kết quả với mức 🔴 BLOCKER / 🟡 WARN + đề xuất vá.
4. **GATE**: còn 🔴 → DỪNG, không sang `/implement`. Quay lại `/spec` hoặc `/breakdown` để vá.

Chạy sau `/breakdown`, trước `/implement`.
