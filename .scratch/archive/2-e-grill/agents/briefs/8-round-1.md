# Step 8, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/8-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/8-round-0.diff` there. The findings are in text the brief dictated, so this round replaces that text: the wording below replaces items 1, 2 and 3 of the brief. Items 4 and 5, the rules file, the no-git rule, the paths and the report path are unchanged. The text is written exactly, with plain quotes, one line per item or bullet.

The rule is restated around the behaviour a test is listed for: a test of a behaviour the change adds or changes fails on the unchanged tree; a test of a behaviour the change preserves passes after the change. This closes Spec 1 (a new test of a preserved behaviour), Spec 2 and Spec 3 (the control of a silent case in a false-report fix: the silent case is then the changed behaviour and fails, the control is the preserved one and passes, and the table quotes the failing line), Spec 4 (a test changed for a rename: its old form ran on the unchanged tree), Spec 6 ("names no revert" is said of the report), Spec 7 (run again after every change to the test) and Standards 1 (the `/refute` bullet split into three). Spec 5 is closed by "a test that cannot fail when the behaviour it is listed for is broken", decided by the orchestrator overnight (ruling "Overnight work" 5) and booked at landing.

1. Rule 13, line 39 of `docs/dev/change-standard.md` and of `skills/repo-setup/templates/docs/dev/change-standard.md`, the same line in both, becomes exactly:

   "13. **A test proves the change by failing on the unchanged tree, and the report quotes the failure.** The unchanged tree is the tree before the change; for a plan step it is the tree at the step's base. A test of a behaviour the change adds or changes is run on the unchanged tree and fails there, and it is run there again after every change to the test. The report quotes that failure verbatim beside the test's name, and it names no revert. A test of a behaviour the change preserves, new or changed, passes after the change; the report quotes that run and, for a test that existed on the unchanged tree, its run there in the form it had. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the quoted failure comes from whichever of the two is the test of a behaviour the change adds or changes. A test that cannot fail when the behaviour it is listed for is broken is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The reviewer finds such a test by reading it. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case and the failing line quoted for it. The table covers those behaviours, not every branch or every rule a head comment states."

2. `skills/spec/templates/brief.md:62` becomes exactly:

   "4. Each test of a behaviour the change adds or changes is run on the unchanged tree and fails there, and the report quotes that failure; each test of a behaviour the change preserves passes after the change, and the report quotes that run. A test that cannot fail when the behaviour it is listed for is broken is an audit, not a proof, and this brief says which it is."

3. `skills/refute/SKILL.md` lines 107-108, the two bullets this step wrote, become three bullets, in this order, at the same indentation:

   "  - a new or changed test of a behaviour the change adds or changes with no failure on the unchanged tree quoted for it (for a case asserting that a rule stays silent, the failure of the case or of its control);"
   "  - a new or changed test of a behaviour the change preserves with no passing run after the change quoted for it;"
   "  - a test that cannot fail when the behaviour it is listed for is broken, found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs)."

4. Proof 2: the report quotes the verify runner's output verbatim, the ASCII check's full perl command line included, and the runner's exit status, captured without a pipe that hides it (for example `...checks.sh <state file>; echo "rc=$?"`).

5. Proof 1: the rule-19 reading is done again over the new text, reading rule 13's sentences against each other on three cases: a new rule with a silent case and its control; a fix of a false report (the silent case fails on the unchanged tree, the control passes there); a refactor that renames a function and changes its test. For each, the report says which test fails where and which sentence says so.

After the changes, rerun from the worktree root every case of the brief, with case 5's count now `6 files changed, 8 insertions(+), 6 deletions(-)`, the ASCII grep over the six files, and the verify list as item 4 says, and quote what they print.

Append to the same report, `.scratch/2-e-grill/agents/reviews/8-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands with their output verbatim, and the readings of point 5. Your final message is that section.
