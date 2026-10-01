# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C4

# Entry 2.E.A self-rule

## C4. Whether step 12 makes the closing skip the cost script for every ledger that names no agent (2026-10-01)

Raised: a closing that worked before is refused after this plan. Hand-back of step 12's builder at its first run of the cases (cases 1, 3 and 6): by the rule of Open item L, `plan` and `plan-orchestration` take the major part, and `spec` too.

- What the tree shows: `skills/plan/SKILL.md` Steps 2 (lines 86 to 92) skips the cost script only when `plan.md` has its `## Agents` heading with no bullet and the ledger has no `agents/agent-roles.md`; a `plan.md` with no `## Agents` heading goes to the script, which prints `error: the ledger names no agent` and exits 1 (`plan_cost.py:283`), so the closing stops at "A red check" and the folder stays. Every ledger the skills wrote before this plan has no `## Agents` heading and closed without a stop. Open item M (a), the user's ruling at `plan.md:95` read through self-rule C3, says "the closing step runs the cost script only when the ledger names an agent"; step 11b's line says the same, and its landed text narrowed it to a ledger with the heading. For `spec`, the stop on a dictated line a ruling fixes and that breaks a rule (`skills/spec/SKILL.md:273`) is new, and `spec`'s `templates/brief.md:5` at 9fc91dc already reads "A design ruling decides what is built. It never exempts the code: every line is written to the standards pages", so such a line was already called an error, the fifth bullet of the rule.
- Options:
  - (a) Step 12 also rewrites the closing step's sub-bullets so the closing step skips the cost script whenever the ledger names no agent, by the script's own test: no bullet line under a `## Agents` heading of `plan.md`, up to the next `## ` heading, and none in `agents/agent-roles.md`. The versions stay the values of Open item L, since a ledger written before this plan then closes as before, with the closing report added. Case 6 keeps `spec` at 1.8.0 by the fifth bullet. Pros: it ends the refusal at its cause, it makes the landed text follow Open item M as ruled, and the versions follow the rule. Cons: step 12 carries one behaviour fix beside its reading, in a path it already writes.
  - (b) The same fix as a new step 11d, landed before step 12, and step 12 prepared again on top of it. Pros: one concern per step. Cons: a full preparation, build, review and landing for four bullets, and step 12's builder stopped and started again.
  - (c) Apply the rule as written to the text as it stands: `plan` 2.0.0, `plan-orchestration` 3.0.0, `spec` 2.0.0. Pros: no fix. Cons: it contradicts the values of Open item L, which is kind 3, and leaves every older ledger unable to close.
  - (d) Keep the values of Open item L with a reading that a closing stop is no refused run. Pros: no change. Cons: the rule's text does not say so, and the older ledgers still stop.
- Recommendation: (a), since it removes the refusal where it was made, inside a path step 12 already writes, and keeps both of the user's rulings true. Lazy option: (d), which changes nothing and leaves the older ledgers stopped.

Taken: (a), step 12 rewrites the closing step's sub-bullets so the closing step skips the cost script whenever the ledger names no agent, and the versions stay the values of Open item L
Booked: `.scratch/2-e-a-self-rule/plan.md:97` (Open item N)
Builds on it: 12
