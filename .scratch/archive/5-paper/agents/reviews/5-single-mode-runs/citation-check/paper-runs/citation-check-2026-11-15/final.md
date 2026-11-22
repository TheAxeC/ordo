# Citation check of manuscript/main.tex: final message

The citation check ran to the end. It changed three `refs.bib` entries and left `main.tex` unchanged. Ten claims are not held by what the run could read of their sources, and two references have a year no record confirms. All twelve are open for the author. By the user's instruction, the stops were taken with the session's recommendation and recorded in `config.md` under "Decisions". The recommendation was to leave the text unchanged and list each item here, since the session holds no evidence and an override would mark a finding as resolved when it is not.

## Changed in the manuscript

`manuscript/refs.bib`, patch 02 (check-only and apply exit 0; `cmp` exit 0; `shasum -a 256` equal to the apply report's `output_sha256`):

- C1, wavelettensorecg2018: the authors become He, Hong; Tan, Yonghong; Xing, Jianfeng, as in the Crossref record.
- C2, hdbscan2013: the DOI loses its escaped underscore and now resolves (`check-urls` went from 404 to 200).
- C3, fedavg2017: the first author becomes "McMahan, H. Brendan".

## Claims the sources do not hold (open for the author)

- C4, Introduction: "By its own statement it does not include a representation-wise comparison against hand-crafted features". The benchmark makes that statement about prior work, not about itself.
- C5, Related work: contrastive predictive coding (mehari2022ssl) is grouped with augmentation and invariance methods. The source sets it apart as latent forecasting.
- C31, Related work, the same sentence: "established the pretraining recipes that later foundation models scaled up". Neither CLOCS nor 3KG holds the claim.
- C6, Methods: the PTB-XL counts 21 799 records and 18 869 patients. The cited paper gives 21837 and 18885. Release 1.0.3 needs its own PhysioNet citation, and its identifier has to come from the author.
- C7 to C12: no full text could be read for hrvstandards1996, dechazal2004, hubertarabie1985, vinh2010, hdbscan2013 or mitbih2001. Each was fetched in both agent starts. Two points beyond that:
  - The vinh2010 abstract does not name AMI and recommends NID.
  - C12: a 2001 paper cannot name PhysioNet release 1.0.0.

Suggested wording for each is in `citation-report.md`, "Items flagged for review".

## References that cannot be confirmed (open for the author)

- C13, clocs2021: every record gives the year 2020, and none gives 2021 or pages 5606-5615.
- C15, fedavg2017: the records give 2016, and none confirms 2017 or pages 1273-1282.
- C14, threekg2021: pages 156-167 are in no record (MEDIUM, no stop).

## Other items for the author

- Reference checks still failing under mark-only: hrvstandards1996 and physionet2000 (403, DOI_MISMATCH). The report (C27) finds both DOIs correct. Crossref stores only the short title, and the publisher refuses automated requests.
- Facts only the author holds: the PhysioNet release identifiers (C6, C12, C22), the reference for the master's thesis (C30), the ORCIDs, and the proceedings years and pages (C13, C14, C15).
- Versions of one work to choose (C24, C32): fedavg2017, clocs2021 and threekg2021 were read in their arXiv versions, while the entries name the proceedings.
- C25: hubertecg2024's current Crossref title differs from the version read. C26: ecgfounder2024 has a peer-reviewed NEJM AI version.
- Wording drift with suggested rewording: C16 to C23. Citation density: C29, C30.
- Missing DOIs (C28): clocs2021, threekg2021, fedavg2017, vinh2010 and sklearn2011 have none, because PMLR and JMLR issue none.
- Sources matched only by a preprint server: ecgfounder2024.
- Venues not screened: the registry-only signs (DOAJ, COPE, Scopus Source List, Think. Check. Submit.) were not checked by the lookups. The record signs showed nothing for any venue.
- Unused entries: none (`cite-keys` printed nothing).
- Retractions: no Crossref notice for any source.

## Run folder

`paper-runs/citation-check-2026-11-15/`: `config.md`, `checks.md`, `citation-report.md`, `final.md`, and `patches/` holding `02-refs.bib.block-manifest.json`, `02-refs.bib.patch.json`, `02-refs.bib.patched` and `02-refs.bib.patched.apply-report.json`. The temporary folder of fetched texts has been removed.
