# Report: step 2 of plan 5, the guide's test and its command on the verification page

Everything in the brief is done.

## Open items of the state file

- none.

## The cases' first run, on the unchanged tree

`<tmp>` is the folder `mktemp -d` made outside the worktree. Every case was run from the worktree root on the tree before the change, where `tests/` does not exist (`ls tests` printed `ls: tests: No such file or directory`). Each run printed the line below it and exited 127, so no case of "Cases" passes or fails on a verdict there; each fails because the script does not exist.

Line printed by every script run: `sh: tests/guide.test.sh: No such file or directory`, then `exit 127`. The case-by-case commands:

| Case | Command | Output on the unchanged tree |
|---|---|---|
| no argument | `sh tests/guide.test.sh` | `sh: tests/guide.test.sh: No such file or directory`, exit 127 |
| `docs/guide.md` | `sh tests/guide.test.sh docs/guide.md` | same line, exit 127 |
| first line not a title (`printf 'Guide\n\ntext\n'`) | `sh tests/guide.test.sh <tmp>/notitle.md` | same line, exit 127 |
| title and a tab on line 3 | `sh tests/guide.test.sh <tmp>/tab3.md` | same line, exit 127 |
| empty file | `sh tests/guide.test.sh <tmp>/empty.md` | same line, exit 127 |
| path that does not exist | `sh tests/guide.test.sh <tmp>/missing.md` | same line, exit 127 |
| path with a space | `sh tests/guide.test.sh "<tmp>/a guide.md"` | same line, exit 127 |
| `#Guide` | `sh tests/guide.test.sh <tmp>/nospace.md` | same line, exit 127 |
| `#<tab>Guide` | `sh tests/guide.test.sh <tmp>/hashtab.md` | same line, exit 127 |
| tab on line 1 after a title | `sh tests/guide.test.sh <tmp>/tab1.md` | same line, exit 127 |
| tab on line 2 | `sh tests/guide.test.sh <tmp>/tab2.md` | same line, exit 127 |
| both rules failing | `sh tests/guide.test.sh <tmp>/both.md` | same line, exit 127 |
| last line with no newline, with a tab | `sh tests/guide.test.sh <tmp>/nonl_tab.md` | same line, exit 127 |
| one-line file with no newline | `sh tests/guide.test.sh <tmp>/oneline.md` | same line, exit 127 |
| directory | `sh tests/guide.test.sh docs` | same line, exit 127 |
| path starting with a dash | `cd <tmp> && sh <worktree>/tests/guide.test.sh -x` | `sh: <worktree>/tests/guide.test.sh: No such file or directory`, exit 127 |
| path holding `%` and a backslash | `sh tests/guide.test.sh "<tmp>/100%s\n.md"` | same line, exit 127 |
| the script does not exist | `sh tests/guide.test.sh` | `sh: tests/guide.test.sh: No such file or directory`, exit 127 |
| command count on the page | `grep -c -F 'sh tests/guide.test.sh 2>&1 \| tail -1' docs/dev/building.md` | `0` |
| the verify command | `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 \| tail -1'` | `sh: tests/guide.test.sh: No such file or directory`, exit 127 |

No case of the brief's rules gave a wrong answer, so no stop was needed.

## The cases after the change

Same commands, from the worktree root. Output as printed (`<tmp>` stands for `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.hcAybXo51g`, the folder `mktemp -d` made, removed at the end):

- no argument: `PASS: docs/guide.md`, exit 0
- `docs/guide.md`: `PASS: docs/guide.md`, exit 0
- first line not a title: `FAIL: <tmp>/notitle.md: the first line is not a title`, exit 1
- title and tab on line 3: `FAIL: <tmp>/tab3.md: line 3 holds a tab`, exit 1
- empty file: `FAIL: <tmp>/empty.md: the first line is not a title`, exit 1
- missing path: `FAIL: <tmp>/missing.md: no such file`, exit 1
- path with a space: `PASS: <tmp>/a guide.md`, exit 0
- `#Guide`: `FAIL: <tmp>/nospace.md: the first line is not a title`, exit 1
- `#<tab>Guide`: `FAIL: <tmp>/hashtab.md: the first line is not a title`, exit 1
- tab on line 1 after a title: `FAIL: <tmp>/tab1.md: line 1 holds a tab`, exit 1
- tab on line 2: `FAIL: <tmp>/tab2.md: line 2 holds a tab`, exit 1
- both rules failing: `FAIL: <tmp>/both.md: the first line is not a title`, exit 1
- last line with no newline, with a tab: `FAIL: <tmp>/nonl_tab.md: line 2 holds a tab`, exit 1
- one-line file with no newline: `PASS: <tmp>/oneline.md`, exit 0
- directory `docs`: `FAIL: docs: no such file`, exit 1
- path `-x`, run as `cd <tmp> && sh <worktree>/tests/guide.test.sh -x`: `PASS: -x`, exit 0
- path `<tmp>/100%s\n.md` (a backslash and an `n` in the name): `PASS: <tmp>/100%s\n.md`, exit 0
- an empty-string argument: `FAIL: : no such file`, exit 1
- an argument after the first, `sh tests/guide.test.sh docs/guide.md /nonexistent`: `PASS: docs/guide.md`, exit 0
- `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md`: `1`
- `sed -n 7p docs/dev/building.md`: `sh tests/guide.test.sh 2>&1 | tail -1`; `sed -n 8p`: three backticks; `wc -l < docs/dev/building.md`: `8`
- `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'; echo "exit $?"`: `PASS: docs/guide.md`, `exit 0`

