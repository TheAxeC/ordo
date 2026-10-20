# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 5, paper. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
- sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
- sh skills/paper/templates/lookup.test.sh 2>&1 | tail -1
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
dispatch:                    # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- Open item I (2026-10-20): step 4, raised by the brief check of `/spec 5 4` (`agents/reviews/4-brief-check.md`, "2. The step line" findings 2, 3, 7, 8 and 10), five choices the user would see.
  - Part 1, the figures of the other skills that launch agents. The ruling "The figures of skills that launch agents" says `docs/figures/` gains a figure of `paper` "and of every other skill that launches agents, once plan 5's fix is done"; step 4's line names `paper`'s figure only, and no step or roadmap entry holds the others (`grep -n -i figure docs/roadmap.md` prints nothing). `README.md:79` names the plan skills, `grill`, `writing`, `code-comments` and `paper` as the skills that launch agents; `docs/figures/pipeline.svg` and `plan-loop.svg` draw the plan skills. `docs/dev/building.md:35` says `gen_figures.py` writes every figure under `docs/figures/`.
    - (a) Step 4 also adds to `docs/figures/gen_figures.py` a figure each of `grill`, `writing` and `code-comments`, drawn as `paper`'s is (its agents in order, its stops with their marks), each shown in `README.md`, and `docs/dev/building.md`'s sentence on the figures says that every skill that launches agents has its figure there and names both scripts. Pro: the ruling is carried out with the fix it names, in the step that already changes `gen_figures.py` and the README's figures. Con: the step grows by three figures, about 30 min of build.
    - (b) A new step between 4 and 5 for the three figures. Pro: step 4 stays as drafted. Con: a second step rewrites the same script and the same README lines right after step 4.
    - (c) Left to a later entry. Pro: no work now. Con: the ruling's sentence goes undone in the plan it names.
    - Recommendation: (a). The lazy option is (c).
  - Part 2, where a failure of the reference checks goes in full, revision and lit-review. Today a `missing:` line of `lookup.py cite-keys` or a failed line of `check-urls` goes to the citation compliance agent (`skills/paper/SKILL.md`, Steps 11), which D43, D48 and D49 remove from those modes.
    - (a) After the last writer pass the session runs both checks; a failure starts the draft writer once with the failing keys and lines, its patch is applied, the checks run again, and a failure left after that is named in the final message with the line as printed. The pass is driven by a script's output, so it is not one of ADR 0022's "at most three writer passes driven by other agents' issues". Pro: the references resolve without a stop and without the user's hands. Con: one more writer start when a check fails.
    - (b) The failures are named in the final message only. Pro: no extra start. Con: the user fixes by hand what the run could fix.
    - (c) A failure is a stop. Con: a stop outside the mode's list, against "The stops of paper".
    - Recommendation: (a). The lazy option is (b).
  - Part 3, the model identifier the AI disclosure names (D47). The configured `reviewer` is the alias `claude:opus` (`.agents/plan.yaml:10`), and `refute`'s Stops define the configured model as the newest model that alias names in the runner's model list.
    - (a) The session gives the draft writer the identifier the alias names in the runner's model list at the run's start, such as `claude-opus-5-5`, the disclosure writes that identifier, and the stop "A model other than the configured one" compares each served model with it. Pro: the disclosure names a model version, and the stop and the disclosure use one value. Con: none found.
    - (b) The alias as written. Con: a disclosure that names `claude:opus`, which is no model's name.
    - Recommendation: (a). No option is the lazy one.
  - Part 4, the statements whose trigger is the ethics check: the responsible-use statement, written when the ethics check rates dual use Moderate or above (`skills/paper/references/statements.md:173`); the reproducibility statement's second trigger, a gap the ethics check marks (`:182`); and a missing approval number, consent or de-identification, which the ethics check lists (`:169`).
    - (a) The responsible-use statement is written when the venue asks for one or the user asks for one at intake, recorded in the Notes; the reproducibility statement when the venue or the user asks for one; a missing approval number, consent or de-identification is named in the draft writer's report and in the final message as a gap for the user to fill; the rating of dual use is left to `researcher`'s ethics check (entry 13). Pro: each trigger is something the rebuilt run has, and no part of the ethics check is done in `paper`. Con: until `researcher` exists a dual-use statement depends on the venue's or the user's ask.
    - (b) The draft writer rates dual use itself from the materials. Pro: the statement is written without an ask. Con: a part of the ethics check comes back into `paper`, against D42 and ADR 0022.
    - Recommendation: (a). No option is the lazy one.
  - Part 5, intake's DOI checking question (`skills/paper/references/intake.md`, "DOI checking"), asked in full, revision, citation-check and lit-review: its Strict answer stops the run at "A reference that cannot be confirmed", which D43, D48 and D49 remove from full, lit-review and revision, and its mark-only answer marks the integrity record, which the rebuilt skill does not write.
    - (a) Asked in citation-check mode only, mark-only marking the entry in `citation-report.md`; in the other modes a failed DOI is an issue of draft review round 1 or reading 1 (D44) and goes as part 2 says. Pro: no answer leads to a stop outside a mode's list. Con: full, revision and lit-review no longer offer the choice.
    - (b) Asked in every mode, Strict sending a failed DOI to the draft writer. Con: the answer then changes nothing part 2 does not already do.
    - Recommendation: (a). No option is the lazy one.
  - Recommendation: (a) for each part, since each carries out a ruling or an ADR in force on the part the step builds.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-19: Open item A, the drafted step list of `/plan 5 --self-rule`: closed under self-rule, C102.
