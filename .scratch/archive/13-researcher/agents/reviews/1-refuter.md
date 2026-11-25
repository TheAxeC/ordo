# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-1, base cc3965a)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets.

## Verification (rerun by the reviewer)

```
1. perl character-set check of the brief, over the 27 files of skills/academic/researcher, NOTICE.md and README.md: printed nothing; exit=0
2. LC_ALL=C grep -rn '[^ -~]' skills/academic/researcher NOTICE.md: printed nothing, exit 1
3. diff -rq <source> skills/academic/researcher: only in the source SKILL.md, agents/claim_ref_alignment_audit_agent.md, agents/collaboration_depth_agent.md, references/adapters, references/changelog.md, references/claim_audit_calibration_protocol.md, references/literature_corpus_consumers.md, references/passport_as_reset_boundary.md, references/process_summary_protocol.md; only in the copy agents/compliance_agent.md, references/artifact_reproducibility_pattern.md, compliance_checkpoint_protocol.md, ethics.md, handoff_schemas.md, prisma_trAIce_protocol.md, raise_framework.md; the 20 copied files differ
   diff -r of the two folders: 3303 lines
   per-document diffs (lines): compliance_agent 95, handoff_schemas 497, compliance_checkpoint_protocol 76, raise_framework 135, prisma_trAIce_protocol 200, artifact_reproducibility_pattern 174
   git show f9a00ab:skills/paper/references/ethics.md | diff - ...: not run (see Declined to judge); wc -l of the copy prints 145
4. grep -rn 'scripts/\|shared/\|docs/design' skills/academic/researcher: no hit, exit 1
   grep -rniE 'claim_ref|collaboration_depth|literature_corpus|ARS_PASSPORT|ARS_CROSS_MODEL|cross.model|process.summary|academic-pipeline|academic-paper|deep-research|research-hub|/Users/' skills/academic/researcher: no hit, exit 1
   grep -rnE 'v[0-9]+\.[0-9]+' skills/academic/researcher: six lines, handoff_schemas.md:490 and team_collaboration_protocol.md:101-105, the same six the report quotes; none a version marker
   find skills/academic/researcher -type f | wc -l: 27
5. Sentence-length read of the builder's own sentences: done by reading; no finding beyond those below
Report-quoted evidence:
   grep -rn -i '3 rounds\|3 correction rounds\|max 3' skills/academic/researcher: the lines the report names (state machine 120, 147, 160, 226; integrity_review_protocol 42; orchestrator 234, 278, 377; integrity agent 513, 544, 545), plus integrity_review_protocol 21, integrity agent 53 and integrity_failure_recovery 387; matches the claim
   grep -rn -i 'null result\|negative result\|negative_results' skills/academic/researcher: handoff_schemas 473, 502, 550; integrity agent 307, 330, 335; matches the claim
   grep -n -i copyright <saved LICENSE>: 1:Copyright (c) 2026 Cheng-I Wu
   git diff README.md: -MIT. See `LICENSE`. / +MIT, see `LICENSE`, except the parts `NOTICE.md` names, which are under CC BY-NC 4.0.
   git status --short: " M README.md", "?? .scratch/13-researcher/agents/reviews/1-report.md", "?? NOTICE.md", "?? skills/academic/researcher/"
   line counts (wc -l, source then copy): integrity agent 690/659, orchestrator 981/433, full_pipeline_example 478/362, mid_entry_example 402/440, pipeline_state_machine 307/266, handoff_schemas 899/727, ethics.md copy 145; match the report's table
   awk scan for arrows and dashes in prose outside code fences, 27 files and NOTICE.md: no arrow, no dash used as an aside (hits are only `---` rules, nested bullets and `| -- |` empty cells)
   awk scan for a hard-wrapped prose line outside code fences and frontmatter: printed nothing
```

## Verdicts

Items of the brief's "What to build":

