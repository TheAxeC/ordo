---
name: researcher
description: "Take an idea to results and a paper. novelty: a page of closest prior work, verdicts per claim. idea: README questions and claims. research: six stages, SLURM jobs, to results and a resumable README; adopt for one underway. full: idea, research, manuscript. integrity: checks of references, claims, numbers, figures, ethics. manuscript: writing, review, revision. revision: referees' new results, then revision. The last three keep a run folder. Triggers on: /researcher novelty|idea|research|full|integrity|manuscript|revision, is this idea new, the closest prior work, sharpen my research idea, from a sketch to a research question, take my idea to results, run the experiments of my project, continue my research project, adopt a project underway, from an idea to a paper, check the integrity of my manuscript, verify the references and claims of a finished draft, ethics check of a paper, full paper workflow, take my draft through review and revision, the referees asked for more experiments, revise with new results."
metadata:
  version: "1.0.0"
---

# From a research idea to results and a manuscript

`/researcher novelty` leaves a page of the closest prior work on each claim of an idea, with a verdict per claim, and a `.bib` of the works it confirmed, both in the project's `notes/`, and `/researcher idea` takes a rough sketch to research questions and claims in rounds of the interview and leaves a progress file and a novelty page per round in `notes/` and the questions and claims in the project's `README.md`. `/researcher research` takes the project through the stages Frame, Build, Baseline, Experiments, Compare and Consolidate, with a builder and a reviewer for each piece of code and every job on a cluster through the scheduler, and leaves the code, the results, the logs, the record of the experiments and a `README.md` from which a new session resumes, in the layout of `references/project_layout.md`; `/researcher research adopt` continues a project underway the same way, and `/researcher full` runs `idea`, then `research` and `manuscript`, leaving what each of them leaves. `/researcher integrity` checks a finished manuscript with a fresh integrity agent and a compliance agent, and `/researcher manuscript` takes a manuscript through the stages from the writing on: Stage 2 the writing, Stage 2.5 the first integrity check, Stage 3 the review, Stage 4 the revision, Stage 3' the re-review, Stage 4' the re-revision and Stage 4.5 the final integrity check, and a run of either leaves behind the run's state, each integrity record and each compliance report, each a file of its own in its run folder (Rules). `/researcher revision` answers the referee comments on a paper of a project: each comment that needs new results is run as a campaign of the stages of `research`, and then `/paper revision` and the stages of `manuscript` for comments in hand run with the new results, leaving the new results in the project as `research` leaves them, the revised paper with its response letter, and a run folder as `manuscript` leaves it.

## Quick start

```
/researcher full <project folder> [<sketch file>]                   take a rough idea to a paper: idea, then research and manuscript as it shows them and you confirm
/researcher full <sketch, more than two words>                      take a rough idea typed in the call to a paper, as the line above; the first message asks for the project folder
/researcher idea <project folder> [<sketch file>]                   take a rough sketch to research questions and claims in rounds of the interview, and write them into the project's README.md
/researcher idea <sketch, more than two words>                      take a rough sketch typed in the call through the interview, as the line above; the first message asks for the project folder
/researcher novelty <idea> [<project folder>]                       search the closest prior work on each claim of an idea, a sentence in quotes or a file, and write a page with a verdict per claim and a .bib
/researcher research <project folder>                               take the project's research questions to results through six stages, or resume it from its README.md at the stage that stands
/researcher research adopt <project folder>                         read a project underway that research did not start, and continue it from the first stage not done
/researcher manuscript <project folder>                             write the paper from the project's materials, then check it, review it, revise it and check it again
/researcher manuscript <project folder> --manuscript <name>         write a further paper of the project in manuscript-<name>/, with the same checks, review and revision
/researcher manuscript <main.tex>                                   take a draft that exists from the first integrity check through review, revision and the final check
/researcher manuscript <main.tex> <comments file>                   take a draft with review comments in hand: the first integrity check, then the revision for the comments
/researcher revision <project folder> <comments file> [--manuscript <name>]  answer referee comments on a paper of the project: new results by campaigns of research, then the revision, its response letter and the checks
/researcher integrity <main.tex>                                    check a finished manuscript at the full depth: references, citations, data, originality, claims, the ethics check last
/researcher integrity pre-review <main.tex>                         the same check at the sampled depth of the check before a review
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
| A revision for comments in hand, with no new results to make and no integrity check | `/paper revision` |
| A run already under way in a mode of `paper` or `paper-review-panel`, whose entry the user keeps | that mode of that skill |
| Someone else's paper to review as its referee | `/referee` |
| The prose of a draft to check | `/writing` |
| A design decision of a roadmap entry to settle before its plan opens | `/grill` |
| Code work on a tool or a product that has a roadmap, built step by step in worktrees | `/plan-orchestration` |

## What it reads

1. The call, as Quick start gives it: the mode, the depth of `integrity` and the arguments. `<idea>` is a sentence in quotes, or the path of a file that holds it, and is read from the file when it names a file that exists; every other argument is a path, except in a call of `idea` or `full` with more than two words after the mode, which reads the whole text after the mode as its sketch, a first word that looks like a path included, makes no folder from it, and in place of the refusal "No project folder" asks in its first message for the `<project folder>`, the stop "The project folder", before the mode's first item. A call of `novelty` with no `<idea>`, or with one that holds no word, is the refusal "No idea given". A call of `idea` with no argument is the refusal "No project folder", and its `<project folder>` that does not exist is made, a new project (Steps, "idea" item 3). A `<sketch file>` that does not exist is the refusal "No sketch file". A call whose `<main.tex>` is missing or does not exist is the refusal "No manuscript". For `manuscript`, `novelty` and `revision`, a `<project folder>` that does not exist is the refusal "No project folder". A `<comments file>` that does not exist, or a call of `revision` with no `<comments file>`, is the refusal "No comments file". A call of `research`, `research adopt` or `revision` with no `<project folder>`, or of `full` with no argument, is the refusal "No project folder". For `research` and `full`, a `<project folder>` that does not exist is made, a new project ("research" item 3, "idea" item 3). For `research adopt`, a `<project folder>` that does not exist or is empty is the refusal "Nothing to adopt". The `<name>` of `--manuscript` is one folder name of letters, digits, `-` and `_`, and any other `<name>`, or a `--manuscript` with no `<name>`, is the refusal "No manuscript name".
2. The manuscript: the main `.tex`, the files it inputs and includes, and its `.bib`, read by the integrity agent and the compliance agent.
3. The project folder: the `<project folder>` of the call, for a call given a `<main.tex>` the parent of the manuscript's folder, and for `novelty` with no `<project folder>` the folder the session runs in. For `integrity` and `manuscript` it holds the record of the experiments and the run folders, for `novelty` and `idea` its folder `notes/` holds the novelty pages, the `.bib` beside each page and the progress files they write, and for `research`, `research adopt`, `full` and `revision` it holds the layout of `references/project_layout.md`, or a project's own folders that its README records.
   - For `revision`, the project folder holds a `README.md` whose `## The stage and campaign that stand` names a stage of `research`, or the end of `research` that "research" item 17 writes, the README that `research` and `research adopt` write, and a project folder with no such README is the refusal "No project of research", which names `research adopt` and `research` as the modes to run first.
   - For `revision`, the manuscript's folder is `<project folder>/manuscript/`, or `<project folder>/manuscript-<name>/` with `--manuscript <name>`, and the manuscript is the `main.tex` of that folder, and a manuscript's folder with no `main.tex` is the refusal "No paper to revise", which names `manuscript` as the mode to run first.
4. The record of the experiments, the file `experiment-record.yaml` in the project folder: the `experiment_intake_declaration` and the `experiment_provenance[]` of Schema 9 in `references/handoff_schemas.md`, "Experiment Provenance Intake". The `research` mode writes it at its last stage. A project with no such file gets the stop "The record of the experiments".
5. The `paper` skill's folder, with its `SKILL.md`, found from this skill's folder with every link resolved: the folder of that name beside it, and otherwise the folder of that name in a group folder beside this skill's group folder. A folder found in neither place, or that holds no `SKILL.md`, is the refusal "A skill not installed" for `integrity`, `manuscript`, `research`, `research adopt`, `full` and `revision`, and the refusal "No paper for the novelty check" for `novelty` and `idea`, each naming both paths.
6. The `paper` skill's `templates/lookup.py`, in the folder of item 5, run as `python3 '<the paper skill's folder>/templates/lookup.py'` by the integrity agent in `integrity`, `manuscript` and `revision`, by the session in `novelty`, a run of `novelty` inside `idea` included, and by the session for the dataset of Frame in `research`. A folder that holds no such file is the refusal "lookup.py not found" for `integrity`, `manuscript`, `research`, `research adopt`, `full` and `revision`, and the refusal "No lookup.py for the novelty check" for `novelty` and `idea`.
7. For `manuscript` and `full` only, the `paper-review-panel` skill's folder, with its `SKILL.md`, found as item 5 finds the `paper` skill's folder. A folder found in neither place, or that holds no `SKILL.md`, is the refusal "A skill not installed".
8. The environment variables `S2_API_KEY`, `OPENALEX_API_KEY` and `CROSSREF_POLITE_EMAIL`, each optional and never printed, read by `lookup.py`.
9. For `integrity`, `manuscript` and `revision`, the two role pages the session reads and follows: `agents/pipeline_orchestrator_agent.md` for directing the stages, and `agents/state_tracker_agent.md` for the structure of the run's state.
10. The two role pages of the agents the session starts: `agents/integrity_verification_agent.md`, read by the integrity agent, and `agents/compliance_agent.md`, read by the compliance agent.
11. The pages the integrity agent is given with its role page: `references/integrity_review_protocol.md`, `references/plagiarism_detection_protocol.md`, `references/claim_verification_protocol.md`, `references/ai_research_failure_modes.md`, `references/ethics.md` and `references/handoff_schemas.md`.
12. The pages the compliance agent is given with its role page: `references/compliance_checkpoint_protocol.md`, `references/prisma_trAIce_protocol.md`, `references/raise_framework.md`, `references/ai_research_failure_modes.md` and `references/handoff_schemas.md`.
13. The pages the session reads at the step that names them: `references/pipeline_state_machine.md`, `references/mode_advisor.md`, `references/two_stage_review_protocol.md`, `references/external_review_protocol.md`, `references/score_trajectory_protocol.md`, `references/reinforcement_content.md`, `references/compliance_checkpoint_protocol.md`, `references/ai_research_failure_modes.md`, `references/ethics.md`, `references/reproducibility_audit.md`, `references/artifact_reproducibility_pattern.md`, `references/progress_dashboard_template.md`, `references/team_collaboration_protocol.md`, `templates/pipeline_status_template.md`, `references/integrity_check.md` and `references/checkpoints.md`, and for `novelty` and for `idea`, which runs it, `references/novelty_page.md`.
14. The worked runs the session reads before its first stage: `examples/full_pipeline_example.md`, a run from Stage 2, `examples/mid_entry_example.md`, a run from Stage 2.5, and `examples/integrity_failure_recovery.md`, a failed first check and its correction round.
15. An unfinished run of the same mode for the same manuscript: a run folder in the project folder whose `state.json` holds a `pipeline_state` of `running`, `awaiting_confirmation` or `paused`. That `state.json` names the same manuscript's folder in `manuscript_folder`, and a run whose `state.json` names none counts as `manuscript/`. Its mode is the `mode` its `state.json` names, which a run of `revision` writes (Steps 3), and for a `state.json` that names none the `<mode>` of its folder's name `researcher-runs/<mode>-<date>/`.
16. For `novelty`, the `paper` skill's `agents/citation_compliance_agent.md`, "Looking a reference up", which the Rules bullet on `lookup.py resolve` names, read by the session before its first `resolve`.
17. For `idea`, the sketch: the `<sketch file>` of the call, the call's text when item 1 reads it as the sketch, or else the words the user gives when the first message asks for them.
18. For `idea`, the project's `README.md`, when it exists: its section "Research questions and claims", read for a reopening, and its other sections, left as they stand.
19. For `idea`, the progress files `notes/idea-<YYYY-MM-DD>.md` of the project folder, `-2`, `-3` and so on included, of which only the newest is read, for the choices it holds still open.
20. For `research`, `research adopt`, `full` and `revision`, the project's `README.md`, its entry file, read first, in the sections of `references/project_layout.md`, "The README": its section `## The stage and campaign that stand`, which names the stage that stands for a project `research` started, and its `## Cluster facts`, the cluster's facts as the README records them, which Frame asks once and no later run asks again.
21. For `research`, `research adopt` and `revision`, the files of the project that the completion criteria of the stages name: `code/`, `code/results/`, `code/attic/README.md`, `logs/` and the briefs and reports of `notes/code/`, or the project's own folders that `## Where things live` names.
22. For `research`, `research adopt` and `revision`, the pages the session reads: `references/research_stages.md` at each stage ("research" items 4 to 17, "research adopt" items 1 and 2), `references/project_layout.md` ("research" items 1, 3 and 14, "research adopt" item 3), `references/research_brief.md` ("research" item 6), `references/slurm.md` at each job ("research" item 10), and `references/handoff_schemas.md`, Schema 9, with `references/artifact_reproducibility_pattern.md` for the record of the experiments ("research" item 17), each read in `revision` at the item of "research" that "revision" items 3 to 5 run.
23. The two role pages of the agents `research` and the campaigns of `revision` start: `agents/research_builder_agent.md`, read by the builder, and `agents/research_reviewer_agent.md`, read by the reviewer, each given `references/slurm.md` with it ("research" items 7 and 8).
24. For `full`, the README's section `## Next`, which records the modes `full` runs, in order, with the mode that stands ("full" item 1).