- 2026-10-19: Open item B, the command forms of `lookup.py` cite-keys, check-urls and quote-check: closed under self-rule, C103.
- 2026-10-19: Open item C, what each mode of `paper` leaves in the manuscript's files, how it finds the `.bib`, and how a patch reaches the manuscript: closed under self-rule, C104.
- 2026-10-19: Open item D, the numbers of the `/writing` findings the user accepts and the names of a run's patch files: closed under self-rule, C105.
- 2026-10-19: Open item E, how the `/writing` findings reach `/paper` on the current dongho manuscript: closed under self-rule, C106.
- 2026-10-19: Open item F, the line of `~/.claude/CLAUDE.md` that routes manuscript content: ruled by the user, a form of (b), the line names `academic-paper` or `paper`.
- 2026-10-20: Open item G, plan 5's steps after `/grill 5` settled D42 to D59: ruled by the user, (a).
- 2026-10-20: C107, the ended academic-paper revision run's three closing decisions (step 3, review over round 1, Spec 2): closed under self-rule, (a).
- 2026-10-20: Open item H, the commands that made step 3's records: ruled by the user, (a).

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

- Design: `docs/roadmap.md` entry 5, the rulings in `plan.md` (D1 to D59, the pins of plan 5, open items A to G), ADRs 0017, 0020, 0022, 0023 and 0024. Ledger: `.scratch/5-paper/`, with `agents/briefs/` and `agents/reviews/`.
- The sources: `../research-hub/.agents/skills/academic-paper/`, `academic-pipeline/` and `deep-research/` (the coverage rows of `docs/academic-coverage.md`), `../research-hub/tools/manuscript/`, and `lookup.py` at commit 0074728. research-hub is read only; the gate's runs work on copies outside it.
- The installed skills are pinned at v8.4.0-rc.1, the release candidate of step 3 (`git -C ~/.local/share/ordo-stable describe --tags`); step 5 tags the next release candidate and pins it, and the closing tags the final release and pins it (Rulings, "The pins of plan 5").

## Current position (rewritten before every step commit of this plan)

- 2026-10-20. Step 3 of 6, the academic-paper side of the revision comparison, landed: the record `agents/reviews/3-blind-comparison.md` with the kept output, and the stopped `paper` run's messages as step 4's evidence (`agents/reviews/3-landing.md`).
- Next: step 4 of 6, the new shape of paper: `/spec 5 4`.
- Open on Axel's side: none.
