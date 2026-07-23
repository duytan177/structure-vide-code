# SKILL CÓ SẴN: CODE REVIEW VÀ KIỂM TRA CHẤT LƯỢNG TỰ ĐỘNG (code-review.md)

Skill này hướng dẫn AI Agent thực hiện tự review code và chạy kiểm tra chất lượng trước khi nộp PR.

---

## 🎯 MỤC TIÊU SKILL
Đảm bảo mã nguồn đẩy lên luôn đạt chuẩn Clean Code, bảo mật và không bị lỗi cú pháp/logic cơ bản.

---

## 📋 CHECKS RỦI RO CẦN KIỂM TRA (CHECKLIST)

1. **Security & Vulnerabilities (Semgrep)**:
   - Có hardcoded secret/API key trong code không?
   - Có lỗ hổng SQL Injection, XSS, CSRF không?
2. **Code Smells & Refactoring (CodeRabbit Alignment)**:
   - Có hàm nào quá 50 dòng không?
   - Có code trùng lặp có thể đưa vào `src/shared/` không?
3. **Typing & Static Analysis**:
   - Có dùng `any` bừa bãi trong TypeScript không?
   - Chạy linter tương ứng (ESLint, PHPStan, RuboCop...) có qua 100% không?
4. **Git Hygiene**:
   - Commit message có đúng chuẩn Conventional Commits kèm Jira Ticket ID không?
