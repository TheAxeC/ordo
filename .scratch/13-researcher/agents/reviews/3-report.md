Everything in the brief is done. Two paths outside "Paths this step writes" are changed, since item 5 cannot be met without them: `skills/ordo/ordo-init/templates/plan-terms.md` and `skills/ordo/ordo-init/SKILL.md` (judgment call 1); verify check 2's path list is red on those two paths for that reason.

# Report: step 3, the modes `novelty` and `idea` of `researcher`

## Open items of the state file, verbatim

- none.

## The cases' first run (unchanged tree at fba2c70)

Every command ran from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` where it runs Python.

- Frontmatter: `python3 -c 'import yaml; d=...; print(d["name"], len(d["description"]), d["metadata"])'` printed `researcher 1010 {'version': '1.0.0'}`.
- `##` headings: `grep -n '^## '` printed `12:## Quick start`, `22:## Use instead`, `38:## What it reads`, `56:## Steps`, `201:## The integrity check`, `248:## Checkpoints`, `275:## Stops`, `311:## Anti-patterns`, `324:## Rules`. Unmet on the unchanged tree, as expected.
- Quick start block: `sed -n '/^## Quick start/,/^## Use/p' ... | grep -c '^/researcher'` printed `5`; neither line of Open item G.
- `/researcher novelty "<an idea in one sentence>"`, by reading: `grep -n -i 'novelty\|/researcher idea'` printed nothing; the call matches no Quick start line, so Steps 1 sends it to "1. Intent Detection" (rows reach only Stages 2, 2.5 and 4) and the stop "The entry point". No novelty run exists.
- An idea with a single quote: Rules read "Every path and every value the user gives reaches a command as one argument in single quotes." with no word on a quote inside the value; no `novelty` mode reaches `lookup.py search`.
- A project folder whose path holds a space: the same Rules bullet covers paths of the landed modes; no novelty or idea path exists.
- A candidate work `resolve` does not confirm: no novelty page exists; not applicable on the unchanged tree.
- A second `novelty` run on the same day: no novelty page naming exists.
- "is my idea that X new?": Steps 1 line 68 sends it to Intent Detection and `references/mode_advisor.md`, which name only `/researcher manuscript` (`git grep -n '/researcher' -- .../mode_advisor.md`, lines 19 to 83). No route to `novelty`.
- `/researcher idea <project folder>` with no README, started again, and on a README with questions: no `idea` mode; each goes to "The entry point".
- A claim found `done`: no `idea` mode.
- `grep -n '/grill\|Agent tool'` printed lines 205, 212 and 328, all of the integrity check and its Rules bullet; no `/grill`.
- Goal and ADR 0054 sentences: no step carries either mode.
- `/researcher integrity <main.tex>` and `/researcher manuscript <project folder>` followed through Steps: the baseline run, read in full (Steps 1 to 6, the subsections, "The integrity check", "Checkpoints").
- `grep -n 'in both modes'` printed `58:Steps 1 to 6 run in order, in both modes.`
- `grep -rn '"The integrity check\|"Checkpoints' skills/academic/researcher` printed SKILL.md lines 103, 115, 141, 148, 190, 191, 250, 285, 298 to 303 and `references/compliance_checkpoint_protocol.md:10`; each names a section `SKILL.md` had then.
- `python3 docs/figures/gen_figures.py` printed `wrote ... researcher.svg (36532 bytes)` among 25 lines, `gen exit 0`; `git status --short` printed nothing (each figure byte for byte as committed).
- `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22636 bytes)`, `ap exit 0`, unchanged.
- `grep -c novelty README.md` printed `0`.
- `grep -n 'round, of\|verdict, of' docs/glossary.md` printed lines 111, 168 and 172.

No case was found that the brief's rules get wrong. The one premise of the brief found wrong is under "Anything wrong or impossible".

## DONE / NOT DONE

