---
name: impact-analysis
description: >
  Analyze blast radius & dependencies before modifying code (Graphify/GitNexus). Use WHEN about to modify code
  that touches shared modules, refactor, change a dependency; or the user says "impact", "blast radius".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Impact Analysis (Step 2)

Prevent "fix one thing, break another" in a multi-module system.

## Workflow
1. **Graphify — query the Knowledge Graph**: find modules that depend directly & indirectly on the file/function to be changed.
2. **GitNexus — blast radius**: analyze the execution flow (FE→BE→DB), list every affected function/class.
3. **Regression scope**: note high-risk areas to add tests (Playwright/Unit) in Step 8.

**HARD-GATE**: blast radius not fully listed → do not code. Command `/impact`.
