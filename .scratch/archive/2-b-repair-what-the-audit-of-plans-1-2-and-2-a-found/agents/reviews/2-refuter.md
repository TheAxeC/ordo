# Step 2 refuter report (on .agents/worktrees/2b-2, base 17cf7ca)

## Verification (rerun by the reviewer)

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
exit=0

$ python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo "exit=$?"
ok: .../inventories/land.md
ok: .../inventories/ordo-init.md
ok: .../inventories/plan-help.md
ok: .../inventories/plan-orchestration.md
ok: .../inventories/plan-retro.md
ok: .../inventories/plan.md
ok: .../inventories/refute.md
ok: .../inventories/repo-setup.md
ok: .../inventories/roadmap.md
ok: .../inventories/spec.md
exit=0

$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ python3 utils/check_skill_layout.py; echo rc=$?
(ten ok: lines as above) rc=0

Report's quoted evidence, rerun:
- The 17 per-item grep outputs (report lines 41-112): every quoted line matches `cat -n` of the edited files (read whole).
- `git diff 17cf7ca -U0 -- <inventory> | grep -c '^+|'`: plan-orchestration.md 33, plan.md 3 (report: 33 and 3).
- `wc -l`: 263, 28, 82, 69, 139, 48 (report: same).
- `grep -rn "one agent dispatch\|open items first\|Every path is relative\|--label <step>" skills utils docs README.md`: plan/templates/plan.md:3, plan/templates/plan.yaml:2, plan/templates/plan.projects.yaml:3, land/SKILL.md:70, launch.sh:20-21, ordo-init/SKILL.md:109, plus roadmap/SKILL.md:136 and utils/check_skill_layout.test.sh:71,189 (the last three are other subjects).
- ASCII-check claim, in a scratch repo under the scratchpad with one file of bytes \xf3\r\r\n: printed "Malformed UTF-8 character (fatal) at -e line 1, <> line 1." and "exit 0". Reproduced. `grep -n pycache .gitignore`: no match, rc=1. Reproduced.
- Added lines scanned for non-ASCII, `--`, `->` and banned filler words: none (the only " - " hits are list-item indentation).
- `git status --short` after all runs: the six modified files and the untracked report, nothing else.
```

## 1. Spec

1. `skills/plan-orchestration/SKILL.md:10`: "The unattended loop that runs an open plan's steps, one after another, until a decision is the user's or nothing is left." This is the "a stop ends the loop" meaning that item 1 removes. The diff changed Quick start (line 15) and Steps 10 (line 77) but left this opening sentence, so it now contradicts Steps 3 (line 47: a stop "blocks its own step, and the loop moves on") and Steps 10.
2. `skills/plan/templates/plan.md:3` ("one step of work and one agent dispatch"), `skills/plan/templates/plan.yaml:2` and `skills/plan/templates/plan.projects.yaml:3` ("Every path is relative to the repository root.") still contradict the new plan Rules 1 and 2 (`skills/plan/SKILL.md:79-80`). The plan's step 2 line covers "the `plan` skill's `SKILL.md` and templates", but the brief's path list left these files out. The builder gave replacement text under "Doc text", and the state file's booked list names them for step 2's landing. Until that fix is made at landing, the plan skill does not agree with itself.

## 2. Proof

1. Report, judgment call 9: it says the Rule cell is annotated "where a row's rule was changed at its place by a ruling or by this step". Reading the inventories does not reproduce that. These rows describe rules this diff changed and carry no annotation:
   - `plan-orchestration.md`: "| 30 | A stop it raises goes to the user; the loop moves on or pauses | Steps 3 |" (the text no longer says "or pauses").
   - `plan-orchestration.md`: "| 34 | Save its report and record its usage | Steps 7 |" (the path and usage now go under `reviewer_report`).
   - `plan-orchestration.md`: "| 45 | A rule already written that keeps being broken is not rewritten; what is proposed is a check | The recurring-findings pass 3 |" and "| 45 | Not rewritten, the same rule | Anti-patterns 6 |" (a sharper sentence is now allowed when no command can check the rule).
   - `plan-orchestration.md`: "| 82 | A stop goes in one message with options inside the rules and one recommendation | Stops 10 |" (renumbered only; the rule is now plain text in the report, with pros and cons, and no question-box tool).
   - `plan-orchestration.md`: "| 37 | The final message lists every landed step, the open items and the booked count | Steps 10 |" (the open items now come through "Reports" 2).
   - `plan.md`: "| 26 | Both files committed by path as the opening commit ... | Steps 6 |" (Steps 6 now commits two files plus two `.gitkeep`).

   All place numbers resolve correctly. The defect is that the report's stated convention was applied to some changed rows and not to others.
2. Report line 3 says "Three sentences outside this step's paths ... are given under 'Doc text'". The "Doc text" section (report lines 297-304) has four numbered items, covering six file locations.

## 3. Standards

1. `skills/plan-orchestration/SKILL.md:198` ("Roadmap entry 2.B (repair what the audit found). Plan step 3 of 19: pin.sh. Next: step 4, collect_findings.py."), `:169` ("for example `2.B/4`") and `skills/plan-orchestration/templates/launch-note.md:14` ("for example `2.B/4`") put this repository's entry, step numbers and tool names into a skill. That breaks the skill's own Rules 1 (`SKILL.md:260`, "The skill carries no project name") and the stated rule in `docs/dev/change-standard.md` ("Rules this repository already states", first bullet: "The skills carry no project name"). The text was dictated by brief items 12, 13 and 14, so the conflict is between the brief and a written rule, and the orchestrator has to resolve it. The example also misstates plan 2.B: its step 3 is "Skill texts, part 2", pin.sh is step 5, and collect_findings.py is step 6.
2. `skills/plan-orchestration/SKILL.md:260`: "the models it names are the options the user ruled in ...". This records who decided, in a rule file. The rule-file rule in CLAUDE.md forbids recording who said a rule, and change-standard rule 10 forbids history. The wording is from brief item 6. "the models it names are those in 'The two tiers, and the harnesses'" states the same rule without the attribution.
3. `skills/plan-orchestration/SKILL.md:59`: "The builder writes its report in the worktree's copy of the ledger, and the orchestrator copies it from there." The first clause repeats Steps 4, line 52 ("in the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger"). `docs/dev/skill-layout.md` ("Where a rule goes": "A rule is written once. Another place that needs it names the section it is in.").
4. `skills/plan-orchestration/SKILL.md:198`: "Every report opens with a position line". `docs/dev/change-standard.md:19` and `skills/repo-setup/templates/docs/dev/change-standard.md:19` (rule 7) still open a report with the NOT DONE line and then the open items, with no position line. The builder's "Doc text" names `spec/templates/brief.md:40` and `land/SKILL.md:70` but not these two pages. The fix is either to limit "every report" to the orchestrator's and the landing's reports, or to carry the position line into both change-standard pages (change-standard rule 14).
5. `skills/plan/templates/orchestrator-state.md:34`: the open-item placeholder asks for "its options and one recommendation". `SKILL.md:239` requires the stop's open item to carry "the pros and cons of each". The template gives a different shape for the same item.
6. `skills/plan/templates/orchestrator-state.md:13` states half of the models rule ("a builder never runs on Fable or Astra"). The `reviewer:` line (15) says only "the model /refute runs on.", although `SKILL.md:85` puts the same limit on reviewers.
7. `skills/plan-orchestration/SKILL.md:112` ("After a compaction the next skill is invoked through the runner, as "Rules" says") covers any skill. The Rules bullet it points at (`:263`) names only `/spec`, `/refute` and `/land`. The loop's `/roadmap done` (the new Stops row, line 234) is not covered by the rule the resumption line cites.
8. `skills/plan-orchestration/SKILL.md:262`: the round-cap bullet has three sentences of 42, 18 and 54 words (counted with `tr '.' '\n' | awk '{print NF}'`). `docs/dev/skill-layout.md` ("A bullet is one sentence where it can be") and the prose standard E ("under roughly 20 words unless the mechanism needs more"). The last sentence (landing, small fixes, booking) can be split without changing the rule.

## 4. Behaviour

none

## Not checked

- Whether `launch.sh` can be run with every path absolute as `SKILL.md:166` now requires. The script belongs to step 4 and was not exercised beyond `launch.test.sh`.
- The oculus hub's `dispatch-note.mjs` against the new `--label <entry>/<step>` and `--pid` wording (research-hub is read only; F6, F7 and F9 were read in the review file only).

Reviewer usage: 174,608 tokens, 36 tool uses, 433 s (the runner's completion notification).

## Repair round 1, refuted

I ran every command below from the worktree root `/Users/axelfaes/workspace/ordo/.agents/worktrees/2b-2`.

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
exit=0

$ python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo "exit=$?"
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
exit=0

$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests

$ python3 utils/check_skill_layout.py; echo rc=$?
(the same ten ok: lines) rc=0

The commands the report quotes, rerun:
$ git diff 17cf7ca -U0 -- <inventory> | grep -c '^+|'
44 (plan-orchestration.md), 4 (plan.md)        report: 44 and 4. Reproduced.
$ wc -l <the nine files>
268, 28, 82, 69, 31, 23, 45, 139, 48          report: the same. Reproduced.
$ sed -n 263,267p skills/plan-orchestration/SKILL.md | (wc -w per line)
17, 30, 20, 20, 27                             report: the same. Reproduced.
$ LC_ALL=C grep -n '[^ -~]' <the skill files, the plan templates, the two inventories>
no output, rc=1. Reproduced.
$ git diff 17cf7ca -U0 -- skills .scratch/archive | grep '^+[^+]' | grep -n '[^ ] - \| -- \|->'
no output, rc=1. Reproduced. (Over the whole diff, the only hits are list indentation inside the report's quoted lines.)
$ git diff 17cf7ca -U0 -- skills | grep '^+[^+]' | grep -niE 'easy|simple|quick|very|really|just|simply|ordo|cathedra|research-hub|oculus|2\.B|anthropic|openai'
no output, rc=1
The report's per-ruling greps (1), (2), (5) to (12): each output matches the file as it is now.
$ git status --short
 M .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/2-report.md
 M .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
 M .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/templates/launch-note.md
 M skills/plan/templates/orchestrator-state.md
 M skills/plan/templates/plan.md
 M skills/plan/templates/plan.projects.yaml
 M skills/plan/templates/plan.yaml
```

