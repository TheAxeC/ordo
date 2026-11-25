# Report: step 8, the mode `revision` of `researcher`

Everything in the brief is done. Two things are handed back below, under "Anything in the brief that was wrong or impossible": one sentence of ADR 0055 (and the same words in ruling D37) is false for what was built, and some of the brief's line numbers are off by one or point at the wrong line.

## Open items of the state file, verbatim

From `.scratch/13-researcher/orchestrator-state.md` in the main checkout, "Open items":

```
- none.
```

## The cases' first run, on the unchanged tree (base 0658dc7)

Every command ran from the worktree's root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

| Case | Command or reading | Output as printed on the unchanged tree |
|---|---|---|
| The front matter | `python3 -c 'import yaml; d=yaml.safe_load(...); print(d["name"], len(d["description"]), d["metadata"])'` | `researcher 1020 {'version': '1.0.0'}` |
| The Quick start block | `awk` over the block, `wc -l` | `11`, and no line of `revision` |
| Three comments: an ablation, a new baseline, a clearer sentence | Read: Quick start, Steps 1 and "manuscript" items 7 and 9 | No mode `revision` (`grep -n 'researcher revision'` printed nothing, exit 1). The nearest line, `/researcher manuscript <main.tex> <comments file>`, parses the comments, coaches and runs `/paper revision`, which changes text only; the ablation and the new baseline end as items not addressed. No campaign, no Consolidate, no stop "The split of the comments" |
| The ablation does not beat the baseline, setting manual | Read | No such run exists, so no diagnosis and no stop "A comment the results do not answer yet" |
| The clearer-sentence comment moved to results work | Read | No split stop exists |
| A new session mid-revision | Read | No revision state exists; Steps 2 offers only a run of the same mode and manuscript's folder |
| `--manuscript second` | Read | No mode `revision` takes `--manuscript` |
| A project folder `research` never ran on | Read | No refusal of `revision` exists |
| A comments file that does not exist | Read "What it reads" 1 | "No comments file" exists for `manuscript` only |
| A second round of comments after a finished run | Read | No rule for it |
| `grep -n -i 'negative result\|null result' SKILL.md` | grep | `630:- No text of `research` or `full`, and nothing either sends to `manuscript`, frames a result that does not beat the baseline as a finding to publish, and no negative or null result is written up.` and `636:- No correction and no record asks that a recorded null result be written into the manuscript.`: both forbid writing one up |
| The six landed modes followed through the Steps | Read Steps 1 to 6 and each subsection | Each runs as its subsection gives it |
| The goal's sentence on `revision` and D36 to D42 | Read | No item carries any of them |
| `gen_figures.py` and `gen_academic_pipeline.py` | run, then `git status --short docs/figures` | gen_figures exit 0, last lines `wrote docs/figures/paper/lifecycle.svg (21064 bytes)`, `wrote docs/figures/paper/run-folder.svg (21112 bytes)`; gen_academic_pipeline printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, exit 0; `git status --short docs/figures` printed nothing; `ls docs/figures/researcher-revision.svg` printed `No such file or directory` |
| A results comment whose diagnosis blames the dataset | Read "research" item 15 | In `research` it reopens Frame's choice of the dataset; no `revision` rule exists |
| A referee comment whose first line opens with `#` | Read Rules | The bullet on the user's words covers novelty pages, progress files, briefs and the README, and names no referee comment and no `revision-comments.md` |
| "the referees asked for more experiments", no mode word | Read Steps 1, `grep -n -i 'referees asked\|more experiments'` | grep printed nothing (exit 1); the call falls to `references/mode_advisor.md`, which sends "I got reviewer comments" to `manuscript` |
| `sync_rules.py . --only glossary` | run | `ok: the plan-terms block equals the template`, exit 0 |

No case of the brief was found wrong before the change.

## The cases after the change

