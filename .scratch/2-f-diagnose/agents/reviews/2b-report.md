# Step 2b report: the form `/diagnose <entry> <step> premise`, and `spec` Steps 4 pointing at it

Everything in the brief is done. Part 10 lists six points in the dictated texts that the orchestrator rules on; none of them changes a walk's expected result, and no dictated text was reworded.

## 2. Open items of the state file

`grep -n -i 'open items' -A6 .scratch/2-f-diagnose/orchestrator-state.md` prints, under "## Open items (only what the user must rule on: ...)":

```
none
```

## 3. The first read of R1 to R5, on the unchanged tree (before any change)

- R1: `grep -c 'premise' skills/diagnose/SKILL.md` printed `0`, exit status 1. `skills/diagnose/SKILL.md` names no form `premise`.
- R2: `sed -n 112,114p skills/spec/SKILL.md` printed:
  ```
     - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item.
       - A cause it cannot find is left out of the brief.
       - Such a cause is raised to the user as an open item.
  ```
  `grep -n '/diagnose' skills/spec/SKILL.md` printed lines 117 and 254 only (`   - For a step taken back out of main, whose Step 0 in ...` and `   - A finding whose cause is not known is diagnosed with `/diagnose <entry> <step> brief check <n>` before it is closed in the brief.`). Line 112 names no command for the investigation.
- R3: `sed -n 59,61p skills/ordo-help/SKILL.md` printed the `/spec <entry> <step>` line, then `/diagnose <entry> <step> brief check <n>` with its text on the next line; no form `premise`. `grep -n 'premise' skills/ordo-help/SKILL.md` printed only line 74, `/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, ...`, which uses the word in the glossary's sense and names no form. `sed -n 28p skills/plan-orchestration/SKILL.md` printed `| A finding, a red line or a brief-check finding whose cause is not known, diagnosed by hand | `/diagnose <entry> <step> <finding>`, `red line` or `brief check <n>` |`; no form `premise`.
- R4: `sed -n 104p skills/repo-setup/templates/plan-terms.md` and `sed -n 109p docs/glossary.md` printed the same text: `- **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, a red line's cause found by `/diagnose`, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6; `diagnose`, Steps 20.` The entry names only a red line's cause.
- R5: `grep -n -i 'part\|step.s text' skills/diagnose/templates/diagnosis.md` printed lines 56 and 58 (`... <the part of the case cut: an input, a caller, ...` and `The shrunk case, as it stands: <each part left, each one needed for the red>.`), both about a case of a diagnosis. `grep -c 'premise' skills/diagnose/templates/diagnosis.md` printed `0`. The template has no words for a part of a step's text.

All five held as the brief states them.

## 4. DONE / NOT DONE

### What to build

