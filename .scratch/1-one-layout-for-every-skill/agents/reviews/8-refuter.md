# Step 8 refuter report (on .agents/worktrees/1-8, base 8a72df7)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/land
ok: skills/land/SKILL.md
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/land.md
61
$ wc -l skills/land/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/land.md
     109 skills/land/SKILL.md
      68 .scratch/1-one-layout-for-every-skill/inventories/land.md
     177 total
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
$ git diff 8a72df7 --stat
 skills/land/SKILL.md | 112 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 22 deletions(-)
$ grep -rn -E 'What it requires|What it does, in order|step 5a|5a\.' skills utils docs README.md | grep -v '^skills/land/'
(no output, exit 1)
```

## 1. Spec

- skills/land/SKILL.md:37-39 and :95: old line 16 requires that "none of the step's paths carry[] an unrelated change of the user's". The new item 5 states the condition on line 37, but line 38 says "An unrelated change of the user's is listed by path and left alone" and line 39 says "Anything else is a refusal", so a step path carrying the user's unrelated change now falls under "listed and left alone", not a refusal. The Stops row "Main not clean" (line 95) names only "Something staged, or a git operation in progress". The requirement on the step's own paths is lost as a refusal.
- skills/land/SKILL.md:36 and :94: old line 15 reads "either `<step>-refuter.md` newer than the report or, after the step's repair rounds, the refuter report carrying a run over the last round ... Neither present ... is a refusal". "Neither" means neither of those two alternatives. The new line 36 says "Neither report present", which refuses only when both files are absent. The Stops row (line 94) says "A report missing". The two places disagree with each other, and neither refuses a refuter report that is older than the builder's report when there has been no repair-round run, which the old text refused. The refusal is also written twice, with its conditions restated at line 36 rather than only pointed at, against the ruling that a refusal is stated once as a row of Stops.
- skills/land/SKILL.md:35: "closed under the report's Closed heading". In item 4, "the report" is the builder's `<step>-report.md` (line 34: "newer than the report"), so this now reads as the builder report's Closed heading. The old "its Closed heading" referred to the refuter report, which is where the Closed heading lives (`skills/refute/templates/report.md:42`).
- skills/land/SKILL.md:91: the row "A red line" calls every unfixed red line a stop, including the case line 53 books in the booked list "otherwise", when the decision is not the user's. That use of "stop" goes against the definitions in the restyled skills: in spec (`skills/spec/SKILL.md:91`) a stop leaves an open item, and in plan-orchestration (`skills/plan-orchestration/SKILL.md`, Stops) "A stop is for a decision that is the user's" and "is booked in the state file's open items". The added What resumes it cell, "the booked step done, then `/land` again", is also not in the old file. It does not match plan-orchestration step 9 to 10, where a booked red line becomes its own step and the loop continues with step 2.
- skills/land/SKILL.md:65: one bullet holds four rules (the message in the repository's shape, its last bullet the booking, no attribution, never push). Inventory row 55 (inventories/land.md:55) likewise covers four rules.
- skills/land/SKILL.md:66: one bullet holds two rules (afterwards `git status --short` shows nothing of the step's or the ledger's; a ledger file left modified means the head is amended with the ledger paths). Inventory row 56 covers both.
- skills/land/SKILL.md:107-108: old line 39 says "undoing a step is `git revert` of that commit; the preparation commit stays". The new line 108, "The preparation commit stays, and a reverted step is booked as reverted", is separated from the revert that is its condition, so it reads as an unconditional rule. That breaks the layout's rule that a qualifier which changes a rule stays in the same bullet (`docs/dev/skill-layout.md`, Lists and tables), and the bullet holds two rules. Inventory row 66 covers two rules.
- .scratch/1-one-layout-for-every-skill/inventories/land.md:14: "/land is the only way a step reaches main | Quick start". Quick start (skills/land/SKILL.md:14-16) does not hold this rule. It is in the title paragraph, line 10.
- skills/land/SKILL.md:32: old line 14 lists "the dispatch block naming this step with its worktree and base" under "What it requires". The new file makes it a read with no refusal and no Stops row, so a missing dispatch block is no longer treated as a requirement. Inventory row 19 records it only as "What it reads 3".

## 2. Proof

- none.

## 3. Standards

- skills/land/SKILL.md:65, :66, :108: one rule per bullet (`docs/dev/skill-layout.md`, Lists and tables, first bullet); see Spec.
- skills/land/SKILL.md:36: "A rule is written once. Another place that needs it names the section it is in" (`docs/dev/skill-layout.md`, Where a rule goes), and the plan's ruling that a refusal is stated once, as a row of Stops. Line 36 restates the refusal's conditions, and they differ from line 94.

## 4. Behaviour

- An orchestrator landing by the new file does not refuse when one of the step's paths on main carries an unrelated change of the user's. It lists the change and goes on to the cherry-pick onto that path. The old file refused. The source is skills/land/SKILL.md:37-39 and :95.
- An orchestrator lands a step whose refuter report is older than the builder's report and has no run over a repair round, as long as both files exist (line 36). The old file refused.
- An orchestrator may look for the Closed dispositions in the builder's report rather than the refuter report (line 35).
- After a red line booked in the booked list, an orchestrator following the Stops row (line 91) would treat the landing as a stop and run `/land` again for the same step after the booked step is done. Plan-orchestration step 9 to 10 instead continues the loop.
- The order of the look against the checks and the booking (step 5's last bullet, then steps 6 and 7) and the order of the landing report (step 11, written before step 9's commit) against the commit are unchanged: none.

## Not checked

- nothing.

Reviewer usage: 11 tool uses, about 12 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/land
ok: skills/land/SKILL.md
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/land.md
67
$ wc -l skills/land/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/land.md
     113 skills/land/SKILL.md
      74 .scratch/1-one-layout-for-every-skill/inventories/land.md
     187 total
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...' (docs/dev/building.md:13, verbatim)
(no output, exit 0)
$ git status --short
 M skills/land/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/land.md
$ git diff 8a72df7 --stat
 skills/land/SKILL.md | 116 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 94 insertions(+), 22 deletions(-)
```

