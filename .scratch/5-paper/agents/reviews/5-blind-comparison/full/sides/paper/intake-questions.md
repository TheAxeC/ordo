# The last message of turn 1, as it printed it

The run is waiting on you: I need your answers to the intake questions below before any agent starts.

Checks so far:
- **Configuration.** `.agents/plan.yaml` sets `reviewer: claude:opus`, `reviewer_effort: high` and `standards: []`. The runner lists the `ordo-high` agent, and `printenv CLAUDE_CODE_EFFORT_LEVEL` exited 1, so the variable is unset. The model is `claude-opus-5-5`.
- **Prose standard.** It is the `repo-setup` template, `templates/docs/dev/prose-standard.md`, because this repository has no `docs/dev/prose-standard.md`. All three `writing` pages exist.
- **Folders.** There was no `paper-runs/` folder, so there are no earlier runs and no earlier outputs to offer. I made `paper-runs/full-2026-11-14/` and an empty `manuscript/`, so there is no existing `main.tex`.
- **Materials read** (`cat` / `head`):
  - `RESULTS.md`, `code/README.md` and `notes/history/NOVELTY-AAAI-METHODS.md`;
  - the gold-label results in `code/results/`, including `table1_cis.csv`, `multihorizon_icd_spectral.csv` and `cohort_flow.txt`.

## Intake questions

Each line gives my proposed answer. Confirm it or change it.

1. **Topic.** An interpretable Block-Term Tensor Network (BTTN) that predicts incident atrial fibrillation from one sinus-rhythm 12-lead ECG plus clinical risk factors. Source: `code/README.md`.
2. **Research question.** The pipeline won't start without one. Proposed: "Can a model whose ECG evidence passes through readable frequency-and-lead block signatures, fused with age, sex and ECG intervals, predict incident AF in MIMIC-IV-ECG more accurately than a clinical risk-factor model and a black-box CNN, with a measured faithfulness of those signatures?" Confirm or rewrite it.
3. **Paper type.** IMRaD. It decides because the project analyses its own data and results. Typical length is 5,000<en dash>8,000 words.
4. **Discipline.** Biomedical informatics, specifically ECG-based machine learning for cardiovascular risk prediction.
5. **Language.** English.
6. **Venue.** `code/README.md` names *Artificial Intelligence in Medicine*, but `RESULTS.md` mentions J-BHI. Which one?
7. **Venue AI policy.** Neither journal is in the skill's list of venue policies. Paste the policy text, or answer "no venue yet" to use the generic statement.
8. **Venue limits.** Word limit, abstract limit, keyword range, required sections, reference ceiling, and whether review is single-blind or double-blind. Any limit you don't state is recorded as "not stated". If review is double-blind, the run also writes an anonymous submission copy.
9. **Cover letter.** All parts are optional: article type (Research Article, Review Article or Brief Communication), the editor's name, one sentence on why the paper fits the journal, and suggested and excluded reviewers with reasons.
10. **Citation style.** Proposed: Vancouver (numbered, medicine) or IEEE (numbered, engineering). The general default is APA 7th. Which one?
11. **Length.** Default 6,500 words.
12. **Materials in hand.** Proposed:
    - Held: data or results (`code/results/` and `RESULTS.md`).
    - Not held: a research question, a literature list or `.bib`, existing draft sections, reviewer feedback, and a venue template.
    - Uncertain: does `notes/history/NOVELTY-AAAI-METHODS.md` count as a research report, so that the literature strategist screens its prior-art sources?
13. **Literature search.** Proposed: no, the search is not skipped.
14. **Evidence profile.** `cs_ml`, or `unknown_user_defined` (the default). A `clinical` profile is reserved and not built yet; asking for it records `unknown_user_defined (requested: clinical)`.
15. **DOI checking.** Proposed: mark-only (the default) or strict.
16. **Authors.** The sources disagree: `code/README.md` says "Faes and Peeters", while `code/LICENSE` says "Dries Cornelissen and Axel Faes". For each author, give the name, affiliation, ORCID and whether they are the corresponding author.
17. **Contributions.** The CRediT roles for each author, each marked Lead or Supporting.
18. **Funding.** Each funder with its grant number, or "no funding".
19. **Conflicts of interest.** Each conflict, or "none".
20. **Data availability.** Proposed: restricted. MIMIC-IV-ECG and the MIMIC-IV hospital module are under the PhysioNet credentialed DUA, and CODE-15 and PTB-XL are public. The code is open under MIT. Give the repository URL or DOI if you have one.
21. **Human or patient data.** Yes: de-identified MIMIC-IV data. I need the approving board, approval number, consent and de-identification wording you want stated, or "[GAP]".
22. **AI use.** Mark each of these used, not used or uncertain, with tools and versions: research, drafting, revision, editing, analysis, and peer-review simulation. This run itself will use Claude Opus (`claude-opus-5-5`) for research, drafting, review and figures.
23. **Responsible-use or reproducibility statement.** Wanted? Yes or no for each.
24. **Style profile.** Past papers or writing samples help the agents match your voice. Three or more work best, and this is optional.
25. **Claims not to make.** Proposed from `RESULTS.md`:
    - (a) no number from the provisional ECG-report labels;
    - (b) no rising risk trajectory toward onset;
    - (c) no PTB-XL AF-in-sinus-rhythm result;
    - (d) no claim that the block-term structure is needed for accuracy;
    - (e) no claim of AF detection as incident prediction.

    Add, remove or confirm.
26. **Earlier papers.** Papers whose passages this one may repeat (path, DOI or citation), or "none".
27. **Internal only.** Proposed: no, the manuscript is for publication.

After you answer, I'll write `config.md` in `paper-runs/full-2026-11-14/` and show it to you whole for confirmation. The literature strategist starts only after you confirm it.
