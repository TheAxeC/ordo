# Step 11 refuter report (on .agents/worktrees/1-11, base e6d7cda)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/roadmap
ok: skills/roadmap/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
62
$ wc -l skills/roadmap/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
     132 skills/roadmap/SKILL.md
      69 .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
     201 total
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...' (as in docs/dev/building.md:13)
(no output, exit 0; the untracked inventory is in the file list)
$ git show 19d395a:skills/roadmap/SKILL.md | wc -l
71
$ git diff e6d7cda --stat
 skills/roadmap/SKILL.md | 121 +++++++++++++++-----------
 1 file changed, 91 insertions(+), 30 deletions(-)
$ grep -rn -E "move, done, drop|## Writing" skills utils docs README.md | grep -v '^skills/roadmap/'
(no output)
$ grep -rn -E "roadmap add|roadmap done|roadmap move|roadmap drop|roadmap skill|templates/roadmap" skills utils docs README.md | grep -v '^skills/roadmap/SKILL.md'
skills/plan/SKILL.md:24, skills/plan/SKILL.md:48, skills/plan-help/SKILL.md:49, skills/ordo-init/SKILL.md:23, skills/ordo-init/SKILL.md:45, skills/repo-setup/SKILL.md:15, skills/repo-setup/SKILL.md:43, README.md:25 (all still true of the new file)
```

## 1. Spec

- skills/roadmap/SKILL.md:87: "**The introduction's rules.** They bind the skill." now binds the skill to every rule of the introduction. Old line 33 said "These rules bind the skill", where "these rules" are the rules the introduction attaches to the status vocabulary. The rule is widened. The brief's "the rules the roadmap file's introduction states keep binding the skill" uses the same wide wording, so the question is whether the brief or the old file governs. Either way the change in scope is not stated in the report.
- skills/roadmap/SKILL.md:124 (Anti-patterns row 2): "An entry or a dependency the user did not ask for". Old line 69 said "Nothing is added that the user did not ask for", a rule that held throughout the skill. The new row narrows "nothing" to entries and dependencies and moves it from Rules into Anti-patterns.
- skills/roadmap/SKILL.md:126 (Anti-patterns row 4): "Deleting a dropped entry" forbids any deletion. Old line 61 said "never deletes it silently", so the rule is strengthened.
- skills/roadmap/SKILL.md:97: one bullet holds two rules: a missing capability is drafted in its file with every scope item open; the entry's pointer line names the file. The old line 42 put a semicolon between them. The new ", and" also reads the pointer-line rule as applying only when the capability is new, a condition the old text does not set. Inventory row 40 (inventory line 40) also covers both rules.
- skills/roadmap/SKILL.md:85: the Levels bullet holds three rules: `/plan` can open either level; an added entry goes at the level the user names; a goal that does not settle the level is a stop. Inventory row 31 (inventory line 31) maps "an added entry goes at the level the user names" to Stops 3. Stops row 3 (line 108) holds only the question, not the rule that the entry goes at the level the user names. That rule is only at line 85, in "The format is the file's" 2.
- skills/roadmap/SKILL.md:89 and 109: "asked about once ... the answer is used from then on" is written twice, in the "No insertion form yet" bullet and in Stops row 4 ("The question, once" / "The user's answer, used from then on"). The plan.md ruling (line 51) says a Stops row is stated once and the item where it arises points there. No inventory row points at "The format is the file's" 6.
- skills/roadmap/SKILL.md:58 (Steps / add 3): the item where a missing dependency is found does not point at Stops row 5 (line 110). The same ruling requires the item to point at the row.
- skills/roadmap/SKILL.md:27: Use instead row 1 ("The repository has no `.agents/plan.yaml` | `/ordo-init`") repeats the refusal already stated in What it reads 1 (line 35) and Stops row 6 (line 111).
- skills/roadmap/SKILL.md:117: one paragraph holds two rules: stops wait on the user; refusals name their cause and change nothing. `skills/land/SKILL.md:99-101` gives these as one bullet per rule.
- .scratch/1-one-layout-for-every-skill/inventories/roadmap.md:9: row "Show, add, move, done, drop, in the file's format; writes only after approval | Steps" covers several rules from the description line (five commands, the format, write after approval) in one row.
- .scratch/1-one-layout-for-every-skill/inventories/roadmap.md:14: row "In the projects: form, the project's, with /roadmap <project> ..." points at Quick start. The rule that the project's keys apply is at What it reads 1 (skills/roadmap/SKILL.md:34), and Quick start line 20 holds only the invocation. The row covers two things in two places.

## 2. Proof

- none.

## 3. Standards

- skills/roadmap/SKILL.md:85, 97, 117: more than one rule per bullet or paragraph. This breaks docs/dev/skill-layout.md, "Lists and tables", first bullet ("One rule per bullet or item"), and the Anti-patterns row "A paragraph holding several rules".
- skills/roadmap/SKILL.md:89/109 and 27/111: the same rule is written in two sections. This breaks docs/dev/skill-layout.md, "Where a rule goes", last bullet ("A rule is written once"), and the plan.md ruling at line 51.

## 4. Behaviour

- What is written before approval. Steps / done 2-3 (lines 72-73: "Mark the entry...", "Write the output line beside it") and Steps / drop 1 (line 77: "Move the entry...") are imperative actions inside Steps 2 ("Run the command"). They come before Steps 3 (show the diff) and Steps 4 (write after approval). Someone following the numbered order would edit the roadmap file for done and drop before the approval stop. The old file separated what each command does (lines 59-61) from a Writing section that governed when it is written (line 65). The brief requires that nothing is written before approval.
- Missing dependency. With no pointer from Steps / add 3 (line 58) to Stops row 5, a runner following add's steps has no step at which the missing dependency is raised as a question. Stops row 5 also makes it a separate wait, where the old file (line 69) showed it as a question inside the draft.

## Not checked

- Whether `check_rule_inventory.py` checks that a row's numbered place (for example "Stops 7") holds the rule. Each numbered place was checked by hand above, not by the tool.

Reviewer usage: 12 tool uses, about 12 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/roadmap
ok: skills/roadmap/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
68
$ wc -l skills/roadmap/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
     136 skills/roadmap/SKILL.md
      75 .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
     211 total
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
 M skills/roadmap/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
$ git diff e6d7cda --stat
 skills/roadmap/SKILL.md | 127 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 31 deletions(-)
```

