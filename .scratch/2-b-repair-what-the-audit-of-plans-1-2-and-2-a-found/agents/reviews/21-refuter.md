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

## Repair round 1, refuted

### Verification

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

`python3 skills/spec/templates/check_step.py /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md <step>` for every step of the list, plus 1b and 22:
```
ok: step 1 has the user's authority: (approved)                                  exit 0
ok: step 1a has the user's authority: (ruling H)                                 exit 0
ok: step 1c has the user's authority: (ruling J)                                 exit 0
ok: step 2 ... 3 ... 4 ... 5 ... 6: (approved)                                   exit 0 each
ok: step 6a has the user's authority: (ruling The plan cut to its goal)          exit 0
ok: step 7 has the user's authority: (approved)                                  exit 0
refused: step 7a is removed: its line starts with Removed by; the user's ruling is needed   exit 1
refused: step 7b is removed: ...                                                 exit 1
refused: step 7c is removed: ...                                                 exit 1
refused: step 7d is removed: its line starts with Removed by; the user's ruling is needed   exit 1
ok: step 8 ... 16: (approved)                                                    exit 0 each
ok: step 20 has the user's authority: (ruling U)                                 exit 0
ok: step 21 has the user's authority: (ruling W) (ruling U) (ruling V) (ruling X) (ruling Y)   exit 0
ok: step 17 has the user's authority: (approved)                                 exit 0
ok: step 17a has the user's authority: (ruling T)                                exit 0
ok: step 18 has the user's authority: (approved)                                 exit 0
ok: step 19 has the user's authority: (approved)                                 exit 0
error: step 1b is not in the step list of <plan.md>: 1, 1a, 1c, 2, 3, 4, 5, 6, 6a, 7, 7a, 7b, 7c, 7d, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20, 21, 17, 17a, 18, 19   exit 64
error: step 22 is not in the step list of <plan.md>: (same list)                 exit 64
```
The lines for steps 2 to 6 and 8 to 16 are shortened here. Each printed `ok: step <n> has the user's authority: (approved)`.

These commands from the report's "Repair round 1" table were rerun, and every output matched:
- `grep -rn -i 'booked list\|no ruling needed\|queue order' skills docs README.md | grep -v roadmap.md`: no output, exit 1.
- `grep -n 'no new ruling' ...`: `skills/land/SKILL.md:61`, `:131`, `skills/plan-orchestration/SKILL.md:78`, `:110`, `skills/plan-help/SKILL.md:70`.
- Versions: `refute` 1.5.0, `plan-help` 1.7.0, `spec` 1.5.0, `plan` 1.8.0, `plan-orchestration` 2.8.0, `land` 1.7.0.
- The `uncommitted` grep: `land.sh:19`, `README.md:158`, `skills/land/SKILL.md:53`, `:108`. The `land.sh` head comment is at lines 17-21.
- `skills/plan/SKILL.md`: "What it reads" 4 at line 37, and the Stops row at line 75.
- `lacks your authority` at `plan-help/SKILL.md:68`; `the ledger's landing script` at `orchestrator-state.md:45`; `rule inventory` at the repo-setup `change-standard.md:34`.
- `v1.0.0` at `skills/land/SKILL.md:109` and `README.md:158`.
- `wc -l` gives every count in "Files after the round".

Reverts, run on copies under `.../scratchpad/refute-21-r1/`:
- check_step.py, `OPEN_ITEM` put back to `Open item ([A-Za-z]+) \(`: `FAIL: Open item E: named E: exit 1, expected 0 [refused: step 7 names no ruling of the user in the Rulings section: (ruling E); the user's ruling is needed] []`
- check_step.py, the open item line also named by the text before its first ` (`: `FAIL: Open item E: not named by its text: exit 0, expected 1 [ok: step 8 has the user's authority: (ruling Open item E:)] []`
- check_step.py, `#{1,2}` to `#{1,3}`: `FAIL: a subheading in both sections: exit 64, expected 0 [] [error: step 2 is not in the step list of .../plan-11.md: 1]`
- check_step.py, only the Rulings section cut at a `###` line (the step list left as it is): `FAIL: a subheading in both sections: exit 1, expected 0 [refused: step 2 names no ruling of the user in the Rulings section: (ruling K); the user's ruling is needed] []`. The ruling half of the case bites on its own.
- land.sh, the trailing-`/` branch removed: `FAIL: slash: exit 1, expected 0: error: The following untracked working tree files would be overwritten by checkout:`
- land.sh, the leading-`./` branch removed: `FAIL: dot: exit 1, expected 0: error: The following untracked working tree files would be overwritten by checkout:`
- land.sh, the ledger-root check removed: `FAIL: ledger root []: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made`
- land.sh, the add's pathspec given the value as written instead of the normalised one: `PASS: land.sh and usage.py scratch tests`. This is not a gap in the tests. A probe in a scratch repository shows that git reads `:(exclude,literal)X` the same for `./.scratch`, `.scratch/`, `.scratch//` and `././.scratch` (each staged only `y`). The normalisation of the pathspec therefore changes nothing that can be observed.
- Baselines: the unmodified copies print `PASS: check_step.py scratch tests` and `PASS: land.sh and usage.py scratch tests`.

