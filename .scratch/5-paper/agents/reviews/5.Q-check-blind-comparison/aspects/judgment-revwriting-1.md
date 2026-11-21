**Verdict: Version A is better, and the difference is large for this revision's referees.** It is moderate for a general journal reader. Most of the edits that differ between the versions make A's claims more accurate, not just smoother. In almost every place, B makes a causal or general statement that the study does not support, or gives a vague value where A gives the measured one. B reads better in only three small places.

I compared the full text of both versions and checked the disputed facts against the code and result files under `input/` and the referee comments in `input/admin/reviews/reviewer-comments.md`.

## Accuracy: where one version states something less truly

1. **Autoencoders (Related work).** B says "Reconstruction autoencoders optimize signal energy rather than class structure, which makes them strong compressors but weak organizers of class geometry". That is stated as a general fact with no citation, before the study tests it. A says the autoencoder uses no class label, so whether its code groups by class "is an empirical question, which Section 3 tests". A is more accurate.

2. **Spectral clustering.** B says "Spectral clustering collapses where the nearest-neighbor affinity graph is poorly connected". The code never measures this. A gives the values (0.016 on HuBERT-ECG against 0.174 with k-means), says a poorly connected graph "may cause this drop", and says the connectivity "was not measured". A is more accurate.

3. **Imbalance.** B says the ARI falls "because isolating a 10% minority cluster with a partitional method is intrinsically hard". That is an untested cause, and it does not fit the result: the hand-crafted features do isolate the minority partly (ARI 0.232). A states only that the ARI was lower. A is more accurate.

4. **Robust scaling.** B says "in our experience a common default for physiological signals", which has no support, and states the collapse mechanism as fact. A defines robust scaling and says outliers "may then dominate" the distance. `cluster_eval.py:29-33` gives the same mechanism only as a code comment. A is more accurate.

5. **Silhouette case.** B says "every point but a handful". `results_raw.csv:12` gives a largest-cluster fraction of 0.9996066. Times 2542 records, that is 2541, so exactly one record lies outside the large cluster. A's "0.9996 of the records (largest-cluster fraction 1.00 at two decimals)" is exact. B's is loose.

6. **Raw flattening information.** In Section 3.2, B says raw flattening "carries almost no label information". A says "almost no linearly decodable label information". B contradicts its own later sentence that a random forest reaches 0.71 on the same input. A is consistent.

7. **Separability versus clusterability.** B says the discriminative information "does not lie along their dominant axes of variation, which is the effect described in [sslclustering2025]". It also says "the conv-AE encodes the class without organizing it", which overstates a ceiling of 0.678. A says the pattern "is consistent with" the effect and that "this study did not measure where the information lies". This is Reviewer 2's point 5. A is more accurate.

8. **Conv-AE cause (Section 3.1).** B says "Its reconstruction objective rewards preserving signal energy" as fact. A frames it as "A likely reason, for this one architecture and training setup". A matches the evidence and Reviewer 3's point 8.

9. **Conclusion.** B says "Raw flattening and the conv-AE stay near chance with every clustering method tested", with no dataset named. On MIT-BIH, the conv-AE has a mean ARI of up to 0.127 and per-seed values up to 0.407, so B's sentence is false as written. A limits it to "on PTB-XL". A is more accurate.

10. **"Near 0" against the measured maxima.** In the abstract, the Results and the Discussion, B writes "ARI near 0" where A gives "at most 0.013 and 0.008". The abstract is where the difference shows most. B's MIT-BIH sentence ("again cluster far better") and its scaler sentence ("changes the outcome") give no values. A gives 0.783 against 0.127 and 0.049, and 0.63 against 0.23. A is more precise.

11. **Chance-corrected metrics (Related work).** B says they are "near zero for such trivial solutions". The ARI and AMI of a one-cluster solution are exactly 0. A says they "equal 0 for such a one-cluster solution and have expected value 0 for random labels". A is exact.

12. **Federated procedure.** B says "Each record is then assigned to its nearest global centroid". That could be read as happening every round. `fed_cluster.py:87-88` does this once, after the loop. A says "After the last round" and defines a Lloyd iteration. A also says "power scaling", and sklearn's PowerTransformer standardizes by default, which matches A's definition "Yeo-Johnson followed by standardization". A is more accurate.

