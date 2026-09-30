# Step 2b report: the form `/diagnose <entry> <step> premise`, and `spec` Steps 4 pointing at it

Everything in the brief and in round 1 is done. Part 10 lists two points in this round's texts for the orchestrator; no dictated text was reworded.

## 2. Open items of the state file

`grep -n -i 'open items' -A3 .scratch/2-f-diagnose/orchestrator-state.md` prints, under "## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)":

```
none
```

## 3. The cases' first read, on the unchanged tree (before any change)

Each output was taken from the unchanged tree; the lines below are quoted whole. `git show HEAD:<file>` prints the same text as the tree had before the change.

- R1: `grep -c 'premise' skills/diagnose/SKILL.md` printed `0`, exit status 1. `skills/diagnose/SKILL.md` names no form `premise`.
- R2: `sed -n 112,114p skills/spec/SKILL.md` printed:
  ```
     - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item.
       - A cause it cannot find is left out of the brief.
       - Such a cause is raised to the user as an open item.
  ```
  `grep -n '/diagnose' skills/spec/SKILL.md` printed:
  ```
  117:   - For a step taken back out of main, whose Step 0 in `plan.md` records the failure its landing met, the brief carries that failure and, when `/diagnose` wrote them into Step 0, the cause, the fix and the diagnosis record's path.
  254:   - A finding whose cause is not known is diagnosed with `/diagnose <entry> <step> brief check <n>` before it is closed in the brief.
  ```
  Line 112 names no command for the investigation.
- R3: `sed -n 59,61p skills/ordo-help/SKILL.md` printed:
  ```
  /spec <entry> <step>          writes the brief, has a fresh agent check it against the tree (the brief check) and closes its findings in the brief, makes the worktree, stages the base binaries
  /diagnose <entry> <step> brief check <n>
                                when a finding of the brief check has a cause not known: finds the cause on a scratch copy before the finding is closed in the brief
  ```
  `grep -n 'premise' skills/ordo-help/SKILL.md` printed:
  ```
  74:/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choice is yours, the step contradicts an ADR (a rule clash), or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief
  ```
  That line uses the word in the glossary's sense and names no form. `sed -n 28p skills/plan-orchestration/SKILL.md` printed:
  ```
  | A finding, a red line or a brief-check finding whose cause is not known, diagnosed by hand | `/diagnose <entry> <step> <finding>`, `red line` or `brief check <n>` |
  ```
  No form `premise` in the sequence block or the row.
- R4: `sed -n 104p skills/repo-setup/templates/plan-terms.md` and `sed -n 109p docs/glossary.md` printed the same line:
  ```
  - **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, a red line's cause found by `/diagnose`, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6; `diagnose`, Steps 20.
  ```
  The entry names only a red line's cause.
- R5: `grep -n -i 'part\|step.s text' skills/diagnose/templates/diagnosis.md` printed:
  ```
  56:| <the part of the case cut: an input, a caller, a configuration value, a piece of data, a stage of the run> | <the result, red or green, and the line that shows it> | <cut, or put back because it turned the red command green> |
  58:The shrunk case, as it stands: <each part left, each one needed for the red>.
  ```
  Both lines are about a case of a diagnosis. `grep -c 'premise' skills/diagnose/templates/diagnosis.md` printed `0`. The template has no words for a part of a step's text.

All five held as the brief states them.

## 4. DONE / NOT DONE

### The brief's items, as they now stand

