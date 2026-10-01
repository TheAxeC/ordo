# Step 11b brief check (on main at f84d3e7)

This is the report of the fresh agent described in the `spec` skill's "Steps / The brief check", on `.scratch/2-e-a-self-rule/agents/briefs/11b.md`. Every command below ran in /Users/axelfaes/workspace/ordo. `git log --oneline -1` printed `f84d3e7 Stop step 12 of plan 2.E.A at Open item L and close Open item M under self-rule`, and `git status --short` printed only `?? .scratch/2-e-a-self-rule/agents/briefs/11b.md`. Scratch files are under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/bc11b.

## 1. Names

I ran the brief's own grep, `grep -rn 'closing report\|the script exits 0' skills docs README.md`. It printed exactly the list the brief gives: `skills/plan/SKILL.md:87`, `:89`, `skills/plan/templates/plan.md:21`, `skills/plan-orchestration/SKILL.md:136`, `:289`, `skills/plan-orchestration/references/self-rule.md:52`, `skills/repo-setup/templates/plan-terms.md:22`, `:23`, `docs/glossary.md:27`, `:28`.

I then ran a wider grep over every tracked file outside `.scratch/`: `git ls-files | grep -v '^\.scratch/' | xargs grep -n 'closing step\|closing report\|closing\.md\|cost script\|plan_cost\|names no agent\|exits 0\|the closing runs\|the closing:'`. These are its hits outside "Paths this step writes" that concern the closing or the cost script:

- `README.md:151`: "The closing step of a plan runs the cost script, which prices the usage of each agent role." The change makes this false. After it, the closing step runs the script only when the ledger names an agent. README.md is not in the paths and no item of "What to build" reaches it. The brief's grep in "What it must do" and Verify 6 cannot find it, because the line does not contain "closing report" or "the script exits 0".
- `README.md:153`: "...so the closing finds it in the settings." Still true: it describes a run of the script, and the script still runs whenever the ledger names an agent.
- `skills/plan-orchestration/SKILL.md:136`: "After the closing step, it also names the path of the closing report." Still true, because a closing report is written in both cases.
- `skills/plan-orchestration/SKILL.md:131`, `:133`, `:316`: these describe next-entry mode and the stop on the roadmap diff. They say nothing about the script, so they stay true.
- `skills/plan-orchestration/references/self-rule.md:52`: "The orchestrator takes the next entry only after the closing step has written the closing report and moved the ledger folder." Still true, because both still happen in the no-agent case.
- `skills/plan-orchestration/SKILL.md:290-291` ("Usage", running the script by hand): still true.
- `skills/plan/SKILL.md:80`, `:90`, `:91`, `:98`, `:112`, and `skills/roadmap/SKILL.md:19`: these name the closing step as a step and say nothing about the script, so they stay true.
- `docs/adr/0009-...md:21`: "...so the closing, run through a tool, finds the folder in the settings files." Still true for a run that happens.
- `docs/glossary.md:32` and `skills/repo-setup/templates/plan-terms.md:27` (the term **cost script**), `docs/adr/0007`, `0008`, `docs/adr/README.md:18-19`, `docs/dev/building.md:12`, `docs/dev/change-standard.md:73`: these describe the script and not when the closing runs it. Still true.
- The remaining "exits 0" hits in `README.md:149`, `docs/academic-coverage.md:24`, `docs/dev/building.md:19,29`, `docs/dev/skill-layout.md:89`, `skills/land/...`, `skills/ordo-init/SKILL.md`, `skills/repo-setup/SKILL.md:113`, `skills/roadmap/SKILL.md:102`, `skills/session-retro/...` and `utils/pin.sh:57` concern other scripts and are not touched.
- `grep -rn 'A red check' skills` printed `skills/plan/SKILL.md:88` (in the paths), `skills/plan-orchestration/SKILL.md:313` (the Stops row, unchanged and still true) and `skills/repo-setup/templates/plan-terms.md:85` (the term **red line**, still true).
- `grep -rn 'agent-roles' skills docs README.md` found the file named only in `plan_cost.py` and its test. No skill text names or defines `agents/agent-roles.md`, and the glossary's **ledger** (`docs/glossary.md:61`) lists `plan.md`, `orchestrator-state.md`, `agents/briefs/` and `agents/reviews/` but not that file. The change puts the file's name into `skills/plan/SKILL.md` for the first time. This makes no existing sentence false.

