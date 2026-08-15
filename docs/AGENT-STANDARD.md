# AGENT STANDARD — Chuẩn hóa đa-agent (Claude / Cursor / Antigravity / Codex)

> Chuẩn hóa toàn bộ base theo **Agent Skills open standard** (agentskills.io) — nguồn cộng đồng nhiều sao:
> [everything-claude-code](https://github.com/alphachoi/everything-claude-code) (~100K★), [anthropics/skills](https://github.com/anthropics/skills),
> [superpowers](https://github.com/obra/superpowers), [frontend-design](https://github.com/anthropics/claude-code).
>
> **Nguyên tắc:** viết skill **1 lần** theo chuẩn `SKILL.md`, chạy **không đổi** trên mọi agent.

---

## 1. CHUẨN `SKILL.md` (bắt buộc)

Mỗi skill = **1 folder + `SKILL.md`** có YAML frontmatter:
```yaml
---
name: ten-skill-kebab-case        # ≤64 ký tự, [a-z0-9-], = tên folder
description: Làm GÌ + KHI NÀO dùng, kèm keyword để agent tự trigger.   # ≤1024 ký tự
license: MIT                       # optional
metadata: { author: vide-coder, version: "1.0" }   # optional
---
# Nội dung hướng dẫn (≤500 dòng; tách chi tiết sang references/)
```
- `description` phải nêu **khi nào dùng** + keyword (đây là thứ khiến skill tự kích hoạt).
- Body <5000 tokens; tài nguyên nặng để trong `references/`, `scripts/`, `assets/`.

## 2. NƠI ĐẶT SKILL & DISCOVERY THEO TOOL

| Agent | Đọc skill ở | Entry-point |
| :-- | :-- | :-- |
| Claude Code | `.claude/skills/<name>/SKILL.md` | `CLAUDE.md` |
| Codex | `.agents/skills/<name>/SKILL.md` (quét cwd→root) | `AGENTS.md` |
| Antigravity | `.agents/skills/` (+ AGENTS.md) | `AGENTS.md` |
| Cursor | `.cursor/rules` + AGENTS.md; commands `.cursor/commands/` | `AGENTS.md` |

**Canonical**: viết skill tại **`.claude/skills/`**. Chạy `bash .agent/scripts/sync-skills.sh`
để mirror sang **`.agents/skills/`** (Codex/Antigravity). Không viết trùng tay.

## 3. LỚP TÀI NGUYÊN (open standard: progressive disclosure)
1. **Metadata** (~100 tokens): `name` + `description` — nạp lúc khởi động cho MỌI skill.
2. **Instructions** (<5000 tokens): body `SKILL.md` — nạp khi skill kích hoạt.
3. **Resources**: `scripts/ references/ assets/` — nạp khi cần.

## 4. TÀI NGUYÊN CỘNG ĐỒNG ĐƯỢC ÁP DỤNG

| Loại | Nguồn | Dùng cho |
| :-- | :-- | :-- |
| Methodology engine | **Superpowers** | brainstorm→plan→impl→TDD→review (bước 1/5/7/8/9) |
| FE design | **frontend-design** (Anthropic) + skill `ui-ux-promax` của base | UI đẹp có cá tính, chống "AI slop" |
| Skill mega-collection | **everything-claude-code** | tham khảo agents/skills/commands/hooks đa tool |
| Format & validate | **agentskills.io** + `skills-ref validate` | chuẩn SKILL.md |
| MCP FE | Figma + shadcn/ui + Magic(21st.dev) | design-to-code, component đẹp |

## 5. MAPPING SKILL → CHUẨN (migration)

Skill phẳng (trước đây ở `.agent/skills/core`) đã chuyển hết sang `.claude/skills/<name>/SKILL.md`:

**✅ ĐÃ CHUẨN HÓA 15 skill sang `.claude/skills/*/SKILL.md`** (frontmatter hợp lệ 15/15, đã sync `.agents/skills/`):

`ui-ux-promax` (FE, gộp fe-ui-craft) · `discovery-brainstorm` · `clarify-requirements` · `impact-analysis` ·
`architecture-decision` · `write-spec` · `plan-implementation` · `task-breakdown` · `analyze-consistency` ·
`git-worktree-flow` · `code-traceability` · `tdd-workflow` · `code-review` · `knowledge-update` · `semantic-commit`.

> Các SKILL.md **tự chứa nội dung**; `.agent/skills/core/` (phẳng) đã **XÓA**. Reference trong rules/commands đã trỏ hết về `.claude/skills/`.

## 6. QUY TRÌNH THÊM SKILL MỚI (chuẩn)
1. Tạo `.claude/skills/<name>/SKILL.md` đúng frontmatter.
2. `bash .agent/scripts/sync-skills.sh` (mirror sang `.agents/skills/`).
3. (Nếu có) `skills-ref validate .claude/skills/<name>`.
4. Thêm command mỏng `.claude/commands/<name>.md` + `.cursor/commands/` nếu muốn gọi tay.
5. Cập nhật `CHANGELOG.md`.
