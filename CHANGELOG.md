# Changelog

Mọi thay đổi đáng chú ý của **base Vide-Coder** được ghi ở đây.
Theo [Keep a Changelog](https://keepachangelog.com/vi/1.1.0/) và [Semantic Versioning](https://semver.org/lang/vi/).

> Đây là version của **BASE quy trình**, không phải của dự án đích trong `workspace/`.

## [Unreleased]

### Added
- **Chuẩn hóa đa-agent theo Agent Skills open standard** (`docs/AGENT-STANDARD.md`): 15 skill sang `.claude/skills/*/SKILL.md` (frontmatter chuẩn), sync sang `.agents/skills/` cho Codex/Antigravity qua `sync-skills.sh`; AGENTS.md khai báo nơi discovery. Support Claude/Cursor/Antigravity/Codex từ 1 nguồn skill.
- Skill `ui-ux-promax` (chuẩn SKILL.md) thấm triết lý chống "AI-slop" của frontend-design (Anthropic) + MCP Magic (21st.dev).
- Skill `fe-ui-craft` + lệnh `/fe` (dựng FE đẹp/thẩm mỹ, design-to-code) + MCP Figma & shadcn/ui (`.agent/plugins/figma.md`).
- Skill `semantic-commit-render` + lệnh `/commit` (render commit theo Conventional/SemVer, bám task/spec).
- Gate `/analyze` — soát nhất quán chéo REQ↔SPEC↔ADR↔PLAN↔TASK trước Implementation (học spec-kit).
- Bước `/clarify` — làm rõ yêu cầu mơ hồ giữa Discovery và Spec (học spec-kit).
- `docs/CONSTITUTION.md` — hiến pháp bất biến per-project (học spec-kit).
- Cơ chế template overrides per-project (`.agent/templates/`).
- File vệ sinh repo: LICENSE, CONTRIBUTING, .editorconfig, .gitattributes, ISSUE_TEMPLATE, bootstrap `init.sh`.

- **SessionStart hook** (`.claude/settings.json` + `session-start.sh`) nạp quy trình từ message đầu; skill `skill-creator`; `validate-skills.sh` + job CI validate SKILL.md.

### Changed
- **Gộp skill về 1 lớp canonical** `.claude/skills/*/SKILL.md` (self-contained, 16/16 hợp lệ); XÓA `.agent/skills/core/` (phẳng) + `.agent/contexts/` (mồ côi); gitignore mirror `.agents/`; migrate toàn bộ reference.
- Base chuyển sang **overlay thuần**: bỏ `src/` ở root, source dự án nằm trong `workspace/` (gitignore).
- Workflow điểm vào linh hoạt (greenfield/brownfield) + phân vai Superpowers (engine) vs Vide-Coder (enterprise).

## [0.1.0] - 2026-07-23
### Added
- Khung quy trình 11 bước, rules, skills, agents, plugins matrix, entry-points đa agent, CI, git hooks.
