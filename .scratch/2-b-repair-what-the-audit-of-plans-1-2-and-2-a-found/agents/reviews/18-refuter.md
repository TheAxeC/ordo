# Step 18 refuter report (on .agents/worktrees/2b-18, base 50066e6)

Reviewer: a fresh claude:opus agent, read-only, under ruling DD. Usage: 242,483 tokens, 67 tool uses, 690 s.

## Verification (rerun by the reviewer)

From the worktree root, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"`:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit 0
```

- Row count and ids: `grep -cE '^\| (1|2|3|4|5|6)-' closure.md` prints 154; `grep -oE '^\| [^ |]+' closure.md | sort | uniq -d` prints nothing.
- Rows per report: 25, 45, 37, 14, 11, 22. Findings counted from the reports themselves: report 1 `grep -cE '^[0-9]+\. \*\*'` 17; report 2 45 (plan-orchestration 11, spec 3, refute 4, land 5, plan 6, plan-help 3, ordo-init 4, roadmap 4, plan-retro 2, repo-setup 3); report 3 36; report 4 `grep -cE '^\*\*[0-9]+\. '` 14; report 5 11; report 6 `grep -cE '^\*\*F[0-9]+|^- \*\*F[0-9]+'` 22.
- Rows by disposition: closed 63, closed then removed 33, ruled 28, no defect reported 17, outside Ordo 6, removed 2, open 5.
- Hashes: `git merge-base --is-ancestor <h> HEAD` ok for all 27 distinct hashes of the disposition column, and for 59782cd, 5b48d11, 643dca8, 9be174e and f23d14a in the evidence column; b059c57f is a research-hub commit.
- Commit subjects and step numbers match the "Usage, orchestrator from step N's landing (<hash>)" lines of `plan.md`.
- Every ruling named is a line of `plan.md` 97 to 139; the report's note that lines 100 and 125 do not end with "(the user)." is correct.
- Each row's where line holds the first 18 characters of its finding cell: no mismatch in 154 rows.
- `git status --short` shows only the two untracked ledger files; the ASCII check over both prints nothing.

## 1. Spec

1. 3-H1 is out of order: its where is `3-checkers.md:3`, before every numbered item of report 3, yet the row sits last in report 3. The brief asks for rows in report order and then in the report's own order, and report 1's unnumbered rows (1-V1 to 1-V5, lines 13 to 17) come before 1-1.
2. 6-F17's finding cell, "F17 (medium): the found-note in state line 102 is out of date or wrong in three places.", is 17 words with no `...`; the brief caps it at 15. The only row over the cap.

## 2. Proof

None. Every count, hash, ruling line, absence command and quoted commit phrase rerun reproduces, among them `ls utils`, `ls skills/plan-orchestration`, `ls skills/plan-retro/templates`, `grep -c collect_findings README.md` (0), `grep -ci codex usage.py` (0), `grep -rn 'queue order' skills/` (nothing), `ls -d home` (fails in the worktree and the main checkout), and `python3 skills/ordo-init/templates/check_config.py /Users/axelfaes/workspace/research-hub` (the three errors, exit 1).

## 3. Standards

None.

## 4. Behaviour

1. 6-F13 and 6-F17 cite research-hub lines that no longer hold the quoted text, and `18-report.md` line 74 repeats them: 6-F13 cites `research-hub/tools/oculus/.scratch/migration/orchestrator-state.md:64` and `:61`, which `grep -n` finds at `:66` and `:63`; 6-F17 cites `:126`, which is at `:129`. The hub file was committed three times at 02:12 to 02:14 (878a2251, d86f6a16, 0b30d62c), after `closure.md` was last written (02:10:28), and at 2c9cb1b1 (02:07:47) those lines also held other text. The dispositions stand; the line numbers are wrong. 6-F16's `:21` holds.
2. 1-4 (`open`): the evidence does not match the report's Fix. The Fix (`1-process-audit.md:55`) is "write the briefs from the template in full", a change of practice; the evidence tests a correction of the archived briefs, which the Fix does not ask for. The report calls 1-1 "the root of most items below" (`:29`), which the table closes by 6458d52 (`skills/plan-orchestration/SKILL.md:316`); ruling `plan.md:97` runs this plan through the skills; this plan's briefs carry the template's sections (for example `agents/briefs/18.md`). The choice is the orchestrator's: (a) `open` with evidence naming what the Fix leaves undone; (b) `closed 6458d52 (step 2)`, as 1-1; (c) a ruling.

Checked and holding: 1-15 (`open`; plan 1's refuter reports unchanged, `5-refuter.md:128` "Round 1's findings are closed in the round"; this plan's `agents/reviews/2-refuter.md` Closed says "every finding closed in repair round 1"); 1-H1 and 3-H1 (`open`; ruling I and the state file's line 76 concern the `alpha` link, not `home/`); 6-F13 (`open`; `plan.md:58` names only the launch-note setup); the six `outside Ordo` rows (report 6's "Outside 2.B's steps" at `6-oculus-changes.md:149-151`, ruling A at `plan.md:107`, `plan.md:58`, ruling C for F21); all 17 `no defect reported` rows; the two `removed` rows (2175c32 deletes "the booked step is worked in queue order"; f821291 removes F2's `launch.sh`).

## Not checked

- Attribution was done by `git log -S'<fix text>' 9be174e..HEAD -- <file>` and by `git show <hash> | grep -cF '<quoted phrase>'` for 6458d52, 3fbc652, a8541ed, e9633bd and fafda10; those five diffs were not read in full.
- 5-8: 3fbc652's `launch.test.sh` checked by grep for the cases the finding names; the test was not run at that commit.
- The 26-commit re-run behind 1-V2 to 1-V4 was not rerun; the rewritten archived booking lines were read.
