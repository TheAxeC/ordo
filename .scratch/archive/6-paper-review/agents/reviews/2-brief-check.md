# Step 2 brief check (on main at ec2518d)

Head: `git rev-parse --short HEAD` printed `ec2518d`. Nothing was written. Two commands of the brief were not run because they write files: `python3 docs/figures/gen_figures.py` (its bodies were compared in memory instead, see 3) and `sh utils/pin.test.sh` (it builds scratch repositories): not verified.

## 1. Names

Command: `git grep -n -I 'paper-review\|paper_review' -- . ':!.scratch'`, then the same for `seventeen`, `sixteen\|16 skills`, `panel review` (case-insensitive).

`paper-review` / `paper_review`, hits outside "Paths this step writes":
- `docs/adr/0001-...md:7` ("The writing skills (`literature`, `paper`, `paper-review`, `grant`) share one set of prose rules"): context of a record, not made false.
- `docs/adr/0019-...md:7` and `:20`, `0022-...md:22`, `0025-...md:33`, `0027-...md:40`: context and consequences of records, not made false.
- `docs/figures/academic-pipeline/gen_academic_pipeline.py:137` (`"PRV": ("paper-review, entry 6", "todo"),`) and `docs/figures/academic-pipeline/academic-pipeline.svg:92` ("paper-review, entry 6"): the box marks the skill as still to build. Step 2 puts `SKILL.md` on main while roadmap entry 6 stays open until step 4, so step 2 does not make it false; no step of the plan names these two files for the closing either.
- `docs/roadmap.md:23,26,27,117`: the entry itself, not made false by step 2.
- `skills/academic/paper/SKILL.md:892` ("an external panel review (`paper-review`)"): in a file the step writes, stays true.
- `/paper-review`, `paper-review-runs`, `paper-review.svg`, `paper_review`: no hit outside `.scratch` (same grep).

`seventeen`: no hit. `sixteen`: `README.md:30`, `README.md:159` (both in the brief), and `docs/roadmap.md:109` (the done line of entry 5.A, a record of that closing, not made false).

`panel review`: `docs/glossary.md:149,153,156,157`, `docs/roadmap.md:33`, `skills/academic/paper/SKILL.md:892`. Only `:153` carries the "Stated in" the brief changes; the others stay true.

Other places that list the skills or the figures and that the brief does not name. Command: `git grep -n -I 'code-comments' -- . ':!.scratch' ':!docs/adr' ':!skills/code' | grep writing`, and `grep -n 'gen_figures' docs/dev/*.md README.md`:
- `docs/dev/building.md:37`: "`python3 docs/figures/gen_figures.py` writes `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `code-comments.svg` and the fourteen figures of `paper` under `docs/figures/paper/` ...". After the step the script also writes `paper-review.svg`, so this list is false. Not in "Paths this step writes".
- `docs/dev/scripts.md:9`: "| `docs/figures/gen_figures.py` | Writes the SVG figures of the README from the labels written in the file: `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `code-comments.svg` and, under `docs/figures/paper/`, ...". Same list, false after the step. The brief's "What is on the tree" says "`docs/dev/scripts.md` lists the script" and then leaves the page out of the paths.
- `README.md:30`, `:70`, `:148`, `:159`: all four named by the brief.
- `README.md:121` ("The plan skills and `grill` launch their agents through five agent definitions"): stays true, since the brief's roles start on the general-purpose agent.
- `skills/ordo/ordo-help/SKILL.md:19` (`/ordo-help skills` prints every skill "in folder-name order"): reads the folders, names no skill, stays true.
- `utils/pin.sh:434` (`for skill in $tag_skills`): computed list, names no skill.
- `skills/ordo/repo-setup/templates/docs/glossary.md:3`: lists the skills whose terms the plan-terms block holds; `paper-review` adds no plan term, stays true.

