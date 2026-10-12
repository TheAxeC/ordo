# Step 3b refuter report (on .agents/worktrees/2h-3b, base 0bef27a)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

From `/Users/axelfaes/workspace/ordo/.agents/worktrees/2h-3b`:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
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
checks: 12 commands passed
checks exit 0
```

The builder's quoted commands, rerun after the change:

```
$ grep -n -i -e 'small change to the code' -e 'with that change made' skills/spec/templates/brief.md
exit 1
$ git grep -n -i -e mutation -e 'small change to the code' -e 'with that change made' -e breakage -- skills docs/dev README.md utils
exit 1
$ grep -n 'version' skills/spec/SKILL.md | head -1
5:  version: "3.0.0"
$ grep -n '' skills/spec/templates/brief.md | sed -n 80p
80:   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof; it is found by reading the test, and this brief says which it is.
$ grep -n -x -F '   - A test that would still pass ... (the dictated line of item 2, given whole)' skills/spec/templates/brief.md
80: (the same line), exit 0
$ git diff --stat 0bef27a
 skills/spec/SKILL.md           | 2 +-
 skills/spec/templates/brief.md | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)
$ git status --short
 M skills/spec/SKILL.md
 M skills/spec/templates/brief.md
?? .scratch/2-h-session-retro/agents/reviews/3b-report.md
$ git grep -n -i -e 'kept as a test' -e 'failing line' -e 'must catch' -- skills docs README.md utils
docs/dev/change-standard.md:44: ... the failing line quoted for it ...
skills/repo-setup/templates/docs/dev/change-standard.md:44: (same line)
skills/spec/templates/brief.md:31:- A case kept as a test is run on the unchanged tree first.
exit 0
$ grep -n -A3 'Open items' .scratch/2-h-session-retro/orchestrator-state.md
49:## Open items (...)
50-
51-none
$ wc -l skills/spec/templates/brief.md skills/spec/SKILL.md
     100 skills/spec/templates/brief.md
     407 skills/spec/SKILL.md
