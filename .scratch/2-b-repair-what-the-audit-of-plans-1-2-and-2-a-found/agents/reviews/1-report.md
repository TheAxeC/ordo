# Report: step 1 of plan 2.B, the verify runner

Everything in the brief is done.

## Open items of the state file

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- none.
```

## DONE / NOT DONE

| # | Item | State | Command | Output |
|---|---|---|---|---|
| 1 | `utils/verify.sh` | DONE | `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"` | check 2 below |
| 2 | `utils/verify.test.sh` | DONE | `sh utils/verify.test.sh 2>&1 \| tail -1` | `PASS: verify.sh scratch tests` |
| 3 | `README.md`: the test in the code block, its bullet, the runner paragraph | DONE | `grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md` | check 4 below |
| 4 | `docs/dev/building.md`: the test with its comment, the sentence after line 19 | DONE | the same grep | check 4 below |
| 5 | `docs/dev/change-standard.md`: the test in the list, the sentence after the list | DONE | the same grep | check 4 below |
| 6 | The four lists name the same ten tests in the same order | DONE | the list comparison below | `four lists equal` |
| 7 | Every test case names its revert, and each revert's red is quoted | DONE | the revert harness below | 21 reverts, 21 reds |
| 8 | Whole verify list by hand, plus the new test as a tenth | DONE | check 3 below | all pass |
| 9 | ASCII check | DONE | the ASCII check of `docs/dev/change-standard.md` | empty output, `ascii exit 0` |

### Check 1

```
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests
```

### Check 2

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 11 commands passed
exit 0
```

Nine `PASS:` lines, ten `ok:` lines, nothing from the ASCII check, `verify: 11 commands passed`, exit 0.

### Check 3

Each command of the verify list run by hand through its filter, with `sh utils/verify.test.sh` as a tenth test:

```
skills/land/templates/land.test.sh: PASS: land.sh and usage.py scratch tests
skills/ordo-init/templates/check_config.test.sh: PASS: check_config.py scratch tests
skills/plan-retro/templates/collect_findings.test.sh: PASS: collect_findings.py scratch tests
skills/repo-setup/templates/sync_rules.test.sh: PASS: sync_rules.py scratch tests
skills/plan-orchestration/templates/launch.test.sh: PASS: launch.sh scratch tests
utils/pin.test.sh: PASS: pin.sh scratch tests
utils/verify.test.sh: PASS: verify.sh scratch tests
utils/check_skill_layout.test.sh: PASS: check_skill_layout.py scratch tests
utils/check_rule_inventory.test.sh: PASS: check_rule_inventory.py scratch tests
utils/check_coverage.test.sh: PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
layout exit 0
ascii exit 0
```

The suite count moved from nine tests to ten; the new test is the one added.

### Check 4

```
$ grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md
README.md:111:sh utils/verify.test.sh
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a filtered test, ...
docs/dev/building.md:12:sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify lists
docs/dev/change-standard.md:48:sh utils/verify.test.sh 2>&1 | tail -1
```

Each hit sits on the line after `pin.test.sh` (`README.md:110`, `README.md:122`, `docs/dev/building.md:11`, `docs/dev/change-standard.md:47`). The comparison of the four lists (test names pulled from the README code block, the README bullets, `docs/dev/building.md` and `docs/dev/change-standard.md`, compared as strings) printed:

```
four lists equal:
land.test.sh check_config.test.sh collect_findings.test.sh sync_rules.test.sh launch.test.sh pin.test.sh verify.test.sh check_skill_layout.test.sh check_rule_inventory.test.sh check_coverage.test.sh
```

### The test before the runner existed

```
$ sh utils/verify.test.sh 2>&1 | tail -3
FAIL: all green: exit 127, expected 0; output: sh: /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-1/utils/verify.sh: No such file or directory
```

### Check 5: each revert and the red it produced

Each revert was applied to a copy of `utils/verify.sh` in a folder under `$TMPDIR`, beside a copy of `utils/verify.test.sh`, and the test was run with `sh verify.test.sh 2>&1; echo "exit $?"`. The harness is `reverts.py` in the session scratchpad; the worktree was not changed. All 21 reverts exit 1, each on the case that names it. Frames of PyYAML's own traceback are left out below; nothing else is.

The four reverts the brief names:

```
revert: judge a filtered test by the exit status of the pipeline as written
FAIL: a filtered test that exits 1: exit 0, expected 1; output: PASS: green
PASS: x
verify: 2 commands passed
exit 1

