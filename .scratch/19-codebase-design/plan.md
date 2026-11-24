# Plan: 19. codebase-design

Execution ledger for roadmap entry 19 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A `codebase-design` skill with two modes. The `standards` mode fills the standards pages of an existing repository from the default pages `repo-setup` ships (the change standard, the design principles, the coding standards, the UI standard when the repository has a user interface, and the prose standard as it is): each rule stated in the concrete form it takes there, with the check that enforces it where one exists. The `review` mode reads the repository against its standards pages and writes candidates, each naming the page and the rule it breaks, its files and lines, the problem, the fix, the benefit and how strongly it is recommended, then grills through the one you pick into a roadmap entry. The skill finds the pages through the repository's `plan.yaml` when there is one, then under `docs/dev/`, then in the `repo-setup` folder beside its own. Its design follows mattpocock's `codebase-design` and `improve-codebase-architecture`: the agents, phases, cycles and stops are kept as the sources have them, and each deviation from them is made only with its reason and your ruling in the plan's Rulings.

## Gate

one real run of the `standards` mode on a scratch copy of Cathedra, where every point of Cathedra's existing "Design principles" section still stands and each addition the run proposes is reviewed by you, checked by reading both; one real run of the `review` mode on the same copy, each candidate reviewed by you, the one you pick written into the copy's roadmap through `grill`; no file of Cathedra itself is changed; each run made by a separate agent; the plan's ledger lists every deviation from the design of mattpocock's two skills, each with its reason and the ruling that approved it, and nothing else differs, checked by reading both; the verify list of `docs/dev/building.md` passes on main.

- The gate: could this pass without the goal being reached? no, each mode has one real run on a scratch copy of Cathedra that the user reads, the `standards` run is compared point by point with Cathedra's existing section, and the deviations are read against both sources.
- Step 1: could this pass without the goal being reached? no, the check reads the skill text against the skill layout and against both sources with the list of deviations, and the verify list runs on main; whether the skill works in a repository is step 2's part.
- Step 2: could this pass without the goal being reached? no, both runs are made by a separate agent that invokes the installed skill, and the user reads the pages and each candidate.

## Steps, in execution order

- ✅ 1 the skill: `skills/code/codebase-design/` with its `SKILL.md` in the skill layout, the modes `standards` and `review`, the search order of ADR 0047 for the standards pages, the default page used for a kind of page the repository lacks (ruling D12), the review ending in a roadmap entry through `grill`, and the sources' vocabulary, deepening page, design-it-twice page and report page as its reference pages; `README.md` and `docs/dev/` wired in as the skill layout asks; the ledger's list of every deviation from the two sources, each with its reason and its ruling; check: the skill follows `docs/dev/skill-layout.md`, read by the user, the deviations list read against both sources, and the verify list passes on main (1 commit) (approved)
- ✅ 4 the standards stop: `/codebase-design standards` shows its draft in the five groups and the forms of the ruling "The standards stop", with the rules found present in a file beside it, and has a rule for a default rule the code does not follow, for a default rule about a tool the repository lacks and for a default rule that contradicts a rule of the repository; it names `ordo-init`'s folder as the place of the default pages; check: the skill's text read against the ruling and the skill layout, and the verify list passes on main (1 commit) (ruling The standards stop)
- ✅ 5 the merge: `ordo-init` covers the three cases of the ruling "repo-setup merged into ordo-init", `skills/ordo/repo-setup/` is removed with its `templates/` folder moved to `skills/ordo/ordo-init/templates/`, and every skill outside `skills/code/codebase-design/`, every page under `docs/`, the README and the figures name `ordo-init` where they named `repo-setup`; check: `grep -rn 'repo-setup' skills README.md docs/dev docs/glossary.md utils` prints nothing outside `skills/code/codebase-design/`, the skill's text read against the skill layout, and the verify list passes on main (1 commit) (ruling repo-setup merged into ordo-init)
- ✅ 6 the defects of the runs: `ordo-init` no longer runs a verification command in a new repository whose tree holds nothing for it to run on; its shared rules name the prose standard without a fixed path, so the written `CLAUDE.md` names no page the repository lacks; it adds a glossary it writes in a configured repository to the plan configuration's `standards` list; it writes a `CLAUDE.md` that git ignores, leaves it ignored and out of the commit, and says so; the default Python page it writes names no tool the repository does not configure; it finds the `plan` and `roadmap` templates in the installed layout; `codebase-design standards` marks an estimated count as an estimate, shows a default rule that a sentence of the repository's pages contradicts as a difference, and counts a repository rule that the default only narrows as present; check: both skills' text read against the ruling "The defects of the runs" and the skill layout, and the verify list passes on main (1 commit) (ruling The defects of the runs)
- 2 the gate's runs, on a release candidate tagged and pinned on the user's word: one run of the `standards` mode on a scratch copy of Cathedra, where every point of Cathedra's existing "Design principles" section still stands and each addition the run proposes is reviewed by the user, by reading both; one run of the `review` mode on the same copy, each candidate reviewed by the user, the one the user picks written into the copy's roadmap through `grill`; no file of Cathedra itself is changed; each run made by a separate agent that invokes the installed skill, its stops answered by the orchestrator; after steps 4 and 5, on a release candidate that holds both: the `standards` run made again on a fresh scratch copy, and one run of `/ordo-init` on an empty folder, one on a scratch copy of an existing repository and one on a configured scratch copy, each by a separate agent (orchestrator, no agent) (approved) (ruling repo-setup merged into ordo-init)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.


