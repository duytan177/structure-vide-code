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
- `graphify rebuild` -> Rebuilds the Knowledge Graph after creating many new files.

## 🛠️ INSTALL
- PyPI package is **`graphifyy`**; the CLI command stays **`graphify`**:
  ```bash
  pip install graphifyy
  ```
- Works with Claude Code / Cursor / Antigravity (skill `/graphify`). Repo: https://github.com/Graphify-Labs/graphify