Findings: (1) `docs/dev/building.md`, section "Figures" sentence at `docs/dev/building.md:37`, and `docs/dev/scripts.md:9` each list the figures `gen_figures.py` writes; the step makes both lists false and neither file is in "Paths this step writes" or "What to build" (rules file, rule 14 and the bullet on `docs/dev/scripts.md` of "Scripts compute facts; judgment is read"). (2) The brief's "Report" asks for no quote of the rule 14 grep of the changed names over `skills/`, `utils/`, `docs/` and `README.md`, which rule 14 says the report quotes.

## 2. The step line

Step line (from `sed` of `plan.md`, "Steps, in execution order", item 2), part by part:
- "the source's `SKILL.md` carried section by section, with its words, into the layout ... as `skills/academic/paper-review/SKILL.md`": "What to build", "`skills/academic/paper-review/SKILL.md`", every bullet from Frontmatter to "Left out whole".
- "the three things the source does not state taken as `paper` has them (ruling The three things the source does not state)": the three sub-bullets of the `## Rules` bullet.
- "the README's row and its count of skills": the `README.md` bullet (row, "seventeen" twice; it also covers the group list, the copy loop, the figure sentence and the figure).
- "`paper`'s Use instead row": the `skills/academic/paper/SKILL.md` bullet, with the version raised to "4.1.1".
- "the glossary's entry \"panel review\"": the `docs/glossary.md` bullet.
- "the skill's figure": the `docs/figures/gen_figures.py` bullet and the README bullet's last clause.
- "the reviewer reads the source's `SKILL.md` against the new one": no builder requirement; served by "Verify before you report" 6 and the report's "map of the source", which give the reviewer the map to read against.
- "the verify list of `docs/dev/building.md` passes on main": runs at landing; "Verify before you report" 1 to 3 are the per-file part.
- "(ruling 2-contracts)": the `## Sprint Contract Protocol` bullet. "(ruling 2-questions)": the Phase 2.5 point 3 bullet. "(ruling 2-call)": the `## Quick start` bullet and the frontmatter's `/paper-review` trigger.
- "(1 commit)": landing.

Findings: none. Every part of the step line has a requirement.

## 3. Premises

Commands: `wc -l <source>/SKILL.md`; `grep -n '^##' <source>/SKILL.md`; `ls skills/academic/`; a loop of `grep -n -- "<name>" <source>/SKILL.md`; `LC_ALL=C grep -c '[^ -~]'` and a `python3 -c 'json.load'` over each contract; `sed -n 255,264p` of the socratic mentor page; `grep -n '^## \|^### ' skills/academic/paper/SKILL.md`; `sed -n 60,72p` and `grep -n 'paper-runs\|general-purpose\|fresh agent'` of that file; `grep -n 'sixteen\|academic/' README.md`; `grep -n 'panel review' docs/glossary.md`; `grep -n '^def \|writing.svg\|_single(' docs/figures/gen_figures.py`; `awk` of ADR 0043's Decision.

