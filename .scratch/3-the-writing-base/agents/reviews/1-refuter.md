# Step 1 refuter report (on .agents/worktrees/3-1, base c1de4b5)

Reviewer: a fresh claude:opus agent, read-only. Usage: 113,019 tokens, 20 tool uses, 470 s.

## Verification (rerun by the reviewer)

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"`, from the worktree root:

```
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.
verify: 7 commands passed
exit 0
```

- The `Can't open` line comes only from the unstaged deletion (`git ls-files -co --exclude-standard | grep prose-standard` lists both paths). On a scratch clone with the step's state committed over c1de4b5, `git diff --stat` shows a 100% rename, and the same verify command prints the six `PASS:` lines, no ASCII line, `verify: 7 commands passed`, exit 0.
- Cases 1 to 5 reproduced as the report gives them; the case-1 reverts of `.agents/plan.yaml`, `docs/dev/skill-layout.md` and `skills/repo-setup/SKILL.md` print the line the report quotes; `wc -l` gives 154, 72, 12 and 75; `LC_ALL=C grep -n "[^ -~]"` over the four touched files and the report prints nothing; `find skills/repo-setup/templates -type f` supports the new "What it reads" 1.

## 1. Spec

1. `README.md` lines 58 and 70: "The skills call each other and read each other's templates, so install all of them.", and the copy-install loop `for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec; do`. After the step `/repo-setup` reads the `writing` skill's `references/prose-standard.md` from a folder beside its own, and the loop does not copy `writing`. The brief's grep did not cover the skill list, so `README.md` was left out of the step's paths.
2. The `standards:` line of `.scratch/3-the-writing-base/orchestrator-state.md` still names the old path; the brief gives that change to the orchestrator at landing.

## 2. Proof

1. `1-report.md`: the DONE/NOT DONE row for the `SKILL.md` edits and the revert table row cite "the four `grep -n` lines of the SKILL.md check" with `lines found: 4` and `lines found: 0`, and never quote the four commands, so the output cannot be reproduced from the report (change standard rule 7). The four lines are correct by direct reading (lines 28, 30, 109, 146).

## 3. Standards

1. `skills/repo-setup/SKILL.md` line 30, "What it reads" 3: one item holds four inputs from three skills, against `docs/dev/skill-layout.md` row 4, "A numbered list, one input per item". The two-skill form existed at the base, and the brief asked for the same form.
2. Line 28, "What it reads" 1, lists the contents of `templates/` in one item; the same pattern at the base.

## 4. Behaviour

1. A copy install from the README's loop gets a `/repo-setup` that cannot find the prose standard: on a scratch install of the step's state, `ls inst/repo-setup/../writing/references/prose-standard.md` prints `No such file or directory`, while the roadmap skill's file is found. At the base the file was in `repo-setup` itself.
2. While `skills/writing/` has no `SKILL.md` (until step 4), `utils/pin.sh` (line 95) and the skills CLI route link only folders with `SKILL.md`, so a tag cut between step 1 and step 4 would install a `repo-setup` without its sibling `writing`. The installed skills stay at v2.0.0 unless `pin.sh <tag>` runs.
3. The ASCII check skips a tracked file missing on disk (perl prints `Can't open ...` without setting `$bad`). This is at the base, not caused by the step.

## Not checked

- Whether the skills CLI installs a folder without `SKILL.md` (network, and it writes outside the repository).
- The landing run on main itself; reproduced on a scratch clone only.
- A live `/repo-setup` run on a new repository.

## Repair round 1, refuted (on .agents/worktrees/3-1, base c1de4b5)

Reviewer: a fresh claude:opus agent, read-only. Usage: 121,092 tokens, 23 tool uses, 530 s.

### Verification (rerun by the reviewer)

`cd /Users/axelfaes/workspace/ordo/.agents/worktrees/3-1 && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"`:

```
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.
verify: 7 commands passed
exit 0
```

