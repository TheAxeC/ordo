**Verdict: version B is better, and the difference for a reader is small.** B is the more accurate manuscript. Its one material fix is saying that the CNN gets no covariates. Its other changes are better hedging, defined terms, consistent tense and structure that puts the main point first. It has three small losses, none of which makes a statement false.

I compared the two `main.tex` files section by section and checked the claims that only B makes against `code/`, `RESULTS.md` and `pages/`. Most saved cited pages hold only the article title, not its text. So the STROKESTOP endpoint and the P-wave cut-offs could not be checked against the cited pages; I mark them below.

## Differences where B states something more accurately

- **CNN comparison** (abstract; Results `version-B/main.tex:204`; Principal findings :376; Conclusion :422). B adds that the CNN receives no covariates, "so the gap may reflect the nine covariates as well as the network." `code/core/cnn.py` (SmallCNN, `cnn_fold(Xtr, ytr, Xte)`) takes only the tensor, which confirms it. A compares the BTTN with clinical risk factors against the CNN without saying this, so a reader could credit the network for a gap that the covariates may explain. This is the largest accuracy gain.
- **Linear BTTR** (:204). A says the head and convolutions "thus add discrimination." B says the difference "suggests" this, noting the two models also differ in fitting and loss. BTTR is fitted by its own algorithm, so B is the more accurate.
- **Energy normalisation** (:316). A says it "removes the bias" toward QRS. B says it "is intended to offset" the larger energy removed. A's claim is stronger than any analysis shows.
- **Survival design** (Discussion :386). B says it addresses "part of" the case-control concern, and adds that the survival cohort was itself sampled (caps of 4,000 and 16,000, which both Methods sections state). A's wording implies the concern is fully answered.
- **Deletion test without retraining** (Limitations :417). B adds that part of each drop may reflect inputs outside the training distribution. This is a standard caveat for deletion tests, and it is correct.
- **Faithfulness in ECG work** (Related work :84). A's general claim ("asserted by design more often than it is measured") is replaced by two specific, cited statements: Wagner et al. used sanity checks, and ProtoECGNet presents its explanations as faithful by design. This is more precise.
- **What the architecture guarantees** (Discussion :394). B says that every ECG effect passing through the block factors "follows from the architecture, and neither test measures it." This states the limit of the tests more plainly than A's "the architecture places every such effect on the block factors."
- **Transfer** (Limitations :403). B says the transfer analyses "suggest" the method transfers; A says they "show" it. For one AF task with labels per recording, B's word is the right one.
- **AF-in-sinus-rhythm label** (Methods :167). B defines it: a recording without AF is positive if the same patient has an AF recording. `code/experiments/external_code15.py` lines 11 and 38 confirm this. A never defines the task. "In that task" has a loose antecedent, but the meaning is clear.

## Differences where B adds correct definitions or detail

- **STROKESTOP endpoint** (:50). B names the composite endpoint. It matches my reading of the trial; the saved page holds only the title, so it is not verified from the cited page.
- **C-statistic** gloss, cited to Harrell 1996, and the **CHARGE-AF acronym** (:54). Both are correct.
- **Definition of faithfulness**, cited to Alvarez-Melis and Jaakkola (:67). It is consistent with that paper, which sets faithfulness as a desideratum.
- **P-wave durations** "89 ms or less and 130 ms or more" (:74), in place of A's "very short and very long." This is more precise and matches my reading of Nielsen et al.; the saved page holds only the title, so it is not verified from the cited page.
- **"FactorECG"** named where it first appears (:80). A uses the name later in its Discussion without ever introducing it, so B fixes that inconsistency.
- **"Label-blind layer"** introduced in the probe Methods (:155). It now matches the table row; A uses the term in Results without introducing it.
- **Occlusion importance** defined where it is first used, in the deletion test. B also uses "beat-aligned saliency" every time, where A alternates between "beat saliency" and "beat-aligned occlusion saliency."
- **"ECG-AI model"** replaces A's one-off "AI-ECG" (:76), matching the term used elsewhere.

## Differences that change only readability

- **Topic sentences first**: the stroke-prevention aim opens the Introduction; the ECG-adds-to-clinical-factors point opens its paragraph; the "two scores or pooled features" point opens its Related-work paragraph; and the block-structure finding comes before its numbers. Each reads better for a referee.
- **RQ1** is split into three questions. It was one long sentence with three parts, so this is clearer.
- **Results** are in the past tense throughout, and "we report no paired test" is in the active voice. This is more consistent.
- **Section-pointer sentences** ("Section 2 reviews<horizontal ellipsis>", "Section 3 describes<horizontal ellipsis>") are removed. This is more concise with nothing lost.
- **Reporting paragraph** is broken up: the TRIPOD+AI statement moves to Data sources and the no-paired-test statement to the one-year comparison. Both now sit where a reader looks for them.
- **Calibration results** come before the operating points, the frequency, lead and cardiac-phase paragraphs are merged, and the Limitations list six items as bullets. These are neutral to slightly better.
- **Conclusion** now opens with what the study contributes. It is better, except that "Without a paired test, its interval lay above<horizontal ellipsis>" is clumsier than A's wording.
- **AI-use declaration** has small rewording ("task-specific agents", "saved results"). This is negligible.

## Differences where A is better

- **Abstract outcome**: A's "defined from ICD-coded hospital admissions" tells the reader where the labels come from. B's "taken from ICD-coded AF labels" uses a term the abstract never defines and drops "hospital admissions."
- **ECG pathway**: A says the pathway "has the same structure" with and without the clinical term. B's Methods say "the ECG pathway was the same," which is looser, since the weights differ. B's next sentence and its Limitations repair this.
- **Discussion of the clinical model**: B drops A's note that the clinical model also differs in loss and imputation. The note is still in B's Results.
- **Removed repetitions**: B removes three restatements. Two are still stated elsewhere: "counts overlap" is in the Table 1 caption, and "map from one split" is in Methods and Limitations. The figure-1 phrase "does not pass through the block layer" is not covered elsewhere in the same way. Each removal costs a reader little.

## Verdict

B is better. Its changes fix one real overstatement (the CNN gap credited to the network), make several hedges more accurate, define terms where they first appear, and improve the order and consistency of the prose. A is better only in the abstract's outcome definition and two small points of precision. No result changes and no conclusion reverses, so I judge the difference for a reader to be small. The CNN caveat is the one change a referee would likely have raised against A.
