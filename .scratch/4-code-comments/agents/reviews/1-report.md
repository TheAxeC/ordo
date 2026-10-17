# Step 1 report, the code-comments skill with its comparison script and its test

Everything in the brief is done. The plan's whole verify list runs once at landing on main, and is not run here.

## Open items of the state file

```
- none.
```

(`.scratch/4-code-comments/orchestrator-state.md`, "Open items".)

## The cases' first run

The first run was made on the unchanged tree (`git status --short` printed nothing, `ls skills/code-comments` printed `ls: skills/code-comments: No such file or directory`). Fixtures were scratch files under the session scratchpad, written from the brief's examples.

### Rulings carried

One case was handed back before any code: the rules of the brief gave `differ` where case 14 (its third part, a `///` comment on the first line of the file deleted) expects `equal`, and the same for case 5 when the moved comment is on the file's first code line. The run of "each comment becomes one space, a run of whitespace becomes one space" on `/// doc\nint f();\n` against `int f();\n` printed:

```
14.a.cpp ' int f(); '
14.b.cpp 'int f(); '
differ
```

The user ruled (a), open item B (booked in `plan.md`, Rulings, on main in commit 1569e18): the stripped form drops the whitespace at the start of the file and ends with exactly one newline; a run of whitespace that holds the newline before a preprocessor directive, or the newline that ends one, becomes one newline, and any other run one space. It settles cases 5, 11 and 14, which stand as the brief has them, expecting `equal`. The script's head comment states this computation. The orchestrator also ruled the digit separator reading and the output streams (judgment calls 1 and 2 below, booked in `.scratch/4-code-comments/agents/briefs/1-round-1.md`, Rulings 2).

### Cases 1 to 20 (tests)

Command, for each: `python3 skills/code-comments/templates/strip_comments.py --compare <a> <b>` on the pair of scratch files of the case. Every one printed this line and exited 2:

```
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/4-code-comments-1/skills/code-comments/templates/strip_comments.py': [Errno 2] No such file or directory
```

| Case | Pair run | First-run output |
|---|---|---|
| 1 | `//` comment after `mountPhysical(...)` reworded | the line above, exit 2 |
| 2 | `true` changed to `false` | the line above, exit 2 |
| 3 | `/*writable=*/` text changed | the line above, exit 2 |
| 4 | doc block reflowed; doc block with a word changed | the line above, exit 2 for each |
| 5 | comment moved above its line | the line above, exit 2 |
| 6 | `"http://127.0.0.1:"` to `"http://127.0.0.2:"` | the line above, exit 2 |
| 7 | `'"'` and `'\''`, comment changed; code changed | the line above, exit 2 for each |
| 8 | `R"x(a "b" // c */ d)x"`, text after its `//` changed; comment after it changed | the line above, exit 2 for each |
| 9 | `1'000`, comment changed; `1'001` | the line above, exit 2 for each |
| 10 | `//` comment ending in a backslash, next line changed | the line above, exit 2 |
| 11 | comment removed between two `#define`; defines joined | the line above, exit 2 for each |
| 12 | continued `#define`, code changed; last-line comment changed | the line above, exit 2 for each |
| 13 | `#include "save/save_store.h"   // ...`, comment changed; name changed | the line above, exit 2 for each |
| 14 | trailing, whole-line and first-line comment deleted | the line above, exit 2 |
| 15 | comment reworded to hold an apostrophe and a double quote | the line above, exit 2 |
| 16 | `CMakeLists.txt`, `# PRIVATE: ...` line reworded | the line above, exit 2 |
| 17 | `target_link_libraries(app PRIVATE engine)   # why`, comment changed; argument changed | the line above, exit 2 for each |
| 18 | `"a # b"` changed after its `#` | the line above, exit 2 |
| 19 | `#[[ ]]` changed on its third line; `#[=[ ]=]`; `[[ a # b ]]` changed after its `#` | the line above, exit 2 for each |
| 20 | unterminated `/*`, code before it changed | the line above, exit 2 |

### Cases 21 to 24

| Case | Command | First-run output |
|---|---|---|
| 21 | `python3 .../strip_comments.py notes.md` | the python line above, exit 2; it does not start with `strip_comments: ` |
| 22 | `python3 .../strip_comments.py --compare 14.a.cpp CMakeLists.txt` | the python line above, exit 2; same fault |
| 23 | `python3 .../strip_comments.py nosuchfile.cpp`, and `.../strip_comments.py bad.cpp` (bytes `not\xff\xfeutf8`) | the python line above for each, exit 2; same fault |
| 24 | `python3 .../strip_comments.py`, and `... --compare 14.a.cpp` | the python line above for each, exit 2; no usage printed |

