# Refuter report: step 21

## Verification

From the worktree root `/Users/axelfaes/workspace/ordo/.agents/worktrees/2b-21`:

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"`
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: check_paths.py scratch tests
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

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/spec/templates/check_step.test.sh 2>&1 | tail -1`
```
PASS: check_step.py scratch tests
```

`python3 skills/spec/templates/check_step.py <plan.md> 21` and `... 7d`
```
ok: step 21 has the user's authority: (ruling W) (ruling U) (ruling V) (ruling X)
exit 0
refused: step 7d is removed: its line starts with Removed by; the user's ruling is needed
exit 1
```

check_step.py was run for every step of the real plan.md (1 1a 1c 2 3 4 5 6 6a 7 7a 7b 7c 7d 8 9 10 11 12 13 14 15 16 20 21 17 17a 18 19, plus 1b and 22). Every tagged step printed `ok:` with exit 0. 7a, 7b, 7c and 7d each printed `refused: step 7x is removed: its line starts with Removed by; the user's ruling is needed` with exit 1. 1b and 22 exited 64 with the list printed. The tags match the approved list at 9be174e: `git show 9be174e:<plan.md>` lists steps 1 to 19, and exactly those steps carry `(approved)`.

The report's own commands were rerun:
- The sed that removes step 17's tag, then check_step on the copy: `refused: step 17 ends with neither (approved) nor (ruling <name>); the user's ruling is needed`, exit 1.
- 17, 17a, 18 and 19: the four `ok:` lines as quoted.
- `grep -n 'oculus\|8792\|npm\|find src' skills/land/templates/land.sh`: exit 1, no output.
- The ADAPT grep: `117:landing_tool_path=.` and `119:landing_ledger_root=.scratch`.
- Every line number the report cites (spec 38-39, 50-55, 121-122, 127; README 112, 125; building 12; change-standard 48; plan.md line 87 for Open item E) and every file line count in its Files table.

The same checks reproduced: all of them matched.

Reverts, run on copies under the scratchpad (`refute-21/`):
- check_step.py: 8 of 9 mutations turn the test red: IGNORECASE dropped, only the last tag read, `Open item E:` named E, CR not stripped, duplicate check dropped, removed check dropped, the `(the user)` end anchor dropped, indented items read.
- land.sh: all 6 mutations turn land.test.sh red, with the first FAIL lines the report quotes: exclude pathspec dropped, core.excludesFile dropped, the line count put back, the ledger-root validation dropped, the pattern escaping dropped, `literal` dropped.
- Baseline: the scratch copy of land.test.sh prints `PASS: land.sh and usage.py scratch tests`.
- A ledger-shaped copy (land.sh and land.test.sh only) prints `FAIL: verify.sh not found beside this test or in the land skill's templates` under the real HOME. The installed land skill `~/.agents/skills/land -> ~/.local/share/ordo-stable/land` holds only land.sh, land.test.sh and usage.py.
- The same copy under a scratch HOME whose `.agents/skills/land/templates` holds the worktree's verify.sh and usage.py prints `PASS: land.sh and usage.py scratch tests`.

## Spec

1. The report's first line says "Everything in the brief is done", but item 8 is not done on the tree. Item 8 says "every sentence the changes make false is changed with them". The report itself lists four stale sentences it did not change: `skills/plan-help/SKILL.md:68`, `skills/plan-help/SKILL.md:70`, `skills/plan/templates/orchestrator-state.md:47` ("<when the ledger holds a landing script: ...>") and `skills/repo-setup/templates/docs/dev/change-standard.md:34`. The brief's path list is the cause, and the report states that under "Wrong or impossible". The first line and the DONE row "Rule 14 grep: DONE, with Doc text" still present a partial item as done. Rule 7 of `docs/dev/change-standard.md` requires the NOT DONE part on the first line.

