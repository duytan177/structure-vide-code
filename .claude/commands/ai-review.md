---
description: Bước 9 — AI Review (Code + Security + Performance + Architecture)
---

Thực hiện **Bước 9 — AI REVIEW** cho thay đổi hiện tại.

1. Security scan: subagent `.agent/agents/security-reviewer.md` + Semgrep (OWASP Top 10). Không được còn High/Critical.
2. Code review: skill `.agent/skills/core/code-review.md` (+ CodeRabbit trên PR).
3. Rà soát performance & tuân thủ kiến trúc (`02-architecture-principles.md`).
4. Xử lý mọi finding quan trọng trước khi mở PR.

Kết thúc: mở PR (dùng `.github/pull_request_template.md`) → Bước 10 Human Review → sau merge chạy `/knowledge-update`.