- skills/roadmap/SKILL.md:128: this is a new defect from the round. The Anti-patterns row "Implementation narration, dates or history in entry text" has "Rules 1" as its Do instead. The round put "Nothing is added that the user did not ask for" in as Rules 1 (line 133). The rule this row needs, "Entry text states the goal, the gate and the dependencies", is now Rules 2 (line 134). `git diff e6d7cda` lines 160-161 show both Anti-patterns rows 2 and 3 pointing at "Rules 1", so the row 3 pointer is wrong since the renumbering. Spec.
- .scratch/1-one-layout-for-every-skill/inventories/roadmap.md:9-13: the round says it split old line 3 into one row per rule. Some clauses of the description still have no row: "in dependency order" for add, "mark one done with its gate's output", "drop one with the reason", and "Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files". Their rules exist in the new body (Steps / add 4, Steps / done 1, Steps / drop 1, "A capability map beside the ordered file"), so no rule is lost. What is missing is coverage in the inventory, and `check_rule_inventory.py` does not detect it. Proof.
- skills/roadmap/SKILL.md:77-78: Steps / drop 1 drafts the move, and only then does drop 2 refuse an entry with an open plan. A numbered list means order (docs/dev/skill-layout.md:46), so the refusal comes after the draft it prevents. Stops row 10 says a refusal "changes nothing", and nothing is written before Steps 4, so no write happens early. The check still belongs before the draft, as in Steps / done, where the output check at done 1 comes before the drafts at done 2-3. Behaviour.
- Closures checked, all hold:
  - Steps 2 is a draft with "nothing is written yet"; done 2-3 and drop 1 draft; the write is at Steps 4 (lines 42, 72-73, 77, 44).
  - "The status rules" is narrowed back to the rules for the status vocabulary (line 88).
  - Rules 1 is restored and the Anti-patterns row 2 pointer is correct (lines 127, 133).
  - "silently" is restored (line 129).
  - The Levels and capability bullets are split (lines 85-86, 97-101).
  - The insertion-form question is written once, in Stops row 4, and the bullet points to it (lines 90, 111).
  - add 3 points at Stops, and Stops row 5 shows the dependency as a question in the draft (lines 58, 112).
  - The Use instead row for the no-configuration refusal is gone (lines 25-28).
  - The stop rule and the refusal rule are now two bullets (lines 119-120).
  - The rows renumbered by the round point at the right places:
    - "The format is the file's" 2-8 match inventory lines 34-42.
    - "A capability map beside the ordered file" 1-6 match inventory lines 44-49.
    - Stops 2-10 match inventory lines 26-27, 36, 41, 53, 60, 64, 67 and 72.
    - Rules 1-4 match inventory lines 19, 71, 73 and 75.
    - Anti-patterns 1, 3 and 4 match inventory lines 39, 74 and 66.

  Apart from the three bullets above, reading the old file line by line again found nothing lost or changed in meaning. Spec.

Reviewer usage: 11 tool uses, about 12 minutes.

## Closed

Round 1's findings are closed in the round (`11-report.md`). The run over round 1 is closed at landing:

- The Anti-patterns row on narration pointed at Rules 1 after the renumbering: it names Rules 2, "Entry text states the goal, the gate and the dependencies".
- Clauses of the description without an inventory row: rows added for "in dependency order" (Steps / add 4), "mark one done with its gate's output" (Steps / done 1), "drop one with the reason" (Steps / drop 2) and "learns the format from the file, whether one file holds everything or an ordered plan sits over a capability map" (The format is the file's, and A capability map beside the ordered file).
- `drop` checked the open plan after drafting the move: the refusal is drop 1 and the draft drop 2, as in `done`.
