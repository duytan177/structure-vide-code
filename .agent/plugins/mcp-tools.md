# TỔNG HỢP HƯỚNG DẪN MCP TOOLS (mcp-tools.md)

Tài liệu này hướng dẫn cấu hình và sử dụng 5 công cụ Model Context Protocol (MCP) chiến lược trong dự án.

---

## 🎭 1. Playwright MCP (⭐ ⭐ ⭐ ⭐ ⭐)
- **Mục đích**: Tự động kiểm thử E2E giao diện người dùng và API sau khi hoàn thành code.
- **Cách dùng trong Agent**:
  - `playwright_navigate(url="http://localhost:3000/login")`
  - `playwright_click(selector="#btn-submit")`
  - `playwright_screenshot(path="artifacts/login_test.png")`

---

## 🐙 2. GitHub MCP (⭐ ⭐ ⭐ ⭐ ⭐)
- **Mục đích**: Quản lý repository, tự động tạo branch, commit, push, mở Pull Request và sync Jira Ticket.
- **Cách dùng trong Agent**:
  - `github_create_branch(branch_name="feature/PROJECT-102-auth-flow")`
  - `github_create_pull_request(title="feat(auth): PROJECT-102 Auth flow implementation", base="main")`

---

## 📚 3. Context7 MCP (⭐ ⭐ ⭐ ⭐ ☆)
- **Mục đích**: Tra cứu tài liệu framework/library chính xác theo đúng version đang sử dụng mà không lo AI bị outdated knowledge.
- **Cách dùng trong Agent**:
  - `context7_fetch_docs(library="nextjs", version="14.2", query="App Router Server Actions")`

---

## 💾 4. Database MCP - PostgreSQL/MySQL (⭐ ⭐ ⭐ ⭐ ☆)
- **Mục đích**: Phân tích DB Schema, kiểm tra migration status và thực thi test query an toàn.
- **Cách dùng trong Agent**:
  - `db_describe_table(table_name="users")`
  - `db_run_readonly_query(sql="SELECT COUNT(*) FROM orders WHERE status = 'PENDING'")`

---

## 📁 5. Filesystem MCP (⭐ ⭐ ⭐ ⭐ ☆)
- **Mục đích**: Đọc/ghi file an toàn và có cấu trúc phân quyền rõ ràng trong workspace.