Findings:
- F1. `README.md:151` becomes false after the change and is outside the paths. Under the rules file, "The rules" 5 and 19, the user page that describes the closing's run of the cost script has to change in the same step. The brief needs `README.md` line 151 added to "Paths this step writes" and an item that makes it say the closing step runs the script when the ledger names an agent. The grep in "What it must do" and Verify 6 also needs widening so it can find this sentence, for example `grep -rn 'closing step\|closing report\|runs the cost script\|the script exits 0' skills docs README.md`.

## 2. The step line

The plan's step 11b line, printed by `grep -n '^- 11b' .scratch/2-e-a-self-rule/plan.md` (line 39), maps to the brief as follows:

- "`skills/plan/SKILL.md` Steps 2 runs the cost script only when the Agents section or `agents/agent-roles.md` holds an agent bullet": item 1.
- "with none the closing report says the plan started no agent and the folder moves": item 1, which dictates the sentence.
- "`templates/plan.md` ... read with it": item 2.
- "`plan-orchestration` "Usage" read with it": item 3.
- "check: each changed text read in place": Verify 6 and the reviewer's reading. Cases 1 to 4 are read on the changed text.
- "and `plan_cost.py` on a scratch ledger with no agent bullet still exits 1 with `error: the ledger names no agent`": item 5, Case 5, and Verify 2 and 3.
- "(1 commit) (ruling M)": the step's authority. Ruling M is at `plan.md:92` and ends "(self-rule)".
- Item 4 (the glossary terms) serves no words of the line. It carries the change to the two terms that state it, as the rules file's "The rules" 14 requires.

Findings: none.

## 3. Premises

- `sed -n 85,89p skills/plan/SKILL.md` printed line 85 "The last step is the closing: ...", line 86 "Before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder.", line 87 "The closing step writes the script's output to `agents/reviews/closing.md`, the closing report.", line 88 "A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`, ..." and line 89 "The ledger folder moves only when the script exits 0.". This matches the brief.
- `sed -n 74p skills/plan/SKILL.md` printed "- With no agent bullet in the rulings file, and with no rulings file, the `## Agents` section is written with its sentence and no bullet.". This matches.
- `grep -n 'the ledger names no agent\|bullets == 0' skills/plan-orchestration/templates/plan_cost.py` printed `55: error: the ledger names no agent (no bullet in plan.md's Agents section or in agent-roles.md)`, `282: if bullets == 0 and complete:` and `283: errors.append("the ledger names no agent")`. Reading lines 257-288 confirms that `complete` is false when `plan.md` or `agent-roles.md` exists but cannot be read. This matches the brief's "and both were read".
- `sed -n 21p skills/plan/templates/plan.md` printed "- <last> the closing: the cost script's output written as the closing report, the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)". This matches.
- `sed -n 289p skills/plan-orchestration/SKILL.md` printed "- The closing report holds the cost script's output, as the `plan` skill's Steps 2 says.", and `grep -n '^## ' skills/plan-orchestration/SKILL.md` puts `## Usage` at line 286. `sed -n 136p` printed "      - After the closing step, it also names the path of the closing report.", which is under Steps 10 (line 128 "10. Continue with step 2."). This matches.
- `sed -n 20,25p skills/repo-setup/templates/plan-terms.md` showed **closing report** at line 22 and **closing step** at line 23 with the quoted words, and `docs/glossary.md:27-28` holds the same text. This matches. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0.
- `grep -n 'Open item M' .scratch/2-e-a-self-rule/plan.md` gives the Rulings bullet at line 92 and the open item in full under "### Step 11b, the closing of a plan with no agent: Step 0". The brief quotes both correctly.
- ADR titles: `ls docs/adr` and reading each file confirm that 0006, 0008 and 0009 have the titles and decision sentences the brief gives.
- The verify list, printed by `awk` over the yaml block of `orchestrator-state.md`, holds 11 commands, which matches "checks: 11 commands passed" in Verify 1.
- `sync_rules.py` takes `--write` and `--only glossary` (`grep -n -- '--write\|--only' skills/repo-setup/templates/sync_rules.py`, line 4: "Usage: sync_rules.py <repository root> [--write] [--only glossary]"). This matches item 4's command.

Findings: none.

## 4. Cases and checks

