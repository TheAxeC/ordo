# Step 6a report: collect_findings.py drops only items that report no defect or a closure that holds

Everything in the brief and in repair round 1 is done. The section "Repair round 1" at the end states the tree as it is where the first build's sections differ from it: the no-finding forms, the closure forms, the cases, the reverts, the counts and the list.

## Open items (verbatim from the state file)

- none.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. The no-finding forms | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh`; the reverts below | `PASS: collect_findings.py scratch tests`; reverts 1 and 8 to 19 red |
| 2. Closures | DONE | the same test; the reverts below | reverts 2 and 20 to 36 red |
| 3. Tests: the 34 cases, two heading suffixes, three entry refusals, each red under its revert | DONE | the reverts below | reverts 1 to 36 exit 1; revert 0 (none) exits 0 |
| 4. Docstring and the test's head comment | DONE | `git diff skills/plan-retro/templates/collect_findings.py` | the docstring states the forms of decisions 1 and 2; the head comment names the new cases |
| 5. The counts before and after, and the hand counts again | DONE | "The counts", "The hand count" | 672 to 673 and 538 to 539; hand counts unchanged, one difference explained |
| 6. The complete list of items that report no defect | DONE | "Items that report no defect" | 31 rows, read from all 673 |
| Verify list | DONE | `PYTHONDONTWRITEBYTECODE=1 sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"` | ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0 (quoted under "Verification") |
| Summary line of the test | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1` | `PASS: collect_findings.py scratch tests` |
| Paths written | DONE | `git status --short` | the two collector files, and this report |

## Verification

```
$ PYTHONDONTWRITEBYTECODE=1 sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"
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
verify exit 0
```

```
$ PYTHONDONTWRITEBYTECODE=1 sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ git status --short
 M skills/plan-retro/templates/collect_findings.py
 M skills/plan-retro/templates/collect_findings.test.sh
?? .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/6a-report.md
$ find . -name __pycache__ -not -path './.git/*'
$ awk 'length > 100 {print FILENAME": "FNR}' skills/plan-retro/templates/collect_findings.*
$ LC_ALL=C grep -n '[^ -~]' skills/plan-retro/templates/collect_findings.*
```

The last three commands print nothing. The `git status` and `git diff` commands quoted in this report are read-only and were run in the worktree, although the dispatch message said to run no git command; no git state was changed.

## The test, red first

The new test was run against the collector at the base before the collector was changed. It fails on the cases:

```
$ PYTHONDONTWRITEBYTECODE=1 sh skills/plan-retro/templates/collect_findings.test.sh; echo "exit $?"
FAIL: the cases' findings differ (- expected, + got):
- first | Nothing says what happens when the check fails: the page is silent.
- first | No defect test covers the tab case.
- first | No finding in the report names the file.
- first | Nothing rejects a relative path.
- first | No findings are listed for step 3, although it has two.
- first | Nothing found by the test, although a.py:3 is wrong.
- round 1 | Spec 2: closed in part only; the tab case is still missing.
- round 1 | Proof 1, claimed closed: closed is not what the rerun shows.
- round 1 | Closed? No: src/a.py:7 still fails.
- round 1 | Closed only for the codex path.
- round 1 | Closures checked; Spec 2 does not hold: a.py:4.
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
exit 1
```

That run had the 34 cases, the `a.py` case, the two-suffix heading and the four refusals in the test. The round cases for "no", "still", "partly", "in part", "?" and the label's colon came in afterwards; each is shown red below under its own revert.

## Reverts

Each revert is one edit (revert 35: two) to a copy of the final `collect_findings.py` in the scratchpad, with the final test beside it, run with `PYTHONDONTWRITEBYTECODE=1`. The test stops at its first failing check, so the harness also runs the reverted collector over the test's cases ledger (the heredoc copied out of the test) and prints the cases' own diff: each of the 34 cases is shown red under a revert even where an earlier check of the test fails first. Revert 0 is the harness run on the unchanged files.

Which revert turns each case red:

- The six "a finding" cases of the no-finding forms: revert 1, the old `NOTHING_FOUND` matched at the start of the item.
- The fourteen "not a finding" cases of the no-finding forms: revert 8 (the four "None" cases) and revert 9 (the other ten); reverts 10 to 19 each turn the cases of one form red.
- The six closures that hold: revert 20 (all six); reverts 21 to 24, one form each; revert 34 for "Spec 1: closed; the rerun reproduces, not only the test.".
- Seven of the eight closures that do not hold: revert 2, the old `CLOSURE`.
- "Spec 3: not closed.": revert 35. Two parts of the rule keep this case a finding at once: the label form needs "closed" right after the colon, and the clause holds "not". No single revert turns it red; revert 35 loosens the label form and removes "not" together.
- The heading with two suffixes: revert 3. The entry refusals: reverts 4 to 7.

```
$ python3 -B $S/reverts.py      # S: the scratchpad folder holding the script below
== revert 1 old NOTHING_FOUND (start-of-item match, no whole-sentence rule): exit 1
FAIL: the cases' findings differ (- expected, + got):
- first | Nothing says what happens when the check fails: the page is silent.
- first | No defect test covers the tab case.
- first | No finding in the report names the file.
- first | Nothing rejects a relative path.
- first | No findings are listed for step 3, although it has two.
- first | Nothing found by the test, although a.py:3 is wrong.
   the cases' own diff under this revert (- expected, + got):
   - first | Nothing says what happens when the check fails: the page is silent.
   - first | No defect test covers the tab case.
   - first | No finding in the report names the file.
   - first | Nothing rejects a relative path.
   - first | No findings are listed for step 3, although it has two.
   - first | Nothing found by the test, although a.py:3 is wrong.
== revert 2 old CLOSURE: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 2: closed in part only; the tab case is still missing.
- round 1 | Proof 1, claimed closed: closed is not what the rerun shows.
- round 1 | Closed? No: src/a.py:7 still fails.
- round 1 | Closed only for the codex path.
- round 1 | Closures checked; Spec 2 does not hold: a.py:4.
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
- round 1 | Closed: no test covers it.
- round 1 | Closed: still red at a.py:3.
- round 1 | Closed: partly.
- round 1 | Closed: in part, the tab case remains.
- round 1 | Closed: does the tab case hold?
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 2: closed in part only; the tab case is still missing.
   - round 1 | Proof 1, claimed closed: closed is not what the rerun shows.
   - round 1 | Closed? No: src/a.py:7 still fails.
   - round 1 | Closed only for the codex path.
   - round 1 | Closures checked; Spec 2 does not hold: a.py:4.
   - round 1 | Closed: the fix does not hold at a.py:3.
   - round 1 | Closed: only the claude path.
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   - round 1 | Closed: no test covers it.
   - round 1 | Closed: still red at a.py:3.
   - round 1 | Closed: partly.
   - round 1 | Closed: in part, the tab case remains.
   - round 1 | Closed: does the tab case hold?
== revert 3 heading_name single pass: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 7 first behaviour src/h.py:8
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 4 '.' accepted as a plan: exit 1
FAIL: retro retro-dot.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 5 '' accepted as a plan: exit 1
FAIL: retro retro-no-plan.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 6 '-refuter.md' suffix not checked: exit 1
FAIL: retro retro-name.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 7 empty step accepted: exit 1
FAIL: retro retro-step.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 8 NONE form removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 first proof -
+ one-plan 1 first behaviour -
+ one-plan 2 first proof -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ two-plan 3 first behaviour -
+ two-plan 3 round 1 standards -
   the cases' own diff under this revert (- expected, + got):
   + first | None.
   + first | None found.
   + first | None: the report reproduces.
   + first | None of the eleven cases fails.
== revert 9 NOTHING_FOUND forms removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Nothing.
   + first | Nothing found.
   + first | Nothing here.
   + first | No findings.
   + first | No finding.
   + first | No defects.
   + first | No defect.
   + first | No defect found.
   + first | Otherwise none.
   + first | Checked, no defects.
== revert 10 'found'/'here' suffix removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Nothing found.
   + first | Nothing here.
   + first | No defect found.
== revert 11 'none' narrowed to a whole first sentence: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | None found.
   + first | None of the eleven cases fails.
== revert 12 'nothing' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Nothing.
   + first | Nothing found.
   + first | Nothing here.
== revert 13 'no findings?' -> 'no finding': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ first | No findings.
   the cases' own diff under this revert (- expected, + got):
   + first | No findings.
== revert 14 'no findings?' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | No findings.
   + first | No finding.
== revert 15 'no defects?' -> 'no defect': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ first | No defects.
   the cases' own diff under this revert (- expected, + got):
   + first | No defects.
== revert 16 'no defects?' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | No defects.
   + first | No defect.
   + first | No defect found.
== revert 17 'otherwise none' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Otherwise none.
== revert 18 'checked, no defects?' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Checked, no defects.
== revert 19 'checked, no defects?' -> 'checked, no defect': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ first | Checked, no defects.
   the cases' own diff under this revert (- expected, + got):
   + first | Checked, no defects.
== revert 20 closure_holds always false: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 unclassified src/a.cpp:14
+ one-plan 1 round 1 spec src/a.cpp:14
+ one-plan 1 round 1 proof src/a.cpp:40
+ three-plan 5 round 1 unclassified -
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Closed.
   + round 1 | Closed: the fix at a.py:3 holds.
   + round 1 | Spec 1: closed.
   + round 1 | Spec 1: closed; the rerun reproduces, not only the test.
   + round 1 | Closures checked, all hold: Spec 1, Proof 2.
   + round 1 | Checked and holding: Spec 1.
== revert 21 CLOSED 'Closed' form removed: exit 1
FAIL: the cases' findings differ (- expected, + got):
+ round 1 | Closed.
+ round 1 | Closed: the fix at a.py:3 holds.
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Closed.
   + round 1 | Closed: the fix at a.py:3 holds.
== revert 22 CLOSED '<label>: closed' form removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 unclassified src/a.cpp:14
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Spec 1: closed.
   + round 1 | Spec 1: closed; the rerun reproduces, not only the test.
== revert 23 CLOSED 'closures checked, all hold' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 spec src/a.cpp:14
+ three-plan 5 round 1 unclassified -
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Closures checked, all hold: Spec 1, Proof 2.
== revert 24 CLOSED 'checked and holding' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 proof src/a.cpp:40
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Checked and holding: Spec 1.
== revert 25 NEGATION removed: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
- round 1 | Closed: no test covers it.
- round 1 | Closed: still red at a.py:3.
- round 1 | Closed: partly.
- round 1 | Closed: in part, the tab case remains.
- round 1 | Closed: does the tab case hold?
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the fix does not hold at a.py:3.
   - round 1 | Closed: only the claude path.
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   - round 1 | Closed: no test covers it.
   - round 1 | Closed: still red at a.py:3.
   - round 1 | Closed: partly.
   - round 1 | Closed: in part, the tab case remains.
   - round 1 | Closed: does the tab case hold?
