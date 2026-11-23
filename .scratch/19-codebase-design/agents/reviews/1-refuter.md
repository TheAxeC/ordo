# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-1, base 757fde1)

## Verification (rerun by the reviewer)

```
$ printf '%s\0' docs/figures/gen_figures.py docs/figures/codebase-design.svg docs/dev/building.md skills/code/codebase-design/SKILL.md skills/code/codebase-design/references/vocabulary.md skills/code/codebase-design/references/deepening.md skills/code/codebase-design/references/design-it-twice.md skills/code/codebase-design/references/report.md README.md | xargs -0 perl -CSD -ne '...the brief's check 1...'; echo "exit=$?"
exit=0                                   (no line printed)
$ python3 -c 'import yaml; d=yaml.safe_load(open("skills/code/codebase-design/SKILL.md").read().split("---")[1]); print(d["name"], len(d["description"]))'
codebase-design 1020
$ grep -n 'https\?://' skills/code/codebase-design/references/report.md
(no line; exit 1)
$ grep -n 'xmlns' skills/code/codebase-design/references/report.md
140:- An inline `<svg>` carries no `xmlns` attribute, which HTML does not need.
$ grep -c 'xmlns=' skills/code/codebase-design/references/report.md
0
$ grep -c 'code/codebase-design' README.md
1
$ grep -c 'twenty-two' README.md
2
$ grep -c 'twenty-one' README.md
0
$ grep -c '^| .codebase-design. |' README.md
1
$ grep -c 'diagnose., .wizard. and .codebase-design.' README.md
1
$ grep -n '^## ' skills/code/codebase-design/SKILL.md
12:## Quick start
20:## Use instead
28:## What it reads
58:## Steps
167:## Stops
180:## Anti-patterns
193:## Rules
$ python3 docs/figures/gen_figures.py        (23 "wrote" lines, exit 0; the line of the new figure:)
wrote docs/figures/codebase-design.svg (10013 bytes)
$ python3 docs/figures/gen_figures.py | grep codebase-design
wrote docs/figures/codebase-design.svg (10013 bytes)
$ git status --short docs/figures
 M docs/figures/gen_figures.py
?? docs/figures/codebase-design.svg
$ git status --short
 M README.md
 M docs/dev/building.md
 M docs/figures/gen_figures.py
?? .scratch/19-codebase-design/agents/reviews/1-report.md
?? docs/figures/codebase-design.svg
?? skills/code/codebase-design/
$ grep -rn 'twenty-one\|twenty one' docs/dev skills utils README.md
(no line; exit 1)
$ grep -rn "code-comments., .diagnose. and .wizard\|code/wizard" docs/dev skills utils README.md
docs/dev/change-standard.md:83, docs/dev/scripts.md:18 and :51, docs/dev/building.md:19 (paths of the wizard template and its test), README.md:162 (the install loop)
$ wc -l (the five skill files, the svg)
200 SKILL.md, 37 deepening.md, 44 design-it-twice.md, 164 report.md, 111 vocabulary.md, 49 codebase-design.svg
$ git diff 757fde1 --numstat
7<char>4<char>README.md
1<char>1<char>docs/dev/building.md
45<char>0<char>docs/figures/gen_figures.py
$ git show 757fde1:skills/code/codebase-design
fatal: path 'skills/code/codebase-design' exists on disk, but not in '757fde1'
$ git show 757fde1:<README.md | docs/dev/building.md | docs/figures/gen_figures.py> | grep -c 'codebase-design'
0, 0, 0
$ LC_ALL=C grep -n '[^ -~]' .scratch/19-codebase-design/agents/reviews/1-report.md
(no line)
```

