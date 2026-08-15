---
name: discovery-brainstorm
description: >
  Discovery — challenge & clarify requirements through Q&A before design (using Superpowers brainstorming).
  Use WHEN starting any feature/change, or the user says "start", "requirement", "brainstorm", "discovery".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Discovery (Step 1)

Clarify ambiguities, ask critical technical/business questions, and synthesize research before Impact Analysis & Architecture.

## Workflow
1. **Gather**: read `docs/client-requirements/` + `docs/basic-design/` (new project) or the change request + `docs/specs/_baseline/` (existing project).
2. **Socratic Q&A**: list edge cases, security risks, gaps in business logic. Use the Superpowers `brainstorming` skill.
3. **Research**: find the optimal solution/library/algorithm (Context7 when needed).
4. **Produce document**: `docs/discovery/discovery-YYYYMMDD-<feature>.md`.

**HARD-GATE**: design not finalized / user not approved → do not move to Spec/Code. Next: `/clarify`. Command `/discovery`.
