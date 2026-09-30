# Step 16, the closing: the drafts for approval

## 1. The roadmap diff of `/roadmap done 2.E`

The entry "## 2.E grill" (`docs/roadmap.md` lines 21 to 27) is removed from the open order, and this line is added under "# Done", after the line of 2.D:

```
- [x] 2.E. grill: at the closing on main, `skills/grill/SKILL.md` 1.2.0 follows `docs/dev/skill-layout.md`, read and approved by the user at step 12 and, for the changes of steps 9a, 14a and 14c, on reading their diff at the closing; step 13's real run redrafted entry 3 from its sources, with D1 to D24 in `.scratch/rulings/3-the-writing-base.md`, the glossary terms and entry 3 on disk (7e984dd), reviewed by the user; the blind comparison against mattpocock's `grill-with-docs` on entry 3 (`.scratch/archive/2-e-grill/agents/reviews/14-blind-comparison.md`, second run): both judges chose `grill`, and the user's call is a win; the default pages were read and approved by the user at steps 4, 5 and 6; `repo-setup`'s real run on a scratch repository holding C++ and TypeScript files installed the design-principles, common, C++ and TypeScript pages and listed them under `standards` (step 7, `7-refuter.md`, run 1); `sh skills/ordo-init/templates/check_config.test.sh` printed `PASS: check_config.py scratch tests`, with refusal cases for a wrong `adr`, `design_bar`, `design_references`, `worker_effort` and `reviewer_effort`.
```

Then `.scratch/2-e-grill/` moves to `.scratch/archive/2-e-grill/`. The tag and the pin are the user's.

## 2. The self-rule entry, `/roadmap add`

Placed after 2.E and before 2.F, numbered `2.E.A` in the form of `22.A`:

```
## 2.E.A self-rule

- Status: [ ]
- Goal: The plan skills run a plan under self-rule: with `self_rule: on` in a plan's state file, the orchestrator takes the option it recommends on an open item, closes it and books it as it does a ruling, and writes it to `choices.md` beside the state file, with its options, the recommendation, the lazy option, the option taken, where it is booked and the steps that build on it, for the user's review. Six kinds of item stay open for the user: anything that reaches outside the repository or needs the user's hands or accounts, a model other than the configured one included; anything that deletes data or touches a secret; a change to the user's written rules, a clash between them or the reversal of a ruling; the closing's roadmap diff, tag and pin; the user's reading of a page a step writes, which does not block the steps after it; a choice with no clear recommendation. With `next_entry: on` as well, a closed plan is followed by the next open entry of the roadmap, run through `/grill`, `/plan` and the loop under self-rule, stopping at an entry under "Not yet specified", at an item of the six kinds, or when no open entry is left; `/roadmap add` adds only work a ruling of the user or a finding of a running plan names. A script computes the priced usage of each agent role of a plan from the agents' transcripts.
- Gate: one plan run with `self_rule: on`, whose every open item is either left open under one of the six kinds, named, or closed with its entry in `choices.md`, read by you; one run with `next_entry: on` on a scratch roadmap of two small entries, the second opened, grilled and planned after the first closes, each decision of its `/grill` in `choices.md`, read by you; the cost script prints each role's priced usage for plan 2.E and passes its test; the changed skills follow `docs/dev/skill-layout.md`, read by you.
- Waits on: 2.E, for the plan skills as it leaves them.
```

The gate asked "could this pass without the goal being reached?": no. Each part is a real run read by the user or a test of the script, and a `choices.md` that lacks an item or holds one of the six kinds fails the reading.