I checked each ruling's closure against the round's delta (`git diff a7c5cff`):

- Rulings 1 to 11 are real fixes. No rule was removed to close any of them.
- Ruling 12 is taken up under Spec 1 and Standards 1.
- Nothing in the delta goes beyond the rulings.
- Against `git show 17cf7ca:<path>`, no rule is lost apart from the wording drift in Spec 1.

I sampled 31 rows of `inventories/plan-orchestration.md` against the text at their places:

- Steps: 1, 2, 3, 4 (six rows), 6, 7 and 8.
- Rules: 1 to 7.
- Reports: 3 to 7.
- Stops: 7 to 11.
- Anti-patterns: 1, 3, 4, 5, 7, 8, 9 and 10.
- Launching a builder: 1, 2, 3, 8, 10, 11, 13 and 15.
- The two tiers, and the harnesses: 1, 3, 5, 6, 8 and 9.
- Resuming, and handing the plan over: 1 to 10.
- The recurring-findings pass: 1 to 4.
- The review, earned: 1 to 6.

I also checked the four changed rows of `inventories/plan.md` (Steps 5, Steps 6, Rules 1, Rules 2). Every sampled row resolves to the text that holds its rule.

### 1. Spec

1. `skills/plan-orchestration/SKILL.md:263-267`. Ruling 12 asked for the rule unchanged. Compared with `git show a7c5cff:skills/plan-orchestration/SKILL.md` line 262, the rule is kept in substance, with three wording drifts:
   - Line 264, "The exception: one more round when the delta leaves ...". The old text was "and one more only when ...". The word "only" is gone, so the bullet now states a sufficient condition. That the condition is also required now depends on line 263's "plus the one exception below".
   - Line 267, "Everything else the rounds left undone or beyond the brief is booked ...". The old text was "everything else the rounds left undone or that lies beyond the brief". The new phrasing reads as "the rounds left ... beyond the brief".
   - Line 267, "in the plan and the booked list, never sent back". The old text was "carried in the state file's booked list and never sent back to the builder". "The booked list" loses its owner, which line 202 names as "the state file's booked list".