$ LC_ALL=C grep -n '[^ -~]' skills/spec/templates/brief.md skills/spec/SKILL.md
ascii exit 1 (no line printed)
```

Every claim of the builder's report that these commands cover is reproduced. The first run on the unchanged tree was not rerun on a checkout of the base, since the only git allowed is `git diff` and `git status`. The base text is read from the diff instead. Hunk `@@ -31,8 +31,6 @@` removes the base lines 34 and 35, and hunk `@@ -79,7 +77,7 @@` replaces base line 82. Those are the lines and texts the report quotes for C1, C2 and C4's first run.

## Verdicts

Items of the brief's "What to build":

- 1: holds. The hunk `@@ -31,8 +31,6 @@` deletes exactly the two bullets, and the surrounding bullets keep their order. No other line of the file changes beyond item 2's line.
- 2: holds. `grep -n -x -F` with the dictated line given whole matches line 80, three spaces of indent included.
- 3: holds. The hunk `@@ -2,7 +2,7 @@` changes only `version: "2.1.0"` to `version: "3.0.0"`. A major raise is what `docs/dev/skill-layout.md` "Frontmatter" asks for, since a brief's output is changed.
- 4: holds. `git status --short` shows the two files and the untracked report at the brief's report path, and nothing else.

Cases of the brief's "Cases":

- C1: met. The command prints nothing and exits 1 after the change. The base lines 34 and 35 are the lines the hunk removes.
- C2: met. It prints nothing and exits 1. A plain `grep -rn` over the same paths, which also reads untracked files, exits 1 too. This case is a literal grep, so it does not settle the step line's clause on other wording: see Spec 1.
- C3: met. I read lines 20 to 40 after the change. No bullet asks for the code to be changed or broken, and the bullets on cases kept as tests, quoted runs and text cases are those of the base, in their order.
- C4: met. It prints `5:  version: "3.0.0"`.
- C5: met. After the change I printed each listed place with `grep -n` (change-standard 39, 43 and 44 in both copies; refute 127; diagnose 149, 160, 166, 188 and 273; diagnosis.md 80 and 84; check_config.test.sh 381 and 388) and new line 80. Each reads as the brief and the report say:
  - The rules-file lines run the test on the tree at the base.
  - Refute 127 and new line 80 find an audit test by reading it.
  - The diagnose lines make and undo the candidate fix, so "without the fix" is the tree that still holds the defect.
  - The check_config comments describe a configuration input without a key.
  - The report quotes these places from the first run only. Most quotes lack the `N:` prefix that `grep -n` prints, and the rule 13 quote is shortened with "...". After the change it re-quotes only line 80. This verdict rests on my rerun after the change, not on the report's quotes.

## 1. Spec

- `skills/repo-setup/templates/hooks/git_guard.test.sh:2` and `:20`.
  - Quoted: "The test never runs git. GIT_GUARD names another script to test, such as a scratch copy with one block removed." and `guard=${GIT_GUARD:-$script_dir/git_guard.py}`.
  - What is wrong: the brief's "What is on the tree" says no other text under `skills/`, `docs/dev/`, `README.md` or `utils/` asks for code to be broken deliberately. It lists every sentence that stays with its reason, and this one is not on the list. My grep `git grep -n -i -E 'block removed|removed in a scratch|scratch copy with|one block|turns? the test red|must catch|mutation' -- . ':!.scratch'` prints only this line and `docs/roadmap.md:32`. That roadmap line is the 2.G gate clause "each block removed in a scratch copy turns the test red", which the ruling "No breakage testing (2026-10-05)" removes through `/roadmap`.
  - This head comment gives one use for the `GIT_GUARD` input: running the test against a copy of the guard with one block removed. That is the same practice, and the comment stays in `skills/` after this step. So the premise is not reproduced, and the step line's clause ("no other text of `skills/` ... asks for code to be broken deliberately to see a test fail") is not reached by this diff. C2 and item 4 pass anyway, because C2 greps four literal words and item 4 forbids any other file.
  - The file is a whole-file path of plan 2.G step 2a (`.scratch/2-g-git-guard/agents/briefs/2a.md`, "Paths this step writes"). That step still has a dispatch entry, at `round: 1`, in `.scratch/2-g-git-guard/orchestrator-state.md`. Which step changes the line is therefore the orchestrator's decision: widening 3b would touch a path shared with a step in flight. The change that ends the cause is to drop the clause "such as a scratch copy with one block removed". If no other stated use is left for `GIT_GUARD` after that, the variable at `:20` goes too.
  - Failure scenario: a builder or reviewer of the git guard reads the head comment. Following it, they copy `git_guard.py`, delete a block, point `GIT_GUARD` at the copy and run the test to see it go red. That is the breakage testing the ruling says Ordo asks for in no form, and nothing in the tree after this step tells them otherwise.
  - Verdict: no item or case of the brief is made violated (item 4 and C2 hold as written). The finding stands against the brief's premise and the step line's clause.

## 2. Proof

none

## 3. Standards

- `skills/spec/templates/brief.md:80`.
  - Quoted: "is an audit, not a proof; it is found by reading the test, and this brief says which it is."
  - What is wrong:
    - The prose standard, B "Punctuation", allows at most 2 semicolons per 1000 words of running prose. The added clause brings a new semicolon into a page that already holds 8 in 1305 words (`grep -o ';' ... | wc -l` and `wc -w`).
    - The prose standard, E "Sentence shapes", asks for a passive to be rewritten unless the actor is irrelevant. "It is found by reading the test" is passive, while the rules file's rule 13 names the actor: "The reviewer finds such a test by reading it."
    - At about 37 words, the sentence is past the standard's "under roughly 20 words". It also holds two requirements, the finding by reading and the brief saying which it is, that can each be broken while the other holds.
    - The line is the dictated text of item 2, word for word. Under rule 4 of the rules file the builder was right to take it as given, so this finding stands against the brief's dictated line. Its disposition is the orchestrator's.
  - Failure scenario: a builder reads this bullet as part of its own "Verify before you report" list. The passive does not say who reads the test. The builder may take the classification as its own task and declare its new tests proofs in its report, which is the judgment rule 13 gives to the reviewer.
  - Verdict: none. Item 2 holds as dictated.

## 4. Behaviour

none. The report states both host-visible changes with their before and after: the brief's "Cases" without the two bullets, the changed sub-bullet of "Verify before you report" 4, and `spec` going from 2.1.0 to 3.0.0.

## Declined to judge

- Whether 3b is widened to `git_guard.test.sh` or the line goes to plan 2.G's step 2a by a round ruling. The file is a path of a step in flight, so this is the orchestrator's call, not something a read can settle.
- `docs/roadmap.md:32` and the 2.G ledger places (`plan.md` lines 11 and 14, `agents/briefs/2a.md`, `agents/briefs/2a-round-1.md`). The brief puts them outside the step, and the ruling sends the roadmap clause through `/roadmap`. I did not judge their handling.
- The installed `spec` skill. `ls -la /Users/axelfaes/.claude-work/skills/spec` shows a link to `/Users/axelfaes/.local/share/ordo-stable/skills/spec`, so until `utils/pin.sh <tag>` moves to a tag that holds this step, `/spec` keeps writing the two bullets into briefs. That move is the user's, outside the step.
- The first run on a checkout of the base was not repeated. The only git allowed is `git diff` and `git status`, so I read the base lines from the diff's hunks, as stated under Verification.

Reviewer usage: abee8b43374164dec, claude-opus-5-5, 145791 tokens, 29 tool uses, 8.5 minutes.

## Repair round 1, refuted

Step 3b of plan 2.H, worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2h-3b`, base 0bef27a. Round sent at commit 204b069. I changed nothing. The only git I ran was `git diff 0bef27a`, `git diff 0bef27a --stat` and `git status --short`, plus `git grep`, which is a read.

