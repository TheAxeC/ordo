# Step 1 report: the coverage check and its test

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | `utils/check_coverage.py`, run as `python3 utils/check_coverage.py <coverage.md> <skills root> <skill>...` | DONE | the test's `complete` case prints `ok: <path>` and exits 0 |
| 2 | `utils/check_coverage.test.sh` | DONE | `sh utils/check_coverage.test.sh 2>&1 \| tail -1` prints `PASS: check_coverage.py scratch tests`, exit 0 |
| 3 | The verify list, from the worktree's root | DONE | `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`; the layout check's ten `ok:` lines; the ASCII check prints nothing; exit 0 |
| 4 | No non-ASCII in the new files | DONE | `LC_ALL=C grep -n '[^ -~]' utils/check_coverage.py utils/check_coverage.test.sh` prints nothing, exit 1 |

Files: `utils/check_coverage.py`, 278 lines, new; `utils/check_coverage.test.sh`, 396 lines, new; both executable, as the other scripts under `utils/` are. `git status --short` in the worktree shows only these two, and no `__pycache__`.

What the test covers:
- Passes: a complete list with a hidden file (`.gitkeep`), a nested file, an escaped pipe in a reason, the same file name under two skills, a Done entry (`- [x] 1.`) in the roadmap, and a `## beta` inside a fence that is not a section; a lettered entry as the roadmap writes it (`## 2.A `); an empty table for a folder with no files; a skill folder that is a link, its file listed through the link; a four-backtick fence holding a three-backtick line and a heading.
- Fails, each with its message and line asserted: a hidden file and a nested file not listed; an empty table for a folder with files (each file); a file listed twice; a listed path that is no file; a file listed in the wrong section (both errors); a `..` path, an absolute path and a path that is not normal; a file cell not in backticks; an unknown mark, `drop: paper` and `dropped`; `rebuild:paper` without its space; a mark naming a skill New skills does not hold, for `rebuild` and for `rebuild later`; an empty reason; rows of two and of four cells; a wrong table header; no separator row; a row after the table, after a paragraph and after a blank line; a section with no table, and a table indented four spaces; a named folder with no section; a skill section and New skills each given twice; a fence left open; a New skills entry not in the roadmap, one malformed, and the dotted lettered form (`## 6.B. `) the roadmap does not use; a skill named twice; an empty skill cell and an empty entry cell; no New skills section; a fenced heading that is the only `## beta`; the link folder with an empty table.
- A skill given twice on the command line is checked once: the repeated case asserts its error is printed once.
- The unread section and its control: gamma's section is malformed; unnamed, the list passes; named, it fails with its header error.
- Exit 2: no skill argument, a skills root that does not exist, a skill folder that does not exist, a list that is not UTF-8, a list outside a git repository.
- The check writes nothing: every run, the direct ones included, compares every entry under the scratch folder with its type, and every regular file's checksum, before and after (as fixed at landing; see `1-refuter.md`, Closed).

Each rule is proved by its revert. On copies of the script and test in the scratchpad, with one rule removed each, `sh check_coverage.test.sh 2>&1 | tail -1` printed:

```
== revert notlisted   (the loop that reports files not listed)
FAIL: missing-hidden: expected exit 1, got 0: ok: /var/folders/.../repo/docs/missing-hidden.md
== revert reason      (the empty-reason check)
FAIL: empty-reason: expected exit 1, got 0: ok: /var/folders/.../repo/docs/empty-reason.md
== revert newskill    (the check that a mark's skill is a row of New skills)
FAIL: unknown-skill: expected exit 1, got 0: ok: /var/folders/.../repo/docs/unknown-skill.md
== revert fence       (headings inside fenced code read as sections)
/var/folders/.../repo/docs/complete.md:25: '## beta' appears more than once
```

The last is the second line of the `complete` case's FAIL message, which `tail -1` shows.

