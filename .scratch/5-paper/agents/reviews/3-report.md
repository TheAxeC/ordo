# Report: step 3, the academic-paper side of the revision comparison

Everything in the brief is done, for the scope ruling G gives the step (the brief's "What to build", premise correction under ruling G, and its "Paths this step writes").

## Open items of the state file

None.

## The cases' first run

On the tree as it stood when the step began, before any change: C1 printed no tag `v8.4.0-rc.1`; C2 to C5 had no run yet; C10's outputs were taken into `gate/rh-status-before.txt` and `gate/rh-diff-before.txt` in the session's scratchpad; C11 had no record. C6 to C9 and C12 are step 5's under ruling G.

## Cases now

- C1 met. The pinning run, `git tag v8.4.0-rc.1 d5282e3 && git rev-list -n1 v8.4.0-rc.1; env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE utils/pin.sh v8.4.0-rc.1 2>&1 | tail -15`, printed:

```
d5282e361c5f79832505eb9b9b62aca2b12ebcd0
pinned: v8.4.0-rc.1 (d5282e3), 16 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills
pinned: 5 agents linked in: /Users/axelfaes/.claude/agents, /Users/axelfaes/.claude-backup/agents, /Users/axelfaes/.claude-work/agents
```

  The check now, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE utils/pin.sh`, prints the lines below and exits 0, and `git -C ~/.local/share/ordo-stable describe --tags` prints `v8.4.0-rc.1`:

```
pinned: v8.4.0-rc.1, 16 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills
pinned: 5 agents linked in: /Users/axelfaes/.claude/agents, /Users/axelfaes/.claude-backup/agents, /Users/axelfaes/.claude-work/agents
```

- C2 met. Every `init` message of the academic-paper side (session 022ad776-b049-48f5-8777-3e8f2d48395e) and of the stopped `paper` run (session c7a6066e-6f4c-404f-af9e-740fd5319274) gives `claude-opus-5-5`.
- C3 met. `diff -r -x .claude -x .agents` of a fresh `git archive f8c5e7176` of the manuscript and the comments file, `submitted-2026-06-30/` removed, against `git archive 03b7915` of the copy printed nothing; `diff -r -x .git` of the archive of `code/` against the copy's `code/` printed nothing.
- C4 met for the academic-paper side: both `init` messages list `skills: []` and `slash_commands: []`. The `paper` sides' part is step 5's.
- C5 met. The side's three questions and Axel's answer, and its closing three decisions with why they were neither relayed nor answered, are in `3-blind-comparison.md`, "Questions and answers"; `permission_denials` is empty in both turns. The stopped run's answers are in the same record.
- C10 met, as the brief's premise correction states the case. A scan of the 1333 tool calls of the seven turns of the `paper` run and the two turns of the academic-paper side for `research-hub` or `/Users/axelfaes/workspace` printed `tool calls read: 1333 hits: 0`, and `git -C ../research-hub status --short -- projects/manuscripts/dongho-ecg-clustering .agents/skills/academic-paper` prints nothing.
- C11 met for the character set (check 1 below). Axel's call is step 5's.

## DONE / NOT DONE

- Item 1, the release candidate. DONE. `git tag --list v8.4.0-rc.1` prints `v8.4.0-rc.1`, `git rev-list -n1 v8.4.0-rc.1` prints `d5282e361c5f79832505eb9b9b62aca2b12ebcd0`, `git -C ~/.local/share/ordo-stable describe --tags` prints `v8.4.0-rc.1`; the pinning run's output is under C1.
- Item 2, the working folder. DONE. `git -C gate/revision-2 log --oneline` prints `03b7915 input`; the `diff -r` commands of C3 print nothing; `ls gate/revision-2/.claude/skills/academic-paper/SKILL.md` exists and its head names version 3.2.0.
- Item 3, the side. DONE. The `init` messages of `gate/revision-2.turn1.jsonl` and `turn2.jsonl`, read with `python3 -I`, give session 022ad776-b049-48f5-8777-3e8f2d48395e, model `claude-opus-5-5`, `skills: []`, `slash_commands: []`.
- Item 4, the stops. DONE. The last `result` of `revision-2.turn1.jsonl` holds the three questions, the resumed turn's prompt holds the answer, and `permission_denials` is `[]` in both results; choice C107 records the side's three closing decisions.
- Items 5 to 8. Step 5's under ruling G; not run in this step.
- Item 9, the records. DONE. `3-blind-comparison.md` and the two `final-message-turn<n>.md`, made with the commands open item H approves; check 1 prints nothing and exits 0.
- Item 10. DONE for research-hub: the scan of C10 prints `tool calls read: 1333 hits: 0`. No `git push` was run in this step.
- Check 1, the character set: `find .scratch/5-paper/agents/reviews -path '*/3-*' -type f -print0 | xargs -0 perl -CSD -ne '...'` printed nothing, exit 0.
- Check 2: as item 1, and `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE utils/pin.sh` exits 0.
- Check 3: as C10.
- Check 4: `git status --short` shows only files under `.scratch/5-paper/` and `docs/adr/0022-...md`.

## Files changed

- `.scratch/5-paper/agents/reviews/3-blind-comparison.md`: new, 486 lines.
- `.scratch/5-paper/agents/reviews/3-blind-comparison/revision/academic-paper-output/final-message-turn1.md`: new, 61 lines.
- `.scratch/5-paper/agents/reviews/3-blind-comparison/revision/academic-paper-output/final-message-turn2.md`: new, 52 lines.
- `.scratch/5-paper/agents/reviews/3-report.md`: this report.
- `.scratch/5-paper/agents/briefs/3.md`: 7 lines added, 9 removed (`git diff --numstat`), the premise correction under ruling G.
- `docs/adr/0022-...md`: 1 line changed, the Context sentence on the stopped `paper` revision run.

## The comparison

Not judged in this step; the `paper` side, the judges and Axel's call are step 5's (ruling G). The kept output is under `3-blind-comparison/revision/academic-paper-output/`.

## Judgment calls the brief left open

- The academic-paper side's three closing decisions were not relayed: its run had ended, and both recommendations run code, which Axel's answer to Q2 forbids (`3-blind-comparison.md`, "Questions and answers").
- The stopped run's turns are kept as every `result` message of each turn, with the answers sent; the full streams stay in the scratchpad.
- ADR 0022's Context said the stopped run "stopped seven times", and the three stops it named were not all raised by the claim check. It now says that five of the first six turns ended waiting on the user, two at stops the mode lists, and names what turns 2 and 4 asked.

## Host- and user-visible changes

- The tag `v8.4.0-rc.1` at d5282e3, which did not exist before.
- The pinned worktree `~/.local/share/ordo-stable` and the skill links: before at `v8.3.0`, now at `v8.4.0-rc.1`.
- Left on the host by the runs, outside `gate/`: the academic-paper side's clone of the authors' public repository at `/private/tmp/claude-502/ecg-code/repo` (312K), a PDF its WebFetch saved under its session's tool folder (611137 bytes), and the stopped `paper` run's temporary folder of fetched sources, `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.gxtDZZFxPa` (26M), which the skill removes at a run's end and the stop left in place. The academic-paper side also left 13 working files in `/tmp` and `/private/tmp/claude-502/`, each named in `3-blind-comparison.md`, "Sources the side used outside its input".

## Wrong or impossible in the brief

- C10 as first written compared research-hub's whole status and diff hash, which other sessions' commits change; the premise correction states it as the scan above.