| Item or check | State | Command and output as printed |
|---|---|---|
| 1 SKILL.md: frontmatter, version | DONE | the yaml one-liner prints `researcher 1020 {'version': '1.0.0'}` |
| 1 title and paragraph for four modes | DONE | `sed -n 8,10p`: "# The novelty check, the idea interview, the integrity check and the manuscript pipeline" and a paragraph on what each mode does and leaves |
| 1 Quick start, seven lines, Open item G's two first | DONE | `grep '^/researcher'` over the block prints 7 lines, the first `/researcher novelty <idea> [<project folder>]`, the second `/researcher idea <project folder> [<sketch file>]` |
| 1 Use instead `/grill` row, two rows kept | DONE | `grep -n '/grill'` prints `39:| A design decision of a roadmap entry to settle before its plan opens | `/grill` |`; rows of `/paper lit-review` and `/paper plan` unchanged in `git diff` |
| 1 What it reads 1, 3, 5, 6, 9, 13 and new 16 to 19 | DONE | lines 43 to 61 |
| 1 Steps intro, Steps 1 routing, Steps 6 | DONE | `grep -n 'in both modes'` prints nothing (exit 1); Steps 1 lines 68, 76 to 78 |
| 1 `### novelty` and `### idea` | DONE | `grep -n '^### '`: novelty 112, idea 153, integrity 205, manuscript 215 |
| 1 Stops rows, intro count | DONE | intro "every other row but the nine refusals at the end"; the last nine rows are No manuscript, No project folder, No comments file, A skill not installed, lookup.py not found, No idea given, No sketch file, No paper for the novelty check, No lookup.py for the novelty check |
| 1 Anti-patterns and Rules | DONE | six Anti-patterns rows; Rules bullets on agents (lines 374 to 376), on `resolve` (386), on values and the user's words |
| 1 and 6 the two sections moved word for word | DONE | `diff <(sed -n '203,246p' SKILL.orig.md) <(tail -n +5 references/integrity_check.md)` exit 0; `diff <(sed -n '250,273p' SKILL.orig.md) <(tail -n +5 references/checkpoints.md)` exit 0 |
| 2 `novelty` | DONE | `### novelty` items 1 to 7 |
| 3 `idea` | DONE | `### idea` items 1 to 11 |
| 4 `references/novelty_page.md` | DONE | 105 lines, the form and a made-up example that says so |
| 5 glossary | DONE | `grep -n 'round, of\|verdict, of' docs/glossary.md` prints 111, 168, 169 (`round, of the interview of `idea``), 173, 174 (`verdict, of a novelty check`) |
| 5 plan-terms block in sync | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0 |
| 7 README row | DONE | `grep -n novelty README.md` prints only line 34 |
| 8 figure note and head comment | DONE | `python3 docs/figures/gen_figures.py` exit 0; `git status --short docs/figures` prints ` M docs/figures/gen_figures.py` and ` M docs/figures/researcher.svg`; aria-label and `<title>` of `researcher.svg` compared with HEAD by `diff`: equal |
| 9 Deviations | DONE | section below |
| Verify 1, character set | DONE | the perl check over `git ls-files -mo --exclude-standard` (the 11 changed and new files) printed nothing, `ascii exit 0` |
| Verify 2, figures and paths | DONE, path list RED | both scripts exit 0, `academic-pipeline.svg` unchanged; `git status --short` lists the 9 brief paths and also `skills/ordo/ordo-init/SKILL.md` and `skills/ordo/ordo-init/templates/plan-terms.md` (judgment call 1) |
| Verify 3, description counts | DONE | prints `1020 skills/academic/researcher/SKILL.md` and `1011 skills/ordo/ordo-init/SKILL.md` |
| Verify 4, the greps of Cases | DONE | see "The cases after the change" |
| Verify 5, list items and sentence length | DONE | see "Departures from the list and sentence rules" |
| Tests of the changed ordo-init template | DONE | `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1` prints `PASS: sync_rules.py scratch tests`; `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests` |

### The cases after the change

