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
worker: claude:fable         # from .agents/plan.yaml.
reviewer: claude:fable       # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, the review agents of /writing and, the agents of /code-comments run on.
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
worker_effort: low           # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: low         # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch:                    # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.




## Closed items (the log of what was raised and how it ended; no report carries it)
- 2026-11-21: Open item 5.Q-entry7-drop: approved (a) by the user; roadmap entry 7 dropped in 91e23d9.
- 2026-11-20: Open item 5.Q-target-modes: ruled (a) by the user, booked in plan.md's Rulings; the "Number of sources" row applies in lit-review, full and outline-only mode.
- 2026-11-20: Open item 5.Q held: ruled (a) by the user, booked in plan.md's Rulings; 5.Q goes ahead as booked with an optional "Number of sources" row in lit-review mode, prepared on the user's go.

- 2026-11-20: Open item 5.Q-entry7, roadmap entry 7 and its gate: ruled (a) by the user.
- 2026-11-20: Open item 5.Q-letter-place, where `paper` writes the response letter: ruled (c) by the user, at the end of revision and in a mode of its own.
- 2026-11-20: Open item 5.Q-rebuttal, revision-coach and rebuttal-audit in `paper`: ruled (c) by the user, both modes copied and the response letter written.
- 2026-11-20: Open item 5.P-run, how to run main's `paper` for the check after 5.P: ruled (a) by the user.
- 2026-11-20: Open item 5.Q-letter, the response letter in the revision comparison: withdrawn, since the ruling The response letter in the revision comparison (2026-11-16) already removes the letter from academic-paper's output and tells the judges it is not judged.
- 2026-11-22: Open item 5.R-wordseq, the word-sequence check of lit-review's formatter: withdrawn by the user; ruling Open item 5.R-source replaces it (`plan.md`, Rulings).
- 2026-11-20: Open item 5.P-S6, step 5.P's edits made with `sed` and inline `python3`: ruled (a) by the user, accepted as they stand.
- 2026-11-19: Open item CC, the unapproved helper `b5n/longsent.py` and the reading of "roughly 20": ruled (b) by the user, booked in plan.md's Rulings; no step added.
- 2026-11-19: Open item CB, `lookup.py` in the plan's goal and gate: ruled (a) by the user, booked in plan.md's Rulings; step 5.N's line tagged (ruling CB).
- 2026-11-19: Open item CA: ruled (a) by the user, booked in plan.md's Rulings; step 5.M booked.

- 2026-11-18: Open item BZ, roadmap entry 5's Goal named `lookup.py bibtex` as the strategist's writer: ruled by the user, (a), the clause reads "writes a BibTeX entry for each included source from the record it confirmed" (commit bfdd9d3, `plan.md`, Rulings, Open item BZ).
- 2026-11-18: Open item BX, the lit-review comparison on `v8.4.0-rc.9` lost 0 of 4: ruled by the user, (e), step 5.J (`plan.md`, Rulings, Open item BX).
- 2026-11-18: Open item BQ, the user's call on the lit-review comparison on `v8.4.0-rc.6`: closed by the user, replaced by Open item BS and the rc.9 comparison of its item (4).
- 2026-11-18: Open item BV, how a renamed later version is cited when no index links it to the preprint (step 5.I, item (2) of the ruling The examples, the renamed versions and the gap chaining): closed under self-rule, C126.
- 2026-11-18: Open item BW, the renamed later version cited from the record `resolve` prints, which follows ADR 0032, in place of BV's new `bibtex --page` form (step 5.I, brief check): closed under self-rule, C127, replacing C126.
- 2026-11-18: Open item BU, where the run's process records go once tool names leave the review (step 5.H, a user-visible file of the run folder): closed under self-rule, C125.
- 2026-11-18: Open item BT, which branch of the ruling The rule-by-rule check the check's result takes: closed under self-rule, C124.
- 2026-11-18: Open item BS, the lit-review comparison on `v8.4.0-rc.8`: closed by the user, (a), with the ruling The rule-by-rule check; step 5.H added to `plan.md`.
- 2026-11-16: Open item BR, the audit of `paper` against academic-paper 3.2.0: closed by step 5.F, which carries the rulings Open item BR, Open item BL reopened, The databases per field and The simulation in step 5.F (`plan.md`, "Step 5.F, the fifth repair of paper").
- 2026-11-16: Open item BP, BM reopened: closed by the user, (a), the venue page search and ADR 0034 stand.
- 2026-11-16: Open item BN, paper's refusal without the effort agents: closed by the user, (a), the default agent with the effort named; booked for step 5.E.
- 2026-11-16: Open item BO, entry 5's Goal on lookup.py: closed by the user, (a), the Goal reworded in docs/roadmap.md and plan.md.
- 2026-11-16: Open item BM, the venue page of a published arXiv paper for the roles other than the strategist: closed by the user, (a), ruling The venue page of a published arXiv paper, ADR 0034; carried in step 5.D's repair round 1.
- 2026-11-16: Open item BL, step 5.D's clash with ADR 0027: closed by the user, no strategist per strand, ADR 0027 stands; the ruling The third repair of paper rewritten to academic-paper equivalence, booked in plan.md's Rulings.

