Scratch folder of the drafts: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.z9uY9qW1il

# The README drafts

The `readme` mode of `researcher` (installed copy at /Users/axelfaes/.claude/skills/researcher, read in this run) has drafted the README, a `notes/` file, the code README, the code folder's `.depositignore` and a licence for /Users/axelfaes/workspace/research-hub/projects/active/engram. Nothing is written in the project. Each draft is shown whole below.

## The code folder

`code/`. The old README names it at line 5 ("The engine's code is `code/`, with its own `code/README.md`"), so it was not found by searching the files.

## Files the drafts write

| File in the project | Draft in the scratch folder | Replaces |
|---|---|---|
| `README.md` | `README.md` (264 lines) | the old `README.md` (240 lines) |
| `notes/next.md` | `notes/next.md` (149 lines) | nothing; `notes/` does not exist yet and is made |
| `code/README.md` | `code/README.md` (166 lines) | the old `code/README.md` (167 lines) |
| `code/.depositignore` | `code/.depositignore` (37 lines) | the old `code/.depositignore` (24 lines) |
| `code/LICENSE` | `code/LICENSE` (21 lines) | nothing; added by answer Q14 |

Every draft is ASCII (`LC_ALL=C grep -c '[^ -~]'` gives 0 for each file).

## Where each answer went

- Q1 venue: README title line, "Venue: ICLR, cycle not set."
- Q2 research questions and claims: README `## Research questions and claims`. RQ1, RQ2, C1 and C2 are as drafted. C2's baseline line now reads "the unlearning methods AMNESIA evaluates, RMU, GradDiff, KL-Min and SimNPO, and the curvature line's localisation plus removal (Merullo et al. 2025)."
- Q3 the gate's fallback: removed. In the README, step 5 of the chain in `### What it does` reads "A decomposition that only ties the SVD leads to the next method under the automatic setting of `## Constraints and limits`." That sentence replaces old line 21 ("the project has no lead") and the end of old line 30 ("the honest reading is that the multiway prior does not apply here. That is what the gate is for"). In `notes/next.md`, "The gate" ends with "A decomposition that only ties the SVD leads to the next method under the automatic setting of the README's `## Constraints and limits`." in place of the fallback-paper sentence. `present/main.md` is left as it is.
- Q4 MIMIC-IV-Note: README `## Data`, `### MIMIC-IV-Note`, under "Cluster path" and "Access".
- Q5 PMC-Patients: README `## Data`, `### PMC-Patients`, under "Local path: not fetched" and "Cluster path: not fetched. The loader reads `~/data/pmc-patients/PMC-Patients-V2.json`".
- Q6 deadline: README `## Constraints and limits`, under "Time".
- Q7 setting: README `## Constraints and limits`, under "Setting: automatic, with a count of 5 methods; you can change it in words."
- Q8 the curvature line: README `## Related work`, `### The closest prior work`, first bullet.
- Q9 result files: README `## Results and how to reproduce`. Each number has its job id and its file, with the cluster folders `~/projects/engram/results/<job id>/` and `~/projects/engram/logs/`. The same cluster folders appear in `### Where things live`. Nothing is copied into the project.
- Q10 account: README `### Cluster facts`, under "Account".
- Q11 time limits: README `### Cluster facts`, under "Time limits".
- Q12 the localiser: code README introduction. The text is "engram is the engine. The localiser, the ablation study and the per-record erasure method are not part of this package." It replaces old code README line 167, and "See `CLAUDE.md`." is dropped. The README's `### The approach` says the localiser lives in this project, outside `code/`.
- Q13 run time: code README `## Run`, which reads "That run takes about 13 minutes on an A40. A run on real data has not been timed yet." The README's reproduce paragraph also names job 579312.
- Q14 licence and citation: code README `## License and citation`, and the new `code/LICENSE` (MIT text, "Copyright (c) 2026 Axel Faes", copied from `projects/active/brecht-fl-partitioning/code/LICENSE`).
- Q15 `.depositignore`: the old file has `/data/` at line 16, so no data line is added.

## A correction to the old README, found while attributing the numbers

The old README says (line 40) "Instruction tuning moves exposure by under 0.3 bits in all 16 cells". The cluster's result files support that only at 512 references: in job 579242 the largest change between `results_base.json` and `results_sft.json` is 0.21 bits. At 8192 references (job 579326, `results_final.json` against `results_sft.json`), `hpi.m16.cross_patient.free_text` moves by 2.0 bits sampled and by 1.8 bits fitted, and every other cell moves by under 0.4 bits. The draft states both, under `### Instruction tuning moves exposure little at 512 references`. Commands: `ssh utwente` with a read of each `results_*.json` of jobs 579242, 579250, 579263, 579287, 579288, 579290, 579291 and 579326. Those jobs' largest changes were 0.206, 0.036, 1.0, 1.585, 0.415, 0.223, 1.085 and 2.0 bits.

## Where each fact of the old text went

### Old `README.md`