| Item | Status | Proof |
|---|---|---|
| 1. description clause | DONE | `skills/diagnose/SKILL.md` line 3 ends the sentence "leaves the step's worktree unchanged and hands the fix over by where the defect was found."; old clause count 0 (check 2) |
| 2. Quick start line | DONE | `19:/diagnose <entry> <step> premise           find the cause a step's text asks for, before the step's brief is written`, text in column 44 as the four lines above it |
| 3. What it reads | DONE | lines 35 (item 1 third sub-bullet), 44 (item 3), 46 (item 4 sub-bullet), 47 (item 5 line), 52 and 53 (item 5 sub-bullets, after the `red line` sub-bullet at 51 and before "No such report or finding is a refusal" at 54) |
| 4. Steps | DONE | line 63 (Steps 2 sentence), 64 and 65 (Steps 2 sub-bullets), 89 (Steps 3, after 88), 108 (Steps 4, before "Done when" at 109), 180 and 181 (Steps 20, after the brief-check bullet at 179 and before "Done when" at 182) |
| 5. Stops | DONE | opening line "The last five rows are refusals."; second cells of "No report" and "No finding" changed; row 226 `No part to investigate` is the last row |
| 6. diagnosis.md | DONE | line 3 ends "which names its finding or quotes its part."; the Symptom placeholder and line 112 changed as the item gives |
| 7. `spec` Steps 4 | DONE | lines 112 to 121 of `skills/spec/SKILL.md`: the new first line, five new sub-bullets (113 to 117), the two old sub-bullets unchanged (118, 119), two new sub-bullets (120, 121) |
| 8. `ordo-help` sequence | DONE | `60:/diagnose <entry> <step> premise` and its text line at column 31, after line 59 and before the `brief check <n>` form (now line 62) |
| 9. `plan-orchestration` row | DONE | `28:| A finding, a red line or a brief-check finding whose cause is not known, or a cause a step's text asks to have found, diagnosed by hand | `/diagnose <entry> <step> <finding>`, `red line`, `brief check <n>` or `premise` |` |
| 10. Step 0 entry | DONE | changed in `skills/repo-setup/templates/plan-terms.md` line 104 first, then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`, exit 0; `docs/glossary.md` line 109 |

### Verify before you report

1. DONE. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md` from the worktree's root, exit 0, printed:
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
   $ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
   ok: the plan-terms block equals the template
   $ sh utils/pin.test.sh 2>&1 | tail -1
   PASS: pin.sh scratch tests
   $ sh utils/check_coverage.test.sh 2>&1 | tail -1
   PASS: check_coverage.py scratch tests
   $ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
   checks: 11 commands passed
   ```
2. DONE. Each dictated line was written as the one line of a file under `$TMPDIR` (its text after the indent and the numeral or bullet marker) and `grep -c -F -f <that file> <target>` was run on its target file by a script kept under `$TMPDIR`. Every line printed `count 1`: items 1 to 5 (19 lines) in `skills/diagnose/SKILL.md`; item 6 (3 lines) in `skills/diagnose/templates/diagnosis.md`; item 7 (10 lines, the two old sub-bullets included) in `skills/spec/SKILL.md`; item 8 (2 lines) in `skills/ordo-help/SKILL.md`; item 9 in `skills/plan-orchestration/SKILL.md`; item 10 printed `10-tmpl skills/repo-setup/templates/plan-terms.md count 1` and `10-gloss docs/glossary.md count 1`. The replaced texts printed, each with exit status 1:
   ```
   d-desc skills/diagnose/SKILL.md count 0 exit 1
   d-l42 skills/diagnose/SKILL.md count 0 exit 1
   d-4rows skills/diagnose/SKILL.md count 0 exit 1
   d-noreport skills/diagnose/SKILL.md count 0 exit 1
   d-nofinding skills/diagnose/SKILL.md count 0 exit 1
   spec112 skills/spec/SKILL.md count 0 exit 1
   po-row skills/plan-orchestration/SKILL.md count 0 exit 1
   term-tmpl skills/repo-setup/templates/plan-terms.md count 0 exit 1
   term-gloss docs/glossary.md count 0 exit 1
   ```
3. DONE. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
4. DONE. `git diff --stat`:
   ```
    docs/glossary.md                          |  2 +-
    skills/diagnose/SKILL.md                  | 26 +++++++++++++++++++-------
    skills/diagnose/templates/diagnosis.md    |  6 +++---
    skills/ordo-help/SKILL.md                 |  2 ++
    skills/plan-orchestration/SKILL.md        |  2 +-
    skills/repo-setup/templates/plan-terms.md |  2 +-
    skills/spec/SKILL.md                      |  9 ++++++++-
    7 files changed, 35 insertions(+), 14 deletions(-)
   ```
   `LC_ALL=C grep -n '[^ -~]'` over the seven files printed nothing, exit status 1. `git diff -U0 | grep -c -P '^\+.*\t'` printed `0` (no literal tab); `git diff -U0 | grep -n '^+.*[[:space:]]$'` printed nothing (no trailing space). `git status --short` lists the seven files only; the report is the eighth path, in the untracked ledger.
5. DONE. The diff was read in full; each added line stands where its item says (the table above gives the neighbours). The walks follow.
6. DONE. `git grep -n '/diagnose' -- skills docs README.md`, read hit by hit. The hits inside `skills/diagnose/SKILL.md` are the skill itself. Outside it, each of `README.md` 41, 49, 56, 60, `skills/ordo-help/SKILL.md` 25, 66 (was 64), 83 (was 81), 89 (was 87), `skills/land/SKILL.md` 24, `skills/refute/SKILL.md` 23, `skills/session-retro/SKILL.md` 25, `skills/spec/SKILL.md` 124 and 261 (were 117 and 254), `skills/plan-orchestration/SKILL.md` 102 and 119 names the form its own sentence is about, and `docs/dev/building.md` 11, `docs/dev/change-standard.md` 72, `docs/figures/*` name the skill's test or the skill generally. The sentences that list the forms inside a plan are `skills/ordo-help/SKILL.md` 60 to 66 (the sequence block, now with `premise` at 60), `skills/plan-orchestration/SKILL.md` 28 (now with `premise`), `skills/spec/SKILL.md` 112 (names `premise`) and `skills/diagnose/SKILL.md` 16 to 19. `skills/ordo-help/SKILL.md` line 25, `| A defect whose cause is not known | `/diagnose <symptom>`, or inside a plan `/diagnose <entry> <step> <finding>` |`, lists two forms for a defect whose cause is not known; a cause a step's text asks for is not a defect, and the brief keeps the line. `README.md` line 41 is the README's sequence block, which names the `<finding>` form only.
7. DONE. Part 6 names the sentences longer than the standards allow; part 10 point 4 names two bullets that join two requirements with "and".

### The walks, read on the changed tree

Each step below is the line the text gives, as `grep -n` prints it, whole.

**W1.** A step whose line holds one part "find why the sync check prints a stale block and end it", no brief, no dispatch entry, run by a person. Result: not refused; record `agents/reviews/<step>-diagnosis.md`; probes on a detached worktree at `HEAD` with nothing applied; the person shown the hypotheses and waited for; cause, fix, red command and record's path in Step 0; fix not made on main; `/spec` then writes them into the item with the red command as a check. This is the expected result.
- Not refused: `58:1. Inside a plan, refuse when "What it reads" 3 or 5 finds an input missing.` The step's line holds a part, so `52:   - For `premise`, the step's text: its line in the step list of `plan.md`, the rulings its tags name and what its Step 0 holds.` finds it and `53:   - For `premise`, a step's text with no such part is a refusal ("Stops").` does not apply. No brief and no dispatch entry are needed: `44:   - A brief-check finding and `premise` have no dispatch entry yet, and none is read for them.` and `46:   - For `premise` no brief is read.`
- The symptom: `35:   - For `premise`, what the step's text says happens, in each part of it that asks for a cause to be found, in whatever words, as "find why X happens and end it" does.` and `68:   - Done when the record exists and its Symptom section holds the symptom as "What it reads" 1 gives it, word for word.` The record path inside a plan: `62:   - Inside a plan, the record is `agents/reviews/<step>-diagnosis.md` beside the state file, a copy of `templates/diagnosis.md` filled as the steps below run.` (its number by `grep -n` is 62 in the file; the sub-bullet at 63 follows it).
- The probes: `72:   - Inside a plan, the probes run on a scratch copy under `$TMPDIR` that shares no file with the step's worktree.`, `73:   - `$tmp` is made by `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`, and the copy is a detached worktree made from the main checkout.` and `89:   - For `premise`, `<commit>` is `HEAD` and nothing is applied, since what the step's text says happens is on main.`
- The wait: `122:8. Show the red command, its output, the shrunk case and the hypotheses.`, `123:   - Run by a person, the skill shows them to the user.` and `126:9. Run by a person, wait for the user's reply before the first probe ("Stops").`
- The end: `180:    - `premise`: the cause, the fix, the red command and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's brief.` and `181:      - The fix is never made on main, since the step's builder makes it from the brief.`
- `/spec`: `112:   - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, with `/diagnose <entry> <step> premise`.`, `115:     - The found cause, its fix and the diagnosis record's path are written into the item.` and `116:     - The diagnosis's red command becomes a check of the brief's "Verify before you report".`

**W2.** The same with no person present, under `/spec` in the loop. Result: no wait, same end. This is the expected result.
- `124:   - With no person present, the skill writes the hypotheses into the record and goes on to Steps 11, and Steps 9 and 10 are not run.` and `243:- Who is present decides the waits: a person running the skill, by hand or inside a plan they run step by step, gets the waits of "Stops", and a session with no person present, under `plan-orchestration` or running `/diagnose <symptom>` on its own, gets none.` The steps from 11 on are as W1; Steps 20 (lines 180 and 181) ends it, and `112` of `spec` is the caller.

**W3.** A step whose text holds no such part. Result: refused by the row "No part to investigate", which names `/spec`. This is the expected result.
- `53:   - For `premise`, a step's text with no such part is a refusal ("Stops").` and `226:| No part to investigate | Inside a plan, for `premise`, the step's text holds no part that asks for a cause to be found | A refusal that names the step and quotes its text | `/spec <entry> <step>`, which writes the brief with no investigation |`
- Steps 1 (line 58) speaks of "an input missing"; the refusal for this case is reached through the sub-bullet at 53 and the Stops row, and the record is not opened (Steps 2 comes after Steps 1).

**W4.** Two parts, one in the step's line and one in a ruling its tag names. Result: two diagnoses, in the order of the step's text, the first in the record as opened and the second appended under a heading that quotes its part. This is the expected result.
- `52:` (above) puts the line first, then the rulings its tags name, then Step 0. `64:   - For `premise`, each part "What it reads" 5 finds gets a diagnosis of its own, in the order of the step's text.` and `65:   - The first fills the record as opened, and each later one is appended under a heading that quotes its part.` and `63:   - A later diagnosis of the same step is appended to that file under its own heading, which names its finding or quotes its part.`

**W5.** A part worded "find the cause of X and fix it". Result: it is a part that asks for a cause to be found, and the run is not refused. This is the expected result.
- `35:` (above): "in each part of it that asks for a cause to be found, in whatever words". The fix stays out of main by `181`, and the builder makes it from the brief by `180`.

**W6.** A defect in text. Result: the brief gets the red command as a check and no case from the diagnosis. This is the expected result.
- `161:    - A defect in text is fixed by reading, with the text quoted before and after and no test.`, `116:     - The diagnosis's red command becomes a check of the brief's "Verify before you report".` and `117:     - Its test, where the diagnosis wrote one, becomes a case of the brief with its failing run.` (no test, so no case).

**W7.** A cause not found. Result: `diagnose` raises it as an open item; `spec` leaves it out of the brief and a step with no other item stops; the two agree. This is the expected result.
- `150:    - Inside a plan, a cause not found is raised to the user as an open item, the one `plan-orchestration`'s "Stops" row "A finding that is the user's" leaves.` and `152:    - A cause not found is never sent to the builder.` against `118:     - A cause it cannot find is left out of the brief.`, `119:     - Such a cause is raised to the user as an open item.` and `120:     - A step with no other item stops there, as "Steps / A stop" says.` Point 1 of part 10 concerns where that stop is listed.

**W8.** A red command that is green on main. Result: the diagnosis ends and `/spec` handles a false premise by its Steps 2. This is the expected result.
- `108:   - For `premise`, a red command that is green on main's head shows a false premise, which goes to `/spec` as its Steps 2 handles one, and the diagnosis ends there.` against `81:   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.` and `84:   - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.` (`skills/spec/SKILL.md`). Point 2 of part 10 concerns the scratch copy this path leaves.

**W9.** `/spec` run a second time after a stop or a wait at its Steps 5. Result: the cause stands in Step 0 and is not investigated again; the record and Step 0 are among the session's own records that `spec` Steps 1 and 5 keep. This is the expected result, reached through two lines of Steps 1 and 5 read together.
- `114:     - A cause that stands in the step's Step 0 already is not investigated again.` and `121:     - The diagnosis record and what the diagnosis wrote in the step's Step 0 are among the session's own records (Steps 1), and a step that waits at Steps 5 keeps them.`
- `60:   - The preparation commit carries the session's own records (Steps 6).`, `65:     - A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.` and `144:   - It holds the brief, the brief check's report, the patch of a step taken back out of main, and each of the session's own records (Steps 1).`
- `136:   - `plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made.` read alone drops what the diagnosis wrote after that copy was taken (`64:   - `plan.md` is copied aside to the session's scratch folder before Steps 2.`); line 65 is what makes the restore carry the own records. Point 3 of part 10.

**W10.** `grep -n "step's worktree\|dispatch entry\|report\|finding\|the round\|builder" skills/diagnose/SKILL.md` printed 36 lines (3, 16, 18, 34, 41, 43, 44, 47 to 50, 54, 63, 72, 78, 79, 80, 85, 86, 88, 90, 92, 150, 152, 172, 173, 175, 176, 178, 179, 181, 182, 223, 224, 225, 244 in the file's numbering after the change; the lines were read whole in the terminal). Each was read. Result: no sentence is made false for `premise`. Each either names the forms it applies to or holds for `premise`:
- Names its forms: 16, 18, 34, 41, 43, 44, 48 to 50, 63, 78 to 80, 85, 86, 88, 90, 92, 173, 175, 176, 178, 179 and the Stops rows 223 to 225.
- Holds for `premise` because no worktree exists to change or share: `3` ("leaves the step's worktree unchanged"), `72` ("shares no file with the step's worktree"), `172` ("leave the step's worktree unchanged"), `244` ("the step's worktree is never changed and every probe runs on the scratch copy of Steps 3").
- Holds for `premise` because the sentence names no form and applies to a diagnosis in general: `47` (`5. Inside a plan, the report the finding is in, or for `premise` the step's text.`), `54` (`No such report or finding is a refusal ("Stops").`, true of the forms that have a report), `150` and `152` (a cause not found; the row named in 150 is the open-item mechanism, as it is for a brief-check finding), `181` (`The fix is never made on main, since the step's builder makes it from the brief.`), `182` ("the place the defect's source names", which for `premise` is Step 0 by line 180).

## 5. The terms

Terms of `docs/glossary.md` that the diff adds, changes or uses, each in a sense its entry gives:

- **premise**: `35`, `47`, `52`, `53`, `64`, `89`, `108`, `180` of `skills/diagnose/SKILL.md` name the form `premise`; in `108` "a false premise" is the entry's sense (a claim a step's text makes about the tree, here that X happens). The form's name is code, not a new term; the entry is unchanged as the brief says.
- **Step 0**: `skills/diagnose/SKILL.md` 52, 180; `skills/spec/SKILL.md` 114, 121; `skills/ordo-help/SKILL.md` 61; entry changed as item 10 says. The entry's "Stated in" places, as `grep -n 'Step 0' skills/spec/SKILL.md skills/land/SKILL.md skills/diagnose/SKILL.md` prints them:
  - `spec`, "Steps / A stop": `skills/spec/SKILL.md:206:   - The same text under the step's Step 0 in `plan.md` or the part file it names.`
  - `spec`, "Steps / A ruling": `skills/spec/SKILL.md:221:   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;`
  - `land`, Steps 6: `skills/land/SKILL.md:77:     - It is recorded in the step's Step 0 in `plan.md`.`
  - `diagnose`, Steps 20: `skills/diagnose/SKILL.md:177:    - A red line: the step is already out of main (`landing: backed-out`), so the cause, the fix and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's new brief.` and, new, `skills/diagnose/SKILL.md:180:    - `premise`: the cause, the fix, the red command and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's brief.`
  - The new uses in `skills/spec/SKILL.md` 114 and 121 are in Steps 4, which the entry's "Stated in" does not name; the brief keeps "the rest of the entry" as it is.
- **brief**: `spec` 112 to 121, `diagnose` 89, 180, 226, in the entry's sense. **diagnosis record**: `spec` 115, 121, `diagnose` 180, in the entry's sense. **red command**: `diagnose` 108, 180, `spec` 116, in the entry's sense. **dispatch entry**: `diagnose` 44, in the entry's sense. **open item**: `spec` 119, in the entry's sense. **stop**: `spec` 120, "Steps / A stop", in the entry's sense. **refusal**: `diagnose` 53, 226, "The last five rows are refusals.", in the entry's sense. **session, the** (own records): `spec` 121, in the entry's sense. **ledger**: `spec` 113, in the entry's sense. **builder**: `diagnose` 181, in the entry's sense. **Stops** is a section name. "scratch copy" has no glossary entry and is used as `diagnose` Steps 3 uses it.
- "Part" (of a step's text) has no glossary entry and is used in the plain sense the brief's decision 14 states.

## 6. Sentences longer than the standards allow

The prose standard's limit is roughly 20 words unless the mechanism needs more. Counted with `wc -w` style over each added line (markup and the bullet marker included). Each is dictated text, left as given:

- `diagnose` 35 (34 words): "For `premise`, what the step's text says happens, in each part of it that asks for a cause to be found, in whatever words, as "find why X happens and end it" does." One sentence: it says what is read, the condition on the part and that the wording does not decide it.
- `diagnose` 63 (25 words): one sentence carrying the old rule and the new "or quotes its part".
- `diagnose` 52 (25 words): lists the three places the step's text is read from.
- `diagnose` 64 (23 words): says what each part gets and in what order.
- `diagnose` 108 (31 words): a red command green on main, what that shows, where it goes and that the diagnosis ends; see part 10 point 4 for the "and".
- `diagnose` 180 (30 words): four things written and where, and what they are for.
- `diagnose` Stops opening line (36 words): the first two sentences are the old text; only "five" changed.
- `diagnose` Stops rows 224, 225, 226 (35, 43, 48 words per row): table rows, cells hold a phrase or a sentence each; the "When" cell of 226 has 19 words.
- `diagnosis.md` line 3 (50 words, two sentences of 22 and 28 words), the Symptom placeholder (46 words) and line 112 (48 words): a template placeholder lists every form's content in one bracket.
- `spec` 112 (28 words): the old sentence with the command in place of "read-only, and writes the found cause and its fix into the item".
- `spec` 121 (32 words): what is a record and what happens at Steps 5; see part 10 point 4.
- `ordo-help` text line (36 words): the sequence block's text lines are one clause per form, like the neighbours (the `brief check <n>` text is 28 words).
- `plan-orchestration` 28 (41 words): a table row.
- **Step 0** entry (70 words): one definition that lists what the place holds, as before (the old entry had 62).

## 7. Files with line counts

Counted with `wc -l` after the change, with `git diff --numstat` (added, removed):

- `skills/diagnose/SKILL.md`: 249 lines (19 added, 7 removed)
- `skills/diagnose/templates/diagnosis.md`: 112 lines (3, 3)
- `skills/spec/SKILL.md`: 305 lines (8, 1)
- `skills/ordo-help/SKILL.md`: 108 lines (2, 0)
- `skills/plan-orchestration/SKILL.md`: 332 lines (1, 1)
- `skills/repo-setup/templates/plan-terms.md`: 118 lines (1, 1)
- `docs/glossary.md`: 135 lines (1, 1)
- `.scratch/2-f-diagnose/agents/reviews/2b-report.md`: this report.

The description of `skills/diagnose/SKILL.md` counts 903 characters after the change, `skills/spec/SKILL.md` 1022 (unchanged), from `python3 -c 'import glob,yaml; ...'` over `skills/*/SKILL.md`.

## 8. Judgment calls the brief left open

None. The only choices were mechanical: the sub-bullets of item 4 Steps 2 and Steps 4 stand at the depth the brief's fences give them (three spaces under a one-digit numeral, four spaces and six under Steps 20), and each dictated line was taken from the brief's own fences with the fence indent removed, by a script that asserted each dictated text occurs once in its file before writing it.

## 9. Host- or user-visible changes, before and after

- `skills/diagnose/SKILL.md` description: before "... hands the fix to the builder as the round's ruling." after "... hands the fix over by where the defect was found."
- Quick start: before four forms, after five (`/diagnose <entry> <step> premise           find the cause a step's text asks for, before the step's brief is written`).
- "What it reads": before one form of a step's text unread, after `premise` read from the step's line, its tags' rulings and its Step 0, with no brief and no dispatch entry.
- Steps 2, 3, 4 and 20 and "Stops": before no form for a cause a step's text asks for, after the form as described in the walks; the Stops table has ten rows, the last five refusals.
- `skills/spec/SKILL.md` Steps 4: before "the session writing the brief does it first, read-only, and writes the found cause and its fix into the item", after the session runs `/diagnose <entry> <step> premise` and carries the cause, the fix, the red command and the record's path into the brief.
- `skills/ordo-help/SKILL.md` sequence block: two lines added for `premise`. `skills/plan-orchestration/SKILL.md` "Use instead": the row names `premise`.
- Glossary **Step 0**: before "a red line's cause found by `/diagnose`," after "a cause found by `/diagnose`, a red line's or one the step's text asks for,".

## 10. Anything in the brief that was wrong or impossible, with the evidence

No dictated text was reworded and no line outside the brief's paths was changed. The orchestrator rules on these:

1. **A stop that `spec` does not list.** `skills/spec/SKILL.md` 120, dictated: `A step with no other item stops there, as "Steps / A stop" says.` The `spec` Stops table's first five rows are the stops (`273:The first five rows are stops, which leave an open item as "Steps / A stop" says. ...`), and none of them, nor the sequence block's `/spec stops` line at `skills/ordo-help/SKILL.md` 76, names a cause not found for a step with no other item. Lines 270 to 290 of `skills/spec/SKILL.md` read for "cause", "investigat" and "diagnos" show no such row (the only hits are the refusal sentence at 273 and the last row's "The cause put right"), and `sed -n 76p skills/ordo-help/SKILL.md | grep -c -i 'cause\|diagnos\|investigat'` printed `0`. A row in the `spec` Stops table and a clause in `ordo-help` 76 are outside this step's paths (`skills/spec/SKILL.md` lines 112-114, `skills/ordo-help/SKILL.md` lines 59-60). The option: an addition to this step's paths that adds the row and the clause. The lazy option would be to leave the stop unlisted.
2. **The false-premise path leaves the scratch copy.** `diagnose` 108 ends the diagnosis at Steps 4, after Steps 3 made the detached worktree (`73`, `77`). Steps 22 removes the copy (`186:22. Clean up, keeping the record.`), and the no-person path from Steps 4 reaches it through `107` and `154` (`After a cause not found the skill goes to Steps 21 and 22`), but 108 names no route to Steps 21 and 22. A detached worktree stays registered in the main checkout's `.git/worktrees`. The fix would be a phrase in 108 (for example, "goes to Steps 21 and 22"), a change to a dictated text.
3. **`spec` Steps 5 line 136** says `plan.md` "is put back from the copy Steps 1 saved", which was taken before the diagnosis wrote Step 0 (`64`). Line 65 ("restores it with the session's own records") and the dictated line 121 make the walk W9 come out as expected, but the restore of Step 0 rests on the two together. A clause in 136 naming the session's own records would put it in one place.
4. **Lists and tables rule.** `skills/diagnose/SKILL.md` 108 and `skills/spec/SKILL.md` 121 each join two requirements with "and" (the false premise goes to `/spec`, and the diagnosis ends there; the records are among the session's own, and a step that waits keeps them); `docs/dev/skill-layout.md`, "Lists and tables", first bullet, makes two requirements joined by "and" two bullets. Both are dictated.
5. **A `/diagnose premise` run by hand in another session than the `/spec` run.** `diagnose` Steps 2 and 20 leave the record and Step 0 uncommitted (`66`, `67`, `180`), and `skills/spec/SKILL.md` 63, `An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal ("Stops"), named by path.`, refuses them in a session that did not make them. The brief's decision 3 says the form works run by hand before `/spec`; that holds in the session that runs `/spec` next, and after a commit of the ledger files by path.
6. **The pointer at `diagnose` 150** names the `plan-orchestration` row "A finding that is the user's", whose "When" cell (`289` of `skills/plan-orchestration/SKILL.md`) lists findings; a premise's cause not found is not one. The open item is the same object as for a brief-check finding, which the same line already covers.
