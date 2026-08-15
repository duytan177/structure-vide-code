---
name: discovery-brainstorm
description: >
  Discovery — phản biện & làm rõ yêu cầu bằng Q&A trước khi thiết kế (dùng Superpowers brainstorming).
  Dùng KHI bắt đầu bất kỳ tính năng/thay đổi nào, hoặc user nói "bắt đầu", "yêu cầu", "brainstorm", "discovery".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Discovery (Bước 1)

Làm rõ điểm mơ hồ, đặt câu hỏi phản biện kỹ thuật/nghiệp vụ, tổng hợp nghiên cứu trước khi Impact Analysis & Architecture.

## Quy trình
1. **Thu thập**: đọc `docs/client-requirements/` + `docs/basic-design/` (dự án mới) hoặc change request + `docs/specs/_baseline/` (dự án cũ).
2. **Socratic Q&A**: liệt kê edge case, rủi ro bảo mật, thiếu sót logic nghiệp vụ. Dùng skill Superpowers `brainstorming`.
3. **Research**: tìm giải pháp/thư viện/thuật toán tối ưu (Context7 khi cần).
4. **Xuất tài liệu**: `docs/discovery/discovery-YYYYMMDD-<feature>.md`.

**HARD-GATE**: chưa chốt thiết kế / user chưa duyệt → không sang Spec/Code. Next: `/clarify`. Command `/discovery`.
