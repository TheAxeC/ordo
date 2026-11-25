# Brief check: step 2

Brief check of step 2 of roadmap entry 13 (brief `.scratch/13-researcher/agents/briefs/2.md`, main at b5dbf2b). Read only: no file in the repository was written, and no state-changing git command was run. To check that the figures can be regenerated, both scripts were run on a copy of `docs/figures` in the scratchpad (`/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/figcopy`).

## Names

1. The README install loop leaves `researcher` out. `grep -n 'for skill in' README.md` prints line 165, whose list ends `academic/paper academic/paper-review-panel academic/referee academic/submit academic/grant academic/writing; do`. That line is outside "README.md lines 9-125". If the brief does not change it, a user who installs from the README never gets `researcher`, so none of the four command lines runs. This defeats "What it must do". `utils/pin.sh` finds skills by itself (line 179, `s#^\(skills/[^/]*/[^/]*\)/SKILL\.md$#\1#p`), so only the README loop is affected.
2. README line 176 says "The loop copies each of the twenty-three skills", and the step makes it false (24 skills). It is outside the paths. Line 37 ("Installed, the twenty-three skills" and the list of `skills/academic/`) is inside 9-125, so "any sentence made false" covers it.
3. `skills/academic/paper/SKILL.md:70`, the Use instead row of `paper`, reads "| Full research-to-paper pipeline: ... the integrity check of a finished manuscript's references, claims, numbers and figures, and its ethics check | `researcher` (roadmap entry 13, not built yet) |". The step builds exactly that check, so "not built yet" becomes false. The file is not in the paths.
4. `docs/roadmap.md:29` holds a hand-written alt text of `academic-pipeline.svg`: "1 Research goes to researcher, entry 13 (not built yet); 2.5 Integrity check goes to researcher, entry 13; ... 4.5 Final integrity check goes to researcher, entry 13". Item 8 changes the `RS` label, so this line no longer describes the figure. It is not in the paths.
5. `skills/academic/researcher/references/reinforcement_content.md:3` names "the Mid-Conversation Reinforcement Protocol", a `##`/`###` heading of the source's `SKILL.md` (source line 289). The layout allows no such heading in the new `SKILL.md`, so the pointer resolves to nothing unless `SKILL.md` keeps that name as a label in the step that holds it. The page is not in the paths, and item 5 forbids changing any other line of a copied page.
6. Other hits that name `SKILL.md` or its keys, besides the three pages the brief lists (`git grep -n 'SKILL.md' skills/academic/researcher`):
   - `references/artifact_reproducibility_pattern.md:40,62,94`: `metadata.version` and a hash of `SKILL.md`. These still hold.
   - `agents/state_tracker_agent.md:66,258`: these still hold.
   - `references/two_stage_review_protocol.md:11,24` and `agents/pipeline_orchestrator_agent.md:338`: these name `paper-review-panel`'s `SKILL.md`, are unaffected, and conflict with case 12 (see Cases and checks 2).
7. `compliance_agent.md:6-7` keeps `data_access_level` and `task_type` in the agent's own frontmatter. Decision 1 does not make this false.
8. `researcher.svg` has no hit (`git grep -n researcher.svg` prints nothing).
9. `RS` has one hit, `gen_academic_pipeline.py:138`, and its title text in `academic-pipeline.svg:2`, which is regenerated.

## The step line

Every part of the step line is served:
- carrying the source `SKILL.md` into the layout under D1-D6, D16, D17, D20, D31 and ADR 0052: items 1 and 2;
- the README row: item 6;
- the figure: item 7;
- the academic-pipeline figure: item 8;
- `gen_figures.py` runs: case 14;
- the reading against ADR 0052: case 13;
- `deviations.md` extended: item 10.

No part of the line is without a requirement. Items 5 and 9 follow from it. The brief adds D14, D21 and D24, which the step line does not name. That is consistent with the Rulings.

## Premises

