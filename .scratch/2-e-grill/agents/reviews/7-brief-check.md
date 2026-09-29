# Step 7 brief check (on main at aa115e7)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `.scratch/2-e-grill/agents/briefs/7.md`. Nothing was changed.

## 1. Names

- `docs/dev/coding-standards.md`: `git grep -n 'docs/dev/coding-standards\.md' -- ':!.scratch' ':!docs/roadmap.md'` printed only `skills/repo-setup/SKILL.md:114` and `skills/repo-setup/templates/CLAUDE.md:17`. Both are inside the paths. No hit outside the paths.
- "coding standard", "coding rule": `git grep -n -i -E 'coding.standard|coding rule' -- ':!.scratch'` printed these hits outside the paths:
  - `README.md:97` is inside the paths.
  - `docs/roadmap.md:24` ("coding-standard pages (common, C++, Python, TypeScript)") is not made false.
  - The template pages under `skills/repo-setup/templates/docs/dev/` (their titles, and the cross-references to `docs/dev/coding-standards/common.md`) are not made false, since the folder shape is the one being installed.
- The question numbers 6 to 9: `git grep -n -E 'eight questions|nine questions|question [0-9]|questions [0-9]' -- ':!.scratch'` printed these hits outside the paths:
  - `docs/glossary.md:63` and `skills/repo-setup/templates/plan-terms.md:58`: "- **questions, the**: the eight questions `/repo-setup` asks before it drafts a repository". This is made false: there will be nine questions. Neither line is in "Paths this step writes": the paths name only lines 83 and 78.
  - `docs/glossary.md:21`, `skills/repo-setup/templates/plan-terms.md:16` and `skills/ordo-init/SKILL.md:31` name question 5. They are not made false, since question 5 keeps its number.
  - The hits in `skills/repo-setup/SKILL.md` (lines 51, 66, 114, 120, 129, 134) are inside the paths.
  - No text anywhere cites question 7 or question 8, so the renumbering breaks no reference.
- The rule sentences: `git grep -n -i 'rule of its own\|adds no other rule\|invents' -- ':!.scratch'` printed only `skills/repo-setup/SKILL.md:145`, `:155` and `:156`, all inside the paths. No hit outside the paths.
- The term **standards**, and the list of what setup writes: `git grep -n -i -E 'standard pages|standards pages|change and prose standard|the prose standard, the building' -- ':!.scratch'` printed these hits outside the paths:
  - `README.md:13`, the `repo-setup` row of the skills table: "It writes `CLAUDE.md` with the shared rules, the change and prose standards, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`". This becomes incomplete, and it contradicts `README.md:97` once item 6 changes that line (the rules file, rule 19). Line 13 is not in the paths.
  - `skills/repo-setup/templates/docs/dev/change-standard.md:8` (`<the standards pages, linked>`) is not made false, since it is filled at setup.
  - `skills/repo-setup/templates/docs/dev/change-standard.md:3` ("The coding and prose standards beside this page say what the result looks like") is not made false. It does not name the design or UI pages, but it states nothing wrong.
  - `skills/ordo-init/SKILL.md:57`, `skills/plan-retro/SKILL.md:78` and `skills/spec/SKILL.md:90` are not made false.
  - `skills/plan-help/SKILL.md:48` ("the tree, the shared rules, the standards, then /ordo-init") is not made false.
  - The glossary line 83 and the `plan-terms.md` line 78 are inside the paths.
- The Stops row "The eight questions": `skills/repo-setup/SKILL.md:129` is inside the paths. The row's other use of the count is the glossary term above.

Findings:
- `docs/glossary.md:63` and `skills/repo-setup/templates/plan-terms.md:58` say "the eight questions". The change makes this false, and neither line is in "Paths this step writes".
  - Item 4 should also change the term **questions, the** to "nine".
  - The paths should gain `skills/repo-setup/templates/plan-terms.md` lines 58-58 and `docs/glossary.md` lines 63-63. The sync with `--write` rewrites the whole block, so line 63 changes in any case.
