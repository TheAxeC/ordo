# Gate run, step 7: agent a8345eb24bd6ca099

The run of `/ordo-init build` on the clone finished. It wrote and committed `utils/build.py` (mode 755) and rewrote the command blocks of `docs/dev/building.md` and `docs/dev/change-standard.md`. The read-back matches the page's commands, and the driver's `gate` run exited 0 with 16 commands passed, both the skill's run and mine. One problem: `ruff format --check` fails on the driver, because the skill's rule to always use double quotes conflicts with ruff's quote style (issue 6 below).

## Invocation

I invoked the skill through the Skill tool, `skill: ordo-init`, `args: build <clone path>`. The installed text resolves to /Users/axelfaes/.local/share/ordo-stable/skills/ordo/ordo-init. I worked only inside the clone and ran every script with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front.

## Stops

There was one stop, "The draft of the driver" ("Steps / The build driver" 6). It showed the three lists, the driver, the diffs of both pages, the note that there is no `CLAUDE.md`, and the commit question. The answers were:
1. The draft is approved as shown.
2. Yes, the skill may commit the three files in one commit.

No other stop was raised. The plan and roadmap folders were found, the page states commands, no file stood at `utils/build.py`, and the read-back was equal.

## Clone state

`git log --oneline -3`:
```
3afb89f Add the build driver utils/build.py and name its commands on the verification page and in the change standard
db692d9 Land step 3 of roadmap entry 25: the build driver - ...
5e48058 Send repair round 1 of step 3 of roadmap entry 25 - ...
```

`git status --short` prints nothing (clean).

`git show --stat HEAD`:
```
 docs/dev/building.md        |  28 ++-----
 docs/dev/change-standard.md |  20 +----
 utils/build.py              | 198 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+), 38 deletions(-)
```

`CLAUDE.md` is not in the commit. It does not exist in the clone, and `git check-ignore -v` prints `.gitignore:6:/CLAUDE.md`.

The committed files equal the approved drafts byte for byte. `cmp` against the draft files in /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/draft/ (build.py, building.md, change-standard.md) printed nothing for each.

## `cat utils/build.py`

- **Lines 1 to 48** are `templates/utils/build.py` unchanged. That is the shebang, the r-docstring from "The build driver: runs the build, test and check commands of this repository, and the gate." through the exit-status list, the three imports, and `ROOT = ".."`.
- **From `LISTS = {"build": BUILD, "test": TEST, "check": CHECK}` to `sys.exit(main(sys.argv[1:]))`**, the file is also the template unchanged: `USAGE`, `FailedCommandError`, `_passed`, `run_list`, `main`.
- **Between them**, exactly as approved:

```python
BUILD: list[str] = []

TEST: list[str] = [
    # strip_comments.py on pairs of C, C++ and CMake files that differ in a comment or in code, and
    # on files it refuses
    "sh skills/code/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1",
    # land.sh on a conflict, a ledger file left in the worktree, a failing check, a clean landing
    # and a step whose new test script and command, left uncommitted in the worktree, reach main and
    # run there, and on a plan.yaml in a project folder, a missing fourth argument and a root
    # outside the repository
    "sh skills/orchestration/land/templates/land.test.sh 2>&1 | tail -1",
    # check_config.py on complete and broken configurations, on the search for plan.yaml and on
    # paths read from its folder
    "sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1",
    # anchorize_tex.py on scratch .tex files: the blocks of paragraphs, of a table and of a document
    # environment, the .tex left unchanged, the manifest's spans
    "sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1",
    # apply_tex_patch.py on scratch .tex files: a patch applied, a wrong hash, a stale manifest, two
    # ops on a block, a structural change, an output equal to the input and --check-only
    "sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1",
    # calibration_counts.py on tables of pairs: a table judged without error, a miss rate and a
    # false-alarm rate at the limit, a label outside the three
    "sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1",
    # lookup.py on recorded response bodies and scratch .tex and .bib files, offline: matching,
    # merging, cite-keys, the title check of check-urls, the arguments of quote-check, resolve of a
    # title with its year, the published version of an arXiv ID in bibtex, the ASCII entry of bibtex
    # and the title ratio of a converted entry, bibtex --page on a venue's page, fetch --page, the
    # PMCID line of resolve, text and text --abstract on saved HTML, XML and PDF files with a
    # pdftotext stand-in, the URLs the other commands request, resolve over several identifiers in
    # batches with a DOI holding a filter separator asked alone, refs and cited-by with their list
    # cap and --since, index-abstract with its files and exit statuses, dblp on recorded SPARQL
    # replies with its exact query first, its words query after an exact reply of CoRR records only,
    # and its cut line at 1000 rows, PubMed in search, the pacing of each index across processes,
    # E-utilities, Europe PMC and DBLP among them, the 429 handling and the reply cache
    "sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1",
    # reference_docx.py on pandoc's reference document, on scratch files: the layout defaults in the
    # styles and the section properties, each profile field overriding its default, every other part
    # byte for byte as pandoc wrote it, the refusal of a file that is not a .docx and of a value
    # outside a field's form, and a conversion by pandoc with the written document
    "sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1",
    # check_limits.py on scratch funder configs, .tex files, logs and grant-fields.md files: the
    # page count of the log, the words and characters of a section, of the whole document and of a
    # form field's text under its heading in the file of form-field texts, what is left out of a
    # count, the rows not checked, a run with - as the PDF, with and without a main .tex, and its
    # refusals
    "sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1",
    # check_sections.py on scratch funder configs and .tex files: a heading held, missing, out of
    # order, not required or not in the config, a commented heading, brought-in files and its
    # refusals
    "sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1",
    # sync_rules.py --write on drifted shared-rules and plan-terms blocks, the bytes it keeps and
    # its refusals, and --glossary on a glossary at another path, on a missing file and on the paths
    # it refuses
    "sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1",
    # build.py, the build driver, on scratch trees: build, test, check and gate on passing, failing,
    # filtered, chained and empty lists, the usage, quotes and backslashes kept, the repository root
    # whatever the folder, no input, a signal, a run by its path and no bytecode file
    "sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1",
    # pin.sh in pin and check mode under a scratch HOME, its refusals included
    "sh utils/pin.test.sh 2>&1 | tail -1",
    # template.sh in scratch scripts: run_cmd on a yes, a no, the end of input, a failing command, a
    # call with no command and an argument holding a space and a ;, have on an installed and a
    # missing tool, WIZARD_OS under scratch uname commands and with none, version_at_least on equal,
    # later and earlier versions, on leading zeros and on text that is no version, and by_hand with
    # a text and with none
    "sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1",
]

CHECK: list[str] = [
    # Ordo's glossary block equals plan-terms.md
    "python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary",
    (
        "git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e \"$f\" ]; then "
        "printf \"%s\\0\" \"$f\"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ "
        "/\\.md\\z/ ? qr/[^\\x20-\\x7E\\x{2705}\\n]/ : qr/[^\\x20-\\x7E\\n]/; if (/$bad_char/) { "
        "print \"$ARGV:$.: $_\"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'"
    ),
]
```

