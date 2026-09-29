# Step 4, round 0: ruling on the cases

The builder's first run found that case 3 (`git grep -n -e --built -- ':!.scratch' ':!docs/roadmap.md'` prints nothing) cannot hold while item 3's `unknown-option` case holds the literal `--built`. The same grep, with those same exclusions, is a clause of roadmap entry 2.C's gate, which the user approved, so the fix does not widen the grep's exclusions.

Ruling: the `unknown-option` case of `utils/check_coverage.test.sh` holds no `--built`. It proves the rule of item 2, which refuses every argument that starts with `-`, with other dash arguments: `--bogus` as the first argument, `-q` as the last, and `--x` as the only argument, each expecting exit 2 and the exact message line `usage error: <argument>: not an argument this script takes`. The refusal of `--built` itself is proved by the plan's check, run by hand and quoted in the report: `python3 utils/check_coverage.py --built paper docs/academic-coverage.md x y; echo $?` prints `usage error: --built: not an argument this script takes` and `2`. Item 3 of the brief is read with this ruling; case 3 stands as written.

The builder's two extra runs are accepted in this form (the edge cases of change-standard rule 15, and the check-first order the docstring states).

Then finish the step: item 4, the verify list through `checks.sh`, the revert proof for `unknown-option` (the refusal removed in a scratch copy turns the case red, the FAIL line quoted), the after run of the real list, and the report with this ruling in its cases section.