| Case | Command or reading | Output, or the place that carries it |
|---|---|---|
| The front matter | the same command | `researcher 1022 {'version': '1.0.0'}` |
| The Quick start block | the same `awk`, `wc -l` | `12`; line 24 is `/researcher revision <project folder> <comments file> [--manuscript <name>]  answer referee comments on a paper of the project: new results by campaigns of research, then the revision, its response letter and the checks` |
| Three comments | Read | Steps 1 to 5, then "revision": item 2 invokes `/paper revision-coach`, reads the commitments and raises "The split of the comments" (the ablation and the new baseline carry `add_experiment`, the sentence `add_clarification`); item 3 runs a campaign for the ablation and, for the new baseline, Build first (its first bullet) and then its campaign, Compare for each; item 5 runs Consolidate once; item 6 runs Stage 2.5 and the coaching; item 7 writes `revision-comments.md` with the result lines of the two; item 8 runs `/paper revision` and answers Existing Materials with the result files, `code/` and `experiment-record.yaml`; items 9 and 10 run the completeness check and Stage 4.5 |
| The ablation does not beat the baseline, manual | Read | Item 3, fifth bullet: "research" item 14 diagnoses and proposes, item 15 raises "A result that does not beat the baseline"; item 4, third bullet: the user stops trying methods and the stop "A comment the results do not answer yet" follows; item 4, fifth bullet, item 7, third bullet, and the Rules bullet at line 701 keep the result out of `revision-comments.md`, the letter and the manuscript |
| The clearer sentence moved to results work | Read | Item 2, sixth bullet: "a text comment moved to results work gets its campaign at item 3" |
| A new session mid-revision | Read | Steps 2 with "What it reads" 15 finds the run by its `mode` and `manuscript_folder`; "revision" item 1, second bullet, goes on at the item `current_stage` names and, within `campaigns`, at the campaign "research" item 2 reads from the README's `## The stage and campaign that stand`, which item 3, second bullet, makes name each campaign with its comment |
| `--manuscript second` | Read | "What it reads" 3, second new bullet: the manuscript is `manuscript-second/main.tex`; Steps 3 writes `manuscript_folder: manuscript-second/`, and Steps 2 offers only a run of that folder |
| A project `research` never ran on | Read | "What it reads" 3, first new bullet, and the Stops row "No project of research", which names `/researcher research adopt <project folder>` and `/researcher research <project folder>` |
| A comments file that does not exist | Read | "What it reads" 1 and the row "No comments file", which now also covers a call of `revision` that gives none |
| A second round of comments | Read | "revision" item 1, third bullet, and the Rules bullet "The revision loop of `revision` holds Stage 4 alone" |
| `grep -n -i 'negative result\|null result' SKILL.md` | grep | `701:- No text of `research`, `full` or `revision`, and nothing any of them sends to `manuscript` or to `/paper revision`, `revision-comments.md` and the response letter included, frames a result that does not beat the baseline as a finding to publish, and no negative or null result is written up: such a result is recorded as a dead end, guidance for the next method, as the bullet above says.` and `707:- No correction and no record asks that a recorded null result be written into the manuscript.`: both forbid writing one up |
| The six landed modes | Read the diff | Every changed line outside "revision" adds `revision` to a list of modes, adds a bullet that opens "For `revision`", or scopes a rule to its mode ("The revision loop of `manuscript`"); the run of `novelty`, `idea`, `research`, `research adopt`, `full`, `integrity` and `manuscript` is unchanged. Steps 3 writes `mode` for `revision` only, and "What it reads" 15 falls back to the folder's name for a `state.json` with no `mode`, which is every run of the other modes |
| The goal's sentence and D36 to D42 | Read | The list of item 11 below; none is "none" |
| The two figure scripts | run, then `git status --short docs/figures` | gen_figures exit 0, gen_academic_pipeline printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)` and exit 0; `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and `?? docs/figures/researcher-revision.svg` |
| A diagnosis that blames the dataset | Read | "revision" item 4, first bullet; the Stops row shows the cause; Frame is not run (subsection head) |
| A referee comment whose first line opens with `#` | Read | Rules: "A referee comment reaches `revision-comments.md` and the README as supplied text, each of its lines a quoted line, `> `, so that a line of it that opens with `#` opens no section."; item 2, seventh bullet, and item 7, first bullet, write it as quoted lines |
| "the referees asked for more experiments" | grep | `97:   - A call with no mode word that asks for new experiments, new analyses, another dataset or another baseline that referees asked for, such as "the referees asked for more experiments", is the stop "The entry point" with the line of `revision`.`, before the fallback bullet to `references/mode_advisor.md`; the description's triggers hold the same phrase |
| `sync_rules.py . --only glossary` | run | `ok: the plan-terms block equals the template` |

