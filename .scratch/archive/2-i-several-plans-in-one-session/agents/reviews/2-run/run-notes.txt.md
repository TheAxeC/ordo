2026-10-12T15:51:06Z /spec 3 1: Steps 5 compared its paths with plan 5 step 1 brief (in flight, dispatch entry in plan 5 state file): both name docs/guide.md lines 3-3; the merge is not simple because plan 3s sentence must stand right after the install sentence plan 5 step 1 adds, which main does not hold; the step waits until plan 5 step 1 lands; brief deleted (main has none), plan.md unchanged, no commit, worktree or dispatch entry.
FINDING: brief template "Verify before you report" 1 asks for the character-set check of the verify list over the changed files, and the brief of plan 5 step 1 wrote it as `git ls-files ... | xargs -0 perl`; plan-orchestration Steps 4 "The prompt" gives the builder the no-git rule, so the builder ran `printf ... | xargs -0 perl` instead (its report, Judgment calls). The spec skill does not say how a git-based verify command is given to a builder who runs no git.
15:57:41Z land 3-2 commit 5c00750
16:00 /spec 3 1 prepared aaa430c; builder a46806818cc0e299c launched; launch commit 3938710; in flight at launch: 1 (plan 5 step 2 still in /spec)
16:01:15Z builder 3-1 report saved
16:03 /spec 5 2 prepared 2d68984 (brief check ab9154be194d9c2f8 109673 tok 20 tu 4m52s); builder a9c4b36b1a7ccc304 launched; launch commit 9534017; in flight at launch: 2 (plan 3 step 1, plan 5 step 2). Reviewer 3-1 a0dfcb46f7a99aa64 sonnet launched ~16:01:30, done; it ran git show outside its allowed git, read-only
16:03:40Z refuter 3-1 saved; 3-1 held for landing after 5-2 (condition 7)
16:07:04Z builder 5-2 report saved; builder raised the pipeline exit; checks.sh runs bash -o pipefail, rc=1 on FAIL
16:07:30Z reviewer 5-2 a99b21923806479bc launched, model read
16:10:33Z round 1 sent to a9c4b36b1a7ccc304 (commit 6a2738f)
16:12:04Z round-1 reviewer 5-2 a23e65e6307fe3c6a launched; builder round 1 133212 tok 8 tu 66s
16:14:11Z round-1 review saved; 3 findings to fix at landing
16:15:19Z land 5-2 committed 9374825 (land.sh 16:14:24-25)
16:16:07Z land 3-1 committed cad4c19 (land.sh 16:15:37-39), PASS line in plan 3 booking
16:17:40Z both closings stopped at roadmap diffs (24c3280, 9907c22); run ends
