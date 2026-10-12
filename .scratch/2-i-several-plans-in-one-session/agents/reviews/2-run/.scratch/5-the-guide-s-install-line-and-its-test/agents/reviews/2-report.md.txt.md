Everything in the brief is done.

## Open items of the state file (verbatim)

- none.

## The cases' first run (unchanged tree, before any change)

`<worktree>` below stands for the worktree's absolute path; `$TMPDIR/g2/` holds the scratch files, made before the first run: `noTitle.md` (`Guide`, blank, `body`), `tab3.md` (`# Guide`, blank, `<TAB>body`), `nospace.md` (`#Guide`...), `empty.md`, `dir/a guide.md`, `tab5.md` (six lines, line 5 starts with `<TAB>`), `tablast.md` (four lines, last line `<TAB>last`, no newline), `notitletab.md` (`Guide`, then `<TAB>x`), `-a.md`, `pct50%s/ok.md`, `bs\nname.md` (a backslash then `n`). Each valid one holds `# Guide`, a blank line and `body`.

I ran every case with a runner kept outside the worktree (`sh "$TMPDIR/g2cases.sh" <worktree>`, which runs each case with `sh` and with `dash`, and the two stream cases). On the unchanged tree `tests/` does not exist, so every case ended without the expected line. Output as printed (the script path in the message is the absolute path the runner passes):

