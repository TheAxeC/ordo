# Step 4 brief check (on main at c918d35)

The brief is `/Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/agents/briefs/4.md` (150 lines, uncommitted). `git rev-parse --short HEAD` printed `c918d35`. `git status --short` printed ` M .scratch/2-f-diagnose/orchestrator-state.md`, ` M .scratch/2-f-diagnose/plan.md` and `?? .scratch/2-f-diagnose/agents/briefs/4.md`.

## 1. Names

- **`diagnose` step numbers (Steps 15 to 19 change in content, not in number).** The command was `git grep -n 'Steps [0-9]' -- skills docs | grep -i diagnos`, plus `grep -n 'Stated in: .*\`diagnose\`' docs/glossary.md`.
  - Hits outside the paths: `skills/spec/SKILL.md:104` ("The open item `diagnose` Steps 15 raises is the one open item for it."), `skills/spec/SKILL.md:390` ("The open item the `diagnose` skill's Steps 15 raised") and `skills/plan-orchestration/SKILL.md:158` ("as the `diagnose` skill's Steps 20 says").
  - The glossary's and plan-terms' "Stated in" lines also name `diagnose` steps, at `docs/glossary.md:22, 23, 54, 82, 84, 92, 115, 117, 121` and the matching plan-terms lines.
  - Item 9 renumbers nothing, so no step number becomes false.
- **The term `probe`.** `docs/glossary.md:84` (and `skills/repo-setup/templates/plan-terms.md:79`) reads: "Also, in a diagnosis, one change tied to one hypothesis with the red command run after it. Stated in: `diagnose`, Steps 11 to 13."
  - The step line ("is probed against the fix") and item 3's label ("The probe against the fix") use the word for something else: one other input run through the red command against the candidate fix. That run is tied to no hypothesis and is not one change.
  - If the builder writes "probe" for it in Steps 15 to 19, the glossary entry becomes false, and that line is outside "Paths this step writes".
  - Nothing in the brief says which word to use.
- **The term `red command`.** `docs/glossary.md:92` reads: "the one command of a diagnosis that drives the code path of the symptom and goes red on the exact symptom".
  - Items 3 and 6 run "the red command, changed only in that input" and "the red command on each other input of the defect".
  - That is a family of commands, and some of them go red on another input's failure rather than on the exact symptom.
  - Whether this is a new sense is a judgment. If it is, line 92 needs a change and is outside the paths.
- **The term `booking`.** `docs/glossary.md:15` reads: "holding ... the diagnosis records with their causes".
  - `skills/land/SKILL.md:111` reads: "It names each diagnosis record of the step (...) with its cause and its diagnosis agent's usage from the record's head, or with "cause not found" and the open item it was raised as."
  - Item 3 says another defect is carried "to the landing's booking like the cause". Neither `land` Steps 9 nor the glossary's **booking** books another defect, and neither file is in the paths.
  - The brief's sentence is therefore false on the tree, and nothing in the step makes it true.
- **The template sections "Cause", "Fix and test" and "Runs after the fix".** The command was `git grep -n -i 'Fix and test\|Runs after the fix\|"Cause"\|Cause section\|record.s Cause\|diagnosis record' -- skills docs README.md utils`.
  - Hits outside the paths: `README.md:20` ("writes the fix with its test and a diagnosis record"), `skills/land/SKILL.md:42` and `:111`, `skills/roadmap/SKILL.md:56, 62, 66`, `skills/spec/SKILL.md:67, 158, 390`, and `docs/glossary.md:15, 39, 46`.
  - Adding a `##` section does not make these false. The `roadmap` lines take "the whole text under the heading" `# Diagnosis: ...`, and that whole text includes the new section.
- **`metadata.version` "2.0.0".** `git grep -n -c '2\.0\.0' -- skills/diagnose README.md docs` printed `docs/roadmap.md:1` and `skills/diagnose/SKILL.md:1`. The roadmap hit is entry 2.C's text and has nothing to do with `diagnose`. No hit outside the paths.
- **The new names "candidate fix", "other input" and "operation".** `git grep -n -i 'candidate fix\|other input\|the operation' -- skills docs README.md` printed nothing. No glossary entry exists for any of them (see check 8).

Findings:
1. Item 3 sends another defect "to the landing's booking like the cause". `skills/land/SKILL.md:111` and `docs/glossary.md:15` book only the cause, and neither file is in the paths, so that sentence of the brief stays false.
2. The step line and item 3 call the run of an other input a probe. The glossary's **probe** (`docs/glossary.md:84`, `plan-terms.md:79`) defines a probe as one change tied to one hypothesis. The brief neither names another word nor puts those lines in its paths. **red command** (`docs/glossary.md:92`) has the same exposure.

