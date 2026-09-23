# Step 7 report: refute restyled

Everything in the brief is done, with the user's ruling that the last round's unfixed findings are booked in the booked list, never in the open items, applied in refute and carried into land.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/refute` | DONE | `ok: skills/refute/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/refute.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md` |
| 3 | the verify list | DONE | seven `PASS:` lines; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/refute/SKILL.md`, 44 lines before, 129 after; `skills/land/SKILL.md`, three sentences changed (+3 -3); the inventory, 86 lines, 79 body rows.

Sections before: What it reads; What the reviewer looks for; What the reviewer runs; The runs over the repair rounds; What it writes; Rules. After: Quick start; Use instead (four); What it reads (six); Steps (eight, then `### Over a repair round`, eight); The four headings (each heading's findings one per bullet); Finding dispositions (four); Stops (a "No stop" row, then three refusals); Anti-patterns (five); Rules (four).

The grep for the removed section names over skills, utils, docs and README.md, and its output (plan-orchestration's own sentence and plan-retro's own section):

```
$ grep -rn -E 'What the reviewer looks for|What the reviewer runs|The runs over the repair rounds|What it writes' skills utils docs README.md | grep -v '^skills/refute/'
skills/plan-retro/SKILL.md:43:## What it writes
skills/plan-orchestration/SKILL.md:117:- The runs over the repair rounds follow `refute_after_repair`, and under `earned` they run only on a step whose first review ran.
```

What a user reads differently, before and after:

- The reviewer's reading, running and writing: before, three prose sections; after, Steps 1 to 8 and "Over a repair round", in the order the review runs.
- Who writes the refuter report: before, "the orchestrator or the session saves it there (the reviewer never writes into the ledger itself)"; after, the same, as Steps 7, "Over a repair round" 6 and Rules 2.
- Where the last round's unfixed findings go: before, "booked in the state file's open items" in one sentence and "the booked list" in another; after, the booked list only, by the user's ruling.
- In land: a finding after the rounds "booked in the state file's open items" became "booked as its own step in the state file's booked list"; a red line at landing "booked in the state file's open items" became "in the open items when only the user can decide what to do, in the booked list otherwise", as plan-orchestration's step 9 says; a look defect that is not small, "booked in the open items", became "booked as its own step in the booked list".
- Background shells and polling are forbidden without exception; benchmark suites and sanitizer runs only when the brief does not list them. "Treats an unreproduced claim as a finding", before only in the description, is also Rules 3.

Judgment calls:

- The report's headings in `templates/report.md` are unchanged and match "The four headings" and Steps 6.
- The three land sentences are carried in this step because the user's ruling makes them false; land's restyle in step 8 starts from the corrected text.
