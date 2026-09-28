# Report: step 1, the prose standard moved into the writing skill

NOT DONE: verify item 1 as the brief words it. In the worktree the ASCII check of the verify list prints one line, `Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.`, because `git ls-files -c` still lists the deleted file until the deletion is staged, and the builder may not run `git rm` or `git add`. The line is a perl open warning, not a non-ASCII hit; the check exits 0 and `verify: 7 commands passed` is printed. Every other item of the brief and of repair round 1 is done.

## Open items of the state file (verbatim, from the worktree's `.scratch/3-the-writing-base/orchestrator-state.md`)

- None.

## The cases' first run, on the unchanged tree (c1de4b5)

| Case | Command | Result on the unchanged tree | Against the brief |
|---|---|---|---|
| 1 | `git grep -n "templates/docs/dev/prose-standard" -- ':!.scratch'` | three lines, exit 0: `.agents/plan.yaml:12`, `docs/dev/skill-layout.md:3`, `skills/repo-setup/SKILL.md:109` | as the brief says ("two lines plus `.agents/plan.yaml`") |
| 2 | `cmp skills/writing/references/prose-standard.md <(git show dd26e9d:...)`; `ls skills/repo-setup/templates/docs/dev/` | `cmp: skills/writing/references/prose-standard.md: No such file or directory`, exit 2; `ls` lists `change-standard.md` and `prose-standard.md` | red, as expected before the move |
| 3 | `python3 skills/ordo-init/templates/check_config.py .` | `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0 | green before and required green after |
| 4 | the same, on a scratch copy of the worktree | unchanged copy: `ok: ...`, exit 0. Copy with the file moved and `standards` left on the old path: `error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md`, exit 1 | refuses as the brief says |
| 5 | `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: sync_rules.py scratch tests` | as the brief says |

No case was wrong under the brief's rules, so no ruling was needed. Scratch copies are `cp -R` copies of the worktree under the session scratchpad, outside the repository; `check_config.py` there runs only the read-only `git check-ignore --no-index`, and `git grep` there runs with `--no-index`.

## DONE / NOT DONE

The outputs below are from the run after repair round 1.

| Item | State | Command | Output |
|---|---|---|---|
| Move, byte for byte (case 2) | DONE | `cmp skills/writing/references/prose-standard.md <(git show dd26e9d:skills/repo-setup/templates/docs/dev/prose-standard.md); echo "cmp exit $?"; ls skills/repo-setup/templates/docs/dev/; find skills/writing -type f` | `cmp exit 0` / `change-standard.md` / `skills/writing/references/prose-standard.md` |
| No other file under `skills/writing/` | DONE | `find skills/writing -type f` | `skills/writing/references/prose-standard.md` only |
| Old path gone outside `.scratch` (case 1) | DONE | `git grep -n "templates/docs/dev/prose-standard" -- ':!.scratch'; echo "exit $?"` | no line, `exit 1` |
| `SKILL.md` "What it reads" 1, 3, 4, 5 and 6, tree line, Rules | DONE | the SKILL.md check, quoted in full below | seven lines, `lines found: 7` |
| `docs/dev/skill-layout.md` line 3, `.agents/plan.yaml` line 12 | DONE | `git diff -U0 -- docs/dev/skill-layout.md .agents/plan.yaml` | quoted under "Before and after" |
| `README.md` install loop and install sentence (round 1) | DONE | `git diff -U0 README.md`; the scratch install below | quoted under "Before and after" and "Repair round 1" |
| `standards` page exists (case 3) | DONE | `python3 skills/ordo-init/templates/check_config.py . \| grep -v '^note:'` | `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0 |
| Refusal on the old `standards` line (case 4) | DONE | scratch copy r9, old line 12 restored, same command | `error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md`, exit 1 |
| sync_rules test (case 5) | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: sync_rules.py scratch tests` |
| `templates/CLAUDE.md` line 18 and `templates/shared-rules.md` line 22 unchanged | DONE | `git diff --stat` | neither file listed |
| Verify list prints six `PASS:`, nothing for ASCII, `verify: 7 commands passed`, exit 0 | NOT DONE as worded | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"` | see the output below: six `PASS:`, one `Can't open` line from the ASCII check, `verify: 7 commands passed`, `exit 0` |
| ASCII over every file present on disk | DONE | the verify list's ASCII command with the listing filtered to existing files (`perl -0 -ne 'chomp; print "$_\0" if -e $_'` between `git ls-files -coz --exclude-standard` and `xargs -0`) | no output, `exit 0` |
| Only the brief's paths, widened to `README.md` by round 1 | DONE | `git diff --stat`; `git status --short` | see below |

