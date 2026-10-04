# Step 7 brief check (on main at e12c862)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/7.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

## 1. Names

The commands were run from `/Users/axelfaes/workspace/ordo` over `skills docs README.md utils .agents`, using `grep -rn -F -- "<name>" skills docs README.md utils .agents`.

- `--self-rule`, `Next-entry mode`, `next-entry mode`: no hit anywhere.
- `next_entry`: hits outside the paths are `skills/plan/templates/plan.yaml:29`, `skills/plan/templates/orchestrator-state.md:29` (both say "on, with self_rule on: after a plan closes / after the closing, the orchestrator takes the next open roadmap entry"), `skills/plan/templates/plan.projects.yaml:31,58`, `skills/ordo-init/SKILL.md:98,132,134`, `skills/ordo-init/templates/check_config.py:17,21,35,37,141,177-178` and its test, `skills/repo-setup/templates/plan-terms.md:25`, `docs/glossary.md:30` and `docs/adr/0005-...md:7,11`. Each one still holds after the change, because the brief's Decision 1 takes the next entry only after the closing.
- "A skill with its own approval stop": the hits are `references/self-rule.md:21,27`, both inside the paths.
- "The review of a choice": the hits are `plan-orchestration/SKILL.md:127` and `references/self-rule.md:58,60`. They are inside the paths and hold.
- `Booked:`, `(Open item <L>)`, `replacing Open item`: every hit is inside the paths (`references/self-rule.md:50,51,56,69,75`, `templates/choices.md:14`). `references/self-rule.md:56` is not named in "What to build". It dictates the `Ruled:` reply's bullet as `replacing Open item <L'>`. After `/plan` copies a `/grill --self-rule` bullet, that bullet is named `D<n> <phrase>`, so a `Ruled:` reply that replaces it cannot follow the form at :56, and the form becomes false for such a bullet. Verify 3's grep (`replacing Open item <L>`) does not match `<L'>`, so it would not catch the problem.
- `Builds on it`: the hits are `skills/spec/SKILL.md:141` (holds) and `references/self-rule.md:52-54,58,77-84` (inside the paths). Line 52 says "`Builds on it:` names the step the open item stopped..." and is reread by item 1.3.
- **quoted ruling** / "take only": the hits are `README.md:56`, `plan-terms.md:79`, `glossary.md:84` and `references/self-rule.md:23`, all in the paths. `grep -rn 'only a bullet\|take only\|takes only\|ending "(the user)"' ...` prints only these lines and `spec/SKILL.md:305`, which holds.
- "did not ask for" / "Writes only after the user approves" / "each change the user approved": the hits are `roadmap/SKILL.md:3,10,183,189` (in the paths) and `skills/grill/SKILL.md:258`. That grill line says "under the `roadmap` skill's Rules: ... nothing the user did not ask for". It holds, because it governs `/grill`'s own roadmap diff.
- `choices file`: the hits are `skills/ordo-help/SKILL.md:37,43` (holds) and `skills/repo-setup/templates/shared-rules.md:20`, discussed below.
- `roadmap add`, `Not yet specified`: the hits outside the paths are `README.md:32-33`, `ordo-help/SKILL.md:57-58`, `ordo-init`, `repo-setup`, `session-retro`, `roadmap/templates/roadmap.md` and `docs/figures`. They hold.

