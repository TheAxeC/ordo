# Policy-Anchor Disclosure Protocol

**Parent skill**: `paper`
**Mode name**: `disclosure` with `--policy-anchor=<a>` selector (parallel track to `--venue=<v>` venue path; see `references/disclosure_mode_protocol.md` for the dispatch).
**Anchor inventory**: `prisma-trAIce, icmje, nature, ieee` (closed enum).
**Data source**: `references/policy_anchor_table.md` (read at runtime; LLM looks up the row for `--policy-anchor=<a>` x field-N).

This protocol document is the runtime instruction set the LLM follows when the user invokes `disclosure` mode with a policy-anchor selector. It encodes the 8 frozen invariants, the G10 7-row precedence table for whole-disclosure output decision, the auto-promotion forbiddance, and the per-anchor render flows (PRISMA-trAIce / ICMJE / Nature / IEEE).

---

## 0. Why this protocol exists

`paper`'s `disclosure` mode renders venue-targeted AI disclosure text (ICLR, NeurIPS, Nature, Science, ACL, EMNLP). The 4-anchor `--policy-anchor=<a>` track parallels the venue track when the author targets a **policy anchor** (PRISMA-trAIce, ICMJE, Nature Portfolio, IEEE) rather than a specific journal venue. The two tracks coexist; the venue path remains the default for journal submissions.

---

## 1. Inputs

1. **Paper draft**: manuscript text.
2. **Selector**: `--policy-anchor=<a>` where `a in {prisma-trAIce, icmje, nature, ieee}`. **Selector-mutually-exclusive by default**: supplying both `--policy-anchor` and `--venue` triggers the section 5 conflict-resolution flow, which permits exactly one consistent pair (any Nature Portfolio venue + `--policy-anchor=nature`) and rejects every other combination with explicit error. See section 5 for the full enumeration.
3. **Cold-start fallback**: the author supplies `mode=<value>` explicitly. Silent fallback to general track on missing input is **forbidden** by the G2 invariant.
4. **Phase 2 AI usage categorization**: the same input shape as the venue path. Each AI usage category carries state in `{USED, NOT USED, UNCERTAIN}`.
5. **Optional `ai_used: true | false`**: explicit author-supplied flag layered on top of category state. Composes with category state per section 2 G10 7-row precedence table below.
6. **Tool identity per AI tool**: auto-detected from session metadata (mirror `references/disclosure_mode_protocol.md` Phase 4 detection); explicit fallback per tool when session metadata absent or non-Claude tools are involved.

---

## 2. Whole-disclosure decision: G10 7-row precedence table

Rows are evaluated in priority order from top to bottom; the renderer emits the output of the **first** row whose precondition matches. Subsequent rows do not fire. This table is the **G3 / G10 invariant** in load-bearing form.

