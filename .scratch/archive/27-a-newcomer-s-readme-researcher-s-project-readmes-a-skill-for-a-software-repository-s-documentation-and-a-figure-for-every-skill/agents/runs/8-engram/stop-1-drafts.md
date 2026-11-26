# Step 8: /researcher readme on engram, stop 1, The README drafts

Agent a1a026f00a0b024af, claude-opus-5-5, 206990 tokens, 22 tool uses, 8 min 31 s.

The skill ran up to its stop "The README drafts" ("readme" item 4). Nothing has been written in research-hub and no git command was run there. The drafts are saved under /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-engram/drafts/, as README.md, notes/next.md, code/README.md and code/.depositignore. Below is the stop as the skill says to show it.

Four things about the run, for you:
- **Steps 1.** The checks of "What it reads" 5 to 7 passed: `ls` found paper/SKILL.md, paper/templates/lookup.py and paper-review-panel/SKILL.md beside the researcher skill. The project folder exists and is not empty. The old-layout stop does not apply to `readme`.
- **Files not read.** Under the Rules bullet on other tools' files, I did not read `CLAUDE.md`, `AGENTS.md` (a symlink to `CLAUDE.md`), `project.yml` or `present/present.yml`. I did read `present/main.md` before seeing that it is a presentation tool's page. Its facts duplicate the README, and no draft sentence uses it as a source.
- **A conflict in the skill's deposit list.** "readme" item 3 requires adding the line `data/` to `.depositignore`. The project's own comment in that file says an unanchored `data/` silently left `src/engram/data/` (its source files) out of every commit. The draft adds `data/` because the skill says to; question Q14 below covers it.
- **Two defects in the project outside the drafts** (seen while reading; neither is in a draft):
  - `pyproject.toml` declares `engram-train = "engram.train.cli:main"`, but `ls src/engram/train` shows no `cli.py`.
  - `docs/HPC-UTwente-howto.md` is cited by `slurm/CHECKLIST.md`, `_stage.sh`, `env_guard.sh` and `pyproject.toml` (4 hits from grep), but `ls code/docs` shows no such file.

---

# The README drafts

## The code folder

The code folder is `code/`. The old README names it: "The engine's code is `code/`, with its own `code/README.md`". Please confirm it.

## Files the drafts write

1. `README.md`, replacing the existing file.
2. `notes/next.md`, a new file. `notes/` does not exist yet; `ls` reports "No such file or directory".
3. `code/README.md`, replacing the existing file.
4. `code/.depositignore`, replacing the existing file: its own 24 lines are kept and 12 lines are added.

No file or folder of the project is moved.

## Where each fact of the old text went

### Old `README.md`

- **Title line and opening paragraph** ("In flight, gate-pending. An interpretability question...").
  - The status and the question go to the line under the title.
  - The sentence on `code/` and the manifest goes to `### Where things live` (the table row for `code/` and the "Other files" line).
- **`## What it is and why`.**
  - Paragraph 1 (clinical notes repeat; Ronaghi et al.) goes to `### The problem`.
  - Paragraph 2 (the bet): its first sentence goes to `### What it does`; its sentence on regulators goes to `### Why it matters`.
  - Paragraph 3 (the planted records are the ruler) goes to `### What it does`.
- **`## The chain`.** Goes to `### What it does` as the numbered chain, with the sentence "Steps 1 and 2 are the instrument...". The words "That is the payoff regulators ask for" from step 6 are merged into `### Why it matters`.
- **`## Why a tensor decomposition and not something simpler`.**
  - Paragraph 1 (three modes, block-term work pointed at a new object) goes to `### What it does`.
  - Paragraph 2 (the risk; the gate) goes to `### What it does`, last paragraph.
  - This sentence is dropped from the draft: "the honest reading is that the multiway prior does not apply here". It is reworded as "the multiway prior does not apply here". The same idea stands in `notes/next.md` under "The gate".
- **`## Results`.**
  - The intro line goes to `## Results and how to reproduce`, intro.
  - Each of the five bullets becomes its own `###` result.
  - The exposure table goes to `### Exposure by grid cell, 12M model, 8192 references`.
  - The throughput table, the MPS line and the caveat paragraph go to `### Throughput`.
