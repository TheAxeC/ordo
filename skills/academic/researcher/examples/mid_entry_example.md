# Example: Mid-Entry into Pipeline

## Scenario Description

**User type**: University professor, experienced in paper writing
**Scenario**: Already completed an English paper draft, wants a simulated review before submission
**Goal**: Integrity check, then review, then revision, then the final integrity check
**Language**: English (paper is in English; conversation with orchestrator in English)

---

## User Input

```
I've already written an English paper titled "Machine Learning Approaches for
Predicting University Attrition Risk in Taiwan," approximately 7,000 words.
I'd like a simulated review before submitting.
```

---

## Pipeline Execution Log

### Orchestrator: Mid-Entry Detection

```
Detection results:
- Materials: Complete English paper draft (7,000 words)
- Goal: Simulated review + revision + submission preparation
- Entry point: Stage 2.5 (INTEGRITY), then Stage 3 (REVIEW)
- User type: Experienced researcher

Detected that you have a complete paper. A paper that enters the pipeline
midway first goes through Stage 2.5 (INTEGRITY), which cannot be skipped;
after it passes, you proceed to Stage 3 (REVIEW).

Before starting, let me confirm a few things:
1. What's the paper structure? (IMRaD / other)
2. What review mode would you like?
   - full: Complete 4-person review (EIC + 3 Peer Reviewers)
   - quick: EIC quick assessment (15-minute version)
   - guided: Socratic guided review (interactive dialogue)
3. Which journal (or what tier) are you targeting?
4. Will you need revision after the review?

If you later want to revise based on review comments, I'll automatically guide you to Stage 4.
```

**User**: IMRaD structure, I'd like a quick review first to see if there are any big-picture issues. Targeting Computers & Education (SSCI Q1). Will decide about revision after the review.

### Orchestrator: Confirm Configuration

```
Got it. Pipeline configuration:

  Stage 2 WRITE           [--] Skipped (you already have a complete paper)
  Stage 2.5 INTEGRITY:    Mode 1 (pre-review) -- mandatory, cannot be skipped
  Stage 3 REVIEW:         quick -- EIC quick assessment first, checking the big picture
  Stage 4 REVISE:         TBD -- based on Stage 3 results
  Stage 4.5 FINAL INTEGRITY: mandatory, after the revision

Start Stage 2.5 (INTEGRITY)?

Progress: [--]Writing -> [..]Integrity -> [ ]Review -> [ ]Revision -> [ ]Final integrity
```

**User**: Start.

---

### Stage 2.5: INTEGRITY (Mode 1, pre-review)

```
Entering Stage 2.5 (INTEGRITY) -- Mode 1 (Pre-Review)

Loading the integrity agent...
Executing: Phase A (Reference Verification) + Phase B (Citation Context, 30% spot-check)
         + Phase C (Data Verification) + Phase D (Originality, 30% spot-check)
         + Phase E (Claim Verification, 30% spot-check)
         + Phase F (Ethics Check)
```

**Integrity Verdict: PASS**

```
Verification Summary:
- Phase A: all references confirmed with lookup.py resolve
- Phase B: sampled citations accurately reflect their sources
- Phase C: all statistical data consistent with the cited sources and the paper's tables
- Phase D: no CLOSE_MATCH or VERBATIM paragraphs in the sample
- Phase E: sampled claims VERIFIED
- Phase F: ethics check CLEARED, dual-use level None

Issues: SERIOUS 0 / MEDIUM 0 / MINOR 0
```

**Stage 2.5 Deliverables:**
- Integrity Report (Pre), saved as its own file in the run folder, ending with its ethics check

### Orchestrator: Stage 2.5 Checkpoint

```
Stage 2.5 (INTEGRITY) PASS. The paper is cleared for review.

Start Stage 3 (REVIEW) quick mode?

Progress: [--]Writing -> [v]Integrity -> [..]Review -> [ ]Revision -> [ ]Final integrity
```

**User**: Start.

---

### Stage 3: REVIEW (quick mode)

```
Entering Stage 3 (REVIEW) -- invoking /paper-review-panel quick through the Skill tool

Receiving user-provided paper draft...
the field analyst analyzing paper domain...
the EIC executing quick assessment...
```

**Field Analysis (quick version):**
```
Paper domain: Educational Data Mining / Higher Education
Method type: Machine Learning (Supervised Classification)
Target journal: Computers & Education (SSCI Q1, IF: 12.0)

EIC Persona:
  Computers & Education Associate Editor
  Specialization: Learning Analytics, Educational AI
```

**EIC Quick Assessment:**

