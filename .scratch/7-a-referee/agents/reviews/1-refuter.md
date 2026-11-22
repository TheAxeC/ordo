# Step 1 refuter report (on .agents/worktrees/7-a-referee-1, base 21f0793)

## Verification (rerun by the reviewer)

```
$ python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0

$ printf '%s\0' <the 13 files of the brief's check 1> | xargs -0 perl -CSD -ne '...'   (the brief's command, unchanged)
(no output)
exit 0

$ python3 docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (22107 bytes)
wrote docs/figures/plan-loop.svg (21454 bytes)
wrote docs/figures/grill.svg (7455 bytes)
wrote docs/figures/writing.svg (5191 bytes)
wrote docs/figures/paper-review-panel.svg (12433 bytes)
wrote docs/figures/referee.svg (11620 bytes)
wrote docs/figures/code-comments.svg (5921 bytes)
wrote docs/figures/paper/full.svg (43468 bytes)
wrote docs/figures/paper/revision.svg (27596 bytes)
wrote docs/figures/paper/lit-review.svg (22537 bytes)
wrote docs/figures/paper/outline-only.svg (14761 bytes)
wrote docs/figures/paper/abstract-only.svg (4733 bytes)
wrote docs/figures/paper/citation-check.svg (12264 bytes)
wrote docs/figures/paper/disclosure.svg (7245 bytes)
wrote docs/figures/paper/plan.svg (9415 bytes)
wrote docs/figures/paper/format-convert.svg (11257 bytes)
wrote docs/figures/paper/revision-coach.svg (6681 bytes)
wrote docs/figures/paper/rebuttal-audit.svg (5779 bytes)
wrote docs/figures/paper/response-letter.svg (5981 bytes)
wrote docs/figures/paper/lifecycle.svg (21010 bytes)
wrote docs/figures/paper/run-folder.svg (21112 bytes)
exit 0

$ git status --short docs/figures
 M docs/figures/gen_figures.py
?? docs/figures/referee.svg

$ python3 -c 'import yaml; d=yaml.safe_load(open("skills/academic/referee/SKILL.md").read().split("---")[1]); print(d["name"], len(d["description"]), d["metadata"]["version"])'
referee 882 1.0.0

$ grep -n '^## ' skills/academic/referee/SKILL.md
12:## Quick start
20:## Use instead
27:## What it reads
37:## Steps
103:## Stops
117:## Anti-patterns
126:## Rules

$ git status --short skills/academic/paper-review-panel
 M skills/academic/paper-review-panel/SKILL.md

$ git diff 21f0793 -- skills/academic/paper-review-panel/SKILL.md | grep -c '^+[^+]'
4
$ git diff 21f0793 -- skills/academic/paper-review-panel/SKILL.md | grep -c '^-[^-]'
3
(check 5's own `git diff --numstat` was not run; see "Declined to judge")

Commands the builder's report quotes:

$ find skills/academic/referee -type f | sort
skills/academic/referee/agents/referee_agent.md
skills/academic/referee/references/second_round.md
skills/academic/referee/SKILL.md
skills/academic/referee/templates/referee_report_template.md
skills/academic/referee/templates/selection_template.md

$ grep -n 'seventeen\|eighteen' README.md      (lines cut at 160 characters by the reviewer)
32:In the repository, each skill's folder stands in one of four group folders under `skills/`: ...
165:The loop copies each of the eighteen skills from its group folder into the folder of the list, ...
(two lines, 32 and 165, as the report says; line 32 holds "the eighteen skills" in the diff)

$ grep -rn 'seventeen' README.md docs skills utils
(no output)

$ grep -rln 'paper-review-panel' . (outside .git, .scratch, .agents, docs/adr and the two skill folders)
README.md
docs/roadmap.md
docs/glossary.md
docs/figures/paper-review-panel.svg
docs/figures/gen_figures.py
docs/figures/referee.svg
skills/academic/paper/SKILL.md
docs/dev/scripts.md
docs/figures/academic-pipeline/gen_academic_pipeline.py
docs/figures/academic-pipeline/academic-pipeline.svg
docs/dev/building.md
(the same 11 files the report lists)

$ grep -n 'referee review' skills/academic/referee/SKILL.md
10:`/referee <manuscript>` is the referee review of the glossary: ...   (one line, line 10)

$ grep -c 'round' skills/academic/referee/references/second_round.md
18

$ grep -n 'round' skills/academic/referee/SKILL.md | cut -d: -f1
3 15 16 17 31 32 35 39 41 43 44 45 46 47 48 51 52 54 98 99 100 109 110 111 112 113 115 128 130
(holds lines 39 to 47, 128 and 130, as the report says)

$ grep -n 'panel review' docs/glossary.md
149, 153, 156, 157 (the entry itself on 153, as the report says)

$ wc -l (the five skill files and docs/figures/referee.svg)
136 skills/academic/referee/SKILL.md
50 skills/academic/referee/agents/referee_agent.md
46 skills/academic/referee/references/second_round.md
31 skills/academic/referee/templates/referee_report_template.md
47 skills/academic/referee/templates/selection_template.md
63 docs/figures/referee.svg

$ ls -d skills/*/*/ | wc -l
18

Premises of the brief on the base:
$ git show 21f0793:README.md | grep -n 'paper-review-panel\|seventeen\|default agent with'
lines 29, 31, 71, 77, 124, 151, 162
$ git show 21f0793:skills/academic/paper/SKILL.md | sed -n '5p;69p'
  version: "4.1.1"
| Someone else's paper to review as its referee | `referee` (roadmap entry 7.A, not built yet) |
$ git show 21f0793:docs/glossary.md | grep -n 'referee review\*\*\|round, of an interview'
107 (round, of an interview), 156 (referee review)
$ git show 21f0793:skills/academic/paper-review-panel/SKILL.md | grep -n 'referee report'
3, 47
```