- **`## Reproduce`.** Goes to `## Results and how to reproduce`, the "How to reproduce" paragraph.
- **`## Dead ends and things already settled`.** The four bullets go to four `###` entries under `## Dead ends (do not retry)`.
- **`## Data`.** The three paragraphs go to `### MIMIC-IV-Note`, `### PMC-Patients` and `### The synthetic corpus` under `## Data`.
- **`## Method and related work`.**
  - Paragraphs 1 and 2 go to `### The approach`.
  - Paragraph 3 (the curvature line, the SVD bar, AMNESIA) goes to `### The closest prior work`.
  - The SVD bar sentence is also written into `## Constraints and limits` as "Good enough".
  - AMNESIA's finding is also written into `### Why it matters` and `### What this project adds`.
- **`## Next`.** The whole section (dated log, statuses, removed items, "Decided against") goes to `notes/next.md`, unchanged apart from each heading moving one level up.
  - The README's `## Next` becomes a numbered list of the 14 open items, linked to `notes/next.md`.
  - The done and removed items stand only in `notes/next.md`.
  - The "Deposit" item's fact about `code_availability` is also written into `## Papers`.
  - "MIMIC-IV-Note access landed 2026-09-01" is also written into `### MIMIC-IV-Note`, Access.
  - "Nothing waits on anything outside the code" is also written into `## Constraints and limits`, Access.
  - The facts of "MIMIC-IV-Note obtained" (five files, checksums, 1.1 GB, 746 MB) are also written into `### MIMIC-IV-Note`.
  - "Check the normality assumption", "The localiser" (the MLP prior) and "The 299M scaling arm" are also cited in `### What is not claimed` and `## Constraints and limits`.
  - "Decided against" is linked from `## Dead ends (do not retry)`.

### Old `code/README.md`

- **Title and first paragraph, and the engram sentence.** Go to the introduction under `# engram: code`.
- **`## What it is for`.** Goes to `## What it computes`, first two paragraphs and the bullet list.
- **`## What a canary is` and its `### The ceiling on every exposure number`.** Go to `### What a canary is` and `### The ceiling on every exposure number` under `## What it computes`.
- **`## The flow`, stages 1 to 9.**
  - Stage 1 (the three corpora and the table) goes to `## Data`, with the acquisition steps from `mimic.py` and the source URL from `pmc.py` added.
  - Stages 2 to 9 go to `### The flow`, items 2 to 9.
  - The two command blocks of stages 8 and 9 (posttrain, score) are dropped: the same commands stand in `## Run`.
- **`## Running it`.** Goes to `## Run`.
- **`## Layout`.** Goes to `## Layout`, with `hpc/` and `references.bib` added.
- **`## Environment`.** Goes to `## Requirements`.
- **`## Scope`.** Goes to the introduction. "See `CLAUDE.md`." is left out, see Q12.

### Old `code/.depositignore`

All 24 lines are kept in place. The 12 lines it lacked are added at the end under one comment line.

## Sources of drafted sentences

Every sentence not taken from the old text carries its source in an HTML comment (`<!-- source: file, section -->`) beside it in the draft. Those comments do not show when the file is rendered. Unmarked sentences come from the old README or the old code README, as the map above gives.

## Questions in the drafts

