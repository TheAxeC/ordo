# Step 8: the answers to the engram run's questions, looked up

Agent ad3cfbb8d27ee411e, claude-opus-5-5.

Lookup report for the engram README run (questions Q1 to Q14). I changed nothing anywhere. All paths below are under /Users/axelfaes/workspace/research-hub/ unless they are absolute. Every quote comes from a grep, cat -n, sed -n or git show run in this session. I did not reach the cluster: there was no ssh, so anything that exists only on the cluster is marked "not verified".

Context that bears on several answers:
- `projects/active/engram/notes/` does not exist (`ls notes` prints "No such file or directory"). The only "notes/next.md" is the run's own draft at /Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/runs/8-engram/drafts/notes/next.md.
- The project's git history goes back to commit de3c2e18a (2026-09-25, "Fold engram into the hub as projects/ideas/engram"), which says: "Copy engram's 86 tracked files: the engine into code/ ... Put engram's CLAUDE.md ... at the project root, rewritten where the move made them false". code/README.md was copied over with the engine; the commit lists only the project-root files as rewritten. This matters for Q12.

## Q1 venue

The answer is ICLR. A file does name it, so the draft's "No file of the project names one" is wrong.
- `projects/active/engram/project.yml:15`: `venue: iclr`
- It was set in commit 4416e4236 (2026-11-14, "Give every pipeline project a target venue"). The diff is `-venue:` / `+venue: iclr` in projects/ideas/engram/project.yml.
- The venue registry entry, `.oculus/data/research/venues.yml:782-800`, contains `name: ICLR`, `id: iclr` and `timing: "abstracts 2026-09-18 | full papers 2026-09-25 (ICLR 2027) | held 2027-04-26 to 04-28"`, `deadline: "2026-09-18"`.
- Note: that registered deadline (2026-09-18) had already passed when the venue was set (2026-11-14), and it is before today (2026-11-26). Read literally, the registry entry points at a cycle that is closed (see Q6).

## Q2 RQ1, RQ2, C1, C2, and C2's baseline

No file states research questions or claims in RQ/C form. The draft's own source comment says so. Here is what the files support for each item.

