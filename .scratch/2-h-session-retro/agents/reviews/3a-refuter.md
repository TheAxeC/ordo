# Step 3a refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2h-3a, base 7e3dbc2)

A page this report cites is named with its section. A grep hit keeps its `file:line`, numbered as in the worktree after the change.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
(exit status 0)

Verify 2. Each dictated text taken from the brief's own lines, written as the one line of a file under $TMPDIR, then grep -c -F -f <file> <target>:
i1 skills/spec/SKILL.md: 1
i2a, i2b, i2c, i2d skills/spec/templates/brief-check.md: 1, 1, 1, 1
i3, i4, i5 skills/spec/templates/brief.md: 1, 1, 1
i6a to i6l skills/spec/templates/brief.md: 1 for each of the twelve
i7a, i7b, i7c docs/dev/change-standard.md: 1, 1, 1
i7a, i7b, i7c skills/repo-setup/templates/docs/dev/change-standard.md: 1, 1, 1
i8a to i8e skills/refute/SKILL.md: 1 for each of the five
(31 runs, each prints 1, as the report says. grep -c -x -F over i2a to i2d and i6a to i6l also prints 1 each, so those lines hold nothing but the dictated text.)

Verify 3. $ git diff --stat
 docs/dev/change-standard.md                           |  6 +++---
 skills/refute/SKILL.md                                |  8 +++++---
 .../repo-setup/templates/docs/dev/change-standard.md  |  6 +++---
 skills/spec/SKILL.md                                  |  1 +
 skills/spec/templates/brief-check.md                  |  7 +++++++
 skills/spec/templates/brief.md                        | 19 +++++++++++++++++--
 6 files changed, 36 insertions(+), 11 deletions(-)
git diff -U0 of each change standard: 3 removed and 3 added lines in each; diff of the two filtered diffs prints nothing, exit status 0.

Verify 4. $ LC_ALL=C grep -n '[^ -~]' <the six files>
(prints nothing, exit status 1)

Verify 5. $ grep -n -i 'glossary\|prose standard\|skill-layout\|docs/' skills/spec/SKILL.md skills/spec/templates/brief.md skills/spec/templates/brief-check.md
hits at SKILL.md:50, :245, :246, brief.md:77, brief-check.md:43, :49. At the base: SKILL.md:50, :245, brief-check.md:43 (each `docs/adr`). The three new hits say "a glossary entry" and "when the repository has a glossary"; none names a page of one repository.

Verify 6. $ git grep -n 'names no revert\|finds such a test by reading it' -- skills docs README.md utils
(prints nothing, exit status 1)

Commands the report quotes:
$ git grep -n -i 'changes nothing\|without changing anything\|An edit to any file' -- skills docs README.md utils
17 hits, the same files and lines the report lists, with skills/refute/SKILL.md:170 now the row "An edit to any file of the worktree or the main checkout by the reviewer".
$ git grep -n 'names no revert\|by reading it' -- skills docs README.md utils
docs/roadmap.md:228 and skills/refute/SKILL.md:115 only.
$ wc -l of the six files: 89, 71, 297, 82, 62, 183; at the base 89, 71, 296, 67, 55, 181; the report: 265 lines. All as the report says.
The brief's premises at 7e3dbc2 (spec SKILL.md lines 238 to 247, brief-check.md headings at 5 to 53, brief.md lines 18, 19, 21, 23, 60 to 63 and 67, rule 13 identical in both copies, refute lines 93, 103, 104, 114, 115, 121, 125, 168, `ls docs/adr` printing README.md and template.md): each reproduces.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds, skills/spec/SKILL.md:246 is the dictated bullet, after **ADRs** and before "The checks are done", three-space indent (i1 prints 1).
- 2: holds, skills/spec/templates/brief-check.md lines 47 to 52, heading, two bullets, Findings line, a blank line around each, before "## Declined to judge" (i2a to i2d print 1).
- 3: holds, brief.md:19 (i3 prints 1); line 18 is not in the diff.
- 4: holds, brief.md:25, the last paragraph of "Cases", a blank line on each side (i4 prints 1).
- 5: holds, brief.md:66 (i5 prints 1); items 1 to 4 are not in the diff.
- 6: holds, brief.md lines 70 to 82, the opening line and eleven numbered parts (i6a to i6l print 1).
- 7: holds, the three sentences in each copy (i7a to i7c print 1 in each), the same three removed and three added lines in both, no other line of either file in the diff.
- 8: holds, skills/refute/SKILL.md:103, :104, :115, :123 and :170 (i8a to i8e print 1); the row's other two cells are unchanged.