- `README.md:13` lists what `repo-setup` writes without the standards pages. After item 6 it disagrees with line 97. Item 6 and the paths should cover line 13.

## 2. The step line

- "`repo-setup` question 6 installs the pages adapted to the repository (design-principles and common always, the language pages for the tracked file types, the UI page when Axel says the repository has a UI)": item 1, bullets 1 to 5. The same line in `plan.md` also carries the Svelte condition and the folder-versus-file question from "Carried to step 7".
- "and lists them under `standards`": item 1's Steps bullet, and item 3.
- "its rule at `SKILL.md:156` becomes 'the rules are Ordo's shipped defaults or the user's; the skill adds no other rule'": item 1's Rules bullet.
- "`/ordo-init` lists the pages": item 3.
- "the sentence ... goes into the brief template": item 5.
- "check: a real run on a scratch repository holding C++ and TypeScript files lists the right pages, and the changed texts are read": the two real-run cases, and the reading case.

Findings:
- The step line says "the language pages for the tracked file types". In a `/repo-setup` run the folder holds no tracked file: Steps 1 refuses a folder with tracked files (`skills/repo-setup/SKILL.md:36`).
  - The brief handles this with Decision 2, which reads the languages from the files the folder holds. `plan.md`'s step line was not corrected, which `spec` Steps 2 asks for when the plan can absorb a false premise.
- Item 1 adds a new input to `repo-setup`: the extensions of the files the folder holds. No item adds that input to the skill's "What it reads". `docs/dev/skill-layout.md`, "Sections, in order", row 4, asks for one input per item there.

## 3. Premises

- `find skills/repo-setup/templates -type f | sort` lists `design-principles.md`, `ui-standard.md` and `coding-standards/{common,cpp,python,typescript}.md` among the files. This matches the brief.
- `grep -n -E 'coding.standard' skills/repo-setup/SKILL.md` printed `100:6. The coding standard: ...` and `114:docs/dev/coding-standards.md     only when question 6 gave one`. This matches.
- Line 145, lines 154 to 156, the Steps 3 bullet (line 40), the Anti-patterns row (line 147) and the frontmatter `description` (line 3): the output of `cat -n skills/repo-setup/SKILL.md` matches the brief's quotes.
- `sed -n 17p skills/repo-setup/templates/CLAUDE.md` printed ``<- `docs/dev/coding-standards.md`: how code is written.>``. This matches.
- `sed -n 76,80p skills/repo-setup/templates/plan-terms.md` and `sed -n 81,85p docs/glossary.md` put **standards** at plan-terms line 78 and glossary line 83. This matches the brief.
  - `plan.md`'s "Carried to step 7" paragraph says lines 77 and 82. The brief's numbers are the correct ones.
- `sed -n 67p skills/ordo-init/SKILL.md` matches. `sed -n 1,6p skills/spec/templates/brief.md` shows line 3 as quoted and line 4 blank, which matches. `sed -n 95,99p README.md` shows line 97 as quoted, which matches.
- The `git grep` for `docs/dev/coding-standards.md` printed exactly the two lines the brief names. This matches.
- `grep -rn -o '<[^>]*>' skills/repo-setup/templates/docs/dev/design-principles.md skills/repo-setup/templates/docs/dev/coding-standards/ skills/repo-setup/templates/docs/dev/ui-standard.md` differs from the brief:
  - It prints `skills/repo-setup/templates/docs/dev/coding-standards/cpp.md:20:<>`, which the brief does not list.
  - It prints `cpp.md:65:<const T>`, which the brief lists as a "choice" placeholder.
  - `sed -n 18,22p` and `sed -n 63,70p` of `cpp.md` show both are C++ template syntax inside inline code, not placeholders: "`std::get<>` by type" (line 20) and "`std::span<const T>` when it is read-only" (line 65).
  - Filled as placeholders, these two would corrupt correct code on the installed page.
