# Report: step 3 of plan 2.E, the effort agents

Everything in the brief is built, and every verify command passes. One case of the brief cannot hold as written (the `ordo|pin\.sh|README` grep over `skills/`, under "Brief defects" below), and the orchestrator has to rule on a substitute check. That case should have stopped the build at the first run. It was found only when the case was run after the build.

## Open items of the state file (verbatim)

none

## First run of the cases on the unchanged tree

Method for the cases of `pin.sh`: the new cases were written into `utils/pin.test.sh` before `pin.sh` changed. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -3` on the unchanged `pin.sh` printed its first red line:

```
FAIL: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.UGrhFu/my home/.claude/agents/ordo-a.md does not link into the pin
```

The test stops at its first failure. To get a result for every case, a scratch copy of the same test, whose `fail` prints and returns instead of exiting, was run beside a copy of the unchanged `pin.sh` in the session's scratch folder. `<T>` stands for the scratch root and `<P>` for the plain root. Where the unchanged `pin.sh` never created an agent folder, a later case's setup could not create its file there, so some red lines are that cascade. The cascades are marked.

| Case | Result on the unchanged tree (first red line) |
|---|---|
| First pin links ordo-a.md and ordo-b.md, creates the folder, prints `pinned: 2 agents linked in:` | red: `FAIL: <T>/my home/.claude/agents/ordo-a.md does not link into the pin`, then `FAIL: the first agent pin printed no agents line; expected the line "pinned: 2 agents linked in: ..."` |
| `CLAUDE_CONFIG_DIR` set, `ORDO_SKILL_DIRS` unset: both agent folders linked | red: `FAIL: <T>/my home/.claude/agents/ordo-a.md not linked with CLAUDE_CONFIG_DIR set` |
| `ORDO_SKILL_DIRS` with two scratch skill folders: the agents folder beside each linked | red: `FAIL: <T>/my home/.agents/agents/ordo-a.md does not link into the pin` (the first pin case runs with those two folders) |
| A later tag without ordo-b.md removes its link, keeps ordo-a.md's | red: `FAIL: pin mode did not report the removed agent link in <T>/my home/.claude/agents; ...` |
| A tag with no `agents/` folder: `pinned: 0 agents linked in: ...`, both links removed | red: `FAIL: the agents line of a tag with no agents; expected the line "pinned: 0 agents linked in: ..."` |
| ordo-a.md linking into the live clone is replaced with `pin: replaced ...` | red: `FAIL: pin mode did not report the replaced agent link; ...`, `FAIL: the agent link into the live clone was not replaced` |
| ordo-z.md into the live clone, agent the tag lacks: refused, exit 1, nothing changed | red: `FAIL: a pin over an agent link into the live clone for an agent the tag lacks: exit 0, expected 1: ...` |
| ordo-a.md a real file: refused, file kept | red: `FAIL: a pin over a real file ordo-a.md: exit 0, expected 1: ...` (cascade: the file could not be created in the missing folder) |
| ordo-a.md a link outside Ordo: refused | red: `FAIL: a pin over an agent link outside Ordo: exit 0, expected 1: ...` |
| A user's mine.md and a foreign link other.md left alone and not reported; controls refused | red: the two controls above; `FAIL: pin mode changed the user's own agent file` (cascade: no folder for mine.md) |
| An unwritable agent folder: the check after linking fails | red: `FAIL: pin mode passed with an agent link it could not make` |
| Agent folder path a regular file; entry ordo-a.md a directory: refused | red: `FAIL: a pin with an agent folder that is a file exited 0: ...`; `FAIL: a pin over a directory ordo-a.md: exit 0, expected 1: ...` |
| Two skill folders under one parent: one agents folder, named once | red: `FAIL: <P>/agents/ordo-a.md not linked` |
| A skill folder that is another skill folder's agents folder: refused | red: `FAIL: a pin with a folder that is both a skill folder and an agent folder: exit 0, expected 1: ...` |
| `agents/notes.txt` and `agents/sub/x.md` neither linked nor counted | no red on the unchanged tree, since nothing is linked there. The count part is red through the missing agents line of the first case. The reverts M03 and M03b below turn this case red. |
| Check mode passes on a fresh pin and prints the agents line | red: `FAIL: check mode printed no agents line; ...` |
| Check mode fails naming ordo-a.md when its link is missing | red: `FAIL: check mode passed with an agent link missing` |
| Check mode fails naming a link into the live clone | red: `FAIL: check mode passed with an agent link into the live clone` |
| Check mode fails naming a link to an agent the pinned tag lacks | red: `FAIL: check mode passed with a link to an agent the tag lacks` |
| Check mode, no agent folder, no agents: passes with 0 agents, folder not created | red: `FAIL: check mode's agents line with no agents; ...`. The "not created" part passed, since the unchanged tree creates nothing. Revert M14 turns it red. |