2. `skills/plan-orchestration/SKILL.md:164` adds a bullet that no item asks for: "- A step booked into the step list without the user's ruling carries no authority tag, and `/spec` refuses it until the user's ruling adds one." Line 48 adds that this refusal is raised as a stop of the kind "A finding that is the user's".
   - Item 3 asks only that a ruling which adds or splits a step gives the new line `(ruling <name>)`.
   - The added bullet decides that every booked step now waits for a user ruling. That is a change to the loop, and the report's judgment call 10 says "the user may want to confirm that". Rule 4 of the change standard reserves such a choice for the user: it should be raised, not written as a rule.
   - Four sentences contradict it:
     - `skills/plan-orchestration/SKILL.md:172`: "A finding that needs no ruling is not an open item; it is a step in the plan".
     - `skills/land/SKILL.md:131`: "A red line booked in the booked list is not a stop: ... the booked step is worked in queue order". This file is inside the step's paths.
     - `skills/plan/templates/orchestrator-state.md:34`: "## Booked, no ruling needed (... each is a step in plan.md and is worked in queue order".
     - `skills/plan-help/SKILL.md:70`.
   - The conflict comes from rulings U 4 and X (a), which say nothing about steps the orchestrator books. It should reach the user as an open item. For example: a `(booked)` tag, or a ruling per booked step.

3. The premise "6a `(ruling The plan cut to its goal)`" in the preparation commit, which ruling X asks the reviewer to check. `git log -S'- 6a '` shows 6a entered plan.md at e9633bd, step 6's landing, as a step the orchestrator booked. The ruling "The plan cut to its goal" (e2b5754, later) rewrote 6a's scope ("step 6a's word-list tuning, replaced by the collector keeping every finding"); it did not add 6a. The tag is defensible because the user ruled on 6a's content. It is recorded here because it is the only tag whose ruling does not add its step.

## Proof

