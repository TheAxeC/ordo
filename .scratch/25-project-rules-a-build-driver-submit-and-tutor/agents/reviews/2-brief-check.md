# Brief check: step 2 of `.scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/briefs/2.md`

All commands below ran read-only from `/Users/axelfaes/workspace/ordo` on main. HEAD is `ed4e961`. The brief says it was read at `bfa4f40`. `git diff --stat bfa4f40 HEAD` lists only four ledger files: `1-round-1.md`, `1-refuter.md`, `1-report.md` and `orchestrator-state.md`. `git status --short` shows step 1's staged changes (`docs/dev/change-standard.md`, `skills/orchestration/plan-orchestration/SKILL.md`, three `ordo-init` templates), and none of them is a path this step writes.

## 1. Names

The names this step changes or adds are:
- the sentence and term `venue-compliant`;
- the heading "Conflict precedence: venue compliance wins";
- the check "Word/page count within limits";
- the checklist line "suggest sections to trim";
- the patch id `limit-cut`;
- the versions 4.1.3, 1.0.1 and 2.1.2;
- the sections of the manuscript prose standard.

Hits outside "Paths this step writes":

- `grep -rn -i 'venue-compliant\|venue compliance wins\|Conflict precedence' . | grep -v '^./.scratch'`:
  - `skills/academic/paper/agents/intake_agent.md:131: - **Venue compliance wins:** ... Where a declared layout field would push the manuscript past a declared `venue_profile` limit (e.g. margins/spacing inflating page count), the formatter applies the venue-compliant value and notes the override; ...`. The change makes this line false. It is a second copy of the sentence the step replaces. The brief does not name it, and the case "`grep -rn 'venue-compliant' skills` after the step: expected: no line" cannot pass while it stands. The brief's premise says only that `grep -n 'venue-compliant' skills/academic/paper/agents/formatter_agent.md` prints one line, which holds (line 127). It never shows that the formatter is the only page.
  - `skills/academic/paper/agents/intake_agent.md:95: ... consumed by the formatter ("Conflict precedence: venue compliance wins" of `agents/formatter_agent.md`)`. This line becomes false if item 1 renames the heading. The heading at `formatter_agent.md:125` is itself named "venue compliance wins".
  - `docs/adr/0043-...md:3` and `docs/adr/0050-...md:7,13`: these are ADRs, left as they are by item 7.
- `grep -rn 'Word/page count within limits\|suggest sections to trim\|has no page count\|limit-cut' skills docs README.md utils | grep -v '^docs/adr'`:
  - `skills/academic/paper/references/journal_submission_guide.md:18:- [ ] Word/page count within limits`. The formatter's check uses the guide's words ("A row holds the check in the guide's words"), so the check's name has to stay as it is. Only its rules can change. The brief does not say so.
  - `limit-cut`: no hit. That is the expected result for a new id. Its list, however, is `skills/academic/paper/references/revision_patch_protocol.md` ("The ids are:" table, rows `reference-fix` and `compile-fix` at line 98). This file is not under "Paths this step writes", and item 2's "any list of patch ids that the page keeps" points at `SKILL.md`, which keeps no such table. The other list that names the draft writer's later patches is `SKILL.md` Steps 12: "The patches are the draft writer's one rewrite of full mode's revision loop, the results-check patch above, the reference fix and the compile fix (Steps 11), and the findings pass (Steps 13)". It must name the cut, or the cut's cited sentences get no incremental check.
- `grep -rn '4\.1\.3\|1\.0\.1\|2\.1\.2' skills docs/dev docs/figures README.md utils docs/glossary.md | grep -v '\.svg:'`: the only other hits are `skills/code/wizard/SKILL.md:5` and `skills/academic/paper-review-panel/SKILL.md:5` (version "1.0.1"). These are other skills, and the change does not make them false.
- Manuscript prose standard. `grep -rn -i 'manuscript prose standard\|manuscript-prose-standard' docs/glossary.md README.md docs/dev ...` finds nothing outside `skills/academic/writing`. Inside writing, `skills/academic/writing/SKILL.md:183` says "It lists the rules ... a manuscript leaves out, the two it replaces, and its own section G". That line becomes false if the rule gets a section of its own. It is a writable path, but item 5 does not name the sentence.
- `docs/figures/`. `ls docs/figures docs/figures/paper` and `grep -n ... docs/figures/gen_figures.py` show these figures:
  - `grant.svg`, built from `grant()` in `gen_figures.py:1985-2025`. Its nodes run `W -> C -> F -> V`, and its note says "runs check_sections.py and check_limits.py before the writing review and again after its patch". The cut's return makes the graph incomplete.
  - `paper/full.svg`, from `paper_full_graph()` at `gen_figures.py:1348` (node "Formatter: targets, cover letter, AI disclosure, checklist").
  - Possibly `paper/format-convert.svg` and `paper/disclosure.svg`, depending on the modes chosen.
  - Decision 3 of the brief covers these figures through "Doc text".
