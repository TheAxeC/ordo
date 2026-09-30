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

Reviewer usage: not known to the reviewer; the orchestrator fills it from the completion notice.

