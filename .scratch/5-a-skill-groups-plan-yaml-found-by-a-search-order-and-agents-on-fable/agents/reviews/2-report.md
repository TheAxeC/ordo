# Report: step 2, the sixteen skill folders grouped under four folders of `skills/`

Everything in the brief is done. Nothing is NOT DONE.

One point is handed to the orchestrator, since it lies in the ledger, which the builder does not write: the state file's `verify:` list and `standards:` value still name the skill paths of the flat layout (see "Handed back").

Open items of the state file, verbatim: `- none`

Every command below ran from the worktree's root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## The cases' first run, on the unchanged tree

No case showed a rule of the brief giving a wrong result, so there was no stop.

| Case | Run on the unchanged tree | Result |
|---|---|---|
| C1, C6, C7 | Each new case of `utils/pin.test.sh` run alone (the test up to its helpers, the tags of the grouped layout, that one case) against the unchanged `utils/pin.sh` | each fails, lines below |
| C2 | The README's loop as it stood, on a scratch folder | 16 folders, 16 `SKILL.md` (flat layout; the loop had no stop for a missing skill) |
| C3 | The gate's `perl` line | 215 lines |
| C4 | `ls skills`; `find skills -name SKILL.md \| wc -l` | the sixteen skill names; 16 |
| C5 | `npx --yes skills add . --list` | the sixteen skills listed |
| C8 | not runnable before the move: no grouped worktree to link into | - |
| C9 | `python3 skills/ordo/ordo-init/templates/check_config.py .` | `can't open file ... [Errno 2] No such file or directory`, exit 2 |
| C9 | the unchanged `check_config.py` (`git show HEAD:skills/ordo-init/templates/check_config.py`) placed in a scratch grouped layout, `plan` in `skills/orchestration/` | `FileNotFoundError: [Errno 2] No such file or directory: '<scratch>/skills/ordo/ordo-init/templates/../../plan/templates/plan.yaml'`, exit 1 |

The failing line of each new case of `utils/pin.test.sh` on the unchanged `pin.sh` (rule 13):

| Behaviour | Case | Failing line on the unchanged `pin.sh` |
|---|---|---|
| A grouped tag pins, each skill linked to its folder in its group | a grouped tag is pinned | `FAIL: pinning a grouped tag failed:  pin: tag g1 holds no skill` |
| A grouped pin over a flat pin moves each link into the group (C7) | a grouped tag pinned over a flat pin | `FAIL: pinning a grouped tag over a flat pin failed:  pin: tag g1 holds no skill` |
| One name in two groups is refused, both folders named (C6) | one skill name in two groups is refused | `FAIL: the skill name in two groups was not refused with its message; expected the line "pin: tag g-two-groups holds the skill beta twice, in skills/one/beta and skills/two/beta" in: pin: tag g-two-groups holds no skill` |
| One name in the flat and the grouped place is refused | one skill name in the flat and the grouped place is refused | `FAIL: a pin of a tag with one skill name in the flat and the grouped place: exit 0, expected 1: ...` (the unchanged script pinned the tag: `pinned: g-flat-and-grouped (7bffd56), 1 skills linked in: ...`) |
| A flat pin over a grouped pin puts each link back | a flat tag pinned over a grouped pin | `FAIL: pinning the grouped tag before the flat one failed:  pin: tag g1 holds no skill` |
| Check mode names a link at the flat place in one line | check mode names a link at the flat place on a grouped pin | `FAIL: pinning the grouped tag before moving a link failed:  pin: tag g1 holds no skill` |
| A grouped tag that drops a skill removes its link | a grouped tag that drops a skill removes its link | `FAIL: pinning the grouped tag before the one that drops a skill failed:  pin: tag g1 holds no skill` |
| A `SKILL.md` in a ledger folder is no skill | a SKILL.md inside a ledger folder is no skill | `FAIL: pinning a tag with a SKILL.md inside a ledger folder failed:  pin: tag g1-ledger holds no skill` |

The whole test on the unchanged `pin.sh`: `FAIL: pinning a grouped tag failed:  pin: tag g1 holds no skill`.

## DONE / NOT DONE