- `README.md`. `sed -n 84p README.md`, `92p`, `104p` and `108p` are the alt texts of `grant.svg`, `paper/full.svg`, `paper/disclosure.svg` and `paper/format-convert.svg`. They list every box ("...Formatter: the layout of the funder config, only when it states one, dashed; You pick the writing findings to apply, a stop; ..."). A new box in a figure makes its alt text false. Decision 3 names only the figure script, not these README lines.
- `docs/dev/`. `grep -rln -i 'formatter\|page limit\|draft writer' docs/dev` prints `docs/dev/scripts.md` only, for `reference_docx.py`. The change does not make it false.
- `docs/glossary.md:155` ("incremental citation check": "one later patch of the draft writer") stays true as written.

## 2. The step line

The step line's parts, mapped to the brief:
- "the rule of ADR 0050 as ruling D4 gives it": item 1, and items 2 and 4 for the parts of D4.
- "the formatter's sentence replaced": item 1.
- "one return to the draft writer to cut content": item 2 (paper) and item 4 (grant).
- "what is still over shown with each section's length": items 1, 2 and 4.
- "the same step in grant": item 4.
- "manuscript-prose-standard.md holds that every sentence of a deliverable answers the reader or states a change, with no process history": item 5.
- Check, "the user reads each changed passage": Report part "Each changed passage quoted before and after".
- Check, "no sentence of paper/ or grant/ changes a layout value to meet a limit, by reading every hit of `grep -rnEi 'limit' ...`": Verify 4 and item 7.

Every part of the line is present. Requirements that serve no part of the line:
- Item 3, the deviation record. It serves ADR 0036 and 0043, not the line (see check 6 and check 8).
- Item 5's change to `writing/SKILL.md`. It goes beyond the line ("holds"), and it serves the brief's own "What it must do" ("`/writing` checks it").
- Item 6, the versions.

One gap: `agents/draft_writer_agent.md` is in "Paths this step writes", but no item of "What to build" asks for a change to it. The draft writer then has no task text for the cut, unlike "The reference fix" and "The compile fix" (`draft_writer_agent.md:646,656`). Under rule 20 ("Nothing is changed that no brief item asks for") the builder cannot add one.

## 3. Premises

Each premise was rerun with the command the brief gives:
- `grep -n 'venue-compliant' skills/academic/paper/agents/formatter_agent.md` prints `127:...`, one line. Holds, but see check 1: the same sentence stands at `intake_agent.md:131`, which the premise does not cover.
- `grep -n 'Word/page count within limits\|has no page count' ...formatter_agent.md` prints `900:` and `902: - A page limit that a file of the run declares gives `for the author`, since the formatter has no page count, ...`. Holds.
- `grep -n -A2 'Word/Page Limit' ...` prints `558: [ ] Word/Page Limit`, `559: -> IF exceeds -> suggest sections to trim`, `560: -> IF within limit -> PASS`. Holds.
- `grep -n 'Trim redundancy\|requires user decision' ...draft_writer_agent.md` prints `316:` and `317:`. Holds.
- `grep -n -i 'page limit\|over its limit\|over the limit' skills/academic/paper/SKILL.md` prints nothing (rc=1). Holds. Not covered by the premise: "Failure paths" at `SKILL.md:902` reads "Word count significantly over/under target | Identify problematic chapters, suggest trimming/expansion".
- `grep -n 'over the page limit' skills/academic/grant/SKILL.md` prints `247:`. Holds.
- `grep -n 'A field over its limit' ...` prints `279:`. Holds.
- `grep -n 'format profile\|id .layout.' ...grant/SKILL.md` prints `169:`, `213:` and `218:`. Holds.
- `grep -n '^## ' ...manuscript-prose-standard.md` prints `5:## Rules left out`, `16:## Rules replaced`, `21:## G. The project's own software`. Holds. `grep -rn -i 'process history\|earlier version\|answers the reader\|how the text came' skills/academic/writing ...` prints only `references/rules.md:166: A section answers the reader's question in its row ...`, which is a section rule, not a sentence rule. Holds.
- `grep -n 'version:' ...` prints `grant 1.0.1`, `paper 4.1.3`, `writing 2.1.2`. Holds.
- The ADR quotes for 0050, 0043, 0026 and 0044 match the files I read with `cat`.
- The ruling D4 quote matches `plan.md`.

