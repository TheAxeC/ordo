# Step 5 refuter

## Verification lines

Run from `.agents/worktrees/2-5` with `PYTHONDONTWRITEBYTECODE=1`; HEAD 41beaeb, `git status --short` ` M docs/academic-coverage.md`.

```
ok: docs/academic-coverage.md
exit 0
eight PASS: lines (land.sh and usage.py, check_config.py, collect_findings.py, sync_rules.py, pin.sh, check_skill_layout.py, check_rule_inventory.py, check_coverage.py)
ten ok: lines of the layout check, exit 0; ASCII check exit 0; non-ASCII grep no output
pipeline section: 15 drop, 2 rebuild later: paper, 1 rebuild: literature, 5 rebuild: paper, 1 rebuild: paper-review, 1 rebuild: rebuttal, 5 rebuild: researcher
174 docs/academic-coverage.md
```

## Sample

All 30 source files read in full and checked against lines 145 to 174; the reworded rows 48, 55 and 139 checked against their sources; the files named by the drop rows checked by grep.

## Spec

1. Line 151, `examples/full_pipeline_example.md`: "follows the stage order and checkpoints ... without adding a rule" is false; the run skips Stages 2.5 and 4.5, which `SKILL.md` and the state machine forbid, and uses two revision cycles and four reviewers.
2. Line 172, `references/two_stage_review_protocol.md`: the coaching it holds (3 to 4, at most 8 rounds; residual 3' to 4', at most 5) is in `agents/pipeline_orchestrator_agent.md` lines 622-628 and the reviewer's `references/re_review_mode_protocol.md` lines 74-82, not in `references/external_review_protocol.md`.
3. Line 148, `agents/integrity_verification_agent.md`: sending the lookup rules to `literature` (entry 9) leaves the paper skill's integrity and DOI checks (entry 5) without them.
4. Lines 145 and 146: split files whose reasons do not say where the rest goes: the orchestrator's revision patch sequencing, coaching rules, mode switching matrix, audit artifact gate and submission-package gate; `SKILL.md`'s Stage 5, Stage 6, early stopping, budget transparency and collaboration observer.
5. Line 159, `references/claim_verification_protocol.md`: its content is repeated in the integrity agent's Phase E except the example column; the reason does not say so, while line 160 drops a duplicate on that ground.
6. Line 166, `references/plagiarism_detection_protocol.md`: "falls outside roadmap entry 5's goal" contradicts a mark that says the file belongs to the paper skill.
7. Line 161, `references/external_review_protocol.md`: "never accepted wholesale by default" is the opposite of the file's default when the user skips the discussion.
8. Line 170, `references/reproducibility_audit.md`: the state tracker holds the audit trail, but line 147 says the researcher takes only its prerequisite table.
9. Line 164, `references/passport_as_reset_boundary.md`: the reset applies only with `ARS_PASSPORT_RESET=1`.
10. Line 160, `references/integrity_review_protocol.md`: Stage 4.5's originality check is a 50 percent sample, so "complete after revision" is not exact.
11. Line 146: checkpoints stay mandatory at review decisions and Stage 5 as well as integrity checks.
12. Line 55, `academic-paper/agents/literature_strategist_agent.md`: the advisory has four dimensions including geography and counts known entries per dimension.

## Proof

None; every figure of the report reproduces.

## Standards

1. Endings "is/are not carried." (lines 54, 62, 78, 85, 135, 146, 162) and "left out." (53, 58, 72, 84, 89, 123) recur.
2. "The researcher('s X) take(s) Y" recurs in lines 145, 146, 147, 163, 165, and the shape in 148 and 171.
3. Drop rows repeat ", so no/nothing ..." (153, 154, 173); lines 168 and 174 close on nearly the same clause.
4. Passive openers where the actor matters: lines 148, 149, 159, 160, 161, 166, 170, 172.
5. Unclear wording: "takes these over plan-orchestration" (146), "passing outages" (149), "at most one second revision" (145).

## Behaviour

1. Line 18 of the introduction is false for lines 145 and 146 (Spec 4).
2. The check command names three skills and passes; the New skills table matches the roadmap.

## Not checked

Line 48 checked by grep only; line 154's `.bib` claim checked for 10 manuscripts; line 173's "one researcher" not checked; the claims about Ordo's ledger in lines 147 and 167 not checked; the `skills-lock.json` hashes not re-verified.

## Usage

305,282 tokens, 50 tool uses, 393 s.

## Repair round 1, refuted

HEAD 41beaeb; the delta is `diff cov5-round1-start.md docs/academic-coverage.md`.

### Verification lines

