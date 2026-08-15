---
name: code-review
description: >
  AI review trước PR: security (Semgrep/OWASP), code smells, typing, git hygiene, kiến trúc. Dùng SAU
  self-validation, TRƯỚC human review; hoặc khi user nói "review", "kiểm tra code", "trước khi PR".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# AI Review (Bước 9)

Two-stage (học Superpowers `requesting/receiving-code-review`): (1) spec-compliance → code đúng plan/spec; (2) code-quality.

## Checklist
1. **Security (Semgrep/OWASP)**: không secret hardcode; không SQLi/XSS/CSRF; High/Critical = 0.
2. **Code smell**: không hàm >50 dòng; trùng lặp đưa về shared.
3. **Typing/static**: không `any` bừa; linter (ESLint/PHPStan/RuboCop) pass 100%.
4. **Git hygiene**: commit chuẩn Conventional + Jira ID (skill `semantic-commit`).

**HARD-GATE**: còn High/Critical → không mở PR. Persona `security-reviewer`. Command `/ai-review`.
