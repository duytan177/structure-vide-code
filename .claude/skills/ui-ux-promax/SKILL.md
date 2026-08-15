---
name: ui-ux-promax
description: >
  Build & polish a beautiful, characterful, smooth (premium) Frontend — anti generic "AI-slop" UI.
  Use WHEN building/changing any UI, screen, component, landing, or design system; design-to-code
  from Figma; or when the user says "make the UI beautiful", "smoother", "aesthetics", "premium", "frontend", "interface".
  Integrates MCP Figma + shadcn/ui + Magic(21st.dev) + Playwright (visual QA).
license: MIT
metadata:
  author: vide-coder
  version: "1.0"
  supersedes: fe-ui-craft, ui-ux-promax(flat)
---

# UI/UX Pro Max — characterful FE design, anti AI-slop

You are a **studio design lead**, not a template-dumping machine. Goal: UI that is **intentionally beautiful + smooth + usable**,
carrying the identity of the problem — NOT "safe, bland pretty".

## ⛔ HARD-GATE: 2-PASS (don't code the UI immediately)

### Pass 1 — PLAN (finalize before writing code)
Create a **compact token system** and self-critique "is this too generic?":
- **Palette**: 4–6 named colors (primary + neutral scale + 1–2 accents), derived from the product's *theme/brand*.
- **Typography**: display face + body face + utility — **an intentional font pairing**, NOT defaulting to Inter/Roboto for every project.
- **Layout concept**: sketch an ASCII wireframe; identify **1 signature element** (the single most memorable thing).
- **Motion concept**: 1–2 intentional motion moments (page-load / scroll reveal), not scattered.
→ Review again: if reading it feels "like every AI-generated page", **fix** it before coding. Only code once it's distinctive & justifiable.

### Pass 2 — BUILD + self-critique
- Stick to the plan: every color/typography derives from the finalized tokens (no scattered hardcoded hex/px).
- **Spend boldness in one place**: make the signature stand out, keep everything around it static & disciplined.
- CSS specificity discipline (avoid selector overrides). Truly responsive (320px → ≥1440px).
- Self-critique against the checklist below before delivering.

## 🚫 ANTI "AI-SLOP" (signs of AI-generated UI — avoid unless the brief demands it)
- Cream background `#F4F1EA` + high-contrast serif + terracotta accent.
- Near-black background + acid-green/vermilion accent.
- "Broadsheet" layout with hairline rules, no rounded corners, dense columns.
- Inter/Roboto default for everything; purple-blue gradients; excessive animation everywhere.
→ These are **defaults, not choices**. Use only when the problem truly needs them.

## 🎬 MOTION (make it "smooth", 60fps)
- Duration scale: micro 120–180ms · region transitions 200–300ms · layout 300–450ms; easing `cubic-bezier(0.2,0,0,1)`.
- Only animate `transform` / `opacity` (avoid layout thrash). Respond to every interaction (hover lift, active press-down, focus ring, press scale ~0.98).
- List/route: stagger fade-up 8–16px; **skeleton** instead of spinner. Respect `prefers-reduced-motion`.

## 🌈 PREMIUM VISUAL SYSTEM
- Color via OKLCH/HSL for even chroma; states shift lightness in a controlled way; contrast ≥ WCAG AA.
- Elevation: 3–5 levels of soft shadow (multi-layer, large blur, low alpha), not a single hard shadow.
- Typography scale 1.2–1.25; slight negative tracking for large headings; body 60–75 chars/line, line-height ≥1.4.
- Dark mode **symmetric via tokens**, not just inverted colors.

## 🧰 STACK & MCP (prefer using them, map to project tokens)
- **Figma MCP**: `get_design_context` / `get_variable_defs` / `get_screenshot` + Code Connect (reuse real components).
- **shadcn/ui MCP**: add a11y-standard components (Radix + Tailwind). **Magic (21st.dev)**: generate beautiful sections for inspiration.
- **Playwright MCP**: capture desktop+mobile+dark, compare against Figma, fix discrepancies.
- Icons: lucide. Fonts: load via next/font or @fontsource. Brand constraints in `docs/CONSTITUTION.md`.

## ✅ SELF-CRITIQUE CHECKLIST (all met = done)
- [ ] There's a clear **1 signature element**; the rest is static, not competing.
- [ ] Palette/typography **specific to the problem**, not falling into the AI-slop defaults above.
- [ ] Spacing on a 4/8pt scale; airy whitespace; optical alignment is solid.
- [ ] Every interactive element: hover/focus/active/disabled/loading smooth; transitions on the right scale.
- [ ] Only transform/opacity; `prefers-reduced-motion` OK; no layout shift (CLS≈0).
- [ ] Multi-layer shadows; balanced dark mode; contrast ≥AA.
- [ ] Empty/error/loading **thoughtfully designed** (not bare); active button labels ("Save changes", not "Submit").

## 📝 WRITING UI COPY (microcopy)
- Write from the user's perspective, name exactly what they control; active voice; consistent action names.
- Error/empty states must **give direction** (what to do next), not be vague. Each element does exactly 1 job.

## 🔗 Right-standards foundation: follow `.agent/rules/01-code-style.md` (FE) + an a11y floor always on (clear focus, reduced-motion) without showing off.
> Want a full first-party FE skill: install Anthropic's `frontend-design` plugin (anthropics/claude-code) — this skill has absorbed that philosophy + wired in the base's MCP/workflow.
