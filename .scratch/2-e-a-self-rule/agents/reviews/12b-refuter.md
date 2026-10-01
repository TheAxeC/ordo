# Step 12b refuter report (on .agents/worktrees/2ea-12b, base d8bf470)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ ( cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12b && sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md ); echo "exit $?"
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
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
exit 0

Verify 2: grep -n 'names its finding by the path\|also gives the finding.s number\|also gives .round <n>.\|For a diagnosis record or a landing report the bullet\|finds the finding under that heading' skills/roadmap/SKILL.md | cut -c1-90 ; grep -c 'finds the finding there' skills/roadmap/SKILL.md
56:       - Such a bullet names its finding by the path of its report under the plan's `ag
57:       - For a refuter report or a brief-check report, the bullet also gives the findin
58:       - For a finding of a refuter report's run over a repair round, the bullet also g
59:       - For a diagnosis record or a landing report the bullet gives no number, and a d
60:       - `/roadmap` reads that report and finds the finding under that heading, in the 
0

Verify 3: grep -m1 version: skills/roadmap/SKILL.md
  version: "1.3.0"

Verify 4: git diff --name-only ; git status --short --untracked-files=all
skills/roadmap/SKILL.md
 M skills/roadmap/SKILL.md
?? .scratch/2-e-a-self-rule/agents/reviews/12b-report.md

Verify 5: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"
exit 1

git -C <worktree> diff d8bf470 (stat): skills/roadmap/SKILL.md | 7 +++++--, 5 insertions(+), 2 deletions(-)

The five added lines against the brief's fenced block (awk over the brief's block, leading spaces stripped, diffed with the '+' lines of the diff): IDENTICAL, 5 lines each.

