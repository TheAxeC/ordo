# Plan: 7.A referee

Execution ledger for roadmap entry 6, paper-review (`docs/roadmap.md`). One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The referee skill: the referee review of someone else's paper, by one reviewer from the reviewer's side, writing the report for the editor in the journal's fields: a summary of the paper, a recommendation, the major and the minor points each tied to the passage it is about, and the confidential comments to the editor. It is neither the draft review of `paper`'s full mode nor the panel review of `paper-review-panel`. It is a small skill of its own that runs the reviewers of `paper-review-panel` from that skill's pages, all five unless you shrink the panel at the intake, and adds only what differs for a referee: an intake (the direction, the severity, the budget of points and words, the journal's fields, the round), no revision roadmap and no coaching of the author, a last step that selects which of the panel's comments go into the report and keeps the others in a file with the reason for each, a stop that shows you both lists before the report is written, and a second round that reviews a revision against the authors' response.

## Gate

one first-round referee review of `research-hub/tmp/BIOINF-2026-1778-review/manuscript.txt` and one second-round review of `research-hub/tmp/BIOINF-2026-1778-review/round2/BIOINF-2026-1778.R1_Proof_hi.txt` with `round2/Response_to_Reviewers.txt`, each of which you read against the comments you sent (`COMMENTS_TO_AUTHOR.md`, `round2/SUBMITTED_R2.txt`) and find written by one reviewer from the reviewer's side, with each point tied to its passage, no panel synthesis, and within the budget given at the intake; each run is made by a separate agent that invokes `/referee` as the installed skill, with its stops answered by the orchestrating session, and its run folder holds the selection, written before the report, and the left-out comments, each with its reason; `skills/academic/referee/` holds no copy of a page of `paper-review-panel`, checked by reading both folders.

- The gate: could this pass without the goal being reached? no, the user reads both reports against the comments actually sent, and each part of the goal has its own clause.
- Step 1: could this pass without the goal being reached? no, a reviewer reads the skill's words against each ruling and reads both folders for a copied page; that a run gives a good report is step 2's.
- Step 1b: could this pass without the goal being reached? no, a reviewer reads the skill's words against the two rulings it rests on; that a run then gives a report with fewer points than the budget where the paper has fewer, and a second-round report on the first-round points, is step 2's.
- Step 2: could this pass without the goal being reached? no, it is the gate's two runs on the finished skill, read by the user.

## Steps, in execution order

