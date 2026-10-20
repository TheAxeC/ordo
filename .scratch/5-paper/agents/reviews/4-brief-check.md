# Step 4 brief check (on main at 8468ee3)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check" on `agents/briefs/4.md`.

I read the brief, the figure spec and `plan.md` from the working tree. `git status` shows all three as uncommitted edits on top of 8468ee3 (` M .scratch/5-paper/agents/briefs/4.md`, ` M .../4-figure-spec.html`, ` M .../plan.md`, ` M .../orchestrator-state.md`). The plan diff (`git diff --word-diff HEAD -- .scratch/5-paper/plan.md`) changes only the ADR clause of step 4's line, to "ADR [-ADRs-]{+ADR+} ... superseded by a new record whose decision carries rulings J, S and U, and ADRs 0017, 0020, 0023 and ... refines it, as `docs/adr/README.md` says".

## 1. Names

Commands, each run from the repository root with `.scratch/archive` and the ledger left out:
- `git grep -n -E 'abstract\.md|argument-builder\.md|ethics\.md|integrity-verification\.md|structure-architect\.md'`
- `git grep -n -i -E 'structure architect|argument builder|abstract agent|integrity verification agent|The findings to apply|The ethics stop|ethics stop|integrity record'`
- `git grep -n -E 'pipeline\.svg|plan-loop\.svg|gen_figures'`
- `git grep -n -E '0022|0017|0020|0023|0024|0025' -- docs README.md skills utils CLAUDE.md`
- `git grep -n -i 'draft review'`
- `git grep -n -i -E "The mode to run|An unfinished run|The sources' review|The items' approval|final\.md|% FIGURE"`
- `grep -n -o '`paper`[^;.]*' docs/glossary.md skills/repo-setup/templates/plan-terms.md`

Hits outside "Paths this step writes", and whether the change makes each one false:
- The removed pages are named only under `skills/paper/`, in `docs/academic-coverage.md` and in `docs/adr/0022-...md:22`, and all three are in the paths. ADR 0022:22 ("`references/integrity-verification.md` and `references/ethics.md` leave `skills/paper/`") stays true. Not false.
- The removed role names and the "integrity record":
  - `docs/adr/0018-...md:11`, `:21` and `docs/adr/0019-...md:7`, `:11` are superseded records. They are history and not false.
  - `docs/adr/0022-...md:7`, `:17`, `:18` are 0022's Context and Alternatives, and 0022 becomes superseded. Not false.
  - `docs/adr/0017-...md:11` and `docs/adr/0020-...md:7`, `:11` are in the paths and are refined under item 19.
  - `.scratch/choices.md:376, :413, :414, :458` are ledger history. Not false.
- "The findings to apply" and "The ethics stop" have no hit outside `skills/paper/` and the ledger.
- The new stop names, `final.md` and `% FIGURE` have no hit anywhere, so nothing collides.
- `pipeline.svg` and `plan-loop.svg`:
  - `README.md:62` and `:66` (alt text) are covered by item 20.
  - `README.md:60` reads: "The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time ... One marked "only when" waits on you in a named case. You may skip a skill marked "optional"."
  - `README.md:64` reads: "The loop of one step carries the same marks".
  - `docs/glossary.md:150` holds **mark, of a figure**, "the label a box of the README's figures carries where the user is asked ... "every run" ... "only when" ... "optional" ... Stated in: `README.md`, the figures".
  - `docs/figures/gen_figures.py:18-20` (head comment) says the same.
  - Item 20 redraws both SVGs in the simple view. That view's legend has orange stops and solid or dashed agents, and no "every run", "only when" or "optional" mark. All of these become false. README and the glossary are in the paths, but no item names `README.md:60`, `:64` or the glossary term. Item 22's glossary grep does not reach the term: `grep -n -i 'integrity\|ethics\|abstract agent\|structure architect\|argument builder\|figures in parallel\|findings to apply' docs/glossary.md` prints nothing.