Every count, path and line number the builder's report gives was reproduced. The report's `git diff --numstat` figures agree with the added and removed lines of `git diff 21f0793 -- <path>` read by the reviewer (README 8 and 5, building 1 and 1, scripts 1 and 1, gen_figures 46 and 0, glossary 2 and 1, panel SKILL 4 and 3, paper SKILL 2 and 2).

## Verdicts

The files of the skill

- 1 `SKILL.md`: holds. Frontmatter `referee`, 882 characters, `1.0.0`; the description names no other skill and lists `/referee` with phrases for both rounds; the seven `##` sections are in the layout's order; the opening paragraph says referee review, neither a draft review nor a panel review; "Use instead" has the two rows asked.
- 2 `agents/referee_agent.md`: holds. Sections "The selection" and "The report".
- 3 `references/second_round.md`: holds. Named only from "What it reads" 7 and "re-review" item 1.
- 4 `templates/selection_template.md`: holds. Selected points, "Comments merged into this point", "Left-out comments", a count line.
- 5 `templates/referee_report_template.md`: holds. One `##` heading per field, the three default fields.

First round

- 1 the call, the two refusals: holds. "What it reads" 1 and 2, Steps 1, the two refusal rows of Stops. The round is settled here, as cases ruling 2 says.
- 2 the run folder: holds. Steps 2 and Rules.
- 3 the intake: holds. "first round" item 1, with the defaults balanced, medium, 7, 7 and 1,200, and `intake.md`. The round is not asked there, as cases ruling 2 says.
- 4 the field analyst and the card: holds. Items 2 and 3.
- 5 the reviewers: holds. Item 4, with the three ways a panel runs and `[PANEL-SHRUNK]`.
- 6 no synthesizer, roadmap or coaching: holds. Item 5 "Start no editorial synthesizer in its place", item 8 "Write no Revision Roadmap and hold no coaching dialogue", Anti-patterns row 4.
- 7 the selection: holds. Item 5 and `agents/referee_agent.md`, "The selection" 1 to 9 and its closing paragraph; each of the brief's seven bullets is there.
- 8 the selection stop: holds, with Standards finding 3 on what the session writes for a moved comment.
- 9 the report: holds. Item 7 and `agents/referee_agent.md`, "The report"; each of the brief's eight bullets is there.
- 10 the end of the run: holds. Item 8. `left-out.md` is written at the selection ("The selection" 9) and rewritten at item 6.

