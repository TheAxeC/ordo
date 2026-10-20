# Step 4 landing

Roadmap entry 5, paper; plan step 4 of 6, the new shape of paper, landed; next: step 5 of 6, the gate's comparisons, held by Axel's pause before step 5.

## Open items

None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed no agent of the step: the builder a94bbfd9b59503301 and the reviewers ac9aab32d59df88c5 and a3a06e920c3ffa6cd had finished.

## NOT DONE

Nothing of the step. Step 5 waits on Axel's pause.

## What landed, what was found, the agents and the fixes

- Landed: 39 files, 3020 insertions and 1157 deletions against the base 3b6d071, the landing fixes included: `skills/paper/SKILL.md` 2.0.0 with the five roles (literature strategist, planner, draft writer, visualization, peer reviewer) and the citation compliance agent of citation-check mode, Steps 1 to 14 with the compile in a copy and `/writing` at the end of full and revision, nine stops; `references/planner.md` in place of `structure-architect.md` and `argument-builder.md`; `abstract.md`, `ethics.md` and `integrity-verification.md` removed, their rules carried or sent to `researcher` (entry 13) by `docs/academic-coverage.md`; the changed pages `draft-writer.md`, `intake.md`, `peer-reviewer.md`, `citation-compliance.md`, `ai-disclosure.md`, `statements.md`, `literature-strategist.md`, `visualization.md` and `patch-file.md`; `lookup.py` and `lookup.test.sh` naming the citation report; ADRs 0017 and 0020 refined in place; `docs/figures/gen_figures.py` with `paper.svg`, `grill.svg`, `writing.svg` and `code-comments.svg`, `pipeline.svg` and `plan-loop.svg` byte-equal to the base; `docs/figures/academic-paper-comparison/gen_comparison.py` with its nine SVGs, shown in `docs/academic-coverage.md` "paper against academic-paper"; `README.md`, `docs/glossary.md`, `docs/dev/building.md` and `docs/dev/scripts.md`.
- Ticked: the run over round 1 gives every item 1 to 21 holds and every case C1 to C22 met; its six findings, none with a verdict, are fixed at landing below.
- Verify list: equal to `docs/dev/building.md`'s 10 commands with their filters, unchanged.
- Premise corrections: at /spec, step 4's line widened to outline-only and abstract-only and to the check run from the worktree, and open item I closed under self-rule (C108), its parts on the line; the brief check's other findings closed in the brief (`agents/reviews/4-brief-check.md`).
- Review: `agents/reviews/4-refuter.md`; the first run found 3 Spec, 2 Proof, 7 Standards and 1 Behaviour findings, items 4, 13, 14, 18 and 19 violated and cases C10, C12 and C16 partial; all were sent as the 12 points of repair round 1 (`agents/briefs/4-round-1.md`), Spec 2 (the second run of the checks in citation-check) and Behaviour 1 (the strategist only when no `.bib` is held) kept as built with the report stating them.
- Check run: `agents/reviews/4-check-run.md`, a fresh revision run of the rebuilt skill on step 3's input, six turns, session 475cf518-b731-48f6-947a-c4d8e1c7c6e5 on `claude-opus-5-5`. It stopped only at the intake interview, the intake confirmation and "A structural patch", started the literature strategist and the visualization agent for their items, and ended with the numbered `/writing` report and its two reply sentences; resumed with `all`, it applied F1 to F22 and compiled, then stopped outside the list to ask about a layout pass, since Steps 14 gave no rule for a compile that exits 0 with layout faults. Fixed at landing (the last fix below).
- Fixes at landing: 7. Spec 1 of the run over round 1: `references/citation-compliance.md`'s `DOI_MISMATCH` line marks an uncorrectable entry "unconfirmed" with the stop under Strict and marks it for the final message under mark-only, as `intake.md` says. Proof 1 and Standards 3: rows 191 and 235 of `docs/academic-coverage.md` and the glossary's **mark, of a figure** split into sentences under the standard's length. Proof 2: twelve label strings of `gen_figures.py` rejoined to fill their lines, every SVG byte-equal (`shasum -c` of the 15 SVGs before and after: 0 lines not OK), `ruff format --check` clean. Standards 1: `SKILL.md` Steps 11 drops "once" for `quote-check`. Standards 2: the glossary entry names the README sentences without line numbers. Behaviour 1: the builder's report states that "A reference that cannot be confirmed" and "A claim the run cannot support" are no longer stops of lit-review and revision. The check run: `SKILL.md` Steps 14 sends a layout fault (a log line starting `Overfull \hbox`, `Overfull \vbox` or `LaTeX Warning: Float too large`) to the draft writer once as `compile-fix`, one left named in the final message, and `references/patch-file.md`'s `compile-fix` row says so.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/5-paper/orchestrator-state.md 5-paper-4 3b6d071` staged the 39 paths; after the fixes `sh skills/land/templates/checks.sh .scratch/5-paper/orchestrator-state.md` printed `PASS: strip_comments.py scratch tests`, `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, the PASS lines of `anchorize_tex.py`, `apply_tex_patch.py` and `lookup.py`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, and `checks: 10 commands passed`; `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`.
- A/B: none. Look: none configured.
- Usage: brief check a40fbd6557bc65701 claude-opus-5-5 279372 tokens, 62 tool uses, 14.4 min; builder a94bbfd9b59503301 claude-sonnet-5-5 309869 tokens, 415 tool uses, 61.3 min (build) and 63477 tokens, 72 tool uses, 5.2 min (round 1); reviewer ac9aab32d59df88c5 claude-opus-5-5 116742 tokens, 103 tool uses, 15.1 min; reviewer over round 1 a3a06e920c3ffa6cd claude-sonnet-5-5 266102 tokens, 64 tool uses, 9.4 min.
- The builder's first report did not pass its bar: the first run found 13 findings, five items violated among them.

## What is next

Step 5, the gate's comparisons: a release-candidate tag of main with step 4, pinned with `utils/pin.sh <tag>`, then the comparison runs, with time estimates given first; it starts after Axel lifts the pause.
