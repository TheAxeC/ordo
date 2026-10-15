# /writing on engineering-docx, second run

Draft: `.scratch/3-the-writing-base/cases/engineering/draft.docx`. Agent a690fc021f40c3aa1, claude-opus-5-5, 97597 tokens, 6 tool uses, 5 min 50 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

Review of /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/draft.docx. The draft is a manuscript, with an abstract, keywords and Introduction, Method, Results, Discussion and Conclusion sections, so the (manuscripts and grants) rules apply. The register is Engineering and CS. All places are body paragraphs; the draft has no footnotes.

## Prose standard, section 0 (Hard rules), "Em dash: zero"

- paragraph 104: "The fixed pool reduces contention---the main cost of the lock-based queue."
  Rule: prose standard, 0, Em dash: zero. A dash used as an aside, whether `--`, a spaced hyphen or an em or en dash, is zero. Use a comma, a full stop, a colon, parentheses, or restructure.
- paragraph 105: "The growing pool creates threads -- up to 256 of them -- inside the request path."
  Rule: prose standard, 0, Em dash: zero. `--` as an aside is banned.
- paragraph 106: "The ring buffer is bounded - a full queue rejects new tasks."
  Rule: prose standard, 0, Em dash: zero. A spaced hyphen as an aside is banned.
- paragraph 107: "The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match."
  Rule: prose standard, 0, Em dash: zero. The number of em dashes is zero.
  Also breaks: prose standard, B (Punctuation), ASCII throughout. The em dash is a non-ASCII character.
- paragraph 108: "The growing pool pays for each new thread <en dash> a cost the fixed pool pays once."
  Rule: prose standard, 0, Em dash: zero. An en dash used as an aside is banned the same way.
  Also breaks: prose standard, B (Punctuation), ASCII throughout. The en dash is a non-ASCII character.

## Prose standard, section 0 (Hard rules), "Plain prose only"

- paragraph 110: "A mutex is a turnstile and a ring buffer is an open door."
  Rule: prose standard, 0, Plain prose only. No quips and no cute contrasts. State the fact and stop.

## Prose standard, section 0 (Hard rules), "No performative asides"

- paragraph 112: "Contention rises with the thread count, which is exactly when the fixed pool matters."
  Rule: prose standard, 0, No performative asides, in any variant, such as "which is exactly when you want to know".

## Prose standard, section 0 (Hard rules), "No repeated construction"

- paragraphs 24, 42, 77 and 131: "We chose a ring buffer because it needed no allocation after launch." / "We chose an offered load of 500,000 tasks per second because it saturated the growing pool on every host." / "We chose an offered load below saturation because latency grows without bound above it." / "We chose to report the 99th percentile because it exposes queueing delay."
  Rule: prose standard, 0, No repeated construction. A sentence shape that recurs across entries or sections is a template and is rewritten. The shape "We chose X because Y" recurs across Implementation, Throughput Method, Latency Method and Discussion.
  Also breaks (paragraph 77): registers.md, Engineering and CS / What the reader looks for. The reader looks for reproducibility of results, which a methods section gives. The Latency Method section gives the offered load only as "below saturation", with no value.
- paragraphs 46 and 78: "The harness covered only x86 hosts, which limited the results to that architecture." / "Only one queue depth was tested, which limited the latency result to that depth."
  Rule: prose standard, 0, No repeated construction. The shape "only X, which limited the result to that Y" recurs across Throughput Method and Latency Method.

## Prose standard, section 0 (Hard rules), "Arrows (`->`) only inside code and code comments"

- paragraph 123: "Submission order is producer -> queue."
  Rule: prose standard, 0, Arrows only inside code and code comments, never as prose punctuation. Rewrite as a sentence.
- paragraph 124: "Completion order is queue <rightwards arrow> worker."
  Rule: prose standard, 0, Arrows only inside code and code comments, never as prose punctuation.
  Also breaks: prose standard, B (Punctuation), ASCII throughout. The arrow is a non-ASCII character.

## Prose standard, section 0 (Hard rules), "No chatbot framing"

- paragraph 114: "Contact us if further data would help."
  Rule: prose standard, 0, No chatbot framing. No closing offer of further help.

