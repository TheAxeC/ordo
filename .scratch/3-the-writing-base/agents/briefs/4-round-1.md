# Repair round 1 of step 4, the repeated runs

The refuter report is `.scratch/3-the-writing-base/agents/reviews/4-refuter.md`. Read its findings Spec 1 to 3, Proof 1 to 3 and Standards 1 to 4 in full. Each ruling below says what to change. The brief `agents/briefs/4.md` still governs everything this round does not change. The step is built inline, so the session makes these changes in the main checkout's ledger. The path list is the brief's, widened to `plan.md` (the Open item G line and step 6's Step 0) and `.scratch/choices.md` (C70).

1. **Spec 1.** No change. It links the case verdicts to Open item H, which the user ruled (a).
2. **Spec 2.** `4-report.md` gets a section "Place checks" that quotes, for every place of both reports, one command and its output. A manuscript place is checked with `sed -n '<line>p' <file> | grep -cF -- '<part>'`, run from the main file's folder. A grant place is checked with `python3 -I <docx_paragraphs.py> <copy> | grep -E '^<n>: ' | grep -cF -- '<part>'`. Every place counts: each further place on a line, each quoted clause of a tense-list line, and `c_variants.tex:10` on report line 271. Gate condition 1 is read from that list. The report names the scratch files the step wrote outside "Paths this step writes".
3. **Spec 3.** `4-marks.md` gets one row per finding: each numbered finding, each place of a finding with several places, each split and each tense-list clause. Each row gives the place with its path from the main file's folder. Grant split 42 (e) reads "W (1, 4)" for marker 1.
4. **Proof 1.** Gate condition 6 fails on manuscript marker 1's `Read` coverage too: its `Read` calls cover 17 of the 33 files. C8 becomes partial. Step 6's Step 0 in `plan.md` gets a bullet: each marker's prompt says the draft files are read with the file-reading tool only, and no `cat`, `sed` or `grep` prints a draft file whole.
5. **Proof 2.** `4-report.md` and C70 state what the transcript shows about the three stopped marker starts:
   - The first two prompts carried the placeholders "FILE_PLACEHOLDER" and "REPORT_TEXT" where the report should stand.
   - The third prompt stopped at 32354 characters when a safety classifier stopped the response.
   - a07ee5da81e8d1b27 made two `Read` calls before it was stopped.
   - The grant prompts of 44152 characters went through.
   - Step 6's Step 0 gets a bullet that names this as the cause the brief of step 6 plans for.
6. **Proof 3.** The DONE / NOT DONE table gets rows for the brief's "Verify before you report" 1 and 4, each with the output of its run. The C4 line says that marker 2 names finding 68's missing quote and marker 1 does not.
7. **Standards 1.** The Open item G line in `plan.md` names C70 before its last clause and ends "(self-rule).".
8. **Standards 2.** `4-report.md` names the `sleep 10` before each served-model read as a departure from the change standard's "no background shells, sleeping or polling". Step 6's Step 0 gets a bullet: the served model is read from the runner's record with no sleep.
9. **Standards 3.** `4-report.md` and `4-marks.md` are rewritten to at most 2 semicolons per 1000 words of running prose outside code spans and tables.
10. **Standards 4.** "Files" lists every file the step wrote or changed, each with its `wc -l` line count after the last edit: `4-marks.md`, `4-report.md`, the six `4-run/` files, `plan.md`, `orchestrator-state.md` and `.scratch/choices.md`.

Verify before you report: the brief's "Verify before you report" 1 to 4 again, over the files as they stand after this round.

Report: `4-report.md` rewritten in place, with a section "Repair round 1" that has one row per ruling above with what changed. Anything not done comes first.
