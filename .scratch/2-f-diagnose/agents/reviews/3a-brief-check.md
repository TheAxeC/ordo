# Brief check: step 3a of plan 2.F, on main at 82e1036

The brief is `/Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/agents/briefs/3a.md`. The brief has 22 findings: 20 are "brief", 1 is "user" (F21), and 1 has a brief part and a user part (F8).

The work ran on a scratch clone under `$TMPDIR` (`git clone --no-hardlinks`), which is removed: `ls -d` on it prints "No such file or directory". `git status --short` in the repository prints the same three lines as at the start.

Every item of "What to build" was applied on the clone by a script that counts each anchor. It printed "every anchor found exactly once, at the line the brief names".

Results of the brief's own checks on the clone, after the application:

- **Sync.** `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`, exit 0. The same without `--write` printed `ok: the plan-terms block equals the template`, exit 0.
- **Check 1.** `checks.sh` printed the eleven commands and `checks: 11 commands passed`, exit 0.
- **Check 2.** Every dictated line counts 1 in its file, except the table separator row (F16). Each of the thirteen replaced texts counts 0.
- **Check 3.** `grep -c '^[0-9]*\. '` prints 41 for the whole file, and "Steps" holds 1 to 25 in order.
- **Check 4.** `ok`, exit 0.
- **Check 5.** The ASCII grep prints nothing, exit 1.
- **Check 6.** 918.
- **Check 7.** `git diff --stat` shows five files: the three under `skills/diagnose`, `plan-terms.md` and `docs/glossary.md`.
- **Check 8.** Every reference names the right item (see R9 under "Cases and checks").

Findings are numbered F1 to F22. Each gives its place, the rule it breaks, the consequence, the replacement and who closes it. Line numbers of the skill are main's.

## Names

Commands: `git grep -n -i 'diagnos' -- skills docs README.md agents utils ':!skills/diagnose' | grep -E 'Steps? [0-9]'`, `git grep -n -E "diagnose.{0,40}Steps [0-9]|Steps [0-9]+.{0,30}diagnose" -- . ':!.scratch' ':!skills/diagnose'`, and `git grep -n -i 'hypothes\|unshrunk\|original case\|fewer than three\|Not covered\|Other cases'` outside the skill and the two glossary files.

- **Items 16 to 24 of `diagnose`.** Outside `skills/diagnose` the only hits that name one are the entries **case, of a diagnosis** and **Step 0**, in `plan-terms.md` (lines 15, 104) and `docs/glossary.md` (lines 20, 109). The brief changes both. No skill, page, figure or script names another.
- **"three to five hypotheses".** `README.md:20` and `docs/roadmap.md:31` stay true.
- **The new headings "Other cases" and "Not covered".** No hit outside the brief's paths.
- **`skills/land/SKILL.md:93`.** The booking names each diagnosis record "with its cause". That stays true, and it does not carry "Not covered" (F8).
- **`.scratch/2-g-git-guard/agents/briefs/2b.md:24`.** It quotes `skills/diagnose/SKILL.md:176` for the `git worktree remove --force` line. That line is 192 on main and 209 after this step. Step 2b writes no file of this brief, so this is a note for whoever reruns 2b's premise.

Findings: none beyond F8.

## The step line

Each part of the step's line and each clause of the ruling has an item:

| Part of the line or ruling | Items |
|---|---|
| Three to five hypotheses always, one stating the rule the code breaks; the sentence allowing fewer removed | 1, 10 (Hypotheses), 11 (line 43) |
| The other inputs that reach the cause run through the red command; the fix and its test cover each red one | 2, 3, 5 (first bullet), 8, 10 (Other cases) |
| A control and the repository's verification commands after the fix | 5, 10 (Runs after the fix) |
| What the fix does not cover, in the final message and the record | 6, 7, 10 (Not covered), 11 (line 29) |
| Words the change for any defect, names no path or slash | R10 |
| Check: text read in place, sync exits 0 | Verify 4, 9, 10 |

**F19 (brief). "Decisions" omits five additions beyond the ruling.**
- Rule: the brief's heading "each reversible, none silent".
- Consequence: a reviewer cannot tell a ruled clause from a choice of the brief.
- The five additions:
  - "at least two other cases" in item 1; the ruling gives no count.
  - "each further case the code at the cause treats as it treats the symptom's case" in item 3; the ruling names only the cases the hypothesis predicts.
  - A red case may be left under "Not covered" with a reason; the ruling says "the fix and its test cover each one that is red".
  - The control is "a case ... whose result must stay as it is"; the ruling says "an input near the fix that must still pass".
  - The step changes `references/person-driven.md`, `plan-terms.md` and `docs/glossary.md`; the ruling names two files.
- Replacement: five Decisions, one per addition, each with its reason.

**F14 (brief). The new text uses "case" in a sense its entry does not give.** This concerns Decision 1.
- Rule: `docs/dev/skill-layout.md`, "Writing for an agent": a term in a new sense gets its entry changed first.
- What the entry says: **case, of a diagnosis** is "the scenario that reproduces a symptom". The new text calls a green other case and the control "a case", and neither reproduces the symptom.
- "the symptom's case" is a third name beside the entry's "original case" and the **shrunk case**.
- Consequence: a reader cannot tell which case the red command's variant replaces.
- Replacement, part 1: write "the shrunk case" for "the symptom's case" in items 1, 3 and 8.
- Replacement, part 2: in `plan-terms.md` line 15, after "before it is shrunk.", add: "An other case is a scenario the stated cause predicts reproduces the same symptom, and it stays a case when its run is green. The control is a case outside the defect."
- Vocabulary is the user's under `spec` Stops "A user-visible choice". The earlier steps of this plan booked such terms as an orchestrator ruling "for Axel to overrule", and the same booking fits here.

## Premises

Every command of "What is on the tree" was rerun. These reproduce:

- The ruling is at `plan.md` line 52 and the step at line 27.
- The skill has 254 lines and 24 items at lines 58 to 200. Sub-bullets are indented three spaces for items 1 to 9 and four for 10 to 24; nested ones at lines 67, 178, 179, 182 and 185 sit two deeper.
- Lines 119 to 125, 151 to 161, 174, 175, 187 to 189 and 194 to 198 read as quoted.
- The reference grep gives lines 99, 112, 158, 159, 188 and 241 and no other item from 16 to 24.
- The Anti-patterns table is lines 234 to 244, with "A guard for a fix" at 242.
- `person-driven.md` line 20 reads as quoted.
- `diagnosis.md` has 112 lines, with its headings at 60, 76, 80, 94 and 106.
- The four glossary entries are at `plan-terms.md` 15, 29, 43, 104 and `docs/glossary.md` 20, 34, 48, 109. Sync prints `ok`.
- `README.md:20` and `docs/roadmap.md:31` read as quoted.
- `docs/adr` holds `README.md` and `template.md`.

**F17 (brief). The description's length is miscounted.** Place: "What is on the tree", second bullet, and Decision 8.
- What the tree shows: `awk` prints 918 for the whole of line 3, key and quotes included. The count `skill-layout.md` defines, the parsed YAML value, is 903 (`python3 -c 'import yaml; ...'`).
- Consequence: Decision 8's "918 of its 1,024 characters" is wrong by 15.
- Replacement: "line 3 has 918 characters, and its description 903 as `docs/dev/skill-layout.md` counts it", and in Decision 8 "it has 903 of its 1,024 characters".