- skills/land/SKILL.md:34 and :98: the claimed closure of the "Neither" finding changed a different condition. Old line 15 lists three separate refusals: "Neither present, a run over the last round owed and missing, or a finding left open and unbooked". The new item 4 ("one of two: newer than the builder's report; or ... carrying a run over the last round") and the Stops row "The step not ready" ("neither newer than it nor carrying the run over the last round ... that is owed") merge "a run over the last round owed and missing" into the two-way choice. Now a refuter report that is newer than the builder's report meets the requirement even when a run over the last round is owed and missing. The old text refused that case. The claim in 8-report.md:27, "with the old conditions unchanged", does not hold for this condition. Spec.
- skills/land/SKILL.md:101, :94 and inventories/land.md:16: the closure of the red-line finding lost part of old line 10. Old line 10 says the landing "stops at the first red line after, leaving main in a state the resumption rules of `plan-orchestration` recognise", and that covers every red line left unfixed. The new file says this only in Stops row 1, which covers only the red line the user must decide. Line 101 says a red line booked in the booked list "is not a stop", and no text says the landing ends there or what state it leaves main in. Step 5's next bullet, "Then the look" (line 53), comes straight after the red-line bullets, so the steps read as if the landing goes on. Inventory row 16 maps old line 10's stop to "Stops 1", which does not cover the booked-list case. Spec.
- skills/land/SKILL.md:101: one paragraph holds several rules: the first row is a stop and leaves an open item; the other rows are refusals; refusals come before main is touched; they name their cause; they leave nothing; a red line booked in the booked list is not a stop; that booked step is worked in queue order. This breaks docs/dev/skill-layout.md:45 (one rule per bullet) and its anti-pattern at :64 (a paragraph holding several rules). Standards.
- skills/land/SKILL.md:34-35 against :98, and :37 against :99: the round's closure says Stops "states the conditions once", but items 4 and 5 still state them in full. Stops rows "The step not ready" and "Main not clean" state them again. This goes against the plan's ruling (plan.md, Rulings: "a refusal is stated once, as a row of Stops, and the item where it arises points there") and docs/dev/skill-layout.md:41. The landed precedent, skills/spec/SKILL.md, What it reads items 1 to 4, only points at "Stops". Standards.
- skills/land/SKILL.md:10 and :15: the closure of the inventory-row finding put "the only way a step reaches main" into the Quick start comment, and the title paragraph at line 10 still states it. The rule is now written twice (docs/dev/skill-layout.md:41). Standards.
- Checked and holding: the step numbers other files cite are unchanged. plan-orchestration SKILL.md:187 cites "its step 8", and new step 8 (line 58) is still the state file rewrite with `templates/usage.py`. No file outside land cites a land step number or a removed section name (`grep -rn` over skills, docs and README.md). The red-line stop row agrees with plan-orchestration step 9's bullet (line 76) and its Stops definitions (a user decision, booked in the open items, resumed by a ruling). The inventory's Stops pointers after the renumbering are right: 1 red line, 2 required key, 3 no ledger, 4 no dispatch block, 5 step not ready, 6 main not clean (inventory rows 16, 18, 23, 20, 26, 28). Old line 16's step-paths condition is again a refusal (lines 37 and 99). "The refuter report's Closed heading" (line 35) matches skills/refute/templates/report.md:42. Step 9 has one rule per bullet (lines 62 to 69). Rules 1 keeps the revert and the preparation commit together (line 111).

Reviewer usage: 14 tool uses, about 15 minutes.

## Closed

Round 1's findings are closed in the round (`8-report.md`). The run over round 1 is closed at landing:

- The owed run over the last round was merged into the two-way choice: Stops "The step not ready" lists the three refusals of old line 15 separately: neither the refuter report newer than the builder's report nor one carrying the run over the last round (or the orchestrator's read); a run over the last round owed and missing; a finding left open and unbooked.
- An unfixed red line no longer said the landing ends there: step 5 says any other red line ends the landing there, leaving main in a state the resumption rules of plan-orchestration recognise, whichever list books it; inventory row 16 points at step 5.
- The paragraph under the Stops table held several rules: it is four bullets.
- Items 4 and 5 restated the conditions of their Stops rows: they point at the rows only; item 5 keeps that the user's unrelated changes are listed and left alone.
- "The only way a step reaches main" was in the title paragraph and Quick start: the title paragraph says what the skill does in other words.
