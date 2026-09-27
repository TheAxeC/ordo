# Report: step 21, the process checks

Everything in the brief and in repair round 1 is done on the tree. Left to the orchestrator at landing, as the round brief's "Not sent back" says: the verify-list line for `check_step.test.sh` in the state file, the copy of `land.sh` and `land.test.sh` into this plan's ledger, and this plan's state file's "Booked, no ruling needed" list turned into open items.

## Open items of the state file, verbatim

- none.

## The cases' first run, on the unchanged tree

The brief has no "Cases" section; its cases are the ones under "What it must do". `check_step.test.sh` was written first and run before `check_step.py` existed:

```
$ sh skills/spec/templates/check_step.test.sh; echo exit $?
FAIL: approved: exit 2, expected 0 [] [.../python3: can't open file '.../skills/spec/templates/check_step.py': [Errno 2] No such file or directory]
exit 1
```

No case of the brief turned out wrong under its own rules.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| Verify 1: the verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"` | below, "Verify 1" |
| Verify 2: `check_step.test.sh` | DONE | `sh skills/spec/templates/check_step.test.sh 2>&1 \| tail -1` | `PASS: check_step.py scratch tests` |
| Verify 3: 21 ok, 7d refused | DONE | `python3 skills/spec/templates/check_step.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md 21` and the same for `7d` | `ok: step 21 has the user's authority: (ruling W) (ruling U) (ruling V) (ruling X)`, exit 0; `refused: step 7d is removed: its line starts with Removed by; the user's ruling is needed`, exit 1 |
| What it must do: 17, 17a, 18, 19 | DONE | the same script for each | `ok: step 17 has the user's authority: (approved)`, `ok: step 17a has the user's authority: (ruling T)`, `ok: step 18 has the user's authority: (approved)`, `ok: step 19 has the user's authority: (approved)`, each exit 0 |
| What it must do: 17 untagged | DONE | `sed 's/^\(- 17 The approved retro.*\) (approved)$/\1/' plan.md > plan17.md; python3 skills/spec/templates/check_step.py plan17.md 17` | `refused: step 17 ends with neither (approved) nor (ruling <name>); the user's ruling is needed`, exit 1 |
| Item 1: `check_step.py` and its test | DONE | Verify 2 and 3; reverts below | as quoted |
| Item 2: `/spec` runs it | DONE | `grep -n 'check_step\|authority' skills/spec/SKILL.md` | lines 38-39 (What it reads 4), 50-55 (Steps 1), 121-122 and 127 (Stops) |
| Item 3: `/plan` writes the tags | DONE | `grep -n 'approved\|ruling <name>' skills/plan/SKILL.md skills/plan/templates/plan.md skills/plan-orchestration/SKILL.md skills/spec/SKILL.md` | plan Steps 3 bullet and Rules; template step lines; plan-orchestration Stops bullet (line 208); spec "A ruling" (lines 107-108) |
| Item 4: `/land` requires `land.sh` | DONE | `grep -n 'land\.sh' skills/land/SKILL.md skills/plan/SKILL.md` | land What it reads 4, Steps 4-5, "The landing script", Stops row "No landing script"; plan Steps 5 and 7 |
| Item 5: `land.sh` for any repository | DONE | `grep -n 'oculus\|8792\|npm\|find src' skills/land/templates/land.sh` prints nothing (exit 1); `grep -n '^landing_tool_path=\|^landing_ledger_root=' skills/land/templates/land.sh` | `117:landing_tool_path=.`, `119:landing_ledger_root=.scratch`; the cases `defaults`, `ledger`, `pattern`, `ledger root` pass in Verify 1 |
| Item 6: ledger copy edits | DONE | under "Ledger copy" | |
| Item 7: rule inventory for a rewrite | DONE | `grep -n 'inventor' docs/dev/skill-layout.md skills/spec/SKILL.md skills/spec/templates/brief.md` | skill-layout "A rewrite of a skill"; spec Steps 3 bullet; brief template path line and verify item 4 |
| Item 8: lists and README | DONE | `grep -n 'check_step' README.md docs/dev/*.md` | `README.md:112`, `README.md:125` (bullet), `docs/dev/building.md:12`, `docs/dev/change-standard.md:48` |
| Verify 4: each test's revert | DONE | below, "Reverts" | |
| Rule 14 grep | DONE, with Doc text | below, "The grep of changed names" | |