**F18 (brief). The run did not cite line 124.** Place: the bullet "What the comparison showed".
- What the record shows: side one wrote "Two hypotheses, not three ... Only the two texts that line compares remain as possible causes" (record lines 83 to 85). It used the sentence and named no line.
- Replacement: "listed two hypotheses, under the sentence of line 124".

## Cases and checks

R1, R6, R7, R9 and R10 read as met on the clone. For R9, every reference names the item it named before:

- Skill line 99 names Steps 17, the test.
- Line 112 names "22 and 23, without 5 to 21 and 24".
- Line 160 names "22 and 23, then 24; 24 and 25 not run".
- Line 161 names Steps 23, the cleanup.
- Line 205 names Steps 25.
- Line 258 names Steps 18, the red run of the test.
- `person-driven.md:20` names Steps 23.
- The glossary names "6, 7, 8, 16, 17, 20 and 23" and "Steps 21".
- `diagnosis.md` names no item.

The walk found these points.

**F1 (brief). Two bullets of Steps 15 contradict each other.** Place: item 2. Cases: R2, R1.
- Rule: change standard rule 19, no two statements that contradict.
- The contradiction: the new bullet says that when the rule hypothesis and a narrower one both stand, the cause is the rule. The unchanged next bullet says the cause is not found "when no probe can separate the hypotheses left".
- Why it bites: the scope hypotheses that item 1 creates cannot be separated by a probe, since each one's change turns the red command green on the symptom's case. Step 3's real run shows that shape: both of its hypotheses were green on `//`.
- Consequence: inside a plan with no person present, the second reading raises an open item to the user for a cause that was found.
- Replacement for item 2: "- Hypotheses left standing that differ only in how much the cause covers are not a cause not found: the cause is stated as the rule the code breaks, and Steps 16 shows how far it reaches."
- Replacement in `plan-terms.md` line 16: "when no probe separates the hypotheses left" becomes "when no probe separates the hypotheses left and they differ in more than how much the cause covers". The paths widen by `plan-terms.md` line 16 and `docs/glossary.md` line 21.
- Tested: the bullet placed on the clone, once, ASCII clean.

**F2 (brief). R4 cannot finish Steps 20.** Place: items 3 and 5.
- Item 3 says both "A case that is red ... the fix of Steps 19 ends it" and "A red case the fix will not end is written in ... 'Not covered'".
- Item 5's "Done when" needs "each case Steps 16 found red" green. A case under "Not covered" stays red, so Steps 20 is never done and the run stops before Steps 22, where R4 expects it to go on.
- The test and fix rules also sit in item 16, not in the items that do the work. Rule: `skill-layout.md`, "Where a rule goes".
- Consequence of that placement: a test holding only the symptom's case meets the "Done when" of Steps 17, 18 and 20.
- Replacements:
  - Item 16: "- A case that is red is part of the defect."
  - Steps 17, new bullet: "- The test also reproduces each case Steps 16 found red, except a case the record's "Not covered" section names."
  - Steps 19, new bullet: "- The fix also ends each case Steps 16 found red, except a case the record's "Not covered" section names."
  - Steps 20 "Done when": "Done when the test, the red command, the original case and each case Steps 16 found red that "Not covered" does not name are green, the control's output is the same with the fix as without it, and the verification commands pass, each quoted in the record."
- Tested: the first three placed on the clone, each once.
- Open point for a Decision: "with the reason" sets no limit on which red case may go to "Not covered". A run can list every other red case there, which is the shape of the removed line 124. The brief should state the limit or say none is set.

**F3 (brief). A mixed result has no rule, and R3 has two readings.** Place: item 3, "When each other case is green".
- Some cases red and some green: the Cause section keeps a rule that predicted a green case.
- All green with two narrower hypotheses standing (item 1 creates "the symptom's case alone" and "the cases like it"): "the narrower hypothesis that stands" names neither.
- Replacement: "- When a case the rule predicted red is green, the record's Cause section is rewritten to cover the shrunk case and each red case and no green one, with the probe of the narrowest hypothesis that holds them."
- R3's expectation then reads "its Cause section is rewritten to cover the shrunk case alone".
- Tested: placed once on the clone.

**F4 (brief). "at least two other cases" contradicts item 16's "has no other case".** Place: item 1.
- Item 3's "Done when" and the template allow "the cause has no other case". Steps 7 always demands two.
- Consequence: a rule with one other case, or none, forces invented cases.
- Replacement: "...and names the other cases that the rule predicts are red, at least two, or each one with the reason the rule has no more." The same words go in the "Done when" of item 1.
- Tested on the clone.

**F5 (brief). The control cannot be run as written, and R8 can pass by reading while the run misses the overreach.** Place: item 5, the control; item 10, the template line.
- Steps 20 runs after Steps 19 put the fix in the tree, and no sentence says how the run "without it" is made. Outside a plan that tree is the user's checkout, where a session could stash or revert.
- "result" has two readings. Read as the red command's red or green, a fix that refuses a legitimate input is unchanged, since the red command asserts only the symptom.
- Replacements:
  - Steps 18, new bullet: "- The control of Steps 20 is chosen and run on the same tree, and its output quoted."
  - Steps 20: "- The control is run again with the fix: a case near the fix that is outside the defect, chosen so that a fix that reaches too far changes its output."
  - Template: "<the control, its output on the tree without the fix and its output with it; for a defect in text, "no control">".
- Tested: both bullets placed once.

**F6 (brief). The verification commands have no rule in a repository that lists none, and their source is not an input.** Place: item 5.
- Outside a plan, a repository without `.agents/plan.yaml` has neither page, so "the verification commands pass" cannot be reached.
- "What it reads" 2 lists no verification page. Rule: `skill-layout.md`, "What it reads", one input per item.
- Replacements:
  - Item 5: "...as its rules file or its verification page lists them, and the record says so when the repository lists none."
  - "What it reads" 2, new sub-bullet: "- The verification page `.agents/plan.yaml` names, when the repository has it, for the commands of Steps 20."
- Tested: the first placed once.

**F7 (brief). After a cause not found or a false premise, the message opens as if a fix covered everything.** Place: item 6; item 10, "Not covered". Cases: R5, R6.
- Steps 22 runs in both cases. Its new bullet then opens the message with "nothing known" and a count of 0 other cases, although no fix exists.
- The template's "Not covered" has no value for the two cases, while "Other cases" has "not applicable".
- Replacements:
  - Item 6, second bullet: "- After a cause not found, and after a false premise, the message opens with that instead."
  - Template: append `; after a cause not found or a false premise, "not applicable"` inside the placeholder.

**F8 (brief, with one part for the user). Inside a plan, what the fix does not cover reaches nobody.** Place: Decision 5 and the unchanged Steps 21 and 24.
- With no person present inside a plan, Steps 22 sends no message.
- The repair round's ruling "quotes the hypotheses with their results, the cause, the fix, both runs of the test and the record's path". The record is in the main checkout, outside the builder's worktree.
- Step 0 for a red line and for `premise` carries the cause, the fix and the record's path.
- Consequence: the red other cases and "Not covered" are not in any hand-over, and the builder's fix is checked by the red command on the symptom's case alone.
- Replacements (brief):
  - Steps 21, new bullet before "Done when": "- Each hand-over names, with the fix, the cases Steps 16 found red and each case of the record's "Not covered" section with its reason."
  - Steps 24 "Done when": "...inside a plan, when the record's path, the cause and each case of "Not covered" are written for the landing's booking."
