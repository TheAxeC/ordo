# Report: step 1, the prose standard moved into the writing skill

NOT DONE: verify item 1 as the brief words it. In the worktree the ASCII check of the verify list prints one line, `Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.`, because `git ls-files -c` still lists the deleted file until the deletion is staged, and the builder may not run `git rm` or `git add`. The line is a perl open warning, not a non-ASCII hit; the check exits 0 and `verify: 7 commands passed` is printed. Every other item of the brief is done.

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

No case was wrong under the brief's rules, so no ruling was needed. Scratch copies are `cp -R` copies of the worktree under the session scratchpad; `check_config.py` there runs only the read-only `git check-ignore --no-index`, and `git grep` there runs with `--no-index`.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| Move, byte for byte (case 2) | DONE | `cmp skills/writing/references/prose-standard.md <(git show dd26e9d:skills/repo-setup/templates/docs/dev/prose-standard.md); echo "cmp exit $?"; ls skills/repo-setup/templates/docs/dev/; find skills/writing -type f` | `cmp exit 0` / `change-standard.md` / `skills/writing/references/prose-standard.md` |
| No other file under `skills/writing/` | DONE | `find skills/writing -type f` | `skills/writing/references/prose-standard.md` only |
| Old path gone outside `.scratch` (case 1) | DONE | `git grep -n "templates/docs/dev/prose-standard" -- ':!.scratch'; echo "exit $?"` | no line, `exit 1` |
| `SKILL.md` "What it reads" 1 and 3, tree line, Rules | DONE | the four `grep -n` lines of the SKILL.md check below | the four lines 28, 30, 109, 146 quoted under "Before and after"; `lines found: 4` |
| `docs/dev/skill-layout.md` line 3, `.agents/plan.yaml` line 12 | DONE | `git diff -U0 -- docs/dev/skill-layout.md .agents/plan.yaml` | quoted under "Before and after" |
| `standards` page exists (case 3) | DONE | `python3 skills/ordo-init/templates/check_config.py . \| grep -v '^note:'` | `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0 |
| Refusal on the old `standards` line (case 4) | DONE | scratch copy r3, old line 12 restored, same command | `error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md`, exit 1 |
| sync_rules test (case 5) | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: sync_rules.py scratch tests` |
| `templates/CLAUDE.md` line 18 and `templates/shared-rules.md` line 22 unchanged | DONE | `git diff --stat` | neither file listed |
| Verify list prints six `PASS:`, nothing for ASCII, `verify: 7 commands passed`, exit 0 | NOT DONE as worded | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"` | see the output below: six `PASS:`, one `Can't open` line from the ASCII check, `verify: 7 commands passed`, `exit 0` |
| ASCII over every file present on disk | DONE | the verify list's ASCII command with the listing filtered to existing files (`perl -0 -ne 'chomp; print "$_\0" if -e $_'` between `git ls-files` and `xargs`) | no output, `ascii over existing files exit 0` |
| ASCII of the touched files | DONE | `LC_ALL=C grep -n "[^ -~]" skills/repo-setup/SKILL.md docs/dev/skill-layout.md .agents/plan.yaml skills/writing/references/prose-standard.md` | no output, `grep exit 1` |
| Only the brief's paths | DONE | `git diff --stat`; `git status --short` | see below |

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

`git ls-files -co --exclude-standard | grep prose-standard` prints both `skills/writing/references/prose-standard.md` and `skills/repo-setup/templates/docs/dev/prose-standard.md`: the second is in the index and absent on disk. The landing script's head comment says it stages the tool directory and makes a wip commit in the worktree, which records the deletion; on main the path is then not listed and the ASCII check prints nothing. That run on main is not verified here.

`git diff --stat` and `git status --short`, verbatim:

```
 .agents/plan.yaml                                  |  2 +-
 docs/dev/skill-layout.md                           |  2 +-
 skills/repo-setup/SKILL.md                         |  8 +--
 .../templates/docs/dev/prose-standard.md           | 75 ----------------------
 4 files changed, 6 insertions(+), 81 deletions(-)
 M .agents/plan.yaml
 M docs/dev/skill-layout.md
 M skills/repo-setup/SKILL.md
 D skills/repo-setup/templates/docs/dev/prose-standard.md
?? skills/writing/
```

That listing was taken before this report was written; `git status --short` run afterwards prints the same lines plus `?? .scratch/3-the-writing-base/agents/reviews/1-report.md`. The report is ASCII (`LC_ALL=C grep -n '[^ -~]'` over it prints nothing, exit 1).

### Checks and the reverts that turn them red (scratch copies r1 to r6)

| Check | Revert | Red output |
|---|---|---|
| Case 1 | r1: old line 3 of `docs/dev/skill-layout.md` restored | `docs/dev/skill-layout.md:3:Every ... The prose inside follows \`skills/repo-setup/templates/docs/dev/prose-standard.md\`.`, exit 0 |
| Case 1 | r2: old tree line of `skills/repo-setup/SKILL.md` restored | `skills/repo-setup/SKILL.md:109:docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md`, exit 0 |
| Case 1 | r3: old `standards` line of `.agents/plan.yaml` restored | `.agents/plan.yaml:12:standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # ...`, exit 0 |
| Case 3 (shown by case 4) | r3: old `standards` line restored | `error: standards names a file that does not exist: skills/repo-setup/templates/docs/dev/prose-standard.md`, exit 1 |
| Case 2, old file gone | r4: old file left in place | `ls skills/repo-setup/templates/docs/dev/` prints `change-standard.md` and `prose-standard.md` |
| Case 2, bytes equal | r5: first line of the moved page edited (`# The Prose standard`) | `skills/writing/references/prose-standard.md /dev/fd/63 differ: char 7, line 1`, `cmp exit 1` |
| SKILL.md check (four `grep -n` for "What it reads" 3, "What it reads" 1, the tree line, Rules) | r6: `skills/repo-setup/SKILL.md` restored from `git show c1de4b5:skills/repo-setup/SKILL.md` | `lines found: 0` (worktree: `lines found: 4`) |

