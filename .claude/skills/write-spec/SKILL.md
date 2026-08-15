---
name: write-spec
description: >
  Write per-screen Functional + Technical Specs from a requirement/Excel basic-design; and read spec/spec-changes
  before coding. Use AFTER Clarify/Architecture, BEFORE Planning; or the user says "spec", "specification".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Specification (Step 4)

## A. Generate the spec from input documents
1. **From a BRD** (`docs/client-requirements/`): extract Actors, Use Cases, Business Rules → group into Modules → generate `docs/specs/SPEC-XXX-<feature>.md` (Scope, User Stories, Functional Requirements, security/performance NFRs) → create `tasks/backlog/`.
2. **From an Excel basic-design** (`docs/basic-design/*.xlsx`, using pandas/openpyxl/xlsx): extract the Screen list, Fields+Validation, API/DB mapping → generate the spec per `docs/specs/spec-template.md` (field table + validation + API) → tasks per screen.
3. Look up version-correct framework docs via **Context7** when needed.

## B. Read the spec BEFORE coding (read-spec-first)
- Read `docs/specs/` + related ADRs (`docs/adr/`).
- **CRITICAL**: read `docs/spec-changes/` to catch the latest adjustments (Jira/sync-meeting Q&A) that override the original spec.
- Read `.agent/memory/context.md` (glossary/conventions). Summarize 3–5 key points before starting.

Command `/spec`.
