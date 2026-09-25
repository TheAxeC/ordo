# Step 6 refuter report (on .agents/worktrees/2b-6, base f7dd354)

## Verification (rerun by the reviewer)

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
verify exit 0
$ ls -la /Users/axelfaes/.claude-work/skills/     (after the run: alpha dated 16:43 as in open item I, nothing new)
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ git status --short
 M README.md
 M skills/plan-retro/templates/collect_findings.py
 M skills/plan-retro/templates/collect_findings.test.sh
?? .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/6-report.md
$ git diff f7dd354 --stat | tail -1
 3 files changed, 424 insertions(+), 90 deletions(-)
$ wc -l (collector, test, README)            227, 343, 175 ; base: 140, 96
$ awk 'length > 100' over collector and test  (no output)
$ LC_ALL=C grep -n '[^ -~]' collector test    (no output)
$ python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l
642 findings
     642
$ python3 skills/plan-retro/templates/collect_findings.py .scratch/archive | wc -l
547 findings
     547
  per heading: {'spec': 241, 'standards': 116, 'proof': 104, 'behaviour': 86}; 23 reports
$ python3 <base collector, git show f7dd354:...> .scratch .scratch/archive | wc -l      -> 308
$ python3 <base collector> .scratch/archive -> 276 rows, 18 reports, {'unclassified': 20, 'spec': 135, 'standards': 43, 'behaviour': 40, 'proof': 38}
$ key set of every output line: {('plan', 'step', 'report', 'run', 'heading', 'location', 'text')}   (output shape unchanged)
$ the report's grep ('\bbullets\(|Reports read|exclude-listed|heading styles') -> the same five hits the report quotes
$ the report's count() for 1/11-refuter and 2.A/3-refuter -> "items 20 | collector 18" and "items 29 | collector 29", as quoted

Final test run against the base collector (copy under scratchpad/r6/b0): exit 1,
FAIL: rows differ ... (+ two-plan 3 first spec -, - one-plan 1 first standards src/a.cpp:12, ... 13 rows missing)
Base test against the final collector: FAIL: --exclude-listed left [], expected [2]  (the old token-listing retro format no longer excludes)

Hand counts, reports the builder did not count (sections read by eye, items counted, confirmations noted):
- plan 1, 2-refuter.md (dashed, numbered headings, unsubheaded round, 4-backtick lines inside a 3-backtick fence at 146-147):
  Spec 10 (48-57), Proof 8 (61-68), Standards 3, Behaviour 3, round 9 (160-168) = 33; collector 33 (first 24, round 9)
- plan 1, 9-refuter.md (dashed, "- none. ..." under Standards, unsubheaded round, "# " lines inside a fence at 98-102):
  Spec 5, Proof 1, Behaviour 1, round 6 = 13; collector 13
- plan 2, 2-refuter.md (numbered, "none." paragraphs, subheaded round, fenced ### Verification lines):
  first Spec 3, round Spec 3 = 6; collector 6
- plan 2.A, 4-refuter.md ("none" without a dot, ## Usage, subheaded round with ### Usage):
  first Proof 4 + Standards 1, round Proof 3 + Standards 1 = 9; collector 9

Reverts reproduced (one edit to a copy of the final collector, final test beside it; scratchpad/r6/rv.py):
 1 ITEM '- ' only           exit 1, 7 rows missing (as quoted)
 2 subsection keeps fixed   exit 1, 3 rows -> unclassified (as quoted)
 3 NOT_READ skip removed    exit 1, 5 unclassified rows added (as quoted)
 6 tilde fences dropped     exit 1, - two-plan 3 first standards src/c.py:9
 7 shorter line closes      exit 1 (as quoted)
 9 blank line ends item     exit 1, spec -> unclassified src/a.cpp:30
12 realpath -> set(quoted)  exit 1, FAIL: a listed path holding a space left [...]
13 whole retro read         exit 1, FAIL: ... left [one-plan/2 plan with space/4]
23 fence at column 0 only   exit 1, FAIL: a fence indented under its finding was read into the finding
25 pre-subheading list read exit 1, two unclassified rows added
Own mutants: CLOSURE back to base -> exit 1; NOT_READ without usage -> exit 1; NOT_READ without verification -> exit 1;
none-filter removed -> exit 1; FENCE ~{3,} -> ~{3} -> exit 0 PASS; continuation on tab removed (line[0] == " ") -> exit 0 PASS.

Probes (scratch ledgers under scratchpad/r6/probe, cl, tp, mv):
- numbered finding with nested "1.", "- " and two-space "2." points: one finding, points joined        (expected)
- fence at column 0 inside a numbered finding, continuation after it: fence skipped, continuation joined (expected)
- ## Closed before ## Repair round 1, refuted: round finding read                                        (expected)
- CRLF report: 3 findings, continuation joined, ### Not checked skipped                                  (expected)
- "- None found." under ### Spec and "- None: every figure reproduces." under ### Standards: both rows emitted
- ## Spec: / ## Proof. / ## Standards ## / ## Behaviour (none found): 0 rows; ### Spec: in a round: unclassified
- round item "- Closure of Spec 2 does not hold: src/a.py:3 ... Proof.": no row
- ~~~~ fence then "- a.py:1: after the fence": final 1 row, FENCE ~{3} mutant 0 rows
- --exclude-listed with .scratch/p/... listed: 0 findings; after mv .scratch/p .scratch/archive/p: 1 findings
```

## 1. Spec

none.

## 2. Proof

1. Report, "The count": `item='^(- |[0-9]+[.)] )'` ... `grep -cE "$item"`. The hand count uses the collector's own item predicate (`ITEM`, collect_findings.py:40) over hand-chosen line ranges, so agreement tests the section boundaries and not which items are findings. Plan 1 step 13, Proof 3 ("The other figures in the report reproduce: ...") is counted on both sides (judgment call 4). My pass over the archive output finds 15 rows that report no defect; see Behaviour 2.
2. README.md:119: "backtick and tilde fences of any length are skipped". The test has no tilde fence longer than three. `FENCE = re.compile(r"\s*(`{3,}|~{3})(.*)$")` (collect_findings.py:42 mutated) leaves the test at `PASS`. On a report with a `~~~~` fence it drops the finding after the fence (1 row final, 0 rows mutant).
3. collect_findings.py:9: "A finding is a top-level item ... with its indented lines". Line 78 `elif line[0] in " \t":` has no tab-indented case. With `line[0] == " "` the test still prints `PASS`.

## 3. Standards

1. 6-report.md, "The test, red first": "(That run used the first form of the test; its later cases were added with the changes they cover, each shown red below, and the row mismatch now prints a diff.)" and "The subheaded round's list before its subheadings was added as a case after the rest". This narrates attempts, which docs/dev/change-standard.md rule 7 forbids ("No narration of attempts"). The claim itself holds: the final test run against the base collector exits 1 (Verification).
2. skills/plan-retro/SKILL.md:38-44 (Steps 1) and its Stops table. The collector now refuses with exit 2 and a message in three cases: a previous retro with no `## Reports read` heading, a missing retro, and a retro that is not UTF-8. It also excludes only backtick-quoted paths under that heading, where the base collector excluded any matching token in the file. The skill states neither the refusal nor what it does on exit 2, so the change breaks change-standard rule 5 (every user-visible surface documented in the same step). The brief's path list left the SKILL.md out, so this needs a landing fix or a booking.

## 4. Behaviour

1. collect_findings.py:45: `CLOSURE = re.compile(r"(^closed\b|^closures?\b|^checked and holding\b|: closed\b)", re.I)`. The new `^closures?` alternative also matches a round finding about a failed closure. The probe item "- Closure of Spec 2 does not hold: src/a.py:3 still reads the old flag. Proof." in an unsubheaded round gives no row. A run over a repair round is meant to report exactly that kind of finding (refute SKILL.md, "a claim of closure the reviewer's own rerun does not reproduce"). No report in the tree has this shape today: the grep `^(- |[0-9]+[.)] )(closed|closures?|checked and holding)\b` finds only 1/8-refuter.md:116 and 1/11-refuter.md:117. The report does not state this effect of the change.
2. The collector counts items that report no defect as findings, and the retro's counts include them. Over `.scratch/archive` there are 15 such rows:
   - 1/13 first proof ("The other figures in the report reproduce") and first standards ("No sentence ... is made false").
   - 1/14 first spec ("No place listing the verify commands was missed"), first proof ("Every other figure reproduced.") and first standards ("Nothing else: ASCII clean, ...").
   - 1/6 first proof ("Otherwise none: ...") and round spec ("Checked, no defect found: ...").
   - 1/9 round proof ("... This bullet reports no defect in the check itself. Proof.") and round behaviour ("the Step 3 condition is closed ... No finding here. Behaviour.").
   - 2/4 first standards ("No non-ASCII, ..."), round proof ("The other figures reproduce.") and round standards ("No non-ASCII, ...").
   - 2/5 round proof ("The rest reproduces.").
   - 2/6 first proof and round proof ("The other figures reproduce.").

   The report names only 1/13 (judgment call 4) and 1/9:113 (judgment call 1), and gives "none unclassified" as the after state. The closure rule already drops "Checked and holding" (1/8:116) but keeps "Checked, no defect found" (1/6).
3. collect_findings.py:117, the section name: `NUMBER.sub("", line[len(marker):].strip()).lower()`. A heading with trailing punctuation (`## Spec:`, `## Proof.`, `## Standards ##`, `## Behaviour (none found)`) matches none of HEADINGS, so every finding under it is dropped silently. `### Spec:` in a round gives `unclassified`. The heading census over `.scratch` (`grep -rhoE '^#{2,3} .*'`) shows no report in the tree with these forms. The base collector behaves the same.
4. collect_findings.py:158: `re.fullmatch(r"none\.?", ...) or item.lower().startswith("none.")`. "- None found." and "- None: every figure reproduces." are emitted as findings (spec, standards). No item in the tree has these forms (grep `^(- |[0-9]+[.)] )(none|nothing|no finding)`). The base collector behaves the same.
5. `--exclude-listed` and the move into the archive. The builder's note is right. The real path of `.scratch/<plan>/agents/reviews/<n>-refuter.md` changes when `/plan`'s closing moves the ledger folder to `<archive_root>/` (plan/SKILL.md:48). A retro that listed an open plan's reports therefore excludes nothing of that plan afterwards: the probe gives 0 findings before `mv .scratch/p .scratch/archive/p` and 1 after. This plan hits the case itself, because step 16 runs `/plan-retro` while 2.B is open, and the next retro would read 2.B's reports again. It also makes plan-retro SKILL.md:15 ("every refuter report since the previous retro") false in that case.
   - The key that survives the move is the plan folder's name plus the report's file name: `<plan>/agents/reviews/<step>-refuter.md`, or the (plan, step) pair the collector already prints. The move keeps the folder name, and plan folder names are unique across ledger and archive.
   - That key has one limit. A report listed while its plan is open can later gain a `Repair round <n>, refuted` section. A pure (plan, step) key would then exclude the round's new findings. The key that survives both is (plan, step, run), with the retro's "Reports read" recording the runs read from each report.
   - The brief specified real-path comparison, so this is a change to the brief's matching and a decision for the orchestrator.

## Not checked

- Reverts 4, 5, 8, 10, 11, 14 to 22, 24 and 26 of the report. Ten of its 26 were reproduced.
- The verify list on main, since the step is not landed.
- Reviewer usage: 151,111 tokens, 47 tool uses, 513 s (the runner's completion notification).
