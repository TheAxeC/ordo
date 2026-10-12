REFUTER REPORT, step 1 of plan 5 (worktree 5-the-guide-s-install-line-and-its-test-1, base 4bfa048)

## Verification lines (brief "Verify before you report", run from the worktree root)

1. Character-set check over `docs/guide.md` and the report:
   - Command as written in the brief. It printed no line, then `exit 0`.
2. `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` printed `1`.
3. `wc -l < docs/guide.md` printed `       3` (that is 3).
4. The prose-standard read is under "Standards" below.

Other commands:
- `git diff --numstat 4bfa048` printed `1    1    docs/guide.md`. That is 2 lines (1 added, 1 removed), below 20. No script, test or configuration file changed.
- `git status --short` printed ` M docs/guide.md` and `?? .scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-report.md`.
- `LC_ALL=C grep -n '[^ -~]' docs/guide.md` printed nothing (rc 1).
- `ls docs/adr` printed `ls: docs/adr: No such file or directory`, so there is no ADR folder.
- `ls install.sh` printed `ls: install.sh: No such file or directory`.
- `ls tests` printed `No such file or directory`.

Diff hunk (`git diff 4bfa048`):
```
-This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it.
+This project is a small scratch repository for trying the plan skills. Its guide says how to install it and how to run it. The command `sh install.sh` installs the project.
```

## Item verdicts ("What to build")

- Line 3 holds a sentence naming `sh install.sh` as the install command, and the check prints 1: holds. Evidence: the hunk above and verification line 2.
- One sentence appended to the end of line 3 after a single space, paragraph still one line, lines 1 and 2 unchanged: holds. The diff touches line 3 only, `wc -l` prints 3, and `cat -n` shows the sentence on line 3 after one space.
- No other file of the tree changes: holds. `git status --short` shows only `docs/guide.md` plus the report the brief names.
- Command written in backticks as `` `sh install.sh` ``: holds.
- Sentence is plain prose under the prose standard (ASCII, no dash aside, no section A filler): holds. See Standards.

## Case verdicts ("Cases")

- Check on line 3 after the change prints 1: met. I reran it and it printed 1.
- Same check on the unchanged tree prints 0: met. The base line in the diff contains no `sh install.sh`, which matches the report's `0`. I did not run it on the base tree, because my git use is limited to `git diff` and `git status`.
- Paragraph stays one line, `wc -l` prints 3 after the change: met. The run printed 3, and the diff shows a one-line replacement.
- New sentence read in place says `sh install.sh` installs the project: met. The sentence is "The command `sh install.sh` installs the project."

## Spec

None. The one-sentence append matches the brief's shape. No item is marked DONE without a matching diff, and there is no change outside the brief. No dependency was added. The premises in "What is on the tree" that my commands could reach reproduce: 3-line guide, check prints 0 before and 1 after, no `install.sh`, no `docs/adr`. The verify list and `docs/dev/building.md` were not rewritten. I did not check the "read on main at fce74d0" revision label, because my git use is restricted. The base is 4bfa048, and the diff against it shows exactly the one hunk.

## Proof

- Finding P1, non-decisional. Report, Judgment calls: "is 8 words long". `echo 'The command `sh install.sh` installs the project.' | wc -w` prints 7. No decision rests on the count. Under the task rule an unreproduced count that no decision rests on is not a finding on its own. I list it for completeness.
- Every other quoted command (`cat -n docs/guide.md`, `git diff --stat`, `git status --short`, the character-set check, the `sed | grep -c`, `wc -l`, `ls install.sh`, `ls docs/adr`) reproduced as the report claims. The report's `git status --short` line ` M docs/guide.md` was taken before the report existed, so it differs from mine only by the untracked report.

## Standards

- `docs/dev/prose-standard.md`, sections 0 and A-F, checked against the new sentence:
  - ASCII only (grep above).
  - No dash, semicolon, arrow or bold.
  - No section A word.
  - No throat-clearing opener.
  - Active voice, 7 words.
  - The paragraph is 3 sentences, under the 4-sentence limit, with no repeated construction.
  - No violation.
- `docs/dev/change-standard.md`:
  - Rules 7, 12 and 19 (report order and first line, nothing left undone, nothing outside the brief) are met. Report parts are in the order the brief gives, the first line is "Everything in the brief is done", and the state file's open items are quoted ("none").
  - Rule 14 and a grep of `install` across `docs/`: the only hits that bear on the sentence are `docs/guide.md:3` and the roadmap goals of entries 5 and 3. No sentence in any document is made false by the diff.
  - The sentence is compatible with the later regex in `docs/roadmap.md` line 32 for entry 3. `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. '` prints 1, because no full stop falls between `sh install.sh` and the end of the new sentence.
  - The builder ran no state-changing git command. The report quotes only `git diff --stat` and `git status --short`, which the standard allows.
- No finding.

## Behaviour

- Finding B1 (for the orchestrator; the brief dictates it, so it is not a builder fault).
  - Place: `docs/guide.md` line 3, hunk above.
  - What is wrong: the guide now tells a reader that `sh install.sh` installs the project, but `install.sh` does not exist on the tree. `ls install.sh` fails, and `grep -rn 'install\.sh' docs tests .agents/plan.yaml` finds only the roadmap goals of entries 5 and 3, with no step that writes the script.
  - Failure scenario: a reader following the guide runs `sh install.sh` and gets `sh: install.sh: No such file or directory`.
  - What the report does: it states the absence under "Anything in the brief that was wrong or impossible". The same section opens with "Nothing wrong in the brief", which reads as contradictory. The brief records the same absence as in scope ("The step names the command in the guide; it does not write the script"). I raise it only so the orchestrator can rule on it. I judge no builder defect.
- The report states the before and after of line 3 verbatim. No unreported user-visible change.

## Declined to judge

- The "unchanged tree" first-run outputs (`0`, `3`, no `install.sh`, no `docs/adr`). I cannot run them on the base tree, because my git use is limited to `git diff <base>` and `git status --short`. They are consistent with the diff's removed line and with my own `ls` results.
- The `fce74d0` revision named in the brief's tree heading. A `git show` or `git log` is outside what I may run.
- Whether the guide should name a command whose script no step writes. That is a roadmap and design ruling for Axel or the orchestrator (B1).
- The plan's whole verify list at landing. It runs on main, not in this review.

Usage: a5daed14247e301df, claude-sonnet-5-5, 69714 tokens, 8 tool uses, 52 s

## Closed

- P1, the word count "8" in the builder's report: the sentence has 7 words (`wc -w` prints 7). No decision rests on the count; the report is the builder's record and stays as written, and this line records the correct count.
- B1, the guide names `sh install.sh` while no `install.sh` exists: closed with no change. The step's line and the entry's goal ask for the guide to name the command and for nothing more; the brief states that no step writes the script. Writing the script is outside the step's part and outside entry 5's goal, so it is no fix at landing and no step of this plan.
