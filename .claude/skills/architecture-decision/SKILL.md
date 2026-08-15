---
name: architecture-decision
description: >
  Ra quyết định kiến trúc & viết ADR/RFC khi có thay đổi lớn (đổi DB, thêm caching, đổi auth, lib core).
  Dùng KHI thiết kế/đánh giá kiến trúc, hoặc user nói "kiến trúc", "ADR", "RFC", "thiết kế hệ thống".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Architecture Decision (Bước 3)

Với thay đổi lớn: viết RFC (`docs/adr/rfc-template.md`) rồi chốt ADR (`docs/adr/adr-template.md`) gồm Context/Options/Decision/Consequences; đăng ký `.agent/memory/decision-log.md`.
Đảm bảo tuân SOLID/Clean Architecture (rule 02) và không phá `docs/CONSTITUTION.md`.

Persona: [`architect.md`](../../../.agent/agents/architect.md). Command `/architecture`.
