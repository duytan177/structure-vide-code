# SUPERPOWERS — METHODOLOGY ENGINE (superpowers.md)

**Priority level**: ⭐⭐⭐⭐⭐
**Source**: https://github.com/obra/superpowers
**Role**: **Skill/workflow engine** — a set of self-activating skills that handle the "skilled developer" part:
brainstorming, writing-plans, using-git-worktrees, subagent-driven-development, executing-plans,
test-driven-development, verification-before-completion, requesting/receiving-code-review,
finishing-a-development-branch.

> ⚠️ **Don't confuse** this with [`superpower.md`](superpower.md) = "Superpower **code-graph**" (a different symbol-indexing tool). They are completely different things.

---

## 🧩 POSITION IN THE VIDE-CODER WORKFLOW

Vide-Coder **does not rebuild** these skills. Superpowers handles **Steps 1, 5, 7, 8, 9**; Vide-Coder wraps the enterprise layer
(Steps 0, 2, 3, 4, 6, 10, 11). See the role-assignment table in [`.agent/rules/00-ai-workflow.md`](../rules/00-ai-workflow.md).

| Superpowers Skill | Used at step |
| :-- | :-- |
| `brainstorming` | 1. Discovery |
| `writing-plans` | 5. Planning |
| `using-git-worktrees`, `subagent-driven-development`, `executing-plans` | 7. Implementation |
| `test-driven-development`, `verification-before-completion` | 8. Self Validation |
| `requesting-code-review`, `receiving-code-review` | 9. AI Review |
| `finishing-a-development-branch` | 10. Human Review (support) |

---

## 📦 INSTALLATION (each agent installs SEPARATELY — the plugin does not transfer between harnesses)

| Agent | How to install |
| :-- | :-- |
| **Claude Code** | `/plugin marketplace add obra/superpowers` → `/plugin install superpowers` |
| **Cursor** | Marketplace plugin → add the `obra/superpowers` repo |
| **Antigravity** | Register the `github.com/obra/superpowers` repo |

After installation, the skills **self-activate** (session-start hook + contextual detection) — no command needed.

## 🔗 INTEGRATION NOTES
- User instruction > Superpowers skill > default behavior.
- Process-skills (brainstorm/plan) run before implementation-skills.
- If an agent cannot install Superpowers → fall back to the text workflow description in `AGENTS.md` (still keeping all 11 steps).
