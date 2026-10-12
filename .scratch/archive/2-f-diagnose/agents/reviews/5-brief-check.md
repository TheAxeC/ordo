# Step 5 brief check (on main at ba08035)

The brief is `.scratch/2-f-diagnose/agents/briefs/5.md`. It is untracked: `git status --short` prints `?? .scratch/2-f-diagnose/agents/briefs/5.md`. `git log --oneline -1` prints `ba08035 Book Axel's call on the rerun for step 4 of plan 2.F, add step 5`. I changed no file and ran no git command that changes state. The `utils/pin.sh` line numbers below are those of the input tree at `.../scratchpad/cmp4/input` (`git log --oneline` there prints `6a62e53 2.E step 3 round 0`, `bae500e 44caaf6`).

## 1. Names

The step renames no file and no section heading. It changes these names: the definitions of the three classes ("part of the defect", "not part of the defect", "another defect"); possibly the term **other input** and a new term for a further place of the defect; the Done lines of Steps 4, 15, 18 and 19; and the template sections "Red command", "Operation and other inputs", "Fix and test" and "Cause".

- The class names, the section names and the terms. Command: `git grep -n -i "<term>" -- . ':(exclude)skills/diagnose/SKILL.md' ':(exclude)skills/diagnose/templates/diagnosis.md' ':(exclude)docs/glossary.md' ':(exclude)skills/repo-setup/templates/plan-terms.md' ':(exclude).scratch'`, run for each of these terms: `part of the defect`, `another defect`, `Operation and other inputs`, `other input`, `operation that goes wrong`, `operation the cause names`, `not reproduced`, `right result`. None of them has a hit.
- The same names in the ledger. Command: `grep -rn -i -l 'part of the defect\|another defect\|Operation and other inputs\|not reproduced' .scratch --include='*.md'`. The hits are past refuter reports, landing reports and the plan's bookings: 22 files outside `2-f-diagnose`, among them `.scratch/2-h-session-retro/agents/reviews/3b-refuter.md` and `.scratch/comparison-2026-09-28/findings-by-cause.md`, plus 2-f's own reports and briefs. All of them record past runs, so the change makes none of them false.
- Step numbers of `diagnose` named by other skills. Command: `git grep -n -E "(diagnose\`?('s)?( skill's)? Steps (4|1[5-9]|21))|Steps (4|1[5-9]|21)[^0-9].{0,40}diagnose" -- skills docs README.md ':(exclude)skills/diagnose/SKILL.md'`. Hits: `skills/spec/SKILL.md:104` ("The open item `diagnose` Steps 15 raises is the one open item for it.") and `skills/spec/SKILL.md:390` (the stop "A cause not found", "the open item the `diagnose` skill's Steps 15 raised"). The step does not touch the cause-not-found open item, and item 17 keeps the numbering, so neither hit becomes false.
- The README and `ordo-help` descriptions of `diagnose`. Command: `grep -n -i 'diagnose' README.md docs/*.md docs/dev/*.md skills/ordo-help/SKILL.md`. Hits: README lines 7, 20, 41, 51, 58, 62 and 102, and `ordo-help` lines 3, 25, 68, 70, 74, 94 and 100. They describe the skill at a level the step leaves true.

Findings: none.

## 2. The step line

Step 5's line in `plan.md`, mapped part by part:

- "in `skills/diagnose/SKILL.md` Steps 15 to 19 and its record template, an operation that breaks the same rule on the same value as the operation the cause names is part of the defect and fixed with it": served by items 1 to 7 (Steps 15, 16, 18 and 19) and items 13 and 14 (the template).
- "and only an operation breaking another rule is another defect": item 3 serves this part, but item 3 says more than the step line. It reads: "'Another defect' covers only an input wrong at an operation that breaks another rule, or the same rule on another value". Decision 2 repeats the addition.
- "a part of the symptom the red command does not show is read in the code that would produce it before the record or the session's final message calls it not reproduced": served by items 8 to 12.
- "then the blind comparison of step 3 run again on the same defect with fresh sides and fresh judges, recorded as `agents/reviews/5-blind-comparison.md`": served by "After the landing", bullets 1 and 2. This is the orchestrator's work, which is right.
- "check: the skill text read for both changes": served by Verify item 5 and by the cases.
- "the new comparison's record with both verdicts and the key, and `diagnose` wins or ties by Axel's call": served by "After the landing", bullets 2 and 3.
- "(1 commit)": nothing in the brief contradicts it.