## 2. The step line

- "`diagnose` reaches the whole defect": the opening paragraph of "What to build".
- "after the cause is stated at the operation that goes wrong": item 1.
- "each other input that reaches that operation (another spelling, a link, a path not yet made)": item 2.
- "is probed against the fix": item 3.
- "each one that still goes red is part of the same defect": item 3, first sub-bullet.
- "fixed and tested with it": items 4, 5 and 6.
- "in `skills/diagnose/SKILL.md` Steps 15 to 19": items 1 to 9.
- "and its record template": items 11 and 12.
- "then the blind comparison of step 3 run again on the same defect with fresh sides and fresh judges, recorded as `agents/reviews/4-blind-comparison.md`": no requirement. It appears only as decision 6 ("not the builder's work: after this step lands, the orchestrator runs it again"). `agents/reviews/4-blind-comparison.md` is not in "Paths this step writes". `docs/dev/blind-comparison.md` (opening paragraph) does make the orchestrator run a comparison.
- Check, "the skill text read for the probe and its record line": "Verify before you report" 5 and the Cases.
- Check, "the new comparison's record with both verdicts and the key, and `diagnose` wins or ties by Axel's call": no requirement, only decision 6. The brief does not say that the step stays unticked until Axel's call, which the plan's ruling "Step 3 ticked" makes part of step 4's check.

Findings:
1. The comparison rerun and its record have no item in "What to build" or in any section the orchestrator acts on. Decision 6 is the only place that names them.
2. The check's "wins or ties by Axel's call" has no requirement. The brief does not say the step lands unticked pending that call.

## 3. Premises

- **Line count and version.** `wc -l skills/diagnose/SKILL.md` printed `318 skills/diagnose/SKILL.md`. `grep -n version: skills/diagnose/SKILL.md` printed `5:  version: "2.0.0"`. Matches.
- **Steps 15 to 19.** `grep -n '^1[5-9]\. ' skills/diagnose/SKILL.md` printed `166:15. State the cause: ...`, `182:16. ...`, `188:17. ...`, `192:18. Make the fix at the cause, which is the change Steps 13 undid.` and `195:19. Run the test, the red command and the original, unshrunk case.`
  - Steps 19's Done line is at 196. Matches "lines 166 to 196".
- **The quote of Steps 15.** Line 166 reads "the hypothesis the probes left standing, with the probe that shows it, the red command green with the change and red without it". Matches.
- **"Nothing in Steps 15 to 19 asks what else reaches the code."** Lines 166 to 196, read whole, hold no such bullet. Matches.
- **The template.** `wc -l skills/diagnose/templates/diagnosis.md` printed `120`. `grep -n '^## '` printed Symptom (7), Where the probes run (11), Red command (22), No red command (50), Shrunk case (54), Hypotheses (62), Probes (72), Cause (78), Fix and test (82) and Cleanup (114). Matches.
- **Other skills that name `diagnose` steps.**
  - The brief's own `git grep -n 'Steps [0-9]' -- skills docs | grep -i diagnos` also prints `skills/spec/SKILL.md:390` ("the `diagnose` skill's Steps 15 raised"), which the brief does not list.
  - `grep -n 'Stated in: .*\`diagnose\`' docs/glossary.md` shows that the "Stated in" lines also name `diagnose` Steps 8 (`docs/glossary.md:22`, **case, of a diagnosis**) and Steps 20 (`:117` **small text step**, `:121` **Step 0**).
  - The brief's list reads "Steps 2, 4, 6, 7, 11 to 13, 15, 16, 19, 22" and leaves out 8 and 20. Its narrower command, `grep -n 'Stated in: \`diagnose\`'`, misses lines where `diagnose` is not the first skill named.
  - The conclusion that no step number changes still holds.
- **The glossary entry.** `docs/glossary.md:40` and `skills/repo-setup/templates/plan-terms.md:35` both read "holding the symptom, the red command with its runs, the cuts of the shrunk case, the hypotheses, the probes, the cause and the fix with its test". `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0. Matches.
- **The description.** `python3 -c 'import yaml; ...'` printed `965`. Matches. 1,024 minus 965 is 59.
- **The defect.** From `3-blind-comparison.md`, "The input" and "The verdicts", and output A's message and record:
  - The `diagnose` side stated the cause as the trailing slashes ("`utils/pin.sh` kept the trailing slashes"), fixed trailing slashes only, and tested `$a1`, `$a1/` and `$a1//`.
  - Its record's Probes row 3 reads "falsified as a fix in this form".
  - Both judges preferred the other side, which tested `$a1//`, `$a1/.`, `$HOME/.claude/./agents/` and a link.
  - Matches.
