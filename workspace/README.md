# WORKSPACE — Nơi chứa SOURCE của dự án đích

> 📍 **AI Agent đọc source ở ĐÂY.** Toàn bộ code của dự án (mới hoặc cũ) nằm trong `workspace/`.
> Nội dung bên trong bị **gitignore hoàn toàn** (xem `workspace/.gitignore`) — base Vide-Coder KHÔNG track source dự án.

## Cách dùng

**Dự án cũ (clone về):**
```bash
git clone <repo-url> workspace/<ten-du-an>
```

**Dự án mới (tạo mới):**
```bash
mkdir -p workspace/<ten-du-an>
# khởi tạo source trong đó (npm init, v.v.)
```

## Quy ước cho AI Agent
- **Source code** → `workspace/<ten-du-an>/` (KHÔNG nằm ở root base).
- **Tài liệu/quy trình** → `docs/`, `.agent/`, `plans/`, `tasks/` ở root base (được track).
- Khi Impact Analysis / Implementation / Test: thao tác trong `workspace/<ten-du-an>/`.
- Baseline dự án cũ sinh ra ở `docs/specs/_baseline/` (được track), không phải trong workspace.

## Nhiều dự án
Có thể chứa nhiều dự án song song: `workspace/project-a/`, `workspace/project-b/`. Mỗi dự án là một git repo độc lập bên trong (nested), base chỉ đóng vai overlay quy trình phủ lên trên.