- ADR 0022: `docs/adr/0019-...md:3` "Status: superseded by 0022" is not false. `docs/adr/0024-...md:7` "ADR 0022 moves the integrity check to `researcher`" is not false. `docs/adr/README.md:31` is in the paths.
- **draft review**: `docs/glossary.md:148` is covered by item 22. `docs/adr/0022-...md:11` ("the peer reviewer, which gives the draft review") is not false.
- `quote-check`'s "integrity record" in `skills/paper/templates/lookup.py` has 10 hits (`grep -n -i integrity lookup.py | wc -l` prints 10): `:14`, `:30`, `:32`, `:53`, `:68`, `:524` ("# Integrity records and BibTeX."), `:528`, `:553` (docstrings), `:611` and `:1233`. `lookup.test.sh` has `:135` (T6 comment), `:476` (L6 comment) and `:488` (L6 message). All are in the paths. Item 23 names only "its usage line, head comment and messages" and "case L6's comment", so it leaves out `:524`, `:528` and `:553` and the test's T6 comment at `:135`. C23's grep would print each of them.
- `paper`'s Steps numbers in the plan-terms block: `skills/repo-setup/templates/plan-terms.md:39` (**effort agent**, "Stated in: ... `paper`, Steps 4 and 8") and `:99` (**reviewer**, "`paper`, Steps 8") are copied to `docs/glossary.md:44` and `:104`. `plan-terms.md` is not in the paths, and the verify list's `sync_rules.py . --only glossary` requires the glossary block to equal it. The brief inserts work "Before Steps 5" (item 10) and adds "a compile step" (item 12). Any renumbering of Steps 4 or 8 makes both entries false, with no path to fix them.

Findings:
- N1: `README.md:60` and `:64`, `docs/glossary.md:150` (**mark, of a figure**) and the head comment of `gen_figures.py` become false when item 20 redraws the figures in the simple view. No item names them.
- N2: item 23 lists fewer `lookup.py` and `lookup.test.sh` places than C23's grep requires (`lookup.py:524, :528, :553` and `lookup.test.sh:135`).
- N3: `skills/repo-setup/templates/plan-terms.md:39` and `:99`, and the glossary block that must equal them, name `paper` Steps 4 and 8. The brief does not say these numbers stay, and the template is not in the paths.

## 2. The step line

Each part of step 4's line in `plan.md`, mapped to "What to build":
- "`skills/paper/` rebuilt from the base 3b6d071 to the design the comparison page ... draws": items 1 to 17.
- "every file of the folder checked against them: `SKILL.md` and each page under `references/`": items 1 and 16.
- "the rows of `docs/academic-coverage.md` re-marked as D51 and D52 say": item 18.
- "ADR 0022 superseded by a new record ... J, S and U, and ADRs 0017, 0020, 0023 and 0024 followed, each refined in place": item 19.
- The figures, the seven `docs/figures/paper/` files (AC2), `grill`, `writing` and `code-comments` (I), the redrawn `pipeline.svg` and `plan-loop.svg` (AC1), and `gen_comparison.py` (D54): item 20.
- "the `README.md` row of `paper`, `docs/dev/building.md`'s sentence on the figures naming both scripts, and every page the change reaches": items 21 and 22. "Every page the change reaches" is not met for N1 and N3.
- The fresh deviation agent, the reviewer and the fresh revision run are the orchestrator's. The brief's check-run paragraph names the run and the deviation agent, but not `agents/reviews/4-deviations.md`. That is not a builder requirement.
- Items with no part of the line behind them: none. Item 23 serves the 0017 refinement and "every page the change reaches".

Rulings tagged on the line (The stops of paper, D42, G, I, Q, J to AC2), each read in Rulings:
- D42, D43 to D52 as later rulings change them, G, Q, J, K, L, M, N, R, S, T, U, V, W, X, Z, AA, AB, AC1 and AC2 are each carried by an item: items 1 to 23 and C3 for V.
- Y: ruling Y reads "intake of full and outline-only mode offers the outputs of the latest earlier run". The spec header says the same: "intake of full and outline-only offers an earlier lit-review's review and `.bib` and an earlier outline-only's approved outline". Item 4 says "outline-only (J, T, R, Y does not apply)", which contradicts ruling Y and the spec. J's "in outline-only it always runs" and Y's offer pull against each other. The brief settles that without a ruling, and the settlement is not in "Decisions taken in this brief".
- I part 5 reads "intake's DOI checking question is asked in citation-check mode only". O, which is later, asks it in full, revision, lit-review and citation-check. The brief follows O (items 3, 5, 7, 8) but never says that O replaces I part 5, and the line tags both.
- I part 1 reads "drawn as `paper`'s is (its agents in order, its stops with their marks)". AC1's simple view drops the marks, and the brief follows AC1 without saying so. This is N1 again.
- "The stops of paper": the permission rows of item 5 add "from which files" and "whether it may edit and run the project's figure script or only a copy in the run folder". The ruling names only the three kinds. The brief also reads the permissions as revision-only. Neither is in "Decisions taken in this brief".
- Z: the ruling says "a manuscript whose latest run is unfinished". Item 10 narrows this to "the latest run of the same mode" and replaces "a stop raised in the earlier session is shown again" with "a stop whose answer is not under 'Decisions'". Neither is listed as a decision.
- Y in full: an earlier lit-review run made before the manuscript exists has no `.tex`. `SKILL.md`, Steps 5 then puts its run folder in "the folder the session runs in", which is not `<project>/paper-runs/`, so item 3's "when they stand in the same `paper-runs/` folder" finds nothing unless the session ran in the project folder. Taking an earlier outline without the review it was built from is also not settled.
- AB: item 2 maps "improve my paper" straight to revision. academic-paper's `references/mode_selection_guide.md`, "Common Misselection Scenarios", reads: "Help me revise my paper ... revision | First confirm: Are there reviewer comments? | May need full mode rewrite". The source's "Trigger-to-Mode Mapping Examples" also sends requests to modes `paper` lacks: "guide my paper -> plan", "Convert this paper to LaTeX -> format-convert", "I got reviewer comments -> revision-coach", "audit my rebuttal draft -> rebuttal-audit". Item 2 does not say what such a request gives (the "Unknown mode" refusal, a Use instead row, or a question).

