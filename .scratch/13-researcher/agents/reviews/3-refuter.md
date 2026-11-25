# Refuter report of step 3

## Verification

Every command was run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-3`.

1. Character-set check (`printf '%s\0' <the 11 changed and new files and 3-report.md> | xargs -0 perl -CSD -ne '...'`): it printed nothing. `exit 0`.
2. `python3 docs/figures/gen_figures.py` printed 25 `wrote ...` lines, among them `wrote docs/figures/researcher.svg (37095 bytes)`. `exit 0`. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22636 bytes)`. `exit 0`. `git status --short` printed:
```
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/researcher.svg
 M docs/glossary.md
 M skills/academic/researcher/SKILL.md
 M skills/academic/researcher/references/compliance_checkpoint_protocol.md
 M skills/ordo/ordo-init/SKILL.md
 M skills/ordo/ordo-init/templates/plan-terms.md
?? .scratch/13-researcher/agents/reviews/3-report.md
?? skills/academic/researcher/references/checkpoints.md
?? skills/academic/researcher/references/integrity_check.md
?? skills/academic/researcher/references/novelty_page.md
```
   Two of these paths are outside "Paths this step writes": the two `ordo-init` paths.
3. Description counts: `1020 skills/academic/researcher/SKILL.md` and `1011 skills/ordo/ordo-init/SKILL.md`. Every other skill printed 1023 or less.
4. The greps of Cases:
   - `python3 -c 'import yaml; ...'` printed `researcher 1020 {'version': '1.0.0'}`.
   - `grep -n '^## '` printed `12:## Quick start`, `24:## Use instead`, `41:## What it reads`, `63:## Steps`, `305:## Stops`, `351:## Anti-patterns`, `370:## Rules`.
   - `grep -n '/grill\|Agent tool'` printed `39:| A design decision of a roadmap entry to settle before its plan opens | `/grill` |` and `374:- The agents a run of `integrity` or `manuscript` starts are the integrity agent and the compliance agent, each a fresh agent started through the Agent tool for each integrity check.`
   - `grep -n 'in both modes'` printed nothing. `exit 1`.
   - `grep -rn '"The integrity check\|"Checkpoints' skills/academic/researcher` printed `references/checkpoints.md:3` and `references/checkpoints.md:5`.
   - `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/researcher.svg`.
   - `grep -n 'novelty' README.md` printed line 34 only.
   - `grep -n 'round, of\|verdict, of' docs/glossary.md` printed lines 111, 168, 169, 173 and 174.
5. Further runs:
   - `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. `exit 0`.
   - `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
   - `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
   - `diff` of the base sections (`git show fba2c70:skills/academic/researcher/SKILL.md`, lines 201-247 and 248-274) against the two new pages. The only differences are the heading level (`##` to `#`), the added opening paragraph and the trailing blank line.
   - `python3 -c 'import sys; print(sys.argv[1:])' 'the author'\''s method' '/tmp/my project/notes'` printed `["the author's method", '/tmp/my project/notes']`.

## Verdicts

Items:

1. `SKILL.md` gains the two modes: violated. See Spec 2, Standards 1, Standards 2 and Behaviour 1. The frontmatter version, the title, Quick start, Use instead, the Steps routing, the Stops count (nine refusals, counted) and "What it reads" otherwise hold.
2. `novelty`: holds. Two weaknesses are under Behaviour 2 and Standards 6.
3. `idea`: violated. See Spec 3.
4. `references/novelty_page.md`: holds. The example says it is made up. See Behaviour 4.
5. `docs/glossary.md`: holds. Both entries are under "Ordo's own terms" beside the referee and blind-comparison entries. The plan-terms entry is changed and stays in sync, which needed the `ordo-init` paths (Spec 1).
6. The two moved pages: holds. My `diff` shows they are word for word apart from the heading level and the opening paragraph. Every place that named the sections now names the page.
7. `README.md`: holds. Line 88 is unchanged. See Standards 5.
8. The figure: holds. The note and the head comment are changed. The aria-label is unchanged apart from the size, compared after dropping viewBox, width and height. No other figure changed.
9. The report's Deviations section: holds. It names line 10 of `compliance_checkpoint_protocol.md` and every change to the landed text.

Cases:

- Frontmatter: met.
- `##` headings: met.
- Quick start, seven lines: met (lines 15-21, novelty first).
- `/researcher novelty "<idea>"` followed through the Steps: met. The path is Steps 1, then 6, then novelty items 1-7, with Rules line 375 (no agent).
- An idea with a single quote: met. The Rules bullet (line 394) gives the `'\''` form, and `lookup.py search` takes exactly one positional argument (`expect_arguments(positional, 1, "search", "<query>")`, line 2272). The idea itself never reaches `search`, only key terms do (novelty item 2).
- A path with a space: met. Every command form in the new items is single-quoted.
- A work `resolve` does not confirm: met (novelty item 4).
- A second run on the same day: met (novelty item 6).
- "is my idea that X new?": met (Steps 1, line 77).
- `idea` with no README: met.
- `idea` started again: partial. See Spec 3.
- A reopening: met (idea items 2 and 10).
- A claim found `done`: met (idea item 8).
- The `/grill` and Agent-tool grep: met.
- The goal and ADR 0054 sentences: met. The report maps each one to a step, and I checked each mapping by reading.
- `integrity` and `manuscript` run as before: partial. See Behaviour 1.
- `in both modes`: met.
- The section-name grep: met. The hit at `checkpoints.md:5` is the moved text, and line 3 says what it names.
- `gen_figures.py`: met.
- `gen_academic_pipeline.py`: met.
- `grep novelty README.md`: met.
- The glossary grep: met.

## Spec

