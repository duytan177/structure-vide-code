---
description: Clarify ambiguous requirements before writing the Spec (Step 1.5)
argument-hint: [feature | REQ-XXX]
---

Run **/clarify** for: $ARGUMENTS following the skill `.claude/skills/clarify-requirements/SKILL.md`.

1. Read `docs/discovery/` + `docs/client-requirements/` (+ `docs/specs/_baseline/` if brownfield).
2. Draft structured questions, prioritize blockers; ask as multiple-choice / with proposed defaults.
3. Record answers + assumptions in `docs/discovery/<feature>-clarifications.md`.
4. New invariant constraints → update `docs/CONSTITUTION.md`.

Position: after `/discovery`, before `/spec`. Exit when there are no blocker questions left.
