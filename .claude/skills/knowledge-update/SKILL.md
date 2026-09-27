---
name: knowledge-update
description: >
  Update knowledge after completion: ADR, memory, re-index graph, changelog, traceability. Use AFTER
  merge/task completion; or the user says "knowledge update", "update knowledge", "post-mortem", "changelog".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Knowledge Update (Step 11)

## 5 post-implementation steps
1. **Re-index** Graphify/GitNexus (ensure new imports/exports don't break links or create circular deps). Skip gracefully with an explicit note if either CLI isn't installed (`bash .agent/scripts/verify-plugins.sh`) — don't claim the graph is current if the command never ran.
2. **Blast radius verify**: compare before/after implementation to catch unexpected side-effects.
3. **Security/static**: `semgrep scan --config auto` + linter (0 warnings/errors). If Semgrep isn't installed, say so instead of reporting a clean scan.
4. **E2E**: Playwright verifies Acceptance Criteria, capture proof if there is UI.
5. **Update knowledge & task**: `.agent/memory/decision-log.md`, `docs/traceability-matrix.md`, changelog `docs/spec-changes/` (+ `CHANGELOG.md` if the base is touched); move task `in-progress/` → `completed/`; ready the PR.

Command `/knowledge-update`.
