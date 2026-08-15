---
name: clarify-requirements
description: >
  Làm rõ yêu cầu mơ hồ (edge case, phi chức năng, ranh giới scope) trước khi viết Spec. Dùng SAU
  Discovery, TRƯỚC Spec; hoặc khi yêu cầu chưa rõ, user nói "làm rõ", "clarify", "hỏi lại".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Clarify — làm rõ yêu cầu (Bước 1.5)

Bóc tách câu hỏi chặn (blocker) theo nhóm: chức năng mơ hồ, phi chức năng, dữ liệu, ranh giới scope, phụ thuộc.
Hỏi user dạng trắc nghiệm/đề xuất mặc định; ghi kết quả `docs/discovery/<feature>-clarifications.md`; ràng buộc bất biến mới → `docs/CONSTITUTION.md`.

Nhóm câu hỏi: chức năng mơ hồ · phi chức năng (perf/security/i18n/mobile) · dữ liệu (format/validation/vòng đời) · ranh giới scope (out-of-scope) · phụ thuộc (API/quyền).

**Exit**: hết câu hỏi 🔴 blocker; giả định chưa xác nhận đánh dấu `[ASSUMPTION]`. Command `/clarify`.
