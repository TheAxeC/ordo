---
name: researcher
description: "Check a research idea's novelty, shape it into research questions, or check a manuscript. novelty writes a page of the closest confirmed prior work and a verdict per claim. idea asks its choices in rounds of the interview, checks novelty between them and writes questions and claims into the README. integrity has a fresh agent check references, claims, numbers, figures and ethics, at full or pre-review depth, then a compliance agent. manuscript runs writing, review and revision as runs of other skills; it and integrity keep state and records in a run folder. Triggers on: /researcher novelty, /researcher idea, /researcher integrity, /researcher manuscript, a novelty check of an idea, is this idea new, the closest prior work, from a sketch to a research question, sharpen my research idea, check the integrity of my manuscript, verify the references and claims of a finished draft, ethics check of a paper, final integrity check, academic pipeline, full paper workflow, take my draft through review and revision."
metadata:
  version: "1.0.0"
---

# The novelty check, the idea interview, the integrity check and the manuscript pipeline

`/researcher novelty` leaves a page of the closest prior work on each claim of an idea, with a verdict per claim, and a `.bib` of the works it confirmed, both in the project's `notes/`, and `/researcher idea` takes a rough sketch to research questions and claims in rounds of the interview and leaves a progress file and a novelty page per round in `notes/` and the questions and claims in the project's `README.md`. `/researcher integrity` checks a finished manuscript with a fresh integrity agent and a compliance agent, and `/researcher manuscript` takes a manuscript through the stages from the writing on: Stage 2 the writing, Stage 2.5 the first integrity check, Stage 3 the review, Stage 4 the revision, Stage 3' the re-review, Stage 4' the re-revision and Stage 4.5 the final integrity check. A run of `integrity` or `manuscript` leaves behind the run's state, each integrity record and each compliance report, each a file of its own in its run folder (Rules).

## Quick start

