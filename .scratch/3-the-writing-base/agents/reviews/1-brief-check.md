# Step 1 brief check (on main at fce2e98)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

Main's head: `git log --oneline -1` printed `fce2e98 Move the ledger of plan 2.K to the archive`. `git status --short` printed ` M .scratch/3-the-writing-base/orchestrator-state.md` and `?? .scratch/3-the-writing-base/agents/briefs/1.md`. Findings are numbered F1 to F15 across the sections, so the session can close each one by number.

## 1. Names

- **`skills/writing/`, `writing` and `/writing`.** I ran `git grep -n 'skills/writing' -- ':!.scratch'`, `git grep -n '/writing\b' -- ':!.scratch'` and ``git grep -n '`writing`' -- ':!.scratch'``. They hit `docs/adr/0001-...md:11,15,16,20`, `docs/adr/0003-...md:7,11,15`, `docs/roadmap.md:24,25,26,45,66,200`, `docs/academic-coverage.md:170,184,191`, and `skills/repo-setup/templates/docs/dev/prose-standard.md:5` (the unrelated name "vercel-labs/writing-guidelines"). The change makes none of them false:
  - The ADRs and roadmap entries 3, 5 and 8 describe the skill this step builds.
  - `roadmap.md:200` records that the old `/writing` was removed in closed entry 2.C.
  - Coverage rows 184 and 191 say "the writing check goes to `writing` (entry 3)", which stays true.
  - Row 170, a `rebuild: paper` row, says the six AI-writing indicators "suit the `writing` skill's style rules". That remark stays true as written.
- **`docx_paragraphs.py`.** `git grep -n docx_paragraphs -- ':!.scratch'` printed no hit.
- **The section C openers.** `git grep -n -F 'At the end of the day' -- ':!.scratch'` printed only `skills/repo-setup/templates/docs/dev/prose-standard.md:39`. `git grep -n -i 'throat-clearing' -- ':!.scratch'` printed `prose-standard.md:37`, `docs/academic-coverage.md:101` and `docs/roadmap.md:24`. The change makes none of them false.
- **The text of coverage rows 76, 100 and 101.** `git grep -n -e 'paragraph-removal clarity' -e 'not zh-TW conventions' -e 'names the dash and anti-pattern' -- ':!.scratch'` hit only the three rows, which are in the paths.
  - Row 101 already has a false sentence. Its reason ends "Roadmap entry 3 names the dash and anti-pattern checks." `sed -n 21,27p docs/roadmap.md | grep -i -e 'dash' -e 'anti-pattern'; echo "exit $?"` printed `exit 1`: roadmap entry 3's Goal, Gate and Waits on lines name neither.
  - Item 7 says each reason "keeps every destination it names now". So the builder is told to keep a false sentence in a row the step rewrites. The coverage page allows it to go: "A rewrite of a reason keeps every destination the old reason named, unless it names the part's new one."
- **The term finding.** `skills/repo-setup/templates/plan-terms.md:41` and `docs/glossary.md:46` are in the paths. `git grep -n 'session-retro' -- ':!.scratch'` also hit `skills/repo-setup/templates/docs/glossary.md:3`, which is not in the paths:
  - It reads: "The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below".
  - After item 6, `writing` uses **finding** in a sense of its own that stands in the block, and this list does not name it.
  - Verify 5's grep covers only `README.md` and `docs/dev/scripts.md`, so it does not find this list.
- **The effort agents that `/writing` launches.** `grep -n 'never chosen\|launch' agents/*.md` printed, for each of `agents/ordo-low.md`, `ordo-medium.md`, `ordo-high.md`, `ordo-xhigh.md` and `ordo-max.md`:
  - `:3` `description: Ordo's agent at <level> effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.`
  - `:6` `You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. ...`
  - `writing` is not a plan skill: the glossary entry **plan skills** lists `plan`, `spec`, `refute`, `land`, `ordo-help` and `plan-orchestration`. A draft review is none of the three roles. So item 1 makes "it is never chosen for other work" false, and every `/writing` agent starts under a system prompt that tells it it is a builder, a reviewer or a brief-check agent.
  - Two more enumerations leave `writing` out: `README.md:76` ("The plan skills launch their agents through five agent definitions") and `skills/repo-setup/templates/plan-terms.md:39` (**effort agent**: "a builder is launched as ..., a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of `grill` as `ordo-<reviewer_effort>`").
  - None of these files is in the paths.
  - The agent files already leave out the diagnosis agent and the lookup agents of `grill`. That is older drift; this step adds one more role.
