# /writing on engineering-docx

Draft: `.scratch/3-the-writing-base/cases/engineering/draft.docx`. Agent a73d92751943d4fbf, claude-opus-5-5, 85019 tokens, 6 tool uses, 4 min 8 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

A character outside ASCII in the report is written by its name in angle brackets, such as `<em dash>`.

Review of `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/engineering/draft.docx`

The draft was read through `docx_paragraphs.py`, which printed 148 body paragraphs and no footnotes or other parts. The non-ASCII scan of that output found characters in paragraphs 107, 108, 120, 121 and 124. The draft has a title, an abstract, keywords, an Introduction, a literature review, Method and Results sections, a Discussion, a Conclusion and author-date citations, so it is a manuscript and the rules marked (manuscripts and grants) apply. Its discipline is server software and concurrent systems, so the Engineering and CS register applies.

## The prose standard, section 0, Hard rules: "Em dash: zero" (no em dash, en dash, spaced hyphen or `--` used as an aside)

- paragraph 104: "The fixed pool reduces contention---the main cost of the lock-based queue."
- paragraph 105: "The growing pool creates threads -- up to 256 of them -- inside the request path."
- paragraph 106: "The ring buffer is bounded - a full queue rejects new tasks."
- paragraph 107: "The pinned workers keep their caches warm <em dash> a gain the growing pool cannot match."
  Also breaks: the prose standard, section B, Punctuation, "ASCII throughout".
- paragraph 108: "The growing pool pays for each new thread <en dash> a cost the fixed pool pays once."
  Also breaks: the prose standard, section B, Punctuation, "ASCII throughout".

## The prose standard, section 0, Hard rules: "Plain prose only" (no quips and no cute contrasts; state the fact and stop)

- paragraph 110: "A mutex is a turnstile and a ring buffer is an open door."

## The prose standard, section 0, Hard rules: "No performative asides" (no variant of "which is exactly when you want to know")

- paragraph 112: "Contention rises with the thread count, which is exactly when the fixed pool matters."

## The prose standard, section 0, Hard rules: "Arrows (`->`) only inside code and code comments" (never as prose punctuation; rewrite as a sentence)

- paragraph 123: "Submission order is producer -> queue."
- paragraph 124: "Completion order is queue <rightwards arrow> worker."
  Also breaks: the prose standard, section B, Punctuation, "ASCII throughout".

## The prose standard, section 0, Hard rules: "No chatbot framing" (no closing offer of further help)

- paragraph 114: "Contact us if further data would help."

## The prose standard, section A, Vocabulary: banned filler words (cut, or replace with the concrete fact)

- paragraph 116: "The fixed pool is a simple change to the scheduler."

## The prose standard, section A, Vocabulary: vague qualifiers (replace with the number or the specific claim)

- paragraph 117: "The growing pool is typically idle between bursts."

## The prose standard, section A, Vocabulary: flagged terms (each use must be the most precise word, not a default)

- paragraph 118: "The fixed pool leverages every core of the host."

## The prose standard, section B, Punctuation: "Semicolons: at most 2 per 1000 words of running prose"

- paragraph 126: "The queue is bounded; its ring buffer holds 4096 slots; each slot holds one task; no slot holds two; the free slots decide every write. A producer checks the free slots before it writes; a full queue rejects the write; the harness counts each rejection." This paragraph has six semicolons, and they are the only semicolons I found when reading the draft. I estimate the draft's running prose at about 2,400 words by reading, which allows about five. The word count was not verified by a command, because the brief allows only the two listed commands.

## The prose standard, section B, Punctuation: "Never two or more consecutive paragraphs that each open with a colon and a list"

- paragraph 35 and paragraph 36: "Inputs: queue depth and thread count." / "Outputs: tasks per second and tail latency."

## The prose standard, section B, Punctuation: "ASCII throughout" (straight quotes, three dots)

- paragraph 120: "The report prints the status <left double quotation mark>complete<right double quotation mark> after each run."
- paragraph 121: "The harness counts rejected tasks<horizontal ellipsis> and reports the total."

