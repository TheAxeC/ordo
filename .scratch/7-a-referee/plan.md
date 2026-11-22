# Plan: 7.A referee

Execution ledger for roadmap entry 6, paper-review (`docs/roadmap.md`). One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The referee skill: the referee review of someone else's paper, by one reviewer from the reviewer's side, writing the report for the editor in the journal's fields: a summary of the paper, a recommendation, the major and the minor points each tied to the passage it is about, and the confidential comments to the editor. It is neither the draft review of `paper`'s full mode nor the panel review of `paper-review-panel`. It is a small skill of its own that runs the reviewers of `paper-review-panel` from that skill's pages, all five unless you shrink the panel at the intake, and adds only what differs for a referee: an intake (the direction, the severity, the budget of points and words, the journal's fields, the round), no revision roadmap and no coaching of the author, a last step that selects which of the panel's comments go into the report and keeps the others in a file with the reason for each, a stop that shows you both lists before the report is written, and a second round that reviews a revision against the authors' response.

## Gate

one first-round referee review of `research-hub/tmp/BIOINF-2026-1778-review/manuscript.txt` and one second-round review of `research-hub/tmp/BIOINF-2026-1778-review/round2/BIOINF-2026-1778.R1_Proof_hi.txt` with `round2/Response_to_Reviewers.txt`, each of which you read against the comments you sent (`COMMENTS_TO_AUTHOR.md`, `round2/SUBMITTED_R2.txt`) and find written by one reviewer from the reviewer's side, with each point tied to its passage, no panel synthesis, and within the budget given at the intake; in each run you were shown the selected and the left-out comments before the report was written, and the run folder holds the left-out comments, each with its reason; `skills/academic/referee/` holds no copy of a page of `paper-review-panel`, checked by reading both folders.

- The gate: could this pass without the goal being reached? no, the user reads both reports against the comments actually sent, and each part of the goal has its own clause.
- Step 1: could this pass without the goal being reached? no, a reviewer reads the skill's words against each ruling and reads both folders for a copied page; that a run gives a good report is step 2's.
- Step 2: could this pass without the goal being reached? no, it is the gate's two runs on the finished skill, read by the user.

## Steps, in execution order

- 1 the skill: `skills/academic/referee/` with its `SKILL.md` in the skill layout and its own pages for what a referee adds (the intake, the selection with the file of left-out comments, the stop that shows both lists, the report in the journal's fields, the second round), the reviewers run from the `paper-review-panel` skill's pages, and the skill listed where the skills are listed (README, glossary, the dev pages, its figure); a reviewer reads `SKILL.md` against each ruling of this plan and finds it carried out, reads both folders and finds no copy of a page of `paper-review-panel`, and the verify list of `docs/dev/building.md` passes (1 commit) (approved)
- 2 the gate's two runs, with the user: one first-round referee review of `research-hub/tmp/BIOINF-2026-1778-review/manuscript.txt` and one second-round review of `research-hub/tmp/BIOINF-2026-1778-review/round2/BIOINF-2026-1778.R1_Proof_hi.txt` with `round2/Response_to_Reviewers.txt`, the user answering the intake and the stop of each run; the user reads each report against the comments sent, as the gate words it (0 commit; orchestrator, no agent) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- nothing: each step needs the one before it.

## Rulings (2026-11-22)

- The step list (2026-11-22): approved as drafted, three steps (the user).
- A small skill on the panel's pages (2026-11-22): `referee` is a small skill of its own that runs the reviewers of `paper-review-panel` from that skill's pages and adds only what differs for a referee: the stance (someone else's paper, so no revision roadmap and no coaching of the author), the last step, and the second round. It is not a copy of the panel's 25 files. This replaces the part of D35 (plan of entry 5) and of the roadmap entry's goal that has it built as a full copy; it stays a skill of its own, as D34 and D35 rule (the user).
- The last step selects (2026-11-22): the referee's report does not carry every comment of the panel. A proper review is not too long and does not hold too many points, so the last step first selects which comments go in and which do not, and writes the report from the selected ones only, in one voice, in the journal's fields (the user).
- An intake direction (2026-11-22): the run takes a direction at its intake, such as a methodological focus, which steers the review and the selection (the user).
- All five by default (2026-11-22): the run starts all five reviewers by default and selects afterwards; the direction shrinks the panel only when the user says so at the intake (the user).
- A stop before the writing (2026-11-22): the selected comments are shown to the user with the left-out comments beside them, and the user moves items between the two before the report is written (the user).
- The left-out comments are kept (2026-11-22): every comment of the panel that is not selected is written to a file of the run folder, with one clause saying why it was left out (the user).
- A default budget (2026-11-22): by default the report holds about 5 to 7 major points, about 7 minor points and about 1,200 words, the size of the review sent for BIOINF-2026-1778; the user changes it at the intake (the user).
- What the intake asks (2026-11-22): beside the direction, the intake asks the severity of the review, the journal's fields and its length limit, and whether the run is a first review or a re-review with the authors' response (the user).
- How the panel's pages are found (2026-11-22): `referee` names them as the `paper-review-panel` skill's `agents/<name>.md`, the form `docs/dev/skill-layout.md` gives for another skill's file, and refuses with a clear message when that skill is not installed beside it (the user).
- The call (2026-11-22): `/referee <manuscript>` for the first round, and `/referee re-review <revised manuscript> <response letter> [<the first-round comments>]` for the second (the user).
- The run folder (2026-11-22): `referee-runs/<round>-<date>/` beside the manuscript (the user).
- The journal's fields by default (2026-11-22): when the user names none at the intake, the report holds a recommendation, the comments to the author (general comments, then the major and the minor points) and the confidential comments to the editor (the user).
- What the second round runs (2026-11-22): the panel's re-review protocol for checking the revision against the response, then the same selection, stop and report; all five reviewers again only when the user asks at the intake (the user).
- Open item 1 (2026-11-22): (a), the phrase "referee report" is removed from the triggers of `paper-review-panel` and its "Use instead" gains a row for `referee`, as part of step 1; the lazy option was (b) (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

## Blocked, and by what

- nothing.