Findings:

1. Item 3 and Decision 2 widen "another defect" beyond the step line. The step line says only an operation breaking another rule is another defect. Under that wording, an operation breaking the same rule on another value is not another defect. The brief adds "or the same rule on another value" to "another defect", and case 2 rests on that addition: it expects `utils/pin.sh:79`, which compares `${CLAUDE_CONFIG_DIR%/}` with `$HOME/.claude` as text, to be classed another defect. That is the same rule as line 317 (two spellings of one folder compared as text). By the step line, line 79 would therefore be part of the defect. The brief marks Decision 2 "reversible, none silent", but it narrows what the step line (ruling "Step 4, the call on the blind comparison") classes as part of the defect. That needs a ruling, or the case and item need rewording.

## 3. Premises

Each fact of "What is on the tree", rerun:

- `wc -l skills/diagnose/SKILL.md` printed `369`, and `grep -n version:` printed `5:  version: "2.1.0"`. Matches.
- `grep -n '^1[5-9]\. \|^4\. ' skills/diagnose/SKILL.md` printed lines 51, 104, 167, 218, 226, 230, 242 and 287. Steps 4 is at 104, Steps 15 at 167, Steps 18 at 230 and Steps 19 at 242. Matches; the other hits are "What it reads" 4 at line 51, Steps 16 and 17, and "Ways" item 4.
- `git tag --contains c3e4741` printed nothing (exit 0). Matches. Also `git log -L5,5:skills/diagnose/SKILL.md` shows c3e4741 raised `2.0.0` to `2.1.0`.
- Lines 192 to 198, 233 and 245, as quoted, match my read of the file.
- Line 184, as quoted, matches. Nothing in Steps 15 to 19 reads forward from the value: confirmed by reading Steps 15 to 19 whole.
- Line 106, as quoted, matches.
- `grep -n -i 'not reproduc' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md` does not print nothing, as the brief says. It printed two lines: `skills/diagnose/SKILL.md:116: ... or the scratch copy cannot reproduce because the symptom needs the real environment ...` and `skills/diagnose/templates/diagnosis.md:52: ... and why the scratch copy could not reproduce the symptom when that is so ...`.
- `wc -l` on the template printed `131`. `grep -n '^## \|The operation that goes wrong\|Class'` printed "Red command" at 22, "Operation and other inputs" at 82, the operation line at 84 and the table header at 86. The Class placeholder is at line 88: `<part of the defect, not part of the defect, or another defect>`. Matches.
- `docs/glossary.md:71` and `plan-terms.md:66` hold **other input**, ending "Each is put in one of three classes: part of the defect, not part of the defect, or another defect. Stated in: `diagnose`, Steps 15 to 19." `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0. Matches.
- `skills/spec/SKILL.md:104` and `:390` name Steps 15, and `skills/plan-orchestration/SKILL.md:158` names Steps 20. Matches. `grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n'` printed `1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. `. Matches.
- The description-length command printed `965`. Matches.
- The step-3 defect, read on the input tree with `awk 'NR>=60 && NR<=125 ...' utils/pin.sh` and `awk 'NR>=300 && NR<=330 || NR>=370 && NR<=445 ...'`:
  - Line 112 is `awk '{ sub(/\/+$/, ""); sub(/\/[^\/]*$/, ""); dir = $0 "/agents" } !seen[dir]++ { print dir }'`.
  - Line 317 is `[ "${dir%/}" = "$agent_dir" ] && fail ...`.
  - Lines 430-438 remove every link into `$stable` whose name is not an agent of the tag.
  - The `diagnose` side's record quotes `pin: <R>/home/.claude/agents///alpha does not link to ...` and says "a pin removes only links of skills or agents the new tag dropped".
  - All of this matches the brief.
