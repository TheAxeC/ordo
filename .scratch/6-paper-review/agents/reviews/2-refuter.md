# Step 2 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/6-paper-review-2, base 90fe644)

A page this report cites is named with its section, never with a line number. A finding in code keeps its `file:line`.

The report is written in printable ASCII. A character outside it in a quoted line is written by its name in angle brackets.

## Verification (rerun by the reviewer)

All commands were run from the worktree's root, in the foreground, with `PYTHONDONTWRITEBYTECODE=1` set so that no cache file was written.

```
Verify 1, the character-set check over the step's 8 files (the brief's command, verbatim):
  (no line printed)
  exit 0

Verify 2: python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
  ok: the plan-terms block equals the template
  exit 0

Verify 3: env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
  NOT RUN: the test makes scratch directories with mktemp (utils/pin.test.sh lines 27 and 32), and this review writes no file. See "Declined to judge".

Case, contract ids (the brief's python3 -c command):
  2
  reviewer/reviewer_full/v1 5 ['F1', 'F2', 'F3', 'F0']
  reviewer/reviewer_methodology_focus/v1 2 ['F1', 'F2', 'F0']
  exit 0

Case, frontmatter (the brief's python3 -c command):
  paper-review 532 {'version': '1.0.0'}
  exit 0

Case: grep -n '^## ' skills/academic/paper-review/SKILL.md
  12:## Quick start
  32:## Use instead
  43:## What it reads
  77:## Steps
  256:## Agent prompts
  280:## Sprint Contract Protocol
  435:## Review output
  453:## Integration
  475:## Quality standards
  489:## Stops
  506:## Anti-patterns
  520:## Rules
  exit 0

Case: grep -c 'sixteen' README.md
  0
  exit 1
Case: grep -c 'seventeen' README.md
  2
  exit 0

Case, contracts equal to the two ledger files without baseline_version (the brief's python3 -c command):
  True
  exit 0
Reviewer's own line-by-line comparison of each json block with its ledger file (difflib, in memory):
  full.json ['-  "baseline_version": "v3.6.2",']
  methodology_focus.json ['-  "baseline_version": "v3.6.2",']

Verify 5: grep -nE 'v[0-9]+\.[0-9]+|deep-research|academic-pipeline|academic-paper|shared/|scripts/|docs/design|ARS|ars-|[Oo]rchestrator' skills/academic/paper-review/SKILL.md
  (no line printed)

Case: python3 docs/figures/academic-pipeline/gen_academic_pipeline.py
  NOT RUN: it writes a file.
  git status --short docs/figures/academic-pipeline
  (no line printed)
  exit 0

Case: python3 docs/figures/gen_figures.py
  NOT RUN: it writes files. In its place, gen_figures.py was imported in memory and each (name, text) pair of figures() compared with the file on disk:
  20 figures; differing from disk: []
  git status --short docs/figures
   M docs/figures/gen_figures.py
  ?? docs/figures/paper-review.svg

Commands the builder's report quotes, rerun:
  awk '/^## Anti-patterns/,/^## Rules/' skills/academic/paper-review/SKILL.md | grep -c '^| \*\*'
  7
  awk '/^## Quality standards/,/^## Stops/' skills/academic/paper-review/SKILL.md | grep '^|' | tail -n +3 | wc -l
         9
  grep -c 'paper-review' skills/academic/paper-review/SKILL.md
  20
  awk '/^## Open items/,/^## Closed/' .scratch/6-paper-review/orchestrator-state.md
  - none
  grep -n 'panel review' skills/academic/paper-review/SKILL.md
  268:`paper-review` runs in 3 phases internally (Phase 0 field analysis -> Phase 1 panel review -> Phase 2 editorial synt[...]
  grep -rn 'paper-review' skills utils docs README.md
  the same hits as the report lists; each was read
  wc -l of the step's files
  534 SKILL.md, 249 README.md, 1035 paper/SKILL.md, 160 glossary.md, 2188 gen_figures.py, 64 paper-review.svg, 39 building.md, 45 scripts.md (equal to the report's table)
  git status --short
   M README.md
   M docs/dev/building.md
   M docs/dev/scripts.md
   M docs/figures/gen_figures.py
   M docs/glossary.md
   M skills/academic/paper/SKILL.md
  ?? .scratch/6-paper-review/agents/reviews/2-report.md
  ?? docs/figures/paper-review.svg
  ?? skills/academic/paper-review/
```

