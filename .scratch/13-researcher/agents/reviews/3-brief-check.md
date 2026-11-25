# Brief check of step 3

## Names

1. `git grep -n -i 'novelty' -- . ':!.scratch'` turns up `docs/roadmap.md:83`: "- 10. idea: dropped, since the interview is `/paper plan`, and the novelty check is the `novelty` mode of entry 13." Once `idea` is a mode of `researcher` with its own interview, "the interview is `/paper plan`" is false (it already conflicts with D26 and ADR 0054). The line is outside "Paths this step writes".
2. The other hits of that grep need no change. They are in `docs/adr/0017-*.md:11` ("`idea` calls the same script for its novelty check", still true), ADR 0054 and its row in `docs/adr/README.md:63`, `docs/roadmap.md:26-27` (Goal and Gate), and the generic word "novelty" in `paper` and `paper-review-panel` pages (`review_criteria_framework.md:107,156`, `peer_reviewer_agent.md:258`, `failure_paths.md:240,249`, `socratic_mentor_agent.md:25`, `literature_strategist_agent.md:211`, examples). None of them is about the mode.
3. `git grep -n 'novelty_page\|notes/novelty\|researcher idea\|researcher novelty' -- .` finds hits only under `.scratch/`. No shipped hit.
4. `grep -n` on the Stops section of `skills/academic/researcher/SKILL.md` gives the intro "The checkpoints wait for the user, and so does every other row but the five refusals at the end". A new refusal "no idea given" makes the count "five" false. The brief does not name this count sentence (change-standard rule 14).
5. The title `# The integrity check and the manuscript pipeline` (SKILL.md line 8, read with `sed -n 1,130p`) is false once the skill has four modes. Brief item 1 asks only for "The title's paragraph".
6. "What it reads" 1 says "Each argument is a path." This is false for `<idea>`, which is "a sentence in quotes or the path of a file" (Open item G). The brief does not name this item.
7. "What it reads" 6 says `lookup.py` is "run by the integrity agent as `python3 ...`". In `novelty` the session runs it. Brief item 1 says "`lookup.py` as items 5 and 6 already find it", which leaves the integrity-only wording in place.
8. Stops row "lookup.py not found", "What it shows": "That the integrity agent looks every reference up with it". Stops row "A skill not installed": "That `researcher` runs that skill". Both are false for `novelty`, which does not run `paper` and does not start the integrity agent. Brief item 2 says only "(the rows that exist)".
9. Steps 1 sends a call that matches no Quick start line to `agents/pipeline_orchestrator_agent.md` "1. Intent Detection" and `references/mode_advisor.md`. `grep -n -A25 'Intent Detection'` shows that table routes only to Stages 2, 2.5 and 4. `git grep -n '/researcher'` shows `mode_advisor.md` names only `manuscript`. So "is my idea new" has no route to `novelty` or `idea`. Both pages are copied pages under ADR 0052. The routing therefore has to be written in SKILL.md Steps 1, and the brief does not say so.
10. The Use instead table already has "A literature search or a literature review only | `/paper lit-review`" and "A paper to plan chapter by chapter before it is written | `/paper plan`" (SKILL.md lines 24-31). Brief item 1 asks for those rows again, which would write one meaning twice (skill-layout, "Writing for an agent", "One meaning has one place"). Only the `/grill` row is new.
11. `docs/figures/gen_figures.py` lines 16-17, its head comment, say "researcher.svg: ... with what the integrity mode runs alone in its note." The new note makes that sentence incomplete. Brief item 6 does not name the head comment (change-standard rule 14).
12. "1.1.0": `git grep -n '1\.1\.0\|1\.0\.0' -- skills/academic/researcher docs README.md` finds only SKILL.md:5 and the unrelated `README.md:250` (pin tag). No other place to update.
13. "in both modes": `git grep -n -i 'both modes\|two modes\|in both'` finds only SKILL.md:58 in this skill. The README "two modes" hits belong to `codebase-design` and `paper`.
14. Quick start count: `git grep -l 'researcher' -- '*.sh' '*.py'` finds only the two figure scripts. No test or script reads researcher's SKILL.md or README rows. `skills/ordo/ordo-help/SKILL.md` reads the Quick start block and Use instead live (lines 53-54, 107, 118) and needs no change.
15. These hits stay true and need no change: `NOTICE.md:3` (the `integrity` and `manuscript` parts are adapted), `README.md:78` (`researcher` starts "an integrity agent and a compliance agent at each integrity check"), `skills/academic/paper/SKILL.md:70` ("whose research stage is not built yet"), `docs/dev/building.md:41`, `docs/dev/scripts.md:9`, `docs/figures/academic-pipeline/gen_academic_pipeline.py:138-139`.
16. Glossary terms: `sed -n 111p docs/glossary.md`, "round, of an interview", says: "In `grill` and in text that describes `grill`, the bare "round" means this; elsewhere it is a repair round." `idea`'s rounds, including the Stops row "each round", are in `researcher`, so the bare "round" there reads as a repair round. `sed -n 136p` shows "verdict" defined as the reviewer's judgment of a brief item. The per-claim `new` / `partly done` / `done` is a new sense. Skill-layout ("Writing for an agent") requires an entry for a term in a new sense, as "round, of a referee review" has under "Ordo's own terms". `docs/glossary.md` is not in "Paths this step writes".
17. The gate's `diff -r` of the copied modes' folder against academic-pipeline will print `Only in .../references: novelty_page.md` and the new SKILL.md hunks. Neither the brief nor `.scratch/13-researcher/deviations.md` gives them a ruling (ADR 0054 Consequences calls `idea` "this repository's own", and says nothing of `novelty`). This is ledger work for the orchestrator. It is not a builder path.