- `grep -l -i 'diagnos\|hypothes' docs/adr/0*.md` printed nothing (exit 1). Matches.

Findings:

1. Brief line 15 says the `not reproduc` grep prints nothing. It printed two lines (quoted above), both about a scratch copy that cannot reproduce a symptom, which is the "No red command" case. The brief's substantive claim, that nothing covers a part of the symptom the red command does not show, still holds by reading. The command and its stated output need correcting, or the pattern needs narrowing.
2. Brief line 21 says the other side "put every skill folder in one written form where the folders are read, which fixes lines 112 and 317 together", and Decision 3 says the fix at the shared read point is "as the other side's fix did". Output B's diff shows something else:
   - `normal_awk` is applied in the pipeline that builds `agent_dirs` (old lines 111-112).
   - It is also applied inside `same_folder`, which replaces the comparison at line 317.
   - `skill_dirs` itself, read at lines 70-82, is left as written, so `shown_dirs` (line 109) and the link loops still use each spelling.
   B's fix is one helper used at the two places of the defect, not one change where the value is read. Item 5 and case 1 ("one written form made where the folders are read") rest on this premise.
3. Brief line 124 says "Every count, path, name and line number in this brief was checked on main at ba08035". The `utils/pin.sh` line numbers in lines 20 to 22 and cases 1 to 3 (75, 79, 111-112, 317, 430-438) are those of the input tree (44caaf6 with `3-round-0.diff`). On main they hold other code. `awk 'NR==75||NR==79||NR==112||NR==317||(NR>=430&&NR<=438)' utils/pin.sh` on main prints:
   - `75: # stripped, as the agent folders are built, ...`
   - `79:     [ "$same_one" = "$same_two" ] && return 0`
   - `112:     while IFS= read -r dir <&3; do`
   - `317: }`
   - lines 430-438: the worktree add and the skill-link loop
   
   The brief gives the input tree's recipe (line 20) but no path to a built copy. The change standard ("Where the work happens") forbids the builder git commands that change state. A builder that opens `utils/pin.sh` in its worktree to follow cases 1 to 3 by hand reads the wrong lines.

## 4. Cases and checks

- Case 1 (the step-3 defect led to line 112): consistent with change-standard rule 1 (a defect in text is fixed by reading, with no test) and with "Scripts compute facts". It depends on `utils/pin.sh` of the input tree, a place the step does not change; see the findings.
- Case 2 (`CLAUDE_CONFIG_DIR="$HOME/.claude//"`, line 79): inconsistent with the brief's own item 4 and with case 1; see finding 2.
- Case 3 (the removal of links at 430-438): consistent with the standards. It depends on the input tree, as case 1 does. Its example observation, "the stderr line naming `.../agents///alpha`", comes from the check after linking. The removal itself prints on stdout at input line 436: `printf 'pin: removed %s, which the tag %s does not hold\n'`. Either line shows the removal, so this is not a finding.
- Case 4: consistent.
- Case 5: consistent with Steps 18's existing count of two changes, so it meets the repeat-count rule of `docs/dev/skill-layout.md`, "Writing for an agent".
- Case 6: consistent with change-standard rule 1, since the defect in text is quoted before and after with no test.
- Case 7: consistent with `diagnose`'s "Rules" on who is present.
- Case 8: consistent.
- The first-run instruction ("The builder's first task ... the first run of every case above on the unchanged tree"): consistent with the change standard.
- Verify items 1 to 6: consistent with change-standard rules 6 and 7 and with prose-standard E.

Findings:

1. Cases 1 to 3 ask the builder to follow the changed text by hand on `utils/pin.sh` lines that exist only in the input tree, a place the step does not change, and the brief gives no path to that tree. Premises finding 3 has the evidence. The brief should name the built input tree, or quote the needed lines of `utils/pin.sh` from it, so the builder never reads main's `utils/pin.sh` for these cases.
2. Case 2's expected class contradicts item 4 and case 1. I computed the input tree's lines 78-80 and 111-112 for that input with `HOME=/h CLAUDE_CONFIG_DIR="/h/.claude//" sh -c '<lines 78-80 and the awk of line 112>'`. It printed `skill_dirs: /h/.claude/skills /h/.claude//skills` and `agent_dirs: /h/.claude/agents /h/.claude//agents`. The input therefore puts the skill folder `$HOME/.claude//skills` through line 112, which gives a second, text-distinct agent folder. That is the same wrong result case 1 classes as part of the defect for "`C//skills` with `C/skills`". Item 4 says "Each other input is run against every place of the defect it reaches, so an input wrong only at a further place ... is found, classed part of the defect". Case 2 expects the input "classed another defect ... and the fix does not reach for it". The input is wrong at two operations: line 79, which the brief calls another value, and line 112, a further place of the defect. The brief's class definitions give no class for an input wrong at both. Under the first-run rule, the builder would stop on this case.

## 5. The question

The goal: `diagnose` fixes the same defect wherever it occurs and never calls a part of the symptom not reproduced without reading the code that would produce it, so that it wins or ties the comparison.

- Case 1. Yes, it could pass without the goal. The builder knows the answer (line 112) from the brief, so a hand trace of its own text reaches 112 whether or not the text would lead a fresh run there. What decides a fresh run is whether line 112 "breaks the same rule" as line 317, and the brief gives no generic test for that (item 2 below).
- Case 2. Yes, and it is self-contradictory (Cases and checks finding 2).
- Case 3. In part. Item 8 triggers on "a part the red command does not show". Steps 4 already says (line 107) "Its output shows the result of each part". The step-4 side's red command did show part 4's result: `part 4 links unchanged: ok`. Under the skill's own wording, the removal was therefore a part the red command showed, and item 8 would not fire. Items 10 and 11 still catch the claim, provided the run applies them (item 8-11 analysis below).
- Case 4: no. The case requires the lines read and the reason they do not produce the part.
- Case 5: no. It is bounded by the count of two changes.
- Case 6. In part. "The same value" has no meaning given for a defect in text. Steps 15 maps "operation" to the instruction and "other inputs" to other situations, but nothing maps "value". A run cannot apply "the same rule on the same value" to a second instruction without guessing.
- Case 7: not about the goal. It checks a constraint, and that is not a defect.
- Case 8: not about the goal. It checks a constraint, and that is not a defect.
- The step line's check (the text read, the comparison, Axel's call). In part. The comparison reuses the step-3 defect, whose answers (lines 112 and 430-438) are in the builder's brief, so text fitted to this one defect can win it. Two things guard against that: the convention forbidding any mention of `utils/pin.sh` in the skill, and the reviewer's reading. No case puts items 1 to 7 on a code defect other than `pin.sh`.
- Items 1 to 7, against the step-3 defect:
  - Item 1. In part. Reading forward from the skill-folder list does reach line 112. But the step-4 side's record already noted line 112's behaviour ("a last `.` part treated as a folder name"). Its failure was the class it gave that line, not finding it, so item 1 is not the decisive item. Case 1 also points "where the value is read" at line 75 (`ORDO_SKILL_DIRS`). The skill folders are also assembled at lines 78-80 from `HOME` and `CLAUDE_CONFIG_DIR`.
  - Item 2. Yes, it could pass without the goal. A run judges line 112 "the same rule" only if the cause's rule is stated about how the value must be read, such as "a folder path is read as the folder it names, whatever its spelling". It fails if the rule is stated about the operation. The step-4 side stated it as "Two names of the same folder must compare equal; this comparison compares spellings". Line 112 does not compare; it derives a parent. Read against that rule, a run can class 112 as another rule, and therefore another defect, which repeats the step-4 failure. The brief's example of 112 is in the brief only, and the convention keeps it out of the skill. So the skill text needs a generic criterion, and neither the brief nor any case requires one:
    - the rule is stated at the value;
    - operations of different kinds (a comparison, a derivation, a lookup) can break the same rule.
  - Item 3. Yes, it could pass without the goal:
    - It gives no class for an input wrong at a further place and at an operation of another defect (case 2).
    - "The same value" has no definition beyond "(the variable, the configuration entry, the field)". The skill folder list is one variable fed from two sources (lines 70-75 and 78-80). A run cannot tell from that definition whether line 79 reads "the same value" or "another value", so it cannot class line 79 as case 2 expects.
    - Steps 15 line 196 ("An input that is part of the defect fails at the same operation as the reported input, so its failure costs what the reported input's failure costs") becomes false once a further place is part of the defect. It is not a restatement of a class definition, and item 3 does not name it.
  - Item 4. In part. The run of an input wrong only at line 112 (`C/skills/.` alone) has a right result of a different kind from the reported input's: no refusal, and the agents linked into `C/agents`. The existing "assertion set to that input's right result" covers it if the red command observes where the agents are linked. The glossary's **right result, of an other input** ("the result the rule the operation that goes wrong gives") then names only the named operation. Item 15 changes only entries whose text becomes false; this one does.
  - Item 5. Yes, it could pass without the goal:
    - "Where the places share where the value is read, the fix is made there once": the skill folders are read at two places (lines 70-75 and 78-80). A fix at line 75, as case 1's pointer suggests, leaves `$HOME/.claude//skills` from lines 78-80 wrong at line 112.
    - Steps 18 lines 230-231 ("Make the fix at the operation the cause names", "The fix is one change at the operation") contradict a fix made at the read point. The brief does not say these sentences are reworded.
    - Steps 18 line 233 ("every input of another defect, gives what it gave on the tree without the fix") can force a fix at the read point back to the operation, which leaves line 112 unchanged again. A read-point change alters the value for every operation that reads it, an operation of another rule on the same value included. The brief does not say how item 5 and line 233 are reconciled.
  - Item 6: no. Each input of the defect is run.
  - Item 7: no. It is bounded by the count.
