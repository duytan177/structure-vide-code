# PLUGIN MATRIX AND CONTEXT WINDOW BUDGETING MANAGEMENT (README.md)

This document consolidates the matrix of 14 extension Plugins/MCPs and the mandatory **Context Window Management Rules (Token Budgeting)** for the AI Agent.

---

## ⚡ GOLDEN RULE: TOKEN CONTEXT BUDGETING

> [!WARNING]
> Enabling too many MCP Servers at once will cause the Context Window capacity (200k tokens) to collapse disastrously to just 70k tokens, making the AI Agent quickly forget the project context!

1. **Limit the number of active MCPs**: Keep at most **< 10 MCP Servers** enabled simultaneously in a single project.
2. **Enable MCPs per Phase**:
   - **Research Phase**: Enable only `Filesystem MCP`, `Context7 MCP`, `Database MCP`.
   - **Coding Phase (BE)**: Enable only `Filesystem MCP`, `Semgrep`.
   - **FE/UI Phase**: Enable only `Figma MCP`, `shadcn/ui MCP`, `Magic MCP`, `Filesystem MCP` (disable when FE is done).
   - **E2E Testing & PR Phase**: Enable only `Playwright MCP`, `GitHub MCP`.

---

## 📊 THE 14 STRATEGIC PLUGIN MATRIX

| Priority Level | Plugin / MCP | Role & Core Function | Detailed Guide File |
| :---: | :--- | :--- | :--- |
| ⭐⭐⭐⭐⭐ | **Superpowers** (methodology) | **Skill/workflow engine** (brainstorm→plan→impl→TDD→review). Vide-Coder uses it directly, does NOT rebuild it. | [`superpowers.md`](superpowers.md) |
| ⭐⭐⭐⭐⭐ | **Graphify** | Builds a Knowledge Graph of the codebase, helping the AI understand the graph relationships between modules. | [`graphify.md`](graphify.md) |
| ⭐⭐⭐⭐⭐ | **GitNexus** | Analyzes blast radius (impact scope), execution flow, and deep dependencies when refactoring. | [`gitnexus.md`](gitnexus.md) |
| ⭐⭐⭐⭐☆ | **Superpower** (code-graph) | High-speed Code Graph indexing (medium/large codebases). ⚠️ OPTIONAL — package name unverified; prefer Graphify/GitNexus. DIFFERENT from *Superpowers* methodology above. | [`superpower.md`](superpower.md) |
| ⭐⭐⭐⭐⭐ | **Playwright MCP** | Automates E2E testing of web/mobile interfaces after a task is completed. | [`mcp-tools.md`](mcp-tools.md) |
| ⭐⭐⭐⭐⭐ | **GitHub MCP** | Manages Git branches/worktrees, commits, opening PRs, code review, and automatic issue creation. | [`mcp-tools.md`](mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Context7 MCP** | Looks up the standard documentation of a framework/library at the correct version, right inside the agent. | [`mcp-tools.md`](mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Filesystem MCP** | Reads/writes files safely with a clear permission structure. | [`mcp-tools.md`](mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Database MCP (PostgreSQL/MySQL)** | Analyzes the DB schema, checks migrations, and runs safe queries when needed. | [`mcp-tools.md`](mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Semgrep** | Security scan that detects OWASP vulnerabilities and bugs based on a custom ruleset. | [`static-analysis.md`](static-analysis.md) |
| ⭐⭐⭐⭐☆ | **CodeRabbit** | AI PR Reviewer that automatically scans for code smells, comments on PRs, and suggests optimizations. | [`static-analysis.md`](static-analysis.md) |
| ⭐⭐⭐⭐⭐ | **Figma MCP** | Design-to-code: extracts design context, tokens (variables), screenshots, and Code Connect for beautiful FE. | [`figma.md`](figma.md) |
| ⭐⭐⭐⭐☆ | **shadcn/ui MCP** | Registry of beautiful, accessible components (Radix + Tailwind) for adding/keeping UI consistent. | [`figma.md`](figma.md) |
| ⭐⭐⭐⭐☆ | **Magic MCP (21st.dev)** | Generates beautiful UI components/sections from a description → inspiration for the `ui-ux-promax` polish. | [`figma.md`](figma.md) |
