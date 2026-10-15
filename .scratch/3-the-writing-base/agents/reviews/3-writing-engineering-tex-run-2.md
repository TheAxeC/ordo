# /writing on engineering-tex, second run

Draft: `.scratch/3-the-writing-base/cases/engineering/main.tex`. Agent a67813b9887927643, claude-opus-5-5, 110933 tokens, 8 tool uses, 7 min 34 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/main.tex`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/main.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/sections.tex`

## The report, whole

## Prose standard, 0. Hard rules / Em dash: zero

- sections.tex:171: "The fixed pool reduces contention---the main cost of the lock-based queue." The rule asks for zero em dashes. The writer uses a comma, a full stop, a colon, parentheses, or rebuilds the sentence.
- sections.tex:173: "The growing pool creates threads -- up to 256 of them -- inside the request path." The rule bans `--` used as an aside, the same way it bans the em dash.
- sections.tex:175: "The ring buffer is bounded - a full queue rejects new tasks." The rule bans a spaced hyphen used as an aside, the same way it bans the em dash.
- sections.tex:177: "The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match." The rule asks for zero em dashes.
  Also breaks: Prose standard, B. Punctuation / ASCII throughout.
- sections.tex:179: "The growing pool pays for each new thread <en dash> a cost the fixed pool pays once." The rule bans the en dash used as an aside, the same way it bans the em dash.
  Also breaks: Prose standard, B. Punctuation / ASCII throughout.

## Prose standard, 0. Hard rules / Plain prose only

- sections.tex:183: "A mutex is a turnstile and a ring buffer is an open door." The rule asks for no quips and no cute contrasts. The text states the fact and stops.

## Prose standard, 0. Hard rules / No performative asides

- sections.tex:187: "Contention rises with the thread count, which is exactly when the fixed pool matters." The rule bans performative asides in every variant, such as "which is exactly when you want to know".

## Prose standard, 0. Hard rules / No dramatic bolded closers

- sections.tex:270: "\textbf{The fixed pool design is the strongest option for this workload.}" The rule bans dramatic bolded closers and grandiose self-assessment.
  Also breaks: Prose standard, F. Emphasis and formatting / Bold.
  Also breaks: references/rules.md, Objectivity / Claims rest on evidence.

## Prose standard, 0. Hard rules / Headings are labels, not sentences

- sections.tex:249: "\subsection{The fixed pool runs apart from the queue}" The rule asks that a heading be a label, such as "Cost", and not a sentence.

## Prose standard, 0. Hard rules / No repeated construction

- main.tex:29 and main.tex:37: "A lock-based queue guards its head and tail with one mutex, a lock that admits one thread at a time." and "A lock-free queue advances its head and tail with compare-and-swap (CAS), an atomic instruction that conditionally stores a value." Both sections open with this sentence shape, and both close their first paragraph with "The loss ... suggests that ...". The rule says that a sentence shape that recurs across sections is a template and is rewritten.
  Also breaks: Prose standard, D. Structure / No mirror structure. The two sections run in the same order: a definition, a cited measurement with "suggests", a second cited paragraph, then a closing paragraph on what is left unmeasured.

## Prose standard, 0. Hard rules / Arrows only inside code

- sections.tex:209: "Submission order is producer -> queue." The rule allows `->` only inside code and code comments, never as prose punctuation, and asks for a sentence in its place.
- sections.tex:211: "Completion order is queue <rightwards arrow> worker." The rule allows arrows only inside code and code comments, never as prose punctuation.
  Also breaks: Prose standard, B. Punctuation / ASCII throughout.

## Prose standard, 0. Hard rules / No chatbot framing

- sections.tex:191: "Contact us if further data would help." The rule bans a closing offer of further help.

## Prose standard, A. Vocabulary / Banned filler

- sections.tex:195: "The fixed pool is a simple change to the scheduler." The rule bans "simple" as filler and asks that it be cut or replaced with the concrete fact.

## Prose standard, A. Vocabulary / Vague qualifiers

- sections.tex:197: "The growing pool is typically idle between bursts." The rule asks that "typically" be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Common style errors / Vague phrase.

## Prose standard, A. Vocabulary / Flagged terms

- sections.tex:199: "The fixed pool leverages every core of the host." "leverage" is a flagged term. The rule asks for the most precise word in its place.
  Also breaks: references/rules.md, Flagged terms.