## Changes to the three files

**`docs/dev/building.md`** (3 hunks):
- The `sh` block's 16 commands with their `#` comments become two lines, `python3 utils/build.py test` and `python3 utils/build.py check`. There is no build line, because BUILD is empty.
- Line 3: "The green check is every command below passing, each run from the repository root." becomes "The green check is the two commands below passing, each run from the repository root. The commands themselves stand in the build driver `utils/build.py`: `test` runs its list `TEST`, the tests, and `check` runs its list `CHECK`, the glossary check and the ASCII check, and the comment above each command in the driver says what it covers. `./utils/build.py gate` runs both in turn."
- Line 24: "The filter that keeps the summary line is `2>&1 | tail -1`." becomes "The filters stand in the driver: each test command of `TEST` ends with `2>&1 | tail -1`, the filter that keeps the summary line."
- "as the `2>&1 | tail -1` filter above runs," becomes "as the `2>&1 | tail -1` filter of the driver's test commands runs,".
- "The last command is the ASCII check over" becomes "The last command of the driver's list `CHECK` is the ASCII check over".
- The last line: "adds its test here and to the command block of `docs/dev/change-standard.md` only when it has one." becomes "adds its test to the list `TEST` of `utils/build.py` only when it has one."

**`docs/dev/change-standard.md`** (1 hunk, section "Commands and their filters"):
- The 16 lines of the code block become `python3 utils/build.py test` and `python3 utils/build.py check`.
- The sentence above the block "...never enters the context; the glossary check and the ASCII check take no filter:" becomes "...never enters the context. The commands and their filters stand in the build driver `utils/build.py`, as `docs/dev/building.md` says; the glossary check and the ASCII check take no filter:".

**`CLAUDE.md`**: no change. The file is absent and ignored.

## Read-back ("Steps / The build driver" 8)

```
ROOT: ..
TEST: sh skills/code/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
TEST: sh skills/orchestration/land/templates/land.test.sh 2>&1 | tail -1
TEST: sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
TEST: sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
TEST: sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
TEST: sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
TEST: sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1
TEST: sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1
TEST: sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
TEST: sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
TEST: sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1
TEST: sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1
TEST: sh utils/pin.test.sh 2>&1 | tail -1
TEST: sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1
CHECK: python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
CHECK: git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
```

I compared it with the commands of `git show HEAD~1:docs/dev/building.md`, with the comment taken off and `2>&1 | tail -1` added to each `.test.sh` line. `diff` of the two sorted lists printed nothing, so every command is equal character for character. An unsorted `diff` shows one difference, and it is order only: the glossary check was line 17 of the page, between the tests, and is now first in CHECK (issue 4 below). `ROOT` is `..`, the value of step 3.

## The skill's own gate run