```
ok: docs/academic-coverage.md
exit 0
eight PASS: lines, ten ok: lines of the layout check, exit 0; ascii exit 0; non-ASCII grep no output
whole file: 34 drop, 2 rebuild later: literature, 10 rebuild later: paper, 3 rebuild later: paper-review, 3 rebuild: literature, 29 rebuild: paper, 20 rebuild: paper-review, 7 rebuild: rebuttal, 5 rebuild: researcher, 1 rebuild: submit-manuscript, 3 rebuild: writing (117 rows)
academic-pipeline: 15 drop, 2 rebuild later: paper, 1 rebuild: literature, 5 rebuild: paper, 1 rebuild: paper-review, 1 rebuild: rebuttal, 5 rebuild: researcher (30 rows)
174 docs/academic-coverage.md
```

### Closures

Spec 2, 5 to 12 closed; Spec 1 and 4 partly closed (see Spec 3 and 1 below); Spec 3 closed but conflicts with line 166 (Spec 2 below); Standards 1 to 5 closed for the named instances with new recurring shapes (Standards below); Behaviour 1 not closed.

### Spec

1. Line 146: the orchestrator reason omits the Cite-Time Provenance Finalizer (lines 688-905), the skill failure fallback matrix (357-369), the claim-faithfulness audit gate (427-483), the observer dispatch (371-395) and the mid-entry passport check (643-687); the round removed the fallback and the citation-matrix clauses.
2. Lines 148 and 166 contradict each other: the integrity agent runs the originality screen (Phase D) at both mandatory gates, yet line 166 marks it `rebuild later: paper`.
3. Line 151: "two revision cycles" is false; the run has one revision round.
4. Line 145: the adaptive checkpoint system (`SKILL.md` lines 140-191) is neither assigned nor declared dropped.
5. Line 55: gap identification and title-then-full-text screening are no longer named.

### Proof

1. Lines 76 and 157 both end "a new skill needs.", against the report's four-word-ending claim.
2. The report says line 55 names the gaps again; it does not.
3. A judgment call says the researcher gets only the prerequisite table and entry; line 147 also gives it the audit trail.
4. The rest reproduces.

### Standards

1. "nothing is kept of X" recurs (lines 52, 56, 71, 80, 85, 87, 121); "stay(s) behind" at 79, 86, 120.
2. Lines 84, 145 and 146 share the shape "X go(es) to A, Y to B, and Z are dropped".
3. ", which makes X unnecessary" closes lines 154 and 162; lines 147 and 164 both open "Ordo's plan ... already".
4. Lines 76 and 157 share an ending.
5. Unclear: line 63 "in general rather than clinical wording"; line 53 "have no counterpart".
6. Sentence fragments: lines 53, 62, and untouched rows 57, 61, 65, 66, 74, 77, 83, 99, 104, 106, 108.
7. Passive where the actor matters: line 161.

### Behaviour

1. Line 18 is false for lines 145 and 146.
2. The check command names three skills and passes.

### Not checked

Rows changed only at their endings or openings were compared for meaning without re-reading the source; the `skills-lock.json` hashes.

### Usage

Recorded below under Closed.

## Closed

- First run, every finding: closed in repair round 1 (see `5-report.md`, "Repair round 1").
- Run over the round, fixed at landing:
  - Spec 1 and Behaviour 1: the orchestrator row names the citation finalizer, passport hashing, audit-artifact gate and observer dispatch as ending with it, and sends the fallback matrix and mid-entry check to the researcher and the claim-audit gate to `paper`.
  - Spec 2: `references/plagiarism_detection_protocol.md` is `rebuild: paper`, since the integrity check runs the screen at both gates; the report's marks table is corrected (paper 6, later 1).
  - Spec 3: the full-pipeline row says one revision, four reviewers and no integrity check at either gate.
  - Spec 4 and Behaviour 1: the pipeline `SKILL.md` row gives the checkpoint system to the researcher.
  - Spec 5 and Proof 2: the literature-strategist row names title-then-full-text screening and five kinds of research gap.
  - Proof 1 and Standards 4: the pipeline changelog row no longer ends like the paper changelog row.
  - Proof 3: the report's judgment call names the audit trail.
  - Standards 1 to 3: the "nothing is kept of" endings, the "X goes to A, Y to B" shape of lines 84 and 145, the ", which makes X unnecessary" closings and the paired "Ordo's plan ... already" openings were rewritten.
  - Standards 5: lines 53 and 63 say what the dropped parts have no place in.
  - Standards 6: the fragment reasons of lines 53, 57, 61, 62, 65, 66, 71, 74, 77, 83, 99, 104, 106 and 108 are full sentences.
  - Standards 7: line 161 names the user and the assistant.
- Round refuter usage: 149,888 tokens, 38 tool uses, 341 s.
