Everything in the brief is done.

## Open items of the state file (verbatim)

- none.

## The cases' first run (unchanged tree, before any change)

1. Line 3 before the change. Command: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'`. Output as printed: `0`. Matches the brief's expected `0`.
2. Line 3 after the change. Not runnable on the unchanged tree; run after the change, see the table (row 2): `1`.
3. The rest of the guide, before. Command: `sed -n 1,2p docs/guide.md | od -c`. Output as printed:
   ```
   0000000    #       G   u   i   d   e  \n  \n                            
   0000011
   ```
   That is `# Guide`, a newline, and an empty line. Matches the brief. The same command after the change prints the identical two lines of output (see below).

Also read on the unchanged tree: `cat -n docs/guide.md` printed three lines (`# Guide`, a blank line, the two-sentence opening paragraph); `wc -l < docs/guide.md` printed `3`; `ls install.sh` printed `ls: install.sh: No such file or directory`; `ls docs/adr` printed `ls: docs/adr: No such file or directory`. Every premise of the brief held. No case was found that the brief's own rules get wrong.

## DONE / NOT DONE

| # | Item | Command | Output as printed | Status |
|---|------|---------|-------------------|--------|
| 1 | Character-set check over `docs/guide.md` | `printf 'docs/guide.md\0' \| xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit=$?"` | `exit=0` (the check printed no line) | DONE |
| 2 | Line 3 names the command once | `sed -n 3p docs/guide.md \| grep -c 'sh install\.sh'` | `1` | DONE |
| 3 | The file stays three lines | `wc -l < docs/guide.md` | `       3` | DONE |
| 4 | Lines 1 and 2 unchanged | `sed -n 1,2p docs/guide.md \| od -c` | `0000000    #       G   u   i   d   e  \n  \n                            ` and `0000011` | DONE |
| 5 | Sentence read against the prose standard | reading, plus `LC_ALL=C grep -n '[^ -~]' docs/guide.md` (exit 1, no line printed) and `grep -n ' - \|--' docs/guide.md` (exit 1, no line printed) | see the reading below | DONE |

Reading against the prose standard (check 4 of the brief): the new sentence is "Install it with `sh install.sh`." It has five words, under the roughly 20 of section E, and the paragraph's three sentences have 9, 13 and 5 words, so no run of same-length sentences. "it" refers to the project named in the first two sentences, so it is not a cold open. It is active voice, has no filler word, no dash, no semicolon, no arrow, no bold and no rhetorical form. The command is in inline code as section F asks for a literal. The paragraph has three sentences, under the four-sentence limit of section D. The sentence departs from no rule, so there is no departure to name.

## Files with line counts

- `docs/guide.md`: 3 lines (`wc -l < docs/guide.md` printed 3 before and after).
- `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-report.md`: this report.

## Judgment calls

- The brief's check 1 starts with `git ls-files -coz --exclude-standard -- docs/guide.md`. The task prompt forbids every git command, so I fed the same path to the same `perl` check through `printf 'docs/guide.md\0' | xargs -0 perl ...`. The `perl` program is the one in `docs/dev/building.md` unchanged. `git ls-files -co` lists a tracked or untracked file in the worktree, so the set of files checked is the same one file. The reviewer or the landing run can run the brief's literal form.
- The wording "Install it with `sh install.sh`." is the builder's choice within the brief's form (one plain sentence naming the command in backticks as the install command, added at the end of line 3).

## User-visible change

`docs/guide.md` line 3.

Before:
```
This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills.
```

After:
```
This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`.
```

No other file changed. No reference elsewhere needed carrying: the brief's step writes only `docs/guide.md` line 3 and this report, and no ADR touches the step.

## Anything in the brief that was wrong or impossible

Nothing. Every premise was read on the unchanged tree and held. `install.sh` does not exist, as the brief says, so the sentence names a command whose script is not in the repository; the brief states this and rules that the step writes no script.
