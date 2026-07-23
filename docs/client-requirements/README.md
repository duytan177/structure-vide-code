# THƯ MỤC TÀI LIỆU YÊU CẦU BAN ĐẦU TỪ KHÁCH HÀNG (docs/client-requirements/)

Thư mục này chứa tất cả các **Tài liệu Yêu cầu Ban đầu (Raw Requirements / BRD - Business Requirement Documents)** do phía Khách hàng hoặc Product Owner (PO) cung cấp khi mới bắt đầu khởi tạo dự án.

---

## 📌 ĐỊNH DẠNG FILE HỖ TRỢ
Bạn có thể đưa vào thư mục này các định dạng file:
- File Markdown (`.md`), Text (`.txt`)
- File Word (`.docx`, `.doc`), PDF (`.pdf`)
- File sơ đồ quy trình, tài liệu mô tả bài toán kinh doanh

---

## ⚡ HƯỚNG DẪN KHỞI TẠO DỰ ÁN TỪ REQUIREMENTS GỐC

Khi mới init dự án và vừa đưa các file tài liệu của khách hàng vào thư mục này, bạn chỉ cần ra lệnh cho AI Agent:
> *"AI Agent hãy đọc tài liệu yêu cầu ban đầu trong docs/client-requirements/ và khởi tạo các đặc tả tính năng trong docs/specs/ cùng bộ Jira tasks ban đầu trong tasks/backlog/"*

AI Agent sẽ tự động kích hoạt Skill [`.agent/skills/core/parse-client-requirements.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/skills/core/parse-client-requirements.md) để:
1. Đọc và phân tích toàn bộ tài liệu yêu cầu gốc.
2. Trích xuất danh sách Actors, Modules, Functional Requirements và Business Rules.
3. Sinh các file đặc tả Markdown chuẩn hóa trong `docs/specs/`.
4. Khởi tạo bộ Jira Backlog Tasks ban đầu trong `tasks/backlog/`.