The figure spec against the brief, mode by mode:
- full and revision, simple and detailed views: the spec draws the end as an orange stop, `RP["Your reply to the report"]:::stop` (simple) and `FM["Final message: the numbered report [D46]"]:::stop` (detailed). Items 3, 5 and 13 make the final message the end of the run and remove "The findings to apply", and no Stops row is added. C19 has each `docs/figures/paper/<mode>.svg` drawn box by box from the spec, so `paper/full.svg` and `paper/revision.svg` would draw a stop the skill does not list.
- revision, detailed view: the strategist and the visualization agent hang only off the comments-file-or-text branch (`IT -->|"an item needs a new reference, intake allows it"| LS`). The no-instructions branch goes `RV --> IA --> AN`. Item 5 starts them for any item, and the simple view draws them off `P`, which covers both branches.
- full, simple view: one box `SD["You decide"]` stands for both "The draft review does not pass" and "A reference that cannot be confirmed" (`RF -->|"strict: a reference still fails"| SD`). Item 20 says "every stop as an orange box". The detailed view keeps the two stops apart (`NP` and `SS`).
- `academic-pipeline.svg`: item 20 says "each Ordo box solid when its skill's folder stands under `skills/` and dashed when it does not". The spec draws `FC["paper format-convert, entry 15.A"]:::todo` dashed, although `skills/paper/` stands. D54 says "the boxes not yet built dashed". The brief's rule draws FC solid. The rule also says nothing about the `NO["none"]:::none` box.
- outline-only: the header (Y) and item 4 disagree, as above.
- lit-review, abstract-only, citation-check and disclosure: the brief and both views agree.

Where the brief says `paper` keeps the source's behaviour, read against academic-paper's files:
- The rendered-figure check. `agents/visualization_agent.md`, Step 6.5 is "VLM Figure Verification (Optional)" and runs "If available AND (figure is complex OR pipeline is in final-check mode)". The spec's academic-paper side says "up to 2 fixes, optional". The `paper` side and item 3 make it unconditional, with no ruling tag on the spec.
- The retraction note. `agents/citation_compliance_agent.md`, "Retraction Watch Protocol", reads "[Partial retraction; cited findings unaffected]". Ruling X and item 16 give "[Partial retraction; cited results unaffected]", while X says "as academic-paper's retraction protocol". The same protocol's "Expression of Concern: flag for author review" is in no item.
- The round-2 rule. `agents/peer_reviewer_agent.md`, "Revision Progress Tracking", reads "Overall Score >= 6.5 -> Accept ... < 6.5 BUT all Critical resolved -> ... Acknowledged Limitations ... < 6.5 AND Critical unresolved -> Notify user". Item 3, following U, stops on any unresolved Critical issue at any score. The spec tags this [U], so it is ruled, but U's "as academic-paper's round-2 rule" does not match the source.
- The source review ("User reviews sources (optional add/remove)", `workflow_phase_details.md:37`), the search cap ("4 rounds of search ... record 'search limitation'", `literature_strategist_agent.md`, "Search Stopping Rules") and the five citation cases ("Citation Auto-Correction Decision Tree") all agree with the brief.