Cases of the brief's "Cases":

- R1: met, eight check bullets at skills/spec/SKILL.md 239 to 246, **Dictated text** the last before "The checks are done".
- R2: met, `## 8. Dictated text` at brief-check.md:47 before `## Declined to judge` at :54; eight checks and eight headings in the same order.
- R3: met, brief.md:19 is the text of item 3, and line 18 is unchanged.
- R4: met, the paragraph of item 4 is the last of "Cases".
- R5: met, five items, the fifth as item 5 gives it.
- R6: met, each part of the old paragraph is in the list: parts 1, 2, 3, 5, 7, 8, 9, 10 and 11.
- R7: met, identical in the two files, no other line changed, the grep prints nothing.
- R8: met, the Spec list has eleven bullets (lines 94 to 104), the Proof list ten (106 to 115), the Standards list ten (117 to 126), each ending with a period on its last bullet; the parenthesis follows "taken out of the code"; the row's first cell is as item 8 gives it.
- R9: met for the hits the case names: each hit of the two greps outside the step's paths was read, and none is made false. The contradictions found are between the new texts themselves and inside skills/refute/SKILL.md, and are Standards 1 to 3 below.

## 1. Spec

none. No line of the six files is changed that no item asks for, and no dictated text is altered by a character.

## 2. Proof

- The builder's report, "The terms": "Each term of `docs/glossary.md` that the diff adds, changes or uses". What is wrong: the list leaves out glossary terms that the added lines use. `grep -c -i -w` of each glossary headword over the added lines of `git diff 7e3dbc2` also finds **worktree** (skills/refute/SKILL.md:115 and :170, new text), **step** ("a code step" at skills/refute/SKILL.md:104 and brief.md:25 and :75, new text), and **orchestrator**, **ruling** and **landing** (brief.md:74 and :82, old words in rewritten lines). Each of those uses reads in the sense its entry gives, so nothing in the diff changes. The decision that rests on it: the new Standards bullet of `refute`, as ruled, makes a misused term a finding only when "the report's terms part does not name" it, so the reviewer depends on that part being complete. Failure scenario: a reviewer who takes the terms part as the list of terms to check never reads a use of a term the part left out.

## 3. Standards

Every finding below is in a text the brief dictates, so the diff follows the brief in each. None of them is one of the six defects of the item "Step 3a, six ruled sentences the brief check would reword".

- 1. docs/dev/change-standard.md, rule 13, fourth bullet (and the same bullet of skills/repo-setup/templates/docs/dev/change-standard.md), against skills/refute/SKILL.md, "The four headings", Proof, last bullet. Rule 13: "the reviewer checks it by reading the test and by a change of its own". `refute`: "found by reading it or by a change of the reviewer's own". What is wrong: rule 13 makes the reviewer's own change part of every check, and `refute` makes it one of two ways. The rules file's rule "A change leaves no two statements that contradict each other" (rule 19 of `docs/dev/change-standard.md`) is broken. The reworded text 1 of the ruling keeps "and by a change of its own on a scratch copy", so the repair round does not end this. Failure scenario: a reviewer follows `refute`, reads each test, makes no change, and reports no finding; the orchestrator or a later retro holds that review to rule 13 and finds the check the rule asks for was not made. Read the other way, a reviewer makes a change for every test of every code step because rule 13 says "and".

