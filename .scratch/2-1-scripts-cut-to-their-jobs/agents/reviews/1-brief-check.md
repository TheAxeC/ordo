# Step 1 brief check (on main at 925e066)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. The checks ran on main at `925e066b778fa4be95b7828485f12f8565345afe` (`git rev-parse HEAD`). `git status --short` showed only the session's own ledger changes: ` M .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md` and `?? .scratch/2-1-scripts-cut-to-their-jobs/agents/briefs/1.md`. I changed nothing, invoked no skill and started no agent.

## 1. Names

Every grep below leaves out the brief's 13 paths: `docs/dev/change-standard.md`, the template change standard, `skills/spec/templates/brief.md`, the `SKILL.md` of `spec`, `refute`, `plan-orchestration`, `land` and `diagnose`, `docs/glossary.md`, `plan-terms.md` and `README.md`, plus line 5 of `skills/repo-setup/SKILL.md` and the report. `docs/roadmap.md` is left out as the entry's own text.

- **"once per step" / "one brief check" / "One per step"**: `grep -rn -i "once per step\|one brief check\|brief check per\|One per step" skills docs README.md`. Outside the paths:
  - `skills/ordo-help/SKILL.md:67`: `/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree once per step (the brief check) ...`. Made false: after items 6 and 8, a small text step gets no brief check. This is the sequence `/ordo-help` prints verbatim, and README line 27 calls README's list "shortened from what `/ordo-help` prints". Item 12 changes README line 38 but leaves this copy.
- **"repair round"**: `grep -rn -i "repair round" skills docs utils`. Outside the paths:
  - `skills/ordo-help/SKILL.md:76`: `"close them"                  a repair round: the session fixes the findings, reruns, rewrites the report; ...`. Made false for a small text step, which gets no repair round. Item 12 changes the README copy (line 43) only.
  - `skills/ordo-help/SKILL.md:75` and `:77` (`/refute <entry> <step>        again, over the repair round, when plan.yaml says refute_after_repair: yes`): not false, since both are conditioned on a round.
  - `skills/plan/templates/plan.yaml:17,18,30` and `skills/plan/templates/orchestrator-state.md:17,18,30,39`: not false. The cap is a maximum, and a small text step's findings at landing match line 17's "fixed at landing or raised as open items".
  - `skills/plan-retro/SKILL.md:38,70,71`, `skills/roadmap/SKILL.md:58`, `skills/refute/templates/report.md:44` and `skills/plan-orchestration/references/self-rule.md:44`: not false, since each speaks of a round that ran.
  - `docs/figures/gen_figures.py:615` and `docs/figures/plan-loop.svg:56` (the loop figure): not false. The figure draws the loop of a full step.
- **"brief check" / "brief-check"**: `grep -rn -i "brief check"` and `grep -rn -i "brief-check"` over `skills docs utils`. Outside the paths:
  - `skills/ordo-help/SKILL.md:67`: false, as above. Lines 70, 71 and 84 are conditioned on a finding of the brief check, so they are not false.
  - `skills/spec/templates/brief-check.md:37`: `- <for a code step (a script, or a product's code): each input the step implies but never states, in the forms \`templates/brief.md\`'s "Cases" names>: listed under "Cases", or missing, with the expected result it should have. Or: not a code step.` Made false by item 6. The narrowed **Implied inputs** check names a missing input only when it has happened or would lose work, and this template line, which shapes the report of that check, still asks for every implied input. The file is part of the `spec` skill and is not in the paths.
  - `skills/plan/templates/orchestrator-state.md:34`: `... brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time) ...`. Made false for a small text step, which has no report and no agent. The brief does not say what `brief_check` holds then (see 7, ADR 0006).
  - `skills/plan/templates/plan.yaml:12,27`, `skills/plan/templates/orchestrator-state.md:14,27`, `skills/plan/templates/plan.md:36`, `skills/grill/SKILL.md:221`, `skills/roadmap/SKILL.md:56,57,65`, `skills/spec/templates/brief-check.md:1,3`, `skills/plan-orchestration/templates/plan_cost.py:18,115,118` with its test, and `docs/figures/gen_figures.py:592`: not false. Each names the brief check where one runs.
