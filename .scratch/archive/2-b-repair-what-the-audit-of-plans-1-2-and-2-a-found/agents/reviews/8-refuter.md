# Step 8 refuter report (on .agents/worktrees/2b-8, base f052f57)

Note first: one of my probes imported the module from the worktree (`python3 -` with `sys.path.insert(0, "utils")`; `import check_coverage`), and that wrote `utils/__pycache__/check_coverage.cpython-313.pyc` into the worktree at 18:17. The builder did not create it. `git status --short` now lists `?? utils/__pycache__/`. The folder is not ignored, so the ASCII check reads the .pyc, and perl dies on it (`Malformed UTF-8 character (fatal)`) while still exiting 0 (the defect booked as step 1b). Remove `utils/__pycache__/` before the wip commit. I did not remove it myself because the brief allows no edits. The verify run quoted below ran before that file existed.

## Verification (rerun by the reviewer)

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
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
exit 0
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ python3 utils/check_coverage.py; echo "exit $?"
Usage: check_coverage.py [--built <skill>]... <coverage.md> <skills root> <skill>...
exit 2
$ wc -l utils/check_coverage.py utils/check_coverage.test.sh ; git show f052f57:<each> | wc -l
360, 562 (base 278, 396)
$ git diff -U0 f052f57 -- utils/ | grep '^+' | grep -v '^+++' | awk 'length($0) > 101'
(nothing)
```

The reverts were reproduced with a driver in my scratchpad. It copies the checker with one text substitution, plus the unchanged test, into a temporary folder and runs `sh check_coverage.test.sh` there. The worktree files were not touched. Each revert went red:

```
R1 (Done regex without "\.?")        FAIL: done-lettered: expected exit 0, got 1: ...:12: roadmap entry '4.C' of 'done-dotted' is not in docs/roadmap.md
R2a (roadmap splitlines)             FAIL: roadmap-separators: expected exit 1, got 0: ok: ...
R2b (list splitlines)                FAIL: separator-names: expected exit 0, got 1: ...:0: 'sep/a
b.md' is not listed ...
R2c (find without -print0, split \n) FAIL: newline-name: missing [:0: 'nl/a\nb.md' is not listed] ...
R3a (find names not NFC)             FAIL: nfc-names: ...:0: 'nfd/cafe (combining acute).md' is not listed / :41: 'caf\xe9.md' is not a file of nfd
R3b (file cell not NFC)              FAIL: nfc-names: ...:0: 'nfd/th\xe9.md' is not listed / :42: 'the (combining acute).md' is not a file of nfd
R4a (no --built check, elif False)   FAIL: built-none: expected exit 1, got 0
R4b (span not required plain)        FAIL: built-not-plain: expected exit 1, got 0
R4c ("." counted)                    FAIL: built-not-plain: expected exit 1, got 0
R4d (rebuild later read)             FAIL: built-later: ...:22: the reason of 'references/deep/guide.md' (rebuild later: writing) names no path in backticks
R4 exists->True (my own revert)      FAIL: built-missing: expected exit 1, got 0
R4g (not-in-New-skills unreported)   FAIL: built-not-new: expected exit 1, got 0
R4j (skills/<skill> folder not required) FAIL: built-no-folder: expected exit 2, got 1
R5a (\| taken as closing pipe)       FAIL: escaped-last-cell: missing [:12: roadmap entry '3|' ...] in: ...'3\' ...
R5b (find failure unguarded)         FAIL: find-fails: expected exit 2, got 1: ...:0: no '## locked' section
R5c (unsorted output)                FAIL: order: expected, in this order: ...
```

These are the commands the report quotes, rerun:

```
New test against the base checker (git show f052f57:utils/check_coverage.py):
FAIL: done-lettered: expected exit 0, got 1: ...:12: roadmap entry '4.C' of 'done-dotted' is not in docs/roadmap.md ; exit 1
With fail() made non-fatal, the cases that fail are done-lettered, roadmap-separators, separator-names, newline-name, nfc-names and every built-* case. escaped-last-cell, order and find-fails pass there, as the report says.
Snapshot control (a checker that writes <list>.touched): exit 1, FAIL: complete: the check changed something under the scratch folder
CRLF copies of docs/academic-coverage.md and docs/roadmap.md in a scratch repo: ok: docs/academic-coverage.md, exit 0
Old-only demo (reason "Old only: `SKILL.md` of the source.", --built paper, skills/paper/SKILL.md exists): ok: docs/c.md, exit 0
README.md:126 compared with the report's quoted line (prefix "126:" stripped): diff reports no difference
grep -rn -e '--built' -e 'check_coverage.py <' skills utils docs README.md | grep -v '^utils/check_coverage': nothing
```

These are the probes the brief asked for:

```
ROADMAP_ENTRY: '- [x] 15.A. Rebuild-later rows: done' -> 15.A; '## 15.A Rebuild-later rows' -> 15.A; '## 15.A' (no title) -> None;
  '- [x] 15.A.' (nothing after) -> None; '## 15.A. x' -> None; '- [x] 15.a. x' -> None
