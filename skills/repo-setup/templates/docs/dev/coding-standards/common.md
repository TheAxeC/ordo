# Coding standards: every language

The language pages in `docs/dev/coding-standards/` add to this page and never repeat it. Two pages installed beside it hold rules this page relies on: the change standard, `docs/dev/change-standard.md`, and the prose standard, `docs/dev/prose-standard.md`.

- **File size.** A source file stays under <1000> lines, and <the size check> fails the verify list at <900>. A file approaching the limit is split by subject, never by line count.
- **Folder size.** A source, test or tool folder holds at most <ten> items, counted by <the folder check>.
- **Formatting.** Each language has one formatter, with its configuration pinned in the repository. The verify list runs each formatter as <the format check>. A failing format check is fixed by running the formatter.
- **Comments.** The change standard's rule "No history in code or comments" says what a comment carries and what it never carries.
- **Character set.** Every authored file is ASCII, source code included, with the one exception the prose standard's section B allows: accented letters in names. A file whose format requires another character set is exempt. <the ASCII check> enforces the rule.
- **Markdown and YAML.** Each paragraph and each bullet is one line, as the prose standard's section F sets for source formatting.
- **Names.** A name says what the thing is in the repository's vocabulary, whose terms `docs/glossary.md` holds. One concept keeps one name, the rule "No synonym cycling" of the prose standard's section D.
- **Errors.** A failure is reported through the language's error mechanism, with what failed and why. Nothing fails silently, and no catch-all handler hides a failure.
- **Tests.** A test proves behaviour whose failure costs something, under the change standard's section "Scripts compute facts; judgment is read". Its rule "A test proves the change by failing without it, and the report quotes the red" sets how the proof is shown.
