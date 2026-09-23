# Step 2 refuter

## Verification lines

Run from `.agents/worktrees/2a-2` (HEAD b6e4ba5) with `PYTHONDONTWRITEBYTECODE=1`: eight `PASS:` lines of the verify list, ten `ok:` lines from the layout check, layout exit 0, ascii exit 0 (no output lines), and `PASS: launch.sh scratch tests`. `git status --short`: the 8 modified files only; `git diff --stat b6e4ba5`: 8 files changed, 40 insertions(+), 2 deletions(-).

## Spec

1. `skills/ordo-init/SKILL.md:80`: the list of what `check_config.py` reports omits the new launch_note errors.
2. `skills/ordo-init/templates/check_config.py:7-10`: the docstring's list of errors omits them too.
3. `docs/launch-note.md:5`: names only `launch.sh` as refusing a relative path, not `check_config.py`.
4. `skills/plan/templates/plan.yaml:23`, `orchestrator-state.md:23`: "(docs/launch-note.md)" points at a page that is not installed with the skills (`utils/pin.sh` links only folders under `skills/`), so in a user repository it names a missing page; the brief dictated the wording.
5. The tree-wide grep for key lists finds no other list missing `launch_note`.

## Proof

1. Planted in scratch copies, `check_config.test.sh` stays green with: `{prefix}` dropped from an error (the projects form with the key set is never exercised); `isfile` changed to `exists` (no directory case); `note.strip()` or skipping `~` paths (no whitespace or `~` case); the key skipped for projects.
2. The report's five plants were not rerun; its verify output reproduces.
3. The report does not quote the rule-14 grep.

## Standards

1. The report lacks the files with line counts, the user-visible changes with before and after, and the judgment calls (rule 7).
2. `check_config.py:73-74`: a directory is reported as "a file that does not exist".

## Behaviour

1. A configuration without the key now prints `note: launch_note not set, default '' applies`; the report does not say so.
2. `check_config.py` now exits 1 on a relative, `~`, whitespace-only, missing, directory or non-executable launch_note; a symlink to an executable passes; a null value passes; the report states none of this.

## Not checked

The five plants rerun individually; `/plan` and `/ordo-init` run as skills; a wrong default in `plan.projects.yaml` alone; running as root.

## Usage

81,975 tokens, 16 tool uses, 222 s.

## Repair round 1, refuted

HEAD b6e4ba5; `git diff -M --stat b6e4ba5`: 10 files changed, 64 insertions(+), 8 deletions(-).

### Verification lines

Eight `PASS:` lines of the verify list, ten `ok:` lines of the layout check, layout exit 0, ascii exit 0 (no lines), `PASS: launch.sh scratch tests`.

### Closures

Spec 1, 2 and 4 closed; Spec 3 closed in substance with a garbled sentence (Standards 1); Proof 1 partly closed (Proof 1 below); Proof 2 and 3, Standards 1 and 2 closed; Behaviour 1 and 2 stated, one claim not reproducing in full (Behaviour 2 below).

### Spec

1. The move of step 1's page and the rewrite of the brief's dictated comment are substitutes the orchestrator rules on (change standard rule 4); the report lists them as a judgment call while saying everything in the brief is done. `plan.md:15, 41` and the brief still name `docs/launch-note.md`.
2. The rename is staged in the worktree's index (`RM`), against the change standard's "a file is moved with `mv`".

### Proof

1. `{prefix}` removed from the directory, missing-file and not-executable errors leaves the test green; only the relative-path error is exercised in the projects form.
2. No check confirms the moved page exists where the pointers name it (an audit gap only).

### Standards

1. `launch-note.md:3`: "that follows the interface below" now attaches to "a relative one".
2. `check_config.test.sh:78-79`: the comment names three cases; the cases now include a directory, `~`, whitespace and the projects form.
3. `launch.sh:9` is 113 characters; the rest of the header wraps at about 100.

### Behaviour

1. The directory, missing-file and not-executable errors print the value unquoted, so a trailing space is invisible: `launch_note names a file that does not exist: <dir>/rec` for an existing `<dir>/rec`.
2. The report's "the base script prints" names two notes; the base script prints ten notes, then `ok:`.

### Not checked

`/plan` and `/ordo-init` run as skills; `utils/pin.sh <tag>` run; the checker as root; the builder's `land.test.sh` plants individually.

### Usage

96,421 tokens, 27 tool uses, 266 s.

## Closed

- First run, every finding: closed in repair round 1 (see `2-report.md`, "Repair round 1").
- Run over the round, fixed or ruled at landing:
  - Spec 1: the orchestrator accepts both substitutes. The page lives beside `launch.sh` in the plan-orchestration skill's templates, since an installed skill carries its templates and not the repository's `docs/`, so the key's comments name that path. `plan.md` step 1's text and booking now name the new path.
  - Spec 2: the cherry-pick onto main stages the rename; `git status --short` on main shows `R  docs/launch-note.md -> skills/plan-orchestration/templates/launch-note.md`.
  - Proof 1: `check_config.test.sh` has projects cases for the directory, missing-file and not-executable errors; removing `{prefix}` from each of the three turns it red.
  - Proof 2: `git grep -n docs/launch-note -- ':!.scratch'` prints nothing, and `skills/plan-orchestration/templates/launch-note.md` exists.
  - Standards 1: `launch-note.md` line 3 splits into two sentences; "that follows the interface below" qualifies the command.
  - Standards 2: the test comment names every case, the projects form included.
  - Standards 3: `launch.sh` lines 9 to 11 wrap under 100 characters.
  - Behaviour 1: all four errors print the value with `{note!r}`; unquoting any one of the three turns the test red.
  - Behaviour 2: `2-report.md` quotes the base script's ten `note:` lines and the new one's eleven.