## The prose standard, section C, Throat-clearing and meta-commentary: listed openers (delete the opener; "When it comes to" is on the list)

- paragraph 26: "When it came to growth, the growing pool stopped at 256 threads."

## The prose standard, section C, Throat-clearing and meta-commentary: "Never describe what the page is about to do" ("This section explains" is cut)

- paragraph 86: "This section explains how the fixed pool lowers the tail."

## The prose standard, section C, Throat-clearing and meta-commentary: "Never open a paragraph by recapping the prior one" ("With this setup complete" is listed; pivot directly)

- paragraph 37: "With this setup complete, the harness submitted the first task."

## The prose standard, section D, Structure: "No rule of three" (do not pad a list to three items)

- paragraph 98: "The fixed pool is small, compact and light."
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation.

## The prose standard, section D, Structure: "Paragraphs cover one idea and stay under roughly four sentences" (split anything longer or covering two)

- paragraph 128: "The harness records each task twice. It stamps the submission time on entry. It stamps the completion time on exit. The host also reports memory use once per second. The harness writes the report after the run. A summary file holds the totals." This paragraph has six sentences and covers task timestamps, memory sampling and the report.
  Also breaks: the prose standard, section E, Sentence shapes, "Sentence length" (five or more consecutive sentences of the same length are rewritten).

## The prose standard, section D, Structure: "No synonym cycling" (one term per concept, repeated)

- paragraph 93: "The fixed pool allocates all 64 threads at launch, which removes thread creation from the request path. The growing pool allocates its threads one at a time." The draft calls thread creation "creates" or "created" elsewhere, for example in paragraphs 64, 69 and 87, and "creation" in this same sentence.
- paragraph 100: "The queue holds tasks. The buffer orders them by arrival. The channel feeds the workers."

## The prose standard, section D, Structure: "Binary contrast ('not X, Y') at most twice per page", and only where the contrast is the point

- paragraph 127: "The fixed pool has a constant thread count, not a variable one. It pins each worker to a core, not to a socket. It places the queue on core 8, not on a worker core."

## The prose standard, section D, Structure: "Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon."

- paragraph 102: "The log holds the run number, the host name, the pool type and the elapsed time."
- paragraph 133: "The harness writes four result files." This sentence introduces the numbered list in paragraphs 134 to 137 and ends with a full stop instead of a colon.

## The prose standard, section E, Sentence shapes: "Spec-sheet voice" ("provides", "is configurable"; say what the code does)

- paragraph 94: "The queue provides bounded submission and is configurable."

## The prose standard, section E, Sentence shapes: "Stop-start fragments" (one dependent idea split into fragments; join them)

- paragraph 92: "The growing pool creates threads on demand. Static in the fixed pool."

## The prose standard, section E, Sentence shapes: "Cold opens" (a body paragraph whose first sentence has no antecedent, so "this" is a guess)

- paragraph 88: "This raises the tail."

## The prose standard, section E, Sentence shapes: "Restating closes" (a final sentence that says the paragraph again in shorter words; cut it)

- paragraph 91: "In short, pinned workers keep their caches."

## The prose standard, section E, Sentence shapes: "Personified artifacts for colour are banned"

- paragraph 90: "The cache is happy when a worker stays on one core."

## The prose standard, section E, Sentence shapes: "Rhetorical questions: avoided, except a question a section answers as its subject"

- paragraph 96: "What does the harness log?"

## The prose standard, section E, Sentence shapes: "Passive voice: rewrite unless the actor is irrelevant"

- paragraph 97: "The summary file is written by the harness."

## The prose standard, section E, Sentence shapes: "Sentence length: under roughly 20 words unless the mechanism needs more"

- paragraph 66: "The throughput of the fixed pool on the fourth host, the host with the most cores of the four, was the highest value that any run of the study produced." This sentence has 30 words.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point. The paragraph's point, "A fixed pool may therefore scale with the core count of its host.", is in its last sentence.

## The prose standard, section F, Emphasis and formatting: "No ALL-CAPS emphasis in prose"

