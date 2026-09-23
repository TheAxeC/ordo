# Step 6 refuter report (on .agents/worktrees/1-6, base f884b03)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/spec
ok: skills/spec/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/spec.md
64
$ wc -l skills/spec/SKILL.md
     110 skills/spec/SKILL.md
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
$ git status --short
 M skills/spec/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/spec.md
$ git diff f884b03 --stat
 skills/spec/SKILL.md | 114 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 85 insertions(+), 29 deletions(-)
$ git show a682c14:skills/spec/SKILL.md | wc -l
      54
```

## 1. Spec

- skills/spec/SKILL.md:71 (with :30, :33, :35, :37, :45): the old file calls the conditions of old lines 14-16 "a refusal" and keeps "a stop" for the premise, scope and user-visible cases (old :10, :21, :51). The new file calls every refusal "a stop", and When it stopped bullet 1 says "A stop leaves three things and nothing else: the open item in the state file ...; the same text under the step's Step 0 ...; the ledger committed by path". By the new text a missing `plan.yaml` key, a missing ledger folder, a step in flight and a step not in the list must each write an open item and commit the ledger. That rule now covers more than it did, and for "No ledger folder" it cannot be carried out. :73 ("The user closes the stop by typing the ruling") is widened the same way and contradicts Stops rows 5-8's What resumes it.
- skills/spec/SKILL.md:97: "The dispatch block holds another step, and the block allows one". Old :15 says "a step already in flight is a refusal that names it, unless the block allows more than one". "another step" drops the case where the step in flight is the same step. "the block allows one" now takes the dispatch block as its antecedent, but the limit is the configuration block's `workers_at_once`, and the dispatch block holds no limit.
- skills/spec/SKILL.md:35 and :97: the "unless the block allows more than one" condition is written twice, in two wordings that differ (see the finding above). The ruling says the item points at the Stops row.
- skills/spec/SKILL.md:47 and :48: the same rule is written twice. Bullet 1 says "the brief is not written until the plan's text is corrected", and bullet 2 says "The correction is made in the plan before the brief exists". The old file had it twice (old :10 and :51), but the brief says "each written once".
- skills/spec/SKILL.md:10: "It leaves behind the brief, the step's worktree at the base, the staged base binaries and the dispatch block, each committed where it belongs." This is added text and it is false: the worktree is created and not committed, and the base binaries are "copied aside" (old :24, new :62) and not committed. Old :10's second sentence was moved elsewhere, so this sentence has no source.
- skills/spec/SKILL.md:10 and :15: "writes the one file a builder works from and puts the tree in the state the builder expects" appears in the intro and again in the Quick start comment.
- skills/spec/SKILL.md:16 and :85: "the session books it, and /spec runs again" and "Then `/spec <entry> <step>` runs again" leave out who runs it. Old :43-47 gives the command in a code block as what is typed next, after "books the ruling and nothing else" (old :41). skills/plan-help/SKILL.md:37 has the user type it ("/spec <entry> <step>   again; it now writes the brief").
- skills/spec/SKILL.md:96: "No folder under `<ledger_root>/` opens with `# Plan: <entry>`". It is the folder's `plan.md` that opens with the heading (old :14; new :31 says it correctly).
- .scratch/1-one-layout-for-every-skill/inventories/spec.md:66: row 51, "A correction that changes the step's scope is a stop, booked in the open items | Steps 2". The booking is in Stops 2 (SKILL.md:92), and no inventory row points at Stops 2. The other refusals and stops point at their Stops row (rows at :18, :21, :24, :26, :28, :37, :52).
- .scratch/1-one-layout-for-every-skill/inventories/spec.md:17: row 10, "/spec writes the one file ... | Quick start". The sentence is also the new intro (SKILL.md:10), which is where it sits in full.

## 2. Proof

- .scratch/1-one-layout-for-every-skill/agents/reviews/6-report.md:13: "Files: ... the inventory, 64 body rows". The row count reproduces (grep: 64), but change-standard rule 7 asks for every changed file with its line count, and the report gives none for the inventory (wc -l: 71).
- Otherwise none: layout ok, inventory ok, seven PASS lines, a clean ASCII check and 54 to 110 lines all reproduce.

## 3. Standards

