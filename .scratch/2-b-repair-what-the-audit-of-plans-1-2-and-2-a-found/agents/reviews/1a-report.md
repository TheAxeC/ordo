# Report: 1a, the verify runner moved into the land skill

Everything in the brief is done.

## Open items (the state file, verbatim)

- none.

## Result table

All commands run from the worktree root with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

| # | Item or check | State | Command and its summary line |
|---|---|---|---|
| 1 | The move: `skills/land/templates/verify.sh` and `verify.test.sh` added, content unchanged except the usage lines; the old files gone | DONE | `ls utils/verify.sh utils/verify.test.sh` prints `No such file or directory` for both, exit 1. A copy of each new file with the usage edits reversed has 244 lines, 9460 bytes and 510 lines, 19384 bytes, the sizes of the originals (`ls -l` before the move printed 9460 and 19384); `diff` of that copy against the new file shows only verify.sh 25 (plus the new line 26) and 41, and verify.test.sh 499. |
| 2 | The usage names `sh <skills>/land/templates/verify.sh <state file>`; the test asserts it | DONE | `sh skills/land/templates/verify.sh` prints `verify: usage: sh <skills>/land/templates/verify.sh <state file>`, exit 64. `grep -n 'usage:' skills/land/templates/verify.test.sh` prints `499:    *"usage: sh <skills>/land/templates/verify.sh <state file>"*) ;;`. |
| 3 | `README.md` 106, 118, 134; `docs/dev/building.md` 7, 22; `docs/dev/change-standard.md` 43, 56 name the new paths; building.md's list in folder order | DONE | `grep -rn 'land/templates/verify' README.md docs` prints README.md:106, :134, docs/dev/change-standard.md:43, :56, docs/dev/building.md:7, :22. building.md line 7 follows the `skills/land/templates/land.test.sh` line. |
| 4 | One sentence each in the six skill texts | DONE | `skills/land/SKILL.md:55` (Steps 6) and `:99` (the `templates/verify.test.sh` proof), `skills/refute/SKILL.md:45`, `skills/spec/templates/brief.md:34`, `skills/plan-orchestration/SKILL.md:51`, `skills/plan/templates/orchestrator-state.md:51`, `skills/repo-setup/templates/docs/dev/change-standard.md:45`. `python3 utils/check_skill_layout.py` prints ten `ok:` lines, exit 0. |
| 5 | Doc text for the ledger's line 13 and line 84 | DONE | Section "Doc text" below. |
| V1 | The plan's verify list through the runner at its new place, on `$TMPDIR/state-1a.md` with line 13 replaced | DONE | `sh skills/land/templates/verify.sh "$TMPDIR/state-1a.md"`: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0. |
| V2a | Case: `sh skills/land/templates/verify.test.sh 2>&1 \| tail -1` | DONE | `PASS: verify.sh scratch tests (runner under sh dash)` |
| V2b | Case: the runner with no argument exits 64 naming `<skills>/land/templates/verify.sh` | DONE | `verify: usage: sh <skills>/land/templates/verify.sh <state file>`, `exit 64` |
| V2c | Case: `grep -rn 'utils/verify' README.md docs skills utils` prints nothing | DONE | no output, `grep exit 1` |
| V2d | Case: `ls utils/verify.sh utils/verify.test.sh` fails for both | DONE | `ls: utils/verify.sh: No such file or directory`, `ls: utils/verify.test.sh: No such file or directory`, `ls exit 1` |
| V3 | The usage assertion turns red with the usage line left at the old path | DONE | See "Planted fault". |
| C | ASCII and dashes over the eleven changed files; script lines of at most 100 characters | DONE | `LC_ALL=C grep -n '[^ -~]'` over them prints nothing, exit 1; `awk 'length > 100'` over the two scripts prints nothing. |

The four cases run against the unchanged tree first were red as the brief expects: case 1 and case 2 `No such file or directory` (exit 127 for case 2), case 3 printed nine hits, case 4 listed both files. No case contradicts the brief's rules.

## Planted fault

