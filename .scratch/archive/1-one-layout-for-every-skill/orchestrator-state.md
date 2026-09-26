# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 1 of `docs/roadmap.md`, one layout for every skill. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_skill_layout.test.sh 2>&1 | tail -1
- sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
- python3 utils/check_skill_layout.py
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md] # files every brief tells the builder to read in full.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: inline             # ruled: the orchestrating session writes every step itself in the step's worktree.
worker: claude:opus          # the default worker.
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent (ruled).
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 1           # one step in flight.
bench: []                    # no A/B.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- none.

## Booked, no ruling needed

- none.

## Closed items

- 2026-09-23: the executor is inline for every step (`plan.md:43`, Rulings (2026-09-23)).
- 2026-09-23: `/refute` runs as a fresh read-only reviewer agent on every step, approved by the user (`plan.md:44`).
- 2026-09-23: the step list approved as drafted (`plan.md:45`).
- 2026-09-23: `docs/dev/skill-layout.md` approved as written, the ASCII check allowing the green checkmark in Markdown files only, and no further approval stops (`plan.md:46`). The clash of the green checkmark with the ASCII check, which the audit's finding 6 (`.scratch/reviews/2026-09-24-audit/1-process-audit.md`) names as never booked in the open items, ended with this ruling.
- 2026-09-23: `__x__` counts as bold for the layout check, ruled by the orchestrator at step 2's landing (`plan.md:47`).
- 2026-09-23: a new script's test joins `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list in the step that adds the script, ruled by the orchestrator at step 2's landing (`plan.md:48`).
- 2026-09-23: a row of a rule inventory covers one rule, and the old commit is a hexadecimal id, ruled by the orchestrator in step 3's repair round (`plan.md:49`).
- 2026-09-23: an old frontmatter-only line maps to Quick start in a rule inventory, ruled by the orchestrator in step 4's repair round (`plan.md:50`).
- 2026-09-23: the tables the layout requires restate nothing, ruled by the orchestrator in step 5's repair round (`plan.md:51`).
- 2026-09-23: the unfixed findings of the run over the last repair round are booked as their own step in the booked list, never in the open items, ruled by the user (`plan.md:52`). The contradiction in refute's old sentence, which the session raised at 13:45:33Z and which the audit's finding 6 (`.scratch/reviews/2026-09-24-audit/1-process-audit.md`) names as never booked in the open items, ended with this ruling.
- 2026-09-23: nothing is installed into the user's skill folders, pinned or removed without the user's explicit permission, ruled by the user (`plan.md:53`).
- 2026-09-23: a row of a rule inventory may name one heading line alone, ruled by the orchestrator in step 9's repair round (`plan.md:54`).

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: a named thing is its whole (a skill is its folder, templates included); never take the lazy option (no rule dropped to make a layout fit); no claim about state without a command in the same turn; plain prose, ASCII, no history in a rule file.
- `docs/dev/change-standard.md`, in full.
- The installed skills are pinned at v1.0.0 in `~/.local/share/ordo-stable`; nothing in this plan edits the pinned worktree, and the skills that run this plan are the pinned ones.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time.
- Commits: a capitalised imperative subject, a blank line, `- Verb ...` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.

## Verification, every step

- The `verify` commands above, from the repository root of the worktree and again on main.
- From step 2 on: `python3 utils/check_skill_layout.py <skill>` for the step's skill; from step 3 on: `python3 utils/check_rule_inventory.py <inventory>` for the step's inventory.
- Every step: `git status --short` shows nothing of the step's after its commit.

## Where things are

- Design: `docs/dev/skill-layout.md` (step 1). Ledger: `.scratch/1-one-layout-for-every-skill/`, with `agents/briefs/` and `agents/reviews/`. Inventories: `.scratch/1-one-layout-for-every-skill/inventories/<skill>.md`.
- The skills: `skills/<name>/SKILL.md` and their templates.
- Must not be disturbed: `~/.local/share/ordo-stable` and the links in `~/.claude/skills`, `~/.claude-work/skills` and `~/.agents/skills`.

## Current position (rewritten before every step commit)

