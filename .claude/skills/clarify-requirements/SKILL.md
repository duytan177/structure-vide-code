---
name: clarify-requirements
description: >
  Clarify ambiguous requirements (edge cases, non-functional, scope boundaries) before writing the Spec. Use AFTER
  Discovery, BEFORE Spec; or when requirements are unclear, the user says "clarify", "clarification", "ask back".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Clarify — clarify requirements (Step 1.5)

Break out blocker questions by group: ambiguous functionality, non-functional, data, scope boundaries, dependencies.
Ask the user in multiple-choice / default-proposal form; record results in `docs/discovery/<feature>-clarifications.md`; new invariant constraints → `docs/CONSTITUTION.md`.

Question groups: ambiguous functionality · non-functional (perf/security/i18n/mobile) · data (format/validation/lifecycle) · scope boundaries (out-of-scope) · dependencies (API/permissions).

**Exit**: no 🔴 blocker questions remain; unconfirmed assumptions marked `[ASSUMPTION]`. Command `/clarify`.