The verify list's output, verbatim:

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

`git ls-files -co --exclude-standard | grep prose-standard` prints both `skills/writing/references/prose-standard.md` and `skills/repo-setup/templates/docs/dev/prose-standard.md`: the second is in the index and absent on disk. The landing script's head comment says it stages the tool directory and makes a wip commit in the worktree, which records the deletion; the refuter reports the same verify command on a scratch clone with the step committed printing no ASCII line. The run on main is not verified by the builder.

`git diff --stat` and `git status --short`, verbatim:

```
 .agents/plan.yaml                                  |  2 +-
 README.md                                          |  4 +-
 docs/dev/skill-layout.md                           |  2 +-
 skills/repo-setup/SKILL.md                         | 12 ++--
 .../templates/docs/dev/prose-standard.md           | 75 ----------------------
 5 files changed, 11 insertions(+), 84 deletions(-)
 M .agents/plan.yaml
 M README.md
 M docs/dev/skill-layout.md
 M skills/repo-setup/SKILL.md
 D skills/repo-setup/templates/docs/dev/prose-standard.md
?? .scratch/3-the-writing-base/agents/reviews/1-report.md
?? skills/writing/
```

### The SKILL.md check

The check is a file of seven `grep -n` commands, run from the worktree root as `sh skillcheck.sh` and counted with `sh skillcheck.sh | wc -l`:

```sh
f=skills/repo-setup/SKILL.md
grep -n '^1\. `templates/` in this skill.s folder: `CLAUDE.md`, `shared-rules.md`, `docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`\.$' $f
grep -n '^3\. The `ordo-init` skill beside this skill.s folder: `/ordo-init` and the `ordo-init` skill.s `templates/check_config.py`\.$' $f
grep -n '^4\. The `roadmap` skill beside this skill.s folder: the `roadmap` skill.s `templates/roadmap.md`\.$' $f
grep -n '^5\. The `writing` skill beside this skill.s folder: the `writing` skill.s `references/prose-standard.md`\.$' $f
grep -n '^6\. For `sync`, ' $f
grep -n '^docs/dev/prose-standard.md  *the writing skill.s references/prose-standard.md$' $f
grep -n 'from the `ordo-init`, `roadmap` and `writing` skills beside it\.$' $f
```

Output in the worktree:

```
28:1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.
30:3. The `ordo-init` skill beside this skill's folder: `/ordo-init` and the `ordo-init` skill's `templates/check_config.py`.
31:4. The `roadmap` skill beside this skill's folder: the `roadmap` skill's `templates/roadmap.md`.
32:5. The `writing` skill beside this skill's folder: the `writing` skill's `references/prose-standard.md`.
33:6. For `sync`, the repository's `CLAUDE.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` for the exit-2 draft.
111:docs/dev/prose-standard.md       the writing skill's references/prose-standard.md
148:- Everything the skill writes comes from `templates/` in this skill's folder, from the user's answers, and from the `ordo-init`, `roadmap` and `writing` skills beside it.
lines found: 7
```

### Checks and the reverts that turn them red (scratch copies r1 to r9)