The source `SKILL.md` (430 lines) was read from its first line to its last against the new file (534 lines, read whole). The builder's map of the source agrees with that reading on every row. The pages the new file names were checked against the source's pages: `references/re_review_mode_protocol.md` ("How It Works", "Socratic Guidance After Re-Review"), `references/guided_mode_protocol.md` ("How It Works", "Dialogue Flow"), `references/calibration_mode_protocol.md` ("Phase 0: Intake", "Ensembling methodology notes"), `references/sprint_contract_protocol.md` ("6. Multi-reviewer orchestration"), `agents/editorial_synthesizer_agent.md` (the synthesizer protocol heading, which holds "Forbidden operations" and the `[EXPRESSION-UNRECOGNISED]` abort), and the Phase Boundary and Sprint Contract headings of the five reviewer pages. Each exists under the name the new file gives, once step 1's tag and dash edits are applied.

## Verdicts

Items of "What to build", `skills/academic/paper-review/SKILL.md`:

- Opening rule (each part carried once, in the source's words, nothing added but what the brief names): violated, Spec 1 to 5.
- Frontmatter: holds. `name: paper-review`, description 532 characters with `/paper-review` first among the triggers and no neighbouring skill named, `metadata.version` "1.0.0" alone (the frontmatter case's output).
- Title and first paragraph: holds. The title is without its version, the opening paragraph is carried with its two dashes as parentheses and a comma, the "v1.1 Improvements" list and the routing note are absent, and one sentence names what is left behind.
- `## Quick start`: holds. Seven `/paper-review` lines and the plain request's line, each with a comment, then the source's Output list of 4 items.
- `## Use instead`: holds. The two rows as `/paper` and `/paper revision`, the deep-research row absent, the `paper` row of Related Skills carried.
- `## What it reads`: violated, Spec 4. The rest holds: 7 items, the reference table with 10 rows and no changelog row, 3 template rows, 2 example rows, Output Language as item 7.
- `## Steps`, the lead (modes table, selection logic, Steps 1 to 3, six `###` subsections): violated, Spec 3. The tables and the code block are carried whole.
- `### full`: holds. Every diagram line is an item or sub-item (3 and 5 bullets under Phase 0, 3, 3, 3, 3 and 8 under Phase 1, 6 under Phase 2, 6 points and 2 outputs under Phase 2.5, "just fix it"). Checkpoint Rules 1 and 5 stand in items 2 and 5.
- Phase 2.5 point 3: holds. The three questions read as the brief words them, and "Questions only: never propose, substitute, rank, expand, or select a contribution claim (Kong L2 verb test); the user answers." is kept.
- `### re-review`, `### guided`, `### calibration`: violated for guided, Spec 1. Re-review and calibration hold: each carries its source section and its pointer, and the cross-model default is absent.
- `### quick` and `### methodology-focus`: holds. Each gives its items and names its row of the modes table.
- The Socratic dialogues: holds. Full item 5 and re-review item 2 resume the run's EIC agent, guided item 2 has it hold the dialogue from its start, the session passes each question and answer, and each question is a stop of the table.
- A part carried once: holds. The modes table stands once, and the Input line stands in "re-review" with "What it reads" 2 naming it.
- A rule the source states in several places stays in each: holds. The report's list of repeats matches the file.
- A bold table row stays bold: holds (the `re-review` and `calibration` rows, agent row 6, Quality standards rows 8 and 9).
- Each item ends on what is true when done: holds. Every numbered item of Steps and of the six modes has a "Done when" line.
- `## Agent prompts`: violated, Spec 5. The merged table of 7 rows and the invocation text hold; Mode A, the routing sentence, the verifier and the hook sentence are absent, and "Enforcement: prompt-level" stays.
- `## Sprint Contract Protocol`: holds. Five bullets, no validator, schema path or template path, the two `json` blocks equal to the ledger files but for `baseline_version`, and the sentence on the user content.
- `## Review output`: holds.
- `## Integration`: holds. The deep-research column of the diagram is absent, the 4 rows are kept, and "8-step" stands here and in the reference table.
- `## Quality standards`: holds, 9 rows.
- `## Stops`: holds. The four columns and 10 rows: the five the brief lists, the two refusals, and `[EXPRESSION-UNRECOGNISED]`, "Fewer than 3 runs per paper" and "The residual coaching question", each found in a source page. A search of the source's pages for abort, refuse, confirm and wait found no further waiting point outside text that edit 2 leaves out.
- `## Anti-patterns`: holds. The sentence and 7 rows, no `#` column, rows 3 and 6 naming Rules with each rule's opening words.
- `## Rules`: holds. Checkpoint Rules 2, 3, 4, 6 and 7 as five bullets, then the three things as eight bullets, one requirement each.
- Left out whole: holds. No "Version Info" and no "Changelog".
- No `##` heading outside the layout's order, labels without a version tag: holds (the headings case).

Items of "The places that list the skills":

- `README.md`: holds. The row after `paper`'s, the group sentence, "seventeen" twice, the copy loop, the figure sentence and the alt text after `writing`'s figure. One sentence beyond the bullet is changed, the list of skills that start agents on the runner's default agent, which the report states as judgment call 17 under rule 14 of the rules file; without it that sentence would be incomplete.
- `skills/academic/paper/SKILL.md`: holds. The Use cell reads `` `paper-review` `` and the version is "4.1.1".
- `docs/glossary.md`: holds. The definition's words are unchanged, and "Agent prompts" is the only section where the words "panel review" stand. The sense they have there is under "Declined to judge".
- `docs/dev/building.md` and `docs/dev/scripts.md`: holds. Each gains `paper-review.svg` after `writing.svg`, the order of `figures()`.
- `docs/figures/gen_figures.py` and `docs/figures/paper-review.svg`: violated, Spec 2. The rest holds: the boxes, arrows and labels match full items 1 to 5, the function follows `grill()` and `writing()`, the list entry and the head comment are there, and the file on disk equals what the function returns.

Cases:

- Every `##` and `###` heading of the source placed: met, by reading; only Version Info, Changelog, the "v1.1 Improvements" list and the routing note are absent whole.
- 7 Anti-Patterns rows and 9 Quality Standards rows: met (`7` and `9` above).
- 7 Checkpoint Rules, each once: met, by reading (1 in full item 2, 5 in full item 5, the others in Rules).
- 8 bullets under the Devil's Advocate: met, by reading full item 3.
- Contract ids: met.
- Frontmatter: met.
- `##` headings in order: met.
- sixteen 0, seventeen 2: met.
- Contracts equal to the two files: met.
- The academic-pipeline figure: not verifiable here; the script writes a file. `git status --short docs/figures/academic-pipeline` prints nothing. Running the script at landing settles it.
- `gen_figures.py` exits 0 and writes only the new figure: not verifiable by its run here; the in-memory comparison found all 20 figures equal to the files on disk, and `git status --short docs/figures` shows only the script changed and `paper-review.svg` new.

## 1. Spec

1. `skills/academic/paper-review/SKILL.md`, Steps, "guided", item 1: "Run Phase 0 and Phase 1 as full items 1 to 3 say, with what `references/guided_mode_protocol.md`, "How It Works", changes." and "Done when the five reports stand in the run folder, or the stop "`[PANEL-SHRUNK]`" is raised."; what is wrong: full item 3 starts each reviewer "in the two calls of the full contract", and "How It Works" changes nothing about that, so guided runs under the full contract. "Sprint Contract Protocol", bullet 5, says "Reserved modes (`reviewer_re_review`, `reviewer_calibration`, `reviewer_guided`) have no contract and run without the two-call protocol", the Stops row of `[PANEL-SHRUNK]` names "Full and methodology-focus" only, and the source's `references/guided_mode_protocol.md`, "v3.6.2 sprint contract status", says "this mode runs without contract enforcement". The brief asks that the file not contradict a page it points at; failure scenario: a session running `/paper-review guided paper.tex` follows item 1, makes ten reviewer calls under the full contract and can abort the round with `[PANEL-SHRUNK]`, in a mode the same file and its page say has no contract; verdict: the items "`### re-review`, `### guided` and `### calibration`" and the opening rule, violated.

2. `docs/figures/gen_figures.py:1904`: "Guided: all seven, with the EIC's dialogue."; what is wrong: the note follows the modes table's "All + Socratic dialogue", while the items under "guided" start the field analyst and the five reviewers and never the editorial synthesizer, and the guided page's "How It Works" says "Phase 2: Does not produce full Editorial Decision; enters dialogue mode instead". The brief asks for a note that names the roles each mode starts; failure scenario: a reader of the README figure expects seven agent starts and an Editorial Decision from a guided run, and the run as the steps give it has six starts and no decision; verdict: the item "`docs/figures/gen_figures.py`", violated.

3. `skills/academic/paper-review/SKILL.md`, Steps 1: "A call with two arguments or more whose first is none of the six mode names is the refusal "Unknown mode"."; what is wrong: the brief asks for a refusal "for a `/paper-review` mode outside the six"; this rule also refuses calls that name no mode at all. "What it reads" 1 allows "The manuscript, as a file or as pasted text"; failure scenario: `/paper-review` followed by pasted paper text, or `/paper-review my paper.tex` with an unquoted space, has two arguments or more whose first is no mode name, so the run is refused as "Unknown mode" and shows the six modes, where the user gave a manuscript and no mode and `full` was due; verdict: the item "`## Steps`", violated.

4. `skills/academic/paper-review/SKILL.md`, What it reads, item 1: "The manuscript, as a file or as pasted text. A call that gives none is the refusal "A missing input"."; what is wrong: the Quick start line of calibration, `/paper-review calibration <gold set folder>`, gives no manuscript, and Steps 1 refuses only a call that "lacks an input its mode's line of Quick start requires". The two sentences disagree for calibration; failure scenario: a session reading item 1 by its letter refuses a well-formed calibration call for a missing manuscript; verdict: the item "`## What it reads`", violated.

5. `skills/academic/paper-review/SKILL.md`, Agent prompts: "Each reviewer's page states them under `## Phase Boundary` and `## Sprint Contract Protocol`, with the two calls under `### Phase 1: Paper-content-blind pre-commitment` and `### Phase 2: Paper-visible review`."; what is wrong: the source has no such sentence and the brief's bullet for `## Agent prompts` names no such addition; "What is on the tree" only fixes the heading texts to use where the step names them. The sentence is true of the five reviewer pages. The report lists it as judgment call 15, where the brief says "Nothing is added except what this brief names"; failure scenario: the gate's reader of step 3 meets a sentence in `SKILL.md` that is none of the edits and none of the additions the rulings list, and has to rule on it there; verdict: the item "`## Agent prompts`" and the opening rule, violated.

## 2. Proof

- none. Every command the report quotes that writes nothing printed what the report says. The three that write (`utils/pin.test.sh` and the two figure scripts) are under "Declined to judge".

## 3. Standards

- none. The character-set check prints nothing for the 8 files. No version tag, date or history stands in the new `SKILL.md`, in the head comment or in the docstring of `paper_review()`. The grep of `paper-review`, `seventeen`, `sixteen` and `paper_review` across `skills`, `utils`, `docs` and `README.md` found no sentence the diff makes false, apart from the label under "Declined to judge". The departures the report lists (the `->` of the carried diagram lines, bold on carried text, tables inside numbered items, sentences past 20 words) are carried text or the brief's own wording.

## 4. Behaviour

- none. Each user-visible change in the diff (the new skill, the six changed places of `README.md`, `paper`'s row and version, the glossary's "Stated in", the two lists of figures, the new function, list entry and head-comment line, the new figure) stands in the report's "User-visible changes" with its before and after.

## Declined to judge

- `utils/pin.test.sh`: not run, since it makes scratch directories. The report's line `PASS: pin.sh scratch tests` is not reproduced; the command of Verify 3 settles it.
- `python3 docs/figures/gen_figures.py` and `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`: not run, since each writes files. The first was replaced by the in-memory comparison above; the exit status and the `wrote ... (12390 bytes)` line of the report are not reproduced.
- The rendering of `paper-review.svg`: its text and coordinates were read, the picture was not looked at. A look at the rendered file settles whether a label overlaps a box.
- The glossary entry **panel review**: "Agent prompts" holds the words only as "Phase 1 panel review", the name of the reviewers' phase, while the entry defines the whole review with the editor's synthesis. No section of the new file uses the term in the entry's sense, so which section "states it" is the orchestrator's call; the brief's grep check is met.
- The word "reviewer" in the sentences the brief dictates against the glossary's entry (the report's point 1): a second sense goes through `skills/ordo/repo-setup/templates/plan-terms.md`, outside this step's paths; the orchestrator's call.
- When Phase 2.5 runs on a Reject decision: full item 5 carries both the diagram's "Decision = Minor/Major Revision" and Checkpoint Rule 5's "Decision is not Accept", as the source has them, and the figure and the README take the first. Which holds is the user's call.
- "**Schema 13 sprint contract.**" as a bullet label of "Sprint Contract Protocol": step 1's brief leaves out each reference "to the schema" and keeps the name "sprint contract". Whether the label "Schema 13" is such a reference is not settled by either brief; the source's words stay under "Where it is unclear whether an edit applies".
- `docs/figures/academic-pipeline/gen_academic_pipeline.py:137`, `"PRV": ("paper-review, entry 6", "todo")`, and `docs/roadmap.md`, entry 13's figure text "paper-review, entry 6 (not built yet)": outside this step's paths, and the brief's case requires the folder unchanged. They become false when entry 6 closes; the closing step's concern.
- `docs/figures/__pycache__/gen_figures.cpython-313.pyc` stands in the worktree and `git status --short` does not list it; `.gitignore` line 4 reads `__pycache__/`. Whether git ignores it by that line is not checked: `git check-ignore -v docs/figures/__pycache__/gen_figures.cpython-313.pyc` settles it.
- Whether the three things the source does not state (fresh agents, the run folder, the resumed second call) need an ADR of their own, as ADR 0043 holds `paper`'s: the plan's Rulings hold them now; the user's call.
- The 24 pages of step 1 are absent from this worktree. Each page and heading the new file names was checked against the source's pages and the heading texts the brief gives, not against step 1's output.

Reviewer usage: a915fb8ba1219bbe2, claude-fable-5-2, 232088 tokens, 24 tool uses, 6.3 minutes.

## Repair round 1, refuted

```
Round delta: diff -u <snapshot>/<path> <worktree>/<path> for the 8 paths of files.txt
  README.md, docs/dev/building.md, docs/dev/scripts.md, skills/academic/paper/SKILL.md: no difference
  docs/figures/gen_figures.py: 1 hunk (the note of paper_review(), Guided sentence)
  docs/figures/paper-review.svg: 1 hunk (the two note lines)
  docs/glossary.md: 1 hunk (panel review, "Stated in:")
  skills/academic/paper-review/SKILL.md: 9 hunks (Quick start x2 comments, What it reads 1, Steps 1 bullets, re-review item 1, guided item 1, calibration item 2, Agent prompts sentence, Stops x2 rows)
  git status --short: the same 8 paths as files.txt, plus the untracked round brief .scratch/6-paper-review/agents/briefs/2-round-1.md and reviews/2-report.md. No other path changed.

Verify 1, the character-set check over the step's 8 files (brief's command): no line printed; exit 0
Verify 2: python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
  ok: the plan-terms block equals the template   (exit 0)
Verify 3: NOT RUN (writes scratch directories); see Declined to judge
Case, contract ids:
  2
  reviewer/reviewer_full/v1 5 ['F1', 'F2', 'F3', 'F0']
  reviewer/reviewer_methodology_focus/v1 2 ['F1', 'F2', 'F0']   (exit 0)
Case, frontmatter: paper-review 532 {'version': '1.0.0'}   (exit 0)
Case: grep -n '^## ' skills/academic/paper-review/SKILL.md
  12 Quick start, 32 Use instead, 43 What it reads, 77 Steps, 256 Agent prompts, 280 Sprint Contract Protocol, 435 Review output, 453 Integration, 475 Quality standards, 489 Stops, 506 Anti-patterns, 520 Rules   (exit 0)
Case: grep -c 'sixteen' README.md -> 0 ; grep -c 'seventeen' README.md -> 2
Case, contracts equal to the two ledger files without baseline_version: True   (exit 0)
Case: git status --short docs/figures/academic-pipeline -> (no line); exit 0
  (python3 docs/figures/academic-pipeline/gen_academic_pipeline.py NOT RUN: it writes a file)
Verify 5: grep -nE 'v[0-9]+\.[0-9]+|deep-research|academic-pipeline|academic-paper|shared/|scripts/|docs/design|ARS|ars-|[Oo]rchestrator' skills/academic/paper-review/SKILL.md -> no line; grep exit 1
Case, figure: python3 docs/figures/gen_figures.py NOT RUN (writes). In its place, the module was imported in memory (python3 -I, bytecode off) and each (name, text) pair of figures() compared with the file on disk:
  20 []      (20 figures, none differing from disk)
  git status --short docs/figures -> " M docs/figures/gen_figures.py" and "?? docs/figures/paper-review.svg"
Anti-patterns 7 and Quality standards 9: unchanged by the round (no hunk touches those sections).
```

### Verdicts

Items of "What to build", `skills/academic/paper-review/SKILL.md`:

- Opening rule (carried with its words; nothing added beyond what the brief and rulings name): violated, Findings 1 and 2. The sentence of Spec 5 is gone, and the round's sentences are the six rulings' text.
- Frontmatter: holds (frontmatter case output above).
- Title and first paragraph: holds, no hunk.
- `## Quick start`: violated, Finding 2 (the comment of line 2 disagrees with Steps 1).
- `## Use instead`: holds, no hunk.
- `## What it reads`: holds. Item 1 now excepts calibration; item 2 still refuses a missing required input; item 1 and Steps 1 agree for calibration.
- `## Steps`, the lead: violated, Finding 2 (Quick start comment against the Steps 1 bullet). The three bullets of Steps 1, the Stops rows "Unknown mode" and "A missing input" agree with each other and with ruling 3.
- `### full`: holds, no hunk.
- Phase 2.5 point 3: holds, no hunk.
- `### re-review`, `### guided`, `### calibration`: holds. Each item that starts reviewers says no sprint contract holds (re-review item 1, guided item 1, calibration item 2), none names a stop of the contract, and guided "Done when" names the five reports and no `[PANEL-SHRUNK]`. Statements agree with `references/guided_mode_protocol.md`, `references/re_review_mode_protocol.md` and `references/calibration_mode_protocol.md`, each "v3.6.2 sprint contract status": "runs without contract enforcement".
- `### quick` and `### methodology-focus`: violated for quick, Finding 1. Methodology-focus holds (it names its two-call contract).
- The Socratic dialogues, a part carried once, a rule stated in several places, bold rows, "Done when" on each item: holds, no hunk against them.
- `## Agent prompts`: holds. The Spec 5 sentence is removed; the paragraph ends on "neither overrides the other."
- `## Sprint Contract Protocol`: holds (bullet 5 names the three reserved modes; see Finding 1 for quick).
- `## Review output`, `## Integration`, `## Quality standards`: holds, no hunk.
- `## Stops`: holds. The Reviewer Configuration row names full, quick, methodology-focus and guided; `[PANEL-SHRUNK]` names full and methodology-focus only; the two refusal rows agree with Steps 1 and What it reads 1.
- `## Anti-patterns`, `## Rules`, left out whole, no `##` outside the layout's order: holds.

Items of "The places that list the skills":

- `README.md`, `skills/academic/paper/SKILL.md`, `docs/dev/building.md`, `docs/dev/scripts.md`: holds, no hunk since the snapshot.
- `docs/glossary.md`: holds. The definition's words are unchanged; "Stated in:" reads `skills/academic/paper-review/SKILL.md`, the opening paragraph, and that paragraph states the panel and the Editorial Decision with the Revision Roadmap.
- `docs/figures/gen_figures.py` and `docs/figures/paper-review.svg`: holds. The note's Guided sentence now reads "the field analyst and the five reviewers, then the EIC's dialogue", which is what guided items 1 and 2 start. Re-review (field analyst, EIC, editorial synthesizer: modes-table row and item 1), quick (field analyst, EIC: items 1 and 2), methodology-focus (field analyst, EIC, methodology reviewer: items 1 and 2) and calibration (all seven, 5 times per gold paper: modes-table row) each agree with their steps. The svg's text equals the function's (in-memory comparison) and its note lines carry the new sentence. No other figure differs from disk.

Cases:

- Every `##` and `###` heading of the source placed: met, by reading; the round moved no section.
- 7 Anti-Patterns rows and 9 Quality Standards rows: met, no hunk in those sections.
- 7 Checkpoint Rules, each once; 8 bullets under the Devil's Advocate: met, no hunk in full items 2, 3, 5 or Rules.
- Contract ids; frontmatter; `##` headings; sixteen 0 and seventeen 2; contracts equal to the two files: met (outputs above).
- The academic-pipeline figure: not verifiable here (the script writes a file); `git status --short docs/figures/academic-pipeline` prints nothing.
- `gen_figures.py` writes only the new figure: not verifiable by its run; the in-memory comparison and `git status --short docs/figures` agree with the case.

### Findings

Spec

1. `skills/academic/paper-review/SKILL.md`, Steps, "quick", item 2: "Start the EIC, the second agent of the row `quick` of the modes table." and `## Sprint Contract Protocol`, bullet 5: "Reserved modes (`reviewer_re_review`, `reviewer_calibration`, `reviewer_guided`) have no contract and run without the two-call protocol."; what is wrong: quick starts a reviewer (the EIC) and neither the item nor the protocol section says whether a contract holds. The round gave re-review, guided and calibration the clause "with no sprint contract" and left quick without it. The builder's report states the omission as a point no ruling covers. The same file now says, for every other mode that starts a reviewer, whether a contract holds. Quick is the one that is silent, and the contract list (full and methodology-focus only, `references/sprint_contract_protocol.md`, the table of modes) is the only place that implies it has none; failure scenario: a session running `/paper-review quick paper.tex` reads full item 3 and the Sprint Contract Protocol bullet 1 ("All reviewer modes that ship with contracts...") and cannot tell from the file whether the EIC is started in two calls under the full contract or in one call; verdict: `### quick` violated, and the opening rule (mode items agreeing on contract status) partial for it.

2. `skills/academic/paper-review/SKILL.md`, Quick start, line 2: "the same review, with the mode named; a first word that is no mode name is taken as the manuscript"; what is wrong: Steps 1, bullet 2, says that a call whose first argument is one word that is neither a mode name nor an existing path, followed by an existing path, is the refusal "Unknown mode". Ruling 3 asks that the Quick start comments agree with it. The comment states the unqualified opposite; failure scenario: a user who reads only Quick start types `/paper-review fulll paper.tex` (a mistyped mode), expects it taken as the manuscript and gets the refusal "Unknown mode", or a session reading the comment as the rule runs `full` on the text "fulll paper.tex"; verdict: `## Quick start` and the Steps lead violated.

Proof

- none. Every command that writes nothing printed what the builder's Round 1 section says. The two figure-script lines and the `pin.test.sh` line of that section are under Declined to judge.

Standards

- none. The character-set check printed nothing; the grep for version tags and names that do not exist printed nothing; the round's sentences contain no history or date.

Behaviour

- none. Each user-visible change of the round (guided, re-review and calibration contract status, the "Unknown mode" and "A missing input" rules, calibration's call needing no manuscript, the figure note, the glossary's "Stated in:") is listed in the builder's "Per finding" and "Every sentence the round wrote".

### Declined to judge

- `utils/pin.test.sh` (`PASS: pin.sh scratch tests`) and the two figure scripts (`wrote docs/figures/paper-review.svg (12421 bytes)`, `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22040 bytes)`, their exit statuses): not run, since each writes files. The in-memory comparison of the 20 figures with disk stands in for the second; the two other lines are not reproduced.
- The rendered picture of `docs/figures/paper-review.svg`: its text was read, not looked at; the lengthened second note line (about 175 characters at font-size 11 in a 16px-margin canvas) is not checked for clipping at the canvas edge. A look at the rendered file settles it.
- Whether calibration item 2's "each reviewer in one call" is the page's wording: `references/calibration_mode_protocol.md` says the mode "runs without contract enforcement" and runs the standard full review pipeline 5 times; it does not say "one call". The clause follows from no contract but is not stated by the page.
- The point of the first refuter report left to the orchestrator (Reject decision and Phase 2.5; "Schema 13"; the second sense of "reviewer" in the glossary; the ADR for the three things; the pipeline figure's "paper-review, entry 6"): unchanged by the round and not re-judged.
- Whether Calibration runs the Reviewer Configuration stop (calibration item 2 says "the phases after the intake as that page gives them"; the Stops row for the Reviewer Configuration lists four modes without calibration): the page's text, not the round, decides; not checked further.

Reviewer usage: ab963ce95a5408f40, claude-sonnet-5-5, 111059 tokens, 15 tool uses, 1.7 minutes.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- Spec 1 (guided under the full contract): closed in the round, `SKILL.md`, Steps, "guided", item 1, which starts the five reviewers each in one call with no sprint contract.
- Spec 2 (the figure's note for guided): closed in the round, `docs/figures/gen_figures.py`, the note of `paper_review()`, and `docs/figures/paper-review.svg`.
- Spec 3 (pasted text refused as "Unknown mode"): closed in the round, `SKILL.md`, Steps 1 and the Stops row "Unknown mode".
- Spec 4 (calibration refused for a missing manuscript): closed in the round, `SKILL.md`, "What it reads", item 1.
- Spec 5 (the added sentence in "Agent prompts"): closed in the round, the sentence is removed.
- The glossary's "Stated in:" for **panel review**, declined by the first run: closed in the round, `docs/glossary.md`, which names the opening paragraph.
- Spec 1 of the run over round 1 (quick says nothing on the contract): fixed at landing, `SKILL.md`, Steps, "quick", item 2.
- Spec 2 of the run over round 1 (the Quick start comment against Steps 1): fixed at landing, `SKILL.md`, Quick start, the line of `full`.
