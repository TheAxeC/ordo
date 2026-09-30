# Landing of step 14c

Roadmap entry 2.E grill; plan step 14c of the steps left (14c, 14 run again, 16), an archived plan a ruling of the user sets aside carries no ruling; next: step 14 run again.

## Open items

- None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed no subagent of this session running.

## NOT DONE

Nothing of the step.

## What landed, what was found, the usage

- Landed: `skills/grill/SKILL.md` 1.2.0. "What it reads" 6: a bullet of an archived plan that a ruling of the user sets aside is no carried ruling, for any entry, and settles and replaces nothing except the ruling that set its own plan aside. A ruling of the user is a "(the user)" bullet of a `## Rulings` section of a `plan.md`, or of a rulings file, under the ledger root. A ruling sets a plan aside when it says the plan is set aside, thrown out or stopped, or that its entry is redone, the redo reaching only a plan that stood when it was given; a ruling may set aside named bullets or steps only. A ruling that a later ruling replaces sets nothing aside, nor does any other ruling that sets aside exactly the same and is dated no later. A "carried from" bullet whose source is set aside settles nothing and is removed at the first write of Steps 8. Steps 3 and "Writing what settled" 1 carry each exception under its rule. The first round and Steps 10 list each archived plan set aside with each ruling that sets it aside; Steps 10 lists each removed "carried from" bullet. The Stops row "A round" names the new list. The term **carried ruling** in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` excludes a bullet of an archived plan a ruling of the user sets aside.
- Premise corrections: at /spec, the brief check's findings closed in the brief (`14c-brief-check.md`, and the brief's "Closed"). Cases ruling `agents/briefs/14c-cases.md`: K7 walked without the 2.C ruling, as K2 is; a ruling on where a plan's folder goes sets no plan aside.
- Review: `14c-refuter.md`, items 1 to 5 hold; K3 to K5 and K8 to K10 met, K1 and K7 partial, K2 and K6 unmet; findings Spec 1 and 2, Proof 1, Standards 1 to 6, Behaviour 1, all on the brief's dictated text, sent as repair round 1 (`agents/briefs/14c-round-1.md`). The run over the round: items and round items hold, K1 to K6 and K8 to K13 met, K7 partial; findings Proof 1 (K7's premise, closed by the cases ruling) and Standards 1 (two rules of Steps 3 without their exception).
- Fixes at landing: 2, in `skills/grill/SKILL.md` Steps 3 and "What it reads" 6. Standards 1: the exception "A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says" is a sub-bullet of the two rules that lacked it. The reviewer's declined point on reversing a partial set-aside: "sets the same plan, bullets or steps aside" became "sets aside exactly what the replaced ruling sets aside", so reversing a ruling on one bullet does not revive a plan another ruling set aside whole.
- Not changed, from the points the reviewer declined: the Stops row "The end" stays a summary; the "settles nothing" and "replaces no ruling" rules are repeated under each rule they qualify, as the qualifier rule of `docs/dev/skill-layout.md` asks; a set-aside plan's bullet that would set another plan aside, and a removed bullet a step tag names, have no case on the tree. The builder ran one read-only `git ls-tree` in the main checkout in round 0, against the brief's no-git rule; it changed nothing, and round 1 ran no git command.
- Verification on main: `sh ~/.claude/skills/land/templates/land.sh .scratch/2-e-grill/orchestrator-state.md 2e-14c e403a796007171fe3b93b2491577e26c8c18089b` exited 0 with `checks: 10 commands passed` and `3 files changed, 22 insertions(+), 4 deletions(-)`; after the fixes at landing `sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md` printed `checks: 10 commands passed`, and `LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md` printed nothing.
- A/B: none (`bench: []`). Look: none (`look:` empty).
- Usage (models from the transcripts): brief check claude-opus-5-5 153480 tokens, 34 tool uses, 432 s; builder claude-sonnet-5-5 142904 tokens, 35 tool uses, 434 s (round 0) and 189621 tokens, 15 tool uses, 298 s (round 1); reviewer claude-opus-5-5 187381 tokens, 39 tool uses, 603 s; reviewer over round 1 claude-opus-5-5 169016 tokens, 36 tool uses, 593 s.
- The builder's first report passed its bar on the dictated text: every item was written as dictated, and the findings were on the brief's text, apart from walks that left out the brief's input copy (Proof 1 of the first review). Fixes at landing: 2.
