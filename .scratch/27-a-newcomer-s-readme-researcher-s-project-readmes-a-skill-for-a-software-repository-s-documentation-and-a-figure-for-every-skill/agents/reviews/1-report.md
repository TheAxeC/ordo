# Step 1 report

Everything in the brief is done. Two points are for the orchestrator to rule on: a premise of the brief is wrong (item 1 under "Anything in the brief that was wrong or impossible"), and the case on folders gives a different result in the worktree than after the commit (item 2 there).

## Open items of the state file, verbatim

- Open item B (2026-11-25, step 1, kind 4, the roadmap's gate): the gate's part "every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists" cannot pass once step 1 moves the figures, because `docs/roadmap.md` line 67, the done line of entry 25, records that you read `docs/figures/paper/lifecycle.svg`, a path that then no longer exists (`git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md` prints line 67). Step 1 goes on meanwhile and runs its check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The gate's part reads "... in `README.md`, `docs/` outside `docs/roadmap.md`, and `skills/` ...", written into entry 27's gate by `/roadmap` at the closing. Pro: the done line stays the true record of what you read; the check still covers every page that shows a figure. Con: the roadmap's own figure paths go unchecked, and today it names none outside done lines.
  - (b) Entry 25's done line is edited to `docs/figures/academic/paper/lifecycle.svg`. Pro: the gate stays as written. Con: a done entry's record is rewritten to a path that did not exist when you read it.
  - Lazy option: neither; leaving the gate as written and accepting a failed part at the closing.

## The cases' first run, on the unchanged tree (base 50a98c8, whose `docs/figures` matches ee15921)

No case was one the brief's rules get wrong on this run, so the build went on without a stop.

1. `python3 docs/figures/gen_figures.py` from the root: exit 0, 27 `wrote` lines at the old paths, the first `wrote docs/figures/pipeline.svg (23294 bytes)` and the last `wrote docs/figures/paper/run-folder.svg (21112 bytes)`. The new paths do not exist yet.
2. `python3 docs/figures/academic/researcher/gen_academic_pipeline.py`: `can't open file '.../docs/figures/academic/researcher/gen_academic_pipeline.py': [Errno 2] No such file or directory`, exit 2. The old script, `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`, printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, exit 0.
3. From `/tmp`, by path: `gen_figures.py` printed 27 lines (`| wc -l` printed `27`); the new pipeline path failed with the same `[Errno 2]` message, exit 2.
4. `cmp` of the 28 figures at their old paths against ee15921: every `cmp` exited 0, printing nothing. `git status --short docs/figures skills/code/handbook` printed nothing, exit 0.
5. `find skills docs/figures -name __pycache__`: printed nothing after `gen_figures.py`. After the old pipeline script ran it printed `docs/figures/__pycache__` (the import wrote it there, as the old head comment said). I removed that ignored folder with `rm -rf`.
6. `grep -n '^class \|^def '` over both scripts: `gen_figures.py` printed every engine definition, among them `142:class FigureError(Exception):`, `234:def _wrap(`, `415:class FlowLayout:`, `1043:def compose(`, `1076:def describe(...)`, `1174:def lanes_figure(` and `2685:def write_figures(...)`. The new pipeline path gave `ugrep: warning: docs/figures/academic/researcher/gen_academic_pipeline.py: No such file or directory`.
7. `grep -n 'import'` over both scripts: `gen_figures.py` lines 89 to 96 (the standard library only), plus line 55 of the head comment. No import from `skills/code/handbook/templates`. The new pipeline path was missing (exit 2).
8. The grep over `skills/code/handbook/templates/figures.py`: `ugrep: warning: skills/code/handbook/templates/figures.py: No such file or directory`, exit 2.
9. The folders of each listed figure: 13 flat (`.`), 1 under `academic-pipeline` and 14 under `paper`, none of them a group of `skills/` (the groups are `academic`, `code`, `explain`, `orchestration` and `ordo`). `ls docs/figures/paper docs/figures/academic-pipeline` exit 0.
10. Paths named under `README.md`, `docs` and `skills`: no missing path in either run, the one excluding `docs/roadmap.md` or the one including it.
11. The old-name grep over `README.md docs/dev`: three lines, `docs/dev/building.md:41`, `docs/dev/scripts.md:9` and `docs/dev/scripts.md:10`, exit 0.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| What to build 1, the moves of the table, old folders gone | DONE | `ls docs/figures/paper docs/figures/academic-pipeline` printed `ls: docs/figures/academic-pipeline: No such file or directory` and `ls: docs/figures/paper: No such file or directory`, exit 1. The C9 run over files on disk lists 28 `ok:` lines (below). |
| 2, the pipeline script moved, writing beside itself | DONE | `python3 docs/figures/academic/researcher/gen_academic_pipeline.py` printed `wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)`, `exit 0` |
| 3, the engine in `skills/code/handbook/templates/figures.py` | DONE | `grep -n '^import\|^from'` gives lines 73 to 79: `collections.abc`, `dataclasses`, `html`, `itertools`, `pathlib`, `statistics`, `typing`. `grep -n 'skills/\|docs/\|README\|HERE\|ROOT\|__file__'` printed nothing, `exit 1`. I diffed the engine against lines 89-1248 of `git show ee15921:docs/figures/gen_figures.py`. It shows only these changes: the import of `sys`, `HERE`, `ROOT`, the `RULED*` constants and the kinds `ruled`, `ruled_maybe`, `todo`, `ap`, `rev`, `pipe`, `dr` and `paper` are gone; `FLOW_WIDTH`, `WORDS`, `add_kind`, `graph`, `parts`, `flow_label`, `lanes_label` and `write_figures(base, figures_to_write, root)` are added; `_wrap` and `_node_height` are renamed `wrap` and `node_height`; `SIMPLE_LEGEND` and `PAPER_KIND_LEGEND` are gone; `describe` reads `WORDS`; the lanes separator comment is reworded. |
| 4, `gen_figures.py` imports the engine, keeps every figure, new `figures()` names, head comment | DONE | C1, C6 and C7 below; head comment lines 3 to 85 |
| 5, the pipeline script imports the engine the same way and nothing from `gen_figures.py` | DONE | C7 below |
| 6, every figure byte for byte | DONE | C4 below: `compared 28, differing 0` |
| 7, README, `building.md` line 41, `scripts.md`, ADRs 0043 and 0049 | DONE | `git diff --numstat`: `27 27 README.md`, `1 1 docs/dev/building.md`, `5 2 docs/dev/scripts.md`, `1 1` for each ADR. C10 and C11 below |
| Verify 1, character-set check over the 36 files the step changes on disk | DONE | Prints nothing. `exit 0`. The list came from `git diff --name-only` plus `git ls-files -o --exclude-standard`, kept to files that exist and that sit outside `.scratch/`. Its 36 lines are counted by `wc -l`. |
| Verify 2, both scripts exit 0, then `cmp` exits 0 | DONE | C1, C2 and C4 below |
| Verify 3, every case | DONE | below |
| Verify 4, the new sentences against the standards | DONE | see "Sentences read against the standards" |

### The cases after the change, each output as printed

C1, `python3 docs/figures/gen_figures.py`:

```
wrote docs/figures/orchestration/pipeline.svg (23294 bytes)
wrote docs/figures/orchestration/plan-loop.svg (21454 bytes)
wrote docs/figures/orchestration/grill.svg (7455 bytes)
wrote docs/figures/academic/writing.svg (5191 bytes)
wrote docs/figures/academic/paper-review-panel.svg (12433 bytes)
wrote docs/figures/academic/referee.svg (20328 bytes)
wrote docs/figures/academic/submit.svg (13466 bytes)
wrote docs/figures/academic/grant.svg (17219 bytes)
wrote docs/figures/code/code-comments.svg (5921 bytes)
wrote docs/figures/code/codebase-design.svg (11420 bytes)
wrote docs/figures/academic/researcher/manuscript.svg (37095 bytes)
wrote docs/figures/academic/researcher/research.svg (40510 bytes)
wrote docs/figures/academic/researcher/revision.svg (63508 bytes)
wrote docs/figures/academic/paper/full.svg (44818 bytes)
wrote docs/figures/academic/paper/revision.svg (27596 bytes)
wrote docs/figures/academic/paper/lit-review.svg (22537 bytes)
wrote docs/figures/academic/paper/outline-only.svg (14761 bytes)
wrote docs/figures/academic/paper/abstract-only.svg (4733 bytes)
wrote docs/figures/academic/paper/citation-check.svg (12264 bytes)
wrote docs/figures/academic/paper/disclosure.svg (7245 bytes)
wrote docs/figures/academic/paper/plan.svg (9415 bytes)
wrote docs/figures/academic/paper/format-convert.svg (11257 bytes)
wrote docs/figures/academic/paper/revision-coach.svg (6681 bytes)
wrote docs/figures/academic/paper/rebuttal-audit.svg (5779 bytes)
wrote docs/figures/academic/paper/response-letter.svg (5981 bytes)
wrote docs/figures/academic/paper/lifecycle.svg (21064 bytes)
wrote docs/figures/academic/paper/run-folder.svg (21112 bytes)
exit 0
```

C2, `python3 docs/figures/academic/researcher/gen_academic_pipeline.py`:

```
wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)
exit 0
```

C3: I ran both scripts from `/tmp` by their absolute paths. `gen_figures.py` printed the same 27 lines as C1, then `exit 0`. The pipeline script printed `wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)`, then `exit 0`.

C4: I ran `cmp docs/figures/<new> <(git show ee15921:docs/figures/<old>)` for each row of the table. Each of the 28 printed `exit 0`, and the loop ended with `compared 28, differing 0`. For example:

```
cmp docs/figures/orchestration/pipeline.svg ee15921:docs/figures/pipeline.svg exit 0
cmp docs/figures/academic/researcher/manuscript.svg ee15921:docs/figures/researcher.svg exit 0
cmp docs/figures/academic/researcher/academic-pipeline.svg ee15921:docs/figures/academic-pipeline/academic-pipeline.svg exit 0
cmp docs/figures/academic/paper/run-folder.svg ee15921:docs/figures/paper/run-folder.svg exit 0
```

`git status --short docs/figures skills/code/handbook` prints 30 ` D` lines, one ` M` line and 4 `??` lines:

- the 30 ` D` lines are the 28 old figure paths, `docs/figures/academic-pipeline/academic-pipeline.svg` included, and `docs/figures/academic-pipeline/gen_academic_pipeline.py`;
- ` M docs/figures/gen_figures.py`;
- `?? docs/figures/academic/`, `?? docs/figures/code/`, `?? docs/figures/orchestration/` and `?? skills/code/handbook/`.

With `-uall`, the `??` lines are the 28 new figures, `docs/figures/academic/researcher/gen_academic_pipeline.py` and `skills/code/handbook/templates/figures.py`. These are the moves, the changed scripts and the new engine, and nothing else.

C5, `find skills docs/figures -name __pycache__` after all four runs: printed nothing, `find exit 0`.

C6, `grep -n '^class \|^def '` over both scripts:

- `gen_figures.py` prints only figure code: `_single`, `with_mode_stop`, `_paper`, `_search`, the twelve `paper_*_graph`, `paper_figures`, `paper_lifecycle`, `paper_run_folder`, `grill`, `writing`, `paper_review_panel`, `referee`, `_integrity_check`, `researcher`, `researcher_research`, `researcher_revision`, `submit`, `grant`, `code_comments`, `codebase_design`, `plan_loop`, `pipeline`, `figures` and `main`.
- The pipeline script prints `_g`, `pipeline_flow`, `Stage`, `_lines`, `MapBox`, `map_layout`, `pipeline_figure` and `main`.
- Filtered with `grep -E ':(class|def) (FigureError|Rect|Style|Node|Edge|Graph|Canvas|FlowLayout|Panel|Legend|Lane|Row|_?wrap|draw_node|draw_legend|compose|describe|lanes_figure|write_figures)\b'`, the output is empty, `exit 1`.

C7, `grep -n 'import'` over both scripts:

```
docs/figures/academic/researcher/gen_academic_pipeline.py:3:The script imports the drawing engine skills/code/handbook/templates/figures.py, found from its
docs/figures/academic/researcher/gen_academic_pipeline.py:5:imports nothing from docs/figures/gen_figures.py. It adds with the engine's add_kind the kinds of
docs/figures/academic/researcher/gen_academic_pipeline.py:36:import sys
docs/figures/academic/researcher/gen_academic_pipeline.py:37:from collections.abc import Sequence
docs/figures/academic/researcher/gen_academic_pipeline.py:38:from pathlib import Path
docs/figures/academic/researcher/gen_academic_pipeline.py:39:from typing import NamedTuple
docs/figures/academic/researcher/gen_academic_pipeline.py:48:    import figures as fg
docs/figures/academic/researcher/gen_academic_pipeline.py:51:        f"error: the drawing engine {ENGINE.as_posix()} cannot be imported: {error}",
docs/figures/gen_figures.py:65:The drawing engine is skills/code/handbook/templates/figures.py, which this file imports, found
docs/figures/gen_figures.py:79:- the drawing engine not found, or a name this script imports missing from it: the message
docs/figures/gen_figures.py:103:import sys
docs/figures/gen_figures.py:104:from collections.abc import Sequence
docs/figures/gen_figures.py:105:from pathlib import Path
docs/figures/gen_figures.py:114:    from figures import (
docs/figures/gen_figures.py:136:        f"error: the drawing engine {ENGINE.as_posix()} cannot be imported: {error}",
exit 0
```

`grep -n 'ENGINE\|dont_write'` shows how each script finds the engine:

- `gen_figures.py`: line 109 `ENGINE = Path("skills/code/handbook/templates/figures.py")`, line 111 `sys.dont_write_bytecode = True`, line 112 `sys.path.insert(0, str(ROOT / ENGINE.parent))`;
- `gen_academic_pipeline.py`: the same three lines at 43, 45 and 46.

No line of either script imports `gen_figures`.

C8, the grep over `skills/code/handbook/templates/figures.py`: printed nothing, `exit 1`.

C9, `git ls-files -co --exclude-standard docs/figures`, kept to the files that exist on disk: 28 lines, each `ok`. Each line names the figure and the folder of `skills/` it stands for, for example:

```
ok: docs/figures/academic/grant.svg, skills/academic
ok: docs/figures/academic/paper/full.svg, skills/academic/paper
ok: docs/figures/academic/researcher/academic-pipeline.svg, skills/academic/researcher
ok: docs/figures/code/code-comments.svg, skills/code
ok: docs/figures/orchestration/pipeline.svg, skills/orchestration
```

The folders are `academic` (5 figures), `academic/paper` (14), `academic/researcher` (4), `code` (2) and `orchestration` (3). Each figure stored flat in a group folder is named after a skill of that group: `[ -f skills/<group>/<skill>/SKILL.md ]` holds for `orchestration/grill`, `academic/writing`, `academic/paper-review-panel`, `academic/referee`, `academic/submit`, `academic/grant`, `code/code-comments` and `code/codebase-design`. `pipeline.svg` and `plan-loop.svg` span several skills and stand in `orchestration`. Without the existence filter, the run also lists the 28 deleted old paths; see "wrong or impossible", item 2. `ls docs/figures/paper docs/figures/academic-pipeline` fails for both, `ls exit 1`.

C10, every `docs/figures/` path found under `README.md`, `docs` and `skills`, excluding `docs/roadmap.md`: 50 hits, none missing. The run that includes the roadmap prints one missing path:

```
MISSING docs/roadmap.md:67:docs/figures/paper/lifecycle.svg
```

C11, the old-name grep over `README.md docs/dev`: printed nothing, `exit 1`.

## Terms

- **kind**: the glossary's entry is a `/plan-retro` defect kind. The diff uses "kind of box" in the head comments of the three scripts and in `add_kind`, a sense the code already had at ee15921 (`Node.kind`, "How a kind of box is drawn"). The brief's Decisions 4 and 5 use it in the same sense. It is not used bare on any page of `docs/`. The `scripts.md` lines the diff adds do not use it.
- **stop**: the engine's head comment line `- stop: an orange box;` names the box kind `stop`, which draws a stop in the glossary's second sense (a point where a skill waits on the user).
- The diff adds or changes no glossary entry. `docs/glossary.md` is unchanged (`git diff --name-only` does not list it).

## Files with line counts

From `git diff --numstat`, added then removed, and `wc -l`:

- `skills/code/handbook/templates/figures.py`: new, 1270 lines.
- `docs/figures/gen_figures.py`: 164 added, 1316 removed, 1568 lines now.
- `docs/figures/academic/researcher/gen_academic_pipeline.py`: new path, 296 lines. It is the old file of 273 lines with 107 lines differing (`diff | grep -c '^[<>]'`). The old path `docs/figures/academic-pipeline/gen_academic_pipeline.py` is removed (273 lines).
- `README.md`: 27 and 27, the image lines 72 to 132.
- `docs/dev/building.md`: 1 and 1, line 41.
- `docs/dev/scripts.md`: 5 added and 2 removed. These are rows 9 and 10, a folder-rule paragraph after the development table with its blank line, and the engine's "User scripts" row.
- ADR 0043 line 106 and ADR 0049 line 18: 1 and 1 each.
- The 28 figures: removed at the old paths (lines as `git diff --numstat` lists them) and added unchanged at the new paths (C4).

## Judgment calls the brief left open

1. `gen_academic_pipeline.py` adds the kind `paper` itself, with the same style and words as `gen_figures.py`. Item 5 forbids it to import from `gen_figures.py`, and its legend and targets use `paper` (see "wrong or impossible", item 1). The orchestrator may write another substitute.
2. Item 4 drops the kinds `ruled`, `ruled_maybe` and `todo`. That leaves the constants `RULED`, `RULED_FILL` and `RULED_INK` with no user, so they are removed too.
3. Decision 7 moved `_graph` and `FLOW_WIDTH`. By the same test (no label and no legend wording) it also moved `_lanes_label`, `_flow_label` and `_parts`, now `lanes_label`, `flow_label` and `parts`. The docstring of `parts` was "A box per part of a mode, in the order the mode runs them". It is now "A box per label, of one kind, keyed p0, p1 and on in the order given", since the engine names no mode.
4. `write_figures` takes `root` as its third parameter: `write_figures(base, figures_to_write, root)`. Both scripts pass their `ROOT`, found from `Path(__file__).resolve()`.
5. Each script catches the `ImportError` around the engine's import, prints `error: the drawing engine skills/code/handbook/templates/figures.py cannot be imported: <error>` to stderr and exits 1. This follows the error format of its head comment. This path is checked by reading only. Running it would need the engine moved away or the script run from a copy without the engine, which the rule against breakage testing forbids.
6. The figure name that `gen_figures.py` passes to `compose`, `lanes_figure` and `_single` is now the new path, for example `"academic/paper/lifecycle.svg"`. The engine uses this name only in error messages, so no figure's text changes (C4).
7. The pipeline script's module alias is now `fg`, the engine, in place of `gf`, which stood for `gen_figures`.
8. Decision 5 says the words table is a module-level table that `add_kind` writes, which is mutable global state, the kind change-standard rule 11 forbids. I built it as the brief decides: `STYLES` and `WORDS` are module-level, and `add_kind` writes both.
9. The new public functions `graph` and `parts` share their names with parameters and locals: the `graph` parameter of `_single`, `with_mode_stop` and `_paper` in `gen_figures.py`, and the `parts` local of `describe` and `flow_label` in the engine. None of these functions calls `graph` or `parts`, and `ruff check --select F` passes on all three files.
10. The C9 check kept the files that exist on disk (see "wrong or impossible", item 2).

## Host- or user-visible changes, before and after

| Surface | Before | After |
|---|---|---|
| Figure paths | flat under `docs/figures/`, plus `docs/figures/paper/` and `docs/figures/academic-pipeline/` | the folders of the table, under `docs/figures/<group>/` |
| Run command of the pipeline script | `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` | `python3 docs/figures/academic/researcher/gen_academic_pipeline.py` |
| Output lines of `gen_figures.py` | `wrote docs/figures/pipeline.svg (23294 bytes)` and the others | `wrote docs/figures/orchestration/pipeline.svg (23294 bytes)` and the others (C1) |
| A run of the pipeline script | wrote `docs/figures/__pycache__/` | writes no `__pycache__` (C5) |
| A new error of both scripts | none | `error: the drawing engine skills/code/handbook/templates/figures.py cannot be imported: <error>`, exit 1 |
| README image lines 72-132 | `docs/figures/pipeline.svg` and the others | `docs/figures/orchestration/pipeline.svg` and the others, each line otherwise unchanged (`git diff --numstat`: 27 and 27) |
| `docs/dev/scripts.md` | the two figure scripts at their old paths, with "the layout code of `gen_figures.py`" | the new paths and outputs, the engine named in each row, the folder rule after the development table, and the row for `skills/code/handbook/templates/figures.py` under "User scripts" |
| ADR 0043 line 106 | `docs/figures/paper/` | `docs/figures/academic/paper/` |
| ADR 0049 line 18 | `docs/figures/paper/lifecycle.svg` | `docs/figures/academic/paper/lifecycle.svg` |

## Sentences reread after the change

These are the whole-file sentences of each changed file (introductions, counts, and sentences with "every" or "only"):

- `gen_figures.py`, "Every figure but the last two shows the order of a run": still true. The last two in the list are `academic/paper/lifecycle.svg` and `academic/paper/run-folder.svg`.
- `gen_figures.py`, "the script reads no skill file and no other input": still true. It imports the engine's code and reads no data file.
- `figures.py`, "The module reads no file and takes every value from its caller": true, since `grep -n 'open(\|read_text'` finds only the read-back of the file `write_figures` has just written.
- `figures.py`, "The module imports only the standard library": true (lines 73 to 79).
- `scripts.md`, "Every script in this repository outside `.scratch/` is listed here": the engine now has its row.
- `building.md` line 41, "Every skill that launches agents has its figure under `docs/figures/`": unchanged by this step.
- ADR 0060 Context, "Ordo's figures are drawn by `docs/figures/gen_figures.py`, a Python script that lays out each graph and writes its SVG itself": this describes the tree before the decision the ADR records. It is outside the brief's paths and is left unchanged.

## Sentences read against the standards

These new sentences go past the prose standard's "under roughly 20 words":

- The folder rule, in `scripts.md` and in the head comment of `gen_figures.py`, is one sentence of about 50 words. The brief asks for it "in one sentence", and it names three cases, each with its path pattern.
- `building.md` line 41 names each figure in one sentence of about 120 words. The line it replaces had the same form, and item 7 asks for each figure by path or by name in that line.
- The `scripts.md` cells are table cells, which hold a phrase or a sentence.

No new text has an em dash, a spaced hyphen used as a dash, an arrow in prose or a semicolon outside a list.

## Anything in the brief that was wrong or impossible

1. The premise "`ap`, `rev`, `pipe` and `dr` are used only by `gen_academic_pipeline.py`; `paper` is used by `gen_figures.py`" is incomplete: `gen_academic_pipeline.py` uses `paper` too. At ee15921, `grep -c '"paper"'` counts 7 lines in it: line 59 of `PIPELINE_LEGEND`, and lines 132 to 137 of `TARGETS`. Because item 5 forbids an import from `gen_figures.py`, and Decision 4 moves `paper` out of the engine, the pipeline script adds `paper` itself with the same `Style` (judgment call 1). The style is therefore written in two scripts.
2. The case "for each figure that `git ls-files -co --exclude-standard docs/figures` lists" gives a different result in the worktree than after the commit. In the worktree, before the commit, `-c` still lists the 28 old paths, deleted from disk and not yet staged. The raw run therefore prints 28 `fails: ... (deleted)` lines, from `docs/figures/academic-pipeline/academic-pipeline.svg` to `docs/figures/writing.svg`. Kept to the files that exist, as the repository's ASCII check is, every one of the 28 is `ok`. After the landing commit, the raw run lists only the new paths.
3. The `scripts.md` row says the engine is what "`handbook` copies into a repository", as item 7 dictates. The `handbook` skill does not exist yet (`ls skills/code/handbook` prints only `templates`), so that sentence cannot be run until step 3 writes the skill.