Every output above equals what the builder's report claims for the same command.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1 (`SKILL.md`): holds. Version "1.0.0", no `disable-model-invocation` key, `name` equals the folder, the layout's sections 2 to 9 in order (check 5). Standards findings 3.3 to 3.6 are against its text.
- 2 (`references/vocabulary.md`): holds, read beside the source: all eight terms, both drawings in ASCII, the principles, the testability examples, the relationships, the rejected framings, and "Going deeper" naming both reference pages.
- 3 (`references/deepening.md`): holds, read beside `DEEPENING.md`: same sections and order, two "just" removed.
- 4 (`references/design-it-twice.md`): holds: section 2 starts the agents in the words of decision 1.
- 5 (`references/report.md`): holds: no address (check 3), one `<style>` element, inline SVG and `div` patterns, the card's "Rule" and "Files ... each file with its lines".
- 6 (`README.md`): holds: check 4, the row after `wizard`, the sentence on the skills that launch agents, the image line after the one of `code-comments`. The image line lands one line past the brief's range 73-87, which the builder's report states. Finding 1.3 is a further place the brief's premise missed.
- 7 (`gen_figures.py` and the svg): holds: `codebase_design()` built with `Panel` and `compose`, the stop "The draft", the scan agent, the stop "The candidates", the design agents as a "maybe" node, the end in `/roadmap add` and `/grill`, the head comment names the figure, the svg is the script's output (rerun leaves `git status --short docs/figures` unchanged).
- 8 (`docs/dev/building.md`): holds, the diff adds `codebase-design.svg` to the list.
- "The differences from the two sources are listed in deviations.md; the skill differs from the sources in nothing else. A difference ... beyond that list ... is named in the report": violated, Spec 1.1.
- The standards pages and the search order: holds, `SKILL.md` "What it reads" 2 to 4; `/plan`'s "What it reads" 1 and `repo-setup`'s "What it reads" 3 and "The tree" say what the skill cites them for.
- The call with no mode: holds, "Steps / The call with no mode".
- The mode `standards`: holds, "Steps / standards" 1 to 8, each bullet of the brief found.
- The mode `review`: holds for each bullet of the brief; Spec 1.2 and 1.4 are against text the brief dictated.
- The README row: holds; it names no private repository.
- "What it must do" and "Conventions": hold, except the layout's row 1 (Standards 3.3). No credit and no license text: `grep -rn -i 'pocock\|matt\|license\|credit\|copyright\|cathedra\|axel\|/Users\|github' skills/code/codebase-design` prints only lines with "commit".

Cases of the brief's "Cases":

- `plan.yaml` lists pages in another folder: met, "What it reads" 3 and 4 place 1; "Steps / review" 4, "no default page is used for it".
- No `plan.yaml` and a `docs/dev/design-principles.md`: met, "What it reads" 4 place 2 names the path.
- No `plan.yaml` and no standards page: met, "Steps / standards" 6 and "Steps / review" 4 and 5.
- Design principles as a section of the coding-standards page: met, "What it reads" 4 and "Steps / standards" 4 and 6.
- A default sentence with a placeholder, in `review`: met, "Steps / review" 4.
- A repository without a user interface: met for what the case asks (nothing drafted, no candidate); Spec 1.4 is the adjacent defect in the report's header line.
- `review` with no plan configuration: met, "Steps / review" 8, 9 and 11.
- The `repo-setup` folder missing: met, Steps 1 of each mode and the Stops row.
- `standards` with every default rule present: met, "Steps / standards" 7.
- The report opened with no network: met, check 3.
- The frontmatter: met, check 2 prints `codebase-design 1020`.
- A shipped file names nothing private: met, by the grep above and by reading the README lines added.

The builder's report gives the first run of every case (no skill text on the unchanged tree), which `git show 757fde1:...` reproduces.

## 1. Spec

