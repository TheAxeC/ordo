# engram

An interpretability project on clinical language models: when a model has memorised a patient's record, where in the weights that record sits, and whether it can be removed without wrecking the model. Status: in flight, gate-pending; the measurement instrument is built and cluster-verified, and the gate that decides whether the project is real has not been run. Venue: not set.

Question (venue): which venue, if any, is the project aimed at? No file of the project names one.

## In short

Clinical notes repeat themselves, so a language model trained on them memorises some records. This project plants fake patient records into a corpus at known rates, trains small models from scratch on it, and asks whether a multiway decomposition of the models' MLP activations finds the components that carry one memorised record. If ablating those components removes the record at a small cost in perplexity, and does so better than a plain weight SVD, the same components support erasing one real patient's records. Steps 1 and 2 of the chain below, the instrument, are built; steps 3 to 6, the contribution, are not written.

## What it is and why

### The problem

Clinical notes repeat themselves. Copy-forward carries a span from one visit's note into the next, templates put the same phrasing in front of unrelated patients, and section headers appear in nearly everything. Ronaghi et al. (2026) trained on 378,000 real notes and found 45.0% of memorised regions recurring across multiple patients and 36% of memorised tokens turning out to be templated documentation. Those are observations on a corpus nobody could change.

### Why it matters

Removing one patient's records from a trained model is the thing regulators ask for, and no current method does it well. AMNESIA (Davoudi et al., 2026) finds that unlearning one patient erodes the model's knowledge of other patients with the same condition, so a method that separates one record from the shared clinical knowledge around it would remove the patient without damaging what the model knows about the condition.

### What it does

The bet is that a memorised record is not smeared uniformly across the weights, and that a multiway decomposition can find the components carrying it, because those components have the structure a decomposition is good at: the same content, at the same canary-relative position, across many examples drawn from one template. That is three modes with real shared structure, the existing block-term work pointed at a new object. If that holds, the same components support targeted erasure of one patient.

The planted fake records are the ruler, not the subject. Without them, "was this memorised" is a judgement call. With them, the memorised set is known before training starts, so a localisation claim can be scored instead of argued.

The chain:

1. Plant records at controlled duplication rates. Ground truth established.
2. Train small models from scratch, so that ground truth holds exactly.
3. Decompose the MLP activation tensor over (example, canary-relative position, neuron), contrasting inputs carrying a memorised record against matched inputs that do not. Out comes a ranked set of candidate components.
4. Ablate them. Does extraction of that record drop, and at what cost in perplexity? This is the causal test, and it is what separates a real localisation from a correlation.
5. Compare against K-FAC curvature editing, a plain weight SVD, and neuron-level ablation. If the multiway structure buys nothing over a matrix method, the project has no lead.
6. Erase. If the components are real, remove one actual patient's records and verify with the same metrics.

Steps 1 and 2 are the instrument and are built. Steps 3 to 6 are the contribution and none of it is written.

The risk is the same structure: if memorisation is smeared rather than structured, the decomposition finds nothing, and the multiway prior does not apply here. That is what the gate (step 5) is for.

## Research questions and claims

<!-- source: drafted from the old README, "What it is and why", "The chain" and "Method and related work"; no file of the project states research questions or claims in this form -->

- RQ1: When a small decoder-only model trained from scratch on clinical notes has memorised a planted record, do the components of a multiway decomposition of its MLP activations over (example, canary-relative position, neuron) carry that record?
- RQ2: Can those components remove one real patient's records from the model while the model keeps what it knows about other patients with the same condition?

- C1: Ablating the components the decomposition ranks drops extraction of the target record more per unit of perplexity cost than the baselines.
  - Result that would show it: the extraction-drop-per-perplexity curve of the decomposition above that of the plain weight SVD, on the 72M model.
  - Baseline: a plain weight SVD (the bar), K-FAC curvature editing and neuron-level ablation.
  - Metric: extraction drop against perplexity cost, reported as a curve.
  - Novelty page: none.
- C2: Removing the components step 5 validated erases one actual patient's records.
  - Result that would show it: extraction metrics and a keyword-leakage score of that patient's records fall, and retention on patients sharing a condition holds.
  - Baseline: not stated in the project's files.
  - Metric: the extraction metrics of scoring, a keyword-leakage score, and retention on patients sharing a condition.
  - Novelty page: none.

Question (research questions and claims): are RQ1, RQ2, C1 and C2 the research questions and claims as you hold them? The old README states the bet and the chain but no research question in words. The baseline of C2 is not stated anywhere; the unlearning methods AMNESIA evaluates (RMU, GradDiff, KL-Min, SimNPO) are a candidate.