- Frontmatter: `researcher 1020 {'version': '1.0.0'}`. Met.
- `grep -n '^## '`: 12 Quick start, 24 Use instead, 41 What it reads, 63 Steps, 305 Stops, 351 Anti-patterns, 370 Rules. Met.
- Quick start: seven lines, each with its comment; the four modes under Steps (`### novelty`, `### idea`, `### integrity`, `### manuscript`) each have a line. Met.
- `/researcher novelty "<idea>"`, read through Steps: Steps 1 settles the mode and checks "What it reads" 5 and 6 (refusals "No paper for the novelty check", "No lookup.py for the novelty check"); the Steps intro sends it to Steps 6, then `### novelty` 1 (claims shown, stop "No claim to check"), 2 (two `search` runs and one web search per claim), 3 (at most five works, abstract or passage read in the run), 4 (confirmed by the Rules bullet on `resolve`), 5 (verdict `new`, `partly done`, `done`), 6 (`notes/novelty-<YYYY-MM-DD>.md`), 7 (final message with the Existing Materials row and Phase 1 kept). Rules line 375: no agent. Met.
- An idea with a single quote: the Rules bullet now says the quote is written `'\''`. Run: `python3 -I argv_probe.py '<scratch copy of lookup.py>' search 'the author'\''s method'` (a scratch script that loads `lookup.py`, replaces its two network searches with a printer, and runs its `main`) printed `query reached search: [the author's method]`, `query reached pubmed: [the author's method]`, `exit 0`. Met.
- A path with a space: the same probe run on a copy of `lookup.py` under `.../scratchpad/paper skill copy/templates/` printed the same two lines and `exit 0`; `mkdir -p "$S/my project/notes"` made the folder, `ls` printed `novelty-2026-11-25.md` after a `touch`. Every path in the new steps is written in single quotes (`mkdir -p '<project folder>/notes'`, `--into '<folder>'`). Met.
- A work `resolve` does not confirm: `### novelty` 4, second bullet, and the page's section "Works found and not confirmed". Met.
- A second run the same day: `### novelty` 6, second bullet, `-2`, `-3`. Met.
- "is my idea that X new?": Steps 1, line 77, the stop "The entry point" with the line of `novelty`. Met.
- `/researcher idea <project folder>` with no README: "What it reads" 1 makes the folder; `### idea` 3 (stop "The sketch", progress file), 4 and 5 (round of the interview with options, pros and cons, one recommendation, the lazy option), 6 (each answer written as it settles), 7 (one novelty page per round), 10 and 11 (README made with `# <the project folder's name>` and the section). Met.
- Started again with open choices: `### idea` 1. Met.
- A README with questions and claims and no open choice: `### idea` 2 (stop "A reopening", or the result from Compare), 10 (each changed research question with the result that changed it). Met.
- A claim found `done`: `### idea` 8 and the stop "A claim found done". Met.
- `grep -n '/grill\|Agent tool'` prints `39:` (the Use instead row) and `374:` (the Rules bullet on the agents of `integrity` and `manuscript`); `### idea` invokes no skill and starts no agent (line 155 and Rules 375, 376). Met.
- Goal and ADR 0054 sentences: see "The goal's and ADR 0054's sentences". Met.
- `integrity` and `manuscript` through Steps and the two pages: Steps 1 to 6 are unchanged for them but for the scope words; the subsections name `references/integrity_check.md` and `references/checkpoints.md`, whose bodies equal the old sections (`diff` exit 0 for both). Same run. Met.
- `grep -n 'in both modes'`: nothing, exit 1. Met.
- `grep -rn '"The integrity check\|"Checkpoints' skills/academic/researcher` prints `references/checkpoints.md:3` and `:5`. Line 5 is the moved text, "at each stop of "The integrity check"", kept word for word as item 1 asks; line 3, the page's opening, says that the text names `references/integrity_check.md` so. No hit names a section of `SKILL.md`. Met.
- `python3 docs/figures/gen_figures.py`: exit 0, `git status --short docs/figures` lists `gen_figures.py` and `researcher.svg` only. Met.
- `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`: exit 0, `academic-pipeline.svg` not in `git status`. Met.
- `grep -n 'novelty' README.md`: line 34 only. Met.
- `grep -n 'round, of\|verdict, of' docs/glossary.md`: 111, 168, 169, 173, 174. Met.

## The terms