## The step line

1. "`SKILL.md` and its `references/` hold `novelty` as the goal gives it": items 1, 2 and 4.
2. "made by the session with no agent started": item 2, first bullet.
3. "a work confirmed as ruling D14 says": item 2, fourth bullet. The existing Rules bullet (SKILL.md line 209) already states D14, with "read as ... 'Looking a reference up' says". Item 2 writes the rule out again instead of pointing at that bullet, and its copy drops the field-by-field comparison that the cited section requires (`citation_compliance_agent.md:491`: "A candidate with a similar title can still be another publication").
4. "`idea` as ruling D26 and ADR 0054 give it": item 3. Two parts lack a requirement:
   - D26's "is reopened from Compare with the finding that changed the question" is covered only as a reopening of an existing README.
   - Open item G's "each novelty page of a round written to `notes/`" (one page per round) is not carried. Item 3 says only "runs `novelty` ... on each candidate claim", so whether each claim gets its own page or a round gets one page is left open.
5. "check: the text is read against ADR 0054 item by item": the case reads only ADR 0054's first Decision paragraph. The Alternatives-rejected item that `/grill` itself is not invoked has no case.
6. Items 5 and 6 (the README row and the figure) and item 7 (Deviations) have no part in the step line. They are justified by change-standard rule 5.

## Premises

Each command was rerun on main at `3f6e25d`.

