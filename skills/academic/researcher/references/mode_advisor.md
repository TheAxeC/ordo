# Mode Advisor: Unified Cross-Skill Decision Tree

## Purpose

Helps users (and the pipeline orchestrator) select the right skill and mode for their current situation. Eliminates the most common routing mistakes by mapping user intent to the optimal entry point.

---

## Quick Decision Matrix

| What do you want? | How far along? | Time? | Skill + Mode |
|-------------------|---------------|-------|--------------|
| Write a paper | Have research done | 2+ hr | `/paper full` |
| Plan a paper step by step | Have RQ, need structure | 1+ hr | `/paper plan` |
| Fix citations | Have draft | 30 min | `/paper citation-check` |
| Convert format | Have final draft | 15 min | `/paper format-convert` |
| Review a paper | Have paper to evaluate | 1 hr | `/paper-review-panel full` |
| Check revision quality | Have revised draft | 30 min | `/paper-review-panel re-review` |
| Full pipeline (writing to final manuscript) | Have research done | 5+ hr | `/researcher manuscript` |
| Handle real reviewer feedback | Have review comments | 1+ hr | `/researcher manuscript` (Stage 4 entry) |

---

## Common Misconceptions

| User Says | They Probably Need | Why |
|-----------|-------------------|-----|
| "Review my paper" (but no draft exists) | `/paper plan` mode | They need to write first, not review |
| "Check my citations" (but paper isn't done) | `/paper full` mode | Finish writing first, then check citations as a separate pass |
| "Just give me a quick paper" | `/paper full` | Paper writing still needs the full mode for quality |
| "Format my paper as APA" | `/paper format-convert` mode | Not a rewrite; purely formatting transformation |
| "I got reviewer comments" | `/researcher manuscript` Stage 4 entry (External Review) | Needs structured intake + strategic coaching, not just "fix what they said" |

---

## User Archetype Recommendations

| Archetype | Recommended Workflow | Rationale |
|-----------|---------------------|-----------|
| Graduate student (first paper) | `/paper plan`, then `/researcher manuscript` | Plan mode structures the paper incrementally; pipeline ensures quality gates |
| Experienced researcher (submission prep) | `/researcher manuscript` (from Stage 2 or mid-entry) | Knows what they want; benefits from the automated quality assurance and integrity checks |
| Advisor reviewing student work | `/paper-review-panel full` | Provides structured multi-perspective feedback the advisor can use in mentoring |
| Quick literature scan | `/paper lit-review` | Fast turnaround; no need for full pipeline overhead |
| Journal revision response | `/researcher manuscript` (Stage 4 entry with review comments) | External Review Protocol handles real reviewer feedback with strategic coaching |
| Conference paper (short deadline) | `/paper full` (conference type) | Compressed timeline; full writing with conference structure |
| Thesis chapter | `/paper full` | Each chapter treated as a standalone paper; full depth needed |
| Policy brief | `/paper full` (policy_brief type) | Evidence-based but concise |

---

## Skill Capability Boundaries

Understanding what each skill can and cannot do prevents misrouting:

| Skill | Can Do | Cannot Do |
|-------|--------|-----------|
| `paper` | Write papers, revise papers, format documents, check citations | Conduct original research, review papers (as reviewer), verify integrity |
| `paper-review-panel` | Review papers (5-person panel), re-review revisions | Write papers, conduct research, fix issues (only identifies them) |
| `researcher`, `manuscript` mode | Orchestrate all stages, manage transitions, track state | Perform any substantive work (purely dispatching and coordinating) |
| the integrity agent | Verify references, citations, data, originality | Fix issues (only identifies them), review paper quality |

---

## Decision Flowchart

```
START: What does the user want?
  |
  +--> "I want to write a paper"
  |      |
  |      +--> Have research/literature ready? --> /paper (plan or full)
  |      +--> Want full quality assurance? --> /researcher manuscript (from Stage 2)
  |
  +--> "I want someone to review my paper"
  |      |
  |      +--> Have a complete draft? --> /paper-review-panel full
  |      +--> Want integrity check + review? --> /researcher manuscript (Stage 2.5 entry)
  |      +--> No draft yet? --> /paper first
  |
  +--> "I need to revise based on feedback"
         |
         +--> From AI reviewers (pipeline)? --> Continue pipeline (Stage 4)
         +--> From real journal reviewers? --> /researcher manuscript Stage 4 entry (External Review)
```

---

## Pipeline Stage Entry Points

For users entering the pipeline mid-stream, this table clarifies what materials are needed:

| Entry Point | Required Materials | What Gets Skipped | Integrity Implications |
|------------|-------------------|-------------------|----------------------|
| Stage 2 (WRITE) | RQ Brief + Bibliography | Nothing | Full pipeline from Stage 2 |
| Stage 2.5 (INTEGRITY) | Paper draft | Stage 2 | Integrity check runs on provided draft |
| Stage 3 (REVIEW) | Verified paper + integrity report | Stage 2 | Stage 2.5 still runs on the paper; a midway entry never skips it |
| Stage 4 (REVISE) | Paper + review comments | Stages 2-3 | Pipeline runs Stage 2.5, then Stage 4, 3', 4' and 4.5 |

---

## Anti-Patterns

These are common workflow mistakes to avoid:

| Anti-Pattern | Problem | Correct Approach |
|-------------|---------|-----------------|
| Writing then researching | Confirmation bias in source selection | Research first, write second |
| Reviewing before integrity check | Wasted review effort on fabricated citations | Always Stage 2.5 before Stage 3 |
| Accepting all reviewer comments blindly | May introduce inconsistencies or weaken valid arguments | Use External Review Protocol's strategic coaching |
| Running pipeline for a 1-page abstract | Overhead far exceeds benefit | Use `/paper full` directly |
