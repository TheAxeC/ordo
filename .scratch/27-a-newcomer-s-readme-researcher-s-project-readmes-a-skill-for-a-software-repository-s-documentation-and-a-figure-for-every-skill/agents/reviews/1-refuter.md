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