- Line 1 (title): README title.
- Line 3 (status, the question): README title line and `## In short`.
- Line 5 (code folder, "the manifest here is the portfolio entry"): `### Where things live`, first paragraph ("This README is the project's entry in the hub portfolio. The engine's code is `code/`, with its own `code/README.md`.").
- Line 9 (clinical notes repeat, Ronaghi et al.): `### The problem`, and in brief in `### The closest prior work`.
- Line 11 (the bet, regulators): `### What it does` and `### Why it matters`.
- Line 13 (canaries as the ruler): `### What it does` and `## In short`.
- Lines 15 to 24 (the chain): `### What it does`, as a numbered list. Step 5's last sentence is replaced by Q3.
- Lines 26 to 30 (why a tensor decomposition): `### What it does`. Line 30's last two sentences are replaced by Q3.
- Lines 32 to 41 (Results bullets): `## Results and how to reproduce`, one `###` per bullet, each with its job id and file.
- Lines 42 to 51 (exposure table): `### Exposure by grid cell, 12M model, 8192 references`, with job 579326.
- Lines 53 to 65 (throughput table and its caveats): `### Throughput`, with a Job column added (579290, 579312, 579291).
- Lines 67 to 69 (Reproduce): the second paragraph of `## Results and how to reproduce`.
- Line 73 (raising the reference count): `## Dead ends (do not retry)`, `### Raising the reference-candidate count to fix exposure saturation`.
- Line 74 (document-level deduplication): `## Dead ends (do not retry)`, `### Document-level deduplication against a canary`.
- Line 75 (dictionary-backed provenance index): `## Dead ends (do not retry)`, `### A dictionary-backed provenance index`.
- Line 76 (PMC-Patients and the within-patient arm): `## Data`, `### PMC-Patients`, "Content", and `### What is not claimed`.
- Lines 80 to 84 (Data): `## Data`, one `###` per corpus.
- Line 88 (models, grid, scoring): `## Method`, `### The approach`, first paragraph.
- Line 90 (the localiser and its baselines): `### The approach`, second paragraph.
- Line 92 (curvature line, SVD bar, AMNESIA): `### The closest prior work`, `### What this project adds`, `### Why it matters`, and `## Constraints and limits` under "Good enough".
- Lines 94 to 240 (Next, with Decided against): moved whole to `notes/next.md`. The only change is the gate sentence of Q3. `## Next` holds a short numbered list of the open items, and `## Dead ends (do not retry)` links "Decided against".
- Line 128 (27 GB merge peak, projected): also `## Constraints and limits`, under "Storage".
- Lines 147, 157, 166 and 168 (model, FSDP2, the localiser's design, where it lives): also `### The approach`, and FSDP2 in the code README `## Requirements`.
- Lines 152 and 161 (no number on the synthetic corpus is a result; steps 3 to 6 not written): also `### What is not claimed`.

### Old `code/README.md`

- Lines 1 to 5 (title, what it is, engram): the introduction under `# engram: code`. "10M to 350M parameters" becomes "12M to 299M parameters", the sizes of the three configs.
- Lines 7 to 18 (what it is for): `## What it computes`, `### Why it is measured this way`.
- Lines 20 to 26 (what a canary is): `### What a canary is`.
- Lines 28 to 36 (the ceiling): `### The ceiling on every exposure number`. "In the first cluster run 12 of 16 grid cells sat on the 9-bit ceiling" becomes "On the synthetic corpus, 12 of 16 grid cells sat on the 9-bit ceiling at 512 references".
- Lines 38 to 111 (the flow, nine stages): `### The flow`, as a numbered list. Corpus details go to `## Data`.
- Lines 98 to 101 and 109 to 111 (posttrain and score examples): covered by the four commands of `## Run`. These two single-stage examples are not repeated.
- Lines 113 to 127 (running it): `## Run`.
- Line 129 (start with docs/00-map.md): end of `### The flow`.
- Lines 131 to 159 (layout and stage table): `## Layout`, with `hpc/` and `references.bib` added.
- Line 163 (environment): `## Requirements`, last paragraph.
- Line 167 (scope): the introduction, as answer Q12 gives it.

### Old `code/.depositignore`

All 24 lines are kept in their order, comments and blank lines included. The added lines follow them under one comment.

## Changes that are not moves

- The instruction-tuning correction above.
- Job ids and result files are added to every result (answer Q9 and the cluster reads).
- The README's `### Cluster facts` adds facts read from the job scripts: the partitions, `ctit088` excluded, `/local/$SLURM_JOB_ID` scratch, the packed environment, and the GPUs in the logs' host lines.
- The README's `### The stage and campaign that stand` says that no stage of `research` is named, since `research` did not start the project, and that `/researcher research adopt` settles the stage.
- The code README's `## Requirements` adds the pinned versions from `requirements.lock.txt`. Its `## Run` adds the list of job scripts, and its `## What each result comes from` is new, from `slurm/e2e.slurm`, `scripts/score.py` and `utils/scripts/gen_diagram.py`.
- "Apple MPS runs 12M at 5,974 tok/s" is kept from the old README, with the note that no result file of the project holds this run.

## Sources

Each section of each draft ends with an HTML comment `<!-- source: ... -->` that names the file and lines, or the answer, that its sentences come from. The cluster facts beyond the answers come from read-only `ssh utwente` commands run in this run: `ls` of `~/projects/engram/results` and `~/projects/engram/logs`, `grep` of each log's `host` and `throughput` lines, and reads of the `results_*.json` files. These gave 576K of results and 118K of logs, the A40 throughput of 145,351 tok/s for job 579312, and the cell values. The skill reads no file of another tool, so `project.yml` and `CLAUDE.md` were not read. The facts the answers cite from them reached the drafts only through the answers.

## Questions still open

None. The answers settle every question of the earlier run, and the drafts raise no new one.

## Draft 1: `README.md` (whole)

```markdown
# engram

An interpretability project on clinical language models: where in the weights a memorised patient record sits, and whether it can be removed without wrecking the model. Status: in flight, gate pending; the measurement instrument is built and cluster-verified, the localiser is not written. Venue: ICLR, cycle not set.
<!-- source: old README.md line 3; venue: answer Q1 -->

## In short

When a model has memorised a patient's record, the project asks whether that record sits in a small set of components that a multiway decomposition of the MLP activations can find, and whether removing those components erases the record while the model keeps what it knows about other patients. Fake records planted at known rates are the ruler: the memorised set is known before training starts, so a localisation claim is scored rather than argued. Steps 1 and 2 of the chain below (plant, train) are built; steps 3 to 6 (decompose, ablate, compare, erase) are not written.
<!-- source: old README.md lines 3, 11, 13 and 24 -->

## What it is and why

### The problem

Clinical notes repeat themselves. Copy-forward carries a span from one visit's note into the next, templates put the same phrasing in front of unrelated patients, and section headers appear in nearly everything. Ronaghi et al. (2026) trained on 378,000 real notes and found 45.0% of memorised regions recurring across multiple patients and 36% of memorised tokens turning out to be templated documentation. Those are observations on a corpus nobody could change.
<!-- source: old README.md line 9 -->

### Why it matters

Targeted erasure of one patient's records is what regulators ask for, and no current method does it well. The unlearning benchmark AMNESIA finds that unlearning one patient erodes the model's knowledge of other patients with the same condition; a localiser that separates a record from the shared clinical knowledge around it addresses that gap.
<!-- source: old README.md lines 11, 22 and 92 -->

### What it does

The bet is that a memorised record is not smeared uniformly across the weights, and that a multiway decomposition can find the components carrying it, because those components have the structure a decomposition is good at: the same content, at the same canary-relative position, across many examples drawn from one template. These are three modes with shared structure, and the method is the existing block-term work pointed at a new object. If that holds, the same components support targeted erasure of one patient.

The planted fake records are the ruler, not the subject. Without them, "was this memorised" is a judgement call. With them, the memorised set is known before training starts.

The chain:

1. Plant records at controlled duplication rates, which establishes the ground truth.
2. Train small models from scratch, so that the ground truth holds exactly.
3. Decompose the MLP activation tensor over (example, canary-relative position, neuron), contrasting inputs carrying a memorised record against matched inputs that do not, into a ranked set of candidate components.
4. Ablate them, and measure whether extraction of that record drops and at what cost in perplexity. This is the causal test, which separates a real localisation from a correlation.
5. Compare against K-FAC curvature editing, a plain weight SVD and neuron-level ablation. A decomposition that only ties the SVD leads to the next method under the automatic setting of `## Constraints and limits`.
6. Erase: remove one actual patient's records with the validated components and verify with the same metrics.

Steps 1 and 2 are the instrument and are built. Steps 3 to 6 are the contribution and none of it is written.
<!-- source: old README.md lines 11, 13, 15 to 24, 26 to 30; step 5's last sentence: answer Q3, which replaces the old sentences "If the multiway structure buys nothing over a matrix method, the project has no lead" (line 21) and "the honest reading is that the multiway prior does not apply here. That is what the gate is for" (line 30) -->

## Research questions and claims

- RQ1: When a small decoder-only model trained from scratch on clinical notes has memorised a planted record, do the components of a multiway decomposition of its MLP activations over (example, canary-relative position, neuron) carry that record?
- RQ2: Can those components remove one real patient's records from the model while the model keeps what it knows about other patients with the same condition?

- C1: Ablating the components the decomposition ranks drops extraction of the target record more per unit of perplexity cost than the baselines.
  - Result that would show it: the extraction-drop-per-perplexity curve of the decomposition above that of the plain weight SVD, on the 72M model.
  - Baseline: a plain weight SVD (the bar), K-FAC curvature editing and neuron-level ablation.
  - Metric: extraction drop against perplexity cost, reported as a curve.
  - Novelty page: none.
- C2: Removing the components step 5 validated erases one actual patient's records.
  - Result that would show it: the extraction metrics and a keyword-leakage score of that patient's records fall, and retention on patients sharing a condition holds.
  - Baseline: the unlearning methods AMNESIA evaluates, RMU, GradDiff, KL-Min and SimNPO, and the curvature line's localisation plus removal (Merullo et al. 2025).
  - Metric: the extraction metrics of scoring, a keyword-leakage score, and retention on patients sharing a condition.
  - Novelty page: none.
<!-- source: drafted from old README.md lines 11, 19, 92, 182 and 189; answer Q2 confirms RQ1, RQ2, C1 and C2 and gives C2's baseline -->

## Data

### MIMIC-IV-Note

- Source: PhysioNet, `https://physionet.org/files/mimic-iv-note/2.2/`.
- Version: 2.2.
- Access: credentialed through PhysioNet, under an agreement separate from MIMIC-IV.
- Content: 331,794 de-identified discharge summaries from 145,915 patients, plus radiology reports and both detail files. Its identifiers are surrogates, so only planted canaries can be scored on it.
- Local path: not on this machine.
- Cluster path: `~/data/mimic-iv-note/note/`, which holds `discharge.csv.gz`, `discharge_detail.csv.gz`, `radiology.csv.gz`, `radiology_detail.csv.gz` and `index.html`; the loader reads `~/data/mimic-iv-note`, or `$ENGRAM_DATA/mimic-iv-note`.
- Why chosen: it is the realistic corpus and the one the gate needs, and the only corpus of the three with real patient timelines for the within-patient arm.
<!-- source: old README.md lines 80 and 123; code/src/engram/data/mimic.py lines 29, 42 and 46; cluster path: answer Q4 -->

### PMC-Patients

- Source: PubMed Central case summaries, file `PMC-Patients-V2.json`.
- Version: V2.
- Access: public, CC-BY-NC-SA-4.0, so it is fetched and not vendored.
- Content: 250,294 real case summaries. It covers the cross-patient arm, both content types and every multiplicity. It has exactly one summary per patient, so it cannot support the within-patient arm: there is no previous note to copy forward from, and keying on the article identifier would silently relabel the cross-patient condition. `prepare_data.py` refuses that grid rather than planting something mislabelled.
- Local path: not fetched.
- Cluster path: not fetched. The loader reads `~/data/pmc-patients/PMC-Patients-V2.json`, or the same file under `$ENGRAM_DATA/pmc-patients`.
- Why chosen: it makes the pipeline runnable by someone without credentials.
<!-- source: old README.md lines 76, 82 and 118; code/src/engram/data/pmc.py lines 40, 57 and 61; not fetched: answer Q5 -->

### The synthetic corpus

- Source: generated by `code/src/engram/data/synthetic.py`, with section headers everywhere, copy-forward from a patient's previous note and templates shared across unrelated patients; `copy_forward_rate` sets the within-patient share.
- Access: none needed.
- Path: generated in the job; nothing stored.
- Why chosen: it covers the whole grid on text nobody needs permission for, and is what the smoke path and every number in `## Results and how to reproduce` use. It reaches 547 token types.
<!-- source: old README.md lines 65 and 84; old code/README.md line 48 -->

## Method

### The approach

Small decoder-only models, 12M to 299M parameters, trained from scratch as one muP family (RoPE, RMSNorm, SwiGLU, grouped-query attention, QK-norm, a warmup-stable-decay schedule, FSDP2 for the largest), with canaries planted on a grid crossing multiplicity (1, 4, 16, 64), placement (within-patient against cross-patient) and content (identifier against narrative). Scoring is exposure, k-extractability and four membership-inference attacks, with every measured span checked against a provenance index so that templated boilerplate is not counted as a leaked record.

The localiser decomposes the MLP activation tensor over (example, canary-relative position, neuron), contrasting canary inputs against matched non-canary ones, and is judged by extraction drop per unit of perplexity cost against three baselines: K-FAC curvature editing, a plain weight SVD and neuron-level localisation. The position mode is canary-relative, token k of the planted record, since absolute position in a note carries no shared structure across examples. Contrast sets are built within a template, never across templates. The MLP tensor comes first because freezing MLPs drops synthetic memorisation accuracy from 100% to 19% against 69% for frozen query and key projections; that is a prior about where to look, and the residual stream is captured too. The localiser is not written; it lives in this project, outside the engine package under `code/`.
<!-- source: old README.md lines 88, 90, 147, 166 and 168 -->

### What is not claimed

- No number in `## Results and how to reproduce` is a research finding: each is from a 12M or 72M model on the synthetic corpus, one canary per cell, one seed.
- The localiser, the ablation, the comparison and the erasure are not written, so no localisation is claimed.
- On MIMIC-IV-Note the identifiers are surrogates, so no real name or record number is scored; only planted canaries are.
- The within-patient arm is not claimed on PMC-Patients.
<!-- source: old README.md lines 24, 34, 80, 152 and 161; old code/README.md line 44 -->

## Constraints and limits

- Good enough: the decomposition's extraction-drop-per-perplexity curve beats that of the plain weight SVD; beating neuron ablation alone is not enough, since on out-of-distribution suppression a plain matrix SVD comes within 1.4 points of the curvature method.
- Time: no deadline is set; the gate is sized at weeks.
- Compute: one GPU per job on the cluster's `main-gpu` partition, 48 GB of memory and 8 CPUs per training or scoring job.
- Storage: the provenance index of a full MIMIC run is projected at a 27 GB merge peak from a linear fit, not measured.
- Access: MIMIC-IV-Note is credentialed; PMC-Patients and the synthetic corpus need no agreement.
- Setting: automatic, with a count of 5 methods; you can change it in words.
<!-- source: good enough: old README.md lines 92 and 182; time: answer Q6; compute: code/slurm/train.slurm and score.slurm SBATCH lines; storage: old README.md line 128; setting: answer Q7 -->

## Related work

### The closest prior work

- The curvature line, Merullo et al. (2025), "From Memorization to Reasoning in the Spectrum of Loss Curvature", arXiv:2510.24256: it already does localisation plus removal and beats a supervised unlearning baseline, and a plain SVD comes within 1.4 points of it on out-of-distribution suppression. That SVD result sets the bar.
- AMNESIA (Davoudi, Iranmanesh, Frieder, Goharian, arXiv 2605.30599, v1 2026-05-28) is a benchmark rather than a method: 70,560 question-answer pairs from 8,820 PMC-Patients-v2 notes across 11 disease categories, used to evaluate RMU, GradDiff, KL-Min and SimNPO at random-patient and disease level. It localises nothing, because every method it tests edits a fixed layer 7. Its headline finding is that unlearning one patient erodes knowledge of other patients with the same condition.
- Ronaghi et al. (2026) measured memorisation in 378,000 real notes (see `### The problem`), and Li et al. (2026) report up to 87% of memorised content surviving fine-tuning.
- The references are in `code/references.bib`. The project has no novelty page in `notes/`.
<!-- source: old README.md lines 9 and 92; Merullo et al.: answer Q8 and code/references.bib lines 87 to 92; Li et al.: old code/README.md line 17 -->

### What this project adds

None yet: no result has been compared. The gap it aims at is a localiser that separates one patient's record from the shared clinical knowledge around it, the gap AMNESIA names.
<!-- source: old README.md line 92 -->

## Results and how to reproduce

Every result below is an instrument check, not a research finding, so no baseline applies to it: each is from the synthetic corpus, one canary per cell, one seed. The result files are on the cluster under `~/projects/engram/results/<job id>/` and the logs under `~/projects/engram/logs/`; none is copied into this project.

To reproduce: from `code/`, the four commands `prepare_data.py`, `train.py`, `posttrain.py` and `score.py`. On the cluster, `sbatch slurm/e2e.slurm configs/12m.yaml` runs all four against the synthetic corpus in about 13 minutes (job 579312, A40). The environment is pinned by `uv.lock` and a hash-pinned pip export, and the jobs stage all I/O on `/local/$SLURM_JOB_ID`. The project has no `run_all.sh` and no `paper.py`.

### The pipeline runs end to end on the cluster

Nine stages, 102 tests, FSDP2 sharding exercised across two ranks. Jobs 579242, 579250, 579263, 579287, 579288, 579290, 579291 and 579312 each wrote `results_base.json`, `results_sft.json`, `manifest.json` and `canaries.json`.

### Sampled exposure has a ceiling at log2(N) references

Against a 29.9-bit identifier space, 12 of 16 grid cells sat on the 9-bit ceiling at 512 references (job 579242, `results_base.json`), and 8 of 16 still sit on the 13-bit ceiling at 8192 references (jobs 579312 and 579326).

### The fitted estimator resolves every pinned cell

Fitting a normal to the reference log-perplexities resolves every pinned cell and agrees with the sampled value to 0.06 bits where both are valid (`mrn.m1.cross_patient`, 4.92 sampled against 4.98 fitted). It shows a dose-response of the within-patient identifier arm that sampling reported as flat: 3.2, 15.8, 21.3 and 25.8 bits at 1, 4, 16 and 64 copies. Job 579326, `results_final.json`, the re-scoring of job 579312's base model at 8192 references.

### Identifiers memorise harder than narrative at matched dose

At 64 copies, identifiers reach 25.8 to 26.8 bits fitted against 12.0 to 12.5 for free text. Job 579326, `results_final.json`.

### Instruction tuning moves exposure little at 512 references

At 512 references instruction tuning moves the sampled exposure by under 0.3 bits in all 16 cells (job 579242, `results_base.json` against `results_sft.json`; the largest change is 0.21 bits). At 8192 references it moves the sampled exposure of `hpi.m16.cross_patient.free_text` by 2.0 bits and its fitted exposure by 1.8 bits, and every other cell by under 0.4 bits (job 579326, `results_final.json` against `results_sft.json`).

### Exposure by grid cell, 12M model, 8192 references

Job 579326, `results_final.json`. The empirical column is a bound and the fitted column is a point estimate under a normality assumption; they are not interchangeable and are never plotted on one axis. The last row is the check: where the empirical estimator still has resolution, the two agree to 0.06 bits.

| Cell | Copies | Empirical | Fitted |
|---|---|---|---|
| mrn.m64.cross_patient | 64 | 13.00+ | 26.81 |
| mrn.m16.cross_patient | 16 | 13.00+ | 25.27 |
| mrn.m4.cross_patient | 4 | 13.00+ | 15.95 |
| mrn.m1.cross_patient | 1 | 4.92 | 4.98 |

### Throughput

Sequence length 512, bf16, vocabulary forced to 32000.

| Config | Parameters | tok/s | Node | Job |
|---|---|---|---|---|
| 12M | 12.4M | 274,300 | L40S | 579290 |
| 12M | 12.4M | 145,351 | A40 | 579312 |
| 72M | 72.1M | 73,851 | L40S | 579291 |

Apple MPS runs 12M at 5,974 tok/s; no result file of the project holds this run.

Two things make these numbers incomparable if read carelessly. Vocabulary size: the synthetic corpus reaches 547 token types, which makes the output projection 3% of the work instead of 66%, so a run measured on it is 2.5x faster than the table; `train.py --vocab-size 32000` builds the model at the real size regardless of the corpus. The timed region is the whole training call, covering every optimiser step plus eleven evaluation passes, any checkpoint writes and first-use kernel compilation, which is minor on CUDA and large on MPS: the same MPS model timed over its inner loop alone, after a warmup, runs about 2.3x faster than the figure above. Repeated runs of one configuration vary by up to 1.5x, since cluster nodes are shared.
<!-- source: old README.md lines 32 to 69; job ids, file names and the changes under instruction tuning: answer Q9 and the cluster's result files, read with `ssh utwente` (`ls`, `grep` of the logs' throughput lines, and a read of each `results_*.json`) -->

