# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 5, paper. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
- sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
- sh skills/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
- sh skills/paper/templates/lookup.test.sh 2>&1 | tail -1
- sh skills/paper/templates/reference_docx.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # from .agents/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, the review agents of /writing and, the agents of /code-comments run on.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch: none               # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- Open item BG (2026-11-15): step 5.A, a false premise the plan cannot absorb whose options change a rule page (`docs/dev/blind-comparison.md`), kind 3 of `plan-orchestration`'s `references/self-rule.md`, raised by `/spec 5 5.A` at its premise checks.
  - What the tree shows. Three of the revision defects on step 5.A's line are not in the `paper` side's output; the judges saw only a landing or abstract page, while the side read the full text.
    - "ECG-CPC" cited to `Lunelli_2026`: the run read Lunelli's full text (`gate5/revision-1-turn2.jsonl`, line 401), whose Results say "we evaluate state-of-the-art ECG foundation models with publicly available pretrained weights on BenchECG: ST-MEM5, ECGJEPA6, ECG-CPC8,32, and ECGFounder3", and its citation compliance checked the sentence (`citation-report.md:166`, claim 67, VERIFIED). The sentence was already in patch 02 (`grep -c 'ECG-CPC \\cite{Lunelli_2026}'` gives 1 in `02-main.tex.patched`), so `5-revision-fault-trace.md`'s row naming patch 09 and an unsupported citation is wrong.
    - Berger et al. "consistently competitive with two of them, CLOCS and HeartLang": the run read Berger's full text (`revision-1-turn2.jsonl`, lines 3601 and 3606), which says "The randomly initialized encoder is consistently competitive with CLOCS and HeartLang" and evaluates "five pre-trained ECG encoders". The sentence is supported; what stands is that no check ran after patch 15, which wrote it.
    - The HuBERT-ECG filter and scaling "cited to a page the run could not read": the run quoted both from the paper's Methods (`citation-report.md:170`, claim 71, VERIFIED, and its lines 263 and 265).
    - Judge 1 of revision counts the first two among its six failures of `paper` (`5-blind-comparison/revision/judgment-1.md:14-15`), judge 2 the second (`judgment-2.md:20`). Judge 1's verdict rests first on the missing response letter, which the rulings keep out of `paper`; judge 2's on the invented reasons for the model choice and the missing Cliff's delta, which stand.
    - The same page rule leaves many citations of all three comparisons unchecked: the judges report Cloudflare "Just a moment..." pages and empty IEEE pages in full (`full/judgment-2.md:62`, `judgment-3.md:45`, `judgment-4.md:47`) and in lit-review (`lit-review/judgment-1.md:28`, `judgment-2.md:27`). `docs/dev/blind-comparison.md`, step 18, saves "the page of each URL an output cites, as its fetch returns it".
    - The four causes on the line stand: line 276's "ARI at most 0.049" against `results_mitbih.csv:33` (raw-beat HDBSCAN 0.107), no citation check after patches 09 and 15, nothing reading patch 15, and the intake decision at `config.md:39` that left out Cliff's delta and the fourth contrast (`run_analyses.py:47-48`).
  - (a) Step 5.A's line drops the three as defects, with the reason, and keeps its four causes; `5-revision-fault-trace.md` gets its ECG-CPC and Berger rows corrected; `docs/dev/blind-comparison.md` step 18 adds that the orchestrator also saves into the judge's copy each source text a side read in its run (from the side's run folder or transcript), named by the URL or the citation key it stands for, with the files of both skills removed as step 19 says, and that the judge checks a claim against that text when its page shows no more than an abstract or a block; step 5.A's check runs its comparisons that way, and the page's change lands with step 5.A; the revision call stays a loss, since step 5.A runs that comparison again. Pros: each judge checks a claim against what the side read, so a supported citation is not counted as a failure and a wrong one behind a wall is found; the records say what happened. Cons: one more collection step per comparison; a side that saves no texts is checked against its pages only, as now.
  - (b) As (a) for the line and the trace, with `docs/dev/blind-comparison.md` step 31 adding instead that a claim whose saved page shows no more than an abstract or a block is "not verifiable" and never counted as a failure. Pros: no new material in the judge's copy. Cons: those citations stay unchecked in every comparison, so a wrong one behind a wall is never found.
  - (c) Correct the line and the trace only, and leave the page rule as it is. Pros: no rule change. Cons: step 5.A's fresh judges repeat the same false failures and the same unchecked citations.
  - Recommendation: (a), since it gives the judges what the sides read and is the only option under which step 5.A's check can find a wrong citation behind a wall. Your ruling on (a) also approves the sentence of step 18 as worded there. The lazy option is (c).


## Closed items (the log of what was raised and how it ended; no report carries it)
- 2026-11-15: Open items BD and BF: ruled (a) by the user, booked in plan.md's Rulings. Open item BE, item 8's pick of the closing `/writing` findings: the user answered that the reply is the orchestrator's; closed under self-rule, C110, item 8 runs again with the orchestrator's one-line pick.
- 2026-11-15: Open item BC, the judge command of step 5's comparisons under `--restricted`, which loads no global instructions: closed under self-rule, C109.
- 2026-11-15: The calls of step 5's comparisons (lit-review a loss, revision a loss, full a tie), the three lit-review entries that do not resolve, the full prompt's error, the new stop and the reading of the single-mode outputs: ruled by the user, booked in plan.md's Rulings ("The calls and the repair's scope", "The full call", "The reading of the single-mode outputs").

- 2026-11-14: Step 4.A landed; every finding of the run over round 2 fixed at landing.
- 2026-11-14: Open item BA, a citation style change with a DOCX or Markdown target: ruled (a) by the user, booked in plan.md's Rulings: a second fresh formatter start writes the conversion patch from the copy compiled in the new style; ADR 0027 names the case. Built in repair round 2 of step 4.A.
- 2026-11-14: Open item BB, the DOCX layout with no reference document: ruled (a) by the user, booked in plan.md's Rulings: `skills/paper/templates/reference_docx.py` with its test. Built in repair round 2 of step 4.A.
- 2026-11-14: Open item AZ, the builder's unapproved edit commands in step 4.A: ruled (a) by the user, booked in plan.md's Rulings: the parts are written again with the Edit and Write tools in repair round 1, and the commands are not approved.
- 2026-11-14: Open item AY, the Socratic mentor's dialogue against ADR 0025: ruled (a) by the user, booked in plan.md's Rulings: one mentor agent per plan run, resumed with each answer, its checkpoint in the run folder; the formatter role; DOCX and Markdown by `pandoc` when on the PATH, a PDF only from the `.tex`; ADR 0027 supersedes 0025.
- 2026-11-14: Open item AX: ruled (b) by the user, booked in plan.md's Rulings: the manuscript prose standard lists only its differences, ADR 0026 supersedes ADR 0002 in that part; carried out at the landing of step 4.
- 2026-11-14: Open item AW: ruled (a) by the user, booked in plan.md's Rulings: the rule against code and software wording in the manuscript, in the draft writer, the corrections sent to it, the peer reviewer and `/writing`, built in repair round 2 of step 4; roadmap entry 13's part waits on the user's approval of its diff.
- 2026-11-14: Open item AV (AV1 to AV19): ruled by the user, booked in plan.md's Rulings: every item built as academic-paper has it, AV6 with paragraphs of 120 to 200 words that may exceed four sentences; built in repair round 2 of step 4 (AV18).
- 2026-10-21: Open item AS: ruled (a) by the user, booked in plan.md's Rulings. The user allows the `claude -p` check runs, and runs a turn with `!` if the runner refuses it.
- 2026-10-21: Open item AU: the builder's scratch-script count, raised by the round's refute; ruled (a) by the user, booked in plan.md's Rulings: the count is not used and the session reads the round's changed sentences at landing.
- 2026-10-21: Open item AT: ruled (a) by the user, with the exception of a manuscript asked for as internal only; booked in plan.md's Rulings and added to repair round 1 as point 31.
- 2026-10-21: Open item AR: ruled (b) by the user, booked in plan.md's Rulings.
- 2026-10-21: Open item AP: ruled (a2) by the user, booked in plan.md's Rulings. Ruling AQ reworded on the user's instruction: no repository, project name or folder layout is written into the skill.
- 2026-10-21: The roadmap change of AL and AO, with entry 5's goal under AF and AK, approved by the user and committed (414f8ba); plan 5's Goal changed the same way. The user's requirement that every file argument may be given in words booked as ruling AQ.
- 2026-10-21: Open items AL, AM, AN and AO: ruled by the user, booked in plan.md's Rulings; the roadmap changes of AL and AO wait on the user's approval of their diff.
- 2026-10-21: Open items AI (AI1 and AI2), AJ and AK: ruled by the user, booked in plan.md's Rulings.
- 2026-10-21: Open item AD, row AD14, and open items AF, AG and AH: ruled by the user, booked in plan.md's Rulings; every row of AD is ruled. Roadmap entry 7's change under AD13 approved and committed (d3e274b).
- 2026-10-21: Open item AD, rows AD8 and AD13 (with the change to roadmap entry 7): ruled by the user, booked in plan.md's Rulings; AD14 stays open.
- 2026-10-21: Open item AD, rows AD1 to AD7, AD9 to AD12 and AD15 to AD17: ruled by the user, booked in plan.md's Rulings; AD8, AD13 and AD14 stay open.
- 2026-10-21: Open item AE, the builder's unapproved script `c19.py` for case C19: ruled (a) by the user, its output not used, the reading of each figure goes into step 4's repair round.
- 2026-10-19: Open item A, the drafted step list of `/plan 5 --self-rule`: closed under self-rule, C102.
- 2026-10-19: Open item B, the command forms of `lookup.py` cite-keys, check-urls and quote-check: closed under self-rule, C103.
- 2026-10-19: Open item C, what each mode of `paper` leaves in the manuscript's files, how it finds the `.bib`, and how a patch reaches the manuscript: closed under self-rule, C104.
- 2026-10-19: Open item D, the numbers of the `/writing` findings the user accepts and the names of a run's patch files: closed under self-rule, C105.
- 2026-10-19: Open item E, how the `/writing` findings reach `/paper` on the current dongho manuscript: closed under self-rule, C106.
- 2026-10-19: Open item F, the line of `~/.claude/CLAUDE.md` that routes manuscript content: ruled by the user, a form of (b), the line names `academic-paper` or `paper`.
- 2026-10-20: Open item G, plan 5's steps after `/grill 5` settled D42 to D59: ruled by the user, (a).
- 2026-10-20: C107, the ended academic-paper revision run's three closing decisions (step 3, review over round 1, Spec 2): closed under self-rule, (a).
- 2026-10-20: Open item H, the commands that made step 3's records: ruled by the user, (a).
- 2026-10-20: Open item I, five choices of step 4's brief check (the other skills' figures, a failed reference check, the disclosure's model identifier, the statements the ethics check triggered, intake's DOI checking): closed under self-rule, C108.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option; nothing asked of Axel that an agent can do.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 5, the rulings in `plan.md` (D1 to D59, the pins of plan 5, open items A to BB), ADRs 0017, 0020, 0023, 0024, 0026 and 0027 (0027 supersedes 0025). Ledger: `.scratch/5-paper/`, with `agents/briefs/` and `agents/reviews/`.
- The sources: `../research-hub/.agents/skills/academic-paper/`, `academic-pipeline/` and `deep-research/` (the coverage rows of `docs/academic-coverage.md`), `../research-hub/tools/manuscript/`, and `lookup.py` at commit 0074728. research-hub is read only; the gate's runs work on copies outside it.
- The installed skills are pinned at v8.4.0-rc.1, the release candidate of step 3 (`git -C ~/.local/share/ordo-stable describe --tags`); step 5 tags the next release candidate and pins it, and the closing tags the final release and pins it (Rulings, "The pins of plan 5").

## Current position (rewritten before every step commit of this plan)

- 2026-11-15. Step 5, the sixth of 8 steps, the gate's comparisons, landed and booked in `plan.md` ("Step 5, the gate's comparisons"); the landing report is `agents/reviews/5-landing.md`. C8 and C15 are handed to step 5.A by the rulings "The calls and the repair's scope" and "The full call".
- Next: step 5.A, the repair of paper, through `/spec 5 5.A`; its line now carries the four causes of `agents/reviews/5-revision-fault-trace.md` and the comparison setup with research-hub's `tools/manuscript/` and `CLAUDE.md`; then step 6, the closing.
- The two check runs of the rebuilt skill (revision, copy `cr4b`, session ce6db165-ecf5-4128-96cc-b05d5b5b37d3; full, copy `fr5`, session 0b6daf08-9d97-45d9-9ecd-f743566be6fd) are stopped, and resume only when Axel asks.
- Open on Axel's side: open item BG, raised by `/spec 5 5.A`; step 5.A waits for its ruling.