Commands rerun and their output:
- `find skills/academic/researcher -type f | wc -l` prints 27. `ls` prints `agents examples references templates`. Holds.
- `wc -l` of the source prints 623, and `grep -n '^## '` gives the same 29 headings, from Quick Start (35) to Changelog (621). Holds.
- Frontmatter keys (source lines 1-14): holds.
- Line 14 of the brief is incomplete. `git grep -n 'SKILL.md' skills/academic/researcher` prints 12 hits in 7 files, not only the three pages named (see Names 6). The incompleteness matters for case 12.
- Line 15 of the brief is false. It says "The figures are shown from line 71 to line 125, ... each with the description the script prints as its alt text", and item 6 says "its alt text the description `gen_figures.py` prints for it". The script prints only `wrote <path> (<n> bytes)` lines (`main()`, lines 2397-2405). I compared every README alt text with its SVG `<title>` using a python regex over README.md: 23 of 24 differ, and only `paper/lifecycle.svg` matches. For example, README "The first round of the referee skill: You answer the intake, a stop; ..." against title "The first round of the referee skill. Boxes: You answer the intake (stop); ...". The alt texts are hand-written, so item 6 cannot be built as written.
- README lines 31 and 33, and figures at 71-125: holds. `grep -n researcher README.md docs/figures/gen_figures.py` prints nothing. Holds.
- `referee()` is at line 1927, and no test script exists: holds.
- `gen_academic_pipeline.py:138` holds verbatim.
- `building.md:41` and `scripts.md:9,10`: holds.
- The `paper` and `paper-review-panel` Quick start lines quoted, and `templates/lookup.py`, exist: holds.
- `ordo-help` (lines 53-54 and 125): holds. For a sentence it also reads the Use instead table (line 54), which the brief does not mention.
- Running both scripts on a scratch copy exits 0, and `diff -r -x __pycache__` of the copy against the tree prints nothing (IDENTICAL). So "every other figure byte for byte" can be checked. `__pycache__/` is ignored (`.gitignore:4`).

## Cases and checks

1. The brief creates a rule that no ruling gives, and a copied page contradicts it. Item 2 says `integrity` "changes no file of the manuscript: the verdict and the issue list go to the user", and case 4 checks it. Grepping the ledger, the ADRs and the roadmap for that rule finds it only in the brief, and it is not in "Decisions taken in this brief". The landed page says otherwise:
   - `agents/integrity_verification_agent.md:493` says Mode 1 runs "alone as `/researcher integrity pre-review`", and line 500 says "Issues found: produce correction list, send it to `/paper revision` ... then re-verify".
   - Line 505 says Mode 2 runs "alone as `/researcher integrity`", and line 516 says "A FAIL gets up to 3 correction rounds".
   - Lines 538-547 hold the correction process.

   Item 5 forbids changing these lines and says such a page is "handed back before the report". As briefed, the builder must hand the step back. The orchestrator has to settle this first: either correction rounds in the standalone modes, or the page reworded under a ruling.
2. Case 12 cannot be met as written. `grep -rn 'SKILL.md' skills/academic/researcher --include='*.md'` hits these lines:
   - `two_stage_review_protocol.md:11,24` and `pipeline_orchestrator_agent.md:338`, which name `paper-review-panel`'s `SKILL.md`;
   - `artifact_reproducibility_pattern.md:40,94`, which hash the file.

   None of these "names a heading or a key `SKILL.md` has", and item 5 forbids changing them. The case has to say that it covers only references to `researcher`'s own `SKILL.md`.
3. Item 3 (Stops) leaves out stops that the kept pages define:
   - the AI research failure-mode block (`references/ai_research_failure_modes.md:135-139`: "pipeline blocks if any mode is SUSPECTED ...", with confirm, override with reasoning, or revise);
   - the compliance block (`references/compliance_checkpoint_protocol.md:44-57`, "[COMPLIANCE BLOCK]" with three choices, and the override ladder at 82-90);
   - the budget confirmation at the start of the run (source `SKILL.md` lines 399-403, "ask for user confirmation before Stage 1 begins", kept by item 2 as "its budget lines");
   - the early-stopping suggestion that the user overrides (source line 397).

   Item 3's own list does not contain them, so a builder following it misses at least the first two.
