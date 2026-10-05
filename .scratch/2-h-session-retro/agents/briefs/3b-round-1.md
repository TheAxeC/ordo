# Step 3b, repair round 1

The round starts from the worktree as you left it. The findings are in `.scratch/2-h-session-retro/agents/reviews/3b-refuter.md` in the main checkout. The round makes exactly the changes below and nothing else. It has no cases to run again and quotes no other place.

1. **Spec 1.** `skills/repo-setup/templates/hooks/git_guard.test.sh`:
   - line 2: delete the last sentence, `GIT_GUARD names another script to test, such as a scratch copy with one block removed.`, and the space before it. Nothing else on the line changes.
   - line 20: `guard=${GIT_GUARD:-$script_dir/git_guard.py}` becomes `guard=$script_dir/git_guard.py`.
2. **Standards 1.** `skills/spec/templates/brief.md` line 80 goes back to its text at the base, word for word: `   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.` A new line follows it, at the same indent, word for word: `   - The reviewer finds such a test by reading it.`

Paths the round writes: `skills/repo-setup/templates/hooks/git_guard.test.sh` lines 2 and 20, `skills/spec/templates/brief.md` lines 80-81, and the report.

Run from the worktree's root, and quote each output as printed:

- `git grep -n 'GIT_GUARD' -- skills` prints nothing.
- `sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1` prints `PASS: git_guard.py scratch tests`.
- `sed -n 80,81p skills/spec/templates/brief.md` prints the two lines of item 2.
- `LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/hooks/git_guard.test.sh skills/spec/templates/brief.md` prints nothing.
- `git diff 0bef27a --stat`.

Add a section "Repair round 1" to your report: each item DONE or NOT DONE with the command and its output.