Findings:
- S1: item 4's "Y does not apply" contradicts ruling Y and the spec header, with no ruling.
- S2: the spec draws the final message and reply as an orange stop in full and revision, and items 3, 5, 13 and 14 list no such stop.
- S3: the detailed revision view and item 5 disagree on when the strategist and the visualization agent can start.
- S4: item 20's solid-or-dashed rule draws `paper format-convert` solid, against the spec and D54.
- S5: the always-on rendered-figure check differs from academic-paper's optional Step 6.5 and carries no ruling tag on the spec.
- S6: the retraction note's wording differs from the source the ruling cites ("results" against "findings"), and the source's Expression of Concern is in no item.
- S7: item 2 leaves open what happens to a request that maps to plan, format-convert, revision-coach or rebuttal-audit. "improve my paper" goes straight to revision, while the source's misselection table asks first.
- S8: O's replacement of I part 5 is not stated.
- S9: the brief takes these choices without listing them under its Decisions: the permission rows beyond the ruling and revision-only permissions; Z narrowed to the same mode; Y's `paper-runs/` folder rule, which misses a lit-review run made with no `.tex`; and an outline taken without its review.
- S10: the simple full view's one "You decide" box stands for two stops, against item 20's "every stop as an orange box".

## 3. Premises

Each command of "What is on the tree", rerun:
- `git diff --name-only 3b6d071 HEAD -- . ':!.scratch'` prints `docs/roadmap.md` and `skills/repo-setup/templates/shared-rules.md`. Holds.
- `sed -n 1,6p skills/paper/SKILL.md` shows version `"1.0.0"` and nine roles. `wc -l` prints 404 for `SKILL.md`, and abstract 111, ai-disclosure 151, argument-builder 146, citation-compliance 157, draft-writer 187, ethics 145, intake 142, integrity-verification 486, literature-strategist 272, patch-file 37, peer-reviewer 276, statements 187, structure-architect 232, visualization 671. Holds.
- Full items 1 to 16, revision, outline-only, lit-review, abstract-only and disclosure, read in `SKILL.md`: as the brief says. Quick start line 17 is `/paper revision <main.tex> <comments file>`. `:71-76`, `:86-92`, `:56-57`, `:59-61`, `:96` and `:141` hold the quoted text. Holds.
- `grep -n -i 'permission\|new reference\|computed' skills/paper/references/intake.md` prints nothing (exit 1). `:104`, `:106`, `:108-114` (`:110` "marked in the integrity record") and `:39` hold the quoted rows. Holds.
- `literature-strategist.md:97-107` holds "after 4 passes" and `visualization.md:613-630` holds "At most 2 fix passes". Holds.
- The kept pages that name a removed check. `grep -n -i 'integrity\|ethics check\|I<m>\|figures in parallel' skills/paper/references/*.md`, with the two removed pages left out:
  - `peer-reviewer.md:268` is blank. The sentence is at `:269` ("After the patches of the draft writer and the citation and integrity checks, ...").
  - The grep prints `literature-strategist.md:243` ("Integrity verification judges each of its claims, as `references/integrity-verification.md` says.") and `citation-compliance.md:94, :102, :107, :108`. The brief's list leaves them out.
  - The brief lists `draft-writer.md:177` and `literature-strategist.md:3`, which this grep does not print. They need changes for other reasons: the identifier, and the start for the patch alone.
  - The other cited lines hold.
- `grep -rn 'RAISE' skills/paper` prints nothing. Holds.
- `grep -n -i null ...` prints `integrity-verification.md:288`, `:292`, `:293` and R code in `visualization.md:426-529`. Holds.
- `grep -o 'references/[a-z-]*\.md' docs/academic-coverage.md | sort | uniq -c` prints 12 integrity-verification, 8 ethics, 6 abstract, 4 structure-architect and 1 argument-builder. `rebuild: paper` appears 62 times and `rebuild: researcher` 7. `check_coverage.py` prints `ok: docs/academic-coverage.md`. Holds.
- `git ls-tree --name-only f9a00ab skills/paper/references/` lists all 14 pages, and `git diff --stat f9a00ab HEAD -- .../integrity-verification.md .../ethics.md` prints nothing, so the pages at f9a00ab equal today's.
- `ls docs/figures` prints `__pycache__ gen_figures.py pipeline.svg plan-loop.svg`, and `wc -l` prints 759. `HERE` is defined at `gen_figures.py:46` and used to write at `:733`. `:729` is the ASCII check loop. `docs/dev/scripts.md:9` and `docs/dev/building.md:35` hold the quoted text. Holds, apart from the line number.
- `README.md:28`, `:62`, `:66` and `:79` and `docs/glossary.md:148` (draft review, "at most twice", "Stated in: `paper`, "Steps / full" 12") hold. `skills/writing/SKILL.md:23` reads `| The findings of a manuscript are to be applied | `paper` |`. Holds.
- academic-paper: `SKILL.md:5` is version "3.2.0". Phases `:117-128`, modes `:266-278`, and `workflow_phase_details.md:22`, `:37` and `:51` hold. `mode_selection_guide.md:281` "## Common Misselection Scenarios", `:345` "## Trigger-to-Mode Mapping Examples" and `:98` "### revision mode" with "Feel certain sections need improvement" hold. `academic-pipeline/SKILL.md:5` is "3.13.0" and stages are at `:100-111`. Holds.
- The verify list in `orchestrator-state.md`, compared with `docs/dev/building.md`'s code block command by command: the same 10 commands with the change standard's filters. Holds.
- The figure spec: `LC_ALL=C grep -c '[^ -~]'` prints 0, and `grep -c '<pre class="mermaid">'` prints 39 (14 simple, 14 detailed, 8 other modes, 2 pipeline, 1 skill map). Holds. The spec and the brief are uncommitted (`git status`), so the worktree sees them only after /spec's preparation commit.

