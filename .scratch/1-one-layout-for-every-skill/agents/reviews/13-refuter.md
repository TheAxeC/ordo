# Step 13 refuter

## Verification lines

All commands were run from /Users/axelfaes/workspace/ordo/.agents/worktrees/1-13.

```
$ python3 utils/check_skill_layout.py skills/repo-setup
ok: skills/repo-setup/SKILL.md
exit 0
$ python3 - (imports utils/check_rule_inventory.py and calls main() on the ledger inventory, with only its "rev-parse --show-toplevel" call answered with the worktree root, so the new file is read from the worktree; nothing written into any repository)
ok: /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/repo-setup.md
exit 0
$ python3 utils/check_rule_inventory.py /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/repo-setup.md
(62 lines "no section '## Quick start' / '## Steps' / ..." : it resolves against main's tree, where the old file still stands; expected before landing)
exit 1
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...exactly as the verify list...'
(no output), exit 0
$ LC_ALL=C grep -n '[^ -~]' .../inventories/repo-setup.md
(no output), exit 1
$ git status --short
 M skills/repo-setup/SKILL.md
$ git diff --stat 276b9ea
 skills/repo-setup/SKILL.md | 135 +++++++++++++++++++++++++++++++--------------
 1 file changed, 93 insertions(+), 42 deletions(-)
$ git diff --stat 709fcf6
 .../agents/briefs/13.md                            |  26 ++++
 skills/repo-setup/SKILL.md                         | 135 ++++++++++++++-------
 2 files changed, 119 insertions(+), 42 deletions(-)
$ wc -l skills/repo-setup/SKILL.md .../inventories/repo-setup.md
     143 skills/repo-setup/SKILL.md
      74 .../inventories/repo-setup.md
$ grep -c '^| [0-9]' .../inventories/repo-setup.md
67
$ grep -rn -E "What it asks|Order of work|question [36]" skills utils docs README.md | grep -v '^skills/repo-setup/'
(no output), exit 1
$ awk (double blank lines) / grep ' $' / grep '\*\*\|__' over skills/repo-setup/SKILL.md
(no output)
```

## Spec

1. skills/repo-setup/SKILL.md:37: "2. Ask "The questions", together, in plain prose, each with its default in brackets." This step waits for the user's answers, but the Stops table (lines 113-120) has no row for it. The landed precedent lists a question as a stop: skills/ordo-init/SKILL.md:91. Fix: add a row "The questions | Every setup, at Steps 2 | The eight questions, each with its default | The user's answers", mark Steps 2 with ("Stops"), and change line 122 to "The first six rows".
2. skills/repo-setup/SKILL.md:137: "No file of the tree is written until the user approves or corrects the draft." The old rule says "Nothing is written until the user approves or corrects it" (old line 56) and "It shows the full tree and every file's text before it writes anything" (old line 15). "No file of the tree" narrows it. Fix: "After Steps 1, nothing is written until the user approves or corrects the draft."
3. skills/repo-setup/SKILL.md:59: "12. Commit by explicit path list, ...". The old line 70 says "One commit by explicit path list". "One" is lost from the step. Fix: "12. Commit the setup in one commit, by explicit path list, ...".
4. skills/repo-setup/SKILL.md:74-77: sync steps 5 to 7 belong only to exit 2 in the old text (old line 84), and the new text does not state that condition; step 8 applies after both exit 1 and exit 2 (old line 86) and does not say so. Fix: make steps 5 to 7 sub-items of step 4, or begin each with "Exit 2:", and say in step 8 that it follows exit 1 or exit 2.
5. skills/repo-setup/SKILL.md:140: "The coding standard is copied, written from rules the user states, or left out; the skill never invents a coding rule." The first clause repeats The questions 6 (line 86). Fix: "The skill never invents a coding rule."
6. skills/repo-setup/SKILL.md:49: "11. Run the checks, and show each one's output" is two actions in one item (docs/dev/skill-layout.md:28). Fix: split it. The same applies to sync step 1 (line 64): "and act on its exit status" can be split or moved.
7. skills/repo-setup/SKILL.md:120: "One of those, or an empty folder" is stricter than the old rule (old lines 11 and 55: a folder that holds no tracked file), and contradicts Quick start line 15. Fix: "One of those, or a folder with no tracked file".
8. .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md:66: the row for old line 84 holds two rules, and Stops 4 holds only the second. Fix: split it, the replacement after comparison to Steps / sync 4, the ruling on a difference to Stops 4.
9. .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md:10 and :19: each row holds two rules: show the draft (Steps 4) and write nothing before that (Rules). Fix: split each row.
10. .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md:52: "One commit by explicit path list ..." to Steps 12, which does not hold "one". Closes with finding 3.
11. skills/repo-setup/SKILL.md:30-31: What it reads leaves out the `ordo-init` skill's `templates/check_config.py`, which Steps 11 runs, and says the repository's `CLAUDE.md` is read through `sync_rules.py` although the exit-2 draft reads its rules directly. Fix: name `check_config.py` in item 3, and add the rules of `CLAUDE.md` for the exit-2 draft to item 4.

## Proof

