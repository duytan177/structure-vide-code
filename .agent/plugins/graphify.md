# GRAPHIFY PLUGIN GUIDE (graphify.md)

**Mức ưu tiên**: ⭐⭐⭐⭐⭐  
**Vai trò**: Xây dựng Knowledge Graph cho codebase, giúp AI hiểu sơ đồ mối quan hệ giữa các module, class, hàm và thành phần trong `src/`.

---

## 🎯 CÁC TÍNH NĂNG CHÍNH
1. **Knowledge Graph Generation**: Tạo đồ thị liên kết tri thức giữa các file trong `src/frontend`, `src/backend` và `src/shared`.
2. **Context Querying**: Tra cứu nhanh xem một entity (Model/Service/Component) được import và sử dụng ở những nơi nào trong toàn bộ dự án.

---

## 📋 LỆNH HOẶC PROMPT MẪU DÀNH CHO AI AGENT
- `graphify query "UserAuthenticationService"` -> Trả về tất cả các controller, middleware, UI component đang gọi service này.
- `graphify rebuild` -> Cập nhật lại Knowledge Graph sau khi vừa tạo thêm nhiều file mới.