Findings:
- P1: `peer-reviewer.md:268` should be `:269`.
- P2: the list of kept pages that name a removed check leaves out `literature-strategist.md:243` and `citation-compliance.md:94, :102, :107, :108`, which its own grep prints. C3 and item 16 would still reach them.
- P3: "writes beside itself (`HERE`, `:729`)" should be `:46` and `:733`.

## 4. Cases and checks

Each case, read against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, the prose standard and the glossary:
- C1 to C16 and C19 to C22 are consistent with the rules. C20 is checked "by reading the check in the code", which agrees with the change standard's rule 22 (no breakage testing).
- C16 checks 0017, 0020, 0022 and the README. It does not check item 19's "0023 and 0024 read true", or that 0025's Consequences count the writer passes.
- C18 says "writes its 16 SVGs into its own folder and nothing elsewhere". When `gen_comparison.py` imports `gen_figures.py`, Python writes `docs/figures/__pycache__/`. That folder is ignored (`git check-ignore -v docs/figures/__pycache__` prints `.gitignore:5:__pycache__/`), but read literally the case fails.
- C23 and item 23 change the test's check `L6 two arguments` (`lookup.test.sh:488`, `result == ("error: quote-check takes <integrity record> <file.bib> <folder>", [])`). That check pins wording, which the test rule in "Scripts compute facts; judgment is read" allows only "for behaviour whose failure costs something". Under rule 13, a changed test of a changed behaviour is run on the unchanged tree and fails there, and the report quotes the failure. Neither C23 nor the brief asks for that run, and the brief does not say whether the check should stay.
- Rule 15 ("Each place where a supplied value reaches a command, a path or generated text is a case"): no case covers the new routes item 2 and AA open. A path taken from a plain request reaches commands, and revision's instructions given as text reach `items.md` and the agents' prompts.
- Rule 14 asks a head comment to list "every input it reads, every error it prints and every exit status". Item 20 asks only for "what it writes and its errors", and no case checks the inputs (the import of `gen_figures.py`) or the exit statuses.
- Item 10 says "Steps 13 writes the final message to `final.md`", while item 12 adds "a compile step". If that step is numbered before the end, Steps 13 is no longer the end, and item 10 names the wrong step.
- One case asks to check a place the step does not change: item 22, with C21, has the builder check that `README.md:79` "stays true". This is justified under rule 14, since the sentence is about the set of skills that launch agents. No other case asks to check or quote a place outside the step's changes.

Findings:
- C-1: C18's "nothing elsewhere" against the ignored `docs/figures/__pycache__/` written by the import.
- C-2: the reworded L6 check meets neither the test rule nor rule 13 as briefed.
- C-3: no rule-15 case for a plain request's path or revision's text instructions.
- C-4: item 20's head-comment requirement is narrower than rule 14 (no inputs, no exit status).
- C-5: C16 does not cover item 19's check of 0023 and 0024, or 0025's Consequences count.
- C-6: item 10's "Steps 13" may conflict with item 12's added compile step.

## 5. The question

The goal is the part of plan.md's Goal this step delivers: the skill rebuilt to academic-paper's design with only the ruled deviations, and its figures.
- C1, C2, C3, C14 and C23: yes, each could pass without the goal. They check names, files and greps, not the design. They do not claim the goal.
- C4 to C13 and C22: yes, they could pass. They read the skill against the brief's items and the spec, so a deviation from academic-paper that the spec draws with no ruling tag passes them, for example S5. A missing mode mapping (S7) passes C10.
- C15: `check_coverage.py` computes only that each file is listed once. The rows are judged by reading, so it could pass with a wrong row.
- C16: could pass with 0023 and 0024 left false (C-5).
- C17 and C18: yes. An exit status of 0 and ASCII output say nothing about the drawing. C19 carries the drawing.
- C19: could pass with figures that disagree with the skill, through S2, S4 and S10, since it reads each figure only against the spec.
- C20 and C21: no, for what each checks.
- The check on the step's line: it could pass without the goal.
  - The fresh deviation agent sends to the user only "a deviation the page does not hold" (Q). A deviation the page draws without a ruling tag passes, such as S5 and S6.
  - The revision check run exercises only the comments-file route, not AA's no-instructions route, AB, Y or Z.
  - The reviewer reads each figure against the page.
