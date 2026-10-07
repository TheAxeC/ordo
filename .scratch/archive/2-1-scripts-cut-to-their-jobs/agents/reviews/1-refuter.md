# Step 1 refuter report (on .agents/worktrees/2-1-1, base 2931191)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

The brief's verify item 1 is run from the worktree's root as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md`. The `env -u` prefix is the state file's standing demand for tests that touch skill folders. The exit status was 0.

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 12 commands passed
```

These are the commands the report quotes as evidence, rerun in the worktree, with what each printed:

```
C1 after: grep -n 'handles a case only when' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md
docs/dev/change-standard.md:21:- A script handles a case only when that case has happened or when a wrong answer on it costs something. No brief, case or review finding adds a case on other grounds.
skills/repo-setup/templates/docs/dev/change-standard.md:21:- Code handles a case only when that case has happened or when a wrong answer on it costs something. No brief, case or review finding adds a case on other grounds.
C1 on the base (git show 2931191:<file> | grep -n ...): nothing, exit 1 for each file
C4 after: grep -n 'small text step' docs/glossary.md skills/repo-setup/templates/plan-terms.md
  docs/glossary.md lines 18, 43, 99, 102, 119; plan-terms.md lines 13, 38, 94, 97, 114 (the new entry at 119 and 114)
C4 on the base: nothing, exit 1 for each file
C7: ok: the plan-terms block equals the template
C8: grep -m1 -n 'version' skills/{spec,refute,plan-orchestration,land,diagnose,repo-setup,ordo-help,plan}/SKILL.md
  4.0.0, 3.0.0, 4.0.0, 2.0.0, 2.0.0, 3.0.0, 3.0.0, 3.0.0 (base: 3.0.0, 2.0.0, 3.1.0, 1.10.0, 1.2.0, 2.1.0, 2.1.0, 2.1.0)
Description lengths (skill-layout "Frontmatter" command): spec 1003, refute 989; every skill at most 1022
C6 grep: grep -rn -E 'once per step|one brief check|brief check per step' skills utils docs README.md
  skills/refute/SKILL.md:3 (description), skills/refute/SKILL.md:48 (Steps 1), skills/plan-orchestration/SKILL.md:418 ("a full step gets one brief check")
Rule 14 greps: 'worktree and then main|again on main|run in the worktree', 'rule on edges|Edges whose|colliding|concurrent path', 'Verification runs the verify list|A step.s verification runs': each printed nothing, exit 1
git diff --numstat 2931191 and wc -l: every +/- count and file length in the report's "The files with line counts" reproduced exactly
LC_ALL=C grep -n '[^ -~]' over the 16 changed files and the report: nothing, exit 1
"The terms" line numbers (spec 128/182/212, refute 49/104/119/167, plan-orchestration 114/121/123/247/419, land 66/69/99, diagnose 202, ordo-help 67/76): reproduced by grep -rn 'small text step\|full step' skills/*/SKILL.md
Outside-path sentences the report names: skills/plan/SKILL.md:41, skills/ordo-init/SKILL.md:73, skills/plan-retro/SKILL.md:85 hold "the commands every step runs" as quoted; shared-rules.md line 15 holds no case rule (grep -c 'handles a case' prints 0)
```

