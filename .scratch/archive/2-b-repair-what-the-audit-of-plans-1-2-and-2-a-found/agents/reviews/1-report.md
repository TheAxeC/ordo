# Report: step 1 of plan 2.B, the verify runner

Everything in the brief and in the rulings of repair rounds 1 and 2 is done. The section "Repair round 2" at the end states the runner as it now is; where it differs from the sections above it, it holds.

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
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a filtered test, an unfiltered command and a command written as a folded scalar, and turns red on a filtered test that prints `PASS:` but exits 1, a filtered test whose last line does not start with `PASS:`, and an unfiltered command that exits 1. It checks that the run stops at the first red command, that a command with any other `tail` suffix is judged on its exit status alone, and that each state file the runner cannot use exits 64 with its message: a missing file, no `yaml` block, a `verify:` list that is missing, empty, not a list or holding an empty, non-string or NUL-holding command, a block that is not valid YAML or never closed, and a list found only in a second `yaml` block. A `python3` that cannot import `yaml` exits 69.
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

Each revert was applied to a copy of `utils/verify.sh` in a folder under `$TMPDIR`, beside a copy of `utils/verify.test.sh`, and the test was run with `sh verify.test.sh 2>&1; echo "exit $?"`. The harness is `reverts.py` in the session scratchpad; the worktree was not changed. All 21 reverts exit 1, each on the case that names it. The whole output of the harness:

```
revert: print the filtered test's whole output instead of its last line
FAIL: all green: output differs; got: noise
PASS: green
unfiltered out
folded-joined
verify: 3 commands passed
exit 1

revert: judge a filtered test by the exit status of the pipeline as written
FAIL: a filtered test that exits 1: exit 0, expected 1; output: PASS: green
PASS: x
verify: 2 commands passed
exit 1

revert: remove the PASS: check
FAIL: a filtered test without a PASS last line: exit 0, expected 1; output: done
verify: 1 commands passed
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

revert: remove the stop at the first red command (carry on, exit 1 at the end)
FAIL: a command after the first red command ran
exit 1

revert: replace the exit 64 on a missing list by exit 0
FAIL: a block with no verify: key: exit 70, expected 64; output: verify: the first yaml block of nokey.md has no verify: list
verify: the list reader printed no count: 
exit 1

revert: remove the check that the state file is readable
FAIL: a missing state file: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 16, in <module>
    with open(path, encoding="utf-8") as handle:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
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
    if not command.strip():
           ^^^^^^^^^^^^^
AttributeError: 'int' object has no attribute 'strip'
exit 1

revert: remove the check for an empty command
FAIL: a verify item that is empty: exit 0, expected 64; output: verify: 2 commands passed
exit 1

revert: do not catch the YAML error
FAIL: a block that is not valid YAML: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 42, in <module>
    data = yaml.safe_load("\n".join(block))
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py", line 125, in safe_load
    return load(stream, SafeLoader)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py", line 81, in load
    return loader.get_single_data()
           ~~~~~~~~~~~~~~~~~~~~~~^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/constructor.py", line 49, in get_single_data
    node = self.get_single_node()
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 36, in get_single_node
    document = self.compose_document()
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 55, in compose_document
    node = self.compose_node(None, None)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 84, in compose_node
    node = self.compose_mapping_node(anchor)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 133, in compose_mapping_node
    item_value = self.compose_node(node, item_key)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 82, in compose_node
    node = self.compose_sequence_node(anchor)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 110, in compose_sequence_node
    while not self.check_event(SequenceEndEvent):
              ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/parser.py", line 98, in check_event
    self.current_event = self.state()
                         ~~~~~~~~~~^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/parser.py", line 483, in parse_flow_sequence_entry
    raise ParserError("while parsing a flow sequence", self.marks[-1],
            "expected ',' or ']', but got %r" % token.id, token.start_mark)
yaml.parser.ParserError: while parsing a flow sequence
  in "<unicode string>", line 1, column 9:
    verify: [touch marker
            ^
expected ',' or ']', but got '<stream end>'
  in "<unicode string>", line 1, column 22:
    verify: [touch marker
                         ^
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
    import yaml
  File "/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-test.hQqNJ2/noyaml/yaml.py", line 1, in <module>
    raise ImportError("no yaml here")
ImportError: no yaml here
exit 1

revert: do not remove the scratch folder
FAIL: the runner left files in its scratch folder on green.md
exit 1
```

The exit 70 under the revert of the exit 64 on a missing list came from the runner's check that the list reader printed a count; repair round 1 removes that check.

### Carrying the change to every place that names it