Second round

- 1 the inputs: holds. `references/second_round.md` item 1; the refusal at Steps 1.
- 2 the intake: holds. Item 2.
- 3 the check of the revision: holds as the brief words it, with Standards findings 1 and 2 on what the EIC is given and on the protocol sections it is pointed at.
- 4 all five on request: holds. Item 5, with the fresh EIC of cases ruling 3.
- 5 the selection, stop and report: holds, with Standards finding 4 on the resolved points.

The rules of the skill

- The run folder: holds. Rules bullets 1 to 3.
- Each output a file of its own: holds. Rules bullet 4.
- Fresh agent, runner's defaults, no model, no effort: holds. Rules bullets 5 and 6.
- The read-only rule and the untrusted-materials rule named by section: holds. Rules bullet 8; both rule names stand in the panel's Rules.
- Someone else's manuscript: holds. Rules bullet 9.
- Stops and Anti-patterns: holds. Stops has the intake, the Reviewer Configuration, the selection, `[PANEL-SHRUNK]`, the two refusals, and "The round" from cases ruling 2; Anti-patterns has the four rows.

The places that list a skill

- 1 `README.md`: holds. All seven sub-items are in the diff.
- 2 `gen_figures.py`: holds. `referee()` after `paper_review_panel()`, the same helpers, the head comment, the tuple; ASCII.
- 3 `referee.svg`: holds. Written by the run; `git status --short docs/figures` lists the two files only.
- 4 `building.md` and `scripts.md`: holds.
- 5 `docs/glossary.md`: holds as cases ruling 1 changed it. "Stated in" of **referee review** changed, the definition's words kept; the new entry stands after **results check**, outside the block; **round, of an interview** unchanged.
- 6 `skills/academic/paper/SKILL.md`: holds. The words removed, `4.1.2`.
- 7 `skills/academic/paper-review-panel/SKILL.md`: holds. The phrase removed in both places with its comma, the row added, `1.0.1`, 4 lines added and 3 removed, no other line.

Cases

- `/referee paper.pdf` with the panel skill: met.
- No panel folder: met.
- `re-review` with no response letter: met.
- An intake with nothing named: met.
- Panel shrunk to the EIC and the methodology reviewer: met.
- Panel shrunk to the methodology and the domain reviewer: met.
- 60 comments, the default budget: met.
- The user moves a left-out comment: met (see Standards finding 3 for the passage and the reason).
- The report shows no panel and holds no roadmap: met.
- Second round, the all-five question unanswered: met.
- Second round without the first-round comments: met.
- Both folders read side by side: partial, Spec finding 1.

The rulings

- The step list: not a matter of the skill's text.
- A small skill on the panel's pages: carried out. Five files; every panel page named with its skill ("first round" items 2 to 4, `second_round.md` item 4); no page copied (Spec finding 1 is two step lines).
- The last step selects: carried out. `agents/referee_agent.md`, "The selection" and "The report" bullets 1 to 3; "first round" items 5 to 7.
- An intake direction: carried out. Item 1 first bullet; item 2 gives it to the field analyst; "The selection" 4.
- All five by default: carried out. Item 1 fifth bullet; item 4.
- A stop before the writing: carried out. Item 6 and the Stops row "The selection".
- The left-out comments are kept: carried out. "The selection" 8 and 9, item 6, Rules bullet 4.
- A default budget: carried out. Item 1 third bullet, 7, 7 and 1,200, changed at the intake.
- What the intake asks: carried out for the severity, the fields and the length limit (item 1). The question of the round is at Steps 1 and the stop "The round", outside the intake, by cases ruling 2; see "Declined to judge".
- How the panel's pages are found: carried out. The naming form throughout; "What it reads" 1 and the refusal "The panel skill is not installed".
- The call: carried out. Quick start lines 1 and 2.
- The run folder: carried out. Rules bullet 1.
- The journal's fields by default: carried out. `templates/referee_report_template.md`; "The report" first bullet.
- What the second round runs: carried out. `second_round.md` items 2, 4, 5 and 6.
- Open item 1, ruled (a): carried out. The three changes to the panel's `SKILL.md`.

