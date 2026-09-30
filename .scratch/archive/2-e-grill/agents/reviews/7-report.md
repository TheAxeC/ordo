# Report, step 7: repo-setup installs the standards pages

Nothing NOT DONE. Everything in the brief is built and run. One point for the orchestrator is under "Points for the orchestrator" (choice placeholders filled "no" leave conditional sentences inert).

## Open items of the state file (verbatim)

- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## First run on the unchanged tree

- Grep 1 (`git grep -n 'docs/dev/coding-standards\.md' -- ':!.scratch' ':!docs/roadmap.md'`): printed `skills/repo-setup/SKILL.md:114` and `skills/repo-setup/templates/CLAUDE.md:17`. As the brief says.
- Grep 2: printed lines 145 and 156 of `skills/repo-setup/SKILL.md`; the `-c -F` count of the new rule printed 0. As the brief says.
- Grep 3 (brief.md sentence): 0. Grep 4 (`design-principles.md` in `skills/ordo-init/SKILL.md`): 0. As the brief says.
- `sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`. Description lengths: `702 skills/repo-setup/SKILL.md` (at most 1,024). The reading parts of both fail on the unchanged tree: the standards term says only "the change standard and the prose standard", the questions term says "eight".
- Reading cases (items 1 to 6): the unchanged text has question 6 "The coding standard ... or none yet", eight questions, the tree line `docs/dev/coding-standards.md`, the rules "never invents a coding rule", `CLAUDE.md:17` naming one file, `ordo-init` line 67 naming "the coding, layout or prose standard pages", no sentence in `brief.md`, README lines 13 and 97 naming "the coding standard" or no standards pages. Each fails its item, as expected.
- Real run on the unchanged text (scratch git repository, untracked `src/a.cpp`, `src/a.hpp`, `web/b.ts`, `git ls-files | wc -l` printed 0): following main's Steps 1 to 5, the tree has no design principles, no coding-standards folder and no UI page. `ls docs/dev` printed `change-standard.md` and `prose-standard.md`; `ls docs/dev/coding-standards` printed `No such file or directory`; `ls docs/dev/design-principles.md docs/dev/ui-standard.md` printed `No such file or directory` for both. The case fails there, as expected.
- No case is one the brief's own rules get wrong; the build went ahead.

## Verify list

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, printed in full:

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

It exited 0 (rerun after the last edit; the last three lines are the same).

2. Description lengths after the change, `python3 -c 'import glob,yaml; ...'`: `726 land`, `632 ordo-init`, `386 plan-help`, `788 plan-orchestration`, `616 plan-retro`, `477 plan`, `951 refute`, `776 repo-setup`, `997 roadmap`, `1022 spec`. Every count is at most 1,024.
3. The step adds no test and no script (`git status --short` lists only the seven changed files below and no new file).

## Cases and items