- Source: `430` lines. The 23 `##` headings print in the order the brief lists them. Holds.
- `ls skills/academic/` prints `paper` and `writing`; `ls skills/academic/paper-review` prints "No such file or directory". Holds. The source folder holds 26 files and 12 under `references/` (`find <source> -type f | wc -l` printed 26, `ls <source>/references | wc -l` printed 12), so 24 pages for step 1 holds.
- Names that do not exist, hits by source line: deep-research 54 158 287 400; academic-pipeline 12 191 402; tw-hei-intelligence 401; pipeline_orchestrator_agent 191; /ars-review 193; /ars-<mode> 201; direct-mode 201; Routing Discipline 24 201; shared/ 24 68 201 409 412; docs/design/ 195; check_pipeline_integrity 203; check_sprint_contract 409; PreToolUse 203; integrity check 287 296; cross-model 216 255. `ARS_CROSS_MODEL`: no hit. The brief's "(`ARS_CROSS_MODEL`)" is not in the source `SKILL.md`; the source says "cross-model default-on" in the modes table and in "Calibration Mode".
- Contracts: `ls <source>/shared` prints "No such file or directory". `full.json`: 0 non-ASCII lines, `reviewer/reviewer_full/v1`, dimension ids D1 to D5, conditions `['F1', 'F2', 'F3', 'F0']`. `methodology_focus.json`: 0, `reviewer/reviewer_methodology_focus/v1`, D1 and D2, `['F1', 'F2', 'F0']`. Top-level keys of both: contract_id, mode, stage, baseline_version, panel_size, acceptance_dimensions, measurement_procedure, failure_conditions. `grep -n 'baseline_version\|v[0-9]\.[0-9]\|shared/\|scripts/\|rchestrator\|ARS\|academic-paper\|deep-research'` over both prints only `:5:  "baseline_version": "v3.6.2",` in each. Holds.
- Questions (`sed -n 259,262p`): L5-W1 "Ten years from now, what will citers say this paper established?"; L5-W2 "Remove this paper from the literature <em dash> what is missing?"; L5-W3 "If this paper succeeds, who would make different decisions as a result?" with "consumers may substitute the anchor noun phrase only <em dash> \"this paper\" <right arrow> \"the revised paper\" / \"your planned paper\"". Holds.
- `skills/academic/paper/SKILL.md`: headings as the brief lists; `:68` reads as quoted; `metadata.version` is "4.1.0"; `:160` "Every role starts as a fresh agent on the runner's general-purpose agent with the runner's defaults. The prompt sets no model and no effort." under Steps item 4; `:166` "The run folder is `paper-runs/<mode>-<date>/` in the parent of the manuscript's folder." under item 5. Holds.
- `README.md`: `:26` `writing` row, `:28` `paper` row, `:30` the group sentence with "sixteen", `:70` the figure sentence, `:148` the copy loop, `:159` "each of the sixteen skills". Holds.
- `docs/glossary.md:153` as quoted, below `<!-- ordo:plan-terms end -->` at `:140`. `python3 -B skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. Holds.
- `docs/figures/gen_figures.py`: `def writing()` at `:1857`, its `return _single("writing.svg", ...)` at `:1872`, `("writing.svg", writing()),` at `:2104`. Holds. The script was not run; `python3 -B -c 'import gen_figures as g ...'` compared each body of `g.figures()` with the committed file and printed "same" for all 19, and `git status --short docs/figures` printed nothing.
- ADR 0043, Decision 2: the quoted sentence matches word for word. ADR 0026's summary matches its Decision.
- The character-set check over `README.md`, `skills/academic/paper/SKILL.md`, `docs/glossary.md`, `docs/figures/gen_figures.py` on the unchanged tree printed nothing, exit 0.

Findings: (1) `ARS_CROSS_MODEL` is named as found by `grep -n` over the source and has no hit in the source `SKILL.md`; the thing there is "cross-model default-on". No other premise is false.

## 4. Cases and checks

Counts, from `cat -n` of the source: Anti-Patterns table 7 rows; Quality Standards table 9 rows; Checkpoint Rules 7; Devil's Advocate bullets in Phase 1 of the diagram 8; Phase 2.5 numbered points 6; Sprint Contract Hard Gate bullets 5. Every count in "Cases" and in "What to build" is right.

Cases against the rules file, the standards and the source:
- Case 1 (headings): consistent. Its "Expected" names two things that are not headings (the "v1.1 Improvements" list, the routing note); harmless.
- Cases 2 to 4 (7 and 9 rows, 7 rules, 8 bullets): consistent, counts right.
- Case 5 (JSON): the keys `contract_id`, `acceptance_dimensions`, `failure_conditions[].condition_id` exist in both files, so the command can print what is expected. It does not check that `baseline_version` is gone or that the blocks equal the files.
- Case 6 (frontmatter): `python3 -c 'import yaml; print(yaml.__version__)'` printed `6.0.2`; consistent with the layout's own command.
- Case 7 (heading order), case 8 (sixteen 0, seventeen 2; `grep -c` counts lines and the two words stand on two lines today): consistent.
- Case 9 (figure): consistent; the figures regenerate unchanged today, so "no other figure changed" is a fair expectation.
- No case asks the builder to check a place the step does not change.

Walk of the source `SKILL.md`, first line to last, with the bullet of "What to build" that places each part:
- Frontmatter `name`, `description`, `metadata.version`: "Frontmatter". The keys `last_updated`, `status`, `data_access_level`, `task_type`, `related_skills`: dropped by "no other metadata key"; the brief names no edit for `status`, `data_access_level` and `task_type` (the layout's frontmatter form asks it; none of the six edits does).
- The `#` title: no bullet gives its words. "Title and first paragraph" places only the paragraph.
- Opening paragraph: "Title and first paragraph". "v1.1 Improvements" list and the routing note: left out there, edits 4 and 2.
- Quick Start, "Simplest command" with its block `Review this paper: [paste paper or provide file]`: no bullet names it. The nearest is "the plain request" of "What it reads".
- Quick Start, "Output" list: "Quick start".
- Trigger Keywords: "What it reads" and the frontmatter.
- Non-Trigger Scenarios table: "Use instead".
- Quick Mode Selection Guide table and the Spectrum note: "Steps", the item on picking the mode.
- The paragraph "Not sure? Use `full` ... `calibration` is opt-in ...": no bullet names it.
- Agent Team table: "Agent prompts" (joined with Agent File References; the brief does not say the joined table keeps the `#`, Role and Phase cells, the general sentence on every table row does).
- Orchestration Workflow diagram: "`### full`"; point 3 of Phase 2.5: the bullet on the three questions.
- Checkpoint Rules 1 to 7: "`### full`" (1 and 5) and "`## Rules`" (2, 3, 4, 6, 7).
- Phase-by-phase Invocation Contract: "Agent prompts". See findings 3 and 4 below.
- Operational Modes table and Mode Selection Logic: "Steps", first; the rows of quick and methodology-focus again in "`### quick` and `### methodology-focus`".
- Re-Review Mode, Guided Mode, Calibration Mode: "`### re-review`, `### guided` and `### calibration`"; Re-Review's Input line also in "What it reads".
- Review Output Format with the Devil's Advocate structure, Editorial Decision Format: "`## Review output`".
- Integration: the diagram line and the table: "`## Integration`". The heading "Pipeline Usage Example" with its pointer: the same bullet.
- Agent File References: "Agent prompts".
- Reference Files, Templates, Examples tables: "What it reads".
- Anti-Patterns: the table: "`## Anti-patterns`". The sentence above it ("Explicit prohibitions to prevent common failure modes, especially during long conversations:") and the `#` column: no bullet names them.
- Quality Standards: "`## Quality standards`".
- Output Language: "What it reads".
- Related Skills: "Use instead" (the `paper` row; three rows left out, edit 2).
- Sprint Contract Hard Gate: "`## Sprint Contract Protocol`".
- Version Info, Changelog: "Left out whole".