- 1: violated, Spec 5 (data_access_level rule given a new subject), Spec 7 (mode_advisor rows with a `paper` part removed whole), Spec 8 (the Stage 2.5 FAIL row's "never full-mode re-drafting" clause removed).
- 2: holds, `diff -rq` lists the six documents at the paths Open item B gives.
- 3: holds, checks 1 and 2 print nothing, the awk scans find no arrow, dash aside or hard wrap outside code, the name and pointer greps print nothing, and every "the `paper` skill's <file>" pointer resolves to an existing file (checked with ls over paper and paper-review-panel).
- 4: violated, Spec 1 (ethics check only in Mode 2), Spec 2 (full_pipeline_example has no Stage 2.5), Spec 3 (mid_entry_example's final check runs Phase A-E only), Spec 4 (REV-007 example against D20), Behaviour 1 (C4 cannot select a claim).
- 5: violated, Spec 2: H1 is not a case item 5 covers, since item 4 already requires that no two pages disagree, and the builder added a Stage 4.5 scene to the same example without a ruling. H2 is a hand-back item 5 allows (judged under Behaviour 1).
- 6: holds, NOTICE.md names `paper`, `paper-review-panel` and the integrity and manuscript parts of `researcher` as adapted from Academic Research Skills by Cheng-I Wu with the repository URL, the line "Copyright (c) 2026 Cheng-I Wu" (line 1 of the saved LICENSE), that they were modified, CC BY-NC 4.0 with its URL, the disclaimer of warranties and limitation of liability, and the rest under MIT in `LICENSE`; nothing private.
- 7: holds, `git diff README.md` above.
- 8: violated, Proof 1 (the added Stage 4.5 scene of full_pipeline_example is not listed; the data_access_level change is described as a removal of CI sentences only).

Cases of the brief's "Cases":

- Integrity agent, how a reference is verified: met, A0 and A1 run `lookup.py resolve` read as D14, A2 reads the `Crossref notice:` lines, and no web search checks existence (read of the page).
- Same page, the two depths: met, Mode 1 under `/researcher integrity pre-review` at the sampled depth, Mode 2 under `/researcher integrity` at full depth.
- Every page on a failed final check: met, the `3 rounds` grep above; each hit gives 3 rounds then the user's decision.
- Every page on a midway entry: met, the state machine INIT rows, integrity_review_protocol, mode_advisor, handoff_schemas rule 11, the orchestrator's mid-entry rules and mid_entry_example (its added Stage 2.5 PASS section) all run Stage 2.5.
- Every page, the left-out parts, and D5 in the orchestrator and the state machine: met, the second grep prints nothing; orchestrator Role Definition and the state machine name the four Skill-tool runs.
- Integrity agent, negative results and limitations: partial, no rule puts a null result into the prose and the check-3 FAIL on a contradicting claim is kept, but the check cannot select a claim in a `researcher` run (Behaviour 1) and the REV-007 example models null results put into the manuscript (Spec 4).
- Integrity agent and ethics.md (D17): partial, Phase F reads the page and the template ends with "## Ethics check", but only in Mode 2 (Spec 1).
- State tracker and state machine (D6): met, state_tracker_agent.md Role Definition and pipeline_state_machine.md put the state in `researcher-runs/<mode>-<date>/`, written by the session.
- D24: met, "Wording of corrections and records" holds the ruling's words.
- D31: partial, C4's paragraph reads the record from the project and builds it once with the user, but the join from a claim to an entry rests on a field nothing produces (Behaviour 1).
- grep scripts/shared/docs/design: met, no hit; the report lists per file what was removed.
- grep of the left-out names: met, no hit.
- grep v[0-9]+.[0-9]+: met, six hits, each named in the report as a manuscript version label.
- A plagiarism paragraph no ruling touches: met, the diff of plagiarism_detection_protocol.md (56 lines) changes only characters, arrows, names and Mode lines.
- NOTICE.md: met, item 6 above.

## 1. Spec

- Spec 1. agents/integrity_verification_agent.md:505 and :626: "+ **Phase F (the ethics check)**" appears only in Mode 2, and the template says "[Mode 2 only: the record references/ethics.md gives, as the last part of the report]"; what is wrong: Mode 1 (Stage 2.5, `/researcher integrity pre-review`) runs no ethics check. D17 says the integrity agent writes the ethics check "as the last part of its record" (any record), ADR 0027 says `researcher` "runs each check once on the finished draft and once after its revision", and the plan Goal orders `manuscript` as "`paper`, the integrity and ethics checks, the review of `paper-review-panel`, ...". The builder's reason, ethics.md saying "before delivery", describes when the check must have run, not that it runs only once. Failure scenario: a `/researcher manuscript` run sends a draft with an undisclosed AI use or a missing conflict statement to the review panel, and the panel and the revision work on it; the gap is first raised at Stage 4.5, after the review rounds. Verdict: item 4 violated; D17 case partial.
- Spec 2. examples/full_pipeline_example.md, the Recommended Pipeline Configuration block and "### Stage 4.5: FINAL INTEGRITY (Mode 2, final check)": "Stage 4.5 FINAL INTEGRITY: final check -- Verify the final version before delivery"; what is wrong: the source example has no integrity stage under any name; the copy adds a Stage 4.5 scene (with "Invoking /paper revision through the Skill tool with the 2 minor items as its comments...", "Verdict: PASS (zero issues)", and a deliverable ".tex + .bib (LaTeX version)" left from the removed Stage 5 format conversion) but still goes from Stage 2 straight to Stage 3. Item 4 asks that no two pages disagree; pipeline_state_machine.md's prohibited table forbids Stage 2 to Stage 3 without Stage 2.5 and the orchestrator says the integrity checks of Stage 2.5 and 4.5 are mandatory. The report's H1 says "The copy keeps that order, since ... no ruling names adding Stage 2.5 to this example", while the same file gained a Stage 4.5 that no ruling names either. Failure scenario: the session reads the full example as the model of a `manuscript` run from Stage 2 and skips the pre-review integrity check, sending an unchecked draft (ghost references included) to review. Verdict: item 4 and item 5 violated. H1 judged: the builder's option (a) is the right one and is work inside this step, not a ruling for the user.
- Spec 3. examples/mid_entry_example.md:371-372: "Executing: Phase A-E at full depth, with 100% of the paragraphs / added or modified during revision checked in Phase D"; what is wrong: the integrity agent's Mode 2 runs Phase A to F, Phase F being the ethics check; the example's final check lists A to E, and its deliverables have no ethics part. Failure scenario: a reader of the example takes the final check to end at Phase E and accepts a final record with no "## Ethics check" section. Verdict: item 4 violated; D17 case partial.
- Spec 4. references/handoff_schemas.md:469-473 (REV-007): "We have now reported ALL pre-registered outcomes including the two non-significant results ..." / "**Changes**: Section 4.1 Table 3 (expanded), Section 5 paragraph 4 (new discussion of null results)"; what is wrong: D20 says no text carries the rule that recorded null results appear in the Results, the Discussion or the Limitations, and item 4 asks that no rule put a recorded null result into the manuscript. The example is the worked model of a resolved must_fix item that the response letter and the revision follow, and the resolution it models is a manuscript gaining a null-result table and a null-result discussion paragraph. The builder's reason ("an example of a response to a reviewer, not a rule") does not hold: the example is what the agents copy. Failure scenario: a devil's-advocate comment on selective reporting is resolved by `/paper revision` the way REV-007 shows, and the manuscript gains a discussion of null results. Verdict: item 4 violated; negative-results case partial. A replacement example on another kind of must_fix item keeps the schema's illustration.
- Spec 5. references/handoff_schemas.md:712: "An agent page's frontmatter declares `data_access_level` with one of three values:" (source: "Every top-level `SKILL.md` declares `metadata.data_access_level`"); and :722 for `task_type`, with :727 still "When adding a new skill, do not invent a third value"; what is wrong: the rule's subject changed from a skill's SKILL.md to every agent page, which no ruling covers; `grep -rln data_access_level agents` prints only agents/compliance_agent.md, so the new rule is false for the integrity agent, the orchestrator and the state tracker; and the two sections now disagree within themselves (agent page against "a new skill"). Failure scenario: step 2 writes SKILL.md without `metadata.data_access_level` since the copy says the field lives on agent pages, and a reader checking the three agent pages finds them in breach of the schema page. Verdict: item 1 violated.
- Spec 6. agents/state_tracker_agent.md, the JSON state structure: `"pipeline_version": "2.6"` removed; what is wrong: it is a field of the state structure D6 makes the session write, not a history line; references/artifact_reproducibility_pattern.md keeps the corresponding `ars_version` and maps it to "`metadata.version` in `SKILL.md`", so the two pages handle the same field two ways. Failure scenario: two runs' state files written by different versions of the skill cannot be told apart, while their repro_lock blocks can. Verdict: item 1 violated (minor). Builder choice judged: keep the field, mapped to `metadata.version` as the artifact pattern does.
- Spec 7. references/mode_advisor.md: the rows "Graduate student (first paper)", "Conference paper", "Thesis chapter", "Policy brief" and "Just give me a quick paper" are removed whole as `deep-research` rows; what is wrong: each holds a `paper` part (the paper type and its `paper` mode) that stands without the research stage; item 1 forbids shortening and D16 removes only what exists only for a left-out part. Failure scenario: a user who asks `researcher` for a conference paper or a policy brief gets no mode advice, though `paper` supports both types. Verdict: item 1 violated.
- Spec 8. agents/pipeline_orchestrator_agent.md, the Stage 2.5 FAIL row of the fallback matrix: the source clause "never full-mode re-drafting; ... full re-emission is reachable only via the section 3.6 escalation checkpoint" removed whole; what is wrong: only its second half depends on section 3.6 (the claim audit gate, left out by D16); "never full-mode re-drafting" is a rule on the correction round that stands alone. Failure scenario: a FAIL at Stage 2.5 is corrected with a `/paper full` re-draft instead of `/paper revision`, discarding the reviewed structure. Verdict: item 1 violated (minor).
- Spec 9. agents/pipeline_orchestrator_agent.md:235: "| Stage 4 / 4': revision | Author cannot address a must_fix item | Escalate to user; ..."; what is wrong: in the source this row ("Stage 5: revision") follows the Stage 4.5 FAIL row "Return to Stage 5 (revision) with final integrity issues", so it is the correction round after the final check; the relabel moves the escalation onto the review revisions. The brief says "A stage number the source gives a kept stage is kept"; the faithful label is the correction round after Stage 4.5. Failure scenario: a must_fix item from the final integrity check that the author cannot address has no escalation row, and the session loops the correction round to its 3-round limit. Verdict: item 4 violated (minor). Builder choice judged: not supported.

## 2. Proof

- Proof 1. The report, "Deviations", per-file line for `examples/full_pipeline_example.md`: "Removed: the Stage 1 Socratic section, its summary and deliverables and the Stage 1 to 2 transition; the format question and Stage 5; the slides and webpage lines. H1."; what is wrong: the diff shows an added Stage 4.5 configuration line, progress bars ending in "Final integrity", an added "Stage 3' to 4.5 Transition" and a "Stage 4.5: FINAL INTEGRITY" scene, none listed; H1 says the copy keeps the source's order. Also the handoff_schemas line "Reworded: ... data_access_level and task_type without the CI sentences" omits the change of subject (Spec 5). For the deviations list: the orchestrator writes `deviations.md` from this section at landing, so the ledger would omit two differences. Failure scenario: step 2's comparison against `deviations.md` finds differences the list does not name. Verdict: item 8 violated.

## 3. Standards

- none.

## 4. Behaviour

- Behaviour 1 (H2). agents/integrity_verification_agent.md:298-303 and :316, :342; references/handoff_schemas.md:554, :558: "planned_experiment_ids present, OR a Results-section sentence reporting a first-person experimental outcome (own metric/ablation/run) with no <!--ref:slug-->"; what is wrong: C4 selects the claims it aligns through `claim_intent_manifest.planned_experiment_ids`; `paper`'s draft writer ("Claim Intent Manifest Emission" of skills/academic/paper/agents/draft_writer_agent.md) writes `intended-claims.md` with `claim_id`, `claim_text`, `intended_evidence_kind`, `planned_refs` and `negative_constraints`, and no `planned_experiment_ids` (grep of the section). The second signal feeds only the anti-skip check against `no_experiments_declared`, and its `<!--ref:slug-->` marker never appears in a LaTeX manuscript that cites with `\cite`. With `experiments_declared`, checks (0) to (3) select nothing, so the check-3 FAIL on a claim that contradicts a `negative_results[]` entry never fires. Failure scenario: a manuscript states an effect that the project's record lists as a null result, and Stage 2.5 and 4.5 both PASS. Verdict: negative-results case and D31 case partial. H2 judged: a legitimate hand-back, since option (a) changes `paper` outside this step's paths; the builder's recommendation (a) is the better one by my judgment, because (b) replaces a declared join with a reading the record cannot check, but (a) needs the step's paths widened or a separate step, which is the user's or the orchestrator's call.

## Declined to judge

- `git show f9a00ab:skills/paper/references/ethics.md | diff - skills/academic/researcher/references/ethics.md`: not run, as the brief to this review requires. It would settle whether references/ethics.md is word for word the f9a00ab page apart from the renamed pointers and run-state wording the report lists; the copy was read on its own and its pointers resolve.
- The pointers "SKILL.md Early-Stopping Criterion" in references/score_trajectory_protocol.md and references/handoff_schemas.md, and `SKILL.md Stage 2.5 / 4.5` in references/compliance_checkpoint_protocol.md: SKILL.md is written in step 2, so whether those sections will exist cannot be checked now.
- Whether SKILL.md (step 2) starts the compliance agent at Stage 2.5 and 4.5: neither the source orchestrator nor the copy names it (grep -i compliance prints nothing in either), so the copy is faithful here and the wiring is step 2's.
- The model line of agents/compliance_agent.md ("`model: sonnet` or higher", source "per user CLAUDE.md: never haiku"): judged acceptable; the rule is kept and the reference to a user file is removed, which the shipped-file rule requires. No finding.

Reviewer usage: agent aa05eb7854278e73e, claude-opus-5-5, 131902 tokens, 83 tool uses, 13 minutes.

## Repair round 1, refuted

```
(from /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-1)
1. brief check 1 (perl character-set check over the 27 files of skills/academic/researcher, NOTICE.md, README.md): printed nothing; exit=0
2. LC_ALL=C grep -rn '[^ -~]' skills/academic/researcher NOTICE.md: printed nothing; exit=1
3. diff -rq <source> skills/academic/researcher: only in the source SKILL.md, agents/claim_ref_alignment_audit_agent.md, agents/collaboration_depth_agent.md, references/adapters, references/changelog.md, references/claim_audit_calibration_protocol.md, references/literature_corpus_consumers.md, references/passport_as_reset_boundary.md, references/process_summary_protocol.md; only in the copy agents/compliance_agent.md, references/artifact_reproducibility_pattern.md, compliance_checkpoint_protocol.md, ethics.md, handoff_schemas.md, prisma_trAIce_protocol.md, raise_framework.md; the 20 copied files differ
   diff -r of the two folders: 3462 lines
   per-document diffs (lines): compliance_agent 95, handoff_schemas 510, compliance_checkpoint_protocol 76, raise_framework 135, prisma_trAIce_protocol 200, artifact_reproducibility_pattern 174
   git show f9a00ab:skills/paper/references/ethics.md | diff - ...: not run (see Declined to judge); wc -l of the copy prints 145
4. grep -rn 'scripts/\|shared/\|docs/design' skills/academic/researcher: no hit, exit 1
   grep -rniE 'claim_ref|collaboration_depth|literature_corpus|ARS_PASSPORT|ARS_CROSS_MODEL|cross.model|process.summary|academic-pipeline|academic-paper|deep-research|research-hub|/Users/' skills/academic/researcher: no hit, exit 1
   grep -rnE 'v[0-9]+\.[0-9]+' skills/academic/researcher: six lines (handoff_schemas.md:490, team_collaboration_protocol.md:101-105), none a version marker
   find skills/academic/researcher -type f | wc -l: 27
Round greps:
   grep -rn 'planned_experiment_ids\|ref:slug' skills/academic/researcher: no hit, exit 1
   grep -rn -i 'null result' skills/academic/researcher/references/handoff_schemas.md: no hit, exit 1
Delta: diff -ru <snapshot>/skills <worktree>/skills: 530 lines (read whole); it changes the ten pages named plus references/integrity_review_protocol.md; the other lines are "Only in" lines for folders outside skills/academic/researcher
   diff -q <snapshot>/README.md <worktree>/README.md and NOTICE.md: both print nothing (unchanged since the snapshot)
Report-quoted evidence rerun:
   wc -l and diff | wc -l of the report's table, for the 10 pages of the table that the round touched (integrity 662/540, orchestrator 434/851, state tracker 447/225, full example 420/378, recovery example 399/208, mid example 444/200, mode_advisor 110/124, state machine 266/324, integrity_review_protocol 52/49, ethics 145/0): all equal the report's table
   grep -rn -i '3 rounds\|3 correction rounds\|max 3': the lines the report names (state machine 120, 147, 160, 226; protocol 22, 44; integrity agent 53, 516, 547, 548; orchestrator 235, 279, 378; recovery example 395)
   grep -n '^###\|Progress:' examples/full_pipeline_example.md: Stage 2, 2 to 2.5 transition, Stage 2.5, 2.5 checkpoint, Stage 3, 3 to 4, Stage 4, 4 to 3', Stage 3', 3' to 4.5, "Minor Revision and Stage 4.5", Pipeline Complete; each progress bar from line 107 on has the Integrity step; matches the report
   wc -l NOTICE.md prints 11 (the report says 12); no decision rests on it
```

### Verdicts (whole step)

Items of the brief's "What to build":

- 1: holds. The three round findings are closed: data_access_level and task_type again say "The skill's `SKILL.md` declares `metadata.<field>`" (handoff_schemas.md, sections `data_access_level` and `task_type`, both ending "When adding a new skill"); mode_advisor rows restored (below); the Stage 2.5 FAIL row of the fallback matrix keeps "never full-mode re-drafting; reference-level fixes are the most block-local edit class in the pipeline" and drops only the half that names the left-out gate.
- 2: holds. `diff -rq` lists the six documents at the paths Open item B gives.
- 3: holds for characters, names, pointers and layout (checks 1, 2 and the greps above print what they should; scan of the added lines of the delta: no non-ASCII, no arrow or aside dash in prose; hits for ` -- ` and `->` are inside fenced blocks, as in the unchanged lines around them). The sentence-length part of item 5 has Standards 1.
- 4: violated, Spec 1 (the recovery example gives the ethics check a verdict that `references/ethics.md` does not give for the same record). Every other part of item 4 holds: D1, D2, D3 (grep above), D4, D5 (orchestrator line 12, state machine "Normal Flow Transitions"), D6 (state tracker Role Definition, state machine line 30), D17 at both depths (below), D20 (below), D24 (integrity agent "Wording of corrections and records"), D31 (C4, second paragraph), D16 and Open item A (grep 2 prints nothing).
- 5: holds. The report's hand-backs H1 and H2 are closed by rulings 2 and 10, applied.
- 6: holds. NOTICE.md is byte-equal to the snapshot's (`diff -q` prints nothing); the first refuter read its facts.
- 7: holds. README.md is byte-equal to the snapshot's; the first refuter read the line.
- 8: holds with Standards 1. Rows K16 and K21 to K25 exist, and the per-file lists of the integrity agent, orchestrator, state tracker, full example, recovery example, mid example, mode_advisor, handoff_schemas and ethics.md name each difference of the delta (checked hunk by hunk).

Ruling-by-ruling check of the round's eleven rulings:

1. holds. integrity_verification_agent.md "Phase F: Ethics Check" says "at both depths: in Mode 1 and in Mode 2"; the Mode 1 line (496) and the Mode 2 line (508) both end with Phase F; the Output Format ends "## Ethics check [At both depths: ...]"; integrity_review_protocol.md lines 17 and 39; the orchestrator's MANDATORY template ("- Ethics check: [CLEARED/CONDITIONAL/BLOCKED]", line 180); ethics.md line 3; the three examples. No other page lists the phases a depth runs (grep for `Phase A`, `Phase E`, `A-E`, `originality`, `claim verification` over the other pages).
2. holds. full_pipeline_example.md has the Stage 2.5 scene (lines 114 to 150) between Stage 2 and Stage 3 and a Stage 4.5 scene (328 to 351) at its end, in mid_entry_example.md's form; the configuration block (line 38), the five progress bars, the Stage 2 to 2.5 transition, the status block ("Stage 2.5 INTEGRITY [v] PASS Issues: 0"), the materials list and the final deliverables agree; no LaTeX deliverable remains (`grep -n -i latex` finds none).
3. holds. mid_entry_example.md line 374 "Executing: Phase A-F at full depth ... and the ethics check as Phase F", the result line "Ethics check: CLEARED, dual-use level None", the deliverable "ending with its ethics check"; its Stage 2.5 section has Phase F on the executing line (80), the result (92), the deliverable (98).
4. holds. The REV-007 example (handoff_schemas.md, Schema 8 Example) is now causal wording in a cross-sectional design, with Reviewer Comment, Status, Response and Changes, the same four fields the REV-001 example shows; the grep for 'null result' prints nothing; no other page puts a null result into the prose (grep of 'null', 'negative result', 'non-significant', 'pre-registered' over the folder prints only the record field `negative_results` and the check-3 verdict).
5. holds. See item 1 above.
6. holds. state_tracker_agent.md line 66 `"pipeline_version": "<metadata.version of SKILL.md>"` and line 258, naming `metadata.version` as artifact_reproducibility_pattern.md does for `ars_version` (lines 31 and 60 of that page).
7. holds. mode_advisor.md has "Just give me a quick paper" (`/paper full`), "Graduate student (first paper)" (`/paper plan`, then `/researcher manuscript`), "Conference paper (short deadline)" (`/paper full`, conference type), "Thesis chapter" (`/paper full`), "Policy brief" (`/paper full`, policy_brief type). Every mode named (`full`, `plan`, `lit-review`, `format-convert`, `citation-check`) is in the Quick start of skills/academic/paper/SKILL.md, and `conference_paper_template.md` and `policy_brief_template.md` are listed there under Templates. I compared each other removed row with the source's mode_advisor.md: the remaining removed rows ("Write me a paper on X", "I need a systematic review", the deep-research matrix, capability and flowchart rows, Stage 1 and Stage 5 entry rows, "Skipping research", "Using fact-check mode") hold no paper part that stands without the research stage.
8. holds. See item 1 above; the orchestrator's row 233 keeps the rule.
9. holds. Row 236 is labelled "Stage 4.5 correction round (`/paper revision` after a failed final check)" and keeps the source's escalation options; it follows the Stage 4.5 FAIL row as the source's order has it.
10. holds. See "Behaviour 1 recheck" below. Neither `planned_experiment_ids` nor `<!--ref:slug-->` appears (grep above); handoff_schemas.md rows for `experiment_provenance` (line 502) and item 3 of the intake (line 554) say the same selection by reading.
11. holds, with Standards 1. The report's Deviations section has K16 and K21 to K25 and the corrected per-file lists.

Cases of the brief's "Cases" and of the round's cases:

- How a reference is verified: met (A0 and A1 `lookup.py resolve`, A2 reads the `Crossref notice:` lines; no web search checks existence).
- The two depths: met (Mode 1 line 493 and Mode 2 line 505).
- A failed final check, 3 rounds then the user: met (grep above, every hit).
- A midway entry runs the first check: met (state machine INIT rows 142 and 143, integrity_review_protocol line 5, handoff_schemas rule 11, orchestrator "Mid-Entry Material Passport Check" Rules, mid_entry_example).
- Left-out parts, and the four D5 runs: met (grep 2 prints nothing; orchestrator line 12, state machine "Normal Flow Transitions").
- Negative results and limitations (D20): met. No rule puts a null result into prose; the check-3 verdict is kept (C4 check (3)(b) and the Severity list "(check 3) alignment_verdict is one of {OVERSTATED, NOT_SUPPORTED_BY_PROVENANCE}").
- The ethics page and the ethics check as last part of the record (D17): met by the page, at both depths (rulings 1 and 3). The recovery example's own record contradicts the page, see Spec 1.
- State in `researcher-runs/<mode>-<date>/` written by the session (D6): met.
- D24 wording rule: met.
- Where the record of the experiments is read (D31): met (C4, second paragraph; handoff_schemas "Experiment Provenance Intake").
- grep scripts/shared/docs/design; the left-out names grep; `v[0-9]+.[0-9]+` grep: met (outputs above).
- A plagiarism paragraph no ruling touches: not rechecked in this round; the file is not in the delta (the first refuter's verdict stands, 56 diff lines).
- NOTICE.md: met (unchanged since the snapshot).
- Round case, each page that states what the check before the review runs ends with the ethics check: met (rulings 1 and 3).
- Round case, full example Stage 2, 2.5, 3, then to a Stage 4.5 scene with no step the state machine forbids: met. Each transition is a row of "Normal Flow Transitions" (Stage 2 to checkpoint to 2.5 to checkpoint to 3 to checkpoint to 4 to checkpoint to 3' to checkpoint to 4.5), and none of the "Prohibited Transitions" occurs; counts agree (22 references at Stage 2, "all 22 references" at Stage 2.5, 5,200 words to 6,800, 8 added citations to "Citations: 30", "Review Reports (4)" with "4 independent review reports").
- Round case, grep for `planned_experiment_ids` and `ref:slug`: met.
- Round case, a manuscript sentence that states an effect the record lists as a null result leads to FAIL at both depths: met by reading (Behaviour 1 recheck).
- Round case, no 'null result' in handoff_schemas.md: met.
- Round case, every case and check of the brief: met except as Spec 1 says.

### Findings

#### 1. Spec

- Spec 1. examples/integrity_failure_recovery.md, section "Phase F: Ethics Check" (before "### Verdict: FAIL"): "The ethics check of `references/ethics.md`, the last part of the record. Verdict: CLEARED. Dual-use level: None. Each of the eight dimensions passes. No issue."; what is wrong: the same Round 1 record finds a fabricated reference ("Ghost reference (Ref 12: Martinez, 2023)", Phase A, SERIOUS). `references/ethics.md`, "Verdict and stop", says "BLOCKED is reserved for these integrity violations: one fabricated reference, ...", its "Attribution" section says the check "reads their issues and does not repeat them", and its "Record" section lists "no fabricated citation was found" among the confirmations. By that page the verdict of this record is BLOCKED, or at least not CLEARED with every dimension passing. The Round 2 table row "Ethics Check (F) | 8 | 8 | 0 (CLEARED, dual-use level None)" sits in a summary of a re-check of "9 corrected items", where every other row's Total (45 references, 18 claims) is also the full count, so it follows the example's own pattern. Brief item 4 asks that no two pages disagree. Failure scenario: a session reads this example as the model of a Stage 2.5 record, writes CLEARED for a draft whose Phase A found a fabricated reference, and the BLOCKED stop of `references/ethics.md` never fires; or it follows `references/ethics.md`, stops once for the user at Stage 2.5 on every draft with a ghost reference instead of going to the correction round of `agents/integrity_verification_agent.md` "Correction Process on FAIL", and the example it was shown disagrees. The conflict is made reachable by ruling 1: before the round, Mode 1 ran no ethics check, so a fabricated reference found at Stage 2.5 never met the BLOCKED rule. Which of the two routes a fabricated reference at Stage 2.5 takes (the BLOCKED stop or the correction round) is not stated in any page; I give no verdict on which is right, the page and the example must at least agree. verdict: item 4 violated.

#### 2. Proof

none.

#### 3. Standards

- Standards 1. agents/integrity_verification_agent.md, "Phase F: Ethics Check": "The ethics check is the last part of the integrity record, in its section "Ethics check", with the verdict, the dimensions, the issues and the confirmations that page lists." (about 40 words); and agents/state_tracker_agent.md line 258: "`pipeline_version` is the skill's version, read from `metadata.version` in `SKILL.md`, as `references/artifact_reproducibility_pattern.md` reads its `ars_version`." (about 25 words). what is wrong: brief item 5 asks that each of the builder's own sentences above about 20 words be named in the report with why it needs its form. The report's "Judgment calls" list of long sentences names the state tracker's D6 paragraph, the C4 sentences, the Mode 1 sentence, the row-field sentence, the lookup paragraph and others, and does not name these two (the Phase F sentence was reworded in this round; the `pipeline_version` sentence is new in this round). failure scenario: a reader of the report cannot tell whether the two sentences were read against the sentence-length rule; the departure goes unrecorded. verdict: item 8 and item 3 hold, the report is incomplete on brief item 5.

#### 4. Behaviour

none. (Behaviour 1 recheck, ruling 10, the C4 walk-through: a session reading agents/integrity_verification_agent.md C4 as written (a) picks the claims by reading: "each sentence that reports an outcome of the author's own experiments is a claim of the check, and you match it to the entry of `experiment_provenance[]` whose result it reports"; (b) runs D7 first, with a record that has `experiments_declared` and a non-empty `experiment_provenance[]`, so conditions 1 to 3 do not fire; (c) takes, per matched entry, check (0) well-formedness, check (1) completeness (a claim that matches no entry is a structural FAIL), check (3) "(b) the experiment's negative_results[]: a claim asserting an effect a negative_results[] entry says was null/absent is NOT_SUPPORTED_BY_PROVENANCE (this is a verdict-level FAIL)", and the Severity list FAIL "(check 3) alignment_verdict is one of {OVERSTATED, NOT_SUPPORTED_BY_PROVENANCE}". At Mode 2 (line 513) every experiment-backed claim is checked. At Mode 1 (line 499) the sampled claims are checked and "A claim that touches an entry's `negative_results[]` is always checked, outside the sample", so the FAIL is reachable at both depths. The row fields `scoped_manifest_id` and `claim_id` have a source (the `paper` draft writer's `intended-claims.md`, which exists: skills/academic/paper/agents/draft_writer_agent.md line 486) or a stated fallback. No sentence of the copy names `claim_intent_manifest`, `planned_experiment_ids`, `planned_refs` or a `<!--ref:...-->` marker (greps above). No sentence names a Stage 1, Stage 5, Stage 6, FINALIZE or RESEARCH stage (grep prints nothing).)

### Declined to judge

- `git show f9a00ab:skills/paper/references/ethics.md | diff - skills/academic/researcher/references/ethics.md`: not run, as the review's rules require. It would settle whether `references/ethics.md` is word for word that page apart from the differences the report lists; this round changed only line 3 (read in the delta).
- Whether ethics.md's "Record" section, which lists confirmations "before delivery", is meant to be written at the check before the review as well as at the final check: the page was changed only on line 3, and the user's ruling D17 does not say. It is part of the question Spec 1 leaves open.
- Both examples (full and mid-entry) end at "Pipeline Complete" with no user confirmation after Stage 4.5 PASS, while the state machine has "Stage 4.5 | checkpoint | PASS | Wait for user confirmation" and "checkpoint | END | User confirms". The source's examples had the same ending and the round's ruling 2 asked for the mid-entry example's form; I judged it not a finding of this round.
- The minor-revision run between Stage 3' and Stage 4.5 in the full example ("handled in one /paper revision run before the final check") is not a row of the state machine; it matches the mid-entry example's form, which the ruling set as the model.
- ` -- ` and `->` inside fenced blocks (for example "Entering Stage 2.5 (INTEGRITY) -- Mode 1 (Pre-Review)"): the brief's item 3 and the prose standard bind prose and arrows outside code; I applied them to prose only, as the first review did.
- The pointers "SKILL.md Early-Stopping Criterion" and "SKILL.md Stage 2.5 / 4.5" and whether `SKILL.md` will start the compliance agent: `SKILL.md` is written in step 2.
- A paragraph of references/plagiarism_detection_protocol.md that no ruling touches: not rechecked; the file is outside the round's delta.

Reviewer usage: agent a13bf81b661469dae, claude-sonnet-5-5, 250100 tokens, 47 tool uses, 5 minutes.


## Closed

First run:

- Spec 1 to 9, Proof 1 and Behaviour 1: closed by the builder in repair round 1, rulings 1 to 11 of `agents/briefs/1-round-1.md`, with Open item C of `plan.md` for Spec 2 and Behaviour 1; the run over round 1 gives each ruling as holding.

Run over round 1:

- Spec 1: fixed at landing. `references/ethics.md` says that an issue a phase of the same record already reports goes to the correction round of the integrity verdict, and that the ethics check blocks for it only when it is still there after the correction rounds; the recovery example's ethics check says the same of its fabricated reference.
- Standards 1: closed with no change. Nothing a run does depends on it.