## Steps

Steps 1 to 6 run in order for `integrity`, `manuscript` and `revision`, which needs Steps 4 and 5 for its integrity checks. A run of `novelty`, `idea`, `research` or `research adopt` runs Steps 1 and then Steps 6, and skips Steps 2 to 5, since it has no run folder, no record of the experiments to read, no `state.json` and no compliance questions. A run of `full` runs Steps 1 and then Steps 6, and runs Steps 2 to 5 for its run of `manuscript` when it reaches it ("full" item 6).

1. Read the call and settle the mode, the depth and the entry stage.
   - The call's first word after `/researcher` is the mode: `novelty`, `idea`, `research`, `full`, `integrity`, `manuscript` or `revision`, and `research adopt` is the adopt mode of `research`.
   - Check the folders and the file of "What it reads" 5 to 7 first, before anything is written.
   - Check the arguments as "What it reads" 1 gives them, and for `revision` the project folder and the manuscript's folder as "What it reads" 3 gives them.
   - `/researcher integrity <main.tex>` runs the check at the depth of Mode 2 of `agents/integrity_verification_agent.md`, the full depth of the final check.
   - `/researcher integrity pre-review <main.tex>` runs the check at the depth of Mode 1, the sampled depth of the check before a review.
   - `/researcher manuscript <project folder>` enters at Stage 2, and `/researcher manuscript <project folder> --manuscript <name>` enters at Stage 2 for the paper in `<project folder>/manuscript-<name>/`.
   - `/researcher manuscript <main.tex>` enters at Stage 2.5, which a draft that enters midway never skips.
   - `/researcher manuscript <main.tex> <comments file>` enters at Stage 2.5 and goes on to Stage 4 with the comments file, as the row "INIT, Stage 4" of `references/pipeline_state_machine.md`, "Normal Flow Transitions", gives.
   - `/researcher revision <project folder> <comments file> [--manuscript <name>]` runs its subsection, "revision", on the `main.tex` of the manuscript's folder of "What it reads" 3, with the split of the comments ("revision" item 2) as its entry stage.
   - `/researcher novelty <idea> [<project folder>]` and `/researcher idea <project folder> [<sketch file>]` or `/researcher idea <sketch, more than two words>` run their subsections, with no depth and no entry stage.
   - `/researcher research <project folder>`, `/researcher research adopt <project folder>` and `/researcher full <project folder> [<sketch file>]` or `/researcher full <sketch, more than two words>` run their subsections, "research", "research adopt" and "full", with no depth and no entry stage.
   - A call with no mode word that asks whether an idea, a claim or a method is new, or for the closest prior work to one, is the stop "The entry point" with the line of `novelty` and the idea taken from the call.
   - A call with no mode word that asks to shape a sketch or a rough idea into a research question or claims is the stop "The entry point" with the line of `idea`.
   - A call with no mode word that asks to take an idea to results, or to run the experiments of a project, is the stop "The entry point" with the line of `research`.
   - A call with no mode word that asks to continue a research project is the stop "The entry point" with the line of `research` when the project's README names a stage of `research` in `## The stage and campaign that stand`, and with the line of `research adopt` otherwise.
   - A call with no mode word that asks to go from an idea to a paper is the stop "The entry point" with the line of `full`.
   - A call with no mode word that asks for new experiments, new analyses, another dataset or another baseline that referees asked for, such as "the referees asked for more experiments", is the stop "The entry point" with the line of `revision`.
   - Any other call that matches no line of Quick start is read against `agents/pipeline_orchestrator_agent.md`, "1. Intent Detection", and `references/mode_advisor.md`, and the line it matches is the stop "The entry point".
   - A request that only one function fits, such as a citation check alone, is answered with the skill of its row in "Use instead", and no run starts.
   - Done when the mode, its depth or its entry stage where the mode has one, and its inputs are known, or a refusal is raised.
2. Look for an unfinished run of "What it reads" 15.
   - Such a run is the stop "An unfinished run", with its Progress Dashboard.
   - Offer only a run of the same mode whose `manuscript_folder` is the manuscript's folder of the call: `manuscript/`, `manuscript-<name>/` for a call with `--manuscript <name>`, or the folder of the `<main.tex>`.
   - A run the user continues writes into its own run folder, goes on from the stage its state names, and skips Steps 3 to 6.
   - Done when no unfinished run stands, or the user has chosen to continue it or to start a new run.
