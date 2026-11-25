# Step 1 report, after repair round 1

Everything in the brief and in the round brief is done.

Two points are for the orchestrator. The legend part of ruling 1 is built with one condition, given under "Repair round 1", ruling 1. Ruling 5 is built with one extra check, given under ruling 5.

## Open items of the state file, verbatim

The state file in this worktree, `orchestrator-state.md`, holds one open item. `grep -c '^- Open item'` over its Open items section prints `1`.

- Open item B (2026-11-25, step 1, kind 4, the roadmap's gate): the gate's part "every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists" cannot pass once step 1 moves the figures, because `docs/roadmap.md` line 67, the done line of entry 25, records that you read `docs/figures/paper/lifecycle.svg`, a path that then no longer exists (`git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md` prints line 67). Step 1 goes on meanwhile and runs its check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The gate's part reads "... in `README.md`, `docs/` outside `docs/roadmap.md`, and `skills/` ...", written into entry 27's gate by `/roadmap` at the closing. Pro: the done line stays the true record of what you read; the check still covers every page that shows a figure. Con: the roadmap's own figure paths go unchecked, and today it names none outside done lines.
  - (b) Entry 25's done line is edited to `docs/figures/academic/paper/lifecycle.svg`. Pro: the gate stays as written. Con: a done entry's record is rewritten to a path that did not exist when you read it.
  - Lazy option: neither; leaving the gate as written and accepting a failed part at the closing.

## Repair round 1

### Ruling 1: the kinds as a read-only table

Done:

- **Engine table.** `skills/code/handbook/templates/figures.py` holds `class Kind(NamedTuple)` with the fields `style` and `words`. Line 166 is `KINDS: Mapping[str, Kind] = MappingProxyType(`, holding the six kinds with the words `describe` gave them before.
- **Removed names.** `STYLES`, `WORDS` and `add_kind` are gone. `grep -n 'STYLES\|WORDS\|add_kind'` over the engine, both scripts and `docs/dev/scripts.md` prints nothing.
- **`with_kinds(extra)`.** Lines 178-183. It raises `FigureError(f"the kind {name!r} is one of the engine's kinds")` for a name already in `KINDS`. Otherwise it returns `MappingProxyType({**KINDS, **extra})`.
- **Kind lookup.** `_kind(figure, kinds, name)` (lines 186-190) raises `FigureError(f"{figure}: the kind {name!r} is not one of the figure's kinds")`. It is called at line 420 (`draw_node`), line 1013 (`draw_legend`) and line 1096 (`describe`).
- **The `kinds` parameter.** `compose`, `lanes_figure`, `describe` and `Canvas` take `kinds: Mapping[str, Kind] = KINDS`. `compose` and `lanes_figure` pass it to `Canvas`. `draw_node` and `draw_legend` read it from the canvas they draw on, so `Canvas` holds one mapping per figure and passes it down.
- **Legend samples.** A legend row's sample is now a kind, `"dotted"` or `"loop"`. Any other sample is looked up as a kind and raises the error above. This is the condition the first line names. The engine's head comment said "any other word for a dotted loop", which would make an error for a mistyped kind impossible. The legends of both scripts use only kinds, `"dotted"` and `"loop"`: `grep -o` of their `Legend(`/`L(` samples printed `agent`, `ap`, `choice`, `dotted`, `dr`, `loop`, `maybe`, `none`, `paper`, `pipe`, `rev`, `script` and `stop`. So no figure changes.
- **Each script's mapping.** `gen_figures.py` builds `FIGURE_KINDS = with_kinds({"paper": PAPER})` once. It passes that mapping to every `compose`, `lanes_figure` and `describe` call, including the calls made through `_single`. `gen_academic_pipeline.py` builds `FIGURE_KINDS = fg.with_kinds({...})` with `ap`, `rev`, `pipe`, `dr` and `paper`, and passes it to `fg.Canvas(name, width, height, label, FIGURE_KINDS)`. Its words for `ap`, `rev`, `pipe` and `dr` are their names, as `describe`'s fallback gave them before. The script never calls `describe`.
- **Head comments.** The engine's steps 2 and 4 and its error list now describe this shape. `gen_figures.py` lines 65-69 and its error list, and the pipeline script's lines 3-10 and its error list, describe it too. The `scripts.md` engine row describes `with_kinds` (ruling 3 quotes the row).
- **Module-level names.** Item 9 asks for this run: `grep -n '^[A-Z_]* = \|^[a-z_]* = '` over the engine prints lines 96-132 and 1135-1137. Each of these is a string or a number constant: the colours, the font, the sizes, the margins, `DOTTED`, `DASHED`, `FLOW_WIDTH`, `LANE_PAD`, `LANE_HEAD` and `LANE_GAP`. `KINDS` is the one mapping, at line 166, and it is a `MappingProxyType`. Nothing in the file assigns to any of them after import. The grep `\b(KINDS|STYLES|WORDS)\[[^]]*\] *=|\b(KINDS|STYLES|WORDS)\.(update|setdefault|pop|clear)\(|^ +global ` prints nothing, exit 1. `python3 -I -c "...; f.KINDS['x']=1"` printed `KINDS write: 'mappingproxy' object does not support item assignment`.

### Ruling 2: `docs/figures/ordo_kinds.py`

Done:

- **The new file.** It is 13 lines. It holds `PAPER = Kind(Style("#dff3f1", "#0f766e", "", "#134e4a", 1.5, False), "a run of another skill")` and nothing else. These are the style and words `gen_figures.py` had. Its head comment says what it holds, who imports it, and that the importers set `sys.dont_write_bytecode` first.
- **`gen_figures.py`.** It imports the file as `from ordo_kinds import PAPER` at line 145, after `sys.dont_write_bytecode = True` at line 116. The file is found in the script's own folder, which Python puts first on `sys.path` for a script.
- **The pipeline script.** It puts `ROOT / "docs" / "figures"` on `sys.path` at line 51 and imports at line 62, after `sys.dont_write_bytecode = True` at line 49.
- **Errors.** Each import has its own `try` block, which prints `error: docs/figures/ordo_kinds.py cannot be imported: <error>` and exits 1. Both head comments list this error.
- **No import of `gen_figures`.** `grep -n 'gen_figures'` over the pipeline script prints only line 6 of its head comment, "Nothing is imported from docs/figures/gen_figures.py, the other figure script".
- **Pipeline-only kinds.** `ap`, `rev`, `pipe` and `dr` stay in the pipeline script.
- **`scripts.md`.** Rows 9 and 10 name "the kind `paper` of `docs/figures/ordo_kinds.py`".
- **No bytecode.** `find skills docs/figures -name __pycache__` prints nothing after every run (`find exit 0`).

### Ruling 3: the engine row of `scripts.md`

Done. `sed -n 19p docs/dev/scripts.md`:

```
| `skills/code/handbook/templates/figures.py` | The drawing engine that both figure scripts of this repository import: it lays out boxes and arrows, draws them with a legend and a note as an SVG file, and writes each file and reads it back. A script that draws kinds of box of its own builds a read-only mapping of the engine's kinds and its own with `with_kinds` and passes it to each drawing call |
```

### Ruling 4: the head-comment sentence

Done. The engine's lines 51-52 read: "The module reads no input file: it reads back only each file it writes, and takes every value from its caller." The sentence is wrapped at the file's docstring width. One more sentence stands above it, "The module writes no module-level value after import.", which the ruling 1 grep supports.

### Ruling 5: the root check in `write_figures`

Done:

- **The ruled check.** Before any write, `write_figures` resolves both paths, then runs `if not folder.is_relative_to(top): raise FigureError(f"the folder {base} is not under the root {root}")` (lines 1295-1296).
- **One check more.** In the same loop that checks each body for ASCII, it raises `FigureError(f"{name}: the file is not under the folder {base}")` when `(folder / name).resolve()` does not lie under the folder (lines 1298-1299). This is the extra check the first line names. A name such as `../x.svg` reached a path. Without this check it would write outside the folder, and the `relative_to` after the write would end in a `ValueError`. That is the reviewer's Behaviour 1 failure, reached through the name in place of the root, a case by rules-file rule 15.
- **Output line.** It is now built from `path.resolve().relative_to(top)`. Both scripts pass resolved paths, so the lines are unchanged (C1).
- **Documentation.** The docstring (lines 1288-1292) and the head comment's error list (lines 73-75) name both errors.
- **How it was checked.** These two paths are checked by reading. Running them would take a call with a wrong root or name, from a script written for the round, which the round forbids.

### Ruling 6: `_g` replaced by `graph`

Done. `_g` is removed. `pipeline_flow` returns `fg.graph(nodes, edges, width=NODE_WIDTH)`, the width it passed before (`NODE_WIDTH = 214`). The output is byte for byte as before (C4). The now-unused import of `Sequence` is removed, and `ruff check --select F` passes on the four Python files.

### Ruling 7: the shadowing renames

Done:

- **`gen_figures.py`.** The `graph` parameter of `_single`, `with_mode_stop` and `_paper` is now `flow`. `grep -n 'graph: Graph'` over `gen_figures.py` prints nothing.
- **Engine locals.** The `parts` locals in the engine's `describe` and `flow_label` are now `texts`. `grep -n 'parts = \[\]'` prints nothing.
- **`FlowLayout.__init__`.** It also shadowed the engine's `graph`: its parameter `graph` is now `flow` (line 456, `def __init__(self, figure: str, flow: Graph) -> None:`). Every caller passes it by position.
- **Not renamed.** The field `graph` of `Panel` (line 994) is an attribute and shadows nothing.

### Ruling 8: the folder case in an uncommitted worktree

Done, with no change to the code:

- **Over the files on disk.** Every figure is `ok`: 5 in `academic`, 14 in `academic/paper`, 4 in `academic/researcher`, 2 in `code` and 3 in `orchestration`.
- **The literal command.** `git ls-files -co --exclude-standard docs/figures` still lists the 28 deleted old paths until the landing commit. Counted by `test -e`: `deleted old paths the literal list still holds: 28`.

### Ruling 9: the cases after the round

Each case's output as printed:

- C1, `python3 docs/figures/gen_figures.py` from the root: the same 27 lines as before the round, then `exit 0`. The output was the first `wrote docs/figures/orchestration/pipeline.svg (23294 bytes)` and the last `wrote docs/figures/academic/paper/run-folder.svg (21112 bytes)`, and is quoted in full under "The cases, after the change".
- C2: `wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)`, `exit 0`.
- C3, both scripts from `/tmp` by path: the same lines, `exit 0` for each.
- C4: `compared 28, differing 0` against ee15921, rerun after the last edit. `git status --short docs/figures skills/code/handbook` prints:
  - 29 ` D` lines: the 28 old figures and `docs/figures/academic-pipeline/gen_academic_pipeline.py`. The report before the round said 30; the count is 29.
  - ` M docs/figures/gen_figures.py`;
  - `?? docs/figures/academic/`, `?? docs/figures/code/`, `?? docs/figures/orchestration/`, `?? docs/figures/ordo_kinds.py` and `?? skills/code/handbook/`.
- C5, `find skills docs/figures -name __pycache__`: prints nothing, `find exit 0`.
- C6, definitions: `grep -n '^class \|^def '` over both scripts and `ordo_kinds.py`, filtered for every engine name, `_g`, `with_kinds` and `add_kind`, prints nothing, exit 1. The pipeline script defines `pipeline_flow`, `Stage`, `_lines`, `MapBox`, `map_layout`, `pipeline_figure` and `main`.
- C7, `grep -n 'import'` over both scripts:

```
docs/figures/academic/researcher/gen_academic_pipeline.py:3:The script imports the drawing engine skills/code/handbook/templates/figures.py and the kind
docs/figures/academic/researcher/gen_academic_pipeline.py:5:sys.dont_write_bytecode set so that no __pycache__ folder is written. Nothing is imported from
docs/figures/academic/researcher/gen_academic_pipeline.py:42:import sys
docs/figures/academic/researcher/gen_academic_pipeline.py:43:from pathlib import Path
docs/figures/academic/researcher/gen_academic_pipeline.py:44:from typing import NamedTuple
docs/figures/academic/researcher/gen_academic_pipeline.py:54:    import figures as fg
docs/figures/academic/researcher/gen_academic_pipeline.py:57:        f"error: the drawing engine {ENGINE.as_posix()} cannot be imported: {error}",
docs/figures/academic/researcher/gen_academic_pipeline.py:62:    from ordo_kinds import PAPER
docs/figures/academic/researcher/gen_academic_pipeline.py:65:        f"error: docs/figures/ordo_kinds.py cannot be imported: {error}",
docs/figures/gen_figures.py:65:The drawing engine is skills/code/handbook/templates/figures.py, which this file imports, found
docs/figures/gen_figures.py:67:written. It imports the kind PAPER, a run of another skill, from docs/figures/ordo_kinds.py
docs/figures/gen_figures.py:80:- the drawing engine not found, or a name this script imports missing from it: the message
docs/figures/gen_figures.py:108:import sys
docs/figures/gen_figures.py:109:from collections.abc import Sequence
docs/figures/gen_figures.py:110:from pathlib import Path
docs/figures/gen_figures.py:119:    from figures import (
docs/figures/gen_figures.py:140:        f"error: the drawing engine {ENGINE.as_posix()} cannot be imported: {error}",
docs/figures/gen_figures.py:145:    from ordo_kinds import PAPER
docs/figures/gen_figures.py:148:        f"error: docs/figures/ordo_kinds.py cannot be imported: {error}",
```

  The engine's folder comes from `ENGINE = Path("skills/code/handbook/templates/figures.py")`, at line 114 of `gen_figures.py` and line 47 of the pipeline script, with `sys.path.insert(0, str(ROOT / ENGINE.parent))` at lines 117 and 50.

- C8, the engine's word grep: prints nothing, exit 1.
- C9: as under ruling 8. `ls docs/figures/paper docs/figures/academic-pipeline` printed `No such file or directory` for both, `ls exit 1`.
- C10, `docs/roadmap.md` left out: 55 hits, none missing. With the roadmap, one is missing: `MISSING docs/roadmap.md:67:docs/figures/paper/lifecycle.svg`.
  - `git grep` searches tracked files only, so the run was repeated with `--untracked`, covering the new engine, `ordo_kinds.py` and the moved pipeline script: 62 hits, none missing.
  - That run first caught a head-comment line that ended a sentence on the path `docs/figures/gen_figures.py.`. The helper read the full stop as part of the path. The sentence now reads "...from docs/figures/gen_figures.py, the other figure script", so the landing's tracked run finds no such hit.
- C11, the old-name grep over `README.md docs/dev`: prints nothing, exit 1. With `--untracked` it also prints nothing.

## The cases' first run, on the unchanged tree (base 50a98c8)

No case was one the brief's rules get wrong on this run, so the build went on without a stop.

1. `python3 docs/figures/gen_figures.py`: exit 0, 27 `wrote` lines at the old paths.
2. `python3 docs/figures/academic/researcher/gen_academic_pipeline.py`: `[Errno 2] No such file or directory`, exit 2. The old script wrote `docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, exit 0.
3. From `/tmp`: `gen_figures.py` printed 27 lines; the new pipeline path failed with `[Errno 2]`.
4. `cmp` of the 28 figures at their old paths against ee15921: all exited 0. `git status --short docs/figures skills/code/handbook` printed nothing.
5. `find skills docs/figures -name __pycache__`: nothing after `gen_figures.py`. After the old pipeline script it printed `docs/figures/__pycache__`, which I removed (`rm -rf`, an ignored folder).
6. The definitions grep: `gen_figures.py` defined every engine name, among them `142:class FigureError(Exception):`, `234:def _wrap(` and `2685:def write_figures(...)`. The new pipeline path was missing.
7. The import grep: `gen_figures.py` lines 89 to 96, the standard library only. No import from `skills/code/handbook/templates`.
8. The engine's word grep: `No such file or directory`, exit 2.
9. The folders: 13 figures flat, 1 under `academic-pipeline` and 14 under `paper`, none of them a group of `skills/`. `ls` of the two old folders exit 0.
10. The path case: no path missing, with or without `docs/roadmap.md`.
11. The old-name grep: `docs/dev/building.md:41`, `docs/dev/scripts.md:9` and `docs/dev/scripts.md:10`, exit 0.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| What to build 1, the moves, old folders gone | DONE | `ls` of both old folders exit 1; C9 over the files on disk, 28 `ok` |
| 2, the pipeline script moved, writing beside itself | DONE | C2 |
| 3, the engine | DONE | Imports at lines 87-94: `collections.abc` (`Mapping`, `Sequence`), `dataclasses`, `html`, `itertools`, `pathlib`, `statistics`, `types`, `typing`. `grep -n 'skills/\|docs/\|README\|HERE\|ROOT\|__file__'` prints nothing; C8 prints nothing |
| 4, `gen_figures.py` | DONE | C1, C6, C7; head comment lines 1 to 106 |
| 5, the pipeline script | DONE | C6, C7 |
| 6, every figure byte for byte | DONE | `compared 28, differing 0` |
| 7, the pages | DONE | `git diff --numstat`: `27 27 README.md`, `1 1 docs/dev/building.md`, `5 2 docs/dev/scripts.md`, `1 1` for each ADR |
| Round rulings 1 to 9 | DONE | "Repair round 1" above |
| Verify 1, character-set check over the 37 changed files on disk, `ordo_kinds.py` included | DONE | prints nothing, `charset exit 0` |
| Verify 2 and 3 | DONE | C1 to C11 |
| Verify 4, the sentences against the standards | DONE | "Sentences read against the standards" |
| Lint | DONE | `ruff check --select F,W2` over the four Python files: `All checks passed!`. `ruff check --preview --select E3` (blank lines): `All checks passed!` |

### The cases, after the change

C1:

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

The cmp loop is `cmp docs/figures/<new> <(git show ee15921:docs/figures/<old>)` over the 28 rows of the brief's table, and ends with `compared 28, differing 0`.

## Terms

- **kind**: the glossary entry is a `/plan-retro` defect kind. The diff uses "kind of box", now also the class `Kind`, the table `KINDS` and `with_kinds`. This is the sense the code had at ee15921 (`Node.kind`), and it is always qualified in prose. It is not used bare on a page of `docs/`. The new `scripts.md` row says "kinds of box".
- **stop**: `- stop: an orange box;` in the engine's head comment names the box kind that draws a stop in the glossary's second sense.
- No glossary entry is added or changed: `git diff --name-only` does not list `docs/glossary.md`.

## Files with line counts

From `git diff --numstat` (added, removed) and `wc -l`:

- `skills/code/handbook/templates/figures.py`: new, 1317 lines.
- `docs/figures/ordo_kinds.py`: new, 13 lines.
- `docs/figures/gen_figures.py`: 195 added, 1327 removed, 1588 lines now.
- `docs/figures/academic/researcher/gen_academic_pipeline.py`: new path, 301 lines; the old path is removed (273 lines).
- `README.md`: 27 and 27.
- `docs/dev/building.md`: 1 and 1.
- `docs/dev/scripts.md`: 5 and 2.
- ADR 0043 and ADR 0049: 1 and 1 each.
- The 28 figures: moved, unchanged (C4).

## Judgment calls the brief left open

1. The `RULED*` constants were removed with the kinds that used them.
2. `_lanes_label`, `_flow_label` and `_parts` moved to the engine as `lanes_label`, `flow_label` and `parts` by Decision 7's test. The docstring of `parts` now names no mode.
3. `write_figures(base, figures_to_write, root)` takes `root` third.
4. Each import is guarded and prints an `error:` line with exit 1. These paths are checked by reading. Running them would need the engine or `ordo_kinds.py` moved away, which is breakage testing.
5. The names `gen_figures.py` passes to `compose`, `lanes_figure` and `_single` are the new paths. The engine uses them only in error messages.
6. The pipeline script's module alias is `fg`.
7. `Canvas` holds the kinds mapping, and `draw_node` and `draw_legend` read it from the canvas (ruling 1).
8. A legend sample must be a kind, `"dotted"` or `"loop"` (ruling 1).
9. The extra check of each file's path in `write_figures` (ruling 5).
10. The `FlowLayout.__init__` parameter is renamed `flow` (ruling 7).
11. `gen_figures.py` finds `ordo_kinds.py` through its own folder, which Python puts first on `sys.path`. The pipeline script inserts `docs/figures` itself.

## Host- or user-visible changes, before and after

| Surface | Before | After |
|---|---|---|
| Figure paths | flat under `docs/figures/`, plus `paper/` and `academic-pipeline/` | the folders of the table |
| Pipeline run command | `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` | `python3 docs/figures/academic/researcher/gen_academic_pipeline.py` |
| `gen_figures.py` output lines | `wrote docs/figures/pipeline.svg (23294 bytes)` and the others | `wrote docs/figures/orchestration/pipeline.svg (23294 bytes)` and the others |
| Bytecode | the pipeline run wrote `docs/figures/__pycache__/` | none written |
| New errors of the scripts | none | the engine or `docs/figures/ordo_kinds.py` not importable, exit 1; a box or legend row of a kind the mapping lacks |
| New errors of the engine | none | a kind passed to `with_kinds` that the engine holds; a node or legend row of an unknown kind; a base folder outside the root; a file outside the base folder |
| README lines 72-132 | the old image paths | the new paths |
| `docs/dev/scripts.md` | the old paths, "the layout code of `gen_figures.py`" | the new paths, the engine and `ordo_kinds.py` in rows 9 and 10, the folder rule, and the engine's row under "User scripts" without the `handbook` clause |
| ADR 0043 line 106, ADR 0049 line 18 | `docs/figures/paper/...` | `docs/figures/academic/paper/...` |

## Sentences reread after the change

- Engine, "The module writes no module-level value after import": shown by the ruling 1 greps.
- Engine, "The module reads no input file: it reads back only each file it writes, and takes every value from its caller": `grep -n 'open(\|read_text'` finds only the write and the read-back in `write_figures`.
- Engine, "The module imports only the standard library": lines 87-94.
- `gen_figures.py`, "Every figure but the last two shows the order of a run" and "the script reads no skill file and no other input": still true. It imports the engine and `ordo_kinds.py` and reads no data file.
- `scripts.md`, "Every script in this repository outside `.scratch/` is listed here": the engine has its row, and `ordo_kinds.py` is named in the rows of the two scripts it serves.
- ADR 0060 Context still says `gen_figures.py` "lays out each graph and writes its SVG itself". That describes the tree before the decision, and the ADR is outside the paths.

## Sentences read against the standards

- The folder rule (about 50 words, in `scripts.md` and in `gen_figures.py`): the brief asks for one sentence.
- `building.md` line 41 (about 120 words): it keeps the form of the line it replaces.
- The engine's `scripts.md` row: two sentences in one table cell.
- No new text has an em dash, a spaced hyphen used as a dash, an arrow in prose, or a semicolon outside a list or a code example.

## Anything in the brief that was wrong or impossible

1. The premise that only `gen_figures.py` uses `paper` was wrong: at ee15921 the pipeline script uses it on 7 lines. Ruling 2 settles this with `docs/figures/ordo_kinds.py`.
2. The literal folder case lists the deleted old paths until the landing commit (ruling 8).
3. `git grep` in the path and old-name cases does not search untracked files. Before the commit, that leaves out the engine, `ordo_kinds.py` and the moved pipeline script, so the report also quotes both cases run with `--untracked`.

All work and reads were done in the worktree that ends `...-every-skill-1`. A folder ending `...-every-skill-1-round-1` also stands under `.agents/worktrees/`. `git worktree list` does not list it, and I did not touch it.
