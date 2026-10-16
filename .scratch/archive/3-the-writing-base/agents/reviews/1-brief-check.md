# Step 1 brief check (on main at 8119dd3)

Every read and command below ran on the main checkout at 8119dd3 (`git log --oneline -1` printed `8119dd3 Open the plan of entry 3, the writing base`; `git status --short` printed ` M .scratch/3-the-writing-base/orchestrator-state.md` and `?? .scratch/3-the-writing-base/agents/briefs/1.md`). I changed no file. The probes of the `.docx` files used inline `python3 -I -c` reads and wrote nothing.

## 1. Names

Commands:

- `for pat in 'skills/writing' 'docx_paragraphs' 'registers\.md' 'references/rules\.md' '5\.1\.0' 'rapidly evolving' 'matter of fact'; do grep -rln "$pat" --exclude-dir=.git . | grep -v 'briefs/1.md' ...; done`. Hits on the live tree: `skills/writing` at `docs/roadmap.md:25`, `docs/roadmap.md:200` and `docs/adr/0001-...md:11 15 16`, plus `.scratch/3-the-writing-base/plan.md:11 20 21`. `docx_paragraphs`, `registers.md` and `references/rules.md` hit only `plan.md`. `5.1.0` hits only `skills/repo-setup/SKILL.md:5`. The two openers hit only `docs/roadmap.md:25` and `plan.md:11 47`. Every other hit is under `.scratch/archive/` or `.scratch/retros/`, which are logs.
- `git grep -n -e 'ordo-<reviewer_effort>' -e 'never chosen for other work' -e 'reviewer_effort' -- ':!.scratch' ...` and `grep -n "plan skills launch" agents/*.md`. They printed `agents/ordo-{low,medium,high,xhigh,max}.md:3` (`The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.`), `agents/ordo-*.md:6` (`You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent.`), `skills/plan/templates/plan.yaml:27`, `skills/plan/templates/orchestrator-state.md:26`, `docs/glossary.md:39 44` and `skills/repo-setup/templates/plan-terms.md:34 39`.
- `sed -n '12p' skills/plan/templates/plan.yaml` printed `reviewer: claude:opus # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.`. `.agents/plan.yaml:10` carries the same comment.
- `git grep -n -w 'session-retro' -- ':!.scratch' ':!skills/session-retro'`, used to find the lists of skills. It found `README.md:7`, `README.md:103` and `skills/repo-setup/templates/docs/glossary.md:3`. That last line reads: "The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below".
- `git grep -n -e '/writing' -e '`writing`' -- ':!.scratch'` printed hits at `docs/academic-coverage.md:100 101 170 184 191`, ADR 0001 lines 11 15 16 20, ADR 0003 lines 7 11 15, and `docs/roadmap.md:24 25 26 45 66 200`.
- ADR 0002:7 cites the prose standard by line number: `(:13)`, `(:41)`, `(:63)`, `(:48)`.

Hits outside "Paths this step writes", and whether the change makes them false:

- `agents/ordo-*.md:3` and `:6`, five files: made false. `/writing` would launch `ordo-<reviewer_effort>`, but `writing` is not one of the plan skills (glossary **plan skills**), and its review agent is not a builder, a reviewer or a brief-check agent. The definition says it is "never chosen for other work".
- `skills/plan/templates/plan.yaml:12` and `:27`, `skills/plan/templates/orchestrator-state.md:26`, `.agents/plan.yaml:10`: each comment lists who runs on `reviewer` or at `reviewer_effort`. After the step those lists leave out `/writing`'s review agent, so they are incomplete.
- `skills/repo-setup/templates/docs/glossary.md:3`: made false. Once item 6 lands, the plan-terms block holds a term in `writing`'s sense, and this line does not name `writing`.
- `docs/glossary.md:44` and `skills/repo-setup/templates/plan-terms.md:39` (**effort agent**), and `docs/glossary.md:104` and `plan-terms.md:99` (**reviewer**): both entries list the agents launched as, or running on, these. They become incomplete. The files are in the paths, but no item asks for this change.
- `docs/academic-coverage.md:101` is in the paths. "The writing base checks anti-patterns, among them ... over three dashes" becomes false, because under ADR 0002 the writing base reports every em dash, through prose standard section 0.
- `docs/academic-coverage.md:100` is in the paths. "each discipline's trusted voice" overclaims once D11 (Humanities left out), D18 (the voice column replaced) and D23 land. Item 8 amends only row 76's reason.
- ADR 0002:7 stays true only if item 5's openers go into the existing list on line 39 of the prose standard and add no line.
- Not made false: `docs/roadmap.md:25` (the gate), `docs/roadmap.md:200` (2.C's closing record, a log of that gate's output), ADR 0001:11, 15 and 16 (the step makes no copy), ADR 0003, `docs/roadmap.md:66` (it already uses "findings" in the `/writing` sense), `docs/academic-coverage.md:170 184 191`, and `README.md:7` (it does not claim to list every skill).

