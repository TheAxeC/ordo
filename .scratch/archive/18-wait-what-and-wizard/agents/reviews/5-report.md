Everything in the brief is done.

## Open items of the state file, verbatim

- none

## The cases' first run, on the unchanged tree (base a1b314d)

Each of the four test functions was written first and run once with `skills/code/wizard/templates/template.sh` unchanged (`git diff --stat a1b314d -- skills/code/wizard/templates/template.sh` printed nothing). Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1`, exit 1. No case was wrong by the brief's rules.

- test, `version_at_least`, equal and later, and test, `version_at_least`, leading zeros (one function, `case_version_equal_and_later`). Failed:

```
FAIL: version_at_least, equal and later: 3.28 3.28 did not succeed; expected "at least 2: [3.28] [3.28]" in: 
> Stage 1/1: Versions that are the minimum or later
before 2: [3.28] [3.28]
before 2: [3.28.0] [3.28]
before 2: [3.28] [3.28.0]
before 2: [4.0.1] [3.28]
before 2: [3.30] [3.28]
before 2: [24.04] [24.4]
before 2: [1.09] [1.8]
before 2: [1.010] [1.9]

  ok Setup complete
```

- test, `version_at_least`, earlier (`case_version_earlier`). Failed on the assertion that the calls print nothing:

```
FAIL: version_at_least, earlier; version_at_least printed: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/version-earlier.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/version-earlier.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/version-earlier.sh: line 268: version_at_least: command not found
```

- test, `version_at_least`, not a version (`case_not_a_version`). Failed on the assertion that the calls print nothing:

```
FAIL: version_at_least, not a version; version_at_least printed: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/not-a-version.sh: line 268: version_at_least: command not found
```

- test, `by_hand` (`case_by_hand`). Failed:

```
FAIL: by_hand: the script exited 127: 
> Stage 1/2: A stage that lacks its tool
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.zFJnDc/by-hand.sh: line 269: by_hand: command not found
```

- The last line of that run: `FAIL: template.sh scratch tests, of 12 cases these failed: case_version_equal_and_later case_version_earlier case_not_a_version case_by_hand`.
- run, `shellcheck`: `shellcheck -f gcc skills/code/wizard/templates/template.sh` on the unchanged tree, exit 1:

```
skills/code/wizard/templates/template.sh:105:1: note: This function is never invoked. Check usage (or ignored if invoked indirectly). [SC2329]
skills/code/wizard/templates/template.sh:134:36: error: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet). [SC1087]
skills/code/wizard/templates/template.sh:189:1: note: This function is never invoked. Check usage (or ignored if invoked indirectly). [SC2329]
skills/code/wizard/templates/template.sh:215:1: note: This function is never invoked. Check usage (or ignored if invoked indirectly). [SC2329]
skills/code/wizard/templates/template.sh:225:1: note: This function is never invoked. Check usage (or ignored if invoked indirectly). [SC2329]
```

- run, `bash -n skills/code/wizard/templates/template.sh`: printed nothing, exit 0 (`bash` is `/bin/bash`, GNU bash 3.2.57).
- run, `git diff a1b314d -- skills/code/wizard/templates/template.sh`: printed nothing, exit 0.
- run, the existing eight cases: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1` on the unchanged tree printed `ok:` for `case_yes`, `case_no`, `case_end_of_input`, `case_failing_command`, `case_no_command`, `case_one_word`, `case_have` and `case_wizard_os`, then `PASS: template.sh scratch tests, 8 cases`, exit 0. In the run with the four new functions the same eight lines `ok:` stand above the four failures.
- read, `SKILL.md` against 3.1 to 3.8, on the unchanged tree: no bullet on `pause` at a stage's end (3.1), on a tool an earlier stage installs (3.2), on `bash -c` (3.3) or on a minimum version (3.5); line 63 skips the whole stage (3.4); Steps 6 names `shellcheck` with no result and its "Done when" leaves it out (3.6); neither list names the two helpers (3.7); `metadata.version` is `1.0.0` (3.8).
- read, the head comment against 1.4 and 1.5, on the unchanged tree: it names neither helper (`grep -n 'version_at_least\|by_hand' skills/code/wizard/templates/template.sh` printed nothing).
- read, a shipped file names nothing private: the unchanged template's one example is the public API-keys page of Stripe's dashboard, which `SKILL.md`, "The template", says is made up around that public page.

