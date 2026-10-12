# Step 2 brief check (on main at 37845b0)

Main has moved since the brief was written. `git log --oneline | head -4` in the scratch repository prints `c59dbea Land step 2 of plan 3, the FAQ`, then `37845b0`. `git diff 37845b0 HEAD -- docs/guide.md docs/dev | wc -l` prints `0`, so every file this step reads or writes is unchanged. The differences are `docs/faq.md` (new, 9 lines) and plan 3's ledger. "Read on main at 37845b0" is stale but harmless. Every command below was run at HEAD c59dbea.

## 1. Names

Evidence: `grep -rn --exclude-dir=.git -e 'guide\.test' -e 'tests/guide' -e 'tail -1' -e 'building\.md' -e 'tests/' .` (one grep per pattern), plus `ls -a`, `ls tests`, `ls docs docs/dev` and `git ls-files`. `ls tests` prints `No such file or directory`, and there is no `.scratch/archive`. Hits outside the brief's "Paths this step writes" (`tests/guide.test.sh`, `docs/dev/building.md` lines 6-7, the `2-report.md`):
- `docs/roadmap.md:24-25`, entry 5's goal and gate. They name `tests/guide.test.sh`, the `PASS:` and `FAIL:` runs and the `grep -c -F` line. The step makes them true, not false.
- `docs/roadmap.md:32-33`, entry 3's gate `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1, "Waits on: entry 5's test command". True after the step. `docs/faq.md` (9 lines) holds no test command now; plan 3's step 3 adds it.
- `.scratch/5-.../plan.md:7,11,20,33` and `.scratch/3-.../plan.md:11,22,36`. They repeat the same names and are unchanged by the step.
- `.scratch/5-.../orchestrator-state.md:8` (`verify:` holds the character-set check alone). After the step, `docs/dev/building.md` has two commands and the state list has one. The brief's premise, "it was not rewritten", is true at the base. `skills/land/SKILL.md` Steps 2 and `skills/spec/SKILL.md` Steps 1 make `/land` rewrite the list to the page's commands before `checks.sh` runs. So "the verify list at landing holds it" is true, but only through the orchestrator's step at landing. The brief does not say who rewrites the list.
- `docs/dev/change-standard.md:66-72`, "Commands and their filters". The block shows the character-set check as the form of a filtered command, and line 72 says a step that changes `building.md` runs beside other steps. Line 70 says each verify command exits non-zero when it fails and that a long-output command uses a filter under `pipefail`. The new command is `... | tail -1` run through `bash -o pipefail -c`, so it is consistent. Nothing there becomes false, and decision 5 of the brief holds.
- `docs/dev/building.md:3`, "The green check is every command below passing, each run from the repository root." It stays true. The brief says "No other line of the page changes", and the reread that change-standard rule 14 requires for a page-wide sentence is not asked for.

Findings:
- The brief's "Verify before you report" has no rule 14 grep. Rule 14 says "grep it across `tests/` and `docs/` ... the report quotes that grep" and that a script's head comment lists every input, error and exit status. The brief covers the head comment but not the grep or the reread of `building.md` line 3. Add both to Verify and to the report shape.
- No other name is made false.

## 2. The step line

Evidence: `sed -n 20p .scratch/5-.../plan.md`, mapped against the brief's "What to build".
- "`tests/guide.test.sh`" is served by "What to build" 1.
- "its command `sh tests/guide.test.sh 2>&1 | tail -1` added to the command block of `docs/dev/building.md`" is served by item 2 (after line 6, inside the fence).
- "given a file path, `docs/guide.md` when none is given" is served by item 1, bullet 1.
- "prints `PASS: <file>` and exits 0 when the first line starts with `# ` and no line holds a tab" is served by item 1, bullet 2.
- "otherwise prints `FAIL: <file>: <reason>` and exits 1" is served by item 1, bullet 3.
- The check clause has four parts. `sh tests/guide.test.sh` printing `PASS: docs/guide.md` is the first and second cases. The not-a-title FAIL run is the third, fifth and eighth cases. The title-plus-tab FAIL run is the fourth case. The `grep -c -F ... prints 1` is the tenth case and Verify 3.
- "(1 commit)" has no requirement in "What to build". It is served only by the builder-runs-no-git rule in `docs/dev/change-standard.md` and by `/land`'s wip commit. Not a defect, but not named.

