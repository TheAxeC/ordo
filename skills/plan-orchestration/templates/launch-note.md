# The launch-note command

A launch note records a builder that plan-orchestration starts as a process of its own, so that a tool watching the sessions can show that builder under the session that launched it. The plan skills name no such tool and no path to one. A repository that wants the record sets `launch_note:` in its `.agents/plan.yaml` to the absolute path of an executable command that follows the interface below. The ordo-init skill's `templates/check_config.py` reports a relative path, a missing file, a directory or a file that is not executable, and `launch.sh` refuses a relative path. When the key is empty, the default, nothing is recorded and the launch recipes run exactly as they do without it.

The note applies to the two shell launch recipes, `claude -p` and `codex exec`, which `launch.sh` beside this page runs. A repair round resumes a shell builder through `launch.sh --resume`, and that run is a record of its own, with the same `--label` as the step's first run. A builder started through the runner's native agent tool is already visible as a subagent of its session, so it is not recorded.

## The three calls

Every call must return at once. `launch.sh` stops a call that has not returned after 3 seconds, with every process the call started, and counts it as a failed call. It ignores a call that fails, because the note is only a record: the builder runs, the exit file is written and the launch finishes, whatever the note command does.

`<launch_note> start --launcher plan-orchestration --label <entry>/<step> --harness <claude|codex> --model <model> --parent <session id> --cwd <dir> --pid <pid>`

- Before the builder starts, the process that leads the builder's session runs this call.
- `--label` is `<entry>/<step>`, `--parent` the orchestrating session's id, and `--cwd` the builder's working directory.
- `--pid` names the process that leads the builder's session, the one whose pid is in the step's pid file. It is alive when `start` runs and stays alive until `end` has returned or been stopped.
- A field added to `start` later is optional, and this page names it before `launch.sh` sends it, since a note command may refuse a flag it does not know.
- Its standard output goes to the file `launch.sh` was given as `--id`, and the first line of that file is the record's id.
- A non-zero exit, an empty first line or a call stopped after 3 seconds means no record was made, and `end` and `transcript` are then not called.

`<launch_note> transcript <id> <path>`

- Once the builder's transcript or Codex rollout path is known, the orchestrator passes it on, as a numbered step, through `launch.sh transcript --note <launch_note> --id <id file> <path>`. With the key empty that call does nothing.
- The path is attached to the record.

`<launch_note> end <id>`

- When the builder exits by itself, the session leader sends this call, and only then writes the exit file.
- When TERM, INT or HUP reaches the session leader while this call runs, the leader writes the builder's code to the exit file first and then stops the call.
- When TERM, INT or HUP sent to the session leader stops the builder, the leader writes the exit file first and then sends this call.
- When the session leader is killed with KILL, or ends without finishing, this call does not follow, and the record stays open. The builder's runner still writes the exit file when the leader is killed while the builder runs.
- It closes the record. The builder's exit code reaches the exit file whatever `end` does.
