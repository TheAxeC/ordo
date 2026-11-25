# Pipeline State Machine: Complete Definition

This document defines all legal states, transition conditions, transition actions, and exception handling for researcher.

---

## State Definitions

### Stage States

| State | Description |
|-------|------------|
| `pending` | Not yet started, waiting for prerequisite stage to complete |
| `in_progress` | Currently executing |
| `completed` | Completed, deliverables recorded |
| `skipped` | User chose to skip (only for non-mandatory stages) |
| `blocked` | Preconditions not met (e.g., integrity check FAIL) |

### Pipeline Global States

| State | Description |
|-------|------------|
| `initializing` | Detecting entry point and materials |
| `running` | Pipeline executing (at least one stage is in_progress) |
| `awaiting_confirmation` | Stage complete, waiting for user to confirm checkpoint |
| `paused` | User paused, can resume at any time |
| `completed` | All required stages complete, final paper produced |
| `aborted` | User abandoned (e.g., chose to abandon after Reject) |

The session writes these states, and every transition below, to the run's state in `researcher-runs/<mode>-<date>/` beside the manuscript's folder, in the structure `agents/state_tracker_agent.md` gives.

---

## State Transition Diagram (ASCII)

```
                        +-------------+
                        | INITIALIZING|
                        +------+------+
                               |
                    [Detect entry point & materials]
                               |
              +----------+----------+----------+
              |          |          |          |
              v          v          v          v
         +--------+ +--------+ +--------+ +--------+
         |Stage 2 | |Stg 2.5 | |Stage 3 | |Stage 4 |
         | WRITE  | |INTEGRIT| | REVIEW | | REVISE |
         +---+----+ +---+----+ +---+----+ +---+----+
             |          |          |          |
        [checkpoint]    |     [checkpoint]    |
             |          |          |          |
             v          v          |          |
        +--------+ +---+----+      |          |
        |Stg 2.5 | |PASS?   |      |          |
        |INTEGRIT| +---+----+      |          |
        +---+----+     |           |          |
                  +----+----+      |          |
                  |         |      |          |
                 Yes       No      |          |
                  |     [Fix]      |          |
                  |   [Re-verify]  |          |
             [checkpoint]   |      |          |
                  |         |      |          |
                  v         |      |          |
             +--------+     |      |          |
             |Stage 3 | <---+      |          |
             | REVIEW |            |          |
             +---+----+            |          |
                 |                 |          |
            [DECISION]             |          |
                 |                 |          |
       +---------+---------+       |          |
       |         |         |       |          |
     Accept    Minor     Major     |          |
       |       Revision  Revision  |          |
       |         |         |       |          |
       |    [checkpoint]  [checkpoint]        |
       |         |         |       |          |
       |         v         v       |          |
       |    +--------+ +--------+  |          |
       |    |Stage 4 | |Stage 4 |  |          |
       |    | REVISE | | REVISE |  |          |
       |    +---+----+ +---+----+  |          |
       |        |          |       |          |
       |   [checkpoint]   [checkpoint]        |
       |        |          |       |          |
       |        v          v       |          |
       |    +--------+ +--------+             |
       |    |Stg 3'  | |Stg 3'  |             |
       |    |RE-REV. | |RE-REV. |             |
       |    +---+----+ +---+----+             |
       |        |          |                  |
       |   [DECISION]  [DECISION]             |
       |        |          |                  |
       |     Accept      Major                |
       |     /Minor (*)    |                  |
       |        |     [checkpoint]            |
       |        |          |                  |
       |        |          v                  |
       |        |     +--------+              |
       |        |     |Stg 4'  |              |
       |        |     |RE-REVIS|              |
       |        |     +---+----+              |
       |        |          |                  |
       |   [checkpoint]  [checkpoint]         |
       |        |          |                  |
       v        v          v                  |
  +----+--------+----------+-----+            |
  |     Stage 4.5                |            |
  |   FINAL INTEGRITY            |            |
  +----------+------------------+             |
             |                                |
        [PASS? Zero issues]                   |
             |                                |
       +-----+-----+                          |
       |           |                          |
      Yes         No                          |
       |        [Fix]                         |
       |      [Re-verify, up to 3 rounds,     |
       |       then the user decides]         |
  [checkpoint]     |                          |
       |           |                          |
       v           |                          |
   +-------+       |                          |
   |  END  | <-----+                          |
   +-------+                                  |
```

