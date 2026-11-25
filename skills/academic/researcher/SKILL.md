---
name: researcher
description: "Check the integrity of a finished manuscript, or take one through writing, review, revision and two integrity checks. integrity has a fresh agent check every reference by lookup, the citations, claims, data and figures, the author's own results against the record of the experiments, screen originality and run the ethics check last, at the full depth or, with pre-review, the sampled depth; a compliance agent follows it, and a failed check goes to revision for up to 3 correction rounds. manuscript runs the writing, the review and the revision as runs of other skills and stops at each checkpoint. A run leaves the run's state, each integrity record and each compliance report in a run folder beside the manuscript's folder. Triggers on: /researcher integrity, /researcher manuscript, check the integrity of my manuscript, verify the references and claims of a finished draft, ethics check of a paper, final integrity check, academic pipeline, full paper workflow, take my draft through review and revision."
metadata:
  version: "1.0.0"
---

# The integrity check and the manuscript pipeline

`/researcher integrity` checks a finished manuscript with a fresh integrity agent and a compliance agent. `/researcher manuscript` takes a manuscript through the stages from the writing on: Stage 2 the writing, Stage 2.5 the first integrity check, Stage 3 the review, Stage 4 the revision, Stage 3' the re-review, Stage 4' the re-revision and Stage 4.5 the final integrity check. A run leaves behind the run's state, each integrity record and each compliance report, each a file of its own in its run folder (Rules).

## Quick start

```
/researcher integrity <main.tex>                    check a finished manuscript at the full depth: references, citations, data, originality, claims, the ethics check last
/researcher integrity pre-review <main.tex>         the same check at the sampled depth of the check before a review
/researcher manuscript <project folder>             write the paper from the project's materials, then check it, review it, revise it and check it again
/researcher manuscript <main.tex>                   take a draft that exists from the first integrity check through review, revision and the final check
/researcher manuscript <main.tex> <comments file>   take a draft with review comments in hand: the first integrity check, then the revision for the comments
```

## Use instead

| When | Use |
|---|---|
| A paper to write, with no integrity check and no review stage | `/paper full` |
| A paper to plan chapter by chapter before it is written | `/paper plan` |
| A literature search or a literature review only | `/paper lit-review` |
| A manuscript's citations to check against their sources, with no review stage | `/paper citation-check` |
| A manuscript to convert to another format or citation style | `/paper format-convert` |
| A one-page abstract, for which the stages cost more than they give | `/paper abstract-only` |
| A review of the author's own paper by a panel of reviewers and an editor, with no integrity check | `/paper-review-panel` |
| A revision for comments in hand, with no integrity check | `/paper revision` |
| A run already under way in a mode of `paper` or `paper-review-panel`, whose entry the user keeps | that mode of that skill |
| Someone else's paper to review as its referee | `/referee` |
| The prose of a draft to check | `/writing` |

## What it reads