`env -u ... python3 utils/build.py gate` printed:
- `build.py build: no command is named, skipped`
- each `$ <command>` line followed by its `PASS:` line, for all 14 tests
- `build.py test: 14 commands passed`
- `ok: the plan-terms block equals the template`
- `build.py check: 2 commands passed`
- `build.py gate: 16 commands passed`
- `exit 0`

## My gate run after the run

`./utils/build.py gate; echo "exit $?"`, last 30 lines. I cut each line at 200 characters for display.
```
PASS: check_config.py scratch tests
$ sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, ...
$ sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks ...
$ sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
PASS: calibration_counts.py counts misses and false alarms per label, ...
$ sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, ...
$ sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1
PASS: reference_docx.py writes the layout defaults ...
$ sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
PASS: check_limits.py reads the page count of the log ...
$ sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
PASS: check_sections.py prints ok for each heading ...
$ sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1
PASS: build.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1
PASS: template.sh scratch tests, 12 cases
build.py test: 14 commands passed
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ git ls-files -coz --exclude-standard | xargs -0 sh -c ... (the ASCII check)
build.py check: 2 commands passed
build.py gate: 16 commands passed
exit 0
```

## ruff and awk

ruff is installed at /Users/axelfaes/.local/bin/ruff.
- **`ruff check ...`** printed `All checks passed!`, exit 0.
- **`ruff format ... --check utils/build.py`** printed `unformatted: File would be reformatted --> utils/build.py:123:9` and `1 file would be reformatted`, exit 1. The diff it shows changes only the three literals of the ASCII check that hold `\"`. ruff would write them in single quotes: `'git ls-files ... sh -c \'for f; do if [ -e "$f" ]; then '`, `'printf "%s\\0" "$f"; fi; done\' sh | ... $ARGV =~ '` and `'print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }\''`.
- **`awk 'length($0) > 100' utils/build.py | wc -l`** printed `0`.

## Where the skill's text gave no instruction, disagreed with itself, or produced something wrong

1. **The commit rule ("What it reads" 7; "Steps / The build driver" 6, "Where the repository's rules state no commit rule, the draft asks whether the skill may commit").**
   - The repository has no `CLAUDE.md`.
   - The rules page has "No git command that changes state: no `add`, `commit`, ..." under "Where the work happens", which addresses builders in worktrees.
   - The skill does not say whether a rule addressed to builders counts as the repository's commit rule. I read it as stating none for this skill and asked the question.
2. **A missing `CLAUDE.md` ("Steps / The build driver" 6 part 4, "As a diff, the Build section of `CLAUDE.md` and the command block of the page the `rules` key names").**
   - The skill gives no instruction for a repository with no `CLAUDE.md`, or one git ignores.
   - I showed no diff and said why.
3. **Which commands take the filter ("Steps / The build driver" 2, "the filter the page names in a sentence for the summary line of its test commands, written after the command").**
   - The skill does not say how to tell a test command from the other commands for this rule.
   - I gave the filter to the 14 `.test.sh` commands and not to `sync_rules.py . --only glossary` or the ASCII check. The change standard says explicitly that those two take no filter.
4. **Command order ("Steps / The build driver" 5 sorts into three lists; step 8 holds each command equal).**
   - Sorting into lists changes the run order: the glossary check, the page's 12th command, now runs after all 14 tests.
   - The skill does not say whether page order matters, or how the read-back compares order. It reads as comparing each command, and I compared them that way.
5. **Which sentences to rewrite ("Steps / The build driver" 6 part 3, "Its sentences say that the commands themselves stand in the driver").**
   - The skill does not say which sentences to rewrite, or what to do with sentences the change makes false.
   - On this page those were "The last command is the ASCII check", "the `2>&1 | tail -1` filter above", and "adds its test here and to the command block of `docs/dev/change-standard.md`". I rewrote all three by judgment, as approved.
   - Each command's descriptive `#` comment moved off the page into the driver (step 5), so the page no longer says what each test covers. The skill states this, but it is a loss for a reader of the page.
6. **ruff format conflict, a produced defect ("Steps / The build driver" 5, "Each command is written as a Python string in double quotes, each backslash written `\\` and each `"` written `\"`, as the head comment of `templates/utils/build.py` says").**
   - Followed to the letter, this gives a driver that `ruff format --check` rejects whenever a command holds a double quote.
   - ruff prefers single quotes when that needs fewer escapes. The rule and the formatter disagree.
7. **Unclear phrase in "Steps / The build driver" 9, "in the mode typed in an existing or a configured repository".**
   - The phrase does not parse clearly. I read it as "when the mode is typed, in an existing or a configured repository, as opposed to run from 'Steps / A new repository' 9", and ran `gate` once.
8. **Line breaks in long strings ("Steps / The build driver" 5, "written as adjacent string literals inside parentheses ... broken so that no line passes 100 characters").**
   - The skill does not say where to break: between words, or anywhere.
   - I broke after spaces, so no word is split.