Cases of the texts, checked by reading the unchanged tree:

- The five agent files: `ls agents` printed `ls: agents: No such file or directory`.
- The texts of items 4 to 9: `git grep -n -E 'general-purpose|links every skill from it|installed skills change only' -- ':!.scratch'` hit `docs/dev/change-standard.md:80`, `docs/glossary.md:107` and `skills/plan-orchestration/SKILL.md:225`.
- No skill text names Ordo: `git grep -n -i -E 'ordo|pin\.sh|README' -- skills` gave 48 hits, saved to compare after the change. As written, this case cannot hold once items 4 to 6b are built (see "Brief defects").
- A configuration block without the effort keys: `grep -n -i effort skills/*/SKILL.md` hit only `ordo-init` and `plan`, so no launch text named an effort. `printenv CLAUDE_CODE_EFFORT_LEVEL` exited 1.

The orchestrator made no ruling on a case, because no hand-back was made.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. Five agent definitions | DONE | `python3 -c` parsing each frontmatter printed, for example, `agents/ordo-xhigh.md {'name': 'ordo-xhigh', 'description': "Ordo's agent at xhigh effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.", 'effort': 'xhigh'}`. Each file has only these three keys, with no `model` and no `tools`. The body is the fixed text of item 1. `git check-ignore -v agents/ordo-high.md` exited 1, so git does not ignore the files. |
| 2. `pin.sh` links the agents | DONE | `sh utils/pin.test.sh` passes with every case of "Cases", and every revert in the table below turns it red |
| 3. `pin.test.sh` cases, `run_pin` reads both lines, header | DONE | Verify 2. Revert M17 turns `run_pin` red. |
| 4. `plan-orchestration` | DONE | read: Steps 1 (lines 44 to 46), the tiers (lines 132 to 134), "Launching a builder" (line 228), the Stops preamble and the new row (line 284) |
| 5. `refute` | DONE | read: Steps 1 (lines 45 to 48), the new Stops row (line 149) |
| 6. `spec` | DONE | read: the preflight in Steps 1 (lines 67 to 69), "Steps / The brief check" 1 (line 219), the new Stops row (line 262) |
| 6a. `plan-help` | DONE | read: the `/spec refuses` line and the new `/refute refuses` line |
| 6b. The term **effort agent**, glossary synced | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`. The check printed `ok: the plan-terms block equals the template`. |
| 7. `README.md` | DONE | read. The copy loop and the CLI agent commands were run under a scratch HOME, with the worktree standing in for the `/tmp/ordo` clone. `ls` printed `mine.md ordo-high.md ordo-low.md ordo-max.md ordo-medium.md ordo-xhigh.md`: a stale `ordo-gone.md` was removed and the user's `mine.md` was kept. |
| 8. `docs/glossary.md`, **pin** | DONE | read, line 108 |
| 9. `docs/dev/change-standard.md` | DONE | read, line 80 |
| Verify 1 | DONE | output below |
| Verify 2 | DONE | `PASS: pin.sh scratch tests` |
| Verify 3 | DONE | `457 utils/pin.sh` |
| Verify 4 | DONE, with the reading below | outside `.scratch/`, nothing; inside it, only ledger records |
| Verify 5 | DONE | the revert table below |
| Verify 6 | DONE | every `pin.sh` run was a `pin.test.sh` run under its scratch HOME, or a copy of it in the session's scratch folder |
| Verify 7 | not the builder's | the orchestrator runs it at landing |

Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, exit 0:

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
```