- **round, of an interview** (changed, plan-terms block and template): it said "elsewhere it is a repair round"; it now says "elsewhere in the plan skills it is a repair round, and a skill whose rounds are of another kind names them in an entry of their own", which holds for `referee`'s and `researcher`'s entries.
- **round, of the interview of `idea`** (added): every use of "round" in `### idea`, the title paragraph, the Quick start comment, the Stops rows, the Anti-patterns rows, the README row, the figure note, the description and `references/novelty_page.md` is written "round of the interview" or "rounds of the interview"; `awk '/^### novelty/,/^### integrity/' SKILL.md | grep -o '... round...' | grep -v 'round[s]* of the interview'` prints nothing. The old "correction rounds" and "coaching rounds" of the landed modes are unchanged.
- **verdict, of a novelty check** (added): `new`, `partly done`, `done` in `### novelty` 5, the page form and the Stops row "A claim found done". The landed "verdict" of the integrity check (PASS, FAIL) is the integrity agent's own word in copied text, unchanged.
- **stop** and **refusal**: the new Stops rows wait on the user or name their cause and leave nothing, as the entries say.
- **lazy option**: `### idea` 5 uses it in the entry's sense, the option that costs less now and leaves the work undone.
- **session, the**: the session that runs `researcher`, as the entry says.
- **step**: "Steps <n>" and "item <n>" cite items of a skill's Steps, the entry's second sense.
- Avoided: **question, the** (always written "research question"), **finding** (a result of the research is written "the result that changes it"), **frontier**, **decision form**, **design bar** (`idea` gives no design-bar line, brief Decision 6).

## Files with line counts

`git diff --numstat` and `wc -l`:

- `skills/academic/researcher/SKILL.md`: +158 -109, 396 lines.
- `skills/academic/researcher/references/novelty_page.md`: new, 105 lines.
- `skills/academic/researcher/references/integrity_check.md`: new, 48 lines.
- `skills/academic/researcher/references/checkpoints.md`: new, 28 lines.
- `skills/academic/researcher/references/compliance_checkpoint_protocol.md`: +1 -1 (line 10).
- `docs/glossary.md`: +3 -1.
- `README.md`: +1 -1 (line 34).
- `docs/figures/gen_figures.py`: +7 -2.
- `docs/figures/researcher.svg`: +17 -16 (the note, the height).
- `skills/ordo/ordo-init/templates/plan-terms.md`: +1 -1.
- `skills/ordo/ordo-init/SKILL.md`: +1 -1 (`version: "5.0.0"` to `"5.0.1"`).

## The goal's and ADR 0054's sentences

Goal on `novelty`:

- "a light check made by the session itself, with no agent started": `### novelty` intro and Rules "A run of `novelty` or `idea` starts no agent".
- "it states the claims of an idea": `### novelty` 1.
- "searches for the closest prior work on each": `### novelty` 2.
- "writes one page with the nearest works and their references, what each already does, what the idea adds beyond them and a verdict per claim (new, partly done or done)": `### novelty` 3, 5 and 6, and `references/novelty_page.md`.
- "each cited work confirmed with `paper`'s `lookup.py`": `### novelty` 4 and the Rules bullet on `lookup.py resolve`.
- "the page is given to `paper` as a starting point and replaces none of its literature search": `### novelty` 7, the Anti-patterns row on the page given as own sources.

Goal on `idea`:

- "takes a rough sketch to research questions and claims": `### idea` 3, 10 and 11.
- "it works in rounds, each choice of the idea put with its options and a recommendation": `### idea` 4 and 5.
- "runs `novelty` on each candidate claim between rounds": `### idea` 7.
- "writes the questions and claims into the project's `README.md`": `### idea` 11.

ADR 0054, first Decision paragraph:

- "`researcher` has a mode `idea`, which is also the first part of `full`": `### idea`; the part of `full` is step 4's.
- "It works in rounds as `/grill` does: each choice of the idea (the problem, the claim, the baseline, the metric, the result that would show it works) is put to the user with its options and a recommendation": `### idea` intro (the five choices and their order), items 4 and 5.
- "Between rounds it runs `novelty` on each candidate claim, so that a claim found done is dropped or sharpened before the next round": `### idea` 7 and 8.
- "It ends with the research questions and claims written into the project's `README.md`": `### idea` 10 and 11.
- "The Compare stage of `research` can reopen it, and a changed question is written with the finding that changed it": `### idea` 2 (the result Compare gives) and 10 (each changed research question with the result that changed it).
- Alternatives rejected, "`/grill` itself invoked": Rules "The session holds the interview of `idea` itself and invokes no skill for it, since `grill` reads a roadmap entry and a plan configuration, which a research project does not have".

## Deviations

- Copied pages: one line changed, `references/compliance_checkpoint_protocol.md` line 10, before "**Used by**: the compliance agent, `SKILL.md`, "The integrity check" items 2, 4 and 5, at Stage 2.5 / 4.5.", after "**Used by**: the compliance agent, `references/integrity_check.md`, items 2, 4 and 5, at Stage 2.5 / 4.5.". `git diff --name-only -- skills/academic/researcher/agents skills/academic/researcher/examples skills/academic/researcher/templates` prints nothing, and in `references/` only that file changed.
- The two moved sections: `## The integrity check` and `## Checkpoints` became the `#` titles of `references/integrity_check.md` and `references/checkpoints.md`, each with an opening paragraph added on which modes read the page and how its section names are read. Every other line is the old section's (both `diff` runs exit 0).
- Changes to the landed text of `SKILL.md`:
  - The description, rewritten for four modes; it drops the triggers `/researcher integrity`, `/researcher manuscript`, `verify the references and claims of a finished draft`, `final integrity check` and `full paper workflow`, and the phrase on the two depths, to fit 1,024 characters.
  - The title and its paragraph: two sentences on `novelty` and `idea` added in front of the landed ones.
  - Quick start: the two lines added in front; the five landed lines unchanged and in their order.
  - Use instead: the `/grill` row added.
  - What it reads 1: the `<idea>` form and the refusals "No idea given", "No sketch file", "No project folder" for `idea`; "A `<project folder>` that does not exist" scoped to `manuscript` and `novelty`.
  - What it reads 3, 5, 6, 9 and 13: scoped to the modes, the two novelty refusals, the session running `lookup.py`, the three new pages; items 16 to 19 added.
  - Steps intro, Steps 1 (mode word, the line of the two modes, two routing bullets, "Any other call", "where the mode has one") and Steps 6 (four subsections).
  - `### integrity` 1, `### manuscript` 1, 3, 5, 12: "The integrity check" and "Checkpoints" now named by their pages.
  - Stops: intro count five to nine; six stops and four refusals added; the When cells of "No project folder", "A skill not installed" and "lookup.py not found" scoped to the modes, their What it shows unchanged; "The checkpoint after Stage 2" and the six rows citing "The integrity check" now name the pages.
  - Anti-patterns: six rows added.
  - Rules: the two role bullets scoped to `integrity` and `manuscript`; the agents bullet scoped and two bullets added; the `resolve` bullet extended to a work a novelty page cites; the values bullet given the quote form; the bullet on the user's words added.

## Judgment calls

