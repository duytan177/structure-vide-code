# TEMPLATE RESOLUTION — Per-project overrides take priority

Inspired by GitHub spec-kit's template priority mechanism. Lets **a project customize templates WITHOUT modifying the base**.

## Priority order (high → low)

1. **`.agent/templates/overrides/`** — the current project's customizations (beats everything).
2. **`.agent/templates/presets/`** — preset bundles by domain/organization (if any).
3. **Core templates** (base defaults):
   - `docs/specs/spec-template.md`
   - `docs/adr/adr-template.md`, `docs/adr/rfc-template.md`
   - `docs/discovery/discovery-template.md`
   - `plans/plan-template.md`
   - `tasks/backlog/jira-task-template.md`
   - `docs/spec-changes/change-log-template.md`
   - `docs/CONSTITUTION.md`

## Rules for the AI Agent
- Before generating a document from a template, **check `overrides/` (then `presets/`) first**; only fall back to core if no override exists.
- The override file name must **match** the core template's name to be recognized (e.g. `overrides/spec-template.md`).
- Don't modify the core template when you only need to customize it for a single project → create a copy in `overrides/`.
