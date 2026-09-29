# Step 9 brief check (on main at c0aa87c)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/9.md`. Nothing was changed: `git status --short` printed only `?? .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/briefs/9.md`, and `git log -1 --oneline` printed `c0aa87c Book step 8 of plan 2.D, the tag and pin`.

## 1. Names

- "glossary", `docs/glossary.md`: `git grep -n -i 'glossary' -- skills docs utils README.md .agents/plan.yaml CLAUDE.md`. Hits outside the paths: `docs/academic-coverage.md:87` (another file), not made false; `docs/roadmap.md:24`, 2.D's goal, not made false; `docs/roadmap.md:31-33`, entry 2.E `grill`, not made false (see the `grill` finding); `docs/roadmap.md:171,173`, entry 18, not made false.
- `skills/repo-setup/templates/docs/` and the files `/repo-setup` writes: `git grep -n 'templates/docs' -- ...` and `git grep -n -i -e 'ADR folder' -e 'docs/adr' -e 'prose standard' -e 'building page' -- ...`. Hits outside the paths:
  - `.agents/plan.yaml:12` (`standards:`): not made false; the glossary is no standard, and builders reach it through the new bullet in `skill-layout.md`.
  - `skills/ordo-init/SKILL.md:56`: not made false.
  - `README.md:81` "After your approval it writes `CLAUDE.md`, the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE` and `README.md`.": made incomplete, outside the path list.
  - `skills/repo-setup/templates/CLAUDE.md:15-20`, "Read before you act", which lists each `docs/` page the setup writes: made incomplete; a new repository gets `docs/glossary.md` that no line of its `CLAUDE.md` tells an agent to read. Outside the path list.
  - `README.md:27`, `skills/plan-help/SKILL.md:48`: summaries, not made false.
  - `skills/repo-setup/SKILL.md:28`, 146, 149: inside the paths, not made false.
  - `skills/repo-setup/SKILL.md:39-41` (Steps 3: a `<...>` placeholder "is never written as `<...>`") and its Anti-patterns row 4: item 2's template carries placeholders in a comment, as the `roadmap` template already does; the brief does not say the comment follows the roadmap template's form.
  - Scripts: `grep -n -i 'docs/' skills/repo-setup/templates/sync_rules.py skills/ordo-init/templates/check_config.py` printed nothing.
- `grill`: `git grep -n -w 'grill' -- skills docs/dev README.md utils .agents` exits 1, and `ls skills` lists no `grill`. Item 2's "`grill` writes a term here as the interview settles it" is false in every repository set up before entry 2.E lands.
- The new `skill-layout.md` bullet against "step" and "case": `git grep -n -w -i -e 'step' -e 'case' -- docs/dev/skill-layout.md docs/dev/change-standard.md docs/dev/blind-comparison.md`. `docs/dev/skill-layout.md:20,21` use "each case the skill is for" (a trigger case); `:42,51,61,62` use "step" for an item of a skill's Steps; `:76` uses it for a plan step; `git grep -o -E 'Steps [0-9]+' -- skills | wc -l` prints 102. Item 1 defines each term once; under "used only in the sense it defines there" those uses depart. Case 3's sweep covers `skills/` only.
- `skill-layout.md` line 3: not made false.
- `skill-layout.md` line 64 ("Roadmap entry 23, the pruning pass, applies them to every existing skill"): `grep -n -A4 '^## 23\.' docs/roadmap.md` shows entry 23's goal naming three rules and its gate reviewing deleted sentences; nothing there applies the term rule, so line 64 and Decision 4 / Case 3 are unsupported for the new bullet.
- The five sample definitions, sections checked with `grep -n '^#' skills/{spec,plan,plan-orchestration,land,refute}/SKILL.md` (each exists):
  - brief: "the one file a builder works from" is false; a builder also works from the round's brief (`plan-orchestration` line 95) and the cases ruling `agents/briefs/<step>-cases.md` (`plan-orchestration` line 83, `refute` line 36).
  - ledger: "written only on main" is stated in `land` Steps 5 (line 59) and line 158, not in plan Steps 1 and 5; without land's qualification it contradicts `plan-orchestration` line 63 (the builder writes its report in the worktree's copy of the ledger).
  - landing: holds.
  - finding: its parts are stated in refute Steps 6 and `templates/report.md`, not the two sections named; brief-check findings are closed by a change to the brief or a stop (spec "The brief check" item 4) and carry no failure scenario.
  - open item: `land` Stops row "A worktree that cannot be removed" (lines 178, 183-184) and `plan-orchestration` lines 179-180 hold open items closed by running the removal, with no options and no ruling.
