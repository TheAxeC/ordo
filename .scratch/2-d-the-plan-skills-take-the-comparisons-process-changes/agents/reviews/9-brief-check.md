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

# Step 9 brief check (on main at 4dda8e2)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on the brief written after the ruling on open item E. Nothing was changed; `git status --short` printed `plan.md` and `orchestrator-state.md` modified and `agents/briefs/9.md` untracked; `git log --oneline -1` printed `4dda8e2 Book the ruling on open item E of plan 2.D`.

## 1. Names

- "glossary", `docs/glossary.md`: hits outside the paths only in `docs/academic-coverage.md:87` and `docs/roadmap.md:24, 31-33, 171, 173`; none made false.
- `plan-terms`, the new markers, `--only`: no hit. The `ordo:` markers: every hit inside the paths.
- "sync", `sync_rules`: `skills/repo-setup/templates/shared-rules.md:3`, `README.md:49`, `docs/roadmap.md:116` not made false; `docs/dev/change-standard.md`, "Commands and their filters" (block at lines 61-69) made incomplete by item 9's new command, outside the paths.
- "shared-rules block": `README.md:27`, `skills/plan-help/SKILL.md:48` summaries, not made false; `skills/repo-setup/SKILL.md:10`, the introduction, made incomplete, inside the paths but in no item.
- Placeholders: `skills/repo-setup/SKILL.md` Anti-patterns row 4 contradicts the amended Steps 3, in no item.
- The tree line: aligned at column 34. README 13, 81, 83-89: inside the paths.
- `standards`: `skills/ordo-init/SKILL.md:67`, `check_config.py:54-56`, `skills/spec/templates/brief.md:3`, `skills/refute/SKILL.md:35`, `skills/plan-retro/SKILL.md:32` not made false; the state file's `standards` and `verify` handed to the orchestrator at landing.
- The five samples: brief states a round-brief path `agents/briefs/<step>-round-<n>.md` that no cited section states; ledger holds against `land` Steps 5 and `plan-orchestration` Steps 4 and 6, `plan.md` and the state file written at `plan` Steps 3 and 4 (minor); landing, finding and open item hold.
- The entry form "Stated in: <skill>, <section>" cannot name a page; `plan-terms.md` is copied into every repository, where `docs/dev/skill-layout.md` does not exist.

Findings:
- `docs/dev/change-standard.md`, "Commands and their filters", made incomplete, outside the paths.
- `skills/repo-setup/SKILL.md:10`, the introduction, made incomplete, in no item.
- `skills/repo-setup/SKILL.md` Anti-patterns row 4 contradicts the amended Steps 3.
- The "brief" sample's round-brief path is stated in no cited section.
- The entry form cannot name a page source, and a plan-terms entry sourced in an Ordo-only page points at nothing elsewhere.

## 2. The step line

Every part served (items 1 to 11, the check by `/spec` and `/refute`); "that section kept equal" read as the plan-terms block, as the approved Rulings line on `sync_rules.py` confirms.

Findings: none.

## 3. Premises

Every premise rerun matches; "The tree" is at heading line 100 (listing 102-118) and "Read before you act" at heading line 13 (bullets 15-20), off by one in the brief and locating the right text.

Findings: none.

## 4. Cases and checks

Every case consistent with the rules file and the standards; the "brief" sample fails the six-terms case (section 1).

Findings: none.

## 5. The question

- Script cases, the existing-test case, six terms, template, items 7-11: no.
- The table and the sweep: yes for the list's completeness; they pass with "worker" (31), "the session" (51), "wip" (8) or "Rulings section" (9) absent.
- `sync_rules.py . --only glossary` exits 0 and the length command: yes on their own; the content is carried by other cases.
- The step line's check: yes on "violated" verdicts; the user's reading covers it.

Findings:
- No case checks the list's completeness.
- The step line's check passes on "violated" verdicts; not closable in the brief.

## 6. Implied inputs

A code step. Missing or partly stated in "Cases": the shared-rules block drifted and no glossary (nothing written); both files in error (one line per file or the first); `--write` with only the glossary differing; `--write` where the first file's write fails; `--only glossary` with a drifted or missing shared-rules block; `--only glossary --write`; `--only` with no value; `--only=glossary`, `--only glossary` before the path, twice; `docs/glossary.md` a directory; a non-UTF-8 glossary under `--write` left unchanged; the glossary's write failures; a marker string inside prose; the texts of the new `ok:`, `written:`, diff labels, order and usage line.

Findings: each of the thirteen above.

## Findings of the earlier run

All closed, except: the "brief" sample (round-brief path); Anti-patterns row 4; the list's completeness (a new finding); the step line's check (not closable in the brief).

## Declined to judge

- Semicolons in glossary bullets under prose standard B.
- Whether the "finding" and "open item" samples restate a rule against Decision 1.
- Whether `/ordo-init` should put `docs/glossary.md` into a new repository's `standards`: the user's scope call.
- The term rule stated twice in a new repository (the template's paragraph and the `CLAUDE.md` bullet).
- The "Stated in" of the other terms: left to the builder.

Agent usage: claude:opus, a fresh agent; 161763 tokens, 39 tool uses, 475 s (from the completion notice). Saved by the orchestrator from the agent's final message, condensed to its findings and the lines it printed.

## Closed (the session's change to the brief for every finding of this run, made before the preparation commit)

- The change standard's command block: item 9 adds the command there, and `docs/dev/change-standard.md` lines 61-69 are in the paths.
- The introduction of `/repo-setup`: item 6's first bullet.
- Anti-patterns row 4: item 6 names the exception there.
- The "brief" sample: it reads "a repair round adds the round's brief", with no path.
- The entry form: every `plan-terms.md` entry names a skill; a term whose only source is an Ordo page goes under Ordo's own terms, which may name a page; the trigger sense of "case" moves there; the "step" sense of an item of Steps names each skill's Steps.
- The list's completeness: "worker", "the session", "wip" and the Rulings section added to item 1; a case has the builder read each skill whole and add every missing term.
- The thirteen implied inputs: item 4 states the order, the atomicity, the error lines, the directory case, the printed lines and the accepted arguments, and "Cases" holds a case for each.
- The ledger sample's "Stated in" names `plan` Steps 1, 3, 4 and 5.
- The premises' two line ranges corrected.
- Declined, the term rule stated twice in a new repository: the `CLAUDE.md` bullet now names the page without restating the rule.
- Declined, `/ordo-init` and a new repository's `standards`: no change in this step; ruling E's second question named Ordo's `plan.yaml`, and the point is raised to the user in the step's report.
- Declined, semicolons and Decision 1: left to the refuter's reading.
- The step line's check passing on "violated" verdicts: no change; the plan's gate reads both reports.
