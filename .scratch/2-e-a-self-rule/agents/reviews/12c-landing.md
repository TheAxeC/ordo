# Step 12c landing report

Roadmap entry 2.E.A, self-rule. Plan step 16 of 18 (steps 1 to 13, 6b, 11b, 11c, 12b and 12c), step 12c, steps by part and a brief that states a part. Next: step 9, the gate's `next_entry` run on a scratch repository, under ruling I and "Open item I, the separate install", then step 13, the closing.

## Open items, verbatim

None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed one agent of step 12c, the reviewer over round 1 a7fd7dbc012b4e250, as completed, and the peer session research-hub-3d. The builder a72058491ec0de347, the reviewer abdb3e585189ce92d and the brief check aeae5b2d7ddaabf54 were no longer listed. No agent of the step was running.

## NOT DONE

Nothing of step 12c. The part of the step's check that drafts step 9's two scratch plans by the new rule runs at step 9, whose run uses this step's landed and tagged text.

## What landed with the commit

- `skills/plan/SKILL.md` and `templates/plan.md`: the step list is drafted from the entry's goal as its parts; a step is a part, built by one dispatch of its executor or run by the orchestrator without an agent; bookkeeping is never a step; the number of steps follows from the parts.
- `skills/spec/SKILL.md`, `templates/brief.md` and `templates/brief-check.md`: a brief states its part by its requirements, dictating text only where the wording is the requirement.
- `skills/plan-orchestration/SKILL.md` "What earns a step of its own": new work goes by its reason.
  - A finding inside the step's part goes to a repair round.
  - A ruling on a part not yet built rewrites that step.
  - A part the entry needs that no step builds, or a landed part found wrong, becomes a new step by a ruling or a self-rule choice.
  - Work outside the entry's goal becomes a new roadmap entry through `/roadmap add`.
  - A finding that changes a public shape or an established decision is an open item.
- `references/self-rule.md`, `refute`, `land`, `ordo-help`, `spec` and `templates/orchestrator-state.md` point at that section.
- Research-hub's three test sentences and plan 2.H's six "Recurring findings" changes: in `spec` Steps 4, `templates/brief.md`, `refute`'s Spec heading and verdicts, and `refute`'s `templates/report.md`.
- The terms **step**, **part, of an entry** and **ruling** in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`.
- `utils/pin.sh` and `utils/pin.test.sh` (cases P1 to P14): the skills are linked into `~/.claude/skills`, each `~/.claude-*/skills` that is a folder and `$CLAUDE_CONFIG_DIR/skills`, each folder once, and the agents into the `agents` folder of each of those config folders. Every entry is a link into the pinned worktree, and no folder is linked to another. A real folder or a link outside Ordo in such a folder, and a `~/.claude-*/skills` path holding a newline, are refused before anything changes. README's pin section says so.
- Versions: plan, spec, refute, repo-setup and ordo-help 2.0.0, plan-orchestration 3.0.0, land 1.9.0.
- 18 files.

## What was found

- The builder's first run of the cases handed back three points. They were ruled in `agents/briefs/12c-cases.md`.
- The first review found eight points, each closed in repair round 1, among them a `~/.claude-*` name holding a newline moving the pinned worktree before the pin failed, and a config folder whose `skills` links to another folder losing its effort agents.
- The run over the round found every ruling done. Its seven points were closed at landing: six fixes and one statement in the booking, each in `agents/reviews/12c-refuter.md` "Closed".
  - P14 now names a `CLAUDE_CONFIG_DIR` folder outside the glob.
  - `utils/pin.sh` sets `default_dirs=` first, so a variable of that name in the environment no longer moves the agents under `ORDO_SKILL_DIRS`.
  - README says the newline refusal stops check mode too.
  - The glossary's **part, of an entry** names `spec`, Steps 4.
  - Two statements of the builder's report corrected.
  - Under `ORDO_SKILL_DIRS`, two agents folders that resolve to one folder are now named once (before: `pinned: 1 agents linked in: <S>/a/agents, <S>/b/agents`; after: `pinned: 1 agents linked in: <S>/a/agents`), stated in the booking.
- Host-visible: check mode on a machine with a `~/.claude-*` folder whose links are out of date now fails until the next pin. On this machine that is `~/.claude-work`, read from the code and `ls`, not run against the real home folder.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, after the fixes at landing, exit 0:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

## Usage, the first report's bar, the fixes at landing

- Brief check aeae5b2d7ddaabf54, claude-opus-5-5: 246593 tokens, 57 tool uses, 10 min 29 s.
- Builder a72058491ec0de347, claude-sonnet-5-5: 229901 tokens, 37 tool uses, 9 min 7 s (the first run of the cases); 129372 tokens, 139 tool uses, 76 min 54 s (the build); 302740 tokens, 74 tool uses, 21 min 13 s (round 1, over three resumes).
- Reviewer abdb3e585189ce92d, claude-opus-5-5: 307459 tokens, 65 tool uses, 21 min 54 s.
- Reviewer over round 1 a7fd7dbc012b4e250, claude-sonnet-5-5: 255179 tokens, 61 tool uses, 26 min 28 s.
- The builder's first report did not pass its bar: eight findings went to repair round 1.
- Fixes at landing: 6.

## What is next

Step 9: main's head tagged `v2.8.0-rc.1` and pinned, which needs your yes, then the gate's `next_entry` run on a scratch repository, and the pin restored to v2.7.0.