## Prose standard, section A (Vocabulary), banned filler

- paragraph 116: "The fixed pool is a simple change to the scheduler."
  Rule: prose standard, A. "simple" is banned as filler. Cut it or replace it with the concrete fact.

## Prose standard, section A (Vocabulary), vague qualifiers

- paragraph 117: "The growing pool is typically idle between bursts."
  Rule: prose standard, A. A vague qualifier ("typically") is replaced with the number or the specific claim.

## Prose standard, section A (Vocabulary), flagged terms

- paragraph 118: "The fixed pool leverages every core of the host."
  Rule: prose standard, A. "leverage" is flagged. Each use must be the most precise word in its place rather than a default.

## Prose standard, section B (Punctuation), semicolons

- paragraph 126: "The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection."
  Rule: prose standard, B. At most 2 semicolons per 1000 words of running prose. This paragraph has 6, the only semicolons in the draft. By my count from the printed paragraphs, the draft has about 2,400 words of running prose, which is about 2.5 semicolons per 1000 words.

## Prose standard, section B (Punctuation), consecutive colon-and-list paragraphs

- paragraphs 35 and 36: "Inputs: queue depth and thread count." / "Outputs: tasks per second and 99th percentile latency."
  Rule: prose standard, B. Never two or more consecutive paragraphs that each open with a colon and a list.

## Prose standard, section B (Punctuation), ASCII throughout

- paragraph 120: "The report prints the status <left double quotation mark>complete<right double quotation mark> after each run."
  Rule: prose standard, B, ASCII throughout. Straight quotes are used.
- paragraph 121: "The harness counts rejected tasks<horizontal ellipsis> and reports the total."
  Rule: prose standard, B, ASCII throughout. Use three dots instead of the ellipsis character.

## Prose standard, section C (Throat-clearing and meta-commentary), openers

- paragraph 26: "When it came to growth, the growing pool stopped at 256 threads."
  Rule: prose standard, C. The opener "When it comes to" is deleted rather than rewritten.

## Prose standard, section C (Throat-clearing and meta-commentary), describing what the page does

- paragraph 86: "This section explains how the fixed pool lowers the tail."
  Rule: prose standard, C. Never describe what the page is about to do. "This section explains" is cut.
  Also breaks: rules.md, Paragraphs / First sentence states the point. The first sentence of a paragraph states its main point, and this one announces the section instead.
  Also breaks: prose standard, D (Structure), No synonym cycling. One term per concept, repeated. "the tail" stands for the 99th percentile latency.

## Prose standard, section C (Throat-clearing and meta-commentary), recap openers

- paragraph 37: "With this setup complete, the harness submitted the first task."
  Rule: prose standard, C. Never open a paragraph by recapping the prior one ("With this setup complete"). Pivot directly.

## Prose standard, section D (Structure), "No rule of three"

- paragraph 98: "The fixed pool is small, compact and light."
  Rule: prose standard, D, No rule of three. Do not pad a list to three items. The evidence decides the count.
  Also breaks: rules.md, Paragraphs / Claim with evidence or citation. A claim is followed by the data, the citation or the example that supports it.
  Also breaks: registers.md, Engineering and CS / Terminology. Technical specifications and performance metrics are stated.

## Prose standard, section D (Structure), "Paragraphs cover one idea and stay under roughly four sentences"

- paragraph 31: "The harness was written in C, and the third host was installed in 2021."
  Rule: prose standard, D. A paragraph covers one idea. Split anything covering two. This paragraph covers the harness language and the installation date of a host.
  Also breaks: rules.md, Concision / One idea per sentence (manuscripts and grants). A sentence carries one idea, or clearly connected ideas.
- paragraph 128: "The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second, and a separate file keeps every sample. The harness writes the report after the run. A summary file holds the totals."
  Rule: prose standard, D. A paragraph covers one idea and stays under roughly four sentences. Split anything longer or covering two. This paragraph has six sentences and covers task timestamps, memory sampling and the report.
  Also breaks: rules.md, Paragraphs / First sentence states the point. The first sentence states only the timestamps, which is not the main point of the whole paragraph.

## Prose standard, section D (Structure), "No synonym cycling"

