# Step 5 report: plan restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/plan` | DONE | `ok: skills/plan/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md` |
| 3 | the verify list | DONE | seven `PASS:` lines (land, check_config, collect_findings, sync_rules, pin, check_skill_layout, check_rule_inventory); the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/plan/SKILL.md`, 33 lines before, 82 after; the inventory, 41 body rows.

Sections before: What it reads; What it writes; Rules. After: Quick start; Use instead (four rows); What it reads (three, the rules of plan.yaml as sub-bullets, where the other skills' "as `/plan` states them" still finds them); Steps (six: the folder, the draft, the approval, the state file, the empty folders, the commit); Stops (five: the drafted step list, and the four refusals, each stated only there); Anti-patterns (two); Rules (four).

Judgment calls:

- The old "What it writes" becomes Steps in the order the skill works; the closing step moves from Rules to step 2, where the step list is drafted.
- The refusals (no file, a missing required key, no entry, an existing folder) are rows of Stops, and the items where they arise point there, by the ruling in `plan.md`.
- "A step that cannot name its proof is not a step yet" is an anti-pattern row with its reason; "a step is one deliverable" stays in Rules.

## Repair round 1

Every finding of `5-refuter.md` is closed; none is booked. After the round: both checks print `ok:`, the inventory has 41 body rows, the file is 82 lines, and the ruling on the required tables is in `plan.md`.

| Finding | Closure |
|---|---|
| Steps 3 and Anti-patterns 1 both stated "show the draft, write after approval" | Anti-patterns 1's Do instead cell names Steps 3 |
| The four refusals stated in full in What it reads, Steps and Stops | Each is stated once, as a Stops row; What it reads 1 and 2 and Steps 1 point at "Stops" |
| Stops row 3 said "a key the plan needs", covering optional keys | It says "A required key is not in `plan.yaml`; the refusal names the key" |
| The title paragraph said the empty folders are committed | "`plan.md` and `orchestrator-state.md`, committed, and the empty `agents/briefs/` and `agents/reviews/`" |
| "The mechanical half ... the design half" was gone | It is Stops row 1's When cell, and the inventory row points there |
| The executor bullet held three rules; the closing bullet two | Split, one rule per bullet, one inventory row each |
| Inventory rows 15 and 16 pointed at places that did not hold them | Row 15 points at Quick start, whose first line states the invocation; row 16 at Stops 1 |
| Required columns holding text the old file does not state | Ruled by the orchestrator (plan.md): allowed where the layout requires the column and nothing in the old file is contradicted |
