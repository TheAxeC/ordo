# Step 10 report: ordo-init restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/ordo-init` | DONE | `ok: skills/ordo-init/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md` |
| 3 | the verify list | DONE | seven `PASS:` lines; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/ordo-init/SKILL.md`, 57 lines before, 108 after; the inventory, 77 lines, 70 body rows.

Sections before: What it reads; Drafting the file; Ignore rules; Approval, then writing; Checking an existing file; Rules. After: Quick start; Use instead (three); What it reads (three); Steps (fourteen, in the order the skill works, one action each: the form, each key, the optional keys, the comments, the ignore rules drafted, the showing, the stop, the writing, the check, the commit; then `### Checking an existing file`, six); Stops (five: the draft, several roadmaps, worker and reviewer, a failing command, a fix in the check, each cell pointing at its step); Anti-patterns (two, pointing at Rules); Rules (five).

The grep for the removed section names over skills, utils, docs and README.md, and its output (nothing):

```
$ grep -rn -E 'Drafting the file|Approval, then writing|Ignore rules' skills utils docs README.md | grep -v '^skills/ordo-init/'

```

What a user reads differently, before and after: the drafting, the ignore rules and the approval were three sections of prose; after, twelve numbered steps in the order the skill runs them, with the points where the user answers gathered in Stops. "It does not invent a rule" and "never overwrites" are Anti-patterns rows with their reasons; "writes nothing until the user approves", "draws only from the repository and the user" and "a change to an existing file is shown as a diff" are Rules, holding for everything the skill writes.

Judgment calls:

- The heading "Ignore rules" of the old file has a row of its own, as the heading ruling allows, pointing at step 9.
- Asking for the worker and the reviewer, choosing among several roadmaps, and deciding on a failing command are Stops rows, since each waits on the user's answer.

## Repair round 1

Every finding of `10-refuter.md` is closed; none is booked. After the round: both checks print `ok:`.

| Finding | Closure |
|---|---|
| "Writes nothing until the user approves" lived only in a Stops cell, and step 9 added a `.gitignore` line before the approval | Rules 1 states it; step 9 drafts the ignore lines ("the draft adds"), and nothing is written before step 12 |
| "Draws only from the repository and the user" narrowed to pages | Rules 2: "for the file it drafts and for every page" |
| The diff rule narrowed to pages and `.agents/plan.yaml` | Rules 4: "A change to an existing file, `.gitignore` included, is shown as a diff and approved like the draft"; step 10 shows "a diff of any it would rewrite" |
| Citing written twice | Rules 3 only; Anti-patterns 1 names Rules 2 and 3 |
| Stops cells restating steps 10, 6 and 3 | They name the step: "What Steps 10 lists", "The offered answer Steps 6 names", "What Steps 3 shows beside it" |
| "From the repository root" twice | Only in Steps |
| Bullets with two rules in steps 3 and 9 | Split |
| Steps 10 and 11 with more than one action | Steps 10 to 14, one action each |
| The check mode reran the check unconditionally | "After the fixes, run the check again" |
| Inventory rows covering several rules or pointing at places that did not hold them | Split and re-pointed |