- **The ruling.** `plan.md`, Rulings, "Step 3, the call on the blind comparison" reads as the brief quotes it. Matches.
- **ADRs.** `grep -l -i 'diagnos\|hypothes' docs/adr/0*.md` printed nothing (exit 1). `ls docs/adr` lists twelve `00NN-*.md` records plus `README.md` and `template.md`. Matches.

Findings:
1. "Other skills name `diagnose` steps by number" leaves out `skills/spec/SKILL.md:390`, which its own command prints.
2. The glossary step list leaves out Steps 8 (`docs/glossary.md:22`) and Steps 20 (`docs/glossary.md:117`, `:121`).
3. Neither finding changes the brief's conclusion that no step number may change.

## 4. Cases and checks

- **Case 1 (the step-3 defect).**
  - Its input describes "the two hypotheses the `diagnose` side probed (one trailing slash removed at `pin.sh:317` against every slash at line 112; the two paths compared as text)".
  - The comparison's `diagnose` side (`3-blind-comparison.md`, output A's `record.md`, Hypotheses and Probes) formed and probed three hypotheses:
    - 1: line 317 against line 112.
    - 2: trailing slashes kept where `ORDO_SKILL_DIRS` is read.
    - 3: resolved paths, "falsified as a fix in this form" because "two folders that do not exist yet both resolve to "" and are refused as equal".
  - The two hypotheses the case quotes are those of Axel's real run (`plan.md`, "Step 3, the real run"). In that run hypothesis 2 was already "green on `//`, `/.`, a symbolic link and a folder not yet created", and that run did not lose.
  - The case therefore mixes the losing run's symptom with the hypotheses of a run that did not lose. It does not exercise the losing side's actual turn, a resolved-path fix dropped because a folder not yet made broke the setup pin.
  - The expected list of other inputs includes `agents//`, which is the reported input itself, not an other input as item 2 defines it.
  - It lists "an agents folder not yet made" and gives no expected result for it. That input is the one that made the losing side drop comparing resolved paths.
- **Case 2 (`$HOME/.claude/./agents/`).** Consistent with item 3 and with the change standard's case rule. The fact that the unfixed `pin.sh` already refuses it matches judge 1 ("already refused by the unfixed code, because line 112 derives the same spelling from it").
- **Case 3 (`CLAUDE_CONFIG_DIR="$HOME/.claude//"` at `pin.sh:79`).** Consistent with item 3's "another defect".
  - Its expected result, "names it in the final message", needs text that item 3 places in Steps 15 to 19.
  - `docs/dev/skill-layout.md`, "Where a rule goes", says "A rule that says what to do at one point of the work goes in that step's item". The final message belongs to Steps 21, and to "Rules" for a diagnosis agent ("The diagnosis agent's final message is the diagnosis record whole"). The brief keeps Steps 20 to 24 and the Rules unchanged.
  - Inside a plan the case's outcome is a booking, which `land` does not write (check 1, finding 1).
  - The plan's ruling "Steps by part" routes new work by its reason:
    - a finding inside the step's part is fixed in repair rounds;
    - work outside the entry is `/roadmap add`;
    - a change to a public shape or an established decision is an open item.
  - The brief routes another defect to none of these.
- **Case 4 (a defect in text).** Consistent with `docs/dev/change-standard.md`, "The rules" 1 (a defect in text is fixed by reading, with no test).
- **Case 5 (no person present).** Consistent with the `diagnose` "Rules" bullet on who is present.
- **Case 6 (step numbers).**
  - It asks the builder to check that `skills/spec/SKILL.md:104` and `skills/plan-orchestration/SKILL.md:158` "still point at the right steps". The step changes neither place.
  - Its expected output, "lists Steps 1 to 24", is not what the command prints. `grep -n '^[0-9]*\. ' skills/diagnose/SKILL.md` prints 1 to 5 of "What it reads" (lines 32 to 52), 1 to 24 of Steps (61 to 228) and 1 to 11 of "Ways to build a red command" (233 to 243).
  - "As on main" makes the check workable. "Verify before you report" 3, "lists 1 to 24 in order", has the same imprecision.