```
/researcher novelty <idea> [<project folder>]       search the closest prior work on each claim of an idea, a sentence in quotes or a file, and write a page with a verdict per claim and a .bib
/researcher idea <project folder> [<sketch file>]   take a rough sketch to research questions and claims in rounds of the interview, and write them into the project's README.md
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
| A design decision of a roadmap entry to settle before its plan opens | `/grill` |

## What it reads

1. The call, as Quick start gives it: the mode, the depth of `integrity` and the arguments. `<idea>` is a sentence in quotes, or the path of a file that holds it, and is read from the file when it names a file that exists; every other argument is a path. A call of `novelty` with no `<idea>`, or with one that holds no word, is the refusal "No idea given". A call of `idea` with no `<project folder>` is the refusal "No project folder", and its `<project folder>` that does not exist is made, a new project (Steps, "idea" item 3). A `<sketch file>` that does not exist is the refusal "No sketch file". A call whose `<main.tex>` is missing or does not exist is the refusal "No manuscript". For `manuscript` and `novelty`, a `<project folder>` that does not exist is the refusal "No project folder". A `<comments file>` that does not exist is the refusal "No comments file".
2. The manuscript: the main `.tex`, the files it inputs and includes, and its `.bib`, read by the integrity agent and the compliance agent.
3. The project folder: the `<project folder>` of the call, for a call given a `<main.tex>` the parent of the manuscript's folder, and for `novelty` with no `<project folder>` the folder the session runs in. For `integrity` and `manuscript` it holds the record of the experiments and the run folders, and for `novelty` and `idea` its folder `notes/` holds the novelty pages, the `.bib` beside each page and the progress files they write.
4. The record of the experiments, the file `experiment-record.yaml` in the project folder: the `experiment_intake_declaration` and the `experiment_provenance[]` of Schema 9 in `references/handoff_schemas.md`, "Experiment Provenance Intake". The `research` mode writes it at its last stage. A project with no such file gets the stop "The record of the experiments".
5. The `paper` skill's folder, with its `SKILL.md`, found from this skill's folder with every link resolved: the folder of that name beside it, and otherwise the folder of that name in a group folder beside this skill's group folder. A folder found in neither place, or that holds no `SKILL.md`, is the refusal "A skill not installed" for `integrity` and `manuscript`, and the refusal "No paper for the novelty check" for `novelty` and `idea`, each naming both paths.
6. The `paper` skill's `templates/lookup.py`, in the folder of item 5, run as `python3 '<the paper skill's folder>/templates/lookup.py'` by the integrity agent in `integrity` and `manuscript`, and by the session in `novelty`, a run of `novelty` inside `idea` included. A folder that holds no such file is the refusal "lookup.py not found" for `integrity` and `manuscript`, and the refusal "No lookup.py for the novelty check" for `novelty` and `idea`.
7. For `manuscript` only, the `paper-review-panel` skill's folder, with its `SKILL.md`, found as item 5 finds the `paper` skill's folder. A folder found in neither place, or that holds no `SKILL.md`, is the refusal "A skill not installed".
8. The environment variables `S2_API_KEY`, `OPENALEX_API_KEY` and `CROSSREF_POLITE_EMAIL`, each optional and never printed, read by `lookup.py`.
9. For `integrity` and `manuscript`, the two role pages the session reads and follows: `agents/pipeline_orchestrator_agent.md` for directing the stages, and `agents/state_tracker_agent.md` for the structure of the run's state.
10. The two role pages of the agents the session starts: `agents/integrity_verification_agent.md`, read by the integrity agent, and `agents/compliance_agent.md`, read by the compliance agent.
11. The pages the integrity agent is given with its role page: `references/integrity_review_protocol.md`, `references/plagiarism_detection_protocol.md`, `references/claim_verification_protocol.md`, `references/ai_research_failure_modes.md`, `references/ethics.md` and `references/handoff_schemas.md`.
12. The pages the compliance agent is given with its role page: `references/compliance_checkpoint_protocol.md`, `references/prisma_trAIce_protocol.md`, `references/raise_framework.md`, `references/ai_research_failure_modes.md` and `references/handoff_schemas.md`.
13. The pages the session reads at the step that names them: `references/pipeline_state_machine.md`, `references/mode_advisor.md`, `references/two_stage_review_protocol.md`, `references/external_review_protocol.md`, `references/score_trajectory_protocol.md`, `references/reinforcement_content.md`, `references/compliance_checkpoint_protocol.md`, `references/ai_research_failure_modes.md`, `references/ethics.md`, `references/reproducibility_audit.md`, `references/artifact_reproducibility_pattern.md`, `references/progress_dashboard_template.md`, `references/team_collaboration_protocol.md`, `templates/pipeline_status_template.md`, `references/integrity_check.md` and `references/checkpoints.md`, and for `novelty` and for `idea`, which runs it, `references/novelty_page.md`.
14. The worked runs the session reads before its first stage: `examples/full_pipeline_example.md`, a run from Stage 2, `examples/mid_entry_example.md`, a run from Stage 2.5, and `examples/integrity_failure_recovery.md`, a failed first check and its correction round.
15. An unfinished run of the same mode for the same manuscript: a run folder in the project folder whose `state.json` holds a `pipeline_state` of `running`, `awaiting_confirmation` or `paused`.
16. For `novelty`, the `paper` skill's `agents/citation_compliance_agent.md`, "Looking a reference up", which the Rules bullet on `lookup.py resolve` names, read by the session before its first `resolve`.
17. For `idea`, the sketch: the `<sketch file>` of the call, or else the words the user gives when the first message asks for them.
18. For `idea`, the project's `README.md`, when it exists: its section "Research questions and claims", read for a reopening, and its other sections, left as they stand.
19. For `idea`, the progress files `notes/idea-<YYYY-MM-DD>.md` of the project folder, `-2`, `-3` and so on included, of which only the newest is read, for the choices it holds still open.

## Steps

Steps 1 to 6 run in order for `integrity` and `manuscript`. A run of `novelty` or `idea` runs Steps 1 and then Steps 6, and skips Steps 2 to 5, since it has no run folder, no record of the experiments, no `state.json` and no compliance questions.

