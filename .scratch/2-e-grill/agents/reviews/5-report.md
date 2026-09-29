# Step 5 report: the default C++, Python and TypeScript coding-standards pages

Everything in the brief is done.

## Open items of the state file, verbatim

- B (2026-09-29, found by step 5's brief check). Roadmap entry 11's goal (`docs/roadmap.md:108`) names "the Python standard (ruff, pyright in standard mode, Python 3.10 or newer) and the C++ standard", which step 5 of this plan delivers as `coding-standards/python.md` and `cpp.md`. After step 5 lands, entry 11 names work already done. Entry 11's gate does not check the standards, so only its goal is affected. Options: (a) at step 5's landing, change entry 11's goal to "`repo-setup` renamed to `scaffold`, with the `library` and `research-project` profiles, hub-specific config, and Ordo's own `CLAUDE.md`." through `/roadmap`, in one commit, the approval of this option being the approval of that diff; (b) make the same change at 2.E's closing step; (c) leave entry 11 as it is. Recommendation: (a), since the entry is wrong from the moment step 5 lands and the change is one line. (b) leaves the roadmap wrong for the rest of the plan; (c) is the lazy option, leaving a roadmap entry that asks for work that exists. Step 5 does not wait on this ruling.

## Cases, first run on the unchanged tree

`ls skills/repo-setup/templates/docs/dev` printed `change-standard.md` and `prose-standard.md` only.

| Case | First run |
|---|---|
| Each page holds every section of item 1, 2 or 3 (reading) | Fails: no page exists to read. |
| Every tool rule named is in the page's starting configuration (reading) | Fails: no page exists. |
| No page repeats a rule of `common.md` or `design-principles.md` (reading) | Fails: no page exists. |
| Project-name command | Exit 1. `ls: coding-standards/cpp.md: No such file or directory`, the same for `python.md` and `typescript.md`. |
| Svelte command | Exit 1. `ls: coding-standards/typescript.md: No such file or directory`. |
| ASCII and dash-aside command | Exit 1. The same three `ls` errors. |
| No hard wrapping, no semicolon run, no repeated trailing field (reading) | Fails: no page exists. |
| On the unchanged tree every case fails | Holds, as the rows above show. |

No case is wrong under the brief's own rules, so no hand-back was made.

## DONE / NOT DONE

| # | Item | State | Command and output |
|---|---|---|---|
| 1 | `cpp.md` with the ten sections of item 1 | DONE | Read in full against item 1. Headings (`grep -n '^## ' cpp.md`): Language and tooling, Errors, Construction, Headers and includes, Naming, API shape, `struct` and `class`, Members and accessors, Containers and memory, Documentation comments. |
| 2 | `python.md` with the six sections of item 2 | DONE | Read in full against item 2. Headings: Language and tooling, Naming, Typing, Errors, Module layout, Files and processes. |
| 3 | `typescript.md` with the six sections of item 3, Svelte last | DONE | Read in full against item 3. Headings: Language and tooling, Types, Names and unused values, Errors and promises, Modules, Svelte and SvelteKit. |
| V1 | Verify list through the runner | DONE | Output below. |
| V2 | Project-name command exits 0 | DONE | Printed `cpp.md`, `python.md`, `typescript.md` (the `ls`), then `exit 0`. |
| V3 | ASCII and dash-aside command exits 0 | DONE | Printed the three names from `ls`, then `exit 0`. |
| V4 | `wc -l` of each page under 90 | DONE | `72 cpp.md`, `40 python.md`, `49 typescript.md`. |
| V5 | Svelte command hits only at or after the Svelte heading | DONE | Heading at `38:## Svelte and SvelteKit`. Hits at lines 38, 40, 42, 43, 44, 45, 47, 48, 49, and none before 38. |
| V6 | The step adds no test | DONE | `git status --short` prints only `?? skills/repo-setup/templates/docs/dev/coding-standards/`. |
| C | Reading cases: every tool rule is in the starting configuration | DONE | See "Tool rules checked" below. |
| C | Reading cases: nothing repeated from step 4's pages | DONE | Each page read against the list in the brief's "What is on the tree". Where a language form needs a general rule, the page cites it: `cpp.md` cites `../design-principles.md` for the layering rule behind PIMPL, and `typescript.md` cites `common.md` for the file size limit and `../design-principles.md` for no globals. |
| C | Reading cases: no hard wrapping, no semicolon run, no repeated trailing field | DONE | Each bullet is one source line. `grep -n ';'` over the three pages prints nothing. The name of an enforcing tool sits inside each rule's sentence, with the verb varied, and not as a field closing every bullet. No double blank line: an `awk` scan for two blank lines in a row prints nothing. |

Verify list output, verbatim (`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, exit 0):

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
```

These checks cover the repository's tests, the glossary block and the ASCII rule. They do not judge whether the pages' content is right, which the reading cases and the review decide.

## Tool rules checked

- **TypeScript.** Each named typescript-eslint rule was found in the configured set's file under oculus's installed `node_modules`. `@typescript-eslint/eslint-plugin/dist/configs/flat/strict-type-checked.js` holds `no-explicit-any`, `no-non-null-assertion`, `no-floating-promises`, `only-throw-error`, `no-unused-vars` and `no-misused-promises`. `stylistic-type-checked.js` holds `consistent-type-definitions`. `eslint-recommended-raw.js:39` sets `'no-var': 'error'`, and `strict-type-checked.js:13` requires that file. `@eslint/js/src/configs/eslint-recommended.js:29` sets `"no-empty": "error"`. `eslint-plugin-svelte/lib/configs/flat/base.js:28` sets `'svelte/comment-directive': 'error'`. The page configures `svelte/prefer-const` and `svelte/no-restricted-html-elements` itself.
- **Python.** `ruff 0.16.5` was run on a scratch file under a `pyproject.toml` with the page's selection, `select = ["E", "F", "W", "I", "B", "UP", "SIM", "N", "PTH", "ANN", "BLE", "S602"]` and `requires-python = ">=3.10"`. It reported every rule the page names: `I001`, `UP045` (`X | None`), `UP006` (`list`), `N802`, `N801`, `ANN001`, `ANN401`, `PTH110`, `E722`, `S602` and `BLE001`. `E402` was not triggered in that file. `ruff rule E402` prints `module-import-not-at-top-of-file (E402)  Derived from the **pycodestyle** linter.`, a rule of the selected `E` group. `ruff rule PLW1514` prints "This rule is in preview and is not stable", so the page names no tool for `encoding=`.
- **C++.** `clang-tidy` is not installed (`which clang-tidy` prints `clang-tidy not found`). The pages name `readability-identifier-naming` and `modernize-use-nodiscard`, which are inside the `readability-*` and `modernize-*` groups the page configures. Whether they report exactly as stated was not verified by a run.

## Files

| File | Lines (`wc -l`) |
|---|---|
| `skills/repo-setup/templates/docs/dev/coding-standards/cpp.md` | 72 |
| `skills/repo-setup/templates/docs/dev/coding-standards/python.md` | 40 |
| `skills/repo-setup/templates/docs/dev/coding-standards/typescript.md` | 49 |
| `.scratch/2-e-grill/agents/reviews/5-report.md` | this report |

## Judgment calls the brief left open

1. Each bold label of items 1 to 3 is a `##` heading, and the rules under it are bullets. The Svelte heading is `## Svelte and SvelteKit`, and its first line says the section holds only in a repository that uses Svelte or SvelteKit. Source: brief, "What to build" ("Sections follow in the order below"), and the prose standard's "Headings are labels".
2. `cpp.md` "Errors" writes the throwing-call replacements as one sentence listing pairs, which avoids four repeated "gives way to" sentences. "A checked access" carries the examples `has_value()` and `std::get_if`. Source: the brief's "each rule in the concrete form" and the prose standard's section 0, repeated construction.
3. `[[nodiscard]]` on functions returning a result is stated once, under "Errors". "Members and accessors" states it for accessors, the case `modernize-use-nodiscard` reports, since that check covers const member functions. Source: skill-layout's "A rule is written once", applied to the page, and the brief item 1 "Members and accessors".
4. The allocator-aware rules are nested bullets under one bullet that carries the `<yes or no>` condition, one rule per bullet. Source: skill-layout, "Lists and tables", one rule per bullet.
5. Short reasons were kept as one clause where the sources give them: `modernize-use-trailing-return-type` off because the code declares return types in front, a `.cpp` declaring its exports so a drift fails at compile time (cathedra), no `this->` because `m_` marks members, the member-initialiser rule because another constructor skips a body (cathedra), plain `//` because Doxygen attaches `///` to the next declaration (game-engine), and the rune exclusion because a rune declaration is a `let` (oculus's config comment).
6. Examples are generic names from the sources' patterns: `decodeScript`, `Window::create(config)`, `window.resize(size)`, `dot(a, b)`. None names a source project or its library.
7. `python.md` "Typing" adds "In a signature, ruff's `ANN401` refuses it" to the `Any` rule. `ANN` is in the brief's starting set, and the scratch run printed "ANN401 Dynamically typed expressions (typing.Any) are disallowed in `Load`". Without the sentence, a reader of the page would expect `-> Any` to pass the configuration. Item served: item 2 "Typing".
8. `python.md` "Module layout" names `E402` for imports at the top, since `E` is in the starting set. Item served: item 2 "Module layout".
9. `python.md` "Files and processes" states the `PTH` rule as "ruff's `PTH` rules flag an `os.path` call where a `Path` method serves", which is what `PTH110` printed.

## Anything in the brief that was wrong or impossible

- Item 2 "Naming" ends "(ruff's `N` rules)" after a list of modules, functions, classes, module constants and the `_` prefix, which reads as `N` enforcing all of them. The scratch run reported `N802` for the function `Load` and `N801` for the class `my_class`, and no `N` rule for the module file `BadMod.py`. No `N` rule requires `SCREAMING_CASE` for a module constant (`ruff rule N816` says it checks only for global names in `mixedCase`), and none checks the `_` prefix. The page therefore says "A function or class name in another case fails ruff's `N` rules", and the other naming rules are checked by reading. The content of item 2 is unchanged: only the scope of the tool claim is narrowed to what the tool does.
