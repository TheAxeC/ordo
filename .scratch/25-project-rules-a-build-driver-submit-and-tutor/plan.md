# Plan: 25. Project rules, a build driver, submit and tutor

Execution ledger for roadmap entry 25 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

Five additions. The shared rules of `ordo-init`, its coding standards and `plan-orchestration` hold these rules: every target in scope compiles and works in the same change; an open item is raised only for options that each cost something the user would weigh; every option meets every wish the user has stated; a question about effort is answered with each change and the code it touches, with no duration; a YAML file is loaded after every write. `grant` and `paper` hold that a page or length limit is met by cutting content and never by changing how the document is set, and the manuscript prose standard holds that every sentence of a deliverable answers the reader or states a change, with no process history. `ordo-init` has a mode, `/ordo-init build`, that writes a build driver, `utils/build.py`, in the repository it is run in, and its new-repository run writes one by the same steps unless you answer that it should not: one entry point with `build`, `test`, `check` and `gate`, one command per invocation, the checks imported and called, and every failure a non-zero exit. A `submit` skill, `/submit <url> [<folder>]`, serves any submission made through a web portal, such as a manuscript, a grant application or a registration for an event: it writes a submission sheet with everything the portal asks for and the list of files to upload, which you approve, then fills the portal's forms and uploads the files through the Chrome extension and stops before the final submit, which you press; `docs/figures/paper/lifecycle.svg` names the skill at "You submit" and "You resubmit". A `tutor` skill has two modes. `/tutor <topic>` turns a folder into a teaching workspace for one topic you want to learn over several sessions: a mission file with why you learn it, short lessons tied to the mission, each with a task that gives feedback, reference sheets, a list of trusted sources, and learning records from which the next lesson is chosen, with recall from memory and spaced practice. `/tutor explain <concept>` explains one concept you name, in the conversation and tied to the work at hand, such as a method `/grill` offers as an option of a decision, and with `--page` also writes the explanation as one HTML page. The design of `tutor` follows mattpocock's `teach`: the files, the lesson form and the stops are kept as the source has them, and each deviation from them, the name and the `explain` mode among them, is made only with its reason and your ruling in the plan's Rulings.

## Gate

each added rule read by you in its page, with `sh skills/ordo/ordo-init/templates/sync_rules.test.sh` passing; one real run of `/ordo-init` on a scratch repository of a kind you name, whose `./utils/build.py gate` exits 0 on the tree as written and exits non-zero once a test that fails is added, both runs made by a separate agent and their output read by you; one real run of `/ordo-init build` on a scratch copy of an existing repository you name, whose `./utils/build.py gate` exits 0, made by a separate agent and its output read by you; one real run of `/submit` on a manuscript and a journal's portal you name, and one on a submission of another kind and a portal you name, each submission sheet read by you and each portal walk watched by you up to the stop before the final submit; `docs/figures/paper/lifecycle.svg` read by you; one real run of `/tutor` on a topic you name, over two sessions: the first writes the mission from an interview and one lesson with its reference sheet and its learning record, the second chooses its lesson from the learning records, each read by you; one real run of `/tutor explain` on a concept you name with `--page`, its explanation and its page read by you; the plan's ledger lists every deviation from the design of mattpocock's `teach`, each with its reason and the ruling that approved it, and nothing else differs, checked by reading both; the verify list of `docs/dev/building.md` passes on main.

