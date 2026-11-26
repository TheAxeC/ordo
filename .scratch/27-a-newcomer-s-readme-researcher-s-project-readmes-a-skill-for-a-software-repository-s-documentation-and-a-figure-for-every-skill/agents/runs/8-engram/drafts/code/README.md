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

```
pip install -e ".[dev,diagrams]"
pytest

python3 scripts/prepare_data.py --corpus mimic --out ~/data/engram/mimic-v1   # stages 1 to 6
python3 scripts/train.py configs/72m.yaml --data ~/data/engram/mimic-v1 --out runs/v1
python3 scripts/posttrain.py runs/v1/final.pt --data ~/data/engram/mimic-v1 --mode sft --out runs/v1
python3 scripts/score.py runs/v1/final.pt --data ~/data/engram/mimic-v1 --out runs/v1/results.json
```

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

```
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
```

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
