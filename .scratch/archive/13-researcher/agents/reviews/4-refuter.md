# Refutation of step 4

## Verification lines

1. Character-set check (the brief's perl command), run over the 17 changed or new files of `git status --short` plus the report. Printed nothing. Then `echo "exit $?"` printed:
```
exit 0
```
2. Figure generators. Before and after the runs, `find docs/figures -name '*.svg' -exec md5 -q {} + | md5` printed `174123e26e4fb14e80a49e4d7639e676` both times, so every committed SVG was reproduced byte for byte.
```
wrote docs/figures/pipeline.svg (23294 bytes)
wrote docs/figures/plan-loop.svg (21454 bytes)
wrote docs/figures/grill.svg (7455 bytes)
wrote docs/figures/writing.svg (5191 bytes)
wrote docs/figures/paper-review-panel.svg (12433 bytes)
wrote docs/figures/referee.svg (20328 bytes)
wrote docs/figures/submit.svg (13466 bytes)
wrote docs/figures/grant.svg (17219 bytes)
wrote docs/figures/code-comments.svg (5921 bytes)
wrote docs/figures/codebase-design.svg (11420 bytes)
wrote docs/figures/researcher.svg (37095 bytes)
wrote docs/figures/researcher-research.svg (30798 bytes)
wrote docs/figures/paper/full.svg (44818 bytes)
... (the 14 paper figures)
wrote docs/figures/paper/run-folder.svg (21112 bytes)
exit 0
wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)
exit 0
```
`git status --short docs/figures`:
```
 M docs/figures/academic-pipeline/academic-pipeline.svg
 M docs/figures/academic-pipeline/gen_academic_pipeline.py
 M docs/figures/gen_figures.py
?? docs/figures/researcher-research.svg
```
`git status --short` lists only paths of "Paths this step writes". `plan-terms.md` is unchanged.

3. Description counts: `1022 skills/academic/researcher/SKILL.md`, `994 skills/academic/paper/SKILL.md`. Every skill is at 1024 or below.
4. `ok: the plan-terms block equals the template`, exit 0.
5. Greps of the cases:
   - The frontmatter case printed `researcher 1022 {'version': '1.0.0'}`.
   - The Quick start block is 11 lines.
   - The negative-result grep printed `SKILL.md:591:- A result that does not beat the baseline is guidance for the next method, recorded as a dead end: no text of ...` and `SKILL.md:597:- No correction and no record asks that a recorded null result be written into the manuscript.`, exit 0. Both hits forbid writing one up.
6. List items and sentence length were checked by reading (see Standards).

## Verdicts, items

1. **Violated.**
   - Sections, Quick start, Use instead, What it reads, Steps routing, the Stops count ("eleven refusals", 11 rows counted) and the Rules agents bullet are present.
   - Breaks of one rule per bullet are Standards 1.
   - The narrowed trigger phrase is Spec 6.
2. **Holds.** `references/research_stages.md` has one section per stage with the four parts. Gaps in the figure are Spec 5.
3. **Holds.** Items 4 and 5 and the stops "Frame's questions" and "The dataset".
4. **Holds.** Items 6 to 12, `research_brief.md`, the two role pages and `slurm.md` are present. Defects in the SLURM mechanics are Behaviour 1 and 2.
5. **Violated.** The automatic stop condition differs from ruling D8 and from the brief (Spec 1). There is also no route for a result that beats the baseline but falls short of the bar set (Behaviour 4).
6. **Holds.** The four Rules bullets each name their items.
7. **Violated.** A new session after a stop inside Frame cannot resume (Spec 4).
8. **Violated.** The copy command named cannot leave out `data/` (Behaviour 3).
9. **Holds.** "research adopt" items 1 to 4 and the refusal "Nothing to adopt".
10. **Violated.** `full` writes `## Next` before `research` reads the folder, so `research` stops at "A project underway" (Spec 3).
11. **Holds.** Twelve entries added. The `setting` entry disagrees with item 15 (Standards 3).
12. **Violated.**
    - The figure does not draw every loop of the stages and draws one arrow to the wrong stage (Spec 5).
    - The `paper` argument is not recorded in ADR 0043 (Spec 2).
    - The README, `building.md`, `scripts.md`, the roadmap alt text and the academic-pipeline figure hold.
13. **Holds.** No copied page changed, and the changes to the landed text are listed.

## Verdicts, cases

- Frontmatter: met.
- Quick start: met.
- `research` on an empty folder: met.
- Manual setting, result below the baseline: met.
- Automatic setting with a count of 3: partial (Spec 1). The text stops only when a result beats the baseline and also reaches what was set.
- Dataset cause and question cause: met.
- A job submitted: met.
- A reviewer finds a leak: met.
- A new session mid-Experiments: met.
- `run_all.sh` with an input missing: met.
- Consolidate: partial (Behaviour 3).
- Adopt, Baseline called done with a partial result: met.
- Adopt with no README: met.
- A further paper: met.
- `full` for a review paper: met. With a partial result after `research`: partial (Spec 3), since the `research` part of `full` stops at "A project underway".
- Goal sentences, ADR 0053, ADR 0054 and the four rules: met. Each has a step.
- The negative-result grep: met.
- `integrity`, `manuscript`, `novelty` and `idea` as before: met, with the `## Papers` write noted in Behaviour 6.
- Figure scripts and status: met.
- `the author's project`: partial (Behaviour 2, the `#SBATCH` lines).
- Small local test on a cluster: met (see Behaviour 1).
- Third review still finds a leak: met.
- Implementation cause and method cause: met.
- "A project underway" and "Nothing to adopt": met.
- Two dead ends in the record: met.
- `full` with a result that does not beat the baseline: partial (Spec 3).
- `full` run again: met.
- `--manuscript second`: met.
- Glossary sync: met.

## Spec

1. **Ruling D8 and brief item 5: the automatic stop condition was changed.**
   - Place: `SKILL.md:307`, "Automatic: go on by itself with each proposal ... until a result beats the baseline and reaches what was set, which goes on to Consolidate, or until the count of methods is reached".
   - The brief and D8 say "stops when the baseline is beaten or the count is reached". The diff adds "and reaches what was set". The manual stop (Stops row "A result that does not beat the baseline", When cell "or does not reach what was set") is widened the same way, so the stop's name becomes false for those results.
   - Judgment call 6 gives the reason for the diagnosis only, not for the change to the stop condition.
   - Failure scenario: automatic setting, count 5. Method 1 beats the baseline but is under the bar. The run spends four more methods' cluster time where D8 stops. The report's case line "Automatic, count 3 ... Met" states the old condition (Proof 1).
2. **ADR 0043 is not named and not amended.**
   - Place: `skills/academic/paper/SKILL.md`, "What it reads" 2, "For full, plan and outline-only, the optional `--manuscript <name>` ...".
   - ADR 0043 Decision 3 says: "Every other choice of `paper` that academic-paper's text does not have is removed, except the deviations below". `--manuscript` is such a choice, it is not in that list, and no ADR records it. Change-standard rule 5 asks for the ADR that owns the decision.
   - Failure scenario: a reviewer of `paper`'s deviations reads ADR 0043 as complete and removes the argument, which breaks `/researcher manuscript --manuscript`.
3. **`full` cannot run `research` on the project `idea` just made.**
   - Place: `SKILL.md:370`, "Write the modes, in order, with the mode that stands, into `## Next`". This runs before `research` item 1 (`SKILL.md:234`), which counts a folder as new only for "a `README.md` whose only `##` section is `## Research questions and claims`". Otherwise `SKILL.md:236` says "Any other folder is the stop 'A project underway'".
   - Failure scenario: `/researcher full <new folder>` runs `idea`, writes `## Next`, then `research` stops at "A project underway" and offers `research adopt`. Judgment call 1 was meant to remove exactly this stop for `full`.
   - The text is also ambiguous. `SKILL.md:369` says "run `research adopt` on a project `research` did not start", which a fresh project after `idea` is. Read that way, `full` adopts instead of making the layout.
   - A further problem: `research` item 3 (`SKILL.md:245`) writes every section "each holding `None yet.`", which would overwrite the plan of modes in `## Next`.
4. **A new session cannot resume a run that stopped inside Frame.**
   - Place: `SKILL.md:245`. Item 3 writes `## The stage and campaign that stand` as "None yet." Only item 5's Done names Build.
   - Failure scenario: the session ends at the stop "Frame's questions" or "The dataset". A new `/researcher research <folder>` finds a README with sections beyond `## Research questions and claims` and no stage named, and gives the stop "A project underway", which offers adopt for a project `research` started.
   - This breaks the fourth rule (resume without the conversation) and brief item 7.
5. **The figure misses loops of the stages and misdraws one.**
   - Places: `research_stages.md:14` (Frame to itself), `:21` (Build to Frame, "when the code shows that the dataset does not fit the limits") and `:28` (Baseline to Frame, "when the baseline cannot run inside the limits"). None is drawn in `researcher_research()`.
   - `gen_figures.py:2140`, `Edge("CO", "C", "a difference: back to the stage that made it, once", "back")`, draws the arrow to Compare. The text sends the work to the stage that made the number (Baseline or Experiments). The alt text repeats "to the stage that made it" while the arrow points at Compare.
   - Brief item 12 says "every loop of the stages is drawn as a back or return arrow".
   - Failure scenario: a reader of the README takes Compare as the target of a failed reproduction and believes the Frame loops do not exist.
6. **A trigger phrase was dropped, not merged.**
   - Place: the description. "sharpen my research idea" is folded into "from a sketch to a research question" (judgment call 12).
   - The two do not say the same thing: one is an idea already formed, the other a sketch. The brief allows merging only phrases that say the same thing.
   - Failure scenario: "sharpen my research idea" no longer matches the skill's triggers. The other three merges are near enough in meaning.

Judgment calls 1 to 18:
- **Call 1** carries out the brief. The brief contradicts itself, and the report gives that under "Wrong or impossible" 1. The call is defeated in practice by Spec 3 and Spec 4.
- **Calls 2, 3, 4, 5, 7, 8, 9, 10, 13, 14, 15, 16, 17 and 18** carry out the brief: each fills a count, a name or a sentence that the layout or rule 14 requires, and none overrides a ruling.
- **Call 6** takes a decision ruling D8 had settled (Spec 1).
- **Call 11** carries out the brief, with Behaviour 1.
- **Call 12** narrows one trigger phrase (Spec 6).

## Proof

1. The report's case line "Automatic, count 3: ... until a result beats the baseline and reaches what was set ... Met" is marked met against a case whose expected result is "stopping when the baseline is beaten or the count is reached". The verdict rests on the changed condition (Spec 1).
2. Every other command the report quotes reproduced when rerun:
   - Description counts 1022 and 994.
   - SVG sizes 30798 and 22164, and the base 22636 (`git show 0e20d25:... | wc -c`).
   - Quick start 11 lines.
   - Headings at lines 229, 336 and 358.
   - Grep hits at lines 591 and 597.
   - Eight base hits of `<project folder>/manuscript`.
   - numstat +231 -27 and +15 -15.

## Standards

1. **One rule per bullet** (`docs/dev/skill-layout.md`, "Lists and tables"), and the report's claim "Every new list item holds one rule" is false.
   - `SKILL.md:585`: "The agents a run of `research` starts are a builder and a reviewer ..., and the mode uses no worktree, no landing and no ledger". These are two requirements.
   - `SKILL.md:281`: "On a cluster, run each job from its script in `code/hpc/`, submitted with `sbatch` from that folder, and compute nothing on the login node". These are two requirements.
   - `SKILL.md:591`, the bullet on a result that does not beat the baseline, joins the dead-end rule and the rule against writing it up.
2. **Sentence length** (prose standard E). Most of the 52 sentences over 40 words need their length:
   - the description, under the 1,024-character cap;
   - the alt text and README line 78, in the README's existing form;
   - the title paragraph, under the brief's one-to-three-sentence cap;
   - "What it reads" items and glossary entries;
   - bullets whose qualifier must stay with the rule.

   These are breaks:
   - `SKILL.md:234` (54 words): the definition of a new project and its routing, which can be two bullets.
   - `SKILL.md:316` (54 words): the purpose clause "so that it reads the raw inputs where they stand, copies none of them and stays inside Frame's storage limit" restates the reason.
   - `research_stages.md:41` (61 words): three conditions of the Compare criterion in one sentence, which reads better as a list.
3. **A glossary entry contradicts the skill** (change-standard rule 19). `docs/glossary.md:180`, `setting, of research`, says "Under the manual setting the run stops after each result that does not beat the baseline, and under the automatic setting it goes on by itself for the count of methods". `SKILL.md:307` and the Stops row stop or continue on "reaches what was set" too.
4. **An example not marked as made up.** `research_stages.md:32`, "such as one method trained on a central copy of the data and then the same task trained by federated learning", is not marked as made up, which the brief's Conventions ask for. It is not private.

There is no non-ASCII and no history in the changed text. No sentence elsewhere in `docs/`, `skills/` or `README.md` is made false by the changed names: a grep for "not built yet" and "entry 13)" outside the ADRs finds only roadmap lines 74 and 83, which this diff did not make false.

## Behaviour

1. **`sbatch --wait` against the runner's command cap.**
   - Places: `slurm.md:29`, the builder's page item 4 and the reviewer's page item 3.
   - The builder and the reviewer run `sbatch --wait` as a foreground command, which waits through the queue as well as the run. The runner caps a foreground command at 10 minutes.
   - Failure scenario: a test job that waits 30 minutes in the queue is cut off. The agent has no result, and may submit again.
   - "with the shortest time the cluster's facts allow" sets `--time` to the cluster's minimum, not to what the test needs (up to 10 minutes by `research_brief.md`). The job can be killed by its own limit.
2. **`#SBATCH` lines carry the project path unquoted.**
   - Place: `slurm.md:15`, `#SBATCH --output=<project folder>/logs/%x-%j.out`.
   - Failure scenario: the case's folder `the author's project` puts a space and a quote into the directive line. As I know sbatch, it splits `#SBATCH` lines on whitespace, so the output path is cut short. A `%` in the path is read as a pattern.
   - SLURM does not make a missing `logs/`. An adopted project without one ("made only when a stage writes into it") loses its job output.
   - A path relative to `code/hpc`, the submit folder, avoids all three problems.
3. **The copy command cannot leave out `data/`.**
   - Place: `SKILL.md:316`, "Make the clean copy with `cp -R` of `code/` without `data/`, `results/`, `figures/` and `attic/`".
   - `cp -R` has no exclude option.
   - Failure scenario: the session runs `cp -R code <copy>` and then removes `data/`. The raw inputs are copied onto scratch first, which can exceed the storage limit the item exists to keep.
4. **No route to Consolidate for a result that beats the baseline but is under the bar.**
   - Places: the Stops rows "A result that does not beat the baseline" and "The count of methods reached".
   - The resume options are take the proposal, another method, or change the setting or the count. None consolidates a result that beats the baseline under the bar, and the Compare criterion (`research_stages.md:41`) requires the bar to be reached.
   - Inside `full`, item 4 ends at the stop and item 5 can send such a result to `manuscript` on the user's word. That paper's numbers then had no reproduction run (ruling D12), and the record of the experiments is missing.
5. **Two papers share run folders, and nothing tells their runs apart.**
   - Places: researcher "What it reads" 15 (`SKILL.md:62`, "for the same manuscript") and Steps 3. `state.json` records no manuscript folder, and `researcher-runs/` is shared between papers.
   - Failure scenario: `/researcher manuscript <pf> --manuscript second`, while the first paper's run is paused, is offered "An unfinished run" of the other paper.
   - `paper` "What it reads" 6 likewise offers "the latest plan run" in the shared `<project folder>/paper-runs/`, whichever paper it planned.
6. **A user-visible change without its before and after.** `manuscript` item 4 now writes into the project's `README.md` (`## Papers`) when that section exists, including a README the user wrote. The report gives this only inside a case line, not under "Visible changes" with a before and after.

## Declined to judge

- How sbatch parses `#SBATCH` lines (Behaviour 2) is from my knowledge of SLURM. No SLURM command was run.
- The four SLURM sentences marked not verified are correct as I know SLURM:
  - `sbatch --wait` returns when the job ends, with its exit status.
  - `sbatch` prints `Submitted batch job <id>`.
  - `squeue --jobs` and `sacct --jobs` take a comma-separated list of ids.
  - `--dependency=afterok`, `%x`, `%j` and `$SLURM_ARRAY_TASK_ID` are correct.
  - No SLURM command was run.
- The report's count of 52 sentences over 40 words: its script is not quoted, and I did not rerun it. No decision rests on the count.
- That `paper`'s version was raised once in this plan would need `git log --oneline 93cd553..HEAD -- skills/academic/paper/SKILL.md`.
- The builder's first-run results on the unchanged tree for the figure scripts' status would need a checkout of the base, which I did not make.
- Whether a real run of the modes works is outside the gate by the user's ruling.

Usage: a6e39bbd6d6f0b790, claude-opus-5-5, 251507 tokens, 53 tool uses, 584 s

## Repair round 1, refuted

### Verification lines

Run from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The brief's checks 2 and 3 run the two figure generators, so they rewrote the SVGs. `git status --short` afterwards shows no change beyond the paths listed under 2.

1. The character-set check (perl command of the brief) over every path of `git status --short` that is not under `.scratch/`. It printed nothing, then:
```
exit 0
```
2. `python3 docs/figures/gen_figures.py | tail -3`:
```
wrote docs/figures/paper/response-letter.svg (5981 bytes)
wrote docs/figures/paper/lifecycle.svg (21064 bytes)
wrote docs/figures/paper/run-folder.svg (21112 bytes)
exit 0
```
(That `exit 0` is the exit of `tail`.) `wc -c docs/figures/researcher-research.svg` prints `40510`. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`:
```
wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)
exit 0
```
`git status --short`:
```
 M README.md
 M docs/adr/0043-paper-s-modes-are-academic-paper-s-copied-with-the-deviations-the-goal-and-the-rulings-keep.md
 M docs/dev/building.md
 M docs/dev/scripts.md
 M docs/figures/academic-pipeline/academic-pipeline.svg
 M docs/figures/academic-pipeline/gen_academic_pipeline.py
 M docs/figures/gen_figures.py
 M docs/glossary.md
 M docs/roadmap.md
 M skills/academic/paper/SKILL.md
 M skills/academic/researcher/SKILL.md