2. `skills/plan-orchestration/SKILL.md:268`: "Every skill the loop invokes (`/spec`, `/refute`, `/land`, and `/roadmap` at the closing) is invoked through the runner every time ...". The parenthesis is written as the full list, but Steps 4 (line 54) also has the loop build a step through `academic-paper` ("The step is built through that skill with the brief as its input"). That skill is missing from the list of skills that must never be carried out from remembered text. Ruling 11 named four skills. The sentence's "Every skill the loop invokes" makes the list claim to be complete.

### 2. Proof

1. `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/2-report.md`: the "Repair round 1" section is appended, and the sections above it still state the pre-round text as the tree's text. This breaks `docs/dev/change-standard.md` rule 7, "The report states the end state only". Each of these lines is false against the tree now:
   - Line 67 quotes `260:- The skill carries no project name, ... the options the user ruled in ...`.
   - Line 86 quotes `198:- Every report opens with a position line ... For example: "Roadmap entry 2.B ...`.
   - Line 92 quotes `(for example `2.B/4`)`, and line 96 quotes `, for example `2.B/4`,`.
   - Line 109 quotes the Open items heading "after the position line of every report".
   - Line 256 gives the Files table's `| 263 | 87 lines changed |`, and line 263 says "these six files modified".
   - Judgment call 2 (line 268) says "One bullet holds the cap, the exception, ...". The cap is now five bullets.
   - Judgment call 8 (line 274) says "The Open items heading now says "repeated verbatim after the position line of every report"".
   - The "User-visible changes" row "Reports | open with the open items | open with the position line, then the open items" no longer holds for a builder's report, which by `SKILL.md:199` keeps the change standard's shape.
