# VIDE-CODER — PLAN XÂY BASE QUY TRÌNH (Overlay, áp cho mọi dự án)

> **Vide-Coder KHÔNG phải một app.** Nó là **BASE / overlay quy trình** dùng lại, thả vào bất kỳ repo nào
> (dự án mới HOẶC dự án cũ đang maintain/phát triển tiếp) để **ép AI Agent làm việc theo 1 quy trình thống nhất**:
> `requirement → spec → design → implement → review → test → release`.
>
> **Nguyên tắc:**
> 1. Chỉ build **QUY TRÌNH** (bắt buộc). Skill/plugin dùng đồ **nổi tiếng có sẵn** (Superpowers, Graphify, GitNexus, Context7…) — **KHÔNG tự build lại**.
> 2. Base là **overlay thuần** — **không có `src/`**, không đụng source của dự án đích.
> 3. Skill/plugin tùy chỉnh riêng từng dự án → team tự add sau.
>
> Trạng thái: 🟡 Draft — chờ duyệt. Ngày: 2026-07-23. (Thay thế MIGRATION-PLAN.md đã xóa.)

---

## 1. ĐỊNH VỊ LẠI

| | Trước (hiểu sai) | Sau (đúng) |
|---|---|---|
| Bản chất | 1 app có FE/BE | **Base overlay quy trình** |
| `src/` | Có, ép cấu trúc | **Bỏ** — dự án đích tự có source |
| Skill | Tự viết/rebuild theo superpowers | **Cài Superpowers** làm engine, không rebuild |
| Vai trò Vide-Coder | Làm tất cả | Chỉ làm **tầng enterprise** + **ép quy trình** |

## 2. KIẾN TRÚC BASE SAU CHỈNH (overlay)

```text
<repo-bất-kỳ>/                      # dự án đích (mới hoặc cũ) — KHÔNG đụng source của họ
├── .agent/                         # ★ TẦNG QUY TRÌNH (core của base)
│   ├── rules/                      # 11 bước bắt buộc — SINGLE SOURCE OF TRUTH
│   ├── plugins/                    # KHAI BÁO plugin ngoài + installer (Superpowers, Graphify, GitNexus, Context7, Semgrep, Playwright, GitHub MCP)
│   ├── agents/  contexts/          # personas + modes
│   ├── memory/                     # bộ nhớ theo dự án (khởi tạo rỗng)
│   └── scripts/                    # install / verify / setup-hooks / onboard
├── docs/                           # ★ TẦNG TÀI LIỆU ENTERPRISE (templates + nơi chứa)
│   ├── client-requirements/ basic-design/ specs/ adr/ discovery/ spec-changes/
│   ├── DEFINITION-OF-DONE.md  traceability-matrix.md
├── plans/  tasks/                  # kế hoạch + Jira board
├── workspace/                      # ★ NƠI CHỨA SOURCE dự án (clone vào) — gitignore toàn bộ nội dung
│   └── <ten-du-an>/                # source thực tế (mới/cũ) — base KHÔNG track
├── CLAUDE.md AGENTS.md GEMINI.md   # ★ entry-points đa agent (pointer)
├── .cursor/ .windsurf/ .github/    # rules per-tool + CI + PR template + CODEOWNERS
└── .githooks/  .mcp.json           # git hooks + MCP config
```

**Việc cần làm:** **xóa `src/`** khỏi base; README nói rõ "base là overlay, source của dự án đích không bị đụng".

## 3. PHÂN VAI: SUPERPOWERS (engine) vs VIDE-CODER (enterprise)

Cài Superpowers làm engine → nó lo phần "làm 1 dev giỏi". Vide-Coder bọc phần doanh nghiệp lên trên.

| Bước Vide-Coder | Ai lo | Cơ chế |
|---|---|---|
| 1. Discovery | **Superpowers** `brainstorming` | + ghi vết `docs/discovery/` (Vide-Coder) |
| 2. Impact Analysis | **Vide-Coder** | gọi **Graphify/GitNexus** (plugin ngoài) |
| 3. Architecture (ADR/RFC) | **Vide-Coder** | template `docs/adr/` |
| 4. Specification | **Vide-Coder** | template `docs/specs/` (+ Context7 tra tài liệu) |
| 5. Planning | **Superpowers** `writing-plans` | + milestone/sprint |
| 6. Task Breakdown (Jira) | **Vide-Coder** | `tasks/` + traceability |
| 7. Implementation | **Superpowers** `using-git-worktrees` + `subagent-driven-development` | |
| 8. Self Validation | **Superpowers** `test-driven-development` + `verification-before-completion` | + typecheck/E2E |
| 9. AI Review | **Superpowers** `requesting/receiving-code-review` | + **Semgrep** + CodeRabbit (Vide-Coder gate bảo mật) |
| 10. Human Review | **Vide-Coder** | CODEOWNERS + PR template |
| 11. Knowledge Update | **Vide-Coder** | ADR + memory + re-index graph + changelog |

