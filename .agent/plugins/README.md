# MA TRẬN PLUGIN VÀ QUẢN LÝ CONTEXT WINDOW BUDGETING (README.md)

Tài liệu này tổng hợp ma trận 10 Plugin/MCP mở rộng và **Quy tắc Quản lý Context Window (Token Budgeting)** bắt buộc cho AI Agent.

---

## ⚡ QUY TẮC NGUYÊN TẮC VÀNG: TOKEN CONTEXT BUDGETING

> [!WARNING]
> Kích hoạt quá nhiều MCP Server cùng lúc sẽ làm dung lượng Context Window (200k tokens) bị sụt giảm thảm hại xuống chỉ còn 70k tokens, khiến AI Agent mau bị quên ngữ cảnh dự án!

1. **Giới hạn số MCPs hoạt động**: Chỉ giữ tối đa **< 10 MCP Servers** được bật đồng thời trong một dự án.
2. **Kích hoạt MCP theo Phase**:
   - **Pha Nghiên cứu**: Chỉ bật `Filesystem MCP`, `Context7 MCP`, `Database MCP`.
   - **Pha Lập trình**: Chỉ bật `Filesystem MCP`, `Semgrep`.
   - **Pha E2E Testing & PR**: Chỉ bật `Playwright MCP`, `GitHub MCP`.

---

## 📊 MA TRẬN 10 PLUGIN CHIẾN LƯỢC

| Mức Ưu Tiên | Plugin / MCP | Vai Trò & Chức Năng Chính | File Hướng Dẫn Chi Tiết |
| :---: | :--- | :--- | :--- |
| ⭐⭐⭐⭐⭐ | **Superpowers** (methodology) | **Engine skill/quy trình** (brainstorm→plan→impl→TDD→review). Vide-Coder dùng thẳng, KHÔNG rebuild. | [`superpowers.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/superpowers.md) |
| ⭐⭐⭐⭐⭐ | **Graphify** | Xây dựng Knowledge Graph của codebase, giúp AI hiểu mối quan hệ đồ thị giữa các module. | [`graphify.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/graphify.md) |
| ⭐⭐⭐⭐⭐ | **GitNexus** | Phân tích blast radius (phạm vi ảnh hưởng), execution flow và dependency sâu khi refactor. | [`gitnexus.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/gitnexus.md) |
| ⭐⭐⭐⭐☆ | **Superpower** (code-graph) | Code Graph indexing tốc độ cao cho codebase vừa và lớn. ⚠️ KHÁC với *Superpowers* methodology ở trên. | [`superpower.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/superpower.md) |
| ⭐⭐⭐⭐⭐ | **Playwright MCP** | Tự động hóa kiểm thử E2E giao diện web/mobile sau khi hoàn thành task. | [`mcp-tools.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/mcp-tools.md) |
| ⭐⭐⭐⭐⭐ | **GitHub MCP** | Quản lý Git branch/worktree, commit, mở PR, review code, tạo issue tự động. | [`mcp-tools.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Context7 MCP** | Tra cứu tài liệu chuẩn (documentation) của framework/library đúng phiên bản ngay trong agent. | [`mcp-tools.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Filesystem MCP** | Đọc/ghi file an toàn và có cấu trúc phân quyền rõ ràng. | [`mcp-tools.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Database MCP (PostgreSQL/MySQL)** | Phân tích DB schema, kiểm tra migrations, chạy truy vấn an toàn khi cần. | [`mcp-tools.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/mcp-tools.md) |
| ⭐⭐⭐⭐☆ | **Semgrep** | Security scan quét lỗ hổng bảo mật OWASP và bug theo ruleset tự định nghĩa. | [`static-analysis.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/static-analysis.md) |
| ⭐⭐⭐⭐☆ | **CodeRabbit** | AI PR Reviewer tự động quét code smells, nhận xét PR và đề xuất tối ưu hóa. | [`static-analysis.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/plugins/static-analysis.md) |