revert: remove the PASS: check
FAIL: a filtered test without a PASS last line: exit 0, expected 1; output: done
verify: 1 commands passed
exit 1

revert: remove the stop at the first red command (carry on, exit 1 at the end)
FAIL: a command after the first red command ran
exit 1

revert: replace the exit 64 on a missing list by exit 0
FAIL: a block with no verify: key: exit 70, expected 64; output: verify: the first yaml block of nokey.md has no verify: list
verify: the list reader printed no count: 
exit 1
```

The exit 70 in the last one comes from the runner's check that the list reader printed a count; with the reader exiting 0 and printing nothing, the runner stops there.

The reverts for the other cases:

```
revert: print the filtered test's whole output instead of its last line
FAIL: all green: output differs; got: noise
PASS: green
unfiltered out
folded-joined
verify: 3 commands passed
exit 1

revert: judge an unfiltered command passed whatever its exit status
FAIL: an unfiltered command that exits 1: exit 0, expected 1; output: broken out
verify: 1 commands passed
exit 1

revert: strip any trailing pipe into tail
FAIL: a command with another tail filter: exit 1, expected 0; output: RED: sh passexit1.test.sh 2>&1 | tail -n 1
exit status: 1
PASS: x
exit 1

revert: remove the check that the state file is readable
FAIL: a missing state file: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 16, in <module>
FileNotFoundError: [Errno 2] No such file or directory: 'missing.md'
exit 1

revert: pass a state file with no yaml block with exit 0
FAIL: a state file with no yaml block: exit 70, expected 64; output: verify: the list reader printed no count: 
exit 1

revert: read the first yaml block that holds a verify key
FAIL: a verify list only in a second yaml block: exit 0, expected 64; output: verify: 1 commands passed
exit 1

revert: ignore fences other than yaml ones
FAIL: a verify list only in a second yaml block: exit 0, expected 64; output: verify: 1 commands passed
exit 1

revert: remove the check for an empty list
FAIL: an empty verify list: exit 0, expected 64; output: verify: 0 commands passed
exit 1

revert: remove the check that the key holds a list
FAIL: a verify key that is not a list: the message does not say "verify: the verify: key of notalist.md is not a list of commands": verify: command 6 of the verify: list of notalist.md is empty
exit 1

revert: remove the check that each command is a string
FAIL: a verify item that is not a string: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 57, in <module>
AttributeError: 'int' object has no attribute 'strip'
exit 1

revert: remove the check for an empty command
FAIL: a verify item that is empty: exit 0, expected 64; output: verify: 2 commands passed
exit 1

revert: do not catch the YAML error
FAIL: a block that is not valid YAML: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 42, in <module>
yaml.parser.ParserError: while parsing a flow sequence
  in "<unicode string>", line 1, column 9:
expected ',' or ']', but got '<stream end>'
  in "<unicode string>", line 1, column 22:
exit 1

revert: read a block left open at the end of the file as closed
FAIL: a yaml block that is never closed: exit 0, expected 64; output: verify: 1 commands passed
exit 1

revert: remove the check of the argument count
FAIL: no argument: exit 1, expected 64
exit 1

revert: remove the check for a NUL character
FAIL: a verify item holding a NUL: exit 0, expected 64; output: verify: 1 commands passed
exit 1

revert: do not catch the import error
FAIL: no PyYAML: exit 1, expected 69; output: Traceback (most recent call last):
  File "<string>", line 10, in <module>
  File "/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-test.hQqNJ2/noyaml/yaml.py", line 1, in <module>
ImportError: no yaml here
exit 1

