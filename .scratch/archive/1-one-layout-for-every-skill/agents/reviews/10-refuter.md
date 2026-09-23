# Step 10 refuter report (on .agents/worktrees/1-10, base 8ecfb4a)

## Verification (rerun by the reviewer)

```
$ python3 utils/check_skill_layout.py skills/ordo-init
ok: skills/ordo-init/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
60
$ wc -l skills/ordo-init/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
      99 skills/ordo-init/SKILL.md
      67 .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
     166 total
sh skills/land/templates/land.test.sh 2>&1 | tail -1                         PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1            PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1       PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1            PASS: sync_rules.py scratch tests
sh utils/pin.test.sh 2>&1 | tail -1                                          PASS: pin.sh scratch tests
sh utils/check_skill_layout.test.sh 2>&1 | tail -1                           PASS: check_skill_layout.py scratch tests
sh utils/check_rule_inventory.test.sh 2>&1 | tail -1                         PASS: check_rule_inventory.py scratch tests
ASCII check (docs/dev/building.md form): no output, exit 0
$ grep -rn -E 'Drafting the file|Approval, then writing|Ignore rules' skills utils docs README.md | grep -v '^skills/ordo-init/'
(no output, exit 1)
$ git status --short
 M skills/ordo-init/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
$ git diff 8ecfb4a --stat
 skills/ordo-init/SKILL.md | 118 +++++++++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 38 deletions(-)
```

## 1. Spec

- skills/ordo-init/SKILL.md:64 and 66: the old rule "It writes nothing until the user approves or corrects the draft" (old line 41) now exists only as the Stops row's "What resumes it" (line 83). The inventory (row at old line 41, "Nothing is written until...") points at Stops 1, and that row does not state it. Step 9 (line 64) says "When it does not, the skill adds `/<worktree_root>/` to `.gitignore`", and it comes before the approval stop at step 10. Read in execution order, that is a write before approval. The old file's blanket "writes nothing until" covered the Ignore rules section; the new file has nothing that does the same, so the rule is weakened.
- skills/ordo-init/SKILL.md:93: the old Rules line 55, "The skill draws only from the repository and the user", held for everything the skill drafts, `.agents/plan.yaml` included. It now survives only as the Do instead cell of an anti-pattern whose subject is "A rule the repository does not state, written into a page". That moves the rule under a condition that narrows it to pages.
- skills/ordo-init/SKILL.md:94: the old line 56, "changes to an existing file are shown as a diff and approved like the draft", covered any existing file, `.gitignore` included (the `.agents/` rule rewrite at step 9 changes one). It is now tied to "Overwriting an existing page or `.agents/plan.yaml`", which is narrower. Step 10 (line 66) shows only "the `.gitignore` lines it would add or rewrite", not a diff.
- skills/ordo-init/SKILL.md:93 and 98: citing is written twice. Rules line 98 says "A page the skill writes states what the repository already does or says, and cites where"; the anti-pattern's Do instead says "and cite where each line comes from".
- skills/ordo-init/SKILL.md:83 and 66: the order of what is shown is written twice. It is in step 10 ("in this order: the form and why; the draft ...; each page ...; the `.gitignore` lines") and again in the Stops row's What it shows ("The form, the draft file, the pages and the `.gitignore` lines, in that order"). This is against the plan's ruling that the required tables restate nothing.
- skills/ordo-init/SKILL.md:85 and 56: "with the example's value as the offered answer" is written in step 6 and again in the Stops row "Worker and reviewer", column What it shows. The same ruling applies.
- skills/ordo-init/SKILL.md:86 and 49: the Stops row "A failing command" repeats "its exit status and its last lines" from the step 3 bullet at line 49.
- skills/ordo-init/SKILL.md:34 and 15: "Run from the repository root" is written at Steps line 34 and again in the Quick start comment ("from the repository root").
- skills/ordo-init/SKILL.md:64: one bullet holds two rules: the worktree root must be ignored (with its check command), and when it is not, `/<worktree_root>/` is added.
- skills/ordo-init/SKILL.md:65: one bullet holds two rules: `.agents/plan.yaml` must not be ignored (with its check), and a whole-`.agents/` rule is rewritten as `.agents/*` plus `!.agents/plan.yaml`. The inventory gives these two rows (old line 37) that both point at the same bullet.
- skills/ordo-init/SKILL.md:49: one bullet holds two rules: each command is run once before it is written, and its exit status and last lines are shown beside it.
- skills/ordo-init/SKILL.md:66-68: steps 10 and 11 each hold more than one action ("Show ... Then stop for the approval"; "Write what was approved, then run ... and show its output"), against docs/dev/skill-layout.md:28, "one action per item".
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:9: one row covers several rules of old line 3 (draft from the repository, offer the pages it lacks, fix the ignore rules, write nothing until approval) and points them all at "Steps". This is against the plan ruling that one row covers one rule and a line holding several gets one row per rule.
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:14: the row for old line 10 ("writes the one file ... and the pages it names when the repository lacks them") points at Quick start. Quick start (new line 15) says only "draft .agents/plan.yaml for approval, or check the one that is there" and does not hold the pages part. The rule is in the title paragraph at new line 10.
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:49: one row covers two rules of old line 36 (the check that the root is ignored, and adding the root to `.gitignore`).
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:53: the row "Nothing is written until the user approves or corrects the draft" points at Stops 1, which does not state it (see the first finding).
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:63: the row "The skill draws only from the repository and the user" points at Anti-patterns 1, where the rule holds only for pages (see the second finding).

