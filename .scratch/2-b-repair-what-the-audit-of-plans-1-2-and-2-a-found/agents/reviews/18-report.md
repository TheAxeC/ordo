Everything in the brief is done. Open rows (5): 1-4, 1-15, 1-H1, 3-H1, 6-F13.

# Step 18 of plan 2.B, the closure table: builder's report

## Open items of the state file

`orchestrator-state.md` holds no open items (its "Open items" section lists none).

## The cases' first run

Run before any row was written. Every case got the disposition the brief gives it, and every count matched, so nothing stopped the step.

| Case | Command | Output | Disposition |
|---|---|---|---|
| Counts | `grep -cE '^[0-9]+\. \*\*'` on reports 1, 2 and 5; `grep -cE '^[0-9]+\. '` on report 3 (two of its items carry no bold); `grep -cE '^\*\*[0-9]+\. '` on report 4; `grep -cE '^(- )?\*\*F[0-9]+ '` on report 6 | 17, 45, 36, 14, 11, 22 | as the brief states |
| 6-F4 | `sed -n 27p .scratch/reviews/2026-09-24-audit/6-oculus-changes.md` | `**F4 (ok, checked): the three calls, their arguments and the id line all match.**` | no defect reported |
| 3-check_skill_layout.py-1 | `git show -s a8541ed`; `git merge-base --is-ancestor a8541ed HEAD`; `ls utils` | bullet "Split lines on the line feed only in both checkers, so line numbers are those of grep -n"; exit 0; no `check_skill_layout.py` | closed a8541ed (step 7), removed e3ab45d (step 23, ruling CC) |
| 1-2 | `sed -n 100p plan.md`; `sed -n 122p skills/plan-orchestration/SKILL.md` | "- Models: Opus for the orchestrator and the agents in this plan..."; "**Default.** The orchestrator and every agent run on Claude Opus." | ruled: Models; closed 6458d52 (step 2), f821291 (step 20) |
| 4-14 | `sed -n 73p docs/roadmap.md`; `git show -s 64908e7` | the line the brief quotes; "State how entry 8 uses the coverage in the roadmap" | closed 64908e7 (step 10) |
| 1-H1, 3-H1 | `ls -d home` in the worktree and `ls -d /Users/axelfaes/workspace/ordo/home` | "No such file or directory" twice; no ruling, booking or closed item records it | open |

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| `closure.md` written, one opening sentence and one table | DONE | `grep -cE '^\| (1\|2\|3\|4\|5\|6)-' agents/reviews/closure.md` | `154` |
| Ids unique | DONE | `grep -oE '^\| [^ \|]+' agents/reviews/closure.md \| sort \| uniq -d` | nothing |
| Rows in report order, each where-line holding its finding | DONE | a loop reading each row's where file:line with `sed -n` and matching the first 25 characters of the finding cell | no mismatch other than the 12 rows whose bold label ends in a colon, where the file writes `**Inventory:**` or `**F19 (high):**` and the cell drops the asterisks |
| Every hash an ancestor of HEAD | DONE | `git merge-base --is-ancestor <hash> HEAD` over the 27 distinct hashes of the disposition column | `ok` for 129a3f7, 1e09d35, 2175c32, 3867456, 3ad7ebd, 3fbc652, 415d669, 5fdaa98, 617f8f3, 6458d52, 64908e7, 76a2b10, 774b10e, 789586c, 80c8dc6, 8becbcd, 92a9dac, a8541ed, a9e651b, bcf9a8b, dd75816, e3ab45d, e69b588, e9633bd, f821291, fafda10, fe6d48b |
| Every ruling named is a line of Rulings | DONE | `grep -nE '<pattern>' plan.md` limited to lines 95 to 140 | the audit's recommendations 2a to 2h: 98; 3a, 3b, 3c: 99; Models: 100; Executor: 101; No question-box tool: 102; Every report opens with a position line: 104; A, B, C, D: 107; E: 108; `start` gets no `--transcript` flag: 113; L: 116; M: 117; O: 119; U: 126-127; W: 129; Y: 131; AA: 133; BB: 134; CC: 135 |
| Every evidence line re-read on the tree | DONE | `sed -n '<n>p' <file>` over each file:line cited, `grep -cF` of each quoted commit phrase in `git show <hash>` | each line and phrase present as cited |
| verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | six `PASS:` lines (land.sh and usage.py, check_config.py, sync_rules.py, pin.sh, verify.sh under sh dash, check_coverage.py), nothing from the ASCII check, `verify: 7 commands passed`, exit 0 |
| ASCII only | DONE | `LC_ALL=C grep -n '[^ -~]' agents/reviews/closure.md agents/reviews/18-report.md` | nothing |
| Only the two ledger files written | DONE | `git status --short` | `?? .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/18-report.md`, `?? .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/closure.md` |

## Counts

Per report (`grep -cE '^\| <r>-'`): report 1, 25 rows (17 numbered, V1 to V5, P1, P2, H1); report 2, 45; report 3, 37 (36 numbered, H1); report 4, 14; report 5, 11; report 6, 22. Total 154.

Per disposition, by the leading form of the cell:

