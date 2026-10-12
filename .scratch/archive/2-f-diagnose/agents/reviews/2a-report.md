# Report, step 2a of plan 2.F

Everything in the brief and in repair round 1 is done.

## Open items of the state file, verbatim

- Step 3 reading (2026-09-30): your `/diagnose` run on the scratch copy is booked (`plan.md`, "Step 3, the real run") with its record at `agents/reviews/3-diagnosis.md` and its fix at `agents/reviews/3-diagnose-fix.diff`. The run reached the cause the ledger books for 2.E step 3: the refusal compared the two folders as text. The step's check ends "reviewed by Axel". Options: (a) approve the run as the step's proof, and step 3 is ticked; pro: the record quotes the red command, the two hypotheses, the probes, the fix and four red tests, and the cause matches db9bbec; con: none found. (b) ask for a second run on another defect before the tick; pro: a second case; con: the gate asks for one real run, and step 4 compares on this same defect. Recommendation (a). Neither is the lazy option: (a) is the step's check as written.

## The cases' first run

The unchanged tree has no `person-driven.sh`, so each test case of `person-driven.test.sh` (in its final form) fails on it, run as `sh person-driven.test.sh <case>` with the test file alone in a scratch folder. Each line is the `FAIL:` line printed.

- C1: `FAIL: c1: exit status 127, expected 0`
- C2: `FAIL: c2: exit status 127, expected 0`
- C3: `FAIL: c3: exit status 127, expected 0`
- C4: `FAIL: c4: exit status 127, expected 0`
- C5: `FAIL: c5: exit status 127, expected 1`
- C6: `FAIL: c6: exit status 127, expected 1`
- C7: `FAIL: c7: exit status 127, expected 0`
- C8: `FAIL: c8: exit status 127, expected 0`
- C9: `FAIL: c9 file.txt: exit status 127, expected 64`
- C10: `FAIL: c10 missing.txt: exit status 127, expected 64`
- C11: `FAIL: c11 empty.txt: exit status 127, expected 64`
- C12: `FAIL: c12: exit status 127, expected 64`
- C13: `FAIL: c13: exit status 127, expected 1`
- C14: `FAIL: c14: exit status 127, expected 0`
- C15: `FAIL: c15: exit status 127, expected 0`
- C16: `FAIL: c16: exit status 127, expected 0`
- C17: `FAIL: c17 empty actions path: exit status 127, expected 64`
- C18: `FAIL: c18: exit status 127, expected 64`
- C19: `FAIL: c19 closed: exit status 127, expected 1`
- C20: `FAIL: c20: the second action was never shown`

The reading cases R1 to R5 on the unchanged tree:

- R1: `skills/diagnose/SKILL.md` line 213 (item 11) reads "a script that prints each action for the user to take and reads back what they observed, which is the stop "A red command a person drives"" and names no file; the Stops row of that name (line 223) names no file and no command; `git show HEAD:skills/diagnose/SKILL.md | grep -n 'person-driven\|references/'` printed only line 225, the `references/self-rule.md` of the row "The cause not found".
- R2: `git show HEAD:skills/diagnose/templates/diagnosis.md | grep -n -i 'observ\|person'` printed only line 60 ("none, no person present"); the template has no place for observations.
- R3: `git grep -n 'person-driven' HEAD -- docs/dev` printed nothing.
- R4, each read from `git show HEAD:<file>`: `grep -c 'premise'` on `skills/diagnose/SKILL.md` printed 0; line 133 of `skills/spec/SKILL.md` is the "find why X happens and end it" bullet of Steps 4, which names no command; `grep -n 'premise'` on `skills/ordo-help/SKILL.md` printed only line 82, the word in the `/spec stops` line; line 28 of `skills/plan-orchestration/SKILL.md` lists the finding, red line and brief-check forms and no `premise`; line 119 of `docs/glossary.md` is the Step 0 entry, which names only a red line's cause found by `/diagnose`.
- R5: `git grep -n -i 'diagnosis agent' HEAD -- skills docs README.md` printed nothing; `plan-orchestration` line 125 has the diagnosis probe "read-only on a scratch copy" with no named runner; line 165 names the tiers' agents as the builders, the reviewers and the brief-check agents.

Cases the brief's rules got wrong: none. One case needed a clause the rules do not state, C17 with an empty observations path, which the script meets inside refusal 4 of "What the script must do" 2 (see "Judgment calls", item 1).

## DONE / NOT DONE

