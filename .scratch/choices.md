# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C2

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

## C2. How a quoted ruling ending "(self-rule)" names the finding whose work `/roadmap add` may write (2026-10-01)

Raised: how a quoted ruling ending "(self-rule)" names the finding whose work `/roadmap add` may write. Stop "A brief check finding the brief cannot absorb" of `/spec 2.E.A 7` (`agents/reviews/7-brief-check.md`, "Cases and checks" finding 4 and "The question" finding 3): the brief named a finding by "the refuter report's path and the finding's heading", which no refuter report gives a finding, and let any path stand for a running plan.

- What the tree shows: a refuter report puts its findings as numbered items under `## 1. Spec` to `## 4. Behaviour`, and a run over a repair round under `### Findings` (`skills/refute/templates/report.md`); a brief check, a landing report and a diagnosis record also hold findings under `agents/reviews/`. `archive_root: .scratch/archive` lies under `ledger_root: .scratch` (`.agents/plan.yaml`). D14 and ruling E say "a finding of a running plan".
- Options:
  - (a) Any finding of a report under a running plan's `agents/reviews/` (a refuter report, a brief-check report, a landing report or a diagnosis record), named by the report's path, the heading it stands under and its number there; `/roadmap` reads the report and checks that it holds the finding, that the plan is open (its folder under `<ledger_root>/`, outside `<archive_root>`), and that the entry's goal is the finding's work, read against the finding's text. Pros: it reads D14 whole; a named finding is one a reader can find; an archived plan's report and a made-up path are refused. Cons: `/roadmap` reads ledger reports it does not read today.
  - (b) The same, for refuter reports only. Pros: one report shape to read. Cons: it narrows D14, so a finding a brief check or a landing raised cannot become an entry under self-rule.
  - (c) The report's path and the finding's words, with no check by `/roadmap`. Pros: no new reading in `/roadmap`. Cons: any path and any words let `/roadmap add` write any work, which ruling E's limit exists to prevent.
- Recommendation: (a), since it keeps D14's reach and makes the limit of ruling E a check `/roadmap` makes. Lazy option: (c), which writes no check and leaves the limit to the bullet's word.

Taken: (a), any finding of a report under a running plan's `agents/reviews/`, named by the report's path, its heading and its number, checked by `/roadmap`
Booked: `.scratch/2-e-a-self-rule/plan.md:88` (Open item G)
Builds on it: 7