Findings:
1. `skills/plan-orchestration/references/self-rule.md:56` (in the paths, no item): the `Ruled:` reply's form `replacing Open item <L'>` is false for a replaced `D<n> <phrase>` bullet that `/plan` copied out of a `/grill --self-rule` rulings file. Item 1.4 changes only the `C<n> =>` form.
2. `skills/plan/SKILL.md` has three sentences in the paths that the change makes false, and "What to build" has no item for them:
   - "What it reads" 4 says the rulings file holds "the user's settled design answers". Under `/grill --self-rule` it holds "(self-rule)" bullets.
   - Rules bullet 2 says `(ruling <name>)` is for "a step a ruling added, after the approval or under a quoted ruling ending "(self-rule)"". A `--self-rule` list tagged `(ruling A)` is neither of those.
   - The Anti-patterns row "Writing `plan.md` before the user has approved the step list" says the design half is the user's.
3. `skills/plan/SKILL.md` Stops row "The drafted step list" has When "Every plan, after Steps 2, except a draft written under a quoted ruling". Under `--self-rule` that stop is closed without the user, so the row is false and has no item.
4. `skills/grill/SKILL.md` (in the paths, no item for any of these):
   - Stops row "A round" has When "Every round", and row "The end" asks the confirmation and the commit. Both are false under `--self-rule`.
   - The intro (line 10) says "one commit when the user allows it".
   - Steps 1 says "Every refusal of "What it reads" 1 and 2 is made here, before anything is written". The new refusal in "What it reads" 12 is not named there.
   - "What it reads" 1 lists the optional keys without `self_rule` and `next_entry`, which item 5.2 makes `grill` read.
5. `skills/plan-orchestration/SKILL.md` (in the paths): the intro (line 10), the Quick start line 15 ("until a pause, or until nothing unblocked is left") and the description ("Run an open plan unattended, step by step") describe the loop as one plan's. Under next-entry mode the loop opens and runs the next entries. Rules 14 requires a sentence about the file as a whole to be reread, and the brief names none of them. "What it reads" has no item for the roadmap and the ledger folders that next-entry mode reads to find the next entry and its open plan (skill-layout, "Sections, in order", row 4: one input per item).
6. Outside the paths:
   - `README.md:20` (the `plan-orchestration` row, "Runs an open plan unattended ...") and `README.md:41` (`/plan-orchestration <entry>   instead of the step lines: runs them for every step unattended`) are not false, but they no longer describe what the loop does under `next_entry: on`. The rules file, "The rules" 5, requires a user-visible surface to be documented on the page where it is shown. The behaviour is documented only in the example `plan.yaml` comment (`skills/plan/templates/plan.yaml:29`), which holds. The orchestrator should decide whether README needs a line.
   - `docs/adr/0005-...md`, Consequences, says "the path is written as it stands when the choice is booked". Items 1.3 and 4.3 rewrite `Booked:` from the rulings file to the new `plan.md` when `/plan` copies the bullet. That is a refinement of the record's consequence, and the brief neither names it nor puts `docs/adr/0005` in the paths. The rules file, "The rules" 5, asks for the ADR that owns the decision to be documented in the same step.
   - `skills/repo-setup/templates/shared-rules.md:20` ("No question boxes") says "Under a plan's `self_rule: on`, such a decision ... is taken with its recommendation". `/grill --self-rule` and `/plan --self-rule` run while no plan of their entry exists. A literal reader finds the shared-rules exception does not cover them, and changing that file is kind 3 (the user's written rules). See "Declined to judge".

## 2. The step line

The step line was taken from `grep -n '^- 7 ' .scratch/2-e-a-self-rule/plan.md`, which prints line 34.

- "`next_entry`": served by items 1.1 and 3.
- "after a closing, the next open entry": served by item 1.1 (bullets 1 to 4).
- "through `/grill` (each round answered with its recommendation, written to `choices.md`)": served by items 5.3 and 5.4, with 5.1, 5.2, 5.5 and 5.6 supporting.
- "`/plan` (its approval written to `choices.md`)": served by item 4.4, with 4.1, 4.2, 4.3 and 4.5 supporting.
- "and the loop": served by item 1.1 ("the loop on the new plan") and item 3.
- "stopping at an entry under "Not yet specified"": served by item 1.1, second sub-bullet.
- "at an item of the six kinds": served by items 1.1 (fifth bullet), 5.3 and 4.4.
- "or when no open entry is left": served by item 1.1, first sub-bullet.
- "`/roadmap add` only for work a ruling or a finding names": served by items 6.1, 6.2, 6.4 and 1.2.
- "in `plan-orchestration`, `grill`, `plan` and `roadmap`": served by items 1 to 6. Items 7 and 8 cover the sentences outside those four skills.
- "check: each changed text read in place": the reviewer's reading. The verify list holds fact checks only.
- "(ruling E)": served by items 6.1, 1.2 and 1.1 (kind 4 kept), and cases 14, 15 and 17.
- "(ruling F)": served by items 4.1, 4.2, 4.6, 5.1, 5.2 and 5.8.

Findings: none. Every part of the line has an item.

## 3. Premises

- Step line: `grep -n '^- 7 ' .scratch/2-e-a-self-rule/plan.md` prints `34:- 7 `next_entry`: after a closing, ...`, the text the brief quotes. Matches.
- Goal at `docs/roadmap.md` line 24: `sed -n 24p docs/roadmap.md` prints the goal with the next-entry sentences quoted. Matches. Kind 4 is `references/self-rule.md:17`, "The closing's roadmap diff, tag and pin.", which matches.
- Rulings D1, D4, E and F: `awk '/^## Rulings/,0' plan.md` shows D1 at line 52, D4 at 55, Open item E at 86 and Open item F at 87 (`sed -n 87p` prints `- Open item F (2026-10-01): option (a): an argument `--self-`). The quotes match. D4 is quoted in part; its "it replaces the goal's words ..." clause is left out, which is harmless.
- `grill` lines: `sed -n '145,182p;233,248p;330,338p' skills/grill/SKILL.md` shows :151 "The round ends the turn and waits for the answers", :238 the bullet form, :176-181 the confirmation and commit, and :333 the Rules sentence as quoted. Matches.
- `plan` lines: `cat -n skills/plan/SKILL.md` shows Steps 3 at :89-104, the Stops row at :126, `(ruling <name>)` at :103 and the rulings-file removal at :119. Matches. `grep -n 'self_rule\|next_entry' skills/grill/SKILL.md skills/plan/SKILL.md` prints only `skills/plan/SKILL.md:106`. Matches.
- `roadmap`: :55 "The bullet's first line does not end with "(the user)"", :189 "Nothing is added that the user did not ask for." and :10 "It leaves behind each change the user approved, committed on its own." Matches. The description length differs by method:
  - The brief's regex command prints `roadmap 1001`.
  - skill-layout's own command, "Frontmatter" ("counted as the length of its YAML value once parsed"), prints `997 skills/roadmap/SKILL.md`. The regex counts the four backslashes of `\"`.
  - Mismatch on the measure, not on the limit: both are under 1,024. The brief's figure is not the standard's count.
