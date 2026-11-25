# Handoff Schemas: Cross-Skill Data Contracts

## Purpose

Defines the exact data structure for every artifact passed between pipeline stages. All agents that produce or consume these artifacts MUST conform to these schemas. Consuming agents should validate input and request re-generation if schema violations are found.

> **Convention**: All schemas use Markdown-based structured output. Agents MUST validate required fields before accepting a handoff. Missing required fields trigger a `HANDOFF_INCOMPLETE` failure path.

---

## Schema 1: RQ Brief (research materials to `paper`)

**Consumer**: the `paper` skill's intake agent

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `research_question` | string | The finalized research question (single sentence, interrogative form) |
| `sub_questions` | list[string] | 2-5 decomposed sub-questions |
| `finer_scores` | object | `{feasible: 1-10, interesting: 1-10, novel: 1-10, ethical: 1-10, relevant: 1-10}` |
| `scope` | object | `{in_scope: list[string], out_of_scope: list[string], domain: string, timeframe: string, geography: string, population: string}` |
| `methodology_type` | enum | `"qualitative"` / `"quantitative"` / `"mixed"` |
| `theoretical_framework` | string | Name of the selected or emergent theoretical framework |
| `keywords` | list[string] | 5-10 search terms for literature search |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `socratic_insights` | list[string] | Key insights from Socratic dialogue (if socratic mode) |
| `hypothesis` | string | Preliminary hypothesis (if applicable) |
| `exclusion_criteria` | list[string] | What is explicitly out of scope |
| `stakeholders` | list[string] | Key stakeholders affected by the research |
| `ethical_flags` | list[string] | Preliminary ethical considerations |

### Example

```markdown
## RQ Brief

**Research Question**: How does AI-assisted formative assessment affect undergraduate learning outcomes in STEM courses at Taiwanese universities?

**Sub-Questions**:
1. What types of AI-assisted formative assessment tools are currently used in Taiwan HEI STEM courses?
2. What measurable learning outcome improvements have been documented?
3. What student and faculty perceptions exist regarding AI-assisted assessment?

**FINER Scores**: Feasible: 8, Interesting: 9, Novel: 7, Ethical: 9, Relevant: 10

**Scope**:
- In scope: AI-assisted formative assessment, STEM undergraduate courses, Taiwan HEIs, 2018-2025
- Out of scope: K-12 education, summative assessment only, non-STEM disciplines
- Domain: Higher Education, Educational Technology
- Timeframe: 2018-2025
- Geography: Taiwan (with international comparisons)
- Population: Undergraduate STEM students

**Methodology Type**: Mixed methods (quasi-experimental + survey)

**Theoretical Framework**: Technology Acceptance Model (TAM) + Hattie's Feedback Framework

**Keywords**: AI assessment, formative assessment, STEM education, Taiwan higher education, learning outcomes, educational technology, automated feedback
```

---

## Schema 2: Bibliography (research materials to `paper`)

**Consumer**: the `paper` skill's literature strategist

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `sources` | list[Source] | All identified sources (minimum 15 for full mode, 5 for quick mode) |
| `search_strategy` | object | `{databases: list[string], keywords: list[string], inclusion_criteria: list[string], exclusion_criteria: list[string], date_range: string}` |
| `coverage_assessment` | string | Self-assessment of literature coverage completeness |
| `minimum_sources` | integer | 15 (full mode), 5 (quick mode) |

### Source Object

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | string | Yes | Unique identifier (e.g., `[S01]`) |
| `title` | string | Yes | Source title |
| `authors` | string | Yes | Author(s) |
| `year` | integer | Yes | Publication year |
| `doi` | string | Yes* | DOI if available (*required for journal articles) |
| `citation` | string | Yes | Full APA 7 citation |
| `type` | enum | Yes | `journal_article` / `book` / `chapter` / `conference` / `report` / `thesis` / `preprint` / `web` |
| `evidence_tier` | integer | Yes | 1-7 (1 = systematic review/meta-analysis, 7 = expert opinion) |
| `quality_tier` | enum | Yes | `tier_1` (peer-reviewed top journal) / `tier_2` (peer-reviewed) / `tier_3` (other academic) / `tier_4` (grey literature) |
| `relevance` | enum | Yes | `core` (directly addresses RQ) / `supporting` (provides context) / `peripheral` (tangential) |
| `relevance_score` | integer | Yes | 1-10 relevance to the research question |
| `annotation` | string | Yes | 2-3 sentence summary of key findings and relevance |
| `verified` | boolean | No | Whether DOI/existence has been verified |
| `retraction_check` | boolean | No | Whether checked against Retraction Watch |
| `semantic_scholar_id` | string / null | No | Semantic Scholar paper ID. Null if S2 lookup failed or API unavailable. Used for deduplication and re-verification. |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `prisma_counts` | object | `{identified: int, screened: int, eligible: int, included: int}` (if systematic review) |

### Example