| Item | Status | Proof |
|---|---|---|
| 1. description clause | DONE | `skills/diagnose/SKILL.md` line 3 ends the sentence "leaves the step's worktree unchanged and hands the fix over by where the defect was found."; the old clause counts 0 |
| 2. Quick start line | DONE | `19:/diagnose <entry> <step> premise           find the cause a step's text asks for, before the step's brief is written` |
| 3. What it reads | DONE | `skills/diagnose/SKILL.md` lines 35, 44, 46, 47, 52 (as round item 9 words it), 53 |
| 4. Steps | DONE | lines 63 (as round item 10 words it), 64 (round item 8), 65 (round item 6), 89, 108 to 111 (round item 2), 183 and 184 (Steps 20) |
| 5. Stops | DONE | opening line "The last five rows are refusals."; second cells of "No report" and "No finding"; row 230 `No part to investigate` last |
| 6. diagnosis.md | DONE | line 3, the Symptom placeholder (line 7) and line 112 as the brief gives them, with round items 4 and 10 applied |
| 7. `spec` Steps 4 | DONE | `skills/spec/SKILL.md` lines 112 to 123 |
| 8. `ordo-help` sequence | DONE | `60:/diagnose <entry> <step> premise` and its text line, before the `brief check <n>` form |
| 9. `plan-orchestration` row | DONE | `28:| A finding, a red line or a brief-check finding whose cause is not known, or a cause a step's text asks to have found, diagnosed by hand | `/diagnose <entry> <step> <finding>`, `red line`, `brief check <n>` or `premise` |` |
| 10. Step 0 entry | DONE | `skills/repo-setup/templates/plan-terms.md` line 104, then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`; `docs/glossary.md` line 109 |

The brief's checks 1 to 4 are Round 1 checks 1, 2 and 5 below (the same commands, run on the tree as it is after the round). The brief's check 6 is round check 7; the brief's check 7 is part 6.

### The walks, read on the tree after round 1

Each step is the line the text gives, as `grep -n` prints it.

**W1.** A step whose line holds one part "find why the sync check prints a stale block and end it", no brief, no dispatch entry, run by a person. Result: not refused; record `agents/reviews/<step>-diagnosis.md`; probes on a detached worktree at `HEAD` with nothing applied; the person shown the hypotheses and waited for; cause, fix, red command and record's path in Step 0; the fix not made on main; `/spec` then writes them into the item with the red command as a check. This is the expected result.
- `58:1. Inside a plan, refuse when "What it reads" 3 or 5 finds an input missing.`; the step's line holds a part, found by `52:   - For `premise`, the step's text: its line in the step list of `plan.md`, the rulings that touch it and what its Step 0 holds, as the `spec` skill's "What it reads" 4 reads them.`; `53` (the refusal) does not apply. `44:   - A brief-check finding and `premise` have no dispatch entry yet, and none is read for them.` and `46:   - For `premise` no brief is read.`
- `35:   - For `premise`, what the step's text says happens, in each part of it that asks for a cause to be found, in whatever words, as "find why X happens and end it" does.`, `62:   - Inside a plan, the record is `agents/reviews/<step>-diagnosis.md` beside the state file, a copy of `templates/diagnosis.md` filled as the steps below run.`, `68:   - Done when the record exists and its Symptom section holds the symptom as "What it reads" 1 gives it, word for word.`
- `72:   - Inside a plan, the probes run on a scratch copy under `$TMPDIR` that shares no file with the step's worktree.`, `89:   - For `premise`, `<commit>` is `HEAD` and nothing is applied, since what the step's text says happens is on main.`
- `125:8. Show the red command, its output, the shrunk case and the hypotheses.`, `129:9. Run by a person, wait for the user's reply before the first probe ("Stops").`
- `183:    - `premise`: the cause, the fix, the red command and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's brief.`, `184:      - The fix is never made on main, since the step's builder makes it from the brief.`
- `skills/spec/SKILL.md`: `112:   - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, with `/diagnose <entry> <step> premise`.`, `116:     - The found cause, its fix and the diagnosis record's path are written into the item.`, `117:     - The diagnosis's red command becomes a check of the brief's "Verify before you report".`
- The ledger files: `190:    - Inside a plan, a session run by hand that ends before the next command of the sequence commits by path each ledger file the diagnosis wrote (the record, `plan.md`, the state file).`

