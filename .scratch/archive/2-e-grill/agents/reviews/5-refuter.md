# Step 5 refuter report (on .agents/worktrees/2e-5, base e132f9df0629835978d35a93c9fb050a4cd22b2e)

A page this report cites is named with its section, never with a line number. A finding in the new pages keeps its `file:line`. Saved by the orchestrator from the reviewer's final message, condensed where it repeats passing output.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
PASS: land.sh scratch tests
PASS: checks.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
checks: 8 commands passed
exit 0

Project-name, ASCII and dash-aside commands of Cases: exit 0 each
wc -l: 72 cpp.md, 40 python.md, 49 typescript.md
Svelte command: heading at 38, hits at 38, 40, 42-45, 47-49
grep -c ';': 0, 0, 0
grep -c -E ', never|, not ': cpp.md 3, python.md 0, typescript.md 2
Sentences over 25 words: cpp.md:16 (37 words), cpp.md:31 (27 words)
ruff 0.16.5 over a scratch module with the page's selection: UP006, UP045, ANN401, E722, BLE001, N802, N801, PTH118, PTH123, S602, E402, N816
typescript-eslint, @eslint/js and eslint-plugin-svelte config files in oculus's node_modules hold every rule typescript.md names
```

## Verdicts

- Items 1, 2, 3: hold; the findings below concern their wording.
- Cases: all met, except "no page repeats a rule of `common.md` or `design-principles.md`, and cites the general page where it needs the rule": partial, Spec 1.

## 1. Spec

- Spec 1. cpp.md:27: "That is the form the layering rule of `../design-principles.md` takes at a C++ header." Step 4's round 1 removes the third-party-type sentence from `design-principles.md`, so the citation names a rule the page will not hold. Failure scenario: a reader follows it and concludes third-party types in public headers are allowed.
- Spec 2. cpp.md:60: "A read-only sequence crosses a function boundary as `std::span`" narrows the brief's "at boundaries" without a decision. Failure scenario: a mutable `std::vector<T>&` is accepted where `std::span<T>` serves.
- Spec 3. typescript.md:47: "flags it at `<540>`", where the source check fails the run and step 4's round sets "fails the verify list at". Failure scenario: a 560-line component lands and the verify list goes red.

## 2. Proof

- Proof 1. python.md:27: "ruff's `BLE001` flags one that does." On `except Exception: pass`, the page's own `SIM` selection reports SIM105 and suggests `contextlib.suppress(Exception)`, which passes the whole selection while still swallowing. Failure scenario: the lint goes green on a swallowed failure the page says the tool covers.
- Proof 2. The builder's report says no `N` rule checks a module name; `ruff rule N999` is stable and reports `pkg/BadMod.py:1:1: N999 Invalid module name: 'BadMod'` inside a package. python.md:14 narrows the `N` claim partly on this. Failure scenario: module names inside a package are read by hand though ruff refuses them.

## 3. Standards

- Standards 1. Placeholders in backticks on all three pages (cpp.md:7, 8, 16, 17, 22, 26, 36, 40, 64, 65; python.md:7, 8; typescript.md:12, 23, 36, 47, 48), against step 4's bare form; cpp.md:26 "`<include/<lib>/>`" nests one placeholder in another.
- Standards 2. cpp.md holds four ", never"/"not X" contrasts (:31, :62, :66, :67) against the limit of two.
- Standards 3. Paths relative to the page (cpp.md:3, :27; python.md:3; typescript.md:3, :47, :49), against paths from the repository root (skill-layout, "Paths and names"; step 4's round).
- Standards 4. One concept, a configured tool rule failing the code, is named by "fails", "reports", "refuses", "flags", "fails the lint", "as ... requires" and "rewrite" across the pages (prose standard D). Failure scenario: "flags" and "reports" read as warnings.
- Standards 5. "case" for identifier style (cpp.md:11, :38; python.md:14) is a plan term in another sense.
- Standards 6. cpp.md:16 (37 words) and cpp.md:31 (27 words) run past 25 words.
- Standards 7. cpp.md:37's example `decodeScript` comes from a VM's subject; noted for the reading.

## 4. Behaviour

none; no skill installs the pages yet.

## Declined to judge

- Whether clang-tidy's `modernize-use-nodiscard` and `readability-identifier-naming` report as cpp.md states: clang-tidy is not installed.
- Whether each rule is the right default: Axel's reading.
- Which side wins where the brief's wording conflicts with step 4's round-1 form: the orchestrator's ruling.
- Open item B: Axel's.

Reviewer usage: 150395 tokens, 34 tool uses, 5.5 minutes (329 s), claude:opus, a fresh agent (from its completion notice).

## Repair round 1, refuted

Reviewer: a fresh agent, read-only, over the three pages as they stand against the round-0 text, read against the whole step. Saved by the orchestrator from the reviewer's final message, condensed.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
... every line PASS or ok ...
checks: 8 commands passed
exit 0
Project-name, ASCII and dash-aside commands of Cases: exit 0 each
Svelte command: heading at 38, hits at 38, 40, 42-45, 47-49, none before 38
wc -l: 77 cpp.md, 43 python.md, 49 typescript.md
grep -c ';': 0, 0, 0
grep -c -E ', never|, not ': 0, 0, 1
grep -n -w -E 'flags?|reports?|refuses?|requires|rewrites?': only python.md:7 (`requires-python`)
Relative paths, "case", double blank lines: none
Longest sentence: cpp.md 25 words, python.md 23, typescript.md 22
ruff 0.16.5 probe: N999 on pkg/BadMod.py; I001, UP006, UP045, N802, N801, ANN001, ANN201, ANN401, E722, PTH118, PTH123, S602, E402 reported; SIM105 on try/except Exception/pass, nothing for contextlib.suppress
BLE001 reported on: except Exception: pass | log.error("failed") | log.warning("failed %s", e) | print to stderr and sys.exit(1)
BLE001 not reported on: raise | log.exception("failed") | log.error("failed", exc_info=True)
typescript-eslint 8.70.0: strict-type-checked.js:42 no-floating-promises error, :86 only-throw-error error; only-throw-error defaults allowRethrowing, allowThrowingAny, allowThrowingUnknown all true; no-floating-promises accepts .catch or .then with a rejection handler
```

