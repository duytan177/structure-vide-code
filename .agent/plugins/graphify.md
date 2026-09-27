# GRAPHIFY PLUGIN GUIDE (graphify.md)

**Priority level**: ⭐⭐⭐⭐⭐  
**Role**: Builds a Knowledge Graph for the codebase, helping the AI understand the relationship diagram between modules, classes, functions, and components in `src/`.

---

## 🎯 KEY FEATURES
1. **Knowledge Graph Generation**: Creates a knowledge-linkage graph between files in `src/frontend`, `src/backend`, and `src/shared`.
2. **Context Querying**: Quickly looks up where an entity (Model/Service/Component) is imported and used across the entire project.

---

## 📋 SAMPLE COMMANDS OR PROMPTS FOR THE AI AGENT
- `graphify query "UserAuthenticationService"` -> Returns all controllers, middleware, and UI components calling this service.
- `graphify update . --force` -> Rebuilds the Knowledge Graph after creating many new files (the real 0.9.x CLI has no separate `rebuild` verb — `update` both creates and refreshes the graph; `--force` forces a full rebuild).
- Prefer the base's own wrapper over calling the CLI by hand: `bash .agent/scripts/graphify-setup.sh` (first index), `--action rebuild` (force full rebuild), `--action sync` (git pull + rebuild) — see that script for the exact verbs it invokes (override via `GRAPHIFY_UPDATE_CMD` if your build differs).

## 🛠️ INSTALL
- PyPI package is **`graphifyy`**; the CLI command stays **`graphify`**:
  ```bash
  pip install graphifyy
  ```
- Works with Claude Code / Cursor / Antigravity (skill `/graphify`). Repo: https://github.com/Graphify-Labs/graphify
