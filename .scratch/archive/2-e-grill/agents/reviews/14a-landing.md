# Landing of step 14a

Roadmap entry 2.E grill; plan step 14a of the steps left (14a, 14b, 14 run again, 16), `grill` carries rulings booked elsewhere, asks each part of an existing goal and gate, and states a count only from a full list; next: step 14b.

## Open items

- Step 14a, an archived plan the entry has since set aside (raised 2026-09-30 from the run over repair round 1, `agents/reviews/14a-refuter.md`, Behaviour 3). `skills/grill/SKILL.md` "What it reads" 6 now makes every "(the user)" bullet of an archived plan of the entry a carried ruling. When an entry whose plan closed and was archived is later redone, `/grill` would list the old plan's rulings as settled answers and ask none of them, and a new ruling that contradicts one would be shown as a rule clash on every run. This tree is not affected today: plan 3's folder was deleted, not archived (2.C `plan.md`, Decision B). Options:
  - (a) Carry an archived plan's bullets only when the entry has neither an open plan nor a rulings file. Pro: the first `/grill` after the closing carries them, and later runs read the copies. Con: a rulings file written before this change, such as `.scratch/rulings/3-the-writing-base.md`, never gets them; an entry that gets a rulings file for any reason stops seeing its archived rulings.
  - (b) Keep the rule, and add that a ruling that sets an archived plan of the entry aside (a bullet ending "(the user)" that says the entry is redone, or that the plan is set aside) makes that plan's bullets settle nothing; judged by reading. Pro: rulings of a closed plan still count unless you set them aside, and setting them aside is itself a ruling of yours. Con: it depends on such a ruling being written when an entry is redone.
  - Recommend (b): it keeps your rulings in force by default and ends them only by your own ruling, which is the step's purpose. The lazy option is to leave the text as it is.

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed one subagent, the reviewer over round 1, `completed`; no builder or reviewer of the step was running.

## NOT DONE

Nothing inside the step. The step line's check "step 14 run again passes" is step 14's, after step 14b.

## What landed, what was found, the usage

- Landed: `skills/grill/SKILL.md` 1.1.0. "What it reads" 6 reads every other Rulings section and rulings file under the ledger root for bullets that name the entry and end "(the user)", and every "(the user)" bullet of an archived plan of the entry; such a bullet is a carried ruling. Steps 3 marks the decisions a carried ruling settles as settled and lists them, quoted with their `path:line`, in the first round (Steps 6) and at the close (Steps 10); what a round says of a carried ruling comes only from its quoted words; a replaced ruling settles nothing; a contradiction is a rule clash. An entry that has a goal gets one decision per part of its current goal, gate and what must be known, kept, changed or dropped. Steps 5 states a count only from a lookup that listed every item. "Steps / Writing what settled" 1 writes each carried decision as a bullet ``carried from `<path>:<line>` (the user)``. `archive_root` is a required key of `grill`, and the open plan is found by the exact title test. **carried ruling** is a new plan term and **design tree** is redefined, in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`. 3 files, 44 insertions, 7 deletions against the base 16c5f37, fixes at landing included.
- Premise corrections (at /spec): the brief check's 17 findings closed in the brief (`14a-brief-check.md`, and the brief's "Closed"), among them the input of R1, R2 and R6 set to the tree at 833e2e8 (copies in `agents/briefs/14a-input-833e2e8/`); the brief's line of the ruling "Entry 3 and step 13" corrected to `plan.md:127` after the first review.
- Review: `14a-refuter.md`, items 1 to 11 hold, R1 to R17 met, R18 partial; findings Spec 1 (the brief's line number, corrected in the brief), Proof 1 (the builder's report on `check_config.py`, which does require `archive_root`; closed by round ruling 1), Standards 1 to 3 and Behaviour 1, sent as repair round 1 (`agents/briefs/14a-round-1.md`). The run over the round: items 1 to 11 hold, R1 to R18 met; findings Behaviour 1, Spec 2, Spec 4 and Standards 5 fixed at landing, Behaviour 3 raised as an open item.
- Fixes at landing: 4, all in `skills/grill/SKILL.md`. Behaviour 1: "opens with `# Plan: <entry>`" was a prefix test (`/grill 15` would carry 15.A's archived rulings); "What it reads" 6 and its archived-plan line now use `session-retro`'s exact title test. Spec 4: the archived-plan line's second "whose" could attach to the section; reordered so it attaches to the bullet. Standards 5: the limit on writing a carried ruling stood in two places with different scope and was missing where the write happens; it is now one sub-bullet under "Steps / Writing what settled" 1, and "What it reads" 6 points there. Spec 2: a ruling that replaces the entry's own bullet did not reach the carried ruling behind it, so a reopened decision came back as a clash; a sub-bullet in Steps 3 makes such a ruling replace every carried ruling on the same decision.
- Raised as an open item: Behaviour 3 of the run over the round, an archived plan the entry has since set aside (state file, Open items).
- Verification on main: `sh ~/.claude/skills/land/templates/land.sh .scratch/2-e-grill/orchestrator-state.md 2e-14a 16c5f3702eabb6a35bd6a182ef2e94c595563d81` exited 0 with `checks: 10 commands passed` and `3 files changed, 43 insertions(+), 7 deletions(-)`; after the fixes at landing `sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md` printed `checks: 10 commands passed`, rc=0, and `LC_ALL=C grep -c '[^ -~]' skills/grill/SKILL.md` printed 0.
- A/B: none (`bench: []`). Look: none (`look:` empty).
- Usage (models from the transcripts): brief check claude-opus-5-5 176162 tokens, 40 tool uses, 524 s; builder claude-sonnet-5-5 171803 tokens, 33 tool uses, 472 s (round 0) and 202604 tokens, 10 tool uses, 189 s (round 1); reviewer claude-opus-5-5 186088 tokens, 46 tool uses, 556 s; reviewer over round 1 claude-opus-5-5 191514 tokens, 42 tool uses, 613 s.
- The builder's first report did not pass its bar: the review found `archive_root` made optional against every other page, three bullets joining two rules, the carried write stated without its limit, and an archived plan's rulings left unread (R18 partial). Fixes at landing: 4.

## Next

Step 14b (ruling "The judge's input in the blind comparison"), then step 14 run again on the tree at 833e2e8, then step 16, the closing.
