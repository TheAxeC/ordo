The citation check is finished, but it leaves 12 items for you to resolve:

- 10 cited claims that the run could not find in their sources.
- 2 references whose year no record confirms.

`refs.bib` is corrected in three entries. `main.tex` is unchanged.

As you instructed, I did not stop at the run's two decision points, one for unsupported claims and one for unconfirmed references. For both I took the same choice: leave the text as it is and list every item for you. The other options were supplying evidence, which needs facts only you have; rewriting your argument, which no role does in a citation check; or overriding, which would mark a claim supported when the run found it unsupported. The choices and reasons are written in `config.md` under "Decisions".

**How it ran.** The citation agent ran twice on `claude-opus-5-5` at high effort; the model is confirmed in each agent's run record.
- The first start looked up all 21 references and judged 43 cited claims, each against a passage it read and copied. It also wrote the `.bib` patch.
- The second start reran the lookups that had failed because some indexes refused requests (HTTP 429). After it, `quote-check` found all 41 copied passages in the fetched texts (exit 0), and `cite-keys` printed nothing (exit 0).

**Changed in `manuscript/refs.bib`.** The patch applied cleanly, and the file matches the patched output (`cmp` exit 0, checksum equal to the apply report):
- wavelettensorecg2018: the authors' given names now match the Crossref record.
- hdbscan2013: the DOI had an escaped underscore and now resolves; its check went from 404 to 200.
- fedavg2017: the first author is now "McMahan, H. Brendan".

**Claims the sources do not hold:**
- **C4, Introduction:** "By its own statement it does not include..." The benchmark says this about earlier work, not about itself.
- **C5, Related work:** contrastive predictive coding is grouped with augmentation-based methods. Its own paper describes it as a different, forecasting approach.
- **C31, same sentence:** the claim that CLOCS and 3KG "established the pretraining recipes" later foundation models scaled up. Neither source says this.
- **C6, Methods:** the PTB-XL counts 21 799 records and 18 869 patients. The cited paper gives 21837 and 18885. Release 1.0.3 needs its own PhysioNet citation.
- **C7 to C12:** six sources had no readable full text after two fetches each: hrvstandards1996, dechazal2004, hubertarabie1985, vinh2010, hdbscan2013 and mitbih2001. The vinh2010 abstract does not name AMI at all.

`citation-report.md` has suggested wording for each.

**References that cannot be confirmed:**
- **clocs2021 (C13):** every record says 2020, not 2021, and none gives the pages.
- **fedavg2017 (C15):** every record says 2016, not 2017, and none gives the pages.
- **threekg2021 (C14):** only the pages are unconfirmed.

**Other open items:**
- hrvstandards1996 and physionet2000 still fail the link check (403, title mismatch). The report finds both DOIs correct: the mismatch comes from Crossref storing only a short title, and the publisher refuses automated requests.
- Facts only you have: the PhysioNet release identifiers, the reference for the master's thesis, the ORCIDs, and the proceedings years and pages.
- Which version to cite for fedavg2017, clocs2021 and threekg2021: the passages were read in the arXiv versions, but the entries name the proceedings.
- ecgfounder2024 now has a peer-reviewed NEJM AI version.
- hubertecg2024's title in Crossref has changed since the version that was read.
- Wording that goes slightly beyond its source (C16 to C23), and two paragraphs with no citation (C29, C30).

Five entries have no DOI because those venues issue none. The publisher-registry checks for questionable journals were not run. No source has a retraction notice in Crossref.

Files are in `paper-runs/citation-check-2026-11-15/`:
- `final.md`
- `citation-report.md`
- `config.md`
- `checks.md`
- `patches/`