1. Read the call and settle the mode, the depth and the entry stage.
   - The call's first word after `/researcher` is the mode: `novelty`, `idea`, `integrity` or `manuscript`.
   - Check the folders and the file of "What it reads" 5 to 7 first, before anything is written.
   - Check the arguments as "What it reads" 1 gives them.
   - `/researcher integrity <main.tex>` runs the check at the depth of Mode 2 of `agents/integrity_verification_agent.md`, the full depth of the final check.
   - `/researcher integrity pre-review <main.tex>` runs the check at the depth of Mode 1, the sampled depth of the check before a review.
   - `/researcher manuscript <project folder>` enters at Stage 2.
   - `/researcher manuscript <main.tex>` enters at Stage 2.5, which a draft that enters midway never skips.
   - `/researcher manuscript <main.tex> <comments file>` enters at Stage 2.5 and goes on to Stage 4 with the comments file, as the row "INIT, Stage 4" of `references/pipeline_state_machine.md`, "Normal Flow Transitions", gives.
   - `/researcher novelty <idea> [<project folder>]` and `/researcher idea <project folder> [<sketch file>]` run their subsections, with no depth and no entry stage.
   - A call with no mode word that asks whether an idea, a claim or a method is new, or for the closest prior work to one, is the stop "The entry point" with the line of `novelty` and the idea taken from the call.
   - A call with no mode word that asks to shape a sketch or a rough idea into a research question or claims is the stop "The entry point" with the line of `idea`.
   - Any other call that matches no line of Quick start is read against `agents/pipeline_orchestrator_agent.md`, "1. Intent Detection", and `references/mode_advisor.md`, and the line it matches is the stop "The entry point".
   - A request that only one function fits, such as a citation check alone, is answered with the skill of its row in "Use instead", and no run starts.
   - Done when the mode, its depth or its entry stage where the mode has one, and its inputs are known, or a refusal is raised.
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
6. Go on with the subsection of the mode: "novelty", "idea", "integrity" or "manuscript".
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
   - The sketch is the `<sketch file>` of the call; with none, ask for it in the first message, the stop "The sketch". A reopening takes the section that stands and the reopening evidence in place of a sketch.
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
   - Invoke `/paper full '<project folder>'` through the Skill tool, with its own stops.
   - Done when `/paper full` has ended and `<project folder>/manuscript/` holds the main `.tex` and its `.bib`.
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

## Stops