## DONE / NOT DONE

| Item | State | Check and output as printed |
|---|---|---|
| 1. The call and every place that names the modes | DONE | Read; `grep -n 'researcher revision'` prints lines 10, 24, 89, 534, 648, 649 |
| 2. `### revision` after `### manuscript` | DONE | `grep -n '^### '` prints `436:### manuscript` and `527:### revision`, before `585:## Stops` |
| 3. Stops, Rules, Anti-patterns | DONE | Stops rows `awk ... | grep -c '^| '` printed `60` (56 before: two stops and two refusals added); the intro reads "the thirteen refusals at the end", and the last thirteen rows are the refusals, from "No manuscript" to "No paper to revise" |
| 4. The description | DONE | `python3 -c 'import glob,yaml; ...' | grep researcher` printed `1022 skills/academic/researcher/SKILL.md` |
| 5. `references/` | DONE | `git diff --numstat`: `1 1 .../research_stages.md`, `2 2 .../project_layout.md` (tabs written as spaces) |
| 6. The glossary | DONE | `sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0 |
| 7. The figure | DONE | `python3 docs/figures/gen_figures.py` exit 0; `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, exit 0; the figure was rendered with `rsvg-convert` and read |
| 8. `README.md` | DONE | `grep -n 'researcher-revision' README.md` printed line 92; the row of `researcher` and the agents sentence name `revision` |
| 9. ADR 0055 unchanged | DONE | `git status --short` lists no file under `docs/adr/`; one false sentence handed back below |
| 10. Version 1.0.0 | DONE | `{'version': '1.0.0'}` |
| 11. The list | DONE | Below |
| Verify 1, the character-set check over the changed files | DONE | printed nothing, `charset exit 0` |
| Verify 2, the two scripts and `git status --short` | DONE | both exit 0; `git status --short` printed ` M README.md`, ` M docs/dev/building.md`, ` M docs/dev/scripts.md`, ` M docs/figures/gen_figures.py`, ` M docs/glossary.md`, ` M skills/academic/researcher/SKILL.md`, ` M skills/academic/researcher/references/project_layout.md`, ` M skills/academic/researcher/references/research_stages.md`, `?? docs/figures/researcher-revision.svg`, and `?? .scratch/13-researcher/agents/reviews/8-report.md` once this report is written: every one a path of "Paths this step writes" |
| Verify 3, the description count | DONE | `1022 skills/academic/researcher/SKILL.md` |
| Verify 4, the glossary sync | DONE | `ok: the plan-terms block equals the template` |
| Verify 5, the greps of "Cases" | DONE | as in "The cases after the change" |
| Verify 6, list items and sentence length | DONE | below, under the judgment calls |

## The terms

Terms of `docs/glossary.md` the diff adds, changes or uses in a new place:

