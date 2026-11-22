# Step 1 brief check (on main at ec2518d)

Brief read: `/Users/axelfaes/workspace/ordo/.scratch/6-paper-review/agents/briefs/1.md` (163 lines, untracked). `plan.md` changed on disk during the check: three rulings for step 2 were added and step 2's line got three tags; step 1's line and the ruling "A copy and nothing else" are unchanged (`git diff -- .scratch/6-paper-review/plan.md`).

The brief has findings that would make the builder drop or change source text beyond the six edits, and three wrong counts. The main ones: F4.1, F4.2, F4.3, F4.4, F4.6 and F3.1.

## 1. Names

Command: `grep -rn 'paper-review' skills utils docs README.md`. Hits outside "Paths this step writes":

- `skills/academic/paper/SKILL.md:68`: "`paper-review` (roadmap entry 6, not built yet)". Not made false by step 1: the folder has no `SKILL.md` until step 2, which owns this row.
- `skills/academic/paper/SKILL.md:892`: names `paper-review` as the external panel review. Not made false.
- `docs/roadmap.md:23`, `:26`, `:27`, `:117`: entry 6 and its gate. Not made false.
- `docs/glossary.md:153`: "panel review". Not made false; step 2 owns it.
- `docs/adr/0001-...md:7`, `0019-...md:20`, and `0022`, `0025`, `0027` (Context or Consequences lines that list the later writing skills). Not made false.
- `docs/figures/academic-pipeline/gen_academic_pipeline.py:137` and `academic-pipeline.svg:92`: "paper-review, entry 6", marked todo. Not made false by step 1; step 2 owns the figure.

Command: `grep -rnE '\b(methodology-reviewer|domain-reviewer|perspective-reviewer|devils-advocate-reviewer|editorial-synthesizer|field-analyst)\b|name: eic\b' skills utils docs README.md` prints nothing. The seven frontmatter names are new and collide with nothing. `grep -n '^name:' skills/academic/paper/agents/*.md` shows the model: `name: peer-reviewer`, `name: draft-writer` and ten more of the same form.

Command: `grep -rnE 'Phase Boundary|Sprint Contract Protocol|[Ss]print contract status' skills utils docs README.md` prints only `## Phase Boundary` in seven pages of `skills/academic/paper/agents/` and two prose lines there. No page outside the step refers to the renamed headings.

Command: the grep of the 24 page stems over `skills utils docs README.md` prints nothing.

One reference the tree does not hold yet: the source's `SKILL.md` names the headings this step renames (`grep -nE 'Sprint Contract|Phase Boundary' SKILL.md` in the source prints lines 199, 203, 406, 410). Step 2 runs in parallel and writes that file, so it has to use this step's heading texts (`## Sprint Contract Protocol`, `### Phase 1: ...` with a colon). The plan's line "the page names `SKILL.md` refers to are the source's own" covers file names, not heading texts.

Findings: F1.1, the heading texts this step changes are also quoted by step 2's `SKILL.md`, and neither brief 1 nor the plan's parallel note says the two steps must agree on them.

## 2. The step line

- "each file ... under `agents/`, `references/`, `templates/` and `examples/`, except `references/changelog.md`": "What to build", first paragraph. Its total (24) is right; its count for `references/` is wrong (see F3.1).
- "copied into `skills/academic/paper-review/` under its own folder and name": "What to build", first paragraph, and "Paths this step writes" (24 pages, counted: 7 agents, 11 references, 3 templates, 3 examples).
- "with the edits of ADR 0043, Decision 1, and no others": "What to build", second paragraph, and "The edits" 1 to 6.
- "`diff` of each page against its source shows only those edits": "Verify before you report" 5 and the first case.
- "the character-set check of `docs/dev/building.md` prints nothing for the folder": "Verify before you report" 1, the page's perl command fed by `find` over the folder.

No part of the line is without a requirement. The plan's Goal and Gate name four edits and the step line names ADR 0043, Decision 1, which has six; the brief follows the six. That difference is in the plan, not the brief.

Findings: none.

## 3. Premises

Commands run in the source folder unless said.

