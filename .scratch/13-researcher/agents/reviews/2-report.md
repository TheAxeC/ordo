Everything in the brief is done. Five places in copied pages that the brief does not let me change contradict `SKILL.md` on ruling D5 or on decision 6 of the brief; they are handed back under "Hand-backs" with file and line.

# Report of step 2: the modes `integrity` and `manuscript` of `researcher`

## Open items of the state file, verbatim

From `.scratch/13-researcher/orchestrator-state.md`, section "Open items":

- none.

## The cases' first run, on the unchanged tree (b5dbf2b plus the worktree's launch commit)

| Case | Command or reading | Output as printed on the unchanged tree |
|---|---|---|
| yaml check | `python3 -c 'import yaml; d=yaml.safe_load(open("skills/academic/researcher/SKILL.md")...'` | `FileNotFoundError: [Errno 2] No such file or directory: 'skills/academic/researcher/SKILL.md'` |
| `##` headings | `grep -n '^## ' skills/academic/researcher/SKILL.md` | `ugrep: warning: skills/academic/researcher/SKILL.md: No such file or directory` |
| Quick start block | reading | not met: no `SKILL.md` |
| `/researcher integrity <main.tex>` through the Steps | reading | not met: no `SKILL.md` |
| `/researcher integrity pre-review <main.tex>` | reading | not met: no `SKILL.md` |
| `/researcher manuscript <project folder>` | reading | not met: no `SKILL.md` |
| `/researcher manuscript <main.tex>` | reading | not met: no `SKILL.md` |
| `/researcher manuscript <main.tex> <comments file>` | reading | not met: no `SKILL.md` |
| compliance agent and failure-mode checklist | reading | not met: no `SKILL.md` |
| Stage 3 and Stage 3' decisions | reading | not met: no `SKILL.md` |
| FAIL of `integrity` alone | reading | not met: no `SKILL.md`; `agents/integrity_verification_agent.md` "Correction Process on FAIL" step 2 had the agent send the list to `/paper revision` |
| FAIL at the final check | reading | not met: no `SKILL.md` |
| project with no record of the experiments | reading | not met: no `SKILL.md` |
| exclusion grep | `grep -niE 'claim_ref\|...\|Stage 6' skills/academic/researcher/SKILL.md` | `ugrep: warning: skills/academic/researcher/SKILL.md: No such file or directory` |
| every named path exists, every page named | reading | not met: no `SKILL.md` |
| `SKILL.md` pointers | `grep -rn 'SKILL.md' skills/academic/researcher --include='*.md'` | hits: `compliance_checkpoint_protocol.md:10`, `handoff_schemas.md:298`, `:712`, `:722`, `score_trajectory_protocol.md:36` (these name no heading of `researcher`'s `SKILL.md`); `two_stage_review_protocol.md:11`, `:24` and `pipeline_orchestrator_agent.md:338` (the `paper-review-panel` skill's `SKILL.md`); `artifact_reproducibility_pattern.md:40`, `:62`, `:94` (the hash of a skill's `SKILL.md`, `metadata.version`); `state_tracker_agent.md:66`, `:258` (`metadata.version`) |
| ADR 0052 point by point | reading | not met: no `SKILL.md` |
| `gen_figures.py` | `python3 docs/figures/gen_figures.py`, then `git status --short docs/figures` | exit 0, last lines `wrote docs/figures/paper/response-letter.svg (5981 bytes)`, `wrote docs/figures/paper/lifecycle.svg (21064 bytes)`, `wrote docs/figures/paper/run-folder.svg (21112 bytes)`; status empty, no `researcher.svg` |
| `gen_academic_pipeline.py` | `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` | exit 0, `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22016 bytes)`, status empty; the box reads "researcher, entry 13: integrity and ethics checks, the stage loop", drawn as not built |
| README researcher | `grep -n researcher README.md` | no hit |
| README count | `grep -n 'twenty-three' README.md` | lines 37 and 176 |

No case's rules were wrong on the unchanged tree, so nothing was handed back before the change.

## DONE / NOT DONE

| # | Item or check | Status | Output as printed |
|---|---|---|---|
| 1 | `SKILL.md` in the layout | DONE | `grep -n '^## '`: `12:## Quick start`, `22:## Use instead`, `38:## What it reads`, `56:## Steps`, `178:## The integrity check`, `211:## Checkpoints`, `238:## Stops`, `271:## Anti-patterns`, `284:## Rules` |
| 1 | frontmatter | DONE | `researcher 1010 {'version': '1.0.0'}` |
| 2 | what the two modes do | DONE | read below under "Cases after the change" |
| 3 | Stops | DONE | 26 rows, the last five the refusals |
| 4 | Anti-patterns and Rules | DONE | 8 rows; 22 Rules bullets |
| 5 | copied pages | DONE | diff below under "Visible changes" |
| 6 | README | DONE | `grep -n researcher README.md`: lines 34 (row), 38 (list of `skills/academic/`), 78 (the agents sentence), 88 (figure line), 168 (install loop); `grep -n 'twenty-three' README.md`: no hit, exit 1 |
| 7 | `researcher.svg` | DONE | `python3 docs/figures/gen_figures.py`: exit 0, `wrote docs/figures/researcher.svg (33149 bytes)` |
| 8 | academic-pipeline figure and roadmap line 29 | DONE | `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22636 bytes)`, exit 0 |
| 9 | `building.md` line 41, `scripts.md` line 9 | DONE | both list `researcher.svg` after `codebase-design.svg` |
| 10 | paper row and version | DONE | `version: "5.0.1"`; row below |
| 11 | Deviations and map | DONE | section "Deviations" |
| V1 | character set over the changed files | DONE | `(git diff --name-only; git ls-files --others --exclude-standard) \| sort -u \| tr '\n' '\0' \| xargs -0 perl -CSD -ne '...'` printed nothing, `perl exit 0` |
| V2 | `LC_ALL=C grep -n '[^ -~]' skills/academic/researcher/SKILL.md` | DONE | printed nothing, exit 1 |
| V3 | both scripts and `git status --short` | DONE | `gen_figures exit 0`, `pipeline exit 0`; status lists `M README.md`, `M docs/dev/building.md`, `M docs/dev/scripts.md`, `M docs/figures/academic-pipeline/academic-pipeline.svg`, `M docs/figures/academic-pipeline/gen_academic_pipeline.py`, `M docs/figures/gen_figures.py`, `M docs/roadmap.md`, `M skills/academic/paper/SKILL.md`, the six copied pages, `?? docs/figures/researcher.svg`, `?? skills/academic/researcher/SKILL.md`: all in "Paths this step writes" |
| V4 | description lengths | DONE | `1010 skills/academic/researcher/SKILL.md`; every other skill unchanged (paper 994) |
| V5 | the greps of Cases | DONE | below |
| V6 | own wording against the list and sentence rules | DONE | below under "Own wording read against the standards" |

### Cases after the change

- yaml check: `researcher 1010 {'version': '1.0.0'}`.
- `##` headings: Quick start, Use instead, What it reads, Steps, two reference sections ("The integrity check", "Checkpoints"), Stops, Anti-patterns, Rules, in that order. Both reference sections hold matter every run reads: each run of either mode runs at least one integrity check and holds checkpoints, which the layout's row 6 and "Writing for an agent" require.
- Quick start: the five lines of Open item D, each with its comment, no other mode.
- `/researcher integrity <main.tex>`: Steps 1 (Mode 2, full depth), 2 to 5, then `### integrity` 1, which runs "The integrity check" as Stage 4.5; that section's item 1 runs Phase A to E and the ethics check as Phase F, the last part; item 1 writes `integrity-4.5-1.md` into `researcher-runs/integrity-<date>/` (Steps 3). No step of the mode writes a file of the manuscript; a change reaches it only through `/paper revision` after a FAIL.
- `pre-review`: the same with Mode 1 and Stage 2.5, the same folder name `integrity-<date>`.
- `/researcher manuscript <project folder>`: Steps 1 sets Stage 2; `### manuscript` items 3 to 9 run Stage 2, 2.5, 3, 4, 3', 4', 4.5, in the order of `references/pipeline_state_machine.md` (item 1), each run of `paper` and `paper-review-panel` "through the Skill tool, with its own stops"; each stage is followed by a checkpoint (item 1, bullet 2, and "Checkpoints"), each a row of Stops.
- `/researcher manuscript <main.tex>`: Steps 1 sets Stage 2.5, "which a draft that enters midway never skips"; Steps 5 says a prior integrity report "informs the first check and never replaces it". No path enters at Stage 3 or 4 without Stage 2.5.
- `/researcher manuscript <main.tex> <comments file>`: Steps 1 sets Stage 2.5, then Stage 4 with the comments file, per the row "INIT, Stage 4"; the Stops row "The checkpoint after Stage 2.5" resumes "to Stage 4 with a comments file", and item 5 runs Stage 3 only "for a call with no comments file".
- compliance agent and checklist: "The integrity check" item 1 asks the integrity agent to run the checklist at its stage; item 2 starts the compliance agent after it; item 4 makes each block a stop, rows "The failure-mode block" and "The compliance block" (the three choices and the override, with the addendum to `/paper revision`). The section runs in both modes.
- Stage 3 and 3': item 5 and the row "The review decision": Accept to 4.5, Minor or Major to 4, Reject to Stage 2 or the end. Item 7 and the row "The re-review decision": Accept or Minor to 4.5, Major to 4'. Item 8 runs Stage 4' once, then 4.5; Rules: "At most one Stage 4' runs, and after it the run goes to Stage 4.5 with no return to a review."
- FAIL of `integrity` alone: "The integrity check" item 5: the session writes `corrections-<stage>-<n>.md` and invokes `/paper revision` with it, at most 3 rounds, then the stop "The third correction round failed".
- FAIL at the final check: the same item at Stage 4.5, done only at PASS with zero issues (`### manuscript` item 9).
- no record of the experiments: Steps 4 and the row "The record of the experiments": asked once, the record built with the user and written to `experiment-record.yaml`.
- exclusion grep: printed nothing, `exclusion grep exit 1`.
- every named path: a loop `for f in $(grep -oE '(agents|references|examples|templates)/[A-Za-z_]+\.(md|py|yaml)' SKILL.md | sort -u); do [ -f "$f" ] || echo "MISSING $f"; done` printed `MISSING agents/citation_compliance_agent.md` and `MISSING templates/lookup.py`; both are named in `SKILL.md` as files of the `paper` skill ("the `paper` skill's `agents/citation_compliance_agent.md`", "the `paper` skill's `templates/lookup.py`") and exist there. Every one of the 27 pages is named in `SKILL.md` (a `grep -c -F` per page printed 1 or more for each). Four pages are named only in "What it reads" 11 and 12, the lists of pages an agent is given, which "The integrity check" items 1 and 2 hand over at the step: `references/integrity_review_protocol.md`, `references/claim_verification_protocol.md`, `references/prisma_trAIce_protocol.md`, `references/raise_framework.md`.
- `SKILL.md` pointers: `compliance_checkpoint_protocol.md:10` names "The integrity check" items 2 and 4; `handoff_schemas.md:298` and `score_trajectory_protocol.md:36` name Steps, "manuscript" item 7; `handoff_schemas.md:712`, `:722` say where the two values stand; `reinforcement_content.md:3` names Steps, "manuscript" item 2; `pipeline_orchestrator_agent.md:216` names Steps 5; `state_tracker_agent.md:66`, `:258` and `artifact_reproducibility_pattern.md:62` read `metadata.version`, which the frontmatter has. The other hits point at the `paper-review-panel` skill's `SKILL.md` or at the hash of a `SKILL.md` file.
- ADR 0052: below.
- `gen_figures.py`: exit 0; `git status --short docs/figures` lists `M docs/figures/gen_figures.py`, `?? docs/figures/researcher.svg`, and the two files of `academic-pipeline/`; no other figure changed.
- `gen_academic_pipeline.py`: exit 0; the box reads "researcher: the integrity and ethics checks, and the manuscript mode that runs the stages", kind `paper` (teal, built, no roadmap entry); Stage 1 goes to "researcher research, entry 13", kind `todo`, with a dotted arrow; 2.5 and 4.5 arrows are solid. I read the rendered PNG to confirm.
- README: row (34), figure line (88), install loop (168), line 37 (now 38, the list of `skills/academic/`); line 78 also names `researcher`, since the sentence on what each figure skill launches now lists its two agents.
- `twenty-three`: no hit.

### Own wording read against the standards

`SKILL.md` has 1 semicolon in 6185 words (`grep -c ';'` printed 1, `wc -w` 6185), inside the description. Each bullet holds one rule; where two rules had shared a bullet, they are two bullets (the run-folder rules, the wording rule and its scientific-claim rule, the null-result rule and its FAIL rule, the revision cap and its relation to `paper`'s cap). A script count of sentences over 30 words listed 25 before the split pass; these long items remain, each with why its form is needed:

- Items that name a page and its heading in full (for example `references/two_stage_review_protocol.md`, "Stage 3': Second Review (Verification Review)"): the heading is quoted as written so the reader opens the right part; the length is the heading.
- "What it reads" 5 to 7: the sibling-folder phrase is the one `paper` and `referee` use, word for word.
- Steps 5, the configuration form of `manuscript`: the list of the four runs of each stage is one list the user is shown.
- Rules, the wording rule: the list of what the manuscript text never holds is the ruling's list (D24), kept whole.
- The Quick start comments and the Stops cells are phrases, not sentences.

## Terms

- **refusal** (`docs/glossary.md` line 102): used for the five rows that end the skill with no decision for the user; they name their cause and leave nothing. Matches the entry.
- **stop** (line 130): used in the layout's sense of a row of Stops, as `paper` and `referee` use it. The entry's part on an open item in the state file holds for a plan, not for a skill run; no new sense is added.
- **orchestrator** (line 75): `SKILL.md` does not use the bare term; it names the session and the role page `agents/pipeline_orchestrator_agent.md`. The copied pages keep "the orchestrator" for the pipeline's role, which the session holds (Rules, first bullet).
- **session**: no glossary entry; used for the Claude Code session that runs the skill, as in `paper`.
- No glossary entry is added or changed.

## Files with line counts

| File | Lines (`wc -l`) or diff (`git diff --numstat`) |
|---|---|
| `skills/academic/researcher/SKILL.md` | 307, new |
| `skills/academic/researcher/agents/integrity_verification_agent.md` | +3 -2 |
| `skills/academic/researcher/agents/pipeline_orchestrator_agent.md` | +4 -7 |
| `skills/academic/researcher/references/compliance_checkpoint_protocol.md` | +1 -1 |
| `skills/academic/researcher/references/handoff_schemas.md` | +3 -3 |
| `skills/academic/researcher/references/reinforcement_content.md` | +1 -1 |
| `skills/academic/researcher/references/score_trajectory_protocol.md` | +1 -1 |
| `skills/academic/paper/SKILL.md` | +2 -2 |
| `README.md` | +7 -4 |
| `docs/roadmap.md` | +1 -1 |
| `docs/dev/building.md` | +1 -1 |
| `docs/dev/scripts.md` | +1 -1 |
| `docs/figures/gen_figures.py` | +99 -0 |
| `docs/figures/researcher.svg` | new, 33149 bytes |
| `docs/figures/academic-pipeline/gen_academic_pipeline.py` | +6 -5 |
| `docs/figures/academic-pipeline/academic-pipeline.svg` | +25 -22, 22636 bytes |

## Deviations

Differences of `skills/academic/researcher/SKILL.md` from the source's `SKILL.md` (academic-pipeline 3.13.0), in the columns of `.scratch/13-researcher/deviations.md`.

| Source has | `researcher` has | Reason | Ruled by |
|---|---|---|---|
| frontmatter `last_updated`, `depends_on`, `status`, `data_access_level`, `task_type`, `related_skills` | `name`, `description`, `metadata.version: "1.0.0"`; the two values stated in `references/handoff_schemas.md` | the layout's frontmatter | forced: `docs/dev/skill-layout.md` Frontmatter; brief decisions 1 and 4 |
| title with a version, the "v2.0 Core Improvements" list, version notes, routing-discipline note | a title and one paragraph | no history; the layout's row 1 | forced: change standard, skill layout |
| Quick Start as three sample requests and `resume_from_passport` | five command lines with comments | the layout's Quick start; the reset boundary left out | Open item D; Open item A |
| Trigger Keywords, Non-Trigger Scenarios, Trigger Exclusions | the description's `Triggers on:` and the Use instead table with this repository's skills | the layout | forced: skill layout; brief item 1 |
| "Execution flow" list | Steps 1 to 6 and the mode subsections | the layout's Steps | forced: skill layout |
| 10 stages, with Stage 1, 5 and 6 | Stages 2, 2.5, 3, 4, 3', 4', 4.5 | the parts the goal names | D16; ADR 0052 |
| Stage 2 in plan or full mode, Stage 3 full | `/paper full`, `/paper-review-panel full`, `/paper revision`, `/paper-review-panel re-review`, fixed | the runs of the stages | D5 |
| Step 2 mode recommendation by user type (socratic, plan, guided, quick) and the quality standard "Mode recommendation" | Steps 5: the fixed runs shown with the differences between depths and runs explained, and the user's adjustments within those runs | D5 fixes the runs, so the recommendation can only explain them | D5 |
| the parallelization note on Stage 2 | left out | it describes the phases inside `paper`'s full mode, which `/paper full` runs with its own rules | D5 |
| Step 1 detection: no materials to Stage 1, revised draft to Stage 3', final draft to Stage 5, verified paper to Stage 3 | the five command lines; a draft of any kind enters at Stage 2.5; a call matching no line is the stop "The entry point" | Stage 1 and 5 left out; Stage 2.5 never skipped | D4, D16, Open item D |
| Mid-entry exception: a previous integrity report with unmodified content skips Stage 2.5 | a prior report informs the first check and never replaces it | D4 | D4 |
| the orchestrator and the state tracker as agents dispatched | the session holds both roles and starts no agent for them | only the session can invoke a skill through the Skill tool, and it writes the state | D5, D6; brief decision 2 |
| the run's state in the Material Passport only | `state.json`, each integrity record, each compliance report and each correction list as files of `researcher-runs/<mode>-<date>/` | D6 | D6; brief decision 5 |
| integrity corrections dispatched to academic-paper | the issue list written to `corrections-<stage>-<n>.md` and given to `/paper revision` as its comments | D5 | D5 |
| the compliance override's disclosure addendum injected by the orchestrator | the addendum goes to `/paper revision` as its comment | every change to the manuscript goes through `paper` | D5; brief decision 6 |
| Stage 4.5 FAIL: "fix and re-verify" with no count in the state machine list | at most 3 correction rounds, then the user decides | D3 | D3 |
| "Integrity Review Protocol: 5 phases" | the integrity agent's six phases, the ethics check Phase F last, at both depths | D17 | D17 |
| references checked by the agent's own lookups | `lookup.py resolve`, confirmed at a ratio of 0.70 or above with no `DOI_MISMATCH`; a judged claim on a passage read in the run, checked with `lookup.py quote-check`; the web originality screen at both depths | D1, D14, D21 | D1, D14, D21; ADR 0024 |
| no record of the experiments step | Steps 4: the record read from the project, or asked once and built with the user | D31 | D31 |
| no null-result rule | Rules: no correction or record asks that a recorded null result be written in; a claim contradicting `negative_results[]` is a FAIL | D20 | D20 |
| no wording rule | Rules: the corrections and record text that reach the manuscript hold no software wording | D24 | D24; ADR 0026 |
| Anti-pattern 7, inflating Collaboration Quality scores | left out | the collaboration observer and Stage 6 are left out | D16 |
| Anti-pattern 8: overrides "recorded for Stage 6"; the IRON RULE's Stage 6 failure-mode audit log | overrides recorded with the user's reasons in `state.json` | Stage 6 left out | D16, D6 |
| Adaptive rule 5 and the MANDATORY checkpoint "Stage 5" | left out | Stage 5 left out | D16 |
| Budget transparency: the cross-model toggle in the estimate; confirmation "before Stage 1" | estimate from length and mode; confirmation before the first stage | the cross-model check and Stage 1 left out | D16 |
| Error Recovery rows Stage 1 and Stage 2 "missing research foundation" | left out | they send the user to Stage 1 | D16 |
| Error Recovery row "Any: skill execution failure: retry, pause or mode switch" | the row "A run that fails": retry or pause | a mode switch leaves D5's runs | D5 |
| Phase-by-phase Invocation Contract (Mode A, Mode B, phase buckets, `ARS_PASSPORT_RESET`) | left out; the session runs the stages end to end (Mode A's content in Rules) | Mode B rests on the reset boundary | Open item A |
| Stage 6, Collaboration Depth Observer, claim audit, cross-model check | left out | D16 | D16 |
| Agent File References, Reference Files, Templates, Examples tables | "What it reads" 9 to 14, each page named at the step that reads it | the layout's "What it reads" and pointer rules | forced: skill layout; Open item B |
| Integration with Other Skills, Related Skills (deep-research, academic-paper, academic-paper-reviewer, Stage 5 formatting steps) | Use instead, Rules on the four runs, and the refusals "A skill not installed" and "lookup.py not found" | names of this repository; Stage 5 left out | Open item B, D5, D16 |
| Version Info, Changelog | `metadata.version` only | no history | forced: change standard |
| the reinforcement template with an emoji, a box arrow and an em dash | the same template in ASCII (`->`, `-`), in a code block | ASCII | forced: prose standard |
| the decision dashboard block with box-drawing rules | pointed at in `agents/pipeline_orchestrator_agent.md`, "FULL Checkpoint Template (with Decision Dashboard)", where the copied page holds it in ASCII | one meaning in one place | forced: skill layout "Where a rule goes" |
| Checkpoint Types and Adaptive Rules 1, 3, 4, 6 written in `SKILL.md` | pointed at in `agents/pipeline_orchestrator_agent.md`, "3. Checkpoint Management", which states them; Checkpoint Rules 1 to 5 and the self-check questions written out in "Checkpoints" | a rule a copied page states in full is pointed at | forced: skill layout "Writing for an agent"; brief item 2 |

### Map of the source's headings

| Source heading | Where its matter stands now |
|---|---|
| Quick Start | `## Quick start`; the sample requests become command lines; `resume_from_passport` left out (Open item A) |
| Trigger Conditions | the description's `Triggers on:`; `## Use instead` |
| Trigger Keywords | `Triggers on:` (academic pipeline, full paper workflow, take my draft through review and revision; the research-only phrases left out with Stage 1) |
| Non-Trigger Scenarios | `## Use instead` rows (`paper lit-review`, `paper`, `paper-review-panel`, `paper citation-check`, `paper format-convert`) |
| Trigger Exclusions | `## Use instead` (a run of a mode already under way; a single function) and Steps 1, last bullet but one |
| Pipeline Stages (10 Stages) | the title paragraph; `### manuscript` items 3 to 9; Stage 1, 5, 6 left out (D16) |
| Pipeline State Machine | `### manuscript` item 1, pointing at `references/pipeline_state_machine.md`; the branches in items 5 and 7 and the Stops rows |
| Adaptive Checkpoint System | `## Checkpoints` |
| Checkpoint Types | `## Checkpoints`, lead, pointing at `agents/pipeline_orchestrator_agent.md`, "3. Checkpoint Management" |
| Decision Dashboard | `## Checkpoints`, "A FULL checkpoint shows the decision dashboard" |
| Adaptive Rules | `## Checkpoints` bullets 1, 6, 7 and the page's "Checkpoint Type Rules"; rule 5 left out (Stage 5) |
| Checkpoint Rules | `## Checkpoints` bullets 2 to 5 and 8 |
| Self-Check Questions | `## Checkpoints`, the numbered list |
| Agent Team (5 Agents) | Rules bullets 1 to 3; "What it reads" 9 and 10; the collaboration agent and the claim audit agent left out (D16) |
| Orchestrator Workflow | Steps 1 to 6 and `### manuscript` |
| Step 1: INTAKE & DETECTION | Steps 1 |
| Step 2: MODE RECOMMENDATION | Steps 5, bullets 1 and 2 (D5) |
| Step 3: STAGE EXECUTION | `### manuscript` items 2 to 9 and Rules on the Skill tool |
| Step 4: TRANSITION | `### manuscript` item 2, pointing at the page's "4. Transition Management" handoff table |
| Mid-Conversation Reinforcement Protocol | `### manuscript` item 2 and its template; `references/reinforcement_content.md` |
| Phase-by-phase Invocation Contract | left out (Open item A); Mode A's content in Rules bullets 1 to 3 |
| Integrity Review Protocol | `## The integrity check`; "What it reads" 11 |
| Two-Stage Review Protocol | `### manuscript` items 5 and 7, pointing at `references/two_stage_review_protocol.md` |
| Mid-Entry Protocol | Steps 1 and Steps 5, bullet 3 (D4) |
| External Review Protocol | `### manuscript` items 6 and 7, pointing at `references/external_review_protocol.md`; Stops "The parsed comments" |
| Progress Dashboard | `## Checkpoints`, the "status" bullet; `### manuscript` item 10 |
| Revision Loop Management | Rules (the cap, Stage 4' once, the override of `paper`'s cap); `### manuscript` items 6 and 8 (history, Acknowledged Limitations), item 10 (cumulative history) |
| Early-Stopping Criterion | `### manuscript` item 7; Stops "The early-stopping suggestion" |
| Budget Transparency | Steps 5, bullets 4 to 6; `## Checkpoints`, the round-trip bullets |
| Reproducibility | Rules (same input, versioned artifacts); `### manuscript` item 10 (audit trail) |
| Stage 6: Process Summary Protocol | left out (D16) |
| Collaboration Depth Observer | left out (D16) |
| Anti-Patterns | `## Anti-patterns`, rows 1 to 6 and 7 (the source's 8); the source's 7 left out (D16); row 8 added for D5 |
| Quality Standards | Steps 1 (stage detection), Steps 5 (mode recommendation), `### manuscript` item 2 (handoff), Steps 3 and item 2 (state), `## Checkpoints` (mandatory checkpoint), `## The integrity check` (mandatory checks and checklist), Anti-patterns row 2 (no overstepping), Rules (no forcing, reproducible), item 7 (convergence), Steps 5 (budget) |
| Error Recovery | Stops rows "The entry point", "The third correction round failed", "The review decision", "An incomplete revision", "The re-review decision", item 8 (Acknowledged Limitations), "The integrity check" item 5, Steps 2 and "Checkpoints" (pause and resume), "A run that fails"; the Stage 1 and 2 rows left out (D16) |
| Agent File References | "What it reads" 9 and 10 |
| Reference Files | "What it reads" 11 to 13, each page named at its step |
| Templates | "What it reads" 13; `## Checkpoints` (`templates/pipeline_status_template.md`) |
| Examples | "What it reads" 14; `### manuscript` item 1 |
| Output Language | Rules, last bullet |
| Integration with Other Skills | Rules on the four runs; "What it reads" 5 to 7; Stage 1 and 5 parts left out (D16) |
| Related Skills | `## Use instead`; "What it reads" 5 to 7 |
| Version Info | `metadata.version` |
| Changelog | left out (no history) |

## ADR 0052's Decision, point by point

- The sections and frontmatter of the layout, ASCII and the prose standard: `SKILL.md` frontmatter and its nine `##` headings (case above); V1 and V2 print nothing.
- `lookup.py resolve`, a passage read in the run, the web originality screen: Rules bullets 13 to 15; `agents/integrity_verification_agent.md` "A0. Lookup with `lookup.py resolve`", "E2. Source Tracing", "D1. Paragraph-Level Originality Check (WebSearch)".
- `integrity` at the final check's depth, `pre-review` the sampled depth: Steps 1, bullets 3 and 4; Quick start lines 1 and 2.
- Up to 3 correction rounds at a failed final check, then the user decides: "The integrity check" item 5; Stops "The third correction round failed".
- A draft that enters midway never skips the first check: Steps 1, bullet 6; Steps 5, bullet 3; Anti-patterns row 1.
- `manuscript` runs `paper` and `paper-review-panel` through the Skill tool with their own stops, corrections to `/paper revision` with the issue list: Rules bullets 4 and 5; `### manuscript` items 3 to 8; "The integrity check" item 5.
- State in `researcher-runs/<mode>-<date>/`, each record its own file: Steps 3; "The integrity check" items 1 and 2; Rules, run-folder bullet.
- The ethics check from the page `paper` held, read by the integrity agent as the last part: "The integrity check" item 1, bullet 4; `references/ethics.md`; the agent's "Phase F: Ethics Check".
- No rule puts a recorded null result into the manuscript, the record keeps such results: Rules bullets 8 and 9; `references/handoff_schemas.md` `negative_results[]`.
- The record written by `research`, or asked once and built: "What it reads" 4; Steps 4; Stops "The record of the experiments".
- Left out: claim audit, cross-model check, patch scripts, collaboration observer, research, finalizing and process summary stages: none appears in `SKILL.md` (exclusion grep exit 1); `SKILL.md` names no patch script, and every change goes through `/paper revision`.
- `NOTICE.md` and the README licence line: step 1 wrote them; this step does not change them.

## Judgment calls

- The two reference sections "The integrity check" and "Checkpoints" hold the matter both modes read, so it is written once and each mode points at it.
- `### integrity` runs its check under the stage name 4.5 (full depth) or 2.5 (`pre-review`), so that the record names and the Mode of the agent's page stay those of the stage whose depth it uses.
- In a correction round the integrity agent is resumed for the re-verification its page gives, and the compliance agent runs again after each round, so each round has its compliance report.
- The interaction-count caps state "8 coaching rounds after Stage 3, 5 after Stage 3'" from `references/two_stage_review_protocol.md`, with the external review's 8 rounds stated at item 6.
- In `agents/pipeline_orchestrator_agent.md`, the three user-type rows now all give "full + full" with the two commands, since D5 fixes the runs; the four Mode Switching rows are one PROHIBITED row naming the four runs. The paragraph "**DANGEROUS switches**" under that table now has no DANGEROUS row; it is outside the rows the brief lets me change, so it stays.
- `agents/pipeline_orchestrator_agent.md`, "User Engagement Tracking", gives SLIM plus an awareness prompt at 4 or more continues, while the source's `SKILL.md` Checkpoint Rule 5 gives a FULL checkpoint. `SKILL.md` carries the source `SKILL.md`'s rule (FULL). This disagreement is in the source between its two files and touches no ruling.
- "What it reads" 4 says "The `research` mode writes it at its last stage", as ADR 0052 says, though that mode comes with steps 3 and 4; until then every project takes the stop "The record of the experiments".
- The `researcher.svg` figure uses the existing `paper` kind (teal) for a run of another skill, with a legend row, and `describe()` gained the name "a run of another skill" for that kind; no other figure of `gen_figures.py` uses the kind, so every other figure stays byte for byte (status lists no other file).
- The paper row of `skills/academic/paper/SKILL.md` keeps its "When" phrase and adds "the stages from the writing to the final check", since `manuscript` now runs those; the version goes to 5.0.1, a wording change.
- The README row names "academic-pipeline's stages and the pages of its agents copied", in the style of the `paper` and `paper-review-panel` rows, which name their sources.

## Visible changes, before and after

- `/researcher integrity`, `/researcher integrity pre-review` and `/researcher manuscript` exist. Before: no `SKILL.md`; `/ordo-help skills` listed no `researcher`. After: its Quick start block gives the five lines.
- README: a row of `researcher`; line 38 lists `researcher` among `skills/academic/` and says "twenty-four skills" (before "twenty-three"); the install loop lists `academic/researcher` after `academic/referee`; line 179 says "twenty-four"; line 78 adds "`researcher` an integrity agent and a compliance agent at each integrity check"; a figure line for `researcher.svg` after the referee figure.
- `docs/figures/researcher.svg`: new, the manuscript mode.
- `academic-pipeline.svg`: before, 1, 2.5 and 4.5 went to "researcher, entry 13: integrity and ethics checks, the stage loop", dashed with dotted arrows. After, 2.5 and 4.5 go with solid arrows to "researcher: the integrity and ethics checks, and the manuscript mode that runs the stages", teal; 1 goes with a dotted arrow to "researcher research, entry 13", dashed. Legend: "Teal: paper, paper-review-panel and researcher" (before "Teal: paper and paper-review-panel").
- `docs/roadmap.md` line 29: before "1 Research goes to researcher, entry 13 (not built yet); ... 2.5 Integrity check goes to researcher, entry 13; ... 4.5 Final integrity check goes to researcher, entry 13;". After "1 Research goes to researcher research, entry 13 (not built yet); ... 2.5 Integrity check goes to researcher: the integrity and ethics checks, and the manuscript mode that runs the stages; ... 4.5 Final integrity check goes to researcher;".
- `skills/academic/paper/SKILL.md` line 70: before "| Full research-to-paper pipeline: the research stage, the integrity check of a finished manuscript's references, claims, numbers and figures, and its ethics check | `researcher` (roadmap entry 13, not built yet) |". After "| Full research-to-paper pipeline: the integrity check of a finished manuscript's references, claims, numbers and figures, its ethics check, and the stages from the writing to the final check | `researcher`, whose research stage is not built yet (roadmap entry 13) |". Version 5.0.0 to 5.0.1.
- `docs/dev/building.md` line 41 and `docs/dev/scripts.md` line 9: `researcher.svg` added after `codebase-design.svg`.
- `agents/integrity_verification_agent.md`, "Correction Process on FAIL" step 2: before "Send the correction list to /paper revision, invoked through the Skill tool with its own stops, as its comments; ...". After "Hand the correction list to the session in the record; the session invokes /paper revision through the Skill tool, with its own stops, with the list as its comments; ...".
- `agents/pipeline_orchestrator_agent.md` lines 50 to 52: before "plan + guided", "full + full", "full + quick"; after "full + full: `/paper full` at Stage 2, `/paper-review-panel full` at Stage 3" in each row. Lines 216 to 219: before four rows (plan to full SAFE, full to plan PROHIBITED, quick to guided SAFE, guided to quick DANGEROUS); after one row "any run other than ... | PROHIBITED | The run of each stage is fixed by the pipeline's design (`SKILL.md`, Steps 5)".
- `references/compliance_checkpoint_protocol.md` line 10: before "`SKILL.md` Stage 2.5 / 4.5."; after "`SKILL.md`, "The integrity check" items 2 and 4, at Stage 2.5 / 4.5.".
- `references/handoff_schemas.md` line 298: before "the SKILL.md Early-Stopping Criterion"; after "the early-stopping criterion of `SKILL.md`, Steps, "manuscript" item 7". Lines 712 and 722: before "The skill's `SKILL.md` declares `metadata.data_access_level` with one of three values:" and the same for `task_type`; after "The value of `researcher` is `verified_only`, stated on this page, since the frontmatter of its `SKILL.md` holds only the keys of the skill layout. The compliance agent declares the same value in the frontmatter of `agents/compliance_agent.md`. The three values:" and "The value of `researcher` is `open-ended`, ...".
- `references/score_trajectory_protocol.md` line 36: "SKILL.md" becomes "SKILL.md, Steps, "manuscript" item 7".
- `references/reinforcement_content.md` line 3: "the Mid-Conversation Reinforcement Protocol" becomes "the reinforcement of `SKILL.md`, Steps, "manuscript" item 2".

## Hand-backs: copied pages that contradict `SKILL.md` outside the lines the brief lets me change

1. `skills/academic/researcher/agents/integrity_verification_agent.md:500`, Mode 1: "Issues found: produce correction list, send it to `/paper revision` with the correction list as its comments, then re-verify corrected items". It tells the agent to send to `/paper revision`; `SKILL.md` and the changed "Correction Process on FAIL" have the session do it (D5, brief decision 2). Fix: "hand the correction list to the session, which sends it to `/paper revision`".
2. `skills/academic/researcher/references/compliance_checkpoint_protocol.md:94`: "the orchestrator **auto-injects** it into the manuscript's AI disclosure section". Brief decision 6 and D5 send the addendum to `/paper revision` as its comment, as `SKILL.md` Stops "The compliance block" says.
3. `skills/academic/researcher/agents/pipeline_orchestrator_agent.md:67`, in the "Communication format when recommending" block: "You can adjust any stage's mode at any time." D5 fixes the run of each stage; `SKILL.md` lets the user adjust only within those runs.
4. `skills/academic/researcher/examples/mid_entry_example.md`, lines 41-42, 49, 58, 105, 114, 117, 124, 135, 160, 166, 174, 181, 201, 220, 336, 404 and 420: the worked run runs Stage 3 in quick mode (line 117: `/paper-review-panel quick` through the Skill tool). D5 gives `/paper-review-panel full`.
5. `skills/academic/researcher/examples/full_pipeline_example.md`, line 33 ("recommend guided mode") and lines 50-70 (Stage 2 first in plan mode, then full): D5 gives `/paper full` at Stage 2 and `/paper-review-panel full` at Stage 3.

`SKILL.md` names both example pages as worked runs the session reads ("What it reads" 14), so until they are changed a session reading them sees runs that `SKILL.md` forbids.

## Anything in the brief that was wrong or impossible

- The brief's "Paths this step writes" gives `README.md lines 9-176`. Two inserted lines move the old line 176 to 179; `git diff -U0 README.md` gives the hunks `-33,0 +34`, `-37 +38`, `-77 +78`, `-86,0 +88,2`, `-165 +168` and `-176 +179`, all within the old lines 9 to 176.
- Nothing else.