- **results comment, of `revision`** (new): a referee comment run as a campaign, from the commitment types `add_experiment` or `add_analysis`, or moved by the user. Used in "revision" items 2 to 5 and 7, the two new Stops rows, Steps 5 and the README row in that sense.
- **text comment, of `revision`** (new): every other comment, answered by `/paper revision` with no new result. Used in "revision" item 2 and the stop "The split of the comments".
- **split, of the comments** (new): the sorting of the comments into the two kinds, shown at the stop. Used in the subsection head, item 2, Steps 1 and Steps 5.
- **campaign** (widened to `revision`, with "each campaign answers one results comment, which its section names"): used in "revision" items 1, 3, 4, 5, `references/research_stages.md`, "Experiments", and `references/project_layout.md`, "The README" item 5.
- **stage, of `research`** (widened: `revision` runs Experiments, Compare and Consolidate, Build only for a new dataset or a new baseline, never Frame): "the project's Experiments stage" in item 3 and the README row.
- **setting, of `research`** (widened: the project's setting holds for each campaign, and the count of methods reached is the stop "A comment the results do not answer yet"): items 3 and 4.
- **dead end** (widened to a campaign of `revision`): item 7 and Rules line 701.
- **brief, builder, finding, reviewer, of `research`** (widened: the bare word in the `research` and `revision` modes): "builder" and "reviewer" in Steps 5, the Rules bullets on agents and the README; "brief" and "finding" reach `revision` through "research" items 6 to 8, which item 3 runs, and the figure's labels.

Each use was read against its entry; none uses a term in a sense its entry lacks. "case, of `research`" is not widened, since the brief limits the glossary change to the terms it lists and `### revision` does not use the word.

## The files, with line counts

`wc -l` after the change, and `git diff --numstat` (added, removed):

| File | Lines | Added | Removed |
|---|---|---|---|
| `skills/academic/researcher/SKILL.md` | 724 | 108 | 35 |
| `skills/academic/researcher/references/research_stages.md` | 55 | 1 | 1 |
| `skills/academic/researcher/references/project_layout.md` | 70 | 2 | 2 |
| `docs/glossary.md` | 190 | 11 | 8 |
| `docs/figures/gen_figures.py` | 2704 | 101 | 3 |
| `docs/figures/researcher-revision.svg` (new) | 230 | 230 | 0 |
| `README.md` | 270 | 4 | 2 |
| `docs/dev/building.md` | 43 | 1 | 1 |
| `docs/dev/scripts.md` | 53 | 1 | 1 |
| `.scratch/13-researcher/agents/reviews/8-report.md` (this report) | | | |

## The list of item 11

| Requirement | The item that carries it |
|---|---|
| The goal's sentence on `revision`: a paper of the project and its referee comments | Quick start line 24; "What it reads" 3, the two new bullets |
| each comment that asks for new experiments, a new analysis, another dataset or another baseline run as a campaign of the project's `research` stages | "revision" item 2 (the split by `add_experiment` and `add_analysis`), item 3 (one campaign each, Build first for a new dataset or baseline) |
| then `paper`'s revision with the new results, the response letter, the integrity check and the re-review, as `manuscript` runs them | "revision" items 6 to 10 |
| no result that does not beat the baseline written up as a finding | "revision" items 3, 4 and 7; Rules line 701 |
| D36, the command line | Quick start line 24; "What it reads" 1 and 3; Steps 1, the bullet on `/researcher revision` |
| D37, the split by the coach's commitment types, shown once at a stop, corrected by the user | "revision" item 2; the Stops row "The split of the comments"; the Anti-patterns row on sorting by the session's own reading |
| D38, each results comment one campaign of Experiments with builder, reviewer, jobs, Compare under the setting, one Consolidate, Build only for a new dataset or baseline, no Frame | "revision" item 3, item 5 and the subsection head |
| D39, a result that does not beat the baseline goes to Compare; only a result that beats it reaches `/paper revision`; the stop; no letter or manuscript text presents it | "revision" items 3 and 4; the Stops row "A comment the results do not answer yet"; item 7; Rules line 701 |
| D40, `revision-comments.md` with the result lines and files; `/paper revision` with Existing Materials | "revision" items 7 and 8 |
| D41, the stages that follow, as for comments in hand | "revision" items 6, 8, 9 and 10 |
| D42, one run per comments file, `research`'s counts per campaign, a second round a new run | "revision" item 1 (third bullet) and item 3 (third bullet); Steps 5, the caps of `revision`; Rules, "The revision loop of `revision`" |

## Judgment calls the brief left open

- **Two refusals, not one.** The brief allows "a refusal of its own that names the mode to run first" for a project with no README of `research` and for a manuscript's folder with no manuscript. They name different modes (`research adopt` or `research`, against `manuscript`), so they are two rows, "No project of research" and "No paper to revise", and the refusal count went from eleven to thirteen.
- **"A README written by `research` or `research adopt`"** is read as a README whose `## The stage and campaign that stand` names a stage of `research`, the test "research" item 1 already uses for a project `research` started, which `research adopt` item 3 also writes.
- **The mode in `state.json`.** Steps 3 writes `mode: revision` for `revision` only, and "What it reads" 15 takes a run's mode from `mode`, or from the `<mode>` of its folder's name when `state.json` names none, so the state files of the other modes are as before.
- **`current_stage` values** for the parts before Stage 2.5 are `split`, `campaigns` and `consolidate` ("revision" item 1), beside the stage names `2.5`, `4`, `3'` and `4.5` that `agents/state_tracker_agent.md` uses.
- **The manual setting's way to the new stop.** Item 15's stops stand as they are. Under the manual setting no count of methods exists, so the user's word at "A result that does not beat the baseline" may also stop trying methods for the comment, which raises "A comment the results do not answer yet" (item 4, third bullet). That row's "What resumes it" cell gained one clause naming this for `revision`.
- **The count of methods under the automatic setting** reached in `revision` raises "A comment the results do not answer yet" in place of "The count of methods reached" (item 4, second bullet), as D39 and the brief's item 2 say.
- **Result files in `revision-comments.md`.** The Rules bullet at line 705 says the corrections sent to `/paper revision`, and every text of a record that reaches the manuscript, hold no file names or paths. D40 asks for the result files in `revision-comments.md`. So item 7 writes each result as the scientific claim it supports, and puts the files in a last section `## Result files for the results check`, marked as sources of the results check and no text of the manuscript or the letter. The `negative_results[]` of the record are named in that same section as dead ends no sentence presents.
- **Consolidate skipped** when the campaigns submitted no job (item 5, first bullet), as when every results comment was moved to text work. Otherwise Consolidate runs once.
- **The passport.** After Consolidate writes the record again, item 5 copies its two fields into `material-passport.yaml` again, as Steps 4 does, so that the integrity checks read the new experiments.
- **"What it reads" 7 and 10 to 14** are unchanged. Item 7 is for `manuscript` and `full` only, and `revision` invokes no `paper-review-panel`. Items 10 to 14 name no mode, and their text holds for `revision` as written. Item 9 names `revision`.
- **Rules beyond the brief's line list.** Two more Rules bullets name `revision` because the new mode made them incomplete: the list of runs invoked through the Skill tool gained `/paper revision-coach`, and the revision-loop cap was scoped to `manuscript`, with a bullet for `revision` beside it. The Anti-patterns row on skipping an integrity check names `revision` too.
- **The description.** Adding `revision` and two trigger phrases needed 200 characters. They were found by shorter wording of the mode clauses: "builder and reviewer agents" and "a draft's" were dropped, and the run-folder clause became "The last three keep a run folder". Every mode, every trigger phrase and what each mode leaves stayed. The new triggers are "the referees asked for more experiments" and "revise with new results"; the brief's longer example, "revise my paper with new experiments for the referees", did not fit in 1024 characters with every other phrase kept.
- **The figure** has its own legend line for each kind of box it draws: solid agent, orange stop, dotted arrow, dotted loop, grey jobs, rounded judgment, and the teal run of `paper`. One edge label from Compare to Consolidate was shortened to "a result beats the baseline", because the script's placement check found no free place for the longer label.
- **List items and sentence length (verify 6).** Most new bullets in `SKILL.md` run past 20 words. They follow the one-rule-per-bullet form of `docs/dev/skill-layout.md`, and the mechanism needs the length: a bullet keeps its condition, the item it names and its exception in one sentence, as that page asks. The subsection's head paragraph is two sentences, and the first lists the nine parts of the order once, as the brief's first bullet asks. The added sentence of the title paragraph makes the paragraph longer than the one to three sentences the layout gives, which the paragraph already was before the step. In the README row, each new sentence covers one part of the mode.

## Host- or user-visible changes

| Surface | Before | After |
|---|---|---|
| `/researcher revision <project folder> <comments file> [--manuscript <name>]` | Matched no line, so the stop "The entry point" via `references/mode_advisor.md` | Runs the mode `revision` |
| A plain request such as "the referees asked for more experiments" | Sent by `mode_advisor.md` to `manuscript` | The stop "The entry point" with the line of `revision` |
| New stops | none | "The split of the comments", "A comment the results do not answer yet" |
| New refusals | eleven | thirteen: "No project of research" and "No paper to revise" added |
| The description | 1020 characters, six modes | 1022 characters, seven modes, two more triggers |
| Use instead | "A revision for comments in hand, with no integrity check" | "A revision for comments in hand, with no new results to make and no integrity check" |
| `docs/figures/researcher-revision.svg` | absent | the figure of the mode, shown in `README.md` after the research figure, with its alt text |
| `README.md`, the `researcher` row | six modes | the `revision` mode described |
| Stops row "A result that does not beat the baseline", What resumes it | "The user takes the proposal, names another method, or changes the setting, and the work goes to the stage the proposal names" | the same, then "; in `revision` the user can also stop trying methods for the comment, the stop "A comment the results do not answer yet" ("revision" item 4)" |

## Anything in the brief that was wrong or impossible

- **ADR 0055, Decision, second bullet**, quoted as it stands: "`/paper revision-coach` parses the comments into the Revision Roadmap. Its commitment types `add_experiment` and `add_analysis` mark the comments that need results work". This is false for what was built. The Revision Roadmap holds no commitment type. The types are in the coach's Step 3.5 output, `commitment_extracted` (the `paper` skill's `agents/revision_coach_agent.md`, "Step 3.5: Commitment Extraction Pass", and "Step 6: Revision Roadmap Generation", whose tables carry Type as Major, Minor or Editorial only). The brief says the same in "What is on the tree". Ruling D37 in `.scratch/13-researcher/plan.md` has the same words ("parses the comments into the Revision Roadmap, whose commitment types"). "revision" item 2 reads the types from the parsed comments in the coach's run folder. The ADR and the ruling were not changed.
- **Line numbers of the brief, checked on the base with `git show 0658dc7:<file>`:**
  - The Stops rows "A skill not installed" and "lookup.py not found" are at lines 572 and 573, not 573 and 574.
  - The Rules bullet on the user's words is at line 650. Line 651 is the bullet on the user's language, which needed no change.
  - In `references/project_layout.md`, line 43 is item 5 of the README's list, `## The stage and campaign that stand`, a list item and not a heading. `## Papers` is item 8 at line 46. Line 50 is the bullet on a section with nothing to hold yet.
  - The changes were made at the named items, not at the line numbers.
  - `SKILL.md` has 651 lines on the base (`git show 0658dc7:skills/academic/researcher/SKILL.md | wc -l`), as the brief says.