Verify 2: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1` printed `PASS: pin.sh scratch tests`.

Verify 3: `wc -l utils/pin.sh` printed `457 utils/pin.sh`.

Verify 4: `git grep -n -E 'general-purpose|links every skill from it|installed skills change only'` (exit 0) hits only files under `.scratch/`:

- this brief, `.scratch/2-e-grill/agents/briefs/3.md` lines 10, 12, 19, 94, 128 and 166;
- its brief-check report, lines 8 and 9;
- three archived ledger files (`1-one-layout-for-every-skill/inventories/plan-orchestration.md:95`, `2-b-.../5-report.md:252,535`, `2-d-.../9-report.md:209` and `9-round-0.diff:915`).

Each hit quotes the old wording as a record. The case's own form, `git grep -n -E '...' -- ':!.scratch'`, exited 1 with no output.

The other checks the state file names for every step:

- `LC_ALL=C grep -n '[^ -~]'` over every file of `git diff --name-only` and `agents/*.md` exited 1 with no output.
- `git status --short` shows the ten modified paths and `?? agents/`, and nothing outside the step's paths except this report.
- `python3 -c 'import glob,yaml; ...'` prints each skill's description length. They are unchanged, since no description was edited: plan-orchestration 788, refute 951, spec 1022, plan-help 386.
- Each new Stops row has 4 cells (`awk -F'|'` over the three rows).

### Behaviours, cases, reverts and red lines (rule 13)

Each revert was applied, one at a time, to a copy of `pin.sh` in the session's scratch folder. The test was copied beside it unchanged and run fail-fast. The first red line is quoted, with `<T>` for the scratch root and `<P>` for the plain root. The real `pin.sh` and `pin.test.sh` were never changed for a revert.

| Behaviour | Case | Revert | Red line |
|---|---|---|---|
| Pin mode links every agent | first pin | M01: the `ln -sfn` of an agent removed | `FAIL: the first pin of a tag with agents failed:  pin: <T>/my home/.claude/agents/ordo-a.md does not link to <T>/my home/.local/share/ordo-stable/agents/ordo-a.md` |
| Pin mode prints the agents line | first pin | M02: `print_agents_line` removed from pin mode | `FAIL: the first agent pin printed no agents line; expected the line "pinned: 2 agents linked in: <T>/my home/.claude/agents, <T>/my home/.agents/agents" in: pinned: v3 (8cfc316), 2 skills linked in: <T>/my home/.claude/skills, <T>/my home/.agents/skills` |
| Only files `agents/<name>.md` directly in `agents/` count | notes.txt, sub/x.md, .hidden.md | M03: the worktree's agents read recursively with `find` | `FAIL: the first pin of a tag with agents failed:  pin: <T>/my home/.claude/agents/.hidden.md does not link to <T>/my home/.local/share/ordo-stable/agents/.hidden.md` |
| A name starting with a dot is not an agent | the same | M03b: the tag's pattern `[^/.][^/]*` widened to `[^/][^/]*` | `FAIL: <T>/my home/.claude/agents/.hidden.md was linked, and it is not an agent` |
| Check mode prints the agents line | check mode on a fresh pin | M04: `print_agents_line` removed from check mode | `FAIL: check mode printed no agents line; expected the line "pinned: 2 agents linked in: ..." in: pinned: v3, 2 skills linked in: ...` |
| Check mode names a missing agent link | missing ordo-a.md | M05: the per-agent link check made to `continue` | `FAIL: check mode passed with an agent link missing` |
| Check mode names an agent link into the live clone | live-clone link | M06: the live-clone branch of the agent folder loop removed | `FAIL: check mode passed with an agent link into the live clone` |
| Pin mode reports a replaced link | live-clone link replaced | M06b: the `pin: replaced` line for agents removed | `FAIL: pin mode did not report the replaced agent link; expected the line "pin: replaced <T>/my home/.claude/agents/ordo-a.md, which linked into the live clone <T>/ordo" in: ...` |
| Pin mode refuses a live-clone link for an agent the tag lacks | ordo-z.md | M07: that refusal removed | `FAIL: a pin over an agent link into the live clone for an agent the tag lacks: the pinned worktree moved` |
| Pin mode refuses a real file under an agent's name | control of the silence case | M08a: that refusal removed | `FAIL: a pin over a real file ordo-a.md: exit 0, expected 1: pin: removed <T>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold` |
| Pin mode refuses a link outside Ordo under an agent's name | control of the silence case | M08b: that refusal removed | `FAIL: a pin over an agent link outside Ordo: exit 0, expected 1: pin: removed <T>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold` |
| The refusals read only the tag's agents' names (the silence on mine.md) | silence case | M08c: the refusal loop fed every `*.md` entry of the folder | `FAIL: the real agent file was not refused with its message; expected "pin: <T>/my home/.claude/agents/ordo-a.md is a real file; move it away and run again" in: pin: <T>/my home/.claude/agents/mine.md is a real file; move it away and run again` |
| The removal touches only links into the pinned worktree (the silence on other.md) | silence case | M08d: the removal matches every target | `FAIL: pin mode changed the link outside Ordo` |
| Pin mode removes an agent the tag drops | v4 drops ordo-b.md | M09: the agent removal made to `continue` | `FAIL: pinning a tag that drops an agent failed:  pin: <T>/my home/.claude/agents/ordo-b.md links to <T>/my home/.local/share/ordo-stable/agents/ordo-b.md, which the pinned tag does not have` |
| Check mode names a link to an agent the pinned tag lacks | ordo-b.md after v4 | M10: that report made to never fire | `FAIL: check mode passed with a link to an agent the tag lacks` |
| Pin mode refuses a directory under an agent's name | ordo-a.md a directory | M11: the directory branch removed | `FAIL: the directory ordo-a.md was not refused with its message; expected "pin: <T>/my home/.claude/agents/ordo-a.md is a directory; move it away and run again" in: pin: <T>/my home/.claude/agents/ordo-a.md is a real file; move it away and run again` |
| Pin mode refuses an agent folder path that is a file | filed/agents a file | M12: that refusal removed | `FAIL: the agent folder that is a file was not refused with its message; expected "pin: <T>/filed/agents is not a folder; move it away and run again" in: mkdir: <T>/filed/agents: File exists` |
| Pin mode refuses a folder that is both | ORDO_SKILL_DIRS holding ~/.claude/agents | M13: that refusal removed | `FAIL: a pin with a folder that is both a skill folder and an agent folder: the pinned worktree moved` |
| Check mode creates no folder | no agent folder, no agents | M14: check mode made to `mkdir -p` the agent folders | `FAIL: check mode created an agent folder` |
| The agent folders follow the default skill folders | CLAUDE_CONFIG_DIR set | M15: with the defaults, the agent folders only `~/.claude/agents` | `FAIL: <T>/my home/config/agents/ordo-a.md not linked with CLAUDE_CONFIG_DIR set` |
| Agent folders with one path are one | three skill folders under one parent | M16: the `!seen[dir]++` dropped | `FAIL: the shared agents folder is not named once; expected the line "pinned: 2 agents linked in: <P>/agents" in: pinned: v3 (3f9a890), 2 skills linked in: <P>/a, <P>/b, <P>/c` |
| `run_pin` reads the agents line apart and fails on a folder outside the scratch roots | every run | M17: the agents line made to name `/elsewhere/agents` | `FAIL: pin.sh linked agents into /elsewhere/agents, outside the scratch roots` |
| The default folders do not hold `~/.agents/agents` | the existing default-folders case, one assertion added | M18: `~/.agents/agents` added to the default agent folders | `FAIL: pin.sh created <T>/my home/.agents/agents with the default folders` |
| The skills summary line keeps its form | first pin | M19: the skills line's wording changed | `FAIL: the skills summary line changed its form: pinned: v3 (868f0be), 2 skills now linked in: <T>/my home/.claude/skills, <T>/my home/.agents/skills` |
| The check after linking reads the agent folders | unwritable agent folder | M20: in pin mode only, `check_links` returns before its agent part (`[ -n "${tag:-}" ] && { [ "$problems" -eq 0 ]; return; }` inserted before `stable_agents=`) | `FAIL: pin mode passed with an agent link it could not make` |

Of the tests: the notes.txt, sub/x.md and .hidden.md case stayed green on the unchanged tree and turns red only under M03 and M03b. Its subfolder part (`sub/x.md`) is an audit under a revert of the tag pattern alone: a tag agent `sub/x` would fail its own `ln` and leave nothing behind. The count and the check read the worktree, and M03 turns them red.

## Files and line counts

| File | Lines (`wc -l`) | Change (`git diff --numstat`, added and removed) |
|---|---|---|
| `agents/ordo-low.md` | 6 | new |
| `agents/ordo-medium.md` | 6 | new |
| `agents/ordo-high.md` | 6 | new |
| `agents/ordo-xhigh.md` | 6 | new |
| `agents/ordo-max.md` | 6 | new |
| `utils/pin.sh` | 457 | +175 -2 |
| `utils/pin.test.sh` | 626 | +263 -17 |
| `skills/plan-orchestration/SKILL.md` | 322 | +9 -5 |
| `skills/refute/SKILL.md` | 169 | +6 -2 |
| `skills/spec/SKILL.md` | 278 | +5 -1 |
| `skills/plan-help/SKILL.md` | 96 | +2 -1 |
| `skills/repo-setup/templates/plan-terms.md` | 93 | +1 -0 |
| `README.md` | 164 | +22 -6 |
| `docs/glossary.md` | 109 | +2 -1 |
| `docs/dev/change-standard.md` | 81 | +1 -1 |
| `.scratch/2-e-grill/agents/reviews/3-report.md` | this report | new |

## Judgment calls the brief left open

1. **A name starting with a dot is not an agent.** In the tag this is the pattern `agents/[^/.][^/]*\.md`; in the worktree, the shell glob `agents/*.md`, which skips such names. Without it, pin mode would link `.hidden.md` while check mode and the count, which read the worktree with the glob, would not see it. The count would then differ from the links made. This also keeps `agents/.md` (an empty name) and `agents/...md` out. The head comment states it, and M03b proves it.
2. **An agent folder entry not ending `.md` belongs to no agent.** A link with such a name into the live clone is therefore refused, and one into the pinned worktree is removed. This is the skills' rule applied to names: every link into the pinned worktree that no item of the tag holds is removed.
3. **Coinciding agent folders are compared by their path as written.** The folders are derived from the validated absolute skill folders with a trailing slash stripped. The "both a skill folder and an agent folder" comparison strips a trailing slash from each skill folder. Resolving paths was not used, because agent folders may not exist yet.
4. **The skill folder `/skills` gives the agent folder `/agents`** (the awk strips the last component and appends `/agents`).
5. **The agent-folder refusals run before the skill-folder refusals,** so a folder that is both is named by its own refusal first.
6. **Two changes outside the items' literal text, each serving an item (rule 20):**
   - `skills/refute/SKILL.md` "Over a repair round" item 1 ends "dispatched as Steps 1 says". A reviewer over a repair round is then launched as the same effort agent. This serves item 5.
   - The head comment of `pin.sh` gained a line on exit statuses ("Every refusal and every failed check prints a line starting "pin: " on stderr and exits 1; a run that pins, or a check that passes, exits 0"), as rule 14 asks of a head comment. This serves item 2.
7. **Item 4's sentence "This is the one place plan-orchestration states the builder's launch" is read as a constraint on where the launch is stated, not as text to add.** The launch is stated only under "Launching a builder". Steps 1 checks that the agent is listed, and the tiers point at "Launching a builder".
8. **The `high` default is written into each check that names the agent:**
   - plan-orchestration Steps 1 and "Launching a builder";
   - refute Steps 1;
   - spec's preflight bullet.
   Spec's "Steps / The brief check" item 1 keeps the brief's wording, "as the effort agent `ordo-<reviewer_effort>`", and the preflight it follows gives the default.
9. **In the plan-orchestration Stops table the refusal is the last row, and the preamble says so.** The refute and spec rows sit among their skills' refusals: spec's before its last row, refute's after its last refusal.
10. **README "With the skills CLI" has a clone line before the three commands of the brief,** since `cp /tmp/ordo/agents/*.md` needs a clone. It also has a sentence for a second account (`$CLAUDE_CONFIG_DIR/agents` in place of `~/.claude/agents`). The copy loop derives the agents folder as `$(dirname "$dir")/agents`, which is the rule `pin.sh` follows. "Working on Ordo" names "what an agent of a tag is" among what the head comment states.
11. **Two changes to existing test scaffolding.** Pins with `ORDO_SKILL_DIRS` holding `~/.agents/skills` now create `~/.agents/agents`, so:
    - the default-folders case's cleanup `rm -rf "$d1" "$d2"` also removes `$HOME/.agents/agents`;
    - that case asserts that the defaults do not create it (M18).
    No assertion was loosened. The new section starts with `rmdir` of the two agent folders that the earlier pins of tags without agents left empty. The `rmdir` fails the test when either folder is not empty, and the first agent pin then creates the folders.
12. **No `metadata.version` changed.** Step 2 of this plan, which landed as be98a0d, changed `skills/ordo-init/SKILL.md` and `skills/plan/SKILL.md` without a version change (`git show be98a0d -- 'skills/*/SKILL.md' | grep '^[-+]  version'` printed nothing).