```
$ grep -rn 'pin.test.sh' skills utils docs README.md
docs/dev/change-standard.md:47:sh utils/pin.test.sh 2>&1 | tail -1
docs/dev/building.md:11:sh utils/pin.test.sh
README.md:110:sh utils/pin.test.sh
README.md:122:- `pin.test.sh` checks that `pin.sh` links every skill of a tag from the pinned worktree, drops a skill the next tag removes, repairs a link into the live clone, and refuses, changing nothing, a worktree with local changes, a real directory or a foreign link in a skill folder, and an unknown tag.
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

## Repair round 1

Every ruling of the round is done. The orchestrator committed the first round's state as `00e8f8b wip: step 1 as first reported`; the changes below sit on top of it, uncommitted.

### Rulings and what closes them

1. **A pipe into `tail` in any spelling (Proof 1, Behaviour 1, Spec 1).** The runner strips trailing whitespace and newlines from each command. A command whose last pipeline stage is `tail` with any options is a filtered test: a single pipe (not `||`), an optional path before `tail`, and options holding no further pipe, list separator, redirection or substitution. The runner runs what comes before that stage and passes it only on exit status 0 and a last line starting `PASS:`. A command whose last stage is not `tail`, one ending in `; true` included, is judged on its exit status, which the head comment and the README paragraph state. The case at the old `utils/verify.test.sh:117-125` is gone. Cases for `| tail -n 1`, two spaces before the pipe, no `2>&1`, no spaces around the pipe and a literal block ending in a newline each expect a red run. A case for `; true` expects a green run as the control. A command that pipes nothing into `tail` is refused with exit 64.
2. **Exit statuses (Spec 2, Standards 3, Proof 5).** The count check and exit 70 are removed. Exit 69 stays for a missing PyYAML, and a `python3` missing from `PATH` now also exits 69 with `verify: python3 is not on PATH`. The runner's own check that the state file is readable is removed, because the Python reader catches the same error and prints the same message (a directory given as the state file prints `verify: cannot read the state file dirstate: Is a directory` and exits 64). The head comment, the README paragraph and the `docs/dev/building.md` paragraph name every exit status: 0, 1 (a red command, or a scratch folder the runner cannot create or write), 64, 69 and 128 plus the signal number.
3. **Standard input, quoting and signals (Proof 2, 3, 4).** Three cases are new. A command that reads standard input gets end-of-file at once while the runner's own input holds a line. Quotes, a newline inside a literal block and a carriage return reach a command as written. A TERM to the runner stops the running command and its process group, runs no later command, removes the scratch folder and exits 143 within 10 seconds while the command would sleep 20. With the Python reader stripping trailing whitespace, the `printf x` guard on reading a command file had nothing left to guard and is removed.
4. **A signal stops the run at once (Behaviour 3).** Each command runs in the background with job control on while it starts, so it gets its own process group, and the runner waits for it. The signal trap sends TERM to the process group of every running job, waits for it, and exits 128 plus the signal number. The signal case of ruling 3 proves it; four reverts turn it red (below).
5. **The count check (Proof 5).** Closed by ruling 2.
6. **A state file that is not UTF-8 (Behaviour 2).** It exits 64 with `verify: the state file <path> is not UTF-8`. A case covers it.
7. **Fence words (Behaviour 4).** `yaml` and `yml` in any case count. A case runs a `yml` and a `YAML` block.
8. **Output quoted whole (Proof 6).** The two grep hits the first round shortened with "..." are now whole, taken from `README.md` at `00e8f8b` (the state the first round's grep ran on; line 122 is unchanged since). The first round's revert output is quoted whole, PyYAML's traceback frames included. Every output in this section is whole.
9. **Spec 3, Standards 1 and 2.** Not changed, as ruled: the state file's verify list and the skill texts are left as they are.

### The reviewer's reproductions, rerun on the final runner

In a scratch folder, `red.test.sh` holding `printf 'FAIL: x\n'; exit 1`:

```
$ verify list: - sh red.test.sh 2>&1 | tail -n 1
RED: sh red.test.sh 2>&1 | tail -n 1
exit status: 1
FAIL: x
exit 1
$ verify list: - sh red.test.sh 2>&1  | tail -1
RED: sh red.test.sh 2>&1  | tail -1
exit status: 1
FAIL: x
exit 1
$ verify list: - sh red.test.sh | tail -1
RED: sh red.test.sh | tail -1
exit status: 1
FAIL: x
exit 1
$ verify list: - sh red.test.sh 2>&1 | tail -1 ; true
FAIL: x
verify: 1 commands passed
exit 0
$ verify list: - |
  sh red.test.sh 2>&1 | tail -1
rules: x
RED: sh red.test.sh 2>&1 | tail -1
exit status: 1
FAIL: x
exit 1
$ a state file holding byte 0xff
verify: the state file s.md is not UTF-8
exit 64
$ a YAML fence
hi
verify: 1 commands passed
exit 0
$ a yml fence
hi
verify: 1 commands passed
exit 0
$ kill -TERM to the runner while "sleep 3; echo after > after.txt" runs
runner exit 143 after 1s
ls: after.txt: No such file or directory
```

The last line is the check that the killed command never wrote `after.txt`, run 3 seconds after the runner exited.

### Each case red under the revert it names

Each revert was applied to a copy of `utils/verify.sh` under `$TMPDIR` beside a copy of `utils/verify.test.sh`, and the test was run with `sh verify.test.sh 2>&1; echo "exit $?"`. The harness is `reverts2.py` in the session scratchpad; the worktree was not changed. All 36 reverts exit 1. Each turns red the case whose comment names it. The one exception is "pass the command to sh unquoted", which the quoting case's comment names as turning the first case red. The signal case goes red under four reverts: three fail on its time limit, since the runner then waits the full 20 seconds for the command, and the fourth fails on the command still running. The whole output:

```
revert: print the filtered test's whole output instead of its last line
FAIL: all green: output differs; got: noise
PASS: green
unfiltered out
folded-joined
verify: 3 commands passed
exit 1

revert: judge a filtered test by the exit status of the pipeline as written
FAIL: a filtered test that exits 1: exit 0, expected 1; output: PASS: green
PASS: x
verify: 2 commands passed
exit 1

revert: remove the PASS: check
FAIL: a filtered test without a PASS last line: exit 0, expected 1; output: done
verify: 1 commands passed
exit 1

revert: judge an unfiltered command passed whatever its exit status
FAIL: an unfiltered command that exits 1: exit 0, expected 1; output: broken out
verify: 1 commands passed
exit 1

revert: recognise only the exact suffix " 2>&1 | tail -1"
FAIL: the spelling sh red.test.sh 2>&1 | tail -n 1: exit 0, expected 1; output: FAIL: x
verify: 1 commands passed
exit 1

revert: do not strip trailing whitespace
FAIL: a literal block ending in a newline: exit 0, expected 1; output: FAIL: x
verify: 1 commands passed
exit 1

revert: take any command holding a pipe into tail as a filtered test
FAIL: a command ending in ; true: exit 1, expected 0; output: RED: sh red.test.sh 2>&1 | tail -1; true
exit status: 1
FAIL: x
exit 1

revert: run the command with the runner's standard input
FAIL: a command reading standard input: output differs; got: read from stdin
verify: 1 commands passed
exit 1

revert: pass the command to sh unquoted
FAIL: all green: exit 1, expected 0; output: RED: sh green.test.sh 2>&1 | tail -1
exit status: 0
last line does not start with PASS:
exit 1

revert: read only the first line of a command
FAIL: quotes, a newline and a carriage return: output differs; got: a 'b'|c "d"
610d62
verify: 2 commands passed
exit 1