| Case or item | Result | Evidence |
|---|---|---|
| Grep: `git grep -n 'docs/dev/coding-standards\.md' -- ':!.scratch' ':!docs/roadmap.md'` prints nothing | DONE | printed nothing, exit 1 |
| Grep: `grep -n 'never invents a coding rule' skills/repo-setup/SKILL.md` prints nothing | DONE | printed nothing, exit 1 |
| Grep: `grep -c -F "The rules are Ordo's shipped defaults or the user's; the skill adds no other rule."` prints 1 | DONE | printed 1 |
| Grep: brief.md sentence count 1 | DONE | printed 1 |
| Grep: `docs/dev/design-principles.md` in `skills/ordo-init/SKILL.md` at least 1, and the line names the coding-standards pages and the UI standard | DONE | printed 1; line 67 and its sub-bullet read "`standards` lists every standards page ... (design principles, coding standards, a UI standard, a layout or prose standard)" and "The paths `/repo-setup` installs are `docs/dev/design-principles.md`, the pages under `docs/dev/coding-standards/` and `docs/dev/ui-standard.md`." |
| `sync_rules.py . --only glossary` prints ok, and the standards term names the new pages | DONE | printed `ok: the plan-terms block equals the template`; `docs/glossary.md:83` reads "the change standard, the prose standard, the design principles, the coding-standards pages and, with a user interface, the UI standard" |
| Description at most 1,024 | DONE | 776 |
| Real run 1, C++ and TypeScript, no UI | DONE | See "Real run 1" below |
| Real run 2, with `web/c.svelte` | DONE | See "Real run 2" below |
| Real run 3, Svelte named, no files | DONE | See "Real run 3" below |
| Texts of items 1 to 6 read as the items say | DONE | See the item rows and the before and after below |
| Item 1, `skills/repo-setup/SKILL.md` | DONE | question 6 and new question 7, questions 8 and 9 renumbered, `The nine questions` in Stops, "What it reads" item 3 with the extension list and `.git/` exclusion, the tree lines, the Steps 3 bullets (placeholders, Svelte section, the draft showing the UI answer and its cause), the Steps 8 bullet on `standards`, the Rules line, the Anti-patterns row, the description. `grep -n -E 'question [0-9]' skills/repo-setup/SKILL.md` shows question 5 unchanged and no reference to a question that moved |
| Item 2, `skills/repo-setup/templates/CLAUDE.md:17` | DONE | two lines 17 and 18, quoted below |
| Item 3, `skills/ordo-init/SKILL.md:67` | DONE | quoted below |
| Item 4, `plan-terms.md` 58 and 78, glossary synced | DONE | `git diff --stat` shows `docs/glossary.md | 4 +--` from `sync_rules.py . --only glossary --write` (printed `written: the plan-terms block now equals the template`) |
| Item 5, `skills/spec/templates/brief.md` | DONE | new line 5, count 1 |
| Item 6, `README.md` lines 13 and 97 | DONE | quoted below |

### Real run 1 (C++ and TypeScript, no user interface)

Scratch folder `$TMPDIR/run1`, `git init`, untracked `src/a.cpp`, `src/a.hpp`, `web/b.ts`; `git ls-files | wc -l` printed 0, so Steps 1 did not refuse. Languages read from the extensions: `cpp hpp ts`, so C++ and TypeScript (kind `cpp` plus `.ts`). The answers were as the brief gives them; the draft was approved as drafted. Results:

```
docs/dev:
change-standard.md
coding-standards
design-principles.md
prose-standard.md

docs/dev/coding-standards:
common.md
cpp.md
typescript.md
```

- `ls` shows no `python.md` and no `ui-standard.md`.
- `grep -c 'Svelte' docs/dev/coding-standards/typescript.md` printed 0.
- `grep -n -o '<[^>]*>' docs/dev/design-principles.md docs/dev/coding-standards/*.md | grep -v -e ':<>$' -e ':<const T>$'` printed nothing (exit 1); without the filter it printed `cpp.md:20:<>` and `cpp.md:65:<const T>` only.
- The installed pages and the scratch `CLAUDE.md`'s "Read before you act" lines were read whole. No sentence states nothing. `CLAUDE.md` carries the design-principles and coding-standards line and no UI line.
- The `standards` line drafted by `skills/ordo-init/SKILL.md` Steps 7: `standards: [docs/dev/design-principles.md, docs/dev/coding-standards/common.md, docs/dev/coding-standards/cpp.md, docs/dev/coding-standards/typescript.md, docs/dev/prose-standard.md, docs/glossary.md]`. Four pages, the prose standard and the glossary.
- Files the folder held when it was removed: `.gitignore CLAUDE.md docs/adr/README.md docs/adr/template.md docs/dev/change-standard.md docs/dev/coding-standards/{common,cpp,typescript}.md docs/dev/design-principles.md docs/dev/prose-standard.md docs/glossary.md docs/roadmap.md LICENSE README.md src/a.cpp src/a.hpp web/b.ts`. Removed with `rm -rf`.