## 1. Spec

1. `skills/academic/referee/SKILL.md`, Steps 2 and 3. Names the verdict "partial" of the case "Both folders read side by side".

   ```
   2. Make the run folder, named and placed as Rules gives it.
      - Done when the run folder exists and is empty.
   3. Run the items of the round, under its heading below.
      - Done when the last item of the round is done.
   ```

   The panel's `SKILL.md`, Steps 2 and 3, reads the same, with "mode" where this has "round". Item 2 with its Done bullet is two sentences word for word, which is a passage longer than a sentence under the brief's "no part of one longer than a sentence, is copied". These two lines stand in no other skill (`grep -rn 'Make the run folder, named and placed as Rules gives it' skills --include=SKILL.md` prints the panel and `referee` only). No other shared run longer than a sentence was found: the other shared word runs are single Done lines, the two table headers of the layout, and the cells of the Stops row "The Reviewer Configuration". The copied lines are the step skeleton, not a role's or a protocol's content. Failure scenario: the gate's reader, holding the folders side by side as the gate asks, finds a two-line run of the panel in `referee` and cannot pass the clause as the brief words it. The builder's report states the shape was taken from the panel (judgment call 1) and reports the case as "No page is copied" without naming these lines.

## 2. Proof

none

## 3. Standards

1. `skills/academic/referee/references/second_round.md`, "The check of the revision", item 4. A step an agent could not carry out as written. No verdict changed.

   ```
   4. Start the EIC from the `paper-review-panel` skill's `agents/eic_agent.md`, in one call, with no contract.
      - Give it the revised manuscript, the response letter, the first-round comments when the call gave them, and its card.
      - It checks each first-round point against the revised manuscript and the response, as the `paper-review-panel` skill's `references/re_review_mode_protocol.md` gives it in "Verification Logic", "Commitment Ledger Verification" and "New Issue Detection".
   ```

   The "Give it" list leaves out the protocol page, and the EIC's page does not name it: `grep -n 're_review\|re-review\|Re-Review' skills/academic/paper-review-panel/agents/eic_agent.md` prints nothing, and that page's "Phase Boundary" says "Your sole deliverable is the EIC Review Card". Every other step of the skill lists each page it gives (item 5 of "first round" lists the template). Failure scenario: a session gives the EIC exactly the four things listed; the EIC, holding only its page, writes its ordinary EIC review of the revised manuscript, and no status per first-round point exists for the selection to read.

2. `skills/academic/referee/references/second_round.md`, item 4, the same hunk and its next bullet "The first-round points stand where that page has the Revision Roadmap." A step an agent could not carry out as written. The brief dictates the three section names (second round item 3), so the substitute is the orchestrator's. No verdict changed.

   "Verification Logic" works on "Priority 1 (Required)", "Priority 2 (Suggested)" and "Priority 3 (Nice to Fix)" items; a referee's first-round points are major and minor, and no text maps one to the other. "Commitment Ledger Verification" runs "for every Schema 11 row (any priority) that carries a non-empty `commitment_extracted` list from the revision coach's Step 3.5"; a referee run has no Schema 11 row and no revision coach. Failure scenario: the EIC is given a referee's seven major and seven minor points and a response letter; it must guess which points get the Priority 1 traceability rule, and for the commitment section it either skips it or makes up commitments to verify.