| Check | Revert | Red output |
|---|---|---|
| Case 1 | r1: old line 3 of `docs/dev/skill-layout.md` restored | `docs/dev/skill-layout.md:3:Every ... The prose inside follows \`skills/repo-setup/templates/docs/dev/prose-standard.md\`.`, exit 0 |
| Case 1 | r2: old tree line of `skills/repo-setup/SKILL.md` restored | `skills/repo-setup/SKILL.md:111:docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md`, exit 0 |
| Case 1 | r3: old `standards` line of `.agents/plan.yaml` restored | `.agents/plan.yaml:12:standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # ...`, exit 0 |
| Case 3 (shown by case 4) | r3 and r9: old `standards` line restored | `error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md`, exit 1 |
| Case 2, old file gone | r4: old file left in place | `ls skills/repo-setup/templates/docs/dev/` prints `change-standard.md` and `prose-standard.md` |
| Case 2, bytes equal | r5: first line of the moved page edited (`# The Prose standard`) | `skills/writing/references/prose-standard.md /dev/fd/63 differ: char 7, line 1`, `cmp exit 1` |
| SKILL.md check | r7: `skills/repo-setup/SKILL.md` restored from `git show c1de4b5:skills/repo-setup/SKILL.md` | no line, `lines found: 0` |
| SKILL.md check, the split of "What it reads" 3 | r8: items 3 to 5 joined back into the one-item form, item 6 back to 4 | only lines 28, 109 and 146 printed, `lines found: 3` |
| Scratch install | `writing` dropped from the loop list | `ls: .../inst2/repo-setup/../writing/references/prose-standard.md: No such file or directory`, `ls exit 1` |

The red runs in r1 and r2 used `git grep --no-index -n "templates/docs/dev/prose-standard" -- ":!.scratch" ":!.git"`, the same search without the index, since a copy must not touch the worktree's index. The r8 output, verbatim:

```
3. The `ordo-init`, `roadmap` and `writing` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, the `roadmap` skill's `templates/roadmap.md`, and the `writing` skill's `references/prose-standard.md`.
4. For `sync`, the repository's `CLAUDE.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` for the exit-2 draft.
28:1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.
109:docs/dev/prose-standard.md       the writing skill's references/prose-standard.md
146:- Everything the skill writes comes from `templates/` in this skill's folder, from the user's answers, and from the `ordo-init`, `roadmap` and `writing` skills beside it.
lines found: 3
```

## Files and line counts (`wc -l`)

- `skills/writing/references/prose-standard.md`: 75 (new, the same bytes as the deleted file).
- `skills/repo-setup/templates/docs/dev/prose-standard.md`: deleted (75 lines at the base).
- `skills/repo-setup/SKILL.md`: 156.
- `README.md`: 150, lines 54 and 70 changed.
- `docs/dev/skill-layout.md`: 72, line 3 changed.
- `.agents/plan.yaml`: 12, line 12 changed.
- `.scratch/3-the-writing-base/agents/reviews/1-report.md`: this report.

## Judgment calls