- The user's part: `land` Steps 9 (line 93) books each record "with its cause" only. Adding "Not covered" there widens the paths to `skills/land/SKILL.md`, a change of scope.

**F9 (brief). Item 7 puts two rules in one bullet.** Place: item 7.
- The changed sentence has 45 words, and "when the record holds one" now has two things it could refer to. Rule: `skill-layout.md`, one rule per bullet.
- Replacement: line 195 stays as it is, and one bullet follows it: "- The bullet also names each case of the record's "Not covered" section, with its reason."
- Check 2 then counts the new bullet, not a changed sentence.

**F10 (brief). A symptom seen only sometimes and a slow symptom have no rule at item 16.** Place: item 3.
- For a symptom seen only sometimes, one green run marks a case "outside the defect".
- For a slow symptom, red is a threshold from the symptom's case's baseline, which another case does not share.
- Replacement, two bullets:
  - "- For a symptom seen only sometimes, each other case is run as many times as the failure rate of Steps 4 was measured over, and is red when it fails in any of them."
  - "- For a slow symptom, each other case gets its own baseline and threshold, as Steps 4 says."
- Tested: both placed once.
- A red command a person drives has a rule: `references/person-driven.md` line 19 makes each run one run of the script. The session writes one actions file per other case.

**F11 (brief). A defect in text has no reading at Steps 7 and no red at item 16.** Place: items 1 and 3.
- "the rule the code breaks" names code a text defect does not have.
- "The red command is run on each ... asserting the same symptom" has no run for a place in text, since the red of a text defect is a transcript line (Steps 4).
- Replacements:
  - Steps 7, new bullet: "- For a defect in text, the rule is the one the text states wrongly or leaves out, and the other cases are the other places where the same wording or rule stands."
  - Item 16's bullet on text ends: "...found with a grep and read, and a place is red when the reading finds the same defect there."

**F12 (brief). A cause that comes from the second list has no rule.** Place: item 3, "the hypothesis of Steps 7 that states the rule".
- When every hypothesis of the first list is falsified, the cause comes from the list of Steps 14. No sentence asks that list for a rule hypothesis, so item 16's first clause points at a falsified one.
- Replacements:
  - Steps 14, new bullet: "- The second list holds a hypothesis that states the rule the code breaks, as Steps 7 says."
  - Item 16: "those the hypothesis that states the rule named, in the list the cause came from".

**F13 (brief). "each further case" has no end.** Place: item 3, second bullet.
- For a class with unlimited members, "Done when ... holds each case" cannot be met or checked.
- Replacement: "...and one more case for each further kind of case the code at the cause treats as it treats the shrunk case."

**F15 (brief). The new Anti-patterns row misnames the failure.** Place: item 8.
- A fix for the symptom's case alone is correct when every other case is green (R3).
- No step points at the row, as every other row is pointed at (lines 94, 97, 135, 140, 169, 172).
- Replacements:
  - The row: `| A fix made without running the other cases | The other cases that reach the cause stay red, and the defect comes back under another case | Run the red command on each other case before the fix, as Steps 16 says |`
  - Steps 19, new bullet: "- A fix made without running the other cases is an Anti-patterns row."
- Tested: the bullet placed once.

**F20 (brief). Item 16 restates a jump.** Place: item 3, "After a cause not found, and after a false premise, this item is not run".
- Lines 112 and 158 already send both cases past item 16. Rule: `skill-layout.md`, "A rule is written once".
- Replacement: drop the bullet and Decision 9. R5 and R6 then read "item 16 is not reached".

The Stops table and the Rules need no change: no row or rule names an item from 16 to 24, and the scratch-copy rule covers the runs of items 16 and 20 inside a plan.

## The question

Every check of "Verify before you report" can pass while the goal of the ruling is not reached.

- Checks 1 to 8 are facts about placement, counts and sync. They hold for any text placed as dictated, F1 to F13 included.
- Checks 9 and 10 are readings by the builder of text the brief dictates. R4 as written is unmet on the clone (F2), which the builder's first read should report as a hand-back.
- The goal is a run under the changed skill that states the wider cause, covers each red case, runs a control and says what is left. Only a run shows it. The plan says so at its line 17: "the second run of step 4 shows what a run under the changed text does". The brief asks for no run, which fits a text step.
- What the brief can still ask for is cases on the inputs below, so the reading reaches the sentences a run would stop at.

**F16 (brief). Check 2 cannot hold as written.** Place: check 2.
- The dictated row `|---|---|---|` counts 3 in `diagnosis.md` with `grep -c -F`. It also matches the four-column row of "Probes".
- Replacement: add "The separator row of a table is left out of this check."

**F21 (user). The ruled wording on verification commands lets the run skip a command the comparison counted.**
- The ruling says "the repository's verification commands that read the changed files".
- Side one wrote "Not run: the other suites ... The change touches only the two pin files" (record line 198). Judge 2 counted the missing `check_coverage.test.sh` against it.
- Consequence: under the ruled wording a run may skip that suite again in the second comparison.
- Options: (a) keep the ruled wording; (b) "the repository's verification commands, all of them, as its rules file or its verification page lists them". Option (b) costs more time per diagnosis and matches what the judge counted. Option (a) is the cheaper one.

## Implied inputs

This is a text step, so these are reading cases. Each is missing from "Cases", and a wrong answer costs a wrong fix or a stop.

| Case to add | Input | Expected result | Finding |
|---|---|---|---|
| R11 | Some other cases red, some green | The Cause section covers the red ones only | F3 |
| R12 | The rule has no other case, or one | Steps 7 and item 16 agree | F4 |
| R13 | A symptom seen only sometimes; a slow symptom | Each has a rule at item 16 | F10 |
| R14 | A reviewer's finding inside a plan with one red other case and one case "Not covered" | The round's ruling names both | F8 |
| R15 | The cause comes from the second list | Item 16 has its cases | F12 |
| R16 | A repository with no rules file and no verification page | Steps 20 is done | F6 |
| R17 | The rule hypothesis and a narrower one both stand | The run reaches Steps 16, not the cause not found | F1 |
| R18 | A cause not found, run by a person | The message of Steps 22 does not open with "nothing known" | F7 |

One more input has no finding text above: the user's reply at Steps 10 drops the rule hypothesis. Item 16's second clause still gives the other cases, so the run goes on. The brief should say in R2 or a Decision that this is intended.

## ADRs

`ls docs/adr` prints `README.md` and `template.md`. No record exists, so none touches the step, and the brief's "No ADR touches this step" holds.

Findings: none.

## Dictated text

Read against `skill-layout.md`, the prose standard and the glossary.

- **One rule per bullet.** F2 and F9. The remaining bullets hold one rule each.
- **Completion line last.** Items 1, 3 and 5 end on "Done when". Item 6 adds a rule that Steps 22's "Done when" does not name; replacement: "Done when the user has been shown the record, or the final message names its path, under the opening the first bullet gives." This is closed with F7.
- **Terms.** F14 for "case" and "the symptom's case". "control" is defined in its own sentence and is no glossary term. "verification page" and "rules file" are used in their entries' senses. **red command** is "the one command"; running it "with that case in place of" another is a variant, which the entry change of F14 should cover in one clause.
- **No path or wording of one repository or of the comparison's defect.** None found: no "slash", "spelling", "folder", "pin" and no repository path in any added line.
- **ASCII, tabs, hard wraps.** Clean on the clone.

