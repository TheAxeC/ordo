# /writing on engineering-tex

Draft: `.scratch/3-the-writing-base/cases/engineering/main.tex`. Agent a1e9698a397d678f3, claude-opus-5-5, 89421 tokens, 7 tool uses, 4 min 26 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/main.tex`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/main.tex; echo "---"; LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/sections.tex`

## The report, whole

A character outside ASCII in the report is written by its name in angle brackets, such as `<em dash>`.

Review of `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/main.tex` with its input `sections.tex`, read as one document. The draft is a manuscript: it has an abstract, keywords, and Introduction, Method, Results, Discussion and Conclusion sections. So the rules that `references/rules.md` marks (manuscripts and grants) apply. The discipline is software engineering (concurrent systems), so the register is Engineering and CS.

Non-ASCII scan (`LC_ALL=C grep -n '[^ -~]'`): `main.tex` has no hits. `sections.tex` has hits at lines 177, 179, 203, 205 and 211.

## Prose standard, section 0, Em dash: zero (no em dash, en dash, ` - ` or `--` used as an aside)

- sections.tex:171: "The fixed pool reduces contention---the main cost of the lock-based queue." Rule asks: zero em dashes; use a comma, full stop, colon, parentheses, or restructure.
- sections.tex:173: "The growing pool creates threads -- up to 256 of them -- inside the request path." Rule asks: `--` used as an aside is banned the same way as the em dash.
- sections.tex:175: "The ring buffer is bounded - a full queue rejects new tasks." Rule asks: a spaced hyphen used as an aside is banned the same way as the em dash.
- sections.tex:177: "The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match." Rule asks: zero em dashes.
  Also breaks: prose standard, section B, ASCII throughout.
- sections.tex:179: "The growing pool pays for each new thread <en dash> a cost the fixed pool pays once." Rule asks: an en dash used as an aside is banned the same way as the em dash.
  Also breaks: prose standard, section B, ASCII throughout.

## Prose standard, section 0, Plain prose only (no quips, no cute contrasts)

- sections.tex:183: "A mutex is a turnstile and a ring buffer is an open door." Rule asks: no quips and no cute contrasts; state the fact and stop.

## Prose standard, section 0, No performative asides

- sections.tex:187: "Contention rises with the thread count, which is exactly when the fixed pool matters." Rule asks: no performative aside in any variant, for example "which is exactly when you want to know".

## Prose standard, section 0, No dramatic bolded closers, no grandiose self-assessment

- sections.tex:270: "\textbf{The fixed pool design is the strongest option for this workload.}" Rule asks: no dramatic bolded closer and no grandiose self-assessment.
  Also breaks: prose standard, section F, Bold.
  Also breaks: references/rules.md, Objectivity / Claims rest on evidence.

## Prose standard, section 0, Headings are labels, not sentences

- sections.tex:249: "\subsection{The fixed pool runs apart from the queue}" Rule asks: a heading is a label, not a sentence.

## Prose standard, section 0, No repeated construction

- sections.tex:11: "We chose a ring buffer because it needed no allocation after launch." The same shape recurs at sections.tex:47 ("We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host."), sections.tex:117 ("We chose an offered load below saturation because latency grows without bound above it.") and sections.tex:225 ("We chose to report the 99th percentile because it exposes queueing delay."). Rule asks: a sentence shape that recurs across sections is a template and is rewritten.

## Prose standard, section 0, Arrows (`->`) only inside code and code comments

- sections.tex:209: "Submission order is producer -> queue." Rule asks: no arrow as prose punctuation; rewrite as a sentence.
- sections.tex:211: "Completion order is queue <rightwards arrow> worker." Rule asks: no arrow as prose punctuation; rewrite as a sentence.
  Also breaks: prose standard, section B, ASCII throughout.

## Prose standard, section 0, No chatbot framing

- sections.tex:191: "Contact us if further data would help." Rule asks: no closing offer of further help.

## Prose standard, section A, Vocabulary (banned as filler)

- sections.tex:195: "The fixed pool is a simple change to the scheduler." Rule asks: "simple" is cut or replaced with the concrete fact.

## Prose standard, section A, Vocabulary (vague qualifiers)

- sections.tex:197: "The growing pool is typically idle between bursts." Rule asks: "typically" is replaced with the number or the specific claim.

## Prose standard, section A, Vocabulary (flagged terms)

- sections.tex:199: "The fixed pool leverages every core of the host." Rule asks: the most precise word in place of "leverages".

## Prose standard, section B, Semicolons: at most 2 per 1000 words of running prose

- sections.tex:215: "The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection." Rule asks: at most 2 semicolons per 1000 words of running prose. This paragraph has six, which would need about 3000 words of running prose. The draft reads as well under that, but its word count was not counted by command.

