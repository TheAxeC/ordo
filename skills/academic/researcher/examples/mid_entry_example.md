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
2. Which journal (or what tier) are you targeting?

The review at Stage 3 runs /paper-review-panel full: a field analyst, the
EIC, three peer reviewers and a Devil's Advocate reviewer, then the
editorial synthesizer's decision. If the decision asks for revision,
Stage 4 runs /paper revision with the Revision Roadmap, and Stage 3'
runs /paper-review-panel re-review on the revised draft.
```

**User**: IMRaD structure. Targeting Computers & Education (SSCI Q1).

### Orchestrator: Confirm Configuration

```
Got it. Pipeline configuration:

  Stage 2 WRITE           [--] Skipped (you already have a complete paper)
  Stage 2.5 INTEGRITY:    Mode 1 (pre-review) -- mandatory, cannot be skipped
  Stage 3 REVIEW:         /paper-review-panel full -- five reviewers and an Editorial Decision
  Stage 4 REVISE:         /paper revision -- if the decision asks for revision
  Stage 3' RE-REVIEW:     /paper-review-panel re-review -- after the revision
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

Start Stage 3 (REVIEW)?

Progress: [--]Writing -> [v]Integrity -> [..]Review -> [ ]Revision -> [ ]Final integrity
```

**User**: Start.

---

### Stage 3: REVIEW (/paper-review-panel full)

```
Entering Stage 3 (REVIEW) -- invoking /paper-review-panel full through the Skill tool

Receiving user-provided paper draft...
the field analyst analyzing paper domain...
```

**Reviewer Configuration Card:**
```
Paper domain: Educational Data Mining / Higher Education
Method type: Machine Learning (Supervised Classification)
Target journal: Computers & Education (SSCI Q1, IF: 12.0)

EIC:                  Computers & Education Associate Editor
                      Learning Analytics, Educational AI
Methodology reviewer: Machine Learning expert
                      Predictive modeling, Model evaluation
Domain reviewer:      Higher Education researcher
                      Student success, Retention strategies
Perspective reviewer: Research Ethics / Data Science ethicist
                      Algorithmic fairness, Educational data mining ethics
Devil's Advocate:     Challenges the paper's core argument
```

*(The user confirms the reviewer configuration at the panel's own stop. The five reviewers review in parallel... the editorial synthesizer compiles...)*

**Editorial Decision: Major Revision**

```
Key Strengths:
1. Timely topic -- university attrition prediction highly relevant
   in Taiwan's demographic context
2. Good feature engineering -- combining MOE open data with
   institutional records is novel
3. Clear methodology -- model comparison (RF, XGBoost, LSTM)
   is well-structured

Revision Roadmap (must_fix):
C1: [CRITICAL] Ethical considerations section is missing.
    C&E requires explicit discussion of algorithmic fairness,
    student privacy, and potential discriminatory outcomes.
    -- Perspective reviewer, EIC
C2: [MAJOR] Model interpretability not discussed.
    C&E reviewers expect SHAP values or similar explainability
    analysis, not just accuracy metrics.
    -- Methodology reviewer
C3: [MAJOR] Literature gap -- no mention of Dropout Factory
    literature (Balfanz & Legters, 2004) or recent European
    attrition studies. Too Taiwan-centric for an international
    journal.
    -- Domain reviewer, Devil's Advocate
```

*(The EIC offers its revision coaching at the panel's own stop. The user says "just fix it", which skips it.)*

**Stage 3 Deliverables:**
- 5 review reports
- Editorial Decision and Revision Roadmap (3 must_fix items, priority sorted)

---

### Orchestrator: Stage 3 Checkpoint

```
[MANDATORY] Stage 3 (REVIEW) Complete!

Editorial Decision: Major Revision
  C1: [CRITICAL] Missing ethics discussion (hard requirement for C&E)
  C2: [MAJOR] Missing model interpretability analysis
  C3: [MAJOR] Literature review lacks international perspective

Next step: Stage 4 (REVISE) -- /paper revision with the Revision Roadmap.
After the revision, Stage 3' (RE-REVIEW) runs /paper-review-panel re-review.

This checkpoint requires your explicit confirmation.
Continue?

Progress: [--]Writing -> [v]Integrity -> [v]Review -> [..]Revision -> [ ]Re-review -> [ ]Final integrity
```

**User**: Start revision.

---

### Stage 4: REVISE (revision mode, Round 1)

```
Entering Stage 4 (REVISE) -- invoking /paper revision through the Skill tool

Passing Paper Draft + Revision Roadmap...
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

Next step is Stage 3' (RE-REVIEW) -- /paper-review-panel re-review checks
each Revision Roadmap item against the revised version.
This is revision cycle 1 (max 2 cycles).

Submit for re-review?

Progress: [--]Writing -> [v]Integrity -> [v]Review -> [v]Revision -> [..]Re-review -> [ ]Final integrity
```

**User**: Submit.

---

### Stage 3': RE-REVIEW (re-review mode, Loop 1)

```
Entering Stage 3' (RE-REVIEW) -- Loop 1/2

Invoking /paper-review-panel re-review through the Skill tool...
Passing Revised Draft + Revision Roadmap + Response to Reviewers...
the field analyst, the EIC and the editorial synthesizer verifying each roadmap item...
```

**Verification Review Report (R&R Traceability Matrix):**

```
C1 Ethics section:        Author's claim: added Section 5.3   Verified? [v]
  - Ethics section well-structured; recommend a "limitations of
    fairness metrics" reflection paragraph
C2 Interpretability:      Author's claim: added Section 4.3   Verified? [v]
  - SHAP analysis thorough; Table 3 precision/recall should
    include confidence intervals
C3 International lit.:    Author's claim: expanded Section 2  Verified? [v]
  - Coverage greatly improved; recommend Discussion add dialogue
    with Tinto's Student Integration Model; Section 2.1 citation
    Chen (2023) should be Chen (2024)

Residual issues:
  - Abstract does not reflect the new ethics + interpretability contributions
  - No Practical Implications section for university administrators
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

### Orchestrator: Stage 3' to 4.5 Transition

```
Stage 3' (RE-REVIEW) Complete!

Review result: Minor Revision (Accept direction)
  - Every roadmap item verified
  - 2 required items (Abstract update + Practical Implications)
  - 4 suggested modifications

With a Minor decision, these items go to one /paper revision run, with
the items as its comments file, followed directly by Stage 4.5 (FINAL
INTEGRITY). No further review follows.

Continue?

Progress: [--]Writing -> [v]Integrity -> [v]Review -> [v]Revision -> [v]Re-review -> [..]Final integrity
```

**User**: Continue.

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
    Run: /paper-review-panel full
    Decision: Major Revision (3 items)
  Stage 4 REVISE      [v] Completed
    Round: 1, Addressed: 3/3
  Stage 3' RE-REVIEW  [v] Completed
    Run: /paper-review-panel re-review, Loop: 1/2
    Decision: Minor Revision (Accept)
  Stage 4.5 FINAL INTEGRITY [v] PASS (zero issues)

+-----------------------------------------+
| Materials:                              |
|   [--] RQ Brief (skipped)               |
|   [--] Methodology (skipped)            |
|   [--] Bibliography (skipped)           |
|   [--] Synthesis (skipped)              |
|   [v] Paper Draft (user-provided)       |
|   [v] Review Reports (5) + Re-review    |
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
