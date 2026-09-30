# Step 12a brief check (on main at ff656b6)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/12a.md`. Read in full: the brief; plan.md "## Goal", "## Gate", step 12a's line and "## Rulings"; `docs/dev/change-standard.md`; the standards named in `.agents/plan.yaml` (skill-layout "Writing for an agent", `docs/glossary.md`); `skills/spec/templates/brief-check.md` and `templates/brief.md` "Cases"; the "## Stops" section of all eleven skills; `skills/repo-setup/templates/docs/dev/ui-standard.md` and `coding-standards/python.md`; `docs/dev/building.md`; `README.md` lines 1-60 and its headings; the state file's open items and verify list; research-hub `tools/figures/gen_figures.py` lines 1-64 and 575-684. Nothing was changed. `git status --short` printed `?? .scratch/2-e-grill/agents/briefs/12a.md`, and `git diff --stat` printed ` .scratch/2-e-grill/plan.md | 1 +`, the uncommitted Rulings bullet "Step 12a, the three marks" at plan.md:117.

## 1. Names

- `docs/figures`, `gen_figures`, `pipeline.svg`, `plan-loop.svg`: `git grep -n -I -F "<name>" -- . ':!.scratch'` printed nothing for any of them. There is no hit outside the paths.
- "every run": `git grep -n -I -F "every run" -- . ':!.scratch'` found `docs/dev/skill-layout.md:64`, `skills/plan-retro/SKILL.md:31` and `skills/refute/SKILL.md:173`. Each uses the phrase in its ordinary sense, and the change makes none of them false.
- "only when": the same grep found about 25 hits (for example `docs/dev/change-standard.md:46`, `skills/land/SKILL.md:78`, `skills/ordo-init/SKILL.md:84`). All are ordinary prose, and none is made false.
- "optional": the same grep found `README.md:32` ("/grill <entry>  optional: ..."), `skills/ordo-help/SKILL.md:52`, the key comments in `skills/plan/templates/plan.yaml:14-27`, `README.md:127` and others. `README.md:32` and `ordo-help:52` agree with the mark: `/grill` is optional. The key comments use "optional" for configuration keys, which is a different sense. The README would then carry both senses, but the new sentence introduces the mark, so no hit is made false.
- The README place: `README.md:46` reads "`/ordo-help` prints the full sequence, including what to do when a command stops." (`sed -n 46p`). `README.md:162`, under "Working on Ordo", reads "`docs/dev/building.md` lists the tests and checks to run before a change is committed." It stays true.
- The building.md place: `docs/dev/building.md:3` reads "Ordo has no build step. The green check is every command below passing". `docs/dev/building.md:28` reads "This page is the list of tests and checks; a new script under a skill's `templates/` or under `utils/` adds its test here and to the command block of `docs/dev/change-standard.md`."

Findings:
1. The glossary. `docs/glossary.md:3` says the page "defines each term that the Ordo skills, the pages under `docs/dev/` and the README use in a sense of their own", and "Ordo's own terms" already holds a README-only term ("loop, in the README"). Item 2 has the README introduce the three marks "every run", "only when" and "optional" with their meanings. These are marks of this repository's own, and the README's "optional" mark (a skill the user may skip, its box dashed) differs from the key sense at `README.md:127`. The glossary's "stop" entry (line 96) covers "any point in a skill's Stops table where it waits on the user" but not the split into the three marks. The brief should add `docs/glossary.md` ("Ordo's own terms", outside the plan-terms block, so `sync_rules.py --only glossary` is unaffected) to "Paths this step writes", with one entry per mark, stated in `README.md`. If it does not, it should say why the README sentence alone is enough.
2. `docs/dev/building.md:28` ("This page is the list of tests and checks") and line 3 ("Ordo has no build step") are sentences about the page as a whole. Item 3 adds a line about a generator that is neither a test nor a check. Rule 14 of the change standard says such sentences are reread against the file after the change. The brief should tell the builder to reread lines 3 and 28 and adjust line 28 (for example "the list of tests and checks, and how the committed figures are made"). The builder should report each with the line that shows it holds.

## 2. The step line