## Rulings (2026-11-23)

- D2 one skill or two (2026-11-23): (a), one skill `codebase-design` with the modes `standards` and `review` (the user).
- D3 the pages the standards mode fills (2026-11-23): (a), every default page `repo-setup` ships: the change standard, the design principles, the coding standards (common and each language found), the UI standard when the repository has a user interface, and the prose standard copied as it is (the user).
- D4 what the review mode holds the code to (2026-11-23): (a), every filled standards page, each candidate naming the page and the rule it breaks, described in the source's vocabulary (the user).
- D5 what the review ends in (2026-11-23): (a), a roadmap entry written through `grill` (the user).
- D7 how the skill finds the standards pages (2026-11-23): (a), a search order that never refuses: the pages the repository's `plan.yaml` names when there is one, then the fixed names under `docs/dev/`, then the defaults in the `repo-setup` folder beside the skill's folder; replaces D1, which was not answered (the user).
- D8 the gate's runs (2026-11-23): (a), Cathedra only: one `standards` run whose pages hold every point of Cathedra's existing "Design principles" section, then one `review` run whose picked candidate is written into Cathedra's roadmap through `grill`; replaces D6, which was not answered (the user).
- D10 the roadmap diff of entry 19 (2026-11-23): (a), written as shown: the entry is titled `19. codebase-design`, with one skill of two modes, the search order and the two runs on Cathedra (the user).
- D11 record as ADR (2026-11-23): (a), yes: `docs/adr/0047-codebase-design-is-one-skill-made-from-two-sources-and-finds-the-standards-pages-by-a-search-order.md`, status proposed, holding D2, D5 and D7 (the user).
- D12 what the review does for a kind of page the repository lacks (2026-11-23): (a), it reviews against Ordo's default page for the missing kind, each such candidate saying that the rule comes from the default page, and a sentence of the default page that still holds an unfilled placeholder is skipped; replaces D9, which was not answered (the user).
- D13 carried, one skill (2026-09-29): "entry 19 shrinks to the `codebase-design` skill", carried from `.scratch/archive/2-e-grill/plan.md:94` (the user).
- D14 where the standards mode writes a page (2026-11-23): (a), beside the pages the repository already has, and under `docs/dev/` when it has none; the page is added to the `standards` list of the repository's `plan.yaml` when it has one (the user).
- D15 what the standards mode does with a page that exists (2026-11-23): (a), it compares and proposes additions only: a rule of the default page already in the repository's pages, wherever it stands, is left as written, and a missing rule is drafted in the form it takes there, at the place the repository keeps that kind of rule, written after the user's approval (the user).
- D16 the form of the candidates report (2026-11-23): (a), the source's HTML report, written outside the repository and opened for the user, with every style and diagram inline in the file and the before and after picture per candidate kept (the user).
- D17 where step 2's runs write (2026-11-23): (b), in a scratch copy of Cathedra; no file of the real repository is changed (the user).
- D18 the roadmap diff, with the plan's gate and step 2 (2026-11-23): (a), written as shown: both runs are made on a scratch copy of Cathedra, the `standards` run leaves every existing point standing and its additions are reviewed by the user, and no file of Cathedra itself is changed (the user).
- D19 record as ADR (2026-11-23): (a), D12 and D15 added to the decision of `docs/adr/0047-codebase-design-is-one-skill-made-from-two-sources-and-finds-the-standards-pages-by-a-search-order.md` as a refinement of the same record (the user).
- Deviations 8 to 16 (2026-11-23): approved as listed in `.scratch/19-codebase-design/deviations.md`: the skill layout with the sources' pages as `references/` files, `/grill` in place of the source's `grilling` and `domain-modeling`, the glossary and the ADR folder the repository's `plan.yaml` names, ASCII only, no `agents/openai.yaml`, the prose standard applied, agents on the runner's defaults, the user and the model may both invoke the skill, and the session reads each candidate's files and lines before the report (the user).
- Deviation 17 (2026-11-23): (a), the design terms of the vocabulary are defined only in the skill's `references/vocabulary.md` and are not added to `plan-terms.md` or the glossary (the user).
- Deviation 18 (2026-11-23): (a), in a repository with no plan configuration the review invokes `/ordo-init` at the pick, with its own draft and approval, then `/roadmap add` and `/grill`; when the user declines `/ordo-init` the skill ends with the report and says no entry was written (the user).
- ADR 0047 refined (2026-11-23): (a), its sentence on paths reads "The skill reads no standards page from a path outside the repository it runs in and its own skills folder.", so the report of D16 is written outside the repository (the user).
- The release candidate for step 2 (2026-11-23): after step 1 lands, a release candidate is tagged and pinned with `utils/pin.sh <tag>` for the gate's runs (the user).
- Open item A (2026-11-23): (a), the differences 19 to 26 from the two sources are approved as listed in `.scratch/19-codebase-design/deviations.md` (the user).
- No new roadmap entry (2026-11-23): all work this entry's runs propose is done in this entry, whichever skill it changes, `repo-setup` included; no roadmap entry is added for it (the user).
- The standards stop (2026-11-24): (a), `/codebase-design standards` keeps the whole comparison of a repository's pages with the default pages, and its stop "The draft" is short and not cryptic. It shows five groups: a default rule that contradicts a rule of the repository, in full (what the page says now, what the default says, what goes wrong with each), for the user's choice; the rules of the Ordo template that the page lacks, named in one line and not reprinted, with one yes or no for the group; a default rule the page lacks and the code already follows, one line each with its count, added unless the user strikes it; a default rule the page lacks and the code does not follow, one line each with what adopting it would break, not added unless the user names it; the default rules about a tool the repository lacks, in one line, not added. The rules found already present are one sentence in the stop, their list kept in a file the user is not asked to open. No line of the stop locates a rule by a line number alone (the user).
- repo-setup merged into ordo-init (2026-11-24): one skill, `ordo-init`, covers three cases by what it finds: an empty folder, where it writes the whole tree `/repo-setup` writes now; an existing repository, where it offers what is missing, the shared rules in `CLAUDE.md` included; a configured repository, where it checks the configuration and compares the shared-rules block and the plan-terms block with their templates, as `/repo-setup sync` does now. The skill `repo-setup` is removed. Its `templates/` folder, with the default pages, `sync_rules.py` and its test, moves to `ordo-init`'s folder with its files' content unchanged, and every skill, page and figure that names `repo-setup` names `ordo-init` (the user).
- Steps 4 and 5 run in parallel (2026-11-24): the step that fixes the standards stop and the step that merges `repo-setup` into `ordo-init` are built at the same time; step 2's runs follow both (the user).
- The defects of the runs (2026-11-24): one step fixes the nine defects the runs of step 2 on `v9.4.0-rc.2` showed, and the five runs of step 2 are then made to their end on a new release candidate, tagged and pinned without a further word, with no question to the user during them and one report at the end (the user).
  - A `CLAUDE.md` that git ignores stays ignored: the skill never changes the ignore rule or forces the file into a commit, and handles the ignored file.
  - A red command is red: no test or other file is ever written to make a command pass, by the skill or by the session that answers a run's stops.
  - The nine: a new repository cannot be set up because its test command has nothing to run; the written `CLAUDE.md` names a prose standard path the repository lacks; a glossary written in a configured repository is not added to the plan configuration; an ignored `CLAUDE.md` breaks the commit; the default Python page states tools the repository does not configure; the `plan` and `roadmap` templates are looked for in a folder the installed layout lacks; the standards draft shows estimated counts as exact; a default rule the repository's pages contradict is offered as a plain addition; a repository rule the default only narrows is shown as a difference.

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.
- ab12944454eff9c48: builder of step 1, claude-fable-5-2
- abf99cfe27e48f423: brief check of step 1, claude-fable-5-2
- aec236c414c8142fa: reviewer of step 1, claude-fable-5-2
- a0f46fdedb82ed703: reviewer of step 1 over round 1, claude-sonnet-5-5
- ab9a7ef09ce1a15fc: gate run of the standards mode, step 2, claude-fable-5-2
- a8d73c9c4d7eaf570: builder of step 5, claude-fable-5-2
- adb032fec2fe9803e: brief check of step 5, claude-fable-5-2
- a5a056ebb96ece6ae: reviewer of step 5, claude-fable-5-2
- add1fddfd58c551b7: reviewer of step 5 over round 1, claude-sonnet-5-5
- af1ee5368f50ec6e2: builder of step 4, claude-fable-5-2
- a3a640202fd2b636a: brief check of step 4, claude-fable-5-2
- a0f5e5d3a9d6b9ca8: reviewer of step 4, claude-fable-5-2
- a36ce253e9ce66cbf: reviewer of step 4 over round 1, claude-sonnet-5-5
- acbe2f1c6ca322be6: builder of step 6, claude-fable-5-2
- a33239329078fdf56: brief check of step 6, claude-fable-5-2
- a7057f07033744b86: reviewer of step 6, claude-fable-5-2
- a15943d1cd0d846a9: reviewer of step 6 over round 1, claude-sonnet-5-5
- adc8022a453c525b2: gate run of the standards mode on v9.4.0-rc.3, step 2, claude-fable-5-2
- a1136d134914ace47: gate run of the review mode on v9.4.0-rc.3, step 2, claude-fable-5-2
- af172707cbe2ca342: gate run of ordo-init on an empty folder on v9.4.0-rc.3, step 2, claude-fable-5-2
- a9479700a654c2165: gate run of ordo-init on an existing repository on v9.4.0-rc.3, step 2, claude-fable-5-2
- aaeb5620b1475d957: gate run of ordo-init on a configured repository on v9.4.0-rc.3, step 2, claude-fable-5-2
- aa62707e2037f74e7: gate run of the standards mode on v9.4.0-rc.4, step 2, claude-fable-5-2
- a92d37754d11b71c7: gate run of the review mode on v9.4.0-rc.4, step 2, claude-fable-5-2
- a3aac14008c7ec84e: gate run of ordo-init on an empty folder on v9.4.0-rc.4, step 2, claude-fable-5-2
- ace1d88975705aa94: gate run of ordo-init on an existing repository on v9.4.0-rc.4, step 2, claude-fable-5-2
- a7df954223e997d4a: gate run of ordo-init on a configured repository on v9.4.0-rc.4, step 2, claude-fable-5-2
- a442384b82998c183: gate run of ordo-init on an empty folder on v9.4.0-rc.5, step 2, claude-fable-5-2
- aeec4d98036270380: gate run of ordo-init on an existing repository on v9.4.0-rc.5, step 2, claude-fable-5-2

