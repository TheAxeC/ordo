# Step 12, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/12-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/12-round-0.diff` there. The rules file, the no-git rule and the report path are unchanged. The paths widen to the files named below. Wording is yours unless a text is given exactly; plain quotes, ASCII, one line per bullet or table row, no history. Line numbers are the worktree's as it stands now.

1. Spec 1, the effort checks. Before the first lookup agent starts, `grill` checks as the `spec` skill's Steps 1 does that the runner lists the effort agent `ordo-<reviewer_effort>` and that `CLAUDE_CODE_EFFORT_LEVEL` is unset (`printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1). Either check failing does not end the interview: the lookups are made by the session's own reads, and the next round says so with the cause (the missing agent, or the variable's value). Add a Stops row for it only if it waits on the user; otherwise it is an item of "Steps / Looking up a fact".

2. Spec 2: a clash with a term of the plan-terms block is never changed by `grill` in any copy of the `repo-setup` skill. It is put to the user as a decision; its answer is written as a Rulings bullet, and the end (Steps 10) lists it as a change for the user to make in the Ordo repository's `skills/repo-setup/templates/plan-terms.md`.

3. Spec 3: the roadmap-diff, "record as ADR?", rule-clash and term decisions are decisions about this repository's own pages. Their reference line is labelled "Rule:" and cites the page that governs them (the `roadmap` skill's Rules, the ADR folder's `README.md`, the glossary entry); the design bar and `design_references` do not apply to them. State this once, in "The decision form", and make "The design bar" say it applies to design decisions only.

4. Spec 4: for an entry under "Not yet specified", no gate is drafted into the entry (item 3 of "Writing what settled" excludes it); the settled gate is its Rulings bullet, and the end prints the gate's text whole beside `/roadmap add <entry>`, for the user to give that command.

5. Spec 5: with a plan open, an answer that changes the entry's goal or gate is also listed at the end (Steps 10, "Steps / A plan already open") with the lines of `plan.md`'s "## Goal" or "## Gate" it changes, for the user to rule on.

6. Spec 6, resuming: an answer that names a number the current session has not shown is not read; the skill says so and shows its current round again. State it in Steps 7 and in the Resuming bullets of Steps 3.

7. Spec 7 and Behaviour 1: the report gains a section "Judgment calls" listing every choice the brief left open that you took (the required and optional key split, the heading `# Rulings: <entry>`, the extra Use instead row `/ordo-init`, "What it reads" 8, the Rules bullet "A decision is the user's", and any new one in this round), each with what you chose and why; and a section on the host-visible effect of the plan-terms change: the next `/repo-setup sync` in every repository with the block (game-engine, cathedra) writes the new and changed entries into its glossary, with the before and after lines.

8. Proof 1 and Standards 1: in each subsection of Steps ("Looking up a fact", "Terms and claims", "An answer that contradicts", "A plan already open"), every item ends on its own completion criterion ("The item is done when ..."), as "Writing what settled" does, and the separate last "The step is done when" items are removed. The report's layout reading is redone and says what it found.

9. Standards 2 and Proof 2: the entry **round, of an interview** in `skills/repo-setup/templates/plan-terms.md` becomes: "one message in which `grill` asks the whole frontier, ending the turn to wait for the answers. Inside `grill` the bare "round" means this; elsewhere it is a repair round. Stated in: `grill`, Steps 6." (keep the pointer correct). Then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`.

10. Standards 3: "ruling E (b)" is removed from the skill (`SKILL.md:134`, `:171`); each place names the ADR folder's `README.md`, which states the superseding rule.

11. Standards 4: the reason at `SKILL.md:83` becomes general: a `D<n>` inside a line can cite a decision of another interview or plan.

12. Standards 5: no bold outside a list item's label (`SKILL.md:63` and anywhere else).

13. Standards 6: where a Steps item restates a Rules bullet (`:110` with `:223`, `:93` with `:225`), the item names "Rules" instead of restating it.

14. Standards 7: every settled answer writes its Rulings bullet, the roadmap-diff, "record as ADR?", rule-clash and term decisions included; say so in "Writing what settled" item 1, and in `references/decision-form.md` add D6's bullet (`- D6 Record D5 as an ADR (2026-09-30): record it (the user).`) before the record is written. Also make the example's closing consequences concrete, since D5 states none.

15. Standards 8: the recommendation's reason, and a record's "alternatives rejected", are argued from the repository's own goals, as the ADR folder's `README.md:3` and the design-principles page say; the reference line is the evidence the options are weighed with and never the reason by itself. Say it in "The decision form" (Recommendation) and in "Writing what settled" item 4; the example's reasons follow it.

16. Standards 9: the lookup agent runs on `reviewer` and `reviewer_effort`, so their descriptions name it: `skills/plan/templates/plan.yaml:12` and `:27`, `skills/plan/templates/orchestrator-state.md:14` and `:27`, `.agents/plan.yaml:10`, and the glossary entries **effort agent** and **reviewer** in `skills/repo-setup/templates/plan-terms.md` (then the sync). The comment text stays short; `check_config.py` and its test read no comment text (confirm with a grep and say so).

17. Standards 10: **frontier** says a decision waiting on a running lookup is in the frontier but not yet asked; keep the skill and the entry saying the same.

After the changes, rerun from the worktree root: the brief's cases, `git grep -n "ruling E" -- skills` (expect nothing), `grep -n -w -o round skills/grill/SKILL.md | wc -l` with the glossary entry read beside it, the glossary sync check, the description length, the ASCII grep over every changed file, and the verify list as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`, quoted verbatim.

Append to the same report, `.scratch/2-e-grill/agents/reviews/12-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands with their output verbatim, and the readings. Your final message is that section.