The red runs in r1 and r2 used `git grep --no-index -n "templates/docs/dev/prose-standard" -- ":!.scratch" ":!.git"`, the same search without the index, since a copy must not touch the worktree's index.

## Files and line counts (`wc -l`)

- `skills/writing/references/prose-standard.md`: 75 (new, the same bytes as the deleted file).
- `skills/repo-setup/templates/docs/dev/prose-standard.md`: deleted (75 lines at the base).
- `skills/repo-setup/SKILL.md`: 154, four lines changed.
- `docs/dev/skill-layout.md`: 72, line 3 changed.
- `.agents/plan.yaml`: 12, line 12 changed.
- `.scratch/3-the-writing-base/agents/reviews/1-report.md`: this report.

## Judgment calls

- "What it reads" 1 names the three `docs/` pages `templates/` holds after the move (`docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, from `find skills/repo-setup/templates -type f`) in place of "the `docs/` pages". It keeps the item's existing scope: files the skill reads, so `sync_rules.test.sh`, which the skill does not read, stays out as before.
- "What it reads" 3 appends the `writing` skill's file after the `roadmap` skill's, moving the "and" to the last element.

## Before and after of every visible change

- `skills/repo-setup/SKILL.md` line 28. Before: ``1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.`` After: ``1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md`, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.``
- `skills/repo-setup/SKILL.md` line 30. Before: ``3. The `ordo-init` and `roadmap` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`.`` After: ``3. The `ordo-init`, `roadmap` and `writing` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, the `roadmap` skill's `templates/roadmap.md`, and the `writing` skill's `references/prose-standard.md`.``
- `skills/repo-setup/SKILL.md` line 109. Before: `docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md` After: `docs/dev/prose-standard.md       the writing skill's references/prose-standard.md`
- `skills/repo-setup/SKILL.md` line 146. Before: ``- Everything the skill writes comes from `templates/` in this skill's folder, from the user's answers, and from the `ordo-init` and `roadmap` skills beside it.`` After: the same sentence ending ``from the `ordo-init`, `roadmap` and `writing` skills beside it.``
- `docs/dev/skill-layout.md` line 3. Before: ``The prose inside follows `skills/repo-setup/templates/docs/dev/prose-standard.md`.`` After: ``The prose inside follows `skills/writing/references/prose-standard.md`.``
- `.agents/plan.yaml` line 12. Before: `standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # ...` After: `standards: [docs/dev/skill-layout.md, skills/writing/references/prose-standard.md] # ...`

## Sentences reread against the changed files (rule 14)

`grep -n "docs/\|templates\|prose\|beside" skills/repo-setup/SKILL.md` after the change; each hit still holds:

- Line 3, the description ("docs/ with the change standard, the prose standard, ..."): the set-up repository still gets `docs/dev/prose-standard.md` (tree line 109).
- Line 31 and Steps / sync lines 71 and 75 name `templates/sync_rules.py` and `templates/shared-rules.md`, both still in `templates/` (`find skills/repo-setup/templates -type f`).
- Tree lines 108, 113, 114 name `templates/docs/dev/change-standard.md`, `templates/docs/adr/README.md`, `templates/docs/adr/template.md`, all present (same `find`).
- Line 148 ("writes nothing outside the repository's folder, except a change to `templates/shared-rules.md`"): the skill reads the `writing` skill's file and writes only into the repository, so it holds.
- Line 154 ("Every file it writes follows the prose standard"): holds; the standard's text is unchanged (`cmp exit 0`).

Other names of the old location across `skills/`, `utils/`, `docs/` and `README.md` (`grep -rn "templates/docs\|skills/writing\|references/" skills utils docs README.md .agents/plan.yaml`): the remaining `templates/docs` hits are the `change-standard.md` and `adr/` templates, which stay in `repo-setup` (`skills/repo-setup/SKILL.md` lines 108, 113, 114; `skills/ordo-init/SKILL.md` line 56). `skills/repo-setup/templates/docs/dev/change-standard.md` line 3 ("The coding and prose standards beside this page") describes the set-up repository, where `docs/dev/prose-standard.md` still sits beside `docs/dev/change-standard.md`, so it holds. `utils/pin.sh` line 95 links only folders holding `SKILL.md` (`"$(skill_root "$1")"/*/SKILL.md`), and `PASS: pin.sh scratch tests` is printed with `skills/writing/` present.

## What in the brief was wrong or impossible

- Verify item 1 expects the ASCII check to print nothing in the worktree. With a deletion the builder may not stage, `git ls-files -coz --exclude-standard` still lists the deleted path, and perl prints `Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.` Evidence: `git ls-files -co --exclude-standard | grep prose-standard` lists the deleted path, and the same ASCII command over the files present on disk prints nothing and exits 0. The expectation holds once the deletion is committed at landing; the orchestrator rules whether the landing run on main is the proof for this line.
- The worktree's `orchestrator-state.md` `standards` line still names the old path; the brief assigns that change to the orchestrator at landing, and `verify.sh` reads the `verify:` key of the state file's first yaml block (its head comment, `skills/land/templates/verify.sh` line 2), so the line did not affect the run.