```
Overall: Promising but needs work (Minor-to-Major Revision range)

Key Strengths (top 3):
1. Timely topic -- university attrition prediction highly relevant
   in Taiwan's demographic context
2. Good feature engineering -- combining MOE open data with
   institutional records is novel
3. Clear methodology -- model comparison (RF, XGBoost, LSTM)
   is well-structured

Key Concerns (top 3):
C1: [CRITICAL] Ethical considerations section is missing.
    C&E requires explicit discussion of algorithmic fairness,
    student privacy, and potential discriminatory outcomes.
C2: [MAJOR] Model interpretability not discussed.
    C&E reviewers expect SHAP values or similar explainability
    analysis, not just accuracy metrics.
C3: [MAJOR] Literature gap -- no mention of Dropout Factory
    literature (Balfanz & Legters, 2004) or recent European
    attrition studies. Too Taiwan-centric for an international
    journal.

Quick Verdict: Major Revision
  Before full submission, address C1-C3.
  Estimated revision effort: 2-3 weeks.
```

**Stage 3 Deliverables:**
- EIC Quick Assessment Report
- 3 key issues list (priority sorted)

---

### Orchestrator: Transition Recommendation

```
Stage 3 (REVIEW) quick mode Complete!

Review result: Major Revision direction
  C1: [CRITICAL] Missing ethics discussion (hard requirement for C&E)
  C2: [MAJOR] Missing model interpretability analysis
  C3: [MAJOR] Literature review lacks international perspective

This is the quick review result. You have several options:

  a) Proceed directly to Stage 4 (REVISE) to address these 3 issues
  b) Upgrade to full review (complete 4-person review),
     to see if there are other issues
  c) Revise on your own first, come back when done

My recommendation: Since you're targeting C&E (Q1 journal),
fix C1-C3 first, then do a full review to ensure quality.

Which do you choose?
```

**User**: Fix C1-C3 first, then do full review.

### Orchestrator: Update Configuration

```
OK, updating pipeline:

  Stage 3 REVIEW (quick):  [v] Completed
  Stage 4 REVISE:          [..] Next -- fix C1-C3
  Stage 3' RE-REVIEW:      full mode -- full review after revision
  Stage 4.5 FINAL INTEGRITY: after the re-review

Start Stage 4 (REVISE)?

Progress: [--]Writing -> [v]Integrity -> [v]Review -> [..]Revision -> [ ]Re-review -> [ ]Final integrity
```

**User**: Start revision.

---

### Stage 4: REVISE (revision mode, Round 1)

```
Entering Stage 4 (REVISE) -- invoking /paper revision through the Skill tool

Passing Paper Draft + Quick Assessment Report...
```

**Revision Progress Tracking:**
```
C1: [v] Added Ethics & Fairness section (Section 5.3)
    - Algorithmic fairness analysis (demographic parity, equalized odds)
    - Student privacy framework (FERPA-equivalent for Taiwan)
    - Potential discriminatory outcomes discussion
    - Added 5 citations on AI ethics in education

C2: [v] Added Model Interpretability analysis (Section 4.3)
    - SHAP value analysis for top 20 features
    - Feature importance comparison across 3 models
    - Case study: 3 individual prediction explanations
    - Added SHAP visualization figures

C3: [v] Expanded Literature Review (Section 2)
    - Added Dropout Factory framework (Balfanz & Legters)
    - Added 6 European attrition studies (2020-2026)
    - Added cross-cultural comparison discussion
    - Restructured into 3 sub-sections: global -> Asia -> Taiwan
```

**Stage 4 Deliverables:**
- Revised Draft (9,200 words, 2,200 words more than original)
- Response to Reviewers (R-A-C format, 3 items all addressed)

---

### Orchestrator: Stage 4 to 3' Transition

```
Stage 4 (REVISE) Complete!

Revision results:
- 3/3 issues all addressed
- Paper expanded from 7,000 to 9,200 words
- Added Ethics section, SHAP analysis, international literature
- Added 11 new citations

Next step is Stage 3' (RE-REVIEW) -- this time using full mode.
4 reviewers will do a complete review of the revised version.
This is revision cycle 1 (max 2 cycles).

Submit for full review?

Progress: [--]Writing -> [v]Integrity -> [v]Review -> [v]Revision -> [..]Re-review -> [ ]Final integrity
```

**User**: Submit.

---

### Stage 3': RE-REVIEW (full mode, Loop 1)

```
Entering Stage 3' (RE-REVIEW) -- full mode, Loop 1/2

Invoking /paper-review-panel full through the Skill tool...
Passing Revised Draft + Response to Reviewers...
the field analyst re-analyzing...
```

**Reviewer Configuration:**
```
EIC:        Computers & Education Associate Editor
            Educational AI, Learning Analytics
Reviewer 1: Machine Learning expert
            Predictive modeling, Model evaluation
Reviewer 2: Higher Education researcher
            Student success, Retention strategies
Reviewer 3: Research Ethics / Data Science ethicist
            Algorithmic fairness, Educational data mining ethics
```

**4 Review Reports Compiled:**

