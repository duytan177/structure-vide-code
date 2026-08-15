# CODE RULES AND PROGRAMMING STYLE (01-code-style.md)

This document defines the code writing style (Code Style & Formatting Guidelines). This file flexes to the language/framework of the **target project**.

> ℹ️ Vide-Coder is an **overlay** — the rules below apply to the source in `workspace/<project-name>/` (whether the layout is `src/frontend`, `src/backend`, or any pre-existing structure).

---

## 🎨 General Rules for Every Language

1. **Clear > Concise**: Variable and function names must be self-describing. Avoid unclear abbreviations (use `userRegistrationDate` instead of `usrRegDt`).
2. **Function/Method Size**: Each function should do exactly one thing (Single Responsibility Principle). Maximum length ~30-50 lines.
3. **Clean Code & Don't Repeat Yourself (DRY)**: Move shared logic into `src/shared/` or `utils/`. Avoid copy-pasting code.
4. **Error Handling**: Always catch exceptions selectively, return clear error messages, and log errors with full context.
5. **No Magic Numbers / Hardcoded Strings**: Move all constants into a config file or an Enum.

---

## 💻 Frontend Guidelines (`src/frontend`)

> 🎨 Build beautiful/aesthetic, smooth, premium FE + resist "AI-slop" (design-to-code from Figma, motion, a11y):
> skill [`ui-ux-promax`](.claude/skills/ui-ux-promax/SKILL.md) — command `/ui` (or `/fe`).
> MCP: [`figma.md`](../plugins/figma.md) (Figma + shadcn/ui + Magic 21st.dev).

- **Component Architecture**: Use Functional Components, the Atomic Design Pattern, or Modular Feature Folders.
- **State Management**: Clearly distinguish Component Local State (UI state) from Global Application State (Redux, Zustand, Pinia, etc.).
- **CSS / Styling**:
  - Prefer Vanilla CSS / CSS Modules or Tailwind CSS (when the project requires it).
  - Use CSS Variables for Theme, Color Palette, and Spacing.
  - Apply smooth effects (smooth transitions, hover states, micro-animations).

---

## ⚙️ Backend Guidelines (`src/backend`)

- **Layered Architecture**: Clearly separate Controllers/Handlers -> Services/UseCases -> Repositories/Models.
- **API Standards**:
  - RESTful API or GraphQL with a standardized JSON response format:
    ```json
    {
      "success": true,
      "data": { ... },
      "message": "Operation successful",
      "errors": null
    }
    ```
- **Database Querying**: Avoid N+1 queries, use an ORM/Query Builder with appropriate Indexing.

---

## 🔄 Shared Code Guidelines (`src/shared`)

- Contains TypeScript Types/Interfaces, DTO Validation Schemas, and Utility Functions shared by both FE and BE.
- Must not contain code with side-effects directly against the DOM (browser) or a Database driver.
