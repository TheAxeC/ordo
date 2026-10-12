# Report: step 3b of plan 2.H, no breakage testing in Ordo

Everything in the brief is done.

## Open items of the state file

Verbatim from the section "Open items" of `.scratch/2-h-session-retro/orchestrator-state.md` (`grep -n -A3 'Open items'` prints it at lines 49-51):

```
none
```

## The cases' first run, on the unchanged tree, before any change

- C1: `grep -n -i -e 'small change to the code' -e 'with that change made' skills/spec/templates/brief.md`, exit 0, printed:
  - `34:- For each case kept as a test, the report names one small change to the code under test that the case must catch.`
  - `35:- The report quotes the test's failing line with that change made.`
  - The case holds as the brief states it for the unchanged tree.
- C2: `git grep -n -i -e mutation -e 'small change to the code' -e 'with that change made' -e breakage -- skills docs/dev README.md utils`, exit 0, printed the same two lines, `skills/spec/templates/brief.md:34:` and `skills/spec/templates/brief.md:35:`, and no other line.
- C3: read `skills/spec/templates/brief.md` lines 22-40. Lines 34 and 35 ask for a small change to the code under test and for the failing line quoted with that change made; the other bullets are on cases kept as tests (30, 31, 32, 33), quoted runs (33) and text cases (36, 37). The brief's rules give the expected result for this read.
- C4: `grep -n 'version' skills/spec/SKILL.md | head -1` printed `5:  version: "2.1.0"`.
- C5: each place read on the unchanged tree, quoted as `grep -n` prints it (`grep -n '' <file> | sed -n <n>p`), with the reason it asks for no code to be broken deliberately to see a test fail:
  - `docs/dev/change-standard.md:43` and `skills/repo-setup/templates/docs/dev/change-standard.md:43` (identical): `   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The reviewer finds such a test by reading it.` The reviewer reads the test; no code is changed or run.
  - `docs/dev/change-standard.md:39` and the template copy at line 39 (rule 13): "...The report quotes each run verbatim beside the test's name and names no revert." The test runs on the unchanged tree, the tree at the step's base, which holds no deliberate break.
  - `skills/refute/SKILL.md:127`: `  - a test that would still pass with the behaviour it is written for taken out of the code, found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).` The finding is made by reading.
  - `skills/diagnose/SKILL.md:149`: `    - A hypothesis a debugger or logging probe leaves standing gets one more probe, the change the hypothesis names, so that Steps 15 has the red command green with it and red without it.` The change is the candidate fix, probed on a scratch copy; "red without it" is the tree as it was, which holds the defect.
  - `skills/diagnose/SKILL.md:160`: `160:13. Undo the change of the probe, the one that turned the red command green included.` The tree goes back to its state before the probe, which is the unchanged tree; no working code is broken.
  - `skills/diagnose/SKILL.md:166`: `15. State the cause: the hypothesis the probes left standing, with the probe that shows it, the red command green with the change and red without it.` The "without it" state is the tree with the defect; the change made is the fix.
  - `skills/diagnose/SKILL.md:188`: `17. Run the test on the tree without the fix and quote its failure.` The tree without the fix is the tree as it was, so nothing is removed to make the test fail.
  - `skills/diagnose/SKILL.md:273`: `| A test written after the fix | It has never failed, so nothing shows it catches the defect | Write the test and run it red on the tree without the fix, as Steps 17 says |` Same reason as line 188: the red run is on the tree that holds the defect.
  - `skills/diagnose/templates/diagnosis.md:80`: `<the hypothesis the probes left standing, with the probe that shows it: the red command green with the change and red without it; or "cause not found", with every probe above, or every way tried under "No red command", and the condition that makes it not found>` A placeholder for the same probe as `SKILL.md` Steps 15.
  - `skills/diagnose/templates/diagnosis.md:84`: `Test, run on the tree without the fix:` The test is run on the tree that holds the defect.
  - `skills/ordo-init/templates/check_config.test.sh:381`: `# Guard: the one-project example as shipped passes with none of the three keys' not-set notes; red when the example drops one of the keys (its not-set note is printed). The removed-keys case below is its control, and the probe below proves the example holds each key.` It describes a test input, a configuration without a key; no code is removed.
  - `skills/ordo-init/templates/check_config.test.sh:388`: `# Guard: the several-projects example as shipped passes with none of the three notes for tool-a or tool-b; red when a project drops a key. The control removes repair_reviewer from tool-b and the note names the reviewer's value, and the probe below proves each project holds each key.` Same: a test input, a configuration without a key.
  - `skills/spec/templates/brief.md:82` (old line, the line of the unchanged tree): `   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.` It does not say how the test is found; the step changes it (see "Files" and the DONE table, C5 after the change).
- No case was found that the brief's own rules get wrong; the builder did not stop.

## DONE / NOT DONE

Run from the worktree's root, after the changes.