- Case 1: consistent with the rules file and the standards. It is a preserved behaviour, read on the text.
- Case 2: consistent. The rules file's "The rules" 1 says a defect in text is fixed by reading, with no test.
- Case 3: consistent. It tells apart a condition that reads both places from one that reads only `plan.md`.
- Case 4: consistent with `plan-orchestration` "Stops", row "A red check" (`skills/plan-orchestration/SKILL.md:313`). I confirmed the script's side on a scratch ledger whose Agents section holds `- a1: builder of step 1, m` with no transcript: `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py $S/l5 $S/l5` printed `error: no transcript of agent a1 under .../bc11b/l5` and gave `exit 1`.
- Case 5: consistent. I ran it with `printf '# Plan: 9 Scratch\n\n## Agents\n' > $S/ledger/plan.md`, then `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py $S/ledger $S/ledger; echo "exit $?"`. Output:
  ```
  error: the ledger names no agent
  exit 1
  ```
  With stderr dropped (`2>/dev/null`), it printed nothing and gave `exit 1`, so the error line goes to stderr and stdout is empty.

Findings: none.

## 5. The question

"The goal" here is the part of the plan's goal the step delivers: a plan run under self-rule, including one whose every step is "orchestrator, no agent", closes without an unresolvable stop, and the cost script's approved computation is unchanged.

- Case 1: yes, it could pass without the goal. It holds on the unchanged tree too, because it is a case of preserved behaviour and does not prove the goal.
- Case 2: no. On the unchanged text the closing step runs the script, which exits 1, and the folder stays. The case holds only on a text that adds the condition.
- Case 3: no. A text whose condition reads only the Agents section would skip the script here, so the case fails.
- Case 4: yes, it holds on the unchanged tree. It is a case of preserved behaviour.
- Case 5 and Verify 2: yes, by design. Both pass before and after the change and prove item 5 (the script unchanged), not the goal.
- The step line's check: its first part, "each changed text read in place", is no, since it is a reading of the changed text. Its second part, the script still exiting 1, is yes, by design, as for Case 5.
- Item 1 (Case 2, read on the text): no.
- Item 2 (read in place, and Verify 6 lists `plan.md:21`): no.
- Item 3 (read in place, and Verify 6 lists `:289`): no.
- Item 4: Verify 4 alone could pass without the goal, because the sync check prints `ok` on the unchanged tree. Verify 6 lists `docs/glossary.md:27-28` for reading, so the item as a whole is no.
- Item 5 (Verify 3): yes, by design.
- "What it must do" and Verify 6, "each hit true after the change": yes. Both pass with `README.md:151` still saying the closing step runs the cost script, because the grep cannot find that line (F1).
- `plan.md`'s "## Gate" has no answer line for step 11b. `sed -n '/^## Gate/,/^## Steps/p' .scratch/2-e-a-self-rule/plan.md | grep -n '11b\|Steps 9 to 12'` printed only "Steps 9 to 12: could this pass without the goal being reached? No, each is Axel's reading of a real run or of real output.", and that reason does not describe 11b's check. This is a ledger matter for the orchestrator, not part of the brief.

Findings:
- F1, again: the grep in "What it must do" and Verify 6 lets the step pass with `README.md:151` false.

## 6. Implied inputs

This step changes skill text, not a script. As asked, these are the inputs the closing step's new condition implies but "Cases" does not list, each with its expected result. I ran the script on each in the scratch folder.