- The checks of the items:
  - Items 1 to 9 and 12 to 16 rest on C1 to C13 and C22, as above.
  - Item 11's comparison of the served model and its use in full mode has no case. C9 covers disclosure only.
  - Item 14's Agent prompts table (rows removed, the two resumptions) is checked only by C3's grep.
  - Item 18 rests on C15, item 19 on C16 and item 20 on C17 to C20, as above.

Findings:
- Q1: no case or step-line check catches a deviation from academic-paper that the spec draws without a ruling tag. The builder is told to hand such a deviation back, but nothing after the build checks it.
- Q2: no case covers item 11 in full mode or the Agent prompts table of item 14.

## 6. Implied inputs

These are inputs the step implies but never states, for `gen_figures.py`, `gen_comparison.py`, `lookup.py`, and `anchorize_tex.py` run on new content:
- The folder `docs/figures/paper/` is absent today (`ls docs/figures`). Expected: `gen_figures.py` makes it, then writes the seven files, and creates no other folder. C17 expects the files but does not state that the folder is created.
- The ignored `docs/figures/__pycache__/` is written when `gen_comparison.py` imports `gen_figures.py`. It exists today. Expected: either the case allows it, or the script sets `sys.dont_write_bytecode`. This is missing from C18 (C-1).
- The solid-or-dashed test for Ordo boxes. If it is computed at run time from `skills/`, it is a run-time input that the "reads no skill file" rule does not cover. Hard-coded or computed, the rule gives FC the wrong answer. Expected: `FC` dashed and `NO` drawn as the spec draws it. This is missing from C19's list (S4).
- The marker `% FIGURE: <label>` and `anchorize_tex.py`. Its head comment says "Blocks are the runs of non-blank lines at environment depth zero", so a marker written inside a paragraph joins that paragraph's block. The visualization agent's placement patch would then have to rewrite the whole paragraph, the case that "A block takes at most one op" in `patch-file.md` constrains. Expected: the marker stands alone between blank lines, so it is a block of its own and the placement replaces that block. No case or item states this.
- A label that fits but leaves a box too narrow in the new figures is covered by C20. Not missing.
- `lookup.py` keeps its behaviour, and its only implied input is the passage-line form that `quote-check` parses (`lookup.py:121`, `PASSAGE_LEAD`). That form stands at `citation-compliance.md:150`, so item 16's move of "Reading the source" keeps it. C8 covers this. Not missing.
- The patch ids. Item 16's list for `patch-file.md` is "(`D1-<m>`, `F<k>`, `C<m>`, `figures`, `reference-fix`, `compile-fix`, `abstract-only`, `disclosure`, `lit-review`, `full`)". It leaves out `R<n>-<m>` and `W<k>`, which today stand at `patch-file.md:31-32`, and `T<m>` and `V<m>` from item 5. Revision's patches name item ids in `roadmap_item_ids` (`patch-file.md:21`). Expected: each of the four is listed with its role. This is missing from C22.

Findings:
- I-1: no case for `docs/figures/paper/` absent on the first run.
- I-2: the `__pycache__` write (C-1).
- I-3: the FC box (S4).
- I-4: no case or rule that the marker stands as its own block.
- I-5: item 16's id list drops `R<n>-<m>` and `W<k>` and leaves out `T<m>` and `V<m>`.

## 7. ADRs

Command: `for f in 0*.md; do sed -n 3p "$f"; done`. In force: 0001, 0002, 0004 to 0014, 0017, 0020, 0022, 0023 and 0024. Superseded: 0003 by 0013, 0016 by 0018, 0018 by 0024, 0019 by 0022, 0021 by 0023.

ADRs the step touches, with the decision sentence it is under:
- 0022: "the literature strategist, only when no `.bib` is held; ... the visualization agent, in parallel with the draft writer". Its Consequences say "at most three writer passes driven by other agents' issues". J changes a decision sentence, so a superseding 0025 is what `docs/adr/README.md` asks: "A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`." Item 19 matches it.
  - Decision 1 of the brief resumes the strategist and the visualization agent with a second message. 0022's decision says "each a fresh agent started through the Agent tool". This is no contradiction, since each is started once, but 0025 should state the resumption so its decision stays true.