| Item | Status | Command and output |
|---|---|---|
| Lines 34 and 35 of `skills/spec/templates/brief.md` deleted, nothing else changed there except line 82 | DONE | `git diff` hunk `@@ -31,8 +31,6 @@` removes exactly the two bullets, and hunk `@@ -79,7 +77,7 @@` changes one line |
| Old line 82, now line 80, reads word for word as the brief gives it | DONE | `grep -n '' skills/spec/templates/brief.md \| sed -n 80p` printed `80:   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof; it is found by reading the test, and this brief says which it is.` |
| `skills/spec/SKILL.md` line 5 is `version: "3.0.0"` | DONE | `git diff` hunk `@@ -2,7 +2,7 @@` changes only that line |
| Verify 1, the plan's verify list through `checks.sh` | DONE | `sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md` exit 0; the lines it printed are below |
| Verify 2, C1 | DONE | `grep -n -i -e 'small change to the code' -e 'with that change made' skills/spec/templates/brief.md` printed nothing, exit 1 |
| Verify 2, C2 | DONE | `git grep -n -i -e mutation -e 'small change to the code' -e 'with that change made' -e breakage -- skills docs/dev README.md utils` printed nothing, exit 1 |
| Verify 2, C3 | DONE | `sed -n 22,38p skills/spec/templates/brief.md` printed the "Cases" section: the three list bullets, then "The builder's first task...", then the bullets `A case of a code step ... becomes a test`, `A case kept as a test is run on the unchanged tree first.`, `No prototype script stands in for such a test.`, `Every other case of a code step is checked by a run the report quotes, and no test is kept for it.`, `A case of a text or judgment step is checked by reading the unchanged tree.`, `The first read of a text or judgment case is noted.`, in their order; read, none asks for code to be changed or broken to see a test fail |
| Verify 2, C4 | DONE | `grep -n 'version' skills/spec/SKILL.md \| head -1` printed `5:  version: "3.0.0"` |
| Verify 2, C5 | DONE | the places of the first run are unchanged by this step except line 80, whose text after the change is quoted above in the second row; reading it: "found by reading the test" asks for a read, and it asks for no code to be changed or run |
| Verify 3, diff shape | DONE | `git diff --stat` printed ` skills/spec/SKILL.md           \| 2 +-`, ` skills/spec/templates/brief.md \| 4 +---`, ` 2 files changed, 2 insertions(+), 4 deletions(-)` (brief.md is 1 insertion, 3 deletions; SKILL.md is 1 insertion, 1 deletion) |
| Character-set check | DONE | the last command of `checks.sh` (below) printed nothing; run alone it ended `ascii exit 0` |

The lines `checks.sh` printed (output piped through `tail -60`; exit status taken from a second run to a file, `checks exit 0`):

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
```

What the checks do not cover: they verify the scripts' tests and the character set; whether the brief template's text is right is judged by reading, and no test covers it.

Carrying the change (change standard rule 14): `git grep -n -i -e 'kept as a test' -e 'failing line' -e 'must catch' -- skills docs README.md utils` shows `skills/spec/templates/brief.md:31` (a bullet that stays) and `docs/dev/change-standard.md:44` with its template copy (the failing line of a case on the unchanged tree, no code broken). No other text names the two deleted bullets.

## The terms

The diff adds, changes and uses no term of `docs/glossary.md` in a new sense; "case", "audit" and "unchanged tree" keep the sense they had on the lines they were already on. No entry is changed.

## Files

- `skills/spec/templates/brief.md`: 100 lines after the change (`wc -l`), 1 insertion and 3 deletions.
- `skills/spec/SKILL.md`: 407 lines, 1 insertion and 1 deletion.
- `.scratch/2-h-session-retro/agents/reviews/3b-report.md`: this report.

## Judgment calls the brief left open

None. The new line 80 is one sentence with one semicolon, indented three spaces as the line was, in a nested list item, so the prose standard's limit on semicolons in running prose does not apply to it.

## Host- or user-visible changes, before and after

- A brief that `/spec` writes: before, its "Cases" section carried the bullets `For each case kept as a test, the report names one small change to the code under test that the case must catch.` and `The report quotes the test's failing line with that change made.`; after, it carries neither. Its "Verify before you report" 4, third sub-bullet, before: `... is an audit, not a proof, and this brief says which it is.`; after: `... is an audit, not a proof; it is found by reading the test, and this brief says which it is.`
- `spec` skill version: before `2.1.0`, after `3.0.0`, as the brief's decision 1 states.

## Anything in the brief that was wrong or impossible

Nothing found. Every line number the brief names matched the tree at the first run (the C5 quotes above).

## Repair round 1

Everything in the round is done.

| Item | Status | Command and output |
|---|---|---|
| Spec 1, line 2 of `skills/repo-setup/templates/hooks/git_guard.test.sh` ends at `The test never runs git.` and line 20 reads `guard=$script_dir/git_guard.py` | DONE | `git grep -n 'GIT_GUARD' -- skills` printed nothing, exit 1 |
| The test still passes | DONE | `sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 \| tail -1` printed `PASS: git_guard.py scratch tests` |
| Standards 1, `skills/spec/templates/brief.md` lines 80-81 | DONE | `sed -n 80,81p skills/spec/templates/brief.md` printed `   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.` and `   - The reviewer finds such a test by reading it.` |
| Character set of the two files | DONE | `LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/hooks/git_guard.test.sh skills/spec/templates/brief.md` printed nothing, exit 1 |
| Diff against `0bef27a` | DONE | `git diff 0bef27a --stat` printed ` skills/repo-setup/templates/hooks/git_guard.test.sh \| 4 ++--`, ` skills/spec/SKILL.md                                \| 2 +-`, ` skills/spec/templates/brief.md                      \| 3 +--`, ` 3 files changed, 4 insertions(+), 5 deletions(-)` |

The report's earlier sections describe the tree before this round: the "Files" section lists `skills/spec/templates/brief.md` with 1 insertion and 3 deletions, which is now 1 insertion and 2 deletions in the round's end state (lines 34-35 deleted, line 81 added, line 80 as at the base), and the new line 80 quoted in the DONE table of the first run is replaced by the two lines above. The round ran no other command and changed no other path.