```markdown
## Bibliography

**Search Strategy**:
- Databases: Scopus, Web of Science, ERIC, Airiti Library
- Keywords: "AI assessment" AND "higher education" AND "Taiwan"; "formative assessment" AND "artificial intelligence"
- Inclusion: Peer-reviewed, English or Chinese, empirical or review, 2018-2025
- Exclusion: K-12, non-STEM, editorials
- Date Range: 2018-2025

**Coverage Assessment**: Strong coverage of English-language literature. Moderate coverage of Chinese-language sources (Airiti). Gap: limited grey literature from Taiwan MOE reports.

**Minimum Sources**: 15

### Sources

[S01] Wang, L., & Chen, H. (2023). AI-powered formative assessment in undergraduate physics... *Computers & Education*, 195, 104721. https://doi.org/10.xxxx
- Type: journal_article | Evidence Tier: 2 | Quality: tier_1 | Relevance: core | Score: 9
- Annotation: RCT with 240 students showing 15% improvement in exam scores with AI feedback. Directly addresses RQ sub-question 2.
```

---

## Schema 3: Synthesis Report (research materials to `paper`)

**Consumer**: the `paper` skill's argument builder

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `themes` | list[Theme] | 3-7 synthesized themes (NOT per-source summaries) |
| `research_gaps` | list[string] | What the literature does NOT address |
| `key_debates` | list[Debate] | Where sources disagree, with analysis |
| `methodology_recommendations` | list[string] | Recommended methodological approaches based on gaps |
| `theoretical_implications` | list[string] | How the synthesis informs theoretical understanding |
| `consensus_areas` | list[string] | Where sources agree |

### Theme Object

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Theme label |
| `description` | string | 3-5 sentence synthesis across multiple sources |
| `supporting_sources` | list[string] | Source IDs that contribute to this theme |
| `contradicting_sources` | list[string] | Source IDs that challenge this theme (if any) |
| `strength` | enum | `strong` (5+ sources) / `moderate` (3-4) / `emerging` (1-2) |

### Debate Object

| Field | Type | Description |
|-------|------|-------------|
| `position_a` | string | First position |
| `position_b` | string | Opposing position |
| `sources_a` | list[string] | Source IDs supporting position A |
| `sources_b` | list[string] | Source IDs supporting position B |
| `evidence_balance` | string | Analysis of which position has stronger evidence and why |

### Example

```markdown
## Synthesis

### Theme 1: Immediate Feedback Loop as Primary Mechanism
AI-assisted assessment's primary advantage lies in the immediacy of feedback, reducing the gap between student action and corrective input. Multiple studies [S01, S04, S07, S12] converge on feedback latency as the key variable, with effect sizes ranging from d=0.3 to d=0.8. This aligns with Hattie's (2009) feedback framework...

**Strength**: Strong (5 sources)
**Supporting**: [S01, S04, S07, S12, S15]
**Contradicting**: [S09] (argues quality matters more than speed)

### Research Gaps
1. No longitudinal studies (>1 year) in Taiwan context
2. Limited data on AI assessment in laboratory courses

### Key Debates
| Position A | Position B | Evidence Balance |
|------------|------------|-----------------|
| AI feedback improves all STEM equally [S01, S04] | Effects concentrated in math/physics, weaker in biology [S08, S11] | Position B has stronger evidence; likely due to assessment type differences |
```

---

## Schema 4: Paper Draft (`paper` to the integrity agent and the reviewers)

**Producer**: the `paper` skill's draft writer
**Consumer**: the integrity agent | the `paper-review-panel` skill's reviewers

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `title` | string | Paper title |
| `abstract` | object | `{english: string, chinese: string}` (chinese is required only if bilingual) |
| `authors` | list[Author] | Author information with CRediT roles |
| `keywords` | object | `{en: list[string], zh_tw: list[string]}` bilingual keywords (3-6 each) |
| `sections` | list[Section] | Ordered paper sections |
| `references` | list[Reference] | Full reference list with cross-referencing |
| `total_word_count` | integer | Total word count (excluding references) |
| `citation_format` | enum | `"APA7"` / `"Chicago"` / `"MLA"` / `"IEEE"` / `"Vancouver"` |
| `structure_type` | enum | `"IMRaD"` / `"literature_review"` / `"theoretical"` / `"case_study"` / `"policy_brief"` / `"conference"` |

### Section Object

| Field | Type | Description |
|-------|------|-------------|
| `heading` | string | Section heading |
| `level` | integer | Heading level (1-4) |
| `content` | string | Full section text |
| `word_count` | integer | Word count for this section |
| `citation_count` | integer | Number of in-text citations in this section |
| `argument_strength` | enum | `compelling` / `strong` / `adequate` / `weak` (see argument_builder scoring) |

### Reference Object

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique reference ID (e.g., `[R01]`) |
| `full_citation` | string | Full formatted citation |
| `doi` | string | DOI if available |
| `cited_in_sections` | list[string] | Section headings where this reference is cited |

### Author Object

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Full name |
| `affiliation` | string | Institution |
| `email` | string | Contact email (corresponding author only) |
| `credit_roles` | list[string] | CRediT taxonomy roles |
| `corresponding` | boolean | Is corresponding author |

