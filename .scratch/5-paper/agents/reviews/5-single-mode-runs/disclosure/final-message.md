The six statements of `manuscript/main.tex` have been rewritten from your intake answers, and the run is finished. Nothing was committed.

**What was done**
- **Intake:** your answers are recorded in `config.md` and taken as the confirmed record, as you instructed. Under "Decisions" it records one choice made in your place. You marked every AI-use category uncertain and asked me to record this run's own use, so drafting assistance is marked used for this run only, and every earlier use stays uncertain.
- **Draft writer:** it ran once as `ordo-high`. Its transcript shows it was served `claude-opus-5-5`, the model your configuration names.
- **The patch:** it changed 5 of the 81 text blocks of `main.tex`. The apply script found no structural change. The patched file matches `main.tex` exactly, and its checksum matches the one in the apply report. `git diff --stat` shows `main.tex` as the only changed tracked file, with all changes inside the statements after the conclusion.
- **Statements:** data availability, ethics, CRediT contributions, funding and the AI declaration were rewritten. The competing-interest declaration is unchanged, because the no-conflict wording is identical to what was already there.
- **AI declaration:** it keeps "a generative AI assistant (Claude) ... to support software implementation". It adds that Claude (model `claude-opus-5-5`) drafted these statements, that the authors take full responsibility, and that Claude is not an author.
- **Compile:** I also compiled a temporary copy with `latexmk -pdf`, the pdfLaTeX engine Elsevier's class uses, and it built without errors. It reports four overfull lines at `main.tex` lines 424 to 754, in body text this run did not touch.

**What you need to settle before submission**
- **Language editing:** the old declaration said Claude was used "to edit and improve the language of the manuscript". You marked editing assistance uncertain, so the new statement no longer claims it and has a placeholder there instead. If the editing did happen, confirm it and the placeholder becomes a stated use.
- **Journal AI policy:** this was not checked. The skill has no policy on file for Biomedical Signal Processing and Control and none was pasted, so the generic statement is used. Its placement and heading should be checked against the journal's guide for authors.
- **Placeholders in the manuscript (16, counted with `grep`):**
  - the PhysioNet links or DOIs for the PTB-XL 1.0.3 and MIT-BIH 1.0.0 database versions;
  - the code DOI or release tag;
  - the ethics approval and consent of the studies that originally collected the two databases;
  - any added CRediT role, and the equal-contribution declaration;
  - the FAIR grant number, any other funder, and the funder's role in the study;
  - the earlier AI tools and their versions;
  - the six AI-use categories.
- **Placeholders kept only in `disclosure.md` (3):** the two ORCIDs and the Lead or Supporting mark for each CRediT role.
- **Possibly missing CRediT roles:** the draft writer judged that no author is credited with formal analysis, visualization or funding acquisition, although the paper reports statistics and figures and is funded. The statements assign none of these roles.

Every change the draft writer wrote was applied.

Files are in `paper-runs/disclosure-2026-11-15/`:
- `config.md`
- `disclosure.md` (the AI-use marks, author table, CRediT table, funding details and the full list of placeholders)
- `final.md`
- `patches/`