Wrong or missing premises:
- (a) The brief says the formatter "holds one paragraph that changes the layout". `intake_agent.md:131` is a second one (above).
- (b) Item 5 speaks of "the agent pages that list the manuscript rules by section" of writing. `ls skills/academic/writing/agents` prints "No such file or directory". Writing's agent lists are sections of `writing/SKILL.md` ("Agent prompts", "The manuscript prose standard", "Section agent" and the agents' sections).
- (c) Missing premise: the venue profile records no page limit. `intake_agent.md:97` lists "word limit, abstract limit, keyword range, required sections, reference ceiling, blind-review model". The formatter has no page count (`formatter_agent.md:902`). `paper` never reads a page count: `grep -rn -i 'page count\|pdfinfo\|number of pages' skills/academic/paper` finds only word counts. This bears on case 1 and on items 1 and 2 (check 4 and check 8).

## 4. Cases and checks

Cases that are inconsistent with the rules file, the standards or the tree:

- Case 1, "A manuscript whose declared format profile sets a font size that pushes it past the venue's page limit: expected: the formatter changes no layout value and reports the manuscript over the limit." This cannot be met as the tree stands. The formatter "has no page count" and gives `for the author` for a page limit (`formatter_agent.md:902`). No step of `paper` counts pages. The brief gives no source for the count (for example, the compile log's "Output written on ... pages" line, which `grant` reads in Steps 9). Item 1 then asks the formatter to report something it cannot know. Rule 4 of the rules file makes that a premise stop for the builder, and the brief should settle it first.
- Case 2, "A full-mode run ... over a declared word limit after the draft": the draft writer's own Word Count Monitoring already trims against the outline's targets during the draft (`draft_writer_agent.md:303-332`). Item 2 places the return after the formatter, "after the draft" in the case's words. The case does not say whether the cut comes before or after the closing review's findings pass, which can add words again (Steps 13, which compiles after the pass and never counts again).
- Item 2's sentence "The Stops table ... name[s] the new return" conflicts with `docs/dev/skill-layout.md`, "Sections, in order", row 7. There the Stops table holds stops with "What resumes it". `SKILL.md`, "Stops", says "The rows up to 'A script failed' are stops, decisions for the user". The return asks the user nothing, so a Stops row for it would describe a non-stop as a stop.
- Item 6 and decision 2 give `grant` a minor raise. `docs/dev/skill-layout.md`, "Frontmatter", says the major part is raised when "a run that worked before is ... its output is changed". The brief raises `paper` to 5.0.0 "since the formatter's output for a run over its limit changes". A `grant` draft run over the page limit also changes its output: the draft is cut. By the same rule `grant` takes 2.0.0. This is inconsistent with the standard and with the brief's own reason.
- Rule 5 of the rules file ("the ADR that owns the decision when the change touches one") and ADR 0026's Consequences ("A new difference for manuscripts is added to the page and to this record's Decision") ask for item 5's rule to be added to ADR 0026's Decision. The brief writes nothing under `docs/adr/` and item 7 leaves ADR hits as they are.

Cases that ask the builder to check a place the step does not change:
- "A `grant` form field over its limit: expected: unchanged, the existing sentence" (`grant/SKILL.md:279`).
- "A verbatim block wider than the page: expected: the formatter's sentence on a smaller font for it is unchanged" (`formatter_agent.md:546`).

Both are controls on unchanged places, and both are consistent with item 7.

## 5. The question

The step's goal part: `paper` and `grant` meet a limit by cutting content and never by layout, and the manuscript prose standard holds the deliverables rule.

- The step line's check could pass without the goal being reached: yes, if the grep were taken alone. `grep -rnEi 'limit'` finds sentences that name "limit". It does not find a layout change phrased without the word, and it does not show that the return exists or that it runs in each mode. With the user's reading of each changed passage, which the line also requires: no. That reading is what shows the return, the modes and the rule.
- Item 1 (Verify 3, `grep -rn 'venue-compliant' skills` prints nothing): yes. The sentence can be reworded with the same meaning and the grep prints nothing. Only the reading and case 1 catch that, and case 1 cannot be met (check 4).
- Item 2 (no check beyond reading case 2): yes. The brief leaves the modes to the builder ("The builder finds those modes"). A return written in full mode alone passes case 2 and case 3. Format-convert and disclosure also start the formatter (`SKILL.md` format-convert item 4, disclosure item 2) and would get no return. No check names the modes.
- Item 3 (no check): yes. Nothing checks that the record exists, and no page records deviations (check 6 and check 8).
- Item 4 (case 4 read): mostly no. The case is concrete. It does not fix the cut's place against `draft` items 9 and 10, so a cut placed before the findings pass's compile can leave the last compile over the limit and still pass the case.
- Item 5 (case 6 read): no. The case asks for both the rule and an agent's list.
- Item 6 (Verify 6): no. It prints the exact versions. The grant version is wrong by the standard (check 4).
- Item 7 (Verify 4, `limit` in paper and grant only): yes. Item 7's own scope is `skills/`, `utils/`, `docs/` and `README.md`. The verify list greps two folders, so a stale README alt text, figure or intake sentence passes.

## 6. ADRs

I read the titles of every record (`ls docs/adr`). I searched them with `grep -l -i 'formatter\|page limit\|layout\|limit\b\|manuscript prose\|grant' docs/adr/0*.md`. I read in full 0026, 0036, 0043, 0044 and 0050, and the Status line and Decision of 0001, 0002, 0013 and 0029.

ADRs the step touches, each with the sentence of its decision the step is under:
- 0050: "In `paper` and `grant`, the layout (font, size, line spacing, margins) is only what the venue or the funder states, and is never changed to meet a limit." The brief names it.
- 0043: Decision 1, "Each file of academic-paper ... is copied into one page ... section by section with the same words in the same order. ... The only edits are these". Decision 3, "Each mode's roles, agent starts, stops and cycles are academic-paper's" and "The resumed agents are these: the draft writer, for the one rewrite ..., the results-check issues, the reference fix, the compile fix, the findings pass and the response letter". The brief names it.
- 0036: "records each deviation from it" (title), and Decision "Deviations from academic-paper, each kept with its reason". The brief names it.
- 0026: "That page holds no copy of the prose standard's rules. It lists the rules left out for a manuscript and the two rules it replaces. ... The page's own section G ...", with Consequences "A new difference for manuscripts is added to the page and to this record's Decision". The brief names it, but its items contradict that Consequences sentence (check 4).
- 0044: "`grant` ships the format of a funder config and one filled example, and holds no funder's facts." The brief names it. No item contradicts it.
- 0029, carried by 0043 Decision 3 ("The citation check of the cited sentences of each later patch is kept (ADR 0029)"): "after each patch that adds or changes a cited sentence once the first citation check has run ... the reference fix, the compile fix and the findings pass ... checks those sentences only". The `limit-cut` patch is such a patch. The brief does not name 0029 and does not say the cut gets the incremental check.
- 0013: "Each rule of the three pages is given to one agent." Item 5 is under it. The brief does not name it. No contradiction.
- 0001 and 0002 (superseded by 0026 for a manuscript): touched through 0026. No contradiction.

Whether items 1, 2 and 3 stay within what ADR 0050 supersedes:
- 0050's Consequences: "This record supersedes ADR 0043 in that one sentence of the formatter's page." 0043's Status: "superseded by 0050 in the formatter's sentence that applies a venue-compliant layout value to meet a limit." The brief's own premise: "every other sentence of `paper`'s pages stays a copy".
- Item 1 goes beyond the one sentence. It changes the checklist line `formatter_agent.md:559` and the check rules at `:900-902`. The latter are `paper`'s own addition ("The pre-submission checks"), not copied text. Line 559 is copied text. The paragraph's first sentence at `:127` and the heading at `:125` also state the precedence, and the intake's copy at `intake_agent.md:131` is outside the supersession too.
- Item 2 is outside it. It adds a draft writer task to `SKILL.md`, which 0043 Decision 2 keeps as academic-paper's `SKILL.md`. It also adds a resumption that 0043 Decision 3's closed list does not have. In format-convert ("9 only") and disclosure ("9 only") it would add a role the mode does not have, against "Each mode's roles ... are academic-paper's". 0050's Decision bullets ask for the return, but its supersession clause covers only the formatter's sentence, so the record contradicts itself. The brief follows the bullets and does not raise the clash.
- Item 3 cannot record the deviation where `paper` records deviations, since that place is ADR 0043 Decision 3's list and ADR 0036's Decision (check 8). The brief forbids `docs/adr/` writes.

ADRs the step touches that the brief does not name: 0029 and 0013.

## 7. Dictated text

The brief dictates no line word for word for a shipped file. The literal values it fixes are the patch id `limit-cut` and the versions:
- `limit-cut` holds. It is ASCII and has the form of `reference-fix` and `compile-fix`.
- `"5.0.0"` and `"2.2.0"` hold.
- `"1.1.0"` for `grant` breaks `docs/dev/skill-layout.md`, "Frontmatter", major-part rule (check 4).

## 8. Feasibility in `paper`

How a role is resumed and how patches are named and applied, from `skills/academic/paper/SKILL.md`, Steps 8, 9 and 10, read with `sed -n 107,330p`:
- Steps 8: "Every later task of a role goes to the agent that holds the role's work, resumed. In full mode that agent is the Phase 4b draft writer". "Resume an agent by sending it a second message with the runner's message tool on its agent id".
- Steps 9 numbers each file and anchorizes it before every start or resumption that writes a patch.
- Steps 10 applies with `apply_tex_patch.py --check-only`, then `--output`, then `cp` and `cmp`.
- The ids are listed in `references/revision_patch_protocol.md`, "The ids are:".

Modes that start the formatter, from `grep -n -i 'formatter' skills/academic/paper/SKILL.md`: full (item 12, Phase 7), format-convert (items 4 and 6) and disclosure (items 2 and 3). Revision, citation-check, outline-only, lit-review, plan, abstract-only, revision-coach, rebuttal-audit, response-letter and the two calls start none.

Whether item 2 can be built as written, in each of these modes:
- **full**: buildable in principle, since the Phase 4b draft writer is there to resume. The brief leaves out:
  - where the return goes relative to item 12. That item applies the formatter's patches, compiles, then makes the DOCX and Markdown targets. A cut placed after that leaves stale targets, so it has to come between the compile and the targets.
  - its place relative to the reference fix, which runs "after the last writer pass" (Steps 11). The cut is a later writer pass.
  - its place relative to the closing review's findings pass (Steps 13), which can add words after the cut and is never counted.
  - whether "the formatter's count is then taken again" means resuming the formatter to rewrite `format-report.md` or a count by the session.
  - the page count, which the formatter does not have (`formatter_agent.md:902`).
  - the incremental citation check of the cut's patch (Steps 12's list of later patches, ADR 0029).
  - the draft writer page's task section for the cut.
  - the patch id table in `references/revision_patch_protocol.md`, which is not a writable path under item 2.
