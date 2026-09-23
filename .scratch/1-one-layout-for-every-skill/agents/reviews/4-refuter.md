# Step 4 refuter report (on .agents/worktrees/1-4, base 69ce621)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/plan-orchestration
ok: skills/plan-orchestration/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md   (exit 0)
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (building.md line, verbatim)
(no output, exit 0)
$ git show 836f5c5:skills/plan-orchestration/SKILL.md | wc -l
96
$ wc -l skills/plan-orchestration/SKILL.md
221
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
113
$ wc -l .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
120
$ git diff 69ce621 --stat | tail -1
1 file changed, 161 insertions(+), 36 deletions(-)
$ grep -c '^## <name>$' for The review, earned / Two steps in flight / Launching a builder / Stops / Usage
1 / 1 / 1 / 1 / 1
$ grep -rn 'Handing the plan' skills docs README.md
(no output, exit 1)
```

## 1. Spec

- skills/plan-orchestration/SKILL.md:90-96: the interrupted-landing rule ("A booking present in the working tree but not committed, with the step's files staged, ... is finished before anything else") is now a bullet under "On resumption with a dispatch block present:". In the old file (836f5c5 line 24) it is a separate sentence after the dispatch-block list ended, so it applied on every resumption. The condition now covers a rule it did not cover. See Behaviour for the effect.
- skills/plan-orchestration/SKILL.md:193-194: the Stops table adds "A pause" and "The end" (nothing unblocked is left) as stops. The old file (line 82) says "A stop is for a decision that is the user's" and lists four kinds. It treats the pause and the end as when the turn ends, not as stops. Their "What it shows" and "What resumes it" cells ("The position, the open items and the booked list"; "A new step or plan") are also not in the old file.
- skills/plan-orchestration/SKILL.md:189-192: the "What it shows" cells add content the old file does not state ("what the tree shows", "The check, its output", "Both rules"), and so does the first row's "booked in the ledger". The old file says only "the options inside the written rules and one recommendation with its reasons" (line 82).
- Rules written twice, against the brief's "A rule is written once" and skill-layout.md line 41:
  - line 32 (What it reads 1, "so the skill carries no project name and no vendor name") and line 218 (Rules 1);
  - line 50 (Steps 4, "The builder. It never runs a git command and never writes into the ledger") and line 219 (Rules 2);
  - lines 87-88 (Resuming, rules 2 and 3) and line 220 (Rules 3). The inventory gives Rules 3 no row;
  - line 196 ("Fixing a defect in what the user asked for is never a stop and needs no yes") and line 221 (Rules 4, "A fix of a defect in delivered work needs no yes");
  - line 63 (Steps 8, "Not sent back ... is a stop") and line 206 (Anti-patterns 2, "Raise it as a stop");
  - line 71 (Steps 10, the loop never ends its turn for a report) and line 209 (Anti-patterns 5);
  - line 33 (What it reads 2, the reading order) and line 41 (Steps 1). Line 34 (What it reads 3, resolve the dispatch block first) also restates Steps 1.
- skills/plan-orchestration/SKILL.md:219: Rules 2 adds statements the old file does not make as standing rules: "works only in the step's worktree" (old line 31 has it only as content of the agent prompt) and "the orchestrator writes the ledger". It also holds four rules in one bullet.
- Bullets that hold more than one rule (skill-layout.md line 45): line 59 ("Read the diff yourself while it runs. Save its report and record its usage."), line 162 (reports open with the open items / what the open items hold), line 196 (a stop is for the user's decision / fixing a defect is never a stop), line 219, line 220.
- skills/plan-orchestration/SKILL.md:71-72: the sub-bullets of item 10 are indented 3 spaces, but item "10. " has a content offset of 4. Under CommonMark they render as a separate top-level list, not nested under item 10. Items 1 to 9 are not affected. The layout check does not catch this.
- skills/plan-orchestration/SKILL.md:207: the "Do instead" cell says "the builder's repair round". The old line 82 says "the builder's one repair round", so the qualifier "one" is dropped.
- skills/plan-orchestration/SKILL.md:3: the description adds "a fresh reviewer" for the first refutation. The old file calls only the runs over a repair round "a fresh reviewer" (line 35). It also drops "agent" from "one builder agent" and "to the builder" from "send its findings back to the builder".
- .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md:16: the version maps to "Quick start", which does not hold it. Brief decision 1 says "the version to Rules with the new version". The report (4-report.md:25) presents this as a judgment call, not as a departure from the brief. Neither section holds the version; it is in the frontmatter only.
- inventory line 12: "The same skill runs a code tool, a research project or a manuscript on either harness" maps to "The two tiers, and the harnesses 5" (SKILL.md line 80, "Any combination is allowed"), which does not state it. Only the frontmatter description does.
- inventory lines 17 and 19: "a plan that /plan opened" and the list of what running unattended adds both map to "Steps". They are stated in the title paragraph (line 10), not in Steps.
- inventory line 62: the Rule text drops the qualifier "with at most one fix at landing" (old line 41). The new file (line 101) keeps it.

## 2. Proof

- .scratch/1-one-layout-for-every-skill/agents/reviews/4-report.md:14: "the inventory ... 121 rows". The rerun shows 113 body rows (`grep -c '^| [0-9]'`) in a 120-line file.

## 3. Standards

- skills/plan-orchestration/SKILL.md:218-221 and the lines listed under Spec: the same rule written in two sections breaks docs/dev/skill-layout.md line 41 ("A rule is written once") and its Anti-patterns row at line 63.
- skills/plan-orchestration/SKILL.md:59, 162, 196, 219, 220: docs/dev/skill-layout.md line 45, one rule per bullet.
- Other checks, none: no non-ASCII (the ASCII check is clean), no history. Every section another file names still exists: "The review, earned" and "Two steps in flight" (cited by the plan skill's templates/plan.yaml and templates/orchestrator-state.md), and "Usage" and the resumption rules (cited by skills/land/SKILL.md:10 and :28). The old heading "Handing the plan from one orchestrator to another" is named nowhere else.

## 4. Behaviour

- Interrupted landing on resumption (SKILL.md:90-96). The land skill clears the dispatch block when it rewrites the state file at its step 8, before the commit at its step 9 (skills/land/SKILL.md lines 28-29). A landing interrupted between those two steps leaves a working-tree state file with no dispatch block. Under the new file, the orchestrator runs the "finished before anything else" check only when a dispatch block is present. It would skip that check and carry on with the half-landed step's files staged on main. Under the old file it ran the check on every resumption.
- Pause and end booked as stops (SKILL.md:193-194 with line 197). Line 197 says "A stop is booked in the state file's open items the moment it is raised, and repeated in every report until the user has ruled". With the pause and the end listed as stops, an orchestrator would put a pause and "nothing unblocked is left" into the open items. The old file (lines 82 and 86) keeps the open items to stops and recurring-findings proposals, and neither of those two is a stop.
- Content of the pause message (SKILL.md:193 against line 72). The pause row says the message shows "the booked list". Step 10 and Reports 2 (line 163) say the final message carries the booked list's count and the steps that carry it, not its lines. An orchestrator following the table would print the list itself.

## Not checked

- Whether the Use instead rows (lines 24-28) match each neighbouring skill's own description word for word. I checked only that each named skill exists.
- The brief's line 9 is garbled ("`git show 836f5c5tree at v1.0.0;"). That is in the orchestrator's brief on main, not in this change, and I did not trace its cause.