**W2.** The same with no person present, under `/spec` in the loop. Result: no wait, same end. This is the expected result.
- `127:   - With no person present, the skill writes the hypotheses into the record and goes on to Steps 11, and Steps 9 and 10 are not run.`, `247:- Who is present decides the waits: a person running the skill, by hand or inside a plan they run step by step, gets the waits of "Stops", and a session with no person present, under `plan-orchestration` or running `/diagnose <symptom>` on its own, gets none.` The rest is as W1. `skills/plan-orchestration/SKILL.md` line 332 now names `/diagnose` among the skills the loop invokes.

**W3.** A step whose text holds no such part. Result: refused by the row "No part to investigate", which names `/spec`. This is the expected result.
- `53:   - For `premise`, a step's text with no such part is a refusal ("Stops").` and `230:| No part to investigate | Inside a plan, for `premise`, the step's text holds no part that asks for a cause to be found | A refusal that names the step and quotes its text | `/spec <entry> <step>`, which writes the brief with no investigation |`; Steps 1 (line 58) comes before Steps 2, so no record is opened.

**W4.** Two parts, one in the step's line and one in a ruling its tag names. Result: two diagnoses, in the order of the step's text, the first in the record as opened and the second appended under a heading that quotes its part. This is the expected result.
- `52` (above) gives the order: line, rulings that touch it, Step 0. `64:   - For `premise`, each part "What it reads" 5 finds whose cause does not stand in the step's Step 0 already gets a diagnosis of its own, in the order of the step's text.`, `65:   - The first fills the record as opened.`, `63:   - A later diagnosis of the same step is appended to that file under its own heading, which names its finding or quotes the part of the step's text it is for.`

**W5.** A part worded "find the cause of X and fix it". Result: it is a part that asks for a cause to be found, and the run is not refused. This is the expected result.
- `35` (above): "in each part of it that asks for a cause to be found, in whatever words"; the fix stays out of main by `184`.

**W6.** A defect in text. Result: the brief gets the red command as a check and no case from the diagnosis. This is the expected result.
- `164:    - A defect in text is fixed by reading, with the text quoted before and after and no test.`, `117:     - The diagnosis's red command becomes a check of the brief's "Verify before you report".`, `118:     - Its test, where the diagnosis wrote one, becomes a case of the brief with its failing run.`

**W7.** A cause not found. Result: `diagnose` raises it as an open item; `spec` leaves it out of the brief; a step with no other item stops, and the stop has its row. The two texts agree. This is the expected result.
- `153:    - Inside a plan, a cause not found is raised to the user as an open item, the one `plan-orchestration`'s "Stops" row "A finding that is the user's" leaves.`, `155:    - A cause not found is never sent to the builder.` against `119:     - A cause it cannot find is left out of the brief.`, `120:     - Such a cause is raised to the user as an open item.`, `121:     - A step with no other item stops there, as "Steps / A stop" says.` and the row `285:| A cause not found | The diagnosis of a part of the step's text that asks for a cause ends with the cause not found, and the step has no other item (Steps 4) | The open item, booked in the open items, with the diagnosis record's path | A ruling |`

**W8.** A red command that is green on main. Result: the diagnosis records "false premise", `/spec` handles it by its Steps 2, and the diagnosis goes to Steps 21 and 22. This is the expected result.
- `108:   - For `premise`, a command that drives the code path of the symptom and is green on main's head shows a false premise, and neither the stop "No red command" nor the cause not found then applies.`, `109:   - The record's Cause section then says "false premise", with the green runs quoted.`, `110:   - `/spec` handles the false premise as its Steps 2 says.`, `111:   - The diagnosis then goes to Steps 21 and 22, without Steps 5 to 20 and 23.`
- `skills/spec/SKILL.md`: `115:     - A diagnosis that ends on a false premise is handled as Steps 2 handles a premise found false.`, `81:   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.`, `84:   - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.`
- The scratch copy: `189:22. Clean up, keeping the record.` is reached by `111`. The record's words: `skills/diagnose/templates/diagnosis.md` line 78; the booking's: `skills/land/SKILL.md` line 93.

