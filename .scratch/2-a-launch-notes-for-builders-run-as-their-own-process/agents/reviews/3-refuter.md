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
