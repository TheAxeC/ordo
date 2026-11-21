# Mode Selection Guide

This guide helps users and the intake agent select the most appropriate operational mode.

---

## Mode Selection Flowchart

```
User Input ->
|
+-- Already have complete research?
|   +-- Yes -> Want a full paper?
|   |   +-- Yes --------------------------> full mode
|   |   +-- No -> Just need an outline?
|   |       +-- Yes ----------------------> outline-only mode
|   |       +-- No -> Just need an abstract?
|   |           +-- Yes -------------------> abstract-only mode
|   |           +-- No -> Just need a literature review?
|   |               +-- Yes --------------> lit-review mode
|   |               +-- No ---------------> full mode
|   |
|   +-- No -> Want guided thinking?
|       +-- Yes --------------------------> plan mode
|       +-- No ---------------------------> full mode (Phase 0 will conduct an interview)
|
+-- Have an existing paper to revise? -----------------------> revision mode
+-- Have reviewer comments to handle?
|   +-- Comments only, no response written yet -----------> revision-coach mode
|   +-- Comments + an existing rebuttal/response draft ---> rebuttal-audit mode
|   +-- Comments + a revision already made, letter not written --> response-letter mode (`paper`'s addition)
+-- Need an AI-usage disclosure statement? ------------------> disclosure mode
+-- Just need format conversion? -------------------------> format-convert mode
+-- Just need a citation check? -------------------------> citation-check mode
```

---

## Detailed Description of Each Mode

### full mode: Complete Paper Writing

**Applicable Scenarios**:
- User has a clear research question and (partial) materials
- Needs to produce a complete paper from start to finish
- Includes all phases: Interview -> Literature -> Structure -> Argumentation -> Writing -> Citation -> Review -> Formatting

**Not Applicable When**:
- Only need a specific section (-> use another specialized mode)

**Expected Output**: Complete paper draft + references + abstract + review report
**Expected Duration**: Long (all 8 Phases fully executed)
**Agents Used**: All 9 + the Socratic mentor (if needed)

---

### outline-only mode: Outline Generation

**Applicable Scenarios**:
- Only need the paper structure and outline
- A proposal to submit to an advisor for review
- Need to quickly plan the paper structure

**Not Applicable When**:
- Need complete paper content (-> full mode)
- Need guided thinking (-> plan mode)

**Expected Output**: Detailed outline + evidence allocation + word count distribution
**Expected Duration**: Short (Phase 0-2)
**Agents Used**: the intake agent -> the literature strategist -> the structure architect

---

### plan mode: Chapter-by-Chapter Guided Planning

**Applicable Scenarios**:
- User has ideas but they are not yet clear enough
- Wants guided thinking for each chapter's content
- First-time academic paper writer
- Wants to think through every section before writing

**Not Applicable When**:
- Already knows exactly what to write (-> full mode is faster)
- Only needs an outline without deep thinking (-> outline-only mode)
- Time-pressured and needs rapid output (-> full mode)

**Expected Output**: Chapter Plan + INSIGHT Collection
**Expected Duration**: Medium (Step 0-3, approximately 20-30 rounds of conversation)
**Agents Used**: the intake agent -> the Socratic mentor -> the structure architect -> the argument builder

**Subsequent Connections**:
- Chapter Plan -> full mode (produce complete paper)

---

### revision mode: Paper Revision

**Applicable Scenarios**:
- Already have a completed paper draft
- Received reviewer comments requiring revision
- Feel certain sections need improvement

**Not Applicable When**:
- No existing paper draft (-> full mode)
- Only need to check citation format (-> citation-check mode)

