# Report: step 8, the coverage check

Everything in the brief is done.

## Open items of the state file, verbatim

- I (raised 2026-09-25 by step 5's builder, `agents/reviews/5-report.md`): a reproduction run of `utils/pin.sh` with the session's `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` still set created one link in the user's real skill folder, `/Users/axelfaes/.claude-work/skills/alpha`, pointing at a scratch folder that no longer exists; nothing else there changed (`ls /Users/axelfaes/.claude-work/skills/` lists alpha, the ten Ordo skills and synced). The builder's removal was refused by the runner's permission check, so the orchestrator does not remove it either. Options: (a) the user removes it with `! rm /Users/axelfaes/.claude-work/skills/alpha`, and every later brief that runs a tool touching skill folders unsets `CLAUDE_CONFIG_DIR` and names every variable that reaches a real folder; (b) leave it. Recommended (a): it is a dangling link the step made in a folder the user's rules keep untouched. (b) is the lazy option.
- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## DONE / NOT DONE

| # | Item | State | Command that proves it | Output |
|---|---|---|---|---|
| 1 | Done lettered entries: `- [x] <n>.<letter>. ` accepted beside `- [x] <n>.<letter> ` and `- [x] <n>. ` | DONE | case done-lettered; revert R1 | red under R1, quoted below |
| 2 | Lines split on `\n` only (list, roadmap), `find -print0` for file names | DONE | cases roadmap-separators, separator-names, newline-name; reverts R2a to R2d | red under each, quoted below |
| 3 | File names from `find` and file cells compared in NFC | DONE | case nfc-names; reverts R3a, R3b | red under each, quoted below |
| 4 | `--built <skill>`, repeatable | DONE | the built-* cases; reverts R4a to R4j | red under each, quoted below |
| 5 | Tests for items 1 to 4 and for the three untested behaviours; head comment names the cases | DONE | cases escaped-last-cell, order, find-fails; reverts R5a to R5c; `sed -n 1,11p utils/check_coverage.test.sh` | red under each, quoted below; head comment below |
| 6 | Docstring and usage line name `--built` | DONE | `python3 utils/check_coverage.py` | `Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...`, exit 2 |
| V1 | The verify list through the runner | DONE | `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | quoted below: ten `PASS:`, ten `ok:`, `verify: 12 commands passed`, exit 0 |
| V2 | The test's summary line | DONE | `sh utils/check_coverage.test.sh 2>&1 \| tail -1` | `PASS: check_coverage.py scratch tests` |
| V3 | The coverage check over the four academic skills | DONE | `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` | `ok: docs/academic-coverage.md`, exit 0 |
| V4 | Each new or changed case red under its revert | DONE | the revert driver described below | 20 reverts, 20 `FAIL` lines, quoted below |
| V5 | ASCII, lines of at most 100 characters in the added lines | DONE | the ASCII check of the verify list (in V1), and `git diff -U0 utils/ \| grep '^+' \| grep -v '^+++' \| awk 'length($0) > 101' \| wc -l` | the length count printed `0`; the ASCII check, run again after this report was written, is quoted below |

### V1, whole output

```text
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
exit 0
```

### V5, the ASCII check after this report was written

```text
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '<the verify list's ASCII check>'; echo "exit $?"
exit 0
```

### V2 and V3, whole output

```text
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
```

### The new cases on the unchanged checker

The test was written first and run against the checker as it was, before any change to it:

```text
$ sh utils/check_coverage.test.sh; echo "exit $?"
FAIL: done-lettered: expected exit 0, got 1: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-coverage-test.CX3IOJ/repo/docs/done-lettered.md:12: roadmap entry '4.C' of 'done-dotted' is not in docs/roadmap.md
exit 1
```

The cases for items 1 to 4 each failed against the unchanged checker in a run whose `fail` reported and went on. The three cases for the untested behaviours (escaped-last-cell, order, find-fails) passed there, since the behaviour was already right; their proof is their revert (R5a to R5c).

### V4, each case red under its revert

Driver: a Python script under `$TMPDIR` that, for each revert, copies `utils/check_coverage.py` with the revert's text substitution and `utils/check_coverage.test.sh` unchanged into a scratch folder, runs `sh <scratch>/check_coverage.test.sh`, and prints its exit code and whole output. The worktree's files were not changed by it. In the output, the temporary folder is written `$TMPDIR`, and four non-ASCII characters are written as their code points (`<U+2028>`, `<U+0085>`, `<U+00E9>`, and the combining acute `<U+0301>` of the names stored decomposed), so that this file passes the ASCII check.

The reverts:

- R1: `ROADMAP_ENTRY` back to `^(?:## |- \[x\] )([0-9]+\.(?:[A-Z](?= )|(?= )))` and `m.group(1)`.
- R2a: the roadmap split with `read_text(roadmap).splitlines()`.
- R2b: the list split with `read_text(coverage_path).splitlines()`.
- R2c: `find` without `-print0`, its output split on `b"\n"`.
- R2d: `find` as it was: text mode, no `-print0`, `stdout.splitlines()`.
- R3a: the names from `find` not normalized.
- R3b: the file cell not normalized.
- R4a: no `--built` check of the rows (`elif False:`).
- R4b: a `--built` path not required to be plain.
- R4c: a `--built` path `.` counted.
- R4d: `rebuild later:` rows read by `--built` (the `mm.group(1) == "rebuild"` test dropped).
- R4e: every `rebuild:` row read whenever `--built` is given, not only the named skills' rows.
- R4f: `--built` keeps only its last skill.
- R4g: a `--built` skill that is not a row of New skills not reported.
- R4h: `--built` with no skill after it not refused.
- R4i: `--built` names not checked.
- R4j: the `skills/<skill>/` folder of a `--built` skill not required to exist.
- R5a: a last cell's `\|` taken as the closing pipe (`body.endswith("|")` without the `\|` exception).
- R5b: a failing `find` not refused (`if False:`).
- R5c: errors printed unsorted.

```text
== R1: exit 1
FAIL: done-lettered: expected exit 0, got 1: $TMPDIR//check-coverage-test.uMgdQu/repo/docs/done-lettered.md:12: roadmap entry '4.C' of 'done-dotted' is not in docs/roadmap.md
== R2a: exit 1
FAIL: roadmap-separators: expected exit 1, got 0: ok: $TMPDIR//check-coverage-test.PwV4uV/repo/docs/roadmap-separators.md
== R2b: exit 1
FAIL: separator-names: expected exit 0, got 1: $TMPDIR//check-coverage-test.2npIEp/repo/docs/separator-names.md:0: 'sep/a<U+2028>b.md' is not listed
$TMPDIR//check-coverage-test.2npIEp/repo/docs/separator-names.md:0: 'sep/c<U+0085>d.md' is not listed
$TMPDIR//check-coverage-test.2npIEp/repo/docs/separator-names.md:41: a row of 'sep' has 1 cells, not 3
$TMPDIR//check-coverage-test.2npIEp/repo/docs/separator-names.md:43: a table row after the end of the table in 'sep'
== R2c: exit 1
FAIL: newline-name: missing [:0: 'nl/a
b.md' is not listed] in: $TMPDIR//check-coverage-test.cSsUrX/repo/docs/newline-name.md:0: 'nl/../../../../../../../../Users/axelfaes/workspace/ordo/.agents/worktrees/2b-8/b.md' is not listed
$TMPDIR//check-coverage-test.cSsUrX/repo/docs/newline-name.md:0: 'nl/a' is not listed
== R2d: exit 1
FAIL: separator-names: expected exit 0, got 1: $TMPDIR//check-coverage-test.rpJEfg/repo/docs/separator-names.md:0: 'sep/../../../../../../../../Users/axelfaes/workspace/ordo/.agents/worktrees/2b-8/b.md' is not listed
$TMPDIR//check-coverage-test.rpJEfg/repo/docs/separator-names.md:0: 'sep/../../../../../../../../Users/axelfaes/workspace/ordo/.agents/worktrees/2b-8/d.md' is not listed
$TMPDIR//check-coverage-test.rpJEfg/repo/docs/separator-names.md:0: 'sep/a' is not listed
$TMPDIR//check-coverage-test.rpJEfg/repo/docs/separator-names.md:0: 'sep/c' is not listed
$TMPDIR//check-coverage-test.rpJEfg/repo/docs/separator-names.md:41: 'a<U+2028>b.md' is not a file of sep
$TMPDIR//check-coverage-test.rpJEfg/repo/docs/separator-names.md:42: 'c<U+0085>d.md' is not a file of sep
== R3a: exit 1
FAIL: nfc-names: expected exit 0, got 1: $TMPDIR//check-coverage-test.6l97Wj/repo/docs/nfc-names.md:0: 'nfd/cafe<U+0301>.md' is not listed
$TMPDIR//check-coverage-test.6l97Wj/repo/docs/nfc-names.md:41: 'caf<U+00E9>.md' is not a file of nfd
== R3b: exit 1
FAIL: nfc-names: expected exit 0, got 1: $TMPDIR//check-coverage-test.QT994p/repo/docs/nfc-names.md:0: 'nfd/th<U+00E9>.md' is not listed
$TMPDIR//check-coverage-test.QT994p/repo/docs/nfc-names.md:42: 'the<U+0301>.md' is not a file of nfd
== R4a: exit 1
FAIL: built-none: expected exit 1, got 0: ok: $TMPDIR//check-coverage-test.JhJ31Q/repo/docs/built-none.md
== R4b: exit 1
FAIL: built-not-plain: expected exit 1, got 0: ok: $TMPDIR//check-coverage-test.xGafg6/repo/docs/built-not-plain.md
== R4c: exit 1
FAIL: built-not-plain: expected exit 1, got 0: ok: $TMPDIR//check-coverage-test.bOuDFZ/repo/docs/built-not-plain.md
== R4d: exit 1
FAIL: built-later: expected exit 0, got 1: $TMPDIR//check-coverage-test.anv9MH/repo/docs/built-later.md:22: the reason of 'references/deep/guide.md' (rebuild later: writing) names no path in backticks
== R4e: exit 1
FAIL: built-none: a row of a skill not given to --built was read: $TMPDIR//check-coverage-test.3Nezce/repo/docs/built-none.md:21: the reason of 'SKILL.md' (rebuild: paper) names no path in backticks
$TMPDIR//check-coverage-test.3Nezce/repo/docs/built-none.md:29: the reason of 'SKILL.md' (rebuild: layout) names no path in backticks
== R4f: exit 1
FAIL: built-repeated: missing [:29: the reason of 'SKILL.md' (rebuild: layout) names no path in backticks] in: $TMPDIR//check-coverage-test.8YY1YV/repo/docs/built-repeated.md:21: the reason of 'SKILL.md' (rebuild: paper) names no path in backticks
== R4g: exit 1
FAIL: built-not-new: expected exit 1, got 0: ok: $TMPDIR//check-coverage-test.XhzOqn/repo/docs/built-not-new.md
== R4h: exit 1
FAIL: built-no-value: expected exit 2, got 1: Traceback (most recent call last):
  File "$TMPDIR/cov-revert.C0UCkX/R4h/check_coverage.py", line 360, in <module>
    sys.exit(main(sys.argv[1:]))
             ~~~~^^^^^^^^^^^^^^
  File "$TMPDIR/cov-revert.C0UCkX/R4h/check_coverage.py", line 328, in main
    built_skills, argv = options(argv)
                         ~~~~~~~^^^^^^
  File "$TMPDIR/cov-revert.C0UCkX/R4h/check_coverage.py", line 318, in options
    name = argv[i + 1]
           ~~~~^^^^^^^
IndexError: list index out of range
== R4i: exit 1
FAIL: built-bad-name []: expected exit 2, got 1: $TMPDIR//check-coverage-test.mQZiAX/repo/docs/built-bad-name.md:0: --built names '', which is not a row of New skills
== R4j: exit 1
FAIL: built-no-folder: expected exit 2, got 1: $TMPDIR//check-coverage-test.dQxwug/repo/docs/built-no-folder.md:0: --built names 'grant', which is not a row of New skills
== R5a: exit 1
FAIL: escaped-last-cell: missing [:12: roadmap entry '3|' of 'piped' is not in docs/roadmap.md] in: $TMPDIR//check-coverage-test.3fImtx/repo/docs/escaped-last-cell.md:12: roadmap entry '3\' of 'piped' is not in docs/roadmap.md
== R5b: exit 1
FAIL: find-fails: expected exit 2, got 1: $TMPDIR//check-coverage-test.dvoZIh/repo/docs/complete.md:0: no '## locked' section
== R5c: exit 1
FAIL: order: expected, in this order: $TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:0: 'alpha/.gitkeep' is not listed
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:0: 'nested/SKILL.md' is not listed
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:0: 'nested/sub' is a link; its target is not listed or read
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:9: roadmap entry '99' of 'writing' is not in docs/roadmap.md
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:21: the mark 'rebuild:paper' is not 'rebuild: <skill>', 'rebuild later: <skill>' or 'drop'; got: $TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:9: roadmap entry '99' of 'writing' is not in docs/roadmap.md
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:0: 'nested/sub' is a link; its target is not listed or read
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:0: 'nested/SKILL.md' is not listed
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:21: the mark 'rebuild:paper' is not 'rebuild: <skill>', 'rebuild later: <skill>' or 'drop'
$TMPDIR//check-coverage-test.wVcjgZ/repo/docs/order.md:0: 'alpha/.gitkeep' is not listed
```

A control for the scratch-folder snapshot, whose `find` now discards its stderr so that the find-fails case can run through it: a checker that writes a file beside the list is still caught.

```text
$ (a copy of the checker that runs open(coverage_path + ".touched", "w").close() after reading the list)
== control: a checker that writes beside the list
FAIL: complete: the check changed something under the scratch folder
```

### Head comment of the test

```text
$ sed -n 1,11p utils/check_coverage.test.sh
#!/bin/sh
# Exercise check_coverage.py in a scratch git repository: a complete coverage list passes, and each
# error it exists to catch fails with its message, one change per case. Beyond the list's own
# errors, the cases cover: a done lettered roadmap entry in both forms (done-lettered); lines split
# on "\n" only, in the roadmap (roadmap-separators), in the list (separator-names) and in find's
# output, read NUL-separated (separator-names, newline-name); file names compared in NFC
# (nfc-names); a last cell ending in \| with no closing pipe (escaped-last-cell); the sorted
# output (order); a find that fails (find-fails); and the --built mode (the built-* cases).

set -u

```

## Files changed

```text
$ wc -l utils/check_coverage.py utils/check_coverage.test.sh
     360 utils/check_coverage.py
     562 utils/check_coverage.test.sh
     922 total
$ git diff --stat
 utils/check_coverage.py      | 122 +++++++++++++++++++++++-----
 utils/check_coverage.test.sh | 184 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 277 insertions(+), 29 deletions(-)
$ git status --short
 M utils/check_coverage.py
 M utils/check_coverage.test.sh
```

Before this step the files were 278 and 396 lines (`git show HEAD:<file> | wc -l`). Nothing else in the tree changed, apart from this report.

## Judgment calls the brief left open

- **The form of a `--built` path.** Decision 1 of the brief says the paths "resolve against `skills/<skill>/`", so a path in a reason is written relative to that folder (`templates/venue.tex`), not as a repository path (`skills/paper/templates/venue.tex`). A consequence the orchestrator may want to rule on: a reason that names a file of the source skill whose relative path also exists in the new skill passes, since the check cannot tell which skill's file a span means. Demonstrated on a scratch repository whose `skills/paper/SKILL.md` exists and whose row `| `SKILL.md` | rebuild: paper | The workflow `SKILL.md` describes. |` names only the source file:

  ```text
  $ (demo) python3 utils/check_coverage.py --built paper $S/repo/docs/c.md $S/src old   # reason: "The workflow `SKILL.md` describes."
  ok: $S/repo/docs/c.md
  exit 0
  ```

  The other reading, a repository path starting `skills/<skill>/`, would make that row fail; it changes the format a reason is written in, so it is left to the orchestrator.
- **One path suffices.** A reason passes when at least one backticked span is a path that exists under `skills/<skill>/`; other spans may name the source skill's files, as the reasons in `docs/academic-coverage.md` do. When none qualifies the error lists every span.
- **What counts as a path.** A span must be a plain relative path (the same test as a file cell: not absolute, no `..`, in normal form) and not `.`; it may name a file or a folder that exists. The plain test keeps a span such as `../paper/SKILL.md` or `/etc/hosts` from reaching outside the skill folder.
- **Error or usage error.** A `--built` name that is empty, `.`, `..` or holds `/`, `--built` with nothing after it, and a skill with no `skills/<skill>/` folder are usage errors (exit 2), like a missing skill folder; a `--built` skill that is not a row of New skills is an error with line 0 (exit 1), like a mark naming a skill New skills does not hold. A skill given to `--built` twice is read once (the skills are keys of a dict in `main`).
- **Where `--built` goes.** It is accepted anywhere among the arguments, since the test passes it after the list and the skills root.
- **CRLF.** Splitting on `\n` only leaves a `\r` at the end of each line of a CRLF file; every reader of a line already strips it (heading names, table cells, fence lines), so no code was added for it. A CRLF copy of the coverage list and the roadmap passes:

  ```text
  $ (CRLF copies) python3 utils/check_coverage.py $S/docs/academic-coverage.md <research-hub skills> <four skills>
  ok: $S/docs/academic-coverage.md
  exit 0
  ```

- **Headings keep their form.** A heading `## 6.B.` is still not an entry (case lettered-dotted, unchanged), since item 1 of the brief widens only the Done lines.
- **The test harness.** The case edit script reads and writes UTF-8 explicitly, so the non-ASCII names do not depend on the locale; the exit trap restores permissions before removing the scratch folder, so a run cut off inside find-fails still cleans up; the snapshot discards `find`'s stderr (control above).

## User-visible changes

| Change | Before | After |
|---|---|---|
| Usage line | `Usage: check_coverage.py <coverage.md> <skills root> <skill>...` | `Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...` |
| A New skills row naming a done lettered entry `- [x] 4.C. ` | `roadmap entry '4.C' of 'done-dotted' is not in docs/roadmap.md` | passes |
| A file name holding U+2028 or U+0085 | read as two names: `not listed` for each part, a wrong cell count and a row after the table (R2b, R2d outputs) | one name, passes |
| A file stored NFD and listed NFC, or the reverse | both `is not listed` and `is not a file of` | passes |
| `--built <skill>` | not an option (`<root>/--built: not a folder`, exit 2) | each `rebuild: <skill>` row's reason must name an existing path under `skills/<skill>/`: `the reason of '<file>' (rebuild: <skill>) names no path in backticks`, or `... names no path under skills/<skill>/ that exists: <spans>` |
| Output order | sorted, not documented | sorted by line number, then by message, stated in the docstring |

What the `--built` check does not cover: it checks that the named path exists, not that the file there holds what the row's source file did.

## Anything in the brief wrong or impossible

Nothing. The premises hold on the base: `git show HEAD:utils/check_coverage.py | wc -l` printed 278 and the test 396; `ROADMAP_ENTRY` was line 62 and the `splitlines()` calls lines 176, 187 and 191; `grep -n '2\.A\.' docs/roadmap.md` printed `137:- [x] 2.A. Launch notes for builders ...`. The one `splitlines()` left in the file splits the docstring to print the usage line in `main`, which item 2 does not cover.

## Doc text

`README.md:126` as `grep -n 'check_coverage.test.sh' README.md` prints it:

```text
126:- `check_coverage.test.sh` checks that `check_coverage.py` passes a complete coverage list (a hidden file, a nested file, an escaped pipe, the same file name in two skills' sections, a lettered roadmap entry, an empty table for an empty folder, a skill folder that is a link, fenced lines, a backtick in a fence's info string that opens no fence, and closing hashes), and reads only the sections of the skills named on the command line, with a control that reads a malformed one when it is named; a skill named twice on the command line is checked once, so each of its errors is printed once. It fails each error it exists to catch: a file not listed, listed twice or in the wrong section, a listed path that is no file or is not a plain relative path, a file cell not in backticks, an unknown mark or a mark naming a skill the New skills table does not hold, an empty reason, a wrong cell count or table header, a missing separator row, a row after the table, a section with no table, a missing or repeated section, a fence left open, a link inside a skill folder, and in New skills an entry that is not in the roadmap, including one whose roadmap heading is written with a trailing dot after its letter (`## 6.B.`), a skill named twice, or an empty cell. It exits 2 on each usage error it exercises: no skill argument, a missing skills root, a missing skill folder, a missing coverage list, a missing roadmap, a list that is not UTF-8, and a list outside a git repository; and every run checks that the check changed nothing under its scratch folder.
```

Its replacement:

```text
- `check_coverage.test.sh` checks that `check_coverage.py` passes a complete coverage list (a hidden file, a nested file, an escaped pipe, the same file name in two skills' sections, a lettered roadmap heading, a done lettered roadmap entry written `- [x] 4.C. ` or `- [x] 7.D `, an empty table for an empty folder, a skill folder that is a link, fenced lines, a backtick in a fence's info string that opens no fence, closing hashes, file names holding U+2028 or U+0085, and file names stored in one Unicode form and listed in the other), and reads only the sections of the skills named on the command line, with a control that reads a malformed one when it is named; a skill named twice on the command line is checked once, so each of its errors is printed once. It fails each error it exists to catch: a file not listed, listed twice or in the wrong section, a listed path that is no file or is not a plain relative path, a file cell not in backticks, an unknown mark or a mark naming a skill the New skills table does not hold, an empty reason, a wrong cell count or table header, a missing separator row, a row after the table, a section with no table, a missing or repeated section, a fence left open, a link inside a skill folder, a file whose name holds a newline (reported as one name), and in New skills an entry that is not in the roadmap, including one whose roadmap heading is written with a trailing dot after its letter (`## 6.B.`), one that follows a line separator inside a roadmap line, and one in a last cell that ends in `\|` with no closing pipe, a skill named twice, or an empty cell; the errors print sorted by line number, then by message. With `--built <skill>` it passes a row marked `rebuild: <skill>` whose reason names in backticks a path that exists under `skills/<skill>/` of the list's repository, and fails a reason that names no path, or only paths that do not exist there or are not plain relative paths, and a `--built` skill that is not a row of New skills; with a control for each, it reads only the rows of the skills given to `--built`, a repeated `--built` reads each of them once, and a `rebuild later:` row is not read. It exits 2 on each usage error it exercises: no skill argument, a missing skills root, a missing skill folder, a missing coverage list, a missing roadmap, a list that is not UTF-8, a list outside a git repository, a find that fails, `--built` with no skill after it or with a name that is empty, `.` or `..` or holds `/`, and a `--built` skill with no folder under `skills/`; and every run checks that the check changed nothing under its scratch folder.
```

No other sentence of `README.md`, `docs/` or `skills/` names the behaviour changed: `grep -rn -e '--built' -e 'check_coverage.py <' skills utils docs README.md | grep -v '^utils/check_coverage'` printed nothing, and the two other `check_coverage` lines (`docs/academic-coverage.md:23`, `docs/dev/building.md:15`) stay true.