3. Make the run folder and the run's state.
   - The run folder is `researcher-runs/<mode>-<date>/` in the project folder, beside the manuscript's folder, with `<date>` the local date, `date +%Y-%m-%d`.
   - When that folder exists, the run takes `<mode>-<date>-2`, then `-3`, and so on.
   - Both depths of `integrity` use the mode name `integrity`.
   - Write `state.json` in the run folder, in the structure `agents/state_tracker_agent.md`, "Tracked State Structure", gives, with `entry_point`, `current_stage`, `pipeline_state: initializing` and `pipeline_version` set to this skill's `metadata.version`.
   - Write `manuscript_folder` into `state.json` with them: the manuscript's folder of the call relative to the project folder, such as `manuscript/` or `manuscript-<name>/`.
   - For `revision`, write `mode: revision` into `state.json` with them.
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
   - For `revision`, show the order of "revision" with the run of each part: `/paper revision-coach` for the split, a builder and a reviewer for each piece of code and the jobs of each campaign, Consolidate, Stage 2.5, the coaching, Stage 4 `/paper revision`, the completeness check and Stage 4.5.
   - Explain the difference between the depths and between the runs, as the mode recommendation of that page asks, and say that the integrity checks cannot be skipped.
   - For a draft that enters midway, show the prerequisites of its entry stage as `agents/state_tracker_agent.md`, "6. check_prerequisites" and "Material Gap Detection", give them, and the result of the passport check of Steps 3: a prior integrity report informs the first check and never replaces it.
   - Estimate the token cost of the run from the manuscript's length and the mode.
   - Beside it, give the interaction-count budget: the round-trip caps the run enforces and the worst-case round-trip total they imply for the mode.
   - The caps are 2 full revision loops (Stage 4 and Stage 4'), one revision run for the minor items of a Minor decision at Stage 3', 8 coaching rounds after Stage 3, 5 after Stage 3', 8 coaching rounds of an external review, and 3 correction rounds at each integrity check.
   - For `revision`, write `pipeline_state: running` into `state.json` once the user confirms, as `agents/pipeline_orchestrator_agent.md`, "Writing the run's state", gives for a checkpoint passed.
   - For `revision`, the caps are one `/paper revision` run for the comments file, 8 coaching rounds of an external review, 3 correction rounds at each integrity check, and for each campaign the counts of `research`: 3 returns of a campaign to its own start, 2 returns of a piece of code to a builder after its first review, 2 implementation causes for one result, and the count of methods of the setting.
   - Ask, for the compliance agent, the AI tools used, each with its name, version, developer, stage and purpose, and the intended venue, the `user_metadata` of `agents/compliance_agent.md`, "Input contract".
   - Done when the user has confirmed the configuration, with each setting the user adjusted and the answers to the compliance questions written in `state.json`.
6. Go on with the subsection of the mode: "novelty", "idea", "research", "research adopt", "full", "integrity", "manuscript" or "revision".
   - Done when that subsection's last item is done.

### novelty

The session does every item of this subsection itself, with no agent (Rules). `<lookup.py>` below is `python3 '<the paper skill's folder>/templates/lookup.py'` ("What it reads" 6).

1. State the claims of the idea.
   - Read the idea as "What it reads" 1 gives it, or, inside `idea`, take the candidate claims of the round of the interview ("idea" item 5).
   - Write each claim as one sentence that says what the idea holds to be new: a method, a result, or a use of a known method on a new problem.
   - Number the claims `C1`, `C2` and so on, and show them before any search.
   - An idea that holds no claim the session can state is the stop "No claim to check", which asks the user for one.
   - Done when each claim is shown as one numbered sentence.
2. Search for the closest prior work on each claim, three searches per claim.
   - Run `<lookup.py> search '<the claim's own key terms>'`, three to six terms and never a sentence, since arXiv reads a sentence as its words joined by AND and can answer "not found" for it.
   - Run `<lookup.py> search '<the key terms a paper that had done it would use>'`: the field's own names for the method, the task and the result.
   - Make one web search with the claim's key terms.
   - Write down each query with where it ran, how many records it gave, and each index `lookup.py` left out with the reason it printed, for the page.
   - A claim whose two `lookup.py search` runs left out every index and whose web search found nothing is the stop "The searches did not run", which shows the reasons and asks the user to run the check again; such a claim gets no verdict.
   - Done when each claim has its three searches, each with its query, where it ran, its count and the indexes left out, or the stop is raised.
3. Pick the nearest works of each claim, at most five per claim, and read each one.
   - The nearest works are the records whose method, task or result comes closest to the claim, judged from their titles and then from the text read.
   - Read the abstract, or the passage that bears on the claim, of each nearest work in this run: from `<lookup.py> index-abstract '<DOI or arXiv ID>' --into '<folder>'`, `<folder>` a temporary folder made with `mktemp -d` before the first `index-abstract` of the run, or from the page the web search found.
   - A statement of what a work does rests on the text read in this run, and a work with no text read is not a nearest work.
   - Done when each claim has at most five nearest works, each with the text read for it.
4. Confirm each nearest work as the Rules bullet on `lookup.py resolve` says.
   - A confirmed work keeps the record `resolve` printed: its authors, year, title, venue and DOI or arXiv ID.
   - A work that is not confirmed is not cited as a reference: it moves to the list of works found and not confirmed, with what was searched and what `resolve` printed, and no verdict rests on it alone.
   - Done when each nearest work is confirmed with its record, or is on the list of works not confirmed.
5. Give each claim its verdict, `new`, `partly done` or `done`, with the reason, from the confirmed works alone.
   - `done`: a confirmed work already does what the claim says.
   - `partly done`: confirmed works do part of what the claim says, and the reason names the part the idea adds.
   - `new`: the reason says, in the same sentence, that no closer work was found by these searches, and names each index a search of the claim left out.
   - The reason of a `new` or a `partly done` verdict names each work found and not confirmed for that claim, so that a reader checks it.
   - Done when each claim has its verdict and its reason.
6. Write the page in the form of `references/novelty_page.md`, and the `.bib` of its confirmed works beside it.
   - The page is `notes/novelty-<YYYY-MM-DD>.md` in the project folder ("What it reads" 3), with `<YYYY-MM-DD>` the local date, `date +%Y-%m-%d`, and `notes/` made with `mkdir -p '<project folder>/notes'` when it is missing.
   - When that file exists, the page takes `novelty-<YYYY-MM-DD>-2.md`, then `-3`, and so on.
   - Per claim, the page gives the nearest works with their records, what each already does, what the idea adds beyond them and the verdict with its reason, then the works found and not confirmed, then the searches made with the indexes left out.
   - The `.bib` is `notes/novelty-<YYYY-MM-DD>.bib`, with the page's suffix, holding one entry per confirmed work, a work that is a nearest work of several claims written once: the standard output of `<lookup.py> bibtex '<DOI or arXiv ID>'`, appended when the command exits 0.
   - A confirmed work for which `bibtex` prints no entry, or that has no DOI and no arXiv ID, is named on the page as having no entry, with what `bibtex` printed.
   - Remove the temporary folder of item 3 with `rm -r '<folder>'`, when item 3 made one.
   - Done when the page, read back, holds every claim with its verdict and every search with its query, the `.bib` holds an entry for each work the page does not name as having none, and no temporary folder of the run is left.
7. End the run.
   - Name the page and its `.bib` by their paths, and give each claim with its verdict.
   - Say how the page reaches `paper`: the user names the `.bib` in the Existing Materials row at `paper`'s intake, so that the literature strategist starts from the confirmed works and still runs its own search (Phase 1); the page is not given as the user's own sources that let Phase 1 be skipped.
   - Inside `idea`, this item is left out, and the verdicts go into the next round of the interview ("idea" item 7).
   - Done when the message is sent.

### idea

The session holds the interview itself, in rounds of the interview, with no skill invoked and no agent started (Rules): a fact a file of the project, `lookup.py` or a web search gives is looked up by the session and not asked. The choices of the idea are the problem, the claim, the baseline, the metric, and the result that would show it works. The claim waits on the problem, the baseline and the metric wait on the claim, and the result that would show it works waits on the baseline and the metric.

1. Look for an interview left unfinished: the newest progress file of "What it reads" 19, when it holds a choice still open.
   - Such a file is continued: its settled answers stand, its open choices are drawn again (item 4), and the first round of the interview says that it continues from that file and that answers to an earlier round of the interview are given again against this one.
   - An interview continued skips items 2 and 3.
   - Done when the newest progress file holds no choice still open, or none exists, or the interview continues from it at item 4.
2. Look for a reopening: a `README.md` whose section "Research questions and claims" holds research questions and claims, when the newest progress file holds no choice still open, or none exists.
   - The reopening evidence is what changes the research questions: the result of the Compare stage of `research`, when that stage sends the work here, or else what the user gives at the stop "A reopening", which shows the research questions and claims that stand.
   - The choices the reopening evidence bears on are open again, each with the reopening evidence beside it, and the other choices stand as the section gives them.
   - Done when no reopening stands, or the reopened choices and the reopening evidence are known.
3. Take the sketch and write the progress file.
   - The sketch is the `<sketch file>` of the call, or the call's text when "What it reads" 1 reads it as the sketch; with neither, ask for it in the first message, the stop "The sketch". A reopening takes the section that stands and the reopening evidence in place of a sketch.
   - Make the project folder with `mkdir -p '<project folder>/notes'` when it does not exist, a new project.
   - Write the progress file `notes/idea-<YYYY-MM-DD>.md`, with `<YYYY-MM-DD>` the local date and `-2`, `-3` and so on when that file exists: the sketch, or the reopened section with the reopening evidence, as quoted text, then one line per choice of the idea, `open` or `settled: <the answer>`, then a list of the novelty pages of the interview, empty at the start.
   - Done when the progress file, read back, holds the sketch and every choice of the idea.
4. Draw the choices: each choice of the idea settled or open, each open one with the choices it waits on.
   - Look up each fact a choice needs, as the paragraph above says, before the choice is drawn: a dataset or a baseline the project's files name, a work in the literature.
   - Draw the options of each choice to ask, the claim choice's options among them.
   - Done when every choice is marked settled or open, and the choices to ask in the next round of the interview are every open choice whose prerequisites are settled, each with its options.
5. Check the candidate claims of the next round of the interview: run `novelty` once over them, as "novelty" items 1 to 6 give it, one page for the round.
   - The candidate claims are each option of the claim choice the next round will ask, and the claim a round settled that no novelty page of the interview has checked.
   - A settled claim the page finds `done` is the stop "A claim found done": the claim choice is open again, never with that claim as it stands.
   - An option found `done` is sharpened beyond the works the page names, or it is dropped.
   - Each sharpened option, and each option of a claim choice that this item opened again, drawn as item 4 draws options, is checked in one more run of `novelty`, with its own page.
   - A sharpened option found `done` in that run is dropped.
   - A candidate claim that a run of `novelty` gave no verdict, at the stop "The searches did not run", stays a candidate claim, unchecked, and this item checks it again after the user's answer.
   - A round with no candidate claim, such as a first round whose claim choice waits on the problem, runs no check.
   - Each page gives its section "The idea" as `references/novelty_page.md` gives it for a page made by `idea`.
   - Add each page's path to the progress file, and record each claim found `done` with the page that shows it.
   - Done when each candidate claim has its verdict on a page the progress file names, or the round has no candidate claim.
6. Go to item 10 when no choice is open and the settled claim has a verdict other than `done` on a page of the interview; a settled claim with no verdict goes back to item 5.
   - Done when the interview goes on to item 7 or to item 10.
7. Ask the round of the interview, in one message, the stop "A round of the interview".
   - The message opens with the pages of item 5, each named, and a settled claim found `done` comes first as a choice of its own: a sharpened claim, another claim, or the claim dropped.
   - Each choice of the round of the interview has its lettered options, the pros and the cons of each, one recommendation with its reason, and the lazy option named, or "none" with the reason.
   - Each option of the claim choice is shown with its verdict and its page, or as unchecked with the stop "The searches did not run" named.
   - The message ends with the answer form: `<n> => <letter or text>` one line per choice, and `<n> Agree` to take the recommendation.
   - Done when the message is sent and the turn has ended.
8. Read the answers and write each one into the progress file as it settles, with the choices still open.
   - An answer that cannot be read as one of the options is asked again in the next round of the interview.
   - The user may answer part of a round of the interview, and the choices left open stay open.
   - A claim the user writes in place of an option is a settled claim that item 5 checks before the next round of the interview.
   - Done when the progress file, read back, holds each settled answer and marks each other choice `open`.
9. Go back to item 4.
   - Done when item 6 sends the interview on to item 10.
10. Show the section the README will hold, the stop "The end of the interview".
    - The section is `## Research questions and claims`: each research question, formed from the problem and the claims settled, then each claim with the result that would show it, the baseline and the metric, and the novelty page that covers it.
    - In a reopening, each changed research question is written with the reopening evidence that changed it and the progress file that records it.
    - The user's words go into the section as the Rules bullet on the user's words says.
    - Done when the user has confirmed the section, or corrected it and the corrected section is shown.
11. Write the section into the project's `README.md` and close the progress file.
    - In a `README.md` that exists, the section takes the place of the section of that heading, or stands first after the README's title when it has none, and every other section stays as it stands.
    - A project with no `README.md` gets one: a title line `# <the project folder's name>` and the section.
    - Write `The interview ended: <date>` into the progress file, with the README named.
    - Done when the README, read back, holds the section, and the progress file holds the end line.

### research

The session directs the work through the six stages of `references/research_stages.md`, each with its completion criterion there, and builds nothing itself (Rules). `<lookup.py>` below is `python3 '<the paper skill's folder>/templates/lookup.py'` ("What it reads" 6). Each stage ends with the README written and the stage that stands named in `## The stage and campaign that stand` (Rules).

1. Read the project folder and settle where the run starts, before anything is written.
   - A folder that does not exist or is empty is a new project, which starts at item 3.
   - A folder that holds only what `idea`, `novelty` and `full` write is a new project too, which starts at item 3.
   - What those modes write is a `README.md` whose `##` sections are `## Research questions and claims`, with or without a `## Next` that records the modes of `full`, and a `notes/` that holds only progress files, novelty pages and their `.bib` files.
   - A `README.md` whose `## The stage and campaign that stand` names a stage of `research` is a project `research` started, which resumes at item 2.
   - Any other folder is the stop "A project underway", which offers `/researcher research adopt <project folder>`.
   - Done when the run goes on at item 2 or item 3, or the stop is raised.
2. Resume a project `research` started from its README alone.
   - Read the README whole, then the files its `## The stage and campaign that stand` names: the brief and the two reports of the piece of code that stands, and the log and the result file of each job id it holds.
   - A job whose log in `logs/` does not show its end has not ended: name it with its id at the stop "The jobs submitted", and poll only when the user asks for it, as `references/slurm.md`, "Submitting", gives.
   - The item of each stage is 4 for Frame, or 5 when the README holds each answer of item 4, 9 for Build, 11 for Baseline, 12 for Experiments, 13 for Compare and 16 for Consolidate.
   - Done when the stage and the campaign that stand and the state of each job are known, and the run goes on at the item of that stage.
3. Make the layout of a new project, as `references/project_layout.md`, "The tree", gives it.
   - Make each folder with `mkdir -p '<project folder>/<folder>'`.
   - Write `code/README.md` and `code/attic/README.md` with a title line each, and `code/.depositignore` with the line `data/`, each only when it does not exist.
   - Write the README's sections of `references/project_layout.md`, "The README", in their order, each holding `None yet.` except the two sections the next bullets keep.
   - A `## Research questions and claims` that `idea` wrote stays as it stands, first after the title.
   - A `## Next` that records the modes of `full` stays as it stands, last.
   - A project with no README gets the title line `# <the project folder's name>`.
   - Write `Frame` as the stage that stands in `## The stage and campaign that stand`, so that a new session resumes at Frame.
   - Done when each folder of the tree exists and the README, read back, holds every section in order and names Frame as the stage that stands.
4. Frame: ask what the run needs, the stop "Frame's questions", in one message.
   - Take the research questions and claims, each claim with its baseline and its metric, from `## Research questions and claims` when `idea` wrote it, and ask for them when it did not.
   - Ask what counts as good enough, and the limits on storage, compute, time and access.
   - Ask the setting, manual or automatic. Under manual the run stops at each result that does not beat the baseline or does not reach what was set. Under automatic it tries methods by itself until a result beats the baseline or the count of methods the user gives is reached.
   - Ask the cluster's facts when `## Cluster facts` holds none: whether the work runs on a cluster, and for a cluster its scheduler, its partitions, its account, its modules, its scratch storage and its time limits.
   - Give each question its options and a recommendation, from what the project's files and a lookup show.
   - Write the answers into `## Research questions and claims`, in the form `idea` writes it ("idea" item 10) when `idea` did not, into `## Constraints and limits` and into `## Cluster facts`.
   - Done when the README, read back, holds each answer.
5. Frame: the dataset, the stop "The dataset".
   - Find candidate datasets with a web search, and the published works that report on each with `<lookup.py> search '<the dataset's name> <the task's key terms>'`.
   - Show each candidate with its size, its licence, how it is obtained, the published works that report on it and whether it fits each limit of `## Constraints and limits`, with one recommendation and its reason.
   - Write the user's choice and its reason into `## Constraints and limits`, and where its raw inputs stand into `## Where things live`.
   - Done when Frame's completion criterion holds and the README names Build as the stage that stands.
6. Write the brief of one piece of code, in the form of `references/research_brief.md`, to `notes/code/<piece>-brief-<n>.md`.
   - A piece of code is a unit a stage needs: in Build each piece the baseline needs, in Experiments a campaign's method, in Compare a dead end to keep or the fault an implementation cause names.
   - The research question and the user's words reach the brief as quoted lines, as the Rules bullet on the user's words says.
   - Link the brief from `## The stage and campaign that stand`.
   - Done when the brief, read back, holds each section of the form.
7. Start the builder of `agents/research_builder_agent.md` as a fresh agent through the Agent tool, on the runner's general-purpose agent with the runner's defaults.
   - Give it its role page, the brief, the README and `references/slurm.md`.
   - It works in the project's `code/`, with no worktree, no landing and no ledger.
   - Write its report, which it returns as its final message, to `notes/code/<piece>-builder-<n>.md`, linked from the README.
   - Done when the builder's report stands.
8. Start the reviewer of `agents/research_reviewer_agent.md` as a fresh agent through the Agent tool, on the runner's general-purpose agent with the runner's defaults.
   - Give it its role page, the brief, the builder's report, the README and `references/slurm.md`.
   - Write its report, which it returns as its final message, to `notes/code/<piece>-review-<n>.md`, linked from the README.
   - Send each finding of the report back to a builder through a new brief with `<n>` one more, which quotes it (item 6), and run items 7 and 8 again.
   - A piece goes back to a builder at most twice after its first review.
   - A third review that still reports a finding that makes a result false is the stop "A piece of code that does not pass its review".
   - Submit no job of the baseline or of the experiments from the piece before its first reviewer's report, or while its newest reviewer's report holds a finding that makes a result false; on a cluster the small local test is the one job of the piece submitted before the review, since nothing may compute on the login node and the test produces no result (`references/slurm.md`, "A small local test").
   - Done when the newest reviewer's report holds no finding that makes a result false, or the stop is raised.
9. Build: have each piece of code the baseline needs built and read, by items 6 to 8 for each piece.
   - The pieces are the loading and the split of the dataset, the metric, the baseline method, `code/run_all.sh` and `code/paper.py`, the last two as `references/project_layout.md`, "The tree", gives them.
   - The brief of `code/run_all.sh` holds the case of a raw input missing, which names that input before any work.
   - A later piece that adds a result, a table or a figure brings `code/run_all.sh` and `code/paper.py` in line with it in its own brief, so that both stay true as results are added.
   - Done when Build's completion criterion holds and the README names Baseline as the stage that stands.
10. Run each job of a stage, as `references/slurm.md` gives it.
    - On a cluster, run each job from its script in `code/hpc/`, submitted with `sbatch` from that folder.
    - On a cluster, compute nothing on the login node.
    - Make `logs/` with `mkdir -p '<project folder>/logs'` before the first submission, since the scheduler makes no folder for a job's output.
    - Off a cluster, run the job's command where the session runs, with its output and its error file in `logs/`.
    - After submitting, write each job id to `## The stage and campaign that stand`.
    - Once the job ids are written, stop at "The jobs submitted".
    - Poll only when the user asks for it in the run.
    - Stop polling when the user asks.
    - A job whose log shows an error, or whose result file lacks a value the metric asks for, is the stop "A job that fails".
    - Done when each job id stands in the README and the run has stopped, or each job has ended and its log and its result file are read.
11. Baseline: run the baseline under the conditions of Frame, as item 10 gives a job.
    - Write its result to `code/results/` with the command that made it, and its line into `## Results`.
    - Done when Baseline's completion criterion holds and the README names Experiments as the stage that stands.
12. Experiments: run each campaign, each with its own method and its own section in `## The stage and campaign that stand`.
    - Have each campaign's code built and read by items 6 to 8, and run its jobs by item 10.
    - A campaign can send the work back to its own start, with the reason in its section, at most 3 times, after which its results go on to Compare.
    - A new campaign is added with a section of its own.
    - Write each result to `code/results/` with the command that made it, and its line into `## Results`.
    - Done when Experiments' completion criterion holds and the README names Compare as the stage that stands.
13. Compare: read each result against the baseline and against what Frame set as good enough.
    - Write in `## Results`, for each result, whether it beats the baseline and whether it reaches what was set.
    - Done when each result of the campaigns that stand has its line.
14. Diagnose each result that does not beat the baseline or does not reach what was set.
    - Name the cause as the dataset, the method, the implementation or the research question, with the evidence from the result files, the logs and the code.
    - Write a proposal: a new method, which is a change of objective, of optimisation or of model structure; a change of the method; or another dataset.
    - Write the diagnosis and the proposal into the README, or into a file `notes/diagnosis-<campaign>-<YYYY-MM-DD>.md` that the README links.
    - A method that did not beat the baseline is a dead end: have it moved into `code/attic/` by items 6 to 8, indexed in `code/attic/README.md` and listed in `## Dead ends` with why it failed, as `references/project_layout.md`, "The dead ends", gives.
    - Record each such result as guidance for the next method, as the Rules bullets on a result that does not beat the baseline say.
    - Done when each such result has its diagnosis with its cause and its proposal, and each dead end stands in `code/attic/` and in `## Dead ends`.
15. Send the work on, by the setting of `## Constraints and limits`, which the user can change at any time in words.
    - Manual: a result that does not beat the baseline is the stop "A result that does not beat the baseline", which shows its diagnosis with what was tried and the proposal.
    - Manual: a result that beats the baseline and does not reach what was set is the stop "A result short of what was set, in `research`", which shows its diagnosis with what was tried and the proposal.
    - Automatic: go on by itself with each proposal, one method at a time with its diagnosis written.
    - Automatic: stop trying methods when a result beats the baseline, which goes on to Consolidate, or when the count of methods is reached, the stop "The count of methods reached".
    - A result that beats the baseline and does not reach what was set goes on to Consolidate in the automatic setting, and in the manual setting on the user's word at its stop.
    - Such a result is named in `## Results` as below what was set, and item 18's message names it the same way.
    - The causes below send on each result that does not go to Consolidate, and each proposal the user takes at a stop.
    - A dataset cause reopens Frame's choice of the dataset at item 5, the stop "The dataset", in either setting.
    - A research question cause reopens `idea` with the diagnosis as the reopening evidence, as "idea" item 2 gives it, in either setting, and Frame then runs again at item 4 on the research questions `idea` writes.
    - An implementation cause sends the work to Build with a brief for the fault (items 6 to 8), at most twice for one result.
    - A third implementation cause for one result is the stop "A result that does not beat the baseline", in either setting.
    - A method cause sends the work to Experiments with the new method as a campaign (item 12).
    - A stop and the end of the count show what was tried and the next proposal, and never propose to drop the idea after one method.
    - When Compare's completion criterion holds, the README names Consolidate as the stage that stands.
    - Done when the README names the stage the work goes to, or a stop is raised.
16. Consolidate: run `code/run_all.sh` once from the raw inputs in a clean copy of `code/`, and compare what it yields with what is reported.
    - Make the clean copy with `rsync -a --exclude '/data/' --exclude '/results/' --exclude '/figures/' --exclude '/attic/' '<project folder>/code/' '<copy>/'`, which copies none of the four folders.
    - `<copy>` is the folder `code` inside a folder `mktemp -d` makes, on the scratch storage `## Cluster facts` names on a cluster.
    - Make `logs/` beside `<copy>` with `mkdir -p`, so that the job scripts' `../../logs/` of `references/slurm.md` writes there.
    - Run `'<copy>/run_all.sh' '<the folder of the raw inputs>'` once, through the scheduler on a cluster as item 10 gives a job.
    - Compare each number and each table it yields by its values, and each figure by the values `paper.py` draws it from, with the reported one in `code/results/` and `code/figures/`, and write the comparison to `notes/reproduction-<YYYY-MM-DD>.md`, linked from the README.
    - Call a number reproduced only after this run shows it equal to the reported one.
    - A difference sends the work back to the stage that made the number, the table or the figure, Baseline or Experiments, and Consolidate then makes one more reproduction run.
    - A second reproduction run that still differs is the stop "A number that does not reproduce".
    - Copy the reproduction run's logs into the project's `logs/` with `cp`, then remove the folder `mktemp -d` made with `rm -r` once the comparison is written.
    - Done when the comparison shows no difference, or the stop is raised.
17. Consolidate: write the record of the experiments, `experiment-record.yaml` in the project folder, in the form of Schema 9 of `references/handoff_schemas.md`, "Experiment Provenance Intake".
    - Write `experiment_intake_declaration` with `status: experiments_declared`, `declared_at` and `declared_by: scholar`.
    - Write one entry of `experiment_provenance[]` for each experiment of `## Results`: its `experiment_id`, its `title`, its `repro_lock` in the shape of `references/artifact_reproducibility_pattern.md`, its `planned_vs_executed[]` with each result file, metric and value, and its `known_limitations[]`.
    - Fill each entry's `negative_results[]` from the dead ends of `## Dead ends` for that experiment: a list the integrity check holds claims against, which is never manuscript content.
    - Load the file as YAML after the write, and check that it holds one entry for each experiment of `## Results`.
    - Done when Consolidate's completion criterion holds, so that the stop "The record of the experiments" does not arise for this project, and the README names the end of `research` as the stage that stands.
18. End the run.
    - Write `## Next` with the next actions.
    - Write `## Papers` with each paper the results serve.
    - Name the results, `experiment-record.yaml` and the comparison of item 16 by their paths, each result below what was set named as such, and give the line `/researcher manuscript <project folder>` for the first paper and `/researcher manuscript <project folder> --manuscript <name>` for a further one.
    - A further paper the user asks for in words is written in `manuscript-<name>/`, or as a new project that copies the code it needs when the user asks for that, as `references/project_layout.md`, "Several papers", gives.
    - Inside `full`, this item is left out, and `full` goes on at its item 5.
    - Done when the message is sent.

### research adopt

The adopt mode reads a project underway that `research` did not start, moves nothing, and then goes on as `research`.

1. Read the README first, when it is usable, and check each stage it calls done.
   - A usable README holds the section `## The stage and campaign that stand`.
   - Check each stage the README calls done, in stage order, against its completion criterion in `references/research_stages.md`, in the project's files.
   - A result that is partial, unfinished or below what Frame set as good enough counts as not done.
   - The first stage whose completion criterion fails is where the run continues.
   - Done when that stage is known, or the README is not usable.
2. With no usable README, read the project against each stage in order, the stop "What the adopt mode found".
   - Show, for each stage, what the files show of it, with the file that shows it, and whether its completion criterion holds, a result that is partial, unfinished or below what was set counted as not done.
   - The first stage whose completion criterion fails is where the run continues.
   - Done when the user has confirmed what was found, once, with each correction the user gives.
3. Write the README's sections of `references/project_layout.md`, "The README", that the README lacks, after its own sections, and change none of its own.
   - Record in `## Where things live` the project's own name for each folder, as `references/project_layout.md`, "A project underway", gives.
   - Move no file and no folder of the project.
   - Name the stage of item 1 or item 2 in `## The stage and campaign that stand`.
   - A project with no README gets one, with the title line `# <the project folder's name>` and the sections.
   - Done when the README, read back, holds every section of the layout and its own sections as they stood.
4. Go on as `research` from that stage, at the item "research" item 2 names for it.
   - Done when the last item of "research" is done.

### full

`full` runs `idea`, then `research` and `manuscript`, each as its subsection gives it, with its own stops.

1. Read the README's `## Next`, when the project has a README.
   - When it records the modes of `full`, go on from the mode that stands: at item 4 for `research` or `research adopt`, at item 5 after it, and at item 6 for `manuscript`.
   - Done when the run goes on from the mode that stands, or no modes of `full` are recorded.
2. Run `idea` as "idea" gives it, with the call's sketch: its `<sketch file>`, or its text when "What it reads" 1 reads it as the sketch.
   - Done when the last item of "idea" is done.
3. Show the modes it will run and the ones it leaves out, each with its reason, the stop "The modes of full".
   - Leave `research` out for a review paper, and when results exist that the adopt mode's reading ("research adopt" items 1 and 2) counts as done, with `manuscript` run on them.
   - Count results that exist but are partial, unfinished or below what Frame set as not done.
   - Run `research` on a project that holds only what `idea`, `novelty` and `full` write, and on a project `research` started ("research" item 1).
   - Run `research adopt` on a project underway that `research` did not start.
   - Write the modes, in order, with the mode that stands, into `## Next`.
   - Done when the user has confirmed, once, and `## Next` holds the modes.
4. Run `research` or `research adopt`, when the modes hold it, as its subsection gives it.
   - Say which mode ends and which begins.
   - Write the mode that stands into `## Next`.
   - Done when "research" item 17 is done, or the run has stopped at one of its stops.
5. Check the results before `manuscript`, when `research` or `research adopt` ran.
   - Name each result that is partial, unfinished or below what Frame set as good enough as such, at the stop "A result short of what was set".
   - Go on to `manuscript` on such a result only with the user's word.
   - The stop offers `manuscript` only for a result that beats the baseline.
   - For a result that does not beat the baseline, the stop offers the next proposal of Compare and the way back to Experiments ("research" item 15), and never `manuscript`.
   - Done when each result the paper reports beats the baseline and reaches what was set, the user's word sends a result that beats the baseline on to `manuscript`, or the run has gone back to Experiments.
6. Run `manuscript` as "manuscript" gives it, for `/researcher manuscript <project folder>`, with Steps 2 to 5 first.
   - Say that the mode before ends and `manuscript` begins.
   - Write `manuscript` as the mode that stands into `## Next`.
   - Done when the last item of "manuscript" is done, and `## Next` records that the modes of `full` have run.

### integrity

1. Run the integrity check of `references/integrity_check.md` once on the manuscript: as Stage 4.5 at the full depth, or as Stage 2.5 for `pre-review`.
   - Hold each stop the check raises as a checkpoint, as `references/checkpoints.md` gives it.
   - Done when the check ends with PASS or PASS WITH NOTES, or the user has decided at the stop "The third correction round failed".
2. End the run.
   - Hold the MANDATORY checkpoint of the result as `references/checkpoints.md` gives it, and show the result in the MANDATORY checkpoint template of `agents/pipeline_orchestrator_agent.md`, "MANDATORY Checkpoint Template (Integrity)", without its "Next step" line.
   - Name each integrity record and each compliance report of the run folder by its path.
   - Write `pipeline_state: completed` in `state.json`.
   - Done when the message is sent.

### manuscript

1. Before the first stage, read the worked runs of "What it reads" 14 and the stages and transitions of `references/pipeline_state_machine.md`.
   - The stages run in the order of that page, from the entry stage of Steps 1, as items 4 to 12 give them.
   - Every stage is followed by its checkpoint (`references/checkpoints.md`) and, after the user's confirmation, by its transition (item 2), before the next stage begins.
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
   - Set `verification_status: UNVERIFIED` after a stage that changed the manuscript, and `VERIFIED` with `integrity_pass_date` after an integrity check that passed (`references/integrity_check.md` 3).
   - Carry forward the aggregates `agents/pipeline_orchestrator_agent.md`, "4. Transition Management", names, `experiment_alignment_results[]` among them.
   - Done when `material-passport.yaml` names the stage's output by its version label.

4. Stage 2, the writing, for a call given a `<project folder>`.
   - Invoke `/paper full '<project folder>'` through the Skill tool, with its own stops, and for a call with `--manuscript <name>`, `/paper full '<project folder>' --manuscript '<name>'`.
   - When the project's README holds `## Papers`, add the paper's folder to it, with the results the paper reports.
   - Done when `/paper full` has ended and `<project folder>/manuscript/`, or `<project folder>/manuscript-<name>/` for a call with `--manuscript <name>`, holds the main `.tex` and its `.bib`.
5. Stage 2.5, the first integrity check: run the integrity check of `references/integrity_check.md` on the draft as Stage 2.5, at the depth of Mode 1.
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
12. Stage 4.5, the final integrity check: run the integrity check of `references/integrity_check.md` on the revised draft as Stage 4.5, at the depth of Mode 2.
    - Any verdict other than PASS with zero issues goes to the correction round, a PASS WITH NOTES with its notes as the list, within the same 3 rounds (`references/integrity_check.md` 6).
    - Start a fresh integrity agent for it, never the agent of Stage 2.5, since Stage 4.5 verifies every reference from scratch.
    - Done when the check ends with PASS and zero issues, or the user has decided at the stop "The third correction round failed".
13. End the run.
    - Write the audit trail of `references/reproducibility_audit.md`, "Audit Trail", to `audit-trail.md` in the run folder.
    - Show the full Progress Dashboard, with every detail and the audit trail, as `agents/state_tracker_agent.md`, "Dashboard Output Rules" 3, gives.
    - Deliver the final verified draft: name the main `.tex`, its `.bib`, each integrity record and each compliance report by its path, with the cumulative revision history: each round's decision, the items addressed and the items left as Acknowledged Limitations.
    - Write `pipeline_state: completed` in `state.json`.
    - Done when the message is sent.

### revision

`revision` answers one comments file of referee comments on the paper of the manuscript's folder ("What it reads" 3), in this order: the split of the comments, a campaign for each results comment, one Consolidate, Stage 2.5 the first integrity check, the coaching, `revision-comments.md`, one `/paper revision` as Stage 4, the completeness check, and Stage 4.5 the final integrity check. The campaigns and Consolidate run the items of "research" that the items below name, the stages from Stage 2.5 on run the items of "manuscript" that they name, each item as its subsection gives it, and Frame is not run again, except its choice of a dataset for a results comment that needs a dataset the project does not hold (item 3).

1. Settle where the run stands, and keep it in `state.json` at each item, in the structure of `agents/state_tracker_agent.md`, "Tracked State Structure", with the keys below, which the other items name.
   - `current_stage` names the part that stands: `split` for item 2, `campaigns` for items 3 and 4, `consolidate` for item 5, and then `2.5`, `4`, `3p` and `4.5`, the stages of "manuscript" that items 6 to 10 run.
   - `split`, `campaigns` and `consolidate` are three stage ids that `revision` adds to the `stage_id` list of that page's `update_stage`, before `2.5`, `4`, `3p` and `4.5`, which items 6 to 10 write as "manuscript" writes them.
   - `stages.split`, `stages.campaigns` and `stages.consolidate` each hold `name` (`SPLIT`, `CAMPAIGNS` or `CONSOLIDATE`), `status`, `outputs`, `started_at` and `completed_at`.
   - `status` takes the values of that page's `update_stage`: `pending`, `in_progress`, `completed` or `skipped`.
   - In `revision`, `skipped` also marks Consolidate for a run with no results comment left (item 5), which the user did not choose.
   - `stages.split` also holds `skill: paper` and `mode: revision-coach`.
   - `split_confirmed` is `true` once the user has confirmed the split at its stop (item 2), and `false` before.
   - `revision_comments` holds one entry per comment of the parsed list, in its order, with these keys:
     - `id`: the coach's id, such as `R1-1`.
     - `kind`: `results` or `text`, as the split stands.
     - `state`: `open`, `in_campaign`, `answered_by_results` or `answered_in_text`.
     - `campaign`: the campaign's folder name under `code/experiments/`, or `null`.
     - `results`: the lines of `## Results` that answer it, or an empty list.
   - `pipeline_state` is `awaiting_confirmation` at each stop of items 2 to 5 that waits on the user's answer, as `agents/pipeline_orchestrator_agent.md`, "Writing the run's state", gives for a checkpoint.
   - `pipeline_state` is `paused` at the stop "The jobs submitted", where the session ends while the jobs run; in `revision` it marks that stop as well as a pause the user asks for.
   - `pipeline_state` is `running` again once the user answers or the run is continued, so that Steps 2 offers the run after any of these stops.
   - A run continued at Steps 2 goes on at the item its `current_stage` names, and within `campaigns` at the campaign that stands, which "research" item 2 reads from the README's `## The stage and campaign that stand`.
   - One run answers one comments file, and the referee comments of a later round are a new run, `/researcher revision` with their own comments file, once this run has ended.
   - Done when the item the run goes on at is known and `state.json` names it.
2. Split the comments: invoke `/paper revision-coach '<comments file>' '<main.tex>'` through the Skill tool, with its own stops.
   - Its stop "The parsed comments" is where the user confirms the parse, so "manuscript" item 7 does not parse the comments again.
   - Read the parsed comments with their commitments, the output of Step 3.5 of the `paper` skill's `agents/revision_coach_agent.md`, from the run folder that run made under `paper-runs/` in the parent of the comments file's folder, since the Revision Roadmap holds no commitment type.
   - A comment with a commitment of type `add_experiment` or `add_analysis` is a results comment, and every other comment is a text comment: the types the coach gave decide, never the session's own reading of a comment.
   - Show the split at the stop "The split of the comments": each comment with its id, its commitments and their types, under results comments or under text comments.
   - A comment the user moves to the other side counts as a comment of that side from then on, so a text comment moved to results work gets its campaign at item 3.
   - Write the split into `revision_comments` with `split_confirmed: true` (item 1), and each results comment, by its id and as quoted lines, into `## The stage and campaign that stand`.
   - Done when the user has confirmed the split and the README names each results comment.
3. Run each results comment as one campaign of the project's Experiments stage, by "research" items 6 to 15, one comment at a time.
   - A results comment that needs a dataset the project does not hold first has that dataset chosen by "research" item 5, the stop "The dataset" with its candidates, their size, licence and fit to `## Constraints and limits`, for that comment only.
   - The dataset chosen is written beside the project's dataset.
   - Frame's questions of "research" item 4 are not asked again.
   - A results comment that needs a new dataset or a new baseline then has the pieces of code it needs built and read in Build, by "research" item 9 for those pieces only, and the runs of the new baseline are then that comment's campaign.
   - Each brief of a campaign quotes, beside the research question, the results comment the campaign answers, as quoted lines, `> `, so that the builder and the reviewer read the code against the comment.
   - Write `state: in_campaign` and the campaign's folder name into the comment's entry of `revision_comments` when its campaign starts.
   - Each campaign's section in `## The stage and campaign that stand` names the comment it answers by its id, and the run folder of the revision, so that a new session resumes the revision from the README (item 1).
   - Each campaign keeps the counts of `research`: 3 returns to its own start ("research" item 12), 2 returns of a piece of code to a builder ("research" item 8), 2 implementation causes for one result and the count of methods of the setting ("research" item 15).
   - Compare reads each result of the campaign against the baseline as "research" items 13 and 14 give it, and for a comment that asks for a new baseline it reads the project's method against that new baseline.
   - "research" item 15 sends the work on with its stops as they stand, except for the causes and the count that item 4 gives.
   - A results comment is answered when a result of its campaigns beats the baseline, a result that does not reach what Frame set as good enough named as below what was set in `## Results`, and its entry of `revision_comments` then holds `state: answered_by_results` and those results.
   - Done when each results comment is answered, or is answered in text alone at the stop of item 4.
4. Stop at a results comment that the results do not answer yet: the stop "A comment the results do not answer yet".
   - It arises at a diagnosis whose cause is the dataset or the research question, which "research" item 15 sends to Frame or to `idea`, since neither runs in `revision`.
   - It arises under the automatic setting when the count of methods is reached with no result that beats the baseline, in place of the stop "The count of methods reached".
   - It arises under the manual setting when the user, at the stop "A result that does not beat the baseline", stops trying methods for the comment.
   - It shows the comment, each method tried with its result against the baseline, the diagnosis with its cause and the next proposal, and for a dataset or a research question cause the line `/researcher research <project folder>`, which runs on the changed question outside the revision.
   - The user's word sends the next proposal on as a new campaign at item 3, or has the comment answered in text alone: the response says what the revision does instead, as `paper`'s response letter does for a comment it declines, and names no result that does not beat the baseline.
   - Done when the comment is back at item 3, or its entry of `revision_comments` holds `state: answered_in_text`.
5. Consolidate, once every results comment is answered: run "research" items 16 and 17 once for the revision, the reproduction run and the record of the experiments written again with the results of the campaigns.
   - It runs whenever a campaign of the run produced a result, on a cluster or off one.
   - A run with no results comment left, every comment moved to text work at the split, skips this item, with `stages.consolidate.status: skipped`.
   - Copy the record's `experiment_intake_declaration` and `experiment_provenance[]` into `material-passport.yaml` again, as Steps 4 does.
   - The end of `research` that "research" item 17 names stays the stage that stands in `## The stage and campaign that stand`, so that "What it reads" 3 and "research" item 1 still read the project as one `research` started.
   - Done when "research" item 17 is done, or the item is skipped.
6. Stage 2.5 and the coaching: run "manuscript" items 1 to 3 for the stages of this run, then "manuscript" item 5, then the bullet of "manuscript" item 7 on the strategic coaching.
   - The parsed comments of item 2 are the structured list of `references/external_review_protocol.md`, "Step 1: Intake and Structuring", which the coaching reads.
   - Done when Stage 2.5 has ended as "manuscript" item 5 says, and the coaching has ended within its 8 rounds or the user has said "just fix it".
7. Write `revision-comments.md` in the run folder.
   - Give each comment of the parsed list a section `## <id>`, in the list's order, with the comment as given, as quoted lines, and the response the coaching settled for it, when it settled one.
   - For a results comment answered by results, add the lines of the README's `## Results` of each result that answers it and beats the baseline, each written as the scientific claim it supports, as the Rules bullet on a fact from code says.
   - For a results comment answered in text alone (item 4), add that it is answered in text, with what the revision does instead, and no result.
   - End the file with a section `## Result files for the results check`: the result file under `code/results/` of each result the file names, each marked as a source of the results check and no text of the manuscript or the response letter.
   - In that last section, name the `negative_results[]` of `experiment-record.yaml` as dead ends that no sentence of the manuscript or the response letter presents (Rules).
   - Done when the file, read back, holds a section for each comment of the parsed list and the last section.
8. Stage 4, the revision: invoke `/paper revision '<main.tex>' '<run folder>/revision-comments.md'` through the Skill tool, with its own stops.
   - At its stop "The session's questions", answer where the study's result files and code are with the result files of `revision-comments.md`, the project's `code/` and `experiment-record.yaml`, so that its row Existing Materials names them for its results check, and put its other questions to the user.
   - A revision that leaves items unaddressed is the stop "An incomplete revision", and the round is written into `revision_history`, as the last two bullets of "manuscript" item 7 give them.
   - Done when `/paper revision` has ended and the revised draft stands.
9. Stage 3', the completeness check: run "manuscript" item 9, with `revision-comments.md` in place of `external-comments.md`.
   - Done when "manuscript" item 9 is done.
10. Stage 4.5 and the end of the run: run "manuscript" item 12, then "manuscript" item 13.
    - Before the message of "manuscript" item 13, write into the README's `## Papers`, beside the paper's folder, the results the revision added.
    - Write the end of the revision, with its run folder and its comments file, into `## The stage and campaign that stand`, beside the end of `research`, which stays the stage that stands.
    - The message also names the results the revision added and each comment answered in text alone.
    - Done when "manuscript" item 13 is done, `## Papers` names the results the revision added and `## The stage and campaign that stand` names the end of the revision beside the end of `research`.

## Stops

The checkpoints wait for the user, and so does every other row but the thirteen refusals at the end, which name their cause and leave nothing. A run of `paper` or `paper-review-panel` stops at its own stops, which its `SKILL.md` gives.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The entry point | A call matches no line of Quick start (Steps 1) | The Quick start line the request matches, with the materials found and what the entry stage needs | The user confirms the line or names another, and the run goes on with it |
| An unfinished run | A run folder of the same mode holds an unfinished state (Steps 2) | The Progress Dashboard of that run and the stage it stopped at | The user continues that run from its stage, or starts a new run |
| The record of the experiments | The project folder holds no `experiment-record.yaml` (Steps 4) | The question, asked once, whether the paper reports experiments of its own, with the result files found | The user's answer and, with experiments, the record built with the user, written before the run goes on |
| The run's configuration | Before the first stage (Steps 5) | The entry stage, the run or depth of each stage, the token estimate, the interaction-count budget and the questions of the compliance agent | The user confirms or adjusts it and answers the questions |
| The checkpoint after Stage 2 | `/paper full` has ended (manuscript item 4) | The FULL or SLIM checkpoint of `references/checkpoints.md` | The user's answer, as "Checkpoint Confirmation Semantics" gives it, with continue going on to Stage 2.5 |
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
| A FAIL of an integrity check | The verdict is FAIL, or at Stage 4.5 of `manuscript` PASS WITH NOTES (`references/integrity_check.md` 4) | The MANDATORY checkpoint with the correction list sorted by severity, or the notes | The user's confirmation, and the correction round runs (`references/integrity_check.md` 6) |
| The third correction round failed | The check has not passed after 3 correction rounds (`references/integrity_check.md` 6) | The items still failing and the items that cannot be verified | The user decides, as `references/pipeline_state_machine.md`, "Integrity Check FAIL Loop", gives: handle them by hand, remove the citations that cannot be verified, or go on with a "partially unverified" warning |
| The failure-mode block | A mode is SUSPECTED, or Mode 1, 3, 5 or 6 has INSUFFICIENT EVIDENCE (`references/integrity_check.md` 4) | Each mode flagged with its detection questions and evidence | The user confirms the flag, and the passage is fixed by `/paper revision` and the check runs again (`references/integrity_check.md` 5), overrides it with reasons written in `state.json`, or revises the passage and the check runs again |
| The compliance block | The compliance agent's `block_decision` is `block` (`references/integrity_check.md` 4) | The block message of `references/compliance_checkpoint_protocol.md`, "On block", with the maturity note of `agents/compliance_agent.md` for a Mandatory item | The user picks (a) backfill, giving the missing material, which reaches the manuscript through `/paper revision` before the compliance agent runs again, (b) manual handling, editing the manuscript and having the compliance agent run again, or (c) the override of the Override Ladder, with its rationale. After an override, the session starts the compliance agent again with it, writes the `disclosure_addendum` it returns to a file of the run folder and gives that file to `/paper revision` as its comments (`references/integrity_check.md` 5) |
| A BLOCKED ethics verdict | The ethics check of the record is BLOCKED (`references/integrity_check.md` 4) | The problem and its resolution path, as `references/ethics.md`, "Verdict and stop", gives | The user accepts the fix, which goes to `/paper revision` before the check runs again, overrides with reasons written verbatim in `state.json`, or revises the passage |
| A CONDITIONAL ethics verdict | The ethics check of the record is CONDITIONAL (`references/integrity_check.md` 4) | Each issue with its exact fix, and each fix that needs a fact only the user has | The user's confirmation, and each fix goes to `/paper revision` in a correction round (`references/integrity_check.md` 5 and 6); a fix that needs a fact only the user has is named in the final message |
| The searches did not run | The two `lookup.py search` runs of a claim left out every index and its web search found nothing ("novelty" item 2) | Each index left out with the reason `lookup.py` printed, and that the claim gets no verdict | The user runs the check again, `/researcher novelty` or the next round of the interview |
| No claim to check | The idea holds no claim the session can state ("novelty" item 1) | The idea as read, and the question what it holds to be new | The user's claim, and the run goes on with it |
| The sketch | A call of `idea` gives no `<sketch file>` and no text read as the sketch, and no interview is continued or reopened ("idea" item 3) | The question for the rough sketch of the idea, in the user's words | The user's sketch, and the interview goes on |
| The project folder | A call of `idea` or `full` whose text after the mode is read as the sketch, before the mode's first item ("What it reads" 1) | The sketch as read from the call, and the question for the project folder | The user's project folder, made when it does not exist, a new project ("idea" item 3), and the run goes on with the call's sketch; an interview continued or a reopening of that folder ("idea" items 1 and 2) sets the call's sketch aside, as it does a `<sketch file>`, and its first round says so |
| A reopening | The README holds research questions and claims, the newest progress file holds no choice still open or none exists, and the call did not come from `research`'s Compare stage ("idea" item 2) | The research questions and claims that stand, and the question for the reopening evidence | The user's reopening evidence, and the choices it bears on are asked again |
| A round of the interview | Each round of the interview ("idea" item 7) | The novelty pages of the round, then each choice of the round with its options, their pros and cons, one recommendation and the lazy option, each claim option with its verdict and page, and the answer form | The user's answers |
| A claim found done | The novelty page of a round of the interview gives a settled claim the verdict `done` ("idea" item 5) | The claim, the confirmed works that already do it and the page, as the first choice of the next round of the interview | The user's answer: a sharpened claim, another claim, or the claim dropped |
| The end of the interview | No choice of the idea is open ("idea" item 10) | The section `## Research questions and claims` as the README will hold it | The user confirms it, and it is written, or corrects it and it is shown again |
| A project underway | `research` on a folder that holds files beyond what `idea` and `novelty` write, whose README names no stage of `research` ("research" item 1) | What the folder holds, and the line `/researcher research adopt <project folder>` | The user runs `/researcher research adopt <project folder>` |
| Frame's questions | Frame, before the dataset ("research" item 4) | Each question the README does not answer yet, the research questions and claims, what counts as good enough, the four limits, the setting with its count and the cluster's facts, each with its options and a recommendation | The user's answers, written into the README, and the run goes on to the dataset |
| The dataset | Frame's choice of the dataset, a Compare diagnosis that blames the dataset ("research" items 5 and 15), and in `revision` a results comment that needs a dataset the project does not hold ("revision" item 3) | Each candidate dataset with its size, its licence, how it is obtained, the published works that report on it and whether it fits each limit, and the recommendation | The user's pick, written with its reason into the README, and the run goes on to Build |
| A piece of code that does not pass its review | A third review of a piece still reports a finding that makes a result false ("research" item 8) | The findings of each review of the piece, with its briefs and reports in `notes/code/` | The user's word: a new brief from what the user says, another way to build the piece, or the work sent back to Frame |
| The jobs submitted | Jobs were submitted, or a job of a resumed project has not ended ("research" items 2 and 10) | Each job id with its script, and that the README holds them | `/researcher research <project folder>`, in this session or a new one, which resumes from the README, or the user's request to poll |
| A job that fails | A job's log shows an error, or its result file lacks a value the metric asks for ("research" item 10) | The job's script, the lines of its log that show the error, and the result file | The user's word: a brief for the fault through "research" items 6 to 8, the job submitted again as it stands, or the work sent back to Frame |
| A result that does not beat the baseline | Under the manual setting, a result that does not beat the baseline, and in either setting a third implementation cause for one result ("research" item 15) | The result against the baseline and what was set, the diagnosis with its cause and its evidence, what was tried, and the next proposal | The user takes the proposal, names another method, or changes the setting, and the work goes to the stage the proposal names; in `revision` the user can also stop trying methods for the comment, the stop "A comment the results do not answer yet" ("revision" item 4) |
| A result short of what was set, in `research` | Under the manual setting, a result that beats the baseline and does not reach what Frame set as good enough ("research" item 15) | The result against the baseline and what was set, the diagnosis with its cause and its evidence, what was tried, and Compare's next proposal | The user's word: Consolidate, with the result named in `## Results` as below what was set, or Compare's next proposal as a new method, which goes to Experiments |
| The count of methods reached | Under the automatic setting, the count of methods is reached with no result that beats the baseline ("research" item 15) | Each method tried with its diagnosis, and the next proposal | The user sets a new count, takes the proposal under the manual setting, or names another method |
| A number that does not reproduce | A second reproduction run still differs from what is reported ("research" item 16) | Each number, table and figure that differs, with the reported and the reproduced values and the comparison's file | The user names the stage the work goes back to, and Consolidate runs again after it |
| What the adopt mode found | `research adopt` on a project with no usable README ("research adopt" item 2) | For each stage, what the files show of it with the file that shows it, whether its completion criterion holds, and the stage where the run continues | The user confirms once, with any correction, and the README is written |
| The modes of full | `idea` has ended in `full` ("full" item 3) | The modes `full` will run and the ones it leaves out, each with its reason | The user confirms once, or changes the modes, and `## Next` records them |
| A result short of what was set | In `full`, after `research`, a result is partial, unfinished, below what was set as good enough, or does not beat the baseline ("full" item 5) | Each such result named as partial, unfinished or below what was set; `manuscript` offered only for a result that beats the baseline; for one that does not, the next proposal of Compare and the way back to Experiments | The user's word: `manuscript` on a result that beats the baseline, or the way back to Experiments with the proposal |
| The split of the comments | `/paper revision-coach` has ended in `revision` ("revision" item 2) | Each comment with its id, its commitments and their types, under results comments (a commitment of type `add_experiment` or `add_analysis`) or under text comments | The user moves a comment from one side to the other or confirms the split, and the run goes on to the campaigns |
| A comment the results do not answer yet | In `revision`, a diagnosis of a results comment names the dataset or the research question as the cause, the count of methods of the automatic setting is reached, or under the manual setting the user stops trying methods for the comment ("revision" item 4) | The comment, each method tried with its result against the baseline, the diagnosis with its cause and the next proposal, and for a dataset or a research question cause the line `/researcher research <project folder>` for the changed question outside the revision | The user's word: the next proposal as a new campaign, or the comment answered in text alone, with no result that does not beat the baseline named in `revision-comments.md`, the response letter or the manuscript |
| A run that fails | A run of `paper` or `paper-review-panel`, or an agent, fails or ends with no output (any stage) | The error, with the state saved in the run folder | The user retries the run or pauses it. No integrity check or failure-mode block is skipped |
| No manuscript | The call gives no `<main.tex>`, or one that does not exist (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| No project folder | For `manuscript`, `novelty` or `revision`, the `<project folder>` does not exist, or a call of `idea`, `research`, `research adopt`, `full` or `revision` gives none, other than a call of `idea` or `full` whose text is read as the sketch, which asks for it ("What it reads" 1) (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| No comments file | The `<comments file>` does not exist, or a call of `revision` gives none (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| A skill not installed | In a run of `integrity`, `manuscript`, `research`, `research adopt`, `full` or `revision`, the `paper` folder, or for `manuscript` and `full` the `paper-review-panel` folder, with its `SKILL.md`, is in neither place of "What it reads" 5 (Steps 1) | That `researcher` runs that skill, with both paths | The skill installed, then `/researcher` again |
| lookup.py not found | In a run of `integrity`, `manuscript`, `research`, `research adopt`, `full` or `revision`, the `paper` folder holds no `templates/lookup.py` (Steps 1) | That the integrity agent looks every reference up with it, and Frame the published works on each dataset, with the path | `paper` installed whole, then `/researcher` again |
| No idea given | A call of `novelty` gives no `<idea>`, or one that holds no word (Steps 1) | The line of `novelty` in Quick start | The call corrected, then `/researcher` again |
| No sketch file | The `<sketch file>` of a call of `idea` does not exist (Steps 1) | The line of `idea` in Quick start | The call corrected, then `/researcher` again |
| No paper for the novelty check | In a run of `novelty` or `idea`, the `paper` folder with its `SKILL.md` is in neither place of "What it reads" 5 (Steps 1) | That the novelty check confirms each work it cites with `paper`'s `lookup.py`, with both paths | `paper` installed, then `/researcher` again |
| No lookup.py for the novelty check | In a run of `novelty` or `idea`, the `paper` folder holds no `templates/lookup.py` (Steps 1) | That the session searches for the prior work and confirms each work it cites with it, with the path | `paper` installed whole, then `/researcher` again |
| Nothing to adopt | The `<project folder>` of a call of `research adopt` does not exist or is empty (Steps 1) | The line of `research` in Quick start, which starts a new project | `/researcher research <project folder>` |
| No manuscript name | A call's `--manuscript` has no `<name>`, or one that is not a folder name of letters, digits, `-` and `_` (Steps 1) | The line of `manuscript` with `--manuscript` in Quick start | The call corrected, then `/researcher` again |
| No project of research | The project folder of a call of `revision` holds no `README.md` whose `## The stage and campaign that stand` names a stage of `research` or the end of `research` (Steps 1) | That `revision` runs campaigns of the stages of `research` on the project, with the lines `/researcher research adopt <project folder>` for a project underway and `/researcher research <project folder>` | That mode run first, then `/researcher revision` again |
| No paper to revise | The manuscript's folder of a call of `revision`, `manuscript/` or `manuscript-<name>/`, holds no `main.tex` (Steps 1) | The manuscript's folder, and the line of `manuscript` in Quick start, with `--manuscript <name>` for a further paper | The paper written by that mode, then `/researcher revision` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Skipping an integrity check because the paper looks fine | A paper that looks fine still holds the fabricated references the check exists to find | Run Stage 2.5 and Stage 4.5 in every run of `manuscript` and `revision`, whatever the perceived quality |
| The session writing, reviewing or verifying the paper itself | The run then lacks the runs and the agent whose checks it reports | Invoke `paper` and `paper-review-panel` through the Skill tool and start the integrity agent, and let the session only direct and record |
| Moving past a MANDATORY checkpoint with no answer | The user loses the decision the checkpoint exists for | Wait for the user's explicit answer at every MANDATORY checkpoint |
| A later stage worse than an earlier one | A long run loses its principles as its context fills, and a revision can be worse than the draft | When a stage's output is worse than the stage before, pause and read the principles again before going on |
| A revision that drops reviewer concerns in silence | A concern left out unmarked is never answered | Account for every concern in the R&R tracking table, each with its status |
| A final check that re-checks only the first check's issues | The revision can add new issues, which go unchecked | Run Stage 4.5 from scratch, with a fresh integrity agent |
| Skipping the failure-mode checklist or its block | The failures it looks for read like competent work and pass every other check | Run the checklist at Stage 2.5 and Stage 4.5, and record each override with the user's reasons in `state.json` |
| What a prior work does, written from memory | The page can then name a work that does not exist or that does something else, and a verdict rests on it | Read its abstract or passage in the run and confirm it with `resolve` ("novelty" items 3 and 4) |
| A verdict `new` written as "no such work exists" | Three searches per claim can miss a work, and the reader takes the claim as proved new | Write that no closer work was found by these searches, with the searches listed on the page ("novelty" item 5) |
| The novelty page given to `paper` as the user's own sources | `paper` then skips its literature search, and at most five works per claim stand in for it | Name the page's `.bib` in the Existing Materials row at `paper`'s intake and keep Phase 1 in the run ("novelty" item 7) |
| A claim found `done` carried into the next round of the interview as it stands | The research then sets out to show what a confirmed work already shows | Drop the claim or sharpen it beyond the works the page names ("idea" item 5) |
| The answers of the interview held in the conversation until the end | A session that ends early loses them, and a new session cannot continue the interview | Write each answer into the progress file as it settles ("idea" item 8) |
| A choice of the idea taken for the user, or a fact asked of the user | The user loses the decision, or spends time on what a lookup gives | Put each choice with its options and a recommendation, and look each fact up ("idea" items 4 and 7) |
| The session writing or fixing the code of `research` itself | Its context fills with code and logs, and no reviewer reads what it wrote | Write a brief and start a builder, then a reviewer ("research" items 6 to 8) |
| A job submitted before the review, other than the builder's small local test | A leak of test data or a wrong metric costs cluster hours and yields a false number | Submit the jobs of the baseline and of the experiments only after a reviewer's report with no finding that makes a result false ("research" item 8) |
| A computation on a cluster's login node, a small local test included | It runs outside the scheduler's limits and the cluster's rules | Run it as a job through the scheduler, as `references/slurm.md` gives it |
| Polling the scheduler by default | The session is held open for hours, and its state is lost if it dies | Write the job ids to the README and stop, and poll only when the user asks ("research" item 10) |
| A result that does not beat the baseline written as a finding of a paper | The paper then reports what the next method is meant to replace, and the idea is left there | Record it as a dead end with its diagnosis, and propose the next method ("research" items 14 and 15) |
| Dropping the idea after one weak method | One method's result says little about the idea | Show what was tried and the next proposal at the stop ("research" item 15) |
| A new method that changes only a setting or the form of the input | It tests nothing the diagnosis named as the cause | Propose a change of objective, of optimisation or of model structure ("research" item 14) |
| A dead end deleted | A later session tries it again, and the record of the experiments loses it | Keep it runnable in `code/attic/`, indexed, and listed in `## Dead ends` ("research" item 14) |
| A number called reproduced from reading the code | A missing cache or a wrong path shows only when the command runs | Run `code/run_all.sh` once in a clean copy and compare ("research" item 16) |
| The files of a project underway moved into the default layout | The project's own scripts and paths break | Record the project's own names in `## Where things live` ("research adopt" item 3) |
| The state of a project kept only in the conversation | A new session cannot resume it | Write the README before each stage ends, as the Rules bullet on the notes says |
| `full` going on to `manuscript` on a partial result | The paper then reports work that is not done | Name the result as partial and wait for the user's word ("full" item 5) |
| The session sorting the referee comments into results work and text work by its own reading | Its sorting can differ from the commitment types the coach gave, which the revision and the completeness check read | Take the split from the commitment types `add_experiment` and `add_analysis` of `/paper revision-coach`, and let the user move a comment at the stop ("revision" item 2) |
| Changing a file of the manuscript outside `/paper revision` | The change bypasses `paper`'s patches, its checks and its own stops | Send every correction, fix and addendum to `/paper revision` as its comments |

## Rules

- In `integrity`, `manuscript` and `revision`, the session holds the role of `agents/pipeline_orchestrator_agent.md`: it reads that page and follows it, and starts no agent for that role.
- In `integrity`, `manuscript` and `revision`, the session holds the role of `agents/state_tracker_agent.md`: it writes the run's state itself, in that page's structure, and starts no agent for that role.
- The agents a run of `integrity`, `manuscript` or `revision` starts for its integrity checks are the integrity agent and the compliance agent, each a fresh agent started through the Agent tool for each integrity check.
- A run of `novelty` or `idea` starts no agent: the session makes every search, read, lookup and write itself.
- In `research` and in the campaigns of `revision`, the session directs the work and builds nothing itself: it writes each brief, starts each builder and each reviewer, reads their reports, decides the next stage, writes the README and submits the jobs.
- The agents that a run of `research` starts, and that the campaigns of a run of `revision` start, are a builder and a reviewer for each piece of code, each a fresh agent started through the Agent tool on the runner's general-purpose agent with the runner's defaults.
- A run of `research` or `revision` uses no worktree, no landing and no ledger: the briefs and reports of its pieces of code are files of the project's `notes/code/`.
- A run of `full` starts the agents of the modes it runs, and no other.
- One documented command, `code/run_all.sh`, rebuilds every reported number, table and figure from the raw inputs, then runs `code/paper.py` ("research" items 9 and 16).
- `code/run_all.sh` names each missing prerequisite at its start, before it does any work ("research" item 9).
- Nothing computes on a cluster's login node ("research" item 10, `references/slurm.md`).
- Every job on a cluster goes through the scheduler ("research" item 10, `references/slurm.md`).
- An idea is not shelved after a weak first attempt: each result that does not beat the baseline gets its diagnosis and the next proposal ("research" items 14 and 15).
- The project's notes let a new session resume without the conversation: each stage of `research` writes the README before it ends ("research" items 3 to 17).
- A new session of `research` reads the README first ("research" item 2).
- A result that does not beat the baseline is guidance for the next method, recorded as a dead end ("research" item 14).
- No text of `research`, `full` or `revision`, and nothing any of them sends to `manuscript` or to `/paper revision`, `revision-comments.md` and the response letter included, frames a result that does not beat the baseline as a finding to publish, and no negative or null result is written up: such a result is recorded as a dead end, guidance for the next method, as the bullet above says.
- The session holds the interview of `idea` itself and invokes no skill for it, since `grill` reads a roadmap entry and a plan configuration, which a research project does not have.
- Every run of `paper` and `paper-review-panel` is invoked through the Skill tool, with its own stops: `/paper full`, `/paper-review-panel full`, `/paper revision`, `/paper-review-panel re-review` and `/paper revision-coach`.
- Every change the run makes to the manuscript is made by `/paper revision`, given its comments as a file of the run folder.
- The corrections the session sends to `/paper revision`, and every text of a record that reaches the manuscript, hold no file names, script names, paths, code identifiers, job, run or exit-code language or software-operations wording.
- A fact from code or a log is written in them as the scientific claim it supports.
- No correction and no record asks that a recorded null result be written into the manuscript.
- A claim that contradicts an entry of `negative_results[]` is a FAIL of the integrity check, corrected by changing the claim.
- The revision loop of `manuscript` holds Stage 4 and Stage 4', one `/paper revision` run each, and after a Minor decision at Stage 3' one `/paper revision` run for its minor items, and no further revision run.
- The revision loop of `revision` holds Stage 4 alone, one `/paper revision` run for the comments file ("revision" item 8).
- Each of these caps stands in place of the cap of `paper` on revision rounds across runs, and each run of `paper` keeps its own rounds.
- At most one Stage 4' runs, and after it the run goes to Stage 4.5 with no return to a review.
- A reference, and a work a novelty page cites, is confirmed when `lookup.py resolve` prints a record on one index or more with a ratio of 0.70 or above and no `DOI_MISMATCH`, read as the `paper` skill's `agents/citation_compliance_agent.md`, "Looking a reference up", says.
- A judged claim rests on a passage read in the run from the source's text, each passage line checked with `lookup.py quote-check`, as `agents/integrity_verification_agent.md`, "E2. Source Tracing", gives.
- The originality screen searches the web at both depths, as `references/plagiarism_detection_protocol.md` gives it.
- The user can pause or leave the run at any checkpoint, and can skip no integrity check.
- A run of `integrity` or `manuscript` given the same input follows the same stages and checks in every session.
- Every artifact of a run of `integrity` or `manuscript` carries its version label in `material-passport.yaml`, and the passport carries the `repro_lock` of `references/artifact_reproducibility_pattern.md`, as `references/reproducibility_audit.md` gives them.
- A run whose stages are split among the members of a team follows `references/team_collaboration_protocol.md` for the roles, the handoffs and the state of each member's run folder.
- The run folder holds `state.json`, `material-passport.yaml`, `external-comments.md` when review comments were in hand in `manuscript`, `revision-comments.md` in `revision`, `minor-revision-comments.md` after a Minor decision at Stage 3', each `integrity-<stage>-<n>.md`, each `compliance-<stage>-<n>.md`, each `corrections-<stage>-<n>.md`, each `failure-modes-<stage>-<n>.md`, `backfill-<stage>-<n>.md`, `compliance-<stage>-<n>-override.md` and `disclosure-addendum-<stage>-<n>.md` a block's answer wrote, `re-revision-comments.md` when Stage 4' ran and `audit-trail.md` at the end of a `manuscript` or `revision` run.
- Every path and every value the user gives reaches a command as one argument in single quotes, a single quote inside it written `'\''`, so that `the author's method` reaches the command as `'the author'\''s method'`, and a project folder reaches `mkdir`, `sbatch` and `code/run_all.sh` the same way.
- The user's words reach a novelty page, a progress file, a brief of `research` and the README as text: an idea or a sketch as quoted lines, `> `, and a line of an answer that opens with `#` also as a quoted line, so that no line of the user's opens a section.
- A referee comment reaches `revision-comments.md`, a brief of a campaign and the README as supplied text, each of its lines a quoted line, `> `, so that a line of it that opens with `#` opens no section.
- The session's messages follow the user's language, and academic terms stay in English.