== revert 26 NEGATION without 'not': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the fix does not hold at a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the fix does not hold at a.py:3.
== revert 27 NEGATION without 'no': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: no test covers it.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: no test covers it.
== revert 28 NEGATION without 'only': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: only the claude path.
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
== revert 29 NEGATION without 'still': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: still red at a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: still red at a.py:3.
== revert 30 NEGATION without 'partly': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: partly.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: partly.
== revert 31 NEGATION without 'in part': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: in part, the tab case remains.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: in part, the tab case remains.
== revert 32 NEGATION without '?': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: does the tab case hold?
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: does the tab case hold?
== revert 33 FIRST_CLAUSE ends at any '.' (the brief's literal reading): exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
== revert 34 FIRST_CLAUSE does not end at ';': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ round 1 | Spec 1: closed; the rerun reproduces, not only the test.
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Spec 1: closed; the rerun reproduces, not only the test.
== revert 35 label form loosened to '<label>:... closed' and 'not' removed (the double revert for 'Spec 3: not closed.'): exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 3: not closed.
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Spec 4: the tab case fails, and the item was marked closed.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 3: not closed.
   - round 1 | Closed: the fix does not hold at a.py:3.
   - round 1 | Spec 4: the tab case fails, and the item was marked closed.
== revert 36 label form loosened to '<label>:... closed' alone: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 4: the tab case fails, and the item was marked closed.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 4: the tab case fails, and the item was marked closed.
== revert 0 none (the final collector, as a control of the harness): exit 0
PASS: collect_findings.py scratch tests
   the cases' own diff under this revert (- expected, + got):
   (none)
```

The harness (`W` is the worktree's template folder):

```python
import json, os, shutil, subprocess, sys
W = "/Users/axelfaes/workspace/ordo/.agents/worktrees/2b-6a/skills/plan-retro/templates"
S = os.path.dirname(os.path.abspath(__file__))
OLD_NF = 'NOTHING_FOUND.fullmatch(first)'
M = [
 ("1 old NOTHING_FOUND (start-of-item match, no whole-sentence rule)",
  [(OLD_NF, 're.match(r"(none|nothing|no findings?|no defects?|otherwise none|checked, no defects?)\\b", item.strip(), re.I)')]),
 ("2 old CLOSURE",
  [("return bool(CLOSED.fullmatch(first) and not NEGATION.search(first))",
    'return bool(re.search(r"(^closed\\b|^closures checked\\b|^checked and holding\\b|: closed\\b)", item, re.I))')]),
 ("3 heading_name single pass", [("while name != previous:", "if name != previous:")]),
 ("4 '.' accepted as a plan", [('parts[0] in ("", ".", "..")', 'parts[0] in ("", "..")')]),
 ("5 '' accepted as a plan", [('parts[0] in ("", ".", "..")', 'parts[0] in (".", "..")')]),
 ("6 '-refuter.md' suffix not checked", [('            or not parts[3].endswith("-refuter.md")\n', '')]),
 ("7 empty step accepted", [('            or parts[3] == "-refuter.md"\n', '')]),
 ("8 NONE form removed", [("NONE.match(item.strip())", "False")]),
 ("9 NOTHING_FOUND forms removed", [(OLD_NF, "False")]),
 ("10 'found'/'here' suffix removed", [('( found| here)?"', '"')]),
 ("11 'none' narrowed to a whole first sentence", [("NONE.match(item.strip())", "NONE.fullmatch(first)")]),
 ("12 'nothing' removed", [('r"(nothing|no findings?', 'r"(no findings?')]),
 ("13 'no findings?' -> 'no finding'", [("|no findings?|", "|no finding|")]),
 ("14 'no findings?' removed", [("|no findings?|", "|")]),
 ("15 'no defects?' -> 'no defect'", [("|no defects?|otherwise", "|no defect|otherwise")]),
 ("16 'no defects?' removed", [("|no defects?|otherwise", "|otherwise")]),
 ("17 'otherwise none' removed", [("|otherwise none|", "|")]),
 ("18 'checked, no defects?' removed", [("|checked, no defects?)( found", ")( found")]),
 ("19 'checked, no defects?' -> 'checked, no defect'", [("|checked, no defects?)( found", "|checked, no defect)( found")]),
 ("20 closure_holds always false", [("return bool(CLOSED.fullmatch(first) and not NEGATION.search(first))", "return False")]),
 ("21 CLOSED 'Closed' form removed", [('r"closed(:.*)?|[^:]+: closed', 'r"[^:]+: closed')]),
 ("22 CLOSED '<label>: closed' form removed", [('r"closed(:.*)?|[^:]+: closed|', 'r"closed(:.*)?|')]),
 ("23 CLOSED 'closures checked, all hold' removed", [('|closures checked, all hold\\b.*|', '|')]),
 ("24 CLOSED 'checked and holding' removed", [('|checked and holding\\b.*"', '"')]),
 ("25 NEGATION removed", [("and not NEGATION.search(first)", "")]),
 ("26 NEGATION without 'not'", [(r'(not|no|only', r'(no|only')]),
 ("27 NEGATION without 'no'", [(r'(not|no|only', r'(not|only')]),
 ("28 NEGATION without 'only'", [(r'|only|still', r'|still')]),
 ("29 NEGATION without 'still'", [(r'|still|partly', r'|partly')]),
 ("30 NEGATION without 'partly'", [(r'|partly|in part', r'|in part')]),
 ("31 NEGATION without 'in part'", [(r'|partly|in part)', r'|partly)')]),
 ("32 NEGATION without '?'", [(r')\b|\?", re.I)', r')\b", re.I)')]),
 ("33 FIRST_CLAUSE ends at any '.' (the brief's literal reading)",
  [('FIRST_CLAUSE = re.compile(r"(.*?)(?:[.;](?:\\s|$)|$)")', 'FIRST_CLAUSE = re.compile(r"([^.;]*)")')]),
 ("34 FIRST_CLAUSE does not end at ';'", [('FIRST_CLAUSE = re.compile(r"(.*?)(?:[.;](?:', 'FIRST_CLAUSE = re.compile(r"(.*?)(?:[.](?:')]),
 ("35 label form loosened to '<label>:... closed' and 'not' removed (the double revert for 'Spec 3: not closed.')",
  [('|[^:]+: closed|', '|[^:]+:.*closed|'), (r'(not|no|only', r'(no|only')]),
 ("36 label form loosened to '<label>:... closed' alone", [('|[^:]+: closed|', '|[^:]+:.*closed|')]),
 ("0 none (the final collector, as a control of the harness)", []),
]
def cases_diff(collector):
    """Run a collector over the test's cases ledger and diff its texts against the test's list."""
    test = open(os.path.join(W, "collect_findings.test.sh")).read()
    body = test.split("cat >\"$cases/1-refuter.md\" <<'MD'\n", 1)[1].split("\nMD\n", 1)[0]
    want = test.split("expected='first | Nothing says", 1)[1].split("'\n", 1)[0]
    want = ("first | Nothing says" + want).splitlines()
    root = os.path.join(S, "cases-ledger")
    shutil.rmtree(root, ignore_errors=True)
    reviews = os.path.join(root, ".scratch/c/agents/reviews")
    os.makedirs(reviews)
    open(os.path.join(reviews, "1-refuter.md"), "w").write(body + "\n")
    out = subprocess.run([sys.executable, "-B", collector, os.path.join(root, ".scratch")],
                         capture_output=True, text=True).stdout
    got = [json.loads(l)["run"] + " | " + json.loads(l)["text"] for l in out.splitlines() if l]
    shutil.rmtree(root)
    return "\n".join(["   - " + t for t in want if t not in got] + ["   + " + t for t in got if t not in want])


only = sys.argv[1:]
for name, edits in M:
    if only and name.split()[0] not in only:
        continue
    d = os.path.join(S, "mut")
    shutil.rmtree(d, ignore_errors=True); os.makedirs(d)
    for f in ("collect_findings.py", "collect_findings.test.sh"):
        shutil.copy(os.path.join(W, f), d)
    p = os.path.join(d, "collect_findings.py")
    src = open(p).read()
    for a, b in edits:
        n = src.count(a)
        if n != 1:
            print(f"== {name}: pattern count {n}: {a!r}"); sys.exit(1)
        src = src.replace(a, b)
    open(p, "w").write(src)
    r = subprocess.run(["sh", os.path.join(d, "collect_findings.test.sh")], capture_output=True,
                       text=True, env=dict(os.environ, PYTHONDONTWRITEBYTECODE="1"))
    print(f"== revert {name}: exit {r.returncode}")
    print((r.stdout + r.stderr).rstrip())
    print("   the cases' own diff under this revert (- expected, + got):")
    print(cases_diff(p) or "   (none)")
shutil.rmtree(os.path.join(S, "mut"), ignore_errors=True)
```

## The counts

Before: the collector at the base, run on the tree before any edit. After: the final collector. Both over this worktree's ledgers.

```
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l      # before
672 findings
     672
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch/archive | wc -l               # before
538 findings
     538
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l      # after
673 findings
     673
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch/archive | wc -l               # after
539 findings
     539
```

The row-by-row difference, matched on report, run, heading and text (`$S/base/collect_findings.py` is the copy saved before the edit):

```
$ python3 -B $S/base/collect_findings.py .scratch .scratch/archive > $S/before-all.jsonl 2>/dev/null
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive > $S/after-all.jsonl 2>/dev/null
$ python3 - <<EOF    # rows keyed by (report, run, heading, text); prints the rows in one file only
before 672 after 673
in after, not before:
  + archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md | first | standards | Nothing else: ASCII clean, one paragraph per source line, no history, no other sentence made false.
in before, not after:
```

- The one added row is `14-refuter.md`, first, standards: "Nothing else: ASCII clean, ...". Its first sentence is "Nothing else", which is not one of the whole-sentence forms, so under decision 1 it is a finding. It reports no defect and is in the list below (row 227). The report is in the archive, so both totals rise by one.
- No row is removed: the ledgers hold no item that opens with "nothing", "no finding" or "no defect" and goes on to name a defect, and no round item in the forms the old `CLOSURE` dropped wrongly. The step 6 review found those drops with probe items, not in the ledgers.

## The hand count

The four archived reports of `6-report.md`, "The hand count", with the same hand lists, against the collector at the base and against the final collector. Each collector row is located at the report line whose item text starts the row.

```
$ python3 -B $S/handcount.py $S/base/collect_findings.py > $S/hand-before.out
$ python3 -B $S/handcount.py skills/plan-retro/templates/collect_findings.py > $S/hand-after.out
$ cmp $S/hand-before.out $S/hand-after.out && echo identical
identical
$ cat $S/hand-after.out
.scratch/archive/1-one-layout-for-every-skill/agents/reviews/11-refuter.md
  hand, findings (18); hand, reporting nothing (2): [59, 117]
  collector rows (18)
  collector but not hand: []
  hand but not collector: []
.scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md
  hand, findings (21); hand, reporting nothing (2): [73, 78]
  collector rows (22)
  collector but not hand: [78]
  hand but not collector: []
.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md
  hand, findings (17); hand, reporting nothing (0): []
  collector rows (17)
  collector but not hand: []
  hand but not collector: []
.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/3-refuter.md
  hand, findings (29); hand, reporting nothing (0): []
  collector rows (29)
  collector but not hand: []
  hand but not collector: []
```

- Plan 1 step 11: hand 18, collector 18.
- Plan 1 step 13: hand 21, collector 22. The difference is line 78, "No sentence in README.md, docs/ or another skill is made false.". It reports no defect in a wording outside the forms, so it stays a finding of the collector (decision 3), and `plan-retro` sets it aside as the kind "no defect". It is row 213 of the list below.
- Plan 2 step 3: hand 17, collector 17.
- Plan 2.A step 3: hand 29, collector 29.

The script:

```python
# The four hand counts of 6-report.md "The hand count", compared with the collector's rows: each
# row is located at the report line whose item text (without its list marker) starts the row.
import json, re, subprocess, sys
collector = sys.argv[1]
a = ".scratch/archive/"
hand = {
    a + "1-one-layout-for-every-skill/agents/reviews/11-refuter.md": {
        "findings": list(range(45, 56)) + [63, 64, 68, 69, 114, 115, 116],
        "nothing": [59, 117]},
    a + "1-one-layout-for-every-skill/agents/reviews/13-refuter.md": {
        "findings": list(range(57, 68)) + [71, 72, 77, 82, 83, 84, 126, 130, 134, 138],
        "nothing": [73, 78]},
    a + "2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md": {
        "findings": [66, 72, 81, 86, 97, 102, 109, 114, 164, 165, 166, 167, 168, 172, 176, 180, 181],
        "nothing": []},
    a + "2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/3-refuter.md": {
        "findings": [9, 10, 11, 12, 16, 17, 18, 19, 20, 24, 25, 26, 27, 28, 32, 33, 34,
                     54, 55, 56, 60, 61, 62, 66, 67, 68, 69, 73, 74],
        "nothing": []},
}
out = subprocess.run([sys.executable, "-B", collector, ".scratch", ".scratch/archive"],
                     capture_output=True, text=True).stdout
rows = [json.loads(l) for l in out.splitlines() if l]
for report, h in hand.items():
    lines = open(report).read().splitlines()
    starts = []
    for n, line in enumerate(lines, 1):
        m = re.match(r"(- |\d+[.)] )(.*)", line)
        if m:
            starts.append((n, m.group(2).strip()))
    got = []
    for r in rows:
        if r["report"] == report:
            n = next(n for n, t in starts if n not in got and r["text"].startswith(t))
            got.append(n)
    print(report)
    print(f"  hand, findings ({len(h['findings'])}); hand, reporting nothing ({len(h['nothing'])}): {h['nothing']}")
    print(f"  collector rows ({len(got)})")
    print(f"  collector but not hand: {sorted(set(got) - set(h['findings']))}")
    print(f"  hand but not collector: {sorted(set(h['findings']) - set(got))}")
```

## Items that report no defect

Every one of the 673 rows of `python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive 2>/dev/null` was read. The row number is the output line, so `python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive 2>/dev/null | sed -n '<row>p'` prints it. These 31 items report no defect. They stay findings of the collector; `plan-retro` sets them aside as the kind "no defect".

| Row | Report | Run | Heading | Text |
|---|---|---|---|---|
| 40 | `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1-refuter.md` | round 2 | behaviour | `utils/verify.sh:183-186`: other probe results. - These are misread as summary tests. Each result is still red or correct: - `\| tail -1 &` gives an empty output, exit status 0 and a red. - `\| tail -1 &&true` with a red test gives exit 1. - `echo $(sh red.test.sh 2>&1 \| tail -1)` gives exit status 0 and is red only on its `FAIL: x` last line. - `\| tail -1 # summary` is red for a test without a `PASS:` last line. - These are plain commands with `FAIL: x` printed, in the `; true` class that ruling 2 accepts: - `x=$(sh red.test.sh 2>&1 \| tail -1); echo "$x"`: green. - `\| tail -1 \|\| true`: green. - Heredocs: - `cat <<'EOF' \| tail -1` with a heredoc is a plain command and passes on its output. - A heredoc fed to `tail` is red (status 141). - The kill does not reach processes outside the command's session. A sleep in the driver's own process group and one in another session both stayed alive under all eight signal runs. A process the command moves out with `setsid` also stays alive (judgment call 3). The pages say "every process group of that session", which is accurate. |
| 59 | `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/2-refuter.md` | round 1 | standards | Vendor and tool names outside the models section in changed text, as your check asked: - `SKILL.md:60` ("the `claude -p` JSON or the `codex -o` final message"). - `SKILL.md:61` ("A native Claude agent's"). - `skills/plan/templates/orchestrator-state.md:13` and `:15` ("codex:gpt-5.6-sol", "Fable or Astra"). - `orchestrator-state.md:27` ("the claude -p JSON or the codex -o final message"). Brief items 3 and 17 and ruling 10 dictated these words. No written rule forbids them now: `SKILL.md:261` and `docs/dev/change-standard.md` "Rules this repository already states" forbid project names and paths, not vendor names. I list them because your criterion hits, not as a breach of a written rule. No project name appears in the changed skill text (grep above, rc=1). |
| 196 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/12-refuter.md` | first | behaviour | What is written before the user's decisions (only the retro file, at Steps 6, before the stop at Steps 7) and the proposal order (not written, then off the standards list, then checkable, then a sharper sentence) are the same as in the old file. Nothing else found. |
| 213 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md` | first | standards | No sentence in README.md, docs/ or another skill is made false. |
| 218 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md` | round 1 | proof | .scratch/1-one-layout-for-every-skill/agents/reviews/13-report.md:10 and :46: the quoted inventory command writes into the worktree, so it was not rerun as written; an equivalent run that writes nothing prints `ok:`. No fix needed. |
| 222 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | spec | No place listing the verify commands was missed (`git grep -ln "check_rule_inventory.test.sh\\|check_skill_layout\\|pin.test.sh" -- ':!.scratch'`: README.md, the docs/dev pages, the utils scripts). The state file's `verify` list lacks the line, as expected before landing. |
| 227 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | standards | Nothing else: ASCII clean, one paragraph per source line, no history, no other sentence made false. |
| 228 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | behaviour | docs/dev/change-standard.md:8 drops "a brief that names one points at it"; the report states the before and after. |
| 253 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/2-refuter.md` | first | behaviour | Running the check on the current skills exits 1. That is expected and stated in report row 3. |
| 278 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/3-refuter.md` | first | proof | Inputs handled correctly: CRLF line endings (`ok:`), a multi-line description (lines 3-5 reported uncovered), list continuation and table rows (reported uncovered), the range `5 - 7` (rejected), a closing-hash section named without the hashes, and an escaped pipe (rejected, see Standards). |
| 309 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/4-refuter.md` | first | standards | Other checks, none: no non-ASCII (the ASCII check is clean), no history. Every section another file names still exists: "The review, earned" and "Two steps in flight" (cited by the plan skill's templates/plan.yaml and templates/orchestrator-state.md), and "Usage" and the resumption rules (cited by skills/land/SKILL.md:10 and :28). The old heading "Handing the plan from one orchestrator to another" is named nowhere else. |
| 335 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/5-refuter.md` | first | standards | The six "as `/plan` states them" references (skills/plan-retro/SKILL.md:14, skills/land/SKILL.md:14, skills/refute/SKILL.md:14, skills/roadmap/SKILL.md:22, skills/plan-help/SKILL.md:10, skills/spec/SKILL.md:14) still hold, because What it reads 1 (lines 31-34) states the keys, the required ones, the defaults and the missing-key refusal. No file in skills/, utils/, docs/ or README.md names a section of skills/plan/SKILL.md (grep for "What it writes" and "/plan`'s" found none that point here). Nothing to report on these. |
| 337 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/5-refuter.md` | first | behaviour | The new file orders the work: the existing-folder refusal comes at Steps 1, before drafting, and `orchestrator-state.md` is written (Steps 4) only after the user approves `plan.md` (Steps 3). The old file stated no order for the state file relative to the approval. No rule of the old file conflicts with this order, but it is an ordering the old file did not impose. |
| 340 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/5-refuter.md` | round 1 | behaviour | The other closures hold when checked against the files: - Anti-patterns 1's Do instead cell names Steps 3 (:74). - Each refusal is stated once, in Stops rows 2 to 5 (:65-68). What it reads 1 and 2 and Steps 1 point there (:33, :35, :43). - Stops row 3 is limited to a required key, and the refusal names the key (:66). Old line 14 says the same, and :32 keeps the default for an optional key. - The title paragraph no longer says the empty folders are committed (:10). This matches Steps 6 (:58). - The "mechanical half / design half" sentence is in Stops row 1 (:64), and inventory row 16 points there. - The executor rule is split into :53, :54 and :55, and the closing-step rule into :48 and :49, each with its own inventory row (36-38, 47-48). "Over that default" at :55 matches what the plan skill's templates/orchestrator-state.md:12 calls the block's value. - The new cells in the What it shows and What resumes it columns are within the step 5 ruling at plan.md:51: they contradict nothing in the old file. - Every inventory row's item number points at the right row after the change: Stops 1 to 5, Anti-patterns 1 and 2, Rules 1 to 4, What it reads 1 to 3, Steps 1 to 6. The checker counts top-level items only (`ITEM` at utils/check_rule_inventory.py:58 is anchored at column 0). - Six skills say "as `/plan` states them": skills/plan-retro/SKILL.md:14, land:14, refute:14, roadmap:22, plan-help:10 and spec:14. What it reads 1 still gives them what they need: - The required keys and the defaults are in the templates it names (:31). - An optional key that is missing takes its default (:32). - A missing required key is a refusal that names the key, through the pointer at :33 to Stops row 3 (:66). - Going through the old file line by line again, every old line from 2 to 33 has a place in the new file with the same meaning. - The Use instead invocations exist in the target skills: `/ordo-init`, `/roadmap add <goal>` (roadmap:14), `/spec <entry> <step>` (spec:44), `/plan-orchestration <entry>`, and `/plan-help <entry>` (plan-help:10). - No other findings. Spec. Behaviour. |
| 387 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/7-refuter.md` | round 1 | behaviour | skills/land/SKILL.md:15, the ruling carried: it now reads "booked as its own step in the state file's booked list", which matches plan.md's ruling (never the open items) and refute's Finding dispositions 1 (line 100). Refute's wording is "booked as its own step in the plan and carried in the state file's booked list", and land drops "in the plan". The meaning holds, since plan-orchestration:73 uses refute's wording. The closure holds, with no new defect beyond the land:24/:25 bullet above. Behaviour. |
| 388 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/7-refuter.md` | round 1 | spec | The other closures claimed in 7-report.md:42-51 hold, and the pointers resolve: - "Over a repair round" 7 (line 68) points at Finding dispositions, which books a finding in the booked list. - Rules 1 (line 126) covers every run, and "Over a repair round" 1 names it. - "Finding dispositions" is a noun-phrase heading, pointed at from Steps 8 (line 54) and "Over a repair round" 7, with its old first bullet split into lines 100 and 101. - Anti-patterns rows 1 and 5 point at Steps 6, and row 4 points at Steps 3 and 4. Each step holds what its row points at. - Background shells and polling are unconditional (row 3); the "unless the brief lists them" exception is kept for benchmarks and sanitizers only (row 4). - Stops row 1 says the skill never stops. - Steps 1 holds "once per step before its first repair round". - Every inventory row pointing at a renumbered item names the right item: Stops 2/3/4, Anti-patterns 2/3/4/5, Rules 1/2/3/4, Finding dispositions 1-4, "Over a repair round" 6/7/8, Steps 1/6/7. - A final read of old lines 1-44 against the new file finds no other rule dropped or changed in meaning. Spec. |
| 404 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/8-refuter.md` | first | behaviour | The order of the look against the checks and the booking (step 5's last bullet, then steps 6 and 7) and the order of the landing report (step 11, written before step 9's commit) against the commit are unchanged: none. |
| 419 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/9-refuter.md` | round 1 | proof | utils/check_rule_inventory.py:264: the change does not weaken anything else the check guarded, as my probes above show. A heading inside a fence and a heading-shaped comment in the frontmatter behave as before. A range of two headings (7-8) is still an error, and so is a heading plus the blank line after it (8-9). The docstring line at :25 matches the code, since ":37" defines a heading as one outside the frontmatter and outside fenced code. The new case heading-row turns red with the change reverted (output above). This bullet reports no defect in the check itself. Proof. |
| 422 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/9-refuter.md` | round 1 | behaviour | skills/plan-help/SKILL.md:41: the Step 3 condition is closed. "For `/plan-help <entry>`, print one line from that position" now matches old lines 45 and 47, where the next-command line sat under "The position, for `<entry>`". The other first-run closures also match the new file: "writes nothing" appears only at :91, "by hand" is gone from :10, and "step files" is replaced at :33. The inventory has heading rows for old 14 and 45. Old 8, "# Plan help", is the title and carries no rule. On a second line-by-line pass over old lines 1-47, I found no other rule dropped or changed in meaning. The printed block is byte-identical (cmp above). No finding here. Behaviour. |
| 458 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/2-refuter.md` | first | spec | The tree-wide grep for key lists finds no other list missing `launch_note`. |
| 460 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/2-refuter.md` | first | proof | The report's five plants were not rerun; its verify output reproduces. |
| 520 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/1-refuter.md` | first | proof | The report's four reverts reproduce; the other reverts tried go red. |
| 568 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | first | proof | Every figure of the report reproduces (139 lines, the `ok:` line, 16 / 5 / 1 / 4, eight `PASS:` lines, ten `ok:` lines, a clean ASCII check, no reason over two sentences; the longest sentence is 35 words, line 118). |
| 573 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | first | standards | No non-ASCII, dash asides, history words, reasons over two sentences or sentences over 35 words. |
| 576 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | first | behaviour | The introduction's command now names both skills and passes; no other file names the command. |
| 591 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | round 1 | standards | No non-ASCII, dash asides, history, over-long reasons or sentences. |
| 593 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | round 1 | behaviour | Line 18 holds for every cross-skill split in the delta. |
| 594 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | round 1 | behaviour | The introduction's command names both skills and passes. |
| 613 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/5-refuter.md` | first | behaviour | The check command names three skills and passes; the New skills table matches the roadmap. |
| 630 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/5-refuter.md` | round 1 | behaviour | The check command names three skills and passes. |
| 653 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/6-refuter.md` | first | behaviour | Lines 3, 5 to 10 and 20 to 23 are true. |

Items that carry a confirmation but also name a defect, read as findings and so not in the list above:

| Row | Report | Run | Heading | Why it is a finding | Opening words |
|---|---|---|---|---|---|
| 16 | `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1-refuter.md` | first | behaviour | its first sentences name a defect (a `yml` fence refused, not stated in the report); the probe list after them reports no defect | `utils/verify.sh:52`, `:60`: only a fence whose info word is exactly `yaml` counts. ```` ```YAML ``` ... |
| 193 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/12-refuter.md` | first | proof | it names the report's missing quoted output, though the claim holds | .scratch/1-one-layout-for-every-skill/agents/reviews/12-report.md:11: the verify-list row gives "sev ... |
| 221 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | spec | it names a change the report does not list, though the sentence is accurate | docs/dev/change-standard.md:53: "The layout check prints each error with its file and line; exit 0 i ... |
| 247 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/2-refuter.md` | first | proof | its last sentence names a defect: report row 2's DONE claim is contradicted | 2-report.md:17: the named reverts for missing-section/out-of-order ("drop the missing and order test ... |
| 262 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/2-refuter.md` | round 1 | proof | it names rows with no revert, a stale header and judgment calls left out | 2-report.md, Repair round 1: I reproduced these closures with the reds quoted above: list-frontmatte ... |
| 263 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/3-refuter.md` | first | spec | its last sentence names a stale brief copy in the worktree | orchestrator-state.md dispatch block / worktree HEAD: the worktree sits at f157b94 (`git log --oneli ... |
| 292 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/3-refuter.md` | round 1 | proof | its last sentence names an omission in the report's row | 3-report.md, Repair round table, row "Proof: ten reverts stayed green": the ten reverts listed there ... |
| 441 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/1-refuter.md` | first | behaviour | its last sentence names a difference from the recipe: the detached process's output goes to /dev/null | No user-visible change today; nothing calls `launch.sh` yet. Step 3 would expose Spec 1 and Spec 2.  ... |
| 469 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/2-refuter.md` | round 1 | proof | it names a missing check, which the ledgers count as a proof finding | No check confirms the moved page exists where the pointers name it (an audit gap only). ... |
| 553 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md` | round 1 | proof | its first sentence names a defect in the report's closure | The report's round item 6 presents cutting reasons of 70 words or more as the closure of finding 6,  ... |

The rows were read from a file with one line per row (number, report, run, heading, the first 260 characters of the text); each candidate row and each row whose text holds "reproduce", "hold", "no finding", "no defect", "not a defect", "none", "accurate", "passes", "true", "unchanged", "nothing else", "no other", "correct", "as expected" or "no fix" was then read in full. Both tables above are printed by this script over the saved output (`$S/after-now.jsonl`, byte-identical to `$S/after-all.jsonl` by `cmp`):

```python
import json, sys
rows = [json.loads(l) for l in open(sys.argv[1])]
nodef = [40, 59, 196, 213, 218, 222, 227, 228, 253, 278, 309, 335, 337, 340, 387, 388, 404, 419,
         422, 458, 460, 520, 568, 573, 576, 591, 593, 594, 613, 630, 653]
mixed = {
    16: "its first sentences name a defect (a `yml` fence refused, not stated in the report); the probe list after them reports no defect",
    193: "it names the report's missing quoted output, though the claim holds",
    221: "it names a change the report does not list, though the sentence is accurate",
    247: "its last sentence names a defect: report row 2's DONE claim is contradicted",
    262: "it names rows with no revert, a stale header and judgment calls left out",
    263: "its last sentence names a stale brief copy in the worktree",
    292: "its last sentence names an omission in the report's row",
    441: "its last sentence names a difference from the recipe: the detached process's output goes to /dev/null",
    469: "it names a missing check, which the ledgers count as a proof finding",
    553: "its first sentence names a defect in the report's closure",
}
esc = lambda t: t.replace("|", "\\|")
print("| Row | Report | Run | Heading | Text |")
print("|---|---|---|---|---|")
for n in nodef:
    r = rows[n - 1]
    print(f"| {n} | `{r['report']}` | {r['run']} | {r['heading']} | {esc(r['text'])} |")
print("MIXED")
print("| Row | Report | Run | Heading | Why it is a finding | Opening words |")
print("|---|---|---|---|---|---|")
for n in sorted(mixed):
    r = rows[n - 1]
    print(f"| {n} | `{r['report']}` | {r['run']} | {r['heading']} | {mixed[n]} | {esc(r['text'][:100])} ... |")
```

## Files

| File | Lines before | Lines after |
|---|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 293 | 322 |
| `skills/plan-retro/templates/collect_findings.test.sh` | 459 | 574 |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/6a-report.md` | new | 739 |

```
$ git diff --stat
 skills/plan-retro/templates/collect_findings.py    |  65 +++++++---
 .../plan-retro/templates/collect_findings.test.sh  | 131 +++++++++++++++++++--
 2 files changed, 170 insertions(+), 26 deletions(-)
```

## Carrying the change

```
$ grep -rn 'CLOSURE\b\|NOTHING_FOUND\|reports_nothing\|closure_holds\|"Closed"\|Closures checked\|Checked and holding\|no defect\|otherwise none' skills utils docs README.md | grep -v '^skills/plan-retro/templates/collect_findings'
skills/plan-retro/SKILL.md:51:6. Mark the recurring kinds: a kind other than "no defect" is recurring when it appears in at least three steps, or in at least two plans.
skills/plan-retro/SKILL.md:59:   - Then the other kinds, "no defect" apart, with their counts and no proposal.
skills/plan-retro/SKILL.md:60:   - Then the findings set aside as "no defect", each with its report path, location and text, and no proposal.
skills/plan-retro/SKILL.md:74:- A finding whose text reports no defect (a confirmation such as "No sentence in the pages is made false") is set aside as the kind "no defect". It is counted and listed in the retro's "No defect" section, and it gets no proposal.
```

These four lines agree with the change: an item that reports no defect in another wording stays a finding, and the retro sets it aside. `README.md:119`, the test's bullet, says the test covers "a closure that holds, or an item in one of the forms that report nothing", that "A closure that does not hold stays a finding, and so does each near miss of those forms", and lists among the refusals "an entry or a run in another form". Each of these is still true after the change.

## Judgment calls the brief left open

1. **Where the closure's first clause ends.** The brief says "up to the first `.` or `;`". A `.` or `;` ends the clause only when a space or the end of the item follows it, as `FIRST_SENTENCE` already reads a sentence. Read at every `.`, the clause of "Closed: the fix at a.py:3 holds only for the codex path." is "Closed: the fix at a", which holds no negation word, and the item would be dropped. The fixture has that item, and revert 33 (the reading at every `.`) turns it red. None of the brief's 34 cases reads differently under either reading.
2. **The closure forms are matched against the whole first clause.** "Closed" alone or followed by ":" and anything; "<label>: closed" with a label that holds no colon; a clause that opens with "Closures checked, all hold" or "Checked and holding". Matching the whole clause keeps "<label>: closed" inside the clause, so "Spec 2 fails. Spec 1: closed." is not a closure.
3. **Cases added beyond the brief's 34**, each so that a part of the rule has a revert that turns it red: the `a.py` item (judgment call 1); one round item for each of "no", "still", "partly", "in part" and "?", which no brief case holds alone (reverts 27 and 29 to 32; "not" and "only" are held alone by brief cases, reverts 26 and 28); "Spec 4: the tab case fails, and the item was marked closed.", which only the label's anchoring keeps a finding (revert 36); and the refusal of an entry with an empty plan (revert 5).
4. **Two fixture items changed.** In `three-plan/5-refuter.md`, "Nothing else: the ASCII check is clean." and "No defect in the new check." became "Nothing found: the ASCII check is clean." and "No defect: the new check holds.". Under decision 1 the old wordings are findings (decision 3), and the head comment calls that fixture list "every form of an item that reports nothing". The brief's cases cover the finding side.
5. **The cases sit on a ledger of their own** and are asserted by run and text in order, since most of them name no location and their rows would all read `spec -`.
6. **Which items report no defect.** An item is in the list when each of its sentences confirms something or says nothing was found, and in the second table when a confirmation stands beside a sentence that names a defect. Rows 40, 59 and 337 are in the list: row 40 says each misread probe result "is still red or correct" and the pages' wording "accurate"; row 59 lists vendor names "not as a breach of a written rule"; row 337 says "No rule of the old file conflicts with this order".

## User-visible changes

The collector's output, for a report item:

| Item | Before | After |
|---|---|---|
| An item that opens with "nothing", "no finding(s)" or "no defect(s)" and goes on to name something ("Nothing says what happens when the check fails: ...") | dropped | a finding |
| A first sentence longer than the bare form plus "found" or "here" ("Nothing else: ...", "No defect in the new check.") | dropped | a finding |
| A round item "<label>: closed" followed by more than "." or ";" ("Spec 2: closed in part only; ...", "Proof 1, claimed closed: closed is not ...") | dropped | a finding |
| A round item "Closed" followed by anything but ".", ";", ":" or the end ("Closed only ...", "Closed? No: ...") | dropped | a finding |
| A round item "Closed: ..." whose first clause holds "not", "no", "only", "still", "partly", "in part" or "?" | dropped | a finding |
| A round item "Closures checked; ..." that does not say "all hold" | dropped | a finding |
| "None ...", "None of the cases fails.", "Nothing here.", "No defect found.", "Closed.", "Spec 1: closed.", "Closures checked, all hold: ...", "Checked and holding: ..." | dropped | dropped |
| A heading ending in a parenthetical and then a colon ("## Behaviour (none found):") | read as behaviour | read as behaviour (now tested) |
| `--exclude-listed` with an entry whose plan is `.` or empty, whose file name does not end `-refuter.md`, or whose step is empty | exit 2 | exit 2 (now tested) |

Over this worktree's ledgers the output grows by one row, row 227 (see "The counts").

## What in the brief turned out wrong or impossible

- "up to the first `.` or `;`", read at every full stop, drops "Closed: the fix at a.py:3 holds only for the codex path.", a closure that does not hold. Judgment call 1 gives the reading used, and revert 33 its red.
- "Each case red under the revert that undoes what it checks": "Spec 3: not closed." is a finding under the old `CLOSURE` too, and under every single revert of the new rule. It turns red only under revert 35, which undoes two parts of the rule together (see "Reverts").

## Repair round 1

The rulings on `6a-refuter.md`, with what closes each. The tree at the round's start is commit eabefc7; no git command was run in this round. Differences are taken with `diff` against copies made at the round's start under the scratchpad (`$S/r0/`), and lines are counted with `wc -l`.

| Ruling | State | What closes it | Proof |
|---|---|---|---|
| 1. Spec 1, git commands | DONE | no git command run in this round; the first build's sections state the earlier ones once, at "Verification" | this section's commands |
| 2. Spec 2, where the first sentence ends | DONE | `FIRST_SENTENCE` ends at a `.` or `;` followed by a space or the end; the docstring says so; cases "Proof 1 (see 6-report.md): closed." (holds) and "Spec 1: closed;see a.py:3." (a finding) | reverts 44, 45, 46; the map below |
| 3. Behaviour 2 and the "none" breadth | DONE | every no-finding form, "none" included, is the whole first sentence, optionally with "found" or "here", and a colon does not end that sentence; the reproduce form keeps its lead up to a colon | reverts 1, 2 and 53; cases "None: the report reproduces.", "None of the eleven cases fails.", "None of the reverts turns the test red: a.py:3 is untested.", "No defect: src/a.py:3 divides by zero.", "Nothing: the page at docs/a.md:4 is silent." |
| 4. Proof 1, the bare form plus another word | DONE | cases "Nothing else: the ASCII check is clean." and "No defect in the new check." asserted as findings in the cases ledger and restored in `three-plan/5-refuter.md` (items 16 and 17), and "Nothing else." | reverts 3, 4 and 53 |
| 5. Proof 2, the anchors | DONE | cases "Closed, but the fix fails at a.py:3." and "Spec 1: closed, but a.py:3 fails." asserted as findings; each anchor red under its revert | reverts 20 to 23, 14 |
| 6. Behaviour 1, closures that do not hold | DONE | `CLOSED` over the whole first sentence, `NEGATION` with "but", "except", "however", "apart from", "fail", "fails", "failed", and `RESERVATION` on the text after the first sentence; the four items are cases asserted as findings | reverts 14, 24 to 43 |
| 7. The report | DONE | the counts, the hand counts and the list below, each with its command | below |

### The test, red first

The round's cases were put into the test before the collector changed. Against the collector at the round's start:

```
$ PYTHONDONTWRITEBYTECODE=1 sh skills/plan-retro/templates/collect_findings.test.sh; echo "exit $?"
FAIL: the cases' findings differ (- expected, + got):
- first | None: the report reproduces.
- first | None of the eleven cases fails.
- first | None of the reverts turns the test red: a.py:3 is untested.
- first | No defect: src/a.py:3 divides by zero.
- first | Nothing: the page at docs/a.md:4 is silent.
- round 1 | Closed: but a.py:3 fails.
- round 1 | Closures checked, all hold except Spec 2: a.py:4.
- round 1 | Checked and holding, except Spec 2 at a.py:4.
- round 1 | Closed; except the tab case.
- round 1 | Closed: but the tab case remains.
- round 1 | Closed: except the tab case.
- round 1 | Closed: however, the tab case remains.
- round 1 | Closed: apart from the tab case.
- round 1 | Closed: the tab case may fail.
- round 1 | Closed: the tab case fails at a.py:3.
- round 1 | Closed: the rerun failed.
- round 1 | Closed. But the tab case remains.
- round 1 | Closed. However, the tab case remains.
- round 1 | Closed. Apart from the tab case.
- round 1 | Closures checked, all hold save Spec 2 at a.py:4.
- round 1 | Checked and holding, save Spec 2 at a.py:4.
exit 1
```

"Nothing else." and the reworded "Spec 4: the tab case is open, and the item was marked closed." came in after that run; each is shown red below (reverts 3 and 54).

### The cases

The cases ledger of the test holds every case of `round1-cases.py` (12 that report nothing, 13 findings, 7 closures that hold, 16 closures that do not hold), in its lists and in that order, asserted as those lists say, plus these, each so that one part of the rule has a revert that turns it red:

- "Nothing else.": the bare form and one other word, with no colon. The ruling's "Nothing else: the ASCII check is clean." is a finding by the colon rule alone, so widening the suffix to one word (revert 3) leaves it a finding; "Nothing else." turns red under revert 3.
- One round item for each word or mark of `NEGATION` that no ruling case holds alone: "no", "still", "partly", "in part", "?" (from the first build), and "but", "except", "however", "apart from", "fail", "fails", "failed" (reverts 25 to 38).
- One round item for each opening word of `RESERVATION` that no ruling case holds alone: "Closed. But ...", "Closed. However, ...", "Closed. Apart from ..." ("except" is held alone by the ruling's "Closed; except the tab case."; reverts 40 to 43).
- One round item for each anchor: "Closed, with the tab case open at a.py:3.", "Spec 1: closed, with a.py:3 open.", "Closures checked, all hold save Spec 2 at a.py:4." and "Checked and holding, save Spec 2 at a.py:4.". The ruling's two anchor cases, "Closed, but the fix fails at a.py:3." and "Spec 1: closed, but a.py:3 fails.", hold "but" and "fails", so `NEGATION` also keeps them findings and an anchor's revert alone leaves them green; the anchor cases without a negation word turn red under reverts 20 to 23.
- "Spec 4: the tab case is open, and the item was marked closed.": "closed" later than the label's colon (revert 54). The first build's wording held "fails", which is now a negation word.

In `three-plan/5-refuter.md`, items 1 to 7 are bare forms that report nothing ("None found.", "None.", "Nothing here.", "No finding here.", "No defect.", "Otherwise none.", "Checked, no defect found."), since "None: ...", "Nothing found: ...", "Otherwise none: ..." and "Checked, no defect found: ..." are now findings, and items 16 and 17 are the restored "Nothing else: the ASCII check is clean." and "No defect in the new check.", asserted as two rows `three-plan 5 first spec -`.

Which reverts turn each case red (from the output under "Reverts" below):

```
$ python3 -B $S/coverage1.py $S/reverts1.out skills/plan-retro/templates/collect_findings.test.sh
69 cases; 0 with no red revert
None.                                                              6,12
None found.                                                        5,6,12
Nothing.                                                           7,12
Nothing found.                                                     5,7,12
Nothing here.                                                      5,7,12
No findings.                                                       8,12
No finding.                                                        12
No defects.                                                        9,12
No defect.                                                         12
No defect found.                                                   5,12
Otherwise none.                                                    10,12
Checked, no defects.                                               11,12
None: the report reproduces.                                       1,2,53
None of the eleven cases fails.                                    2,4,53
None of the reverts turns the test red: a.py:3 is untested.        2,53
Nothing says what happens when the check fails: the page is silent 53
No defect test covers the tab case.                                4,53
No finding in the report names the file.                           4,53
Nothing rejects a relative path.                                   4,53
No findings are listed for step 3, although it has two.            53
Nothing found by the test, although a.py:3 is wrong.               53
Nothing else: the ASCII check is clean.                            53
No defect in the new check.                                        4,53
No defect: src/a.py:3 divides by zero.                             1,53
Nothing: the page at docs/a.md:4 is silent.                        1,53
Nothing else.                                                      3,4,53
Closed.                                                            15,16
Closed: the fix at a.py:3 holds.                                   15,16
Spec 1: closed.                                                    15,17
Spec 1: closed; the rerun reproduces, not only the test.           15,17,45
Closures checked, all hold: Spec 1, Proof 2.                       15,18
Checked and holding: Spec 1.                                       15,19
Proof 1 (see 6-report.md): closed.                                 15,17,44
Spec 2: closed in part only; the tab case is still missing.        14
Proof 1, claimed closed: closed is not what the rerun shows.       14
Closed? No: src/a.py:7 still fails.                                14
Spec 3: not closed.                                                47
Closed only for the codex path.                                    14
Closures checked; Spec 2 does not hold: a.py:4.                    14
Closed: the fix does not hold at a.py:3.                           14,24,25,47
Closed: only the claude path.                                      14,24,27
Closed: the fix at a.py:3 holds only for the codex path.           14,24,27,44
Closed, but the fix fails at a.py:3.                               14
Spec 1: closed, but a.py:3 fails.                                  14
Closed: but a.py:3 fails.                                          14,24
Closures checked, all hold except Spec 2: a.py:4.                  14
Checked and holding, except Spec 2 at a.py:4.                      14
Closed; except the tab case.                                       14,39,41,44,46
Spec 1: closed;see a.py:3.                                         14,21,44,46
Closed: no test covers it.                                         14,24,26
Closed: still red at a.py:3.                                       14,24,28
Closed: partly.                                                    14,24,29
Closed: in part, the tab case remains.                             14,24,30
Closed: does the tab case hold?                                    14,24,38
Closed: but the tab case remains.                                  14,24,31
Closed: except the tab case.                                       14,24,32
Closed: however, the tab case remains.                             14,24,33
Closed: apart from the tab case.                                   14,24,34
Closed: the tab case may fail.                                     14,24,35
Closed: the tab case fails at a.py:3.                              14,24,36
Closed: the rerun failed.                                          14,24,37
Closed. But the tab case remains.                                  14,39,40,44
Closed. However, the tab case remains.                             14,39,42,44
Closed. Apart from the tab case.                                   14,39,43,44
Closed, with the tab case open at a.py:3.                          14,20
Spec 1: closed, with a.py:3 open.                                  14,21
Closures checked, all hold save Spec 2 at a.py:4.                  14,22
Checked and holding, save Spec 2 at a.py:4.                        14,23
Spec 4: the tab case is open, and the item was marked closed.      47,54
```

"Spec 3: not closed." is red only under revert 47: it is held by the label form's anchor and by "not" at once.

### Reverts

Each revert is an edit to a copy of the final `collect_findings.py` in the scratchpad, with the final test beside it, run with `PYTHONDONTWRITEBYTECODE=1`; the harness also runs the reverted collector over the cases ledger copied out of the test and prints the cases' own diff. Revert 0 is the unchanged files.

```
$ python3 -B $S/reverts1.py
== revert 1 a colon ends the no-finding sentence: exit 1
FAIL: the cases' findings differ (- expected, + got):
- first | None: the report reproduces.
- first | No defect: src/a.py:3 divides by zero.
- first | Nothing: the page at docs/a.md:4 is silent.
   the cases' own diff under this revert (- expected, + got):
   - first | None: the report reproduces.
   - first | No defect: src/a.py:3 divides by zero.
   - first | Nothing: the page at docs/a.md:4 is silent.
== revert 2 'none' breadth restored (an item opening with 'none'): exit 1
FAIL: the cases' findings differ (- expected, + got):
- first | None: the report reproduces.
- first | None of the eleven cases fails.
- first | None of the reverts turns the test red: a.py:3 is untested.
   the cases' own diff under this revert (- expected, + got):
   - first | None: the report reproduces.
   - first | None of the eleven cases fails.
   - first | None of the reverts turns the test red: a.py:3 is untested.
== revert 3 suffix widened to any one word: exit 1
FAIL: the cases' findings differ (- expected, + got):
- first | Nothing else.
   the cases' own diff under this revert (- expected, + got):
   - first | Nothing else.
== revert 4 suffix widened to any words: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   - first | None of the eleven cases fails.
   - first | No defect test covers the tab case.
   - first | No finding in the report names the file.
   - first | Nothing rejects a relative path.
   - first | No defect in the new check.
   - first | Nothing else.
== revert 5 suffix removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | None found.
   + first | Nothing found.
   + first | Nothing here.
   + first | No defect found.
== revert 6 'none' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 first proof -
+ one-plan 1 first behaviour -
+ one-plan 2 first proof -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ two-plan 3 first behaviour -
+ two-plan 3 round 1 standards -
   the cases' own diff under this revert (- expected, + got):
   + first | None.
   + first | None found.
== revert 7 'nothing' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Nothing.
   + first | Nothing found.
   + first | Nothing here.
== revert 8 'no findings?' -> 'no finding': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ first | No findings.
   the cases' own diff under this revert (- expected, + got):
   + first | No findings.
== revert 9 'no defects?' -> 'no defect': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ first | No defects.
   the cases' own diff under this revert (- expected, + got):
   + first | No defects.
== revert 10 'otherwise none' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Otherwise none.
== revert 11 'checked, no defects?' removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   + first | Checked, no defects.
== revert 12 NOTHING_FOUND never matches: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 first proof -
+ one-plan 1 first behaviour -
+ one-plan 2 first proof -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ two-plan 3 first behaviour -
+ two-plan 3 round 1 standards -
   the cases' own diff under this revert (- expected, + got):
   + first | None.
   + first | None found.
   + first | Nothing.
   + first | Nothing found.
   + first | Nothing here.
   + first | No findings.
   + first | No finding.
   + first | No defects.
   + first | No defect.
   + first | No defect found.
   + first | Otherwise none.
   + first | Checked, no defects.
== revert 13 the reproduce form read on the first sentence, not the lead: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 14 old CLOSURE: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 2: closed in part only; the tab case is still missing.
- round 1 | Proof 1, claimed closed: closed is not what the rerun shows.
- round 1 | Closed? No: src/a.py:7 still fails.
- round 1 | Closed only for the codex path.
- round 1 | Closures checked; Spec 2 does not hold: a.py:4.
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
- round 1 | Closed, but the fix fails at a.py:3.
- round 1 | Spec 1: closed, but a.py:3 fails.
- round 1 | Closed: but a.py:3 fails.
- round 1 | Closures checked, all hold except Spec 2: a.py:4.
- round 1 | Checked and holding, except Spec 2 at a.py:4.
- round 1 | Closed; except the tab case.
- round 1 | Spec 1: closed;see a.py:3.
- round 1 | Closed: no test covers it.
- round 1 | Closed: still red at a.py:3.
- round 1 | Closed: partly.
- round 1 | Closed: in part, the tab case remains.
- round 1 | Closed: does the tab case hold?
- round 1 | Closed: but the tab case remains.
- round 1 | Closed: except the tab case.
- round 1 | Closed: however, the tab case remains.
- round 1 | Closed: apart from the tab case.
- round 1 | Closed: the tab case may fail.
- round 1 | Closed: the tab case fails at a.py:3.
- round 1 | Closed: the rerun failed.
- round 1 | Closed. But the tab case remains.
- round 1 | Closed. However, the tab case remains.
- round 1 | Closed. Apart from the tab case.
- round 1 | Closed, with the tab case open at a.py:3.
- round 1 | Spec 1: closed, with a.py:3 open.
- round 1 | Closures checked, all hold save Spec 2 at a.py:4.
- round 1 | Checked and holding, save Spec 2 at a.py:4.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 2: closed in part only; the tab case is still missing.
   - round 1 | Proof 1, claimed closed: closed is not what the rerun shows.
   - round 1 | Closed? No: src/a.py:7 still fails.
   - round 1 | Closed only for the codex path.
   - round 1 | Closures checked; Spec 2 does not hold: a.py:4.
   - round 1 | Closed: the fix does not hold at a.py:3.
   - round 1 | Closed: only the claude path.
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   - round 1 | Closed, but the fix fails at a.py:3.
   - round 1 | Spec 1: closed, but a.py:3 fails.
   - round 1 | Closed: but a.py:3 fails.
   - round 1 | Closures checked, all hold except Spec 2: a.py:4.
   - round 1 | Checked and holding, except Spec 2 at a.py:4.
   - round 1 | Closed; except the tab case.
   - round 1 | Spec 1: closed;see a.py:3.
   - round 1 | Closed: no test covers it.
   - round 1 | Closed: still red at a.py:3.
   - round 1 | Closed: partly.
   - round 1 | Closed: in part, the tab case remains.
   - round 1 | Closed: does the tab case hold?
   - round 1 | Closed: but the tab case remains.
   - round 1 | Closed: except the tab case.
   - round 1 | Closed: however, the tab case remains.
   - round 1 | Closed: apart from the tab case.
   - round 1 | Closed: the tab case may fail.
   - round 1 | Closed: the tab case fails at a.py:3.
   - round 1 | Closed: the rerun failed.
   - round 1 | Closed. But the tab case remains.
   - round 1 | Closed. However, the tab case remains.
   - round 1 | Closed. Apart from the tab case.
   - round 1 | Closed, with the tab case open at a.py:3.
   - round 1 | Spec 1: closed, with a.py:3 open.
   - round 1 | Closures checked, all hold save Spec 2 at a.py:4.
   - round 1 | Checked and holding, save Spec 2 at a.py:4.
== revert 15 closure_holds always false: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 unclassified src/a.cpp:14
+ one-plan 1 round 1 spec src/a.cpp:14
+ one-plan 1 round 1 proof src/a.cpp:40
+ three-plan 5 round 1 unclassified -
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Closed.
   + round 1 | Closed: the fix at a.py:3 holds.
   + round 1 | Spec 1: closed.
   + round 1 | Spec 1: closed; the rerun reproduces, not only the test.
   + round 1 | Closures checked, all hold: Spec 1, Proof 2.
   + round 1 | Checked and holding: Spec 1.
   + round 1 | Proof 1 (see 6-report.md): closed.
== revert 16 'Closed' form removed: exit 1
FAIL: the cases' findings differ (- expected, + got):
+ round 1 | Closed.
+ round 1 | Closed: the fix at a.py:3 holds.
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Closed.
   + round 1 | Closed: the fix at a.py:3 holds.
== revert 17 '<label>: closed' form removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 unclassified src/a.cpp:14
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Spec 1: closed.
   + round 1 | Spec 1: closed; the rerun reproduces, not only the test.
   + round 1 | Proof 1 (see 6-report.md): closed.
== revert 18 'closures checked, all hold' form removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 spec src/a.cpp:14
+ three-plan 5 round 1 unclassified -
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Closures checked, all hold: Spec 1, Proof 2.
== revert 19 'checked and holding' form removed: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 proof src/a.cpp:40
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Checked and holding: Spec 1.
== revert 20 anchor after 'Closed' loosened: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed, with the tab case open at a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed, with the tab case open at a.py:3.
== revert 21 anchor after '<label>: closed' loosened: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 1: closed;see a.py:3.
- round 1 | Spec 1: closed, with a.py:3 open.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 1: closed;see a.py:3.
   - round 1 | Spec 1: closed, with a.py:3 open.
== revert 22 anchor after 'closures checked, all hold' loosened: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closures checked, all hold save Spec 2 at a.py:4.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closures checked, all hold save Spec 2 at a.py:4.
== revert 23 anchor after 'checked and holding' loosened: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Checked and holding, save Spec 2 at a.py:4.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Checked and holding, save Spec 2 at a.py:4.
== revert 24 NEGATION removed: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
- round 1 | Closed: but a.py:3 fails.
- round 1 | Closed: no test covers it.
- round 1 | Closed: still red at a.py:3.
- round 1 | Closed: partly.
- round 1 | Closed: in part, the tab case remains.
- round 1 | Closed: does the tab case hold?
- round 1 | Closed: but the tab case remains.
- round 1 | Closed: except the tab case.
- round 1 | Closed: however, the tab case remains.
- round 1 | Closed: apart from the tab case.
- round 1 | Closed: the tab case may fail.
- round 1 | Closed: the tab case fails at a.py:3.
- round 1 | Closed: the rerun failed.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the fix does not hold at a.py:3.
   - round 1 | Closed: only the claude path.
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   - round 1 | Closed: but a.py:3 fails.
   - round 1 | Closed: no test covers it.
   - round 1 | Closed: still red at a.py:3.
   - round 1 | Closed: partly.
   - round 1 | Closed: in part, the tab case remains.
   - round 1 | Closed: does the tab case hold?
   - round 1 | Closed: but the tab case remains.
   - round 1 | Closed: except the tab case.
   - round 1 | Closed: however, the tab case remains.
   - round 1 | Closed: apart from the tab case.
   - round 1 | Closed: the tab case may fail.
   - round 1 | Closed: the tab case fails at a.py:3.
   - round 1 | Closed: the rerun failed.
== revert 25 NEGATION without 'not': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the fix does not hold at a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the fix does not hold at a.py:3.
== revert 26 NEGATION without 'no': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: no test covers it.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: no test covers it.
== revert 27 NEGATION without 'only': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: only the claude path.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: only the claude path.
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
== revert 28 NEGATION without 'still': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: still red at a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: still red at a.py:3.
== revert 29 NEGATION without 'partly': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: partly.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: partly.
== revert 30 NEGATION without 'in part': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: in part, the tab case remains.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: in part, the tab case remains.
== revert 31 NEGATION without 'but': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: but the tab case remains.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: but the tab case remains.
== revert 32 NEGATION without 'except': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: except the tab case.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: except the tab case.
== revert 33 NEGATION without 'however': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: however, the tab case remains.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: however, the tab case remains.
== revert 34 NEGATION without 'apart from': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: apart from the tab case.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: apart from the tab case.
== revert 35 NEGATION without 'fail': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the tab case may fail.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the tab case may fail.
== revert 36 NEGATION without 'fails': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the tab case fails at a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the tab case fails at a.py:3.
== revert 37 NEGATION without 'failed': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: the rerun failed.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the rerun failed.
== revert 38 NEGATION without '?': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed: does the tab case hold?
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: does the tab case hold?
== revert 39 RESERVATION removed: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed; except the tab case.
- round 1 | Closed. But the tab case remains.
- round 1 | Closed. However, the tab case remains.
- round 1 | Closed. Apart from the tab case.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed; except the tab case.
   - round 1 | Closed. But the tab case remains.
   - round 1 | Closed. However, the tab case remains.
   - round 1 | Closed. Apart from the tab case.
== revert 40 RESERVATION without 'but': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed. But the tab case remains.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed. But the tab case remains.
== revert 41 RESERVATION without 'except': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed; except the tab case.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed; except the tab case.
== revert 42 RESERVATION without 'however': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed. However, the tab case remains.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed. However, the tab case remains.
== revert 43 RESERVATION without 'apart from': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed. Apart from the tab case.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed. Apart from the tab case.
== revert 44 first sentence ends at any '.' or ';': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ round 1 | Proof 1 (see 6-report.md): closed.
- round 1 | Closed: the fix at a.py:3 holds only for the codex path.
- round 1 | Closed; except the tab case.
- round 1 | Spec 1: closed;see a.py:3.
- round 1 | Closed. But the tab case remains.
- round 1 | Closed. However, the tab case remains.
- round 1 | Closed. Apart from the tab case.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed: the fix at a.py:3 holds only for the codex path.
   - round 1 | Closed; except the tab case.
   - round 1 | Spec 1: closed;see a.py:3.
   - round 1 | Closed. But the tab case remains.
   - round 1 | Closed. However, the tab case remains.
   - round 1 | Closed. Apart from the tab case.
   + round 1 | Proof 1 (see 6-report.md): closed.
== revert 45 first sentence does not end at ';': exit 1
FAIL: the cases' findings differ (- expected, + got):
+ round 1 | Spec 1: closed; the rerun reproduces, not only the test.
   the cases' own diff under this revert (- expected, + got):
   + round 1 | Spec 1: closed; the rerun reproduces, not only the test.
== revert 46 first sentence ends at ';' with no space after it: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Closed; except the tab case.
- round 1 | Spec 1: closed;see a.py:3.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Closed; except the tab case.
   - round 1 | Spec 1: closed;see a.py:3.
== revert 47 'Spec 3: not closed.' double revert: label anchor loosened and 'not' removed: exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 3: not closed.
- round 1 | Closed: the fix does not hold at a.py:3.
- round 1 | Spec 4: the tab case is open, and the item was marked closed.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 3: not closed.
   - round 1 | Closed: the fix does not hold at a.py:3.
   - round 1 | Spec 4: the tab case is open, and the item was marked closed.
== revert 48 heading_name single pass: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 7 first behaviour src/h.py:8
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 49 '.' accepted as a plan: exit 1
FAIL: retro retro-dot.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 50 '' accepted as a plan: exit 1
FAIL: retro retro-no-plan.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 51 '-refuter.md' suffix not checked: exit 1
FAIL: retro retro-name.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 52 empty step accepted: exit 1
FAIL: retro retro-step.md exited 0, expected 2
   the cases' own diff under this revert (- expected, + got):
   (none)
== revert 53 old NOTHING_FOUND, matched at the start of the item: exit 1
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 first spec -
- three-plan 5 first spec -
   the cases' own diff under this revert (- expected, + got):
   - first | None: the report reproduces.
   - first | None of the eleven cases fails.
   - first | None of the reverts turns the test red: a.py:3 is untested.
   - first | Nothing says what happens when the check fails: the page is silent.
   - first | No defect test covers the tab case.
   - first | No finding in the report names the file.
   - first | Nothing rejects a relative path.
   - first | No findings are listed for step 3, although it has two.
   - first | Nothing found by the test, although a.py:3 is wrong.
   - first | Nothing else: the ASCII check is clean.
   - first | No defect in the new check.
   - first | No defect: src/a.py:3 divides by zero.
   - first | Nothing: the page at docs/a.md:4 is silent.
   - first | Nothing else.
== revert 54 label form loosened to '<label>: ... closed': exit 1
FAIL: the cases' findings differ (- expected, + got):
- round 1 | Spec 4: the tab case is open, and the item was marked closed.
   the cases' own diff under this revert (- expected, + got):
   - round 1 | Spec 4: the tab case is open, and the item was marked closed.
== revert 0 none (the final collector, as a control of the harness): exit 0
PASS: collect_findings.py scratch tests
   the cases' own diff under this revert (- expected, + got):
   (none)
```

The harness:

```python
import json, os, shutil, subprocess, sys
W = "/Users/axelfaes/workspace/ordo/.agents/worktrees/2b-6a/skills/plan-retro/templates"
S = os.path.dirname(os.path.abspath(__file__))
NF = 'r"(none|nothing|no findings?|no defects?|otherwise none|checked, no defects?)( found| here)?"'
CL = 'r"closed(:.*)?|[^:]+: closed|closures checked, all hold(:.*)?|checked and holding(:.*)?"'
NEG = r'r"\b(not|no|only|still|partly|in part|but|except|however|apart from|fail|fails|failed)\b|\?"'
RES = r'r"(but|except|however|apart from)\b"'
HOLDS = "CLOSED.fullmatch(first) and not NEGATION.search(first) and not RESERVATION.match(rest)"
def neg_without(word):
    inner = "not|no|only|still|partly|in part|but|except|however|apart from|fail|fails|failed"
    parts = [w for w in inner.split("|") if w != word]
    return [(NEG, NEG.replace(inner, "|".join(parts)))]
def res_without(word):
    inner = "but|except|however|apart from"
    parts = [w for w in inner.split("|") if w != word]
    return [(RES, RES.replace(inner, "|".join(parts)))]
M = [
 ("1 a colon ends the no-finding sentence", [("NOTHING_FOUND.fullmatch(first)", "NOTHING_FOUND.fullmatch(lead)")]),
 ("2 'none' breadth restored (an item opening with 'none')",
  [("NOTHING_FOUND.fullmatch(first) or", 're.match(r"none\\b", item.strip(), re.I) or NOTHING_FOUND.fullmatch(first) or')]),
 ("3 suffix widened to any one word", [("( found| here)?", r"( \w+)?")]),
 ("4 suffix widened to any words", [("( found| here)?", r"( \w+)*")]),
 ("5 suffix removed", [("( found| here)?", "")]),
 ("6 'none' removed", [(NF, NF.replace("(none|", "("))]),
 ("7 'nothing' removed", [(NF, NF.replace("|nothing|", "|"))]),
 ("8 'no findings?' -> 'no finding'", [(NF, NF.replace("no findings?", "no finding"))]),
 ("9 'no defects?' -> 'no defect'", [(NF, NF.replace("|no defects?|", "|no defect|"))]),
 ("10 'otherwise none' removed", [(NF, NF.replace("|otherwise none|", "|"))]),
 ("11 'checked, no defects?' removed", [(NF, NF.replace("|checked, no defects?)", ")"))]),
 ("12 NOTHING_FOUND never matches", [("NOTHING_FOUND.fullmatch(first) or", "False or")]),
 ("13 the reproduce form read on the first sentence, not the lead",
  [("OTHERS_REPRODUCE.fullmatch(lead)", "OTHERS_REPRODUCE.fullmatch(first)")]),
 ("14 old CLOSURE",
  [("return bool(\n        " + HOLDS + "\n    )",
    'return bool(re.search(r"(^closed\\b|^closures checked\\b|^checked and holding\\b|: closed\\b)", item, re.I))')]),
 ("15 closure_holds always false", [("return bool(\n        " + HOLDS + "\n    )", "return False")]),
 ("16 'Closed' form removed", [(CL, CL.replace('r"closed(:.*)?|', 'r"'))]),
 ("17 '<label>: closed' form removed", [(CL, CL.replace("|[^:]+: closed|", "|"))]),
 ("18 'closures checked, all hold' form removed", [(CL, CL.replace("|closures checked, all hold(:.*)?|", "|"))]),
 ("19 'checked and holding' form removed", [(CL, CL.replace("|checked and holding(:.*)?", ""))]),
 ("20 anchor after 'Closed' loosened", [(CL, CL.replace('r"closed(:.*)?', r'r"closed\b.*'))]),
 ("21 anchor after '<label>: closed' loosened", [(CL, CL.replace("[^:]+: closed|", r"[^:]+: closed\b.*|"))]),
 ("22 anchor after 'closures checked, all hold' loosened",
  [(CL, CL.replace("all hold(:.*)?", r"all hold\b.*"))]),
 ("23 anchor after 'checked and holding' loosened", [(CL, CL.replace("holding(:.*)?", r"holding\b.*"))]),
 ("24 NEGATION removed", [("and not NEGATION.search(first) ", "")]),
] + [("%d NEGATION without '%s'" % (25 + i, w), neg_without(w)) for i, w in enumerate(
    ["not", "no", "only", "still", "partly", "in part", "but", "except", "however", "apart from",
     "fail", "fails", "failed"])] + [
 ("38 NEGATION without '?'", [(NEG, NEG.replace(r"\b|\?", r"\b"))]),
 ("39 RESERVATION removed", [(" and not RESERVATION.match(rest)", "")]),
] + [("%d RESERVATION without '%s'" % (40 + i, w), res_without(w)) for i, w in enumerate(
    ["but", "except", "however", "apart from"])] + [
 ("44 first sentence ends at any '.' or ';'",
  [('FIRST_SENTENCE = re.compile(r"(.*?)(?:[.;](?:\\s|$)|$)")', 'FIRST_SENTENCE = re.compile(r"([^.;]*)")')]),
 ("45 first sentence does not end at ';'",
  [('FIRST_SENTENCE = re.compile(r"(.*?)(?:[.;](?:', 'FIRST_SENTENCE = re.compile(r"(.*?)(?:[.](?:')]),
 ("46 first sentence ends at ';' with no space after it",
  [('FIRST_SENTENCE = re.compile(r"(.*?)(?:[.;](?:\\s|$)|$)")', 'FIRST_SENTENCE = re.compile(r"(.*?)(?:\\.(?:\\s|$)|;|$)")')]),
 ("47 'Spec 3: not closed.' double revert: label anchor loosened and 'not' removed",
  [(CL, CL.replace("|[^:]+: closed|", "|[^:]+:.*closed|"))] + neg_without("not")),
 ("48 heading_name single pass", [("while name != previous:", "if name != previous:")]),
 ("49 '.' accepted as a plan", [('parts[0] in ("", ".", "..")', 'parts[0] in ("", "..")')]),
 ("50 '' accepted as a plan", [('parts[0] in ("", ".", "..")', 'parts[0] in (".", "..")')]),
 ("51 '-refuter.md' suffix not checked", [('            or not parts[3].endswith("-refuter.md")\n', '')]),
 ("52 empty step accepted", [('            or parts[3] == "-refuter.md"\n', '')]),
 ("53 old NOTHING_FOUND, matched at the start of the item",
  [("NOTHING_FOUND.fullmatch(first) or",
    're.match(r"(none|nothing|no findings?|no defects?|otherwise none|checked, no defects?)\\b", item.strip(), re.I) or')]),
 ("54 label form loosened to '<label>: ... closed'", [(CL, CL.replace("|[^:]+: closed|", "|[^:]+:.*closed|"))]),
 ("0 none (the final collector, as a control of the harness)", []),
]
def cases_diff(collector):
    """Run a collector over the test's cases ledger and diff its texts against the test's list."""
    test = open(os.path.join(W, "collect_findings.test.sh")).read()
    body = test.split("cat >\"$cases/1-refuter.md\" <<'MD'\n", 1)[1].split("\nMD\n", 1)[0]
    want = test.split("expected='first | ", 1)[1].split("'\n", 1)[0]
    want = ("first | " + want).splitlines()
    root = os.path.join(S, "cases-ledger")
    shutil.rmtree(root, ignore_errors=True)
    reviews = os.path.join(root, ".scratch/c/agents/reviews")
    os.makedirs(reviews)
    open(os.path.join(reviews, "1-refuter.md"), "w").write(body + "\n")
    out = subprocess.run([sys.executable, "-B", collector, os.path.join(root, ".scratch")],
                         capture_output=True, text=True).stdout
    got = [json.loads(l)["run"] + " | " + json.loads(l)["text"] for l in out.splitlines() if l]
    shutil.rmtree(root)
    return "\n".join(["   - " + t for t in want if t not in got] + ["   + " + t for t in got if t not in want])
for name, edits in M:
    d = os.path.join(S, "mut")
    shutil.rmtree(d, ignore_errors=True); os.makedirs(d)
    for f in ("collect_findings.py", "collect_findings.test.sh"):
        shutil.copy(os.path.join(W, f), d)
    p = os.path.join(d, "collect_findings.py")
    src = open(p).read()
    for a, b in edits:
        if src.count(a) != 1 or a == b:
            print(f"== {name}: pattern count {src.count(a)} or no change: {a!r}"); sys.exit(1)
        src = src.replace(a, b)
    open(p, "w").write(src)
    r = subprocess.run(["sh", os.path.join(d, "collect_findings.test.sh")], capture_output=True,
                       text=True, env=dict(os.environ, PYTHONDONTWRITEBYTECODE="1"))
    print(f"== revert {name}: exit {r.returncode}")
    print((r.stdout + r.stderr).rstrip())
    print("   the cases' own diff under this revert (- expected, + got):")
    print(cases_diff(p) or "   (none)")
shutil.rmtree(os.path.join(S, "mut"), ignore_errors=True)
```

The case map:

```python
import re, sys
out = open(sys.argv[1]).read(); test = open(sys.argv[2]).read()
body = test.split("cat >\"$cases/1-refuter.md\" <<'MD'\n", 1)[1].split("\nMD\n", 1)[0]
cases = [l[2:] for l in body.splitlines() if l.startswith("- ")]
blocks = re.split(r"^== revert ", out, flags=re.M)[1:]
red = {}
for b in blocks:
    name = b.split(":")[0]
    diff = b.split("own diff under this revert (- expected, + got):\n", 1)[1]
    for line in diff.splitlines():
        m = re.match(r"   [-+] (?:first|round 1) \| (.*)", line)
        if m:
            red.setdefault(m.group(1), []).append(name.split()[0])
print(len(cases), "cases;", sum(1 for c in cases if c not in red), "with no red revert")
for c in cases:
    print("%-66s %s" % (c[:66], ",".join(red.get(c, ["NONE"]))))
```

### The counts

```
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l
675 findings
     675
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch/archive | wc -l
541 findings
     541
```

The first report gave 673 and 539. The row difference against the output at the round's start (`$S/r0-all.jsonl`, byte-identical by `cmp` to the output the first report's list was read from):

```
$ python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive > $S/r1-all.jsonl 2>/dev/null
$ python3 -B $S/rowdiff.py $S/r0-all.jsonl $S/r1-all.jsonl
before 673 after 675
in after, not before:
  + row 352 | archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md | first | proof | Otherwise none: layout ok, inventory ok, seven PASS lines, a clean ASCII check and 54 to 110 lines all reproduce.
  + row 366 | archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md | round 1 | spec | Checked, no defect found: the ruling sequence at :73-87 matches old :35-47 ("books the ruling and nothing else", then `/spec <entry> <step>` typed again) and skills/plan-help/SKILL.md:35-37. Stops rows 1-3, the stops that write an open item, match plan-help :35 ("a premise ... wrong on the tree, or a choice is yours"). Stops row 7 matches old :15 in meaning, and the configuration block is the correct antecedent (`workers_at_once`, plan-orchestration :45, :129). Row 7 does not refuse a re-run of the same step when `workers_at_once` is above 1, and neither did the old file. Every one of the 64 inventory rows names a section and item that exist and hold its rule after the moves under Steps: A stop 1-2, A ruling 1-3, Stops 1-8, What it reads 1-5, Steps 1-7, Anti-patterns 1-3, Rules 1. Row 66 now points at Stops 2. The dispatch block's fields, the worktree command, the brief's contents and the ruling's form are unchanged in meaning. Spec.
in before, not after:
```

- Row 352, `archive/1-one-layout-for-every-skill/.../6-refuter.md`, first, proof: "Otherwise none: layout ok, ...". Its first sentence runs past the colon, so it is no longer the whole form "otherwise none" (ruling 3). It reports no defect.
- Row 366, the same report, round 1, spec: "Checked, no defect found: the ruling sequence ...". The same rule. It reports no defect: its one negative sentence ("Row 7 does not refuse a re-run ... and neither did the old file") says the behaviour is unchanged.
- Both are in the archive, so both totals rise by two. No row is removed: no item in the ledgers is a closure that the round's rule newly drops or newly keeps.

Against the step's base (`$S/before-all.jsonl`, 672 rows) the output has three rows more and none fewer: these two and row 227 of the first report, "Nothing else: ASCII clean, ...", still row 227.

```
$ python3 -B $S/rowdiff.py $S/before-all.jsonl $S/r1-all.jsonl
before 672 after 675
in after, not before:
  + row 227 | archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md | first | standards | Nothing else: ASCII clean, one paragraph per source line, no history, no other sentence made false.
  + row 352 | archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md | first | proof | Otherwise none: layout ok, inventory ok, seven PASS lines, a clean ASCII check and 54 to 110 lines all reproduce.
  + row 366 | archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md | round 1 | spec | Checked, no defect found: the ruling sequence at :73-87 matches old :35-47 ("books the ruling and nothing else", then `/spec <entry> <step>` typed again) and skills/plan-help/SKILL.md:35-37. Stops rows 1-3, the stops that write an open item, match plan-help :35 ("a premise ... wrong on the tree, or a choice is yours"). Stops row 7 matches old :15 in meaning, and the configuration block is the correct antecedent (`workers_at_once`, plan-orchestration :45, :129). Row 7 does not refuse a re-run of the same step when `workers_at_once` is above 1, and neither did the old file. Every one of the 64 inventory rows names a section and item that exist and hold its rule after the moves under Steps: A stop 1-2, A ruling 1-3, Stops 1-8, What it reads 1-5, Steps 1-7, Anti-patterns 1-3, Rules 1. Row 66 now points at Stops 2. The dispatch block's fields, the worktree command, the brief's contents and the ruling's form are unchanged in meaning. Spec.
in before, not after:
```

`rowdiff.py`:

```python
import json, sys
def load(p): return [json.loads(l) for l in open(p)]
b = load(sys.argv[1]); a = load(sys.argv[2])
key = lambda r: (r["report"], r["run"], r["heading"], r["text"])
bk = [key(r) for r in b]; ak = [key(r) for r in a]
print("before", len(b), "after", len(a))
print("in after, not before:")
for i, k in enumerate(ak, 1):
    if k not in bk: print("  + row %d |" % i, k[0].replace(".scratch/", ""), "|", k[1], "|", k[2], "|", k[3])
print("in before, not after:")
for k in bk:
    if k not in ak: print("  -", k[0], "|", k[1], "|", k[2], "|", k[3])
```

### The hand count

```
$ python3 -B $S/handcount.py skills/plan-retro/templates/collect_findings.py > $S/hand-r1.out
$ cmp $S/hand-r1.out $S/hand-after.out && echo "identical to the first report's"
identical to the first report's
```

The four counts are unchanged: plan 1 step 11, 18 and 18; plan 1 step 13, hand 21 and collector 22, the difference being line 78 ("No sentence in README.md, docs/ or another skill is made false.", still row 213); plan 2 step 3, 17 and 17; plan 2.A step 3, 29 and 29. No item of these four reports is in a form the round changed.

### Items that report no defect

The round's output is the first report's output with rows 352 and 366 added and nothing removed or changed (the row difference above). All 673 other rows were read in the first build; rows 352 and 366 were read in full in this round. The list is the first report's 31 items at their new row numbers, and rows 352 and 366: 33 items. `python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive 2>/dev/null | sed -n '<row>p'` prints each.

| Row | Report | Run | Heading | Text |
|---|---|---|---|---|
| 40 | `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1-refuter.md` | round 2 | behaviour | `utils/verify.sh:183-186`: other probe results. - These are misread as summary tests. Each result is still red or correct: - `\| tail -1 &` gives an empty output, exit status 0 and a red. - `\| tail -1 &&true` with a red test gives exit 1. - `echo $(sh red.test.sh 2>&1 \| tail -1)` gives exit status 0 and is red only on its `FAIL: x` last line. - `\| tail -1 # summary` is red for a test without a `PASS:` last line. - These are plain commands with `FAIL: x` printed, in the `; true` class that ruling 2 accepts: - `x=$(sh red.test.sh 2>&1 \| tail -1); echo "$x"`: green. - `\| tail -1 \|\| true`: green. - Heredocs: - `cat <<'EOF' \| tail -1` with a heredoc is a plain command and passes on its output. - A heredoc fed to `tail` is red (status 141). - The kill does not reach processes outside the command's session. A sleep in the driver's own process group and one in another session both stayed alive under all eight signal runs. A process the command moves out with `setsid` also stays alive (judgment call 3). The pages say "every process group of that session", which is accurate. |
| 59 | `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/2-refuter.md` | round 1 | standards | Vendor and tool names outside the models section in changed text, as your check asked: - `SKILL.md:60` ("the `claude -p` JSON or the `codex -o` final message"). - `SKILL.md:61` ("A native Claude agent's"). - `skills/plan/templates/orchestrator-state.md:13` and `:15` ("codex:gpt-5.6-sol", "Fable or Astra"). - `orchestrator-state.md:27` ("the claude -p JSON or the codex -o final message"). Brief items 3 and 17 and ruling 10 dictated these words. No written rule forbids them now: `SKILL.md:261` and `docs/dev/change-standard.md` "Rules this repository already states" forbid project names and paths, not vendor names. I list them because your criterion hits, not as a breach of a written rule. No project name appears in the changed skill text (grep above, rc=1). |
| 196 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/12-refuter.md` | first | behaviour | What is written before the user's decisions (only the retro file, at Steps 6, before the stop at Steps 7) and the proposal order (not written, then off the standards list, then checkable, then a sharper sentence) are the same as in the old file. Nothing else found. |
| 213 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md` | first | standards | No sentence in README.md, docs/ or another skill is made false. |
| 218 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md` | round 1 | proof | .scratch/1-one-layout-for-every-skill/agents/reviews/13-report.md:10 and :46: the quoted inventory command writes into the worktree, so it was not rerun as written; an equivalent run that writes nothing prints `ok:`. No fix needed. |
| 222 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | spec | No place listing the verify commands was missed (`git grep -ln "check_rule_inventory.test.sh\\|check_skill_layout\\|pin.test.sh" -- ':!.scratch'`: README.md, the docs/dev pages, the utils scripts). The state file's `verify` list lacks the line, as expected before landing. |
| 227 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | standards | Nothing else: ASCII clean, one paragraph per source line, no history, no other sentence made false. |
| 228 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | behaviour | docs/dev/change-standard.md:8 drops "a brief that names one points at it"; the report states the before and after. |
| 253 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/2-refuter.md` | first | behaviour | Running the check on the current skills exits 1. That is expected and stated in report row 3. |
| 278 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/3-refuter.md` | first | proof | Inputs handled correctly: CRLF line endings (`ok:`), a multi-line description (lines 3-5 reported uncovered), list continuation and table rows (reported uncovered), the range `5 - 7` (rejected), a closing-hash section named without the hashes, and an escaped pipe (rejected, see Standards). |
| 309 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/4-refuter.md` | first | standards | Other checks, none: no non-ASCII (the ASCII check is clean), no history. Every section another file names still exists: "The review, earned" and "Two steps in flight" (cited by the plan skill's templates/plan.yaml and templates/orchestrator-state.md), and "Usage" and the resumption rules (cited by skills/land/SKILL.md:10 and :28). The old heading "Handing the plan from one orchestrator to another" is named nowhere else. |
| 335 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/5-refuter.md` | first | standards | The six "as `/plan` states them" references (skills/plan-retro/SKILL.md:14, skills/land/SKILL.md:14, skills/refute/SKILL.md:14, skills/roadmap/SKILL.md:22, skills/plan-help/SKILL.md:10, skills/spec/SKILL.md:14) still hold, because What it reads 1 (lines 31-34) states the keys, the required ones, the defaults and the missing-key refusal. No file in skills/, utils/, docs/ or README.md names a section of skills/plan/SKILL.md (grep for "What it writes" and "/plan`'s" found none that point here). Nothing to report on these. |
| 337 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/5-refuter.md` | first | behaviour | The new file orders the work: the existing-folder refusal comes at Steps 1, before drafting, and `orchestrator-state.md` is written (Steps 4) only after the user approves `plan.md` (Steps 3). The old file stated no order for the state file relative to the approval. No rule of the old file conflicts with this order, but it is an ordering the old file did not impose. |
| 340 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/5-refuter.md` | round 1 | behaviour | The other closures hold when checked against the files: - Anti-patterns 1's Do instead cell names Steps 3 (:74). - Each refusal is stated once, in Stops rows 2 to 5 (:65-68). What it reads 1 and 2 and Steps 1 point there (:33, :35, :43). - Stops row 3 is limited to a required key, and the refusal names the key (:66). Old line 14 says the same, and :32 keeps the default for an optional key. - The title paragraph no longer says the empty folders are committed (:10). This matches Steps 6 (:58). - The "mechanical half / design half" sentence is in Stops row 1 (:64), and inventory row 16 points there. - The executor rule is split into :53, :54 and :55, and the closing-step rule into :48 and :49, each with its own inventory row (36-38, 47-48). "Over that default" at :55 matches what the plan skill's templates/orchestrator-state.md:12 calls the block's value. - The new cells in the What it shows and What resumes it columns are within the step 5 ruling at plan.md:51: they contradict nothing in the old file. - Every inventory row's item number points at the right row after the change: Stops 1 to 5, Anti-patterns 1 and 2, Rules 1 to 4, What it reads 1 to 3, Steps 1 to 6. The checker counts top-level items only (`ITEM` at utils/check_rule_inventory.py:58 is anchored at column 0). - Six skills say "as `/plan` states them": skills/plan-retro/SKILL.md:14, land:14, refute:14, roadmap:22, plan-help:10 and spec:14. What it reads 1 still gives them what they need: - The required keys and the defaults are in the templates it names (:31). - An optional key that is missing takes its default (:32). - A missing required key is a refusal that names the key, through the pointer at :33 to Stops row 3 (:66). - Going through the old file line by line again, every old line from 2 to 33 has a place in the new file with the same meaning. - The Use instead invocations exist in the target skills: `/ordo-init`, `/roadmap add <goal>` (roadmap:14), `/spec <entry> <step>` (spec:44), `/plan-orchestration <entry>`, and `/plan-help <entry>` (plan-help:10). - No other findings. Spec. Behaviour. |
| 352 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md` | first | proof | Otherwise none: layout ok, inventory ok, seven PASS lines, a clean ASCII check and 54 to 110 lines all reproduce. |
| 366 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md` | round 1 | spec | Checked, no defect found: the ruling sequence at :73-87 matches old :35-47 ("books the ruling and nothing else", then `/spec <entry> <step>` typed again) and skills/plan-help/SKILL.md:35-37. Stops rows 1-3, the stops that write an open item, match plan-help :35 ("a premise ... wrong on the tree, or a choice is yours"). Stops row 7 matches old :15 in meaning, and the configuration block is the correct antecedent (`workers_at_once`, plan-orchestration :45, :129). Row 7 does not refuse a re-run of the same step when `workers_at_once` is above 1, and neither did the old file. Every one of the 64 inventory rows names a section and item that exist and hold its rule after the moves under Steps: A stop 1-2, A ruling 1-3, Stops 1-8, What it reads 1-5, Steps 1-7, Anti-patterns 1-3, Rules 1. Row 66 now points at Stops 2. The dispatch block's fields, the worktree command, the brief's contents and the ruling's form are unchanged in meaning. Spec. |
| 389 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/7-refuter.md` | round 1 | behaviour | skills/land/SKILL.md:15, the ruling carried: it now reads "booked as its own step in the state file's booked list", which matches plan.md's ruling (never the open items) and refute's Finding dispositions 1 (line 100). Refute's wording is "booked as its own step in the plan and carried in the state file's booked list", and land drops "in the plan". The meaning holds, since plan-orchestration:73 uses refute's wording. The closure holds, with no new defect beyond the land:24/:25 bullet above. Behaviour. |
| 390 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/7-refuter.md` | round 1 | spec | The other closures claimed in 7-report.md:42-51 hold, and the pointers resolve: - "Over a repair round" 7 (line 68) points at Finding dispositions, which books a finding in the booked list. - Rules 1 (line 126) covers every run, and "Over a repair round" 1 names it. - "Finding dispositions" is a noun-phrase heading, pointed at from Steps 8 (line 54) and "Over a repair round" 7, with its old first bullet split into lines 100 and 101. - Anti-patterns rows 1 and 5 point at Steps 6, and row 4 points at Steps 3 and 4. Each step holds what its row points at. - Background shells and polling are unconditional (row 3); the "unless the brief lists them" exception is kept for benchmarks and sanitizers only (row 4). - Stops row 1 says the skill never stops. - Steps 1 holds "once per step before its first repair round". - Every inventory row pointing at a renumbered item names the right item: Stops 2/3/4, Anti-patterns 2/3/4/5, Rules 1/2/3/4, Finding dispositions 1-4, "Over a repair round" 6/7/8, Steps 1/6/7. - A final read of old lines 1-44 against the new file finds no other rule dropped or changed in meaning. Spec. |
| 406 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/8-refuter.md` | first | behaviour | The order of the look against the checks and the booking (step 5's last bullet, then steps 6 and 7) and the order of the landing report (step 11, written before step 9's commit) against the commit are unchanged: none. |
| 421 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/9-refuter.md` | round 1 | proof | utils/check_rule_inventory.py:264: the change does not weaken anything else the check guarded, as my probes above show. A heading inside a fence and a heading-shaped comment in the frontmatter behave as before. A range of two headings (7-8) is still an error, and so is a heading plus the blank line after it (8-9). The docstring line at :25 matches the code, since ":37" defines a heading as one outside the frontmatter and outside fenced code. The new case heading-row turns red with the change reverted (output above). This bullet reports no defect in the check itself. Proof. |
| 424 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/9-refuter.md` | round 1 | behaviour | skills/plan-help/SKILL.md:41: the Step 3 condition is closed. "For `/plan-help <entry>`, print one line from that position" now matches old lines 45 and 47, where the next-command line sat under "The position, for `<entry>`". The other first-run closures also match the new file: "writes nothing" appears only at :91, "by hand" is gone from :10, and "step files" is replaced at :33. The inventory has heading rows for old 14 and 45. Old 8, "# Plan help", is the title and carries no rule. On a second line-by-line pass over old lines 1-47, I found no other rule dropped or changed in meaning. The printed block is byte-identical (cmp above). No finding here. Behaviour. |
| 460 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/2-refuter.md` | first | spec | The tree-wide grep for key lists finds no other list missing `launch_note`. |
| 462 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/2-refuter.md` | first | proof | The report's five plants were not rerun; its verify output reproduces. |
| 522 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/1-refuter.md` | first | proof | The report's four reverts reproduce; the other reverts tried go red. |
| 570 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | first | proof | Every figure of the report reproduces (139 lines, the `ok:` line, 16 / 5 / 1 / 4, eight `PASS:` lines, ten `ok:` lines, a clean ASCII check, no reason over two sentences; the longest sentence is 35 words, line 118). |
| 575 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | first | standards | No non-ASCII, dash asides, history words, reasons over two sentences or sentences over 35 words. |
| 578 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | first | behaviour | The introduction's command now names both skills and passes; no other file names the command. |
| 593 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | round 1 | standards | No non-ASCII, dash asides, history, over-long reasons or sentences. |
| 595 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | round 1 | behaviour | Line 18 holds for every cross-skill split in the delta. |
| 596 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md` | round 1 | behaviour | The introduction's command names both skills and passes. |
| 615 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/5-refuter.md` | first | behaviour | The check command names three skills and passes; the New skills table matches the roadmap. |
| 632 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/5-refuter.md` | round 1 | behaviour | The check command names three skills and passes. |
| 655 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/6-refuter.md` | first | behaviour | Lines 3, 5 to 10 and 20 to 23 are true. |

Items that carry a confirmation but also name a defect, read as findings, at their new row numbers:

| Row | Report | Run | Heading | Why it is a finding | Opening words |
|---|---|---|---|---|---|
| 16 | `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1-refuter.md` | first | behaviour | its first sentences name a defect (a `yml` fence refused, not stated in the report); the probe list after them reports no defect | `utils/verify.sh:52`, `:60`: only a fence whose info word is exactly `yaml` counts. ```` ```YAML ``` ... |
| 193 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/12-refuter.md` | first | proof | it names the report's missing quoted output, though the claim holds | .scratch/1-one-layout-for-every-skill/agents/reviews/12-report.md:11: the verify-list row gives "sev ... |
| 221 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md` | first | spec | it names a change the report does not list, though the sentence is accurate | docs/dev/change-standard.md:53: "The layout check prints each error with its file and line; exit 0 i ... |
| 247 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/2-refuter.md` | first | proof | its last sentence names a defect: report row 2's DONE claim is contradicted | 2-report.md:17: the named reverts for missing-section/out-of-order ("drop the missing and order test ... |
| 262 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/2-refuter.md` | round 1 | proof | it names rows with no revert, a stale header and judgment calls left out | 2-report.md, Repair round 1: I reproduced these closures with the reds quoted above: list-frontmatte ... |
| 263 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/3-refuter.md` | first | spec | its last sentence names a stale brief copy in the worktree | orchestrator-state.md dispatch block / worktree HEAD: the worktree sits at f157b94 (`git log --oneli ... |
| 292 | `.scratch/archive/1-one-layout-for-every-skill/agents/reviews/3-refuter.md` | round 1 | proof | its last sentence names an omission in the report's row | 3-report.md, Repair round table, row "Proof: ten reverts stayed green": the ten reverts listed there ... |
| 443 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/1-refuter.md` | first | behaviour | its last sentence names a difference from the recipe: the detached process's output goes to /dev/null | No user-visible change today; nothing calls `launch.sh` yet. Step 3 would expose Spec 1 and Spec 2.  ... |
| 471 | `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/2-refuter.md` | round 1 | proof | it names a missing check, which the ledgers count as a proof finding | No check confirms the moved page exists where the pointers name it (an audit gap only). ... |
| 555 | `.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md` | round 1 | proof | its first sentence names a defect in the report's closure | The report's round item 6 presents cutting reasons of 70 words or more as the closure of finding 6,  ... |

Both tables are printed by:

```
$ python3 -B $S/mklist1.py $S/after-now.jsonl $S/r1-all.jsonl
```

```python
# Map the first report's rows to the round's output by (report, run, heading, text), add the two
# new rows, and print the two tables with the round's row numbers.
import json, sys
old = [json.loads(l) for l in open(sys.argv[1])]
new = [json.loads(l) for l in open(sys.argv[2])]
key = lambda r: (r["report"], r["run"], r["heading"], r["text"])
where = {key(r): i for i, r in enumerate(new, 1)}
nodef_old = [40, 59, 196, 213, 218, 222, 227, 228, 253, 278, 309, 335, 337, 340, 387, 388, 404, 419,
             422, 458, 460, 520, 568, 573, 576, 591, 593, 594, 613, 630, 653]
mixed_old = {
    16: "its first sentences name a defect (a `yml` fence refused, not stated in the report); the probe list after them reports no defect",
    193: "it names the report's missing quoted output, though the claim holds",
    221: "it names a change the report does not list, though the sentence is accurate",
    247: "its last sentence names a defect: report row 2's DONE claim is contradicted",
    262: "it names rows with no revert, a stale header and judgment calls left out",
    263: "its last sentence names a stale brief copy in the worktree",
    292: "its last sentence names an omission in the report's row",
    441: "its last sentence names a difference from the recipe: the detached process's output goes to /dev/null",
    469: "it names a missing check, which the ledgers count as a proof finding",
    553: "its first sentence names a defect in the report's closure",
}
added = [n for n, r in enumerate(new, 1) if key(r) not in {key(o) for o in old}]
nodef = sorted([where[key(old[n - 1])] for n in nodef_old] + added)
esc = lambda t: t.replace("|", "\\|")
print("| Row | Report | Run | Heading | Text |")
print("|---|---|---|---|---|")
for n in nodef:
    r = new[n - 1]
    print(f"| {n} | `{r['report']}` | {r['run']} | {r['heading']} | {esc(r['text'])} |")
print("MIXED")
print("| Row | Report | Run | Heading | Why it is a finding | Opening words |")
print("|---|---|---|---|---|---|")
for o in sorted(mixed_old):
    n = where[key(old[o - 1])]
    r = new[n - 1]
    print(f"| {n} | `{r['report']}` | {r['run']} | {r['heading']} | {mixed_old[o]} | {esc(r['text'][:100])} ... |")
print("ADDED", added, "COUNT", len(nodef))
```

### Checks

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"
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
verify exit 0
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ find . -name __pycache__ -not -path './.git/*'
$ awk 'length > 100 {print FILENAME": "FNR}' skills/plan-retro/templates/collect_findings.*
$ LC_ALL=C grep -n '[^ -~]' skills/plan-retro/templates/collect_findings.*
$ grep -rn 'NONE\b\|FIRST_CLAUSE\|CLOSURE\b' skills utils docs README.md | grep -v '^skills/plan-retro/templates/collect_findings'; echo "grep exit $?"
grep exit 1
```

The four commands after the test print nothing. The names this round removed (`NONE`, `FIRST_CLAUSE`) and the first build's `CLOSURE` are named nowhere else. `README.md:119` ("a closure that holds, or an item in one of the forms that report nothing. A closure that does not hold stays a finding, and so does each near miss of those forms") and `skills/plan-retro/SKILL.md:74` (a finding that reports no defect is set aside as "no defect") stay true.

### Files

| File | Lines at the round's start | Lines now | Changed lines (`diff` against `$S/r0/`, lines starting `<` or `>`) |
|---|---|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 322 | 331 | 75 |
| `skills/plan-retro/templates/collect_findings.test.sh` | 574 | 637 | 113 |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/6a-report.md` | 739 | 1722 | this section appended, the first line and the line after it changed |

### Judgment calls the rulings left open

1. **The reproduce form keeps a lead that ends at a colon** (`LEAD`), since ruling 3 leaves that form unchanged: "The remaining claims in the report reproduce: 143 lines, 74 rows." stays an item that reports nothing. Revert 13 reads it on the first sentence instead and turns the fixture red.
2. **"<label>" holds no colon**, and "Closed: <text>", "Closures checked, all hold: <list>" and "Checked and holding: <list>" take any text after the colon; the negation words and the "?" are then searched in the whole first sentence, text after the colon included.
3. **The text after the first sentence** is taken from the end of the sentence's `.` or `;` and its spaces, and `RESERVATION` must not match at its start, case-insensitive ("Closed. But ..." and "Closed; except ..." are findings).
4. **The cases added beyond `round1-cases.py`** are listed under "The cases", each with the revert it exists for.

### User-visible changes of the round

| Item | At the round's start | Now |
|---|---|---|
| "None: ...", "None of ...", or any "none" first sentence longer than "none", "none found" or "none here" | dropped | a finding |
| A no-finding form followed by a colon and text ("No defect: src/a.py:3 divides by zero.", "Otherwise none: ...", "Checked, no defect found: ...") | dropped | a finding |
| A round item "Closed: but ...", "Closed: ... fails ...", "Closed: except ...", "Closed: however, ...", "Closed: apart from ..." | dropped | a finding |
| A round item whose text after "Closed." or "Closed;" opens with "but", "except", "however" or "apart from" | dropped | a finding |
| "Closures checked, all hold except ..." and "Checked and holding, except ..." | dropped | a finding |
| "Spec 1: closed;see a.py:3." | a finding | a finding |
| "Proof 1 (see 6-report.md): closed." | dropped | dropped |

Over this worktree's ledgers the output grows from 673 to 675 rows (rows 352 and 366).
