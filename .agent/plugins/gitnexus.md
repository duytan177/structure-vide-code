# GITNEXUS PLUGIN GUIDE (gitnexus.md)

**Priority level**: ⭐⭐⭐⭐⭐  
**Role**: Impact analysis (Blast Radius Analysis), Execution Flow, and deeper Dependency analysis than Graphify when performing refactors or working on complex systems.

---

## 🎯 KEY FEATURES
1. **Blast Radius Analysis**: Pinpoints with 100% accuracy the scope at risk of breaking code when changing the signature of a core function.
2. **Execution Flow Tracing**: Traces the execution flow from API route handler -> Service method -> Database Query -> Response Serializer.

---

## 📋 SAMPLE COMMANDS OR PROMPTS FOR THE AI AGENT
- `gitnexus analyze-impact --target="src/backend/services/PaymentService.ts#processRefund"`
- `gitnexus trace-flow --entry="POST /api/v1/orders"`

## 🛠️ INSTALL
- npm package **`gitnexus`** — run without global install via npx:
  ```bash
  npx gitnexus analyze      # index the current repo into a local knowledge graph (KuzuDB)
  # or global: npm install -g gitnexus
  ```
- Works with Claude Code / Cursor / Antigravity and any MCP-compatible tool.
