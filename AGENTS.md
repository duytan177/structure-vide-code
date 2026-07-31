# AGENTS.md — Entry-point chuẩn cho AI Agents (Codex, Antigravity, Windsurf, Gemini CLI, v.v.)

> File này theo chuẩn [agents.md](https://agents.md). Nó là **pointer** — nguồn chân lý duy nhất
> của quy trình là [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md).
> (Claude Code đọc `CLAUDE.md`; Cursor đọc `.cursor/rules/`; Windsurf đọc `.windsurf/rules/`. Tất cả cùng trỏ về đây.)

## BẮT BUỘC ĐỌC TRƯỚC KHI CODE

1. Quy trình 11 bước — **single source of truth**: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md)
2. Code style: [`.agent/rules/01-code-style.md`](.agent/rules/01-code-style.md)
3. Nguyên tắc kiến trúc: [`.agent/rules/02-architecture-principles.md`](.agent/rules/02-architecture-principles.md)
4. Git/Jira workflow: [`.agent/rules/03-git-jira-workflow.md`](.agent/rules/03-git-jira-workflow.md)
5. Testing/QA: [`.agent/rules/04-testing-qa.md`](.agent/rules/04-testing-qa.md)

## QUY TRÌNH 11 BƯỚC (tóm tắt)

```
REQUIREMENT
  → 1. DISCOVERY        (docs/discovery/)
  → 2. IMPACT ANALYSIS  (Graphify / GitNexus)
  → 3. ARCHITECTURE     (docs/adr/ — ADR/RFC)
  → 4. SPECIFICATION    (docs/specs/)
  → 5. PLANNING         (plans/)
  → 6. TASK BREAKDOWN   (tasks/backlog/)
  → 7. IMPLEMENTATION   (Git Worktree + src/)
  → 8. SELF VALIDATION  (Lint + Typecheck + Unit + E2E)
  → 9. AI REVIEW        (Semgrep + CodeRabbit)
  → 10. HUMAN REVIEW    (PR Approval)
  → 11. KNOWLEDGE UPDATE(ADR + Memory + Graph + Changelog)
  → MERGE / RELEASE
```

## NGUYÊN TẮC VÀNG

- **Không bỏ qua** Discovery, Impact Analysis, Self-Validation.
- Mỗi task chạy trong **Git Worktree** riêng.
- Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-desc`. Commit: Conventional Commits + Jira ID (xem rule 03).
- Definition of Done: [`docs/DEFINITION-OF-DONE.md`](docs/DEFINITION-OF-DONE.md).
- Kết thúc luôn cập nhật [`.agent/memory/decision-log.md`](.agent/memory/decision-log.md) + [`docs/traceability-matrix.md`](docs/traceability-matrix.md).

## VỊ TRÍ SOURCE

Source dự án đích nằm trong **`workspace/<ten-du-an>/`** (gitignore toàn bộ — xem `workspace/README.md`).
Đọc/sửa/test code TẠI ĐÂY, KHÔNG ở root base.

## BUILD / TEST COMMANDS

> Chạy trong `workspace/<ten-du-an>/` theo stack của dự án.

```bash
# Ví dụ (Node/TS) — cd vào project trong workspace trước:
# (cd workspace/<ten-du-an> && npm run lint && npm run typecheck && npm test)
bash .agent/scripts/verify-plugins.sh    # kiểm tra toolchain plugin (chạy ở root base)
```

## MCP / PLUGINS

- Ma trận plugin + token budgeting: [`.agent/plugins/README.md`](.agent/plugins/README.md).
- Config MCP mẫu: [`.agent/plugins/installer/mcp-config.json.template`](.agent/plugins/installer/mcp-config.json.template).
- Cursor: [`.cursor/mcp.json`](.cursor/mcp.json). Claude Code: [`.mcp.json`](.mcp.json).