**W9.** `/spec` run a second time after a stop or a wait at its Steps 5. Result: the cause stands in Step 0 and is not investigated again; the record and Step 0 are among the session's own records that `spec` Steps 1 and 5 keep. This is the expected result.
- `114:     - A cause that stands in the step's Step 0 already is not investigated again.`, `122:     - The diagnosis record and what the diagnosis wrote in the step's Step 0 are among the session's own records (Steps 1).`, `123:     - A step that waits at Steps 5 keeps them.`
- `137:     - This run leaves only what a diagnosis of Steps 4 wrote: its record and its lines in the step's Step 0. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).`, `138:   - `plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made.`, `139:   - What the diagnosis of Steps 4 wrote in the step's Step 0 is then written into `plan.md` again.`, `65:     - A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.`, `147:   - It holds the brief, the brief check's report, the patch of a step taken back out of main, and each of the session's own records (Steps 1).`
- Step 0 is now restored by an explicit line (139); the restore no longer rests on line 65 alone.

**W10.** `grep -n "step's worktree\|dispatch entry\|report\|finding\|the round\|builder" skills/diagnose/SKILL.md` was read again on the tree after the round (36 hits; the lines the round changed among them are 63 to 65 and 108 to 111 and are read below). Result: no sentence is made false for `premise`.
- Names its forms: lines 16, 18, 34, 41, 43, 44, 48 to 50, 78 to 80, 85, 86, 88, 90, 92, the Steps 20 bullets for a finding, a red line and a brief-check finding, and the Stops rows "No dispatch entry", "No report" and "No finding" (lines 227 to 229).
- Holds for `premise` because no worktree exists to change or share: line 3, line 72, `175:20. Inside a plan, hand the fix over by where the defect was found, and leave the step's worktree unchanged as "Rules" says.` and `248`.
- Holds for `premise` because the sentence names no form: `47`, `54` (`No such report or finding is a refusal ("Stops").`, true of the forms that have a report), `153` and `155` (a cause not found), `184`, and the Done-when of Steps 20, "the place the defect's source names", which for `premise` is Step 0 by line 183. Lines 108 to 111 hold no word the grep names except "the cause not found" and "false premise", which are the diagnosis's own terms.

## Round 1