(*) After a Minor decision at Stage 3', the minor items go to one `/paper revision` run before Stage 4.5, as the row "Decision = Minor" of "Normal Flow Transitions" gives.

---

## Legal State Transitions

### Normal Flow Transitions

The writing, the review, the revision and the re-review are runs of other skills, each invoked through the Skill tool with its own stops: Stage 2 is `/paper full`, Stage 3 is `/paper-review-panel full`, Stage 4 and Stage 4' are `/paper revision`, and Stage 3' is `/paper-review-panel re-review`. The corrections an integrity check asks for go to `/paper revision` with the issue list as its comments.

| From | To | Precondition | Action |
|------|----|-------------|--------|
| INIT | Stage 2 | User has research materials | Detect materials, invoke `/paper full` through the Skill tool |
| INIT | Stage 2.5 | User has complete paper | Launch the integrity agent |
| INIT | Stage 3 | User has verified paper + integrity report | Confirm paper language/domain, run Stage 2.5 on the paper first (a paper that enters midway never skips it), then invoke `/paper-review-panel full` through the Skill tool |
| INIT | Stage 4 | User has review comments | Confirm paper + review comments, run Stage 2.5 on the paper first (a paper that enters midway never skips it), then invoke `/paper revision` through the Skill tool |
| Stage 2 | **checkpoint** | Stage 2 completed, Paper Draft produced | Wait for user confirmation |
| checkpoint | Stage 2.5 | User confirms | Pass Paper Draft to integrity agent |
| Stage 2.5 | **checkpoint** | PASS | Wait for user confirmation |
| Stage 2.5 | Stage 2.5 (retry) | FAIL | Send the issue list to `/paper revision` as its comments, re-verify (max 3 rounds) |
| checkpoint | Stage 3 | User confirms | Pass verified paper to `/paper-review-panel full` |
| Stage 3 | **checkpoint** | Decision produced | Wait for user confirmation |
| checkpoint | Stage 4 | Decision = Minor/Major, user confirms | Pass Revision Roadmap to `/paper revision` |
| checkpoint | Stage 4.5 | Decision = Accept, user confirms | Skip revision, go directly to final verification |
| Stage 4 | **checkpoint** | Stage 4 completed | Wait for user confirmation |
| checkpoint | Stage 3' | User confirms, after a Stage 3 | Pass Revised Draft + Response to Reviewers to `/paper-review-panel re-review` |
| checkpoint | Stage 3' (completeness check) | User confirms, after a Stage 4 for review comments in hand | The session compares the structured comments with the Response to Reviewers, as `references/external_review_protocol.md`, "Step 4", gives, with no re-review invoked |
| Stage 3' (completeness check) | **checkpoint** | Check completed | Wait for user confirmation, then pass the revised draft to final verification |
| Stage 3' | **checkpoint** | Decision produced | Wait for user confirmation |
| checkpoint | Stage 4.5 | Decision = Accept, user confirms | Pass final draft to final verification |
| checkpoint | Stage 4.5 | Decision = Minor, user confirms | Send the minor items to one `/paper revision` run as its comments file, then pass the revised draft to final verification |
| checkpoint | Stage 4' | Decision = Major, user confirms | Pass new Revision Roadmap to `/paper revision` |
| Stage 4' | **checkpoint** | Stage 4' completed | Wait for user confirmation |
| checkpoint | Stage 4.5 | User confirms | Pass revised draft to final verification |
| Stage 4.5 | **checkpoint** | PASS (zero issues) | Wait for user confirmation |
| Stage 4.5 | Stage 4.5 (retry) | FAIL, or PASS WITH NOTES | Send the issue list to `/paper revision` as its comments, re-verify (max 3 rounds, then the user decides) |
| checkpoint | END | User confirms | Deliver the final verified draft |

### Special Flow Transitions