- paragraph 81: "The result confirmed, for these hosts, the expectation that a fixed pool lowers the tail."
  Rule: prose standard, D, No synonym cycling. One term per concept, repeated. "the tail" follows "the 99th percentile latency" in the sentence before it for the same concept.
  Also breaks: rules.md, Precision / Term defined at first use. "the tail" first appears here and is not defined.
- paragraph 100: "The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers."
  Rule: prose standard, D, No synonym cycling. One term per concept, repeated. The queue is named "queue", "buffer" and "channel".

## Prose standard, section D (Structure), "Binary contrast at most twice per page"

- paragraph 127: "The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core."
  Rule: prose standard, D. A binary contrast ("not X, Y") is used at most twice per page, and only where the contrast is the actual point. This paragraph has three.

## Prose standard, section D (Structure), "Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon."

- paragraph 102: "The log holds the run number, the host name, the pool type and the elapsed time."
  Rule: prose standard, D. Three or more list-shaped items in paragraph form become a list. This sentence holds four.
- paragraph 133: "The harness writes four result files."
  Rule: prose standard, D. Lists are introduced with a colon. This sentence introduces the list in paragraphs 134 to 137 and ends with a full stop.

## Prose standard, section E (Sentence shapes), "Spec-sheet voice"

- paragraph 94: "The queue provides bounded submission and is configurable."
  Rule: prose standard, E, Spec-sheet voice. Instead of "provides" and "is configurable", say what the code does.

## Prose standard, section E (Sentence shapes), "Stop-start fragments"

- paragraph 92: "The growing pool creates threads on demand. Static in the fixed pool."
  Rule: prose standard, E, Stop-start fragments. One dependent idea split into fragments is joined.

## Prose standard, section E (Sentence shapes), "Cold opens"

- paragraph 88: "This raises the tail."
  Rule: prose standard, E, Cold opens. The first sentence of a body paragraph has no antecedent, so "this" is a guess. Carry the prior subject forward.
  Also breaks: prose standard, D (Structure), No synonym cycling. "the tail" stands for the 99th percentile latency.

## Prose standard, section E (Sentence shapes), "Restating closes"

- paragraph 91: "In short, pinned workers keep their caches."
  Rule: prose standard, E, Restating closes. A final sentence that says the paragraph again in shorter words is cut.

## Prose standard, section E (Sentence shapes), "Personified artifacts"

- paragraph 90: "The cache is happy when a worker stays on one core."
  Rule: prose standard, E. Personified artifacts used for colour are banned.

## Prose standard, section E (Sentence shapes), "Rhetorical questions"

- paragraph 96: "What does the harness log?"
  Rule: prose standard, E. Rhetorical questions are avoided, except a question that a section answers as its subject.

## Prose standard, section E (Sentence shapes), "Passive voice"

- paragraph 97: "The summary file is written by the harness."
  Rule: prose standard, E. Passive voice is rewritten unless the actor is irrelevant. Here the sentence names the actor.

## Prose standard, section E (Sentence shapes), "Sentence length"

- paragraphs 59 and 60: "The harness started all eight producers together. The queue filled within the first second. The workers then began to take tasks." / "A timer started with the first task. The timer stopped after the 60th second."
  Rule: prose standard, E, Sentence length. Five or more consecutive sentences of the same length are rewritten. These are five consecutive sentences of 7 words each.
- paragraph 66: "The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced, which suggested that a fixed pool scales with the core count of its host."
  Rule: prose standard, E, Sentence length. A sentence stays under roughly 20 words unless the mechanism needs more. This sentence has 44 words.

## Prose standard, section F (Emphasis and formatting), "No ALL-CAPS emphasis in prose"

- paragraph 132: "The fixed pool leads on ALL four hosts."
  Rule: prose standard, F. No ALL-CAPS emphasis in prose.

## references/rules.md, Precision / Most specific term

- paragraph 28: "The benchmark ran on a modern server."
  Rule: rules.md, Precision / Most specific term. A passage names each thing with the most specific term the field has for it. The study ran on the four hosts that paragraph 9 specifies.
  Also breaks: rules.md, Common style errors / Vague phrase. A vague phrase is replaced with the specific claim.
  Also breaks: registers.md, Engineering and CS / Terminology. Technical specifications are stated.

