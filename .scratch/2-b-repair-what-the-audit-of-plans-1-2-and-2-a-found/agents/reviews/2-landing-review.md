# Step 2: review of the fixes made at landing

A fresh read-only reviewer read the orchestrator's first pass of landing fixes. Usage: 74,661 tokens, 19 tool uses, 315 s (the runner's completion notification).

I reviewed the orchestrator's landing fixes read-only. The only git commands I ran were `git diff`, `git diff --cached` and `git status --short`, plus one `git show` of the old versions for the comparison you asked for.

**Findings**

1. **The note at the top of the builder's report makes a claim the report does not meet.** The note is in `2-report.md` at lines 3-4:
   `+The sections before "Repair round 1" describe the tree as first built; "Repair round 1" states the end state where they differ (the orchestrator's note at landing).`
   - The "Repair round 1" section no longer states the end state. The landing fixes changed what it describes:
     - Line 335, row 12: "Split into five bullets under Rules (`SKILL.md:263-267`) ... names "the round cap and the bullets after it". Word counts ... 17, 30, 20, 20 and 27". Now the cap is one bullet at line 263 with the two bullets after it, and the pointer reads "the two bullets after it".
     - Row 11: "`SKILL.md:268` covers `/spec`, `/refute`, `/land`, and `/roadmap`". Now the rule is at line 266 and includes `academic-paper`.
     - Row 3: "The round-cap rows moved to Rules 3 to 7". Now they point at Rules 3, 4 and 5.
     - Line 411 of "Checks after the round" quotes the old bullet "plus the one exception below".
   - The earlier sections are still stale where the round does not correct them. Line 306 ("Doc text" item 3) still says `brief.md` line 40 conflicts. That is the claim Proof 2 found stale, and it was corrected only in the state file.
   - Judgment call 2 (line 271) says one bullet holds the cap "and what happens after the last round". That was true of the first build and is true of no later version.
   - The note also comes before the report's first line. `docs/dev/change-standard.md` rule 7 requires "First line: anything NOT DONE, or that everything in the brief is done".
   - The note labels the stale sections instead of correcting them, so rule 7 ("The report states the end state only") is still broken. That is the cheaper option.
   - A double blank line follows the note.

2. **The corrected state-file entry has two problems.** It is at `orchestrator-state.md:89`:
   `+... `skills/land/SKILL.md:70` opened the landing report with the open items, not the position line (step 3, done in its item 12); a builder's report keeps the change standard's shape (step 2's Reports), so `skills/spec/templates/brief.md:40` stays in that shape (step 3's landing); ...`
   - (a) "done in its item 12" is not true on main. `sed -n 70p skills/land/SKILL.md` on main still reads "It holds the open items first, verbatim, ...". Step 3 is `landing: not-started`. The fix exists only in `.agents/worktrees/2b-3`, at lines 68-69. The past tense "opened" says the conflict is gone when it is not.
   - (b) The `brief.md:40` part does not say what step 3's landing must do. Step 3's worktree has already changed that line. `sed -n 40p .agents/worktrees/2b-3/skills/spec/templates/brief.md` shows "... "Everything in the brief is done". Then the position line: ...". That adds the position line to the builder's report, against step 2's `SKILL.md:199` "A builder's report keeps the shape of the repository's change standard".
   - The entry should say that step 3's landing takes the position line back out of `brief.md:40`. "stays in that shape" reads as "no action".

3. **Prose standard (section B, and E on sentence length) at `skills/plan-orchestration/SKILL.md:263`.**
   - The merged cap bullet is one sentence of 58 words (`wc -w`) joined by a semicolon. The `a7c5cff` text said the same thing in two sentences inside one bullet.
   - The layout's "one sentence where it can be" does not require one sentence, and the prose standard's length rule argues for two sentences in the same bullet.
   - Page-wide semicolons outside tables: 23 at `a7c5cff`, 24 staged, 25 now, over 3,944 words. The limit is about 8. The fix adds one.

4. **An unstaged change that is not in your list of fixes.** In `orchestrator-state.md:51`, `landing: not-started` becomes `landing: cherry-picking`. This is `/land`'s own state step, not a review fix. I list it only because you asked for "nothing else".

**Checked with no finding**

- **Merged cap bullet against `git show a7c5cff:skills/plan-orchestration/SKILL.md` (line 262).**
  - It keeps the cap, "one more only when" with both conditions and the size test, "a new finding of a review never earns that round" and "the user's yes never extends the cap". Nothing is lost or widened.
  - The only wording change is "too large to make at landing" becoming "too large for landing". The meaning is the same.
  - The landing bullet (line 264) and the booking bullet (line 265) match the old last sentence. The booked list is named "the state file's booked list", and "never sent back to the builder" is restored.
  - The layout rule (`docs/dev/skill-layout.md:45`, a qualifier stays in its rule's bullet) is met: the exception and both limits are in the cap's bullet.
- **Anti-patterns pointer (line 257).** "the round cap and the two bullets after it" resolves to lines 263-265 and excludes line 266.
- **Spec 2 (line 266).** It names `academic-paper for manuscript content`. This matches Steps 4 (lines 49 and 54), and nothing else in the bullet changed.
- **Inventory rows.** The file has one `## Rules` in `SKILL.md` with six bullets: 1 project name, 2 no yes, 3 cap, 4 landing, 5 booking, 6 skills invoked. `grep -n 'Rules' inventories/plan-orchestration.md` gives:
  - rows 20 (Rules 1) and 114 (Rules 2);
  - rows 63, 68 and 69 (Rules 3: the cap, the exception, the limits);
  - row 66 (Rules 4: small fixes at landing);
  - row 67 (Rules 5: the rest booked).

  Each resolves to the bullet that holds its rule. No row points at Rules 6, and none is needed: that rule is not in the `836f5c5` original (`git show 836f5c5:... | grep remembered` has no hit).
- **Commands.**
  - `python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md`: last lines `ok: .../roadmap.md`, `ok: .../spec.md`, exit=0 (all ten ok).
  - `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: last line `verify: 12 commands passed`, exit=0.
- **Standards 3 (vendor names).** It was left unchanged. I found no written rule against vendor names either: the change standard and `SKILL.md:261` forbid project names.

**Not checked**

- The staged step-2 diff beyond the hunks the landing fixes touch.
- `inventories/plan.md`, beyond confirming it has no unstaged change.
- Whether step 3's worktree has other conflicts with step 2's Reports rule besides `brief.md:40` and `land/SKILL.md`.
- Word counts of changed sentences other than lines 263-266.
