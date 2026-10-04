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

## Repair round 1, refuted

Reviewer of repair round 1 of step 12b (worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12b`, base d8bf470, round sent from the tree in `agents/reviews/12b-round-0.diff`). I changed no file, ran only `git -C <worktree> diff` and `git status --short` as git, invoked no skill, started no agent. A page this report cites is named with its section.

Outcome in one sentence: all 8 rulings of the round are done as ruled and word for word where dictated, nothing outside the six paths changed, the whole diff holds every item and meets every case, and I found no shape of the seven the six sub-bullets cannot name. The findings are small defects of the builder's report text and two style points on dictated sentences, none of which makes an item or case violated, partial or unmet.

### Verification (rerun by the reviewer)

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
```

Brief's other Verify commands, from the worktree root:

```
Verify 2: grep -n 'names its finding by the path\|also gives the finding.s number\|also gives .round <n>.\|For a diagnosis record or a landing report the bullet\|finds the finding under that heading' skills/roadmap/SKILL.md | cut -c1-90 ; grep -c 'finds the finding there' skills/roadmap/SKILL.md
56:       - Such a bullet names its finding by the path of its report under the plan's `ag
57:       - For a refuter report or a brief-check report, the bullet also gives the findin
58:       - For a finding of a refuter report's run over a repair round, the bullet also g
60:       - For a diagnosis record or a landing report the bullet gives no number, and a d
61:       - `/roadmap` reads that report and finds the finding under that heading, in the 
0
(line 59 is the round's new sub-bullet "Where a run's findings stand under one heading "Findings"")
Verify 3: grep -m1 version: skills/roadmap/SKILL.md ; grep -m1 version: skills/diagnose/SKILL.md skills/repo-setup/SKILL.md
  version: "1.3.0"
skills/diagnose/SKILL.md:  version: "1.1.0"
skills/repo-setup/SKILL.md:  version: "1.3.0"
base 9fc91dc: diagnose "1.0.0", repo-setup "1.2.1", roadmap "1.2.0" (git show 9fc91dc:skills/<s>/SKILL.md | grep -m1 version:)
Verify 4: git diff --name-only ; git status --short --untracked-files=all
docs/glossary.md
skills/diagnose/SKILL.md
skills/diagnose/templates/diagnosis.md
skills/repo-setup/templates/plan-terms.md
skills/roadmap/SKILL.md
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/diagnose/templates/diagnosis.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
?? .scratch/2-e-a-self-rule/agents/reviews/12b-report.md
Verify 5: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"
exit 1
(also LC_ALL=C grep -n '[^ -~]' over 12b-report.md: exit 1)
```

Commands of the round's report, rerun:

```
wc -l skills/roadmap/SKILL.md skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md skills/repo-setup/templates/plan-terms.md docs/glossary.md 12b-report.md
210, 259, 106, 127, 144, 167      (report claims 210, 259, 106, 127, 144: reproduced)
grep -c '^# Step 12b report' 12b-report.md   -> 1   (first line appears once)
grep -rn -i 'appended' skills/diagnose docs README.md
skills/diagnose/SKILL.md:58, skills/diagnose/templates/diagnosis.md:3, docs/glossary.md:94   (the three places the report names)
grep -n -i 'diagnosis record\|its own heading' docs/glossary.md skills/*/SKILL.md skills/*/references/*.md README.md docs/dev/*.md   (same places as the report's item 3)
word for word, python comparison against the round brief's fenced block and the brief's block:
  line 59 == round brief item 1 block, indent 7 spaces, after the sub-bullet at line 58: True
  lines 56, 57, 58, 60, 61 == the brief's five dictated lines, line 61 with the round item 2 clause: True x5
  diagnose SKILL.md Steps 2 sentence == round item 3 text: True; diagnosis.md paragraph == round item 3 text: True
  plan-terms.md and glossary.md contain the round item 4 sentence before "Stated in:": True x2; "; `roadmap`, "What it reads" 6." closes the entry's list: True
git diff d8bf470 --stat: 5 files changed, 10 insertions(+), 6 deletions(-); the round's delta is one sub-bullet and one clause in roadmap, one sentence each in diagnose SKILL.md, diagnosis.md, plan-terms.md and glossary.md
```

### Verdicts (the whole diff since d8bf470)

Items of the brief's "What to build":

- 1: holds. Lines 56 to 61 of `skills/roadmap/SKILL.md` are the five dictated sub-bullets in order, word for word (line 61 with the round 1 item 2 clause), with the round 1 item 1 sub-bullet at line 59; same indent; the old two sub-bullets are gone (`grep -c 'finds the finding there'` prints 0); lines 62 to 65 ("plan is open", the goal check, "A check that fails leaves no ruling.", "The skill says which check failed.") are unchanged in the diff.
- 2: holds. Read on the worktree: **quoted ruling** (`docs/glossary.md:87`, `plan-terms.md:82`) states the ending and the place, not the form of the name; `skills/plan-orchestration/references/self-rule.md:29` points at "What it reads" 6 and states no form; `roadmap` Rules first bullet (`skills/roadmap/SKILL.md:204`) still holds ("names" stays what a bullet does); **finding** (`docs/glossary.md:45`) is now widened by ruling in round 1 item 4 and is not false.
- 3: holds. Verify 3 prints `  version: "1.3.0"`; the base had 1.2.0 and no "self-rule" in the file, so the one minor raise of the plan covers the change (`docs/dev/skill-layout.md`, Frontmatter). `diagnose` 1.1.0 and `repo-setup` 1.3.0 are the plan's one raise from 1.0.0 and 1.2.1; neither moved in this step.

Cases of the brief's "Cases", read on the tree:

- 1 (`7-brief-check.md`, "4. Cases and checks", 4): met. The numbered list after "Findings:" (lines 137 to 146) has finding 4 "Case 15: ...", which sub-bullet 2 ("in the list of findings under that heading") selects.
- 2 (`12-refuter.md`, "1. Spec", 1, no round): met. The first run's `## 1. Spec` (line 105) starts with the `skills/grill/SKILL.md` finding; sub-bullet 5 reads the first run when no `round <n>` is given.
- 3 (`11b-refuter.md`, `round 1`, "3. Standards", 1): met. `### 3. Standards` (line 245) under `## Repair round 1, refuted` starts with the `11b-report.md` "Cases read on the text after the change" finding.
- 4 (`12-refuter.md`, `round 1`, "Reviewer B, Sonnet", "1. Spec", 2): met, and now by sub-bullet 5 alone, since the round 1 clause says "inside the reviewer's section when the bullet gives one". The second bullet under `#### 1. Spec` (line 488) of `### Reviewer B, Sonnet` is the `skills/diagnose/SKILL.md` Steps 11 finding.
- 5 (`3-diagnosis.md`, title, no number): met. `grep -c '^# '` prints 1; the whole record is the text under the title.
- 6 (a record with a later diagnosis appended, its heading, no number): met, and now for both diagnoses. The appended heading is a level-1 `# Diagnosis: ...` (round 1 item 3), so the text under the title ends at it and the text under the later heading is its own.
- 7 (`12-landing.md`, "What was found", no number): met. Lines 38 to 52 hold five top-level bullets, twelve with sub-bullets; the text runs to `## Verification on main`. The brief on main now says five.
- 8 (a refuter report and a heading, no number): met. Sub-bullet 2 requires the number and sub-bullet 6 finds the finding by it, so no finding is found; lines 64 and 65 stand.
- 9 (a plan folder under `<archive_root>/`): met. Line 62 is unchanged; `.scratch/archive` lies under `.scratch`.
- 10: met, Verify 3.

The 8 rulings of the round brief:

- 1 (Spec 2, grouped `Findings`): done. Line 59, word for word, after the sub-bullet beginning "For a finding of a refuter report's run over a repair round", same indent.
- 2 (Spec 4, reviewer's section): done. The replacement is exactly "in the first run or in the run of `round <n>`, inside the reviewer's section when the bullet gives one:", nothing else in that sub-bullet changed.
- 3 (Spec 3, level of a later diagnosis): done in both places, word for word. The other places that state how a record is headed (`skills/land/SKILL.md:107` "one heading per diagnosis", glossary **diagnosis record**, glossary **refuter report**) still hold, which I re-read.
- 4 (Standards 1, sense of **finding**): done, word for word, in `plan-terms.md` and `docs/glossary.md`, with `roadmap`, "What it reads" 6 added to "Stated in"; the sync check prints `ok: the plan-terms block equals the template`.
- 5 (Proof 1): done. Point 3 of the report now counts "in the list of findings under the heading, as Case 1 reads it", and the report's example is right (fourth item of the "Findings:" list is "Case 15").
- 6 (Proof 2): done. Point 2 now says a round run written to the template holds one list under "Findings" and that the grouped shape of `6-refuter.md` and `4-refuter.md` is the one item 1 names. The claim "two other shapes" is right in kind (see the shape reading below).
- 7 (Spec 1): done by the orchestrator in the ledger; `grep -n -i 'six\|five top-level' 12b.md` shows "five top-level bullets ... twelve with their sub-bullets" in "What is on the tree" and "the five top-level bullets" in case 7.
- 8 (report): done. First line once; "Open items ... verbatim" reads "None."; the "Repair round 1" section lists each item with its place before and after and the checks' output.
- No fix reaches beyond its finding, no check was removed instead of fixed, and no path outside the six changed (`git status --short` above: five repository paths and the report).

### Reading of the six sub-bullets, shape by shape

Read from lines 56 to 61 alone, with the pointer to `diagnose` "What it reads" 5 that sub-bullet 3 gives for "Repair round <n>, refuted". Each bullet below is the name a running `/roadmap add` would be given and what it reads.

- A refuter report's first run: path, heading as written ("3. Standards"), number, no `round`. Reads the numbered finding under that heading in the first run. Nameable.
- A round run with repeated numbered headings (`11b-refuter.md`): `round 1`, "3. Standards", 1 reads the first finding under `### 3. Standards` of `## Repair round 1, refuted`. `11c-refuter.md` is the same shape with an empty `### Findings` heading before `### 1. Spec`; findings stand under the numbered headings, so the same reading applies. Nameable.
- One section per reviewer (`12-refuter.md`): `round 1`, "Reviewer B, Sonnet", "1. Spec", 2. Nameable, and unambiguous since the round 1 clause puts the search inside the section.
- One `Findings` heading grouped by bold labels (`6-refuter.md`, `4-refuter.md`): `round 1`, "Standards", 3 reads the third item under the label `**Standards**` in `### Findings`. The same line covers the plain-text labels of `3-refuter.md` ("Proof:", "Standards:") and the `#### Spec` sub-headings under `### Findings` of `.scratch/2-f-diagnose/agents/reviews/1-refuter.md`. Nameable.
- A brief-check report (`7-brief-check.md`): "4. Cases and checks", 4. The section holds a bulleted list of per-case checks and then a numbered "Findings:" list; "the list of findings" is the second one. Nameable.
- A diagnosis record (`3-diagnosis.md`): the title "Diagnosis: ..." as heading, no number, the whole text up to the next level-1 heading. Nameable for the first diagnosis and, with round 1 item 3, for a later one.
- A landing report: "What was found", no number, the text to the next `##`; with only a title (`3-landing.md`, `1-landing.md`, `2-landing.md`) the title is the heading and the whole report is the text. Nameable.

I found no shape of the seven that the text cannot name. One soft spot, listed as Standards 3.

### 1. Spec

- none. Every item and case of the brief is met and each ruling of the round is done as ruled (verdicts above). One note on the brief, not on the build: the brief's Verify 2 says the five sub-bullets print "on consecutive lines", and the round put a sixth sub-bullet at line 59 between them, so the printed lines are 56, 57, 58, 60, 61. The round brief did that, the report states it beside the output, and the brief's Verify 2 text was not updated for it; no verdict.

### 2. Proof

- none. Every command the report quotes for the round reproduces (checks.sh lines, Verify 2 to 5, `grep -rn -i 'appended'`, the line counts, the sync check). Every dictated text equals its fenced block or quoted replacement (python comparison above).

### 3. Standards

1. `.scratch/2-e-a-self-rule/agents/reviews/12b-report.md`, first line, "Repair round 1" items 3 and 6, "Change carried to every place that names it" block, "Repair round 1" Verify 3 block: "Five facts of the brief's text differ from the tree, listed under "Anything in the brief wrong or impossible"" / "the `roadmap` fourth sub-bullet ("the record's title for its first diagnosis or the heading a later diagnosis is appended under")" / "which the fourth sub-bullet of repair round 1 names" / `skills/roadmap/SKILL.md:60:       - `/roadmap` reads that report and finds the finding under that heading, in ` / `skills/repo-setup/SKILL.md:  version: "1.3.0"` printed before `skills/diagnose/SKILL.md:  version: "1.1.0"`. What is wrong, against `docs/dev/change-standard.md`, "The rules" 7 (the report states the end state, no measurement stated that was not taken): four statements do not match the tree as it stands. (a) The section lists four numbered points, not five. (b) "fourth sub-bullet" names two different sub-bullets: in item 3 the diagnosis one (line 60, the fifth of six since line 59 was inserted) and in item 6 the grouped one (line 59). (c) The quoted grep hit for the `finds the finding under that heading` sub-bullet is at line 61 on the tree now, 60 in the report. (d) The two-file `grep -m1` prints `skills/diagnose/SKILL.md` first; the report quotes the lines in the other order. Failure scenario: the orchestrator or a later reader checking item 3's closure opens the "fourth sub-bullet" of `roadmap`, finds line 59 (the grouped-labels rule), sees no wording about a diagnosis record, and takes the closure of Spec 3 as unreproduced; or reads "five facts" and looks for a fifth. No decision rests on the line number or the order, so (c) and (d) are not Proof findings; the orchestrator can fix all four at landing, since each is a wording of the report. Verdict: none.
2. `skills/roadmap/SKILL.md`, "What it reads" 6, lines 59 and 61: "Where a run's findings stand under one heading "Findings", grouped by the labels Spec, Proof, Standards and Behaviour, the label stands for the heading and the number is counted in that label's list, as `round 1`, "Standards" and 3 name the third finding under the label "Standards" of the run over round 1." (54 words) and "`/roadmap` reads that report and finds the finding under that heading, in the first run or in the run of `round <n>`, inside the reviewer's section when the bullet gives one: by its number for a refuter report or a brief-check report, and as the whole text under the heading for a diagnosis record or a landing report." (59 words). What is wrong: `skills/repo-setup/templates/docs/dev/prose-standard.md`, E "Sentence length" (under roughly 20 words unless the mechanism needs more) and `docs/dev/skill-layout.md`, "Lists and tables" (two requirements joined by "and" are two bullets): line 59 states two requirements (the label stands for the heading; the number is counted in the label's list), line 61 three (where the finding is found; inside the reviewer's section; by number or as the whole text). Both are dictated words (round brief items 1 and 2), so the rewording is the orchestrator's to rule (`change-standard.md`, "The rules" 4), and lines 56 to 58 of the first run are of the same length class. Failure scenario: a running `/roadmap` that reads line 61 takes the colon as binding only the reviewer's-section clause and applies "by its number" to a landing report, or the reverse; the check then fails or reads a different text. I found no case where the tree's reports make it do so, which is why the verdict is none. Verdict: none.
3. `skills/roadmap/SKILL.md`, line 59, against the template shape: "grouped by the labels Spec, Proof, Standards and Behaviour". What is wrong: a run written to `skills/refute/templates/report.md`'s round shape is one flat list under `### Findings` with "under the heading it belongs to" written inside each bullet (`5-refuter.md`: "**Proof 1.**", "**Proof 2.**"; `2-refuter.md`: "Finding 1, spec and proof"). Lines 57 and 58 name such a finding as `round 1`, "Findings", its place; line 59 does not apply to it because the list is not grouped, and the text does not say that. Failure scenario: a bullet written from the ledger's habit, `round 1`, "Standards", 1, for a flat list whose first "standards" bullet is the third item finds no "Standards" label, so the check fails and no ruling is left. That fails safe (no ruling) and not by reading another finding, so the verdict is none; a clause "not for a list whose bullets only name their heading" would close it. Verdict: none.

### 4. Behaviour

- none. The report states the one user-visible change (`/roadmap add` on a "(self-rule)" bullet, before and after) and, in its new section, `/diagnose` appending a later diagnosis at the level of the record's title and the glossary entry **finding** gaining the sense for a landing report or a diagnosis record. I grepped `skills`, `docs`, `README.md` and `utils` for `number there`, `names its finding`, `heading the finding`, `finds the finding`, `finding of a running plan`, `heading and number`, `its own heading`, `later diagnosis`, `one heading per diagnosis` and `Diagnosis:` and found no sentence the round makes false: `skills/refute/templates/report.md` ("the finding, as heading and number"), `skills/ordo-help/SKILL.md` ("round <n> Spec 1 names a finding of the run over repair round <n>"), `skills/diagnose/SKILL.md` "What it reads" 5, `skills/plan-orchestration/references/self-rule.md` (line 29), the glossary entries **quoted ruling**, **diagnosis record**, **refuter report**, and the roadmap intro bullet (line 55) and Rules (line 204) all hold. No ADR is touched (`docs/adr/0004` is the one the brief names; 0003 and 0007 mention findings in another sense).

### Declined to judge

- Whether the goal check against the whole text under a landing report's heading, which holds several defects and non-defects, is checkable enough: it is the design Open item O (a) ruled, the user's call.
- Whether the round's dictated lines (59 and 61) were held line by line before the round brief was committed, as `plan-orchestration` Steps 8 "Dictated text" asks: the state file and the round brief carry no record of the hold, and I cannot see the orchestrator's session.
- The served model of this reviewer: the runner's record is the orchestrator's to read.
- A first run that holds one section per reviewer (no such report is on the tree, so the text's silence on it affects no ledger file today).
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`: I did not rerun the write (it changes a file); I reran the read-only check, which prints `ok: the plan-terms block equals the template`.

Reviewer usage: ae3638bef5f010d8f, claude-sonnet-5-5 (ordo-high), 214322 tokens, 54 tool uses, 10 min 22 s.

## Closed

- First run, Spec 1 (the brief's count of bullets under `12-landing.md` "What was found"): the brief corrected in the ledger to five top-level bullets, twelve with their sub-bullets (round ruling 7).
- First run, Spec 2 (a round run grouped by labels under "Findings"), Spec 3 (the level of a later diagnosis's heading), Spec 4 (the reviewer's section in the reading), Standards 1 (the sense of **finding**), Proof 1 and Proof 2 (the report's points 3 and 2): closed in repair round 1 by rulings 1 to 6 of `agents/briefs/12b-round-1.md`; the run over the round finds each done.
- Run over round 1, Spec (the brief's Verify 2 said "on consecutive lines"): the brief corrected in the ledger to "in order".
- Run over round 1, Standards 1 (four wording points of the builder's report): fixed at landing. The report says four facts, names the `roadmap` sub-bullets by their content instead of by their place, quotes the hit at line 61, and gives the `grep -m1` lines in the order the command prints them.
- Run over round 1, Standards 2 (two dictated sub-bullets of `roadmap` "What it reads" 6 with several requirements each): fixed at landing. The grouped-labels sub-bullet keeps the rule that the label stands for the heading, with the counting of the number as its sub-bullet. The reading sub-bullet keeps where `/roadmap` reads, with the reviewer's section, the number and the whole text under the heading as three sub-bullets.
- Run over round 1, Standards 3 (a flat list under "Findings" with no labels): fixed at landing by the sub-bullet "A list under "Findings" that no label groups is named by the heading "Findings" and the finding's place in that list.", beside the grouped-labels sub-bullet.
- Run over round 1, declined to judge, whether the round's dictated lines were held to the standards pages before the round was sent: they were not held line by line, and Standards 2 is what that hold would have found; it is fixed above.