13. **Unsupported framing B adds and A removes:**
    - "We observe that most machine-learning work on the ECG is supervised"
    - "proper chance-corrected metrics"
    - hand-crafted features as "the interpretable default" and MIT-BIH as "the canonical morphology benchmark" (B, Introduction)
    - "the canonical morphology contrast" (B, Limitations)
    - "in our judgment both recur in applied clustering"
    - "which matters where a single federated clustering must be trusted"
    - the closing line of the Conclusion, "the representation and the evaluation protocol are the deciding choices"

    Each is an opinion or slogan that the study does not show. Reviewer 3's point 8 asks for exactly this kind of claim to be limited.

14. **Qualifiers only A has:**
    - Section 3.1 says the representation was the deciding factor "with the clustering algorithms at the settings of Section 2.3 and otherwise untuned".
    - The Limitations have a paragraph saying the conv-AE result and the spread across algorithms hold only for the configurations tested, and that tuning could change the balance.
    - The ECGFounder upsampling check adds "so on this subset the upsampling did not lower its ARI".

    These match the code (one conv-AE, default settings) and answer Reviewer 3's points 7 and 8.

15. **The one accuracy point that goes to B.** In the Discussion, A writes "Under 9:1 imbalance, tested on one subsample, the hand-crafted features are the better choice". That draws a recommendation from one subsample and one seed. B's "On the 9:1 subsample the 16 hand-crafted features cluster better than ECGFounder" states only what was measured.

16. **Federated lead.** B writes "keeps a narrow lead" (0.612 against 0.591). A writes "has the higher mean ARI". With an SD of 0.350, A's wording claims less and is the safer of the two. This is a small difference.

## Clarity, consistency and register

- **Terms.** A keeps the same names throughout: "clustering algorithm", "feature scaler", "ranking" and "raw beat window". B switches between "clusterer", "clustering method" and "algorithm"; between "conditioning", "scaler" and "power transform"; between "ordering" and "ranking"; and between "raw beat" and "raw beat window". Reviewer 3's point 9 asks for consistent terminology, so A is better here.
- **Headings and figure captions.** B uses editorial titles: "Separability is not clusterability", "The silhouette trap" and "Conditioning matters", and repeats them as caption openers. A uses descriptive titles ("Supervised ceiling and clustering ARI", "Effect of the feature scaler"). A's register suits a journal better.
- **Structure.** B states the closest-benchmark comparison three times: in the Introduction, in a separate "Closest benchmark" paragraph in Related work, and in the Discussion. A states it in full once and refers back to it.
  - B places "The hand-crafted features therefore see one of the twelve leads" after the foundation-model bullet, far from the Lead II sentence it follows from. A keeps it next to that sentence.
  - A puts the 16 hand-crafted features and the 21 beat features in grouped lists, and adds "The five PTB-XL representations are:" to explain why four families give five rows.
  - A defines Ward linkage and each of the four scalers, which helps with Reviewer 2's point 3 and Reviewer 3's point 7.
- **Tense and register.** A uses the past tense for Methods and Results throughout. B uses the present tense, which is also correct. A uses "we expected" where B uses the impersonal "it is expected", and A's "the design aims at" reads more naturally than B's "its principle is". Table captions in A say "one clustering each" where B says "single deterministic runs". Both are clear.
- **Where B reads better:**
  - B splits the opening of the Introduction into separate paragraphs. A merges the master's-project history into the first paragraph, which makes it long.
  - B's abstract is shorter. A's abstract packs in more numbers, which makes it heavy to read but more informative.
  - The 9:1 Discussion wording covered in point 15.
- **Data description (Reviewer 2's point 1a).** Both versions answer the data-type question, and `data.py:68,104` confirms the float32 cast. Neither is more accurate here. B's "read from its WFDB files" and A's "distributed in the WFDB format" are equally clear.

## Size

For the referees, the gap is large. Reviewers 2 and 3 asked for justified explanations, claims limited to what was tested, and consistent terms. B gives untested causes and unsupported general statements in places where A gives hedged readings backed by numbers. For a general reader the results are the same in both versions, so the difference there is moderate, mainly the more exact abstract and the cleaner terminology.
