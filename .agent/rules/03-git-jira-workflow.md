# GIT WORKFLOW AND JIRA INTEGRATION RULES (03-git-jira-workflow.md)

This document guides AI Agents and developers through the workflow for Git, branch naming, commit messages, and syncing work with the Jira Backlog.

---

## 🌿 1. BRANCH NAMING RULES (GIT BRANCHING MODEL)

Every working branch must be tied to a **Jira Ticket ID**:

- **Feature Branch**: `feature/PROJECT-XXX-short-description` (Adding a new feature)
- **Bugfix Branch**: `fix/PROJECT-XXX-short-description` (Fixing a Bug)
- **Refactor Branch**: `refactor/PROJECT-XXX-short-description` (Refactoring code)
- **Hotfix Branch**: `hotfix/PROJECT-XXX-short-description` (Emergency fix on Production)

---

## 📝 2. COMMIT MESSAGE STANDARD (CONVENTIONAL COMMITS)

The mandatory commit syntax is:

```text
<type>(<scope>): <Jira Issue ID> - <Short Summary>

[Optional Body detailing changes]
[Optional Footer]
```

### Types:
- `feat`: Add a new feature
- `fix`: Fix a bug
- `docs`: Edit/add documentation
- `style`: Code formatting (whitespace, format - no logic change)
- `refactor`: Change code without changing features and without fixing a bug
- `test`: Add or edit test cases
- `chore`: Change build scripts, package dependencies

### Standard example:
```text
feat(auth): PROJECT-102 - Implement JWT refresh token rotation mechanism

- Add refresh token model to database schema
- Create middleware for token verification and automatic renewal
- Update auth service tests
```

> 🤖 **Auto-render commits**: The AI Agent MUST use the skill [`semantic-commit-render.md`](.claude/skills/semantic-commit/SKILL.md)
> (or `/commit`) to generate a title + description tied to the task/spec, without rambling.
> SemVer mapping: `feat`→MINOR, `fix`/`perf`→PATCH, `!` or `BREAKING CHANGE:`→MAJOR.

---

## 🔄 3. PROCESS FOR SYNCING JIRA TASKS IN THE LOCAL REPOSITORY

1. When starting a new task on Jira:
   - Read the corresponding task file in `tasks/backlog/PROJECT-XXX.md`.
   - Move the file to `tasks/in-progress/PROJECT-XXX.md`.
2. When finished and creating a PR:
   - Use the **GitHub MCP** to push the branch and open the PR.
   - Move the file to `tasks/completed/PROJECT-XXX.md`.