## Verification (rerun over the repaired tree)

From the worktree root:

```
$ sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
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
checks: 12 commands passed
checks exit 0
```

The round's section of the builder's report quotes these commands, rerun by me:

```
$ git grep -n 'GIT_GUARD' -- skills
(nothing), exit 1
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sed -n 80,81p skills/spec/templates/brief.md
   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.
   - The reviewer finds such a test by reading it.
$ LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/hooks/git_guard.test.sh skills/spec/templates/brief.md
(nothing), exit 1
$ git diff 0bef27a --stat
 skills/repo-setup/templates/hooks/git_guard.test.sh | 4 ++--
 skills/spec/SKILL.md                                | 2 +-
 skills/spec/templates/brief.md                      | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)
$ git status --short
 M skills/repo-setup/templates/hooks/git_guard.test.sh
 M skills/spec/SKILL.md
 M skills/spec/templates/brief.md
?? .scratch/2-h-session-retro/agents/reviews/3b-report.md
```

Every figure in the builder's "Repair round 1" table is reproduced. The `--stat` figures (4 insertions, 5 deletions) match the table.

The first-report commands, rerun on this tree:

```
$ grep -n -i -e 'small change to the code' -e 'with that change made' skills/spec/templates/brief.md
(nothing), exit 1
$ git grep -n -i -e mutation -e 'small change to the code' -e 'with that change made' -e breakage -- skills docs/dev README.md utils
(nothing), exit 1
$ grep -n 'version' skills/spec/SKILL.md | head -1
5:  version: "3.0.0"
```

My own read of the delta since the base:

```
$ git diff 0bef27a
git_guard.test.sh: only line 2 (the last sentence "GIT_GUARD names another script to test, such as a scratch copy with one block removed." and the space before it are gone; the line now ends "The test never runs git.") and line 20 (guard=${GIT_GUARD:-$script_dir/git_guard.py} became guard=$script_dir/git_guard.py)
SKILL.md: only line 5, version "2.1.0" to "3.0.0"
brief.md: hunk @@ -31,8 +31,6 @@ removes the base lines 34 and 35; hunk @@ -79,7 +77,7 @@ now only adds one line after the unchanged base line, so line 80 is the base text word for word and line 81 is new
$ git grep -n 'GIT_GUARD'      (whole tree)
only .scratch/2-g-git-guard/... ledger files (briefs, reports, diffs of plan 2.G), nothing under skills, docs, README.md or utils
$ git grep -n -i -E 'block removed|removed in a scratch|scratch copy with|one block|turns? the test red|must catch|mutation|breakage' -- . ':!.scratch'
docs/roadmap.md:32  (the 2.G gate clause; the ruling sends it through /roadmap; outside the step by the brief)
$ grep -c ';' skills/spec/templates/brief.md ; wc -w skills/spec/templates/brief.md
7 semicolons, 1308 words (the base count: the round added none)
```

## Closures claimed by the builder

- **Spec 1: closed.**
  - It is closed by a fix. The head comment no longer gives scratch-copy-with-a-block-removed as a use of the test, and the `GIT_GUARD` input that served only that use is gone from line 20.
  - No check was removed. The diff of `git_guard.test.sh` is lines 2 and 20 and nothing else, so no case or assertion changed.
  - It reaches no further than the first report asked: the first report said the variable goes too once no other stated use is left. The `GIT_GUARD` grep over `skills` and over the whole tree outside `.scratch` prints nothing.
  - My rerun reproduces it. The test passes (`PASS: git_guard.py scratch tests`), and the premise of the brief's "What is on the tree" now reproduces, since the only remaining hit of the wording grep outside `.scratch` is `docs/roadmap.md:32`.
  - `skills/repo-setup/SKILL.md` lines 29 and 95 name only `hooks/git_guard.py` and `hooks/git_guard.settings.json` as copied into a repository. The test file is not installed, so no skill input or output changed. No version raise of `repo-setup` is asked for by `docs/dev/skill-layout.md` "Frontmatter".