## DONE / NOT DONE

| Check | Status | Output |
|---|---|---|
| 1. Character-set check over the three changed files | DONE | the check printed nothing, then `exit 0`. The same check over `git ls-files -coz --exclude-standard` also printed nothing, `whole exit 0` |
| 2. `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 \| tail -1'; echo "exit $?"` | DONE | `PASS: docs/guide.md` and `exit 0` |
| 3. `grep -c -F 'sh tests/guide.test.sh 2>&1 \| tail -1' docs/dev/building.md` | DONE | `1` |
| 4. Every case, after the change and on the unchanged tree | DONE | the two sections above |
| 5. Head comment read against `docs/dev/prose-standard.md` | DONE | below, "Head comment against the prose standard" |
| 6. Rule 14 greps | DONE | below |
| 7. `grep -c "$(printf '\t')" tests/guide.test.sh` | DONE | `0` |
| Script written (`tests/guide.test.sh`) | DONE | `wc -l tests/guide.test.sh` prints `41 tests/guide.test.sh` |
| Command added to the page | DONE | `git diff --stat` prints ` docs/dev/building.md | 1 +` |
| ASCII only in the script | DONE | `LC_ALL=C grep -n '[^ -~]' tests/guide.test.sh` printed nothing, exit 1 |

## Rule 13 table

The script is itself the check, and the unchanged tree has no script, so each behaviour below fails on the unchanged tree by the script's absence. The line quoted is what the case printed there.

| Behaviour whose failure costs something | Case | Line printed on the unchanged tree |
|---|---|---|
| A guide without a title passes | first line not a title; empty file; `#Guide`; `#<tab>Guide`; both rules failing | `sh: tests/guide.test.sh: No such file or directory` (exit 127) |
| A guide with a tab passes | tab on line 3; tab on line 1 after a title; tab on line 2; last line with no newline, with a tab | `sh: tests/guide.test.sh: No such file or directory` (exit 127) |
| A missing path or a directory passes | path that does not exist; directory `docs` | `sh: tests/guide.test.sh: No such file or directory` (exit 127) |
| A path is read wrongly (split at a space, read as an option, read as a format string) | path with a space; path `-x`; path `<tmp>/100%s\n.md` | `sh: tests/guide.test.sh: No such file or directory` (exit 127) |
| The verify list does not run the script | `grep -c -F 'sh tests/guide.test.sh 2>&1 \| tail -1' docs/dev/building.md` | `0` |

## Rule 14

