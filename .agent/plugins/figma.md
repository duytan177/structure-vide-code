# FIGMA + SHADCN — FE DESIGN MCP (figma.md)

**Priority level**: ⭐⭐⭐⭐⭐ (FE/UI phase)
**Role**: Design source for **design-to-code** and a registry of beautiful components — serving the
[`ui-ux-promax`](.claude/skills/ui-ux-promax/SKILL.md) skill.

---

## 🧩 THE MCPs

### 1. Figma MCP (design source)
Extracts design context, screenshots, variables, and Code Connect from a Figma file.

**Option A — Framelink (headless, requires API key)** — already configured in `.mcp.json`:
```json
"figma": {
  "command": "npx",
  "args": ["-y", "figma-developer-mcp", "--stdio"],
  "env": { "FIGMA_API_KEY": "<YOUR_FIGMA_API_KEY>" }
}
```
Get an API key: Figma → Settings → Security → Personal access tokens.

**Option B — Official Figma Dev Mode MCP (requires Figma Desktop running)**:
Enable it in Figma Desktop (Preferences → Enable Dev Mode MCP Server), then point the MCP to `http://127.0.0.1:3845/mcp`.
More powerful (get_design_context, get_variable_defs, Code Connect) but requires the desktop app to be open.

### 2. shadcn/ui MCP (beautiful component registry)
Browse and add standard, beautiful, accessible components to the project.
```json
"shadcn": { "command": "npx", "args": ["-y", "shadcn@latest", "mcp"] }
```

### 3. Magic MCP — 21st.dev (generate beautiful UI from a description)
Quickly generates beautiful components/sections from natural language → a source of inspiration for the `ui-ux-promax` skill.
```json
"magic": {
  "command": "npx",
  "args": ["-y", "@21st-dev/magic@latest"],
  "env": { "API_KEY": "<YOUR_21ST_DEV_API_KEY>" }
}
```
Get an API key at 21st.dev. ⚠️ Always **map generated components onto the project's design tokens & a11y**, do not paste them verbatim.

## 🔧 KEY FEATURES (Figma MCP)
- `get_design_context` / `get_metadata`: structure + attributes of the selected node.
- `get_screenshot`: a rendered image for comparison.
- `get_variable_defs`: **design tokens** (color/spacing/typography) → map to Tailwind/CSS variables.
- `get_code_connect_map`: Figma component ↔ existing code component (reuse, don't rebuild).

## 🪄 SAMPLE PROMPTS
- "Get the design context of frame [Figma link] then build the component with shadcn + Tailwind, mapping tokens from Figma variables."
- "Compare the Figma screenshot with the currently rendered page (Playwright) and fix spacing/color discrepancies."

## ⚖️ TOKEN BUDGETING (per plugins/README.md)
- Figma + shadcn are only enabled in the **FE/UI phase**; disable them when working on BE to save context.
- Don't enable too many MCPs at once (keep < 10 active).

## 🔒 NOTES
- Keep `FIGMA_API_KEY` in an environment variable/secret, **do not commit** the real value (the config file should only contain a placeholder).
