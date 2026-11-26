# Brief check: step 1

## 1. Names

Command: `git grep -n -o 'docs/figures/[A-Za-z0-9/._-]*' -- ':!.scratch/archive'` and `git grep -n -E 'gen_figures|gen_academic_pipeline|figures\.py|academic-pipeline\.svg|figures/paper|paper/(...)\.svg|(pipeline|plan-loop|grill|...|researcher-revision)\.svg' -- ':!.scratch/archive' ':!docs/figures/*.svg' ':!docs/figures/**/*.svg'`, plus `git grep -n 'academic-pipeline/' -- ':!.scratch'`. Hits outside "Paths this step writes":

1. `docs/figures/academic-pipeline/gen_academic_pipeline.py:12` `Run, from the repository root: python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`. The file moves, so this hit is inside the step. The brief does not ask for this line to change, and the move makes it false. Item 5 asks only that the head comment "names its new imports". Lines 3 and 4 (`Imports the layout code of ../gen_figures.py ... The import writes a __pycache__ folder beside gen_figures.py, which git ignores.`) and line 19 (`named the way gen_figures.py names them`) also become false once the engine moves and `sys.dont_write_bytecode` is set. Item 5 should name all three places.
2. `docs/figures/gen_figures.py:55` `This file is also the layout code of academic-pipeline/gen_academic_pipeline.py, which imports it from its own folder's parent.` The change makes this false. Item 4 lists what the head comment gains but not that this sentence goes. Line 3, `Writes, beside this file:`, also becomes false, because the figures go to subfolders.
3. `docs/figures/gen_figures.py:2609` and the text of `docs/figures/pipeline.svg`: `The loop of plan-loop.svg: /spec, build it, /refute, /land`. This is a bare file name inside a figure label. It stays true, because `plan-loop.svg` moves beside `pipeline.svg` into `orchestration/`. Item 6 (byte for byte) also forbids changing it.
4. `docs/dev/scripts.md:10` `using the layout code of gen_figures.py`. This line is inside the step's paths, but item 7 asks only for "new paths and outputs". After the split the phrase is false: the script uses the engine `skills/code/handbook/templates/figures.py`. Item 7 should say so.
5. `docs/dev/building.md:41` and `docs/dev/scripts.md:9` name bare figure names (`researcher.svg`, `researcher-research.svg`, `researcher-revision.svg` and the others) with no `docs/figures/` prefix. They are inside the step's paths. Case 44 cannot see them (see 5.8).
6. `docs/adr/0060-...md:7` `Ordo's figures are drawn by docs/figures/gen_figures.py, a Python script that lays out each graph and writes its SVG itself`. Lines 11, 13 and 18 name `gen_figures.py`. Line 7 is Context and the path is kept, so it stays true. Lines 11 and 13 become true.
7. `docs/adr/0042-...md:54` `both figure scripts and the figures they write.` This is a Consequences list and stays true.
8. `docs/roadmap.md:67`, the done entry 25: `the user read both sheets and docs/figures/paper/lifecycle.svg`. This is history and is left as it is. It becomes a missing path after the move, which matters for 4.3.
9. `docs/roadmap.md:26-27`, entry 27's goal and gate, name `docs/figures/` alone. They stay true.
10. Ledger hits in `L/plan.md` and `L/orchestrator-state.md:61` are the plan's own text and stay true.
11. `.scratch/archive/`: 301 files hit (`git grep -l -E 'docs/figures/|gen_figures|gen_academic_pipeline' -- .scratch/archive | wc -l` printed `301`). All are history.
12. `skills/`, `utils/` and `agents/` hold no hit for any figure path, `gen_figures` or `handbook`. The only `figures/` hits in `skills/` are manuscript `figures/` folders, which are unrelated.
13. `figures.py`, `gen_figures` as an import name and the heading "User scripts" (`docs/dev/scripts.md:13`) have no hit outside the step's paths and the ledger.

## 2. The step line

Each part of step 1's line, mapped to the brief:

1. "figures under docs/figures/ moved into the folders of skills/ by the rule of D5": item 1 and Decisions 1.
2. "academic-pipeline's figure and script under docs/figures/academic/researcher/": item 2.
3. "the layout engine of gen_figures.py moved to skills/code/handbook/templates/figures.py": item 3.
4. "imported from there by gen_figures.py (ADR 0060)": item 4 (and item 5 for the second script).
5. "both scripts writing to the new paths": items 4, 5 and 2.
6. "docs/dev/building.md, docs/dev/scripts.md, ADRs 0043 and 0049 and every page that names a figure path following": item 7.
7. The check "for each figure ... a group or a group and a skill folder": case 43.
8. The check "both scripts exit 0 and git status --short docs/figures then prints nothing": cases 37, 38 and 40, and Verify 2. In the worktree before the wip commit, the status shows the moves, and `cmp` stands in for "prints nothing". That is a reasonable proxy.
9. The check "every docs/figures/ path git grep finds in README.md, docs/ and skills/ exists": case 44. The case adds the exclusion `':!docs/roadmap.md'`, which the step line and the plan's Gate do not have (see 4.3).
10. Ruling D30 puts the D5 rule in the head comment of `gen_figures.py` "and into docs/dev/scripts.md". Item 4 does the head comment part. No item puts the rule in `docs/dev/scripts.md`, although this step writes that page. No step of the plan's list carries it either: step 5 names only the head comment.

Every part of the line has a requirement.

## 3. Premises

1. `git ls-files docs/figures | wc -l` printed `30`. That holds. But "27 figures" is wrong: `git ls-files docs/figures | grep -c '\.svg$'` printed `28`. There are 13 flat (`... | grep -v '/paper/\|academic-pipeline/' | wc -l` printed `13`), 14 under `paper/` and 1 under `academic-pipeline/`. 30 = 28 + 2 scripts. README has 27 image lines because `academic-pipeline.svg` is not in it. The table of Decisions 1 covers all 28. The brief's "27 figures" and "the 27" should read 28, since case 40's `cmp` runs "for every figure".
2. `wc -l` printed `2720 docs/figures/gen_figures.py` and `273 .../gen_academic_pipeline.py`. That holds. `grep -n '^import\|^from'` printed lines 89 to 96: `sys`, `collections.abc`, `dataclasses`, `html`, `itertools`, `pathlib`, `statistics`, `typing`. That holds.
3. `grep -n '^class \|^def '` shows each named class and function, `FLOW_WIDTH` at 1253, `figures()` at 2663 and `write_figures` at 2685. That holds. The brief says the layout code starts "from the constants at line 98", but line 98 is `HERE = Path(__file__).resolve().parent` and line 99 is `ROOT = HERE.parent.parent`, which are repository paths. The constants proper start at line 101 (`INK`). Item 3, bullet 3, keeps HERE and ROOT out of the engine, so the premise is only imprecise.
4. In the region 98 to 1253, `SIMPLE_LEGEND` (972) and `PAPER_KIND_LEGEND` (986) sit inside. `STYLES` (166-181) holds the kinds `ap`, `rev`, `pipe` and `dr`, which only `gen_academic_pipeline.py` uses (counts 0 in gen_figures and 8, 4, 7 and 3 in the pipeline script). It also holds `paper`, a box kind whose `describe` name is `"a run of another skill"` (line 1090), and `todo`, `ruled` and `ruled_maybe`, which no script uses (count 0 in both). The brief does not state any of this (see 4.2).
5. `gen_academic_pipeline.py` lines 38 to 41 are `HERE = ...`, `sys.path.insert(0, str(HERE.parent))` and `import gen_figures as gf`. The head comment at lines 3 and 4 says so. That holds.
6. `git grep -n 'docs/figures/' -- README.md | wc -l` printed `27`, on lines 72 to 132. That holds. The brief's own command `git grep -n -o 'docs/figures/[a-z/.-]*'` lacks `_`, so it prints `docs/figures/gen` for ADR 0060 line 7 and for the script paths. The places it lists are right: building.md:41, scripts.md:9-10, 0043:106, 0049:18 and 0060:7.
7. `utils/pin.sh` lines 21 to 28 say "A skill is a folder that holds SKILL.md". That holds.
8. `.gitignore` line 4 is `__pycache__/`. `git check-ignore -v skills/code/handbook/templates/__pycache__/x.pyc` printed `.gitignore:4:__pycache__/`. That holds.
9. The ADR 0060 quotes are its lines 11 and 13, verbatim. That holds. "No other ADR touches the step": see 7.2.
10. Decisions 1, the reason given for `pipeline.svg`: "the commands of roadmap, grill, plan, spec, refute, land and ordo-init; all but ordo-init are in orchestration". This is wrong. `sed -n 2556,2662p docs/figures/gen_figures.py | grep -n 'Lane('` shows the lanes `/ordo-init`, `/roadmap add`, `/grill`, `/plan`, every step, `/roadmap done`, `/plan-retro`, `/session-retro` and `/diagnose`. `ls skills/*/` puts `session-retro` in `ordo` and `diagnose` in `code`. Most lanes are still `orchestration`, so the move stands, but the stated reason is false. D5 also covers "a figure over several skills of one group", and pipeline spans three groups. The "most of its skills" rule is the brief's own extension of D5, which the brief lists as reversible.