---

## Schema 5: Integrity Report (the integrity agent to the pipeline)

**Producer**: the integrity agent
**Consumer**: the orchestrator | the `paper` skill's draft writer (for revision)

Each integrity report is its own file in the run folder `researcher-runs/<mode>-<date>/`.

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `verdict` | enum | `"PASS"` / `"PASS_WITH_CONDITIONS"` / `"FAIL"` |
| `mode` | enum | `"pre-review"` / `"final-check"` |
| `phases` | object | See Phase Structure below |
| `overall_issues` | object | `{SERIOUS: integer, MEDIUM: integer, MINOR: integer}` |
| `citation_integrity_score` | float | 0.0-1.0 score for citation accuracy |
| `fabrication_risk_score` | float | 0.0-1.0 score (0 = no risk detected) |
| `score_trajectory` | object / null | Review score delta tracking (optional). Present only during re-review. See Score Trajectory Structure below. |
| `timestamp` | string | ISO 8601 timestamp of verification |

### Phase Structure

```
phases: {
  A_references: {
    checked: integer,
    passed: integer,
    failed: integer,
    issues: [{ref_id: string, issue_type: string, severity: enum, detail: string}]
  },
  B_citation_context: {
    sampled: integer,
    verified: integer,
    issues: [{ref_id: string, section: string, issue: string}]
  },
  C_data: {
    claims_checked: integer,
    verified: integer,
    issues: [{claim: string, expected: string, actual: string, severity: enum}]
  },
  D_originality: {
    checked: boolean,
    issues: [{type: string, severity: enum, detail: string}]
  },
  E_claims: {
    checked: integer,
    verified: integer,
    distortions: [{claim: string, source: string, verdict: string, detail: string}]
  }
}
```

### Score Trajectory Structure (optional)

Present only when the integrity report is for a re-review (Stage 3' or 4'). Tracks rubric score changes across revision rounds.

Dimension names match the 7 universal review dimensions from the `paper-review-panel` skill's `references/review_criteria_framework.md` plus an overall score. The scoring scale is **0-100**, per the `paper-review-panel` skill's `references/quality_rubrics.md`: the scale the report template instructs reviewers to score on, and the scale the SKILL.md Early-Stopping Criterion ("delta < 3 points on the 0-100 rubric") and the delta thresholds below assume:

```
score_trajectory: {
  round: integer,          // revision round number (1 or 2)
  previous_scores: {       // rubric scores from prior review (0-100 scale per quality_rubrics.md)
    originality: float,
    methodological_rigor: float,
    evidence_sufficiency: float,
    argument_coherence: float,
    writing_quality: float,
    literature_integration: float,
    significance_impact: float,
    overall: float
  },
  current_scores: {        // rubric scores from this review (0-100 scale per quality_rubrics.md)
    originality: float,
    methodological_rigor: float,
    evidence_sufficiency: float,
    argument_coherence: float,
    writing_quality: float,
    literature_integration: float,
    significance_impact: float,
    overall: float
  },
  deltas: {                // current - previous for each dimension
    originality: float,
    methodological_rigor: float,
    evidence_sufficiency: float,
    argument_coherence: float,
    writing_quality: float,
    literature_integration: float,
    significance_impact: float,
    overall: float
  },
  regression_detected: boolean,  // true if any delta < -3
  regressed_dimensions: list[string],  // names of dimensions where delta < -3
  early_stop_eligible: boolean   // true if overall delta < 3 AND no P0 issues (existing criterion)
}
```

**Consumer**: the orchestrator uses `regression_detected` to trigger a warning checkpoint. The editorial synthesizer includes trajectory in re-review reports.

### Issue Severity Levels

| Severity | Meaning | Pipeline Impact |
|----------|---------|-----------------|
| `SERIOUS` | Fabricated reference, falsified data, gross distortion | Blocks pipeline; MUST fix |
| `MEDIUM` | Wrong DOI, incorrect page number, misattribution | Blocks pipeline; MUST fix |
| `MINOR` | Missing co-author, formatting inconsistency | Does NOT block; advisory |

---

## Schema 6: Review Report (`paper-review-panel` to the pipeline)

**Producer**: the `paper-review-panel` skill's editorial synthesizer
**Consumer**: the orchestrator | the `paper` skill's draft writer

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `editorial_decision` | enum | `"Accept"` / `"Minor Revision"` / `"Major Revision"` / `"Reject"` |
| `reviewer_reports` | list[ReviewerReport] | Individual review reports |
| `consensus` | enum | `"CONSENSUS-4"` / `"CONSENSUS-3"` / `"SPLIT"` / `"DA-CRITICAL"` |
| `revision_roadmap` | list[RoadmapItem] | Prioritized list of required changes |
| `confidence_score` | integer | 0-100 editorial confidence |

### ReviewerReport Object

