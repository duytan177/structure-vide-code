# CLAUDE.md — Entry-point cho Claude Code

> Đây là file **pointer**. Nguồn chân lý duy nhất (single source of truth) của quy trình là
> [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md). Đừng copy nội dung quy trình vào đây — chỉ trỏ tới nó.

## BẮT BUỘC ĐỌC TRƯỚC KHI LÀM BẤT CỨ VIỆC GÌ

1. Quy trình 11 bước: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md)
2. Code style: [`.agent/rules/01-code-style.md`](.agent/rules/01-code-style.md)
3. Nguyên tắc kiến trúc: [`.agent/rules/02-architecture-principles.md`](.agent/rules/02-architecture-principles.md)
4. Git/Jira workflow: [`.agent/rules/03-git-jira-workflow.md`](.agent/rules/03-git-jira-workflow.md)
5. Testing/QA: [`.agent/rules/04-testing-qa.md`](.agent/rules/04-testing-qa.md)

## QUY TRÌNH 11 BƯỚC (tóm tắt — chi tiết xem file gốc)

`REQUIREMENT → 1.Discovery → 2.Impact Analysis → 3.Architecture → 4.Specification → 5.Planning → 6.Task Breakdown → 7.Implementation → 8.Self Validation → 9.AI Review → 10.Human Review → 11.Knowledge Update → MERGE/RELEASE`

- **Không bao giờ bỏ qua** Discovery, Impact Analysis, Self-Validation.
- Cô lập mỗi task bằng **Git Worktree** (xem [`.claude/skills/git-worktree-flow/SKILL.md`](.claude/skills/git-worktree-flow/SKILL.md)).
- Kết thúc luôn cập nhật tri thức: [`.agent/memory/decision-log.md`](.agent/memory/decision-log.md).

## SLASH COMMANDS

Mỗi bước có 1 command tương ứng trong [`.claude/commands/`](.claude/commands/): `/discovery`, `/impact`, `/architecture`, `/spec`, `/plan`, `/breakdown`, `/implement`, `/validate`, `/ai-review`, `/knowledge-update`.

## SUBAGENTS & SKILLS

- Personas: [`.agent/agents/`](.agent/agents/) (architect, planner, security-reviewer, e2e-runner, build-error-resolver).
- Core skills (chuẩn SKILL.md): [`.claude/skills/`](.claude/skills/) (mirror sang `.agents/skills/` cho Codex/Antigravity).
- Plugin / MCP matrix + token budgeting: [`.agent/plugins/README.md`](.agent/plugins/README.md).

## VỊ TRÍ SOURCE

Source dự án đích nằm trong **`workspace/<ten-du-an>/`** (gitignore toàn bộ — xem [`workspace/README.md`](workspace/README.md)). Đọc/sửa/test code TẠI ĐÂY, không ở root base.

## MCP

Cấu hình MCP cho Claude Code ở [`.mcp.json`](.mcp.json) (filesystem server trỏ vào `./workspace`). Chỉ bật MCP theo phase (xem token budgeting trong plugins/README.md).
