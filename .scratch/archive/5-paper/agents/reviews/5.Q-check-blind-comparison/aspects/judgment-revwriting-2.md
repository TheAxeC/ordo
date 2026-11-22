**Verdict: B is better, and the difference is large for a referee.** Neither version changes a result. B fixes several statements that A gets slightly wrong and cuts A's repeated passages. I found one place where B is a little less accurate than A.

I read both `main.tex` files in full, the referee comments (`input/admin/reviews/reviewer-comments.md`), `core/data.py`, `core/cluster_eval.py`, `experiments/fed_cluster.py`, and searched `results/results_raw.csv`. Every number that appears in both versions is the same. B is the version after the editing pass.

## Differences, in manuscript order

1. **Abstract.** B gives numbers where A only says "far better": MIT-BIH 0.783 against at most 0.127 and 0.049, and the scaler effect 0.63 against 0.23. B also writes "clustering algorithm" where A says "algorithm". All values match the text and tables. **B reads better**: more precise for the same length. Neither is less accurate.

2. **Introduction, first paragraph.** A opens with "We observe that most machine-learning work on the ECG is supervised", a claim with no support. B drops it and joins the master's-project paragraph to the opening. **B is better**: it removes an unsupported claim.

3. **Introduction and Related work: the closest benchmark.** A describes \cite{lookingbeyond2026} three times: in the Introduction, in a separate "Closest benchmark" paragraph in Related work, and again in the Discussion, each with the same list of additions. B merges this into the Introduction once, and the Discussion points back to it. B also gives a reason for each addition: hand-crafted features because each has a clinical meaning, and MIT-BIH because its beat annotations give a morphology task. A's reasons are "we regard ... the interpretable default" and "the canonical morphology benchmark". **B is better**: more concise, with reasons a reader can check. Neither is less accurate.

4. **"it is expected that" becomes "we expected".** **B is better**: it is clearer who expected it.

5. **Result item 2.** A says conditioning "changes the result by a wide margin". B gives the figures (0.63 to 0.23, and 0.87 to 0.09). **B is more precise.**

6. **Result item 4 (MIT-BIH).** B says "a separate set of 21" features and gives the ARIs. A's "hand-crafted features again" suggests the same 16 features were reused, but they were not. **B is more accurate.**

7. **Related work: autoencoders.** A asserts that reconstruction autoencoders are "strong compressors but weak organizers of class geometry", with no citation. B says the question is empirical and that Section 4 tests it. **B is more accurate**, and this is what R3.8 asks for.

8. **Related work: chance-corrected indices.** A says the indices are "near zero for such trivial solutions". B says they "equal 0" for a one-cluster solution and have expected value 0 for random labels. From the formulas, both ARI and AMI are exactly 0 for one cluster. **B is more accurate.**

9. **Methods: data format.** This is the one place where B is slightly less accurate.
   - A: each record "is read from its WFDB files ... and is held as 32-bit floating-point values".
   - B: "distributed in the WFDB format: ... stored as single-precision floating-point values".
   - B's wording suggests the files themselves hold float32 values. In fact the code converts on reading: `data.py:68` casts with `sig.astype(np.float32)` and `data.py:104` with `p_signal.astype(np.float32)`.
   - B's MIT-BIH sentence also drops "read from its WFDB files".
   - This is the point R2.1a raised. **A is more accurate here**, though the loss is small.

10. **Methods: tense.** B moves Methods and Results to the past tense. A uses the present throughout. B is mostly consistent but not entirely ("Every representation is a matrix", "reproduces"). **This is a small register improvement in B.**

11. **Methods: list formatting.** B moves the Lead II limitation sentence into the hand-crafted bullet. It also turns the 16-feature list and the 21-feature list into sub-lists, and puts the AF-definition principle before the list. **B is clearer**, and the content is the same.

12. **Methods: the conv-AE "principle" sentence.** A has "Its principle is ..."; B has "The design aims at ...". Wording only. **The difference is negligible.**

13. **Methods: definitions B adds.**
    - Ward linkage.
    - All four scalers. B's definitions match `cluster_eval.py:35-38`: `PowerTransformer` standardizes by default, `RobustScaler` uses the median and IQR, and `QuantileTransformer` has normal output.
    - A Lloyd iteration.
    - "After the last round" for the final assignment, which matches `fed_cluster.py:87`. A's "then" could be read as an assignment after every round.

    **B is more precise in each case**, and this answers R2.3 and R3.7.