- Items 8 to 11, against the step-4 side's "not reproduced" claim:
  - Item 8. Yes, it could pass without the goal. The trigger "does not show" collides with Steps 4's "Its output shows the result of each part". The step-4 red command showed part 4's result as "ok", so a run reading the skill's existing vocabulary does not count it as a part the command fails to show. The trigger should be a part the red command does not show going wrong: its assertion passes, or it has none.
  - Item 9: no. It names the mechanism the step-4 side met ("an assertion on the end state can pass when the run undoes its own change").
  - Item 10: no. It would have caught the claim, since "not reproduced" requires the lines read and why they do not produce the part. Lines 430-438 produce the removal.
  - Item 11: no. "A pin only removes links for skills or agents the new tag dropped" could not stand with lines 430-438 quoted.
  - Item 8, placed in Steps 4, sits beside the Anti-patterns row "A hypothesis, or code read to form one, before the red command has been run red" and Steps 4 line 105. The brief does not say the item-8 reading comes after the red runs and forms no hypothesis. A run may skip the reading to obey the row, or form hypotheses early.
- Items 12 to 14: no. They are places in the record. They hold only what items 1 to 11 produce.
- Items 15 and 16: support only.
- Items 17 and 18: constraints. Version (Declined to judge).

Findings:

1. Item 2 and Decision 2 give no generic test of "the same rule" that would class line 112 with line 317 when the cause's rule is stated about the comparison. The step-4 side stated it that way, which is the failure the step exists to end. The brief should require two things in the skill text: the cause's rule stated at the value (how the value must be read), and an operation of any kind (comparison, derivation, lookup, write) that reads the value against that rule being a further place of the defect. A case should check both.
2. "The same value" is undefined. Item 1's "(the variable, the configuration entry, the field)" does not say whether a value assembled from several sources is one value. In `utils/pin.sh` it is: the skill-folder list comes from lines 70-75 or 78-80. The definition is not sharp enough for a run to class line 79 as case 2 expects, and with case 2's own input it gives the opposite class (Cases and checks finding 2).
3. Item 3 gives no class for an input wrong at a further place of the defect and at an operation of another defect.
4. Item 5 does not name Steps 18 lines 230-231 and 233 as sentences to reword. With line 233 unchanged, a run can narrow a read-point fix back to the operation and leave line 112 unchanged.
5. Case 1's and item 5's "where the value is read" points at line 75 only, while the skill folders are also read at lines 78-80. A fix there would not cover every place.
6. Item 8's trigger, "does not show", would not have fired on the step-4 run, whose red command printed `part 4 links unchanged: ok`. It should trigger on a part whose assertion passes or which has none.
7. Item 8 is not reconciled with Steps 4 line 105 and the first Anti-patterns row on code read before the red command is red.
8. Steps 15 line 196 and the glossary's **right result, of an other input** become false under items 3 and 4, and the brief does not name them.
9. Case 6 has no meaning of "value" for a defect in text.
10. No case puts items 1 to 7 on a code defect other than the `pin.sh` one whose answers the builder has. This is a lesser finding: the convention against naming `utils/pin.sh` limits the risk.