## Papers

None yet.

## Dead ends (do not retry)

### Raising the reference-candidate count to fix exposure saturation

Folder in `code/attic/`: none. Going from 512 to 8192 references is a 16x compute increase for 4 bits, and it left 8 of 16 cells pinned. The identifier space is 29.9 bits and no affordable sample reaches it. The parametric fit is the route past it, which is what the original Secret Sharer paper (Carlini et al. 2019) does.

### Document-level deduplication against a canary

Folder in `code/attic/`: none. Document-level deduplication does not touch a canary, because one planted line inside a long note does not make its host a near-duplicate of anything. Exact-substring matching over the token stream is the half that reaches it, and the literature default threshold of 50 tokens is longer than the canaries, which makes the mitigation look weak for reasons unrelated to the model.

### A dictionary-backed provenance index

Folder in `code/attic/`: none. 190 MB and 10 s per million tokens means 158 GB for MIMIC against a 48 GB allocation. Replaced by a sorted posting table.

The choices decided against without being tried (PPO, GRPO and a reward model; a general pretraining corpus; a control-panel UI; a skew-normal fit) are in [notes/next.md](notes/next.md), "Decided against".
<!-- source: old README.md lines 71 to 76 and 228 to 240 -->

## Next

1. Verify the provenance index at full MIMIC scale, at increasing corpus fractions. Hours.
2. Replicate the grid across seeds. Hours at 12M.
3. Check the normality assumption of the fitted estimator on real reference distributions. Half a day.
4. Train 72M on real clinical notes, after item 1. A day.
5. The 299M scaling arm, after item 4. Days.
6. The localiser (step 3 of the chain), after item 4. Weeks.
7. The ablation harness (step 4), after item 6. Days.
8. The gate (step 5), after item 7. Weeks.
9. Targeted unlearning of a real record (step 6), after item 8. Weeks.
10. Off the chain: a documented small-scale path that does not assume SLURM (hours), an optional external-instruction loader (a day), a third corpus with real patient timelines, the federated arm, and the deposit of the code once a manuscript exists.

