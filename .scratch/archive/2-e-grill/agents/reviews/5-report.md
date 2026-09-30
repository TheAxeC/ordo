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
| V4 | `wc -l` of each page under 90 | DONE | `77 cpp.md`, `43 python.md`, `49 typescript.md`. |
| V5 | Svelte command hits only at or after the Svelte heading | DONE | Heading at `38:## Svelte and SvelteKit`. Hits at lines 38, 40, 42, 43, 44, 45, 47, 48, 49, and none before 38. |
| V6 | The step adds no test | DONE | `git status --short` prints only `?? .scratch/2-e-grill/agents/reviews/5-report.md` and `?? skills/repo-setup/templates/docs/dev/coding-standards/`. |
| C | Reading cases: every tool rule is in the starting configuration | DONE | See "Tool rules checked" below. |
| C | Reading cases: nothing repeated from step 4's pages | DONE | Each page read against the list in the brief's "What is on the tree". Where a language form needs a general rule, the page cites it by its path from the repository root: `typescript.md` cites `docs/dev/coding-standards/common.md` for the file size limit and `docs/dev/design-principles.md` for no globals. `cpp.md`'s header rule stands on its own (ruling 1 of round 1). |
| C | Reading cases: no hard wrapping, no semicolon run, no repeated trailing field | DONE | Each bullet is one source line. `grep -n ';'` over the three pages prints nothing. The name of an enforcing tool sits inside each rule's sentence with the one verb "fails" (ruling 9 of round 1). No double blank line: an `awk` scan for two blank lines in a row prints nothing. |

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
- **Python.** `ruff 0.16.5` was run on a scratch file under a `pyproject.toml` with the page's selection, `select = ["E", "F", "W", "I", "B", "UP", "SIM", "N", "PTH", "ANN", "BLE", "S602"]` and `requires-python = ">=3.10"`. Across two scratch runs it reported every rule the page names: `I001`, `UP045` (`X | None`), `UP006` (`list`), `N802`, `N801`, `N999` (for `pkg/BadMod.py` inside a package, and not for the top-level `TopMod.py`), `ANN001`, `ANN401`, `PTH110`, `PTH123`, `E402`, `E722`, `S602` and `BLE001`. It reported nothing for `contextlib.suppress(Exception)` and nothing for the module constant `MaxSize`. `ruff rule PLW1514` prints "This rule is in preview and is not stable", so the page names no tool for `encoding=`.
- **C++.** `clang-tidy` is not installed (`which clang-tidy` prints `clang-tidy not found`). The page names `readability-identifier-naming` and `modernize-use-nodiscard`, which are inside the `readability-*` and `modernize-*` groups the page configures, and sets `WarningsAsErrors: '*'` so a warning of either is a failure. Whether they match exactly the code the page says they fail is not verified by a run.

## Files

| File | Lines (`wc -l`) |
|---|---|
| `skills/repo-setup/templates/docs/dev/coding-standards/cpp.md` | 77 |
| `skills/repo-setup/templates/docs/dev/coding-standards/python.md` | 43 |
| `skills/repo-setup/templates/docs/dev/coding-standards/typescript.md` | 49 |
| `.scratch/2-e-grill/agents/reviews/5-report.md` | this report |

## Judgment calls the brief left open

