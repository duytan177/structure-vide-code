---
name: write-spec
description: >
  Viết Functional + Technical Spec theo màn hình từ requirement/Excel basic-design; và đọc spec/spec-changes
  trước khi code. Dùng SAU Clarify/Architecture, TRƯỚC Planning; hoặc user nói "spec", "đặc tả", "specification".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Specification (Bước 4)

## A. Sinh spec từ tài liệu đầu vào
1. **Từ BRD** (`docs/client-requirements/`): trích Actors, Use Cases, Business Rules → phân nhóm Module → sinh `docs/specs/SPEC-XXX-<feature>.md` (Scope, User Stories, Functional Requirements, NFR bảo mật/hiệu năng) → tạo `tasks/backlog/`.
2. **Từ Excel basic-design** (`docs/basic-design/*.xlsx`, dùng pandas/openpyxl/xlsx): bóc Screen list, Fields+Validation, API/DB mapping → sinh spec theo `docs/specs/spec-template.md` (bảng field + validation + API) → task theo màn hình.
3. Tra tài liệu framework đúng version bằng **Context7** khi cần.

## B. Đọc spec TRƯỚC khi code (read-spec-first)
- Đọc `docs/specs/` + ADR liên quan (`docs/adr/`).
- **CRITICAL**: đọc `docs/spec-changes/` để bắt điều chỉnh mới nhất (Q&A Jira/họp sync) đè lên spec gốc.
- Đọc `.agent/memory/context.md` (glossary/quy ước). Tóm tắt 3–5 điểm mấu chốt trước khi làm.

Command `/spec`.
