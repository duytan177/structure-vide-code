# THƯ MỤC THIẾT KẾ CƠ SỞ - BASIC DESIGN (docs/basic-design/)

Thư mục này chứa các file **Thiết kế cơ sở (Basic Design)** nguyên bản dạng Excel (`.xlsx`, `.xls`), CSV hoặc Word/PDF do PO, Khách hàng hoặc Business Analyst (BA) cung cấp khi bắt đầu dự án.

---

## 📌 QUY ĐỊNH ĐẶT TÊN VÀ ĐỊNH DẠNG FILE EXCEL

Để AI Agent có thể tự động đọc và bóc tách dữ liệu chuẩn xác, các file Excel đưa vào thư mục này nên được đặt tên theo quy chuẩn:

1. **Danh sách Màn hình & Tính năng**: `BasicDesign_ScreenList.xlsx`
2. **Đặc tả Chi tiết Màn hình & Form Validation**: `BasicDesign_Screen_<ScreenID>.xlsx` (Ví dụ: `BasicDesign_Screen_SCR001_Login.xlsx`)
3. **Danh sách API & Cấu trúc Database**: `BasicDesign_API_Database.xlsx`

---

## ⚡ CÁCH KÍCH HOẠT AI AGENT TỰ ĐỘNG CHUYỂN ĐỔI SANG SPECS & TASKS

Khi bạn tải file Excel Basic Design vào thư mục này, chỉ cần ra lệnh cho AI Agent:
> *"AI Agent hãy đọc file Basic Design Excel trong docs/basic-design/ và tạo các file đặc tả tính năng trong docs/specs/ cùng với các Jira tasks trong tasks/backlog/"*

AI Agent sẽ tự động kích hoạt Skill [`.agent/skills/core/parse-basic-design-excel.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/skills/core/parse-basic-design-excel.md) để:
1. Đọc tất cả các sheet trong file `.xlsx`.
2. Tạo file đặc tả Markdown tương ứng: `docs/specs/SPEC-SCR001-login-screen.md`, `docs/specs/SPEC-SCR002-dashboard.md`...
3. Tạo sẵn dàn khung task Jira chuẩn Backlog trong `tasks/backlog/PROJECT-SCR001.md`.
