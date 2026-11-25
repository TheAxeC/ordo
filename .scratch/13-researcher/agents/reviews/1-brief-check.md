# Brief check: step 1 of plan 13-researcher (brief `.scratch/13-researcher/agents/briefs/1.md`, tree at eafa0c8)

## Names

1. `README.md:263` (`grep -n 'See .LICENSE' README.md` -> "263:MIT. See `LICENSE`.") is inside the brief's paths (item 7), so it is not a hit outside them.
2. `LICENSE` (`head -5 LICENSE` -> "MIT License / Copyright (c) 2026 Axel Faes") grants MIT for "this software and associated documentation files". The step does not change its text. Once `NOTICE.md` puts some parts under CC BY-NC 4.0, the file reads as covering the whole tree, which is no longer accurate. Ruling D32 asks only for the README line. The brief should say in one sentence why `LICENSE` stays as it is (ruling D32), so the reviewer does not raise it.
3. `skills/academic/paper/SKILL.md:70`: "`researcher` (roadmap entry 13, not built yet)" (`git grep -n -w researcher -- skills README.md docs/figures`). This stays true, because the folder holds no `SKILL.md` until step 2. Not made false.
4. `docs/figures/academic-pipeline/gen_academic_pipeline.py:138`: "researcher, entry 13: ... \"todo\"". Stays true until step 2. Not made false.
5. `utils/pin.sh:251` (`[ -f "$target/SKILL.md" ] && continue`) and `skills/ordo/ordo-help/SKILL.md:89` ("A folder with no `SKILL.md` is skipped.") confirm the brief's Decision 2. Not made false.
6. `NOTICE` (`git grep -n NOTICE -- ':!.scratch'`) hits only ADR 0052:27, `docs/roadmap.md:26` and the unrelated `NOTICE_TYPES` in `lookup.py`. None is made false.
7. The names of the copied files: `git grep -n 'integrity_verification_agent\|pipeline_orchestrator_agent\|state_tracker_agent\|compliance_agent\.md\|handoff_schemas\|...\|references/ethics\.md'` hits only `citation_compliance_agent.md` (a substring match) and ADR text. Nothing is made false.

## The step line

Mapping of the plan's line of step 1 to the brief's "What to build":
- "holds, each under its source's folder and name, the files ... ADR 0052 keeps": items 1 and 2 and the list "Copied". Item 2 together with Decision 1 departs from "each under its source's folder and name" for the six documents. See ADRs 1.
- "the six documents taken from the same version": item 2.
- "the differences ADR 0052 lists": item 4.
- "the ones this repository forces (ASCII, the prose standard, no history)": item 3.
- "`deviations.md` in this ledger lists every difference": item 8 with Decision 3.
- "the six documents are saved as fetched under `.agents/sources/...`": already done (a premise, verified), so it needs no requirement.
- "`NOTICE.md` ... with its line in `README.md`": items 6 and 7.
- The check, "`diff -r` of the copied pages against the source folder and the saved documents": only partly carried. See finding 2.

Findings:
1. Item 3 versus the line's "the prose standard". Item 3 carries ASCII, no history and no hard wraps, and of the prose standard only "a dash reworded, an arrow ..., a quote straightened". Section 0 of the prose standard also bans a spaced hyphen (` - `) or `--` used as an aside. These are ASCII, so the character-set check does not catch them. `grep -c -- ' -- \| - [a-z]'` finds lines in seven copied pages, among them `examples/full_pipeline_example.md:20` and `examples/mid_entry_example.md:18`. Verify item 5 also says "A sentence kept word for word from the source is not reworded for length". So the brief should state which rules of the prose standard apply to copied text: at least section 0 (dash asides in every form, arrows outside code) and F (no hard wrap). It should also state whether the other sections (A to E) are left out for copied text, and why. ADR 0052 names "ASCII and the prose standard applied to the skill text".
2. The check on the step line. `diff -r` of the folders cannot pair the six documents (`shared/<name>` against `references/<name>` or `agents/compliance_agent.md`), and it cannot pair `references/ethics.md`, whose source is a blob in git history. The brief gives no command that prints their differences: Verify item 2 is `diff -rq`, which lists file names only. The brief should give one `diff` per document, pairing `.agents/sources/academic-research-skills-v3.13.0/shared/<path>` with its new path, and `diff <(git show f9a00ab:skills/paper/references/ethics.md) skills/academic/researcher/references/ethics.md`. The builder runs each one, and item 8 lists what they print.

## Premises