**F22 (brief). Sixteen dictated sentences run past 20 words.**
- Rule: prose standard E, "under roughly 20 words unless the mechanism needs more".
- The longest: item 5's "Done when" (42 words), item 1's second bullet (39), item 6's bullet (39), item 1's "Done when" (37), the control (34), item 1's first bullet (33).
- Check 9 has the builder keep a dictated sentence and report it, so the length is the brief's to shorten.
- Replacement for item 1's second bullet, in two: "- When the shrink and the code leave fewer than three places that can hold the cause, the hypotheses differ in how much the cause covers." and "- The three are then the shrunk case alone, the cases like it, and the rule the code breaks."
- The replacements of F2, F5 and F9 shorten the other long ones.

Claims the dictated text makes about the tree: "Steps 13 left" names the undo; "Steps 17", "Steps 19" and "Steps 16" in the new text name the test, the fix and the new item after the renumbering. Each was checked on the clone.

## Shared files

- **`.scratch/2-e-grill/agents/briefs/9a.md`.** Its "Paths this step writes" holds `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` whole. Both are files of this brief, so both are shared paths.
  - Its item 1 changes `plan-terms.md` line 20 (**commit rule**), adds an entry between lines 74 and 75 (**quoted ruling**), and changes lines 91 (**ruling**) and 92 (**rulings file**).
  - In `docs/glossary.md` those are lines 25, a new line after 79, 96 and 97. Its item 2 changes line 133 (**mark, of a figure**).
  - This brief changes `plan-terms.md` lines 15, 29, 43 and 104, and `docs/glossary.md` lines 20, 34, 48 and 109. With F1 it also changes lines 16 and 21.
  - No line is changed by both. 9a's new entry moves this brief's line 104 to 105 and 109 to 110 when 9a lands first. This brief places each change by quoted text, so that does not break it.
  - The brief names neither file as shared. `spec` Steps 5 has the dispatch entry carry them under `shared_paths`.
- **`.scratch/2-g-git-guard/agents/briefs/2b.md`.** Its paths are `git_guard.py`, `git_guard.test.sh`, `skills/repo-setup/SKILL.md` line 126, `README.md` line 13, `docs/dev/building.md` line 10 and its report. None is a file of this brief. Its line 24 quotes a line number of `skills/diagnose/SKILL.md`, as noted under "Names".

## Declined to judge

- Whether a second run of step 4 under the changed text wins or ties. Only that run and the user's call show it.
- Whether "at least two", the limit on "Not covered" and "no control for a defect in text" are the right design. Each is a choice the brief lists, or should list under F19, for the user to overrule.
- The replacements of F7, F8, F9, F11, F12, F13, F14 and F16 were not placed on the clone. The clone was removed after the ten placements named under F1 to F6, F10 and F15.
- After those ten placements the clone gave: 41 numbered lines, the ASCII grep empty, the description line at 918, and sync `ok`.
- The installed copies of the skills under `~/.claude/skills` were not read.
- `.agents/worktrees/` was not read, as instructed.

Agent usage: claude-opus-5-5 (ordo-high), 203037 tokens, 29 tool uses, 827 s ($1.45 to $5.00).

## Closed (the session's change to the brief for every finding above; a second check of the rewritten brief follows before the preparation commit)

- F1: item 4 is the reviewer's bullet, placed after the bullet on the cause not found, and item 17 changes the entry **cause not found** (Decision 4); the paths gain `plan-terms.md` line 16 and `docs/glossary.md` line 21.
- F2: item 5 says only "A case that is red is part of the defect."; items 7 and 9 give the test and the fix their own bullets; the "Done when" of item 10 leaves out a case "Not covered" names. The limit: a red case goes to "Not covered" only when no change at the cause can end it (Decision 7).
- F3: item 5 has the reviewer's bullet for a case the rule predicted red that is green; R3 and R11 read against it.
- F4: item 2 names the other cases "at least two, or each one with the reason the rule has no more" (Decision 5, R12).
- F5: item 8 has the control chosen and run at Steps 18 without the fix, item 10 runs it again with the fix and compares its output, and the template line gives both outputs (Decision 8, R8).
- F6: item 10 has the record say so when the repository lists no verification command, and item 1 adds the verification page to "What it reads" 2 (R16).
- F7: item 12 has the message open with the cause not found or the false premise, and the template's "Not covered" has "not applicable" for both (R5).
- F8, the brief's part: item 11 has each hand-over of Steps 21 name the red cases and the cases "Not covered" (R14). The user's part is the open item "Step 3a, the booking of what a fix does not cover".
- F9: line 195 stays and item 13 adds one bullet after it.
- F10: item 5 has a bullet for a symptom seen only sometimes and one for a slow symptom (R13).
- F11: item 2 has the bullet for a defect in text, and item 5's bullet on text says when a place is red (R7).
- F12: item 3 gives the second list a rule hypothesis, and item 5 takes the cases "in the list the cause came from" (Decision 11, R15).
- F13: item 5 adds "one more case for each further kind of case" (Decision 6).
- F14: "the shrunk case" stands for "the symptom's case" in every dictated text, and item 17 adds the other case, the red command's run on it and the control to the entry **case, of a diagnosis** (Decision 1).
- F15: item 14 is the reviewer's row, and item 9 points at it (Decision 13).
- F16: check 2 leaves the separator row of a table out.
- F17: the premise gives 918 for line 3 and 903 for the description, and Decision 15 says 903.
- F18: the premise says "under the sentence of line 124".
- F19: Decisions 5, 6, 7, 8 and 14.
- F20: the bullet is dropped; R5 and R6 say item 16 is not reached.
- F21: raised to the user as the open item "Step 3a, which verification commands the run after the fix runs"; item 10 holds the ruled wording until the ruling (Decision 10).
- F22: the bullets of items 2 and 12 are split; Decision 16 names the two sentences that stay over 30 words.
- The input of a reply that drops the rule hypothesis: Decision 12 and R17.

# Second brief check: step 3a of plan 2.F, the brief as it stands on main at ddca4b7

The brief is `/Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/agents/briefs/3a.md`, read whole at ddca4b7 (items 1 to 18, cases R1 to R18, the two rulings booked). It has 23 new findings, G1 to G23: 20 are "brief" and 3 are "user" (G7, G16, G21). Of the first check's 22 findings, 20 are closed, F4 is closed except in one completion line (G9), and F22 is not closed (G14). Nothing the first check closed is newly broken by its closure; two defects sit in the rewritten text itself (G1, G12).

All work ran on clones under one `mktemp -d` folder in `$TMPDIR`, now removed: `ls -d` on it prints "No such file or directory". `git status --short` in the repository prints the same two lines as at the start, and `git rev-parse --short HEAD` prints ddca4b7. No command was refused.

## Closures of the first check

Each verdict is from the brief's text read against the finding, and from the clone with items 1 to 18 applied.

