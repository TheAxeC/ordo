The outline-only run is finished: it wrote an outline, an argument map and a literature review, and changed no manuscript file. `git status --short` shows only `paper-runs/` as new.

Three agents did the work, each on the model `claude-opus-5-5` as configured:
- **Literature strategist:** started once, then resumed to search for the eight outline sections that had no source.
- **Planner:** started twice.

**Stops I decided for you.** As you instructed, I took three stops that are normally yours, each with the recommended option, and recorded them under "Decisions" in `config.md`:
- **Intake confirmation:** your answers stand as given.
- **Sources' review:** I went on with every source the review includes, adding and removing none.
- **Outline approval:** I took the planner's recommendation on every point. You have not read the outline yet. A later `/paper full` run that takes it should know that I approved it, not you.

**What is in `paper-runs/outline-only-2026-11-15/`:**
- **`outline.md`:** an IMRaD outline of 7,250 words against a 7,000 target. It has six top-level sections plus Appendix A, an evidence map that assigns all 66 sources, the structure check and the four existing figures.
- **`arguments.md`:** the argument map, with four sub-arguments and their weak-argument signs.
- **`review.md`:** the literature review. It screened all 21 entries in `manuscript/refs.bib` and searched in 3 passes. Section 11 covers the eight sections that needed sources.
- **`refs.bib`:** 45 new entries. They are not yet in `manuscript/refs.bib`.
- **`config.md`** and **`final.md`**: the run record and the full final message.

**Choices to review:**
- **Structure:**
  - Interpretation moves from Results to Discussion, and implementation settings go to Appendix A.
  - Limitations becomes Discussion 5.4.
  - Results are regrouped into four subsections.
  - The response letter's section references change: "new 4.7" becomes 4.4.3 and "Section 6" becomes 5.4.
- **Federation (research question):** I took option (a), which describes the federation part as simulated prevalence heterogeneity. Option (b) would add a federated arm over the real institutions of the CinC 2020 or 2021 data. That answers R3-5 fully but needs new data and new runs, so it is your decision.
- **Arguments:** sub-arguments 1, 2 and 4 are weak as the draft words them. A weak sub-argument blocks drafting until it is reworded, so the outline plans new wording for each:
  - "representation" is defined to include its scaler;
  - the claim about clustering algorithms is limited to the five tested;
  - the explanation of the ranking rests on the out-of-fold gain and ECGFounder's supervised pretraining;
  - the federation claim is limited to the simulation.
- **No source found:** three claims are reworded to stand without one. If you hold a source for any of them, it would replace the rewording:
  - lead II as the standard rhythm lead;
  - robust scaling as a common default;
  - internal validity indices being maximized by degenerate partitions.

**Citations in `main.tex` that the sources do not support:**
- **lookingbeyond2026 (lines 122 to 125 and 179 to 185):** its full text has no result specific to PTB-XL and does not evaluate AF on PTB-XL. It never mentions hand-crafted features, so "by its own statement" is wrong.
- **sslclustering2025:** it does not state the distinction between linear separability and clusterability that the draft credits to it.
- **rousseeuw1987:** it does not support the claim about degenerate partitions that it is cited for.

**Bibliography problems:**
- **wavelettensorecg2018:** the authors in the `.bib` do not match Crossref.
- **ecgfounder2024:** the preprint is now published in NEJM AI (doi 10.1056/aioa2401033).
- **Steinley_2004 (new entry):** its title reads "Hubert-Arable".
- **Non-ASCII characters:** several new entries contain them, which bears on R3-14.

**Draft errors and untraceable numbers:**
- **Draft errors the outline corrects:**
  - Lines 729 to 732 say the controls sit at chance on both tasks under all five clusterers, but MIT-BIH ran three and the conv-AE reaches 0.127 there.
  - Line 452 says "every adjacent contrast", but the tests skip the conv-AE.
  - The draft gives 0.242 where Table 1's rounded entries give 0.241.
- **Numbers that cannot be checked**, because `code/results/` is not in the project:
  - the power-scaling mean of 0.606;
  - MIT-BIH has no intervals and no paired tests;
  - which clusterer the imbalance result used;
  - the neighbour count and connectivity of the spectral graph;
  - per-cell values that exist only in the figure PDFs.
- **`revision-roadmap.md` disagrees with `main.tex`** on the input array (5000 by 12 against 1000 by 12) and on HuBERT-ECG's out-of-fold ARI (0.92 against 0.549). The outline follows `main.tex`.

**Search limits and gaps:**
- **Recency:** 31 of 66 sources (47 percent) date from 2022 to 2026, which is below the review's requirement for recent sources.
- **Indexes:** OpenAlex and Semantic Scholar mostly refused requests (HTTP 429), so the search relied mainly on Crossref and arXiv.
- **Missing abstracts:** four sources had none available, so their annotations carry gaps.
- **AI use:** `config.md` records the tools and versions of earlier AI use as a gap, and every category as uncertain.

**Not done in this mode:** outline-only writes no manuscript text and does not add the 45 new entries to `manuscript/refs.bib`. `/paper full` with this outline, or `/paper revision` for the referee comments, does both.
