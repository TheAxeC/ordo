# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C3

# Entry 2.E.A self-rule

## C3. The closing of a plan whose ledger names no agent (2026-10-01)

Raised: the closing of a plan whose ledger names no agent. Found by the brief check of `/spec 2.E.A 12` (`agents/reviews/12-brief-check.md`, "Cases and checks" C2).

- Options:
  - (a) The closing step in `skills/plan/SKILL.md` Steps 2 runs the script only when the Agents section or `agents/agent-roles.md` holds an agent bullet; with none, the closing report says the plan started no agent, and the folder moves. A new step 11b before step 12 makes the change, the template line and `plan-orchestration` "Usage" read with it. Pros: the script and what it computes stay as approved. Cons: one more condition in the closing step, and an Agents section a skill failed to write closes with "no agent" instead of stopping.
  - (b) `plan_cost.py` prints its tables with no agent row and a Total of 0, exit 0, for a ledger that names no agent. Pros: the closing step is unchanged. Cons: a change to what an approved script computes, which is yours (kind 3), and an Agents section left empty by a defect closes with a Total of 0 instead of stopping.
  - (c) Leave it: such a plan stops at its closing for you. Pros: no change. Cons: every plan run only by the orchestrator meets a stop it cannot pass without a ruling.
- Recommendation: (a), since it ends the stop without changing what an approved script computes; both (a) and (b) let an empty Agents section close, and (a) says so in words in the closing report. Lazy option: (c).

Taken: (a), the cost script run only when the ledger names an agent, the closing report saying so otherwise
Booked: `.scratch/2-e-a-self-rule/plan.md:92` (Open item M)
Builds on it: 11b
