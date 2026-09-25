# Report: step 3, skill texts part 2

Everything in the brief is done. Three sentences outside this step's paths are now out of step with it and are named under "Outside this step's paths" for the orchestrator to carry.

The sections before "Repair round 1" describe the first build, and "Repair round 1" the step at the end of its rounds. The fixes made at landing are in `plan.md` (the booking of step 3) and in `3-refuter.md` (Closed). At landing `skills/spec/templates/brief.md:40` was set back to the change standard's shape, so the step makes no change to that file; item 8 and the file list of "Repair round 1" describe the worktree before landing, as do judgment calls 3 and 8, the second bullet of "Outside this step's paths" and the `/repo-setup` bullet of the user-visible changes.

## Open items (the state file's, verbatim)

- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## Verification

`sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"`, from the worktree root:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
exit 0
```

`python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md`:

```
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
```

The inventory check proves only that each new place exists. It does not read whether the place holds the rule, so every moved row was read against its place (item 18 below).

ASCII and dash scan over the eight skill files and the eight inventories: `LC_ALL=C grep -n '[^ -~]' <the 16 files>` printed nothing and exited 1. `git diff -U0 | grep '^+[^+]' | grep -n ' - \| -- \|->'` matched only list-item markers (`   - `) and the `git add -- <path>` code span, with no dash used as an aside.

## DONE / NOT DONE

| # | Item | State | Check and output |
|---|---|---|---|
| 1 | spec: a false premise stops only when the plan cannot absorb it | DONE | `grep -n` on `skills/spec/SKILL.md`: `47:   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit; the correction goes into the preparation commit (Steps 4), and the brief records it beside the premise.` / `48:   - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.` / `57:4. Make the preparation commit: the brief, and any amendment to `plan.md` the premise checks forced, committed by path. Its hash is the base.` / `91:The first two rows are stops, ...` / `95:\| A false premise the plan cannot absorb \| A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); the skill does not guess \| ...` |
| 2 | spec: "A step in flight" also resumes on a backed-out landing | DONE | `100:\| A step in flight \| ... \| That step landed, or a red line took its landing back out of main and its dispatch block reads `landing: backed-out` (the `land` skill's Steps 6) \|` |
| 3 | refute: line 10 a sentence | DONE | `10:`/refute <entry> <step>` dispatches one reviewer, who changes nothing and does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. ...` |
| 4 | refute: `reviewer_report` in Steps 7 | DONE | `53:7. The orchestrator or the session saves the report at `agents/reviews/<step>-refuter.md`, records its usage in the state file's table and its path under the dispatch block's `reviewer_report` field, and commits both by path.` |
| 5 | refute: the exception round | DONE | `58:1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, ...` / `100:- A finding is closed by the builder in a repair round (at most `repair_rounds`, or one more under `plan-orchestration`'s exception), ...` |
| 6 | refute: the qualifier covers background shells and polling | DONE | `120:\| A background shell, or polling, the brief does not list \| It outlasts the review \| ...` / `121:\| A benchmark suite or a sanitizer run the brief does not list \| ...` |
| 7 | land: a first step that stops the step's agents | DONE | `39:1. Stop the step's builder and every reviewer of the step through the runner's stop tool, before anything in the worktree is committed.` / `40:   - Check that the runner's agent listing shows none of them left.` / `41:   - For a shell builder, check that its pid is gone and its exit file exists.` / `66:    - Then the check of Steps 1 with what it showed, anything NOT DONE, what landed with the commit, what was found, and what is next.` |
| 8 | land: the look its own step; `land.sh`'s exit is the checks' pass | DONE | `55:7. Open the changed views, as "The look" says.` / `81:- When ... the changed views are opened there at Steps 7.` / `92:- When the ledger holds it, its zero exit is the pass of the checks on main (Steps 6), never of the look (Steps 7), which the script does not do.` |
| 9 | land: steps in execution order | DONE | `grep -n '^[0-9]*\. '` on the Steps section: `39:1. Stop ...`, `42:2. Set landing: cherry-picking`, `43:3. ... wip`, `44:4. ... cherry-pick`, `47:5. Restore ...`, `48:6. Run the verification commands ...`, `55:7. Open the changed views`, `56:8. Run the A/B`, `59:9. Produce the orchestrator's usage row`, `61:10. Append the booking`, `62:11. Rewrite the state file`, `63:12. Write the landing report`, `68:13. Commit by explicit path`, `77:14. git worktree remove ... git branch -D` |
| 10 | land: the backed-out state | DONE | `53:   - The dispatch block is then set to `landing: backed-out`, the step's worktree and branch are kept, and the step stays unticked in `plan.md`.`, inside Steps 6 beside `54:   - It is booked with the failure, never sent back to the builder: ...` |
| 11 | land: finish forward, revert only on a ruling | DONE | `118:- One step stays one implementation commit, which keeps each step traceable to its brief, its review and its booking.` / `119:- A landed step found short of its brief, or wrong, gets a new step that finishes it on top of what landed.` / `120:- A landed commit is reverted only on the user's ruling; its preparation commit stays, and only a step so reverted is booked as reverted.` |
| 12 | land: the landing report opens with the position line | DONE | `64:    - It opens with the position line: the roadmap entry with its title, the plan step as "step n of m" with its name, and the next step.` / `65:    - Then the open items, verbatim, ...` |
| 13 | plan-help: the printed sequence | DONE | `60:read the delta ... goes to the booked list` / `68:/land refuses                 it names what is missing, such as a finding neither closed nor booked: fix or book it, then /land again` / `69:/land meets a red line        the step is taken back out of main and the failure is booked; the booked step comes next, or your ruling when it is an open item` / `71:/plan-orchestration <entry>   instead of the lines above: runs them for every step unattended, with the executor the plan names (an agent by default) at "build it" and "close them"` |
| 14 | plan-retro: ruling 3b | DONE | `76:3. **The rule is written where the briefs point, the defect still recurs, and a command can check the rule.** The proposal is that check: ...` / `77:4. **The same, and no command can check the rule.** Only then is the proposal a sharper sentence for the existing rule; it says why no command can check the rule, ...` / `97:\| A sharper sentence proposed for a written rule that a command can check \| The same words fail the same way \| Propose the check, as "The proposal for a recurring kind" 3 says \|` |
| 15 | roadmap: Steps 2-5 for add, move, done, drop only | DONE | `42:   - The plain `/roadmap` then runs "Steps / Show" and ends there: it changes nothing and shows nothing for approval.` / `43:2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below; nothing is written yet.` / `109:\| The change \| Every change of `add`, `move`, `done` or `drop`, at Steps 3 \| ...` |
| 16 | ordo-init: the three Rules | DONE | `105:- The skill writes nothing until the user approves or corrects the draft, except that each verification command runs once from its directory before the draft is shown, its output shown with it (Steps 3).` / `108:- The skill never overwrites an existing page or `.agents/plan.yaml`: a change to one, or to any other existing file such as `.gitignore`, is shown as a diff and made after approval, like the draft.` / `109:- Every path is relative to the repository root, except `launch_note`, which is an absolute path.` |
| 17 | repo-setup: the setup's commit follows question 5 | DONE | `60:13. Commit the setup in one commit, ..., when the answer to question 5 allows the commit; otherwise stop ("Stops").` / `121:\| No commit allowed \| The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 13 or Steps / sync 8 \| ...` |
| 18 | the inventories: every moved row names its new place | DONE | The check prints ten `ok:` lines (above), and each moved row was read against its place (below) |

## Item 18: moved rows, beside the text at their new place

The command below prints each added inventory row with the item its New place resolves to. The resolver is a scratch script at `$TMPDIR/.../scratchpad/place.py` that finds the section, the subsection and the n-th top-level item or table body row the same way the inventory checker counts them:

`for f in spec refute land plan-help plan-retro roadmap ordo-init repo-setup; do git diff -U0 -- .scratch/archive/1-one-layout-for-every-skill/inventories/$f.md | grep '^+|' | sed "s/^+/$f\t/"; done | python3 <scratchpad>/place.py`

### spec (the Stops table lost the "A scope change" row, so rows after it moved up by one)

| Old row | New row | Text at the new place |
|---|---|---|
| `\| 14 \| A required key missing is a refusal that names it \| Stops 5 \|` | `... \| Stops 4 \|` | `\| A required key missing \| A required key is not in `.agents/plan.yaml`; the refusal names it \| The key \| The key added, then `/spec` again \|` |
| `\| 14 \| No such folder is a refusal that names /plan \| Stops 6 \|` | `... \| Stops 5 \|` | `\| No ledger folder \| No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` \| A refusal that names `/plan` \| ...` |
| `\| 15 \| A step already in flight is a refusal naming it, unless the configuration allows more than one \| Stops 7 \|` | `... \| Stops 6 \|` | `\| A step in flight \| A step is already in flight, and the configuration block does not allow more than one \| The step in flight, named \| ...` |
| `\| 16 \| A step not in the list is a refusal that prints the list \| Stops 8 \|` | `... \| Stops 7 \|` | `\| No such step \| The step is not in `plan.md`'s list \| The list \| ...` |
| `\| 21 \| A user-visible choice is not taken: it is a stop \| Stops 3 \|` | `... \| Stops 2 \|` | `\| A user-visible choice \| The brief would have to choose a public shape, a wire format, a config key or a vocabulary \| ...` |
| `\| 29 \| A failed preflight stops the skill with what it saw \| Stops 4 \|` | `... \| Stops 3 \|` | `\| A failed preflight \| Not on `main`, something staged, or a git operation in progress \| What it saw \| ...` |
| `\| 51 \| A correction that changes the step's scope is a stop, booked in the open items \| Stops 2 \|` | `... \| Stops 1 \|` | `\| A false premise the plan cannot absorb \| A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); ... \| The open item, booked in the open items \| ...` |

### land (Steps renumbered by the new first step, the look's own step and the execution order; Rules gained a bullet)

| Old rows | New place | Text at the new place |
|---|---|---|
| line 10 "stops at the first red line", `Steps 5` | Steps 6 | `6. Run the verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure.` with the bullet `- Any other red line ends the landing there, leaving main in a state the resumption rules of `plan-orchestration` recognise.` |
| line 20 "Set landing: cherry-picking", `Steps 1` | Steps 2 | `2. Set `landing: cherry-picking` in the dispatch block.` |
| line 21 the wip commit, `Steps 2` | Steps 3 | `3. In the worktree, from inside it, after waiting for `.git/index.lock` to go: `git add -A` scoped to the step's tree, and `git commit -q -m wip`.` |
| line 22, three rows (the range, the conflict, the script's paths), `Steps 3` | Steps 4 | `4. On main: `git cherry-pick -n <base>..<step>`, the whole range ... never only the last fix.` with `- A conflict is resolved by the orchestrator or the session, never by an agent.` and `- The ledger's landing script, when there is one, prints the conflicting paths and exits instead.` |
| line 23, two rows (restore, ledger only on main), `Steps 4` | Steps 5 | `5. Restore to main's copy, before anything else, a ledger file the worktree deleted or rewrote (a report written in both trees); the ledger is written only on main.` |
| line 24, five rows (the commands, a small finding, a red line fixed, any other red line, the booking), `Steps 5` | Steps 6 | Steps 6 and its bullets: `- A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here, ...`; `- A red line that a fix inside the brief closes is fixed on main, ...`; `- It takes the step back out of main: `git restore --staged --worktree -- <paths>` ..., both on the ask list, ...`; `- It is booked with the failure, never sent back to the builder: ...` |
| line 26, three rows (the A/B, the statistics, the noise band), `Steps 6` | Steps 8 | `8. Run the A/B: ... at least ten runs each.` with `- The mean, the standard deviation and the standard error of the difference are written to the scratchpad and quoted in the booking.` and `- A change past the noise band is a finding, fixed before the booking.` |
| line 27 the booking, `Steps 7` | Steps 10 | `10. Append the booking to `plan.md` (or the part file the plan names): ...; tick the step.` |
| line 28 the state file, `Steps 8` | Steps 11 | `11. Rewrite the state file: the dispatch block cleared, the position line, the usage rows, the open items as they stand.` |
| line 28 the orchestrator's row, and the Usage section pointer, `Steps 8` | Steps 9 | `9. Produce the orchestrator's usage row with `templates/usage.py <session log> <from> <to>`: ...` with `- The Usage section of `plan-orchestration` says where each harness keeps the log.` |
| line 29, nine rows (the commit and its bullets), `Steps 9` | Steps 13 | `13. Commit by explicit path: every path from `git diff --cached --name-only` plus the ledger files, the landing report among them.` with the bullets on `git add -- <path> ...`, deleted paths, the message's shape, its last bullet, no attribution, never push, `git status --short`, and the amend |
| line 30 the worktree and branch, `Steps 10` | Steps 14 | `14. `git worktree remove <worktree_root>/<step>` and `git branch -D <step>`: ...` |
| line 31, three rows (the landing report, its contents, who prints it), `Steps 11` | Steps 12 | `12. Write the landing report, `agents/reviews/<step>-landing.md`, so it lands with the step and stands alone on disk.` with the position-line, open-items, contents and `- Under the loop it is also the report the orchestrator prints; run by hand, it is the message that ends the turn.` bullets; it precedes Steps 13, the commit |
| line 39 `One step is one implementation commit; undoing is git revert of it, and the preparation commit stays \| Rules 1` | split: `One step is one implementation commit \| Rules 1`; `Undoing a step is git revert of its commit, and the preparation commit stays (by plan 2.B's ruling B, ...) \| Rules 3` | Rules 1: `- One step stays one implementation commit, which keeps each step traceable to its brief, its review and its booking.` Rules 3: `- A landed commit is reverted only on the user's ruling; its preparation commit stays, and only a step so reverted is booked as reverted.` |
| line 39 `A reverted step is booked as reverted \| Rules 2` | `... (by plan 2.B's ruling B, only a revert the user ruled) \| Rules 3` | Rules 3, as above |
| line 40 the state file before the commit, `Rules 3` | Rules 4 | `- The state file is rewritten before the commit, so main's head always carries a state file that describes it.` |

### ordo-init

| Old row | New row | Text at the new place |
|---|---|---|
| `\| 56 \| It never overwrites an existing page or .agents/plan.yaml \| Anti-patterns 2 \|` | `... \| Rules 4 \|` | `- The skill never overwrites an existing page or `.agents/plan.yaml`: a change to one, or to any other existing file such as `.gitignore`, is shown as a diff and made after approval, like the draft.` |

### Rows whose place did not move but whose rule changed

These rows keep their place and carry a note naming the change, as refute's row for old line 34 already does ("corrected to the booked list by the user's ruling"). Each is shown with its place's text by the same command: refute old lines 3, 30, 34, 38, 43; land old lines 31 (contents), 35 (both rows); ordo-init old lines 41, 57; plan-help old line 38; plan-retro old line 39; repo-setup old line 70; spec old line 10. For example: `\| 30 \| No background shells, no polling, unless the brief lists them \| Anti-patterns 3 \|` beside `\| A background shell, or polling, the brief does not list \| It outlasts the review \| Run each command in the foreground and wait for it \|`; `\| 57 \| Every path is relative to the repository root (by plan 2.B, except launch_note, an absolute path) \| Rules 5 \|` beside `- Every path is relative to the repository root, except `launch_note`, which is an absolute path.`

The roadmap inventory is unchanged: no place in `skills/roadmap/SKILL.md` moved (Steps keeps five items, Stops keeps ten rows), and its rows for old lines 3 and 55 ("Writes only after the user approves", Steps 4) still read true.

## Files changed

`git diff --numstat`:

```
39  38  .scratch/archive/1-one-layout-for-every-skill/inventories/land.md
3  3  .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
1  1  .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md
1  1  .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md
5  5  .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md
1  1  .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
8  8  .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
37  30  skills/land/SKILL.md
3  3  skills/ordo-init/SKILL.md
7  6  skills/plan-help/SKILL.md
3  2  skills/plan-retro/SKILL.md
6  6  skills/refute/SKILL.md
3  3  skills/repo-setup/SKILL.md
3  2  skills/roadmap/SKILL.md
5  6  skills/spec/SKILL.md
```

Line counts after the change (`wc -l`): spec 113, refute 129, land 121, plan-help 92, plan-retro 104, roadmap 137, ordo-init 109, repo-setup 145; inventories spec 71, refute 86, land 75, plan-help 49, plan-retro 63, roadmap 80 (unchanged), ordo-init 77, repo-setup 78. This report is the only other file written.

## Judgment calls the brief left open

1. spec: the Stops rows "A false premise" and "A scope change" became one row, "A false premise the plan cannot absorb", pointing at Steps 2, where the rule is written once. The table's lead sentence now says "The first two rows are stops".
2. spec: "the brief records the correction" is written in Steps 2 as "the brief records it beside the premise"; Steps 3's list of brief contents is unchanged.
3. refute: the frontmatter description also said "up to repair_rounds"; it now says "up to repair_rounds or one round more under the loop's exception", without naming `plan-orchestration`, since `docs/dev/skill-layout.md` keeps neighbouring skills out of the description.
4. land: the description now lists the stop of the agents first and the state file, the landing report and the commit in execution order. The opening paragraph adds what a red line leaves behind.
5. land: in the landing report, the check of Steps 1 is listed after the open items and before anything NOT DONE.
6. land: the look's own section no longer states its placement ("after the checks on main and before the booking"); it names Steps 7, so the placement is written once, by the step order.
7. plan-help: besides item 13's lines, three printed lines follow the other changes: the repeat line gained "or once more under plan-orchestration's exception" (item 5), the `/land` line gained "stops the step's agents" (item 7), and the `/spec stops` line gained "and the plan cannot absorb it" (item 1).
8. plan-retro: an Anti-patterns row "A sharper sentence proposed for a written rule that a command can check" was added at the end of the table, so the existing row numbers the inventory names stay.
9. roadmap: the Stops row "The change" now reads "Every change of `add`, `move`, `done` or `drop`, at Steps 3".
10. ordo-init: "never overwrites" joined the existing Rules 4 bullet on diffs, so Rules keeps five bullets and the Anti-patterns row still points at Rules 4.
11. repo-setup: the Stops row "No commit allowed" names both Steps 13 and Steps / sync 8, and the opening paragraph says the setup commits when the commit rule allows it.
12. No skill's `metadata.version` was changed; the brief does not ask for it.

## User-visible changes, before and after

- `/spec`: before, every false premise stopped with no brief. After, a false premise the plan can absorb is corrected in `plan.md` in the preparation commit and recorded in the brief; only one that changes the scope or a user-visible choice stops. Before, a step in flight blocked `/spec` until it landed. After, a dispatch block at `landing: backed-out` also releases it.
- `/refute`: the round cap now allows the one exception round; a background shell or polling the brief lists is allowed; the review's path is recorded as `reviewer_report`.
- `/land`: before, the first step set `landing: cherry-picking`. After, the step's builder and reviewers are stopped and checked gone first, and the landing report names that check. The look is Steps 7 and `land.sh`'s zero exit no longer passes it. The steps run in the order they are numbered. A red line that takes the step out of main leaves `landing: backed-out`, the worktree and branch, and the step unticked. Before, undoing a step was `git revert`. After, a landed step found short or wrong is finished by a new step, and a revert needs the user's ruling. The landing report opens with the position line.
- `/plan-help`: the printed sequence changed as items 13 and judgment call 7 say.
- `/plan-retro`: a sharper sentence is proposed only for a rule no command can check, and the proposal says why.
- `/roadmap`: the plain `/roadmap` shows the entries and asks for no approval.
- `/ordo-init`: the Rules now state the verification-command exception, the `launch_note` path exception and "never overwrites".
- `/repo-setup`: a setup no longer commits when the answer to question 5 does not allow it; it stops with "No commit allowed".

## Outside this step's paths

These sentences are now out of step with this change and sit in files other steps hold (`skills/plan-orchestration`, `skills/plan` and the templates). The carry-over greps that found them, from the worktree root:

- `grep -rn -- 'step 5.s pass\|its step [0-9]' skills utils docs README.md` printed `skills/plan-orchestration/SKILL.md:206:- `/land` produces it at its step 8 with the land skill's `templates/usage.py ...`. The usage row is now `land`'s Steps 9.
- `grep -rn -- 'false premise\|premise found\|premise.*wrong' skills utils docs README.md` printed `skills/repo-setup/templates/shared-rules.md:19:- **No question boxes.** ... Stop only where the decision belongs to the user: a user-visible shape nothing names, a premise found wrong, a red check no fix within the task covers, a rule clash.` Under ruling 3c only a premise the plan cannot absorb stops, as `plan-orchestration`'s Stops row says. It also printed `docs/dev/change-standard.md:16` and its template copy, which speak of a builder reporting a wrong premise and do not contradict the ruling.
- `grep -rn -- 'Every path is relative' skills utils docs README.md` printed `skills/plan/templates/plan.yaml:2:# Every path is relative to the repository root. ...` and `skills/plan/templates/plan.projects.yaml:3:# Every path is relative to the repository root.`, while `plan.yaml:23` says `launch_note` is an absolute path.
- `grep -rn 'landing: \|cherry-picking' skills docs README.md` printed `skills/plan-orchestration/SKILL.md:104:- A step at `landing: cherry-picking` is checked on main ...`. The case for `landing: backed-out` is booked for step 4 in the state file's booked list, as the brief's decision 1 says.

## The brief against the tree

- The brief places refute's second "at most `repair_rounds`" in "Rules (line 100)". `cat -n skills/refute/SKILL.md` on the base shows line 100 in "Finding dispositions" (`100\t- A finding is closed by the builder in a repair round (at most `repair_rounds` of them), ...`); refute's Rules hold no cap. The exception was written at line 100, in Finding dispositions.
- The state file's booked list carries "Step 3: the `land`, `plan-orchestration`, `refute` and `spec` texts ... name `utils/verify.sh`". The brief's decision 2 leaves those texts as they are until open item H is ruled, and this step followed the brief: `grep -n 'verify.sh' skills/{land,refute,spec}/SKILL.md` prints nothing.

## Repair round 1

Every ruling of the round is done. The round's diff is taken against 93a4f39, the step's work as first reported. Every command's output below is quoted whole.

### Each ruling and what closes it

1. **Spec 1, land's first step.** `skills/land/SKILL.md` Steps 1 now ends a shell builder with TERM, then KILL after a short grace. A failed check is a refusal before main is touched, and a new Stops row "Agents still running" covers it. It is appended as the last row, so the Stops row numbers the inventory names stay the same. `grep -n 'Stop the step.s builder\|stop tool\|TERM\|agent listing must\|pid must\|A check that fails\|Agents still running' skills/land/SKILL.md`:

   ```
   39:1. Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
   40:   - An agent is stopped through the runner's stop tool.
   41:   - A shell builder is sent TERM at the pid in its pid file, and KILL after a short grace.
   42:   - Then the runner's agent listing must show none of them left.
   43:   - A shell builder's pid must then be gone, and its exit file present.
   44:   - A check that fails is a refusal before main is touched ("Stops").
   107:| Agents still running | The check of Steps 1 fails: an agent still listed, a shell builder's pid alive, or no exit file | Each one left | Each one stopped, then `/land` again |
   ```

2. **Spec 2, the plan-retro row.** The Anti-patterns row is removed. Item 14's rule stays in "The proposal for a recurring kind" 4. `grep -n 'sharper sentence' skills/plan-retro/SKILL.md`:

   ```
   77:4. **The same, and no command can check the rule.** Only then is the proposal a sharper sentence for the existing rule. It says why no command can check the rule, and quotes the findings that show how builders read the current one.
   ```

3. **Spec 3, the setup's commits.** ordo-init's Steps 14 commits only when the repository's commit rule allows it. That rule is the one `repo-setup`'s question 5 recorded, or the user's word, asked at the approval of Steps 11 when `/ordo-init` runs alone. Otherwise ordo-init stops at a new Stops row, "No commit allowed", appended as the last row. `repo-setup`'s Steps 9 passes the answer to question 5 to it. Steps 13 commits only the files `/ordo-init` did not commit, and only when question 5 allows it. The opening paragraph says the tree is "committed when the repository's commit rule allows it". `grep -n 'commit rule\|question 5\|No commit allowed' skills/ordo-init/SKILL.md skills/repo-setup/SKILL.md`:

   ```
   skills/ordo-init/SKILL.md:76:    - The commit is made only when the repository's commit rule allows it: the rule `repo-setup`'s question 5 recorded, or the user's word.
   skills/ordo-init/SKILL.md:98:| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14 | The files written, and the command that shows them (`git status --short`) | The user's commit; under `/repo-setup`, the setup goes on at its Steps 10 |
   skills/repo-setup/SKILL.md:10:`/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block equal to the template. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced block.
   skills/repo-setup/SKILL.md:48:   - The answer to question 5 is passed to it as the repository's commit rule, which its commit follows.
   skills/repo-setup/SKILL.md:63:    - The commit is made only when the answer to question 5 allows it.
   skills/repo-setup/SKILL.md:82:8. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it; otherwise stop ("Stops").
   skills/repo-setup/SKILL.md:90:5. The commit rule for this repository [commit only when told].
   skills/repo-setup/SKILL.md:125:| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 13 or Steps / sync 8 | The files changed, and the command that shows them (`git status --short`) | The user's commit |
   ```

   `grep -n 'runs alone' skills/ordo-init/SKILL.md`:

   ```
   77:    - When `/ordo-init` runs alone, the user is asked at the approval of Steps 11 whether the commit is allowed.
   ```

   The ordo-init inventory row for old line 47 (Steps 14) and the repo-setup row for old line 70 (Steps 13) now carry the condition in their notes.

4. **Proof 1, the incomplete grep quote.** Every command in this section is quoted whole. The first report's grep, rerun, prints:

   ```
   $ grep -rn -- 'Every path is relative' skills utils docs README.md
   skills/roadmap/SKILL.md:137:- Every path is relative to the repository root.
   skills/plan/templates/plan.yaml:2:# Every path is relative to the repository root. A required key that is missing stops the skill that needs it, and the refusal names the key.
   skills/plan/templates/plan.projects.yaml:3:# Every path is relative to the repository root.
   skills/ordo-init/SKILL.md:113:- Every path is relative to the repository root, except `launch_note`, which is an absolute path.
   utils/check_skill_layout.test.sh:71:- **Paths.** Every path is relative to the repository root.
   utils/check_skill_layout.test.sh:189:edit no-bullets "- **Paths.** Every path is relative to the repository root.\n- A \`**literal**\` in a code span is not bold." "Every path is relative to the repository root."
   ```

   The roadmap skill names no `launch_note`, so its line is true as written. The two `check_skill_layout.test.sh` lines are fixture text for the layout checker's test. The two `skills/plan/templates` lines are the ones reported under "Outside this step's paths".

5. **Standards 1 and 2, the red-line line.** plan-help's printed line and land's opening paragraph now say "a red line no fix inside the brief closes". The printed line says the loop goes on with the next unblocked step, and the booked step is worked in its queue order. `grep -n 'no fix inside the brief closes' skills/plan-help/SKILL.md skills/land/SKILL.md`:

   ```
   skills/plan-help/SKILL.md:69:/land meets a red line        a red line no fix inside the brief closes takes the step back out of main and books the failure; the loop goes on with the next unblocked step, and the booked step is worked in its queue order (an open item waits on your ruling)
   skills/land/SKILL.md:10:`/land <entry> <step>` brings a refuted step from its worktree onto main. It leaves behind the step on main in one commit with its booking and its landing report, the state file rewritten, and the step's worktree and branch removed. After a red line no fix inside the brief closes, it leaves the step out of main instead, with its worktree and branch kept and the failure booked.
   skills/land/SKILL.md:101:| A red line for the user | A red line after the cherry-pick that no fix inside the brief closes, and only the user can decide what to do | The failure, booked in the open items as Steps 6 says | The user's ruling |
   ```

6. **Standards 3, sentence length, semicolons and one rule per bullet.**
   - spec:47 is split into three bullets, one rule each.
   - ordo-init Rules 1 and 4, and land's "The landing script" 4, are now two sentences of about 20 words or fewer each.
   - repo-setup Steps 13 is split into an item and three bullets.
   - The semicolons added at spec:47, plan-retro:77 and land:120 are gone.

   `sed -n 46,51p skills/spec/SKILL.md`:

   ```
   2. Check every premise the step's text makes against the tree.
      - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.
      - That correction goes into the preparation commit (Steps 4).
      - The brief records the correction beside the premise.
      - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.
   3. Write `agents/briefs/<step>.md` from `templates/brief.md`.
   ```

   `grep -n 'The skill writes nothing until\|never overwrites' skills/ordo-init/SKILL.md`:

   ```
   109:- The skill writes nothing until the user approves or corrects the draft. The one exception is Steps 3, where each verification command runs once before the draft is shown.
   112:- The skill never overwrites an existing page or `.agents/plan.yaml`. A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
   ```

   `grep -n 'zero exit\|reverted only' skills/land/SKILL.md`:

   ```
   95:- When the ledger holds it, its zero exit passes the checks on main (Steps 6). It never passes the look (Steps 7), which it does not do.
   124:- A landed commit is reverted only on the user's ruling. Its preparation commit stays, and only a step so reverted is booked as reverted.
   ```

   `grep -n 'Only then is the proposal' skills/plan-retro/SKILL.md`:

   ```
   77:4. **The same, and no command can check the rule.** Only then is the proposal a sharper sentence for the existing rule. It says why no command can check the rule, and quotes the findings that show how builders read the current one.
   ```

   repo-setup's new Steps 13 is shown under ruling 3 and in the dash scan below.

7. **Standards 4, refute's description.** The description now states the exception's condition itself. `grep -n '^description' skills/refute/SKILL.md`:

   ```
   3:description: "Review a built step without changing anything: a fresh reviewer reads the diff against the brief and the repository's standards, reruns every verification command and every command the builder's report quotes, treats an unreproduced claim as a finding, and writes a report under four headings (spec, proof, standards, behaviour). Run once per step before its first repair round, and again over each repair round when the configuration block says refute_after_repair: yes, up to repair_rounds, and one round more when a verification command is left red or an item of the brief unbuilt and the fix is too large for landing. Triggers on: refute <entry> <step>, review the step, refute the diff, run the refuter."
   ```

8. **The two stale lines booked for this step.** `skills/repo-setup/templates/shared-rules.md:19` now stops only on a premise the plan cannot absorb. `skills/spec/templates/brief.md:40` opens the report with the position line, then the open items. `grep -n 'premise found wrong' skills/repo-setup/templates/shared-rules.md; grep -n 'position line' skills/spec/templates/brief.md`:

   ```
   19:- **No question boxes.** Recommend and proceed. Stop only where the decision belongs to the user: a user-visible shape nothing names, a premise found wrong that the plan cannot absorb (one it can absorb is corrected in the plan), a red check no fix within the task covers, a rule clash.
   40:Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the position line: the roadmap entry with its title, the plan step as "step n of m" with its name, and the next step. Then the open items of the state file, verbatim, which hold only what the user must rule on. Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, every host- or user-visible change with its before and after, and anything in the brief that was wrong or impossible, with the evidence. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.
   ```

   A repository whose `CLAUDE.md` carries the shared-rules block now differs from the template at this line until `/repo-setup sync` is run there. Ordo itself has no `CLAUDE.md` (`ls -la CLAUDE.md AGENTS.md` printed "No such file or directory" for both).

### Checks after the round

`sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"`:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
exit 0
```

`python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo "exit $?"`, run after the two inventory notes:

```
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

No inventory place moved in this round. The two new Stops rows are appended at the end of their tables, and the removed plan-retro row was the last one, so no row's place moved.

`LC_ALL=C grep -n '[^ -~]'` over the eight skill files, `shared-rules.md`, `brief.md` and the ten inventories printed nothing, with `exit 1`.

`git diff -U0 93a4f39 | grep '^+[^+]' | grep -n ' - \| -- \|->'` matched only list markers:

```
5:+   - An agent is stopped through the runner's stop tool.
6:+   - A shell builder is sent TERM at the pid in its pid file, and KILL after a short grace.
7:+   - Then the runner's agent listing must show none of them left.
8:+   - A shell builder's pid must then be gone, and its exit file present.
9:+   - A check that fails is a refusal before main is touched ("Stops").
13:+    - The commit is made only when the repository's commit rule allows it: the rule `repo-setup`'s question 5 recorded, or the user's word.
14:+    - When `/ordo-init` runs alone, the user is asked at the approval of Steps 11 whether the commit is allowed.
15:+    - Otherwise the skill stops ("Stops").
23:+   - The answer to question 5 is passed to it as the repository's commit rule, which its commit follows.
25:+    - Every file written is named, except those `/ordo-init` committed at Steps 9.
26:+    - The commit is made only when the answer to question 5 allows it.
27:+    - Otherwise the skill stops ("Stops").
29:+   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.
30:+   - That correction goes into the preparation commit (Steps 4).
31:+   - The brief records the correction beside the premise.
```

### Files changed in the round

`git diff --numstat 93a4f39`:

```
1  1  .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
1  1  .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
10  6  skills/land/SKILL.md
6  2  skills/ordo-init/SKILL.md
1  1  skills/plan-help/SKILL.md
1  2  skills/plan-retro/SKILL.md
1  1  skills/refute/SKILL.md
6  2  skills/repo-setup/SKILL.md
1  1  skills/repo-setup/templates/shared-rules.md
3  1  skills/spec/SKILL.md
1  1  skills/spec/templates/brief.md
```

New line counts (`wc -l`): spec 115, refute 129, land 125, plan-help 92, plan-retro 103, roadmap 137, ordo-init 113, repo-setup 149, `skills/repo-setup/templates/shared-rules.md` 23, `skills/spec/templates/brief.md` 40. Inventories: ordo-init 77 and repo-setup 78. The other inventories are unchanged in this round. This report is the only other file written.

### Outside this step's paths, still open

`skills/plan-orchestration/SKILL.md:206` still says "its step 8", where it is now `land`'s Steps 9. `skills/plan/templates/plan.yaml:2` and `plan.projects.yaml:3` still carry no `launch_note` exception. Both files are held by step 2.
