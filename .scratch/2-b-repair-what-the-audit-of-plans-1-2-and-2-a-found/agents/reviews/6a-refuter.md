# Step 6a refuter report (on .agents/worktrees/2b-6a, base 819b391)

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  ten PASS: lines, ten ok: lines, "verify: 12 commands passed", exit=0
sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
  PASS: collect_findings.py scratch tests
grep -n 'NOTHING_FOUND\|OTHERS_REPRODUCE\|CLOSURE\|reports_nothing' skills/plan-retro/templates/collect_findings.py
  (no output), exit 1
python3 utils/check_skill_layout.py
  ten ok: lines including "ok: skills/plan-retro/SKILL.md", exit 0
Report commands:
  base collector (git show 819b391) over the cases fixture alone: "0 findings" (report claims 0 findings: reproduced); new collector: "3 findings"
  wc -l: collect_findings.py 270, collect_findings.test.sh 466, SKILL.md 111, retro.md 40, README.md 175 (base README 175): all as the report states
  git diff 819b391 --stat -- skills/plan-retro/templates/retro.md: empty (unchanged, as stated)
Reverts on copies of skills/plan-retro/templates under $TMPDIR:
  R1 NOTHING_FOUND drop put back (NOTHING_FOUND.match(item.strip()) -> continue): FAIL: "- None." under "## 1. Spec" is not a finding with heading spec
  R2 OTHERS_REPRODUCE drop put back (with FIRST_SENTENCE): FAIL: "- The other figures reproduce." under "## 2. Proof" is not a proof finding
  R3 CLOSURE drop put back (in the kind-is-None branch): FAIL: "- Spec 1: closed." in a round with no subheadings is not an unclassified finding
  R4 whole base collector with the new test: FAIL: "- None." under "## 1. Spec" is not a finding with heading spec
  Sanity: base test on base collector: PASS
  M1 ITEM = r"(- |\d[.)] )" (two-digit item numbers no longer items): new test PASS; base test on base collector with the same mutation FAIL (rows differ: - three-plan 5 first spec src/n.py:2 ...)
  M2 TRAILING without Proof: new test PASS; base test with the same mutation FAIL (- three-plan 5 round 1 proof src/n.py:8 / + ... unclassified src/n.py:8)
Collector over the worktree's .scratch .scratch/archive: base "687 findings", new "705 findings"; 18 new rows (proof 12, spec 2, standards 2, behaviour 1, unclassified 1), e.g. "none. Every figure the report gives matched the rerun...", "Every other figure reproduced.", "Closures checked, all hold: ..."
ASCII grep (LC_ALL=C grep -n '[^ -~]') over the three changed files and README.md:119: nothing. No line over 100 characters in the .py or .test.sh. git status --short at the end: the same five modified paths as at the start.
```

## 1. Spec

- none. The four items of "What to build" are in the diff; the paths written are within the brief's list plus the report file. The brief's premises on the base tree were not re-grepped at 129a3f7; the removed lines in the diff match the brief's description.

## 2. Proof

- collect_findings.test.sh (removed three-plan/5-refuter.md): the only fixture with two-digit numbered items ("10." to "15.") is gone; with ITEM narrowed to one digit (M1) the new test stays PASS where the base test went red. The collector still reads "<n>. " for any n, and no remaining fixture exercises n >= 10.
- collect_findings.test.sh (removed 5-refuter.md round item "Closure of Spec 2 does not hold: ... Proof."): the only case of a round item taking its kind from a trailing "Proof." is gone; with Proof removed from TRAILING (M2) the new test stays PASS where the base test went red. The remaining round items cover trailing "Spec." and "Behaviour." only; "Standards." was not covered before either.
- 6a-report.md:42 says the removed fixtures existed "only for a dropped form", which is not true of 5-refuter.md's two-digit items and its trailing-Proof round item; the report does not name these two lost coverages.

## 3. Standards

- README.md:119 and skills/plan-retro/SKILL.md:74: both say every item "in a repair round" is a finding. A subheaded round's list before its subheadings is not read (collect_findings.py:158-165, parts), and the test still asserts it gives none (collect_findings.test.sh:164-167). The new sentence is false for it (change-standard rule 14). The brief's wording was "every item of a 'Repair round <n>, refuted' section outside its unread subsections", which the SKILL.md bullet also drops.
- 6a-report.md:53: change-standard rule 14 asks the report to quote the grep over skills/, utils/, docs/ and README.md; the report states that the grep was run and its conclusion but gives neither the command nor its output. The reviewer's grep of the removed names and of "reports nothing", "no defect" and "closure" found no other sentence the change makes false; skills/refute/templates/report.md:38 ("Or: none.") still holds.

## 4. Behaviour

- The report's "User-visible changes" states the collector change by form only. It does not state the count over the ledger: `python3 collect_findings.py .scratch .scratch/archive` printed "687 findings" on the base collector and "705 findings" after (18 rows added: proof 12, spec 2, standards 2, behaviour 1, unclassified 1). A retro's "Counts by heading" table will count those 18 as findings under their headings unless the "no defect" reading subtracts them; the SKILL.md text does not say whether the heading counts include the "no defect" findings.

## Not checked

- The brief's "What is on the tree" line numbers at main 129a3f7.
- Whether NOT_READ's entries are each still held by a remaining fixture under a revert; NOT_READ is unchanged by this step.

Reviewer usage: 98,347 tokens, 23 tool uses, 329 s (the runner's completion notification).
