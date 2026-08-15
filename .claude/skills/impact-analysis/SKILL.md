---
name: impact-analysis
description: >
  Phân tích blast radius & dependency trước khi sửa code (Graphify/GitNexus). Dùng KHI sắp sửa code
  chạm module dùng chung, refactor, đổi dependency; hoặc user nói "ảnh hưởng", "impact", "blast radius".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Impact Analysis (Bước 2)

Ngăn "sửa một chỗ hỏng chỗ khác" trong hệ thống nhiều module.

## Quy trình
1. **Graphify — tra Knowledge Graph**: tìm module phụ thuộc trực tiếp & gián tiếp vào file/hàm sắp sửa.
2. **GitNexus — blast radius**: phân tích execution flow (FE→BE→DB), liệt kê mọi hàm/class bị tác động.
3. **Regression scope**: ghi vùng nguy cơ cao để bổ sung test (Playwright/Unit) ở Bước 8.

**HARD-GATE**: chưa liệt kê đủ blast radius → không code. Command `/impact`.
