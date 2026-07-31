# SUPERPOWERS — METHODOLOGY ENGINE (superpowers.md)

**Mức ưu tiên**: ⭐⭐⭐⭐⭐
**Nguồn**: https://github.com/obra/superpowers
**Vai trò**: **Engine skill/quy trình** — bộ skill tự kích hoạt lo phần "một dev giỏi":
brainstorming, writing-plans, using-git-worktrees, subagent-driven-development, executing-plans,
test-driven-development, verification-before-completion, requesting/receiving-code-review,
finishing-a-development-branch.

> ⚠️ **Đừng nhầm** với [`superpower.md`](superpower.md) = "Superpower **code-graph**" (một tool index symbol khác). Hai thứ khác nhau hoàn toàn.

---

## 🧩 VỊ TRÍ TRONG QUY TRÌNH VIDE-CODER

Vide-Coder **không rebuild** các skill này. Superpowers lo **Bước 1, 5, 7, 8, 9**; Vide-Coder bọc tầng enterprise
(Bước 0, 2, 3, 4, 6, 10, 11). Xem bảng phân vai trong [`.agent/rules/00-ai-workflow.md`](../rules/00-ai-workflow.md).

| Skill Superpowers | Dùng ở bước |
| :-- | :-- |
| `brainstorming` | 1. Discovery |
| `writing-plans` | 5. Planning |
| `using-git-worktrees`, `subagent-driven-development`, `executing-plans` | 7. Implementation |
| `test-driven-development`, `verification-before-completion` | 8. Self Validation |
| `requesting-code-review`, `receiving-code-review` | 9. AI Review |
| `finishing-a-development-branch` | 10. Human Review (hỗ trợ) |

---

## 📦 CÀI ĐẶT (mỗi agent cài RIÊNG — plugin không chuyển giữa các harness)

| Agent | Cách cài |
| :-- | :-- |
| **Claude Code** | `/plugin marketplace add obra/superpowers` → `/plugin install superpowers` |
| **Cursor** | Marketplace plugin → thêm repo `obra/superpowers` |
| **Codex (App/CLI), Kimi Code** | Marketplace plugin nội bộ |
| **Antigravity, Factory Droid, GitHub Copilot CLI** | Đăng ký repo `github.com/obra/superpowers` |
| **OpenCode, Pi** | Theo tài liệu cài đặt riêng của repo |

Sau khi cài, skill **tự kích hoạt** (session-start hook + contextual detection) — không cần gõ lệnh.

## 🔗 GHI CHÚ TÍCH HỢP
- User instruction > skill Superpowers > default behavior.
- Process-skill (brainstorm/plan) chạy trước implementation-skill.
- Nếu một agent chưa cài được Superpowers → fallback theo mô tả quy trình text trong `AGENTS.md` (vẫn giữ đủ 11 bước).
