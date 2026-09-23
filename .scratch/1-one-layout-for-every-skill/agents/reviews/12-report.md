# Step 12 report: plan-retro restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/plan-retro` | DONE | `ok: skills/plan-retro/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md` |
| 3 | the verify list | DONE | `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/plan-retro/SKILL.md`, 53 lines before, 103 after (`git diff --stat`: 69 insertions, 19 deletions); the inventory, 63 lines, 56 body rows.

Sections before: What it reads; Grouping; The proposal for a recurring kind; What it writes; Rules. After: Quick start; Use instead (two); What it reads (five); Steps (fifteen, one action each: collect, group, count, name the heading, quote, mark recurring, propose, write the retro, show it, take the decisions, write them, edit, run the checks, show their output, commit); Grouping (three); The proposal for a recurring kind (four, the old third split into checkable and not); Stops (one stop, one refusal); Anti-patterns (four); Rules (four).

The grep for the removed section name and the kept ones over skills, utils, docs and README.md, and its output (nothing):

```
$ grep -rn -E "## What it writes|## Grouping|The proposal for a recurring kind" skills utils docs README.md | grep -v '^skills/plan-retro/'

```

What a user reads differently, before and after:

- The flow: before, four sections, two of them numbered lists (What it reads, The proposal) and two prose (Grouping, What it writes); after, fifteen numbered steps, the decision on each proposal (Steps 10) the stop before any edit. The collector command, the threshold, the proposal order and the templates are unchanged.
- Use instead: new, naming `/refute` then `/land` for one step, and plan-orchestration's recurring-findings pass for the running plan.
- The refusal: before, "a required key missing is a refusal that names it"; after, the same, as a Stops row whose resume cell is "The key added, then `/plan-retro` again".
- The proposal order: before, three items, the third with two branches; after, four items, the third checkable by a command and the fourth not, tried in the same order.

Judgment calls:

- The old proposal item 3 held two branches (checkable by a command, and not); they are items 3 and 4, still tried in order.
- "A kind never merges two defects", "a proposal never loosens a rule" and "a number no collector line backs is not written" are Anti-patterns rows with their reasons.

## Repair round 1

Every finding of `12-refuter.md` is closed; none is booked. After the round: both checks print `ok:`.

| Finding | Closure |
|---|---|
| Steps 3, 7 and 10 each held more than one action | Split: count, name the heading, quote (3 to 5); show, take the decisions (9, 10); run, show the output (13, 14) |
| "approved" narrowed the check commands that are run | Steps 13: "Run each check proposal's command", the old words |
| Inventory rows covering several rules or pointing at the wrong place (old lines 3, 10, 27, 31) | Split and re-pointed, one rule per row |
| The report's grep sentence claimed a hit in refute; the verify lines were not quoted; the before and after was missing | Corrected above |
