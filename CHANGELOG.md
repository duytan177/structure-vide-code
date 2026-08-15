# Changelog

All notable changes to the **Vide-Coder base** are recorded here.
Follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and [Semantic Versioning](https://semver.org/).

> This is the version of the **workflow BASE**, not of the target project in `workspace/`.

## [Unreleased]

### Added
- **One MCP setup, keys in one place**: canonical `.agent/mcp/servers.json` + secrets in `.env`; `setup-mcp.sh` generates `.mcp.json` (Claude Code), `.cursor/mcp.json` (Cursor), `.agents/mcp_config.json` (Antigravity).
- `workspace-setup.sh` — clone related repos into `workspace/`, auto-detect stack, and configure recommended MCP/skills per repo (writes `docs/specs/<name>/SETUP.md` + `.mcp.suggested.json`).
- Graphify code-graph scripts for all workspace projects: `graphify-setup.sh` (index), `graphify-rebuild.sh`, `graphify-sync.sh`.
- `reference/` folder + `reference-snapshot.sh` — read-only OLD-code snapshots for **customize/brownfield** projects (trace before changing); auto-created by `workspace-setup.sh` for existing-git projects.

### Changed
- **Scoped supported agents to exactly three: Claude Code · Cursor · Antigravity.** Entire base translated to English.
- Fixed broken links in docs (absolute `file:///` paths and malformed `file:` prefixes); `setup-hooks.sh` no longer marks `README.md` executable.

### Removed
- Dropped support/config for **Windsurf, GitHub Copilot, Gemini, Codex**: deleted `.windsurf/`, `GEMINI.md`, `.github/copilot-instructions.md`, and the redundant `mcp-config.json.template`.

### Added (earlier)
- **Multi-agent standardization per the Agent Skills open standard** (`docs/AGENT-STANDARD.md`): 15 skills moved to `.claude/skills/*/SKILL.md` (standard frontmatter), synced to `.agents/skills/` for Antigravity via `sync-skills.sh`; AGENTS.md declares the discovery location. Supports Claude/Cursor/Antigravity from a single skill source.
- `ui-ux-promax` skill (SKILL.md standard) infused with the anti-"AI-slop" philosophy of frontend-design (Anthropic) + MCP Magic (21st.dev).
- `fe-ui-craft` skill + `/fe` command (build beautiful/aesthetic FE, design-to-code) + MCP Figma & shadcn/ui (`.agent/plugins/figma.md`).
- `semantic-commit-render` skill + `/commit` command (render commits per Conventional/SemVer, tied to task/spec).
- `/analyze` gate — cross-consistency review of REQ↔SPEC↔ADR↔PLAN↔TASK before Implementation (learned from spec-kit).
- `/clarify` step — clarify ambiguous requirements between Discovery and Spec (learned from spec-kit).
- `docs/CONSTITUTION.md` — per-project immutable constitution (learned from spec-kit).
- Per-project template overrides mechanism (`.agent/templates/`).
- Repo hygiene files: LICENSE, CONTRIBUTING, .editorconfig, .gitattributes, ISSUE_TEMPLATE, bootstrap `init.sh`.

- **SessionStart hook** (`.claude/settings.json` + `session-start.sh`) loads the workflow from the first message; `skill-creator` skill; `validate-skills.sh` + a CI job to validate SKILL.md.

### Changed
- **Consolidated skills into a single canonical layer** `.claude/skills/*/SKILL.md` (self-contained, 16/16 valid); REMOVED `.agent/skills/core/` (flat) + `.agent/contexts/` (orphaned); gitignore the `.agents/` mirror; migrated all references.
- The base moved to a **pure overlay**: removed `src/` at the root, the project source lives in `workspace/` (gitignored).
- Flexible workflow entry point (greenfield/brownfield) + role split between Superpowers (engine) and Vide-Coder (enterprise).

## [0.1.0] - 2026-07-23
### Added
- The 11-step workflow framework, rules, skills, agents, plugin matrix, multi-agent entry points, CI, git hooks.