?? .scratch/13-researcher/agents/briefs/4-round-1.md
?? .scratch/13-researcher/agents/reviews/4-report.md
?? docs/figures/researcher-research.svg
?? skills/academic/researcher/agents/research_builder_agent.md
?? skills/academic/researcher/agents/research_reviewer_agent.md
?? skills/academic/researcher/references/project_layout.md
?? skills/academic/researcher/references/research_brief.md
?? skills/academic/researcher/references/research_stages.md
?? skills/academic/researcher/references/slurm.md
```
All are paths of "Paths this step writes", plus ADR 0043 and the round's brief.
3. The description counts for `researcher` and `paper`:
```
994 skills/academic/paper/SKILL.md
1021 skills/academic/researcher/SKILL.md
```
4. `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary`:
```
ok: the plan-terms block equals the template
```
5. The frontmatter case printed `researcher 1021 {'version': '1.0.0'}`. The negative/null grep printed:
```
skills/academic/researcher/SKILL.md:629:- No text of `research` or `full`, and nothing either sends to `manuscript`, frames a result that does not beat the baseline as a finding to publish, and no negative or null result is written up.
skills/academic/researcher/SKILL.md:635:- No correction and no record asks that a recorded null result be written into the manuscript.
```
Both hits forbid writing one up.

Commands the round's section quotes, rerun: the 1021 and 994 counts, the 40510 and 22164 byte sizes and the `researcher 1021` line reproduce. The `rsync` test (a scratch tree, `code/core/data/loader.py` plus top-level `data/`, `attic/`, `run_all.sh`) with the anchored patterns printed `c c/core c/core/data c/core/data/loader.py c/hpc c/run_all.sh`: the four top folders are left out and `core/data` is kept, as the report says. I did not rerun the report's unanchored case. No count the report quotes fails to reproduce.

### Rulings of the round

1. Carried out. `SKILL.md` "research" item 15, bullets "Manual:" and "Automatic:" (stop trying methods "when a result beats the baseline ... or when the count of methods is reached"). Stops rows "A result that does not beat the baseline", the new "A result short of what was set, in `research`" and "The count of methods reached" (no result beats the baseline). `research_stages.md` Compare criterion (list of five). The glossary `setting, of research` and `completion criterion, of a stage`. Figure stop `MS`, edges `C->MS`, `MS->CO`, node `K`. Report case line 72 is corrected. One inconsistency remains, see Spec 1.
2. Carried out. ADR 0043 Decision 3, last deviation bullet, with no date. It also records the intake row and the plan-run filter, which ruling 13 adds (see Standards 2).
3. Carried out. `SKILL.md` "research" item 1 (three bullets), item 3 (`## Next` kept last), "full" item 3 (bullets "Run `research` on a project that holds only what `idea`, `novelty` and `full` write" and "Run `research adopt` on a project underway that `research` did not start").
4. Carried out. "research" item 3 (writes `Frame` as the stage that stands, and its Done checks it) and item 2 ("4 for Frame, or 5 when the README holds each answer of item 4").
5. Carried out. `gen_figures.py` edges FD->FQ, B->FQ, BA->FQ, BA->B, EX->B, EX->FQ, CO->BA, CO->EX. The Consolidate arrow to Compare is gone. `research_stages.md` Consolidate "To Baseline or to Experiments". Each drawn loop is in the text: R->B in Build, EX->EX and EX->B/FQ in Experiments, C->EX/B/FD/I in Compare, I->FQ in item 15, and BA->B/FQ in Baseline. The README line 90 alt text names each loop.
6. Carried out. "sharpen my research idea" is its own phrase, 1021 characters. The round also rewords three standing or brief-named phrases (see Spec 2).
7. Carried out. Rules bullets on the agents and on the dead end are split. Item 10's cluster bullet is split into "submitted with `sbatch` from that folder" and "compute nothing on the login node". Other splits are in "research" items 7, 8, 10, 12, 15, 16 and 18, "research adopt" item 3 and "full" items 3 to 6. I found no new bullet that still holds two rules.
8. Carried out. Item 1's first bullet is three bullets. Item 16's first bullet is the `rsync` bullet plus a `<copy>` bullet, with the restated reason dropped. The Compare criterion is a list.
9. Carried out. `research_stages.md` Experiments "A made-up example: ...".
10. Carried out. `slurm.md` "A small local test" (`--time` is the test's time, at most 10 minutes; a background `sbatch --wait`; `scancel` after 60 minutes pending). The builder page item 4, the reviewer page item 3 and `research_brief.md` "The small local test" say the same.
11. Carried out in the form `--output=../../logs/%x-%j.out`, with `mkdir -p '<project folder>/logs'` in `slurm.md` and in "research" item 10. It is wrong for the Consolidate clean copy, see Behaviour 1.
12. Carried out in a form that meets the ruling's purpose. The unanchored `--exclude 'data/'` of the ruling would also leave out `core/data/`. The anchored `/data/` form leaves out only the four top folders, which I reproduced. `rsync` is not named in "What it reads" because no other Steps command is named there, as the ruling asked.
13. Carried out in a form that meets the ruling's purpose, with a gap in the report (Standards 1). `researcher` writes `manuscript_folder` into `state.json` ("What it reads" 15, Steps 2 and 3). `paper` Steps 6 has the intake agent's prompt write the row `Manuscript Folder` into `config.md` for full, plan and outline-only, and "What it reads" 6 offers only a plan run of the same folder, with no row counted as `manuscript/`. `agents/intake_agent.md` stays a copied page and is not edited. Its Paper Configuration Record tables, which hold the settings, include the row `Operational Mode` that the new row follows, in both the full and the plan form. Leaving lit-review runs unfiltered is sound: a run has no manuscript folder and one review serves every paper of a project.
14. Carried out. The report's "Visible changes" has the `## Papers` write, with its before and after. It also has the `config.md` row.

### Verdicts, items

Verdicts are for the whole diff since the base.

1. Violated. Sections, Quick start, Use instead, What it reads, Steps routing, Stops and Rules are present. The round rewords standing trigger phrases (Spec 2).
2. Holds.
3. Holds.
4. Holds. Consolidate's clean-copy output path is Behaviour 1.
5. Holds. The setting now follows D8. Spec 1 is a residual inconsistency in the wording of the below-set rule.
6. Holds.
7. Holds. A stop inside Frame resumes at Frame.
8. Violated. The copy command is now right, but a reproduction job's output path is wrong inside the copy (Behaviour 1).
9. Holds.
10. Holds. `full` item 3 and `research` item 1 now agree.
11. Holds. Both setting entries now match the skill.
12. Holds. The figure draws every loop of the text (ruling 5). The alt text matches. ADR 0043 records `--manuscript`.
13. Violated. The report's "Deviations" does not list the round's changes to landed text (Standards 1).

### Verdicts, cases

All cases are met except the following.
- Consolidate: partial (Behaviour 1).
- `/researcher integrity <main.tex>`, `manuscript`, `novelty` and `idea` followed through the Steps: partial. The `manuscript` run's new `state.json` key and the narrower "An unfinished run" offer are a behaviour change the report does not state (Behaviour 2).
- `the author's project` reaching `mkdir`, `sbatch` and `run_all.sh`: met. No project path stands in a `#SBATCH` line now.
- The automatic case, count 3: met. It stops when the baseline is beaten or the count is reached.
- `full` for a review paper, with a partial result, and `full` with a result that does not beat the baseline: met. `research` item 1 no longer stops at "A project underway" after `idea`.
- A new session mid-Experiments, and a run stopped inside Frame: met.
- A further paper and `--manuscript second`: met.
- Frontmatter: met (1021).

### Spec

1. `research_stages.md`, the general bullets and the glossary entry `completion criterion, of a stage` contradict "research adopt" item 1.
   - Place: `research_stages.md`, general bullet "A result below what Frame set as good enough meets Compare's completion criterion only as that criterion gives it, and the adopt mode counts it as not done".
   - Place: `SKILL.md`, "research adopt" item 1, "A result that is partial, unfinished or below what Frame set as good enough counts as not done".
   - Compare's criterion is met by a below-set result that is named as below what was set and, in the manual setting, sent on by the user. The adopt text counts the same result as not done. The brief (item 9, ruling D30) asks adopt to count it as not done. The new criterion text lets Compare hold while adopt says it does not.
   - Failure scenario: `full` or `research adopt` runs on a project whose below-set result the user chose to consolidate. Adopt sends the work back to Compare or Experiments, against the user's stop answer.
2. Standing trigger phrases reworded by the round.
   - Place: the description. Before the round the triggers read "run the experiments of my project" (brief-named), "check the integrity of my manuscript" and "verify the references and claims of a finished draft". They are now "run my project's experiments", "check my manuscript's integrity" and "verify a finished draft's references and claims".
   - Ruling 6 asks for shorter wording "elsewhere, never by dropping a mode's phrase". The brief names the new trigger phrases and allows no change to a standing one beyond the merges it names.
   - Failure scenario: a user who types the standing phrase gets a different match than before.

### Proof

none

### Standards

1. The report's "Deviations" is stale after the round.
   - Place: `.scratch/13-researcher/agents/reviews/4-report.md`, "## Deviations", which has no bullet for the round's edits to landed text: "What it reads" 15 (now ends on `manuscript_folder`), Steps 2 (new bullet "Offer only a run of the same mode whose `manuscript_folder` ...") and Steps 3 (new bullet "Write `manuscript_folder` into `state.json`").
   - Brief item 13 asks the section to list each change to the landed text. The key `manuscript_folder` is also an addition to the structure `agents/state_tracker_agent.md` gives, a copied page, which the section does not say.
   - Failure scenario: a reader of "Deviations" takes the landed text and the copied page as unchanged on `state.json`.
2. The ADR 0043 bullet is longer than the ruling asked.
   - Place: ADR 0043, Decision 3, last bullet. It is three sentences: the argument, "With no such argument every run is as before. It is kept since ...", and the intake row and the plan-run filter.
   - Ruling 2 asked for the argument and its folder only. The intake row and the plan-run filter are ruling 13's change to `paper`, and a record of it in the same ADR is defensible. The bullet mixes two deviations (the argument and the row) in one line.

### Behaviour

1. The Consolidate clean copy writes job output to the wrong folder.
   - Place: `references/slurm.md` "Job scripts" (`#SBATCH --output=../../logs/%x-%j.out`) against `SKILL.md` "research" item 16 (`<copy>` stands in for `code/`, on scratch storage or in a `mktemp -d` folder), and `research_stages.md` Consolidate, "The reproduction run's log under `logs/`".
   - The path `../../logs` is relative to the submit folder. In the project it is `code/hpc/` and the target is `<project folder>/logs`. In the copy, `<copy>/hpc/` and the target is `<copy's parent>/logs`.
   - Item 16 makes no `logs/` there, and item 10's `mkdir -p` makes the project's.
   - Failure scenario: the reproduction job on a cluster loses its output file, or the scheduler fails to open it, and the comparison has no log to read. The stage's "What it leaves" says the log is under the project's `logs/`.
2. A user-visible change of the `manuscript` run is not stated with its before and after.
   - Place: the report's "Visible changes". It gives the `config.md` row Manuscript Folder and the `## Papers` write. It does not give the `state.json` key `manuscript_folder` or the narrower offer of "An unfinished run" (before: any unfinished run of the mode in the project folder; after: only one of the same manuscript's folder, and one with no key counted as `manuscript/`).
   - Failure scenario: a user with an older paused run that has no key finds that a paused run of a `--manuscript` call is no longer offered.