## Blocked, and by what

- 2: the seven defects of its runs on `v9.4.0-rc.3` were fixed on main by the user's ruling of 2026-11-24 (no further step; fixed outside a step), tagged `v9.4.0-rc.4`; its five runs on `v9.4.0-rc.4` each ran to their end on scratch copies with none of the seven left; three smaller defects those runs showed were fixed on main and tagged `v9.4.0-rc.5`, pinned, and the empty-folder and existing-repository runs were made again on it; the step is not ticked and waits on the user's reading of the report.
- 3: waits on step 2.

## Step 1, booked (2026-11-23)

- What landed: the skill `skills/code/codebase-design/` (`SKILL.md`, 208 lines, and `references/vocabulary.md`, `deepening.md`, `design-it-twice.md`, `report.md`), its figure `docs/figures/codebase-design.svg` with the function `codebase_design()` in `docs/figures/gen_figures.py`, its row, group sentence, figure sentence, image line and install loop in `README.md`, with "twenty-two" skills, and the figure's name in `docs/dev/building.md` and `docs/dev/scripts.md`. Ten files, 680 lines added and 7 removed against base 757fde1.
- Premise corrections: none after the brief check.
- The builder's first report did not pass its bar: the first review gave 13 findings, closed in repair round 1 by ten rulings (`agents/briefs/1-round-1.md`).
- Fixes at landing, three, from the run over round 1: the prompt line of agent 2 in `references/design-it-twice.md` reads "support many uses and extension" (P1); the paragraph under the title of `SKILL.md` gives each mode its own sentence (S1); the "Never substitute" line of `references/report.md` is one sentence (S2).
- Raised to the user: Open item A of the state file, the differences from the two sources that `deviations.md` does not list.
- Verification on main, through `checks.sh`: the 15 commands of the verify list, last line `checks: 15 commands passed`. After the fixes at landing: `LC_ALL=C grep -rn '[^ -~]' skills/code/codebase-design README.md docs/dev/scripts.md docs/dev/building.md` printed nothing, the frontmatter check printed `codebase-design 1020`, and `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/codebase-design.svg (11343 bytes)` and left the figure unchanged.
- The verify list: equal to the verification page's commands; the step changed one sentence of the page and no command.
- The look: `look:` names no place; the figure was rendered to an image and read, and every box and label is inside its frame.
- A/B: no `bench:` line.
- Usage: builder ab12944454eff9c48, 230741 tokens, 25 tool uses, 8.5 minutes for the build, and 263874 tokens, 8 tool uses, 2.2 minutes for round 1; brief check abf99cfe27e48f423, 190305 tokens, 23 tool uses, 5.9 minutes; reviewer aec236c414c8142fa, 207055 tokens, 21 tool uses, 5.8 minutes; reviewer over round 1 a0f46fdedb82ed703, 146291 tokens, 20 tool uses, 2.2 minutes.