Findings:
1. No place for four parts of the source: the `#` title's words, the "Simplest command" block, the "Not sure?" paragraph, and the sentence above the Anti-Patterns table. The general sentence ("Every rule, table, table row, list item, diagram line and example") does not list a paragraph or a title, so a builder can leave them out without breaking a named bullet.
2. Anti-Patterns rows 3 and 6 end "(Checkpoint Rule #4)" and "(Checkpoint Rule #6)". The brief spreads the Checkpoint Rules over a step item and `## Rules` as unnumbered bullets, so both references point at nothing. The brief gives no form for them; the layout's "Where a rule goes" asks that another place name the section the rule is in.
3. Phase-by-phase Invocation Contract, the kept "Mode B": the source says the user "invokes one reviewer agent per phase across sessions, or runs the full reviewer panel standalone via `/ars-review` equivalent". The brief keeps "the phase-by-phase invocation by the user of one role per phase" while "Quick start" holds no call that starts one role and "Stops" refuses "a mode outside the six". The new file would state a call it does not offer (rules file, rule 19). The brief also does not say whether `/ars-review` becomes `/paper-review` (edit 1) or is left out (edit 2).
4. `## Integration`: the brief leaves "the integrity-check stages" out of the diagram line and the table, and step 1's brief ("What to build", edit 2, last sub-bullet, and its case on `references/integration_guide.md`) keeps "the integrity-check steps" in the page this section points at. The two pages of one skill would then disagree, and one of the two briefs drops or keeps source text against the other. The pointer sentence and the Reference Files row both say "9-step"; step 1 removes the deep-research step and renumbers, so "9-step" is false in both carried places and the brief gives no word on it.
5. Who holds the dialogues is not stated. The source has the EIC guide the user in Phase 2.5, in guided mode and after a re-review. The ruling's three things cover a fresh agent per role, the run folder and a reviewer's second call. The brief does not say whether the EIC of Phase 2.5 is the Phase 1 EIC resumed or a fresh start, or how each question and answer passes between the user and the agent. The builder must choose it for `### full`, `### guided`, the Stops table and the figure.
6. Stops: the list is closed ("The stops are those the source's text gives") and takes `[PANEL-SHRUNK]` from `references/sprint_contract_protocol.md`, which the source `SKILL.md` does not mention (`grep -n 'PANEL-SHRUNK' <source>/SKILL.md` prints nothing), but not the refusal of `references/calibration_mode_protocol.md:39` ("If all labels are on one side, refuse to proceed and ask the user for at least one counter-example") nor the second-failure marker `[PROTOCOL-VIOLATION ...]` of the sprint contract page. The choice of which page's stops reach the table has no stated rule.
7. "Once" against two places: the modes table stands first in Steps and the rows of quick and methodology-focus are carried again as items; Re-Review's Input line is in "What it reads" and in `### re-review`. The brief's own sentence says each part is in the new file once, and the report's map can give only one place.
8. Glossary terms in carried words: the source uses "reviewer" (glossary: the agent that refutes a built step), "gate", "plan" ("scoring plan"), "round", "verdict", "finding", "step" in senses the glossary does not define (`grep -n '^- \*\*\(reviewer\|gate\|...\)\*\*' docs/glossary.md`). The layout's "Writing for an agent" allows a defined term only in its defined sense, and the brief's "Report" asks each use read against the entry. The brief says the prose standard governs only written words and says nothing for this layout rule, so the builder is left between rewording carried text and reporting a break.
9. The source repeats rules (the CRITICAL rule in Checkpoint Rule 4, Anti-Patterns row 3, Quality Standards row 9 and the diagram; read-only in Checkpoint Rule 6 and Anti-Patterns row 6; no fabrication in Checkpoint Rule 3, Anti-Patterns row 1 and Quality Standards row 2). The brief carries all of them, which the user's ruling requires, and the layout's "Where a rule goes" says a rule is written once. The brief does not say that the repeats stay and are named in the report.
10. The source's bold table rows (Agent Team row 6, three rows of the modes table, the last two Quality Standards rows, one Agent File References row) meet the layout's "Bold marks a list item's label ... and nothing else". The brief gives no word on them.