## Repair round 1

Every ruling of `.scratch/13-researcher/agents/briefs/8-round-1.md` is done. None was handed back.

### The rulings

1. **Spec 1, Consolidate.** Done. In `SKILL.md`, "revision" item 5, line 573 reads "It runs whenever a campaign of the run produced a result, on a cluster or off one." Line 574 skips the item only for a run with no results comment left, every comment moved to text work at the split, and writes `stages.consolidate.status: skipped`. The condition on submitted jobs is gone: `grep -n 'submitted no job'` prints nothing (exit 1).
2. **Spec 2, the brief of a campaign.** Done.
   - "revision" item 3, line 557: "Each brief of a campaign quotes, beside the research question, the results comment the campaign answers, as quoted lines, `> `, so that the builder and the reviewer read the code against the comment."
   - The Rules bullet at line 738 now reads "A referee comment reaches `revision-comments.md`, a brief of a campaign and the README as supplied text, ...".
3. **Spec 3, the figure.** Done. `researcher_revision()` in `docs/figures/gen_figures.py` now draws:
   - "The record of the experiments, when the project holds none", before the run's configuration.
   - "The dataset" for a comment that needs another dataset (ruling 4).
   - "A result short of what was set, in research", with its edge from Compare and its edge to Consolidate on your word.
   - "A number that does not reproduce".
   - A Baseline box, with the cycle from Consolidate ("a difference in a baseline number: back to Baseline, once", dotted, and "Consolidate again" back).
   - The return to Experiments ("a difference in a campaign's number: back to Experiments, once").
   - The edge from Compare to Consolidate, labelled "every results comment answered".
   - The edge from Consolidate to the first integrity check, labelled "no difference".
   - The figure's note names the one part of Frame that runs.
   - The alt text in `README.md`, line 92, was rewritten to match.
   - The reverse check: each node and edge was listed from the function with a script and read against the text. Each one is in `SKILL.md`, as below.

   | Drawn | Where the text has it |
   |---|---|
   | The record of the experiments | Steps 4 |
   | The run's configuration | Steps 5 |
   | The coach, the split, and the split's three edges | item 2, item 3 and item 5 (the skip with no results comment) |
   | The dataset | item 3 |
   | The builder, the reviewer and their stop | "research" items 7 and 8, through item 3 |
   | Experiments with its loop | "research" item 12 |
   | Compare and its causes | "research" items 13 to 15, and item 4 |
   | The three result stops and their edges | "research" item 15 and item 4 |
   | Consolidate, its stop and its two returns | "research" item 16, through item 5 |
   | The stages after | items 6 to 10 |
   | The two floating stops | "research" item 10 |

