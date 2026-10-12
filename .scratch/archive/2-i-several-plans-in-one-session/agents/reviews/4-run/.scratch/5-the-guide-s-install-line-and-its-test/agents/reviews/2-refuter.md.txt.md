REFUTER REPORT, step 2 of plan 5 (the guide's test and its command on the verification page)

Worktree: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2i-run-2/.agents/worktrees/5-the-guide-s-install-line-and-its-test-2
Base: 52682d0. `git status --short` in the worktree prints:
 M docs/dev/building.md
?? .scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md
?? tests/
`git diff 52682d0` shows one hunk, in docs/dev/building.md: one added line `+sh tests/guide.test.sh 2>&1 | tail -1` after the character-set check, inside the fence. `docs/adr` does not exist (`ls docs/adr` prints `ls: docs/adr: No such file or directory`). The report exists twice with identical content (`cmp` exit 0): in the worktree and in the main checkout.

## Verification lines (brief "Verify before you report", run from the worktree root)

1. The character-set check over tests/guide.test.sh, docs/dev/building.md and 2-report.md printed nothing, then:
   `exit 0`
2. `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'; echo "exit $?"` printed:
   `PASS: docs/guide.md`
   `exit 0`
3. `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` printed `1`.
4. Cases: below.
5. Head comment against the prose standard: see Standards finding S1.
6. `grep -rn 'guide.test' tests docs` printed:
   `tests/guide.test.sh:7:# Run it from the repository root as "sh tests/guide.test.sh [file]". The one`
   `docs/roadmap.md:24:` (goal of entry 5), `docs/roadmap.md:25:` (gate of entry 5), `docs/roadmap.md:32:` (gate of entry 3, `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1), and `docs/dev/building.md:7:sh tests/guide.test.sh 2>&1 | tail -1`.
   `grep -n 'green check' docs/dev/building.md` printed `3:The green check is every command below passing, each run from the repository root.`
   Read: roadmap lines 24 and 25 state what the step makes true. Line 32 concerns docs/faq.md, which the step does not touch. Line 3 of building.md stays true: the page now holds two commands, both run from the root. A wider grep (`guide.test` and `building.md` across the tree outside .scratch and .git) finds only these, plus .agents/plan.yaml:6 and docs/dev/change-standard.md:72, neither made false.
7. `grep -c "$(printf '\t')" tests/guide.test.sh` printed `0`.
Extra: `LC_ALL=C grep -n '[^ -~]' tests/guide.test.sh docs/dev/building.md` printed nothing (exit 1). `wc -l`: tests/guide.test.sh 46, docs/dev/building.md 8. `sed -n 7p` prints the command, `sed -n 8p` prints three backticks, `wc -l < docs/dev/building.md` prints 8. The character-set perl command over every file under the worktree outside .git and .agents (a find-based stand-in for `git ls-files`, which I may not run) printed nothing, `exit 0`.

## Item verdicts ("What to build")

1. tests/guide.test.sh: holds. Each bullet checked against the script (cat -n) and runs:
   - Optional path, default docs/guide.md: lines 22-26, holds.
   - PASS and exit 0 on a `# ` first line with no tab: holds (cases 1, 2, 14).
   - FAIL line and exit 1 with the three reasons: holds.
   - Title reported when both rules fail: holds (case 12).
   - `<file>` printed as given: holds.
   - Path quoted at every use: holds (case 7).
   - `--` before the path in `head` and `grep`: lines 33 and 39, holds (case 16). The title `grep` reads stdin and takes no path.
   - `printf '%s'` for the path, no echo: lines 29, 34, 41, 45, holds (case 17).
   - Last line without a newline read whole: holds (cases 13, 14).
   - Arguments after the first not read: holds (`sh tests/guide.test.sh docs/guide.md /nonexistent` prints `PASS: docs/guide.md`, exit 0).
   - Both result lines on stdout: holds (`2>/dev/null` still shows the FAIL line, `>/dev/null` shows nothing).
   - ASCII and no literal tab: holds (checks 1 and 7).
   - Only head, grep, printf, with `[`, `exit` and parameter expansion as shell: holds. No bash-only syntax; the same cases give identical output under /bin/dash.
   - Head comment states what is checked, the input, each printed line and each exit status: holds, with the exception in Behaviour B1.
2. docs/dev/building.md: holds. The diff is the one added line at line 7, the fence closes at line 8, grep -c prints 1, and line 3 is unchanged and still true.

## Case verdicts ("Cases")

I ran each case under `sh` and under `dash`, from the worktree root with temporary files from `mktemp -d` outside the repository (removed at the end). `<T>` is that folder.
1. No argument: met. `PASS: docs/guide.md`, exit 0.
2. `docs/guide.md`: met. `PASS: docs/guide.md`, exit 0.
3. First line not a title: met. `FAIL: <T>/notitle.md: the first line is not a title`, exit 1.
4. Title and a tab on line 3: met. `FAIL: <T>/tab3.md: line 3 holds a tab`, exit 1.
5. Empty file: met. `FAIL: <T>/empty.md: the first line is not a title`, exit 1.
6. Missing path: met. `FAIL: <T>/missing.md: no such file`, exit 1.
7. Path with a space: met. `PASS: <T>/a guide.md`, exit 0.
8. `#Guide`: met. `FAIL: <T>/nospace.md: the first line is not a title`, exit 1.
9. `#<tab>Guide`: met. `FAIL: <T>/hashtab.md: the first line is not a title`, exit 1.
10. Tab on line 1 after a title: met. `FAIL: <T>/tab1.md: line 1 holds a tab`, exit 1.
11. Tab on line 2: met. `FAIL: <T>/tab2.md: line 2 holds a tab`, exit 1.
12. Both rules failing: met. `FAIL: <T>/both.md: the first line is not a title`, exit 1.
13. No newline, tab on the last line: met. `FAIL: <T>/nonl_tab.md: line 2 holds a tab`, exit 1.
14. One-line file without a newline: met. `PASS: <T>/oneline.md`, exit 0.
15. Directory `docs`: met. `FAIL: docs: no such file`, exit 1.
16. Path `-x` from `<T>` with the script by absolute path: met. `PASS: -x`, exit 0.
17. Path `<T>/100%s\n.md`: met. `PASS: <T>/100%s\n.md`, exit 0.
18. Unchanged tree, script absent: met. The main checkout (HEAD cf5c5b6, whose tests/ is absent and whose docs/dev/building.md has 7 lines, so it matches the base for the files concerned): `sh tests/guide.test.sh` prints `sh: tests/guide.test.sh: No such file or directory`, exit 127. The same `bash -o pipefail -c` form prints that line, exit 127. The builder's first-run table (all rows the same line, exit 127) is consistent with this.
19. Page command: met. grep -c prints `0` on the main checkout and `1` in the worktree. After the change `sed -n 7p`, `sed -n 8p` and `wc -l` print the command, three backticks and `8`.
20. `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'`: met. `PASS: docs/guide.md`, exit 0.

## Spec

none. The diff does what the brief names. No change outside the three listed paths, no dependency, no shape reserved to the user taken, no substitute. The brief's premises reproduce (tests/ absent, docs/guide.md 3 lines with no tab, building.md 7 lines before the change, docs/adr absent). The cases' first run on the unchanged tree is given for every case. The one difference is that the unchanged tree I used is main's HEAD, not 52682d0 itself.

## Proof

none. Every command the report quotes was rerun with the same result: the check outputs, the `PASS`, `FAIL` and exit lines of each case, the empty-string argument (`FAIL: : no such file`, exit 1), the extra argument, the grep counts, the rule 14 grep lines, `wc -l` 46 and 8, the ASCII grep, and the tab count 0. The rule 13 table covers the four behaviours the brief names plus the page line, and each case it names matches a run above. Not reproduced: the report's `git diff --stat` line and its `git ls-files` character-set claim, because those git forms are barred for me. The diff content and my find-based stand-in agree with them, and no decision rests on either.

## Standards

S1. File docs/dev/prose-standard.md, section F ("Source formatting: one paragraph or bullet per source line, no hard wrapping"), and section E (passive voice, repeated construction). Place: tests/guide.test.sh:1-20, the head comment. The brief asks for a head comment "in plain prose under the prose standard", and the report says "Nothing departs from it". The comment is hard-wrapped: every paragraph runs over several source lines (for example lines 3-5 and 7-9). It is mostly passive ("is printed" at lines 16 and 17, "is not read" at line 9), and lines 16-18 repeat one construction (`"<reason>" is printed ...`). Failure scenario: a reviewer holding the head comment to section F finds a departure the report said was absent. Counterpoint: skills/land/templates/checks.sh wraps its head comment the same way, so the repository has a precedent, and the standard says header comments are prose surfaces. Whether the standard or the precedent governs is the orchestrator's call; the report's "nothing departs" is the unreproduced claim.

No other standard breached: no history in comments, no non-ASCII, no literal tab, no double blank lines, no step numbers in comments, nothing made false by the diff (rule 14 greps above).

## Behaviour

B1. tests/guide.test.sh:39-41 and the head comment lines 15 and 18 ("line <n> holds a tab", "<n> is the number of the first line that holds a tab"). With a NUL byte in the file, `grep -n` prints `Binary file <path> matches` instead of `<n>:<text>`. Run: `printf '# G\n\0\tx\n'` in a file prints `FAIL: <path>: line Binary file <path> matches holds a tab`, exit 1 (sh and dash). The verdict and exit status are right and the printed line departs from the form the head comment lists. The change standard says code handles a case only when a wrong answer on it costs something, and a guide holding a NUL byte has not happened, so no change is demanded.
B2. tests/guide.test.sh:39. The tab rule depends on the locale. With `LC_ALL=en_US.UTF-8`, a line that holds an invalid UTF-8 byte and a tab passes: `printf '# G\n\377\ttab\n'` prints `PASS: <path>`, exit 0. With `LC_ALL=C` it prints `FAIL: <path>: line 2 holds a tab`, exit 1. This is a tab-containing guide that passes, the behaviour whose failure the rule 13 table says costs something. The verify list's character-set check rejects the non-ASCII byte in a Markdown file, so the combined list still fails such a guide. Whether a locale-independent tab check is wanted is for the orchestrator; neither the brief nor the report mentions locale.
B3. User-visible changes: the report states the before and after for the script and for the page. It does not say that the landing's rewritten verify list gains a second command, which the brief assigns to the landing. Not a finding.

## Declined to judge

- The plan's whole verify list through `checks.sh` on main, and the landing's rewrite of the state file's verify list: both belong to the landing. I confirmed only that checks.sh runs each command through `bash -o pipefail -c` (skills/land/templates/checks.sh lines 8 and 119).
- Behaviour under POSIX shells other than macOS /bin/sh (bash 3.2.57 in POSIX mode) and /bin/dash: none other is installed here.
- The report's `git diff --stat` and `git ls-files` claims: git commands other than `git diff 52682d0` and `git status --short` are not allowed me.
- The builder's own unchanged-tree runs at the base 52682d0: I could not check out the base, and used main's HEAD (cf5c5b6), which holds the same files for tests/ and docs/dev/building.md.

Usage: affe0b4b29ffefabd, claude-sonnet-5-5, 116555 tokens, 16 tool uses, 3 min 31 s

## Repair round 1, refuted

Short result: the round closes S1 on the hard wrapping and the passive voice. It leaves one smaller departure in the new comment (S2, sentence length and a repeated construction). The report's "Nothing departs" is therefore not reproduced. No code line changed, no check was removed, the fix stayed inside the comment, and every case is met.

### Verification lines

State and delta, run in the worktree:
- `git status --short` printed ` M docs/dev/building.md`, `?? .scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md` and `?? tests/`.
- `git diff 52682d0` shows one hunk, the added line `+sh tests/guide.test.sh 2>&1 | tail -1` after the character-set check, inside the fence.
- `md5 -q docs/dev/building.md` printed `bce0344cba0b258dc4b42123b9956879`. It is unchanged from the send.
- Code lines unchanged: I rebuilt the pre-round file from the report's "Comment before" block (report lines 142-161), one blank line, and lines 17 to 41 of the current script. `md5 -q` of that file printed `44fe190d38d29779705a90f4cf0fd794`, the md5 recorded at send. So the code after the comment is byte-identical to the code the first refuter read. It moved from line 22 to line 17, an offset of 5, and the first report's line numbers map onto it (33 to 28, 39 to 34, 29/34/41/45 to 24/29/36/40).
- `wc -l tests/guide.test.sh` printed `41`, `wc -l < docs/dev/building.md` printed `8`.
- `cmp` of the report in the worktree against the report on main printed nothing (`cmp 0`).
- `ls docs/adr` printed `No such file or directory`, so no ADR governs the diff.

Brief "Verify before you report", from the worktree root:
1. The character-set check over `tests/guide.test.sh`, `docs/dev/building.md` and `2-report.md` printed nothing, then `exit 0`.
2. `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'; echo "exit $?"` printed `PASS: docs/guide.md` then `exit 0`.
3. `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` printed `1`.
4. Cases: below. Every one ran under `sh` and under `dash`, with the same output, in a `mktemp -d` folder that I removed (`ls` of it printed `No such file or directory`).
5. Head comment against the prose standard: see S2.
6. `grep -rn 'guide.test' tests docs` printed `tests/guide.test.sh:5:`, which is the head comment, then `docs/roadmap.md:24:`, `docs/roadmap.md:25:`, `docs/roadmap.md:32:` and `docs/dev/building.md:7:sh tests/guide.test.sh 2>&1 | tail -1`. `grep -n 'green check' docs/dev/building.md` printed `3:The green check is every command below passing, each run from the repository root.` None of these is made false. Roadmap lines 24 and 25 state what the step makes true, and line 32 concerns `docs/faq.md`.
7. `grep -c "$(printf '\t')" tests/guide.test.sh` printed `0`.

Extra checks:
- `LC_ALL=C grep -n '[^ -~]' tests/guide.test.sh` printed nothing (exit 1).
- `sed -n 7p docs/dev/building.md` printed the command and `sed -n 8p` printed three backticks.

The unchanged tree is the main checkout:
- `ls tests` printed `No such file or directory`.
- `sh tests/guide.test.sh` printed `sh: tests/guide.test.sh: No such file or directory`, exit 127.
- `grep -c -F ...` printed `0`.
- `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'` printed the same line, exit 127.
- `wc -l docs/dev/building.md` printed `7`.

### Item verdicts

1. `tests/guide.test.sh`: violated in one bullet only, the head comment "in plain prose under the prose standard" (finding S2 in Standards). Every other bullet holds: optional path and default, PASS and exit 0, the three FAIL reasons, title first when both rules fail, path printed as given, quoting, `--` before the path in `head` and `grep`, `printf '%s'`, last line without a newline, arguments after the first not read, both lines on stdout, ASCII and no literal tab, and only `head`, `grep` and `printf`.
2. `docs/dev/building.md`: holds. One added line at line 7, the fence closes at line 8, the grep prints 1, and line 3 is unchanged and still true.

### Case verdicts

In the brief's "Cases" order:
1. No argument: met. `PASS: docs/guide.md`, exit 0.
2. `docs/guide.md`: met. `PASS: docs/guide.md`, exit 0.
3. First line not a title: met. `FAIL: <T>/notitle.md: the first line is not a title`, exit 1.
4. Title and a tab on line 3: met. `FAIL: <T>/tab3.md: line 3 holds a tab`, exit 1.
5. Empty file: met. `FAIL: <T>/empty.md: the first line is not a title`, exit 1.
6. Missing path: met. `FAIL: <T>/missing.md: no such file`, exit 1.
7. Path with a space: met. `PASS: <T>/a guide.md`, exit 0.
8. `#Guide`: met. The title FAIL line, exit 1.
9. `#<tab>Guide`: met. The title FAIL line, exit 1.
10. Tab on line 1 after a title: met. `line 1 holds a tab`, exit 1.
11. Tab on line 2: met. `line 2 holds a tab`, exit 1.
12. Both rules failing: met. The title FAIL line, exit 1.
13. Last line without a newline, with a tab: met. `line 2 holds a tab`, exit 1.
14. One-line file without a newline: met. `PASS: <T>/oneline.md`, exit 0.
15. Directory `docs`: met. `FAIL: docs: no such file`, exit 1.
16. Path `-x`, run from the temporary folder with the script by absolute path: met. `PASS: -x`, exit 0.
17. Path `<T>/100%s\n.md`: met. `PASS: <T>/100%s\n.md`, exit 0.
18. Unchanged tree, script absent: met. Output as quoted above, exit 127.
19. Page command: met. The grep prints 0 on the unchanged tree and 1 after. `sed -n 7p`, `sed -n 8p` and `wc -l` print the command, three backticks and `8`.
20. Verify-list form through `bash -o pipefail -c`: met. `PASS: docs/guide.md`, exit 0.

Also run, beyond the cases:
- Empty-string argument: `FAIL: : no such file`, exit 1.
- `docs/guide.md /nonexistent`: `PASS: docs/guide.md`, exit 0.
- `2>/dev/null` still shows the FAIL line, and `>/dev/null` shows nothing.
- A mode-000 file: `FAIL: ...: no such file`, exit 1.

### Spec

none. The round writes only the head comment and the report, both inside the brief's paths. The comment keeps every element of the old one: the two rules, the title rule first, the one input and its default, the argument after the first not read, the four printed forms, when each reason is printed, and both exit statuses. The report gained the "Repair round 1" section, with the comment before and after and the reruns, and the judgment-calls section no longer says the comment departs from nothing.

### Proof

none. Every command in the report's "Repair round 1" section reproduces, and so does the rule 14 reread at report line 106: the lines 28-38, 24/29/36/40, 41, 23 and 17-21 it cites match the script. The "Comment before" block equals the pre-round text (md5 above).

### Standards

S2. File `tests/guide.test.sh`, lines 3 and 13 (head comment). The standard is `docs/dev/prose-standard.md`, sections E and 0.
- Hunk, line 3: `# The script applies two rules: the first line of the file must start with a hash and a space, which makes it a Markdown title, and no line of the file may hold a tab character.` That is 36 words, 31 of them after the colon, in one sentence.
- Hunk, line 13: `A file whose line 1 does not start with a hash and a space, an empty file included, gets "the first line is not a title".` That is 26 words.
- Section E says sentences stay "under roughly 20 words unless the mechanism needs more". Neither sentence needs more, since the two rules are separable. The old comment held them in short sentences. The repair merged the rules into one long sentence and so passes section F at the cost of section E.
- Line 13 still has two of its three sentences on one shape: `A path that is not a readable regular file ... gets "no such file". A file whose line 1 ... gets "the first line is not a title".` The round brief asked that the three reason sentences not repeat one construction. Two of the three do, which is a smaller case of the section 0 "no repeated construction" rule.
- Failure scenario: a reviewer holding the comment to section E finds a departure that report line 110 ("Nothing departs from it now ... the sentences are active where the actor matters") and the "Head comment against the prose standard" section deny. The claim is unreproduced for sentence length.
- Verdict it names: item 1, head-comment bullet, violated. The text is fixed by reading: split line 3 into one sentence per rule, split or shorten line 13, vary the second reason sentence, and correct report line 110.

The rest of the comment holds against sections 0 and A to F and rule 14:
- No dash aside, arrow, semicolon, banned word or history.
- One paragraph per source line, with no hard wrapping.
- No double blank line.
- ASCII only.
- Every sentence is true of the code at lines 17-41: two rules, title first, default path, `$1` only, four `printf` forms on stdout, a directory gets "no such file", an empty file gets the title reason, `<n>` is the first tab line, exit 0 or 1.

### Behaviour

B1 (a NUL byte in a guide makes `grep -n` print `Binary file ... matches` inside the line text) and B2 (the tab search depends on the locale for an invalid UTF-8 byte) were not sent. The code is byte-identical to the one they were found in, so they stand as in the first refuter report. I did not rerun them. No new behaviour finding.

### Declined to judge

- The report's `git diff --stat` and `git ls-files` character-set claims (report lines 71 and 79): git commands other than `git diff 52682d0` and `git status --short` are not allowed me. The find-free `printf | xargs` form of check 1 and the ASCII grep agree with them.
- The plan's whole verify list through `checks.sh` and the landing's rewrite of the state file's verify list: both belong to the landing.
- Shells other than macOS `/bin/sh` and `dash`: no other is installed here.
- The builder's own unchanged-tree runs at base 52682d0: I used the main checkout, which holds the same `tests/` (absent) and `docs/dev/building.md` (7 lines).

Usage: a3df69c2e3d5202dc, claude-sonnet-5-5, 102153 tokens, 16 tool uses, 1 min 48 s

## Closed

- S1 (first run): sent in repair round 1 and fixed there; the run over round 1 reproduces the fix for the hard wrapping and the passive voice.
- B1 (first run): closed with no change. A NUL byte in a guide has not happened, and the wrong line it prints costs nothing: the check still fails such a file.
- B2 (first run): closed with no change. The verify list's character-set check fails a guide holding a byte outside ASCII, so a guide that reaches the tab check under the wrong locale never passes the verify list.
- S2 (run over round 1): the findings of the run over the last round are never sent back; it is small and inside the brief, so it is fixed at landing on main: line 3 split into one sentence per rule, the reason sentences of line 13 recast so no two share one shape.