- I1. An `agents/agent-roles.md` that exists but cannot be read (mode 000), with an empty Agents section. `chmod 000 $S/l2/agents/agent-roles.md; OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py $S/l2 $S/l2` printed `error: cannot read .../bc11b/l2/agents/agent-roles.md: Permission denied` and gave `exit 1`. The script does not decide "names no agent" when a file is unreadable, because `complete` is false. Item 1's condition as worded gives the closing step no rule for a file it cannot read, so it could write "the plan started no agent" and move the folder. That breaks the brief's own Decision 1, "the closing step and the script never disagree". Expected result: the closing step treats a ledger file it cannot read as one that may name an agent and runs the script. The script exits 1 with the `cannot read` line, the stop "A red check" applies, and the folder stays.
- I2. A `plan.md` with no `## Agents` heading at all and no `agents/agent-roles.md`, for example a plan opened before the Agents section existed. `$S/l3/plan.md` holds `# Plan: 9 Scratch` and a paragraph. The script printed `error: the ledger names no agent` and gave `exit 1`. Under item 1 the closing step skips the script and writes "the Agents section of `plan.md` and `agents/agent-roles.md` hold no agent bullet", which describes a section that does not exist, about a plan that may have started agents. `for d in .scratch/*/; ...` shows that all four open ledgers (2-e-a, 2-f, 2-g, 2-h) have one `## Agents` heading and 15 to 19 agent bullets, so no open Ordo plan meets this case today. Other repositories' open plans can. Expected result, which is the orchestrator's choice to state in the brief: either (a) the case closes with "no agent", the dictated sentence reworded so it is true when the section is absent, for example "`plan.md` names no agent in an Agents section, and the ledger has no `agents/agent-roles.md` that names one", or (b) a `plan.md` with no `## Agents` heading runs the script, which exits 1, the stop "A red check" applies and the folder stays. I recommend (b). `skills/plan/SKILL.md:74` makes `/plan` always write the heading, so a missing heading is a ledger `/plan` did not write, and Open item M's accepted con covers an empty section, not a missing one.
- I3. An Agents section holding only its sentence, with bullets in a later `## ` section such as "Blocked, and by what". `$S/l4` gave `error: the ledger names no agent`, `exit 1`. The brief's words "a bullet in `plan.md`'s `## Agents` section" already decide this case and agree with the script (no agent). It needs no case of its own.
- I4. Bullets only in `agents/agent-roles.md`: this is Case 3. `$S/l6` gave `error: no transcript of agent a1 ...`, `exit 1`, which confirms the script reads that file.

Findings:
- F2. I1 is missing from "Cases". Its expected result is the script run, its `cannot read` error and the stop "A red check".
- F3. I2 is missing from "Cases". Its expected result is (a) or (b) above, chosen by the orchestrator. Under (a), the dictated sentence of item 1 has to change (see check 8).

## 7. ADRs

I read every file under `docs/adr` (`ls docs/adr`, then `cat` of each `0*.md`). All nine have `Status: proposed`, and none says it is superseded.

- 0001, 0002, 0003 (the writing base, the prose standard over academic sources, the fresh review agent): they do not touch the step.
- 0004, "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)".": this governs the step's authority (ruling M, `plan.md:92`, ending "(self-rule)"), not anything the step changes. Not touched, and no contradiction.
- 0005 (the choices file): Open item M is entry C3 in `.scratch/choices.md` (`grep -n` printed `9:## C3. The closing of a plan whose ledger names no agent (2026-10-01)` and `20:Booked: .scratch/2-e-a-self-rule/plan.md:92 (Open item M)`). The step does not change it. Not touched.
- 0006, "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model ... The cost script takes the ids and roles from the plan's ledger only.": touched, because the new condition reads that record. The brief names it. The condition reads the same two places the script reads, so there is no contradiction.
- 0007 (`repair_reviewer`): not touched.
- 0008, "The script reads a price table kept beside it ... A model the table lacks is an error that names the model.": touched through what the closing runs. The brief names it. The step leaves the table and the computation unchanged, so there is no contradiction.
- 0009, "The script takes a response's counts from its response body when the body's file exists ...": touched. The brief names it. Its Consequences sentence "so the closing, run through a tool, finds the folder in the settings files" stays true for every closing that runs the script, so there is no contradiction.

Findings: none.

## 8. Dictated text

The dictated passages are located by `grep -n 'The plan started no agent\|the closing report written (\|or the sentence that the plan started no agent\|and otherwise the sentence that the plan started no agent' .scratch/2-e-a-self-rule/agents/briefs/11b.md`, which printed lines 20, 21, 22 and 23. `LC_ALL=C grep -n '[^ -~]'` on the brief printed nothing (exit 1), so every dictated line is ASCII with no em or en dash.