Findings: none beyond "(1 commit)" having no stated requirement. The reason texts, the tab-versus-title precedence and the `FAIL`-on-missing-file handling go beyond the step line and are labelled as decisions 1-3, so they are not unlabelled additions.

## 3. Premises

Evidence, each rerun at HEAD:
- `ls tests` prints `ls: tests: No such file or directory`. Holds.
- `wc -l docs/guide.md` prints 3, `sed -n 1p` prints `# Guide`, and `grep -c "$(printf '\t')" docs/guide.md` prints `0`. Holds.
- `cat -n docs/dev/building.md` shows 7 lines in the brief's layout: line 5 the ```` ```sh ```` fence, line 6 the character-set check, line 7 the closing fence. `wc -l` prints 7. Holds.
- The state file's `verify:` holds the one character-set command (`orchestrator-state.md` lines 6-8), equal to `building.md` line 6. Holds.
- `ls docs/adr` prints `No such file or directory`. Holds.
- `docs/dev/change-standard.md` lines 66-72 match the brief's description, including the quoted sentence "is not a configuration file: a step that changes it runs beside other steps." Holds.
- The user approval of the step list: `grep -n 'Open item A'` in the plan finds line 31. The two cited rulings exist at `/Users/axelfaes/workspace/ordo/.scratch/2-i-several-plans-in-one-session/plan.md` lines 77, 86, 146 and 160. Holds.
- Extra facts: `sh tests/guide.test.sh` now prints `sh: tests/guide.test.sh: No such file or directory`, exit 127 (macOS `/bin/sh` is bash 3.2.57). The brief does not state the exit status and does not need to. `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints `0`, as the tenth case says.

Findings: none, apart from main having moved to c59dbea.

## 4. Cases and checks

Evidence: the 11 cases at brief lines 38-48, read against `change-standard.md` "Scripts compute facts; judgment is read", rules 13-15 and 21.
- The rules file's test sentence is "A test exists only for code, and only for behaviour whose failure costs something". The brief keeps no test file and checks the cases by quoted runs, with the script itself in the verify list. That is consistent with rule 13 as long as the failing-line table is not required. It is required for each behaviour added "whose failure costs something" (rule 13, last bullet). A script in the verify list that wrongly passes a guide is that kind of behaviour. The brief's report shape has no such table.
- Every case of a code step is run on the unchanged tree first, which gives `No such file or directory` (127), not the case's expected output. Rule 13 asks that the failure be the one the brief states; here it is "the script does not exist", which the ninth case states. Consistent.
- No case checks or quotes a place the step does not change. `docs/guide.md` is the default input of the first, second and seventh cases (the seventh copies it). It is read, not changed, and the step line requires it.
- The word "unreadable" in decision 2 and in the reason `no such file ... not a readable regular file` has no case (a directory, or a file with mode 000). The wrong answer costs little, since the title rule would still print FAIL. The expected result is `FAIL: <path>: no such file`, exit 1. See section 6.

Findings:
- The brief's report shape lacks rule 13's behaviours/cases/failing-line table.
- The brief has no case where both rules fail, although decision 1 fixes the order ("the title first"; the same sentence appears at brief line 29).
- The brief has no case for a tab on line 1 or 2.

## 5. The question

"The goal" here is "a test `tests/guide.test.sh` checks the guide's form, and its command is in `docs/dev/building.md`". Per case, the answer is yes or no:
- Case 1 (`sh tests/guide.test.sh` prints PASS, exit 0): yes. A script that always prints `PASS: docs/guide.md` passes it. The FAIL cases close this.
- Case 2 (same with `docs/guide.md` given): yes, for the same reason.
- Case 3 (not-a-title file): yes. A script that always prints that FAIL passes it. Case 1 closes this.
- Case 4 (`# Guide`, blank line, tab on line 3): yes. A script that scans only the last line, or only line 3, for tabs passes every case. The step line and the goal say "no line holds a tab". A case with the tab on line 1 or 2, expected `FAIL: <path>: line 1 holds a tab` or `line 2 holds a tab`, closes it.
- Case 5 (empty file) and case 8 (`#Guide`): yes individually, closed by case 1 together with the title cases. The `#Guide` case does close a `^#` prefix test.
- Case 6 (missing path, never PASS): no for the never-PASS half. It also pins the reason text.
- Case 7 (path with a space): no. An unquoted script fails it.
- Case 9 (script absent on the unchanged tree): no. It is the first-run record.
- Case 10 (`grep -c -F ... prints 1`): yes for the step line's "added to the command block". The grep passes with the line outside the fence (for example after the closing fence), a commented line, or a second copy. The brief puts the line inside the fence at item 2 but has no check of it. Add after the change: `sed -n 7p docs/dev/building.md` prints the command, `sed -n 8p` prints the closing fence, `wc -l` prints 8. Nothing checks "No other line of the page changes" except the diff read.
- Case 11 (`bash -o pipefail -c '... | tail -1'` prints PASS, exit 0): no. It tests the filter and exit propagation together.
- The check on the step line (the three runs plus the grep): yes taken alone (see cases 1-4 and 10), no taken together with section 4's additions.
- The checks of "What to build": item 1's "no dependency beyond `head`, `grep` and `printf`" and "ASCII only". The ASCII check is Verify 1 (`perl` over `tests/guide.test.sh`), so no. The POSIX/`head`/`grep`/`printf` limit has no command; it is read in the diff, so a script using `sed` or `awk` passes every run. That limit is not part of the goal.