- 1.1. `skills/code/codebase-design/SKILL.md`, "Steps / review" 10 to 12: "10. For the picked candidate, when the user wants to see other interfaces, follow `references/design-it-twice.md` ... 11. Make the picked candidate a roadmap entry. ... 12. Offer an ADR for a candidate the user rejects". What is wrong: the source's "3. Grilling loop" runs the design-it-twice pattern and the ADR offer inside the grilling, as side effects "inline as decisions crystallize"; the skill runs design-it-twice before `/roadmap add` and `/grill`, and the ADR offer after them. The brief dictates this order, but `deviations.md` does not list it and the builder's ten differences do not name it. Of the ten the builder does list, 1 to 6 are wording under deviations 7, 11 and 13 or required by the brief and CLAUDE.md, and 7 and 10 follow deviation 3. Numbers 8 (the user may pick no candidate) and 9 (the source's list of what the grilling walks: "constraints, dependencies, the shape of the deepened module, what sits behind the seam, what tests survive" is not passed to `/roadmap add` or `/grill`) change what a run does and have no ruling. Failure scenario: the gate asks that "the plan's ledger lists every deviation ... and nothing else differs, checked by reading both"; the user reads `deviations.md` against the source, finds the order of the three parts, the dropped list and the "pick none" path unlisted, and the gate fails at step 2. Verdict: the "differs in nothing else" requirement, violated. The fix is the orchestrator's: `deviations.md` is a ledger file the builder may not edit.
- 1.2. `skills/code/codebase-design/SKILL.md`, "Steps / review" 4: "A subject that is present is read from the repository's pages, and no default page is used for it." with "What it reads" 4: "the coding standards (a common page and one page per language)". What is wrong: the coding standards are one subject, so a repository that has `docs/dev/coding-standards/common.md` and no page for a language it uses has the subject present, and `review` uses no default language page. ADR 0047, in force: "for a kind of page the repository lacks, the `review` mode holds the code to the default page". The brief asked for the subject-level wording ("review uses no default page for a subject those pages hold"). Failure scenario: a Python repository with only a common page: the scan never holds the code to the default `python.md`, no candidate cites it, and the report's header does not name the gap, so the user is not pointed at `/codebase-design standards`. For the orchestrator to rule: whether a language page is a "kind of page" of the ADR.
- 1.3. Brief, "What is on the tree": "No other page under `docs/dev/` names the skills one by one in a way this step makes false." and "`README.md` names every skill in four places". What is wrong: my grep (`grep -rn 'code-comments' README.md docs/dev ...`) finds two more places, neither in the step's paths:
  - `docs/dev/scripts.md`, the row of `docs/figures/gen_figures.py`: "Writes the SVG figures of the README from the labels written in the file: `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `paper-review-panel.svg`, `referee.svg`, `grant.svg`, `code-comments.svg` and, under `docs/figures/paper/`, ...". The script now also writes `codebase-design.svg`, so the row is false.
  - `README.md` (base line 132, now 135): "`writing`, `code-comments`, `paper`, `paper-review-panel`, `referee` and `grant` start every agent on the runner's default agent with the runner's defaults." `codebase-design` does the same (its Rules) and is missing.
  Failure scenario: a reader of the scripts page takes the list as what the script writes and misses the figure; a reader of the README looks up how the agents of `codebase-design` are started, does not find it among the six, and assumes the effort agents and `CLAUDE_CODE_EFFORT_LEVEL` apply to it. Change standard rule 14 makes both a defect of the change; both are outside the brief's paths, so they are a fix at landing or a Doc text.
- 1.4. `skills/code/codebase-design/SKILL.md`, "What it reads" 4: "A subject no page of place 1 or 2 holds is a subject the repository lacks."; "Steps / review" 4: "Done when ... each subject the repository lacks is listed."; "Steps / review" 8: "The report names each subject the repository lacks, and `/codebase-design standards` as the way to fill it."; `references/report.md`, "Header", the same line. What is wrong: "lacks" is not limited to the subjects that apply ("What it reads" 7). Failure scenario: a repository with no user interface and no UI page: the report's header names the UI standard as lacking and sends the user to `/codebase-design standards`, which drafts no UI standard for that repository.
- 1.5. `skills/code/codebase-design/SKILL.md`, "Steps / review" 12: "A repository with no ADR folder gets one first, from the `repo-setup` skill's `templates/docs/adr/README.md` and `templates/docs/adr/template.md`." What is wrong: no path is given for the new folder (the brief gives none either); "What it reads" 8 names `docs/adr/` only "when they exist". Failure scenario: two runs put the folder in two places, or beside a `plan.yaml` whose `adr` key names another folder that does not exist yet. Low.
- 1.6. `skills/code/codebase-design/SKILL.md`, "What it reads" 8: "For `review`, the repository's glossary and its ADRs in the area." against `references/design-it-twice.md`, section 2: "Include both the vocabulary of `references/vocabulary.md` and the vocabulary of the repository's glossary in the prompt". What is wrong: the call with no mode follows `references/design-it-twice.md` (its Steps 3) and no item says where it finds the glossary. Failure scenario: `/codebase-design` with no mode in a repository whose `plan.yaml` names a glossary outside `docs/`: the design agents get no domain terms. Low.

## 2. Proof

- 2.1. Builder's report, the row "The change carried to every place that names the skills of `skills/code/` (rule 14)": `grep -rn "code-comments., .diagnose. and .wizard\|code/wizard" ...`. What is wrong: the claim DONE rests on a grep of two patterns that cannot match a list of figures or a list of skills that is not in that order; my grep of `code-comments` across `README.md` and `docs/dev` finds the two places of Spec 1.3. The decision that rests on it: that no further page needs the change. Rule 14 also asks the report to list each sentence about a changed file as a whole with the line that shows it still holds ("Every figure but the last two shows the order of a run." in the head comment of `gen_figures.py`, "Every skill that launches agents has its figure" in `docs/dev/building.md`); the report lists none. Both sentences still hold by my reading. Failure scenario: the orchestrator lands on the DONE row and `docs/dev/scripts.md` and the README sentence stay false on main.

No check was made to pass by copying or exempting, and no predicate was widened.

## 3. Standards

- 3.1. `docs/dev/scripts.md`, the row of `gen_figures.py`, and `README.md`, the sentence on the skills that start agents on the runner's defaults: sentences the diff makes false or incomplete (`docs/dev/change-standard.md`, rule 14). The quotes and scenarios are in Spec 1.3.
- 3.2. `.scratch/19-codebase-design/deviations.md` against the built skill: the list is the page that says "It differs from them in the points below and in nothing else", and the diff makes that sentence false (Spec 1.1).
- 3.3. `skills/code/codebase-design/SKILL.md`, the paragraph under `# Codebase design`: four sentences ("`/codebase-design` holds ...", "The mode `standards` ...", "The mode `review` ...", "With no mode ..."). Rule: `docs/dev/skill-layout.md`, "Sections, in order", row 1: "in one to three sentences". The builder's departures list names the sentence length and not the count. Failure scenario: a later reviewer holding the skill to the layout reports it; no reader is misled. Low.
- 3.4. `skills/code/codebase-design/SKILL.md`, Stops, the bullet under the table: "The offer of Steps / review 12 waits on the user's yes or no." What is wrong: a point where the skill waits on the user stands outside the table; `docs/dev/skill-layout.md` row 7 gives the table the stops, and the glossary's "stop" is "any point in a skill's Stops table where it waits on the user". The brief names four rows, and the builder states this as judgment call 5. Failure scenario: an agent that runs the skill for a gate and answers its stops from the table (step 2 of this plan) has no row for the ADR offer, and the figure, drawn from the table, does not show it. Low.
- 3.5. `skills/code/codebase-design/SKILL.md`, "Steps / review" 2: "Otherwise the commit history, read a good stretch back, shows the files and areas that keep coming up". Rule: the prose standard, A, vague qualifiers "replaced with the number or the specific claim". It is the source's phrase ("walk back a good stretch"). Failure scenario: one run reads 20 commits and another 2,000, and the scope differs. Low; a number would be a difference from the source.
- 3.6. The reference pages, prose standard applied in part (deviation 13): "just" is removed in six places, while `references/deepening.md`, "Seam discipline" keeps "(typically production + test)", `references/design-it-twice.md` keeps "support many uses", and running prose keeps semicolons above the standard's "at most 2 per 1000 words" (B): `references/deepening.md` 4 in 384 words, `references/vocabulary.md` 5 in 840. The builder's departures list names the kept fragments and contrasts and not these. Failure scenario: a `/writing` run or a later review over the skill's pages reports them; no reader is misled. Low, and the orchestrator's call between the prose standard and "the sources' content and order kept".

Non-ASCII: none (check 1). A comment that carries history: none; the docstring and head-comment lines added say what the figure shows. Private names in shipped files: none. Credit or license text for the sources: none. Glossary terms: the report's readings of runner, session, stop, refusal, plan configuration, `projects:` form, standards, ADR, roadmap entry, goal and step hold; `grep -n -i -w` for brief, case, tiers, reviewer, finding, kind, gate, probe, base, bar, loop, premise, round, verdict, worker, builder, orchestrator, landing, ledger, window, pause, sync and booking over the five files prints no use in a sense of the glossary.

## 4. Behaviour

none. The report states the new skill and each changed line of `README.md`, `docs/dev/building.md` and `gen_figures.py` with before and after, and my diff shows no further host- or user-visible change.

## Declined to judge

- The report's `git diff --numstat` (no base) and `git log --oneline`: not among the three git commands I may run. `git diff 757fde1 --numstat` gives the counts the report states; `git log --oneline` in the worktree would settle the second.
- Whether `xdg-open`, `open`, `start` and `%TEMP%` work as "Steps / review" 8 says: the source's sentences, and running one opens a window; a run of `review` in step 2 settles it.
- Whether the report page's scaffold renders the cards, badges and pictures as the source's Tailwind page does: read only (the class names in the text all have a rule in the `<style>` element, and the SVG example is well formed by reading); opening a file built from it in a browser settles it.
- To which project's `standards` list a new page is added in the `projects:` form: the brief does not say, the skill repeats the brief, and the builder states it as judgment call 8; the user's or the orchestrator's call.
- Whether numbers 8 and 9 of the builder's differences, and the order of Spec 1.1, are approved deviations: the goal reserves each deviation for the user's ruling.
- Whether the skill works in a repository: step 2's part.

Reviewer usage: aec236c414c8142fa, claude-fable-5-2, 207055 tokens, 21 tool uses, 5.8 minutes.