### Closures

1. Ruling 1 (no booked list): closed in part. The grep over README.md, docs/, skills/ and utils/ for `booked`, `book it`, `booked list`, `no ruling needed`, `queue order` and `booking` leaves only allowed uses:
   - the landing's record (land description, lines 10, 15, 55, 57, 64, 65, 68, 79, 83, 137, 141, 143; plan-orchestration 3, 56, 88, 118, 180, 181; README 15, 33, 151);
   - an item booked in the open items (land Stops row at 117; spec Stops rows at 119 and 120; plan-orchestration 133, 207 and the Anti-patterns row at 223; orchestrator-state template 32, and the "findings booked for the user" column at 65);
   - a ruling booked into the ledger (spec 16 and 104; plan-help 66; plan-orchestration 93 and 208);
   - `skills/plan/SKILL.md:83`, which parks an existing step under "Blocked", adds no step, and is kept;
   - `shared-rules.md:11`, where "a booking instead of a fix" is the lazy-option wording;
   - `docs/roadmap.md:135`, a historical record.

   These texts now agree on the rule: land, plan-orchestration, refute `SKILL.md` and `templates/report.md`, plan-help, spec, the state template (the "Booked, no ruling needed" section is gone) and the README. The land description now reads "neither closed nor raised to the user as an open item". The before and after is stated under "Ruling 1: before and after". Two defects remain (Spec 1 and Spec 2 below): a sentence that still adds a step with no ruling, and the backed-out path through `/spec`, which the texts promise and `/spec` does not describe.
