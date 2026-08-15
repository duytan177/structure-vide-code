# PROJECT CONSTITUTION — VIDE-CODER (BASE / OVERLAY)

> **Hiến pháp dự án** = các **nguyên tắc BẤT BIẾN** riêng của dự án này (khác với `.agent/rules/` là luật chung mọi dự án).
> Mọi Spec/Plan/Code phải tuân thủ; `/analyze` sẽ chặn nếu vi phạm.
> Học từ concept `constitution` của GitHub spec-kit.
>
> 🔁 **RESET KHI PHỦ LÊN DỰ ÁN ĐÍCH**: File này đang mô tả chính base Vide-Coder. Khi bạn thả base
> lên một repo mới/cũ, hãy **thay toàn bộ nội dung dưới** bằng ràng buộc của dự án đó (tech stack thật,
> ngưỡng coverage, domain rules). Nhiều dự án trong `workspace/`? Tạo bản riêng
> `docs/specs/<ten-du-an>/CONSTITUTION.md` và giữ file gốc này làm template tham chiếu.

- **Phiên bản**: 1.0.0 · **Cập nhật**: 2026-08-15 · **Chủ sở hữu**: Vide-Coder Base Maintainer

---

## 1. TECH STACK (chốt cứng)
- **Bản chất**: base/overlay quy trình AI Agent — KHÔNG phải app, KHÔNG có `src/` ở root.
- Định dạng tài liệu: **Markdown** (rules, skills SKILL.md, docs, ADR/RFC).
- Automation: **Bash** (`.agent/scripts/*.sh`) + Git hooks (`.githooks/`), chạy trên Node ≥ 18 (npx cho MCP).
- Cấu hình agent: JSON (`.mcp.json`, `.cursor/mcp.json`, `.claude/settings.json`), `.mdc` (Cursor rules).
- **Không dùng**: build system/bundler ở root; không thêm source app vào base; không hardcode secrets trong file được track.

## 2. RÀNG BUỘC KIẾN TRÚC (non-negotiable)
- **Single source of truth** cho quy trình = `.agent/rules/00-ai-workflow.md`. Entry-points (CLAUDE/AGENTS/GEMINI.md) chỉ **trỏ tới**, KHÔNG copy nội dung.
- Skill canonical đặt tại `.claude/skills/<skill>/SKILL.md`; mirror sang `.agents/` **chỉ** bằng `sync-skills.sh` (không sửa tay bản mirror).
- Source dự án đích **chỉ** nằm trong `workspace/<ten-du-an>/` và bị gitignore — base KHÔNG track/sửa source của họ.
- Thêm plugin/MCP mới hoặc đổi quy trình 11 bước ⇒ phải có **ADR** trong `docs/adr/`.
- Command của 3 tool (`.claude/`, `.cursor/`, `.windsurf/`) phải **đồng bộ ngữ nghĩa** với nhau.

## 3. CHẤT LƯỢNG & BẢO MẬT (ngưỡng bắt buộc)
- **Secrets**: mọi token/API key đọc qua `${ENV_VAR}` từ `.env` (mẫu ở `.env.example`). Cấm commit giá trị thật.
- Skill phải hợp lệ: `bash .agent/scripts/validate-skills.sh` pass (frontmatter + SKILL.md đúng chuẩn).
- Mọi liên kết nội bộ trong Markdown phải trỏ đúng file tồn tại (không link chết).
- Với **dự án đích**: coverage tối thiểu **80%**, Semgrep **không** High/Critical, input người dùng validate ở BE (ngưỡng này dự án đích tự chốt lại).

## 4. RÀNG BUỘC NGHIỆP VỤ / DOMAIN
- Base phải chạy được ở cả 2 mode: **greenfield** (dự án mới) và **brownfield** (`onboard-existing.sh` cho dự án cũ).
- Không khoá cứng vào một agent: giữ tương thích Claude Code / Cursor / Codex / Windsurf / Copilot.
- Ưu tiên **đồ có sẵn nổi tiếng** (Superpowers, Graphify, GitNexus, Context7…) — base không tự build lại tính năng đã có.

## 5. QUY ƯỚC KHÔNG ĐƯỢC PHÁ
- Commit theo `.claude/skills/semantic-commit/SKILL.md` (Conventional Commits + SemVer). Bump `VERSION` + `CHANGELOG.md` khi đổi hành vi base.
- Branch/PR theo `.agent/rules/03-git-jira-workflow.md`.
- Không xoá bước Discovery / Impact Analysis / Self-Validation khỏi quy trình.

---

> ⚖️ Khi một yêu cầu mâu thuẫn với Constitution: **DỪNG**, nêu xung đột, xin quyết định (sửa Constitution qua ADR hoặc đổi yêu cầu). Không tự ý vi phạm.
