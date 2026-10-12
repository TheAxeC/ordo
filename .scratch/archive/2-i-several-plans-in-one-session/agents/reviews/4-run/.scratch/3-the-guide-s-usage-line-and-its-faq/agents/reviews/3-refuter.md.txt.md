# Refutation of step 3 of plan 3

## Verification lines

All run from the worktree root /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2i-run-2/.agents/worktrees/3-the-guide-s-usage-line-and-its-faq-3.

- Brief check 1 (character-set check over docs/faq.md and the report, with `echo "exit $?"`): printed no lines, then `exit 0`. Matches the report ("exit 0", no lines).
- `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` printed `1`.
- `grep -c '^## .*?$' docs/faq.md` printed `2`.
- `wc -l < docs/faq.md` printed `       9` (nine, with the macOS leading blanks).
- `sh tests/guide.test.sh 2>&1 | tail -1` printed `PASS: docs/guide.md`. Matches the report.
- `LC_ALL=C grep -n '[^ -~]' docs/faq.md` printed nothing (rc 1). The same over the report printed nothing (rc 1).
- The unchanged tree, simulated without writing anything (the diff changes only the appended sentence, so removing it from the current text gives the base): `sed 's/ The command .*$//' docs/faq.md | grep -c -F 'sh tests/guide.test.sh'` printed `0`, and `... | wc -l` printed `9`. This reproduces the report's first run for the first and third cases.
- `git status --short` printed ` M docs/faq.md` and `?? .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/3-report.md`.
- `git diff c1b3023` shows one hunk, `@@ -2,7 +2,7 @@`, in docs/faq.md only. Line 5 goes from `According to its opening paragraph, the guide says how to install the project and how to run it.` to the same text followed by ` The command `sh tests/guide.test.sh` checks that the first line of the guide is a title and that no line of it holds a tab.`
- `sed -n 5p docs/faq.md | od -c` shows the sentence ends with a newline and has no trailing space. `grep -n ' - \|--\|;' docs/faq.md` printed nothing (rc 1), so there is no spaced dash, double hyphen or semicolon.
- `ls docs/adr` printed `ls: docs/adr: No such file or directory`.
- Premises of "What is on the tree": `cat -n docs/dev/building.md` shows line 6 as the character-set check and line 7 as `sh tests/guide.test.sh 2>&1 | tail -1`. The verify list in orchestrator-state.md holds the same two commands. The base text of faq.md is as the brief says (line 5 text in the diff's removed line, nine lines, two headings). Not rechecked against the brief's stated main commit 0cc18f5; the base is c1b3023, and the diff touches line 5 only.
- Grep of `guide.test` over docs and tests: docs/faq.md:5, docs/roadmap.md:24, 25, 32, docs/dev/building.md:7, tests/guide.test.sh:5. Grep of `faq` over docs and tests: docs/faq.md:1 and docs/roadmap.md:28, 31, 32, 33. None of those lines is made false by the new sentence. Roadmap line 24 says the test "checks the guide's form", which agrees with the new sentence.
- tests/guide.test.sh head comment, read in full: the first line must start with a hash and a space (a Markdown title), no line may hold a tab, and the default file is docs/guide.md. Both claims in the new sentence are true of the script.

## Item verdicts

1. Line 5 of docs/faq.md: one sentence appended after a single space, on the same line, naming `sh tests/guide.test.sh` in backticks and saying what it checks as the script does: holds.
2. No other line of docs/faq.md changes, no heading added, no other file changed: holds. The diff is one hunk on line 5; git status shows only docs/faq.md and the report.
3. Plain prose under docs/dev/prose-standard.md (ASCII only, no dash aside, no section A filler word): holds for the three named requirements. Two points of the standard outside those three are under Standards.
4. The opening claim, "docs/faq.md names the command once, in a sentence that says what it checks, and it still holds exactly two questions": holds (counts 1 and 2 above).

## Case verdicts

1. `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1 after, 0 before: met. The 1 is run; the 0 is reproduced by simulation. The builder's own first run before the change is not verifiable by me.
2. `grep -c '^## .*?$' docs/faq.md` prints 2 after, as before: met.
3. `wc -l < docs/faq.md` prints 9 after, as before: met.
4. The new sentence says the command checks the guide's form, and what it says is what the script checks: met (script head comment: title rule and tab rule).

## Spec

none. The gate part for the plan (`grep -c -F ...` prints 1; headings count 2) is met and no other brief item is violated.

## Proof

- P1 (low). Place: .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/3-report.md, section "Reading of the new sentence against docs/dev/prose-standard.md". Quoted: "No departure. ... 24 words, a little over the roughly 20-word guide, because it states both rules ...". Brief item 5 of "Verify before you report" requires each place the sentence departs from the standard to be named. The report says "No departure" and in the same paragraph names a length above the standard's guide, so the report contradicts itself on whether there is a departure. The count of 24 words is correct (counted). Failure scenario: the orchestrator reads "No departure" at the top, takes the reading as clean, and misses that the report itself lists a length over the guide. The standard says "under roughly 20 words unless the mechanism needs more", so 24 is within "roughly" and needs no change to the docs; only the report line is inconsistent.
- The report's other claims (first run values, the five check outputs, the before and after line) were each reproduced above.

## Standards

- S1 (low, dictated by the brief). Place: docs/faq.md line 5. Quoted: "According to its opening paragraph, the guide says how to install the project and how to run it. The command `sh tests/guide.test.sh` checks ...". Prose standard section D: a paragraph covers one idea. The answer to "What does the guide cover?" now holds two ideas: what the guide says, and what a test script checks. The second sentence answers nothing the question asks, and the guide itself (docs/guide.md line 3) does not mention testing. Failure scenario: a reader asking what the guide covers reads that the guide's coverage includes a test command and may look for testing instructions in the guide, which names none. This placement is the brief's Decision 1 (keep two headings, so the heading check stays 2), and the roadmap gate requires the command in docs/faq.md and two questions, so the builder cannot be faulted; it is raised for the orchestrator's awareness only.
- Other prose-standard checks on the sentence: no dash, no semicolon, no filler or flagged word, active voice, ASCII, inline code for the command. None.

## Behaviour

- B1 (low, outside the brief's items, so not a violation). Place: docs/faq.md line 5, "The command `sh tests/guide.test.sh` checks ...". The script's head comment says to run it from the repository root, and with no argument it reads docs/guide.md by relative path. The sentence does not say where to run it. Failure scenario: a reader runs the command from docs/ or from a home directory, gets `FAIL: docs/guide.md: no such file`, and concludes the guide is missing or broken. docs/dev/building.md line 3 states the root rule, but the FAQ reader may not read it. Adding a clause would exceed the brief's wording ("says what the command checks in the guide"), so this is for the orchestrator to rule on, not a defect of the build.

## Declined to judge

- The builder's actual first run on the unchanged tree: not observable after the fact. I reproduced the values by removing the sentence in a pipe (nothing written).
- Whether the brief's reading of main at 0cc18f5 matches that commit: I did not run git against it, because my git was limited to `git diff c1b3023` and `git status --short`. I checked the premises against the worktree instead.
- Departure from my instructions, stated plainly: before reading the constraint's effect, I ran `git log --oneline -3` and `git rev-parse HEAD` once, both read-only, from inside the worktree. They changed nothing and no result depends on them beyond confirming HEAD is c1b3023.
- The plan's whole verify list on main (runs once at landing): not run here.

Usage: ab949a5723e4a311d, claude-sonnet-5-5, 75510 tokens, 10 tool uses, 2 min 56 s

## Closed

- P1: closed with no change. The report says "No departure" and names a sentence of 24 words; the prose standard asks for "under roughly 20 words unless the mechanism needs more", the sentence states the two rules the script checks, and no decision rests on the report line.
- S1: closed with no change. The FAQ is about the guide, and a sentence on the command that checks the guide's form is about the guide; the plan's step line and entry 3's gate keep two questions, and decision 1 of the brief puts the sentence in the first answer.
- B1: fixed at landing on main, inside the brief: the sentence says the command runs from the repository root, since the script reads docs/guide.md by a relative path.