1. `grep -n '^## \|^### '` prints Quick start 12, Use instead 22, What it reads 38, Steps 56, `### integrity` 101, `### manuscript` 111, The integrity check 201, Checkpoints 248, Stops 275, Anti-patterns 311, Rules 324. Holds.
2. An awk count of the Quick start block gives `quick start lines: 5`. Holds.
3. `grep -n -i 'novelty\|/researcher idea' skills/academic/researcher/SKILL.md` prints nothing (exit 1). Holds.
4. `ls skills/academic/researcher/references` lists 19 files, none about `novelty` or `idea`. Holds.
5. `lookup.py`: usage at line 6 (`resolve <DOI | arXiv ID | title> [--year <year>]`) and line 8 (`search <query>`); resolve described at line 29, search at line 32. The head comment runs from line 2 to line 142, so "head comment, lines 6 to 32" is a part of it. Holds as cited. Line 32 also says "arXiv has no search by a sentence: a sentence is read as its words joined by AND". This bears on searching "by the claim's own terms", and the brief does not carry it.
6. `paper/SKILL.md:20` and `:90` hold as quoted. `grep -n -i novelty skills/academic/paper/SKILL.md` prints nothing (exit 1). Holds.
7. Can a page in `notes/` reach `paper`? Yes, but only when the user names it at intake: `agents/intake_agent.md` "Step 8: Existing Materials" ("Literature / bibliography"), which goes into the Existing Materials row of `config.md`. `paper` "What it reads" 6 finds only lit-review and plan runs under `paper-runs/`. Full-mode Phase 1 (`paper/SKILL.md:360-361`) gives the strategist only "the `.bib` the Existing Materials row names", so a `.md` page reaches `config.md` and the draft writer (line 384) but not the strategist's screening. Line 360 and Checkpoint Rules 5 (line 944, "User can skip Phase 1 (literature) if providing own sources") mean that a page offered as the user's own literature can replace the search. The brief's "hand it back" condition is therefore not met. The brief should still tell the builder to say the page is named as Existing Materials and not as own sources that skip Phase 1.
8. README line 34 is the `researcher` row, and line 88 is the alt text of `researcher.svg`. Holds. The alt text carries no note text: `sed -n 88p README.md | grep -c 'runs one check alone'` prints 0, while the SVG holds the note.
9. "`skills/ordo/ordo-help/SKILL.md` reads each skill's description and Quick start block" is incomplete. For a sentence it also reads the Use instead table (lines 54, 118), which the step changes.
10. Brief line 15 says `/grill` names "the cheaper option". `grill` says "the lazy option named" and "a reference line for the configured design bar". Item 3 asks for neither. The builder cannot tell whether `idea` names the lazy option.
11. Brief line 18 says ADR 0024 and ADR 0033 "bind how a cited work ... is confirmed". Their Decisions bind how `paper`'s citation compliance agent reads sources and judges claims. Confirming a work is D14, and ADR 0017 for `lookup.py`, which the brief does not name.
12. Verify list: a `diff` of the state file's `verify:` against the block in `docs/dev/building.md` shows the same commands, differing only in the change standard's filters and comments, plus the ASCII line. Holds.
13. `python3 -c 'import yaml; ...'` prints `researcher 1010 {'version': '1.0.0'}`. That leaves 14 characters for two more modes, so the description has to be rewritten. The brief allows this.

## Cases and checks

1. Case 1 and Decision 4 (version "1.1.0") conflict with `docs/dev/skill-layout.md`, "Frontmatter": "A plan that changes a skill raises one part of its `metadata.version` once". `git log --follow -- skills/academic/researcher/SKILL.md` shows the skill was created in this plan's step 2 (`3f6e25d`, no tag). Step 3 raising to 1.1.0 and step 4 raising again would raise it more than once in one plan.
2. Item 1's Steps bullet, "each item ending on what makes it done where it can be half done", loosens skill-layout's "Each item of Steps ends on its completion criterion", which has no such qualifier.
3. No case covers change-standard rule 15 for the places where a supplied value reaches a command, a path or generated text:
   - the idea sentence reaching `lookup.py search` and `resolve`. The Rules bullet "Every path and every value the user gives reaches a command as one argument in single quotes" breaks on an idea that holds an apostrophe;
   - the sketch file and project folder paths;
   - the user's text written into the README section by `idea`.