--built paper, reason "`templates/gone.tex` and `templates/venue.tex`" (one exists): ok, exit 0
--built paper, reason "`templates/../SKILL.md`": :15: ... names no path under skills/paper/ that exists: templates/../SKILL.md, exit 1
NFD file cell, file stored NFC: no error (ok)
--built writing with no rebuild: writing row in the named sections: ok, exit 0
--built paper, reason "`templates`" (a folder): ok, exit 0
--built paper, reason "`Templates/VENUE.tex`" (only templates/venue.tex exists): ok, exit 0
--built paper, reason "`linked.md`" (a link in skills/paper to a file outside the repository): ok, exit 0
--built paper, reason "`skills/paper/templates/venue.tex`": :15: ... names no path under skills/paper/ that exists: skills/paper/templates/venue.tex, exit 1
```

## 1. Spec

1. `utils/check_coverage.py:224-232` (`built_path_error`; `os.path.exists(os.path.join(folder, path))` with `folder` = `skills/<skill>`). This is the builder's open question. The builder followed brief decision 1 ("its paths resolve against `skills/<skill>/`") as written, so the defect is in the decision. A reason that names only a research-hub file passes when a file with the same relative path exists in the new skill. Reproduced above: a reason naming only the source's `SKILL.md` passes `--built paper`. The collision is likely on the commonest names, because `ls skills/*/` shows `SKILL.md` in 10 of 10 skills and `templates` in 9. Requiring spans that start `skills/<skill>/` would close it:
   - No research-hub path can match that form: `find <skill> -path "*/skills/*"` over the four academic skills printed nothing.
   - It fits the coverage list's current reason format. In `docs/academic-coverage.md`, 36 of the 90 `rebuild:` rows name backticked spans, and none starts `skills/` (my count). The spans that are there are research-hub relative paths (`references/sprint_contract_protocol.md` 5 times, `agents/visualization_agent.md`), skill names (`paper`, `rebuttal`) and hub tools (`tools/manuscript`). So no current row changes meaning, and a re-marked row can keep naming the source file beside the new one.
   - It matches the repository-path convention of `docs/dev/skill-layout.md:55` ("A repository path is relative to the repository root").
   - It meets entry 15.A's gate text ("its reason names the file of the skill that now holds it") literally, and gives step 10's gates one form to write.
   - It does not stop a lazy re-mark naming `skills/<skill>/SKILL.md` on every row. The check only proves that the path exists, and the report says so.
   - The recommended ruling is the prefix form. Keeping the relative form is the lazy option.
2. `utils/check_coverage.py:230`: `os.path.exists(...)` accepts a folder (probe: `` `templates` `` passes). Entry 15.A's gate asks that the reason "names the file of the skill". A folder name also collides more often than a file name: `templates` exists in 9 of 10 skills. Brief item 4 says "a path", so the builder's reading is within the brief's words (report, judgment call 3). With the prefix ruling, requiring a file from an exact listing of `skills/<skill>/` (the same `find` the file cells use) would close this and Behaviour 1 and 2 as well.

## 2. Proof

none

## 3. Standards

1. `docs/academic-coverage.md:20-24`. This page shows the check and its command, and its mark definitions are at lines 14-16. The diff adds a user-visible option, `--built`, that only the docstring and the README Doc text describe. Change standard rule 5 says every user-visible surface is documented on the page where it is shown. The brief limited the step's writes to the two utils files, so the builder could not write this page. The orchestrator carries it at landing or in step 10, together with the reason format the Spec 1 ruling fixes.
2. README Doc text (report line 281): "fails a reason that names no path, or only paths that do not exist there or are not plain relative paths". `.` is a plain relative path by `plain()` (`utils/check_coverage.py:218-221`), and it is excluded separately (`path != "."`, line 230; case built-not-plain). The docstring states that exclusion (line 38), but the README sentence leaves it out. Suggested wording: "...or are not plain relative paths, or are `.`". Apart from this, the replacement text matches the code and the test cases. I checked each clause against the cases done-lettered, roadmap-separators, escaped-last-cell, separator-names, newline-name, nfc-names, order, find-fails, built-* and the usage cases.

## 4. Behaviour

1. `utils/check_coverage.py:230`: the existence test goes through the file system, so on macOS's default case-insensitive APFS a reason naming `Templates/VENUE.tex` passes when only `templates/venue.tex` exists (probe above). The same list fails on a case-sensitive file system. File cells, by contrast, are compared exactly against `find`'s listing. The report does not state this.
2. `utils/check_coverage.py:230`: a link inside `skills/<skill>/` that points to a file outside the repository counts as the named file (probe: `linked.md` passes). On the source side, a link inside a skill folder is an error (line 268). The report does not state this.
3. `--built <skill>` passes silently when the named sections hold no `rebuild: <skill>` row, whether the skill has no rows or its rows are in sections not named on the command line (probe: `--built writing` printed `ok`, exit 0). For step 10's gates, this means that a gate naming fewer than the four source skills checks nothing for the rows it leaves out. The report does not state this vacuous pass.

## Not checked

- NFD spans inside a `--built` reason. The reason spans are not NFC-normalised, and on APFS lookups ignore the normalisation form, so this cannot be shown on this host. On Linux, an NFD span naming an NFC file would fail. Not verified.
- Reverts R2d, R4e, R4f, R4h and R4i of the builder's list were not rerun (16 reverts were reproduced, including one of my own).

Reviewer usage: 136,212 tokens, 34 tool uses, 539 s (the runner's completion notification).

## Repair round 1, refuted

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
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
exit 0
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ git status --short
 M .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/8-report.md
 M docs/academic-coverage.md
 M utils/check_coverage.py
 M utils/check_coverage.test.sh
$ git diff -U0 f052f57 -- docs/academic-coverage.md | grep '^@@'
@@ -14 +14 @@ The marks:
@@ -25,0 +26,6 @@ python3 utils/check_coverage.py ...      (within lines 1-30; `## New skills` is now line 32)
$ wc -l utils/check_coverage.py utils/check_coverage.test.sh docs/academic-coverage.md
     374 utils/check_coverage.py
     597 utils/check_coverage.test.sh
     237 docs/academic-coverage.md          (as the report says)
$ LC_ALL=C grep -n '[^ -~]' utils/check_coverage.py utils/check_coverage.test.sh docs/academic-coverage.md <ledger>/agents/reviews/8-report.md; echo $?
1                                        (nothing printed; the NFD span is written with an escape inside the Python edit)
$ git diff -U0 879a4f0 -- utils | grep '^+' | grep -v '^+++' | awk 'length($0) > 101'
(nothing)
$ grep -rn -e '--built' README.md docs skills utils | grep -v '^utils/check_coverage'
docs/academic-coverage.md:26, docs/academic-coverage.md:29 only (as the report says)
$ grep -rn 'rebuild:' README.md docs skills utils (table rows and utils/check_coverage* excluded)
docs/academic-coverage.md:14, :26, docs/roadmap.md:121; each still true
Main checkout state file, open items: "- none." (the report's quote matches)

Round-start checker (git show 879a4f0:utils/check_coverage.py) with the new test, fail() non-fatal, red cases:
built-later, built-later-control, built-missing, built-nfc, built-no-row, built-none,
built-not-a-file x7 (../paper/SKILL.md, ., ./SKILL.md, "", linked.md, templates, Templates/VENUE.tex),
built-repeated, built-source-only          (matches the report; built-named passes there, as stated)

Reverts on copies under $TMPDIR (worktree untouched), each `sh check_coverage.test.sh`:
Ruling 1, spans not required to start skills/<skill>/ (a relative span prefixed):
  exit 1: FAIL: built-source-only: expected exit 1, got 0: ok: .../built-source-only.md
Ruling 2, lookup through os.path.exists on skills/<skill>/ instead of the find listing:
  exit 1: FAIL: built-not-a-file [skills/paper/../paper/SKILL.md]: expected exit 1, got 0
  red with fail() non-fatal: all seven built-not-a-file spans
Ruling 2, lookup case-folded:
  exit 1: FAIL: built-not-a-file [skills/paper/Templates/VENUE.tex]: expected exit 1, got 0
Ruling 3, no-row error removed (`if not count` -> `if False`):
  exit 1: FAIL: built-later: expected exit 1, got 0: ok: .../built-later.md
Ruling 3, rebuild later rows counted as rows of the --built skill:
  exit 1: FAIL: built-later: expected exit 1, got 0: ok: .../built-later.md

--built over the current list:
$ python3 -B utils/check_coverage.py --built paper docs/academic-coverage.md <hub> <four skills>; echo $?
usage error: .../2b-8/skills/paper: not a folder
2
Per-skill `rebuild:` / `rebuild later:` row counts in docs/academic-coverage.md (grep -c):
writing 3/0, code-comments 0/0, paper 30/11, paper-review 21/3, rebuttal 7/0, grant 0/0,
literature 19/6, idea 3/0, scaffold 0/0, project-docs 0/0, researcher 6/1, submit-manuscript 1/0,
submit-grant 0/0
Scratch git repo with a copy of the list and roadmap and skills/<s>/SKILL.md for each s:
code-comments: docs/academic-coverage.md:0: --built names 'code-comments', but no row of the sections read is marked 'rebuild: code-comments'  exit 1
grant, scaffold, project-docs: the same error, exit 1
writing: :78 and :102 "names no file of skills/writing/ in backticks", exit 1 (expected until re-marked)
```

### Spec

none

### Proof

none

### Standards

1. `docs/academic-coverage.md:26`: "Once a new skill is built, the same check with `--built <skill>` (repeatable) also fails a row marked `rebuild: <skill>` whose reason names no file of `skills/<skill>/` in backticks, and fails when no row of the four skills is marked `rebuild: <skill>`." This sentence is about 45 words and states two failure conditions. The line-14 addition, "Once the skill is built, the reason also names, in backticks, the file of the new skill that holds what the file did, as a repository path such as `skills/paper/SKILL.md`; paths of the source skill may stay beside it.", is about 40 words. Both break prose standard E, sentence length (`skills/repo-setup/templates/docs/dev/prose-standard.md`, "under roughly 20 words unless the mechanism needs more"). Line 26 splits into one sentence per failure condition without losing anything.
2. `docs/academic-coverage.md:26`: "A path counts only when it starts `skills/<skill>/` and is a file there: a folder, a link, a case variant of the name and the source skill's own paths do not count." A span not in normal form, such as `skills/paper/./SKILL.md` or `skills/paper/../paper/SKILL.md`, names a file that exists there but does not count (the built-not-a-file cases; docstring lines 40-42 state it). The page's list leaves it out. This is the page where the option is shown, so it is covered by change standard rule 5 (`docs/dev/change-standard.md:17`).

### Behaviour

1. `utils/check_coverage.py:315-318` (ruling 3, the no-row error) against `plan.md` step 10: "a gate for each of entries 3 to 14 that checks its `rebuild:` rows through step 8's mode". In the current `docs/academic-coverage.md`, `code-comments` (entry 4), `grant` (8), `scaffold` (11) and `project-docs` (12) have no `rebuild:` or `rebuild later:` row. `--built <skill>` for any of them exits 1 with ":0: --built names '<skill>', but no row of the sections read is marked 'rebuild: <skill>'", even once the skill exists (probe above). No re-marking can clear this, because no source file belongs to those skills. A step 10 gate that uses `--built` for entries 4, 8, 11 or 12 can therefore never pass. Step 10 has to leave `--built` out of those four gates, or the mode needs an explicit way to express "no rows expected". Neither the report's user-visible changes nor the page at line 26 states this. Entry 15.A's gate works: paper, paper-review, literature and researcher all have `rebuild:` rows (30, 21, 19, 6). Today `--built` exits 2 for any new skill, because no `skills/<new skill>/` folder exists yet ("skills/paper: not a folder"), which is what the docstring's usage errors say.

## Not checked

- Behaviour on a case-sensitive file system (Linux) and the NFD span against an NFD-stored file on a file system that keeps the forms distinct. The lookup no longer touches the file system, so the result should not depend on it, but not verified.
- Reverts R2a-R2d, R3a, R3b, R4d-R4j and R5a-R5c of the report were not rerun in this round. Only the reverts of rulings 1, 2 and 3 above and the round-start run were rerun.

Reviewer usage: 115,791 tokens, 24 tool uses, 431 s (the runner's completion notification).

## Closed

- First review: every finding closed in repair round 1 (see `8-report.md`, "Repair round 1"), under the five rulings sent with it.
- Review over round 1, fixed at landing:
  - Standards 1: `docs/academic-coverage.md` lines 14 and 26 split into sentences of one condition each.
  - Standards 2: the page names a path not in normal form among the spans that do not count.
- Review over round 1, carried into step 10 (`plan.md`, step 10): Behaviour 1, the gates of entries 4, 8, 11 and 12 leave `--built` out, since those skills have no `rebuild:` row; with it, the builder's note that `--built` proves only that the named file exists, so each gate that uses the mode also requires a checked record per built row.
- The report's Doc text for `README.md:126` applied at landing, in sentences of one idea each.
- The landing fixes were read by a fresh reviewer (`8-landing-review.md`). Its findings are fixed at landing: the `README.md` bullet names the check as the subject of every pass, failure and exit status, groups the cases by what they are, and opens its sentences in different ways; `docs/academic-coverage.md` line 14 is split into one statement per sentence and names the two files apart, line 26 is split further, and the page says a `--built` pass shows only that the file exists, not that it holds what the listed file did.
