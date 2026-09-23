# Step 7 refuter report (on .agents/worktrees/1-7, base bfc8370)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/refute
ok: skills/refute/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/refute.md
74
$ wc -l skills/refute/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/refute.md
     126 skills/refute/SKILL.md
      81 .scratch/1-one-layout-for-every-skill/inventories/refute.md
     207 total
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...' (as in docs/dev/building.md)
(no output, exit 0)
$ git diff --stat bfc8370
 skills/refute/SKILL.md | 124 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 103 insertions(+), 21 deletions(-)
$ grep -rn -E 'What the reviewer looks for|What the reviewer runs|The runs over the repair rounds|What it writes' skills utils docs README.md | grep -v '^skills/refute/'
skills/plan-retro/SKILL.md:43:## What it writes
skills/plan-orchestration/SKILL.md:117:- The runs over the repair rounds follow `refute_after_repair`, and under `earned` they run only on a step whose first review ran.
$ git log --oneline -3 -- .scratch/1-one-layout-for-every-skill/plan.md   (main)
d540160 Book the user's ruling on where the last round's findings go
```

## 1. Spec

- skills/refute/SKILL.md:68 (Over a repair round 7): "or booked in the state file's open items". plan.md:52, the user's ruling committed at d540160 (after bfc8370): the last round's findings not fixed at landing are booked as their own step in the state file's booked list, never in the open items, and "refute's old sentence that said 'open items' is corrected in step 7". The item must say booked as its own step in the booked list (or point at "After the review" 1, which already says so, and then the rule is written once). Inventory row 66 (inventory line 66) carries the same "booked in the open items" text and must change with it; the report's judgment call (7-report.md:33) keeps both sentences on a ground the ruling overrides.
- skills/refute/SKILL.md:54 (Steps 7): old line 38 says "(the reviewer never writes into the ledger itself)"; Steps 7 says only that the orchestrator or the session saves the report. The negation is dropped from the place the inventory names (inventory line 73 claims Steps 7 holds "the reviewer never writes into the ledger").
- skills/refute/SKILL.md:67 (Over a repair round 6): "It appends its findings to the same file under 'Repair round <n>, refuted'". "It" is the reviewer (items 4 and 5 use the same subject), so the item has the reviewer write into the ledger file. Old line 38 had "Each run over a repair round appends", followed by "The orchestrator or the session saves it there (the reviewer never writes into the ledger itself)". Changed in meaning; it also contradicts Anti-patterns row 2 (line 119).
- skills/refute/SKILL.md:43 (Steps 1, second-level bullet): old line 42 was a Rule holding throughout ("every time, never the builder, never the session that wrote the brief"). It is now under Steps 1 of the first-run sequence only; Over a repair round 1 (line 58) says only "on a fresh reviewer each time" and does not point at it. That is a move under a condition that narrows what it covers: the runs over the repair rounds no longer carry "never the builder" or "never the brief's writer". skill-layout.md:40 puts a rule that holds throughout the skill in Rules.
- skills/refute/SKILL.md:98-102 (`## After the review`): three rules put in a reference section. skill-layout.md row 6 (line 29) limits reference sections to "material the steps point at", and no step or item points at "After the review" (grep of the file finds only the heading). skill-layout.md:38-40 places a rule at one point of the work in a step's item, and one that holds throughout in Rules. The heading is also a prepositional phrase, where line 29 requires a noun-phrase label.
- skills/refute/SKILL.md:100: one bullet holds two rules, the ways a finding is closed or booked, and "the open items hold only what the user must rule on". The inventory counts them as two rules (lines 76 and 77, both at "After the review 1"). skill-layout.md:45: one rule per bullet.
- skills/refute/SKILL.md:118, 120, 121 (Anti-patterns Do instead cells): row 1 "Findings with a file and a line, or 'none' under a heading" restates Steps 6; row 3 "Run what the brief lists and what the report quotes" restates Steps 3 and 4; row 4 "Name it under what was not checked" restates Steps 6 (third bullet) and Rules 2. plan.md:51 ruling: a Do instead cell that would repeat a step's rule names the step.
- skills/refute/SKILL.md:120: "Background shells, polling, benchmark suites, or sanitizer runs the brief does not list", with Do instead "Run what the brief lists". Old line 30 says "No background shells, no polling, no benchmark suites, no sanitizer runs unless the brief lists them", where the "unless" reads most naturally as attaching to the last item. The new row applies the exception to all four, so a background shell or polling the brief lists becomes allowed. docs/dev/change-standard.md:35 bans background shells and polling outright, apart from the one capture it names. This is a possible widening; the row should keep the ban on background shells and polling unconditional.
- skills/refute/SKILL.md:104-112 (Stops): skill-layout.md:30 says "A skill that never stops has one row that says so". The file says it in a sentence above the table (line 106) and has no such row. The table holds refusals only, under a column headed Stop.
- .scratch/1-one-layout-for-every-skill/inventories/refute.md:12: "Run once per step before its first round, and again over each round ..." points at "Steps / Over a repair round 1". That item holds only the "again over each round" half, and "once per step before its first repair round" is stated nowhere in the body. The row also covers two rules.
- .scratch/1-one-layout-for-every-skill/inventories/refute.md:16: "One reviewer that changes nothing, on the model reviewer: names | Steps 1". Steps 1 (line 42) does not hold "changes nothing" (that is in line 10 and Anti-patterns 2), and the row covers two rules.
- .scratch/1-one-layout-for-every-skill/inventories/refute.md:22: "The ledger folder and orchestrator-state.md ... | What it reads 3". The ledger folder is What it reads 2, and the row covers two inputs.
- .scratch/1-one-layout-for-every-skill/inventories/refute.md:73: points at Steps 7 for "the reviewer never writes into the ledger", which Steps 7 does not hold (see the second finding).

