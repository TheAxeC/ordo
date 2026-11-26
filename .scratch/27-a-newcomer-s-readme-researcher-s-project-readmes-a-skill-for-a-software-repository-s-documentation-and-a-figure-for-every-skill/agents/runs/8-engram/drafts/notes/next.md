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