- **The verify list run in the worktree** (`checks.sh`, "verify list", "whole tree"): `grep -rn "checks.sh"`, `grep -rn "verify list"` and `grep -rn "whole tree"` over `skills docs README.md utils .agents`, plus `grep -n "verify\|worktree and\|brief check\|repair" skills/plan/templates/orchestrator-state.md skills/plan/SKILL.md skills/plan/templates/plan.md skills/plan/templates/plan.yaml`. Outside the paths:
  - `skills/plan/templates/orchestrator-state.md:6`: `verify:                      # commands run in the worktree and again on main, in order; all must pass. ...`. Made false by item 4, since the verify list then runs once, at landing on main.
  - `skills/plan/templates/orchestrator-state.md:56`: `- The \`verify\` list above runs through the \`land\` skill's \`templates/checks.sh <state file>\` from the root of the checkout it checks, the worktree and then main. ...`. Made false by item 4.
  - `skills/land/templates/land.sh:3,15,19,21,53,56,59,79,127,128,131,441,443,446`, `skills/land/templates/checks.sh:2,4,9,21,33,38`, `skills/land/templates/land.test.sh:4,8,36,124` and `skills/land/templates/checks.test.sh:2,34,36,46,118`: not false. They describe the run on main or the script itself.
  - `docs/dev/building.md:7,22,27,29`, `docs/adr/0010-...md:1,7,11,16`, `docs/adr/0012-...md:7`, `docs/adr/README.md:20`, `skills/repo-setup/templates/docs/dev/coding-standards/common.md:5,7` and `.../typescript.md:47`: not false.
  - The ledger's own state file has the same sentence at `.scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md:6` and `:68` ("the worktree and then main"). It belongs to the orchestrator, not to the builder.
- **Rule 15's parts**: `grep -rn -i` for "rule on edges", "Edges whose", "rule 15", "duplicated and colliding", "concurrent path" and "forms weighed". No hit outside the paths except the roadmap goal (`docs/roadmap.md:24`).
- **The removed line 26 of the brief template**: `grep -rn -i "unreadable or malformed"` and `grep -rn -i "closed early"`. The only hits outside the paths are `skills/session-retro/templates/transcript_window.test.sh:12,543,558,560,571`, about that script's own test. They are not made false.
- **"Implied inputs" / "implies but never states"**: `skills/spec/templates/brief-check.md:35` (`## 6. Implied inputs`) is not false. Line 37 is false, as above.
- **`brief_check`**: `grep -rn "brief_check" skills docs README.md`. Outside the paths, `skills/plan/templates/orchestrator-state.md:34` is false for a small text step, as above. `docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11` ("the brief check in `brief_check`") is not contradicted but is touched (see 7).
- **`scripts.md`**: `grep -rn -i "scripts.md" skills docs README.md utils`. The only hits are `docs/roadmap.md:24,25`. No hit outside the paths.
- **The new terms "small text step", "full step" and "size line"**: `grep -rn -i "small text step\|full step\|size line" docs skills README.md` printed nothing. The terms are used in items 5, 6 and 8 in a sense of their own, and no glossary entry exists.
- **Rule 6's title** (`Verification runs`, `every check, over`, `rule 6`): `grep -rn -i "rule 6\b\|Verification runs\|every check, over\|rules file's rule on" skills docs README.md utils`. Outside the paths there are only hits on the secrets rule. None is made false.

Findings:

1. `skills/ordo-help/SKILL.md:67` and `:76` are made false by items 6 to 8, and `ordo-help` is not in the paths. README line 27 says README's sequence is shortened from `/ordo-help`'s, so the two copies would also disagree. Carrying the change there raises `ordo-help`'s version (2.1.0 at line 5), and item 13 does not list it.
2. `skills/spec/templates/brief-check.md:37` is made false by item 6's narrowing of **Implied inputs**. The file is part of the `spec` skill and is not in the paths.
3. `skills/plan/templates/orchestrator-state.md:6` and `:56` (the verify list runs "in the worktree and again on main") are made false by item 4. Line 34 (`brief_check` holds a report path) is made false for a small text step. The `plan` skill is not in the paths and not in item 13. The ledger's own state file, lines 6 and 68, carries the same sentence for the orchestrator.
4. The terms "small text step" and "full step" are not in the glossary. `docs/dev/skill-layout.md`, "Writing for an agent", says a skill that needs a new term adds its entry to `skills/repo-setup/templates/plan-terms.md` first. Item 11 changes three existing entries and adds none.

## 2. The step line

