# Plan: 8. grant

Execution ledger for roadmap entry 8, grant (`docs/roadmap.md`). One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The grant skill: it drafts, revises, reviews and checks a grant application written in LaTeX, from a funder config that holds the funder's required sections, limits, layout rules and evaluation criteria. `/grant config` drafts that config from the call documents you give and saves it beside the application after your approval; the skill ships the config's format and one filled example, and holds no funder's facts. It is a small skill that runs `paper`'s roles from that skill's pages and adds the config, the checks of the limits and of the required sections, and the criteria review. It applies the `/writing` findings you accept to the application.

## Gate

the tests of the two check scripts pass; one run on the 2024 FWO postdoc application of `research-hub/funding/2024-fwo-postdoc-fbttr/`, on a copy, made by a separate agent that invokes `/grant` as the installed skill, with its stops answered by the orchestrating session: `/grant config` writes the config from the call documents you give, `/grant draft` writes the section "Scientific research objectives" from the pitch slides and the 2022 submission and ends with the `/writing` findings applied as patches, and `/grant check` and `/grant review` run on the application you submitted; you read the config against the call, the drafted section against the one you submitted, and the criteria review, and find each score tied to its passages.

- The gate: could this pass without the goal being reached? no, each mode but `revise` runs on real input and the user reads each output, and `revise` shares `draft`'s patch path; it is checked once, on the finished skill.
- Step 1: could this pass without the goal being reached? no, the scripts are proved by their tests and a reviewer reads the skill's words against each ruling and reads both folders for a copied page; that a run gives a good config, section and review is step 2's.
- Step 2: could this pass without the goal being reached? no, it is the gate's run on the finished skill, read by the user.

## Steps, in execution order