## references/rules.md, Precision / Term defined at first use

- paragraph 22: "Each worker was pinned to one core within its NUMA node."
  Rule: rules.md, Precision / Term defined at first use. A technical term is defined where it first appears. "NUMA node" is not defined.

## references/rules.md, Precision / Pronoun with a clear antecedent

- paragraph 29: "The scheduler passed the task to a worker when it was ready."
  Rule: rules.md, Precision / Pronoun with a clear antecedent. "it" may refer to the scheduler, the task or the worker.

## references/rules.md, Objectivity / Claims rest on evidence

- paragraph 130: "We believe the fixed pool is the better design."
  Rule: rules.md, Objectivity / Claims rest on evidence. A claim rests on evidence, not on opinion.

## references/rules.md, Formality (manuscripts and grants) / Full forms

- paragraph 50: "The harness didn't retry a failed task."
  Rule: rules.md, Formality / Full forms. A contraction is written out.

## references/rules.md, Formality (manuscripts and grants) / No colloquial words

- paragraph 25: "The scheduler bailed out when the queue was full."
  Rule: rules.md, Formality / No colloquial words. The vocabulary is formal and academic. "bailed out" is a colloquialism.

## references/rules.md, Hedging / Hedge where a claim is uncertain

- paragraph 85: "Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool."
  Rule: rules.md, Hedging / Hedge where a claim is uncertain. A causal claim from correlational data, here four hosts, is hedged.

## references/rules.md, Hedging / No hedge on facts

- paragraph 49: "The harness appeared to stop each run after 60 seconds."
  Rule: rules.md, Hedging / No hedge on facts. The description of a method is stated without a hedge.

## references/rules.md, Transitions / Transition that states the relation

- paragraph 69: "The fixed pool created 64 threads. Consequently, the growing pool created 248 threads."
  Rule: rules.md, Transitions / Transition that states the relation. "Consequently" states a cause-and-effect relation that the two sentences do not have, and such a transition is cut.

## references/rules.md, Paragraphs / Claim with evidence or citation

- paragraph 70: "The fixed pool used less memory than the growing pool. The harness sampled memory once per second."
  Rule: rules.md, Paragraphs / Claim with evidence or citation. The claim is followed by the data that supports it. No memory figure is given.
  Also breaks: registers.md, Engineering and CS / Terminology. Performance metrics are stated.

## references/rules.md, Paragraphs / Evidence followed by what it means

- paragraph 68: "The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent."
  Rule: rules.md, Paragraphs / Evidence followed by what it means. Evidence is followed by an interpretation that connects it to the paragraph's claim. This paragraph has none.

## references/rules.md, Common style errors / Wordy phrase

- paragraph 33: "Due to the fact that all workers shared one queue, the head index was atomic."
  Rule: rules.md, Common style errors / Wordy phrase. "due to the fact that" is replaced with its concise form.

## references/rules.md, Common style errors / Vague phrase

- paragraph 34: "In recent years, hosts gained cores, so the thread counts of this study started at 8 and 64."
  Rule: rules.md, Common style errors / Vague phrase. "in recent years" is replaced with the specific claim.
  Also breaks: rules.md, Paragraphs / Claim with evidence or citation. "hosts gained cores" is not followed by data or a citation.

## references/rules.md, Reader's path / Clarity test

- paragraph 129: "A queue holds tasks until a worker is free. Servers use queues for that purpose."
  Rule: rules.md, Reader's path / Clarity test. A paragraph whose removal loses nothing is deleted.

## references/rules.md, Reader's path / So what per section

- paragraph 80: "A Mann-Whitney U test compared the two latency distributions and gave p below 0.001."
  Rule: rules.md, Reader's path / So what per section. The job of a Results section is to lead with the result, not the statistical test. Latency Results opens with the test.

## references/registers.md, Engineering and CS / Voice

- paragraph 55: "The authors chose 42 as the random seed."
  Rule: registers.md, Engineering and CS / Voice. The authors' decisions take "we", and the authors never refer to themselves in the third person.
