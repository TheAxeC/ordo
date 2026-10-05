# Plan: 2.1 Scripts cut to their jobs

Execution ledger for roadmap entry 2.1 in `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

Every script of Ordo does its job and nothing more, and `docs/dev/scripts.md` lists each one as a development, user or test script with its job: `person-driven.sh`, the git guard with `repo-setup`'s offer and entry 2.G with its plan folder, and every script under `.scratch/` are deleted; `land.sh`, `pin.sh`, `check_config.py`, `plan_cost.py` and `transcript_window.py` are cut back to their jobs, and tests are kept only for `land.sh`, `pin.sh`, `check_config.py` and `sync_rules.py --write`, a few cases each. The change standard and its template copy, the brief template, `/spec`'s brief check and `/refute` say that code handles a case only when that case has happened or would lose work, rule 15 of the change standard is rewritten to match, and the gates of entries 3, 4, 7 and 8 lose their slop clauses while entry 16's gate gains the deletion of `utils/check_coverage.py`. A step costs what its change needs: the brief template and `/spec`'s brief check ask only for cases that check what the step changes, the builder and the reviewer run only the checks of the files the step changes and the ASCII check while the full verify list runs once at landing on main, and a step that changes only text in fewer than 20 lines gets no brief check and one review with no repair round, its findings fixed at landing or raised to the user.

## Gate

`docs/dev/scripts.md` names every file `git ls-files '*.py' '*.sh'` prints, checked by comparing the two lists, and the change standard says a change that adds, removes or renames a script updates the page; `git ls-files` prints no `person-driven.sh`, no `git_guard.py` or `git_guard.test.sh`, no `.py` or `.sh` file under `.scratch/`, and no `*.test.sh` other than those of `land.sh`, `pin.sh`, `check_config.py` and `sync_rules.py`; each cut script and each kept test read by you against its job on the page, with its line count before and after; the anti-slop sentences read by you in each changed text; entry 2.G under "Dropped" with its reason; the gate clauses of entries 3, 4, 7, 8 and 16 read by you; the three process rules read by you in `/spec`'s brief template and brief check, `/refute`, `/land` and `plan-orchestration`, and the first step of the plan that changes only text in fewer than 20 lines run under them, its ledger showing no brief check and no repair round.

- The gate: could this pass without the goal being reached? No, its mechanical parts are exact list comparisons and absent files, and every part that is a judgment (a script cut to its job, a rule sentence, a gate clause) is read by the user.
- Step 1: could this pass without the goal being reached? No, the user reads each changed rule text in place, and the pinned checkout's tag is a fact.
- Step 2: could this pass without the goal being reached? No, the user reads the five gate clauses, and the step's ledger shows whether a brief check or a repair round ran.
- Step 3: could this pass without the goal being reached? No, the page is compared with `git ls-files` line by line, each deleted file must be absent, and the user reads each kept script and test against its job with the line counts beside it.

## Steps, in execution order

- 1 The rules in text: in `docs/dev/change-standard.md` and its template copy, the rule that code handles a case only when that case has happened or would lose work, rule 15 rewritten to match, and the line that a change adding, removing or renaming a script updates `docs/dev/scripts.md`; in `/spec`'s brief template and brief check, cases that check only what the step changes and the "Implied inputs" check narrowed to the same; the builder and the reviewer running only the checks of the files the step changes and the ASCII check, the full verify list at landing on main; a step that changes only text in fewer than 20 lines getting no brief check and one review with no repair round, in `/spec`, `/refute`, `/land` and `plan-orchestration`; `/refute`'s Standards finding of code larger than its job; each changed skill's version raised; at its landing main is tagged and the user runs `utils/pin.sh <tag>`; check: each changed text read by the user in place, and `git describe --tags` in `~/.local/share/ordo-stable` prints the new tag (1 commit) (approved)
- 2 The gate clauses of entries 3, 4, 7, 8 and 16 in `docs/roadmap.md`, as the user approved them when entry 2.1 was added, run as a text step of fewer than 20 lines under step 1's rules; check: the clauses read by the user, and the step's ledger shows no brief check and no repair round (1 commit) (approved)
- 3 The scripts: `docs/dev/scripts.md` listing each script as a development, user or test script with its job; `person-driven.sh`, its test and `skills/diagnose/references/person-driven.md`, the git guard (`git_guard.py`, its test, `git_guard.settings.json`) with `repo-setup`'s offer, every `.py` and `.sh` file under `.scratch/`, and the tests of `checks.sh`, `plan_cost.py`, `transcript_window.py` and `check_coverage.py` deleted, with every text that names them; `land.sh`, `pin.sh`, `check_config.py`, `plan_cost.py` and `transcript_window.py` cut back to their jobs; the tests of `land.sh`, `pin.sh`, `check_config.py` and `sync_rules.py --write` cut to the cases whose failure loses work, breaks the install or accepts a wrong configuration; the verify list of `docs/dev/building.md` and of each open plan's state file kept equal; check: the page compared with `git ls-files '*.py' '*.sh'`, the deleted files absent from `git ls-files`, and each kept script and test read by the user against its job with its line count before and after (1 commit) (approved)
- 4 the closing: `.scratch/2-g-git-guard/` deleted and `/roadmap drop 2.G` run with the user's yes on its diff, the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

### Step 1, Step 0

- Open item A (2026-10-05), step 1, three findings of the brief check (`agents/reviews/1-brief-check.md`, "8. Dictated text") that the brief cannot settle, since each changes what the step builds:
  - A1. The case rule's test. The goal says code handles a case only when it "has happened or would lose work". The bullet before it in the change standard counts as a cost "lost work, a broken installation, a wrong configuration accepted", and step 3 keeps tests for all three. (a) The rule reads "has happened or a wrong answer on it would cost something: lost work, a broken installation, a wrong configuration accepted". Pro: one cost test across the page and step 3; `check_config.py` may still refuse a bad configuration that has not happened yet. Con: wider than the goal's words. (b) Keep "would lose work". Pro: the goal's words. Con: it contradicts the bullet before it and step 3, and `check_config.py` and `pin.sh` could no longer guard a case that has not happened. Recommendation: (a). The lazy option is (b), which leaves the contradiction for a later fix.
  - A2. The scripts-page line. `docs/dev/scripts.md` is written in step 3, so a line in step 1 saying every script is listed there is false on main, and in the pinned skills, until step 3 lands. (a) Move the line to step 3, which writes the page. Pro: never false. Con: changes the approved step list. (b) Keep it in step 1. Pro: the list as approved. Con: a false rule in force between the two landings. Recommendation: (a). The lazy option is (b).
  - A3. What "fewer than 20 lines" counts. (a) Lines added plus lines removed, as `git diff --numstat` gives them. Pro: a fact a command gives. Con: a 10-line rewrite counts 20. (b) Lines changed, the larger of added and removed per file. Pro: closer to "lines changed". Con: still a count, but a less common one. Recommendation: (a), since it is the plain count of the diff; either is a full answer.

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless the configuration block allows more.

- 2 with 3, both after 1.

## Rulings (2026-10-05)

none

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent stopped for another model, the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

## Blocked, and by what

- 2 and 3: step 1 landed and the user's `utils/pin.sh <tag>`, so they are prepared under the new rules.
