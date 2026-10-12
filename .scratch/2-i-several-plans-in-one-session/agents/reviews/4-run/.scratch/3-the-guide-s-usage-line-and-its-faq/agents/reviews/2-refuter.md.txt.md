REFUTER REPORT, step 2 of plan 3 (the FAQ), base 23e472f

## Verification lines, verbatim (from the worktree root, brief's "Verify before you report")

1. Character-set check over `docs/faq.md` and the report, then `echo "exit $?"`:
```
exit 0
```
(it printed no other line)
2. `head -1 docs/faq.md`:
```
# FAQ
```
3. `grep -c '^## .*?$' docs/faq.md`:
```
2
```
4. Prose-standard read of each sentence: done by me (see Standards). I also ran `LC_ALL=C grep -n '[^ -~]' docs/faq.md` (no output, rc 1) and `grep -nE ' - | -- ' docs/faq.md` (no output, rc 1).

Other commands I ran:
- `wc -l < docs/faq.md` printed `       9`.
- `grep -n '^## ' docs/faq.md` printed `3:## What does the guide cover?` and `7:## What does the guide say this project is?`.
- `git diff 23e472f` printed nothing (0 lines).
- `git status --short` printed `?? .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md` and `?? docs/faq.md`.
- `git cat-file -e 23e472f:docs/faq.md` printed `fatal: path 'docs/faq.md' exists on disk, but not in '23e472f'`.
- `ls docs/adr` printed `ls: docs/adr: No such file or directory`, in the worktree and in the main checkout.
- `cat -n docs/guide.md`, in the main checkout and with `git show 23e472f:docs/guide.md`, printed 3 lines: `# Guide`, an empty line, and `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it.` Premises of "What is on the tree" reproduced.
- Double-blank scan with awk printed nothing. Words per line: 2, 0, 6, 0, 23, 0, 9, 0, 14.

## Report claims rerun
- Cases' first run, run in the main checkout where `docs/faq.md` does not exist. These match the report exactly:
  - `head -1 docs/faq.md` printed `head: docs/faq.md: No such file or directory`.
  - `grep -c '^## .*?$' docs/faq.md` printed `ugrep: warning: docs/faq.md: No such file or directory`.
  - `wc -l < docs/faq.md` printed `(eval):1: no such file or directory: docs/faq.md`.
- The post-change values in the report (`# FAQ`, `2`, `9`, the `grep -n '^## '` lines, the two empty greps, `exit 0`) all reproduce.

## Item verdicts ("What to build")
1. `docs/faq.md` exists, line 1 `# FAQ`, exactly two level-two headings ending with `?`, each followed by an answering paragraph: holds (`head -1`, `grep -c`, `cat -n docs/faq.md`).
2. Format (heading line `## <question>?`, one-line paragraphs, no hard wrap, one blank line between heading and answer, no other level-two heading, no double blank lines): holds (`cat -e` showed 9 lines; awk double-blank scan printed nothing).
3. Each question is about the guide, and each answer states what the guide says at the base without naming a command the guide lacks: holds in the letter. The answer to question 1 ends with "The guide lists no commands.", which is a statement of absence, not something the guide says. See Standards finding S1.
4. Prose follows `docs/dev/prose-standard.md` (ASCII, no aside dash, no section A filler word): holds (greps above; no word of section A or the flagged list appears).
5. No other file of the tree changes: holds (`git diff 23e472f` empty; the only untracked files are `docs/faq.md` and the named report).

## Case verdicts ("Cases")
1. `head -1 docs/faq.md` prints `# FAQ`; on the unchanged tree it prints the "No such file" line: met (both outputs reproduced).
2. `grep -c '^## .*?$' docs/faq.md` prints `2`: met.
3. Each question, read in place, is about the guide and is followed by a paragraph that answers it: met. Q1 "What does the guide cover?" is answered from guide line 3, second sentence. Q2 "What does the guide say this project is?" is answered from guide line 3, first sentence.
4. `wc -l < docs/faq.md` is fewer than 20: met (9).

Size line (small text step): met. `git diff 23e472f` changes no tracked file, so no script, test or configuration file and 0 changed lines; the new file is 9 lines, under 20.

## Spec
none. Every item is done as the brief shapes it, no change lies outside the brief's paths, and no user-reserved decision or dependency is taken. The premises of "What is on the tree" reproduce (the brief's "main at c540ae3" differs from the base 23e472f only by preparation commits). No ADR folder exists. The first run of every case on the unchanged tree is in the report.

## Proof
none. The checks the report quotes reproduce. One minor point: the report writes "The character-set check, run from the worktree root as the brief gives it:" and then gives no command text, only "It printed no lines, and the echo printed `exit 0`". The result reproduces and no decision rests on it.

## Standards
- S1. Place: `docs/faq.md` line 5, second sentence. Hunk: `The guide lists no commands.` Rule: `docs/dev/change-standard.md` rules 14 and 18 (a change leaves no sentence a document makes false). The sentence is true at the base. This plan's own step 1 ("Could run in parallel: 1 with 2") makes the guide's opening paragraph name `sh install.sh`... and `sh run.sh <name>`, and plan 5's step 1 (the install sentence) adds `sh install.sh`. Once either lands, the guide lists commands, and this sentence is false in the same file's repository. Failure scenario: a reader opens the FAQ after the plan closes, reads that the guide lists no commands, takes it that there is nothing to run, and misses the install and run commands in the guide's opening paragraph. The sentence also adds a claim about absence that the brief's "states what the guide says" does not ask for, and nothing in the brief's items requires it, so removing it costs nothing the brief wants. Brief decision 1 (describe the base) does not require the sentence.
- Otherwise none. Against `prose-standard.md` sections 0 and A to F: no dash, no filler or flagged word, no throat-clearing opener (the "According to its opening paragraph," lead names the source and is not a section C opener), sentences of 14 and 9 words in the answers, paragraphs well under four sentences, ASCII only, headings are the questions the brief requires.

## Behaviour
none. The report states before (`docs/faq.md` absent) and after (the 9-line file); that is the only user-visible change and `git status --short` agrees.

## Declined to judge
- Whether the whole verify list passes on main: it runs once at landing through `checks.sh`, not here. I ran only the brief's character-set check over the two files.
- The text of the guide after this plan's step 1 and plan 5's step 1 land: those steps are not in this worktree, so S1 rests on the plan and brief text (`plan.md` step 1; the brief's "Other steps in flight change line 3"), not on a run.
- Step 3 of this plan (the test command in the FAQ) and the entry's gate part `grep -c -F 'sh tests/guide.test.sh' docs/faq.md`: outside this step.

Usage: a9ee783bdb416bde3, claude-sonnet-5-5, 69786 tokens, 9 tool uses, 62 s

## Closed

- S1, `docs/faq.md` line 5, "The guide lists no commands.": fixed at landing. The sentence is removed on main, so the answer states only what the guide says. It is small and inside the brief, whose item asks each answer to state what the guide says and nothing else.
- The Proof note on the character-set check quoted without its command text: no decision rests on it, and the reviewer's own run reproduces `exit 0`. No change.