## Host- and user-visible changes

- **`utils/pin.sh` output.** Before: one summary line, `pinned: <tag> (<hash>), <n> skills linked in: <folders>`. After: that line unchanged, followed by `pinned: <m> agents linked in: <agent folders>`, and the same pair in check mode.
- **`utils/pin.sh` behaviour.** Before: it touched only skill folders. After: pin mode creates `~/.claude/agents` (and `$CLAUDE_CONFIG_DIR/agents`, or the sibling of each `ORDO_SKILL_DIRS` folder) and links each `ordo-*.md` of the tag there. It prints the new `pin: replaced`/`pin: removed` lines for agents, and it refuses with six new messages (item 2). Check mode fails on the three new agent conditions. On this machine the next `utils/pin.sh <tag>` of a tag holding `agents/` creates `/Users/axelfaes/.claude/agents` and five links. That pin is Axel's to approve.
- **The plan skills, from the next pin on.**
  - plan-orchestration: before, a builder was launched as `subagent_type: general-purpose`; after, as `ordo-<worker_effort>`.
  - refute: before, the reviewer was launched on the `reviewer:` model with no effort named; after, as `ordo-<reviewer_effort>`.
  - spec: before, the brief-check agent was launched on the `reviewer:` model with no effort named; after, as `ordo-<reviewer_effort>`.
  - Each of the three skills gains the refusal "The configured effort cannot apply", which ends the run when the runner lists no such agent or `CLAUDE_CODE_EFFORT_LEVEL` is set. Before, none of them had it.
