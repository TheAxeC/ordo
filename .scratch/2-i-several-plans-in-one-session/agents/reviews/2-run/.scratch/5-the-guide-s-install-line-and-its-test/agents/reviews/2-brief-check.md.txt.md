# Step 2 brief check (on main at 1d789a9)

This is the report of the brief check on `agents/briefs/2.md` of plan 5 (run from the scratch repository root; I changed nothing, and wrote no file in the tree).

## 1. Names

Command, run from the root: `for p in 'guide\.test' 'tail -1' 'building\.md' 'tests/' 'PASS:' 'FAIL:'; do grep -rnI --exclude-dir=.git --exclude-dir=worktrees -e "$p" . | grep -v 'briefs/2.md' | cut -d: -f1,2; done`. Hits outside the brief's "Paths this step writes":

- `guide.test`, `tail -1`, `PASS:`, `FAIL:`: `docs/roadmap.md:24`, `docs/roadmap.md:25`, and in the plan 5 folder `plan.md:7`, `:11`, `:13`, `:15` (not in the grep list, same sentences), `:20`, `:33`. They state what the step builds. The change makes none false.
- `tests/`: the same files, plus `docs/dev/change-standard.md:46` (rule 14, "grep it across `docs/` and `tests/`"), `.scratch/5-the-guide-s-install-line-and-its-test/orchestrator-state.md:62` and `.scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md:73` ("`docs/dev/building.md` and `tests/`, changed only by the steps of the open plans"). All stay true once `tests/` exists.
- `building.md`: `.agents/plan.yaml:6`, `docs/dev/change-standard.md:76` (section "The verification page", "is not a configuration file"), the two state files at `:55`/`:62` (plan 5) and `:55`/`:73` (plan 3), briefs and reviews of steps 1 and 3 (history, no claim about the future). They hold.
- The stale-by-effect hit: `.scratch/5-the-guide-s-install-line-and-its-test/orchestrator-state.md:6` (the `verify:` key) and `:55` ("The `verify` list above ... the character-set check of `docs/dev/building.md`"), and the same at `.scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md:6` and `:55`. `verify:` is a copy of the page's commands (`.agents/plan.yaml:6`). After the step the page holds two commands and the lists hold one. The brief's premise "The plan's verify list equals the command of `docs/dev/building.md` ... left as it is" is true now and false after landing, and the brief says nothing about it. The new command would then never run at landing. The state file is the orchestrator's, so this is an orchestrator item at landing. The builder is not told, and the report cannot be judged on it.
- Rule 14 asks the report to quote the grep across `docs/` and `tests/`. The brief's "Verify before you report" has no such item.

Findings: (1) the `verify:` lists of plan 5 and plan 3 become stale at landing and the brief does not say who adds the command; (2) the brief's verify list omits the rule-14 grep and the rule-14 reread of sentences about the file as a whole (see section 4).

## 2. The step line

Step 2 line of `plan.md`, part by part:

- `tests/guide.test.sh` created: "What to build" 1.
- Its command `sh tests/guide.test.sh 2>&1 | tail -1` added to the command block of `docs/dev/building.md`: "What to build" 2.
- Given a file path, `docs/guide.md` when none: "What to build" 1, "Input".
- `PASS: <file>` and exit 0 when the first line starts with `# ` and no line holds a tab: "What to build" 1, second bullet.
- Otherwise `FAIL: <file>: <reason>` and exit 1: "What to build" 1, third bullet.
- Check, `PASS: docs/guide.md`: Cases 1 and 2, Verify 2.
- Check, a file whose first line is not a title gives FAIL: Cases 3, 5, 6.
- Check, a file with a title line and a tab gives FAIL: Case 4.
- Check, `grep -c -F ... prints 1`: Case 9, Verify 4.
- "(1 commit)": no requirement in "What to build". It belongs to the landing, and the builder runs no git. No gap.
- Requirements in the brief beyond the line: the unreadable-path case, path quoting and the head comment. They come from rules 14 and 15, and the line's "otherwise" covers the unreadable path.

Findings: none.

## 3. Premises

