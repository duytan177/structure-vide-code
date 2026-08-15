# /analyze — Cross-consistency gate (before Implementation)

Check **REQ↔SPEC↔ADR↔PLAN↔TASK** consistency according to `.claude/skills/analyze-consistency/SKILL.md`.

- Sources: `docs/traceability-matrix.md` + the REQ/SPEC/ADR/PLAN/TASK files.
- Checks: coverage (nothing missing), IDs actually exist, content contradictions, violations of `docs/CONSTITUTION.md`.
- GATE: if any 🔴 BLOCKER remains → STOP, do not proceed to `/implement`.
- Position: after `/breakdown`, before `/implement`.