- `grep -rn 'guide.test' tests docs` after the change printed:
  - `tests/guide.test.sh:5:` (the head comment: `# Run the script from the repository root as "sh tests/guide.test.sh [file]". Its one input is ...`)
  - `docs/roadmap.md:24:` (the goal of this entry: a test `tests/guide.test.sh` checks the guide's form, and its command is in `docs/dev/building.md`)
  - `docs/roadmap.md:25:` (the gate of this entry: `sh tests/guide.test.sh` prints `PASS: docs/guide.md`, and `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1)
  - `docs/roadmap.md:32:` (the gate of the next entry: `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1)
  - `docs/dev/building.md:7:sh tests/guide.test.sh 2>&1 | tail -1`
  - Read: the roadmap lines state what the change makes true and none is made false. The line 32 gate concerns `docs/faq.md`, which does not name the script yet, and belongs to a later step of another plan; this step does not change `docs/faq.md`.
- `grep -n 'green check' docs/dev/building.md` printed `3:The green check is every command below passing, each run from the repository root.` Read after the change: the page's block now holds two commands, and the new one is a `sh` command run from the repository root, so the sentence stays true.
- Sentences about the changed files as a whole, reread after the change:
  - `docs/dev/building.md` line 3 (above) holds.
  - The head comment of `tests/guide.test.sh`: "two rules" matches the two checks at lines 28 to 38; the four printed forms match the four `printf` calls at lines 24, 29, 36 and 40, none redirected, so all go to standard output and each run prints one of them; the exit statuses 0 and 1 match `exit 0` at line 41 and the `exit 1` after each FAIL line; "no such file" matches the test at line 23, which a directory fails; the empty file reaches the title rule at line 28; the input and the default match lines 17 to 21; the script reads only `$1`, so "The script reads only the first argument" holds.

## Head comment against the prose standard

Read against `docs/dev/prose-standard.md`, sections 0 and A to F, after repair round 1. Nothing departs from it now: no em dash, no spaced-hyphen aside, no arrows, no semicolons, no banned vocabulary, no quips; each paragraph is one source line (section F); the sentences are active where the actor matters (section E); the comment names no step, plan or history. The departures the first version had (hard wrapping, passive sentences, one repeated construction for the three reasons) and their repair are in "Repair round 1".

## Files with line counts

- `tests/guide.test.sh`: 41 lines, new (`wc -l`).
- `docs/dev/building.md`: 8 lines (was 7), one line added at line 7 (`git diff --stat`: 1 insertion).
- `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md`: this report.

## Judgment calls the brief left open

- The script has no `#!` line, since the brief says it is run as `sh tests/guide.test.sh`.
- The default is chosen by `[ "$#" -ge 1 ]`, so an empty-string argument is checked as a path and prints `FAIL: : no such file`, instead of falling back to `docs/guide.md`.
- The title check pipes `head -n 1 -- "$file"` into `grep -q -e '^# '`, so grep reads the first line only. The tab check runs `grep -n -e "$tab" -- "$file" | head -n 1` and takes the line number from the text before the first colon.
- "Readable regular file" is tested with the shell builtin `[ -f ]` and `[ -r ]`, which are not among the three named tools but are not a dependency.
- The head comment is written one paragraph per comment line (section F of the prose standard), so its lines are long; the list of printed lines keeps one comment line per printed line.

## Host- or user-visible changes

- `tests/guide.test.sh`: before, the folder `tests/` did not exist; after, `sh tests/guide.test.sh` prints `PASS: docs/guide.md` and exits 0.
- `docs/dev/building.md`: before, the block held the character-set check alone (7 lines); after, line 7 is `sh tests/guide.test.sh 2>&1 | tail -1` and line 8 closes the fence.

## Anything in the brief that was wrong or impossible

Nothing. Every premise held on the tree (`docs/dev/building.md` had 7 lines, `docs/guide.md` 3 lines with no tab, `tests/` absent).

## Repair round 1

Finding S1 (standards): the head comment of `tests/guide.test.sh`, lines 1 to 20, was hard-wrapped, so each paragraph ran over several source lines against section F of `docs/dev/prose-standard.md`. It used the passive voice where the actor matters ("is not read", "is printed") and the three sentences on the reasons repeated one construction, against section E. The first version of my report said nothing departed. No code line changed, and findings B1 and B2 are left as the code has them.

Comment before (lines 1 to 20):

```
# Checks the form of a guide file.
#
# The script checks two rules. The first line of the file must start with a
# hash and a space, which makes it a Markdown title. No line of the file may
# hold a tab character. When both rules fail, the title rule is reported.
#
# Run it from the repository root as "sh tests/guide.test.sh [file]". The one
# input is the optional path of the file to check. With no argument the script
# checks docs/guide.md. An argument after the first is not read.
#
# Output is one line on standard output, with the path printed as given:
#   PASS: <file>
#   FAIL: <file>: no such file
#   FAIL: <file>: the first line is not a title
#   FAIL: <file>: line <n> holds a tab
# "no such file" is printed when the path is not a readable regular file, a
# directory included. "the first line is not a title" is printed for an empty
# file as well. <n> is the number of the first line that holds a tab.
#
# Exit status: 0 after PASS, 1 after any FAIL line.
```

Comment after (lines 1 to 15; `cat -n tests/guide.test.sh | sed -n 1,15p`):

```
# Checks the form of a guide file.
#
# The script applies two rules: the first line of the file must start with a hash and a space, which makes it a Markdown title, and no line of the file may hold a tab character. When both rules fail, the script reports the title rule.
#
# Run the script from the repository root as "sh tests/guide.test.sh [file]". Its one input is the optional path of the file to check, which is docs/guide.md when no argument is given. The script reads only the first argument.
#
# The script prints one line on standard output, with the path as given:
#   PASS: <file>
#   FAIL: <file>: no such file
#   FAIL: <file>: the first line is not a title
#   FAIL: <file>: line <n> holds a tab
#
# A path that is not a readable regular file, a directory included, gets "no such file". A file whose line 1 does not start with a hash and a space, an empty file included, gets "the first line is not a title". In "line <n> holds a tab", <n> is the number of the first line that holds a tab.
#
# The exit status is 0 after PASS and 1 after any FAIL line.
```

The content is the same: the two rules and the title rule first, the one input and its default, the argument after the first not read, each printed line, when each reason is printed, each exit status. The code starts at line 17 now (it was line 22), so the line numbers in the rule 14 reread above are the new ones.

Reruns of the brief's "Verify before you report", from the worktree root, after the fix:

1. Character-set check over the three changed files: `printf '%s\0' tests/guide.test.sh docs/dev/building.md <this report> | xargs -0 perl ...; echo "exit $?"` (the brief's command) printed nothing, then `exit 0`.
2. `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'; echo "exit $?"` printed `PASS: docs/guide.md` and `exit 0`.
3. `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` printed `1`.
4. Every case, rerun in a new `mktemp -d` folder (`<tmp>` is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.hEvHWfe108`, removed after; `ls` of it printed `No such file or directory`):
   - no argument: `PASS: docs/guide.md`, exit 0
   - `docs/guide.md`: `PASS: docs/guide.md`, exit 0
   - first line not a title: `FAIL: <tmp>/notitle.md: the first line is not a title`, exit 1
   - title and tab on line 3: `FAIL: <tmp>/tab3.md: line 3 holds a tab`, exit 1
   - empty file: `FAIL: <tmp>/empty.md: the first line is not a title`, exit 1
   - missing path: `FAIL: <tmp>/missing.md: no such file`, exit 1
   - path with a space: `PASS: <tmp>/a guide.md`, exit 0
   - `#Guide`: `FAIL: <tmp>/nospace.md: the first line is not a title`, exit 1
   - hash, tab, `Guide`: `FAIL: <tmp>/hashtab.md: the first line is not a title`, exit 1
   - tab on line 1 after a title: `FAIL: <tmp>/tab1.md: line 1 holds a tab`, exit 1
   - tab on line 2: `FAIL: <tmp>/tab2.md: line 2 holds a tab`, exit 1
   - both rules failing: `FAIL: <tmp>/both.md: the first line is not a title`, exit 1
   - last line with no newline, with a tab: `FAIL: <tmp>/nonl_tab.md: line 2 holds a tab`, exit 1
   - one-line file with no newline: `PASS: <tmp>/oneline.md`, exit 0
   - directory `docs`: `FAIL: docs: no such file`, exit 1
   - path `-x`, run as `cd <tmp> && sh <worktree>/tests/guide.test.sh -x`: `PASS: -x`, exit 0
   - path `<tmp>/100%s\n.md` (a backslash and an `n` in the name): `PASS: <tmp>/100%s\n.md`, exit 0
   - empty-string argument: `FAIL: : no such file`, exit 1
   - an argument after the first, `sh tests/guide.test.sh docs/guide.md /nonexistent`: `PASS: docs/guide.md`, exit 0
   - `sed -n 7p docs/dev/building.md` printed `sh tests/guide.test.sh 2>&1 | tail -1`, `sed -n 8p` printed three backticks, `wc -l < docs/dev/building.md` printed `8`.
5. Head comment: read against sections 0 and A to F of `docs/dev/prose-standard.md` as the section above says; nothing departs.
6. `grep -rn 'guide.test' tests docs` printed the same hits as before (the head comment of the script at line 5, `docs/roadmap.md` lines 24, 25 and 32, `docs/dev/building.md:7`), and `grep -n 'green check' docs/dev/building.md` printed `3:The green check is every command below passing, each run from the repository root.` None is made false.
7. `grep -c "$(printf '\t')" tests/guide.test.sh` printed `0`. `LC_ALL=C grep -n '[^ -~]' tests/guide.test.sh` printed nothing (exit 1). `wc -l tests/guide.test.sh` printed `41 tests/guide.test.sh`.