| Field | Type | Description |
|-------|------|-------------|
| `reviewer_id` | string | Reviewer identifier (e.g., `EIC`, `R1`, `R2`, `R3`, `DA`) |
| `role` | string | Reviewer role description |
| `dimension_scores` | object | Per-dimension scores (skill-specific) |
| `strengths` | list[string] | Paper strengths identified |
| `weaknesses` | list[Weakness] | Paper weaknesses identified |
| `questions` | list[string] | Questions for the authors |

### Weakness Object

| Field | Type | Description |
|-------|------|-------------|
| `description` | string | What the weakness is |
| `severity` | enum | `critical` / `major` / `minor` |
| `type` | enum | `methodology` / `theory` / `evidence` / `writing` / `structure` / `ethics` |

---

## Schema 7: Revision Roadmap (the review to the `paper` revision)

**Producer**: the `paper-review-panel` skill's editorial synthesizer
**Consumer**: the `paper` skill's draft writer | the orchestrator

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `items` | list[RoadmapItem] | Ordered list of revision items |
| `total_items` | integer | Total number of items |
| `must_fix_count` | integer | Number of `must_fix` priority items |
| `editorial_decision` | enum | `"Accept"` / `"Minor Revision"` / `"Major Revision"` / `"Reject"` |
| `consensus_summary` | string | Summary of reviewer consensus |
| `dissenting_opinions` | list[string] | Notable disagreements among reviewers |

### RoadmapItem Object

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique revision ID (e.g., `REV-001`) |
| `description` | string | What needs to change |
| `reviewer` | string | Which reviewer(s) raised this (e.g., `R1, R3`) |
| `type` | enum | `"Major"` / `"Minor"` / `"Editorial"` |
| `priority` | enum | `"must_fix"` / `"should_fix"` / `"consider"` |
| `target_section` | string | Section of the paper to modify |
| `suggested_action` | string | How to address the item |
| `consensus_level` | enum | `"CONSENSUS-4"` / `"CONSENSUS-3"` / `"SPLIT"` / `"DA-CRITICAL"` |
| `verification_criteria` | string | How to confirm the fix is adequate |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `deadline_suggestion` | string | Suggested timeline for completion |

---

## Schema 8: Response to Reviewers (the `paper` revision to the re-review)

**Producer**: the `paper` skill's draft writer (revision mode)
**Consumer**: the `paper-review-panel` skill's editorial synthesizer (re-review)

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `revision_round` | integer | Which revision round (1, 2, ...) |
| `items` | list[ResponseItem] | Response to each revision roadmap item |
| `summary` | object | `{resolved: integer, limitations: integer, unresolvable: integer, disagreed: integer}` |
| `word_count_delta` | integer | Net word count change (positive = added, negative = removed) |
| `new_references_added` | integer | Count of new references added during revision |
| `summary_of_changes` | string | High-level summary of all modifications |
| `new_content_highlight` | list[string] | Sections with substantial new content |

### ResponseItem Object

| Field | Type | Description |
|-------|------|-------------|
| `roadmap_item_id` | string | Corresponds to RoadmapItem.id (e.g., `REV-001`) |
| `reviewer_comment` | string | Original reviewer comment (quoted) |
| `author_response` | string | Detailed response to the reviewer |
| `change_location` | string | Where in the paper the change was made (section + paragraph) |
| `status` | enum | `"RESOLVED"` / `"DELIBERATE_LIMITATION"` / `"UNRESOLVABLE"` / `"REVIEWER_DISAGREE"` |
| `decline_justification` | string | Required if status is `DELIBERATE_LIMITATION`, `UNRESOLVABLE`, or `REVIEWER_DISAGREE`; must cite evidence |

### Example

```markdown
## Response to Reviewers, Round 1

**Summary**: We have addressed all 12 revision items. 10 were fully addressed, 1 marked as deliberate limitation with explanation, and 1 respectfully declined with justification.

**Word Count Delta**: +420 words
**New References Added**: 3

### REV-001 (R1, R2; CONSENSUS-3, must_fix)
**Reviewer Comment**: "The sample size justification is insufficient for the claimed effect size."
**Status**: RESOLVED
**Response**: We have added a formal power analysis (G*Power 3.1) in Section 3.2, paragraph 2. The analysis confirms that our sample of N=240 provides 0.85 power to detect a medium effect (d=0.5) at alpha=0.05...
**Changes**: Section 3.2 paragraph 2 (new content, +180 words)

### REV-007 (DA; DA-CRITICAL, must_fix)
**Reviewer Comment**: "The Discussion states causal effects that a cross-sectional design cannot support."
**Status**: RESOLVED
**Response**: We acknowledge this valid concern. We have reworded the causal claims in the Discussion as associations, and stated in the Methods that the design does not support causal inference...
**Changes**: Section 5 paragraphs 1-3 (causal wording replaced), Section 3.1 paragraph 4 (design limitation added)
```

---

## Schema 9: Material Passport (cross-stage metadata)

