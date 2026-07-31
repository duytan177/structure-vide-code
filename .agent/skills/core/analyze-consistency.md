# SKILL: SOÁT NHẤT QUÁN CHÉO TRƯỚC KHI CODE (analyze-consistency.md)

Skill này là **GATE bắt buộc trước Bước 7 (Implementation)**: kiểm tra tính nhất quán chéo giữa
**REQ ↔ SPEC ↔ ADR ↔ PLAN ↔ TASK** dựa trên `docs/traceability-matrix.md`.
Học từ `/speckit.analyze` của GitHub spec-kit.

---

## 🎯 MỤC TIÊU
Phát hiện lệch/thiếu/mâu thuẫn **trước khi viết code** — rẻ hơn sửa sau. Không code khi gate FAIL.

## 🔎 CÁC KIỂM TRA (đọc-only, không sửa code)

1. **Coverage (không sót)**:
   - Mỗi REQ trong `docs/client-requirements/` có ít nhất 1 `SPEC-XXX` phủ không?
   - Mỗi `SPEC-XXX` có ít nhất 1 task `PROJECT-XXX` trong `tasks/` không?
   - Mỗi Acceptance Criteria (AC) có map tới task/test không?
2. **Traceability (khớp bảng)**:
   - Mọi dòng trong `docs/traceability-matrix.md` có ID tồn tại thật (không trỏ file ma)?
   - Task đang ở `tasks/in-progress/` có backlink tới SPEC + PLAN không?
3. **Mâu thuẫn nội dung**:
   - SPEC có mâu thuẫn với ADR đã chốt (`docs/adr/`) không?
   - PLAN có nhắc scope ngoài SPEC (scope creep) không?
   - Có quyết định lớn nào trong PLAN mà **chưa có ADR** không?
4. **Constitution (nếu có)**:
   - Thay đổi có vi phạm `docs/CONSTITUTION.md` (ràng buộc bất biến của dự án) không?

## 📤 KẾT QUẢ — báo cáo dạng bảng

| Mức | ID | Vấn đề | Đề xuất |
| :-- | :-- | :-- | :-- |
| 🔴 BLOCKER | SPEC-102 | Không có task nào phủ AC-3 | Tạo task hoặc bổ sung AC vào task hiện có |
| 🟡 WARN | PLAN-... | Nhắc caching layer chưa có ADR | Viết ADR trước khi code |

## 🚦 GATE
- **Còn 🔴 BLOCKER → DỪNG**, không sang Bước 7. Quay lại Spec/Plan/Breakdown để vá.
- Chỉ 🟡 WARN → được đi tiếp nhưng phải ghi nhận trong PR.

## ⚙️ QUY TRÌNH
1. Đọc `docs/traceability-matrix.md` + các file REQ/SPEC/ADR/PLAN/TASK liên quan.
2. Chạy 4 nhóm kiểm tra trên, gom phát hiện.
3. In bảng kết quả + kết luận PASS/FAIL. Nếu FAIL, liệt kê việc cần vá theo thứ tự.