| Finding | Verdict | Evidence |
|---|---|---|
| F1 | closed | Item 4's bullet stands after the bullet "The cause is not found when"; item 17 changes line 16 of `plan-terms.md`; paths hold lines 15-16 and 20-21. Remainder for a list with no rule hypothesis: G2. |
| F2 | closed | Item 5 holds only "A case that is red is part of the defect."; items 7 and 9 carry the test and fix bullets; item 10's "Done when" leaves out a case "Not covered" names; Decision 7 sets the limit. |
| F3 | closed | Item 5's bullet "When a case the rule predicted red is green"; R3 and R11. A red case the rule did not predict has no rule: G3. |
| F4 | closed in the bullet, not in the completion line | Item 2's second bullet reads "at least two, or each one with the reason the rule has no more". The first check also asked for the same words in the "Done when"; it still ends "with its other cases": G9. |
| F5 | closed | Item 8 (control chosen and run at Steps 18), item 10 (run again, output compared), the template line with both outputs. Order of the exception for text: G4. |
| F6 | closed | Item 10 "and the record says so when the repository lists none"; item 1 adds the verification page to "What it reads" 2. |
| F7 | closed | Item 12's third bullet; both template placeholders carry "not applicable". The placement of item 12's bullets: G1. |
| F8 | closed | Brief part: item 11. User part: ruling (a), items 13 and 18. What `spec` carries: G7. The round's check: G6. |
| F9 | closed | Line 195 stays; item 13's first bullet follows it. |
| F10 | closed | Item 5's bullets for a symptom seen only sometimes and for a slow symptom. |
| F11 | closed | Item 2's third bullet; item 5's bullet on text ends "a place is red when the reading finds the same defect there". |
| F12 | closed | Item 3; item 5 "in the list the cause came from". |
| F13 | closed | Item 5 "for each further kind of case". |
| F14 | closed | `grep -c "symptom's case"` over the added lines of the clone prints 0; item 17 adds the three sentences. |
| F15 | closed | Item 14's row; item 9's second bullet points at it. |
| F16 | closed | Check 2 holds "The separator row of a table is left out of this check."; on the clone that row counts 3 and every other dictated line counts 1. |
| F17 | closed | `awk` prints 918; the parsed YAML value has 903; Decision 15 says 903. |
| F18 | closed | The premise reads "under the sentence of line 124". |
| F19 | closed for the five it named | Decisions 5, 6, 7, 8 and 14. Further unlisted additions: G15. |
| F20 | closed | No dictated line restates the jump; R5 and R6 read "item 16 is not reached". |
| F21 | closed by ruling (b) | Item 10's sentence and the template's line equal option (b) word for word; Decision 10. |
| F22 | not closed | Items 2 and 12 are split, but seven dictated sentences over 30 words are not in Decision 16: G14. |
| The reply that drops the rule hypothesis | closed | Decision 12 and R17. Its effect at Steps 15: G2. |

## Names

Commands on main: `git grep -n -i 'diagnos' -- skills docs README.md agents utils ':!skills/diagnose' | grep -E 'Steps? [0-9]'`; `git grep -n -E "diagnose[^.]{0,80}Steps [0-9]+|Steps [0-9]+[^.]{0,40}of .diagnose" -- . ':!.scratch' ':!skills/diagnose'`; `git grep -n -i 'Not covered\|Other cases\|other case\|the control\b' -- . ':!.scratch' ':!skills/diagnose'`; `git grep -n -i 'diagnos' -- skills/plan-orchestration skills/land skills/refute skills/ordo-help skills/spec/SKILL.md docs/dev README.md`.

- Items 16 to 24 of `diagnose`: outside `skills/diagnose` only the entries **case, of a diagnosis** and **Step 0** name one, in both glossary files. The brief changes both.
- "Other cases", "Not covered", "other case": no hit outside the brief's paths (one unrelated hit of "the control" in `skills/ordo-init/templates/check_config.test.sh:184`).
- `README.md:20` and the `diagnose` description stay true.
- `plan-terms.md` and `docs/glossary.md` are whole-file paths of step 9a of plan 2.E, which is in flight (`dispatch:` block of `.scratch/2-e-grill/orchestrator-state.md`). 9a adds an entry between lines 74 and 75, which moves this brief's lines 104 and 109 by one when 9a lands first. The brief names neither file as shared; `spec` Steps 5 has the dispatch entry carry them. `skills/land/SKILL.md` is in no brief of a step in flight.

**G11 (brief). The entry "booking" is left behind by item 18.**
- Place: item 18; `plan-terms.md` line 9 and `docs/glossary.md` line 14, "the diagnosis records with their causes".
- Rule: change standard rule 14, a change carries to every place that names it.
- Consequence: the glossary lists what a booking holds and omits the cases a fix does not cover, which `land` Steps 9 now books.
- Replacement: "the diagnosis records with their causes," becomes "the diagnosis records with their causes and the cases their fixes do not cover,". Paths gain `plan-terms.md` lines 9-9 and `docs/glossary.md` lines 14-14. Tested on the clone: counts 1 in each file after `sync_rules.py --write`, sync prints `ok`.

**G7 (user). `spec` does not carry the red other cases into a brief.**
- Place: item 11, for a red line and for `premise`; `skills/spec/SKILL.md` Steps 4, outside the paths.
- What the tree says: `spec` writes into the item "The found cause, its fix and the diagnosis record's path", makes "The diagnosis's red command" a check, and for a step taken back out of main carries "the cause, the fix and the diagnosis record's path". None names the cases Steps 16 found red or "Not covered".
- Consequence: item 11 puts those cases in Step 0, and the step's brief can leave them out. The builder then makes a fix checked by the red command on the shrunk case alone.
- This is the same kind as F8's user part: a change to a file outside the paths. `skills/spec/SKILL.md` is a whole-file path of step 9a in flight.
- Options: (a) widen the paths to the three sentences of `spec` Steps 4, each gaining "the cases it found red and the cases under "Not covered"", and wait for 9a; (b) leave `spec` as it is, since it reads Step 0 whole. I do not judge which.

## The step line

Each part of the step's line and of its three rulings has an item:

| Part | Items |
|---|---|
| Three to five hypotheses always, one stating the rule; the sentence allowing fewer removed | 2, 3, 16 (Hypotheses), 17 (line 43) |
| The other inputs run through the red command; the fix and its test cover each red one | 4, 5, 7, 9, 14, 16 (Other cases), 17 (lines 15, 16) |
| A control and the verification commands at the run after the fix | 1, 8, 10, 16 (Runs after the fix) |
| What the fix does not cover, in the final message and the record | 11, 12, 13, 16 (Not covered), 17 (line 29) |
| Ruling "which verification commands", (b) | 10, 16; both sentences equal option (b) in `plan.md` "Step 0 of step 3a" |
| Ruling "the booking", (a) | 13 ("Done when"), 18; both equal option (a) |
| The renumbering | 6, 15, 17 (lines 15, 104) |
| Check: text read in place, sync exits 0 | Verify 4, 9, 10 |

No part is without an item.

**G12 (brief). Item 6 names the wrong range of items.**
- Place: item 6, "their text unchanged except as items 7 to 12 below say".
- Item 13 changes the text of the item "Write where the cause is kept." too.
- Consequence: two instructions of the brief contradict each other; a builder under change standard rule 4 reports it as a stop.
- Replacement: "except as items 7 to 13 below say".

**G15 (brief). "Decisions" omits additions beyond the rulings.**
- Rule: the heading "each reversible, none silent".
- Not listed: the rules for a defect in text at Steps 7 and 16 (item 2's third bullet, item 5's bullet on text); the rules for a symptom seen only sometimes and a slow symptom (item 5); the verification page added to "What it reads" 2 (item 1); the wording "nothing known" with a count (item 12, item 16).
- Replacement: one Decision per addition, each with its reason.

