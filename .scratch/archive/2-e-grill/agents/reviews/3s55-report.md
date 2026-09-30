Everything in the brief is done, with one brief check that cannot hold as written (see "Wrong or impossible in the brief": the `git grep -i ordo -- skills` check). Verify 7 is the orchestrator's and was not run.

## Open items of the state file

none

## The cases' first run, on the unchanged tree

The cases of the code became tests in `utils/pin.test.sh`, run on the unchanged `utils/pin.sh` before any change to it. With the unchanged `pin.sh`: `sh utils/pin.test.sh` stopped at its first new case, `FAIL: first pin links the agents: <HOME>/.claude/agents/ordo-a.md does not link into the pin`; every case that existed before passed. A copy of the same test with `fail` returning instead of exiting (in a scratch folder, `pin.sh` unchanged) gave the result of each case; each new case is red:

| Case | First run on the unchanged tree |
|---|---|
| First pin links the agents, creating the folder, prints `pinned: 2 agents linked in:` | red: no link, no agents line |
| `notes.txt` and `sub/x.md` neither linked nor counted | not red by itself (nothing is linked at all); becomes a test through its revert R2 below |
| Check mode passes on a fresh pin and prints the agents line | red: no agents line |
| Check mode fails naming `ordo-a.md` when its link is missing | red: passes (exit 0) |
| Check mode fails naming a link into the live clone | red: passes |
| Check mode fails naming a link to an agent the pinned tag lacks | red: passes |
| Check mode, no agent folder, tag without agents: passes, `pinned: 0 agents linked in:`, folder not created | red: no agents line |
| `CLAUDE_CONFIG_DIR` set, `ORDO_SKILL_DIRS` unset: both agent folders linked | red |
| `ORDO_SKILL_DIRS` two folders: the `agents` folder beside each linked | red |
| Two skill folders under one parent: one agents folder, named once | red |
| A later tag without `ordo-b.md`: removed with `pin: removed`, `ordo-a.md` kept | red |
| Tag with no `agents/` folder: `pinned: 0 agents`, both links removed | red |
| Link into the live clone for a held agent: replaced with `pin: replaced` | red |
| Link `ordo-z.md` into the live clone for an agent the tag lacks: refused, nothing changed | red: exit 0, no message |
| `ordo-a.md` a real file: refused, file kept | red: exit 0 |
| `ordo-a.md` a link outside Ordo: refused | red: exit 0 |
| User's own `mine.md` and `other.md` left as they are, not reported; controls refused | red (no agent folder to hold them; the silence itself is proved by R16 and the controls by R14 and R15 below) |
| Agent folder that cannot be written: check after linking fails with the two lines | red: pin passes |
| Agent folder path a regular file; entry `ordo-a.md` a directory: refused before anything changes | red: both exit 0, worktree moved |
| Skill folder that is also an agent folder: refused before anything changes | red: exit 0, worktree moved |

No case of the brief's rules gets a wrong result on the unchanged tree; no stop was needed.

## DONE / NOT DONE

