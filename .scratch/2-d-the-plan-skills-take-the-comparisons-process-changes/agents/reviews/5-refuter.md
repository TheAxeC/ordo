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