Findings: (1a) agents/ordo-*.md:3 and :6 are made false and are outside the paths. (1b) The plan.yaml template, orchestrator-state template and `.agents/plan.yaml` comments become incomplete and are outside the paths; changing the plan templates also means raising the patch part of `plan`'s version. (1c) `skills/repo-setup/templates/docs/glossary.md:3` is made false and is outside the paths. (1d) The **effort agent** and **reviewer** entries need the `/writing` agent, and no item asks for it. (1e) Coverage lines 100 and 101 overclaim after the step, and item 8 does not amend them. (1f) The brief should say the openers go into line 39's list, so that ADR 0002:7's line citations stay true.

## 2. The step line

Each part of step 1's line, and the requirement that serves it:

- `skills/writing/` with `SKILL.md`: item 1.
- `references/rules.md`: item 2.
- `references/registers.md`: item 3.
- `templates/docx_paragraphs.py` (D16): item 4.
- The two openers in section C: item 5.
- The term **finding** in `plan-terms.md`, synced into `docs/glossary.md`: item 6.
- Coverage row 76's reason amended (D11): item 8.
- The pages that list the skills and the scripts: item 9.
- Check, a ledger record for each `rebuild: writing` row: item 7, plus item 8, which makes each row name its file.
- Check, the skill read against the layout: the Case "`SKILL.md`, read against `docs/dev/skill-layout.md`".
- Check, section C and the term read: the matching Cases.
- Check, `sync_rules.py . --only glossary` exits 0: Verify 1.
- Check, `docx_paragraphs.py` run once on the grant: the second Case.
- "(1 commit)": served by the landing.

Findings: none. Every part has a requirement. Item 6's version bump to 5.2.0 and item 9's `scripts.md` row come from `docs/dev/skill-layout.md` and the change standard, not from the step line.

## 3. Premises

- Line 11. `ls skills` printed `diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec`. Holds.
- Line 12. `wc -l` printed `188 academic_writing_style.md`, `59 writing_judgment_framework.md` and `173 writing_quality_check.md`. Holds.
- Line 13. `grep -n 'rebuild: writing' docs/academic-coverage.md` printed lines 76, 100 and 101. `sed -n '14p'` holds the quoted sentences. Holds.
- Line 14. `ls docs/dev` printed `blind-comparison.md building.md change-standard.md scripts.md skill-layout.md`. `grep -n "rapidly evolving\|matter of fact" skills/repo-setup/templates/docs/dev/prose-standard.md` printed nothing and exited 1. Holds.
- Line 15. `grep -n '^- \*\*finding\*\*'` printed `skills/repo-setup/templates/plan-terms.md:41` and `docs/glossary.md:46`, both in the reviewer-defect sense. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0. Holds.
- Line 16. `grep -n version skills/repo-setup/SKILL.md` printed `5:  version: "5.1.0"`. Holds.
- Line 17. The README table runs from line 11 (header) to line 25, and `README.md:103` is the `for skill in ...` line. `docs/academic-coverage.md:34` is `| writing | 3 |`. `docs/dev/scripts.md` has the three headings. Holds.
- Line 18. `unzip -l` lists `word/document.xml`, `word/footnotes.xml`, `word/endnotes.xml`, `word/header1.xml` and `word/footer1.xml`. The tag counts printed 63 for `<w:p `, 1 for `<w:tbl>`, 1 for `<w:br`, 1 for `<w:tab/>`, and 0 for each of `<w:ins `, `<w:del `, `<w:txbxContent` and `<w:sdt>`. The stated counts hold, but the premise leaves out facts that bear on item 4:
  - `<w:tab ` matched 5 more elements, `<w:tab w:val="left" w:pos="284"/>`, which are tab-stop definitions in 5 `<w:tabs>` blocks.
  - The one `<w:br` is `<w:br w:type="page"/>`, and it sits in a paragraph with no other text (paragraph 32 by the probe below).
  - `footnotes.xml` and `endnotes.xml` each hold only the separator and continuation-separator notes, with no `w:t`.
  - The header and the footer hold text, and the footer holds 2 `<w:txbxContent`.