- **Item 3, first sub-bullet, as case 1 exercises it.** "the fix is widened until every such input is green" is a repeat ended only by a condition, with no count and no outcome at the count. `docs/dev/skill-layout.md`, "Writing for an agent", says "A repeat that ends only when a condition holds, such as "until it passes" or "asked again", is given a count." The brief dictates the repeat without one.

Findings:
1. Case 1 quotes the hypotheses of Axel's real run as those of the comparison's `diagnose` side. That side had three, and its third was dropped for a folder not yet made.
2. Case 1 gives no expected result for "an agents folder not yet made".
3. Case 1 lists `agents//`, the reported input, as an other input.
4. Case 3's expected "names it in the final message" needs text that item 3 places in Steps 15 to 19. That breaks `docs/dev/skill-layout.md`, "Where a rule goes", since the final message is Steps 21's and the agent's final message is set in "Rules", both left unchanged.
5. Case 3's in-plan outcome, a booking, has no route among the plan's ruling "Steps by part" (repair round, `/roadmap add` or open item), and `land` Steps 9 does not book it.
6. Case 6 asks the builder to check `skills/spec/SKILL.md:104` and `skills/plan-orchestration/SKILL.md:158`, places the step does not change. Its expected "lists Steps 1 to 24" is not what the grep prints.
7. Item 3's "widened until every such input is green" has no count, against `docs/dev/skill-layout.md`, "Writing for an agent".

## 5. The question

The goal here is the part of the plan's goal this step delivers: that `diagnose` reaches the whole defect, so that it wins or ties the rerun of the blind comparison.

- **Case 1: yes.** The builder has read the comparison and the brief's expected inputs, then follows the text by hand. A reader who knows the answer can reach it from text that an unknowing run would not follow the same way. Its input also does not reproduce the losing side's turn (see check 4, finding 1). Only the rerun comparison on the step line tests the goal.
- **Case 2: yes.** It is a guard against padding the tests, not a test of the goal. It passes on any text that has the "green without the fix" rule.
- **Case 3: yes.** It is a guard that the fix is not widened to another operation. It does not bear on reaching the whole defect.
- **Case 4: yes.** It checks the text-defect analogue, not the step-3 defect.
- **Case 5: yes.** It checks that the new work adds no wait.
- **Case 6: yes.** It checks that numbering is unchanged.
- **The check on the step line: yes, in part.**
  - The rerun is on the same defect. Item 2's examples ("repeated or trailing separators, `.` parts", "a link", "a path not yet made") are the spellings of that defect.
  - A win then shows that the text reaches this defect's other inputs. It does not show that the text reaches the other inputs of a defect it was not written against.
  - One run on one defect can also win or lose by run-to-run variance.
  - The same-defect rerun is Axel's ruling ("Step 3, the call on the blind comparison").
- **Item 1 (cause at the operation): yes on its own.** A run can name the operation and still list only slash spellings; items 2 and 3 carry the rest.
  - Item 1 also makes the template's Cause placeholder (`skills/diagnose/templates/diagnosis.md:80`, "<the hypothesis the probes left standing, with the probe that shows it ...>") out of date. No item of "What to build" asks for that line to change, and items 11 and 12 touch only the new section and "Fix and test".
- **Item 2 (the other inputs): no.** It names the classes this defect needs and asks for them to be found by reading the code that feeds the operation.
- **Item 3 (the probe against the fix): yes.**
  - Every other input is run against the candidate fix. Nothing asks for any input to be run against the widened fix, apart from the defect's inputs in item 6.
  - In particular, an input green on the tree without the fix ("gets no test case") is never run against the widened fix.
  - A widened fix that turns such an input red therefore passes the text. That is the failure the step-3 side met with `pwd -P` on folders not yet made.
  - "the change that turned the red command green in the probes (the candidate fix)" does not say which change applies when two probes turned it green. In step 3, probes 1 and 2 both did.
  - It also does not say what happens when the hypothesis at the operation was "falsified as a fix in this form", as probe 3 was.
- **Item 4 (the test): yes, by ambiguity.**
  - It gives a case to "each other input that is part of the defect".
  - Item 3 names two kinds: "part of the same defect" (red with the candidate fix) and "part of the defect the fix already covers" (green with it). Item 11 calls the second kind "covered already".
  - Whether a covered input gets a test case is left open. A test with only the red/red inputs would not catch a later fix that narrows again to the candidate.