The checkpoints wait for the user, and so does every other row but the nine refusals at the end, which name their cause and leave nothing. A run of `paper` or `paper-review-panel` stops at its own stops, which its `SKILL.md` gives.

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
| The sketch | A call of `idea` gives no `<sketch file>` and no interview is continued or reopened ("idea" item 3) | The question for the rough sketch of the idea, in the user's words | The user's sketch, and the interview goes on |
| A reopening | The README holds research questions and claims, the newest progress file holds no choice still open or none exists, and the call did not come from `research`'s Compare stage ("idea" item 2) | The research questions and claims that stand, and the question for the reopening evidence | The user's reopening evidence, and the choices it bears on are asked again |
| A round of the interview | Each round of the interview ("idea" item 7) | The novelty pages of the round, then each choice of the round with its options, their pros and cons, one recommendation and the lazy option, each claim option with its verdict and page, and the answer form | The user's answers |
| A claim found done | The novelty page of a round of the interview gives a settled claim the verdict `done` ("idea" item 5) | The claim, the confirmed works that already do it and the page, as the first choice of the next round of the interview | The user's answer: a sharpened claim, another claim, or the claim dropped |
| The end of the interview | No choice of the idea is open ("idea" item 10) | The section `## Research questions and claims` as the README will hold it | The user confirms it, and it is written, or corrects it and it is shown again |
| A run that fails | A run of `paper` or `paper-review-panel`, or an agent, fails or ends with no output (any stage) | The error, with the state saved in the run folder | The user retries the run or pauses it. No integrity check or failure-mode block is skipped |
| No manuscript | The call gives no `<main.tex>`, or one that does not exist (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| No project folder | For `manuscript` or `novelty`, the `<project folder>` does not exist, or a call of `idea` gives none (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| No comments file | The `<comments file>` does not exist (Steps 1) | The mode's line of Quick start | The call corrected, then `/researcher` again |
| A skill not installed | In a run of `integrity` or `manuscript`, the `paper` folder, or for `manuscript` the `paper-review-panel` folder, with its `SKILL.md`, is in neither place of "What it reads" 5 (Steps 1) | That `researcher` runs that skill, with both paths | The skill installed, then `/researcher` again |
| lookup.py not found | In a run of `integrity` or `manuscript`, the `paper` folder holds no `templates/lookup.py` (Steps 1) | That the integrity agent looks every reference up with it, with the path | `paper` installed whole, then `/researcher` again |
| No idea given | A call of `novelty` gives no `<idea>`, or one that holds no word (Steps 1) | The line of `novelty` in Quick start | The call corrected, then `/researcher` again |
| No sketch file | The `<sketch file>` of a call of `idea` does not exist (Steps 1) | The line of `idea` in Quick start | The call corrected, then `/researcher` again |
| No paper for the novelty check | In a run of `novelty` or `idea`, the `paper` folder with its `SKILL.md` is in neither place of "What it reads" 5 (Steps 1) | That the novelty check confirms each work it cites with `paper`'s `lookup.py`, with both paths | `paper` installed, then `/researcher` again |
| No lookup.py for the novelty check | In a run of `novelty` or `idea`, the `paper` folder holds no `templates/lookup.py` (Steps 1) | That the session searches for the prior work and confirms each work it cites with it, with the path | `paper` installed whole, then `/researcher` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Skipping an integrity check because the paper looks fine | A paper that looks fine still holds the fabricated references the check exists to find | Run Stage 2.5 and Stage 4.5 in every run of `manuscript`, whatever the perceived quality |
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
| Changing a file of the manuscript outside `/paper revision` | The change bypasses `paper`'s patches, its checks and its own stops | Send every correction, fix and addendum to `/paper revision` as its comments |

## Rules

- In `integrity` and `manuscript`, the session holds the role of `agents/pipeline_orchestrator_agent.md`: it reads that page and follows it, and starts no agent for that role.
- In `integrity` and `manuscript`, the session holds the role of `agents/state_tracker_agent.md`: it writes the run's state itself, in that page's structure, and starts no agent for that role.
- The agents a run of `integrity` or `manuscript` starts are the integrity agent and the compliance agent, each a fresh agent started through the Agent tool for each integrity check.
- A run of `novelty` or `idea` starts no agent: the session makes every search, read, lookup and write itself.
- The session holds the interview of `idea` itself and invokes no skill for it, since `grill` reads a roadmap entry and a plan configuration, which a research project does not have.
- Every run of `paper` and `paper-review-panel` is invoked through the Skill tool, with its own stops: `/paper full`, `/paper-review-panel full`, `/paper revision` and `/paper-review-panel re-review`.
- Every change the run makes to the manuscript is made by `/paper revision`, given its comments as a file of the run folder.
- The corrections the session sends to `/paper revision`, and every text of a record that reaches the manuscript, hold no file names, script names, paths, code identifiers, job, run or exit-code language or software-operations wording.
- A fact from code or a log is written in them as the scientific claim it supports.
- No correction and no record asks that a recorded null result be written into the manuscript.
- A claim that contradicts an entry of `negative_results[]` is a FAIL of the integrity check, corrected by changing the claim.
- The revision loop holds Stage 4 and Stage 4', one `/paper revision` run each, and after a Minor decision at Stage 3' one `/paper revision` run for its minor items, and no further revision run.
- This cap stands in place of the cap of `paper` on revision rounds across runs, and each run of `paper` keeps its own rounds.
- At most one Stage 4' runs, and after it the run goes to Stage 4.5 with no return to a review.
- A reference, and a work a novelty page cites, is confirmed when `lookup.py resolve` prints a record on one index or more with a ratio of 0.70 or above and no `DOI_MISMATCH`, read as the `paper` skill's `agents/citation_compliance_agent.md`, "Looking a reference up", says.
- A judged claim rests on a passage read in the run from the source's text, each passage line checked with `lookup.py quote-check`, as `agents/integrity_verification_agent.md`, "E2. Source Tracing", gives.
- The originality screen searches the web at both depths, as `references/plagiarism_detection_protocol.md` gives it.
- The user can pause or leave the run at any checkpoint, and can skip no integrity check.
- A run of `integrity` or `manuscript` given the same input follows the same stages and checks in every session.
- Every artifact of a run of `integrity` or `manuscript` carries its version label in `material-passport.yaml`, and the passport carries the `repro_lock` of `references/artifact_reproducibility_pattern.md`, as `references/reproducibility_audit.md` gives them.
- A run whose stages are split among the members of a team follows `references/team_collaboration_protocol.md` for the roles, the handoffs and the state of each member's run folder.
- The run folder holds `state.json`, `material-passport.yaml`, `external-comments.md` when review comments were in hand, `minor-revision-comments.md` after a Minor decision at Stage 3', each `integrity-<stage>-<n>.md`, each `compliance-<stage>-<n>.md`, each `corrections-<stage>-<n>.md`, each `failure-modes-<stage>-<n>.md`, `backfill-<stage>-<n>.md`, `compliance-<stage>-<n>-override.md` and `disclosure-addendum-<stage>-<n>.md` a block's answer wrote, `re-revision-comments.md` when Stage 4' ran and `audit-trail.md` at the end of a `manuscript` run.
- Every path and every value the user gives reaches a command as one argument in single quotes, a single quote inside it written `'\''`, so that `the author's method` reaches the command as `'the author'\''s method'`.
- The user's words reach a novelty page, a progress file and the README as text: an idea or a sketch as quoted lines, `> `, and a line of an answer that opens with `#` also as a quoted line, so that no line of the user's opens a section.
- The session's messages follow the user's language, and academic terms stay in English.
