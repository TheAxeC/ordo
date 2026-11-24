The ruling is carried out in full: open item N, option 1, in `submit`. The walk now sets a field's text whole in one action, fills a field that differs a second time, and never fills it a third time from the same text of its row. Every sentence the change made false has been corrected. `metadata.version` stays "1.0.0" (`grep -n version skills/academic/submit/SKILL.md` prints `5:  version: "1.0.0"`). Nothing is left undone.

**git diff --stat**
```
 README.md                                           |  2 +-
 docs/glossary.md                                    |  2 +-
 skills/academic/submit/SKILL.md                     | 21 ++++++++++++---------
 .../academic/submit/templates/submission-sheet.md   |  2 +-
 4 files changed, 15 insertions(+), 12 deletions(-)
```

**Changed sentences, before and after**

/Users/axelfaes/workspace/ordo/skills/academic/submit/SKILL.md
1. "The walk of one page" 3, the fill bullet:
   - Before: "Type the value's text as its cell holds it, read as the notes ... say ...".
   - After, two bullets:
     - "Set a text value whole, in one action that sets the field's value, where the browser tool has one, and type it key by key only where the field takes nothing else."
     - "Take the value's text as its cell holds it, read as the notes of `templates/submission-sheet.md` say ...", with the rest of the sentence unchanged.
2. "The walk of one page" 5:
   - Before: "Type an answer that is a text as item 3 says of a value."
   - After: "Fill an answer that is a text as item 3 says of a value."
3. "The walk of one page" 7, before:
   - "Note each difference for the closing message: the field, the value of the sheet and the value the page shows."
   - "Fill no field a second time."
   - "Done when each field, file and declaration of the page is compared."
4. "The walk of one page" 7, after:
   - "When a field's value on the page differs from its row, set the field once more from the row, whole, as item 3 says, and read it back again."
   - "A difference that remains after that second fill is left as it is, since a portal that rewrites a value would change it again."
   - "Note each difference that remains for the closing message: the field, the value of the sheet, the value the page shows, the length of both texts and what differs."
   - "A field is never filled a third time from the same text of its row."
   - "Done when each field, file and declaration of the page is compared, and each field that differed is filled once more and read back again."
5. Steps 11, the closing message:
   - Before: "... each difference the read-back found, and each row ...".
   - After: "... each difference that remains after the second fill of "The walk of one page" 7, with the length of both texts and what differs, and each row ...".
6. Anti-patterns row on filling again:
   - Before: "Filling a field again after the read-back finds a difference | A portal that rewrites the value changes it again, and the walk repeats with no count | Note the difference for the closing message".
   - After: "Filling a field a third time after the read-back of its second fill still finds a difference | (same reason) | Leave the difference as it is and name it in the closing message, as "The walk of one page" 7 says".
7. Anti-patterns row on making a page pass:
   - Before: "Typing a value the sheet does not hold, or using the control ...".
   - After: "Filling a field with a value the sheet does not hold, or using the control ...".
8. Rules:
   - Before: "The sheet as approved is the only source of what is typed, uploaded, ticked or answered, ...".
   - After: "... the only source of what is filled, uploaded, ticked or answered, ...".

/Users/axelfaes/workspace/ordo/skills/academic/submit/templates/submission-sheet.md
- Before: "The walk types the cell's text with each `<br>` as a line break and each `\|` as a `|`."
- After: "The walk fills the field with the cell's text, each `<br>` as a line break and each `\|` as a `|`."

/Users/axelfaes/workspace/ordo/docs/glossary.md, entry **walk, of a submission**. This entry sits outside the synced plan-terms block (block lines 5 to 144, entry at line 173), so it was edited in place.
1. The read-back clause:
   - Before: "... reads each page back against the sheet, adds each field or control ...".
   - After: "... reads each page back against the sheet, fills once more from its row each field whose value differs and leaves a difference that remains after that second fill as it is, adds each field or control ...".
2. The closing message:
   - Before: "... and it names each row of the sheet that no field of the form asked for."
   - After: "... and it names each difference that remains and each row of the sheet that no field of the form asked for."

/Users/axelfaes/workspace/ordo/README.md, the `submit` row:
1. The read-back clause:
   - Before: "... reads each page back against the sheet, and adds each field ...".
   - After: "... reads each page back against the sheet, fills once more from its row each field whose value differs, and adds each field ...".
2. The closing message:
   - Before: "its closing message names each row of the sheet no field of the form asked for."
   - After: "its closing message names each difference that remains after that second fill and each row of the sheet no field of the form asked for."

**Places checked and left unchanged, because no sentence there became false**
- **The `description` of `submit`.** It says "fills each field from its row ... reads each page back", which still holds, and nowhere says a field is never filled twice. It is also at 1022 of the 1,024 characters allowed (the `skill-layout.md` count command prints 1022), so no clause fits.
- **Stops.** No row there speaks of filling a field again.
- **ADR 0049.** Its Decision says only "The session drives the browser and fills what the sheet holds", and it has no sentence about the read-back or about filling once.
- **`docs/figures/gen_figures.py`.** The `submit()` note says "fills each field ... and reads each page back against it", which still holds, so the figure text did not change. I ran the generator anyway, and `git status --short` afterwards lists no changed `.svg`.
- **Other uses of "typed" and "to be typed".** "As it is to be typed" in the template and in `agents/sheet_agent.md` describes the characters of the value, not how the walk enters them, so it was left. "The session never types a password" in Rules and the anti-pattern "Typing the user's password" are not about filling a field, so they stay.
- **The greps.** I searched for "second time", "read back", "read-back", "again", "once more", "typ" and "fill" across `skills/academic/submit`, `docs` and `README.md`. The other hits are in unrelated ADRs (0025, 0027), the figure scripts' own write-back checks and `docs/dev/blind-comparison.md`.

**Judgment calls**
- **"A field is never filled a third time from the same text of its row".** The ruling says "A field is never filled a third time". I added "from the same text of its row" because "The walk of one page" 8 has the walk fill a row again after the user changes it at the stop "A page that does not pass". Without the qualifier, a field that already had two fills could never take the user's corrected value, and the two rules would contradict each other. If you want the ruling's exact words, item 8 needs a sentence instead saying that a changed row starts a new count.
- **Rewording the remaining "type" sentences.** I changed "Type an answer" (item 5), "typed" (Rules), "Typing a value" (anti-pattern) and "The walk types" (template) to "fill" or "fills". After item 3's change they no longer described the action the walk takes, and the anti-pattern would otherwise have covered only typed values.

**Verify output.** Each command was run from the repository root, with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front.
- `LC_ALL=C grep -n '[^ -~]'` on each of the four changed files printed nothing.
- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0.
- `python3 docs/figures/gen_figures.py` printed the 24 "wrote ..." lines, including `wrote docs/figures/submit.svg (13466 bytes)`, and exited 0.
- `sh skills/orchestration/land/templates/checks.sh .scratch/25-project-rules-a-build-driver-submit-and-tutor/orchestrator-state.md 2>&1 | grep '^checks:'` printed `checks: 16 commands passed`.

**Not done:** nothing. No git command that changes state was run, and the changes are uncommitted in the main checkout.
