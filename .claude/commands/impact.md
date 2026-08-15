---
description: Bước 2 — Impact Analysis (blast radius, dependency graph)
argument-hint: [module/tính năng bị ảnh hưởng]
---

Thực hiện **Bước 2 — IMPACT ANALYSIS** cho: $ARGUMENTS

1. Áp dụng skill `.claude/skills/impact-analysis/SKILL.md`.
2. Dùng Graphify / GitNexus / Superpower để xác định blast radius và module phụ thuộc.
3. Liệt kê file/module bị ảnh hưởng, rủi ro breaking change, và cần test lại gì.

Kết thúc: nếu có thay đổi kiến trúc lớn → `/architecture`, ngược lại → `/spec`.
