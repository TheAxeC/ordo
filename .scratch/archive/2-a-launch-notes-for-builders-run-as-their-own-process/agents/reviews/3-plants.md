# Step 3 planted failures

Each plant is one edit to `skills/plan-orchestration/templates/launch.sh`, restored from a copy after the run; `sh skills/plan-orchestration/templates/launch.test.sh` was run from the repository root on main after the fixes at landing. The scratch directory is shown as `<scratch>`.

```text
1 claude drops --resume (exit 1)
FAIL: claude resuming a session: calls were
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
claude|<scratch>/a test root/work dir|-p|--resume|sess-r|--model|m1|--permission-mode|acceptEdits|--output-format|json

2 the launch does not forward --resume to the detached process (exit 1)
FAIL: claude resuming a session: calls were
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
claude|<scratch>/a test root/work dir|-p|--resume|sess-r|--model|m1|--permission-mode|acceptEdits|--output-format|json

3 codex resume runs the first-run command (exit 1)
FAIL: codex resuming a session: calls were
codex|<scratch>/a test root/work dir|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-
expected
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-

4 codex resume does not enter --cwd (exit 1)
FAIL: codex resuming a session: calls were
codex|<scratch>/a test root|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-
expected
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-

5 codex resume drops the network setting (exit 1)
FAIL: codex resuming a session with the network setting: calls were
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c4 out/report|--json|thr-1|-
expected
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|sandbox_workspace_write.network_access=true|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c4 out/report|--json|thr-1|-

6 codex resume keeps a relative report path (exit 1)
FAIL: a relative codex resume: calls were
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|rel-c-report|--json|thr-1|-
expected
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/rel-c-report|--json|thr-1|-

7 transcript accepts --resume (exit 1)
FAIL: usage error 'transcript --resume r --note /n --id x /t' exited 0, expected 64

8 --resume is not an option (exit 1)
FAIL: a6: launch.sh failed

9 codex resume drops the sandbox setting (exit 1)
FAIL: codex resuming a session: calls were
codex|<scratch>/a test root/work dir|exec|resume|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-
expected
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-

10 codex resume puts the session id before the options (exit 1)
FAIL: codex resuming a session: calls were
codex|<scratch>/a test root/work dir|exec|resume|thr-1|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-
expected
codex|<scratch>/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c3 out/report|--json|thr-1|-

11 an empty --resume is accepted (exit 1)
FAIL: '--resume needs a session id, not an empty value': exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty

12 an earlier run's exit file is left in place (exit 1)
FAIL: an earlier run's exit file was still there after the launch

13 a relative claude exit file is removed from the caller's directory (exit 1)
FAIL: an earlier run's relative exit file was still there after the launch

14 a first codex run's relative report is made absolute (exit 1)
FAIL: a relative first codex run: calls were
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/rel-f-report|--json|-
expected
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|rel-f-report|--json|-

15 the note is skipped on a resume (exit 1)
FAIL: claude resuming a session with a note: calls were
claude|<scratch>/a test root/work dir|-p|--resume|sess-r|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|51261
claude|<scratch>/a test root/work dir|-p|--resume|sess-r|--model|m1|--permission-mode|acceptEdits|--output-format|json

16 a codex resume's exit code is lost (exit 1)
FAIL: codex resuming a session: <scratch>/a test root/c3 out/exit holds exit 0, expected exit 7

17 a codex resume's stderr is not redirected (exit 1)
FAIL: codex resuming a session: <scratch>/a test root/c3 out/stderr holds , expected codex stderr

18 a relative codex exit file is removed from --cwd (exit 1)
FAIL: an earlier codex run's relative exit file was still there after the launch
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty

19 a session id that is an option is accepted (exit 1)
FAIL: '--resume needs a session id, not --last': exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty

```
