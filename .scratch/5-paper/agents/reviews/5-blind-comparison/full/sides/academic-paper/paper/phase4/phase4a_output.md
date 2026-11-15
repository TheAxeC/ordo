## Acceptance Criteria Paraphrase

### D1: section_completeness

This dimension is mandatory. The draft of "An interpretable block-term tensor network for incident atrial fibrillation prediction from the sinus-rhythm 12-lead ECG and clinical risk factors" must contain every section and every subsection that the approved outline lists, with none merged away, renamed out of recognition or skipped. It must also carry an abstract and each mandatory declaration: data availability, ethics, CRediT author contributions, conflicts of interest, funding, and a disclosure of AI use. A [GAP] placeholder satisfies this dimension only in a place where the run configuration says a [GAP] belongs; anywhere else, a [GAP] counts as a missing section. In Phase 4b I will check the finished draft against the outline heading by heading and against the declaration list item by item before handing it on.

### D2: citation_density

This dimension is mandatory. Every factual statement that is not a result produced by this paper must carry at least one citation, and every cited source must come from the verified annotated bibliography; nothing outside that verified corpus may be cited, however well known. Every number that reports one of the paper's own results must be tied to the source the evidence map admits for it. In Phase 4b I will treat any background claim about atrial fibrillation epidemiology, ECG markers, clinical risk scores, tensor decompositions or prior prediction models as needing a citation from the verified bibliography, and I will remove or rephrase a claim rather than leave it uncited or cite a source outside the corpus.

### D3: argument_blueprint_fidelity

This dimension is mandatory. Each claim in the draft must follow the chain the argument blueprint sets out for it: the claim, the evidence that supports it, and the reasoning that links the two. The wording of a claim may be no stronger than the blueprint permits, so a hedged claim in the blueprint stays hedged in the prose and is never upgraded. Every counter-argument the blueprint lists must be addressed, and it must be addressed in the section where the blueprint places it. In Phase 4b I will draft each section with its blueprint entries open beside it and check claim strength and counter-argument placement against them.

### D4: total_word_count

This dimension is not mandatory, but a block on it still requires revision. The body of the paper must come within plus or minus 10 percent of the configured target of 6500 words, which means a body length between 5850 and 7150 words. In Phase 4b I will count the body words once the draft is complete and trim or extend, without adding unsupported content, until the count falls inside that range.

### D5: per_section_word_count

This dimension is not mandatory, but a block on it still requires revision. Each section must come within plus or minus 20 percent of the word allocation the outline gives it, so no section may swell at the expense of another even when the total is on target. In Phase 4b I will count each section separately against its outline allocation and rebalance any section that falls outside its band.

### D6: acknowledged_limitations

This dimension is mandatory. The draft must contain a limitations subsection, and that subsection must state every limitation that the outline and the argument blueprint list, with none dropped and each written in plain terms that a reader can understand without decoding. In Phase 4b I will compile the full list of limitations from both inputs before writing the subsection and check off each one in the finished text.

### D7: register_consistency

This dimension is not mandatory. The draft must hold one consistent academic register suited to a venue in biomedical informatics and AI in medicine, and it must meet the writing quality checklist in references/writing_quality_check.md. That checklist forbids AI-typical filler terms, em dashes and throat-clearing openers, and it asks for paragraphs of varied length. In Phase 4b I will write without em dashes, open each paragraph with its substance, avoid filler vocabulary, and vary paragraph length across each section.

### must_not

Whatever the dimension scores, violating any item on this list triggers revision in Phase 4b. The draft must not contain any number that does not come from an admitted gold-label file listed in the evidence map. It must not contain any number taken from RESULTS.md, from a file with provisional labels, from a file with undetermined labels, or from a file of an external dataset. It must not claim that a difference between two models is statistically significant. It must not state any outcome of the faithfulness analysis or the external validation while those results stand as [GAP] placeholders; the placeholder stays in place and no outcome is described around it. It must not frame any result as a negative or null finding, and it must not mention dead ends, provisional results, retracted analyses or attic work. If in Phase 4b a mandatory dimension cannot be met because the inputs give no admitted evidence for a claim the outline or blueprint requires, I will escalate that to the evaluator rather than fill the gap with an unadmitted number or an unsupported claim.

[PRE-COMMITMENT-ACKNOWLEDGED]
