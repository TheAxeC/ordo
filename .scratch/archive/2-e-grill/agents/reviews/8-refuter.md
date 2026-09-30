# Step 8 refuter report (on .agents/worktrees/2e-8, base f4e63fff2407373feecf0822350e8796b75f63a2)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0   (the `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh <state file>` run, from the worktree root)

git rev-parse HEAD (worktree)            -> f4e63fff2407373feecf0822350e8796b75f63a2
git status --short (worktree)            -> the six files M, plus ?? .scratch/2-e-grill/agents/reviews/8-report.md
Case 1 after:  git grep -n "names the revert" -- skills docs README.md utils   -> nothing, rc=1
Case 1 base:   git grep -n "names the revert" f4e63ff -- skills docs README.md utils -> 3 lines (both change-standard.md:39, spec/templates/brief.md:62)
Case 2 after:  git grep -n -i -E "revert that|turns (it )?red|change reverted|failing without it|red line it produced" -- docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/ skills/spec/ skills/refute/ skills/plan-retro/ -> nothing, rc=1; over the whole tree outside .scratch -> nothing
Case 2 base:   6 lines (both change-standard :39, plan-retro:67, refute:107, common.md:13, brief.md:62)
Case 3:        diff <(sed -n 39p docs/dev/change-standard.md) <(sed -n 39p skills/repo-setup/templates/docs/dev/change-standard.md) -> nothing, rc=0
Case 3/items:  python comparison of each changed line with the brief's dictated quote: change-standard:39 True, template :39 True, brief.md:62 True, refute:107 True, refute:108 True
Case 4:        grep -c -F "A test proves the change by failing on the unchanged tree, and the report quotes the failure" <3 files> -> 1, 1, 1
Case 5:        git diff --stat f4e63ff -- . ':!.scratch' | tail -1 -> 6 files changed, 7 insertions(+), 6 deletions(-)
Case 6 after:  grep -n -F '"a test that cannot fail"' skills/plan-retro/SKILL.md -> 67:...
Case 6 base:   git show f4e63ff:skills/plan-retro/SKILL.md | grep -n -F '"a test that cannot fail"' -> nothing, rc=1
Verify 3:      LC_ALL=C grep -n '[^ -~]' <six changed files> -> nothing, rc=1
Report's evidence: git diff --stat HEAD -- . ':!.scratch' -> 6 files changed, 7 insertions(+), 6 deletions(-) (HEAD is the base)
Report's final grep: git grep -n -i -E "revert that|turns (it )?red|change reverted|failing without it|red line it produced|names the revert|stays green" -- skills docs README.md utils -> nothing, rc=1
Writes outside the worktree: $TMPDIR/apply8.py exists (3449 bytes, 01:24), read in full: it asserts each old text and replaces line 39, 39, 62, 107 and the two substrings, with relative paths; git status --short in the main checkout -> " M .scratch/2-e-grill/orchestrator-state.md" and "?? .scratch/2-e-grill/agents/reviews/8-report.md" only. The report in main and in the worktree are identical (cmp).
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds, both line 39 copies equal the dictated text exactly (python comparison True, Case 3 diff empty). The dictated text itself carries Spec 1 to 6.
- 2: holds, `skills/spec/templates/brief.md:62` equals the dictated text exactly (True).
- 3: holds, `skills/refute/SKILL.md:107-108` equal the two dictated bullets exactly, at the list's indentation (True, True). The dictated text carries Spec 2 and Standards 1.
- 4: holds, `common.md:13` carries the new title (Case 4), rest of the line unchanged (diff).
- 5: holds, `plan-retro/SKILL.md:67` carries "a test that cannot fail" (Case 6), rest unchanged (diff).

Cases of the brief's "Cases":

