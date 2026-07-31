# VIDE-CODER — BASE QUY TRÌNH AI AGENT (Overlay)

**Vide-Coder KHÔNG phải một app.** Đây là **base / overlay quy trình** dùng lại, thả vào **bất kỳ repo nào**
(dự án mới **hoặc** dự án cũ đang maintain/phát triển tiếp) để **ép mọi AI Agent**
(Claude Code / Cursor / Codex / Antigravity / Windsurf / Copilot) làm việc theo **một quy trình thống nhất**:

> `requirement → spec → design → implement → review → test → release`

Skill/plugin dùng **đồ nổi tiếng có sẵn** (Superpowers, Graphify, GitNexus, Context7…) — base **không tự build lại**.
Skill/plugin tùy chỉnh cho từng dự án → team **tự add sau**. Chi tiết định hướng: [`docs/BASE-PLAN.md`](docs/BASE-PLAN.md).

---

## 📂 CẤU TRÚC BASE (chỉ là lớp phủ — KHÔNG đụng source dự án đích)

```text
<repo-bất-kỳ>/                    # dự án đích (mới/cũ) — source của họ giữ nguyên
├── .agent/                       # ★ TẦNG QUY TRÌNH (core của base)
│   ├── rules/                    # Quy tắc cốt lõi: 00-workflow (11 bước), code-style, git/jira, QA — SINGLE SOURCE OF TRUTH
│   ├── agents/                   # 🎭 Subagent personas (Architect, Planner, Security Reviewer, Build Error Resolver, E2E Runner)
│   ├── contexts/                 # ⚙️ Context modes (Dev / Review / Research)
│   ├── skills/                   # Skill dùng chung (core) + custom (dự án tự thêm sau)
│   ├── memory/                   # Bộ nhớ ngữ cảnh & nhật ký quyết định (khởi tạo rỗng theo dự án)
│   ├── plugins/                  # KHAI BÁO plugin ngoài + installer (Superpowers, Graphify, GitNexus, Context7, Semgrep, Playwright, GitHub MCP)
│   └── scripts/                  # install / verify / setup-hooks / onboard-existing
├── docs/                         # ★ TẦNG TÀI LIỆU ENTERPRISE (templates + nơi chứa)
│   ├── client-requirements/      # 📂 Yêu cầu gốc từ khách hàng (BRD, PDF, Word, MD)
│   ├── basic-design/             # 📂 File Excel (.xlsx) thiết kế cơ sở từ PO/BA
│   ├── specs/                    # Đặc tả theo màn hình (+ specs/_baseline/ cho dự án cũ)
│   ├── adr/                      # Architecture Decision Records + RFC
│   └── spec-changes/             # Lưu vết thay đổi spec (Q&A Jira, họp sync)
├── plans/                        # Implementation Plans
├── tasks/                        # Jira board (backlog / in-progress / completed)
├── workspace/                    # ★ NƠI CHỨA SOURCE dự án đích (clone vào đây) — gitignore toàn bộ nội dung
│   └── <ten-du-an>/              # source thực tế (mới/cũ) — base KHÔNG track
├── CLAUDE.md AGENTS.md GEMINI.md # ★ Entry-points đa agent (pointer về .agent/rules)
├── .cursor/ .windsurf/           # Rules + commands per-tool
├── .github/                      # CI + PR template + CODEOWNERS + copilot-instructions
└── .githooks/  .mcp.json         # Git hooks + MCP config
```

> ⚠️ Base **không có `src/` ở root**. Source dự án nằm trong **`workspace/<ten-du-an>/`** và bị **gitignore hoàn toàn** — base chỉ phủ tầng quy trình + tài liệu lên trên (xem [`workspace/README.md`](workspace/README.md)).

---

## 🚀 CÁCH ÁP BASE LÊN DỰ ÁN — 2 CHẾ ĐỘ

### Mode A — Dự án MỚI (greenfield)
1. Tạo source trong `workspace/<ten-du-an>/` (base overlay đã sẵn ở root).
2. `bash .agent/scripts/install-all-plugins.sh` (tự phát hiện mode) + `bash .agent/scripts/setup-hooks.sh`.
3. Bỏ yêu cầu vào `docs/client-requirements/` (và Excel vào `docs/basic-design/`) → chạy quy trình từ **Bước 1**.

### Mode B — Dự án CŨ (brownfield / maintain / phát triển tiếp)
1. Clone source vào workspace: `git clone <repo-url> workspace/<ten-du-an>` — **không đụng source của họ**.
2. `bash .agent/scripts/install-all-plugins.sh` + `bash .agent/scripts/setup-hooks.sh`.
3. **Bước 0 Onboarding**: `bash .agent/scripts/onboard-existing.sh workspace/<ten-du-an>` → index code cũ (Graphify/GitNexus) và sinh baseline vào `docs/specs/_baseline/`.
4. Mỗi change (bug/feature) = điểm vào **Bước 1** dạng *change request* → Impact Analysis trên đồ thị code cũ → tiếp quy trình.

---

## 🤖 KÍCH HOẠT ĐA AI AGENT

Quy trình viết **một lần** trong `.agent/`; mỗi tool đọc qua entry-point riêng (đều là *pointer* trỏ về `.agent/rules/00-ai-workflow.md`):

| Tool | Entry-point | MCP config |
| :--- | :--- | :--- |
| Claude Code | `CLAUDE.md` + `.claude/commands/` | `.mcp.json` |
| Cursor | `.cursor/rules/00-workflow.mdc` + `.cursor/commands/` | `.cursor/mcp.json` |
| Codex / Antigravity / Gemini CLI | `AGENTS.md` (chuẩn agents.md) | `AGENTS.md` |
| Windsurf | `.windsurf/rules/workflow.md` | — |
| GitHub Copilot | `.github/copilot-instructions.md` | — |

→ Sửa quy trình chỉ cần sửa `.agent/rules/`, mọi tool tự cập nhật theo.

## ⚙️ SETUP LẦN ĐẦU

```bash
bash .agent/scripts/init.sh                            # BOOTSTRAP 1 phát: hooks + plugin + detect mode
# (hoặc chạy tay từng bước:)
# bash .agent/scripts/setup-hooks.sh
# bash .agent/scripts/install-all-plugins.sh
# bash .agent/scripts/onboard-existing.sh workspace/<ten-du-an>   # CHỈ dự án cũ
# bash .agent/scripts/verify-plugins.sh
```

- **11 bước & phân vai Superpowers**: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md).
- **Slash-command**: `/discovery` → `/clarify` → `/impact` → `/architecture` → `/spec` → `/plan` → `/breakdown` → `/analyze` (gate) → `/implement` → `/validate` → `/ai-review` → (Human Review) → `/knowledge-update`. Commit: `/commit`.
- **Hiến pháp dự án**: [`docs/CONSTITUTION.md`](docs/CONSTITUTION.md) (ràng buộc bất biến per-project; `/analyze` chặn nếu vi phạm).
- **Definition of Done**: [`docs/DEFINITION-OF-DONE.md`](docs/DEFINITION-OF-DONE.md).
- **Truy vết**: [`docs/traceability-matrix.md`](docs/traceability-matrix.md) (REQ→SPEC→PLAN→TASK→PR).
- **Template override per-project**: [`.agent/templates/`](.agent/templates/README.md).
- **CI**: `.github/workflows/ci.yml` tự chạy Bước 8-9 trên mỗi PR. Version base: [`VERSION`](VERSION) · [`CHANGELOG.md`](CHANGELOG.md).
