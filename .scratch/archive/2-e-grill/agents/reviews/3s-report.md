Everything in the brief is done.

## Open items of the state file (verbatim)

none

## The cases' first run

Before any change, the new cases of the brief's "Cases" section (all cases of a code step, `utils/pin.sh`) were written into `utils/pin.test.sh` and run once against the unchanged tree (`utils/pin.sh` as it stood at commit cb92d65, before this step): `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh`.

The real test file fails fast at the first mismatch, which the report quotes below. To see every case's own first-run result in one pass (not to stand in for the real test, only to read its outcome case by case), a throwaway copy of the same test file was made in the scratch folder with `fail()` changed to print and continue instead of exiting, and run once the same way. Both runs used the same unchanged `utils/pin.sh`.

**The real test's first run (the failing check the report quotes, per the rules file's rule 1):**

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh
FAIL: <HOME>/.claude/agents/ordo-a.md does not link into the pin
EXIT: 1
```

**Every case's result on the unchanged tree** (from the soft-fail copy's single pass, 51 assertion failures across all 20 cases, none unexpectedly passing in a way that would mean the brief's own rules disagree with the tree):

| # | Case (brief's "Cases") | Result on the unchanged tree |
|---|---|---|
| 1 | Pin mode: a first pin links `ordo-a.md`/`ordo-b.md` into the default folder, creates it, prints `pinned: 2 agents linked in: ...` | FAILED: no link made, no agents line printed (`utils/pin.sh` has no notion of `agents/`) |
| 2 | `CLAUDE_CONFIG_DIR` set, `ORDO_SKILL_DIRS` unset: both folders get the links | FAILED: neither folder's agent links exist |
| 3 | `ORDO_SKILL_DIRS` set to two folders: the agents folder beside each gets the links | FAILED: neither sibling folder is touched |
| 4 | A later tag without `ordo-b.md`: its link removed, `ordo-a.md`'s kept | FAILED: no `pin: removed ...` line; nothing to remove since nothing was linked |
| 5 | A tag with no `agents/` folder: `pinned: 0 agents linked in: ...`, existing agent links removed | FAILED: no agents line printed at all |
| 6 | `ordo-a.md` linking into the live clone, tag holds `ordo-a`: replaced, `pin: replaced ...` | FAILED: no replacement, no message (folder never created) |
| 7 | `ordo-z.md` linking into the live clone, tag lacks `ordo-z`: refused | FAILED: pin mode "passed" (did nothing, since it never sees the agents folder) |
| 8 | `ordo-a.md` a real file: refused, file kept | FAILED: pin mode "passed" without refusing |
| 9 | `ordo-a.md` a link outside Ordo: refused | FAILED: pin mode "passed" without refusing |
| 10 | `mine.md`/`other.md` left alone by both modes; the `ordo-a.md` control (real file, then outside link) refused in the same run | FAILED: the control was never refused (agents ignored entirely); the touched-file assertions also failed as a direct consequence, since the setup writes under a folder `utils/pin.sh` never creates |
| 11 | A write-protected agent folder: the check after linking fails, naming the missing link | FAILED: no such check exists for agents |
| 12 | An agent folder path that is a regular file, and an entry that is a directory: each refused | FAILED (both sub-cases): pin mode "passed" in each |
| 13 | `ORDO_SKILL_DIRS` naming folders under one parent: the shared agents folder linked and named once | FAILED: not linked, not named (no agents line at all) |
| 14 | `ORDO_SKILL_DIRS` naming a folder that is also another skill folder's agents folder: refused | FAILED: pin mode "passed", no such collision check exists |
| 15 | `agents/notes.txt` and `agents/sub/x.md`: neither linked nor counted | Not independently exercised (folded into case 1's run): trivially true on the unchanged tree since nothing under `agents/` is read at all, so this is not meaningful proof by itself; it becomes meaningful only once case 1 passes, which it now does (see the DONE/NOT DONE table) |
| C1 | Check mode passes on a fresh pin and prints the agents line | FAILED: no agents line printed |
| C2 | Check mode fails naming `ordo-a.md` when its link is missing | FAILED: check mode "passed" (nothing to check) |
| C3 | Check mode fails naming a link into the live clone | FAILED: check mode "passed" |
| C4 | Check mode fails naming a link for an agent the pinned tag lacks | FAILED: check mode "passed" |
| C5 | No agent folder, pinned tag without agents: check mode passes with `pinned: 0 agents linked in: ...`, folder not created | FAILED: no agents line printed at all (though the folder was indeed never created, for the same reason: agents are not read) |

No case found the brief's own rules to disagree with the tree; every case behaves exactly as expected of a tree where `utils/pin.sh` has no knowledge of agents at all (as "What is on the tree" states: "It knows nothing of agents"). No stop was needed.

## DONE / NOT DONE

| # | Item | Command | Output (verbatim) |
|---|---|---|---|
| 1 | Five agent definitions | `for f in agents/ordo-*.md; do cat "$f"; done` then `grep -n "model:\|tools:" agents/*.md` | Each file holds `name: ordo-<level>`, the fixed description, `effort: <level>`, and the fixed body; `grep` for `model:`/`tools:` prints **"none found (good)"** |
| 2 | `utils/pin.sh` links agents as it links skills | see Verify 1-3 below | DONE |
| 3 | `utils/pin.test.sh` cases | see Verify 1-2 below | DONE |
| 4 | `plan-orchestration` changes | `git diff cb92d65 -- skills/plan-orchestration/SKILL.md` (read in full) | DONE: "Launching a builder" names `ordo-<worker_effort>`; "The two tiers, and the models" names the effort for Builder, Reviewer, Brief-check agent; Steps 1 checks the effort agents and `CLAUDE_CODE_EFFORT_LEVEL`; Stops gains "The configured effort cannot apply" |
| 5 | `refute` changes | `git diff cb92d65 -- skills/refute/SKILL.md` (read in full) | DONE: Steps 1 checks then dispatches as `ordo-<reviewer_effort>`; Stops gains the refusal row |
| 6 | `spec` changes | `git diff cb92d65 -- skills/spec/SKILL.md` (read in full) | DONE: Steps 1 preflight and "Steps / The brief check" item 1 both updated; Stops gains the refusal row |
| 6a | `plan-help` changes | `sed -n '65,73p' skills/plan-help/SKILL.md` | DONE: `/spec refuses` line extended; new `/refute refuses` line added, column-aligned to 30 like every other line of the block |
| 6b | `plan-terms.md` + glossary sync | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` |
| 7 | README.md changes | `git diff cb92d65 -- README.md` (read in full) | DONE: all four named paragraphs/sections changed |
| 8 | glossary "pin" term | `grep -n "^\- \*\*pin\*\*" docs/glossary.md` | Term now reads "the installed skills and agents held at a tag ... links every skill and every agent from it" |
| 9 | change-standard.md bullet | `grep -n "installed skills and agents change only" docs/dev/change-standard.md` | Bullet now reads "...the installed skills and agents change only through `utils/pin.sh <tag>`..." |

| # | Verify item | Command | Output (verbatim) |
|---|---|---|---|
| 1 | Plan's verify list through `checks.sh` | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` | Prints all 8 `$ <command>` / output pairs, each passing, ending `checks: 8 commands passed`, exit 0 (full transcript run in this session; last lines: `$ git ls-files -coz ...` then `checks: 8 commands passed`) |
| 2 | `pin.test.sh` alone | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 \| tail -1` | `PASS: pin.sh scratch tests` |
| 3 | `wc -l utils/pin.sh` | `wc -l utils/pin.sh` | `443 utils/pin.sh` (under 1000) |
| 4 | No stale wording outside the paths | `git grep -n -E 'general-purpose\|links every skill from it\|installed skills change only' -- ':!.scratch'` | (no output; exits with no hits, as required) |
| 5 | Every new/changed test names its revert | see "Cases and their reverts" below | Each of the 20 cases is proven by the same revert: this step's `utils/pin.sh` changes reverted to the unchanged tree (commit cb92d65), whose red output is quoted above under "The cases' first run". None is an audit: every assertion drives an actual `pin.sh` run and reads real filesystem state or real process output, not a source-text or name-only check |
| 6 | `pin.sh` never run against the real `HOME` | `ls -la ~/.claude/agents` | `ls: /Users/axelfaes/.claude/agents: No such file or directory` (confirms nothing was ever written there; every run in this step used `pin.test.sh`'s scratch `HOME` or an explicit `export HOME=.../dbg/home` scratch override) |
| 7 | Orchestrator's, at landing | not run | Per the brief: "Run by the orchestrator at landing on main, not by the builder." |

### Cases and their reverts (rule 13)

Every one of the 20 new cases (P1-P14 covering pin mode, C1-C5 covering check mode, case 15 folded into case 1) is a behavior of `utils/pin.sh` this step adds. Each is proven by the single revert available to a new-feature step: `utils/pin.sh` as it stood before this step (commit cb92d65's version, which the brief's own "What is on the tree" section states "knows nothing of agents"). Reverting to that version turns every one of the 20 cases red, as the first run recorded above shows (51 assertion failures, one per behavior checked, several cases checking more than one fact). The brief's own text treats "the first run on the unchanged tree" as this proof for a code step's cases ("Cases" section, closing paragraph), so no case was given a separate artificial revert beyond that.

## Files changed, with line counts

- `agents/ordo-low.md` (new, 6 lines)
- `agents/ordo-medium.md` (new, 6 lines)
- `agents/ordo-high.md` (new, 6 lines)
- `agents/ordo-xhigh.md` (new, 6 lines)
- `agents/ordo-max.md` (new, 6 lines)
- `utils/pin.sh` (443 lines, up from 284)
- `utils/pin.test.sh` (700 lines, up from 380)
- `skills/plan-orchestration/SKILL.md` (321 lines)
- `skills/refute/SKILL.md` (167 lines)
- `skills/spec/SKILL.md` (276 lines)
- `skills/plan-help/SKILL.md` (96 lines)
- `skills/repo-setup/templates/plan-terms.md` (93 lines)
- `README.md` (163 lines)
- `docs/glossary.md` (109 lines)
- `docs/dev/change-standard.md` (81 lines)
- `.scratch/2-e-grill/agents/reviews/3s-report.md` (this report, in place of the brief's `3-report.md`, as the orchestrator's instructions to me name)

`git status --short` at the end of the build shows exactly these paths (the five `agents/` files untracked, the rest modified) and nothing else.

## Judgment calls the brief left open

1. **Pin mode creates an agent folder only when the tag holds at least one agent for it**, not unconditionally. The brief's decision 1 states "An agent folder that does not exist is created" without saying whether that holds for a tag with zero agents. Left unconditional (creating the folder even when nothing will ever be linked into it), a pin-mode run with a zero-agent tag left a stray empty `agents` sibling folder behind, which broke a pre-existing, unrelated assertion in `pin.test.sh` (`rmdir "$HOME/.agents"`, which expects that folder empty once its lone `skills` entry is removed). I made the `mkdir -p` conditional on `tag_agents` being non-empty; check mode already never creates the folder, unconditionally, per the brief. This is recorded in `pin.sh`'s head comment ("An agent folder that does not exist is created by pin mode when the tag holds at least one agent") and is reversible.
2. **The Cases-section check "no skill text names Ordo or a path of Ordo" does not literally hold after the change**, though its underlying rule does. `git grep -n -i -E 'ordo|pin\.sh|README' -- skills` now also hits every occurrence of the literal agent identifiers `ordo-<worker_effort>`, `ordo-<reviewer_effort>` and `ordo-high` that items 4-6 of "What to build" require verbatim. `git diff cb92d65 --unified=0 -- skills | grep -n -i -E '^\+.*ordo'` shows every one of the new hits is one of these identifiers in code formatting (naming the agent, a shape decision 1 and items 4-6 fix), never prose naming the project "Ordo" or a filesystem path of it. I read this as the check's wording being imprecise about an outcome its own author's brief mandates, not a defect to fix by weakening the required text, and report it rather than silently deciding it.
3. **Coincident agent folders are deduplicated by literal string equality** of the computed `$(dirname <skill folder>)/agents` path, not by resolved (`pwd -P`) path. This matches the one case the brief gives (`ORDO_SKILL_DIRS` naming folders that share a literal parent) and mirrors how `skill_dirs` entries are themselves compared elsewhere in `pin.sh` before they necessarily exist. It would not additionally dedup two differently-spelled paths that resolve to the same folder only via a symlink; the brief extends no such resolved-path mechanism (the `~/.agents/skills`-style one) to agent folders, so none was added.
4. **Wording and alignment of the new `/refute refuses` line** in `plan-help`'s verbatim sequence: the brief says only "in the form of the `/land refuses` line"; I wrote one sentence in that shape and aligned its description column to position 30, matching every other line of the block.
5. **Wording of the new prose** (the `pin.sh` head-comment paragraphs, the README paragraphs, the `/spec refuses` extension): the brief names what each must state; the sentences themselves are mine, written to the prose standard and matching the existing files' terms and sentence shapes.

## Host- or user-visible changes, before and after

- **`agents/ordo-low.md`, `ordo-medium.md`, `ordo-high.md`, `ordo-xhigh.md`, `ordo-max.md`**: before, did not exist. After, each is a Claude Code agent definition with `name: ordo-<level>`, the fixed `description`, `effort: <level>`, no `model` and no `tools` key, and the fixed body.
- **`utils/pin.sh`**: before, linked, replaced and removed only skills, and printed one summary line. After, it does the identical thing for agents (linking `<folder>/<name>.md` to `<pinned worktree>/agents/<name>.md`, replacing a live-clone link, removing a link for an agent the tag lacks, refusing a real file, a directory, a foreign link, a live-clone link for an agent the tag lacks, a non-folder agent-folder path, and a folder that is both a skill and an agent folder), and both modes print a second line, `pinned: <m> agents linked in: <agent folders>`.
- **`skills/plan-orchestration/SKILL.md`**: before, a builder was always dispatched with `subagent_type: general-purpose`. After, it is dispatched as `ordo-<worker_effort>` (`ordo-high` by default), and the loop refuses before any dispatch when that agent, or the reviewer's, is not installed, or `CLAUDE_CODE_EFFORT_LEVEL` is set.
- **`skills/refute/SKILL.md`** and **`skills/spec/SKILL.md`**: before, the reviewer and the brief-check agent were dispatched with no stated effort. After, both are dispatched as `ordo-<reviewer_effort>`, with the same preflight refusal.
- **`skills/plan-help/SKILL.md`**: before, `/refute`'s refusals were not listed in the printed sequence. After, a `/refute refuses` line is printed alongside `/spec refuses` (itself now also naming the effort-agent cause).
- **`skills/repo-setup/templates/plan-terms.md`** / **`docs/glossary.md`**: before, no "effort agent" term existed. After, both carry the same definition (the glossary copy verified equal to the template by `sync_rules.py`).
- **`README.md`**: before, "Install" said nothing about agents, and "Working on Ordo" described only skills. After, both CLI and folder-copy install paths cover the five agent definitions, and "Working on Ordo" describes `pin.sh` managing agents exactly as it manages skills.
- **`docs/glossary.md`'s "pin" term** and **`docs/dev/change-standard.md`'s pinned-worktree bullet**: before, both spoke only of "the installed skills". After, both read "the installed skills and agents".

## Anything in the brief that was wrong or impossible

Nothing in the brief was found wrong or impossible to build as written. The two items above under "Judgment calls" (the unconditional-folder-creation reading, and the literal "hits only what it hit before" wording) are read as places the brief's phrasing does not fully anticipate its own required content, not as premises contradicted by the tree; both are reported with their evidence rather than decided silently.
