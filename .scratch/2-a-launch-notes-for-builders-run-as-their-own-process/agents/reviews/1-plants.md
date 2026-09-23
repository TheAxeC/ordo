# Step 1 plants

Each fault was planted in a copy of `skills/plan-orchestration/templates/launch.sh` with `launch.test.sh` beside it; every one exits 1. The scratch directory's path is shown as `<scratch>`.

## claude arguments changed

Exit 1.

```
FAIL: claude without a note: calls were
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|plan|--output-format|json
expected
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
```

## codex model argument dropped

Exit 1.

```
FAIL: codex without a note: calls were
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|x|-o|<scratch>/a test root/c0 out/report|--json|-
expected
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c0 out/report|--json|-
```

## network setting dropped

Exit 1.

```
FAIL: codex with the network setting: calls were
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c1 out/report|--json|-
expected
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|sandbox_workspace_write.network_access=true|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c1 out/report|--json|-
```

## claude stderr not redirected

Exit 1.

```
cat: <scratch>/a test root/a0 out/stderr: No such file or directory
cat: <scratch>/a test root/a0 out/stderr: No such file or directory
FAIL: claude without a note: <scratch>/a test root/a0 out/stderr holds , expected claude stderr
```

## codex events not written

Exit 1.

```
cat: <scratch>/a test root/c0 out/events: No such file or directory
cat: <scratch>/a test root/c0 out/events: No such file or directory
FAIL: codex without a note: <scratch>/a test root/c0 out/events holds , expected the prompt
```

## exit code lost

Exit 1.

```
FAIL: claude without a note: <scratch>/a test root/a0 out/exit holds exit 0, expected exit 3
```

## empty note treated as a note (both guards)

Exit 1.

```
FAIL: claude with an empty note: an id file was written
```

## start not called

Exit 1.

```
FAIL: claude with a note: calls were
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|16722
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-7
```

## start given the caller's pid

Exit 1.

```
FAIL: claude with a note: calls were
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|1
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-7
expected
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|17203
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-7
```

## end not called

Exit 1.

```
FAIL: claude with a note: calls were
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|17610
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|17610
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-7
```

## exit file written before end

Exit 1.

```
FAIL: claude with a note: calls were
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|18099
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-7
exit file already written
expected
note|start|--launcher|plan-orchestration|--label|3|--harness|claude|--model|m1|--parent|sess-1|--cwd|<scratch>/a test root/work dir|--pid|18099
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-7
```

## end called after a failed start

Exit 1.

```
FAIL: claude when start prints then fails: calls were
note|start|--launcher|plan-orchestration|--label|5|--harness|claude|--model|m1|--parent|sess-3|--cwd|<scratch>/a test root/work dir|--pid|18913
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-9
expected
note|start|--launcher|plan-orchestration|--label|5|--harness|claude|--model|m1|--parent|sess-3|--cwd|<scratch>/a test root/work dir|--pid|18913
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
```

## empty id line counted as an id

Exit 1.

```
FAIL: claude when start prints an empty line: calls were
note|start|--launcher|plan-orchestration|--label|5|--harness|claude|--model|m1|--parent|sess-3|--cwd|<scratch>/a test root/work dir|--pid|19820
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|
expected
note|start|--launcher|plan-orchestration|--label|5|--harness|claude|--model|m1|--parent|sess-3|--cwd|<scratch>/a test root/work dir|--pid|19820
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
```

## all of start's output taken as the id

Exit 1.

```
FAIL: start printing two lines: calls were
note|start|--launcher|plan-orchestration|--label|6|--harness|claude|--model|m1|--parent|sess-4|--cwd|<scratch>/a test root/work dir|--pid|20472
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-8
second-line
expected
note|start|--launcher|plan-orchestration|--label|6|--harness|claude|--model|m1|--parent|sess-4|--cwd|<scratch>/a test root/work dir|--pid|20472
claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
note|end|note-8
```

## relative id file kept relative

Exit 1.

```
FAIL: a relative id file: the last call was claude|<scratch>/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json, expected note|end|note-5
```

## relative note accepted

Exit 1.

```
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --note n --id i --label l --parent p' exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty
```

## label not required with a note

Exit 1.

```
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --note /n --id i --parent p' exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty
```

## parent not required with a note

Exit 1.

```
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --note /n --id i --label l' exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty
```

## transcript not called

Exit 1.

```
FAIL: transcript: calls were

expected
note|transcript|note-7|/path with space/transcript
```

## a failing transcript call passed through

Exit 1.

```
transcript stderr
FAIL: a failing transcript call stopped launch.sh
```

## transcript with an empty note refused

Exit 1.

```
/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f/scratchpad/plants2/transcript_with_an_empty_note_refused/launch.sh: --note is required
Usage: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f/scratchpad/plants2/transcript_with_an_empty_note_refused/launch.sh claude --cwd <dir> --model <model> --prompt <file> --report <file> --stderr <file> --exit <file> --pid <file> [--note <command> --id <file> --label <step> --parent <session id>]
       /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f/scratchpad/plants2/transcript_with_an_empty_note_refused/launch.sh codex --cwd <dir> --model <model> --prompt <file> --report <file> --stderr <file> --exit <file> --pid <file> --events <file> --effort <effort> [--network] [--note <command> --id <file> --label <step> --parent <session id>]
       /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f/scratchpad/plants2/transcript_with_an_empty_note_refused/launch.sh transcript --note <command> --id <file> <path>
FAIL: transcript with an empty note failed
```

## transcript without --id accepted

Exit 1.

```
FAIL: usage error 'transcript --note /n /t' exited 0, expected 64
```

## transcript accepts launch options

Exit 1.

```
FAIL: usage error 'transcript --cwd x /t' exited 0, expected 64
```

## launch waits for its builder

Exit 1.

```
FAIL: the launch waited for its builder
```

## nohup removed

Exit 1.

```
FAIL: no file at <scratch>/a test root/a5 out/exit
```

## claude cd in a subshell

Exit 1.

```
FAIL: no file at <scratch>/a test root/work dir/rel-exit
```

## unquoted working directory

Exit 1.

```
FAIL: codex without a note: calls were
codex|<scratch>/a test root|exec|-C|<scratch>/a|test|root/work|dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c0 out/report|--json|-
expected
codex|<scratch>/a test root|exec|-C|<scratch>/a test root/work dir|-s|workspace-write|-c|model_reasoning_effort="high"|-m|m1|-o|<scratch>/a test root/c0 out/report|--json|-
```

## stray argument accepted

Exit 1.

```
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p stray' exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty
```

## codex option accepted by claude

Exit 1.

```
FAIL: usage error 'claude --cwd x --model m --prompt p --report r --stderr s --exit e --pid p --network' exited 0, expected 64
rm: <scratch>/a test root: Directory not empty
rm: <scratch>: Directory not empty
```
