---
description: Bước 8 — Self Validation (Lint + Typecheck + Unit + E2E)
---

Thực hiện **Bước 8 — SELF VALIDATION** cho thay đổi hiện tại.

1. Chạy Linter + Typecheck (theo stack trong `src/`).
2. Chạy Unit Test theo `.agent/skills/core/tdd-workflow.md` (coverage ≥ 80%).
3. Chạy E2E Playwright qua subagent `.agent/agents/e2e-runner.md` (nếu có UI), cover đủ Acceptance Criteria.
4. Nếu build lỗi → dùng `.agent/agents/build-error-resolver.md`.

Chỉ đi tiếp khi tất cả pass. Kết thúc: `/ai-review`.
