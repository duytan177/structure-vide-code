---
description: Gate for cross-consistency checks REQ↔SPEC↔ADR↔PLAN↔TASK before coding
argument-hint: [PROJECT-XXX | SPEC-XXX]
---

Run the **/analyze GATE** for: $ARGUMENTS following the skill `.claude/skills/analyze-consistency/SKILL.md`.

1. Read `docs/traceability-matrix.md` + the related REQ/SPEC/ADR/PLAN/TASK.
2. Check: coverage (nothing missed), traceability (IDs are real), content contradictions, violations of `docs/CONSTITUTION.md`.
3. Print a results table with 🔴 BLOCKER / 🟡 WARN levels + suggested fixes.
4. **GATE**: if any 🔴 remain → STOP, do not proceed to `/implement`. Go back to `/spec` or `/breakdown` to fix.

Run after `/breakdown`, before `/implement`.
