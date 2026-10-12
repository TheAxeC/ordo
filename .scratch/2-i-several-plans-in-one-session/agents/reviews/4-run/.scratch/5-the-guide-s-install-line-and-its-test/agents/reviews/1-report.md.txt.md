# Report: step 1, the install sentence in the guide's opening paragraph

Everything in the brief is done.

## Open items of the state file

- none.

## The cases' first run (unchanged tree, before any change)

- The check on line 3 on the unchanged tree. Command: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'`. Output: `0`.
- The same check on the unchanged tree prints `0`. This is the same run as the case above. Output: `0`.
- The opening paragraph stays one line. Command: `wc -l < docs/guide.md`. Output on the unchanged tree: `3`.
- The new sentence, read in place, says that `sh install.sh` installs the project. Checked by reading: on the unchanged tree line 3 (`cat -n docs/guide.md`) holds only `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it.`, so no sentence naming `sh install.sh` exists yet, which matches the brief's premise.
- No case was found wrong under the brief's own rules, so no stop was needed.

Premises also read on the unchanged tree: `ls install.sh` printed `ls: install.sh: No such file or directory`; `ls docs/adr` printed `ls: docs/adr: No such file or directory`.

## DONE / NOT DONE

| Item | Status | Command and output |
| --- | --- | --- |
| Sentence appended to the end of line 3, after a single space | DONE | `cat -n docs/guide.md` line 3: `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it. The command `sh install.sh` installs the project.` |
| Lines 1 and 2 unchanged | DONE | `git diff --stat` printed ` docs/guide.md | 2 +-` (one line replaced, line 3 only) |
| No other file changes | DONE | `git status --short` printed ` M docs/guide.md` |
| Verify 1, character-set check | DONE | see the lines below |
| Verify 2, `sed -n 3p docs/guide.md \| grep -c 'sh install\.sh'` | DONE | printed `1` |
| Verify 3, `wc -l < docs/guide.md` | DONE | printed `3` |
| Verify 4, sentence read against the prose standard | DONE | see the judgment section |

Verify outputs as printed, run from the worktree root:

- Verify 1, the character-set check over `docs/guide.md` and this report (command as in the brief): it printed no line, and the following `echo "exit $?"` printed `exit 0`.
- Verify 2: `1`.
- Verify 3: `3`.

The plan's whole verify list runs once, at landing on main.

## Files with line counts

- `docs/guide.md`: 3 lines (3 before, 3 after).
- `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-report.md`: this report.

## Judgment calls the brief left open

- The wording of the sentence: `The command `sh install.sh` installs the project.` It names the command in backticks and says it installs the project, as the brief asks.
- The new sentence is read against `docs/dev/prose-standard.md`: it is ASCII, uses no dash, contains no word from section A, is 8 words long, is in the active voice and has no semicolon, arrow or bold. It departs from the standard in no place.

## Host- or user-visible changes

- `docs/guide.md` line 3, before: `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it.`
- `docs/guide.md` line 3, after: `This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it. The command `sh install.sh` installs the project.`

## Anything in the brief that was wrong or impossible

- Nothing wrong in the brief. The brief states that no `install.sh` exists at the repository root (confirmed by `ls install.sh` on the unchanged tree) and that no step of the plan writes it, so the guide now names a command whose script is absent from the tree. That is the brief's stated scope and is reported here as a fact for the orchestrator.
