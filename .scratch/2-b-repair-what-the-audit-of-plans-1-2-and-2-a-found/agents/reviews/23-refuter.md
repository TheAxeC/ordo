Review of step 23 of plan 2.B, worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-23, base 1bab359. I changed no file. Two findings, both in the skill texts; all four verification commands pass.

## Verification lines, verbatim

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
Can't open skills/plan-retro/templates/collect_findings.py: No such file or directory at -e line 1.
Can't open skills/plan-retro/templates/collect_findings.test.sh: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_paths.py: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_paths.test.sh: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_step.py: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_step.test.sh: No such file or directory at -e line 1.
Can't open utils/check_rule_inventory.py: No such file or directory at -e line 1.
Can't open utils/check_rule_inventory.test.sh: No such file or directory at -e line 1.
Can't open utils/check_skill_layout.py: No such file or directory at -e line 1.
Can't open utils/check_skill_layout.test.sh: No such file or directory at -e line 1.
verify: 7 commands passed
```
The ten `Can't open` lines come from the ASCII check's perl. `git ls-files -c` still lists the deleted files because the deletions are not staged in the worktree. They print no offending line, and the exit is 0.

2. The brief's grep printed hits only in `docs/roadmap.md`, at lines 22, 135 and 137.

3. `ls` of the ten deleted files: each printed `ls: <path>: No such file or directory`.

4. `LC_ALL=C grep -n '[^ -~]'` over every modified file plus `23-report.md`: no output, exit 1.

**Scratch walks** (in `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/refute-23/`):

- **/land's removal after its commit (`r1`).**
  - `land.sh s1 <base>` from the template exited 0, and `git commit` made the landing commit on main.
  - `git status --porcelain --untracked-files=all` inside the worktree (on `s1-land`) printed only `?? .scratch/p/agents/reviews/s1-report.md`.
  - `git worktree remove --force` exited 0, and `git branch -D` deleted `s1` and `s1-land`.
  - The landing commit holds all 4 files of the step. No work was lost.
- **/spec's back-out (`r2`).**
  - Setup: verify list `false`. `land.sh` printed `RED: false`, and main was backed out with `git restore --staged --worktree` and `git rm --cached` plus delete.
  - Main then deleted `b.txt`, renamed `c.txt` to `c2.txt`, and changed `a.txt` and `bin.dat`.
  - The status check listed only the ledger report.
  - `git diff --binary <base> s1` twice: `cmp` found them identical, with 6 files including 2 binaries.
  - The worktree and both branches were removed, the entry removed, and the preparation commit made. `git worktree add` at the new base succeeded.
  - The first `git apply --3way` printed `error: b.txt: does not exist in index` and `error: c.txt: does not exist in index`, exit 1, and applied nothing.
  - The rerun with `--exclude=b.txt --exclude=c.txt` left `UU a.txt` with markers, `UU bin.dat`, and `A new.txt` and `A newbin.dat`.
  - `git checkout --theirs -- bin.dat` gave the step's copy: `cmp` against both stage 3 and the old step commit's blob matched.
  - After the conflict in `a.txt` was resolved and the change was redone in `c2.txt`, `land.sh` staged `a.txt bin.dat c2.txt new.txt newbin.dat` on main.
  - Every step worked. No work was lost beyond the skipped files, which the brief section lists for rebuilding.

## Spec

1. **Files that share a line-range split get no judgment, and three texts contradict each other on it.**
   - Where: `skills/spec/SKILL.md:87-88` against `skills/plan-orchestration/SKILL.md:156` and `skills/plan/templates/orchestrator-state.md:25`.
   - What the texts say:
     - spec line 88: "A shared path is the same file in both briefs, named whole in one of them, or line ranges of one file that overlap."
     - spec line 87: "No shared path: the step goes on to its preparation commit."
     - plan-orchestration line 156: "Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple. It writes that judgment in the later step's dispatch entry as `shared_paths:`".
     - The state template's line 25: "A step dispatched while another in flight names a file its brief also names carries shared_paths".
   - The failure: take step A's brief with `` `README.md` lines 10-20 `` and step B's brief, in flight, with `` `README.md` lines 50-60 ``.
     - Following `/spec` Steps 4 as written, the ranges do not overlap, so there is no shared path. The step goes on with no judgment, and its entry carries no `shared_paths:`.
     - Following plan-orchestration and the state template, both briefs name `README.md`, so the step may run only on the orchestrator's judgment, and its entry must carry `shared_paths:`.
   - So the texts give contradictory instructions. `/spec` also keeps the old exemption for non-overlapping ranges, which brief item 3 removes: "Two steps may be in flight at once even when their briefs name the same file, if and only if the orchestrator judges that merging them at landing is simple."

