# Choices of plan 9, lapsed

These choices were taken under self-rule for plan 9 and lapsed when the user dropped roadmap entry 9 on 2026-10-18; they are kept as the record of the plan, not for review.

## C72. The four indexes of the goal (2026-10-17)

The goal names "search through Crossref, OpenAlex, Semantic Scholar and arXiv". All four answer without a key: Crossref needs "no signup or registration", OpenAlex allows "basic queries with no key at all" within $0.10 of usage a day, Semantic Scholar shares an unauthenticated pool, and arXiv asks for one request every three seconds.
  - Option (a), recommended: keep the four. Pro: each covers what the others miss (arXiv preprints, Crossref publisher DOIs, OpenAlex and Semantic Scholar references, citing works and open-access links), and coverage rows 209, 212, 213 and 214 take a protocol for each. Con: four clients in the lookup script.
  - Option (b): Semantic Scholar alone. Pro: one client. Con: drops the DOI cross-check against the publisher's record and the arXiv lookups the coverage rows take.
  - Industry: PaperQA2 ships Crossref and Semantic Scholar by default with OpenAlex optional (https://raw.githubusercontent.com/Future-House/paper-qa/main/src/paperqa/clients/__init__.py, `DEFAULT_CLIENTS`); Ai2 Scholar QA and OpenScholar search Semantic Scholar only (https://arxiv.org/html/2504.10861, https://www.nature.com/articles/s41586-025-10072-4).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:53` (D2 The four indexes of the goal)
Builds on it: none

## C73. Source verification in the goal (2026-10-17)

The goal names "source verification". Coverage row 196 takes the verifier: a title-similarity match, a DOI pointing at another title flagged, a fabricated reference removed.
  - Option (a), recommended: keep it. Pro: a plain model fabricates many references (OpenScholar's Table 3: 78.7 percent of GPT-4o's cited papers in computer science do not exist, https://arxiv.org/html/2411.14199), so each cited source is looked up. Con: one lookup per source.
  - Option (b): drop it and rely on the search results. Pro: fewer requests. Con: a reference the writer adds outside the search is never checked.
  - Industry: Ai2 Scholar QA deletes every citation key that matches no extracted quote (https://raw.githubusercontent.com/allenai/ai2-scholarqa-lib/main/api/scholarqa/postprocess/json_output_utils.py); OpenScholar's evaluation checks each cited title against the Semantic Scholar API (Nature article above).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:54` (D3 Source verification in the goal)
Builds on it: none

## C74. Synthesis in the goal (2026-10-17)

The goal names "synthesis". Coverage rows 197 and 231 take the source-by-theme matrix and the explanation of each contradiction.
  - Option (a), recommended: keep it. Pro: a report that integrates sources by theme is what the user needs for a paper's related work. Con: none beyond the work.
  - Option (b): an annotated list of sources. Pro: simpler. Con: the coverage rows that take the matrix go unbuilt, and deep-research's synthesis would win the comparison.
  - Industry: Ai2 Scholar QA clusters quotes into sections before writing (https://arxiv.org/html/2504.10861); STORM writes from an outline (https://raw.githubusercontent.com/stanford-oval/storm/main/README.md).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:55` (D4 Synthesis in the goal)
Builds on it: none

## C75. The `.bib` in the goal (2026-10-17)

The goal names "the `.bib`". The hub's manuscripts cite from a `.bib` beside them (coverage row 158).
  - Option (a), recommended: keep it. Pro: `paper` and LaTeX use the run's sources directly. Con: one BibTeX entry to build per source.
  - Option (b): a reference list in the report only. Pro: no BibTeX. Con: the user copies every entry by hand into the manuscript.
  - Industry: clibib resolves BibTeX through the Zotero Translation Server and reports that only 50.9 percent of entries written by search-enabled frontier models are fully correct (https://arxiv.org/html/2604.03159).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:56` (D5 The `.bib` in the goal)
Builds on it: none

## C76. The gate's check that every cited source resolves (2026-10-17)

The gate says "every source it cites resolves".
  - Option (a), recommended: keep it, for every DOI and every URL the report cites. Pro: a citation that does not resolve is a critical failure in the blind comparison (`docs/dev/blind-comparison.md` item 5). Con: none.
  - Option (b): check DOIs only. Pro: fewer requests. Con: an arXiv or web source that does not resolve passes.
  - Industry: OpenScholar counts a citation fabricated when its title is not in Semantic Scholar (Nature article above); HALLMARK evaluates a DOI-lookup baseline (https://export.arxiv.org/abs/2607.18360).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:57` (D6 The gate's check that every cited source resolves)
Builds on it: none

## C77. The gate's reading of twenty citations drawn at random (2026-10-17)

The gate says "for a sample of twenty citations drawn at random, the cited passage is read and supports the claim it is cited for". Who reads them is a decision for the user (D12).
  - Option (a), recommended: keep it. Pro: a source that exists can still not support its claim; STORM's own measure finds about 15 percent of sentences unsupported by their citations (https://arxiv.org/html/2402.14207), and the resolve check does not see that. Con: twenty full-text readings.
  - Option (b): read only that the source exists. Pro: cheaper. Con: the failure STORM and PaperQA2 measure goes unchecked.
  - Industry: PaperQA2's WikiCrow evaluation counts "cited and unsupported" statements (13.5 percent against 24.9 percent for Wikipedia, https://arxiv.org/html/2409.13740).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:58` (D7 The gate's reading of twenty citations drawn at random)
Builds on it: none

## C78. The gate's check that a source that cannot be accessed is reported (2026-10-17)

The gate says "a source that cannot be accessed is reported, not written around".
  - Option (a), recommended: keep it. Pro: a claim written from a source nobody read is the failure the gate exists to stop. Con: none.
  - Option (b): drop it. Pro: none. Con: the skill could cite from an abstract or memory without saying so.
  - Industry: Ai2 Scholar QA labels text from the model's own knowledge "[LLM MEMORY | 2024]" (https://raw.githubusercontent.com/allenai/ai2-scholarqa-lib/main/api/scholarqa/llms/prompts.py).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:59` (D8 The gate's check that a source that cannot be accessed is reported)
Builds on it: none

## C79. The gate's blind comparison against deep-research (2026-10-17)

The gate says "a side-by-side run against deep-research on a real topic, compared blind as `docs/dev/blind-comparison.md` says, wins or ties".
  - Option (a), recommended: keep it. Pro: the skill replaces deep-research for the hub, so it must do at least as well on a hub topic. Con: two full runs and two judges.
  - Option (b): drop it. Pro: cheaper. Con: nothing shows the new skill is not worse than the one it replaces.
  - Rule: `docs/dev/blind-comparison.md` items 1 to 7.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:60` (D9 The gate's blind comparison against deep-research)
Builds on it: none

## C80. The gate's coverage records (2026-10-17)

The gate asks for a record per `rebuild: literature` row. `grep -c 'rebuild: literature' docs/academic-coverage.md` counts the rows.
  - Option (a), recommended: keep it. Pro: each source file's behaviour the coverage approved is checked as built. Con: one reading per row.
  - Option (b): one record for the whole skill. Pro: shorter. Con: a row left unbuilt is not seen.
  - Rule: `docs/academic-coverage.md`, its introduction.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:61` (D10 The gate's coverage records)
Builds on it: none

## C81. The agents of a literature run (2026-10-17)

Coverage rows 185 to 197 take the bibliography, verification, synthesis, report, editor and devil's advocate roles of deep-research; rows 186 and 187 make the editor and the devil's advocate drive a two-loop revision.
  - Option (a), recommended: fresh agents in turn: search, verification, one reading agent per source, synthesis and report, then a fresh editor and a fresh devil's advocate, each revision by a fresh writer. Pro: a reviewer that did not write the draft finds what the writer missed (ADR 0013 for `/writing`); a reading agent per source keeps each source's text out of the others' context; clibib measured lower regression when search is separated from revision (0.8 against 4.8 percent, https://arxiv.org/html/2604.03159). Con: more agent runs per report.
  - Option (b): one agent with tools does every stage, as PaperQA2 does. Pro: fewer runs. Con: the agent reviews its own draft, and every source's text shares one context.
  - Option (c): the session does the work inline. Pro: no agent launches. Con: the session's context fills with full texts, and nothing reviews the draft fresh.
  - Industry: PaperQA2 runs one agent over its tools (https://arxiv.org/html/2409.13740); Ai2 Scholar QA reads "each paper's content independently" before writing (https://arxiv.org/html/2504.10861); none of the four systems found has a separate critic.
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:62` (D14 The agents of a literature run)
Builds on it: none

## C83. A source that cannot be accessed, and a reference that cannot be confirmed (2026-10-17)

The gate wants such a source "reported, not written around"; coverage row 196 sends an unconfirmed reference to the user and row 184 keeps unconfirmed references out. A stop that asks the user mid-run is judged in the blind comparison on what was produced (`docs/dev/blind-comparison.md` item 1).
  - Option (a), recommended: cite neither; list each in the report's sections "Sources not accessed" (with every URL tried and what it returned) and "References not confirmed" (with the lookups made); a claim that needed one becomes a marked gap; no stop. Pro: the user gets every one in the report, and the run finishes. Con: the report has two more sections.
  - Option (b): stop and ask the user about each. Pro: the user can supply a PDF. Con: the run stops, and in the comparison the missing parts count as critical failures.
  - Industry: Ai2 Scholar QA removes a citation it cannot match and logs it (json_output_utils.py, above).
  - Recommendation: (a). The lazy option is none, since both do the work; (b) costs a stop.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:64` (D16 A source that cannot be accessed, and a reference that cannot be confirmed)
Builds on it: none

## C84. The report's form (2026-10-17)

The report goes to the user and to `paper`, whose manuscripts are LaTeX with a `.bib`.
  - Option (a), recommended: Markdown with Pandoc citation keys `[@key, <locator>]` matching the `.bib`, the lit-review sections, a method section with the criteria and searches. Pro: readable as it stands, and each key goes into `\cite` unchanged. Con: none.
  - Option (b): LaTeX. Pro: drops into a manuscript. Con: harder to read as a report, and most of it is not manuscript text.
  - Option (c): Markdown with numbered references. Pro: familiar. Con: the numbers do not match the `.bib` keys.
  - Industry: PaperQA2 cites keys of the form "(Qian2011Neural pages 1-2)" (README above).
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:65` (D17 The report's form)
Builds on it: none

## C86. A stop for the user before searching (2026-10-17)

deep-research's full mode makes phase 1 interactive (`research-hub/.claude/skills/deep-research/SKILL.md:140`). Coverage row 59 runs searches "under preset criteria".
  - Option (a), recommended: no stop; the criteria and searches are written into the method section before the first search. Pro: the criteria are fixed before results are seen, which row 59 asks, and the run finishes for the comparison. Con: the user cannot correct the criteria before the search.
  - Option (b): stop for the user's approval of the criteria. Pro: the user steers. Con: in the blind comparison the run stops and is judged on nothing.
  - Rule: `docs/dev/blind-comparison.md` item 1.
  - Recommendation: (a). The lazy option is none; (b) costs the comparison.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:67` (D19 A stop for the user before searching)
Builds on it: none

## C87. The prose check of the report (2026-10-17)

Coverage row 184 sends the writing check to `writing`; entry 3's ruling D30 says the skill that owns the text writes the fix, and `/writing` applies nothing.
  - Option (a), recommended: invoke `/writing` on the report after the revision, show its findings, apply the picked ones on `apply <numbers>` with a fresh writer agent. Pro: the report meets the prose standard ADR 0002 holds for writing skills. Con: one more review per run.
  - Option (b): the writer follows the prose standard, with no `/writing` run. Pro: cheaper. Con: nothing checks the prose.
  - Rule: ADR 0002; coverage row 184.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:68` (D20 The prose check of the report)
Builds on it: none

## C88. Where a run writes (2026-10-17)

A run produces a report, a `.bib` and a record of what was fetched. The user wants no backups.
  - Option (a), recommended: a folder the call names, by default `literature/<topic slug>/`, with `report.md`, `references.bib` and `sources.md`; full texts in a temporary folder removed at the end. Pro: the record shows what was read and when, and no copy of a paper stays on disk. Con: a later reader fetches a source again.
  - Option (b): keep the full texts in the folder. Pro: the gate's reader has them. Con: copies of papers in the repository.
  - Industry: PaperQA2 caches parsed PDFs in an index (README above).
  - Recommendation: (a). The lazy option is none; both cost the same.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:69` (D21 Where a run writes)
Builds on it: none

## C89. The optional second-model critique (2026-10-17)

Coverage row 186 keeps "the optional second-model critique, sent only with the user's consent". deep-research reads `ARS_CROSS_MODEL` and points at `shared/cross_model_verification.md`, which `find research-hub/.claude/skills -name cross_model_verification.md` does not find. `codex` is installed on this machine (`which codex`).
  - Option (a), recommended: `LITERATURE_SECOND_MODEL` names a command; the skill asks at the start of the run, naming the command and the material, and sends the report without the devil's advocate's findings only on a yes. Pro: any CLI the user has works, and the question comes before the work, so an unset variable means no stop. Con: one environment variable.
  - Option (b): a fixed provider's HTTP API with its key. Pro: no CLI needed. Con: a key and a client in the skill for one provider.
  - Rule: coverage row 186.
  - Recommendation: (a). The lazy option is to leave the critique out, which row 186 does not allow.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:70` (D22 The optional second-model critique)
Builds on it: none

## C91. Record the agents of a literature run as an ADR (2026-10-17)

D14 is not obvious from the code, binds `paper` and `paper-review`, which reuse the roles, and has alternatives rejected.
  - Option (a), recommended: record it, status proposed. Pro: the reason for fresh agents stays with the decision. Con: one file.
  - Option (b): the ruling only. Pro: shorter. Con: a later plan can merge the agents without seeing why they were split.
  - Rule: `docs/adr/README.md`, first paragraph.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:72` (D25 Record the agents of a literature run (D14) as an ADR)
Builds on it: the record `docs/adr/0015-a-literature-run-is-done-by-fresh-agents-in-turn-and-reviewed-by-a-fresh-editor-and-devil-s-advocate.md`

## C92. Record the tie between a citation and its source as an ADR (2026-10-17)

D15 binds `paper`, which cites through the same lookups (D1), and rejects WebFetch and abstracts.
  - Option (a), recommended: record it, status proposed. Pro: a later skill does not fall back to WebFetch without seeing why. Con: one file.
  - Option (b): the ruling only. Pro: shorter. Con: the reason is lost when the plan is archived.
  - Rule: `docs/adr/README.md`, first paragraph.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:73` (D26 Record the tie between a citation and its source (D15) as an ADR)
Builds on it: the record `docs/adr/0016-a-cited-claim-rests-on-a-verbatim-passage-read-from-the-source-in-the-same-run.md`

## C93. The roadmap diff of entry 9 (2026-10-17)

The user ruled D12: a fresh reviewer agent reads the twenty sampled citations and the user reads its table. The gate says only "the cited passage is read". Asked of the changed gate, "could this pass without the goal being reached?": no, since each of the twenty rows quotes the passage as it stands in the source, and a report without supported citations fails it; "is this checked once, on the finished work?": yes, on the report of the gate's run.
  - Option (a), recommended: the sample clause reads "for a sample of twenty citations drawn at random, a fresh reviewer agent reads each cited passage in its source and finds that it supports the claim it is cited for, in a table the user reads". Pro: the gate `/plan` copies says who reads, as the change standard asks a ruling to settle for the entry. Con: a longer gate.
  - Option (b): no change, the ruling D12 alone. Pro: the entry stays as it is. Con: a reader of the roadmap takes the reading to be the user's.
  - Rule: the `roadmap` skill's Rules (the entry states the goal, the gate and the dependencies); `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read".
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:76` (D28 The roadmap diff of entry 9)
Builds on it: the roadmap diff of entry 9

## C94. Record the lookup script as an ADR (2026-10-17)

The user ruled D11. The decision binds `paper`, which reuses the lookups (D1), and rejects the agents' own lookups that deep-research uses.
  - Option (a), recommended: record it, status proposed. Pro: a later plan does not move the lookups back into agents' text without seeing why. Con: one file.
  - Option (b): the ruling only. Pro: shorter. Con: the reason is lost from view once the rulings file is used.
  - Rule: `docs/adr/README.md`, first paragraph.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:77` (D29 Record the lookup script (D11) as an ADR)
Builds on it: the record `docs/adr/0017-one-standard-library-script-makes-every-reference-lookup-of-the-literature-skill.md`

## C96. The model and effort of a literature run's agents (2026-10-17)

The user ruled that `code-comments`' rewrite agent runs on `reviewer` at `reviewer_effort`, in place of the recommended `worker` (E2, `.scratch/archive/4-code-comments/plan.md:67`). `.agents/plan.yaml:10` lists who runs on `reviewer`, and `agents/ordo-high.md:3` lists the work its agents are launched for.
  - Option (a), recommended: every agent of a run on `reviewer` at `reviewer_effort`, the comments and descriptions naming the literature agents, no value changed. Pro: the report's reading and synthesis get the model the user picked for writing work, and one rule covers every agent. Con: a run with many sources costs more than on `worker`.
  - Option (b): the search and reading agents on `worker`, the synthesis, editor and devil's advocate on `reviewer`. Pro: cheaper reading. Con: the passages every claim rests on are extracted by the weaker model, against the user's choice in E2.
  - Option (c): every agent on `worker`. Pro: cheapest. Con: the same, for the whole report.
  - Industry: PaperQA2 maps one model across every chunk for its evidence step (https://arxiv.org/html/2409.13740); none of the four systems fetched names a per-stage model split.
  - Recommendation: (a). The lazy option is none, since each option costs the same to build; (c) costs least to run.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:80` (D31 The model and effort of a literature run's agents)
Builds on it: none

## C97. The gate's topic and mode, replacing D23 (2026-10-17)

D23 compared the full report against deep-research's `lit-review` mode, which runs bibliography, verification and synthesis only, with no editor or devil's advocate (deep-research's "Operational Modes" table). The report D14 rules matches deep-research's `full` mode, whose phase 1 is interactive (`deep-research/SKILL.md:140`); a side that stops to ask is judged on what it produced (`docs/dev/blind-comparison.md` item 1).
  - Option (a), recommended: `/literature <topic>` with `--bib research-hub/projects/active/linfoot-estimator/manuscript/main.bib` against deep-research's `full` mode on the same input. Pro: the two sides run the same stages, so the comparison measures the skill and not the mode. Con: deep-research's `full` run is the longer one.
  - Option (b): keep D23, the full report against `lit-review`. Pro: a shorter old side. Con: the new side would win on stages the old side never ran, which shows nothing.
  - Rule: `docs/dev/blind-comparison.md` item 1.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:81` (D32 The gate's topic and mode, replacing D23)
Builds on it: none

## C98. The roadmap diff of entry 9 for D30 to D32 (2026-10-17)

The gate names "a side-by-side run against deep-research on a real topic"; D30 to D32 change the skill's calls, its agents' model and the mode of that run.
  - Option (a), recommended: no change to the entry. Pro: the entry states the goal, the gate and the dependencies, and the mode and topic are rulings `/plan` copies. Con: none.
  - Option (b): name the topic and the mode in the gate. Pro: the roadmap shows them. Con: a run's detail in the entry, which the `roadmap` skill's Rules keep to the goal, the gate and the dependencies.
  - Rule: the `roadmap` skill's Rules.
  - Recommendation: (a). The lazy option is none; (a) does the work the rules ask.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:82` (D33 The roadmap diff of entry 9 for D30 to D32)
Builds on it: none

## C99. The step list of plan 9 as drafted (2026-10-17)

`/plan 9 --self-rule` drafted three steps: step 1, the skill, its lookup script with the script's test, its wiring and the coverage records, with the gate's coverage check as part of its check; step 2, the gate run, which needs step 1 landed, tagged and pinned and is run by the orchestrator with the user's reading of the table; step 3, the closing. The script and the skill are one step, since both contents are known in advance from D11 and D30 and the skill only names the script's commands. Every answer of "## Gate" is no, no design decision is left unsettled after the two `/grill 9 --self-rule` runs, and no line of the rulings file was left to place.
  - Option (a), recommended: open the plan with the list as drafted. Pro: the plan opens and step 1 can be prepared at once; one builder writes the skill and the script together, so the commands the skill names are the ones the script has. Con: one large step for one builder and one review.
  - Option (b): keep the draft for the user. Pro: the user sees the list before the plan opens. Con: the plan does not open, and nothing in the written rules needs the user's call here.
  - Rule: the `plan` skill's Steps 2 and 3.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:83` (Open item A)
Builds on it: step 1, step 2, step 3

## C101. The `projects:` form of `.agents/plan.yaml` in the literature skill (2026-10-18)

The builder of step 1 refused the `projects:` form of `.agents/plan.yaml` (its report, judgment call 12), reading a project name as part of the topic. research-hub's `.agents/plan.yaml` has that form, with the one project `oculus`, so the gate run of step 2 stops there at "No plan configuration", and Steps 17 hands `/writing` no project, which `/writing` refuses as "Unknown project". The reviewer (`.scratch/9-literature/agents/reviews/1-refuter.md`, Spec, the first finding) found it; D30 gives the three call forms and says nothing on the form.
  - Option (a), recommended: in the `projects:` form the first argument of the call names the project whose keys are read, before the mode and the topic, as `/writing` and `/code-comments` read it; a name no project has is the refusal "Unknown project", which lists the projects; Steps 17 passes the project to `/writing`. Pro: the skill runs in research-hub, and the call reads as every other Ordo skill's call does in that form. Con: one more argument in that form.
  - Option (b): keep the refusal, and run the gate in ordo with an absolute `--bib` and an `--out` outside research-hub. Pro: no change to the call forms. Con: the skill cannot run in the repository it is for.
  - Rule: `skills/writing/SKILL.md` and `skills/code-comments/SKILL.md`, "What it reads" 1.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:97` (The `projects:` form in `/literature`)
Builds on it: step 1, step 2