Values given (namespace `scratch7`; folders `src` and `lib`):
- design-principles: `<the layers, top down>` = "`app`, then `lib`"; `<the goals>` = "a readable and maintainable scratch repository"; the sentence with `<the checks>` and the sentence after it became "No check of the repository enforces a principle yet: each is checked by reading at review."
- common: `<1000>` 1000, `<ten>` ten; the size, folder, format and ASCII checks became "checked by reading at review" (for example "A source file stays under 1000 lines, checked by reading at review.").
- cpp: `<C++20>` C++20, `<120>` 120, the four `<yes or no>` all "no", `<the context type>` `scratch7::Context`, `include/<lib>/` became `include/lib/`, `<name>::parseConfig` became `scratch7::parseConfig`, `<name>` (namespace) `scratch7`, `<u32 and the like, or none>` none, `<src>` `src`.
- typescript: `<100>` 100, `<SCREAMING_CASE or camelCase>` camelCase, the import-cycle check "checked by reading at review". The section "Svelte and SvelteKit" and its heading are left out (`grep -c Svelte` 0).
- `change-standard.md`: `<the standards pages, linked>` filled with the installed pages; `<the source tree, the tests, the examples and docs/>` filled with `src/`, the tests, the examples and `docs/`. The command block and the land folder placeholders in it are filled at Steps 9 from `docs/dev/building.md`, as Steps 9 says, and are not part of this run.

### Real run 2 (with `web/c.svelte`)

Scratch `$TMPDIR/run2` with the run 1 files plus `web/c.svelte`; extensions read `cpp hpp svelte ts`. The user-interface answer left at its default no; the draft shows it as yes because of `web/c.svelte`, so `docs/dev/ui-standard.md` is drafted. Results:
- `ls docs/dev` printed `change-standard.md coding-standards design-principles.md prose-standard.md ui-standard.md`; `ls docs/dev/coding-standards` printed `common.md cpp.md typescript.md`.
- `grep -c 'Svelte' docs/dev/coding-standards/typescript.md` printed 2, and `grep -n '^## '` lists `38:## Svelte and SvelteKit`.
- The placeholder grep over the design principles, the three coding-standards pages and the UI page, filtered as in run 1, printed nothing.
- Additional values: `<the token files>` `src/lib/tokens.css`, `<the text catalog>` `src/lib/text.ts`, `<the views folder>` `src/routes`, `<600>` 600; `<the element check>` in the UI page is the lint `svelte/no-restricted-html-elements`, which `typescript.md` in the same repository names for that rule; the colour, contrast, styling, keyboard, catalog and size checks became "checked by reading at review".
- The drafted `standards` line lists the same as run 1 plus `docs/dev/ui-standard.md`: `[docs/dev/design-principles.md, docs/dev/coding-standards/common.md, docs/dev/coding-standards/cpp.md, docs/dev/coding-standards/typescript.md, docs/dev/ui-standard.md, docs/dev/prose-standard.md, docs/glossary.md]`.
- `CLAUDE.md` "Read before you act" carries both the design-principles line and the `docs/dev/ui-standard.md` line. Folder removed with `rm -rf`; it held the run 1 files plus `web/c.svelte` and `docs/dev/ui-standard.md`.

### Real run 3 (Svelte named, no files)

Scratch `$TMPDIR/run3`, `git init`, no file (`git ls-files` empty, `find` count 0), kind `typescript`, question 3 "SvelteKit with Vitest", user interface left at default. Results:
- `ls docs/dev` printed `change-standard.md coding-standards design-principles.md prose-standard.md ui-standard.md`; `ls docs/dev/coding-standards` printed `common.md typescript.md`; `ls .../cpp.md .../python.md` printed `No such file or directory` for both.
- `grep -n '^## Svelte' docs/dev/coding-standards/typescript.md` printed `38:## Svelte and SvelteKit`.
- The placeholder grep, filtered, printed nothing.
- Folder held `.gitignore CLAUDE.md docs/adr/README.md docs/adr/template.md docs/dev/change-standard.md docs/dev/coding-standards/common.md docs/dev/coding-standards/typescript.md docs/dev/design-principles.md docs/dev/prose-standard.md docs/dev/ui-standard.md docs/glossary.md docs/roadmap.md LICENSE README.md`; removed with `rm -rf`, and `ls $TMPDIR` shows no `run1`, `run2`, `run3` or `first7`.

