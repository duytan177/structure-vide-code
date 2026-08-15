---
name: skill-creator
description: >
  Tạo/sửa skill mới đúng chuẩn Agent Skills (SKILL.md + frontmatter) cho base Vide-Coder. Dùng KHI
  user muốn "tạo skill", "thêm skill", "viết skill", "skill mới", hoặc chuẩn hóa một quy trình lặp lại.
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Skill Creator — tạo skill chuẩn cho mọi agent

Học từ anthropics `skill-creator` + agentskills.io. Skill viết 1 lần chạy trên Claude/Cursor/Antigravity/Codex.

## Quy trình
1. **Hỏi làm rõ**: skill giải quyết việc gì? KHI NÀO nên dùng (trigger)? Input/Output? Bước chính?
2. **Tạo folder** `.claude/skills/<name>/SKILL.md` (`name` kebab-case ≤64 ký tự, = tên folder, không `--`).
3. **Frontmatter**:
   ```yaml
   ---
   name: <kebab-case>
   description: >
     <làm GÌ> + <KHI NÀO dùng, kèm keyword người dùng hay gõ>.   # ≤1024 ký tự — quyết định auto-trigger
   license: MIT
   metadata: { author: vide-coder, version: "1.0" }
   ---
   ```
4. **Body** (<500 dòng, self-contained): mục tiêu · quy trình từng bước · ví dụ · HARD-GATE (nếu có) · anti-pattern. Tài nguyên nặng để `references/` `scripts/` `assets/`.
5. **Đồng bộ**: `bash .agent/scripts/sync-skills.sh` (mirror sang `.agents/skills/`).
6. **Validate**: `bash .agent/scripts/validate-skills.sh` (kiểm frontmatter). Cập nhật `CHANGELOG.md`.

## Mẹo viết `description` để trigger tốt
- Nêu rõ **khi nào dùng** + **keyword** người dùng thường gõ (vd "commit", "review", "UI đẹp").
- Tránh mơ hồ kiểu "Helps with X". Ví dụ tốt: "Extract PDF text... Use when user mentions PDFs/forms".

## Anti-pattern
- Không đặt logic chi tiết vào `description`. Không tạo skill trùng chức năng skill đã có. Không quên sync + validate.
