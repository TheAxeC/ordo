# Step 2, repair round 1

The rules file `docs/dev/change-standard.md` and the brief `agents/briefs/2.md` govern this round as they governed the step. The round is the one repair round of the step. Each finding below is from the reviewer's report; each ruling says what to change. Nothing else is changed.

## Findings and rulings

1. Spec 1 and Proof 1, `skills/academic/paper/SKILL.md`, Steps 15, two word counters, and a section-length command that counts a hand-set reference list. Ruling: every word count held against a declared word limit, the first one included, in full and in format-convert, is taken by the session with one command, the same each time. The formatter's row Word Count is not held against the limit. The command leaves out the title and the reference list in both forms, `\bibliography` and `thebibliography`, and counts the abstract as a part of its own, so the total is the sum of the parts it prints. The sentence that describes the command says what it counts as it runs, captions and citation keys included when it counts them. Before the sentence is written, the command is run on a scratch `.tex` of each reference-list form, and the report quotes both runs. Where format-convert compares a count with a limit, it uses this command.
2. Spec 2, `skills/academic/paper/agents/intake_agent.md`, the follow-up question on the venue's declared limits: it asks for no page limit, so the page-limit half of the step never runs unless the user states one unasked. Ruling: the question's list gains "page limit", marked as `paper`'s addition as the page marks its others, and the bullet of the step in the Decision of ADR 0036, "Deviations from academic-paper", names it.
3. Spec 3, `skills/academic/grant/SKILL.md`, Steps 10 in a run on one section. Ruling: in a run on one section, the direction of the cut says that the patch changes lines of that section only, and the session reads the patch's ops against the section's line range before it applies the patch, as the findings patch of the same run is read. An application still over is named in the final message.
4. Spec 4, `formatter_agent.md` against Steps 15: the formatter reports a limit that any file of the run declares, and Steps 15 counts only a limit of the venue profile. Ruling: Steps 15 holds the count against every declared limit the formatter's check names, from the venue profile or from a file of the run, with the file the formatter gives; the two pages say the same.
5. Spec 5, `skills/academic/paper/agents/citation_compliance_agent.md`: the change stands. The path list of the step gains this file.
6. Spec 6, disclosure: the mode has no venue profile and no compile, so its new sentences never act. Ruling: disclosure is taken out of Steps 15 and its item 3 loses the count; Steps 15 names full and format-convert. No figure or other page then names a count in disclosure. Item 2 of the brief is changed by this ruling.
7. Spec 7, the wording "A value the venue does not state comes from the declared format profile, and with no profile it is the current default" against ADR 0050's "only what the venue or the funder states": nothing is changed in this round. The point is raised to the user.
8. Standards 1, `skills/academic/writing/references/manuscript-prose-standard.md`, section H: the rule allows "states a change" and forbids "what was changed since an earlier version". Ruling: the first clause stays. The list of process history reads: what was tried, what an earlier version of the text said, or how the text came about. One sentence follows it: a change the reader asked for or must act on, such as a revision stated in a response letter or a resubmission's cover letter, is no process history. The example stays.
9. Standards 2, `skills/academic/paper/agents/draft_writer_agent.md`, "The limit cut", against `grant` Steps 10: `grant`'s draft writer is pointed at a section that names only `paper` as sender and inputs `grant` does not give. Ruling: read first which page `grant`'s draft writer is given (`grep -n 'draft_writer\|limit cut' skills/academic/grant/SKILL.md skills/academic/grant -r`). If it is `paper`'s page, the section names both senders and the inputs each gives. If `grant` has its own page for the draft writer, the cut's task text stands there with `grant`'s inputs, and `paper`'s section names `paper` only. The report says which was found.
10. Behaviour 1, `grant` Steps 10, section lengths from the first draft's report. Ruling: each section's length in the final message is the one the last run of `check_limits.py` printed. A section for which the script prints no line has no length given, and the message says so. `draft-report.md` is not used for it.

## After the changes

- Read Steps 15 of `paper` and Steps 10 of `grant` once more against every other sentence of the same skill that names a count, a limit or the cut, and leave no two that contradict each other.
- Run `python3 docs/figures/gen_figures.py` if a ruling changed what a figure shows, and the checks of the brief's "Verify before you report" again; quote the lines.
- Append a section "Repair round 1" to the report `agents/reviews/2-report.md` in the worktree: each finding by its number here, what was changed and where, and the checks' lines.

## Paths this round writes

- `skills/academic/paper/SKILL.md`
- `skills/academic/paper/agents/intake_agent.md`
- `skills/academic/paper/agents/formatter_agent.md`
- `skills/academic/paper/agents/draft_writer_agent.md`
- `skills/academic/grant/SKILL.md`, and the draft writer's page of `grant` where ruling 9 finds one
- `skills/academic/writing/references/manuscript-prose-standard.md`
- `docs/adr/0036-*.md`
- `docs/figures/gen_figures.py` and the figures it writes, `README.md`, only where ruling 6 changes what they show
- `.scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/2-report.md`