## Files changed (`git diff --stat`, line counts from `wc -l`)

- `README.md` 164 lines (2 lines changed)
- `docs/glossary.md` 109 (2 lines, from the sync)
- `skills/ordo-init/SKILL.md` 125 (1 line changed, 1 added)
- `skills/repo-setup/SKILL.md` 175 (about 28 added, 13 removed)
- `skills/repo-setup/templates/CLAUDE.md` 34 (1 line replaced by 2)
- `skills/repo-setup/templates/plan-terms.md` 93 (2 lines)
- `skills/spec/templates/brief.md` 66 (2 lines added: the sentence and a blank line)
- `.scratch/2-e-grill/agents/reviews/7-report.md` (this file)

No other path is written; `git status --short` lists the seven files above.

## Before and after of the lines a user or an installed repository reads

- `skills/repo-setup/templates/CLAUDE.md:17`, before: `<- `docs/dev/coding-standards.md`: how code is written.>`; after, lines 17 and 18: `<- `docs/dev/design-principles.md` and the pages under `docs/dev/coding-standards/`: how code is designed and written.>` and `<- `docs/dev/ui-standard.md`: how the user interface is built.>`.
- Question 6, before: "The coding standard: copied from a sibling repository the user names (its page read whole and adapted to this repository's names), written from rules the user states, or none yet."; after: "The standards pages: Ordo's defaults [the defaults], or pages copied from a sibling repository the user names (each read whole and adapted to this repository's names), or pages written from rules the user states." with the defaults list as a sub-bullet. Question 7 is new: "Does the repository have a user interface a reader sees and operates? [no]". The project skills and the project rules are questions 8 and 9.
- Rules, before: "A page it writes states rules the user or a template gave." / "It never adds a rule of its own." / "The skill never invents a coding rule."; after: "The rules are Ordo's shipped defaults or the user's; the skill adds no other rule." The Anti-patterns row now reads "See Rules: the skill adds no other rule".
- `skills/ordo-init/SKILL.md:67`, before: "`standards` lists the coding, layout or prose standard pages the repository has, and `docs/glossary.md` when the repository has one, so every brief names it."; after: "`standards` lists every standards page the repository has, wherever it is (design principles, coding standards, a UI standard, a layout or prose standard), and `docs/glossary.md` when the repository has one, so every brief names them." plus the sub-bullet naming the three installed paths.
- `README.md:97`, before: "the commit rule, the coding standard and the project skills" and "the change and prose standards, a roadmap"; after: "the commit rule, the standards pages, whether the repository has a user interface, and the project skills" and "the change and prose standards, the standards pages (the design principles, the coding standards for its languages and, with a user interface, the UI standard), a roadmap". `README.md:13`: "the change and prose standards, the standards pages, a roadmap".
- Glossary: "questions, the" says "nine"; "standards" second sense as in the item 4 row above.
- `skills/spec/templates/brief.md:5`: the new paragraph, every brief written from the template now carries it.

## Judgment calls the brief left open

