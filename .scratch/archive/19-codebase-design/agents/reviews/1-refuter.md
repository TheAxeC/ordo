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

## Repair round 1, refuted

```
$ printf '%s\0' docs/figures/gen_figures.py docs/figures/codebase-design.svg docs/dev/building.md docs/dev/scripts.md skills/code/codebase-design/SKILL.md skills/code/codebase-design/references/{vocabulary,deepening,design-it-twice,report}.md README.md | xargs -0 perl -CSD -ne '...brief check 1...'; echo "exit=$?"
exit=0                                   (no line printed)
$ python3 -c 'import yaml; ...name, len(description)'
codebase-design 1020
$ grep -n 'https\?://' skills/code/codebase-design/references/report.md      (no line; grep exit 1)
$ grep -c for README.md: 'code/codebase-design' 1 | 'twenty-two' 2 | 'twenty-one' 0 | '^| .codebase-design. |' 1 | 'diagnose., .wizard. and .codebase-design.' 1
$ grep -n '^## ' skills/code/codebase-design/SKILL.md
12:## Quick start
20:## Use instead
28:## What it reads
60:## Steps
175:## Stops
188:## Anti-patterns
201:## Rules
$ python3 docs/figures/gen_figures.py | grep -c wrote
23
$ python3 docs/figures/gen_figures.py | grep codebase-design
wrote docs/figures/codebase-design.svg (11343 bytes)
$ git status --short docs/figures
 M docs/figures/gen_figures.py
?? docs/figures/codebase-design.svg
$ git status --short
 M README.md
 M docs/dev/building.md
 M docs/dev/scripts.md
 M docs/figures/gen_figures.py
?? .scratch/19-codebase-design/agents/briefs/1-round-1.md
?? .scratch/19-codebase-design/agents/reviews/1-refuter.md
?? .scratch/19-codebase-design/agents/reviews/1-report.md
?? docs/figures/codebase-design.svg
?? skills/code/codebase-design/
```

Commands quoted by "Round 1", rerun:

```
$ git diff 757fde1 --numstat
8<char>5<char>README.md
1<char>1<char>docs/dev/building.md
1<char>1<char>docs/dev/scripts.md
51<char>0<char>docs/figures/gen_figures.py
$ wc -l SKILL.md references/*.md   : 208 SKILL.md, 37 deepening, 44 design-it-twice, 164 report, 111 vocabulary   (equals the report)
$ grep -n ';' over the three prose pages         : only vocabulary.md:74 and :86 (code lines)
$ grep -n ';' over report.md, CSS lines excluded : nothing outside the <style> element
$ grep -n -i 'typically\|many\b\|often\|generally\|significantly' over the four pages : design-it-twice.md:27 "the most common caller" (superlative, not a qualifier); vocabulary.md:43 "Many methods" (inside the drawing); no "typically", no "many uses"
$ grep -rn 'code-comments' README.md docs utils  : the hits the report's table lists (README 28, 36, 76, 88, 135, 162; docs/dev/scripts.md 9, 17, 39; building.md 6 and 40; change-standard.md 70; glossary.md 46; gen_figures.py 9, 2051, 2052, 2318; the svg; roadmap.md 87, 90; ADR 0014 x2; ADR 0047 line 38; utils none). Each is as the table says. (gen_figures.py line 2318 where the report says 2312; line shifted by the ADR-offer node, not a claim a decision rests on.)
$ grep -rn -i '21 skills\|twenty.one' README.md docs skills utils : no hit outside docs/roadmap.md and .scratch
$ LC_ALL=C grep -n '[^ -~]' .scratch/19-codebase-design/agents/reviews/1-report.md : no line
```

The figure script was run by me for check 6; it rewrote `docs/figures/codebase-design.svg` as the script writes it.

### Verdicts

Items of "What to build":

