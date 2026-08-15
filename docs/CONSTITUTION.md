# PROJECT CONSTITUTION — VIDE-CODER (BASE / OVERLAY)

> **The project constitution** = the **immutable principles** specific to this project (distinct from `.agent/rules/`, which are the general rules for every project).
> Every Spec/Plan/Code must comply; `/analyze` will block violations.
> Learned from GitHub spec-kit's `constitution` concept.
>
> 🔁 **RESET WHEN OVERLAYING ONTO A TARGET PROJECT**: This file currently describes the Vide-Coder base itself. When you drop the base
> onto a new/old repo, **replace all the content below** with that project's constraints (real tech stack,
> coverage thresholds, domain rules). Multiple projects in `workspace/`? Create a dedicated copy
> `docs/specs/<project-name>/CONSTITUTION.md` and keep this original as a reference template.

- **Version**: 1.0.0 · **Updated**: 2026-08-15 · **Owner**: Vide-Coder Base Maintainer

---

## 1. TECH STACK (hard-locked)
- **Nature**: an AI Agent workflow base/overlay — NOT an app, NO `src/` at the root.
- Document format: **Markdown** (rules, skills SKILL.md, docs, ADR/RFC).
- Automation: **Bash** (`.agent/scripts/*.sh`) + Git hooks (`.githooks/`), running on Node ≥ 18 (npx for MCP).
- Agent config: JSON (`.mcp.json`, `.cursor/mcp.json`, `.claude/settings.json`), `.mdc` (Cursor rules).
- **Do not use**: a build system/bundler at the root; do not add app source into the base; do not hardcode secrets in tracked files.

## 2. ARCHITECTURE CONSTRAINTS (non-negotiable)
- **Single source of truth** for the workflow = `.agent/rules/00-ai-workflow.md`. Entry-points (CLAUDE/AGENTS/GEMINI.md) only **point to it**, do NOT copy its content.
- Canonical skills live at `.claude/skills/<skill>/SKILL.md`; mirror into `.agents/` **only** via `sync-skills.sh` (never edit the mirror by hand).
- The target project's source lives **only** in `workspace/<project-name>/` and is gitignored — the base does NOT track/edit their source.
- Adding a new plugin/MCP or changing the 11-step workflow ⇒ requires an **ADR** in `docs/adr/`.
- The commands of the 3 tools (`.claude/`, `.cursor/`, `.windsurf/`) must be **semantically in sync** with each other.

## 3. QUALITY & SECURITY (mandatory thresholds)
- **Secrets**: every token/API key is read via `${ENV_VAR}` from `.env` (template in `.env.example`). Committing real values is forbidden.
- Skills must be valid: `bash .agent/scripts/validate-skills.sh` passes (frontmatter + SKILL.md conform to the standard).
- Every internal Markdown link must point to an existing file (no dead links).
- For the **target project**: minimum coverage **80%**, Semgrep with **no** High/Critical, user input validated on the BE (the target project finalizes these thresholds itself).

## 4. BUSINESS / DOMAIN CONSTRAINTS
- The base must run in both modes: **greenfield** (new project) and **brownfield** (`onboard-existing.sh` for old projects).
- Don't hard-lock to one agent: stay compatible with Claude Code / Cursor / Codex / Windsurf / Copilot.
- Prefer **well-known off-the-shelf** tools (Superpowers, Graphify, GitNexus, Context7…) — the base does not rebuild features that already exist.

## 5. CONVENTIONS THAT MUST NOT BE BROKEN
- Commit per `.claude/skills/semantic-commit/SKILL.md` (Conventional Commits + SemVer). Bump `VERSION` + `CHANGELOG.md` when base behavior changes.
- Branch/PR per `.agent/rules/03-git-jira-workflow.md`.
- Do not remove the Discovery / Impact Analysis / Self-Validation steps from the workflow.

---

> ⚖️ When a request conflicts with the Constitution: **STOP**, state the conflict, request a decision (amend the Constitution via ADR or change the request). Do not violate it unilaterally.
