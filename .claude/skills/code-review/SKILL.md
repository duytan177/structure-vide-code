---
name: code-review
description: >
  AI review before PR: security (Semgrep/OWASP), code smells, typing, git hygiene, architecture. Use AFTER
  self-validation, BEFORE human review; or when the user says "review", "check code", "before PR".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# AI Review (Step 9)

Two-stage (learned from Superpowers `requesting/receiving-code-review`): (1) spec-compliance → code matches plan/spec; (2) code-quality.

## Checklist
> Confirm Semgrep is actually installed first (`bash .agent/scripts/verify-plugins.sh`). If it's missing, say so explicitly in the review output — an unrun scan is not a clean scan.

1. **Security (Semgrep/OWASP)**: no hardcoded secrets; no SQLi/XSS/CSRF; High/Critical = 0.
2. **Code smell**: no function >50 lines; duplication moved into shared code.
3. **Typing/static**: no careless `any`; linter (ESLint/PHPStan/RuboCop) passes 100%.
4. **Git hygiene**: commits follow Conventional + Jira ID (skill `semantic-commit`).

**HARD-GATE**: any High/Critical remaining → do not open the PR. Persona `security-reviewer`. Command `/ai-review`.