- ✅ 1 the skill: `skills/academic/grant/` with its `SKILL.md` in the skill layout and five modes (`config`, `draft`, `revise`, `review`, `check`), its own pages for what a grant adds (the config drafter, the criteria reviewer, the config's format and one filled FWO example, the intake), the two check scripts with their tests, `paper`'s roles started from the `paper` skill's pages, and the skill listed where the skills are listed (README, glossary, the dev pages, the scripts page, the verification page, its figure); the two scripts' tests pass, a reviewer reads `SKILL.md` and the pages against each ruling of this plan and finds it carried out, reads both folders and finds no copy of a page of `paper`, and the verify list of `docs/dev/building.md` passes (1 commit) (approved)
- 2 the gate's run: one run on a copy of the 2024 FWO postdoc application of `research-hub/funding/2024-fwo-postdoc-fbttr/`, made by a separate agent that invokes `/grant` as the installed skill and starts the skill's agents, the orchestrating session answering its stops: `/grant config` from the call documents, `/grant draft` of the section "Scientific research objectives" from the pitch slides and the 2022 submission with the `/writing` findings applied as patches, and `/grant check` and `/grant review` on the submitted application; the user reads the config against the call, the drafted section against the one submitted, and the criteria review, as the gate words it (0 commit) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Step 1, landed (2026-11-23)

- What landed: `skills/academic/grant/` (`SKILL.md`, `agents/config_drafter_agent.md`, `agents/criteria_reviewer_agent.md`, `references/intake.md`, `examples/fwo-postdoc-2027.md`, `templates/funder_config_template.md`, `templates/criteria_review_template.md`, `templates/check_limits.py`, `templates/check_sections.py` and their two tests); the listings in `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md`, `docs/dev/scripts.md` and `docs/glossary.md`; `grant()` in `docs/figures/gen_figures.py` with `docs/figures/grant.svg`. No file of `skills/academic/paper/` changed.
  - Premise corrections: the brief check gave 33 points, each closed in the brief before the build (the form fields read between the user's `<!--F:key-->` markers; no row added to `paper`, as D12 says; the intake's own page; the counted text defined). Two premises of the brief were wrong and were corrected from the sources during the build and the review: the FWO grid scores 0 to 7, and page 10 of the 2024 application form states the layout (Calibri 11, single line spacing, the template's margins).
  - The verify list gained the two new tests, as `docs/dev/building.md` now lists them.
  - Findings outside the brief: none raised as an open item.
  - Verification: `sh /Users/axelfaes/.claude/skills/land/templates/checks.sh .scratch/8-grant/orchestrator-state.md`, run on main after the fixes at landing, ended `checks: 14 commands passed`.
  - A/B: none, the configuration names no benchmark. Look: none, the configuration names no view. `python3 docs/figures/gen_figures.py`, run on main, left `docs/figures` with no unstaged change.
  - The builder's first report did not pass its bar: the first review gave 14 findings (the example's layout written as not stated; every agent forbidden every online lookup, the citation check included; the layout file asked of the intake agent against its page; three refusals of `check_sections.py` without a case; the Field cell not tied to the marker key; nine smaller points of text and of what the report stated), all closed in repair round 1.
  - Fixes at landing, three, each from the review over round 1: the config drafter's page and the config template write the scores of a label only where the document prints them; `draft` names the formatter's field map for the keys of the layout file; on a runner without `latexmk`, `check_limits.py` is not run and the user is told that no limit was checked.
  - Agents: the brief check af4851eb920202757 (claude-fable-5-2, 220228 tokens, 25 tool uses, 6.8 minutes); the builder a16e41a3e1d10c18d (claude-fable-5-2: the build 150382 tokens, 47 tool uses, 14.6 minutes; round 1 185526 tokens, 7 tool uses, 2.7 minutes); the reviewer a49b15f323aa7dbde (claude-fable-5-2, 246889 tokens, 39 tool uses, 9.2 minutes); the reviewer over round 1 a9728ec4c5808246f (claude-sonnet-5-5, with one recorded call on claude-opus-5-5, 164014 tokens, 27 tool uses, 3.6 minutes).

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- none: step 2 runs the skill step 1 builds.

## Rulings (2026-11-23)

- The step list (2026-11-23): approved as drafted, three steps (the user).
- D1 What the skill does (2026-11-23): it drafts, revises and checks a grant application; the drafting is `paper`'s, steered by the funder's sections and criteria; the lazy option was checks only (the user).
- D2 Which funders come first (2026-11-23): FWO, in the gate's run and in the shipped example; the skill holds no funder's facts, and another funder is a new config file; the lazy option was one FWO programme only (the user).
- D3 Where a funder config lives and how it is made (2026-11-23): (a) in the application's repository, made by the skill: `grant` ships the config's format and one filled example, a config mode has an agent draft the config from the call documents the user gives, the user approves it, and it is saved beside the application, named by funder, programme and call year; the lazy option was (b), configs shipped in the skill (the user).
- D4 The file format of an application (2026-11-23): LaTeX is the source, as with `paper`; the page limit is checked on the compiled PDF; where a funder wants Word, `paper`'s format-convert makes the `.docx`; the lazy option was none (the user).
- D5 How the `/writing` findings are applied (2026-11-23): as `paper` does: the run calls `/writing`, lists the findings and applies the ones the user picks as patches, with `paper`'s patch scripts; the lazy option was none (the user).
- D6 What is done with the evaluation criteria (2026-11-23): the draft writer is given them, and one review agent reads the finished application as a panel member and scores it per criterion with the passage each score rests on; it is a review kind of its own, merged with neither the draft, the panel nor the referee review; the lazy option was storing them only (the user).
- D7 The funding statement (2026-11-23): dropped from the goal; the application's section on current and previous funding is one of the config's required sections; the lazy option was none (the user).
- D8 Agents and stops (2026-11-23): `paper`'s roles from `paper`'s pages (intake, structure architect, argument builder, draft writer, citation compliance, formatter), plus one criteria reviewer and one config drafter; the stops are the intake, the config confirmed, the outline and the `/writing` findings; the lazy option was none (the user).
- D9 The gate's inputs (2026-11-23): the 2024 FWO postdoc application under `research-hub/funding/2024-fwo-postdoc-fbttr/`, one section of it drafted by a separate agent on a copy and compared by the user with what was submitted; the lazy option was none (the user).
- D10 The scripts (2026-11-23): two, each with a test: one reads the PDF's page count and each section's length against the config, one checks that every required section heading is present and in order; whether a section answers its criterion is read by the review agent; the lazy option was none (the user).
- D11 Who writes the fix of a `/writing` finding of a grant (2026-10-14): "the skill that owns the text, `paper` or `grant`, writes the fix, as ADR 0003 and roadmap entries 5 and 8 say", carried from `.scratch/archive/3-the-writing-base/plan.md:58` (the user).
- D12 How `grant` runs `paper`'s roles (2026-11-23): (a) `grant` starts each role itself from `paper`'s pages and gives it the funder config, with `paper` unchanged; the lazy option was (b), calling `/paper`'s modes (the user).
- D13 The modes of `/grant` (2026-11-23): (a) five: `config`, `draft` (a section or the whole), `revise`, `review` (the criteria review) and `check` (the two scripts); the lazy option was (b), `config` and `full` only (the user).
- D14 The config's format (2026-11-23): (a) one Markdown page with fixed headings and tables: the sections (heading as the funder words it, limit, unit), the form fields, the layout rules, and the criteria with scale and descriptors, each with the page of the call it came from; limits in pages, words or characters; the lazy option was none (the user).
- D15 What the criteria review writes (2026-11-23): (a) a score per criterion on the funder's own scale, each with the passages it rests on and what would raise it; it changes nothing and predicts no outcome; the lazy option was (b), no scores (the user).
- D16 The autonomous pass for `/writing` findings (2026-11-23): (a) offered, as `paper` does under ADR 0023; the lazy option was none (the user).
- D17 The agents and the run folder (2026-11-23): (a) as `paper`: every agent on the runner's general-purpose agent with its defaults, and the records in `grant-runs/<mode>-<date>/` in the parent of the application's folder; the lazy option was none (the user).
- D18 What the gate's run starts from (2026-11-23): (a) the section "Scientific research objectives" drafted from the pitch slides and the 2022 submission, with a config made by `/grant config`, and then `review` run on the submitted application; the lazy option was (b), `revise` on the first draft (the user).
- D19 The roadmap entry's goal, gate and dependencies (2026-11-23): (a) written as drafted: the goal names the five jobs, the funder config made by `/grant config` and the criteria review, the gate is the scripts' tests and one run on the 2024 FWO postdoc application read by the user, and it waits on 3 and 5; the lazy option was none (the user).
- D20 The term "funder config" (2026-11-23): (a) added to the glossary; the lazy option was (b), no entry (the user).
- D21 The term "criteria review" (2026-11-23): (a) added to the glossary, as a review that is neither a draft review, a panel review nor a referee review; the lazy option was (b), no entry (the user).
- D22 Record as ADR? (2026-11-23): (a) one record, ADR 0044: a funder config lives with the application and is made by the skill, and `grant` ships no funder's facts; the lazy option was (c), none (the user).
- The shapes of the config, the scripts and the review file (2026-11-23): the config is `<funder>-<programme>-<call year>.md`, such as `fwo-postdoc-2025.md`, in a folder `grant-config/` in the application's folder; its headings are "Call" (funder, programme, year, the documents read), "Sections" (a table: heading, required, limit, unit, source), "Form fields" (a table: field, limit, unit, source), "Layout" (font, size, spacing, margins, source) and "Criteria" (the scale with its labels, then one table row per criterion with its descriptors and source); the scripts are `check_limits.py <config> <pdf> <main.tex>` and `check_sections.py <config> <main.tex>`, standard library only, the page count read from the LaTeX log, each printing one line per section or field; the criteria review is `criteria-review.md` in the run folder (the user).
- The call documents of the gate's run (2026-11-23): the existing material in `research-hub/funding/` only: the FWO guidelines in `2026-fwo-senior-transplant/fwo-guidelines/` and what the applications there state of the template; nothing is looked up online (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- a3a9aa56d1fe033c2: grill lookup, claude-fable-5-2
- af4851eb920202757: brief check of step 1, claude-fable-5-2
- a16e41a3e1d10c18d: builder of step 1, claude-fable-5-2
- a49b15f323aa7dbde: reviewer of step 1, claude-fable-5-2
- a9728ec4c5808246f: reviewer of step 1 over round 1, claude-sonnet-5-5

## Blocked, and by what

- 2: waits on step 1 landed, and on a release candidate tagged and pinned.