Case 24 now, after the change (`python3 skills/code-comments/templates/strip_comments.py; echo "exit $?"`, then `... --compare <one path>`):

```
usage: strip_comments.py <file>
       strip_comments.py --compare <a> <b>
exit 2
usage: strip_comments.py <file>
       strip_comments.py --compare <a> <b>
exit 2
```

Case 24 is checked by this quoted run and keeps no test.

### Cases 25 to 45 (read)

First read on the unchanged tree: `skills/code-comments` does not exist, and `grep -rln -E 'No report to apply|Not a range|A range that does not resolve|A number the report does not hold|strip_comments|code-comments' --exclude-dir=.git --exclude-dir=.scratch .` printed `docs/academic-coverage.md`, `docs/roadmap.md` and the ADR 0014 file only. None of these states a refusal, a step or a rewrite rule, so each of cases 25 to 45 was unmet on that tree. Read now in `skills/code-comments/SKILL.md`:

| Case | Where `SKILL.md` meets it |
|---|---|
| 25 | "What it reads" 1 (refusal "No plan configuration" naming `/ordo-init`); Stops row "No plan configuration" |
| 26 | "What it reads" 3, second bullet; Steps 3, first bullet; Stops row "A range that does not resolve" |
| 27 | "What it reads" 3, third bullet; Stops row "Not a range" |
| 28 | "What it reads" 3, second bullet (the single-quoted `rev-parse`); Steps 3, first bullet (no other command runs); "Rules", third bullet |
| 29 | "Rules", third bullet; every command of Steps 3, Steps 5, "The rewrite" 3, 4, 6, 7 and 8 gives the path in single quotes |
| 30 | "What it reads" 4, last bullet; Stops row "Nothing to review" |
| 31 | "What it reads" 3, first bullet; Steps 3, the `git ls-files --others` bullet and the last-but-one bullet |
| 32 | "What it reads" 4, second bullet |
| 33 | "What it reads" 4, third bullet |
| 34 | "Rules of a comment", "True of the code"; "Finding agent", fifth bullet; "Checking agent", fifth bullet and the "False comments" part |
| 35 | "Rules of a comment", "No history" and "No step numbers"; "Checking agent", sixth bullet |
| 36 | "Finding agent", sixth bullet; "Checking agent", first bullet; "The rewrite" 5, third bullet |
| 37 | "What it reads" 5, second bullet; "The rewrite" 1 |
| 38 | "What it reads" 5, first bullet; "The rewrite" 1 |
| 39 | "The rewrite" 2 and 8 |
| 40 | "The rewrite" 3 |
| 41 | "The rewrite" 4 (copies under the repository path), 6 and 7; Anti-patterns, fourth row |
| 42 | "The rewrite" 4, 6 and 7 (copy first, compared, put back from the copy); Anti-patterns, fifth row |
| 43 | "The rewrite" 6 |
| 44 | "The rewrite" 7 |
| 45 | "The rewrite" 4 and 8 |

## DONE / NOT DONE