## 2. Proof

- none. Every number and output the report quotes was reproduced: 126 lines, 81 lines, 74 rows, 103 insertions and 21 deletions, both `ok:` lines, seven `PASS:` lines, the empty ASCII check, the grep output, and the section counts.

## 3. Standards

- skills/land/SKILL.md:15: "closed under its Closed heading or booked in the state file's open items". Once refute is corrected to the plan.md:52 ruling, this sentence is false. docs/dev/change-standard.md:26 (rule 14) requires carrying the change to every place that names it, or saying why not. The report says neither (land is restyled in step 8, which the report could name as the reason).
- .scratch/1-one-layout-for-every-skill/agents/reviews/7-report.md:3: "Everything in the brief is done" and the judgment call at line 33 leave the plan.md:52 ruling unmet. docs/dev/change-standard.md:19 (rule 7) and :24 (rule 12).

## 4. Behaviour

- A reviewer following Over a repair round 6 (line 67) appends its findings to `agents/reviews/<step>-refuter.md` itself. Under the old file it never wrote into the ledger, and the orchestrator saved the report. The report does not state this change.
- An orchestrator following Over a repair round has no item that saves the run's report, records its usage and commits by path. Only Steps 7 of the first-run sequence says so, and old line 38 covered every run. plan-orchestration's SKILL.md:69 still records usage for the runs over the rounds, but the save and the commit for a round's run are no longer stated in `refute`.
- An orchestrator choosing the reviewer for a run over a repair round reads only "a fresh reviewer each time" (line 58), without "never the builder, never the session that wrote the brief" (now only under Steps 1).
- An orchestrator following line 68 books the last round's unfixed findings in the open items, against the plan.md:52 ruling. It also conflicts with line 100 of the same file, so a reader cannot tell which of the two holds.

## Not checked

- nothing.

Reviewer usage: 11 tool uses, about 15 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/refute
ok: skills/refute/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/refute.md
79
$ wc -l skills/refute/SKILL.md
     129 skills/refute/SKILL.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...' (as in docs/dev/building.md)
(no output, exit 0)
$ git diff --stat bfc8370
 skills/land/SKILL.md   |   2 +-
 skills/refute/SKILL.md | 127 +++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 107 insertions(+), 22 deletions(-)
$ wc -l .scratch/1-one-layout-for-every-skill/inventories/refute.md
      86 .scratch/1-one-layout-for-every-skill/inventories/refute.md
