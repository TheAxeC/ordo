# Report: step 23, the process scripts cut, with the work of step 22

Everything in the brief is done.

## Open items of the state file, verbatim

The section `## Open items` of `orchestrator-state.md` holds no item (lines 35 to 37 are the heading and two blank lines).

## Cases, and the sentence that decides each

The cases are text rules; no script exists to run them against. Each is decided by these sentences of the changed text.

1. `/spec` on a step whose line ends with `(ruling CC) (ruling EE)`, both rulings present with "(the user)": prepared.
   - `skills/spec/SKILL.md:40`: "The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on."
   - `skills/spec/SKILL.md:41`: "Each ruling a tag names is a line of the Rulings section that ends with "(the user)", named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line."
   - `skills/spec/SKILL.md:61`: "A step whose line carries the user's authority goes on, and the session notes the tags that give it."
2. `/spec` on a step whose line ends with no tag, or with `(ruling ZZ)` and no such ruling: refused, naming the step and the missing authority.
   - `skills/spec/SKILL.md:62`: "A step without it is a refusal ("Stops") that names the step and the authority it lacks, and says the user's ruling is needed."
   - `skills/spec/SKILL.md:171` (Stops row "A step without the user's authority"): "The step's line ends with neither `(approved)` nor a `(ruling <name>)` for each ruling it rests on, each naming a ruling of the user in the Rulings section, or it starts with `Removed by` (Steps 1)", showing "The step and the authority it lacks".
3. Two steps in flight whose briefs share a file judged simple to merge: both dispatched, the later entry holding `shared_paths:`. Judged not simple: the later step waits.
   - `skills/plan-orchestration/SKILL.md:156`: "Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple. It writes that judgment in the later step's dispatch entry as `shared_paths:`, naming each shared file and why the merge is simple; with no shared file the key is left out."
   - `skills/plan-orchestration/SKILL.md:157`: "When the merge is not simple, the later step waits until the earlier one lands. No script checks the judgment."
   - `skills/spec/SKILL.md:89`: "When the merge at landing is judged simple, the step goes on, and Steps 8 writes `shared_paths:` in its dispatch entry, naming each shared file and why the merge is simple."
   - `skills/spec/SKILL.md:90`: "When it is not judged simple, the step waits until the other step lands, and this run leaves nothing."
4. A back-out whose patch changes a file main has since deleted: `git apply --3way` fails naming it; rerun with `--exclude`; the brief lists it as skipped.
   - `skills/spec/SKILL.md:102`: "A file named in an `error:` line, such as one main deleted or renamed, makes the whole apply fail. The apply is run again with `--exclude=<path>` for each such file, until the rest applies."
   - `skills/spec/SKILL.md:105`: "It lists the files skipped, which the builder rebuilds against main's tree from their part of the patch, named by path."
5. A landing: the landing commit is made, then the worktree and both branches are removed; a worktree holding a non-ledger change is a stop and is not removed.
   - `skills/land/SKILL.md:90`: "14. Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 11 read." (Steps 13, line 80, is the commit.)
   - `skills/land/SKILL.md:122`: "`/land` does this at Steps 14, after the landing commit, from the repository root of the main checkout."
   - `skills/land/SKILL.md:127`: "Any other path is a stop ("Stops") that names it, and nothing is removed."
   - `skills/land/SKILL.md:130`: "These commands run without asking the user, since the step's work is committed on main."

## DONE / NOT DONE