## 6. Implied inputs

Not a code step: the step changes text only (`skills/diagnose/SKILL.md`, `templates/diagnosis.md`, the glossary and `plan-terms.md`).

Findings: none.

## 7. ADRs

I read the Decision section of every `docs/adr/0*.md`, each `Status: proposed`. Command: `for f in 0*.md; do grep -n -i 'Status:' "$f"; awk '/^## Decision/{p=1;next} /^## /{p=0} p' "$f"; done`.

- 0001, the writing base reads the prose standard where it is: does not touch the step. The brief names `skills/repo-setup/templates/docs/dev/prose-standard.md`, which `.agents/plan.yaml` `standards:` lists, so the brief is consistent with it.
- 0002, the prose standard over the academic sources: does not touch the step.
- 0003, a fresh read-only agent reviews a draft: does not touch the step.
- 0004, self-rule decision ending: does not touch the step.
- 0005, choices file: does not touch the step.
- 0006, the ledger records every agent's id: does not touch the builder's text. It applies to the orchestrator's booking of the comparison's agents.
- 0007, repair reviewer model: does not touch the step.
- 0008, the price table: does not touch the step.
- 0009, response counts: does not touch the step.
- 0010, the verify list kept equal to the verification page: applies at `/land`. The brief says the whole verify list runs at landing, which is consistent.
- 0011, dispatch blocks: does not touch the step.
- 0012, commits name their paths: applies to the orchestrator's commit, not to the builder.

Findings: none.

## 8. Dictated text

- "Everything in the brief is done": `grep -n 'Everything in the brief is done' .scratch/2-f-diagnose/agents/briefs/5.md` prints line 153. Holds, against change-standard rule 7 and prose-standard 0 and E.
- The record phrase "not reproduced": `grep -n 'written as not reproduced'` prints lines 44 and 76. Holds.
- The class names "part of the defect", "not part of the defect", "another defect" (kept): `grep -n 'keep their names'` prints lines 34 and 132, and `grep -n 'The Class cell keeps'` prints line 50. Holds. These are existing glossary terms, used in the sense the glossary gives them; item 3 changes that sense, and item 15 covers the change.
- `LC_ALL=C grep -n '[^ -~]'` over the brief printed nothing (exit 1).

Findings: none.

## Declined to judge

- The version. Item 18 keeps `metadata.version` at 2.1.0 because the plan has already raised it once, and `git tag --contains c3e4741` prints nothing. `docs/dev/skill-layout.md`, "Frontmatter", raises the major part when "under the same inputs ... its output is changed". Steps 4 and 5 together change what a run outputs: a wider fix, and "not reproduced" claims removed. Whether this plan's one raise should be major (3.0.0) or minor is a judgment on the combined change, and the brief does not argue the part, only the count. It is the orchestrator's call; the brief could state which part applies and why.
- Whether line 79 should be part of the defect or another defect. The step line and Decision 2 give opposite answers (The step line finding 1). Which wording stands is a ruling.
- Where item 11 goes. `docs/dev/skill-layout.md`, "Where a rule goes", puts a rule that holds throughout the skill in "Rules". The brief leaves the choice among Steps 4, Steps 21 and "Rules" to the builder. I did not judge whether the rule is one point's or the whole skill's.

