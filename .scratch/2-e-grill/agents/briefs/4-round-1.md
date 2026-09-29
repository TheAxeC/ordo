# Step 4, repair round 1

Findings of `agents/reviews/4-refuter.md`, each with its ruling. Each ruling stays inside the brief and the rules file. Where a ruling changes wording the brief dictated, this ruling replaces the brief's wording.

The installed repository also holds the change standard (`docs/dev/change-standard.md`, from `skills/repo-setup/templates/docs/dev/change-standard.md`) and the prose standard (`docs/dev/prose-standard.md`). Read both before the changes. A rule one of them already states is cited from these pages by its page and rule or section, never restated in other words. Every path in either page is written from the repository root.

1. Spec 1, placeholders in backticks. Ruling: write every placeholder bare, `<...>`, the form `skills/repo-setup/templates/CLAUDE.md` uses, since `repo-setup` fills each one and a backticked `<...>` in these templates reads as a literal such as `<REDACTED>`.
2. Spec 2, common.md:7 "The repository has one formatter". Ruling: each language has one formatter, its configuration pinned in the repository and run by the verify list as `<the format check>`; a failing format check is fixed by running the formatter.
3. Spec 3 and Standards 1, language-specific terms. Ruling: remove "A public interface names no third-party type." from design-principles.md (step 5's `cpp.md` carries the header rule). Replace "a function over a template" with "a plain function over a generic one", "what its build declaration grants it" with "only the modules it declares as dependencies", and "module-level or static mutable state" with "mutable state at module or class level".
4. Spec 4, the history word list. Ruling: the Comments bullet of common.md no longer states its own rule. It says that comments follow the change standard's rule "No history in code or comments" (`docs/dev/change-standard.md`), which says what a comment carries and what it never carries. design-principles.md's DRY bullet cites that rule by the same page and name.
5. Standards 2: closed by ruling 4.
6. Spec 5, "flags it at `<900>`". Ruling: "`<the size check>` fails the verify list at `<900>`".
7. Standards 3, rules the prose standard states. Ruling: the Character set, Markdown and YAML, and Names bullets cite the prose standard (`docs/dev/prose-standard.md`) by section: section B for ASCII (accented letters in names stay), extended here to every authored file, source code included, and enforced by `<the ASCII check>`; section F for one line per paragraph and per bullet; section D for one term per concept, with `docs/glossary.md` holding the terms. None restates the rule in other words.
8. Standards 4, plan terms. Ruling: "A new case (a view, a backend, a key, a command)" becomes "A new kind of view, backend, key or command"; "A refusal goes through the error type" becomes "A failure is reported through the language's error mechanism".
9. Standards 5, one name per concept. Ruling: "the language's error mechanism" on both pages; "an ADR the user rules on" in place of "the maintainer".
10. Standards 6, binary contrasts. Ruling: at most two ", never ..." or "not X" contrasts per page. State the other rules positively (for example "A member reaches another subject's state through that subject's interface.").
11. Standards 7, paths. Ruling: `docs/dev/coding-standards/common.md` and `docs/dev/change-standard.md`, from the repository root.
12. Declined point, sentence length. Ruling: no sentence past 25 words; split design-principles.md:7 and :13.

Rerun the verify list and every command case of the brief, count the contrasts per page (`grep -c -E ', never|, not ' <page>`) and quote it, and add a section "Repair round 1" to the report with each change and the outputs.