### Verify 1

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

The state file's verify list does not hold `check_step.test.sh` yet, since the ledger is outside this step's paths; Verify 2 runs it. The line to add is under "Doc text".

### Reverts

Each revert was made on a copy of the script in the scratchpad, next to a copy of its test, and the test run there; the first `FAIL:` line is quoted (temporary folder shortened to `$T`).

`check_step.test.sh`, the revert of `check_step.py` and its first red:

| Revert | First `FAIL:` line |
|---|---|
| `(approved)` not counted | `FAIL: approved: exit 1, expected 0 [refused: step 1 names no ruling of the user in the Rulings section: (approved); ...]` |
| a line with no tag not refused | `FAIL: no tag: printed [refused: step 2 names no ruling of the user in the Rulings section: ; ...], expected [refused: step 2 ends with neither (approved) nor (ruling <name>); ...]` |
| the checkmark not skipped | `FAIL: a ticked step: exit 64, expected 0 [] [error: step 17 is not in the step list of $T/plan-2.md: ✅, 18]` |
| an open item not named by its letter | `FAIL: an open item ruling: exit 1, expected 0 [refused: step 1a names no ruling ...: (ruling H); ...]` |
| a ruling named by its whole line | `FAIL: a ruling named by its text: exit 1, expected 0 [refused: step 6a ...: (ruling The plan cut to its goal); ...]` |
| "(the user)" matched in one case only | `FAIL: a ruling named by its text: exit 1, expected 0 [...]` |
| only the last tag read | `FAIL: several tags: printed [ok: step 21 has the user's authority: (ruling H)], expected [ok: step 21 has the user's authority: (ruling U) (ruling H)]` |
| every tag counted | `FAIL: several tags: printed [ok: step 21 has the user's authority: (ruling W) (ruling U) (ruling Q) (ruling H)], expected [...]` |
| "(the user" anywhere in the line counted | `FAIL: a ruling that is not the user's: exit 0, expected 1 [ok: step 9 has the user's authority: (ruling Models: Opus)] []` |
| a removed step not refused | `FAIL: a removed step: exit 0, expected 1 [ok: step 7d has the user's authority: (ruling U)] []` |
| a removed line named by its first word | `FAIL: a removed step: exit 64, expected 1 [] [error: step 7d is not in the step list of $T/plan-8.md: Removed, 7]` |
| tags read anywhere in the line | `FAIL: an open item ruling: printed [ok: step 1a has the user's authority: (ruling H) (ruling H)], expected [...]` |
| `Open item E:` named E | `FAIL: Open item E: named by its text: exit 0, expected 1 [ok: step 7 has the user's authority: (ruling E)] []` |
| a step matched by its prefix | `FAIL: a removed step: exit 64, expected 1 [] [error: step 7d is listed twice in $T/plan-8.md, at lines 9 and 10]` |
| a step not in the list passed | `FAIL: the first word of a removed line: exit 0, expected 64 [] []` |
| the argument count not checked | `FAIL: no step argument: exit 1, expected 64 [] [Traceback (most recent call last):` |
| a missing file read as empty | `FAIL: a missing file: printed [error: $T/missing.md has no '## Steps, in execution order' section] on standard error, expected [error: cannot read $T/missing.md: No such file or directory]` |
| a step listed twice passed | `FAIL: a step listed twice: exit 0, expected 64 [ok: step 1 has the user's authority: (approved)] []` |
| a missing section not refused | `FAIL: no step list: printed [error: step 1 is not in the step list of $T/nosteps.md: no step] on standard error, expected [...has no '## Steps, in execution order' section]` |
| a file not UTF-8 read as empty | `FAIL: not UTF-8: printed [error: $T/binary.md has no '## Steps, in execution order' section] on standard error, expected [error: $T/binary.md is not UTF-8]` |
| a removed line with no step skipped | `FAIL: a removed line with no step: exit 0, expected 64 [ok: step 1 has the user's authority: (approved)] []` |
| a section read past the next heading | `FAIL: approved: exit 64, expected 0 [] [error: step 1 is listed twice in $T/plan-1.md, at lines 9 and 14]` |
| an indented item read as a step | `FAIL: an indented item: exit 0, expected 64 [ok: step 2 has the user's authority: (approved)] []` |
| lines not stripped of CR | `FAIL: a CRLF plan: exit 64, expected 0 [] [error: $T/plan-17.md has no '## Steps, in execution order' section]` |