## Step 5, booked (2026-11-24)

- Landed on main from the base 7219d6c: `skills/ordo/repo-setup/` removed, its `templates/` folder under `skills/ordo/ordo-init/templates/` (21 files, 18 byte-equal, 3 changed in the lines that name the skill), `skills/ordo/ordo-init/SKILL.md` 4.0.0 with the three cases (a new repository, an existing repository, a configured repository) and `references/new-repository.md`, and the name `ordo-init` in every skill, page, figure and ADR that named `repo-setup`, apart from `skills/code/codebase-design/` and ADR 0047, which step 4 writes, and the records of done and dropped roadmap entries.
- Outside the brief's paths, accepted: `.gitignore` line 6 is `/CLAUDE.md`, since the unanchored line ignored the moved `templates/CLAUDE.md`.
- The verify list and the `standards` line of the state file were rewritten to the moved paths before the landing (ADR 0010): the two `sync_rules` commands, the `check_config` test and the prose standard.
- Verification on main: `checks: 15 commands passed`; `python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` ends `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`; `grep -rn 'repo-setup' skills README.md docs/dev docs/glossary.md utils | grep -v '^skills/code/codebase-design/' | wc -l` prints 0.
- The builder's first report did not pass its bar: the first review found 13 points, sent back in round 1 with a ruling each (`agents/briefs/5-round-1.md`).
- Fixes at landing, from the review over round 1, all in `skills/ordo/ordo-init/`: the rule on what a written page states covers a configured repository (S1); the lines of "Read before you act" are read from the plan configuration, drafted or found (S2); the introduction says what is committed (S3); the reference page no longer cites a sentence the skill lacks (P1); "Run these commands", "each command's output" and "held against the ruling" in place of a second sense of check and comparison (T1); the rule on paths names the skill's own folders (T3); a declined plan configuration still gets the sync (B1); one count of sync runs and the outcome for a declined block (B2); how the folder of a `<folder>` with a project name is found (B3).
- Not changed: T2 of that review, "What it reads" 6 naming the reference page and the answers together, since splitting it renumbers every later item and its citations for no change in what a session does.
- No look and no A/B: `look:` and `bench:` are empty.
- Usage: builder a8d73c9c4d7eaf570 239605 tokens, 44 tool uses, 15.9 minutes, and round 1 294611 tokens, 13 tool uses, 5.1 minutes; brief check adb032fec2fe9803e 172993 tokens, 22 tool uses, 5.8 minutes; reviewer a5a056ebb96ece6ae 192040 tokens, 25 tool uses, 7.1 minutes; reviewer over round 1 add1fddfd58c551b7 190174 tokens, 24 tool uses, 4.8 minutes.

