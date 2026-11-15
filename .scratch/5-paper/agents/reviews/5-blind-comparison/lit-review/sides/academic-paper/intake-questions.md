# The last message of turn 1, as it printed it

Phase 0 (intake) of the lit-review mode is done, and the run is now stopped at the skill's required checkpoint: you have to confirm the Paper Configuration Record before Phase 1 (the literature_strategist_agent search and screening) can start. No literature search has been run yet.

**What exists now**
- `phase0_paper_configuration_record.md`, written by the intake agent (a general-purpose Agent call following `agents/intake_agent.md`). I fixed one wrong cross-reference in it (question 4 now points to question 8, the target-journal question). `LC_ALL=C grep -n '[^ -~]'` found no non-ASCII characters. The file is untracked and not committed.
- No existing materials were found to hand off: the repo holds only `.git` and the skill folder.
- Fixed by your request: the topic (all eight areas), the paper type (Literature Review) and the mode (`lit-review`).

**Open items for you to confirm.** Each question has its options and one recommendation. Reply "accept recommendations" to take all of them, or answer by number.

1. **Research question.** Recommended: "Which methods exist for supervised prediction when the spatial mode is not aligned across subjects, how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and which combinations of multilinear structure and unaligned support remain unaddressed?" The alternatives are limiting it to medical imaging, organising it by method family without one question, or your own wording. The recommended framing gives the literature matrix one axis that runs across all eight areas.
2. **Review design.** Recommended: a structured narrative review with a documented search (databases, query strings, criteria, counts at each stage). The alternatives are a full PRISMA systematic review with a registered protocol, or a PRISMA-ScR scoping review. The narrative design is the cheaper option. My judgment is that it is also the right one here: these method communities use different terms, so one exhaustive PRISMA query does not fit, and registered protocols are built for grading clinical evidence.
3. **Inclusion window.** Recommended: foundational works from any year, plus a systematic search covering 2013 to 2026.
4. **Output role.** Recommended: a review chapter or related-work basis for a later methods paper, rather than a standalone submission. This is a judgment based on your wording "pipelines such methods avoid or build on".
5. **Discipline.** Recommended: machine learning, with medical image analysis as the application setting, and methods admitted from any application domain.
6. **Sources.** Recommended: English-language journals, proceedings and arXiv preprints, with preprints flagged as such.
7. **Paper type.** Literature Review.
8. **Target journal.** Recommended: none (generic format) if item 4 is a chapter; otherwise name the venue and any limits you want recorded.
9. **Citation format.** Recommended: IEEE, or Vancouver if the target is a medical journal.
10. **Output format.** Recommended: LaTeX (.tex and .bib) if this feeds a LaTeX manuscript, otherwise Markdown. No layout profile.
11. **Body language.** EN.
12. **Abstract language.** Recommended: EN only. The skill defaults to a bilingual zh-TW and English abstract.
13. **Length.** Recommended: 9,000 words, or the length the later paper allows if this is a chapter.
14. **Existing materials.** Do you have a seed .bib or reference list? If so, Phase 1 uses it to anchor the search.
15. **Co-authors.** Unknown; only you can state this.
16. **Style calibration.** Recommended: provide 3 or more past papers if you have them, otherwise skip it.
17. **Funding and conflicts of interest.** Unknown; only you can state this.
18. **Domain evidence profile.** Recommended: `cs_ml`. It admits proceedings and arXiv, where most of this literature is published. The neutral profile would leave much of it out.
19. **Citation verification.** Recommended: strict. A citation whose DOI or arXiv ID fails lookup then blocks finalization. This is the more demanding option.

Once you confirm, I'll dispatch literature_strategist_agent for Phase 1. Its output is the search strategy, screening counts, annotated bibliography, literature matrix and gap map, with every citation verified by DOI or web search.
