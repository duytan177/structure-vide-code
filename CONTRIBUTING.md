# Contributing to the Vide-Coder Base

This document is about **editing/extending the workflow base itself** (not the target project's code in `workspace/`).

## Single source of truth
- The workflow: `.agent/rules/00-ai-workflow.md` is the **single source of truth**. To change the workflow, edit only here; the entry points (`CLAUDE.md`, `AGENTS.md`, `.cursor/`) are pointers and do not copy the content.

## When adding/editing
- **New skill** → `.claude/skills/<name>/SKILL.md` (Agent Skills standard), then `bash .agent/scripts/sync-skills.sh`. See `docs/AGENT-STANDARD.md`.
- **New workflow step** → add a skill + command (`.claude/commands/` and `.cursor/commands/`) + wire it into rule 00.
- **Template** → edit the core in `docs/…-template.md`; for per-project customization use `.agent/templates/overrides/`.
- **Plugin** → declare it in `.agent/plugins/` + the installer; confirm the CLI/package actually exists.

## Commit & version
- Commit per `.claude/skills/semantic-commit/SKILL.md` (`/commit`).
- Notable base changes → update `CHANGELOG.md` and `VERSION` (SemVer).

## PR checklist
- [ ] Updated `CHANGELOG.md`.
- [ ] Entry points remain pointers only (no content drift from rule 00).
- [ ] New commands have both a Claude and a Cursor version.
- [ ] `bash -n` passes for scripts; JSON is valid.