4. Case "`grep -n 'novelty' README.md`: expected, the row of `researcher`, and the figure's alt text" does not match the tree as the step will leave it. The alt text is written from the boxes: the SVG `<title>` comes from `describe(title, panels)`, and no README alt text carries its figure's note (finding 8 under Premises). A change to the note alone leaves no "novelty" in line 88. The builder would have to add note text to the alt text, against the convention every other figure's alt text follows.
5. Case "`git status --short docs/figures` lists `gen_figures.py` and `researcher.svg` only" is right for the tree. I copied the script to the scratchpad and ran `python3 -I gen_figures.py` there: exit 0, and `cmp` of every SVG against `docs/figures/` printed no difference. `git check-ignore -v docs/figures/__pycache__` shows `__pycache__/` is ignored.
6. Case "seven lines" holds (5 + 2).
7. Item 3: "Each answer is written as it settles (see the next bullet)". The next bullet is the `novelty`-between-rounds bullet, so the reference points at the wrong bullet. Where a settled answer goes before the end is never stated, and the README is written only "when no choice is open". A session that ends mid-interview and is started again on a README with partial answers would be read as a "reopening" that "asks for the finding that changes it". No case covers a restarted, unfinished `idea` run (compare `grill` Steps 3, "An interview started again").
8. Item 3 says "a fact a file or a lookup gives is looked up and not asked", as `/grill` does it, which is with lookup agents. Item 6 states "neither starts an agent". The brief does not say that `idea`'s lookups are made by the session. If `idea` starts lookup agents, the Rules bullet "The agents a run starts are the integrity agent and the compliance agent" becomes false.
9. Item 2 sets no count on the searches per claim and no limit on "the nearest works". Skill-layout, "Writing for an agent", asks a repeat that ends on a condition to state its count.
10. Reference sections "The integrity check" and "Checkpoints" will not be read by `novelty` or `idea` runs. Skill-layout ("A reference section of row 6 ... holds only material every run reads") makes them out of place in a four-mode skill. The brief does not address this.
11. "No project folder" refusal for `idea` is tested on a folder that "does not exist" (What it reads 1). It is not stated whether `idea` on a new project needs the folder made first. The case "with no README" assumes the folder exists.
12. Case "`/researcher integrity` and `/researcher manuscript` followed through the Steps: the same run as before" checks a place the step changes (Steps 1 to 6). Holds.

## The question

Each entry answers "could this pass without the goal's sentences on `novelty` and `idea` being reached?"

1. Case 1 (frontmatter): yes. It checks a count and a version, not the content of the modes.
2. Case 2 (`##` headings): yes. It checks the layout only.
3. Case 3 (Quick start): yes. Two lines can stand without the runs.
4. Case 4 (`novelty` followed through Steps): no for the text. It does not show that the final message keeps the page from replacing `paper`'s search (Premises finding 7).
5. Case 5 (unconfirmed work): no.
6. Case 6 (second run, `-2`): yes. It is naming only.
7. Case 7 (`idea` with no README): partly. It does not check that answers are written as they settle, or what a restarted run does.
8. Case 8 (reopening): no.
9. Case 9 (claim found `done`): no.
10. Case 10 (goal and ADR 0054 sentences mapped to steps): no for the sentences it lists. It reads only ADR 0054's first paragraph, so the Alternatives-rejected item could be missed.
11. Case 11 (landed modes unchanged): yes. It guards the landed modes, not the goal.
12. Case 12 (`in both modes`): yes. It checks one sentence.
13. Case 13 (figure script): yes. It is the figure only.
14. Case 14 (`grep -n 'novelty' README.md`): yes, and it is mis-specified (Cases finding 4).
15. Step check: no, since each goal sentence and ADR item is looked for by reading. It is weakened by item 2 restating D14 without the field-by-field comparison.
16. Item 1 (SKILL.md sections): yes on its own, since it is the sections and the version.
17. Item 2 (`novelty`): no, except for the `paper` hand-over sentence, which could name Existing Materials in a way that lets `paper` skip Phase 1.
18. Item 3 (`idea`): could pass with "written as it settles" unmet, since the brief never says where the answers go.
19. Item 4 (`references/novelty_page.md`): no, as the form of the page.
20. Items 5, 6 and 7 (README, figure, Deviations): yes. They are documentation.

## Implied inputs

1. `docs/figures/academic-pipeline/gen_academic_pipeline.py` imports `gen_figures` (line 41, `import gen_figures as gf`). Expected: `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` exits 0 and `academic-pipeline.svg` is unchanged. Missing from Cases.
2. The head comment of `gen_figures.py` (lines 16-17) has to describe the new note. Expected: it says that the note also gives `novelty` and `idea`. Missing from Cases.
3. The note has to wrap without a word longer than a line, and every byte has to be ASCII (the error list at lines 58-79). Expected: exit 0. This is covered by case 13.
4. The SVG `<title>` and aria-label are unchanged when only the note changes, so README line 88 follows unchanged. Expected: no alt-text change, which contradicts case 14.
5. Every other figure is byte for byte the same. Expected: yes, shown by the scratch run and `cmp`. Covered by case 13.