Commands rerun on main at 1d789a9:

- `ls tests; echo "exit $?"` prints `ls: tests: No such file or directory`, exit 1. Holds.
- `cat -n docs/dev/building.md; wc -l`: 7 lines, line 1 `# Building and checking`, line 3 the paragraph (exact text as the brief quotes), lines 5-7 a ` ```sh ` block with one command (line 6). Holds.
- `cat -n docs/guide.md; wc -l; grep -c "$(printf '\t')" docs/guide.md`: 3 lines, line 3 ends "Install it with `sh install.sh`.", tab count 0, last byte `\n`. Holds.
- `docs/dev/change-standard.md`: section "The verification page" has the quoted sentence; section "Commands and their filters" quotes the character-set check as the filtered form and does not list commands. Holds.
- `sh --version | head -1` prints `GNU bash, version 3.2.57(1)-release (arm64-apple-darwin24)`. Holds. `command -v dash` prints `/bin/dash`, so a second shell exists that the brief does not use.
- `ls docs/adr` fails: no such folder. Holds.
- The verify list equals building.md line 6: a shell comparison of `sed -n 6p docs/dev/building.md` with the `verify:` item printed "verify list equals building.md line 6". Holds now (see section 1 for after the step).
- `.agents/plan.yaml` has `standards: []`, `libraries: avoid`, `adr: docs/adr`. Holds.
- `sh tests/guide.test.sh; echo "exit $?"` prints `sh: tests/guide.test.sh: No such file or directory`, exit 127. The case-10 text holds exactly.
- "The ruling Open item A of `plan.md`, step 2": the section "Rulings (2026-10-12)" holds "Open item A" with step 2's line, which states the computation (title, tab). The user rulings it cites are booked in Ordo's repository, not in this tree. Not verified from here.

Findings: none, apart from the post-landing staleness named in section 1.

## 4. Cases and checks

Read against `docs/dev/change-standard.md` (rules 13, 14, 15, 19, "Scripts compute facts; judgment is read", "Commands and their filters") and `docs/dev/prose-standard.md`:

- Cases 1 to 9 and the first-run task agree with rule 13 (new check run on the unchanged tree, failure quoted, no revert asked) and with the test rule (no kept test, since a form check of a guide costs none of lost work, broken installation or wrong configuration). No case asks for breakage testing.
- Rule 15 asks each place where a supplied value reaches a command or generated text to be a case. The brief has one such case (a path holding a space). Evidence that the other places are live on this machine: `sh -c 'head -n 1 -x'` prints `head: invalid option -- x` (a path starting with `-` is read as an option). `sh -c 'echo "PASS: a\\nb 50%s"'` prints `PASS: a`, a newline, `b 50%s` (this `sh` expands backslash escapes in `echo`). `sh -c 'f="x%sy"; printf "PASS: $f\n"'` prints `PASS: xy` (a `%` in the path is consumed as a format). The path reaches the `PASS:`/`FAIL:` line, so "`<file>` is the path as given" can fail.
- The brief says "Otherwise it prints one line", but no case checks that exactly one line is printed, and none says which stream carries it. A nonexistent path read by `head` or `grep` prints that tool's own message first. `2>&1 | tail -1` then hides it.
- The reasons of Decision 1 are not pinned by any case. A case says "a `FAIL: <that path>: <reason>` line", so a wrong reason passes.
- Verify 1 runs the character-set check over `tests/guide.test.sh` and `docs/dev/building.md` only. The report is a path the step writes, and the landing check reads untracked files (`git ls-files -coz --exclude-standard`). Step 1's landing failed on tabs in a saved report (`plan.md:59`, section "Step 1, the install sentence"). Case 4 and Decision 2 have the builder make and quote a file with a tab, so a literal tab can reach the report. The brief tells the builder only that the script and the page are ASCII.
- A case that asks the builder to check, quote or explain a place the step does not change: Verify 5 asks that "the page's paragraph" (the paragraph of `docs/dev/building.md`, outside the brief's range 5-7) be read against the prose standard's rules on list items and sentence length, and each departure named "with why it needs its form". The step cannot change that paragraph (rule 19, and Paths). What rule 14 asks of that paragraph is a reread of its truth ("every command below passing, each run from the repository root"), listed with the line that shows it holds, and Verify 5 does not ask that. The brief's "Report" parts do not ask for it either.
- Prose standard: the three reasons are lowercase fragments, ASCII, no dash, no filler. "tab" and "tab character" both appear in the brief (`briefs/2.md:24`, `:44`); the script's messages use "tab" only. No case asks the builder to write prose beyond the head comment.
- Rule 14 in the brief: "Its head comment says what the script checks, its input, each line it prints and each exit status" covers inputs, errors and statuses. Rule 10 (no history) is carried.

Findings: (1) rule-15 cases missing, see section 6; (2) the one-line/stream requirement has no case; (3) the report path is missing from Verify 1's character-set check and the brief has no word on tabs in the report; (4) Verify 5 asks for a prose-standard reading of an unchanged paragraph and omits the rule-14 reread and grep.

## 5. The question

The goal this step delivers: a test `tests/guide.test.sh` that checks the guide's form, with its command in `docs/dev/building.md`. "Could this pass without the goal being reached?"

- Case 1 (`sh tests/guide.test.sh`, PASS, exit 0): yes alone. A script that always prints `PASS: docs/guide.md` passes it. Cases 3 to 7 close that.
- Case 2 (explicit `docs/guide.md`): yes alone, same constant-PASS script. A script that ignores its argument is caught by cases 3 to 8.
- Case 3 (first line `Guide`, FAIL, exit 1): yes alone. A constant-FAIL script passes it. Cases 1, 2 and 8 close that. A wrong reason also passes it.
- Case 4 (`# Guide` plus a tab on line 3, FAIL): yes. A script that tests for a tab only on line 3, or only in the first three lines, passes every case; so does a `while read` loop that strips a leading tab. The guide is 3 lines now and will grow (plan 3). Nothing tests a tab on a later line, at a line start, or on a last line with no trailing newline.
- Case 5 (`#Guide`): yes alone (constant-FAIL). It does pin `# ` against `#`, which is the near-miss control of the title rule.
- Case 6 (empty file): yes alone. A script that fails any file that is not 3 lines also passes it. Cases 1, 2 and 8 close that.
- Case 7 (nonexistent path): yes. A script using `[ -e ]` instead of a readability test, or printing the tool's own message plus a wrong reason, passes it.
- Case 8 (path with a space, PASS): yes alone (constant-PASS script). Together with 3 to 7 it pins quoting for the space only.
- Case 9 (`grep -c -F ... prints 1`): yes. The line can sit in the page's prose or before the character-set check and still print 1, and the script need not exist. The "in the `sh` block, after the character-set check, as its own line" requirement is checked only by reading the diff.
- Case 10 (before the change, the script is missing): yes, by construction. It is a precondition and checks nothing of the goal.
- Step-line check (PASS on the guide; FAIL on a title-less file; FAIL on a file with a title and a tab; `grep -c -F` is 1): no for the two rules it names, with respect to the three runs together (a constant script cannot satisfy both PASS and FAIL runs). Yes for a tab check limited to one line, as for case 4. The `grep -c -F` is yes alone, as for case 9.
- "What to build" 1, POSIX `sh`: yes. Every run is under this machine's bash 3.2 posix mode, where `[[` and other bashisms work. `/bin/dash` exists here, and the brief names no run under it.
- "What to build" 1, head comment: yes. No run proves it. The review reads it, as the brief intends.
- "What to build" 1, ASCII and no tab: no. Verify 1 computes it.
- "What to build" 2, the line in the block: yes, see case 9.

