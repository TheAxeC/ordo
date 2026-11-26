# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-1, base 50a98c8)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

Summary: every item of "What to build" holds and every case is met. All 28 figures are byte-identical to the base, and every check the brief names passes. There are eight findings, none blocking:

- Standards 1 is the one of substance. `add_kind` writes module-level tables, which breaks rule 11 of the rules file ("No mutable global state"). The brief's Decision 5 asked for this shape, so the fix is the orchestrator's to rule on.
- Spec 1 concerns the `docs/dev/scripts.md` sentence about `handbook`, which the brief dictates and which is false until step 3 lands.
- Standards 2 is a false sentence in the engine's head comment.
- The other five are low.

## Verification (rerun by the reviewer)

All commands were run from the worktree root unless a `cd` is shown. Running the two figure scripts rewrote the figures in place with the same bytes: the `cmp` loop below exits 0 for all 28, and `git status --short` shows the same 40 lines afterwards.

```
$ printf '%s\0' <the 37 files the step adds or changes on disk, from git diff 50a98c8 --name-only --diff-filter=AM plus the untracked files, the builder's report included> | xargs -0 perl -CSD -ne '<the brief's character-set check>'
(prints nothing)
exit=0

$ python3 --version
Python 3.13.4
$ python3 docs/figures/gen_figures.py
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
exit=0
$ python3 docs/figures/academic/researcher/gen_academic_pipeline.py
wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)
exit=0

$ cd /tmp && python3 <worktree>/docs/figures/gen_figures.py > /dev/null; echo "exit=$?"
exit=0
$ cd /tmp && python3 <worktree>/docs/figures/academic/researcher/gen_academic_pipeline.py
wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)
exit=0

$ <for each row of the brief's table (Decisions taken in this brief, item 1), all 28> git show 50a98c8:docs/figures/<old> | cmp -s - docs/figures/<new>
compared=28 bad=0

$ git status --short docs/figures skills/code/handbook
 D docs/figures/academic-pipeline/academic-pipeline.svg
 D docs/figures/academic-pipeline/gen_academic_pipeline.py
 D docs/figures/code-comments.svg
 D docs/figures/codebase-design.svg
 M docs/figures/gen_figures.py
 D docs/figures/grant.svg
 D docs/figures/grill.svg
 D docs/figures/paper-review-panel.svg
 D docs/figures/paper/abstract-only.svg
 D docs/figures/paper/citation-check.svg
 D docs/figures/paper/disclosure.svg
 D docs/figures/paper/format-convert.svg
 D docs/figures/paper/full.svg
 D docs/figures/paper/lifecycle.svg
 D docs/figures/paper/lit-review.svg
 D docs/figures/paper/outline-only.svg
 D docs/figures/paper/plan.svg
 D docs/figures/paper/rebuttal-audit.svg
 D docs/figures/paper/response-letter.svg
 D docs/figures/paper/revision-coach.svg
 D docs/figures/paper/revision.svg
 D docs/figures/paper/run-folder.svg
 D docs/figures/pipeline.svg
 D docs/figures/plan-loop.svg
 D docs/figures/referee.svg
 D docs/figures/researcher-research.svg
 D docs/figures/researcher-revision.svg
 D docs/figures/researcher.svg
 D docs/figures/submit.svg
 D docs/figures/writing.svg
?? docs/figures/academic/
?? docs/figures/code/
?? docs/figures/orchestration/
?? skills/code/handbook/

$ find skills docs/figures -name __pycache__
(prints nothing)

$ grep -n '^class \|^def ' docs/figures/gen_figures.py docs/figures/academic/researcher/gen_academic_pipeline.py | <the definition name extracted> | grep -E ' (FigureError|Rect|Style|Node|Edge|Graph|Canvas|FlowLayout|Panel|Legend|Lane|Row|_?wrap|draw_node|draw_legend|compose|describe|lanes_figure|write_figures|_?graph|_?parts|_?flow_label|_?lanes_label|_?node_height)$'
rc=1 (no match)
$ grep -n '^class \|^def ' docs/figures/academic/researcher/gen_academic_pipeline.py
88:def _g(
101:def pipeline_flow() -> fg.Graph:
134:class Stage(NamedTuple):
170:def _lines(figure: str, where: str, label: str, width: float) -> list[str]:
179:class MapBox(NamedTuple):
187:def map_layout(figure: str) -> tuple[list[MapBox], list[MapBox], dict[str, int]]:
230:def pipeline_figure() -> str:
284:def main() -> int:

$ grep -n 'import' docs/figures/gen_figures.py docs/figures/academic/researcher/gen_academic_pipeline.py
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

$ grep -n -i 'docs/figures\|research\|paper\|grill\|plan\|referee\|submit\|orchestration\|ordo' skills/code/handbook/templates/figures.py
rc=1 (no match)

$ git ls-files -co --exclude-standard docs/figures | grep '\.svg$' | <the folder test>
(literal list: 28 FLAT/NOGROUP lines, all for the deleted old paths still in the index; kept to files on disk:)
   5 ok academic
  14 ok academic/paper
   4 ok academic/researcher
   2 ok code
   3 ok orchestration
$ ls docs/figures/paper docs/figures/academic-pipeline
ls: docs/figures/academic-pipeline: No such file or directory
ls: docs/figures/paper: No such file or directory
ls-exit=1

$ git grep -n -o 'docs/figures/[A-Za-z0-9/._-]*' -- README.md docs skills ':!docs/roadmap.md' | <test -e of each path>
(no MISSING line)
$ git grep -n -o 'docs/figures/[A-Za-z0-9/._-]*' -- README.md docs skills | <test -e of each path>
MISSING docs/roadmap.md:67:docs/figures/paper/lifecycle.svg

$ git grep -n -E '(^|[^/a-z-])(researcher|researcher-research|researcher-revision|pipeline|plan-loop)\.svg|academic-pipeline/' -- README.md docs/dev
rc=1 (no match)

Commands the builder's report quotes, rerun:
$ git diff 50a98c8 --numstat -- README.md docs/dev docs/adr docs/figures/gen_figures.py
27<tab>27<tab>README.md
1<tab>1<tab>docs/adr/0043-...md
1<tab>1<tab>docs/adr/0049-...md
1<tab>1<tab>docs/dev/building.md
5<tab>2<tab>docs/dev/scripts.md
164<tab>1316<tab>docs/figures/gen_figures.py
$ wc -l skills/code/handbook/templates/figures.py docs/figures/gen_figures.py docs/figures/academic/researcher/gen_academic_pipeline.py
    1270 skills/code/handbook/templates/figures.py
    1568 docs/figures/gen_figures.py
     296 docs/figures/academic/researcher/gen_academic_pipeline.py
$ grep -n '^import\|^from' skills/code/handbook/templates/figures.py
73:from collections.abc import Sequence
74:from dataclasses import dataclass
75:from html import escape
76:from itertools import pairwise
77:from pathlib import Path
78:from statistics import fmean
79:from typing import NamedTuple
$ grep -n 'open(\|read_text' skills/code/handbook/templates/figures.py
1260:            with path.open("w", encoding="utf-8", newline="\n") as handle:
1262:            written = path.read_text(encoding="utf-8")
$ ruff check --select F --no-cache <the three scripts>
All checks passed!
$ diff <base lines 101-1252 of docs/figures/gen_figures.py> <lines 81-1244 of the engine>
(differences only: RULED, RULED_FILL and RULED_INK removed; FLOW_WIDTH added; the kinds ruled, ruled_maybe, todo, ap, rev, pipe, dr and paper removed from STYLES; WORDS and add_kind added; graph, parts, flow_label and lanes_label added; _wrap and _node_height renamed wrap and node_height, at every call; SIMPLE_LEGEND and PAPER_KIND_LEGEND removed; describe reads WORDS in place of its local names map; the lanes separator comment reworded)
$ diff <base lines 1253 to the end, with _graph, _parts, _flow_label and _lanes_label renamed> <lines 140 to the end of the new gen_figures.py>
(differences only: the moved helpers, add_kind("paper", ...), the two legends and MODEL moved above, each figure name and output path changed to its new path, two docstrings reworded to "path under docs/figures", write_figures moved to the engine and called with ROOT)
$ diff <base gen_academic_pipeline.py> <new gen_academic_pipeline.py>
(differences only: head comment lines 3-6, 14 and 21, a new error line 23, ROOT and ENGINE, the guarded import as fg with sys.dont_write_bytecode, five add_kind calls, gf renamed fg, _wrap and _node_height renamed, ROOT passed to write_figures)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. All 28 moves follow the table, checked by the `cmp` loop (`compared=28 bad=0`). The folder test passes over the files on disk. `ls` fails for both old folders.
- 2: holds. The script stands at `docs/figures/academic/researcher/gen_academic_pipeline.py` and writes `academic-pipeline.svg` beside itself (exit 0 from the root and from `/tmp`).
- 3: holds against the brief, by the diff of the base layout code against the engine above:
  - It imports only the standard library (lines 73-79).
  - It names no path of this repository (the case grep prints nothing).
  - `write_figures` takes `root` as a parameter.
  - The head comment carries every part the brief lists.
  - Three findings stand against the rules file rather than against the brief: Standards 1 (rule 11, which Decision 5 dictates), Standards 2 (a false sentence in the head comment) and Behaviour 1 (an error missing from the head comment's list).
- 4: holds. `gen_figures.py` keeps every figure and imports the engine from its own location after `sys.dont_write_bytecode = True` (lines 107-139). It defines no engine class or function. `figures()` names each new path (lines 1535-1554). The head comment lists the new paths, states the D5 rule, names the engine and lists the ImportError.
- 5: holds. The script imports `figures as fg` and nothing from `gen_figures.py`. Its head comment lines 3-6, 14, 21 and 23 replace lines 3-4, 12 and 19 and add the error. The `paper` kind is written in both scripts (Standards 3).
- 6: holds. All 28 `cmp` runs exit 0.
- 7: holds:
  - In `README.md`, only the 27 image paths changed (a `diff` with the paths masked prints nothing).
  - `building.md` line 41 and `scripts.md` follow, and so do ADR 0043 line 106 and ADR 0049 line 18.
  - The engine row under "User scripts" uses the dictated wording, which is false until step 3 lands (Spec 1).

Cases of the brief's "Cases":

- `python3 docs/figures/gen_figures.py` from the root: met. Exit 0 and 27 `wrote` lines, each at the table's path.
- `gen_academic_pipeline.py` from the root: met. Exit 0, and it writes `docs/figures/academic/researcher/academic-pipeline.svg`.
- The two scripts from another directory: met. Both exit 0 from `/tmp`.
- `cmp` of the 28 figures and `git status --short docs/figures skills/code/handbook`: met. `compared=28 bad=0`, and the status shows only the moves, the changed scripts and the new engine. The `cmp` ran against 50a98c8, not the brief's ee15921 (see "Declined to judge").
- `find skills docs/figures -name __pycache__`: met. It prints nothing.
- The grep of `^class \|^def ` over both scripts: met. No engine name is defined in either script.
- The grep of `import`: met. Each script imports `figures` from `skills/code/handbook/templates`, and no line imports `gen_figures`.
- The grep of the engine for repository words: met. No line matches.
- The folder test and `ls` of the old folders: met over the files on disk. The literal `git ls-files -co` lists the 28 deleted old paths until the landing commit (Spec 2, a defect of the brief's case and not of the diff). `ls` fails for both folders.
- Every `docs/figures/` path exists, run without and with `docs/roadmap.md`: met. Without the roadmap nothing is missing. With it, the one missing path is `docs/roadmap.md:67:docs/figures/paper/lifecycle.svg`.
- The old-name grep over `README.md docs/dev`: met. It prints nothing.

## 1. Spec

- `docs/dev/scripts.md`, "User scripts", the engine's row:
  - Quoted: "The drawing engine that `handbook` copies into a repository and both figure scripts of this repository import".
  - What is wrong: no `handbook` skill exists after this step. `skills/code/handbook/` holds only `templates/figures.py`, and no `SKILL.md`, so `/ordo-help skills` and `utils/pin.sh` skip the folder. The page's own definition reads "A user script is run by a skill or by the user of a repository that has Ordo set up", and no skill runs the engine until step 3 lands.
  - The sentence is false on main from step 1's landing until step 3's. Rule 14 ("A sentence in a document or a head comment that the change makes false is a defect of the change") applies. Brief item 7 dictated the wording, so under rule 4 the builder kept it and reported it, as it did ("wrong or impossible", item 3).
  - Failure scenario: between the two landings, a reader of `scripts.md` looks for the `handbook` skill that copies the engine. They find a folder with no `SKILL.md`, or they assume a copy step exists that no skill text describes.
  - One way to meet both the rule and the plan: at step 1, the row says "the drawing engine both figure scripts of this repository import". Step 3, which writes the copy step, then adds the `handbook` clause and moves or keeps the row under "User scripts". Step 3's brief already writes `docs/dev/scripts.md` (plan step 3).
  - Verdict: none. The item holds as dictated, and the orchestrator rules on the wording.
- The brief's "Cases", the folder case:
  - Quoted: "For each figure that `git ls-files -co --exclude-standard docs/figures` lists".
  - What is wrong: in an uncommitted worktree, `-c` lists the 28 deleted old paths from the index. My run of the literal command reports all 28 old paths as flat or outside a group, so the case can be met only over the files on disk or after the landing commit. The builder reported this ("wrong or impossible", item 2).
  - Failure scenario: a reviewer or the landing runs the literal command before the commit and reads 28 failures as a defect of the moves.
  - Verdict: none for the diff. The case is met over the files on disk and is a defect of the brief's wording.

## 2. Proof

- None. Every claim in the builder's report that a decision rests on reproduced: the 28 `cmp` runs, the script outputs and exit statuses, the greps, the numstat, the line counts, the import lines, the read-back grep and the `ruff` run. The first run on the unchanged tree was not rerun (see "Declined to judge").

## 3. Standards

- `skills/code/handbook/templates/figures.py:144-166`:
  - Quoted: "STYLES = {" ... "WORDS = {" ... "def add_kind(name: str, style: Style, words: str | None = None) -> None: ... STYLES[name] = style / WORDS[name] = name if words is None else words".
  - What is wrong: rule 11 of `docs/dev/change-standard.md` says "No mutable global state", and `add_kind` mutates two module-level dicts. The base had `STYLES` as a module-level dict, but nothing wrote it. The diff adds the first writer. The page also says "nothing in a brief overrides anything here", so the diff breaks the rule even though the brief's Decisions 5 dictated this exact shape. The builder built it as dictated and reported it (judgment call 8). The shape is reserved to the orchestrator (rule 4), so this is the orchestrator's to rule on, not the builder's to fix.
  - Failure scenario: ADR 0060 has `handbook` copy the engine into a documented repository's `utils/`, "with each diagram a graph in a Python file". Say one driver, or a test run, imports two such diagram files in one interpreter, and both call `add_kind("service", ...)` with different styles. The second call overwrites the first, so the first diagram is drawn in the second's colours with no error. Likewise, `add_kind("stop", ...)` in one file silently restyles every stop in every figure drawn later in that process. Within Ordo today, both scripts add the same `paper` values, so nothing visible changes yet.
  - One shape meets both the rule and the brief's goal ("a script adds a kind of its own through one public engine function"):
    - The engine keeps its six kinds as an immutable default table, for example a `Kind(style, words)` per name in a `MappingProxyType`.
    - `with_kinds(extra)` returns a new mapping of the defaults plus the script's own kinds.
    - `compose`, `lanes_figure` and `describe` take that mapping as a `kinds` parameter that defaults to the engine's table. They pass it down to `Canvas`, `draw_node` and `draw_legend`, where `STYLES[kind]` is read today (lines 388 and 980-981, and `WORDS` at 1061).
    - `gen_academic_pipeline.py` calls `draw_node` directly and passes its mapping too. No figure's bytes change, since the styles are the same values.
  - Verdict: none on the brief's items. This is a finding against the rules file for the orchestrator to rule on.
- `skills/code/handbook/templates/figures.py:46`:
  - Quoted: "The module reads no file and takes every value from its caller."
  - What is wrong: the head comment's own step 4 says `write_figures` "writes each file ... and reads it back" (lines 1260-1262: `path.read_text(...)`). So the sentence is false as written. Rule 14 calls a false sentence in a head comment a defect of the change. The builder's report calls the sentence true "since ... only the read-back", which concedes the read.
  - Failure scenario: someone copying the engine into a repository with a read-only or sandboxed output folder trusts "reads no file" and does not expect the read-back's `OSError` path that the error list describes.
  - Fix: "The module reads no input file: it reads back only each file it writes, and takes every value from its caller."
  - Verdict: none.
- `docs/figures/gen_figures.py:145` and `docs/figures/academic/researcher/gen_academic_pipeline.py:60-64`:
  - Quoted: `"paper", Style("#dff3f1", "#0f766e", "", "#134e4a", 1.5, False), "a run of another skill"`, written in both scripts.
  - What is wrong: the same style and words are now kept in two places, so a change in one does not reach the other. The duplication is forced:
    - The brief's premise that `paper` is used only by `gen_figures.py` is wrong. The pipeline script uses it at lines 82 and 155-160, as the base did.
    - Item 5 forbids importing from `gen_figures.py`.
    - Decision 4 takes `paper` out of the engine.
  - The builder reported the premise as wrong ("wrong or impossible", item 1) and did not choose a substitute. Under rule 4 that is correct.
  - Failure scenario: the teal of `paper` boxes is changed in `gen_figures.py` and the script is rerun. `academic-pipeline.svg` keeps the old teal, its legend line "Teal: paper, paper-review-panel and researcher" no longer matches the README's other figures, and no check notices.
  - Options for the orchestrator, my judgment:
    - (a) Accept one duplicated one-line literal, since the pipeline figure is an archive of a retired pipeline.
    - (b) A small module beside `gen_figures.py`, such as `docs/figures/ordo_kinds.py`, imported by both. This adds a path outside the brief's list.
    - (c) Move `paper` into the engine with neutral words. This breaks "no name of a skill" only if the words keep "skill".
  - Verdict: none.
- `docs/figures/academic/researcher/gen_academic_pipeline.py:88-94`:
  - Quoted: `def _g(nodes, edges, floating=(), width: float = NODE_WIDTH) -> fg.Graph: return fg.Graph(tuple(nodes), tuple(edges), tuple(floating), width)`.
  - What is wrong: the engine now exports `graph` with the same default width (`FLOW_WIDTH = 214`, and `NODE_WIDTH = 214` in this script). So two helpers that build a `Graph` from sequences now exist, the change standard's "A rule is written once" spirit for code, and ADR 0060's reason against copies ("drift apart") on a small scale. Brief item 5 does not ask for `_g` to go, so this is low.
  - Failure scenario: a change to how the engine builds a `Graph`, such as a new field with a default, reaches `gen_figures.py` but not this script.
  - Verdict: none.
- `docs/figures/gen_figures.py:171,199,206` and `skills/code/handbook/templates/figures.py:1058,1071`:
  - Quoted: `def _single(name, title, graph: Graph, ...)`, `def with_mode_stop(graph: Graph)`, `def _paper(name, mode, graph: Graph)`, and `parts = []` inside `describe` and `flow_label`.
  - What is wrong: making `_graph` and `_parts` public as `graph` and `parts` (Decision 6) means these parameters and locals now shadow the module-level functions. `ruff --select F` passes, and none of the five bodies calls the shadowed name. The builder reported this (judgment call 9).
  - Failure scenario: a later edit inside `_paper` that calls `graph(nodes, edges)` fails with "'Graph' object is not callable".
  - Fix: rename the parameter `flow` and the local `texts`. Low.
  - Verdict: none.

## 4. Behaviour

- `skills/code/handbook/templates/figures.py:1245-1269`:
  - Quoted: `lines.append(f"wrote {path.relative_to(root).as_posix()} ({len(body)} bytes)")`.
  - What is wrong: `root` is a new caller-supplied parameter. When it does not hold `base`, `relative_to` raises `ValueError`, not `FigureError`, after the first file has already been written. Neither the head comment's error list nor the docstring lists that error, and the docstring states the condition only as "root, which holds base". In the base, `ROOT` was fixed, so the error could not be reached. Rule 14 asks a head comment to list "every error it prints". Rule 15 makes a supplied value that reaches a path a case. Within Ordo the cost is low: both scripts pass the right root.
  - Failure scenario: a documented repository's diagram script, written by `handbook` at step 3, passes `Path.cwd()` as `root` and is run from another folder. One SVG is written, then the script stops with a traceback. The user sees a partly written set and no "error:" line.
  - Fix: check `base.resolve().is_relative_to(root.resolve())` before any write and raise `FigureError` naming both paths, with that error added to the head comment's list.
  - Verdict: none.
- `skills/code/handbook/templates/figures.py:388`:
  - Quoted: `style = STYLES[kind]`.
  - What is wrong: a node of a kind no one added raises `KeyError` with a traceback, not a `FigureError`, and the error list omits it. This behaviour is unchanged from the base. It matters more now that `add_kind` makes kinds open to callers.
  - Failure scenario: a typo such as `Node("A", "x", "scirpt")` gives a bare `KeyError: 'scirpt'` with no figure named.
  - This is pre-existing and outside the brief's items, so it is listed and not raised as this step's defect.
  - Verdict: none.

## Declined to judge

- Whether 50a98c8 and the brief's ee15921 hold the same `docs/figures` and the same `gen_figures.py`, `README.md`, ADR and `docs/dev` content. I ran every `cmp` against 50a98c8, as my instructions say. `git diff ee15921 50a98c8 -- docs/figures README.md docs/dev docs/adr` would settle it. The builder states they match, and I did not verify that.
- The first run of the cases on the unchanged tree, as the builder's report quotes it. Rerunning it would need the base scripts run, and the base pipeline script writes a `__pycache__` folder into the tree. No decision rests on that run beyond what the after-runs show.
- `docs/figures/academic/researcher/gen_academic_pipeline.py:11-12`, "taken from the files of academic-pipeline in research-hub". The line is unchanged from the base, and the file only moved. The project's `CLAUDE.md` rule covers `skills/`, `agents/`, `utils/` and `README.md`. The state file's standing demand says "no shipped file names `research-hub`". Whether `docs/figures/` counts as shipped is the orchestrator's call, and it is outside this brief's items.
- Open item B, how the gate treats `docs/roadmap.md` line 67. This is the user's ruling. The step ran both forms as the brief says.
- Whether the D5 sentence's extension "in the group most of them belong to" is a change of D5's meaning. D5 reads "a figure over several skills of one group". The extension comes from the brief's Decisions 1, so the orchestrator owns it.

Reviewer usage: a87f37bb66e71447b, claude-opus-5-5, 185283 tokens, 47 tool uses, 8.0 minutes.

## Repair round 1, refuted

```
$ python3 --version
Python 3.13.4
$ python3 docs/figures/gen_figures.py        (from the worktree root)
wrote docs/figures/orchestration/pipeline.svg (23294 bytes)
... 27 `wrote` lines, the last: wrote docs/figures/academic/paper/run-folder.svg (21112 bytes)
exit=0
$ python3 docs/figures/academic/researcher/gen_academic_pipeline.py
wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)
exit=0
$ cd /tmp && python3 <worktree>/docs/figures/gen_figures.py >/dev/null
gen_figures from /tmp exit=0
$ cd /tmp && python3 <worktree>/docs/figures/academic/researcher/gen_academic_pipeline.py
wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)
exit=0