- **format-convert**: not buildable as written. The mode has no draft writer ("9 only"), so there is none to go "back" to. A first start of the draft writer adds a role the mode does not have (ADR 0043 Decision 3). With only `docx`, `markdown` and `pdf` targets of a `.tex`, the formatter's patch is applied to a copy, and "the main `.tex` and every file beside it stay as they were" (format-convert item 5). A content cut contradicts that sentence. The brief does not say whether format-convert gets the return.
- **disclosure**: not buildable as written for the same reason (no draft writer). The run's only manuscript change is the `disclosure` patch. The brief does not say whether a disclosure run "declares a length limit".

Item 3: the brief leaves out where the record goes. `grep -rn -i 'deviation' skills/academic/paper` finds only word-count deviations. `grep -rn 'ADR\|docs/adr' skills/academic/paper skills/academic/grant skills/academic/writing` prints nothing. `paper`'s pages mark their own text as "Paper's addition: ..." sections (`grep -rn "Paper's addition"` gives 14 hits) and name no ADR. Its deviations are listed only in ADR 0043 Decision 3 and ADR 0036. "As the page that lists them does for the others, naming ADR 0050" has no such page in `skills/academic/paper`.

Description lengths, from `python3 -c 'import glob,yaml; ...'`:
- `994 skills/academic/paper/SKILL.md`: 30 characters spare.
- `1022 skills/academic/grant/SKILL.md`: 2 spare.
- `779 skills/academic/writing/SKILL.md`.