## Step 4, booked (2026-11-24)

- Landed on main from the base 7219d6c, after step 5: the standards mode of `skills/code/codebase-design/SKILL.md` sorts each default rule into present or one of five groups and shows the draft as a short stop, with an audit file and one file per new page in the temp folder; the README row, ADR 0047 and the figure `codebase-design.svg` say the same; the skill names the `ordo-init` folder for the default pages.
- `README.md` and `docs/figures/gen_figures.py`, shared with step 5, merged without a conflict.
- Verification on main: `checks: 15 commands passed`, run again after the fixes below; `grep -rn 'repo-setup' skills README.md docs/dev docs/glossary.md utils docs/adr/0047-*.md | wc -l` prints 0.
- The builder's first report did not pass its bar: the first review's findings were sent back in round 1 with 9 rulings (`agents/briefs/4-round-1.md`).
- Fixes at landing, from the review over round 1, all in the stop of the standards mode: the example's line of group 4 says the rule belongs to the new page B below (S1); an unanswered question drops its rule alone, a new page still written on its yes without it (S3); group 5 is defined where the groups are listed (S4); the new pages are lettered from A when there is no difference (S5); the draft's last line says that what is left unanswered counts as no (B1).
- No look and no A/B: `look:` and `bench:` are empty.
- Usage: builder af1ee5368f50ec6e2 185956 tokens, 25 tool uses, 11.9 minutes, and round 1 218111 tokens, 6 tool uses, 3.0 minutes; brief check a3a640202fd2b636a 171187 tokens, 27 tool uses, 5.7 minutes; reviewer a0f5e5d3a9d6b9ca8 138507 tokens, 15 tool uses, 4.8 minutes; reviewer over round 1 a36ce253e9ce66cbf 116459 tokens, 10 tool uses, 2.6 minutes.