| # | Item | State | What changed, and the proof |
|---|---|---|---|
| 1 | The sixteen folders moved with `mv` | DONE | `ls skills` prints `academic code orchestration ordo`; `find skills -name SKILL.md \| wc -l` prints 16. 127 files moved; compared with `git show HEAD:<old path>`, 123 are byte-equal and 4 differ, the four this step edits. |
| 2 | Scripts that reach another skill work installed and grouped; `/ordo-help skills` | DONE | `check_config.py`: `plan_skill()` looks in `<parent>/plan`, then in `<parent's parent>/*/plan`, and raises to an `error:` line and exit 1 when neither holds `templates/plan.yaml`; the head comment lists the error and says how the folder is found. `check_config.test.sh` finds the two example files the same way. `grep -rnE '\.\./\|"\.\."\|pardir' skills utils` prints no other path that crosses to another skill (the other hits are test data and path checks inside `lookup.test.sh`, `land.sh`, `check_coverage.py`, `check_config.py:111`). `skills/ordo/ordo-help/SKILL.md`, "What it reads" 2 and 3 and "skills" steps 1 and 2, say how the skills folder is found in each installation. Proof: C8 and C9 below. |
| 3 | `utils/pin.sh` reads the three layouts | DONE | `skill_paths` reads the folders `skills/<group>/<name>`, `skills/<name>`, and `<name>` only when `skills/` holds no skill, from the tag's files and, for the pinned worktree, from the files of the commit it is checked out at. `skill_root` and `skills_of` are gone (`git grep -n 'skill_root\|skills_of' -- skills utils docs README.md` prints nothing). Linking, `check_links`, the refusals and the removal use the folder as found. A doubled name is refused before anything changes: `pin: tag <tag> holds the skill <name> twice, in <path> and <path>`. Check mode reports a link at a skill's place in another layout with the one "does not link to" line. Head comment rewritten for the three layouts and the refusal. Proof: `sh utils/pin.test.sh`, below. |
| 4 | `utils/pin.test.sh` | DONE | The fixture's folder is written as `$flat`; the gate's line prints no line of the test. Eight new cases (the doubled name is two), each printing an `ok:` line; the head comment names them with what a failure costs. Every earlier case is kept. |
| 5 | The README | DONE | The copy loop names each skill with its group, stops with a message at a skill it does not find, and copies under the skill's own name; a paragraph under the table of skills gives the four groups and the flat installation; the CLI text, the `<skills>` placeholder and the pin section say what holds in each. Proof: C2 below. |
| 6 | Every path names its new place | DONE | The gate's line prints nothing (C3). `docs/dev/skill-layout.md` reads `skills/<group>/<name>/SKILL.md` and `glob.glob("skills/*/*/SKILL.md")` (run: 16 lines); `docs/dev/change-standard.md` reads `skills/*/*/SKILL.md`; `.agents/plan.yaml`'s `standards` names `skills/ordo/repo-setup/templates/docs/dev/prose-standard.md`. |
| 7 | No `metadata.version` raised | DONE | The diff of the four edited files under `skills/` holds no `version` line. |

## The cases' run after

C1, C6, C7, `sh utils/pin.test.sh 2>&1`:

```
ok: a grouped tag is pinned
ok: a grouped tag pinned over a flat pin
ok: one skill name in two groups is refused
ok: one skill name in the flat and the grouped place is refused
ok: a flat tag pinned over a grouped pin
ok: check mode names a link at the flat place on a grouped pin
ok: a grouped tag that drops a skill removes its link
ok: a SKILL.md inside a ledger folder is no skill
PASS: pin.sh scratch tests
```

C2, the README's loop (the lines from `for dir in ~/.claude/skills; do` to `done`, taken from `README.md` with `sed`, `/tmp/ordo` replaced by the worktree's root and `~/.claude/skills` by `<scratch>/c2/skills`): exit 0; `ls <scratch>/c2/skills | wc -l` prints 16; `ls <scratch>/c2/skills/*/SKILL.md | wc -l` prints 16; `<scratch>/c2/agents` holds the five `ordo-*.md`. The same loop from a copy of the worktree's `skills/` and `agents/` (all the loop reads) with `skills/code/diagnose` moved away prints `no skill at <scratch>/copy/skills/code/diagnose; the copy stopped before diagnose`, leaves 13 skill folders and no `agents` folder; under `zsh` it prints the same line and leaves 13.

C3, the gate's `perl` line fed `git ls-files -coz --exclude-standard -- ':!.scratch'` with the missing paths left out: prints nothing (0 lines).

C4: `ls skills` prints `academic code orchestration ordo`; `find skills -name SKILL.md | wc -l` prints 16; `ls skills/*` prints `skills/academic: paper writing`, `skills/code: code-comments diagnose`, `skills/orchestration: grill land plan plan-orchestration plan-retro refute roadmap spec`, `skills/ordo: ordo-help ordo-init repo-setup session-retro`.

