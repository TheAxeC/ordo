# Checkpoints

The mode `manuscript` of `researcher` holds a checkpoint after each stage, and `integrity` and `manuscript` hold one at each stop of `references/integrity_check.md`, which the text below names "The integrity check". `novelty` and `idea` do not read this page. "Steps" with a number is an item of `SKILL.md`'s Steps, and a section named in quotes is a section of the page its sentence names.

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
