---
description: Step 3 — Architecture (ADR / RFC / Decisions)
argument-hint: [architecture decision topic]
---

Perform **Step 3 — ARCHITECTURE** for: $ARGUMENTS

1. Dispatch persona `architect` — Claude Code: Task/Agent tool subagent_type `architect` (`.claude/agents/architect.md`); Cursor/Antigravity: read `.agent/agents/architect.md` and role-play it.
2. Evaluate SOLID / Clean Architecture per `.agent/rules/02-architecture-principles.md`.
3. If discussion is needed first → write an RFC following `docs/adr/rfc-template.md`.
4. Once decided → create an ADR `docs/adr/yyyy-mm-dd-<title>.md` following `docs/adr/adr-template.md`.
5. Register it in `.agent/memory/decision-log.md`.

Wrap-up: `/spec`.
