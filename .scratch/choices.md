# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C1

# Entry 2.E.A self-rule

## C1. How `/grill` and `/plan` know that the loop runs them in next-entry mode (2026-10-01)

Raised: how `/grill` and `/plan` know that the loop runs them in next-entry mode. Stop "A user-visible choice" of `/spec 2.E.A 7`: the step makes `/grill` answer each round with its recommendation and `/plan` take its drafted list under self-rule, and both skills are also run by hand, where the user answers.

- What the tree shows: `/grill` ends each round's turn and waits for the user's answers (`skills/grill/SKILL.md` Steps 6), and `/plan` stops at the drafted step list (`skills/plan/SKILL.md` Steps 3, Stops row "The drafted step list"); neither reads `self_rule` or `next_entry`. D1 rules that the two modes are set by keys in `.agents/plan.yaml`, the lazy option there being an invocation word.
- Options:
  - (a) An argument `--self-rule`, given to `/grill` and `/plan` only by the loop in next-entry mode; each refuses it unless `.agents/plan.yaml` (in the `projects:` form, the project's keys) holds `self_rule: on` and `next_entry: on`. Pros: a person's `/grill` stays an interview and a person's `/plan` keeps its approval stop; the mode is still set only by the keys of D1, since the argument is refused without them; the run's answers are marked as the orchestrator's. Cons: a new argument on two commands, shown in their Quick start.
  - (b) `/grill` and `/plan` read the two keys and answer with their recommendations whenever both are on. Pros: no new argument. Cons: a person who runs `/grill` or `/plan` by hand in such a repository gets no interview and no approval stop, and the run's answers are the orchestrator's though the person typed the command.
- Recommendation: (a), since it keeps the interview and the approval with the person who types the command, and keeps the mode where D1 puts it. Lazy option: (b), which needs no change to either skill's arguments and takes the user's interview away.

Taken: (a), the argument `--self-rule`, refused without `self_rule: on` and `next_entry: on`
Booked: `.scratch/2-e-a-self-rule/plan.md:87` (Open item F)
Builds on it: 7