- Where the three new "What it reads" lines sit: the language rule is item 3 (after the answers), so the `ordo-init`/`roadmap` item is 4 and the `sync` item is 5. No page cites the repo-setup "What it reads" numbers (`git grep -n -E 'repo-setup.{0,20}What it reads'` finds only `ordo-init`'s item 3 in the glossary).
- The Steps 8 bullet for `standards` is added under item 8 so no step is renumbered; other pages cite "Steps 4", "Steps 5", "Steps 8", "Steps 9", "Steps 12", which stay as they are.
- The sentence "The draft shows the answer to question 7 as yes, with the file or the answer that made it so." is added to Steps 3 to make the case "the draft shows the answer as yes because of the `.svelte` file" a rule of the skill.
- "Checked by reading at review" replaced the sentence part carrying the check: for the size, folder, format, ASCII, import-cycle, colour, contrast, styling, keyboard and catalog checks the clause names the reading in place of the check. The design-principles closing sentences were merged into one, since the second repeated the first once the check clause was gone.
- The element check of the UI page was filled with the lint `svelte/no-restricted-html-elements` in the Svelte runs, because `typescript.md`, written before it, names that lint for the rule (a "file written before" fill).

## Points for the orchestrator (a reading the brief's cases do not settle)

- The four `<yes or no>` choice placeholders of `cpp.md` were given the value "no", which the answers imply since the user fixed no such flag. The filled page then carries conditional sentences whose condition is stated false ("When the repository builds with `-fno-exceptions` (no), a throwing standard operation stays out of every path that input reaches", "Where the repository uses two-phase setup (no), a constructor takes nothing and does nothing", "Where the repository defines fixed-width aliases (none), declarations and members use them"). They state something, so the case's "no sentence that states nothing" holds, but a reader meets rules that the page itself says do not apply. The template's wording is the cause; changing it is outside this step's paths, so it is left as is. The alternative, "yes", would bind the repository to a choice nobody made.
- `docs/dev/change-standard.md` has placeholders (the command block, the land skill's folder, `<state file>`) that Steps 9 fills after `/ordo-init` writes `docs/dev/building.md`, which is after the draft. Steps 3's rule "never written as `<...>`" and Steps 9 leave these open until then; the step's cases do not include them.

## Anything in the brief that was wrong or impossible

Nothing found wrong in the brief's cases or rules.

# Repair round 1

All five points are done. The reading case of real run 1 is met: every installed sentence of the five pages was read whole, and none states a condition that does not hold or a name nobody chose.

## Changes, old beside new

1. Steps 3 of `skills/repo-setup/SKILL.md`, new sub-bullet before the "A check the repository does not have yet" bullet. Old: none. New: "A rule whose condition is a choice placeholder (`<yes or no>`, or a value `or none`) is kept when the answer is yes or a value, with the parenthesis that held the choice removed, and is left out of the installed page, with its sub-list and the placeholders only it holds, when the answer is no or none."
2. "The tree". Old: the four page lines with no condition. New: each of the four lines ends "when question 6 gave the defaults" (the UI line: "when question 6 gave the defaults and the repository has a user interface"), and a new line `<the pages question 6 names>     the pages copied from a sibling repository or written from the user's rules, at the paths the answer gives, in place of the default pages above`.
3. Question 6, new second sub-bullet. Old: none. New: "A language with no template page (any kind other than C++, Python and TypeScript) gets no language page from the defaults; the draft at Steps 4 says so, and the user may give that language's rules under the third answer."
4. Anti-patterns row, first cell. Old: "A coding rule the user did not state". New: "A coding rule that is neither in Ordo's shipped pages nor stated by the user".
5. Steps 8 bullet. Old: "The `standards` key it drafts lists every standards page written at Steps 5." New: "The `standards` key it drafts lists every standards page written at Steps 5 except the change standard, which is the `rules` key."

## Checks runner (full output)

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
exit 0
```

## Grep cases and description lengths

```
$ git grep -n docs/dev/coding-standards\.md ...
exit 1
$ grep -n "never invents a coding rule" SKILL.md
exit 1
$ grep -c -F rules-line
1
$ grep -c -F brief sentence
1
$ grep -c -F design-principles ordo-init
1
$ sync_rules
ok: the plan-terms block equals the template
$ description lengths
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
776 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md
```

## Real run 2 (with web/c.svelte)

```
$ ls docs/dev docs/dev/coding-standards
docs/dev:
change-standard.md
coding-standards
design-principles.md
prose-standard.md
ui-standard.md

docs/dev/coding-standards:
common.md
cpp.md
typescript.md
$ grep -c Svelte typescript.md
2
38:## Svelte and SvelteKit
$ placeholder grep (filtered)
exit 1
$ conditional cpp.md lines
exit 1
standards line: [docs/dev/design-principles.md, docs/dev/coding-standards/common.md, docs/dev/coding-standards/cpp.md, docs/dev/coding-standards/typescript.md, docs/dev/ui-standard.md, docs/dev/prose-standard.md, docs/glossary.md]
```
The change standard is not in the line, as Steps 8 now says.

## Real run 3 (Svelte named, no files)

```
$ ls docs/dev docs/dev/coding-standards
docs/dev:
change-standard.md
coding-standards
design-principles.md
prose-standard.md
ui-standard.md

docs/dev/coding-standards:
common.md
typescript.md
ls: docs/dev/coding-standards/cpp.md: No such file or directory
ls: docs/dev/coding-standards/python.md: No such file or directory
38:## Svelte and SvelteKit
$ placeholder grep (filtered)
exit 1
```

## Real run 1 (C++ and TypeScript, no user interface), rerun on the changed text

Choices answered no, the fixed-width aliases answered none. The five conditional rules of `cpp.md` (`-fno-exceptions` with its sub-list, `-fno-rtti`, two-phase setup with `<the context type>`, fixed-width aliases, allocator-aware with its sub-list) are left out of the installed page, and `<src>` and the context type went with them. `Namespace` `scratch7`, folders `src` and `lib`, other values as in the first report.

```
$ ls docs/dev docs/dev/coding-standards
docs/dev:
change-standard.md
coding-standards
design-principles.md
prose-standard.md

docs/dev/coding-standards:
common.md
cpp.md
typescript.md
$ grep -c Svelte typescript.md
0
$ placeholder grep (filtered)
exit 1
$ placeholder grep (unfiltered)
docs/dev/coding-standards/cpp.md:57:<const T>
$ grep conditional lines in cpp.md
exit 1
standards line: [docs/dev/design-principles.md, docs/dev/coding-standards/common.md, docs/dev/coding-standards/cpp.md, docs/dev/coding-standards/typescript.md, docs/dev/prose-standard.md, docs/glossary.md]
```

### The pages as installed

#### docs/dev/design-principles.md

````markdown
# Design principles

A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it. A principle without a concrete form is a slogan. The concrete form below is the rule, and a check enforces it where one exists.

- **Single responsibility.** One module owns one subject, and a class keeps one invariant. A file holds one subject. A member reaches another subject's state through that subject's interface.
- **Separation of concerns, high cohesion, low coupling.** The code is layered, and a layer sees only the layers below it: `app`, then `lib`. A module reaches only the modules it declares as dependencies. A forwarder, a member whose whole body is a call to the same member elsewhere, is deleted.
- **Open for extension, closed for modification.** A new view, backend, key or command is registered at an extension point, such as a registry or an interface. The code that consumes it is left unchanged.
- **Substitutability.** Every implementation of an interface honours the whole contract. No member is defaulted to a silent no-op. A failure is reported as `docs/dev/coding-standards/common.md` says, never through a flag that means two things.
- **Interface segregation.** Each subject has one small interface. A caller depends on the interface it uses. An interface holds only members that a production caller uses.
- **Dependency inversion.** A module depends on interfaces that the layers below it declare, and names no concrete type of a layer above it. Collaborators are passed in explicitly, as a context parameter, a constructor argument or a function parameter.
- **No globals.** The code has no singleton, no global logger, no `getInstance()` and no mutable state at module or class level. An exception is an ADR the user rules on, and it sets no precedent for another.
- **Do not repeat yourself.** Each rule has one body. A computation written twice is folded to one home, and the other place calls it. A table the build can derive is generated. A rule in prose is stated once and cited from everywhere else. The comment rule, for one, is the change standard's rule "No history in code or comments" (`docs/dev/change-standard.md`).
- **Keep it simple.** The plain shape comes first: a value type over a builder, and a plain function over a generic one. A direct call is preferred over an indirect one where the callee is known. A mechanism is justified from the repository's own goals (a readable and maintainable scratch repository), never from what another project does.
- **You are not going to need it.** Nothing is added for a caller that does not exist. A member, parameter, option or file whose only user is a test is deleted with its test. A public member exists because a caller calls it, and it is documented where that caller reads. A future need is recorded as a roadmap entry, and no code is written for it.

No check of the repository enforces a principle yet: each is checked by reading at review.
````

#### docs/dev/coding-standards/common.md

````markdown
# Coding standards: every language

The language pages in `docs/dev/coding-standards/` add to this page and never repeat it. Two pages installed beside it hold rules this page relies on: the change standard, `docs/dev/change-standard.md`, and the prose standard, `docs/dev/prose-standard.md`.

- **File size.** A source file stays under 1000 lines, checked by reading at review. A file approaching the limit is split by subject, never by line count.
- **Folder size.** A source, test or tool folder holds at most ten items, checked by reading at review.
- **Formatting.** Each language has one formatter, with its configuration pinned in the repository. The formatting is checked by reading at review. A failing format is fixed by running the formatter.
- **Comments.** The change standard's rule "No history in code or comments" says what a comment carries and what it never carries.
- **Character set.** Every authored file is ASCII, source code included, with the one exception the prose standard's section B allows: accented letters in names. A file whose format requires another character set is exempt. The rule is checked by reading at review.
- **Markdown and YAML.** Each paragraph and each bullet is one line, as the prose standard's section F sets for source formatting.
- **Names.** A name says what the thing is in the repository's vocabulary, whose terms `docs/glossary.md` holds. One concept keeps one name, the rule "No synonym cycling" of the prose standard's section D.
- **Errors.** A failure is reported through the language's error mechanism, with what failed and why. Nothing fails silently, and no catch-all handler hides a failure.
- **Tests.** A test proves behaviour whose failure costs something, under the change standard's section "Scripts compute facts; judgment is read". Its rule "A test proves the change by failing without it, and the report quotes the red" sets how the proof is shown.
````

#### docs/dev/coding-standards/cpp.md

````markdown
# Coding standards: C++

This page adds to `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, and repeats neither.

## Language and tooling

- The language standard is C++20.
- clang-format formats every source file from a `.clang-format` in the repository. It sets a 4-space indent, braces on the same line, left-aligned pointers (`T* p`) and a column limit of 120.
- clang-tidy runs from a `.clang-tidy` with the groups `bugprone-*`, `modernize-*`, `performance-*` and `readability-*`.
- The `.clang-tidy` turns off `modernize-use-trailing-return-type`, since the code declares return types in front.
- The `.clang-tidy` sets `readability-identifier-naming` to the naming styles under "Naming".

## Errors

- Errors are values. A fallible function returns a result type marked `[[nodiscard]]`, and the caller branches on it.

## Construction

- A constructor establishes the class's invariant from its arguments, and the destructor releases what the class owns (RAII).

## Headers and includes

- A public header lives under `include/lib/` and ends `.hpp`. Every other header ends `.h`.
- A public header names no third-party type. It hides one behind PIMPL or an opaque handle.
- A public header names no private header of another library.
- Every header opens with `#pragma once`.
- A `.cpp` includes its own header first, then the standard library, then third-party headers, then the project's own.
- A `.cpp` that exports a symbol declares it in a header it includes itself.
- A `.cpp` defines an exported function by its qualified name (`scratch7::parseConfig`). A definition that drifts from its declaration then fails at compile time.
- File names are lowercase.

## Naming

- The project has one namespace, `scratch7`. A nested namespace exists only to avoid a real collision.
- A free function carries its module in a compound name (`parseConfig`), so the name stays flat and still says where it belongs.
- Types are `PascalCase`, and functions, methods and variables are `lowerCamelCase`. Members are `m_name`. Namespace- and file-scope `constexpr` constants are `SCREAMING_CASE`. clang-tidy's `readability-identifier-naming` warns on a name in another naming style.
- Enumerations are `enum class`. The underlying type is explicit when the value is serialised, sizes an array or crosses an ABI.

## API shape

- A stateful type is constructed by a static factory on the type (`Window::create(config)`). An operation on it is a member (`window.resize(size)`).
- A free function stays in two places: math on a passive value type (`dot(a, b)` on plain aggregates), and a file-local helper with internal linkage.

## `struct` and `class`

- A passive aggregate with public members and no invariant is a `struct`.
- A type that keeps an invariant is a `class` with private state.

## Members and accessors

- Member access carries no `this->`, since the `m_` prefix already marks a member.
- An accessor takes no `get` prefix (`size()`, `width()`). A mutator keeps a verb (`setWidth()`).
- An accessor is `[[nodiscard]]`, and clang-tidy's `modernize-use-nodiscard` warns on one without it.

## Containers and memory

- A sequence crosses a function boundary as `std::span` (`std::span<const T>` when it is read-only), and text as `std::string_view`.
- A map or a set on a hot path is a flat open-addressing table. The node-based `std::map`, `std::unordered_map`, `std::set` and `std::unordered_set` stay off hot paths.
- A value type with many instances on a hot path lives in an index or a pool, with no heap allocation per instance.

## Documentation comments

- A public declaration carries a Doxygen `///` brief. `@param` and `@return` appear only where they add what the signature does not say.
- Every other comment is plain `//`, since Doxygen attaches a `///` to the next declaration.
````

#### docs/dev/coding-standards/typescript.md

````markdown
# Coding standards: TypeScript

This page adds to `docs/dev/coding-standards/common.md` and `docs/dev/design-principles.md`, and repeats neither.

## Language and tooling

- `tsconfig.json` sets `"strict": true`.
- ESLint runs from a flat config with `@eslint/js` recommended and typescript-eslint's `strictTypeChecked` and `stylisticTypeChecked`. It has type information through `projectService: true`.
- The config sets `reportUnusedDisableDirectives: 'error'`, which fails an unused disable comment.
- A rule turned off in the config names why beside it.
- A disable comment at a site names its reason.
- Prettier formats every source file from a `.prettierrc` with `tabWidth: 4`, `useTabs: false`, `singleQuote: true`, `trailingComma: "none"` and a `printWidth` of 100.

## Types

- A shape is declared with `type`. `@typescript-eslint/consistent-type-definitions`, set to `type`, fails an `interface`.
- An `interface` stays only where declaration merging needs one, with a disable comment saying so.
- A value parsed from outside is `unknown` and is narrowed before use. `@typescript-eslint/no-explicit-any` fails an `any`.
- `@typescript-eslint/no-non-null-assertion` fails a non-null assertion `!`.

## Names and unused values

- Types are `PascalCase`, functions and variables `camelCase`, and constants camelCase.
- A binding the syntax needs and the code does not read is named with a leading `_`. The config sets `@typescript-eslint/no-unused-vars` with `argsIgnorePattern: '^_'` and `varsIgnorePattern: '^_'`. That rule passes such a name and fails every other unused binding.

## Errors and promises

- Every promise is awaited, returned or marked `void`. `@typescript-eslint/no-floating-promises` fails a promise left with no handler. A promise ended by `.catch` passes it and is checked by reading.
- A thrown value is an `Error` or a subclass of it. `@typescript-eslint/only-throw-error` fails a thrown value of another type. A thrown `any` or `unknown` value passes it and is checked by reading.
- A `catch` block handles the failure it catches. Core `no-empty` fails an empty one.

## Modules

- The code is ES modules only. `no-var` fails a `var`.
- A module exports named values. A default export stays only where a named one cannot serve.
- The module graph has no import cycle, checked by reading at review.
````

#### CLAUDE.md, "Read before you act"

````markdown
## Read before you act

- `docs/dev/building.md`: how to build and test, and what the green check is. Read it before running or reporting any build.
- `docs/dev/change-standard.md`: how a change is made and reported. Every brief points here first.
- `docs/dev/design-principles.md` and the pages under `docs/dev/coding-standards/`: how code is designed and written.
- `docs/dev/prose-standard.md`: how every comment, page and message is written.
- `docs/roadmap.md`: what is open and in what order. Answer "what is left?" from this file, never from memory.
- `docs/glossary.md`: the terms this repository and the skills it is set up with use in a sense of their own, each defined once.
- `docs/adr/`: the decisions that bind work after the plan that made them closes, with the alternatives rejected. A change that contradicts an ADR is a rule clash.

````

Read whole: no installed sentence states a condition that does not hold or a name nobody chose. Scratch folders removed; `ls $TMPDIR | grep -E "run[0-9]|first7"` prints nothing.
