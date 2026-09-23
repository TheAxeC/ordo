# Step 4 planted failures

Each plant is an edit to `skills/plan-orchestration/templates/launch.sh`, restored from a copy after the run; `sh skills/plan-orchestration/templates/launch.test.sh` was run from the worktree root after repair round 1. The first failing line of each run is shown.

```text
1 --effort is not required for codex (exit 1)
FAIL: usage error 'codex --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --events v' exited 0, expected 64

2 --events is accepted for claude (exit 1)
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --events v' exited 0, expected 64

3 --network is accepted by transcript (exit 1)
FAIL: usage error 'transcript --network /t' exited 0, expected 64

4 --label is accepted by transcript (exit 1)
FAIL: usage error 'transcript --label v /t' exited 0, expected 64

5 --exit is not required (exit 1)
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s  --pid p' exited 0, expected 64

6 the id is not required with a note in transcript mode (exit 1)
FAIL: usage error 'transcript --note /n /t' exited 0, expected 64

7 an empty note given with an id file is run as a note, at both the forwarding and the body (exit 1)
FAIL: claude with an empty note: an id file was written

8 the transcript path is not required (exit 1)
FAIL: usage error 'transcript --note /n --id x' exited 0, expected 64

9 a stray argument is accepted (exit 1)
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p stray' exited 0, expected 64

10 a usage error prints another message (exit 1)
FAIL: usage error 'codex --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --events v' printed <worktree>/skills/plan-orchestration/templates/launch.sh: --effort missing ..., expected --effort is required for codex
```

At landing, on main, after the resume checks were restored and the no-argument check made strict; `<repo>` is the repository root:

```text
11 an empty --resume is accepted (exit 1)
FAIL: an empty --resume exited 0, expected 64

19 a session id that is an option is accepted (exit 1)
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --resume --last' exited 0, expected 64

20 the resume error names nothing (exit 1)
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --resume --last' printed <repo>/skills/plan-orchestration/templates/launch.sh: --resume is wrong

21 a missing value names another error (exit 1)
FAIL: usage error 'claude --cwd' printed <repo>/skills/plan-orchestration/templates/launch.sh: bad

22 a launch with no arguments prints an error before the usage text (exit 1)
FAIL: a launch with no arguments printed <repo>/skills/plan-orchestration/templates/launch.sh: spurious
```