| Item | State | Command that proves it, and its output |
|---|---|---|
| 1. `person-driven.sh`, at most 120 lines | DONE | `wc -l skills/diagnose/templates/person-driven.sh` prints 76 |
| 2. `person-driven.test.sh`, one case per C1 to C20 | DONE | `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` prints `PASS: person-driven.sh scratch tests` |
| 3. `references/person-driven.md` | DONE | 20 lines, a title, one sentence and one rule per bullet; `grep -n 'person-driven' skills/diagnose/SKILL.md` prints lines 238 and 248 |
| 4. `diagnose` item 11 and the Stops row | DONE | line 238 names `templates/person-driven.sh` and `references/person-driven.md` and keeps the stop; line 248 shows the actions file and the command, resumed by the user's word that the script has ended, then the observations file read by the skill |
| 5. `diagnosis.md` placeholder and code block | DONE | `grep -n 'red command a person drives\|observations file of each' skills/diagnose/templates/diagnosis.md` prints lines 38 and 41, before line 44 ("Runs after the tightening") |
| 6. building.md and change-standard.md lines | DONE | Verify 5 below |
| 7. The form `premise` (Quick start, "What it reads", Steps 1 to 4, 20, Stops, description, no other sentence false) | DONE | `grep -n 'premise' skills/diagnose/SKILL.md` prints lines 19, 35, 47, 49, 50, 51, 52, 62, 63, 69, 70, 100, 119, 120, 121, 123, 169, 172, 173, 174, 204, 206, 210, 255, 278 and 293; the hits of the grep the brief names are read in "Hits" below |
| 8. `diagnosis.md` for `premise` | DONE | `grep -n 'quotes its part\|premise' skills/diagnose/templates/diagnosis.md` prints lines 3, 9, 96 and 120 |
| 9. `spec`: investigation moved into Steps 2 | DONE | `grep -n 'find why' skills/spec/SKILL.md` prints line 92 (Steps 2); the bullet and its two sub-bullets are gone from Steps 4 |
| 10. `ordo-help` sequence | DONE | `grep -n 'premise' skills/ordo-help/SKILL.md` prints lines 68 and 84 (the `/diagnose <entry> <step> premise` line, and the existing `/spec stops` line); its text is on line 69 from column 31 |
| 11. `plan-orchestration` "Use instead" row | DONE | `grep -n 'premise' skills/plan-orchestration/SKILL.md` prints lines 28, 56, 92 and 362, of which line 28 is the row with `premise` among the forms |
| 12. Glossary entries and terms | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` wrote the block; Verify 3 below |
| 13. The diagnosis agent in a plan | DONE | `diagnose` lines 277 to 294; `plan-orchestration` lines 126, 129, 153, 172, 177 and 367; `spec` lines 64, 70, 93, 103, 162, 164, 349 and 376; `land` lines 96, 104 and 108; the plan templates and the glossary terms as "Files" lists them |
| 14. Version raises | DONE | Verify 10 below |
| 15. `gen_figures.py` | DONE | the `/spec` box lists the stop "A cause not found" and `docs/figures/plan-loop.svg` is written again (Repair round 1, item 6); `grep -n -i diagnos docs/figures/gen_figures.py` prints lines 6, 421, 543, 545, 553, 569, 616 and 622, none of which names a form or a Stops row of `diagnose` that is false |
| 16. Other lines naming the forms or the kinds of agent | DONE | "Hits" below |
| Verify 1, the runner | DONE | quoted below |
| Verify 2 | DONE | `PASS: person-driven.sh scratch tests` |
| Verify 3 | DONE | `ok: the plan-terms block equals the template` |
| Verify 4 | DONE | `LC_ALL=C grep -n '[^ -~]'` over `git diff --name-only` and the untracked files outside `.scratch` printed nothing, exit status 1 (grep's status for no match) |
| Verify 5 | DONE | quoted below |
| Verify 6 | DONE | the walks W1 to W12 and the hits are below, each with its lines as `grep -n` prints them |
| Verify 7 | DONE | quoted below; the largest count is 1022 (`roadmap`, not touched) |
| Verify 8 | DONE | the mutation table below, and check 2 run again after the last mutation |
| Verify 9 | DONE | "Departures from the prose standard" below |
| Verify 10 | DONE | quoted below |

### Verify 1, the lines the runner printed

Run as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md`, exit status 0. The state file of the worktree is the copy at the base, whose verify list does not hold `person-driven.test.sh`, so the runner counts 11 commands.

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
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
checks: 11 commands passed
```

### Verify 2, after the last mutation run

```
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
```

### Verify 5

```
$ grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md
docs/dev/building.md:10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands
docs/dev/building.md-11-sh skills/diagnose/templates/person-driven.test.sh  # person-driven.sh on scratch file
--
docs/dev/change-standard.md:71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
docs/dev/change-standard.md-72-sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
```

### Verify 7

```
965 skills/diagnose/SKILL.md
877 skills/grill/SKILL.md
726 skills/land/SKILL.md
503 skills/ordo-help/SKILL.md
632 skills/ordo-init/SKILL.md
961 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
861 skills/repo-setup/SKILL.md
1022 skills/roadmap/SKILL.md
779 skills/session-retro/SKILL.md
987 skills/spec/SKILL.md
```

### Verify 10

```
$ git diff -U0 -- 'skills/*/SKILL.md' | grep '^[-+]  version'
-  version: "1.1.0"
+  version: "1.2.0"
-  version: "1.9.0"
+  version: "1.10.0"
-  version: "2.0.0"
+  version: "2.1.0"
-  version: "3.0.0"
+  version: "3.1.0"
-  version: "2.0.0"
+  version: "2.1.0"
-  version: "2.0.0"
+  version: "2.1.0"
-  version: "2.0.0"
+  version: "2.1.0"
```

Seven skills are touched (`diagnose`, `land`, `spec`, `ordo-help`, `plan`, `repo-setup`, `plan-orchestration`), and each has one minor raise with the parts after it at 0.

## Mutations

Each mutation was applied to a copy of `person-driven.sh` and run with the final `person-driven.test.sh` as `sh person-driven.test.sh <case>`; every one made its case print a `FAIL:` line (21 FAIL lines for C1 to C20, C19 twice). The temporary paths in the C6 and C19 lines are the ones printed. After the last mutation the unchanged script was run again: `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` prints `PASS: person-driven.sh scratch tests`.

| Behaviour | Case | Mutation of person-driven.sh | FAIL line of `sh person-driven.test.sh <case>` |
|---|---|---|---|
| the output in full, the prompt included | C1 | `(one line) ' "$n" "$m" "$text"` becomes `(one line)' "$n" "$m" "$text"` | `FAIL: c1 standard output: the text differs from the expected one` |
| blank lines and lines of spaces or tabs are no action | C2 | `*[!\ "$tab"]*) m=$((m + 1))` becomes `*) m=$((m + 1))` in the count loop | `FAIL: c2: missing [Action 2 of 2: second]` |
| text with `%s`, a backslash, `$HOME`, a backquote, `*` and end spaces is written byte for byte and nothing runs | C3 | the action line's `%s` for the text becomes the text itself inside the format | `FAIL: c3: the action is not on standard output byte for byte` |
| a path with a space | C4 | `[ -f "$actions" ]` becomes `[ -f $actions ]` | `FAIL: c4: exit status 64, expected 0` |
| input that ends after the first of three observations | C5 | `$((n - 1))` becomes `$n` in the input-ended message | `FAIL: c5: missing the line [person-driven: the input ended after observation 1 of 3]` |
| no observations file when the input ends before the first observation | C6 | `exec 3< "$actions"` becomes `exec 3< "$actions" && : >> "$obs"` | `FAIL: c6: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.YPyn6W/c6/obs.txt exists` |
| an empty or blank observation is asked for again | C7 | the blank-observation `case` branch becomes `*)` | `FAIL: c7: the request to type an observation is not printed twice` |
| a last observation with no newline is kept | C8 | `while IFS= read -r seen \|\| [ -n "$seen" ]` becomes `while IFS= read -r seen` | `FAIL: c8: exit status 1, expected 0` |
| an observations path that is a file, a folder or a dangling link is refused untouched | C9 | `{ [ -e "$obs" ] \|\| [ -L "$obs" ]; } && refuse` becomes `[ -e "$obs" ] && refuse` | `FAIL: c9 link.txt: exit status 0, expected 64` |
| an actions file that is missing, a folder or unreadable is refused | C10 | `[ -f "$actions" ] && [ -r "$actions" ] \|\| refuse` becomes `[ -e "$actions" ] \|\| refuse` | `FAIL: c10 folder: exit status 1, expected 64` |
| an actions file with no action is refused | C11 | `[ "$m" -gt 0 ]` becomes `[ "$m" -ge 0 ]` | `FAIL: c11 empty.txt: exit status 0, expected 64` |
| an observations file in a missing folder is refused before any action is shown | C12 | the line `case $obs in */*) dir=${obs%/*}; dir=${dir:-/} ;; esac` becomes `case $obs in */*) dir=. ;; esac` | `FAIL: c12: exit status 1, expected 64` |
| an append that fails ends the run at once | C13 | the append's `\|\| { say ...; exit 1; }` becomes `\|\| :` | `FAIL: c13: exit status 0, expected 1` |
| a last action with no newline is kept | C14 | `while IFS= read -r text <&3 \|\| [ -n "$text" ]` becomes `while IFS= read -r text <&3` | `FAIL: c14: the text differs from the expected one` |
| a relative path is taken from the folder the script is started in | C15 | `dir=.` becomes `dir=/` | `FAIL: c15: exit status 64, expected 0` |
| a path that starts with a dash is a file name | C16 | the one line `case $obs in */*) dir=${obs%/*}; dir=${dir:-/} ;; esac` becomes `dir=$(dirname "$obs")` | `FAIL: c16: exit status 64, expected 0` |
| an empty path is refused and creates nothing | C17 | the folder test loses `[ -n "$obs" ] &&` | `FAIL: c17 empty observations path: exit status 1, expected 64` |
| a folder that is not writable is refused before any action is shown | C18 | the folder test loses `&& [ -w "$dir" ]` | `FAIL: c18: exit status 1, expected 64` |
| a closed standard output ends the run with no pair | C19 | `\|\| cannot_show` becomes `\|\| :` on the action line | `FAIL: c19 closed: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.9AZ7nS/c19/obs.txt exists` |
| a pipe whose reader has exited ends the run with exit 1 and its message | C19 (pipe) | the line `trap '' PIPE` is removed | `FAIL: c19 pipe: exit status 141, expected 1` |
| the first pair stays whole and the run ends with 143 when TERM arrives while the script waits for an observation; the order of reading the observation and writing the pair | C20 | one line changed: the action line gains `; printf 'Action %s: %s\n' "$n" "$text" 2>/dev/null >> "$obs"`, so the action is appended before its observation is read | `FAIL: c20: the text differs from the expected one` |

The second run of C1 under dash compares standard output whole. Its assertion was run red on a copy of the test whose `sh` standard-output assertion is removed, with the prompt mutation of the C1 row applied to the script: `FAIL: c1 standard output under dash: the text differs from the expected one`.

The rule that each pair is written by one `printf` is checked by reading the script (`grep -n 'Action %s: %s.nObserved' skills/diagnose/templates/person-driven.sh` prints line 74), not by a test: no test can stop the script between two writes of one pair.

## Terms

`python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` wrote `plan-terms.md` into `docs/glossary.md`; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`. The terms were added to `skills/repo-setup/templates/plan-terms.md` first.

| Term | New or changed | A line that uses it | Is the use in its sense |
|---|---|---|---|
| actions file | new | `skills/diagnose/SKILL.md:248`, `skills/diagnose/references/person-driven.md:6` | yes: the file `diagnose` writes for `templates/person-driven.sh` |
| observations file | new | `skills/diagnose/SKILL.md:248`, `skills/diagnose/references/person-driven.md:7`, `skills/diagnose/templates/diagnosis.md:38` | yes: the file the script writes, named `observations-<n>.txt` |
| diagnosis agent | new | `skills/diagnose/SKILL.md:278`, `skills/spec/SKILL.md:93`, `skills/plan-orchestration/SKILL.md:184` | yes: the fresh agent that runs `/diagnose` inside a plan with no person present |
| Agents section | changed | `skills/diagnose/SKILL.md:294`, `skills/land/SKILL.md:103`, `skills/plan/templates/plan.md:36` | yes: the `## Agents` section of `plan.md` |
| dispatch entry | changed | `skills/diagnose/SKILL.md:49`, `skills/plan/templates/orchestrator-state.md:34` | yes: the record of one step in flight in the dispatch block |
| effort agent | changed | `skills/diagnose/SKILL.md:281`, `skills/plan-orchestration/SKILL.md:177` | yes: `ordo-<reviewer_effort>` is one of the agent definitions |
| premise | changed | `skills/spec/SKILL.md:87`, `skills/diagnose/SKILL.md:19` | yes: the `spec` line is the first sense (a claim about the tree checked by a grep or a probe), the `diagnose` line is the second (a claim about behaviour checked with a red command) |
| reviewer | changed | `skills/plan/templates/plan.yaml:12` | yes: the key `reviewer:` names the model; the diagnosis agent is not a reviewer and only takes the model value |
| Step 0 | changed | `skills/diagnose/SKILL.md:204`, `skills/spec/SKILL.md:95` | yes: the place under a step in `plan.md` that holds what the plan carries to the step |
| tiers | changed | `skills/plan-orchestration/SKILL.md:172` | yes: the orchestrator and the agents it starts |

What each changed term says now is in its entry in `docs/glossary.md`: **Agents section** adds the numbered item under "Agents in no role the cost script prices:"; **dispatch entry** adds that a diagnosis agent has no key; **effort agent** and **reviewer** and **tiers** add the diagnosis agent; **premise** adds the second sense, a claim about behaviour checked by `/diagnose <entry> <step> premise`; **Step 0** adds a cause found by `/diagnose` and the cause not found or the false premise a `premise` run ended with.

## Hits

### Hits of item 7's last grep

`grep -n "step's worktree\|dispatch entry\|report\|finding\|the round\|builder" skills/diagnose/SKILL.md` prints 44 lines, each read; the text column is the start of the line.

| Line | Text | Holds for `premise` |
|---|---|---|
| 3 | description: "Find the cause of a defect before changing anything: one command run red on  | holds: the sentence on the hand-over says the fix is handed over by where the defect was found |
| 16 | /diagnose <entry> <step> <finding>         find the cause of a finding of a plan's step, w | holds: names its form |
| 18 | /diagnose <entry> <step> brief check <n>   find the cause of finding <n> of the step's bri | holds: names its form |
| 34 | - For a finding, the failure scenario in the report that holds it. | holds: names its form |
| 43 | - For a finding of a reviewer's report and for a red line, the dispatch entry for the step | holds: names the forms it applies to, or says `premise` has none |
| 45 | - No dispatch entry for the step, for a reviewer's finding or a red line, or for a red lin | holds: names the forms it applies to, or says `premise` has none |
| 46 | - A brief-check finding has no dispatch entry yet, and none is read for it. | holds: names the forms it applies to, or says `premise` has none |
| 49 | - `premise` has no dispatch entry and reads no brief, since the step is not prepared yet. | holds: names the forms it applies to, or says `premise` has none |
| 52 | 5. Inside a plan, for every form but `premise`, the report the finding is in. | holds: excludes `premise` or is a refusal for a finding |
| 53 | - For a finding written as a heading and a number, the refuter report `agents/reviews/<ste | holds: names its form |
| 54 | - For a finding written `round <n>` and a heading and a number, the finding of that name u | holds: names its form |
| 55 | - For `brief check <n>`, the brief check's report `agents/reviews/<step>-brief-check.md`,  | holds: names its form |
| 57 | - No such report or finding is a refusal ("Stops"). | holds: excludes `premise` or is a refusal for a finding |
| 68 | - A later diagnosis of the same step is appended to that file under its own heading at the | holds: names its finding or quotes its part |
| 79 | - Inside a plan, the probes run on a scratch copy under `$TMPDIR` that shares no file with | holds for `premise`: the step has no worktree, so no file is shared |
| 86 | git diff --binary <base>                                      # a reviewer's finding: from | holds: the comment names the reviewer's finding |
| 87 | git apply --allow-empty "$tmp/step.diff"                      # a reviewer's finding: from | holds: the comment names the reviewer's finding |
| 88 | git status --porcelain --untracked-files=all                  # a reviewer's finding: from | holds: the comment names the reviewer's finding |
| 93 | - For a finding of a reviewer's report: | holds: names its form |
| 94 | - `<commit>` is the dispatch entry's base. | holds: names the forms it applies to, or says `premise` has none |
| 95 | - The step's diff is taken from inside the step's worktree. | holds: names its form |
| 97 | - For a red line, `<commit>` is `HEAD` and the step's whole range is taken from the branch | holds: names its form |
| 99 | - For a brief-check finding, `<commit>` is `HEAD` and nothing is applied, since the brief  | holds: names its form |
| 101 | - Before the copy of a reviewer's finding is made, the output of `git status --short` and  | holds: names the reviewer's finding |
| 103 | - Done when the probes have a place to run and the record's section names it, and for a re | holds: names the reviewer's finding |
| 169 | - Inside a plan, for every form but `premise`, a cause not found is raised to the user as  | holds: excludes `premise` |
| 171 | - A cause not found is never sent to the builder. | holds for `premise`: the builder reads the brief, which leaves a cause not found out |
| 196 | - For a finding and a red line, the step's worktree is left unchanged, as "Rules" says. | holds: names its form |
| 197 | - A finding of the reviewer's first run: its fix and its test are the ruling of the next r | holds: names its form |
| 199 | - The red command is the round's check. | holds: names its form |
| 200 | - A finding of the run over the last repair round: its fix is made at landing on main when | holds: names its form |
| 202 | - The fix is never made on main outside a landing, and never sent to the builder. | holds: names its form |
| 203 | - A brief-check finding: its fix goes into the brief, as the `spec` skill's "Steps / The b | holds: names its form |
| 205 | - The fix is never made on main, since the step's builder makes it from the brief. | holds: a `premise` bullet |
| 210 | - Done when the fix and its test stand in the place the defect's source names, and for a r | holds: names the reviewer's finding and `premise` |
| 252 | / No dispatch entry / Inside a plan, for a finding of a reviewer's report or a red line, t | holds: names the forms it applies to, or says `premise` has none |
| 253 | / No report / Inside a plan, for a finding, the report the finding is in is not on disk /  | holds: the cells say for which forms |
| 254 | / No finding / Inside a plan, for a finding, the report holds no finding under the name gi | holds: the cells say for which forms |
| 257 | - After the refusal "No dispatch entry" for a finding of a reviewer's report, the step is  | holds: names the forms it applies to, or says `premise` has none |
| 258 | - After the refusal "No dispatch entry" for a red line, `/diagnose` runs again once `/land | holds: names the forms it applies to, or says `premise` has none |
| 260 | - After the refusal "No dispatch entry" for a step already landed, `/diagnose <symptom>` r | holds: names the forms it applies to, or says `premise` has none |
| 278 | - Inside a plan with no person present, the skill runs in a fresh agent, the diagnosis age | holds: lists every form, `premise` included |
| 288 | - The diagnosis agent changes no file of the main checkout or of the step's worktree. | holds for `premise`: no worktree is changed, and the rule says "when the step has one" |
| 299 | - Inside a plan, the step's worktree, when the step has one, is never changed and every pr | holds for `premise`: no worktree is changed, and the rule says "when the step has one" |

### Hits of item 16

- `git grep -n -e '/diagnose' -e 'brief-check agent' -e 'brief check and the lookups' -e 'reviewer_effort' -e 'reviewer_report' -e 'Agents section' -- README.md skills docs` (not the ADRs, the roadmap or the figure images), each hit read. Lines that list agent kinds were changed: `plan-orchestration` lines 172, 177 and 367; `plan.yaml` line 12 and 27; `orchestrator-state.md` lines 14, 27 and 34; `plan-terms.md` and `docs/glossary.md` entries of effort agent, reviewer and tiers; `spec` line 312 and 376; `README.md` line 20. Lines that name one agent kind on purpose and stay true: `grill` (the lookup agent), `refute` (the reviewer), `ordo-init` and `plan` (keys).
- Lines that list `/diagnose` forms: `README.md` lines 41, 51, 58 and 62 and `skills/refute/SKILL.md` line 23 name `<finding>` and `<symptom>` only; neither lists `red line` or `brief check <n>`, so neither is a complete list that `premise` makes false, and `skills/session-retro/SKILL.md` line 25 names `/diagnose` with no form. The sequence lists that hold every form are `skills/ordo-help/SKILL.md` (line 68 added) and `skills/plan-orchestration/SKILL.md` line 28 (`premise` added).
- Figures: `docs/figures/gen_figures.py` lines 6, 421, 543, 545, 553, 569, 616 and 622 were read. The `/spec` box lists the stop "A cause not found", added by the round, and `docs/figures/plan-loop.svg` is written again by `python3 docs/figures/gen_figures.py`; the other labels name no form, agent kind or new stop that is false.

## Walks

Each walk is the lines of the changed tree that give its result, as `grep -n -F` prints them for the file named before each line.

**W1. A step whose line holds "find why ...", no brief, no dispatch entry, run by a person**

```
skills/diagnose/SKILL.md:47:   - For `premise`, `plan.md` holds the step's text (item 1).
skills/diagnose/SKILL.md:49:   - `premise` has no dispatch entry and reads no brief, since the step is not prepared yet.
skills/diagnose/SKILL.md:50:   - For `premise`, a step that is not in the step list is the refusal "No part to investigate" ("Stops").
skills/diagnose/SKILL.md:62:   - For `premise`, refuse also when the step's text holds no part that asks for a cause to be found, before the record is opened.
skills/diagnose/SKILL.md:69:   - For `premise`, each part of the step's text that asks for a cause to be found gets a diagnosis of its own, in the order of the step's text, the first filling the record as opened.
skills/diagnose/SKILL.md:100:   - For `premise`, `<commit>` is `HEAD` and nothing is applied, since the step has no worktree and no diff.
skills/diagnose/SKILL.md:141:9. Run by a person, wait for the user's reply before the first probe ("Stops").
skills/diagnose/SKILL.md:204:    - `premise`: the cause, the fix, the red command and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the brief.
skills/spec/SKILL.md:97:     - The cause found or already in Step 0, its fix and the record's path are written into the item of "What to build" at Steps 4.
skills/spec/SKILL.md:98:     - The diagnosis's red command becomes a check of the brief's "Verify before you report", and its test, where one was written, a case with its failing run.
```

**W2. The same under `/spec` in the loop, no person present**

```
skills/spec/SKILL.md:93:     - With no person present, the diagnosis runs in a diagnosis agent, as the `diagnose` skill's "Rules" say.
skills/spec/SKILL.md:94:       - Run by a person, the diagnosis runs in the person's session, with the waits of the `diagnose` skill's "Stops".
skills/diagnose/SKILL.md:278:- Inside a plan with no person present, the skill runs in a fresh agent, the diagnosis agent, for every form: `<finding>` and `round <n>`, `red line`, `brief check <n>` and `premise`.
skills/diagnose/SKILL.md:281:  - It starts the agent as the effort agent `ordo-<reviewer_effort>` on the model the configuration block's `reviewer:` names, and checks it as the `refute` skill's Steps 1 checks its reviewer:
skills/diagnose/SKILL.md:291:- The diagnosis agent's final message is the diagnosis record whole, which the session saves at `agents/reviews/<step>-diagnosis.md`, under its own heading below an earlier diagnosis of the step.
skills/diagnose/SKILL.md:294:- Right after the diagnosis agent's start, the session writes the agent's numbered item into `plan.md`'s Agents section.
skills/diagnose/SKILL.md:290:- The diagnosis agent's probes run on the scratch copy of Steps 3.
```

**W3. A step whose text holds no such part**

```
skills/diagnose/SKILL.md:62:   - For `premise`, refuse also when the step's text holds no part that asks for a cause to be found, before the record is opened.
skills/diagnose/SKILL.md:50:   - For `premise`, a step that is not in the step list is the refusal "No part to investigate" ("Stops").
skills/diagnose/SKILL.md:255:| No part to investigate | Inside a plan, for `premise`, the step is not in the step list or its text holds no part that asks for a cause to be found | The step, and its text quoted | `/spec <entry> <step>`, which writes the brief with no investigation |
```

**W4. Two such parts, one in the line and one in a ruling its tag names**

```
skills/diagnose/SKILL.md:69:   - For `premise`, each part of the step's text that asks for a cause to be found gets a diagnosis of its own, in the order of the step's text, the first filling the record as opened.
skills/diagnose/SKILL.md:68:   - A later diagnosis of the same step is appended to that file under its own heading at the level of the record's title, `# Diagnosis: <the symptom in a few words>`, which names its finding or quotes its part.
skills/diagnose/SKILL.md:37:     - The step's text is its line in `plan.md`'s step list, the rulings its tags name and its Step 0.
```

**W5. A cause not found under `premise`**

```
skills/diagnose/SKILL.md:172:    - For `premise`, the open item is raised as the `spec` stop "A cause not found" ("Stops") shows it.
skills/diagnose/SKILL.md:173:    - For `premise`, that open item is the one open item for the part, and `spec`'s Steps 2 raises no second one.
skills/spec/SKILL.md:99:     - A cause not found is left out of the brief.
skills/spec/SKILL.md:100:       - The open item `diagnose` Steps 15 raises is the one open item for it.
skills/spec/SKILL.md:101:       - A step with no other part stops there, with the stop "A cause not found" ("Stops").
skills/spec/SKILL.md:375:| A cause not found | A part of the step's text asks for a cause to be found and the diagnosis did not find it, and the step has no other part (Steps 2) | The open item the `diagnose` skill's Steps 15 raised, with the diagnosis record's path | A ruling |
skills/spec/SKILL.md:367:The first seven rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.
```

**W6. A red command green on main's head under `premise`**

```
skills/diagnose/SKILL.md:119:   - For `premise`, a red command that is green on main's head shows a false premise: the step's text says a behaviour happens that does not happen.
skills/diagnose/SKILL.md:120:     - The false premise goes to `/spec`, which handles it as its Steps 2 handles a false premise.
skills/diagnose/SKILL.md:121:     - Run by a person outside a `/spec` run, the false premise is also written into the step's Step 0 and committed, as the `premise` bullets of Steps 20 say.
skills/spec/SKILL.md:102:     - A red command that is green on main's head is a false premise, which the bullets above on a false premise handle.
skills/spec/SKILL.md:95:     - A result already in the step's Step 0, written there by an earlier diagnosis, is not investigated again: a cause goes into the brief, a cause not found stays out of it with its open item, and a false premise goes to the bullets above on a false premise.
```

**W7. A reviewer's finding whose cause is not known, under `plan-orchestration`**

```
skills/plan-orchestration/SKILL.md:125:     - A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed, before the round is sent, with `/diagnose <entry> <step> <finding>` (`round <n>` before the name for a finding of the run over repair round <n>).
skills/plan-orchestration/SKILL.md:129:     - The orchestrator saves the diagnosis agent's final message as the record and reads it as a builder's report is read, as a lead and not a fact.
skills/plan-orchestration/SKILL.md:131:     - The round carries the found cause's fix.
skills/diagnose/SKILL.md:284:    - A served model that is not the configured one is the stop "A model other than the configured one".
skills/diagnose/SKILL.md:294:- Right after the diagnosis agent's start, the session writes the agent's numbered item into `plan.md`'s Agents section.
skills/land/SKILL.md:96:   - The booking states the builder's, each reviewer's and each brief-check agent's tokens, tool uses and time, from their completion notices, read from the dispatch block's `builder_usage`, `reviewer_report` and `brief_check`, and each diagnosis agent's, read from the head of its diagnosis record.
skills/land/SKILL.md:104:   - A diagnosis agent has its numbered item already, which the session wrote right after its start as the `diagnose` skill's "Rules" say, so the booking adds none.
skills/land/SKILL.md:108:   - It names each diagnosis record of the step (`agents/reviews/<step>-diagnosis.md`, one heading per diagnosis) with its cause and its diagnosis agent's usage from the record's head, or with "cause not found" and the open item it was raised as.
```

**W8. A diagnosis agent served another model**

```
skills/diagnose/SKILL.md:284:    - A served model that is not the configured one is the stop "A model other than the configured one".
skills/diagnose/SKILL.md:285:      - The agent is stopped.
skills/diagnose/SKILL.md:286:      - Nothing it wrote is used.
skills/diagnose/SKILL.md:297:  - An agent stopped for another model is written `<n>. <agent id>: diagnosis of step <k>, <served model>, stopped`.
skills/plan-orchestration/SKILL.md:367:| A model other than the configured one | The runner served a builder, a reviewer, a brief-check agent or a diagnosis agent a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list ("Launching a builder") | The stop message, below, with the configured value, the served model and the Claude Code version | The user's ruling |
skills/spec/SKILL.md:376:| A model other than the configured one | The runner served the brief-check agent or a diagnosis agent a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list ("Steps / The brief check") | The open item, booked in the open items, with the configured value, the served model and the Claude Code version | A ruling |
```

**W9. A person running `/diagnose <entry> <step> <finding>` by hand**

```
skills/diagnose/SKILL.md:277:- Who is present decides the waits: a person running the skill, by hand or inside a plan they run step by step, gets the waits of "Stops", and a session with no person present, a diagnosis agent or one running `/diagnose <symptom>` on its own, gets none.
skills/diagnose/SKILL.md:279:  - Run by a person, the skill stays in the person's session.
skills/diagnose/SKILL.md:141:9. Run by a person, wait for the user's reply before the first probe ("Stops").
skills/diagnose/SKILL.md:246:| The hypotheses | Run by a person, once Steps 7 has formed them, or Steps 14 a second list (Steps 9 and 10) | The red command with its output, the shrunk case and the ranked hypotheses with their falsifying results | The user's reply, then the probes with the ranking the reply gives |
```

**W10. A run of the person-driven script**

```
skills/diagnose/SKILL.md:238:11. For a symptom only a person can trigger, `templates/person-driven.sh`, a script that prints each action for the user to take and reads back what they observed, run as `references/person-driven.md` says, which is the stop "A red command a person drives".
skills/diagnose/SKILL.md:248:| A red command a person drives | Run by a person, when only a person can trigger the symptom | The actions file and the command the user runs to start `templates/person-driven.sh` (`references/person-driven.md`) | The user's word that the script has ended, then the observations file read by the skill |
skills/diagnose/references/person-driven.md:5:- The command is `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`.
skills/diagnose/references/person-driven.md:6:- The actions file is a file the skill writes, one action per line, each an action the user takes with what to look at after it.
skills/diagnose/references/person-driven.md:7:- The observations file is the file the script writes, one pair of lines per action: `Action <n>: <the action>` and `Observed: <the user's line>`.
skills/diagnose/references/person-driven.md:8:- Both files are in the diagnosis's scratch folder `$tmp` of Steps 3.
skills/diagnose/references/person-driven.md:11:- The session never runs the script itself, since the script reads what the user types.
skills/diagnose/references/person-driven.md:12:- The session shows the whole command with absolute paths, for the user to paste into a terminal of their own.
skills/diagnose/references/person-driven.md:15:- When the user says the script has ended, the skill reads the observations file and counts its `Observed:` lines against the actions.
skills/diagnose/references/person-driven.md:16:  - Fewer `Observed:` lines than actions is an unfinished run, and the skill shows the command again with a new observations file.
skills/diagnose/references/person-driven.md:18:- The skill quotes the observations file whole in the record's "Red command" section before the cleanup of Steps 22, a secret in it written `<REDACTED>`.
skills/diagnose/templates/diagnosis.md:38:<for a red command a person drives: each run's observations file quoted whole, which observation is the red>
```

**W11. A red line diagnosed by a diagnosis agent, and a `brief check <n>` diagnosed during `/spec`**

```
skills/diagnose/SKILL.md:294:- Right after the diagnosis agent's start, the session writes the agent's numbered item into `plan.md`'s Agents section.
skills/diagnose/SKILL.md:295:  - The item reads `<n>. <agent id>: diagnosis of step <k>, <served model>`.
skills/plan-orchestration/SKILL.md:152:   - A red line whose cause is not known is diagnosed with `/diagnose <entry> <step> red line`, once the step is out of main and before `/spec` prepares it again.
skills/spec/SKILL.md:349:   - A finding whose cause is not known is diagnosed with `/diagnose <entry> <step> brief check <n>`, which runs, with no person present, in a diagnosis agent as the `diagnose` skill's "Rules" say, before it is closed in the brief.
skills/land/SKILL.md:104:   - A diagnosis agent has its numbered item already, which the session wrote right after its start as the `diagnose` skill's "Rules" say, so the booking adds none.
skills/land/SKILL.md:108:   - It names each diagnosis record of the step (`agents/reviews/<step>-diagnosis.md`, one heading per diagnosis) with its cause and its diagnosis agent's usage from the record's head, or with "cause not found" and the open item it was raised as.
```

**W12. A `premise` diagnosis run by a person in one session, then `/spec` in another**

```
skills/diagnose/SKILL.md:206:      - Run by a person outside a `/spec` run, every ending of a `premise` diagnosis writes its result into the step's Step 0: the cause and its fix, the cause not found with its open item, or the false premise with the red command's green output.
skills/diagnose/SKILL.md:207:      - The session then commits the record, `plan.md` and, for a cause not found, the state file at once, as a resume point, with `git commit -q -m "<message>" -- <path> ...`.
skills/diagnose/SKILL.md:208:      - A `/spec` in another session then finds no uncommitted change on `plan.md` or the state file, which its Steps 1 would refuse.
skills/spec/SKILL.md:68:   - An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal ("Stops"), named by path, since Steps 2 and 9 write those files.
```

## Departures from the prose standard

Each sentence of about 21 words or more that the diff adds or changes in a skill, template or reference, counted by a script that treats each code span as one word (`python3 long.py 21` over the lines `git diff -U0` marks as added; the script lists 92 sentences). The splits of the round's item 9 are made. Each remaining sentence is one rule or one list that the text cannot cut without losing its condition or its place in a table, template or glossary.

| Place | Words | Why it stays |
|---|---|---|
| `docs/dev/building.md:11` | 80 | a command line with its comment, which lists the cases the test covers |
| `skills/diagnose/SKILL.md:3` | 73 | the frontmatter description: one string that holds the skill's purpose, forms and trigger phrases |
| `skills/diagnose/SKILL.md:3` | 33 | the frontmatter description: one string that holds the skill's purpose, forms and trigger phrases |
| `skills/diagnose/SKILL.md:3` | 48 | the frontmatter description: one string that holds the skill's purpose, forms and trigger phrases |
| `skills/diagnose/SKILL.md:35` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:36` | 25 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:62` | 24 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:63` | 23 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:67` | 26 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:68` | 32 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:69` | 36 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:70` | 26 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:119` | 26 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:121` | 29 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:123` | 53 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:169` | 33 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:173` | 21 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:174` | 32 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:204` | 28 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:206` | 45 | the round brief dictates the sentence |
| `skills/diagnose/SKILL.md:207` | 24 | the round brief dictates the sentence |
| `skills/diagnose/SKILL.md:208` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:210` | 50 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:238` | 40 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:242` | 24 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:277` | 46 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:281` | 29 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:291` | 27 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:296` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:298` | 25 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/SKILL.md:299` | 40 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/templates/diagnosis.md:3` | 28 | a template comment or placeholder: one cell that lists its parts |
| `skills/diagnose/templates/diagnosis.md:3` | 30 | a template comment or placeholder: one cell that lists its parts |
| `skills/diagnose/templates/diagnosis.md:5` | 28 | a template comment or placeholder: one cell that lists its parts |
| `skills/diagnose/templates/diagnosis.md:9` | 45 | a template comment or placeholder: one cell that lists its parts |
| `skills/diagnose/templates/diagnosis.md:120` | 48 | a template comment or placeholder: one cell that lists its parts |
| `skills/land/SKILL.md:96` | 41 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/land/SKILL.md:103` | 35 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/land/SKILL.md:104` | 27 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/land/SKILL.md:108` | 38 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/ordo-help/SKILL.md:69` | 36 | one line of the command sequence in its column layout |
| `skills/ordo-help/SKILL.md:84` | 108 | one line of the command sequence in its column layout |
| `skills/plan-orchestration/SKILL.md:125` | 43 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/plan-orchestration/SKILL.md:129` | 27 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/plan-orchestration/SKILL.md:152` | 25 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/plan-orchestration/SKILL.md:172` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/plan-orchestration/SKILL.md:177` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/plan-orchestration/SKILL.md:184` | 38 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/plan/templates/orchestrator-state.md:14` | 32 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/orchestrator-state.md:27` | 27 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/orchestrator-state.md:34` | 50 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/orchestrator-state.md:34` | 114 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/orchestrator-state.md:34` | 27 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/orchestrator-state.md:34` | 36 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/plan.md:36` | 51 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/plan.md:36` | 56 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/plan.yaml:12` | 23 | a template comment or placeholder: one cell that lists its parts |
| `skills/plan/templates/plan.yaml:27` | 24 | a template comment or placeholder: one cell that lists its parts |
| `skills/repo-setup/templates/plan-terms.md:5` | 25 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:7` | 50 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:35` | 27 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:35` | 28 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:38` | 34 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:38` | 34 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:40` | 51 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:65` | 31 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:79` | 28 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:98` | 35 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:117` | 65 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/repo-setup/templates/plan-terms.md:121` | 22 | a glossary entry: one entry that gives its definition and where the term is stated |
| `skills/spec/SKILL.md:64` | 50 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:70` | 41 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:73` | 37 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:92` | 28 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:95` | 49 | the round brief dictates the sentence |
| `skills/spec/SKILL.md:97` | 26 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:98` | 27 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:102` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:103` | 37 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:162` | 21 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:164` | 35 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:349` | 34 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/spec/SKILL.md:367` | 22 | one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule |
| `skills/diagnose/references/person-driven.md:3` | 25 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:6` | 26 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:9` | 21 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:14` | 22 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:15` | 22 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:16` | 21 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:17` | 22 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:18` | 25 | one rule with its reason |
| `skills/diagnose/references/person-driven.md:19` | 24 | one rule with its reason |

## Files

| Lines | File |
|---|---|
| 192 | `README.md` |
| 35 | `docs/dev/building.md` |
| 90 | `docs/dev/change-standard.md` |
| 752 | `docs/figures/gen_figures.py` |
| 167 | `docs/figures/plan-loop.svg` |
| 148 | `docs/glossary.md` |
| 306 | `skills/diagnose/SKILL.md` |
| 120 | `skills/diagnose/templates/diagnosis.md` |
| 231 | `skills/land/SKILL.md` |
| 119 | `skills/ordo-help/SKILL.md` |
| 419 | `skills/plan-orchestration/SKILL.md` |
| 208 | `skills/plan/SKILL.md` |
| 70 | `skills/plan/templates/orchestrator-state.md` |
| 43 | `skills/plan/templates/plan.md` |
| 30 | `skills/plan/templates/plan.yaml` |
| 253 | `skills/repo-setup/SKILL.md` |
| 131 | `skills/repo-setup/templates/plan-terms.md` |
| 403 | `skills/spec/SKILL.md` |
| 76 | `skills/diagnose/templates/person-driven.sh` |
| 393 | `skills/diagnose/templates/person-driven.test.sh` |
| 20 | `skills/diagnose/references/person-driven.md` |

New files: `skills/diagnose/templates/person-driven.sh`, `skills/diagnose/templates/person-driven.test.sh`, `skills/diagnose/references/person-driven.md`. `docs/figures/plan-loop.svg` is rewritten by `docs/figures/gen_figures.py`; `git status --short` lists 18 modified paths and the three new paths, and the report is the only path written under `.scratch/`. `skills/diagnose/templates/person-driven.sh` is 76 lines against the limit of 120.

## Judgment calls

1. C17, an empty observations path: refusal 4 gains the test `[ -n "$obs" ]`, because an empty path passes `-d .` and then fails at the append after an action was shown. The case is C17 in the test.
2. The description of `diagnose` gained one trigger phrase and the hand-over sentence was reworded; the description is 965 characters, under the largest of the repository (1022).
3. `orchestrator-state.md` gained the dispatch-comment sentence "A diagnosis agent has no key here...", since the dispatch comment lists every record the orchestrator adds and a diagnosis agent has none. `plan.projects.yaml` has no comment on the reviewer keys and is unchanged.
4. C19 has a second variant, a pipe whose reader has exited, with `trap '' PIPE` in the script, so that the run ends with exit 1 and its message instead of exit 141; its mutation is the second C19 row.
5. A path also reaches `printf` as a `%s` argument only; no path or action is a format.
6. The brief's part C says "spec Steps 4" for `premise`, while its item 9 and decision 12 put the investigation in Steps 2; the investigation is built in Steps 2, and Steps 4 only receives its outcome as a brief item.
7. The sentences that stay over about 20 words are named, with the reason for each, under "Departures from the prose standard".
8. `.agents/plan.yaml` line 10 (the user's configuration of this repository) is left unchanged; it is for the orchestrator.
9. `diagnose` Steps 15 says that, for `premise`, the open item is raised as the `spec` stop "A cause not found" shows it, and that the `plan-orchestration` row "A finding that is the user's" is for every form but `premise`; the round's item 6 adds the `spec` stop, and the two texts have to name the same stop.
10. `plan-terms.md` Step 0 also holds the cause not found and the false premise that a `premise` run ended with, since the round's item 4 writes both into Step 0.

## User-visible changes

Each change gives what a user or host saw before and what they see now.

- `/diagnose <entry> <step> premise`: new form. Before, `/spec` investigated a "find why" part itself in Steps 4; now `/diagnose` investigates it, in a diagnosis agent when no person is present and in the person's session with the waits when a person runs it, and `/spec` carries the cause, the fix and the record's path into the brief.
- The refusal "No part to investigate". Before, `/diagnose` had no form for a step's text and no refusal for it. Now `/diagnose <entry> <step> premise` for a step that is not in the step list, or whose text holds no part that asks for a cause, prints the step and its text and is resumed by `/spec <entry> <step>`, which writes the brief with no investigation.
- The numbered Agents item. Before, `plan.md`'s Agents section held one bullet per agent, written by `/land`, `/grill` and `/spec`. Now a diagnosis agent has a numbered item `<n>. <agent id>: diagnosis of step <k>, <served model>` under the heading "Agents in no role the cost script prices:", written by the session right after the agent starts, and `<n>. ..., stopped` when the agent was served another model.
- The diagnosis agent's usage in the landing's booking. Before, the booking stated the builder's, each reviewer's and each brief-check agent's tokens, tool uses and time. Now `/land` also states each diagnosis agent's usage from its record's head and names each diagnosis record of the step with its cause; the agent keeps its numbered item and gets no second one.
- The "Diagnosis agent:" line in the record's head. Before, the record's head named no agent. Now it holds the agent's id, its served model, its tokens, tool uses and time, or "none, run by a person".
- The `/spec` stop "A cause not found". Before, `/spec` had no stop for a part of the step's text whose cause the diagnosis did not find. Now it stops with the open item `diagnose` raised and the record's path, resumed by a ruling, when the step has no other part.
- The commit of a `premise` run by a person. Before, a `premise` run by a person left the record and Step 0 uncommitted, so a `/spec` in another session refused at its Steps 1. Now every ending (cause found, cause not found, false premise) writes its result into Step 0 and the session commits the record, `plan.md` and, for a cause not found, the state file with `git commit -q -m "<message>" -- <path> ...`.
- The new trigger phrase of `/diagnose`, "find the cause a step's text asks for". Before, no phrase in the description named a step's text; now a request in those words starts the skill.
- A red command only a person can trigger runs through `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`; before, the stop named no command.
- `/ordo-help` lists the `premise` form after `/spec` and its `/spec stops` line names the two stops of this step; `plan-orchestration`'s "Use instead" row lists `premise`.
- `README.md`'s `diagnose` row says that inside a plan, with no person present, it runs in a fresh agent.
- Seven skills have a minor version raise: `diagnose` 1.1.0 to 1.2.0, `land` 1.9.0 to 1.10.0, `spec` 2.0.0 to 2.1.0, `ordo-help`, `plan` and `repo-setup` 2.0.0 to 2.1.0, `plan-orchestration` 3.0.0 to 3.1.0.

## Anything wrong or impossible in the brief

- Part C names "spec Steps 4" for the `premise` form while item 9 and decision 12 name Steps 2 (judgment call 6).
- The state file of the worktree is the copy at the base, so the runner counted 11 commands and does not run `person-driven.test.sh`; the orchestrator adds the command at landing, as ADR 0010 says.

## Repair round 1

| Item | State | Command that proves it, and its output |
|---|---|---|
| 1. Spec 1, who starts a diagnosis agent | DONE | `grep -n 'With no person present, the diagnosis runs in a diagnosis agent\|Run by a person, the diagnosis runs in the person' skills/spec/SKILL.md` prints lines 93 and 94; `grep -n 'which runs, with no person present, in a diagnosis agent' skills/spec/SKILL.md` prints line 349 |
| 2. Spec 2, the agent's numbered item at a wait | DONE | `grep -n "diagnosis agent's numbered item in the Agents section" skills/spec/SKILL.md` prints lines 64, 70, 103, 162 and 164 (Steps 1 own-records and copy-aside bullets, Steps 2 last diagnosis bullet, Steps 5 restore bullets) |
| 3. Spec 3, the session runs the script | DONE | `grep -n 'shows the command again' skills/diagnose/references/person-driven.md` prints line 16; `grep -c 'runs the script again' skills/diagnose/references/person-driven.md` prints 0 |
| 4. Behaviour 2, a person-run `premise` that ends without a found cause | DONE | `grep -n 'every ending of a .premise. diagnosis\|The session then commits the record\|A .\/spec. in another session then finds' skills/diagnose/SKILL.md` prints lines 206, 207 and 208; `grep -n 'the false premise is also written\|the cause not found is also written' skills/diagnose/SKILL.md` prints lines 121 and 174; `grep -n 'A result already in the step' skills/spec/SKILL.md` prints line 95 |
| 5. Standards 1, `/ordo-help`'s `/spec stops` line | DONE | `grep -n 'a cause the step.s text asks to have found was not found' skills/ordo-help/SKILL.md` prints line 84 |
| 6. Standards 2, the `/spec` stop "A cause not found" | DONE | `grep -n '^| A cause not found\|^The first seven rows' skills/spec/SKILL.md` prints lines 367 and 375; `grep -n 'A cause not found\|A brief check finding the brief cannot absorb' docs/figures/gen_figures.py` prints lines 592, 593 and 622; `python3 docs/figures/gen_figures.py` wrote `docs/figures/plan-loop.svg` (`git status --short docs/figures` lists it); the figure box height (`gen_figures.py` line 560) went from 290 to 304 so the seven stops fit |
| 7. Standards 4, `diagnose` "What it reads" 3 | DONE | `grep -n 'a step that is not in the step list' skills/diagnose/SKILL.md` prints line 50 |
| 8. Standards 5, `spec` Steps 5, "nothing but" | DONE | `grep -n 'leaves only the session\|The brief is restored to main' skills/spec/SKILL.md` prints lines 162 and 163; `grep -c 'leaves nothing but' skills/spec/SKILL.md` prints 0 |
| 9. Several rules in one bullet | DONE | `diagnose` Rules lines 285, 286, 292, 293, 295 and 296 (served model, raises a cause not found, writes Step 0, the numbered item with its three sub-bullets); `spec` Steps 2 lines 100 and 101; `plan-orchestration` Steps 8 lines 126, 127, 128 and 153 and Steps 9 lines 152 |
| 10. Standards 3 of the trial review, the prohibition with its alternative | DONE | `grep -n "Every read and every probe of the diagnosis runs in the diagnosis agent's own session" skills/diagnose/SKILL.md` prints line 289 |
| 11. README line 20 | DONE | `grep -n 'with no person present, it runs in a fresh agent, probes on a scratch copy' README.md` prints line 20 |
| 12. Proof 6, the dash run | DONE | `grep -n 'c1 standard output under dash' skills/diagnose/templates/person-driven.test.sh` prints line 112; its assertion fails on the mutated copy (see "Mutations") |
| 13. Proof 5, C20 and the one printf | DONE | `grep -n 'one printf' skills/diagnose/templates/person-driven.sh` prints line 16; the C20 row of "Mutations" names what C20 guards, and the line below the table says the rule is checked by reading |
| 14. Proof 4, the C16 and C20 mutation rows | DONE | the C16 row is the one-line mutation `dir=$(dirname "$obs")` in place of the `case` line and the C20 row is the one-line change of the action line; both FAIL lines are from the rerun in "Mutations" (`FAIL: c16: exit status 64, expected 0` and `FAIL: c20: the text differs from the expected one`) |
| 15. Proof 1, 2, 3 and Behaviour 1, the report | DONE | the walks W1 to W12 are in "Walks", the hits of item 7's last grep in "Hits", "Departures from the prose standard" is a section, "Terms" has a column for the line that uses each term and for whether the use is in its sense, and "User-visible changes" gives the before and after of each change the round names |

Every item is DONE; none is NOT DONE. The section "Verify" above (Verify 1 to 10) is the rerun of the brief's verify list after the round: the runner `checks.sh` printed `checks: 11 commands passed`, `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` prints `PASS: person-driven.sh scratch tests`, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, and the ASCII check over every changed file printed nothing.

Files changed in the round, with their line counts, are in "Files" above: `skills/spec/SKILL.md`, `skills/diagnose/SKILL.md`, `skills/diagnose/references/person-driven.md`, `skills/ordo-help/SKILL.md`, `skills/plan-orchestration/SKILL.md`, `skills/repo-setup/templates/plan-terms.md`, `docs/glossary.md`, `README.md`, `docs/figures/gen_figures.py`, `docs/figures/plan-loop.svg`, `skills/diagnose/templates/person-driven.sh` and `skills/diagnose/templates/person-driven.test.sh`.

Two points the round states. The first bullet of `spec` Steps 5 carries the clause "the diagnosis agent's numbered item in the Agents section among them" after item 8's sentence, because item 2 asks every place that names the surviving records to name the item. `diagnose` Steps 15 names the `spec` stop for `premise`, as judgment call 9 says.
