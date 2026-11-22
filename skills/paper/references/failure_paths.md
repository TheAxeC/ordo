# Failure Paths: Academic Paper Writing Failure Path Map

This document records the failure scenarios that `paper` may encounter at each stage, their trigger conditions, and handling strategies. All agents should refer to this guide when they detect a failure scenario.

---

## Failure Path Overview

| # | Failure Scenario | Trigger Condition | Severity | Handling Strategy |
|---|---------|---------|--------|---------|
| F1 | Insufficient research foundation | Plan mode Step 0 finds no RQ / no data | High | Specifically explain what is currently missing; if the user insists on continuing, switch to outline-only mode |
| F2 | Wrong paper structure selected | The structure architect finds RQ-structure mismatch | Medium | Return to Phase 2, suggest alternative structures |
| F3 | Severely over word count | Draft exceeds target word count by 30% or more | Medium | Identify sections to cut, suggest condensing |
| F4 | Severely under word count | Draft is 30% or more below target word count | Medium | Identify sections to expand, suggest additions |
| F5 | Citation format entirely wrong | The citation compliance agent finds > 50% format errors | High | Correct the entries as one patch, after the citation style is confirmed when the entries follow another style; no claim or source check is repeated |
| F7 | Peer review rejection | The peer reviewer issues a Reject verdict | High | Analyze rejection reasons, recommend major revision or restructuring |
| F8 | Plan mode does not converge | > 15 rounds of dialogue without completing all chapters | Medium | Suggest switching to outline-only mode |
| F10 | User abandons midway | Explicitly states unwillingness to continue | Low | Save completed Chapter Plan |
| F11 | Desk-reject | Journal editor rejects without sending to reviewers | High | Classify rejection cause, select recovery strategy |
| F12 | Conference-to-journal conversion failure | Conference paper expansion to journal article rejected | Medium | Ensure 30-50% new content + proper citation |

---

## Detailed Handling Strategies

### F1: Insufficient Research Foundation

**Trigger Timing**: Plan mode Step 0 (Research Readiness Check) or Full mode Phase 0

**Detection Indicators**:
- User cannot describe their research question in one sentence
- No literature foundation
- No concept of research methods
- Topic is too broad and cannot be focused

**Handling Process**:
```
1. Affirm the user's research interest
2. Specifically explain what is currently missing
3. If the user insists on continuing, switch to outline-only mode (low risk)
```

**Response Template**:
```
Your research topic is very interesting, but I notice that a clear research question
and literature foundation are still missing.
```

---

### F2: Wrong Paper Structure Selected

**Trigger Timing**: Phase 2 (the structure architect)

**Detection Indicators**:
- RQ is a causal question but a Literature Review structure was selected
- No data but IMRaD was selected
- Topic suits a Case Study but Policy Brief was selected
- Word count target and structure are mismatched (e.g., 3000-word IMRaD)

**Handling Process**:
```
1. Point out the mismatch between RQ and structure
2. Explain why they are mismatched
3. Suggest 1-2 alternative structures
4. Explain how the alternative structures better answer the RQ
5. Return to Phase 2 with the alternative structure that best answers the RQ, and record the choice in `config.md` under "Decisions"; the user sees it at the stop "The outline's approval"
```

---

### F3: Severely Over Word Count

**Trigger Timing**: Phase 4 (after the draft writer completes)

**Detection Indicators**:
- Actual word count > target word count x 1.3

**Handling Process**:
```
1. List actual word count vs. target word count for each chapter
2. Identify the most over-count chapters
3. Suggest reduction strategies:
   a. Merge duplicate arguments
   b. Condense the literature review (keep core literature)
   c. Remove overly detailed method descriptions
   d. Compress repeated literature dialogue in Discussion
4. Apply the reduction that follows from the run's goal, and record it in `config.md` under "Decisions"
```

---

### F4: Severely Under Word Count

**Trigger Timing**: Phase 4 (after the draft writer completes)

**Detection Indicators**:
- Actual word count < target word count x 0.7

**Handling Process**:
```
1. List actual word count vs. target word count for each chapter
2. Identify the most deficient chapters
3. Suggest expansion strategies:
   a. Increase the depth and breadth of the literature review
   b. Add more evidence and examples
   c. Expand Discussion (more literature dialogue)
   d. Add more detail to methodology descriptions
4. Provide specific expansion directions
```

---

### F5: Citation Format Entirely Wrong

**Trigger Timing**: Phase 5a (the citation compliance agent)

**Detection Indicators**:
- Citation format error rate > 50%
- Systematic errors (e.g., all missing DOIs, all using wrong format)

**Handling Process**:
```
1. Analyze error patterns (systematic vs. scattered)
2. If systematic errors:
   a. Identify root cause (user may have selected the wrong citation format)
   b. Entries in the style of the Citation Format row: correct them in the same start, as one patch
   c. Entries in another style: confirm the correct citation format at the stop "The citation style to confirm", then the same agent, resumed, corrects the entries as one patch
   d. Repeat no check of a claim or of a source
3. If scattered errors:
   a. Fix one by one
   b. Produce a correction report
```

---

### F7: Peer Review Rejection

**Trigger Timing**: Phase 6 (the peer reviewer issues Reject)

**Detection Indicators**:
- Two or more of the five dimensions scored below 60
- Fatal flaws exist (logical breakdowns, missing core evidence, serious methodology flaws)

**Handling Process**:
```
1. List all issues flagged as Critical
2. Classify the nature of the problems:
   a. Fixable (writing, formatting, minor logic issues) -> Recommend Major Revision
   b. Structural issues (argument architecture needs reorganization) -> Return to Phase 3 for restructuring
   c. Fundamental issues (RQ infeasible, insufficient data) -> Return to Phase 0 for re-evaluation
3. Produce a revision roadmap
4. Execute the revision as the revision loop of full mode gives; the run stops only at the stop "The draft review does not pass", and the option taken is recorded in `config.md` under "Decisions"
```

