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
5. **VERIFY**: run the coverage tool for the target stack and read the actual measured percentage — don't assume it passes:
   - Node/JS: `npm test -- --coverage` (Jest/Vitest)
   - PHP: `vendor/bin/phpunit --coverage-text`
   - Python: `pytest --cov --cov-report=term-missing`
   - Ruby: `rspec` with SimpleCov configured
   Then run linter + typecheck + Playwright E2E to verify Acceptance Criteria.

**HARD-GATE** (🔴 BLOCKER, same convention as `/analyze`): tests not green, OR measured coverage <80%, OR linter/typecheck failing → do not move to AI Review. Report the actual number you measured. Command `/validate`.
