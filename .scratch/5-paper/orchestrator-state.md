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
worker: claude:opus          # from .agents/plan.yaml.
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
worker_effort: medium        # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch:                    # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- BQ (2026-11-16): the lit-review comparison on `v8.4.0-rc.6` (`agents/reviews/5.D-check-blind-comparison.md`): academic-paper's output won with both judges, in both orders. The user's call on it under the ruling The check after the third repair. Ruled so far: Open item BL reopened (a), the one-start rule of the literature strategist removed, not yet carried by a step since the user has not given the go; an audit of every other rule of `paper` that departs from academic-paper while its record claims equivalence is running. No comparison is rerun straight after step 5.E; a rerun follows the step that carries the changes (the user).

- BR (2026-11-16): the audit of `paper` against academic-paper 3.2.0 (`agents/reviews/5-audit-equivalence.md`, agent a8b70597bb7b81e60): eight rules depart from academic-paper while their record claims equivalence (A1 the strategist's one start, ruled under BL; A2 the visualization agent's one start; A3 the stop after draft review round 2 and the round-1 Reject; A4 the strategist's databases and citing layers; A5 pdfLaTeX for elsarticle, IEEEtran and acmart; A6 the anonymous copy; A7 the black outline; A8 the one retry of a patch that does not apply). Rule 23: each is kept only as an openly recorded deviation that improves `paper`, or brought back to academic-paper. Ruling AV4 (offer revise-by-hand and lower the venue) and the ruling The second repair of paper (3) disagree. Not yet carried by a step: the user has not given the go.


## Closed items (the log of what was raised and how it ended; no report carries it)

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

- 2026-11-16. Step 5.E, the eleventh of 12 steps, the fourth repair of paper, landed and booked in `plan.md` ("Step 5.E, the fourth repair of paper"); the landing report is `agents/reviews/5.E-landing.md`.
- Next: the gate is not met (the lit-review comparison on rc.6 lost), so step 6, the closing, cannot run. Next is a step that carries open items BL and BR, on the user's go.
- The two check runs of the rebuilt skill (revision, copy `cr4b`, session ce6db165-ecf5-4128-96cc-b05d5b5b37d3; full, copy `fr5`, session 0b6daf08-9d97-45d9-9ecd-f743566be6fd) are stopped, and resume only when Axel asks.
- Step 5.A's check, on Axel's go (2026-11-16): `v8.4.0-rc.4` tagged on f3531a7 and pinned; one `curl` per index answered 200. The lit-review `paper` side ran in `gate5a/lit-review-1` of the session's scratchpad (session 5b815d8b-6616-4994-af1b-61091e2f57c2, claude-opus-5-5, 111 min, $16.80 by `total_cost_usd`): 81 entries, every annotation "abstract not read", 2 entries from 2022 or later (step 5's run: none unread, 44 from 2022 or later). Not judged. The revision, full and disclosure sides have not started.
