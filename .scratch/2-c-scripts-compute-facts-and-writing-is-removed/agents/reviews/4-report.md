# Step 4 report: the `--built` mode removed from the coverage check

NOT DONE: one clause of repair round 1 item 5, "a skill name starting with `-` is passed as `./<name>`", is not written, because the script does not accept that form (evidence under "Repair round 1", item 5); it is a stop for the orchestrator. Everything else in the brief and in repair round 1 is done, with item 3 read under the round 0 ruling (`.scratch/2-c-scripts-compute-facts-and-writing-is-removed/agents/briefs/4-cases.md`).

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

The `unknown-option` case as it stands after the round 0 ruling (`--bogus` first, `-q` last, `--x` alone), run against the unchanged script: `git show fbf6f8b:utils/check_coverage.py` saved to a scratch folder outside the worktree with the current test file beside it, and two more copies of the test each dropping the runs of the case before the one under proof.

| Run | FAIL line against the unchanged script |
|---|---|
| `unknown-option` (`--bogus` first) | `FAIL: unknown-option: got: usage error: .../repo/docs/complete.md: not a folder` |
| `unknown-option [last]` (`-q` last) | `FAIL: unknown-option [last]: got: usage error: .../skills/-q: not a folder` |
| `unknown-option [alone]` (`--x` alone) | `FAIL: unknown-option [alone]: got: Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...` |

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
| `utils/check_coverage.py` | 21 | 102 | 293 |
| `utils/check_coverage.test.sh` | 24 | 135 | 486 |
| `docs/academic-coverage.md` | 0 | 6 | 235 |

`git status --short` shows those three files and this report, nothing else. `LC_ALL=C grep -n '[^ -~]'` over the three files prints nothing, exit 1. An awk scan for three blank lines in a row over the three files prints nothing.

## Sentences about the changed files, reread

- The docstring's first line, "every file of the named skill folders is listed once, with a mark and a reason", holds: the listed-once check is unchanged.
- The docstring's "Reason: not empty" bullet holds: no reason is read for paths now in any mode.
- The docstring's exit paragraph ends "2 on a usage error.", and the paragraph after it states the `usage error: <message>` form once and names the dash refusal first among the usage errors; `grep -n 'Usage\|built' utils/check_coverage.py` prints no `built`.
- The test's head comment: "each error it exists to catch fails with its message, one change per case" holds, and its list of cases now ends "and an argument that starts with "-" (unknown-option)".
- `docs/academic-coverage.md` line 25, "The check, run from the repository root over the four skills, exits 0 only when every file of the named skills is listed exactly once with a valid mark and a reason", holds.
- `docs/dev/building.md` line 11, "the coverage check on complete and broken coverage lists", holds.

## Judgment calls

- The `unknown-option` case holds three runs where item 3 named one (accepted in the round 0 ruling).
- The refusal loops over every argument and refuses the first one that starts with `-`, before the count check, so `--x` alone gets the refusal and not the usage line.

## User-visible changes