1. The call, as Quick start gives it: the mode, the depth of `integrity` and the arguments. Each argument is a path. A call whose `<main.tex>` is missing or does not exist is the refusal "No manuscript". A `<project folder>` that does not exist is the refusal "No project folder". A `<comments file>` that does not exist is the refusal "No comments file".
2. The manuscript: the main `.tex`, the files it inputs and includes, and its `.bib`, read by the integrity agent and the compliance agent.
3. The project folder: the `<project folder>` of the call, and for a call given a `<main.tex>` the parent of the manuscript's folder. It holds the record of the experiments and the run folders.
4. The record of the experiments, the file `experiment-record.yaml` in the project folder: the `experiment_intake_declaration` and the `experiment_provenance[]` of Schema 9 in `references/handoff_schemas.md`, "Experiment Provenance Intake". The `research` mode writes it at its last stage. A project with no such file gets the stop "The record of the experiments".
5. The `paper` skill's folder, with its `SKILL.md`, found from this skill's folder with every link resolved: the folder of that name beside it, and otherwise the folder of that name in a group folder beside this skill's group folder. A folder found in neither place, or that holds no `SKILL.md`, is the refusal "A skill not installed", which names both paths.
6. The `paper` skill's `templates/lookup.py`, in the folder of item 5, run by the integrity agent as `python3 '<the paper skill's folder>/templates/lookup.py'`. A folder that holds no such file is the refusal "lookup.py not found".
7. For `manuscript` only, the `paper-review-panel` skill's folder, with its `SKILL.md`, found as item 5 finds the `paper` skill's folder. A folder found in neither place, or that holds no `SKILL.md`, is the refusal "A skill not installed".
8. The environment variables `S2_API_KEY`, `OPENALEX_API_KEY` and `CROSSREF_POLITE_EMAIL`, each optional and never printed, read by `lookup.py`.
9. The two role pages the session reads and follows: `agents/pipeline_orchestrator_agent.md` for directing the stages, and `agents/state_tracker_agent.md` for the structure of the run's state.
10. The two role pages of the agents the session starts: `agents/integrity_verification_agent.md`, read by the integrity agent, and `agents/compliance_agent.md`, read by the compliance agent.
11. The pages the integrity agent is given with its role page: `references/integrity_review_protocol.md`, `references/plagiarism_detection_protocol.md`, `references/claim_verification_protocol.md`, `references/ai_research_failure_modes.md`, `references/ethics.md` and `references/handoff_schemas.md`.
12. The pages the compliance agent is given with its role page: `references/compliance_checkpoint_protocol.md`, `references/prisma_trAIce_protocol.md`, `references/raise_framework.md`, `references/ai_research_failure_modes.md` and `references/handoff_schemas.md`.
13. The pages the session reads at the step that names them: `references/pipeline_state_machine.md`, `references/mode_advisor.md`, `references/two_stage_review_protocol.md`, `references/external_review_protocol.md`, `references/score_trajectory_protocol.md`, `references/reinforcement_content.md`, `references/compliance_checkpoint_protocol.md`, `references/ai_research_failure_modes.md`, `references/ethics.md`, `references/reproducibility_audit.md`, `references/artifact_reproducibility_pattern.md`, `references/progress_dashboard_template.md`, `references/team_collaboration_protocol.md` and `templates/pipeline_status_template.md`.
14. The worked runs the session reads before its first stage: `examples/full_pipeline_example.md`, a run from Stage 2, `examples/mid_entry_example.md`, a run from Stage 2.5, and `examples/integrity_failure_recovery.md`, a failed first check and its correction round.
15. An unfinished run of the same mode for the same manuscript: a run folder in the project folder whose `state.json` holds a `pipeline_state` of `running`, `awaiting_confirmation` or `paused`.

## Steps

Steps 1 to 6 run in order, in both modes.

1. Read the call and settle the mode, the depth and the entry stage.
   - Check the folders and the file of "What it reads" 5 to 7 first, before anything is written.
   - Check the arguments as "What it reads" 1 gives them.
   - `/researcher integrity <main.tex>` runs the check at the depth of Mode 2 of `agents/integrity_verification_agent.md`, the full depth of the final check.
   - `/researcher integrity pre-review <main.tex>` runs the check at the depth of Mode 1, the sampled depth of the check before a review.
   - `/researcher manuscript <project folder>` enters at Stage 2.
   - `/researcher manuscript <main.tex>` enters at Stage 2.5, which a draft that enters midway never skips.
   - `/researcher manuscript <main.tex> <comments file>` enters at Stage 2.5 and goes on to Stage 4 with the comments file, as the row "INIT, Stage 4" of `references/pipeline_state_machine.md`, "Normal Flow Transitions", gives.
   - A call that matches no line of Quick start is read against `agents/pipeline_orchestrator_agent.md`, "1. Intent Detection", and `references/mode_advisor.md`, and the line it matches is the stop "The entry point".
   - A request that only one function fits, such as a citation check alone, is answered with the skill of its row in "Use instead", and no run starts.
   - Done when the mode, its depth or its entry stage, and its inputs are known, or a refusal is raised.
2. Look for an unfinished run of "What it reads" 15.
   - Such a run is the stop "An unfinished run", with its Progress Dashboard.
   - A run the user continues writes into its own run folder, goes on from the stage its state names, and skips Steps 3 to 6.
   - Done when no unfinished run stands, or the user has chosen to continue it or to start a new run.
3. Make the run folder and the run's state.
   - The run folder is `researcher-runs/<mode>-<date>/` in the project folder, beside the manuscript's folder, with `<date>` the local date, `date +%Y-%m-%d`.
   - When that folder exists, the run takes `<mode>-<date>-2`, then `-3`, and so on.
   - Both depths of `integrity` use the mode name `integrity`.
   - Write `state.json` in the run folder, in the structure `agents/state_tracker_agent.md`, "Tracked State Structure", gives, with `entry_point`, `current_stage`, `pipeline_state: initializing` and `pipeline_version` set to this skill's `metadata.version`.
   - Write `material-passport.yaml` in the run folder, in the form of Schema 9 of `references/handoff_schemas.md`: `origin_skill: researcher`, `origin_mode` the mode, `origin_date`, `verification_status: UNVERIFIED`, a `version_label`, the `repro_lock` key and an empty `compliance_history[]`.
   - For a draft that enters midway, run the check of `agents/pipeline_orchestrator_agent.md`, "Mid-Entry Material Passport Check", on the draft, and write into `material-passport.yaml` what it finds: the fields of a passport the draft carries, and the `verification_status` and `version_label` the check gives.
   - Done when the run folder holds `state.json` and `material-passport.yaml`.
4. Read the record of the experiments of "What it reads" 4.
   - A project folder with no `experiment-record.yaml` is the stop "The record of the experiments", asked once for the run.
   - When the paper has experiments, build the record with the user from the project's result files, one entry per experiment in the form of Schema 9, `experiment_intake_declaration.status: experiments_declared`, and write it to `experiment-record.yaml` in the project folder.
   - When it has none, write `experiment-record.yaml` with `experiment_intake_declaration.status: no_experiments_declared` and an empty `experiment_provenance[]`.
   - Copy its `experiment_intake_declaration` and its `experiment_provenance[]` into `material-passport.yaml`, where Schema 9 carries them.
   - Done when `experiment-record.yaml` stands in the project folder and `material-passport.yaml` holds its two fields.
5. Show the run's configuration and its budget: the stop "The run's configuration".
   - For `manuscript`, show the configuration in the form `agents/pipeline_orchestrator_agent.md`, "Communication format when recommending", gives: the entry stage and the run of each stage, Stage 2 `/paper full`, Stage 3 `/paper-review-panel full`, Stage 4 and Stage 4' `/paper revision` and Stage 3' `/paper-review-panel re-review`.
   - Explain the difference between the depths and between the runs, as the mode recommendation of that page asks, and say that the integrity checks cannot be skipped.
   - For a draft that enters midway, show the prerequisites of its entry stage as `agents/state_tracker_agent.md`, "6. check_prerequisites" and "Material Gap Detection", give them, and the result of the passport check of Steps 3: a prior integrity report informs the first check and never replaces it.
   - Estimate the token cost of the run from the manuscript's length and the mode.
   - Beside it, give the interaction-count budget: the round-trip caps the run enforces and the worst-case round-trip total they imply for the mode.
   - The caps are 2 full revision loops (Stage 4 and Stage 4'), one revision run for the minor items of a Minor decision at Stage 3', 8 coaching rounds after Stage 3, 5 after Stage 3', 8 coaching rounds of an external review, and 3 correction rounds at each integrity check.
   - Ask, for the compliance agent, the AI tools used, each with its name, version, developer, stage and purpose, and the intended venue, the `user_metadata` of `agents/compliance_agent.md`, "Input contract".
   - Done when the user has confirmed the configuration, with each setting the user adjusted and the answers to the compliance questions written in `state.json`.
6. Go on with the subsection of the mode: "integrity" or "manuscript".
   - Done when that subsection's last item is done.

### integrity

1. Run "The integrity check" once on the manuscript: as Stage 4.5 at the full depth, or as Stage 2.5 for `pre-review`.
   - Done when the check ends with PASS or PASS WITH NOTES, or the user has decided at the stop "The third correction round failed".
2. End the run.
   - Show the result in the MANDATORY checkpoint template of `agents/pipeline_orchestrator_agent.md`, "MANDATORY Checkpoint Template (Integrity)", without its "Next step" line.
   - Name each integrity record and each compliance report of the run folder by its path.
   - Write `pipeline_state: completed` in `state.json`.
   - Done when the message is sent.

### manuscript

1. Before the first stage, read the worked runs of "What it reads" 14 and the stages and transitions of `references/pipeline_state_machine.md`.
   - The stages run in the order of that page, from the entry stage of Steps 1, as items 4 to 12 give them.
   - Every stage is followed by its checkpoint ("Checkpoints") and, after the user's confirmation, by its transition (item 2), before the next stage begins.
   - Done when the entry stage is about to begin.
2. Make each transition between two stages.
   - Say which stage is about to begin.
   - Show the reinforcement below, filled from the row of `references/reinforcement_content.md` for the transition.
   - Check the stage's output against its schema in `references/handoff_schemas.md`, as `agents/pipeline_orchestrator_agent.md`, "4. Transition Management", gives, and pass on the materials its handoff table names for the transition.
   - Check that `material-passport.yaml` carries the version label of the stage's output, as step 3 of that page's "Schema validation step", under "4. Transition Management", asks.
   - Pass on the stage's declared inputs and the path of `material-passport.yaml` only, as that page's "Context Hygiene at dispatch" says.
   - Write the transition in `state.json`, as that page's "Writing the run's state" gives.
   - Done when the next stage has its inputs and `state.json` names it `in_progress`.
   The reinforcement, adapted to the next stage:

   ```text
   --- STAGE TRANSITION: [Current] -> [Next] ---

   Core Principles Reinforcement:
   1. [Most relevant IRON RULE for the next stage]
   2. [Most relevant Anti-Pattern to avoid in the next stage]
   3. Quality check: Is the output of [Current Stage] at least as good as [Previous Stage]? If not, PAUSE.

   Checkpoint: [MANDATORY/ADVISORY] - [What user needs to confirm]
   ---
   ```

3. Write `material-passport.yaml` when a stage ends, before its checkpoint.
   - Give the stage's output a new `version_label`, monotonically increasing within the run, as Schema 9 and "Validation Rules" 4 of `references/handoff_schemas.md` give it, with `origin_date` and `upstream_dependencies`.
   - Set `verification_status: UNVERIFIED` after a stage that changed the manuscript, and `VERIFIED` with `integrity_pass_date` after an integrity check that passed ("The integrity check" 3).
   - Carry forward the aggregates `agents/pipeline_orchestrator_agent.md`, "4. Transition Management", names, `experiment_alignment_results[]` among them.
   - Done when `material-passport.yaml` names the stage's output by its version label.

4. Stage 2, the writing, for a call given a `<project folder>`.
   - Invoke `/paper full '<project folder>'` through the Skill tool, with its own stops.
   - Done when `/paper full` has ended and `<project folder>/manuscript/` holds the main `.tex` and its `.bib`.
5. Stage 2.5, the first integrity check: run "The integrity check" on the draft as Stage 2.5, at the depth of Mode 1.
   - Done when the check ends with PASS or PASS WITH NOTES, or the user has decided at the stop "The third correction round failed".
6. Stage 3, the review, after Stage 2.5 for a call with no comments file.
   - Invoke `/paper-review-panel full '<main.tex>'` through the Skill tool, with its own stops.
   - Its stops hold the revision coaching after a Minor or Major Revision, as `references/two_stage_review_protocol.md`, "Stage 3: First Review (Full Review)" and "Stage 3 to 4 Transition: Revision Coaching", and `agents/pipeline_orchestrator_agent.md`, "Post-Review Socratic Revision Coaching", give.
   - The decision goes on as the stop "The review decision" says: Accept to Stage 4.5, Minor or Major Revision to Stage 4, Reject to the user's choice.
   - Read the seven dimension scores and the overall score from the "Dimension Scores" of the Editorial Decision, and write them to `score_trajectory.baseline` of `state.json`, the baseline of `references/score_trajectory_protocol.md`, "At Stage 3 (REVIEW)". Never make a score up.
   - Done when the Editorial Decision and the Revision Roadmap stand in that run's folder and `state.json` holds the baseline.
7. Stage 4, the revision.
   - After Stage 3, invoke `/paper revision '<main.tex>' '<comments file>'` through the Skill tool, with its own stops, with the Revision Roadmap as the comments file, or the reprioritized Revision Roadmap when the coaching wrote one.
   - With review comments in hand, follow `references/external_review_protocol.md`: the session parses the comments and confirms the parse with the user, as "Step 1: Intake and Structuring" gives it, at the stop "The parsed comments".
   - Hold the strategic coaching of "Step 2: Strategic Revision Coaching (External Revision Coaching)", within its 8 rounds, unless the user says "just fix it".
   - Write the structured comments of Step 1 to `external-comments.md` in the run folder.
   - Then invoke `/paper revision '<main.tex>' '<run folder>/external-comments.md'`, as "Step 3: Revision and Response to Reviewers" gives it.
   - A revision that leaves items unaddressed is the stop "An incomplete revision".
   - Write the round in `revision_history` of `state.json`, with the decision it answers, the items addressed and the items left.
   - Done when `/paper revision` has ended and the revised draft stands.
8. Stage 3', the re-review, after a Stage 3.
   - Invoke `/paper-review-panel re-review '<main.tex>' '<revision roadmap>' '<response to reviewers>'` through the Skill tool, with its own stops.
   - Its stops hold the residual coaching after a Major decision, as `references/two_stage_review_protocol.md`, "Stage 3': Second Review (Verification Review)" and "Stage 3' to 4' Transition: Residual Coaching", give.
   - The response to reviewers is the response letter the revision wrote, and is left out when it wrote none.
   - Read the seven dimension scores and the overall score of Stage 3' from the "Dimension Scores" of the re-review report, and write them to `score_trajectory.re_review` of `state.json`, take those of Stage 3 from `score_trajectory.baseline` (item 6), and never make a score up.
   - Compute the score deltas of `references/score_trajectory_protocol.md`, "At Stage 3' (RE-REVIEW)", from those scores, and write them to `score_trajectory.deltas` of `state.json`.
   - A delta below -3 on any dimension is the stop "A regression after the re-review".
   - An overall delta below 3 points on the 0-100 rubric, with no P0 issue left, is the stop "The early-stopping suggestion".
   - The decision goes on as the stop "The re-review decision" says: Accept to Stage 4.5, Minor to the minor-items run of item 10, Major to Stage 4'.
   - Done when the re-review report stands and the user has answered at "The re-review decision".
9. Stage 3', the completeness check, after a Stage 4 for review comments in hand.
   - The session makes the comparison of `references/external_review_protocol.md`, "Step 4: Self-Verification (Completeness Check)", itself, from `external-comments.md` and the response letter the revision wrote: every comment answered, each answer matching the change, each claimed change made.
   - It reassesses no quality, issues no Editorial Decision and raises no revision request, as that step says, and `/paper-review-panel re-review` is not invoked.
   - Show the result at the stop "The checkpoint after the completeness check".
   - A comment left unanswered is the stop "An incomplete revision".
   - Done when the user has confirmed the result, and the run goes on to Stage 4.5.
10. The minor items of a Minor decision at Stage 3', once.
    - Write the minor items of the re-review report to `minor-revision-comments.md` in the run folder.
    - Invoke `/paper revision '<main.tex>' '<run folder>/minor-revision-comments.md'` through the Skill tool, with its own stops.
    - Done when `/paper revision` has ended, and the run goes on to Stage 4.5.
11. Stage 4', the re-revision, once, after a Major decision at Stage 3'.
    - Write the new Revision Roadmap and the R&R Traceability Matrix (Schema 11) of the re-review into one comments file in the run folder, `re-revision-comments.md`.
    - Invoke `/paper revision '<main.tex>' '<run folder>/re-revision-comments.md'` through the Skill tool, with its own stops.
    - Mark each issue it leaves unresolved as an Acknowledged Limitation in `revision_history` of `state.json`.
    - Done when `/paper revision` has ended.
12. Stage 4.5, the final integrity check: run "The integrity check" on the revised draft as Stage 4.5, at the depth of Mode 2.
    - Any verdict other than PASS with zero issues goes to the correction round, a PASS WITH NOTES with its notes as the list, within the same 3 rounds ("The integrity check" 6).
    - Start a fresh integrity agent for it, never the agent of Stage 2.5, since Stage 4.5 verifies every reference from scratch.
    - Done when the check ends with PASS and zero issues, or the user has decided at the stop "The third correction round failed".
13. End the run.
    - Write the audit trail of `references/reproducibility_audit.md`, "Audit Trail", to `audit-trail.md` in the run folder.
    - Show the full Progress Dashboard, with every detail and the audit trail, as `agents/state_tracker_agent.md`, "Dashboard Output Rules" 3, gives.
    - Deliver the final verified draft: name the main `.tex`, its `.bib`, each integrity record and each compliance report by its path, with the cumulative revision history: each round's decision, the items addressed and the items left as Acknowledged Limitations.
    - Write `pipeline_state: completed` in `state.json`.
    - Done when the message is sent.

## The integrity check

Stage 2.5 and Stage 4.5 of `manuscript`, and each run of `integrity`, run this check. `<stage>` is `2.5` or `4.5`, and `<n>` is the check's number at that stage: 1 for the first check, one more for each correction round.

1. Start the integrity agent as a fresh agent through the Agent tool, on the runner's general-purpose agent with the runner's defaults.
   - Give it `agents/integrity_verification_agent.md`, its mode (Mode 1 at Stage 2.5, Mode 2 at Stage 4.5), the manuscript of "What it reads" 2, `experiment-record.yaml`, the path of `material-passport.yaml`, the path of `lookup.py` and the pages of "What it reads" 11.
   - At Stage 4.5, also give it the records of Stage 2.5, which it compares as a supplementary check only.
   - Ask it to run the AI Research Failure Mode Checklist of `references/ai_research_failure_modes.md` at its stage, as that page's "How the checklist runs at each stage" says, and to write each of the 7 modes with its outcome (CLEAR, SUSPECTED or INSUFFICIENT EVIDENCE) and its evidence in its record.
   - It runs every phase of its page at its depth, Phase A to Phase E, then the ethics check of `references/ethics.md` as Phase F, the last part of its record.
   - Write its record, which it returns as its final message, to `integrity-<stage>-<n>.md` in the run folder.
   - Done when `integrity-<stage>-<n>.md` stands with its verdict, its ethics check and the outcome of each failure mode.
2. Start the compliance agent after it, through the Agent tool, as `agents/compliance_agent.md`, "Invocation protocol", says.
   - Give it the input contract of that page, with `stage` set to `<stage>`, the `compliance_mode` the manuscript's design gives, the manuscript, the path of `material-passport.yaml`, the answers of the stop "The run's configuration" and the pages of "What it reads" 12.
   - Write its `compliance_report`, which it returns as its final message, to `compliance-<stage>-<n>.md` in the run folder, and append it to `compliance_history[]` of `material-passport.yaml`.
   - Done when `compliance-<stage>-<n>.md` stands with its `block_decision` and `material-passport.yaml` holds the entry.
3. Record the check in `state.json`: `update_integrity` with the verdict, and one entry of `integrity_history`, as `agents/state_tracker_agent.md` gives them.
   - A check that passed sets `verification_status: VERIFIED` and `integrity_pass_date` in `material-passport.yaml`.
   - Done when `state.json` holds the entry.
4. Read the three decisions together, as `references/compliance_checkpoint_protocol.md`, "Decision precedence", gives: the integrity verdict, the failure-mode checklist and the compliance decision.
   - A SUSPECTED mode, or Mode 1, 3, 5 or 6 with INSUFFICIENT EVIDENCE, is the stop "The failure-mode block".
   - At Stage 4.5, a mode SUSPECTED at Stage 2.5 and still SUSPECTED blocks again, and no correction round skips it.
   - A `block_decision` of `block` is the stop "The compliance block".
   - A compliance `warn` is shown in the checkpoint's dashboard, and an `info` as a bullet of it.
   - An ethics verdict of BLOCKED is the stop "A BLOCKED ethics verdict", raised only for an issue `references/ethics.md`, "Verdict and stop", lets block.
   - An ethics verdict of CONDITIONAL is the stop "A CONDITIONAL ethics verdict".
   - A verdict of FAIL is the stop "A FAIL of an integrity check".
   - At Stage 4.5 of `manuscript`, a verdict of PASS WITH NOTES is the same stop, with its notes as the list, since the final check passes only with zero issues.
   - In a run of `integrity`, a PASS WITH NOTES ends the check, and its notes are shown with the result.
   - Done when each stop raised has its answer, or the check passed with none.
5. Carry out the user's answer at a stop of item 4.
   - At "The failure-mode block", a confirmed flag goes to `/paper revision` with the flagged modes and their evidence as its comments, in a file `failure-modes-<stage>-<n>.md` of the run folder, and the check runs again as a correction round (item 6).
   - At "The compliance block", choice (a) backfill takes the missing material from the user, which reaches the manuscript through `/paper revision` with the material as its comments, in a file `backfill-<stage>-<n>.md` of the run folder, and the compliance agent runs again (item 2).
   - Choice (b), manual handling, waits for the user's own edit of the manuscript, and the compliance agent runs again (item 2).
   - Choice (c), the override, starts the compliance agent again with the override and its rationale, as the Override Ladder of `references/compliance_checkpoint_protocol.md` gives it.
   - That agent returns its report with the `user_override` and the `disclosure_addendum`: write the report to `compliance-<stage>-<n>-override.md`, append it to `compliance_history[]` of `material-passport.yaml`, and write the addendum to `disclosure-addendum-<stage>-<n>.md` in the run folder.
   - Invoke `/paper revision '<main.tex>' '<run folder>/disclosure-addendum-<stage>-<n>.md'` through the Skill tool, with its own stops, so that the addendum reaches the manuscript's AI disclosure section.
   - At "A CONDITIONAL ethics verdict", each issue with its exact fix goes to `/paper revision` with the issue list as its comments, in a correction round of item 6, counted with the others.
   - A CONDITIONAL issue whose fix needs a fact only the user has is named in the final message of the run, and the run addresses it before it ends.
   - Done when each answer is carried out.
6. Run a correction round on a FAIL the user sends on.
   - Write the issue list of the record, sorted by severity with its `IL-` IDs and `EA-` IDs, to `corrections-<stage>-<n>.md` in the run folder, in the wording of Rules.
   - Invoke `/paper revision '<main.tex>' '<run folder>/corrections-<stage>-<n>.md'` through the Skill tool, with its own stops.
   - Resume the integrity agent with the corrected draft, which re-verifies the corrected items as its page's "Correction Process on FAIL" says.
   - Write its record to `integrity-<stage>-<n>.md`, with `<n>` one more than the check before, and run items 2 to 5 again.
   - At most 3 correction rounds run at a stage. A check that has not passed after the third is the stop "The third correction round failed".
   - Done when the check ends with PASS or PASS WITH NOTES in a run of `integrity` and at Stage 2.5 of `manuscript`, with PASS and zero issues at Stage 4.5 of `manuscript`, or the user has decided at that stop.

## Checkpoints

After each stage of `manuscript`, and at each stop of "The integrity check", the session holds a checkpoint as `agents/pipeline_orchestrator_agent.md`, "3. Checkpoint Management", gives its types (FULL, SLIM and MANDATORY), its type rules, its user engagement tracking and its templates.

- Stage 2.5 and Stage 4.5, an integrity FAIL and the decisions of Stage 3 and Stage 3' are MANDATORY checkpoints.
- A MANDATORY checkpoint is never skipped and waits for the user's explicit answer, even when the stage's result has no issue.
- At a FULL or MANDATORY checkpoint, the user can change the mode or the settings of the next step, within the runs Steps 5 fixes.
- The user can pause at any checkpoint and continue later, from the run's state (Steps 2).
- After the user says "just continue" or "fully automatic", the next checkpoints that are not MANDATORY are SLIM: one line of status and the explicit prompt to continue or pause.
- After 2 or more consecutive "continue" answers given without a look at the deliverables, the checkpoint is SLIM and asks whether the user wants to review the progress.
- After 4 or more consecutive "continue" answers, the checkpoint is SLIM with the awareness prompt of that page's "User Engagement Tracking".
- The user's answers act as that page's "Checkpoint Confirmation Semantics" gives them, and a stage is skipped only where its "Skippable vs Non-Skippable Stages" allows.
- A FULL checkpoint shows the decision dashboard of that page's FULL template, with the data its "Decision Dashboard Data Requirements" names.
- Each checkpoint ends with the simplified dashboard of `agents/state_tracker_agent.md`, "7. generate_dashboard", and the round-trip count of the run so far beside the stage's status.
- A run whose round-trip count passes the worst case of Steps 5 says so at the checkpoint, since a loop the caps do not cover is running.
- The round-trip count is advisory and never blocks the run.
- The full Progress Dashboard is shown whenever the user says "status", from `state.json`, in the form of `references/progress_dashboard_template.md` and `templates/pipeline_status_template.md`.
- Each checkpoint is written to `state.json`, with its type, as `agents/pipeline_orchestrator_agent.md`, "Writing the run's state", gives.

Before a FULL checkpoint is shown, the session asks itself five questions, and each answer that raises a concern is shown at the checkpoint:

1. Citation integrity: are there any unverified citations in the latest output?
2. Sycophantic concession: did the latest stage accept all feedback without pushback?
3. Quality trajectory: is the latest output at least as good as the previous stage's? If it is worse, the run pauses and the checkpoint says so.
4. Scope discipline: did the latest stage add content that neither the user nor the revision roadmap asked for?
5. Completeness: are all the deliverables of the stage present?

## Stops

The checkpoints wait for the user, and so does every other row but the five refusals at the end, which name their cause and leave nothing. A run of `paper` or `paper-review-panel` stops at its own stops, which its `SKILL.md` gives.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The entry point | A call matches no line of Quick start (Steps 1) | The Quick start line the request matches, with the materials found and what the entry stage needs | The user confirms the line or names another, and the run goes on with it |
| An unfinished run | A run folder of the same mode holds an unfinished state (Steps 2) | The Progress Dashboard of that run and the stage it stopped at | The user continues that run from its stage, or starts a new run |
| The record of the experiments | The project folder holds no `experiment-record.yaml` (Steps 4) | The question, asked once, whether the paper reports experiments of its own, with the result files found | The user's answer and, with experiments, the record built with the user, written before the run goes on |
| The run's configuration | Before the first stage (Steps 5) | The entry stage, the run or depth of each stage, the token estimate, the interaction-count budget and the questions of the compliance agent | The user confirms or adjusts it and answers the questions |
| The checkpoint after Stage 2 | `/paper full` has ended (manuscript item 4) | The FULL or SLIM checkpoint of "Checkpoints" | The user's answer, as "Checkpoint Confirmation Semantics" gives it, with continue going on to Stage 2.5 |
| The checkpoint after Stage 2.5 | The first integrity check passed (manuscript item 5) | The MANDATORY checkpoint with the verdict per phase and the ethics verdict | The user's explicit confirmation, with the run going on to Stage 3, or to Stage 4 with a comments file |
| The review decision | `/paper-review-panel full` has ended (manuscript item 6) | The MANDATORY checkpoint with the Editorial Decision and the counts of the Revision Roadmap, and for Reject the choice of a major restructuring at Stage 2 or the end of the run | The user's explicit answer: Accept to Stage 4.5, Minor or Major Revision to Stage 4, Reject to Stage 2 or to the end, with every material saved |
| The parsed comments | Review comments in hand were parsed (manuscript item 7) | The External Review Summary and the structured list of the comments | The user confirms the list or corrects it |
| The strategic coaching | Review comments in hand were confirmed (manuscript item 7) | Each question of `references/external_review_protocol.md`, "Step 2: Strategic Revision Coaching (External Revision Coaching)" | The user's answer, within 8 rounds; "just fix it" skips the coaching |
| An incomplete revision | `/paper revision` left items unaddressed (manuscript item 7), or the completeness check found a comment left unanswered (manuscript item 9) | Each item left, with its reason | The user goes on to the next stage or has the items revised again |
| The checkpoint after Stage 4 | `/paper revision` has ended (manuscript item 7) | The FULL or SLIM checkpoint | The user's answer, with continue going on to Stage 3' |
| A regression after the re-review | A score delta below -3 at Stage 3' (manuscript item 8) | Each dimension that regressed and by how much, and the reviewers' comments on it | The user proceeds and the regression is recorded, has Stage 4' fix only those dimensions, or has the pre-revision text of those sections restored |
| The early-stopping suggestion | The overall delta is below 3 points with no P0 issue left (manuscript item 8) | That the revision loop has converged, with the deltas | The user stops the revision loop and goes to Stage 4.5, or overrules it |
| The re-review decision | `/paper-review-panel re-review` has ended (manuscript item 8) | The MANDATORY checkpoint with the new decision and the residual issues | The user's explicit answer: Accept to Stage 4.5, Minor to one `/paper revision` run for the minor items and then Stage 4.5 (manuscript item 10), Major to Stage 4' |
| The checkpoint after the completeness check | The session's completeness check of a revision for review comments in hand has ended (manuscript item 9) | The MANDATORY checkpoint with each comment, its answer and whether the claimed change was made | The user's explicit confirmation, with the run going on to Stage 4.5 |
| The checkpoint after Stage 4' | `/paper revision` has ended (manuscript item 11) | The FULL or SLIM checkpoint, with the issues marked as Acknowledged Limitations | The user's answer, with continue going on to Stage 4.5 |
| The checkpoint after Stage 4.5 | The final integrity check passed with zero issues (manuscript item 12) | The MANDATORY checkpoint with the verdict per phase and the ethics verdict | The user's explicit confirmation, and the run ends (manuscript item 13) |
| A FAIL of an integrity check | The verdict is FAIL, or at Stage 4.5 of `manuscript` PASS WITH NOTES ("The integrity check" 4) | The MANDATORY checkpoint with the correction list sorted by severity, or the notes | The user's confirmation, and the correction round runs ("The integrity check" 6) |
| The third correction round failed | The check has not passed after 3 correction rounds ("The integrity check" 6) | The items still failing and the items that cannot be verified | The user decides, as `references/pipeline_state_machine.md`, "Integrity Check FAIL Loop", gives: handle them by hand, remove the citations that cannot be verified, or go on with a "partially unverified" warning |
| The failure-mode block | A mode is SUSPECTED, or Mode 1, 3, 5 or 6 has INSUFFICIENT EVIDENCE ("The integrity check" 4) | Each mode flagged with its detection questions and evidence | The user confirms the flag, and the passage is fixed by `/paper revision` and the check runs again ("The integrity check" 5), overrides it with reasons written in `state.json`, or revises the passage and the check runs again |
| The compliance block | The compliance agent's `block_decision` is `block` ("The integrity check" 4) | The block message of `references/compliance_checkpoint_protocol.md`, "On block", with the maturity note of `agents/compliance_agent.md` for a Mandatory item | The user picks (a) backfill, giving the missing material, which reaches the manuscript through `/paper revision` before the compliance agent runs again, (b) manual handling, editing the manuscript and having the compliance agent run again, or (c) the override of the Override Ladder, with its rationale. After an override, the session starts the compliance agent again with it, writes the `disclosure_addendum` it returns to a file of the run folder and gives that file to `/paper revision` as its comments ("The integrity check" 5) |
| A BLOCKED ethics verdict | The ethics check of the record is BLOCKED ("The integrity check" 4) | The problem and its resolution path, as `references/ethics.md`, "Verdict and stop", gives | The user accepts the fix, which goes to `/paper revision` before the check runs again, overrides with reasons written verbatim in `state.json`, or revises the passage |
| A CONDITIONAL ethics verdict | The ethics check of the record is CONDITIONAL ("The integrity check" 4) | Each issue with its exact fix, and each fix that needs a fact only the user has | The user's confirmation, and each fix goes to `/paper revision` in a correction round ("The integrity check" 5 and 6); a fix that needs a fact only the user has is named in the final message |
| A run that fails | A run of `paper` or `paper-review-panel`, or an agent, fails or ends with no output (any stage) | The error, with the state saved in the run folder | The user retries the run or pauses it. No integrity check or failure-mode block is skipped |
| No manuscript | The call gives no `<main.tex>`, or one that does not exist (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| No project folder | The `<project folder>` does not exist (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| No comments file | The `<comments file>` does not exist (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| A skill not installed | The `paper` folder, or for `manuscript` the `paper-review-panel` folder, with its `SKILL.md`, is in neither place of "What it reads" 5 (Steps 1) | That `researcher` runs that skill, with both paths | The skill installed, then `/researcher` again |
| lookup.py not found | The `paper` folder holds no `templates/lookup.py` (Steps 1) | That the integrity agent looks every reference up with it, with the path | `paper` installed whole, then `/researcher` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Skipping an integrity check because the paper looks fine | A paper that looks fine still holds the fabricated references the check exists to find | Run Stage 2.5 and Stage 4.5 in every run, whatever the perceived quality |
| The session writing, reviewing or verifying the paper itself | The run then lacks the runs and the agent whose checks it reports | Invoke `paper` and `paper-review-panel` through the Skill tool and start the integrity agent, and let the session only direct and record |
| Moving past a MANDATORY checkpoint with no answer | The user loses the decision the checkpoint exists for | Wait for the user's explicit answer at every MANDATORY checkpoint |
| A later stage worse than an earlier one | A long run loses its principles as its context fills, and a revision can be worse than the draft | When a stage's output is worse than the stage before, pause and read the principles again before going on |
| A revision that drops reviewer concerns in silence | A concern left out unmarked is never answered | Account for every concern in the R&R tracking table, each with its status |
| A final check that re-checks only the first check's issues | The revision can add new issues, which go unchecked | Run Stage 4.5 from scratch, with a fresh integrity agent |
| Skipping the failure-mode checklist or its block | The failures it looks for read like competent work and pass every other check | Run the checklist at Stage 2.5 and Stage 4.5, and record each override with the user's reasons in `state.json` |
| Changing a file of the manuscript outside `/paper revision` | The change bypasses `paper`'s patches, its checks and its own stops | Send every correction, fix and addendum to `/paper revision` as its comments |

## Rules

- The session holds the role of `agents/pipeline_orchestrator_agent.md`: it reads that page and follows it, and starts no agent for that role.
- The session holds the role of `agents/state_tracker_agent.md`: it writes the run's state itself, in that page's structure, and starts no agent for that role.
- The agents a run starts are the integrity agent and the compliance agent, each a fresh agent started through the Agent tool for each integrity check.
- Every run of `paper` and `paper-review-panel` is invoked through the Skill tool, with its own stops: `/paper full`, `/paper-review-panel full`, `/paper revision` and `/paper-review-panel re-review`.
- Every change the run makes to the manuscript is made by `/paper revision`, given its comments as a file of the run folder.
- The corrections the session sends to `/paper revision`, and every text of a record that reaches the manuscript, hold no file names, script names, paths, code identifiers, job, run or exit-code language or software-operations wording.
- A fact from code or a log is written in them as the scientific claim it supports.
- No correction and no record asks that a recorded null result be written into the manuscript.
- A claim that contradicts an entry of `negative_results[]` is a FAIL of the integrity check, corrected by changing the claim.
- The revision loop holds Stage 4 and Stage 4', one `/paper revision` run each, and after a Minor decision at Stage 3' one `/paper revision` run for its minor items, and no further revision run.
- This cap stands in place of the cap of `paper` on revision rounds across runs, and each run of `paper` keeps its own rounds.
- At most one Stage 4' runs, and after it the run goes to Stage 4.5 with no return to a review.
- A reference is confirmed when `lookup.py resolve` prints a record on one index or more with a ratio of 0.70 or above and no `DOI_MISMATCH`, read as the `paper` skill's `agents/citation_compliance_agent.md`, "Looking a reference up", says.
- A judged claim rests on a passage read in the run from the source's text, each passage line checked with `lookup.py quote-check`, as `agents/integrity_verification_agent.md`, "E2. Source Tracing", gives.
- The originality screen searches the web at both depths, as `references/plagiarism_detection_protocol.md` gives it.
- The user can pause or leave the run at any checkpoint, and can skip no integrity check.
- A run given the same input follows the same stages and checks in every session.
- Every artifact of a run carries its version label in `material-passport.yaml`, and the passport carries the `repro_lock` of `references/artifact_reproducibility_pattern.md`, as `references/reproducibility_audit.md` gives them.
- A run whose stages are split among the members of a team follows `references/team_collaboration_protocol.md` for the roles, the handoffs and the state of each member's run folder.
- The run folder holds `state.json`, `material-passport.yaml`, `external-comments.md` when review comments were in hand, `minor-revision-comments.md` after a Minor decision at Stage 3', each `integrity-<stage>-<n>.md`, each `compliance-<stage>-<n>.md`, each `corrections-<stage>-<n>.md`, each `failure-modes-<stage>-<n>.md`, `backfill-<stage>-<n>.md`, `compliance-<stage>-<n>-override.md` and `disclosure-addendum-<stage>-<n>.md` a block's answer wrote, `re-revision-comments.md` when Stage 4' ran and `audit-trail.md` at the end of a `manuscript` run.
- Every path and every value the user gives reaches a command as one argument in single quotes.
- The session's messages follow the user's language, and academic terms stay in English.