## Prose standard, B. Punctuation / Semicolons

- sections.tex:215: "The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection." This paragraph holds six semicolons. They are the only semicolons in the draft, which runs to about 2,680 words of prose by a hand count, so the rate is about 2.2 per 1000 words. The rule allows at most 2 per 1000 words of running prose.
  Also breaks: Prose standard, E. Sentence shapes / Sentence length. The first sentence runs to 25 words, and its mechanism does not need that length.

## Prose standard, B. Punctuation / No consecutive colon-and-list paragraphs

- sections.tex:33: "Inputs: queue depth and thread count." followed at sections.tex:35 by "Outputs: tasks per second and 99th percentile latency." The rule allows no two consecutive paragraphs that each open with a colon and a list.

## Prose standard, B. Punctuation / ASCII throughout

- sections.tex:203: "The report prints the status <left double quotation mark>complete<right double quotation mark> after each run." The rule asks for ASCII throughout, with straight quotes.
- sections.tex:205: "The harness counts rejected tasks<horizontal ellipsis> and reports the total." The rule asks for ASCII throughout, with three dots in place of the ellipsis character.

## Prose standard, C. Throat-clearing and meta-commentary / Openers

- sections.tex:15: "When it came to growth, the growing pool stopped at 256 threads." The rule asks that the opener "When it comes to" be deleted rather than rewritten.

## Prose standard, C. Throat-clearing and meta-commentary / Recapping the prior paragraph

- sections.tex:37: "With this setup complete, the harness submitted the first task." The rule bans a paragraph that opens by recapping the one before it, as in "With this setup complete", and asks the text to pivot directly.

## Prose standard, C. Throat-clearing and meta-commentary / Describing what the page is about to do

- sections.tex:135: "This section explains how the fixed pool lowers the tail." The rule bans a sentence that describes what the page is about to do, such as "This section explains", and asks that it be cut.
  Also breaks: Prose standard, D. Structure / No synonym cycling. "the tail" names the concept the draft elsewhere calls the 99th percentile latency.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point.

## Prose standard, D. Structure / Paragraphs cover one idea and stay under roughly four sentences

- sections.tex:219: "The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second, and a separate file keeps every sample. The harness writes the report after the run. A summary file holds the totals." The paragraph has six sentences and covers two ideas: the timing of each task, then memory sampling and the report. The rule asks for one idea per paragraph and under roughly four sentences.

## Prose standard, D. Structure / Vary paragraph length

- main.tex:15: "A server that accepts more work than it can run loses requests or exhausts memory. A bounded task queue limits that risk, but its locking cost grows with the number of threads." All six paragraphs of the Introduction (main.tex:15 to main.tex:25) have two sentences each and run to 29 to 32 words. The rule says that uniform blocks are a template and asks for varied paragraph length.

## Prose standard, D. Structure / No rule of three

- sections.tex:159: "The fixed pool is small, compact and light." The rule bans padding a list to three items. "small" and "compact" say the same thing.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation.

## Prose standard, D. Structure / No synonym cycling

- sections.tex:91: "Thread creation explained only part of the 24 percent gap." The same 24 percent is "The difference" at sections.tex:89 and "The gain" at sections.tex:93. The rule asks for one term per concept, repeated.
- sections.tex:125: "The result confirmed, for these hosts, the expectation that a fixed pool lowers the tail." "the tail" names the concept that the sentence before it calls the 99th percentile latency, and the draft already uses "tail" for the tail index of the queue. The rule asks for one term per concept, repeated.
- sections.tex:127: "The growing pool created threads inside the request path, which may have added to the tail." "the tail" again stands for the 99th percentile latency. The rule asks for one term per concept, repeated.
- sections.tex:139: "This raises the tail. A fixed pool avoids both effects." "the tail" again stands for the 99th percentile latency. The rule asks for one term per concept, repeated.
  Also breaks: Prose standard, E. Sentence shapes / Cold opens. The paragraph opens on "This" with no antecedent, and "both effects" leaves the reader to guess what the two effects are.
- sections.tex:163: "The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers." The paragraph uses three terms for one concept: "queue", "buffer" and "channel". The rule asks for one term per concept, repeated.

## Prose standard, D. Structure / Binary contrast at most twice per page

- sections.tex:217: "The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core." The paragraph holds three "not X, Y" contrasts. The rule allows at most two per page, and only where the contrast is the actual point.