No text of the round frames a negative or null result as a finding, a consolation or future work. The new stop "A result short of what was set, in `research`" offers Consolidate only for a result that beats the baseline.

### Declined to judge

- How `sbatch` resolves a relative `--output` path (Behaviour 1) is from my knowledge of SLURM, and no SLURM command was run. I took it as relative to the submit folder.
- Whether the intake agent writes the row `Manuscript Folder` when the prompt asks for it needs a run of `paper`. It is outside the gate by the user's ruling.
- The sentence-length counts of the report's section "Sentence length and list items" were not rerun. No decision rests on them.
- The pixel layout of the redrawn figure was not looked at, since the generator exits 0 and its checks cover arrows and labels. A view of `docs/figures/researcher-research.svg` would settle it.
- A fix for the pre-round condition of the merged triggers ("a novelty check of an idea", "final integrity check", "academic pipeline") is not judged here. It is outside the round's delta, and the first refuter report accepted it.

Usage: a729e2eb1b9c75644, claude-sonnet-5-5, 168354 tokens, 24 tool uses, 181 s

## Closed

First run:
- Spec 1 to 6, Proof 1, Standards 1 to 4, Behaviour 1 to 6: closed in repair round 1, rulings 1 to 14 of `agents/briefs/4-round-1.md`.

Run over round 1:
- Spec 1: fixed at landing, `references/research_stages.md`.
- Spec 2: fixed at landing, the description.
- Standards 1: `deviations.md`, the list the gate reads, gains the round's changes to the landed text and the key `manuscript_folder`.
- Standards 2: fixed at landing, ADR 0043.
- Behaviour 1: fixed at landing, `SKILL.md` research item 16.
- Behaviour 2: stated with its before and after in the booking of step 4 in `plan.md`.