- 2. skills/refute/SKILL.md, "The four headings", Proof, last bullet: "or by a change of the reviewer's own, made on a scratch copy outside the worktree and the main checkout, that takes the behaviour out". What is wrong: the only place the skill names the reviewer's own change is inside the definition of a finding. `docs/dev/skill-layout.md`, "Where a rule goes", puts a rule on what to do at one point of the work in that step's item, and Steps 2 to 6 of `refute` say nothing of it. Two sentences of the same file leave no room for it: Rules, "it reads the inputs "What it reads" lists, runs the commands this skill names, and writes its report itself", and "What it reads" 5, "`git diff <base>` and `git status --short`, read-only, are the only git the reviewer runs". Nothing says how the scratch copy is made, where, or that it is removed. Failure scenario: a reviewer follows Steps 1 to 6 and never makes the change, since no step asks for it; or makes the copy with `git worktree add`, as the `diagnose` skill does for its scratch copy, which writes into the main checkout's `.git`; or leaves the copy behind when the review ends.

- 3. skills/refute/SKILL.md, "Anti-patterns", the second row: "An edit to any file of the worktree or the main checkout by the reviewer". What is wrong: the old row forbade an edit "to any file, anywhere". The new row allows every edit outside the two trees, which is wider than the one exception the Proof bullet needs, the reviewer's scratch copy. The rules file's rule "A rewrite keeps the meaning of every rule it carries" (every limit of the old text kept) is broken; the brief's Decision 4 asked for these words. Failure scenario: a reviewer edits a file of the installed skills, of the pinned worktree or of another repository, and the row no longer names that as an anti-pattern. A row that reads "An edit to any file outside the reviewer's scratch copy" would keep the old limit.

- 4. skills/spec/templates/brief.md, "Cases", last paragraph, and "Report" 4, with skills/refute/SKILL.md, Spec, last bullet, against rule 13, fifth bullet. The template: "For each case of a code step, the builder makes one small change" and "For each case of a code step, the table the rules file's rule on tests asks for gives that change". Rule 13: "Each behaviour the change adds or changes whose failure costs something ... has a case, and the report lists them in a table: the behaviour, the case, the failing line quoted for it, the small change". What is wrong: the table has a row per behaviour the change adds or changes, with a failing line on the unchanged tree. A case of a behaviour the change preserves (rule 13, second bullet), whose test passes on the unchanged tree, has no row in it, yet the template and the new Spec bullet ask for its change in that table. The reworded text 4 keeps "For each case of a code step, the table the rules file's rule on tests asks for". Failure scenario: a builder with a case of preserved behaviour leaves it out of the table as rule 13 scopes it, and the reviewer reports "a case of a code step for which the report gives no change that takes its behaviour out"; or the builder adds a row whose column "the failing line quoted for it" has nothing to hold.

- 5. skills/spec/templates/brief.md, "Verify before you report" 5: "A sentence longer than they allow is named in the report with the reason its content needs the length." What is wrong: none of the eleven parts of "Report" is the place for it. Part 5 asks for the checks "and their output verbatim", and a reading has no output; part 8 is "Every judgment call the brief left open". The builder's report of this step shows the effect: its long sentences stand under "Judgment calls", below the line "None left open by the brief". Failure scenario: a builder puts the named sentences under a part that is for something else, or leaves them out, and the reviewer has no part to look in.

- 6. skills/spec/templates/brief.md, "Cases", second bullet: "with its expected result, for a script the exit status and the error line". What is wrong: read as written, every implied input of a script has an error line. An input the script must accept (a path with a space, or an early close of its output that the script is expected to end on quietly) has an exit status and no error line. No rule of the standards names this; it is a defect of meaning in a ruled sentence, and the reworded text 2 keeps these words. Failure scenario: the session writing a brief gives an error line to a must-pass input, or the brief check's "Implied inputs" names such a case as missing its error line.

What the six reworded texts would break if placed as the item gives them: nothing in the six files, by reading each against its file. Three points stay open after them. Reworded text 1 keeps the "and" of Standards 1, and its "the test's failing line ... in the table the next bullet gives" can point at either of the two failing lines that bullet lists. Reworded text 4 keeps the scope of Standards 4. Reworded text 2 puts "its output closed by the program reading it" in a parenthesis that lists inputs and keeps the words of Standards 6. Reworded texts 3, 5 and 6 break nothing; text 3 leaves eight checks and eight headings, so "one heading per check of item 2" holds.