## Prose standard, section B, Never two or more consecutive paragraphs that each open with a colon and a list

- sections.tex:33: "Inputs: queue depth and thread count." It is followed by sections.tex:35: "Outputs: tasks per second and tail latency." Rule asks: no two consecutive paragraphs that each open with a colon and a list.

## Prose standard, section B, ASCII throughout

- sections.tex:203: "The report prints the status <left double quotation mark>complete<right double quotation mark> after each run." Rule asks: straight quotes.
- sections.tex:205: "The harness counts rejected tasks<horizontal ellipsis> and reports the total." Rule asks: three dots, not the ellipsis character.

## Prose standard, section C, Throat-clearing openers

- sections.tex:15: "When it came to growth, the growing pool stopped at 256 threads." Rule asks: delete the opener ("When it comes to").

## Prose standard, section C, Never describe what the page is about to do

- sections.tex:135: "This section explains how the fixed pool lowers the tail." Rule asks: cut "This section explains"; the explanation itself is the page.

## Prose standard, section C, Never open a paragraph by recapping the prior one

- sections.tex:37: "With this setup complete, the harness submitted the first task." Rule asks: pivot directly, without a recapping opener such as "With this setup complete".

## Prose standard, section D, No rule of three

- sections.tex:159: "The fixed pool is small, compact and light." Rule asks: do not pad a list to three items; the evidence decides the count.

## Prose standard, section D, Paragraphs cover one idea and stay under roughly four sentences

- sections.tex:219: "The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals." Rule asks: one idea per paragraph and under roughly four sentences. This paragraph has six sentences and covers task timestamps, memory sampling and the report.

## Prose standard, section D, Vary paragraph length

- main.tex:15: "A server that accepts more work than it can run loses requests or exhausts memory. A bounded task queue limits that risk, but its locking cost grows with the number of threads." This paragraph and the five that follow it at main.tex:17, 19, 21, 23 and 25 each have two sentences. Rule asks: vary paragraph length, since uniform blocks are a template.

## Prose standard, section D, No synonym cycling

- sections.tex:119: "Only one queue size was tested, which limited the latency result to that size." The same concept is named "queue depth" at sections.tex:33, 169 and 259. Rule asks: one term per concept, repeated.
- sections.tex:163: "The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers." Rule asks: one term per concept, repeated.

## Prose standard, section D, Binary contrast ("not X, Y") at most twice per page

- sections.tex:217: "The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core." Rule asks: at most two binary contrasts per page, and only where the contrast is the actual point. This paragraph alone has three.

## Prose standard, section D, Three or more list-shaped items in paragraph form become a list

- sections.tex:167: "The log holds the run number, the host name, the pool type and the elapsed time." Rule asks: three or more list-shaped items in paragraph form become a list.

## Prose standard, section D, Lists are introduced with a colon

- sections.tex:229: "The harness writes four result files." The `enumerate` list follows directly. Rule asks: a list is introduced with a colon.

## Prose standard, section E, Spec-sheet voice

- sections.tex:151: "The queue provides bounded submission and is configurable." Rule asks: say what the code does, not "provides" or "is configurable".

## Prose standard, section E, Stop-start fragments

- sections.tex:147: "The growing pool creates threads on demand. Static in the fixed pool." Rule asks: join a dependent idea that has been split into fragments.

## Prose standard, section E, Cold opens

- sections.tex:139: "This raises the tail. A fixed pool avoids both effects." Rule asks: a body paragraph's first sentence has an antecedent; carry the prior subject forward.

## Prose standard, section E, Restating closes

- sections.tex:145: "Pinning keeps caches warm. A pinned worker never loses its cache to another core. In short, pinned workers keep their caches." Rule asks: cut a final sentence that says the paragraph again in shorter words.

## Prose standard, section E, Personified artifacts

- sections.tex:143: "The cache is happy when a worker stays on one core." Rule asks: no personified artifact for colour.

## Prose standard, section E, Rhetorical questions

- sections.tex:155: "What does the harness log? It logs one line per run and one per rejected task." Rule asks: avoid rhetorical questions, except a question that a section answers as its subject.

## Prose standard, section E, Passive voice

- sections.tex:157: "The summary file is written by the harness." Rule asks: rewrite the passive unless the actor is irrelevant. Here the actor is named.

## Prose standard, section E, Sentence length

- sections.tex:81: "The harness started all eight producers together. The queue filled within the first second. The workers then began to take tasks." It continues at sections.tex:83: "A timer started with the first task. The timer stopped after the 60th second." Rule asks: rewrite five or more consecutive sentences of the same length. These five sentences have seven words each.
- sections.tex:95: "The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced." Rule asks: under roughly 20 words unless the mechanism needs more. This sentence has 30 words.

## Prose standard, section F, Bold