**Note**: If still Reject after the second review, recommend the user to:
- Consult domain experts
- Rethink the research design
- Consider switching target journals (lower the bar)

---

### F8: Plan Mode Does Not Converge

**Trigger Timing**: Plan mode dialogue exceeds 15 rounds

**Detection Indicators**:
- User repeatedly modifies the direction of the same chapter
- Unable to make definitive decisions
- Discussion drifts off the paper topic

**Handling Process**:
```
1. Pause and summarize what has been determined so far
2. List completed and uncompleted chapters
3. Provide two options:
   a. Jump to outline-only mode (directly produce an outline)
   b. Continue dialogue (but narrow the scope of each discussion)
4. Save the completed Chapter Plan
```

---

### F10: User Abandons Midway

**Trigger Timing**: User explicitly states unwillingness to continue

**Detection Indicators**:
- "Forget it" / "Not writing anymore" / "Too complicated" / "Let me think about it"
- Abandons after prolonged unresponsiveness

**Handling Process**:
```
1. Respect the user's decision
2. Save all completed outputs:
   - `config.md`
   - Chapter Plan (completed portions)
   - INSIGHT Collection
   - Any completed draft sections
3. Inform the user they can come back anytime with these materials to continue
4. Do not actively persuade them to continue (but encouragement is fine)
```

**Save Format**:
```markdown
## Academic Paper: Saved Record

**Topic**: {topic}
**Progress**: Phase {N} / Step {M}
**Completed**:
- [x] `config.md`
- [x/partial] Chapter Plan (completed {N}/{total} chapters)
- [ ] Draft
- [ ] Citation check
- [ ] Peer review

**How to Resume**: Bring this record and restart `/paper`; can continue from Phase {N}
```

---

## Relationships Between Failure Paths

```
F2 (Wrong structure) -> Return to Phase 2 -> May cascading affect F3/F4 (word count issues)
F5 (All citations wrong) -> May be a downstream effect of F2 (wrong format selected)
F7 (Rejection) -> Analysis may require returning to F2 (structure) or F1 (foundation)
F8 (Non-convergence) -> May evolve into F10 (abandonment)
```

### F11: Desk-Reject Recovery

**Trigger**: Editor rejects the paper without sending to reviewers.

**Cause Classification & Recovery**:

| Cause | Diagnostic Signs | Recovery Strategy |
|-------|-----------------|-------------------|
| **Scope Mismatch** | Editor states "outside journal scope" or "not aligned with journal aims" | Re-analyze journal scope; identify 3 alternative journals; may need to reframe the paper's contribution |
| **Insufficient Novelty** | "Incremental contribution" or "well-established findings" | Strengthen the novelty claim in introduction; consider additional analysis or a new dataset; reposition the paper's unique contribution |
| **Formatting Non-Compliance** | Immediate rejection for template/length/style violations | Review target journal's author guidelines; use the formatter to reformat; resubmit (often same journal accepts after formatting fix) |
| **Poor Opening** | No specific reason given; likely the abstract/introduction failed to hook | Rewrite abstract with the CARS model (Create A Research Space); lead with the gap, not the background; have the peer reviewer evaluate the new opening |

**General Protocol**:
1. Do NOT take desk-reject personally: 30-50% of submissions to top journals are desk-rejected
2. Read the editor's email carefully for any specific feedback
3. Determine the cause category above
4. If Scope Mismatch: pivot journal, not paper
5. If Novelty/Opening: revise paper, then resubmit (different journal recommended)
6. Turnaround target: 2 weeks for reformatting, 4 weeks for substantive revision

---

### F12: Conference-to-Journal Conversion Failure

**Trigger**: Attempt to expand a published conference paper into a journal article fails review.

**Common Rejection Reasons & Solutions**:

| Reason | Solution |
|--------|----------|
| **Insufficient Extension** (< 30% new content) | Journal expects 30-50% new material beyond the conference version. Add: extended related work, additional experiments/data, deeper analysis, new discussion sections |
| **Self-Plagiarism Flag** | Explicitly cite the conference version in the introduction: "This paper extends our previous work [conf-citation] with..." Use iThenticate to verify < 30% text overlap |
| **Stale Results** | If the conference paper is > 2 years old, results may be outdated. Update experiments with current data/baselines; acknowledge temporal limitations |
| **Missing Journal Standards** | Conference papers often lack: detailed methodology, reproducibility information, limitations section, broader impact discussion. Add all of these |

**Conversion Checklist**:
- [ ] Conference version explicitly cited in introduction
- [ ] 30-50% genuinely new content added (not just padding)
- [ ] Text overlap with conference version < 30% (verified by similarity tool)
- [ ] All reviewer expectations for a journal-length paper met
- [ ] Notation in cover letter: "This is an extended version of [conference paper]"
- [ ] Check journal policy: some journals prohibit conference-to-journal conversion

---

## Preventive Measures

| Failure Path | Preventive Measure |
|---------|---------|
| F1 | Phase 0 / Step 0 strictly checks research readiness |
| F2 | The structure architect cross-validates the match between RQ and structure |
| F3/F4 | The draft writer checks word count progress after completing each section |
| F5 | The draft writer uses the correct format during writing |
| F7 | The argument builder stress-tests arguments in Phase 3 |
| F8 | The Socratic mentor sets a dialogue cap per chapter |
| F10 | Maintain dialogue rhythm to avoid user fatigue |
| F11 | Phase 7 researches target journal scope when producing the cover letter; the formatter strictly follows formatting rules |
| F12 | The intake agent detects whether this is a conference paper expansion; calculate new content ratio early |