revert: do not remove the scratch folder
FAIL: the runner left files in its scratch folder on green.md
exit 1
```

### Carrying the change to every place that names it

```
$ grep -rn 'pin.test.sh' skills utils docs README.md
docs/dev/change-standard.md:47:sh utils/pin.test.sh 2>&1 | tail -1
docs/dev/building.md:11:sh utils/pin.test.sh
README.md:110:sh utils/pin.test.sh
README.md:122:- `pin.test.sh` checks that `pin.sh` links every skill ...
$ grep -rln 'tail -1' skills utils docs README.md
utils/verify.sh
utils/check_rule_inventory.test.sh
utils/verify.test.sh
docs/dev/change-standard.md
docs/dev/building.md
README.md
```

Every page holding a test list now holds the new test. `utils/check_rule_inventory.test.sh` uses `tail -1` inside its own cases and names no test list. No file under `skills/` names a test list or the filter.

## Files

| File | Lines | Change |
|---|---|---|
| `utils/verify.sh` | 153 | new |
| `utils/verify.test.sh` | 245 | new |
| `README.md` | +4 | the test in the code block, its bullet, the runner paragraph |
| `docs/dev/building.md` | +3 | the test with its comment, the runner paragraph |
| `docs/dev/change-standard.md` | +3 | the test in the list, the runner sentence |

Counts from `wc -l utils/verify.sh utils/verify.test.sh` and `git diff --numstat`.

## Judgment calls

1. **The red block.** A red command prints `RED: <command>` with the command as the list holds it, then `exit status: <n>`, then, for a filtered test that exited 0, the line `last line does not start with PASS:`, then the whole captured output. The extra line says why a command with exit status 0 is red.
2. **Streams.** Pass lines, red blocks and the count go to stdout; refusals go to stderr.
3. **More refusals with exit 64 than the brief lists.** Besides a missing file, no `yaml` block and no `verify:` key, the runner refuses with exit 64: a wrong argument count (with a usage line), an empty list, a `verify:` key that is not a list, a command that is not a string, is empty or holds a NUL character, a first `yaml` block that is not valid YAML, and one never closed. An empty list would otherwise print `verify: 0 commands passed` and exit 0; the revert above shows it.
4. **Other exit statuses.** A `python3` that cannot import `yaml` exits 69 with `verify: python3 cannot import yaml; install PyYAML`. A list reader that exits 0 without printing a count exits 70; the code has no such path, and the check asserts that. A signal exits 128 plus its number, after the scratch folder is removed.
5. **Which block is the first `yaml` block.** An opening fence is three or more backticks or tildes with up to three spaces of indent; a `yaml` fence inside another fenced block does not count. A later `yaml` block is never read, even when the first one has no `verify:` key.
6. **How commands pass from Python to sh.** The embedded Python program writes each command to its own file under the runner's scratch folder and prints the count. This keeps quotes, newlines and carriage returns in a command as they are. A NUL is refused, since a sh variable cannot hold one.
7. **Standard input.** Each command runs with standard input from `/dev/null`, so it cannot read from the runner's own input.
8. **The count line.** It keeps the brief's form `verify: <n> commands passed` for every `n`, 1 included.
9. **A test of the exact suffix.** The case "a command with another tail filter" pins decision 2 of the brief: `sh passexit1.test.sh 2>&1 | tail -n 1` is judged on its exit status, which is `tail`'s, and passes.

## User-visible changes

1. `sh utils/verify.sh <state file>` is new. Before, a plan's verify list was run by hand, and a red test piped through ` 2>&1 | tail -1` exited 0 (`sh -c 'printf "FAIL: x\n"; exit 1' 2>&1 | tail -1; echo $?` printed `FAIL: x` then `0`). After, the runner runs such a test without the filter and stops with exit 1 on it.
2. The test lists in `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md` held nine tests; they now hold ten, with `utils/verify.test.sh` after `utils/pin.test.sh`.
3. `README.md`, Tests section. Before, the section ended with the layout-check paragraph and its code block. After, a paragraph follows it: "A plan's verify list, the `verify:` key of the first `yaml` block of its `orchestrator-state.md`, runs through `sh utils/verify.sh <state file>` from the root of the checkout it checks. The filter ` 2>&1 | tail -1` hands back the exit status of `tail`, so a red test piped through it still exits 0. The runner therefore runs each filtered test without the filter and passes it only when it exits 0 and its last line starts with `PASS:`. It stops at the first red command with exit 1, printing the command, its exit status and its whole output."
4. `docs/dev/building.md`, after the pass rule. Before, the page said nothing of a runner. After: "`sh utils/verify.sh <state file>` runs a plan's verify list and passes a filtered test only when it exits 0 and its last line starts with `PASS:`, since the filter alone returns the exit status of `tail`. A landing books the lines the runner prints."
5. `docs/dev/change-standard.md`, after the command list. Before, the page said nothing of a runner. After: "A step's verification runs through `sh utils/verify.sh <state file>`, and the report quotes the lines the runner printed, never a count."

## Where the brief and the tree differ

1. The plan's text for step 1 (`plan.md:17`) says the runner "prints every line it saw"; the brief says a filtered test prints its last line only. The runner follows the brief: a passing filtered test prints its last line, a passing unfiltered command and every red command print their whole output.
2. The sentence the brief asks for in `docs/dev/building.md`, "A landing books the lines the runner prints", describes the plan's practice (`plan.md:17`: "every later landing uses it"). The land skill does not name the runner yet: `grep -n 'verify' skills/land/SKILL.md` printed nothing. Wiring the runner into the land skill is outside this step's brief.