## ADRs

1. ADR 0054: the step is under its first Decision paragraph, as the brief quotes. The brief does not contradict it. The Alternatives-rejected item "`/grill` itself invoked" binds `idea`'s text (it must not invoke `/grill`) and has no case.
2. ADR 0052, Consequences: "A later change to the copied stages, checks or stops contradicts this record". Reusing the copied refusal rows "lookup.py not found" and "A skill not installed" for `novelty` forces a change to their What it shows wording (Names 8). So do the Stops intro count (Names 4) and Steps 1 to 6 and their routing (Names 9). The brief says only that the step "leaves [the two modes] as they are". To stay inside ADR 0052, the brief should say whether those rows get new rows of their own or a wording change that leaves the copied behaviour as it is.
3. ADR 0053: "The project's `README.md` is its entry file: the question and claims, ..." and "A section that grows too long moves to `notes/`". `idea` writes that section and `novelty` writes into `notes/`. Consistent; the brief names it.
4. ADR 0017 (in force except the parts superseded by 0032 and 0034): "`idea` calls the same script for its novelty check." The step touches it through `novelty`'s use of `lookup.py`. "What is on the tree" does not name it.
5. ADR 0024 and ADR 0033 bind `paper`'s citation compliance agent, and reach `researcher` through SKILL.md Rules line 210. The brief cites them for confirming a work, which is D14 and ADR 0017 (Premises 11). No contradiction.
6. I read the status lines of all 54 records and the Decisions of 0002, 0012, 0026, 0032 and 0038 as well. None of them is touched beyond the above.

## Dictated text

1. `grep -n 'is this idea new'` gives line 30, the trigger phrases "a novelty check of an idea, is this idea new, the closest prior work, from a sketch to a research question, sharpen my research idea". Holds.
2. `grep -n '/researcher novelty <idea> \[<project folder>\]'` gives line 32, the command lines `/researcher novelty <idea> [<project folder>]` and `/researcher idea <project folder> [<sketch file>]`. Holds; they equal Open item G.
3. `grep -n '`new`, `partly done` or `done`'` gives line 42, the verdict terms. They break `docs/dev/skill-layout.md`, "Writing for an agent" ("A term that `docs/glossary.md` defines is used only in a sense it defines there"), since "verdict" is defined there in another sense. They need a glossary entry (Names 16).
4. `grep -n 'notes/novelty-<YYYY-MM-DD>.md'` gives line 43, with `-2` and `-3`. Holds.
5. `grep -n 'references/novelty_page.md'` gives lines 43, 52, 79 and 114. Holds (skill-layout, "Paths and names").
6. `grep -n 'no idea given'` gives line 45, the refusals "no idea given; `lookup.py` not found; the `paper` skill not installed". The new row name holds. Reusing "lookup.py not found" and "A skill not installed" as they stand breaks change-standard rule 14, a sentence made false (Names 8).
7. `grep -n 'see the next bullet'` gives line 48, "(see the next bullet)". It is a wrong cross-reference (Cases 7). The skill text is not affected.
8. `LC_ALL=C grep -n '[^ -~]'` on the brief prints nothing (exit 1). The brief is ASCII.

## Declined to judge

1. I did not run `python3 docs/figures/gen_figures.py` in the main checkout, since it writes files there. I ran a copy in the scratchpad instead.
2. I did not run the plan's verify list. Its result at this step does not depend on the brief.
3. I did not judge whether a four-mode description can fit in 1,024 characters. That is a property of text not yet written.
4. I did not read the remaining 49 ADR Decision sections in full. Their status lines and titles concern other skills or the plan machinery, and none governs a file, name or rule this step changes.