## 5. The question

"Could this pass without the goal being reached?"
- Case 1, headings mapped: yes. A heading can be mapped while paragraphs under it are gone.
- Case 2, 7 and 9 rows: yes. It counts rows, not words.
- Case 3, 7 rules each once: yes for the goal as a whole; it covers seven rules only.
- Case 4, 8 bullets: yes. A count.
- Case 5, the JSON command: yes. A block with `baseline_version` kept, or with a description reworded, prints the same three lines. A comparison of each block with its file less that one key is a fact a command computes and is not asked.
- Case 6, frontmatter: yes. It checks the name, a length and the keys, not the description's words.
- Case 7, heading order: yes.
- Case 8, sixteen and seventeen: yes. The row, the group list, the copy loop's `academic/paper-review` and the figure sentence are not checked.
- Case 9, the figure: yes. Exit 0 and a new file say nothing of what the figure draws; the state file's `look:` is "none", so no one is asked to look at it.
- The check on the step line (the reviewer reads the source against the new file; the verify list passes on main): no for the `SKILL.md` part, when the reading is paragraph by paragraph. Yes for "the places that list the skills": the line asks no reading of them, and `docs/dev/building.md` and `docs/dev/scripts.md` would pass unread.
- Verify 1, character set: yes. Verify 2, glossary sync: yes. Verify 3, `pin.test.sh`: yes. Each checks a fact unrelated to whether the text is the source's.
- Verify 4, each case prints what is expected: yes, as above.
- Verify 5, the grep for names: yes. It finds leftover names, not dropped text.
- Verify 6, the builder's walk of the source with a place for each paragraph, table and list: no for the `SKILL.md` part; a dropped paragraph has no place to name. It does not cover the places that list the skills.
- Verify 7, written sentences against the standards: yes. It covers only the words the step wrote.

