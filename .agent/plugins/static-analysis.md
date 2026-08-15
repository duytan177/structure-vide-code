# STATIC ANALYSIS & SECURITY TOOLS GUIDE (static-analysis.md)

This document details the integration of Semgrep, CodeRabbit, and static-analysis linters per programming language.

---

## 🔒 1. Semgrep (Security & Vulnerability Scanner) (⭐ ⭐ ⭐ ⭐ ☆)
- **Role**: Scans the source code in `src/` to detect security vulnerabilities (SQL Injection, XSS, Hardcoded Tokens, Weak Cryptography).
- **Execution command**:
  - `semgrep scan --config auto src/`

---

## 🔍 2. Language Linters & Static Analyzers (⭐ ⭐ ⭐ ⭐ ☆)
Analyzes syntax and code standards per language:
- **TypeScript / JavaScript**: `npx eslint src/`
- **PHP / Laravel**: `vendor/bin/phpstan analyse src/backend`
- **Ruby**: `bundle exec rubocop src/`
- **Python**: `mypy src/` & `flake8 src/`

---

## 🐇 3. CodeRabbit (AI Code Reviewer) (⭐ ⭐ ⭐ ⭐ ☆)
- **Role**: Automatically reviews Pull Requests on GitHub, detecting code smells, DRY/SOLID violations, and providing in-depth refactor suggestions.
- **Workflow**: Already integrated via GitHub Webhook / Action when the GitHub MCP opens a PR.
