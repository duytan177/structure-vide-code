# SKILL: TỰ RENDER COMMIT THEO SEMANTIC + BÁM TASK/SPEC (semantic-commit-render.md)

Skill này hướng dẫn AI Agent **tự sinh commit title + description** chuẩn Conventional Commits (ánh xạ Semantic Versioning),
**bám sát task/docs/spec** của dự án — **KHÔNG chế nội dung lan man, mơ hồ**.

Khớp 100% với hook `.githooks/commit-msg` và rule [`03-git-jira-workflow.md`](../../rules/03-git-jira-workflow.md).

---

## 🎯 MỤC TIÊU
- Title ngắn, rõ, đúng chuẩn máy đọc được → phục vụ auto-changelog & auto SemVer bump.
- Nội dung **truy ra được** từ task/spec, không phải diễn giải chung chung.

## 🧱 ĐỊNH DẠNG BẮT BUỘC

```text
<type>(<scope>): PROJECT-XXX - <summary>

<body: mô tả CÁI GÌ đổi & TẠI SAO, dạng bullet>

<footer: BREAKING CHANGE / Refs / Closes>
```

- **Title ≤ 72 ký tự**, thức mệnh lệnh (imperative): "add", "fix", "remove" — KHÔNG "added/fixing/updates".
- `PROJECT-XXX` = Jira ID lấy từ tên file task đang làm (`tasks/in-progress/PROJECT-XXX.md`).
- `<scope>` = module bị đụng, suy từ đường dẫn thực tế (vd `auth`, `api`, `checkout`), viết thường.

## 🔢 ÁNH XẠ TYPE → SEMANTIC VERSION

| type | Ý nghĩa | SemVer bump |
| :-- | :-- | :-- |
| `feat` | Thêm tính năng | **MINOR** (x.**Y**.z) |
| `fix` | Sửa bug | **PATCH** (x.y.**Z**) |
| `perf` | Cải thiện hiệu năng | PATCH |
| `refactor` | Đổi code, không đổi hành vi | không bump |
| `docs` `style` `test` `chore` `ci` `build` | Phụ trợ | không bump |
| bất kỳ type + `!` hoặc footer `BREAKING CHANGE:` | Phá vỡ tương thích | **MAJOR** (**X**.y.z) |

> Ví dụ major: `feat(api)!: PROJECT-210 - drop v1 auth endpoints`.

## 📥 NGUỒN LẤY NỘI DUNG (theo thứ tự ưu tiên — KHÔNG bịa)

1. **Task**: `tasks/in-progress/PROJECT-XXX.md` → lấy Jira ID, mục tiêu, Acceptance Criteria.
2. **Spec**: `docs/specs/SPEC-XXX.md` liên quan → lấy phạm vi chức năng chính xác.
3. **Discovery/ADR**: `docs/discovery/`, `docs/adr/` → lấy "tại sao" cho body/footer.
4. **Diff thực tế** (`git diff --staged`) → xác nhận scope + liệt kê thay đổi có thật.

Nếu thiếu Jira ID hoặc không map được vào task/spec nào → **DỪNG và hỏi**, không tự đặt ID.

## ⚙️ QUY TRÌNH REN­DER

1. `git diff --staged --stat` để biết file/module nào đổi → suy `<scope>` và `<type>`.
2. Đọc task + spec tương ứng → viết `<summary>` bằng đúng thuật ngữ nghiệp vụ trong spec.
3. Body: mỗi bullet = 1 thay đổi cụ thể, gắn với AC/spec (vd "Add refresh-token model — AC-2 của SPEC-102").
4. Footer: `Refs: SPEC-XXX` / `Closes: PROJECT-XXX` / `BREAKING CHANGE: ...` nếu có.
5. Đối chiếu regex hook `commit-msg`; nếu trượt thì sửa cho khớp trước khi commit.

## ✅ / ❌ CHỐNG LAN MAN

| ❌ Không đạt | ✅ Đạt |
| :-- | :-- |
| `chore: update stuff` | `fix(auth): PROJECT-102 - reject expired refresh tokens` |
| `feat: PROJECT-1 - improve things and more` | `feat(checkout): PROJECT-88 - add COD payment option` |
| Body: "changed some files" | Body: "- Add `RefreshToken` model (AC-1)\n- Rotate token on /refresh (AC-3)" |

**Cấm** trong title/body: "stuff", "things", "misc", "various", "update code", "fix bug" (chung chung), emoji, câu văn dài.

## 🧾 KHUÔN MẪU
```text
feat(auth): PROJECT-102 - add JWT refresh token rotation

- Add RefreshToken model + migration (SPEC-102 §3, AC-1)
- Rotate & invalidate old token on POST /auth/refresh (AC-3)
- Cover service with unit tests (coverage 86%)

Refs: SPEC-102
Closes: PROJECT-102
```