The step line, from `grep -n "^- 12a " .scratch/2-e-grill/plan.md` (line 45), mapped part by part:
- "Figures in the form of research-hub's `tools/figures/plan-loop.svg`": item 1, the form paragraph.
- "the pipeline from `/repo-setup` to the closing": item 1, `pipeline.svg`.
- "the plan loop per step": item 1, `plan-loop.svg`.
- "each marking where Axel is in the loop and whether that point is required or optional": item 1, the three marks and the legend.
- "taken from every skill's Stops table": item 1 (the labels are written from the tables) and the case "Reading, each box and each mark against its skill's Stops table".
- "shown in `README.md`": item 2.
- "check: each figure read by Axel against the Stops tables": the brief's first premise says the step lands unticked with his reading pending.
- "(1 commit)": not a build item.
- "(ruling Figures)": the authority.

Findings:
1. "The plan loop per step" is taken from the sequence, and the brief's premise quotes `skills/ordo-help/SKILL.md` "The sequence, printed verbatim". That sequence has a branch the brief's plan-loop boxes leave out: "read the delta  when plan.yaml says refute_after_repair: no: the orchestrator reads the round ...". It stands as the alternative to the second `/refute`. Item 1's list for `plan-loop.svg` is `/spec`, "build it", `/refute`, "close them", `/refute` over the round, `/land`. The brief should either name "read the delta" as the alternative to the second `/refute`, or state that it is left out and why. The same applies to `/roadmap add <entry>` (an entry not yet specified) in the pipeline, which the brief's box `/roadmap add` does not distinguish.
2. Authority. `spec` Steps 1 (SKILL.md:43) says a step's authority is "`(ruling <name>)` for each ruling it rests on". Step 12a's line ends only with `(ruling Figures)`, but item 1 (the generator, its place and no test) rests on ruling "Open item A (2026-09-29)", quoted as: "(a), the figures of step 12a are drawn by a generator script, `docs/figures/gen_figures.py`, which computes only the SVG files from the boxes, arrows and labels written in it; no test (the user)." The step line should gain `(ruling Open item A)`, or the brief should say why Figures alone is its authority.

## 3. Premises

- The step line: the quote matches line 45 exactly.
- The rulings: ruling "Open item A" at plan.md:94 and ruling "Figures" at plan.md:95 (read with `sed -n '/^## Rulings/,...'`) match the brief's quotes.
- research-hub head and line counts: `git log -1 --format=%h` printed `1b108a86`, and `wc -l` printed `684 tools/figures/gen_figures.py` and `108 tools/figures/plan-loop.svg`. Both match.
- Helpers and palette: `grep -n "^def ..."` printed `40:def wrap`, `54:def esc`, `58:def text`, the palette at `19:` and `20:`, and `21:FONT`. Lines 40-62 and 19-21 match.
- `plan_loop_svg`: `584:STEP_BOXES`, `599:def plan_loop_svg`, `666:def main`, so the stated range 584-663 matches. The described form was read and matches: the card with a 3 px accent top rule and a bold 14 px title, 11.5 px lines, solid arrows with markers, a dashed return path, 10 px bold capital captions, `role="img"` with an `aria-label`, `assert body.isascii(), name` at line 677, and `print(f"  wrote ...")` for each file.
- `plan-loop.svg` names `/plan-help`: `grep -n plan-help` found line 30. This matches.
- No `docs/figures/`: `ls docs/figures` printed "No such file or directory". This matches.
- README has no image: `grep -n "<img\|!\[" README.md` printed nothing, with rc=1. This matches. Line 46 matches. The short sequence is the code block at lines 27-44, with line 25 introducing it; this matches.
- The perl command: the brief says `docs/dev/building.md:15`, but `cat -n` shows the perl command at line 13 (line 14 is the closing fence, and line 15 is blank). The claim about what it checks matches building.md:26.
- building.md "names no generator": this matches (read whole).
- The Stops tables, compared row by row with `sed -n '/^## Stops/,/^## Anti-patterns/p' skills/<skill>/SKILL.md`:
  - `repo-setup`: the six stops and one refusal match, and the table's bullets say so.
  - `ordo-init`: all six rows are stops, and the list matches. However, the table carries no sentence saying which rows are stops.
  - `roadmap`: the five stops and six refusals match, and the bullets say so.
  - `grill`: the three stops and four refusals match, and the sentence says so.
  - `plan`: one stop ("The drafted step list", "Every plan") and five refusals. The classification matches, but the table carries no sentence saying so.
  - `spec`: the five stops and nine refusals match, and the sentence says so.
  - `refute`: the one stop and four refusals match.
  - `land`: the stops are "A red line for the user", "A lock held" and "A worktree that cannot be removed", with refusals between them. This matches.
  - `plan-orchestration`: seven stops and one refusal. This matches.
  - `plan-retro`: one stop and two refusals. This matches the list.
  - `ordo-help`: "No stop" plus two refusals. This matches.