## 2. Proof

- none. Every figure the report gives matched the rerun: 57 lines to 99, 80 insertions and 38 deletions, an inventory of 67 lines with 60 rows, both checks printing `ok:`, seven `PASS:` lines, a clean ASCII check, no output from the grep, and the section counts on line 15.

## 3. Standards

- skills/ordo-init/SKILL.md:93-94 and 98: docs/dev/skill-layout.md, "A rule is written once" and the anti-pattern "The same rule written in two sections". The duplicates are the citing rule, and in the Stops rows at lines 83, 85 and 86 the text repeated from steps 10, 6 and 3.
- skills/ordo-init/SKILL.md:49, 64, 65: docs/dev/skill-layout.md, Lists and tables, "One rule per bullet or item".
- skills/ordo-init/SKILL.md:66-68: docs/dev/skill-layout.md, Sections row 5, "one action per item".
- README.md:83 ("shows it with any page it would create and the `.gitignore` lines it would add, and writes after you approve") and skills/repo-setup/SKILL.md:59 ("with its own draft and approval"): new step 9 at line 64 says the skill adds the `.gitignore` line before the approval at step 10. Read in order, the new file contradicts both sentences. This is change-standard rule 14, a sentence elsewhere made false.

## 4. Behaviour

- A run that follows the new file's steps in order adds `/<worktree_root>/` to `.gitignore` at step 9 (skills/ordo-init/SKILL.md:64), before the approval stop at step 10. The old file wrote nothing before approval.
- When an existing `.gitignore` rule for `.agents/` is rewritten, the new file shows the lines it would change (line 66). The old rule at line 56 required a diff approved like the draft, and nothing in the new file requires one.
- In check mode, step 5 ("Run the check again", line 77) is a separate, unconditional item, so the check runs a second time even when there was no error and no fix. The old file reran the check only after the fixes ("proposes the fix, and makes it after the user approves, then runs the check again").
- Drafting `.agents/plan.yaml` values (roots, forms, optional keys) is no longer bound by "draws only from the repository and the user": the new file states it only for pages (line 93).

## Not checked

- The builder's claim that no file names a section of ordo-init was not verified beyond the grep for the three removed section names (no output). No grep was run for "Checking an existing file", a section that still exists but is now a `###` under Steps.

Reviewer usage: 13 tool uses, about 12 minutes.

## Repair round 1, refuted

```
$ python3 utils/check_skill_layout.py skills/ordo-init
ok: skills/ordo-init/SKILL.md            (exit 0)
$ python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md            (exit 0)
$ grep -c '^| [0-9]' .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
65
$ wc -l skills/ordo-init/SKILL.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
     107 skills/ordo-init/SKILL.md
      72 .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
     179 total
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
ASCII check (docs/dev/building.md form): no output, exit 0
$ git status --short
 M skills/ordo-init/SKILL.md
?? .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
$ git diff 8ecfb4a --stat
 skills/ordo-init/SKILL.md | 126 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 88 insertions(+), 38 deletions(-)
```

- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:45: the row for old line 28 ("worker and reviewer asked, with the example's value offered") still points at Stops 3. The round's closure turned that cell into a pointer: SKILL.md:90 now reads "The offered answer Steps 6 names". The rule itself is now only at Steps 6 (SKILL.md:57), so the row points at a place that does not hold the rule. The Steps and Stops renumbering was not carried to this row. Spec.
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:38: the row for old line 25 ("A failing command is not written as a check: shown, and the user decides") points at Stops 4. "Not written as a check" appears only in Steps 3 (SKILL.md:51); the Stops 4 row (SKILL.md:91) does not state it. The row also covers two rules. The round claims "Inventory rows covering several rules or pointing at places that did not hold them: Split and re-pointed", and this row shows the claim is not complete. Spec.
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:18: the row for old line 10 covers three rules, "It drafts from the repository, shows the draft, and writes only what the user approves", and points all three at Rules 1. Rules 1 (SKILL.md:103) holds only the third. Drafting from the repository is Rules 2 (SKILL.md:104), and showing the draft is Steps 10 (SKILL.md:69). This is against the plan's ruling of one rule per row. Spec.
- .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md:11: the row for old line 3 still joins two rules in one row: git ignores the worktree root, and the configuration stays tracked. Both are in Steps 9, but the ruling asks for one row per rule, and the round split the other rules of line 3 (rows 9 to 14). Spec.
- skills/ordo-init/SKILL.md:69 and 106: two sentences now state the diff requirement for `.gitignore`, and their scopes differ. Rules 4 says "A change to an existing file, `.gitignore` included, is shown as a diff". Step 10 shows "the `.gitignore` lines it would add, and a diff of any it would rewrite". Lines added to an existing `.gitignore` are a change to an existing file, so Rules 4 requires a diff for them while Step 10 shows them only as lines. The closure for the diff rule wrote the rule twice (docs/dev/skill-layout.md, "A rule is written once") and the two copies disagree on added lines. Standards.
- skills/ordo-init/SKILL.md:81: check-mode step 4 ("For each error, propose the fix, and make it after the user approves") still holds two actions with the approval between them. The closure "Steps 10 to 14, one action each" split show, stop and write into separate items for the setup flow (SKILL.md:69-72) but not for the check flow. This is against docs/dev/skill-layout.md:28, "one action per item". Standards.

Closures verified as holding: Rules 1 at SKILL.md:103, with step 9 now drafting and nothing written before step 12; Rules 2 widened to the drafted file; the citing rule written once (Rules 3, with Anti-patterns 1 pointing there); the Stops cells at SKILL.md:88, 90 and 91 pointing at Steps 10, 6 and 3, each of which holds what the cell names; "Run from the repository root" only at SKILL.md:34; steps 3 and 9 split one rule per bullet; the check rerun made conditional at SKILL.md:82; the Quick start now naming the pages (inventory row 17). README.md:83 and skills/repo-setup/SKILL.md:59 are consistent with the new order. Every other inventory row's Steps, Stops, Rules and Anti-patterns number matches the renumbered file. The line-by-line pass over the old file found no other rule lost or changed in meaning.

Reviewer usage: 10 tool uses, about 12 minutes.

## Closed

Round 1's findings are closed in the round (`10-report.md`). The run over round 1 is closed at landing:

- Inventory rows for old lines 28, 25, 10 and 3 pointed at places that did not hold them or covered several rules: split and re-pointed (worker and reviewer to Steps 6; "not written as a check" to Steps 3 and the user's decision to Stops 4; drafting, showing and writing to Rules 2, Steps 10 and Rules 1; the ignored root and the tracked configuration to two rows).
- The diff rule in step 10 and Rules 4 with different scopes: step 10 shows "the `.gitignore` changes, as Rules 4 says", and Rules 4 alone states the rule.
- Check-mode step 4 held two actions: step 4 proposes the fix for each error, step 5 makes the fix the user approved, step 6 runs the check again after the fixes.