The full record, with each item's reason, status and history, is in [notes/next.md](notes/next.md).
<!-- source: old README.md lines 94 to 240, moved whole to notes/next.md -->

## Working state

### The stage and campaign that stand

No stage of `research` is named: `research` did not start this project, and `/researcher research adopt` settles the stage it continues from. No job is submitted and not yet read: every job of `## Results and how to reproduce` has its log and its result files on the cluster. No piece of code has a brief or a report in `notes/`.
<!-- source: cluster `ls ~/projects/engram/results ~/projects/engram/logs`; the project has no notes/code/ -->

### Where things live

This README is the project's entry in the hub portfolio. The engine's code is `code/`, with its own `code/README.md`.

| Folder of the layout | This project |
|---|---|
| `code/` | `code/` |
| `code/run_all.sh` | none; the four scripts of `code/scripts/`, and `code/slurm/e2e.slurm` for the synthetic corpus |
| `code/paper.py` | none |
| `code/core/` | `code/src/engram/` |
| `code/experiments/` | none |
| `code/hpc/` | `code/slurm/` for the pipeline's jobs, and `code/hpc/` for one submission check |
| `code/data/` | none; the raw inputs stand under `~/data/<dataset>` on the cluster, or `$ENGRAM_DATA` |
| `code/results/` | none here; on the cluster `~/projects/engram/results/<job id>/` |
| `code/figures/` | none; the documentation diagrams are in `code/docs/diagrams/` |
| `code/attic/` | none |
| `code/.depositignore` | `code/.depositignore` |
| `manuscript/` | none |
| `admin/` | none |
| `notes/` | `notes/` |
| `reviews/` | none |
| `logs/` | none here; on the cluster `~/projects/engram/logs/` |

