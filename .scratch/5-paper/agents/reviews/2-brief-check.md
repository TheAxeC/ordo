# Brief check: step 2 of plan 5

The brief is `/Users/axelfaes/workspace/ordo/.scratch/5-paper/agents/briefs/2.md` (293 lines, uncommitted), read on main at eeef47b (`git rev-parse --short HEAD` printed `eeef47b`). I changed no file. Scratch copies of research-hub files went under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/bc2/`.

Most of the brief's premises hold. These findings need a change to the brief before the builder starts:

- The patch flow keeps one manifest and one patched file per manuscript file. A run with more than one patch to the same file therefore keeps only the last trail, which goes against ADR 0020. Names 1 and ADRs 2.
- The patch flow does not cover empty `roadmap_item_ids`, re-anchorizing after a copy, the exit-2 kinds `stale-manifest` and `output`, exits 4 and 1, or checking the copied file.
- The one-line answer (`all but 3, 7`) refers to finding numbers that the `/writing` report does not print.
- The `.bib` rule has no word on commented lines or `\bibliographystyle`, and it refuses modes that need no `.bib`.
- No item says who writes the ethics statement, the responsible-use statement or the data availability statement.
- Several parts that rows send to `paper` have no item: reproducibility (row 215), the stops of rows 53, 54 and 159, the web-search fallback of row 213, and the parts sent to `paper` by rows outside the 43.
- Two source files the brief needs are not in its read list: `formatter_agent.md` and `report_compiler_agent.md`.
- No case covers rule 15 (a value the user supplies reaching a command), rule 16 (a write checks its result) or rule 18 (the coverage records quote the line that holds each part).

## Names

1. **The run folder's file names collide when a file gets a second patch.** Item 7 sends every patch of a file to `<run folder>/<file name>.patched` and moves the file's manifest into the run folder under the name `anchorize_tex.py` gives it.
   - Full mode patches `main.tex` several times in one run: the draft review rounds, the citation-compliance patch, the abstract patch and the `/writing` fixes.
   - Each later patch replaces the earlier patch's patched file, apply report and manifest.
   - This has happened: the hub's own dongho revision kept a separate file for each round. `ls research-hub/projects/manuscripts/dongho-ecg-clustering/admin/reviews/patches/trail` lists `main.rev1.tex`, `main.rev1.tex.apply-report.json`, `main.rev2.tex`, `main.rev3.tex`, `main.rev4.tex`, `refs.rev4.bib`, `main.tex.block-manifest.json`, `main.rev1.tex.block-manifest.json` and more. `ls .../patches` lists `revision_patch_round1.json` to `revision_patch_round5.json` and `revision_patch_round4_bib.json`.
   - Rerun on a scratch copy: I anchorized `main.tex`, moved the manifest to `run/`, applied a patch and copied the result over `main.tex`. I then anchorized and moved again, and `ls -la run` showed one `main.tex.block-manifest.json`, one `main.tex.patched` and one `main.tex.patched.apply-report.json`. The second `mv` replaced the first manifest without warning.
   - The change makes a statement false: item 7's "the patch, the manifest and the apply report stay in the run folder" fails for every patch after the first.
2. **The lit-review `.bib` has two names.** Decision 3 (`grep -n 'candidates.bib'` gives brief line 233) says the strategist writes `candidates.bib`. Open item C (a) (`plan.md:119`) says lit-review without a `.tex` "writes `review.md` and `refs.bib`". No item says which name holds, or how full mode's `refs.bib` comes from the strategist's file.
3. **One name, two files.** `disclosure.md` is the reference page `references/disclosure.md` and also the run folder's output (Decision 2, brief line 232: "draft writer from `disclosure.md`, its patch and `disclosure.md` in the run folder"). Skill-layout "Writing for an agent" says "One meaning has one place".
4. **"draft review" outside its defined sense.**
   - The glossary defines it for full mode only. `grep -n -i 'draft review' docs/glossary.md` gives line 148: "the review of the author's own draft while it is written, by one reviewer inside `paper`'s full mode ... at most twice."
   - `docs/roadmap.md:45` says "the draft review of `paper`'s full mode".
   - In the brief, the peer reviewer also re-reviews in revision mode "at most twice" (Decision 2, line 232; item 11, line 139). The Conventions say "the peer reviewer's review of the author's draft is the draft review" (line 261).
   - So either the term is used outside its sense, or revision mode has a fourth kind of review with no name.
   - Skill-layout "Writing for an agent" requires the glossary entry to change first. No item does that, and `docs/glossary.md` is in the paths only for the sync.
5. **A bare "round" means a repair round.** `docs/glossary.md:107` (**round, of an interview**): "In `grill` and in text that describes `grill`, the bare 'round' means this; elsewhere it is a repair round."
   - The skill's text will speak of draft review rounds (item 11), figure fix rounds (row 97) and the patch JSON's `round` field.
   - The Conventions (line 260) list "the two draft review rounds" but give no rule that every "round" in the skill is qualified.
6. **The wiring grep prints more than the brief lists.** `grep -rn 'code-comments' skills utils docs README.md agents .agents/plan.yaml`, with the brief's exclusions, also prints `docs/dev/building.md:6`, `docs/dev/scripts.md:17`, `docs/dev/scripts.md:34` and `docs/dev/change-standard.md:70`, which are lists of scripts.
   - The change does not make them false, since the step adds no script.
   - The brief names `plan-terms.md:41` as staying. It does not say that these script lists stay too.
7. **The other new names make nothing false.**
   - `git grep -n 'skills/paper/SKILL.md\|skills/paper/references'` outside the brief hits `.scratch/5-paper/plan.md:21` and `:56`, `.scratch/5-paper/agents/reviews/1-landing.md:32`, archived ledgers (history, unchanged), `docs/academic-coverage.md:14` (a path the step writes) and ADR 0019:11. Each still holds.
   - `git grep -n 'paper-runs'` hits ADR 0018:7, ADR 0020:11 and :20, and `docs/adr/README.md:30`. All hold.
   - `docs/dev/scripts.md:21` says `anchorize_tex.py` writes the manifest "beside it". That still holds: moving the manifest is the skill's own act, not the script's.

## The step line

Each part of plan.md's step 2 line (`plan.md:21`), with the brief item that serves it:

- `SKILL.md` 1.0.0: item 1.
- The seven modes with D26's arguments (D1, D25): item 2. The LaTeX format of D25 is in item 11, `draft-writer.md`.
- The roles, each a fresh `ordo-<reviewer_effort>` agent with its own page: items 6 and 11.
- Intake as the session's interview: item 5.
- The four stops of D24: item 10.
- The draft review with at most two rounds (D33): item 11 `peer-reviewer.md` and Decision 2.
- The run folder (D27, ADR 0020): item 5.
- Passage lines and quote-check (D22, ADR 0018): items 9 and 11.
- The lit-review BibTeX entries added to the `.bib` (D2, D13): item 11 `literature-strategist.md` and Decision 2.
- The pages for the integrity checks, figures and statistics: item 11.
- The AI disclosure, CRediT, funding and ethics statements (D9 to D11): item 11.
- `/writing` at the end, the one-line answer and patches (D40, ADR 0021): item 8.
- `/paper revision <main.tex> <report>`: items 2 and 8.
- The Use instead rows and D3's line: item 3.
- README: item 13.
- The check's ledger records: item 16. The layout reading: item 1. The script sentences: item 17.

Findings:

1. **Part with no requirement: "ethics statements".** Item 11 makes `ethics.md` an ethics check run by the integrity agent (Decision 1, line 231). The draft writer writes "the statements and disclosures it writes from `statements.md` and `disclosure.md`" (line 136), so no item says who writes the ethics statement.
   - Row 187 (`awk 'NR==187' docs/academic-coverage.md`) says "hub papers on patient data carry one" and that the paper "states that approval".
   - Row 215 adds "a responsible-use statement".
   - No item names who writes either statement, or from which page.

**Coverage rows (the reading of the 43 reasons against Decision 1 and items 11 and 12).**

2. **Row 215's reproducibility check has no item.** Row 215 says: "with its disclosure, conflict, reproducibility and fair-representation checks". The `ethics.md` list in item 11 (line 144) has conflicts, AI disclosure and fair representation, but no reproducibility check.
3. **The stops of three rows have no Stops row and no step.**
   - Row 53: "two weak-argument signs stop drafting".
   - Row 54: "an unsupported claim stops the check". Item 11 carries the words but gives no outcome.
   - Row 159: "a mode lacking its logs blocks".
   - Item 10's Stops table holds none of the three, and no step says what the run does when one of them happens.
4. **Row 213's fallback and duplicate check are not carried.** Row 213: "a miss goes on to DOI resolution and web search before being called not found. Its paper IDs also detect duplicates." Item 11 gives only "every reference looked up with `lookup.py resolve`". It neither carries nor drops the web-search fallback or the duplicate detection. A web search for a reference is also a lookup outside `lookup.py` (see ADRs 3).
5. **Row 51's pre-output checklist is not in row 51's file.**
   - Item 12 asks for "the pre-output checklist of row 51".
   - `grep -n -i 'pre-output' academic-paper/SKILL.md agents/formatter_agent.md` finds it only at `agents/formatter_agent.md:790` ("### Pre-Output Final Checklist"). That file is row 56 (`rebuild later: paper`), whose reason says "`SKILL.md` takes the pre-output checklist".
   - The brief's read list holds only the 43 files, so the builder is never told to read `formatter_agent.md`.
6. **Row 51's "closing check of six statements" names one statement no page carries.** The six are those of academic-paper `SKILL.md`, "Mandatory Inclusions": the Data Availability Statement, ethics, CRediT, conflict of interest, funding and the AI disclosure. No page of item 11 carries the Data Availability Statement.
7. **Row 52's protections come from a file outside the read list.** Row 52 takes "the abstract-only protections of `deep-research/agents/report_compiler_agent.md`". That file is row 190 (`drop`), which is not in the read list, so item 11 `abstract.md` names protections whose source the builder is never told to read.
8. **Row 57: the project holds the venue profile.** Row 57 says "The project holds the Step 3 venue profile". Item 5 writes the intake answers to `config.md` in each run folder. A later run in another mode on the same project, such as disclosure after full, has no place to read the profile from.
9. **Row 165 against D2.** Row 165 says "the library never modified". D2 allows adding entries. Item 11 widens this to "the `.bib` changed only by patch" (line 133), which also allows changing or deleting existing entries. Neither the row nor D2 allows that.
10. **The brief builds text for a dropped part.** Row 92: "no skill renders the four anchors". Item 11 `disclosure.md` writes "the policy anchors never rendered" (line 143) as a rule. Nothing in the skill could render them, so under skill-layout "Writing for an agent" ("A sentence stays only when it changes what the reader does") the sentence changes nothing a reader does.
11. **Rows outside the 43 send parts to `paper`, and no item carries them.** I found them with `awk 'NR>=30 && $0 !~ /rebuild: paper \|/ && ($0 ~ /`paper`/ || $0 ~ /paper skill/ || $0 ~ /[Ee]ntry 5/) {print NR}' docs/academic-coverage.md` and then read each line. These have no item:
    - Row 87 (`journal_submission_guide.md`, `rebuild: submit-manuscript`): "The paper skill's statements take the data, CRediT and AI templates". The data template is the missing statement of finding 6.
    - Row 99 (`writing_judgment_framework.md`, `rebuild: writing`): "The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5."
    - Row 148 (`academic-pipeline/SKILL.md`): "`paper` takes the optional parallel drafting".
    - Row 149 (`pipeline_orchestrator_agent.md`): "`paper` takes its patch sequencing and claim-audit gate". The patch sequencing is that file's "Revision-Round Patch Sequencing" at line 906.
    - The parts that rows 183, 185, 190, 216, 222, 226 and 232 send to `paper` (fact-checking, the ethics stop, the AI disclosure line, the predatory screen) fall under items 11 and 12.
    - Step 2's check covers only the 43 rows, so these parts go unchecked.

## Premises

Rerun of "What is on the tree":

1. **Hold**:
   - `ls skills/paper skills/paper/templates` lists `templates` and the six files.
   - `awk ... '^ rebuild: paper $' ... | wc -l` prints `43`. The 43 row numbers equal the brief's list, by `awk ... {print NR}`.
   - The `##` headings stand at 47, 113, 144 and 179.
   - `wc -l` of the 43 files gives each count as the brief states and `11451 total`.
   - `check_coverage.py` prints `ok: docs/academic-coverage.md`, exit 0.
   - The introduction quote is `docs/academic-coverage.md:14`. "held in `skills/writing/references/rules.md`" occurs (`grep -o`).
   - `skills/writing/SKILL.md:23` reads `| The findings of a manuscript are to be applied | `paper` |`.
   - The script forms and exit statuses hold, from the head comments read whole.
   - On a scratch `refs.bib`, `anchorize_tex.py refs.bib --print-blocks` printed `refs.bib.block-manifest.json: 21 blocks, 8192/8233 chars in blocks`, and `grep -c '^@'` printed `21`.
   - `Python 3.13.4` and `/opt/homebrew/bin/pdftotext`.
   - `ward-bttr-crosssubject/manuscript/main.tex:65` reads `\input{body.tex}`, and `dongho .../main.tex:839` reads `\bibliography{refs}`.
   - The glossary lines are 148, 151 and 153.
   - `utils/pin.sh:21` reads "A skill is a folder under skills/ in the tag that holds SKILL.md".
   - `ls skills` has no `rebuttal`, `idea` or `paper-review`.
   - The wiring line numbers hold, each read with `sed -n`.
   - The verify list has the 10 commands of `docs/dev/building.md`.
   - On a scratch `main.tex` with its manifest moved to `run/`, `--check-only --manifest run/...` exited 0 and `--manifest ... --output run/main.tex.patched` exited 0, writing `main.tex.patched.apply-report.json`.
