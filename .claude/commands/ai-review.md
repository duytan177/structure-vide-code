---
description: Step 9 — AI Review (Code + Security + Performance + Architecture)
---

Perform **Step 9 — AI REVIEW** for the current change.

1. Security scan: subagent `.agent/agents/security-reviewer.md` + Semgrep (OWASP Top 10). No High/Critical findings may remain.
2. Code review: skill `.claude/skills/code-review/SKILL.md` (+ CodeRabbit on the PR).
3. Review performance & architecture compliance (`02-architecture-principles.md`).
4. Resolve every important finding before opening the PR.

Wrap-up: open the PR (use `.github/pull_request_template.md`) → Step 10 Human Review → after merge run `/knowledge-update`.