- Bullet 1. `find . -type f | sort | xargs wc -l` prints 26 files, 5707 total. `agents/` 7, `templates/` 3, `examples/` 3 hold. **`references/` holds 12 files, not 15** (calibration_mode_protocol, changelog, editorial_decision_standards, guided_mode_protocol, integration_guide, quality_rubrics, re_review_mode_protocol, review_criteria_framework, review_quality_thinking, sprint_contract_protocol, statistical_reporting_standards, top_journals_by_field).
- Bullet 2. `ls skills/academic/paper-review` prints "No such file or directory". Holds.
- Bullet 3. The perl count over the 25 files prints U+2014 352, U+2192 41, U+00A7 31, U+2265 18, U+2260 7, U+2013 3, U+2208 3, U+00B1 2, U+2308 2, U+2309 2, U+2705 2, and one each of U+00B2, U+00D7, U+2026, U+2194, U+26A0, U+274C, U+FE0F, U+1F50D. Holds. The rest are the Chinese characters.
- Bullet 4. `perl -CSD -ne 'print "$ARGV:$.\n" if /[\x{3400}-\x{9FFF}]/'` prints `references/top_journals_by_field.md` 176 to 183 and nothing else. Holds.
- Bullet 5. `grep -rlE 'v[0-9]+\.[0-9]+' . | grep -v SKILL.md | wc -l` prints **12, not 16** (13 with `SKILL.md`). The 12: six pages of `agents/` (all but field_analyst), `examples/subclaim_decomposition_example.md`, and calibration, guided, quality_rubrics, re_review and sprint_contract under `references/`. 46 lines in all.
- Bullet 6. `references/changelog.md` has 9 lines, a table with the columns Version, Date and Changes. Holds.
- Bullet 7. In ordo none of the named things exists (`[ -e ]` over `skills/academic/deep-research`, `skills/academic/academic-pipeline`, `shared`, `scripts`, `docs/design`, `evals` prints "absent" for each). **In research-hub the skills deep-research and academic-pipeline exist**: `ls /Users/axelfaes/workspace/research-hub/.agents/skills/` prints `academic-paper academic-paper-reviewer academic-pipeline deep-research handoff project-cleanup`. The scripts, `shared/`, `docs/design/`, `ROADMAP_v3.2.md` are absent there too. `tw-hei` has 0 hits in the 25 pages and 1 in `SKILL.md`, so it is not a thing this step meets.
- Bullet 8. `diff research-hub/.agents/skills/academic-paper/agents/peer_reviewer_agent.md skills/academic/paper/agents/peer_reviewer_agent.md` prints 48 hunks; the first ones show `name: peer-reviewer`, `## Phase Boundary`, the `phase{M}_*/` bullet removed and `**Enforcement:** prompt-level only.` Holds. The same diff also holds `paper`'s own deviations ("at most two reviews and one rewrite"), which are no model for this step; the brief says its content is not taken.
- Bullet 9. `cat docs/adr/0043-*.md`: Decision 1 has "section by section with the same words in the same order", "stands in the folder its source has in academic-paper", "under the source's file name" and "The only edits are these:" with six bullets. Holds.
- Bullet 10. `cat docs/adr/0002-*.md`: the Decision says "No rule that contradicts the prose standard is carried." Its status line reads "superseded by 0026 for a manuscript in the part `skills/academic/writing/references/manuscript-prose-standard.md` lists". The brief's wording follows ADR 0043's sixth bullet. Holds; ADR 0026 is not named (see 7).

Findings: F3.1, "15 under `references/`" is 12, and "What to build" says "`references/` (14, every file but `changelog.md`)" where it is 11; 7+14+3+3 is 27, not the 24 the same sentence states. F3.2, "16 of the pages" is 12. F3.3, "none of which exists in this repository or in research-hub" is false for the skills deep-research and academic-pipeline, which research-hub holds; they do not exist in ordo, which is what edit 2 rests on.

## 4. Cases and checks

Source pages read in full: `agents/eic_agent.md`, `agents/devils_advocate_reviewer_agent.md`, `references/sprint_contract_protocol.md`, `references/integration_guide.md`, `references/calibration_mode_protocol.md`, `references/guided_mode_protocol.md`, the rows of `references/top_journals_by_field.md`. The other pages were read by grep and in parts (see "Declined to judge").

