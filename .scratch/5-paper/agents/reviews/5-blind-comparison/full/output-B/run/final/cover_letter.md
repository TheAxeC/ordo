# Cover letter

[GAP-DATE]

Editor-in-Chief, Artificial Intelligence in Medicine

Dear Editor-in-Chief,

RE: Submission of manuscript entitled "An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead electrocardiogram and clinical risk factors"

We submit the enclosed manuscript, "An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead electrocardiogram and clinical risk factors", for consideration as an original research article in Artificial Intelligence in Medicine.

**What the paper addresses.** Deep learning models predict incident atrial fibrillation (AF) from a sinus-rhythm 12-lead electrocardiogram (ECG), but their evidence is not designed to be read and their explanations are seldom tested for faithfulness. The manuscript describes a block-term tensor network (BTTN) that projects a log-spectrogram tensor onto 12 learned frequency-by-lead blocks before a nonlinear stage trained under a Cox loss, and a variant, BTTN + clinical, that adds age, sex and seven ECG measurements as a linear term outside the block layer. The models are developed and internally validated on MIMIC-IV-ECG with hospital-coded outcomes, and five faithfulness analyses of the block signatures are specified.

**Key findings.** Of 151,941 eligible patients, 1,855 were one-year cases and 41,770 were controls. BTTN + clinical had the highest point AUROC of seven models, 0.7776 (95% CI 0.7664 to 0.7888), against 0.7597 (0.7488 to 0.7713) for a clinical model and 0.735 (0.7226 to 0.7469) for a convolutional neural network (CNN); ECG-only BTTN reached 0.7397 (0.7275 to 0.7517). Against the clinical model the CIs overlap, and the paired differences are not yet in the manuscript ([GAP-C4]). The BTTN + clinical survival model had a higher point AUROC than a clinical Cox model at all four horizons, reaching 0.745 against 0.731 at five years. Observed one-year AF was 0.55% in the lowest decile of BTTN + clinical risk and 11.4% in the highest. The results of the five faithfulness analyses are not yet in the manuscript ([GAP-FT1 to GAP-FT5]).

**Why this journal.** The manuscript concerns a machine-learning model for a clinical prediction task whose ECG evidence passes through readable frequency-by-lead block projections, and a protocol for testing whether that readable evidence follows the model's computation; this is work on artificial intelligence methods in medicine.

**Confirmations.** The authors confirm before sending:

- This manuscript has not been published previously and is not under consideration elsewhere.
- All authors have read and approved the final manuscript.
- The manuscript's Ethics statement gives the ethics approval or exemption and the data use agreements for MIMIC-IV-ECG and the MIMIC-IV hospital module; it is [GAP-ETH] until the authors fill it.
- The use of AI tools in preparing the manuscript is disclosed in its Declarations section.

Thank you for considering our submission.

Sincerely,

[GAP-AUTH: corresponding author name, affiliation, email address and ORCID]

## Before submission: open placeholders (remove this section from the letter that is sent)

The manuscript and this letter carry placeholders that the authors must fill, or resolve by the runs named, before submission. Locations are lines of `run/final/manuscript.tex`.

| Placeholder | Where | Filled by |
|---|---|---|
| [GAP-AUTH] | Title page (line 29); signature of this letter | Author list, order, affiliations, ORCID identifiers and corresponding-author contact. |
| [GAP-DATE] | This letter | Date of submission. |
| [GAP-TRIPOD] | Section 3.1 (line 106); Supplementary material (line 446) | The TRIPOD+AI checklist completed against the final manuscript. |
| [GAP-FIG1] | Figure 1 (line 138) | Rendering `run/figures/fig1_schematic.py` to `run/figures/fig1_schematic.pdf` and replacing the placeholder box with the figure. |
| [GAP-T1] | Section 4.1 (line 187); Table 1 (lines 211, 217); Limitations (line 424) | Descriptive statistics of age, sex and the seven ECG measurements by outcome in the one-year and survival cohort files. |
| [GAP-C4] | Sections 3.7, 4.2, 5.1, 5.5, 6 and Table 2 (lines 157, 234, 245 to 251, 257, 378, 416, 428) | Paired patient-bootstrap AUROC differences from a run of the one-year comparison that writes them to a committed results file. |
| [GAP-FT1] | Section 4.5 (line 337); Table 5 (line 345) | Control-probe AUROCs, CIs and recoveries on the ICD-coded comparison set. |
| [GAP-FT2] | Section 4.5 (line 338); Figure 4 (line 357) | Intervention curves on the ICD-coded comparison set. |
| [GAP-FT3] and [GAP-FT4] | Section 4.5 (lines 339, 340); Table 6 (line 349) | Block-structure ablation and block-count sweep on the ICD-coded comparison set. |
| [GAP-FT5] | Section 4.5 (line 341); Figure 3 (line 353); Section 5.3 (line 394) | Substrate map on the ICD-coded comparison set, read against P-wave duration, P-wave terminal force and fibrillatory-rate measures. |
| [GAP-FT1 to GAP-FT5] | Abstract (line 38); Sections 5.1, 5.3, 5.5, 6 (lines 378, 392, 418, 430) | The five faithfulness results above. |
| [GAP-X1] | Section 4.6 (lines 365, 368); Table 7 (line 371); Limitations (line 404); Supplementary material (line 446) | Cross-validated AUROCs and occlusion importances of the CODE-15 and PTB-XL analyses, written to a committed results file. |
| [GAP-REPO] | Data availability (line 434) | Public repository URL or archive DOI of the released code. |
| [GAP-ETH] | Ethics statement (line 436); this letter | Ethics approval or exemption, waiver of consent, de-identification and data use agreements. |
| [GAP-CREDIT] | Author contributions (line 438) | CRediT roles of each author. |
| [GAP-COI] | Conflicts of interest (line 440) | Each author's declaration of competing interests. |
| [GAP-FUND] | Funding (line 442) | Funders and grant numbers, or a statement that no specific funding was received. |
| [GAP-AIUSE] | Declaration of generative AI use (line 444) | The named authors' verification statement; see `run/final/ai_disclosure.md`. |

Other items open before submission:

- The covariate approximations stated in Section 5.5 (anchor age, unrecoded missing codes) remain until the clinical, fused and multi-horizon analyses are rerun.
- `run/final/manuscript.tex` has not been compiled; it needs `elsarticle.cls` and `vancouver.bst` on the TeX path.
