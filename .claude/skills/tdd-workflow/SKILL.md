---
name: tdd-workflow
description: >
  Self-validation kiểu TDD RED-GREEN-REFACTOR + lint/typecheck/E2E (dùng Superpowers TDD). Dùng KHI
  viết code/test, self-validate; hoặc user nói "test", "TDD", "kiểm thử", "validate", "coverage".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Self Validation (Bước 8)

Dùng Superpowers `test-driven-development` + `verification-before-completion`.

## Chu trình RED → GREEN → REFACTOR
1. **Định nghĩa** Interface/DTO khung trong source dự án.
2. **RED**: viết unit test mô tả hành vi kỳ vọng → chạy, đảm bảo THẤT BẠI.
3. **GREEN**: viết code tối thiểu để test PASS.
4. **REFACTOR**: dọn code (clean, xóa trùng) mà test vẫn xanh 100%.
5. **VERIFY**: coverage ≥80%; chạy linter + typecheck + Playwright E2E verify Acceptance Criteria.

**HARD-GATE**: test chưa xanh hoặc coverage <80% → không sang AI Review. Command `/validate`.