No item asks for a description change. Any added phrase in `grant`'s description goes over 1024.

`docs/dev/` pages or figures that describe the modes:
- No `docs/dev/` page describes them.
- The figures are `docs/figures/paper/full.svg` (and `format-convert.svg` and `disclosure.svg` if those modes get the return) and `docs/figures/grant.svg`, built by `docs/figures/gen_figures.py`. Decision 3 covers them.
- Their README alt texts (`README.md` lines 84, 92, 104 and 108) are not covered.
- ADR 0043's Consequences: "The figures of `docs/figures/paper/` draw `paper` as built, and `docs/glossary.md` and `README.md` describe it."

`grant` (item 4), read against `grant/SKILL.md` "draft", Steps 9 and `check_limits.py`'s head comment:
- The return is buildable. The draft writer is resumed under Steps 7, the compile and the two scripts run under Steps 9, and the page count comes from the log's "Output written on" line.
- The brief leaves out the cut's patch id (grant's draft patch is `draft`), its place against item 9 (writing review and findings pass, which runs Steps 9 again) and item 10 (DOCX), and the incremental check of its patch.
- It also leaves out where "each section's length against its limit" comes from. `check_limits.py` prints a section's count only for a limit in words or characters, and prints "not checked: <name>: ..." for "a section's limit in pages". The draft writer's `draft-report.md` gives "each section's length against its limit" (`draft` item 5).
- ADR 0050's bullet "`grant` has the same step after a compile that is over the page limit" is not limited to `draft`. `revise` also compiles (item 3) and gets no return in the brief, and its end message (item 5) does not give the page count.

