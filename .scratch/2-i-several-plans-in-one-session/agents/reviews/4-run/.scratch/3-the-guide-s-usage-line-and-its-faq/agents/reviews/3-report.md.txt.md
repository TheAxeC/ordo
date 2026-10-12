# Report: step 3, the FAQ names the guide's test command

Everything in the brief is done.

## Open items of the state file, verbatim

- none.

## The cases' first run (unchanged tree, before any change)

- `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` printed `0`. Matches the brief (0 on the unchanged tree).
- `grep -c '^## .*?$' docs/faq.md` printed `2`.
- `wc -l < docs/faq.md` printed `9`.
- The new sentence, read in place: a text case, not runnable on the unchanged tree. Read against `tests/guide.test.sh` lines 1-15: the script requires the first line to start with a hash and a space (a Markdown title) and no line to hold a tab; it reads docs/guide.md by default. No case is wrong under the brief's own rules, so the build went ahead.

## DONE / NOT DONE

| Item | Status | Command and output |
| --- | --- | --- |
| Sentence appended to line 5, one line, after one space | DONE | `cat -n docs/faq.md` line 5 ends with: `The command `sh tests/guide.test.sh` checks that the first line of the guide is a title and that no line of it holds a tab.` |
| Case: command named once | DONE | `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` printed `1` |
| Case: two questions | DONE | `grep -c '^## .*?$' docs/faq.md` printed `2` |
| Case: nine lines | DONE | `wc -l < docs/faq.md` printed `9` |
| Case: sentence says what the script checks | DONE | Read against `tests/guide.test.sh` lines 1-15: title (first line starts with a hash and a space) and no tab on any line. `sh tests/guide.test.sh 2>&1 \| tail -1` printed `PASS: docs/guide.md` |
| Character-set check | DONE | see the line below |

Character-set check (the brief's command over `docs/faq.md` and this report):

    exit 0

The check printed no lines.

## Files with line counts

- `docs/faq.md`: 9 lines (`wc -l`), line 5 changed.
- `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/3-report.md`: this report.

## Judgment calls the brief left open

- Wording of the sentence: "The command `sh tests/guide.test.sh` checks that the first line of the guide is a title and that no line of it holds a tab." It names the command once in backticks and states the two rules of the script's head comment.

## User-visible changes

- `docs/faq.md` line 5, before: `According to its opening paragraph, the guide says how to install the project and how to run it.`
- `docs/faq.md` line 5, after: `According to its opening paragraph, the guide says how to install the project and how to run it. The command `sh tests/guide.test.sh` checks that the first line of the guide is a title and that no line of it holds a tab.`

## Reading of the new sentence against docs/dev/prose-standard.md

No departure. ASCII only (no non-ASCII found by the character-set check); no dash, no semicolon, no filler word of section A, no vague qualifier, no flagged word; active voice; one idea; 24 words, a little over the roughly 20-word guide, because it states both rules of the script in one clause pair, and splitting them would repeat the subject. One paragraph on one line, inline code for the command.

## Wrong or impossible in the brief

Nothing found.
