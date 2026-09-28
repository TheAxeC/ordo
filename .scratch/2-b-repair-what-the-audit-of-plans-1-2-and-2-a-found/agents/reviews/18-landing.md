# Landing report: step 18

Roadmap entry 2.B (Repair what the audit of plans 1, 2 and 2.A found). Plan step 18 (28 of 29): the closure table. Next: the user's rulings on open items HH to KK, then step 19, the closing.

## Open items

- Open item HH (step 18's landing, the landing script and a step with no commit): `land.sh` runs `git cherry-pick <base>..<step>` in the worktree (`skills/land/templates/land.sh:371`, the ledger's copy identical), and a step whose work is only ledger files has an empty range, so the script stops with `error: empty commit set passed` before main's check. Step 18 was landed by hand. (a) A new step 18a before the closing: `land.sh` skips the cherry-pick when the range is empty and goes on to the verify list and the booking output, with a `land.test.sh` case for a step with no commit, and the ledger's copy updated. Pro: the release the closing tags lands every kind of step. Con: one more step before the closing. (b) Leave it, and land a ledger-only step by hand. Con: the skill's only landing path fails on a kind of step plans have; this is the lazy option. Recommendation: (a).
- Open item II (step 18, closure rows 1-4 and 1-15, this plan's own records): 1-4's Fix is "write the briefs from the template in full"; every brief from step 22 on carries the template's sections (`grep -c '^## Cases'` gives 1 for briefs 22, 23, 24, 25, 17, 17a and 18), and the earlier ones lack Cases (1 to 6, 8, 9, 20, 21) or Conventions (23). 1-15's Fix is "list each finding with its closure"; eleven refuter reports of plan 1 and fifteen of this plan give one closure for a group of findings, including those the orchestrator wrote this session (`25-refuter.md:137`). For 1-4: (a) ruled closed by practice from step 22 on, the spent briefs left as they are, since adding sections to a brief after its build would record a brief the builder never read. (b) Keep it open. Con: nothing can close it. Recommendation: (a). For 1-15: (a) a new step 18b rewrites each group closure in those reports into one line per finding with the file:line and check that shows it, from each report's own findings and the round reports, and the orchestrator writes Closed that way from now on. Pro: the records say what closed each finding, as the template asks. Con: a sweep over about 26 reports. (b) Ruled closed by practice from now on, the old records left. Con: the defect stays in the records and the practice has not held this session; this is the lazy option. Recommendation: (a).
- Open item JJ (step 18, closure rows 1-H1 and 3-H1, the untracked `home/` folder): report 3 says of the folder its own probe made "I listed it and removed it. `git status --porcelain` now prints nothing." (`3-checkers.md:3`), and `ls -d home` finds nothing now. No ruling or booking records it. (a) Ruled closed on that evidence. (b) Keep both rows open. Con: nothing is left to do, so they would stay open for good. Recommendation: (a).
- Open item KK (step 18, closure row 6-F13 and the research-hub configuration): the hub still carries the demand that reports open with the open items verbatim (`research-hub/tools/oculus/.scratch/migration/orchestrator-state.md:66`), which this plan's position line now precedes, and books its own drop of it at `:63` once the 2.B release is pinned. Ordo's `check_config.py` on the hub prints `unknown key: launch_note`, `unknown key: worker_effort` and `required key missing: libraries` and exits 1. Research-hub is read-only for this session. (a) Ruled outside Ordo: the hub's own session drops the demand and fixes its `.agents/plan.yaml` (removes `launch_note` and `worker_effort`, adds `libraries`), and this session drafts the note for it, sent only on your yes. (b) Ordo accepts `worker_effort` as an optional key. Con: adds a key no Ordo skill reads. Recommendation: (a).

## The check of Steps 1

The builder and both reviewers had ended: each sent its completion notification, and the runner's agent listing showed no agent of the step running.

## NOT DONE

Nothing in the brief. The landing script could not run the landing (open item HH); the step was landed by hand, with the verify list run on main.

## What landed

`agents/reviews/closure.md`: 154 rows, one per finding of the six reports, each with its disposition and evidence (closed 63, closed then removed 33, ruled 28, no defect reported 17, outside Ordo 6, removed 2, open 5). Verification on main: the six `PASS:` lines and `verify: 7 commands passed`, quoted in the booking in `plan.md`.

## What was found

`agents/reviews/18-refuter.md`: four findings in the first review, closed in repair round 1; two in the review over the round, one fixed at landing and one not reproduced. The five open rows and the landing script's defect are open items HH to KK.

## Next

The user's rulings on HH to KK, then step 19 (the closing).