- `git grep -n "names the revert" -- skills docs README.md utils`: met, 3 lines on the base, nothing after.
- The five-term grep under the five path groups: met, nothing after (6 lines on the base).
- Line 39 identical and equal to item 1: met.
- The new title counted 1 in each of three files: met.
- `git diff --stat <base> -- . ':!.scratch'`: met, `6 files changed, 7 insertions(+), 6 deletions(-)`.
- `"a test that cannot fail"` at plan-retro line 67 after, nothing before: met.
- Reading, rule 13 against ruling O5 (a): met; each of the four points is stated (fails on the unchanged tree; report quotes it; no revert per test; reviewer finds a test that cannot fail by reading).
- Reading, rule 17 (each old rule kept with the same scope, nothing added beyond the ruling and the decisions): partial. The listed rules (audit examples, control, table, table limit, verbatim quote) are all present. Missing: the new text makes impossible a new test of a behaviour the change preserves, which the old text allowed through a named mutation, and no decision of the brief covers it (Spec 1).
- Reading, rule 19 (no two statements contradict): unmet. Rule 13's own sentences contradict each other twice (Spec 2, Spec 3), and the builder's "Nothing contradicts another" is not reproduced (Proof 1).
- Reading, skill-layout "Writing for an agent", each new `/refute` bullet one rule: met; the first bullet's three alternatives are qualifiers of one rule, as "Lists and tables" allows. Its readability is Standards 1.

## 1. Spec

All findings below are in text the brief dictated; the builder wrote it exactly, so each is the orchestrator's to close by changing the dictated text (and, where marked, a decision normally Axel's, which ruling "Overnight work" 5 lets the orchestrator take and book).