Findings: the tab-on-line-1-or-2 case, the fence-position check and the both-rules-fail case are missing, as above.

## 6. Implied inputs

Evidence: the brief's text plus the rules file's case rule (rule 21) and rule 15. The code step reads one optional path argument and the file's bytes.
- The character-set check in the verify list rejects a literal tab in a non-`.md` file (`perl ... qr/[^\x20-\x7E\n]/`; tab is 0x09). So `tests/guide.test.sh` must contain no literal tab and must build the tab with `printf '\t'`. The brief says only "ASCII only". The check would fail at landing on the script's own indentation or a literal tab in its head comment. Expected result: the character-set check over `tests/guide.test.sh` prints nothing, exit 0.
- Leading-dash path (rule 15, a value reaching a command): `sh tests/guide.test.sh ./-x`, or a file literally named `-x` given as `-x`. Expected: the verdict is about that file, not an option of `head` or `grep`. The path reaches `head` and `grep`, so the script must use `--` or a `./` prefix. The brief says only "quoted". The wrong answer: `head` or `grep` reads the path as an option, or errors.
- Path holding `%` (for example `<tmp>/100%s.md`) and a path holding a backslash. Expected: `PASS: <tmp>/100%s.md`, exit 0, with the path printed as given (rule 15, generated text). The brief says "`<file>` is printed as given" but a format-string `printf` or an `echo` that interprets backslashes breaks it. Cases needed.
- A path that is a directory, or an unreadable file (mode 000). Expected: `FAIL: <path>: no such file`, exit 1, never PASS (the brief names these reasons but no case; cost low).
- A tab on line 1: `printf '# Guide\ttitle\n'` expected `FAIL: <path>: line 1 holds a tab`, exit 1. A tab as the first line's separator (`#<TAB>Guide`) expected `FAIL: <path>: the first line is not a title`. A both-rules file such as `printf 'Guide\n\ntext\twith a tab\n'` expected `FAIL: <path>: the first line is not a title`.
- A file with no trailing newline whose last line holds a tab (`printf '# Guide\n\ttext'`): expected `line 2 holds a tab`. A one-line file with no newline (`printf '# Guide'`): expected PASS.
- Two or more arguments: the brief says one optional path and says nothing for more. Expected result unstated; the cost is small, so a rule 21 case is not forced, but it is a judgment call to report.
- The stream of the FAIL line: the brief says PASS goes "on stdout" and gives no stream for FAIL. The verify command uses `2>&1`, so the filter is unaffected. The head comment must list it, and it is a judgment call the brief leaves open. The report shape has a judgment-call slot.
- Run from a directory other than the root with no argument: the script prints `FAIL: docs/guide.md: no such file`. The brief says "from the repository root", so this is not a case.

Findings: the literal-tab constraint, the leading-dash path, the `%` and backslash paths, the line-1 tab, the both-rules file and the no-trailing-newline file are all missing.

## 7. ADRs

Evidence: `ls -d docs/adr` prints `ls: docs/adr: No such file or directory`, exit 1. `find . -path ./.git -prune -o -name '[0-9][0-9][0-9][0-9]-*.md' -print` prints nothing. Findings: none. The folder does not exist, so no ADR touches the step.

