# Step 6, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/6-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/6-round-0.diff` there. Each point below carries the orchestrator's ruling, and where it gives new wording, that wording replaces item 1's dictated text of the brief. The brief's other text, the rules file, the no-git rule, the paths and the report path are unchanged.

1. Spec 1 (Keyboard, "The last four"). The last sentence becomes "These four criteria are checked by reading at review."
2. Spec 2 (Contrast, the exemptions). The sentence becomes "The exemptions of 1.4.3 and 1.4.11 hold, such as an inactive control, pure decoration and a logotype."
3. Spec 3 (2.4.3). The sentence becomes "Focus moves in an order that preserves meaning and operation (2.4.3)."
4. Spec 4 (2.4.7). The sentence becomes "Keyboard focus shows a visible focus indicator (2.4.7), and the focused control is never entirely hidden by the page's own content (2.4.11)."
5. Spec 5 (1.4.1). The sentence becomes "A state or a difference shown by colour is also shown by another visual means, such as text, a shape, a pattern or an icon (1.4.1)."
6. Spec 6 (2.1.1). The sentence becomes "Every action a pointer performs can be performed from the keyboard, with no timing required between keystrokes, unless the action depends on the path the pointer draws (2.1.1)."
7. Standards 1 (Contrast, the long first sentence). It becomes two sentences: "Every pair of a text colour and the background it can be painted on, under every theme, has a contrast ratio of at least 4.5:1, and 3:1 for large text (success criterion 1.4.3)." and "Large text is at least 18 point, or 14 point bold."
8. Standards 2 (Styling, "a rule"). "fails a rule that reaches into a component" becomes "fails a style rule that reaches into a component".
9. Proof 1 (the runner's lines). The report quotes the runner's output verbatim, the full perl command line included, with nothing abbreviated.
10. Proof 2 (the reading cases). The report's table gains one row per reading case of the brief, each with its evidence: for the WCAG-wording case, the normative text of each cited criterion from https://www.w3.org/TR/WCAG22/ (fetch it), quoted beside the page's sentence that cites it, and its level; for the opening case and the no-restatement case, what was read against what.
11. Behaviour 1 (`typescript.md:48`). The report's "Files" gives the line before and after, verbatim.

After the changes the Keyboard and Contrast bullets have six sentences each; no bullet has more. Rerun from the worktree root `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, every grep case of the brief, and `wc -l` on the page, and quote the lines they print.

Append to the same report, `.scratch/2-e-grill/agents/reviews/6-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands and their output verbatim. Your final message is that section.