- `grep -n -i svelte .../coding-standards/*.md .../docs/dev/*.md`: "Svelte" appears only at `typescript.md` lines 38 to 48. `wc -l` gives `typescript.md` 49 lines, so the section runs to the end of the file. Line 40 and line 48 match the brief.
- Design-principles line 3 is as quoted, which matches.
- The brief's "On the unchanged tree" line says the second grep "prints line 156". `grep -n 'never invents a coding rule' skills/repo-setup/SKILL.md` prints two lines, 145 (the Anti-patterns row) and 156.

Findings:
- The placeholder list is wrong about `cpp.md`: `<const T>` (`std::span<const T>`) and `<>` (`std::get<>`) are C++ code, not placeholders.
  - Item 1's Steps 3 bullet ("every placeholder of an installed page is filled") has no exception for a language's own angle brackets inside inline code.
  - The skill's existing anti-pattern row ("A `<...>` placeholder written into a file") has no such exception either.
- On the unchanged tree the second grep prints lines 145 and 156, not only line 156.

## 4. Cases and checks

- The `git grep` for `docs/dev/coding-standards.md` printing nothing: consistent with the rules file and the standards.
- The two `grep`s on the rule sentences: consistent.
- The `grep -c` for the design sentence in `brief.md`: consistent.
- The `grep -c` for `docs/dev/design-principles.md` in `ordo-init`, plus a reading of the line: consistent.
- `sync_rules.py . --only glossary` plus a reading of the term: consistent.
- The description length (`docs/dev/skill-layout.md`, Frontmatter): consistent. The command printed `702 skills/repo-setup/SKILL.md` on the unchanged tree.
- The real run for C++ and TypeScript: inconsistent in three places.
  - (a) Its expected result says `grep -n -o '<[^>]*>' docs/dev/design-principles.md docs/dev/coding-standards/*.md` "prints only what sits inside an HTML comment". The template pages hold no HTML comment (`grep -n '<!--'` over them printed nothing). A correct install still prints `cpp.md`'s `<>` and `<const T>`, which are C++ code. The expected result fails on a correct build, or it pushes the builder to rewrite correct C++.
  - (b) The case says the builder follows `repo-setup` "from Steps 1 to Steps 5". It then expects "the run's `standards` line for `.agents/plan.yaml`, drafted by `/ordo-init` Steps 7". `/ordo-init` runs only at `repo-setup` Steps 8 (`skills/repo-setup/SKILL.md:49`), so a builder cannot carry this part out as written.
    - The case does not say whether to run `/ordo-init`, how far to take it, or whether to stop before its approval (Steps 11).
    - `/ordo-init` Steps 3 runs verification commands, which a scratch CMake repository with no build file may fail. That is a stop there.
  - (c) The answers say "every placeholder the draft lists at Steps 4 is given the template's value or 'none yet'". Item 1 instead says a check the repository does not have yet becomes "checked by reading at review", with no question asked. "None yet" put into the pages gives rules that state nothing true, such as:
    - "The project has one namespace, none yet." (`cpp.md`, line 36)
    - "Setup that needs a collaborator lives in `initialize`, which takes none yet." (`cpp.md`, line 26)
    - "When the repository builds with `-fno-exceptions` (none yet)" (`cpp.md`, line 15)

    This is the outcome `repo-setup`'s Anti-patterns row guards against ("The file then states something nobody filled in"). The case should give a concrete value for each name and choice placeholder: a namespace, `<lib>`, `<src>`, yes or no. It should keep "none yet" or "checked by reading at review" only for checks.
- The real run with Svelte: consistent with the rules file. Its gap is under 5.
- The reading case for items 1 to 6: consistent.
- "On the unchanged tree ... so every case above fails" is not true of every case.
  - `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` on the unchanged tree. Only its reading part fails there.
  - The description-length case passes on the unchanged tree (702).
  - Rule 13 of the rules file concerns tests of scripts, so this is not a rule breach. The brief's claim is still false as written.
