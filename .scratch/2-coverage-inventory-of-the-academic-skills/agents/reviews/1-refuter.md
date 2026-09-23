# Step 1 refuter

## Verification lines

Run from .agents/worktrees/2-1:

```
PASS: check_coverage.py scratch tests
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
(ten ok: lines from the layout check) layout exit 0
ascii exit 0   (no output)
git status --short: ?? utils/check_coverage.py / ?? utils/check_coverage.test.sh
```

`wc -l`: check_coverage.py 251, check_coverage.test.sh 272; both mode -rwxr-xr-x. These match the report.

## Spec

1. utils/check_coverage.test.sh (no case): the brief's "an empty table" edge has no case for a named skill; `section-twice` appends one only as the unread copy, and gamma's table fails on its header. Fix: a case emptying alpha's table asserting each `is not listed`, and a control where an empty table for a folder with no files passes.
2. utils/check_coverage.py:179 `if not skill or not entry:`: only the empty entry cell is tested; `if not entry:` leaves the test green. Fix: a case `| | 3 |`.
3. utils/check_coverage.py:152 and :49: lettered entries are matched as `## 2.A. `, which the roadmap does not use (docs/roadmap.md:26 is `## 2.A Launch notes ...`), so the real form is rejected and an unused form accepted. Fix: follow the brief, or match the lettered form as the roadmap writes it, with a case for each form.
4. utils/check_coverage.py:112-122: blank lines are dropped before the table is read, so a row after a blank line is merged into the table with no error (printed `ok:`). Fix: end the table at the first blank line, with a case.

## Proof

1. utils/check_coverage.test.sh:269-270: the no-write assertion cannot fail: nothing is committed in the scratch repository and `--untracked-files=no` hides any file the check could write; the report's line 21 rests on it. Fix: compare the scratch tree before and after, untracked files included.
2. utils/check_coverage.test.sh:121 and report line 17: "a lettered entry (`2.A`)" is claimed for the complete list, which holds none; `2.A` appears only in `skill-twice`, which stops before the lookup. Fix: correct both, or add the lettered row after Spec 3.
3. Rules no case turns red (each revert left `PASS`): a missing skills root (no case); `'## New skills' appears more than once` (no case); the duplicate skill section's line (the assertion omits the line); `ENTRY_NUMBER` (dead: `entries` holds only accepted strings); the de-duplication of skill arguments (the repeated case passes either way); the cell count loosened to `<` (a four-cell row would crash at the unpack); the fence close length (a four-backtick fence closed by three is untested); `drop` loosened to a prefix (no `drop: paper` or `dropped` case).
4. The report's four reverts reproduce; the other reverts tried go red.

## Standards

1. utils/check_coverage.py:89 and :102: `order` is written and never read (change-standard rule 11). Fix: remove it.
2. utils/check_coverage.py:33-36: the docstring's usage-error list leaves out a list outside a git repository, a missing coverage list or roadmap, and a failed `find`. Fix: list every case.
3. utils/check_coverage.py:93-98: a second fence reader, unlike the one `check_skill_layout.py` and `check_rule_inventory.py` share and document (an opener's info string holding a backtick is read as a fence here). Fix: use the same reading and state it in the docstring.
4. utils/check_coverage.test.sh:121: the head comment is false (Proof 2).

## Behaviour

1. utils/check_coverage.py:158-162: `find` without `-H`; a skill folder that is a symlink lists no file, and an empty table passes (printed `ok:`). Fix: `-H`, or refuse it, with a case.
2. utils/check_coverage.py:115: a table indented four spaces (a code block in Markdown) is read as the table (printed `ok:`). Fix: a row starts within three spaces, with a case.
3. Exit 2 outside a git repository and for a missing roadmap or list is not stated in the report's judgment calls or the docstring. Fix: state them.

## Not checked

- File names holding a newline.
- The check against the real research-hub folders; no list exists yet.
- The test with a `TMPDIR` holding a space.

Also tried, with no finding: a heading `##alpha`, a trailing-space file name, a cell holding only a backslash, a coverage path with spaces, a missing root and a missing coverage file (both exit 2).

Reviewer usage: 80,660 tokens, 13 tool uses, 240 seconds (from the task notification).

## Repair round 1, refuted

### Verification lines

```
PASS: check_coverage.py scratch tests
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
(ten ok: lines) layout exit 0
ascii exit 0
?? utils/check_coverage.py
?? utils/check_coverage.test.sh
```

`wc -l`: 270 and 354; both executable; no non-ASCII; no `__pycache__`. Every closure of the first run was confirmed by its revert turning the test red with the case the report names; the Done-line alternative and the separator check go red too. `ROADMAP_ENTRY` over the real roadmap yields 2, 2.A, 3 to 16 and 1, and skips the commented template lines.

### Spec

none

### Proof

1. utils/check_coverage.py:72-73: exit 2 for a missing coverage list or `docs/roadmap.md`, stated in the docstring, has no case; with the handler deleted the test passes. Fix: a case for each.
2. utils/check_coverage.py:100: the backtick-in-info-string rule has no case. Fix: a case where ```` ```a`b ```` before a heading opens no fence.
3. utils/check_coverage.test.sh:107-109 and report line 22: the runs at test lines 332, 343 and 349 take no snapshot, and the snapshot lists only regular files, so a created directory goes unseen. Fix: snapshot every invocation, every entry with its type; correct the report.

### Standards

none

### Behaviour

1. utils/check_coverage.py:178: a link nested inside a skill folder has its files neither required nor accepted (a table without them printed `ok:`). Fix: report each link under the folder, with a case.
2. utils/check_coverage.py:133-141: table rows inside fenced code are read. Fix: skip fenced lines in the table, with a case.
3. utils/check_coverage.py:115-116: a heading's closing hashes are kept in its name (`## alpha ##` is not alpha). Fix: strip them as the layout check does, with a case.

### Not checked

- File names holding a newline; the real research-hub folders; a `TMPDIR` holding a space; the report's revert outputs byte for byte.

Reviewer usage: 93,021 tokens, 21 tool uses, 445 seconds (from the task notification).

## Closed

- First run: every finding closed in repair round 1; the closures are in `1-report.md`, "Repair round 1".
- Run over the round, every finding fixed at landing, each with a case its revert turns red (`sh check_coverage.test.sh 2>&1 | head -1` on a copy with the rule removed):
  - Proof 1: cases `usage-missing-list` and `usage-missing-roadmap`; revert `oserror`: `FAIL: usage-missing-list: expected exit 2, got 1: Traceback (most recent call last):`.
  - Proof 2: case `backtick-info`; revert: `FAIL: backtick-info: expected exit 0, got 1: ...`.
  - Proof 3: every invocation runs through `direct`, which snapshots every entry under the scratch folder with its type and every regular file's checksum; revert `makedirs`: `FAIL: complete: the check changed something under the scratch folder`.
  - Behaviour 1: each link under a skill folder is an error (`'<skill>/<path>' is a link; its target is not listed or read`); case `nested-link`; revert: `FAIL: nested-link: expected exit 1, got 0: ok: ...`.
  - Behaviour 2: fenced lines are not table rows; case `fenced-rows`; revert: `FAIL: fenced-rows: expected exit 0, got 1: ...`.
  - Behaviour 3: closing hashes stripped with the layout check's `CLOSING_HASHES`; case `closing-hashes`; revert: `FAIL: closing-hashes: expected exit 0, got 1: ...`.
- After the fixes: `utils/check_coverage.py` 278 lines, `utils/check_coverage.test.sh` 396 lines; the test prints `PASS: check_coverage.py scratch tests`; no non-ASCII.
