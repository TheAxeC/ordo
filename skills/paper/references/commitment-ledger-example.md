# Commitment Ledger Worked Example

This example traces three reviewer comments through the commitment ledger of `references/revision-tracking-template.md`, from the revision coach Step 3.5 extraction through revision execution.

> Companion to `references/revision-recovery-example.md`. Where that example focuses on RESOLVED/UNRESOLVABLE *outcomes*, this one focuses on per-promise *lifecycle*.

## Setup

Reviewer R1 raises three comments on a manuscript about CNN ablations on small image datasets:

- **R1-1:** "Please add an ablation on CIFAR-100 and clarify why ResNet-50 was preferred over Vision Transformer."
- **R1-2:** "Discussion should acknowledge the recent Patel 2025 baseline."
- **R1-3:** "It would strengthen the paper to include error bars across 5 seeds."

## Step 3.5 output: commitment_extracted (per the revision coach)

```yaml
- concern_id: R1-1
  original_comment: "Please add an ablation on CIFAR-100 and clarify why ResNet-50 was preferred over Vision Transformer."
  commitment_extracted:
    - commitment_text: "add ablation on CIFAR-100"
      commitment_type: add_experiment
      required_evidence_type: new_table
    - commitment_text: "clarify why ResNet-50 was preferred over Vision Transformer"
      commitment_type: add_clarification
      required_evidence_type: discussion_paragraph

- concern_id: R1-2
  original_comment: "Discussion should acknowledge the recent Patel 2025 baseline."
  commitment_extracted:
    - commitment_text: "acknowledge Patel 2025 baseline in Discussion"
      commitment_type: add_citation
      required_evidence_type: new_citation

- concern_id: R1-3
  original_comment: "It would strengthen the paper to include error bars across 5 seeds."
  commitment_extracted:
    - commitment_text: "add error bars from 5-seed runs"
      commitment_type: add_experiment
      required_evidence_type: new_figure
```

Note R1-1 split into two commitments: compound comments decompose per Step 3.5 procedure.

## After revision: author fills fulfillment_status + rationale (nested per commitment)

The lifecycle fields are appended **inside each commitment object** (not as separate parallel lists). A `fulfilled` commitment carries `fulfillment_status` only, no `unfulfilled_rationale` placeholder.

```yaml
- concern_id: R1-1
  revision_location: "section 4.3 Table 4; section 5.2 paragraph 3"
  commitment_extracted:
    - commitment_text: "add ablation on CIFAR-100"
      commitment_type: add_experiment
      required_evidence_type: new_table
      fulfillment_status: fulfilled
    - commitment_text: "clarify why ResNet-50 was preferred over Vision Transformer"
      commitment_type: add_clarification
      required_evidence_type: discussion_paragraph
      fulfillment_status: fulfilled

- concern_id: R1-2
  revision_location: "section 5.4 paragraph 1"
  commitment_extracted:
    - commitment_text: "acknowledge Patel 2025 baseline in Discussion"
      commitment_type: add_citation
      required_evidence_type: new_citation
      fulfillment_status: fulfilled

- concern_id: R1-3
  revision_location: "section 4.3 Table 4 footnote"
  commitment_extracted:
    - commitment_text: "add error bars from 5-seed runs"
      commitment_type: add_experiment
      required_evidence_type: new_figure
      fulfillment_status: partial
      unfulfilled_rationale: "Computational budget allowed 3 seeds rather than 5; standard errors reported in Table 4 footnote. Five-seed replication acknowledged as future work in section 6 Limitations."
```

## Granular and uncategorizable evidence: `prose_edit` and `other`

The seven structural manuscript-evidence types cover the typical experiment / clarification / citation / restructure cases. Two further values handle the long tail of reviewer comments that would otherwise be misclassified or silently dropped:

Suppose R2 raises two more comments:

- **R2-1:** "Fix the typo in the definition of *consistency* on page 4 and correct the equation formatting in section 3.2."
- **R2-2:** "The submission feels incomplete somewhere in the framing, please tighten it."

```yaml
- concern_id: R2-1
  original_comment: "Fix the typo in the definition of consistency on page 4 and correct the equation formatting in section 3.2."
  commitment_extracted:
    - commitment_text: "fix typo in 'consistency' definition, p.4 (other: copy-edit, no structural change)"
      commitment_type: other
      required_evidence_type: prose_edit
    - commitment_text: "correct equation formatting in section 3.2 (other: formatting fix, no structural change)"
      commitment_type: other
      required_evidence_type: prose_edit

- concern_id: R2-2
  original_comment: "The submission feels incomplete somewhere in the framing, please tighten it."
  commitment_extracted:
    - commitment_text: "tighten framing (reviewer unspecified: clarify location)"
      commitment_type: other
      required_evidence_type: other
```

R2-1's two commitments use `prose_edit`: both are sentence-/equation-level changes too granular to bucket as `methods_paragraph` or `new_section`, yet they ARE manuscript changes (so `acknowledgment_only` would be the wrong semantics). They verify at `revision_location` in the revised manuscript like any other manuscript-evidence type.

R2-2 is genuinely uncategorizable: the reviewer did not name a location or a deliverable. It uses `required_evidence_type: other`.

Both values exist because `commitment_type` already carries an `other` escape hatch; without the matching `required_evidence_type` values, the agent's instruction to "extract commitments from every parsed comment" would force a typo fix into `methods_paragraph` (wrong) or omit it entirely (violates the every-comment rule).

## Why this matters

A commitment-fulfillment gap is measurable: persuasive rebuttal text + matrix saying "Verified: Y" can still hide that the actual experiment was not run. The commitment ledger forces per-promise lifecycle traceability (extracted promises, classified outcomes, mandated rationale), closing the gap at the artifact level instead of relying on reviewer vigilance.

---
**See also:** `references/revision-recovery-example.md`, `references/revision-coach.md` Step 3.5, `references/revision-tracking-template.md` Commitment Ledger.
