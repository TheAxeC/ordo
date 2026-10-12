# Repair round 1 of step 2: the findings of `agents/reviews/2-refuter.md`

One finding goes back in this round. The round writes the paths of the brief and no other. The checks of the brief's "Verify before you report" run again after the fix, and the report quotes their output.

1. S1, the head comment of `tests/guide.test.sh`, lines 1-20.
   - The comment is held to `docs/dev/prose-standard.md` section F, "Source formatting": one paragraph per source line, no hard wrapping. Each paragraph of the comment becomes one comment line, however long; the list of printed lines keeps one comment line per printed line.
   - It is held to section E: a sentence whose actor matters is in the active voice ("The script prints ...", "The script reads only the first argument"), and the sentences on the three reasons do not repeat one construction.
   - The content stays whole and the same: what the script checks, its one input and its default, each line it prints, when each reason is printed, and each exit status, as the change standard's rule 14 asks.
   - No code line changes.
2. The report, the same file `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md` in the worktree, gains a section "Repair round 1" that gives the finding, the comment before and after, and the reruns of the brief's checks, the character-set check and the tab count over `tests/guide.test.sh` among them. Its judgment-calls section no longer says the head comment departs from nothing.

Findings B1 (a NUL byte in a guide) and B2 (the locale of the tab search) are not sent: neither input has happened, and the verify list's character-set check fails a guide holding a non-ASCII byte, so a wrong answer on them costs nothing.