| Disposition | Rows | Report 1 | Report 2 | Report 3 | Report 4 | Report 5 | Report 6 |
|---|---|---|---|---|---|---|---|
| closed | 63 | 11 | 23 | 17 | 12 | 0 | 0 |
| closed, then removed | 33 | 0 | 6 | 16 | 0 | 10 | 1 |
| ruled (25 with closed or removed after it, 2 alone, 1 with outside Ordo) | 28 | 11 | 5 | 1 | 2 | 1 | 8 |
| removed | 2 | 0 | 1 | 0 | 0 | 0 | 1 |
| no defect reported | 17 | 0 | 10 | 2 | 0 | 0 | 5 |
| outside Ordo | 6 | 0 | 0 | 0 | 0 | 0 | 6 |
| open | 5 | 3 | 0 | 1 | 0 | 0 | 1 |

The two rows ruled alone are 1-5 (the audit's recommendations 2a to 2h) and 6-F18 (E); the row ruled and outside Ordo is 6-F17 (D, W).

## Judgment calls

- Ids of report 3's last heading, "skills/land/templates/land.sh, usage.py, land.test.sh": `3-land.sh-<n>`, the first tool named.
- A bold label that ends in a colon holds no title, so the finding cell is the label and the first clause after it: the eight "Inventory:" rows of report 2 and 6-F19 to 6-F22.
- Report 4's leading "<n>." is dropped from the finding, as case 4-14 does; report 6's "F<n>" is kept, as case 6-F4 does.
- 3-check_coverage.py-5 and 3-land.sh-6 have no bold title; the cell is the sentence cut to 15 words, or its first clause.
- 1-H1's where is `1-process-audit.md:202`, the text line under its heading at :201; 3-H1's is `3-checkers.md:3`, its bold "Repository state." line.
- "ruled:" leads the disposition when a Rulings line decides the finding, with the commits that carried the ruling after "; ", as case 1-2 does.
- Ruling names are the short names the lines are known by: the letter for an "Open item <L>" line (spec's rule, `skills/spec/SKILL.md:44`), and for the unlettered lines the brief's own names (Models, Executor, No question-box tool, Every report opens with a position line, `start` gets no `--transcript` flag, the audit's recommendations 2a to 2h). The four rulings on line 107 are named A, B, C and D and the three on line 99 3a, 3b and 3c, the letters the lines give them; by spec's rule read literally, line 107's name would be its text before " (", "From the review of the oculus session's changes".
- 1-4 and 1-15 are open. Both are defects of practice in the archived plans whose rule predates this plan (`git log -S` gives 643dca8, an ancestor of 9be174e); no commit of this plan corrects the archived briefs or plan 1's refuter reports, and no ruling decides them.
- 1-H1 and 3-H1 are open: the folder is gone, but no ruling, booking or closed item records the finding, and the rules give no disposition for a finding that ended without a record.
- 6-F13 is open: the demand is research-hub's, and no ruling or `plan.md` text places it outside Ordo; ruling A takes only the findings "for Ordo".
- `plan.md:58` ("7 after 4 and after the oculus session's fixes to its launch-note setup") is taken as the plan's text placing the hub's launch-note setup outside Ordo: 6-F1, F3, F16, F17 (its found-note part), F19, F20. 6-F21 is placed by ruling C's second half, "the oculus session cutting its lock wait to about 2 s" (`plan.md:107`).
- 2-roadmap-3 ("It is equivalent in effect ... No fix is needed") and 2-repo-setup-2 ("It does not contradict the old text.") are no defect reported, by the report's words.
- 1-12's "re-review" in the Done line is read as audit report 2, and the row is closed by ruling O's roadmap change, 80c8dc6.
- A finding whose fix a commit made and a later commit removed with the whole file (rulings U and CC) is "closed <fix>, removed <removal>"; a finding whose object was removed with no fix made first is "removed" alone (2-land-3, 6-F2).

## Defects found on the tree

- research-hub's `.agents/plan.yaml` still carries `launch_note` and `worker_effort` and lacks `libraries`: `python3 skills/ordo-init/templates/check_config.py /Users/axelfaes/workspace/research-hub` prints `error: oculus: required key missing: libraries`, `error: oculus: unknown key: worker_effort`, `error: oculus: unknown key: launch_note` and exits 1. It is the hub's file, outside this worktree; rows 6-F1, 6-F19 and 6-F20 quote it.
- research-hub's `tools/oculus/.scratch/migration/orchestrator-state.md:64` still carries the demand of 6-F13, which its own line 61 books for dropping once the Ordo release carrying plan 2.B is pinned; the pin of v1.1.0 is done (`orchestrator-state.md:42`).

## Wrong in the brief

- Check 4 expects every ruling line to end with "(the user)". Two lines the brief itself names do not: Models (`plan.md:100`) ends with its "Superseded by ruling U" note, and "The plan cut to its goal" (`plan.md:125`) ends with "(The user.)".
- The brief calls the 2a to 2h line "the first ruling line"; the first line of Rulings is option C at `plan.md:97`, and the 2a to 2h line is `plan.md:98`.
- `plan.md:5` and the Goal at `plan.md:9` still say "five reports"; the Gate (`plan.md:13`) and step 18 (`plan.md:48`) say six, and six exist.