| # | Precondition (first match wins) | Whole-disclosure output |
|---|---|---|
| 1 | `ai_used: false` supplied AND >=1 category is USED (contradiction) | Honest "AI-disclosure conflict: explicit no-AI input contradicts USED category" annotation; renderer prompts the user to reconcile before any anchor render emits. |
| 2 | `ai_used: false` supplied AND no category is USED AND no category is UNCERTAIN | "No AI was used in preparing this paper" statement (G10 opt-in path). |
| 3 | `ai_used: false` supplied AND >=1 category is UNCERTAIN AND no category is USED | Honest "AI-disclosure tension: explicit no-AI input but categories still UNCERTAIN" annotation; renderer prompts the user to resolve UNCERTAIN before emitting the no-AI statement. |
| 4 | `ai_used: true` supplied OR >=1 category is USED, AND row 1 did not match | Full anchor-specific disclosure render per section 3 below, applying the **per-facet rule** (USED facets at full strength; per-facet "AI disclosure pending: category {X} not confirmed; resolve via Phase 2" annotation immediately after each still-UNCERTAIN facet's render slot). |
| 5 | >=1 category is UNCERTAIN AND no category is USED AND no `ai_used` input | Honest "AI-disclosure status not supplied: categories pending confirmation" annotation; renderer prompts the user to run the UNCERTAIN-confirmation flow before re-invoking. |
| 6 | >=1 category supplied AND every supplied category is NOT USED AND no UNCERTAIN AND no `ai_used` input | Silence: emit no AI-disclosure statement at all (G10 "silence is default-OK"). |
| 7 | None of rows 1-6 match (empty input across every dimension) | Honest "AI-disclosure status not supplied for this run" annotation (G3 D3 pure cold-start). |

**Substantive-content gate (`ai_used: true`):** when `ai_used: true` is supplied **and no category is marked USED** (regardless of whether Phase 2 has been performed, i.e., this gate fires for both "bare-flag input only, no categorization" **and** "Phase 2 done but every category came back NOT USED while `ai_used:true` is still set"), row 4 does not emit a complete render. Instead, the input is treated as a **prompt-trigger** that halts the current run and asks the user to reconcile: either supply a USED category, change `ai_used` to false, or run / re-run Phase 2 categorization. Once a USED category is supplied (or `ai_used` flipped), re-evaluate against the section 2 table from the top. The forbiddance: emitting a full anchor disclosure with `ai_used:true` and zero USED facets.

---

## 3. Per-anchor render flows

For each anchor, the renderer reads `references/policy_anchor_table.md` rows 1..16 and applies the field-level rules below. The 4 anchors share the row-4 dispatcher above; the per-anchor sections only describe **what to emit** after row 4 fires.

### 3.1 `--policy-anchor=prisma-trAIce`

**Track gate (G2 invariant):** this anchor is only valid when `mode=systematic-review` (cold-start input). Selecting `--policy-anchor=prisma-trAIce` without it is non-conformant; the renderer refuses with an explicit error citing the G2 invariant.

**G5 invariant: three gates for M6 prompt disclosure:** PRISMA-trAIce M6 prompt disclosure fires only when **all three** hold:
1. PRISMA-trAIce track selected (the gate above).
2. `tool_type in {LLM, GenAI}` (per PRISMA M6 "if any" predicate).
3. AI use is methodological-in-SLR (search / screening / data extraction / Risk of Bias / synthesis / drafting per PRISMA M3.a), **not pure copyediting**.

When gate 3 fails (SLR manuscript whose only LLM use is editorial), the renderer routes to the section 3.5 copyediting-carve-out path instead. PRISMA-trAIce track does not own the copyediting case.

**Render fields:**
- Per `references/policy_anchor_table.md` row 1-3: emit one **tool identity tuple** per AI tool (auto-detect from session, fallback explicit). Identity tuple = (tool name, version if applicable, developer/provider).
- Row 4-5: emit one **(tool x task) record** per (tool, task) tuple across the M3.a 6-stage enum. Missing tuples produce "not supplied" annotation per tuple. Per-task prompt disclosure follows M6.a granularity.
- Row 8: emit prompt records per (tool x task) tuple per gate G5.
- Row 9: emit human oversight description per M8 sub-items.
- Rows 11-12: emit performance evaluation method + results per M9 + R2 when applicable.
- Row 13: emit limitations narrative per D1.
- Row 14: distribute disclosure fragments per Table 1 row groupings (Title / Abstract / Introduction / Methods / Results / Discussion). The renderer emits per-section fragments, not a single paragraph.

### 3.2 `--policy-anchor=icmje`

**Track gate:** no SLR lineage requirement.

**Render fields:**
- Row 10 (explicit-mandate): emit ICMJE human-responsibility statement using the verbatim "humans are responsible for any submitted material that included the use of AI-assisted technologies" language. This sentence appears in **every** ICMJE render where row 4 fires.
- Row 14 (explicit-recommend): emit two channels: cover letter (verbatim ICMJE language) + manuscript "appropriate section" (per the venue's submission policy). The two channels carry different paragraphs, not a single duplicated paragraph.
- Row 16 (explicit-mandate): emit the text-attribution clause: appropriate attribution and full citations for AI-quoted material + the prohibition against citing AI-generated material as primary source. Surface this paragraph even when no images are involved (rule covers text-attribution).
- Rows with `not-addressed` strength (9/16 cells): the renderer skips these by default; if Phase 2 provides a category USED that would be served by such a field, surface a "ICMJE delegates this detail to journal-level policy; consider the venue track for journal-specific phrasing" annotation.

### 3.3 `--policy-anchor=nature`

**Track gate:** no SLR lineage requirement.

**Render fields:**
- Rows 9-10 (both explicit-mandate): emit the human-accountability statement using Nature's "In all cases, there must be human accountability for the final version of the text" verbatim language. Combine with the authorship-rejection clause from row 10's second quote when the manuscript proposes any AI co-authorship.
- Row 14 (explicit-recommend): emit Methods-section placement instruction citing the verbatim "Methods section (and if a Methods section is not available, in a suitable alternative part)" language.
- Row 15 (explicit-recommend) carve-out semantics: **eliminate** strength. Copyediting-only use produces **no disclosure paragraph**, only an internal renderer log entry. The G7 invariant forbids collapsing this into a boolean shared with IEEE's downgrade semantics.
- Row 16 (explicit-mandate) image-rights handling: **hybrid (annotation block + suggested inline patches)**. The renderer emits two outputs:
  1. A standalone `image_disclosure_instructions.md` block describing, per image, which Nature carve-out applies (or default-deny) and what Nature label text appears in the image field.
  2. A suggested patch diff against manuscript source figure metadata (caption, alt-text, image-field caption) for the author to optionally apply. **`paper` does not modify manuscript source autonomously**; the patch is suggested-only.

### 3.4 `--policy-anchor=ieee`

**Track gate:** no SLR lineage requirement.

**G8 invariant: paired mandate:** IEEE row 5 (`Specific task within stage`, explicit-mandate) and row 6 (`Affected manuscript sections / content locator`, explicit-mandate) are a paired mandate. The renderer emits **both** inputs together. Emitting `level_of_involvement` (row 5 narrative annotation) without an `affected_sections` locator (row 6), or vice versa, is **non-conformant**.

**IEEE section locator shape:** free-form list with recommended IMRaD exemplars. Accepted values: `"Introduction" | "Methods" | "Results" | "Discussion" | "Abstract" | "Title" | free-form-other`. Closed-enum would over-constrain IEEE's "brief explanation" language; free-form preserves the policy's narrative invitation.

**Render fields:**
- Row 1 (explicit-mandate): emit "The AI system used shall be identified" formulation: name + identifier per AI tool.
- Rows 5-6 (paired explicit-mandate per G8): emit `affected_sections` list + `level_of_involvement` narrative annotation **together**.
- Row 14 (explicit-mandate): emit placement instruction citing "acknowledgments section of any article submitted to an IEEE publication" verbatim. **No Methods placement, no cover-letter channel**, the tightest closed enum across all four anchors.
- Row 15 (explicit-recommend) carve-out semantics: **downgrade-not-eliminate** strength. Copyediting-only use still produces a disclosure paragraph at the same acknowledgments location, but with recommend-strength rather than mandate language. The G7 invariant forbids collapsing this into a boolean shared with Nature's eliminate semantics.
- Row 16 (implicit): images/figures/code fold into the same acknowledgments-disclosure mandate as text. **No separate image-rights regime, no default-prohibition** (contrasts with Nature). The renderer emits a single acknowledgments paragraph covering all content types per IEEE policy. The G9 invariant: each anchor's image-rights regime stays distinct; IEEE's fold-into-acknowledgments path does not merge with Nature's default-deny regime.

### 3.5 Copyediting carve-out cross-anchor handling

Per the G7 invariant, the copyediting carve-out semantics are anchor-specific:

- **Nature anchor**: eliminate strength: no disclosure paragraph for copyediting-only use.
- **IEEE anchor**: downgrade-not-eliminate: disclosure still emitted at acknowledgments, with recommend-strength language ("is recommended" rather than "shall be disclosed").
- **PRISMA-trAIce anchor**: not in scope (M6 G5 gate 3 routes copyediting cases away from PRISMA-trAIce track entirely; see section 3.1).
- **ICMJE anchor**: not-addressed in the policy text; the renderer treats copyediting cases per the same path as substantive AI use (no carve-out, full ICMJE render).

The renderer MUST NOT collapse these four behaviors into a single boolean `exempted_uses: [copyediting]` field; doing so would silently lose the eliminate-vs-downgrade-vs-not-in-scope distinctions.

---

## 4. Auto-promotion forbiddance (G3 / G10 invariant)

A still-UNCERTAIN category MUST NOT be rendered as though USED in any of the four anchor outputs. This is the load-bearing constraint behind the per-facet rule: USED facets render at full strength; UNCERTAIN facets surface the per-facet annotation, never the full-strength render. The renderer MUST surface UNCERTAIN as UNCERTAIN throughout the disclosure text; silent promotion of any UNCERTAIN category to USED is **forbidden**.

---

## 5. Venue + anchor conflict resolution

When the user passes both `--venue=<v>` and `--policy-anchor=<a>`, the renderer evaluates whether the two map to compatible policies. The consistent-pair recognition for the Nature track covers the full Nature Portfolio venue family:

- **Consistent: Nature Portfolio venue + `--policy-anchor=nature`**: includes canonical labels `{"Nature", "Nature Portfolio", "Nature (Nature Publishing Group)", "Nature Publishing Group"}` **and** any venue whose name starts with the prefix `"Nature "` (e.g., `Nature Medicine`, `Nature Communications`, `Nature Climate Change`, `Nature Energy`, `Nature Methods`, ...). All Nature Portfolio journals inherit the same parent AI policy, so each of these venue strings + `--policy-anchor=nature` proceeds.
- **Conflicting: any other (venue, anchor) pair**: e.g., `--venue=Nature` + `--policy-anchor=IEEE`, `--venue=ICLR` + `--policy-anchor=icmje`, or a Nature Portfolio venue with a non-nature anchor -> **reject with explicit error** listing the policy conflict and the canonical Nature consistent-pair definition above.

Silent precedence is **forbidden**. The renderer must surface the conflict to the user and require an explicit selector choice.

---

## 6. Three-state input completeness flag

The section 2 G10 7-row table evaluates first-match across (`ai_used` x per-category-state). Field-level computation:

- `ai_used` in `{true, false, unset}`.
- Each category in `{USED, NOT USED, UNCERTAIN, not-supplied}`.
- First-match-wins evaluation across section 2's 7 rows.
- Row-4 partial-state composition per the per-facet rule: USED at full strength; per-facet annotation for each still-UNCERTAIN; auto-promotion forbidden.

The invariants constrain the evaluation:
- **G1 invariant**: no `ai_disclosure` field is read from / written to the corpus entry schema; all input flows through the renderer's runtime input contract.
- **G2 invariant**: track selection reads the cold-start `mode=` input.
- **G3 / G10 invariant**: the 7-row table holds; auto-promotion forbidden.
- **G4 invariant**: 4 anchors.
- **G5 invariant**: three gates for M6 prompts.
- **G7 invariant**: anchor-specific carve-out semantics.
- **G8 invariant**: IEEE paired-mandate (row 5 + row 6).
- **G9 invariant**: anchor-specific image-rights regimes.

---

## 8. Related

- Anchor data table (consumer of this protocol): `references/policy_anchor_table.md`
- disclosure mode protocol (parallel track): `references/disclosure_mode_protocol.md`
- venue disclosure policies (Nature dedup peer): `references/venue_disclosure_policies.md`
