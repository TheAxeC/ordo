# Step 2 report: the layout check

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `sh utils/check_skill_layout.test.sh 2>&1 \| tail -1` | DONE | `PASS: check_skill_layout.py scratch tests` |
| 2 | one case per rule 1 to 7, plus the complete fixture passing, each naming its revert | DONE | cases: wrong-name, no-triggers, bad-version (rule 1); no-paragraph (2); missing-section, out-of-order, stray-section, after-rules (3); no-code, no-numbers, no-bullets (4); bad-header (5); mid-bold, table-bold (6); version-heading (7); complete and the default run over `skills/` pass |
| 2a | revert: the bold check made a no-op | DONE, red | `FAIL: mid-bold: expected an error, got a pass: ok: .../mid-bold/SKILL.md` |
| 2b | revert: the placement check for reference sections disabled | DONE, red | `FAIL: stray-section: expected an error, got a pass: ok: .../stray-section/SKILL.md` |
| 2c | revert: the table header comparison disabled | DONE, red | `FAIL: bad-header: expected an error, got a pass: ok: .../bad-header/SKILL.md` |
| 3 | `python3 utils/check_skill_layout.py` on the current skills | DONE, exit 1 | errors per file: land 9, ordo-init 9, plan-help 9, plan-orchestration 21, plan-retro 9, plan 6, refute 9, repo-setup 10, roadmap 11, spec 8 |
| 4 | the `verify` list | DONE | five `PASS:` lines, each exit 0; the ASCII check prints nothing, exit 0 |

The reverts not run, named per case: wrong-name (drop the name comparison), no-triggers (drop the `Triggers on:` test), bad-version (drop the version pattern), no-paragraph (drop the paragraph test), missing-section and out-of-order (drop the missing and order tests in `check_order`), after-rules (the same placement check as 2b), no-code, no-numbers, no-bullets (drop the matching test in `check_section_body`), table-bold (the same bold check as 2a), version-heading (drop `VERSION_TAG`).

Files:

- `utils/check_skill_layout.py`, 210 lines, new.
- `utils/check_skill_layout.test.sh`, 174 lines, new.

Judgment calls:

- A section's lists are recognised by their first characters (`1. `, `- `), outside fenced code blocks; a list inside a `### ` subsection counts for its section.
- `### ` headings are checked for version tags as `##` headings are.
- Text before the title, after the frontmatter, is an error.

## Repair round 1

Every finding of `2-refuter.md` is closed in the worktree; none is booked.

| Finding | Closure | Proof |
|---|---|---|
| Spec: a non-mapping frontmatter or a scalar `metadata` crashed | an error line for each (`frontmatter is a list, not a mapping`; `metadata.version is None`) | cases list-frontmatter, scalar-metadata; revert of the non-mapping error: `FAIL: list-frontmatter: expected an error, got a pass` |
| Spec: indented, `~~~` and longer fences were not recognised | fences are ``` or ~~~ of any length at any indentation, closed by the same character at least as long | cases fences (all three forms, holding a heading, bold and a list), tilde-quick-start; revert "fences never tracked": `FAIL: fences: expected a pass` |
| Spec: a nested item's label was bold outside a label | the label may sit at any list depth | case nested-label; revert of the indentation: `FAIL: nested-label: expected a pass` |
| Spec: bold in a heading passed | bold in any heading, the title included, is an error | cases heading-bold, title-bold; revert: `FAIL: heading-bold: expected an error, got a pass` |
| Spec: `####` headings were not checked for version tags | every heading level is checked | cases version-subheading, version-deep |
| Spec: a version tag inside a code span in a heading passed | code spans are not stripped for the version check | case version-in-span; revert: `FAIL: version-in-span: expected an error, got a pass` |
| Spec: a second `# ` heading escaped the checks | a second `# ` heading is an error | case second-title; revert: `FAIL: second-title: expected an error, got a pass` |
| Spec: any non-blank line counted as the paragraph | only a line that is not a heading, list, table or fence counts | case subheading-only |
| Spec: the order error did not name the heading | it names the first heading out of place and the one that belongs there | case out-of-order asserts `section 'Steps' is out of order: 'What it reads' belongs here` |
| Spec: a missing section was reported at an unrelated line | at the line of the next required section present, or the file's last line | read in the output on the current skills |
| Proof: no case for text before the title, a missing title, a missing frontmatter, bad YAML | cases text-before-title, no-title, no-frontmatter, bad-yaml | each revert red: `FAIL: text-before-title`, `FAIL: no-title`, `FAIL: no-frontmatter`, `FAIL: bad-yaml` |
| Proof: no silence case for fenced text | case fences passes, with stray-section and mid-bold as its controls | revert "fences never tracked" red, as above |
| Proof: no case for What it reads without a list, or for Steps in subsections | cases no-read-list, steps-in-subsections | revert: `FAIL: no-read-list: expected an error, got a pass` |
| Proof: only the Anti-patterns header was tested; no case for a missing table | cases bad-use-header, bad-stops-header, no-table, spaced-header | reverts red: `FAIL: bad-use-header`, `FAIL: bad-stops-header`, `FAIL: no-table` |
| Proof: no case for a `###` version tag or a duplicated section | cases version-subheading, twice | revert of the duplicate error: `FAIL: twice: expected an error, got a pass` |
| Standards: numbered case comments pointing at the brief | the comments name what the cases check | `grep -n '^# [0-9]' utils/check_skill_layout.test.sh` prints nothing |
| Standards: a missing path or bad frontmatter ended in a traceback | a missing file prints `<path>:0: no such file`, a non-UTF-8 file `not UTF-8`, bad frontmatter its error line | case for the missing path; revert: `FAIL: a missing file did not print its error line` |
| Standards: the new test was not in the lists of tests | added to `README.md` (command and description), `docs/dev/building.md` and `docs/dev/change-standard.md`; the plan's verify list gets it at landing | `grep -rln 'check_skill_layout.test.sh'` lists the same three files as `pin.test.sh` |
| Behaviour: the folder argument and the default root were unstated | the docstring states both: a skill folder stands for its `SKILL.md`, and with no argument the `skills/` of the repository holding the script is read, with paths printed relative to the current directory | the docstring |
| Not checked: `__bold__` | ruled here: `__x__` is bold, like `**x**`, since it renders the same | case underscore-bold; revert red |

After the round, from the worktree root: the six tests print `PASS:` (the five of the verify list and `check_skill_layout.test.sh`), the ASCII check prints nothing and exits 0, and `python3 utils/check_skill_layout.py` still exits 1 on the ten unstyled skills with the same counts per file. Files: `utils/check_skill_layout.py` 250 lines, `utils/check_skill_layout.test.sh` 262 lines, `README.md` +2, `docs/dev/building.md` +1, `docs/dev/change-standard.md` +1.
