# Step 2 brief check (on main at ad40dfc)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/2.md`. No file in the repository was changed; the simulations ran on copies in the session scratchpad. Saved by the orchestrator from the agent's final message, condensed where it lists hits that stay true.

## 1. Names

- The five keys (`git grep -n -- "<key>" -- ':!.scratch/archive'`): outside the paths, hits in `.scratch/2-e-grill/plan.md`, `docs/roadmap.md:24`, `.scratch/comparison-2026-09-28/findings-by-cause.md:954,962` and `1-brief-check.md:35`; none made false.
- This plan's configuration block, `.scratch/2-e-grill/orchestrator-state.md` lines 5-31, holds none of the five keys; after items 5 and 6 it is incomplete against its template, and step 3 reads `worker_effort` from it. The state file is the orchestrator's.
- "configuration block": only `plan-terms.md:18` and `docs/glossary.md:23` list the keys, both in the paths; the other hits name one key each.
- `workers_at_once`: the extra hits (`plan-orchestration/SKILL.md:45,72,206`, `spec/SKILL.md:150`, `docs/glossary.md:38`, `plan-terms.md:33`) list no key set.
- check_config's refusals: only `ordo-init/SKILL.md:90` and the docstring list them, both in the paths.
- `README.md:101-105` tells a reader to copy the example; after items 1 to 3 the example writes `adr: docs/adr`, and a repository without `docs/adr/` is refused with `adr names a folder that does not exist: docs/adr`, which contradicts decision 3.

Findings:
- The README copy instruction becomes a path to an error in a repository without `docs/adr/`.
- This plan's own state file block lacks the five keys step 3 reads; not in the paths and not named as the orchestrator's change.

## 2. The step line

Every part of step 2's line maps to items 1 to 4 and 8; items 5 to 7 are carried by change standard rule 14.

Findings: none.

## 3. Premises

- `plan.yaml` 22 lines and `example_keys()` at 24-32: match; the five item-1 lines parse to the intended defaults.
- `check_config.py` 109 lines, review/libraries at 70-73, kind check at 64-69, docstring 2-11: match; worker/reviewer at 60-63 unnumbered in the brief.
- `check_config.test.sh` 125 lines, header 2-4, PASS on main: match.
- `plan.projects.yaml` 43 lines: match.
- `orchestrator-state.md` block "lines 6-24": the block is 5-23, keys 6-22.
- `plan/SKILL.md:61`, `plan-terms.md:18`, `docs/glossary.md:23`, `ordo-init/SKILL.md` 65-69 and 90: match.
- game-engine and cathedra: `unknown key: worker_effort` matches; they also print `required key missing: libraries` (step 15).

Findings: the state template's block range is 5-23, not 6-24 (minor).

## 4. Cases and checks

- The pass cases fail as written: `make_repo` and `make_projects_repo` create no `docs/adr`, so with the example setting `adr: docs/adr` the cases `complete`, `agents-star`, `libraries-avoid` and `projects` fail, and every error case carries an extra line.
- `design_references: WCAG` and `worker_effort: yes` (and non-string `adr`, `design_bar`, a number for an effort): the kind check at check_config.py:64-69 prints its own line (`design_references is a str, its default is a list: 'WCAG'`, `worker_effort is a bool, its default is a str: True`) before the new one; the brief does not say whether it is kept.
- The Report section omits change standard rule 13's revert table.
- Rule 15's absolute path and a value reaching a path have no case.

Findings: the missing `docs/adr` in the test's scratch repositories; the double error line; rule 13's table missing from the report shape.

## 5. The question

- The several-projects case and item 2 pass without item 2 done (missing optional keys are notes).
- Four of the five defaults are pinned by no case.
- "under the repository root" is pinned by no case: `adr: /tmp`, `adr: ../`, `adr: ""` resolve to existing folders.
- Items 5 to 8 have no command in the verify list; a `git grep -c` of the five names would compute it.

Findings: those four.

## 6. Implied inputs

Missing from Cases: `adr: ""`, absolute `adr`, `adr` outside the repository, non-string `adr`, `design_bar` in capitals, a number, a capitalised word or a boolean for an effort, a wrong `reviewer_effort` word, the projects form for the other keys (and where `adr` resolves there), a key written twice (yaml keeps the last value silently).

## Declined to judge

- Whether `xhigh` and `max` are valid effort levels for an agent definition (step 3).
- Whether the projects example's `adr` is per project or shared.
- Whether the kind line stays beside the new value lines.
- Decision 5 (version lines).

Agent usage: 110579 tokens, 21 tool uses, 4.5 minutes (271 s), claude:opus, a fresh agent (from its completion notice).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- README copy instruction: item 3 makes a missing default `docs/adr` a note, not an error (decision 3); the README then stays true, stated in "What is on the tree" and "Read" item 7.
- This plan's state file block: "What is on the tree" says the orchestrator adds the five keys with their defaults when it rewrites the state file at this step's landing.
- Block range: corrected to lines 5-23, keys 6-22; the worker/reviewer lines 60-63 named.
- The missing `docs/adr` in the test: the pass case now expects the note, and a variant with `docs/adr` created expects none.
- The double error line: item 3 says the value check replaces the kind check for the five keys (decision 5); item 4 and Cases assert exactly one `error:` line per refused value.
- Rule 13's table: added to verify item 6 and to the Report section.
- The several-projects case: now also asserts the five keys in both projects; verify item 5 counts them.
- The unpinned defaults: a case removes the five keys and asserts the five notes with their defaults.
- "under the repository root": item 3 gives the error `adr is not a path under the repository root: <repr>`; cases for `/tmp` and `../elsewhere`; `adr: ""` and `adr: 5` refused as not a folder path (decision 4).
- Items 5 to 8 without a command: verify item 5 counts each key in each file.
- Implied inputs: cases added for capitals, a number, a boolean, a wrong `reviewer_effort`, the projects form for `design_bar` and `adr`, and a key written twice, which item 3 now refuses for every key (decision 6); the projects example keeps one shared `adr: docs/adr` (decision 7).
