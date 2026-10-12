# Step 1, repair round 1

The reviewer's report is `.scratch/2-f-diagnose/agents/reviews/1-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-f-diagnose/agents/reviews/1-round-0.diff` there. The rules file, the no-git rule and the report path are unchanged, and so are the paths. Wording is yours unless a text is given exactly; plain quotes, ASCII, one line per bullet, no history. Line numbers are the worktree's as it stands now.

1. Spec 1, where the hypotheses and the cause reach the user inside a plan. Steps 8 under `plan-orchestration`: the hypotheses are written into the record and the skill goes on; done when the record holds them. Steps 15 (the round's ruling) quotes the hypotheses with their results and the cause, and names the record's path. For a cause not found, the open item quotes the hypotheses and every probe (or every way tried) and names the record's path. Steps 17 inside a plan: the orchestrator's booking at the step's landing names the record's path and states its cause, as `plan-orchestration`'s "Only known fixes" says a cause is noted at landing. `/land`'s own text is widened by step 2, not here.

2. Spec 2, where a found cause goes, by the kind of finding. A finding of the first refutation: its fix and test are the ruling of the next repair round (Steps 15 as now). A finding of the run over the last round: its fix is made at landing, on main, when it is small and inside the brief, and otherwise raised to the user as an open item (as the `refute` skill's "Over a repair round" 7 says), never sent to the builder. A red line: its fix is made at landing when it is inside the brief (as `land` Steps 6 says), and otherwise the cause is written in the step's Step 0 in `plan.md` for `/spec` to carry, never sent to the builder. A brief-check finding: its fix goes into the brief, as the `spec` skill's "Steps / The brief check" 4 closes a finding. Each is one bullet, and the item's Done line covers all four.

3. Spec 3, a brief-check finding. No dispatch entry exists yet, so the "No dispatch entry" refusal applies only to a refuter finding and a red line. For `brief check <n>`, the scratch copy is a detached worktree at main's head (`git worktree add --detach "$tmp/tree" HEAD`, from the main checkout), and the step's brief `agents/briefs/<step>.md` and its brief check's report are read as they stand on disk.

4. Spec 4, a red line. The scratch copy is main's head with the step's whole range applied: `git worktree add --detach "$tmp/tree" HEAD` from the main checkout, then `git diff --binary <base> <branch>`, where the branch is the kept worktree's branch (the worktree folder's name, as the `land` skill's "Removing a step's worktree" names it), applied inside the copy with `git apply --3way`. The dispatch entry then reads `landing: backed-out`, and that is what "What it reads" 3 finds.

5. Spec 5: `templates/diagnosis.md` gains a section for the case where no red command could be built: each way tried, with what it gave. Steps 4's Done line and the "No red command" and "The cause not found" rows name that section.

6. Spec 6: in Steps 9 every probe's change is undone before the next step, the one that turns the red command green included, so Steps 12 runs the test on the tree without the fix and Steps 13 makes that change again as the fix.

7. Spec 7: "What it reads" 5 for `red line` reads the failure under the step's Step 0 in `plan.md`, and also the open item when the landing booked one (`land` Steps 6 books it there only when only the user can decide).

8. Standards 1: each rule is written once. `SKILL.md:70` and `:93` restate Anti-patterns rows 2 to 4; replace each with a pointer to the Anti-patterns row. `:122` restates Rules bullet 2; point at "Rules".

9. Standards 2: one action per Steps item and one rule per bullet: split `:108` (write the test; run it on the tree before the fix), `:128` (the commit bullet; the record shown; its copy removed), `:94` (run the red command; record the four fields), `:89` (show and wait; re-rank from the reply), each part its own item or bullet with its own completion criterion, renumbering as needed and keeping every cross-reference right.

10. Standards 3: `Triggers on:` adds phrases for a slow symptom and one seen only sometimes, such as "why is this slow", "this got slower", "this test is flaky", "fails only sometimes", and "this is broken".

11. Standards 4: **case, of a diagnosis** names the Steps where the skill uses it (check with `grep -n -w -i case skills/diagnose/SKILL.md` after the round); **probe**'s first sense names `spec`, "What it reads" 5 only. Then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`.

12. Standards 5: the cause not found has one definition, the same in Steps, Stops and the glossary: the second list falsified; no probe separates the hypotheses left; under `plan-orchestration`, no red command can be built; under `plan-orchestration`, the redacted output is not enough. The skill and the template say "result" (red or green; falsified or still standing) instead of "verdict", which the glossary reserves for a reviewer's and a judge's judgment.

13. Standards 6: with no rules file, the rule the skill states is that a defect in code whose failure costs something (lost work, a broken installation, a wrong configuration accepted) begins with a test that fails on the tree as it is, so Steps 12 and Rules say the same.

14. Behaviour 1: the step's diff is taken with `git diff --binary <base>`; `$tmp` is made with `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`; before the copy is made, the output of `git status --short` and `git diff --binary <base> | shasum` from inside the step's worktree is written into the record, and the Done lines of Steps 2 and 15 compare against that record.

15. Behaviour 2, the choices left open:
    - A defect that is not on the checkout (an older commit, with or without a patch, as the defect of plan step 3): the scratch copy is built the same way from that commit and patch, by a person too.
    - The red command asserts every part of the exact symptom (both halves of a two-part symptom), so the shrink keeps what either part needs.
    - Each of the three runs starts from the same state: the red command sets its state up itself, or a fresh scratch folder per run.
    - A red command of the first way (a failing test at the place the defect occurs) may be the test of Steps 12; the record says so.
    - Outside a plan, the session drafts the commit message's last bullet and commits only as the repository's commit rule allows (glossary **commit rule**); otherwise it shows the bullet for the user.
    - For a cause not found run by a person, the record is shown whole before the cleanup, and the cleanup keeps the record; Steps 17 is not run.

16. Behaviour 3: outside a plan, a "No test reaches it" is also named in the commit message's last bullet, so the missing place for a test outlives the session. The person-driven red command stays described in words; a shipped script for it needs Axel's approval of what it computes and is raised by the orchestrator as an open item, not built here.

17. Proof 1: the report's dry run is redone against the skill as it stands after this round, with three hypotheses none of which the shrink has already falsified, and the choices left open that remain.

After the changes, rerun from the worktree root: every case of the brief, the description length command, the glossary sync check, the ASCII grep over every changed file, and the verify list as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"`, quoted verbatim. Read the skill again against `docs/dev/skill-layout.md` rule by rule and say what you found.

Append to the same report, `.scratch/2-f-diagnose/agents/reviews/1-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands with their output verbatim, and the readings; correct any earlier passage of the report that no longer holds. Your final message is that section.
