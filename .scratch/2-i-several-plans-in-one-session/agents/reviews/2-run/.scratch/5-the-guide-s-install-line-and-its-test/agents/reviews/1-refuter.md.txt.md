# Step 1 refuter report (on /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2i-run/.agents/worktrees/5-the-guide-s-install-line-and-its-test-1, base b461ff8)

## Verification (rerun by the reviewer)

My rules allow only `git diff` and `git status --short`, so the brief's check 1 was run in the builder's form (the same perl program, fed through `printf ... | xargs -0`), not through `git ls-files`.

```
$ git diff b461ff8
diff --git a/docs/guide.md b/docs/guide.md
index 5774d8a..ddd6825 100644
--- a/docs/guide.md
+++ b/docs/guide.md
@@ -1,3 +1,3 @@
 # Guide
 
-This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills.
+This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`.

$ git diff --stat b461ff8
 docs/guide.md | 1 file changed, 1 insertion(+), 1 deletion(-)

$ git status --short
 M docs/guide.md
?? .scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-report.md

$ printf 'docs/guide.md\0' | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit=$?"
exit=0
(the check printed no line)

$ sed -n 3p docs/guide.md | grep -c 'sh install\.sh'
1

$ wc -l < docs/guide.md
       3

$ sed -n 1,2p docs/guide.md | od -c
0000000    #       G   u   i   d   e  \n  \n
0000011

$ LC_ALL=C grep -n '[^ -~]' docs/guide.md; echo "exit=$?"
exit=1
$ grep -n ' - \|--' docs/guide.md; echo "exit=$?"
exit=1

$ LC_ALL=C grep -n '[^ -~]' <the builder's report>; echo "exit=$?"
exit=1

$ ls install.sh
ls: install.sh: No such file or directory
$ ls docs/adr
ls: docs/adr: No such file or directory
$ ls tests
ls: tests: No such file or directory

$ grep -rn -i 'install' docs (outside the two standards pages)
docs/guide.md:3:... Install it with `sh install.sh`.
docs/roadmap.md:24: (entry 5 goal)   docs/roadmap.md:25: (entry 5 gate)   docs/roadmap.md:31: (entry 3 goal)   docs/roadmap.md:32: (entry 3 gate)

$ printf 'It is a scratch repository for one run of the plan skills.' | wc -w
      12
```

Every command the builder's report quotes was rerun in the same form. All outputs match the report (0 before the change was read from the report and the tree at the base shows the one removed line; 1 after; 3 lines; the od -c output; exit=0 for the character-set check; both grep exits 1; the missing install.sh and docs/adr). The one difference is a word count, under Proof.

## Verdicts

What to build:
- Line 3 of `docs/guide.md` gains one sentence naming `sh install.sh` in backticks as the install command: holds. The diff shows "Install it with `sh install.sh`." appended; `grep -c` prints 1.
- The sentence is added at the end of line 3, the paragraph stays one line, line 3 stays the opening paragraph: holds. `wc -l` prints 3; the diff changes only line 3.
- Lines 1 and 2 unchanged: holds. `od -c` prints `# Guide\n\n`, and the diff shows both as context lines.
- The sentence follows the prose standard (plain, one clause or two, ASCII): holds. Five words, imperative, no dash, no semicolon, no filler, no arrow, ASCII (grep exit 1, perl exit 0). The paragraph has three sentences, within section D's four.
- The guide gains no other line and its two existing sentences are unchanged: holds. The diff has one removed and one added line, the added one beginning with the old text verbatim.

Cases:
- Line 3 after the change prints 1: met (rerun, output 1).
- Line 3 before the change prints 0: met. The base is not checked out in the worktree and I may not check it out; the diff shows the removed line contains no `sh install.sh`, and the builder's first run quotes 0. Not rerun on the base tree itself.
- Lines 1 and 2 before and after: met. After: rerun. Before: the diff leaves both lines as context.
- The builder's first task, the first run of every case on the unchanged tree, before any change: met in the report's "The cases' first run" section, with commands and outputs for the before-cases. The after-case is correctly marked as not runnable on the unchanged tree.

Brief's "Verify before you report" 1-4: all hold (rerun above; check 1 in the builder's form, see Declined to judge). The report's parts and their order match the brief (first line, open items, first run, table, files, judgment calls, user-visible change, wrong or impossible).

## 1. Spec

none. The diff changes only `docs/guide.md` line 3 (the one path the brief lists); no script, test or configuration file is touched; 1 line changed, well under 20; no decision the brief reserved was taken (the wording was left to the builder, as "Decisions taken in this brief" and the report's judgment calls say). Premises of "What is on the tree" reproduce: guide has three lines, install.sh absent, docs/adr absent, building.md's verify command equals the plan's. No ADR exists, so none is contradicted. A "carry to every place" grep for `install` across `docs/` finds only the new sentence and the roadmap entries 5 and 3. Entry 3's gate regex `sh install\.sh[^.]*\. [^.]*sh run\.sh <name>` still matches the new sentence's form (the install sentence ends in `sh install.sh`` followed by a full stop, with no other full stop between), so the next plan's gate is not broken by this wording.

## 2. Proof

none that a decision rests on. One count in the builder's report does not reproduce: it gives the second sentence of the paragraph as 13 words; `wc -w` on it prints 12. No decision rests on it (the sentence-length verdict holds at 12, 9 and 5, all under 20), so it is noted, not a finding. No check was exempted or loosened.

## 3. Standards

none. Rule 7 (report shape), rule 10 (ASCII, no history, no dash), rule 14 (grep across docs: nothing made false; the report states the grep result in words but does not quote a grep command, and the sentence nothing else makes false was confirmed by my grep), rule 19 (nothing outside the brief changed) all hold. The report is ASCII. The guide's own sentence "keeps a short guide and its questions" is not contradicted by the addition.

## 4. Behaviour

none that the report fails to state. The report gives line 3 before and after verbatim. For the reader's information, not a defect of this diff: the guide now tells a reader to run `sh install.sh`, and no `install.sh` exists in the repository (`ls install.sh` prints "No such file or directory"). The brief states this and rules that the step writes no script, and entry 5's gate asks only for the sentence, so a reader who follows the sentence gets that error until an install script exists. Whether a later plan step or entry supplies the script is the orchestrator's to place; nothing in the plan's three steps does.

## Declined to judge

- The brief's check 1 in its literal form (`git ls-files -coz --exclude-standard -- docs/guide.md | xargs -0 perl ...`): my rules bar every git command but `git diff <base>` and `git status --short`. I ran the same perl program on the same file through `printf | xargs -0`, as the builder did (exit 0, no output). The result is the same for this single file; the landing run on main runs the literal form through `checks.sh`.
- The "before" value of line 3 at the base (the 0 count) was not produced by running the command on a checkout of the base, which I may not make; it follows from the diff's removed line and the builder's quoted first run.
- Whether the sentence "Install it with `sh install.sh`." is the wording the user would choose: a style judgment the brief leaves to the builder, read against the prose standard only.

Reviewer usage: a0406117ec1eed592, claude-sonnet-5-5, 68249 tokens, 7 tool uses, 0.9 minutes.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- No finding under the four headings. The note under "4. Behaviour" that no `install.sh` exists is the scope the user ruled for entry 5 (its goal names the command; no step writes the script), and is no finding.
- The word count noted under "2. Proof" (12 words, where the builder's report says 13) carries no decision, as the reviewer says, and is no finding.
