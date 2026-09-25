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

Reviewer usage: not measured by the reviewer; the runner's completion notification carries it.