## Proof

none

## Standards

none

## Behaviour

1. **A stopped worktree removal cannot be resumed from the ledger.**
   - Where: `skills/land/SKILL.md:124` and the Stops row at line 146.
   - What the texts say:
     - Removal step 1: "Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 11, before the state file was rewritten ... no path or branch is built from the step id."
     - The Stops row "A worktree that cannot be removed" is resumed by "The cause put right ... then Steps 14 again". The bullet under the table says it "leaves no open item".
   - The sequence, followed as written:
     1. Steps 11 removes the step's dispatch entry from the state file.
     2. Steps 13 commits that.
     3. Steps 14 stops, because the worktree holds a non-ledger path. This is reachable, for example when `landing_tool_path` is narrower than `.` and the builder touched a file outside it.
   - Resuming in any later session, including after a handover (plan-orchestration "Resuming"):
     - The committed state file has no entry, so there is no `worktree` to read.
     - The text forbids building the path from the step id.
     - `/land` run again refuses on "No dispatch block" (What it reads 3).
     - No open item or other ledger record names the worktree.
     - Plan-orchestration's "On every resumption" rules have no case for a landed step whose worktree is still there.
   - So "Steps 14 again" cannot be carried out from the files, and the worktree and both branches stay forever with nothing recording them.
   - The previous text built the path from the step id (`git worktree remove <worktree_root>/<step>`), so this resume path is new with this step.

## Not checked

- The step-22 parts of `land.test.sh`, `pin.sh` and `pin.test.sh`, beyond their tests passing in the verify run.
- The interaction of the back-out steps with a sparse checkout (`worktree_paths`).
- A back-out interrupted between removing the worktree and branches and removing the dispatch entry.
- `README.md`'s prose descriptions of `land.test.sh` and `pin.test.sh` compared case by case with the test files.
- Whether the builder reads the brief's section "The patch as applied" from the main ledger or from the worktree's copy at the base.

## Usage

About 35 tool calls, run in the foreground only. Token count not measured.

## Repair round 1, refuted

Review of repair round 1 of step 23 of plan 2.B. Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-23. Base: 1bab359. I changed no file in the repository. A scratch walk ran in /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/refute-23-r1/.

### Verification lines, verbatim

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` exited 0:
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
Can't open skills/plan-retro/templates/collect_findings.py: No such file or directory at -e line 1.
Can't open skills/plan-retro/templates/collect_findings.test.sh: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_paths.py: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_paths.test.sh: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_step.py: No such file or directory at -e line 1.
Can't open skills/spec/templates/check_step.test.sh: No such file or directory at -e line 1.
Can't open utils/check_rule_inventory.py: No such file or directory at -e line 1.
Can't open utils/check_rule_inventory.test.sh: No such file or directory at -e line 1.
Can't open utils/check_skill_layout.py: No such file or directory at -e line 1.
Can't open utils/check_skill_layout.test.sh: No such file or directory at -e line 1.
verify: 7 commands passed
```
The `Can't open` lines come from the ASCII check's perl reading deletions that are not staged. They do not change the exit code.

2. The brief's grep printed hits only in `docs/roadmap.md`, at lines 22, 135 and 137.

3. `LC_ALL=C grep -n '[^ -~]'` over the 21 added or modified files (`git diff --name-only 1bab359 --diff-filter=AM`), plus `23-report.md` and `23-round-1.md`: no output, exit 1.

### Closures

- **Spec 1 is closed.**
  - `skills/spec/SKILL.md:88` now reads: "A shared path is a file both briefs name, whatever lines each names. It is not a refusal: it goes to the orchestrator's judgment". This agrees with `plan-orchestration/SKILL.md:157` and `skills/plan/templates/orchestrator-state.md:25`.
  - The overlap exemption was replaced by the judgment. No guard was removed.
  - `grep -rn -i "line range\|overlap\|disjoint\|same file\|shared path\|shared_paths"` outside `.scratch` and `.git` finds no sentence that still exempts separate line ranges. The only hits outside the step texts are unrelated: `docs/academic-coverage.md:121` "non-overlapping focus", and `brief.md:33` "Read, with line ranges".
