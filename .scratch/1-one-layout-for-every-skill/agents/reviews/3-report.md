# Step 3 report: the rule inventory check

Everything in the brief is done, with the format the orchestrator's ruling in step 3's repair round narrowed (one rule per row).

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `sh utils/check_rule_inventory.test.sh 2>&1 \| tail -1` | DONE | `PASS: check_rule_inventory.py scratch tests` |
| 2 | a case per rule and error form, a complete inventory passing, fence cases with controls, each case's revert run | DONE | the reverts and their reds are quoted in the repair round table below and in `3-refuter.md`'s Closed section |
| 3 | the verify list and `check_skill_layout.test.sh` | DONE | `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`; the ASCII check prints nothing and exits 0 |

Files, as they land: `utils/check_rule_inventory.py` 390 lines, `utils/check_rule_inventory.test.sh` 470 lines, both new; `README.md` +2, `docs/dev/building.md` +1, `docs/dev/change-standard.md` +1.

User-visible change. Before: no inventory check. After: `python3 utils/check_rule_inventory.py <inventory.md>...` prints `<inventory>:<line>: <error>` per error (line 0 for an error with no row; uncovered old lines in line order) and `ok: <inventory>` otherwise; it exits 1 on an error and 2 with no argument. Its test is listed in the README, `docs/dev/building.md` and `docs/dev/change-standard.md`.

Judgment calls:

- An item number counts the top-level list items (`-`, `*`, `+`, `1.`, `1)`) and the unindented table body rows of a section before its first subsection, or of a subsection; fenced lines, nested items, indented tables and a table's header row are not items.
- A range stays inside one block: blank lines and headings end a block; the frontmatter and each fenced block (fence lines included) are blocks of their own; a range opens at most one item, counting list items at any depth, table rows other than the separator, and frontmatter keys and comments.
- A heading line of the old file needs no row; a heading-shaped line inside a fence or a YAML comment in the frontmatter does.

## Repair round 1

Every finding of `3-refuter.md` is closed in the worktree; none is booked. The reviewer's base was 273714d, the dispatch commit; the step's base is f157b94, the brief commit the worktree was created at, and the landing cherry-picks from it.

| Finding | Closure | Revert that turns the test red, as run |
|---|---|---|
| Spec: item 0 accepted | an item number is at least 1 | `FAIL: item-zero: expected an error, got a pass` |
| Spec: a section counted its subsections' items | a section's own count holds only the items before its first subsection; the complete inventory now names `Steps / Mode A 1` | `FAIL: section-own-items: expected an error, got a pass` |
| Spec: section names with ` / ` or a trailing digit could not be named | places resolve against the section and subsection names of the new file, matched whole | cases slash-name, digit-name and digit-name-item pass; the matching is the only resolution path |
| Spec: the table header row was never checked; fenced lines in the inventory were read as rows | the header must be `\| Old lines \| Rule \| New place \|`; fenced lines are skipped; a table row after the table ends is an error | `FAIL: bad-header: expected an error, got a pass`; `FAIL: fenced-rows: expected a pass`; `FAIL: second-table: expected an error, got a pass` |
| Spec: two `- Old:` or `- New:` lines, last one won | a second header line is an error | case second-old |
| Proof: one row could cover the whole file | ruled by the orchestrator (plan.md): a range stays inside one block, with at most one line opening a list item or a table row | `FAIL: two-items: expected an error, got a pass`; `FAIL: with-blank: expected an error, got a pass`; case with-heading |
| Proof: a YAML comment in the frontmatter was exempt as a heading | headings are exempt only outside the frontmatter | `FAIL: yaml-comment: expected an error, got a pass` |
| Proof: a `~~~` line inside a backtick fence was exempt as a fence line | only the lines that open and close a fence are exempt | case tilde-in-fence |
| Proof: a body row of dashes was exempt as a separator | a separator is only the line right after a table's first row | `FAIL: complete: expected a pass` with the separator exemption removed; case dash-row |
| Proof: any revision accepted as the commit | a hexadecimal id resolving to a commit whose id starts with it; a branch, tag or HEAD is refused | `FAIL: branch-commit: missing [...]`; `FAIL: branch-named-like-a-commit: expected an error, got a pass` |
| Proof: ten reverts stayed green | each has a case now: separator (above), tilde fences and fence close length (`FAIL: rules-three: expected an error, got a pass`, each), info string (`FAIL: inline-backticks: expected a pass`), closing hashes (`FAIL: closing-hashes: expected a pass`), nested items (`FAIL: rules-three`), frontmatter guard (`FAIL: yaml-comment`), cell count (`FAIL: four-cells: missing [a row has 4 cells, not 3]`), backwards range (`FAIL: backwards-range: missing [...]`), no rows (`FAIL: no-rows: missing [no table rows]`) | as quoted |
| Proof: quoted reds were cut short | this table quotes each red as the test prints it, up to the path of the scratch file | as quoted |
| Proof: uncovered lines printed in string order | row errors keep their order and uncovered lines follow in line order; the sort is gone | `FAIL: uncovered old lines are not in their order` with the order reversed |
| Proof: a non-UTF-8 inventory or new file raised a traceback | an error line for the inventory, the old file and the new file | `FAIL: not-utf8: missing [not UTF-8]` |
| Standards: the commit reached `git show` as an option | the commit must be hexadecimal before any git call, and `git show` gets the full id | case option-commit asserts the error and that no file was written |
| Standards: a New path could escape the repository | old and new paths must be relative and resolve inside the repository | `FAIL: escaping-new: missing [...]`; case absolute-new |
| Standards: an escaped pipe split a rule | cells split on unescaped pipes; `\|` becomes a pipe | `FAIL: escaped-pipe: expected a pass` |
| Standards: the comment claiming the same reading as the layout check | the docstring now says what is shared (the fence reading) and nothing more | read |
| Standards: exit 2 undocumented | the docstring states exit 2 when no inventory is named; the test asserts it | case "no argument" |
| Behaviour: no before and after | before: no inventory check existed. After: `python3 utils/check_rule_inventory.py <inventory.md>...` prints `<inventory>:<line>: <error>` or `ok: <inventory>`, exits 1 on an error and 2 with no argument; the README, `docs/dev/building.md` and `docs/dev/change-standard.md` list its test | read |

After the round, from the worktree root: seven `PASS:` lines (`land.test.sh`, `check_config.test.sh`, `collect_findings.test.sh`, `sync_rules.test.sh`, `pin.test.sh`, `check_skill_layout.test.sh`, `check_rule_inventory.test.sh`), and the ASCII check prints nothing and exits 0. Files: `utils/check_rule_inventory.py` 351 lines, `utils/check_rule_inventory.test.sh` 330 lines, `README.md` +2, `docs/dev/building.md` +1, `docs/dev/change-standard.md` +1.

The table above lists the round as it was sent to the second review; its line counts (351 and 330) were the counts then. The findings of that review are closed at landing and listed in `3-refuter.md`, Closed.
