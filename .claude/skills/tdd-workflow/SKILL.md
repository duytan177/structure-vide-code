---
name: tdd-workflow
description: >
  TDD-style self-validation RED-GREEN-REFACTOR + lint/typecheck/E2E (using Superpowers TDD). Use WHEN
  writing code/tests, self-validating; or the user says "test", "TDD", "testing", "validate", "coverage".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Self Validation (Step 8)

Use Superpowers `test-driven-development` + `verification-before-completion`.

## RED → GREEN → REFACTOR cycle
1. **Define** the Interface/DTO skeleton in the project source.
2. **RED**: write a unit test describing the expected behavior → run it, ensure it FAILS.
3. **GREEN**: write the minimal code to make the test PASS.
4. **REFACTOR**: clean up the code (clean, remove duplication) while keeping tests 100% green.
5. **VERIFY**: coverage ≥80%; run linter + typecheck + Playwright E2E to verify Acceptance Criteria.

**HARD-GATE**: tests not green or coverage <80% → do not move to AI Review. Command `/validate`.
