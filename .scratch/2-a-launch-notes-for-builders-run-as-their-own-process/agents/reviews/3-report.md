# Step 3 report

Built inline in `.agents/worktrees/2a-3` from base 28959e9, with repair round 1 worked inline.

Open items in the state file: none.

Everything in the brief is done.

`git diff 28959e9 --stat`:

```text
 skills/plan-orchestration/SKILL.md                 | 44 +++++++---
 skills/plan-orchestration/templates/launch-note.md |  2 +-
 skills/plan-orchestration/templates/launch.sh      | 60 ++++++++++----
 skills/plan-orchestration/templates/launch.test.sh | 96 +++++++++++++++++++++-
 skills/plan/templates/orchestrator-state.md        |  2 +-
 5 files changed, 169 insertions(+), 35 deletions(-)
```

| # | Item | Done | Proof |
|---|---|---|---|
| 1 | The two shell recipes call `launch.sh` | DONE | `skills/plan-orchestration/SKILL.md`, "Launching a builder": two `sh <this skill's folder>/templates/launch.sh` blocks, `claude` and `codex`, with every option the script takes; the codex bullets say what the script runs (`-C`, `-s`, `-o`, `--json`, the rollout, the detached launch). |
| 2 | A numbered list for a shell launch | DONE | Same section, items 1 to 4: the launch (with the note options when `launch_note` is set), the identity in the dispatch block, the transcript call through `launch.sh transcript` with where each harness's transcript is found, the monitor on the exit file. |
| 3 | The native Agent-tool recipe unchanged | DONE | `git diff 28959e9 -- skills/plan-orchestration/SKILL.md` shows no change to the first bullet of the section. |
| 4 | `--parent` named | DONE | Item 1's second sub-bullet: the session log's file name without `.jsonl` under Claude Code, the rollout's session id under Codex, pointing at "Usage". |
| 5 | `launch.sh --resume` | DONE | `claude -p --resume <id>` with the recipe's other flags; `codex exec resume` with `-c sandbox_mode="workspace-write"`, the network setting when given, the effort, `-m`, `-o` (made absolute on a resume only) and `--json`, then the id and `-`, run inside `--cwd` in a subshell whose redirections open in the caller's directory; transcript mode refuses `--resume`. |
| 6 | Steps, item 8, "How." | DONE | A `claude -p` or Codex worker is resumed by `templates/launch.sh` with `--resume <session_id>`, by the numbered list under "Launching a builder"; the next bullet names the options a round keeps and the files it takes of its own. |
| 7 | `launch.test.sh` cases | DONE | A claude resume, a codex resume, a codex resume with `--network`, a claude resume with a note (start, builder, end), a codex resume with relative files (report absolute, events and exit in the caller's directory), a first codex run's relative report kept as given, an earlier run's exit file removed at the launch (absolute, and relative to `--cwd` for claude), `transcript --resume ...` refused, and the messages for an empty `--resume` and for `--resume` with no value. The header comment names them. |
| 8 | `launch-note.md` | DONE | Its second paragraph says a repair round's resume goes through `launch.sh --resume` and is a record of its own with the step's `--label`. |

## Repair round 1

Each finding of `3-refuter.md`, and what closes it:

- Spec 1: Steps, item 8 has a bullet "The resume's options": the launch's `--cwd`, `--model`, `--effort`, `--network` and note options carry over, and the round takes its own prompt (the findings), report, stderr, events, exit, pid and id files. `launch.sh` removes an earlier exit file before it detaches, from `--cwd` for a relative claude exit file; two test cases prove it (plants 12 and 13).
- Spec 2: item 2 of the shell launch says a shell builder's identity is its pid file and its session id, taken from the JSON report's `session_id` (claude) or the `thread.started` event's `thread_id` (codex).
- Spec 3: item 1 says every launch path goes into the dispatch block under its field, none in a scratch folder or temp directory; the plan skill's `templates/orchestrator-state.md` dispatch field list gains `stderr` and `note_id`.
- Spec 4: a first codex run passes `--report` on as given; only a resume makes it absolute. A test case proves it (plant 14).
- Proof 1: plant 10 now moves the session id ahead of the options and its output shows that call.
- Proof 2: closed by Spec 4's case.
- Proof 3 and 4: `--resume ''` is refused with `--resume needs a session id` (exit 64); a test checks that message and the `--resume needs a value` message (plant 11).
- Proof 5: plants 15, 16 and 17 cover the resumed run with a note and the codex resume's exit code and stderr.
- Standards 1: the script is named `templates/launch.sh` throughout `SKILL.md`.
- Standards 2 and 3: the new text holds no semicolon (`git diff -U0 ... SKILL.md | grep '^+' | grep -c ';'` prints 0) and the two "empty" sentences use different constructions.
- Standards 4: the `launch.sh` header is reflowed.
- Standards 5 and Behaviour 1 to 3: this report now carries the open items, the per-file counts and the section below.

## What changes for a user

- Launching a shell builder: before, the orchestrator ran a hand-written `nohup sh -c '...'; echo "exit $?" > <exit file>' &` and `echo $! > <pid file>`; after, it runs `sh <skill folder>/templates/launch.sh claude|codex ...` with the same files as options, and the command the builder runs is the same.
- Resuming a shell builder: before, `claude -p --resume <id>` or `codex exec resume <id>` "with the flags of its launch"; after, `templates/launch.sh ... --resume <id>`, which runs a codex resume inside `--cwd` as `codex exec resume -c sandbox_mode="workspace-write" ... <id> -`.
- An exit file left by an earlier run: before, it stayed until the new builder ended; after, the launch removes it before it returns.
- `--resume ''`: exit 64 with `--resume needs a session id`.
- With `launch_note` set, a resumed run is a record of its own under the step's label.

## Planted failures

Seventeen plants in `launch.sh`, each turning `launch.test.sh` red (exit 1), run after repair round 1; the full output is in `agents/reviews/3-plants.md`:

1. claude drops `--resume`: `FAIL: claude resuming a session: calls were`.
2. the launch does not forward `--resume` to the detached process: `FAIL: claude resuming a session: calls were`.
3. codex resume runs the first-run command: `FAIL: codex resuming a session: calls were`.
4. codex resume does not enter `--cwd`: `FAIL: codex resuming a session: calls were`.
5. codex resume drops the network setting: `FAIL: codex resuming a session with the network setting: calls were`.
6. codex resume keeps a relative report path: `FAIL: a relative codex resume: calls were`.
7. transcript accepts `--resume`: `FAIL: usage error 'transcript --resume r --note /n --id x /t' exited 0, expected 64`.
8. `--resume` is not an option: `FAIL: a6: launch.sh failed`.
9. codex resume drops the sandbox setting: `FAIL: codex resuming a session: calls were`.
10. codex resume puts the session id before the options: `FAIL: codex resuming a session: calls were`, the calls line `...|exec|resume|thr-1|-c|sandbox_mode=...`.
11. an empty `--resume` is accepted: `FAIL: '--resume needs a session id': exited 0, expected 64`.
12. an earlier run's exit file is left in place: `FAIL: an earlier run's exit file was still there after the launch`.
13. a relative claude exit file is removed from the caller's directory: `FAIL: an earlier run's relative exit file was still there after the launch`.
14. a first codex run's report is made absolute: `FAIL: codex without a note: calls were`.
15. the note is skipped on a resume: `FAIL: claude resuming a session with a note: calls were`.
16. a codex resume's exit code is lost: `FAIL: codex resuming a session: ... exit holds exit 0, expected exit 7`.
17. a codex resume's stderr is not redirected: `FAIL: codex resuming a session: ... stderr holds , expected codex stderr`.

## Verification

From the worktree root, after repair round 1, the verify list (`v.sh`, generated from the state file's `verify:` block) exits 0 and prints:

```text
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

The ASCII check prints nothing. `sh skills/plan-orchestration/templates/launch.test.sh` prints `PASS: launch.sh scratch tests`.

## Not verified

- A real `claude -p --resume` or `codex exec resume` run: the test uses stubs, and the codex flags are taken from `codex exec resume --help` (codex-cli 0.155.1). Whether `-c sandbox_mode` overrides a resumed session's stored sandbox is not verified.
