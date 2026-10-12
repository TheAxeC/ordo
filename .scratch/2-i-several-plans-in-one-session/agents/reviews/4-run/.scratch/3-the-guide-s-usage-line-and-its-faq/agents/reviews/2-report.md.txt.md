# Report: step 2, the FAQ with two questions about the guide

Everything in the brief is done.

## Open items of the state file

- none.

## The cases' first run (unchanged tree, before any change)

- `head -1 docs/faq.md` printed `head: docs/faq.md: No such file or directory`. This matches the brief's statement for the unchanged tree.
- `grep -c '^## .*?$' docs/faq.md` printed `ugrep: warning: docs/faq.md: No such file or directory`. The file does not exist, so no count is printed.
- Each of the two questions is about the guide and is followed by a paragraph that answers it: read on the unchanged tree, `docs/faq.md` does not exist, so there is no question to read. Not verifiable there.
- `wc -l < docs/faq.md` printed `(eval):1: no such file or directory: docs/faq.md`. The file does not exist, so no count is printed.

`cat -n docs/guide.md` on the unchanged tree printed three lines: `# Guide`, an empty line, and `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it.` No case's rule gave a wrong result on this first run.

## DONE / NOT DONE

| Item | State | Command and output |
| --- | --- | --- |
| `docs/faq.md` exists, line 1 is `# FAQ` | DONE | `head -1 docs/faq.md` printed `# FAQ` |
| Exactly two questions, each `## <question>?` | DONE | `grep -c '^## .*?$' docs/faq.md` printed `2`; `grep -n '^## ' docs/faq.md` printed `3:## What does the guide cover?` and `7:## What does the guide say this project is?` |
| Fewer than 20 lines | DONE | `wc -l < docs/faq.md` printed `       9` |
| Each question is about the guide and is answered by one paragraph of one line | DONE | read in place, see the file text below |
| Character-set check over the changed files | DONE | see the line below |
| Prose standard read per sentence | DONE | see the judgment calls |

The character-set check, run from the worktree root as the brief gives it:

It printed no lines, and the echo printed `exit 0`.

## The file

`docs/faq.md`, 9 lines:

```
# FAQ

## What does the guide cover?

According to its opening paragraph, the guide says how to install the project and how to run it. The guide lists no commands.

## What does the guide say this project is?

The guide calls the project a small scratch repository for trying the plan skills.
```

## Files with line counts

- `docs/faq.md`: 9 lines, new.
- `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md`: this report.

## Judgment calls the brief left open

- The two questions are "What does the guide cover?" and "What does the guide say this project is?". The brief left the choice to the builder; both ask about the guide and are answered from `docs/guide.md` line 3 at the base.
- The first answer says "The guide lists no commands." This states what the guide holds now (three lines, no command), so it names no command the guide lacks.
- Prose standard, read sentence by sentence against sections 0 and A to F: no dash, no filler word from section A, no flagged word, ASCII only, no rule of three, no rhetorical question beyond the headings that the file is made of, one paragraph per source line, one blank line before each heading. No sentence departs from the standard. `LC_ALL=C grep -n '[^ -~]' docs/faq.md` printed nothing and the spaced-dash grep `grep -nE ' - | -- ' docs/faq.md` printed nothing.

## Host- or user-visible changes

- Before: `docs/faq.md` did not exist. After: it exists with the text above.

## Anything in the brief wrong or impossible

Nothing. The tree matched the brief's "What is on the tree": `docs/faq.md` and `docs/adr` absent, `docs/guide.md` three lines.