1. Item 5's last sentence asks that "round, of an interview" be made true where it speaks of the bare "round" outside `grill`. That entry is in the plan-terms block, which `docs/glossary.md` line 3 says is changed only in `skills/ordo/ordo-init/templates/plan-terms.md`, and which the glossary check compares with it. The entry is changed in both, in words that name no academic skill, since the template is copied into every configured repository. A change to `ordo-init`'s template raises its version once in a plan (`docs/dev/skill-layout.md`, "Frontmatter"), and no step of this plan changed `ordo-init` before (`git log --oneline 93cd553..HEAD -- skills/ordo/ordo-init` prints nothing), so its version goes from 5.0.0 to 5.0.1, the patch part, since only a definition's wording changes. Both paths are outside "Paths this step writes"; the orchestrator rules whether they stay.
2. The heading of the README's section: `## Research questions and claims`, used in "What it reads" 18, `### idea` 2, 10 and 11, and the Stops row "The end of the interview".
3. The order of Quick start: `novelty` first, since it needs only a sentence and no project folder; `idea` second; the five landed lines after them in their landed order.
4. "No sketch file", a refusal for a `<sketch file>` that does not exist, since "What it reads" asks that an input whose absence is a refusal say so and a missing file can only be refused or ignored.
5. A `<project folder>` given to `novelty` that does not exist is the landed refusal "No project folder"; `idea` makes the folder.
6. The refusals for `paper` or `lookup.py` missing in `novelty` also hold for `idea`, which runs `novelty`.
7. The prerequisites of the five choices: the claim waits on the problem, the baseline and the metric on the claim, and the result that would show it works on the baseline and the metric.
8. The candidate claims of a round of the interview are the claim it settled and each option of a claim choice still open; a round with none runs no novelty check.
9. A claim found `done` comes first in the next round of the interview as a choice of its own, with a sharpened claim, another claim, or the claim dropped.
10. The progress file's form (the sketch quoted, one line per choice `open` or `settled: <answer>`, the list of novelty pages, the end line) is written in `### idea` 3 and 11; the brief names no reference page for it.
11. The answer form of a round of the interview: `<n> => <letter or text>` and `<n> Agree`.
12. The search for the prior work reads an abstract with `lookup.py index-abstract ... --into '<folder>'` in a `mktemp -d` folder removed at the end, or the page the web search found.
13. The rule on the user's words: an idea or a sketch is written as quoted lines, `> `, and a line of an answer that opens with `#` too, so that no line of the user's opens a section of the README or a page (change-standard rule 15).
14. The description drops five landed trigger phrases (Deviations).
15. The made-up example uses the DOI prefix `10.0000`, which is not registered, and says so.

## Departures from the list and sentence rules

