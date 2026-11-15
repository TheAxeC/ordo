# Where the revision faults of step 5 came from

The `paper` side of step 5's revision comparison, copy `gate5/revision-1`, run folder `paper-runs/revision-2026-11-15/`. Each fault the two judges found is traced to the patch that wrote it, by counting the passage in the input (`git show c973f16:manuscript/main.tex`) and in each patched `main.tex` (`patches/02`, `09`, `14`, `15`, `18`; `18-main.tex.patched` equals the final `manuscript/main.tex`, `cmp`), and to the checks that ran after that patch, by `grep` of `items.md`, `citation-report.md` and `checks.md`.

The order of the run: patch 02 (draft writer, main pass), citation compliance, reading 1, patch 09 (draft writer, what reading 1 left), reading 2, patch 14, the closing `/writing` review, patch 15 (draft writer, the autonomous pass on the `/writing` findings), patch 18 (compile fix).

| Fault (final `main.tex`) | Written by | Checks after it | What those checks did |
|---|---|---|---|
| Line 276, "The raw beat window did not (ARI at most 0.049)"; `results_mitbih.csv:33` gives raw-beat HDBSCAN 0.107, and the MIT-BIH table holds only k-means, Ward and GMM | patch 02 | citation compliance, reading 1, reading 2 | Readings 1 and 2 quote the line (`items.md:562`, `:782`) as evidence for an item on decimals and do not check the number against the saved results |
| Line 94, "We chose the two foundation models by three criteria" | patch 02 | citation compliance, reading 1, reading 2 | Readings 1 and 2 quote it (`items.md:519`, `:725`) as evidence that R3-4 is resolved. The judges differ on it: judge 1 finds the reason grounded in `arm_ecgfounder.py:3-4`, judge 2 finds it made up |
| Line 332, "ECG-CPC \cite{Lunelli_2026}"; the Lunelli page never mentions CPC, and line 66 cites ECG-CPC correctly to `arxiv_2509_25095` (V18) | patch 09 | reading 2 | Reading 2 quotes the line (`items.md:725`) without checking the citation. Citation compliance ran before patch 09 and never read it |
| Line 60, Berger et al. "consistently competitive with two of them, CLOCS and HeartLang"; the saved abstract names neither | patch 15 | compile fix only | No reading and no citation check ran after patch 15 |
| Line 332, "ECGFounder was included for the alignment of its embedding with the clinical label" | patch 15 | compile fix only | As above |
| Cliff's delta left out | not a patch: the reviewer's items (`items.md:51-52`) under the session's intake decision that no number is computed from `code/results/` (`config.md:39`) | readings 1 and 2 | Both list it as needing a computed number (`items.md:453`, `:655`). Judge 2 finds delta is 1 by reading the per-seed values |
| Three Wilcoxon contrasts where `run_analyses.py:47-48` tests four | patch 09 ("three contrasts" first appears there) | reading 2 | Reading 2 names the fourth contrast (`items.md:843`) and keeps it out because its result is printed, not saved, under the same intake decision |

Not traced: the HuBERT-ECG filter and scaling cited to a page the run could not read while `page-071` holds them.