2. **Mismatch, the `rebuild later: paper` rows.**
   - The brief (line 57) says the rows are "56, 61, 73, 84, 88, 91, 108, 128, 130, 137 and 161, by the same `awk` with `rebuild later: paper`".
   - `awk -F'|' '$3 ~ /^ rebuild later: paper $/ {print NR}' docs/academic-coverage.md` prints `56 61 73 84 88 91 108 161`.
   - Rows 128, 130 and 137 are `rebuild later: paper-review` (`sed -n` of each: `calibration_mode_protocol.md`, `guided_mode_protocol.md`, `sprint_contract_protocol.md`).
3. **Mismatch, "the main files name their `.bib` by one `\bibliography{...}` line"** (line 66, over `projects/manuscripts/*/manuscript/main.tex`).
   - A loop with `grep -cE '^[^%]*\\bibliography\{'` over those files printed `not one: 0 projects/manuscripts/ecg-readable-substrate/manuscript/main.tex`.
   - That file uses `\begin{thebibliography}{99}` at line 288 (brief's own grep).
4. **Mismatch, Decision 2's claim that the mode roles "follow academic-paper's mode table".**
   - `sed -n 262,280p academic-paper/SKILL.md` gives `revision` as "8->5->6", which by the agent table is peer reviewer, draft writer, citation compliance. It gives `citation-check` "6 only", `disclosure` "9 only", `lit-review` "1->2" and `abstract-only` "1->7".
   - The brief adds integrity verification and a re-review to revision, and integrity verification to lit-review.
   - Item 5 puts intake into every mode, citation-check and disclosure included, where the table has none.
5. **Mismatch, ADR 0013's line** (line 81). "`/writing` is invoked through the Skill tool, and the skill does not do its review itself" is not in 0013's Decision (`awk '/^## Decision/...'` on 0013). The Skill-tool sentence is 0021's.
6. **Mismatch, "D1 to D41"** (line 92). `grep -o '^- D[0-9]*' plan.md` lists D1 to D31 and D33 to D41, with no D32.
7. **Minor, "README.md:26 to :27 (the skills table, one row per skill)".** `grep -n '^| ' README.md` shows the table at lines 11 to 27, so lines 26 and 27 are only its last two rows.

## Cases and checks

1. **No case for rule 15 of `docs/dev/change-standard.md`** ("Each place where a supplied value reaches a command, a path or generated text is a case").
   - The user's project folder, `main.tex`, comments file and quoted topic reach `anchorize_tex.py`, `apply_tex_patch.py`, `lookup.py search`, `mktemp` and `cp`.
   - `/writing` Steps 5 quotes each path in single quotes, with `'\''` for a quote inside. Neither item 5 nor item 7 asks for that.
   - No case covers a path with a space or a quote, or a topic holding `"` or `$(`. Item 2's own form `/paper lit-review "<topic>"` puts quotes in the topic.
2. **No requirement or case for rule 16** ("A write verifies its own result"). Item 7's copy of the patched file over the manuscript file is a rewrite of the file. The apply report holds the output's path and hash (`apply_tex_patch.py` head comment), but no item asks the session to compare the copied file with it.
3. **Item 16 and C5 against rule 18.** Rule 18: "the report quotes, for each row, the line of the named place that states it." Item 16 asks for "the file of `skills/paper/` and the section that holds it", with no quoted line.
4. **C11 does not check that the agent frontmatter still parses.**
   - Line 3 of each `agents/ordo-*.md` is an unquoted YAML value. A loop with `yaml.safe_load` printed `agents/ordo-high.md parses, description quoted: False`, and the same for the other four.
   - A `: ` in the added words breaks the definition, and the installed effort agents stop loading.
5. **C13 is not fully consistent with item 9 in lit-review.** C13 expects `cite-keys` to print nothing after a `.bib` gains an entry the `.tex` cites. In lit-review the added entries are not cited, so `cite-keys` prints `unused:` for each of them, and the brief says nothing about that (Implied inputs 7).
6. **C14 leaves out two real inputs:** a commented `\bibliography` line and `\bibliographystyle` (Implied inputs 1 and 2).
7. **Verify 5's pattern hits the skill's own role name.** `grep -rn 'literature\|...'` matches every line that names the literature strategist or `literature-strategist.md`, so a real hit of the dropped `literature` skill is buried among them.
8. **Places the step does not change.** No case asks the builder to check, quote or explain one. C13 and item 17 run the unchanged scripts, but only to check sentences in the files the step writes.

## The question

The goal here is the part of plan 5's goal that step 2 delivers: the skill's text, its pages and its wiring.

- **Step 2's check: yes, it could pass.**
  - It reads only the 43 rows, so the parts that rows 87, 99, 148 and 149 send to `paper` (Step line 11) can be missing while every record holds.
  - Its sentence checks run each script once on one file, so the multi-patch trail (Names 1) can fail while every quoted sentence holds.
- **C1: no.** The layout reading finds a missing section.
- **C2: no.** The reading checks the modes, the arguments and the refusal.
- **C3: no.**
- **C4: yes.** Decision 2's role lists can be followed exactly while a mode starts roles academic-paper's table does not give (Premises 4), so the check is only as good as Decision 2.
- **C5: yes.** It holds the parts of the 43 reasons, but not the parts that other rows send to `paper`, and not the sources outside the read list (Step line 5 and 7).
- **C6: no** for ADRs 0017 to 0021. The ADR line for ADR 0013 is misattributed (Premises 5).
- **C7: yes.** "The patch rule stands once" can hold while the rule overwrites its own trail on a second patch, and while it lacks the `roadmap_item_ids` source (Implied inputs 5 and 6).
- **C8: yes.** The one-line answer `all but 3, 7` can be written into the text while the `/writing` report has no numbers to name (ADRs 4).
- **C9: no** for the folder name. Its edge inputs are under Implied inputs 9 and 10.
- **C10: yes.** It can pass while the stops of rows 53, 54 and 159 have no row (Step line 3).
- **C11: yes.** It can pass with a broken agent frontmatter (Cases and checks 4).
- **C12: no.** It is read row by row.
- **C13: no** for the sentences it runs. It runs only one patch per file.
- **C14: yes.** It can pass with a rule that counts a commented line and so refuses a real file (Implied inputs 1).
- **Item 1's description count: no** for the length. The triggers are judged by the layout reading.
- **Item 9: yes.** No case says what happens to an `unused:` line or to an index left out.
- **Item 11: yes**, for reproducibility and the ethics statement (Step line 1 and 2). A record would catch reproducibility only if its writer reads row 215 against the page rather than against the brief's list.
- **Items 13 to 15: no.** C11 and C12 read them, apart from the YAML gap.
- **Item 17: no.**

## Implied inputs

Each with its expected result.

1. **A commented `\bibliography` line next to an active one** (happened). `grep -nE 'bibliography' research-hub/projects/manuscripts/meseret-cirrhosis/notes/thesis/main.tex` printed `566:\bibliography{References}` and `570:% \bibliography{References}`.
   - Expected: text after an unescaped `%` is skipped, as `/writing` Steps 3 and `lookup.py` do, and the `.bib` is `References.bib`.
   - The brief's rule ("the one `\bibliography{...}`") does not say. Read literally it counts two lines and refuses.
2. **`\bibliographystyle{...}` beside every `\bibliography`** (happened, in every hub main file; the brief's own grep prints both kinds). Expected: only `\bibliography{` and `\addbibresource{` count.
3. **A mode that reads no `.bib`, on a manuscript without one** (happened: ecg-readable-substrate uses `thebibliography`, Premises 3).
   - Expected: abstract-only and disclosure do not look for the `.bib`.
   - Item 4 finds the `.bib` "for a mode given a main `.tex`", so both modes refuse.
4. **`\bibliography{IEEEabrv,main}`** (happened, at `research-hub/projects/archive/published/2022/block-term-tensor-regression/manuscript/bare_jrnl.tex:1082`, by `grep -rnE '\\bibliography\{[^}]*,'`).
   - Open item C (a) rules it a refusal, so every IEEEtran paper that loads the abbreviation file is refused in each mode that reads the `.bib`.
   - The ruling decides this. I am naming its cost, not overturning it.
5. **A patch from any mode but revision has no item ids to name** (cost: rejection).
   - The validation demands `roadmap_item_ids`. A scratch patch with `"roadmap_item_ids": []` printed `"kind": "validation"` and `"OP001: roadmap_item_ids must name at least one reviewer item"`, exit 2.
   - Item 11 asks for "each op's `roadmap_item_ids`", but only revision has numbered items. Abstract-only, citation-check, disclosure, the lit-review `.bib` patch, the draft review rounds and the `/writing` fixes have no stated id source.
   - Expected: each patch names the ids of what it answers, such as the issue numbers of `citation-report.md` or of `review-<n>.md`, or the finding numbers of the `/writing` report.
6. **A second patch to a file whose patched copy was already copied over it** (happens in every full run).
   - On a scratch copy, a check against the old manifest after the copy exited 2, with `"kind": "stale-manifest"`.
   - Expected: the session anchorizes again before each patch, and each manifest, patch, patched file and apply report gets a name of its own (Names 1).
   - The brief states neither the re-anchorize nor the naming.
7. **`cite-keys` reports `unused:` lines** (happened). On scratch copies, `lookup.py cite-keys main.tex refs.bib` printed `unused: halme2018` with exit 1 for ward-bttr-crosssubject, and nothing with exit 0 for dongho and linfoot.
   - Item 9 gives the output "to the role that owns the failure" for one correction, so a role may delete an entry the user keeps on purpose.
   - In lit-review every added entry prints `unused:`.
   - Expected: an `unused:` line goes to the user, or is left as it is, and a role never deletes an entry because of it.
8. **The exit statuses the patch flow does not handle:**
   - Exit 2 with kind `output`: the session's own wrong `--output`. Expected: the session fixes its own call. Item 7 sends every exit 2 back to the writing agent.
   - Exit 2 with kind `stale-manifest`: expected, anchorize again and resend.
   - Exit 4 (self-check, "a defect of this script") and exit 1 (traceback): expected, the run stops with the printed output and the base untouched. The brief has no rule for either.
   - `lookup.py` exit 2 (a call it cannot read) and a `check-urls` failure that is an index left out ("title not checked: <index> left out, <reason>"): the cause is the network, not a role. Expected: shown to the user, not sent to a role.
9. **A main `.tex` whose folder is the repository root or the session's folder.** Expected: unstated. "Beside the manuscript's folder" then puts `paper-runs/` in the parent folder, outside the repository. Not seen in the hub, where every manuscript is under `<project>/manuscript/`.
10. **The `-2` rule and the date.** Local or UTC date is unstated. Low cost.
11. **Full mode when `<project>/manuscript/refs.bib`, or a `.bib` among intake's materials, already exists.**
    - Open item C refuses only an existing `main.tex`. Decision 2 skips the strategist when intake's materials hold a `.bib`.
    - Expected: an existing `.bib` is kept and changed only by patch, or the run refuses. Writing a new `refs.bib` over it loses the user's file.
12. **A new BibTeX entry whose key, or whose DOI under another key, is already in the `.bib`.** Expected: skipped or given a new key. `apply_tex_patch.py` does not check keys, and a duplicate key breaks the `.bib`. The brief is silent.
13. **A cited source with no open-access full text** (`lookup.py fetch` exits 1, the head comment says).
    - ADR 0018 sends the claim to the user with the URLs tried, but item 10's Stops table has no row for it.
    - Expected: a stop, or a row in the record that the user reads.
    - Whether a hub source lacks open access was not verified, since no network command was run.
14. **Rendered figures.**
    - Who runs the figure scripts is unstated: item 6 says the session "runs the scripts", which reads as the three scripts.
    - Where the images go is unstated, `manuscript/figures/` or the run folder. Dongho has `manuscript/figures/`, so an image written there can replace one of the user's.
    - What happens without matplotlib is unstated.
    - Expected: the figures go to the run folder, or replace a figure only by the user's choice, and a missing library is reported.
15. **A manifest already beside the `.tex` when the run starts.**
    - `anchorize_tex.py` replaces it, and the move takes it away.
    - `find research-hub/projects -name '*.block-manifest.json'` lists only files under `dongho-ecg-clustering/admin/reviews/patches/trail/`, so this has not happened in the current tree.

## ADRs

1. **0019** (proposed). The step is under: "Each role is a fresh agent started through the Agent tool, with its own page under `skills/paper/references/`, run as `ordo-<reviewer_effort>` on the model the configuration's `reviewer` names."
   - It is also under: "The run stops for the user at the approval of the outline, at a reference that cannot be confirmed, at the ethics stop and at the acknowledgement of a structural patch."
   - The brief adds stops: the intake confirmation, "A patch that does not apply" and the model stop. Row 53, 54 and 159 would add more.
   - The ADR does not say its list is complete, and the brief does not say whether it reads it that way. No sentence contradicts outright.
2. **0020** (proposed). The step is under: "A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder ...: the manifests, the patches, the apply reports, the integrity record and the approved outline."
   - Item 7's fixed names keep one manifest, one patched file and one apply report per file, so a run with two patches to a file does not keep "the manifests, the patches, the apply reports" (Names 1).
   - That part of the brief contradicts the decision.
   - The lit-review run folder without a `.tex` (in the session's folder) is a case the decision does not cover. Open item C rules it.
3. **0017** (proposed). The step is under: "`skills/paper/templates/lookup.py` ... makes every lookup of the skill".
   - Row 213's "web search before being called not found" is a reference lookup `lookup.py` cannot make. Carried, it contradicts this sentence; the brief neither drops it nor resolves it.
   - The plagiarism screen of row 169 ("sampled sentences searched on the web") is a web search no `lookup.py` command makes. The brief does not say which tool runs it.
4. **0021** (proposed). The step is under: "The user answers once, in one line, which findings to accept, such as `all` or `all but 3, 7`."
   - `grep -n -i 'number' skills/writing/SKILL.md` finds only the `cat -n` line numbers (line 92) and line 139. The checking agent folds repeated breaks into one finding (line 245), and no line numbers the report's findings.
   - The brief does not say where the numbers come from. The session "writes no part ... of a report" (item 6), and `skills/writing/` is not in the paths.
5. **0002** (proposed). The step is under: "No rule that contradicts the prose standard is carried."
   - Item 11 carries row 55's "topic-evidence-explanation-link paragraphs".
   - `sed -n 100,105p academic-paper/agents/draft_writer_agent.md`: topic sentence, "Evidence/support <em dash> 2-3 sentences", analysis, transition, so at least five sentences. Line 255 says "Each paragraph 120-200 words".
   - That conflicts with the prose standard's section D, "stay under roughly four sentences".
   - The brief says "carried in the prose standard's terms" but does not state which form of the rule is carried. Line 70 of the same file ("Check em dash count (<less-than-or-equal sign>3 total ...)") contradicts section 0's "Em dash: zero", and no row takes it.
6. **0013** (proposed). The step is under: "The session shows the one report ... and changes nothing." The brief names 0013 but quotes 0021's content for it (Premises 5).
7. **0018 and 0001.** The brief's lines match their decisions. No contradiction.
8. **0007** (proposed). It touches the step through "The served-model check applies to it as to every agent". The brief carries that check through item 6, but "What is on the tree" does not name 0007. The other ADRs (0004 to 0006, 0008 to 0012, 0014) govern nothing the step changes, by reading each Decision.

## Dictated text

Each dictated line, found with `grep -n -- '<text>' .scratch/5-paper/agents/briefs/2.md`:

1. Lines 98 to 105: `/paper full <project folder>`, `/paper outline-only <project folder>`, `/paper revision <main.tex> <comments file>`, `/paper abstract-only <main.tex>`, `/paper lit-review "<topic>" [<main.tex>]`, `/paper citation-check <main.tex>`, `/paper disclosure <main.tex>`, `/paper <project> <mode> ...`. **Holds.** Skill-layout "Sections, in order", row 2, still asks each Quick start line for a short comment, which the brief does not forbid.
2. Line 107, D3's line: "`idea` checks whether an idea holds up and is new, and plan mode (`/paper plan`) takes such an idea to the chapter plan, a mode this skill does not have". **Breaks:**
   - Prose standard E, "Sentence length": 32 words chaining two independent ideas.
   - Skill-layout "Sections, in order", row 3: the Use instead table has the columns When and Use, and one sentence fits neither.
   - Skill-layout "Lists and tables": a cell holds a phrase or a sentence, and this one carries two requirements. The refusal of `/paper plan` is a rule for Steps, by "Where a rule goes".
3. Line 59, 120 and 127: "A model other than the configured one". **Holds** (the stop name `/writing` uses).
4. Line 122: "A patch that does not apply". **Holds.**
5. Line 123: "A structural patch". **Holds.**
6. Line 109: "No plan configuration". **Holds.**
7. Line 127: "The configured effort cannot apply". **Holds.**
8. Line 150: "the agents of /paper" (or "the agents of `paper`" in the form each line uses). **Holds.** The YAML comments already use the `/writing` form, and plan-terms uses `writing` in code.
9. Line 125: "`all` or `all but 3, 7`". **Holds as text.** It names numbers the `/writing` report lacks (ADRs 4).
10. Line 117: `paper-runs/<mode>-<YYYY-MM-DD>/`. **Holds.**
11. Lines 121 and 180: `<run folder>/<file name>.patched`. **Breaks** ADR 0020's Decision on a second patch (ADRs 2).
12. Line 151, the "held in" form of the `rebuild: writing` rows. **Holds** (`grep -o` shows the form at two rows).
13. Line 233, the file names `review.md`, `candidates.bib`, `outline.md`, `arguments.md`, `citation-report.md`, `review-<n>.md`, `integrity.md` and `figures.md`, and lines 118 and 126, `config.md` and `checks.md`.
    - **Breaks** for `candidates.bib`, which open item C (a) calls `refs.bib` (Names 2).
    - **Breaks** for the run folder's `disclosure.md`, which has the name of a reference page (Names 3), against skill-layout "Writing for an agent", "One meaning has one place".
    - The others **hold**.
14. Line 261, the terms "issues", "findings" and "stops". **Holds** with the glossary's **finding** and **stop** entries. "the draft review" breaks the glossary's **draft review** entry when it is used for revision mode (Names 4).
15. Line 96: "Triggers on:". **Holds.**

## Declined to judge

- Whether Decisions 1 to 5 of the brief, and intake in every mode, are the better options: that is the orchestrator's call, or the user's.
- Whether every part of each of the 43 source files beyond its coverage reason is carried by items 11 and 12. I read the 43 reasons in full and the source passages cited above, not every source file whole.
- The network behaviour of `lookup.py fetch`, `check-urls` and `resolve` on the hub's sources: not run, since it needs the indexes, so whether a dongho source lacks open access is not verified.
- Whether the skill's description fits 1,024 characters: the description is not written yet.
- The text of `.scratch/rulings/5-paper.md`, which ADR 0018's Context cites: `ls .scratch/rulings` prints "No such file or directory". That predates this step and is not its concern.

Usage: a3bbeeb121f4b8378, claude-opus-5-5, 280536 tokens, 67 tool uses, 14 min 55 s
