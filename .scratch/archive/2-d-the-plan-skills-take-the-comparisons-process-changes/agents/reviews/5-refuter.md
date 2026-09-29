# Step 5 refuter report (on .agents/worktrees/2d-5, base 3024434d6647ce2965e0784508d4464a048a3f00)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
checks.sh on the worktree: PASS land.sh, checks.sh, check_config.py, sync_rules.py, pin.sh, check_coverage.py scratch tests; the ASCII check with no output; checks: 7 commands passed, exit 0
The length command: 726 land, 632 ordo-init, 386 plan-help, 788 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 630 repo-setup, 997 roadmap, 1021 spec
LC_ALL=C grep -n '[^ -~]' over the four changed files and the report: no output, exit 1
git status --short: M plan-help, M plan-orchestration, M spec; ?? 5-report.md, ?? skills/spec/templates/brief-check.md
Case 1 after, grep -c -i 'brief check\|brief-check': spec 13, template 2, plan-orchestration 5, plan-help 2; before 0, 0, 0 and the template missing (the four-file grep exits 2 on the base)
Case 3, git grep -n "spec. skill's .Steps [0-9]\|/spec. Steps [0-9]" -- skills docs README.md: nothing, exit 1, at 3024434 and in the worktree
git grep -n "spec. skill's Steps [0-9]" -- skills docs README.md utils: base plan-orchestration:50, :148, :210; worktree :51, :150, :212 (Steps 1, 1, 5)
git grep -n -i 'brief check' -- skills docs README.md: base nothing; worktree plan-help 2, plan-orchestration 3, spec 11
git grep -n -i 'brief.check\|brief_check' outside the path list: docs/roadmap.md:23 only
wc -l: spec 238 -> 272, plan-orchestration 316 -> 318, plan-help 95 -> 95, template 49 new
```

## Verdicts

Items of the brief's "What to build":

- 1: holds. "### The brief check" after "### A ruling", Steps 1 to 9 unchanged in number, Steps 5 pointing at it, the agent's model, reads, no change, no skill, no agent, `<REDACTED>`, the checks, the report, closing under "Closed", the stop, one run, the commit, `brief_check`, the preflight bullet and row, the description at 1021 naming the check, version 1.7.0. Standards 1, 3 and 4 concern its wording.
- 2: holds. The template's title line, one heading per check, "Declined to judge", usage, "Closed". Standards 2 concerns its wording.
- 3: holds. `plan-orchestration` Steps 3 runs the check and reads the report and the "Closed" changes before dispatch; the brief-check agent among the agents on the reviewer's model; version 2.10.0; description 788. Standards 5 concerns its line 131.
- 4: holds. `plan-help` line 56 names the brief check; version 1.8.3.

Cases:

- Case 1: met (13, 2, 5, 2 lines; on the base nothing, exit 2 since the template did not exist).
- Case 2: met (highest 1021).
- Case 3: met; the pattern matches no existing citation, and the builder's broader grep shows the three real citations unchanged and still true.
- Case 4: met; the report applies the check to brief 5, lists the hits outside the path list and flags Cases 1 to 3 as able to pass without the goal.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

- 1. `skills/spec/SKILL.md:127` and `:214`, and `:238` against `:130`: "A step that goes on runs "Steps / The brief check", after the path comparison and before the preparation commit." / "Steps 5 runs this on every step that goes on, after the path comparison and before the preparation commit (Steps 6):" / "5. The preparation commit (Steps 6) carries the report." / "It holds the brief, the brief check's report, ..."; what is wrong: when the check runs and what the commit carries are each stated in two places (`docs/dev/skill-layout.md`, "Writing for an agent", "Where a rule goes"); failure scenario: a later change moves the check and edits Steps 5 only, and a session following the subsection runs the agent at the wrong point; verdict: none.
- 2. `skills/spec/templates/brief-check.md:37`: "(a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path)"; what is wrong: the list copies `templates/brief.md`'s "Cases" while `SKILL.md` points at it; failure scenario: the brief template's list gains a form and the brief-check agent still checks the old forms; verdict: none.
- 3. `skills/spec/SKILL.md:236`: "At such a stop the brief is restored to main's copy (...), and the report is among the ledger files the stop commits."; what is wrong: two requirements in one bullet (`docs/dev/skill-layout.md`, "Lists and tables"); failure scenario: a session restores the brief and leaves the report uncommitted, the next `/spec` refuses at the preflight, and the stop's evidence is not on main; verdict: none.
- 4. `skills/plan-orchestration/SKILL.md:255` and `:135`, `skills/land/SKILL.md:3` and `:89`: "The landing report states each agent's tokens, tool uses and time" / "read from the dispatch block's `builder_usage` and `reviewer_report`"; what is wrong: `/spec` records the brief-check agent's usage under `brief_check`, which `/land` never reads, so "each agent's tokens" is false until `/land` changes, and the report lists :255 as still true (rules file, rules 14 and 7); failure scenario: the orchestrator treats the `/land` replacement as optional and no landing books the brief-check usage; verdict: none.
- 5. `skills/plan-orchestration/SKILL.md:131`: "**Brief-check agent.** One per `/spec` run, read-only, ..."; what is wrong: `/spec` starts it only on a step that goes on past Steps 5 (rules file, rule 19); failure scenario: an orchestrator resuming after a `/spec` run that waited looks for that run's brief-check report, finds none, and treats the run as broken; verdict: none.

## 4. Behaviour

none

## Declined to judge

- The wording of the four "Doc text" replacements (README.md:17, :34, `skills/land/SKILL.md:89`, `skills/plan/templates/orchestrator-state.md:26`) and whether to apply them at landing; each quoted current line exists as quoted.
- Case 3's pattern matches no existing citation, so the case cannot fail; a brief defect, covered by the builder's broader grep.
- Whether the brief check does its job when it runs; it first runs at step 9.
- Whether 1021 of 1,024 characters leaves room in `/spec`'s description; the description names every behaviour and trigger phrase the old one named; "under libraries: check look for" lacks a comma.
- The subsection states each behaviour once apart from Standards 1 and 2; the single run is stated plainly; the stop path agrees with "Steps / A stop"; "Resuming, and handing the plan over" stays true.

Reviewer usage: claude:opus, a fresh agent; 151227 tokens, 27 tool uses, 325 s (from the completion notice). Saved by the orchestrator from the reviewer's final message, its verification block condensed to the lines it printed.

## Repair round 1, refuted

Reviewer: a fresh agent, no edit, git limited to `git diff` and `git status --short`; it read `skills/refute/SKILL.md` in the worktree, then the inputs in the brief's order. Main holds no change under `skills`, `docs` or `README.md` since the base (`git diff 3024434 HEAD --stat -- skills docs README.md` printed nothing).

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md   (worktree root)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 7 commands passed
exit 0

The gate's length command:
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
630 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md

LC_ALL=C grep -n '[^ -~]' over the seven changed files and the report: no output, exit 1

Case 1: skills/spec/SKILL.md:13, skills/spec/templates/brief-check.md:2, skills/plan-orchestration/SKILL.md:5, skills/plan-help/SKILL.md:2 (exit 0)
Case 3: the brief's pattern prints nothing (exit 1); git grep -n "spec. skill's Steps [0-9]" -- skills docs README.md utils prints plan-orchestration :51 (Steps 1), :150 (Steps 1), :212 (Steps 5)
Case 4: base grep of 'brief check' prints nothing; after: README.md:1, plan-help:2, plan-orchestration:3, plan/templates/orchestrator-state.md:1, spec:11
Builder round items 1, 2 and 4: the greps reproduce (spec :127, :130, :214, :239, :240; counts 0 and 1; brief_check at land:89 and orchestrator-state.md:26)
wc -l: the builder's table reproduces
```