## 4. Behaviour

none. The report gives each visible change with its before and after: the eighth check, the template's four changes, rule 13 in both copies, and the four changes of `refute`.

## Declined to judge

- Whether "without changing anything" (skills/refute/SKILL.md description, the glossary's **reviewer** entry in both copies), "who changes nothing" (`refute`, opening paragraph), README.md:5 and docs/figures/gen_figures.py:599 still hold once the reviewer makes a change on a scratch copy: the brief's "What is on the tree" rules that they do, and a careful reader could dispute it. The user's call.
- Whether a finding of the new **Dictated text** check on words the user ruled is closed by the session changing the brief ("Steps / The brief check" 4) or is a stop: the new text does not say, and this step's own open item shows the case. The user's call.
- Rule 7 of the change standard lists the parts of a report without the cases' first run, the table of rule 13 or the terms part. The diff does not contradict it, and the first run was already absent from it at the base. Not judged.
- The word counts in the report's "Judgment calls": not recounted, no decision rests on them. One sentence the list does not name, brief.md "Report" 3, "Each case has the command that checked it and its output verbatim, or the reading and what it found on the unchanged tree.", has 23 words against the prose standard's "roughly 20"; whether that is over the limit is a judgment.
- The reviewer's own change of rule 13: not applicable, the step has no script and no test.
- The A/B and the look: none configured. No ADR record exists (`ls docs/adr` prints README.md and template.md).

Reviewer usage: claude-opus-5-5 (ordo-high), 210664 tokens, 31 tool uses, 7.0 minutes ($1.41 to $5.14).

## Repair round 1, refuted

Place numbers are those of the worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2h-3a` after the round. The round's delta was read as the round brief lists it, against `git diff 7e3dbc2 -- . ':!.scratch'`.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
(exit status 0)

Round check 2. Each text taken from the round brief's own lines (3a-round-1.md lines 8, 14, 20, 26, 27, 35, 36, 37, 44, 50, 51, 57, and the row cell), written as the one line of a file under $TMPDIR, then grep -c -F -f <file> <target>:
n1 (rule 13, fourth bullet): docs/dev/change-standard.md 1; skills/repo-setup/templates/docs/dev/change-standard.md 1
n2 (rule 13, fifth bullet, added sentence): 1; 1
n3 (brief.md "Cases" bullet): 1 (with -x: 1)
n4a, n4b (spec SKILL.md bullet and sub-bullet): 1, 1
n5a, n5b, n5c (brief.md "Report" 4, 5, 7): 1, 1, 1 (with -x: 1 each)
old parts 7 to 11 of the brief renumbered 8 to 12, words unchanged: 1 each of five (with -x: 1 each)
n6a, n6b, n6c, n6d, n6e (refute SKILL.md): 1, 1, 1, 1, 1
The replaced texts: o1 (old rule 13 sentence) 0 and 0; o3 (old "Cases" bullet) 0; o4 (the three sentences in one bullet) 0; o5a, o5b (old parts 4 and 5) 0, 0; o6a ("that the report's terms part does not name") 0; o6d ("found by reading it or by a change of the reviewer's own") 0; o6e (old row cell) 0.
Indents: skills/spec/SKILL.md:246 three spaces, :247 five; skills/refute/SKILL.md:62 and :63 three, :117 and :125 two.

Round check 3. $ git diff --stat
 docs/dev/change-standard.md                          |  6 +++---
 skills/refute/SKILL.md                               | 10 +++++++---
 .../repo-setup/templates/docs/dev/change-standard.md |  6 +++---
 skills/spec/SKILL.md                                 |  2 ++
 skills/spec/templates/brief-check.md                 |  7 +++++++
 skills/spec/templates/brief.md                       | 20 ++++++++++++++++++--
 6 files changed, 40 insertions(+), 11 deletions(-)
$ git diff -U0 <each change standard> | grep '^[-+]' | grep -v '^+++\|^---' | md5
eb4cc39a2ba922c1dda0d022806263ff
eb4cc39a2ba922c1dda0d022806263ff
(3 removed and 3 added lines in each)
$ git status --short
 M on the six files, ?? .scratch/2-h-session-retro/agents/reviews/3a-report.md, nothing else.

Round check 4. $ LC_ALL=C grep -n '[^ -~]' <the six files>
(prints nothing, exit status 1)

Round check 5. $ git grep -n "reviewer's own\|change of its own\|scratch copy" -- skills docs README.md utils
26 lines, as the report says: 10 that speak of the reviewer (docs/dev/change-standard.md:43, its template copy :43, skills/refute/SKILL.md:62, :63, :84, :101, :114, :117, :172, :182) and 16 on the scratch copies of `diagnose`, of two roadmap gates, of `ordo-help`, of `plan-orchestration` and of the git guard test. Read: rule 13 (both copies), refute :62, :63, :117 and :172 agree that the reviewer's change is made, per case of a code step, on a scratch copy outside the worktree and the main checkout.

Round check 6, reading: "Report" of brief.md has twelve parts numbered 1 to 12 (lines 72 to 83); eight check bullets at skills/spec/SKILL.md 239 to 246 and eight headings `## 1.` to `## 8.` in brief-check.md; the three lists of "The four headings" end with a period at refute :106, :117 and :128; Steps 5 of `refute` is judged under Standards 2 below.

Brief's Verify 5. $ grep -n -i 'glossary\|prose standard\|skill-layout\|docs/' <the three spec files>
hits at SKILL.md:50, :245, :246, brief.md:77, brief-check.md:43, :49, the six the report quotes.
Brief's Verify 6. $ git grep -n 'names no revert\|finds such a test by reading it' -- skills docs README.md utils
(prints nothing, exit status 1)

Commands the report quotes:
$ wc -l of the six files and the report: 89, 71, 298, 83, 62, 185, 274. As the report says.
Glossary headwords over the added lines of `git diff -U0 7e3dbc2` (each headword matched as a whole word, the hits read): base, brief, builder, case, Closed, Doc text, finding, landing, ledger, open item, orchestrator, part, place, plan, premise, reviewer, rules file, ruling, standards, state file, step, worktree. The report's "The terms" names each of them, the three it sets aside as other senses (Closed, place, part) included.
$ git grep -n -i 'read-only\|changes nothing\|without changing anything\|An edit to any file' -- skills docs README.md utils .agents/plan.yaml
No hit calls the reviewer read-only; the "read-only" hits are the brief-check agent (README.md:18, glossary :16, plan-terms.md:11, plan-orchestration :137), `grill`'s lookup, `diagnose` and `spec` :112. The hits that say the reviewer changes nothing are README.md:5, docs/figures/gen_figures.py:599, the glossary's **reviewer** entry in both copies, and refute :3 and :10.
$ ls docs/adr
README.md template.md
The main checkout's report and the worktree's copy: `cmp` exits 0.
Option (a) of the ruling, word for word: the five reworded strings of rewordings 1, 2, 4, 5 and 6 each print 1 with `grep -c -F` in their files (rewording 1 with the round's added words "with that change made"; rewording 2 beside the round's "and, when the script refuses the input,"), and rewording 3 is the third sentence as a sub-bullet, its words unchanged.
```

### Verdicts

Items of the brief's "What to build", as the round changed them, for the whole diff since `7e3dbc2`:

- 1: holds, skills/spec/SKILL.md:246 and :247, the bullet with its third sentence as a sub-bullet, after **ADRs** and before "The checks are done" (n4a and n4b print 1, o4 prints 0).
- 2: holds, brief-check.md lines 47 to 52, not touched by the round; its two bullets match the bullet and the sub-bullet of item 1.
- 3: holds, brief.md:19 is the round's text (n3 prints 1 with -x); line 18 is not in the diff.
- 4: holds, brief.md:25, the last paragraph of "Cases", not touched by the round.
- 5: holds, brief.md:66, not touched by the round.
- 6: holds, brief.md lines 70 to 83, the opening line and twelve parts: parts 4, 5 and 7 as the round gives them, parts 8 to 12 the old 7 to 11 with their words unchanged (each prints 1 with -x).
- 7: holds, the three changed lines of rule 13 in each copy, the two filtered diffs equal by md5, no other line of either file in the diff; the fourth bullet is the round's two sentences, the fifth has the round's added sentence.
- 8: holds, skills/refute/SKILL.md:105, :106 (Spec), :117 (Proof), :125 (Standards), :172 (the row's first cell, its other two cells unchanged), and :62, :63 (the round's two sub-bullets of Steps 5).

Cases of the brief's "Cases":

- R1: met, eight check bullets at skills/spec/SKILL.md 239 to 246, **Dictated text** the last before "The checks are done".
- R2: met, `## 8. Dictated text` before `## Declined to judge`; eight checks and eight headings in the same order.
- R3: met, brief.md:19 is the round's text, and line 18 is unchanged.
- R4: met, the paragraph of item 4 is the last of "Cases".
- R5: met, five items, the fifth as item 5 gives it.
- R6: met as the round changed it: the opening line and twelve parts, each part of the old paragraph among them.
- R7: met, identical in the two files, no other line changed, the grep prints nothing.
- R8: met, the Spec list has eleven bullets (96 to 106), the Proof list ten (108 to 117), the Standards list ten (119 to 128), each ending with a period on its last bullet; the parenthesis follows "taken out of the code"; the row's first cell is the round's.
- R9: met for the hits the case names: no hit of the two greps outside the step's paths is made false by the round. The sentences "without changing anything" and "who changes nothing" are under "Declined to judge".

Closures claimed, per item of the round brief and per finding of the first review:

- Round item 1 (rewording 1, and the first review's note on "the test's failing line"): holds. The text is option (a)'s plus "with that change made", which is the round's named addition.
- Round item 2 (first review, Standards 4): holds for a case whose test can run on the unchanged tree. What it leaves is Standards 4 below.
- Round item 3 (rewording 2, and Standards 6): holds. "case" is no longer used for a situation, and the error line is asked only "when the script refuses the input".
- Round item 4 (rewording 3): holds. The builder's point on the indent is judged under "The builder's two points" below.
- Round item 5 (rewordings 4 and 5, and Standards 5): holds, the named sentences now have part 7. What the new part 7 gets wrong is Standards 1 below.
- Round item 6 (rewording 6, and Standards 1, 2 and 3): holds. Rule 13 and `refute` now both say "and"; Steps 5 says when the change is made, how the copy is made, where, and that it is removed; the row forbids every edit outside the scratch copy, which keeps the old limit. No finding was closed by removing what it guarded. What Steps 5 leaves is Standards 2 and 3 below.
- Round item 7 (Proof 1): holds. My own headword run over the added lines gives no term the report's list leaves out.
- No fix reaches beyond its finding: every changed line of the diff is a text of the brief or of the round brief, read line by line against both.

### Findings

Spec: none. No line of the six files is changed that neither the brief nor the round brief asks for, and no dictated text differs from its source by a character.

Proof: none. Every count, path and command output the report gives for the round reproduces.

Standards:

- 1. skills/spec/templates/brief.md, "Report" 7: "Each sentence that item 5 of "Verify before you report" names as longer than the standards allow, with its reason." What is wrong: the part names the reading item by a fixed number, and the template's "Verify before you report" is a list whose length each brief sets (items 2 and 3 are placeholders for the step's own commands). This step's own brief shows it: its "Verify before you report" has 7 items and the reading item is number 7. The rules file's rule 19 (no two statements that contradict each other) is what a brief written from the template then breaks. Failure scenario: a brief with four commands of its own has the reading item at 7; its "Report" part 7, copied from the template, points at item 5, a command, and the builder lists nothing under the part or the reviewer looks for the sentences under the wrong item. Small enough to fix at landing, one sentence: "7. Each sentence that the reading item of "Verify before you report" names as longer than the standards allow, with its reason." The words are the orchestrator's, not one of the six the user ruled.

- 2. skills/refute/SKILL.md, Steps 5, the second sub-bullet: "The change is made on a scratch copy of the files the test runs, copied with `cp` into a folder under `$TMPDIR`, never in the worktree or the main checkout, and the folder is removed before the report is written." What is wrong, two rules of `docs/dev/skill-layout.md`. "Lists and tables": where the change is made and the removal of the folder are two requirements that can each be broken while the other holds, joined by "and", which the standard makes two bullets; it is the defect rewording 3 ended in the **Dictated text** bullet. "Writing for an agent": "Each item of Steps ends on its completion criterion"; the criterion of Steps 5 ("until every item ... and every case ... has a verdict") stands in its first line and the item now ends on the removal of a folder. Failure scenario: a reviewer checking a later diff of this skill cannot tell where one rule ends, and a reader who takes the item's last line as its end state has no criterion there; the same diff placed the **Dictated text** bullet before "The checks are done when ..." to keep that item's end. Fixable at landing by moving words, no new rule: line 61 ends at "gives the verdicts "The verdicts" lists."; the second sub-bullet ends at "never in the worktree or the main checkout."; a third reads "The folder is removed before the report is written."; a last reads "Steps 5 is done when every item of the brief's "What to build" and every case of its "Cases" has a verdict." That touches line 61, which neither brief lists, so the orchestrator decides.

- 3. skills/refute/SKILL.md, Steps 5, the first sub-bullet, against Steps 6 and `templates/report.md`: "it makes one change of its own that takes the case's behaviour out and runs the test against that change." What is wrong: nothing says where the report gives that change and what the test printed. Steps 6 lists the report's parts (the verification lines, the verdicts, the findings, "Declined to judge", the usage), and the template's verification block holds "each command of the brief's verification list" and "each command the report quotes as evidence". A change that shows the test to be a proof gives no finding, so it leaves no line. The rules file's closing sentence of "Commands and their filters" ("A claim about behaviour ... names the command that produced it") is what the report then cannot meet. Failure scenario: a reviewer skips the change, and its report reads the same as one from a reviewer who made it; the orchestrator cannot tell whether the check rule 13 asks of the reviewer was made. Fixable at landing with one sub-bullet of Steps 5: "The report's verification lines give each such change and the line the test printed with it made." The matching line of `templates/report.md` is outside the step's paths; whether to widen them is the orchestrator's call.

- 4. docs/dev/change-standard.md and skills/repo-setup/templates/docs/dev/change-standard.md, rule 13, fifth bullet, against its second bullet: "A case of a behaviour the change preserves has a row too, with its passing run on the unchanged tree in place of the failing line quoted for it." The second bullet: "passes on the unchanged tree in the form it had there, or, for a new test, whenever it can run there". What is wrong: a new test of a preserved behaviour that cannot run on the unchanged tree has no passing run there, and the new sentence asks for one without the condition. Rule 19 of the same page is broken. Failure scenario: a builder whose new test needs a file the step adds leaves the cell empty or invents a run, and the reviewer reports the row as incomplete. Small enough to fix at landing, in both copies: "A case of a behaviour the change preserves has a row too, with its passing run on the unchanged tree, or after the change when the test cannot run there, in place of the failing line quoted for it."

Behaviour:

- 1. The builder's report, "Visible changes, before and after (this round)". What is wrong: the rewritten report gives the before and after of the round's changes only. The visible changes of the first build (the eighth check and section 8 of the brief check, the paragraph on one small change in "Cases", item 5 of "Verify before you report", "Report" as a numbered list, "names no revert" gone from rule 13, the new Spec bullet of `refute`) are no longer in it, though the round brief asked for the report "for the tree as it is after this round". They stand in the first report, which `git show aca844c:.scratch/2-h-session-retro/agents/reviews/3a-report.md` prints under "Visible changes, before and after". The round's list also leaves out the "Cases" rewording from "the case where the program reading its output closes it" to "its output closed by the program reading it". Failure scenario: the landing report and the booking take the step's visible changes from the builder's report and state four of them. Not a fix in the tree: the orchestrator takes the first report's four bullets with the round's four at landing.

The builder's two points under "Anything wrong or impossible":

- The indent of the sub-bullet in skills/spec/SKILL.md: five spaces is right and nothing changes. The round brief's sentence "three spaces more" disagrees with its own fence, which shows two more. In the file every sub-bullet under a three-space bullet stands at five spaces (33 lines at five spaces, none at six).
- Steps 5 of `refute` and its completion criterion: the point holds, and it is Standards 2 above.

### Declined to judge

- Whether "Review a built step without changing anything" (refute, description), "dispatches one reviewer, who changes nothing" (refute, opening paragraph), the glossary's **reviewer** entry in both copies, README.md:5 and docs/figures/gen_figures.py:599 still hold now that Steps 5 of the same skill says the reviewer "makes one change of its own": the brief's "What is on the tree" rules that they do, since the change is on a scratch copy, and the round makes the two sentences stand in one file. The user's call, as in the first review.
- "and for a script its output closed by the program reading it before the script ends" stands in a parenthesis that lists inputs, and an output closed early is not an input: the words are rewording 2 as the user ruled it.
- Whether "found by reading it and by the reviewer's own change of Steps 5" (refute, Proof, last bullet) means a finding needs both to show it: the "and" follows rule 13 as ruled, and a careful reader could take it either way.
- Whether a reviewer of a compiled product can run a test on "a scratch copy of the files the test runs" without a second build: not checkable in this repository, which has scripts only. The "Anti-patterns" row on an unchecked point gives such a reviewer "Declined to judge".
- The word counts under "Sentences longer than the prose standard allows": not recounted, no decision rests on them.
- The reviewer's own change of rule 13 and of Steps 5: not applicable, the step has no script and no test.
- The A/B and the look: none configured. No ADR record exists (`ls docs/adr` prints README.md and template.md).

Reviewer usage: claude-opus-5-5 (ordo-high), 188651 tokens, 32 tool uses, 5.9 minutes ($1.15 to $4.40).

## Closed

- Proof 1 (the report's terms list incomplete): closed in the round, item 7 of `agents/briefs/3a-round-1.md`; the round's reviewer ran the glossary's headwords over the added lines and found no term left out.
- Standards 1, 2 and 3 (the reviewer's own change: "or" against rule 13, no step that says how, the Anti-patterns row): closed in the round, item 6; `skills/refute/SKILL.md` Steps 5, Proof's last bullet and the row's first cell.
- Standards 4 (a case of a preserved behaviour has no failing line): closed in the round, item 2, rule 13's fifth bullet in both copies.
- Standards 5 (the named sentences had no part of the report): closed in the round, item 5, "Report" 7 of `skills/spec/templates/brief.md`.
- Standards 6 (an accepted input has no error line): closed in the round, item 3, the second bullet of "Cases".
- Round 1, Standards 1 ("Report" 7 names item 5 by number): fixed at landing, the part reads "the reading item of "Verify before you report"".
- Round 1, Standards 2 (two requirements in one sub-bullet, and Steps 5 not ending on its completion criterion): fixed at landing, `skills/refute/SKILL.md` Steps 5: the removal of the folder is a sub-bullet of its own and the last sub-bullet is "Steps 5 is done when ...".
- Round 1, Standards 3 (nothing says where the report gives the reviewer's change): fixed at landing, a sub-bullet of Steps 5 and a line of the verification block of `skills/refute/templates/report.md`, which joined the step's paths.
- Round 1, Standards 4 (a new test of a preserved behaviour that cannot run on the unchanged tree): fixed at landing in both change standards, "or after the change when the test cannot run there".
- Round 1, Behaviour 1 (the rewritten report gives the round's visible changes only): closed with no change to the tree; the booking and the landing report state the visible changes of the first build, from the report at commit aca844c, with the round's.
- The builder's point on the indent of the sub-bullet in `skills/spec/SKILL.md`: five spaces is right, as its neighbours, and nothing changes.
