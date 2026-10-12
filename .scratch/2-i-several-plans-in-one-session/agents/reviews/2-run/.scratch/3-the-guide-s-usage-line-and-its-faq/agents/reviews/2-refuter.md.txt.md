# Step 2 refuter report (on /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2i-run/.agents/worktrees/3-the-guide-s-usage-line-and-its-faq-2, base f2145b1)

## Verification (rerun by the reviewer)

Worktree state read first: `git diff f2145b1` prints nothing (the new files are untracked); `git status --short` prints the two untracked files; `docs/adr` does not exist (`ls docs/adr` prints `ls: docs/adr: No such file or directory`), so no ADR applies.

```
$ git status --short            (worktree)
?? .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md
?? docs/faq.md

$ printf 'docs/faq.md\0' | xargs -0 perl -CSD -ne '<building.md check>'; echo "exit $?"
exit 0

$ head -1 docs/faq.md
# FAQ

$ grep -c '^## .*?$' docs/faq.md
2
$ grep -c '^## ' docs/faq.md
2

$ LC_ALL=C grep -n '[^ -~]' docs/faq.md; echo "ascii exit $?"
ascii exit 1
$ grep -n ' - \|--' docs/faq.md; echo "dash exit $?"
dash exit 1
$ wc -l docs/faq.md
       9 docs/faq.md

$ awk (words per sentence, line 5 then line 9)
5 7
5 12
5 16
9 10
9 8

$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '<building.md check, the plan verify list>'; echo "whole exit $?"     (worktree)
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:36: 1    # FAQ
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:37: 2    
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:38: 3    ## What does the guide cover?
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:39: 4    
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:40: 5    `docs/guide.md` holds a title and one paragraph. ...
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:41: 6    
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:42: 7    ## Where does the guide say what the project is?
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:43: 8    
.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md:44: 9    In its opening paragraph, directly under the `# Guide` title. The paragraph ...
whole exit 1

$ same whole check on main's checkout (the report file is identical, cmp exit 0)
(the same 9 lines for .scratch/.../agents/reviews/2-report.md:36-44)
main exit 1

$ grep -c "$(printf '\t')" .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md     (main)
9

$ cat .gitignore    (main)
.agents/worktrees/
```

Builder-quoted first-run commands, rerun on main's unchanged tree (docs/faq.md absent there):

```
$ head -1 docs/faq.md          -> head: docs/faq.md: No such file or directory   (exit 1)
$ grep -c '^## .*?$' docs/faq.md -> ugrep: warning: docs/faq.md: No such file or directory   (exit 2)
$ grep -c '^## ' docs/faq.md     -> ugrep: warning: docs/faq.md: No such file or directory   (exit 2)
$ ls docs/faq.md               -> ls: docs/faq.md: No such file or directory   (exit 1)
$ ls docs                      -> dev  guide.md  roadmap.md
```

All of these match the report. One difference: the report gives the sentence word counts of the first answer as "12 and 16 and 7"; the file's order is 7, 12, 16. The values are the same set and all are under 20.

## Verdicts

What to build:
- `docs/faq.md` exists, line 1 is `# FAQ`: holds (`head -1`).
- Exactly two questions, each a `## ` heading ending in `?`: holds (both greps print 2).
- Each heading followed by one paragraph: holds (`cat -n`: lines 5 and 9, one paragraph each).
- Questions are about the guide, each answer true of `docs/guide.md` as it stands at the base (line 1 `# Guide`, line 3 "This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills."): holds.
- No other `## ` heading and no line outside title, questions, answers and blank lines: holds (9 lines, `cat -n`).
- Plain prose under the prose standard, ASCII only: holds for `docs/faq.md` (ascii grep exit 1, perl check exit 0, dash grep exit 1); see finding 3.1 for the ledger report and 3.2 for a wording point.

Cases:
- `head -1 docs/faq.md` prints `# FAQ` after the change: met.
- `grep -c '^## .*?$'` prints 2 and `grep -c '^## '` prints 2: met.
- Each question, read in place, is about the guide and its paragraph answers it: met. "What does the guide cover?" is answered by "a title and one paragraph" plus what the paragraph says, which matches line 1 and line 3 at the base. "Where does the guide say what the project is?" is answered by "In its opening paragraph, directly under the `# Guide` title" plus "calls the project a scratch repository", which matches the base (the second sentence of line 3 names the project a scratch repository). Both read true for `docs/guide.md`.
- `ls docs/faq.md` prints `No such file or directory` before the change: met (rerun on main).
- The builder's first run of every case on the unchanged tree: met (the report gives all four with commands, outputs and exit statuses; I reproduced each).

## 1. Spec

none.