| Item | Status | Output |
|---|---|---|
| 1. The stop's place in every list of `/spec`'s stops | DONE | `skills/spec/SKILL.md` line 276 `The first six rows are stops, which leave an open item as "Steps / A stop" says. ...`; row 285 (between the model row at 284 and the authority row) `| A cause not found | The diagnosis of a part of the step's text that asks for a cause ends with the cause not found, and the step has no other item (Steps 4) | The open item, booked in the open items, with the diagnosis record's path | A ruling |`; `skills/ordo-help/SKILL.md` line 76 now reads `... the step contradicts an ADR (a rule clash), the cause its text asks for was not found and it has nothing else to build, or the brief-check agent was served a model other than the configured one ...`; `docs/figures/gen_figures.py` `586:                        "A cause not found, from /diagnose",` after `model_stop,`; `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/pipeline.svg (31211 bytes)` and `wrote docs/figures/plan-loop.svg (30868 bytes)`, exit 0 |
| 2. `diagnose` Steps 4, four bullets | DONE | `skills/diagnose/SKILL.md` lines 108 to 111, quoted in W8; the old bullet counts 0 |
| 3. `spec` Steps 4 false-premise bullet | DONE | `115:     - A diagnosis that ends on a false premise is handled as Steps 2 handles a premise found false.` after line 114 |
| 4. Record and booking words | DONE | `skills/diagnose/templates/diagnosis.md:78` ends `... and the condition that makes it not found; or for `premise` "false premise", with the green runs above>`; `skills/land/SKILL.md:93:   - It names each diagnosis record of the step (`agents/reviews/<step>-diagnosis.md`, one heading per diagnosis) with its cause, or with "cause not found" and the open item it was raised as, or with "false premise".` |
| 5. `spec` Steps 5 | DONE | lines 137 and 139 quoted in W9; line 137's second sentence is unchanged |
| 6. One rule per bullet | DONE | `122:` and `123:` of `skills/spec/SKILL.md` (W9); `skills/diagnose/SKILL.md` `65:   - The first fills the record as opened.` |
| 7. `diagnose` Steps 22 | DONE | `190:    - Inside a plan, a session run by hand that ends before the next command of the sequence commits by path each ledger file the diagnosis wrote (the record, `plan.md`, the state file).` first under line 189 `22. Clean up, keeping the record.`, before its two Done-when lines |
| 8. `diagnose` Steps 2 line 64 | DONE | `64:` quoted in W4 |
| 9. `diagnose` "What it reads" 5 line 52 | DONE | `52:` quoted in W1 |
| 10. "its part" gets its antecedent | DONE | `skills/diagnose/SKILL.md:63:` (W4); `skills/diagnose/templates/diagnosis.md` line 3 ends `... which names its finding or quotes the part of the step's text it is for.` and line 7 holds `with the part of the step's text that asks for the cause quoted` |
| 11. `plan-orchestration` line 332 | DONE | `332:- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper` for manuscript content, and `/roadmap` at the closing) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.` |
| 12. Part 3 whole lines | DONE | part 3 of this report quotes each output line of R2, R3 and R5 whole, with no "..." |
| Check 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md`, exit 0, printed the ten command lines with `PASS: land.sh scratch tests`, `PASS: checks.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: git_guard.py scratch tests`, `PASS: person-driven.sh scratch tests`, `PASS: transcript_window.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests`, and ended `checks: 11 commands passed` (the ASCII command's line is `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'` with no output) |
| Check 2 | DONE, one count is 2 | Each round text was written as the one line of a file under `$TMPDIR` and checked with `grep -c -F -f`. Printed `count 1` for: `1 spec six`, `1 spec row`, `1 ordo-help`, `2a`, `2b`, `2c`, `2d`, `3`, `4a`, `4b`, `5a`, `5b`, `6a`, `6b`, `6c`, `7`, `8`, `9`, `10a template`, `10a skill`, `10b`, `11`. Printed `1 figures docs/figures/gen_figures.py count 2`: the label line is in the file twice, `586:                        "A cause not found, from /diagnose",` (new, the `/spec` box) and `613:                        "A cause not found, from /diagnose",` (in the file before this round, the "close them" box); the new line is in its place once. The replaced texts printed `count 0 exit 1` for `old six`, `old 108`, `old 121`, `old 65`, `old 64`, `old 52`, `old leaves nothing`, `quotes its part D`, `quotes its part TM`, `with that part quoted`, `old 4b land`, `old 11` |
| Check 3 | DONE | `python3 docs/figures/gen_figures.py` exit 0 twice; `git status --short` and `git diff --stat docs/figures` after the second run compare equal to those after the first (`cmp` exit 0 both); `grep -o 'viewBox="0 0 1040 [0-9]*"' docs/figures/plan-loop.svg` printed `viewBox="0 0 1040 889"`; `cmp docs/figures/pipeline.svg <copy taken before the round>` exit 0 and `git diff --stat` lists no `pipeline.svg`; `rsvg-convert docs/figures/plan-loop.svg -o "$TMPDIR/plan-loop.png"` exit 0. The render read: the `/spec` box lists six stops under "only when", the last "A cause not found, from /diagnose", inside the box; the other five boxes and the lower cards are where they were |
| Check 4 | DONE | `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py` printed `All checks passed!`; `ruff format --check --line-length 100 docs/figures/gen_figures.py` printed `1 file already formatted` |
| Check 5 | DONE | `git diff --stat`: `docs/figures/gen_figures.py | 1 +`, `docs/figures/plan-loop.svg | 2 ++`, `docs/glossary.md | 2 +-`, `skills/diagnose/SKILL.md | 30 +++++++++++++++++++++++-------`, `skills/diagnose/templates/diagnosis.md | 8 ++++----`, `skills/land/SKILL.md | 2 +-`, `skills/ordo-help/SKILL.md | 4 +++-`, `skills/plan-orchestration/SKILL.md | 4 ++--`, `skills/repo-setup/templates/plan-terms.md | 2 +-`, `skills/spec/SKILL.md | 17 ++++++++++++++---`, `10 files changed, 52 insertions(+), 20 deletions(-)`. `LC_ALL=C grep -n '[^ -~]'` over the nine text files (the ten minus the SVG) printed nothing, exit status 1. `git diff -U0 | grep -c -P '^\+.*\t'` printed `0`; the trailing-space grep over the skills and glossary printed nothing |
| Check 6 | DONE | The `spec` Stops table has the rows: A false premise the plan cannot absorb, A rule clash with an ADR, A user-visible choice, A brief check finding the brief cannot absorb, A model other than the configured one, A cause not found (six), then A step without the user's authority and the refusals; line 276 says six. `git grep -n 'false premise' -- skills` printed `skills/diagnose/SKILL.md:108`, `:109`, `:110`, `skills/diagnose/templates/diagnosis.md:78`, `skills/land/SKILL.md:93`, `skills/spec/SKILL.md:115` and `:280`; the hits 108 to 110 and `spec:115` send a false premise of `premise` to `/spec` Steps 2, the record and the booking say "false premise", and `spec:280` is the stop row for a false premise the plan cannot absorb, which Steps 2 reaches; no two disagree. Steps 4 of `diagnose` ends on its Done-when (line 112), Steps 22 on its two Done-when lines, Steps 4 of `spec` on line 123 and its item's remaining bullets, Steps 5 of `spec` on `145:   - Steps 5 is done when every finding of the brief check is closed in the brief, or when the step waits or has stopped.` |
| Check 7 | DONE | `git grep -n 'A cause not found\|cause not found' -- skills docs README.md ':!docs/figures/*.svg'` printed 21 hits: `docs/figures/gen_figures.py` 539, 586, 613; `docs/glossary.md` 21; `skills/diagnose/SKILL.md` 107, 108, 152, 153, 155 to 159, 217, 224, 225; `skills/diagnose/templates/diagnosis.md` 78; `skills/land/SKILL.md` 93; `skills/plan-orchestration/SKILL.md` 104; `skills/repo-setup/templates/plan-terms.md` 16; `skills/spec/SKILL.md` 285. Each was read against the row. The sentences that list `/spec`'s stops are `skills/spec/SKILL.md` "Stops" (now with the row), `skills/ordo-help/SKILL.md` line 76 (now with the clause) and `docs/figures/gen_figures.py` lines 579 to 587 (now with the label); `diagnose` 217, `plan-orchestration` 104 and 291 list their own skills' stops; none of `/spec`'s lists leaves the stop out |

## 5. The terms

Terms of `docs/glossary.md` that the diff adds, changes or uses, each in a sense its entry gives:

- **premise**: the form's name in `skills/diagnose/SKILL.md` 35, 44, 46, 47, 52, 53, 64, 89, 108, 183, 230, `skills/spec/SKILL.md` 112, `skills/ordo-help/SKILL.md` 60, `skills/plan-orchestration/SKILL.md` 28; "a false premise" (`diagnose` 108 to 110, `spec` 115, `diagnosis.md` 78, `land` 93) is the entry's sense, a claim a step's text makes about the tree. The entry is unchanged as the brief says.
- **Step 0**: `diagnose` 52, 64, 183; `spec` 114, 122, 137, 139; `ordo-help` 61; the entry changed as item 10 says. The entry's "Stated in" places, as `grep -n 'Step 0'` prints them:
  - `spec`, "Steps / A stop": `skills/spec/SKILL.md:209:   - The same text under the step's Step 0 in `plan.md` or the part file it names.`
  - `spec`, "Steps / A ruling": `skills/spec/SKILL.md:224:   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;`
  - `land`, Steps 6: `skills/land/SKILL.md:77:     - It is recorded in the step's Step 0 in `plan.md`.`
  - `diagnose`, Steps 20: `skills/diagnose/SKILL.md:180:    - A red line: the step is already out of main (`landing: backed-out`), so the cause, the fix and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's new brief.` and, new, `skills/diagnose/SKILL.md:183:    - `premise`: the cause, the fix, the red command and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's brief.`
  - `spec` Steps 4 and 5 (114, 122, 137, 139) and `diagnose` "What it reads" 5 and Steps 2 (52, 64) use the term in the entry's sense and are not in the entry's "Stated in"; the brief keeps the rest of the entry as it is.
- **brief**: `spec` 112 to 123 and 137, `diagnose` 46, 89, 183, 230, `ordo-help` 61, in the entry's sense. **diagnosis record**: `spec` 116, 122, 137, `diagnose` 62, 183, 190, `land` 93, in the entry's sense. **red command**: `diagnose` 108, 183, `spec` 117, in the entry's sense. **dispatch entry**: `diagnose` 44, in the entry's sense. **open item**: `spec` 120 and the row 285, `diagnose` 153, in the entry's sense. **stop**: `spec` 121 and row 285, `ordo-help` 76, in the entry's sense. **refusal**: `diagnose` 53, 230 and "The last five rows are refusals.", in the entry's sense. **session, the** and its own records: `spec` 122, 123, 137, `diagnose` 190, in the entry's sense. **ledger**: `spec` 113, `diagnose` 190, in the entry's sense. **builder**: `diagnose` 184, in the entry's sense. **cause not found**: `spec` 119 and row 285, `diagnose` 108, in the entry's sense (the second list falsified, or no red command with no person present); `spec` row 285 uses it for a diagnosis that ends so. **booking**: `land` 93, in the entry's sense. **resume point** and **handover**: `diagnose` 190 relies on them through `plan-orchestration` line 158, in the entries' sense. **hypothesis**: `diagnose` 127, in the entry's sense. **Stops** is a section name. "Scratch copy" and "part" (of a step's text) have no glossary entry; the first is used as `diagnose` Steps 3 uses it and the second in the plain sense the brief's decision 14 states.

## 6. Sentences longer than the standards allow

The prose standard's limit is roughly 20 words unless the mechanism needs more. Counted by splitting each added line on spaces (markup and the marker included). Each text is dictated and left as given:

- `diagnose` 35 (34 words): what is read, the condition on the part, and that the wording does not decide it.
- `diagnose` 52 (35 words): the three places the step's text is read from, and the `spec` reading they follow.
- `diagnose` 63 (32 words): the old rule and the part the heading quotes.
- `diagnose` 64 (34 words): which part gets a diagnosis, when it does not, and in what order.
- `diagnose` 108 (37 words): the command, the false premise it shows, and the two ends that do not apply.
- `diagnose` 183 (30 words): four things written and where, and what they are for.
- `diagnose` 190 (33 words): which session commits, when, and which files.
- `diagnose` Stops opening line (36 words, old text; only "five" changed) and rows 228 to 230 (35, 43, 48 words): table rows, one phrase or sentence per cell.
- `diagnosis.md` line 3 (57 words in two sentences), the Symptom placeholder (55 words), line 78 (57 words) and line 112 (48 words): a placeholder lists in one bracket every form's content.
- `spec` 112 (28 words): the old sentence with the command in place of "read-only, and writes the found cause and its fix into the item".
- `spec` 137 (39 words): what the run leaves, and the old sentence on the brief.
- `spec` Stops opening line (43 words, old text; only "six" changed) and row 285 (53 words): a table row.
- `ordo-help` 61 (36 words) and 76 (91 words): the sequence block's text lines carry one clause per form or per stop; line 76 lists every stop of `/spec` in one line, as before (it had 75 words).
- `plan-orchestration` 28 (41 words): a table row. Line 332 (37 words, old text with one skill added).
- `land` 93 (34 words): the old sentence with four words added.
- **Step 0** entry (70 words): one definition listing what the place holds, as before (62).

## 7. Files with line counts

`wc -l` after the round, with `git diff --numstat` (added, removed):

- `skills/diagnose/SKILL.md`: 253 lines (23, 7)
- `skills/diagnose/templates/diagnosis.md`: 112 lines (4, 4)
- `skills/spec/SKILL.md`: 309 lines (14, 3)
- `skills/ordo-help/SKILL.md`: 108 lines (3, 1)
- `skills/plan-orchestration/SKILL.md`: 332 lines (2, 2)
- `skills/land/SKILL.md`: 206 lines (1, 1)
- `skills/repo-setup/templates/plan-terms.md`: 118 lines (1, 1)
- `docs/glossary.md`: 135 lines (1, 1)
- `docs/figures/gen_figures.py`: 742 lines (1, 0)
- `docs/figures/plan-loop.svg`: 164 lines (2, 0)
- `.scratch/2-f-diagnose/agents/reviews/2b-report.md`: this report.

The descriptions count 903 characters (`skills/diagnose/SKILL.md`) and 1022 (`skills/spec/SKILL.md`, unchanged), from `python3 -c 'import glob,yaml; ...'`.

## 8. Judgment calls

None. The insertions stand where the round brief names them, each dictated line was written by a script that asserted its old text occurs once, and `gen_figures.py` was run for the label as item 1 says.

## 9. Host- or user-visible changes, before and after

- Everything of the first round of the step stands as its previous report gave it: the description of `diagnose`, the fifth Quick start form, the `premise` reading in "What it reads", Steps 2, 3, 4 and 20, the Stops row "No part to investigate", the `spec` Steps 4 investigation, the `ordo-help` and `plan-orchestration` lines and the Step 0 entry.
- `spec` "Stops": before five stops and no row for a diagnosis ending in a cause not found, after six stops with the row "A cause not found".
- `ordo-help` `/spec stops` line: before it ends the list with "or the brief-check agent was served a model ...", after it also names "the cause its text asks for was not found and it has nothing else to build".
- `docs/figures/plan-loop.svg`: before the `/spec` box listed five stops, after six, the last "A cause not found, from /diagnose".
- `diagnose` Steps 4: before "a red command that is green on main's head shows a false premise, which goes to `/spec` as its Steps 2 handles one, and the diagnosis ends there", after four bullets: the command, the record's words "false premise", `/spec` Steps 2, and the route to Steps 21 and 22.
- `diagnose` Steps 22: a first sub-bullet says a hand-run session that ends before the next command of the sequence commits by path each ledger file the diagnosis wrote.
- `diagnose` Steps 2: a diagnosis is run only for a part whose cause does not stand in Step 0; the second sentence on the later diagnosis's heading is no longer in a bullet of its own ("The first fills the record as opened.").
- `spec` Steps 4: before one bullet for the record and Step 0, after two; a bullet says how a false premise is handled. `spec` Steps 5: before "This run leaves nothing.", after "This run leaves only what a diagnosis of Steps 4 wrote: its record and its lines in the step's Step 0." with a bullet that writes the Step 0 lines into `plan.md` again.
- `diagnosis.md` and `land` Steps 9: "false premise" is a value of the Cause section and of the booking's record line.
- `plan-orchestration` Rules: the list of skills the loop invokes names `/diagnose`.

## 10. Anything wrong or impossible in this round's text, with the evidence

No dictated text was reworded. Two points for the orchestrator:

1. **Count in check 2.** The label of item 1, `"A cause not found, from /diagnose",`, is in `docs/figures/gen_figures.py` twice (`grep -n 'A cause not found, from /diagnose' docs/figures/gen_figures.py` printed lines 586 and 613); line 613 is the "close them" box's own label, present before the round. The round's line is in its place once; the check's count of 1 cannot hold for that file.
2. **Two statements on committing the record.** `skills/diagnose/SKILL.md` line 66 says the record "is written to disk in the main checkout and not committed on its own" and line 190, added by item 7, says a hand-run session that ends commits it by path. Line 190 is the handover case (`skills/plan-orchestration/SKILL.md` line 158 lists a handover as a resume point that commits the session's records), and `skills/spec/SKILL.md` line 307 allows a commit at a resume point; the texts do not contradict, and line 66 does not name the exception.