- **Behaviour 1 is closed for the case it named**, a path outside the ledger root. Followed in order from the committed files:
  1. Steps 14 stops.
  2. The Stops row at `land/SKILL.md:146` books the open item in the state file with the worktree path, both branches and the cause, and commits it by path as a resume point.
  3. A later session reads it through `plan-orchestration/SKILL.md:132` ("A landed step whose worktree is still there is named by its open item").
  4. It runs "Removing a step's worktree" on the names the open item gives, and closes the open item.
  - No step of that sequence needs the removed dispatch entry.
  - A related sub-case is not resumable: when the removal fails after the worktree is already gone. It is Behaviour 1 below.

### Spec

none

### Proof

none

### Standards

none

### Behaviour

1. **A removal stopped after `git worktree remove` succeeded cannot be resumed as the texts are written.**
   - Where: `skills/land/SKILL.md:125-128` ("Removing a step's worktree", steps 2 and 3), read with the Stops row at line 146 and `plan-orchestration/SKILL.md:132`.
   - The Stops row covers "a removal command fails". Step 4 guards each branch with "each only when it exists". Steps 2 and 3 have no such guard: step 2 runs `git status` "From inside the worktree", and step 3 runs `git worktree remove --force <worktree>`.
   - The sequence, run in the scratch repository `refute-23-r1/repo`:
     1. The landing commit is made.
     2. `git worktree remove --force ../wt` exits 0.
     3. `git branch -D s1` fails with `cannot lock ref 'refs/heads/s1' ... File exists` and exit 1, which is the Stops row's "a removal command fails". `s1-land` is deleted.
     4. The open item names `../wt`, `s1` and `s1-land`, and the lock is then removed as the cause put right.
     5. The resume runs "Removing a step's worktree" on those names. Step 2 cannot enter the worktree (`cd: no such file or directory: ../wt`). Step 3 prints `fatal: '../wt' is not a working tree` with exit 128.
   - The wrong result:
     - By the Stops row, the failed command is another stop, so the removal never reaches step 4. `git branch` still lists `s1`.
     - `plan-orchestration:132` covers only "A landed step whose worktree is still there". It has no case for a worktree that is gone while its branch is left.
     - So the branch stays, and the open item can never be closed by following the texts.
   - What would close it: steps 2 and 3 run only when the worktree exists, as step 4 already does for the branches. The resumption case would then also cover a branch that is left.

### Not checked

- There is no snapshot of the tree before the round, so I could not diff the round against the builder's first delivery directly. The evidence that the round changed nothing beyond its two rulings is indirect:
  - File modification times: only `skills/spec/SKILL.md`, `skills/land/SKILL.md` and `skills/plan-orchestration/SKILL.md` (22:07:56) and `23-report.md` (22:12:18) were written after the round brief (22:07:23). Every other changed file dates from 21:47 to 21:50, the state template included.
  - Line numbers: the first review's quoted lines still line up. Spec 87-88 and land 124, 146 and 151 are unchanged, and plan-orchestration's "Two steps in flight" line moved from 156 to 157, which matches the one inserted line 132.
  - I did not compare the text of those three files word by word with the builder's first delivery.
- Whether an open item whose fix is the user putting a cause right, rather than giving a ruling, fits the open-items header "only what the user must rule on". The header lists "a stop", and the land row is a stop.
- A session that dies between the land stop and its commit. This is general to every stop and not specific to this round.
- The step-22 parts of `land.sh`, `pin.sh` and their tests, beyond passing in the verify run.


## Closed

- First review, Spec 1 (a shared file exempted when line ranges do not overlap): closed in repair round 1; `skills/spec/SKILL.md` Steps 4 names any file both briefs name, as the review over the round confirmed.
- First review, Behaviour 1 (a stopped worktree removal not resumable after the landing commit): closed in repair round 1; the Stops row leaves an open item naming the worktree and branches, as the review over the round confirmed.
- Repair round 1, Behaviour 1 (a removal stopped after `git worktree remove` succeeded): fixed at landing; "Removing a step's worktree" steps 2 and 3 run only when the worktree still exists, and `plan-orchestration` "On every resumption" covers a worktree or branches left.
