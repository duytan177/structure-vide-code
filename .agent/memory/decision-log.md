# LỊCH SỬ CÁC QUYẾT ĐỊNH KIẾN TRÚC & LESSONS LEARNED (decision-log.md)

File này ghi lại nhật ký ngắn các quyết định kiến trúc đã được thông qua và các bài học kinh nghiệm thu được trong quá trình phát triển.

---

## 📜 NHẬT KÝ QUYẾT ĐỊNH (DECISION LOG)

| Ngày | Quyết định | Người duyệt / ADR | Ghi chú |
| :--- | :--- | :--- | :--- |
| 2026-07-23 | Khởi tạo cấu trúc dự án Vide-coder chuẩn AI Workflow | ADR-000 | Tách biệt `.agent/`, `docs/`, `plans/`, `tasks/` và `src/` |

---

## 💡 LESSONS LEARNED (BÀI HỌC KINH NGHIỆM)
- Phải kiểm tra thư mục `docs/spec-changes/` trước khi làm task để tránh làm sai spec mới nhất từ họp hành/Jira Q&A.
- Luôn gọi GitNexus phân tích Blast Radius trước khi refactor hàm core.