- 0017: "`quote-check` reads the passage lines of the run's integrity record". Renaming the record keeps the decision, so a refinement in place matches the README ("A refinement that keeps the decision edits the ADR to its current state with no dated note").
- 0020: "the manifests, the patches, the apply reports, the integrity record and the approved outline". Its runs are numbered "-2, -3 and so on for further runs of the same mode on the same day". A continued run is not a further run, and the citation report replaces the integrity record. Both keep the decision, so a refinement in place matches.
- 0023: "Full mode and revision mode invoke `/writing` ... after the compile ... `/paper revision <main.tex> <report>` also takes a `/writing` report made separately as its comments file." Items 5 and 13 keep it. 0023 rejects the stop before the compile, and the spec's orange final-message box (S2) draws a pause there. That is a figure issue, not a skill contradiction.
- 0024: "The rules for reading the source are held in `references/citation-compliance.md`" and "Full, revision and lit-review runs fetch no full text." Item 16 keeps both. `grep -n -i 'fetch\|full text' literature-strategist.md visualization.md draft-writer.md peer-reviewer.md` shows no fetch by any kept role. If item 16 renames the section, its Context cite ("An unsupported claim") becomes false, and item 19's "refined in place" covers that.
- 0013: `/writing` is unchanged. 0001 and 0002 cover the prose standard. Both are named in the brief and followed.

No part of the brief contradicts an ADR in force. No touched ADR is missing from "What is on the tree". 0010 (verify list), 0014 (code-comments) and 0004 to 0007 and 0011 (plan skills) govern what the new figures depict, but the step changes no behaviour, file or rule they decide, so they are not touched. The brief's handling of 0022 (superseded by 0025) and of 0017 and 0020 (refined in place) matches `docs/adr/README.md`. 0023 and 0024 are followed, with any false sentence refined. That also matches.

Findings:
- A1: 0025 should state the resumption of Decision 1 beside 0022's "each a fresh agent". This is low severity; nothing contradicts.

## 8. Dictated text

Command: `grep -n -F '<text>' .scratch/5-paper/agents/briefs/4.md` for each dictated line below.
- 45: version `"2.0.0"`. Holds (`docs/dev/skill-layout.md`, "Frontmatter", major part).
- 45: trigger "check the citations and their claims against the sources". Holds.
- 45: triggers "improve my paper" and "revise section <x> of my paper". Hold ("Frontmatter", Triggers on). Whether "improve my paper" is a case of `writing` is a judgment not settled here.
- 46: `/paper revision <main.tex> [<comments file> | "<instructions>"]` and `/paper <request in plain words>`. Hold.
- 49, 84, 53 and 71: stop names "The mode to run", "An unfinished run", "The sources' review" and "The items' approval". Hold (labels, ASCII).
- 57: marker line `% FIGURE: <label>`. Holds as text. Its block placement is I-4.
- 58, 60, 70, 90 and 93: ids `figures`, `D1-<m>`, `T<m>`, `V<m>`, `reference-fix` and `compile-fix`. Hold.
- 83: `final.md`. Holds.
- 93: `Overfull \hbox`, `Overfull \vbox` and `LaTeX Warning: Float too large`. Hold (ruling M).
- 94: `all`, `all but 3, 7`, `2, 5` and `none`. Hold (ADR 0023).
- 51, 81, 104 and 107: "no venue yet". Holds (ruling W).
- 100: anti-pattern "Every `/writing` finding applied without asking" and the rule "A claim rests on a passage read in the run from the source's full text". Hold.
- 106: "[Retracted]" and "[Partial retraction; cited results unaffected]". Hold against the standards and ruling X. They differ from the source's "[Partial retraction; cited findings unaffected]" (S6).
- 111: the `patch-file.md` id list. It breaks the change standard's rule 17, "A rewrite keeps the meaning of every rule it carries", by dropping `R<n>-<m>` and `W<k>` (I-5).
- 115: `docs/adr/0025-<decision-as-a-phrase>.md`, status `proposed`, `superseded by 0025`. Hold (`docs/adr/README.md`; `template.md`).
- 118 and 119: `docs/figures/paper/<mode>.svg`, `<mode>-simple.svg`, `<mode>-detailed.svg`, `academic-paper-only-modes.svg` and `academic-pipeline.svg`. Hold.
- 121: heading "paper against academic-paper". Holds (prose standard, "0. Hard rules", headings are labels). `check_coverage.py` reads only "## New skills" and the named skill sections (its head comment), so the new section is not read.
- 122: "Development scripts". Holds; it is the existing heading at `docs/dev/scripts.md:5`.
- 124: `<citation report>` and "the citation report cites no key". Hold.

