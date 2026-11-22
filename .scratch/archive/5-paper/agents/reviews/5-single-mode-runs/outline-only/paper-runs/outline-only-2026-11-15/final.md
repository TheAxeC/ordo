# Final message: /paper outline-only, 2026-11-15

The outline-only run is finished. The run wrote an outline with its evidence map, an argument map and a literature review, and changed no manuscript file: `git status --short` shows only `paper-runs/` as new, and manuscript/main.tex and manuscript/refs.bib are unchanged.

## Stops taken on your behalf

You told the run not to stop for a choice whose recommendation it would take. The run took three stops that are normally yours that way, and recorded each under "Decisions" in config.md:

- The intake confirmation: the record holds your answers as given.
- The sources' review: the run went on with every source the review includes, adding and removing none.
- The outline's approval: the run took the planner's recommendation on every point. You have not read the outline. A later `/paper full` run that takes this outline should know that the session approved it, not you.

## Run folder

The run folder is paper-runs/outline-only-2026-11-15/. It holds:

- config.md: the intake record, the notes and the decisions.
- review.md: the screening of the 21 entries in manuscript/refs.bib, a search in 3 passes with a further search for the outline's sections, annotations, a literature matrix, the gaps and a synthesis. Section 11 covers the eight sections that needed literature.
- refs.bib: 45 new entries, each written as `lookup.py bibtex` printed it. They are not in manuscript/refs.bib.
- outline.md: an IMRaD outline of 7,250 words against a 7,000 target. It has six level-1 sections and Appendix A, the evidence map that assigns all 66 sources, the structure check, the four existing figures, and the word count summary.
- arguments.md: the argument map with four sub-arguments and their weak-argument signs.
- final.md: this message.

## Decisions taken with their recommendation, for your review

- **M1:** interpretation moves from Results to the Discussion, and the implementation settings go to Appendix A. This answers R3-8, R3-1, R3-4 and R3-7.
- **M2:** Limitations becomes Discussion 5.4. The response letter's section references change: "new 4.7" becomes 4.4.3 and "Section 6" becomes 5.4.
- **M3:** Results go from seven subsections to four, and 4.1 and 4.2 keep the numbers Reviewer 2 cites.
- **M4:** the federation part of the research question is worded as simulated prevalence heterogeneity, option (a). Option (b) was not taken. It would add a federated arm over the real institutions of the CinC 2020 or 2021 data, which answers R3-5 fully but needs new data and new runs, so it is yours to decide.
- **Weak-argument signs:** sub-arguments 1, 2 and 4 each have two or more signs in the draft's wording, which stops drafting until they are reworded. The planned wording is their remedy:
  - Sub-argument 1: a representation is defined as a feature map with its scaler. The clusterer claim is scoped to the clusterers tested, because Van_Gansbeke_2020 and arxiv_2303_17896 show learned clustering objectives recovering far more than k-means on the same features.
  - Sub-argument 2: the explanation of the ranking rests on the out-of-fold gain and on ECGFounder's supervised pretraining, which removes the circular reasoning.
  - Sub-argument 4: the claim is limited to simulated prevalence heterogeneity, and the lead-count clause is dropped.
- **No source found:** items 3, 4 and 6 of the needs-literature list take the planned rewording that stands without a source:
  - Item 3, lead II as the standard rhythm lead: stated as the study's own choice.
  - Item 4, robust scaling as a common default: "common default" is cut, and the sweep is justified by Wongoutong_2024.
  - Item 6, internal indices maximized by degenerate partitions: stated as the paper's own result in 4.3, and rousseeuw1987 is no longer cited for it.
  - A source you hold for any of the three would replace its rewording.

## Statements in main.tex that the sources do not support

- **lookingbeyond2026 (main.tex lines 122 to 125 and 179 to 185):** its full text reports ARI against the CD and AF labels pooled over four datasets, with no PTB-XL-specific result, and it does not evaluate AF on PTB-XL. It never mentions hand-crafted features or MIT-BIH, so "by its own statement" is wrong. Lines 181 to 183 and 466 to 468 are supported.
- **sslclustering2025 (main.tex lines 114 to 118, 505 and 741):** Weng et al. 2025 does not state the distinction between linear separability and clusterability. The outline cites four image-representation sources for it. No source measures both on ECG representations.
- **rousseeuw1987:** it is cited for degenerate partitions, which its annotation does not state.

## Bibliography points in manuscript/refs.bib

- **wavelettensorecg2018:** the authors are "He, Houshou and Tan, Yujie and Xing, Jun" in the .bib, while Crossref gives Hong He, Yonghong Tan and Jianfeng Xing.
- **ecgfounder2024:** the arXiv preprint is published as Li et al. 2025, NEJM AI, doi 10.1056/aioa2401033.

## Bibliography points in the run's refs.bib

- **Steinley_2004:** its title reads "Hubert-Arable" as Crossref printed it.
- **Non-ASCII characters:** several entries carry en dashes and other non-ASCII characters, which bears on R3-14.

## Points in the draft that the outline corrects

- Lines 729 to 732 say the controls sit at chance "on either task under all five clusterers". MIT-BIH ran three clusterers, and the conv-AE reaches 0.127 there.
- Line 452 says "every adjacent contrast", but the tests skip the conv-AE.
- The draft gives 0.242 where Table 1's rounded entries give 0.241.
- Two paragraphs about the earlier master's project (lines 104 to 111 and 734 to 738) are not planned.

## Numbers that cannot be traced without code/results/

The code/results/ folder is not in the project, so these cannot be checked or regenerated:

- The scaler-sweep means: hand-crafted 0.606 under power scaling matches neither the five-cell mean (0.526) nor the four-cell mean (0.643) of Table 1's power row.
- MIT-BIH has no intervals and no paired tests.
- The clusterer behind the imbalance result is not named.
- The neighbour count and the connectivity of the spectral affinity graph are not reported.
- Figure 1's per-cell interval widths, Figure 3's per-solution values, and the federated intervals for HuBERT-ECG and raw flattening exist only in the figure PDFs.

## admin/reviews/revision-roadmap.md against main.tex

- The input array is 5000 by 12 in the roadmap and 1000 by 12 in main.tex.
- The out-of-fold ARI is 0.92 for HuBERT-ECG in the roadmap and 0.549 in main.tex; 0.923 belongs to ECGFounder.
- The outline follows main.tex.

## Search limitations and gaps

- **Currency gate, not met:** 31 of 66 sources (47 percent) are from 2022 to 2026. The measures, effect sizes, bootstrap, HRV standards and datasets are foundational works with no recent replacement.
- **Indexes left out:**
  - OpenAlex and Semantic Scholar answered most calls with "HTTP 429 after 3 retries", so the search rested mainly on Crossref and arXiv.
  - Citation counts were not obtained for physionet2000 and vinh2010.
  - No abstract was obtained for hubertarabie1985, hrvstandards1996, hdbscan2013 and vinh2010, so their annotations carry [GAP] fields.
- **Excluded source:** Tarpey 2007 failed the rule for seminal works (88 citing works against the 100 required).
- **AI use:** config.md carries [GAP: tools and versions of earlier AI use], and every category is uncertain. This run used claude-opus-5-5 for research assistance and drafting assistance.

## Not done in this mode

outline-only writes no manuscript text and does not merge the 45 new entries into manuscript/refs.bib. Both are done by `/paper full` taking this run's outline, or by `/paper revision` for the referee comments.
