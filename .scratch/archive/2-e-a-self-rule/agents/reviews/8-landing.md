# Step 8 landing report

Roadmap entry 2.E.A, self-rule. Plan step 9 of 14 (steps 1 to 13 and 6b), step 8, the terms of D24. Next: step 9, the gate's `next_entry` run on a scratch repository.

## Open items, verbatim

None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed no agent of this session, only the peer session research-hub-aa: the builder a8e821b5b3f0e2756 and the reviewers aa9c2761143a81412 and adeb36a8bdd6bc53b had finished, each with its completion notice.

## NOT DONE

Nothing of step 8. `~/.claude/CLAUDE.md` still holds ruling B's sentence; ruling H has the user put the new sentence there.

## What landed with the commit

- The terms **self-rule** and **choices file**, and the amended **open item**, **ruling** and **stop**, in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`.
- The four "only the user can decide" sentences of `land`, `diagnose` and `plan-orchestration` Steps 9, and the "Stops" lines of `plan-orchestration`, saying a decision for the user.
- Ruling H's sentence at `skills/repo-setup/templates/shared-rules.md:20`.
- 6 files, 18 insertions, 14 deletions.

## What was found

- The first review found six findings (Spec 1, Proof 1, Standards 1 to 4), ruled in `agents/briefs/8-round-1.md`.
- The run over round 1 gave each ruling "holds" and found one passage of the builder's report left stale, fixed at landing.
- The merge with step 7 met a conflict in `plan-terms.md` and `docs/glossary.md` (two adjacent terms); both changes were kept and the glossary synced from the template.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, after the merge and the fix at landing, printed the nine `PASS:` lines, `ok: the plan-terms block equals the template`, the ASCII check with no output and `checks: 11 commands passed`, exit 0. `grep -rn 'only the user can decide' skills docs README.md` prints nothing. A/B: none (`bench: []`). Look: none (`look:` empty).

## Usage, the bar, the fixes at landing

- Brief check ad359a1df2ce3b5fe, claude-opus-5-5: 186342 tokens, 49 tool uses, 8 min 23 s.
- Builder a8e821b5b3f0e2756, claude-sonnet-5-5: 136333 tokens, 25 tool uses, 4 min 4 s (the build); 161990 tokens, 10 tool uses, 2 min 27 s (round 1).
- Reviewer aa9c2761143a81412, claude-opus-5-5: 179218 tokens, 54 tool uses, 9 min 3 s.
- Reviewer over round 1 adeb36a8bdd6bc53b, claude-sonnet-5-5: 144807 tokens, 29 tool uses, 4 min 47 s.
- The builder's first report did not pass its bar. Fixes at landing: 1.

## What is next

Step 9, the gate's `next_entry` run on a scratch repository whose roadmap holds two small entries.