**Purpose**: Accompanies every artifact as it passes between stages, providing provenance and verification tracking.

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `origin_skill` | string | Which skill produced this artifact (e.g., `researcher`, `paper`) |
| `origin_mode` | string | Which mode was used (e.g., `full`, `socratic`, `pre-review`) |
| `origin_date` | string | ISO 8601 timestamp of production |
| `verification_status` | enum | `"VERIFIED"` / `"UNVERIFIED"` / `"STALE"` |
| `version_label` | string | Version identifier (e.g., `v1.0`, `v1.1-revised`, `paper_draft_v2`) |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `integrity_pass_date` | string | ISO 8601 timestamp of last integrity verification pass (if applicable) |
| `content_hash` | string | SHA-256 hash of the content (for change detection) |
| `upstream_dependencies` | list[string] | Version labels of artifacts this one depends on |
| `repro_lock` | object \| null | configuration lockfile for artifact reproducibility. See `references/artifact_reproducibility_pattern.md`. `null` = honest opt-out. The key is required; an omitted key is malformed. |
| `compliance_history` | list[object] | Append-only audit trail of `compliance_report` entries (Schema 12). See Schema 12 below. |
| `experiment_intake_declaration` | object | Passport-level intake decision. `status` is one of `{experiments_declared, no_experiments_declared}` + `declared_at` + `declared_by: scholar`. Written with the record of the experiments: by the `research` mode's last stage, or, for a project that did not go through `research`, by the integrity check with the user. **Fail-closed**: a passport with this field ABSENT is a gate FAIL. Even a literature-only run must carry `{status: no_experiments_declared}`. The declaration and the provenance agree: `experiments_declared` with a non-empty `experiment_provenance[]`, `no_experiments_declared` with none. See Experiment Provenance Intake below. |
| `experiment_provenance` | list[object] | The record of the experiments: one entry per experiment, `experiment_id` (passport-flat, frozen at intake) + nested `repro_lock` + `planned_vs_executed[]` + `negative_results[]` + `known_limitations[]`. The integrity check does not run experiments and does not judge experiment correctness. Joined from claims by the integrity agent's reading of the manuscript: each sentence that reports an outcome of the author's own experiments is matched to the entry whose result it reports. Gated at the integrity verification stage (Stage 2.5/4.5). |
| `experiment_alignment_results` | list[object] | Optional aggregate of claim-to-experiment alignment verdicts; `alignment_verdict` is one of `{ALIGNED, OVERSTATED, NOT_SUPPORTED_BY_PROVENANCE, PROVENANCE_INSUFFICIENT}`. **Produced by the integrity agent AT the gate** (mirrors Phase C3). EA-INV-1/2 require id-uniqueness + reference resolution. Carried forward by the orchestrator's aggregate hand-off. |

### Example

```markdown
## Material Passport

- Origin Skill: paper
- Origin Mode: full
- Origin Date: 2026-03-08T14:30:00Z
- Verification Status: VERIFIED
- Version Label: paper_draft_v2
- Integrity Pass Date: 2026-03-08T15:45:00Z
- Content Hash: a3f2b7c9...
- Upstream Dependencies: [research_v1, bibliography_v1, synthesis_v1]
```

### Experiment Provenance Intake

Schema 9 carries the **intake + alignment** layer for experiments, NOT an execution layer. The record of the experiments is read from the project: the `research` mode's last stage writes it there in this form; for a project that did not go through `research`, the integrity check asks once whether the paper has experiments and builds the record with the user from the result files. This extension records disclosure and lets manuscript claims be audited against declared provenance. It does **not** run experiments, judge experiment correctness, or require provenance for literature-only pipelines.

**Three additions** (all under the Optional-Fields table above):

1. `experiment_intake_declaration` (passport-level object): the intake decision, written with the record of the experiments:

   ```yaml
   experiment_intake_declaration:
     status: experiments_declared        # | no_experiments_declared
     declared_at: "2026-06-08T10:00:00Z"
     declared_by: scholar                # always scholar: an intake decision, not an agent emission
   ```

   **Fail-closed.** The declaration is REQUIRED, and its absence is a gate FAIL. Even a pure-literature run must emit `{status: no_experiments_declared}`.

2. `experiment_provenance[]` (the record of the experiments): one entry per experiment:

   ```yaml
   experiment_provenance:
     - experiment_id: exp-ablation-A      # passport-flat, FROZEN at intake (a rename is a re-intake event)
       title: "Ablation: remove head pruning"
       repro_lock: { schema_version: "1.0", ... }   # same inline shape as the passport-level repro_lock
       planned_vs_executed:
         - planned: "macro-F1 on held-out test, pruning removed"
           executed: true
           result_file: results/ablation_A.json
           metric: macro-F1
           value: 0.842
       negative_results: []               # KEY MUST be present (absent = malformed FAIL); empty [] is well-formed
       known_limitations: []              # KEY MUST be present; empty [] routes to the check-4 advisory
   ```

   The `experiment_id` values are FROZEN once `status == experiments_declared` is set; each `experiment_alignment_results[]` row references that key space through its `experiment_id`. A post-intake rename is a re-intake event, caught by EP-INV-2 if a row's reference dangles.