- What it reads 1 holds several sentences, one per argument and refusal, as the landed item does; it is one input, the call.
- `### novelty` 7, the bullet on how the page reaches `paper`, is 51 words, since the brief gives its three parts (the Existing Materials row, Phase 1 kept, not the user's own sources) as one rule.
- `### idea` 3, the bullet on the progress file's form, is one sentence of 64 words, since it is a file format; it stays in the item that writes the file.
- The README row of `researcher` is one table cell of several sentences, the form every row of that table has.
- The two glossary entries are one paragraph each, the form of every entry.
- The `### idea` intro paragraph holds three rules (the session looks facts up, the five choices, their prerequisites), since every item of the subsection reads them.

## Host- or user-visible changes

- `/researcher novelty <idea> [<project folder>]`: before, the stop "The entry point" routed to `manuscript`; after, the novelty check and its page in `notes/`.
- `/researcher idea <project folder> [<sketch file>]`: before, the same stop; after, the interview, the progress file, a novelty page per round of the interview and the README section.
- A call with no mode word asking whether an idea is new or how to shape a sketch: before, Intent Detection; after, "The entry point" with the line of `novelty` or `idea`.
- The description and its triggers (Deviations).
- `researcher.svg`: the note gains one sentence on `novelty` and `idea`; the figure is 15 units taller (`viewBox ... 2577` to `2592`); boxes, title and aria-label unchanged.
- README line 34: the row gains the two modes; line 88 unchanged.
- The plan-terms entry "round, of an interview", copied by `/ordo-init` into a configured repository's glossary.

## Anything in the brief that was wrong or impossible

- "What is on the tree" says the Rules bullet on `lookup.py resolve` is at line 209; on the base it was line 338 (`grep -n 'A reference is confirmed' SKILL.md` on the unchanged tree), line 209 being inside "The integrity check". The bullet is the one the brief means; nothing rests on the number.
- "What is on the tree" says "This step changes no copied page", while item 1 and "Paths this step writes" name `references/compliance_checkpoint_protocol.md` line 10. The line was changed as item 1 says and is listed under Deviations.
- Item 5 cannot be met inside the brief's paths (judgment call 1).

## Repair round 1

Every ruling of `agents/briefs/3-round-1.md` is done; none is handed back.

1. Spec 1: no change. `skills/ordo/ordo-init/templates/plan-terms.md` and `skills/ordo/ordo-init/SKILL.md` (5.0.1) stand.
2. Spec 2: done. The description gives `/researcher novelty`, `/researcher idea`, `/researcher integrity`, `/researcher manuscript`, `verify the references and claims of a finished draft`, `final integrity check` and `full paper workflow` among its triggers, the full and pre-review depth of `integrity`, and that `integrity` and `manuscript` keep state and records in a run folder. Parsed length 1019.
3. Spec 3: done. "What it reads" 19 reads only the newest progress file; "idea" item 1 continues when the newest progress file holds a choice still open; "idea" item 2 and the Stops row "A reopening" hold when the newest progress file holds no choice still open, or none exists.
4. Standards 1: done. The title paragraph's last sentence reads "A run of `integrity` or `manuscript` leaves behind the run's state, ...".
5. Standards 2: done. Rules "A run of `integrity` or `manuscript` given the same input follows ..." and "Every artifact of a run of `integrity` or `manuscript` carries its version label ..."; the Anti-patterns row on skipping an integrity check now says "in every run of `manuscript`". Every other Rules bullet and Anti-patterns row was read: each is scoped already or holds for `novelty` and `idea` (one on the manuscript, the run folder or a checkpoint, which those modes do not have).
6. Standards 3: done. "The reopening evidence" is defined at "idea" item 2 and used in items 2, 3 and 10 and the Stops row "A reopening"; "result" in `### idea` is left for "the result that would show it works" and "the result of the Compare stage"; "a result in the literature" of item 4 reads "a work in the literature".
7. Standards 5: done. README line 34: "The modes `integrity` and `manuscript` are copied from academic-pipeline, with its stages and the pages of its agents, and `novelty` and `idea` are this repository's own."
8. Standards 6: done. "novelty" item 6 removes the temporary folder with `rm -r '<folder>'` after the page is written, and its Done line requires the folder gone; item 3 no longer says when it is removed.
9. Behaviour 1: done. `### integrity` item 1 holds each stop of the check as a checkpoint of `references/checkpoints.md`, item 2 holds the MANDATORY checkpoint of the result by it, and `references/integrity_check.md` item 4 gains "Each stop of this item, and the stop "The third correction round failed" of item 6, is held as a checkpoint, as `references/checkpoints.md` gives it." Read: the Stops rows an `integrity` run reaches ("A FAIL of an integrity check", "The third correction round failed", "The failure-mode block", "The compliance block", "A BLOCKED ethics verdict", "A CONDITIONAL ethics verdict") each point at `references/integrity_check.md` 4 or 6, which name the page. This is a change to the moved text of `integrity_check.md`, one bullet; the Deviations section gains it.
10. Behaviour 2: done. "novelty" item 2 writes each index left out with its reason and raises the stop "The searches did not run" (new Stops row, before the refusals, so the intro's count of nine refusals stays true); item 5's `new` reason names each index left out; the page form's searches table gains the column "Indexes left out".
11. Behaviour 3: done. "novelty" item 6 writes `notes/novelty-<YYYY-MM-DD>.bib` with the page's suffix from `<lookup.py> bibtex '<DOI or arXiv ID>'`, appended when it exits 0, and names on the page each work with no entry; item 7 and the Anti-patterns row tell the user to name the `.bib` in the Existing Materials row; "What it reads" 3, `references/novelty_page.md` (opening, section "Works with no entry in the .bib", "For paper") and the README row name it. The head comment line 38 was read: bibtex "prints the BibTeX entry https://doi.org/<doi> returns ... When doi.org gives none it prints "doi.org: left out, <reason>" ... and exits 1", and its opening says bibtex "prints the entry alone on standard output". Run: `env -u ... -u CROSSREF_POLITE_EMAIL -u S2_API_KEY -u OPENALEX_API_KEY HOME=<scratchpad>/home python3 skills/academic/paper/templates/lookup.py bibtex '10.1038/nature14539'` printed `exit 0`, standard output ` @article{LeCun_2015, title={Deep learning}, volume={521}, ISSN={1476-4687}, url={http://dx.doi.org/10.1038/nature14539}, DOI={10.1038/nature14539}, number={7553}, journal={Nature}, publisher={Springer Science and Business Media LLC}, author={LeCun, Yann and Bengio, Yoshua and Hinton, Geoffrey}, year={2015}, month=May, pages={436--444} }`, and nothing on standard error. The glossary entry "verdict, of a novelty check" stays true and is unchanged; its "Stated in" of "round, of the interview of `idea`" now reads items 4 to 9.
12. Behaviour 4: done. "novelty" item 5: "The reason of a `new` or a `partly done` verdict names each work found and not confirmed for that claim, so that a reader checks it."; the form's rules say it; the example's C2 reason names "Head pruning for speech models" and is written "Verdict: `new`. No closer work ..." as the form has it; C1's reason says no work was found and not confirmed for it; the list of works not confirmed gains its claim column.
13. Behaviour 5: done. `### idea` is now: 4 draw the choices and their options, 5 run `novelty` once over the candidate claims of the next round (each option of the claim choice it will ask and a settled claim no page has checked), a settled claim found `done` the stop "A claim found done", an option found `done` sharpened and checked in one more run or dropped, a first round whose claim choice waits on the problem running no check; 6 go to the end when no choice is open and the settled claim has a verdict other than `done`; 7 the round of the interview, each claim option with its verdict and page; 8 the answers written as they settle; 9 back to item 4. The Stops rows "A round of the interview" (item 7) and "A claim found done" (item 5), the Anti-patterns references and "novelty" items 1 and 7 point at the new numbers.
14. Standards 4: no change, as ruled.

Deviations added in this round: `references/integrity_check.md` item 4 gains one bullet (ruling 9); `### integrity` items 1 and 2 gain the checkpoint bullet and clause; the Anti-patterns row "Skipping an integrity check" and two Rules bullets are scoped (ruling 5); the title paragraph's last sentence is scoped (ruling 4).

### The checks, run again

- Character set: `git ls-files -mo --exclude-standard -z | xargs -0 perl -CSD -ne '...'` printed nothing, `ascii exit 0`.
- `python3 docs/figures/gen_figures.py`: `gen exit 0`. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`: `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22636 bytes)`, `ap exit 0`.
- `git status --short`: ` M README.md`, ` M docs/figures/gen_figures.py`, ` M docs/figures/researcher.svg`, ` M docs/glossary.md`, ` M skills/academic/researcher/SKILL.md`, ` M skills/academic/researcher/references/compliance_checkpoint_protocol.md`, ` M skills/ordo/ordo-init/SKILL.md`, ` M skills/ordo/ordo-init/templates/plan-terms.md`, `?? .scratch/13-researcher/agents/briefs/3-round-1.md`, `?? .scratch/13-researcher/agents/reviews/3-report.md`, `?? skills/academic/researcher/references/checkpoints.md`, `?? skills/academic/researcher/references/integrity_check.md`, `?? skills/academic/researcher/references/novelty_page.md`. Every path is one of this round's paths or the ledger.
- Description counts: `1019 skills/academic/researcher/SKILL.md`, `1011 skills/ordo/ordo-init/SKILL.md`; the yaml one-liner prints `researcher 1019 {'version': '1.0.0'}`.
- `grep -n '^## '`: 12 Quick start, 24 Use instead, 41 What it reads, 63 Steps, 313 Stops, 360 Anti-patterns, 379 Rules. Quick start lines: `7`.
- `grep -n '/grill\|Agent tool'`: line 39 (the Use instead row) and line 383 (the Rules bullet on the agents of `integrity` and `manuscript`).
- `grep -n 'in both modes'`: nothing, exit 1.
- `grep -rn '"The integrity check\|"Checkpoints' skills/academic/researcher`: `references/checkpoints.md:3` and `:5`, as in the first report.
- `grep -n novelty README.md`: line 34 only.
- `grep -n 'round, of\|verdict, of' docs/glossary.md`: 111, 168, 169, 173, 174.
- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0.
- Line counts after the round: `SKILL.md` +171 -113; `references/novelty_page.md` 116 lines; `references/integrity_check.md` 49 lines; `references/checkpoints.md` 28 lines; `docs/glossary.md` +3 -1; `README.md` +1 -1.