revert: drop carriage returns
FAIL: quotes, a newline and a carriage return: output differs; got: a 'b'|c "d"
second line
6162
verify: 2 commands passed
exit 1

revert: count only a fence word of exactly yaml
FAIL: a yml fence: exit 64, expected 0; output: verify: fence.md has no yaml block
exit 1

revert: remove the stop at the first red command (carry on, exit 1 at the end)
FAIL: a command after the first red command ran
exit 1

revert: replace the exit 64 on a missing list by exit 0
FAIL: a block with no verify: key: exit 0, expected 64; output: verify: the first yaml block of nokey.md has no verify: list
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-revert.lczc5np7/verify.sh: line 156: [: : integer expression expected
verify:  commands passed
exit 1

revert: do not catch an error opening the state file
FAIL: a missing state file: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 17, in <module>
    with open(path, encoding="utf-8") as handle:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 'missing.md'
exit 1

revert: pass a state file with no yaml block with exit 0
FAIL: a state file with no yaml block: exit 0, expected 64; output: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-revert.qfn6dov1/verify.sh: line 155: [: : integer expression expected
verify:  commands passed
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
FAIL: a verify key that is not a list: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 73, in <module>
    commands[number - 1] = command
    ~~~~~~~~^^^^^^^^^^^^
TypeError: 'str' object does not support item assignment
exit 1

revert: remove the check that each command is a string
FAIL: a verify item that is not a string: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 68, in <module>
    if "\0" in command:
       ^^^^^^^^^^^^^^^
TypeError: argument of type 'int' is not iterable
exit 1

revert: remove the check for an empty command
FAIL: a verify item that is empty: exit 0, expected 64; output: verify: 2 commands passed
exit 1

revert: do not catch the YAML error
FAIL: a block that is not valid YAML: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 47, in <module>
    data = yaml.safe_load("\n".join(block))
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py", line 125, in safe_load
    return load(stream, SafeLoader)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py", line 81, in load
    return loader.get_single_data()
           ~~~~~~~~~~~~~~~~~~~~~~^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/constructor.py", line 49, in get_single_data
    node = self.get_single_node()
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 36, in get_single_node
    document = self.compose_document()
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 55, in compose_document
    node = self.compose_node(None, None)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 84, in compose_node
    node = self.compose_mapping_node(anchor)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 133, in compose_mapping_node
    item_value = self.compose_node(node, item_key)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 82, in compose_node
    node = self.compose_sequence_node(anchor)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 110, in compose_sequence_node
    while not self.check_event(SequenceEndEvent):
              ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/parser.py", line 98, in check_event
    self.current_event = self.state()
                         ~~~~~~~~~~^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/parser.py", line 483, in parse_flow_sequence_entry
    raise ParserError("while parsing a flow sequence", self.marks[-1],
            "expected ',' or ']', but got %r" % token.id, token.start_mark)
yaml.parser.ParserError: while parsing a flow sequence
  in "<unicode string>", line 1, column 9:
    verify: [touch marker
            ^
expected ',' or ']', but got '<stream end>'
  in "<unicode string>", line 1, column 22:
    verify: [touch marker
                         ^
exit 1

revert: read a block left open at the end of the file as closed
FAIL: a yaml block that is never closed: exit 0, expected 64; output: verify: 1 commands passed
exit 1

revert: remove the check for a NUL character
FAIL: a verify item holding a NUL: exit 0, expected 64; output: verify: 1 commands passed
exit 1

revert: remove the check for a command that pipes nothing into tail
FAIL: a command that pipes nothing into tail: exit 1, expected 64; output: RED: | tail -1
exit status: 0
last line does not start with PASS:
exit 1

revert: do not catch the decoding error
FAIL: a state file that is not UTF-8: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 18, in <module>
    lines = handle.read().split("\n")
            ~~~~~~~~~~~^^
  File "<frozen codecs>", line 325, in decode
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 8: invalid start byte
exit 1

revert: do not catch the import error
FAIL: no PyYAML: exit 1, expected 69; output: Traceback (most recent call last):
  File "<string>", line 10, in <module>
    import yaml
  File "/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-test.U4lOs7/noyaml/yaml.py", line 1, in <module>
    raise ImportError("no yaml here")
ImportError: no yaml here
exit 1

revert: remove the check for python3
FAIL: no python3: exit 1, expected 69; output: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-revert.5xyfmbiq/verify.sh: line 30: mktemp: command not found
verify: cannot create a scratch folder
exit 1

revert: run the command in the foreground
FAIL: the runner waited for the command to end
exit 1

revert: stop() does not kill the command
FAIL: the runner waited for the command to end
exit 1

revert: remove the signal traps
FAIL: the command still runs after the signal
exit 1

revert: the command does not get its own process group
FAIL: the runner waited for the command to end
exit 1

revert: remove the check of the argument count
FAIL: no argument: exit 1, expected 64
exit 1

revert: carry on without a scratch folder
FAIL: no scratch folder: mktemp: mkdtemp failed on /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-test.0aCHx8/no/such/folder/verify.TE0a3M: No such file or directory
cat: /cmd/1: No such file or directory
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-revert.itvrgwxc/verify.sh: line 161: /output: Read-only file system
RED: 
exit status: 1
cat: /output: No such file or directory
exit 1

revert: do not remove the scratch folder
FAIL: the runner left files in its scratch folder on green.md
exit 1
```

### Checks of the brief's "Verify before you report" list

Check 1:

```
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests
```

Check 2:

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

Check 3, each verify command by hand through its filter with `sh utils/verify.test.sh` as a tenth test, then the layout check and the ASCII check:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
PASS: launch.sh scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ python3 utils/check_skill_layout.py; echo "exit $?"
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
exit 0
$ <the ASCII check>; echo "exit $?"
exit 0
```

Check 4:

```
$ grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md
README.md:111:sh utils/verify.test.sh
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a filtered test, an unfiltered command and a command written as a folded scalar, and turns red on a filtered test that prints `PASS:` but exits 1, a filtered test whose last line does not start with `PASS:`, and an unfiltered command that exits 1. It checks that a red test is red under each spelling of a last pipeline stage into `tail` (`| tail -n 1`, two spaces before the pipe, no `2>&1`, no spaces, a literal block ending in a newline), and that a command ending in `; true` is judged on its exit status. It checks that a command reads end-of-file from standard input, that quotes, a newline and a carriage return reach a command as written, that `yml` and `YAML` fences count, that the run stops at the first red command, and that a signal stops the running command at once, runs no later command, removes the scratch folder and exits 128 plus the signal number. Each state file the runner cannot use exits 64 with its message: a missing file, a file that is not UTF-8, no `yaml` block, a `verify:` list that is missing, empty or not a list, a command that is empty, not a string, holds a NUL or pipes nothing into `tail`, a block that is not valid YAML or never closed, and a list found only in a second `yaml` block. A missing `python3` or PyYAML exits 69, and a scratch folder that cannot be created exits 1.
docs/dev/building.md:12:sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify lists
docs/dev/change-standard.md:48:sh utils/verify.test.sh 2>&1 | tail -1
```

The four lists compared (the README code block, the README bullets, `docs/dev/building.md`, `docs/dev/change-standard.md`):

```
four lists equal:
land.test.sh check_config.test.sh collect_findings.test.sh sync_rules.test.sh launch.test.sh pin.test.sh verify.test.sh check_skill_layout.test.sh check_rule_inventory.test.sh check_coverage.test.sh 
```

### Files

```
$ wc -l utils/verify.sh utils/verify.test.sh
     194 utils/verify.sh
     372 utils/verify.test.sh
     566 total
$ git diff --numstat 2ce1804 -- README.md docs utils | tr '\t' ' '
6 0 README.md
3 0 docs/dev/building.md
3 0 docs/dev/change-standard.md
194 0 utils/verify.sh
372 0 utils/verify.test.sh
$ git diff --numstat HEAD -- README.md docs utils | tr '\t' ' '
4 2 README.md
1 1 docs/dev/building.md
76 35 utils/verify.sh
135 8 utils/verify.test.sh
```

`utils/verify.sh` is 194 lines and `utils/verify.test.sh` 372. Against the base `2ce1804`, `README.md` has 6 added lines, `docs/dev/building.md` 3 and `docs/dev/change-standard.md` 3. This round changed `README.md` (the bullet, the paragraph split in two with the exit statuses), `docs/dev/building.md` (the runner paragraph), `utils/verify.sh` and `utils/verify.test.sh`.

### Judgment calls of this round

1. The `tail` stage is recognised by a regular expression over the stripped command: `(?P<run>.*?)\s*(?<!\|)\|(?!\|)\s*(?:\S*/)?tail(?:[ \t]+[^|;&<>()`$\n]*)?\Z`. A pipe inside quotes followed by `tail` at the very end would also match; no command in the lists does this.
2. The signal trap sends TERM, not KILL, to the command's process group and waits for it, so a test suite under it can remove its own scratch folders. A command that ignores TERM keeps the runner waiting until it ends.
3. The signal case of the test waits for the command to start by checking for a file every 0.1 seconds, for at most 10 seconds.
4. The process group comes from `set -m` while each command starts. It was run only under this machine's `/bin/sh` (bash in POSIX mode); dash and busybox were not run.

### User-visible changes of this round

1. A command whose last stage is `tail`, in any spelling, is a filtered test. Before: only the exact suffix ` 2>&1 | tail -1` was, and `sh red.test.sh 2>&1 | tail -n 1` passed a red test. After: that command is red (the reproductions above).
2. A signal to the runner stops the running command at once. Before: the runner exited only after the command ended. After: exit 143 within a second, and the command's process group is gone.
3. Exit statuses. Before: 0, 1, 64, 69 and 70, with 69 and 70 not named on any page. After: 0, 1, 64, 69 and 128 plus the signal number, named in the head comment, `README.md` and `docs/dev/building.md`.
4. A state file that is not UTF-8 exits 64 with a message; before, it ended in a traceback and exit 1. A `yml` or `YAML` fence counts; before, it was refused with exit 64.

## Repair round 2

Every item of the round's ruling is done. Round 1 is committed as `80ab53a`; the changes below sit on top of it, uncommitted.

### The ruling's items and what closes them

1. **Commands run as written through `bash -o pipefail -c`.** The embedded Python starts each command as `["bash", "-o", "pipefail", "-c", command]`, the command stripped of trailing whitespace and otherwise as the list holds it. The tail-stage regular expression that split a command is gone, and so is the refusal "pipes nothing into tail". Every spelling of the round 1 review's Behaviour 1 and Behaviour 4 is red, and the quoted pipe of Behaviour 3 runs as written (the reproductions below).
2. **The `PASS:` rule for a summary test.** The runner tells a summary test by its text, stated in the head comment: the text after the command's last single pipe (not `||`), past whitespace and backslash-newlines, is `tail` or a path ending in `/tail`, then options holding no `;` and no newline. Such a command passes only when the pipeline exits 0 and its last output line starts with `PASS:`, and the runner prints that line. Any other command passes on exit 0, and the runner prints its whole output. The pipefail status decides pass or fail for every command. For a summary test the `PASS:` line is the second condition: a command misread either way is still red when its test fails.
3. **Commands started from Python, and signals.**
   - The shell part of `utils/verify.sh` checks its argument, `python3` and `bash`, then runs `exec python3 -c "$program" "$1"`. The runner's process is therefore the Python process, under `sh`, `bash` or `dash` alike.
   - Python starts each command with `subprocess.Popen(..., stdin=subprocess.DEVNULL, stdout=<capture file>, stderr=subprocess.STDOUT, start_new_session=True)`. INT, HUP, QUIT and TERM are blocked around the start and unblocked in the child before it runs, so the runner always knows the pid of a command a signal can reach.
   - On any of the four signals the handler ends the command's whole session. It lists the session's process groups (`ps -A -o pid=,pgid=`, kept by `os.getsid`, which fails on a zombie so zombies drop out) and sends TERM to each group, the leader's group first. It waits up to two seconds for the session to empty, reaping the leader, then sends KILL to the groups left. It removes the scratch folder and exits 128 plus the signal number.
   - `set -m` is gone.
4. **`bash` as a stated requirement.** When `bash` is not on `PATH` the runner prints `verify: bash is not on PATH` and exits 69. The head comment, the README and `docs/dev/building.md` state the requirement and list every exit status with every refusal. The refusal the round 1 review's Spec 2 found missing from the head comment is gone with item 1. A scratch folder that cannot be created exits 1.
5. **Tests.**
   - Each Behaviour 1 spelling (a redirection on `tail`, `>&2`, a trailing `;`, a comment holding a pipe, a backslash-newline) and the Behaviour 4 `| grep PASS | tail -1` runs with a test that prints `PASS: x` and exits 1, and each is red. The round 1 spellings are red too.
   - The quoted pipe `echo 'PASS: a | tail -1'` runs as written and passes.
   - Each of INT, HUP, QUIT and TERM stops a running `sleep 20` command at once. No later command runs, the command's pid and process group are gone, and no scratch folder is left.
   - A command that ignores TERM is killed.
   - A command whose session holds a second process group (which ignores TERM) is ended whole, including that second group.
   - A new green case checks the three parts of the summary rule: a backslash-newline before `tail`, `/usr/bin/tail`, and `||` before `tail`.
   - The test starts the runner through the shell `VERIFY_TEST_SHELL` names. Without that variable, the file runs itself once with `sh` and, when dash is installed, once with `dash`, as its head comment says. Here both runs took place: `/bin/dash` is installed, and `VERIFY_TEST_SHELL=dash sh utils/verify.test.sh` exits 0 on its own.
6. **Pages.** The README bullet and runner paragraphs, the `docs/dev/building.md` paragraph and the head comment were rewritten to describe the runner after this round. The exit statuses are a list in both pages.
7. **Kept.** The `python3` check (round 1 review, Spec 1) stays, and every round 1 behaviour this ruling does not change stays: standard input from `/dev/null`, stripping trailing whitespace, quotes and carriage returns, `yml` and `YAML` fences, the non-UTF-8 refusal, the stop at the first red command, every exit-64 refusal but the "pipes nothing into tail" one, and exit 69 for PyYAML.

### A defect found and fixed in this round: EPERM from `killpg`

One of 30 repeated `sh` passes of the test failed on the QUIT case. The runner exited 1 with a traceback ending in `os.killpg(pid, signal.SIGKILL)` / `PermissionError: [Errno 1] Operation not permitted`. On macOS, `killpg` answers EPERM when every process left in the group is a zombie. Once the leader is reaped, the only thing left in its group can be a `sleep` that TERM killed and that launchd has not reaped yet.

A signal case made that state on purpose, in its first form. Its helper moved to a group of its own and left an unreaped zombie child in the leader's group. That form failed 3 times of 3 against the runner without the fix, each with the same `PermissionError` traceback. The case was then extended into "TERM to a command whose session has a second group": the helper also ignores TERM, so the case proves the whole-session kill as well. Under the EPERM revert the test now goes red on the INT case before it reaches this one. The runner now takes EPERM from `killpg`, like ESRCH, as a group already gone. After the fix and the whole-session kill of item 3:
- 30 of 30 `VERIFY_TEST_SHELL=sh` passes are green.
- 15 of 15 `VERIFY_TEST_SHELL=dash` passes run in a background batch, and 10 of 10 run in the foreground, are green.
- Under the revert "take EPERM from killpg as an error" below, the test is red on the INT case, from the same race.

### The round 1 review's reproductions, rerun on the final runner

In a scratch folder, `red.test.sh` holds `printf 'FAIL: x\n'; exit 1` and `passexit1.test.sh` holds `printf 'PASS: x\n'; exit 1`. Each signal line starts the runner in the background under the named shell with `sleep 4` running, sends the signal, and looks 5 seconds later for the file the command would have written after its sleep:

```
$ verify list: - |
  sh red.test.sh 2>&1 | tail -1 2>/dev/null
RED: sh red.test.sh 2>&1 | tail -1 2>/dev/null
exit status: 1
FAIL: x
exit 1
$ verify list: - |
  sh red.test.sh 2>&1 | tail -1 >&2
RED: sh red.test.sh 2>&1 | tail -1 >&2
exit status: 1
FAIL: x
exit 1
$ verify list: - |
  sh red.test.sh 2>&1 | tail -1;
RED: sh red.test.sh 2>&1 | tail -1;
exit status: 1
FAIL: x
exit 1
$ verify list: - |
  sh red.test.sh 2>&1 | tail -1 # keep | last
RED: sh red.test.sh 2>&1 | tail -1 # keep | last
exit status: 1
FAIL: x
exit 1
$ verify list: - |
  sh red.test.sh 2>&1 | \
  tail -1
RED: sh red.test.sh 2>&1 | \
tail -1
exit status: 1
FAIL: x
exit 1
$ verify list: - |
  echo 'PASS: a | tail -1'
PASS: a | tail -1
verify: 1 commands passed
exit 0
$ verify list: - |
  sh passexit1.test.sh 2>&1 | grep PASS | tail -1
RED: sh passexit1.test.sh 2>&1 | grep PASS | tail -1
exit status: 1
PASS: x
exit 1
sh INT: exit 130 after 0s; after written: no; scratch left: 0; output: []
sh HUP: exit 129 after 0s; after written: no; scratch left: 0; output: []
sh QUIT: exit 131 after 0s; after written: no; scratch left: 0; output: []
sh TERM: exit 143 after 0s; after written: no; scratch left: 0; output: []
dash INT: exit 130 after 0s; after written: no; scratch left: 0; output: []
dash HUP: exit 129 after 0s; after written: no; scratch left: 0; output: []
dash QUIT: exit 131 after 1s; after written: no; scratch left: 0; output: []
dash TERM: exit 143 after 0s; after written: no; scratch left: 0; output: []
```

### Each case red under the revert it names

Each revert was applied to a copy of `utils/verify.sh` under `$TMPDIR` beside a copy of `utils/verify.test.sh`, and the test was run with `sh verify.test.sh 2>&1; echo "exit $?"`. The harness is `reverts3.py` in the session scratchpad, run in two halves (`0 22` and `22 44`); the worktree was not changed. All 44 reverts exit 1, each on a case whose comment names it.
- The trailing-whitespace revert and the first-line revert fail the tail-stage case first, as their comments say.
- "send only TERM, no KILL" fails first on the second-group case, whose helper ignores TERM.
- The bash-only construct fails in the `dash` pass only; the `sh` pass before it was green.
- Where a signal revert keeps the runner alive, the test's watchdog kills the runner after 10 seconds. That is the `Killed: 9` notice bash prints for the background job.

The whole output:

```
revert: print a summary test's whole output instead of its last line
FAIL: all green: output differs; got: noise
PASS: green
plain out
folded-joined
verify: 3 commands passed (runner under sh)
exit 1

revert: run only what comes before the last pipe
FAIL: a quoted pipe: exit 1, expected 0; output: RED: echo 'PASS: a | tail -1'
exit status: 2
bash: -c: line 0: unexpected EOF while looking for matching `''
bash: -c: line 1: syntax error: unexpected end of file (runner under sh)
exit 1

revert: do not skip a backslash-newline before tail
FAIL: the tail stage: output differs; got: noise
PASS: green
PASS: green
x
verify: 3 commands passed (runner under sh)
exit 1

revert: do not take a path to tail
FAIL: the tail stage: output differs; got: PASS: green
noise
PASS: green
x
verify: 3 commands passed (runner under sh)
exit 1

revert: take the text after || as a tail stage as well
FAIL: the tail stage: exit 1, expected 0; output: PASS: green
PASS: green
RED: printf 'x\n' || tail -n 1
exit status: 0
last line does not start with PASS:
x (runner under sh)
exit 1

revert: run a command without pipefail
FAIL: a summary test that exits 1: exit 0, expected 1; output: PASS: green
PASS: x
verify: 2 commands passed (runner under sh)
exit 1

revert: remove the PASS: check
FAIL: a summary test without a PASS last line: exit 0, expected 1; output: done
verify: 1 commands passed (runner under sh)
exit 1

revert: judge a plain command passed whatever its exit status
FAIL: a plain command that exits 1: output differs; got: broken out (runner under sh)
exit 1

revert: do not strip a command's trailing whitespace
FAIL: the tail stage: output differs; got: noise
PASS: green
PASS: green
x
verify: 3 commands passed (runner under sh)
exit 1

revert: take any command whose text after its last pipe starts with tail or a path to tail as a summary test
FAIL: a command ending in ; true: exit 1, expected 0; output: RED: sh red.test.sh 2>&1 | tail -1; true
exit status: 0
last line does not start with PASS:
FAIL: x (runner under sh)
exit 1

revert: run the command with the runner's standard input
FAIL: a command reading standard input: output differs; got: read from stdin
verify: 1 commands passed (runner under sh)
exit 1

revert: drop carriage returns
FAIL: quotes, a newline and a carriage return: output differs; got: a 'b'|c "d"
second line
6162
verify: 2 commands passed (runner under sh)
exit 1

revert: run only the first line of a command
FAIL: the tail stage: exit 1, expected 0; output: RED: sh green.test.sh 2>&1 | \
tail -n 2
exit status: 2
bash: -c: line 1: syntax error: unexpected end of file (runner under sh)
exit 1

revert: count only a fence word of exactly yaml
FAIL: a yml fence: exit 64, expected 0; output: verify: fence.md has no yaml block (runner under sh)
exit 1

revert: carry on after a red command and exit 1 only at the end
FAIL: a command after the first red command ran (runner under sh)
exit 1

revert: replace the exit 64 on a missing list by exit 0
FAIL: a block with no verify: key: exit 0, expected 64; output:  (runner under sh)
exit 1

revert: do not catch an error opening the state file
FAIL: a missing state file: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 78, in <module>
    with open(path, encoding="utf-8") as handle:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 'missing.md' (runner under sh)
exit 1

revert: pass a state file with no yaml block with exit 0
FAIL: a state file with no yaml block: exit 0, expected 64; output:  (runner under sh)
exit 1

revert: read the first yaml block that holds a verify key
FAIL: a verify list only in a second yaml block: exit 0, expected 64; output: verify: 1 commands passed (runner under sh)
exit 1

revert: ignore fences other than yaml ones
FAIL: a verify list only in a second yaml block: exit 0, expected 64; output: verify: 1 commands passed (runner under sh)
exit 1

revert: remove the check for an empty list
FAIL: an empty verify list: exit 0, expected 64; output: verify: 0 commands passed (runner under sh)
exit 1

revert: remove the check that the key holds a list
FAIL: a verify key that is not a list: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 125, in <module>
    commands[number - 1] = command = command.rstrip()
    ~~~~~~~~^^^^^^^^^^^^
TypeError: 'str' object does not support item assignment (runner under sh)
exit 1

revert: remove the check that each command is a string
FAIL: a verify item that is not a string: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 123, in <module>
    if "\0" in command:
       ^^^^^^^^^^^^^^^
TypeError: argument of type 'int' is not iterable (runner under sh)
exit 1

revert: remove the check for an empty command
FAIL: a verify item that is empty: exit 0, expected 64; output: verify: 2 commands passed (runner under sh)
exit 1

revert: do not catch the YAML error
FAIL: a block that is not valid YAML: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 108, in <module>
    data = yaml.safe_load("\n".join(block))
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py", line 125, in safe_load
    return load(stream, SafeLoader)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/__init__.py", line 81, in load
    return loader.get_single_data()
           ~~~~~~~~~~~~~~~~~~~~~~^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/constructor.py", line 49, in get_single_data
    node = self.get_single_node()
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 36, in get_single_node
    document = self.compose_document()
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 55, in compose_document
    node = self.compose_node(None, None)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 84, in compose_node
    node = self.compose_mapping_node(anchor)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 133, in compose_mapping_node
    item_value = self.compose_node(node, item_key)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 82, in compose_node
    node = self.compose_sequence_node(anchor)
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/composer.py", line 110, in compose_sequence_node
    while not self.check_event(SequenceEndEvent):
              ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/parser.py", line 98, in check_event
    self.current_event = self.state()
                         ~~~~~~~~~~^^
  File "/Users/axelfaes/Library/Python/3.13/lib/python/site-packages/yaml/parser.py", line 483, in parse_flow_sequence_entry
    raise ParserError("while parsing a flow sequence", self.marks[-1],
            "expected ',' or ']', but got %r" % token.id, token.start_mark)
yaml.parser.ParserError: while parsing a flow sequence
  in "<unicode string>", line 1, column 9:
    verify: [touch marker
            ^
expected ',' or ']', but got '<stream end>'
  in "<unicode string>", line 1, column 22:
    verify: [touch marker
                         ^ (runner under sh)
exit 1

revert: read a block left open at the end of the file as closed
FAIL: a yaml block that is never closed: exit 0, expected 64; output: verify: 1 commands passed (runner under sh)
exit 1

revert: remove the check for a NUL character
FAIL: the runner left files in its scratch folder on nul.md (runner under sh)
exit 1

revert: do not catch the decoding error
FAIL: a state file that is not UTF-8: exit 1, expected 64; output: Traceback (most recent call last):
  File "<string>", line 79, in <module>
    lines = handle.read().split("\n")
            ~~~~~~~~~~~^^
  File "<frozen codecs>", line 325, in decode
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 8: invalid start byte (runner under sh)
exit 1

revert: do not catch the import error
FAIL: no PyYAML: exit 1, expected 69; output: Traceback (most recent call last):
  File "<string>", line 71, in <module>
    import yaml
  File "/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-test.Lc5weG/noyaml/yaml.py", line 1, in <module>
    raise ImportError("no yaml here")
ImportError: no yaml here (runner under sh)
exit 1

revert: remove the check for python3
FAIL: no python3: output differs; got: verify: bash is not on PATH (runner under sh)
exit 1

revert: remove the check for bash
FAIL: no bash: exit 1, expected 69; output: Traceback (most recent call last):
  File "<string>", line 156, in <module>
    process = subprocess.Popen(["bash", "-o", "pipefail", "-c", command],
                               stdin=subprocess.DEVNULL, stdout=capture,
                               stderr=subprocess.STDOUT, start_new_session=True,
                               preexec_fn=unblock)
  File "/opt/homebrew/Cellar/python@3.13/3.13.7/Frameworks/Python.framework/Versions/3.13/lib/python3.13/subprocess.py", line 1039, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                        pass_fds, cwd, env,
                        ^^^^^^^^^^^^^^^^^^^
    ...<5 lines>...
                        gid, gids, uid, umask,
                        ^^^^^^^^^^^^^^^^^^^^^^
                        start_new_session, process_group)
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/opt/homebrew/Cellar/python@3.13/3.13.7/Frameworks/Python.framework/Versions/3.13/lib/python3.13/subprocess.py", line 1972, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'bash' (runner under sh)
exit 1

revert: do not handle INT
verify.test.sh: line 410: 35434 Killed: 9               ( cd "$work" && TMPDIR=$runner_tmp exec "$shell_path" "$verify" signal.md ) > "$test_root/signal.out" 2>&1
FAIL: INT: the runner did not stop within 10 seconds (runner under sh)
exit 1

revert: do not handle HUP
FAIL: HUP: the command still runs after the signal (runner under sh)
exit 1

revert: do not handle QUIT
verify.test.sh: line 410: 37601 Killed: 9               ( cd "$work" && TMPDIR=$runner_tmp exec "$shell_path" "$verify" signal.md ) > "$test_root/signal.out" 2>&1
FAIL: QUIT: the runner did not stop within 10 seconds (runner under sh)
exit 1

revert: do not handle TERM
FAIL: TERM: the command still runs after the signal (runner under sh)
exit 1

revert: run the command in the runner's own session
verify.test.sh: line 410: 40590 Killed: 9               ( cd "$work" && TMPDIR=$runner_tmp exec "$shell_path" "$verify" signal.md ) > "$test_root/signal.out" 2>&1
FAIL: INT: the runner did not stop within 10 seconds (runner under sh)
exit 1

revert: the handler does not end the command's session
FAIL: INT: the command still runs after the signal (runner under sh)
exit 1

revert: send only TERM, no KILL
FAIL: the second process group of the session still runs (runner under sh)
exit 1

revert: signal only the group the leader heads
FAIL: the second process group of the session still runs (runner under sh)
exit 1

revert: take EPERM from killpg as an error
FAIL: INT: exit 1, expected 130; output: Traceback (most recent call last):
  File "<string>", line 162, in <module>
    code = process.wait()
  File "/opt/homebrew/Cellar/python@3.13/3.13.7/Frameworks/Python.framework/Versions/3.13/lib/python3.13/subprocess.py", line 1280, in wait
    return self._wait(timeout=timeout)
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/opt/homebrew/Cellar/python@3.13/3.13.7/Frameworks/Python.framework/Versions/3.13/lib/python3.13/subprocess.py", line 2066, in _wait
    (pid, sts) = self._try_wait(0)
                 ~~~~~~~~~~~~~~^^^
  File "/opt/homebrew/Cellar/python@3.13/3.13.7/Frameworks/Python.framework/Versions/3.13/lib/python3.13/subprocess.py", line 2024, in _try_wait
    (pid, sts) = os.waitpid(self.pid, wait_flags)
                 ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "<string>", line 63, in stop
    end_session(running)
    ~~~~~~~~~~~^^^^^^^^^
  File "<string>", line 55, in end_session
    signal_session(sid, signal.SIGKILL)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
  File "<string>", line 38, in signal_session
    os.killpg(group, number)
    ~~~~~~~~~^^^^^^^^^^^^^^^
PermissionError: [Errno 1] Operation not permitted (runner under sh)
exit 1

revert: remove the check of the argument count
FAIL: no argument: exit 1, expected 64 (runner under sh)
exit 1

revert: fall back to another folder when TMPDIR has none
FAIL: no scratch folder: exit 0, expected 1; output: PASS: green
plain out
folded-joined
verify: 3 commands passed (runner under sh)
exit 1

revert: do not remove the scratch folder
FAIL: the runner left files in its scratch folder on green.md (runner under sh)
exit 1

revert: use a construct only bash knows in the shell part
FAIL: all green: exit 64, expected 0; output: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/verify-revert.wxm3678o/verify.sh: 36: [[: not found
verify: usage: sh utils/verify.sh <state file> (runner under dash)
exit 1
```

### Checks of the brief's "Verify before you report" list

Check 1, with the test run whole and with the `dash` pass alone. A pass under one named shell prints nothing on success; only the run over both shells prints the `PASS:` line:

```
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests
$ sh utils/verify.test.sh; echo "exit $?"
PASS: verify.sh scratch tests
exit 0
$ VERIFY_TEST_SHELL=dash sh utils/verify.test.sh; echo "exit $?"
exit 0
```

Check 2, with the runner started by `sh` and by `dash`:

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
$ dash utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
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

Check 3, each verify command by hand through its filter with `sh utils/verify.test.sh` as a tenth test, then the layout check and the ASCII check:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
PASS: launch.sh scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ python3 utils/check_skill_layout.py; echo "exit $?"
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
exit 0
$ <the ASCII check>; echo "exit $?"
exit 0
```

Check 4:

```
$ grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md
README.md:111:sh utils/verify.test.sh
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a summary test, a plain command and a command written as a folded scalar, and turns red on a summary test that prints `PASS:` but exits 1, a summary test whose last line does not start with `PASS:`, and a plain command that exits 1. It checks that a test printing `PASS:` and exiting 1 is red under each spelling of a pipe into `tail`: `| tail -n 1`, two spaces before the pipe, no `2>&1`, no spaces, a redirection or `;` after `tail`, a comment holding a pipe, a backslash-newline, `| grep PASS | tail -1`. It checks that a pipe inside quotes runs as written, that a command ending in `; true` is judged on its exit status, that a command reads end-of-file from standard input, that quotes, a newline and a carriage return reach a command as written, that `yml` and `YAML` fences count, and that the run stops at the first red command. Each of INT, HUP, QUIT and TERM stops the running command and its session at once, runs no later command, removes the scratch folder and exits 128 plus the signal number, a command that ignores TERM is killed, and so is a second process group in the command's session. Each state file the runner cannot use exits 64 with its message: a missing file, a file that is not UTF-8, no `yaml` block, a `verify:` list that is missing, empty or not a list, a command that is empty, not a string or holds a NUL, a block that is not valid YAML or never closed, and a list found only in a second `yaml` block. A missing `python3`, PyYAML or `bash` exits 69, and a scratch folder that cannot be created exits 1. The file runs itself twice, starting the runner with `sh` and, when it is installed, with `dash`.
docs/dev/building.md:12:sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify lists
docs/dev/change-standard.md:48:sh utils/verify.test.sh 2>&1 | tail -1
```

The four lists compared:

```
four lists equal:
land.test.sh check_config.test.sh collect_findings.test.sh sync_rules.test.sh launch.test.sh pin.test.sh verify.test.sh check_skill_layout.test.sh check_rule_inventory.test.sh check_coverage.test.sh 
```

### Files

```
$ wc -l utils/verify.sh utils/verify.test.sh
     237 utils/verify.sh
     471 utils/verify.test.sh
     708 total
$ git diff --numstat 2ce1804 -- README.md docs utils | tr '\t' ' '
14 0 README.md
9 0 docs/dev/building.md
3 0 docs/dev/change-standard.md
237 0 utils/verify.sh
471 0 utils/verify.test.sh
$ git diff --numstat 80ab53a -- README.md docs utils | tr '\t' ' '
11 3 README.md
7 1 docs/dev/building.md
156 113 utils/verify.sh
188 89 utils/verify.test.sh
$ awk 'length > 100' utils/verify.sh utils/verify.test.sh
```

`utils/verify.sh` is now 237 lines and `utils/verify.test.sh` 471. Against the base `2ce1804`, `README.md` has 14 added lines, `docs/dev/building.md` 9 and `docs/dev/change-standard.md` 3.

### Judgment calls of this round

1. How a summary test is told apart is the text rule of item 2. It changes only whether the `PASS:` condition applies; pipefail makes the red.
2. The runner's own process is the Python process. It installs its handlers even for signals the shell that started it had set to be ignored: a shell script's background jobs start with INT and QUIT ignored. Without that, INT and QUIT would not stop a runner started in the background.
3. The session's process groups are found with `ps -A -o pid=,pgid=` and `os.getsid`. `ps` with `-A` and `-o` is POSIX; it runs only when a signal arrives. A process that leaves the command's session with `setsid` of its own is outside the session and is not stopped.
4. The grace between TERM and KILL is two seconds.
5. A command's output is what its pipeline prints. For a summary test piped into `tail -1`, the red block therefore shows the one line `tail` passed on, not the test's whole output (the `nopass` case now expects `done` alone). The test is rerun without its filter to read the rest, as `docs/dev/change-standard.md` already says.
6. The scratch folder is created in `$TMPDIR`, or `/tmp` when it is unset, and never in a fallback folder. Python's `tempfile` would otherwise pick another folder silently when `$TMPDIR` does not exist.
7. The first case's summary test pipes into `tail -n 2`, so printing the whole output differs from printing the last line.
8. A command that leaves a background process behind and then exits normally is not stopped; the runner ends a command's session only on a signal.
9. A signal-case failure in the test now prints the runner's output, which is how the EPERM traceback above was read.

### User-visible changes of this round

1. Before: a red test passed when its pipe into `tail` was spelled with a redirection, a trailing `;`, a comment holding a pipe or a backslash-newline, or had another stage before `tail`. After: all of these are red, since `bash -o pipefail` returns the test's status.
2. Before: a pipe inside quotes caused a false red with a syntax error. After: the command runs as written.
3. Before: under `dash`, `set -m` printed "can't access tty" before each command's output, and a signal waited for the command to end. After: the runner prints the same output and stops a command at once under `dash` as under `sh`, with every process group of its session.
4. Before: the runner needed `python3` and PyYAML. After: it also needs `bash`, and exits 69 without it. The "pipes nothing into tail" refusal is gone; such a command is a `bash` syntax error and is red.
5. Before: a red summary test printed the test's whole output. After: it prints what the pipeline printed.