Rulings 1 to 12 of `agents/briefs/5-round-1.md`: each closure reproduces.

### Verdicts

- Items 1, 2, 3: hold. Cases: all met.

### Findings

- Spec 1, cpp.md:10: "The `.clang-tidy` sets `WarningsAsErrors: '*'`" is a configuration default named by no brief item, decision, ruling or source. With it, the documented defaults of `bugprone-easily-swappable-parameters`, `readability-identifier-length` and `readability-magic-numbers` fail code the page prescribes, such as `dot(a, b)`.
- Spec 2, cpp.md:36: "A drifted declaration then fails at compile time, before the link" is false for a free function defined unqualified inside a `namespace` block, whose drifted parameter list compiles as a new overload and fails at the link.
- Proof 1, python.md:29: "re-raises or logs ... BLE001 fails one that swallows it". BLE001 also fails a handler that logs with `log.error` or `log.warning`, and the stderr-and-exit handler python.md:31 prescribes when it catches `Exception`. It passes a re-raise, `log.exception` and `exc_info=True`.
- Proof 2, typescript.md:28-29: "fails any other promise" and "fails any other thrown value". no-floating-promises passes a promise ended by `.catch` or `.then` with a rejection handler. only-throw-error, with its defaults, passes a thrown `any` or `unknown` value and a rethrow.

### Declined to judge

- Whether clang-tidy's checks behave as described: clang-tidy is not installed.
- Whether each rule, and `WarningsAsErrors` itself, is the right default: Axel's reading.
- Open item B: Axel's.

Reviewer usage over round 1: 116266 tokens, 25 tool uses, 5.2 minutes (315 s), claude:opus, a fresh agent (from its completion notice).

## Closed

- Round 0, Spec 1 to 3, Proof 1 and 2, Standards 1 to 7: closed in repair round 1 by rulings 1 to 12 of `agents/briefs/5-round-1.md`; the run over the round reproduced each closure.
- Round 1, Spec 1, `WarningsAsErrors: '*'`: fixed in the step's worktree by the orchestrator before the landing. The bullet is removed, since no brief item or decision names it, and the two clang-tidy sentences say "warns on" (`cpp.md:43`, `cpp.md:61`), since without it a clang-tidy check warns. Whether the default `.clang-tidy` makes warnings errors is put to Axel with his reading of the page.
- Round 1, Spec 2, a drifted declaration: fixed in the step's worktree before the landing. `cpp.md:36` now requires an exported function to be defined by its qualified name (`<name>::parseConfig`). Checked with clang++ -std=c++20 -c: a drifted parameter list defined inside `namespace ns { ... }` compiles, and the same drift defined as `ns::parseConfig` fails with "out-of-line definition of 'parseConfig' does not match any declaration in namespace 'ns'".
- Round 1, Proof 1: fixed in the step's worktree before the landing. `python.md:29` reads "re-raises the failure, or logs it with `log.exception` or `exc_info=True`. ruff's `BLE001` fails any other `except Exception`.", the wording the reviewer's probe supports; `python.md:31` has a command-line script catch the exception classes it expects, which BLE001 passes.
- Round 1, Proof 2: fixed in the step's worktree before the landing. `typescript.md:28` says no-floating-promises fails a promise left with no handler and that one ended by `.catch` passes and is checked by reading; `typescript.md:29` says a thrown `any` or `unknown` value passes only-throw-error and is checked by reading.