- paragraph 132: "The fixed pool leads on ALL four hosts."

## references/rules.md, Precision / Term defined at first use (a technical term is defined where it first appears)

- paragraph 22: "Each worker was pinned to one core within its NUMA node."

## references/rules.md, Precision / Pronoun with a clear antecedent (a pronoun such as "it" has a clear antecedent)

- paragraph 29: "The scheduler passed the task to a worker when it was ready." The "it" can refer to the scheduler, the task or the worker.

## references/rules.md, Concision / One idea per sentence (manuscripts and grants) (a sentence carries one idea, or clearly connected ideas)

- paragraph 31: "The harness was written in C, and the third host was installed in 2021."

## references/rules.md, Objectivity / Claims rest on evidence (a claim rests on evidence, not on opinion)

- paragraph 130: "We believe the fixed pool is the better design."

## references/rules.md, Formality (manuscripts and grants) / Full forms (a contraction is written out)

- paragraph 50: "The harness didn't retry a failed task."

## references/rules.md, Formality (manuscripts and grants) / No colloquial words (the vocabulary is formal and academic)

- paragraph 25: "The scheduler bailed out when the queue was full."

## references/rules.md, Hedging / Hedge where a claim is uncertain (a causal claim from correlational data and a generalization from a limited sample are hedged)

- paragraph 85: "Hosts with more cores show larger gains, so core count raises the benefit of a fixed pool." This is a causal claim drawn from four hosts and is stated without a hedge.

## references/rules.md, Hedging / No hedge on facts (the description of a method and reported data are stated without a hedge)

- paragraph 49: "The harness appeared to stop each run after 60 seconds."

## references/rules.md, Transitions / Transition that states the relation (a transition whose relation the two sentences do not have is cut)

- paragraph 64: "Creating them therefore took 6 percent of each run." The 6 percent share does not follow from the count of 248 threads in the sentence before.
- paragraph 69: "The fixed pool created 64 threads. Consequently, the growing pool created 248 threads."

## references/rules.md, Paragraphs / First sentence states the point (a paragraph's first sentence states its main point)

- paragraph 64: "The growing pool created 248 threads during each run." The paragraph's point, "Thread creation alone thus explains only part of the 24 percent gap.", is in its last sentence.

## references/rules.md, Paragraphs / Claim with evidence or citation (a claim is followed by the data, the citation or the example that supports it)

- paragraph 70: "The fixed pool used less memory than the growing pool." No memory figure follows.
  Also breaks: references/registers.md, Engineering and CS / Terminology (performance metrics are stated).

## references/rules.md, Paragraphs / Evidence followed by what it means (evidence is followed by an interpretation that connects it to the paragraph's claim)

- paragraph 68: "The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent."

## references/rules.md, Common style errors / Wordy phrase (a wordy phrase is replaced with its concise form; "due to the fact that" is listed)

- paragraph 33: "Due to the fact that all workers shared one queue, the head index was atomic."

## references/rules.md, Common style errors / Vague phrase (a vague phrase is replaced with the specific claim; "in recent years" is listed)

- paragraph 28: "The benchmark ran on a modern server."
  Also breaks: references/registers.md, Engineering and CS / Register (precise about specifications).
- paragraph 34: "In recent years, hosts gained cores, so the pool sizes of this study started at 8 and 64 threads."

## references/rules.md, Reader's path / Clarity test (a paragraph whose removal loses nothing is deleted)

- paragraph 13: "The correctness proof of this design fits into two pages (Jones, 2020)."
- paragraph 129: "A queue holds tasks until a worker is free. Servers use queues for that purpose."

## references/rules.md, Reader's path / So what per section (the Results section leads with the result, not the statistical test)

- paragraph 80: "A Mann-Whitney U test compared the two latency distributions and gave p below 0.001." This is the first sentence of the Latency Results section.

## references/registers.md, Engineering and CS / Voice (the authors' decisions take "we"; the authors never refer to themselves in the third person)

- paragraph 55: "The authors chose 42 as the random seed."