Findings: (1) No check or case reads the places that list the skills beyond two word counts; one reading item for `README.md` (row, group list, loop list, figure sentence, alt text), the glossary entry and the two `docs/dev` pages is missing. (2) Case 5 does not check the removal of `baseline_version` or the equality of the blocks with the contract files. (3) The figure has no reading or look asked of anyone.

## 6. Implied inputs

The change adds one function with labels written in the file, an entry in `figures()` and a head-comment line. It takes no value from a user or a file. A label that does not fit, an edge to a missing box and an unmarked cycle each raise `FigureError` (`docs/figures/gen_figures.py:224,249,444,454,467,472,487,583,1123`) and the script exits non-zero, which case 9 covers; `write_figures` reads each file back.

One input "Cases" lacks: `docs/figures/academic-pipeline/gen_academic_pipeline.py` imports this file as its layout code (head comment of `gen_figures.py`: "This file is also the layout code of academic-pipeline/gen_academic_pipeline.py"). Case 9's `git status --short docs/figures` shows that figure unchanged only because the second script is not run. Expected result: `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` exits 0 and `git status --short docs/figures/academic-pipeline` prints nothing. Its wrong answer costs a broken second figure script, found only at the next figure change.

Findings: one, the run of `gen_academic_pipeline.py` after the change, with the expected result above.

## 7. ADRs

Command: `for f in 00*.md; do sed -n 3p $f; done` for every status, and `awk '/^## Decision/{f=1;next} /^## /{f=0} f'` for 0001, 0002, 0003, 0020, 0026, 0030, 0035, 0036, 0043. Superseded whole: 0003, 0016, 0018, 0019, 0021, 0022, 0025, 0028, 0037, 0041.

Records the step touches:
- 0043, Decision 1 ("The only edits are these:" with its six bullets) and Decision 2 ("`skills/academic/paper/SKILL.md` is academic-paper's `SKILL.md`, each section carried with its words into the section of `docs/dev/skill-layout.md` that holds its kind of text. Version Info and Version History are left out."). Named by the brief. Both sentences are about `paper`; the roadmap entry and the ruling "A copy and nothing else" extend them, as the brief says.
- 0002 ("The prose standard holds for every text the writing skills write or review ... No rule that contradicts the prose standard is carried."), in force for every text that is not a manuscript. ADR 0001's Context names `paper-review` among the writing skills. The brief does not name 0002 under "What is on the tree"; it reaches the builder only through edit 6 in step 1's brief.
- 0026 ("It is held to the prose standard ... with the differences `skills/academic/writing/references/manuscript-prose-standard.md` lists."). Named by the brief as not touching the step, which is right for the text of a paper; edit 6 still reads a rule against the page it gives.
- 0020 ("A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder, with `-2`, `-3` and so on"). It binds `paper` only; the brief's run folder follows it by the ruling. Not named; no contradiction.
- 0030 and 0035, in the parts in force ("`paper` and `writing` read no `plan.yaml`"; every role of `paper` "on the default agent with the runner's defaults"). They bind `paper` and `writing`; the brief's first rule bullet agrees with them. Not named.
- 0001 ("the skills that read the writing base read the prose standard where it is"). The brief gives `paper-review` no read of the prose standard, as the source has none, so the decision's sentence does not apply; not named.