- The gate: could this pass without the goal being reached? no, every skill and mode the goal names is run for real and its output read by the user, the second `/submit` run is on a submission of another kind, and each rule is read in its page; it is checked once, on the finished work.
- Step 1: could this pass without the goal being reached? no, the user reads each rule in its page; the sync test alone could pass without the rules, so it does not stand without the reading.
- Step 2: could this pass without the goal being reached? no, the user reads each changed passage and every hit of the grep is read.
- Step 3: could this pass without the goal being reached? no, the test runs the driver's `gate` on a passing tree and on a failing one.
- Step 4: could this pass without the goal being reached? yes, reading the skill's text and the figure does not show that the walk works on a portal; step 6's runs show that, and they need the skill tagged and pinned first.
- Step 5: could this pass without the goal being reached? yes, reading the skill against its source does not show that a lesson is written and the next one chosen from the learning records; step 6's runs show that, and they need the skill tagged and pinned first.
- Step 6: could this pass without the goal being reached? yes, it is text; step 7's run of `/tutor` shows that the glossary is found.
- Step 7: could this pass without the goal being reached? no, each run is the installed skill on real input, read by the user.

## Steps, in execution order

- ✅ 1 the project rules: the five rules of the goal stand where ruling D3 puts them (`skills/ordo/ordo-init/templates/shared-rules.md`, `skills/orchestration/plan-orchestration/`, `skills/ordo/ordo-init/templates/docs/dev/change-standard.md`, `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md` and `docs/dev/change-standard.md`), and the citation "last rule" in `docs/dev/change-standard.md` names its rule; check: `sh skills/ordo/ordo-init/templates/sync_rules.test.sh` passes, run from the repository root, and the user reads each rule in its page (1 commit) (approved)
- ✅ 2 limits and layout: `skills/academic/paper/` and `skills/academic/grant/` hold the rule of ADR 0050 as ruling D4 gives it (the formatter's sentence replaced, one return to the draft writer to cut content, what is still over shown with each section's length, the same step in `grant`), and `skills/academic/writing/references/manuscript-prose-standard.md` holds that every sentence of a deliverable answers the reader or states a change, with no process history; check: the user reads each changed passage, and no sentence of `skills/academic/paper/` or `skills/academic/grant/` changes a layout value to meet a limit, by reading every hit of `grep -rnEi 'limit' skills/academic/paper skills/academic/grant`, run from the repository root (1 commit) (approved)
- ✅ 3 the build driver: `ordo-init` has the mode `/ordo-init build`, the template `utils/build.py` on the Python standard library with its test, the new-repository run that writes the driver by the same steps unless the user answers that it should not, and the rule on build files narrowed, as ruling D9 and ADR 0051 give them, with the script and its test listed on `docs/dev/scripts.md`, `docs/dev/building.md` and the command block of `docs/dev/change-standard.md`; check: the template's test passes, run from the repository root, and it runs the driver's `gate` on a scratch tree whose commands pass (exit 0) and on one where one command fails (non-zero exit) (1 commit) (approved) (ruling B)
- ✅ 4 the skill `submit`: `skills/academic/submit/` holds the skill of rulings D6, D10 and D16 and ADR 0049 (the page of the agent that writes the submission sheet, the user's approval of the sheet, the walk the session makes through the browser extension, what the walk never does, the stop before the final submit), with its figure under `docs/figures/`, its row and its place in the group sentence of `README.md`, and `/submit` named at "You submit" and "You resubmit" of `docs/figures/paper/lifecycle.svg`; check: `python3 docs/figures/gen_figures.py` runs from the repository root and the user reads `docs/figures/paper/lifecycle.svg`, and the skill's text is read against ADR 0049 item by item (1 commit) (approved)
- ✅ 5 the skill `tutor`: `skills/explain/tutor/` holds a copy of mattpocock's `teach` with the differences of ADR 0048 and rulings D2 and D11 (the name, `/tutor explain <concept>` and `--page`), `skills/ordo/wait-what/` is moved to `skills/explain/wait-what/`, `README.md` names both and the group folder, and `deviations.md` in this ledger lists every deviation from the design of mattpocock's `teach`, each with its reason and the ruling that approved it; check: `deviations.md` is read against both skills and nothing else differs, and `grep -rn 'skills/ordo/wait-what' README.md docs skills utils agents`, run from the repository root, prints no line outside `docs/roadmap.md` and `docs/adr/` (1 commit) (approved)
- ✅ 6 rulings D and E carried out: `tutor` writes the workspace's glossary as `reference/GLOSSARY.md` in the form of its glossary format page, with one line in the Decision of ADR 0048 and its row in `deviations.md`; the Decision of ADR 0050 says that a layout value the venue or the funder does not state comes from the declared format profile, and with no profile is the current default; check: `grep -rn 'GLOSSARY.md' skills/explain/tutor` shows the file named at one path, `reference/GLOSSARY.md`, by `SKILL.md`, and the two changed pages are read against rulings D and E (1 commit) (ruling D) (ruling E)
- 7 the gate's runs, on a release candidate tagged and pinned on the user's word, each run made by a separate agent that invokes the installed skill, its stops answered by the orchestrator: `/ordo-init` on a scratch repository of a kind the user names, whose `./utils/build.py gate` exits 0 on the tree as written and non-zero once a test that fails is added; `/ordo-init build` on a scratch copy of an existing repository the user names, whose `./utils/build.py gate` exits 0; `/submit` on a manuscript and a journal's portal the user names, and on a submission of another kind and a portal the user names, each submission sheet read by the user and each walk watched by the user up to the stop before the final submit; `/tutor` on a topic the user names, over two sessions, the second choosing its lesson from the learning records; `/tutor explain` with `--page` on a concept the user names; check: the user reads the output of each run (1 commit; orchestrator, no agent) (approved)
- 8 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Step 3, Step 0

- Step 3 raises `metadata.version` of `skills/ordo/ordo-init/SKILL.md` once for the plan, by its major part, to 5.0.0, since the word `build` as the first argument and the default new-repository run change what a run that worked before writes (`docs/dev/skill-layout.md`, "Frontmatter"), and that raise also covers the template pages step 1 changes; step 1 leaves that version as it is.

### Step 1, the project rules (landed 2026-11-24)

- Landed on main from `.agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-1`, base `b772895`: `docs/dev/change-standard.md`, `skills/orchestration/plan-orchestration/SKILL.md` (9.0.0), `skills/ordo/ordo-init/templates/docs/dev/change-standard.md`, `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`, `skills/ordo/ordo-init/templates/shared-rules.md` (27 bullets).
- Premise corrections: none.
- Verification on main, after the fix at landing: `sh skills/orchestration/land/templates/checks.sh .scratch/25-project-rules-a-build-driver-submit-and-tutor/orchestrator-state.md` printed `checks: 15 commands passed`. The verify list equalled the verification page; no change.
- No look and no A/B: the configuration names neither.
- The builder's first report did not pass its bar: the first review found six findings (SP1, P1, S1, S2, S3, B1), closed in one repair round. The run over that round found two (S1, S2), both in the sentence the round added on what is done in place of raising.
- Fix at landing, one: that sentence removed from the shared rules and from `plan-orchestration`, "Stops". Both pages hold the goal's rule narrowed to an open item that offers options.
- Raised to the user: open item A, the reading of the rules, with the question whether a page says what is done in place of raising.
- Usage: builder a1c62803166842022, 161372 tokens, 25 tool uses, 5 min 32 s, and round 1: 181152 tokens, 9 tool uses, 2 min 31 s. Brief check a84e8e7f2b9dce5b4, 125805 tokens, 30 tool uses, 5 min 42 s. Reviewer aff8729b7d77a1e04, 149633 tokens, 23 tool uses, 5 min 42 s. Reviewer over round 1 a82688a6d8c685329, 87068 tokens, 6 tool uses, 1 min 17 s.

### Step 2, limits and layout (landed 2026-11-24)

- Landed: `paper` 5.0.0 (the layout rule on the formatter's and the intake's pages, Steps 15 with the count and the one return to the draft writer in full mode, the patch id `limit-cut`, the draft writer's section "The limit cut", the page limit in the intake's question), `grant` 2.0.0 (Steps 10, the one cut in `draft` and `revise`), `writing` 2.2.0 (section H of the manuscript prose standard, given to the sentence agent), the Decisions of ADR 0026 and 0036, the Status line of ADR 0043 and the Consequences of ADR 0050, the figures `grant.svg` and `paper/full.svg` with their script and alt texts, and the `paper` and `grant` rows of `README.md`.
- Premise corrections, from the brief check: `paper` read no page count, so the session reads it from the compile log; `writing` has no `agents/` folder; the intake's page held a second copy of the formatter's sentence. From the builder: `grant` has no draft writer page and starts `paper`'s; `agents/citation_compliance_agent.md` lists the patches that get the incremental check and is changed with them.
- Changed against the brief by round 1: disclosure takes no count, since it has no venue profile and no compile; every word count is one command the session runs.
- Raised: open item E, the layout value the venue does not state against ADR 0050's sentence.
- Verification on main, after the fixes at landing: `checks: 15 commands passed`.
- The builder's first report did not pass its bar: one repair round. Fixes at landing: the count command of `paper` Steps 15 counts only a token that holds a letter or a digit, and its sentence says what it counts; one sentence says which printed number is held against which limit; the formatter's line "Ensure word count compliance" names the limits for the session's count; the `paper` row of `README.md` and the clause of ADR 0026 follow the round's rulings.
- Usage: builder 346662 tokens, 91 tool uses, 16 min 55 s, and round 1: 106087 tokens, 42 tool uses, 7 min 29 s; brief check 235254 tokens, 51 tool uses, 7 min 58 s; reviewer 219080 tokens, 49 tool uses, 9 min 6 s; reviewer over round 1 150292 tokens, 36 tool uses, 4 min 15 s.

### Step 5, the skill `tutor` (landed 2026-11-24)

- Landed: `skills/explain/tutor/` (`SKILL.md` 1.0.0 and four format pages under `references/`), `skills/ordo/wait-what/` moved to `skills/explain/wait-what/` unchanged, `README.md` (the row, five group folders, the install loop, twenty-two skills), the note of `pipeline()` in `docs/figures/gen_figures.py` with `docs/figures/pipeline.svg`, four terms in `docs/glossary.md`, and `deviations.md` in this ledger.
- Premise corrections: the step's line named a ruling D7 that does not stand; it names D2 and D11. The builder writes only its report under the ledger, so `deviations.md` is written at landing from the report's section.
- Decisions of the brief: `argument-hint` dropped; the format pages keep the source's words; the glossary format page is named from the step that writes a glossary; the Stops table holds six rows after round 1.
- Raised: open item D, the format pages that name `GLOSSARY.md`.
- Verification on main, after the fixes at landing: `checks: 15 commands passed`.
- The builder's first report did not pass its bar: one repair round. Fixes at landing: four sentences of `skills/explain/tutor/SKILL.md` put back to the source's meaning or made one action ("Teaching" items 4 and 5, "Explaining" item 2, the Rules bullet on parametric knowledge), and `deviations.md` written with the rows the review found missing.
- Usage: builder 218919 tokens, 44 tool uses, 11 min 50 s, and round 1: 235369 tokens, 5 tool uses, 2 min 11 s; brief check 165019 tokens, 50 tool uses, 9 min 5 s; reviewer 175234 tokens, 32 tool uses, 6 min 54 s; reviewer over round 1 145111 tokens, 15 tool uses, 3 min 15 s.

### Step 6, rulings D and E carried out (landed 2026-11-24)

- Landed: `skills/explain/tutor/SKILL.md` ("Teaching" item 9 and "The teaching workspace" name the glossary as the Markdown file `reference/GLOSSARY.md`, in the structure of `references/glossary-format.md`; the version stays 1.0.0), one bullet in the Decision of ADR 0048, one bullet in the Decision of ADR 0050, and the row of the glossary in `deviations.md` with its last paragraph corrected.
- Premise corrections: none.
- Decisions of the brief: the brief raised the version of `tutor` by its patch part; the review found that the plan raises a skill's version once, at the skill's creation in step 5, so the version stays 1.0.0.
- Raised: nothing.
- Verification on main: `checks: 15 commands passed`.
- A small text step: one review, no repair round. Fixes at landing: `metadata.version` of `tutor` put back to 1.0.0; the row and the paragraph of `deviations.md`.
- Usage: builder 100354 tokens, 23 tool uses, 3 min 20 s; reviewer 116573 tokens, 12 tool uses, 3 min 0 s.

### Step 4, the skill `submit` (landed 2026-11-24)

- Landed: `skills/academic/submit/` (`SKILL.md` at 1.0.0, `agents/sheet_agent.md`, `templates/submission-sheet.md`), the figure `docs/figures/submit.svg` with its function in `docs/figures/gen_figures.py`, the labels "You submit: /submit" and "You resubmit: /submit" in `docs/figures/paper/lifecycle.svg`, the row, the group sentence, the install loop, the count "twenty-three" and the figure in `README.md`, the terms **submission sheet** and **walk, of a submission** in `docs/glossary.md`, and `submit.svg` in `docs/dev/building.md` and `docs/dev/scripts.md`.
- Premise corrections: none.
- Decisions changed in the round: the sheet agent saves the portal's pages with `curl` into `portal/` of the run folder and reads the files, in place of decision 1 of the brief (WebFetch). A seventh stop, "Which config", and an eighth, "A page that does not pass".
- Raised: nothing.
- Verification on main: `checks: 15 commands passed`, run again after the fixes at landing.
- The builder's first report did not pass its bar: one repair round of eleven rulings, then twelve fixes at landing from the run over the round, each named under "Closed" in `agents/reviews/4-refuter.md`. One of them takes out again what ruling 10 of the round added, the exclusion of the files git ignores, since it would leave out a built PDF.
- Usage: brief check 162843 tokens, 37 tool uses, 6 min 58 s; builder 243982 tokens, 60 tool uses, 12 min 7 s, and round 1: 284262 tokens, 21 tool uses, 4 min 12 s; reviewer 154003 tokens, 37 tool uses, 8 min 11 s; reviewer over round 1: 132859 tokens, 16 tool uses, 4 min 15 s.

### Step 3, the build driver (landed 2026-11-24)

- Landed: the template `skills/ordo/ordo-init/templates/utils/build.py` (standard library, mode 755, every line at most 100 characters) and its test `build.test.sh` with 20 cases; the mode `/ordo-init build` in `skills/ordo/ordo-init/SKILL.md` at 5.0.0 ("Steps / The build driver", "Steps / A new repository" 9, four rows of Stops, the rule on build files); `references/new-repository.md` with question 11 and the row of `utils/build.py`; the term **build driver** in `templates/plan-terms.md` and `docs/glossary.md`; two sentences in the Decision of ADR 0051; the test's line in `docs/dev/building.md`, `docs/dev/scripts.md` and `docs/dev/change-standard.md`; the lane of `/ordo-init` in `docs/figures/pipeline.svg`; `ordo-help` at 5.1.0 with the mode's line; `README.md`.
- Premise corrections: none.
- The plan's verify list gained `sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1`, since the step adds that line to the verification page.
- Raised: nothing.
- Verification on main: `checks: 16 commands passed`, run again after the fixes at landing; `ruff check` on the template printed `All checks passed!`.
- The builder's first report did not pass its bar: one repair round of nine rulings, then fixes at landing from the run over the round, each named under "Closed" in `agents/reviews/3-refuter.md`. Among them: a filled driver keeps every line at most 100 characters (a comment above its string, a long string as adjacent literals), a line that runs the driver is never one of its commands, and ADR 0051 says that a page with no command gets no driver.
- Usage: brief check 193217 tokens, 32 tool uses, 6 min 59 s; builder 253440 tokens, 70 tool uses, 16 min 21 s, and round 1: 282209 tokens, 14 tool uses, 3 min 33 s; reviewer 191856 tokens, 31 tool uses, 8 min 0 s; reviewer over round 1: 177803 tokens, 33 tool uses, 5 min 21 s.

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- 1, 2, 3, 4 and 5 with each other; 1 and 3 both change files of `skills/ordo/ordo-init/`, and 4 and 5 both change `README.md`, which the orchestrator judges at dispatch.
- 6 with 3 and 4.
- 7 after 1 to 6.

## Rulings (2026-11-24)

- D1 entries 25 and 26 as one entry (2026-11-24): entry 26, teach, is merged into entry 25, so that the four additions and the skill are built in one plan, its steps in flight at the same time (the user).
- D2 the name of the skill (2026-11-24): `tutor`, with the mode `/tutor <topic>` for the teaching workspace of mattpocock's `teach` and the mode `/tutor explain <concept>` for one concept explained in the conversation, such as a method `/grill` offers as an option (the user).
- D3 where the five rules are written (2026-11-24): B, each rule on the page that holds its kind: the rules on open items, on options meeting every stated wish and on effort questions in the shared rules, the first two also in `plan-orchestration`; the rule on every target in scope in the template change standard and in the shared rules beside "Zero warnings"; the rule on loading a YAML file after every write in rule 16 of the template change standard and the YAML bullet of `coding-standards/common.md`; this repository's own `docs/dev/change-standard.md` gets the two code rules by hand (the user).
- D4 what `paper` and `grant` do when a text is over its limit (2026-11-24): A, the layout is only ever what the venue or funder states: the sentence of `skills/academic/paper/agents/formatter_agent.md` that applies a venue-compliant layout value to meet a limit is replaced, an over-limit text goes back to the draft writer once to cut content, what is still over is shown to the user with each section's length, and `grant` gets the same step (the user).
- D6 who drives the portal and what the walk never does (2026-11-24): A, a fresh agent writes the submission sheet, the user approves it before the browser is touched, the session drives the browser and fills what the sheet holds, a field the sheet lacks is added to it as a question to the user, the session never types a password, never agrees to a licence, a copyright transfer or a payment and never presses the final submit, and without the extension connected the sheet is written and the run stops; "this should work for general submission, so for instance also grant stuff and such, or even registration for an event or anything" (the user).
- D9 when the build driver is written (2026-11-24): D, `ordo-init` gets a mode `/ordo-init build` that writes `utils/build.py` from the commands of the verification page and rewrites that page to name the driver's commands, a new-repository run writes the driver by the same steps, and an existing or configured repository gets it only through the mode; "we can ask for it not to do the build thing in new-repo mode" (the user).
- D10 where general submission lives (2026-11-24): A, one skill `submit`, `/submit <url> [<folder>]`, which reads the portal's forms for what is asked and the folder for the material, writes the submission sheet and walks the portal as D6 rules, with no mode in `paper` or `grant`; `docs/figures/paper/lifecycle.svg` names `/submit` at "You submit" and "You resubmit" (the user).
- D11 the page of `/tutor explain` (2026-11-24): B, the explanation is given in the conversation, and `/tutor explain <concept> --page` also writes it as one HTML page in the lesson's form, to `reference/` in a teaching workspace and elsewhere to a path the user gives or is asked for (the user).
- D12 a group folder for `tutor` and `wait-what` (2026-11-24): `tutor` and `wait-what` stand together in a new group folder, and `session-retro` stays in `skills/ordo/` (the user).
- D13 the name of that group folder (2026-11-24): A, `skills/explain/` (the user).
- D14 the roadmap diff of entry 25 (2026-11-24): A, written as drafted: the title, the mode `/ordo-init build` with the new-repository run, the skill `submit` in place of the `paper` mode, `--page` on `/tutor explain`, and the gate's runs of `/ordo-init build`, of `/submit` on a manuscript and on a submission of another kind, and of `/tutor explain` with `--page` (the user).
- D15 record as ADRs (2026-11-24): A, four records with status `proposed`: `docs/adr/0048` on `tutor`, `0049` on `submit`, `0050` on limits and layout, `0051` on the build driver (the user).
- D16 the group folder of `submit` (2026-11-24): `skills/academic/submit/`, since a manuscript or a grant application stays its main use (the user).
- C (2026-11-24): option 1. The submission sheet is first written from what the portal shows without a sign-in and from the folder; the user approves it; each field the portal asks that the sheet lacks is added to the sheet as a question during the walk; the browser is not opened before the approval. It unblocks step 4 (the user).
- D (2026-11-24): option 1. `tutor` writes the glossary as `reference/GLOSSARY.md` in the format page's structure; both format pages keep their words; ADR 0048 gets one line. Step 6 carries it out (the user).
- E (2026-11-24): option 1. ADR 0050 gets one sentence: a layout value the venue or the funder does not state comes from the declared format profile, and with no profile is the current default. Step 6 carries it out (the user).
- A (2026-11-24): the five rules read as meant, the open-items rule for "an open item that offers options" and the effort rule for "a change to the repository" included; option 1 on the third point: no sentence is added on options that cost the user nothing (the user)
- B (2026-11-24): question 1, option 1: the driver runs each command of the verification page as a shell command under `bash -o pipefail` and imports nothing, and the words "the checks imported and called" leave the entry's goal in the roadmap diff at the closing. Question 2, option 1: `gate` skips a list that holds no command and fails only when all three are empty, `build`, `test` or `check` called on an empty list says so and exits non-zero, the verification page names only the subcommands that have a command, and ADR 0051 gets one sentence that says so. It unblocks step 3 (the user)
- The step list (2026-11-24): approved as drafted, seven steps (the user).
- Models and steps in flight (2026-11-24): the builders and the reviewers run on `claude:opus` in place of `claude:fable`, and `workers_at_once` is 5 in place of 3, both written to `docs/plan.yaml` (the user).
- Effort (2026-11-24): the builders and the reviewers run at effort `medium` in place of `low`, written to `docs/plan.yaml` (the user).
- Open item F (2026-11-24): option 3, `disable-model-invocation: true` leaves `submit` and `tutor`, so that an agent can make the gate's runs of them through the Skill tool; `tutor` then differs from its source `teach` in this point, written in ADR 0048 and in `deviations.md`; the gate's runs go on `v11.0.0-rc.2` (the user).
- Open item G (2026-11-24): option 3, `ordo-init` stays as it is, and at the closing the roadmap gate's words on the new repository say that `./utils/build.py gate` exits 0 once a first passing test exists and non-zero once a failing test is added (the user).
- Open item H (2026-11-24): option 2, the submission sheet of `submit` is written from the folder and from the public instructions (the portal's pages `curl` can save, the journal guide of `paper`, a funder config of `grant`), says how much of the portal's form could be read, and is never shown for approval with nothing from the folder; in the walk each field of the form is matched to a row and a field with no row is asked; both `/submit` runs of the gate are made again on `v11.0.0-rc.3` (the user).
- Open item I (2026-11-24): option 1, the sentences of `tutor` whose meaning differs from the source `teach` are put back to the source's meaning, the instruction the copy added is removed, and `deviations.md` is corrected (the user).
- Open item J (2026-11-24): a value of the submission sheet is always its whole text, however long, never a summary or a pointer, fixed now in `submit` (the user).
- Open item K (2026-11-24): the sheet agent of `submit` reads a folder's own list of what is left out of a submission and leaves those files out of "Files" with a count; `.gitignore` is no such list (the user).
- The final runs (2026-11-24): the walks of the two `/submit` runs are made from the link the user gave, with no further act of the user; before step 8 the orchestrator reports each final run with pass or fail, and step 8 starts after that report (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- a6a641092c180b960: grill lookup, claude-fable-5-2
- aa7a2f4de5dea9a2f: grill lookup, claude-fable-5-2
- a84e8e7f2b9dce5b4: brief check of step 1, claude-opus-5-5
- a1c62803166842022: builder of step 1, claude-opus-5-5
- aff8729b7d77a1e04: reviewer of step 1, claude-opus-5-5
- a82688a6d8c685329: reviewer of step 1 over round 1, claude-sonnet-5-5
- a87e63407ae314392: brief check of step 2, claude-opus-5-5
- ab554d078f519c4bd: brief check of step 3, claude-opus-5-5
- af32ec4714532fb10: brief check of step 4, claude-opus-5-5
- a80a3d262da646252: brief check of step 5, claude-opus-5-5
- a363858a943d81ea8: builder of step 2, claude-opus-5-5
- a98a16ecb5987063a: reviewer of step 2, claude-opus-5-5
- ab9fe8e68965015ba: reviewer of step 2 over round 1, claude-sonnet-5-5
- ab824b150f2570d7a: builder of step 5, claude-opus-5-5
- aadec4c5e8a7aae13: reviewer of step 5, claude-opus-5-5
- ad09d6adfa6f4853c: reviewer of step 5 over round 1, claude-sonnet-5-5
- a623c018efa0d9295: builder of step 6, claude-opus-5-5
- a5a55e89c91a2caba: reviewer of step 6, claude-opus-5-5
- aad1290499046e502: builder of step 4, claude-opus-5-5
- a69c8e7d7e94743e3: reviewer of step 4, claude-opus-5-5
- acaac3eedcad88ce6: reviewer of step 4 over round 1, claude-sonnet-5-5
- afe9b922f157189e8: builder of step 3, claude-opus-5-5
- a5bc4b4e441d63e90: reviewer of step 3, claude-opus-5-5
- a81a1a70ecf47f318: reviewer of step 3 over round 1, claude-sonnet-5-5
- a10d74bc88b8b7ab6: gate run of /ordo-init on a new python repository, claude-opus-5-5
- a8345eb24bd6ca099: gate run of /ordo-init build on a scratch clone of ordo, claude-opus-5-5
- a75109dfea599bd95: gate run of /tutor, first session, pixel art, claude-opus-5-5
- a1b54bd28f2fc185a: gate run of /tutor explain git worktree --page, claude-opus-5-5
- a52fe985477014025: gate run of /submit on the journal's portal, to the approval of the sheet, claude-opus-5-5
- a234f4e4517ec9965: builder of ruling F, claude-opus-5-5
- a79672ea3d3b4f41c: gate run of /tutor on v11.0.0-rc.2, first session, pixel art, claude-opus-5-5
- ae11221ea13d8e943: gate run of /tutor explain git worktree --page on v11.0.0-rc.2, claude-opus-5-5
- ae66c5257ddf0e46c: gate run of /submit on the journal's portal on v11.0.0-rc.2, to the approval of the sheet, claude-opus-5-5
- aac165cfb3187030c: gate run of /submit on the deposit form on v11.0.0-rc.2, to the approval of the sheet, claude-opus-5-5
- a3aa8f1d0e51b9a81: gate run of /tutor on v11.0.0-rc.2, second session, claude-opus-5-5
- aa85f45e56022c96e: check of the deviations list against the source skill, claude-opus-5-5
- a43b8d38788a165a3: builder of ruling I, claude-opus-5-5
- aa238fda60548b301: builder of ruling H, claude-opus-5-5
- ac3b8e3d52f4ad011: gate run of /submit on the deposit form on v11.0.0-rc.3, to the approval of the sheet, claude-opus-5-5
- aa26a6855ea5b887b: gate run of /submit on the journal's portal on v11.0.0-rc.3, to the approval of the sheet, claude-opus-5-5
- ad2d880fc0e83b85c: builder of rulings J and K, claude-opus-5-5

## Blocked, and by what

- 7: in progress on `v11.0.0-rc.1`. The walks of the two `/submit` runs wait for the user, who reads each sheet and watches each walk.