- **Item 5 (the fix): no.** It asks for one change at the operation for every input of the defect.
- **Item 6 (the runs after the fix): yes,** for the same reason as item 3. Only the defect's inputs are rerun after the fix.
- **Items 7 to 10: no.** Each is checked by reading and is not about reaching the defect.
- **Item 11 (the template section): no.** The table records each other input's two results.
- **Item 12: no.**
- **Item 13: no.** The two copies are checked equal by `sync_rules.py`.

Findings:
1. Items 3 and 6 never run the inputs outside the defect, or the reported input's neighbours green without the fix, against the widened fix. A widened fix that breaks a folder not yet made, the step-3 side's own failure, passes the text.
2. Item 3's "candidate fix" is undefined when several probes turned the red command green, or when the hypothesis at the operation was falsified only in the form its probe took.
3. Item 4 leaves open whether inputs "the fix already covers" get a test case. Items 3 and 11 also name that category in two ways ("part of the defect the fix already covers" and "covered already").
4. No item updates the template's Cause placeholder (`skills/diagnose/templates/diagnosis.md:80`), which item 1 makes out of date.
5. The step line's check can be won on the defect the text was fitted to. This follows from Axel's ruling and is raised for the session, not for the brief to change on its own.

## 6. Implied inputs

- Not a code step. The brief changes `skills/diagnose/SKILL.md`, `skills/diagnose/templates/diagnosis.md`, `docs/glossary.md` line 40 and `skills/repo-setup/templates/plan-terms.md` line 35, all text. Its Cases section says "this step changes text only, so no case is a test".

Findings: none.

## 7. ADRs

