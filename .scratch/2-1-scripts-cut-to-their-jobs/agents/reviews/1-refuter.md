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