- "in `docs/dev/change-standard.md` and its template copy, the rule that code handles a case only when that case has happened or would lose work": item 1.
- "rule 15 rewritten to match": item 2.
- "and the line that a change adding, removing or renaming a script updates `docs/dev/scripts.md`": item 3, in Ordo's copy only. The step line puts all three clauses under "in `docs/dev/change-standard.md` and its template copy". The brief leaves this line out of the template copy, and this departure is not listed under "Decisions taken in this brief".
- "in `/spec`'s brief template ... cases that check only what the step changes": item 5, the first "Cases" bullet.
- "in `/spec`'s ... brief check, cases that check only what the step changes": no requirement. Item 6 narrows **Implied inputs** to inputs that have happened or would lose work. No item makes the brief check's **Cases and checks** or **Implied inputs** name a case that checks a place the step does not change. The goal says "the brief template and `/spec`'s brief check ask only for cases that check what the step changes".
- "and the 'Implied inputs' check narrowed to the same": item 6, third bullet, narrowed to the case rule of item 1.
- "the builder and the reviewer running only the checks of the files the step changes and the ASCII check, the full verify list at landing on main": items 4, 5 (third bullet), 6 (first bullet), 7 (first bullet), 8 ("The prompt") and 9.
- "a step that changes only text in fewer than 20 lines getting no brief check and one review with no repair round, in `/spec`, `/refute`, `/land` and `plan-orchestration`": items 5 (size line), 6 (Steps 5 and the "once per full step" sentences), 7 (third bullet), 8, 9 and 10.
- "`/refute`'s Standards finding of code larger than its job": item 7, second bullet.
- "each changed skill's version raised": item 13.
- "at its landing main is tagged and the user runs `utils/pin.sh <tag>`": no requirement. This is landing work for the orchestrator and the user, not the builder's, but the brief does not say so.
- "check: each changed text read by the user in place, and `git describe --tags` in `~/.local/share/ordo-stable` prints the new tag": not in "Verify before you report". It is the user's check after landing.

Findings:

1. The brief check's part of "cases that check only what the step changes" has no requirement. Item 6 changes **Implied inputs** to the case rule, and nothing changes **Cases and checks** or adds a check for a case that asks about a place the step does not change.
2. The scripts-page line is left out of the template copy without being listed under "Decisions taken in this brief", although the step line reads as asking for it in both copies.
3. The tag and the `pin.sh` run at landing have no line in the brief. It could say that they are the landing's and not the builder's.

## 3. Premises

Every fact matches what the brief says:

- Step 1 tagged `(approved)`: `grep -n "^- 1 The rules in text" .scratch/2-1-scripts-cut-to-their-jobs/plan.md` printed line 20, and the line ends `(1 commit) (approved)`. The goal is at `docs/roadmap.md` line 21 onward: `grep -n "2.1" docs/roadmap.md` printed `21:## 2.1 Scripts cut to their jobs`. Matches.
- `docs/dev/change-standard.md` is 90 lines: `wc -l` printed `90`. Matches.
- The section runs from line 11 to 23 and line 20 reads `- A test exists only for a script, and only for behaviour whose failure costs something: ...` (`grep -n "A test exists only for"`). Read in full, the section has no rule on which cases code handles. Matches.
- Rule 6 at line 32, rule 15 at line 46 and the runner sentence at line 81 (`cat -n`): the text is as the brief quotes and describes. Matches.
- The template is 71 lines (`wc -l`), line 20 reads `A test exists only for code`, and rule 6 (line 32) and rule 15 (line 46) are present (`grep -n "^6\. \|^15\. "`). Rule 15 opens "For code" where Ordo's opens "For a script", which is covered by the brief's "code"/"script" remark. Matches.
- `skills/spec/templates/brief.md` (`cat -n`): line 25 holds "only the inputs where a wrong answer costs something", line 26 is the script-input line as quoted, and line 74 is item 1, the whole verify list through `checks.sh`. Matches.
- `skills/spec/SKILL.md`: `grep -m1 -n 'version'` printed `5:  version: "3.0.0"`. `grep -n` found line 141 (the implied inputs of Steps 4), line 174 (the brief check runs "unless the step's brief-check report already stands"), line 330 (**Implied inputs**) and line 354 (`- The check runs once per step.`). Matches.
- `skills/refute/SKILL.md`: `5:  version: "2.0.0"`. Steps 3 is lines 61 to 63 and **Standards** is lines 128 to 138 (`grep -n`). Read in full, Standards has no finding for code larger than its job. Matches.
- `skills/plan-orchestration/SKILL.md`: `5:  version: "3.1.0"`. Line 80 is the `checks.sh` sentence of "The prompt", Steps 8 sends findings back (line 136, "Sent back"), and line 412 says "a step gets one brief check". Matches.
- `skills/land/SKILL.md`: `5:  version: "1.10.0"`. Steps 6, lines 63 to 66, run the verify list on main and fix "a finding of the refutation of the last repair round that is small and inside the brief". Matches.
- `skills/diagnose/SKILL.md`: `5:  version: "1.2.0"`. `sed -n '195,207p'` shows lines 199 to 205 handing over the fix by where the finding came from. Matches.
- `skills/repo-setup/SKILL.md`: `5:  version: "2.1.0"`. Line 65 fills the plan-terms block from `templates/plan-terms.md`, and the change standard template is in `templates/docs/dev/`. Matches.
- The glossary entries: `grep -n` printed `docs/glossary.md:18` (**brief check**, "made once per step"), `:99` (**repair round**) and `:131` (**verify list**), and `skills/repo-setup/templates/plan-terms.md:13`, `:94` and `:126`. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. Matches.
- `README.md` lines 38 and 43 (`sed -n '38p;43p'`): the text is as quoted. Matches.
- `docs/dev/scripts.md` does not exist: `ls docs/dev` printed `blind-comparison.md building.md change-standard.md skill-layout.md`. Matches.
- ADR 0007 and ADR 0010, read in full: the quoted sentences are the records' text. The plan's verify list was put in the page's order: `git diff` of the state file shows `plan_cost.test.sh` moved after `transcript_window.test.sh`, which is its place in `docs/dev/building.md`. Matches.
- "No other ADR touches the step" (`ls docs/adr`, each read): 12 records (`ls docs/adr | grep -c '^[0-9]\{4\}-'` printed `12`). This premise does not hold, as section 7 shows for ADR 0006.

Findings:

1. "No other ADR touches the step" is not borne out. ADR 0006 governs the `brief_check` record, which a small text step leaves without a report or an agent (section 7).
2. This finding is about the brief's form, read against the rules file, not about a command's output. The brief cites skill and page text by line number throughout "What is on the tree" and "What to build": `docs/roadmap.md` line 21, change-standard lines 11 to 23, 32, 46 and 81, `brief.md` lines 25, 26 and 74, `spec` lines 141, 174, 330 and 354, `refute` lines 61 to 63 and 128 to 138, `plan-orchestration` lines 80 and 412, `diagnose` lines 199 to 205, glossary lines 18, 99 and 131, and README lines 38 and 43. The rules file, "Where the work happens", says a ledger file cites a page "by its section, never by a line number". It allows line numbers only in "Paths this step writes", for code, and in a "Doc text" entry.

## 4. Cases and checks