### Verdicts

- Item 1: holds. "### The brief check" follows "### A ruling"; Steps 1 to 9 keep their numbers; Steps 5 (:127) points at it; the subsection covers the model, the reads, the four rules, the six checks, the report and its path, the closing under "Closed", the stop, the single run and `brief_check` (:239, :149); preflight :66 and Stops row :253; description 1022, names the check; version 1.7.0.
- Item 2: holds. The title line is exact; one heading per check, "Declined to judge", usage, "Closed"; line 37 points at `templates/brief.md`'s "Cases".
- Item 3: holds. `plan-orchestration:46-47` and the agents list (:123, :128, :131); version 2.10.0; description 788.
- Item 4: holds. `plan-help:56`; version 1.8.3.
- Case 1: met. Case 2: met (highest 1022). Case 3: met (no numbered citation made false). Case 4: met by reading; the report's count of 16 lines predates the round (18 now, the two new hits inside the widened path list); no decision rests on it.
- Ruling 1: done, the closure real: only Steps 5 says when the check runs and only Steps 6 that the commit holds the report.
- Ruling 2: done, the closure real: the input forms are listed in `templates/brief.md:16` only.
- Ruling 3: done.
- Ruling 4: done on the four paths (`land:89` at 1.8.2, `orchestrator-state.md:26`, README :17 and :34, the report's "Doc text"); Findings 1 and 2 remain.
- Ruling 5: done. Ruling 6: done.
- The first refuter report's Standards 1 to 5 and its declined points: each closed by the round.

### Findings

1. Standards. `skills/plan/SKILL.md:5`, `  version: "1.10.0"`.
   - What is wrong: the round changed `skills/plan/templates/orchestrator-state.md`, and the `plan` skill's version is unchanged, while every other changed skill is raised (spec 1.7.0, plan-orchestration 2.10.0, plan-help 1.8.3, land 1.8.2). The builder was right to leave it to landing: the round widened the path list to the template only, and the builder gave it under "Doc text". It should read `1.10.1`.
   - Failure scenario: `utils/pin.sh` installs a `plan` skill whose template differs from the installed 1.10.0, and a reader comparing versions sees no change.
2. Spec (closure of ruling 4). `skills/spec/SKILL.md:236-240` and `skills/land/SKILL.md:89`.
   - What is wrong: one step can have more than one brief-check run (`plan-orchestration:131`). A run that stops at the brief check commits its report at `agents/reviews/<step>-brief-check.md` and writes no dispatch entry; after the ruling, `/spec` runs the check again, the preflight does not refuse (the earlier report is committed), the new report overwrites the stopped run's at the same path, and `brief_check` records only the second agent's usage.
   - Failure scenario: the first agent's tokens, tool uses and time are missing from the booking and the landing report, so `plan-orchestration:255` is false for that step.
   - Proposed fix: a stopped run's report keeps a path of its own, or `brief_check` lists each run's report beside the first, as `reviewer_report` does for repair rounds.

### Declined to judge

- Whether the brief check does its job when it runs: it first runs at step 9.
- A dispatch entry written by a `/spec` older than 1.7.0 carries no `brief_check`; how `/land` books such a step is not judged, since no step of this plan meets it.
- Item 4's "before the preparation commit" and the template's "made before the preparation commit" concern when findings are closed, not when the check runs, and are not raised under ruling 1.
- `plan-help` "What it reads" 3 does not list the brief-check report; the sentence is not made false, and adding it is outside the round's rulings.
- Prose of the delta: no history, one bullet or paragraph per line, the question quoted word for word at `spec:225` and `brief-check.md:31`, ASCII clean.

Reviewer usage: claude:opus, a fresh agent; 124215 tokens, 31 tool uses, 281 s (from the completion notice). Saved by the orchestrator from the reviewer's final message, its verification block condensed to the lines it printed.

## Closed

- First run, Standards 1 (when the check runs and what the commit carries, stated twice): closed in repair round 1, ruling 1.
- First run, Standards 2 (the template's copy of the input forms): closed in repair round 1, ruling 2.
- First run, Standards 3 (two requirements in one stop bullet): closed in repair round 1, ruling 3.
- First run, Standards 4 (the brief-check agent's usage not booked): closed in repair round 1, ruling 4 (`/land` 1.8.2, the state-file template, README lines 17 and 34).
- First run, Standards 5 ("One per `/spec` run"): closed in repair round 1, ruling 5.
- First run, Declined to judge (the four "Doc text" replacements): applied in repair round 1, ruling 4.
- First run, Declined to judge (Case 3's pattern; the description's comma): closed in repair round 1, ruling 6.
- Round 1, Finding 1 (`plan` version unchanged): fixed at landing; `skills/plan/SKILL.md` reads `version: "1.10.1"`.
- Round 1, Finding 2 (a stopped run's report and usage overwritten by the next run): fixed at landing; `/spec` "The brief check" item 3 gains "When that file already holds the report of an earlier run of the step, one that stopped, the session appends the new report below it, whole, its title line naming the commit it ran on.", item 5 reads "records the report's path under `brief_check`, with each run's tokens, tool uses and time, an earlier run's read from its usage line in the report.", `/land` Steps 9 reads "each brief-check agent's", and the state-file template reads "with each run's tokens, tool uses and time".
- Round 1, Declined to judge (a dispatch entry written before `/spec` 1.7.0 has no `brief_check`): no change; no brief check ran for such a step, so `/land` Steps 9 has no brief-check agent to book and its sentence stays true.
- Round 1, Declined to judge (`plan-help` "What it reads" 3 does not list the brief-check report): no change; `/plan-help` prints where a plan stands from the brief, the builder's report and the refuter report, and no sentence is made false.
- Both runs, Declined to judge (whether the check does its job): judged at step 9, whose check reads `agents/reviews/9-brief-check.md`.