## 4. Cases and checks

1. Case 45 contradicts the brief's own rule. The brief says "No script is written for this step, by the builder ... other than a script the step builds under 'What to build'" (brief line 76). Case 45 asks for "a scratch script that imports the engine". One of the two must give way. Against change-standard rule 22 (no breakage testing), case 45 feeds an invalid input to unchanged code, which I judge to be a case, not a fault put into a copy. The words "a scratch copy of a graph" read close to the banned "fault injected into a copy". A safer wording: "a graph built in a scratch script with a label too long for its box".
2. Case 42 conflicts with item 3. Item 3 puts "the constants" in the engine, which includes `STYLES`, and `describe` (line 1076). On the moved code, case 42's grep prints `"paper": Style(...)` (line 180), `"paper": "a run of another skill"` (line 1090) and the comment `# Lanes: the commands of the plan skills ...` (line 1102). `grep -n 'research\|paper\|grill\|plan\|docs/figures'` over lines 98 to 1253 printed exactly those three lines. The brief does not decide three things:
   - whether the box kind `paper` is renamed in the engine; renaming changes no SVG byte, because the kind name reaches the SVG only through the `describe` names map;
   - whether the kinds only Ordo's figures use (`ap`, `rev`, `pipe`, `dr`, `paper`) leave the engine, as item 3 bullet 5 implies;
   - how a script then adds its own kinds to `STYLES`, `draw_node`, `draw_legend` and `describe`.

   The engine's kind names and its function signatures become a public surface that step 3 copies into other repositories. Change-standard rule 4 reserves such a shape ("a public signature ... a vocabulary") from the builder, so the brief should decide it.
3. Case 44 adds `':!docs/roadmap.md'`, which the step line and the plan's Gate do not have. Without the exclusion, `docs/roadmap.md:67` (done entry 25, history) names `docs/figures/paper/lifecycle.svg`, which no longer exists after the move. The plan's step check and the Gate, as written, then fail. Running the check on the unchanged tree printed no missing path and found `docs/figures/` and `docs/figures/paper/lifecycle.svg` in the roadmap. Editing a done entry's gate output would change history. The exclusion needs its reason stated in the brief, and the Gate's wording is the user's call (an open item, not a builder choice).
4. Case 45 says "the error message is as before, naming the figure". Item 4 renames each output, so the figure names passed to `compose`, `_single` and `lanes_figure` may now be the new paths (for example `paper/full.svg` becomes `academic/paper/full.svg`). "As before" then leaves open whether the figure is named by its old or its new path. The case should state the expected message.
5. Case 40 says `cmp <new path> <(git show ee15921:<old path>)`. The worktree's base will be the preparation commit, not ee15921, but the figures are equal at both. That is consistent.
6. Cases that check places the step does not change: case 44 checks ADR 0060 line 7, which the step keeps. Case 42 reads only the new file. The others check paths the step writes.
7. The other cases agree with the rules file and the standards: no test (change-standard, "Scripts compute facts", the test bullet), `mv` not `git mv` ("Where the work happens"), ASCII, and head comments listing inputs, errors and exit status (rule 14).