4. Item 2 keeps "the mode recommendation", which contradicts D5's fixed commands. The copied page `agents/pipeline_orchestrator_agent.md:50-52` recommends "plan + guided" and "full + quick", that is `/paper plan` and `/paper-review-panel guided` or `quick`. D5, item 2 ("Stage 2 is `/paper full`, Stage 3 `/paper-review-panel full`") and the orchestrator page's own line 12 fix `full`. The builder has to choose, and that choice is not the builder's.
5. Item 2 keeps "the external review", but no invocation reaches it. The state machine `references/pipeline_state_machine.md:143` has "INIT | Stage 4 | User has review comments | ... run Stage 2.5 ... then invoke `/paper revision`". `mode_advisor.md:20,32,44,83,97` and `pipeline_orchestrator_agent.md:29` route reviewer comments to a "`/researcher manuscript` (Stage 4 entry)". Open item D's four lines take no comments file, and case 7 says "never at Stage 3 or 4". The brief neither gives a command form for this entry nor rules it out, so the builder must invent a public shape or contradict three copied pages.
6. Item 2 says the compliance agent "runs where ... put it", but leaves two questions open:
   - Whether `/researcher integrity` runs it at all. The item's integrity text names only the integrity agent's phases. ADR 0052 Context ("the compliance check that runs after the integrity agent") and ADR 0043 Decision ("The RAISE compliance agent ... comes with `researcher`") require it to be built.
   - How it is started. `agents/compliance_agent.md:122` says "via the Agent tool with `model: sonnet` or higher".

   Its override "auto-injects" an addendum "into the manuscript's AI disclosure section" (`compliance_checkpoint_protocol.md:94`). That contradicts "changes no file of the manuscript" and D5's rule that corrections go through `/paper revision`.
7. Glossary terms. Item 2 and item 4 ("the session starts no agent for the orchestrator's role") have `SKILL.md` call the session "the pipeline's orchestrator". `docs/glossary.md:75` defines **orchestrator** as "the session that runs a plan". The integrity PASS/FAIL "verdict" is also a new sense: `glossary.md:136` defines it as the reviewer's judgment of brief items, and the file has sense-specific entries such as "verdict, of a blind comparison". `docs/dev/skill-layout.md`, "Writing for an agent", requires a new sense to be added to `skills/ordo/ordo-init/templates/plan-terms.md` first and synced to `docs/glossary.md`. Neither file is in the paths, and no item says how the terms are handled.

The cases otherwise ask the builder to read the 27 copied pages (case 11), which the step does not change. Only cases 1 and 2 above need a change.

## The question

Could each check pass without the goal (`integrity` and `manuscript` runnable as specified) being reached?
- Case 1 (frontmatter), case 2 (headings), case 3 (Quick start), the forbidden-word grep and the paths-exist case: yes. They are facts about the text and say nothing about behaviour. That is acceptable as partial checks.
- Case 4 (`integrity` followed through the Steps): yes. It checks depth, phases, run folder and no change to the manuscript, but not the compliance check or the failure-mode block, so an integrity run without either passes.
- Case 6 (`manuscript` from a project folder): yes. It checks order, the Skill tool and a stop per checkpoint, but not the decision branches of Stage 3 and 3' (Reject to Stage 2 or end, Accept to 4.5, Major to 4' with no return) or the hard cap of the revision loop.
- Cases 5, 7, 8 and 9: they hold for what they check. Case 7 passes while the external-review entry is missing.
- Case 12: it cannot pass as written (Cases and checks 2).
- Case 13 (ADR 0052 point by point): yes. ADR 0052 lists only differences, so the kept rules can be summarised away while each point holds. Item 2's heading map covers this, if the reviewer reads it rule by rule.
- Case 14 (`gen_figures.py` exit 0 and the git status listing): yes. Any figure passes.
- Case 15 (`grep -c 'entry 13'` prints 0): yes. It passes even if Stage 1 Research is drawn going to a built `researcher` (see Implied inputs 1).
- Case 16 (`grep -n researcher README.md`): yes. It passes while the install loop at line 165 leaves `researcher` out, so an installed user cannot run the skill.
- The step-line check ("`gen_figures.py` runs" and the ADR reading): yes for the script part. The reading part depends on case 13.
- Item 3: yes, the four-category list misses the block stops.
- Item 6: yes, the install loop.
- Item 8: yes (Implied inputs 1).
- The other items: no material gap found.