4. **Spec 5, another dataset.** Done.
   - "revision" item 3, line 555: a results comment that needs a dataset the project does not hold first has that dataset chosen by "research" item 5, the stop "The dataset" with its candidates, their size, licence and fit to `## Constraints and limits`, for that comment only. The choice is written beside the project's dataset, and Frame's questions of "research" item 4 are not asked again.
   - The subsection head, line 530, now ends "and Frame is not run again, except its choice of a dataset for a results comment that needs a dataset the project does not hold (item 3)".
   - The Stops row "The dataset" (line 638) names this case in its When cell.
5. **Standards 1, `state.json`.** Done. "revision" item 1 (lines 533 to 542) names the keys in the structure of `agents/state_tracker_agent.md`, "Tracked State Structure", and the other items write them by name (items 2, 3, 4 and 5).
   - `current_stage`: `split`, `campaigns`, `consolidate`, then `2.5`, `4`, `3p` and `4.5`. The stage id of Stage 3' is now `3p`, the id that page's `update_stage` uses.
   - `stages.split`, `stages.campaigns` and `stages.consolidate`, with `name`, `status` (`pending`, `in_progress`, `completed` or `skipped`), `outputs`, `started_at` and `completed_at`, and for the split also `skill: paper` and `mode: revision-coach`.
   - `split_confirmed`.
   - `revision_comments`, one entry per comment with `id`, `kind` (`results` or `text`), `state` (`open`, `in_campaign`, `answered_by_results` or `answered_in_text`), `campaign` and `results`.