3. `experiment_alignment_results[]` (integrity-agent-produced list): each row carries an `alignment_verdict` computed by the integrity agent **at the gate** (Stage 2.5/4.5), mirroring Phase C3. The claims of the check are the sentences of the manuscript that report an outcome of the author's own experiments, each matched to the entry of `experiment_provenance[]` it reports. A mixed-evidence claim (one that cites sources AND reports an outcome of the author's own experiments) gets a citation verdict of Phases B and E AND one `experiment_alignment_results[]` row; the gate combines them worst-verdict-wins.

**Invariants**: EP-INV-1 (experiment_id unique/passport); EP-INV-2 (each experiment-backed claim matches an entry; rename + forward-reference guard); EP-INV-3 (experiment-backed claims are empirical; mixed literature+experiment allowed); EP-INV-4 (declaration and provenance agree); EA-INV-1 (finding_id unique); EA-INV-2 (alignment row references resolve; dangling id = structural FAIL, never a verdict).

---

## Schema 10: Style Profile (the intake agent to the draft writer)

**Producer**: the `paper` skill's intake agent (Step 10)
**Consumer**: the `paper` skill's draft writer
**Carried by**: the Material Passport (optional field)

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `calibration_source` | list[string] | Filenames or titles of the analyzed writing samples |
| `sample_count` | integer | Number of samples analyzed (minimum 1, recommended 3+) |
| `sentence_length` | object | `{mean: float, stddev: float, rhythm_pattern: string}` |
| `paragraph_length` | object | `{mean_sentences: float, variation: string}` |
| `vocabulary_preferences` | object | `{hedging_words: list[string], transition_words: list[string], preferred_verbs: list[string], formality: string}` |
| `citation_style` | object | `{narrative_ratio: float, parenthetical_ratio: float, density: float, placement: string}` |
| `modifier_style` | enum | `"minimal"` / `"moderate"` / `"elaborate"` |
| `register_shifts` | list[object] | `[{section_name: string, assertiveness_level: string}]` |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `conflicts_with_discipline` | list[string] | Noted conflicts between personal style and discipline/journal norms |
| `partial_profile` | boolean | `true` if < 3 samples were analyzed (lower confidence) |
| `language_mismatch` | boolean | `true` if samples are in a different language than the target paper |

### Consumption Priority System

```
Priority 1 (HARD):   Discipline conventions: cannot be violated
Priority 2 (STRONG): Target journal conventions: if specified
Priority 3 (SOFT):   Author's personal style: only where it does not conflict with 1 or 2
```

### Example

```markdown
## Style Profile

**Calibration Source**: ["Chen_2024_AI_assessment.pdf", "Chen_2023_formative_feedback.pdf", "Chen_2022_STEM_pedagogy.pdf"]
**Sample Count**: 3

**Sentence Length**: mean: 22, stddev: 8, rhythm: "variable: mixes 10-word punchy sentences with 35-word complex ones"
**Paragraph Length**: mean 5 sentences, variation: "moderate: 3-7 sentences, shorter in Methods"
**Vocabulary Preferences**:
  - Hedging: suggests, appears to, may
  - Transitions: However, In contrast, Yet
  - Reporting verbs: found, argued, noted
  - Formality: moderate-formal
**Citation Style**: narrative 40%, parenthetical 60%, density 2.3/paragraph, placement: mixed
**Modifier Style**: minimal
**Register Shifts**: [Methods: neutral, Results: descriptive, Discussion: assertive, Conclusion: personal]
**Conflicts**: "Author prefers passive voice (68% in samples), but Education discipline conventions favor active voice; using active voice per convention."
```

---

### Schema 11: R&R Traceability Matrix

**Producer (multi-stage)**:
- `concern_id` / `priority` / `original_comment` / `reviewer_source`: `paper-review-panel` (first-round review)
- `commitment_extracted`: the revision coach (Step 3.5 Commitment Extraction Pass)
- `authors_claim` / `revision_location` / `fulfillment_status` / `unfulfilled_rationale` / `residual_action`: `paper` revision execution (authored), then independently confirmed by re-review
- `verified` / `status` / `quality_assessment`: `paper-review-panel` (re-review mode)

**Consumer**: `paper` (revision mode, if further revision needed), pipeline orchestrator. Schema 11 is carried forward via Material Passport (Schema 9) for cross-stage audit.

**Purpose**: Maps every reviewer concern through the full revision cycle: what was raised, what the author claims to have done, where the change is, and whether it was independently verified.

**Required fields**:
- `concern_id`: Unique ID (R1, R2, S1, S2, N1...)
- `priority`: `MUST_FIX` / `SHOULD_FIX` / `CONSIDER`
- `original_comment`: The reviewer's original concern text
- `authors_claim`: What the author states they did (from Response to Reviewers)
- `revision_location`: Section/page/paragraph reference in revised manuscript
- `verified`: `YES` / `PARTIAL` / `NO` / `CANNOT_VERIFY`
- `status`: `FULLY_ADDRESSED` / `PARTIALLY_ADDRESSED` / `NOT_ADDRESSED` / `MADE_WORSE`
- `quality_assessment`: Free-text evaluation

