# Step 5, repair round 1

Findings of `agents/reviews/5-refuter.md`, each with its ruling. Each ruling stays inside the brief and the rules file. The default pages share one form, set by step 4's repair round (`agents/briefs/4-round-1.md`, read it): where the brief's wording differs from that form, the form wins. Step 4's pages as they now stand are in `.agents/worktrees/2e-4/skills/repo-setup/templates/docs/dev/` (read only).

1. Spec 1, cpp.md:27. Ruling: drop the sentence citing the layering rule. The header rule stands on its own: a public header names no third-party type and hides one behind PIMPL or an opaque handle.
2. Spec 2, cpp.md:60. Ruling: "A sequence crosses a function boundary as `std::span` (`std::span<const T>` when it is read-only), and text as `std::string_view`."
3. Spec 3, typescript.md:47. Ruling: "<the size check> fails the verify list at <540>".
4. Proof 1, python.md:27. Ruling: keep BLE001 for `except Exception`, and add that `contextlib.suppress(Exception)` swallows a failure the same way and is checked by reading.
5. Proof 2, python.md:14. Ruling: ruff's `N` rules cover function names, class names and the names of modules inside a package (`N802`, `N801`, `N999`); a top-level module name, a module constant and the `_` prefix are checked by reading.
6. Standards 1. Ruling: every placeholder bare, `<...>`; cpp.md's header path becomes `include/<lib>/`, with only `<lib>` filled.
7. Standards 2. Ruling: at most two ", never"/"not X" contrasts on each page; state the rest positively. Quote `grep -c -E ', never|, not '` per page.
8. Standards 3. Ruling: every path from the repository root: `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, in the opening sentences and wherever a page cites them.
9. Standards 4. Ruling: one verb for a configured rule failing the code: "fails" (for example "ruff's `E722` fails a bare `except:`", "`no-var` fails a `var`"). No "flags", "reports", "refuses", "requires" or "rewrite" for it.
10. Standards 5. Ruling: "naming style" in place of "case" for identifiers (cpp.md:11, :38; python.md:14).
11. Standards 6. Ruling: no sentence past 25 words; cpp.md:16 becomes one sentence per throwing call or a short list, and cpp.md:31 is split.
12. Standards 7. Ruling: the compound-name example becomes `parseConfig`.

Rerun the verify list through checks.sh and every command case of the brief, quote the contrast count per page and the longest sentence per page, and add a section "Repair round 1" to the report with each change and the outputs.