| Item | Command | Output as printed | State |
|---|---|---|---|
| Test on the unchanged tree (test written first, script absent) | `sh skills/code-comments/templates/strip_comments.test.sh 2>&1 \| tail -3`, then `... >/dev/null 2>&1; echo "exit $?"` | `FAIL: case 1, comment reworded: --compare printed '/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/4-code-comments-1/skills/code-comments/templates/strip_comments.py': [Errno 2] No such file or directory' with exit 2, expected 'equal' with exit 0` and `exit 1` | DONE |
| Test after the change | `sh skills/code-comments/templates/strip_comments.test.sh 2>&1 \| tail -1` | `PASS: strip_comments.py scratch tests` | DONE |
| Test exit status | `sh skills/code-comments/templates/strip_comments.test.sh >/dev/null 2>&1; echo "exit $?"` | `exit 0` | DONE |
| `check_config.py` reads the changed template | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 \| tail -1` | `PASS: check_config.py scratch tests` | DONE |
| Glossary block equals the template | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` | DONE |
| `sync_rules.py` test | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: sync_rules.py scratch tests` | DONE |
| Character-set check over the 20 changed files of the brief's list | the brief's `printf '%s\0' ... \| xargs -0 perl -CSD -ne ...`, then `echo "charset exit $?"` | no output, then `charset exit 0` | DONE |
| Frontmatter | `python3 -c 'import yaml; d=yaml.safe_load(open("skills/code-comments/SKILL.md").read().split("---")[1]); print(d["name"], d["metadata"]["version"], len(d["description"]))'` | `code-comments 1.0.0 756` | DONE |
| Wiring | `grep -c "code-comments" <the brief's files>` | `docs/dev/change-standard.md:1`, `docs/dev/scripts.md:2`, `docs/dev/building.md:1`, `README.md:3`, `agents/ordo-medium.md:2`, `agents/ordo-low.md:2`, `agents/ordo-high.md:2`, `agents/ordo-max.md:2`, `agents/ordo-xhigh.md:2`, `.agents/plan.yaml:1`, `skills/plan/templates/plan.yaml:2`, `skills/plan/templates/orchestrator-state.md:2`, `skills/repo-setup/templates/docs/glossary.md:1`, `skills/repo-setup/templates/plan-terms.md:3` | DONE |
| `plan-terms.md` lines | `grep -n -o -E '^- \*\*(effort agent\|reviewer\|finding)\*\*\|.{0,25}`code-comments`.{0,25}' skills/repo-setup/templates/plan-terms.md` | `39:- **effort agent**`, `41:- **finding**`, `99:- **reviewer**`, with `code-comments` on lines 39, 41 and 99 | DONE |
| Versions | `grep -n "^  version" skills/plan/SKILL.md skills/repo-setup/SKILL.md` | `skills/plan/SKILL.md:5:  version: "5.0.2"`, `skills/repo-setup/SKILL.md:5:  version: "5.3.0"` | DONE |
| Plan's whole verify list | runs once at landing on main | not run here | for landing |

The test is a test of added behaviour for each row below. On the unchanged tree it stops at its first case, since the script is absent; the other cases sit behind it and are the first-run table above.

| Behaviour whose failure costs something | Case | Failing line on the unchanged tree |
|---|---|---|
| A code change kept as `equal` or a comment-only rewrite refused, in C and C++ and CMake | 1 to 20 | the `FAIL: case 1, ...` line quoted above |
| A rewrite of a file the script cannot read kept | 21 to 23 | not reached on the unchanged tree (stops at case 1); first-run table above |

Checks run after the change are not narrowed by a filter that hides a failure: the test is run twice, once through `tail -1` and once for its exit status.

## Skill read against the layout, the rulings and ADR 0014

`skills/code-comments/SKILL.md` against `docs/dev/skill-layout.md`:

| Section of the layout | Place in `SKILL.md` |
|---|---|
| Frontmatter | `name: code-comments`, `metadata.version: "1.0.0"`, a one-paragraph `description` of 756 characters ending in `Triggers on:`, naming no other skill |
| 1 Title and paragraph | `# Review the comments of a diff` and a three-sentence paragraph |
| 2 Quick start | `## Quick start`, five lines, the first the one typed first |
| 3 Use instead | `## Use instead`, a When/Use table |
| 4 What it reads | `## What it reads`, items 1 to 5, each refusal named in its item |
| 5 Steps | `## Steps` 1 to 8, then `### The rewrite` 1 to 8, each item ending on "Done when" |
| 6 Reference sections | `## Rules of a comment`, `## Finding agent`, `## Checking agent`, material every run reads |
| 7 Stops | `## Stops`, a table with the four columns |
| 8 Anti-patterns | `## Anti-patterns`, a table with the three columns |
| 9 Rules | `## Rules`, bullets |

Against the rulings:

| Ruling | Place |
|---|---|
| D1 (report, user picks, fresh agent rewrites, a check proves only comments changed) | Steps 8; "The rewrite" 1 to 8 |
| D2 (a git diff, default `HEAD`, or a range; only added or changed comments) | "What it reads" 3 and 4; "Finding agent", first bullet |
| D3 (the rules a comment is judged by) | "Rules of a comment" |
| D4 (grep for non-ASCII, finding agent, checking agent, one report with false comments first) | Steps 5, 6, 7 and 8; "Finding agent"; "Checking agent" |
| D5 (the gate's diff) | step 2 of the plan; this step reads its shapes in the cases |
| D6 (what entry 4 waits on) | not a content of this step |
| D7 (a script proves a rewrite changed only comments; `differ` is put back; other languages get findings only; commits nothing; the script has a test) | "The rewrite" 2, 6, 7 and 8; "Rules"; `strip_comments.py`; `strip_comments.test.sh` |
| E1 (`apply <numbers>` or `apply all`) | Quick start; "What it reads" 5; "The rewrite" 1 |
| E2 (the rewrite agent runs on `reviewer` at `reviewer_effort`) | "The rewrite" 5 |

Against ADR 0014's Decision, sentence by sentence: reads the uncommitted changes or a range ("What it reads" 3); judges only comments the diff adds or changes ("Finding agent", first bullet); non-ASCII by `LC_ALL=C grep -n '[^ -~]'` (Steps 5); fresh agent that changes nothing reads the diff, the files whole and the rules (Steps 6); the checking agent's three conditions ("Checking agent", bullets 2 to 4); false comments first (bullet 9); the user says which to apply and a fresh agent rewrites in the working tree and commits nothing ("The rewrite" 1 and 5); `--compare` per rewritten C, C++ or CMake file, `differ` put back and named ("The rewrite" 6 to 8); other languages get findings and no rewrite ("The rewrite" 2).

`strip_comments.py` against open items A and B: each comment one space (`Form.space`, `strip_cpp`, `strip_cmake`); a backslash-newline outside a literal deleted first (`join_splices`); whitespace runs one space, a run next to a directive one newline (`Form.newline`, the `#` branch and the newline branch of `strip_cpp`); the form starts at its first item and ends with one newline (`Form.add`, `Form.text`); literals, quoted arguments and bracket arguments kept byte for byte (`strip_cpp` takes the source slice, `strip_cmake` the text); `--compare` prints `equal` or `differ`.

## Standards on list items and sentence length

Read against the prose standard, section E and the layout's "Lists and tables", with `SKILL.md` line numbers as on main after the landing. Departures, each one rule whose parts cannot be split without separating a command from its purpose or a rule from its condition:

- Line 3, the description, runs 41, 34 and 35 words per sentence: the layout asks for one paragraph holding what the skill does, what it produces and the triggers.
- Line 10 (32 words), the third sentence of the opening paragraph, lists what the reply `apply` starts.
- Lines 41, 50 and 74 (29 to 33 words) each give a command or a refusal with its condition.
- Line 85 (28 words) names the stop and where its test is defined.
- Line 89 (32 words), the start of the checking agent, names the trigger and the way the agent is started.
- Lines 114, 135, 137 and 138 (22 to 31 words) each give a command with the paths it takes and when it runs.
- Line 211 (26 words), the rewrite agent's last bullet, gives the final message's shape.
- Line 244 (23 words) gives the rule and its reason.
- "Rules", the single-quote bullet (38 words) and the option bullet, line 247 (35 words): each is one rule with its form.
- "Rules of a comment", "Serves a purpose" and "No history" (30 and 33 words), and "Finding agent", third bullet (35 words): each is one rule whose qualifiers belong in its bullet.
- The new `plan-terms.md` text keeps the file's one-line-per-term form, so each entry is one long line.
- The new README row keeps the table's one-row form.
- Table cells in Stops and Anti-patterns hold a phrase or a sentence each.

## Terms

| Term (`docs/glossary.md`) | Use or change | Check |
|---|---|---|
| effort agent | entry changed: `code-comments` joins the agents launched as `ordo-<reviewer_effort>`, "Stated in" gains `code-comments`, Steps 4, 6 and 7, and "Steps / The rewrite" 5 | `grep -n -E 'effort agent\|ordo-<reviewer_effort>' skills/code-comments/SKILL.md` prints Steps 4 (the term), Steps 6 and "The rewrite" 5 (`ordo-<reviewer_effort>`); Steps 7 starts the agent "as Steps 6 starts the finding agent" |
| reviewer | entry changed: the agents of `code-comments` run on `reviewer:`, "Stated in" gains `code-comments`, Steps 6 | `grep -n 'reviewer' skills/code-comments/SKILL.md` prints Steps 6 ("the model `reviewer` names") |
| finding | entry changed: a sense for `/code-comments`, "Stated in" gains `code-comments`, "Finding agent" and "Checking agent" | both sections define a finding by its place, quoted comment, rule and what the rule asks for, and name no replacement |
| refusal, stop, runner, session, completion notice, plan configuration, standards | used in the senses their entries define | read against each entry |

The entry **effort agent** is stated in Steps 4 by the term and in Steps 6, 7 and "The rewrite" 5 by the launch it defines; `writing`'s Steps 6 states it the same way. `docs/glossary.md`'s block was synced with `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, which printed `written: the plan-terms block now equals the template`.

## Files

New:

- `skills/code-comments/SKILL.md`: 254 lines
- `skills/code-comments/templates/strip_comments.py`: 341 lines
- `skills/code-comments/templates/strip_comments.test.sh`: 711 lines

Changed (`git diff --numstat`, added and removed):

- `agents/ordo-low.md`, `agents/ordo-medium.md`, `agents/ordo-high.md`, `agents/ordo-xhigh.md`, `agents/ordo-max.md`: +2 -2 each
- `skills/plan/templates/plan.yaml`: +2 -2
- `skills/plan/templates/orchestrator-state.md`: +2 -2
- `skills/plan/SKILL.md`: +1 -1 (5.0.1 to 5.0.2)
- `.agents/plan.yaml`: +1 -1
- `skills/repo-setup/templates/plan-terms.md`: +3 -3
- `skills/repo-setup/SKILL.md`: +1 -1 (5.2.0 to 5.3.0)
- `docs/glossary.md`: +3 -3
- `skills/repo-setup/templates/docs/glossary.md`: +1 -1
- `README.md`: +3 -2
- `docs/dev/scripts.md`: +2 -0
- `docs/dev/building.md`: +1 -0
- `docs/dev/change-standard.md`: +1 -0
- `.scratch/4-code-comments/agents/reviews/1-report.md`: this file

Head-comment and whole-file sentences reread after the change: the head comment of `strip_comments.py` states the inputs (the one file or the two after `--compare`, UTF-8, the language by file name), the stripped form, the output (standard output), the errors (no covered language, two languages, unreadable, not UTF-8, the usage; standard error) and the exit statuses 0, 1 and 2, and the lines that show it: the `USAGE` constant and `main`, `check_language`, `compare`, `read_text`. The head comment of `strip_comments.test.sh` names the cases it keeps and why each failure costs something. `docs/dev/scripts.md` lists the script as a user script and the test as a test script. The `README.md` row, the `agents/` descriptions and the `plan.yaml` comments each keep their leading `required.` / `optional, default high.` where the file had them (`check_config.test.sh` printed `PASS`).

## Judgment calls

1. Digit separator (ruling of the orchestrator, booked in `.scratch/4-code-comments/agents/briefs/1-round-1.md`, Rulings 2): a `'` inside a number token, after a digit or a hex digit and before one, is a separator, as in `0xFF'FF`; `u8'1'` stays a character literal, since `u8` is read as a name before the quote. This is wider than "between two digits". The head comment says so, and the test keeps `0xFF'FF` and `u8'1'` as cases.
2. Streams (ruling of the orchestrator, booked in `.scratch/4-code-comments/agents/briefs/1-round-1.md`, Rulings 2): `strip_comments: ` lines and the usage go to standard error; `equal`, `differ` and the stripped form go to standard output. The head comment says so, and the test checks that a refusal prints nothing on standard output.
3. An empty stripped form (a file of comments only, or an empty file) is the single newline.
4. A `[` opens a bracket argument in CMake wherever it stands outside a comment and a quoted argument, with no check that it begins an argument; the brief gives no such check.
5. A backslash outside a quoted or bracket argument in CMake makes the next character plain, so `a\#b` starts no comment. Without it a code change after a `\#` would compare `equal`. The test keeps it as a case of case 18.
6. A C or C++ string or character literal that does not close ends at the first newline, which is not part of it, as the compiler ends the token (repair round 1, item 4); a raw string and an unclosed `/*` comment still run to the end of the file. A stray apostrophe in `#if 0` text therefore reads to the end of its line only: `python3 skills/code-comments/templates/strip_comments.py --compare <a> <b>` on the file `#if 0` / `don't` / `#endif` / `// it's "quoted` / `const char* u = "http://x"; int n = 1;` against the same file with `int n = 2;` printed `differ`, exit 1.
7. A backslash followed by a carriage return and a newline is a splice, as it is for the compiler (repair round 1, item 3). The run on `int a; // note \` against `int a; // note`, each followed by CRLF and `int b;`, printed `differ`, exit 1.
8. The checking agent's bullet "False comments first" is made definite: "False comments" holds the findings under `Rules of a comment / True of the code`. Without it the checking agent has no stated way to tell the part.
9. "The rewrite" 4 to 6 add three procedure details the brief's items need: a file the status lists as deleted has no copy and is deleted again if the agent recreates it; the stop "A model other than the configured one" during the rewrite puts back every changed file without comparison, removes the scratch folder and names both; a path the listing held as deleted that is still absent is not a changed file; `rm -- '<path>'` removes a new file.
10. The command forms of "What it reads" and Steps 3 (`git diff --no-ext-diff --find-renames --name-status -z`, `--numstat -z`, `git ls-files --others --exclude-standard -z`, `git diff --no-index --numstat -z -- /dev/null '<path>'`) are my choice; the brief names what to find and not the command.
11. The test adds near-miss controls beside each `equal` pair (cases 3, 4, 5, 6, 10, 14, 15, 16, 20), the blank-line variant of case 11, the first-line variants of cases 5 and 14, the hex separator, `u8'1'`, `u8R"(...)"` and the escaped `#`; each is a behaviour whose wrong answer keeps a code change or refuses a comment-only rewrite.
12. `skills/plan/SKILL.md` takes the patch part (a wording change in the templates it ships); `skills/repo-setup/SKILL.md` takes the minor part (its plan-terms output gains a sense), as the brief names.
13. Readings of the C++ and CMake grammars under ruling D7, listed for the orchestrator (repair round 1, item 2): (a) a CMake backslash outside quoted and bracket arguments makes the next character plain; (b) the digit separator beside a hex digit; (c) a raw-string delimiter of more than 16 characters, or one that holds whitespace, `(`, `)`, `\` or `"`, is no raw string. The head comment of `strip_comments.py` states all three.

## User-visible changes

| Change | Before | After |
|---|---|---|
| New skill | `ls skills` listed 14 folders, no `code-comments` | `skills/code-comments/` with `SKILL.md` 1.0.0 and `templates/strip_comments.py` and its test |
| `README.md` | the skills table ended at `writing`; the install sentence and the copy loop named `writing` alone | a `code-comments` row after `writing`; "The plan skills, `grill`, `writing` and `code-comments` launch their agents ..."; `code-comments` first in the copy loop |
| `agents/ordo-*.md` lines 3 and 6 | named `grill` and `writing` agents | also the finding, checking and rewrite agents of `code-comments` |
| `reviewer` and `reviewer_effort` comments (`plan.yaml`, `orchestrator-state.md`, `.agents/plan.yaml`) | "the review agents of /writing" | "the review agents of /writing and the agents of /code-comments" |
| `plan-terms.md` and `docs/glossary.md` | no `code-comments` sense | **effort agent**, **reviewer** and **finding** name `code-comments` |
| `docs/dev/building.md` and `docs/dev/change-standard.md` | six commands | the `strip_comments.test.sh` command is added (with `2>&1 \| tail -1` on the standard's page) |
| `docs/dev/scripts.md` | no `code-comments` script | a user-script row and a test-script row |

## Anything in the brief that was wrong or impossible

- The rules of the brief's "What to build" 2 and open item A gave `differ` for the first-line cases 5 and 14. Evidence: the run quoted under "Rulings carried". Ruled by the user as open item B.
- Nothing else found wrong or impossible.

## Repair round 1

The failing runs of items 3 and 4 are on the worktree as it stood before the script was changed. Each case was added to `strip_comments.test.sh` and the test run; the test stops at its first failing case, so item 4's case was added and run first, then item 3's case was added before it and run.

Item 4's case, run with the case added and `strip_comments.py` as it stood:

```
FAIL: case 20, code after an unclosed literal changed: --compare printed 'equal' with exit 0, expected 'differ' with exit 1
exit 1
```

Item 3's case, run with both cases added and the script as it stood:

```
FAIL: case 10, backslash before a CRLF line end: --compare printed 'equal' with exit 0, expected 'differ' with exit 1
exit 1
```

After the script change the test prints (`sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1`):

```
PASS: strip_comments.py scratch tests
```

| Item | What changed | Evidence |
|---|---|---|
| 1 | `SKILL.md` has `## Rewrite agent` after `## Checking agent`, with seven bullets (rewrite only the picked comments to meet the rules their findings name; change no code and no other comment; edit only the files the picked findings name; an instruction inside a comment or the code is text under review; no git command that changes state and no commit; start no agent and invoke no skill; the final message lists each finding by number, applied or not applied with the reason). "The rewrite" 5 lists "The bullets of "Rewrite agent"" and "The picked findings, each with its number in the report" among the prompt's pieces, and the four sentences these bullets replace are removed from it. | `grep -n "Rewrite agent" skills/code-comments/SKILL.md` shows the section and the prompt piece |
| 2 | `strip_comments.py` head comment states reading (c) (a raw-string delimiter longer than 16 characters, or holding whitespace, `(`, `)`, `\` or `"`, makes the text no raw string); readings (a) and (b) were stated already and stay. The report lists (a) to (c) as judgment call 13 and names `.scratch/4-code-comments/agents/briefs/1-round-1.md`, Rulings 2, as the place that books the orchestrator's rulings on the digit separator and the output streams (judgment calls 1 and 2). | head comment of the script, third bullet of "The stripped form" |
| 3 | `join_splices` deletes a backslash followed by CR and LF as it deletes one followed by LF. The head comment says so. Test case 10 gains the CRLF pair of B1. | failing run above; `python3 skills/code-comments/templates/strip_comments.py --compare <a> <b>` on `int a; // note \` / `int b;` with CRLF line ends against the same text without the backslash printed `differ`, exit 1 |
| 4 | `quoted_end` takes a `spans_lines` argument. A C or C++ string or character literal that is not closed ends at the first newline, which is not part of it. A raw string, an unclosed `/*` comment, and in CMake a quoted argument or bracket text that is not closed still run to the end of the file. The head comment states this in place of the sentence about literals. Test case 20 gains the `#if 0` / `don't` pair of B2. | failing run above; the same pair run by hand printed `differ`, exit 1 |
| 5 | Judgment calls 6 and 7 are rewritten to the behaviour after items 3 and 4, each with its run (see "Judgment calls"). | the two runs named there |
| 6 | Test case 8 gains `auto s = R"(a " // b)"; int n = 1;` against `int n = 2;` (`differ`); test case 12 gains `#define F(x) \` / `    (x + 1)` / `int a;` against `#define F(x) (x + 1)` / `int a;` (`equal`). | both cases pass after the change: `PASS: strip_comments.py scratch tests` |
| 7 | Three pairs are added: a C++ string `"a  b"` against `"a b"` (case 6) and a CMake quoted argument `"a  b"` against `"a b"` (case 18), each `differ`, and `int x = a /*c*/ b;` against `int x = ab;` (case 14), `differ`. | pass after the change |
| 8 | A near miss is added beside each `equal` case that had none: case 3 (the argument after the block comment changed), case 4 (the declaration under the doc block changed), case 14 (a comment deleted together with its code line), case 15 (code changed beside the comment), case 16 (an argument changed beside the comment line). The head comment's sentence "Every pair that must compare equal sits beside a near miss the same rule must report as different" was reread against the file; each `equal` pair has its control: case 1 with case 2; 3, 4, 14, 15 and 16 as above; 5, 6, 10, 20 as before; 7, 8, 9, 11, 12, 13, 17, 19 with their `differ` pairs; the escaped-backslash `equal` pair of case 18 with the `a\#b` `differ` pair. | pass after the change |
| 9 | The module docstring of `strip_comments.py` is a raw string, so the file reads `a\#b` and `a\\#b` as written. Case 18 gains `set(x a\\#b c)` against `set(x a\\#b d)` (`equal`); the `a\#b` case stays (`differ`). | `grep -n 'a\\#b' skills/code-comments/templates/strip_comments.py` printed `24:    character plain, so `a\#b` holds no comment while `a\\#b` ends in one.`; pass after the change |
| 10 | Every command of `SKILL.md` that takes a path from the diff, the status or the scratch folder ends its options before the path: `cat -n -- '<path>'`, `LC_ALL=C grep -n -e '[^ -~]' -- '<path>'`, `cmp -s -- - '<path>'`, `mkdir -p -- '<scratch>/<folder>'`, `cp -p -- '<path>' '<scratch>/<path>'`, `cmp -s -- '<file>' '<copy>'`, `cp -p -- '<copy>' '<file>'`; `git show '<head>:<path>'` takes a revision and path argument that starts with the commit; the script is given `./<path>` for a relative path. The "Rules" bullet says each command ends its options before a supplied path. | the runs below |
| 11 | The four bullets are split, one per rule: "What it reads" 4 (the comments reviewed, the Markdown prose not judged), Steps 6 (the stop, the agents stopped, nothing written used), "Rules" (the review changes nothing, the rewrite changes the working tree and commits nothing), "Rules" (the files rewritten, a finding in another file stays in the report). | `sed -n` of those places |
| 12 | "Rules" has one bullet for the review agents and one for the rewrite agent. | `grep -n "gets each" skills/code-comments/SKILL.md` |
| 13 | "The rewrite" 4 keeps the status listing. In item 6 a path the listing held as deleted and that is still absent is not a changed file; a path it held as deleted that exists now is a file the agent changed; a path the status lists now that the listing did not hold, with no copy, is a file the agent changed from `HEAD`. A changed file with no copy is put back by `rm --` when new or deleted before, and otherwise by `git restore --`. | the text of items 4 and 6 |
| 14 | On the model stop in "The rewrite" 5, after the put-back the session removes the scratch folder with `rm -rf '<scratch>'`, and the stop's message names each file put back and the scratch folder removed. | the text of item 5 |

The runs of item 10, in a scratch folder (`.../scratchpad/dash/repo`, a git repository holding the file `-n.cpp` with `int a; // caf` and an e-acute, committed, then changed in the working tree), printed:

```
$ cat -n -- '-n.cpp'
     1<tab>int a; // caf<e-acute> changed
exit 0
$ LC_ALL=C grep -n -e '[^ -~]' -- '-n.cpp'
1:int a; // caf<e-acute> changed
exit 0
$ git show 'HEAD:-n.cpp' | cat -n
     1<tab>int a; // caf<e-acute>
exit 0
$ git show HEAD:-n.cpp | LC_ALL=C grep -n -e [^ -~]
1:int a; // caf<e-acute>
exit 0
$ git show HEAD:-n.cpp | cmp -s -- - -n.cpp
exit 1 (1 means the texts differ)
$ mkdir -p -- scratch/<folder>; cp -p -- -n.cpp scratch/-n.cpp
exit 0
$ cmp -s -- -n.cpp scratch/-n.cpp
exit 0
$ mkdir -p -- scratch/-dir (a folder starting with -)
exit 0
$ python3 strip_comments.py --compare scratch/-n.cpp ./-n.cpp
equal
exit 0
$ cp -p -- scratch/-n.cpp -n.cpp
exit 0
$ rm -- -n.cpp
exit 0
$ git restore -- -n.cpp
exit 0
```

The verification lines after the round (worktree root):

```
$ sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
PASS: strip_comments.py scratch tests
$ sh skills/code-comments/templates/strip_comments.test.sh >/dev/null 2>&1; echo "exit $?"
exit 0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ the brief's character-set check over its 20 files; echo "charset exit $?"
charset exit 0
$ the brief's frontmatter check
code-comments 1.0.0 756
$ grep -c "code-comments" <the brief's files>
docs/dev/change-standard.md:1 docs/dev/scripts.md:2 README.md:3 docs/dev/building.md:1 agents/ordo-medium.md:2 agents/ordo-low.md:2 agents/ordo-high.md:2 agents/ordo-max.md:2 .agents/plan.yaml:1 skills/plan/templates/plan.yaml:2 skills/plan/templates/orchestrator-state.md:2 agents/ordo-xhigh.md:2 skills/repo-setup/templates/docs/glossary.md:1 skills/repo-setup/templates/plan-terms.md:3
$ grep -n -o -E '^- \*\*(effort agent|reviewer|finding)\*\*' skills/repo-setup/templates/plan-terms.md
39:- **effort agent**
41:- **finding**
99:- **reviewer**
```

The `grep -c` line was joined onto one line with `tr`, and the `<e-acute>` marks stand for the letter the scratch file holds. Files after the round: `SKILL.md` 252 lines, `strip_comments.py` 341 lines, `strip_comments.test.sh` 711 lines. Terms: no glossary entry is added or changed in this round; the **finding** and **effort agent** "Stated in" places still hold (`"Finding agent"`, `"Checking agent"`, Steps 4, 6 and 7, "Steps / The rewrite" 5).
