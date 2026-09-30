# Step 5 brief check (on main at a5e560b)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/5.md`. No file was changed. Saved by the orchestrator from the agent's final message, condensed where it lists hits that stay true or checks that held. Step 4's brief changed on disk while the check ran; the agent read its last version.

## 1. Names

- `git grep -n` of the three paths, `coding-standards/` and `coding-standards`, and of `python standard|c\+\+ standard|typescript standard|language page`: hits in `.scratch/2-e-grill/plan.md`, `orchestrator-state.md:73`, `.scratch/comparison-2026-09-28/rulings.md:35`, none made false.
- `skills/repo-setup/SKILL.md:114` and `templates/CLAUDE.md:17` name a single `coding-standards.md`: a lead for step 7.
- `docs/roadmap.md:108`, entry 11's goal, names "the Python standard (ruff, pyright in standard mode, Python 3.10 or newer) and the C++ standard", which this step delivers; ruling O3 changed entry 19 only.

Findings:
- 1.1: entry 11's goal duplicates what this step delivers; not the builder's to change; raise to Axel.
- 1.2: the two single-file lines are a lead for step 7.

## 2. The step line

Every part of the step line and of the plan section's bullets maps to items 1 to 3, except game-engine's and cathedra's Design principles (step 4's page) and Determinism (decision 1).

Findings:
- 2.1: the trailing `Enforced by:` on every bullet is the prose standard's repeated construction, and step 4 dropped it; take step 4's form.
- 2.2: step 4 hands the SvelteKit request-locals rule (oculus `spec.md`) to steps 5 and 6; this brief neither carries nor declines it.
- 2.3: `-fno-rtti` dropped silently.
- 2.4: fixed-width aliases, one project namespace with compound free-function names, lowercase filenames, indices or pools for many-instance values, and the allocator in the member-init list dropped with no decision.
- 2.5: the `std::string` exception to allocator awareness dropped, making the rule stricter than both sources.
- 2.6: the construction rule lets a constructor take collaborators while forbidding their use, and drops `shutdown()`; pick one rule and name it.
- 2.7: the column limit 120 follows cathedra over game-engine's ~100 without a decision.
- 2.8: `no-unused-vars` needs `varsIgnorePattern: '^_'` as well.
- 2.9: TypeScript rules beyond oculus are not under decisions; the default-export and import-cycle rules name no tool of the configured sets.
- 2.10: oculus's tuned rules are dropped silently; `checksVoidReturn: false` belongs in the Svelte section.
- 2.11: the component size rule is Svelte-specific but sits outside the Svelte section; its 600 comes from `spec.md`, missing from Read.
- 2.12: the section lists omit Design principles and "Which std facility to reach for" without saying so.

## 3. Premises

`ls`, `wc -l`, `grep -n '^#'` of both C++ sources, the oculus configuration files, the Python search (`find <root> -maxdepth 4` for `pyproject.toml`, `ruff.toml`, `.ruff.toml`, `pyrightconfig.json`, `setup.cfg` printed nothing), `docs/roadmap.md:108`, `libraries: avoid` and eslint-plugin-svelte 3.23.0's `flat/recommended` all hold.

Findings: none beyond 2.8 and 2.12.

## 4. Cases and checks

The project-name grep behaves as intended on a scratch file (`\brite\b` does not match "write"); the ASCII grep also flags a tab; the 90-line limit is reachable. Tool names verified: pyright `standard`, the ruff groups (a scratch `ruff check` printed "All checks passed!"), `requires-python`, `projectService`, `reportUnusedDisableDirectives`, `consistent-type-definitions`, `no-floating-promises`, `no-var`, `prefer-const`, the three `svelte/` rules, `flat/recommended`, `modernize-use-nodiscard`.

Findings:
- 4.1: the overlap case lists only part of `common.md` and none of `design-principles.md`; items repeat both (globals, third-party types in public headers, one subject per module, errors with what and why, the pinned formatter).
- 4.2: the builder is told not to read step 4's pages and has no text of them to avoid.
- 4.3: several rules would be tagged as tool-enforced by rules outside the starting sets (`PTH`, `PLW1514` preview-only, `S602`, `ANN`, `BLE001`, `cppcoreguidelines-*`, `readability-identifier-naming` options).
- 4.4: `modernize-*` whole includes `modernize-use-trailing-return-type`, which neither source writes (from its documentation; clang-tidy is not installed).
- 4.5: `design-principles.md` is one folder above, not beside, the language pages.
- 4.6: "throws an `Error` subclass" should be "an `Error` or a subclass of it".

## 5. The question

The name, ASCII and missing-file cases guard form only, as intended. Case 1 could pass with a tool named that the starting set does not run (4.3); case 3 could pass with a repeated rule (4.1); the Svelte grep could pass with a Svelte rule not using the word (2.11). Items 1 to 3 as briefed carry the construction contradiction (2.6), the silent drops (2.3, 2.5), the trailing-return check (4.4), and the misplaced size rule and missing option (2.11, 2.8). Axel's reading is the check that proves the goal.

## 6. Implied inputs

Not a code step.

## Declined to judge

- Whether entry 11 shrinks now or at the closing: Axel's ruling.
- Whether the clang-tidy set also drops `readability-magic-numbers`, `readability-identifier-length` and `bugprone-easily-swappable-parameters`: taste, for Axel's reading.
- clang-format, clang-tidy and pyright were not run: not installed.
- `checks.sh` was not run.

Agent usage: 144932 tokens, 33 tool uses, 6.9 minutes (416 s), claude:opus, a fresh agent (from its completion notice).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1.1: raised to Axel as open item B in the state file, with options and a recommendation; "What is on the tree" says so and that the step does not wait on it.
- 1.2: "What is on the tree" names both lines as untouched and carried to step 7 by `plan.md`'s section.
- 2.1: the tool is named inside the rule's sentence, never as a repeated trailing field; a case checks it by reading.
- 2.2: the Svelte and SvelteKit section carries the request-locals rule.
- 2.3: `-fno-rtti` is a repository choice in Errors.
- 2.4: all five carried: aliases as a choice, one namespace with compound names, lowercase file names, indices or pools, the resource in the member-initialiser list.
- 2.5: `std::string` excepted.
- 2.6: RAII is the default; two-phase setup with `initialize(<context>)` and `shutdown()` is the repository choice (decision 2).
- 2.7: decision 3.
- 2.8: both options named.
- 2.9: decision 6; default export checked by reading, import cycle by a placeholder.
- 2.10: decision 7; `checksVoidReturn: false` in the Svelte section.
- 2.11: the size rule moved into the Svelte section; `spec.md` lines 71-76 added to Read.
- 2.12: "What is on the tree" lists every section and says which are left out and why.
- 4.1: "What is on the tree" lists what both of step 4's pages state; the case reads each page against it; the repeating items are reworded to the language's concrete form.
- 4.2: step 4's brief, items 1 and 2, added to Read.
- 4.3: a tool is named only for a rule of the page's own starting set; `PTH`, `ANN`, `BLE` and `S602` added to the ruff set; `encoding=` checked by reading (decision 4); `readability-identifier-naming` set to the cases of "Naming"; a case checks every named rule against the set.
- 4.4: `modernize-use-trailing-return-type` left out (decision 4).
- 4.5: "`common.md` beside it and `../design-principles.md`".
- 4.6: "an `Error` or a subclass of it".