- **`/plan-help`.** Before, `/spec refuses` listed two causes and there was no `/refute refuses` line. After, `/spec refuses` also names the effort cause and its remedy, and a `/refute refuses` line is printed.
- **The glossary.** Before, there was no term **effort agent** and **pin** covered skills. After, **effort agent** is added and **pin** covers skills and agents.
- **README "Install".** Before, it said nothing of agents. After, it names the five definitions and the need for `CLAUDE_CODE_EFFORT_LEVEL` to be unset, gives the agent commands after the skills CLI, and the copy loop copies the agents. "Working on Ordo" covers agents.

## Brief defects

1. **The case "No skill text names Ordo or a path of Ordo: `git grep -n -i -E 'ordo|pin\.sh|README' -- skills` hits only what it hit before the change" cannot hold as written.**
   - Why: items 4, 5, 6, 6a and 6b dictate text that names the agents `ordo-<worker_effort>`, `ordo-<reviewer_effort>`, `ordo-<level>` and `ordo-low` to `ordo-max`, and the case-insensitive `ordo` pattern matches those names.
   - Evidence: after the change the grep gives 59 hits against 48 on the base, and the 11 new hits are the lines of those items.
   - What the case means holds. Removing the agent names (`sed -E 's/ordo-(<level>|<worker_effort>|<reviewer_effort>|low|medium|high|xhigh|max)//g'`) from every hit and grepping again gives output identical to `git grep -h -i -E 'ordo|pin\.sh|README' HEAD -- skills` (`diff` printed nothing).
   - The substitute check is the orchestrator's to write. The brief's hand-back rule asked for a stop at the first run on a case the brief gets wrong. The first run recorded the 48 base hits and did not see that the items require new `ordo-` hits, so this case surfaced only when the case was run after the build.
2. **Verify 4 as written (`git grep -n -E 'general-purpose|links every skill from it|installed skills change only'`, with no pathspec) hits ledger files under `.scratch/`,** listed under Verify 4 above. Each quotes the old wording as a record, and the builder may not edit them. The case's form with `':!.scratch'` hits nothing.
