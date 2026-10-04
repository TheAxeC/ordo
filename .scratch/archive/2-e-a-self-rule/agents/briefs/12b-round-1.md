# Step 12b, repair round 1

The refuter report is `agents/reviews/12b-refuter.md` (read it from the main checkout). Each finding below has its ruling. The brief and every check of "Verify before you report" still hold, with the paths and the checks this round adds. After the fixes, run every check again and quote its output.

This round widens "Paths this step writes" to:

- `skills/roadmap/SKILL.md`
- `skills/diagnose/SKILL.md`
- `skills/diagnose/templates/diagnosis.md`
- `skills/repo-setup/templates/plan-terms.md`
- `docs/glossary.md`
- `.scratch/2-e-a-self-rule/agents/reviews/12b-report.md`

1. Spec 2, a round run whose findings stand under one heading "Findings", grouped by bold labels (`6-refuter.md`, `4-refuter.md`). In `skills/roadmap/SKILL.md`, "What it reads" 6, insert this sub-bullet after the one that begins "For a finding of a refuter report's run over a repair round", at the same indent, word for word:

   ```
   - Where a run's findings stand under one heading "Findings", grouped by the labels Spec, Proof, Standards and Behaviour, the label stands for the heading and the number is counted in that label's list, as `round 1`, "Standards" and 3 name the third finding under the label "Standards" of the run over round 1.
   ```

2. Spec 4, the reviewer's section in the reading. In the last of the dictated sub-bullets, replace "in the first run or in the run of `round <n>`:" with "in the first run or in the run of `round <n>`, inside the reviewer's section when the bullet gives one:". Nothing else in that sub-bullet changes.

3. Spec 3, the heading level of a later diagnosis.
   - In `skills/diagnose/SKILL.md`, Steps 2, replace "A later diagnosis of the same step is appended to that file under its own heading, which names its finding." with "A later diagnosis of the same step is appended to that file under its own heading at the level of the record's title, `# Diagnosis: <the symptom in a few words>`, which names its finding."
   - In `skills/diagnose/templates/diagnosis.md`, the paragraph after the title, replace "A diagnosis of the same step later is appended below under its own heading, which names its finding." with "A diagnosis of the same step later is appended below under its own heading at the level of the title above, `# Diagnosis: <the symptom in a few words>`, which names its finding."
   - With both, the whole text under a record's title ends at the next diagnosis's heading, so the `roadmap` sub-bullets need no change for it. Read every other place that states how a record is headed (`grep -rn -i 'appended' skills/diagnose docs README.md`) and confirm each still holds, or hand it back.

4. Standards 1, the sense of **finding** for a landing report or a diagnosis record. In `skills/repo-setup/templates/plan-terms.md`, the entry **finding**, insert this sentence before "Stated in:", word for word, and add `roadmap`, "What it reads" 6 to its "Stated in" list after the last place:

   ```
   A finding of a landing report or a diagnosis record, named by a quoted ruling ending "(self-rule)", is the whole text under the heading the ruling names.
   ```

   Then sync with `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, and check with `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`, which must print `ok: the plan-terms block equals the template`.

5. Proof 1. Correct point 3 of the report's "Anything in the brief wrong or impossible": the number is counted in the list of findings under the heading, as case 1 reads it, and not among all top-level bullets.

6. Proof 2. Correct point 2 of the same section: a round run written to the template holds one list under "Findings", and it is the grouped shape of `6-refuter.md` and `4-refuter.md` that the text could not name before item 1.

7. Spec 1, the count of bullets under `12-landing.md` "What was found" in the brief and in case 7. This is the brief's error, corrected in the ledger by the orchestrator; the report needs no change for it beyond what it says.

8. The report. Its first line appears twice: keep one. Its "Open items of the state file, verbatim" now reads "None.", since Open item Q is closed. Add a section "Repair round 1" that lists each numbered item above with its place before and after, and the checks' output.

Versions: `diagnose` is 1.1.0 and `repo-setup` 1.3.0, each raised by this plan from 1.0.0 and 1.2.1 at the plan's base 9fc91dc, so neither changes. Verify 3 gains `grep -m1 version: skills/diagnose/SKILL.md skills/repo-setup/SKILL.md`, printing those two values. Verify 4 now expects the five repository paths above.

Every fix is the smallest change that ends the finding and keeps every rule of the text. No path outside the widened list changes.