F4.1. The `phase{M}_*/` bullet, generalised from the EIC case, drops a rule on the synthesizer's page. The EIC case says "The bullet on `phase{M}_*/` directories is gone". The same bullet stands on six pages (`grep -n 'phase{M}' agents/*.md`). On `agents/editorial_synthesizer_agent.md:21` it reads "(no regress into Phase 1 reviewer territory <em dash> do not rewrite or augment reviewer cards; if a reviewer's card is incomplete, flag it, do not silently fix)". No other bullet of that block states that rule. `paper`'s formatter page kept such a parenthesis as the bullet ("Edit prior phase artifacts (no regress: ...)"), and its peer reviewer page dropped the bullet. The brief does not say which holds per page, and edit 2's unit rule ("else ... the list item") leads to the drop.

F4.2. The EIC case drops a clause that edit 2 keeps. Case: "The sentence on the full academic pipeline and the orchestrator's Phase 5 is gone." Source, `agents/eic_agent.md:18`: "Within the full academic pipeline, the reviewer skill itself sits at the orchestrator's Phase 5 (Review), but each agent inside the reviewer skill is single-phase relative to the skill's own phase numbering." The second clause is about this skill and stands without the first. Edit 2 says the unit is "a clause when the rest of the sentence stands without it". The case and the edit disagree.

F4.3. Edit 2 says "the one such section is 'Relationship with deep-research devil's_advocate_agent'", and the devil's advocate case and decision 4 leave out a second one, `### Cross-Model DA (Optional, v3.0)` (`agents/devils_advocate_reviewer_agent.md:346`). The heading case also allows only "the one section left out". Three places of the brief contradict each other.

F4.4. The heading case is wrong for headings the edits change in other ways. "For every page: the list of headings ... apart from a version tag removed, a dash replaced and the one section left out." The source has headings that lose or change something else:
- an issue number: `agents/devils_advocate_reviewer_agent.md:212` "### 9. Field-Norm Severity Calibration (#215)", `:223` "## Surface-Form Parity Self-Check (#216)", `agents/domain_reviewer_agent.md:166`, `agents/editorial_synthesizer_agent.md:118`, `references/calibration_mode_protocol.md:77`, `examples/subclaim_decomposition_example.md:70` "(acceptance for #214)";
- a date: `references/calibration_mode_protocol.md:211` "## Resolved design decisions (2026-04-09)";
- a label with a tag: `references/re_review_mode_protocol.md:43` "### Commitment Ledger Verification (Kong A1 / v3.11)";
- an emoji: `examples/subclaim_decomposition_example.md:20` and `:30`;
- a section sign or U+2265: `agents/editorial_synthesizer_agent.md:94`, `:165`, `examples/subclaim_decomposition_example.md:1`.
Also 218 heading-like lines stand inside code fences (awk count over the pages), and the case does not say whether they count.

F4.5. The sprint-contract case says sections 1 to 11 are there "with every list item and table row", and edits 2 and 4 remove or rewrite list items there:
- `references/sprint_contract_protocol.md:71`, section 6, "Operational monitor ... in real SR runs ... v3.6.3 introduces graceful-degradation fallback": a version tag and a future release.
- `:50`, "deferred to a post-v3.6.2 judge-agent layer".
- `:118` to `:120`, "Shipped template coverage" with the items `reviewer/full.json` and `reviewer/methodology_focus.json`: template files under `shared/contracts/`, which edit 2 leaves out as paths, while the items say which pattern each contract uses. The brief does not say whether these two items stay with the names changed or go. Ruling 2-contracts now puts both contracts into `SKILL.md`, so the items have something to point at.
- `:36`, section 3, "Template on disk is frozen. Do not mutate. Deep-copy into an in-memory dict.": the brief moves the contract to `SKILL.md` and says nothing of this item.
- `:122`, "New expression forms require a PR updating both this section 9 and ...".
The case as written fails on a correct copy, or pushes the builder to keep text the edits remove.

F4.6. The calibration case and decision 4 do not bound "the cross-model passages". Case: "no `ARS_CROSS_MODEL`". The page holds, beside the two sentences that name the variable (`references/calibration_mode_protocol.md:49`, `:191`), the report line "Cross-model: <yes/no, model families used>" (`:100`), the paragraph "Cross-model evaluation <em dash> stronger evidence where available" with four bullets (`:188` to `:193`), the paragraph "A single-model spot-check" (`:195`) and the reference `:224`. Only some of these rest on the variable or on `shared/cross_model_verification.md`. The case also says "the report shape" is there. Without a line per passage the builder either drops source text that names no missing thing or keeps a reference to one.

