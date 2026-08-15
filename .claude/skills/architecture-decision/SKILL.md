---
name: architecture-decision
description: >
  Make architecture decisions & write ADR/RFC for major changes (switching DB, adding caching, changing auth, core lib).
  Use WHEN designing/reviewing architecture, or the user says "architecture", "ADR", "RFC", "system design".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Architecture Decision (Step 3)

For a major change: write an RFC (`docs/adr/rfc-template.md`) then finalize an ADR (`docs/adr/adr-template.md`) covering Context/Options/Decision/Consequences; register it in `.agent/memory/decision-log.md`.
Ensure compliance with SOLID/Clean Architecture (rule 02) and no breach of `docs/CONSTITUTION.md`.

Persona: [`architect.md`](../../../.agent/agents/architect.md). Command `/architecture`.
