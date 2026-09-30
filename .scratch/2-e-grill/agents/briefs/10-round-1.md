# Step 10, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/10-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/10-round-0.diff` there. The finding is in text the brief dictated, so this round replaces that text. The rules file, the no-git rule and the report path are unchanged. Plain quotes, one line per paragraph, no hard wrap.

1. Standards 1, `README.md:93`: the sentence item 4 added, "The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed with `rm -rf "$dir/<skill>"` for each folder of the list.", becomes exactly:

   "The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed from each folder of the list by hand, such as `rm -rf ~/.claude/skills/<skill>`, and for a second account `rm -rf "$CLAUDE_CONFIG_DIR/skills/<skill>"`."

2. Spec 1 is closed in the ledger by the orchestrator: the step line's check is now `git grep --untracked -n -i -E "plan-help|plan help" -- . ':!.scratch'` printing nothing. Run that command from the worktree root and quote its output and exit status.

After the change, rerun from the worktree root: the brief's "No other change" case (only README 65, 84 and 93 differ from a pure name substitution, and line 93's new sentence is the one above), the ASCII grep over `README.md`, and the verify list as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`, quoted verbatim. Reading: the new sentence against the loop above it: each command it names removes the folder a user of that account has, typed in a new terminal.

Append to the same report, `.scratch/2-e-grill/agents/reviews/10-report.md` in the worktree, a section "Repair round 1" with the change, old beside new, the commands with their output verbatim, and the reading. Your final message is that section.
