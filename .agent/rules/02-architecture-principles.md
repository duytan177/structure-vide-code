# ARCHITECTURE AND DESIGN PRINCIPLES (02-architecture-principles.md)

This document defines the system architecture design principles that AI Agents and developers are required to follow when extending the source code in `src/`.

---

## 🏛️ 1. CORE PRINCIPLES (SOLID & CLEAN ARCHITECTURE)

- **S - Single Responsibility**: Each class/module takes on exactly one responsibility.
- **O - Open/Closed**: Extend features through inheritance/interfaces, and limit direct modification of stable core logic.
- **L - Liskov Substitution**: A subclass must be substitutable for its parent class without breaking the program's correctness.
- **I - Interface Segregation**: Prefer many small, specialized interfaces over one large, all-encompassing interface.
- **D - Dependency Inversion**: Depend on Abstractions (Interfaces), not on Concretions (specific Classes).

---

## 🏗️ 2. SOURCE CODE DIRECTORY HIERARCHY MODEL (`src/`)

> ℹ️ Vide-Coder is an **overlay** — the project source lives in `workspace/<project-name>/` (not tracked by the base). The diagram below is a
> **recommended guideline** for that source; existing projects keep their current layout, and only reference this when refactoring/adding new code.

```text
src/
├── frontend/                   # Frontend Client
│   ├── assets/                 # Images, Fonts, Styles
│   ├── components/             # Reusable UI Components
│   ├── features/               # Feature Modules (Pages, Logic)
│   ├── services/               # API Calls & External Integrations
│   └── store/                  # Global State Management
├── backend/                    # Backend Server
│   ├── controllers/            # Request handling & HTTP Routing
│   ├── services/               # Business Logic execution
│   ├── repositories/           # Database access layer
│   ├── models/                 # Entities / DB Schemas
│   └── config/                 # Environment & Service configs
└── shared/                     # Shared Core
    ├── constants/              # System-wide Enums & Constants
    ├── dtos/                   # Data Transfer Objects
    └── utils/                  # Pure Helper Functions
```

---

## 🛡️ 3. ARCHITECTURE DECISION PROCESS (ADR - Architecture Decision Records)

Whenever there is any major architectural change (such as changing the Database, adding a Caching Layer, changing the core UI library, or changing the Authentication Protocol):
1. **MANDATORY**: create a new ADR file in `docs/adr/yyyy-mm-dd-<decision-title>.md` following the `docs/adr/adr-template.md` template.
2. State clearly: Context, Options Considered, Decision, and Consequences & Trade-offs.
3. Register the ADR information in `.agent/memory/decision-log.md`.