| Item | Command and output | Status |
|---|---|---|
| 1 five agent definitions | `wc -l agents/*.md` prints 6 lines each for `ordo-high`, `ordo-low`, `ordo-max`, `ordo-medium`, `ordo-xhigh`; each holds the text of item 1 with its level in `name`, `description` and `effort`, no `model`, no `tools` | DONE |
| 2 `utils/pin.sh` links agents | `sh utils/pin.test.sh 2>&1 | tail -1` prints `PASS: pin.sh scratch tests`; `wc -l utils/pin.sh` prints `473 utils/pin.sh` | DONE |
| 3 `utils/pin.test.sh` | one case per case of the brief; `run_pin` reads the skills line and the agents line apart; all earlier cases pass | DONE |
| 4 plan-orchestration | Steps 1, "The two tiers, and the models", "Launching a builder", Stops row and preamble | DONE |
| 5 refute | Steps 1 and the Stops row | DONE |
| 6 spec | Steps 1 (preflight), "Steps / The brief check" 1, Stops row | DONE |
| 6a plan-help | `/spec refuses` extended, `/refute refuses` added | DONE |
| 6b plan-terms and glossary | term **effort agent** added before **executor**; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template` | DONE |
| 7 README | Install (agents paragraph, CLI copy commands, copy loop, updating sentence) and Working on Ordo (opening paragraph, code comment, folders paragraph, check-mode and pin-mode paragraph, closing pointer) | DONE |
| 8 glossary **pin** | `docs/glossary.md:108` reads "the installed skills and agents ... links every skill and every agent from it" | DONE |
| 9 change standard | `docs/dev/change-standard.md:80` reads "the installed skills and agents change only through" | DONE |
| Verify 1 | output below, `checks: 8 commands passed` | DONE |
| Verify 2 | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1` prints `PASS: pin.sh scratch tests` | DONE |
| Verify 3 | `wc -l utils/pin.sh` prints `473 utils/pin.sh` | DONE |
| Verify 4 | `git grep -n -E 'general-purpose|links every skill from it|installed skills change only' -- ':!.scratch'` prints nothing (exit 1); without the exclusion it hits only `.scratch` files (the brief, its brief-check report, archived reports) | DONE |
| Verify 5 | reverts table below | DONE |
| Verify 6 | every `pin.sh` run was a `pin.test.sh` run under its scratch HOME (or a copy of it under the scratchpad, whose HOME is the test's own `mktemp` folder) | DONE |
| Verify 7 | the orchestrator's | not run |

Verify 1 output, verbatim (`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`):

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...ASCII check...'
checks: 8 commands passed
```

The suite total of `pin.test.sh` is a single PASS line, so no count moved. What the green does not cover: `pin.sh` against the real HOME, the real launch of an `ordo-<level>` agent (Verify 7), and the case of a root user, for whom `chmod a-w` does not block the unwritable-folder case.

## Reverts of the tests (Verify 5)

Each revert is a copy of the changed `pin.sh` with one edit, run against the final `pin.test.sh` in a scratchpad folder; first red line quoted, HOME shortened to `<HOME>`.

| Behaviour | Revert | Red line |
|---|---|---|
| Links agents | R1: the `ln -sfn` of an agent replaced by `true` | `first pin links the agents: pinning a tag with agents failed: pin: <HOME>/.claude/agents/ordo-a.md does not link to <HOME>/.local/share/ordo-stable/agents/ordo-a.md` |
| Creates the agent folder | R23: the `mkdir -p` of the agent folder in pin mode removed | `first pin links the agents: pinning a tag with agents failed: ln: <HOME>/.claude/agents/ordo-a.md: No such file or directory` |
| Only `.md` files directly in `agents/` count | R2: `agents_of` counts every file | `first pin links the agents: ... pin: <HOME>/.claude/agents/notes.txt does not link to <HOME>/.local/share/ordo-stable/agents/notes.txt` |
| Agents line printed | R3: the check-mode agents line removed | `check mode on a fresh pin: expected the line "pinned: 2 agents linked in: <HOME>/.claude/agents, <HOME>/.agents/agents" in: pinned: a1, 2 skills linked in: ...` |
| Check names a missing link | R4: the missing-link report skipped | `check mode, a missing agent link: check mode passed with a missing agent link (exit 0)` |
| Check names a link into the live clone | R5: that report removed | `check mode, an agent link into the live clone: check mode passed with an agent link into the live clone (exit 0)` |
| A live-clone link is named once, not also as missing | R24: the skip of live-clone links in the missing-link loop removed | `check mode, an agent link into the live clone: check mode named a link into the live clone as a missing link: pin: <HOME>/.claude/agents/ordo-a.md does not link to ...` |
| Check names a link to an agent the pinned tag lacks | R6: the report condition made always true | `check mode, a link to an agent the pinned tag lacks: check mode passed with a link to an agent the pinned tag lacks (exit 0)` |
| Check mode creates nothing | R7: check mode runs `mkdir -p` on the agent folders | `check mode without agent folders: check mode created <HOME>/.claude/agents` |
| Folders beside each skill folder | R8: the agent folder fixed at `~/.claude/agents` | `first pin links the agents: <HOME>/.agents/agents/ordo-a.md does not link into the pin` |
| One folder named once | R9: no dedupe | `one parent, one agent folder: expected the line "pinned: 2 agents linked in: <PLAIN>/agents" in: pinned: a1 (fb31fd4), 2 skills linked in: <PLAIN>/a, <PLAIN>/b` |
| Removal of a dropped agent, and of all agents when the tag has no `agents/` | R10: the removal skipped | `a later tag drops an agent: pinning a tag that drops an agent failed: pin: <HOME>/.claude/agents/ordo-b.md links to <HOME>/.local/share/ordo-stable/agents/ordo-b.md, which the pinned tag does not have`; with a continuing `fail`, `a tag without an agents folder` is red too (`<HOME>/.claude/agents/ordo-a.md is still linked after the tag dropped agents/`) |
| `pin: replaced` line | R12: the line's text changed | `a link into the live clone for an agent the tag holds: pin mode did not report the replaced agent link; expected "pin: replaced ..." in: pin: XX ...` |
| Refuses a live-clone link for an agent the tag lacks | R13: the refusal made never true | `a link into the live clone for an agent the tag lacks: the refusal has no message; expected "pin: <HOME>/.claude/agents/ordo-z.md links into the live clone ..."` |
| Refuses a real file | R14: that refusal removed | `an agent name that is a real file: the real-file refusal has no message; expected "pin: <HOME>/.claude/agents/ordo-a.md is a real file; move it away and run again" in: pin: <HOME>/.claude/agents/ordo-a.md links to , outside Ordo; ...` |
| Refuses a link outside Ordo | R15: that refusal removed | `an agent name that links outside Ordo: pin mode did not refuse an agent link outside Ordo (exit 0)` |
| Silence about a user's own files | R16: pin refuses every entry that is not an agent of the tag | `a later tag drops an agent: pinning a tag that drops an agent failed: pin: <HOME>/.claude/agents/ordo-b.md is not an agent of the tag`; with a continuing `fail`: `a user's own agent files: pin mode refused a user's own agent files: pin: <HOME>/.claude/agents/mine.md is not an agent of the tag` |
| Controls beside the silence: real file, link outside Ordo | R14 and R15, with a continuing `fail` | `a user's own agent files: control: the real file at an agent's name beside the user's files was refused with another message; expected "pin: <HOME>/.claude/agents/ordo-a.md is a real file; ..."`; `a user's own agent files: control: a link outside Ordo at an agent's name beside the user's files was not refused (exit 0)` |
| Check after linking covers agents | R22: `stable_agents` emptied in `check_links` | with a continuing `fail`: `an agent folder that cannot be written: pin mode passed with an agent link it could not make (exit 0)`, and `... did not fail; expected "pin: the links do not match the pin after linking" in: ln: <HOME>/.claude/agents/ordo-a.md: Permission denied` |
| Refuses a folder path that is a file | R18: the refusal removed | `an agent folder that is a regular file: the not-a-folder refusal has no message; expected "pin: <HOME>/.claude/agents is not a folder; ..." in: mkdir: <HOME>/.claude/agents: File exists` |
| Refuses a directory at an agent name | R19: the directory refusal removed | `an agent name that is a directory: the directory refusal has no message; expected "pin: <HOME>/.claude/agents/ordo-a.md is a directory; ..." in: pin: <HOME>/.claude/agents/ordo-a.md is a real file; ...` |
| Refuses a folder that is both | R20: that refusal removed | `a skill folder that is an agent folder: the both-folders refusal has no message; expected "pin: <PLAIN>/p/agents is both a skill folder and an agent folder" in: pin: <PLAIN>/p/agents/beta does not link to ...` |
| Refusals come before the worktree moves | R21: the worktree checked out before the real-file refusal | `an agent name that is a real file: a pin refused for a real file moved the worktree` |

Every revert above turned the test red; none of the new cases is an audit. The checks for a tag's `agents/notes.txt` are proved through the count in the agents line (R2): the regular expression that picks agents from the tag and `pinned_agent`'s `.md` test each exclude such a file, so a revert of the regular expression alone leaves the result unchanged (the removal loop deletes the link it made).

## Files changed, with line counts

- `agents/ordo-low.md`, `ordo-medium.md`, `ordo-high.md`, `ordo-xhigh.md`, `ordo-max.md`: new, 6 lines each
- `utils/pin.sh`: 473 lines (was 284)
- `utils/pin.test.sh`: 692 lines (was 380)
- `skills/plan-orchestration/SKILL.md`: 322 lines; `skills/refute/SKILL.md`: 167; `skills/spec/SKILL.md`: 276; `skills/plan-help/SKILL.md`: 96
- `skills/repo-setup/templates/plan-terms.md`: 93; `docs/glossary.md`: 109 (block synced, pin term edited)
- `README.md`: 165; `docs/dev/change-standard.md`: 81
- `.scratch/2-e-grill/agents/reviews/3s55-report.md`: this report

## Judgment calls the brief left open

- Agent folders count as the same folder when their paths are equal, or both exist with the same resolved path (`same_dir` in `pin.sh`), the way the skill folders are compared for `~/.agents/skills`.
- Pin mode creates an agent folder even when the tag holds no agent (item 2 says "An agent folder that does not exist is created" with no condition). The pre-existing test cleanup line `rm -rf "$d1" "$d2"` (`utils/pin.test.sh:250`) now also removes `$HOME/.agents/agents`, since the pin creates it and the later `rmdir "$HOME/.agents"` needs it empty.
- A name that starts with a dot (`agents/.x.md`) is not an agent, so listing (`git ls-tree`) and counting (`agents_of`) agree.
- The refusal "an agent folder that is also a skill folder" is made in pin mode only, as the brief says; check mode reports the resulting links by its other rules.
- The refute Steps 1 item became a check followed by a sub-bullet holding the dispatch; the spec preflight bullet sits in Steps 1 just before "A refusal here writes nothing".
- `metadata.version` of the changed skills was not bumped (no brief item names it).

## Host- or user-visible changes, before and after

- `utils/pin.sh <tag>`: before, it linked skills only. After, it also links `agents/<name>.md` of the tag into the `agents` folder beside each skill folder (`~/.claude/agents`, `$CLAUDE_CONFIG_DIR/agents`, or beside each `ORDO_SKILL_DIRS` folder), creating the folder, and prints a second line `pinned: <m> agents linked in: <folders>`. Nothing runs against the real HOME in this step; the effect on the real machine comes with the next `utils/pin.sh <tag>`, which the user approves.
- `utils/pin.sh` with no tag: before, it checked skill links. After, it also checks the agent links and prints the agents line.
- The plan skills (`plan-orchestration` "Launching a builder", `refute` Steps 1, `spec` Steps 1 and "Steps / The brief check"): before, a builder launched as `general-purpose` and a reviewer and a brief-check agent without a named agent type. After, `ordo-<worker_effort>` and `ordo-<reviewer_effort>` (`high` without the keys), with the refusal "The configured effort cannot apply" when the runner lists no such agent or `CLAUDE_CODE_EFFORT_LEVEL` is set. These take effect at the next pin.
- `README.md`: Install now tells the reader to copy `agents/*.md` into `~/.claude/agents` after the CLI install and after each update, and to leave `CLAUDE_CODE_EFFORT_LEVEL` unset; Working on Ordo says `pin.sh` links agents.

## Wrong or impossible in the brief

- "What it must do / Cases": `git grep -n -i -E 'ordo|pin\.sh|README' -- skills` cannot hit only what it hit before, because items 4, 5, 6, 6a and 6b require the agent name `ordo-<level>` in skill text. The new hits are only those agent names: `skills/plan-orchestration/SKILL.md` (3 lines), `skills/refute/SKILL.md` (3), `skills/spec/SKILL.md` (3), `skills/plan-help/SKILL.md` (2), `skills/repo-setup/templates/plan-terms.md` (1). No new hit names `pin.sh`, `README` or a path of Ordo. Command: `git grep -n -i -E 'ordo|pin\.sh|README' -- skills`, compared per file with the same grep at `HEAD`. Not decided by me; the orchestrator rules on whether the check reads "no path and no `pin.sh`/README" instead.
- Verify 4 as written (`git grep` with no path exclusion) hits the ledger files under `.scratch`, which quote the searched phrases; with `-- ':!.scratch'` (the form the "Cases" section uses) it hits nothing.
