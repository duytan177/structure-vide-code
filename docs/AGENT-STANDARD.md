# AGENT STANDARD — Multi-agent standardization (Claude / Cursor / Antigravity)

> Standardize the entire base on the **Agent Skills open standard** (agentskills.io) — well-starred community sources:
> [everything-claude-code](https://github.com/alphachoi/everything-claude-code) (~100K★), [anthropics/skills](https://github.com/anthropics/skills),
> [superpowers](https://github.com/obra/superpowers), [frontend-design](https://github.com/anthropics/claude-code).
>
> **Principle:** write a skill **once** per the `SKILL.md` standard, run it **unchanged** on every agent.

---

## 1. `SKILL.md` STANDARD (mandatory)

Each skill = **1 folder + `SKILL.md`** with YAML frontmatter:
```yaml
---
name: skill-name-kebab-case        # ≤64 chars, [a-z0-9-], = folder name
description: WHAT it does + WHEN to use it, with keywords so the agent auto-triggers.   # ≤1024 chars
license: MIT                       # optional
metadata: { author: vide-coder, version: "1.0" }   # optional
---
# Instruction content (≤500 lines; move details into references/)
```
- `description` must state **when to use it** + keywords (this is what makes the skill auto-activate).
- Body <5000 tokens; keep heavy resources in `references/`, `scripts/`, `assets/`.

## 2. SKILL LOCATION & DISCOVERY BY TOOL

| Agent | Reads skills from | Entry-point |
| :-- | :-- | :-- |
| Claude Code | `.claude/skills/<name>/SKILL.md` | `CLAUDE.md` |
| Antigravity | `.agents/skills/<name>/SKILL.md` (+ AGENTS.md) | `AGENTS.md` |
| Cursor | `.cursor/rules` + AGENTS.md; commands `.cursor/commands/` | `AGENTS.md` |

**Canonical**: write skills in **`.claude/skills/`**. Run `bash .agent/scripts/sync-skills.sh`
to mirror them into **`.agents/skills/`** (Antigravity). Do not duplicate by hand.

## 3. RESOURCE LAYERS (open standard: progressive disclosure)
1. **Metadata** (~100 tokens): `name` + `description` — loaded at startup for EVERY skill.
2. **Instructions** (<5000 tokens): `SKILL.md` body — loaded when the skill activates.
3. **Resources**: `scripts/ references/ assets/` — loaded when needed.

## 4. COMMUNITY RESOURCES APPLIED

| Type | Source | Used for |
| :-- | :-- | :-- |
| Methodology engine | **Superpowers** | brainstorm→plan→impl→TDD→review (steps 1/5/7/8/9) |
| FE design | **frontend-design** (Anthropic) + the base's `ui-ux-promax` skill | attractive UI with character, anti "AI slop" |
| Skill mega-collection | **everything-claude-code** | reference multi-tool agents/skills/commands/hooks |
| Format & validate | **agentskills.io** + `skills-ref validate` | SKILL.md standard |
| MCP FE | Figma + shadcn/ui + Magic(21st.dev) | design-to-code, attractive components |

## 5. SKILL → STANDARD MAPPING (migration)

Flat skills (formerly in `.agent/skills/core`) have all been moved to `.claude/skills/<name>/SKILL.md`:

**✅ 16 SKILLS STANDARDIZED into `.claude/skills/*/SKILL.md`** (frontmatter valid 16/16, `.agents/skills/` synced):

`ui-ux-promax` (FE, merges fe-ui-craft) · `discovery-brainstorm` · `clarify-requirements` · `impact-analysis` ·
`architecture-decision` · `write-spec` · `plan-implementation` · `task-breakdown` · `analyze-consistency` ·
`git-worktree-flow` · `code-traceability` · `tdd-workflow` · `code-review` · `knowledge-update` · `semantic-commit` ·
`skill-creator`.

> The SKILL.md files are **self-contained**; the flat `.agent/skills/core/` has been **DELETED**. References in rules/commands now all point to `.claude/skills/`.

## 6. WORKFLOW TO ADD A NEW SKILL (standard)
1. Create `.claude/skills/<name>/SKILL.md` with valid frontmatter.
2. `bash .agent/scripts/sync-skills.sh` (mirror into `.agents/skills/`).
3. (If available) `skills-ref validate .claude/skills/<name>`.
4. Add a thin command `.claude/commands/<name>.md` + `.cursor/commands/` if you want to invoke it manually.
5. Update `CHANGELOG.md`.