Usage: a5b81d093a7ce8107, claude-opus-5-5, 217367 tokens, 55 tool uses, 487 s

## Closed

Each finding is closed by a change to the brief `agents/briefs/3.md`, unless the line says otherwise.

- Names 1: no change. `docs/roadmap.md` line 83 records why entry 10 was dropped; the brief says it stays.
- Names 2, 3, 12, 13, 14, 15: no change needed, as the finding says.
- Names 4, 8; ADRs 2; Dictated text 6: item 1, Stops bullet: the new refusals get rows of their own, the two landed rows keep what they show, and the intro's count is made true.
- Names 5: item 1 says the title is rewritten for four modes.
- Names 6, 7: item 1, What it reads bullet, makes items 1 and 6 true for `<idea>` and for the session running `lookup.py`.
- Names 9: item 1, Steps bullet: routing to the new modes is written in `SKILL.md` Steps 1, the copied pages unchanged; a case added.
- Names 10: item 1, Use instead bullet: only the `/grill` row is new.
- Names 11: item 8 names the head comment.
- Names 16; Dictated text 3: item 5 adds the two glossary entries; item 3 writes "round of the interview"; `docs/glossary.md` added to the paths; a case added.
- Names 17: ledger work: the deviations list gets, at landing, the lines that cover `novelty_page.md`, the two moved pages and the new `SKILL.md` text in the gate's `diff -r`.
- The step line 3: item 2 points at the Rules bullet on `resolve` and its field-by-field comparison.
- The step line 4: item 3, reopening bullet, covers a call from Compare with its finding; item 3 and Decision 5 give one novelty page per round.
- The step line 5; ADRs 1: "What is on the tree" names the rejected alternative; item 3 says `idea` invokes no `/grill`; a case added.
- The step line 6: no change; items 7 to 9 rest on change-standard rule 5.
- Premises 5: item 2 says each query is a short list of key terms, with the reason.
- Premises 7: item 2's final-message bullet names the Existing Materials row and Phase 1 kept.
- Premises 9: "What is on the tree" says `/ordo-help` reads the Use instead table too.
- Premises 10: item 3 names the lazy option per choice; Decision 6 gives no design-bar line, with the reason.
- Premises 11; ADRs 4, 5: "What is on the tree" names ADR 0017 and says what ADRs 0024 and 0033 bind.
- Premises 13: "What is on the tree" says the description is rewritten.
- Cases 1: the version stays "1.0.0" (Decision 7), case 1 expects it.
- Cases 2: item 1's Steps bullet says each item ends on its completion criterion.
- Cases 3: item 2's last bullet makes the Rules bullet on values true for a single quote; two cases added.
- Cases 4; Implied inputs 4: item 7 leaves the alt text as it is; the README case expects the row only.
- Cases 5, 6, 12: no change needed.
- Cases 7: item 3 writes each answer to `notes/idea-<date>.md` as it settles and continues a restarted interview; Decision 4; a case added; the wrong cross-reference is gone.
- Cases 8: item 3 says the session holds the interview and starts no agent.
- Cases 9: item 2 sets three searches and at most five nearest works per claim; Decision 3.
- Cases 10: item 1's last bullet and item 6 move "The integrity check" and "Checkpoints" to pages of `references/`, every naming place updated; Decision 8; paths and a case added.
- Cases 11: item 3 makes a missing project folder; the refusal is a missing argument.
- Implied inputs 1: case and check 2 added for `gen_academic_pipeline.py`.
- Implied inputs 2: item 8 names the head comment.
- Implied inputs 3, 5: covered by the figure case, as the finding says.
- Dictated text 1, 2, 4, 5, 8: hold.
- Dictated text 7: the cross-reference is gone.
- The lines of the brief rewritten or added after the check were held line by line against the rules file and the standards pages: the command lines, the file names `notes/novelty-<YYYY-MM-DD>.md`, `notes/idea-<YYYY-MM-DD>.md`, `references/novelty_page.md`, `references/integrity_check.md`, `references/checkpoints.md`, the verdict words, the two glossary entry names and the term "round of the interview"; each holds.
