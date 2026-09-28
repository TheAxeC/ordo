# Step 4 report: the `--built` mode removed from the coverage check

Everything in the brief is done, with item 3 read under the round 0 ruling (`.scratch/2-c-scripts-compute-facts-and-writing-is-removed/agents/briefs/4-cases.md`).

Open items of the state file, verbatim: None.

## Cases

### First run on the unchanged tree

Run in the worktree at fbf6f8b before any change to the script, with the `unknown-option` case already added to the test file in its first form (`--built paper` as the first argument).

| Case | Command | Output | Result |
|---|---|---|---|
| 1 | `python3 utils/check_coverage.py --built paper docs/academic-coverage.md x y; echo "exit $?"` | `usage error: x: not a folder` / `exit 2` | red, as the brief expects: `--built paper` taken as the mode |
| 2 | `sh utils/check_coverage.test.sh 2>&1 \| tail -1` | `FAIL: unknown-option: expected exit 2, got 1: .../repo/docs/complete.md:21: the reason of 'SKILL.md' (rebuild: paper) names no file of skills/paper/ in backticks` | red, as expected |
| 3 | `git grep -n -e --built -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` | the 2 lines of `docs/academic-coverage.md`, 13 lines of `utils/check_coverage.py` and 27 lines of `utils/check_coverage.test.sh`, `exit 0` | red, as expected |
| 4 | `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"` | `ok: docs/academic-coverage.md` / `exit 0` | the before run |

### Ruling on case 3 (round 0)

The first run showed that case 3 could not hold while item 3's `unknown-option` case held the literal `--built`, since the grep reads `utils/check_coverage.test.sh`. The orchestrator ruled in `briefs/4-cases.md`:

- The grep's exclusions stay as written, since the same grep is a clause of roadmap entry 2.C's gate, which the user approved.
- The `unknown-option` case holds no `--built`. It runs `--bogus` as the first argument, `-q` as the last and `--x` as the only argument, each expecting exit 2 and the exact line `usage error: <argument>: not an argument this script takes`.
- The refusal of `--built` itself is proved by the plan's check, run by hand and quoted (row 3 of the table below).
- The two runs beyond the one item 3 named (last argument, only argument) are accepted in this form.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| Verify list | DONE | `sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"` | quoted below; `checks: 7 commands passed`, `exit 0` |
| Test suite | DONE | `sh utils/check_coverage.test.sh 2>&1 \| tail -1` | `PASS: check_coverage.py scratch tests` |
| `--built` refused (plan's check) | DONE | `python3 utils/check_coverage.py --built paper docs/academic-coverage.md x y; echo $?` | `usage error: --built: not an argument this script takes` / `2` |
| No `--built` left | DONE | `git grep -n -e --built -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` | `exit 1`, nothing else printed |
| Real list before and after | DONE | the case 4 command, output with `echo "exit $?"` saved before and after, then `diff` of the two | before and after both `ok: docs/academic-coverage.md` / `exit 0`; `diff` printed nothing, exit 0 |
| Revert proof for `unknown-option` | DONE | refusal removed in a scratch copy of the script, test run beside it | quoted below |
| Item 1, `--built` mode out of the script | DONE | `git grep -n -e built_path_error -e BACKTICKED -e built_rows -e built_files -e 'options(' -- skills utils docs README.md; echo "exit $?"` | `exit 1` |
| Item 2, dash argument refused | DONE | the plan's check above and the `unknown-option` case | as above |
| Item 3, test cases and fixtures | DONE | `grep -n 'repo/skills\|outside.txt\|built' utils/check_coverage.test.sh; echo "exit $?"` | `exit 1`, nothing else printed |
| Item 4, doc lines 30-35 | DONE | `awk 'NR>=26 && NR<=31' docs/academic-coverage.md` | line 28 closes the code fence, line 29 is blank, line 30 is `## New skills`; `git diff --numstat` gives `0 6 docs/academic-coverage.md` |

The verify list, as `checks.sh` printed it:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
checks: 7 commands passed
```

The same runner under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` also ended `checks: 7 commands passed`.

### Revert proof

The revert removes these four lines of `main()` in a scratch copy of the script (`diff` of the original against the copy):

```
284,287d283
<     for argument in argv:
<         if argument.startswith("-"):
<             print(f"usage error: {argument}: not an argument this script takes", file=sys.stderr)
<             return 2
```

The test file was copied beside it, and two more copies each dropped the runs of the case before the one under proof, so every run of the case is shown red on its own:

| Rule or branch | Run | FAIL line with the refusal removed |
|---|---|---|
| A dash argument is refused, first position | `unknown-option` (`--bogus` first) | `FAIL: unknown-option: got: usage error: .../repo/docs/complete.md: not a folder` |
| Refused in any position | `unknown-option [last]` (`-q` last) | `FAIL: unknown-option [last]: got: usage error: .../skills/-q: not a folder` |
| Checked before any other argument, including the count | `unknown-option [alone]` (`--x` alone) | `FAIL: unknown-option [alone]: got: Usage: check_coverage.py <coverage.md> <skills root> <skill>...` |

## Files changed

`git diff --numstat` and `wc -l`:

| File | Added | Removed | Lines now |
|---|---|---|---|
| `utils/check_coverage.py` | 12 | 75 | 311 |
| `utils/check_coverage.test.sh` | 17 | 112 | 502 |
| `docs/academic-coverage.md` | 0 | 6 | 235 |

`git status --short` shows those three files and this report, nothing else. `LC_ALL=C grep -n '[^ -~]'` over the three files prints nothing, exit 1. An awk scan for three blank lines in a row over the three files prints nothing.

## Sentences about the changed files, reread

- The docstring's first line, "every file of the named skill folders is listed once, with a mark and a reason", holds: the listed-once check is unchanged.
- The docstring's "Reason: not empty" bullet holds: no reason is read for paths now in any mode.
- The docstring's exit paragraph now names the dash refusal first among the usage errors, and `grep -n 'Usage\|built' utils/check_coverage.py` prints no `built`.
- The test's head comment: "each error it exists to catch fails with its message, one change per case" holds, and its list of cases now ends "and an argument that starts with "-" (unknown-option)".
- `docs/academic-coverage.md` line 25, "The check, run from the repository root over the four skills, exits 0 only when every file of the named skills is listed exactly once with a valid mark and a reason", holds.
- `docs/dev/building.md` line 11, "the coverage check on complete and broken coverage lists", holds.

## Judgment calls

- The `unknown-option` case holds three runs where item 3 named one (accepted in the round 0 ruling).
- The refusal loops over every argument and refuses the first one that starts with `-`, before the count check, so `--x` alone gets the refusal and not the usage line.

## User-visible changes

- `check_coverage.py --built <skill> ...`. Before: the mode checked the reasons of `rebuild: <skill>` rows for a file of `skills/<skill>/`. After: `usage error: --built: not an argument this script takes`, exit 2.
- Any argument starting with `-`. Before: read as a positional argument, for example `--bogus docs/academic-coverage.md x y` printed `usage error: docs/academic-coverage.md: not a folder`. After: `usage error: <argument>: not an argument this script takes`, exit 2.
- The usage line. Before: `Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...`. After: `Usage: check_coverage.py <coverage.md> <skills root> <skill>...`.
- `docs/academic-coverage.md`: the `--built` paragraph and its command are gone; the page goes from the check's command to `## New skills`.

## Brief premises found wrong

- Case 3 against item 3, ruled in round 0 as above.
- For the orchestrator: `grep -n -e '--built' docs/roadmap.md` prints lines 23, 30, 51, 58, 65, 72, 86, 107, 114 and 128. Line 23 is entry 2.C's own gate. The gates of the other entries still name `--built <skill>` with "the command in `docs/academic-coverage.md`", which that page no longer holds. That is step 7's work in `plan.md` line 21 ("the `--built` clauses out of the gates of en..."), not a path of this step.
