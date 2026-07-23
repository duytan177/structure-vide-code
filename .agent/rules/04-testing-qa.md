# TIÊU CHUẨN KIỂM THỬ VÀ ĐẢM BẢO CHẤT LƯỢNG (04-testing-qa.md)

Tài liệu này quy định quy trình kiểm thử tự động, quét bảo mật và kiểm thử E2E giao diện trước khi bàn giao code.

---

## 🧪 1. CÁC TẦNG KIỂM THỬ (TESTING PYRAMID)

1. **Unit Testing**:
   - Viết test cho tất cả Pure Functions, Utility Methods, Business Logic Services.
   - Target Coverage tối thiểu: 80%.
2. **Integration Testing**:
   - Kiểm thử kết nối giữa API Controller - Service - Database layer.
3. **End-to-End (E2E) Testing với Playwright MCP**:
   - Sử dụng **Playwright MCP** để giả lập hành vi người dùng trên giao diện web/app (Click, Type, Form Submit, Navigation).
   - Verify tất cả Acceptance Criteria (AC) của Jira task bằng E2E test scripts.

---

## 🛡️ 2. QUÉT BẢO MẬT & PHÂN TÍCH TĨNH (STATIC ANALYSIS & SECURITY SCAN)

Trước khi coi một task là hoàn thành (`completed`), AI Agent phải chạy các công cụ tĩnh:
- **Semgrep**: Quét lỗ hổng bảo mậtOWASP Top 10 (SQL Injection, XSS, Hardcoded Credentials, Insecure Deserialization).
- **Linter ngôn ngữ**:
  - JavaScript/TypeScript: `eslint .`
  - PHP: `vendor/bin/phpstan analyse` / `larastan`
  - Python: `flake8` / `black --check`
  - Ruby: `rubocop`

---

## ✅ 3. CHECKLIST KIỂM TRA TRƯỚC KHI TẠO PULL REQUEST (PR CHECKLIST)

- [ ] Code không còn warning hay error từ Linter.
- [ ] Chạy thành công Semgrep security scan không báo lỗi High/Critical.
- [ ] Tất cả Unit Tests & E2E Playwright Tests passed.
- [ ] Đã cập nhật tài liệu spec/ADR/memory nếu có thay đổi logic.
