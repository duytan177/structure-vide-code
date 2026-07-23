`# VIDE-CODER ENTERPRISE PROJECT STRUCTURE

Dự án này được thiết kế và cấu trúc chuẩn hóa cho quy trình phát triển phần mềm kết hợp giữa lập trình viên và **AI Agent** (Vide-coder / Antigravity / Cursor / Claude Code / Windsurf).

---

## 📂 SƠ ĐỒ CẤU TRÚC DỰ ÁN

```text
Vide-code/
├── .agent/                             # Quản lý AI Agent Workflow & Tools
│   ├── agents/                         # 🎭 SUBAGENT PERSONAS (Architect, Planner, Security Reviewer, Build Error Resolver, E2E Runner)
│   ├── contexts/                       # ⚙️ CONTEXT MODES (Dev Mode, Review Mode, Research Mode)
│   ├── rules/                          # Bộ quy tắc cốt lõi của AI Agent (Workflow, Code style, Git/Jira, QA)
│   ├── skills/                         # Kỹ năng AI (Core skills dùng chung & Custom skills dự án)
│   │   ├── core/                       # Core skills (Read spec, Parse Client Requirements, Parse Excel Basic Design, TDD...)
│   │   └── custom/                     # Custom skills đặc thù dự án
│   ├── memory/                         # Bộ nhớ ngữ cảnh lâu dài & Nhật ký quyết định kiến trúc
│   └── plugins/                        # Hướng dẫn & Cấu hình 10 Plugins/MCP (Graphify, GitNexus, Superpower, MCPs...)
│       └── installer/                  # Script & templates tự động cài đặt trọn gói Plugin
├── docs/                               # Tài liệu hệ thống
│   ├── client-requirements/            # 📂 TÀI LIỆU YÊU CẦU BAN ĐẦU TỪ KHÁCH HÀNG (BRD, PDF, Word, MD)
│   ├── basic-design/                   # 📂 File Excel (.xlsx) thiết kế cơ sở từ PO/BA/Khách hàng
│   ├── specs/                          # Đặc tả tính năng Markdown theo từng màn hình
│   ├── adr/                            # Architecture Decision Records (ADR)
│   └── spec-changes/                   # Lưu vết thay đổi spec từ Q&A Jira, Họp Sync
├── plans/                              # Kế hoạch triển khai tính năng lớn (Implementation Plans)
├── tasks/                              # Công việc nhỏ phân rã theo chuẩn Jira Backlog
│   ├── backlog/                        # Task chờ thực hiện
│   ├── in-progress/                    # Task đang thực hiện
│   └── completed/                      # Task đã hoàn thành
└── src/                                # 🚀 TẤT CẢ SOURCE CODE (FE, BE, SHARED)
    ├── frontend/                       # Frontend app (UI, Web/Mobile)
    ├── backend/                        # Backend app (APIs, Services, DB)
    └── shared/                         # Common Types, DTOs, Helpers
```

---

## ⚡ HƯỚNG DẪN BẮT ĐẦU CHO TEAM VÀ AI AGENT

Khi khởi tạo một dự án mới:

1. **Đưa Tài Liệu Yêu Cầu Gốc Vào Thư Mục Input**: 
   - Thêm tài liệu yêu cầu của khách hàng vào `docs/client-requirements/`.
   - Thêm các file Excel thiết kế cơ sở (`.xlsx`) vào `docs/basic-design/`.
2. **Ra lệnh cho AI Agent Khởi Tạo Specs & Tasks**:
   > *"AI Agent hãy đọc tài liệu trong docs/client-requirements/ và docs/basic-design/ để khởi tạo các đặc tả trong docs/specs/ cùng Jira tasks ban đầu trong tasks/backlog/"*
3. **Quy trình làm việc chuẩn**: AI Agent tuân thủ quy trình trong [`.agent/rules/00-ai-workflow.md`](file:///home/duytan/Tan/Coder/Vide-code/.agent/rules/00-ai-workflow.md).
