# SUPERPOWER CODE GRAPH GUIDE (superpower.md)

**Mức ưu tiên**: ⭐⭐⭐⭐⭐  
**Vai trò**: Quản lý indexing và xây dựng sơ đồ ngữ cảnh (Code Graph) tốc độ cao cho codebase vừa và lớn, hỗ trợ AI Agent truy vấn nhanh symbol, class và function context.

---

## 🎯 CÁC TÍNH NĂNG CHÍNH
1. **Symbol Tracking**: Định vị nhanh mọi nơi định nghĩa và sử dụng function/class/variable trong `src/`.
2. **Context Booster**: Cung cấp context chính xác cho AI Agent khi sinh code hoặc refactor module.

---

## 📋 LỆNH HOẶC PROMPT MẪU DÀNH CHO AI AGENT
- `superpower index --path="./src"` -> Cập nhật lại Code Graph Indexing.
- `superpower symbol "OrderRepository"` -> Truy vấn thông tin chi tiết về class OrderRepository.
