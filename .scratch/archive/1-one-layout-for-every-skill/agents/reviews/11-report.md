# Step 11 report: roadmap restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/roadmap` | DONE | `ok: skills/roadmap/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/roadmap.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md` |
| 3 | the verify list | DONE | seven `PASS:` lines; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/roadmap/SKILL.md`, 71 lines before, 136 after; the inventory, 80 lines, 73 body rows.

Sections before: an invocation block; What it reads; The format is the file's; A capability map beside the ordered file; add; move, done, drop; Writing; Rules. After: Quick start (the old block, with the `/roadmap <project> ...` line the old opening described); Use instead (two); What it reads (four); Steps (five shared steps, then `### Show`, `### add`, `### move`, `### done`, `### drop`, each numbered); The format is the file's (eight labelled bullets); A capability map beside the ordered file (six); Stops (five stops, five refusals, then two bullets telling them apart); Anti-patterns (four); Rules (four).

The grep for the removed section names over skills, utils, docs and README.md, and its output (nothing):

```
$ grep -rn -E "move, done, drop|## Writing" skills utils docs README.md | grep -v '^skills/roadmap/'

```

What a user reads differently, before and after: the invocations and `templates/roadmap.md` are unchanged. Each command's rules are now a numbered subsection of Steps, and the points where the skill asks or refuses are gathered in Stops. "Never renumbers an existing entry", "no narration in entry text" and "never deletes silently" are Anti-patterns rows with their reasons; "nothing is added that the user did not ask for" stays a rule (Rules 1). Every command drafts; nothing is written before the approval at Steps 4.

Judgment calls:

- The show command, which the old file described only in its invocation block and the capability-map section, has a two-item subsection of its own.
- The old heading "The format is the file's" has a row of its own, as the heading ruling allows.

## Repair round 1

Every finding of `11-refuter.md` is closed; none is booked. After the round: both checks print `ok:`.

| Finding | Closure |
|---|---|
| `done` and `drop` edited the roadmap before the approval | Steps 2 drafts the change ("nothing is written yet"); `done` 2 and 3 and `drop` 1 draft; Steps 4 writes after the approval |
| "The introduction's rules bind the skill" widened the old "these rules" | "The status rules": the rules the introduction attaches to the status vocabulary bind the skill |
| "Nothing is added that the user did not ask for" narrowed and moved to Anti-patterns | Rules 1 states it; the Anti-patterns row names Rules 1 |
| "Deleting a dropped entry" strengthened the old "never deletes it silently" | "Deleting a dropped entry silently" |
| The capability and Levels bullets held several rules | Split, one rule per bullet |
| "Asked about once ... used from then on" written twice | Only in Stops row 4; the bullet points at "Stops" |
| `add` 3 did not point at the missing-dependency stop | It does; Stops row 5 shows the dependency as a question in the draft, not added as an entry |
| Use instead repeated the no-configuration refusal | The row is removed |
| One paragraph held the stop and refusal rules | Two bullets |
| Inventory rows for old lines 3 and 10 covered several rules | Split, one row per rule, each pointing where its rule is |
