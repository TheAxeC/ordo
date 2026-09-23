# Step 4 refuter report (on .agents/worktrees/2a-4, base 2764bb9)

## Verification lines

Rerun from the worktree root: the state file's eight tests and `launch.test.sh` each print their `PASS:` line; ten `ok:` lines of the layout check (exit 0); the ASCII check empty (exit 0). `git diff 2764bb9 --stat`: 3 files changed, 4 insertions(+). The three lists name the same nine tests in the same order (`README.md:105-113`, `docs/dev/building.md:6-14`, `docs/dev/change-standard.md:42-50`), and the repository holds nine `*.test.sh` files. No other list of the tests exists outside the ledger's `verify:` block, which the brief defers to landing.

## Spec

none

## Proof

1. `README.md:120`: "runs each recipe with its exact arguments and keeps the builder's exit code, with no note, an empty note and a note". No codex launch has `--note ''`, and case a1 (`launch.test.sh:236-241`) checks no exit file. The sentence comes from the test's head comment (`launch.test.sh:3`), which is false for codex in the same way.
2. `README.md:120`: "each usage error". The usage loop (`launch.test.sh:328-339`) asserts only exit 64, and several `fail_usage` calls are never reached: `--effort is required for codex` (:112), `--events is for codex only` (:115), `--network is not a transcript option` (:206), `--<x> is not a transcript option` for all but `--cwd` and `--resume` (:204), `--<x> is required` for all but `--model` (:107).
3. `4-report.md`, Verification: the grep output and the verify list's output are paraphrased and counted, not quoted.
4. `4-report.md`, DONE rows 1 to 3: no command with its output.

## Standards

1. `README.md:120` repeats the false sentence of `launch.test.sh:2-3` without correcting either copy (change standard rule 14; prose standard, a violation quoted from elsewhere is fixed at its source).

## Behaviour

none

## Not checked

- The verify list on main after landing and the state file's `verify:` block.
- A prose pass over `README.md` beyond the added bullet; its first sentence runs about 45 words.

## Usage

91,433 tokens, 17 tool uses, 230 s.

## Repair round 1, refuted

### Verification lines

Eight `PASS:` lines of the verify list, ten `ok:` lines of the layout check (exit 0), the ASCII check empty (exit 0), `PASS: launch.sh scratch tests`; `git diff --stat 2764bb9`: 4 files changed, 45 insertions(+), 25 deletions(-). The three lists name nine tests in the same order. Plants 1, 3 and 10 reproduce; a codex empty note that writes the id file turns case c5 red.

### Spec

none

### Proof

1. `launch.test.sh`: the round removed the three `resume_error` cases (`--resume ''`, `--resume --last`, bare `--resume`) and replaced none of them, so `launch.sh:72` (`'' | -*) fail_usage "--resume needs a session id, not ..."`) is no longer reached: accepting both values, or changing either message, leaves the test green. Plants 11 and 19 of `3-plants.md`, booked in step 3, now stay green.
2. `launch.test.sh`: "a launch with no arguments prints the usage text alone" is checked by the substring `Usage:`, which every usage error prints; `[ "$#" -ge 1 ] || fail_usage "spurious"` stays green.
3. `4-report.md`, Repair round 1: "every `fail_usage` call" does not hold for `launch.sh:72` or the `--resume` form of `launch.sh:52`.

### Standards

1. `README.md:120` and `launch.test.sh:9`: "every usage error with its message" is false while the resume errors are not exercised (change standard rule 14).

### Behaviour

none

### Not checked

- The state file's `verify:` block and the verify list on main.
- Plants 2 and 4 to 9 of `4-plants.md`.

### Usage

95,754 tokens, 25 tool uses, 808 s.

## Closed

- First run, every finding: closed in repair round 1 (see `4-report.md`, "Repair round 1").
- Run over the round, fixed at landing:
  - Proof 1 and 3, Standards 1: `launch.test.sh` checks `--resume` with no value, `--resume --last` and `--resume ''`, each with exit 64 and its message; plants 11, 19, 20 and 21 of `4-plants.md` (landing section) turn it red, so step 3's plants 11 and 19 are red again and "every usage error with its message" holds.
  - Proof 2: a launch with no arguments must print output that starts with `Usage:`; plant 22 (an error printed before the usage text) turns it red.