No part of the brief contradicts a record in force. Records 0004 to 0014, 0017, 0023, 0024, 0027, 0029, 0031 to 0034, 0036, 0038 to 0040, 0042 concern the plan skills, the cost script, `writing`, `code-comments` or `paper`'s own modes and are not touched.

Findings: (1) ADR 0002 touches the step and is not among "the ADRs this brief names under \"What is on the tree\"", which the brief's first paragraph tells the builder to read. (2) The choices this step makes for `paper-review` alone (the run folder's name, the contracts written into `SKILL.md`, the three questions written into the step, the second call to the resumed agent) rest on plan rulings only; no record holds them once the plan closes. Whether that needs a record is the orchestrator's.

## 8. Dictated text

Each line is located by `grep -n '<text>' .scratch/6-paper-review/agents/briefs/2.md`.
- `2.md:32` `name: paper-review`: holds (layout, "Frontmatter").
- `2.md:32` `description`: "the source's description with `Triggers on:` and its phrases". Breaks the layout, "Frontmatter", "A phrase for a case a neighbouring skill is for goes in that skill's `Triggers on:`": the source's phrase "referee report" is the case of `referee` by the glossary's entry "referee review". `referee` is not built, and the user's ruling keeps the source's phrases, so this is a clash to rule on.
- `2.md:32` `metadata.version: "1.0.0"`: holds.
- `2.md:34` the seven invocations `/paper-review <manuscript>` to `/paper-review calibration <gold set folder>`: hold (layout, row 2: every invocation, the first the one a new user types). See 4, finding 3, for the call the kept text names and this list lacks.
- `2.md:39` "Ten years from now, what will citers say the revised paper established?", "Remove the revised paper from the literature: what is missing?", "If the revised paper succeeds, who would make different decisions as a result?": hold. The source page allows the anchor substitution, the colon replaces the dash as the prose standard's section 0 asks, and a question asked of the user is not a rhetorical question.
- `2.md:37` `### full`, `### re-review`, `### quick`, `### methodology-focus`, `### guided`, `### calibration`: hold (layout, row 5).
- `2.md:44` `## Agent prompts`, `2.md:46` `## Review output`, `2.md:48` `## Quality standards`: hold as noun-phrase labels.
- `2.md:45` `## Sprint Contract Protocol` with the two `json` blocks, and `2.md:47` `## Integration`: the headings hold. Their content breaks the layout, "Writing for an agent": "Material a step needs only in some runs ... goes in a file `references/<name>.md`" and "A reference section of row 6 ... holds only material every run reads". The full contract is read in full mode only, the other in methodology-focus only, and no run reads the integration text. The ruling Open item 2-contracts decides the place and the brief's decision 2 gives the reason; the brief does not say that the layout rule is departed from, while its own second paragraph says a ruling never exempts the text from the standards.
- `2.md:49` Stops columns "Stop, When, What it shows, What resumes it": hold. `2.md:50` Anti-patterns columns "Anti-pattern, Why it fails, Do instead": hold; the source's `#` column is dropped by them (see 4, finding 1).
- `2.md:52` "Each of the seven roles starts as a fresh agent on the runner's general-purpose agent with the runner's defaults, given its page and the files of its task; the prompt sets no model and no effort.": breaks the layout, "Lists and tables", one rule per bullet (two requirements joined by a semicolon), if written as one bullet.
- `2.md:53` "The run folder is `paper-review-runs/<mode>-<date>/` ... Each report is a file of its own there: ...": the folder's form holds; as one bullet it breaks the same rule (the folder's place and one file per report are two requirements in two sentences).
- `2.md:54` the second-call bullet: holds.
- `2.md:62` the Use cell `` `paper-review` `` and `metadata.version` "4.1.1": hold (layout, "Paths and names"; the patch part for a change of wording).
- `2.md:61` "seventeen": holds.

Findings: (1) the trigger "referee report" against the layout's rule on a neighbour's case. (2) The two contracts and the integration text in reference sections against two bullets of "Writing for an agent", not stated as a departure. (3) The first two rule bullets, each holding two requirements.