6. **Behaviour 1, the README after a revision.** Done. A second `/researcher revision` and a `/researcher research` on the project now run as before, by reading:
   - "revision" item 5, line 576: the end of `research` that "research" item 17 names stays the stage that stands.
   - "revision" item 10, line 596, writes the end of the revision, with its run folder and its comments file, beside it in `## The stage and campaign that stand`.
   - "What it reads" 3 (line 52) and the refusal row "No project of research" (line 663) accept a stage of `research` or the end of `research`.
   - `references/project_layout.md`, "The README" item 5, names the end of each revision beside the end of `research`.
   - The removed text is gone: `grep -n 'end of the campaigns of the revision'` prints nothing.
   - A second `/researcher revision` passes "What it reads" 3, because the README names the end of `research`.
   - A `/researcher research` reads that README as "research" item 1 reads a project whose `research` ended, which is unchanged by this step.
7. **Behaviour 2, `pipeline_state`.** Done. `agents/pipeline_orchestrator_agent.md`, "Writing the run's state", sets `running` when a checkpoint is passed and `awaiting_confirmation` while a checkpoint waits. `references/pipeline_state_machine.md` gives `paused` as "User paused, can resume at any time". For `revision`:
   - Steps 5 (line 130): "For `revision`, write `pipeline_state: running` into `state.json` once the user confirms".
   - "revision" item 1 (line 542): `awaiting_confirmation` at each stop of items 2 to 5 that waits on the user, and `paused` at "The jobs submitted".
   - The same line sets `running` again once the user answers or the run is continued, so Steps 2 offers the run after any of these stops.