The project also holds `present/`, a presentation, and in `code/` the folders `configs/`, `docs/`, `scripts/`, `tests/` and `utils/`, which `code/README.md`, "Layout", describes. On the cluster, `~/projects/engram` is the copy of `code/` the jobs are submitted from.
<!-- source: old README.md line 5; the project's file listing; code/slurm/e2e.slurm lines 14 and 67 to 71; cluster folders: answer Q9 -->

### Cluster facts

- Cluster: the University of Twente cluster, reached as `utwente`.
- Scheduler: SLURM.
- Partitions: `main-gpu` for the GPU jobs, `main-cpu` for the CPU check; `main` also exists.
- Account: `bms-code`; the job scripts set no `--account`.
- Modules: none; the jobs run the node's system `/usr/bin/python3` (3.10) against a packed environment built by `code/scripts/pack_env.sh` and extracted per node to `/local/$USER/engram`. Node `ctit088` runs Python 3.12 and is excluded.
- Scratch storage: `/local/$SLURM_JOB_ID` on the node, made and removed by the job (`code/slurm/_stage.sh`).
- Time limits: `sinfo` prints `infinite` for every partition; the hub guide gives a 24 h default walltime. The job scripts ask for 1 minute to 24 hours.
- GPUs seen in the logs: L40S, A40, L40, Quadro RTX 6000.
<!-- source: code/slurm/*.slurm and code/hpc/oculus_submit_check.slurm SBATCH lines; code/slurm/_stage.sh; code/slurm/env_guard.sh; account: answer Q10; time limits: answer Q11; GPUs: the logs' host lines on the cluster -->
```

## Draft 2: `notes/next.md` (whole, new file)

Changes from old README lines 96 to 240: three opening lines are added, each `###` heading becomes `##` and each `####` becomes `###`, and the gate's fallback sentence is replaced (answer Q3). `diff` of the old lines, with the headings shifted, against the file shows that one sentence as the only other difference.

```markdown
# Next: the full record

Moved whole from the section `## Next` of the project's `README.md`, whose `## Next` now holds the short list of next actions. Its headings are one level higher than in the README.

MIMIC-IV-Note access landed 2026-09-01, so nothing here waits on anything outside the code.

Ordered by the chain above. Position in this section therefore means something: where in the argument an item sits. It does not mean urgency or size, which are stated per item instead.

Each step and each item is marked done, in progress (partially built) or not started.

Two rules. **Nothing is ever deleted from this section.** A finished item keeps its explanation and gains a date, so the section is a record of what happened and not a snapshot of what is left. And every item carries one status line: open, doing, done, or removed, plus what blocks it and roughly how big it is.

The sections above say what exists today. This one says what is next and what already happened.

## Step 1: plant records at controlled duplication rates (in progress)

Establishes ground truth. Without it, "was this memorised" is a judgement call and no localisation claim can be scored.

### The canary grid, planting, tokenizer, deduplication, provenance index (done)
Done 2026-08-31.

Multiplicity crossed with placement crossed with content type, planted after the tokenizer is fitted so a canary cannot contribute its own merges. Per-digit tokenisation, which is what makes identifier canaries equal-length in tokens and the exposure denominator constant. Deduplication in three positions. A provenance index that maps any span back to its documents and their patient count, so templated boilerplate is not counted as a leaked record.

### PMC-Patients loader (done)
Done 2026-09-01.

Makes the pipeline runnable with no data use agreement, which the MIMIC-only version was not. 250,294 real case summaries, public, CC-BY-NC-SA-4.0 so it is fetched rather than vendored. One structural limit: exactly one summary per patient, so the cross-patient arm works fully and copy-forward cannot run on it at all. The run refuses that grid at the top rather than planting something mislabelled.

### MIMIC-IV-Note obtained (done)
Done 2026-09-01.

All five files down and checksums verified against PhysioNet's manifest: 1.1 GB of discharge summaries, 746 MB of radiology, both detail files. Access is a separate agreement from MIMIC-IV, which is why it took a second signature. The acquisition instructions in `mimic.py` said `--cut-dirs=4` and that was wrong; a fourth cut strips `note/` and lands the file one directory above where the loader looks. Corrected to 3 against a real download.

### Verify the provenance index at full MIMIC scale (not started)
Open. Blocked on nothing. Hours.

The sorted-posting rewrite is measured at 1.4M tokens and MIMIC discharge is roughly 830M. The 27 GB merge peak is a projection from a linear fit, not a measurement, and if it is wrong the job dies at the merge after twenty minutes of work. Run it at increasing corpus fractions and record where memory actually goes before committing to a long run.

### Replicates across seeds (not started)
Open. Blocked on nothing. Hours at 12M.

Every grid cell is currently one canary on one seed. The identifier arm came out monotone across all four multiplicities and both placements, which is suggestive. The free-text arm did not, with multiplicity 4 cross-patient scoring above multiplicity 16. With one draw per cell there is no way to say which of those is signal and which is noise.

### Check the normality assumption under the fitted estimator (not started)
Open. Blocked on nothing. Half a day.

`rank_from_fit` fits a normal to the reference log-perplexities and reads the rank off the tail, which is what gets past the sampling ceiling. It was validated against synthetic normal references and against the empirical estimator where both are valid. Nobody has looked at the residuals of a real reference distribution, and the fit now sits beneath eight of sixteen cells in every result the repository produces.

## Step 2: train small models from scratch (in progress)

Makes the ground truth from step 1 hold exactly, because the training data is known rather than inherited.

### Model, training loop, checkpointing, sharding, scoring (done)
Done 2026-08-31, sharding fixed 2026-09-01.

RoPE, RMSNorm, SwiGLU, grouped-query attention, QK-norm, as one muP family at 12M, 72M and 299M. Warmup-stable-decay so grid variants branch from one plateau. FSDP2 for the largest. Exposure, k-extractability and four membership-inference attacks. A deadlock in sampling from a sharded model, where a forward pass sat inside a rank-0 guard, was found and fixed.

### Train 72M on real clinical notes (not started)
Open. Blocked on the provenance check above. A day.

Everything measured so far is a synthetic corpus of 547 token types, which makes the output projection almost free and the language trivially predictable. No number produced on it is a result, including every number currently quoted in `code/README.md`.

### The 299M scaling arm (not started)
Open. Blocked on the 72M run landing first. Days.

FSDP2 is written and exercised across two ranks under gloo on CPU. It has never run on more than one GPU.

## Step 3: decompose the activation tensor (not started)

The contribution starts here. Nothing in steps 3 to 6 is written.

### The localiser (not started)
Open. Blocked on step 2. Weeks.

Decompose the MLP activation tensor over example, canary-relative position and neuron, contrasting inputs carrying a memorised record against matched inputs that do not, and rank the components that come out. The position mode has to be canary-relative, token k of the planted record; absolute position in a note carries no shared structure across examples, so an unaligned decomposition finds nothing for reasons unrelated to whether memorisation is localised. Contrast sets are built within a template, never across templates, since two templates of different lengths do not share a position mode. The MLP tensor is first because freezing MLPs drops synthetic memorisation accuracy from 100% to 19% against 69% for frozen query and key projections; that is a prior about where to look, not evidence about where memorised text lives, and the residual stream is captured too.

This lives in this project, outside the engine package under `code/`. The engine stays generic.

## Step 4: ablate the ranked components (not started)

### The ablation harness (not started)
Open. Blocked on step 3. Days.

Remove the ranked components and measure how far extraction of the target record drops against how much perplexity it costs. Reported as a curve, not a point. This is the causal test, and it is what separates a real localisation from a correlation between a component and a memorised input.

## Step 5: compare against the baselines (not started)

### The gate (not started)
Open. Blocked on step 4. Weeks.

K-FAC curvature editing, a plain weight SVD, and neuron-level ablation, on the same extraction-drop-per-perplexity curve. The bar is the SVD, not K-FAC: on out-of-distribution suppression a plain matrix SVD comes within 1.4 points of the curvature method, so beating neuron ablation proves nothing. A decomposition that only ties the SVD leads to the next method under the automatic setting of the README's `## Constraints and limits`.

## Step 6: erase a real record (not started)

### Targeted unlearning (not started)
Open. Blocked on the gate opening. Weeks.

Remove one actual patient's records using the components step 5 validated, and verify with the same extraction metrics plus a keyword-leakage score, checking retention on patients sharing a condition. Only worth starting if step 5 comes out positive.

## Off the chain (in progress)

### Continuous integration (not started)
Removed 2026-09-02.

Built without being asked, then removed on request. It ran ruff, the fast test suite, the lockfile-versus-export agreement check and the diagram drift check, with the two-process sharding test as a separate job, pinned to Python 3.10 to match the cluster's system interpreter. Recorded here so the decision is visible rather than the work silently reappearing.

### Documentation site (not started)
Removed 2026-09-02.

Same: built without being asked, then removed. MkDocs Material over the seven existing chapters with no duplicated prose, and a Pages workflow that built with `--strict` so a renamed chapter could not ship a dead link.

### A path someone can run without a cluster (in progress)
Open. Not blocked. Hours.

PMC-Patients already removed the credentials barrier, which was the hard half. What is missing is a documented small-scale route that does not assume SLURM. An earlier attempt at this was written into `code/README.md` without being asked and has been removed.

### An optional external-instruction loader (not started)
Open. Not blocked. A day.

Alpaca or GSM8K, clearly marked as not for the measurement. Fine-tuning on external text introduces new memorisable content and confounds the exact thing the post-training arm measures, so corpus-derived pairs stay the default. This would exist only to make the repository useful to someone doing something else.

### A third corpus with real patient timelines (not started)
Open. Not blocked.

PMC-Patients cannot supply copy-forward, since it has one summary per patient, so the within-patient arm currently lives only on MIMIC. A second corpus with real timelines would give it somewhere else to stand.

### The federated arm (not started)
Open. Not blocked.

Which site's records leak, whether averaging changes exposure at equal utility, and whether a memorised record can be attributed to its source hospital. Thinner than it looks: cross-client memorisation with canaries and a matched-utility comparison is already published, and client-level attribution under secure aggregation is solved for injected watermarks. The residual gap is attributing a naturally memorised record under realistic clinical heterogeneity.

### Deposit (not started)
Open. Blocked on a manuscript.

`code_availability` in the hub manifest is `none`. It becomes `deposited` with a URL and a Zenodo DOI when there is something to deposit against.

## Decided against

Recorded so they are not re-argued.

**PPO, GRPO and a reward model.** Nothing in the memorisation question turns on which policy-gradient method produced an aligned model, and the repository this one started from already does them well.

**The Pile, or any general pretraining corpus.** Wrong corpus for a study about clinical duplication structure.

**A control-panel UI.** This is a batch pipeline.

**Raising the reference-candidate count further to fix exposure saturation.** Already tried. 512 to 8192 is sixteen times the compute for four bits and left eight of sixteen cells pinned. The identifier space is 29.9 bits and no affordable sample reaches it. The parametric fit is the route, which is what the original Secret Sharer paper does.

**A skew-normal fit instead of a normal one.** Only if the normal fit fails on real reference distributions. It needs Owen's T function, and scipy is not a dependency this carries onto every cluster node.
```

## Draft 3: `code/README.md` (whole)

```markdown
# engram: code

A training stack for studying what language models memorise from clinical notes: decoder-only transformers, 12M to 299M parameters, trained from scratch on corpora with fake patient records planted in them at known rates. An **engram** is the physical trace a memory leaves in tissue. The code serves the engram research project; no paper of it exists yet.

engram is the engine. The localiser, the ablation study and the per-record erasure method are not part of this package.
<!-- source: old code/README.md lines 1 to 5; sizes: code/configs/12m.yaml, 72m.yaml and 299m.yaml (the old "10M to 350M" is replaced by the three configs' sizes); scope sentence: answer Q12, which replaces old line 167 -->

## What it computes

For each planted record (a canary) of a trained model, the code computes its exposure in bits, sampled and fitted, the smallest prefix that extracts it, and the membership-inference AUROC of four attacks, with every generated span checked against a provenance index so that what is reported is memorised patient content and not memorised boilerplate. It also reports training throughput.

### Why it is measured this way

Clinical notes repeat themselves. Copy-forward carries a span from one visit's note into the next, templates put the same phrasing in front of unrelated patients, and section headers appear in nearly everything. Ronaghi et al. (2026) trained on 378,000 real notes and found 45.0% of memorised regions recurring across multiple patients, 37.5% of clinically revealing patient-specific regions recurring within one patient's timeline, and 36% of memorised tokens turning out to be templated documentation.

Those are observations on a corpus nobody could change. The questions that need a corpus you can change:

- how memorisation scales with the number of times a record appears, and whether 4 copies differ from 64;
- whether copies inside one patient's timeline behave differently from copies across unrelated patients, at the same total dose;
- whether identifiers behave differently from narrative text;
- whether deduplication removes the risk or only the appearance of it;
- whether instruction tuning moves any of it, given that Li et al. (2026) report up to 87% of memorised content surviving fine-tuning;
- whether a memorised record can be located inside the model and removed.

### What a canary is

A canary is a fake record planted in the training data so that after training you can ask whether the model memorised it.

The record contains a secret drawn uniformly from a space of known size, say `Medical record number: 60329669`, one draw from a billion. After training you score the true secret against other draws from the same space. If the model ranks the true one first, it memorised it; mid-pack means it did not. That rank in bits is the **exposure** (carlini2019secret), computed by `engram/eval/exposure.py`.

Without canaries you generate text, look for it in the corpus, and guess whether a match is a leaked record or a header appearing in eight thousand notes.

### The ceiling on every exposure number

The rank is estimated by sampling: score N alternative draws and count how many beat the true one. A canary that beats all N can only be placed at rank `|space|/N`, so exposure saturates at `log2(N)` and is reported with a trailing `+` to mark it as a lower bound.

That ceiling binds hard. An identifier canary is drawn from a billion, which is 29.9 bits, and no affordable sample reaches it: 512 references cap the measurement at 9 bits, 8192 at 13. On the synthetic corpus, 12 of 16 grid cells sat on the 9-bit ceiling at 512 references, and 8 of 16 still sit on the 13-bit one at 8192. Every saturated cell reports the same number, so the top of the dose-response grid flattens for a reason that has nothing to do with the model.

`score.py` therefore reports a second column. `rank_from_fit` fits a normal to the reference log-perplexities and reads the rank off the fitted tail, which has no ceiling but assumes that tail is normal. It separates cells the sampled estimate can only bound, and agrees with it closely wherever both are valid.

The empirical column stays the default and the two are never merged: one is a bound, the other a point estimate under an assumption. [docs/06-measuring.md](docs/06-measuring.md) has the rest.

### The flow

![pipeline](docs/diagrams/pipeline.svg)

1. Corpus: MIMIC-IV-Note, PMC-Patients or the synthetic corpus (see `## Data`).
2. Tokenizer: byte-level BPE trained on the corpus itself, with per-digit splitting. Identifier canaries are scored per digit token, and a GPT-style vocabulary gives some three-digit numbers their own token while splitting others, which makes the identifier arm uninterpretable.
3. Plant canaries: the grid (`engram/canary/`) crosses three factors, and every cell is one planted record. **Multiplicity** is 1, 4, 16 or 64 copies. **Placement** is `WITHIN_PATIENT`, every copy in a different note of one patient, or `CROSS_PATIENT`, every copy in a note of a different patient; both add the same token count at equal multiplicity. **Content** is an identifier or narrative text. Each planted canary records where it starts in its host document, so activations are indexed by token k of the record rather than by position in the note; [docs/02-canaries.md](docs/02-canaries.md) covers why.
4. Deduplicate: `off` trains on the corpus as it is. `before-plant` removes natural duplication and then plants at full multiplicity, so the dose matches the `off` arm. `after-plant` deduplicates the planted corpus and collapses the grid, since a canary at multiplicity 64 is 64 identical spans. Exact and MinHash matching catch whole notes that repeat or differ by a few lines. Neither reaches a canary sitting inside a long note, so exact-substring matching over the token stream handles those: repeated spans of at least 50 tokens, first occurrence kept. A threshold longer than the canary only removes it when it falls inside a longer repeated span, and the run reports that.
5. Build the provenance index: the index maps any 32-token span back to the training documents containing it and the number of distinct patients those documents belong to. A span in one patient is a candidate memorised record; the same span in five hundred patients is documentation structure. Deduplication runs first, so the index describes the corpus the model trains on.
6. Pack sequences: documents are concatenated to fill the context window, so one sequence holds several notes. `document_ids` records which note each position belongs to, and the model builds a block-diagonal attention mask from it. Without the mask a canary's effective context depends on whatever was packed beside it.
7. Pretrain: RoPE, RMSNorm, SwiGLU, grouped-query attention, QK-norm. Three sizes as one muP family, `12m` / `72m` / `299m`, so hyperparameters tuned at the smallest transfer upward. A warmup-stable-decay schedule, so one run reaches the plateau and each grid variant decays from that checkpoint.
8. Post-train: supervised fine-tuning on clinical instructions, optionally followed by preference optimisation (DPO). Li et al. report up to 87% of content memorised during pretraining surviving fine-tuning on new medical tasks, and Ronaghi et al. list post-training effects as unexplored; the arm asks whether the instruction stage moves exposure, and whether it moves identifiers differently from narrative. PPO and GRPO are out of scope. Instruction pairs come from the same corpus the base model saw, and any note carrying a canary is dropped whole.
9. Score: **exposure** is the rank of the true secret among draws from its randomness space. **k-extractability** is whether greedy decoding from a k-token prefix reproduces the record verbatim, reported as the smallest k that works. **Membership inference** is whether a record was in training at all, through four attacks: LOSS, zlib, Min-K%, ReCaLL. A canary can score high exposure and still be inextractable, so exposure alone overstates what an attacker can reach. Every scored span goes through the provenance index before it is counted.

![the canary grid](docs/diagrams/grid.svg)

![provenance](docs/diagrams/provenance.svg)

Start the chapters with [docs/00-map.md](docs/00-map.md).
<!-- source: old code/README.md lines 7 to 111 and 129; the 512-reference count is from job 579242 and the 8192-reference count from job 579312 on the cluster (answer Q9); "In the first cluster run" is replaced by "On the synthetic corpus ... at 512 references" -->

## Requirements

- Python 3.10 or later; 3.10 on the cluster, to match the nodes' system interpreter.
- Libraries, as pinned in `requirements.lock.txt` for Python 3.10: torch 2.13.0 (2.13.0+cu130 from PyTorch's CUDA index on Linux, PyPI on macOS), numpy 2.2.6, polars 1.44.1, pyyaml 6.0.3, tokenizers 0.23.1, tqdm 4.70.0.
- Optional: graphviz 0.20 or later, for rendering the diagrams; pytest 8.0 or later and ruff 0.6 or later, for development.
- Hardware: one GPU per job (runs are logged on L40S, A40, L40 and Quadro RTX 6000 nodes), with 48 GB of memory and 8 CPUs for training and scoring; FSDP2 sharding for 299M has run only across two CPU ranks under gloo. Apple MPS runs the 12M model.

`pyproject.toml` routes torch to PyTorch's CUDA index on Linux and PyPI on macOS. `uv.lock` is one universal resolution covering both; `requirements.lock.txt` is its pip export, generated by `scripts/lock.sh`. On the cluster, `scripts/pack_env.sh` builds the environment on the login node and packs it into one tarball that each job extracts to node-local scratch.
<!-- source: code/pyproject.toml; code/requirements.lock.txt lines 198, 472, 487, 556, 575, 589 and 597; code/slurm/train.slurm SBATCH lines; GPUs: the cluster logs' host lines; FSDP2: old README.md line 157; old code/README.md line 163; code/scripts/pack_env.sh lines 1 to 13 -->

## Data

| Corpus | Access | Within-patient arm | Cross-patient arm |
|---|---|---|---|
| MIMIC-IV-Note | credentialed | yes | yes |
| PMC-Patients | public | no, one note per patient | yes |
| synthetic | generated | yes | yes |

- **MIMIC-IV-Note** 2.2: 331,794 de-identified discharge summaries and radiology reports from 145,915 patients, credentialed through PhysioNet. Its identifiers are surrogates, so no real name or record number can be scored on it. Obtain it with `wget -c -r -N -np -nH --cut-dirs=3 https://physionet.org/files/mimic-iv-note/2.2/` from `~/data`; `prepare_data.py --corpus mimic` reads it under `~/data/mimic-iv-note`, and fails at the top with the acquisition commands when it is not there.
- **PMC-Patients**: 250,294 real clinical case summaries from PubMed Central, public under CC-BY-NC-SA-4.0, and the corpus davoudi2026amnesia build their medical unlearning benchmark on. It is what makes this repository runnable by anyone. There is exactly one summary per patient, so the within-patient copy-forward arm cannot run on it and `prepare_data.py` refuses that grid rather than mislabelling it; the cross-patient arm, both content types and every multiplicity work. The loader reads `~/data/pmc-patients/PMC-Patients-V2.json`.
- **The synthetic corpus** (`engram/data/synthetic.py`) generates notes with three duplication sources placed on purpose: section headers everywhere, copy-forward from a patient's previous note, and templates shared across unrelated patients. `copy_forward_rate` sets the within-patient share. Nothing needs to be obtained.

The environment variable `ENGRAM_DATA` replaces `~/data` as the folder the corpora are read from.
<!-- source: old code/README.md lines 42 to 54; code/src/engram/data/mimic.py lines 29 to 46; code/src/engram/data/pmc.py lines 40 to 61; code/scripts/prepare_data.py lines 10 and 11; licence: old README.md line 118 -->

## Run

There is no single `run_all.sh`. The pipeline is four commands, run from `code/`:

    pip install -e ".[dev,diagrams]"
    pytest

    python3 scripts/prepare_data.py --corpus mimic --out ~/data/engram/mimic-v1   # stages 1 to 6
    python3 scripts/train.py configs/72m.yaml --data ~/data/engram/mimic-v1 --out runs/v1
    python3 scripts/posttrain.py runs/v1/final.pt --data ~/data/engram/mimic-v1 --mode sft --out runs/v1
    python3 scripts/score.py runs/v1/final.pt --data ~/data/engram/mimic-v1 --out runs/v1/results.json

`pytest` works on a fresh clone without installing; `pythonpath = ["src"]` is set in `pyproject.toml`. `train.py` with no `--data` prepares a small synthetic corpus in memory and trains on it, which checks that stages 1 to 7 run in about a minute.

On the cluster, from the folder the code is copied to, `sbatch slurm/e2e.slurm configs/12m.yaml` runs all four against the synthetic corpus. That run takes about 13 minutes on an A40. A run on real data has not been timed yet.

The job scripts:

- `slurm/e2e.slurm`: the whole pipeline on the synthetic corpus in one job, with optional arguments for the config, steps, patients, reference candidates and vocabulary.
- `slurm/train.slurm`: stage 7 alone, against a prepared corpus; `sbatch --gres=gpu:4 slurm/train.slurm configs/299m.yaml --data ~/data/engram/mimic-v1` for the largest model.
- `slurm/score.slurm`: stage 9 alone, against checkpoints an earlier job produced, so that a change to the scoring code costs no retraining.
- `slurm/probe.slurm`: a five-minute job that reports a GPU node's operating system, system Python, GPU and driver, before an environment is built for it.
- `slurm/_stage.sh`, `slurm/env_guard.sh`: sourced by every job; they stage the code and the environment on `/local/$SLURM_JOB_ID` and stop when the node's Python does not match the packed environment.
- `slurm/CHECKLIST.md`: each cluster rule a job follows and where it is met.
- `hpc/oculus_submit_check.slurm`: a one-minute check that a job submission reaches the cluster.
<!-- source: old code/README.md lines 113 to 127; code/scripts/train.py lines 1 to 9; code/slurm/*.slurm headers; run time: answer Q13 (job 579312, A40) -->

## What each result comes from

- `results_base.json` and `results_sft.json`: written by `scripts/score.py` for the pretrained and the fine-tuned checkpoint, per grid cell, with exposure (sampled and, in a re-scoring, fitted), the smallest extractable prefix and the membership-inference AUROC.
- `manifest.json` and `canaries.json`: written by `scripts/prepare_data.py`, the prepared corpus and the planted canaries.
- `slurm/e2e.slurm` copies these four files to `results/<job id>/` in the folder the job is submitted from, and the checkpoints to `~/models/engram/<job id>/`.
- `docs/diagrams/grid.svg` and `docs/diagrams/blocks.svg`: generated from the code by `utils/scripts/gen_diagram.py`; `docs/diagrams/pipeline.svg` and `docs/diagrams/provenance.svg`: rendered by the same script from `utils/diagrams/pipeline.dot` and `utils/diagrams/provenance.dot`. `utils/scripts/check_diagrams.py` fails when a committed diagram has drifted from the source it is generated from.

The code makes no figure or table of results.
<!-- source: code/slurm/e2e.slurm lines 48 to 71; code/scripts/score.py lines 1 to 8; code/utils/scripts/gen_diagram.py lines 1 to 24 -->

## Layout

    src/engram/     data, model, train, canary, eval
    configs/        one YAML per model size: 12m, 72m, 299m
    scripts/        prepare_data.py, train.py, posttrain.py, score.py, lock.sh, pack_env.sh
    slurm/          cluster jobs, all I/O on /local/$SLURM_JOB_ID
    hpc/            the submission check
    docs/           numbered chapters, each naming the source it describes, and docs/diagrams/
    utils/diagrams/ handcrafted .dot sources
    utils/scripts/  gen_diagram.py, check_diagrams.py
    tests/          the test suite
    references.bib  the works the code and docs cite

Which file implements which stage of the flow above:

| Stage | Where |
|---|---|
| 1 corpus: synthetic, MIMIC-IV-Note, PMC-Patients | `data/synthetic.py`, `data/mimic.py`, `data/pmc.py` |
| 2 tokenizer | `data/tokenizer.py` |
| 3 canary grid and planting | `canary/` |
| 4 deduplication: exact, near, substring | `data/dedup.py` |
| 5 provenance index | `data/provenance.py` |
| 6 packing and the document mask | `data/packing.py`, `model/transformer.py` |
| 7 model, training loop, checkpointing | `model/`, `train/` |
| 7 FSDP2 sharding | `train/distributed.py` |
| 8 SFT and DPO | `train/sft.py`, `train/dpo.py` |
| 9 sampling and scoring | `model/generate.py`, `eval/` |

Paths are relative to `src/engram/`.
<!-- source: old code/README.md lines 131 to 159; the code folder's listing -->

## License and citation

The code is under the MIT licence; see `LICENSE`.

To cite the code, until a paper exists: Axel Faes, engram, version 0.1.0, with the Zenodo DOI once the code is deposited.
<!-- source: answer Q14; code/pyproject.toml lines 7 and 15 -->
```

(The two code blocks in `## Run` and `## Layout` are triple-backtick fences in the draft file. They are shown indented here so that they do not close this message's outer fence.)

## Draft 4: `code/.depositignore` (whole)

```text
__pycache__/
*.py[cod]
.venv/
*.egg-info/
.pytest_cache/
.ruff_cache/

# Run outputs. Checkpoints and caches are rebuilt from configs/ and the raw corpus.
runs/
checkpoints/
wandb/

# Corpora never enter the tree. Everything local lives under ~/data/<dataset>.
# Anchored with a leading slash. Unanchored, `data/` matches at any depth, which silently
# excluded the whole of src/engram/data/ (nine source files) from every commit.
/data/
*.npy
*.npz
*.arrow

# Assistant-facing notes and state, kept out of the deposit.
.agents/
.claude/
.codex/

# Left out of a public deposit
/attic/
/results/
/figures/
*.pyc
.cache/
.ipynb_checkpoints/
.env
.env.*
*.pem
*.key
secrets/
```

Lines 1 to 24 are the file's own lines, kept in their order. The file has no line that starts with `!`, so the added lines stand at its end, under one comment line, after a blank line.

Lines added (11): `/attic/`, `/results/`, `/figures/`, `*.pyc`, `.cache/`, `.ipynb_checkpoints/`, `.env`, `.env.*`, `*.pem`, `*.key`, `secrets/`. `*.pyc` is added because the rule counts only an exact line for a pattern other than a folder, and the file's `*.py[cod]` (line 2) is not that exact line.

Lines of the list the file already has (3):
- `/data/`: had by line 16, `/data/` (answer Q15).
- `__pycache__/`: had by line 1, `__pycache__/`.
- `.pytest_cache/`: had by line 5, `.pytest_cache/`.

## Draft 5: `code/LICENSE` (whole, new file)

```text
MIT License

Copyright (c) 2026 Axel Faes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## To go on

Confirm the code folder `code/`, or correct it. Then approve each of the five drafts, or correct a draft; a corrected draft is shown again with the corrections. On approval the mode writes `notes/next.md` first, then `README.md`, `code/README.md`, `code/.depositignore` and `code/LICENSE`. It moves no file of the project and writes nothing the approved drafts do not hold.