- "What it reads" 1 names the three `docs/` pages `templates/` holds after the move (`docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, from `find skills/repo-setup/templates -type f`) in place of "the `docs/` pages". It keeps the item's existing scope: files the skill reads, so `sync_rules.test.sh`, which the skill does not read, stays out as before.
- `README.md` line 54 said the skills "read each other's templates"; `/repo-setup` now reads the `writing` skill's `references/prose-standard.md`, which is not under `templates/`, so the sentence says "templates and references".

## Before and after of every visible change

- `skills/repo-setup/SKILL.md` line 28. Before: ``1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.`` After: ``1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.``
- `skills/repo-setup/SKILL.md` line 30. Before: ``3. The `ordo-init` and `roadmap` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`.`` After, lines 30 to 32:
  - ``3. The `ordo-init` skill beside this skill's folder: `/ordo-init` and the `ordo-init` skill's `templates/check_config.py`.``
  - ``4. The `roadmap` skill beside this skill's folder: the `roadmap` skill's `templates/roadmap.md`.``
  - ``5. The `writing` skill beside this skill's folder: the `writing` skill's `references/prose-standard.md`.``
- `skills/repo-setup/SKILL.md` line 31, now line 33: the number `4.` becomes `6.`; the text ("For `sync`, the repository's `CLAUDE.md`, ...") is unchanged.
- `skills/repo-setup/SKILL.md` line 109, now line 111. Before: `docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md` After: `docs/dev/prose-standard.md       the writing skill's references/prose-standard.md`
- `skills/repo-setup/SKILL.md` line 146, now line 148. Before: ``- Everything the skill writes comes from `templates/` in this skill's folder, from the user's answers, and from the `ordo-init` and `roadmap` skills beside it.`` After: the same sentence ending ``from the `ordo-init`, `roadmap` and `writing` skills beside it.``
- `README.md` line 54. Before: `The skills call each other and read each other's templates, so install all of them. ...` After: `The skills call each other and read each other's templates and references, so install all of them. ...` (the rest of the line unchanged).
- `README.md` line 70. Before: `    for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec; do` After: `    for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec writing; do`
- `docs/dev/skill-layout.md` line 3. Before: ``The prose inside follows `skills/repo-setup/templates/docs/dev/prose-standard.md`.`` After: ``The prose inside follows `skills/writing/references/prose-standard.md`.``
- `.agents/plan.yaml` line 12. Before: `standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # ...` After: `standards: [docs/dev/skill-layout.md, skills/writing/references/prose-standard.md] # ...`

## Sentences reread against the changed files (rule 14)

`grep -n "docs/\|templates\|prose\|beside" skills/repo-setup/SKILL.md` after the change; each hit still holds:

- Line 3, the description ("docs/ with the change standard, the prose standard, ..."): the set-up repository still gets `docs/dev/prose-standard.md` (tree line 111).
- Line 33 ("What it reads" 6) and Steps / sync lines 73 and 77 name `templates/sync_rules.py` and `templates/shared-rules.md`, both still in `templates/` (`find skills/repo-setup/templates -type f`).
- Tree lines 110, 115, 116 name `templates/docs/dev/change-standard.md`, `templates/docs/adr/README.md`, `templates/docs/adr/template.md`, all present (same `find`).
- Line 150 ("writes nothing outside the repository's folder, except a change to `templates/shared-rules.md`"): the skill reads the `writing` skill's file and writes only into the repository, so it holds.
- Line 156 ("Every file it writes follows the prose standard"): holds; the standard's text is unchanged (`cmp exit 0`).

`README.md`, read whole after the change: line 13 (the `repo-setup` row: "the change and prose standards") and line 80 ("writes ... the change and prose standards") still hold, since the set-up repository still gets both pages; line 59 installs every skill through the CLI with `--skill '*'`; line 82 names `skills/repo-setup/templates/shared-rules.md`, which stays. The table of skills (lines 11 to 22) is left alone, as the ruling says.

Other names of the old location across `skills/`, `utils/`, `docs/` and `README.md` (`grep -rn "templates/docs\|skills/writing\|references/" skills utils docs README.md .agents/plan.yaml`): the remaining `templates/docs` hits are the `change-standard.md` and `adr/` templates, which stay in `repo-setup` (`skills/repo-setup/SKILL.md` tree lines; `skills/ordo-init/SKILL.md` line 56). `skills/repo-setup/templates/docs/dev/change-standard.md` line 3 ("The coding and prose standards beside this page") describes the set-up repository, where `docs/dev/prose-standard.md` still sits beside `docs/dev/change-standard.md`, so it holds. `utils/pin.sh` line 95 links only folders holding `SKILL.md` (`"$(skill_root "$1")"/*/SKILL.md`), and `PASS: pin.sh scratch tests` is printed with `skills/writing/` present.

`git grep -n "What it reads" -- ':!.scratch'`: the numbered references are `skills/ordo-init/SKILL.md:83` ("What it reads" 3), `skills/plan-retro/SKILL.md:37` (2), `skills/plan/SKILL.md:83` (4) and `skills/spec/SKILL.md:66` and `:202` (4); each refers to its own skill's list. `grep -n "What it reads" skills/repo-setup/SKILL.md` prints only the heading, line 26. No reference to a `repo-setup` "What it reads" number exists, so the renumbering needed no other edit.

## What in the brief was wrong or impossible

- Verify item 1 expects the ASCII check to print nothing in the worktree. With a deletion the builder may not stage, `git ls-files -coz --exclude-standard` still lists the deleted path, and perl prints `Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.` Evidence: `git ls-files -co --exclude-standard | grep prose-standard` lists the deleted path, and the same ASCII command over the files present on disk prints nothing and exits 0. The orchestrator rules whether the landing run on main is the proof for this line.
- The worktree's `orchestrator-state.md` `standards` line still names the old path; the brief assigns that change to the orchestrator at landing, and `verify.sh` reads the `verify:` key of the state file's first yaml block (its head comment, `skills/land/templates/verify.sh` line 2), so the line did not affect the run.
- Not verified: whether the skills CLI route (`README.md` line 59, `npx skills add ... --skill '*'`) installs `skills/writing/`, which has no `SKILL.md` until the step that writes it. Checking it needs the network and writes outside the repository.

## Repair round 1

| Ruling | File:line | New text | Command that shows it |
|---|---|---|---|
| 1, the README's install | `README.md:70` | `    for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec writing; do` | `git diff -U0 README.md` |
| 1, a sentence the move made false | `README.md:54` | `The skills call each other and read each other's templates and references, so install all of them. ...` | `git diff -U0 README.md` |
| 1, the scratch install | scratch folder `inst` | `writing/references/prose-standard.md` beside `repo-setup` | the loop below |
| 2, "What it reads" 3 split | `skills/repo-setup/SKILL.md:30`, `:31`, `:32` | items 3 (`ordo-init`), 4 (`roadmap`), 5 (`writing`), each "beside this skill's folder" | `sed -n 26,34p skills/repo-setup/SKILL.md`; the SKILL.md check |
| 2, the item after them renumbered | `skills/repo-setup/SKILL.md:33` | `6. For \`sync\`, ...` | the SKILL.md check, fifth line |
| 2, references to a "What it reads" number | none to update | `grep -n "What it reads" skills/repo-setup/SKILL.md` prints only `26:## What it reads`; `git grep -n "What it reads" -- ':!.scratch'` lists only other skills' own lists | the two greps |
| 3, the SKILL.md check quoted and rerun | this report, "The SKILL.md check" | the seven commands, their output, `lines found: 7`; reverts r7 (`lines found: 0`) and r8 (`lines found: 3`) | `sh skillcheck.sh` |
| 4, every check rerun | this report, "DONE / NOT DONE" | verify list, cases 1 to 5, `git diff --stat` after this round | the commands in that table |

The scratch install copies the worktree to the scratchpad folder `ordo`, reads the skill list from line 70 of that copy's `README.md`, and runs the README's loop with `inst` as the only folder. The loop's `rm -rf` is written `rm -rf "${dir:?}/${skill:?}"`, which stops on an empty variable and otherwise removes the same path as the README's `rm -rf "$dir/$skill"`. Run under `bash -c`:

```sh
skills=$(sed -n "s/^    for skill in \(.*\); do\$/\1/p" "$S/ordo/README.md")
for dir in "$S/inst"; do mkdir -p "$dir"; for skill in $skills; do rm -rf "${dir:?}/${skill:?}" && cp -R "$S/ordo/skills/$skill" "$dir/"; done; done
ls "$S/inst"
ls "$S/inst/repo-setup/../writing/references/prose-standard.md"; echo "ls exit $?"
cmp "$S/inst/writing/references/prose-standard.md" "$S/ordo/skills/writing/references/prose-standard.md"; echo "cmp exit $?"
```

Output (`$S` is the session scratchpad):

```
loop list from README.md line 70: land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec writing
land
ordo-init
plan
plan-help
plan-orchestration
plan-retro
refute
repo-setup
roadmap
spec
writing
$S/inst/repo-setup/../writing/references/prose-standard.md
ls exit 0
cmp exit 0
```

The revert, `writing` dropped from the list and the loop run into `inst2`:

```
ls: $S/inst2/repo-setup/../writing/references/prose-standard.md: No such file or directory
ls exit 1
```

The verify list, cases 1 to 5 and `git diff --stat` were rerun after this round's edits; their output is the one quoted in "DONE / NOT DONE" above. Case outputs after this round, verbatim:

```
== case 1
exit 1
== case 2
cmp exit 0
change-standard.md
skills/writing/references/prose-standard.md
== case 3
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
exit 0
== case 4 (scratch copy r9, old standards line)
error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md
exit 1
== case 5
PASS: sync_rules.py scratch tests
```