- **Standards 1: closed.**
  - It is closed by a fix. Line 80 is the base text word for word (the diff shows it as context). The passive sentence, the added semicolon and the 37-word line are gone.
  - Line 81, `   - The reviewer finds such a test by reading it.`, has three spaces of indent, 9 words, an active voice and no semicolon. It states the actor and matches the sentence of `docs/dev/change-standard.md`, rule 13 (third sub-bullet, "The reviewer finds such a test by reading it."), so the brief template and the rules file agree.
  - The reading requirement is kept, so no check was removed.
  - It reaches no further than the finding: no other line of `brief.md` changed in the round.
  - The prose standard, B "Punctuation" (semicolons) and E "Sentence shapes" (passive voice, sentence length), no longer finds anything in the line. The semicolon count is the base's.

## Verdicts, for the whole diff since the base

Items of the brief's "What to build", in its numbering, as amended by the round's brief (the round's item 2 replaces the dictated text of the first brief's item 2, and the round's paths add `git_guard.test.sh`):

- 1: holds. Hunk `@@ -31,8 +31,6 @@` deletes the base lines 34 and 35 and leaves the surrounding bullets in order.
- 2: holds as amended by the round. Line 80 is the base text and line 81 is the new sentence of the round's item 2, both read by `sed -n 80,81p` above. The first brief's dictated text for this item (the semicolon sentence) is replaced by the round's brief and is no longer on the tree.
- 3: holds. Hunk `@@ -2,7 +2,7 @@` of `skills/spec/SKILL.md` changes only `version: "2.1.0"` to `version: "3.0.0"`, and `grep -n 'version' skills/spec/SKILL.md | head -1` prints `5:  version: "3.0.0"`. A major raise is what `docs/dev/skill-layout.md` "Frontmatter" gives for a changed output.
- 4: holds as amended by the round. `git status --short` shows the three modified files and the builder's report, and the round's brief names `git_guard.test.sh` lines 2 and 20 as written paths.

Cases of the brief's "Cases":

- C1: met. The command prints nothing and exits 1.
- C2: met. It prints nothing and exits 1. Its clause on other wording is also reproduced: outside `.scratch` only `docs/roadmap.md:32` remains (see Declined to judge).
- C3: met. I read `skills/spec/templates/brief.md` lines 28 to 36. No bullet asks for code to be changed or broken, and the bullets on cases kept as tests, quoted runs and text cases are those of the base in their order.
- C4: met. It prints `5:  version: "3.0.0"`.
- C5: met. The places the brief lists as staying are unchanged by the round (`git diff 0bef27a` shows no hunk in `docs/dev/change-standard.md`, its template copy, `skills/refute/SKILL.md`, `skills/diagnose/` or `check_config.test.sh`), and line 80 now reads as at the base, with line 81 stating that the reviewer reads the test.

## Findings

### 1. Spec

none

### 2. Proof

none

### 3. Standards

none

### 4. Behaviour

none. The builder's report states the visible changes of `brief.md`'s "Cases" and "Verify before you report" 4, and the version change. The round's delta is only a head comment and a test-only environment input (`git_guard.test.sh` is not copied into repositories by `repo-setup`).

## Declined to judge

- `docs/roadmap.md:32`, the 2.G gate clause "each block removed in a scratch copy turns the test red", and the 2.G ledger places (`.scratch/2-g-git-guard/agents/briefs/1.md`, `2a.md` line 158 and its round brief, and the reports). The brief and the ruling send them to `/roadmap` and to the orchestrator.
- The overlap of `git_guard.test.sh` with plan 2.G's step 2a. The file is a whole-file path of 2a, and `.scratch/2-g-git-guard/orchestrator-state.md` still holds a dispatch block for step 2a (base 2bd2282). `.scratch/2-g-git-guard/agents/reviews/2a-round-0.diff` rewrites line 2 of the same file and keeps `GIT_GUARD` at line 20, so lines 2 and 20 may conflict at landing, and 2a's brief and its own report depend on `GIT_GUARD`. I checked by `ls` that no 2a worktree exists under `.agents/worktrees` now and that main's `git_guard.test.sh` still has both lines. I did not check how 2a's work stands, which is the orchestrator's read.
- The installed `spec` skill. `/spec` keeps writing the two bullets into briefs until `utils/pin.sh <tag>` moves to a tag that holds this step. That move is the user's.
- The first run on a checkout of the base, which the reviewer's git allowance does not cover. The base lines come from the diff hunks.

Reviewer usage: a88912951f66913b7, claude-sonnet-5-5, 105939 tokens, 21 tool uses, 4.9 minutes.

## Closed

- First run, Spec 1 and Standards 1: closed in repair round 1 (`agents/briefs/3b-round-1.md`), the closure reproduced by the run over round 1.
- The run over round 1 found nothing.