- `check_coverage.py --built <skill> ...`. Before: the mode checked the reasons of `rebuild: <skill>` rows for a file of `skills/<skill>/`. After: `usage error: --built: not an argument this script takes`, exit 2.
- Any argument starting with `-`. Before: read as a positional argument, for example `--bogus docs/academic-coverage.md x y` printed `usage error: docs/academic-coverage.md: not a folder`. After: `usage error: <argument>: not an argument this script takes`, exit 2.
- The argument `--`. Before: read as the coverage path, like any other argument. After: refused like any other dash argument, `usage error: --: not an argument this script takes`, exit 2.
- A coverage list whose path starts with `-`. Before: read as the coverage list. After: refused; passed as `./<path>` (for example `./-c.md`). A skills root whose path starts with `-` failed before as well (`usage error: -r/x: not a folder`, or a `find` error) and is now passed as `./<path>`. (Corrected at landing from the refuter's run over round 1, Spec 1.)
- A skill folder whose name starts with `-`. Before: checked under the heading `## -x` (`ok`, exit 0). After: `-x` is refused; it is passed as `./-x` and its heading is `## ./-x`, as the docstring now states. No skill in research-hub has such a name. (Added at landing, same finding.)
- The usage line. Before: `Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...`. After: `Usage: check_coverage.py <coverage.md> <skills root> <skill>...`.
- `docs/academic-coverage.md`: the `--built` paragraph and its command are gone; the page goes from the check's command to `## New skills`.

## Brief premises found wrong

- Case 3 against item 3, ruled in round 0 as above.
- For the orchestrator: `grep -n -e '--built' docs/roadmap.md` prints lines 23, 30, 51, 58, 65, 72, 86, 107, 114 and 128. Line 23 is entry 2.C's own gate. The gates of the other entries still name `--built <skill>` with "the command in `docs/academic-coverage.md`", which that page no longer holds. That is step 7's work in `plan.md` line 21 ("the `--built` clauses out of the gates of en..."), not a path of this step.

## Repair round 1

Items 1, 3, 4 and 5 of `briefs/4-round-1.md` are made; item 2 was not sent.

### Item 1, first run of `unknown-option` as it stands

Added to the first-run section above. Command, from a scratch folder holding `git show fbf6f8b:utils/check_coverage.py` and the current test file (plus the two copies that drop the earlier runs): `for t in check_coverage.test.sh last.test.sh alone.test.sh; do echo "== $t"; sh $t 2>&1 | tail -1; done`

```
== check_coverage.test.sh
FAIL: unknown-option: got: usage error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.mBytEn/repo/docs/complete.md: not a folder
== last.test.sh
FAIL: unknown-option [last]: got: usage error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.6VQ7mN/skills/-q: not a folder
== alone.test.sh
FAIL: unknown-option [alone]: got: Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...
```

### Item 3, no hard wrapping in comments and docstrings

- `utils/check_coverage.py`: the module docstring's paragraphs and bullets are each one line; the indented Markdown example keeps its lines; `sections()`'s docstring is one line. Line 1 is the summary, line 2 blank, line 3 `Usage: check_coverage.py <coverage.md> <skills root> <skill>...`.
- `utils/check_coverage.test.sh`: the ten wrapped comment blocks (the head comment and the blocks over `gamma`, `run`, `snapshot`, `complete`, `lettered`, `done-lettered`, `roadmap-separators`, `nfc-names` and `unknown-option`) are each one line. The Markdown inside heredocs is data and keeps its lines.
- `grep -n '^# ' utils/check_coverage.test.sh | awk -F: 'prev+1==$1{print "consecutive at "$1} {prev=$1}'` printed nothing: no comment line follows another.
- Words unchanged apart from items 4 and 5: `git diff --word-diff=porcelain utils/check_coverage.py | grep '^[-+][^-+]'` shows, in the docstring, only the `--built` removals of the step and these additions: `error.`, `A usage error is printed on standard error as "usage`, and `<message>", except a missing argument, which prints the Usage line. The usage errors are: an argument that starts with "-", "--" included, checked before any other argument is read, with the message "<argument>: not an argument this script takes" (a coverage list or skills root whose path starts with "-" is passed as "./<path>");`.
- The usage line still prints: `python3 utils/check_coverage.py docs/academic-coverage.md; echo $?` printed `Usage: check_coverage.py <coverage.md> <skills root> <skill>...` and `2`; the `usage-no-skill` and `unknown-option [alone]` cases pass in the suite run below.

### Item 4, the `usage error: <message>` form stated once

The docstring now reads, as its last paragraph, one line:

```
A usage error is printed on standard error as "usage error: <message>", except a missing argument, which prints the Usage line. The usage errors are: an argument that starts with "-", "--" included, checked before any other argument is read, with the message "<argument>: not an argument this script takes" (a coverage list or skills root whose path starts with "-" is passed as "./<path>"); a missing argument; a skills root or skill folder that does not exist; a coverage list outside a git repository; a coverage list or docs/roadmap.md that does not exist or is not UTF-8; a find that fails.
```

`grep -c 'usage error: <message>' utils/check_coverage.py` printed `1`; `grep -c '"<argument>: not an argument this script takes"' utils/check_coverage.py` printed `1`.

Judgment call: the ruling's sentence "every usage error is printed as `usage error: <message>`" is written with the exception "except a missing argument, which prints the Usage line", since `main()` prints the usage line, not a `usage error:` line, when fewer than three arguments are given (the missing-argument run above prints `Usage: ...`). Without the exception the sentence would be false.

### Item 5, `--` and the `./` form

- `--` refused: `python3 utils/check_coverage.py -- docs/academic-coverage.md x y; echo $?` printed `usage error: --: not an argument this script takes` and `2`. The docstring says `"--" included`.
- `./` for a path: in a scratch repository, `python3 .../utils/check_coverage.py ./-c.md ./../-r ./-x; echo "exit $?"` read the coverage list `./-c.md` and the skills root and printed `./-c.md:0: no '## ./-x' section`, `exit 1`: the list and root passed with `./` are read. The docstring states the `./<path>` form for a coverage list or skills root. The user-visible changes above state `--` and the `./` form, before and after.
- Stop, the skill-name clause: a skill name starting with `-` cannot be passed as `./<name>`. The skill name is also the section heading the script looks for, so `./-x` looks for `## ./-x`, and `-x` is refused. Evidence, in the same scratch repository with a skill folder `-x` and a section `## -x`: `python3 utils/check_coverage.py $B/repo/docs/c.md $S ./-x; echo "exit $?"` printed `.../repo/docs/c.md:0: no '## ./-x' section` and `exit 1`; `python3 .../utils/check_coverage.py ./-c.md ../-r -x; echo "exit $?"` printed `usage error: -x: not an argument this script takes` and `exit 2`. So the docstring does not say a skill name is passed as `./<name>`; what the docstring should say about a skill folder whose name starts with `-` (today none: the reviewer's `ls research-hub/.agents/skills | grep '^-'` found nothing) is the orchestrator's to rule.

### Reruns after the round

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"`:

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
exit 0
```

The same runner without the `env -u` prefix ended `checks: 7 commands passed`.

| Brief check | Command | Output |
|---|---|---|
| 2 | `sh utils/check_coverage.test.sh 2>&1 \| tail -1` | `PASS: check_coverage.py scratch tests` |
| 3 | `python3 utils/check_coverage.py --built paper docs/academic-coverage.md x y; echo $?` | `usage error: --built: not an argument this script takes` / `2` |
| 4 | `git grep -n -e --built -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` | `exit 1` |
| 5 | the real-list command with `echo "exit $?"`, then `diff` against the before run | `ok: docs/academic-coverage.md` / `exit 0`; `diff` printed nothing, exit 0 |
| 6 | revert proof, the four refusal lines removed in a scratch copy of the current script | below |

```
== check_coverage.test.sh
FAIL: unknown-option: got: usage error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.PDHm5I/repo/docs/complete.md: not a folder
== last.test.sh
FAIL: unknown-option [last]: got: usage error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.5qCvzz/skills/-q: not a folder
== alone.test.sh
FAIL: unknown-option [alone]: got: Usage: check_coverage.py <coverage.md> <skills root> <skill>...
```

Updated counts, `wc -l` and `git diff --numstat`: `utils/check_coverage.py` 293 lines (21 added, 102 removed), `utils/check_coverage.test.sh` 486 lines (24 added, 135 removed), `docs/academic-coverage.md` 235 lines (0 added, 6 removed). `git status --short` shows those three files and this report. `LC_ALL=C grep -n '[^ -~]'` over the three files printed nothing, exit 1; the scan for three blank lines in a row over the two scripts printed nothing.