3. `skills/academic/referee/SKILL.md`, "first round" item 6, with `agents/referee_agent.md`, "The report". A step an agent could not carry out as written. No verdict changed.

   ```
   - Write the user's changes into `selection.md`.
   - Rewrite `left-out.md` so that it holds exactly the comments not selected, each with its reason.
   ```
   ```
   - Tie each point to its passage, as `selection.md` has it.
   ```

   A left-out comment stands in `selection.md` as a table row with a phrase and a reason, with no passage and no grade. When the user moves it into the selected points, nothing says who writes its Passage line or whether it becomes a point of its own or joins one, and the referee is then told to take the passage "as `selection.md` has it". In the other direction, a selected point the user moves out puts its merged comments into `left-out.md` "each with its reason", and no text says what reason the session writes. Failure scenario: the user moves left-out comment 12 into the major points; the session adds a heading with the phrase only; the report holds that point with no passage, against the goal's "each tied to the passage it is about".

4. `agents/referee_agent.md`, "The report", against `references/second_round.md`, "The selection and the report". Two places that say different things. No verdict changed.

   ```
   - Write from the selected points only. No left-out comment is in the report.
   ```
   ```
   - Each selected point says, in its Status line, whether it is a first-round point not resolved, a first-round point resolved in part, or a new point of the revision.
   - The report says, in its general comments, which first-round points the revision resolved.
   ```

   A first-round point the revision resolved is a listed comment ("each first-round point with its status"), and the Status line has no value for it, so it can only stand among the left-out comments; the report must then name it, while the first bullet keeps every left-out comment out of the report. Failure scenario: the referee, resumed in a second round, follows the first bullet and writes general comments that do not say which first-round points were resolved.

Non-ASCII: none (the character-set check prints nothing). History in the text: none found. Sentences made false by the diff: none found in the greps of `referee`, `seventeen`, `paper-review-panel` and the lists of skills across `README.md`, `docs/`, `skills/` and `utils/`.

## 4. Behaviour

none. Each user-visible change in the diff is in the report's "User-visible changes" with its before and after.

## Declined to judge

- `git diff --numstat -- skills/academic/paper-review-panel/SKILL.md` (the brief's check 5) and `git diff --numstat -- README.md docs skills` (the report): not run, since they are outside the three git commands allowed. The added and removed lines were counted from `git diff 21f0793 -- <path>` instead and agree.
- The step line's "the verify list of `docs/dev/building.md` passes": only the brief's checks 1 to 5 were run; the whole list runs at landing through `sh skills/orchestration/land/templates/checks.sh <state file>`.
- Whether the user's ruling "What the intake asks" is met when the round is asked at Steps 1 and never inside the intake: cases ruling 2 is the orchestrator's, the ruling is the user's, and the call forms the user ruled already give the round. The user's call.
- The glossary now holds two statements on the bare "round": **round, of an interview** says "elsewhere it is a repair round", and the new entry says the bare "round" in `referee` means a referee review's round. Cases ruling 1 keeps the first unchanged; whether rule 19 of the rules file accepts that is the orchestrator's or the user's.
- "reviewer" used for a reviewer of the panel and for the referee, which is not the sense of the glossary entry **reviewer**. The brief dictates the word and the entries **panel review** and **referee review** use it so; a vocabulary is the user's.
- The trigger phrases the panel keeps ("review paper", "peer review", "manuscript review") beside the referee's "I was asked to review this manuscript" and "review a submission for a journal": the user's ruling (a) removed "referee report" only.
- The patch version `1.0.1` of the panel for a removed trigger phrase: the brief's decision 10.
- The brief's check 6: the builder's list of departures from the list and sentence-length rules was read, and the new sentences were not measured one by one.
- `docs/figures/referee.svg` was read as text (its title, labels, note and paths); it was not opened as an image.
- `docs/roadmap.md`, the entry 7.A, and the "Stated in" of **panel review**, which still names that entry: outside the step's paths.
- Whether a run of the skill gives a good report: step 2's, with the user.
- ADRs: 0043 was read in full; of the others, the lines naming `paper-review-panel`, a figure, `README.md`, the skill layout or the glossary were read (0001, 0019, 0022, 0025, 0027, 0035 and the grep hits in 0004 and 0036 to 0042), and none decides the panel's `SKILL.md`, a skill's figure or `referee`. They were not each read whole.

Reviewer usage: ade192054e78b1aaa, claude-fable-5-2, 216060 tokens, 26 tool uses, 9.6 minutes.
