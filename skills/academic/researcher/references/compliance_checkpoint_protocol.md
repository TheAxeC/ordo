---
title: Compliance Checkpoint Protocol (Stage 2.5 / 4.5 dual gate)
applies_to: "agents/compliance_agent.md"
---

# Compliance Checkpoint Protocol

Defines how the compliance agent participates in Stage 2.5 and Stage 4.5 Integrity Gates, how its decision interacts with the existing FAIL loop, and how user overrides are processed.

**Used by**: the compliance agent, `SKILL.md` Stage 2.5 / 4.5.

## Dual-gate summary

| Aspect | Stage 2.5 | Stage 4.5 |
|---|---|---|
| PRISMA-trAIce scope (SR mode only) | M1, M2, M3, M4, M5, M6, M7, M8, M9, M10 | T1, A1, I1, R1, R2, D1, D2 |
| RAISE principles focus | human_oversight, fit_for_purpose | transparency, reproducibility |
| RAISE 8-role matrix | not populated | populated (SR mode only) |
| Block condition | SR mode AND any Mandatory item = FAIL, OR SR mode AND any RAISE principle = fail | Same |
| Warn condition | Highly Recommended FAIL, OR RAISE principle = warn | Same |
| Info condition | Recommended / Optional FAIL | Same |
| Non-SR mode | RAISE principles_only, warn-only (never block) | Same |
| Checkpoint output | FULL checkpoint + `compliance` section in dashboard | Same |

## Decision precedence

Inside a single checkpoint, decisions aggregate as:

```
overall_decision = max_severity(
  prisma_trAIce.block_decision,
  raise.block_decision,
  legacy_integrity_verification_decision,  # existing Stage 2.5/4.5 check
  legacy_failure_mode_checklist_decision   # Failure Mode Checklist
)

severity order: pass < warn < block
```

Non-SR mode caps the compliance contribution at `warn`.

## User action UX

### On block

Orchestrator presents:

```
[COMPLIANCE BLOCK] Stage <N>

PRISMA-trAIce Mandatory fails: M4 (Input Data)
RAISE principles fail: reproducibility

Choose:
  (a) backfill: return to Stage 2 and add missing material
  (b) manual handling: edit manuscript directly, rerun compliance
  (c) acknowledge limitation: invoke user override (see Override Ladder)
```

### On warn

Dashboard bullets, FULL checkpoint. User confirms with free text or `continue`.

### On info (Recommended / Optional fail)

Bullet in dashboard, no flow interruption.

## Canonical gap-tag vocabulary

Compliance reports and fixture templates use these canonical tags in `gaps[].reason`, `principle_evidence[]`, and narrative fields. They are lexical signals: the compliance agent and downstream readers pattern-match on them.

| Tag | Where it appears | Meaning |
|---|---|---|
| `[MATERIAL GAP]` | `gaps[].reason`, `principle_evidence[]`, `evidence[]` | The item cannot be verified because the underlying material (passport field, manuscript section, supplementary file) is missing. Apply the Anti-Leakage Protocol of the `paper` skill's `references/anti_leakage_protocol.md`; do not hallucinate. |
| `[WEAK EVIDENCE]` | `principle_evidence[]` | The item is nominally reported but the description is too vague for auditor use. Triggers CA-4 downgrade: a RAISE principle marked `pass` with `[WEAK EVIDENCE]` in its evidence should be downgraded to `warn`. |
| `[GAP]` | `roles[].evidence_synthesists` narrative and similar role-level fields | Short form for a role-level gap carried forward from item-level fails. Permitted only in the 8-role matrix narrative; item-level reasons MUST use the long `[MATERIAL GAP]` form. |

Casing is significant: uppercase square-bracketed. Lowercase or missing brackets are treated as plain prose and will not be recognised as gap signals.

## Override Ladder (3-round friction)

Triggered when user picks "acknowledge limitation" on a block.

| Round | Behaviour |
|---|---|
| 1st block override | Warn user. Rationale optional. Allowed. |
| 2nd (if user re-enters block state) | Require rationale string (any length). |
| 3rd | Require rationale >= 100 chars. Only released on rationale confirmation. |

Round count is per-stage-per-pipeline-run, stored in `compliance_history[].user_override` entries.

> **Enforcement boundary.** This ladder is enforced at **runtime by the compliance agent** using the `compliance_history[]` round counter, NOT by Schema 12, which accepts a `user_override.rationale` of any length of 1 or more. The round-counter increment and >=100-char rationale check live in the agent's write-path. If you bypass the agent and hand-write a `user_override` entry into the passport, Schema 12 will accept any rationale length, but that entry will not have gone through the friction ladder and must be treated as unaudited.

On any successful override, the agent generates `disclosure_addendum` text and the orchestrator **auto-injects** it into the manuscript's AI disclosure section. The addendum is non-removable: this is the concrete form of the `no detection evasion` iron rule.

### `disclosure_addendum` template

```
The authors acknowledge the following compliance limitations for this <evidence synthesis|manuscript>:
- PRISMA-trAIce <item_id> (<item_title>) not fully reported. Rationale: <user text>.
- RAISE principle <principle_name>: <partial|not met>. Rationale: <user text>.
```

**Template fill rules** (the compliance agent uses these deterministically):

- `<evidence synthesis|manuscript>`: pick `evidence synthesis` when `mode in {systematic_review, other_evidence_synthesis}`; pick `manuscript` when `mode == primary_research`.
- `<partial|not met>`: pick `partial` when the principle's original status was `warn`; pick `not met` when it was `fail`.
- `<item_id>`: the PRISMA-trAIce item ID as listed in `user_override.scope[]`.
- `<item_title>`: look up the short title from `references/prisma_trAIce_protocol.md` (e.g. `M4` gives "Input data").
- `<principle_name>`: one of `human_oversight`, `transparency`, `reproducibility`, `fit_for_purpose`.
- `<user text>`: verbatim copy of `user_override.rationale`, truncated to first 500 chars if longer (the addendum keeps prose; the full rationale lives in the compliance_history).

## Fail loop integration

After 3 unresolved rounds of retry at the same stage, orchestrator invokes the existing Integrity Check FAIL Loop procedure of `references/pipeline_state_machine.md`:

1. List all unresolvable items.
2. User picks [manual handling / remove AI usage from this stage / continue with "partially non-compliant" warning].
3. Chosen path is recorded as `compliance_history[].resolution_path`.

## Append-only history

`material_passport.compliance_history[]` never overwrites. On retry-pass, the previous fail entry is preserved with its own timestamp.