- **The keys `reviewer`, `reviewer_effort` and `standards`, which gain `/writing` as a reader.** `git grep -n -i 'lookups of /grill\|the brief check, the diagnosis agent' -- ':!.scratch' ':!docs/roadmap.md'` and `grep -n -E '^(reviewer|reviewer_effort|standards)' skills/plan/templates/plan.yaml` found these comments, each listing who runs on or reads the key:
  - `.agents/plan.yaml:10`
  - `skills/plan/templates/plan.yaml:12` (`reviewer`)
  - `skills/plan/templates/plan.yaml:14` (`standards`: "Files every brief tells the builder to read in full, and the reviewer holds a diff to.")
  - `skills/plan/templates/plan.yaml:27` (`reviewer_effort`: "The effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at")
  - `skills/plan/templates/orchestrator-state.md:14` and `:26`
  - `skills/repo-setup/templates/plan-terms.md:99` (**reviewer**: "The brief-check agent, the diagnosis agent and the lookup agents of `grill` run on `reviewer:`") and `:117` (**standards**)
  - Each list is left incomplete once `/writing` reads the key. None is in the paths. A change to `.agents/plan.yaml` is the user's written rules (kind 3 under self-rule), and a change to `plan`'s templates raises `plan`'s version.
- **`repo-setup`'s version 5.0.0.** `git grep -n -E '5\.0\.0' -- ':!.scratch'` printed `skills/repo-setup/SKILL.md:5`, which is in the paths, and `docs/roadmap.md:207` (`plan-orchestration` 5.0.0, unrelated). Neither is made false.
- **The README's skill lists.** `git grep -n 'session-retro' -- ':!.scratch'` hit `README.md:7,25,51,59,103`, `docs/figures/gen_figures.py:6,421,527` and `docs/figures/pipeline.svg:1,2,129`.
  - Item 8 covers lines 7, 11 to 25 and 103.
  - Line 51 is the order-of-use block, "shortened from what `/ordo-help` prints". Line 59 and the figures show the pipeline of one roadmap entry.
  - `/writing` is not in that sequence, so none of these is made false. Verify 5 lets the report say why a list does not name it.

Findings:
- F1. Coverage row 101's sentence "Roadmap entry 3 names the dash and anti-pattern checks." is false on the tree (the grep above exits 1). Item 7's "keeps every destination it names now" makes the builder keep it. Item 7 should say the sentence is replaced by the new destinations it already lists.
- F2. `skills/repo-setup/templates/docs/glossary.md:3` lists the skills whose terms stand in the plan-terms block, and the change leaves `writing` out of it. The file is not in "Paths this step writes".
- F3. The change makes `agents/ordo-*.md:3` ("it is never chosen for other work") false in five files. It leaves `agents/ordo-*.md:6`, `README.md:76` and **effort agent** (`plan-terms.md:39`) as lists without `writing`. None is in the paths.
- F4. The comments and glossary entries that list who uses `reviewer`, `reviewer_effort` and `standards` leave out `/writing` once it reads them: `.agents/plan.yaml:10`, `skills/plan/templates/plan.yaml:12,14,27`, `skills/plan/templates/orchestrator-state.md:14,26`, and `plan-terms.md:99,117`. None is in the paths. The rules file's rule 14 requires the change to carry to every place that names it, or the report to say why not.

## 2. The step line

- `skills/writing/` with `SKILL.md`: item 1.
  - "one fresh agent that edits nothing, on `reviewer` at `reviewer_effort`": item 1, "Steps" and "The agent's brief".
  - "reads the whole draft, `.tex` with its `\input` and `\include` files, `.md`, `.txt` and `.docx`": item 1, "What it reads".
  - "against the prose standard read where the repository keeps it and the rules of `references/`, the prose standard holding where they differ": item 1, "What it reads" (ADR 0001), and "The agent's brief" (ADR 0002).
  - "reports findings grouped by rule, the most consequential first, each with its place, the quoted passage and a proposed replacement, applying nothing": item 1, "The agent's brief" and "Steps".
- "`references/` with the academic rules and the registers ... as the rulings say": items 2 and 3.
- "`templates/docx_paragraphs.py` (D16) with what the change standard's test rule calls for": item 4, Decision 2, and cases C9 to C15.
- "section C ... with the two openers": item 5.
- "the term **finding** ... synced into `docs/glossary.md`": item 6.
- "rows 76, 100 and 101 ... naming the file of `skills/writing/` that holds each, row 76's reason amended as D11 says": item 7.
- "`README.md`'s skill list": item 8.
- "the builder's report holds a record for each of the three rows": item 11.
- The check's commands (`sync_rules.py --only glossary`, `check_coverage.py`, and `checks.sh`, which runs at landing): "Verify before you report" 1 and 2, plus the brief's sentence that the plan's whole verify list runs once, at landing on main.
- Items 9 and 10 serve no part of the line. The rules file's "Scripts compute facts; judgment is read" requires item 9 (every script is listed on `docs/dev/scripts.md`), and `docs/dev/skill-layout.md`, "Frontmatter", requires item 10.

Findings: none.

## 3. Premises

