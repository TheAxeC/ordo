# Step 5 refuter report (on .agents/worktrees/1-5, base 4661d85)

## Verification (rerun by the reviewer)

```
python3 utils/check_skill_layout.py skills/plan
ok: skills/plan/SKILL.md                                   (exit 0)
python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md   (exit 0)
grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan.md
38
wc -l skills/plan/SKILL.md
80 skills/plan/SKILL.md
git show ea8d02d:skills/plan/SKILL.md | wc -l
33
sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (exactly as docs/dev/building.md:13)
(no output, exit 0)
git status --short
 M skills/plan/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/plan.md
```

## 1. Spec

- skills/plan/SKILL.md:50 and :72: one rule is written twice. Steps 3 says "Show the draft to the user, and write `plan.md` once the user has approved or corrected it". Anti-patterns row 1's Do instead says "Show the draft and write it after the approval or the correction". The old file states this rule at lines 10 and 22. The restyle should have merged the two statements into one, as the brief requires ("each written once") and as docs/dev/skill-layout.md:41 requires ("Another place that needs it names the section it is in"). Inventory rows 17 and 33 map this same rule to two places.
- skills/plan/SKILL.md:63-66 against :32-33, :36 and :44: the four refusals appear in full twice, as What it reads 1 and 2 and Steps 1, and again as Stops rows. Report judgment call 2 accepts this ("also rows of Stops"). docs/dev/skill-layout.md:41 says the second place names the section and does not restate the rule.
- skills/plan/SKILL.md:64: the Stops row's When cell reads "A key the plan needs is not in `plan.yaml`". The old file, line 14, says "A required key missing is a refusal", and the new What it reads 1 (line 33) keeps that. "A key the plan needs" also covers optional keys, which old line 14 says take their default when missing. The row therefore describes a refusal the old file does not have.
- skills/plan/SKILL.md:10: "It leaves behind `plan.md`, `orchestrator-state.md` and the empty `agents/briefs/` and `agents/reviews/`, committed." This is new content, and it states that the empty folders are committed. Old line 26 says "Both files are committed", and the new Steps 6 (line 56) keeps "Commit both files". Git does not track empty folders, so the opening paragraph and Steps 6 disagree.
- skills/plan/SKILL.md:10: the old line 10 sentence "It does the mechanical half of opening a plan and stops at the design half" is gone from the opening paragraph. "Design half" survives only in the Why cell of Anti-patterns row 1 (line 72), with "and the design half is the user's" added. The words "mechanical half" appear nowhere in the new file.
- skills/plan/SKILL.md:53: the executor bullet holds more than one rule. It states that `executor:` is not in `plan.yaml`, that the default is `agent` unless the user says otherwise, and that the orchestrator chooses per step over it. Inventory row 35 counts all of this as one rule. plan.md ruling line 49 says a paragraph with several rules gets one row per rule.
- skills/plan/SKILL.md:49: by the inventory's own count, this bullet holds two rules. Rows 44 and 45 are two rows on this one bullet: the closing is the last step, and `/plan` writes it itself at the end of the list.
- .scratch/1-one-layout-for-every-skill/inventories/plan.md:15: the row maps "/plan turns one roadmap entry into a ledger folder that the step skills and the orchestrator run from" to Steps 1. Steps 1 (lines 41-44) only names the folder and its slug. The sentence itself is at new line 10, the title paragraph.
- .scratch/1-one-layout-for-every-skill/inventories/plan.md:16: the row maps "It does the mechanical half and stops at the design half" to Stops 1. Stops row 1 (line 62) says neither half. The design-half wording is in Anti-patterns 1 (line 72).
- skills/plan/SKILL.md:63-66: the What it shows and What resumes it cells add content the old file does not state: "`/ordo-init`, then `/plan` again", "The key added, then `/plan` again", "`/plan` with an entry that exists", and "The folder" as what the existing-plan refusal shows. The layout requires the Stops columns, but not these values. The Why cell of Anti-patterns row 2, "Nothing can show it done", and its "until it can name its proof" are also new; the layout requires the Why column.

## 2. Proof

- none. Every figure in the report reproduced: 33 and 80 lines, 38 body rows, both checks `ok:`, seven `PASS:` lines, a clean ASCII check, and the section counts (Use instead 4, Steps 6, Stops 5, Anti-patterns 2, Rules 4), read from skills/plan/SKILL.md.

## 3. Standards

- skills/plan/SKILL.md:50/:72 and :63-66: docs/dev/skill-layout.md:41 ("A rule is written once. Another place that needs it names the section it is in") and its Anti-patterns row "The same rule written in two sections". These are the duplications listed under Spec.
- skills/plan/SKILL.md:49 and :53: docs/dev/skill-layout.md:45 ("One rule per bullet or item"). These are the multi-rule bullets listed under Spec.
- skills/plan/SKILL.md:10: docs/dev/change-standard.md rule 14 ("A sentence in a document ... that the change makes false is a defect"). The opening paragraph contradicts Steps 6 about what is committed.
- The six "as `/plan` states them" references (skills/plan-retro/SKILL.md:14, skills/land/SKILL.md:14, skills/refute/SKILL.md:14, skills/roadmap/SKILL.md:22, skills/plan-help/SKILL.md:10, skills/spec/SKILL.md:14) still hold, because What it reads 1 (lines 31-34) states the keys, the required ones, the defaults and the missing-key refusal. No file in skills/, utils/, docs/ or README.md names a section of skills/plan/SKILL.md (grep for "What it writes" and "/plan`'s" found none that point here). Nothing to report on these.