- Item 1 says a placeholder with no value "is listed with the draft at Steps 4". `repo-setup`'s Stops row "The draft" lists "What it shows" as "The tree and every file's text" only. Item 1 does not carry the list to that row. `docs/dev/skill-layout.md`, "Where a rule goes", and the rules file, rule 19, ask that it be carried.
- Item 3 narrows `/ordo-init` for existing repositories. The new line 67 names fixed paths (`docs/dev/design-principles.md`, the pages under `docs/dev/coding-standards/`, `docs/dev/ui-standard.md`, ...). The current line is general: "the coding, layout or prose standard pages the repository has".
  - `/ordo-init` also runs alone on existing repositories, whose standards live elsewhere. The state file cites game-engine's `docs/dev/coding-standards.md` and cathedra's `docs/dev/standards/coding-standards.md` (`grep -n` in `.scratch/2-e-grill/orchestrator-state.md`, line 77).
  - Read as a closed list, the new line would leave those pages out. The rules file, rule 17, asks that a rewrite keep the scope of the rule it carries. The line should keep "the standard pages the repository has, wherever they are" and name the default paths as examples.
- Item 2 says "one line per installed page", but its two lines cover a group of pages each (design-principles and every coding-standards page on one line). The rule and the given lines disagree.

Findings:
- The placeholder expected result of the C++ and TypeScript run fails on a correct build (`cpp.md` lines 20 and 65).
- That run's `standards` expectation cannot be carried out as written, since `/ordo-init` is outside Steps 1 to 5.
- The "none yet" answers contradict item 1's rule for missing checks, and they install pages that state nothing true.
- The claim that every case fails on the unchanged tree is false for the `sync_rules` command and the description-length case.
- The Stops row "The draft" does not follow item 1's placeholder list.
- Item 3 narrows `/ordo-init`'s `standards` rule for existing repositories.
- Item 2's "one line per installed page" disagrees with the two lines it gives.

## 5. The question

"The goal" here is the part of the plan's goal this step delivers: `repo-setup` installs the default pages, adapted to the repository, and they are listed under `standards` so that every brief holds a design and its code to them.

- The `git grep` for the old path printing nothing: yes, it could pass without the goal. Deleting the two lines passes it. The real run carries the goal.
- The two rule-sentence `grep`s: no. They pass only with the exact new sentence present and the old one gone.
- The `grep -c` for the design sentence: no for its presence. Its placement ("a paragraph of its own after line 3") rests on the reading case.
- The `grep -c` in `ordo-init`: yes. Any mention of the path passes it. The reading part carries it.
- The `sync_rules` case: yes for the command, which passes on the unchanged tree. The reading part carries it.
- The description length: yes. It passes on the unchanged tree. It is a constraint, and the reading case checks whether the description names the pages.
- The real run for C++ and TypeScript: partly yes.
  - It checks which pages exist and that no `<...>` is left. It does not read the installed pages, so pages filled with "none yet" in place of names, or with wrong values, pass. The goal says "adapted to its names with nothing left unfilled".
  - It does not check the scratch `CLAUDE.md` lines from item 2, so item 2 is checked only on the template.
  - With (b) of section 4 unresolved, the `standards` part could be claimed from a draft nobody produced.
- The real run with Svelte: yes, for Decision 3.
  - The case answers "user interface yes" itself, so the rule that a `.svelte` file (or Svelte named in question 3) makes the answer yes is never exercised. A skill text that ignores `.svelte` still passes.
  - It needs a case with `web/c.svelte` and the answer to question 7 left at its default "no". The expected result: `docs/dev/ui-standard.md` is installed, or the draft shows the answer as yes because of the `.svelte` file.
  - The case of Svelte named in question 3 with no `.svelte` file is also not exercised.
