# CONTEXT MODE: CHẾ ĐỘ NGHIÊN CỨU & KHÁM PHÁ (research-mode.md)

Khi kích hoạt chế độ này, AI Agent tuyệt đối không sửa bất kỳ dòng code nào. Chỉ tập trung đọc spec, truy vấn Graphify/GitNexus và phân tích kiến trúc.

---

## ⚡ HÀNH VI ƯU TIÊN IN RESEARCH MODE
- Không thực hiện bất kỳ lệnh sửa code nào.
- Trích xuất thông tin đặc tả từ `docs/specs/`, `docs/basic-design/` và `docs/adr/`.
- Phân tích mối quan hệ phụ thuộc giữa các module trong `src/`.