- `plan-orchestration`: :130 "The loop ends only at a pause or when nothing unblocked is left, ...", "Self-rule" at :224-227, Rules list at :362, description 865 (both methods print 865). Matches.
- `references/self-rule.md`: `wc -l` prints 87. Matches. `grep -n 'A skill with its own approval stop\|^## \|Open item <L>\|Rulings section of the plan that line names' skills/plan-orchestration/references/self-rule.md` prints:
  - The heading "A skill with its own approval stop" at :21 and its sentence at :23. The brief says "line 25", which is `## Closing an open item`. Mismatch.
  - The `Booked:` form at :50-51. The brief says "lines 52-53", which are the `Builds on it:` and `/grill` roadmap-diff bullets. Mismatch.
  - The review's "finds the bullet ... in the Rulings section of the plan that line names" at :69. The brief says "line 70", which is the refusal bullet. Mismatch.
  - The `C<n> =>` bullet at :75. Matches.
- `templates/choices.md`: `grep -n Booked skills/plan-orchestration/templates/choices.md` prints `14:Booked: `<path>:<line>` (Open item <L>)`. The brief says "line 15", which is `Builds on it:`. Mismatch.
- `.scratch/choices.md`: `cat -n` shows C1 with `Booked: .scratch/2-e-a-self-rule/plan.md:87 (Open item F)`. Matches.
- Sentences made false outside the four skills: `grep -rn 'take only your ruling\|for `plan` and `grill`' README.md docs skills --include='*.md'` prints `README.md:56`, `docs/glossary.md:84` and `skills/repo-setup/templates/plan-terms.md:79`. Matches. The list is not whole; see Names, finding 6.
- ADR citation: `grep -rn 'ADR [0-9]\{4\}' skills` prints only `skills/repo-setup/templates/plan-terms.md:5`. Matches.
- The Conventions line says "next-entry mode" is used "as `references/self-rule.md` uses them". `grep -rn -F 'next-entry mode' skills docs README.md` prints nothing, so the reference does not use the term yet.

Findings:
1. Four line numbers are wrong: `references/self-rule.md` "line 25", "lines 52-53" and "line 70" (actual :21/:23, :50-51 and :69), and `templates/choices.md` "line 15" (actual :14).
2. The roadmap description is "1001 characters" by the brief's regex, but 997 by the count `docs/dev/skill-layout.md`, "Frontmatter", defines.
3. The Conventions sentence claims a use of "next-entry mode" in `references/self-rule.md` that does not exist.

## 4. Cases and checks

- The cases are read-the-text cases for a text step. The rules file, "The rules" 1 ("A defect in text ... is fixed by reading, with no test") governs them, and rule 13's test duties do not apply. Their form is consistent with the rules file.
- Case 1:
  - Standards: consistent.
  - Against the described text: "nothing written" is not given. `grill` Steps 1 makes only the refusals of "What it reads" 1 and 2 before anything is written. Item 5.2 puts the new refusal in "What it reads" 12 and does not add it to Steps 1. A lookup agent's bullet, which "Steps / Looking up a fact" 4 writes, can then be written before item 12 is read.
  - skill-layout, "Lists and tables": "A step that can refuse or stop comes before every step that writes".