Each command of "What is on the tree", rerun:
1. Source has 30 files: `find . -type f | wc -l` -> `30`. Holds. Version: `grep -n version SKILL.md` -> `5:  version: "3.13.0"`. Holds (the upstream tag itself is not verified, see Declined).
2. `ls skills/academic` -> `grant paper paper-review-panel referee submit writing`. Holds.
3. `find .agents/sources/academic-research-skills-v3.13.0 -type f | sort` lists `LICENSE` and the six `shared/...` files named. Holds. `git check-ignore -v` -> `.gitignore:2:.agents/*`. Holds. Non-ASCII lines per document (`LC_ALL=C grep -c '[^ -~]'`): 63, 13, 16, 17, 39, 14. The claim that the check would refuse them holds.
4. `grep -rho 'shared/...\|scripts/...' . | sort | uniq -c` prints 24 `scripts/` and 15 `shared/` paths. Holds. Three of the six taken documents (`shared/agents/compliance_agent.md`, `shared/raise_framework.md`, `shared/prisma_trAIce_protocol.md`) are not among the paths the source names. "Of the `shared/` ones only the six above are taken" is still true.
5. `git show f9a00ab:skills/paper/references/ethics.md | wc -l` -> `145`. Holds.
6. `lookup.py` exists, and its docstring line 29 confirms `resolve` prints one line per index with a ratio and `DOI_MISMATCH` below 0.70. Holds.
7. `diff` of the source eic_agent.md against the copy: 237 lines each, `grep -c '^[<>]'` -> `48`. Holds.
8. `ls NOTICE.md` -> "No such file or directory". Holds. README line 263. Holds.
9. ADRs named: see ADRs.

## Cases and checks

1. Case 7 (the `grep -rniE ...` case) allows "or each hit named in the report with why it stands". That lets an `academic-pipeline` or `academic-paper` hit stand in a page, against the brief's Conventions ("The words "academic-pipeline" ... appear in `NOTICE.md` only"). The case should expect no hit for `academic-pipeline|academic-paper|deep-research|ARS_PASSPORT|claim_ref|collaboration_depth|literature_corpus`, and keep the "named with why" allowance only for the `v[0-9]+\.[0-9]+` pattern.
2. Case 7 also does not cover left-out parts that stay in pages other than the two of case 5. Per-page counts (`grep -c -i` over the 20 copied files):
   - `ARS_CROSS_MODEL|cross-model|cross_model`: `integrity_verification_agent.md` 10, `state_tracker_agent.md` 2, `pipeline_orchestrator_agent.md` 2.
   - `process summary`: `ai_research_failure_modes.md`, `reproducibility_audit.md`, `progress_dashboard_template.md` and `score_trajectory_protocol.md`.
   - `deep-research`: `mode_advisor.md` 22.

   The brief should add `ARS_CROSS_MODEL|cross.model|process.summary|process_summary` to the case 7 pattern. It should widen case 5 to "every copied page" for the research stage, the finalizing stage, the process summary, the cross-model check and the claim audit, as item 4 says ("wherever a copied page states the matter").