**Optional fields**:
- `reviewer_source`: Which reviewer originally raised the concern (EIC, R1, R2, R3, DA)
- `residual_action`: What remains to be done if not fully addressed. This is a single concern-level string (one per Schema 11 row), distinct from the per-commitment `unfulfilled_rationale` field nested inside each `commitment_extracted` object below. Two coherence conventions govern how the two interact:
  - **(a) Semantic relationship on a partial / multi-commitment row.** A commitment's `unfulfilled_rationale` is diagnostic and per-commitment: it explains *why that commitment fell short* (backward-looking, carried on the commitment object itself). `residual_action` is forward-looking and concern-level: it states *what still remains to be done for the whole concern*. They are different granularity and different tense, so a row may legitimately carry both at once; this is neither redundancy nor contradiction. Example: a commitment object with `unfulfilled_rationale: "3-seed std error only; 5-seed deferred per section 6"` (why) alongside the row-level `residual_action: "Run 5-seed replication in camera-ready"` (what remains).
  - **(b) Multi-commitment shape convention.** When one concern decomposes into N commitments, `residual_action` stays a single concern-level string (an aggregate of what remains across the concern); it is **not** expanded into a list or split per commitment. The per-commitment "why" lives on each commitment object's `unfulfilled_rationale`; the concern-level "what remains" stays on the row's `residual_action`.
- `commitment_extracted`: List of objects extracted from `original_comment` by the revision coach's Step 3.5. Each object carries three **extraction** fields plus two optional **lifecycle** fields. The extraction fields are written at Step 3.5: `commitment_text` (string, verbatim or minimally normalized promise), `commitment_type` one of `{add_experiment, add_analysis, add_clarification, add_citation, restructure, other}`, and `required_evidence_type` one of `{new_section, new_figure, new_table, new_citation, methods_paragraph, discussion_paragraph, prose_edit, acknowledgment_only, other}`. Of these nine, seven are **manuscript-evidence** types verified at `revision_location` in the revised manuscript (`new_section`, `new_figure`, `new_table`, `new_citation`, `methods_paragraph`, `discussion_paragraph`, `prose_edit`); `acknowledgment_only` is the one **response-letter-evidence** type verified in the Response to Reviewers (Schema 8); `other` is an underspecified escape hatch that triggers a soft advisory at re-review (see the `paper-review-panel` skill's `references/re_review_mode_protocol.md`, Commitment Ledger Verification). `prose_edit` covers sentence- or paragraph-level prose changes too granular to bucket into the section/figure/table/etc. categories (typo fixes, terminology clarifications, equation formatting, citation-style corrections). The lifecycle fields (`fulfillment_status`, `unfulfilled_rationale`, defined next) are **absent at extraction time** and appended per-object during revision execution. Empty list `[]` is valid (comment carried no extractable commitment, e.g., positive feedback).
  - `commitment_extracted[].fulfillment_status`: Optional lifecycle field nested **inside each `commitment_extracted` object** (not a top-level Schema 11 field), one of `{fulfilled, partial, not-fulfilled, explicitly-rejected-with-rationale}`. Absent on a commitment object until revision execution fills it. Nesting it inside the object (rather than carrying a separate parallel list) makes index desynchronization between commitment and status structurally impossible.
  - `commitment_extracted[].unfulfilled_rationale`: Optional lifecycle field nested **inside each `commitment_extracted` object** (not a top-level Schema 11 field): a free-text rationale required iff that object's `fulfillment_status` is one of `{partial, not-fulfilled, explicitly-rejected-with-rationale}`. **Omitted** (not the empty string) when `fulfillment_status == fulfilled` or absent. Three valid rationale forms: (a) "done elsewhere, see section X" pointer, (b) "rejected, reasons: ..." rationale, (c) "deferred to future work" acknowledgment.

**Validation**:
- Every item from the original Revision Roadmap (Schema 7) must appear in the matrix
- `authors_claim` cannot be empty for Priority 1 items (flag as `CANNOT_VERIFY` if missing)
- Matrix is carried forward in Material Passport (Schema 9) for audit trail
- Each object in `commitment_extracted` MUST carry the three extraction fields (`commitment_text`, `commitment_type`, `required_evidence_type`). The two lifecycle fields are nested per-object: `fulfillment_status` is optional (absent before revision execution); `unfulfilled_rationale` MUST be present and non-empty iff that object's `fulfillment_status` is one of `{partial, not-fulfilled, explicitly-rejected-with-rationale}`, and MUST be absent when `fulfillment_status == fulfilled` or absent. There is no separate top-level `fulfillment_status` / `unfulfilled_rationale` list. Empty list `commitment_extracted: []` stays valid (comment carried no extractable commitment). Violations (a non-`fulfilled` commitment object missing its `unfulfilled_rationale`) surface as `COMMITMENT_GAP` advisory at re-review (advisory only; author retains final responsibility).

