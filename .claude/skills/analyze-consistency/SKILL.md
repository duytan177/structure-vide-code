---
name: analyze-consistency
description: >
  GATE soát nhất quán chéo REQ↔SPEC↔ADR↔PLAN↔TASK trước khi code. Dùng SAU task breakdown,
  TRƯỚC implementation; hoặc khi user nói "analyze", "kiểm tra nhất quán", "trước khi code".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Analyze — gate nhất quán chéo (Bước 6.5)

Kiểm tra dựa trên `docs/traceability-matrix.md`:
- **Coverage**: mỗi REQ có SPEC; mỗi SPEC có TASK; mỗi AC có task/test.
- **Traceability**: ID trong matrix tồn tại thật; task in-progress có backlink SPEC/PLAN.
- **Mâu thuẫn**: SPEC vs ADR; PLAN scope creep; quyết định lớn thiếu ADR; vi phạm `docs/CONSTITUTION.md`.

## Kết quả — bảng
| Mức | ID | Vấn đề | Đề xuất |
| :-- | :-- | :-- | :-- |
| 🔴 BLOCKER | SPEC-102 | Không task nào phủ AC-3 | Tạo task / bổ sung AC |
| 🟡 WARN | PLAN | Nhắc caching chưa có ADR | Viết ADR trước khi code |

**GATE**: còn 🔴 BLOCKER → DỪNG, quay lại Spec/Plan/Breakdown; không sang Bước 7. Command `/analyze`.