- 2026-11-16: Open item BK, the call on the lit-review comparison of step 5.A's check: ruled (a), a loss, by the user, booked in plan.md's Rulings.

- 2026-11-16: Open item BJ, the source texts of the lit-review judges: ruled (a) by the user, booked in plan.md's Rulings.
- 2026-11-15: Step 5.A landed; the first run's findings closed in repair round 1, the three of the run over round 1 and one of the orchestrator's read fixed at landing.
- 2026-11-15: Open item BI, step 5.A's stop that does not converge (Bonneel_2016 under `resolve --entry`, the intake answer "No.", the citation checks after later patches against ADR 0027 and ADR 0023, the search's end): ruled 1 (a), 2 (a), 3 (a), 4 (a) by the user, booked in plan.md's Rulings; ADR 0029 written.
- 2026-11-15: Open item BH, the number checks against ADR 0027 and the command form of the changed `resolve`: ruled (a) by the user, booked in plan.md's Rulings; ADR 0028 written.
- 2026-11-15: Open item BG, three revision defects on step 5.A's line that the `paper` side's full texts support, and the judges' source texts: ruled (a) by the user, booked in plan.md's Rulings.
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
- The installed skills are pinned at v8.4.0-rc.2, the release candidate of step 5 (`git -C ~/.local/share/ordo-stable describe --tags`); step 5.A's check tags the next release candidate and pins it, and the closing tags the final release and pins it (Rulings, "The pins of plan 5").

## Current position (rewritten before every step commit of this plan)