## 8. Dictated text

Evidence: `grep -n -F` over `.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/2.md`. The brief has no non-ASCII bytes (`LC_ALL=C grep -n '[^ -~]'` prints no line).
- The command line for `docs/dev/building.md`, `sh tests/guide.test.sh 2>&1 | tail -1`. `grep -n -F 'sh tests/guide.test.sh 2>&1 | tail -1'` finds it at brief lines 32 (item 2), 47, 48, 103 and 104. Holds. It is ASCII, sits inside the existing `sh` fence, has no dash or arrow, and `change-standard.md` "Commands and their filters" has no rule it breaks. The character-set check over `docs/dev/building.md` exits 0 (run with the same perl command).
- The script's printed strings, dictated for `tests/guide.test.sh` and found by `grep -n`:
  - `PASS: <file>`, at brief line 25.
  - `FAIL: <file>: <reason>`, at brief line 26.
  - `no such file`, `the first line is not a title` and `line <n> holds a tab`, at brief lines 26, 43, 40/42/45, 41 and 69.
  - All hold against `prose-standard.md` section 0 (plain prose, no dash, no aside) and section A (no filler), and against `change-standard.md` rule 10 (ASCII, no em dash). They are lowercase fragments, a diagnostic form that section E's "stop-start fragments" rule does not reach. Holds.
- The head comment is not dictated; only its content requirements are given, so it is not dictated text.
- Verify 5 says "the page line" is "read against `docs/dev/prose-standard.md`". The added page line is a command, not prose, so the prose standard has little to apply to; the reading is vacuous but harmless.

Findings: none.

## Declined to judge

- Whether the shipped script behaves identically under `dash` or another POSIX `sh`. Only macOS `/bin/sh` (bash 3.2.57 in POSIX mode) is present, and no script exists yet.
- Whether `grep -c "$(printf '\t')"` works for invalid-UTF-8 or binary input under a UTF-8 locale. No such input has happened, and I ran nothing on it.
- Whether the user's approval of each ruling cited at brief line 16 covers the script's reason texts. I confirmed that the cited rulings exist (lines 77, 86, 146 and 160 of Ordo's plan), not their full content.

Agent usage: a3a6121993983092e, claude-sonnet-5-5, 105687 tokens, 16 tool uses, 4 min 6 s.

## Closed

- Main moved to c59dbea: the heading of "What is on the tree" reads c59dbea, and a premise line quotes `git diff 37845b0 c59dbea -- docs/guide.md docs/dev tests`, which prints nothing.
- 1. Names, the rule 14 grep and the reread of `docs/dev/building.md` line 3: added as Verify 6 and to the report shape; "What to build" 2 names line 3 as reread.
- 1. Names, who rewrites the verify list: a premise line says the landing rewrites the plan's verify list to the page's commands, and the builder does not edit the state file.
- 2. The step line, "(1 commit)": a premise line says the landing makes the one commit.
- 4. Cases, the rule 13 table: added to the report shape.
- 4 and 5, the both-rules case and a tab on line 1 or 2: added to "Cases", with `#<tab>Guide` as well.
- 5. The question, the fence position: the tenth case now checks `sed -n 7p`, `sed -n 8p` and `wc -l` printing 8; "What to build" 2 names lines 7 and 8.
- 6. Implied inputs, the literal tab in the script: "What to build" 1 forbids a literal tab and names `printf '\t'`; Verify 7 checks it.
- 6. The leading-dash path: "What to build" 1 requires `--`; a case runs a file named `-x`.
- 6. The `%` and backslash path: "What to build" 1 requires `printf '%s'`; a case runs `<tmp>/100%s\n.md`.
- 6. The directory path: a case runs `docs`. The unreadable file is left without a case: the wrong answer costs nothing, since the title rule then fails the file too.
- 6. No trailing newline: two cases, a tab on the unterminated last line and a one-line file with no newline; "What to build" 1 says the last line is read whole.
- 6. Two or more arguments: decision 7, arguments after the first are not read; no case, since no caller passes more.
- 6. The stream of the FAIL line: decision 6, both lines go to stdout.
- 8. Dictated text: no finding. The lines added after the check dictate no text for a file: the new cases and requirements give commands and expected outputs, and the reason texts are those the check held.