## Declined to judge

- Whether ADR 0050's supersession clause should be widened to the intake sentence, the checklist line and `SKILL.md`, or the step narrowed. That is the user's ruling.
- Whether format-convert and disclosure should get the return at all, and whether `grant`'s `revise` mode should. These are design decisions under D4 for the user or the orchestrator.
- The source of a page count in `paper` (the compile log, `pdfinfo`, or none). That is a design choice the brief must make, not one the builder makes under rule 4.
- Whether item 1's "or with no venue value the declared format profile" keeps the current behaviour. Today the venue value overrides the profile only when the profile would break a limit. As worded, the venue value would always override it. I did not settle whether that change of meaning is intended (rule 17).

Agent usage: a87e63407ae314392, claude-opus-5-5, 235254 tokens, 51 tool uses, 7 min 58 s.

## Closed

- Names, the second copy of the sentence in `intake_agent.md` and its citation of the formatter's heading: item 1 of the brief now names both, and the path is listed.
- Names, the check "Word/page count within limits" keeps the guide's words: item 1 says the name stays and only its rules change.
- Names, the list of patch ids and the list of later patches: item 2 names `references/revision_patch_protocol.md` and the list of later patches in `SKILL.md`, and the path is listed.
- Names, the sentence of `writing/SKILL.md` on the page's sections: item 5 names it.
- Names, the figures and their alt texts in `README.md`: item 8 has the step change `docs/figures/gen_figures.py`, the figures and the alt texts; decision 3 is rewritten.
- The step line, no item for `draft_writer_agent.md`: item 2 asks for the draft writer's task section.
- Premises (a), (b), (c): the intake's copy is a premise; "the agent pages" of `writing` is corrected to the sections of `writing/SKILL.md`; the page count's source is a premise and a decision (the compile log's line, read by the session).
- Cases, case 1 could not be met: the case is rewritten on the count the session reads from the compile log.
- Cases, case 2 and the place of the cut: item 2 fixes the place and says what happens after the closing review's findings pass.
- Cases, a Stops row for a return that asks nothing: taken out; the return stands in the mode's steps and the final message.
- Cases, the version of `grant`: 2.0.0.
- Cases, ADR 0026's Decision gains the new difference: item 6 asks for it.
- The question, the modes left to the builder: item 2 names them: full mode gets the return; format-convert and disclosure, which have no draft writer, name a manuscript over its limit in the final message and cut nothing.
- The question, verify 4 over two folders: widened to the scope of item 9.
- ADRs, 0050's clause on what it supersedes is narrower than its Decision and than ruling D4: item 6 has the step correct the clause of 0050 and the Status line of 0043 to what the Decision of 0050 asks for, and add the return to the list of resumed tasks the Decision of 0043 keeps, each naming 0050. This carries out ruling D4 and changes no decision.
- ADRs, 0029 and 0013 unnamed: both are named, and the cut's patch gets the incremental citation check.
- ADRs, where the deviation is recorded: in the Decision of ADR 0036, as its other deviations are, and the new text in `paper`'s pages is marked as `paper`'s addition, as its other additions are.
- Feasibility, `grant`: the patch id, the place of the cut, the source of each section's length and the mode `revise` are in item 4. No description changes.
- Declined to judge, "or with no venue value the declared format profile": item 1 says that a value the venue states is used and a value it does not state comes from the declared format profile, which is the precedence the page already has, and that neither is changed to gain room.

