# SKILL CÓ SẴN: PHÂN TÍCH ẢNH HƯỞNG & BLAST RADIUS (impact-analysis.md)

Skill này hướng dẫn AI Agent sử dụng **GitNexus** và **Graphify** để phân tích luồng thực thi và tầm ảnh hưởng của các thay đổi trước khi viết code.

---

## 🎯 MỤC TIÊU SKILL
Ngăn ngừa tình trạng sửa một chỗ làm hỏng chỗ khác (Regression bugs) trong hệ thống nhiều module hoặc hệ thống lớn.

---

## 📋 CÁC BƯỚC THỰC THI (PROCEDURE)

1. **Gọi Graphify để tra cứu Knowledge Graph**:
   - Quét qua đồ thị tri thức codebase để tìm các module phụ thuộc trực tiếp và gián tiếp vào file/hàm chuẩn bị sửa.

2. **Chạy GitNexus Phân tích Blast Radius**:
   - Phân tích Execution Flow (luồng gọi hàm từ Frontend qua Backend tới Database).
   - Liệt kê danh sách tất cả các hàm/class sẽ bị tác động bởi thay đổi này (Blast Radius List).

3. **Lập danh sách Kiểm thử bổ sung (Regression Test Scope)**:
   - Ghi lại các khu vực có nguy cơ cao bị ảnh hưởng để bổ sung test case vào Playwright MCP / Unit Test suite.
