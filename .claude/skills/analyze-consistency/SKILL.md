---
name: analyze-consistency
description: >
  GATE for cross-consistency review of REQ↔SPEC↔ADR↔PLAN↔TASK before coding. Use AFTER task breakdown,
  BEFORE implementation; or when the user says "analyze", "check consistency", "before coding".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Analyze — cross-consistency gate (Step 6.5)

Check against `docs/traceability-matrix.md`:
- **Coverage**: every REQ has a SPEC; every SPEC has a TASK; every AC has a task/test.
- **Traceability**: IDs in the matrix actually exist; in-progress tasks have a SPEC/PLAN backlink.
- **Conflicts**: SPEC vs ADR; PLAN scope creep; major decisions missing an ADR; violations of `docs/CONSTITUTION.md`.

## Result — table
| Level | ID | Issue | Recommendation |
| :-- | :-- | :-- | :-- |
| 🔴 BLOCKER | SPEC-102 | No task covers AC-3 | Create a task / add the AC |
| 🟡 WARN | PLAN | Mentions caching with no ADR | Write an ADR before coding |

**GATE**: any 🔴 BLOCKER remaining → STOP, go back to Spec/Plan/Breakdown; do not move to Step 7. Command `/analyze`.