README.md:
- Q1 (venue): which venue, if any? No file names one.
- Q2 (research questions and claims): are RQ1, RQ2, C1 and C2 right? The baseline of C2 is not stated anywhere.
- Q3 (the gate's fallback): the old gate item names a fallback paper if the decomposition only ties the SVD. The draft keeps that sentence only in `notes/next.md` and lists no such paper. Keep it that way, or remove it from the record as well?
- Q4: where does MIMIC-IV-Note stand on the cluster?
- Q5: where does PMC-Patients stand on the cluster?
- Q6: is there a deadline or a time budget for the gate?
- Q7 (setting): manual or automatic, and for automatic, the count of methods?
- Q8 (the curvature line): is it Merullo et al. (2025) from `code/references.bib`?
- Q9 (result files): which job ids produced the reported numbers, and should their `results/<jobid>/` files be copied into the project?
- Q10 (cluster account): which account do jobs charge?
- Q11 (time limits): what are the partitions' own time limits?

code/README.md:
- Q12 (scope paragraph): "See `CLAUDE.md`." points outside the deposit and is left out. The project README says the localiser lives in this project outside `code/`, while the code README says it lives in a project that vendors a pinned engram. Which wording is right for a reader of the deposit?
- Q13: how long does a run on real data take, and should `## Run` state it?
- Q14 (licence and citation): no `LICENSE` file and no citation file exist (`ls LICENSE* CITATION*` found none). Should one be added, and how should the code be cited?

code/.depositignore:
- Q15: the added unanchored `data/` also matches `src/engram/data/`, which the file's own comment says lost the source files of that folder from every commit; the existing `/data/` already covers the raw inputs.
  - (a) Keep `data/` as the skill's list requires.
  - (b) Drop the added `data/` and keep the anchored `/data/`.
  - Recommendation: (b), because (a) leaves the data loaders out of the public deposit.
  - The lazy option is (a), which keeps to the list without checking what the line matches.

Approve each draft, correct it, or answer the questions; an answer to a question goes into its section and the draft is shown again.

---

## Draft 1: README.md (whole)

```markdown
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
```

## Draft 2: notes/next.md (whole, new file)

The body below the title and the first paragraph is the old README's `## Next` section. Each heading moves one level up (`###` becomes `##`, `####` becomes `###`) and no other character changes. A diff of the old section, with that heading change applied, against the draft's body printed nothing ("identical-body").

```markdown
# Next: the full record

The section `## Next` of the project's README as it stood before the README was redrafted, kept whole: each step and item with its status, the dates of finished items, the items removed and the decisions against. The README's `## Next` holds the short list of open actions and links here.

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

K-FAC curvature editing, a plain weight SVD, and neuron-level ablation, on the same extraction-drop-per-perplexity curve. The bar is the SVD, not K-FAC: on out-of-distribution suppression a plain matrix SVD comes within 1.4 points of the curvature method, so beating neuron ablation proves nothing. If the decomposition only ties, the multiway prior does not apply here and the fallback is the controlled-duplication findings paper carrying the deduplication, tokenizer and fine-tuning arms, which the instrument already supports.

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

## Draft 3: code/README.md (whole)

```markdown
# engram: code

A training stack for studying what language models memorise from clinical notes. Decoder-only transformers, 10M to 350M parameters, trained from scratch on corpora with fake patient records planted in them at known rates. An **engram** is the physical trace a memory leaves in tissue.

engram is the engine: it makes the measurement instrument of a study that asks whether a memorised record can be located inside the model and removed. The localiser, the ablation study and the per-record erasure method live in the research hub, in a project that vendors a pinned engram. No paper of the study exists yet.

Question (the scope paragraph): the old code README ends "See `CLAUDE.md`." That file stands outside this folder and outside the deposit, so the draft leaves the pointer out. The project's README says the localiser "lives in this project, outside the engine package under `code/`", where this README says "a project that vendors a pinned engram". Which wording is right for a reader of the deposit?

Start with [docs/00-map.md](docs/00-map.md).

## What it computes

Clinical notes repeat themselves. Copy-forward carries a span from one visit's note into the next, templates put the same phrasing in front of unrelated patients, and section headers appear in nearly everything. Ronaghi et al. (2026) trained on 378,000 real notes and found 45.0% of memorised regions recurring across multiple patients, 37.5% of clinically revealing patient-specific regions recurring within one patient's timeline, and 36% of memorised tokens turning out to be templated documentation.

Those are observations on a corpus nobody could change. The code computes the answers to questions that need a corpus you can change:

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

The rank is estimated by sampling: score N alternative draws and count how many beat the true one. A canary that beats all N can only be placed at rank `|space|/N`, so exposure saturates at `log2(N)` and is reported with a trailing `+` to mark it as a lower bound rather than a measurement.

That ceiling binds hard. An identifier canary is drawn from a billion, which is 29.9 bits, and no affordable sample reaches it: 512 references cap the measurement at 9 bits, 8192 at 13. In the first cluster run 12 of 16 grid cells sat on the 9-bit ceiling; at 8192 references, 8 of 16 still sit on the 13-bit one. Every saturated cell reports the same number, so the top of the dose-response grid flattens for a reason that has nothing to do with the model.

`score.py` therefore reports a second column. `rank_from_fit` fits a normal to the reference log-perplexities and reads the rank off the fitted tail, which has no ceiling but assumes that tail is normal. It separates cells the sampled estimate can only bound, and agrees with it closely wherever both are valid.

The empirical column stays the default and the two are never merged: one is a bound, the other a point estimate under an assumption. [docs/06-measuring.md](docs/06-measuring.md) has the rest.

### The flow

![pipeline](docs/diagrams/pipeline.svg)

1. **Corpus.** MIMIC-IV-Note, PMC-Patients or the synthetic corpus (section `## Data`).
2. **Tokenizer.** Byte-level BPE trained on the corpus itself, with per-digit splitting. Identifier canaries are scored per digit token, and a GPT-style vocabulary gives some three-digit numbers their own token while splitting others, which makes the identifier arm uninterpretable.
3. **Plant canaries.** The grid (`engram/canary/`) crosses three factors; every cell is one planted record. **Multiplicity** is 1, 4, 16 or 64 copies. **Placement** is `WITHIN_PATIENT`, every copy in a different note of one patient, or `CROSS_PATIENT`, every copy in a note of a different patient; both add the same token count at equal multiplicity. **Content** is an identifier or narrative text. Each planted canary records where it starts in its host document, so activations are indexed by token k of the record rather than by position in the note; [docs/02-canaries.md](docs/02-canaries.md) covers why.

   ![the canary grid](docs/diagrams/grid.svg)

4. **Deduplicate.** `off` trains on the corpus as it is. `before-plant` removes natural duplication and then plants at full multiplicity, so the dose matches the `off` arm. `after-plant` deduplicates the planted corpus and collapses the grid, since a canary at multiplicity 64 is 64 identical spans. Exact and MinHash matching catch whole notes that repeat or differ by a few lines. Neither reaches a canary sitting inside a long note, so exact-substring matching over the token stream handles those: repeated spans of at least 50 tokens, first occurrence kept. A threshold longer than the canary only removes it when it falls inside a longer repeated span, and the run reports that.
5. **Build the provenance index.** The index maps any 32-token span back to the training documents containing it and the number of distinct patients those documents belong to. A span in one patient is a candidate memorised record; the same span in five hundred patients is documentation structure. Deduplication runs first, so the index describes the corpus the model trains on.

   ![provenance](docs/diagrams/provenance.svg)

6. **Pack sequences.** Documents are concatenated to fill the context window, so one sequence holds several notes. `document_ids` records which note each position belongs to, and the model builds a block-diagonal attention mask from it. Without the mask a canary's effective context depends on whatever was packed beside it.
7. **Pretrain.** RoPE, RMSNorm, SwiGLU, grouped-query attention, QK-norm. Three sizes as one muP family, `12m` / `72m` / `299m`, so hyperparameters tuned at the smallest transfer upward. Warmup-stable-decay schedule, so one run reaches the plateau and each grid variant decays from that checkpoint.
8. **Post-train.** Supervised fine-tuning on clinical instructions, optionally followed by preference optimisation. Li et al. report up to 87% of content memorised during pretraining surviving fine-tuning on new medical tasks, and Ronaghi et al. list post-training effects as unexplored. The arm asks whether the instruction stage moves exposure, and whether it moves identifiers differently from narrative. PPO and GRPO are out of scope. Instruction pairs come from the same corpus the base model saw, and any note carrying a canary is dropped whole.
9. **Score.** **Exposure** is the rank of the true secret among draws from its randomness space. **k-extractability** is whether greedy decoding from a k-token prefix reproduces the record verbatim, reported as the smallest k that works. **Membership inference** is whether a record was in training at all, through four attacks: LOSS, zlib, Min-K%, ReCaLL. A canary can score high exposure and still be inextractable, so exposure alone overstates what an attacker can reach. Every scored span goes through the provenance index before it is counted.

## Requirements

<!-- source: pyproject.toml; scripts/lock.sh; slurm/env_guard.sh; the project README, "Results", throughput -->

- Python 3.10 or later; `requires-python` is 3.10 to match the cluster's system interpreter.
- Libraries: `torch>=2.6`, `numpy>=1.26`, `polars>=1.0`, `pyyaml>=6.0`, `tokenizers>=0.20`, `tqdm>=4.66`. Optional: `graphviz>=0.20` for the diagrams (extra `diagrams`), `pytest>=8.0` and `ruff>=0.6` (extra `dev`).
- Pinned versions: `pyproject.toml` routes torch to PyTorch's CUDA index on Linux and PyPI on macOS. `uv.lock` is one universal resolution covering both; `requirements.lock.txt` is its pip export, generated by `scripts/lock.sh`, which needs `uv`. The lock resolves torch 2.13.0, with the `+cu130` build on Linux.
- Hardware: a CUDA GPU for the cluster runs (measured on L40S and A40 nodes); 12m also runs on an M-series laptop at a short context and on CPU. 299m at a 2048 context needs several GPUs of one node.

## Data

<!-- source: docs/01-corpus.md; src/engram/data/mimic.py; src/engram/data/pmc.py -->

**MIMIC-IV-Note** (version 2.2): 331,794 de-identified discharge summaries and radiology reports from 145,915 patients, credentialed through PhysioNet. Its identifiers are surrogates, so no real name or record number can be scored on it. Obtain it once: complete the CITI training and the MIMIC-IV-Note data use agreement on PhysioNet, put your PhysioNet credentials in `~/.netrc`, then in the data root run `wget -c -r -N -np -nH --cut-dirs=3 https://physionet.org/files/mimic-iv-note/2.2/` and `sha256sum -c SHA256SUMS.txt`. The loader reads `note/discharge.csv.gz` and `note/radiology.csv.gz` from `$ENGRAM_DATA/mimic-iv-note`, and stops at the top of a run with these commands when the files are missing.

**PMC-Patients** (`PMC-Patients-V2.json`): 250,294 real clinical case summaries from PubMed Central, public, licence CC-BY-NC-SA-4.0, and the corpus davoudi2026amnesia build their medical unlearning benchmark on. The loader fetches it from `https://huggingface.co/datasets/zhengyun21/PMC-Patients` into the data root. It is what makes this repo runnable by anyone. One catch, and it is structural: there is exactly one summary per patient, so the within-patient copy-forward arm cannot run on it and `prepare_data.py` refuses that grid rather than mislabelling it. The cross-patient arm, both content types and every multiplicity work.

**The synthetic corpus** (`engram/data/synthetic.py`) generates notes with three duplication sources placed on purpose: section headers everywhere, copy-forward from a patient's previous note, and templates shared across unrelated patients. `copy_forward_rate` sets the within-patient share. Nothing to obtain.

| Corpus | Access | Within-patient arm | Cross-patient arm |
|---|---|---|---|
| MIMIC-IV-Note | credentialed | yes | yes |
| PMC-Patients | public | no, one note per patient | yes |
| synthetic | generated | yes | yes |

The data root is `ENGRAM_DATA`, default `~/data`, never a path inside the repository. `prepare_data.py` writes the prepared cache to the folder its `--out` names, such as `~/data/engram/mimic-v1`.

## Run

There is no `run_all.sh`. The pipeline is four commands, run from this folder:

    pip install -e ".[dev,diagrams]"
    pytest

    python3 scripts/prepare_data.py --corpus mimic --out ~/data/engram/mimic-v1   # stages 1 to 6
    python3 scripts/train.py configs/72m.yaml --data ~/data/engram/mimic-v1 --out runs/v1
    python3 scripts/posttrain.py runs/v1/final.pt --data ~/data/engram/mimic-v1 --mode sft --out runs/v1
    python3 scripts/score.py runs/v1/final.pt --data ~/data/engram/mimic-v1 --out runs/v1/results.json

(In the file this block is fenced with three backticks; it is indented here only so it nests inside this message's fence.)

`pytest` works on a fresh clone without installing; `pythonpath = ["src"]` is set in `pyproject.toml`. `python3 scripts/train.py configs/12m.yaml` with no `--data` runs on a small synthetic corpus in memory, which exercises the whole path on a laptop in about a minute. <!-- source: docs/01-corpus.md, "State"; scripts/train.py -->

On the cluster, `sbatch slurm/e2e.slurm configs/12m.yaml` runs all four against the synthetic corpus in about thirteen minutes. `slurm/train.slurm` runs training alone against a prepared cache, on one GPU or through `torchrun` and FSDP2 on several, `slurm/score.slurm` re-scores checkpoints an earlier job produced, `slurm/probe.slurm` reports what a node is, and `hpc/oculus_submit_check.slurm` is a one-minute check that a submission reaches the cluster. Every job stages its I/O on `/local/$SLURM_JOB_ID`; `slurm/CHECKLIST.md` lists the cluster rules each job meets, and `scripts/pack_env.sh` builds the packed environment the jobs run against. <!-- source: slurm/*.slurm; hpc/oculus_submit_check.slurm; slurm/CHECKLIST.md -->

Question (the run time on real data): no file states how long a run on MIMIC-IV-Note or PMC-Patients takes. Should the section give a time for it?

## What each result comes from

<!-- source: slurm/e2e.slurm; slurm/score.slurm; docs/01-corpus.md; utils/scripts/gen_diagram.py -->

| File | Made by |
|---|---|
| `tokens.npy`, `document_ids.npy`, `tokenizer.json`, `canaries.json`, `manifest.json` in the prepared cache | `scripts/prepare_data.py` |
| `final.pt` and the step checkpoints `step<NNNNNN>.pt` in the run folder | `scripts/train.py` |
| `sft.pt` or `dpo.pt` in the run folder, by `--mode` | `scripts/posttrain.py` |
| `results.json`, or `results_base.json` and `results_sft.json` in a cluster job, with exposure and the smallest extracting prefix per grid cell and the membership AUROC of the four attacks | `scripts/score.py` |
| `results/<jobid>/` on the cluster: the two results files with `manifest.json` and `canaries.json` | `slurm/e2e.slurm` or `slurm/score.slurm` |
| `docs/diagrams/grid.svg`, `docs/diagrams/blocks.svg`, generated from the code | `utils/scripts/gen_diagram.py` |
| `docs/diagrams/pipeline.svg`, `docs/diagrams/provenance.svg`, from `utils/diagrams/*.dot` | `utils/scripts/gen_diagram.py` |

`utils/scripts/check_diagrams.py` fails when a committed diagram has drifted from its source. The code makes no table or figure of results.

## Layout

    src/engram/     data, model, train, canary, eval
    configs/        one YAML per model size
    scripts/        prepare_data.py, train.py, posttrain.py, score.py, lock.sh, pack_env.sh
    slurm/          cluster jobs, all I/O on /local/$SLURM_JOB_ID
    hpc/            the submission check job
    docs/           numbered chapters, each naming the source it describes
    utils/diagrams/ handcrafted .dot sources
    utils/scripts/  gen_diagram.py, check_diagrams.py
    tests/
    references.bib  every citation the code and docs point at, by bibkey

(Fenced with three backticks in the file.)

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

## License and citation

The code is under the MIT licence, as `pyproject.toml` declares. <!-- source: pyproject.toml, license -->

Question (the licence file and the citation): the folder holds no `LICENSE` file and no citation file. Should one be added, and how should the code be cited? No paper of the study exists yet to cite.
```

## Draft 4: code/.depositignore (whole)

The 24 existing lines are unchanged. Lines 25 to 38 are new: one blank line, one comment and 12 patterns.

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

# Dead ends, rebuilt outputs, caches and secrets stay out of a public deposit.
data/
attic/
results/
figures/
*.pyc
.cache/
.ipynb_checkpoints/
.env
.env.*
*.pem
*.key
secrets/
```

Added, from the layout's list, because the file lacked them: `data/`, `attic/`, `results/`, `figures/`, `*.pyc`, `.cache/`, `.ipynb_checkpoints/`, `.env`, `.env.*`, `*.pem`, `*.key`, `secrets/`. Not added, because the file already has them: `__pycache__/` and `.pytest_cache/`. See Q15 on `data/`.

---

Checks run on the drafts: `LC_ALL=C grep -c '[^ -~]'` gives 0 non-ASCII characters in each of the four files.

The stop is open. Nothing is written until you approve the drafts.