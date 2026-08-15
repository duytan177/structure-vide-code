---
name: knowledge-update
description: >
  Cập nhật tri thức sau khi hoàn tất: ADR, memory, re-index graph, changelog, traceability. Dùng SAU
  merge/hoàn thành task; hoặc user nói "knowledge update", "cập nhật tri thức", "post-mortem", "changelog".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Knowledge Update (Bước 11)

## 5 bước post-implementation
1. **Re-index** Graphify/GitNexus (đảm bảo import/export mới không gãy liên kết, không circular dep).
2. **Blast radius verify**: so sánh trước/sau implement để bắt side-effect ngoài dự kiến.
3. **Security/static**: `semgrep scan --config auto` + linter (0 warning/error).
4. **E2E**: Playwright verify Acceptance Criteria, chụp proof nếu có UI.
5. **Cập nhật tri thức & task**: `.agent/memory/decision-log.md`, `docs/traceability-matrix.md`, changelog `docs/spec-changes/` (+ `CHANGELOG.md` nếu đụng base); đưa task `in-progress/` → `completed/`; sẵn sàng PR.

Command `/knowledge-update`.