Report's evidence commands, rerun:
grep -rn -i 'number there\|names its finding\|heading the finding\|finds the finding' skills docs README.md utils | cut -c1-110
skills/roadmap/SKILL.md:56:       - Such a bullet names its finding by the path of its report under the plan's
skills/roadmap/SKILL.md:60:       - `/roadmap` reads that report and finds the finding under that heading, in 
skills/diagnose/templates/diagnosis.md:3:Every quoted command output carries `<REDACTED>` in place of the valu
skills/diagnose/SKILL.md:58:   - A later diagnosis of the same step is appended to that file under its own hea
(same four hits as the report, in another order)
sed -n 38,53p .scratch/2-e-a-self-rule/agents/reviews/12-landing.md | grep -c '^ *- '      -> 12
top-level bullets under "## What was found" of 12-landing.md (awk + grep -c '^- ')          -> 5 (also 5 at b1af081, the file's only commit)
grep -c '^# ' .scratch/2-f-diagnose/agents/reviews/3-diagnosis.md                            -> 1
wc -l skills/roadmap/SKILL.md 12b-report.md                                                  -> 209, 153; at d8bf470: 206
grep -c '^## What was found' 1-landing.md 2-landing.md 3-landing.md (2-e-a-self-rule)        -> 0, 0, 0
.agents/plan.yaml: ledger_root: .scratch ; archive_root: .scratch/archive
git show 9fc91dc:skills/roadmap/SKILL.md | grep -m1 version:   ->   version: "1.2.0" ; grep -c self-rule -> 0
LC_ALL=C grep -n '[^ -~]' 12b-report.md; echo "exit $?"   -> exit 1
The report's "Open items of the state file, verbatim" (Open item Q) equals the Open items section of the state file at the launch commit f70978a (git show f70978a:...); the main checkout's uncommitted state file now books Q as ruled (a).
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The five sub-bullets replace the two at `skills/roadmap/SKILL.md:56-60`, word for word (mechanical diff against the brief's block: identical), at the same indent, in order; the four sub-bullets after them (lines 61-64) are unchanged in the diff. The design gaps of the dictated text are Spec 2 to 4 below; none makes this item violated, since the item is the dictated wording.
- 2: holds. Reread on the worktree: **quoted ruling** (`docs/glossary.md:87`, `skills/repo-setup/templates/plan-terms.md:82`), **finding** (`docs/glossary.md:45`), `skills/plan-orchestration/references/self-rule.md:29`, `roadmap` Rules first bullet (`skills/roadmap/SKILL.md:203`). None states the form of the name and none is made false. The term's sense is Standards 1, which is not a false sentence.
- 3: holds, Verify 3 prints `  version: "1.3.0"`; 1.2.0 at the plan's base 9fc91dc with no "self-rule" in the file, so the minor raise of this plan covers this change under `docs/dev/skill-layout.md`, Frontmatter.

Cases of the brief's "Cases":

- 1 (`7-brief-check.md`, "4. Cases and checks", 4): met. Sub-bullet 2 counts "in the list of findings under that heading"; the list after "Findings:" in that section has finding 4 "Case 15: ...", which the case expects. Counting the section's top-level bullets instead would give "Case 3: consistent, and given by item 5.3" (see Proof 1).
- 2 (`12-refuter.md`, "1. Spec", 1, no round): met. Sub-bullet 5 reads the first run; the first bullet under `## 1. Spec` (line 105) is the `skills/grill/SKILL.md` "An answer that contradicts" finding.
- 3 (`11b-refuter.md`, round 1, "3. Standards", 1): met. Under `## Repair round 1, refuted`, `### 3. Standards` (line 245) begins with the `11b-report.md` "Cases read on the text after the change" finding, not the first run's `skills/plan/SKILL.md:87` finding.
- 4 (`12-refuter.md`, round 1, "Reviewer B, Sonnet", "1. Spec", 2): met by reading sub-bullets 3 and 5 together. The second bullet under `#### 1. Spec` (line 488) of `### Reviewer B, Sonnet` is the `skills/diagnose/SKILL.md` Steps 11 finding. Sub-bullet 5 itself does not say the reading is inside the reviewer's section (Spec 4).
- 5 (`3-diagnosis.md`, title, no number): met. One `# ` heading; the whole record is the text under it.
- 6 (a record with a later diagnosis, its heading): met by reading. The later diagnosis is appended below, so the text under its heading is its own. The first diagnosis of such a record is not bounded (Spec 3), which this case does not test.
- 7 (`12-landing.md`, "What was found", no number): met. Sub-bullet 5 reads the whole text under the heading. The text holds five top-level bullets, twelve in all, not the six the case states (Spec 1).
- 8 (a refuter report and a heading, no number): met. Sub-bullet 2 requires the number, sub-bullet 5 finds the finding by it, and "A check that fails leaves no ruling." and "The skill says which check failed." stand at lines 63-64.
- 9 (a plan folder under `<archive_root>/`): met. Line 61 is unchanged; `.scratch/archive` lies under `.scratch`.
- 10: met, Verify 3.

## 1. Spec

- `.scratch/2-e-a-self-rule/agents/briefs/12b.md`, "What is on the tree" (landing-report bullet) and Case 7: "`12-landing.md` holds six bullets under "What was found"" / "the finding's text is the six bullets under the heading"; what is wrong: the heading holds five top-level bullets and twelve bullets in all (rerun above; the same at b1af081). The brief check's P3 gave the same wrong count, and its closing "C3, P-a" rests on it. The step's text reads the whole text under the heading, so no count is in the skill; failure scenario: an orchestrator checking case 7 at landing against the brief counts five and reads the case as unmet, or a later brief copies "six" as a fact; verdict: none (case 7 met). A defect of the brief, not of the build.
- `skills/roadmap/SKILL.md:56-58` and the brief's "Decisions taken in this brief" 1, fourth citation: "`agents/reviews/6-refuter.md`, Standards 3 (`plan.md`, step 6's booking) gives heading "3. Standards", number 3."; what is wrong: step 6's "Standards 3" is a finding of the run over round 1 (`plan.md` step 6 booking: "the run over the round ... found Spec 1 to 4 and Standards 1 to 4"; "the "every run" sentences ... (Standards 3)"). That run has no heading "3. Standards": its findings stand under `### Findings` (`6-refuter.md:231`), grouped by bold labels **Spec**, **Proof**, **Standards**, **Behaviour**, each a numbered list restarting at 1. `4-refuter.md`'s round run groups its findings the same way. For this shape the five sub-bullets give no unambiguous name: the heading the finding stands under is "Findings", and "its place, counted from 1, in the list of findings under that heading" has several lists to count in; the bold label is not a heading. The decision's own form ("3. Standards", 3, no round) reads, under sub-bullet 5, the first run's third Standards finding ("The reason clause of "The counts" contradicts kind 3"), a different defect. Failure scenario: under self-rule the orchestrator books a `/roadmap add` bullet for the work of step 6's "Standards 3" as the ledger names it; written as Decision 1 gives it, `/roadmap` reads the first run's Standards 3 and the goal check fails or passes on the wrong defect; written as round 1, "Findings", 3, it reads Spec 3 or nothing definite; written as round 1, "Standards", 3, it finds no such heading. Each gives no ruling for work the ruling was meant to let through, or a check against the wrong text. Verdict: none (no case covers the `### Findings` shape). It needs a sentence for a round run whose findings stand under "Findings", grouped by label (the label as the heading, the number counted within the label's list), or a ruling that such a finding is named differently; the orchestrator's to word, since the text is dictated.
- `skills/roadmap/SKILL.md:59-60`: "a diagnosis record's heading is the record's title for its first diagnosis or the heading a later diagnosis is appended under" / "as the whole text under the heading for a diagnosis record"; what is wrong: `skills/diagnose/SKILL.md` Steps 2 ("appended to that file under its own heading") and `skills/diagnose/templates/diagnosis.md` give no level for the appended heading. When it is below level 1, the whole text under the title holds the first diagnosis and every later one, so the title does not single out the first diagnosis. The cause is in the `diagnose` skill, outside the step's paths (the builder's point 4). Failure scenario: a record holds two diagnoses, the second under `## Diagnosis: ...`; a bullet names the title for the first; the goal check reads the entry's goal against both, and a goal that is the second diagnosis's work passes on a bullet that named the first. Verdict: none (case 5's record has one diagnosis; case 6 names the later one). Closed by `diagnose` stating the level (a copy of the template's `# Diagnosis:` title), or by sub-bullet 4 bounding the first diagnosis at the next diagnosis's heading; the orchestrator rules which, and widens the paths for the first.
- `skills/roadmap/SKILL.md:60`: "`/roadmap` reads that report and finds the finding under that heading, in the first run or in the run of `round <n>`"; what is wrong: sub-bullet 3 makes the bullet give the reviewer's section heading, and sub-bullet 5, the reading, does not say the finding is found inside that section. `12-refuter.md`'s round run has "1. Spec" under both `### Reviewer A, Opus` (line 349) and `### Reviewer B, Sonnet` (line 488). Failure scenario: `/roadmap` reading sub-bullet 5 alone takes the first "1. Spec" of the round run, Reviewer A's, for a bullet that named Reviewer B; the goal check reads the wrong finding. Minor, since the section is given for no other purpose. Verdict: none (case 4 met by reading 3 and 5 together). One clause, "and in the reviewer's section where the bullet gives one", closes it.

