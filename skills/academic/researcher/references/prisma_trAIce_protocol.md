---
title: PRISMA-trAIce Protocol (snapshot)
snapshot_date: "2025-12-10"
upstream_source: "https://github.com/cqh4046/PRISMA-trAIce"
upstream_version_commit: "main"
update_policy: "Manual sync."
citation: "Holst D, et al. Transparent Reporting of AI in Systematic Literature Reviews: Development of the PRISMA-trAIce Checklist. JMIR AI. 2025. doi:10.2196/80247"
---

# PRISMA-trAIce Protocol

Verbatim snapshot of the 17-item PRISMA-trAIce checklist from the GitHub canonical source (`cqh4046/PRISMA-trAIce`), dated 2025-12-10, with per-item researcher check procedures and tier-based behaviour.

**Used by**: the compliance agent.

> **Upstream sync warning.** If `cqh4046/PRISMA-trAIce` updates, this file is re-synced by hand and its `snapshot_date` + `upstream_version_commit` are bumped.

## Status disclaimer

**PRISMA-trAIce is a foundational proposal, not a Delphi-consensus standard.** Holst et al. (2025) explicitly characterize their checklist as a "well-reasoned albeit preliminary guideline," developed via systematic adaptation of PRISMA 2020 rather than "a formal, broad-based Delphi study or consensus meeting," and note that the 17 items "have not yet been empirically validated across diverse research contexts." The authors frame PRISMA-trAIce as a "foundational proposal" and a "living standard" intended for the research community to "immediately adopt and refine."

researcher adopts the authors' Mandatory / Highly Recommended / Recommended / Optional tier system as defined upstream, and treats Mandatory failures as Stage 2.5 / 4.5 blocks (per the Tier legend below). This block-on-Mandatory choice follows the authors' own argument that the risk of non-transparent AI use outweighs the risk of adopting a preliminary guideline. Future revisions of the upstream living standard are pulled in by a manual re-sync of this file.

