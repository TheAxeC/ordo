# Step 25, repair round 1

The findings are in `agents/reviews/25-refuter.md` (main ledger; its text follows in the message). Each ruling says what to change. The brief `agents/briefs/25.md` still governs; this round amends What to build 3 and Decision 1 as ruling A says.

## Ruling A: the form of a split (amends What to build 3 and Decision 1)

1. A split never leaves an item whose condition, subject or antecedent is only in a sibling item. Each new item either names its subject and its condition itself, or is a sub-bullet of the item that names them.
2. When the later requirements of an item share its bold label, its condition, or a subject longer than three words, they become sub-bullets of the first requirement's item, without the label and with a pronoun for the subject where the parent names it. A label is written once.
3. Nesting is at most three levels under a top-level list item (item, sub-bullet, sub-sub-bullet). Where a split would need a fourth level, the requirements stay siblings at the third level and each names its subject in a short form ("Such a cause", "That step"), with no sentence opening repeated three times in a row.
4. No sentence opening is repeated in three or more consecutive items (`prose-standard.md` section 0, "No repeated construction").

## The findings, one ruling each

1. **Spec 1.1, the eighteen items that do not read alone.** Apply ruling A to each: nest it under the item that names its antecedent, or name the subject (for example land:62 "The lines `verify.sh` prints are what the booking quotes.", land:194 "The landed commit's preparation commit stays.").
2. **Standards 3.1, repeated construction.** Apply ruling A at plan-orchestration 64-70 (`inline`, `academic-paper`), 95-101 ("Only known fixes"), 123-125 ("Orchestrator"), 311-313 ("Everything else that the rounds left undone ..."), and at every other place in the ten files where a bold label is repeated or three consecutive items open the same way (`grep -n` the diff for repeated `**...**` labels and repeated openings).
3. **Behaviour 4.1, plan-help:43-44.** Rejoin as the old item: one output, one act.
4. **Behaviour 4.2, spec:37-38.** The second requirement becomes a sub-bullet of the first, or names the condition: "A step whose dispatch entry reads `landing: backed-out` goes through ...".
5. **Behaviour 4.3, spec:199-200.** The second entry names its condition: "for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it: ...;".
6. **Behaviour 4.4, refute:51-52.** The second item keeps the condition: nest it under the first, or "Where a claim needs a second build, the reviewer reproduces what it can from the one build."
7. **Behaviour 4.5, land:116-117.** Rejoin as the old item: the first half is a definition the rule uses.
8. **Behaviour 4.6, spec:70-71.** "A step not in the list is a refusal ("Stops"), with the list printed."
9. **Behaviour 4.7, land:70-72.** The kept worktree and branches and the unticked step become sub-bullets of "The dispatch block is then set to `landing: backed-out`", or each names the back-out condition, within the nesting limit of ruling A.
10. **Behaviour 4.8, plan-orchestration:48-50.** The brief's Cases 4 text is corrected: "The loop moves on to the next unblocked step." becomes a sub-bullet of "A stop, here or at any later step, blocks its own step.", or names the stop ("After a stop, the loop moves on to the next unblocked step.").
11. **Items still holding two requirements** (the orchestrator's read): split each, under ruling A:
    - land:149 and spec:160: the branch naming, and "No path or branch is built from the step id." as its own item;
    - plan-orchestration:162: the definition of a backed-out step, and the rule that its worktree and branches are kept;
    - plan-orchestration:260: stopping what runs at the cut-off, and keeping its worktree;
    - spec:120: what the back-out did stays done, and the patch stays in the ledger.
12. **Proof 2.1.** After the fixes, re-read every split of the step against rule 17 (every condition, exception and limit kept with each requirement it governs). The report's claim at line 972 and its DONE row for What to build 3 are rewritten to what that re-read shows, with any further split fixed in this round.

## Verify and report

- Rerun every check of the brief's "Verify before you report": the verify list through `verify.sh` (the six `PASS:` lines, nothing for the ASCII check, `verify: 7 commands passed`, exit 0), the diff stat, the numbered items (209, same sections and numbers), the position references (105, each on the same rule), the word check.
- `grep -c '\*\*Only known fixes\.\*\*' skills/plan-orchestration/SKILL.md` prints 1, and a check for any bold label repeated in two items of one list prints nothing; quote the command and its output.
- Append to the report a section "Repair round 1": one row per numbered ruling above with the file:line, the new text, and the command that shows it; the updated counts (items split, items after, lines); and the verify lines. Update the report's earlier sections where the round makes them false.