---

## Schema 12: Compliance Report

Mode-aware output of the compliance agent (`agents/compliance_agent.md`). Three top-level subtrees: `prisma_trAIce` (null for primary research), `raise` (always present), and decision aggregation fields.

- **Emitted by:** the compliance agent at Stage 2.5 / 4.5
- **Consumed by:** the orchestrator (for checkpoint dashboard)
- **Appended to:** `material_passport.compliance_history[]` (append-only)

### Key fields

- `mode`: dispatches payload (see `agents/compliance_agent.md`, Dispatch logic)
- `stage`: `"2.5"` or `"4.5"`
- `prisma_trAIce`: `null` when `mode != "systematic_review"`; otherwise tier-bucketed item results
- `prisma_trAIce.protocol_maturity` *(optional)*: snapshot of the upstream protocol's self-described maturity status (`foundational_proposal` / `delphi_consensus` / `empirically_validated`) plus citation, snapshot date, and a one-paragraph caveat summary. Populated by the compliance agent from `references/prisma_trAIce_protocol.md`: its frontmatter (`citation`, `snapshot_date`) is the deterministic source for `upstream_citation` and `snapshot_date`; `status` is derived from the protocol authors' self-description (currently `foundational_proposal` per Holst et al. 2025, until upstream graduates the checklist via formal consensus); `caveat_summary` is composed from the protocol's Status disclaimer section.
- `raise.mode`: `"full"` (SR + other_evidence_synthesis) or `"principles_only"` (primary_research)
- `raise.principles`: 4 keys, each with `pass` / `warn` / `fail`
- `raise.roles`: 8 keys, populated only when `raise.mode == "full"`
- `overall_decision`: aggregate across compliance + legacy integrity + failure mode checklist
- `user_override`: only present after a user overrides a block; rationale required
- `upstream_sync_status`: `"current"` or `"stale"` (from freshness check)

### Material Passport extension

Schema 9 Material Passport gains one optional field, `compliance_history`:

```yaml
compliance_history:
  - <compliance_report entry>
  - <compliance_report entry>
  # append-only; never overwrite, never reorder
```

Ordering: chronological by `generated_at`. A Stage 2.5 FAIL followed by backfill + retry-pass produces two adjacent entries for Stage 2.5; both preserved.

---

## Validation Rules

1. **Required field check**: All schema fields marked without "(optional)" or "No" in the Required column are REQUIRED. Consumer agents MUST verify all required fields are present before proceeding
2. **Type check**: Fields must match declared types (e.g., `enum` values must be from the allowed set)
3. **Cross-reference check**: Source IDs referenced in Synthesis must exist in Bibliography; RevisionItem IDs in Response to Reviewers must match the Revision Roadmap
4. **Version tracking**: Each handoff artifact MUST carry a Material Passport (Schema 9) with a version label. Version labels must be monotonically increasing within a pipeline run
5. **Failure on missing**: If a required field is missing, return `HANDOFF_INCOMPLETE` with a list of missing fields; do NOT proceed with partial data
6. **Producer validation**: Producing agent must validate output against its schema BEFORE handoff
7. **Consumer validation**: Consuming agent should validate input on receipt and request re-generation if schema violations are found
8. **Integrity gating**: Artifacts that have passed through integrity verification (Schema 5) must have their Material Passport updated with `verification_status: "VERIFIED"` and `integrity_pass_date`
9. **Staleness detection**: If an upstream artifact is modified after a downstream artifact was produced, the downstream artifact's Material Passport should be updated to `verification_status: "STALE"`
10. **Passport freshness**: A Material Passport's integrity results are considered STALE if `integrity_pass_date` is more than 24 hours old relative to the current timestamp. Stale passports require re-verification before proceeding
11. **Passport does not grant Stage 2.5 skip**: The pre-review integrity check (Stage 2.5) can NEVER be skipped via Material Passport, regardless of passport status; a draft that enters the pipeline midway always runs Stage 2.5. A prior report can inform the rerun
12. **Passport does not grant Stage 4.5 skip**: The final integrity check (Stage 4.5) can NEVER be skipped via Material Passport, regardless of passport status. Stage 4.5 always requires full Mode 2 verification

## `data_access_level`

The skill's `SKILL.md` declares `metadata.data_access_level` with one of three values:

- `raw`: consumes unverified sources; must assume adversarial/hallucinated input
- `redacted`: operates on sanitized material; no new raw ingestion
- `verified_only`: runs only after upstream integrity gates

This is a declarative signal (not a runtime permission system). When adding a new skill, pick the value matching the *dirtiest* input the skill may legitimately consume.

## `task_type`

The skill's `SKILL.md` declares `metadata.task_type` with one of two values:

- `outcome-gradable`: the task has an objective scalar metric the skill optimizes against; a third party can score the output without deep context
- `open-ended`: the task's quality depends on domain judgment, interpretive work, or context no metric captures

This is a declarative truth-in-advertising signal. When adding a new skill, do not invent a third value; if the skill genuinely spans both, split it into two skills.