- 0001 (the writing base reads the prose standard where it is): does not touch the step.
- 0002 (the prose standard holds over the academic sources): does not touch the step.
- 0003 (a fresh read-only agent reviews a draft): does not touch the step. It governs `/writing`.
- 0004 (a decision taken under self-rule ends "(self-rule)"): does not touch the step.
- 0005 (choices go to one file at the ledger root): does not touch the step.
- 0006 (the ledger records every agent's id with its role): governs `diagnose`'s "Rules" on the diagnosis agent's numbered item, which the step leaves unchanged. Not touched.
- 0007 (the run over a repair round runs on its own reviewer model): does not touch the step.
- 0008 (the cost script prices from a table copied by hand): does not touch the step.
- 0009 (the cost script takes each response's counts from its response body): does not touch the step.
- 0010 (each plan's verify list is kept equal to the verification page): does not touch the step.
- 0011 (each plan keeps its own dispatch block): does not touch the step.
- 0012 (every commit on main names its paths): governs `diagnose` Steps 20's commit, which the step leaves unchanged. Not touched.

Each record reads `Status: proposed`, and none is superseded by its own opening lines or by a later record. The brief's statement that no ADR touches the step holds.

Findings: none.

## 8. Dictated text

- `version: "2.1.0"`, found with `grep -n '2\.1\.0' .scratch/2-f-diagnose/agents/briefs/4.md` (lines 46, 93 and 133).
  - It holds against `docs/dev/skill-layout.md`, "Frontmatter": the version lives in `metadata.version`, and the minor part applies when the skill does something it did not do and every run that worked before still works.
  - The same section says "A plan that changes a skill raises one part of its `metadata.version` once". Plan 2.F already raised `diagnose` at step 2a (`git log -L5,5:skills/diagnose/SKILL.md` shows fa32d9d, 1.1.0 to 1.2.0). Plan 2.1 then made it 2.0.0 (d3a5b27).
  - `git tag --contains d3a5b27` prints `v3.0.0` and `v4.0.0`, so 2.0.0 is released and the step's change needs a version of its own. The raise holds, and the brief does not state this reason.
- "candidate fix", given as the name of a term in parentheses, found with `grep -n 'candidate fix' .scratch/2-f-diagnose/agents/briefs/4.md` (lines 34, 35 and 50).
  - It holds against the prose standard, sections 0 and A to F (ASCII, plain, no flagged word).
  - Against `docs/dev/skill-layout.md`, "Writing for an agent" ("A skill that needs a new term, or a term in a new sense, adds or changes its entry in `skills/repo-setup/templates/plan-terms.md` first"), it is a name the skill will use in a defined sense across Steps 15 to 19 and the template. The brief neither adds an entry nor puts a plan-terms line other than 35 in its paths.
  - "other input" and "operation", used the same way, are named in prose rather than dictated.
- Item 11's table categories ("part of the defect, covered already, not part of it, or another defect") describe what a cell holds and are not given as the cell's words. They name item 3's categories differently, which the prose standard, section D ("No synonym cycling"), forbids once they reach the template; see check 5, finding 3.

Findings:
1. "candidate fix" is dictated as a term the skill will use in a defined sense, with no glossary entry and no path for one, against `docs/dev/skill-layout.md`, "Writing for an agent".

## Declined to judge

- I did not rebuild the defect's tree (44caaf6 with `.scratch/archive/2-e-grill/agents/reviews/3-round-0.diff`) to rerun case 1's expected results.
  - That `agents/.` stays red with a slash-only fix rests on Axel's real run ("1 is green on `//` and leaves `/.` red", `plan.md`).
  - For `agents/./` and the link, it rests on the judges' readings and on the `diagnosing-bugs` side's own test ("`/.`, `/./` and the symlink still got through").
  - The result for an agents folder not yet made is unverified.
- Whether the rerun on the same defect is enough for the goal is Axel's ruling ("Step 3, the call on the blind comparison"). Adding a second defect would be his call.
- Whether **red command** is used in a new sense by "the red command, changed only in that input" is a reading the session should make. I raised it as a risk in check 1, not as settled.

Agent usage: a3ee1a7e4b52255d2, claude-opus-5-5, 187152 tokens, 31 tool uses, 6.1 minutes.

## Closed

Each finding is closed by a change to `.scratch/2-f-diagnose/agents/briefs/4.md`, named by the brief's section and item.

- 1. Names, 1: item 10 names another defect in the record's new section only, and says no step of `diagnose` beyond 15 to 19 changes for it; the booking and the final message are no longer asked for. Decision 3 says the same.
- 1. Names, 2: items 1 and 2 add the term **other input**, with its entry in `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md` after **orchestrator** (glossary line 70, plan-terms line 65, both now in "Paths this step writes"). They say the run of an other input is a run, never a probe, using the red command with that input in place of the reported one, so **probe** and **red command** keep their entries' meanings. The step line's "probed against the fix" is built as that run.
- 2. The step line, 1 and 2: the new section "After the landing (the orchestrator's work, not the builder's)" states the rerun by `docs/dev/blind-comparison.md` with fresh sides and fresh judges, the record at `agents/reviews/4-blind-comparison.md`, and that step 4 stays unticked until Axel's call is a win or a tie.
- 3. Premises, 1 and 2: "What is on the tree" names `skills/spec/SKILL.md:390` and every `diagnose` step the glossary cites (Steps 2, 4, 6, 7, 8, 11 to 13, 15, 16, 19, 20 and 22), with the grep that lists them.
- 4. Cases, 1: case 1 uses the comparison side's three hypotheses, the third dropped because two folders not yet made resolved to an empty string, and expects that hypothesis kept (item 4).
- 4. Cases, 2: case 1 gives the expected result for an agents folder not yet made: refused when it is the same folder as the agents folder, not refused otherwise.
- 4. Cases, 3: `agents//` is no longer listed as an other input; item 5 says the reported input is not on the list.
- 4. Cases, 4 and 5: case 3 expects the input named in the record's new section only (item 10).
- 4. Cases, 6: case 7 checks the numbering with the `grep -o` of numbered items against main's output, and Verify 3 uses the same command; neither names a line of `spec` or `plan-orchestration`.
- 4. Cases, 7: item 8 bounds the fix at two changes (the probe's change, then one more); an input still wrong after them is written in the record as not fixed and named in the Cause section. Case 4 checks it.
- 5. The question, 1: item 9 runs the red command on every other input after the fix, the inputs not part of the defect included, which must give what they gave without the fix.
- 5. The question, 2: item 3 takes the hypothesis at the operation as the cause when several probes turned the red command green, and the change under test is that probe's change; item 4 says a hypothesis whose probe broke only an other input is not falsified.
- 5. The question, 3: item 7 gives every input part of the defect a test case whether or not the probe's change covered it; item 6 names three classes ("part of the defect", "not part of the defect", "another defect"), used in the same words in the template (item 15) and in Conventions.
- 5. The question, 4: item 16 updates the template's Cause placeholder (`diagnosis.md:80`).
- 5. The question, 5: the rerun on the same defect is the plan's ruling "Step 3, the call on the blind comparison"; Axel's call on the rerun, under "After the landing", decides the step. No change.
- 8. Dictated text, 1: "candidate fix" is removed; decision 4 says no name is coined for the change under test. Item 14 and decision 7 state the version reason: 2.0.0 is in `v3.0.0` and `v4.0.0`.