| Case | Command | `sh` result | `dash` result |
|------|---------|-------------|---------------|
| 1. no argument | `sh tests/guide.test.sh` | rc=127, `sh: <worktree>/tests/guide.test.sh: No such file or directory` | rc=2, `dash: 0: cannot open <worktree>/tests/guide.test.sh: No such file` |
| 2. `docs/guide.md` given | `sh tests/guide.test.sh docs/guide.md` | same message, rc=127 | same message, rc=2 |
| 3. first line `Guide` | `sh tests/guide.test.sh $TMPDIR/g2/noTitle.md` | same message, rc=127 | same, rc=2 |
| 4. tab on line 3 | `... tab3.md` | same, rc=127 | same, rc=2 |
| 5. first line `#Guide` | `... nospace.md` | same, rc=127 | same, rc=2 |
| 6. empty file | `... empty.md` | same, rc=127 | same, rc=2 |
| 7. missing path | `... nonexistent.md` | same, rc=127 | same, rc=2 |
| 8. path with a space | `... "dir/a guide.md"` | same, rc=127 | same, rc=2 |
| 9. tab on line 5 of 6 | `... tab5.md` | same, rc=127 | same, rc=2 |
| 10. last line a tab, no newline | `... tablast.md` | same, rc=127 | same, rc=2 |
| 11. `Guide` first, tab on line 2 | `... notitletab.md` | same, rc=127 | same, rc=2 |
| 12. exact reasons | the lines of cases 3 and 7 | no line printed | no line printed |
| 13. stream cases | `sh tests/guide.test.sh <missing> 2>&1 \| wc -l`; `... 2>/dev/null` | `1` (the shell's own message); the second printed nothing | not run |
| 14. empty argument | `sh tests/guide.test.sh ''` | rc=127, same message | rc=2 |
| 15. `-a.md` from its folder | `cd $TMPDIR/g2; sh <worktree>/tests/guide.test.sh -a.md` | rc=127, same message | rc=2 |
| 16. path holding `50%s` | `... pct50%s/ok.md` | rc=127, same message | rc=2 |
| 17. name holding backslash `n` | `... bs\nname.md` | rc=127, same message | rc=2 |
| 18. dash runs of cases 1, 3, 4, 8 | same commands with `dash` | not applicable | rc=2 each, as in the dash column |
| 19. the line in the page | `grep -c -F 'sh tests/guide.test.sh 2>&1 \| tail -1' docs/dev/building.md` | `0` | |
| 19. page lines 5-8 | `sed -n 5,8p docs/dev/building.md` | the fence, the character-set check, the closing fence (line 8 does not exist) | |
| 20. before the change | `sh tests/guide.test.sh` | `sh: tests/guide.test.sh: No such file or directory`, rc=127 | |

Every first-run result is the expected failure of an absent script. No case was found that the brief's own rules get wrong, so no stop was made before the code.

## DONE / NOT DONE

| # | Item | Command | Output as printed | Status |
|---|------|---------|-------------------|--------|
| V1 | Character-set check over the three paths | `printf 'tests/guide.test.sh\0docs/dev/building.md\0.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md\0' \| xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit=$?"` | the check printed no line, and `exit=0` | DONE |
| V2 | The page's command prints PASS | `sh tests/guide.test.sh 2>&1 \| tail -1` | `PASS: docs/guide.md` | DONE |
| V3 | Every case gives its line and status | `sh "$TMPDIR/g2cases.sh" <worktree>` (below) | see the case table | DONE |
| V4 | The line is in the page once | `grep -c -F 'sh tests/guide.test.sh 2>&1 \| tail -1' docs/dev/building.md` | `1` | DONE |
| V5 | Head comment read against the prose standard | reading; `LC_ALL=C grep -n '[^ -~]' tests/guide.test.sh` (no line, exit 1); `grep -c "$(printf '\t')" tests/guide.test.sh` | `0` | DONE |
| V6 | Rule 14 grep and the page paragraph | `grep -rn -e 'guide.test' -e 'building.md' docs tests` (below) | see V6 | DONE |
| W1 | Page lines 5-8 | `sed -n 5,8p docs/dev/building.md` | the fence, the character-set check, `sh tests/guide.test.sh 2>&1 \| tail -1`, the closing fence | DONE |
| W2 | The script is POSIX | `dash -n tests/guide.test.sh; echo rc=$?` | `rc=0` | DONE |
| W3 | Nothing on standard error | `sh tests/guide.test.sh $TMPDIR/g2/nonexistent.md >/dev/null 2>$TMPDIR/g2/err.txt; wc -c < $TMPDIR/g2/err.txt` | `       0` | DONE |

### V3, every case after the change

Command `sh "$TMPDIR/g2cases.sh" <worktree>`; output as printed (`$TMPDIR/` stands for the value `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/`; `rc` is the exit status):

```
== sh ==
1 no arg | rc=0 | PASS: docs/guide.md
2 docs/guide.md | rc=0 | PASS: docs/guide.md
3 no title | rc=1 | FAIL: $TMPDIR/g2/noTitle.md: first line is not a title
4 tab line3 | rc=1 | FAIL: $TMPDIR/g2/tab3.md: line 3 holds a tab
5 #Guide | rc=1 | FAIL: $TMPDIR/g2/nospace.md: first line is not a title
6 empty file | rc=1 | FAIL: $TMPDIR/g2/empty.md: first line is not a title
7 missing | rc=1 | FAIL: $TMPDIR/g2/nonexistent.md: not a readable file
8 space path | rc=0 | PASS: $TMPDIR/g2/dir/a guide.md
9 tab line5 | rc=1 | FAIL: $TMPDIR/g2/tab5.md: line 5 holds a tab
10 last line tab no newline | rc=1 | FAIL: $TMPDIR/g2/tablast.md: line 4 holds a tab
11 notitle+tab line2 | rc=1 | FAIL: $TMPDIR/g2/notitletab.md: first line is not a title
13 empty arg | rc=1 | FAIL: : not a readable file
14 -a.md from own folder | rc=0 | PASS: -a.md
15 50%s path | rc=0 | PASS: $TMPDIR/g2/pct50%s/ok.md
16 backslash-n name | rc=0 | PASS: $TMPDIR/g2/bs\nname.md
== dash ==
(the same fifteen lines, character for character, with the same rc values)
== stream cases ==
wc -l of 2>&1:        1
2>/dev/null: FAIL: $TMPDIR/g2/nonexistent.md: not a readable file
```

The dash block printed the same fifteen lines as the sh block; the brief asks for four of them (cases 1, 3, 4 and the space path), and all four match. In the table of the brief's cases: case 3 prints exactly `first line is not a title` (line 3), case 4 prints `line 3 holds a tab` with exit 1, case 9 prints `line 5 holds a tab`, case 10 prints `line 4 holds a tab` (the last line, four lines, no newline), case 11 prints exactly `first line is not a title`, case 7 prints exactly `not a readable file`, the empty argument prints exactly `FAIL: : not a readable file` with rc=1, `-a.md` prints `PASS: -a.md`, the `50%s` path and the backslash-`n` path print `PASS:` with the path as given.

### V5, the head comment against the prose standard

The head comment spans lines 1-24 of `tests/guide.test.sh` (`sed -n 1,24p tests/guide.test.sh`; line 25 is blank and line 26 is the first code line). I read it against sections 0 and A-F of `docs/dev/prose-standard.md`.

- Sentence length: counted with `awk` over lines 1-24, the longest sentence is "An empty <file>: a given path that is not a readable file, never no argument." at 15 words, under the roughly 20 of section E, and no five consecutive sentences have the same length.
- Lists: `Input:` (three items), `Output, one line on standard output and nothing on standard error:` (four items: the `PASS:` and three `FAIL:` shapes), `Rules of the output:` (four items) and `Exit status:` (two items). Each is introduced with a colon, as section D asks, and each count is what the content holds. The comment holds no paragraph of list-shaped items.
- Departure: the `- <file>: ...` and `- 0: ...` items use a plain label and a colon instead of `- **Term**: ...` bold labels (section F). A comment in a shell file is plain text with no markup, so the label is plain.
- The longest comment line is 81 characters; each list item is one comment line.
- The `PASS:` and `FAIL:` lines are shown as literals, as section F asks for literals. `LC_ALL=C grep -n '[^ -~]' tests/guide.test.sh` printed no line (exit 1), `grep -c "$(printf '\t')" tests/guide.test.sh` printed `0`. No dash aside, no semicolon, no arrow, no ALL-CAPS emphasis outside the literals `PASS` and `FAIL`, no history, no step or roadmap numbers (rule 10).

### V6, rule 14

`grep -rn -e 'guide.test' -e 'building.md' docs tests` printed:

```
docs/roadmap.md:24:- Goal: The opening paragraph of `docs/guide.md` gains a sentence naming the install command `sh install.sh`. A test `tests/guide.test.sh` checks the guide's form, and its command is in `docs/dev/building.md`.
docs/roadmap.md:25:- Gate: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (line 3 is the opening paragraph); `sh tests/guide.test.sh` prints `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1.
docs/dev/building.md:7:sh tests/guide.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:76:The verification page `docs/dev/building.md` is not a configuration file: a step that changes it runs beside other steps.
tests/guide.test.sh:3:# Run it from the repository root: sh tests/guide.test.sh [<file>]
```

- `docs/roadmap.md:24` and `:25`: they describe the entry's goal and gate and name the same script, the same default and the same line as the tree now holds. They are outside the paths this step writes and need no change.
- `docs/dev/building.md:7`: the new line itself.
- `docs/dev/change-standard.md:76`: states that the page is not a configuration file; unchanged by this step, still true, and the brief forbids changing the rules file.
- `tests/guide.test.sh:3`: the script's own usage line.

The page's paragraph, `docs/dev/building.md:3` ("The green check is every command below passing, each run from the repository root."), is reread against the page after the change. The page holds two commands in the `sh` block (lines 6 and 7), both written to run from the repository root: line 6 uses `git ls-files` and relative paths of the working directory, line 7 uses the relative path `tests/guide.test.sh`, which `sh tests/guide.test.sh 2>&1 | tail -1` run from the root prints as `PASS: docs/guide.md` (V2). The paragraph still holds as a sentence about the block.

## The files with line counts

`wc -l tests/guide.test.sh docs/dev/building.md` printed 49 and 8 lines (the report is the third path of the step).

- `tests/guide.test.sh`: new, 49 lines.
- `docs/dev/building.md`: line 7 added (seven lines before, eight after).
- `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md`: this report.

The scratch files and the runner of the cases were under `$TMPDIR` and are removed after the final run.

## Judgment calls the brief left open

- How the script reads the first line: `IFS= read -r first < "$file"`, which keeps leading spaces so that a first line of `  # x` is not a title, and reads a file with no newline at all.
- How the script finds the first tab: `grep -n "$tab" < "$file" | head -n 1`, with the file read through a redirection so that a path starting with `-` is never an option of `grep`, and with `tab` set by `printf '\t'` so that the script file holds no tab.
- How the default is taken: `file=${1-docs/guide.md}`, which uses the default only when the argument is unset, so an empty argument stays a given path (Decision 3).
- A path is readable when `[ -f "$file" ]` and `[ -r "$file" ]` both hold; a directory is therefore `not a readable file`.
- The message is printed with `printf 'FAIL: %s: %s\n'`, so the path is never a format string and a backslash in it is not expanded.

## User-visible changes, before and after

- New script `tests/guide.test.sh`. Before: `sh tests/guide.test.sh` printed `sh: tests/guide.test.sh: No such file or directory`. After: it prints `PASS: docs/guide.md` and exits 0.
- `docs/dev/building.md`, the `sh` block. Before: one command (the character-set check), the block closing on line 7. After: the line `sh tests/guide.test.sh 2>&1 | tail -1` as line 7, the closing fence on line 8. `grep -c -F` of that line: `0` before, `1` after.

## Anything in the brief that was wrong or impossible

Nothing. The line the brief dictates, `sh tests/guide.test.sh 2>&1 | tail -1`, is a pipeline. Under plain `sh` its exit status is `tail`'s, so it exits 0 on a failing file. The land skill's `templates/checks.sh` runs each verify command as `bash -o pipefail -c '<command>'`, and the rules file's section "Commands and their filters" names a filter under `pipefail` as the form of a command with long output. Under `bash -o pipefail -c` the line exits 1 on a failing file and 0 on a passing one (runs in "Repair round 1").

## Repair round 1

### Finding 1 (standards): the four facts of the head comment as a list

Before, `tests/guide.test.sh` lines 16-19 were four sentences in paragraph form:

```
# The title is checked before the tabs.
# Only the first rule broken is printed.
# <file> is printed as given.
# <n> is the number of the first line holding a tab.
```

After, lines 16-20 are a lead line ending with a colon and the same four facts as `# - ` items, in the shape of the `Input:` and `Output:` lists:

```
# Rules of the output:
# - The title is checked before the tabs.
# - Only the first rule broken is printed.
# - <file> is printed as given.
# - <n> is the number of the first line holding a tab.
```

No fact is added or dropped. The head comment now spans lines 1-24 and the script is 49 lines (`wc -l tests/guide.test.sh`).

### Finding 2 (proof): the pipeline line and the rules file

The facts, with the runs (from the worktree root, `$TMPDIR/g2/noTitle.md` a file whose first line is `Guide`):

```
bash -o pipefail -c 'sh tests/guide.test.sh $TMPDIR/g2/noTitle.md 2>&1 | tail -1'
FAIL: $TMPDIR/g2/noTitle.md: first line is not a title
bash pipefail failing rc=1
bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'
PASS: docs/guide.md
bash pipefail passing rc=0
sh -c 'sh tests/guide.test.sh $TMPDIR/g2/noTitle.md 2>&1 | tail -1'
FAIL: $TMPDIR/g2/noTitle.md: first line is not a title
plain sh failing rc=0
sh -c 'sh tests/guide.test.sh 2>&1 | tail -1'
PASS: docs/guide.md
plain sh passing rc=0
```

(`$TMPDIR/` is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/`.) The `bash pipefail` runs are the way `templates/checks.sh` runs a verify command; the `plain sh` runs are the line run by hand.

### Finding 3 (proof): the head comment's line range

V5 names the range `sed -n 1,24p tests/guide.test.sh` shows: lines 1-24.

### Checks after the round

- Verify 1: `printf 'tests/guide.test.sh\0docs/dev/building.md\0.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md\0' | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit=$?"` printed no line, and `exit=0`.
- Verify 2: `sh tests/guide.test.sh 2>&1 | tail -1` printed `PASS: docs/guide.md`.
- Verify 4: `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` printed `1`.
- Verify 5: see V5 above; `dash -n tests/guide.test.sh; echo rc=$?` printed `rc=0`.
- The cases, under `sh` and under `dash`, rerun on the changed script by the same runner as V3, printed:

```
== sh ==
1 no arg | rc=0 | PASS: docs/guide.md
2 docs/guide.md | rc=0 | PASS: docs/guide.md
3 no title | rc=1 | FAIL: $TMPDIR/g2/noTitle.md: first line is not a title
4 tab line3 | rc=1 | FAIL: $TMPDIR/g2/tab3.md: line 3 holds a tab
5 #Guide | rc=1 | FAIL: $TMPDIR/g2/nospace.md: first line is not a title
6 empty file | rc=1 | FAIL: $TMPDIR/g2/empty.md: first line is not a title
7 missing | rc=1 | FAIL: $TMPDIR/g2/nonexistent.md: not a readable file
8 space path | rc=0 | PASS: $TMPDIR/g2/dir/a guide.md
9 tab line5 | rc=1 | FAIL: $TMPDIR/g2/tab5.md: line 5 holds a tab
10 last line tab no newline | rc=1 | FAIL: $TMPDIR/g2/tablast.md: line 4 holds a tab
11 notitle+tab line2 | rc=1 | FAIL: $TMPDIR/g2/notitletab.md: first line is not a title
13 empty arg | rc=1 | FAIL: : not a readable file
14 -a.md from own folder | rc=0 | PASS: -a.md
15 50%s path | rc=0 | PASS: $TMPDIR/g2/pct50%s/ok.md
16 backslash-n name | rc=0 | PASS: $TMPDIR/g2/bs\nname.md
== dash ==
(the same fifteen lines, character for character, with the same rc values)
wc -l of 2>&1:        1
2>/dev/null: FAIL: $TMPDIR/g2/nonexistent.md: not a readable file
```

The scratch files and the runner were under `$TMPDIR` and are removed after this run.