- Case 2:
  - Standards: consistent.
  - Against the described text: given, if item 5.3's exception list holds. See "The question" for kinds 1, 2 and the other kind-3 forms the list leaves out.
- Case 3: consistent, and given by item 5.3.
- Case 4:
  - Standards: consistent.
  - Against the described text: case 4 reads kind 6 as "options the goals, rules, rulings and ADRs do not rank". Item 5.3 adds "the standards".
  - `references/self-rule.md`, "The six kinds left open" 6, reads "the written rules, the rulings and the ADRs" and has no goals page.
  - So the brief's Decision 2 restates kind 6 for `grill` in other words. The rules file, "The rules" 19 (no two statements that contradict), and skill-layout, "Where a rule goes" (a rule is written once), apply.
- Case 5: consistent, and given by item 5.2.
- Case 6: consistent. It is a control and passes on the unchanged tree.
- Case 7:
  - Standards: consistent.
  - Against the described text, three problems:
    - Item 4.4 sends the reader to "Closing an open item" whole. Its items 6 (a commit at once with "the step's Step 0") and 7 (`/spec` again) have no meaning inside `/plan`, and the brief does not say which items apply.
    - The case's result also contradicts `plan` Rules bullet 2 and the Anti-patterns row, which "What to build" leaves unchanged (Names, finding 2).
    - The bullet form of item 4.4 drops "and what it unblocks" from the form of "Closing an open item" 3.
- Case 8: consistent.
- Case 9: consistent. `skills/spec/SKILL.md` "What it reads" 4 reads `<L>` from `- Open item <L> (<date>): ...` and accepts "(self-rule)". It passes on the unchanged tree.
- Cases 10 to 13: consistent, and given by item 1.1.
- Case 14: consistent, and given by item 1.1, second bullet.
- Case 15:
  - Standards: consistent.
  - Against the described text: the case names the finding "Spec 2", but items 6.1, 1.2 and Decision 5 say "the finding's heading".
  - A refuter report gives a finding no heading. `skills/refute/templates/report.md` has `## 1. Spec` with numbered or bulleted findings under it, and `.scratch/2-e-a-self-rule/agents/reviews/6-refuter.md:109-114` shows `## 1. Spec` followed by `1. ...`.
  - The described text therefore names a part that does not exist, and "Spec 2" is a heading plus an item number. A finding of a run over a repair round ("### Findings" under "## Repair round <n>, refuted") would also need a way to be named.
  - The case's invocation `/roadmap add --ruling ...` has no `<goal>`, while the Quick start is `/roadmap add <goal>`. The described text does not say whether the goal argument may be left out under a quoted ruling.
- Cases 16 and 17: consistent. They are controls and hold on the unchanged tree.
- Case 18:
  - Standards: consistent.
  - Against the described text: given only if the entry number is in the ruled text, since `roadmap` Steps 2 makes the number part of the ruled text for `add`. Otherwise "Closing an open item" 5 and 6 write and commit the choice before `/roadmap add` assigns the number. The brief does not say who adds `the roadmap entry <n>` to `Builds on it:`, or in which commit.
- Case 19:
  - Standards: consistent.
  - Against the described text: not given. "The review of a choice" says that under `Agree`, "`- <date>: C<n>, <the decision>: agreed by the user.` is added to that plan's Closed items". With no plan open there are no Closed items, and item 1.4 does not say where the line goes or that it is left out.
- Case 20:
  - Standards: consistent.
  - Against the described text: given. The case leaves out the case where no plan is open: where a `C<n> =>` bullet goes then (the rulings file?), since `spec`'s "Steps / A ruling" writes only to `plan.md`.
- Case 21: consistent.
- Case 22:
  - Standards: consistent.
  - Against the described text: given. What triggers the takeover is not stated (Implied inputs).
- Verify 2: it uses a regex count, not skill-layout's count. It is stricter, so it is not inconsistent in effect.
- Verify 3: its first grep would print nothing even with the stale form at `references/self-rule.md:56` left in place.

Findings:
1. Case 1's "nothing written" is not given by the described text, since `grill` Steps 1 does not make the refusal of "What it reads" 12.
2. Kind 6 has two wordings:
   - `references/self-rule.md` (written rules, rulings, ADRs).
   - Brief item 5.3 and Decision 2 (goals page, rules file, standards, rulings, ADRs).
   - Case 4 (goals, rules, rulings, ADRs).
   This breaks rules file, "The rules" 19, and skill-layout, "Where a rule goes".
