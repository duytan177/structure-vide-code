---
description: Làm rõ yêu cầu mơ hồ trước khi viết Spec (Bước 1.5)
argument-hint: [feature | REQ-XXX]
---

Chạy **/clarify** cho: $ARGUMENTS theo skill `.agent/skills/core/clarify-requirements.md`.

1. Đọc `docs/discovery/` + `docs/client-requirements/` (+ `docs/specs/_baseline/` nếu brownfield).
2. Lập câu hỏi có cấu trúc, ưu tiên blocker; hỏi dạng trắc nghiệm/đề xuất mặc định.
3. Ghi câu trả lời + giả định vào `docs/discovery/<feature>-clarifications.md`.
4. Ràng buộc bất biến mới → cập nhật `docs/CONSTITUTION.md`.

Vị trí: sau `/discovery`, trước `/spec`. Exit khi hết câu hỏi blocker.