## Declined to judge

- Whether the source's content is right, complete or well placed in the source itself: for example `examples/subclaim_decomposition_example.md` and `references/sprint_contract_protocol.md` are in no table of the source `SKILL.md`, and the brief adds no row, as the ruling asks.
- Whether "Output Language" is an input, and whether Quality Standards belongs in a reference section or in Rules: the brief names a place for each and the layout can be read either way.
- Whether the choices of this step need an ADR (7, finding 2).
- Whether the figure's design is right; the script was not run.
- `sh utils/pin.test.sh` on the unchanged tree: not run, not verified.

Paths read: `/Users/axelfaes/workspace/ordo/.scratch/6-paper-review/agents/briefs/2.md`, `/Users/axelfaes/workspace/ordo/.scratch/6-paper-review/agents/briefs/1.md`, `/Users/axelfaes/workspace/ordo/.scratch/6-paper-review/plan.md`, `/Users/axelfaes/workspace/ordo/docs/dev/change-standard.md`, `/Users/axelfaes/workspace/ordo/docs/dev/skill-layout.md`, `/Users/axelfaes/workspace/ordo/docs/dev/building.md`, `/Users/axelfaes/workspace/ordo/docs/dev/scripts.md`, `/Users/axelfaes/workspace/ordo/docs/glossary.md`, `/Users/axelfaes/workspace/ordo/docs/figures/gen_figures.py`, `/Users/axelfaes/workspace/ordo/README.md`, `/Users/axelfaes/workspace/ordo/skills/academic/paper/SKILL.md`, `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer/SKILL.md`.

Agent usage: a10369c9579256655, claude-fable-5-2, 183232 tokens, 21 tool uses, 6.9 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1 (1): `docs/dev/building.md` and `docs/dev/scripts.md` are in "What is on the tree", "What to build" and "Paths this step writes". 1 (2): the report quotes the rule 14 grep.
- 3 (1): the premise names "cross-model default-on", the words the source has.
- 4 (1): the title, the "Simplest command" line, the "Not sure?" paragraph and the sentence above the Anti-Patterns table each have a place; the `#` column is not carried, since the layout fixes the columns.
- 4 (2): a row's reference to a numbered Checkpoint Rule names `## Rules` and the rule's opening words.
- 4 (3): the phase-by-phase text says a plain request asks for one role, `/ars-review` is `/paper-review`, and the routing sentence is left out under edit 2.
- 4 (4): the integrity-check stages stay, as in step 1's page, and "9-step" reads "8-step" in both places.
- 4 (5): a bullet of `## Steps` and decision 7 say who holds the dialogues.
- 4 (6): the Stops bullet gives the rule (every point where the run waits for the user or ends early, found by reading the 26 files) and names calibration's refusal.
- 4 (7): a bullet says a part is carried once and a second place names its section.
- 4 (8): "What it must do" bounds the glossary rule to the words the step writes, and the report item follows.
- 4 (9), 4 (10): bullets say the repeats and the bold rows stay.
- 5 (1): verify 7 reads the places that list the skills. 5 (2): a case compares each block with its file less `baseline_version`. 5 (3): the report gives the figure in words, and the orchestrator reads the SVG at landing.
- 6: a case runs `gen_academic_pipeline.py`.
- 7 (1): ADR 0002 is named. 7 (2): no record is written; the rulings and the choices C141 to C143 hold the choices.
- 8 (1): decision 6 keeps the trigger "referee report" as the source's phrase. 8 (2): the Sprint Contract bullet states the departure from the layout and its reason. 8 (3): the three things are written one requirement per bullet.
- Dictated lines added after the check, each held against the rules file and `docs/dev/skill-layout.md`: `# Academic Paper Reviewer: Multi-Perspective Academic Paper Review Agent Team` (a title of the source's words, no version; holds); `Review this paper: [paste paper or provide file]` (a Quick start line; holds); "8-step" (holds).