- ✅ 1 the skill: `skills/academic/referee/` with its `SKILL.md` in the skill layout and its own pages for what a referee adds (the intake, the selection with the file of left-out comments, the stop that shows both lists, the report in the journal's fields, the second round), the reviewers run from the `paper-review-panel` skill's pages, and the skill listed where the skills are listed (README, glossary, the dev pages, its figure); a reviewer reads `SKILL.md` against each ruling of this plan and finds it carried out, reads both folders and finds no copy of a page of `paper-review-panel`, and the verify list of `docs/dev/building.md` passes (1 commit) (approved)
- ✅ 1b the count of points and the second round: in `skills/academic/referee/` (`SKILL.md`, `agents/referee_agent.md`, `references/second_round.md`, the two templates), the referee grades and counts the points by what the manuscript's weaknesses are before it applies the budget, so the budget only cuts a list that is longer and is never a number to reach, and a point is major only when a main claim fails without it; a second round reports on how the authors answered each first-round point and whether the answer is enough, takes its recommendation from that, and adds a new point only for a grave defect the revision introduced, as an exception; check: a reviewer reads the changed words against the rulings "The budget is a ceiling" and "What a second round is" (1 commit) (ruling The budget is a ceiling) (ruling What a second round is)
- 2 the gate's two runs: one first-round referee review of the copy of `research-hub/tmp/BIOINF-2026-1778-review/manuscript.txt` and one second-round review of the copies of `research-hub/tmp/BIOINF-2026-1778-review/round2/BIOINF-2026-1778.R1_Proof_hi.txt` and `round2/Response_to_Reviewers.txt`, each run made by a separate agent that invokes `/referee` as the installed skill and starts the skill's agents, the orchestrating session answering the intake, the reviewer configuration and the selection of each run with the skill's defaults; the user reads each finished report against the comments sent, as the gate words it (0 commit) (approved) (ruling How every run is made)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Step 1, landed (2026-11-22)

- What landed: `skills/academic/referee/` (`SKILL.md`, `agents/referee_agent.md`, `references/second_round.md`, `templates/selection_template.md`, `templates/referee_report_template.md`); the listings in `README.md`, `docs/dev/building.md`, `docs/dev/scripts.md` and `docs/glossary.md` (the entry **referee review** and the new entry **round, of a referee review**); `docs/figures/gen_figures.py` with `referee()` and the written `docs/figures/referee.svg`; `skills/academic/paper/SKILL.md` (the "Use instead" row, version 4.1.2); `skills/academic/paper-review-panel/SKILL.md` (Open item 1: the phrase "referee report" out of its triggers, a "Use instead" row for `/referee`, version 1.0.1).
  - Premise corrections: the brief check found eleven files under the panel's `references/`, ADR 0043 touching `skills/academic/paper/SKILL.md`, and three README places the brief had not named; each was corrected in the brief before the build. The builder's first read found the entry **round, of an interview** inside the plan-terms block, a plain request with no round named before the run folder, and the EIC of a second round with all five left unsaid; each was ruled in `agents/briefs/1-cases.md`.
  - Findings outside the brief: none raised as an open item. The reviewer left to the user whether the round is also asked inside the intake; it was put to the user in the session and is not blocking.
  - Verification: `sh /Users/axelfaes/.claude/skills/land/templates/checks.sh .scratch/7-a-referee/orchestrator-state.md`, run on main after the fixes at landing, ended `checks: 12 commands passed`.
  - A/B: none, the configuration names no benchmark. Look: none, the configuration names no view.
  - The builder's first report did not pass its bar: the first review gave five findings (two lines of Steps equal to the panel's; the second round's EIC not given the re-review page; that page's Priority items and commitment section not fitted to a referee's points; no writer named for a comment the user moves; no place for a resolved first-round point), all closed in repair round 1.
  - Fixes at landing, four, each from the review over round 1: `references/second_round.md` maps the re-review page's four values to the three statuses; `references/second_round.md` and `agents/referee_agent.md` say "each call" where they said two; `agents/referee_agent.md`, "The user's changes", covers the list "First-round points resolved"; the saved builder's report had its out-of-date lines corrected.
  - Agents: the brief check abb679c2d2f988485 (claude-fable-5-2, 176151 tokens, 19 tool uses, 5.5 minutes); the builder a9dad9cfb0f9e82db (claude-fable-5-2: the hand-back before the build 166349 tokens, 13 tool uses, 2.0 minutes; the build 225420 tokens, 13 tool uses, 6.3 minutes; round 1 239752 tokens, 3 tool uses, 1.3 minutes); the reviewer ade192054e78b1aaa (claude-fable-5-2, 216060 tokens, 26 tool uses, 9.6 minutes); the reviewer over round 1 a9633d2af5c6d3428 (claude-sonnet-5-5, 121187 tokens, 18 tool uses, 2.0 minutes).

## Step 1b, landed (2026-11-23)

- What landed: in `skills/academic/referee/`, the referee's page orders the selection as list, merge, grade, found counts, rank, budget, grades a point major only when a main claim fails or cannot be judged without it, and has the section "The budget" (a ceiling, never a number to reach); `selection.md` gets the sections "Points found" and "Points over the budget"; `references/second_round.md` builds a second round on the first-round points, with the sections "New points" (two conditions) and "The recommendation", the EIC's check carrying each first-round point's number, title, grade and what it asked; the report template has a second-round form; `README.md`, the sentence on the lists.
  - Premise corrections: the brief check found that the second-round run had merged 9 of the EIC's 11 new issues into first-round points, where the brief said the points were mostly new ones; the brief was corrected and items 8 and 12 and case C10 written for it. The step line lost "with the version raised" and reads "applies the budget".
  - Findings outside the brief: none raised as an open item.
  - Verification: `sh /Users/axelfaes/.claude/skills/land/templates/checks.sh .scratch/7-a-referee/orchestrator-state.md`, run on main after the fixes at landing, ended `checks: 12 commands passed`.
  - A/B: none, the configuration names no benchmark. Look: none, the configuration names no view.
  - The builder's first report did not pass its bar: the first review gave ten findings, the main one that the referee of a second round was given neither the first-round comments nor each point's grade; all ten were closed in repair round 1.
  - Fixes at landing, seven, each from the review over round 1: a point regraded to major gets its passage and reason (`agents/referee_agent.md`, "The user's changes"); an observation "New points" leaves out becomes no point at the merge (`references/second_round.md`); `SKILL.md` says what `left-out.md` holds; three bullets that held two rules split; a rule written twice in item 4 of `references/second_round.md` written once; counts in the saved builder's report corrected; the README's sentence on the lists replaced with the builder's "Doc text".
  - Agents: the brief check a209c45f6fbb2d894 (claude-fable-5-2, 211641 tokens, 17 tool uses, 5.6 minutes); the builder af33cf9bca3b7181b (claude-fable-5-2: the build 153958 tokens, 11 tool uses, 5.7 minutes; round 1 190727 tokens, 6 tool uses, 2.6 minutes); the reviewer a7fa4b89e49397c7e (claude-fable-5-2, 182225 tokens, 16 tool uses, 7.0 minutes); the reviewer over round 1 ae590f6a0158cac61 (claude-sonnet-5-5, 141449 tokens, 18 tool uses, 3.3 minutes).

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
- How every run is made (2026-11-22): every run of a skill for a gate or a step is made by a separate agent the orchestrating session starts, never in the orchestrating session; the orchestrating session answers the run's stops and asks the user nothing; the user's part is reading the finished output; a roadmap entry or a plan that says otherwise is fixed. This replaces the words of step 2 and of the gate that had the user answering the stops (the user).
- The first-round run of step 2 (2026-11-23): the first-round report is close to the comments sent (the user).
- The budget is a ceiling (2026-11-23): a report that finds exactly the budget's number of major points is bad, since it reads as a review that always finds that number; the number of major points comes from the paper, and the budget only cuts (the user).
- What a second round is (2026-11-23): a second round is mainly about what improved and changed against round 1: how the authors responded to each of the referee's comments and whether that is satisfactory; separately, whether the revision introduced another extremely major defect, which is exceptional; a second-round report whose points are mostly other items than those of round 1 is wrong (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- abb679c2d2f988485: brief check of step 1, claude-fable-5-2
- a9dad9cfb0f9e82db: builder of step 1, claude-fable-5-2
- ade192054e78b1aaa: reviewer of step 1, claude-fable-5-2
- a9633d2af5c6d3428: reviewer of step 1 over round 1, claude-sonnet-5-5
- a8a1ce052177b256e: run of step 2, first round, claude-fable-5-2
- a912c1d07c6e1f03e: run of step 2, second round, claude-fable-5-2
- a209c45f6fbb2d894: brief check of step 1b, claude-fable-5-2
- af33cf9bca3b7181b: builder of step 1b, claude-fable-5-2
- a7fa4b89e49397c7e: reviewer of step 1b, claude-fable-5-2
- ae590f6a0158cac61: reviewer of step 1b over round 1, claude-sonnet-5-5

## Blocked, and by what

- nothing.