- 2026-11-16. Step 5.G, the thirteenth of 14 steps, the theme search of paper, landed and booked in `plan.md` ("Step 5.G, the theme search of paper"); the landing report is `agents/reviews/5.G-landing.md`.
- The lit-review rerun: `v8.4.0-rc.7` tagged on b9e7195 and pinned (`utils/pin.sh`, "pinned: v8.4.0-rc.7 (b9e7195)"). The `paper` side runs in a fresh clone `gate5a/lit-review-1` of the input commit e5fc1da (the rc.6 copy moved to `gate5a/rc6-lit/`), session 3cfa05a1-a40b-47b1-851a-91b5e9eda6a7, served claude-opus-5-5; turn 1 ended at the intake questions (26 s, $0.91); turn 2, with step 5's answer `lit-review-1-answer1.txt`, ran 48 min ($12.43, served claude-opus-5-5 and the strategist agent a86e9f951aecaeac0 claude-opus-5-5) and finished the run with 87 entries, taking both stops (intake confirmation, the sources' review) as decisions recorded in its run record instead of showing them. Blinded with `tools/rules-lit-rc7.json` into `gate5a/blind-lit-rc7`; source texts in `gate5a/sources-lit-rc7` (the strategist's page removed); pages of the 150 cited URLs saved (151 files, 12 IEEE DOI pages empty). Judges with the rc.6 prompt, served claude-opus-5-5: judge 1 (A academic-paper) A, 2.5 min, $2.25; judge 2 (A paper) B, 3.0 min, $2.32. academic-paper wins both orders again (`agents/reviews/5.F-check-blind-comparison/lit-review/`), mainly for coverage: 147 sources from four theme searches and a merge (its session's decision D1) against `paper`'s 87 from one strategist. Proposed to the user: a second academic-paper lit-review run (about 2 h 20 min, about $47) judged against rc.7, the four verdicts counted (a) at least 2 of 4 or (b) each pair; ruled (a) by the user (`plan.md` Rulings, "The second academic-paper lit-review run"); the run is going in `gate5b/lit-review-ap2`, a fresh clone of step 5's input b4e05f4. The academic-paper side is step 5's output, unchanged.
- The second academic-paper lit-review run (ruling "The second academic-paper lit-review run") runs in `gate5b/lit-review-ap2` of the session's scratchpad, a clone of step 5's input: turn 1 done (session 78883ca7-7667-4401-ac1f-b6245e793281), turn 2 running.
- The comparison after the theme search ran on `v8.4.0-rc.8` (367eac6, pinned): `paper` session b699fd3b-3cee-4830-9f80-8dcfad867b6e (copy `gate5c/lit-review-rc8`, $59.68, 225 entries), the second academic-paper run session 78883ca7-7667-4401-ac1f-b6245e793281 (copy `gate5b/lit-review-ap2`, $75.59, 171 entries), four judges served claude-opus-5-5 ($10.53): academic-paper 4 of 4, `paper` 0 of 4 (`agents/reviews/5.G-check-blind-comparison.md`).
- The rule-by-rule check ran (`agents/reviews/5.H-rule-check.md`, agent a44f1b6655254b5bf, claude-opus-5-5): 384 rules, 40 dropped by at least one agent, 67 drops; open item BT closed under self-rule, C124.
- 2026-11-18. Step 5.H, the fourteenth of 15 steps, the question's shape in paper, landed and booked in `plan.md` ("Step 5.H, the question's shape in paper"); the landing report is `agents/reviews/5.H-landing.md`.
- 2026-11-18. Step 5.I, the fifteenth of 16 steps, the examples, the renamed versions and the gap chaining in paper, landed and booked in `plan.md` ("Step 5.I, the examples, the renamed versions and the gap chaining in paper"); the landing report is `agents/reviews/5.I-landing.md`.
- `v8.4.0-rc.9` tagged on c031f05 and pinned (`utils/pin.sh`, "pinned: v8.4.0-rc.9 (c031f05), 16 skills linked").
- 2026-11-18. The lit-review comparison on `v8.4.0-rc.9` (ruling BS item (4)) ran: `paper` 0 of 4 (`agents/reviews/5.I-check-blind-comparison.md`); the `paper` run cost $108.39 and the judges $8.06.
- 2026-11-18. Step 5.J, the sixteenth of 17 steps, the cuts of paper's literature strategist, landed and booked in `plan.md` ("Step 5.J, the cuts of paper's literature strategist"); the landing report is `agents/reviews/5.J-landing.md`.
- `v8.4.0-rc.10` tagged on 7bdaddb and pinned (`utils/pin.sh`, "pinned: v8.4.0-rc.10 (7bdaddb), 16 skills linked").
- 2026-11-19. Step 5.K, the seventeenth of 18 steps, paper's lit-review made academic-paper's, landed and booked in `plan.md` ("Step 5.K, paper's lit-review made academic-paper's"); the landing report is `agents/reviews/5.K-landing.md`. The lit-review comparison on `v8.4.0-rc.10` was not run, on the user's word.
- `v8.4.0-rc.11` tagged on 8624025 and pinned (`utils/pin.sh`, "pinned: v8.4.0-rc.11 (8624025), 16 skills linked").
- 2026-11-19. The lit-review comparison on `v8.4.0-rc.11`, on the user's go: the `paper` side runs in `gate5e/lit-review-rc11` of the session's scratchpad (a clone of input commit e5fc1da), with step 5's request and answer and the cache and temporary folders under `gate5e/`; the judges follow, as for rc.9.
- 2026-11-19. The rc.11 lit-review comparison ran: `paper` 0 of 4 against both academic-paper runs, bar 2 of 4 not met (`agents/reviews/5.K-check-blind-comparison.md`). Run $0.90 and $25.30, judges $8.57.
- 2026-11-19. The user ruled The briefs of academic-paper's run (`plan.md` Rulings); step 5.L booked.
- 2026-11-19. Step 5.L, the eighteenth of 19 steps, the briefs of academic-paper's run in paper, landed and booked in `plan.md` ("Step 5.L, the briefs of academic-paper's run in paper"); the landing report is `agents/reviews/5.L-landing.md`.
- `v8.4.0-rc.12` tagged on 17c8a4f and pinned on the user's go (`utils/pin.sh`, "pinned: v8.4.0-rc.12 (17c8a4f), 16 skills linked").
- 2026-11-19. The lit-review comparison on `v8.4.0-rc.12`, on the user's go: the `paper` side runs in `gate5f/lit-review-rc12` of the session's scratchpad (a clone of input commit e5fc1da), with step 5's request and answer and the cache and temporary folders under `gate5f/`; the judges follow, as for rc.11.
- 2026-11-19. The rc.12 lit-review comparison ran: `paper` 0 of 4 against both academic-paper runs, bar 2 of 4 not met (`agents/reviews/5.L-check-blind-comparison.md`). Run $0.93 and $38.57, judges $10.55.
- 2026-11-19. The rc.12 loss diagnosed on the user's ruling (a), by reading only: open item CA.
- 2026-11-19. The user ruled open item CA (a) (`plan.md` Rulings); step 5.M booked.
- 2026-11-19. Step 5.M, the nineteenth of 20 steps, the merge run of paper's literature search made academic-paper's, landed and booked in `plan.md` ("Step 5.M, the merge run of paper's literature search made academic-paper's"); the landing report is `agents/reviews/5.M-landing.md`.
- `v8.4.0-rc.13` tagged on 8f39e6d and pinned on the user's go (`utils/pin.sh`, "pinned: v8.4.0-rc.13 (8f39e6d), 16 skills linked").
- 2026-11-19. The lit-review comparison on `v8.4.0-rc.13`, on the user's go: the `paper` side runs in `gate5g/lit-review-rc13` of the session's scratchpad (a clone of input commit e5fc1da), with step 5's request and answer and the cache and temporary folders under `gate5g/`. The run was stopped on 2026-11-19 before it finished, on the user's word, with no judges and no verdict.
- 2026-11-19. `/spec 5 5.N` ran its brief check (`agents/reviews/5.N-brief-check.md`) and stopped on open item CB.
- 2026-11-19. The user ruled open item CB (a).
- 2026-11-19. Step 5.N, the twentieth of 21 steps, paper's lit-review rewritten from academic-paper 3.2.0, landed and booked in `plan.md` ("Step 5.N, paper's lit-review rewritten from academic-paper 3.2.0"); the landing report is `agents/reviews/5.N-landing.md`. Open item CC ruled (b) by the user.
- `v8.4.0-rc.14` tagged on 9ecb20d and pinned on the user's go (`utils/pin.sh`, "pinned: v8.4.0-rc.14 (9ecb20d), 16 skills linked").
- 2026-11-19. The lit-review comparison on `v8.4.0-rc.14`, on the user's go: the `paper` side runs in `gate5h/lit-review-rc14` of the session's scratchpad (a clone of input commit e5fc1da), with step 5's request and answer and the cache and temporary folders under `gate5h/`; the judges follow, as for rc.12.
- 2026-11-20. The rc.14 lit-review comparison: `paper` 3 of 4, the bar of 2 of 4 met (judges 1, 3 and 4 for `paper`, judge 2 for academic-paper's step 5 run). Run $138.31 and 4 h 52 min, 303 sources; judges $7.94. Record `agents/reviews/5.N-check-blind-comparison.md`.
- 2026-11-20. Step 5.O, the twenty-first of 22 steps, the lit-review run under the rules, landed and booked in `plan.md` ("Step 5.O, the lit-review run under the rules"), in c603e89 and the commit that finishes its landing: the citation rounds over the merged core set in jobs of at most 40 works, the strategist check of each start's transcript, and the strategist's commands without `awk`; then the size and the time of the run: the theme runs hand on only leads, the annotations and entries joined with `cat`, the first citation round with the merge jobs, the synthesis in few edits. The landing report is `agents/reviews/5.O-landing.md`.
- `v8.4.0-rc.15` tagged on b567f72 and pinned on the user's go (`utils/pin.sh`, "pinned: v8.4.0-rc.15 (b567f72), 16 skills linked").
- 2026-11-20. The lit-review comparison on `v8.4.0-rc.15`, on the user's go: the `paper` side runs in `gate5i/lit-review-rc15` of the scratchpad `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad` (a clone of input commit e5fc1da), with step 5's request and answer and the cache and temporary folders under `gate5i/`, session de6e5777-ffa3-4a49-a8ed-03f82a36ba35: turn 1 ended at the intake questions ($1.97, 3.7 min); turn 2 started at 13:55 and was stopped at 15:05 on the user's go, its session having followed `SKILL.md:1026` against the theme runs' target range; the contradiction and the strategist's read-only commands fixed at landing of 5.O. `v8.4.0-rc.16` tagged on d6a0d7e and pinned (`utils/pin.sh`, "pinned: v8.4.0-rc.16 (d6a0d7e), 16 skills linked"). The comparison runs again in `gate5j/lit-review-rc16` (a clone of e5fc1da, cache and temporary folders under `gate5j/`), session 0c0a99e0-c7f5-4ac0-89fc-871c910fb243: turn 1 ended at the intake questions ($1.78); turn 2 started at 15:13, its output `gate5j/rc16-turn2.jsonl`. The judges follow, as for rc.14.
- 2026-11-20. The rc.15 lit-review run was stopped on the user's go, and the rc.16 run (`v8.4.0-rc.16` on d6a0d7e) was stopped on the user's go; neither was judged.
- 2026-11-20. Step 5.P, the twenty-second of 24 steps, paper's lit-review as academic-paper's, landed and booked in `plan.md` ("Step 5.P, paper's lit-review as academic-paper's"); the landing report is `agents/reviews/5.P-landing.md`. Step 5.Q is booked and held by the user until the lit-review comparison after 5.P has been judged.
- `v8.4.0-rc.17` tagged on 664105f and pinned on the user's go, ruling Open item 5.P-run (a) (`utils/pin.sh`, "pinned: v8.4.0-rc.17 (664105f), 16 skills linked").
- 2026-11-20. The check run of step 5.P, also the `paper` side of the rc.17 lit-review comparison: copy `gate5k/lit-review-rc17` of the scratchpad `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad` (a clone of input commit e5fc1da), cache and temporary folders under `gate5k/`, session 7397d492-6b0d-4a78-bab9-5f59df82a3d2; turn 1 ended at the intake questions ($1.93); turn 2, with step 5's answer, ended after 4 min at the intake confirmation again, the session reading `references/intake.md:302` (unchanged by step 5.P) as keeping that stop ($3.08 for the session so far); turn 3 started with "Confirm. Go on and finish the run." (`gate5k/lit-review-rc17-answer2.txt`), as step 5.D's run had a third turn, output `gate5k/rc17-turn3.jsonl`.
- 2026-11-20. Turn 3 finished at 23:06; the run took 3 h 30 min and $104.96 against the bar of 2 h 11 min and academic-paper's $75.59, `refs.bib` 270 entries; the slower stage is the strategists' search, 122 min against 68, its cause the session's briefs holding no target number of included sources (`agents/reviews/5.P-check-run.md`). The user ruled (a): the judges run on this run.
- 2026-11-20. The rc.17 lit-review comparison: `paper` 4 of 4 against both academic-paper runs, the bar 2 of 4 met (`agents/reviews/5.P-check-blind-comparison.md`).
- Step 5.Q prepared on the user's go (2026-11-20): brief `agents/briefs/5.Q.md`, its brief check `agents/reviews/5.Q-brief-check.md` with every finding closed in the brief, choices C131 and C132.
- 2026-11-21. Step 5.Q, the twenty-third of 24 steps, the rest of paper as academic-paper's, landed and booked in `plan.md` ("Step 5.Q, the rest of paper as academic-paper's"); the landing report is `agents/reviews/5.Q-landing.md`. Its check (the revision and full comparisons on the next release candidate, and roadmap entry 7's gate) is not run, on the user's word to report first.
- 2026-11-21. Roadmap entry 7 dropped in 91e23d9 (ruling Open item 5.Q-entry7). `v8.4.0-rc.18` tagged on 957cd82 and pinned on the user's go (`utils/pin.sh`, "pinned: v8.4.0-rc.18 (957cd82), 16 skills linked"); rulings Open items 5.Q-check-sources, 5.Q-check-writing, 5.Q-check-time and 5.Q-check-go booked.
- 2026-11-22. Step 5.R, the twenty-fourth of 25 steps, the paper figures of use and the seven ruled changes, landed and booked in `plan.md` ("Step 5.R, the paper figures of use and the seven ruled changes"); the landing report is `agents/reviews/5.R-landing.md`.
- 2026-11-22. The review of ruling 5.Q-no-rerun ran (`agents/reviews/5.R-deviation-audit.md`, agent a7f240d919a101f50, claude-fable-5-2, 384485 tokens, 44 tool uses, 12.8 min): 47 deviations, 17 with no covering ruling. Ruling Open item 5.R-audit closes them as repair round 2 of step 5.R, on a worktree at 2cd4c95, since round 1 landed in 2cd4c95.
- 2026-11-22. Repair round 2 of step 5.R landed and booked in `plan.md` ("Step 5.R, repair round 2"); the landing report `agents/reviews/5.R-landing.md` holds it.
- 2026-11-22. The script round and ruling Open item 5.R-wordseq are withdrawn by the user, and builder ae46e3f2b8d82155e is stopped. The second review (`agents/reviews/5.R-deviation-audit-2.md`, agent ae20c7007667991fc) is invalid and not used.
- 2026-11-22. Repair round 3 of step 5.R (`agents/briefs/5.R-round-3.md`, ruling Open item 5.R-source) goes to a new builder in the worktree at 0cd05f2: the files moved to academic-paper's four folders and file names, lit-review item 7 removed, the reason of agent resumption in ADR 0043.
- 2026-11-22. Repair round 3 of step 5.R landed and booked in `plan.md` ("Step 5.R, repair round 3"); the landing report `agents/reviews/5.R-landing.md` holds it.
- 2026-11-22. The review of ruling 5.Q-no-rerun ran once on dea36e9 under the rules of ruling Open item 5.R-source (`agents/reviews/5.R-deviation-audit-3.md`): 1 finding, which stands after the orchestrator's check of its quoted lines: full mode's argument builder gets nothing of a plan run taken at intake (`SKILL.md:356`). It waits on the user's word.
- 2026-11-22. The finding is fixed on main on the user's word ("Fix on main is fine"): `SKILL.md`, full mode item 6 and "What it reads" 6 give the argument builder the plan run's `dialogue.md` and `chapter-plan.md`, as academic-paper's conversion table does. No finding of the review is left, so step 5.R passes the check of ruling Open item 5.R-source.
- 2026-11-22. `docs/figures/paper/lifecycle.svg` and `run-folder.svg` redrawn on main on the user's word, after the user found both confusing: the first shows full mode and revision mode as frames holding their parts, each with the mode that runs it alone; the second a full run from agent to agent with the files on the arrows, and the path of a patch.
- 2026-11-22. Step 6, the closing, started on the user's word, the final tag and the pin included. The cost script changed on main on the user's word so that it prices this plan (step names such as 5.R, a row other, the price row of claude-fable-5-2). The closing report is `agents/reviews/closing.md`.
- Next: the roadmap diff of `/roadmap done 5`, for the user's approval; then the move to the archive, the tag and the pin.
- The two check runs of the rebuilt skill (revision, copy `cr4b`, session ce6db165-ecf5-4128-96cc-b05d5b5b37d3; full, copy `fr5`, session 0b6daf08-9d97-45d9-9ecd-f743566be6fd) are stopped, and resume only when Axel asks.
- Step 5.A's check, on Axel's go (2026-11-16): `v8.4.0-rc.4` tagged on f3531a7 and pinned; one `curl` per index answered 200. The lit-review `paper` side ran in `gate5a/lit-review-1` of the session's scratchpad (session 5b815d8b-6616-4994-af1b-61091e2f57c2, claude-opus-5-5, 111 min, $16.80 by `total_cost_usd`): 81 entries, every annotation "abstract not read", 2 entries from 2022 or later (step 5's run: none unread, 44 from 2022 or later). Not judged. The revision, full and disclosure sides have not started.