- Terms the skills do not use: "critical failure" 0 (used in `docs/dev/blind-comparison.md:9`), "pin" 0 (used in `README.md` and `utils/pin.sh`); the opening paragraph's "each term the Ordo skills use" is false for them.
- Terms the list lacks, `git grep -i -o -w -- '<term>' -- skills | wc -l`: "the delta" 8; "the loop" 12; "passed its bar" 3 and "bar"; "earned"; "Closed" 36; "shared-rules block" 14; "plan skills" 13 and "project skills" 5; "identity" 7; "inline" 13 (perhaps under executor).
- The brief's 48 counts rerun: identical.

Findings:
- `README.md:81` and `skills/repo-setup/templates/CLAUDE.md` "Read before you act" become incomplete, both outside the path list.
- The template's sentence about `grill` is false until entry 2.E lands.
- The term rule conflicts with the uses of "step" and "case" in `docs/dev/skill-layout.md` and the 102 "Steps N" references; the brief defines one sense per term and sweeps only `skills/`.
- `skill-layout.md` line 64 and Decision 4 rest on entry 23 applying the term rule, which its goal and gate do not name.
- Four of the five sample definitions are false or cite the wrong source: brief, ledger, finding, open item.
- The opening paragraph's "the Ordo skills use" is false for "critical failure" and "pin".
- The term list misses: delta, the loop, passed its bar, earned, Closed, shared-rules block, plan skills and project skills, identity.
- Item 2's comment placeholders against `repo-setup` Steps 3.

## 2. The step line

- "`docs/glossary.md` in Ordo, defining each term ...": item 1. "a glossary template in `skills/repo-setup/templates/docs/`": item 2. "which `/repo-setup` installs": item 3, with item 5. "`docs/dev/skill-layout.md` says a term is used only as the glossary defines it": item 4. The check: served by `/spec` and `/refute`.

Findings: none.

## 3. Premises

- Every premise command rerun matches the brief: `ls docs`, `ls skills/repo-setup/templates/docs`, the glossary greps (roadmap lines 24, 31, 32, 33, 171, 173), rows A and B, `docs/dev/skill-layout.md` lines 56 to 64 and 59, `skills/repo-setup/SKILL.md` (version 1.1.2, lines 28, 112-114), the length command (630; 1022 the highest), README line 13, the 48 term counts, and the tree line's alignment (column 34).

Findings: none.

## 4. Cases and checks

- Case 1: consistent. Case 2: consistent. Case 4: consistent. Case 5: consistent.
- Case 3: against `docs/dev/change-standard.md` rules 12, 14 and 19, the case leans on `skill-layout.md` line 64 and on entry 23, whose goal and gate do not name the term rule, so the listed departures have no place that closes them; the sweep leaves out `docs/dev/`.
- Item 1's opening paragraph both restates the term rule and names its section, against `docs/dev/skill-layout.md`, "Where a rule goes".
- The "Stated in:" tail is an entry format, judged consistent with prose standard D.

Findings:
- Case 3 against rules 12 and 19.
- Item 1's opening paragraph states the term rule a second time.

## 5. The question

- Case 1: no. Case 5: no.
- Case 2: yes; the shared pairs already count once among the 48, so "less the three shared bullets" asks for 45 and passes with three terms missing.
- Case 3: yes; it passes with departures listed and none closed.
- Case 4: yes for item 2; no case checks the template, and item 4 needs a reading beyond the word "glossary".
- The step line's check: yes; a refuter report with verdicts of violated meets it; the plan gate's reading clause carries the content.

Findings:
- Case 2's count passes with three terms missing.
- No case checks item 2.
- The step line's check passes on verdicts of violated; the gate's reading clause covers it.

## 6. Implied inputs

- Not a code step.

Findings: none.

## Declined to judge

- Decision 2 (the template holds no entries; the plan skills' terms live only in Ordo's `docs/glossary.md`): the user's call. Row B does not say what the template holds; the plan skills run in every repository `/repo-setup` sets up, and their ledgers use these terms there, while Ordo's glossary is not in that repository's tree. A vocabulary and file-format choice (spec Steps 4).
- The two entry forms: Ordo's entries end with "Stated in:", the template's does not; which form entry 2.E's `grill` writes is 2.E's and the user's.
- Whether `docs/glossary.md` belongs in `.agents/plan.yaml`'s `standards`: a configuration choice for the user; nothing is made false without it.
- The "Stated in" of the other 43 terms: left to the builder.

Agent usage: claude:opus, a fresh agent; 143632 tokens, 39 tool uses, 387 s (from the completion notice). Saved by the orchestrator from the agent's final message.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Declined to judge, Decision 2 and the `standards` question: a stop, open item E in the state file, since what a new repository's glossary holds is a vocabulary and file-format choice and a `standards` entry is a configuration choice.
- Every finding above: closed in the brief the next `/spec` run of step 9 writes after the ruling, each named there; that run's brief check reads it.