## DONE / NOT DONE

| Item | State | Check and output |
|---|---|---|
| 1.1 functions unchanged but for 1.2 and 1.3; `SKIPPED` comment; additions between `run_cmd` and `finish` | DONE | `git diff a1b314d -- skills/code/wizard/templates/template.sh \| grep '^@@'` prints 8 hunks: `@@ -1,4 +1,5 @@`, `@@ -12,7 +13,9 @@`, `@@ -20,8 +23,10 @@` (head comment), `@@ -46,7 +51,7 @@` (line 49), `@@ -61,9 +66,9 @@` (lines 64 to 66), `@@ -131,7 +136,7 @@` (line 134), `@@ -243,6 +248,41 @@` (the added block), `@@ -281,6 +321,7 @@` (the `pause`) |
| 1.2 `ask` braced | DONE | the line reads `p+="$s$DIM${e}[Enter keeps current]$s$RESET$e "`; shellcheck below |
| 1.3 `banner` text | DONE | read: "This wizard tells you what to do, runs each command only after you have / confirmed it, and keeps the values you copy back. Stop any time with Ctrl-C / and re-run later, since it remembers values already saved." |
| 1.4 `version_at_least` | DONE | the three test functions below; beside them, `/bin/bash` under `set -euo pipefail` with the function alone printed `none: fails`, `v3.28: fails`, `rc: fails` (for `3.28-rc1`), `.5: fails`, `010>=9`, `went on` |
| 1.5 `by_hand` | DONE | `case_by_hand` below, with the call with no text and with an empty text, each exit 2 |
| 1.6 directive; shellcheck clean | DONE | `shellcheck skills/code/wizard/templates/template.sh` printed nothing, exit 0 |
| 1.7 head comment | DONE | read: two input lines, two warning lines, the "still to do by hand:" line and the exit status sentence name the helpers |
| 1.8 example `pause` | DONE | `diff` of the lines from `run_wizard() {` to the end against the base prints `18d17` and `< pause` only |
| 2 the test | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 \| tail -1` prints `PASS: template.sh scratch tests, 12 cases`; unfiltered, 12 lines `ok:`, the eight existing names and `case_version_equal_and_later`, `case_version_earlier`, `case_not_a_version`, `case_by_hand`, exit 0 |
| 3.1 to 3.8 `SKILL.md` | DONE | read; `git diff --numstat a1b314d -- skills/code/wizard/SKILL.md` prints 15 added and 5 removed; `metadata.version` unchanged; description unchanged |
| 4.1 listings | DONE | `git diff a1b314d -- docs` shows line 19 of `docs/dev/building.md` and line 51 of `docs/dev/scripts.md` only |
| Verify 1, character set | DONE | the brief's `printf ... \| xargs -0 perl ...` command over the five files printed nothing, exit 0 |
| Verify 3 | DONE | `bash -n skills/code/wizard/templates/template.sh` printed nothing, exit 0 |
| Verify 4 | DONE | the brief's `python3 -c` command printed `987` |
| Verify 5 | DONE | new tests: the failures quoted above, then the pass; the existing eight: pass before and after. None of the new cases is an audit |
| Verify 6 | DONE | see "Judgment calls", the last item |
| `git status --short` | DONE | ` M docs/dev/building.md`, ` M docs/dev/scripts.md`, ` M skills/code/wizard/SKILL.md`, ` M skills/code/wizard/templates/template.sh`, ` M skills/code/wizard/templates/template.test.sh`, and this report |

Behaviours whose failure costs something, each with its case and its failing line on the unchanged tree:

| Behaviour | Case | Failing line |
|---|---|---|
| An equal or later version succeeds, leading zeros included | `case_version_equal_and_later` | `FAIL: version_at_least, equal and later: 3.28 3.28 did not succeed; expected "at least 2: [3.28] [3.28]" in:` |
| An earlier version fails and prints nothing | `case_version_earlier` | `FAIL: version_at_least, earlier; version_at_least printed:` followed by `version_at_least: command not found` |
| Text that is no version fails, prints nothing, the script goes on | `case_not_a_version` | `FAIL: version_at_least, not a version; version_at_least printed:` followed by `version_at_least: command not found` |
| `by_hand` records its text and the script goes on; no text ends the script with 2 | `case_by_hand` | `FAIL: by_hand: the script exited 127:` |

What the green test does not cover: `version_at_least` with no argument at all, `v3.28`, `3.28-rc1` and `.5`, which the run quoted in row 1.4 checked once; a number too large for bash's arithmetic.

Change standard rule 14, the grep: `grep -rn 'version_at_least\|by_hand' skills utils docs README.md` outside `skills/code/wizard/templates/` hits `SKILL.md` lines 42, 55, 64, 65, 68, 69 and 93 (the ADR 0046 text names the helpers by what they do). `grep -rn 'run_cmd\|WIZARD_OS\|drive the browser\|8 cases' skills utils docs README.md` outside `skills/code/wizard/` printed nothing but the two listing lines, both changed. Sentences about a file as a whole, reread: the test's line 2 (names five helpers; the `for` list holds 12 names), the test's line 3 (now also names the cost of the `by_hand` case), the test's last head line "starts no installer, contacts no network and writes only under its scratch folder" (the new scratch scripts write only under `$T`), and the template's "Everything above the STAGES marker is the wizard library" (the additions stand above it).

## Terms

- The diff adds or changes no glossary entry.
- `pause`: used in `SKILL.md` Steps 5 only in code form, as the library helper's name, as line 55 already does; the glossary's **pause** (a halt of the loop) is not meant and the code form keeps them apart.
- `stage`, `check`, `command`: used as `SKILL.md` already uses them; none is a glossary term in that sense.
- "finding" is not used for a line `shellcheck` prints; the bullet says "each line `shellcheck` prints".
- "part", in the template's comment and the test's head comment, is a number between two dots of a version, the brief's own word in 1.4; the glossary's entries are **part, of an entry** and **part, of an output**, each qualified, and `SKILL.md` does not use the word in the new text except "part of the check" in its plain sense.

## Files, with line counts (`wc -l`)

- `skills/code/wizard/SKILL.md`: 123
- `skills/code/wizard/templates/template.sh`: 330
- `skills/code/wizard/templates/template.test.sh`: 382
- `docs/dev/building.md`: 42 (line 19 changed)
- `docs/dev/scripts.md`: 51 (line 51 changed)
- `.scratch/18-wait-what-and-wizard/agents/reviews/5-report.md`: this report

## Judgment calls the brief left open

1. `case_by_hand` also asserts 1.5's call with no text and with an empty text (status 2, no later stage, a warning that names `by_hand`), inside the one function, so the count stays 12. Change standard rule 13 asks a case for each added behaviour whose failure costs something, and an empty variable given to `by_hand` would list a blank entry.
2. The test's head comment line 3, a sentence about every case, gained "or reports a setup as complete with a stage of it undone": without it the sentence is false for the `by_hand` case (change standard rule 14).
3. The warning of `by_hand` with no text reads `no text given to by_hand`, after `no command given to run_cmd`.
4. The 3.1 bullet names `finish` beside the next `stage` as what clears the screen, since the last stage's output is cleared by `finish`, which 1.8's `pause` answers.
5. The test's scratch scripts share one function, `compare`, written by a helper `build_compare`, which sends what `version_at_least` itself prints to a file the test asserts is empty.
6. 3.5 and 3.2 are three bullets each and 3.3 two, one requirement per bullet; 3.4 is one bullet, as the brief asks, with its qualifier after a colon.
7. Sentence length and list items (Verify 6): the new bullets of Steps 5 on `version_at_least`, on `by_hand` with a missing tool, on `bash -c` and on `say`, the rewritten line 63, the Steps 1 bullet and the "The template" bullet run past 20 words. Each holds one rule with the reason or the qualifier that changes it, which the skill layout keeps in the rule's bullet. The `by_hand` bullet "call `by_hand` ..., run none of the stage's commands and read none of its values" joins three acts of one branch; they are kept together because each alone would leave the branch half stated. The comments added to the template are hard-wrapped, in the style of the library comments around them, as 1.1 asks.

## Host- and user-visible changes

- The opening screen. Before: "You drive the browser; this wizard tells you exactly what to do and captures the values you copy back. Stop any time with Ctrl-C and re-run later, since it remembers values already saved." After: "This wizard tells you what to do, runs each command only after you have confirmed it, and keeps the values you copy back. Stop any time with Ctrl-C and re-run later, since it remembers values already saved."
- Two new helpers for a script's stages. Before: none. After: `version_at_least CURRENT MINIMUM` and `by_hand TEXT`, with the warnings `left to do by hand: <text>` and `no text given to by_hand` and exit status 2 for the second.
- `shellcheck` on the template. Before: exit 1, SC1087 once and SC2329 four times. After: prints nothing, exit 0.
- The example stage. Before: no `pause` before `finish`. After: a `pause` after `set_secret`.
- `SKILL.md`: Steps 1 names the version check; Steps 5 has the bullets of 3.1 to 3.5 and the two helpers in its list; Steps 6 has `shellcheck` printing nothing in a bullet and in its "Done when"; "The template" names the two helpers.
- `docs/dev/building.md` line 19 and `docs/dev/scripts.md` line 51 name the two helpers.

## Anything in the brief that was wrong or impossible

Nothing.

## Repair round 1

Nothing of the round is left undone.

1. The `say` line's quoting: closed. `skills/code/wizard/SKILL.md`, Steps 5, a new bullet after the bullet on `say`: "Give `say` the same line in single quotes, so that bash expands nothing in it and the person reads the line that will run."
2. Two bullets holding several requirements: closed.
   - The check and the values are two bullets: "Skip the commands of a stage that is already done, and their instructions, by its check, which stands in the condition of an `if` and is not a command of the stage." and "Ask for and write each value the stage reads outside that `if`, so that it is read whether or not the check skipped the commands."
   - The missing tool is three bullets: "When that tool is missing, call `by_hand` with what is left and the stage to run first.", "When that tool is missing, run none of the stage's commands." and "When that tool is missing, read none of the stage's values, since a value that depends on the tool is not known yet."
   - Read against each other: the bullet on values speaks of the check skipping the commands, the bullet on a missing tool of the tool being absent, and no third bullet restates either.
3. `skills/code/wizard/templates/template.sh` line 17: closed. The clause is dropped, and the line reads "#   - the two versions a stage passes to version_at_least, the installed one and the minimum;". The function's own comment says it: `grep -n 'prints nothing' skills/code/wizard/templates/template.sh` prints line 252, "# version MINIMUM or a later one, and prints nothing. Each is numbers joined by".

The checks, rerun after the round:

- `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1` printed `PASS: template.sh scratch tests, 12 cases`.
- The brief's character-set command over the five files printed nothing, exit 0.
- `shellcheck skills/code/wizard/templates/template.sh` printed nothing, exit 0.
- `bash -n skills/code/wizard/templates/template.sh` printed nothing, exit 0.
- The brief's `python3 -c` command printed `987`.
- `git diff a1b314d -- skills/code/wizard/templates/template.sh | grep '^@@'` printed the same eight hunks as before the round.
- `wc -l`: `skills/code/wizard/SKILL.md` 127, `skills/code/wizard/templates/template.sh` 330. The test file was not changed in the round, so Verify 5 has no new run.
- Verify 6: the five new bullets are one sentence and one requirement each; the bullet on values outside the `if` runs past 20 words with its reason.