| From | To | Precondition | Action |
|------|----|-------------|--------|
| Stage 3 (Reject) | Stage 2 | User chooses to restructure | Clear Stage 2-3 state, restart Stage 2 |
| Stage 3 (Reject) | ABORT | User chooses to abandon | Save all produced materials, mark pipeline aborted |
| Stage 3' (Major) | Stage 4' | User confirms | Last revision opportunity |
| Stage 4' | Stage 4.5 | Revision complete | Go directly to final verification (no return to review) |
| Any stage | PAUSED | User says "pause" or "stop here" | Save pipeline state |
| PAUSED | Previous stage | User returns to continue | Restore pipeline state, display Dashboard |

### Prohibited Transitions (Illegal)

| From | To | Reason |
|------|----|--------|
| Stage 2 | Stage 3 | **Cannot skip Stage 2.5 (integrity check is mandatory)** |
| Stage 4 | END | Cannot skip RE-REVIEW (revision must be re-reviewed) |
| Stage 3' | END | **Cannot skip Stage 4.5 (final integrity check is mandatory)** |
| Stage 4' | Stage 3' | Cannot return to RE-REVIEW (max 1 round of RE-REVISE) |
| completed | in_progress | Completed stages cannot restart |

---

## Material Dependency Matrix

| Material | Produced At | Consumed At | Required/Recommended |
|----------|-----------|-------------|---------------------|
| Paper Draft | Stage 2 | Stage 2.5 (input) | **Required** |
| **Integrity Report (Pre)** | **Stage 2.5** | **Stage 3 (prerequisite)** | **Required** |
| **Verified Paper Draft** | **Stage 2.5** | **Stage 3 (Phase 0)** | **Required** |
| Review Reports (x5) | Stage 3 | Stage 4 (input) | Required |
| Editorial Decision | Stage 3 | Stage 4 (input) | Required |
| Revision Roadmap | Stage 3 | Stage 4 (input) | Required |
| Revised Draft | Stage 4 | Stage 3' (Phase 0) | Required |
| Response to Reviewers | Stage 4 | Stage 3' (input) | Recommended |
| **Re-Review Report** | **Stage 3'** | **Stage 4' (input)** | **Required (if Major)** |
| **Re-Revised Draft** | **Stage 4'** | **Stage 4.5 (input)** | **Required (if executed)** |
| **Integrity Report (Final)** | **Stage 4.5** | **END (delivery)** | **Required** |

Each integrity report is its own file in the run folder.

---

## Exception State Handling

### Timeout

If a stage shows no progress for an extended period (e.g., Socratic mode exceeds 15 rounds without convergence):
1. the session marks the stage as `stalled` in the run's state
2. orchestrator provides options:
   - Switch mode (socratic to full)
   - Narrow scope
   - Skip this stage (non-mandatory stages only)

### Missing Materials

If required materials are found missing during transition:
1. the session records the material gap in the run's state
2. orchestrator suggests returning to the stage that produces that material
3. User can choose: backfill / skip (at own risk, but cannot skip integrity checks)

### Integrity Check FAIL Loop

If Stage 2.5 or 4.5 corrections exceed 3 rounds without passing:
1. List all unverifiable items
2. User decides:
   - Manually handle unverifiable items
   - Remove unverifiable citations
   - Continue to next stage (with "partially unverified" warning)

### Session Interruption

If the user leaves and returns:
1. orchestrator reads the run's state from the run folder and displays Progress Dashboard
2. Confirm whether to continue from breakpoint
3. Check if any outdated materials need refreshing

---

## Revision Loop Rules

### Simplified Revision Cycle

```
Stage 3 (First REVIEW)
  -> Decision: Accept -> Stage 4.5
  -> Decision: Minor/Major -> Stage 4
      -> Stage 4 (REVISE)
          -> Stage 3' (RE-REVIEW, verification)
              -> Decision: Accept -> Stage 4.5
              -> Decision: Minor -> one /paper revision run for the minor items -> Stage 4.5
              -> Decision: Major -> Stage 4' (last revision)
                  -> Stage 4.5 (go directly to final verification, no return to review)

Maximum 1 round of RE-REVISE, no infinite loops.
Unresolved issues -> Acknowledged Limitations.
```

### Rules of the cycle

- Fixed 2 reviews (Stage 3 + Stage 3') + max 1 RE-REVISE
- Mandatory Pre-review + Final integrity check
- 5 reviewers (+Devil's Advocate)
- Stage 2.5 and 4.5 cannot be skipped
- Every stage requires a checkpoint
