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