On a copy of the pair under `$TMPDIR`, the runner's line 41 set back to `printf 'verify: usage: sh utils/verify.sh <state file>\n' >&2`; `sh "$TMPDIR/planted-1a/verify.test.sh"` exits 1, and its first `FAIL:` line is:

```
FAIL: no argument: no usage line: verify: usage: sh utils/verify.sh <state file> (runner under sh)
```

## Files

| File | Lines |
|---|---|
| `utils/verify.sh` | removed (244) |
| `utils/verify.test.sh` | removed (510) |
| `skills/land/templates/verify.sh` | 245, added |
| `skills/land/templates/verify.test.sh` | 510, added |
| `README.md` | 175 |
| `docs/dev/building.md` | 34 |
| `docs/dev/change-standard.md` | 65 |
| `skills/land/SKILL.md` | 132 |
| `skills/refute/SKILL.md` | 130 |
| `skills/spec/templates/brief.md` | 41 |
| `skills/plan-orchestration/SKILL.md` | 271 |
| `skills/plan/templates/orchestrator-state.md` | 70 |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 47 |

## Judgment calls

- The runner's head comment carries a second usage line, `#   <skills> is the folder the skills are installed in.`, so the placeholder is defined where it is used. It is the only line added to the moved files beyond the usage path.
- `README.md` keeps its test list in the same folder order as `building.md`: `sh skills/land/templates/verify.test.sh` follows `land.test.sh`, and the `verify.test.sh` bullet, text unchanged, moved to follow the `land.test.sh` bullet so the bullets keep the list's order. `docs/dev/change-standard.md`'s block takes the same order.
- `README.md:134` names both forms, the installed path for any repository and the repository path for Ordo: "runs through the land skill's runner, `sh <skills>/land/templates/verify.sh <state file>` (`skills/land/templates/verify.sh` in this repository)". `building.md` and `change-standard.md` are this repository's pages and name `skills/land/templates/verify.sh`.
- The repo-setup change-standard template's sentence ends "never a count", as this repository's `change-standard.md:56` does.

## User-visible changes

- The runner's usage message. Before: `verify: usage: sh utils/verify.sh <state file>`. After: `verify: usage: sh <skills>/land/templates/verify.sh <state file>`.
- The runner's and the test's paths. Before: `utils/verify.sh`, `utils/verify.test.sh`. After: `skills/land/templates/verify.sh`, `skills/land/templates/verify.test.sh`; the installed skills hold them once a tag holding them is pinned (Repair round 1, "The installed skills").
- `docs/dev/building.md:22`. Before: "`sh utils/verify.sh <state file>` runs a plan's verify list". After: "`sh skills/land/templates/verify.sh <state file>`, the land skill's runner, runs a plan's verify list".
- `docs/dev/change-standard.md:56`. Before: "A step's verification runs through `sh utils/verify.sh <state file>`". After: "A step's verification runs through `sh skills/land/templates/verify.sh <state file>`".
- `skills/land/SKILL.md:55`, new: "The step's verify list runs through this skill's `templates/verify.sh <state file>` from the root of the checkout it checks (main here), and the lines it prints are what the booking quotes." `:99`, new: "`templates/verify.test.sh` proves `templates/verify.sh` on scratch state files, with the runner started under `sh` and, when it is installed, `dash`."
- `skills/refute/SKILL.md:45`, new: "The step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks (the step's worktree), and the lines it prints are what the refuter report quotes."
- `skills/spec/templates/brief.md:34`, new first item of "Verify before you report" (the former items 1 to 3 are now 2 to 4): "The plan's verify list, run through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks (`sh <skills>/land/templates/verify.sh <state file>`), prints <a line per command and `verify: <n> commands passed`> and exits 0; the lines it prints are what the report quotes."
- `skills/plan-orchestration/SKILL.md:51`, the builder's prompt gains, before "the report path and shape": "that the step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, and that the lines it prints are what the report quotes".
- `skills/plan/templates/orchestrator-state.md:51`, new bullet in "Verification, every step": "The `verify` list above runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, the worktree and then main, and the lines it prints are what a report or a booking quotes."
- `skills/repo-setup/templates/docs/dev/change-standard.md:45`, new paragraph after the verification block: "A step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, and the lines it prints are what a report or a booking quotes, never a count."

