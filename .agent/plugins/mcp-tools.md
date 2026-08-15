# MCP TOOLS GUIDE SUMMARY (mcp-tools.md)

This document explains how to configure and use the 5 strategic Model Context Protocol (MCP) tools in the project.

---

## 🎭 1. Playwright MCP (⭐ ⭐ ⭐ ⭐ ⭐)
- **Purpose**: Automatically E2E test the user interface and API after completing code.
- **Usage in the Agent**:
  - `playwright_navigate(url="http://localhost:3000/login")`
  - `playwright_click(selector="#btn-submit")`
  - `playwright_screenshot(path="artifacts/login_test.png")`

---

## 🐙 2. GitHub MCP (⭐ ⭐ ⭐ ⭐ ⭐)
- **Purpose**: Manages the repository, automatically creating branches, commits, pushes, opening Pull Requests, and syncing Jira Tickets.
- **Usage in the Agent**:
  - `github_create_branch(branch_name="feature/PROJECT-102-auth-flow")`
  - `github_create_pull_request(title="feat(auth): PROJECT-102 Auth flow implementation", base="main")`

---

## 📚 3. Context7 MCP (⭐ ⭐ ⭐ ⭐ ☆)
- **Purpose**: Looks up framework/library documentation accurately at the exact version in use, without worrying about the AI having outdated knowledge.
- **Usage in the Agent**:
  - `context7_fetch_docs(library="nextjs", version="14.2", query="App Router Server Actions")`

---

## 💾 4. Database MCP - PostgreSQL/MySQL (⭐ ⭐ ⭐ ⭐ ☆)
- **Purpose**: Analyzes the DB Schema, checks migration status, and executes safe test queries.
- **Usage in the Agent**:
  - `db_describe_table(table_name="users")`
  - `db_run_readonly_query(sql="SELECT COUNT(*) FROM orders WHERE status = 'PENDING'")`

---

## 📁 5. Filesystem MCP (⭐ ⭐ ⭐ ⭐ ☆)
- **Purpose**: Reads/writes files safely with a clear permission structure in the workspace.