## Prose standard, D. Structure / Lists

- sections.tex:167: "The log holds the run number, the host name, the pool type and the elapsed time." The rule asks that three or more list-shaped items in paragraph form become a list. This sentence holds four.
- sections.tex:229: "The harness writes four result files." The enumerated list that follows is introduced with a full stop. The rule asks that a list be introduced with a colon.

## Prose standard, E. Sentence shapes / Spec-sheet voice

- sections.tex:151: "The queue provides bounded submission and is configurable." The rule bans "provides" and "is configurable" and asks the text to say what the code does.

## Prose standard, E. Sentence shapes / Stop-start fragments

- sections.tex:147: "The growing pool creates threads on demand. Static in the fixed pool." The rule asks that one dependent idea split into fragments be joined.

## Prose standard, E. Sentence shapes / Restating closes

- sections.tex:145: "Pinning keeps caches warm. A pinned worker never loses its cache to another core. In short, pinned workers keep their caches." The rule asks that a final sentence which says the paragraph again in shorter words be cut.

## Prose standard, E. Sentence shapes / Personified artifacts

- sections.tex:143: "The cache is happy when a worker stays on one core." The rule bans personifying an artifact for colour.
  Also breaks: references/rules.md, Formality / No colloquial words.

## Prose standard, E. Sentence shapes / Rhetorical questions

- sections.tex:155: "What does the harness log? It logs one line per run and one per rejected task." The rule avoids rhetorical questions except a question that a section answers as its subject. The Discussion's subject is not what the harness logs.

## Prose standard, E. Sentence shapes / Passive voice

- sections.tex:157: "The summary file is written by the harness." The sentence names its actor, so the actor is relevant. The rule asks for a rewrite in the active voice unless the actor is irrelevant.

## Prose standard, E. Sentence shapes / Sentence length

- sections.tex:81: "The harness started all eight producers together. The queue filled within the first second. The workers then began to take tasks." together with sections.tex:83: "A timer started with the first task. The timer stopped after the 60th second." These are five consecutive sentences of seven words each. The rule asks that five or more consecutive sentences of the same length be rewritten.
- sections.tex:95: "The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced, which suggested that a fixed pool scales with the core count of its host." The sentence runs to 44 words. The rule asks for under roughly 20 words unless the mechanism needs more, and this mechanism does not.

## Prose standard, F. Emphasis and formatting / Bold

- sections.tex:257: "The gain on the second host is \textbf{surprising} for a design this small." The rule allows bold only for a term at first use, a critical fact or warning, or a list-item label. Here it is used for tone.
  Also breaks: references/rules.md, Objectivity / Claims rest on evidence.

## Prose standard, F. Emphasis and formatting / No ALL-CAPS emphasis

- sections.tex:227: "The fixed pool leads on ALL four hosts." The rule bans ALL-CAPS emphasis in prose.

## Prose standard, F. Emphasis and formatting / Inline code

- sections.tex:261: "The harness reads its pool settings from configs/pool.yaml." The rule asks that a path be set as inline code.

## Prose standard, F. Emphasis and formatting / Source formatting

- sections.tex:265: "The harness writes one summary file per run and" continues on sections.tex:266 as "names the file after the run number." The rule asks for one paragraph per source line, with no hard wrapping.

## references/rules.md, Precision / Term defined at first use

- sections.tex:7: "Each worker was pinned to one core within its NUMA node." The acronym NUMA first appears here with no definition. The rule asks that a technical term be defined where it first appears.

## references/rules.md, Precision / Pronoun with a clear antecedent

- sections.tex:21: "The scheduler passed the task to a worker when it was ready." "it" could be the scheduler, the task or the worker. The rule asks that a pronoun have a clear antecedent.

## references/rules.md, Concision / One idea per sentence (manuscripts and grants)

- sections.tex:25: "The harness was written in C, and the third host was installed in 2021." The sentence joins two unconnected ideas. The rule asks that a sentence carry one idea, or clearly connected ideas.

## references/rules.md, Objectivity / Claims rest on evidence

- sections.tex:223: "We believe the fixed pool is the better design." The rule asks that a claim rest on evidence, not on opinion.

## references/rules.md, Objectivity / Limitations and alternative interpretations