1. .scratch/1-one-layout-for-every-skill/agents/reviews/13-report.md:13: "(`git diff --stat 709fcf6`: 93 insertions, 42 deletions)". The rerun prints "2 files changed, 119 insertions(+), 42 deletions(-)"; the 93/42 figure is `git diff --stat 276b9ea`'s. Fix: quote the command that gives the figure.
2. .scratch/1-one-layout-for-every-skill/agents/reviews/13-report.md:10: the command column quotes one command and the output column the output of another, on a copied path. Run as quoted from the worktree, the command finds no file. The reviewer's equivalent run prints `ok:`. Fix: quote the command actually run, with its copy step.
3. The other figures in the report reproduce: 143 lines, 74 inventory lines, 67 rows, seven PASS lines, a clean ASCII check, and the empty grep.

## Standards

1. .scratch/1-one-layout-for-every-skill/agents/reviews/13-report.md:24-30: docs/dev/change-standard.md:19 (rule 7) asks for every user-visible change with its before and after. The list leaves out the new title paragraph (SKILL.md:10), the new What it reads section (SKILL.md:26-31), the new Anti-patterns table (SKILL.md:127-132), the new Stops cells "The user's commit" and "One of those, or an empty folder" (SKILL.md:119-120), and "One" removed from the commit step. Fix: add each with its before and after.
2. No sentence in README.md, docs/ or another skill is made false.

## Behaviour

1. skills/repo-setup/SKILL.md:74-77: after `sync` exits 1, the new list reads as if it goes on to rerun the check until it exits 0, which the old file did not do. See Spec 4.
2. skills/repo-setup/SKILL.md:137: before, nothing at all was written between the draft and the approval; after, only files of the tree are covered. See Spec 2.
3. skills/repo-setup/SKILL.md:120: the refusal's resume path now names "an empty folder". See Spec 7.

## Not checked

- The behaviour of `templates/sync_rules.py` against the exit-status meanings stated in sync steps 2 to 4; only the script's test was run.
- Whether the `sh` tag on the check block (SKILL.md:51) is right for a block holding `<...>` placeholders, as the landed plan-orchestration blocks do.
- The Anti-patterns "See Rules: ..." cells name the section with a short paraphrase rather than a bullet number; not judged against the ruling beyond reading it.
- Importing check_rule_inventory.py created a `utils/__pycache__/` in the worktree; the reviewer deleted it, and `git status --short` afterwards shows only ` M skills/repo-setup/SKILL.md`.

Reviewer usage: 14 tool uses, about 15 minutes.

## Repair round 1, refuted

### Verification lines

```
$ git diff --stat 276b9ea
 skills/repo-setup/SKILL.md | 137 +++++++++++++++++++++++++++++++--------------
 1 file changed, 95 insertions(+), 42 deletions(-)
$ wc -l skills/repo-setup/SKILL.md
     145 skills/repo-setup/SKILL.md
$ python3 -B utils/check_skill_layout.py skills/repo-setup
ok: skills/repo-setup/SKILL.md
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git/worktrees/1-13 GIT_WORK_TREE=<worktree> python3 -B utils/check_rule_inventory.py <scratchpad>/r1inv/repo-setup.md
ok: <scratchpad>/r1inv/repo-setup.md
$ (negative control: the two "Steps 13" rows changed to "Steps 14")
<scratchpad>/r1inv/neg.md:55: item 14 of 'Steps' does not exist; it has 13
<scratchpad>/r1inv/neg.md:56: item 14 of 'Steps' does not exist; it has 13
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
(ASCII check: no output, exit 0)
```

Every closure of the first run was checked against the files and holds; no check was removed in place of a fix; each of the 71 inventory rows was read against the new file.

### Spec

1. skills/repo-setup/SKILL.md:139: "- After Steps 1, nothing is written until the user approves or corrects the draft." The bullet sits in Rules with no limit to the setup, so under `sync` exit 1 it can be read as forbidding the `--write` that follows the per-hunk ruling (SKILL.md:67-68). Fix: limit it to the setup.

### Proof

1. .scratch/1-one-layout-for-every-skill/agents/reviews/13-report.md:10 and :46: the quoted inventory command writes into the worktree, so it was not rerun as written; an equivalent run that writes nothing prints `ok:`. No fix needed.

### Standards

1. skills/repo-setup/SKILL.md:30: "the ordo-init skill's `templates/check_config.py`, and the roadmap skill's `templates/roadmap.md`". docs/dev/skill-layout.md ("Paths and names") names another skill's file with the skill's name in code. Fix: "the `ordo-init` skill's ... the `roadmap` skill's ...".

### Behaviour

1. skills/repo-setup/SKILL.md:139: the same as Spec 1.

### Not checked

- The quoted row-2 command as written (it writes into the repository).
- `templates/sync_rules.py` against the exit statuses in sync steps 2 to 8; only its test was run.
- Whether inventory row 62 holds one rule or two; unchanged in the round.

## Closed

- First run: every finding closed in repair round 1; the closures are in `13-report.md`, "Repair round 1".
- Round run, Spec 1 and Behaviour 1: fixed at landing; Rules reads "- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4)."
- Round run, Standards 1: fixed at landing; What it reads 3 reads "the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`".
- Round run, Proof 1: no fix needed; the equivalent run prints `ok:`.