## 5. The question

The goal step 1 delivers is the figures in the D5 folders, the engine in `skills/code/handbook/templates/figures.py` that both scripts draw through, and every page naming the new paths.

1. Step line check: yes, it could pass without that goal. Both scripts exit 0, a clean status and the path check all pass when `gen_figures.py` keeps its own layout code and `figures.py` is a copy beside it, the two drifting copies ADR 0060 rejects. The plan's answer, "the re-run fails while gen_figures.py does not draw through the engine at its new path", is false: nothing in the check reads where the layout code comes from.
2. Case 37: yes, for the same reason. It shows output paths only.
3. Case 38: yes. It passes with `import gen_figures as gf` kept and the script moved.
4. Case 39: yes, the same.
5. Case 40: no for the moves and the bytes. Yes for the engine part, because a duplicated engine passes.
6. Case 41: yes. It passes trivially when nothing under `skills/` is imported.
7. Case 42: yes. It passes when `figures.py` is a copy and `gen_figures.py` keeps its own engine. It also passes when the engine names a skill outside the pattern, such as `referee`, `submit` or `orchestration`.
8. Case 43: no for the figure folders. It passes with the engine part undone, and with the old script left in `docs/figures/academic-pipeline/`, because the case reads figures only.
9. Case 44: yes for the pages. Bare old names in `docs/dev/building.md:41` and `docs/dev/scripts.md:9-10` (for example `researcher.svg`, which becomes `academic/researcher/manuscript.svg`) are not `docs/figures/` paths, so the check passes with them stale.
10. Case 45: yes. A scratch script importing a copied engine passes while `gen_figures.py` keeps its own.
11. Item 1: no. Cases 43 and 40 fail while a figure is at its old path.
12. Item 2: partly. The new script's output is checked. That the old folder is gone is checked only by reading `git status`.
13. Item 3: yes. Nothing checks that the layout code left `gen_figures.py`, and the head comment is checked by reading only.
14. Item 4: yes. The import is not checked.
15. Item 5: yes, the same.
16. Item 6: no, `cmp`.
17. Item 7: partly. Paths with the prefix are checked; bare names are not.

Checks to add, each a fact a machine computes:
- `grep -n '^class \|^def ' docs/figures/gen_figures.py docs/figures/academic/researcher/gen_academic_pipeline.py` prints none of `FigureError`, `Rect`, `Style`, `Node`, `Edge`, `Graph`, `Canvas`, `FlowLayout`, `Panel`, `Legend`, `Lane`, `Row`, `_wrap`, `draw_node`, `draw_legend`, `compose`, `describe`, `lanes_figure` and `write_figures`.
- `grep -n 'import' <both scripts>` shows the import of `figures` from `skills/code/handbook/templates`.
- `git grep -n -E '(^|[^/a-z-])(researcher|researcher-research|researcher-revision)\.svg|academic-pipeline/' -- README.md docs ':!docs/roadmap.md' ':!docs/adr/0022-*' ':!docs/adr/0025-*'` prints nothing. ADRs 0022 and 0025 name `research-hub/.agents/skills/academic-pipeline/`, an unrelated path.

## 6. Implied inputs