- 1 (`SKILL.md`): holds. Version 1.0.0, no `disable-model-invocation`, sections 2 to 9 in order, the paragraph under the title is three sentences. See Standards S1 for its length.
- 2 (`vocabulary.md`): holds.
- 3 (`deepening.md`): holds.
- 4 (`design-it-twice.md`): holds in structure; see Spec P1 for one changed prompt line.
- 5 (`report.md`): holds. No address, one `<style>`, the header line now limited to subjects that apply.
- 6 (`README.md`): holds (check 4, the row, the sentence on agents with `codebase-design` added at line 135, the image line with the ADR stop).
- 7 (`gen_figures.py` and svg): holds. `codebase_design()` has the stop "The ADR offer" with the edge "you reject a candidate", drawn as `referee()` draws its conditional stop; the svg is the script's output.
- 8 (`docs/dev/building.md`): holds.
- "differs from the sources in nothing else": violated, unchanged from the first report 1.1 (the orchestrator's: the order of the three parts, the option to pick none), and now also the changes of Spec P1 and Standards S2, which `deviations.md` does not list.
- The standards pages and the search order: holds. A language page is its own subject ("What it reads" 4, "Steps / standards" 3, "Steps / review" 4).
- The call with no mode: holds, glossary and ADRs read before design-it-twice ("What it reads" 8, "Steps / The call with no mode" 3).
- The mode `standards`: holds, including the `projects:` rule in item 6.
- The mode `review`: holds, including the goal text in item 11 and the ADR folder path in item 12.
- The README row: holds, names no private repository.
- "What it must do" and "Conventions": hold. Stops now holds the stops "The draft", "The candidates", the user interface question, the refusal, and the ADR offer.

Cases of "Cases":

- `plan.yaml` pages in another folder: met.
- No `plan.yaml`, a `docs/dev/design-principles.md`: met.
- No `plan.yaml`, no standards page: met (`standards` drafts every page that applies; `review` holds the code to the defaults and says so).
- Design principles as a section of the coding-standards page: met.
- A default sentence with a placeholder, in `review`: met ("Steps / review" 4).
- A repository without a user interface: met; the report header and "What it reads" 4 now never name the UI standard as lacking (first report 1.4 closed).
- `review` with no plan configuration: met ("Steps / review" 11).
- The `repo-setup` folder missing: met.
- `standards` with every default rule present: met ("Steps / standards" 7).
- The report opened with no network: met (check 3 prints nothing).
- The frontmatter: met (`codebase-design 1020`).
- A shipped file names nothing private: met; `grep -rn -i 'cathedra\|axel\|/Users\|pocock\|license\|credit' skills/code/codebase-design` over the delta shows none (not rerun beyond the character and address checks; the delta text was read in full).

The ten rulings, each read against the delta:

- 1 (language page): carried out. "What it reads" 4 and 7, "Steps / standards" 3, "Steps / review" 4 and the README row follow it.
- 2 (subjects that apply): carried out in "What it reads" 4, "Steps / review" 4 and 8, `report.md` "Header".
- 3 (two more places, hits): carried out. `docs/dev/scripts.md` line 9 and `README.md` line 135 hold `codebase-design`. Every hit of my own `code-comments` grep is in the report's table with the disposition I would give.
- 4 (ADR folder path): carried out.
- 5 (glossary for the no-mode call): carried out.
- 6 (three sentences): carried out in count; see Standards S1.
- 7 (ADR offer as a stop): carried out in SKILL, figure and README image line.
- 8 (prose standard in the reference pages): semicolons and "typically" closed; the "many uses" fix is Spec P1.
- 9 (goal text): carried out.
- 10 (`projects:`): carried out.

The swap of "Steps / standards" items 2 and 3: judged as correct and needed. Item 3's "each subject that applies" and its per-language rule need the languages and the interface answer known first. The only cite to the moved item ("Steps / standards 3" in item 6) was updated, and I found no other reference to either number.

### Findings

#### Spec

- P1. `skills/code/codebase-design/references/design-it-twice.md:26`: "- Agent 2: "Maximise flexibility: support the uses of every current caller, and extension."" replaces the source's "support many uses and extension". What is wrong: ruling 8 asks for a specific claim in place of "many uses" while "keeping the sources' content", but the new claim narrows the prompt the design agent receives from open-ended flexibility to the current callers; the claim is the builder's invention and `deviations.md` does not list it. Failure scenario: a user who asks for other interfaces gets an agent 2 told to cover only today's callers, so the "maximise flexibility" design that design-it-twice compares against the minimal and the default-call designs is not the one the source describes, and the comparison the user reads is skewed. Verdict: "differs in nothing else", violated (adds to first report 1.1). For the orchestrator: a ruling to keep the source's wording as an exempt quotation, or to approve this one as a listed deviation.

#### Proof

none. Every claim of "Round 1" that I reran matched (counts, greps, check output). The one off-by-six line number (gen_figures.py 2312 against 2318) is not a claim a decision rests on.

#### Standards

- S1. `skills/code/codebase-design/SKILL.md:10`: "The mode `standards` fills ... and leaves behind the additions the user approved, and the mode `review` reads the code against those pages for friction that makes the code hard to understand and to test, and leaves behind an HTML report of candidates outside the repository and a roadmap entry for the candidate the user picks." Rule: prose standard E, sentence length under roughly 20 words, with `docs/dev/skill-layout.md` row 1 (one to three sentences). The paragraph is now three sentences, but the second runs about 70 words, with two modes and four outputs in it. Failure scenario: a later `/writing` run reports it, and a reader cannot tell which output belongs to which mode. Low. Not a ruling's text: ruling 6 fixed the count only.
- S2. `skills/code/codebase-design/references/report.md:150` (the line the delta changes): "**Never substitute:** component, service, unit (for module). API, signature (for interface). Boundary (for seam). Layer, wrapper (for module, when you mean module)." Rule: prose standard E, stop-start fragments, and the same page's `vocabulary.md:7` quoting the same list inline. Splitting at the semicolons left four fragments, one capitalised as if a sentence ("Boundary (for seam)."). A comma-and-"and" form or a bulleted list keeps the content without fragments. Failure scenario: none that misleads a reader; a later prose review reports it. Low. The same applies to the changed "Wins bullets" sentence (line 159), which now reads "interface shrinks, implementation absorbs the wrappers" inside a quoted example and is fine.

#### Behaviour

none beyond Spec P1 (the changed prompt line) and the visible changes the report states: the fifth stop row, the figure with the ADR stop, the README sentence and image line.

### Declined to judge

- Whether the redrawn figure renders without overlapping labels (the label "you reject a candidate" at x=569, y=271 against the arrow to the ADR box and the dashed box): read from the coordinates only, and opening `docs/figures/codebase-design.svg` in a browser settles it.
- Whether `referee()`'s conditional stop is the drawing the user wants for an event that happens in some runs only: the user's call (ruling 7 says "as it shows a stop that happens only in some runs", which the code matches).
- The order of the three parts and the option to pick none (first report 1.1): the orchestrator's, as the round says.
- Whether the skill works in a repository: step 2's part.

Reviewer usage: a0f46fdedb82ed703, claude-sonnet-5-5, 146291 tokens, 20 tool uses, 2.2 minutes.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

First run:

- 1.1 and 3.2, differences from the sources that `deviations.md` does not list: raised to the user as Open item A of the state file.
- 1.2, a language page of the coding standards: closed in round 1, ruling 1.
- 1.3, 2.1 and 3.1, two more places that list the skills or the figures: closed in round 1, ruling 3.
- 1.4, the subjects a repository lacks: closed in round 1, ruling 2.
- 1.5, the folder of a new ADR: closed in round 1, ruling 4.
- 1.6, the glossary for the call with no mode: closed in round 1, ruling 5.
- 3.3, the sentences under the title: closed in round 1, ruling 6.
- 3.4, the ADR offer as a stop: closed in round 1, ruling 7.
- 3.5, "a good stretch back": the source's phrase is kept, since a number would be a further difference from the source; named in Open item A.
- 3.6, the prose standard in the reference pages: closed in round 1, ruling 8.

Run over round 1:

- P1, the prompt line of agent 2 in `references/design-it-twice.md`: fixed at landing, the line reads "support many uses and extension", the source's claim.
- S1, the second sentence under the title of `SKILL.md`: fixed at landing, the paragraph is three sentences with one mode each.
- S2, the "Never substitute" line of `references/report.md`: fixed at landing, written as one sentence.