2. Ruling 2 (the name of an open item line): closed. `OPEN_ITEM = re.compile(r"Open item ([A-Za-z]+)(?: \(|:)")`; the head comment at lines 16-17 and `skills/spec/SKILL.md:108` give both forms. Both halves of the case turn red under their reverts (above).
3. Ruling 3 (a `###` heading inside a section): closed. The case at `check_step.test.sh:135-142` turns red under the `#{1,3}` revert, and separately under a cut of the Rulings section alone (above).
4. Ruling 4 (the ledger root normalised): closed. `land.sh:124-131` strips every leading `./` and every trailing `/`, and both the pathspec and the ignore pattern use the result. The `slash` and `dot` cases turn red under their reverts. `./` and `/` are added to the refused values and are refused.
5. Ruling 5 (what reaches main): closed. `land.sh:17-21` and `README.md:158` now say that a file left uncommitted never reaches main and that a file a commit of the range holds still does, which matches `skills/land/SKILL.md:53`.
6. Ruling 6 (`/plan`'s inputs): closed. `skills/plan/SKILL.md:37` is "What it reads" 4, and line 75 is the Stops row "No landing script".
7. Ruling 7 (the sentences outside the first paths): closed for the four named lines. Of the names this step changed, the greps for `no-browser`, `oculus`, `8792`, `test:browser`, `ledger may hold`, `when there is one`, `when the ledger holds`, `three ADAPT` and `landing script` find no stale sentence. The stale sentences left are in the ruling-1 area: Spec 1 and Spec 3 below.
8. Ruling 8 (the first line and the ledger copy): closed. The first line names what is left to the orchestrator at landing. "Ledger copy" says that a ledger's copy of `land.test.sh` finds `verify.sh` only beside it or in an installed `land` skill that holds it, and that v1.0.0 holds none. `skills/land/SKILL.md:109` and `README.md:158` say the same. The report's own "Doc text" section is stale (Proof 1).

### Spec

1. `skills/land/SKILL.md:142`, Rules: "- A landed step found short of its brief, or wrong, gets a new step that finishes it on top of what landed."
   - This still adds a step with no ruling named.
   - Under ruling 1 (ruling Y (a)), such a finding is an open item and becomes a step only by the user's ruling, as `skills/plan-orchestration/SKILL.md:164` now says.
   - The round's grep misses it because the sentence holds none of the searched words.
   - Close to it, `skills/plan-orchestration/SKILL.md:227` (Anti-patterns) still gives the reason "the extra round only moves work that belongs in a new step", while its "Do instead" cell now says to raise the rest as open items.
2. `/spec` does not describe the path that the new texts send a backed-out step through.
   - Four texts say a step with `landing: backed-out` "is worked again as that step, through `/spec`, with no new ruling": `skills/land/SKILL.md:61` and `:131`, `skills/plan-orchestration/SKILL.md:78` and `:110`, and `skills/plan-help/SKILL.md:70`.
   - `skills/land/SKILL.md` Steps 6 keeps that step's worktree, branch and dispatch block.
   - `skills/spec/SKILL.md` has no text for re-preparing such a step. Steps 6 runs `git worktree add -b <step> <worktree_root>/<step> <base>`, which fails on the kept branch. Steps 3 writes over the committed `agents/briefs/<step>.md`. Steps 8 writes a dispatch block for a step that already has one.
   - `skills/spec/SKILL.md` was among the round's paths.
   - Ruling 1 says the backed-out step is worked again "through `/spec`", so the missing path in `/spec` is inside that ruling, not a new concern.
3. `skills/plan-orchestration/SKILL.md:161`, "What earns a step of its own": "Everything else is closed in the step that is open: a finding inside a brief by the repair rounds, a finding beyond it at the landing that raised it, ...".
   - The round rewrote the Stops row "A finding that is the user's" (line 203), which now lists "a finding beyond the brief" among the findings that go to the user and become a step only by the user's ruling.
   - It also rewrote Rules line 235: "Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item".
   - Line 161 still says a finding beyond the brief is closed at landing, and `skills/land/SKILL.md` Steps 6 fixes at landing only what is "small and inside the brief".
   - The contradiction existed at the base. The ruling asked for these texts to agree, and the round's rewrite of the two neighbouring sentences leaves it standing.

### Proof

1. The report's "Doc text" section (`21-report.md`, lines 185-202) no longer describes the tree.
   - It says items 1 to 4 "are applied on the tree ... merged with ruling 1".
   - Item 2 still gives as its replacement "then /spec the next unblocked step, the booked step in its queue order once your ruling tags it, an open item after your ruling".
   - `skills/plan-help/SKILL.md:70` on the tree reads "/spec that step again when it comes up, with no new ruling, or after your ruling when only you can decide what to do".
   - The report carries a sentence for the booked list that ruling 1 removed.

No other finding. Every count, path, line number and `FAIL:` line that the round section quotes was reproduced (Verification).

### Standards

1. `skills/spec/SKILL.md:3`: the description frontmatter does not name the new refusal of a step without the user's authority.
   - `docs/dev/skill-layout.md` (Frontmatter) says the description states what the skill does.
   - The README table (`README.md:13`) now opens `spec`'s entry with "checks that the user approved the step", and `plan`'s description was updated for its new work.

Checks with no finding:
- `LC_ALL=C grep -n '[^ -~]'` on every changed and new file outside the ledger prints nothing.
- The added Markdown lines hold no em dash and no spaced-dash aside; the only ` - ` matches are list markers.
- No hard wraps among the added Markdown lines, and no history in comments.
- Every skill whose `SKILL.md` changed has a bumped version. The repo-setup `SKILL.md` did not change, so its 1.1.0 stands.

### Behaviour

1. Ruling 1's before and after is stated (report, "Ruling 1: before and after").
   - Not stated: a `/spec` of a backed-out step, now the only route the texts give it, fails at the worktree add as Spec 2 says.
   - Before the round, `plan-orchestration:110` said such a step "is worked again when its booked item comes up", with no route named.
   - After the round it names `/spec`, and that route fails.
   - This is a visible change the report states as working.

No other finding. The report states the before and after of the `(ruling E)` naming change and of the land.sh defaults.

### Not checked

- A real `/spec` of a step at `landing: backed-out`: Spec 2 is read from the text of `skills/spec/SKILL.md` Steps 3, 6 and 8 and was not run.
- The land.sh revert that puts back the browser step (the port check and `npm run test:browser`).
- The ledger copy of `land.sh` and `land.test.sh` run inside this plan's real ledger. It needs a write under the ledger.

### Usage

- Reviewer: claude:opus, a fresh background agent: 193994 tokens, 45 tool uses, 12.9 min.

## Closed

First run:
- Spec 1 (stale sentences outside the paths): closed in round 1, ruling 7; the round review's Closures 7.
- Spec 2 (every booked step waiting for a ruling): put to the user as open item Y, ruled (a), built in round 1, ruling 1.
- Spec 3 (step 6a's tag): no change; the user ruled on 6a's content.
- Proof 1 (`Open item E:` named by its text): closed in round 1, ruling 2.
- Proof 2 (no `###` case): closed in round 1, ruling 3.
- Proof 3 (`.scratch/` and `./.scratch`): closed in round 1, ruling 4.
- Proof 4 (the verify list line): fixed at landing, the line added to `orchestrator-state.md`; `verify: 13 commands passed`.
- Standards 1 (what reaches main): closed in round 1, ruling 5.
- Standards 2 (`/plan`'s inputs): closed in round 1, ruling 6.
- Standards 3: closed with Spec 1.
- Behaviour 1: closed in round 1, ruling 1's before and after.
- Behaviour 2 (the ledger copy of `land.test.sh`): stated in round 1, ruling 8; its run is not verified until the pin of ruling W.
- Behaviour 3 (the global ignore file not read for one checkout): stated in the report; no change.

Run over round 1:
- Spec 1 (`skills/land/SKILL.md:142`, `skills/plan-orchestration/SKILL.md:227`): fixed at landing.
- Spec 2 and Behaviour 1 (the route of a backed-out step through `/spec`): raised to the user as open item Z.
- Spec 3 (`skills/plan-orchestration/SKILL.md:161`): fixed at landing.
- Proof 1 (the report's "Doc text" section stale): no change to the builder's report; the tree is what landed, and `skills/plan-help/SKILL.md:70` reads as the round review quotes it.
- Standards 1 (`spec`'s description): fixed at landing.
