# HƯỚNG DẪN STATIC ANALYSIS & SECURITY TOOLS (static-analysis.md)

Tài liệu này chi tiết hóa tích hợp Semgrep, CodeRabbit và các Linter phân tích tĩnh theo ngôn ngữ lập trình.

---

## 🔒 1. Semgrep (Security & Vulnerability Scanner) (⭐ ⭐ ⭐ ⭐ ☆)
- **Vai trò**: Quét mã nguồn trong `src/` để phát hiện lỗ hổng bảo mật (SQL Injection, XSS, Hardcoded Tokens, Weak Cryptography).
- **Lệnh thực thi**:
  - `semgrep scan --config auto src/`

---

## 🔍 2. Language Linters & Static Analyzers (⭐ ⭐ ⭐ ⭐ ☆)
Phân tích cú pháp và quy chuẩn code theo ngôn ngữ:
- **TypeScript / JavaScript**: `npx eslint src/`
- **PHP / Laravel**: `vendor/bin/phpstan analyse src/backend`
- **Ruby**: `bundle exec rubocop src/`
- **Python**: `mypy src/` & `flake8 src/`

---

## 🐇 3. CodeRabbit (AI Code Reviewer) (⭐ ⭐ ⭐ ⭐ ☆)
- **Vai trò**: Tự động review Pull Request trên GitHub, phát hiện code smell, vi phạm DRY/SOLID và đưa ra gợi ý refactor chuyên sâu.
- **Workflow**: Đã được tích hợp sẵn qua GitHub Webhook / Action khi GitHub MCP mở PR.