- sections.tex:131: "The results suggest that a fixed pool lowers the 99th percentile latency by removing thread creation from the request path." The draft states limitations at sections.tex:55 and sections.tex:119. Nowhere does it give an alternative interpretation of its results, even though sections.tex:91 reports that thread creation accounts for only a quarter of the throughput gap. The rule asks that the text acknowledge the alternative interpretations of its results.

## references/rules.md, Formality (manuscripts and grants) / Full forms

- sections.tex:63: "The harness didn't retry a failed task." The rule asks that a contraction be written out.

## references/rules.md, Formality (manuscripts and grants) / No colloquial words

- sections.tex:13: "The scheduler bailed out when the queue was full." "bailed out" is a colloquialism. The rule asks for formal, academic vocabulary.

## references/rules.md, Hedging / Hedge where a claim is uncertain

- sections.tex:133: "Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool." This is a causal claim from correlational data, generalized from four hosts, and it carries no hedge. The rule asks that such a claim be hedged.

## references/rules.md, Hedging / No hedge on facts

- sections.tex:61: "The harness appeared to stop each run after 60 seconds." The stop time is reported data, and the next sentence says the log recorded it. The rule asks that reported data be stated without a hedge.

## references/rules.md, Transitions / Transition that states the relation

- sections.tex:101: "The fixed pool created 64 threads. Consequently, the growing pool created 248 threads." The growing pool's thread count does not follow from the fixed pool's. The rule asks that a transition whose relation the two sentences do not have be cut.

## references/rules.md, Paragraphs / Claim with evidence or citation

- sections.tex:31: "In recent years, hosts gained cores, so the thread counts of this study started at 8 and 64." The claim that hosts gained cores is followed by no data, citation or example. The rule asks that a claim be followed by what supports it.
  Also breaks: references/rules.md, Common style errors / Vague phrase. "In recent years" is the rule's own example of a vague phrase.
- sections.tex:103: "The fixed pool used less memory than the growing pool. The harness sampled memory once per second." The claim is followed by no data. The second sentence describes the sampling, not the result. The rule asks that a claim be followed by the data that supports it.

## references/rules.md, Paragraphs / Evidence followed by what it means

- sections.tex:99: "The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent." No interpretation follows the evidence. The rule asks that evidence be followed by an interpretation that connects it to the paragraph's claim.

## references/rules.md, Common style errors / Wordy phrase

- sections.tex:29: "Due to the fact that all workers shared one queue, the head index was atomic." "due to the fact that" is a wordy phrase in the rule's table. The rule asks for its concise form.

## references/rules.md, Common style errors / Vague phrase

- sections.tex:19: "The benchmark ran on a modern server." The draft names four specific hosts, and "a modern server" names none of them. The rule asks that a vague phrase be replaced with the specific claim.
  Also breaks: references/registers.md, Engineering and CS / Terminology.
- sections.tex:117: "We chose an offered load below saturation because latency grows without bound above it." The latency study's offered load is given nowhere as a number. The rule asks that a vague phrase be replaced with the specific claim.
  Also breaks: references/registers.md, Engineering and CS / Terminology.
  Also breaks: references/registers.md, Engineering and CS / What the reader looks for.

## references/rules.md, Reader's path / Clarity test

- sections.tex:221: "A queue holds tasks until a worker is free. Servers use queues for that purpose." The paper still makes sense with this paragraph removed. The rule asks that a paragraph whose removal loses nothing be deleted.

## references/rules.md, Reader's path / Reader's four questions

- sections.tex:129: "\section{Discussion}" After its opening paragraphs, the Discussion mostly describes the queue, the harness and its files: sections.tex:153, 161, 167, 169, 185, 193, 201, 207, 213, 229 to 247, 263, 265, 268 and 272. These paragraphs have no stated connection to the research question. The subsection "Thread Count" at sections.tex:253 then holds paragraphs on bold emphasis, the queue depth, file paths, summary files and host temperature. The rule asks that at any point the reader can answer "Where am I?" from the section structure and "Why am I here?" from the connection to the research question.

## references/rules.md, Reader's path / So what per section

- sections.tex:123: "A Mann-Whitney U test compared the two latency distributions and gave p below 0.001." The Latency Results section opens with the statistical test. The rule asks that a Results section lead with the result, not the statistical test.

## references/registers.md, Engineering and CS / Voice

- sections.tex:73: "The authors chose 42 as the random seed." The rule says that the authors' decisions take "we" and that the authors never refer to themselves in the third person.