## 4. Behaviour

- Someone following Stops row 3 (line 64) could refuse when an optional key is missing, where old line 14 applies the default instead.
- The new file orders the work: the existing-folder refusal comes at Steps 1, before drafting, and `orchestrator-state.md` is written (Steps 4) only after the user approves `plan.md` (Steps 3). The old file stated no order for the state file relative to the approval. No rule of the old file conflicts with this order, but it is an ordering the old file did not impose.

## Not checked

- The plan skill's templates (skills/plan/templates/*): the diff against 4661d85 touches only skills/plan/SKILL.md, and I did not read the templates against the new wording.
- Whether steps 4's inventory maps an intro-paragraph line to a place outside the title paragraph, which would be the precedent for inventory row 15. Not verified.

Reviewer usage: 11 tool uses, about 12 minutes (estimated).

## Repair round 1, refuted

```
python3 utils/check_skill_layout.py skills/plan
ok: skills/plan/SKILL.md                     (exit 0)
python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md   (exit 0)
grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan.md
41
wc -l skills/plan/SKILL.md
      82 skills/plan/SKILL.md
sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (exactly as docs/dev/building.md:13)
(no output, exit 0)
git status --short
 M skills/plan/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/plan.md
```

- .scratch/1-one-layout-for-every-skill/inventories/plan.md:15: the round claims row 15 is closed by pointing at Quick start, "whose first line states the invocation". The row's rule is old line 10: `/plan` turns an entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. Quick start line 15 says "open the plan for one roadmap entry and show its drafted step list for approval". It does not mention the ledger folder or the skills that run from it. That sentence is only in the title paragraph, skills/plan/SKILL.md:10. utils/check_rule_inventory.py:129-151 (`places`) accepts only `##` and `###` sections as places, so the checker has no way to name the title paragraph. The row still points at a place that does not hold its rule, which is the same defect the first review found with Steps 1. Proof.
- skills/plan/SKILL.md:64: Stops row 1's When cell says "Every plan, after step 2". Every other pointer in the file uses the section name: "Steps 3" at :74, and "Stops" in quotes at :33, :35 and :43. In a skill whose subject is a plan's steps, "step 2" in lower case can be read as the plan's own step 2. It should name "Steps 2". Standards.
- The other closures hold when checked against the files:
  - Anti-patterns 1's Do instead cell names Steps 3 (:74).
  - Each refusal is stated once, in Stops rows 2 to 5 (:65-68). What it reads 1 and 2 and Steps 1 point there (:33, :35, :43).
  - Stops row 3 is limited to a required key, and the refusal names the key (:66). Old line 14 says the same, and :32 keeps the default for an optional key.
  - The title paragraph no longer says the empty folders are committed (:10). This matches Steps 6 (:58).
  - The "mechanical half / design half" sentence is in Stops row 1 (:64), and inventory row 16 points there.
  - The executor rule is split into :53, :54 and :55, and the closing-step rule into :48 and :49, each with its own inventory row (36-38, 47-48). "Over that default" at :55 matches what the plan skill's templates/orchestrator-state.md:12 calls the block's value.
  - The new cells in the What it shows and What resumes it columns are within the step 5 ruling at plan.md:51: they contradict nothing in the old file.
  - Every inventory row's item number points at the right row after the change: Stops 1 to 5, Anti-patterns 1 and 2, Rules 1 to 4, What it reads 1 to 3, Steps 1 to 6. The checker counts top-level items only (`ITEM` at utils/check_rule_inventory.py:58 is anchored at column 0).
  - Six skills say "as `/plan` states them": skills/plan-retro/SKILL.md:14, land:14, refute:14, roadmap:22, plan-help:10 and spec:14. What it reads 1 still gives them what they need:
    - The required keys and the defaults are in the templates it names (:31).
    - An optional key that is missing takes its default (:32).
    - A missing required key is a refusal that names the key, through the pointer at :33 to Stops row 3 (:66).
  - Going through the old file line by line again, every old line from 2 to 33 has a place in the new file with the same meaning.
  - The Use instead invocations exist in the target skills: `/ordo-init`, `/roadmap add <goal>` (roadmap:14), `/spec <entry> <step>` (spec:44), `/plan-orchestration <entry>`, and `/plan-help <entry>` (plan-help:10).
  - No other findings. Spec. Behaviour.

Reviewer usage: 14 tool uses, about 15 minutes (estimated).

## Closed

Round 1's findings are closed in the round (`5-report.md`). The run over round 1 is closed at landing:

- Inventory row 15 pointed at Quick start, which did not state the ledger folder the step skills run from: the Quick start line for `/plan <entry>` now states it.
- Stops row 1 said "after step 2": it says "after Steps 2".
