# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C40

# Entry 2.I Several plans in one session

## C40. How a step in /spec is recorded (2026-10-12)

A user-visible choice: a value of the dispatch entry, a term of the glossary. Step 3's line has a step count toward the limit on steps in flight, and have its paths compared, from the start of its `/spec`. Ruling D17 and ADR 0011 make the dispatch blocks of every open plan the one record the skills count and compare over, and `/spec` writes a step's dispatch entry only at its Steps 9, after the worktree. The glossary's dispatch entry gives `landing` the values `not-started`, `cherry-picking` and `backed-out`.
  - Option (a), recommended: `/spec` writes the step's dispatch entry at the end of its preflight, holding the step and `landing: preparing`; the entry counts toward the limit, its brief is compared once written, Steps 9 fills the entry and sets `landing: not-started`, a stop or a wait removes it, and on resumption an entry at `landing: preparing` is an interrupted `/spec`. Pro: the dispatch blocks stay the one record, as D17 and ADR 0011 say, and a session or a new orchestrator sees the step. Con: a fourth value of `landing`, in the glossary and the state-file template.
  - Option (b): a separate list of the steps in `/spec`, beside the dispatch block in the state file. Pro: the dispatch entry keeps its shape. Con: a second record to count and compare over, against D17 and ADR 0011.
  - Option (c): a step counts from the moment its brief is on disk. Pro: no new value. Con: the window from the preflight to the brief stays unseen, which is run finding 9's defect left in part.
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/2-i-several-plans-in-one-session/plan.md:92` (Open item Step 3, how a step in /spec is recorded)
Builds on it: step 3