`land.test.sh`, the revert of `land.sh` and its first red:

| Revert | First `FAIL:` line |
|---|---|
| the browser step put back (port check and `npm run test:browser`, run unless `--no-browser`) | `FAIL: defaults: npm ran: [npm run test:browser]` |
| the source line count put back | `FAIL: defaults: a line count ran: [Switched to a new branch 'clean-land'` |
| the ledger root not left out of the worktree's add | `FAIL: ledger: exit 2, expected 0: Switched to a new branch 'ledger-land'` (the cherry-pick conflicts on the report) |
| the worktree's checkout of main without the ledger ignore file | `FAIL: ledger: exit 1, expected 0: error: The following untracked working tree files would be overwritten by checkout:` |
| the ledger root not escaped in the ignore file | `FAIL: pattern: exit 1, expected 0: error: The following untracked working tree files would be overwritten by checkout:` |
| `literal` dropped from the add's exclude | `FAIL: pattern: staged paths differ: [committed.txt]` |
| the check of `landing_ledger_root` removed | `FAIL: ledger root []: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made` |

The lookup of `verify.sh` and `usage.py` in `land.test.sh`, run from a ledger-shaped folder holding only `land.sh` and `land.test.sh`, with a scratch `HOME` whose `.claude/skills/land/templates` holds the two files:

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=$S/home sh ledger/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ ... HOME=$S/emptyhome ...            (control: nothing installed)
FAIL: verify.sh not found beside this test or in the land skill's templates
$ ... the lookup reverted to the test's own folder ...
FAIL: could not copy into /private/var/folders/.../land-test.QDQt6W/ledger
```

Audits, not proofs: the defaults `landing_tool_path=.` and `landing_ledger_root=.scratch` are constants that the tests read from `land.sh` rather than assert; the grep in the table shows them.

### The grep of changed names

`grep -rn -e 'check_step' -e 'landing_ledger_root' -e 'landing_tool_path' -e 'no-browser' -e 'test:browser' -e 'ADAPT' -e 'landing script' -e 'three .ADAPT' -e 'tools/oculus' skills utils docs README.md`, the two scripts and their tests left out: every hit is in a file of this step except `skills/plan/templates/orchestrator-state.md:47`, under "Doc text". A grep for what a builder writes in the ledger (`only its report\|except the report`) found `skills/repo-setup/templates/docs/dev/change-standard.md:34`, and the `/spec` refusals in `skills/plan-help/SKILL.md:68` and `:70`, also under "Doc text".

## Files

The line counts after repair round 1 are in that section.

| File | Lines |
|---|---|
| `skills/spec/templates/check_step.py` (new) | 158 |
| `skills/spec/templates/check_step.test.sh` (new) | 203 |
| `skills/spec/SKILL.md` | 141 |
| `skills/spec/templates/brief.md` | 59 |
| `skills/plan/SKILL.md` | 89 |
| `skills/plan/templates/plan.md` | 32 |
| `skills/plan-orchestration/SKILL.md` | 236 |
| `skills/land/SKILL.md` | 144 |
| `skills/land/templates/land.sh` | 445 |
| `skills/land/templates/land.test.sh` | 890 |
| `docs/dev/skill-layout.md` | 73 |
| `docs/dev/building.md` | 35 |
| `docs/dev/change-standard.md` | 66 |
| `README.md` | 185 |

Versions: `spec` 1.5.0, `plan` 1.8.0, `plan-orchestration` 2.8.0, `land` 1.7.0.

## Judgment calls the brief left open

1. **The lines of `check_step.py`.** Exit 0 prints `ok: step <s> has the user's authority: <the tags that count>`; exit 1 prints `refused: step <s> <reason>; the user's ruling is needed`, the reason one of `ends with neither (approved) nor (ruling <name>)`, `names no ruling of the user in the Rulings section: <tags>`, `is removed: its line starts with Removed by`; exit 64 prints one `error:` line on stderr, as `check_paths.py` does.
2. **A step's name.** The first word after `- `, after the checkmark of a ticked step; on a `Removed by` line, the first word after its first colon. Only unindented `- ` lines count. A section runs to the next heading of level one or two. A step listed twice exits 64, and so does a `Removed by` line with no step after a colon.
3. **The user's mark.** A ruling line counts when it ends with `(the user)`, in either case, with or without a full stop inside or after the parentheses, which covers `(the user).` and `(The user.)`.
4. **`- Open item E: (b), ...` (`plan.md`).** Named `E`: a line `- Open item <L>` followed by ` (` or `:` is named `<L>` (repair round 1, ruling 2).
5. **Where `/spec` runs the check.** As bullets of Steps 1, after the preflight and before any premise check, so Steps 3 stays the brief's writing, as item 7 names it.
6. **The ledger root in `land.sh`.** An `ADAPT` setting, `landing_ledger_root`, defaulting to `.scratch`, the value of the `plan` skill's `templates/plan.yaml`; empty, `.`, `..`, absolute or leaving the repository is refused before anything is touched. The worktree's add leaves it out through `:(exclude,literal)<root>`. The worktree's checkout of main must also count it as ignored, through a scratch ignore file given as `core.excludesFile`, because the orchestrator commits the builder's report on main before the landing (for example `72781ef Save step 20's builder report in plan 2.B`). An untracked copy of it at the same path in the worktree otherwise stops that checkout (the `checkout` revert above). For that one command the user's own global ignore file is not read.
7. **`--no-browser`.** Kept: it sets `landing_browser` to 0, which a browser check in the `ADAPT` block reads. The template's `ADAPT` block runs nothing: the browser step, the line count, and the `npm ci` on a changed `package-lock.json` all left it.
8. **`land.test.sh` in a ledger.** It now finds `verify.sh` and `usage.py` as `land.sh` does, so the copy `/plan` makes runs from the ledger. The test's fixtures follow `landing_tool_path` and `landing_ledger_root` read from `land.sh`.
9. **The rule inventory.** Written at `<ledger>/inventories/<skill>.md`, the folder plan 1 used (`.scratch/archive/1-one-layout-for-every-skill/inventories/`). The builder writes it, so `plan-orchestration` (Steps 4 and 6) and `docs/dev/change-standard.md` now allow it beside the report, and the orchestrator copies it into the main ledger as it copies the report. The `spec` skill's `SKILL.md` and `templates/brief.md` name "the inventory check the standards name", not `utils/check_rule_inventory.py`, since a skill carries no path; `docs/dev/skill-layout.md` names the script.
10. **A step the orchestrator would book.** Ruled by the user (ruling Y (a)) and built in repair round 1, ruling 1: there is no booked list; such a finding is an open item and becomes a step only by the user's ruling.

## User-visible changes

| Surface | Before | After |
|---|---|---|
| `/spec` | Prepares any step in the list | Refuses a step whose line lacks `(approved)` or a `(ruling <name>)` of the user, or that is removed; writes nothing |
| `/plan` | Writes `plan.md`, `orchestrator-state.md` | Also tags each approved step `(approved)` and copies `land.sh` and `land.test.sh` into the ledger with their `ADAPT` edits |
| `/land` | "A ledger may hold `land.sh`" | Refuses a ledger without `land.sh` (Stops row "No landing script") |
| `land.sh` defaults | `landing_tool_path=tools/oculus`; line count over `src tests config bin`; port 8792 check and `npm run test:browser` unless `--no-browser`; `npm ci` on a changed lockfile | `landing_tool_path=.`; new `landing_ledger_root=.scratch`; nothing between main's cherry-pick and the verify list |
| `land.sh` worktree add | `git add -A <tool path>` | `git add -A -- <tool path> ':(exclude,literal)<ledger root>'`; the checkout of main counts untracked ledger files as ignored |
| `docs/dev/skill-layout.md` | No rule on rewrites | "A rewrite of a skill": an inventory in the ledger, checked by `utils/check_rule_inventory.py` |
| `plan.md` template | Step lines without a tag; a ruling line without "(the user)" | `(approved)` and `(ruling <L>)` on the step lines; `- Open item <L> (<date>): ... (the user).` |

## Wrong or impossible in the brief

- The brief kept four sentences outside its paths that the change made stale (change standard, rule 14). Repair round 1 widened the paths and they are changed on the tree.
- The brief has no "Cases" section, which `templates/brief.md` requires; its cases are under "What it must do", and those were run first.

## Doc text

Items 1 to 4 are applied on the tree in repair round 1 (ruling 7), merged with ruling 1 where they touch the same lines. Item 5 is the orchestrator's at landing.

1. `skills/plan-help/SKILL.md:68`, current:
   `/spec refuses                 the brief's "Paths this step writes" shares a path with a step in flight, or a state file or brief it reads is unusable: it names the cause and leaves nothing; land the other step or change the paths, then /spec again`
   Replacement:
   `/spec refuses                 the step's line lacks your authority ((approved), or (ruling <name>) of a ruling of yours), the brief's "Paths this step writes" shares a path with a step in flight, or a file it reads is unusable: it names the cause and leaves nothing; rule on the step, land the other step or change the paths, then /spec again`
2. `skills/plan-help/SKILL.md:70`, current ends `then /spec the next unblocked step, the booked step in its queue order, an open item after your ruling`. Replacement end: `then /spec the next unblocked step, the booked step in its queue order once your ruling tags it, an open item after your ruling`.
3. `skills/plan/templates/orchestrator-state.md:47`, current:
   `- <when the ledger holds a landing script: its invocation from the repository root, what it does, its exit codes, and the test that proves it>.`
   Replacement:
   `- <the ledger's landing script: its invocation from the repository root, what it does, its exit codes, and the test that proves it>.`
4. `skills/repo-setup/templates/docs/dev/change-standard.md:34`, current:
   `- Nothing under the ledger folder is edited except the report the brief names. The plan, the state file and the briefs belong to the orchestrator.`
   Replacement:
   `- Nothing under the ledger folder is edited except the report the brief names, and the rule inventory it names for a step that rewrites a skill. The plan, the state file and the briefs belong to the orchestrator.`
5. The state file's verify list, after `- sh skills/spec/templates/check_paths.test.sh 2>&1 | tail -1`: `- sh skills/spec/templates/check_step.test.sh 2>&1 | tail -1`, since `docs/dev/building.md` now lists it. The runner then prints eleven `PASS:` lines and `verify: 13 commands passed`.

## Ledger copy

The template's defaults are this repository's values, so the copy needs no edit:

- `landing_tool_path=.`: the whole tree, as the template has it.
- `landing_ledger_root=.scratch`: `.agents/plan.yaml`'s `ledger_root: .scratch`, as the template has it.
- The `ADAPT` block: no dependency install and no check beyond the verify list; it stays as the template has it, running nothing.
- The model names: `worker claude:opus` and `reviewer claude:opus` in `land.sh`'s rows and in the rows `land.test.sh` expects, as the template has them (`.agents/plan.yaml`: `worker: claude:opus`, `reviewer: claude:opus`).

At landing, from the repository root on main:

```sh
cp skills/land/templates/land.sh skills/land/templates/land.test.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/
sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/land.test.sh 2>&1 | tail -1
```

The copy of `land.test.sh` in a ledger finds `verify.sh` only when it is beside it or in an installed `land` skill that holds it. The installed `land` skill at v1.0.0 (`~/.local/share/ordo-stable/land`) holds no `verify.sh`, so the second command above fails with `FAIL: verify.sh not found beside this test or in the land skill's templates` until the pin of ruling W, or until `verify.sh` is copied beside it. `skills/land/SKILL.md` ("The landing script") and the README say the same. A copy in a ledger-shaped folder outside any repository, with `verify.sh` in a scratch `HOME`'s installed `land` skill, printed `PASS: land.sh and usage.py scratch tests` (above). A copy inside this ledger was not run, since the ledger is outside this step's paths: not verified.

## Repair round 1

The rulings of `agents/briefs/21-round-1.md`, each built on the tree.

| Ruling | State | Command | Output |
|---|---|---|---|
| 1, no booked list | DONE | `grep -rn -i 'booked list\|no ruling needed\|queue order' skills docs README.md \| grep -v roadmap.md` | no output (exit 1) |
| 1, backed-out step | DONE | `grep -n 'no new ruling' skills/land/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-help/SKILL.md` | `skills/land/SKILL.md:61`, `:131`; `skills/plan-orchestration/SKILL.md:78`, `:110`; `skills/plan-help/SKILL.md:70` |
| 1, versions | DONE | `grep -n 'version:' skills/{refute,plan-help}/SKILL.md` | `refute` 1.5.0, `plan-help` 1.7.0 |
| 2, `Open item <L>:` named `<L>` | DONE | `sh skills/spec/templates/check_step.test.sh 2>&1 \| tail -1` | `PASS: check_step.py scratch tests` |
| 3, `###` inside a section | DONE | the same | the same |
| 4, the ledger root normalised | DONE | `sh skills/land/templates/land.test.sh 2>&1 \| grep -E 'slash\|dot:'` | `slash: a ledger root written with a trailing slash left out, exit 0`; `dot: a ledger root written with a leading ./ left out, exit 0` |
| 5, what reaches main | DONE | `grep -n 'uncommitted' skills/land/templates/land.sh README.md skills/land/SKILL.md` | `land.sh` head comment lines 17-21, `README.md:158`, `skills/land/SKILL.md:53`, `:108` |
| 6, `/plan`'s inputs | DONE | `grep -n 'land.test.sh' skills/plan/SKILL.md` | "What it reads" 4 (line 37); Stops row "No landing script" (line 75) |
| 7, the sentences outside the first paths | DONE | `grep -n 'lacks your authority' skills/plan-help/SKILL.md`; `grep -n "the ledger's landing script" skills/plan/templates/orchestrator-state.md`; `grep -n 'rule inventory' skills/repo-setup/templates/docs/dev/change-standard.md` | `skills/plan-help/SKILL.md:68`; `orchestrator-state.md:45`; `change-standard.md:34` |
| 8, first line and ledger copy | DONE | the report's first line; "Ledger copy"; `grep -n 'v1.0.0' skills/land/SKILL.md README.md` | `skills/land/SKILL.md:109`, `README.md:158` |

### Ruling 1: before and after

- Before: a finding neither closed in the repair rounds nor fixed at landing (a finding beyond the brief, work the last round left undone, a changed view not fixed at landing, a red line at landing) became a step in the state file's "Booked, no ruling needed" list, worked in queue order with no ruling.
- After: such a finding is an open item in the state file, raised as `plan-orchestration`'s Stops row "A finding that is the user's" says, and it becomes a step only by the user's ruling, as a line ending with `(ruling <name>)`. The state template has no booked list. Reports name the open items, not a booked list's count.
- A step a red line took back out of main (`landing: backed-out`) is not a new step. Its failure is recorded in its Step 0 in `plan.md`, its line keeps its tag, and it is worked again through `/spec` with no new ruling. It goes to the user as an open item only when only the user can decide what to do.
- Sentences rewritten: `skills/land/SKILL.md` (description, lines 10, 61, 68, 72, 90, 117, 123, 131); `skills/plan-orchestration/SKILL.md` (lines 73, 78, 82, 110, 164, 172, 173, the Stops row "A finding that is the user's", Anti-patterns rows at 219 and 223, Rules 235); `skills/refute/SKILL.md` (lines 23, 56, 70, 104, 107); `skills/refute/templates/report.md:44`; `skills/plan-help/SKILL.md` (lines 59, 60, 68, 69, 70); `skills/plan/templates/orchestrator-state.md` (lines 16, 30, and the removed "Booked" section); `skills/spec/SKILL.md:70`. "Booking" as the landing's record in `plan.md`, the Closed list and the open items are kept.

### Ruling 2: behaviour before and after

- Before: `(ruling E)` against `- Open item E: (b), ... (the user).` was refused, and `(ruling Open item E:)` passed.
- After: `(ruling E)` passes, and `(ruling Open item E:)` is refused. `skills/spec/SKILL.md` "A ruling" names both forms, and the text before the first ` (` for any other ruling line.

### New and changed cases, each with its revert's first `FAIL:` line

Reverts run on copies in the scratchpad, as in the first run; the temporary folder is shortened to `$T`.

| Case | Revert | First `FAIL:` line |
|---|---|---|
| `Open item E: named E` | the regex back to `Open item ([A-Za-z]+) \(` | `FAIL: Open item E: named E: exit 1, expected 0 [refused: step 7 names no ruling of the user in the Rulings section: (ruling E); the user's ruling is needed] []` |
| `Open item E: not named by its text` | the text name added for an open item line too (`elif` to `if`) | `FAIL: Open item E: not named by its text: exit 0, expected 1 [ok: step 8 has the user's authority: (ruling Open item E:)] []` |
| `a subheading in both sections` | `#{1,2}` to `#{1,3}` | `FAIL: a subheading in both sections: exit 64, expected 0 [] [error: step 2 is not in the step list of $T/plan-11.md: 1]` |
| `slash` (`land.test.sh`) | the trailing `/` branch of the normalisation removed | `FAIL: slash: exit 1, expected 0: error: The following untracked working tree files would be overwritten by checkout:` |
| `dot` (`land.test.sh`) | the leading `./` branch of the normalisation removed | `FAIL: dot: exit 1, expected 0: error: The following untracked working tree files would be overwritten by checkout:` |
| `ledger root`, now also `./` and `/` | the check of the ledger root removed | `FAIL: ledger root []: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made` |

The reverts of the first run were run again on the final files, each red at the same first `FAIL:` line as quoted in "Reverts" above. The `crlf` case now reads `plan-18.md`, one plan later. The `Open item E:` revert of the first run tested the regex the round replaced, and the `colon` revert above takes its place. The land reverts `browser`, `linecount`, `add`, `checkout`, `escape` and `literal` gave the lines quoted above.

Ruling 5 changes a head comment and README text and ruling 6 changes skill text: no test reads them, so they are audits by the greps in the table.

### Verify before you report, rerun

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

`sh skills/spec/templates/check_step.test.sh 2>&1 | tail -1`: `PASS: check_step.py scratch tests`.

`python3 skills/spec/templates/check_step.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md <step>`:

```
ok: step 21 has the user's authority: (ruling W) (ruling U) (ruling V) (ruling X) (ruling Y)
ok: step 17 has the user's authority: (approved)
ok: step 17a has the user's authority: (ruling T)
ok: step 18 has the user's authority: (approved)
ok: step 19 has the user's authority: (approved)
refused: step 7d is removed: its line starts with Removed by; the user's ruling is needed
```

Exit 0 for each `ok:` line, exit 1 for 7d.

### Files after the round

| File | Lines |
|---|---|
| `skills/spec/SKILL.md` | 141 |
| `skills/spec/templates/check_step.py` | 158 |
| `skills/spec/templates/check_step.test.sh` | 211 |
| `skills/plan/SKILL.md` | 91 |
| `skills/plan/templates/orchestrator-state.md` | 66 |
| `skills/plan-orchestration/SKILL.md` | 236 |
| `skills/plan-help/SKILL.md` | 93 |
| `skills/land/SKILL.md` | 144 |
| `skills/land/templates/land.sh` | 457 |
| `skills/land/templates/land.test.sh` | 902 |
| `skills/refute/SKILL.md` | 133 |
| `skills/refute/templates/report.md` | 44 |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 47 |
| `README.md` | 185 |

Versions: `spec` 1.5.0, `plan` 1.8.0, `plan-orchestration` 2.8.0, `plan-help` 1.7.0, `land` 1.7.0, `refute` 1.5.0.
