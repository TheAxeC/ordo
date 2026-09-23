# Step 3 refuter report (on .agents/worktrees/2a-3, base 28959e9)

## Verification lines

Rerun by the reviewer from the worktree root: eight `PASS:` lines of the verify list, ten `ok:` lines of the layout check (exit 0), the ASCII check empty (exit 0), `PASS: launch.sh scratch tests`; `git diff 28959e9 --stat`: 4 files changed, 107 insertions(+), 31 deletions(-). `codex exec resume --help` (codex-cli 0.155.1) takes `-c`, `-m`, `-o`, `--json`, `[SESSION_ID] [PROMPT]`, no `-C`, no `-s`. `claude --help` (2.1.281): `-r, --resume [value]`, and `--fork-session` creates a new session id when resuming, so a resumed `claude -p` keeps its session id and `.jsonl`. Builder plants 1, 4, 7 reproduce; plant 10 fails with a different calls line (Proof 1). Reviewer plants: the note skipped on resume, the codex resume exit code lost, the codex resume stderr not redirected, each red; the first-run `-o` made absolute only on resume, green (Proof 2).

## Spec

1. `SKILL.md:65`: "the options of its launch" read literally reuses the first run's prompt, report, stderr, events, exit and pid, against line 66's "the round's paths"; the brief is sent again and the first report and event log are truncated. A stale exit file from the first run satisfies the monitor at once (reproduced: `exit 0` written, a resume launched with a stub sleeping 2 s, the file read `exit 0` right after the launch). Say which options carry over and which are the round's own, and clear the exit file before detaching.
2. `SKILL.md:65, 160-170`: nothing says where a shell builder's `<session_id>` comes from (claude: the `session_id` of the JSON report; codex: the `thread_id` of `thread.started`), nor what "the builder's identity" is for a shell builder. The template's dispatch field list has `session_id` with no rule for filling it for a CLI worker.
3. `SKILL.md:163`: "`--id` names a file in the scratchpad" contradicts line 94 (nothing needed to continue lives in a scratch folder); the id file is recorded nowhere, and the dispatch field list (`skills/plan/templates/orchestrator-state.md:27`) has no id file and no `stderr`. "Scratchpad" is a Claude Code term.
4. `launch.sh:145-149`: the absolute `-o` also applies to a first `codex exec` run, which no brief item asks for.

## Proof

1. `3-plants.md:54-58`, plant 10: the quoted calls line has every option gone; a plant that moves the id ahead of the options gives `exec|resume|thr-1|-c|...`. The output does not come from the plant its label names.
2. `launch.sh:145-149`: the first-run absolute `-o` is covered by no test.
3. `launch.test.sh:294`: `"claude $full --resume"` stays green with `--resume` removed from the option list (the generic exit 64).
4. `launch.sh:70, 131, 139, 151`: an empty session id is neither exercised nor refused (change standard rule 15); `--resume ''` starts a fresh builder with exit 0.
5. `3-report.md:18-31`: no plant is listed for the resumed run with a note, nor for the codex resume's stderr, events and exit expectations.

## Standards

1. `SKILL.md:65, 162, 170, 173, 177, 178`: bare `launch.sh`, against the skill layout's "A file of this skill is named from the skill's folder: `templates/<file>`".
2. `SKILL.md:167, 170, 178`: three added semicolons, against the prose standard's two per 1000 words (the file stands at 31 in 3379 words).
3. `SKILL.md:163-165, 167`: "With `launch_note` empty, leave the note options out." and "with `launch_note` empty, skip this item." repeat a construction.
4. `launch.sh:8-11`: the header is only partly reflowed; line 10 ends early.
5. `3-report.md`: no open items, no per-file line counts, no before/after section (change standard rule 7).

## Behaviour

1. A shell launch is now `sh <skill>/templates/launch.sh ...` instead of a hand-written `nohup sh -c`, and a resumed Codex builder runs `codex exec resume -c sandbox_mode=... <id> -` inside `--cwd`; the report states neither as a before/after.
2. A first `codex exec` run with a relative `--report` now gets an absolute `-o`; not stated.
3. A stale exit file satisfies the monitor at a resume, and `--resume ''` starts a fresh session silently; not stated.

## Not checked

