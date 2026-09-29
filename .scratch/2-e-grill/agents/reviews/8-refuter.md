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