2. `2-report.md:303`, "Doc text" item 3: "The same holds for the report shape in the `spec` skill's `templates/brief.md` line 40 (step 3), which opens the builder's report with the NOT DONE line and then the open items." After ruling 8, `SKILL.md:199` says "A builder's report keeps the shape of the repository's change standard", so `brief.md:40` no longer conflicts with anything. The same stale claim is booked in the main ledger's `orchestrator-state.md:88` ("`skills/spec/templates/brief.md:40` and `skills/land/SKILL.md:70` open a report with the open items, not the position line"). The booking should keep only `land/SKILL.md:70`, which does still conflict. Its line 70 reads "- It holds the open items first, verbatim, ...".

### 3. Standards

1. `skills/plan-orchestration/SKILL.md:263-264`: "- The round cap: a step gets at most `repair_rounds` repair rounds, plus the one exception below." / "- The exception: one more round when ...". This breaks `docs/dev/skill-layout.md`, "Lists and tables", first bullet: "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule". The split moves the cap's exception out of the cap's bullet. The limit on line 265 ("A new finding ... never earns the exception's round, and the user's yes never extends the cap") is split out the same way. The first review asked only for the last sentence (the landing and the booking) to be split. A layout-conformant form keeps the cap, the exception and the two limits in one bullet, and puts the landing and the booking in separate bullets.
2. `skills/plan-orchestration/SKILL.md:257`: "as the round cap and the bullets after it in "Rules" say". "The bullets after it" also covers line 268 (the skills-invoked rule), which has nothing to do with the cap. This follows from Standards 1. With the cap in one bullet, the pointer names only that bullet and the landing and booking bullets.
3. Vendor and tool names outside the models section in changed text, as your check asked:
   - `SKILL.md:60` ("the `claude -p` JSON or the `codex -o` final message").
   - `SKILL.md:61` ("A native Claude agent's").
   - `skills/plan/templates/orchestrator-state.md:13` and `:15` ("codex:gpt-5.6-sol", "Fable or Astra").
   - `orchestrator-state.md:27` ("the claude -p JSON or the codex -o final message").

   Brief items 3 and 17 and ruling 10 dictated these words. No written rule forbids them now: `SKILL.md:261` and `docs/dev/change-standard.md` "Rules this repository already states" forbid project names and paths, not vendor names. I list them because your criterion hits, not as a breach of a written rule. No project name appears in the changed skill text (grep above, rc=1).

### 4. Behaviour

none

### Not checked

- Whether `skills/plan-orchestration/templates/launch.sh` accepts every path given as absolute (`SKILL.md:166`). The script belongs to step 4, and I did not run it beyond `launch.test.sh` inside the verify runner.
- The note command's handling of `--label <entry>/<step>` and the `--pid` wording. The oculus hub is read-only, and I did not exercise it.
- The sentence length of changed sentences outside the round's delta. I read them in the whole diff but did not count words, except for the five round-cap bullets.

Reviewer usage: 155,407 tokens, 26 tool uses, 341 s (the runner's completion notification).

## Closed

- First review: every finding closed in repair round 1 (see `2-report.md`, "Repair round 1"), with rulings 1 to 12.
- Review over round 1, fixed at landing:
  - Spec 1, Standards 1 and 2: the round cap is one bullet of `plan-orchestration`'s Rules again, holding the cap, the one exception ("one more only when ...") and its two limits; the landing and the booking are the two bullets after it, the booked list named as the state file's; the Anti-patterns row points at "the round cap and the two bullets after it"; the inventory rows for the cap renumbered.
  - Spec 2: the skills-invoked rule names `academic-paper` for manuscript content beside `/spec`, `/refute`, `/land` and `/roadmap`.
  - Proof 1: `2-report.md` carries a note that its sections before "Repair round 1" describe the first build.
  - Proof 2: the state file's booked item says a builder's report keeps the change standard's shape, so `skills/spec/templates/brief.md:40` is set back to that shape at step 3's landing.
- Review over round 1, not a finding: Standards 3 (vendor names in the dispatch and worker text); no written rule forbids them, and the models section names the models.
- The landing fixes were read by a fresh reviewer (`2-landing-review.md`); its findings fixed at landing: the note in `2-report.md` placed after the report's first line and stating that the fixes made at landing are in the booking and here; the booked item on report openings says step 3's landing takes the position line back out of `skills/spec/templates/brief.md:40`, and that `land`'s fix lands with step 3; the round-cap bullet split into two sentences without the semicolon. Its finding 4 (the dispatch block's `landing: cherry-picking`) is `/land`'s own state step.