## 2. Proof

- `.scratch/2-e-a-self-rule/agents/reviews/12b-report.md`, "Anything in the brief wrong or impossible" 3: "the number is the place among a heading's top-level bullets, counted from 1, which is what the dictated sub-bullet says"; what is wrong: the sub-bullet says "in the list of findings under that heading", not top-level bullets. Under `7-brief-check.md` "4. Cases and checks", the fourth top-level bullet is "Case 3: consistent, and given by item 5.3"; finding 4 of the "Findings:" list is "Case 15", which the report's own first run of case 1 gives. The claim contradicts the report's case 1 and is not reproduced by reading the text. Decision resting on it: the orchestrator's disposition of point 3 (whether the count rule needs a ruling); failure scenario: the orchestrator accepts the gloss, and a bullet written or read by it names a non-finding bullet or the wrong finding of a brief-check report; verdict: none.
- `12b-report.md`, "Anything in the brief wrong or impossible" 2: "A round run written to the template has no "3. Standards" heading, so a bullet's `round <n>`, heading and number would name nothing in it."; what is wrong: `skills/refute/templates/report.md`'s round run holds one list under `### Findings`, so the sub-bullets name such a finding as `round <n>`, "Findings" and its place, which is unambiguous for the template's shape. The failure is in the reports on the tree that group the `### Findings` list by bold labels with restarting numbers (`6-refuter.md`, `4-refuter.md`), Spec 2. Decision resting on it: whether point 2 is a defect of this step; failure scenario: the orchestrator treats point 2 as a defect of `refute`'s template alone and leaves the grouped shape, which the ledger already cites ("Standards 3" of step 6), unnameable; verdict: none.

