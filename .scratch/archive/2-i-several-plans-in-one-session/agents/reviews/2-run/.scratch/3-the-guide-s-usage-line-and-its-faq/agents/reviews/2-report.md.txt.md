Everything in the brief is done

## Open items of the state file

- none.

## The cases' first run (unchanged tree, before any change)

Run from the worktree's root. The first read of the guide: `cat -n docs/guide.md` prints line 1 `# Guide`, line 3 `This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills.` No case of the brief gets a wrong result from its own rules; the three cases about the changed file fail on the unchanged tree only because the file does not exist yet.

- Case "After the change: `head -1 docs/faq.md` prints `# FAQ`". Run `head -1 docs/faq.md`. Output: `head: docs/faq.md: No such file or directory`, exit 1. It holds only after the change.
- Case "After the change: `grep -c '^## .*?$' docs/faq.md` prints `2`, and `grep -c '^## ' docs/faq.md` prints `2`". Run both. Output of each: `ugrep: warning: docs/faq.md: No such file or directory`, exit 2. It holds only after the change.
- Case "Each question, read in place, is about the guide, and the paragraph under it answers it". Checked by reading: on the unchanged tree there is no question to read. It is checked after the change against `docs/guide.md` (see check 4 below).
- Case "Before the change: `ls docs/faq.md` prints `No such file or directory`". Run `ls docs/faq.md`. Output: `ls: docs/faq.md: No such file or directory`, exit 1. Holds.

Premises read on the tree: `ls docs` prints `dev`, `guide.md`, `roadmap.md`; `ls docs/adr` prints `ls: docs/adr: No such file or directory`.

## DONE / NOT DONE

| Item | Command | Output as printed | Status |
|---|---|---|---|
| New `docs/faq.md`, line 1 `# FAQ`, two questions, one paragraph each, nothing else | `cat -n docs/faq.md` | see "Files" below | DONE |
| 1. Character-set check over the file the step writes | `printf 'docs/faq.md\0' \| xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? \|\|= 1 if $bad }'; echo "exit $?"` | prints no line; `exit 0` | DONE |
| 2. First line | `head -1 docs/faq.md` | `# FAQ` | DONE |
| 3. Question headings | `grep -c '^## .*?$' docs/faq.md` then `grep -c '^## ' docs/faq.md` | `2` then `2` | DONE |
| 4. Each question and answer read against the guide and the prose standard's sentence-length rule | reading, plus a word count per sentence by `awk` | see "Judgment calls" | DONE |
| Prose standard application scan | `LC_ALL=C grep -n '[^ -~]' docs/faq.md` and `grep -n ' - \|--' docs/faq.md` | both print nothing, exit 1 (no match) | DONE |

Check 4 in detail. Question 1, "What does the guide cover?": the guide has a title (`# Guide`) and one paragraph, and the answer says that; the paragraph says the project keeps a short guide and its questions and that it is a scratch repository for one run of the plan skills, and the answer says that. Question 2, "Where does the guide say what the project is?": the answer is the opening paragraph directly under the `# Guide` title, and that paragraph's second sentence calls the project a scratch repository. The answer names no line number, so a change to the guide's line numbers does not make it false. Sentence word counts (awk over the file): 12 and 16 and 7 in the first paragraph, 10 and 8 in the second; all under 20. No semicolon, no dash, no colon-list, no "not X, Y" contrast; the two answers differ in length (three sentences, two sentences). The headings are the questions the brief requires, so they are sentences by the brief's instruction, not by choice.

## Files

- `docs/faq.md`, new, 9 lines (`wc -l docs/faq.md` prints `9 docs/faq.md`):

```
1    # FAQ
2    
3    ## What does the guide cover?
4    
5    `docs/guide.md` holds a title and one paragraph. The paragraph says the project keeps a short guide and its questions. It also says the project is a scratch repository for one run of the plan skills.
6    
7    ## Where does the guide say what the project is?
8    
9    In its opening paragraph, directly under the `# Guide` title. The paragraph calls the project a scratch repository.
```

- `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md`, this report.

No other file changed. No git command was run.

## Judgment calls

- The brief's decision 1 leaves the wording of the questions to the builder: question 1 asks what the guide covers, question 2 asks where the guide says what the project is. The two ask different things (contents, location).
- The answers name `# Guide` and "the opening paragraph" and no line number, because other steps in flight change line 3 of the guide. Each answer states what the guide says about its own shape and its project, which holds as long as the guide keeps a title and an opening paragraph that calls the project a scratch repository.
- The wording "calls the project a scratch repository" reads "It" in the guide's second sentence as the project, since the sentence before it has "This project" as its subject.

## User-visible change

Before: `docs/faq.md` does not exist (`ls docs/faq.md` prints `ls: docs/faq.md: No such file or directory`). After: `docs/faq.md` exists with the nine lines above.

## Anything in the brief that was wrong or impossible

Nothing found. The brief's description of the tree matches it: `docs/faq.md` and `docs/adr` do not exist, `docs/guide.md` line 1 is `# Guide`.