- The step line's check ("a real run ... lists the right pages"): no, once the `/ordo-init` part of the case is made executable. As written, the listing part is unverifiable.
- The reading case: no. Reading each changed text against its item is the check.
- Item 1's language detection from the kind of question 2 alone (kind `cpp` with no `.cpp` file): no case separates it from detection by extension. Both sources agree in the run.

Findings:
- The real runs do not read the installed pages or the scratch `CLAUDE.md`. Wrong or empty-meaning fillings pass.
- The Svelte run answers "yes" itself, so the `.svelte`-implies-UI rule of item 1 and Decision 3 is never tested.
- The `standards` part of the real run cannot be observed as written.
- The `ordo-init` grep, the `sync_rules` command and the description length each pass without the change. Their reading parts carry them.

## 6. Implied inputs

- Not a code step. The step changes skill text, templates and the README, and adds no script (verify item 5 of the brief).

Findings: none.

## Declined to judge

- Whether the step should raise `metadata.version` of `repo-setup`, `ordo-init` and `spec`.
  - `git log --oneline -5 -G 'version: "' -- 'skills/*/SKILL.md'` shows the version raised in plan 2.D's landings (latest ac10380) and in none of 2.E's landed steps.
  - I found no rule page that settles it. This is the orchestrator's call.
- Whether scratch runs under `$TMPDIR` fit the rules file's "Where the work happens". The plan's gate requires such a run, and the rules file's "Rules this repository already states" names scratch repositories for tests. I left this to the orchestrator.
- Whether question 7 should be worded as a question ("Does the repository have a user interface ...? [no]") when the other items of "The questions" are noun phrases. This is a matter of style under `docs/dev/skill-layout.md` that the standards do not settle.
- Path overlap with other steps in flight. That comparison is `spec` Steps 5, not this check.

Agent usage: claude-opus-5-5 (Claude Code 2.1.285, read from the agent transcript), 124603 tokens, 25 tool uses, 273 s.

## Closed

Each finding is closed in `agents/briefs/7.md` (and one in `plan.md`) by the orchestrator before the preparation commit.

- Names, "the eight questions" in plan-terms line 58 and glossary line 63: item 4 changes the term **questions, the** to nine; both lines added to the paths.
- Names, `README.md:13`: item 6 and the paths cover it.
- The step line, "tracked file types": `plan.md`'s step 7 line corrected to "the languages of the repository's kind and of the files its folder holds"; the brief records the correction among its premises.
- The step line, the new input: item 1 adds the folder's file names to "What it reads".
- Premises, `<>` and `<const T>` in `cpp.md`: the premise lists them as C++ code, and item 1 defines a placeholder as a `<...>` that names what fills it, with a language's angle brackets in code left as they are; the placeholders inside inline code (`include/<lib>/`, `<name>::parseConfig`) are named.
- Premises, the second grep on the unchanged tree: the case says lines 145 and 156.
- Cases (a): the placeholder command leaves out the two C++ forms and the HTML-comment wording is gone.
- Cases (b): the run drafts the `standards` line by `/ordo-init` Steps 7 as changed, without running `/ordo-init`'s other steps.
- Cases (c): the answers give concrete values for each name and choice, the template value for each threshold, and "checked by reading at review" for each check; the report lists them.
- Cases, the unchanged-tree claim: the case says which cases pass there and that their reading parts fail.
- Cases, the Stops row "The draft": item 1 makes it show the placeholder list.
- Cases, item 3 narrowing `/ordo-init`: item 3 keeps "every standards page the repository has, wherever it is" and names the installed paths as examples.
- Cases, item 2's "one line per installed page": item 2 says two lines, one per group.
- The question, the pages not read: the first run's case reads each installed page and the scratch `CLAUDE.md` lines.
- The question, the Svelte run answering yes itself: the `.svelte` run leaves the question at its default and expects yes; a third run names SvelteKit in question 3 with no file and the kind alone giving TypeScript.
- Declined to judge, the version: decision 6, no version raised, as in steps 1 to 6.