## Step 6, booked (2026-11-24)

- Landed on main from the base 3e30f8b: the nine defects of the ruling "The defects of the runs" are fixed in `skills/ordo/ordo-init/SKILL.md`, its `references/new-repository.md` and `templates/shared-rules.md`, and in `skills/code/codebase-design/SKILL.md`; the sentence on where another skill's folder is found is corrected in `writing`, `code-comments`, `paper`, `grant`, `referee` and ADR 0047.
- Premise corrected: `grant`, `referee` and one place of `paper` name the `paper`, `paper-review-panel` and `writing` folders, where the old sentence was true; the same order is written there and kept (ruling 1 of round 1).
- Verification on main: `checks: 15 commands passed`, run again after the fixes below.
- The builder's first report did not pass its bar: the first review's findings were sent back in round 1 with 9 rulings (`agents/briefs/6-round-1.md`).
- Fixes at landing, from the review over round 1, four: `paper`'s sentence on a missing prose standard names its two paths; `ordo-init` leaves the commit question out of a bundle of questions when every file is ignored; `ordo-init` "Steps / A configured repository" 14 applies its read-back only when item 10 wrote the path; `codebase-design` sorts a repository rule that expressly allows what a narrowing default forbids as a difference.
- No look and no A/B: `look:` and `bench:` are empty.
- Usage: builder acbe2f1c6ca322be6 275049 tokens, 74 tool uses, 11.4 minutes, and round 1 295298 tokens, 5 tool uses, 2.2 minutes; brief check a33239329078fdf56 210438 tokens, 21 tool uses, 7.3 minutes; reviewer a7057f07033744b86 203494 tokens, 21 tool uses, 7.0 minutes; reviewer over round 1 a15943d1cd0d846a9 140941 tokens, 16 tool uses, 2.7 minutes.