Findings: cases 4 and 9 leave the goal passable (tab only on line 3; line-position and block-position unchecked); no case rejects a script that is not POSIX.

## 6. Implied inputs

Inputs the step implies and never states (code step, script), read against the rules file's rule that code handles a case only when it has happened or a wrong answer costs something, and rule 15:

- The path argument, absent: stated (default `docs/guide.md`). Empty string `""`: not stated. A `${1:-default}` form checks the guide and prints `PASS: docs/guide.md` for an empty argument; a `$#` test prints `FAIL: : not a readable file`. A wrong answer is a false PASS for a caller whose variable is empty. The brief should state the expected result; I do not rule which.
- The path argument, content: a space (stated, case 8); a leading `-`; a `%`; a backslash; glob characters. Missing from Cases, each with a wrong answer that is a false FAIL, a false PASS or a garbled printed path (rule 15, command and generated text):
  - A valid file named `-a.md` in the current directory, run as `sh <root>/tests/guide.test.sh -a.md`: expected `PASS: -a.md`, exit 0.
  - A valid file whose path holds `%s` (for example `$TMPDIR/<dir>/50%s guide.md`): expected `PASS: <that path>` verbatim, exit 0.
  - A valid file whose path holds a backslash followed by `n`: expected `PASS: <that path>` verbatim, exit 0.