8. **The Stops row clause.** Done. The table "Host- or user-visible changes" gained the row for "A result that does not beat the baseline", What resumes it, with its before and its after.

Spec 4 (`deviations.md`) is left to the orchestrator, as the round's brief says.

### The checks, rerun

Each command ran from the worktree's root, the Python ones under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

| Check | Output as printed |
|---|---|
| 1. The character-set check over the nine changed files and this report | nothing, `charset exit 0` |
| 2. `python3 docs/figures/gen_figures.py` | exit 0 |
| 2. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` | `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, exit 0 |
| 2. `git status --short` | ` M README.md`, ` M docs/dev/building.md`, ` M docs/dev/scripts.md`, ` M docs/figures/gen_figures.py`, ` M docs/glossary.md`, ` M skills/academic/researcher/SKILL.md`, ` M skills/academic/researcher/references/project_layout.md`, ` M skills/academic/researcher/references/research_stages.md`, `?? .scratch/13-researcher/agents/briefs/8-round-1.md`, `?? .scratch/13-researcher/agents/reviews/8-report.md`, `?? docs/figures/researcher-revision.svg` |
| 3. The description counts | `1022 skills/academic/researcher/SKILL.md` |
| 4. `sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template`, exit 0 |
| 5. The front matter | `researcher 1022 {'version': '1.0.0'}` |
| 5. The Quick start block | `12` lines |
| 5. The negative and null grep | lines `716` and `722`, both forbidding a write-up |
| 5. The routing grep | `97` |
| Old text gone | `grep -n 'submitted no job\|end of the campaigns of the revision'` printed nothing, exit 1 |

On `git status`:

- `.scratch/13-researcher/agents/briefs/8-round-1.md` is the orchestrator's brief for this round. It is untracked in the worktree, and I did not write it.
- `docs/figures/researcher-research.svg` is unchanged.

Files after the round (`wc -l`, then `git diff --numstat` added and removed):

| File | Lines | Added | Removed |
|---|---|---|---|
| `skills/academic/researcher/SKILL.md` | 739 | 124 | 36 |
| `docs/figures/gen_figures.py` | 2720 | 117 | 3 |
| `docs/figures/researcher-revision.svg` | 278 | new | |
| `README.md` | 270 | 4 | 2 |
| `skills/academic/researcher/references/project_layout.md` | 70 | 2 | 2 |

The other changed files are as in the first report.

### Judgment calls of this round

- **The cycle to Baseline.** The figure draws the arrow from Consolidate to Baseline as a dotted forward arrow, and Baseline's return to Consolidate as a back arrow. This mode has no Baseline stage above Consolidate, so this is the form the layout allows for that cycle. Both arrows are dotted, as the legend gives a cycle.
- **The edge from "A result short of what was set" to Consolidate** is labelled "on your word". The script found no free place beside that arrow for a longer label, and the figure's note says that such a result goes on, on your word, named as below what was set.
- **Stage 3' in `current_stage`** is now `3p`, the id of `agents/state_tracker_agent.md`. The item headings and prose keep "Stage 3'".

## Added at landing (the orchestrator)

Visible changes the report's table did not list, from the run over round 1, Behaviour 1:

| Surface | Before | After |
|---|---|---|
| The Stops row "The dataset", When | Frame's choice of the dataset only | also, in `revision`, a results comment that needs a dataset the project does not hold |
| The README's `## The stage and campaign that stand` | the end of `research` | the end of `research`, with the end of each revision, its run folder and its comments file, beside it |
| Steps 5 and `pipeline_state` of a `revision` run | no `revision` run | `running` at the confirmation of the run's configuration, `awaiting_confirmation` at each stop of items 2 to 5, `paused` at "The jobs submitted" |
| "What it reads" 3 and the refusal "No project of research" | no `revision` mode | a README whose stage that stands is a stage of `research` or the end of `research` |