## What the brief got wrong or left out

- Verification item 1 prints two lines beyond the ten `PASS:`, ten `ok:` and the count: the ASCII check (command 12) prints `Can't open utils/verify.sh: No such file or directory at -e line 1.` and the same for `utils/verify.test.sh`, and still exits 0. `git ls-files -c` lists files still in the worktree's index, and a builder may not stage the deletion. On main the cherry-pick stages the deletion, so the index no longer lists them there; the check does not read those two paths in this worktree run.
- The grep over the old path finds one more hit in the ledger, not in the brief's Doc text: `orchestrator-state.md:50`, the booked item describing step 1a ("the move of `utils/verify.sh` and its test into `skills/land/templates/`"). It describes the move and stays true; it is the orchestrator's to clear when the step is booked.

## Grep for the old paths and names (change-standard rule 14)

`grep -rn 'utils/verify' README.md docs skills utils` prints nothing (exit 1). `grep -rn -i 'verify list\|verify: list\|the runner\|verify\.sh\|verify\.test' README.md docs skills utils` finds the runner and its test named only at the new paths (README.md:106, :118, :134, :136, :138; docs/dev/building.md:7, :22; docs/dev/change-standard.md:43, :56; the six skill texts above); its other hits are the harness "runner" of `plan-orchestration` and `launch.sh`, and the "Eight `PASS:` lines of the verify list" fixture text in `collect_findings.test.sh`, none of which names the runner's place.

## Doc text

For `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`:

- Line 13, as `grep -n` prints it: `13:- sh utils/verify.test.sh 2>&1 | tail -1`. Replacement: `- sh skills/land/templates/verify.test.sh 2>&1 | tail -1`
- Line 84, as `grep -n` prints it: ``84:- The `verify` commands above, from the repository root of the worktree and again on main, from step 2 on through `utils/verify.sh`.`` Replacement: ``- The `verify` commands above, from the repository root of the worktree and again on main, from step 2 on through `sh skills/land/templates/verify.sh <state file>`, and the lines it prints are what a report or a booking quotes.``

## Repair round 1

Every ruling of `agents/briefs/1a-round-1.md` is carried out; rulings 1 and 7 needed no change.

### Result table

All commands run from the worktree root with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

