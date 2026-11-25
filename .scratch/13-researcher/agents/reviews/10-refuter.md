# Step 10 refuter report (on .agents/worktrees/13-researcher-10, base a2acd99)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' skills/academic/researcher/examples/mid_entry_example.md | xargs -0 perl -CSD -ne '...brief's check 1...'; echo "exit=$?"
exit=0

$ git diff --numstat            (tab written by sed as <tab>)
1<tab>1<tab>skills/academic/researcher/examples/mid_entry_example.md
$ git diff a2acd99 --numstat
1<tab>1<tab>skills/academic/researcher/examples/mid_entry_example.md

$ diff skills/academic/researcher/examples/mid_entry_example.md /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline/examples/mid_entry_example.md | grep -c 'Target journal'
0
(before the change: the base file from `git show a2acd99:skills/academic/researcher/examples/mid_entry_example.md`, saved as a temporary file in the session's scratchpad, diffed against the source, piped through the same grep -c)
2

Commands the builder's report quotes:
$ sed -n '127p' skills/academic/researcher/examples/mid_entry_example.md
Target journal: Computers & Education (SSCI Q1, IF: 12.0)
$ cmp <(sed -n '127p' <copy>) <(sed -n '84p' <source>) && echo "line127==source84"
line127==source84
$ sed -n '/^## Open items/,/^## /p' .scratch/13-researcher/orchestrator-state.md
(the heading, the one paragraph the report quotes, and the next heading; no item)
$ wc -l < skills/academic/researcher/examples/mid_entry_example.md
411
diff output of base copy against source: 416 lines (wc -l), as the report says; after the change: 412 lines.
diff of the before-diff and the after-diff:
120,123d119
< 127c84
< < Target journal: Computers & Education (SSCI Q1)
< ---
< > Target journal: Computers & Education (SSCI Q1, IF: 12.0)

$ git status --short
 M skills/academic/researcher/examples/mid_entry_example.md
?? .scratch/13-researcher/agents/reviews/10-report.md
$ LC_ALL=C grep -n '[^ -~]' <changed file> <builder report>; echo "grep exit=$?"
grep exit=1
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1 (the only item): holds. `git diff a2acd99` changes exactly line 127, `-Target journal: Computers & Education (SSCI Q1)` to `+Target journal: Computers & Education (SSCI Q1, IF: 12.0)`, and numstat gives 1 added and 1 removed in this file only. `cmp` against the source's line 84 is byte-equal, and `od -c` of both lines ends in `1 2 . 0 ) \n`.

Cases of the brief's "Cases":

- Reading line 127 after the change, it equals the source's line 84 byte for byte: met. The `cmp` above printed `line127==source84`, and `od -c` of the two lines is identical.
- After the change, `diff` against the source prints no hunk holding the target-journal line, and every other hunk is unchanged: met. `grep -c 'Target journal'` gives 0 after the change and 2 before. Comparing the before-diff with the after-diff shows only the four lines of the `127c84` hunk removed. No other hunk changed, and their line numbers are the same because the change replaced one line with one line.

## 1. Spec

none. The diff changes one line. The brief's item asks for that line and the source holds it. Under the glossary's entry **small text step**, the size is 2 lines (1 added plus 1 removed, from `git diff --numstat`), under 20, and the diff changes no script, no test and no configuration file. The premises in "What is on the tree" hold: the base line 127 read as the brief quotes it (`git show a2acd99:...`), and the source's line 84 read as quoted (`grep -n 'Target journal'` printed `84:Target journal: Computers & Education (SSCI Q1, IF: 12.0)`). The change brings the copy back to the source's text, so it follows ADR 0052's decision: "The copy differs from the source only in these points". No other ADR governs an example line of the copy.

## 2. Proof

none. Every command the report quotes reproduces: the line, the `cmp`, the numstat, the grep counts 2 and 0, 416 diff lines before, 411 file lines and the empty open items. The report's "Other hunks" row says its comparison left a stray `---` line. That reads as an artefact of the builder's filter, and the reviewer's own comparison of the whole before-diff and after-diff shows only the target-journal hunk gone.

## 3. Standards

none. The character-set check printed `exit=0`. `LC_ALL=C grep -n '[^ -~]'` over the changed file and the builder's report finds nothing. The new line is the source's text verbatim and names nothing private. Grepping the tree for `SSCI Q1`, `IF: 12` and `impact factor` across `skills`, `docs`, `README.md` and `NOTICE.md` finds only line 127 and line 48 of the same file. Line 48 (`Targeting Computers & Education (SSCI Q1).`) matches the source's line 47 on that phrase, so the change makes no sentence false. The `examples/mid_entry_example.md` line of `.scratch/13-researcher/deviations.md` does not mention the target-journal line, so no deviations line is out of date.

## 4. Behaviour

none. The one reader-visible change is line 127 of the example's Reviewer Configuration Card. The report gives it with its before and after.

## Declined to judge

- The worktree holds an untracked copy of `.scratch/13-researcher/agents/reviews/10-report.md`, byte-identical to the main checkout's copy (cmp: same, different inodes). The head comment of `land.sh` says a ledger file left untracked in the worktree is left out of the wip commit and never reaches main. Whether the cherry-pick then lands cleanly beside main's untracked copy is settled only by running the landing (`land.sh`), which is outside a review's read and rerun.
- The brief's check 2 is `git diff --numstat` without the base, and I ran it as written because the brief names it. Nothing is committed in the worktree, and `git diff a2acd99 --numstat` printed the same line.

Reviewer usage: ae0353b7bc8dcad7f, claude-opus-5-5, 83767 tokens, 17 tool uses, 2m 10s.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- No findings: every heading reads none.
