# Step 1 report: the launch script, its test, and the launch-note interface

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | `skills/plan-orchestration/templates/launch.sh` (184 lines): the `claude` and `codex` modes start the recipes detached and return at once with the pid file; with `--note` absent or empty the builder gets the recipe's exact arguments, redirections and working directory and no note call happens; with `--note` set, `start` before, `end <id>` after only when `start` gave an id (first line, non-empty, zero exit), the exit code in the exit file in every case; the `transcript` mode, a no-op with an empty note and silent when the note fails; usage errors exit 64 | DONE | the test and the plants below |
| 2 | `skills/plan-orchestration/templates/launch.test.sh` (256 lines), stub `claude`, `codex` and note commands, every path with a space | DONE | `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1` prints `PASS: launch.sh scratch tests` |
| 3 | `docs/launch-note.md` (26 lines): the purpose, the plan skills naming no tool or path, return at once, the three calls with their arguments and output, a failed or empty `start` means no record | DONE | the file |
| 4 | The recipes in `skills/plan-orchestration/SKILL.md` not edited | DONE | `git status --short` shows only `docs/launch-note.md` and `skills/plan-orchestration/templates/` |
| 5 | The verify list | DONE | output below, exit 0 |

Each case of the test and the fault planted in a copy of `launch.sh` that turns it red, with the full failing output, are in `1-plants.md`: 29 plants, every one exit 1.

The verify list's output:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
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
```

Decisions taken in the build:

- The detached process is `launch.sh` itself, re-invoked under `nohup` in an internal `_body_<harness>` mode, so its own pid is both the pid file's value and the `--pid` passed to `start`.
- The claude recipe's `cd` runs in the detached shell, so relative paths, the exit file included, resolve from the builder's working directory as in the recipe; the id file is made absolute before the `cd`.
- The Codex recipe's network setting is the `--network` flag, since the recipe passes it only when the verification commands bind a port.
- The detached process's own output goes to `/dev/null`, so no `nohup.out` is written in the caller's directory; the builder's output goes where the recipe sends it.
- The scripts are not executable, like the other templates, and are run with `sh`.

## Repair round 1

Each finding of `1-refuter.md`, and the change that closes it:

- Spec 1: the claude branch changes directory in the detached shell; the relative-exit-file case of the test.
- Spec 2: `transcript` with an empty note does nothing and exits 0.
- Spec 3: a failing `transcript` call is ignored, output included.
- Spec 4: the page says the plan skills name no tool and no path.
- Spec 5: a stray argument and the codex-only options in claude mode are usage errors; the usage lines give each mode its own options.
- Proof 1 to 6: the test covers `start` printing then failing, an empty id line, two id lines, both stderr files and the event log, a launch returning before its builder and surviving a hangup, and paths with spaces; each has its plant above.
- Proof 7 and 8: the plants table above, the line counts in the DONE table, and the verify list's output verbatim.
- Standards 1: the stub settings are exported by a function before each launch, with no prefix assignment on a function call.
- Standards 2: the wait sleeps whole seconds.
- Standards 3 and 4: the page's entries name their actor, and it has no semicolon.
- Standards 5: the head comment describes the internal modes.
- Behaviour 1: the detached process's output going to `/dev/null` is a stated decision above.