F4.7. Edit 4's dash rule does not cover two uses the source has.
- All three U+2013 are number ranges: `agents/editorial_synthesizer_agent.md:112` "(1<en dash>5)", `examples/subclaim_decomposition_example.md:5` "Phase 0<en dash>2", `:64` "Tables 3<en dash>4". A colon, comma, semicolon, parenthesis or new sentence fits none; the prose standard's section 0 says a hyphen in a number range is not a dash.
- U+2014 as a value: an empty table cell on 9 rows (`references/sprint_contract_protocol.md:79` to `:81`, `references/top_journals_by_field.md:100`, `templates/revision_response_template.md:187`, `examples/subclaim_decomposition_example.md:38`, `:39`, `:42`, `:43`) and the literal in backticks that the output format uses (`agents/editorial_synthesizer_agent.md:307`, `templates/editorial_decision_template.md:89`). The brief names no replacement, and the two literals must match the cells.

F4.8. Edit 4 says "An emoji or a check mark is the word it stands for". In `references/re_review_mode_protocol.md:100` and `:101` the cell is "<check mark> Yes" and "<warning sign> Partial", and `:32` is "`<magnifying glass> Cannot verify`": the word already follows the sign, so the rule gives "Yes Yes". The brief should say the sign is removed where its word stands beside it.

F4.9. Edit 3 says a reference "changes only where it names `references/changelog.md`, which is left out with its sentence". `grep -rn -i changelog` over the 25 pages prints only `references/changelog.md:1`: no page names it. References that do change are not covered: `academic-paper/SKILL.md` and its heading "v3.6.6 Generator-Evaluator Contract Protocol" (`references/sprint_contract_protocol.md:8`; `skills/academic/paper/SKILL.md:814` has `## Generator-Evaluator Contract Protocol`), `academic-paper-reviewer/references/quality_rubrics.md` (`references/calibration_mode_protocol.md:225`), and `sprint_contract_protocol.md section 9` (`agents/editorial_synthesizer_agent.md:54`). `docs/dev/skill-layout.md`, "Paths and names", gives the forms.