1. **Two paths outside the brief's path list.**
   - Place: `skills/ordo/ordo-init/templates/plan-terms.md` line 106 and `skills/ordo/ordo-init/SKILL.md` line 5.
   - Hunk: `-  version: "5.0.0"` / `+  version: "5.0.1"`, and the changed "round, of an interview" entry.
   - What is wrong: item 5 asks that this entry be made true. The entry sits in the plan-terms block, which `sync_rules.py --only glossary` (on the plan's verify list) compares with the template, so item 5 cannot be met inside the listed paths. The builder raises this as judgment call 1.
   - The version bump rests on `docs/dev/skill-layout.md` line 24. Whether this plan already raised `ordo-init` is under "Declined to judge".
   - Failure scenario: if the orchestrator lands only the listed paths, the glossary check on main goes red.
2. **The description drops the landed modes' trigger phrases and what `integrity` leaves.**
   - Place: `SKILL.md` line 3.
   - Hunk: the base `Triggers on: /researcher integrity, /researcher manuscript, check the integrity of my manuscript, verify the references and claims of a finished draft, ethics check of a paper, final integrity check, academic pipeline, full paper workflow, ...` becomes `Triggers on: a novelty check of an idea, ..., check the integrity of my manuscript, ethics check of a paper, academic pipeline, take my draft through review and revision.`
   - What is wrong: item 1 asks for the new phrases "beside those of the landed modes", and for a description of what the four modes "do and leave behind". Five landed phrases are gone: `/researcher integrity`, `/researcher manuscript`, `verify the references and claims of a finished draft`, `final integrity check` and `full paper workflow`. The description also no longer says what an `integrity` run leaves (the run folder with its records) or that it has a pre-review depth.
   - Failure scenario: a user who types "run the final integrity check on my draft" or "full paper workflow" no longer matches a listed phrase, and the model may not pick `researcher`. The brief left no room for this trade.
3. **The continuation reads a progress file other than the newest.**
   - Place: `SKILL.md` line 157 (idea item 1), line 161 (idea item 2) and line 61 ("What it reads" 19).
   - Hunks: item 1, `the newest progress file of "What it reads" 19 that holds a choice still open`; item 2, `with no progress file that holds a choice still open`; item 19, `of which the newest is read for the choices it holds open`.
   - What is wrong: the brief says an interview continues when the project's "newest progress file has open choices". Item 1 and item 2 instead take the newest file among those with an open choice, which contradicts "What it reads" 19.
   - Failure scenario: `notes/idea-2026-11-01.md` was left with open choices and `notes/idea-2026-11-10.md` ended with the README written. A call on 2026-11-20 resumes the abandoned 11-01 interview instead of the reopening of item 2. Item 2's condition also blocks every later reopening for as long as the stale file exists.

## Proof

1. The builder's quote and space claims rest on `argv_probe.py`, a scratch script run on a copy of `lookup.py`. I did not rerun it, because it needs a file written. My `python3 -c 'import sys; print(sys.argv[1:])'` run and the one-positional parse of `run_search` reproduce the shell side of the claim.
2. The builder quotes `git log --oneline 93cd553..HEAD -- skills/ordo/ordo-init prints nothing` as the reason for the 5.0.1 bump. I cannot run it under my brief, and the version decision rests on it (see Declined to judge).

Every other output the report quotes was reproduced:
- the description counts;
- the headings;
- the sync and the two test lines;
- the figure status;
- the two section diffs;
- the README grep;
- the glossary grep;
- the svg aria-label.

## Standards

1. **The title paragraph's last sentence is false for two modes.**
   - Place: `SKILL.md` line 10.
   - Hunk: `A run leaves behind the run's state, each integrity record and each compliance report, each a file of its own in its run folder (Rules).`
   - What is wrong: after the two new sentences, "A run" reads as any run. A `novelty` or `idea` run has no run folder (Steps intro, line 65).
   - Failure scenario: a reader looks for `researcher-runs/` after a novelty check and finds none.
2. **Rules bullets that are false for `novelty` and `idea`.**
   - Place: `SKILL.md` lines 390 and 391.
   - Hunks: `- A run given the same input follows the same stages and checks in every session.` and `- Every artifact of a run carries its version label in material-passport.yaml, ...`
   - What is wrong: the brief asks that the Rules be true for four modes. A novelty page or a progress file is an artifact of a run and has no `material-passport.yaml`, and `novelty` has no stages. Lines 372-376 are scoped to the modes; these two are not.
   - Failure scenario: a session running `idea` writes a `material-passport.yaml` into `notes/`, or treats the missing passport as a breach.
3. **"Result" has two meanings in `idea`.**
   - Place: `SKILL.md` lines 162-164 and 196, and the Stops row "A reopening" (line 336).
   - Hunks: `the result it gives is the result that changes the research questions`, `each with the result beside it`, and the choice `the result that would show it works` (line 155).
   - What is wrong: the same word names a choice of the idea and the finding of `research` that reopens it. ADR 0054 calls the second "the finding". The builder avoided "finding" because of its glossary sense, but no other single word was chosen.
   - Failure scenario: at a reopening, a session reads "the choices that result bears on" as the choice "the result that would show it works", and reopens only that choice.
4. **The ledger's deviations file names sections that no longer exist.**
   - Place: `.scratch/13-researcher/deviations.md`, lines 120-125, 134, 138, 141, 146 and 150.
   - Hunk: `| Adaptive Checkpoint System | `## Checkpoints` |` and `| Integrity Review Protocol | `## The integrity check`; "What it reads" 11 |`.
   - What is wrong: these rows map the source's sections to `## Checkpoints` and `## The integrity check` of `SKILL.md`, which are now `references/checkpoints.md` and `references/integrity_check.md`. The standing demand says every difference of the copy is listed in `deviations.md`. The file is in no item and in no path of the brief.
   - Failure scenario: the gate reader of step 6, who reads step 1's list of differences, is pointed at sections that are gone.
5. **The README row can be read as calling all four modes a copy.**
   - Place: `README.md` line 34.
   - Hunk: `Checks whether a research idea is new, takes a rough sketch to research questions and claims, checks the integrity ..., or takes one through the stages ..., with academic-pipeline's stages and the pages of its agents copied.`
   - What is wrong: the trailing qualifier now follows four verbs, while `NOTICE.md` and ADR 0052 say only `integrity` and `manuscript` are adapted.
   - Failure scenario: a reader takes `novelty` and `idea` for adapted text under CC BY-NC 4.0.
6. **A cleanup no item carries out.**
   - Place: `SKILL.md` line 130 (novelty item 3).
   - Hunk: `` `<folder>` a temporary folder made with `mktemp -d` and removed at the end of the run``.
   - What is wrong: no item of `### novelty` or `### idea` removes the folder, and novelty item 7 (the end) is skipped inside `idea`. That is a rule with no step that carries it out.
   - Failure scenario: the temporary folders of every round of an `idea` interview are left behind.

## Behaviour

1. **An `integrity` run no longer reaches the checkpoint rules.**
   - Place: `SKILL.md`, `### integrity` lines 205-213, and "What it reads" 13 (line 55): `The pages the session reads at the step that names them: ..., references/integrity_check.md and references/checkpoints.md`.
   - What is wrong: before this step, "Checkpoints" was a section of `SKILL.md` that every run read. Now `references/checkpoints.md` is named only by manuscript item 1 (line 219) and the Stops row "The checkpoint after Stage 2" (line 315). Nothing an `integrity` run reads names it: not `### integrity`, not `references/integrity_check.md`, and not the Stops rows it reaches ("A FAIL of an integrity check", "The compliance block" and the others). Yet `checkpoints.md` line 3 says "`integrity` and `manuscript` hold one at each stop".
   - Failure scenario: an `integrity` run that hits a FAIL shows the stop without the checkpoint rules. The checkpoint is not written to `state.json` with its type, the simplified dashboard and round-trip count are missing, and the rule that a MANDATORY checkpoint waits for an explicit answer is not read. The landed mode does not run exactly as before, and the report says "Same run".
2. **Failed searches can read as a `new` verdict.**
   - Place: `SKILL.md` line 126 (novelty item 2), `Write down each query with where it ran and how many records it gave`, and line 140, the rule for `new`.
   - What is wrong: `lookup.py` leaves out an index that fails and prints the reason (ADR 0017). Novelty records only a count per query, and has no rule or stop for a search on which indexes were left out.
   - Failure scenario: a machine with no network gives 0 records on every `lookup.py search`. Every claim gets `new` with "no closer work was found by these searches", and the page's Records column shows 0 with no sign that the searches did not run. Before this step there was no novelty mode, so this is new behaviour.
3. **The novelty page may never reach `paper`'s literature search.**
   - Place: `SKILL.md` line 149 (novelty item 7), and `paper`'s `SKILL.md` lines 360-361.
   - Hunks: `the user names it at paper's intake among the existing literature, the Existing Materials row of config.md, as a starting point`, and in `paper`: `It is given config.md and the sources given: the refs.bib ... and the .bib the Existing Materials row names.`
   - What is wrong: the literature strategist is given only the `.bib` that row names. Its page `agents/literature_strategist_agent.md` line 21 reads only `config.md` and the sources the mode's item gives. The novelty page is a `.md` in the project's `notes/` and has no `.bib`.
   - Failure scenario: the user follows the final message. Phase 1 runs without ever reading the page's confirmed works, and the goal's "the page is given to `paper` as a starting point" holds only as a path written in a row. This is the brief's own premise, so it is raised for the orchestrator.
4. **The example page gives `new` with a likely match left unnamed.**
   - Place: `references/novelty_page.md` lines 85 and 89, and the rule at line 51.
   - Hunks: `Verdict: `new`: no closer work was found by these searches.` and `- "Head pruning for speech models" | the web search for C2 | `resolve` printed "not found" ...`
   - What is wrong: the example gives C2 the verdict `new` while a work whose title matches C2 was found and not confirmed, and the reason does not name it. The form has no rule that a `new` reason names the unconfirmed candidates of that claim. Line 85 also writes `` `new`: `` where the form (line 23) has a full stop.
   - Failure scenario: a reader takes C2 as new and does not check the unconfirmed paper, which may be the prior work.
5. **The claim options are put to the user before any novelty check.** This is a judgment.
   - Place: `SKILL.md` lines 174-187 (idea items 5 and 7).
   - What is wrong: the options of the claim choice are first put to the user in a round, and `novelty` runs only after the answers (item 7).
   - Failure scenario: the user settles on a claim that a confirmed work already does, and needs a further round (item 8). This is consistent with the literal text of ADR 0054, so it is raised only as a judgment.

## Declined to judge

- Whether `ordo-init`'s version was already raised in this plan, which decides whether 5.0.1 is correct under `docs/dev/skill-layout.md` line 24. It needs `git log --oneline <plan start>..HEAD -- skills/ordo/ordo-init`, which my brief does not allow.
- The builder's base-tree outputs for the `/grill` grep (lines 205, 212 and 328) and for the Rules bullet's base line (338). I did not rerun them on `git show fba2c70:...`, and no decision rests on them.
- The builder's `argv_probe.py` run, which needs a file written (see Proof 1).
- End-to-end runs of `/researcher novelty`, `idea`, `integrity` and `manuscript`, which need the skill invoked. Every case was judged by reading.
- Whether `merged_lines` of `lookup.py` prints a "left out" line in `search` output. I read `run_search` only, and Behaviour 2 holds either way.
- I wrote temporary comparison files (the base `SKILL.md`, the extracted sections and the svg head lines) to the session scratchpad, outside the repository, to run the `diff`s above. No file in the repository or the ledger was written, apart from the figure files that the brief's own check 2 rewrites, which `git status` shows as unchanged.

Usage: a779a2f818f5c41bd, claude-opus-5-5, 191071 tokens, 45 tool uses, 536 s
