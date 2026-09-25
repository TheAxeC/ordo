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

## Repair round 1, refuted

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  exit=0; grep -c '^PASS:' 10; grep -c '^ok:' 10; last line "verify: 12 commands passed"
sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
  PASS: collect_findings.py scratch tests
grep -n 'NOTHING_FOUND\|OTHERS_REPRODUCE\|CLOSURE\|reports_nothing' skills/plan-retro/templates/collect_findings.py
  (no output), exit 1
python3 utils/check_skill_layout.py
  ok: skills/plan-retro/SKILL.md (exit 0)
Collector over the worktree's .scratch .scratch/archive:
  base (git show 819b391) "687 findings"; new "705 findings"; new by heading spec 266, proof 147,
  standards 165, behaviour 126, unclassified 1; 0 rows only in base, 18 only in new
  (proof 12, spec 2, standards 2, behaviour 1, unclassified 1): the report's figures reproduce
wc -l after/before: collect_findings.py 270/293, collect_findings.test.sh 474/459, SKILL.md 111/110,
  retro.md 42/40, README.md 175/175; git diff 819b391 -U0 -- README.md: one hunk, @@ -119 +119 @@
Reverts planted on copies under $TMPDIR (ref6a.*, nr6a.*), each copied test run:
  ITEM one digit r"(- |\d[.)] )": FAIL: rows differ ... / - three-plan 6 first spec src/h.py:8
  Proof out of TRAILING: FAIL: rows differ ... / - one-plan 1 round 1 proof src/a.cpp:40 / + ... unclassified src/a.cpp:40
  Standards out of TRAILING: FAIL: rows differ ... / - one-plan 1 round 1 standards src/a.cpp:50 / + ... unclassified src/a.cpp:50
  NOTHING_FOUND drop put back: FAIL: "- None." under "## 1. Spec" is not a finding with heading spec
  OTHERS_REPRODUCE drop put back: FAIL: "- The other figures reproduce." under "## 2. Proof" is not a proof finding
  CLOSURE drop put back (fixed is None): FAIL: "- Spec 1: closed." in a round with no subheadings is not an unclassified finding
  NOT_READ without verification / not checked / closures / usage: each FAIL: rows differ (+ two-plan 3 round 1 unclassified ...)
  NOT_READ without closed: PASS: collect_findings.py scratch tests
Rule 14 grep quoted in the report, rerun: the same 27 file:line hits the report lists.
LC_ALL=C grep '[^ -~]' over the four changed skill files and README.md:119: nothing; no line over 100 characters in the .py or .test.sh.
git status --short at the end: the same six modified paths as at the start.
```

### Spec

- None found. Each of the six closures in 6a-report.md's "Repair round 1" table matches the round's delta (`git diff aea1d8d`). The one gap is that the rulings' own text is not in the ledger (see "Not checked"), so each closure was compared only with the first review's finding it names.

### Proof

- 6a-report.md:33 says the silent cases (Verification, Not checked, Usage and Closed lists) are held by the cases file's exact comparison. A silent "Closed" list is not held by `NOT_READ`: with `closed` removed from `NOT_READ` (collect_findings.py:45) on a copy, the test stayed `PASS: collect_findings.py scratch tests`. A level-two `## Closed` is never read in any case, because `parts` returns for any section name outside the four headings and the round pattern (collect_findings.py:151-157). No fixture has a `### Closed` subsection, the only place where `closed` in `NOT_READ` makes a difference, so the case at collect_findings.test.sh:342-344 proves nothing about the `closed` entry (change-standard rule 13).
- 6a-report.md:55 says the README bullet before the change was "seven sentences". The base line (`git show 819b391:README.md | sed -n 119p`) has 13 sentences.

### Standards

- skills/plan-retro/SKILL.md:74 and README.md:119 name "a subheaded round's list before its subheadings" as a part the collector does not read. The collector skips that list only when a subheading is Spec, Proof, Standards or Behaviour (collect_findings.py:159; the docstring at :12-13 says so correctly). A round whose only subheadings are unread ones keeps its list before them: a scratch report with `## Repair round 1, refuted`, then `- src/x.py:1: a list before the subheadings.`, then only `### Closures` and `### Not checked` gave `1 findings`, heading `unclassified`, location `src/x.py:1`. Both sentences are false for that shape (change-standard rule 14).

### Behaviour

- None found. The report states before and after for the collector's output, the counts (687 before, 705 after, with the split by heading, both reproduced), SKILL.md Steps 1, Steps 8 and Grouping, the new line in retro.md's "Counts by heading", and README.md:119.

### Not checked

- The text of the round's rulings as sent to the builder: 6a-refuter.md holds only the first review, and no ledger file holds the rulings. Each closure was checked against the first review's finding.
- The line numbers in the brief's "What is on the tree" section, checked at main 129a3f7.
- A revert of the fence handling, unchanged by the step.

Reviewer usage: 95,799 tokens, 26 tool uses, 325 s (the runner's completion notification; reviewer claude:opus, agent a877a74343597cb07).

## Closed

- Spec (first review): none raised.
- Proof 1 (the two-digit item number lost with `5-refuter.md`): closed in the round; `10. src/h.py:8` in `6-refuter.md`, red with `ITEM` narrowed to one digit.
- Proof 2 (a round item's trailing `Proof.` lost with `5-refuter.md`): closed in the round; round items at `src/a.cpp:40` and `:50`, red with `Proof` or `Standards` out of `TRAILING`.
- Proof 3 (the report said the removed fixtures existed only for a dropped form): closed in the round; the report's "Files" names what `5-refuter.md` also covered and where it now lives.
- Standards 1 (`README.md:119` and `SKILL.md:74`, "in a repair round"): closed in the round, and the round's wording fixed at landing (below).
- Standards 2 (the rule 14 grep not quoted): closed in the round; the report's "Brief" quotes it with its output.
- Behaviour 1 (the collector's count change unstated): closed in the round; 687 before, 705 after, with the split by heading, reproduced by the round's reviewer.
- Round, Proof 1 (the `closed` entry of `NOT_READ` held by no case): fixed at landing; a `### Closed` subsection in report 3's subheaded round, and with `closed` removed from `NOT_READ` the test prints `FAIL: rows differ from the expected rows (- expected, + got):` then `+ two-plan 3 round 1 unclassified src/c.py:7`.
- Round, Proof 2 ("seven sentences"): fixed at landing; `6a-report.md` says thirteen.
- Round, Standards 1 (the list before a round's subheadings named as unread whatever the subheadings): fixed at landing; `SKILL.md:74` and `README.md:119` say it is unread when one of the subheadings is Spec, Proof, Standards or Behaviour.
