# Step 22 report

Everything in the brief is done.

## Open items of the state file, verbatim

- none.

## The cases' first run

The cases were written into `utils/pin.test.sh` (the block after the default-folder pin, headed `# ~/.agents/skills, a folder an earlier pin linked into ...` in the first run, reworded since) and run against the unchanged `utils/pin.sh`. The real test exits at its first failure: `sh utils/pin.test.sh 2>&1 | tail -1` printed `FAIL: the link into the pinned worktree in /private/var/folders/.../pin-test.JR4QCD/my home/.agents/skills was not removed`. To record every case, a scratch copy of the test with `fail` redefined to print and go on for the new block only was run against a copy of the unchanged `pin.sh` (`<root>` is the scratch root):

```
FAIL: the link into the pinned worktree in <root>/my home/.agents/skills was not removed
FAIL: the removal of the link into the pinned worktree in <root>/my home/.agents/skills is not reported; expected "pin: removed <root>/my home/.agents/skills/land, in a folder pin.sh no longer links into" in: pinned: v2 (b571910), 2 skills linked in: <root>/my home/.claude/skills
FAIL: the link into the live clone in <root>/my home/.agents/skills was not removed
FAIL: the removal of the link into the live clone in <root>/my home/.agents/skills is not reported; expected "pin: removed <root>/my home/.agents/skills/gamma, in a folder pin.sh no longer links into" in: pinned: v2 (b571910), 2 skills linked in: <root>/my home/.claude/skills
FAIL: the link into the pinned worktree through a linked folder was not removed
FAIL: the removal of the link through a linked folder is not reported; expected "pin: removed <root>/my home/.agents/skills/plan, in a folder pin.sh no longer links into" in: pinned: v2 (b571910), 2 skills linked in: <root>/my home/.claude/skills
ln: <root>/my home/.agents/skills/land: File exists
FAIL: check mode did not fail on a link in <root>/my home/.agents/skills (exit 0)
FAIL: check mode did not name the link in <root>/my home/.agents/skills; expected "pin: <root>/my home/.agents/skills/land links to <root>/my home/.local/share/ordo-stable/land, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it" in: 
FAIL: pin mode passed with a link in <root>/my home/.agents/skills it could not remove
PASS: pin.sh scratch tests
```

Per case:

| Case | First run on the unchanged tree |
|---|---|
| A v1.0.0-shaped link `~/.agents/skills/land` into the pinned worktree: removed, with its line | red: not removed, no line |
| A link into the live clone: removed, with its line | red: not removed, no line |
| `find-skills` a real folder and `other` a link outside Ordo: both kept, no line | green (the unchanged pin does not read the folder) |
| Check mode with such a link left: exit 1, a line naming the link | red: exit 0, no line |
| `ORDO_SKILL_DIRS` set to the scratch `~/.claude/skills`: the link kept, no line | green (the unchanged pin does not read the folder) |

