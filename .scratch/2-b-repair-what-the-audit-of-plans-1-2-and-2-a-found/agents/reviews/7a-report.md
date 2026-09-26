# Step 7a report: the allow list of a builder started from a shell

Everything in the brief, in the nine rulings of repair round 1 and in the four items of repair round 2 is done. The README Tests bullets, the verify list, the brief's premise line and step 7's resume are the orchestrator's (round 1 rulings) and are unchanged here.

## Open items of the state file (verbatim)

- none.

## Repair round 1

| Ruling | State | Command that proves it | Output |
|---|---|---|---|
| 1. A prefix stops before a word no rule can hold; grouped commands, substitutions and keyword starts refused | DONE | `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 \| tail -1` | `PASS: allow_list.py scratch tests`; reverts B1 to B5, B4b and the 14 per-character reverts D red |
| 2. `worker_allow` entries and allow-file lines trimmed and checked in all three places | DONE | the three tests | PASS each; reverts B6, B7, C5, F1, F2 and the per-character reverts D (both scripts) and E (`launch.sh`) red |
| 3. Exit 69 kept, listed as a change no brief item asks for | DONE | this report, "Changes no brief item asks for" | |
| 4. The five branches no test held | DONE | `allow_list.test.sh` | each branch has a case its revert turns red, or is removed; the list below |
| 5. The "land sequence" red: counted, traced, fixed | Superseded by "Repair round 2" | the harness runs below | These counts came from a harness running the one case alone. On the whole suite, "land sequence with KILL" stayed red under load, so the fix below did not hold; repair round 2 fixes it in `launch.sh` and restores the case. |
| 6. The resume keeps the allow file | DONE | `grep -n "allow" skills/plan-orchestration/SKILL.md` | lines 71, 72, 175 |
| 7. `/plan` writes `worker_allow` | DONE | `sed -n '52p' skills/plan/SKILL.md \| grep -o 'launch_note\`, \`worker_allow\`'` | ``launch_note`, `worker_allow`` |
| 8. `launch.sh` head comment in short sentences | DONE | `sed -n '41,51p' skills/plan-orchestration/templates/launch.sh` | the paragraph "Allow list." in sentences of 20 words or fewer, one idea each, the character list counted as one item |
| 9. No added script or test line over 100 characters | DONE | `git diff -U0 df3c6a7 -- skills \| grep '^+' \| grep -v '^+++' \| awk 'length > 101'` | the only lines printed are Markdown lines and the templates' one-line key comments (`plan.yaml`, `orchestrator-state.md`), which the prose standard and the templates keep on one line; no `.py` or `.sh` line |

### Ruling 1, what `allow_list.py` does now

- The prefix of a simple command is its words up to, not including, the first word holding a quote, `$`, a backtick, a backslash, `(`, `)`, `{`, `}`, `[`, `]`, a comma, `*` or `?`.
- A command holding `$(` or a backtick outside single quotes, or `(`, `)`, `{`, `}` outside quotes, exits 64 with `the command holds $( or a backtick outside single quotes, or (, ), { or } outside quotes: <command>`. `$(` and a backtick inside double quotes are substitutions in `sh`, so they are refused there too; inside single quotes they are text.
- A simple command whose first word is a shell keyword (`if`, `then`, `else`, `elif`, `fi`, `for`, `while`, `until`, `do`, `done`, `case`, `esac`, `!`) or holds one of the characters exits 64 with `the command starts a simple command with <word>, which no rule can hold: <command>`.
- The perl case prints `git ls-files -coz --exclude-standard` and `xargs -0 perl -CSD -ne`. The reviewer's five inputs are refusal cases, with `echo "$(date)" | wc -l`, ``sh a.sh "`date`"`` and `sh a.sh )`; their control is `sh a.sh '$(x) `y` (z) {w}'`, which prints `sh a.sh`.

### Ruling 4, each branch