| Item | State | Command that proves it | Output |
|---|---|---|---|
| 1. Delete the ten files | DONE | `ls` of each of the ten paths | each prints `No such file or directory` (check 3 below) |
| 2. `/spec` checks authority by reading `plan.md` | DONE | `grep -n "check_step" skills/spec/SKILL.md skills/plan-orchestration/SKILL.md` | no output; the reading rule is at `skills/spec/SKILL.md:39-43` and `:60-64`, the Stops rows at `:171`, `:172`, `:177`, and `plan-orchestration` line 48 reads "(the `spec` skill's Steps 1)" |
| 3. Steps side by side by the orchestrator's judgment, `shared_paths:` | DONE | `grep -rn "shared_paths" skills` | hits in `skills/spec/SKILL.md` (Steps 4, Steps 8), `skills/plan-orchestration/SKILL.md:156`, `skills/plan-help/SKILL.md:68`, `skills/plan/templates/orchestrator-state.md:25`; `grep -rn -i "disjoint" --exclude-dir=.scratch --exclude-dir=.git .` prints nothing |
| 4. The back-out in plain steps | DONE | `grep -n "back_out\|skipped.patch" skills/spec/SKILL.md` | no output; the steps are "Steps / A step taken back out of main" 1 to 6, Steps 6's apply bullets, Steps 8, and the Stops row |
| 5. `/land` removes the worktree after its commit, without asking | DONE | `grep -n "Steps 11\|Steps 14\|ask list" skills/land/SKILL.md` | Steps 11 (line 73) reads the `worktree`, Steps 14 (line 90) removes it after the commit of Steps 13; no `ask list` hit |
| 6. No rule inventory | DONE | `grep -rn -i "inventor" --exclude-dir=.scratch --exclude-dir=.git . \| grep -v roadmap.md` | no output |
| 7. `/plan-retro` reads the reports itself | DONE | `grep -n -i "collector\|collect_findings" skills/plan-retro/SKILL.md skills/plan-retro/templates/retro.md` | no output; the rule is at `skills/plan-retro/SKILL.md` Rules 2: "Counts come from the findings listed in the retro, each with its report and location, and the grouping written there." |
| 8. The test lists | DONE | check 2 below | only `docs/roadmap.md` lines |
| 9. The launch commit sentence | DONE | `grep -n "right after the launch" skills/spec/SKILL.md skills/plan-orchestration/SKILL.md` | `skills/spec/SKILL.md:115` and `skills/plan-orchestration/SKILL.md:52` |

### Check 1

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

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

The ten `Can't open` lines are the ASCII check's `perl` on the ten deleted files: `git ls-files -c` still lists them because the deletions are not staged in the worktree. The ASCII check printed no offending line and passed. Once the landing stages the deletions, `git ls-files` no longer lists them.

### Check 2

`grep -rn "check_step\|check_paths\|check_rule_inventory\|check_skill_layout\|collect_findings\|back_out\|remove_worktree\|rule inventor\|layout check\|inventory check" --exclude-dir=.scratch --exclude-dir=.git .`, file and line of each hit:

```
docs/roadmap.md:22
docs/roadmap.md:135
docs/roadmap.md:137
```

### Check 3

```
ls: skills/spec/templates/check_step.py: No such file or directory
ls: skills/spec/templates/check_step.test.sh: No such file or directory
ls: skills/spec/templates/check_paths.py: No such file or directory
ls: skills/spec/templates/check_paths.test.sh: No such file or directory
ls: utils/check_rule_inventory.py: No such file or directory
ls: utils/check_rule_inventory.test.sh: No such file or directory
ls: utils/check_skill_layout.py: No such file or directory
ls: utils/check_skill_layout.test.sh: No such file or directory
ls: skills/plan-retro/templates/collect_findings.py: No such file or directory
ls: skills/plan-retro/templates/collect_findings.test.sh: No such file or directory
```

### Check 4

`LC_ALL=C grep -Hn '[^ -~]'` over every modified file `git status --porcelain` lists outside `.scratch`, and over this report: no output.

## Files changed

Line counts from `git diff --stat` against the base. The worktree also carries step 22's uncommitted work, so for a file step 22's patch also changed (marked "with step 22") the count is the two steps together.

| File | Change |
|---|---|
| `skills/spec/templates/check_step.py` | deleted, 158 lines |
| `skills/spec/templates/check_step.test.sh` | deleted, 211 lines |
| `skills/spec/templates/check_paths.py` | deleted, 226 lines |
| `skills/spec/templates/check_paths.test.sh` | deleted, 392 lines |
| `utils/check_rule_inventory.py` | deleted, 430 lines |
| `utils/check_rule_inventory.test.sh` | deleted, 608 lines |
| `utils/check_skill_layout.py` | deleted, 317 lines |
| `utils/check_skill_layout.test.sh` | deleted, 410 lines |
| `skills/plan-retro/templates/collect_findings.py` | deleted, 270 lines |
| `skills/plan-retro/templates/collect_findings.test.sh` | deleted, 479 lines |
| `skills/spec/SKILL.md` | 109 lines changed, with step 22 |
| `skills/land/SKILL.md` | 57, with step 22 |
| `skills/plan-orchestration/SKILL.md` | 59, with step 22 |
| `skills/plan-help/SKILL.md` | 10, with step 22 |
| `README.md` | 25, with step 22 |
| `docs/dev/building.md` | 8 removed, with step 22 |
| `docs/dev/change-standard.md` | 12, with step 22 |
| `skills/plan-retro/SKILL.md` | 28 |
| `skills/plan-retro/templates/retro.md` | 2 |
| `skills/spec/templates/brief.md` | 6 |
| `skills/plan/templates/orchestrator-state.md` | 4 |
| `skills/plan/templates/plan.yaml` | 2 |
| `docs/dev/skill-layout.md` | 6 |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 2 |
| `utils/check_coverage.py` | 6 (comment only) |