1. `check_step.test.sh` lines 127-134 assert as expected that `(ruling E)` is refused when the Rulings section holds `- Open item E: (b), ... (the user).`. The test passes `(ruling Open item E:)` as the control.
   - The name `Open item E:` has a trailing colon, and no one booking a ruling would write it in a tag. The name a person writes is `E`.
   - On the real plan it bites: a copy of plan.md with step 7's tag changed to `(ruling E)` gives `refused: step 7 names no ruling of the user in the Rulings section: (ruling E); the user's ruling is needed`, exit 1.
   - The spec booking text (`skills/spec/SKILL.md:108`) documents only the `- Open item <L> (<date>):` form, so nothing tells a reader how to name this line.
   - The behaviour follows the brief's literal naming rule, and the report's judgment call 4 names it. The test still pins a result the user would call wrong, which rule 9 forbids. The rule should read `Open item <L>` followed by ` (` or `:` (the mutation `Open item ([A-Za-z]+)[ :]` does this), and that needs the orchestrator's ruling on the brief's text.

2. A documented rule of check_step.py has no test that fails without it. The head comment (lines 6-8) says "each section runs to the next heading of level one or two". The mutation `#{1,2}` to `#{1,3}`, which makes a `###` heading end a section, leaves `check_step.test.sh` green (`PASS: check_step.py scratch tests`). No case puts a `###` heading inside the step list or the Rulings section.

3. The ledger root taken from `.agents/plan.yaml` is an untrusted value (rule 15). The ledger-root validation in `land.sh:122-128` accepts values that the ignore pattern then fails to match:
   - `landing_ledger_root=.scratch/` gives the pattern `/.scratch//`. In a scratch repository, `git -c core.excludesFile=<file holding /.scratch//> check-ignore -v .scratch/p/f` exits 1 (not ignored); `/.scratch/` exits 0.
   - `./.scratch` gives `/./.scratch/`, which also does not match (check-ignore exits 1).
   - In both cases the pathspec exclude of the add still works, but the worktree's checkout of main would stop on the builder's report, the failure the core.excludesFile setting exists to prevent.
   - No case covers a trailing slash or a leading `./`. The fix is to normalise the value, or refuse it in the validation.

4. The state file's verify list does not run `check_step.test.sh`. The report says so and gives the line to add. Until the orchestrator adds that line at landing, the new test runs in no landing check.

## Standards

1. A head comment and the README say more than the code does.
   - `skills/land/templates/land.sh:17-20` says a builder's report "or any other ledger copy in the worktree never reaches main: the ledger is written only on main".
   - `README.md` (The landing script) says "a builder's report or any other ledger copy in the worktree never reaches `main`".
   - That holds only for files left uncommitted. `land.sh:368` runs `git cherry-pick -n "main..$landing_pkg-land"` with no pathspec, so a ledger file that a commit of the range holds reaches main. The same head comment names "a builder that committed everything" as a supported case.
   - `skills/land/SKILL.md:53` states the limit correctly ("a ledger file that a commit of the range holds still does"). The head comment and README contradict it, which rule 14 treats as a defect.

2. `skills/plan/SKILL.md`, "What it reads", does not list the `land` skill's `templates/land.sh` and `templates/land.test.sh`, although the new Steps 5 copies them. `docs/dev/skill-layout.md`, Sections row 4, requires one input per item. No Stops row covers the templates not being found.

3. The stale sentences of Spec 1 remain on the tree. `skills/plan/templates/orchestrator-state.md:47` ("<when the ledger holds a landing script: ...>") is false now that every ledger holds one. `skills/repo-setup/templates/docs/dev/change-standard.md:34` still says a builder edits only its report, while `plan-orchestration` Steps 4 now lets it write a rule inventory.

4. ASCII check: `LC_ALL=C grep -n '[^ -~]'` on every changed and new file prints nothing. The em dash and spaced-dash scan finds only the `--` of code spans already present at `skills/land/SKILL.md:59`, `:76` and `skills/spec/SKILL.md:77`. No hard wraps were found among the added Markdown lines. No history in comments.

## Behaviour

1. The report does not state the before and after of Spec 2: steps the orchestrator books (the booked list, a red line booked at landing, work left after the last repair round) used to be worked in queue order with no ruling. Under the new texts, `/spec` refuses them and the refusal is raised as a stop for the user.

2. The ledger copy of `land.test.sh` runs only when the installed `land` skill holds `verify.sh`. `skills/land/SKILL.md:109` says "The copy of `templates/land.test.sh` in the ledger finds `verify.sh` and `usage.py` as `land.sh` does, and runs from there".
   - Today the installed skill (`~/.agents/skills/land` and `~/.claude/skills/land`, both linked to `~/.local/share/ordo-stable/land`) holds only land.sh, land.test.sh and usage.py, and a ledger-shaped copy fails with `FAIL: verify.sh not found beside this test or in the land skill's templates`.
   - With verify.sh installed it passes. The report's "Ledger copy" commands for this plan's ledger will therefore fail until the pin of ruling W. The report does not say this.

3. `land.sh`'s worktree checkout now runs under `core.excludesFile=<scratch file>`, so for that one command the user's global ignore file is not read. The report's judgment call 6 states this; recorded here as a visible change with no test.

## Not checked

- The land.sh revert that puts the browser step back (port check and `npm run test:browser`); the other six land.sh reverts were reproduced.
- The ledger copy of land.test.sh placed inside this plan's real ledger, which also runs the check of the example plan.yaml files inside an Ordo checkout. It was not run because it would need a write under the ledger.
- A tracked ledger file modified in the worktree, which main also changed since the base. By reading the code, the checkout of main would then stop (not run).
- `sh utils/check_rule_inventory.py` on a real inventory at the new `<ledger>/inventories/<skill>.md` path: the step writes no inventory.

## Usage

- Reviewer: claude:opus, a fresh background agent: 185334 tokens, 54 tool uses, 16.9 min.