- Lines 19 to 21. The ADR quotes match the Decision sections of `docs/adr/0001-*.md`, `0002-*.md` and `0003-*.md`. Holds.
- Line 22. The state file's `verify:` holds the six commands of `docs/dev/building.md` (lines 6 to 11), with the filters. Holds.

Findings: (3a) The premise on line 18 holds as written, but it leaves out the 5 tab-stop `w:tab` elements, that the `w:br` is a page break alone in an empty paragraph, that the notes hold only separators, and that the header and footer hold text. Item 4 and Decision 1 depend on each of these (see 6).

## 4. Cases and checks

Each case read against the change standard and the standards pages:

- `ls skills/writing`: consistent.
- The run on the grant: it asks for "the first 20 lines and the line count", but the step line says "the run quoted". My probe found 55 paragraphs with non-whitespace text, so 20 lines is less than the step's check asks. The clause "footnote and endnote lines ... if they hold any text" is never exercised on this file, because its notes hold only separators.
- No argument, `README.md`, a missing path: consistent.
- The `textutil` case: inconsistent in three ways.
  - A comment cannot be added by editing `word/document.xml` alone. Its text lives in `word/comments.xml`, with a relationship and a content-type entry. And "the comment absent" is met by any script that never opens `comments.xml`, whatever it does.
  - The scratch files it makes lie outside "Paths this step writes", while the brief says "The step writes these paths and nothing else".
  - Its fallback, "If `textutil` cannot make the input, the report says so", lets the tracked-change behaviour go unrun. The change standard, rule 12, says nothing inside the brief is left undone.
  - A real file covers all of this. `research-hub/funding/2025-fwo-project-fl4phm/background/Project proposal unremunerated or clinical PhD - HexC V 2-2-25.docx` holds 9 `<w:ins `, 5 `<w:del `, a `comments.xml`, 4 `<w:hyperlink`, 27 `<w:sdt>` and footnote text (survey command in 6). The glossary **case** ("a real instance from the tree") and the change standard ("a case only when that case has happened") favour it.
- Section C read; the term read with `sync_rules.py`: consistent.
- `SKILL.md` read against the layout: consistent.
- The records case: inconsistent. It checks that "every heading of the source [is] accounted for", but item 7 asks for every part under its heading. The change standard, rule 18, asks for one rule per row with the line of the named place quoted.
- Decision 1 asks for "the paragraph with the `w:br`" to be quoted "with its output line". That paragraph's only content is the page break, which item 4 turns into one space. Item 4 also says a paragraph is printed only when its text is not empty, and Decision 1's own reason is that an empty paragraph gives "a place with nothing to quote". So the paragraph should have no output line, and the brief contradicts itself.
- The brief does not say whether `docx_paragraphs.py` gets a test. The test bullet of the change standard, "Scripts compute facts; judgment is read", decides that. No test path is in "Paths this step writes", and no `scripts.md` "Test scripts" row is asked for.
- Item 4's head-comment requirement ("what it computes, its output and its exit codes") is narrower than rule 14, which asks for every input read, every error printed and every exit status. The inputs are the three parts; the errors are the usage line and the `error:` lines.
- Places the step does not change, which the cases ask the builder to quote: the grant, in the second case and in Decision 1. It is read-only input, which is legitimate. The `textutil` scratch files.

Findings: 4a (comment cannot be added that way, and its check is vacuous), 4b (scratch files outside the paths), 4c (the `textutil` escape), 4d (records case checks headings only), 4e (20 lines against "the run quoted"), 4f (whether there is a test is not decided), 4g (head comment narrower than rule 14), and 4h (Decision 1 against the empty-paragraph rule), each as stated above.

