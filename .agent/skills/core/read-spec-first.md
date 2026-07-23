# SKILL CÓ SẴN: KIỂM TRA ĐẶC TẢ & THAY ĐỔI TRƯỚC KHI CODE (read-spec-first.md)

Skill này hướng dẫn AI Agent thực hiện bước kiểm tra đặc tả bắt buộc trước khi động vào mã nguồn.

---

## 🎯 MỤC TIÊU SKILL
Đảm bảo AI Agent không suy đoán (hallucinate) hoặc làm sai yêu cầu nghiệp vụ do chưa cập nhật đặc tả mới nhất.

---

## 📋 CÁC BƯỚC THỰC THI (PROCEDURE)

1. **Quét thư mục đặc tả tổng quan**:
   - Mở và đọc file mô tả tính năng liên quan trong `docs/specs/`.
   - Nếu là tính năng liên quan tới hệ thống lớn, đọc các ADR trong `docs/adr/`.

2. **Quét vết thay đổi gần nhất (CRITICAL)**:
   - Đọc các file trong `docs/spec-changes/`.
   - Tìm các note mới nhất từ Q&A Jira, Slack sync, hay các buổi họp chốt spec với khách hàng/PO.
   - Trích xuất các điều chỉnh (nếu có) đè lên đặc tả gốc.

3. **Xác nhận Ngữ cảnh Dự án**:
   - Đọc `.agent/memory/context.md` để nắm rõ thuật ngữ chuyên ngành (Glossary) và các quy ước hiện tại của dự án.

4. **Tạo tóm tắt ngắn về Yêu cầu (Mental Model Verification)**:
   - Liệt kê 3-5 điểm mấu chốt của yêu cầu nghiệp vụ trước khi tiến hành bước tiếp theo.
