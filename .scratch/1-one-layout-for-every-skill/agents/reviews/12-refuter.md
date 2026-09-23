# Step 12 refuter report (on .agents/worktrees/1-12, base 071041f)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/plan-retro
ok: skills/plan-retro/SKILL.md
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
46
$ wc -l skills/plan-retro/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
      99 skills/plan-retro/SKILL.md
      53 .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
     152 total
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...as in docs/dev/building.md line 13...'
(no output), exit 0
$ git diff --stat 071041f
 skills/plan-retro/SKILL.md | 84 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 19 deletions(-)
$ grep -rn -E "## What it writes|## Grouping|The proposal for a recurring kind" skills utils docs README.md | grep -v '^skills/plan-retro/'
(no output)
$ grep -rn -E "What it writes" skills utils docs README.md
(no output)
```

## 1. Spec

- skills/plan-retro/SKILL.md:46: Steps 3 holds three actions in one numbered item (count the findings, steps and plans; name the heading; quote two or three findings). The layout (docs/dev/skill-layout.md:28) and the brief's point require one action per numbered item.
- skills/plan-retro/SKILL.md:54: Steps 7 holds two actions, showing the retro and taking each proposal's decision. ordo-init splits these into two items, Show (Steps 10) and Stop for the approval (Steps 11).
- skills/plan-retro/SKILL.md:57: Steps 10 says "Run each approved check proposal's command". Old line 47 says "each check proposal's command is run and its output shown", with no "approved". Adding "approved" narrows the rule: a check proposal the user corrected is no longer covered, since Steps 9 and 10 name only approved ones. The item also holds two actions (run, show).
- .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md:12: the row "Writes a retro report and changes nothing else until the user approves" points at Steps 7. Steps 7 (SKILL.md:54) shows the retro and takes the decisions but does not state that nothing else changes before approval. That rule is at Anti-patterns 3 (SKILL.md:91), which row 20 already names.
- .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md:10: one row covers two rules, "Group the findings by kind" (Steps 2, SKILL.md:45) and "count the kinds" (Steps 3). It points only at Steps 3.
- .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md:19: one row covers three rules ("finds the kinds, counts them and proposes the change") and points at Steps 5. Steps 5 holds only the proposal.
- .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md:30: the row "Each finding is assigned one kind, stated as a rule would forbid it, with the examples" points at Grouping 1. Grouping 1 (SKILL.md:62) holds what a kind is. "Each finding is assigned one kind" is at Steps 2 (SKILL.md:45). The row covers two rules and misplaces one.
- .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md:36: one row covers two rules, "Recurring kinds get a proposal" (Steps 5, SKILL.md:48) and "the rest are listed with counts and no proposal" (Steps 6, SKILL.md:53). It points only at Steps 6.

## 2. Proof

- .scratch/1-one-layout-for-every-skill/agents/reviews/12-report.md:17: the report introduces the grep output as "(refute's own "What it writes")", which says there is a hit in refute. The quoted output (lines 19-22) is empty, and the reviewer's rerun of that grep, and of a plain grep for "What it writes" over skills, utils, docs and README.md, prints nothing. The parenthetical is false.
- .scratch/1-one-layout-for-every-skill/agents/reviews/12-report.md:11: the verify-list row gives "seven `PASS:` lines" and does not quote them. The rerun shows seven PASS lines, so the claim holds, but the report does not carry the output that change-standard rule 7 asks for.

## 3. Standards

- .scratch/1-one-layout-for-every-skill/agents/reviews/12-report.md:24: docs/dev/change-standard.md rule 7 asks for every user-visible change with its before and after. The report leaves out several that a user reads differently: the new Use instead table (SKILL.md:21-24); the refusal's resume path, "The key added, then `/plan-retro` again" (SKILL.md:80), which is new text; the old proposal item 3 split into items 3 and 4 (listed only under judgment calls, with no before and after); and "approved" added in Steps 10.

## 4. Behaviour

- A check proposal the user corrects rather than approves: under the old file (line 47) its command is run and its output shown; under the new Steps 10 (SKILL.md:57) it is not, because Steps 10 names only approved check proposals.
- What is written before the user's decisions (only the retro file, at Steps 6, before the stop at Steps 7) and the proposal order (not written, then off the standards list, then checkable, then a sharper sentence) are the same as in the old file. Nothing else found.

## Not checked

- The whole of collect_findings.py beyond its docstring and its handling of `--exclude-listed` (lines 1-80, and the grep for "exclude").
- Whether check_rule_inventory.py covers every non-empty old line. Its `ok:` output was accepted; the rows were compared by hand only for the placements listed above.

Reviewer usage: 12 tool uses, about 12 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/plan-retro
ok: skills/plan-retro/SKILL.md
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
56
$ wc -l skills/plan-retro/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
     103 skills/plan-retro/SKILL.md
      63 .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
     166 total
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...exactly as docs/dev/building.md line 13...'
(no output), exit 0
$ git status --short
 M skills/plan-retro/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
$ git diff --stat 071041f
 skills/plan-retro/SKILL.md | 88 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 19 deletions(-)
$ grep -rn -E "## What it writes|## Grouping|The proposal for a recurring kind" skills utils docs README.md | grep -v '^skills/plan-retro/'
(no output)
```

Every closure the round claims holds when checked. Steps 3 to 5, 9 and 10, and 13 and 14 each hold one action. Steps 13 has the old words with no "approved". The inventory rows for old lines 3, 10, 27 and 31 are split, and each points at the item that holds its rule. Row 14 now points at Anti-patterns 3. The renumbering broke no pointer: What it reads 2 names Steps 1, the Stops row names Steps 10, Anti-patterns 3 names Steps 10 to 12, Anti-patterns 4 names Rules 2, and all 56 inventory rows match the numbered items they name. The report's grep sentence, its quoted PASS lines, its line counts (103 and 63, 56 rows) and its diff stat (69 insertions, 19 deletions) all match the reruns. Two findings remain:

- skills/plan-retro/SKILL.md:39: the collector command block has no language tag. docs/dev/skill-layout.md ("A code block holds commands ... and carries a language tag where one applies") calls for one. The landed precedent tags placeholder shell commands `sh` (skills/plan-orchestration/SKILL.md:145 and :153). Standards.
- .scratch/1-one-layout-for-every-skill/agents/reviews/12-report.md:26: "before, four prose sections" does not match the old file (`git show 9eda91c:skills/plan-retro/SKILL.md`). Of its four flow sections, What it reads (lines 14-23) and The proposal for a recurring kind (lines 37-39) are numbered lists; only Grouping and What it writes are prose. Proof.

Reviewer usage: 14 tool uses, about 12 minutes.

## Closed

Round 1's findings are closed in the round (`12-report.md`). The run over round 1 is closed at landing:

- The collector's code block had no language tag: it is tagged `sh`, as plan-orchestration's command blocks are.
- The report's "four prose sections": it says the old file's flow was four sections, two of them numbered lists (What it reads, The proposal) and two prose (Grouping, What it writes).