→ Vide-Coder **không viết lại** bước 1,5,7,8,9. Chỉ **điều phối** và **thêm** bước 2,3,4,6,10,11.

## 4. CƠ CHẾ "ÁP LÊN DỰ ÁN" — 2 CHẾ ĐỘ

Base phải chạy được cả dự án mới lẫn cũ → cần **1 lệnh cài + phát hiện chế độ**.

**Mode A — Dự án MỚI (greenfield):**
1. Copy overlay vào repo trống.
2. Chạy `install` → cài plugin (Superpowers/Graphify/…) + bật git hooks.
3. Bỏ requirement vào `docs/client-requirements/` → chạy quy trình từ Bước 1.

**Mode B — Dự án CŨ (brownfield / maintain):**
1. Copy overlay vào repo có sẵn (**không đụng source**).
2. Chạy `install` + **Bước 0 Onboarding**: index code cũ bằng **Graphify/GitNexus**, sinh **baseline** (spec/ADR tóm tắt hiện trạng vào `docs/specs/_baseline/`).
3. Mỗi change (bug/feature) = điểm vào Bước 1 dạng *change request* → Impact Analysis trên đồ thị code cũ → tiếp quy trình.

**Việc cần làm:**
- Thêm script `.agent/scripts/onboard-existing.sh` (index + sinh baseline).
- Sửa Bước 1 trong `00-ai-workflow.md`: điểm vào linh hoạt (BRD mới **hoặc** change request).
- Cập nhật `install-all-plugins.sh` để phát hiện repo mới/cũ.

## 5. DANH MỤC PLUGIN NGOÀI (khai báo dependency, cài per-agent)

| Plugin | Vai trò trong quy trình | Cách cài |
|---|---|---|
| **Superpowers** | Engine skill (brainstorm→plan→impl→test→review) | plugin marketplace / repo, cài **riêng từng agent** |
| **Graphify** | Bước 2 impact + Bước 11 re-index | CLI/MCP |
| **GitNexus** | Bước 2 blast radius / execution flow | CLI/MCP |
| **Context7** | Bước 4 tra tài liệu framework đúng version | MCP |
| **Semgrep** | Bước 9 security gate (OWASP) | CLI + CI |
| **Playwright MCP** | Bước 8 E2E | MCP |
| **GitHub MCP** | Bước 7/10 PR/branch | MCP |

**Việc cần làm:**
- `.agent/plugins/` chuyển từ "mô tả" → **khai báo dependency rõ ràng** (tên, cách cài cho từng agent, MCP config).
- Thêm `superpowers.md` (hiện chưa có mục Superpowers — đang có "Superpower code-graph" là thứ khác, cần làm rõ/tách).
- Token budgeting đã có — giữ.

## 6. CHECKLIST CHỈNH SỬA CỤ THỂ (so với hiện trạng)

- [ ] **Xóa `src/`** + sửa README (overlay, không đụng source dự án đích).
- [ ] Sửa `00-ai-workflow.md`: điểm vào Bước 1 linh hoạt (mới/cũ); ghi rõ bước nào do Superpowers lo.
- [ ] Thêm `.agent/scripts/onboard-existing.sh` (Mode B).
- [ ] Nâng `install-all-plugins.sh`: cài **Superpowers per-agent** + phát hiện mode + verify plugin thật tồn tại.
- [ ] Làm rõ danh mục plugin: tách/định danh **Superpowers** (methodology) vs "superpower code-graph".
- [ ] `docs/specs/_baseline/` cho brownfield.
- [ ] (Tùy chọn) 1 lệnh gọn `vide-coder apply` bọc toàn bộ install.

## 7. KHÔNG LÀM (để tránh lệch hướng lần nữa)
- ❌ Không rebuild skill theo format superpowers (dùng thẳng Superpowers).
- ❌ Không tạo skill/plugin tùy chỉnh cho dự án cụ thể (team tự add sau).
- ❌ Không ép cấu trúc `src/`.

## 8. RỦI RO / TREO
- Xác nhận **cách cài Superpowers** cho từng agent (marketplace vs repo) — mỗi agent khác nhau.
- Verify CLI `graphify`/`gitnexus` (+ package name thật) trước khi Bước 2 phụ thuộc.
- Brownfield: sinh baseline spec có thể tốn token với repo lớn → cần giới hạn phạm vi index.