## 3. Standards

- `skills/roadmap/SKILL.md:60`: "finds the finding under that heading ... as the whole text under the heading for a diagnosis record or a landing report"; what is wrong: `docs/dev/skill-layout.md`, "Writing for an agent", third bullet ("A term that `docs/glossary.md` defines is used only in a sense it defines there"). The glossary's **finding** is "a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario". The new sub-bullet makes "the finding" of a landing report the whole text under a heading, which in `12-landing.md` "What was found" is five summaries of several defects and of non-defects ("A cost $3.54 and B $2.94"), and in `.scratch/2-f-diagnose/agents/reviews/1-landing.md` a paragraph summarising fourteen findings. The builder raised this (point 1) and the brief keeps `plan-terms.md` out of the paths. Failure scenario: a reader applying the glossary sense looks under "What was found" for one defect with a place and a failure scenario, finds a summary of several, and either refuses the bullet or picks one item, so two runs on the same bullet differ. Verdict: none (item 1 dictated, item 2's sentences stay true). Closed by the entry **finding** in `skills/repo-setup/templates/plan-terms.md` gaining this sense (the text under a heading of a landing report or a diagnosis record), synced into `docs/glossary.md`, with the paths widened in this step; the orchestrator words it.

## 4. Behaviour

none. The report states the before and after of the one user-visible change, `/roadmap add --ruling` on a "(self-rule)" bullet, under "Host- or user-visible change". No "(self-rule)" `/roadmap add` bullet naming a landing report or a diagnosis record exists on the tree (`grep -rn 'landing.md\|diagnosis.md' .scratch/choices.md .scratch/rulings` printed nothing), so no booked bullet changes reading.

## The five points under "Anything in the brief wrong or impossible", judged

1. Six bullets against five: a real defect of the brief's premise and case 7 (Spec 1), not of the build. Its second half, the sense of "finding": a real defect of this step's dictated text (Standards 1), whose fix lies in `plan-terms.md`, outside the paths.
2. The round run's shape: partly a defect of this step. The dictated text cannot name a finding of a `### Findings` round run grouped by labels with restarting numbers (Spec 2). It is also a defect elsewhere: the round runs on the tree depart from `refute`'s template in three shapes (grouped `### Findings`; repeated `### 1. Spec`; per-reviewer `#### 1. Spec`). The report's "would name nothing" does not hold for the template's own shape (Proof 2).
3. Not a defect of this step: the text counts "the list of findings", which case 1 reads correctly. The report's gloss of it is wrong (Proof 1).
4. A defect elsewhere (`diagnose` gives no level for an appended diagnosis's heading) that shows in sub-bullets 4 and 5 for the first diagnosis of a record holding two (Spec 3).
5. Not a defect: the title is a heading, the whole report is the text under it, and that is what Open item O (a) ("the heading alone") rules for a landing report.

## Declined to judge

- Whether the goal check against the whole text under a landing report's heading, which holds several defects and non-defects, is checkable enough. This is the design Open item O (a) ruled ("the heading alone"), so it is the user's call.
- Whether Spec 2 is closed by a sentence in this step or by a ruling on how a grouped round finding is named. The wording is dictated, so it is the orchestrator's to decide, and the user's if it changes the form ruled under O (a).
- The served model of this reviewer. The runner's record is the orchestrator's to read.

Reviewer usage: af6d65d9212d1b716, claude-opus-5-5 (ordo-high), 164736 tokens, 41 tool uses, 10 min 7 s.
