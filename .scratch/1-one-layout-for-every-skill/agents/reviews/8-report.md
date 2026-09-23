# Step 8 report: land restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/land` | DONE | `ok: skills/land/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/land.md` |
| 3 | the verify list | DONE | seven `PASS:` lines, `land.test.sh` among them; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/land/SKILL.md`, 41 lines before, 114 after (`git diff --stat`: 95 insertions, 22 deletions); the inventory, 74 lines, 67 body rows.

Sections before: What it requires; What it does, in order (1 to 11 and 5a); The landing script; Rules. After: Quick start; Use instead (three); What it reads (five, the old "What it requires", whose conditions are the Stops rows the items name); Steps (1 to 11, the numbers unchanged, since plan-orchestration cites "its step 8" and the file cites its steps 5, 9 and 11); The look (the old 5a, named by step 5); The landing script; Stops (a red line for the user, then five refusals, then four bullets telling the stop and the refusals apart); Anti-patterns (one); Rules (two).

The grep for the removed section names and for "5a" over skills, utils, docs and README.md, and its output (nothing outside land):

```
$ grep -rn -E 'What it requires|What it does, in order|step 5a|5a\.' skills utils docs README.md | grep -v '^skills/land/'

```

What a user reads differently, before and after:

- The look: before, step "5a"; after, the section "The look", which step 5's last bullet names, run at the same point (after the checks on main, before the booking).
- The refusals: before, stated inside "What it requires"; after, rows of Stops (a missing key, no ledger folder, no dispatch block, the step not ready, main not clean), each item pointing there, the old line 15's three refusals listed separately in "The step not ready".
- A red line: before, "any other red line takes the step back out of main ... and booked"; after, the same in step 5, and only the red line the user must decide is a stop; one booked in the booked list is not.
- "Nothing is booked that was not re-read and re-run after its last fix": before, a rule; after, the anti-pattern row with its reason.

Judgment calls:

- The step numbers stay 1 to 11; each step's rules are sub-bullets.
- The red-line stop's row points at step 5 for how the failure is booked, as the plan's ruling on required tables asks.

## Repair round 1

Every finding of `8-refuter.md` is closed; none is booked. After the round: both checks print `ok:`, `land.test.sh` and the two check tests print `PASS:`, the ASCII check is clean.

| Finding | Closure |
|---|---|
| A step path carrying the user's unrelated change was no longer refused | Item 5 states all three conditions and "otherwise a refusal"; its bullet says only that the unrelated changes are listed and left alone; Stops "Main not clean" names the step's paths |
| "Neither report present" narrowed the old "neither of the two alternatives" | Item 4: "The refuter report is one of two: newer than the builder's report; or ... carrying a run over the last round"; "What falls short of these is a refusal"; Stops "The step not ready" states the conditions once |
| "the report's Closed heading" read as the builder's report | "the refuter report's Closed heading" |
| Every unfixed red line called a stop | Stops row 1 is "A red line for the user", when only the user can decide; the note under the table says a red line booked in the booked list is not a stop |
| Bullets with four and two rules in step 9, and the revert rule separated from its condition | Split, one rule per bullet; Rules 1 keeps "and the preparation commit stays" with the revert |
| Inventory row "the only way a step reaches main" pointed at Quick start, which did not hold it | Quick start's line states it |
| The dispatch block lost as a requirement | Item 3: "none is a refusal"; Stops "No dispatch block" |