1. The engine run under an older `python3`. The engine is meant for other repositories (ADR 0060, "needs nothing beyond Python"). `/usr/bin/python3 --version` printed `Python 3.9.6` on this machine, while the `python3` on PATH printed `Python 3.13.4`. The engine uses `itertools.pairwise` (line 93) and a module-level `tuple[int, ...] | None` (line 194), and both need 3.10. On 3.9 the import fails. The cost is a broken drawing run in a documented repository. Expected result: the engine's head comment names the minimum Python version it needs (3.10), since item 3's head comment requirement lists what a script using it must know.
2. The old folder `docs/figures/paper/` left empty on disk after the `mv`s. Item 2 removes `academic-pipeline/`, but nothing says `paper/` goes. Expected result: both old folders are removed. An empty folder is invisible to git, but it remains in the worktree and on main's disk.
3. `/ordo-help skills` on a checkout whose `skills/code/handbook/` holds `templates/figures.py` and no `SKILL.md`, between step 1 and step 3. `skills/ordo/ordo-help/SKILL.md` "What it reads" 2 takes every folder of a group as a skill folder, and item 3 reads its `SKILL.md`. Nothing states what happens with none. This has not happened. It can happen only on the live checkout or on a tag pinned between the steps, and step 8 pins after step 6. Expected result: the folder is not listed, as `utils/pin.sh` treats it. The cost is low, so it needs a sentence in the brief's premise, not a case.
4. A script run where the engine file is absent, for example a copy of `docs/figures/` outside the repository. Python raises an uncaught `ImportError`, which exits 1, as the head comment's "1 an error above" says only loosely. This has not happened, and per change-standard ("A script handles a case only when it has happened or ...") no handling is added. Expected result: `ImportError`, exit 1, and the head comment's error list naming it, by rule 14.
5. `gen_academic_pipeline.py` importing `gen_figures.py` for something it needs (item 5, "if anything"). That import would write `docs/figures/__pycache__/`, which is ignored, unless `sys.dont_write_bytecode` is set first. Expected result: no bytecode is written anywhere, as case 41 asks for `skills/`. The brief should say whether `docs/figures/` is held to the same rule.

## 7. ADRs

Command: `for f in docs/adr/0*.md; do grep -n -i 'figure\|diagram\|svg\|gen_figures\|engine' $f; done`, and the opening lines of each hit.

1. ADR 0060 (Status: proposed, in force). The step is under "The layout engine of `gen_figures.py` is kept once, in `handbook`'s `templates/`." and "`gen_figures.py` imports the engine from the skill's folder, so one engine draws Ordo's figures and every documented repository's diagrams." The brief names it. It also falls under the rejected alternative "A copy of the engine kept in handbook beside the one in gen_figures.py: the two copies drift apart.", which no case guards against (5.1).
2. ADR 0058 (Status: proposed, in force). The step is under "`handbook` is its own skill under `skills/code/`." Step 1 creates `skills/code/handbook/` with only `templates/figures.py`. The brief does not name 0058, though its `utils/pin.sh` premise addresses the folder without `SKILL.md`. No contradiction while step 3 adds the skill. Separately, 0058 line 12 says "diagrams as `.dot` with their `.svg`", while 0060 line 12 says "each diagram as a graph in a Python file". That clash between two records is step 3's, not step 1's.
3. ADR 0043 (Status: superseded by 0050 in parts that do not touch line 106; line 106 is in force) and ADR 0049 (proposed). The brief names both. The edit of a path is a refinement, which `docs/adr/README.md` allows: "A refinement that keeps the decision edits the ADR to its current state with no dated note." 0043:106 is in Context and 0049:18 is in Decision.
4. ADR 0042 line 54 ("both figure scripts and the figures they write") is a Consequences line and is not touched.
5. No part of the brief contradicts an ADR.

## 8. Dictated text

`grep -n '"' L/agents/briefs/1.md` and a read of every item. The brief dictates one line, the report's first line, which goes into `agents/reviews/1-report.md`, a path the step writes:

1. `grep -n 'Everything in the brief is done'` gives line 141: `- The first line: anything NOT done, or "Everything in the brief is done".` It holds against change-standard rule 7, which requires that first line, and against the prose standard.