F4.10. Things the source's pages name that do not exist in this repository and that the seventh bullet does not list:
- `evals/gold/field_norm_severity/`, a regression fixture: `agents/domain_reviewer_agent.md:178`, `references/calibration_mode_protocol.md:87`.
- `POSITIONING.md`: `references/re_review_mode_protocol.md:57`.
- `shared/handoff_schemas.md` (under `shared/`, but outside the three files the bullet's parenthesis lists): `references/re_review_mode_protocol.md:59`; with it "Schema 11" and "Schema 8" at `:45`, `:51`, `:55`, `:57`.
- The pipeline's stages, named without the skill: "Pipeline Stage 3'" `references/re_review_mode_protocol.md:3`, "Stage 3 output" `:9`, "Stage 4.5 integrity check" `:68`.
- The marker comments `<!-- SURFACE-FORM-PARITY-BLOCK:BEGIN (#216) -->` and `END`: `agents/devils_advocate_reviewer_agent.md:227`, `:237`, `agents/editorial_synthesizer_agent.md:122`, `:131`.
- "the citation-claim alignment judge" and "the suite": `references/calibration_mode_protocol.md:190`.
- "real SR runs": `references/sprint_contract_protocol.md:71`. A pull request ("a PR"): `:122`. The audit log: `:38`, `:130`.
- A link to an issue of the upstream repository: `examples/subclaim_decomposition_example.md:3`.
- "active conductor": the Enforcement line of six agent pages, for example `agents/eic_agent.md:31`.
- `devils_advocate_reviewer`, a stem without `_agent`: `references/calibration_mode_protocol.md:173`. `formatter_agent`, a role of `paper`, not in edit 1's examples: `agents/editorial_synthesizer_agent.md:23`.
The Commitment Ledger section (`references/re_review_mode_protocol.md:43` to `:61`) rests on `revision_coach_agent` Step 3.5, which exists: `skills/academic/paper/agents/revision_coach_agent.md:90`.

F4.11. Edit 1 names "the orchestrator"; the source also has the word without the article: "orchestrator-immutable" (`references/sprint_contract_protocol.md:38`), "(orchestrator, not validator)" (`:42`), "orchestrator aborts" (`:61`). Verify item 4 catches them, but the brief gives no form for them, and "validator" in `:42` is the missing script.

F4.12. The report item "The terms: each term of the glossary `docs/glossary.md` the pages use, each use read against the entry" asks the builder to check places the step does not change. The copied pages use "reviewer", "finding", "verdict", "gate", "round", "roadmap", "ledger", "step" and "case" in the source's senses, hundreds of times, and the brief forbids rewording them. `docs/dev/skill-layout.md`, "Writing for an agent", asks that a glossary term be used only in a sense defined there; "What it must do" sets aside the prose standard for copied text and says nothing of this rule. The brief should say the same for the glossary rule and bound the report item to the words an edit writes.

F4.13. The top-journals case and the fourth bullet of "What is on the tree" cite a page by line numbers ("lines 176 to 183"), and the report shape asks for each left-out sentence "quoted from the source with its line number". The rules file, "Where the work happens", says a ledger file cites a skill's text by its section, the quoted text locating it.

Cases that hold against the source: the frontmatter and the two headings of the EIC case; "the other four bullets of 'You MUST NOT'" (the block has five); the Enforcement paragraph; the top-journals rows ("Bulletin of Educational Research" to "Psychological Testing", 8 rows, 4 cells each); the integration guide (steps 2 to 9 are on academic-paper, academic-paper-reviewer and the two integrity checks; step 1 is deep-research); `changelog.md` absent. The devil's advocate case holds apart from F4.3. The first read on the unchanged tree finds every case's page absent, which fits a text step.

Findings: F4.1 to F4.13.

## 5. The question

"Could this pass without the goal being reached?", the goal being that each page is its source with only the six edits.

- Case, `eic_agent.md` diff: no for this page, since every hunk is read; and as written it requires a drop the edits do not ask for (F4.2).
- Case, devil's advocate: yes. It names four sections and two absences; any other change on the page passes it.
- Case, sprint-contract protocol: yes. It checks headings, items and three rows; a reworded sentence passes it.
- Case, top journals: yes. It reads 8 rows of one page.
- Case, integration guide: yes. It reads the steps' presence and order, not their words.
- Case, calibration protocol: yes. It lists absences and four kinds of content.
- Case, headings of every page: yes. Body text is not read.
- Case, `changelog.md` absent: yes.
- The check on the step's line (`diff` of each page shows only those edits; the character-set check prints nothing): no for the `diff` part, when each hunk is read; yes for the character-set part alone.
- Verify 1, character set: yes. It reads characters only.
- Verify 2, the 24 paths: yes.
- Verify 3, no version tag: yes.
- Verify 4, the grep of missing names: yes; and it does not hold the names of F4.10 (`evals/`, `POSITIONING`, `Schema`, `Stage`).
- Verify 5, every `diff` read whole: no. It is the goal's own check; it rests on the builder's reading, which the reviewer repeats.
- Verify 6, the sentences an edit wrote against the prose standard: yes.

Findings: F5.1, only the `diff` reading reaches the goal; the brief's other checks and seven of its eight cases are spot checks, which is acceptable only because verify 5 and the first case's sentence "every hunk is one of the six edits" stand for all 24 pages. The brief states that sentence for the EIC page alone in "Cases".

## 6. Implied inputs

This is not a code step: it writes 24 Markdown pages and no script, test or configuration file, so there are no implied inputs to list.

Findings: none.

## 7. ADRs

Read: the status line of every record (`grep -m1 -i '^Status'` over `docs/adr/00*.md`, 43 records), ADR 0043 whole, ADR 0002 whole, the Context and Decision of ADR 0026, the Decisions of ADR 0001 and 0030. The other records were searched for the step's names (see "Declined to judge").

- ADR 0043 (proposed), Decision 1: "Each file ... is copied into one page ..., section by section with the same words in the same order ... The only edits are these", with six bullets. The plan's ruling "A copy and nothing else" puts the step under it. Named in the brief.
- ADR 0002 (proposed; superseded by 0026 for a manuscript): "No rule that contradicts the prose standard is carried." Named in the brief, through ADR 0043's sixth bullet.
- ADR 0026 (proposed): "It is held to the prose standard ... with the differences `skills/academic/writing/references/manuscript-prose-standard.md` lists." It governs the page edit 6 reads a rule against. Not named in the brief; the brief names the page itself.
- ADR 0001 (proposed; superseded by 0030 in the `standards` key): the prose standard is read "where it is". `ls docs/dev/prose-standard.md` prints "No such file", so the template path the brief names is the page in force. Not named; no effect on the step.

No part of the brief contradicts a record. ADR 0043, Decision 1, leaves academic-paper's higher-education example files out of `paper`; that list is of academic-paper's files, and the plan's Goal copies every file of the source's `examples/`, so copying `examples/hei_paper_review_example.md` is no contradiction.

Findings: F7.1, ADR 0026 touches edit 6 and the brief does not name it.

## 8. Dictated text

Each line is found by `grep -n -- '<text>' .scratch/6-paper-review/agents/briefs/1.md`.

- The frontmatter names `eic`, `methodology-reviewer`, `domain-reviewer`, `perspective-reviewer`, `devils-advocate-reviewer`, `editorial-synthesizer`, `field-analyst` (`grep -n 'devils-advocate-reviewer'` prints line 34): holds. `docs/dev/skill-layout.md`, "Frontmatter", binds `SKILL.md` only, and `paper`'s pages use the same form.
- `## Phase Boundary` (`grep -n '## Phase Boundary'` prints lines 15, 44, 55): holds. A noun-phrase label with no version, as the layout's Anti-patterns ask.
- `## Sprint Contract Protocol` (lines 44, 55): holds. The synthesizer's page has `## v3.6.2 Sprint Contract Synthesizer Protocol`, which the same rule turns into `## Sprint Contract Synthesizer Protocol`; the brief gives no line for it.
- "Sprint contract status" with its sentence that sprint contracts hold for `reviewer_full` and `reviewer_methodology_focus` only and that this mode runs without one (line 45): holds against rule 17 of the rules file; the source's sentence states the same.
- The row text "the mode has no contract and runs without the two-call protocol" (line 45): holds for the re-review row. The calibration and guided rows of the source say only "not shipped in v3.6.2", so "runs without the two-call protocol" adds words to those two; the sprint-contract case asks only that they "say the mode has no contract".
- "the session" for "the orchestrator" (`grep -n 'the session'` prints lines 32, 101, 106): holds. `docs/glossary.md` defines "session, the" as the session that runs a skill and "orchestrator" as the session that runs a plan.
- `paper-review` for `academic-paper-reviewer` and for "ARS", `paper` for `academic-paper` (lines 31, 35): holds.
- `**Enforcement:**` with "prompt-level only" (line 55): holds; `paper`'s pages read the same.
- `->` and `<->` for the arrows (line 43): breaks the prose standard's section 0, "Arrows (`->`) only inside code and code comments, never as prose punctuation", where the arrow stands in prose, for example `agents/devils_advocate_reviewer_agent.md:323` "If yes <right arrow> evaluate its strength". The source already writes `->` in prose (`agents/eic_agent.md:115`), and `skills/academic/paper/agents/revision_coach_agent.md:47` keeps it. The brief should say that the copy follows `paper` here.
- `>=`, `!=`, `+/-`, `x`, `^2`, the word "in", `ceil(...)`, the word "section", `...` (line 43): hold. `+/-` and three dots are the prose standard's section B forms.
- The dash replacements (line 43): hold for a dash between clauses and for "X (dash) Y" headings; they do not fit the three number ranges and the dash used as a value (F4.7).

Findings: F8.1, the arrow line breaks the prose standard's section 0 in prose and the brief does not say the copy follows `paper`. F8.2, the brief dictates no heading text for the synthesizer's protocol section.

## Declined to judge

- Whether the two "Shipped template coverage" items, the "Template on disk is frozen" item and each cross-model passage of the calibration page stay or go (F4.5, F4.6): each is a choice between keeping source text and leaving out a missing thing, which is the orchestrator's to write into the brief, or the user's.
- Whether the Commitment Ledger section's "Schema 11" and "Schema 8" count as a mechanism that does not exist: the fields they name exist in `paper`'s revision coach page; the schema file does not.
- Whether "integrity check" in the integration guide and "Stage 4.5 integrity check" name a thing that exists: ADR 0043 gives the integrity checks to `researcher`, which is not built. The brief keeps the guide's two steps.
- Edit 6: no rule of the source was read against the manuscript prose standard; the brief leaves that reading to the builder and names no instance.
- Not read in full: `agents/methodology_reviewer_agent.md`, `domain_reviewer_agent.md`, `perspective_reviewer_agent.md`, `field_analyst_agent.md`, `editorial_synthesizer_agent.md` past its first 135 lines, the three examples, the three templates, and `references/` editorial_decision_standards, quality_rubrics past its first 28 lines, re_review_mode_protocol outside the parts quoted, review_criteria_framework, review_quality_thinking, statistical_reporting_standards and top_journals_by_field outside rows 170 to 186. They were searched by grep for version tags, issue numbers, paths, agent stems, non-ASCII characters and the names of the seventh bullet. A missing thing named in plain words on those pages would not have been found.
- Not read in full: the 39 ADRs other than 0001, 0002, 0026, 0030 and 0043. Their status lines were read and they were searched for `paper-review`, `academic-paper-reviewer` and `panel`; the hits are Context or Consequences lines. A decision of one of them that governs a copied page without those words would not have been found.
- `.scratch/6-paper-review/agents/briefs/2.md` and `2-contracts/` appeared during the check and were not read.

Agent usage: a7158d80e8b21c9c4, claude-fable-5-2, 234992 tokens, 29 tool uses, 7.2 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- F1.1: the brief of step 2 names the heading texts this step writes ("What is on the tree"), and this brief's edit 4 gives each.
- F3.1, F3.2, F3.3: "What is on the tree" and "What to build" now say 12 files under `references/`, 11 copied, 12 pages with version tags, and that the named things do not exist in this repository.
- F4.1: edit 2 has a bullet for the `phase{M}_*/` bullet: the words on the directories go, the rule of the parenthesis stays as the bullet. The EIC case follows.
- F4.2: edit 2 has a bullet that keeps the clause on single-phase agents. The EIC case follows.
- F4.3, F4.6: edit 2 names both sections left out and says, for the calibration page, which cross-model text goes and which stays. Decision 4 and the calibration case follow.
- F4.4: the heading case allows what an edit changes inside a heading and the two sections, and says a heading-like line in a code block is read with the diff. Edit 4 names issue numbers, dates and tags in headings.
- F4.5: edit 2 says what each named item of the sprint contract protocol becomes, edit 4 how each history sentence is restated, and the case excepts the sentences the edits leave out or restate.
- F4.7: edit 4 gives the hyphen for a number range and `-` for a dash that stands as a value, in the cell and in the literal.
- F4.8: edit 4 says the sign is removed where its word stands beside it.
- F4.9: edit 3 is rewritten with the forms of the skill layout's "Paths and names" and the three references the report names.
- F4.10: the seventh bullet of "What is on the tree" lists the further things; edit 2 has bullets for the schemas, the marker comments and "real SR runs"; edit 1 names the further stems; verify 4's pattern is widened.
- F4.11: edit 1 gives the forms without the article.
- F4.12: "What it must do" says the glossary rule holds only for the words an edit writes, and the report item is bounded to them.
- F4.13: the brief names the rows by their quoted text and the report quotes a left-out sentence under its heading.
- F5.1: "Cases" has a case for every one of the 24 pages: every hunk of its diff is one of the six edits.
- F7.1: "What is on the tree" names ADR 0026.
- F8.1: edit 4 says the copy keeps `->` as `paper`'s pages do.
- F8.2: edit 4 gives `## Sprint Contract Synthesizer Protocol`.
- Dictated lines added after the check, each held against the rules file and the standards: "session-immutable", "the session aborts", "(the session)", "the Devil's Advocate reviewer", "the formatter", "the full contract", "the methodology-focus contract", "real runs", `## Sprint Contract Synthesizer Protocol`: each holds; none carries a version, a date or a character outside the set.

