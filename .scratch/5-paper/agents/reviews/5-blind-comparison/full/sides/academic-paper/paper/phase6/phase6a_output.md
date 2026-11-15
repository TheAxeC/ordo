## Contract Paraphrase

### D1: originality

This dimension carries weight 0.20 and is not mandatory. For "An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead ECG and clinical risk factors", originality means the paper states what its block-term tensor network adds over prior incident atrial fibrillation prediction from the sinus-rhythm ECG, over clinical risk scores and over earlier tensor decompositions, and positions that contribution against cited prior work. A block on this dimension does not by itself force revision: under F4 it leads to accept_with_dissent_note, as does my disagreement with the writer's self-score on this dimension.

### D2: methodological_rigor

This dimension carries weight 0.25 and is mandatory, so a block on it fires F1 and requires revision. The methods must let a reader in biomedical informatics reproduce and judge the study: the cohort and the definition of incident atrial fibrillation, the inputs (12-lead ECG and clinical risk factors), the block-term model and its training, the comparison models, the data split and the evaluation metrics with their uncertainty. The interpretability claim must rest on a described procedure, and analyses that have not been run (the faithfulness analysis and the external validation) must be described only as planned, not as performed.

### D3: evidence_sufficiency

This dimension carries weight 0.25 and is mandatory, so a block on it fires F1. Each claim must be backed by evidence that exists and is admitted, and the five project rules are judged here. Every number comes from an admitted gold-label file named in paper/config.md decision C1 and matches that file exactly. No difference between models is claimed to be statistically significant. No faithfulness or external-validation outcome is stated while those results are [GAP] placeholders. No result is framed as a negative or null finding, and no dead ends, provisional results, retracted analyses or attic work appear. Every cited source is in the verified corpus paper/phase1/references.bib and is used for what its annotation says it establishes. A number that does not match its admitted file, or a citation outside the corpus or misattributed, also fires F2.

### D4: argument_coherence

This dimension carries weight 0.15 and is mandatory, so a block on it fires F1. The introduction must pose a question that the methods address, the results answer and the discussion interprets, with the conclusion claiming no more than the results support. Claims must not contradict each other across sections, and counter-arguments must be met where they arise. A section structure that departs from the approved outline without a recorded reason is structural drift and fires F6.

### D5: writing_quality

This dimension carries weight 0.15 and is not mandatory; a block on it leads to accept_with_dissent_note under F4. The prose must hold one academic register suited to a biomedical informatics and AI in medicine venue, define its technical terms (block-term decomposition, tensor network) on first use, use one name for each thing throughout, and avoid filler vocabulary, throat-clearing openers and em dashes. The body should sit near the 6500-word target.

### writer_artifact_check

The writer's Phase 4a paraphrase covers seven dimensions (D1 section_completeness, D2 citation_density, D3 argument_blueprint_fidelity, D4 total_word_count, D5 per_section_word_count, D6 acknowledged_limitations, D7 register_consistency) and a must_not list. I was not given the writer contract, so I cannot confirm that these seven are all of its dimensions; the paraphrase is internally complete, gives a mandatory status and a Phase 4b check for each, and includes the must_not list with an escalation clause. Against the evaluator contract it is weaker in four places. It has no counterpart to D1 originality or to D2 methodological_rigor, so nothing in the writer's plan checks reproducibility of the methods or the positioning of the contribution. Its number rule ties numbers to "an admitted gold-label file listed in the evidence map" and does not name paper/config.md decision C1 or require that the number match the file exactly. Its citation rule (D2) requires the verified annotated bibliography but does not name paper/phase1/references.bib or require that each source be used for what its annotation says it establishes. It is stronger in five places. It forbids numbers from RESULTS.md, from files with provisional or undetermined labels and from external-dataset files. It checks every outline section and the mandatory declarations, which supports F6. It sets explicit total (5850 to 7150 words) and per-section (plus or minus 20 percent) word bands. It requires a limitations subsection listing every outline and blueprint limitation. It requires claim strength and counter-argument placement to follow the argument blueprint, which supports D4. The must_not items on statistical significance, [GAP] placeholders and negative or null framing match project rules 2, 3 and 4 of D3 in substance.

## Scoring Plan

### D1: originality

- dimension_id: D1
- what_to_look_for: The introduction and discussion state the specific contribution of the block-term tensor network over cited prior ECG-based atrial fibrillation models, clinical risk scores and tensor methods.
- what_triggers_block: no stated contribution over prior work
- what_triggers_warn: contribution stated but not positioned against cited prior work

### D2: methodological_rigor

- dimension_id: D2
- what_to_look_for: The methods describe cohort, outcome definition, inputs, model, training, comparison models, data split, metrics with uncertainty and the interpretability procedure in enough detail to reproduce, with unrun analyses described only as planned.
- what_triggers_block: method not reproducible from the text
- what_triggers_warn: method detail missing for a reported result

### D3: evidence_sufficiency

- dimension_id: D3
- what_to_look_for: Every number traces to and matches an admitted gold-label file named in paper/config.md decision C1, every citation is in paper/phase1/references.bib and used as annotated, no model difference is called significant, [GAP] placeholders stand without stated outcomes, and no result is framed as negative or null.
- what_triggers_block: number not in an admitted C1 file; citation outside references.bib; significance claimed for a model difference; outcome stated around a [GAP]; negative or null framing; dead end or attic work mentioned
- what_triggers_warn: claim supported but evidence thinly stated; citation used beyond its annotation in a minor way

### D4: argument_coherence

- dimension_id: D4
- what_to_look_for: The question posed in the introduction is answered by the results and interpreted in the discussion, the conclusion stays within the results, sections do not contradict each other, and the section structure follows the approved outline.
- what_triggers_block: conclusion claims more than the results show; claims contradict across sections
- what_triggers_warn: counter-argument left unaddressed; section departs from outline without a recorded reason

### D5: writing_quality

- dimension_id: D5
- what_to_look_for: One consistent academic register, technical terms defined on first use, one name per thing, no filler vocabulary, throat-clearing openers or em dashes, and a body near 6500 words.
- what_triggers_block: register unfit for the venue throughout
- what_triggers_warn: filler vocabulary or em dashes present; term undefined on first use; body outside 5850 to 7150 words

[PRE-COMMITMENT-ACKNOWLEDGED]
