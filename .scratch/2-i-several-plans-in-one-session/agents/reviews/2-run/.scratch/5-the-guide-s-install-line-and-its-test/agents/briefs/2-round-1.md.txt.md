# Repair round 1 of step 2

The findings of `agents/reviews/2-refuter.md`, each with its ruling. Work in the same worktree, under the same brief and rules; the paths of the brief stand. Fix each, rerun the brief's "Verify before you report" (Verify 1, 2, 4 and 5, and the cases of "Cases" under `sh` and `dash`), and rewrite the report at the same path with a section "Repair round 1" that gives each finding's change and the checks' lines.

1. Standards, `tests/guide.test.sh` lines 16-19: the four facts (the title checked before the tabs, only the first rule broken printed, `<file>` printed as given, what `<n>` is) become `# - ` list items under a lead line that ends with a colon, in the shape of the comment's `Input:` and `Output:` lists, as the prose standard's sections D and F ask. The facts keep their meaning; no fact is added or dropped.
2. Proof 1, the report's first line and its section "Anything in the brief that was wrong or impossible": the land skill's `templates/checks.sh` runs each verify command as `bash -o pipefail -c '<command>'`, under which `sh tests/guide.test.sh 2>&1 | tail -1` exits 1 on a failing file and 0 on a passing one, and the rules file's section "Commands and their filters" names a filter under `pipefail` as the form. The report states those facts with the runs that show them, under `bash -o pipefail -c` and under plain `sh`, and no longer calls the line a conflict with the rules file or a point for a substitute. The first line follows from that.
3. Proof 2, the report's V5 names the head comment as lines 1-22; it gives the line range the comment spans after this round, as `sed -n` shows it.

No other change. ASCII only, no tab in any file, the report included.