Item 7's README, ADR 0043 and ADR 0049 lines are given by substitution of the table's paths ("with the line otherwise unchanged"), not as words. Read with the new path, 0043:106 (`The figures of docs/figures/academic/paper/ draw paper as built, ...`) and 0049:18 hold. Item 4's "states the folder rule of D5 in one sentence" and item 7's "User scripts" row give requirements without words, so they are not dictated. No other dictated text.

## Declined to judge

1. Which parts of the code after line 1253 belong in the engine: `_graph`, `_single`, `_lanes_label`, `_flow_label` and `_parts` are generic helpers parallel to `describe`. Whether `SIMPLE_LEGEND` (Ordo's legend wording) stays in `gen_figures.py` under item 3, bullet 5, is also open. This is a design reading for the orchestrator. It bears on step 3's engine surface, and the brief leaves it to the builder.
2. Whether the unused kinds `todo`, `ruled` and `ruled_maybe` should be carried into a shipped engine (change-standard rule 11, nothing added on a hypothesis). This is a question for the orchestrator.
3. Whether the Gate's path-existence part should gain the roadmap exclusion (4.3). That is the user's gate.

Agent usage: a2f96bd6829d5adb2, claude-opus-5-5, 214981 tokens, 45 tool uses, 6.4 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1.1: "What to build" 5 names lines 3 and 4, 12 and 19 of the pipeline script's head comment, and says it imports nothing from `gen_figures.py`.
- 1.2: "What to build" 4 replaces "Writes, beside this file:" and the sentence of line 55; "What is on the tree" names both lines.
- 1.3, 1.6 to 1.13: no change; each stays true.
- 1.4: "What to build" 7 has `scripts.md` say each script uses the engine.
- 1.5 and 5.9: "What to build" 7 covers bare names in `building.md` line 41; a new case greps the bare old names in `README.md` and `docs/dev`.
- 2.10: "What to build" 7 has `docs/dev/scripts.md` state the rule of D5 (D30); D30 is named under "What is on the tree".
- 3.1: "What is on the tree" says 28 figures, with the 13, 14 and 1 split; the `cmp` case names 28.
- 3.3 and 3.4: "What is on the tree" puts the layout code from line 101, names `HERE` and `ROOT` at 98 and 99, and lists the kinds of `STYLES` and who uses each.
- 3.6: the command of "What is on the tree" takes `_` in its character class.
- 3.10: Decisions 1 gives the lanes of `pipeline.svg` and their groups, and states the most-of-its-skills rule for a figure over several groups.
- 4.1 and 4.4: the scratch-script case is removed; "What to build" 3 says each moved definition keeps its behaviour and its messages, the code at ee15921 with only the changes of Decisions 4 to 7.
- 4.2 and Declined 1 and 2: Decisions 4 to 7 decide the engine's kinds, `add_kind(name, style, words)`, the public names and which helpers move; the path-free grep case widens to `referee`, `submit`, `orchestration` and `ordo`.
- 4.3 and Declined 3: Decisions 8 states the exclusion and its reason, and the case quotes the run with and without it; the gate's wording is raised to the user as Open item B in the state file.
- 5.1, 5.2 to 5.8, 5.10, 5.13 to 5.15: two new cases, the definitions grep over both scripts and the import grep, so a kept copy of the engine fails; the `__pycache__` case covers `docs/figures` too.
- 5.12 and 6.2: "What to build" 1 removes both old folders, and a case checks them gone.
- 6.1: "What to build" 3 has the head comment name Python 3.10; "What is on the tree" names the two uses that need it.
- 6.3: "What is on the tree" names `ordo-help` line 104, which skips a folder with no `SKILL.md`.
- 6.4: "What to build" 4 and 5 list the engine not found among each script's errors.
- 6.5: "What to build" 4 and 5: `sys.dont_write_bytecode` before the import, no bytecode under `skills/` or `docs/figures/`, and no import of `gen_figures.py`.
- 7.2: "What is on the tree" names ADR 0058 and the sentence the step is under.
- Added after the check, dictated: `add_kind(name, style, words)` (Decisions 5), a code line read whole: holds.
