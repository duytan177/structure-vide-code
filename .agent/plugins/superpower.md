# SUPERPOWER CODE GRAPH GUIDE (superpower.md)

**Priority level**: ⭐⭐⭐⭐⭐  
**Role**: Manages high-speed indexing and building of the context diagram (Code Graph) for medium and large codebases, helping the AI Agent quickly query symbol, class, and function context.

---

## 🎯 KEY FEATURES
1. **Symbol Tracking**: Quickly locates every place a function/class/variable is defined and used in `src/`.
2. **Context Booster**: Provides accurate context to the AI Agent when generating code or refactoring a module.

---

## 📋 SAMPLE COMMANDS OR PROMPTS FOR THE AI AGENT
- `superpower index --path="./src"` -> Rebuilds the Code Graph Indexing.
- `superpower symbol "OrderRepository"` -> Queries detailed information about the OrderRepository class.