- **RQ1** (do the decomposition's components carry the record) matches these lines:
  - `README.md:11`: "The bet is that a memorised record is not smeared uniformly across the weights, and that a multiway decomposition can find the components carrying it ..."
  - `README.md:19`: "**Decompose** the MLP activation tensor over (example, canary-relative position, neuron), contrasting inputs carrying a memorised record against matched inputs that do not."
  - `code/README.md:18`: "whether a memorised record can be located inside the model and removed."
  - Supported.
- **RQ2** (remove one patient while keeping what the model knows about other patients with the same condition) matches these lines:
  - `README.md:189`: "Remove one actual patient's records using the components step 5 validated, and verify with the same extraction metrics plus a keyword-leakage score, checking retention on patients sharing a condition."
  - `README.md:92`: "unlearning one patient erodes knowledge of other patients with the same condition, so a localiser that separates a record from the shared clinical knowledge around it is exactly the gap AMNESIA names."
  - Supported.
- **C1** is supported by `README.md:182` ("K-FAC curvature editing, a plain weight SVD, and neuron-level ablation, on the same extraction-drop-per-perplexity curve. The bar is the SVD, not K-FAC ...") and by `code/configs/72m.yaml:1-2` ("The gate model. The minimal experiment that decides whether the multiway localiser beats the curvature and SVD baselines runs at this size.").
  - One wording difference: `project.yml:18` has the decomposition beat both, "test whether a block-term decomposition ... beats K-FAC curvature editing and a plain SVD", while README.md:182 makes the SVD alone the bar. The draft's "more ... than the baselines", with the SVD as the bar, fits both lines.
- **C2** is supported by README.md:189 (quoted under RQ2).
- **C2's baseline: no file holds it.**
  - Searched: README.md, project.yml, present/main.md, CLAUDE.md, code/README.md, code/docs/*.md, code/configs/*.yaml and code/references.bib. The bib entry keys (grep `^@`) include no unlearning-method paper (no RMU, GradDiff, NPO or SimNPO entry).
  - Proposal: the unlearning methods AMNESIA evaluates, RMU, GradDiff, KL-Min and SimNPO. The evidence is `README.md:92`: "used to evaluate RMU, GradDiff, KL-Min and SimNPO at random-patient and disease level ... every method it tests edits a fixed layer 7."
  - It is also reasonable (my judgment) to add the step 5 baselines (K-FAC editing, weight SVD), because Merullo et al. already do localisation plus removal (README.md:92: "the curvature line, which already does localisation plus removal and beats a supervised unlearning baseline").

## Q3 the gate item's fallback paper

The old README and the presentation slide both name a controlled-duplication findings paper as the fallback. No notes file exists.
- `README.md:182`: "If the decomposition only ties, the multiway prior does not apply here and the fallback is the controlled-duplication findings paper carrying the deduplication, tokenizer and fine-tuning arms, which the instrument already supports."
- `present/main.md:21`: "Instruction tuning moves exposure under 0.3 bits in all 16 cells; if the decomposition only ties the SVD, the fallback is a duplication findings paper."
- Notes: there are none (`notes/` does not exist). The run's draft notes/next.md:91 copies README.md:182 word for word.
- The README's other uses of "honest reading" (README.md:30) are in the "Why a tensor decomposition" section, not in the gate item.
- Note for the orchestrator: the slide at present/main.md:21 also carries the fallback, and the drafts do not cover it.

## Q4 MIMIC-IV-Note on the cluster

The cluster path is `~/data/mimic-iv-note`, the same as on the Mac. No file says whether the files are actually present on the cluster.
- `.oculus/data/research/data.yml:19` (schema of the path field): "The dataset's folder, the same on this Mac and on the cluster, under ~/data; Recover fetches into it."
- `.oculus/data/research/data.yml:120`: `path: "~/data/mimic-iv-note"`
- `.oculus/data/research/data.yml:121`: `access: credentialed`
- `.oculus/data/research/data.yml:8`: "LOCATION RULE, local and cluster alike: every dataset lives under ~/data/<dataset>, one subfolder each, and nothing else."
- `code/docs/01-corpus.md:25`: "`engram/data/mimic.py` reads `note/discharge.csv.gz` and `note/radiology.csv.gz` from `~/data/mimic-iv-note`, resolved from `ENGRAM_DATA` with that default".
- Access status, `README.md:123`: "All five files down and checksums verified against PhysioNet's manifest: 1.1 GB of discharge summaries, 746 MB of radiology, both detail files. Access is a separate agreement from MIMIC-IV". No machine is named.
- On this Mac, `ls ~/data` lists no `mimic-iv-note` folder.
- Proposal: write "Cluster path: `~/data/mimic-iv-note` (the registry's rule; one path on both machines); access credentialed through PhysioNet, obtained 2026-09-01". Since the Mac has no copy, the download most likely sits on the cluster. That is an inference; `ssh utwente ls ~/data/mimic-iv-note/note` would settle it.

## Q5 PMC-Patients on the cluster

The cluster path is `~/data/pmc-patients`. No file says whether the file is present there.
- `.oculus/data/research/data.yml:99`: `path: "~/data/pmc-patients"`
- `.oculus/data/research/data.yml:100`: `access: open`
- `.oculus/data/research/data.yml:103`: "No credentials. Licence CC-BY-NC-SA-4.0, so it is fetched into ~/data and never vendored into a repository. `engram/data/pmc.py` reads ~/data/pmc-patients/PMC-Patients-V2.json ..."
- `data.yml:98` gives the size: `size: "837 MB (single JSON array)"`.
- On this Mac, `ls ~/data` lists no `pmc-patients` folder. No file records a download on either machine; the README only records the loader (README.md:115-118, "PMC-Patients loader (done)").
- Proposal: "Cluster path: `~/data/pmc-patients/PMC-Patients-V2.json`, fetched by the loader's acquisition command; whether it has been fetched is not recorded." The same ssh `ls` would settle it.

## Q6 deadline or time budget for the gate

No file gives the gate a deadline or a time budget. Files searched: README.md, project.yml, present/main.md, CLAUDE.md, code/README.md, code/docs, docs/AGENT-APPROACH.md, docs/RESEARCH-APPROACH.md and CONTEXT.md (grep for deadline, budget and engram).
- The only effort sizes are per item:
  - `README.md:180`: "Open. Blocked on step 4. Weeks." (the gate)
  - README.md:164 (localiser): "Weeks."
  - README.md:173 (ablation): "Days."
- The venue's deadline (Q1), `venues.yml:795`, is `deadline: "2026-09-18"` (ICLR 2027 cycle), which has passed.
- Proposal: write "no deadline set; the gate is sized at weeks after the localiser (weeks) and ablation harness (days)". Ask Axel whether ICLR means the next cycle; the registry entry still shows the 2026-09-18 deadline.

## Q7 manual or automatic setting, and a count of methods

No file holds it. Files searched: README.md, project.yml, CLAUDE.md, code/README.md, docs/RESEARCH-APPROACH.md and .agents/plan.yaml (grep for manual, automatic, setting).
- Proposal: automatic, with the count left to Axel. The evidence is Axel's global rule in ~/.claude/CLAUDE.md: "keep generating genuine methodological/algorithmic innovations until something positive works". This is a judgment; only Axel can set the count.
- The fallback sentence of Q3 is also relevant: under that same rule, a gate that only ties is guidance for the next method, not a reason to fall back.

## Q8 the curvature line: is it Merullo et al. (2025)?

Very probably yes, but no file names the work behind "the curvature line".
- The bib entry, `code/references.bib:86-92`:
  ```
  % --- localisation and removal ----------------------------------------------------------------
  @article{merullo2025memorization,
    title   = {From Memorization to Reasoning in the Spectrum of Loss Curvature},
    author  = {Merullo, Jack and Vatsavaya, Srihita and Bushnaq, Lucius and Lewis, Owen},
    journal = {arXiv preprint arXiv:2510.24256},
    year    = {2025}
  }
  ```
- `code/references.bib:6-7` lists it among the works checked against their source texts: "Verified against the source text on 2026-08-31 (numbers quoted in docs/ come from these): ronaghi2026clinically, dong2025attention, merullo2025memorization, davoudi2026amnesia".
- The README line, `README.md:92`: "The closest existing work is the curvature line, which already does localisation plus removal and beats a supervised unlearning baseline, and where a plain SVD comes within 1.4 points of it on out-of-distribution suppression."
- README.md:182 repeats the 1.4-point SVD result.
- It is the only entry under "localisation and removal" with curvature in its title, and no other bib entry concerns curvature or K-FAC. However, `grep merullo` finds no citation of the key in code/docs, src, scripts or README.md, so the README's link to it is not written anywhere.
- My judgment: Merullo et al. 2025 is the K-FAC loss-curvature weight-editing paper, which fits "K-FAC curvature editing" (README.md:21). To confirm the 1.4-point figure, read the paper.

## Q9 job ids behind the reported numbers, and their result files

The files record one job id, 579312. No result file of any job is in the project.
- `project.yml:17`: `latest: "2026-09-01: pipeline verified end to end on the cluster (job 579312, A40, 13 min). ..."`
- `code/slurm/score.slurm:20`: `#   sbatch slurm/score.slurm ~/models/engram/579312 8192`. This is an example of re-scoring 579312's weights at 8192 references; the id of that scoring job is not recorded.
- `git log -p` over every engram path finds no other job id.
- Result files:
  - Nothing under `projects/active/engram` (`find` lists no results folder).
  - Locally, `ls ~/projects/engram ~/models/engram` gives "No such file or directory".
  - On the cluster, the job scripts write results to `~/projects/engram/results/<jobid>/` (`code/slurm/e2e.slurm:64-69`, `code/slurm/score.slurm:30`) and weights to `~/models/engram/<jobid>/`. I did not check whether they are there.
- The hub convention is that results are tracked in the project: `docs/HPC-UTwente-howto.md:181` says "**`results/` and `logs/`** stay in `~/projects/<proj>/`. They are small and tracked (the `results/<campaign>/` mirror is part of the code deposit ...)".
  - Note a conflict: `README.md:99` (hub) says `.depositignore` excludes `results/`, while howto line 181 calls the mirror part of the deposit.
- Unattributed numbers: these README numbers carry no job id:
  - README.md:36-38, 59-61: L40S 274,300 tok/s; 72M 73,851 tok/s; the 8192-reference table.
  - Only the A40 13-minute run has one.
  - `code/slurm/e2e.slurm:22-25` ("512 pinned 12 of 16 cells at 9; 8192 lifts the ceiling to 13") suggests 579312 ran at 512 references and the 8192 table came from a later score job. That is an inference.
- Proposal: run `ssh utwente ls ~/projects/engram/results ~/projects/engram/logs` to list the job ids. Then mirror the folders into `projects/active/engram/code/results/<jobid>/`, as the howto convention says.

## Q10 cluster account

No file names a SLURM account, and no job charges one.
- `grep -rln -E "^#SBATCH (--account|-A)" projects` prints nothing. None of the five engram job headers (code/slurm/*.slurm, code/hpc/oculus_submit_check.slurm) has an `--account` line.
- The only group named is `docs/HPC-UTwente-howto.md:95`: "There is **no `/projects` allocation** for the `bms-code` group. Use `/home`."
- Proposal: "Account: none set; jobs run under the user's default account (group `bms-code`)". `sacctmgr show assoc user=$USER` on the login node would settle the account name.

## Q11 partitions' time limits

The only limit in a file is a 24 h default walltime. No file gives a partition maximum.
- `docs/HPC-UTwente-howto.md:223`: "**Partitions open to everyone:** `main-cpu`, `main-gpu`, `main` (mixed), with a 24 h default walltime. Faculty partitions (`am`, `mia`, `dmb`, `tfe-*`, `itc-*`, ...) are group-restricted."
- What the jobs request:
  - e2e.slurm:7 `--time=02:00:00`
  - score.slurm:7 `01:00:00`
  - train.slurm:7 `24:00:00`
  - probe.slurm:7 `00:05:00`
  - hpc/oculus_submit_check.slurm:5 `00:01:00`
- Proposal: write "24 h default walltime on main-cpu, main-gpu and main (hub cluster guide); the maximum is not recorded". `sinfo -o "%P %l"` on the login node would give the maximum. This matters for Q13, because the 72M run may exceed 24 h.

## Q12 where the localiser lives

The files support "in this project, outside code/". The code README's sentence about a separate project that vendors a pinned engram dates from before engram was folded into the hub.
- `README.md:168`: "This lives in this project, outside the engine package under `code/`. The engine stays generic."
- `CLAUDE.md:9`: "The **research contribution** does not live in the engine package. The block-term localiser, the ablation study and the per-record erasure method live beside it in this project, outside `code/src/engram`. Do not add an `interp/` package to the engine."
- `code/README.md:167`: "engram is the engine. The localiser, the ablation study and the per-record erasure method live in the research hub, in a project that vendors a pinned engram. See `CLAUDE.md`."
- `docs/AGENT-APPROACH.md:96`: "**engram.** It is a project of the hub (`projects/active/engram`) and has no repository of its own."
- Commit de3c2e18a (2026-09-25) copied the engine, code/README.md included, into the hub, and rewrote only the root files "where the move made them false". code/README.md:167 describes the arrangement before the fold, when engram was its own repository.
- Proposal for the deposit reader: "engram is the engine. The localiser, the ablation study and the per-record erasure method are not part of this package." Drop the "See `CLAUDE.md`" pointer.

## Q13 how long a run on real data takes

No file gives a measured run on real data. Only the synthetic run and some per-stage estimates exist.
- Synthetic: `README.md:69`: "`sbatch slurm/e2e.slurm configs/12m.yaml` runs all four against the synthetic corpus in about thirteen minutes." project.yml:17 says the same ("job 579312, A40, 13 min").
- Real-data estimates:
  - `README.md:150`: "Train 72M on real clinical notes (not started). Open. Blocked on the provenance check above. A day."
  - `README.md:126`: "Verify the provenance index at full MIMIC scale ... Hours."
  - `code/docs/03-provenance.md:18`: "sorted table, vectorised hash | 32 MB peak | 1.0 | ~27 GB peak, ~15 min, 13.3 GB on disk". README.md:128 calls this a projection.
  - `code/src/engram/data/tokenizer.py:88`: "takes a corpus the size of MIMIC-IV-Note from about an hour down to minutes."
- My own estimate of the 72M training stage, with the arithmetic:
  - `code/configs/72m.yaml` sets `steps: 60000`, `batch_size: 64`, `grad_accum: 2`.
  - `code/scripts/prepare_data.py:40` gives the default `--seq-len` of 2048.
  - `code/scripts/train.py:198` counts tokens as `steps * batch_size * grad_accum * seq_len`, which gives 15.7B tokens.
  - At the measured 73,851 tok/s (README.md:61, measured at sequence length 512 on an L40S), that is about 59 hours.
  - That exceeds train.slurm's `--time=24:00:00` and the 24 h default walltime. At sequence length 512 it would be about 15 hours.
  - This conflicts with the README's "A day".
- Proposal: in `## Run`, state the synthetic 13 minutes as measured and real-data training as not yet measured. Raise the 24 h walltime conflict with Axel; it may need checkpoint resume, which `code/src/engram/train/checkpoint.py:57` supports ("return the step to resume from").

## Q14 licence and citation

The code is MIT by both the pyproject and the hub convention, but there is no LICENSE file and no citation file.
- `code/pyproject.toml:15`: `license = { text = "MIT" }`
- `code/pyproject.toml:16`: `authors = [{ name = "Axel Faes" }]`
- `ls projects/active/engram/code/LICENSE* CITATION*` finds no matches.
- The hub convention, `README.md:100`: "LICENSE            MIT unless the coauthors agree otherwise".
- `README.md:113` requires the code README to end with `## License and citation`.
- Sibling projects carry an MIT LICENSE: brecht-fl-partitioning, ecg-af-block-term, btfno and others. `projects/active/brecht-fl-partitioning/code/LICENSE` begins "MIT License / Copyright (c) 2026 Axel Faes".
- An example citation section, `projects/manuscripts/conformal-tensor-factors/code/README.md:105`: "MIT License, see `LICENSE`. When you use this code, cite the paper: Axel Faes, "Gauge-Aware Conformal Prediction for Block-Term Tensor Factors"."
- The deposit state, `project.yml:31-36`: `code_availability: status: none`, with url and doi empty.
  - `README.md:226` (project): "`code_availability` in the hub manifest is `none`. It becomes `deposited` with a URL and a Zenodo DOI when there is something to deposit against."
  - Hub README.md:130 says the Zenodo DOI comes from oculus's Deposit view.
- No file has a CITATION.cff convention (grep over the hub README, CLAUDE.md and docs).
- Proposal:
  - Add `code/LICENSE` as the MIT text with "Copyright (c) 2026 Axel Faes".
  - Write `## License and citation` as: "MIT License, see `LICENSE`. No paper exists yet; until one does, cite the repository: Axel Faes, engram, version 0.1.0 (pyproject.toml:7)", plus the Zenodo DOI once it is made.