- Line 20, item 1, the closing report's sentence: "The plan started no agent: the Agents section of `plan.md` and `agents/agent-roles.md` hold no agent bullet, so the cost script was not run."
  - It breaks the prose standard, E "Sentence shapes", "Passive voice: rewrite unless the actor is irrelevant". "the cost script was not run" leaves out the actor, the closing step, which matters to a reader of the archive. Proposed rewrite: "so the closing step did not run the cost script".
  - Accuracy, not a page rule: in Case 2, the usual case, `agents/agent-roles.md` does not exist, and the sentence says the file holds no agent bullet. Under I2 (a), there is also no Agents section to "hold" anything. A wording that stays true in both, for example "The plan started no agent: `plan.md`'s Agents section holds no agent bullet and the ledger has no `agents/agent-roles.md` that holds one, so the closing step did not run the cost script.", also closes the passive.
  - It holds against the glossary ("Agents section" is used in the glossary's sense, `docs/glossary.md:11`), the layout page and the rules file. At 23 words it is within the prose standard's "roughly 20 words unless the mechanism needs more".
- Line 21, item 2, the template words: "the closing report written (the cost script's output, or that the plan started no agent)". Holds. The resulting line also carries the tag "(orchestrator, no agent)", in which "no agent" means the step has no builder. `grep -rn 'no agent' skills` shows no skill parses the phrase, so the two uses do not collide for a skill. A reader meets "no agent" twice in one line in two senses, which the prose standard's D "No synonym cycling" does not cover. I note it and it is not a finding.
- Line 22, item 3, the Usage words: "the closing report holds the cost script's output, or the sentence that the plan started no agent, as the `plan` skill's Steps 2 says". Holds. It names its source section as the layout page's "Where a rule goes" asks.
- Line 23, item 4, the term words: "the closing report holds the cost script's output for a plan whose ledger names an agent, and otherwise the sentence that the plan started no agent; a non-zero exit of the cost script holds the folder where it is". Holds. "ledger" is used in the glossary's sense (`docs/glossary.md:61`). The semicolon joins the two terms' content in the brief only, and each term is its own bullet in the file.
- Item 1 also requires "One rule per bullet", as the layout page's "Lists and tables" does.

Findings:
- F4. Line 20's dictated sentence breaks the prose standard, E "Passive voice". Separately, it is inaccurate in Case 2 (the file does not exist) and under I2 (a) (no section exists). Rewrite as proposed above.

## Declined to judge

- Whether Open item M's option (a) narrows ruling D7 ("run by the closing, which puts each role's priced usage in the closing report", `plan.md` Rulings, "(the user)") and step 4's approved line ("the closing runs it and its output goes into the closing report"). If it does, it would be kind 3 of `references/self-rule.md` ("contradicts a bullet of a Rulings section"), not the "none of the six kinds" the open item records. This classifies an item the orchestrator already closed under self-rule. It is the orchestrator's to re-examine and the user's to settle in the review of C3, and a read of the brief cannot settle it. The evidence: a plan with no agent has no roles to price, so D7's "each role's priced usage" is empty for it.
- Whether "the plan started no agent" is a fact the closing step can know. The ledger can show only that no agent was recorded, which is the con Open item M's option (a) accepted. That is a ruling's wording, not something I can check.
- The missing "## Gate" answer line for step 11b in `plan.md` (check 5). It is the orchestrator's ledger and outside the brief.

Agent usage: a4833282be61ec94d, claude-opus-5-5 (ordo-high), 136896 tokens, 35 tool uses, 5 min 13 s.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- F1 (`README.md:151` made false, the grep unable to find it): item 5 rewrites the sentence to "runs the cost script when the plan started an agent"; `README.md` line 151 joins "Paths this step writes"; the grep of "What it must do" and Verify 6 is `grep -rn 'closing step\|closing report\|runs the cost script\|the script exits 0' skills docs README.md`.
- F2 (an unreadable `agents/agent-roles.md` missing from Cases): item 1's condition skips the script only when no `agents/agent-roles.md` exists, so an unreadable one goes to the script; case 5 states the result, the script's `cannot read` error and the stop "A red check".
- F3 (a `plan.md` with no `## Agents` heading missing from Cases): option (b) taken, since `/plan` always writes the heading (`skills/plan/SKILL.md:74`) and a missing one is a ledger `/plan` did not write; item 1's condition requires the heading, and case 6 states the result, the script's error and the stop. The section-only case (I3) is case 7.
- F4 (the dictated sentence passive and untrue when the file does not exist): the sentence reads "The plan started no agent: `plan.md`'s Agents section holds no agent bullet and the ledger has no `agents/agent-roles.md`, so the closing step did not run the cost script."
- "The question", the missing "## Gate" answer for step 11b: added to `plan.md`'s "## Gate".
- "Declined to judge" 1, whether Open item M narrows ruling D7: D7 says the closing runs the script "which puts each role's priced usage in the closing report"; a ledger that names no agent has no role to price, and every ledger that names one still goes to the script, so the option does not contradict D7 and the item stays outside kind 3. C3 carries it to the user's review.