| Branch | Now |
|---|---|
| `<&` | case "the other redirections" (`sh t.sh 0<&3 >\|forced.txt <>rw.txt`, and a spaced form); revert C1 prints `3` as a command |
| `>\|` | the same cases; revert C2 prints `forced.txt` as a command |
| `<>` | removed from `REDIRECTIONS`: `<` followed by `>` removes the same target, so the entry changed nothing (the reviewer's revert kept the test green). The same case holds `<>rw.txt` and passes without the entry |
| a comment | case "a comment" (`sh a.sh # run it \| tail -1`); revert C3 prints `sh a.sh # run it` and `tail -1` |
| a backslash inside double quotes | case "an escaped quote inside double quotes" (`grep "a\"\|b" x \| wc -l`); revert C4 refuses the command as an unclosed quote |
| a backslash-newline | case "a backslash-newline" (a literal verify entry `sh a.sh \` then `--flag`); revert C5 prints `sh a.sh` |
| the `yml` / `YAML` fence word | cases "a yml fence" and "a YAML fence"; reverts C6 and C7 print `has no yaml block` |

The line-break-inside-a-word refusal of round 0 is removed: under ruling 1 a prefix never holds a quoted word, and a backslash-newline is joined, so no prefix can hold a line break. Its case now expects `sh a.sh` for `sh a.sh 'x<newline>y' z`; revert C8 (a newline ending a quoted word) makes it red.

### Ruling 5, the trace

The case ("land sequence", `launch.test.sh`) launched a builder that ignores TERM, sent TERM to the leader, ran `sleep 2`, sent KILL if the leader was alive, and required an exit file. I ran the case alone through a harness in the session scratchpad: the test's setup lines (up to its first case) plus this case, with the `sleep 2` replaced by a two-second poll that records when the leader ended and sends KILL at 2 s exactly as before.

- One at a time, 20 runs each: base df3c6a7 0 reds, the round's tree before the fix 0 reds. The leader ended 1.117 s to 1.447 s after TERM.
- 24 runs, 8 at once (`seq 1 24 | xargs -P 8 ...`): 0 reds on either; the leader ended up to 1.834 s (base) and 1.885 s (tree) after TERM.
- 32 runs, 16 at once: base 1 red, tree 6 reds, each `leader gone after (not within 2)s, KILL sent: yes, exit file: none` then `FAIL: land sequence: no exit file`. The round does not change the signal path: `git diff df3c6a7 -- skills/plan-orchestration/templates/launch.sh | grep -c -E 'on_signal|sub stop|members'` prints 0.
- A copy of `launch.sh` logging the runner's stop phases (8 at once) printed, for example, `trace scan1 0.273 trace grace 1.323 trace scan2 1.360 trace reaped 1.361`: the first process scan, the one-second grace against a builder that ignores TERM, the second scan, then the reap. The leader then writes the exit file and ends.

The cause: the leader's stop path takes the runner's one-second grace plus two process scans and the leader's own exit, and on a loaded machine that passes the two seconds after which the case sent KILL. The KILL then ends the leader before it writes the exit file. The case's own comment said it covers the leader ending "within its own one-second grace"; the KILL path is the case above it ("land sequence with KILL"). The fix replaces the fixed `sleep 2` and the conditional KILL with `wait_until "land sequence: the session leader did not end on TERM" not_alive "$leader"`, and the comments (the case and the file's header list) say so.

After the fix, the case copy: 20 runs one at a time, `20 PASS`; 24 runs 8 at once, `24 PASS`; 32 runs 16 at once, `32 PASS`. Revert R5 (the signal path's `write_exit "$code"` removed from `on_signal`) on the case copy: `FAIL: land sequence: no exit file`.

What this leaves as it was: the land skill sends KILL two seconds after TERM (`skills/land/SKILL.md:41`), and under the 16-at-once load the leader's stop took more than two seconds in 7 of 64 runs. `launch.sh`'s grace and the land skill's two seconds are unchanged; the round's ruling allowed either fix, and this one is the case's.

## First run of the cases, on the unchanged tree

The tests were written first and run before any code changed (round 0). Each case's result was taken from copies of `allow_list.test.sh` and `check_config.test.sh` whose `fail` does not exit, and from direct runs of the unchanged `launch.sh` with a stub `claude`.

| Case | Result on the unchanged tree |
|---|---|
| Every `allow_list.py` case | red: `can't open file '.../allow_list.py': [Errno 2] No such file or directory` |
| `launch.sh claude ... --allow-file <file>`, first launch and `--resume` | red: exit 64, `launch.sh: unknown option --allow-file` |
| `launch.sh claude` without `--allow-file` | red: exit 0, the builder started with no `--allowedTools` |
| `--allow-file` naming a missing file, or a file of blank lines | red: exit 64 for another reason, `unknown option --allow-file` |
| `launch.sh codex ... --allow-file <file>` | red: exit 64 with `unknown option --allow-file`, not `--allow-file is for claude only` |
| `launch.sh transcript ... --allow-file <file>` | exit 64 already; the message check (`--allow-file is not a transcript option`) red |
| `check_config.py`, `worker_allow: sh a.sh` | red: `missing [error: worker_allow is a str, its default is a list: 'sh a.sh'] in: error: unknown key: worker_allow` |
| `check_config.py`, `worker_allow: [sh a.sh]` | red: `expected a pass, got: error: unknown key: worker_allow` |
| `check_config.py`, key left out | red: `missing [note: worker_allow not set, default [] applies]` |

No case was wrong by the brief's own rules. Ruling 1 changed the perl case's expected output to `git ls-files -coz --exclude-standard` and `xargs -0 perl -CSD -ne`.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | the block below, exit 0 |
| Verify 2 | DONE | `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 \| tail -1` | `PASS: allow_list.py scratch tests` |
| Verify 3 | DONE | `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1` | `PASS: launch.sh scratch tests` |
| Verify 3 under dash | DONE | `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1` | `PASS: launch.sh scratch tests` |
| Verify 4 | DONE | `sh skills/ordo-init/templates/check_config.test.sh 2>&1 \| tail -1` | `PASS: check_config.py scratch tests` |
| Verify 5 | DONE | `python3 skills/plan-orchestration/templates/allow_list.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | the 15 lines below, exit 0 |
| Verify 6 | DONE | the revert runs below | every revert red |
| The key in the three templates | DONE | `land.test.sh`, `check_config.test.sh` | PASS; reverts C1-key, C2-default, C4-project, S1 red |
| `check_config.py` | DONE | `check_config.test.sh` | PASS; reverts C3-entries, C5-chars and the 14 D reverts red |
| `allow_list.py` | DONE | `allow_list.test.sh` | PASS; 29 reverts plus B4b and 14 D reverts red |
| `launch.sh --allow-file` | DONE | `launch.test.sh` under sh and dash | PASS; L1 to L13, F1, F2 and the 14 E reverts red |
| Recipe text, pages, `skills/plan/SKILL.md:52` | DONE | layout check in verify 1 | ten `ok:` lines |

Verify 1, the lines the runner printed:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
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
verify: 13 commands passed
```

Verify 5, the prefixes of the plan's 13 verify commands:

```
sh skills/land/templates/land.test.sh
tail -1
sh skills/ordo-init/templates/check_config.test.sh
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh skills/plan-orchestration/templates/launch.test.sh
sh skills/spec/templates/check_paths.test.sh
sh utils/pin.test.sh
sh skills/land/templates/verify.test.sh
sh utils/check_skill_layout.test.sh
sh utils/check_rule_inventory.test.sh
sh utils/check_coverage.test.sh
python3 utils/check_skill_layout.py
git ls-files -coz --exclude-standard
xargs -0 perl -CSD -ne
```

## Reverts and their red output

Each revert was applied to a copy of `skills/` in the session scratchpad (the worktree unchanged), and the test run from that copy; `<tmp>` is the test's `mktemp` folder. Every revert below exited 1.

`allow_list.py`, test `allow_list.test.sh`:

- A1, `|` out of `SEPARATORS`: `FAIL: the verify list alone: printed` / `sh a.test.sh | tail -1`.
- A2, `REDIRECTIONS = ()`: `FAIL: the verify list alone: printed` / `sh a.test.sh 2>` / `1`.
- A3, uniqueness removed: `FAIL: the verify list and one command: printed` (`tail -1` twice).
- A4, quotes not read: `FAIL: a pipe inside quotes: exited 64, expected 0: allow_list.py: the command starts a simple command with b/', which no rule can hold: ...`.
- A5, `worker_allow` ignored: `FAIL: worker_allow set: printed` / `sh a.test.sh` / `tail -1`.
- A6, entries not checked: `FAIL: worker_allow holding an empty string: exited 0, expected 64: `.
- A7, empty result not refused: `FAIL: an empty result: exited 0, expected 64: `.
- A8, `;` out: `FAIL: a pipe inside double quotes and an escaped pipe: printed` / `grep -e` / `wc -l; grep`.
- A8b, `&` out: `FAIL: the separators: printed` / `a && b`.
- A8c, the newline out: `FAIL: a newline and &: printed` / `sh one.sh` / `sh one.sh` / `sh two.sh`.
- A9, the last yaml block read: `FAIL: the verify list alone: exited 64, expected 0: allow_list.py: the allow list is empty: <tmp>/a test root/case 1.md gives no command`.
- A10, the list check out: `FAIL: worker_allow a string: standard error was [allow_list.py: worker_allow holds an entry that is not a non-empty one-line string: ' '], expected a line holding [worker_allow is not a list: 'sh only.sh']`.
- A11, `[]` printed as the list: `FAIL: worker_allow []: exited 64, expected 0: allow_list.py: the allow list is empty: ...`.
- A12, an unclosed first block read: `FAIL: a yaml block not closed: exited 0, expected 64: `.
- B1, the cut removed: `FAIL: a pipe inside quotes: printed` / `git ls-files -coz --exclude-standard` / `xargs -0 perl -CSD -ne 'print if /a|b/'`.
- B2, the grouping refusal outside quotes removed: `FAIL: the command echo $(git ls-files | wc -l): exited 0, expected 64: `.
- B3, the refusal inside double quotes removed: `FAIL: the command echo "$(date)" | wc -l: exited 0, expected 64: `.
- B4, the first-word check removed: `FAIL: the first word if: exited 0, expected 64: `.
- B4b, the first-word check kept for keywords only: `FAIL: the first word [: exited 0, expected 64: `.
- B5, `KEYWORDS = set()`: `FAIL: the first word if: exited 0, expected 64: `.
- B6, entries not stripped: `FAIL: worker_allow entries with blanks: printed` / ` sh a.sh ` / `sh b.sh` / `sh b.sh  `.
- B7, entry characters not checked: `FAIL: worker_allow entry sh 'q': exited 0, expected 64: `.
- C1, `<&` out: `FAIL: the other redirections: printed` / `sh t.sh` / `3`.
- C2, `>|` out: `FAIL: the other redirections: printed` / `sh t.sh` / `forced.txt`.
- C3, the comment branch off: `FAIL: a comment: printed` / `sh a.sh # run it` / `tail -1`.
- C4, the backslash inside double quotes not read: `FAIL: an escaped quote inside double quotes: exited 64, expected 0: allow_list.py: the command has a quote that is not closed: grep "a\"|b" x | wc -l`.
- C5, the backslash-newline kept: `FAIL: a backslash-newline: printed` / `sh a.sh` / `expected` / `sh a.sh --flag`.
- C6, `yml` not a fence word: `FAIL: a yml fence: exited 64, expected 0: allow_list.py: <tmp>/a test root/case 45.md has no yaml block`.
- C7, the fence word's case kept: `FAIL: a YAML fence: exited 64, expected 0: allow_list.py: <tmp>/a test root/case 46.md has no yaml block`.
- C8, a newline ending a quoted word: `FAIL: a line break inside quotes: exited 64, expected 0: allow_list.py: the command has a quote that is not closed: sh a.sh 'x`.
- D, each of the 14 characters taken out of `UNRULY` (`UNRULY = set(...) - {<c>}`): `'` red at `FAIL: a pipe inside quotes: printed`; `"` and `\` red at `FAIL: a pipe inside double quotes and an escaped pipe: printed`; `$`, `[`, `]`, `,`, `*`, `?` red at `FAIL: the cut before each character: printed`; the backtick, `(`, `)`, `{`, `}` red at `FAIL: worker_allow entry sh <entry>: exited 0, expected 64: `.

`check_config.py` and the templates, test `check_config.test.sh` (S1 through `land.test.sh` in a `git init` copy):

- C1-key, the line out of `plan.yaml`: `FAIL: allow-ok: expected a pass, got: error: unknown key: worker_allow`.
- C2-default, its comment `# required.`: `FAIL: allow-default: expected a pass, got: error: required key missing: worker_allow`.
- C3-entries, the entry check off: `FAIL: allow-empty-entry: expected an error, got a pass: ok: ...`.
- C4-project, the key out of tool-a: `FAIL: projects: the example leaves worker_allow out: note: tool-a: worker_allow not set, default [] applies`.
- C5-chars, the character check off: `FAIL: allow-unruly: expected an error, got a pass: ok: ...`.
- D, each of the 14 characters taken out of `UNRULY`: each `FAIL: allow-unruly: expected an error, got a pass: ok: ...`.
- S1, the key out of the state template: `plan.projects.yaml tool-a: missing [], extra ['worker_allow']` / `FAIL: example plan.yaml files differ from the state template`.

`launch.sh`, test `launch.test.sh`:

- L1, no `--allowedTools`: `FAIL: claude without a note: calls were` (the call ends at `--output-format|json`).
- L2, the lock re-run drops `--allow-file`: `FAIL: a0: launch.sh failed`.
- L3, the detached body drops it: `FAIL: a0: launch.sh failed`.
- L4, not required: `FAIL: claude without --allow-file: exited 0, expected 64: `.
- L5, the readable-file check off: `FAIL: an allow file that does not exist: printed grep: <tmp>/a test root/no such allow list: No such file or directory`.
- L6, codex not refused: `FAIL: usage error 'codex --cwd x ... --allow-file allow-words' exited 0, expected 64`.
- L7, transcript not refused: `FAIL: usage error 'transcript --allow-file v /t' exited 0, expected 64`.
- L8, not made absolute: `FAIL: a relative allow file that does not exist, named from the caller's directory: printed .../launch.sh: --allow-file names no readable file: no such allow list`.
- L9, blank lines passed: `FAIL: claude without a note: calls were` (the call holds `Bash(:*)` and `Bash(   :*)`).
- L10, a last line without a newline dropped: `FAIL: claude without a note: calls were` (the call ends at `Bash(sh a.sh:*)`).
- L11, the usage text without the option: `FAIL: a launch with no arguments printed Usage: ... [--session-file <file>]`.
- L12, an empty value accepted: `FAIL: claude with --allow-file empty: printed .../launch.sh: --allow-file is required for claude`.
- L13, a file of blank lines accepted: `FAIL: an allow file of blank lines: exited 0, expected 64: `.
- F1, lines not stripped: `FAIL: claude without a note: calls were` (the call holds the first line with its blanks).
- F2, the character check off: `FAIL: an allow file holding sh b.sh): exited 0, expected 64: `.
- E, each of the 14 characters taken out of the `unruly` bracket expression: each `FAIL: an allow file holding sh <line>: exited 0, expected 64: ` for its own character (`sh 'q'`, `sh "q"`, `sh $X`, ``sh `x` ``, `sh a\b`, `sh (`, `sh b.sh)`, `sh {`, `sh }`, `sh [a`, `sh a]`, `sh a,b`, `sh *.sh`, `sh a?`).
- R5, the signal path's exit-file write removed (case copy): `FAIL: land sequence: no exit file`.

## Files changed (against base df3c6a7)

| File | `git diff --numstat df3c6a7` (added, removed) |
|---|---|
| `skills/plan-orchestration/templates/allow_list.py` | new, 252 lines |
| `skills/plan-orchestration/templates/allow_list.test.sh` | new, 329 lines |
| `skills/plan-orchestration/templates/launch.sh` | 713 lines after repair round 2 (numstat not rerun: round 2 runs no git command) |
| `skills/plan-orchestration/templates/launch.test.sh` | 1293 lines after repair round 2 (the same) |
| `skills/land/SKILL.md` | line 43 (repair round 2) |
| `skills/plan-orchestration/templates/launch-note.md` | lines 27-30 (repair round 2) |
| `skills/plan-orchestration/SKILL.md` | +11 -3 |
| `skills/plan/SKILL.md` | +1 -1 (line 52) |
| `skills/plan/templates/plan.yaml` | +1 |
| `skills/plan/templates/plan.projects.yaml` | +2 |
| `skills/plan/templates/orchestrator-state.md` | +2 -1 |
| `skills/ordo-init/templates/check_config.py` | +16 -1 |
| `skills/ordo-init/templates/check_config.test.sh` | +67 |
| `skills/ordo-init/SKILL.md` | +2 -1 |
| `README.md` | +2 -1 (line 96; line 111 in the Tests block) |
| `docs/dev/building.md` | +1 |
| `docs/dev/change-standard.md` | +1 |
| this report | new |

## Changes no brief item asks for

- **Exit 69** when python3 cannot import PyYAML, in `allow_list.py`. The brief says it exits 64 on its errors and 0 otherwise. `check_paths.py` and the land skill's `verify.sh` use 69 for a missing dependency, and ruling 3 keeps it.

## Judgement calls the brief left open

1. **More separators than the brief lists.** A single `&` and a newline split, since both end a simple command in `sh`; `||` and `&&` are read as two `|` or two `&`, the empty command between them dropped. A comment is removed to the end of its line. A redirection's target is removed whether attached or after a space.
2. **An unclosed quote** exits 64.
3. **`worker_allow` entries printed once**, in order, as the built list is.
4. **An empty (null) `worker_allow:` in the state file** takes the default list, as the state template's other empty keys mean their default. `check_config.py` leaves a null value without an error, as for every other key.
5. **A blank entry.** An entry or an allow-file line of blanks only counts as empty. A `\r` in an entry is refused as a second line.
6. **`$(` and a backtick inside double quotes** are refused with the grouped commands, since `sh` substitutes them there (ruling 1 names them "outside quotes"; inside single quotes they are text and stay allowed).
7. **Argument order.** `--allowedTools` arguments come after `--output-format json`.
8. **Usage text.** `--allow-file <file>` follows `[--session-file <file>]` on the claude line.
9. **`metadata.version`** of the changed skills is unchanged, as in the earlier steps that changed `plan-orchestration` (`git show` of f23d14a, 76a2b10, 3fbc652 and 6458d52 changes no version line).
10. **The resume text (ruling 6)** is written once: the bullet at `skills/plan-orchestration/SKILL.md:72` names the rule and points to item 1 of "Launching a builder" (line 175), which states it, as the skill layout's "a rule is written once" asks.

## User-visible changes

- `launch.sh claude`: before, `--allow-file` was an unknown option and the builder started with no `--allowedTools`. After, `--allow-file <file>` is required. Each line of the file that is not blank, stripped of surrounding blanks, reaches `claude` as `--allowedTools "Bash(<line>:*)"`. A launch without it, or with an empty value, a missing, unreadable or directory path, a file with no command, or a line holding a quote, `$`, a backtick, a backslash, `(`, `)`, `{`, `}`, `[`, `]`, a comma, `*` or `?`, exits 64 with the usage text before anything starts.
- `launch.sh codex` and `launch.sh transcript`: `--allow-file` refused, exit 64.
- New `allow_list.py <state file> [<command>]...`.
- New optional key `worker_allow`, default `[]`, in `.agents/plan.yaml` and the configuration block. `check_config.py` reports a value that is not a list, an entry that is not a non-empty one-line string, and an entry holding one of the characters above; a missing key gives `note: worker_allow not set, default [] applies`.
- The dispatch block gains `allow_file`; the recipe writes the allow file before a `claude -p` launch and keeps it on a resume unless `worker_allow` or the brief's check commands changed.
- `launch.test.sh`'s "land sequence" case sends TERM, then KILL two seconds later, as the land skill does (repair round 2).

## Outside the path list

The README Tests bullets for `launch.test.sh` and `allow_list.test.sh`, the verify list's new command, the brief's premise line and step 7's resume are the orchestrator's, by the round 1 rulings, and are unchanged here.

## Anything in the brief that was wrong or impossible

The brief's case for `git ls-files ... | xargs -0 perl -CSD -ne 'print if /a|b/'` expected the quoted program in the prefix; ruling 1 replaced it with `xargs -0 perl -CSD -ne`, after the orchestrator's real run showed `claude` cuts apart a rule holding the program.

## Repair round 2

All commands run from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. No git command was run.

| Item | State | Command that proves it | Output |
|---|---|---|---|
| 1. An exit file under every stop | DONE | `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1`, and the reverts R2-1 to R2-10 below | `PASS: launch.sh scratch tests`; each revert red |
| 2. The land skill waits for it | DONE | `sed -n '43p' skills/land/SKILL.md` | `- A shell builder's pid must then be gone, and its exit file present, within five seconds of the KILL, checked every tenth of a second. The builder's runner writes the exit file after its stop, which a loaded machine can stretch past the KILL.` |
| 3. The case restored and load cases added | DONE | the whole-suite counts below | tree: 0 reds in 20 one at a time and in 32 at 16 at once, under `sh` and `dash`; base df3c6a7: 32 of 32 red at 16 at once under both |
| 4. The texts made true | DONE | `grep -rn 'exit file' skills docs` | every hit read; the changed ones are listed under "Files changed in round 2" |

### What `launch.sh` does now

- The builder's runner takes the exit file's path as an argument (`runner <seconds> <watch pid> <what> <exit file> <command...>`). Note calls pass an empty one and write no exit file.
- When the runner finds its parent gone, it stops the builder and every process of the session as before, then writes `exit 137`. If it finds the builder ended and its parent gone, it writes the builder's own code.
- After a stop started by a signal, the runner writes `exit <128 plus the signal>` itself before it exits. The leader writes the same line after it. So a KILL that reaches the leader during the stop still leaves the exit file.
- The leader now sends the running process the signal it received, not always TERM. That way the runner's line and the leader's line are the same (INT gives 130 from both).
- The write goes to `<exit file>.tmp`, then `link` puts it in place. `link` never replaces a file that is already there. On a file system without hard links, the fallback is `rename`, and only when no exit file is present. Then the `.tmp` file is removed.
- A signal to the leader while the note's `end` runs, after the builder ended, writes the builder's code first and then stops `end`.
- The cause of the red under load: the runner's first process scan waited for its python3 session scanner to start. Here `python3` on PATH is a pyenv shim. At 16 suites at once it took 8 to 16 seconds to start (`stop start 1790424034.62`, `publish 143 1790424051.18` in a timing copy). The launch now resolves `python3` once to its interpreter (`sys.executable`) and passes it to the runner as `LAUNCH_PYTHON`. The builder's environment does not contain it.
- The detach step now checks for an ended process before it reads the pid file. So a body that writes its pid and exits at once counts as launched. Before, 1 whole-suite run in 32 at 16 at once was red with `FAIL: a launch with a missing --cwd failed`. The cause was a gap between the read and the check.

### Cases

- "land sequence": restored. It sends TERM, then KILL two seconds later if the pid is alive. Then `land_wait` checks every tenth of a second for up to five seconds that the pid is gone and the exit file present, as the land skill does. Then `session_gone`, which finds processes by session id with python3's `os.getsid`, requires no process of the session left. Last, `exit 143`.
- "land sequence with KILL": the same five-second `land_wait` in place of the old unbounded wait.
- "KILL to the leader alone": now requires `exit 137` and no process of the session left.
- New, "KILL to the leader alone, TERM ignored": the builder ignores TERM and has a child in a process group of its own. The case requires `exit 137`, no process left, and no session scanner started through the `python3` on PATH.
- New, "land sequence with a slow stop": for TERM and INT, a patched copy sleeps 2.5 s at the start of `stop`. The KILL at 2 s always finds the leader waiting on the runner. The case requires `exit 143` or `exit 130`.
- New, "the builder ended as the leader was killed": a patched copy delays the runner's first look by 2 s. The builder exits 3 after 1 s, and the case requires `exit 3`.
- New, "an exit file the leader wrote": a patched copy writes `exit 5` as the builder starts. After KILL to the leader, the file must still say `exit 5`.
- New, "TERM and KILL while end hangs": the builder has ended, and `end` hangs and ignores TERM. The case requires the builder's `exit 0`.
- New, "TERM and KILL while start hangs": `start` hangs and ignores TERM. The case requires no exit file and no process left.
- New, "a detached process that ends right after writing the pid file": a patched copy sleeps 0.5 s before the detach loop's ended check. The case requires the launch to succeed.
- The stub's trap child now writes its own pid after it sets its TERM handler. Before, a TERM sent before perl set the handler killed the child with nothing recorded. At 32 whole-suite runs 16 at once this failed 1 run: `FAIL: a descendant outside the builder's group: ... term.log holds , expected it to contain TERM`.
- The builder stub logs `LAUNCH_PYTHON reached the builder` when that variable is in its environment.

### Reverts and their red output

Each revert is applied to a copy of `skills/` in the session scratchpad, and the whole suite is run once (`revert.sh`).

- R2-1, `publish(137);` removed: `FAIL: KILL to the leader alone: no exit file five seconds after the KILL`.
- R2-2, `publish(128 + $got);` removed: `FAIL: land sequence with a slow stop, TERM: no exit file five seconds after the KILL`.
- R2-3, the write when the builder ended and the parent is gone removed: `FAIL: the builder ended as the leader was killed: no exit file five seconds after the KILL`.
- R2-4, the no-replace removed (no `-e` check, plain `rename`): `FAIL: an exit file the leader wrote: .../keep-exit out/exit holds exit 137, expected exit 5`.
- R2-5, note calls given the exit file: `FAIL: TERM and KILL while start hangs: the start call wrote exit 143`.
- R2-6, the leader sends TERM whatever it received: `FAIL: land sequence with a slow stop, INT: .../slow-stop-INT out/exit holds exit 143, expected exit 130`.
- R2-7, the builder's code not written before `end` is stopped: `FAIL: TERM and KILL while end hangs: no exit file five seconds after the KILL`.
- R2-8, the interpreter not resolved (`LAUNCH_PYTHON=''`), 32 whole-suite runs 16 at once: `2 FAIL: land sequence with KILL: no exit file five seconds after the KILL`, `4 FAIL: KILL to the leader alone: the builder ran on for 4 seconds`, `26 FAIL: KILL to the leader alone, TERM ignored: the scanner started through python3 on PATH` (the check that holds it red in a single run).
- R2-9, `delete $ENV{LAUNCH_PYTHON}` removed: `FAIL: claude without a note: calls were ... LAUNCH_PYTHON reached the builder`.
- R2-10, the detach loop reads the pid file before its ended check: `FAIL: a detached process that ends right after writing the pid file failed the launch`.
- The round's cases against `launch.sh` as round 1 left it, run once: `FAIL: KILL to the leader alone: no exit file five seconds after the KILL`.

### Counts

`suite_load.sh <test> <runs> <at once> <shell>` in the session scratchpad runs the whole suite through `xargs -P`, then counts the `PASS` and `FAIL` lines. The base copy of `launch.sh` and `launch.test.sh` is the file set extracted from df3c6a7 in round 1.

| Tree | Shell | 20 one at a time | 32 at 16 at once |
|---|---|---|---|
| round 2 | `sh` | 20 PASS, 0 red | 32 PASS, 0 red |
| round 2 | `dash` | 20 PASS, 0 red | 32 PASS, 0 red |
| base df3c6a7 | `sh` | 20 PASS, 0 red | 32 red, all `FAIL: land sequence with KILL: no exit file` |
| base df3c6a7 | `dash` | 19 PASS, 1 red `FAIL: land sequence with KILL: no exit file` | 32 red, all `FAIL: land sequence with KILL: no exit file` |

### Verify before you report, rerun

1. `sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`:
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
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
verify: 13 commands passed
exit 0
```
2. `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 | tail -1`: `PASS: allow_list.py scratch tests`.
3. `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1`: `PASS: launch.sh scratch tests`. With `LAUNCH_SHELL=dash`: `PASS: launch.sh scratch tests`.
4. `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`.
5. `python3 skills/plan-orchestration/templates/allow_list.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:
```
sh skills/land/templates/land.test.sh
tail -1
sh skills/ordo-init/templates/check_config.test.sh
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh skills/plan-orchestration/templates/launch.test.sh
sh skills/spec/templates/check_paths.test.sh
sh utils/pin.test.sh
sh skills/land/templates/verify.test.sh
sh utils/check_skill_layout.test.sh
sh utils/check_rule_inventory.test.sh
sh utils/check_coverage.test.sh
python3 utils/check_skill_layout.py
git ls-files -coz --exclude-standard
xargs -0 perl -CSD -ne
```
6. Each new or changed case names its revert above, with its red output.

The ASCII check (`grep -n -P '[^\x00-\x7F]'` over the round's five files) printed nothing, exit 1. No added `.sh` line is over 100 characters: an awk check against the base copies printed nothing.

### Files changed in round 2

| File | Lines now | What |
|---|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 713 | The runner writes the exit file, the signal is passed on as it came, the builder's code is written before `end` is stopped, the interpreter is resolved once, the detach order is fixed. The head comment's Body paragraph and the runner comment are rewritten. |
| `skills/plan-orchestration/templates/launch.test.sh` | 1293 | The cases above, the helpers `session_gone` and `land_wait`, the `python3` wrapper, the stub changes, and the header list. |
| `skills/land/SKILL.md` | 135 | Line 43: the five-second wait. |
| `skills/plan-orchestration/SKILL.md` | 286 | Line 106 ("five seconds later"). Item 5's two sub-bullets (lines 190-191). The KILL bullet split into three (lines 205-207). |
| `skills/plan-orchestration/templates/launch-note.md` | 31 | `end`: a new line for a signal while `end` runs (line 28). Line 30 now says the runner still writes the exit file after a KILL. Found by the `exit file` grep. |
| this report | | This section. It also updates the first line, round 1's row 5, the user-visible-changes line on "land sequence", and the `launch.sh` rows of the file table. |

### Judgement calls in round 2

1. **Beyond the ruling's literal text.** Three changes go past what the ruling states, because without each one a TERM followed by KILL could still leave no exit file:
   - the runner also writes after a stop started by a signal;
   - the leader passes on the signal it received;
   - the leader writes the builder's code before it stops a running `end`.
2. **A note call writes no exit file, as ruled.** A KILL while `start` runs therefore leaves none. The case "TERM and KILL while start hangs" pins this, and `SKILL.md` item 5 says so. No builder has run at that point.
3. **Two defects the load runs exposed, fixed:**
   - the detach race in `launch.sh`;
   - the trap child's handler race in the test stub.
4. **`README.md`'s Tests bullet for `launch.test.sh` is unchanged.** It is the orchestrator's. It does not mention the new cases.