- 2026-09-23. Steps 1 to 14 landed (971121b, 84ce1f7, 836f5c5, ea8d02d, a682c14, e4950d0, e643b34, 0fa6d65, aa7cfe2, e6300be, 9eda91c, 709fcf6, fe1f5e7, bd51f8b); step 15, the closing, is the commit that carries this line. The plan is closed and this folder archived.
- Verified: the verify list last ran on main at step 14's landing, bd51f8b (session log `~/.claude-work/projects/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f.jsonl`, line 3146, 15:09:26Z). There the scratchpad script printed seven `PASS:` lines, ten `ok:` lines and `verify exit 0`. Each test's exit status was masked by `| tail -1` (`.scratch/reviews/2026-09-24-audit/1-process-audit.md`, "Did the verification actually prove green?"). The script ran the ASCII check last, with no filter and `|| { echo "RED: exit $?"; exit 1; }` after it, so its exit 0 carried the ASCII check's own status. At the closing the session ran the layout check, the inventory check and their tests (session log line 3179, 15:10:59Z). It also ran the ASCII check, which printed `ascii exit 0` (session log line 3204, 15:11:52Z). The re-run at a866716 (`.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/15-rerun.md`, "Commit a866716") shows these `PASS:` lines, each test exiting 0: `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: pin.sh scratch tests`. Its ASCII check prints nothing and exits 0. Its layout check, `python3 utils/check_skill_layout.py`, prints 10 `ok:` lines and exits 0. Its inventory check over the tree's 10 inventories prints 10 `ok:` lines and exits 0.
- Next step: none; the plan is closed. Next on the roadmap: entry 2.
- Open on Axel's side: none.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2 | built by the orchestrating session; the orchestrator columns include the build | 76,850 tokens, 17 tool uses, 3.7 minutes; round 1: 86,415 tokens, 19 tool uses, 4.6 minutes | 1 | 23 | +559 | no | 9 (7 by an edit, 2 by the orchestrator's ruling) | 0 | 33 | 40797 | 69233 | 13667350 | 70 | 18 | none |
| 3 | built by the orchestrating session; the orchestrator columns include the build | 89,514 tokens, 19 tool uses, 4.7 minutes; round 1: 91,423 tokens, 16 tool uses, 5.7 minutes | 1 | 22 | +864 | no | 7 | 0 | 36 | 69387 | 96719 | 18024585 | 76 | 26 | none |
| 4 | built by the orchestrating session; the orchestrator columns include the build | 92,952 tokens, 15 tool uses, 4.0 minutes; round 1: 94,577 tokens, 14 tool uses, 3.5 minutes | 1 | 19 | +313 -35 | no | 9 | 0 | 23 | 46479 | 71639 | 13495331 | 50 | 16 | none |
| 5 | built by the orchestrating session; the orchestrator columns include the build | 75,951 tokens, 13 tool uses, 3.9 minutes; round 1: 77,584 tokens, 16 tool uses, 2.9 minutes | 1 | 15 | +110 -13 | no | 2 | 0 | 10 | 20095 | 32627 | 6379102 | 24 | 11 | none |
| 6 | built by the orchestrating session; the orchestrator columns include the build | 80,568 tokens, 15 tool uses, 3.2 minutes; round 1: 79,004 tokens, 16 tool uses, 3.6 minutes | 1 | 18 | +167 -36 | no | 6 | 0 | 15 | 29490 | 47377 | 10216027 | 34 | 13 | none |
| 7 | built by the orchestrating session; the orchestrator columns include the build | 85,010 tokens, 12 tool uses, 3.0 minutes; round 1: 89,359 tokens, 16 tool uses, 3.5 minutes | 1 | 19 | +195 -24 | no | 3 | 0 | 22 | 32213 | 55635 | 16227400 | 48 | 14 | none |
| 8 | built by the orchestrating session; the orchestrator columns include the build | 88,124 tokens, 13 tool uses, 3.2 minutes; round 1: 84,875 tokens, 18 tool uses, 2.7 minutes | 1 | 15 | +169 -22 | no | 5 | 0 | 11 | 27065 | 41660 | 8629012 | 26 | 11 | none |
| 9 | built by the orchestrating session; the orchestrator columns include the build | 69,187 tokens, 14 tool uses, 1.9 minutes; round 1: 86,745 tokens, 23 tool uses, 4.4 minutes | 1 | 7 | +125 -7 | no | 4 (2 by an edit, 2 by the orchestrator's ruling) | 0 | 14 | 22128 | 33413 | 11517208 | 32 | 12 | none |
| 10 | built by the orchestrating session; the orchestrator columns include the build | 85,289 tokens, 14 tool uses, 2.6 minutes; round 1: 81,729 tokens, 11 tool uses, 2.2 minutes | 1 | 25 | 2 files changed, 166 insertions(+), 38 deletions(-) | no | 6 | 0 | 11 | 24522 | 40770 | 9450742 | 26 | 9 | none |
| 11 | built by the orchestrating session; the orchestrator columns include the build | 90,401 tokens, 13 tool uses, 2.7 minutes; round 1: 72,089 tokens, 13 tool uses, 1.9 minutes | 1 | 15 | 2 files changed, 176 insertions(+), 31 deletions(-) | no | 3 | 0 | 11 | 23328 | 41676 | 9899462 | 26 | 8 | none |
| 12 | built by the orchestrating session; the orchestrator columns include the build | 82,652 tokens, 13 tool uses, 2.3 minutes; round 1: 74,128 tokens, 19 tool uses, 2.6 minutes | 1 | 12 | 2 files changed, 133 insertions(+), 20 deletions(-) | no | 2 | 0 | 10 | 17957 | 32447 | 9374598 | 24 | 10 | none |
| 13 | built by the orchestrating session; the orchestrator columns include the build | 104,626 tokens, 19 tool uses, 4.9 minutes; round 1: 77,668 tokens, 16 tool uses, 2.7 minutes | 1 | 17 | 1 file changed, 95 insertions(+), 42 deletions(-) | no | 3 (a fourth needed no fix) | 0 | 25 | 31020 | 100856 | 4783481 | 54 | 14 | none |
| 14 | built by the orchestrating session; the orchestrator columns include the build | 77,290 tokens, 19 tool uses, 2.5 minutes; round 1: 62,927 tokens, 15 tool uses, 2.0 minutes | 1 | 6 | 3 files changed, 14 insertions(+), 4 deletions(-) | no | 0 | 0 | 24 | 20314 | 45537 | 3386091 | 52 | 10 | none |