Judgment calls:
- Lettered roadmap entries are read as the roadmap writes them, `## 2.A <title>` and `- [x] 2.A <title>`, beside `## <n>. ` and `- [x] <n>. `, since the roadmap's own rule places a new entry as `<n>.<letter>`.
- Exit 2, beside the brief's cases: a list outside a git repository, a missing list or `docs/roadmap.md`, and a failed `find`; the docstring lists every case.
- A skill folder that is a link is read through the link (`find -H`).
- The fence reading is the one `utils/check_skill_layout.py` uses, and a fence left open is an error, as there.
- The New skills table in the list names each skill with its roadmap entry, and the check reads the entry numbers from `docs/roadmap.md` of the repository holding the list, because the roadmap's titles are not all skill names (`## 3. The writing base` builds `writing`).
- A skill given twice on the command line is checked once.
- A file the section does not list is reported on line 0 with its path, since no line of the list carries it.

## Repair round 1

Every finding of `1-refuter.md` is closed; none is booked. After the round: `sh utils/check_coverage.test.sh 2>&1 | tail -1` prints `PASS: check_coverage.py scratch tests`; the verify list prints its seven `PASS:` lines, the layout check's ten `ok:` lines and a clean ASCII check; `LC_ALL=C grep -n '[^ -~]'` over both files prints nothing.

| Finding | Closure |
|---|---|
| Spec 1 | Cases `empty-table` (each file not listed) and its control `empty-folder` (passes) |
| Spec 2 | Case `empty-skill` |
| Spec 3 | The roadmap entry is read as `## <n>. `, `## <n>.<letter> ` and the same Done forms; cases `lettered` (passes) and `lettered-dotted` (fails) |
| Spec 4 | A blank line ends the table; case `row-after-blank` |
| Proof 1 | Every run checksums every file under the scratch folder before and after; the old assertion is gone |
| Proof 2 | The head comment no longer claims a lettered entry; the lettered case is its own |
| Proof 3 | Cases `usage-missing-root`, `new-skills-twice` (with its line), `section-twice` now asserts line 37, `repeated-skill` asserts one error line, `four-cells`, `long-fence`, `drop-with-skill`, `dropped`; `ENTRY_NUMBER` deleted |
| Standards 1 | `order` removed |
| Standards 2 | The docstring lists every usage error |
| Standards 3 | `fence_opener` and the closing rule are `check_skill_layout.py`'s, stated in the docstring; a fence left open is an error, case `unclosed-fence` |
| Behaviour 1 | `find -H`; cases `linked-empty` (fails) and `linked-listed` (passes) |
| Behaviour 2 | A table row starts within three spaces; case `indented-table` |
| Behaviour 3 | Stated in the judgment calls and the docstring |

Each new rule's revert, on copies in the scratchpad, turns the test red (`sh check_coverage.test.sh 2>&1 | head -1`, cut at 150 characters):

```
== blank-ends-table: FAIL: row-after-blank: missing [:25: a table row after the end of the table in 'alpha'] in: ...
== cellcount: FAIL: four-cells: missing [:23: a row of 'alpha' has 4 cells, not 3] in: Traceback (most recent call last):
== dedupe: FAIL: repeated-skill: the error is printed more than once: ...
== drop-exact: FAIL: drop-with-skill: expected exit 1, got 0: ok: ...
== dup-new-skills: FAIL: new-skills-twice: expected exit 1, got 0: ok: ...
== empty-skill: FAIL: empty-skill: expected exit 1, got 0: ok: ...
== fence-length: FAIL: long-fence: expected exit 0, got 1: .../long-fence.md:0: 'alp...
== find-H: FAIL: linked-empty: expected exit 1, got 0: ok: ...
== indent: FAIL: indented-table: expected exit 1, got 0: ok: ...
== lettered: FAIL: lettered: expected exit 0, got 1: .../lettered.md:12: roadmap...
== unclosed: FAIL: unclosed-fence: expected exit 1, got 0: ok: ...
== writes: FAIL: complete: the check changed a file under the scratch folder
```

Files after the round: `utils/check_coverage.py` 270 lines, `utils/check_coverage.test.sh` 354 lines.

