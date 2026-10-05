# Report, step 2a of plan 2.F

Everything in the brief is done.

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
| 1. `person-driven.sh`, at most 120 lines | DONE | `wc -l skills/diagnose/templates/person-driven.sh` prints 75 |
| 2. `person-driven.test.sh`, one case per C1 to C20 | DONE | `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` prints `PASS: person-driven.sh scratch tests` |
| 3. `references/person-driven.md` | DONE | 20 lines, a title, one sentence and one rule per bullet; `grep -n 'person-driven' skills/diagnose/SKILL.md` prints lines 234 and 244 |
| 4. `diagnose` item 11 and the Stops row | DONE | line 234 names `templates/person-driven.sh` and `references/person-driven.md` and keeps the stop; line 244 shows the actions file and the command, resumed by "The user's word that the script has ended, then the observations file read by the skill" |
| 5. `diagnosis.md` placeholder and code block | DONE | `grep -n 'red command a person drives\|observations file of each' skills/diagnose/templates/diagnosis.md` prints lines 38 and 41, before line 44 ("Runs after the tightening") |
| 6. building.md and change-standard.md lines | DONE | check 5 below |
| 7. The form `premise` (Quick start, "What it reads", Steps 1 to 4, 20, Stops, description, no other sentence false) | DONE | `grep -n 'premise' skills/diagnose/SKILL.md` prints lines 19, 35, 47, 49, 51, 52, 62, 63, 69, 70, 100, 119, 120, 122, 171, 201, 206, 251, 274, 286; the hits of the grep the brief names are read in "Hits" below |
| 8. `diagnosis.md` for `premise` | DONE | `grep -n 'quotes its part\|premise' skills/diagnose/templates/diagnosis.md` prints lines 3, 9, 96 and 120 |
| 9. `spec`: investigation moved into Steps 2 | DONE | `grep -c 'find why' skills/spec/SKILL.md` prints 1 (line 92, Steps 2); line 133 and its two sub-bullets are gone from Steps 4 |
| 10. `ordo-help` sequence | DONE | `grep -n 'premise' skills/ordo-help/SKILL.md` prints line 68 (`/diagnose <entry> <step> premise`) and line 84 (the existing `/spec stops` line); its text is on line 69 from column 31 |
| 11. `plan-orchestration` "Use instead" row | DONE | `grep -n 'premise' skills/plan-orchestration/SKILL.md` prints lines 28, 56, 92 and 358, of which line 28 is the row with `premise` among the forms |
| 12. Glossary entries and terms | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`; check 3 below |
| 13. The diagnosis agent in a plan | DONE | diagnose Rules lines 273 to 287; `plan-orchestration` lines 125, 126, 149, 168, 173, 180 and 363; `spec` lines 92, 93, 346 and 372; `land` lines 96, 104 and 108; the plan templates and the glossary terms as "Files" lists them |
| 14. Version raises | DONE | check 10 below |
| 15. `gen_figures.py` | DONE, no label made false | `grep -n -i diagnos docs/figures/gen_figures.py` prints lines 6, 421, 543, 545, 553, 569, 615 and 621: the `/diagnose` box says "The cause of a defect, from a command red on it, before any fix" and lists the stops "The hypotheses" and "The cause not found"; the loop figure says "a finding whose cause is not known through /diagnose" and "A cause not found, from /diagnose". Each still holds, none names a form, a Stops row this step added or the sequence, so the script was not run again |
| 16. Other lines naming the forms or the kinds of agent | DONE | the grep of item 16 is read in "Hits" below |
| Verify 1, the runner | DONE | quoted below |
| Verify 2 | DONE | `PASS: person-driven.sh scratch tests` |
| Verify 3 | DONE | `ok: the plan-terms block equals the template` |
| Verify 4 | DONE | `LC_ALL=C grep -n '[^ -~]'` over `git diff --name-only` and the untracked files outside `.scratch` printed nothing, exit status 1 (grep's status for no match) |
| Verify 5 | DONE | quoted below |
| Verify 6 | DONE | `git diff` read whole; the walks and the hits are below |
| Verify 7 | DONE | quoted below, the largest count is 1022 (`roadmap`, not touched), `diagnose` is 965 and `spec` 987 |
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
| no observations file when the input ends before the first observation | C6 | `exec 3< "$actions"` becomes `exec 3< "$actions" && : >> "$obs"` | `FAIL: c6: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.NQY1sw/c6/obs.txt exists` |
| an empty or blank observation is asked for again | C7 | the blank-observation `case` branch becomes `*)` | `FAIL: c7: the request to type an observation is not printed twice` |
| a last observation with no newline is kept | C8 | `while IFS= read -r seen || [ -n "$seen" ]` becomes `while IFS= read -r seen` | `FAIL: c8: exit status 1, expected 0` |
| an observations path that is a file, a folder or a dangling link is refused untouched | C9 | `{ [ -e "$obs" ] || [ -L "$obs" ]; } && refuse` becomes `[ -e "$obs" ] && refuse` | `FAIL: c9 link.txt: exit status 0, expected 64` |
| an actions file that is missing, a folder or unreadable is refused | C10 | `[ -f "$actions" ] && [ -r "$actions" ] || refuse` becomes `[ -e "$actions" ] || refuse` | `FAIL: c10 folder: exit status 1, expected 64` |
| an actions file with no action is refused | C11 | `[ "$m" -gt 0 ]` becomes `[ "$m" -ge 0 ]` | `FAIL: c11 empty.txt: exit status 0, expected 64` |
| an observations file in a missing folder is refused before any action is shown | C12 | the folder is always `.` | `FAIL: c12: exit status 1, expected 64` |
| an append that fails ends the run at once | C13 | the append's `|| { say ...; exit 1; }` becomes `|| :` | `FAIL: c13: exit status 0, expected 1` |
| a last action with no newline is kept | C14 | `while IFS= read -r text <&3 || [ -n "$text" ]` becomes `while IFS= read -r text <&3` | `FAIL: c14: the text differs from the expected one` |
| a relative path is taken from the folder the script is started in | C15 | `dir=.` becomes `dir=/` | `FAIL: c15: exit status 64, expected 0` |
| a path that starts with a dash is a file name | C16 | `dir=${obs%/*}` becomes `dir=$(dirname "$obs")` | `FAIL: c16: exit status 64, expected 0` |
| an empty path is refused and creates nothing | C17 | the folder test loses `[ -n "$obs" ] &&` | `FAIL: c17 empty observations path: exit status 1, expected 64` |
| a folder that is not writable is refused before any action is shown | C18 | the folder test loses `&& [ -w "$dir" ]` | `FAIL: c18: exit status 1, expected 64` |
| a closed standard output ends the run with no pair | C19 | `|| cannot_show` becomes `|| :` on the action line | `FAIL: c19 closed: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.3S0lko/c19/obs.txt exists` |
| a pipe whose reader has exited ends the run with exit 1 and its message | C19 (pipe) | the line `trap '' PIPE` is removed | `FAIL: c19 pipe: exit status 141, expected 1` |
| a TERM while the script waits leaves the earlier pairs whole | C20 | the action is appended before its observation is read | `FAIL: c20: the text differs from the expected one` |

## Terms

`python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` wrote `plan-terms.md` into `docs/glossary.md`; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`. The terms were added to `skills/repo-setup/templates/plan-terms.md` first.

| Term | New or changed | What it says now |
|---|---|---|
| actions file | new | the file `diagnose` writes for `templates/person-driven.sh`, one action per line |
| observations file | new | the file `templates/person-driven.sh` writes, `Action <n>: ...` and `Observed: ...` per action, named `observations-<n>.txt` |
| diagnosis agent | new | the fresh agent that runs `/diagnose` inside a plan with no person present, the effort agent `ordo-<reviewer_effort>` on the `reviewer:` model, whose final message is the record |
| Agents section | changed | adds the numbered item under "Agents in no role the cost script prices:", and `diagnose`, "Rules" as a place that states it |
| dispatch entry | changed | adds the sentence that a diagnosis agent has no key in the entry |
| effort agent | changed | a diagnosis agent is launched as `ordo-<reviewer_effort>` |
| premise | changed | also a claim about behaviour that a step's text asks to have explained, checked by `/diagnose <entry> <step> premise` |
| reviewer | changed | the diagnosis agent runs on `reviewer:` |
| Step 0 | changed | holds a cause found by `/diagnose`, a red line's or one the step's text asks for |
| tiers | changed | the agents the orchestrator starts include diagnosis agents |

## Hits of the greps the brief names

- `git grep -n -e '/diagnose' -e 'brief-check agent' -e 'brief check and the lookups' -e 'reviewer_effort' -e 'reviewer_report' -e 'Agents section'` over `README.md`, `skills` and `docs` (not the ADRs, the roadmap or the figure images), each hit read. Lines that list agent kinds were changed: `plan-orchestration` lines 168, 173 and 363; `plan.yaml` line 27; `orchestrator-state.md` line 27; `plan-terms.md` lines 40 and 121 with `docs/glossary.md` lines 45 and 126; `spec` line 372. Lines that name one agent kind on purpose and stay true: `grill` lines 216 and 221 (the lookup agent), `refute` lines 48, 85 and 176 (the reviewer), `ordo-init` lines 102 and 157 (keys), `plan` line 154 (keys).
- Lines that list `/diagnose` forms: `README.md` lines 41 and 51 and `skills/refute/SKILL.md` line 23 name `<finding>` and `<symptom>` only, as before; neither lists `red line` or `brief check <n>`, so neither is a complete list that `premise` makes false, and `skills/session-retro/SKILL.md` line 25 names `/diagnose` with no form. The sequence lists that hold every form are `skills/ordo-help/SKILL.md` (line 68 added) and `skills/plan-orchestration/SKILL.md` line 28 (`premise` added).
- Figures: `docs/figures/gen_figures.py` lines 6, 421, 543 to 553, 569, 615 and 621 were read; no label names a form, an agent kind or the new stop, so no label is false and the figures are unchanged.

## Walks

Each walk follows one claim through the files that carry it. Line numbers are from the final tree.

- Premise investigation, `/spec` side: `skills/spec/SKILL.md` line 92 starts the investigation in Steps 2 with `/diagnose <entry> <step> premise` and lines 93 to 100 carry its outcomes (agent, Step 0 cause, scratch copy, brief item, check and case, cause not found, green red command); `diagnose` lines 19, 47, 49 and 51 to 52 refuse and read the form.
- The diagnosis agent: `diagnose` Rules lines 273 to 287; `plan-orchestration` lines 125 to 127, 149, 168, 173, 180 and 363; `spec` lines 309, 346 and 372; `land` lines 96, 104 and 108; `plan.yaml` line 27; `orchestrator-state.md` line 27; `plan.md` line 36; the glossary entries above.
- The person-driven path: `diagnose` lines 234 and 244, `references/person-driven.md`, `templates/diagnosis.md` lines 38 and 41, `templates/person-driven.sh`.
- The command lists: `docs/dev/building.md` line 11 and `docs/dev/change-standard.md` line 72, each directly after the `git_guard.test.sh` line.

## Files

| Lines | File |
|---|---|
| 35 | `docs/dev/building.md` |
| 90 | `docs/dev/change-standard.md` |
| 148 | `docs/glossary.md` |
| 297 | `skills/diagnose/SKILL.md` |
| 120 | `skills/diagnose/templates/diagnosis.md` |
| 231 | `skills/land/SKILL.md` |
| 119 | `skills/ordo-help/SKILL.md` |
| 415 | `skills/plan-orchestration/SKILL.md` |
| 208 | `skills/plan/SKILL.md` |
| 70 | `skills/plan/templates/orchestrator-state.md` |
| 43 | `skills/plan/templates/plan.md` |
| 30 | `skills/plan/templates/plan.yaml` |
| 253 | `skills/repo-setup/SKILL.md` |
| 131 | `skills/repo-setup/templates/plan-terms.md` |
| 399 | `skills/spec/SKILL.md` |
| 75 | `skills/diagnose/templates/person-driven.sh` |
| 392 | `skills/diagnose/templates/person-driven.test.sh` |
| 20 | `skills/diagnose/references/person-driven.md` |

New files: `skills/diagnose/templates/person-driven.sh`, `skills/diagnose/templates/person-driven.test.sh`, `skills/diagnose/references/person-driven.md`. `skills/diagnose/templates/person-driven.sh` is 75 lines against the limit of 120. No other file was changed: `git status --short` lists the 15 modified files above and the three new paths. The report is the only path written under `.scratch/`.

## Judgment calls

1. C17, an empty observations path: refusal 4 gains the test `[ -n "$obs" ]`, because an empty path passes `-d .` and then fails at the append after an action was shown. The case is C17 in the test.
2. The description of `diagnose` gained one trigger phrase and the hand-over sentence was reworded; the description is 965 characters, under the 1022 largest of the repository.
3. `orchestrator-state.md` gained the dispatch-comment sentence "A diagnosis agent has no key here...", since the dispatch comment lists every record the orchestrator adds and a diagnosis agent has none. `plan.projects.yaml` has no comment on the reviewer keys and is unchanged.
4. C19 has a second variant, a pipe whose reader has exited, with `trap '' PIPE` in the script, so that the run ends with exit 1 and its message instead of exit 141; its mutation is the second C19 row.
5. A path also reaches `printf` as a `%s` argument only; no path or action is a format.
6. The brief's part C says "spec Steps 4" for `premise`, while its item 9 and decision 12 put the investigation in Steps 2; the investigation is built in Steps 2 and Steps 4 only receives its outcome as a brief item.
7. Several sentences added to the skills are longer than 28 words where they carry one list (a table cell, a glossary entry, a template placeholder). The sentences in the bullet text of `diagnose`, `spec` and `plan-orchestration` that were longer were split into sub-bullets.
8. `.agents/plan.yaml` line 10 (the user's configuration of this repository) is left unchanged; it is for the orchestrator.

## User-visible changes

- `/diagnose <entry> <step> premise`: new form. Before, `/spec` investigated a "find why" part itself in Steps 4; now `/diagnose` investigates it in a diagnosis agent and `/spec` carries the cause, the fix and the record path into the brief.
- Inside a plan with no person present, `/diagnose` runs in a diagnosis agent. Before, the session ran the probes itself.
- A red command only a person can trigger runs through `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`; before, the stop named no command.
- `/ordo-help` lists the `premise` form after `/spec`; `plan-orchestration`'s "Use instead" row lists it.
- Seven skills have a minor version raise: `diagnose` 1.1.0 to 1.2.0, `land` 1.9.0 to 1.10.0, `spec` 2.0.0 to 2.1.0, `ordo-help`, `plan` and `repo-setup` 2.0.0 to 2.1.0, `plan-orchestration` 3.0.0 to 3.1.0.

## Anything wrong or impossible in the brief

- Part C names "spec Steps 4" for the `premise` form while item 9 and decision 12 name Steps 2 (judgment call 6).
- The state file of the worktree is the copy at the base, so the runner counted 11 commands and does not run `person-driven.test.sh`; the orchestrator adds the command at landing, as ADR 0010 says.