$ grep -rn 'open items' skills docs README.md | grep -v '^skills/refute/'   (relevant hits)
skills/land/SKILL.md:24: ... any other red line takes the step back out of main ... and booked in the state file's open items with the failure, never back to the builder.
skills/land/SKILL.md:25: ... What is wrong in them is fixed at landing when it is small and inside the brief, and booked in the open items otherwise. ...
skills/plan-orchestration/SKILL.md:76: - A red line the orchestrator cannot fix at landing ... is booked with the failure: in the open items when only the user can decide what to do, in the booked list otherwise.
skills/plan-orchestration/SKILL.md:177: - The open items hold only what the user must rule on: a stop, and a proposal of the recurring-findings pass.
```

- skills/refute/SKILL.md:127 (Rules 2): "The reviewer never writes into the ledger itself; the orchestrator or the session saves every report." The second clause restates Steps 7 (line 53, "The orchestrator or the session saves the report ...") and "Over a repair round" 6 (line 67, "The orchestrator or the session appends the run's findings ..."). That puts one rule in three places, and two rules in one bullet. docs/dev/skill-layout.md "Where a rule goes", last bullet: a rule is written once, and another place names its section. The closure of the round's "reviewer appended its own findings" finding (7-report.md:44) holds for "Over a repair round" 6. This bullet is what that closure added. Spec.
- skills/land/SKILL.md:24 and :25: 7-report.md:43 says land's step 5 red line booked in the open items "is taken up in step 8, `land`'s restyle". Nothing books it. The state file's "Booked, no ruling needed" section reads "- none." (orchestrator-state.md). plan.md step 8 reads "land restyled, with its inventory; same proof", and a restyle keeps meaning, so step 8 as written cannot change this rule. Land:24 still contradicts plan-orchestration:76, which splits red lines between the open items and the booked list. It also contradicts plan-orchestration:177 and refute's Finding dispositions 2 (line 101), which say the open items hold only what the user must rule on. Land:25 books a look defect that is not small in the open items on the same pattern, and the report does not name it. docs/dev/change-standard.md rule 12: a miss is never reported as a later item. The rule in ~/.claude/rules/never-take-the-lazy-option.md: a booking names where it is booked. Standards.
- .scratch/1-one-layout-for-every-skill/agents/reviews/7-report.md:13, 15, 27-29, 33: the body of the report no longer matches the tree after the round. Line 13 says 126 lines, 81 inventory lines and 74 rows. The rerun gives 129, 86 and 79, and the round section (line 38) states 129 and 79 but never states the inventory's 86 lines. Line 15 lists "Steps (seven ...)", "After the review", "Stops (three refusals, no stop)", "Anti-patterns (four)" and "Rules (two)". The file has eight Steps items, "Finding dispositions", a "No stop" row plus three refusals, five Anti-patterns rows and four Rules. Line 28 says "no background shells ..." became one Anti-patterns row; it is now two rows. Line 29 says "it is also Rules 1"; the item is Rules 3 (SKILL.md:128). Line 33 still carries the withdrawn judgment call. docs/dev/change-standard.md rule 7: the report states the end state only. Proof.
- skills/land/SKILL.md:15, the ruling carried: it now reads "booked as its own step in the state file's booked list", which matches plan.md's ruling (never the open items) and refute's Finding dispositions 1 (line 100). Refute's wording is "booked as its own step in the plan and carried in the state file's booked list", and land drops "in the plan". The meaning holds, since plan-orchestration:73 uses refute's wording. The closure holds, with no new defect beyond the land:24/:25 bullet above. Behaviour.
- The other closures claimed in 7-report.md:42-51 hold, and the pointers resolve:
  - "Over a repair round" 7 (line 68) points at Finding dispositions, which books a finding in the booked list.
  - Rules 1 (line 126) covers every run, and "Over a repair round" 1 names it.
  - "Finding dispositions" is a noun-phrase heading, pointed at from Steps 8 (line 54) and "Over a repair round" 7, with its old first bullet split into lines 100 and 101.
  - Anti-patterns rows 1 and 5 point at Steps 6, and row 4 points at Steps 3 and 4. Each step holds what its row points at.
  - Background shells and polling are unconditional (row 3); the "unless the brief lists them" exception is kept for benchmarks and sanitizers only (row 4).
  - Stops row 1 says the skill never stops.
  - Steps 1 holds "once per step before its first repair round".
  - Every inventory row pointing at a renumbered item names the right item: Stops 2/3/4, Anti-patterns 2/3/4/5, Rules 1/2/3/4, Finding dispositions 1-4, "Over a repair round" 6/7/8, Steps 1/6/7.
  - A final read of old lines 1-44 against the new file finds no other rule dropped or changed in meaning. Spec.

Reviewer usage: 12 tool uses, about 12 minutes.

## Closed

Round 1's findings are closed in the round (`7-report.md`). The run over round 1 is closed at landing:

- Rules 2 restated who saves the report: it says only "The reviewer never writes into the ledger itself."
- `land`'s step 5 booked a red line in the open items, and its step 5a a look defect that is not small, against the user's ruling that the open items hold only what the user must rule on: step 5 books the red line "in the open items when only the user can decide what to do, in the booked list otherwise", as plan-orchestration's step 9 does; step 5a books the look defect "as its own step in the booked list". Carried in this step, not deferred.
- The report's body described the state before the round: `7-report.md` is rewritten to the end state.