- skills/spec/SKILL.md:69: the heading "When it stopped" is a clause, not a noun-phrase label (docs/dev/skill-layout.md:29 "Each heading is a noun-phrase label"; anti-pattern at :66).
- skills/spec/SKILL.md:73-85: the booking of a ruling is an invocation's execution sequence (Quick start :16 lists `Ruled:` as its own entry): book, then commit the ledger (:84), then run /spec (:85). It is written as unordered bullets in a reference section. docs/dev/skill-layout.md:28 gives a mode its own `### <name>` subsection with a numbered list under Steps, and :46 says "A numbered list means order. An unordered set is a bulleted list."
- 6-report.md (whole): change-standard.md rule 14 requires the report to quote the grep for renamed or removed names. The old section names "What it writes" and "Preflight, before any write", and the old term "refusal", are gone, and the report quotes no grep. The reviewer's grep over skills, utils, docs and README.md finds no remaining reference to the removed spec sections: "What it writes" hits only plan-retro's and refute's own sections.
- 6-report.md (whole): change-standard.md rule 7 requires "every user-visible change with the before and after". The report lists section names but gives no before and after for the changed text a /spec user reads (the intro sentence, "refusal" becoming "stop", the Stops table's added What resumes it text).

## 4. Behaviour

- A session running /spec by the new text, on a missing `plan.yaml` key, a missing ledger folder, a step in flight or a step not in the list, would write an open item into `orchestrator-state.md`, copy it under Step 0 in `plan.md` and commit the ledger (SKILL.md:71 applied to :30-:37). The old file only refused and named the cause.
- A second /spec on the step that is already in flight (the same step, with `workers_at_once: 1`) is not refused by Stops row 7 as written ("holds another step"), so it could go on to a second preparation commit and a second `git worktree add` (SKILL.md:97).
- After booking a `Ruled:` reply, a session could run /spec itself in the same turn, reading "the session books it, and /spec runs again" (SKILL.md:16, :85), where the old file says it books "and nothing else" and plan-help has the user type /spec.

## Not checked

- Whether `utils/check_rule_inventory.py` counts the When it stopped bullets across the code block as items 1 to 5. The inventory's item numbers were checked by hand against the rendered order, not against the checker's parsing rules.

Reviewer usage: 11 tool uses, about 12 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/spec
ok: skills/spec/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/spec.md
64
$ wc -l skills/spec/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
     114 skills/spec/SKILL.md
      71 .scratch/1-one-layout-for-every-skill/inventories/spec.md
     185 total
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...' (exactly as in docs/dev/building.md)
(no output, exit 0)
$ git status --short
 M skills/spec/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/spec.md
$ git diff f884b03 --stat
 skills/spec/SKILL.md | 132 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 96 insertions(+), 36 deletions(-)
$ grep -rn -E 'What it writes|Preflight, before any write|When it stopped' skills utils docs README.md
skills/plan-retro/SKILL.md:43:## What it writes
skills/refute/SKILL.md:36:## What it writes
```

- skills/spec/SKILL.md:95 (against :91): the round closed the refusal/stop finding by defining the terms at :91 ("the rest are refusals, which name their cause and leave nothing"). Stops row 1 is one of the three stops, but its When cell still says "the skill refuses rather than guesses". Under the file's own definition that reads as a refusal, which leaves nothing, while the row's What it shows is an open item. The old :10 used "refuses" loosely because the old file had no such definition. The closure made row 1 contradict :91. Spec.
- skills/spec/SKILL.md:35: closing the "written twice" finding moved the condition "unless the block allows more than one" to Stops row 7 only (:101). That wording is faithful to old :15. But the pointer bullet in What it reads 3 now states the refusal with no condition: "A step already in flight is a refusal ("Stops")". That is false when `workers_at_once` is above 1. docs/dev/skill-layout.md:45 says a qualifier that changes the rule stays in the same bullet, and the anti-pattern at :62 covers the same case. The ruling at plan.md:51 asks for a pointer, not a restatement without its condition. Something like "is a refusal under the condition in "Stops"" would keep the pointer true. Standards.
- skills/spec/SKILL.md:47: the closure claimed for "Step 2's two bullets said the same thing" is "One bullet". The bullet still says the same rule twice: "the brief is not written until the plan's text is corrected" and "the correction is made in the plan before the brief exists". Only "never left for the builder to hit" adds anything. The duplication moved inside one sentence and was not removed (docs/dev/skill-layout.md:41, :63). Standards.
- skills/spec/SKILL.md:99: Stops row 5 names the file as `plan.yaml`. docs/dev/skill-layout.md:55 asks for a repository path relative to the root, which is `.agents/plan.yaml`, as :30 and old :14 write it. Standards.
- 6-report.md:22: the closure claimed for the missing grep is "Added above". The line paraphrases a `grep -rn` "over skills, docs and README.md" but does not quote the command or its output. It also leaves out `utils/`, which docs/dev/change-standard.md rule 14 names. The reviewer's rerun over all four paths (above) confirms the paraphrased result. Proof.
- 6-report.md:28: the before and after for refusals and stops says "the same words". The preflight's wording changed from old :29 "stops the skill with what it saw" to "is a refusal" (new :45), and it is now classed with the rows that "leave nothing" (:91). The meaning holds, because the preflight runs before any write. The report still does not show this user-visible rewording (change-standard rule 7). Proof.
- Checked, no defect found: the ruling sequence at :73-87 matches old :35-47 ("books the ruling and nothing else", then `/spec <entry> <step>` typed again) and skills/plan-help/SKILL.md:35-37. Stops rows 1-3, the stops that write an open item, match plan-help :35 ("a premise ... wrong on the tree, or a choice is yours"). Stops row 7 matches old :15 in meaning, and the configuration block is the correct antecedent (`workers_at_once`, plan-orchestration :45, :129). Row 7 does not refuse a re-run of the same step when `workers_at_once` is above 1, and neither did the old file. Every one of the 64 inventory rows names a section and item that exist and hold its rule after the moves under Steps: A stop 1-2, A ruling 1-3, Stops 1-8, What it reads 1-5, Steps 1-7, Anti-patterns 1-3, Rules 1. Row 66 now points at Stops 2. The dispatch block's fields, the worktree command, the brief's contents and the ruling's form are unchanged in meaning. Spec.

Reviewer usage: 14 tool uses, about 15 minutes.

## Closed

Round 1's findings are closed in the round (`6-report.md`). The run over round 1 is closed at landing:

- Stops row 1 said the skill "refuses", against the definition of a refusal: it says "the skill does not guess".
- What it reads 3 stated the in-flight refusal without its condition: "A step already in flight is a refusal, under the condition in "Stops"".
- Step 2's bullet still said its rule twice: "A premise found false is a stop ("Stops"): the plan's text is corrected before the brief exists, never left for the builder to hit."
- Stops row 5 named `plan.yaml`: it names `.agents/plan.yaml`.
- The report's grep and the preflight's rewording: `6-report.md` quotes the grep with `utils/` and its output, and the before and after of the preflight's wording.