**Expected Output**: Revised paper + revision notes (tracked changes) + the response letter and its check, when the comments are referee comments (`paper`'s addition)
**Expected Duration**: Medium
**Agents Used**: the peer reviewer -> the draft writer -> the citation compliance agent

**Prerequisite**: User must provide existing paper content

---

### abstract-only mode: Abstract Writing

**Applicable Scenarios**:
- Paper is already complete, only need an abstract
- Need to submit a conference abstract

**Not Applicable When**:
- No paper content to summarize (-> full mode or plan mode)

**Expected Output**: Abstract (EN) + keywords
**Expected Duration**: Short
**Agents Used**: the intake agent -> the abstract agent

---

### lit-review mode: Literature Review

**Applicable Scenarios**:
- Need a literature review on a specific topic
- Preparing the Literature Review chapter of a paper
- Need a systematic search strategy and literature matrix

**Not Applicable When**:
- Need a complete paper (-> full mode)

**Expected Output**: Annotated bibliography + literature matrix + synthesis analysis
**Expected Duration**: Medium
**Agents Used**: the intake agent -> the literature strategist

---

### format-convert mode: Format Conversion

**Applicable Scenarios**:
- Already have paper content, need format conversion
- Markdown to LaTeX / DOCX / PDF
- Need to comply with a specific journal's formatting requirements

**Not Applicable When**:
- No existing content (-> full mode)
- Need content modifications (-> revision mode)

**Expected Output**: Document in target format
**Expected Duration**: Short
**Agents Used**: formatter used standalone

---

### citation-check mode: Citation Check

**Applicable Scenarios**:
- Already have a paper, only need to check citation format
- Final check before submission
- Switching citation format (e.g., APA to IEEE)

**Not Applicable When**:
- No existing citation list (-> full mode)
- Need to modify paper content (-> revision mode)

**Expected Output**: Citation error report + automatic correction suggestions
**Expected Duration**: Short
**Agents Used**: the citation compliance agent used standalone

---

### revision-coach mode: Reviewer-Comment Triage

**Applicable Scenarios**:
- Received reviewer comments / a decision letter and need them parsed into a structured plan
- Want a Revision Roadmap that classifies, maps, and prioritizes each comment
- Need a Response Letter Skeleton to start drafting replies
- Deciding whether to address or push back on a comment (disagreement posture)
- Non-journal scopes: conference rebuttal, grant-panel response, transfer-after-review

**Not Applicable When**:
- Already have a written rebuttal/response draft you want QA'd (-> rebuttal-audit mode)
- The paper itself needs rewriting based on the comments (-> revision mode)

**Expected Output**: Revision Roadmap + optional Tracking Template + Response Letter Skeleton
**Expected Duration**: Short-Medium
**Agents Used**: the revision coach used standalone (no earlier run required)

---

### disclosure mode: AI-Usage Disclosure Statement

**Applicable Scenarios**:
- Paper is drafted and you need a venue-specific AI-usage disclosure paragraph
- Submitting to a venue with a defined AI-disclosure policy (ICLR, NeurIPS, Nature, Science, ACL, EMNLP)
- Need placement guidance for where the statement goes in the manuscript

**Not Applicable When**:
- No paper drafted yet: disclosure is a finishing step (-> full mode first)
- The venue is not in the policy database (confirm the venue's current policy manually)

**Expected Output**: Venue-specific AI-usage disclosure paragraph(s) + placement instructions
**Expected Duration**: Short
**Agents Used**: disclosure protocol used standalone (venue policy database lookup)

---

### rebuttal-audit mode: Rebuttal-Draft QA

**Applicable Scenarios**:
- You already wrote a rebuttal/response-to-reviewers draft and want it checked before sending
- Need a per-comment coverage table (which reviewer concerns the draft addresses, partially addresses, or misses)
- Want risk flags for tone (too combative), unsupported claims, or a response that misreads the reviewer's point

**Not Applicable When**:
- You have reviewer comments but have **not** written a response yet (-> revision-coach mode, which *generates* a skeleton)
- The manuscript itself needs revising (-> revision mode)

**Input gate**: requires BOTH (a) the reviewer comments / decision letter AND (b) an existing rebuttal draft. Comments only -> route to revision-coach. If intent is ambiguous, clarify rather than guess.

**Expected Output**: Advisory QA report: per-comment coverage + gap list + risk flags. Generates no new response.
**Expected Duration**: Short
**Agents Used**: the revision coach's comment-parsing capability, run standalone (advisory)

**Integrity boundary**: rebuttal-audit does **not** mark anything `ready_to_submit` or verified. The output is advisory QA only.

---

### response-letter mode: Response Letter for a Revision Already Made (`paper`'s addition)

**Applicable Scenarios**:
- The manuscript is already revised, and the response letter to the referees is not written yet

**Not Applicable When**:
- The manuscript still needs revising (-> revision mode, which writes the letter at its end)
- You already wrote the letter and want it checked (-> rebuttal-audit mode)

**Expected Output**: `response-letter.md` beside the manuscript + `response-letter-check.md` in the run folder
**Expected Duration**: Short
**Agents Used**: the draft writer, then the peer reviewer for the check

---

## Common Misselection Scenarios

| User Says | Easily Misselected | Correct Choice | Reason |
|---------|---------|---------|------|
| "Help me write an outline" | outline-only | First confirm: Do they want a simple outline or deep planning? | May need plan mode |
| "I want to write a paper but don't know how to start" | full | plan mode | Needs guided thinking |
| "Help me revise my paper" | revision | First confirm: Are there reviewer comments? | May need full mode rewrite |
| "Help me with my revision" (`paper`'s addition) | revision | Ask which is meant: revision (the manuscript changed, the letter written when the comments are referee comments), response-letter (the letter for a revision already made), revision-coach (the comments parsed into a plan) or rebuttal-audit (a letter the user wrote, checked) | Four modes answer it |
| "Help me search for literature" | lit-review | First confirm: Is it a literature review for a paper or a research investigation? | None |
| "I want to plan my paper step by step" | outline-only | plan mode | Needs interactive guidance |
| "The paper format is wrong" | revision | citation-check or format-convert | May only need format correction |

---

## Quick Decision Table

| What Do You Have? | What Do You Want? | Choose This Mode |
|-----------|-----------|------------|
| Nothing | Complete paper | plan mode -> full mode |
| Research question + literature | Complete paper | full mode |
| Research question + literature | Outline | outline-only mode |
| Vague idea | Paper plan | plan mode |
| Completed paper | Revision | revision mode |
| Completed paper | Abstract | abstract-only mode |
| Completed paper | Format conversion | format-convert mode |
| Completed paper | Citation check | citation-check mode |
| Reviewer comments (no response yet) | Parse + roadmap + reply skeleton | revision-coach mode |
| Reviewer comments + a written rebuttal draft | QA the draft before sending | rebuttal-audit mode |
| Reviewer comments + a revision already made | The response letter | response-letter mode (`paper`'s addition) |
| Drafted paper + target venue | AI-usage disclosure statement | disclosure mode |

---

### Plan to Full Mode Conversion Protocol

When a user completes `plan` mode and wants to proceed to `full` mode for actual paper writing:

#### Conversion Checklist

| Plan Mode Output | Full Mode Input | Conversion Action |
|-----------------|-----------------|-------------------|
| Chapter Plan (structure outline) | the structure architect | Map chapters to formal sections with heading levels; validate against `references/paper-structure-patterns.md` |
| Socratic Responses (Q&A transcripts) | the argument builder | Extract claims + evidence + warrants from dialogue; discard conversational scaffolding |
| Literature Notes (if any) | the literature strategist | Independent execution: plan mode notes serve as seed keywords only; full systematic search required |
| Argument Sketches | the argument builder | Evaluate each sketch against 4-level scoring; only `adequate` or above proceed |

#### Quality Gate

Before conversion, ALL of the following must be true:
- [ ] Every chapter in the Chapter Plan has at least 1 argument sketch rated `adequate` or above
- [ ] The overall paper structure maps to a recognized pattern in `references/paper-structure-patterns.md`
- [ ] At least 5 potential references have been identified (seeds for the literature strategist)
- [ ] The research question is finalized (not still evolving from Socratic dialogue)

#### What Gets Discarded
- Conversational filler from Socratic dialogue (greetings, confirmations, repetitions)
- Tentative ideas explicitly marked as "maybe" or "not sure" by the user
- Plan mode's iterative drafts (only the final version of each chapter plan carries over)

---

## Trigger-to-Mode Mapping Examples

```
"Write a paper on SDGs in HEI"           -> full
"Give me a paper outline for..."         -> outline-only
"Revise this paper based on feedback"    -> revision
"Write an abstract for this paper"       -> abstract-only
"Do a literature review on..."           -> lit-review
"Convert this paper to LaTeX"            -> format-convert
"Convert citations to IEEE"              -> format-convert
"Check the citations in this paper"      -> citation-check
"guide my paper"                         -> plan
"help me plan my paper"                  -> plan
"I got reviewer comments"               -> revision-coach
"parse these reviews"                    -> revision-coach
"help me with my revision"              -> asked (Common Misselection Scenarios)
"should we push back on reviewer 2"     -> revision-coach
"conference rebuttal" / "grant response" -> revision-coach
"audit my rebuttal draft"               -> rebuttal-audit (needs comments + an existing draft)
"did I miss any reviewer comment"       -> rebuttal-audit
"AI disclosure for Nature"              -> disclosure
"generate an AI usage statement"        -> disclosure
```