- `skills/writing/` does not exist, and `skills/` holds 13 folders. `ls skills/writing` printed `ls: skills/writing: No such file or directory`, and `ls -d skills/*/ | wc -l` printed `13`. Matches.
- The three sources' line counts: `wc -l` printed `188 ... academic_writing_style.md`, `59 ... writing_judgment_framework.md` and `173 ... writing_quality_check.md`. Matches.
- Coverage rows 76, 100 and 101: `grep -n 'rebuild: writing' docs/academic-coverage.md` printed lines 76, 100 and 101.
  - Row 76 ends "Of six discipline registers they keep Engineering and CS, not zh-TW conventions."; row 100 ends "Its revision decision matrix belongs with `rebuttal`."; row 101 ends "Roadmap entry 3 names the dash and anti-pattern checks.".
  - `grep -n '| writing |'` printed `34:| writing | 3 |`.
  - "The marks" says what the brief says.
  - Matches (but see F1 on row 101's last sentence).
- `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"` printed `ok: docs/academic-coverage.md` and `exit 0`. Matches.
- The prose standard's location:
  - `ls docs/dev` printed `blind-comparison.md building.md change-standard.md scripts.md skill-layout.md`, so there is no `prose-standard.md`.
  - `.agents/plan.yaml:13` lists the template in `standards`.
  - Section C's heading is line 37. Line 39 lists ten openers.
  - Piping `sed -n 37,39p` of the prose standard into `grep -c` for the two new openers printed `0`.
  - Matches.
- The term **finding**:
  - `grep -n '^- \*\*finding\*\*'` printed `plan-terms.md:41` and `docs/glossary.md:46`.
  - `python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"` printed `ok: the plan-terms block equals the template` and `exit 0`.
  - The usage line `sync_rules.py:4` reads `Usage: sync_rules.py <repository root> [--write] [--only glossary]`.
  - Matches. One wording point: the brief calls this "the reviewer's sense only", but the entry holds three senses: the reviewer's, the brief check's, and a finding of a landing report or a diagnosis record named by a quoted ruling. The point the brief needs, that the entry has no `/writing` sense, holds.
- `README.md` lines 7, 11 to 25 and 103: `sed -n 1,30p README.md` and `grep -n 'for skill in' README.md` show the paragraph "Around that loop, ..." on line 7, the table on lines 11 to 25, and `103:    for skill in diagnose grill ... session-retro spec; do`. Those three hold, but the brief says the README "names the skills in three places", and the grep under Names also hits `README.md:51` (the order-of-use block) and `README.md:59` (the pipeline figure's alt text). The README names the skills in five places.
- `docs/dev/scripts.md`: `cat -n` shows `13 ## User scripts`, with that table on lines 15 to 22. Matches.
- The configuration forms:
  - `cat .agents/plan.yaml` shows the one-project form.
  - `cat /Users/axelfaes/workspace/research-hub/.agents/plan.yaml` shows `projects:` with one project, `oculus`, with `standards: []` and `reviewer: claude:opus`.
  - Matches.
- The grant `.docx` files: `unzip -p <file> word/document.xml | grep -o <tag> | wc -l` printed:
  - `veni2026-preproposal-FILLED.docx`: 23 `<w:tbl>`.
  - `Application-form-ENW-XS-26-3.docx`: 2 `w:instrText`.
  - `draft-proposal-axel-faes_MVH.docx`: 1 `w:commentReference`.
  - `ls -l` of `2024-fwo-postdoc-fbttr/~$nal_version.docx` shows 162 bytes, and `unzip -l` on it printed `End-of-central-directory signature not found. Either this file is not a zipfile ...`.
  - `find . -name '*.docx'` lists names with spaces, such as `Project proposal unremunerated or clinical PhD - HexC V 2-2-25.docx`.
  - Matches.
- The tests: `git ls-files | grep -E '\.test\.(sh|py)$|test_'` printed `skills/land/templates/land.test.sh`, `skills/ordo-init/templates/check_config.test.sh`, `skills/repo-setup/templates/sync_rules.test.sh` and `utils/pin.test.sh`. Matches `docs/dev/scripts.md`, "Test scripts".
- The verify list rewrite: `git diff .scratch/3-the-writing-base/orchestrator-state.md` shows the character-set command gaining `xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh |`. Matches.
- The quotes of ADRs 0001, 0002 and 0003: `cat docs/adr/0*.md` shows each Decision sentence as the brief quotes it, the "..." in the 0002 quote marking an omission. Matches.
- "No other ADR (0004 to 0012) governs a file, a name or a behaviour this step changes": read under section 7. Matches.

Findings:
- F5. The README names the skills in five places, not three. The two missing from the brief are `README.md:51` (the order-of-use block) and `README.md:59` (the pipeline figure's alt text, made by `docs/figures/gen_figures.py`). The premise should name them and say why `/writing` does not join them: they show a plan's sequence, which `/ordo-help` prints.

## 4. Cases and checks

- C1: consistent with the rules file and the standards. Its gap is under section 6, item 9.
- C2: consistent. "It's important to note that" is already in the prose standard's section C, so the deletion half of C2 also holds through the prose standard.
- C3: consistent with D18 and with the prose standard's section E, "Passive voice".
- C4: consistent. Its first clause, "the prose standard's zero holds", asks the builder to check `prose-standard.md`, "0. Hard rules", a place the step does not change. Its second clause reads `references/`, which the step does change.
- C5: consistent with the standards. Its weakness is under section 5.
- C6: rests on Decision 1, the public invocation shape `/writing <project> <file>`.
  - The `spec` skill's Steps 4 reads: "A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken. It is a stop ("Stops")." The rules file's rule 4 reserves such a shape to the user.
  - The brief takes it under "Decisions taken in this brief". `grep -n -i 'writing' .scratch/choices.md` printed nothing, so no choice of entry 3 is booked.
  - Under `self_rule: on` the orchestrator may close such a stop with its recommendation, unless it is one of the six kinds `references/self-rule.md` leaves open. It is then booked as a ruling ending "(self-rule)" and written to the choices file, not taken inside a brief.
- C7: consistent.
- C8: consistent.
- C9 to C13 and C15: consistent with the rules file. No test is kept, which Decision 2 grounds in "Scripts compute facts; judgment is read": a wrong paragraph text loses no work, breaks no installation and accepts no wrong configuration.
- C14:
  - Its expected result, "read as any other", names no output and no exit status.
  - Under the rules file's rule 15, the place where a supplied file name reaches a command is `SKILL.md`'s command line, which the session or agent types. The script's argument list is not that place.
  - Python receives `my grant.docx` as one argument whenever the caller quotes it, so C14 passes on any script. It never checks that `SKILL.md` quotes the path.
  - Real names on the user's tree have spaces (`Project proposal unremunerated or clinical PhD - HexC V 2-2-25.docx`) and a `$` (`~$nal_version.docx`). An unquoted `$nal_version` expands to nothing in `sh` and `zsh`.
- The checks of "Verify before you report": I ran 1 to 3 on the unchanged tree.
  - `python3 -c 'import glob,yaml; ...'` printed 13 counts. The highest is `1022 skills/roadmap/SKILL.md`.
  - `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
  - The character-set command, run in this session's `zsh`, printed `(eval):1: no matches found: skills/writing/references/*.md`, since the folder does not exist yet. Once the step writes the folder's two files the glob matches, so the check works as written after the change.

Findings:
- F6. C4's first clause asks the builder to check the prose standard's section 0, which the step does not change. C4 should check only that `references/` allows no dash and states no limit above zero.
- F7. C6 rests on Decision 1, a public invocation shape. The `spec` skill's Steps 4 makes that a stop, not a decision a brief takes. Under self-rule it is closed as a booked choice in `.scratch/choices.md`, which holds none for entry 3.
- F8. C14 checks the script's argument list, which cannot fail. The case belongs on `SKILL.md`'s command for `docx_paragraphs.py`: the path is passed quoted, and the expected result for `my grant.docx` and for a name holding `$` is the paragraphs printed as C9 prints them, exit 0.

## 5. The question

- C1: yes, in part. `SKILL.md` can say that `sections/intro.tex` is read and named at its own path, while still resolving a nested `\input` against the folder of the file that holds it. The real manuscript does exactly that (section 6, item 9).
- C2: no. It names the two replacements.
- C3: no. It names the replacement and the sentence that keeps the passive.
- C4: no, for `references/`.
- C5: yes.
  - `sed -n 24,25p .../writing_quality_check.md` shows the source's alternatives for "crucial": "essential, necessary, critical, vital". None is a word of the prose standard's section A.
  - So C5 passes whether or not item 2's filter ("an alternative that is itself a flagged or vague word of the prose standard's section A ... is left out") was applied.
  - Terms whose alternatives do hold section A words: "tapestry" (alternatives "network, interplay, system, landscape"; "landscape" is flagged) and "holistic" (alternatives "comprehensive, integrated, whole-system"; "comprehensive" is flagged).
- C6: no, as a reading of the refusals.
- C7: no.
- C8: no.
- C9 to C15, read together for the `.docx` part of the goal: yes. A script that drops the text inside `w:hyperlink` and inside run-level `w:sdt`, or that numbers several paragraphs of one table cell as one, passes all seven. Those constructs occur in the user's grant files (section 6).
  - Step 2 does not catch such a drop either. Its reviewers mark the findings the report gives, and dropped text produces no finding.
- The check on the step's line: yes, in part.
  - The record the refuter reads is per section (item 11), so a dropped bullet of a carried section passes. Two examples are `academic_writing_style.md:20`, "Acknowledge limitations and alternative interpretations", and `:15`, "Prefer short sentences for complex ideas".
  - No condition of the line runs `docx_paragraphs.py` on a real grant construct.
  - The plan's own answer for step 1 is "No".
- Item 1: no for the text read against the layout. The model stop is underspecified:
  - The brief names the stop "A model other than the configured one" and says what happens to the agent.
  - It does not say what the stop shows or what resumes it, two required columns of the Stops table (`docs/dev/skill-layout.md`, "Sections, in order").
  - The `refute` skill's row for that stop shows "The open item, booked in the open items". `/writing` runs outside a plan with no state file, so a builder that copies that row writes a stop that cannot happen.
- Item 2: yes, in part, through item 11's per-section record (see item 11 below).
- Item 3: yes. Item 3 lists the four D22 phrases in D22's order: Sciences; Social Sciences; Engineering and CS; Medicine and Health. It lists the registers in another order: Sciences; Engineering and CS; Medicine and Health; Social Sciences. Neither the brief nor D22 says which phrase goes with which register:
  - `grep -c 'Sciences: precision\|Engineering and CS: reproducibility'` printed `0` for both files.
  - The source table (`writing_judgment_framework.md`, "Discipline-Specific Voice") gives the pairing: Hard sciences, precision of measurement and method; Social sciences, transparency about limitations; Engineering, reproducibility of results; Medical, adherence to reporting guidelines.
  - A refuter reading against D22 alone cannot catch a page that pairs them wrongly.
- Item 4: yes. See C9 to C15.
- Item 5: no. The check reads line 39.
- Item 6: no. The check reads the term, and `sync_rules.py` computes that the two copies are equal.
- Item 7: yes, in part. `check_coverage.py` checks only that each file is listed once with a mark and a reason. Under item 7's wording the false row-101 sentence passes (F1).
- Item 8: no.
- Item 9: no.
- Item 10: no.
- Item 11: yes.
  - The rules file's rule 18 reads: "A map from old text to new places names one rule per row and a place that states it. ... each row covers one rule of the old text, and the place the row names states that rule whole, with its qualifiers; the report quotes, for each row, the line of the named place that states it."
  - Item 11 asks for "one row per section of the source".
  - Some source sections hold several rules: "### 3. Objectivity" holds three bullets, and "Common Style Errors" holds three tables. A per-section row marks such a section held while one of its rules is missing.
  - Item 11's list of rulings that leave a section out also has none for `writing_quality_check.md`'s "How to Use This Checklist", "During Drafting (Preferred)" and "During Final Review (Fallback)" (self-review while drafting, which `paper` will own), nor for `academic_writing_style.md:3`, "Used by `draft_writer_agent` and `peer_reviewer_agent`".

Findings:
- F9. C5 passes without item 2's filter. The case should use "tapestry" (expected: no proposed replacement is "landscape") or "holistic" (expected: none is "comprehensive").
- F10. C9 to C15 pass with a script that drops real grant text (section 6 lists the constructs).
- F11. Item 3 does not pair the four D22 phrases with their registers. It should state the pairing the source table gives: Sciences with precision of measurement and method; Social Sciences with transparency about limitations; Engineering and CS with reproducibility of results; Medicine and Health with adherence to reporting guidelines.
- F12. Item 11's per-section record breaks the rules file's rule 18 and lets a dropped rule pass. It should ask for one row per rule, each with the line of the named place that states it quoted, and name a ruling or a reason for the drafting-workflow sections.
- F13. Item 1 leaves the model stop's "What it shows" and "What resumes it" unstated for a skill that has no ledger. The brief should state them, for example: the configured model, the served model and the Claude Code version, shown in the message that ends the turn; resumed by `/writing` run again.

## 6. Implied inputs

This is a code step for `templates/docx_paragraphs.py`; items 9 to 11 below cover what `SKILL.md` must handle. The counts come from two scratch scripts run with `python3 -I` from the session's scratchpad over `/Users/axelfaes/workspace/research-hub/funding` (read only). One counted tags in each `word/document.xml`; the other parsed it with `xml.etree.ElementTree` and counted parents.

1. A run inside `w:hyperlink`.
   - Has happened. `w:t` inside `w:hyperlink`: `veni2026-preproposal-FILLED.docx` 2, `Statbel-Intego-koppeling-voorstel.docx` 10, `Project proposal ... HexC V 2-2-25.docx` 4, and `Information-form-ENW-XS-2026-2.docx` and `Information-form-ENW-XS-26-3-LS.docx` 1 each.
   - Missing from Cases.
   - Expected: a paragraph "See " + hyperlink run "the call" + "." prints `1: See the call.`.
2. A run-level content control (`w:sdt` inside `w:p`, its runs under `w:sdtContent`).
   - Has happened. Run-level `w:sdt`: the two Information forms 18 each (24 `w:t` inside each), HexC 27 (9 `w:t`), `draft-proposal-axel-faes_MVH.docx` 2 (1 `w:t`). Block-level `w:sdt`: 0 in every file.
   - Missing.
   - Expected: the control's text is kept in its paragraph, as in `1: Name: Jane`.
3. A table cell holding several paragraphs.
   - Has happened: 34 such cells in `veni2026-preproposal-FILLED.docx`, 1 in HexC.
   - C13 has one paragraph per cell.
   - Expected: a cell with "A1" and "A2" prints them as two numbered lines in order.
4. A table nested in a cell.
   - Has happened: 1 in `veni2026-preproposal-FILLED.docx`.
   - Missing.
   - Expected: the inner table's paragraphs are numbered in document order, where they stand in the outer cell.
5. `w:tab` and `w:br`.
   - Has happened. `<w:tab/>`: veni 123, HexC 40, `minutes-26-02.docx` 54. `<w:br`: veni 7.
   - Item 4 states the rule, but no case runs it.
   - Expected: "a", tab, "b" prints `1: a b`, and "a", break, "b" prints `1: a b`.
6. A field nested in another field's code part, and a field whose result runs over several paragraphs.
   - Has happened in `Statbel-Intego-koppeling-voorstel.docx`: 27 `ADDIN` field codes, nesting depth 2, and 26 paragraphs that end inside an open field. A stack walk printed three times "nested begin while outer is in code" with inner instruction ` ADDIN EN.CITE.DATA `.
   - C12 covers one flat field in one paragraph.
   - Expected: each paragraph prints only result text. Nothing of the inner field inside the outer code part is printed, and the paragraphs of a result that runs over several paragraphs each print their own text.
7. Text outside ASCII.
   - Has happened: 720 characters outside ASCII in veni's `document.xml`, 152 in `final_version.docx`.
   - Missing.
   - Expected: the text printed as the document has it, encoded as UTF-8, with exit 0. A crash or a changed character would make the agent quote a passage that is not in the draft.
8. A draft whose text holds an instruction addressed to the reviewer.
   - Not seen on the tree.
   - Its wrong answer costs a file edited or a command run. Under the rules file's rule 15 the draft's text reaches the agent's prompt, which is generated text.
   - Missing.
   - Expected: the agent treats the passage as text under review, reports it only if it breaks a named rule, and edits and runs nothing.
9. A nested `\input` in the `.tex` reading of `SKILL.md`.
   - Has happened, in the gate's manuscript. `grep -rn -E '\\(input|include|subfile|import|includeonly)\b' --include='*.tex' .` under `research-hub/projects/manuscripts/hccnet-revision/manuscript` printed, among others, `sections/appendix/a_implementation/1_conv_layer.tex:1:\input{figures/conv_block}`.
   - `ls figures/conv_block.tex sections/appendix/a_implementation/figures/conv_block.tex` found the first and printed `No such file or directory` for the second.
   - LaTeX resolves the path against the main file's folder. Resolved against the including file's folder, item 1's rule ("an `\input` or `\include` whose file does not exist ... refusals") refuses the real manuscript.
   - Missing.
   - Expected: `figures/conv_block.tex` is read as part of the document, and its findings are named at that path.
10. Which page of `standards` is the prose standard.
    - Has happened. Ordo's `standards` lists three pages (`.agents/plan.yaml:13`).
    - Item 1 says only "the prose standard where it is, as ADR 0001 says, in that order".
    - Missing. The wrong answer makes the agent hold the draft to `skill-layout.md` or the glossary.
    - Expected: the listed page whose file name is `prose-standard.md`; for Ordo, `skills/repo-setup/templates/docs/dev/prose-standard.md`.
11. The `repo-setup` template with no repository page.
    - Has happened. research-hub has `standards: []`, and `ls /Users/axelfaes/workspace/research-hub/docs/dev/prose-standard.md` printed `No such file or directory`.
    - The brief does not say where the template is found, nor what happens when it is not there. ADR 0001, Consequences: "`writing` needs the `repo-setup` skill installed beside it".
    - Expected: the file at `templates/docs/dev/prose-standard.md` in the `repo-setup` folder beside this skill's folder, the convention `skills/ordo-init/SKILL.md:81` uses ("in the `repo-setup` folder beside this skill's folder"). A missing file is a refusal that names the path.

Considered and not needed:
- A missing or unreadable `.docx` handed straight to the script: `SKILL.md` refuses a missing file first, and nothing on the tree shows the script reached that way.
- `w:fldSimple`, `w:moveFrom`, `w:txbxContent` and block-level `w:sdt`: 0 in every file.
- Footnotes: see section 7, ADR 0003.

Findings:
- F14. Inputs 1 to 7 are missing from Cases with the expected results above. Each except 7 has happened in the user's grant files.
- F15. Inputs 8 to 11 are missing from Cases and from item 1's text, with the expected results above. Inputs 9 to 11 have happened in the repositories `/writing` is run on: input 9 in the gate's manuscript, inputs 10 and 11 in the two configurations.

## 7. ADRs

`ls docs/adr` lists 0001 to 0012, `README.md` and `template.md`. Every record reads `Status: proposed`, and no record or later record says a part is superseded.

- **0001 touches the step** (item 1, "What it reads"), and the brief names it. The step is under: "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`." Nothing in the brief contradicts it. How a page of `standards` is known as the prose standard, and how the template is found, are F15 (inputs 10 and 11).
- **0002 touches the step** (items 2 and 3, and "The agent's brief"), and the brief names it. The step is under: "The prose standard holds for every text the writing skills write or review. ... No rule that contradicts the prose standard is carried." There is no contradiction. Item 2 carries D13's tables whole, including rows the prose standard's section C already states ("in order to", "it is important to note that"). The decision admits "the other rules the entry's rulings carry", and D13 is such a ruling.
- **0003 touches the step** (item 1), and the brief names it. The step is under: "`/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort`, which reads the whole draft and reports only breaks of a named rule. The session shows its report to the user and changes nothing."
  - Decision 3 of the brief ("Body paragraphs only ... headers, footers and footnotes are not read") narrows "reads the whole draft" for a `.docx`.
  - `unzip -l` of `veni2026-preproposal-FILLED.docx` lists `word/footnotes.xml`, `word/endnotes.xml` and `word/footer1.xml`. Its one footnote's text is "To avoid gender effects, please do not state your first name." HexC's footnote is a form instruction ("This proposal has to be completed if you have not obtained a scholarship ...").
  - So the text left out on the tree today is the funders' template text, not the user's prose. Still, the brief's Decision 3 cites D16 and does not state how it squares with the ADR's "reads the whole draft".
- **0004 to 0012 do not touch the step.** 0004 governs the endings of rulings; 0005 the choices file; 0006 agents started by a plan skill (`writing` is not one); 0007 `repair_reviewer`; 0008 and 0009 the cost script; 0010 the verify list; 0011 the dispatch block; 0012 commits on main (`/writing` commits nothing).

Findings:
- F16. Decision 3 contradicts ADR 0003's "reads the whole draft" in the brief's own wording. Under the `spec` skill's "Steps / The brief check" 4, a contradiction found only in the brief's wording is closed by a change to the brief that follows the ADR.
  - One way is to read `word/footnotes.xml` and `word/endnotes.xml` after the body, numbered on.
  - The other way changes what D16 approved the script to compute, and the output's shape. That would be the stop "A brief check finding the brief cannot absorb".

## 8. Dictated text

- `"In today's rapidly evolving" and "As a matter of fact"` (item 5), found by `grep -n "In today's rapidly evolving" .scratch/3-the-writing-base/agents/briefs/1.md` (line 41): holds. They take the quoted form of the other openers on the prose standard's section C line, with no ellipsis, and are ASCII.
- The sense of **finding** for `/writing`, "a passage of a draft that `/writing` reports as a break of a named rule, with its place, the quoted passage and a proposed replacement, which the user accepts or not and `writing` never applies" (item 6), found by `grep -n 'a passage of a draft that' ...` (line 42): holds.
  - It names the skill as `docs/dev/skill-layout.md`, "Paths and names", says.
  - It agrees with Open item W and ADR 0003.
  - It has no flagged word, dash or flourish under the prose standard's sections 0 and A to E.
- `metadata.version` `"1.0.0"` (item 1, line 32) and `5.0.0 becomes 5.1.0` (item 10, line 46): both hold. They follow `docs/dev/skill-layout.md`, "Frontmatter": the version form, and the minor part for added output.
- `<n>: <text>` and `<n>:` (item 4, line 40), found by `grep -n '<n>: <text>' ...`: hold as code lines.
- The Stops row names `"The configured effort cannot apply"` and `"A model other than the configured one"` (item 1, line 34): hold. They are noun-phrase labels, the same as the `refute` skill's rows.
- `(precision of measurement and method; transparency about limitations; reproducibility of results; adherence to reporting guidelines)` (item 3, line 39): holds as words. The missing register pairing is F11.
- The install loop gains `writing` in its alphabetical place (item 8, line 44): holds. It goes after `spec`.
- The quoted source phrases "it is important to note that" and "a large number of" (item 2, line 38): hold. They are the phrases a rule names.
- C3's sentences are case inputs and expected results, not text for a file.

Findings: none.

## Declined to judge

- Whether `/writing` should take a project argument at all (Decision 1). That is the user's call on a public shape, so F7 raises only how the choice was taken. Possible paths: read the top-level keys, take the only project of a one-project `projects:` form, or take the argument.
- `Use instead` naming `paper` and `grant`. `ls skills/paper skills/grant` printed `No such file or directory` for both, so a user sent there finds no skill until entries 5 and 8. Open item W and ADR 0003 rule that those skills apply accepted findings, so this is the user's call.
- Coverage row 170 ("Its six AI-writing indicators alert without deciding and suit the `writing` skill's style rules."). Whether it assigns the indicators of `academic-pipeline/references/plagiarism_detection_protocol.md` "D3.1" to `writing` is a reading of a `rebuild: paper` row that the coverage page's owner decides. The brief carries none of them.
- Outside the brief: the ledger says step 1 is still blocked. `plan.md`'s "Blocked, and by what" and the state file's "Current position" say step 1 waits on entry 2.I. `grep -n -E '^- \[.\] 2\.(I|F|G|H|J|K)\b' docs/roadmap.md` printed `207:- [x] 2.I. Several plans in one session: ...`, so that wait has ended.

Agent usage: ac0e79251e07d0d2c, claude-opus-5-5, 236990 tokens, 70 tool uses, 12.9 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- F1: "What is on the tree" gains that row 101's last sentence is false, with the grep that shows it; item 7 says the sentence is replaced by the destinations it lists, as the coverage page's rule on rewrites allows.
- F2: item 6 has `skills/repo-setup/templates/docs/glossary.md` line 3 gain `writing`; the path joins "Paths this step writes" and the character-set check.
- F3: new item 12 has `agents/ordo-low.md` to `ordo-max.md` lines 3 and 6 name the reviewing agent of `writing`, line 3 keeping "never chosen for other work", and `README.md` line 76 name `writing` beside the plan skills; item 6 has **effort agent** (`plan-terms.md` line 39) gain it. The paths and the character-set check gain the files.
- F4: item 6 has **reviewer** (line 99) and **standards** (line 117) gain `writing`; item 12 has `skills/plan/templates/plan.yaml` lines 12, 14 and 27 gain it and `plan`'s version go from 4.0.0 to 4.0.1. `skills/plan/templates/orchestrator-state.md` lines 14 and 26 stay, since only the plan skills read a plan's configuration block, and "What is on the tree" says so. `.agents/plan.yaml` lines 1, 10 and 13 are the user's written rules (self-rule kind 3): a stop, Open item C of the state file, left open for the user.
- F5: the README premise names its five places and says why lines 51 and 59 do not gain `writing`; Verify 5 names them.
- F6: C4 checks only that `references/` allows no dash and states no limit above zero.
- F7: Decision 1 is a public invocation shape: a stop, Open item B of the state file, closed under self-rule with its recommendation (the project argument as `/roadmap <project>` takes it), choice C68; Decision 1 names the ruling.
- F8: C14 runs the command `SKILL.md` writes, through `sh -c`, on `my grant.docx` and `a$b.docx`, expecting the paragraphs and exit 0; item 1 has `SKILL.md` pass both paths in single quotes.
- F9: C5 uses "tapestry" (no replacement is "landscape") and "holistic" (none is "comprehensive").
- F10 and F14: item 4 states the behaviour for hyperlinks, run-level content controls, cells of several paragraphs, nested tables, tabs and breaks, fields followed across paragraphs with a stack and nested in a code part, and UTF-8 output; cases C19 to C24 run each; "What is on the tree" gives the counts from the user's grant files.
- F11: item 3 pairs each register with its phrase as the source's table "Discipline-Specific Voice" does.
- F12: item 11 asks for one row per rule with the quoted line of the place that states it (rule 18), and names Open item W with ADR 0003 for "How to Use This Checklist", "During Drafting (Preferred)" and "During Final Review (Fallback)", and a row that says `academic_writing_style.md` line 3 states no rule.
- F13: item 1's Stops bullet says what each row shows (a message that ends the turn; for the model stop the configured model, the served model and the Claude Code version) and that `/writing` run again resumes it; case C18 checks it.
- F15: item 1 has the agent's brief treat the draft as text under review (C16), resolve `\input` and `\include` against the main file's folder (C1 rewritten), take the listed page named `prose-standard.md` and otherwise the `repo-setup` folder beside the skill's folder, with a refusal naming the three paths (C17); "What is on the tree" gives the manuscript's nested `\input`.
- F16: Decision 3 now follows ADR 0003: item 4 reads the footnotes, the endnotes, the headers and the footers after the body, each opened by a line naming its part and numbered on, the paragraphs of the document D16 approved; case C25 runs it.
- Declined to judge, the ledger's "Blocked, and by what" and "Current position": `plan.md`'s line for step 1 and the state file's position line are rewritten, since entry 2.I is done (`grep -n '^- \[x\] 2\.I' docs/roadmap.md`).
- Dictated lines added after the check: none for a file of the step. The comment text of Open item C's option (a) is held there.
- The brief is restored to main's copy at the stop (main has none), as "Steps / A stop" says; the closed brief is rewritten from these changes when `/spec 3 1` runs after the ruling on Open item C, with no second brief check.