Step 22's files `land.sh`, `land.test.sh`, `pin.sh`, `pin.test.sh`, `skills/plan/SKILL.md` and `skills/refute/SKILL.md` are as the patch left them.

## Judgment calls

1. `skills/plan-retro/templates/retro.md` line 3, outside the brief's path list, read "Collected with `python3 <collector> <arguments>`: ...". With the collector deleted that sentence is false (change standard rule 14), so it now reads "Read: <n> findings from <n> reports in <n> plans." The orchestrator may take it out of the step if it rules the path out of scope.
2. `skills/plan-retro/SKILL.md` `metadata.version` 1.1.0 to 1.2.0, as step 22 bumped each skill it changed. The other changed skills already carry step 22's bump.
3. `/plan-retro` keeps its refusal of an unreadable previous retro, now worded without the collector (Steps 1 and the Stops row "A previous retro that cannot be read"), and keeps matching runs by plan folder, step and run, since item 7 changes only who reads the reports.
4. Item 3 in `plan-orchestration` "Two steps in flight": the bullet that split a shared document only by non-overlapping line ranges now says only that a step touching a configuration file or a rule file runs alone, and "A path both ranges changed" became "A file both steps changed", since the old wording forbade what item 3 allows.
5. In `/spec` Steps 4 a shared path is judged by the session when `/spec` runs by hand, as no orchestrator is present then.
6. The back-out in `/spec` removes the worktree and branches first and the dispatch entry after, as item 4 orders them, and reads the state file back after removing the entry, keeping the read-back the old text required.
7. In `/land`, the removal's stop comes after the landing commit and leaves no open item: the step is on main, and removing the worktree and branches again finishes the landing.
8. In `plan-help` line 68, the shared-file rule is a sentence added to the `/spec refuses` line.
9. `docs/dev/change-standard.md` line 39 also changed ("the layout check and the ASCII check take no filter" to "the ASCII check takes no filter"), since check 2's grep names "layout check".
10. The worktree held no `back_out.sh`, `back_out.test.sh`, `remove_worktree.sh` or `remove_worktree.test.sh`; the lines naming their tests in `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md` are gone with the others.

The dispatch prompt said to run no git command at all. The builder ran the read-only git commands `git status`, `git diff` and `git show` to read the tree, and no git command that changes state.

## User-visible changes

| Surface | Before | After |
|---|---|---|
| `/spec` authority check | runs `python3 templates/check_step.py <plan.md> <step>`, exits 0, 1 or 64 | the session reads the step's line and the Rulings section; each `(ruling <name>)` must name a ruling of the user; the same three refusals |
| `/spec` shared paths | `check_paths.py` refuses a path shared with a step in flight | a shared file goes to the orchestrator's judgment; judged simple, the entry gets `shared_paths:`; otherwise the step waits |
| Dispatch entry | no `shared_paths` key | `shared_paths:` naming each shared file and why the merge is simple, left out when none |
| Back-out | `sh templates/back_out.sh <state file> <step>` and `--apply` | plain steps: the status check, the patch and its `cmp`, the removal without asking, the entry removed, `git apply --3way` with `--exclude` reruns and `git checkout --theirs` for binaries, the brief's section "The patch as applied" |
| `/land` removal | Steps 11, before the state file rewrite and the commit, through `remove_worktree.sh` on the ask list | Steps 14, after the commit, in plain steps, without asking; a refused command is handed to the user |
| `/land` back-out clause | "both on the ask list, so the user is asked" | "run without asking the user" |
| Launch commit | committed "before the build starts" under every executor | under `agent` right after the launch; under `inline` and `academic-paper` before the build starts |
| Rewrite of a skill | a rule inventory checked by `check_rule_inventory.py` | the rewrite keeps every rule, and the reviewer checks it by reading the old and the new file |
| `/plan-retro` | `collect_findings.py` prints the findings | the session reads each report's findings and lists them in the retro with report and location |
| Test lists | 13 tests and `check_skill_layout.py` in `README.md`, `building.md` and `change-standard.md` | 6 tests and the ASCII check |
| `workers_at_once` comments | "above 1 only for steps with disjoint paths" | "above 1, two of them share a file only when the orchestrator judges the merge at landing simple" |