C5, `npx --yes skills add . --list`: `Found 16 skills`, the names `paper writing code-comments diagnose grill land plan plan-orchestration plan-retro refute roadmap spec ordo-help ordo-init repo-setup session-retro`. A further run, `npx --yes skills add <worktree> --skill '*' -a claude-code -y` in a scratch project folder with a scratch `HOME`, left 16 folders in `<scratch>/proj/.claude/skills`, each under the skill's own name; the README's sentence on the CLI rests on it.

C8, the Steps of `/ordo-help skills` by hand. On `<scratch>/c8/links`, one link per skill into the worktree's grouped folders: `cd <scratch>/c8/links/ordo-help && pwd -P` gives `<worktree>/skills/ordo/ordo-help`; its parent `<worktree>/skills/ordo` is directly inside a folder named `skills`, so it is a group folder and the skills folder is `<worktree>/skills`; the folders in each folder of it that hold `SKILL.md`, sorted with `LC_ALL=C sort`: 16, `code-comments diagnose grill land ordo-help ordo-init paper plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec writing`. On the flat copy `<scratch>/c2/skills`: the resolved path is `<scratch>/c2/skills/ordo-help`, its parent is the skills folder, and it holds the same 16.

C9: `python3 skills/ordo/ordo-init/templates/check_config.py .` prints `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0. The script copied with `plan` into `<scratch>/c9flat/ordo-init` and `<scratch>/c9flat/plan`: the same line, exit 0. Through the link `<scratch>/c9links/ordo-init`: the same line, exit 0. With `plan` in neither place (`<scratch>/c9none/only/ordo-init` alone): `error: the plan skill's templates/plan.yaml is in neither <scratch>/c9none/only/plan nor <scratch>/c9none/*/plan`, exit 1. `sh <scratch>/flat/ordo-init/templates/check_config.test.sh`, the test in a flat copy beside `plan`, prints `PASS: check_config.py scratch tests`.

## Verification, as printed