The report also says the runner was run three times. A rerun cannot reproduce that, and no decision rests on it.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. Both bullets sit word for word right after the test bullet, at line 21 of each copy (C1 rerun).
- 2: holds. Rule 15 in both copies has no list of forms, no "empty, duplicated and colliding" and no concurrent paths, and it keeps the untrusted-value clause and "each such place is a case" (read at docs/dev/change-standard.md:47 and the template's line 47).
- 3: holds. Rule 6 and the runner sentence of both copies say the checks of the changed files and the character-set check run before landing, and the whole list runs once at landing on main (docs/dev/change-standard.md:33 and :82; the template's :33 and :70).
- 4: holds. The entry appears in both files with the dictated content and "Every other step is a full step". Whether it was written first is under "Declined to judge".
- 5: holds. The size line is word for word at brief.md:3. The "Cases" placeholders are changed and the script-input placeholder is removed. "Verify before you report" item 1 and the Report part are rewritten. The form of the implied-input qualifier is Standards 3.
- 6: holds. brief-check.md "6. Implied inputs" carries the condition "that has happened or whose wrong answer would cost something".
- 7: holds. The changes are in spec SKILL.md: the size line, the checks and the "Cases" bullets in Steps 4; "A small text step gets no brief check" in Steps 5; the two sub-bullets and "once per full step" in "The brief check" 2 and 4; `brief_check: none, a small text step` in Steps 9.
- 8: holds. refute SKILL.md has Steps 3, the Standards bullet "code larger than its job", the Spec bullet on the size line, and the single run for a small text step in Steps 1 and "Finding dispositions". The Quick start line this makes false is Standards 1.
- 9: holds. plan-orchestration has "The prompt", Steps 7, Steps 8 "A small text step." and the Rules count. The duplicate statement is Standards 4.
- 10: holds. land Steps 6 adds two bullets (the whole list on main, and the fix at landing), and Steps 9 adds the bullet on `none, a small text step`.
- 11: holds. diagnose Steps 20 has the full-step qualifier and the small-text-step bullet. The brief placed this text at Steps 17 to 19 (Spec 1).
- 12: holds. The ordo-help sequence lines 67 and 76 and README lines 38 and 43 are changed.
- 13: holds. orchestrator-state.md changes the `verify:` comment, the `dispatch:` comment and "Verification, every step". The prose of the last one is Standards 5.
- 14: holds. **brief check**, **repair round** and **verify list** are changed in both files, and C7 prints ok.
- 15: holds. All eight versions match the brief (C8 rerun).
- 16: violated. Two kinds of sentence that the diff makes false are left: the refute Quick start line and the README refute row inside the paths (Standards 1), and the figure label for `/spec` outside the paths, which the report does not name (Standards 2).

Cases of the brief's "Cases":

- C1: met (rerun, after and on the base).
- C2: met (reading of rule 15 in both copies).
- C3: met (reading of rule 6 and the runner sentences).
- C4: met (grep rerun; the three entries read after the change).
- C5: met (reading of brief.md and brief-check.md).
- C6: partial. skills/refute/SKILL.md:15, a file under "Paths this step writes", still tells the reviewer it "reruns every check" (Standards 1).
- C7: met (rerun prints `ok: the plan-terms block equals the template`).
- C8: met (rerun).

## 1. Spec

- Brief "What is on the tree", the `skills/diagnose/SKILL.md` premise: "`skills/diagnose/SKILL.md` (version 1.2.0), Steps 17 to 19 (the hand-over of a fix)".
  - What is wrong: on the base, `git show 2931191:skills/diagnose/SKILL.md | grep -n -E '^1[6-9]\. |^2[0-2]\. '` shows that Steps 17 to 19 are the run of the test, the fix and the rerun. The hand-over is Steps 20 ("20. Inside a plan, hand the fix over by where the defect was found."). The builder changed Steps 20 correctly. Its report says "Nothing in the brief was impossible" and does not report the wrong premise, as rule 4 of the rules file asks.
  - Failure scenario: `/land` Steps 9 books "every premise correction" from the report, so this one goes unbooked. A reader of the brief who looks up diagnose Steps 17 to 19 finds the test steps instead of the hand-over.
  - Verdict: none (item 11 holds).

## 2. Proof

none

## 3. Standards

1. skills/refute/SKILL.md:15 (Quick start) and README.md:19 (the `refute` row of the skills table).
   - The quoted hunks: "/refute <entry> <step>   a fresh reviewer reads the step's diff, reruns every check and every quoted command, and writes verdicts and findings" and "| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, ...".
   - What is wrong: the rules file's rule 14 and the Standards bullet "a sentence ... that the diff makes false" both apply. After the diff, refute Steps 3 has the reviewer run only the checks the brief's "Verify before you report" names, and rule 6 says the whole list runs once at landing on main. "Reruns every check" now says the opposite. Neither line was changed, although both files are under "Paths this step writes".
   - The refute description at skills/refute/SKILL.md:3 ("reruns every verification command") and "Over a repair round" 5 ("It reruns every verification command again") now have two readings. In `land`, "the verification commands" means the plan's verify list.
   - Failure scenario: a reviewer or orchestrator who reads the Quick start or the README runs the whole verify list in the worktree before landing, which is the cost this step exists to remove.
   - Verdict: item 16 violated; case C6 partial.
2. docs/figures/gen_figures.py:584 (rendered in docs/figures/plan-loop.svg).
   - The quoted hunk: "Writes the brief, has a fresh agent check it against the tree, makes the worktree."
   - What is wrong: this is the `/spec` box label of the plan-loop figure. It says every `/spec` run has a fresh agent check the brief, and after the diff a small text step gets no brief check. The diff qualified the same sentence in README.md:38 and in the ordo-help sequence, and the figure label states the same claim.
   - The file is under `docs/`, outside "Paths this step writes". Brief item 16 asks for such a sentence to be named in the report, and the report does not name it.
   - docs/dev/building.md says a change to the sequence changes the labels in that script, which is then run again.
   - Failure scenario: a reader of the figure on the docs page expects a brief-check report for every step, and looks for a missing `agents/reviews/<step>-brief-check.md` for a small text step.
   - Verdict: item 16 violated.
3. skills/spec/templates/brief.md:28-29 ("Cases").
   - The quoted hunk: "- <for a code step (a script, or a product's code), each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path), with its expected result>." followed by the sub-bullet "  - <only an input that has happened or whose wrong answer would cost something, as the rules file's case rule says>."
   - What is wrong: docs/dev/skill-layout.md "Lists and tables" says a qualifier that changes the rule stays in the same bullet as the rule. On the base the cost condition was in the same bullet. The diff moved it into a child bullet, while the parent still lists the forms of input that rule 15 no longer weighs.
   - brief-check.md section 6 still finds implied inputs "in the forms `templates/brief.md`'s "Cases" names".
   - Failure scenario: a `/spec` session that fills the parent placeholder writes cases for a missing file, an empty value and a path with a space in a script that has never met them. That is the case-hunting that item 1's rule and the rewritten rule 15 remove.
   - Verdict: none (item 5's text is met).
4. skills/plan-orchestration/SKILL.md:114 (Steps 7) with :247 ("The review, earned"), and skills/refute/SKILL.md:49 (Steps 1) with :104 ("Over a repair round" 9).
   - The quoted hunks: "A small text step is reviewed once under `every` and `earned` alike." and "A small text step is reviewed once whatever the record says."; "A small text step gets this one run, whatever the configuration block's `review:` says, and no run over a repair round." and "9. A small text step has no repair round, so none of these runs happens for it (Steps 1)."
   - What is wrong: docs/dev/skill-layout.md "Where a rule goes" says a rule is written once and another place names its section. Its Anti-patterns row covers "The same rule written in two sections". Each pair states one rule twice inside one skill. Refute "Over a repair round" 9 is also a statement in a numbered list of actions ("Sections, in order", row 5).
   - The Steps 1 bullet joins two requirements: one run whatever `review:` says, and no run over a repair round. Each can be broken while the other holds ("Lists and tables", first bullet).
   - Failure scenario: a later edit to one copy (for example, a small text step reviewed under `earned` only on a public surface) leaves the other copy saying the old rule, and the orchestrator follows whichever copy it reads first.
   - Verdict: none.
5. skills/plan/templates/orchestrator-state.md:56 ("Verification, every step").
   - The quoted hunk: "The `verify` list above runs through ... once, at landing. The builder and the reviewer run the checks the brief names for the files the step changes before landing. It prints `$ <command>` ..."
   - What is wrong: the prose standard, E, "Cold opens" applies. The inserted sentence puts "The builder and the reviewer" and "the brief" between `checks.sh` and the "It" that refers to it.
   - Failure scenario: an orchestrator reading a new state file takes "It prints `$ <command>` ... checks: <n> commands passed" as the output form of the builder's checks, and expects a `checks:` count line in a builder's report that runs single commands.
   - Verdict: none.

## 4. Behaviour

none

## Declined to judge

- Whether the **small text step** entry was written into plan-terms.md before the skills used it (item 4, "written first"). The worktree's changes are uncommitted and have no order to read.
- The plan's own state file, `.scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md`, still says the verify commands "run in the worktree and again on main" and "the worktree and then main". The ledger belongs to the orchestrator and is outside the step's paths and item 16's folders.
- Whether `skills/repo-setup/templates/shared-rules.md`'s "Scripts compute facts; judgment is read" paragraph should carry the new case rule, which the report raises. That is the orchestrator's or the user's ruling. No sentence there is made false.
- The wording of rule 15. The brief left it to the builder. Its bold title and its last sentence say the same thing ("is a case"), and no rule of the standards pages is clearly broken by that.
- The tag on main and `utils/pin.sh <tag>`, which are not the builder's under the brief.

Reviewer usage: a36aab8f6d73b9602, claude-opus-5-5, 192454 tokens, 56 tool uses, 8.8 minutes.

## Repair round 1, refuted

```
$ sh skills/land/templates/checks.sh .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md   (from /Users/axelfaes/workspace/ordo/.agents/worktrees/2-1-1; my shell has CLAUDE_CONFIG_DIR set, so it was also run under the state file's env -u prefix; both runs exit 0)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 12 commands passed
```

Commands the round's report quotes, rerun, with what each printed:

```
python3 docs/figures/gen_figures.py   (run on a copy of gen_figures.py in the scratchpad, since the script writes beside itself and I change no file)
wrote scratchpad/fig/pipeline.svg (31539 bytes)
wrote scratchpad/fig/plan-loop.svg (31718 bytes)
exit=0; cmp of both outputs against docs/figures/pipeline.svg and docs/figures/plan-loop.svg in the worktree: identical
git diff --stat -- docs/figures
 docs/figures/gen_figures.py | 2 +-
 docs/figures/plan-loop.svg  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/plan-loop.svg
python3 -c 'import glob,yaml; ...' (skill-layout "Frontmatter" command): refute 989, spec 1003, every skill at most 1022
grep -n -E '^(1[5-9]|2[0-2])\. ' skills/diagnose/SKILL.md: 17 "Run the test on the tree without the fix", 18 "Make the fix at the cause", 19 "Run the test, the red command and the original", 20 "Inside a plan, hand the fix over by where the defect was found."
C1 grep: docs/dev/change-standard.md:21 and skills/repo-setup/templates/docs/dev/change-standard.md:21, the bullet once in each file
C4 grep: docs/glossary.md 18, 43, 99, 102, 119; plan-terms.md 13, 38, 94, 97, 114
C8 grep: 4.0.0, 3.0.0, 4.0.0, 2.0.0, 2.0.0, 3.0.0, 3.0.0, 3.0.0
Rule 14 greps (worktree and then main | again on main | run in the worktree; Edges whose | colliding | concurrent path; Verification runs the verify list | A step.s verification runs): each printed nothing, exit 1
grep -rn -E 'once per step|one brief check|brief check per step' skills utils docs README.md: skills/refute/SKILL.md:3, skills/refute/SKILL.md:48, skills/plan-orchestration/SKILL.md:418
git diff --numstat 2931191 and wc -l over the 18 changed files: every +/- count and length in the report's "The files with line counts" reproduced
LC_ALL=C grep -n '[^ -~]' over the 18 changed files and 1-report.md: nothing, exit 1
```

The report says the runner ran three times, and the second table of its "Repair round 1" part says the verify list was rerun. A rerun cannot reproduce the earlier runs, and no decision rests on them.

### Verdicts

Items of the brief's "What to build", for the whole diff since 2931191:

- 1: holds. Both bullets at line 21 of each copy of the change standard (C1 rerun).
- 2: holds. Rule 15 in both copies has no list of forms, no "empty, duplicated and colliding", no concurrent paths, and keeps the untrusted-value clause (read).
- 3: holds. Rule 6 and the runner sentence of both copies (read at docs/dev/change-standard.md rule 6 and "Commands and their filters").
- 4: holds. The entry is in both files with the dictated content (C4 rerun); whether it was written first is under "Declined to judge".
- 5: holds. brief.md line 3 is the size line word for word; the implied-input placeholder at line 28 is one bullet and equals the text the round dictated; "Verify before you report" item 1 and the Report part follow the item. The form of the "each case checks what the step changes" placeholder is under Standards 2.
- 6: holds. brief-check.md "6. Implied inputs" no longer says "in the forms ... names" and keeps "that has happened or whose wrong answer would cost something".
- 7: holds. spec SKILL.md Steps 4, 5, 9 and "The brief check" 2 and 4 say what the item gives them. The form of two bullets is under Standards 2.
- 8: holds. refute: Steps 3 and "Over a repair round" 5 name the checks the brief's "Verify before you report" names; the Quick start line, the description (989 characters) and the README `refute` row say it; the Spec and Standards bullets are present; Steps 1 holds the small-text-step rule as two bullets (lines 49 and 50) and "Over a repair round" ends at item 8.
- 9: holds. plan-orchestration "The prompt", Steps 7 (line 114), Steps 8, "The review, earned" (line 247, "as Steps 7 says") and Rules (lines 417 to 421).
- 10: holds. land Steps 6 (lines 66 and 69) and Steps 9 (line 99).
- 11: holds. diagnose Steps 20 (lines 199 to 203).
- 12: holds. ordo-help lines 67 and 76, README lines 38 and 43.
- 13: holds. orchestrator-state.md template: the `verify:` and `dispatch:` comments, and "Verification, every step" now reads "It prints ... what the booking quotes." before "The builder and the reviewer run the checks the brief names ...".
- 14: holds. The three entries are changed in both files and C7 prints ok.
- 15: holds (C8 rerun).
- 16: violated, Standards 1. The figure box "close them" still describes a repair round with no qualification, while README line 43 and ordo-help line 76 carry "a small text step has none".

Cases of the brief's "Cases":

- C1: met (rerun).
- C2: met (read).
- C3: met (read).
- C4: met (rerun; the three entries read after the change).
- C5: met (read of brief.md and brief-check.md).
- C6: partial. gen_figures.py, which this round put under the paths, still shows the repair round of "FOR EVERY STEP" with no small-text-step qualifier (Standards 1).
- C7: met (rerun prints `ok: the plan-terms block equals the template`).
- C8: met (rerun).

Closure of the round's six items, each read and rerun:

- Item 1 (the diagnose premise): closed. The report's "Anything in the brief that was wrong or impossible" names Steps 17 to 19 as the brief's premise and Steps 20 as the hand-over, and the quoted grep reproduces.
- Item 2 (refute "reruns every check"): closed. The four places say it; the description is 989 characters. The description and "Over a repair round" 5 name the checks the brief names and omit the words "never the plan's whole verify list", which Steps 3 holds; I count that as the rule written once, not a miss.
- Item 3 (figure label): closed. The label reads "has a fresh agent check a full step's brief"; the script reproduces both figures byte for byte; the diff holds only the two figure files that changed. Remaining figure text is Standards 1.
- Item 4 (implied-input placeholder): closed for the placeholder and for brief-check.md section 6. The same child-bullet form remains in spec SKILL.md (Standards 2).
- Item 5 (one rule stated twice): closed. Steps 7 keeps the sentence and "The review, earned" names it; refute Steps 1 is two bullets and "Over a repair round" 9 is gone.
- Item 6 (state template's "It"): closed.

No finding was closed by removing a check, and I found no fix that reaches beyond its finding (the round's changed places are the eight files the round names plus the report).

### Findings

Spec: none.

Proof: none.

Standards:

1. docs/figures/gen_figures.py:614-616 (the "close them" box of the plan-loop figure, rendered in docs/figures/plan-loop.svg) with the caption at :574.
   - The quoted hunk: "A repair round: fix the findings, rerun, rewrite the report. A finding whose cause is not known goes through /diagnose first." under the caption "FOR EVERY STEP, IN ORDER; RUN BY HAND, YOU TYPE EACH COMMAND OF THE ROW".
   - What is wrong: the same sentence of the sequence is qualified in README.md:43 ("a small text step has none") and skills/ordo-help/SKILL.md:76 by item 12, and the round qualified the /spec box of this figure for the same reason. The "close them" box, and the "/refute over the round" box next to it, say every step has a repair round. Rule 14 of the rules file and Standards bullet "a sentence in a document ... that the diff makes false" apply, and the file is under the round's paths.
   - Failure scenario: a reader of the figure on the docs page expects a repair round for a small text step and looks for round entries in its dispatch block.
   - Verdict: item 16 violated; C6 partial.
   - Size: one label in gen_figures.py and the regenerated plan-loop.svg, so it is small and inside the brief and can be fixed at landing; the box has a width limit that rejected a longer label in the first attempt of the /spec label, so the wording needs to fit.
2. skills/spec/SKILL.md:149, skills/spec/SKILL.md:342 and skills/spec/templates/brief.md:27.
   - The quoted hunks: ":148 'the list also holds the inputs the step's text implies but never states, ...' with the child bullet :149 'Only an input that has happened or whose wrong answer would cost something is listed.'"; ":341 '**Implied inputs.** ... each one missing is named with its expected result.' with the child bullet :342 'An input counts only when it has happened or a wrong answer on it would cost something.'"; "brief.md:26 '<every must-pass and must-refuse example ...>' with the child bullet :27 '<each case checks what the step changes, ...>'".
   - What is wrong: docs/dev/skill-layout.md "Lists and tables" says a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule. The round's item 4 moved the cost condition back into the one bullet in the brief template's placeholder and in brief-check.md. In spec SKILL.md Steps 4 and "The brief check" 2 the condition for implied inputs is still a child bullet under a parent that states the rule without it. In brief.md the sentence that the first placeholder must say (brief item 5) is a child bullet under it.
   - Failure scenario: a `/spec` session or a brief-check agent that works from the parent bullet alone lists or demands implied inputs that have not happened and cost nothing, which is the case-hunting item 1 removes.
   - Verdict: none (items 5 and 7 are met in their text).
3. .scratch/2-1-scripts-cut-to-their-jobs/agents/reviews/1-report.md, "Repair round 1" table, row "3 Standards 2, the figure label".
   - The quoted hunk: "(the longer wording "once per full step" did not fit the box and the script exited 1 with `error: plan-loop.svg: box '/spec': the label 'A step that does not converge' does not fit the box`)".
   - What is wrong: rule 7 of the rules file says the report states the end state only, with no narration of attempts. The parenthetical describes a wording tried and given up. I did not rerun that wording; no decision rests on it.
   - Failure scenario: a reader takes it as a signal that the label change is partial or that a wording the brief asked for was not applied.
   - Verdict: none.

Behaviour: none.

### Declined to judge

- Whether the **small text step** entry was written into plan-terms.md before the skills used it (brief item 4, "written first"). The worktree is uncommitted and has no order to read.
- The plan's own state file, `.scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md`: its `verify` comment and "Verification, every step" still carry the old sentences ("run in the worktree and again on main"). The round's brief names it as the orchestrator's, corrected at landing.
- Whether `skills/repo-setup/templates/shared-rules.md` carries the case rule: raised to the user by the round's brief, not a finding here.
- The wording of rule 15, left to the builder by the brief.
- The report's statements that the runner ran three times and that the earlier parts of the report were updated after the round: the second is reproduced for the line counts, terms and greps, the first cannot be.
- The tag on main and `utils/pin.sh <tag>`, which are not the builder's.

Reviewer usage: a707f6f3bdfff2344, claude-sonnet-5-5, 177472 tokens, 41 tool uses, 9.3 minutes.

## Closed

- First run, Spec 1 (the diagnose premise): closed in repair round 1; the report names the premise.
- First run, Standards 1 (refute's "reruns every check"): closed in repair round 1.
- First run, Standards 2 (the `/spec` figure label): closed in repair round 1.
- First run, Standards 3 (the implied-input placeholder): closed in repair round 1 for `brief.md` and `brief-check.md`; the same form in `skills/spec/SKILL.md` is round 1's Standards 2, fixed at landing.
- First run, Standards 4 (one rule stated twice): closed in repair round 1.
- First run, Standards 5 (the state template's "It"): closed in repair round 1.
- First run, "Declined to judge", the shared rules: raised as Open item B, ruled (a) by the user; step 3 adds the case rule.
- First run and round 1, "Declined to judge", the plan's own state file: its `verify:` comment and "Verification, every step" corrected by the orchestrator at landing.
- Round 1, Standards 1 (the "close them" figure box): fixed at landing; `docs/figures/gen_figures.py` reads "A full step's repair round: ...", and `python3 docs/figures/gen_figures.py` rewrote `docs/figures/plan-loop.svg`.
- Round 1, Standards 2 (the cost condition in a child bullet): fixed at landing; `skills/spec/SKILL.md` Steps 4 and "The brief check" 2 **Implied inputs**, and the first "Cases" placeholder of `skills/spec/templates/brief.md`, each hold the condition in the bullet it qualifies.
- Round 1, Standards 3 (the attempt narrated in the report): fixed at landing; the parenthetical is removed from `1-report.md`.
