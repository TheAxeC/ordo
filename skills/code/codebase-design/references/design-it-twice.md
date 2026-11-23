# Design It Twice

When the user wants to explore alternative interfaces for a chosen deepening candidate, use this pattern of agents started at once. Based on "Design It Twice" (Ousterhout): your first idea is unlikely to be the best.

Uses the vocabulary in `references/vocabulary.md`: **module**, **interface**, **seam**, **adapter**, **leverage**.

## Process

### 1. Frame the problem space

Before starting the agents, write an explanation of the problem space for the user, for the chosen candidate:

- The constraints any new interface would need to satisfy
- The dependencies it would rely on, and which category they fall into (see `references/deepening.md`)
- A rough illustrative code sketch to ground the constraints, not a proposal, only a way to make the constraints concrete

Show this to the user, then go on to section 2 at once. The user reads and thinks while the agents work.

### 2. Start the agents

Start three or more agents at once, each as a fresh agent on the runner's general-purpose agent with the runner's defaults, its prompt setting no model and no effort. Each must produce a **radically different** interface for the deepened module.

Give each agent a prompt of its own with the technical facts (file paths, coupling details, dependency category from `references/deepening.md`, what sits behind the seam). That prompt is independent of the explanation of the problem space written for the user in section 1. Give each agent a different design constraint:

- Agent 1: "Minimize the interface: aim for 1 to 3 entry points max. Maximise leverage per entry point."
- Agent 2: "Maximise flexibility: support many uses and extension."
- Agent 3: "Optimise for the most common caller: make the default call trivial."
- Agent 4 (if applicable): "Design around ports & adapters for cross-seam dependencies."

Include both the vocabulary of `references/vocabulary.md` and the vocabulary of the repository's glossary in the prompt, so each agent names things consistently with the architecture language and the project's domain language.

Each agent outputs:

1. Interface (types, methods, params, plus invariants, ordering, error modes)
2. Usage example showing how callers use it
3. What the implementation hides behind the seam
4. Dependency strategy and adapters (see `references/deepening.md`)
5. Trade-offs: where leverage is high, where it's thin

### 3. Present and compare

Present designs sequentially so the user can absorb each one, then compare them in prose. Contrast by **depth** (leverage at the interface), **locality** (where change concentrates), and **seam placement**.

After comparing, give your own recommendation: which design you think is strongest and why. If elements from different designs would combine well, propose a hybrid. Be opinionated: the user wants a strong read, not a menu.