## Implied inputs

1. `RS` is one target box shared by three stages. `STAGES` in `gen_academic_pipeline.py` sends "1 Research: deep-research", "2.5 Integrity check" and "4.5 Final integrity check" to `RS`, all with `solid=False`. The research stage is built in step 4. If `RS` is changed to built, Stage 1 points at a built box that does not name the research mode. If it stays `todo`, the legend row "Dashed box: not built yet, with its roadmap entry" (line 60) requires the entry number, which item 8 forbids. Expected result: either a separate target for Stage 1 that stays dashed (with the legend reworded, since it may not name the entry), or an explicit ruling. The `solid` flags of the 2.5 and 4.5 stages also have to become `True`, which the brief does not state.
2. The order in `figures()`. The head comment says "Every figure but the last two shows the order of a run", and the last two are `paper/lifecycle.svg` and `paper/run-folder.svg` (lines 2369-2370). Expected: `researcher.svg` is placed before them, or that sentence becomes false.
3. Byte-identical output of the other figures. Running both scripts on a copy and diffing prints nothing, so the expected result is that `git status --short docs/figures` shows only the new and changed files. This holds today.
4. Label fit. Each new label must fit its box, or the script exits 1 with "does not fit". Expected: exit 0, which the brief's case already requires.

## ADRs

- ADR 0052 Decision. Every point binds the step, including "the sections and the frontmatter of `docs/dev/skill-layout.md` ...", "`manuscript` runs `paper` and `paper-review-panel` through the Skill tool ...", "a run keeps its state in `researcher-runs/<mode>-<date>/` ...", and the Context's "the compliance check that runs after the integrity agent". The brief's undefined compliance role (Cases and checks 6) falls short of it.
- ADR 0027, the part still in force: "The integrity check and the ethics check belong to `researcher`. ... `researcher` runs each check once on the finished draft and once after its revision." Consistent with the brief.
- ADR 0043 Decision: "The RAISE compliance agent is left out, since it is academic-pipeline's and comes with `researcher`." The step touches this through the compliance agent. "What is on the tree" names ADR 0043 only for "the names of `paper`'s files and modes".
- ADRs 0024 and 0033 (a claim rests on a passage read in the run, with `quote-check`): consistent. The copied pages hold it (`integrity_verification_agent.md:447-450`).
- ADR 0026: consistent with D24.
- ADR 0020 Decision is not named by the brief: "`paper-runs/<mode>-<YYYY-MM-DD>/` ... with `-2`, `-3` and so on for further runs of the same mode on the same day". It governs `paper` only. The brief names `researcher-runs/integrity-<date>/` for both depths and sets neither a date format nor a same-day suffix, so a pre-review run and a full-depth run on the same day share one folder. ADR 0052 does not settle this either, so the builder has to choose a run-folder shape.
- No contradiction of an ADR was found apart from the compliance gap above.

## Dictated text

- `grep -n '/researcher integrity <main.tex>' .scratch/13-researcher/agents/briefs/2.md` prints lines 31, 39 and 59. The four lines `/researcher integrity <main.tex>`, `/researcher integrity pre-review <main.tex>`, `/researcher manuscript <project folder>` and `/researcher manuscript <main.tex>` sit in a code block. They hold against skill-layout "Sections, in order" row 2, against the prose standard (code is exempt from 0 and B), and against ordo-help Steps 4 (the mode word is `integrity` or `manuscript`; `pre-review` is a second word, which the layout allows).
- `grep -n 'name: researcher' briefs/2.md` prints line 29: holds (skill-layout, Frontmatter, "`name` equals the folder's name").
- `grep -n '"1.0.0"' briefs/2.md` prints lines 29, 56 and 93: holds (skill-layout, Frontmatter, `metadata.version`).
- `grep -n 'Triggers on:' briefs/2.md` prints line 29: holds.
- `grep -n 'researcher-runs/' briefs/2.md` prints lines 39, 40 and 59: holds for character and form (`docs/dev/skill-layout.md`, "Paths and names"). The open date shape is noted under ADRs.

None of the dictated text breaks a rule.

## Conflicts with the copied pages

