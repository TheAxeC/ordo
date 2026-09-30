# Step 4 brief check (on main at a5e560b)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/4.md`. No file was changed. Saved by the orchestrator from the agent's final message, condensed where it lists hits that stay true.

## 1. Names

- `git grep -n -i -e 'design-principles' -e 'coding-standards' -e 'design principles' -e 'Coding standards: every language' -e 'common\.md' -- ':!.scratch/archive'`: hits in `.scratch/2-e-grill/plan.md`, `orchestrator-state.md:73`, `.scratch/comparison-2026-09-28/rulings.md:35-36`, `docs/roadmap.md:24-25` and `:171-180`, none made false. The roadmap calls the page both "the design-principles page" (171, 173) and "the design-standard page" (172, 178, 180).
- `skills/repo-setup/SKILL.md:114` and `skills/repo-setup/templates/CLAUDE.md:17` name one file `docs/dev/coding-standards.md`; the step adds a folder `coding-standards/`. True until step 7 wires the pages in.
- `git grep -n -i -E 'invent|no (design|coding)|ships? no|question 6|coding rule|design standard|standard page|adds no other rule|never writes? a rule|rules are the user' -- ':!.scratch'`: `skills/repo-setup/SKILL.md:100`, `:145`, `:156`, `docs/glossary.md:82`, `skills/repo-setup/templates/plan-terms.md:77`. None made false by the two template files alone.

Findings:
- N1 (low): the brief does not name those hits as step 7's work, so a builder may widen the step or report them.
- N2 (low, for step 7): a set-up repository would hold the file and the folder side by side; step 7's brief should carry it.

## 2. The step line

Every part of step 4's line and of the plan section's bullets for the two pages maps to items 1 and 2; "read and approved by Axel" is the plan's check at landing. Against the sources: the YAGNI clause "a public member exists because a caller calls it and is documented where that caller reads" (both C++ sources) is left out; "a check reads a fact" (oculus) is absent; the ten-member limit (cathedra) and the route and UI rules (oculus) are specific. `common.md` adds formatting, names, errors and tests beyond the plan's five conventions.

Findings:
- S1 (low): the YAGNI clause is left out.
- S2 (low): decision 5 should name formatting too and say which rules page each of names, errors and tests comes from.
- S3 (medium): "ruling O6" is about roadmap entries; the rule for templates is "The skills carry no project name and no path" (`README.md`, first paragraph; the change standard repeats it).

## 3. Premises

Every command rerun; all hold, except the oculus `spec.md` range.

Findings:
- P1 (low): the range is given as 72-75 and 70-80; the section runs 71-76.

## 4. Cases and checks

Findings:
- C1 (medium): the name grep misses the source libraries `rite`, `curia`, `monastery`, `missal`, `cockpit` (a word match, since `rite` is in "write").
- C2 (medium): the grep cases print nothing on a missing file (exit 2), so they pass vacuously on the unchanged tree.
- C3 (medium): the dictated content holds 19 semicolons in 390 words; the prose standard's section B allows 2 per 1000 words of running prose. "Three sentences" and the prose standard cannot both hold.
- C4 (medium): a trailing `Enforced by:` on every bullet is the repeated construction the prose standard's section 0 forbids.
- C5 (low): "no hard wrapping" has no check; the spaced-hyphen and `--` asides are not covered.
- C6 (low): "seam" in the open/closed bullet is jargon in a language-independent page.
- C7 (low): the comment rule is stated in both pages, against the DRY bullet's own rule.

## 5. The question

The grep cases could pass without the goal (C1, C2); the reading cases, Axel's reading and items 1 and 2 could not. The placeholders make "a reviewer can check a diff against" depend on step 7 filling them.

Findings: C1 and C2.

## 6. Implied inputs

Not a code step. Findings: none.

## Declined to judge

- Whether `common.md` should carry the four added conventions (S2): Axel's reading.
- Whether "No globals" stands alone or folds into dependency inversion: the plan section lists it separately.
- How the roadmap's two names for the page are reconciled: entry 19 or step 7.

Agent usage: 112374 tokens, 25 tool uses, 4.0 minutes (242 s), claude:opus, a fresh agent (from its completion notice).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- N1: "What is on the tree" lists `SKILL.md` 100, 114, 145, 156, `templates/CLAUDE.md:17`, `plan-terms.md:77` and `docs/glossary.md:82` as untouched by this step and changed by step 7.
- N2: written into `plan.md`, section "The default standards pages (ruling O2)", as carried to step 7, with the roadmap's two names for the page.
- S1: the YAGNI bullet carries the clause.
- S2: decision 5 names all four additions and the source of each; decision 6 names the source rules left out.
- S3: "What to build" cites the README rule and the change standard, not O6.
- P1: both places read 71-76.
- C1 and C2: the name case runs `ls` of both pages and then two greps, one of them a word match for the libraries, and must exit 0; verify 2 names it.
- C3: "What to build" requires short sentences joined by full stops, at most five per principle.
- C4: no trailing field; the check is named inside the rule's sentence, and `design-principles.md` closes with one paragraph on checks (decision 4).
- C5: a dash-aside case with `ls` first, and a reading case for hard wrapping and semicolon runs.
- C6: "registering it at an extension point the code exposes (a registry, an interface)".
- C7: the comment rule lives in `common.md`; the DRY bullet cites it, and a reading case checks it.