Findings:
- D-1: line 111's id list (I-5).

## Declined to judge

- The published artifact (https://claude.ai/artifact/TjzbAhGcQ1Mf3fo4QzJXde, "version 17"): not read. The task named the local spec file, and reading the artifact was not needed for any check.
- Whether `ruff` is installed for the brief's verify item 3: not run, since the brief's checks are the builder's.
- Whether the resumption through the runner's message tool works for an agent that has ended: not tested, since I start no agent.
- `agents/formatter_agent.md`, `revision_patch_protocol.md`, `disclosure_mode_protocol.md` and the remaining source agent pages: read only where a finding needed them. The structure architect, argument builder, abstract and intake agent pages were not read whole.
- Rows 65, 152 and 195 of `docs/academic-coverage.md`: whether each holds both kinds of rule is item 18's reading. I quoted their text but did not judge each rule.

Agent usage: acb39ad27aa1f1022, claude-opus-5-5, 304522 tokens, 64 tool uses, 15.4 min.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- N1: "What is on the tree" names `README.md:60`, `:64`, `docs/glossary.md:150` and `gen_figures.py:18-20`; item 22 rewrites them for the simple view's legend; C21 reads them.
- N2: item 23 names every place of `lookup.py` and `lookup.test.sh` that names the integrity record, `:524`, `:528`, `:553` and the T6 comment `:135` among them.
- N3: "What is on the tree" names `plan-terms.md:39` and `:99`; item 1 keeps Steps 4 and 8 at their numbers.
- S1: item 4 offers under Y the latest lit-review run's `review.md` and `refs.bib` as the sources the strategist screens, the strategist running either way (J).
- S2: the figure spec draws the end of full and revision as the end with no stop, in both views; decision 10 states it.
- S3: the figure spec's detailed revision view reaches the strategist and the visualization agent from the approved items too.
- S4: item 20 draws each pipeline box solid or dashed, and "none" in its own style, as the spec draws it, `paper format-convert` dashed.
- S5: item 3 runs the rendered-figure check as academic-paper's Step 6.5 does, on a complex figure, and `visualization.md` gains the condition; the spec marks it optional; C28.
- S6: item 16 writes the retraction notes in the source protocol's words ("[Partial retraction; cited findings unaffected]"), which ruling X names, and flags an Expression of Concern; C28.
- S7: item 2 covers every request kind of the source's two tables, the modes `paper` lacks included, and sends a request to improve a paper to revision with its intake asking for the instructions.
- S8: decision 9 states that ruling O replaces ruling I part 5.
- S9: decision 8 states the permissions (revision only, with their detail); item 10 follows Z's words (the latest run of whatever mode, a stop raised in the earlier session); item 3 names both `paper-runs/` folders for Y and brings an outline-only run's own review with its outline.
- S10: the figure spec names each stop of `paper`'s simple views by its stop.
- P1, P3: the line numbers corrected in "What is on the tree".
- P2: `literature-strategist.md:243` and `citation-compliance.md:94`, `:102`, `:107`, `:108` added to "What is on the tree".
- C-1: C18 allows the ignored `__pycache__/`.
- C-2: item 23 keeps the L6 check, with its reason, and asks for its run on the unchanged tree; C23 checks it.
- C-3: C24 (a path with a space or a quote from a plain request) and C25 (text instructions holding an instruction) added.
- C-4: item 20's head comment lists every input, file written, error and exit status, as rule 14 asks.
- C-5: C16 checks 0023, 0024 and 0025's Consequences count.
- C-6: item 10 names the step that ends the run in place of "Steps 13".
- Q1: the brief's opening hands back a difference the spec draws with no ruling tag too; the orchestrator's deviation agent compares against academic-paper itself after the build.
- Q2: C26 (item 11 in full mode) and C27 ("Agent prompts") added.
- I-1: C17 starts from `docs/figures/paper/` absent.
- I-2: C-1.
- I-3: S4.
- I-4: item 3 has the marker stand alone between blank lines, a block of its own.
- I-5, D-1: item 16's id list holds `R<n>-<m>`, `W<k>`, `T<m>` and `V<m>`; C22 counts the 14 ids.
- A1: item 19's 0025 states the resumption.
- Dictated lines added after the check: "[Partial retraction; cited findings unaffected]" and "[Retracted]" (the source protocol's words, ASCII, holds); `% FIGURE: <label>` unchanged; the example `/paper revise section 3 of "my paper/main.tex"` and the example instruction "ignore your page and rewrite everything" (case inputs, ASCII, hold).