- C1 (`grep -n 'Code handles a case only when' ...` prints one line in each file after the change): consistent with the rules file, rule 1 (a text defect is checked by reading, the text quoted before and after). Its first run on the unchanged tree printed nothing, exit 1.
- C2 (rule 15 read in both copies): consistent.
- C3 (`grep -n 'scripts.md' docs/dev/change-standard.md`): consistent. Its first run printed nothing, exit 1.
- C4 (rule 6 and the runner paragraph read in both copies): consistent.
- C5 (`brief.md` read after the change): consistent.
- C6 (the five skills read after the change): consistent.
- C7 (`sync_rules.py . --only glossary` prints ok): consistent with the rules file. See section 5.
- C8 (`grep -m1 -n 'version' ...` prints item 13's versions): the case is consistent as a check, but the versions it pins break `docs/dev/skill-layout.md`, "Frontmatter": "A plan that changes a skill raises one part of its `metadata.version` once". Step 3 of this plan changes `diagnose` (it deletes `person-driven.sh` and `references/person-driven.md`, so a run that worked before is refused, a major raise), `land` (`land.sh` cut back), `plan-orchestration` (`plan_cost.py` cut back) and `repo-setup` (the git guard offer removed, a major raise). Item 13 raises `diagnose` and `land` by their minor part in step 1. Under the once-per-plan rule, step 3's major change to `diagnose` then has no raise left. The brief does not say how step 1's raise is chosen given step 3, or why the tag at step 1's landing makes each step's raise separate.

Findings:

1. C8 and item 13: the minor raises of `diagnose` (1.2.0 to 1.3.0) and `land` (1.10.0 to 1.11.0) conflict with `docs/dev/skill-layout.md`, "Frontmatter", one raise per skill per plan, because step 3 of the same plan changes both skills, `diagnose` by removal.

## 5. The question

Each question below is "could this pass without the goal being reached?", the goal being the part of the plan's goal that step 1 delivers.

- C1: no. The bullet's presence is the rule's presence, and the words are dictated.
- C2: no. The rewritten rule is read whole.
- C3: no. The bullet is present or not.
- C4: no. The rule is read whole.
- C5: yes, in one way. It reads the size line's presence, and nothing checks that a step labelled small actually is small (see item 5).
- C6: yes. It checks "what items 6 to 10 give it". Item 6 does not make the brief check ask only for cases that check what the step changes (section 2, finding 1), so C6 passes with that part of the goal missing. It also reads only the five `SKILL.md` files, so it passes with `spec`'s `templates/brief-check.md:37`, `ordo-help`'s sequence and the `plan` skill's state-file template still saying the old rules.
- C7: yes. Its first run on the unchanged tree already prints `ok: the plan-terms block equals the template`, exit 0. It checks only that the two copies are equal, never what entries 18, 99 and 131 say. No case reads those entries. Only the report's "The terms" part does.
- C8: no, for the versions as decided. Section 4 finding 1 covers whether the decision is right.
- The step line's check ("each changed text read by the user in place", and `git describe --tags` printing the new tag): no. The user reads, and the tag is a fact.
- Item 1: no (C1). Item 2: no (C2). Item 3: no (C3). Item 4: no (C4).
- Item 5: yes. `/spec` writes the size line before the build, from what it expects. Decision 2 counts "the lines added and removed in all", which only the built diff shows. No item makes `/refute` or `/land` compare the built diff with the size line. A step labelled small that ends up changing 60 lines, or a script, still goes through with no brief check and no repair round, and the goal limits that path to steps that change only text in fewer than 20 lines.
- Item 6: yes, as C6 says.
- Item 7: yes. "A small text step gets one review" does not say how it meets `review: earned`. `plan-orchestration`, "The review, earned", decides per step whether any review runs. Under `earned` a small text step can get no review, and the goal says one.
- Items 8 to 10: no, beyond what C6 says.
- Item 11: yes, as C7 says.
- Item 12: yes. No case or check reads README lines 38 and 43 after the change, and C6 and C7 do not cover README.
- Item 13: no (C8).
- Item 14: no. Rule 14's grep, quoted in the report, is its check.

Findings:

1. C6 and item 6 pass without the brief check asking only for cases that check what the step changes.
2. C7 and item 11 pass on the unchanged tree. No case reads the three changed glossary entries.
3. Items 5 to 9 have no check that a step labelled small changed only text in fewer than 20 lines. The label is set before the build, and nothing compares it with the built diff before the step is reviewed once and landed.
4. Item 7 does not say how the one review of a small text step meets `review: earned`.
5. Item 12 has no case.

## 6. Implied inputs

Not a code step. The step changes rule text and skill text only, and no script, test or configuration file.

Findings: none.

## 7. ADRs

- 0001, the writing base reads the prose standard where it is: does not touch the step.
- 0002, the prose standard holds over the academic sources: does not touch the step.
- 0003, a fresh read-only agent reviews a draft (`/writing`): does not touch the step.
- 0004, a decision taken under self-rule ends "(self-rule)": does not touch the step.
- 0005, the choices go to one file at the ledger root: does not touch the step.
- 0006, the ledger records every agent's id with its role: touches the step. The step is under "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: ... the brief check in `brief_check`". The step removes the brief check for a small text step. That does not contradict the record, since no agent is started, but it changes what the `brief_check` key of the dispatch entry holds. `spec` Steps 9 writes the key, "The brief check" 5 fills it, `land` Steps 9 line 99 books from it, and `skills/plan/templates/orchestrator-state.md:34` describes it. The brief does not name 0006 under "What is on the tree" and does not say what `brief_check` holds for a small text step. Decision 1 says "no dispatch key is added" but is silent on the existing key's value.
- 0007, the run over a repair round runs on its own reviewer model: touches the step, and the brief names it with the sentence it is under. No contradiction.
- 0008, the cost script prices from a table copied by hand: does not touch the step.
- 0009, the cost script takes counts from the response body: does not touch the step.
- 0010, each plan's verify list is kept equal to the verification page: touches the step, and the brief names it with the sentence it is under. No contradiction: `/spec`'s compare and `/land`'s compare stay, and the list keeps its content.
- 0011, each plan keeps its own dispatch block: does not touch the step.
- 0012, every commit on main names its paths: does not touch the step.

Findings:

1. ADR 0006 touches the step and the brief does not name it. The brief also leaves open what the dispatch entry's `brief_check` holds for a small text step, which `spec` Steps 9, `land` Steps 9 and the `plan` skill's state-file template all read or describe.

## 8. Dictated text

- D1, item 1, for both copies: `- Code handles a case only when that case has happened or a wrong answer on it would lose work. A case that only could happen is not handled, and no brief, case or review finding adds one on those grounds.` (`grep -n 'Code handles a case only when' .scratch/2-1-scripts-cut-to-their-jobs/agents/briefs/1.md` printed lines 35 and 63; line 35 dictates it). The sentences are 19 and 21 words, within the prose standard, "E. Sentence shapes", sentence length. It breaks:
  - The rules file's rule 19 ("A change leaves no two statements that contradict each other"), against the bullet it follows in the same section (line 20). Line 20 makes a failure cost something when it is "lost work, a broken installation, a wrong configuration accepted". D1 lets code handle a case only when a wrong answer "would lose work". A case of `check_config.py` that accepts a wrong configuration, or one of `pin.sh` that breaks the installation, gets a test under line 20 but no handling under D1. Step 3 of this plan keeps tests for "the cases whose failure loses work, breaks the install or accepts a wrong configuration". Items 5, 6 and 7 carry the same narrower "would lose work" / "loses no work" into the brief template, the brief check and `/refute`.
  - The prose standard, "D. Structure", no synonym cycling, in Ordo's copy: Ordo's page names the concept "script" (line 20 "for a script", rule 1 "A defect in a script", rule 15 "For a script"), and D1 says "Code". The template copy reads "code" throughout, so D1 holds there.
  - The second sentence's first clause ("A case that only could happen is not handled") restates the first sentence in other words. That is the prose standard, "E. Sentence shapes", restating closes. The second clause carries the rule for briefs, cases and findings.
- D2, item 3, Ordo's copy: `- Every script is listed on \`docs/dev/scripts.md\` as a development, user or test script, with its job. A change that adds, removes or renames a script updates the page in the same change.` (`grep -n 'Every script is listed on' .../briefs/1.md` printed line 37). It breaks the rules file's rule 14 ("A sentence in a document ... that the change makes false is a defect of the change"). `docs/dev/scripts.md` does not exist (`ls docs/dev`), so "Every script is listed on `docs/dev/scripts.md`" is false on main from step 1's landing until step 3 lands. Main is tagged and pinned at step 1's landing, so the installed rules carry the false sentence in that time. The brief notes that the page is missing but does not say why the sentence may land false. As a separate point, the brief writes the backticks inside the code span as `\``, and a builder can read that as backslashes in the page. Otherwise it holds: 16 and 16 words, no banned word.
- D3, item 5, a template code line: `Size: <a small text step (no script, test or configuration file changed, fewer than 20 lines changed in all): no brief check, one review, no repair round | a full step>` (`grep -n 'Size: <a small text step' .../briefs/1.md` printed line 41). Read whole, it breaks:
  - The rules file's rule 17, since it does not carry Decision 2's counting rule ("counts the lines added and removed in all"). "Fewer than 20 lines changed in all" reads as lines changed, so a 15-line rewrite counts as 15 here and as 30 under Decision 2. Nothing else in items 5 to 10 writes Decision 2 into a skill.
  - `docs/dev/skill-layout.md`, "Writing for an agent": "a small text step" and "a full step" are terms in a sense of their own with no glossary entry, and the rule is that the entry is added to `plan-terms.md` first.

Findings:

1. D1's "would lose work" contradicts the bullet it follows ("lost work, a broken installation, a wrong configuration accepted") and step 3's line, under the rules file's rule 19. In Ordo's copy it also says "Code" where the page says "script" (prose standard, "D. Structure"), and its second sentence partly restates the first (prose standard, "E. Sentence shapes"). The goal's words are "would lose work". Whether the narrower test is meant is for the user or the orchestrator to rule, since no Rulings bullet (`plan.md` Rulings: "none") fixes D1's words.
2. D2 lands a sentence that is false on main until step 3, against the rules file's rule 14. Its backticks are written as `\``.
3. D3 leaves out Decision 2's counting rule and uses two undefined terms.

## Declined to judge

- Whether the size line, a new field that `/spec` writes and three skills read, is a user-visible choice (a vocabulary or a format) that `spec` Steps 4 sends to a stop. Under `self_rule: on` that is the orchestrator's judgment, and the brief records it as Decision 1.
- Whether counting added and removed lines (Decision 2) is the reading of the goal's "fewer than 20 lines" that the user meant. A rewrite of 10 lines counts 20 under it.
- Whether "the ASCII check over those files" is defined enough. Two points are facts:
  - Ordo's verify-list check (`docs/dev/building.md`, last command) runs over every git file and allows the checkmark in `.md` files. The state file's "Verification, every step" check (`LC_ALL=C grep -n '[^ -~]'`) does not allow it.
  - A repository without any ASCII check exists: `grep` for `ascii`, `non-ascii` and `[^ -~]` printed nothing in the verification pages of cathedra (`docs/dev/building/building.md`), game-engine (`docs/dev/building.md`) and research-hub (its migration plan's state file). Those repositories have used the skills, so items 4 to 8's generic text names a check they lack. `templates/brief.md` line 92 handles that today with "when the verify list holds one".

  How the generic text should read is the session's call.
- The brief has no "What it must do" section, which `templates/brief.md` has. That is outside the eight checks, and I named it so the session can decide.
- Whether the version-raise conflict (section 4) is settled by the tag at step 1's landing, which could count as a release between the plan's raises. `docs/dev/skill-layout.md` does not say so.

Agent usage: aefdc70d38c003911, claude-opus-5-5, 183460 tokens, 50 tool uses, 7.7 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- Section 8 findings 1 to 3: ruled by the user on Open item A (A1 (a), A2 (a), A3 (a)). D1 is replaced by item 1's two bullets, `A script handles ...` in Ordo's page and `Code handles ...` in the template, whose "costs something" is the cost test of the bullet before it, and a second sentence that does not restate the first; held line by line by the session: 20 and 12 words (19 and 12 in the template), no synonym change within each page, no banned word. D2 left the step (moved to step 3). D3 is replaced by the size line `Size: <a small text step: no brief check, one review, no repair round | a full step>`, whose term the new glossary entry of item 4 defines with the count of A3 (a); held: a code line read whole, the term defined before use.
- Section 1 finding 1: `skills/ordo-help/SKILL.md` added to the paths, item 12 and item 15 (version).
- Section 1 finding 2: `skills/spec/templates/brief-check.md` added to the paths and item 6.
- Section 1 finding 3: `skills/plan/templates/orchestrator-state.md` and `skills/plan/SKILL.md` line 5 added, item 13 and item 15. The ledger's own state file is the orchestrator's.
- Section 1 finding 4: item 4 adds the entry **small text step** (and names a full step) to `plan-terms.md` and the glossary first.
- Section 2 finding 1: item 7 makes **Cases and checks** name a case that checks a place the step does not change.
- Section 2 finding 2: moot; the scripts-page line moved to step 3 by A2 (a).
- Section 2 finding 3: the brief says the tag and the pin are the orchestrator's and the user's at landing.
- Section 3 finding 1: ADR 0006 named under "What is on the tree"; Decision 1 and item 7 say `brief_check` reads `none, a small text step`.
- Section 3 finding 2: every page is cited by its section; line numbers stay only under "Paths this step writes".
- Section 4 finding 1: item 15 raises each skill once for the whole plan, each to its major part, so step 3 raises none of them again.
- Section 5 finding 1: item 7 and C6, which now reads every changed file.
- Section 5 finding 2: C4 reads the three entries and the new one.
- Section 5 finding 3: item 8 adds the **Spec** finding that compares the size line with the built diff, and the step is then handled as a full step; item 9 follows.
- Section 5 finding 4: items 8 and 9 give a small text step its one review under `every` and `earned` alike.
- Section 5 finding 5: C6 reads `README.md` with the other paths.
- Section 7 finding 1: as section 3 finding 1.
- Declined to judge, the character-set check: items 3 and 5 name it "where the verify list holds one". The missing "What it must do" section is added.