> See Holst D, et al. JMIR AI. 2025. doi:[10.2196/80247](https://doi.org/10.2196/80247), Discussion and Limitations sections.

## Tier legend

| Tier | Behaviour when item FAILs |
|---|---|
| Mandatory (M) | **Block**: pipeline halts; user must backfill, retreat a stage, or use the 3-round override ladder (see `references/compliance_checkpoint_protocol.md`, Override Ladder (3-round friction)) |
| Highly Recommended (HR) | **Warn**: surfaced at checkpoint; user can skip |
| Recommended (R) | **Info**: logged in compliance_report, shown as dashboard bullet |
| Optional (O) | **Info**: same as R |

> **Gap-tag vocabulary.** Tags `[MATERIAL GAP]`, `[WEAK EVIDENCE]`, `[GAP]` used in this protocol's `reason` fields are defined in `references/compliance_checkpoint_protocol.md`, Canonical gap-tag vocabulary.

## Stage assignment

| Checked at | Items |
|---|---|
| Stage 2.5 (Methods) | M1, M2, M3, M4, M5, M6, M7, M8, M9, M10 |
| Stage 4.5 (remaining) | T1, A1, I1, R1, R2, D1, D2 |

## Items

### T1: Title
**Tier:** Optional
**Original (upstream verbatim):** "Indicate the use of AI in the title or subtitle if it played a substantial role."
**researcher check procedure:** If `user_metadata.ai_tools_used[].stage` includes any of `{screening, data_extraction, synthesis, writing}` (i.e. substantial involvement), verify manuscript title OR subtitle mentions AI. If none of the AI tools are substantial, pass automatically.
**Pass criterion:** Substring match for one of: "AI-assisted", "AI-augmented", "artificial intelligence", "LLM-assisted", or language-equivalent.

### A1: Abstract
**Tier:** Optional
**Original:** "Briefly summarize the AI tool(s) used, the review stage(s) where they were applied."
**researcher check procedure:** Locate manuscript abstract. Verify it names >=1 AI tool AND the review stages.
**Pass criterion:** Both named. Absence of either is a fail.

### I1: Introduction
**Tier:** Recommended
**Original:** "Briefly state the rationale for using AI tools for specific tasks."
**researcher check procedure:** In introduction, locate one sentence or more that explains why AI was chosen for its task.
**Pass criterion:** Rationale present and tied to >=1 specific AI task.

### M1: Protocol registration
**Tier:** Mandatory
**Original:** "State if the use of AI was pre-specified in a protocol, and document deviations."
**researcher check procedure:** Check `material_passport.protocol_registration` field OR the manuscript's Methods section for explicit pre-registration statement. If AI was added mid-review, check for a "deviation from protocol" paragraph.
**Pass criterion:** Either (a) pre-registration clearly stated, or (b) deviation explicitly disclosed.

### M2: Tool identification and access
**Tier:** Mandatory
**Original:** "Specify name, version, and provider/developer for each tool, with access details."
**researcher check procedure:** For each entry in `user_metadata.ai_tools_used`, require `name`, `version`, `developer`. If tool is open-source, require repository URL or DOI.
**Pass criterion:** All three fields non-empty for every tool.

### M3: Purpose and stage
**Tier:** Mandatory
**Original:** "Describe the specific SLR stage and the precise task the AI performed."
**researcher check procedure:** For each tool, verify stage-level task description exists (not just "used AI for screening").
**Pass criterion:** Per-tool, per-stage prose description of >=1 sentence in the manuscript's Methods section.

### M4: Input data
**Tier:** Mandatory
**Original:** "Describe data provided to the AI (e.g., training data for fine-tuning)."
**researcher check procedure:** If any tool was fine-tuned or custom-trained, verify dataset description (source, size, preprocessing). If no fine-tuning, verify this is explicitly stated.
**Pass criterion:** Either (a) dataset described, or (b) explicit "no fine-tuning performed" statement.

### M5: Output data
**Tier:** Mandatory
**Original:** "Describe the output format (e.g., JSON, scores) and any automated post-processing."
**researcher check procedure:** Verify the manuscript's Methods section documents output format per tool + any post-processing pipelines.
**Pass criterion:** Format + post-processing both described.

### M6: Prompt engineering
**Tier:** Mandatory
**Original:** "Report prompt engineering process, full prompts, key parameters for LLMs."
**researcher check procedure:** If any tool is an LLM, verify full prompt text is included (main text or supplementary) AND model parameters (temperature, top_p, max tokens, model version) are documented.
**Pass criterion:** All three present for every LLM tool.

### M7: Operational details
**Tier:** Highly Recommended
**Original:** "Describe key operational settings, algorithms, or configurations for non-LLM AI."
**researcher check procedure:** For classical ML tools (e.g. ASReview, Abstrackr), verify algorithm + hyperparameters documented.
**Pass criterion:** Algorithm name + at least 2 hyperparameters.

### M8: Human-AI interaction
**Tier:** Mandatory
**Original:** "Describe human interaction (number of reviewers, verification process)."
**researcher check procedure:** Verify the manuscript's Methods section states reviewer count, qualifications, and oversight mechanism (e.g., independent dual screening, adjudication).
**Pass criterion:** Reviewer count + oversight mechanism both present.

### M9: AI performance evaluation methods
**Tier:** Mandatory
**Original:** "Describe methods used to evaluate AI performance (metrics, reference standards)."
**researcher check procedure:** Verify the manuscript's Methods section describes what performance metrics were computed (e.g., sensitivity, agreement) and against what gold standard.
**Pass criterion:** Metric + reference standard both stated.

### M10: Data management
**Tier:** Recommended
**Original:** "Describe data management, storage, privacy measures, and compliance."
**researcher check procedure:** Verify the manuscript's Methods section addresses data handling (where stored, privacy controls, GDPR/IRB compliance if applicable).
**Pass criterion:** >=2 of {storage, privacy, compliance} addressed.

### R1: Study selection (AI-assisted)
**Tier:** Mandatory
**Original:** "In the PRISMA flow diagram/text, distinguish between records handled by AI versus human reviewers."
**researcher check procedure:** Verify PRISMA flow diagram or accompanying text explicitly separates AI-handled vs human-handled records at each screening stage.
**Pass criterion:** Explicit AI/human split in flow diagram numbers OR prose.

### R2: AI performance metrics (results)
**Tier:** Mandatory
**Original:** "Report results of any AI performance evaluations (e.g., agreement rates)."
**researcher check procedure:** Verify the manuscript's Results section reports numeric performance outcomes referenced by M9.
**Pass criterion:** >=1 quantitative metric (% agreement, Cohen's kappa, sensitivity, etc.).

### D1: Limitations of AI use
**Tier:** Recommended
**Original:** "Discuss limitations (technical issues, biases, hallucinations) and their impact."
**researcher check procedure:** Verify the manuscript's Discussion section has >=1 paragraph specifically on AI limitations (not generic review limitations).
**Pass criterion:** Dedicated AI-limitations paragraph of >=3 sentences.

### D2: Implications of AI use
**Tier:** Optional
**Original:** "Briefly discuss the experience of using AI tools for future reviews."
**researcher check procedure:** Verify the manuscript's Discussion section reflects on the usability/experience of AI for this review, forward-looking.
**Pass criterion:** >=1 forward-looking sentence about AI utility.

## Summary counts

- Mandatory: 10: M1, M2, M3, M4, M5, M6, M8, M9, R1, R2
- Highly Recommended: 1: M7
- Recommended: 3: I1, M10, D1
- Optional: 3: T1, A1, D2

Total: 17 items.

> **researcher promotion note.** Upstream's README header summary says "Mandatory: 9". Per-item tier annotations in upstream (and mirrored here) mark **both R1 and R2 as Mandatory**, summing to 10. researcher treats the per-item annotation as authoritative, since the Results-stage items (R1: AI/human split in flow diagram; R2: AI performance metric reporting) are both operationally block-level for a compliance audit. If upstream clarifies the discrepancy, re-sync.
