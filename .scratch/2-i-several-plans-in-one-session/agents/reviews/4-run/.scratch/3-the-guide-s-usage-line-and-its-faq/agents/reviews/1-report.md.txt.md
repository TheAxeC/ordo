Everything in the brief is done.

## Open items of the state file

None. The brief assigns no open items to this step, and no ruling is left for the user.

## First run of the cases, on the unchanged tree

Run before any change.

- Check `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'`: printed `0`, as the brief says for the unchanged tree.
- Install sentence unchanged: `sed -n 3p docs/guide.md | grep -c -F 'The command `sh install.sh` installs the project. '`: printed `0`. The pattern ends in a space that follows the install sentence; on the unchanged tree the sentence ends the line, so no space follows it. The brief gives `1` as the result after the change, so this result agrees with the brief and no rule gave a wrong result.
- Paragraph stays one line: `wc -l < docs/guide.md`: printed `3`.
- The new sentence read in place: read by reading the unchanged tree, no new sentence exists yet; line 3 ends with "The command `sh install.sh` installs the project." and nothing after it.

No case was found that the brief's rules get wrong, so the build went ahead.

## DONE / NOT DONE

| Item | Status | Command and output |
| --- | --- | --- |
| Sentence appended to the end of line 3 of `docs/guide.md`, after a single space | DONE | `cat -n docs/guide.md` line 3: `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it. The command `sh install.sh` installs the project. Once the install has run, the command `sh run.sh <name>` runs the project.` |
| The step's check reads the sentence | DONE | `sed -n 3p docs/guide.md \| grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` printed `1` |
| Install sentence unchanged, followed by a space | DONE | `sed -n 3p docs/guide.md \| grep -c -F 'The command `sh install.sh` installs the project. '` printed `1` |
| Paragraph stays one line, file keeps 3 lines | DONE | `wc -l < docs/guide.md` printed `3` |
| Lines 1 and 2 and the earlier sentences of line 3 unchanged | DONE | `git diff --stat` printed ` docs/guide.md \| 2 +-` and ` 1 file changed, 1 insertion(+), 1 deletion(-)`; the changed line is line 3 and the added text is the one sentence at its end |
| No other file changes | DONE | `git status --short` printed ` M docs/guide.md` and `?? .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md` |
| The sentence does not repeat `sh install.sh` | DONE | `sed -n 3p docs/guide.md \| grep -c 'sh install\.sh'` printed `1`, the one line holding the install sentence's own occurrence |
| Character-set check | DONE | the brief's character-set check over `docs/guide.md` and this report printed no lines, then `exit 0` |
| Prose standard read against the new sentence | DONE | See "Prose standard" below |

## Files

- `docs/guide.md`: 3 lines (3 before the change).
- `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md`: this report.

## Judgment calls the brief left open

- The wording of the sentence: "Once the install has run, the command `sh run.sh <name>` runs the project." It refers to "the install" as the brief suggests, holds no full stop before `sh run.sh <name>`, and does not repeat `sh install.sh`. It mirrors the install sentence's form "The command `...` installs the project."

## Prose standard

The sentence is checked against sections 0 and A to F of `docs/dev/prose-standard.md`. It departs from none of them.

- ASCII only: `LC_ALL=C grep -n '[^ -~]' docs/guide.md` printed nothing (grep exit 1, no match).
- No dash, no semicolon, no arrow, no bold, no filler word from section A, no passive voice, 13 words (`wc -w`).
- The sentence shape "The command `...` does X" appears twice in the paragraph (install, run). The two commands do the same kind of thing, and the brief dictates one sentence after the install sentence, so the parallel form is kept.

## Host- or user-visible changes

`docs/guide.md` line 3, before: ends with "The command `sh install.sh` installs the project."
After: ends with "The command `sh install.sh` installs the project. Once the install has run, the command `sh run.sh <name>` runs the project."

## Wrong or impossible in the brief

Nothing. `run.sh` does not exist on the tree (`ls run.sh` printed `No such file or directory`), as the brief states; the step names the command in the guide and does not write the script. `docs/faq.md` line 5 ("According to its opening paragraph, the guide says how to install the project and how to run it.") stays true and is unchanged.
