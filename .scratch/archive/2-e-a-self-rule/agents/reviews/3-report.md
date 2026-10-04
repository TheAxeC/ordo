Everything in the brief is done. One verify command cannot print what the brief expects: Verify 3, `grep -rn '/refute, the brief check' skills docs README.md utils .agents`, prints the three lines of item 6 after the change, because the comment text item 6 dictates ("the first run of /refute, the brief check and the lookups of /grill run on") contains that string. The check the grep stands for, that no configuration comment names `/refute` as a whole as running on `reviewer:`, holds: the grep of the three old forms prints nothing after the change (below, and "Anything in the brief that was wrong or impossible").

## Open items of the state file

- none.

## The cases, first run on the unchanged tree

Each case read against the tree as it was before my first change (copies of the changed files taken before any change). No case is one the brief's own rules get wrong, so no hand-back was made.

1. Block `reviewer: claude:opus`, `repair_reviewer: claude:sonnet`, first run on Opus, run over repair round 1 on Sonnet at `reviewer_effort`. First run: `refute` Steps 1 (line 48) dispatches on `reviewer:`, met. Run over round 1: "Steps / Over a repair round" 1 (line 79) says "dispatched as Steps 1 says", so Opus; nothing in `refute` or `plan-orchestration` reads `repair_reviewer:` (the grep in Verify 2 on the unchanged tree prints only the **configuration block** term's two lines). Result: first run met, run over round unmet.
2. Block without `repair_reviewer`, run over a round on the `reviewer:` value. Line 79 gives the `reviewer:` value. Result: met, and the changed text keeps it (the `reviewer:` value when the block has no key).
3. Run over the extra round and a reviewer started over a round in place of one stopped for another model, both on `repair_reviewer:`. Both run on `reviewer:` (line 79 and Steps 1's stopped-reviewer records at lines 54-56). Result: unmet.
4. `repair_reviewer: claude:sonnet` with `refute_after_repair: no`: "Steps / Over a repair round" 8 (line 92) says "these runs do not happen" and the orchestrator's read of the delta stands, so the key is unused. Result: met.
5. Run over a round served Opus under `repair_reviewer: claude:sonnet`: the Stops row "A model other than the configured one" (line 161) shows "the configured value", which is `reviewer:`'s, so it shows `claude:opus`. Result: unmet.
6. First run served Sonnet under `reviewer: claude:opus`: the same stop, showing `claude:opus`. Result: met.
7. Brief-check agent and `grill`'s lookup agents on Opus under `reviewer: claude:opus` and `repair_reviewer: claude:sonnet`; the **brief check** term and `plan-orchestration`'s **Brief-check agent** bullet name `reviewer:`. `spec` line 244 and `grill` line 189 run on `reviewer:`, met. The term (`plan-terms.md:12`, `glossary.md:17`) and the bullet (`plan-orchestration` line 139) say "on the reviewer's model" and do not name `reviewer:`. Result: agents met, the two texts unmet.
8. `plan-orchestration` Steps 8 and "The two tiers, and the models" read alone tell which model the run over a round takes, with the rule in one place. Steps 8 line 112 says only "a fresh reviewer"; the **Reviewer** bullet (line 138) names `reviewer:` for every run. Result: unmet.
9. Brief giving, after a colon and unquoted, a sentence holding three list items in paragraph form: the report lists it under `## 8. Dictated text` with the prose standard's "D. Structure" rule. Item 2 of "Steps / The brief check" (lines 254-262) has no such check, and `brief-check.md` has no `## 8`. Result: unmet.
10. Brief dictating a YAML key with its comment: read whole, comment as prose. No check reads it. Result: unmet.
11. Brief saying only what a sentence must say: not dictated, nothing listed. No check exists, so nothing is listed; the outcome matches by absence, but the rule that says it is not dictated is not in the text. Result: unmet (the rule is absent).
12. Brief dictating the words of a ruling of the user, one word breaking a rule: the stop "A brief check finding the brief cannot absorb". The Stops row exists (`spec` line 289) for "a finding the session cannot close by a change to the brief", but no check produces such a finding for dictated text. Result: unmet.
13. A round's brief giving the builder a sentence word for word: the orchestrator holds it line by line before the round is sent. `plan-orchestration` Steps 8 has no such rule (`grep -n 'dictat' skills/plan-orchestration/SKILL.md` on the unchanged copy prints nothing, exit 1). Result: unmet.
14. Brief dictating no text: the report says so under `## 8. Dictated text`. No heading. Result: unmet.
15. (preserved) The first run's record and the over-round record in `reviewer_report`: `refute` Steps 1 (lines 55-56), Steps 7 (line 73) and "Over a repair round" 6 (line 89) as step 2 wrote them. Result: met.
16. (preserved) `check_config.py` reads `reviewer` as required from `skills/plan/templates/plan.yaml:12`: `example_keys` (line 96) matches `# required.`; the regex of `example_keys`, run in python on the unchanged copy of `skills/plan/templates/plan.yaml`, printed `reviewer read as required.`. Result: met.

## The cases, read after the change

1. Met. `refute` Steps 1 (line 48) first run on `reviewer:`; "Steps / Over a repair round" 1 (lines 79-80) run over a round on `repair_reviewer:` "at the effort `reviewer_effort` names".
2. Met. Line 80: "or the `reviewer:` value when the block has no `repair_reviewer:` key".
3. Met. Line 81: "This holds for every run over a repair round, the run over the extra round of `plan-orchestration`'s exception and a reviewer started over a round in place of one stopped for another model included."
4. Met. Line 94 (was 92), "With `refute_after_repair: no` these runs do not happen", is unchanged and no other text reads `repair_reviewer:`.
5. Met. Steps 1 line 53 says the configured one is "the `reviewer:` model for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives", which under `repair_reviewer: claude:sonnet` is `claude:sonnet`; the Stops row (line 163) shows "the configured model (Steps 1)".
6. Met. Same two places, key `reviewer:`, `claude:opus`.
7. Met. `spec` line 244 and `grill` line 189 are unchanged and name `reviewer`; the **brief check** term (`plan-terms.md:12`, `glossary.md:17`) and `plan-orchestration` line 144 now read "on the model the configuration block's `reviewer:` names".
8. Met. `plan-orchestration` line 114 says the fresh reviewer runs "on the model "The two tiers, and the models" gives the run over a repair round" and does not name the key; lines 140-143 of that section state the rule once.
9. Met. `spec` lines 262-268: a sentence given after a colon is dictated (line 263), each dictated line is read against the rules file and each standards page (line 264), and the report gives the line, its `grep -n` and the rule it breaks with page and section (line 266); the template has `## 8. Dictated text` (line 47); item 4's bullet (line 275) holds the rewrite line by line again and names it under "Closed".
10. Met. `spec` line 265: a code line "(a key with its comment, a command, a placeholder line) is read whole, and its comment and any words in it are read as prose".
11. Met. `spec` line 263: "A requirement that says what a sentence must say without giving its words is not dictated, and stays the builder's to word."
12. Met. `spec` line 268 ends in the stop "A brief check finding the brief cannot absorb" ("Stops"), the row at line 297 whose When cell covers "a finding the session cannot close by a change to the brief".
13. Met. `plan-orchestration` line 101 (Steps 8, **Dictated text**, before **Before the resume**) and line 90 (Steps 6, the cases ruling) hold the text line by line before the round's brief or the ruling is committed.
14. Met. `spec` line 267: "A brief that dictates no text is reported as such"; the template's line 49 ends "Or: the brief dictates no text."
15. Met, unchanged. The `diff -U0` of `skills/refute/SKILL.md` in "Changed lines" holds only the old lines 53, 79 and 161 (and the added lines 80-81), so Steps 1's records (lines 55-56), Steps 7 (line 73) and "Over a repair round" 6 (now line 90) are as step 2 wrote them.
16. Met. The regex of `example_keys` applied to the changed line 12 reads `reviewer` as `required.`, and `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests` in the runner output below.

## DONE / NOT DONE

| # | Item or check | State | Command and output |
|---|---|---|---|
| 1 | Verify 1: the plan's verify list through `checks.sh` | DONE | `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0, the output below |
| 2 | Verify 2: `repair_reviewer` greps | DONE | below |
| 3 | Verify 3: `/refute, the brief check` | DONE for what it stands for, the literal expectation cannot hold | below |
| 4 | Verify 4: `Dictated text` | DONE on the three lines quoted; the brief's "one line for each file" does not hold as written | below: the grep prints two lines for `skills/spec/SKILL.md` (262 and 275), because item 4's new bullet in `spec` "Steps / The brief check" 4 (line 275) names the check |
| 5 | Verify 5: the plan-terms block | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` (also line 7 of the runner output) |
| 6 | Verify 6: no `version:` line changes | DONE | `diff <(grep -rn 'version:' skills/*/SKILL.md | sort) <(sort <the listing of the same grep taken before the first change>) && echo "version lines identical (sorted)"` printed `version lines identical (sorted)`; `refute` 1.7.1, `spec` 1.7.0, `plan-orchestration` 2.10.1 |
| 7 | Verify 7: every changed line before and after, cases first read and read after | DONE | sections "The cases" above and "Changed lines" below |
| 8 | Verify 8: greps of every changed name | DONE | section "Rule 14" below |
| 9 | What to build 1 (`refute`) | DONE | lines 53, 79-81, 163; Rules bullet "The reviewer is a fresh session or agent every time" unchanged |
| 10 | What to build 2 (`plan-orchestration`) | DONE | lines 90, 101, 114, 140-144; Stops row at line 300 unchanged |
| 11 | What to build 3 (`spec`) | DONE | lines 262-268, 275; item 3's "one heading per check of item 2" unchanged at line 270 |
| 12 | What to build 4 (`brief-check.md`) | DONE | lines 47-52, heading block copied from the brief |
| 13 | What to build 5 (the terms) | DONE | `plan-terms.md:12`, `:89`, `glossary.md:17`, `:94`, identical in both files (the block equality is what Verify 5 proves) |
| 14 | What to build 6 (three comments) | DONE | `skills/plan/templates/plan.yaml:12`, `skills/plan/templates/orchestrator-state.md:14`, `.agents/plan.yaml:10`, key, value and comment column unchanged |
| 15 | What to build 7 (no version changes) | DONE | row 6 |

### Verify 1, the lines `checks.sh` printed (exit 0)

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
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

### Verify 2, `grep -n 'repair_reviewer' skills/refute/SKILL.md skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` (lines cut at 150 characters here)

Unchanged tree, run on the copies taken before the first change, paths as in the worktree:

```
docs/glossary.md:29:- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan.yaml` with every key wri
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan
```

After the change:

```
skills/plan-orchestration/SKILL.md:142:  - Each run over a repair round runs on the model the configuration block's `repair_reviewer:` names, or on th
docs/glossary.md:29:- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan.yaml` with every key wri
docs/glossary.md:94:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on th
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan
skills/repo-setup/templates/plan-terms.md:89:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first
skills/refute/SKILL.md:80:   - The model is the one the configuration block's `repair_reviewer:` names, or the `reviewer:` value when the block has no
```

The changed lines of items 1, 2 and 5 are `refute` 80 (line 53 points at "Steps / Over a repair round" 1 and does not name the key), `plan-orchestration` 142 (the Steps 8 sentence names the section and not the key, as item 2 says), and the **reviewer** term at `plan-terms.md:89` and `glossary.md:94`. The **configuration block** term lines (`plan-terms.md:24`, `glossary.md:29`) are the two lines the unchanged tree printed.

### Verify 3, `grep -rn '/refute, the brief check' skills docs README.md utils .agents`

Unchanged tree (three lines, cut at 80 characters, from the copies of the three files):

```
skills/plan/templates/plan.yaml:12:reviewer: claude:opus                     # required. claude:<model> /refute, the brief check and the lookups of /grill run on.
skills/plan/templates/orchestrator-state.md:14:reviewer: claude:<model>     # the model /refute, the brief check and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
.agents/plan.yaml:10:reviewer: claude:opus                     # claude:<model> /refute, the brief check and the lookups of /grill run on.
```

After the change the same grep prints the same three files with the new comments, because the dictated text contains the searched string:

```
skills/plan/templates/plan.yaml:12:reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check and the lookups of /grill run on.
skills/plan/templates/orchestrator-state.md:14:reviewer: claude:<model>     # the model the first run of /refute, the brief check and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
.agents/plan.yaml:10:reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check and the lookups of /grill run on.
```

The three old forms, `grep -rn 'claude:<model> /refute, the brief check\|model /refute, the brief check' skills docs README.md utils .agents`: unchanged tree, three lines:

```
skills/plan/templates/orchestrator-state.md:14:reviewer: claude:<model>     # the model /refute, the brief check and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
skills/plan/templates/plan.yaml:12:reviewer: claude:opus                     # required. claude:<model> /refute, the brief check and the lookups of /grill run on.
.agents/plan.yaml:10:reviewer: claude:opus                     # claude:<model> /refute, the brief check and the lookups of /grill run on.
```

After the change: no output (exit 1).

```

```

### Verify 4, `grep -n 'Dictated text' skills/spec/SKILL.md skills/spec/templates/brief-check.md`

Unchanged tree: no output (exit 1). After the change the grep prints three lines, two for `skills/spec/SKILL.md` and one for the template. The second `spec` line (275) comes from item 4's new bullet in "Steps / The brief check" 4, which names the check, so the brief's "one line for each file" does not hold as written; the check stands on the three lines quoted:

```
skills/spec/templates/brief-check.md:47:## 8. Dictated text
skills/spec/SKILL.md:262:   - **Dictated text.** Every line of text the brief dictates is read line by line.
skills/spec/SKILL.md:275:   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as i
```

## Files changed, with line counts (before to after)

- `skills/refute/SKILL.md`: 185 to 187.
- `skills/plan-orchestration/SKILL.md`: 342 to 347.
- `skills/spec/SKILL.md`: 315 to 323.
- `skills/spec/templates/brief-check.md`: 55 to 62.
- `skills/plan/templates/plan.yaml`: 30 to 30 (line 12).
- `skills/plan/templates/orchestrator-state.md`: 70 to 70 (line 14).
- `.agents/plan.yaml`: 14 to 14 (line 10).
- `skills/repo-setup/templates/plan-terms.md`: 121 to 121 (lines 12 and 89).
- `docs/glossary.md`: 138 to 138 (lines 17 and 94).
- `.scratch/2-e-a-self-rule/agents/reviews/3-report.md`: this report.

## Judgment calls the brief left open

- Item 5, "Stated in" of the **reviewer** term: the brief says `refute`, "Steps / Over a repair round" 1 is added "after `refute`, Steps 1 and Rules". I wrote `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1, the form the **rulings file** term uses (`plan`, "What it reads" 4, Steps 2 and 6, and Stops). Both files carry the same text.
- Item 3, the second sub-bullet is two bullets in the skill (the rule that each dictated line is read against the rules file and the standards pages, and the rule that a code line is read whole with its comment as prose), since the two can each be broken while the other holds (skill-layout, "Lists and tables"). The other sub-bullets follow the brief's list in my own words, since the brief does not dictate them, for example: "The report gives each dictated line with the `grep -n` that finds it in the brief, and with "holds" or each rule it breaks, named with its page and section."
- Item 3's parent bullet: "**Dictated text.** Every line of text the brief dictates is read line by line." The brief gives only the sub-bullets, and the other checks open with a one-sentence rule.
- Item 2's **Reviewer** parent bullet: "**Reviewer.** The model is set per run of `/refute`." The brief gives the three sub-bullets only.
- Item 2's Steps 8 and Steps 6: one bullet in Steps 8 (**Dictated text**, line 101, before **Before the resume**) covers a round's brief and a cases ruling, and Steps 6 names it in one sub-bullet (line 90), placed after the ruling is written and before it is committed, so the hold comes before either commit.
- Item 1, the served-model check: the bullet that states the check (Steps 1, line 53) says the configured one is the `reviewer:` model for the first run and, for a run over a repair round, the model "Steps / Over a repair round" 1 gives, so the model of a run over a round is written once, and the Stops row's "What it shows" cell says "the configured model (Steps 1)".
- "Dictated text" is a phrase `spec` defines in place (item 2, first sub-bullet). `docs/glossary.md` has no entry for it, since no item of the brief adds one (rules file, rule 20). Whether to add the term is the user's call; the **brief check** term's new sentence uses the verb, "each line the brief dictates".

## Host- or user-visible changes, before and after

The text a user or an agent reads changes in the lines below, from `diff -U0` of the copies taken before the first change against the changed files (`-` before, `+` after, one `#####` heading per file). The three configuration comments are the lines a user sees in `plan.yaml` and the state file. The user-visible behaviour: a run of `/refute` over a repair round is dispatched on `repair_reviewer:` (Ordo's `.agents/plan.yaml` sets `claude:sonnet`), the first run stays on `reviewer:`, and the brief check gains a check, `## 8. Dictated text`, in the report.

```
##### skills/refute/SKILL.md
-   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used.
+   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used. The configured one is the `reviewer:` model for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives.
-1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, on a fresh reviewer each time, as Rules 1 says, dispatched as Steps 1 says.
+1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, on a fresh reviewer each time, as Rules 1 says, dispatched as Steps 1 says except for its model.
+   - The model is the one the configuration block's `repair_reviewer:` names, or the `reviewer:` value when the block has no `repair_reviewer:` key, at the effort `reviewer_effort` names.
+   - This holds for every run over a repair round, the run over the extra round of `plan-orchestration`'s exception and a reviewer started over a round in place of one stopped for another model included.
-| A model other than the configured one | The runner served the reviewer a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list (Steps 1) | The open item, booked in the open items, with the configured value, the served model and the Claude Code version | The user's ruling, then `/refute` again |
+| A model other than the configured one | The runner served the reviewer a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list (Steps 1) | The open item, booked in the open items, with the configured model (Steps 1), the served model and the Claude Code version | The user's ruling, then `/refute` again |
##### skills/plan-orchestration/SKILL.md
+     - Hold the text the ruling gives the builder word for word as Steps 8's **Dictated text** says, before it is committed.
+   - **Dictated text.** Text a round's brief or a cases ruling gives the builder word for word is held line by line before the round's brief or the ruling is committed, as the `spec` skill's "Steps / The brief check" 2 **Dictated text** holds a brief's, since the brief check never reads those files.
-     - When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its run recorded under `reviewer_report` beside the first as the `refute` skill's "Steps / Over a repair round" 6 says.
+     - When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer on the model "The two tiers, and the models" gives the run over a repair round, its run recorded under `reviewer_report` beside the first as the `refute` skill's "Steps / Over a repair round" 6 says.
-- **Reviewer.** The model the configuration block's `reviewer:` names, at the effort `reviewer_effort` names, launched as the `refute` and `spec` skills say.
-- **Brief-check agent.** One per step, in the `/spec` run that first reaches the `spec` skill's "Steps / The brief check", read-only, on the reviewer's model, at the effort `reviewer_effort` names, launched as the `refute` and `spec` skills say.
+- **Reviewer.** The model is set per run of `/refute`.
+  - The first run of a step runs on the model the configuration block's `reviewer:` names.
+  - Each run over a repair round runs on the model the configuration block's `repair_reviewer:` names, or on the `reviewer:` value when the block has no `repair_reviewer:` key.
+  - Every run is at the effort `reviewer_effort` names, launched as the `refute` and `spec` skills say.
+- **Brief-check agent.** One per step, in the `/spec` run that first reaches the `spec` skill's "Steps / The brief check", read-only, on the model the configuration block's `reviewer:` names, at the effort `reviewer_effort` names, launched as the `refute` and `spec` skills say.
##### skills/spec/SKILL.md
+   - **Dictated text.** Every line of text the brief dictates is read line by line.
+     - What is dictated is text whose words the brief gives for a file, whether quoted, in a fenced block, or given after a colon as the words of a named sentence, line, heading, comment, table row or term. A requirement that says what a sentence must say without giving its words is not dictated, and stays the builder's to word.
+     - Each dictated line is read against the rules file and each standards page the configuration names.
+     - A code line (a key with its comment, a command, a placeholder line) is read whole, and its comment and any words in it are read as prose.
+     - The report gives each dictated line with the `grep -n` that finds it in the brief, and with "holds" or each rule it breaks, named with its page and section.
+     - A brief that dictates no text is reported as such.
+     - A dictated line whose words a ruling of the user fixes, and which breaks a rule, is a finding the session cannot close by a change to the brief, so it is the stop "A brief check finding the brief cannot absorb" ("Stops").
+   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's **Dictated text** says before the preparation commit, and is named under "Closed".
##### skills/spec/templates/brief-check.md
+## 8. Dictated text
+
+- <each line the brief dictates, quoted>: `<the grep -n that finds it in the brief>`; holds, or each rule it breaks, named with its page and section. Or: the brief dictates no text.
+
+Findings: <each line that breaks a rule, with the rules it breaks>. Or: none.
+
-## Closed (the session's change to the brief for every finding above, made before the preparation commit)
+## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)
+- <a dictated line added after the check, quoted>: holds, or each rule it broke and the rewrite that closed it.
##### skills/plan/templates/plan.yaml
-reviewer: claude:opus                     # required. claude:<model> /refute, the brief check and the lookups of /grill run on.
+reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check and the lookups of /grill run on.
##### skills/plan/templates/orchestrator-state.md
-reviewer: claude:<model>     # the model /refute, the brief check and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
+reviewer: claude:<model>     # the model the first run of /refute, the brief check and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
##### .agents/plan.yaml
-reviewer: claude:opus                     # claude:<model> /refute, the brief check and the lookups of /grill run on.
+reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check and the lookups of /grill run on.
##### skills/repo-setup/templates/plan-terms.md
-- **brief check**: the check of a brief against the tree, made once per step, by one fresh read-only agent on the reviewer's model, the brief-check agent, whose report is saved at `agents/reviews/<step>-brief-check.md`. Stated in: `spec`, Steps 5 and "Steps / The brief check".
+- **brief check**: the check of a brief against the tree, made once per step, by one fresh read-only agent on the model the configuration block's `reviewer:` names, the brief-check agent, whose report is saved at `agents/reviews/<step>-brief-check.md`. It also holds each line the brief dictates to the rules file and the standards pages. Stated in: `spec`, Steps 5 and "Steps / The brief check".
-- **reviewer**: the fresh session or agent that refutes a built step without changing anything, on the model the configuration block's `reviewer:` names, which the brief-check agent and the lookup agents of `grill` also run on. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
+- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` names, and each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent and the lookup agents of `grill` run on `reviewer:`. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
##### docs/glossary.md
-- **brief check**: the check of a brief against the tree, made once per step, by one fresh read-only agent on the reviewer's model, the brief-check agent, whose report is saved at `agents/reviews/<step>-brief-check.md`. Stated in: `spec`, Steps 5 and "Steps / The brief check".
+- **brief check**: the check of a brief against the tree, made once per step, by one fresh read-only agent on the model the configuration block's `reviewer:` names, the brief-check agent, whose report is saved at `agents/reviews/<step>-brief-check.md`. It also holds each line the brief dictates to the rules file and the standards pages. Stated in: `spec`, Steps 5 and "Steps / The brief check".
-- **reviewer**: the fresh session or agent that refutes a built step without changing anything, on the model the configuration block's `reviewer:` names, which the brief-check agent and the lookup agents of `grill` also run on. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
+- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` names, and each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent and the lookup agents of `grill` run on `reviewer:`. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
```

## Rule 14

Greps run from the worktree's root over `skills/`, `utils/`, `docs/` and `README.md`.

- `grep -rn "reviewer's model" skills utils docs README.md`: no hit (the two old hits, `plan-terms.md:12`, `glossary.md:17` and `plan-orchestration` line 139, are changed).
- `grep -rn 'reviewer:' skills utils docs README.md | grep -v 'reviewer_'`: hits outside the paths are `skills/plan/templates/plan.projects.yaml:14` and `:41` (a key and value with no comment, not made false), `skills/ordo-init/templates/check_config.test.sh:48`, `:305` (keys of scratch configurations, not made false). The other hits are in the paths.
- `grep -rniE 'reviewer.{0,60}model|model.{0,60}reviewer|\breviewer\b.{0,30}(names|value)|`reviewer`' skills utils docs README.md`, hits outside the paths, each read: `skills/ordo-help/SKILL.md:79` ("the reviewer was served a model other than the configured one ... shows the configured value") is true under per-key configured values; `skills/grill/SKILL.md:33`, `:189` ("on the model `reviewer` names"), `:312` are about `grill`'s lookup agents, which stay on `reviewer:`, true; `skills/plan/SKILL.md:102`, `skills/ordo-init/SKILL.md:86`, `:132`, `:133`, `:150`, `skills/ordo-init/templates/check_config.py:12`, `:18`, `:21`, `:134-136`, `check_config.test.sh` hits and `skills/repo-setup/SKILL.md:83` are about the keys and the default of `repair_reviewer`, true; `skills/plan/templates/plan.yaml:30` and `skills/plan/templates/orchestrator-state.md:30` (the `repair_reviewer` comments, the lines item 6 sits beside) say the run over a repair round runs on that key, true and consistent with the new `reviewer` comments; `docs/adr/0007` and `0006`, `0003` and `docs/dev/blind-comparison.md:24` name `reviewer` for other uses, true; `README.md:139` lists required keys, true; `docs/roadmap.md:24-25` states the goal in the words the brief quotes, true.
- `grep -rniE 'brief check|brief-check' skills utils docs README.md` outside the paths: `skills/land/SKILL.md:93`, `:96`, `:100`, `skills/diagnose/SKILL.md:18`, `:42`, `:47`, `:81`, `:170`, `skills/ordo-help/SKILL.md:59-61`, `:74`, `README.md:38`, `skills/plan/templates/plan.md:35`, `skills/plan/templates/orchestrator-state.md:27`, `:34`, `skills/plan/templates/plan.yaml:27`, `docs/figures/gen_figures.py:592` (the stop row's name, which exists), `docs/figures/plan-loop.svg:20`, `docs/roadmap.md:236`. None lists the brief check's checks or names a heading number, so none is made false. `skills/diagnose/SKILL.md:170` ("its fix goes into the brief") holds: a dictated line's finding is closed by a change to the brief.
- `grep -rniE 'seven checks|one heading per check|## 7|Implied inputs' skills utils docs README.md`: the only hits are `spec` and `brief-check.md` themselves (`docs/roadmap.md:91` is an unrelated heading). `spec` line 270 ("one heading per check of item 2") holds: the template has eight headings and item 2 eight checks (Names, The step line, Premises, Cases and checks, The question, Implied inputs, ADRs, Dictated text).
- `grep -rn 'dictat' skills docs README.md utils`: the new hits are in the paths; outside them, `docs/dev/change-standard.md:30` and `skills/repo-setup/templates/docs/dev/change-standard.md:30` (rule 4: "a rewrite of text the brief dictates" is the orchestrator's) and `docs/roadmap.md:24-25` ("text the orchestrator dictated into a brief") use the word in the sense the new text defines, true; `docs/academic-coverage.md:120` ("the decision the contract's failure conditions dictate") is another sense and unaffected.

Sentences about a changed file as a whole, reread after the change:

- `skills/refute/SKILL.md` intro (line 10, "dispatches one reviewer") and Rules 1 (line 181, "a fresh session or agent every time, for the first run and every run over a repair round") hold. The description (line 3) states no model.
- `skills/plan-orchestration/SKILL.md` intro (line 10) and Rules (the bullet "The models it names are those in "The two tiers, and the models"", line 337) hold. Steps 8's "After each reply" (line 112) is the sentence line 114 sits in.
- `skills/spec/SKILL.md` intro (line 10) and Steps 5 (lines 134 and 136) hold; item 3 (line 270) is read above.
- `skills/spec/templates/brief-check.md` line 3 ("The report of the fresh agent ... on `agents/briefs/<step>.md`") holds.
- `docs/glossary.md` line 3 ("The block below is `skills/repo-setup/templates/plan-terms.md` copied whole") holds: Verify 5 printed `ok: the plan-terms block equals the template`.
- `skills/plan/templates/plan.yaml` line 3 ("An optional key that is missing takes the default its comment gives") holds; `orchestrator-state.md` line 14 says "claude:opus by default" and the default in the template is unchanged.
- The **reviewer** term's "Stated in" list: `refute` Steps 1, Rules and "Steps / Over a repair round" 1 each state the model of a run (lines 48, 53, 79-81 and 181); `plan-orchestration` "The two tiers, and the models" (lines 140-143); `plan-retro`'s introduction and `grill` "Steps / Looking up a fact" are unchanged places the term already named.

## Anything in the brief that was wrong or impossible

- Verify 3 cannot print nothing as written. The comments item 6 dictates for `skills/plan/templates/plan.yaml:12` ("# required. claude:<model> the first run of /refute, the brief check and the lookups of /grill run on."), `skills/plan/templates/orchestrator-state.md:14` and `.agents/plan.yaml:10` each contain the string `/refute, the brief check`, which Verify 3 searches. Evidence: the grep after the change prints the three lines in the Verify 3 section above. The old forms ("claude:<model> /refute, the brief check", "model /refute, the brief check") print three lines before and nothing after, which is the fact Verify 3 was written to show. I copied the three comments word for word, as the brief requires, and did not change them to satisfy the grep.
- No premise of "What is on the tree" is false on the tree: lines 48, 79, 138, 139, 112, 161, 295, 254-262, 263 of the skills, `plan-terms.md:12` and `:89`, `glossary.md:17` and `:94`, the three comment lines, the `reviewer` and `brief check` terms' text and the greps of the brief's premises (`grep -rn 'repair_reviewer' skills/*/SKILL.md`, `grep -rn 'dictat' skills docs/dev`) were reread and match.

## Repair round 1

All four rulings are done. Every command below was run from the worktree's root after the changes.

### Ruling 1, `skills/refute/SKILL.md` line 53 and the Stops row at line 163

Before (line 53):

```
   - A served model that is not the configured one, the model the key the run was dispatched on names (`reviewer:` for the first run, `repair_reviewer:` for each run over a repair round), is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used.
```

After (line 53, word for word as ruled):

```
   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used. The configured one is the `reviewer:` model for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives.
```

The Stops row's "What it shows" cell no longer reads true against the new bullet: for a block without `repair_reviewer:` the run over a round is dispatched on the `reviewer:` value, so "the key the run was dispatched on" names no single key. It says "the configured model (Steps 1)" now.

Before (line 163, the cell): `with the configured value of the key the run was dispatched on (Steps 1), the served model and the Claude Code version`

After (line 163, the cell): `with the configured model (Steps 1), the served model and the Claude Code version`

Case read from the two places: a block without `repair_reviewer:`, a run over a round served Opus under `reviewer: claude:opus`. Line 53 gives the configured one for that run as the model "Steps / Over a repair round" 1 gives, and line 80 gives that model as the `reviewer:` value when the block has no `repair_reviewer:` key, so `claude:opus`. The served model is the configured one: no stop. With `repair_reviewer: claude:sonnet` the same run served Opus is the stop, showing `claude:sonnet` as the configured model.

### Ruling 2, `skills/plan-orchestration/SKILL.md`, the **Dictated text** bullet of Steps 8

The bullet moved from after **Only known fixes** (old line 110) to between **How** and **Before the resume** (line 101), and its timing is "before the round's brief or the ruling is committed", the time Steps 6 (line 90) gives a cases ruling.

Before (old line 110, after **Only known fixes**):

```
   - **Dictated text.** Text a round's brief or a cases ruling gives the builder word for word is held line by line before the round or the ruling is sent, as the `spec` skill's "Steps / The brief check" 2 **Dictated text** holds a brief's, since the brief check never reads those files.
```

After (line 101, before **Before the resume.**):

```
   - **Dictated text.** Text a round's brief or a cases ruling gives the builder word for word is held line by line before the round's brief or the ruling is committed, as the `spec` skill's "Steps / The brief check" 2 **Dictated text** holds a brief's, since the brief check never reads those files.
```

The order of Steps 8's bullets is now How, Dictated text, Before the resume, Only known fixes, Not sent back, After each reply.

### Ruling 3, `skills/spec/templates/brief-check.md`, the "Closed" heading and its bullets

Before (lines 59 and 61):

```
## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- <finding>: <the change to the brief, with its section>; or a stop, <the open item as the state file holds it>.
```

After (lines 59, 61 and 62, the heading and the second bullet word for word as ruled):

```
## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- <finding>: <the change to the brief, with its section>; or a stop, <the open item as the state file holds it>.
- <a dictated line added after the check, quoted>: holds, or each rule it broke and the rewrite that closed it.
```

The file is 62 lines (61 before this round).

### Ruling 4, the report's row and section for verify 4

The first report's DONE / NOT DONE row 4 now reads `DONE on the three lines quoted; the brief's "one line for each file" does not hold as written`, and its Verify 4 section says that the grep prints two lines for `skills/spec/SKILL.md` (262 and 275), that the second comes from item 4's new bullet in `spec` "Steps / The brief check" 4, which names the check, and that the check stands on the three lines quoted. The earlier sections of this report are updated to the tree as it stands: the cases 5 and 13, the judgment calls on Steps 8 and on line 53, the Verify 2 listing and the "Changed lines" block.

### Checks after the round

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0:

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
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

Verify 2, `grep -n 'repair_reviewer' skills/refute/SKILL.md skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` (lines cut at 150 characters here). `refute` line 53 no longer names the key, so the grep prints the changed lines of items 1 (line 80), 2 (line 142) and 5 (the **reviewer** term) and the **configuration block** term's two lines:

```
skills/refute/SKILL.md:80:   - The model is the one the configuration block's `repair_reviewer:` names, or the `reviewer:` value when the block has no
skills/plan-orchestration/SKILL.md:142:  - Each run over a repair round runs on the model the configuration block's `repair_reviewer:` names, or on th
docs/glossary.md:29:- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan.yaml` with every key wri
docs/glossary.md:94:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on th
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan
skills/repo-setup/templates/plan-terms.md:89:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first
```

Verify 3, the old forms `grep -rn 'claude:<model> /refute, the brief check\|model /refute, the brief check' skills docs README.md utils .agents`: no output, exit 1. The literal `grep -rn '/refute, the brief check' skills docs README.md utils .agents` prints the three item-6 lines, as the first report says.

Verify 4, `grep -n 'Dictated text' skills/spec/SKILL.md skills/spec/templates/brief-check.md`:

```
skills/spec/SKILL.md:262:   - **Dictated text.** Every line of text the brief dictates is read line by line.
skills/spec/SKILL.md:275:   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's **Dictated text** says before the preparation commit, and is named under "Closed".
skills/spec/templates/brief-check.md:47:## 8. Dictated text
```

Verify 5 and 6: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`; the sorted `grep -rn 'version:' skills/*/SKILL.md` is identical to the listing taken before the first change.

ASCII: `LC_ALL=C grep -n '[^ -~]'` over the nine changed files and this report printed nothing (exit 1); the last command of the runner output above is the ASCII check over every tracked and untracked file.

Rule 14 for this round:

- `grep -rn "before the round or the ruling is sent\|the key the run was dispatched on" skills docs README.md utils` prints nothing, so no text still says the old timing or the old key phrase.
- `docs/glossary.md` and `plan-terms.md`, the **Closed** term ("in a brief-check report the change to the brief that closed it"), is outside the step's paths and does not list the dictated line added after the check that the template's "Closed" now holds. It is not false; `spec` line 275 and the template name that entry, and the term is one for the user to widen if wanted, since no item of the brief or of this round changes it.

## Landing note

- The "Rule 14 for this round" bullet calls the **Closed** term outside the step's paths. It is not: `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` are in the brief's paths. The term was changed at landing.