| Ruling or check | State | Command and its summary line |
|---|---|---|
| 1 (Spec 1, Spec 2) | DONE, no change | Kept as built, as ruled. |
| 2 (`land/SKILL.md:99`) | DONE | `grep -n 'verify.test.sh' skills/land/SKILL.md` prints `:102: ... proves templates/verify.sh on scratch state files, starting it under sh ...`; the line no longer says "the runner". |
| 3 (brief template's expected output) | DONE | `sed -n 34p skills/spec/templates/brief.md` prints the item below. |
| 4 (the lookup order in the two templates) | DONE | `sed -n 34p skills/spec/templates/brief.md` and `sed -n 45p skills/repo-setup/templates/docs/dev/change-standard.md` each name `.agents/skills`, `~/.agents/skills`, `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`). |
| 5 (`land.sh` runs the verify list) | DONE | `sh skills/land/templates/land.test.sh 2>&1 \| tail -1` prints `PASS: land.sh and usage.py scratch tests`; the new cases print `clean: ... and the verify list verified`, `red list: a red command fails the landing with its RED line, exit 1`, `lookup: verify.sh found in the repository's .agents/skills, exit 0`, `not found: no verify.sh in any place refused before main is touched, exit 1`, `no state file: a ledger without orchestrator-state.md refused before main is touched`. |
| 6 (the installed skills) | DONE | Section "The installed skills" below. |
| 7 (the builder's two notes) | DONE, no change | As ruled. |
| Verify list through the runner | DONE | `sh skills/land/templates/verify.sh "$TMPDIR/state-1a.md"` (line 13 replaced by the Doc text): ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0. The two `Can't open` lines of the first round no longer appear. |
| The four cases | DONE | `PASS: verify.sh scratch tests (runner under sh dash)`; `verify: usage: sh <skills>/land/templates/verify.sh <state file>`, exit 64; `grep -rn 'utils/verify' README.md docs skills utils` no output, exit 1; `ls` of the old files `No such file or directory` for both, exit 1. |
| ASCII, syntax | DONE | `LC_ALL=C grep -n '[^ -~]'` over the six files this round changed prints nothing, exit 1; `sh -n` passes on `land.sh` and `land.test.sh`. No line this round added to either script is over 100 characters; the one long line in the diff is the clean landing's `sh "$ledger_script" clean ...` call, which was 142 characters before and 144 after the rename of `land_script`. |

### The new cases of land.test.sh and their red lines

Before `land.sh` changed, the test with the new cases ran red: `FAIL: the verify list on main: missing [PASS: green list` (exit 1). Each revert below was applied to `land.sh` in a copy of `skills/land/templates` under `$TMPDIR`, and the copy's `land.test.sh` run; the first `FAIL:` line of each:

| Case | Revert | First red line |
|---|---|---|
| Clean landing runs the green list | The verify list not run | `FAIL: the verify list on main: missing [PASS: green list` |
| Clean landing runs the green list from the root after main's cherry-pick | The verify list run before main's cherry-pick | `FAIL: clean landing exited 1, expected 0` |
| Red list | The runner's exit status ignored (`\|\| true`) | `FAIL: red list: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made` |
| Lookup in the repository's `.agents/skills` | `verify.sh` looked for only beside the script | `FAIL: lookup: exit 1, expected 0: preflight failed: verify.sh not found beside this script or in the land skill's templates: <scratch>/lookup-ledger` |
| Not found | No preflight refusal | `FAIL: not found: exit 127, expected 1: worktree git commit: nothing staged, no wip commit made` |
| Not found | The refusal without the places | `FAIL: not found message: missing [preflight failed: verify.sh not found beside this script or in the land skill's templates: <scratch>/nofind-ledger, <scratch>/nofind/.agents/...` |
| No state file | No preflight state file check | `FAIL: no state file: exit 64, expected 1: worktree git commit: nothing staged, no wip commit made` |

### Dispositions, file by file

- `skills/land/SKILL.md:102` (ruling 2). Before: "... on scratch state files, with the runner started under `sh` and, when it is installed, `dash`." After: "... on scratch state files, starting it under `sh` and, when it is installed, `dash`."
- `skills/spec/templates/brief.md:34` (rulings 3 and 4). Before: "... (`sh <skills>/land/templates/verify.sh <state file>`), prints <a line per command and `verify: <n> commands passed`> and exits 0; ...". After: "1. The plan's verify list, run through the `land` skill's `templates/verify.sh` from the root of the checkout it checks as `sh <skills>/land/templates/verify.sh <state file>`, where `<skills>` is the first of the repository's `.agents/skills`, `~/.agents/skills` and `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`) that holds the `land` skill, prints <the `PASS:` line of each command piped into `tail`, the whole output of each other command, then `verify: <n> commands passed`> and exits 0; the lines it prints are what the report quotes."
- `skills/repo-setup/templates/docs/dev/change-standard.md:45` (ruling 4). Before: "A step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, and ...". After: "A step's verify list runs through the `land` skill's `templates/verify.sh` from the root of the checkout it checks, as `sh <skills>/land/templates/verify.sh <state file>` with `<skills>` the first of the repository's `.agents/skills`, `~/.agents/skills` and `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`) that holds the `land` skill, and the lines it prints are what a report or a booking quotes, never a count."
- `skills/land/templates/land.sh` (ruling 5, 549 lines, 549 before).
  - The head comment names the `ADAPT` edits as "the dependency install and any check beyond the verify list with their pass rules" (before: "the check commands and their pass rules"), and a new paragraph says the check on main is the ledger's verify list, where `verify.sh` and `usage.py` are looked for, and what the preflight refuses.
  - Preflight, before main is touched: `find_template` looks for a template beside the script, then in `<repository>/.agents/skills/land/templates`, `~/.agents/skills/land/templates` and `${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/land/templates`. The state file is `orchestrator-state.md` beside the script. New refusals: `preflight failed: state file not found: <path>`, and `preflight failed: verify.sh not found beside this script or in the land skill's templates: <the four places, joined by ", ">`, each exit 1.
  - After main's cherry-pick: the `ADAPT` block holds the dependency install (`npm ci` when the lockfile changed) and the source line counts, and says any check beyond the verify list goes there. Then `run_step "verify list" sh "$landing_verify" "$landing_state"` runs from the repository root; a non-zero exit prints the output of `verify.sh` and `verify list failed`, and exits with its status. Before: `npm test`, `npm run check`, `npm run build`, `npm run format:check`, `npm run lint` and an ASCII check over the tool directory, hard-coded; they are gone, since the verify list carries a plan's checks.
  - The booking's `usage.py` lookup uses `find_template`. Before, when no place held it: `booking usage failed: usage.py not found beside this script or in the land skill's templates`. After, the same message followed by `: <the four places>`.
- `skills/land/templates/land.test.sh` (ruling 5, 749 lines, 632 before). `make_ledger` writes a scratch ledger (a copy of `land.sh`, `verify.sh` and `usage.py` from the templates folder, and an `orchestrator-state.md` with the given verify list); every landing starts `land.sh` from a ledger. The four new cases above were added, and the clean landing asserts the verify list's output. The stub `package.json` keeps only `test:browser`, since `land.sh` no longer runs the other five scripts. The head comment names the new cases.
- `skills/land/SKILL.md`, "The landing script" (ruling 5, 135 lines). Three new bullets: the check on main is the ledger's verify list run through `verify.sh` from the repository root after main's cherry-pick, and a non-zero exit fails the landing; where `verify.sh` and `usage.py` are found, and the refusals before main is touched; the `ADAPT` block holds the dependency install and any check beyond the verify list. The `land.test.sh` bullet names the verify list run and the lookup of `verify.sh`. The usage-row bullet no longer repeats where `usage.py` is found.
- `README.md:148` and `:150` (ruling 5, 175 lines). `:148` before: "... the dependency install and verify commands with their pass rules, ...". After: "... the dependency install and any check beyond the verify list with their pass rules, ... Its check on `main` is the ledger's verify list: after the cherry-pick onto `main` it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root, and a non-zero exit fails the landing with the output of `verify.sh` printed." `:150` before: "`land.sh` finds `usage.py` beside itself, then ...". After: "`land.sh` finds `verify.sh` and `usage.py` beside itself, then ... A missing state file, or a `verify.sh` in none of those places, is refused before `main` is touched, with the places named." The `land.test.sh` bullet at `:117` gains one sentence naming the new cases.

### The installed skills

The installed skill folders get `templates/verify.sh` only when a tag that holds it is pinned with `utils/pin.sh <tag>`, which links every skill from the pinned worktree `~/.local/share/ordo-stable` (`utils/pin.sh` head comment, `README.md` "Working on Ordo"). Pinning is the user's decision.

- Before: the installed land skill holds no runner. The refuter's `ls /Users/axelfaes/.claude-work/skills/land/templates/` printed `land.sh land.test.sh usage.py`, linked into the pinned worktree at v1.0.0. I did not rerun it: the round forbids touching the installed skill folders, so the listing is not verified by me.
- After, once a tag holding this step is pinned: the installed land skill's `templates/` holds `verify.sh` and `verify.test.sh`, so `sh <skills>/land/templates/verify.sh <state file>` and a ledger `land.sh` without its own copy of `verify.sh` find it there. Until then, another repository runs the command only with the runner copied or with `<skills>` pointing at a checkout that holds it, and a ledger's `land.sh` needs `verify.sh` beside it.

### Judgment calls of this round

- The state file `land.sh` reads is the `orchestrator-state.md` in its own folder, since a plan copies `land.sh` into the ledger folder that holds the state file (`README.md:148`); no new argument or `ADAPT` line.
- The preflight also refuses a missing state file before main is touched, so that a ledger without its state file never leaves main staged; the case and its revert are in the table above.
- The source line counts stay inside the `ADAPT` region, before the verify list's run; the browser check stays after it, outside that region, where it was.
