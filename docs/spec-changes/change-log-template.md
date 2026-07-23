# LƯU VẾT THAY ĐỔI SPEC / NOTE BỔ SUNG TỪ JIRA Q&A HOẶC HỌP SYNC (change-log-template.md)

> [!IMPORTANT]
> AI Agent **BẮT BUỘC** đọc thư mục này trước khi viết code để đảm bảo cập nhật đúng các thay đổi mới nhất chưa kịp update vào file spec gốc.

- **Mã Ticket Jira**: `PROJECT-XXX`
- **Nguồn thay đổi**: [Jira Q&A Comment / Meeting Sync / Slack Discussion]
- **Ngày ghi nhận**: `YYYY-MM-DD`
- **Người xác nhận**: [PO / Tech Lead / Customer]

---

## 📝 1. NỘI DUNG THAY ĐỔI SPEC / THỎA THUẬN MỚI

### Thay đổi 1: [Tiêu đề thay đổi ngắn gọn]
- **Spec gốc quy định**: [Mô tả cũ trong spec]
- **Thỏa thuận mới sau Q&A/Họp**: [Mô tả logic mới cần thực thi]
- **Lý do điều chỉnh**: [Ghi chú lý do nếu có]

---

## ⚠️ 2. CÁC LƯU Ý KHI THỰC THI CHO AI AGENT
- Ưu tiên logic trong file này hơn file đặc tả cũ trong `docs/specs/`.
- Cập nhật lại Unit Test và E2E test theo logic mới này.