- A file with a tab on a line other than 3: missing. Expected: a tab at the start of line 5 of a 6-line file gives `FAIL: <path>: line 5 holds a tab`, exit 1; a tab on the last line of a file with no trailing newline gives `FAIL: <path>: line <n> holds a tab`, exit 1. Costs a false PASS, which the test exists to prevent. A tab on line 1 with a valid title gives `line 1 holds a tab`.
- A file broken on both rules (no title, with a tab): Decision 1 says only the title reason is printed, once. No case pins it. Expected: one line, `FAIL: <path>: first line is not a title`, exit 1.
- Exactly one output line and its stream, for each FAIL case, the nonexistent path included (see section 4): expected, the whole output is the one `FAIL:` line, with no tool message before it.
- The working directory: the default is relative, so a run from another directory prints `FAIL: docs/guide.md: not a readable file`. Stated in the sense "from the repository root". Not needed as a case.
- A directory or an unreadable file as the path: has not happened; the wrong answer is a wrong reason, not a wrong verdict. Not needed.
- More than one argument, CRLF line endings, non-ASCII or binary content: have not happened; the ASCII rule is the character-set check's. Not needed.
- The environment: `$TMPDIR` is set here (`/var/folders/.../T/`); the brief does not say what the builder does if it is unset, and `$TMPDIR/<dir>` would then be `/<dir>`. The shell is bash 3.2 as `sh`; `dash` is present.

Findings: the cases for a leading-`-` path, a `%` path, a backslash path, tab positions (leading, later line, last line without newline), the both-rules-broken file, and the one-line output are missing; the empty-string argument has no expected result.

## 7. ADRs

`ls docs/adr; echo "exit $?"` prints `ls: docs/adr: No such file or directory`, exit 1. The folder does not exist (`.agents/plan.yaml` names `adr: docs/adr`). No record is in force that touches the step.

Findings: none.

## 8. Dictated text

`grep -n -F` over `agents/briefs/2.md` finds these dictated lines:

- `PASS: <file>`: `2.md:24`. Holds.
- `FAIL: <file>: <reason>`: `2.md:25`, `:28`. Holds.
- The reasons `first line is not a title`, `line <n> holds a tab`, `not a readable file`: `2.md:69` (Decision 1; the first and third words also appear in `:28`). Prose standard, "Hard rules" and sections A to F: plain, ASCII, no dash, no filler, no arrows, headings not involved; a message, not a sentence, so sentence-length rules do not bite. They hold. The vocabulary of the messages is chosen in the brief; the rules file's rule 4 reserves a shape such as a "vocabulary" to the user, and the brief lists it under "Decisions taken in this brief (each reversible, none silent)". I do not rule on that (see "Declined to judge").
- The page line `sh tests/guide.test.sh 2>&1 | tail -1`: `2.md:31`, `:45`, `:100`, `:102`. It is the string the roadmap gate and step line fix (`docs/roadmap.md:25`, `plan.md:20`). It holds. With plain `sh` its exit status is `tail`'s (`sh -c 'false 2>&1 | tail -1'` then `echo $?` printed `0`). The land skill's `templates/checks.sh` runs each command as `bash -o pipefail -c '<command>'` (its header comment), so as a verify command it fails on FAIL. That matches "Commands and their filters" ("a filter under `pipefail`").
- Quoted error `sh: tests/guide.test.sh: No such file or directory`: `2.md:46`. The command in section 3 prints exactly that, exit 127.
- Quoted text in "What is on the tree" ("Install it with `sh install.sh`.", the paragraph of building.md, the rules file's sentence): found in the tree, exact.
- The head comment's words and the report's wording are not dictated; only what they must cover is stated, so they are not dictated text.

`LC_ALL=C grep -n '[^ -~]' 2.md` prints nothing: the brief is ASCII.

Findings: none.

## Declined to judge

- Whether the user's approval of what the script computes (rules file, "Scripts compute facts; judgment is read") is given: `plan.md`, "Rulings", Open item A, cites rulings booked in Ordo's repository. I cannot read them from this tree. The text in this tree states the computation.
- Whether the orchestrator should choose the message vocabulary (rules file, rule 4) or leave it to the user: the brief records it as a reversible decision. That is for the orchestrator.
- Whether the verify list in the state files is updated at landing or in another step: the orchestrator's.
- Whether the head comment is good prose: that is read at the review, not at the brief check.

Agent usage: ab9154be194d9c2f8, claude-sonnet-5-5, 109673 tokens, 20 tool uses, 4 min 52 s.

## Closed

Each finding is closed by a change to the brief `agents/briefs/2.md`, before the preparation commit.

1. Names, finding 1, the verify lists of plan 5 and plan 3 go stale once the page gains the command: "What is on the tree" now says the orchestrator rewrites each list from the page at that plan's next `/spec` or `/land`, and that the builder changes no state file.
2. Names, finding 2, and Cases and checks, finding 4, rule 14's grep and reread missing, and Verify 5 asking for a prose reading of a paragraph the step does not change: Verify 5 now reads only the head comment against the prose standard; a new Verify 6 runs and quotes `grep -rn -e 'guide.test' -e 'building.md' docs tests` and rereads the page's paragraph for its truth after the change.
3. Cases and checks, finding 1, and Implied inputs, rule 15's cases: "What to build" 1 now says the path is printed as given, never a format string or read for escapes, and a leading `-` is never read as an option; three cases added: a file `-a.md`, a path holding `50%s`, a name holding a backslash and `n`, each `PASS: <that path>`, exit 0.
4. Cases and checks, finding 2, one line and its stream: "What to build" 1 now says the whole output is the one line on standard output with no tool message before it; a case added, for a missing path `2>&1 | wc -l` prints `1` and `2>/dev/null` still prints the `FAIL:` line.
5. Cases and checks, finding 3, the report path missing from the character-set check, and tabs in the report: Verify 1 now feeds the report path too, and says a quoted line holding a tab is written with `<TAB>`.
6. The question, cases 4 and 9 passable: "What to build" 1 now says every line is checked for a tab; two cases added, a tab at the start of line 5 of six, and a tab on a last line with no newline; case 9 now also reads `sed -n 5,8p docs/dev/building.md` for the line's place in the block.
7. The question, no run rejects a script that is not POSIX: a case added, cases 1, 3, 4 and the space path run with `dash` give the same results.
8. Cases and checks, the reasons not pinned: two cases now give the exact `first line is not a title` and `not a readable file` lines, and the tab cases give `line <n> holds a tab`.
9. Implied inputs, the empty argument and a file broken on both rules: Decision 3 added, an empty argument prints `FAIL: : not a readable file`, with its case; a case added for a first line `Guide` with a tab on line 2, printing only the title reason.
10. Declined to judge, the approval of the computation: the ruling "Open item A" of `plan.md` and the user's rulings it cites, booked in Ordo's `.scratch/2-i-several-plans-in-one-session/plan.md`, approve the step's computation; nothing changes in the brief.

The dictated lines added after the check (the `FAIL:` lines of the new cases, Decision 3's line) use the vocabulary Decision 1 already held, and were read against the prose standard: they hold.