- On a scratch clone with the step's state committed over c1de4b5 (`git diff --stat c1de4b5 HEAD -M` shows the rename at 0 lines changed), the same command prints the six `PASS:` lines, `verify: 7 commands passed`, exit 0, and no `Can't open` line.
- Cases 1 to 5 reproduce: case 1 exit 1 with no line; case 2 `cmp exit 0` and `ls` prints only `change-standard.md`; case 3 `ok: ...`, exit 0; case 4 on a scratch copy `error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md`, exit 1; case 5 `PASS: sync_rules.py scratch tests`.
- The report's seven `grep -n` lines of the SKILL.md check print lines 28, 30, 31, 32, 33, 111 and 148 and `lines found: 7`; reverts r7 (`lines found: 0`), r8 (`lines found: 3`) and r1 reproduce.
- The scratch install from the README loop lists 11 folders, `writing` among them, and `inst/repo-setup/../writing/references/prose-standard.md` exists and matches its source (`cmp exit 0`); with `writing` dropped from the list the file is missing (`ls exit 1`).
- `grep -n "What it reads" skills/repo-setup/SKILL.md` prints only the heading; no reference in the tree points at a `repo-setup` "What it reads" number.
- Rulings 1, 2 and 3 of the round brief are closed as the rerun shows; ruling 4 except the row in Proof 1.

### 1. Spec

- none

### 2. Proof

1. `1-report.md` line 108, the revert row r2 of case 1, quotes `skills/repo-setup/SKILL.md:109:...`. After the round the tree line is line 111; the reviewer's rerun of r2 on a scratch copy prints `skills/repo-setup/SKILL.md:111:docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md`, exit 0. The row was not rerun after the round; the check still turns red.

### 3. Standards

- none

### 4. Behaviour

1. Behaviour 2 of the first review is not changed by the round: `utils/pin.sh` lines 94 to 98 link only folders with a `SKILL.md`, so until step 4 writes `skills/writing/SKILL.md` a pin at a tag holding this step links no `writing`.
2. The `standards:` line of `.scratch/3-the-writing-base/orchestrator-state.md` (line 16) still names the old path; the brief gives it to the orchestrator at landing (Spec 2 of the first review).

### Not checked

- Whether the skills CLI installs a folder without `SKILL.md`.
- How a live `/repo-setup` run resolves "beside this skill's folder" under a symlinked install.
- The landing run on main itself.

## Closed

- Spec 1 (README install loop and sentence): closed in repair round 1 (ruling 1); the round's reviewer reproduced the scratch install with `writing` beside `repo-setup`.
- Spec 2 and round Behaviour 2 (the state file's `standards` line): closed at landing, the line set to `skills/writing/references/prose-standard.md`, as the brief assigns to the orchestrator.
- Proof 1 (the SKILL.md check's commands not quoted): closed in repair round 1 (ruling 3); the round's reviewer reproduced the seven commands and reverts r7 and r8.
- Standards 1 ("What it reads" 3 holding three skills): closed in repair round 1 (ruling 2), one item per sibling skill.
- Standards 2 ("What it reads" 1 listing the contents of `templates/`): kept; the item names one input, the `templates/` folder, and its contents say what that input holds, which `docs/dev/skill-layout.md` row 4 ("one input per item") allows. The round brief ruled it one item.
- Behaviour 1 (a copy install without `writing`): closed in repair round 1 (ruling 1).
- Behaviour 2 and round Behaviour 1 (no `writing` link from `utils/pin.sh` until step 4): closed with no change. A pin needs a tag and the user's yes; `git tag` lists v2.0.0 as the newest tag and `plan.md` names no tag before the plan's closing, which comes after step 4 writes `skills/writing/SKILL.md`. The installed skills stay at v2.0.0 in the meantime, whose `repo-setup` holds the prose standard itself.
- Behaviour 3 (the ASCII check prints `Can't open` for a tracked file missing on disk): closed with no change. The line appears only in a worktree whose deletion is not yet committed; a missing file has no bytes to check, the exit status is not affected, and on main after the cherry-pick the deleted path is out of the index and not listed (reproduced on the round reviewer's scratch clone).
- Round Proof 1 (revert row r2 quotes line 109): fixed at landing, the row in `1-report.md` set to line 111 with the round reviewer's rerun output.