$ cmp loop: 14 single figures by the brief's table + 14 under paper/, each `git show 50a98c8:docs/figures/<old> | cmp - docs/figures/<new>`
compared=28 bad=0
$ find skills docs/figures -name __pycache__
(prints nothing)

$ grep -n -E '^(class|def) (FigureError|Rect|Style|Node|Edge|Graph|Canvas|FlowLayout|Panel|Legend|Lane|Row|wrap|draw_node|draw_legend|compose|describe|lanes_figure|write_figures|with_kinds|graph|parts|Kind)\b' docs/figures/gen_figures.py docs/figures/academic/researcher/gen_academic_pipeline.py docs/figures/ordo_kinds.py
(prints nothing)
$ grep -n 'import' <the two scripts and ordo_kinds.py>
gen_academic_pipeline.py:54:    import figures as fg
gen_academic_pipeline.py:62:    from ordo_kinds import PAPER
gen_figures.py:119:    from figures import (
gen_figures.py:145:    from ordo_kinds import PAPER
ordo_kinds.py:11:from figures import Kind, Style
(plus the standard-library imports and head-comment lines; no line imports gen_figures)
$ grep -n -i 'docs/figures\|research\|paper\|grill\|plan\|referee\|submit\|orchestration\|ordo' skills/code/handbook/templates/figures.py
(prints nothing)

$ folder case over files on disk (each file under docs/figures, its folders a group of skills/ or a group and a skill of it)
FLAT gen_figures.py
FLAT ordo_kinds.py        (the two scripts; every figure passes)
$ ls docs/figures/paper docs/figures/academic-pipeline
ls: docs/figures/academic-pipeline: No such file or directory
ls: docs/figures/paper: No such file or directory   (exit 1)
$ ls count of *.svg: academic 5, academic/paper 14, academic/researcher 4, code 2, orchestration 3  (= 28)
$ git ls-files -co --exclude-standard docs/figures | (entries that do not exist on disk) | wc -l
29   (the 28 old figures and the old pipeline script; the report says 28, counting figures only)

$ git grep -n -o 'docs/figures/[A-Za-z0-9/._-]*' -- README.md docs skills ':!docs/roadmap.md'   -> 55 hits, every path exists (no MISSING)
$ the same without the exclusion -> MISSING docs/figures/paper/lifecycle.svg
$ git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md -> docs/roadmap.md:67 (the done line of entry 25)
$ the same with --untracked, roadmap left out: 62 hits, none missing; with the roadmap: the same one missing
$ git grep -n -E '(^|[^/a-z-])(researcher|researcher-research|researcher-revision|pipeline|plan-loop)\.svg|academic-pipeline/' -- README.md docs/dev
(prints nothing)
$ character-set check over the 40 files the diff adds or changes plus the untracked (the figures, scripts, pages, ADRs, the round brief, both reports)
(prints nothing) exit=0

$ grep -n 'open(\|read_text' skills/code/handbook/templates/figures.py
1307:            with path.open("w", encoding="utf-8", newline="\n") as handle:
1309:            written = path.read_text(encoding="utf-8")
$ ruff check --select F,W2 <engine, gen_figures.py, ordo_kinds.py, the pipeline script> -> All checks passed!
$ ruff check --preview --select E3 <the same four> -> All checks passed!
$ grep -n 'STYLES\|WORDS\|add_kind' <engine, both scripts, docs/dev/scripts.md> -> prints nothing
$ git grep -n -F '_g(' ; git grep -n -F 'add_kind' (outside .scratch and docs/roadmap.md) -> prints nothing
$ grep -n -E '\b(KINDS|STYLES|WORDS)\[[^]]*\] *=|\b(KINDS|STYLES|WORDS)\.(update|setdefault|pop|clear)\(|^ +global ' <engine> -> prints nothing, exit=1
$ grep -n '^[A-Z_]* = \|^[a-z_]* = ' <engine>
lines 96-132 and 1135-1137: each a string or number constant (colours, font, sizes, DOTTED, DASHED, FLOW_WIDTH, LANE_PAD, LANE_HEAD, LANE_GAP). KINDS (line 166, `KINDS: Mapping[str, Kind] = MappingProxyType(`) is the one mapping; nothing assigns into it.
$ grep -n 'graph: Graph' docs/figures/gen_figures.py ; grep -n 'parts = \[\]' <engine> -> both print nothing
$ grep for a parameter, local or loop variable named graph or parts in the engine and both scripts (outside self.) -> only the Panel field `graph: Graph` (engine:994) and the imports at gen_figures.py:131,134
$ git diff 50a98c8 --numstat -- README.md docs/dev docs/adr
27 27 README.md / 1 1 each ADR / 1 1 docs/dev/building.md / 5 2 docs/dev/scripts.md
$ grep -n 'compose(\|lanes_figure(\|describe(' docs/figures/gen_figures.py, each call parsed for FIGURE_KINDS
8 calls (lines 184, 186, 672, 737, 1342, 1344, 1440, 1549), all pass FIGURE_KINDS

Reads of the engine's kind handling (a scratch `python3 -` over the engine, nothing written to the tree; `find skills docs/figures -name __pycache__` afterwards prints nothing):
with_kinds({"stop": ...}) -> FigureError: the kind 'stop' is one of the engine's kinds
KINDS["x"] = ... -> TypeError: 'mappingproxy' object does not support item assignment
Node("A","x","scirpt") through describe -> FigureError: T: the kind 'scirpt' is not one of the figure's kinds
the same through compose -> FigureError: fig.svg: the kind 'scirpt' is not one of the figure's kinds
Legend("zzz", ...) -> FigureError: fig.svg: the kind 'zzz' is not one of the figure's kinds
write_figures(base outside root) -> FigureError: the folder <base> is not under the root <root>
write_figures(name "../x.svg") -> FigureError: ../x.svg: the file is not under the folder <base>
write_figures(non-ASCII body) -> FigureError: ok/x.svg: the body holds a character that is not ASCII; no file written (the folder stayed empty)
```

Method note: besides `git diff`, `git status` and `git show`, I ran `git grep` and `git ls-files -co`/`-o` read-only, because the brief's path and folder cases are defined by them. The scratch probes above only read the engine.

### Verdicts

Items of the brief's "What to build", as the round amends them:

- 1: holds. 28 `cmp` runs against 50a98c8 exit 0; both old folders are gone; the folder case passes over the files on disk.
- 2: holds. The script stands at `docs/figures/academic/researcher/` and writes `academic-pipeline.svg` beside itself, from the root and from `/tmp`.
- 3 (the engine, with Decisions 4 to 7 as the round amends them): holds, with one departure from the round brief's letter (Spec 1).
  - The six kinds sit in one `MappingProxyType` table `KINDS`, built of `Kind(style, words)`; `add_kind`, `STYLES` and `WORDS` are gone.
  - `with_kinds` returns a new read-only mapping and raises `FigureError` for an engine name.
  - `_kind` raises `FigureError` naming the figure (or the title in `describe`) and the kind, in place of `KeyError`.
  - No module-level mapping is written after import (the greps above).
  - The engine imports only the standard library and names no repository path or skill (the word grep prints nothing).
  - `write_figures` takes `root` and now refuses a base outside the root before any write.
  - The head comment carries the new shape and every new error (lines 34-75).
- 4: holds. `gen_figures.py` defines no engine name, builds `FIGURE_KINDS = with_kinds({"paper": PAPER})` once and passes it to all 8 draw and describe calls; its head comment lists the new paths, the D5 rule, the engine, the `ordo_kinds` import and the kind error.
- 5: holds. The pipeline script imports nothing from `gen_figures.py`, builds its own mapping with `with_kinds` (`ap`, `rev`, `pipe`, `dr`, `paper`), passes it to `Canvas`, and lists the new errors.
- 6: holds. 28 of 28 `cmp` exit 0.
- 7: holds. README changes only the 27 image paths (27/27 numstat); `building.md`, `scripts.md` and both ADRs follow. The engine's row in `scripts.md` no longer says `handbook` copies it. `scripts.md` rows 9 and 10 name `ordo_kinds.py`.
- Round ruling 1: holds in its ends (read-only table, `with_kinds`, `FigureError` for a missing kind, no global written). It departs from the ruling's letter on where `kinds` is passed (Spec 1).
- Round ruling 2: holds. `docs/figures/ordo_kinds.py` (13 lines) holds `PAPER` only. Both scripts import it after `sys.dont_write_bytecode`; the pipeline script still imports nothing from `gen_figures.py`; `ap`, `rev`, `pipe` and `dr` stay in the pipeline script; `scripts.md` lists it.
- Round ruling 3: holds (`sed -n 19p docs/dev/scripts.md` shows the clause is gone).
- Round ruling 4: holds (engine lines 51-52).
- Round ruling 5: holds (the `root` check), plus one further check (see Declined or Findings: judged to hold).
- Round ruling 6: holds. `_g` is gone, and `pipeline_flow` calls `fg.graph(nodes, edges, width=NODE_WIDTH)`. The figure is byte-identical.
- Round ruling 7: holds. No parameter or local shadows `graph` or `parts` any more, including `FlowLayout.__init__`, which the builder also renamed. Renaming `FlowLayout.__init__`'s parameter is the same defect as the ruling's, so it is within the finding.
- Round ruling 8: holds. The folder case is run over the files on disk, and the literal `-co` behaviour is stated.
- Round ruling 9: holds. Every case was rerun here and matches the report, except that the report counts 28 deleted paths in the literal list where I count 29 (the 28 figures plus the old pipeline script); this changes no decision.

The two places the builder went past the round brief:

- A legend sample must now be a kind, "dotted" or "loop": holds. At the base, `draw_legend` took any non-kind, non-"dotted" word as the loop sample, so a mistyped sample was drawn as a loop with no error. The ruling requires a legend entry whose kind the mapping lacks to raise `FigureError`, and that cannot be built on the base's `else` branch. The legends of both scripts use only kinds, "dotted" and "loop" (the sample grep), and the figures stay byte-identical. The head comment's "any other word for a dotted loop" is changed to "loop" and the new error is listed.
- `write_figures` refuses a file name that resolves outside `base`: holds. A name such as `../x.svg` would otherwise be written outside the folder and then fail at `relative_to` with a `ValueError`, which is the first refuter's Behaviour 1 failure reached through the name. It is also a supplied value that reaches a path (change standard rule 15). It is documented in the docstring and the error list, and it is within the finding's cause, not a separate concern.

Cases of the brief's "Cases":

- `gen_figures.py` from the root: met. Exit 0, 27 `wrote` lines at the table's paths.
- The pipeline script from the root: met.
- Both scripts from another directory: met. Both exit 0 from `/tmp`.
- `cmp` of the 28 figures and `git status` of `docs/figures skills/code/handbook`: met. `compared=28 bad=0` against 50a98c8; the status shows 29 deletions, `M gen_figures.py`, and the new `academic/`, `code/`, `orchestration/`, `ordo_kinds.py` and `skills/code/handbook/`.
- `__pycache__`: met. It prints nothing.
- The definitions grep: met. No engine name, `with_kinds`, `graph`, `parts` or `Kind` is defined in either script or in `ordo_kinds.py`.
- The import grep: met. Both scripts import `figures` and `ordo_kinds`; no `gen_figures` import in the pipeline script.
- The engine's word grep: met. It prints nothing.
- The folder case and `ls` of the old folders: met over the files on disk. The only entries that are not figures are the two scripts, which the case does not cover.
- The path case without `docs/roadmap.md`: met (55 hits, none missing; 62 with `--untracked`, none missing). With `docs/roadmap.md`: the one missing path is `docs/roadmap.md:67:docs/figures/paper/lifecycle.svg`, Open item B, as the user ruled the gate leaves it out.
- The old-name grep: met. It prints nothing.
- The module-level mapping run: met (above).
- The read of `with_kinds` and of the kind lookup: met (above).

### Findings

1. Spec.
   - `skills/code/handbook/templates/figures.py:419-420` and `:1013`: "def draw_node(canvas: Canvas, area: Rect, kind: str, lines: Sequence[str])" ... "style = _kind(canvas.name, canvas.kinds, kind).style".
   - What is wrong: round ruling 1 says "`compose`, `lanes_figure`, `describe` and every engine function that reads a kind's style or words today (`Canvas`, `draw_node`, `draw_legend`, and those they call) take that mapping as a `kinds` parameter". Built: `Canvas` takes `kinds` and stores it, and `draw_node` and `draw_legend` keep their signatures and read `canvas.kinds`. The builder lists it as its judgment call 7, not as a stop, although the signature of public engine functions is a shape the rules file's rule 4 reserves to the orchestrator.
   - The ruling's ends hold: nothing global is written, one mapping per figure is passed down, and the mapping cannot differ between a canvas and its nodes.
   - Failure scenario: none that produces a wrong figure. A later brief that calls `draw_node(canvas, area, kind, lines, kinds)` as the ruling reads fails with a `TypeError`.
   - Verdict: item 3 holds in its ends; the orchestrator rules whether the Canvas-held shape stands, and the documented behaviour is consistent with it.
2. Behaviour.
   - `skills/code/handbook/templates/figures.py:178-183` and `:1012`: "for name in extra: if name in KINDS: raise ..." and "if row.sample not in ("dotted", "loop"):".
   - What is wrong: `with_kinds` accepts a kind named "dotted" or "loop", and a Legend row with that sample then always draws the arrow or the loop, never the box. At the base an added kind of that name would have drawn as a box. The head comment lists neither name as reserved.
   - Failure scenario: a documented repository's diagram script adds `with_kinds({"loop": Kind(...)})` and a legend `Legend("loop", "...")`. The legend shows a dotted loop where the author drew a box kind, with no error.
   - Verdict: none on the items; a case of rule 15's kind (a caller-supplied name reaching generated text), low.
3. Standards.
   - `skills/code/handbook/templates/figures.py:462` and `:957`: "self.kinds = {node.key: node.kind for node in ...}" and "draw_node(canvas, area, self.kinds[key], self.lines[key])", next to `Canvas.kinds` at `:314`.
   - What is wrong: the round gives two attributes of one module the name `kinds` with different meanings: `FlowLayout.kinds` maps a box's key to its kind name, `Canvas.kinds` maps a kind name to its `Kind`. Line 957 reads `self.kinds[key]` and passes it to a function that reads `canvas.kinds`.
   - Failure scenario: an edit near line 957 that reads `self.kinds[key].style` fails with `AttributeError: 'str' object has no attribute 'style'`.
   - Verdict: none; low.
4. Proof: none. Every claim of the report that a decision rests on reproduced: the 28 `cmp` runs, both script runs and exits, the greps, the numstat, the read-back lines, both `ruff` runs, the 55 and 62 hit counts and the `KINDS` write error. The one differing number, 28 against 29 deleted paths in the literal `-co` list, is a count by figure against a count by entry and decides nothing.
5. Closure judgments: no finding was closed by removing a check rather than fixing what it guarded, and none is closed by a claim my rerun does not reproduce. The `_g` removal, the `Sequence` import removal, the renames and the `ordo_kinds.py` file reach exactly the findings they close. History in a comment, `add_kind`, `STYLES`, `WORDS`, `_g`, `ordo_kinds` and `handbook` sentences made false by the round, and non-ASCII: none found (greps above; the character-set check exits 0).

### Declined to judge

- Whether 50a98c8 and the brief's ee15921 hold the same `docs/figures`, README, `docs/dev` and ADR content. I ran every `cmp` against 50a98c8; the builder's report quotes ee15921. `git diff ee15921 50a98c8 -- docs/figures README.md docs/dev docs/adr` would settle it.
- The first run of the cases on the unchanged tree: I did not rerun it, since the base pipeline script writes `__pycache__` into the tree.
- `docs/figures/academic/researcher/gen_academic_pipeline.py` lines 11-12, "taken from the files of academic-pipeline in research-hub". The line is unchanged from the base and only moved. Whether `docs/figures/` counts as a shipped file under `CLAUDE.md` is the orchestrator's call.
- Whether the Canvas-held `kinds` shape (Spec 1) stands in place of the ruling's wording. That is the orchestrator's ruling.
- The running of each guarded import's error path (engine or `ordo_kinds.py` missing): checked by reading only, since running it would take the file away.

Reviewer usage: a3e0d150656bdfa82, claude-sonnet-5-5, 172678 tokens, 31 tool uses, 3.9 minutes.

## Closed

Each finding of the run over repair round 1, closed at landing:

- 1 (Spec, `kinds` held by `Canvas` where round ruling 1 named a parameter of `draw_node` and `draw_legend`): ruled by the orchestrator that the shape stands. One mapping per figure reaches every drawing call through the canvas it draws on, so a node and its canvas cannot be given two mappings that disagree; the head comment states the shape. No code change.
- 2 (Behaviour, `with_kinds` accepting "dotted" or "loop"): fixed on main. `figures.py` holds `LEGEND_MARKS = ("dotted", "loop")`; `with_kinds` raises `FigureError` "the kind 'loop' is a legend mark, not a kind" for either name; `draw_legend` tests the sample against `LEGEND_MARKS`; the head comment's error list names the two marks. A read through `python3 -` with bytecode off printed the error for "loop" and "dotted" and the engine-name error for "stop".
- 3 (Standards, two attributes named `kinds`): fixed on main. `FlowLayout.kinds`, the map of a box's key to its kind name, is `FlowLayout.kind_of` at its six uses; `Canvas.kinds` is unchanged.
- After both fixes: both scripts run from the root, `git diff --quiet -- docs/figures` exits 0 (every figure byte-identical), `ruff check --select F,W2` and `ruff check --preview --select E3` print `All checks passed!`, no `__pycache__` under `skills` or `docs/figures`, and the verify list prints `checks: 16 commands passed`.
- Declined point on the two bases: `git diff --stat ee15921 50a98c8 -- docs/figures README.md docs/dev docs/adr` prints nothing, so the builder's `cmp` runs against ee15921 and the reviewer's against 50a98c8 compare the same figures.
