# Step 2b, repair round 1

The refuter report is `.scratch/2-g-git-guard/agents/reviews/2b-refuter.md` in the main checkout. It has four findings, each ruled below. The work is in the same worktree, `.agents/worktrees/2g-2b`, under the same brief and the same rules: no git command that changes state, no command that needs a permission prompt, and no file text passed to a shell inside double quotes. "The guard" is `skills/repo-setup/templates/hooks/git_guard.py` and "the test" is `skills/repo-setup/templates/hooks/git_guard.test.sh`.

## Rulings

1. Proof 1, no case has the subtree command after a long option written `--name=value`. In the test's case file, after the line `block git subtree push --prefix=sub origin main`, add the line `block git subtree --prefix=sub push origin main`. It is seen red first: on a scratch copy of the guard in which a long option word holding `=` ends the options in `_rule_subtree`, run as `GIT_GUARD=<copy> sh <test>`, the new line fails, and the report quotes that line.
2. Proof 2, no case has `--branch` or `--message` in its long form. After the line added by ruling 1, add the lines `block git subtree --branch br -P sub push origin main` and `block git subtree --message msg --rejoin -P sub push origin main`. Each is seen red first: on a scratch copy of the guard with "branch", and then with "message", left out of the long names of `_SUBTREE_VALUED`, and the report quotes each failing line.
3. Standards 1, two clauses of line 5 of the test's head comment. In that line, "--annotate -b --onto, --p, --pr and --" becomes "--annotate -b --onto, --branch, --message --rejoin, --p, --pr and --", and "stash drop (also with -q or a stash name, and behind env) and stash clear" becomes "stash drop (also with -q or a stash name) and stash clear (also behind env)". With the line of ruling 1 the clause "--prefix=" is borne out. Reread the whole of line 5 against the case file after the change, clause by clause, and give the case line for each clause in the report.
4. Standards 2, three semicolons the step's own wording added to the guard's head comment. Each becomes a full stop, the text otherwise kept and the paragraph wrapped again within 100 columns:
   - "and -- before the subcommand); the word subtree is matched" becomes "and -- before the subcommand). The word subtree is matched".
   - "(-f, -qf, -fb; the rest of the word after b or B is the new branch's name, as in -bfix)." becomes "(-f, -qf, -fb). The rest of the word after b or B is the new branch's name, as in -bfix."
   - "(-f, -qf, -fc; the rest of the word after c or C is the new branch's name, as in -cfix)." becomes "(-f, -qf, -fc). The rest of the word after c or C is the new branch's name, as in -cfix."

## Verify before you report

Every check of the brief's "Verify before you report" is run again on the changed tree, the verify list through `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-g-git-guard/orchestrator-state.md`, the test under both Pythons, and ruff and pyright on the guard. The report gives the count of semicolons in the guard's head comment before and after.

## Report

Append a section "Repair round 1" to `.scratch/2-g-git-guard/agents/reviews/2b-report.md` in the worktree: each ruling with what changed (file and line), the red line seen first for rulings 1 and 2, and the output of each check. Anything not done is stated first.