```
$ sh skills/code/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
PASS: strip_comments.py scratch tests
$ sh skills/orchestration/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, ... [the line as the test prints it]
$ sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names ... [the line as the test prints it]
$ sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
PASS: calibration_counts.py counts misses and false alarms per label, exits 0 below the limits 0.15 and 0.10, exits 1 at or above one, and exits 2 for a label outside the three
$ sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, ... [the line as the test prints it]
$ sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1
PASS: reference_docx.py writes the layout defaults into the styles and the section properties, ... [the line as the test prints it]
$ sh skills/ordo/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

`sync_rules.py` exits 0. The character-set check over the 45 files whose text the step changes (the 41 `git diff --name-only --diff-filter=M` lists and the four edited files under `skills/`) prints nothing, exit 0. These checks do not cover whether the rewritten sentences read well; that is for the review.

The suite total: `utils/pin.test.sh` gains eight cases; no other test changed its cases.

## Files changed

Lines added and removed, from `git diff --numstat` and, for the moved files, a `diff` against `git show HEAD:<old path>`:

- `utils/pin.sh` 54 added, 28 removed (530 lines)
- `utils/pin.test.sh` 141 added, 3 removed (563 lines)
- `skills/ordo/ordo-init/templates/check_config.py` 31 lines added or removed
- `skills/ordo/ordo-init/templates/check_config.test.sh` 10
- `skills/ordo/ordo-help/SKILL.md` 10
- `skills/orchestration/grill/SKILL.md` 2 (one path)
- `README.md` 16 added, 12 removed
- `.agents/plan.yaml` 1 and 1
- `docs/academic-coverage.md` 83 and 83
- `docs/roadmap.md` 17 and 17
- `docs/glossary.md` 9 and 9
- `docs/dev/scripts.md` 23 and 23
- `docs/dev/change-standard.md` 13 and 13
- `docs/dev/building.md` 12 and 12
- `docs/dev/skill-layout.md` 3 and 3
- `docs/figures/academic-paper-comparison/gen_comparison.py` 1 and 1
- 29 files under `docs/adr/`, 48 and 48 in all
- 123 further files under `skills/`, moved and byte-equal
- `skills/ordo/repo-setup/templates/plan-terms.md` is unchanged: the gate's line found no path in it.

## Rule 14: the grep, and the sentences about a file as a whole

- `git grep -n 'skill_root\|skills_of' -- skills utils docs README.md`: nothing.
- A search of every tracked file outside `.scratch` for `skills/<one of the sixteen names>` not preceded by `<skills>`, `.claude/`, `.agents/`, `CONFIG_DIR/` or `.claude-*/`: nothing, so no repository path is left in a form the gate's line does not match.
- `utils/pin.sh`, head comment, "A skill is a folder that holds SKILL.md, in one of three layouts": holds, `skill_paths`. "Check mode reports ...": holds, `check_links`. "Pin mode refuses, before anything changes, a tag that holds two skills of one name": holds, the `doubled` lines stand before "Every refusal happens here" and before any checkout or link.
- `utils/pin.test.sh`, head comment: the six lines added name the eight new cases.
- `check_config.py`, docstring: the error list holds the new `error:` line.
- `docs/dev/building.md`, the `pin.test.sh` comment "pin.sh in pin and check mode under a scratch HOME, its refusals included": still holds. `docs/dev/scripts.md`: no script added, removed or renamed; the rows' paths are rewritten.
- `skills/ordo/ordo-help/SKILL.md`, description and introduction, "every skill in the folder that holds this skill": left as written (judgment 3).

## User-visible changes, before and after

- `pin.sh <tag>` on a grouped tag: before `pin: tag <tag> holds no skill`, exit 1; after, each skill linked to `<pinned worktree>/skills/<group>/<name>`.
- `pin.sh <tag>` on a tag with one skill name twice: before, the flat one linked, or `holds no skill`; after, `pin: tag <tag> holds the skill <name> twice, in <path> and <path>`, exit 1, nothing changed.
- `pin.sh` check mode, an entry of a skill of the pinned tag linking elsewhere inside the pinned worktree: before two lines ("does not link to" and "which the pinned tag does not have"); after the first line only.
- `pin.sh` reads the skills of the pinned worktree from the commit it is checked out at; before, from the folders on disk.
- `check_config.py` with no `plan` skill beside it or in a sibling group: before a Python traceback; after the `error:` line, exit 1.
- The README's copy loop: before, a missing skill folder made `cp` fail and the loop went on; after, the loop stops with its message. Its `rm -rf` reads `"${dir:?}/${name:?}"`.

## Judgments taken

1. `pin.sh` treats every `skills/<a>/<b>/SKILL.md` as a grouped skill, with no exception for a `SKILL.md` one level inside a flat skill's folder. No tag of the repository holds such a file (`git ls-tree -r --name-only` over every tag), and the brief names no such case.
2. The message of the doubled name names the first two folders of the first doubled name in sorted order; the brief fixes only that it starts `pin: ` and names both paths.
3. `ordo-help`'s description and introduction keep "every skill in the folder that holds this skill". Installed by copy or by links, the folder that holds the skill as the user sees it holds the sixteen. The line is one step 1 also edits, so it is left; the orchestrator may rule otherwise.
4. `ordo-help` decides that the real parent is a group folder by its standing directly inside a folder named `skills`, the same shape `pin.sh` reads. A tag that mixes flat and grouped skills is not covered in `ordo-help`'s text; Ordo's own tags do not mix them.
5. The README states the groups in a paragraph under the table of skills, with no new column, so the sixteen rows other steps may edit stay untouched.
6. Sentences corrected because the rewritten path made them false: `docs/roadmap.md`, "Waits on: 5.A, which moves `paper` to `skills/academic/paper/`"; eight lines of `docs/academic-coverage.md`, "commit `f9a00ab` holds as the `paper` skill's `references/...`"; one ADR line, "lines 102 to 304 of the `paper` skill's `agents/literature_strategist_agent.md` at commit b8819b0". Each names a file at a commit where the grouped path did not exist.
7. `docs/dev/building.md`: the comments of the command block are aligned again after the paths grew; the commands are the same apart from their paths.
8. `docs/roadmap.md:120` keeps `ls skills/*/SKILL.md` and `ls -1 skills/`: it quotes a run of a done entry, and the gate's line does not match it.

## Handed back

- The state file `.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/orchestrator-state.md` holds, in its configuration block, the `verify:` commands at lines 7 to 16 (`sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1` through `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`) and `standards:` at line 21 with `skills/repo-setup/templates/docs/dev/prose-standard.md`. After this step those paths do not exist, so the landing's verify list fails until the block names the paths `docs/dev/building.md` now gives. The ledger is the orchestrator's, so the builder did not change it. The state files of other open plans were not read.
- Steps 1 and 3 edit files this step moves; their changes apply to the new paths.
