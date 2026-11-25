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