- sections.tex:257: "The gain on the second host is \textbf{surprising} for a design this small." Rule asks: bold only for a term at first use, a critical fact or warning, or a list-item label, never for tone.

## Prose standard, section F, No ALL-CAPS emphasis in prose

- sections.tex:227: "The fixed pool leads on ALL four hosts." Rule asks: no ALL-CAPS emphasis.

## Prose standard, section F, Inline code for paths

- sections.tex:261: "The harness reads its pool settings from configs/pool.yaml." Rule asks: inline code for paths.

## Prose standard, section F, Source formatting (no hard wrapping)

- sections.tex:265: "The harness writes one summary file per run and" The sentence continues on sections.tex:266: "names the file after the run number." Rule asks: one paragraph per source line, no hard wrapping.

## references/rules.md, Precision / Term defined at first use

- main.tex:8: "lowered the 99th percentile latency from 410 to 190 microseconds" The term is used from here on, and the draft defines it only at sections.tex:225: "The 99th percentile is the latency that 99 percent of the tasks stayed below." Rule asks: a technical term is defined where it first appears.
- sections.tex:7: "Each worker was pinned to one core within its NUMA node." Rule asks: a technical term is defined where it first appears. "NUMA node" is not defined anywhere in the draft.

## references/rules.md, Precision / Pronoun with a clear antecedent

- sections.tex:21: "The scheduler passed the task to a worker when it was ready." Rule asks: a pronoun has a clear antecedent. Here "it" can be the scheduler, the task or the worker.

## references/rules.md, Concision / One idea per sentence (manuscripts and grants)

- sections.tex:25: "The harness was written in C, and the third host was installed in 2021." Rule asks: a sentence carries one idea, or clearly connected ideas.

## references/rules.md, Objectivity / Claims rest on evidence

- sections.tex:223: "We believe the fixed pool is the better design." Rule asks: a claim rests on evidence, not on opinion.

## references/rules.md, Formality / Full forms (manuscripts and grants)

- sections.tex:63: "The harness didn't retry a failed task." Rule asks: a contraction is written out.

## references/rules.md, Formality / No colloquial words (manuscripts and grants)

- sections.tex:13: "The scheduler bailed out when the queue was full." Rule asks: formal, academic vocabulary, with no colloquialism.

## references/rules.md, Hedging / Hedge where a claim is uncertain

- sections.tex:133: "Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool." Rule asks: hedge a causal claim from correlational data and a generalization from a limited sample (here, four hosts).

## references/rules.md, Hedging / No hedge on facts

- sections.tex:61: "The harness appeared to stop each run after 60 seconds. The log recorded the stop time of every run." Rule asks: reported data and the description of a method are stated without a hedge.

## references/rules.md, Transitions / Transition that states the relation

- sections.tex:101: "The fixed pool created 64 threads. Consequently, the growing pool created 248 threads." Rule asks: cut a transition whose relation the two sentences do not have. The growing pool's thread count does not follow from the fixed pool's.

## references/rules.md, Paragraphs / Claim with evidence or citation

- sections.tex:103: "The fixed pool used less memory than the growing pool. The harness sampled memory once per second." Rule asks: a claim is followed by the data, citation or example that supports it. No memory figure is given.

## references/rules.md, Paragraphs / Evidence followed by what it means

- sections.tex:99: "The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent." Rule asks: evidence is followed by an interpretation that connects it to the paragraph's claim.

## references/rules.md, Common style errors / Wordy phrase

- sections.tex:29: "Due to the fact that all workers shared one queue, the head index was atomic." Rule asks: the concise form of "due to the fact that".

## references/rules.md, Common style errors / Vague phrase

- sections.tex:19: "The benchmark ran on a modern server." Rule asks: a vague phrase is replaced with the specific claim.
  Also breaks: references/registers.md, Engineering and CS / Terminology (technical specifications are stated).
- sections.tex:31: "In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads." Rule asks: "in recent years" is replaced with the specific period.

## references/rules.md, Reader's path / Clarity test

- main.tex:31: "The correctness proof of this design fits into two pages (Jones, 2020)." Rule asks: a paragraph whose removal loses nothing is deleted.
- sections.tex:221: "A queue holds tasks until a worker is free. Servers use queues for that purpose." Rule asks: a paragraph whose removal loses nothing is deleted.

## references/rules.md, Reader's path / So what per section

- sections.tex:123: "A Mann-Whitney U test compared the two latency distributions and gave p below 0.001." Rule asks: a Results section leads with the result, not the statistical test. The latency result comes only at sections.tex:125.

## references/registers.md, Engineering and CS / Voice

- sections.tex:73: "The authors chose 42 as the random seed." Rule asks: the authors' decisions take "we", and the authors never refer to themselves in the third person.
