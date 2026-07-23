# GITNEXUS PLUGIN GUIDE (gitnexus.md)

**Mức ưu tiên**: ⭐⭐⭐⭐⭐  
**Vai trò**: Phân tích tác động (Blast Radius Analysis), Execution Flow và Dependency sâu hơn Graphify khi thực hiện refactor hoặc làm việc trên các hệ thống phức tạp.

---

## 🎯 CÁC TÍNH NĂNG CHÍNH
1. **Blast Radius Analysis**: Xác định chính xác 100% phạm vi bị rủi ro vỡ code khi thay đổi signature của một function core.
2. **Execution Flow Tracing**: Theo dõi luồng thực thi từ API route handler -> Service method -> Database Query -> Response Serializer.

---

## 📋 LỆNH HOẶC PROMPT MẪU DÀNH CHO AI AGENT
- `gitnexus analyze-impact --target="src/backend/services/PaymentService.ts#processRefund"`
- `gitnexus trace-flow --entry="POST /api/v1/orders"`
