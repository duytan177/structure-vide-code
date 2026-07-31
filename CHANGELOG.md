# Changelog

Mọi thay đổi đáng chú ý của **base Vide-Coder** được ghi ở đây.
Theo [Keep a Changelog](https://keepachangelog.com/vi/1.1.0/) và [Semantic Versioning](https://semver.org/lang/vi/).

> Đây là version của **BASE quy trình**, không phải của dự án đích trong `workspace/`.

## [Unreleased]

### Added
- Skill `semantic-commit-render` + lệnh `/commit` (render commit theo Conventional/SemVer, bám task/spec).
- Gate `/analyze` — soát nhất quán chéo REQ↔SPEC↔ADR↔PLAN↔TASK trước Implementation (học spec-kit).
- Bước `/clarify` — làm rõ yêu cầu mơ hồ giữa Discovery và Spec (học spec-kit).
- `docs/CONSTITUTION.md` — hiến pháp bất biến per-project (học spec-kit).
- Cơ chế template overrides per-project (`.agent/templates/`).
- File vệ sinh repo: LICENSE, CONTRIBUTING, .editorconfig, .gitattributes, ISSUE_TEMPLATE, bootstrap `init.sh`.

### Changed
- Base chuyển sang **overlay thuần**: bỏ `src/` ở root, source dự án nằm trong `workspace/` (gitignore).
- Workflow điểm vào linh hoạt (greenfield/brownfield) + phân vai Superpowers (engine) vs Vide-Coder (enterprise).

## [0.1.0] - 2026-07-23
### Added
- Khung quy trình 11 bước, rules, skills, agents, plugins matrix, entry-points đa agent, CI, git hooks.