## 5. The question

The goal step 1 delivers: the `writing` folder with `references/` holding the academic rules the prose standard lacks and the four registers, `SKILL.md` stating the review, the prose standard read where it is, the two openers, and the **finding** sense.

- `ls skills/writing`: yes, it could pass without the goal. It shows the files exist and says nothing about what they hold.
- The run on the grant: yes. The file has no footnote text, no tracked change, no move, no hyperlink and no text box, so the case passes with those paths broken. Twenty quoted lines do not show the whole run.
- The three error cases: no, for the behaviour each one names.
- The `textutil` case: yes, through its fallback and through the vacuous comment check.
- Section C read: no.
- Term read and `sync_rules.py`: no for the term. `sync_rules.py` exiting 0 proves only that the block equals the template.
- `SKILL.md` against the layout: yes. The layout does not show that the Steps and the agent's prompt carry D6, D16, D29 and D30. Only the refuter's verdict per item reads that.
- The records case: yes. It checks headings, so a bullet lost under a heading passes. Examples: the direct-quote em-dash exception, and "Prefer short sentences for complex ideas".
- The check on step 1's line: yes, for the review part of the goal. It reads the layout, but nothing on the line reads the skill's Steps and prompt against D6, D16, D29 and D30. The plan answers "No", which holds only for records, layout, openers, term and the script run.
- Item 1: yes, as for the layout case.
- Item 2: yes. No case reads `rules.md` against the prose standard for a contradicting rule. ADR 0002 forbids one, and only the heading-level records case touches the page.
- Item 3: yes. No case reads `registers.md` against D18 and D22.
- Item 4: yes, as for the run on the grant.
- Item 5: no.
- Item 6: no for the term. Yes for the version bump: no check names `5.2.0`.
- Item 7: yes, at heading level.
- Item 8: yes. `check_coverage.py` checks marks and listing, not that a reason names the file.
- Item 9: yes. No case reads `README.md` or `scripts.md`.

Findings: (5a) The records case should check every part, one rule per row with the line quoted. (5b) Add a case that reads `SKILL.md`'s Steps and agent prompt against D6, D16, D29 and D30. (5c) Add a case that reads `rules.md` against the prose standard for a contradicting rule, and `registers.md` against D18 and D22. (5d) Add real `.docx` cases for footnotes, tracked changes, moves, hyperlinks, content controls and text boxes (see 6). (5e) Add cases that read coverage lines 76, 100 and 101, the README row and `for` line, the `scripts.md` row and `5.2.0`.

## 6. Implied inputs

Commands:

- The grant's body, probed with `python3 -I -c` over `word/document.xml` (ElementTree, `iter(w:p)`). It printed: `paragraphs 63`; `tab char p 3 'Duration of the project (in months):12'`; `tabstops in p 7 / 8 / 10 / 11` with text and `tabstops in p 9 text empty`; `br p 32 ''`; `empty 8 ws-only 0`; and table cells at paragraphs 15 to 29 (cell 28 empty).
- A survey of research-hub's `.docx` files, `find ... -name '*.docx' -not -path './.agents/worktrees/*'`, with per-file `grep -o` counts. 97 files. It printed `moveFrom 31 noBreakHyphen 0 sym 16 AlternateContent 3 cr 0 files 97`. The full listing gives footnote text in 4 entries, text boxes in 3, `w:ins` in 82, `comments.xml` in 108, `w:hyperlink` in 37, `w:sdt` in 32 and `w:instrText` in 28; that listing also counted worktree copies.
- A probe over the 97 files printed `w:t with newline 0`, `w:t with tab char 0`, `w:p holding a w:p 5`, and one `BadZipFile` (`tools/oculus/node_modules/seti-ui/file-types/Word.docx`).
- `.../main_MVH2_AF2.docx`: the text inside its `<w:moveFrom ` is a `<w:t>`, not a `<w:delText>`.
- `First page of thesis_070519.docx`: 12 `<mc:AlternateContent`, 12 `<mc:Fallback`, 12 `<v:textbox` and 24 `<w:txbxContent`.
- `veni2026-preproposal-FILLED.docx`: `footnotes.xml` holds `<w:footnote w:id="1">` with text.

Inputs the brief states: no argument or more than one; a missing file; a file that is not a zip (this has happened); no `word/document.xml`; footnotes and endnotes present or absent; table cells; `w:ins`, `w:delText`, `w:instrText` and comments; a `w:tab` or `w:br` becoming a space; text boxes; empty and separator paragraphs; UTF-8 output.

Missing ones that have happened or would cost something, each with its expected result:

1. A tab-stop definition, `w:pPr/w:tabs/w:tab`. This has happened: the grant's paragraphs 7 to 11, and paragraph 9 holds nothing else. A rule that turns every `w:tab` element into a space prints paragraph 9 as one space and pads 7, 8, 10 and 11. Expected: a tab stop adds nothing, paragraph 9 is not printed, and only the run-level `w:tab` of paragraph 3 becomes a space.
2. Text that is only spaces after the `w:tab` and `w:br` conversion. This has happened: paragraph 32, the page break alone. Expected: treated as empty and not printed. The brief should say so, and Decision 1's `w:br` case changes with it.
3. What `<n>` counts. "numbered from 1 across the parts" does not say whether `<n>` counts every `w:p` or only printed paragraphs. On the grant the first table cell is paragraph 15 under the first reading and printed line 10 under the second. A finding's place and step 2's expected places rest on this. Expected: the brief states which.
4. A tracked move. This has happened in 31 of 97 files, and `w:moveFrom` holds `w:t`. Expected: `w:moveFrom` text dropped as a deletion, `w:moveTo` kept as an insertion. Otherwise moved text prints twice.
5. A text box written twice, as `mc:Choice` and `mc:Fallback`. This has happened in the thesis title page, with 24 `w:txbxContent` for 12 boxes. The brief states the outcome ("printed once") but has no case. Expected: each box's paragraphs printed once, the `mc:Fallback` copy skipped, on that file.
6. Run containers: `w:hyperlink` (37 files), `w:sdt` (32), and field results beside `w:instrText` (28). Expected: their `w:t` text kept. There is no case, and code that reads only `w:r/w:t` children of a `w:p` drops it.
7. A footnote with text. This has happened in `veni2026-preproposal-FILLED.docx` and in the HexC proposal. Expected: `<n> [word/footnotes.xml]: <text>`, numbered on from the body. No case exercises it, because the grant's notes hold only separators.
8. Header and footer parts. This has happened: the grant's header and footer hold text, and the footer holds text boxes. The brief never says the script leaves them out. Expected: a stated decision, leave them out or read them.
9. Rule 15 places. The path argument reaches `zipfile` and the error line; the existing error cases cover it. A paragraph's text reaches stdout; no `w:t` holding a newline was found in 97 files. Expected: one line per paragraph. No further case is needed.

Findings: missing inputs 1 to 8, each with its expected result above.

## 7. ADRs

`ls docs/adr` lists 0001 to 0012. Every record is `Status: proposed`, and none is superseded.

- ADR 0001 is touched (item 1, "What it reads"). The step is under: "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`. `skills/writing/` holds no copy of it." Named on the tree. No contradiction. The brief leaves unstated which listed page is the prose standard, and how the installed skill finds the `repo-setup` template (see 9).
- ADR 0002 is touched (items 2, 3 and 7). The step is under: "The prose standard holds for every text the writing skills write or review. ... No rule that contradicts the prose standard is carried." Named. Parts that conflict with it:
  - Item 2's flagged-term alternatives include words section A flags itself (see 9).
  - Item 7 does not exclude the direct-quote em-dash exception, which contradicts section 0.
  - Item 7 does not exclude "Prefer short sentences for complex ideas", which contradicts section E's "unless the mechanism needs more".
- ADR 0003 is touched (item 1). The step is under: "`/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort`, which reads the whole draft and reports only breaks of a named rule. The session shows its report to the user and changes nothing." Named. No contradiction. The D31 refinement of its Context is already on the tree (ADR 0003:7: "with no proposed replacement").
- ADR 0006 is touched only through its Consequences: "A skill added later that starts an agent records its id and role." Its Decision ("Every agent a plan skill starts is recorded in the ledger ...") governs plan skills, and `writing` is not one. "What is on the tree" does not name it. The brief's "writing no file" leaves a run outside a plan with no record. Step 3's runs are made by the orchestrator, which records them.
- ADRs 0004, 0005, 0007, 0008, 0009, 0010, 0011 and 0012: not touched.

Findings: (7a) Item 2 and item 7 leave room to carry rules ADR 0002 forbids, as listed above. (7b) ADR 0006's Consequences sentence bears on `/writing` starting an agent and is not named; the session decides whether it binds `writing`.

## 8. Dictated text

- `grep -n "rapidly evolving"` finds line 55: the openers "In today's rapidly evolving..." and "As a matter of fact...". D20 (the user) fixes the words. Holds: three dots and straight quotes meet prose standard B. Their trailing "..." differs from the form of line 39's other entries, which no rule forbids.
- `grep -n 'a passage of a draft that breaks a named rule'` finds line 56, the **finding** sense. Holds. The sentence is about 38 words against prose standard E's "under roughly 20 words unless the mechanism needs more"; the list of the finding's parts needs that length, as the existing entry's does.
- `grep -n 'version: "1.0.0"\|`5.2.0`'` finds lines 28 and 56. Holds: `docs/dev/skill-layout.md`, Frontmatter, the minor part.
- `grep -n '`<n>: <text>`\|error: <file>: <reason>'` finds lines 53 and 54, the output and error formats. Code lines; hold.
- `grep -n '/writing <project> <file>'` finds line 29, the Quick start. Holds.
- `grep -n 'paragraph 70'` finds line 38, the place formats `paragraph <n>` and `paragraph 70 [word/footnotes.xml]`. Hold.
- Line 35, the command `LC_ALL=C grep -n '[^ -~]' <file>`, with words fixed by D1. Holds.
- `grep -n 'it is important to note that'` finds line 44, the D13 words. Holds.
- `grep -n 'robust estimator'` finds line 46, the D20 exceptions. Holds.
- `grep -n 'contributions and findings'` finds line 48, the D18 voice text: "the authors' decisions, contributions and findings take "we"". D18 (the user) fixes the words. It breaks `docs/dev/skill-layout.md`, "Writing for an agent": "A term that `docs/glossary.md` defines is used only in a sense it defines there." **finding** is a glossary term, and item 6 gives it a `/writing` sense in this same skill, while here "findings" means research results. The so-what row "Lead with the finding, not the statistical test", which D4 carries into `rules.md`, has the same problem, though the brief does not dictate its words. If this parenthetical counts as dictated text, the session cannot close this finding by a change to the brief: it is a ruling's words that break a rule, so it is the spec skill's stop "A brief check finding the brief cannot absorb". If it counts as a requirement the builder words, the builder can write "results".
- `grep -n 'precision of measurement'` finds line 48, the D22 line. Holds.
- `grep -n 'leaves out the Humanities'` finds line 58, row 76's reason: "the writing base keeps the registers of Engineering and CS, Medicine and Health, the Sciences and the Social Sciences, and leaves out the Humanities, Education and the zh-TW conventions". This breaks `docs/academic-coverage.md`'s opening, which asks for "a drop with its reason": the words give no reason for the drop. The page itself requires it, so the brief can add the reason. It also needs a check against prose standard E's coverage-cell exception of about 35 words, once the file name is added.

Findings: (8a) The D18 voice line, a ruling's words, breaks the skill layout's term rule; this is the spec skill's stop "A brief check finding the brief cannot absorb" if read as dictated. (8b) Row 76's dictated reason lacks the reason for the drop the coverage page asks for.

## 9. Rulings and scope

"What to build" against the rulings:

- Item 2 carries the "better alternatives" column "as what the rule asks for in place of a flagged term". Item 1 says a finding gives "the rule it breaks ... with what that rule asks for". Together, a finding on "leverage" would list "use, employ, utilize, apply", which is in effect a proposed replacement. D30 says the alternatives stay "no longer as replacements the findings propose". The brief should say how a finding states that rule's ask without listing the alternatives.
- Some alternatives are themselves flagged in prose standard section A: "landscape" under tapestry, "comprehensive" under holistic. "significant" under pivotal is section A's vague qualifier ("significantly"). Under ADR 0002 these are not carried, and the brief does not say so.
- D21 ("one idea per sentence"): the source says "One idea per sentence (or clearly connected ideas)". The brief drops the qualifier without saying so. Change standard rule 17 then requires a stop. The brief should state whether the qualifier is dropped.
- D21 ("for manuscripts and grants"): the brief does not say how the agent tells a manuscript or grant from another draft.
- Decision 1 says "D16 names the body's paragraphs". D16 says "the text of each paragraph", with no restriction to the body.
- No ruling of plan.md that bears on step 1 is left out. D31 is already on the tree. D26, which D25 cites for the gate, is absent from Rulings, but it bears on step 3, not step 1.

What the brief asks for that no ruling and no standard asks for:

- Decision 2's tie order. Disclosed in the brief.
- The agent's single check that each quoted passage stands at its place.
- "no verdict on how or by whom the text was written".
- The text-box rule. D16 is silent on it, though text boxes have happened in research-hub.
- Footnotes and endnotes. Disclosed as Decision 1.
- `Use instead` naming `paper` and `grant`, which are not on the tree (`ls skills`; roadmap entries 5 and 8). Only ADR 0003 and D30 name them.

Each is defensible. The session judges each.

Inputs `SKILL.md` needs that the brief does not state, which the gate's real run will meet:

- Which page of `standards` is the prose standard. Ordo's `standards` lists three pages (`.agents/plan.yaml:13`).
- How the installed skill finds the `repo-setup` skill's template. research-hub's `.agents/plan.yaml` has `standards: []` and no `docs/dev/`, so D28's run falls to the third place ADR 0001 names.
- What `/writing <file>` does when `.agents/plan.yaml` is in the `projects:` form. research-hub's is (`grep -n '^  [a-z]'` printed `4:  oculus:`).
- Coverage rows 100 and 101. The page's opening asks a file split across skills to name "a destination, or a drop with its reason, for every part". Row 100 splits (`rebuttal`) and does not name the Humanities row or the D23 sentence. Row 101's "over three dashes" is false of the writing base. Rows 76 and 100 each go to two files of `skills/writing/`, while item 8 says "the file".

Item 7's list against the three source files. Each part below is under its source heading and is not named by item 2, item 3 or item 7:

- `academic_writing_style.md`:
  - "Used by `draft_writer_agent` and `peer_reviewer_agent`."
  - Conciseness, "Prefer short sentences for complex ideas". It contradicts prose standard E.
  - The qualifier "(or clearly connected ideas)".
  - The TEEL example paragraph. Its [L] sentence, "which the following section addresses", contradicts section C.
- `writing_judgment_framework.md`:
  - The clarity test's other two outcomes ("keep it short", "deserves the most careful writing").
  - Its judgment heuristic, "Most AI-generated academic text fails the clarity test ...", a verdict on who wrote the text, which item 1 excludes.
  - The Reader's Journey's "(Section structure, signposting)", which bears on section C and Decision 3.
  - Its closing sentence.
  - The "Typical Voice" column, replaced by D18. Item 7 names only the third-person rule as replaced by D18.
- `writing_quality_check.md`:
  - Purpose and the design boundary.
  - The "Why it's flagged" column.
  - The em-dash "recommend 0-1", its Fix, and its "Exception: Direct quotes from sources retain their original punctuation", which contradicts section 0.
  - The throat-clearing "What to do" column. Its replace instructions contradict section C's "Delete the opener rather than rewriting it".
  - The roadmap-sentence exception. Decision 3 names it; item 7 does not.
  - Burstiness "How to Fix".
  - "During Drafting (Preferred)" and "During Final Review (Fallback)".

The parts item 7 does name (D11, D19, D23, the dash limit, the punctuation rules, the openers, meta-commentary, structure, burstiness, targets, scoring, the matrix) do stand in the sources.

Findings: 9a (the alternatives against D30), 9b (flagged alternatives), 9c (the qualifier dropped), 9d (manuscript or grant), 9e (Decision 1 misstates D16), 9f (additions for the session to judge), 9g (prose-standard lookup and the `projects:` form), 9h (rows 100 and 101, and two files per row), and 9i (item 7's list is missing the parts above), each as stated.

## Declined to judge

- Whether `textutil -convert docx` turns an HTML table into a `w:tbl`, and whether a hand-edited `document.xml` re-zipped with `zip` opens. Testing this needs files written, and this check writes none.
- Whether Python prints UTF-8 to a pipe in the review agent's shell. That depends on the user's locale, which I did not read.
- Whether Decision 2's tie order, the agent's quote check and the `Use instead` rows to `paper` and `grant` are the better design. That is the orchestrator's or the user's call.
- Whether ADR 0006's Consequences sentence binds `writing`. That is a reading of the record for the session.
- Whether `\input` and `\include` cover the user's manuscripts (`\subfile`, `\import`). D16 rules on the two commands, and I did not survey research-hub's `.tex` files.
- Every use of "finding" across the skills' text. I grepped the names the step changes and read the two glossary entries, not each skill's use of the word.

## Closed

- 1a, 1b, 1d: item 9 of "What to build" now changes the five agent definitions, the four configuration comments and the **effort agent** and **reviewer** entries (item 6), with `skills/plan/SKILL.md` at `5.0.1`; the paths and the character-set check name the files, and the check-config and pin tests are added to the checks.
- 1c: item 6 adds `writing` to `skills/repo-setup/templates/docs/glossary.md` line 3.
- 1e, 9h: item 8 now amends lines 100 and 101 too, and lines 76 and 100 name both reference pages.
- 1f: item 5 puts the openers inside the existing list, adding no line.
- 3a, 6.1 to 6.8: the premises name the page break, the tab stops, the empty notes, the header and footer, and four more real files; item 4 states run-level tabs only, spaces-only paragraphs not printed, `<n>` counting printed paragraphs, `w:moveFrom` dropped and `w:moveTo` kept, `mc:Fallback` dropped, `w:hyperlink`, `w:sdt` and `w:smartTag` text kept, headers and footers left out (Decision 1).
- 4a, 4b, 4c, 5d: the `textutil` case is replaced by runs on the four real files; the one scratch file left, a cut-short copy for the malformed-XML case, is named as an input outside the step.
- 4d, 5a, 9i: item 7 asks for one row per rule with both lines quoted, and lists the parts the check found missing, each with its place or its drop.
- 4e: the NWO XS case quotes the whole output.
- 4f: item 4 states that the script gets no test, with the change standard's rule quoted.
- 4g: item 4's head comment lists every input, error and exit status.
- 4h, 9e: Decision 1 is rewritten: the page-break paragraph is absent, and D16 is quoted as it reads.
- 5b, 5c, 5e: cases added that read `SKILL.md` against D1, D6, D16, D29 and D30, `rules.md` against the prose standard, `registers.md` against D11, D18 and D22, the coverage lines, the lists, the agents, the comments and the versions.
- 7a, 9b: item 2 leaves out alternatives the prose standard's section A flags or calls vague; item 7 names the em-dash quote exception and "Prefer short sentences" as held by sections 0 and E.
- 7b: "What is on the tree" names ADR 0006 and why its Decision does not govern `/writing`.
- 8a: the D18 line is a requirement the builder words with "results" for the research sense, keeping D18's meaning; item 2 adds the glossary-sense rule for **finding**. Not a stop: the ruling's meaning is kept and only the word the glossary defines is changed.
- 8b: item 8's line 76 reason says entry 3's rulings leave the three registers out.
- 9a: item 1's prompt says a finding on a flagged term asks for the most precise word and lists no alternative; item 2 holds the alternatives as a reference for `paper` or `grant` only.
- 9c: item 2 keeps the source's qualifier "(or clearly connected ideas)", as rule 17 asks.
- 9d: item 1's prompt says the agent reads from the draft's text whether it is a manuscript or a grant.
- 9f: kept as written; each is named in the brief.
- 9g: item 1 names the prose-standard page by file name, the `repo-setup` folder beside the skill's folder, and the `projects:` form's project argument.
- New dictated text after the check, held line by line against the prose standard: "lead with the result, not the statistical test" (item 2) and "the authors' decisions, contributions and results take "we"" (item 3) hold.

Usage: a0ba76e39b441a3bf, claude-opus-5-5, 227907 tokens, 49 tool uses, 14m 23s.
