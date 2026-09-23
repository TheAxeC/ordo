# Step 1 refuter

## Verification lines

Run from `.agents/worktrees/2a-1` with `PYTHONDONTWRITEBYTECODE=1`, HEAD b04cb18; `git status --short` shows `?? docs/launch-note.md` and `?? skills/plan-orchestration/templates/`.

```
PASS: launch.sh scratch tests
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ten ok: lines, layout exit 0
ascii exit 0 (no lines printed)
```

## Spec

1. `launch.sh:93-96, 121`: the claude recipe's `cd` runs in a subshell, so a relative exit file lands in the caller's directory instead of the builder's working directory as in the SKILL.md recipe.
2. `launch.sh:139-142`: `transcript` with an empty `--note` (the key's default) is a usage error, exit 64, where the launch modes treat an empty note as none.
3. `docs/launch-note.md:9`, "A call that fails is ignored": `transcript` passes the note's exit status and stderr through.
4. `docs/launch-note.md:3`: the page does not say the plan skills name no project or path.
5. `launch.sh:32-68, 125-134`: the launch modes accept a stray positional argument and codex-only options silently; the usage line lists `--events` and `--effort` as optional for both modes although codex requires them.

## Proof

Planted in a copy of `launch.sh` under the reviewer's scratch directory; the test stays green on each:

1. A `start` that prints an id and exits non-zero never runs (the failing stub exits before printing); removing `|| : >"$opt_id"` passes.
2. An empty id line is never exercised; `[ -n "$note_id" ]` replaced by `:` passes.
3. The stderr redirections are never checked; `2>/dev/null` in either branch passes.
4. "Returns at once" is never checked; `; wait` after the pid line passes, and so does removing `nohup`.
5. No path contains a space; unquoted `"$opt_cwd"` passes with the default TMPDIR.
6. `head -n 1` replaced by `cat` passes; no `start` prints two lines.
7. The report names one revert for the whole test, not one per case (change standard rule 13).
8. The report lacks the changed files with their line counts (rule 7) and paraphrases the verify list's output.

## Standards

1. `launch.test.sh:88-124`: prefix assignments before a function call (`STUB_EXIT=3 run a0 claude`) are not exported to its children under POSIX; `ksh launch.test.sh` fails.
2. `launch.test.sh:56`: `sleep 0.1` is not POSIX.
3. `docs/launch-note.md:13, 20, 25`: three entries open with the same passive "Made by ...".
4. `docs/launch-note.md`: two semicolons in 340 words, over the prose standard's rate.
5. `launch.sh:1-6, 13-14`: the head comment and usage do not mention the internal `_body_` modes.

## Behaviour

1. No user-visible change today; nothing calls `launch.sh` yet. Step 3 would expose Spec 1 and Spec 2. The detached process's output goes to `/dev/null`, where the recipe's bare `nohup` leaves it to nohup's default.

## Not checked

The real `claude` and `codex` binaries; Linux; killing the pid-file process; two launches sharing files; a `start` that hangs.

## Usage

85,757 tokens, 20 tool uses, 295 s.

## Repair round 1, refuted

HEAD b04cb18; the delta is each file against its `-round1-start` copy.

### Verification lines

```
PASS: launch.sh scratch tests
eight PASS: lines of the verify list, ten ok: lines of the layout check, layout exit 0, ascii exit 0 (no lines printed)
```

### Closures

Spec 1 to 5 closed (Spec 1 with the relative note command below); Proof 1 to 6 and 8 closed; Proof 7 partly closed; Standards 1 not closed (a new cause); Standards 2, 4, 5 closed; Standards 3 not closed in substance; Behaviour 1 stated as a decision.

### Spec

1. `launch.sh:118, 145`: with the `cd` in the detached shell, a relative `--note` resolves for `start` but not for `end`, so a claude-mode launch with a relative note command never closes its record; nothing rejects a relative note.
2. `launch.sh:165-169`: `transcript` no longer requires `--id` with `--note`, and accepts the launch options; `transcript --note <cmd> /t` and `transcript /t` exit 0.
3. `docs/launch-note.md:15`: "keeps the output in the step's id file, beside the pid file"; the script writes wherever `--id` names.

### Proof

1. Removing the absolute conversion of `--id` leaves the test green.
2. Writing the exit file before `end` leaves the test green, against doc line 25.
3. Removing the `--parent` or `--label` requirement leaves the test green.
4. No case uses a relative `--note`.
5. The plants table quotes one truncated line per plant, not the failing output.

### Standards

1. `launch.test.sh:188-193`: the unquoted `|` in `${case_%%|*}` is alternation under ksh93; the test fails there, and passes with it quoted.
2. `launch.test.sh:82`: the comment names `launch`, the function is `launch_into`.
3. `docs/launch-note.md`: the three entries repeat "<actor> calls it ..." then "The command <verb>s ...".

### Behaviour

1. With a relative `launch_note`, every claude-mode record stays open (Spec 1).

### Not checked

The real binaries, Linux, killing the pid-file process, shared files, a hanging `start`, and the plants not rerun.

### Usage

89,827 tokens, 20 tool uses, 503 s.

## Closed

- First run, every finding: closed in repair round 1 (see `1-report.md`, "Repair round 1").
- Run over the round, fixed at landing:
  - Spec 1 and Behaviour 1: `launch.sh` refuses a relative `--note` in every mode (exit 64); the test's usage loop covers it.
  - Spec 2: `transcript` requires `--id` with `--note` and refuses the launch options.
  - Spec 3: the page says the note's output goes to the file given as `--id`.
  - Proof 1 to 4: the test covers a relative `--id` reaching `end`, `end` running before the exit file is written (the note stub logs an exit file that already exists), and a missing `--label` or `--parent`.
  - Proof 5: `1-plants.md` holds each plant's full failing output.
  - Standards 1: the `|` in the case patterns is quoted.
  - Standards 2: the comment names `launch_into`.
  - Standards 3: the page's three entries use different constructions.
