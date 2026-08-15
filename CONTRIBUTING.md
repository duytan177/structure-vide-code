# Đóng góp cho Base Vide-Coder

Tài liệu này nói về việc **sửa/mở rộng chính base quy trình** (không phải code dự án đích trong `workspace/`).

## Nguồn chân lý
- Quy trình: `.agent/rules/00-ai-workflow.md` là **single source of truth**. Sửa quy trình chỉ sửa ở đây; entry-points (`CLAUDE.md`, `AGENTS.md`, `.cursor/`, `.windsurf/`) là pointer, không chép nội dung.

## Khi thêm/sửa
- **Skill mới** → `.claude/skills/<ten>/SKILL.md` (chuẩn Agent Skills), rồi `bash .agent/scripts/sync-skills.sh`. Xem `docs/AGENT-STANDARD.md`.
- **Bước quy trình mới** → thêm skill + command (`.claude/commands/` và `.cursor/commands/`) + wire vào rule 00.
- **Template** → sửa core trong `docs/…-template.md`; tùy biến per-project thì dùng `.agent/templates/overrides/`.
- **Plugin** → khai báo trong `.agent/plugins/` + installer; xác nhận CLI/package tồn tại thật.

## Commit & version
- Commit theo `.claude/skills/semantic-commit/SKILL.md` (`/commit`).
- Thay đổi base đáng chú ý → cập nhật `CHANGELOG.md` và `VERSION` (SemVer).

## Checklist PR
- [ ] Cập nhật `CHANGELOG.md`.
- [ ] Entry-points vẫn chỉ là pointer (không lệch nội dung với rule 00).
- [ ] Command mới có cả bản Claude + Cursor.
- [ ] `bash -n` pass cho script; JSON hợp lệ.