1. Each bold label of items 1 to 3 is a `##` heading, and the rules under it are bullets. The Svelte heading is `## Svelte and SvelteKit`, and its first line says the section holds only in a repository that uses Svelte or SvelteKit. Source: brief, "What to build" ("Sections follow in the order below"), and the prose standard's "Headings are labels".
2. `cpp.md` "Errors" gives the throwing-call replacements as a nested list of four items under the `-fno-exceptions` condition. "A checked access" carries the examples `has_value()` and `std::get_if`. Source: the brief's "each rule in the concrete form" and ruling 11 of round 1.
3. `[[nodiscard]]` on functions returning a result is stated once, under "Errors". "Members and accessors" states it for accessors, the case `modernize-use-nodiscard` reports, since that check covers const member functions. Source: skill-layout's "A rule is written once", applied to the page, and the brief item 1 "Members and accessors".
4. The allocator-aware rules are nested bullets under one bullet that carries the `<yes or no>` condition, one rule per bullet. Source: skill-layout, "Lists and tables", one rule per bullet.
5. Short reasons were kept where the sources give them: `modernize-use-trailing-return-type` off because the code declares return types in front, a `.cpp` declaring its exports so a drift fails at compile time (cathedra), no `this->` because `m_` marks members, the member-initialiser rule because another constructor skips a body (cathedra), plain `//` because Doxygen attaches `///` to the next declaration (game-engine), and the rune exclusion because a rune declaration is a `let` (oculus's config comment).
6. Examples are generic names: `parseConfig` (ruling 12 of round 1), `Window::create(config)`, `window.resize(size)`, `dot(a, b)`. None names a source project or its library.
7. `python.md` "Typing" adds "ruff's `ANN401` fails it in a signature" to the `Any` rule. `ANN` is in the brief's starting set, and the scratch run printed "ANN401 Dynamically typed expressions (typing.Any) are disallowed in `Load`". Without the sentence, a reader of the page would expect `-> Any` to pass the configuration. Item served: item 2 "Typing".
8. `python.md` "Module layout" names `E402` for imports at the top, since `E` is in the starting set. Item served: item 2 "Module layout".
9. `python.md` "Files and processes" states the `PTH` rule as "ruff's `PTH` rules fail an `os.path` call or a built-in `open()` where a `Path` method serves", which is what `PTH110` and `PTH123` printed.
10. `cpp.md` "Language and tooling" adds the bullet "The `.clang-tidy` sets `WarningsAsErrors: '*'`, so every warning of a configured check is a failure." Ruling 9 of round 1 makes "fails" the one verb for a configured rule failing the code, and clang-tidy exits 0 on warnings unless the configuration makes them errors. Item served: item 1 "Language and tooling" with ruling 9.
11. `python.md` "Module layout" names `I001`, the rule ruff printed for an unsorted import block, in place of "its `I` rules sort them", since sorting is the fix and `I001` is the rule that fails the code.

## Anything in the brief that was wrong or impossible

- Item 2 "Naming" ends "(ruff's `N` rules)" after a list of modules, functions, classes, module constants and the `_` prefix, which reads as `N` enforcing all of them. The scratch runs reported `N802` for a function, `N801` for a class and `N999` for `pkg/BadMod.py` inside a package. They reported nothing for the top-level module `TopMod.py` or for the module constant `MaxSize`. `ruff rule N816` says it checks only for global names in `mixedCase`, and no `N` rule checks the `_` prefix. The page therefore names `N802`, `N801` and `N999` for what they fail, and says a top-level module name, a module constant and the `_` prefix are checked by reading (ruling 5 of round 1).

## Repair round 1

Rulings from `agents/briefs/5-round-1.md`, with the form of `agents/briefs/4-round-1.md` where the brief's wording differs.

| Ruling | Change, before and after |
|---|---|
| 1 | `cpp.md` "Headers and includes": "A public header hides a third-party type behind PIMPL or an opaque handle. That is the form the layering rule of `../design-principles.md` takes at a C++ header." becomes "A public header names no third-party type. It hides one behind PIMPL or an opaque handle." |
| 2 | `cpp.md` "Containers and memory": "A read-only sequence crosses a function boundary as `std::span`, and read-only text as `std::string_view`." becomes "A sequence crosses a function boundary as `std::span` (`std::span<const T>` when it is read-only), and text as `std::string_view`." |
| 3 | `typescript.md` Svelte section: "`<the size check>` flags it at `<540>`" becomes "<the size check> fails the verify list at <540>". |
| 4 | `python.md` "Errors": the `BLE001` bullet becomes "An `except Exception` handler re-raises or logs the failure. ruff's `BLE001` fails one that swallows it." A new bullet follows: "`contextlib.suppress(Exception)` swallows a failure the same way, and is checked by reading." |
| 5 | `python.md` "Naming": "A function or class name in another case fails ruff's `N` rules." becomes two bullets: "ruff's `N802`, `N801` and `N999` fail a function name, a class name or a package's module name in another naming style." and "A top-level module name, a module constant and the `_` prefix are checked by reading." |
| 6 | Every placeholder is bare on all three pages, for example "The language standard is <C++20>.", "a line length of <100>", "a `printWidth` of <100>". The header path is `include/<lib>/`. `initialize(<context>)` becomes "lives in `initialize`, which takes <the context type>", so no placeholder sits inside a code span. |
| 7 | Contrasts stated positively: "never in one heap allocation each" becomes "with no heap allocation per instance". "never through the process default resource" becomes "The process default resource (`std::pmr::get_default_resource()`) is not used." "never in a constructor body, which another constructor skips" becomes "since another constructor skips a constructor body". The hot-path map rule, the `.cpp` declaration rule, and the TypeScript default-export, view and `catch` rules are also written positively. |
| 8 | The opening sentence of each page becomes "This page adds to `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, and repeats neither." `typescript.md` cites both pages by the same paths in its Svelte section. |
| 9 | Every sentence where a configured rule fails the code uses "fails". Examples: "ruff's `E722` fails a bare `except:`", "`no-var` fails a `var`", "`@typescript-eslint/no-floating-promises` fails any other promise", "clang-tidy's `modernize-use-nodiscard` fails one without it". `cpp.md` adds `WarningsAsErrors: '*'` so that "fails" holds for clang-tidy (judgment call 10). |
| 10 | "case" becomes "naming style": `cpp.md` "sets `readability-identifier-naming` to the naming styles under Naming" and "fails a name in another naming style", and `python.md` "in another naming style". |
| 11 | `cpp.md`'s throwing-call sentence (37 words) becomes a 21-word sentence and a nested list of four items. The `.cpp` export sentence (27 words) becomes "A `.cpp` that exports a symbol declares it in a header it includes itself. A drifted declaration then fails at compile time, before the link." |
| 12 | `decodeScript` becomes `parseConfig`. |

Outputs after the round:

- Verify list (`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`): every line printed PASS or ok, as in the block under "DONE / NOT DONE", ending `checks: 8 commands passed`, exit 0.
- Project-name command: printed the three names from `ls`, exit 0.
- ASCII and dash-aside command: printed the three names from `ls`, exit 0.
- Svelte command: heading at `38:## Svelte and SvelteKit`, with hits at lines 38, 40, 42, 43, 44, 45, 47, 48 and 49. There are none before 38.
- `wc -l`: `77 cpp.md`, `43 python.md`, `49 typescript.md`.
- `grep -c ';'`: 0, 0, 0.
- `grep -c -E ', never|, not '`: `cpp.md 0`, `python.md 0`, `typescript.md 1`. The one is `typescript.md:49`, "A route reaches the server's objects through the request's locals (`event.locals`), never through a module global."
- Longest sentence per page, by a word count over each sentence of each non-heading line:
  - `cpp.md`, 23 words: "A value type with many instances on a hot path lives in an index or a pool, with no heap allocation per instance."
  - `python.md`, 23 words: "ruff's starting selection is the rule groups `E`, `F`, `W`, `I`, `B`, `UP`, `SIM`, `N`, `PTH`, `ANN` and `BLE`, and the rule `S602`."
  - `typescript.md`, 17 words: "A binding the syntax needs and the code does not read is named with a leading `_`."
- `grep -n -w -E 'flags?|reports?|refuses?|requires|rewrites?'` over the three pages prints only `python.md:7`, which holds the key name `requires-python`.
- A grep for `../` and for a bare `common.md` over the three pages prints nothing, so no path is relative to the page.
- `grep -n -w -i 'case'` over the three pages prints nothing.
- ruff 0.16.5 over a scratch package (`pkg/__init__.py`, `pkg/BadMod.py`, and a top-level `TopMod.py` with the same body) printed `pkg/BadMod.py:1:1: N999 Invalid module name: 'BadMod'`, with no `N999` for `TopMod.py`. Both files printed `E402`, `I001` and `PTH123`. Nothing was printed for `with contextlib.suppress(Exception):` or for `MaxSize = 3`.