1. Standalone integrity and correction rounds: `agents/integrity_verification_agent.md:493,500,505,516` and `538-547` against brief item 2, "It changes no file of the manuscript" (Cases and checks 1).
2. Who invokes `/paper revision`: `agents/integrity_verification_agent.md:542` tells the integrity agent, a fresh agent, to "Send the correction list to /paper revision, invoked through the Skill tool". Brief Decision 2 says only the session can invoke a skill, and item 2 has the session do it. The page and the brief disagree on who runs the correction.
3. Stage 4 entry with review comments: `references/pipeline_state_machine.md:143`, `references/mode_advisor.md:20,32,44,83,97` and `agents/pipeline_orchestrator_agent.md:29` against brief case 7 and the four Quick start lines.
4. Mode recommendation: `agents/pipeline_orchestrator_agent.md:50,52` ("plan + guided", "full + quick") against D5 and item 2's fixed `full` modes.
5. Compliance:
   - `agents/compliance_agent.md:122` fixes that it is started "via the Agent tool", which the brief does not state;
   - `references/compliance_checkpoint_protocol.md:94` (the addendum auto-injected into the manuscript) and `:56` ("edit manuscript directly") conflict with the no-change rule and with D5;
   - `:46` ("Orchestrator presents") and `:115` match the session-as-orchestrator decision.
6. No conflict:
   - the run-folder name matches (`agents/pipeline_orchestrator_agent.md:315`, `researcher-runs/<mode>-<date>/`);
   - the stage order matches (`pipeline_state_machine.md:136`, the four commands of D5);
   - the Stage 2.5 count matches (`pipeline_state_machine.md:147`, max 3 rounds, which item 2 states only for the final check).

## Declined to judge

- Brief Decision 2's premise that "only the session can invoke a skill through the Skill tool". Nothing in the repository states it (`git grep` for such a statement finds none), and the runner's behaviour cannot be checked from here.
- Which Quick start line "a new user types first" (`integrity` or `manuscript`). That is a judgment for the orchestrator.
- Whether the brief's 4-category Stops list was meant to cover the failure-mode and compliance blocks under "each checkpoint of the kept stages". As written it does not name them.

## Closed

Each finding is closed by a change to the brief `agents/briefs/2.md`.

- Names 1, 2: the README's install loop (line 165) and its count of skills (lines 37 and 176) are in item 6, in "Paths this step writes" (README lines 9-176) and in a case.
- Names 3: `skills/academic/paper/SKILL.md` line 70 is item 11, with the patch part of its version raised.
- Names 4: the alt text of `docs/roadmap.md` line 29 is in item 8 and in the paths.
- Names 5, 6: item 5 names the pointer of `references/reinforcement_content.md`, and the case on `SKILL.md` pointers covers only pointers to `researcher`'s own `SKILL.md`.
- Premises, line 15 and item 6: the alt text is written by hand in the form of the lines around it.
- Cases and checks 1 and Conflicts 1, 2: `integrity` alone runs the correction rounds the integrity agent's page gives; the session sends the list to `/paper revision`; the page's correction process is corrected to name the session (item 5).
- Cases and checks 2: the case is scoped.
- Cases and checks 3: item 3 names the four stops.
- Cases and checks 4 and Conflicts 4: the runs are D5's; item 5 corrects the rows of the orchestrator's page that recommend another mode.
- Cases and checks 5 and Conflicts 3: Open item D gains the line `/researcher manuscript <main.tex> <comments file>`.
- Cases and checks 6 and Conflicts 5, ADR 0043: item 2 says where and how the compliance agent runs and where its addendum goes; "What is on the tree" names ADR 0043's sentence.
- Cases and checks 7: `SKILL.md` calls the role "the session" and uses no glossary term in a new sense; the pages keep their names.
- The question: cases added for the compliance check, the failure-mode block, the decision branches of Stage 3 and 3', the cap of the revision loop and the install loop.
- Implied inputs 1, 2: item 8 gives Stage 1 its own target and item 7 the figure's place in `figures()`.
- ADRs, ADR 0020: decision 5 gives the run folder's date form and its suffix.

Usage: a7ab1a8b91934c83b, claude-opus-5-5, 219563 tokens, 57 tool uses, 558 s.