**G16 (user). Three Decisions depart from words of the user's ruling and are booked nowhere in `plan.md`.**
- Decision 1 writes the ruling's "other inputs" as the glossary term "other case" and names two sections of the record, "Other cases" and "Not covered". A vocabulary and a file's shape are user-visible choices under `spec` "Stops".
- Decision 7 lets a red case go uncovered; the ruling says "the fix and its test cover each one that is red".
- Decision 8 has the control's output stay the same, where the ruling says "must still pass", and gives a defect in text no control, where the ruling says the run "also runs a control".
- `grep -n 'Step 3a' .scratch/2-f-diagnose/plan.md` shows the two rulings and no line like "Step 2b, the brief's choices ... for Axel to overrule", which steps 2a and 2b have.
- Consequence: the user sees these choices only by reading the brief.
- Options: book them in Rulings as the orchestrator's decisions for the user to overrule, as steps 2a and 2b did, or raise them as an open item. I do not judge which, nor whether each choice is right.

No Decision takes another choice that is the user's.

## Premises

Every command of "What is on the tree" was rerun on main. `git diff --stat 82e1036 HEAD -- skills docs README.md utils agents` prints nothing, so the lines are the same at ddca4b7 as at the commit the heading names.

Reproduced, each quoted sentence checked with `sed -n <n>p | grep -c -F` printing 1:

- The ruling at `plan.md` line 52; its sentence "The brief words the change for any defect and names no path or slash." counts 1. The two new rulings are at lines 53 and 54.
- `wc -l` prints 254; `awk` prints 918; the parsed description has 903. 24 items at lines 58 to 200. Sub-bullets at three spaces for items 1 to 9 and four for 10 to 24; nested ones sit at five (67, 75 to 84) and six (178, 179, 182, 185), which the premise does not say and item 11 handles by naming the indent.
- Lines 37, 122, 124, 125, 149, 150, 152, 160, 161, 166, 168, 172, 174, 175, 186, 189, 195 and 198 read as quoted.
- The reference grep gives lines 99, 112, 158, 159, 188 and 241 for items 16 to 24, and no other.
- The Anti-patterns table is lines 234 to 244, "A guard for a fix" at 242.
- `person-driven.md` line 20; `diagnosis.md` 112 lines with headings at 60, 76, 80, 106, the placeholders at 62 to 64, "Runs after the fix" at 94, the original-case line at 99.
- `plan-terms.md` lines 15, 16, 29, 43, 104 and `docs/glossary.md` 20, 21, 34, 48, 109; sync prints `ok: the plan-terms block equals the template`, exit 0.
- `skills/land/SKILL.md` line 93 reads as quoted.
- `ls docs/adr` prints `README.md` and `template.md`.
- The comparison record: line 26 "Nothing is left open", line 85 "Two hypotheses, not three".

**G18 (brief). One quote is inexact.**
- Place: the bullet on `README.md` line 20 and `docs/roadmap.md` line 31.
- `docs/roadmap.md` line 31 reads "three to five ranked hypotheses", not "three to five hypotheses".
- Replacement: "`README.md` line 20 says "three to five hypotheses" and `docs/roadmap.md` line 31 "three to five ranked hypotheses", which stay true."

## Cases and checks

### The application on the clone

A script took each dictated text from the brief's fenced blocks (19 blocks) and placed it at the anchor its item names, counting each anchor. It printed "none: every anchor found exactly once, at the line the brief names". One item's place is ambiguous: item 12 (G1).

Outputs on the clone at ddca4b7 with items 1 to 18 applied:

- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`: `written: the plan-terms block now equals the template`, exit 0. Without `--write`: `ok: the plan-terms block equals the template`, exit 0.
- Check 1, `checks.sh`: the eleven `$ <command>` lines, each `PASS` or `ok`, then `checks: 11 commands passed`, exit 0.
- Check 2: 69 dictated lines and changed sentences counted; 68 give 1, the separator row gives 3 (left out by the check). The 19 replaced texts give 0, "with its cause, or with" in `skills/land/SKILL.md` among them.
- Check 3: `grep -c` prints 41; "Steps" holds 1 to 25 in order, each once.
- Check 4: `ok`, exit 0.
- Check 5: the ASCII grep prints nothing, exit 1; the same for `skills/land/SKILL.md`.
- Check 6: 918.
- Check 7: six files, `docs/glossary.md`, the three of `skills/diagnose`, `skills/land/SKILL.md`, `plan-terms.md`.
- Check 8: every reference names the item it named before. Skill line 100 names Steps 17; 113 "22 and 23, without 5 to 21 and 24"; 165 "22 and 23", "24", "24 and 25"; 166 Steps 23; 219 Steps 25; 273 Steps 18; `person-driven.md:20` Steps 23; the glossary "6, 7, 8, 16, 17, 20 and 23" and "Steps 21".

**G13 (brief). Check 2 does not count two replaced lines.**
- Place: check 2, the list of texts that give 0.
- Items 12 and 13 replace line 189 and line 198; neither is in the list.
- Consequence: a builder who leaves an old completion line beside the new one passes check 2.
- Replacement: add "line 189" and "line 198" after "line 175".

### The walk of R1 to R18, and the further walks

R1, R5, R6, R8, R9, R12 (one other case), R13, R14, R15, R16 and R18 read as met on the clone. The points found:

**G1 (brief). Item 12's place has two readings, and the one the words give changes the rule for a run with no person present.**
- Place: item 12, "three sub-bullets, the first three under the numbered line".
- Read as "directly under the numbered line", the clone reads: "After a cause not found, and after a false premise, the message opens with that instead." followed by the unchanged "With no person present outside a plan, the record's path is named in the session's final message instead".
- The second "instead" then reads as "instead of that opening". A run with no person present outside a plan, the setting of the comparison, can name the path and open with nothing.
- Replacement: "three sub-bullets after line 188, and its "Done when", line 189, replaced by the fourth". Tested: the unchanged bullet then comes first and the three follow it, each once.

**G2 (brief). Steps 15 names a rule hypothesis that may not stand.** Cases: R17, and a rule hypothesis a probe falsified.
- Place: item 4, "the cause is stated as the rule the code breaks".
- When the reply at Steps 10 drops the rule hypothesis and "the shrunk case alone" and "the cases like it" both stand, the bullet applies and no hypothesis in the list states the rule. Steps 15 asks for "the probe that shows it", and there is none.
- Consequence: R17 expects the run to go on; the session either invents a cause no probe shows or stops.
- Replacement: "- Hypotheses left standing that differ only in how much the cause covers are not a cause not found: the cause is stated as the widest of them, and Steps 16 shows how far it reaches." Tested, once.

**G3 (brief). A red case the rule did not predict leaves the Cause section as it was.** Case: R11.
- Place: item 5; the rewrite bullet fires only "When a case the rule predicted red is green".
- Item 5's second bullet adds cases the hypothesis did not name. When one is red, R11 expects the Cause section to cover it, and no sentence asks for that.
- Replacement, a bullet before "A red case that no change at the cause can end": "- A red case the rule did not predict is added to the record's Cause section." Tested, once.

**G4 (brief). A defect in text is told to choose a control before it is told it has none, and Steps 18's completion line does not name the control.** Case: R7.
- Place: items 8 and 10.
- A session at Steps 18 reads "The control of Steps 20 is chosen and run on the same tree"; the exception "A defect in text has no control." comes at Steps 20, after the verification bullet. Rule: `skill-layout.md`, "Lists and tables", a qualifier stays with its rule.
- Steps 18's "Done when" is unchanged, so it is met with no control run. At Steps 20 the fix is already in the tree and the run without it is gone.
- Replacements, each tested once:
  - Item 8: "- For a defect in code, the control of Steps 20 is chosen and run on the same tree, and its output quoted."
  - Line 170: "- Done when the record quotes a failure that shows the symptom, and the control's output, or, for a defect in text, quotes the text before."
  - Item 10: "A defect in text has no control." placed directly after the control's bullet.

**G5 (brief). Steps 20 has no rule for a run that is not as its completion line asks.** Cases: R4, R8, and a verification command that is red before the fix.
- Place: item 10.
- A case stays red with the fix, though Steps 16 did not put it under "Not covered": the completion line is unmet and no sentence sends the run back. R4 reaches its expected end only when the session foresaw the case at Steps 16.
- The control's output changes (R8): the case expects "the control shows it" and the skill says nothing of what follows.
- A verification command fails on the tree without the fix too. Inside a plan this is common: the copy of a reviewer's finding holds the step's diff, and the copy of a red line holds a failing verification line by definition. "the verification commands pass" is then never true, and the run stops before the hand-over of Steps 21.
- Replacements, tested once each:
  - "- A verification command that fails with the fix is run on the tree without it, and one that fails there too is named in the record as failing before the fix."
  - "- When a case stays red, the control's output changes or another verification command fails, the fix is changed at Steps 19 and this item is run again."
  - In the "Done when": "and the verification commands pass or are named as failing before the fix, each quoted in the record."
- Each is an addition and needs its Decision.

**G6 (brief). The round's check stays the red command on the shrunk case.** Walk: a reviewer's finding handed over to the builder.
- Place: item 11; skill line 179, "The red command is the round's check.", unchanged.
- Item 11 has the ruling name the red cases. The check the builder's fix is held to does not run them, and a defect with no test (the failure costs nothing, or no test reaches it) has no other check.
- Steps 21's "Done when" is unchanged and does not name what item 11 adds.
- Replacement for line 179: "- The red command, run on the shrunk case and on each case Steps 16 found red that "Not covered" does not name, is the round's check." Tested, once.
- Replacement for line 186, not tested: "Done when the fix and its test, with the cases the hand-over names, stand in the place the defect's source names, and for a reviewer's finding ..." with the rest as it is.

**G8 (brief). Two places that can hold the cause have two readings.**
- Place: item 2, "The three are then the shrunk case alone, the cases like it, and the rule the code breaks."
- "fewer than three places" includes two. The sentence fixes the three hypotheses by what the cause covers and names no hypothesis for the second place.
- Consequence: a session drops the second place, and when the cause is there every hypothesis is falsified and a second list is needed.
- Replacement, two bullets, tested once each: "- When the shrink and the code leave fewer than three places that can hold the cause, the list reaches three with hypotheses that differ in how much the cause covers." and "- Those are the shrunk case alone, the cases like it, and the rule the code breaks."

**G9 (brief). Steps 7's completion line has no wording for a rule with no other case.** Case: R12.
- Place: item 2, "one of them stating the rule the code breaks with its other cases".
- Replacement: "... with its other cases or the reason it has none." Tested, once.

**G10 (brief). The record template has two gaps for the rule hypothesis.** Walks: a reply that reorders the list; R15.
- Place: item 16, "<its rank, and the other cases the rule predicts are red>"; template line 68, unchanged.
- After a reply that reorders, Steps 10 rewrites the list and no sentence says which rank the paragraph holds. The Probes table cites hypotheses by rank.
- The second list's rule hypothesis (item 3) and its other cases have no place in the template.
- Replacements, tested once each: "<its rank in the list as it stands, and the other cases the rule predicts are red>"; line 68 becomes "The second list, when every hypothesis was falsified, in the same form: <the hypotheses, with the one that states the rule and its other cases, or "not needed">."

**G20 (brief). A red command a person drives: where the runs on other cases are quoted has two readings.**
- Place: `references/person-driven.md` line 20, which item 15 changes only in its number.
- Line 20 has each observations file quoted in the record's "Red command" section; the new "Other cases" table asks for "the command and its output" of each run. The page also speaks of "the actions file" as one file, and each other case needs its own.
- Consequence: the runs on other cases land in one section or the other, by the session's guess.
- Replacement, not tested: line 20 gains "or, for a run on an other case, in its "Other cases" section", and a bullet "- Each other case and the control get an actions file of their own."

The further walks found no other point:

- The four sources inside a plan: a reviewer's finding (G6); a red line and `premise` (G7); a brief-check finding (G21).
- A reply that reorders the list: Steps 11 probes every hypothesis, and Steps 15 and 16 do not depend on rank (G10 for the record).
- The Stops table and "Rules" need no change. No row or rule names an item from 16 to 25, and the rule on the scratch copy covers the runs of Steps 16, 18 and 20.

**G17 (brief). R10 as worded is unmet by the dictated text, and R18 is out of order.**
- R10 says the added text "names no path, no slash". Item 1 adds `.agents/plan.yaml` and item 18 keeps `agents/reviews/<step>-diagnosis.md`, both paths of the plan skills with a slash in them.
- Consequence: a builder who reads R10 word for word hands the case back.
- Replacement: "The added text names no path or file of one repository and holds no word of the defect the comparison ran on."
- R18 stands between R15 and R16, while the report asks for "R1 to R18 in order". Move it after R17.

## The question

Every check of "Verify before you report" can pass while the goal of the rulings is not reached.

- Checks 1 to 8 are facts about placement, counts and sync. They passed on the clone with G1 to G10 all present in the text.
- Checks 9 and 10 are the builder's reading of text the brief dictates. R4, R7, R8, R11 and R17 each read as met on the clone along the path the case describes, and fail on the neighbouring input (G2 to G5).
- No case covers the setting the comparison ran in, no person present outside a plan, where G1 lets the final message open without what the fix does not cover.
- The goal is a run that states the wider cause, covers each red case, runs a control and every verification command, and says what is left. Only a run shows that. `plan.md` line 17 rests the step's check on the reviewer's reading and on the second run of step 4, both outside the brief.

## Implied inputs

This is a text step, so these are reading cases. Each is missing from "Cases".

**G19 (brief). Six cases to add.**

| Case | Input | Expected result | Finding |
|---|---|---|---|
| R19 | No person present outside a plan, a cause found, one case under "Not covered" | The final message names the record's path and opens with that case | G1 |
| R20 | The shrink leaves two places that can hold the cause | The list holds a hypothesis for each place and one that states the rule | G8 |
| R21 | A verification command fails on the tree without the fix | Steps 20 is done, and the record names it as failing before the fix | G5 |
| R22 | A case stays red with the fix and is not under "Not covered" | The fix is changed at Steps 19, or the case goes to "Not covered" with its reason | G5 |
| R23 | A case the rule did not predict is red | The Cause section covers it | G3 |
| R24 | A reviewer's finding with a red other case and no test | The round's check runs the red command on that case | G6 |

**G21 (user). For a brief-check finding, every verification command runs on a copy that does not hold the fix.**
- Steps 3 applies nothing to the copy of a brief-check finding, and Steps 21 puts the fix in the brief on main.
- Under ruling (b), Steps 20 runs the whole verification list on that unchanged copy. The record then quotes passing commands that say nothing about the fix.
- The cost is the time of the list per diagnosis. An exception narrows ruling (b), so it is the user's: (a) no exception; (b) a bullet "For a brief-check finding no verification command is run, and the record says so." I do not judge which.

## ADRs

`ls docs/adr` prints `README.md` and `template.md`. The configuration block's `adr` is `docs/adr`. No record exists, none touches the step, and the brief's "No ADR touches this step" holds.

Findings: none.

## Dictated text

Read against `docs/dev/skill-layout.md`, the prose standard and the glossary, on the clone.

- **One rule per bullet.** Each dictated bullet holds one rule, except the exception of G4 standing apart from its rule.
- **Completion line last.** Every changed item ends on "Done when". Two completion lines do not name what their item gains: Steps 18 (G4) and Steps 21 (G6).
- **A rule written once.** No dictated rule is written twice.
- **Terms.** "shrunk case", "red command", "hypothesis", "probe", "diagnosis record", "cause not found", "rules file" and "verification page" are used in their entries' senses. "control" is the ruling's word and is defined by item 17; the change standard's rule 13 uses "control" for the near-miss a rule must report, the opposite role, which I note and do not raise. The template writes "another case" where the entry says "other case".
- **No path or wording of one repository or of the comparison's defect.** `grep -i -w 'slash\|pin\|folder\|spelling\|trailing\|doubled\|link\|tag\|suite'` over the 82 added lines gives no hit in a dictated sentence.
- **ASCII, tabs, hard wraps, history.** Clean: check 5 prints nothing, and no added line holds a date, a step of a plan or an incident.
- **Claims about the tree.** "Steps 13 left", "Steps 4", "Steps 7", "Steps 16", "Steps 20" in the new text each name the item meant after the renumbering (check 8).

**G14 (brief). Decision 16 names two of nine dictated sentences over 30 words.**
- Rule: prose standard E, sentence length; Decision 16's own claim.
- Counted by splitting each dictated sentence on spaces, the bullet marker left out:

| Item | Sentence begins | Words |
|---|---|---|
| 10 | "Done when the test, the red command, the original case" | 47 (Decision 16 says 48) |
| 18 | "It names each diagnosis record of the step" | 41 (the ruled text) |
| 5 | "When a case the rule predicted red is green" | 38 (Decision 16 says 39) |
| 4 | "Hypotheses left standing that differ only" | 36 |
| 16 | the "Not covered" placeholder | 36 |
| 5 | "For a symptom seen only sometimes" | 34 |
| 2 | "For a defect in text, the rule is the one" | 32 |
| 2 | "Done when the record's Hypotheses section" | 32 |
| 13 | "Done when the bullet is drafted and shown or committed" | 32 (the ruled text) |

- Consequence: check 9 has the builder report each with "the reason its content needs the length", and the brief gives no reason for seven of them.
- Replacements, tested once each: item 2's bullet split into "- For a defect in text, the rule is the one the text states wrongly or leaves out." and "- Its other cases are the other places where the same wording or rule stands."; item 5's into "- For a symptom seen only sometimes, each other case is run as many times as the failure rate of Steps 4 was measured over." and "- Such a case is red when it fails in any of those runs."
- Decision 16 then lists the rest with these counts and the reason for each; the two ruled sentences are named as the user's text.

**G23 (brief). The entry's sense of "other case" is narrower than item 5's use.**
- Place: item 17, "An other case is a scenario the stated cause predicts reproduces the same symptom".
- Item 5's second bullet adds cases "the code at the cause treats as it treats the shrunk case". After a reply that dropped the rule hypothesis the stated cause is narrow and predicts none of them.
- Rule: `skill-layout.md`, "Writing for an agent", a term is used only in a sense its entry gives.
- Replacement, not tested: "An other case is a scenario that reaches the stated cause, so that the same symptom is expected of it, and it stays a case when its run is green."

With every tested replacement above placed on a clone: each counts 1 in its file, sync prints `ok` after `--write`, the ASCII grep prints nothing, "Steps" holds 1 to 25, `git diff --stat` shows six files, and `checks.sh` ends `checks: 11 commands passed`.

## Declined to judge

- Whether the second run of step 4 wins or ties. Only that run and the user's call show it.
- Whether "at least two", "one more case for each further kind", the limit on "Not covered" and "no control for a defect in text" are the right design. Each is a listed Decision.
- Which option is right for G7, G16 and G21.
- The replacements for G6's completion line, G20 and G23 were not placed on a clone.
- Not read: `skills/spec/templates/brief-check.md` and `templates/brief.md`; `.agents/plan.yaml` (the configuration was read from the state file's block); the installed skills under `~/.claude/skills`; `.agents/worktrees/`, as instructed.
- Read in part only: `skills/plan-orchestration/SKILL.md`, `skills/refute/SKILL.md` and `skills/ordo-help/SKILL.md` (the lines that name a diagnosis); `skills/spec/SKILL.md` (lines 110 to 127 and "The brief check"); `skills/land/SKILL.md` (Steps 9 whole, and its lines that name a diagnosis); `plan.md` from line 61 on (the lines that name step 3a); the comparison record (lines 1 to 40 and the lines the premise quotes).
- `docs/glossary.md` was read directly at lines 1 to 20 and 110 to 135; its plan-terms block was read through `plan-terms.md`, which sync reports equal to it.
- The agent's usage line is the session's to fill from the completion notice.

Agent usage: claude-opus-5-5 (ordo-high), 260910 tokens, 38 tool uses, 1721 s ($3.18 to $12.35).

## Closed (second check; the session's change to the brief for every finding of it)

- G1: item 12 places its three sub-bullets after line 188 (R19).
- G2: item 4 states the cause as the widest of the hypotheses left standing (R17).
- G3: item 5 has the bullet for a red case the rule did not predict (R23).
- G4: item 8 limits the control to a defect in code and replaces the "Done when" of line 170; in item 10 "A defect in text has no control." follows the control's bullet.
- G5: item 10 has the three bullets for a command that fails with the fix, with the fix undone, and for a run that is not as the completion line asks, and its "Done when" names a command failing before the fix (Decision 16, R21, R22). A failing command is run again with the fix undone and the fix put back, since at Steps 20 the fix is in the tree.
- G6: item 11 replaces line 179 and line 186 (Decision 20, R24).
- G7: raised to the user as the open item "Step 3a, what `spec` carries from a diagnosis into a brief".
- G8: item 2 has the reviewer's two bullets (R20). G9: its "Done when" ends "or the reason it has none".
- G10: item 16 has "its rank in the list as it stands" and replaces line 68 of the record template.
- G11: item 17 changes the entry **booking** (Decision 22); the paths gain `plan-terms.md` line 9 and `docs/glossary.md` line 14.
- G12: item 6 says "items 7 to 13". G13: check 2 counts lines 170, 179, 186, 189, 198 and the template's line 68 among the replaced texts.
- G14: the bullets of items 2 and 5 are split, and Decision 23 names every sentence that stays over 30 words.
- G15: Decisions 16 to 21.
- G16: booked in the Rulings of `plan.md` as "Step 3a, the brief's choices", decided by the orchestrator for the user to overrule (Decision 24).
- G17: R10 reads "no path or file of one repository", and R18 stands after R17. G18: the premise quotes both pages.
- G19: R19 to R24, and R25 for G20.
- G20: item 15 changes line 20 of the reference page and adds a bullet after it (Decision 21); the path is the whole file.
- G21: raised to the user as the open item "Step 3a, the verification commands for a brief-check finding".
- G23: the entry's sentence is the reviewer's, and the template's table says "an other case".