Agent usage: a0631b29a3c017df0, claude-opus-5-5, 184390 tokens, 31 tool uses, 7.0 minutes.

## Closed

Each finding is closed in the brief `.scratch/2-f-diagnose/agents/briefs/5.md` as it stands before the preparation commit.

- The step line 1 (line 79 and "another value"): closed by the step line's own wording, which the ruling "Step 4, the call on the blind comparison" carries. "Or the same rule on another value" is gone from item 3; Decision 2 now says a further place is any operation that breaks the cause's rule on a value of that kind, whatever source the value comes from, so line 79 of the input tree is part of the defect. Case 1 names line 79 as a further place and `CLAUDE_CONFIG_DIR="$HOME/.claude//"` as an input of the defect; case 2 is now an input wrong only at an operation of another rule (a path with a space, split at line 73).
- Premises 1 (`not reproduc`): "What is on the tree" quotes the two lines the grep prints (`SKILL.md:116`, `diagnosis.md:52`) and says both are about the "No red command" case.
- Premises 2 (the other side's fix): "What is on the tree" says the other side wrote one helper and used it in the pipeline at lines 111-112 and in `same_folder` at line 317. Item 5 and case 1 allow one helper every place calls, one written form made at every source, or one change at each place. The claim "as the other side's fix did" is gone.
- Premises 3 and Cases and checks 1 (input-tree line numbers): "What is on the tree" quotes input-tree lines 70-82, 110-112, 315-317 and 430-438 from the comparison's input, and tells the builder to read them there and never in its worktree's `utils/pin.sh`. "Read" item 3 says the comparison record's line numbers are the input tree's.
- Cases and checks 2 (case 2 contradicts item 4): closed with the step line finding; item 3 now gives the class of an input wrong at a place of the defect and at an operation of another rule (part of the defect, with the other wrongness named as another defect).
- The question 1 (no generic test of the same rule): item 1 requires the rule stated at the kind of value, never only as what one operation does; item 2 makes any operation (comparison, derivation, lookup, write, parse) that reads such a value against the rule a further place. Case 6 puts both on a code defect other than `utils/pin.sh`.
- The question 2 ("the same value" undefined): item 2 reads forward from every source a value of the kind is read or assembled from, and Decision 4 bounds the search to the code the red command drives and the code that feeds it. Case 1 names both sources of the skill folders.
- The question 3 (no class for an input wrong at both): item 3.
- The question 4 (Steps 18 lines 230-231 and 233): "What is on the tree" quotes lines 230 to 233; item 5 says they are reworded; item 6 says line 233's "gives what it gave" no longer holds for an input of another defect, and that the fix is not widened to make such an input right.
- The question 5 ("where the value is read" at one place): item 5 covers every source; case 1 names lines 70 to 76 and 78 to 81.
- The question 6 (item 8's trigger): item 10 sets the trigger at a part with no assertion or whose assertion passes on the red runs; case 3 names the step-4 run's "links unchanged" as such a part.
- The question 7 (reading before the red): item 11 places the reading after the red command has been run red on its other parts, says it forms no hypothesis, and says the text states this beside Steps 4 line 105 and the Anti-patterns row.
- The question 8 (line 196 and the glossary entry): "What is on the tree" quotes both; item 3 rewords line 196; item 4 rewords **right result, of an other input**.
- The question 9 ("value" for a defect in text): item 9.
- The question 10 (no other code defect): case 6, the user name compared case-sensitively at one place and looked up lower-cased at another.
- Declined to judge, the version: kept at 2.1.0 as minor. Decision 6 states the part and the reason by `docs/dev/skill-layout.md`, "Frontmatter": a run that worked before still works, its fix covers more places and its record gains parts without losing any, which is the minor part's "adds to its output, and every run that worked before still works".
- Declined to judge, line 79: closed by the step line, as above.
- Declined to judge, item 11's place: the rule (now item 14) goes in "Rules", since it holds for the record and the final message alike (Decision 5).