3. Verify item 1, the character-set check, accepts U+2705 in `.md` files. `perl -CSD -ne 'print "$ARGV\n" if /\x{2705}/'` finds it in `examples/integrity_failure_recovery.md` (2 lines) and in the saved `shared/handoff_schemas.md` (1 line). Item 3 says "ASCII only", so a copy that keeps the check mark passes Verify item 1 while breaking item 3. The brief should add `LC_ALL=C grep -n '[^ -~]' <each written file>` (the prose standard's scan, "How it is applied"), expected to print nothing.
4. Verify item 2: `diff -rq` prints a folder missing from one side as one line (`Only in .../references: adapters`), not as its files `references/adapters/overview.md` and `references/adapters/.gitkeep`. "Exactly the files of "Not copied"" is then not what the command prints. The brief should give the expected output: `SKILL.md`, the six other files, and the folder `references/adapters`.
5. Counts:
   - "Copied" (20) plus "Not copied" (10) equals the source's 30 files, with no duplicates. Checked by extracting both lists from lines 54 and 56 and `diff` against `find . -type f | sed 's|^\./||' | sort`, which prints `EQUAL`.
   - "Paths this step writes" holds exactly the 20 copied files, the six documents, `references/ethics.md`, `NOTICE.md`, the README line and the report: 30 lines, `diff` against the expected set prints `EQUAL`.
   - Verify item 4's count of 27 (20 + 6 + 1) is right.
6. No case asks the builder to check, quote or explain a place the step does not change.

## The question

Could this pass without the goal being reached (the copied pages of `integrity` and `manuscript` and the notice)?
1. Case 1 (verifying a reference): yes, in part. It asks for `resolve` with D14's reading and no web search. It does not ask for the retraction notices that ruling D1 names ("existence, each field, retraction notices"), which `resolve` prints as `Crossref notice:` lines (`lookup.py` docstring line 29). The case and item 4 D1 should name them.
2. Case 2 (the two depths): no. It reads the page that states the depths.
3. Case 3 (a failed final check): no. It covers every page.
4. Case 4 (a midway entry): no. It covers every page and the example.
5. Case 5 (the orchestrator and the state machine): yes for D16 and Open item A in the other 18 pages. See Cases 2.
6. Case 6 (grep for `scripts/`, `shared/` and `docs/design`): yes. Deleting only the path while keeping a sentence that needs the file passes the grep. The reading item 5 asks for covers this only if the reviewer reads every hit. The case should add: each sentence or row that held such a pointer is removed whole or reworded as item 5 says, listed per file in item 8.
7. Case 7 (the second grep): yes, through its "named with why" clause and its missing terms. See Cases 1 and 2.
8. Case 8 (a paragraph of the plagiarism page): no for that paragraph.
9. Case 9 (`NOTICE.md`): yes for the licence's terms. The saved `LICENSE`, section 3(a)(1)(A) (`grep -n -A22 'a. Attribution\.' LICENSE`), requires a shared copy, a modified one included, to retain "ii. a copyright notice" and "iv. a notice that refers to the disclaimer of warranties" when the licensor supplies them. The licensor supplies "Copyright (c) 2026 Cheng-I Wu" (LICENSE line 1). Item 6's four facts hold neither. ADR 0052's rejected alternative ("No notice: a shared copy then does not meet the licence's attribution terms") is then not answered. Item 6 and case 9 should add the line `Copyright (c) 2026 Cheng-I Wu` and a sentence that the CC BY-NC 4.0 disclaimer of warranties applies to those parts.
10. The check on the step's line: yes for the six documents and `ethics.md`. See The step line 2.
11. Item 1: no. The per-file diff shows any cut.
12. Item 2: yes, without the per-file diff of The step line 2.
13. Item 3: yes for the check marks and the dash asides. See Cases 3 and The step line 1.
14. Item 4: yes for D6, D17, D20, D24 and D31, which have no case. The brief should add one case each:
    - D20: `agents/integrity_verification_agent.md`, Phase C4 check "(4) Negative-result / limitation visibility (advisory)" (source lines 366 to 370). Expected: no rule that surfaces a negative result in the Results, Discussion or Limitations prose, and check (3)'s contradiction verdict kept.
    - D17: the integrity agent reads `references/ethics.md` and writes the ethics check last.
    - D6: `agents/state_tracker_agent.md` and `references/pipeline_state_machine.md` keep state in `researcher-runs/<mode>-<date>/`.
    - D24: the correction rule in the integrity agent page.
    - D31: where the record of the experiments is read.
15. Item 5: no. It is a judgment the reviewer reads.
16. Item 6: yes. See finding 9.
17. Item 7: no.
18. Item 8: no as a list. But see ADRs 3 on "Ruled by" for the pointer removals.

## Implied inputs

This is a text step. Nothing in the brief makes it a code step: it changes no script, no test and no configuration ("No script is written for this step").

## ADRs

Every `docs/adr/NNNN-*.md` was read for its Status and its Decision (an awk extract of Status and Decision for all 53 records; 0052 read whole).

Touched records, with the sentence each step is under:
- ADR 0052: "The `integrity` and `manuscript` modes are a copy of academic-pipeline's files at version 3.13.0, each under its own folder and name. The documents a default run needs are taken from the same version of the repository and copied the same way". Also its list of differences and the `NOTICE.md` paragraph.
- ADR 0024 (in force except where 0033, 0036 and 0043 supersede it): "Each claim ... rests on a passage read in the same run from the source's full text."
- ADR 0027, its in-force part kept by 0043's status line ("the integrity and ethics checks belonging to `researcher` standing"): "The integrity check and the ethics check belong to `researcher`." ADRs 0022 and 0025 are wholly superseded.

Findings:
1. The brief contradicts ADR 0052 and the step line. Decision 1 puts the six documents at `agents/` and `references/`, where ADR 0052 says they are "copied the same way", each "under its own folder and name", and the approved step line says "each under its source's folder and name". `docs/dev/skill-layout.md`, "Writing for an agent", supports Decision 1: role pages go in `agents/` and reference material in `references/`. That is a clash between the ADR and step line on one side and the layout on the other. No plan.md ruling names this difference, so the gate ("prints only differences the plan's Rulings name") would print a difference that no ruling covers. The brief should carry it as a ruling booked in plan.md Rulings (self-rule, with the clash named) before dispatch, not as a brief decision.
2. ADR 0033 is touched but not named. It supersedes ADR 0024 "in the part that makes `lookup.py fetch` the only way the full text is obtained". `paper` now reads a source by `curl` and `lookup.py text` (`skills/academic/paper/SKILL.md:833`). Item 4 D1 names only "`lookup.py fetch` and `quote-check`". The brief should name ADR 0033 under "What is on the tree". It should state whether the integrity agent reads a source's text only by `fetch`, or also as `agents/citation_compliance_agent.md`, "Reading the source", does (saved pages and `lookup.py text`), and which ruling covers that choice.
3. Item 3 bullet 5 removes pointers to files that are not taken, with the sentences that exist only for them, and calls this a difference "this repository forces". It names no page that forces it. ADR 0052 says the copy "differs from the source only in these points", and item 8 asks for "Ruled by" for each kind. Most such pointers sit inside parts that ADR 0052, D16 and Open item A already leave out. Some do not:
   - `pipeline_orchestrator_agent.md:824`, `shared/references/firm_rules.md`;
   - the `docs/design/...` "Spec:" lines, e.g. `:422`, `:429`, `:477`, `:728`, `:775`;
   - `:510`, `scripts/slr_lineage.py`.

   (`grep -n 'firm_rules\|...\|docs/design'` over the copied files.) The brief should name the ruling or page that covers these removals. For example, the "Spec:" and design-document lines can be cut as history under `docs/dev/change-standard.md` rule 10. Otherwise it should have the orchestrator book a ruling for them before dispatch.
4. Item 4 states rulings differently or leaves them out:
   - D1: leaves out "retraction notices".
   - D6: leaves out "the state written there by the session in the state tracker's structure". Without it the builder may keep the state tracker as a started agent, where the ruling has the session write the state.
   - D24: says "those corrections", where the ruling (and the plan's goal) says "the integrity agent's corrections and records". It also drops the rule's list ("no file names, script names, paths, code identifiers, job, run or exit-code language or software-operations wording ..., a fact from code or a log written as the scientific claim it supports").
   - D21 ("`researcher` keeps academic-pipeline's full originality screen") is not named. Item 4 should name it beside D1's originality bullet, so the screen's Phase D is copied whole at both depths.
   - D19 and D23 are carried by the file list (the copied `compliance_agent.md`) and need no line.
   - ADR 0052's other items, D2 to D5, D16, D17, D20, D31 and Open item A, are stated as the rulings give them.
5. ADR 0043 and ADR 0026 are touched but not named under "What is on the tree".
   - ADR 0043 gives `paper`'s file and mode names that item 3 uses. It also states "The RAISE compliance agent is left out, since it is academic-pipeline's and comes with `researcher`", which this step carries out.
   - ADR 0026: its section G page (`skills/academic/writing/references/manuscript-prose-standard.md`) keeps software wording out of a manuscript, which is the rule D24 applies to the integrity corrections.

   The brief contradicts neither record.

Also, under the names bullet of item 3: the source points at files of other skills: `academic-paper/references/revision_patch_protocol.md`, `academic-paper/references/vlm_figure_verification.md`, `academic-paper-reviewer/references/{calibration_mode_protocol,quality_rubrics,review_criteria_framework}.md` and `deep-research/references/semantic_scholar_api_protocol.md` (`grep -oh 'academic-paper\(-reviewer\)\?/...\|deep-research/...'`). Item 3 gives no rule for these. `docs/dev/skill-layout.md`, "Paths and names", says "A file of another skill is named with its skill". Item 3 should say each is written "the `paper` skill's `references/<file>`" or "the `paper-review-panel` skill's `references/<file>`" (each of these files exists there, by `ls`). It should also say that the `deep-research` pointer at `integrity_verification_agent.md:90` goes with the Semantic Scholar route that D1 replaces.

Also, for item 4 D17: the ethics page at f9a00ab names `paper` pages that no longer exist: `references/ai-disclosure.md` (lines 30, 93), `references/statements.md` (58, 101), `references/citation-compliance.md` and `references/integrity-verification.md` (34). It also names `paper`'s run (`config.md` "Decisions" at 19, "the draft writer" at 10). `ls skills/academic/paper/references/<each>.md` -> "No such file or directory" for all four. Item 3's pointer rule covers only `scripts/`, `shared/` and `docs/design/`. Item 4 D17 should say how each pointer is carried: named as the current page of `paper` that holds the matter, or removed under item 5. It should also say that the run's decisions go to the run folder of D6.

Also, on item 3's names bullet: the precedent the brief cites (`eic_agent.md`) names another agent by its role in words. Item 3 does not state that rule, and Conventions says a page is named as `agents/<file>`. Item 3 should say which form a mention of another agent takes, since the copied pages name `integrity_verification_agent`, `state_tracker_agent` and others many times.

## Dictated text

The brief dictates no text word for word. Item 6 gives the facts and two literals that `NOTICE.md` must hold, without its wording, and item 7 says what the README line must say. The literals were checked with `grep -n 'https://github.com/Imbad0202/academic-research-skills\|creativecommons\|Cheng-I Wu' <brief>`, which prints line 50:
- The repository address matches the upstream issue link in the source (`claim_audit_calibration_protocol.md:172`).
- "Cheng-I Wu" matches LICENSE line 1.

## Nothing private

None. Nothing in the brief leads the builder to write a private path, project or person into `skills/`, `NOTICE.md` or `README.md`:
- The absolute paths under `/Users/...` appear only as places to read and in commands to run.
- Item 3 says "A page names nothing private".
- Item 6 holds only public facts.
- The f9a00ab ethics page holds no private name or path (`grep -n -i 'users/\|research-hub\|...'` prints nothing).

The case greps do not look for `research-hub` or `/Users/`. Adding `research-hub|/Users/` to case 7 would make that check run.

## Declined to judge

1. Whether the six saved documents and the source folder are byte-equal to upstream at tag v3.13.0: this needs web access, which the task excludes. Only the source's `metadata.version` `"3.13.0"` was checked.
2. Whether `https://creativecommons.org/licenses/by-nc/4.0/` is the licence's canonical address, and whether "Academic Research Skills" is the upstream project's published name: neither appears in the saved `LICENSE`, and this needs web access.
3. Whether the two contradictions in the source that ADR 0052 names (a failed final check, a midway entry) sit only in the pages cases 3 and 4 read: this is left to the builder's first run, since the cases already cover every page.

## Closed

Each finding is closed by a change to the brief `agents/briefs/1.md`, after Open item B of `plan.md` ruled the three points no ruling named.

- Names 2: "What is on the tree" says `LICENSE` is not changed, by ruling D32.
- The step line 1, ADRs 1 and 3: Open item B, booked in `plan.md`'s Rulings: the six documents at `agents/` and `references/`; the prose standard's section 0 and its section F on hard wraps for copied text, a kept sentence keeping its words; a pointer to a file not taken removed with its sentence or row, a design-document line removed as history. Item 3 is rewritten to it, and decision 1 is removed since the ruling now decides it. The step line in `plan.md` names the two folders.
- The step line 2, The question 10 and 12: "Verify before you report" item 3 gives the `diff` of the copied files, one `diff` per document and the `diff` of the ethics page against its source in git history, and item 8 lists what they print.
- Cases and checks 1 and 2, The question 5 and 7: the grep case is split: no hit allowed for the left-out parts, the old names, `research-hub` and `/Users/`, with the cross-model check and the process summary added; the allowance "named with why" stays for the version pattern only; the case on left-out parts covers every copied page.
- Cases and checks 3: "Verify before you report" item 2 added, the scan for any character outside ASCII, and item 3 of "What to build" names the check mark.
- Cases and checks 4: the expected output of `diff -rq` names the folder `references/adapters`.
- The question 1, ADRs 4: D1 names each field and the retraction notices; D6 says the session writes the state in the state tracker's structure and no state-tracker agent is started; D24 is given in the ruling's words for the corrections and the records; D21 is named.
- The question 6: the pointer case and item 3 say a sentence that needs the missing file is removed whole or reworded, listed per file.
- The question 9 and 16: item 6 and its case add the licensor's copyright line and the disclaimer of warranties.
- The question 14: one case each added for D20, D17, D6, D24 and D31.
- ADRs 2: ADR 0033 is named, and the integrity agent reads a source's text as `paper`'s citation compliance agent does.
- ADRs 5: ADR 0043 and ADR 0026 are named; ADR 0027 replaces the superseded 0022 and 0025.
- ADRs, the pointers to other skills' files: item 3 says how a file of `paper` or `paper-review-panel` is named and that a `deep-research` pointer is removed.
- ADRs, the ethics page's pointers: item 4 D17 says how each is carried.
- ADRs, how another agent is named: item 3 gives the rule.
- Nothing private: `research-hub` and `/Users/` are in the grep case.

The lines of item 6 that name the copyright line and the two addresses are literals the licence and ruling D32 fix; each is ASCII and breaks no rule of the rules file or the standards pages. No other dictated line was added.

Usage: agent a88f2b2030a881ff2, claude-opus-5-5, 234088 tokens, 48 tool uses, 448 s.
