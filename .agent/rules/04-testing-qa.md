# TESTING AND QUALITY ASSURANCE STANDARDS (04-testing-qa.md)

This document defines the process for automated testing, security scanning, and E2E UI testing before handing off code.

---

## 🧪 1. TESTING LAYERS (TESTING PYRAMID)

1. **Unit Testing**:
   - Write tests for all Pure Functions, Utility Methods, and Business Logic Services.
   - Minimum target coverage: 80%.
2. **Integration Testing**:
   - Test the connections between the API Controller - Service - Database layer.
3. **End-to-End (E2E) Testing with Playwright MCP**:
   - Use **Playwright MCP** to simulate user behavior on the web/app interface (Click, Type, Form Submit, Navigation).
   - Verify all Acceptance Criteria (AC) of the Jira task with E2E test scripts.

---

## 🛡️ 2. SECURITY SCAN & STATIC ANALYSIS (STATIC ANALYSIS & SECURITY SCAN)

Before considering a task `completed`, the AI Agent must run the static tools (these are external CLIs, not bundled with the base — verify they're actually installed with `bash .agent/scripts/verify-plugins.sh` before trusting a "0 findings" result):
- **Semgrep**: Scan for OWASP Top 10 security vulnerabilities (SQL Injection, XSS, Hardcoded Credentials, Insecure Deserialization).
- **Language linter**:
  - JavaScript/TypeScript: `eslint .`
  - PHP: `vendor/bin/phpstan analyse` / `larastan`
  - Python: `flake8` / `black --check`
  - Ruby: `rubocop`

---

## ✅ 3. PRE-PULL-REQUEST CHECKLIST (PR CHECKLIST)

- [ ] No remaining warnings or errors from the Linter.
- [ ] Semgrep security scan runs successfully with no High/Critical findings.
- [ ] All Unit Tests & E2E Playwright Tests passed.
- [ ] Updated spec/ADR/memory documentation if any logic changed.