- The sequence at `skills/ordo-help/SKILL.md` lines 47-80: line 47 and line 80 are the fences. This matches. The closing is at `skills/plan/SKILL.md:59`, inside Steps 2. This matches.
- ADRs: `ls docs/adr` printed `README.md` and `template.md`. This matches.
- Open items: `sed -n '/^## Open items/,/^## /p'` shows five open items. None concerns Ordo's figures. The open item "The old skill name in other repositories" names research-hub's `tools/figures/gen_figures.py` and `plan-loop.svg`, the form this step copies.

Findings:
1. The perl command is at `docs/dev/building.md:13`, not `:15`. The brief should correct the line number.
2. "each table says in its own words which rows are stops" is false for `ordo-init` and `plan`: neither table carries such a sentence. The classification of their rows stands (`ordo-init` has no refusal row; `plan`'s rows after the first resume by a fix and not by a decision). The brief should say that the classification of those two tables is read from the rows.
3. Misclassified row: `plan-retro`'s "The proposals" has the When "Every retro with a recurring kind, at Steps 10". It waits on the user only when a recurring kind exists, but the brief lists it under "every run" (item 1, first mark: "`/plan-retro`'s proposals"). By the brief's own definition ("a stop that waits on the user each time the skill runs") it is an "only when" stop. The brief should move it, or state the reading that makes it "every run".
4. Stop rows the brief's mark lists do not place:
   - `plan-orchestration`'s six conditional stops ("A shape nobody named", "A wrong premise", "A red check", "A rule clash", "A finding that is the user's", "A model other than the configured one"). Item 1 does not say that the `/plan-orchestration` band carries them as "only when" marks.
   - `land`'s "A lock held" and "A worktree that cannot be removed".
   - `ordo-init`'s "Several roadmaps", "A failing command", "A fix in the check" and "No commit allowed".
   - `repo-setup`'s sync-mode stops ("A hunk to rule on", "The drafted sync change", "A file sync cannot use") and "No commit allowed". `sync` is not a box of the pipeline.
   - `roadmap`'s "No gate", "The level", "The insertion form" and "A missing dependency".
   - `grill`'s "A lookup agent served another model".

   The "such as" lists leave these to the builder. The case "every stop row of every table either marked or named as left out with the reason" catches an omission only after the build. The brief should state, per box, which rows it carries, and in particular that sync-mode and check-mode stops are either marked on the `/repo-setup` and `/ordo-init` boxes or named as left out because those modes are not on the pipeline.
5. `spec`'s refusal "A step without the user's authority" resumes with "The user's ruling". The brief does not say whether refusals get any mark. The plan-loop's "when it stops" cards (research-hub has "a stop" and "a refusal" cards) imply refusals are drawn. The brief should say that refusals carry no mark and appear only on the "when it stops" cards, or say otherwise.

## 4. Cases and checks

- `ls docs/figures/...`: consistent.
- The twice-run determinism case: consistent.
- `LC_ALL=C grep -n '[^ -~]' docs/figures/*`: consistent. On the unchanged tree the glob matches nothing and grep errors; the report notes that.
- `grep -c "plan-help" docs/figures/*.svg`: consistent, but narrow. See section 5.
- The minidom well-formedness case: consistent.
- The rendered PNG case: consistent. `which rsvg-convert qlmanage inkscape magick convert cairosvg` printed `/opt/homebrew/bin/rsvg-convert` and `/usr/bin/qlmanage`, the others not found. The renderers the case names exist.
- The Stops-table reading, the contrast reading and the README reading: consistent with "Scripts compute facts; judgment is read" (judgment by reading, the ratio a computed fact).

Findings:
1. The form contradicts the brief's own contrast requirement. Item 1 says the generator "follows research-hub's form (... the palette ...)", and item 1's colours bullet requires "marks and box edges at least 3:1". The WCAG ratios, computed with the relative-luminance formula in a python3 one-liner, are:
   - LINE `#cbd5e1` / PANEL `#f8fafc`: 1.42
   - LINE / CARD `#ffffff`: 1.48
   - LEFT `#16a34a` / CARD: 3.3 (below 4.5 if used for text)
   - CARD / PANEL: 1.05
   - MUTED / PANEL: 7.24
   - AXIS / CARD: 6.29
   - RIGHT / CARD: 5.02
   - RIGHT / PANEL: 4.8
   - INK / CARD: 17.85

   research-hub draws every card edge in LINE, so a copied palette fails the brief's 3:1 for box edges (ui-standard.md "Contrast", 1.4.11). Since CARD on PANEL is 1.05:1, the edge alone carries the box. The brief should say that the palette is followed except that box edges and marks take a token of at least 3:1 against PANEL and CARD, and that no text is drawn in LEFT.
2. The form contradicts the Python standard the brief names. research-hub's script uses `os.path`, `open()` without `encoding`, unannotated functions, `import yaml` (third party) and `assert` for the ASCII invariant. `coding-standards/python.md` requires the following, and the brief's line 5 says every line follows the standards pages:
   - `pathlib.Path` ("Files and processes", `PTH`)
   - `encoding="utf-8"`
   - annotations ("Typing", `ANN`)
   - "A command-line script catches the exception classes it expects, prints the error to stderr and exits non-zero" ("Errors")

   The brief should say that the form means the drawing (layout, card, arrow, captions, aria-label, ASCII-only output, one line per file), and that the Python follows `python.md`. It should also list `coding-standards/common.md` and `docs/dev/design-principles.md` (under `skills/repo-setup/templates/docs/dev/`) for reading, since `python.md:3` says it adds to them and repeats neither.
3. No case checks the Python standard. ruff is on the machine (`which ruff` printed `/Users/axelfaes/.local/bin/ruff`), pyright is not, and Ordo has no `pyproject.toml` (`ls pyproject.toml ruff.toml` failed). The brief should add a case: `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 docs/figures/gen_figures.py` prints "All checks passed!". This is a fact check of the selection `python.md` "Language and tooling" names, not a test, so ruling A is not touched. If the brief leaves it out, it should say that the standard is checked by reading only.
4. Rule 16 ("A write verifies its own result"): the generator writes files, but neither the brief nor the cases require it to reread what it wrote and refuse on a mismatch. The brief should require each file to be read back and compared with the body, with a mismatch as an error printed to stderr and exit 1.
5. Rule 14 (a script's docstring "lists every input it reads, every error it prints and every exit status it returns"): item 1's docstring list (what it writes, where, how to run, ASCII) lacks the errors and exit statuses. The brief should add them.

## 5. The question

The plan's Goal (plan.md "## Goal") names the `grill` skill, the default standards and the `plan.yaml` settings. It does not name the figures, so step 12a delivers no part of the Goal as written. The goal the step serves is its own line under ruling "Figures", and that is what the question below is asked against. plan.md:26 answers for the step: "No, Axel reads each figure against the skills' Stops tables."

- The step line's check (Axel's reading against the Stops tables): no, it cannot pass without the goal. A person compares each mark with the tables.
- The `ls` case: yes, it could pass. Empty or wrong files exist.
- The twice-run case: yes. A deterministic wrong figure passes.
- The ASCII case: yes, for the same reason.
- `grep -c plan-help` over the SVGs: yes. It also misses `gen_figures.py` and the spaced form. The step 10 check `git grep --untracked -n -i -E "plan-help|plan help" -- . ':!.scratch'` currently prints nothing (rc=1) and covers both. The brief should use it instead.
- minidom: yes. Well-formed XML says nothing about content.
- The rendered PNG reading: no for layout, since a person reads it. The render is one renderer's font metrics, however: a label that fits under rsvg-convert may overflow in the browser that shows the README on GitHub. See section 6, item 1.
- The Stops reading per box: no. It is the case that carries the goal. It could still pass with a misclassification the brief itself dictates (section 3, finding 3).
- The contrast reading: no for the pairs listed. It could pass without covering a pair, unless the brief names the pairs (text on CARD, text on PANEL, captions on PANEL, marks on CARD, edges on CARD and PANEL).
- The README reading: no.
- Item 1's "No text overlaps ...; every label fits its box": its only check is the rendered reading, so the same answer as that case applies.

Findings:
1. The `plan-help` case should be replaced by the step 10 grep above, which covers the script and "Plan help".
2. The contrast case should list the pairs to compute, so that a missing pair is visible.

## 7. ADRs

- `ls docs/adr` printed `README.md` and `template.md`. There is no `NNNN-*.md` record, so no ADR touches the step, and the brief says so.

Findings: none.

## Decisions and rulings

- Decision 1 (two figures in `docs/figures/`) follows the step line and ruling "Open item A".
- Decision 2 (the three marks) is a user-visible vocabulary, so it is reserved for Axel. It is booked at plan.md:117 as "Step 12a, the three marks (2026-09-30, decided by the orchestrator overnight under "Overnight work" 5)" with its options and the lazy option. This is allowed by ruling "Overnight work (2026-09-30)" point 5: "a decision that is normally Axel's inside a step is taken by the orchestrator as the option it recommends and booked here, marked "decided by the orchestrator overnight", with its options and the lazy option, for Axel to overturn". The booking is uncommitted (`git diff --stat` shows plan.md +1) and must go into the preparation commit.
- Decision 2 refines, and does not contradict, ruling "Figures": "figures in the form of research-hub's `tools/figures/plan-loop.svg`, marking where Axel is in the loop and whether that point is required or optional (the user)". The booking names option (b) as that ruling's literal reading.
- Decisions 3 and 4 follow the form and ruling "Open item A".
- No requirement contradicts "Open item A". The brief adds no test and has the script compute only the SVGs from what is written in it. The checks proposed in section 6 (a count of wrapped lines against a box's capacity, the read-back comparison) are computations over the script's own labels and output, inside "computes only the SVG files".
- No requirement contradicts "Overnight work" point 2: "a step whose check is Axel's reading (6, 12, 12a) is built, refuted and landed with that reading pending; each is an open item until Axel approves it, is not ticked before". The brief states this.
- The brief also respects the part of point 5 that says "anything touching another repository ... still stops": research-hub is read only in the brief.

Findings: none, beyond committing plan.md:117 with the brief.

## Declined to judge

- Whether three marks, rather than ruling Figures' two, is the right reading. That is Axel's to overturn, and it is booked.
- Whether the three marks belong in the glossary or only in the README (section 1, finding 1). The finding states the page's own rule. Whether the README sentence is enough is the orchestrator's call.
- How the figures render on GitHub or in the skills CLI. Neither was rendered here.

Agent usage: claude-opus-5-5 (served model, read from the agent's transcript right after the start); 132593 tokens, 26 tool uses, 287 s (completion notice); $1.01-3.49 at Opus rates.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Names 1: item 4 added, one glossary entry "mark, of a figure" in "Ordo's own terms", and `docs/glossary.md` added to the paths.
- Names 2: item 3 has lines 3 and 28 of `docs/dev/building.md` reread, line 28 extended, both quoted in the report.
- The step line 1: the second `/refute` box names its alternative "read the delta"; the `/roadmap add` box names both forms; the premise of the sequence says so.
- The step line 2: step 12a's line in plan.md gains `(ruling A)`, the name the `spec` skill reads from "- Open item A (2026-09-29): ..." (the ADR-test line "- A: ..." is named by its text before its first " (", so the tag resolves to the open item only); the brief's first premise says so.
- Premises 1: the line number corrected to `docs/dev/building.md:13`.
- Premises 2: the premise now says the tables of `ordo-init` and `plan` carry no sentence and their rows are classed by what resumes each.
- Premises 3: `/plan-retro`'s "The proposals" is an "only when" row, in the premise and in item 1's list.
- Premises 4: item 1 lists, per box, every stop row it carries as "every run" or "only when", `repo-setup`'s `sync` stops named as left out with a caption, and the `/plan-orchestration` band carrying its six conditional stops.
- Premises 5: item 1 says refusals carry no mark and appear only on the "when it stops" cards.
- Cases and checks 1: item 1's "Colours" names research-hub's `LINE` at 1.42:1 and 1.48:1 and says box edges and marks take a colour of at least 3:1 against panel and card, and no text in `LEFT`.
- Cases and checks 2: item 1 says the form is the drawing only and the Python follows `python.md`, `common.md` and `design-principles.md` (`pathlib`, `encoding="utf-8"`, annotations, errors to stderr with exit 1, no `assert`); the reading list at the head names all three pages.
- Cases and checks 3: the `ruff check` case with `python.md`'s selection added.
- Cases and checks 4: item 1 requires each written file to be read back and compared, a mismatch an error with exit 1.
- Cases and checks 5: item 1's docstring lists every error and exit status.
- The question 1: the `plan-help` case replaced by the step 10 grep over the whole tree.
- The question 2: the contrast case lists the pairs to compute.
- Implied inputs (the report references a section 6 it does not hold; the session listed them): a run from another directory (paths from the script's location), a label longer than its box (an error naming the box, exit 1, nothing written, with a case that runs this on a scratch copy), a non-ASCII body (an error, exit 1), a failed read-back (an error, exit 1); the output folder is the script's own, so it cannot be missing.
- Decisions and rulings: the booking "Step 12a, the three marks" goes into the preparation commit with the brief.