Reviewer usage: 12 tool uses, about 15 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/plan-orchestration
ok: skills/plan-orchestration/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md   (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
115
$ wc -l skills/plan-orchestration/SKILL.md
     227 skills/plan-orchestration/SKILL.md
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (docs/dev/building.md line 13, verbatim)
(no output, exit 0)
$ git diff --stat
 skills/plan-orchestration/SKILL.md | 201 ++++++++++++++++++++++++++++++-------
 1 file changed, 166 insertions(+), 35 deletions(-)
```

Closures confirmed by reading: the interrupted-landing rule now has its own lead line (SKILL.md:101-103); the Stops table has four rows with the old file's cells (197-202); What it reads 1 and old Rules 2 and 3 no longer repeat Rules 1 and Steps 4; item 10's sub-bullets are indented four spaces (74-75); "one repair round" is back (216); the description is corrected (3); "The two tiers, and the harnesses 6" exists (84); inventory row 62 has its qualifier back. Every inventory item number I recounted with the checker's counting rule (top-level items plus table body rows) points at the right line, including Stops 5 to 9 and Anti-patterns 1 to 9 after the rows were renumbered. Every section name another file cites still exists (`grep -rn 'plan-orchestration'` over skills, README.md and docs).

- skills/plan-orchestration/SKILL.md:34 and :43: closure claimed for "Line 34 (What it reads 3) also restates Steps 1". Steps 1 now points at What it reads for the reading order. Both lines still state "resolve a dispatch block before anything else" (34: "resolved before anything else as ... says"; 43: "and resolve a dispatch block before anything else"). The rule is still written twice. Spec.
- skills/plan-orchestration/SKILL.md:75 and :208: the turn-end rule is written twice. Line 75 says "The loop ends only at a stop, at a pause, or when nothing unblocked is left". Line 208 says "The turn ends only when nothing unblocked is left, or when the user has asked for a pause". The inventory maps old 37 and old 82 to these two places (rows 60 and 102). This goes against the brief's "A rule is written once" and skill-layout.md "Where a rule goes". The first review did not raise it. Spec.
- skills/plan-orchestration/SKILL.md:208: the round added "Neither is a stop, and neither goes into the open items." The old file has no such sentence (old 82). Its second half restates Reports 2 (line 170). The bullet now holds two rules, against skill-layout.md "One rule per bullet". Spec.
- skills/plan-orchestration/SKILL.md:199-202 and :207: every "What it shows" cell and the bullet at 207 both state "the options inside the written rules and one recommendation with its reasons". The rule is written five times. The cells could name the bullet. Spec.
- .scratch/.../inventories/plan-orchestration.md:18 and SKILL.md:24, :41: the report's closure (4-report.md:45) says "the paragraph that opens Steps holds the old paragraph's content, and the rows point there". Row 18 ("Each step runs through the skills a person runs by hand, /plan-help printing the sequence") still points at "Use instead 1", not Steps. The same content is now stated at both line 24 and line 41. Spec.
- SKILL.md:56, :69, :70, :97, :99, :125: bullets that still hold two or more rules, against skill-layout.md "One rule per bullet":
  - 56: never dispatch beyond `workers_at_once`, and never during a pause.
  - 69: the rounds end; small things are fixed at landing; the rest is booked, never sent back.
  - 70: the exception; a new finding never earns it.
  - 97: a running builder is waited for; a finished one resumes.
  - 99: a dead builder is reported; a continuation builder takes over when the user says so.
  - 125: the lists share no file; a shared-file step runs alone.

  The round's split (4-report.md:39) covered only Steps 7, Reports 1 and the Stops bullets. Spec.
- .scratch/.../inventories/plan-orchestration.md:33, 35, 48, 49, 50, 56, 57, 58, 60, 74, 110: each row covers more than one rule. For example, row 49 covers four rules of old line 33 (save the report, where a Claude agent's message is, read the diff, the report is a lead), and row 50 covers three. This goes against the plan.md ruling that "a paragraph that holds several rules gets one row per rule on the same lines". The checker does not enforce it, and the first review did not raise it. Spec.
- skills/plan-orchestration/SKILL.md:10: after the round the title paragraph is one sentence that says only what the skill does. docs/dev/skill-layout.md section row 1 asks for "what it leaves behind" as well (the landed steps, the landing reports, the booked ledger), and the line does not say it. Standards.
- .scratch/1-one-layout-for-every-skill/agents/reviews/4-report.md:14, :19, :26: the report still states things the tree does not show:
  - line 14: "221 after (`git diff --stat`: 161 insertions, 36 deletions)" and "121 rows". The rerun gives 227 lines, 166 insertions, 35 deletions and 115 rows.
  - line 19: "Stops (a table of the six stops ...); Anti-patterns (ten rows); Rules (four)". The file has 4 table rows (197-202), 9 anti-pattern rows (214-222) and 2 rules (226-227).
  - line 26: "ending the turn for a report" is listed among the rules moved to Anti-patterns. No such row exists.

  The repair section (line 43, "Corrected above") corrects only the row count in its own paragraph. change-standard.md rule 7 requires the report to state the end state. Proof.

Reviewer usage: 13 tool uses, about 15 minutes.

## Closed

Round 1's findings are closed in the round (`4-report.md` as it then stood, and the ruling in `plan.md`). The findings of the run over round 1, the last round, are closed at landing:

- "Resolve a dispatch block before anything else" in both What it reads 3 and Steps 1: What it reads 3 names the dispatch block as an input only.
- The turn-end rule in Steps 10 and in Stops: Steps 10 holds it; the Stops bullet holds only that a pause holds until the user lifts it; the added "Neither is a stop" sentence is removed.
- The stop message written five times: the cells say "The stop message, below", and one bullet defines it.
- Inventory row "Each step runs through the skills a person runs by hand" pointed at Use instead 1: it points at Steps, whose opening paragraph states it.
- Bullets with two or more rules: split, in Steps 5 and 8, "Resuming, and handing the plan over" and "Two steps in flight"; the Anti-patterns row on narration and unmeasured numbers is two rows.
- Inventory rows covering more than one rule: split, one row per rule; the inventory has 132 rows and `check_rule_inventory.py` prints `ok:`.
- The title paragraph did not say what the skill leaves behind: it does now.
- The report's stale counts and section list: `4-report.md` is rewritten to the end state (235 lines, 174 insertions, 35 deletions, 132 rows, four stops, ten anti-patterns, two rules).