- A real `claude -p --resume` or `codex exec resume` run, including whether `-c sandbox_mode` overrides a resumed session's stored sandbox and whether a resumed run from `--cwd` keeps the worktree as its working root.
- How codex resolves a relative `-o` on a first run.
- Builder plants 2, 3, 5, 6, 8 and 9 were not rerun.

## Usage

124,900 tokens, 31 tool uses, 431 s.

## Repair round 1, refuted

### Verification lines

Eight `PASS:` lines of the verify list, ten `ok:` lines of the layout check (exit 0), the ASCII check empty (exit 0), `PASS: launch.sh scratch tests`; `git diff 28959e9 --stat`: 5 files changed, 169 insertions(+), 35 deletions(-); the semicolon count over the added `SKILL.md` lines prints 0. Builder plants 2, 11, 13, 14 and 17 reproduce. Reviewer plants: the first-run report made absolute when relative, red on `a relative first codex run`; the codex stale-exit arm removed, red; the codex relative stale exit file removed from `--cwd`, green (Proof 2). `launch.sh codex ... --resume --last` and `launch.sh claude ... --resume --model` exit 0 (Proof 3).

### Spec

1. `SKILL.md:66`: the round keeps "the note options" (which include `--id`) and also takes "id files" of its own.
2. `SKILL.md:164, 67` against `skills/plan/templates/orchestrator-state.md:27`: a round's paths would overwrite the first run's fields; the template names "the repair_ entries" and no `repair_` field is named anywhere.
3. `SKILL.md:169, 172`: the `claude -p` transcript is "named by its session id", taken from the JSON report, which exists only at exit; item 3 then runs after item 4 and after `end` closed the record.

### Proof

1. `3-plants.md:71-75`, plant 14: after the `<scratch>` substitution the got and expected lines read the same (the got line holds a doubled path), and the plant fails on `codex without a note`, not on the case the report cites.
2. `launch.sh:187-190`: the codex arm for a relative exit file is covered by no case.
3. `launch.sh:70-73`: `--resume` accepts a value that is an option name (`--resume --last` resumes the most recent session; `--resume --model` consumes `--model`).

### Standards

1. `SKILL.md:164`: a 40-word sentence.
2. `SKILL.md:169-170, 172-173`: four bullets of one shape.
3. `skills/plan/templates/orchestrator-state.md:27`: the comment attributes `stderr` and `note_id` to `/spec`, whose `SKILL.md:63` does not write them.
4. `note_id` holds a path while `session_id` beside it holds an id.

### Behaviour

1. A first `claude -p` builder's transcript reaches the note only after `end` (Spec 3); not stated.
2. `--resume` with a value starting with `--` is passed on as a flag; not stated.

### Not checked

- A real resume run, the sandbox override, and codex's resolution of a relative `-o` under `-C`.
- Builder plants 1, 3 to 10, 12, 15 and 16 were not rerun.

### Usage

118,199 tokens, 24 tool uses, 380 s.

## Closed

- First run, every finding: closed in repair round 1 (see `3-report.md`, "Repair round 1").
- Run over the round, fixed at landing:
  - Spec 1: the resume keeps `--cwd`, `--model`, `--effort`, `--network`, `--note`, `--label` and `--parent`; its prompt, report, stderr, events, exit, pid and id files are the round's own.
  - Spec 2: a round's paths go under the same fields with the `repair_` prefix (`repair_prompt`, `repair_report` and so on), in "Before the resume" and in item 1 of the shell launch.
  - Spec 3 and Behaviour 1: a `claude -p` builder's transcript is `<session id>.jsonl` under the runner's projects folder, written from the moment it starts, so the orchestrator reads the session id from its file name before the builder exits; the JSON report's `session_id` confirms it at the end.
  - Proof 1: plant 14 now makes a first run's relative report absolute and turns `a relative first codex run` red; the plants file keeps the doubled path visible.
  - Proof 2: a test case covers a codex relative exit file left by an earlier run, removed from the caller's directory and not from `--cwd`; plant 18 turns it red.
  - Proof 3 and Behaviour 2: `--resume` refuses a value starting with `-` (`--resume needs a session id, not --last`, exit 64); plant 19 turns the test red.
  - Standards 1: the sentence is split in two.
  - Standards 2: the four bullets use different constructions.
  - Standards 3: the plan skill's `templates/orchestrator-state.md` comment lists what `/spec` writes and what the orchestrator adds at the launch, the review and a repair round.
  - Standards 4: the field is `note_id_file`.
