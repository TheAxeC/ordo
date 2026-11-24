# Step 1 brief check (on main at 43b50aa)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. Every command was run from `/Users/axelfaes/workspace/ordo`. Nothing was written, edited, staged or committed. The brief is `.scratch/19-codebase-design/agents/briefs/1.md`, called "the brief" below.

Twelve findings need a change to the brief or a ruling before a builder gets it. The four that block a correct build:

- Verify item 4 demands `grep -c 'twenty-two' README.md` prints 1, and a correct build prints 2 (check 1).
- `docs/dev/building.md` says every skill that launches agents has its figure, and the brief's decision 2 gives this skill none (checks 1 and 2).
- ADR 0047's Consequences say a review that ends without a roadmap entry contradicts the record, and the brief ends the review that way in a repository with no plan configuration (check 7).
- Deviations 8 to 16 carry no ruling, and the brief builds on them (check 2).

## 1. Names

- `codebase-design` (the skill's name and folder): `grep -rn 'codebase-design' . --exclude-dir=.git --exclude-dir=.scratch`. Hits outside the paths: `docs/roadmap.md:23` and `:26` (entry 19), `docs/adr/README.md:56`, and `docs/adr/0047-...md:1`, `:7`, `:11`. None is made false: each describes the skill the step builds.
- "twenty-one": `grep -c 'twenty-one' README.md` prints `2`. `grep -n -o '.\{60\}twenty-one.\{40\}' README.md` prints line 35, "Installed, the twenty-one skills stand side by side in one folder". The earlier `grep -n -i 'wizard\|twenty-one' README.md` also shows line 170, "The loop copies each of the twenty-one skills". Both lines are inside the brief's paths (29-35 and 159-170), and both become false.
- The count of skills: `ls skills/*/*/SKILL.md | wc -l` prints `21`, so "twenty-two" is the right word after the step.
- `code/wizard` and the sentence on `skills/code/`: `grep -rn 'code/wizard\|diagnose.*and.*wizard' . --exclude-dir=.git --exclude-dir=.scratch`. `README.md:35` and `README.md:159` are inside the paths. `docs/roadmap.md:94`, `docs/dev/building.md:19`, `docs/dev/scripts.md:18` and `:51`, and `docs/dev/change-standard.md:83` name wizard's own files and stay true.
- Other places that list or count the skills:
  - `docs/dev/building.md:40` (`grep -n -o 'Every skill that launches agents[^.]*\.' docs/dev/building.md`): "Every skill that launches agents has its figure under `docs/figures/`." It is outside the paths and is made false. The skill starts a scan agent and three or more design agents, and the brief's decision 2 says "The skill has no figure under `docs/figures/`".
  - `docs/figures/gen_figures.py:2251-2253`, the note "These start no agent: ...": stays true, since the skill starts agents.
  - `utils/pin.sh` (`grep -n 'skills/' utils/pin.sh`, lines 22, 174-179): finds skills by the pattern `skills/<group>/<name>/SKILL.md`. No list, so nothing is made false.
  - `skills/ordo/ordo-help/SKILL.md:10` and `:88`: prints "every skill in the folder that holds this skill". No list, so nothing is made false.
  - `README.md:7`, the introduction: names seven skills and leaves `wizard` and `code-comments` out, so it is no full list. Not made false.
  - `skills/ordo/repo-setup/templates/docs/glossary.md:3`: lists the skills whose terms the plan-terms block holds. Not made false while the skill adds no glossary term.
- The mode names `standards` and `review`, the stop names "The draft" and "The candidates", and the files under `references/`: new names inside the new folder. `ls skills/code` prints `code-comments diagnose wizard`, so there is no clash.
- The term "kind" (of standards page): `grep -n '^- \*\*kind' docs/glossary.md` prints lines 58 and 59. "kind" is a defect sentence of `/plan-retro`, and "kind, of an open item" is the second entry. See check 8.

Findings:

1. Verify item 4 (`grep -n 'twenty-two' .scratch/19-codebase-design/agents/briefs/1.md`, line 174) says `grep -c 'twenty-two' README.md` prints 1. "twenty-one" stands on two lines, 35 and 170. A builder who changes both gets 2 and fails the check. A builder who satisfies the check leaves one line false. The premise on line 17 of the brief names only line 170.
2. `docs/dev/building.md:40` is made false by decision 2 and is not in the paths. Closing it takes either a figure for the skill, or a changed sentence in `building.md` with a ruling. A figure means `docs/figures/gen_figures.py`, a new svg, the figure line in `README.md` beside lines 73-87 and the list of figures in `building.md`. Plan 18's step, for comparison, changed `docs/figures/gen_figures.py` and `docs/figures/pipeline.svg` (`git show --stat 55d4464`).

## 2. The step line

- "`skills/code/codebase-design/` with its `SKILL.md` in the skill layout": "The files" 1 and "What it must do", bullets 1 to 5.
- "the modes `standards` and `review`": "The mode `standards`" and "The mode `review`".
- "the search order of ADR 0047 for the standards pages": "The standards pages and the search order".
- "the default page used for a kind of page the repository lacks (ruling D12)": "The mode `review`", bullet 3.
- "the review ending in a roadmap entry through `grill`": "The mode `review`", the bullet "The picked candidate then becomes a roadmap entry (D5)".
- "the sources' vocabulary, deepening page, design-it-twice page and report page as its reference pages": "The files" 2 to 5.
- "`README.md` ... wired in": "The files" 6 and "The README row".
- "`docs/dev/` wired in as the skill layout asks": no requirement. `grep -n 'docs/dev' .scratch/19-codebase-design/agents/briefs/1.md` finds no line that changes a page under `docs/dev/`, and no line that says none needs a change.
- "the ledger's list of every deviation from the two sources, each with its reason and its ruling": `deviations.md` exists and the brief points at it. Its items 8 to 16 stand under "Forced by this repository's rules, awaiting the user's ruling" and carry no ruling.
- "check: the skill follows `docs/dev/skill-layout.md`, read by the user, the deviations list read against both sources, and the verify list passes on main": "Verify before you report" 5 and 6, the Report part "Every difference from the two sources that `deviations.md` does not list", and "The plan's whole verify list runs once, at landing on main".
- "(1 commit)": the landing's, with no requirement needed.

Findings:

3. "`docs/dev/` wired in" has no requirement. Finding 2 names the page under `docs/dev/` that the step makes false.
4. Deviations 8 to 16 have no ruling. The plan's goal says "each deviation from them is made only with its reason and your ruling in the plan's Rulings". The brief builds on them: decision 1 is item 14, decision 4 is item 15, the convention "ASCII only" is item 11, and "The mode `review`" bullet 6 is item 16.

## 3. Premises

- `skills/code/` holds three skills: `ls skills/code` prints `code-comments diagnose wizard`. Matches.
- The default pages and their line counts: `wc -l` prints 72, 16, 75 (prose standard), 11, 13, 77, 43, 49. Matches.
- The placeholder: `grep -n '<' .../design-principles.md` prints lines 6, 13 and 16, with `<the layers, top down>` on line 6. Matches.
- `repo-setup` and the extensions: `grep -n 'extension' skills/ordo/repo-setup/SKILL.md` prints line 32 with the three languages. `sed -n '84p'` prints the Svelte sentence. Matches.
- `paper`'s wording: `sed -n '75,78p' skills/academic/paper/SKILL.md` prints the quoted words. Matches.
- `wait-what`: `grep -n 'glossary' skills/ordo/wait-what/SKILL.md` prints lines 28 and 29 with the quoted words. Matches.
- `code-comments`: `grep -n -i 'effort' skills/code/code-comments/SKILL.md` prints lines 74 and 102, and line 102 holds the quoted words. Matches.
- `README.md`: `grep -n -i 'wizard\|twenty-one' README.md` prints lines 29, 35, 159 and 170. The four places match. The brief leaves out that line 35 also holds "twenty-one".
- `gen_figures.py`: `grep -n 'These start no agent' docs/figures/gen_figures.py` prints 2251, and line 2252 holds `/wizard`. Matches.
- The sources: `wc -l` over the five copies in `src19/` prints 114, 37, 44, 71 and 123. `grep -n 'https\?://' src19/HTML-REPORT.md` prints lines 13 (Tailwind) and 15 (Mermaid). Matches.
- ADR 0047: status proposed, and each quoted sentence stands in its Decision (`cat docs/adr/0047-*.md`). Matches.
- ADR 0035: its Decision holds "`writing` starts each of its agents on the runner's default agent with the runner's defaults in every setup". Matches.
- "No ADR sets how a skill under `skills/code/` starts its agents": differs. ADR 0014's Decision reads "`/code-comments` reads no `plan.yaml`. It starts its finding agent, its checking agent and its rewrite agent on the runner's default agent with the runner's defaults, and their prompts set no model and no effort."
- The verify list: the configuration block's `verify:` holds 15 items and the `sh` block of `docs/dev/building.md` holds 15 commands, the same commands read side by side. Matches.

Findings:

5. The premise on `README.md` omits the second "twenty-one", on line 35. See finding 1.
6. The premise "No ADR sets how a skill under `skills/code/` starts its agents" is wrong as written. ADR 0014 sets it for `code-comments`, the form decision 1 copies. No ADR sets it for the group or for this skill.

## 4. Cases and checks

Each of the twelve cases was read against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, the prose standard and the glossary.

- Cases 1 to 6, 8 to 10 and 12 are consistent with the rules file and the standards.
- Case 7 (`review` with no plan configuration, "writes no roadmap entry") is consistent with the rules file and clashes with ADR 0047. See check 7.
- Case 11 (the frontmatter) is consistent with `skill-layout.md`, "Frontmatter".
- No case asks the builder to check, quote or explain a place the step does not change.

Findings, including requirements the builder cannot carry out as written:

7. The Report section (`grep -n 'in the main checkout'`, line 182) tells the builder to write the report "in the main checkout". `change-standard.md`, "Where the work happens", says the work is done "In the git worktree the brief names, never in the main checkout". The glossary entry "ledger" says the builder writes its report in the worktree's copy, which the orchestrator copies to main. The `spec` template's line 96 has no such words.
8. The convention "No source attribution ... in any file of the skill" (line 161) meets "The four reference pages keep the sources' content". The sources credit three origins inside their content: `_(Michael Feathers)_` at `codebase-design-SKILL.md:22`, "(Ousterhout)" at `:107`, and 'Based on "Design It Twice" (Ousterhout)' at `DESIGN-IT-TWICE.md:3`. The brief does not say whether these stay.
9. Decision 4 says the model may invoke the skill "since the vocabulary serves any work that designs a module". "What it must do" lists only `/codebase-design standards`, `/codebase-design review` and `/codebase-design review <area>`. The source's `codebase-design` is used on its own for designing a module. The brief gives no invocation or step for that use, and `deviations.md` does not list its loss.
10. Search-order place 1 says the `plan.yaml` is "found as `/plan`'s 'What it reads' 1 finds it". That section starts from "the folder named in the call", and in the `projects:` form the keys `rules` and `standards` belong to a project. The skill's invocations name no folder and no project, so the builder cannot say which pages place 1 gives for such a repository.
11. "The mode `review`", last bullet: the ADR for a rejected candidate is "written on the user's yes in the repository's ADR folder". The brief gives no format for the record and no behaviour for a repository without an ADR folder. Deviation 9 says the ADR work is done by `/grill`, and here the skill writes the record itself.

## 5. The question

"The goal" is the part step 1 delivers: the skill's text with both modes, the search order, the reference pages and the wiring.

- The check on the step's line: yes, narrowly. A skill can follow the layout and differ from the sources only as listed while its `standards` mode is wrong against D3, D14 or D15, since that mode has no source to be read against. The brief's cases close this by reading.
- Cases 1 to 9 and 12: no. Each is read against the skill's text, and each names a behaviour the text must state.
- Case 10 (the report with no network): no, provided `references/report.md` states the rule, which "The files" 5 requires.
- Case 11 (the frontmatter): yes. It is a fact check and does not claim more.
- Verify 1 (the character set), 2 (name and length), 3 (no address) and 5 (the headings): yes for each. They are fact checks, as `change-standard.md` rule 6 allows. Verify 3 also goes red on an `xmlns="http://www.w3.org/2000/svg"` attribute, which loads nothing. HTML needs no such attribute on inline SVG, and the brief does not say to leave it out.
- Verify 4: yes, and it is wrong as written (finding 1). `grep -c 'code/codebase-design' README.md` is met by the install loop alone, with no table row and no change to line 35.
- Verify 6 (the reading of list items and sentences): no.

Findings: finding 1 covers verify 4. Otherwise none.

## 6. Implied inputs

Not a code step. The brief says "No script is written for this step" and "No test is written: the step builds no script", and nothing in "What to build" contradicts that.

Findings: none.

## 7. ADRs

All 47 records were read for their status and Decision.

- 0047 (proposed): touches the step, under its whole Decision. The brief names it.
- 0014 (proposed): governs `code-comments` only and does not touch the step. It is the source of the form decision 1 copies, and the brief does not name it (finding 6).
- 0030 and 0035 (proposed, in part superseded): govern `paper` and `writing`. They do not touch the step. The brief names 0035.
- 0045 and 0046 (proposed): govern `wait-what` and `wizard`. They do not touch the step.
- 0012 (proposed): "Every commit a skill makes on main names its paths". It does not touch the step, since decision 3 says the skill makes no commit.
- 0001 to 0011, 0013, 0016 to 0029, 0031 to 0034 and 0036 to 0044: govern the plan skills, the cost script, `writing`, `paper` and `grant`. None touches the step.

Findings:

12. The brief contradicts ADR 0047 in one place and sits against one of its sentences in another.
    - The Consequences read "A change that splits the skill, fixes a page's path, or ends the review without a roadmap entry contradicts this record and needs a record that supersedes it." "The mode `review`" bullet 12 and case 7 end the review with no roadmap entry in a repository with no plan configuration. `/roadmap` and `/grill` both refuse without a `plan.yaml` (`roadmap` "What it reads" 1, `grill` "What it reads" 1), so the branch is real. This is a rule clash and needs a ruling. The same branch drops the source's grilling loop whole, which `deviations.md` does not list.
    - The Decision reads "The skill names no path outside the repository it runs in and its own skills folder." "The mode `review`" bullet 9 writes the report "to the operating system's temporary folder as the source says", and the source names `$TMPDIR`, `/tmp` and `%TEMP%`. D16 rules the report "written outside the repository". Read to the letter the two clash; in my judgment the ADR sentence is about where the standards pages are found, and the session should rule which reading holds.

## 8. Dictated text

- `metadata.version` "1.0.0": `grep -n '"1.0.0"'`, line 33. Holds (`skill-layout.md`, "Frontmatter").
- "twenty-one" becomes "twenty-two": `grep -n 'twenty-two'`, line 38. Holds, and the count is right. The brief does not say it applies to both lines (finding 1).
- The heading "Going deeper" of `references/vocabulary.md`: `grep -n 'Going deeper'`, line 34. Holds: it is a label, and the noun-phrase rule of `skill-layout.md` binds the sections of `SKILL.md` only.
- The stop names "The draft" and "The candidates": `grep -n '"The draft"\|"The candidates"'`, lines 62, 77 and 155. Hold.
- The badge values `Strong`, `Worth exploring`, `Speculative`: `grep -n 'Worth exploring'`, line 73. Hold.
- The invocations `/codebase-design standards`, `/codebase-design review`, `/codebase-design review <area>`: `grep -n 'codebase-design review'`, lines 67 and 153. Hold. Line 67 writes `[area]` and line 153 `<area>`.
- The term "kind" for a kind of standards page: `grep -n -o 'kinds\? of [a-z ]*page\|[Aa] kind [a-z ]*'`, lines 12, 20, 44, 50, 57, 59, 71 and 90. Breaks `skill-layout.md`, "Writing for an agent", third bullet: "A term that `docs/glossary.md` defines is used only in a sense it defines there. A skill that needs a new term, or a term in a new sense, adds or changes its entry in `skills/ordo/repo-setup/templates/plan-terms.md` first". The glossary defines "kind" as a defect sentence of `/plan-retro`. The brief's own convention on line 163 repeats the rule, and `plan-terms.md` and `docs/glossary.md` are not in the paths.

Findings:

13. "kind" is used in a sense the glossary does not define. Closing it takes either another word in the brief and the skill, or an entry in `plan-terms.md` with `docs/glossary.md` synced and both files added to the paths.
14. The convention on line 163, "The design terms of `references/vocabulary.md` belong to the skill and are not added to the glossary", sits against the same bullet's "A skill that needs a new term ... adds ... its entry". The terms module, interface, seam, adapter, depth, leverage and locality are new terms the skill uses in a sense of its own. This needs a ruling or a reason in the brief.

## Closed

Each finding with the change to the brief that closes it, or the ruling that closes it.

1. Verify item 4 now expects `grep -c 'twenty-two' README.md` to print 2 and checks the table row and the group sentence by their own greps.
2. The skill gets its figure: `docs/figures/gen_figures.py`, `docs/figures/codebase-design.svg`, the figure line of `README.md` and the list of figures in `docs/dev/building.md` are in "What to build" and in the paths. Decision 2 is removed.
3. Closed with finding 2: the page under `docs/dev/` the step changes is `building.md`, and the brief says no other page under `docs/dev/` needs a change.
4. Ruled by the user: "Deviations 8 to 16" of the plan's Rulings.
5. The premise names both lines that hold "twenty-one", 35 and 170.
6. The premise names ADR 0014 as the record that sets the form for `code-comments`, and says no ADR sets it for this skill.
7. The report's path is given as the template gives it, with no words on the main checkout.
8. The brief says the credits the sources give inside their content (Feathers, Ousterhout) stay, as content; the convention bans a credit or a license text for the two source skills.
9. The brief keeps the call with no mode, which keeps the source's use of the vocabulary on its own.
10. The brief says which `plan.yaml` place 1 reads: the first of the three places at the repository root, and in the `projects:` form the `rules` and `standards` of every project.
11. The brief gives the ADR's form (the folder's `template.md` or its latest record, status proposed) and the folder created from the `repo-setup` skill's templates when the repository has none; deviation 9 says `/grill` does the glossary and ADR work for the picked candidate only.
12. The first part is ruled by the user, "Deviation 18": `/ordo-init` at the pick, then `/roadmap add` and `/grill`. The second part is ruled by the user, "ADR 0047 refined": the record's sentence now speaks of standards pages.
13. The brief and the skill say "subject" for what a standards page is about, in place of "kind".
14. Ruled by the user, "Deviation 17": the design terms stay in the skill's reference page.

The remark under check 5 on verify 3 is closed: the brief says an inline SVG carries no `xmlns` attribute. The two spellings `[area]` and `<area>` are made one, `[area]`.

## Declined to judge

- Whether the design of the `standards` mode meets D3, D14 and D15 in a real repository: step 2's runs settle that, not a read of the brief.
- Whether deviations 8 to 16 should be ruled by the user or closed under self-rule: the session's or the user's call.
- Whether ordinary words that are also qualified glossary terms ("place", "case", "part", "step") break the glossary rule where the brief uses them plainly: only the bare entry "kind" was judged.
- Whether `change-standard.md` rule 16 ("A write verifies its own result") binds the skill's own write to a repository's `plan.yaml` in the `standards` mode: the rule's reach over a skill's runtime steps is a matter of reading the user should settle.
- Whether the source's "widen the net" equals the brief's "the whole repository is read": a wording judgment.

Agent usage: abf99cfe27e48f423, claude-fable-5-2, 190305 tokens, 23 tool uses, 5.9 minutes.