14. **Results 4.1.** B's changes:
    - "at most 0.013 and 0.008" replaces "near 0".
    - It states that the algorithms were untuned.
    - It moves the HDBSCAN and spectral text up into this subsection.
    - A states as a fact that spectral clustering "collapses where the nearest-neighbor affinity graph is poorly connected". B names the case (0.016 against 0.174 on HuBERT-ECG) and says the connectivity was not measured.

    **B is more accurate**, because nothing in the input measures connectivity.

15. **"Stay near chance" becomes "stayed at chance level".** Roughly equal. B's wording is a little stronger, given raw-flattening GMM at 0.013. **The difference is negligible.**

16. **The conv-AE explanation.** A gives the energy-preservation reason as fact. B says "A likely reason, for this one architecture and training setup". **B is more accurate.**

17. **Section 4.2.**
    - A says raw flattening carries "almost no label information", but its own last sentence in the same paragraph reports a random forest at 0.71. B says "almost no linearly decodable label information", which removes the contradiction.
    - A says the information "does not lie along their dominant axes", as if it had been measured. B says the pattern is "consistent with" \cite{sslclustering2025} and that this study did not measure where the information lies.

    **B is more accurate on both points.**

18. **Section titles.** "Separability is not clusterability", "The silhouette trap" and "Conditioning matters" become descriptive titles, and the figure captions lose their slogan openings. **B's register suits a journal better.**

19. **Silhouette numbers.** A says "every point but a handful" falls into one cluster. In `results_raw.csv` line 12, `largest_cluster_frac` is 0.9996066 = 2541/2542, so exactly one record lies outside. B writes "0.9996 of the records". **B is more accurate.**

20. **Scaler section.**
    - A justifies robust scaling with "in our experience a common default", which is unsupported. B explains the mechanism (median and IQR) and says outliers "may" collapse the partition.
    - B also replaces "conditioning" with "the scaler", so one term is used throughout.

    **B is better** on accuracy and on consistency of terms.

21. **MIT-BIH.**
    - B uses "raw beat window" everywhere; A alternates between "raw beat" and "raw beat window".
    - B uses "Clustering algorithm" as the column header; A uses "Clusterer".
    - B's caption says the agglomerative values come from one clustering "since the algorithm is deterministic".

    **B is more consistent.**

22. **Imbalance paragraph.** A says the ARI falls "because isolating a 10% minority cluster ... is intrinsically hard", a causal claim that nothing tests. A also repeats "the lead does not hold". B states only the drop. **B is more accurate and more concise.**

23. **Federation paragraph.** B adds "Under this simulated label skew". It drops A's closing summary, which repeated the point and added "which matters where a single federated clustering must be trusted". **B is more concise**, and neither is less accurate.

24. **Discussion.**
    - B merges paragraphs.
    - B gives the 9:1 result with its numbers and "tested on one subsample".
    - B drops "in our judgment both recur in applied clustering".
    - B adds that the gap between the conv-AE and the hand-crafted features held for both tasks.
    - B's "the better choice" is slightly prescriptive, but it is limited to the one subsample.

    **B is better**: tighter, and more in line with R3.8.

25. **Limitations.**
    - B adds "so on this subset the upsampling did not lower its ARI". This is correct, since 0.909 is above 0.896.
    - B adds a paragraph that limits the conv-AE result to one architecture and the algorithm comparison to untuned algorithms.
    - B replaces "the canonical morphology contrast" with "two beat classes that differ in morphology".

    **B is more accurate in scope.**

26. **Conclusion.**
    - A says raw flattening and the conv-AE "stay near chance with every clustering method tested", with no dataset named. That is not true on MIT-BIH, where the conv-AE reaches up to 0.127 and the raw beat window 0.049. B adds "on PTB-XL".
    - B drops A's broad closing sentence about "label-free ECG analysis".

    **B is more accurate.**

## Verdict

**B is better.** For a referee the difference is large, even though it is mostly local edits.

- **Accuracy:** B corrects or limits about ten statements that A states too strongly or slightly wrongly: "a handful", "near zero", the raw-flattening contradiction, the claims about spectral clustering, imbalance and autoencoders, and the conclusion with no dataset named.
- **Concision:** B removes A's three repeated descriptions of the closest benchmark.
- **Referee points:** several of B's changes answer R3.8 (limit the claims), R3.7 (implementation detail) and R2.3 (metric definitions) directly.
- **Where A is better:** only the description of the WFDB data type (item 9), which is small and easy to fix.

I judge the size as large because a referee checking R3.8 would find A still making several of the broad claims they asked to have limited. If you read the paper only for its results, the difference would be small, since every number is the same in both versions.