No case is one the brief's rules get wrong, so the build went on without a hand-back. The `ln: ... File exists` line is the next case's fixture meeting the link the unchanged pin left; with the change the link is gone and the line does not appear.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. A backed-out step prepared again | DONE | `python3 utils/check_skill_layout.py` (the text changes carry no executable test; see "Proof") | `ok: skills/spec/SKILL.md` among ten `ok:` lines, exit 0 |
| 2. The ledger's landing test runs on its own | DONE | the copy run below | `PASS: land.sh and usage.py scratch tests` |
| 3. The pin removes the links in `~/.agents/skills` | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 \| tail -1` | `PASS: pin.sh scratch tests` |
| 4. A step's commits only at its resume points | DONE | `grep -rn -i 'commit' skills/*/SKILL.md README.md docs/dev/*.md` | 85 hits, quoted and read below |
| 5. A worktree removal that works | DONE | `python3 utils/check_skill_layout.py` | `ok: skills/land/SKILL.md`, exit 0 |
| 6. The report | DONE | this file | |
| Verify 1: the verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | the lines below, exit 0 |
| Verify 2: pin tests | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 \| tail -1` | `PASS: pin.sh scratch tests` |
| Verify 3: the copy run | DONE | below | `PASS: land.sh and usage.py scratch tests` |
| Verify 4: the commit grep | DONE | below | 85 hits |
| Verify 5: ASCII over every changed file | DONE | `LC_ALL=C grep -n '[^ -~]' README.md skills/spec/SKILL.md skills/land/SKILL.md skills/land/templates/land.sh skills/land/templates/land.test.sh skills/plan/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-help/SKILL.md skills/refute/SKILL.md utils/pin.sh utils/pin.test.sh` | no output, exit 1 |
| Verify 6: each test's revert | DONE | the revert runs below | eight reds quoted; one audit named |

### Verify 1

From the worktree root, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: check_paths.py scratch tests
PASS: check_step.py scratch tests
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
verify: 13 commands passed
```

Eleven `PASS:` lines, ten `ok:` lines, `verify: 13 commands passed`. The ASCII command (the thirteenth) prints nothing when it passes. The `pin.sh` total moved only by the new block's assertions; no other test file changed.

### Verify 3, the copy run

`land.sh`, `land.test.sh`, `verify.sh` and `usage.py` copied from `skills/land/templates/` into a scratch folder `copy/` outside any skill folder, run from the scratchpad with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=<scratch>/emptyhome sh <scratch>/copy/land.test.sh 2>&1 | tail -1`:

```
PASS: land.sh and usage.py scratch tests
```

Control: the same run with only `land.sh` and `land.test.sh` in the folder (`copy2/`, the two files `/plan` copied before this step) prints `FAIL: verify.sh not found beside this test or in the land skill's templates`.

### Verify 6, the reverts

Each revert is a `sed` of a copy of `utils/pin.sh` beside a copy of `utils/pin.test.sh`, run under the same `env -u`; the first `FAIL:` line of each (`<root>` is the scratch root):

| Revert | Test it turns red | First `FAIL:` line |
|---|---|---|
| R1: the removal block in pin mode disabled (`if false`) | a link into the pinned worktree removed | `FAIL: pinning with links in <root>/my home/.agents/skills failed:  pin: <root>/my home/.agents/skills/gamma links to <root>/ordo/skills/gamma, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it` |
| R2: `"$repo"/*` dropped from both matches of `links_into_ordo` | a link into the live clone removed | `FAIL: the link into the live clone in <root>/my home/.agents/skills was not removed` |
| R3: the resolution of the target's folder replaced by `return 1` | a link through a linked folder removed | `FAIL: the link into the pinned worktree through a linked folder was not removed` |
| R4: `links_into_ordo` returns 0 for every link | a foreign link kept | `FAIL: the link to a folder outside Ordo in <root>/my home/.agents/skills was changed` |
| R5: the check-mode block disabled (`if false`) | check mode fails on such a link | `FAIL: check mode did not fail on a link in <root>/my home/.agents/skills (exit 0)` |
| R6: `\|\| continue` dropped after the `rm` of the removal | no line for a removal that failed | `FAIL: a link in <root>/my home/.agents/skills that could not be removed was reported` |
| R7: the `ORDO_SKILL_DIRS` condition replaced by `if true` | the folder left alone with `ORDO_SKILL_DIRS` set | `FAIL: the link in <root>/my home/.agents/skills was removed with ORDO_SKILL_DIRS set` |
| R8: the check that the list holds the folder made a no-op | the folder left alone when `$CLAUDE_CONFIG_DIR/skills` is it | `FAIL: pinning with CLAUDE_CONFIG_DIR at <root>/my home/.agents failed: pin: replaced <root>/my home/.agents/skills/beta, which linked into the live clone <root>/ordo` |

The assertion that the real folder `find-skills` is kept is an audit: no revert of the change turns it red, since the removal reads only entries that are links and have a target. Its control is R1's red on the link `land` removed in the same run.

The copy run of Verify 3 is an audit of item 2 as far as the step's own diff goes: `land.sh` and `land.test.sh` already looked beside themselves first, and item 2 changes which files `/plan` copies, which is text. The `copy2/` control above shows the two-file copy set red.

The skill texts of items 1, 4 and 5 have no executable test; they are checked by `python3 utils/check_skill_layout.py` and by the greps under "Verify 4" and "Names carried".

### Verify 4, the commit grep

`grep -rn -i 'commit' skills/*/SKILL.md README.md docs/dev/*.md` prints 85 lines; each was read against item 4. The hits in the six skills this step changes:

- `skills/spec/SKILL.md`: line 10 (the brief in the preparation commit), 50 and 52 (the preflight accepts uncommitted `plan.md` and state file, refuses one at the brief's path), 62 and 82 (the preparation commit), 85 (a refusal at Steps 4 makes no commit), 88 (the preparation commit, a resume point, carrying every ledger record on disk), 93 (the patch left uncommitted for the builder), 101 (the dispatch entry not committed at Steps 8), 108 (the wip commit on the branch), 116 (a new preparation commit), 120 (a stop, a resume point), 137 (a ruling not committed on its own), 150 (the preflight row), 170 (the rule).
- `skills/refute/SKILL.md`: line 10 (committed with the next resume point), 56 (report and usage carried by the next resume-point commit), 64 (the round's recorded commit, unchanged).
- `skills/plan-orchestration/SKILL.md`: line 51 (the launch commit), 59 (the report saved, not committed on its own), 61 (a ledger file uncommitted in the worktree, unchanged), 65 (the round-0 ruling committed as a round sent), 69 (reviewer recorded on disk), 72 (a round sent, committed), 81 (the landing report committed with the step), 102 to 105 (the resume points, the records they carry, the working tree read on takeover, the state file), 123 (an interrupted landing, unchanged), 151 (the earlier step's launch commit), 185 and 186 (landing commit times, unchanged).
- `skills/plan-help/SKILL.md`: line 61 (the landing's commit), 66 (the ruling committed by the next `/spec`).
- `skills/land/SKILL.md`: lines 3, 10, 15, 40, 45, 46, 53, 67, 74, 76, 84, 85, 108, 109, 142, 154, 156, 157, all about the landing's wip commit, cherry-pick and commit, the landing a resume point.
- `skills/plan/SKILL.md`: lines 10 and 65 (the plan's opening commit, before any step).

The other hits are in `skills/roadmap`, `skills/plan-retro`, `skills/ordo-init`, `skills/repo-setup`, `README.md` (lines 15, 33, 76, 119, 128, 158) and `docs/dev/` (`skill-layout.md:72`, `change-standard.md:33`). None of them is about a step's ledger commits: they are each skill's own commit of its own files, the repository's commit rule, test descriptions and the builder's no-git rule. `docs/dev/change-standard.md` is unchanged, since none of its sentences is made false. The templates were grepped too (`grep -rn -i 'commit' skills --include='*.md' | grep -v '/SKILL.md:'`): `skills/plan/templates/orchestrator-state.md` lines 3 and 56 ("Rewritten before every step commit") stay true under item 4.

The full grep output:

```
skills/ordo-init/SKILL.md:10:`/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.
skills/ordo-init/SKILL.md:30:3. The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11.
skills/ordo-init/SKILL.md:70:10. Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` changes, as Rules 4 says; and, when the skill runs alone, the question whether it may commit.
skills/ordo-init/SKILL.md:75:14. Commit the files written by explicit path list, in one commit whose subject names the plan configuration.
skills/ordo-init/SKILL.md:76:    - The commit is made only when the repository's commit rule ("What it reads" 3) allows it.
skills/ordo-init/SKILL.md:92:| The draft | Every setup, at Steps 11 | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |
skills/ordo-init/SKILL.md:97:| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, and the command that shows them (`git status --short`) | The user's commit |
skills/plan-help/SKILL.md:61:/land <entry> <step>          stops the step's agents, then onto main, checks on main, small fixes, the look where plan.yaml's look: says, the A/B, the usage rows, the booking, the commit
skills/plan-help/SKILL.md:66:"Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it
skills/land/SKILL.md:3:description: "Bring a refuted step from its worktree onto main and book it: the step's builder and reviewers stopped, a wip commit in the worktree, the cherry-pick of the whole range onto main, the verification commands on main, the look at the changed views where the configuration block's look: says, the interleaved A/B against the staged base binaries, the orchestrator's usage row, the booking in the plan, the state file rewritten, the landing report, the commit by explicit path list, the worktree and its branches removed. Refuses while a finding is left neither closed nor raised to the user as an open item, or with any red line. Triggers on: land <entry> <step>, land the step, cherry-pick the step, book the step."
skills/land/SKILL.md:10:`/land <entry> <step>` brings a refuted step from its worktree onto main. It leaves behind the step on main in one commit with its booking and its landing report, the state file rewritten, and the step's worktree and branches removed. After a red line no fix inside the brief closes, it leaves the step out of main instead, with its worktree and branches kept for `/spec` and the failure recorded in the step's Step 0 in `plan.md`.
skills/land/SKILL.md:15:/land <entry> <step>     the only way a step reaches main: bring the refuted step over, check it there, book it, commit it, remove its worktree
skills/land/SKILL.md:40:1. Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
skills/land/SKILL.md:45:3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's tree with the ledger root left out, and `git commit -q -m wip` when something is staged.
skills/land/SKILL.md:46:   - A builder that committed everything leaves nothing staged, and the landing makes no wip commit.
skills/land/SKILL.md:53:   - The ledger's `land.sh` leaves the ledger root out of the worktree's add, so a ledger file left uncommitted in the worktree (a builder's report, any other ledger copy) never reaches main; a ledger file that a commit of the range holds still does.
skills/land/SKILL.md:67:9. Produce the orchestrator's usage row with `templates/usage.py <session log> <from> <to>`: the session log is the running session's own, `<from>` the previous landing commit's `git log -1 --format=%cI`, `<to>` `date -Iseconds`.
skills/land/SKILL.md:74:    - Then the check of Steps 1 with what it showed, anything NOT DONE, what landed with the commit, what was found, and what is next.
skills/land/SKILL.md:76:13. Commit by explicit path: every path from `git diff --cached --name-only` plus the ledger files, the landing report among them.
skills/land/SKILL.md:84:    - A ledger file left modified means the commit missed the booking, and the head is amended with the ledger paths.
skills/land/SKILL.md:85:14. Remove the step's worktree and its branches `<step>` and `<step>-land`, as "Removing a step's worktree" says: `-D`, since the cherry-pick made a new commit and neither branch is an ancestor of main.
skills/land/SKILL.md:108:- It prints the diff stat, the usage rows (with `--session <session log> --since <previous landing commit time>`, the orchestrator's row through `usage.py`) and the staged paths.
skills/land/SKILL.md:109:- `templates/land.test.sh` proves it on scratch repositories, its verify list run and its lookup of `verify.sh` included, that its defaults run no browser step and no line count, and that a ledger file left uncommitted in the worktree never reaches main; it proves `templates/usage.py` on a Claude Code log and its refusal of a file that is not one.
skills/land/SKILL.md:142:- The last row is a refusal after the landing's commit: the step is on main, and only its worktree and branches are left.
skills/land/SKILL.md:154:- One step stays one implementation commit, which keeps each step traceable to its brief, its review and its booking.
skills/land/SKILL.md:156:- A landed commit is reverted only on the user's ruling. Its preparation commit stays, and only a step so reverted is booked as reverted.
skills/land/SKILL.md:157:- The state file is rewritten before the commit, so main's head always carries a state file that describes it.
skills/plan-orchestration/SKILL.md:51:   - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder", and the moment it is launched write its agent id into the dispatch block under `session_id` and commit the block by path, with every ledger record on disk since the last resume point; this is the dispatch entry's only commit.
skills/plan-orchestration/SKILL.md:59:6. On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed on its own, then read the whole diff.
skills/plan-orchestration/SKILL.md:61:   - A rule inventory the brief names is copied into the main ledger at its path the same way, since the ledger's `land.sh` leaves a ledger file left uncommitted in the worktree out of the landing.
skills/plan-orchestration/SKILL.md:65:   - Rule on such a case when the fix stays inside the step's scope, write the ruling into the ledger as the round-0 ruling file `agents/briefs/<step>-cases.md`, commit it by path as a round sent, and resume the same builder with it, by Steps 8's "How" and "Before the resume" with `round: 0`; the builder's final report carries the ruling.
skills/plan-orchestration/SKILL.md:69:   - Save its report, and write its path and its usage into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.
skills/plan-orchestration/SKILL.md:72:   - **Before the resume.** Write `round: n` into the dispatch block, and commit it by path with the round's brief and every ledger record on disk, a resume point.
skills/plan-orchestration/SKILL.md:81:    - The landing report is on disk at `agents/reviews/<step>-landing.md`, committed with the step, so the loop never ends its turn for a report.
skills/plan-orchestration/SKILL.md:102:- A step's commits are only the points another session resumes from: a stop (its open item and Step 0), the preparation commit, the dispatch entry once the builder's identity is in it, a repair round sent (its round brief and the round's entry), and the landing.
skills/plan-orchestration/SKILL.md:103:- Every other ledger record (a builder's report saved, a refuter report saved, a reviewer recorded, a ruling booked, a usage line) is written to disk in the main checkout and carried by the next of those commits.
skills/plan-orchestration/SKILL.md:104:- A record not yet committed is on disk in the main checkout, so a session taking over reads the ledger in the working tree as well as at main's head.
skills/plan-orchestration/SKILL.md:105:- The state file is rewritten before every step commit, so main's head always carries a state file that describes main's head.
skills/plan-orchestration/SKILL.md:123:- A booking present in the working tree but not committed, with the step's files staged, is a landing interrupted before its commit, and is finished before anything else.
skills/plan-orchestration/SKILL.md:151:- A later step is dispatched only after the earlier one's launch commit (Steps 4), so its base holds the earlier brief and dispatch entry.
skills/plan-orchestration/SKILL.md:185:- The orchestrator's row per step is its messages, output tokens, cache-write tokens, cache-read tokens, fresh input tokens and minutes, from the previous landing commit to this step's booking.
skills/plan-orchestration/SKILL.md:186:- `/land` produces it at its Steps 9 with the land skill's `templates/usage.py <session log> <from> <to>`: `<from>` is `git log -1 --format=%cI` on the previous landing commit, `<to>` is `date -Iseconds` at the booking, and the session log is the running session's own.
skills/plan/SKILL.md:10:`/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh` and `usage.py`, committed, and `agents/briefs/` and `agents/reviews/`, each holding an empty `.gitkeep`.
skills/plan/SKILL.md:65:7. Commit `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh`, `usage.py` and the two `.gitkeep` files by path as the plan's opening commit, with the roadmap entry's number in the subject.
skills/plan-retro/SKILL.md:10:`/plan-retro` turns the findings of every `/refute` run into proposed changes to the repository's rules. A finding the refuter keeps making is a rule the builder was not given, or was given where the brief did not point, or a check nobody runs. It leaves behind a retro report in the ledger and, for each proposal the user approves, the edit it proposes, committed together.
skills/plan-retro/SKILL.md:67:15. Commit the retro and the edited files by explicit path list, in one commit whose subject names the retro.
skills/repo-setup/SKILL.md:10:`/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block equal to the template. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced block.
skills/repo-setup/SKILL.md:47:   - The answer to question 5 is passed to it as the repository's commit rule, which its commit follows.
skills/repo-setup/SKILL.md:60:12. Commit the setup's other files in one commit by explicit path list, the subject naming the repository's setup.
skills/repo-setup/SKILL.md:61:    - Every file written is named, except those `/ordo-init` committed at Steps 8.
skills/repo-setup/SKILL.md:62:    - The commit is made only when the answer to question 5 allows it.
skills/repo-setup/SKILL.md:64:    - `.agents/skills/` and `.claude/` are ignored and not committed; `skills-lock.json` is.
skills/repo-setup/SKILL.md:82:9. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it; otherwise stop ("Stops").
skills/repo-setup/SKILL.md:90:5. The commit rule for this repository [commit only when told].
skills/repo-setup/SKILL.md:124:| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, and the command that shows them (`git status --short`) | The user's commit |
skills/refute/SKILL.md:10:`/refute <entry> <step>` dispatches one reviewer, who changes nothing and does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`, a list of findings each with a file and a line, or "none" under a heading, saved by the orchestrator or the session and committed with the next resume point.
skills/refute/SKILL.md:56:   - Both are written to disk in the main checkout and not committed on their own: the next resume-point commit carries them, as `plan-orchestration`'s "Resuming, and handing the plan over" says.
skills/refute/SKILL.md:64:3. Its diff is the delta of the round (from the commit or tree state recorded when the round was sent), read against the whole diff since the base.
skills/roadmap/SKILL.md:10:`/roadmap` shows, adds, moves, marks done and drops the entries of the file `.agents/plan.yaml`'s `roadmap:` key names. It leaves behind each change the user approved, committed on its own.
skills/roadmap/SKILL.md:46:5. Commit the files by explicit path list, one commit per change, the subject naming the entry and what changed.
skills/roadmap/SKILL.md:127:| Renumbering an existing entry | Entry numbers are referenced from ledgers, ADRs and commits, which then point at the wrong entry | "The format is the file's", Numbering |
skills/roadmap/SKILL.md:129:| Implementation narration, dates or history in entry text | They belong to the plan's ledger and the commits | Rules 2 |
skills/spec/SKILL.md:10:`/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief in the preparation commit, the dispatch entry written to the state file, the step's worktree at the base, and the base binaries copied aside.
skills/spec/SKILL.md:50:   - Uncommitted changes on the ledger's `plan.md` and state file are accepted: they hold ledger records written since the last resume-point commit (a ruling booked, a report saved), which the preparation commit carries (Steps 5).
skills/spec/SKILL.md:52:   - An uncommitted change at the brief's path `agents/briefs/<step>.md` is a refusal ("Stops"), named by path, since Steps 3 writes the brief there.
skills/spec/SKILL.md:62:   - That correction goes into the preparation commit (Steps 5).
skills/spec/SKILL.md:82:   - Exit 0 prints one `ok:` line, and the step goes on to its preparation commit.
skills/spec/SKILL.md:85:   - A refusal here leaves nothing: the brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none), `plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made.
skills/spec/SKILL.md:88:5. Make the preparation commit, a resume point ("Rules"): the brief, the ledger's `plan.md` with any amendment the premise checks forced, the state file, the patch of a step taken back out of main, and every other ledger record written on disk since the last resume-point commit, committed by path.
skills/spec/SKILL.md:93:   - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --check <patch>`, and when it passes, `git apply <patch>`, the changes left uncommitted for the builder, since the builder runs no git command.
skills/spec/SKILL.md:101:   - The entry is not committed here: it is committed once, when the builder's identity is in it, by `plan-orchestration`'s Steps 4 at launch, or, run by hand, by the session when it starts to build.
skills/spec/SKILL.md:108:1. Write `git diff <base> <step>` to `agents/reviews/<step>-backed-out.patch` in the ledger, `<base>` the entry's base; the branch `<step>` holds the builder's work and the landing's wip commit.
skills/spec/SKILL.md:116:   - Steps 5 makes a new preparation commit, Steps 6 a new worktree with the patch applied, and Steps 8 a new dispatch entry at `round: 0`, `landing: not-started`.
skills/spec/SKILL.md:120:1. Leave three things and nothing else: the open item in the state file (the step, what the tree shows against the step's text, the choice the user owns, one recommendation with its reasons); the same text under the step's Step 0 in `plan.md` or the part file it names; the ledger committed by path, a resume point, so the stop survives the session.
skills/spec/SKILL.md:137:   - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 5).
skills/spec/SKILL.md:150:| A failed preflight | Not on `main`, something staged, a git operation in progress, or an uncommitted change at the brief's path; uncommitted changes on the ledger's `plan.md` and state file are accepted (Steps 1) | What it saw | The tree put right, then `/spec` again |
skills/spec/SKILL.md:170:- A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them; every other record stays on disk in the main checkout until the next one.
docs/dev/change-standard.md:33:- No git command that changes state: no `add`, `commit`, `stash`, `checkout`, `mv`, `restore`. Reading with `git status`, `git diff` and `git show` is fine; a file is moved with `mv`.
docs/dev/skill-layout.md:72:| History in the skill: a version tag in a heading, "added in", a date | It tells the reader nothing about what to do now | The version in `metadata.version`; the history in the commit log |
README.md:15:| `land` | Cherry-picks a reviewed step onto `main`, runs the checks there, books the step, commits by explicit path, removes the worktree |
README.md:33:/land <entry> <step>          onto main, checks on main, the booking, the commit
README.md:76:A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the coding standard and the project skills; shows the whole tree and every file; and after approval writes `CLAUDE.md`, the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE` and `README.md`, installs the project skills (writing `skills-lock.json`), and runs `/ordo-init`.
README.md:119:- `land.test.sh` proves the landing on scratch repositories: a clean landing with the template's defaults, which runs no browser step and no line count, a conflicting one and its refused rerun, a builder that committed everything, an index lock held while a `git` process runs (the wait stopped at its bound, shortened for the test through `LANDING_LOCK_WAIT`), a stale lock removed, a lock gone before the bound, a stop at the bound after the worktree's checkout followed by a rerun that lands, a rerun refused when the landing branch holds a change made by hand or main holds staged changes, a bound that is not a whole number, a tool directory set on the `ADAPT` line, a ledger inside the repository whose files left uncommitted in the worktree never reach `main` (under a ledger root holding pattern characters, or written with a trailing `/` or a leading `./`, too), and a ledger root that is not a folder inside the repository refused. Each landing starts `land.sh` from a scratch ledger: a green verify list lands, a red one fails the landing with the `RED:` line of `verify.sh`, `verify.sh` is found in the repository's `.agents/skills` when the ledger lacks it, and a `verify.sh` found nowhere or a missing state file is refused before `main` is touched, the places named. It checks `usage.py` on a Claude Code log (one message counted once by its id, and log lines without an offset skipped), its refusal of a file that is not a Claude Code session log, and its refusal of a window time without an offset or unreadable. It checks that both example `plan.yaml` files carry exactly the keys the state template's configuration block needs, each optional key's value equal to its stated default; inside an Ordo checkout a missing example fails, and only a copy outside one skips the check.
README.md:128:- `check_rule_inventory.test.sh` checks that `check_rule_inventory.py` passes a complete inventory and fails each error it exists to catch: a header line missing or given twice, a commit that is not a hexadecimal id or not in the repository, an old path that is not a file in that commit, an old or new path outside the repository (a sibling folder whose name starts with the repository's included), a missing new file, an old or new file that is not UTF-8, a table header or cell count that is wrong, a row after the table, an old line with text in no row (reported at line 0), a range that is malformed, out of bounds (one line with its own singular message) or backwards, a range that crosses a blank line, a heading, a frontmatter delimiter or a fence boundary, or opens more than one list item (at any depth, with any marker), table row or frontmatter key, an empty rule, an unknown section or subsection (named under the longest section the place starts with), and an item number of 0 or past the end; and that none of these is an error: a YAML comment and a fenced `~~~` line needing a row, a row of dashes that is not a separator, an inventory table without a separator row, a row naming one heading line alone, fenced rows in the inventory, an escaped pipe in a rule, section names holding ` / ` or ending in a digit, fenced lines, nested bullets, indented tables and table headers not counted as items, a heading indented by up to three spaces read as a heading in the old and the new file, and a line separator or a lone carriage return inside a line of the old file, the new file or the inventory read as part of that line.
README.md:158:The worktree's add leaves the ledger root out, so a ledger file left uncommitted in the worktree (a builder's report, any other ledger copy) never reaches `main`; a ledger file that a commit of the range holds still does. The check of `land.sh` on `main` is the ledger's verify list: after the cherry-pick onto `main` it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root, and a non-zero exit fails the landing with the output of `verify.sh` printed. `/plan` copies `land.test.sh`, `verify.sh` and `usage.py` beside it. `land.test.sh` reads `landing_tool_path` and `landing_ledger_root` from `land.sh`, finds `verify.sh` and `usage.py` as `land.sh` does, and proves the landing on scratch repositories. The ledger's copies of `land.sh` and `land.test.sh` find `verify.sh` and `usage.py` beside themselves, so both run from the ledger with the four files beside each other, whatever `land` skill is installed.
```

### Names carried

`grep -rn -i 'dispatch commit\|second small commit\|worktree and branch \|land.test.sh. into the ledger\|runs from there only when' skills README.md docs utils` prints nothing, exit 1: the old wording for the dispatch commit, the single kept branch and the two-file ledger copy is gone from every file. `/spec`'s new path is named from `land` (Steps 6 and the note under Stops), `plan-orchestration` (Steps 9 and "Resuming, and handing the plan over") and `plan-help` (the red-line line). `~/.agents/skills` in `README.md` line 58 (the skills CLI install) and in the `land.sh` lookup of `verify.sh` is unchanged and still true.

## Files changed

| File | Lines now | `git diff --numstat` (+/-) |
|---|---|---|
| `README.md` | 187 | 4 / 2 |
| `skills/land/SKILL.md` | 157 | 24 / 11 |
| `skills/land/templates/land.sh` | 458 | 2 / 1 (head comment only) |
| `skills/land/templates/land.test.sh` | 903 | 3 / 2 (head comment only) |
| `skills/plan-help/SKILL.md` | 93 | 3 / 3 |
| `skills/plan-orchestration/SKILL.md` | 241 | 16 / 11 |
| `skills/plan/SKILL.md` | 91 | 7 / 7 |
| `skills/refute/SKILL.md` | 134 | 5 / 4 |
| `skills/spec/SKILL.md` | 170 | 40 / 11 |
| `utils/pin.sh` | 273 | 50 / 0 |
| `utils/pin.test.sh` | 525 | 87 / 1 |
| this report | | new |

Versions: `spec` 1.5.0 to 1.6.0, `land` 1.7.0 to 1.8.0, `plan` 1.8.0 to 1.9.0, `plan-orchestration` 2.8.0 to 2.9.0, `plan-help` 1.7.0 to 1.8.0, `refute` 1.5.0 to 1.6.0. `docs/dev/change-standard.md` is unchanged (see Verify 4).

## Judgment calls the brief left open

1. "Inside the pinned worktree, as the link names it, before or after the path is resolved": `links_into_ordo` compares the link's target as written against the resolved pinned worktree and live clone, then resolves the target's folder (`cd "$(dirname "$target")" && pwd -P`) and compares again. The folder is resolved rather than the whole target, since a v1.0.0-shaped target (`ordo-stable/land`) no longer exists once a tag keeps its skills under `skills/`. A relative target is read from the link's folder. A link whose folder does not exist is left alone.
2. The check-mode line is `pin: <link> links to <target>, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it`, on stderr like the other check lines.
3. Pin mode removes those links after its own linking loop and before its check after linking, so a link it could not remove prints no `removed` line and fails that check (tested, R6).
4. "`$HOME/.agents/skills` is not one of the folders it links into" is tested with `CLAUDE_CONFIG_DIR=$HOME/.agents` (R8); the folder is then in the list, and its links are handled as the list's.
5. The brief lists the files the patch does not apply to, but the brief is committed at Steps 5, before the worktree of Steps 6 exists. `/spec` Steps 3 therefore runs `git apply --check --cached <patch>` from main, whose index equals main's head after the preflight, and names the files on its `error:` lines. The base differs from main's head only in the ledger, so the worktree's check at Steps 6 names the same files. A probe on a scratch repository showed `git apply --check` naming every file that fails (`error: a: patch does not apply`, `error: n: already exists in index`), not only the first.
6. An empty diff also removes a patch an earlier back-out of the same step left in the ledger, so Steps 6 never applies a stale patch.
7. The patch write verifies itself (`git diff <base> <step> | cmp - <patch>`), by the change standard's rule 16; a write that does not compare equal is a refusal.
8. The worktree removal is written once, as the reference section "Removing a step's worktree" of `skills/land/SKILL.md`, and `/spec` names it, by the skill layout's "A rule is written once". Each skill's Stops table has its row. In `land` the row comes last, as a refusal after the landing's commit, and the note under the table says so.
9. A `/spec` refusal at Steps 4 after the backed-out path leaves that path's work done: the patch stays and the entry stays removed, and `/spec` run again prepares the step with the patch. The Stops note says refusals leave nothing beyond that path's work.
10. The preparation commit names its records through `git status --short -- <ledger>`, so every ledger record on disk since the last resume point is committed by path.
11. The round-0 ruling file's commit (`plan-orchestration` Steps 6) is written as "a round sent", the resume point it is.
12. The resume-point rule is written once, in `plan-orchestration`'s "Resuming, and handing the plan over"; `spec` Rules and `refute` Steps 7 name that section.

## User-visible changes, before and after

- **The backed-out path.** Before: `/land` kept a backed-out step's worktree and branch and sent it back "through `/spec`", and `/spec` had no text for it (its worktree add fails on the kept branch). After: `/spec` writes `git diff <base> <step>` to `agents/reviews/<step>-backed-out.patch`, removes the kept worktree and the branches `<step>` and `<step>-land`, removes the dispatch entry, and prepares the step from main's head. The new brief carries the Step 0 failure, the patch's path and the files it does not apply to; a new preparation commit, a new worktree with the patch applied uncommitted, and a new entry at `round: 0`, `landing: not-started` follow. `land`, `plan-orchestration` and `plan-help` point at it.
- **The four files a ledger holds.** Before: `/plan` copied `land.sh` and `land.test.sh`, and the ledger's `land.test.sh` failed with `FAIL: verify.sh not found beside this test or in the land skill's templates` unless an installed `land` skill held `verify.sh`. After: `/plan` copies and commits `land.sh`, `land.test.sh`, `verify.sh` and `usage.py`; "What it reads" 4 and the Stops row name all four; the copy run passes with an empty `HOME`.
- **The pin's removal in `~/.agents/skills`.** Before: `utils/pin.sh` neither read nor changed `~/.agents/skills`, and links a v1.0.0 pin made there stayed, naming paths a `skills/` tag does not have. After, with `ORDO_SKILL_DIRS` unset and the folder not in the list: check mode exits 1 with `pin: <link> links to <target>, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it` for each such link, and pin mode removes each one with `pin: removed <link>, in a folder pin.sh no longer links into`. On the user's machine the next `utils/pin.sh <tag>` would remove the ten links `land` to `spec` in `~/.agents/skills` and keep `find-skills` (read from `ls -la ~/.agents/skills`; the pin was not run).
- **The commits of a step.** Before: `/spec` made a second commit for the dispatch block, a ruling was committed on its own, and a refuter report and its usage were committed on their own; `/spec` refused an uncommitted `plan.md`. After: a step's commits are the stop, the preparation commit, the launch commit with the builder's identity, a repair round sent (the round-0 ruling file included) and the landing; the other records wait on disk in the main checkout and go with the next of those. `/spec` accepts an uncommitted `plan.md` and state file, saves `plan.md` aside and restores it from that copy on a Steps 4 refusal; an uncommitted change at the brief's path is still refused. A session taking over reads the working tree as well as the head.
- **The worktree removal.** Before: `/land` Steps 14 ran `git worktree remove <worktree_root>/<step>`, which git refuses while the builder's report or an orchestrator's ledger copy sits untracked in the worktree, and `<step>-land` was never deleted. After: `git status --porcelain --untracked-files=all` from inside the worktree must list only paths under the ledger root, or the removal is refused with the path named; then `git worktree remove --force` (on the ask list) and `git branch -D` of `<step>` and `<step>-land`, each only when it exists.

## Anything in the brief that was wrong or impossible

Nothing. The premises the step rests on were read as stated: `ls -la ~/.agents/skills` lists the ten links into `/Users/axelfaes/.local/share/ordo-stable/<skill>` and the real folder `find-skills`; `git show v1.0.0:utils/pin.sh` holds `skill_dirs="$HOME/.claude/skills $HOME/.agents/skills"`; the ledger's `land.test.sh` failure is reproduced by the `copy2/` control. The ordering the brief left implicit (the brief lists the files the patch does not apply to, yet is committed before the worktree exists) is judgment call 5.

## Ledger copy

At landing the orchestrator copies `skills/land/templates/verify.sh` and `skills/land/templates/usage.py` into `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/`, beside the ledger's `land.sh` and `land.test.sh`, and commits them. The ledger's `land.sh` and `land.test.sh` need no other change for that, since both look beside themselves first. The command that proves the ledger's test then runs on its own, from the repository root on main:

```sh
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$(mktemp -d)" sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/land.test.sh 2>&1 | tail -1
```

It must print `PASS: land.sh and usage.py scratch tests`. The same run on the four template files copied into a scratch folder printed that line (Verify 3); the ledger's own copies were not run here, since the builder writes nothing in the ledger but this report.
