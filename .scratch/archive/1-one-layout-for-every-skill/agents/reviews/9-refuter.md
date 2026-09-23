# Step 9 refuter report (on .agents/worktrees/1-9, base 6ca7fd1)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/plan-help
ok: skills/plan-help/SKILL.md                                   (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md   (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
39
$ wc -l skills/plan-help/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
      91 skills/plan-help/SKILL.md
      46 .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
$ git show 0fa6d65:skills/plan-help/SKILL.md | sed -n 16,43p > old.txt; sed -n 46,73p skills/plan-help/SKILL.md > new.txt; cmp old.txt new.txt
(no output, exit 0; 2263 bytes each, both fences included)
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
(no output, exit 0)
$ git diff 6ca7fd1 --stat | tail -1
 1 file changed, 49 insertions(+), 5 deletions(-)
$ grep -rn -E 'The position, for' skills utils docs README.md | grep -v '^skills/plan-help/'
(no output, exit 1)
```

## 1. Spec

- skills/plan-help/SKILL.md:41: Step 3 ("From that, print one line: the command that comes next, in the sequence.") has no condition, so it applies to `/plan-help` without an entry as well. In the old file, the next-command line sat under the heading "The position, for `<entry>`" (old line 45, 47), so it was printed only for `/plan-help <entry>`. The condition was lost when the heading was dropped. Step 2 has the condition ("For `/plan-help <entry>`"); Step 3 needs the same one.
- skills/plan-help/SKILL.md:10 and :91: the rule "It writes nothing" is written twice, once in the title paragraph ("It writes nothing.") and once in Rules ("The skill writes nothing."). skill-layout.md:41 says a rule is written once, and :63 lists the same rule written in two sections as an anti-pattern. The inventory row at inventory line 19 maps it to Rules 1 only.
- .scratch/1-one-layout-for-every-skill/inventories/plan-help.md: no row covers the rule carried by the old heading at line 14, "printed verbatim" (the sequence is printed exactly as written). The same goes for the condition carried by the old heading at line 45, "for `<entry>`". Both headings are rules of the old file. The report's judgment call (9-report.md:29) accepts leaving the first one without a row because headings carry none. The inventory check passes only because it ignores heading lines. The finding at :41 above is the one this gap hid.
- skills/plan-help/SKILL.md:10: "prints the commands for running a plan by hand" adds "by hand", which the old file does not say. The printed sequence (new line 70) includes `/plan-orchestration <entry>`, the unattended way to run a plan, so "by hand" does not describe everything that is printed. The old wording (old line 3 and line 10) was "running a plan step by step" / "prints the sequence".
- skills/plan-help/SKILL.md:33: "the folder's state file and its step files, as Steps 2 names them" introduces the term "step files", which neither the old file nor any other place in the new one defines. Old line 10 said "the ledger folder and its state file". The brief, report and refuter report that Steps 2 lists are the intended meaning, and the item should name them in those words.

## 2. Proof

- .scratch/1-one-layout-for-every-skill/agents/reviews/9-report.md:25: the report says "writes nothing" moved out of the opening paragraph and into Rules. The new file still has "It writes nothing." in the opening paragraph at skills/plan-help/SKILL.md:10 (`cat -n` above), in addition to Rules at :91.

## 3. Standards

- none. The ASCII check is clean. README.md:17, :20 and :39 (`grep -n 'plan-help' README.md`) still describe what `/plan-help` prints correctly, since the printed block is byte-identical.

## 4. Behaviour

- Someone following the new Steps would, for `/plan-help` with no entry, attempt Step 3 and print a "command that comes next" line derived from no plan. By the old file, `/plan-help` alone printed only the sequence. Source: skills/plan-help/SKILL.md:41.

## Not checked

- nothing.

Reviewer usage: 11 tool uses, about 10 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/plan-help
ok: skills/plan-help/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md            (exit 0)
$ python3 utils/check_rule_inventory.py /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/*.md
ok: /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/land.md
ok: /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/spec.md            (exit 0)
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (docs/dev/building.md:13, as written)
(no output, exit 0)
$ git show 0fa6d65:skills/plan-help/SKILL.md | sed -n 16,43p > $TMPDIR/old.txt; sed -n 46,73p skills/plan-help/SKILL.md > $TMPDIR/new.txt; cmp $TMPDIR/old.txt $TMPDIR/new.txt
(no output, exit 0; 2263 bytes each)
$ wc -l utils/check_rule_inventory.py utils/check_rule_inventory.test.sh .scratch/.../inventories/plan-help.md skills/plan-help/SKILL.md; grep -c '^| [0-9]' <inventory>
393, 476, 48, 91; 41 rows
# revert of the check change (the two added lines in check_range_block) on a copy under $TMPDIR:
FAIL: heading-row: expected a pass, got: .../ledger/heading-row.md:12: old lines 11-11 hold a heading at 11; a range stays inside one block
# mutation on the copy, `first == last and` dropped from the new condition:
FAIL: with-heading: missing [old lines 11-13 hold a heading at 11] in: .../ledger/with-heading.md:0: old line 9 is in no row: The skill does the thing.
# edge probes against the changed check (scratch repo under $TMPDIR; old file: frontmatter comment at 3, "# T" 6, "## A" 7, "### B" 8, blank 9, fence 11-13 holding "# f"):
span 6: ok   span 7: ok   span 8: ok   span 3 (frontmatter "# c"): ok   span 12 (fenced "# f"): ok   span 11-13: ok
span 7-8: old lines 7-8 hold a heading at 7; a range stays inside one block
span 8-9: old lines 8-9 hold a heading at 8; a range stays inside one block
```

- utils/check_rule_inventory.py:264-265: the check now accepts a row whose range is one heading line. The ruling at .scratch/1-one-layout-for-every-skill/plan.md:49 says a row's range stays inside one block with "no blank line, no heading". Brief 9 lists only the plan-help SKILL.md and its inventory under What to build, so changing the check is outside the brief. Neither the plan nor the state file records a ruling that amends line 49, and the report opens with "Everything in the brief is done" (9-report.md:3). Its only mention of the change is judgment call 29, which does not name the ruling the change departs from. The heading rules could have been mapped from the text rows beside them (old line 47 for "for `<entry>`", old line 16 or 43 for "verbatim"), which needs no change to the check. The orchestrator has to rule on the change before landing. Spec.
- utils/check_rule_inventory.py:264: rule 9 of docs/dev/change-standard.md says "A threshold, tolerance or predicate widened to make a check green is a finding to report, not an edit to make." The heading predicate was widened so that an inventory with rows for old lines 14 and 45 would pass. The report (9-report.md:39) lists this as a closure and does not report it as a finding. Standards.
- utils/check_rule_inventory.py:264: the change does not weaken anything else the check guarded, as my probes above show. A heading inside a fence and a heading-shaped comment in the frontmatter behave as before. A range of two headings (7-8) is still an error, and so is a heading plus the blank line after it (8-9). The docstring line at :25 matches the code, since ":37" defines a heading as one outside the frontmatter and outside fenced code. The new case heading-row turns red with the change reverted (output above). This bullet reports no defect in the check itself. Proof.
- utils/check_rule_inventory.test.sh:300-302 and 9-report.md:39: heading-row asserts that the check stays silent. Its control is the edited with-heading case (`| 11-13 |`). Rule 13 of the change standard requires the control's red output to be quoted beside it. The report quotes only heading-row's red. I produced the control's red myself by dropping `first == last` (output above), so the control works, but the report does not show it. Also, no case pins a heading plus the blank line after it (11-12) alone. My probe shows that range errors today. Proof.
- .scratch/1-one-layout-for-every-skill/inventories/plan-help.md:21: the row for old heading line 45 carries two rules in one row: "The position, and the next command, are printed for /plan-help <entry> only". It maps both to "Steps 3". The position's condition lives in Steps 2 (skills/plan-help/SKILL.md:38), which the row does not name. The ruling at plan.md:49 says one row covers one rule. Two rows on line 45 would fix it, one naming Steps 2 and one naming Steps 3. The row also sits between the rows for old line 10 and old line 12, out of old-line order. Proof.
- skills/plan-help/SKILL.md:41: the Step 3 condition is closed. "For `/plan-help <entry>`, print one line from that position" now matches old lines 45 and 47, where the next-command line sat under "The position, for `<entry>`". The other first-run closures also match the new file: "writes nothing" appears only at :91, "by hand" is gone from :10, and "step files" is replaced at :33. The inventory has heading rows for old 14 and 45. Old 8, "# Plan help", is the title and carries no rule. On a second line-by-line pass over old lines 1-47, I found no other rule dropped or changed in meaning. The printed block is byte-identical (cmp above). No finding here. Behaviour.

Reviewer usage: 22 tool uses, about 15 minutes.

## Closed

Round 1's findings are closed in the round (`9-report.md`). The run over round 1 is closed at landing:

- The check's change was outside the brief and departed from the one-block ruling: ruled by the orchestrator (plan.md): a row may name one heading line alone; it adds coverage for rules a heading carries and makes no failing inventory pass, which the reviewer's probes confirm (every landed inventory still `ok:`, a heading in a fence or the frontmatter as before, two headings and a heading plus its blank still errors). Rule 9 of the change standard is about loosening a check to pass something it rejected; the plan-help inventory passed without the heading rows, so the change was not made to turn a red check green.
- The control's red output not quoted, and no case for a heading plus the blank after it: case heading-blank added; with the one-line condition widened to any range (`first == last and` dropped) the test prints `FAIL: with-heading: missing [old lines 11-13 hold a heading at 11]`, quoted in `9-report.md`.
- Inventory row 45 held two rules: two rows, one naming Steps 2 (the position) and one Steps 3 (the next command), in old-line order.