3. Case 7: the brief does not say which items of "Closing an open item" apply inside `/plan`. The case's result also leaves `plan` Rules bullet 2 and its Anti-patterns row contradicting it.
4. Case 15: "the finding's heading" names a part that refuter reports do not have, and the case leaves out `<goal>`.
5. Case 18: the brief does not name who writes `the roadmap entry <n>` into `Builds on it:`, or in which commit.
6. Case 19: the `Agree` Closed-items line has no place when no plan is open.

## 5. The question

"The goal" here is the next-entry sentences of the roadmap goal ("With `next_entry: on` as well, a closed plan is followed by the next open entry ... stopping at an entry under "Not yet specified", at an item of the six kinds, or when no open entry is left") and the `/roadmap add` limit ("`/roadmap add` adds only work a ruling of the user or a finding of a running plan names").

- Check on the step line, "each changed text read in place": yes. A reader can confirm that each text says what the brief asks while the run still cannot resume across plans: no ledger record says a next-entry run is in progress between the archived plan and the new rulings file, and a refusal or a `/grill` round books nothing. The plan's "## Gate" line for step 7 relies on step 9's run for the behaviour, and this step's check does not prove it.
- Case 1: no. The unchanged tree has no refusal, though see finding 1 of "Cases and checks" for "nothing written".
- Case 2: yes. Item 5.3 lists the decisions sent to the user as "a rule clash (kind 3), a clash with a term of the plan-terms block (kind 3), an option that supersedes or contradicts an ADR in force (kind 3), and a decision whose recommendation cannot be argued ... (kind 6)". The list reads as closed. It leaves out:
  - kind 1 (outside the repository, the user's hands or accounts, another model);
  - kind 2 (deletes data, touches a secret);
  - the other forms of kind 3 in `references/self-rule.md`, "The six kinds left open" 3: a change to the rules file, a standards page, the shared rules, `CLAUDE.md`, `.agents/plan.yaml` or the configuration block, and an option that adds a check, a command in the verification list or a script.

  So a `/grill --self-rule` decision on a new script, a config key or a new glossary term is answered with its recommendation. In Ordo, `docs/glossary.md` is a standards page (`.agents/plan.yaml` `standards:`), and `grill` "Steps / Writing what settled" 2 writes terms "at once". Case 2 can pass while the run does not stop at those items, so "stopping at an item of the six kinds" is not reached.
- Case 3: no.
- Case 4: no for the `grill` text. Yes in the sense that the brief's widened kind 6 closes decisions that the reference's kind 6 would leave open (finding 2 of "Cases and checks").
- Case 5: no.
- Case 6: no. It is a control.
- Case 7: yes, partly. Item 4.4 closes Open item A under self-rule whatever "## Gate" holds. A copied gate answered "could pass without the goal", or a step's check still "yes" after two redrafts, goes "to the user at Steps 3" today (`plan` Steps 2), and under `--self-rule` it is closed with no stop. The case can pass with a step list whose checks could pass without their goal.
- Case 8: no.
- Case 9: no. It is a control that holds on the unchanged tree.
- Cases 10 to 13: no as written. They pass by reading item 1.1, but how a run resumes after the user approves the `/roadmap done` diff is not stated: which command continues a loop whose ledger folder has just moved to `<archive_root>`. See Implied inputs.
- Case 14: no.
- Case 15: yes. Item 6.1 only requires the bullet to "name a finding of a running plan by the refuter report's path and the finding's heading". `roadmap` is not told to read that report, check that the finding exists, check that the plan is open, or check that the added work is the finding's work.
  - Decision 5 defines "a finding of a running plan" as "a finding of a refuter report under `<ledger_root>/`". In Ordo, `archive_root: .scratch/archive` lies under `ledger_root: .scratch` (`.agents/plan.yaml`), so a closed plan's report qualifies, which contradicts "running".
  - A "(self-rule)" bullet that names any path and any heading lets `/roadmap add` write any work, so the `/roadmap add` limit of the goal is not reached.
- Case 16: no.
- Case 17: no.
- Case 18: yes, for the same reason as case 15.
- Cases 19 to 21: no.
- Case 22: no for the text. The takeover trigger is not stated.
- Checks of "What to build":
  - Verify 1 (`checks.sh`), 2 (lengths), 4 (ASCII and tabs) and 5 (glossary sync): yes. Each passes on any text and is a fact check, as the rules file, "Scripts compute facts; judgment is read", allows. The goal is judged by the reading.
  - Verify 3: yes. Its first grep passes with `references/self-rule.md:56`'s stale form left in place. Its second part ("lists the lines of items 1.1, 3, 4 and 5") is a reading.

Findings:
1. Item 5.3's list leaves out kinds 1 and 2 and most of kind 3, so `/grill --self-rule` answers decisions the goal says stop the run (case 2).
2. Item 4.4 closes the step list with no rule for a gate or check answered "could pass without the goal" (case 7).
3. Items 6.1 and 1.2 and Decision 5 let any path and heading stand for a finding of a running plan, and an archived plan's report counts (cases 15 and 18).
4. The step-line check cannot show the run resumes across a closing, or after a stop between plans (cases 10 to 13 and 22).

## 6. Implied inputs

This is a text step (skill pages), not a code step. No case is owed under the code-step rule. The inputs below are ones the described behaviour leaves without a rule, which a careful reader would hit:

- The resume after the closing's kind-4 stop: the user approves the `/roadmap done` diff, the closing moves the ledger folder to `<archive_root>`, and the brief says the run "goes on when the loop is continued after it". It does not say which command or what state file a "continue the plan" reads, since the plan is archived and the next one is not open.
- The takeover trigger: "A session that takes over reads what is written" does not say how that session knows a next-entry run is in progress. No ledger file records it.
  - An entry with a rulings file and no plan may also be a person's own `/grill` interview, unfinished, with bullets ending "(the user)". The resume rule would take it over under `--self-rule` and answer the decisions the user was shown but did not answer.
- A stop between plans: item 1.1 says "the stop is booked where the skill that raised it books it". A `/grill` round, a `/plan` stop of the six kinds (no folder exists yet) and a refusal (which "changes nothing") are booked nowhere. "Resuming, and handing the plan over" requires every decision to be in the ledger.
- After the user answers a `/grill --self-rule` round sent for six-kind decisions, the brief does not say whether `/grill` goes on under `--self-rule`, or who then runs `/plan <entry> --self-rule` and the loop.
- A next entry that waits on an entry not done. `roadmap` "Steps / Show" 2 ("Name the next one") has no rule for it. A plan that is open but stopped earlier in the order is a related case: `plan-orchestration` Steps 2 already takes open plans in the roadmap's order, and the brief does not relate next-entry mode to that rule.
- Whether the loop finds the next entry by invoking `/roadmap` (Show) through the runner or by applying Show's rule itself. If it invokes it, `/roadmap` (show) belongs in the Rules list of invoked skills, and item 3 does not add it.
- `--self-rule` combined with `--ruling` (which must be the last two arguments), and with `--bar`. "Right after `<entry>`" does not say whether either may follow.
- The `projects:` form: item 1.1 writes `/grill <entry> --self-rule` and `/plan <entry> --self-rule`, but the invocation there is `<project>/<entry>`.
- The closing plan's configuration block holds `next_entry: on` while `.agents/plan.yaml` now holds `off`, or the reverse. Next-entry mode reads the block, but `/grill` and `/plan` check `plan.yaml` (ruling F), so the run is refused. The brief has no case for it.
- A choices file that does not exist yet: covered, since items 5.4 and 4.4 send the reader to "The choices file", which creates it from `templates/choices.md`.
- An entry with a rulings file whose bullets end "(the user)": covered by "draws its tree afresh". The takeover case above is not covered.
- The review of a `/grill --self-rule` choice while no plan is open: where `Agree` writes its Closed-items line (case 19), and where a `C<n> =>` bullet goes. `spec`'s "Steps / A ruling" writes only to `plan.md`.
- The review of a "record as ADR?" choice: under `C<n> =>`, nothing removes or supersedes the proposed record that `/grill --self-rule` wrote. `Builds on it:` is "none" for it (item 5.4).
- The steps of the new plan that rest on `/grill --self-rule` decisions: `Builds on it:` gets them only when a brief names the bullet ("The choices file", `/spec` bullet). The steps are tagged `(ruling A)`, not with the `D<n>` bullets, so a `C<n> =>` on a design decision can find no step to fix.
- `/plan --self-rule`'s Open item A when it is of one of the six kinds: the brief does not say where it is written, since the state file does not exist before Steps 4.
- "The counts" ("An item closed under self-rule counts as a stop of its step"): Open item A has no step.

Findings: the inputs above that are not marked as covered.

## 7. ADRs

Every record was read with `cat docs/adr/0*.md`.

- 0001, 0002, 0003 (writing base, prose standard, draft review): they do not touch the step.
- 0004: touches the step. Its decision: "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)". ... only then is it a carried ruling for another entry." The brief names it.
  - The brief keeps `grill`'s carried rulings to "(the user)" ("What it reads" 6), which follows the record.
  - `/plan` copies "(self-rule)" bullets (item 4.3), which follows the record.
  - `/roadmap add` accepts "(self-rule)" for finding work only, and move, drop and done keep "(the user)" (item 6.1). The record names only `spec`, `plan` and `grill`. Its Consequences say "A skill added later that reads a ruling's authority reads both endings". `roadmap` was not added later, so that sentence does not bind it, and Open item E rules the partial acceptance. No contradiction.
- 0005: touches the step. Its decision: "Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry." The brief names it.
  - The choices of `/grill --self-rule` and `/plan --self-rule` go to that file (items 5.4 and 4.4). This follows the decision.
  - Its Consequences say "the path is written as it stands when the choice is booked and the plan's slug finds it in the archive". Items 1.3 and 4.3 rewrite the path afterwards, from the rulings file to `plan.md`. That is a refinement the record does not state. The brief does not name the Consequences sentence, and `docs/adr/0005-...md` is not in the paths. `grill` "Steps / Writing what settled" 4 ("A refinement of an ADR in force edits that record") and the rules file, "The rules" 5, ask for it.
- 0006: touches the step lightly. Its decision includes "each `grill` lookup where `grill` records it". Next-entry mode's `/grill` lookups go to the rulings file's Agents section and are copied by `/plan`, which is the existing behaviour. The brief says 0006 does not touch the step. No contradiction.
- 0007: does not touch the step. The new plan runs under its own block, `repair_reviewer` included.
- 0008, 0009: do not touch the step.

Findings: ADR 0005's Consequences sentence on the `Booked:` path is refined by items 1.3 and 4.3. The brief does not name that sentence and does not put the record in its paths. No part of the brief contradicts the Decision of any record.

## 8. Dictated text

Each line was read against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, `skills/repo-setup/templates/docs/dev/prose-standard.md` and `docs/glossary.md`.

- `## Next-entry mode`: `grep -n '## Next-entry mode' 7.md` prints `33:`. Holds as a noun-phrase label (skill-layout, "Sections, in order", row 6; prose standard, 0 "Headings are labels"). The term "next-entry mode" is not in `docs/glossary.md` yet. See the Quick start lines below.
- `` `the roadmap entry <n>` ``: `grep -n 'the roadmap entry <n>' 7.md` prints `47:` and `109:`. Holds.
- `` `replacing <the old bullet's name>` ``: `grep -n "replacing <the old bullet's name>" 7.md` prints `50:`. Holds. Its form is not carried to `references/self-rule.md:56` (Names, finding 1).
- ``Booked: `<path>:<line>` (<the bullet's name>)``: `grep -n "(<the bullet's name>)" 7.md` prints `52:`. Holds.
- `<ledger_root>/rulings/<slug>.md`: `grep -n '<ledger_root>/rulings/<slug>.md' 7.md` prints `46:`. Holds.
- `/plan <entry> --self-rule   the same, run by plan-orchestration in next-entry mode: the step list is approved under self-rule`: `grep -n 'the step list is approved under self-rule' 7.md` prints `59:`. It breaks two rules:
  - Prose standard, E "Passive voice": "is approved", where the actor matters (the orchestrator).
  - skill-layout, "Writing for an agent": "A skill that needs a new term ... adds or changes its entry in `skills/repo-setup/templates/plan-terms.md` first". "next-entry mode" is used here before step 8 adds the term, and Decision 6 puts the term after this step.
- `/grill <entry> --self-rule   the same, run by plan-orchestration in next-entry mode: each decision answered with its recommendation, as the orchestrator's choice`: `grep -n "as the orchestrator's choice" 7.md` prints `71:`. It breaks two rules:
  - The rules file, "The rules" 19 (no two statements that contradict): "each decision" is false for the six-kind decisions that item 5.3 sends to the user.
  - The same skill-layout, "Writing for an agent" rule on "next-entry mode" before its term exists.
- `- Open item A (<date>): the step list as drafted, <n> steps (self-rule).`: `grep -n 'the step list as drafted, <n> steps' 7.md` prints `63:` and `98:`. It breaks the rules file, "The rules" 19, against `references/self-rule.md`, "Closing an open item" 3, whose form is `<the option taken, in one line, and what it unblocks>`. The dictated bullet does not say what it unblocks.
- The option names "the list as drafted" and "the list with each named point changed": `grep -n 'the list with each named point changed' 7.md` prints `62:`. The first holds. The second is vague: "point" is not a term the stop uses, where the stop names "design decisions" and "lines of the rulings file left to place". That breaks prose standard, D "No synonym cycling. One term per concept".
- The Stops row name "`--self-rule` without the keys": `grep -n 'without the keys' 7.md` prints `69:` and `78:`. Holds.
- `- D<n> <the decision, as a phrase> (<date>): <the answer in one line> (self-rule).`: `grep -n '(<date>): <the answer in one line> (self-rule)' 7.md` prints `74:`. Holds. It matches `grill`'s existing form (`skills/grill/SKILL.md:238`).
- The Rules list fragment `/grill <entry> --self-rule` and `/plan <entry> --self-rule` in next-entry mode: `grep -n 'in next-entry mode\.$' 7.md` prints `56:`. It breaks only the same skill-layout, "Writing for an agent" rule on the term before its glossary entry.
- The term text "or with "(self-rule)" for `plan` and `grill`, and for `roadmap`'s `add` of work a finding of a running plan names": `` grep -n "and for \`roadmap\`'s \`add\`" 7.md `` prints `86:`. Holds against the prose standard. "Running plan" carries the ambiguity of Decision 5 (an archived plan's report lies under `<ledger_root>/`), which "The question" finding 3 covers.
- Item 1.2 ("keep the item open as now") and item 1.1 ("completes as it does now") give requirements, not words. If a builder copies "as now" or "as it does now" into the skill, that breaks the brief's own Conventions ("no ... "now" in skill text") and skill-layout, Anti-patterns, "History in the skill".

Findings:
1. Line 59 uses the passive "is approved" (prose standard, E).
2. Line 71's "each decision answered with its recommendation" contradicts item 5.3 (rules file, "The rules" 19).
3. Line 63's bullet leaves out "what it unblocks" from the form of "Closing an open item" 3 (rules file, "The rules" 19).
4. Line 62's "each named point" is a second name for the stop's design decisions and lines left to place (prose standard, D "No synonym cycling").
5. Lines 59, 71 and 56 use "next-entry mode" in skill text before its term exists in `plan-terms.md` (skill-layout, "Writing for an agent").

## Declined to judge

- Choices the user would see that the brief takes without a ruling. They are listed here for the session to judge, since whether each is ruled is the user's call:
  - Decision 2 widens kind 6 for `grill` (adds the goals page), which decides which design decisions reach the user.
  - Decision 5 defines how a ruling names "a finding of a running plan" (a refuter report's path and "heading", nothing else counted: a brief-check finding, a diagnosis record or a recurring-findings proposal does not qualify). That is a vocabulary and a format the user would see, and it narrows D14 ("a finding of a running plan").
  - Items 1.3 and 1.4 extend the choices-file format (`Booked:` naming `D<n> <phrase>`, and `Builds on it:` taking `the roadmap entry <n>`). They follow D3 and the review flow, but they are a format change applied in the user-facing file.
  - Decisions 1, 3, 4 and 6 follow from rulings (kind 4 of D12, the six kinds, "Closing an open item", and the plan's step 8 line), and I judge them as following.
- The plan's rulings:
  - D1 is followed: the loop reads the closing plan's block, and `/grill` and `/plan` check `plan.yaml` (F). A mismatch between the two has no case.
  - D4 is followed.
  - D13 is followed in shape, with the gaps under "The question" (kinds 1, 2 and 3 in `/grill`) and "Implied inputs" (resume).
  - D14 is followed in shape, but Decision 5 narrows it and does not check the finding.
  - Open item E is followed (`/roadmap add` accepts "(self-rule)" only for finding work, move and drop keep "(the user)", done stays kind 4).
  - Open item F is followed (`--self-rule`, refused without both keys). Its "given ... only by the loop" is not enforceable by the refusal; that limit is the ruled design.
- Whether `skills/repo-setup/templates/shared-rules.md:20`'s exception ("Under a plan's `self_rule: on`") covers `/grill --self-rule` and `/plan --self-rule`, which run while no plan of their entry exists. Whether the closed plan's block counts as "a plan's" is a reading for the user. A change to that file is kind 3 and outside this brief's paths, and the matching sentence in `~/.claude/CLAUDE.md` is the user's own.
- Whether README needs a line on next-entry mode beyond the `plan.yaml` example comment: the rules file, "The rules" 5, puts this to the orchestrator, and it is not settled by a read.

Agent usage: acf5b218dfdc17a01, claude-opus-5-5 (ordo-high), 234387 tokens, 38 tool uses, 619 s.