Question (the gate's fallback): the old README's gate item says that if the decomposition only ties the SVD, the fallback is a controlled-duplication findings paper carrying the deduplication, tokenizer and fine-tuning arms. This draft keeps that sentence only in `notes/next.md`, as part of the record, and lists no such paper as a claim or in `## Papers`. Keep it that way, or remove the sentence from the record as well?

## Data

### MIMIC-IV-Note

- Source: PhysioNet, `https://physionet.org/files/mimic-iv-note/2.2/`. <!-- source: code/src/engram/data/mimic.py, ACQUISITION -->
- Version: 2.2. <!-- source: code/src/engram/data/mimic.py, ACQUISITION -->
- Access: credentialed through PhysioNet, under a data use agreement separate from MIMIC-IV, with the CITI training. Obtained 2026-09-01: all five files downloaded and their checksums verified against PhysioNet's manifest, 1.1 GB of discharge summaries, 746 MB of radiology, both detail files.
- What it holds: 331,794 de-identified discharge summaries from 145,915 patients. Its identifiers are surrogates, so only planted canaries can be scored on it.
- Local path: `~/data/mimic-iv-note`, read as `note/discharge.csv.gz` and `note/radiology.csv.gz`; the root is `ENGRAM_DATA`, with `~/data` as its default. <!-- source: code/docs/01-corpus.md, "MIMIC"; code/src/engram/data/mimic.py -->
- Cluster path: not stated. Question: where does MIMIC-IV-Note stand on the cluster? The job scripts' examples read a prepared cache at `~/data/engram/mimic-v1`. <!-- source: code/slurm/train.slurm -->
- Why it was chosen: it is the realistic corpus and the one the gate needs, and it has several notes per patient, so the within-patient (copy-forward) arm can run on it.

### PMC-Patients

- Source: `https://huggingface.co/datasets/zhengyun21/PMC-Patients`, file `PMC-Patients-V2.json`. <!-- source: code/src/engram/data/pmc.py, SOURCE and FILENAME -->
- Version: V2. <!-- source: code/src/engram/data/pmc.py, FILENAME -->
- Access: public, licence CC-BY-NC-SA-4.0, so the loader fetches it rather than vendoring it.
- What it holds: 250,294 real clinical case summaries from PubMed Central case reports.
- Local path: under `ENGRAM_DATA`, default `~/data`. <!-- source: code/src/engram/data/pmc.py, data_root -->
- Cluster path: not stated. Question: where does PMC-Patients stand on the cluster, if it is there?
- Why it was chosen: it makes the repository runnable by someone without credentials. It covers the cross-patient arm, both content types and every multiplicity. It cannot support the within-patient arm: it has exactly one summary per patient, so there is no previous note to copy forward from.

### The synthetic corpus

- Source: generated by `code/src/engram/data/synthetic.py`.
- Version: the generator of the code; a corpus is fixed by its seed and arguments. <!-- source: code/docs/02-canaries.md, "Planting is deterministic"; code/slurm/score.slurm -->
- Access: none needed.
- Local path and cluster path: none; it is generated in the job, on `/local/$SLURM_JOB_ID` on the cluster. <!-- source: code/slurm/e2e.slurm -->
- Why it was chosen: a `copy_forward_rate` knob covers the whole grid on text nobody needs permission for, and it is what the smoke path uses.

## Method

### The approach

Small decoder-only models, 12M to 299M parameters, trained from scratch as one muP family, with canaries planted on a grid crossing multiplicity (1, 4, 16, 64), placement (within-patient against cross-patient) and content (identifier against narrative). Scoring is exposure, k-extractability and four membership-inference attacks, with every measured span checked against a provenance index so that templated boilerplate is not counted as a leaked record.

The localiser is the contribution and is not written. It decomposes the MLP activation tensor over (example, canary-relative position, neuron), contrasting canary inputs against matched non-canary ones, and is judged by extraction drop per unit of perplexity cost against three baselines: K-FAC curvature editing, a plain weight SVD, and neuron-level localisation. No campaign of the localiser has run.

### What is not claimed

- Every number in `## Results and how to reproduce` is a check of the instrument, from a 12M model on a synthetic corpus, one canary per cell, one seed; none is a research finding.
- A high exposure on a planted canary says the model memorised that canary, not that a real record would be disclosed. <!-- source: code/docs/06-measuring.md, "What exposure does not say" -->
- The fitted exposure estimator assumes the reference log-perplexities are normal, and that assumption has not been checked on a real reference distribution. <!-- source: old README, "Next", "Check the normality assumption under the fitted estimator" -->
- A model in the 10M to 350M band memorises little at a single occurrence, so claims about erasure scope to the duplicated cells unless multiplicity 1 shows real exposure. <!-- source: code/docs/02-canaries.md -->
- Starting with the MLP activation tensor is a prior about where to look, not evidence about where memorised text sits; the residual stream is captured too. <!-- source: old README, "Next", "The localiser"; code/docs/04-model.md -->

## Constraints and limits

- Good enough: the decomposition beats the plain weight SVD on the extraction-drop-per-perplexity curve. Beating neuron ablation alone proves nothing, since on out-of-distribution suppression a plain matrix SVD comes within 1.4 points of the curvature method. <!-- source: old README, "Next", "The gate" -->
- Storage: a standard 48 GB memory allocation per job; the provenance index of MIMIC discharge is projected at about 27 GB peak and 13.3 GB on disk, a projection from a linear fit and not a measurement. <!-- source: code/docs/03-provenance.md; code/slurm/*.slurm --mem=48G -->
- Compute: the cluster's `main-gpu` partition, one GPU per job for 12M and 72M; 299M needs FSDP2 across several GPUs of one node, which has never run on more than one GPU. <!-- source: code/slurm/train.slurm; old README, "Next", "The 299M scaling arm" -->
- Time: not stated. Question: is there a deadline or a time budget for the gate?
- Access: MIMIC-IV-Note is credentialed and obtained; PMC-Patients is public; the synthetic corpus needs nothing. Nothing waits on anything outside the code.
- Setting: not stated. Question: manual (stop at each result that does not beat the baseline) or automatic (try methods until one beats the baseline, up to a count of methods you give)?

## Related work

### The closest prior work

<!-- source: old README, "Method and related work"; no novelty page exists in the project -->

No novelty page has been made for this project.

The closest existing work is the curvature line, which already does localisation plus removal and beats a supervised unlearning baseline, and where a plain SVD comes within 1.4 points of it on out-of-distribution suppression. That SVD result sets the bar: the decomposition has to beat a matrix baseline that already matches the state of the art, not just beat neuron ablation.

Question (the curvature line): which work is "the curvature line"? `code/references.bib` holds Merullo et al. (2025), "From Memorization to Reasoning in the Spectrum of Loss Curvature", under localisation and removal; is that the work meant?

AMNESIA (Davoudi, Iranmanesh, Frieder, Goharian, arXiv 2605.30599, v1 2026-05-28) is a benchmark rather than a method: 70,560 question-answer pairs from 8,820 PMC-Patients-v2 notes across 11 disease categories, used to evaluate RMU, GradDiff, KL-Min and SimNPO at random-patient and disease level. It does not localise anything, because every method it tests edits a fixed layer 7. Its headline finding is the one this project has to answer: unlearning one patient erodes knowledge of other patients with the same condition.

### What this project adds

None yet: no result of the localiser exists. The gap the project aims at is the one AMNESIA names, a localiser that separates a record from the shared clinical knowledge around it.

## Results and how to reproduce

Instrument only. Nothing below is a research finding: every number is from a 12M model on a synthetic corpus, one canary per cell, one seed. None of them is compared with a baseline, since they check the measurement and not the research question.

Question (result files): no result file stands in the project. The job `code/slurm/e2e.slurm` copies its results to `results/<jobid>/` under the folder it is submitted from on the cluster (`~/projects/engram`), and its weights to `~/models/engram/<jobid>/`. Which job ids produced the numbers below, and should their result files be copied into the project? <!-- source: code/slurm/e2e.slurm, "stage out" -->

How to reproduce, for every result below: from `code/` on the cluster, `sbatch slurm/e2e.slurm configs/12m.yaml` runs the four commands `prepare_data.py`, `train.py`, `posttrain.py` and `score.py` against the synthetic corpus in about thirteen minutes, at 8192 reference candidates by default. The environment is pinned by `uv.lock` and a hash-pinned pip export, and jobs stage all I/O on `/local/$SLURM_JOB_ID`.

### The pipeline runs end to end on the cluster

Nine stages, 102 tests, FSDP2 sharding exercised across two ranks. Result file: none in the project. Baseline: not applicable.

### Sampled exposure has a ceiling at log2(N) references

Against a 29.9-bit identifier space, at 512 references 12 of 16 grid cells sat on the ceiling; at 8192, 8 of 16 still do. The 512-reference run is `sbatch slurm/e2e.slurm configs/12m.yaml 2000 4000 512`. <!-- source: code/slurm/e2e.slurm, argument order --> Result file: none in the project. Baseline: not applicable.

### The fitted estimator resolves every pinned cell

Fitting a normal to the reference log-perplexities resolves every pinned cell, agrees with the sampled value to 0.06 bits where both are valid, and reveals an identifier dose-response that sampling reported as flat: 3.2, 15.8, 21.3, 25.8 bits at 1, 4, 16 and 64 copies. Result file: none in the project. Baseline: not applicable.

### Identifiers memorise harder than narrative

At matched dose, 25.8 to 26.8 bits at 64 copies for identifiers against 12.0 to 12.5 for free text. Result file: none in the project. Baseline: not applicable.

### Instruction tuning moves exposure little

Instruction tuning moves exposure by under 0.3 bits in all 16 cells, matching the published result that memorisation survives fine-tuning. Result file: none in the project. Baseline: not applicable.

### Exposure by grid cell, 12M model, 8192 references

The empirical column is a bound and the fitted column is a point estimate under a normality assumption. They are not interchangeable and must not be plotted on one axis. The last row is the check rather than the finding: where the empirical estimator still has resolution, the two agree to 0.06 bits.

| Cell | Copies | Empirical | Fitted |
|---|---|---|---|
| mrn.m64.cross_patient | 64 | 13.00+ | 26.81 |
| mrn.m16.cross_patient | 16 | 13.00+ | 25.27 |
| mrn.m4.cross_patient | 4 | 13.00+ | 15.95 |
| mrn.m1.cross_patient | 1 | 4.92 | 4.98 |

Result file: none in the project. Baseline: not applicable.

### Throughput

Sequence length 512, bf16, vocabulary forced to 32000. 274k tok/s at 12M on an L40S, 145k on an A40, 74k at 72M.

| Config | Parameters | tok/s | Node |
|---|---|---|---|
| 12M | 12.4M | 274,300 | L40S |
| 12M | 12.4M | 145,351 | A40 |
| 72M | 72.1M | 73,851 | L40S |

Apple MPS runs 12M at 5,974 tok/s.

Two things make these numbers incomparable if read carelessly. Vocabulary size: the synthetic corpus reaches 547 token types, which makes the output projection 3% of the work instead of 66%, so a run measured on it is 2.5x faster than the table; `train.py --vocab-size 32000` builds the model at the real size regardless of the corpus. The timed region is the whole training call, covering every optimiser step plus eleven evaluation passes, any checkpoint writes, and first-use kernel compilation, which is minor on CUDA and large on MPS. A short MPS run is dominated by compilation: the same model timed over its inner loop alone, after a warmup, runs about 2.3x faster than the figure above. Repeated runs of one configuration vary by up to 1.5x, since cluster nodes are shared.

Result file: none in the project. Baseline: not applicable.

## Papers

None yet. The code deposit waits on a manuscript: `code_availability` in the hub manifest is `none`, and becomes `deposited` with a URL and a Zenodo DOI when there is something to deposit against.

## Dead ends (do not retry)

These are choices of the instrument that were tried or settled, not methods that failed to beat a baseline; none has a folder in `code/attic/`, which does not exist. The decisions against, recorded so they are not re-argued, are in [notes/next.md](notes/next.md), section "Decided against".

### Raising the reference-candidate count to fix exposure saturation

Folder in `code/attic/`: none. Raising the count does not solve exposure saturation: 512 to 8192 is a 16x compute increase for 4 bits, and it left half the grid pinned. The identifier space is 29.9 bits and no affordable sample reaches it. The parametric fit is the only route past it, which is what Carlini's original paper (the Secret Sharer) does.

### Document-level deduplication against a canary

Folder in `code/attic/`: none. Document-level deduplication does not touch a canary, because one planted line inside a long note does not make its host a near-duplicate of anything. Exact-substring matching over the token stream is the half that reaches it, and the literature default threshold of 50 tokens is longer than the canaries, which makes the mitigation look weak for reasons unrelated to the model.

### A dictionary-backed provenance index

Folder in `code/attic/`: none. It does not scale: 190 MB and 10 s per million tokens means 158 GB for MIMIC against a 48 GB allocation. Replaced by a sorted posting table.

### PMC-Patients for the within-patient arm

Folder in `code/attic/`: none. PMC-Patients cannot support the within-patient arm at all. It has exactly one summary per patient, so there is no previous note to copy forward from, and keying on the article identifier would silently relabel the cross-patient condition.

## Next

In the order of the chain. The full record, with each step's status, the dates of finished items, the items removed and the decisions against, is in [notes/next.md](notes/next.md).

1. Verify the provenance index at full MIMIC scale, at increasing corpus fractions, recording where memory goes. Not blocked. Hours.
2. Replicates across seeds, so that each grid cell has more than one canary on one seed. Not blocked. Hours at 12M.
3. Check the normality assumption of the fitted estimator on a real reference distribution. Not blocked. Half a day.
4. Train 72M on real clinical notes. Blocked on item 1. A day.
5. The 299M scaling arm. Blocked on item 4. Days.
6. The localiser (step 3 of the chain). Blocked on step 2. Weeks.
7. The ablation harness (step 4). Blocked on item 6. Days.
8. The gate (step 5). Blocked on item 7. Weeks.
9. Targeted unlearning (step 6). Blocked on the gate opening. Weeks.
10. Off the chain: a documented small-scale path that does not assume SLURM. In progress. Hours.
11. Off the chain: an optional external-instruction loader (Alpaca or GSM8K), marked as not for the measurement. Not blocked. A day.
12. Off the chain: a third corpus with real patient timelines, for the within-patient arm. Not blocked.
13. Off the chain: the federated arm. Not blocked.
14. Off the chain: the code deposit. Blocked on a manuscript.

## Working state

### The stage and campaign that stand

No stage of `/researcher research` stands: the project was not started by it. In the project's own chain, steps 1 and 2 (plant, train) are in progress with the open items 1 to 5 of `## Next`, and steps 3 to 6 are not started. No job is recorded as submitted and not yet read.

### Where things live

<!-- source: the project's file tree; the old README, opening paragraph -->

| Folder of the layout | This project |
|---|---|
| `code/` | `code/`, the engine package, with its own `code/README.md` |
| `code/run_all.sh` | none; the four commands of `code/scripts/` and the job `code/slurm/e2e.slurm` |
| `code/paper.py` | none |
| `code/core/` | `code/src/engram/` |
| `code/experiments/` | none; the localiser is not written |
| `code/hpc/` | `code/slurm/` for the pipeline's jobs, and `code/hpc/` for one submission check |
| `code/data/` | none; raw inputs under `ENGRAM_DATA` (default `~/data`), prepared caches under `~/data/engram/<name>` |
| `code/results/` | none in the project; jobs write `results/<jobid>/` on the cluster |
| `code/figures/` | none; `code/docs/diagrams/` holds the documentation's diagrams |
| `code/attic/` | none |
| `code/.depositignore` | `code/.depositignore` |
| `manuscript/` | none |
| `admin/` | none |
| `notes/` | `notes/` |
| `reviews/` | none |
| `logs/` | none in the project; jobs write `logs/` on the cluster |

Other files of the project: `project.yml`, the hub manifest, which is the portfolio entry; `present/`, the project's presentation page.

### Cluster facts

<!-- source: code/slurm/*.slurm, code/slurm/_stage.sh, code/slurm/env_guard.sh, code/slurm/CHECKLIST.md, code/scripts/pack_env.sh, code/hpc/oculus_submit_check.slurm -->

- Scheduler: SLURM.
- Partitions: `main-gpu` for the pipeline's jobs, `main-cpu` for the submission check.
- Account: not stated. Question: which account, if any, do jobs charge?
- Modules: none; jobs run the node's system `/usr/bin/python3` (3.10.12 on the `main-gpu` nodes) with `PYTHONPATH` pointed at a packed environment, `~/envs/engram_env.tgz`, built by `scripts/pack_env.sh` and extracted once per node to `/local/$USER/engram`.
- Excluded node: `ctit088`, Ubuntu 24.04 with Python 3.12.3.
- Scratch storage: `/local/$SLURM_JOB_ID`, made and removed by each job; `TMPDIR` set under it.
- Time limits: the jobs request 2 hours (`e2e`), 1 hour (`score`), 24 hours (`train`), 5 minutes (`probe`) and 1 minute (the submission check). Question: what are the partitions' own time limits?
- Project folder on the cluster: `~/projects/engram`, from which jobs are submitted; logs go to its `logs/%x_%j.out`, results to its `results/<jobid>/`, weights to `~/models/engram/<jobid>/`.
- GPUs seen: L40S and A40.