- Spec 1. `docs/dev/change-standard.md`, rule 13 (both copies), "Every new test, and every test changed for a behaviour the change adds or changes, is run once on the unchanged tree and fails there, except a case asserting that a rule stays silent." with "A test changed only for a behaviour the change preserves passes on the unchanged tree and after the change"; what is wrong: a *new* test of a behaviour the change preserves (a characterisation test written before a refactor, or a test added for behaviour that was untested) cannot fail on the unchanged tree, and the preserved-behaviour sentence covers only a *changed* test. The old text allowed such a test through a named mutation (the existing 57 "Red when ..." comments are such mutations). Decision 6 covered changed tests only. `/refute`'s new first bullet and `brief.md:62` have the same gap. Failure scenario: a refactor step in a repository set up from the template adds a characterisation test first, as good practice; the builder cannot satisfy rule 13, so either drops the test or quotes a contrived failure, and the reviewer, applying the first new Proof bullet, files the honest test as a finding. Proposed text: "A new or changed test for a behaviour the change preserves passes on the unchanged tree and after the change, and the report quotes both runs", carried to the `/refute` bullet. Widening beyond the ruling's words "a new or changed test", so booked like decision 6. Verdict: the rule-17 case partial.
- Spec 2. Rule 13, "except a case asserting that a rule stays silent" against "the report quotes beside it the failure on the unchanged tree of the case or of its control, whichever fails there"; and `skills/refute/SKILL.md:107`; what is wrong: when the change fixes a false report (the brief's decision 3 names this case), the silent case fails on the unchanged tree and its control, a new test that is not a silent case, passes there. The exception in the third sentence excepts only the silent case, so the control, a new test, "fails there" by rule, which contradicts the whichever-fails sentence. Failure scenario: a step fixes a false `note:` in `check_config.py`, adds `x` (silent, fails on the base) and `x-control` (must report, passes on the base); the reviewer applies the first new Proof bullet to `x-control` as a new test with no quoted failure and files it, or the builder, reading the third sentence, rewrites the control so it fails on the base, changing what it tests. Proposed: "except a case asserting that a rule stays silent and its control", and the bullet's clause read the same way. Verdict: the rule-19 case unmet.
- Spec 3. Rule 13, the table: "the failing line that the case, or for a silent case its control, printed on the unchanged tree" against "whichever fails there"; what is wrong: in the false-report fix of Spec 2 the control passes on the unchanged tree and prints no failing line, so the table asks for a line that does not exist, while the sentence before it asks for the silent case's line. `brief.md:62` and the `/refute` bullet follow "whichever"; only the table column differs. Failure scenario: the builder of the Spec 2 step either leaves the row's cell empty (reviewer files it) or quotes the case's line against the column's words (reviewer files it either way depending on which sentence they read). Proposed: "the failing line that the case, or for a silent case the case or its control, whichever fails there, printed on the unchanged tree". Verdict: the rule-19 case unmet.
- Spec 4. Rule 13, "A test changed only for a behaviour the change preserves passes on the unchanged tree and after the change"; what is wrong: a test changed only because the change renamed something (a C++ class, a Python function, in a repository that installed the template) does not pass on the unchanged tree: the changed test fails there to compile or with a name error. It then fits neither sentence: it is not for a changed behaviour, and it cannot pass on the base. The brief check raised this (4.4, second bullet); decision 6 did not answer it. Failure scenario: the builder of a rename refactor either calls the rename a changed behaviour and quotes the compile error as the proof, which proves nothing, or cannot comply. Proposed: "the test as it was passes on the unchanged tree and the test as changed passes after the change; the report quotes both runs".
- Spec 5. `skills/refute/SKILL.md:108`, "a test that cannot fail, whatever the code under it does, found by reading it", with the brief's decision 7 ("The per-behaviour proof then rests on `/refute`'s reading for a test that cannot fail"); what is wrong: the reading defined here does not reach a test that can fail but not on its behaviour. The old bullet ("stays green with the change reverted") did. For a new script every test fails on the base with the missing-script error, and a test listed for behaviour B that asserts only exit 0 can fail (a crash), so it is not "a test that cannot fail", and nothing in the new texts makes it a finding. Decision 7's premise is false. Failure scenario: a step adds `utils/foo.py` with a table row "refuses an empty value / case `empty` / `sh: foo.py: not found`", the case asserting only a non-zero exit, which a crash also gives; the reviewer, applying both new bullets, passes it. The words "a test that cannot fail" are the ruling's (O5 (a)), so widening them ("a test that cannot fail when the behaviour it is listed for is broken") is a change to the ruling's text, Axel's or the orchestrator's under "Overnight work" 5.
- Spec 6. Rule 13, "No revert is named per test."; what is wrong: the sentence is unscoped. The brief's premise keeps the 57 per-test "Red when ..." comments (`grep -c "Red when"`: 24 in `check_config.test.sh`, 31 in `utils/pin.test.sh`, 2 in `sync_rules.test.sh`), which name a mutation per test, but the rule can be read as forbidding them. Failure scenario: the next builder adding a case to `check_config.test.sh` either follows the file's convention and is filed by the reviewer under Standards ("a documented standard the diff breaks", rule 13), or omits the comment and breaks the file's local form. Proposed: "The report names no revert per test" or say that the tests' comments are free to name one.
- Spec 7. Rule 13, "is run once on the unchanged tree"; what is wrong: the brief's decision 8 (a test changed in a repair round is run on the unchanged tree again) lives only in the ledger brief; the shipped text says "once". Failure scenario: a builder in a later plan changes a test in its repair round and reuses the round-0 quote, having already run it "once"; the reviewer over the round has no text to file it under. Proposed: drop "once", or add "again after every change to the test".

## 2. Proof

- Proof 1. `8-report.md`, "Reading cases", rule 19: "Nothing contradicts another." and "Holds"; what is wrong: the claim, and the reviewer's reading finds two contradictions inside rule 13 (Spec 2, Spec 3). The decision resting on it is whether the step lands as dictated. Failure scenario: the orchestrator reading the report alone lands a rule text whose sentences contradict. Verdict: the rule-19 case unmet.
- Proof 2. `8-report.md`, "Verify list lines as printed": the ASCII check's line is quoted as "'<the ASCII check as in the verify list>'", not verbatim, and the report says the exit status was not captured, while the brief's Verify 1 asks for "exits 0". The reviewer's rerun printed the full line and rc=0, so no decision rests on it now. Failure scenario: a lander reading the report alone cannot see the runner's exit status or the exact command that ran.

## 3. Standards

- Standards 1. `skills/refute/SKILL.md:107`, "... or for a test changed only for a behaviour the change preserves its passing runs before and after the change;"; what is wrong: prose standard, section E, "Sentence length" (the bullet is one sentence of about 60 words), and the last clause reads first as "the change preserves its passing runs", a garden path. Rule 13 is now ten sentences in one item, against section D's "under roughly four sentences". Failure scenario: a reviewer parsing the bullet mid-review misreads which runs the report must quote for a preserved-behaviour test and files, or skips, the wrong thing. Dictated text; a split into three bullets or sub-bullets under one rule would keep skill-layout's one-rule-per-bullet.

## 4. Behaviour

- Behaviour 1. `skills/spec/templates/brief.md:62` and `skills/refute/SKILL.md:107-108`; what is wrong: a host-visible change the report does not state. The report says "no script, test or host behaviour changed" and names only what `/repo-setup` installs. But the two skills Ordo ships now brief and review under the new rule in every repository that runs them, and game-engine and cathedra keep the old rule 13 in their own rules files (`grep`: `game-engine/docs/dev/change-standard.md:25` and `cathedra/docs/dev/standards/change-standard.md:25` still hold "names the revert that turns it red"), and `repo-setup` syncs only the shared-rules block and the glossary, not the change standard. Failure scenario: in game-engine, `/spec` writes a brief whose Verify 4 asks for a failure on the unchanged tree while the rules file, which "nothing in a brief overrides", asks for a named revert per test; the builder follows the rules file, and the `/refute` reviewer files every test under the new first Proof bullet. Changing those two repositories reaches outside Ordo, so under "Overnight work" 5 it stops for Axel; the report should have stated it, and the orchestrator should raise it as an open item.

## Declined to judge

- Whether Spec 1, 4, 5 and 7 should be closed by the orchestrator under "Overnight work" 5 or raised to Axel: each changes the text a ruling dictated or widens the ruling's words; that choice is the orchestrator's and Axel's, not the reviewer's.
- Ledger point, outside the step's diff: ruling "Overnight work" 5 says a decision the orchestrator takes overnight is "booked here" (plan.md), marked "decided by the orchestrator overnight". `grep -n -i 'decided by the orchestrator' plan.md orchestrator-state.md` finds only the ruling itself; decision 6 of brief 8 is booked in the brief only. Not a finding against the builder.
- Whether game-engine and cathedra should get the new rule 13 at all (Behaviour 1): another repository, Axel's call.

Reviewer usage: claude-opus-5-5; tokens and time are not visible to this agent (the runner's completion notice has them); 21 tool uses.

## Repair round 1, refuted

I changed no file. The only git commands I ran were `git diff f4e63ff`, `git status --short`, `git grep` and `git show f4e63ff:<path>`, all read-only, plus `diff` and `cmp`. All commands ran from the worktree root `/Users/axelfaes/workspace/ordo/.agents/worktrees/2e-8` unless a line below says otherwise.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0

The round's delta:
  diff .scratch/2-e-grill/agents/reviews/8-round-0.diff <(git diff f4e63ff -- . ':!.scratch')
    -> the only differences are rule 13 line 39 in both copies, skills/spec/templates/brief.md:62, and skills/refute/SKILL.md, where hunk @@ -104,7 +104,8 becomes @@ -104,7 +104,9 (2 bullets become 3); common.md and plan-retro are unchanged in the round
  git status --short (worktree) -> the six files M, ?? .scratch/2-e-grill/agents/reviews/8-report.md
  git status --short (main) -> M .scratch/2-e-grill/agents/reviews/8-report.md, M .scratch/2-e-grill/orchestrator-state.md
  cmp of 8-report.md in main and in the worktree -> identical (rc 0)

Dictated text against written text:
  python: the 5 quoted lines of 8-round-1.md compared with change-standard:39, the template :39, brief.md:62 and refute:107, :108, :109 -> True True True True True True

The brief's cases (case 5's count is the round's):
  Case 1 after: git grep -n "names the revert" -- skills docs README.md utils -> nothing, rc=1
  Case 1 base:  git grep -n "names the revert" f4e63ff -- skills docs README.md utils -> 3 lines (docs/dev/change-standard.md:39, skills/repo-setup/templates/docs/dev/change-standard.md:39, skills/spec/templates/brief.md:62)
  Case 2: git grep -n -i -E "revert that|turns (it )?red|change reverted|failing without it|red line it produced" -- . ':!.scratch' -> nothing, rc=1
  Case 3: diff <(sed -n 39p docs/dev/change-standard.md) <(sed -n 39p skills/repo-setup/templates/docs/dev/change-standard.md) -> nothing, rc=0
  Case 4: grep -c -F "A test proves the change by failing on the unchanged tree, and the report quotes the failure" <3 files> -> 1, 1, 1
  Case 5: git diff --stat f4e63ff -- . ':!.scratch' | tail -1 -> 6 files changed, 8 insertions(+), 6 deletions(-)
  Case 6 after: grep -n -F '"a test that cannot fail"' skills/plan-retro/SKILL.md -> 67:- A kind is a sentence that states the defect in general terms, ...
  Case 6 base:  git show f4e63ff:skills/plan-retro/SKILL.md | grep -n -F '"a test that cannot fail"' -> nothing, rc=1
  Verify 3: LC_ALL=C grep -n '[^ -~]' <six changed files> -> nothing, rc=1

Evidence the report quotes:
  $TMPDIR/apply8r1.py exists (2934 bytes), read in full: it asserts each old line's opening words and replaces lines 39, 39, 62 and 107-108; it computes nothing else
  git diff --stat HEAD -- . ':!.scratch' (HEAD is the base) -> 6 files changed, 8 insertions(+), 6 deletions(-)

Other repositories and the ledger:
  grep -c "names the revert" game-engine/docs/dev/change-standard.md cathedra/docs/dev/standards/change-standard.md -> 1, 1
  grep -n -i "decided by the orchestrator" plan.md orchestrator-state.md -> only plan.md:103, the ruling itself
  grep -n -i "Behaviour 1|game-engine" 8-round-1.md orchestrator-state.md -> only state:90, a sources line; nothing raises Behaviour 1

Length of the new text:
  rule 13 has 10 sentences; its sentences 4, 5, 6 and 8 run 38 to 41 words
  wc -w of refute:107, :108, :109 -> 42, 22, 40
```

### Verdicts

Items 1 to 3 are judged against the round brief's wording, which replaces the brief's items 1 to 3. Items 4 and 5 are judged against the brief.

- 1: holds. Both copies of line 39 equal the round's dictated rule 13 exactly (True, True), and the Case 3 diff is empty. Findings R1-1, R1-2, R1-5 and R1-7 are in that dictated text.
- 2: holds. `brief.md:62` equals the dictated text (True). Findings R1-1 and R1-5 are in that text.
- 3: holds. `refute/SKILL.md:107-109` are the three dictated bullets, in order, at the list's indentation (True, True, True). Findings R1-3, R1-4, R1-5 and R1-6 are in that text.
- 4: holds. `common.md:13` carries the new title (Case 4), and `git diff f4e63ff` shows only the quoted title changed.
- 5: holds. `plan-retro/SKILL.md:67` carries "a test that cannot fail" (Case 6), and only the example changed.
- Case 1, the "names the revert" grep: met. Three lines on the base, nothing after.
- Case 2, the five-term grep: met. Nothing after, anywhere outside `.scratch`.
- Case 3, line 39 identical in both copies and equal to item 1: met.
- Case 4, the title counted once in each of the three files: met.
- Case 5, the diff stat: met, `6 files changed, 8 insertions(+), 6 deletions(-)`.
- Case 6, "a test that cannot fail" at line 67 after and not on the base: met.
- Reading against ruling O5 (a): met. A test of an added or changed behaviour fails on the unchanged tree (sentence 3), the report quotes that failure and names no revert (sentence 4), and the reviewer finds a test that cannot fail by reading it (sentences 7 and 8). The narrowing to tests of an added or changed behaviour follows the brief's decision 6 and the round brief.
- Reading of rule 17 (the old rules kept, nothing added): partial, R1-1 and R1-2.
  - Kept: the audit examples, the control of a silent case, the table, the table's limit and the verbatim quote.
  - Narrowed by the round's ruling and not a finding: the old "the control's red output is quoted beside it" no longer applies in a fix of a false report, where the control passes on both trees.
  - Added: a condition on untouched existing tests (R1-1).
  - Narrowed beyond what the first report proposed: the proof that a new test's behaviour is preserved (R1-2).
- Reading of rule 19 (no two statements contradict): partial, R1-3, R1-4 and R1-5. The builder's three readings under point 5 reproduce: in each case the same test fails and passes where the builder says, under the sentences the builder names. What the readings miss is the disagreement between the `/refute` bullets and rule 13, and the scope of rule 13's sentence 3 against `brief.md:62`.
- Reading against skill-layout's "Lists and tables" and "Writing for an agent", one rule per `/refute` bullet: met. Each of the three bullets states one rule, and bullet 1's parenthesis is a qualifier of it.

### Closures

- Spec 1 (a new test of a preserved behaviour): closed as the first report stated it. Sentence 5 reads "A test of a behaviour the change preserves, new or changed, passes after the change". The closure is narrower than the first report's proposal, which asked for the run on the unchanged tree as well; see R1-2.
- Spec 2 (the control in a fix of a false report): closed.
  - Sentence 6 draws the quoted failure from "whichever of the two is the test of a behaviour the change adds or changes".
  - The control is then a preserved-behaviour test under sentence 5, and no sentence asks it to fail.
  - My reading of the builder's case 2 reproduces this.
  - A remainder is in the `/refute` bullet; see R1-5.
- Spec 3 (the table's column): closed. The column is now "the failing line quoted for it", which is the line that sentences 3, 4 and 6 name.
- Spec 4 (a rename): closed in rule 13. Sentence 5 asks for the old form's run on the unchanged tree. The `/refute` bullet does not carry that run; see R1-3.
- Spec 5 ("cannot fail" too narrow): partly closed; see R1-6. The ledger point is also open: the brief's decision 7 still rests on the old words, as the builder reports. The booking under ruling "Overnight work" 5 is not in `plan.md` yet (grep above); the round brief assigns it to the landing.
- Spec 6 ("no revert" unscoped): closed. Sentence 4 reads "and it names no revert", where "it" is the report, so the 57 "Red when" comments in the test files no longer break a rule.
- Spec 7 ("run once"): closed in rule 13. Sentence 3 adds "run there again after every change to the test", and "once" is gone from the changed lines. The `/refute` bullet does not carry it; see R1-4.
- Proof 1 (the rule-19 reading): closed. The three readings are in the report, and I reproduced them for those three cases.
- Proof 2 (the runner's line and exit status): closed. The perl line is quoted in full, and `rc=0` was captured without a pipe. My rerun printed the same lines and rc=0.
- Standards 1 (readability): closed for `/refute`, which now has three bullets of 42, 22 and 40 words. The other half of that finding, rule 13's length, is not closed; see R1-7.
- Behaviour 1 (game-engine and cathedra still hold the old rule 13): not closed.
  - Both files still print one "names the revert" line.
  - The round brief does not mention the finding, and no open item in the state file raises it (grep above).
  - It touches other repositories, so under ruling "Overnight work" 5 it stops for Axel. Its disposition is the orchestrator's, before `/land`.
- I found no closure made by removing a check, and no closure my rerun fails to reproduce, apart from the partial closures above. The builder's diff reaches only the dictated lines (the delta diff above). One fix does reach beyond the findings: it is in the round's dictated text, not the builder's work; see R1-1.

### Findings

- R1-1, Spec (a fix beyond the finding; rules 17 and 19).
  - Place: `docs/dev/change-standard.md:39` and its template copy: "A test of a behaviour the change adds or changes is run on the unchanged tree and fails there". Also `skills/spec/templates/brief.md:62`: "Each test of a behaviour the change adds or changes is run on the unchanged tree and fails there".
  - What is wrong: the old rule and round 0 both limited this to "new or changed" tests. The round drops that limit, and no finding asked for it. Sentence 5 ("A test of a behaviour the change preserves, new or changed") and `/refute:107` ("a new or changed test of a behaviour the change adds or changes") keep the limit. Read against them, sentence 3 now also binds existing tests the change does not touch. Such a test passed on the unchanged tree and cannot fail there. That is a condition added, which rule 17 forbids.
  - Failure scenario: a step adds a "did you mean" suggestion to `check_config.py`'s unknown-key error.
    - The existing, untouched case `unknown-key` asserts `error: unknown key: reviewers`. It passes on the base and after the change, and it is "a test of a behaviour the change changes".
    - A builder reading rule 13 or Verify 4 rewrites it without need so that it fails on the base.
    - Or a reviewer reading rule 13, not the bullet, files it under Standards ("a documented standard the diff breaks").
  - Proposed: "A new or changed test of a behaviour the change adds or changes" in rule 13 and in `brief.md:62`.
  - Verdict: the rule-17 case partial.

- R1-2, Spec (the closure of Spec 1 is narrower than the guard it replaces).
  - Place: rule 13, "A test of a behaviour the change preserves, new or changed, passes after the change; the report quotes that run and, for a test that existed on the unchanged tree, its run there in the form it had". Also `/refute:108`.
  - What is wrong: a new test of a preserved behaviour needs only its run after the change. That test's run on the unchanged tree is the only evidence that the behaviour was preserved and not changed, and a characterisation test can always run there. The first report proposed "passes on the unchanged tree and after the change". The round kept the unchanged-tree run only for a test that existed there, which the rename case needs, and dropped it for new tests, which the rename case does not need.
  - What limits it: `brief.md:20` and `:66` and `/refute:98` already require the first run of each case of a brief. That covers only tests derived from a brief's cases, not a test the builder adds, and not an inline session in a repository that installed the template.
  - Failure scenario: a refactor step changes the order of lines in a script's output by accident.
    - The builder adds a new test that pins the new order and labels it preserved behaviour.
    - It quotes the run after the change, as sentence 5 asks.
    - The reviewer, applying `/refute:108`, finds the passing run quoted and files nothing.
    - The run on the unchanged tree, which would have failed and shown the behaviour change, is asked for by no text.
  - Proposed: "a new test of a behaviour the change preserves also passes on the unchanged tree when it can run there, and the report quotes that run", carried to `/refute:108`.
  - Verdict: the rule-17 case partial.

- R1-3, Spec (rule 19; the `/refute` bullet narrower than rule 13).
  - Place: `skills/refute/SKILL.md:108`: "a new or changed test of a behaviour the change preserves with no passing run after the change quoted for it;".
  - What is wrong: rule 13's sentence 5 also requires, for a test that existed on the unchanged tree, "its run there in the form it had". Round 0's bullet carried both runs ("its passing runs before and after the change"); the round's bullet carries only the run after.
  - Failure scenario: a refactor renames a function and changes its test. The report quotes only the run after the change. A reviewer applying the Proof bullets files nothing, although the rules file asks for the old form's run on the unchanged tree. This is Spec 4's evidence, dropped at review.
  - Proposed: "... with no passing run after the change quoted for it, or, for a test that existed on the unchanged tree, no run there in the form it had".

- R1-4, Spec (the closure of Spec 7 does not reach the reviewer).
  - Place: `skills/refute/SKILL.md:107`: "... with no failure on the unchanged tree quoted for it ...".
  - What is wrong: rule 13 now says the test "is run there again after every change to the test". The bullet accepts any quoted failure, including one taken before the test's last change.
  - Failure scenario: in a repair round the builder tightens a test and reuses the round-0 quote. The reviewer over the round sees "a failure on the unchanged tree quoted for it" and files nothing, which is the scenario of the first report's Spec 7.
  - Proposed: "... with no failure on the unchanged tree quoted for it in the form it has after the change ...".

- R1-5, Spec (rule 19; the silent case).
  - Place: `skills/refute/SKILL.md:107`, the parenthesis "(for a case asserting that a rule stays silent, the failure of the case or of its control)". Read against rule 13's sentence 3 ("... is run on the unchanged tree and fails there"), sentence 6 ("the quoted failure comes from whichever of the two is the test of a behaviour the change adds or changes"), and `brief.md:62`, which has no alternative for a silent case.
  - What is wrong: under rule 13 a silent case is one of two things.
    - In a fix of a false report, it is the changed-behaviour test and must fail itself.
    - For a new rule, it is a preserved-behaviour test under sentence 5 and falls under bullet 2, not bullet 1.
    - The parenthesis's "or of its control" is therefore reached only when a silent case is read as a test of added behaviour and its control's failure is accepted in its place. Sentence 3 and `brief.md:62` forbid exactly that.
  - Failure scenario: a step adds rule R to `check_config.py`.
    - The builder lists "R stays silent on a valid X" in the table as an added behaviour, since a false refusal costs a wrong configuration, and quotes the control's failure for it.
    - The reviewer applying bullet 1 accepts it.
    - A second reviewer or the lander, reading rule 13's sentence 3 or the brief's Verify 4, finds a test of added behaviour that never failed on the base.
  - Proposed: replace the parenthesis with "(for a case asserting that a rule stays silent and its control, the one of the two that tests the behaviour the change adds or changes)", which is sentence 6's rule.
  - Verdict: the rule-19 case partial.

- R1-6, Spec (the closure of Spec 5 is partial).
  - Place: `skills/refute/SKILL.md:109` and rule 13's sentence 6: "a test that cannot fail when the behaviour it is listed for is broken".
  - What is wrong, first part ("listed for"): the only list rule 13 defines is the table (sentence 8), and it holds only behaviours the change adds or changes. A test of a preserved behaviour is listed for nothing: the control in a fix of a false report, or a characterisation test. The words can then be read as not reaching the tests for which this reading is the only guard, since no failure of theirs is ever quoted.
  - What is wrong, second part ("broken"): the text does not say which breakage the reviewer considers. The first report's own scenario is a refusal test that asserts only a non-zero exit. That test fails when the refusal is removed and the script accepts the value, but not when the removal makes the script crash. It is caught only if the reviewer reads "broken" as any breakage, and under that reading almost every test is an audit.
  - Failure scenario, first part: a fix of a false report adds `x-control`, which asserts only that the command ran. It cannot fail if the rule stops reporting. The reviewer finds it listed in no table and does not apply bullet 3.
  - Proposed: "a test that would still pass with the behaviour it is written for taken out of the code, found by reading it". This changes words that ruling O5 (a) and the round took, so it is the orchestrator's decision under "Overnight work" 5, booked for Axel.

- R1-7, Standards (the remaining half of the first report's Standards 1).
  - Place: `docs/dev/change-standard.md:39` and its template copy, rule 13 as a whole.
  - What is wrong: the prose standard's section D ("Paragraphs cover one idea and stay under roughly four sentences") and section E ("under roughly 20 words unless the mechanism needs more"). Rule 13 is 10 sentences covering three kinds of test, the silent case, audits and the table, and four of its sentences run 38 to 41 words. The round brief counted Standards 1 as closed by the `/refute` split alone.
  - Failure scenario: a builder in a repository that installed the template must reconcile ten sentences across three kinds of test. R1-1, R1-3 and R1-5 are three places where two sentences answer the same question differently, and a reader misses the qualifier ("new or changed", "for a test that existed on the unchanged tree") that decides the answer.
  - Proposed: rule 13 as one short statement, with its sub-rules as sub-bullets, in both copies.

### Declined to judge

- I cannot reproduce three lines of the builder's report: "$ case 2 grep", "$ wider grep" and "$ runner". They quote a label in place of the command. No decision rests on them: my own Case 2 grep and my runner rerun give the results the report claims.
- How a builder runs a test "on the unchanged tree again" in a repair round. The rules file forbids `stash` and `checkout`, which leaves `git show <base>:<path>` into `$TMPDIR`. No text says so. Whether it needs saying is the orchestrator's call; it is not a contradiction.
- That a failure on the unchanged tree may come from any cause, such as a missing script or an unknown option, rather than from the behaviour. Ruling O5 (a) and the brief's decision 7 chose this, so I do not treat it as a defect of the round.
- Whether R1-6's proposed words, and any rewording of the brief's decision 7, go to Axel or are decided under "Overnight work" 5. The findings touching game-engine and cathedra (Behaviour 1) stop for Axel under that ruling.
- The ledger brief `8.md`, decisions 3, 6 and 7, still describes the round-0 text. The ledger is outside the step's diff and is the orchestrator's to update.

Reviewer usage: claude-opus-5-5. Tokens and time are not visible to this agent. About 20 tool uses.