Checked: the diff since the base touches no script, test or configuration file and adds 9 lines (under 20), so it is a small text step as the brief says. The premises of "What is on the tree" reproduce (`docs/faq.md` and `docs/adr` absent, `docs/guide.md` line 1 `# Guide`). No decision reserved by the brief was taken. The only paths written are `docs/faq.md` and the report, as listed.

## 2. Proof

none.

Every command the report quotes reproduces with the same output. No claim a decision rests on is unreproduced.

## 3. Standards

3.1. The report file fails the plan's character-set check. Place: `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md`, section "Files", the quoted listing, lines 36-44 of the file. Hunk: `1    # FAQ`, `2    `, `3    ## What does the guide cover?`, ... `9    In its opening paragraph, ...` (the `cat -n` output, each with a tab after the number). What is wrong: the check of `docs/dev/building.md` allows only `\x20-\x7E` (plus `\x{2705}` in `.md` files) and a newline, so each of the 9 tab characters is flagged; `grep -c` of a tab in the file prints 9. The report is not covered by the brief's check 1 (which runs over `docs/faq.md` only), and it is not ignored by git (the `.gitignore` holds only `.agents/worktrees/`), so the whole verify list, which runs once on main at landing over `git ls-files -coz --exclude-standard`, includes it. Failure scenario: `land` runs the verify list on main, the character-set command exits 1 and prints those 9 lines, and the landing is a red line although `docs/faq.md` is clean. The report's own claim "Everything in the brief is done" and its DONE row for the character-set check cover only `docs/faq.md`, so the report does not state this. I reproduced it on main's checkout (same file, `cmp` exit 0) and in the worktree.

3.2. Prose standard, section E (stop-start fragments, cold opens) and D (repeated construction). Place: `docs/faq.md`, the answer under "Where does the guide say what the project is?", first sentence: `In its opening paragraph, directly under the `# Guide` title.` What is wrong: it is a sentence without a subject or verb, completed only by the heading above it, followed by a full sentence. The prose standard says to join stop-start fragments and not to leave a first sentence without an antecedent. The two answers also repeat one construction ("The paragraph says ...", "It also says ...", "The paragraph calls ..."). Failure scenario: a reader or reviewer holding the page to section E marks the fragment as a finding; the heading-to-answer dependency also breaks if the answer is quoted alone (for example in search output). This is a wording point, not a rule the brief makes mandatory.

## 4. Behaviour

4.1. The new page and the guide it describes move apart as other steps land. Place: `docs/faq.md`, the answer under "What does the guide cover?": `` `docs/guide.md` holds a title and one paragraph. The paragraph says the project keeps a short guide and its questions. It also says the project is a scratch repository for one run of the plan skills. `` Observation: on main's checkout today, `docs/guide.md` line 3 already ends with "Install it with `sh install.sh`." (plan 5 step 1 has landed there), and plan 3 step 1 will add the `sh run.sh <name>` sentence. The answer stays true as written (one paragraph, the two sentences it names exist) but no longer lists what the opening paragraph says. Failure scenario: a reader asking "what does the guide cover?" after those steps gets an answer that omits the install and usage commands. The brief fixes "true at the base" as the requirement, so this is not a violation of the step; it is a decision for the orchestrator whether the FAQ is revisited after plan 3 step 1.

User-visible change: the report states before (`docs/faq.md` absent) and after (9 lines); the diff matches that. No other user-visible change.

## Declined to judge

- Whether the two questions are the best two questions about the guide: the brief leaves the wording to the builder (Decision 1), and the guide has only one paragraph, so the choice is wide; I judged only that each is about the guide and answered truly.
- Whether the overlap between the two answers (both state that the project is a scratch repository) is a prose-standard problem: the standard names no overlap rule between separate answers, so I recorded it only as a wording point under 3.2.
- Any state of main after landing: not run, outside a refuter's scope.

Reviewer usage: a1f38991e8921cbad, claude-sonnet-5-5, 74167 tokens, 11 tool uses, 1.4 minutes.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- 3.1, tabs in the saved report: closed before this landing. The tabs of `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md` in main's copy were replaced by four spaces at the landing of plan 5's step 1, which they had failed; `grep -c` of a tab in the file prints 0.
- 3.2, the fragment under "Where does the guide say what the project is?": fixed at landing in `docs/faq.md`, the answer rewritten as one full sentence; a small text step's finding, small and inside the brief.
- 4.1, the answer under "What does the guide cover?" lists the opening paragraph's sentences and so omits the install and usage sentences as they land: fixed at landing in `docs/faq.md`, the answer rewritten to say what the guide covers without listing the paragraph's sentences, so it stays true as the paragraph gains them; small and inside the brief.