```
EIC: Minor Revision
  - C1 response adequate, Ethics section well-structured
  - Recommend updating Abstract to reflect new ethics + interpretability contributions
  - Recommend adding a Practical Implications section for university administrators

Reviewer 1: Accept
  - SHAP analysis thorough and insightful
  - Model comparison fair and well-documented
  - Minor: Table 3 precision/recall should include confidence intervals

Reviewer 2: Minor Revision
  - International literature coverage greatly improved
  - Recommend Discussion add dialogue with Tinto's Student Integration Model
  - Minor: Section 2.1 citation Chen (2023) should be Chen (2024)

Reviewer 3: Accept
  - Ethics section quality is high, exceeding typical C&E standards
  - Algorithmic fairness metrics well-chosen
  - Recommend adding a "limitations of fairness metrics" reflection paragraph
```

**Editorial Decision: Minor Revision (Accept direction)**

```
Required Revisions:
R1: Update Abstract (reflect new contributions)
R2: Add Practical Implications section

Suggested Revisions:
S1: Table 3 add confidence intervals
S2: Discussion add Tinto's model dialogue
S3: Fix Chen (2023) -> Chen (2024) citation year
S4: Add fairness metrics limitations paragraph
```

---

### Orchestrator: Quick Revision + FINAL INTEGRITY

```
Stage 3' (RE-REVIEW) Complete!

Review result: Minor Revision (Accept direction)
  - 2 out of 4 reviewers Accept + 2 Minor Revision
  - 2 required items (Abstract update + Practical Implications)
  - 4 suggested modifications

These are all minor changes that can be handled in one /paper revision run,
followed directly by Stage 4.5 (FINAL INTEGRITY).
Or would you prefer a formal Stage 4 revision before another review?

My recommendation: Since all items are minor, handle them together in one
revision run and proceed directly to Stage 4.5.

Progress: [--]Writing -> [v]Integrity -> [v]Review -> [v]Revision -> [v]Re-review -> [..]Final integrity
```

**User**: Handle them together, then the final check.

---

### Minor Revision and Stage 4.5: FINAL INTEGRITY (Mode 2, final check)

```
Invoking /paper revision through the Skill tool with the 6 items as its comments

Handling minor revision items:
R1: [v] Abstract updated
R2: [v] Added Practical Implications section (200 words)
S1: [v] Table 3 confidence intervals added
S2: [v] Discussion Tinto's model paragraph added
S3: [v] Chen citation year corrected
S4: [v] Fairness metrics limitations paragraph added

Entering Stage 4.5 (FINAL INTEGRITY) -- Mode 2 (Final Check)
Executing: Phase A-F at full depth, with 100% of the paragraphs
           added or modified during revision checked in Phase D,
           and the ethics check as Phase F
Comparing with Stage 2.5 results: no earlier issue left open

Verdict: PASS (zero issues)
Ethics check: CLEARED, dual-use level None
```

**Stage 4.5 Deliverables:**
- Integrity Report (Final), saved as its own file in the run folder, ending with its ethics check
- `ml_university_attrition_taiwan.tex` (LaTeX main text)
- `references.bib` (BibTeX file)
- `figures/` (all figures and tables)

---

### Orchestrator: Pipeline Complete

```
+=========================================+
|   Researcher Pipeline Status            |
+=========================================+
| Topic: ML Approaches for Predicting     |
|        University Attrition Risk        |
+-----------------------------------------+

  Stage 2 WRITE       [--] Skipped
  Stage 2.5 INTEGRITY [v] PASS
  Stage 3 REVIEW      [v] Completed
    Mode: quick
    Decision: Major Revision (3 items)
  Stage 4 REVISE      [v] Completed
    Round: 1, Addressed: 3/3
  Stage 3' RE-REVIEW  [v] Completed
    Mode: full, Loop: 1/2
    Decision: Minor Revision (Accept)
  Stage 4.5 FINAL INTEGRITY [v] PASS (zero issues)

+-----------------------------------------+
| Materials:                              |
|   [--] RQ Brief (skipped)               |
|   [--] Methodology (skipped)            |
|   [--] Bibliography (skipped)           |
|   [--] Synthesis (skipped)              |
|   [v] Paper Draft (user-provided)       |
|   [v] Review Reports (quick + full)     |
|   [v] Revision Roadmap                  |
|   [v] Revised Draft (9,500 words)       |
|   [v] Response to Reviewers             |
|   [v] Final Paper (LaTeX)              |
+-----------------------------------------+
| Revision History:                       |
|   Round 1: Major -> 3/3 addressed       |
|   RE-REVIEW: Minor (Accept direction)   |
|   Final minor fixes before FINAL CHECK  |
+-----------------------------------------+
| Pipeline Complete!                      |
+=========================================+

Your paper is ready for submission to Computers & Education.

Final deliverables:
1. ml_university_attrition_taiwan.tex (main text)
2. references.bib (citations)
3. figures/ (figures and tables)

Pre-submission recommendations:
- Confirm C&E Author Guidelines for any additional formatting requirements
- Prepare Highlights (3-5 bullet points) and Graphical Abstract
```
