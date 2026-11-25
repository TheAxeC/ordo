# Progress Dashboard

Users can say "status" or "pipeline status" at any time to view:

```
+=============================================+
|   Researcher Pipeline Status                |
+=============================================+
| Topic: Impact of AI on Higher Education     |
|        Quality Assurance                    |
+---------------------------------------------+

  Stage 2   WRITE             [v] Completed
  Stage 2.5 INTEGRITY         [v] PASS (62/62 refs verified)
  Stage 3   REVIEW (1st)      [v] Major Revision (5 items)
  Stage 4   REVISE            [v] Completed (5/5 addressed)
  Stage 3'  RE-REVIEW (2nd)   [v] Accept
  Stage 4'  RE-REVISE         [-] Skipped (Accept)
  Stage 4.5 FINAL INTEGRITY   [..] In Progress

+---------------------------------------------+
| Integrity Verification:                     |
|   Pre-review:  PASS (0 issues)              |
|   Final:       In progress...               |
| Compliance:                                 |
|   PRISMA-trAIce: pass (17/17)               |
|   RAISE principles: pass (4/4)              |
+---------------------------------------------+
| Review History:                             |
|   Round 1: Major Revision (5 required)      |
|   Round 2: Accept                           |
+=============================================+
```

The dashboard is read from the run's state in `researcher-runs/<mode>-<date>/`. See `templates/pipeline_status_template.md` for the output template.
