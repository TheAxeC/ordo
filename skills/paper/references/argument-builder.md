# Argument builder

The argument builder agent reads this page to build the argument of the paper on the outline. It writes `arguments.md` in the run folder and changes no other file. The draft writer follows the argument, and the session shows it to the user, with any weak-argument signs, at the stop "The outline's approval".

## What the agent reads

- `config.md`: Research question, Discipline and the Notes.
- `outline.md`, with its evidence map.
- `review.md` of the literature strategist, when it ran, for the sources with their annotations and stance. Otherwise the entries of the manuscript's `.bib` or `refs.bib`.
- The project's own results that the Materials in hand row names.

The evidence of an argument is a result that a source reports, taken from its annotation and cited as `[@key]`, or a result of the project's own work. A claim with no such evidence is listed as unsupported in the argument strength assessment, and the agent adds no evidence from memory.

## The thesis

The thesis is clear, specific and arguable. It has this form:

```
This paper argues that <claim> because <reason 1>, <reason 2> and <reason 3>, based on <evidence type>.
```

- It is specific: neither too broad nor too narrow.
- It is arguable: reasonable people could disagree with it.
- It is supportable: the evidence exists or can be gathered.
- It is relevant: it addresses the research question.

## The sub-arguments

The thesis breaks into 3 to 5 sub-arguments. Each rests on a chain of claim, evidence and reasoning:

| Component | What it holds | Example |
|---|---|---|
| Claim | What the paper asserts. | The method lowers the variance of the estimates. |
| Evidence | What supports it. | `[@key]` reports a 23 percent lower variance on the benchmark. |
| Reasoning | Why the evidence supports the claim. | A lower variance means the estimates agree more across runs. |

The sub-arguments are written as a tree:

```
Central thesis: <main claim>
|- Sub-argument 1: <supporting claim>
|  |- Evidence A: <source and result>
|  |- Evidence B: <source and result>
|  `- Reasoning: <why A and B support the claim>
|- Sub-argument 2: <supporting claim>
`- Synthesis: <how the sub-arguments together support the thesis>
```

## Counter-arguments and rebuttals

Each sub-argument gets its strongest counter-argument and a rebuttal strategy:

| Sub-argument | Counter-argument | Rebuttal strategy |
|---|---|---|
| <claim> | <the strongest objection> | One of the four strategies below. |

The four rebuttal strategies:

1. **Refute.** Show that the counter-argument is factually wrong.
2. **Concede and limit.** Accept part of the objection and show that it does not defeat the argument.
3. **Reframe.** Show that the counter-argument supports the thesis from a different angle.
4. **Acknowledge as a limitation.** Discuss the scope boundary honestly.

## The logical flow

The flow maps the argument section by section onto the outline:

```
Introduction: problem, gap, purpose, research question
Related work: context, theme 1, theme 2, theme 3, gap confirmed
Method: approach justified, data described, analysis explained
Results: result 1 (supports sub-argument 1), result 2 (supports sub-argument 2)
Discussion: interpretation, comparison with the literature, counter-arguments addressed
Conclusion: thesis restated, implications, future research
```

The pattern of the discipline shapes the argument:

| Discipline | Pattern |
|---|---|
| Natural sciences | Hypothesis, test, support or reject |
| Social sciences | Theory, evidence, interpretation |
| Humanities | Close reading, analysis, argument |
| Engineering | Problem, solution, validation |
| Education | Context, intervention, outcome, implication |
| Policy | Problem, evidence, options, recommendation |

## The weak-argument signs

The agent checks each core argument for these signs:

- Circular reasoning: the conclusion restates the premise in other words.
- An appeal to authority without evidence: "Expert X says so" with no data.
- A hasty generalization: a single case generalized to a whole population.
- A false dichotomy: two options presented when more exist.
- Correlation treated as causation without controlling for confounds.
- Evidence from a single cultural or geographic context generalized globally.
- A key term that is undefined or used inconsistently across sections.
- A counter-argument that is stronger than the paper's own argument.

- Two or more signs in a core argument stop the drafting.
- The agent lists those signs under "Weak-argument signs" with the argument they belong to, and the session shows them to the user at the stop "The outline's approval".
- One sign is noted in the argument strength assessment and does not stop the drafting.
- No sign found is written as "No weak-argument signs."

## The file

`arguments.md` has this form:

```
## Argument blueprint

### Central thesis
<One or two sentences.>

### Sub-arguments
#### Sub-argument 1: <claim>
- **Evidence**: <source and result>
- **Reasoning**: <the logical connection>
- **Counter-argument**: <the strongest objection>
- **Rebuttal**: <the strategy and its response>

### Logical flow
<The progression section by section.>

### Argument strength assessment
| Sub-argument | Evidence strength | Logic validity | Counter-argument risk |
|---|---|---|---|
| 1 | Strong, Moderate or Weak | Valid or Qualified | Low, Medium or High |

### Weak-argument signs
<The signs found, or "No weak-argument signs.">

### Notes for the draft writer
<Guidance on tone, hedging language and emphasis.>
```

The agent checks before it writes the file that:

- the thesis is clear, specific and arguable.
- at least 3 sub-arguments support it.
- every claim has at least one cited evidence source.
- every sub-argument has a counter-argument, and every counter-argument has a rebuttal strategy.
- the logical flow covers all major sections of the outline.
- the strength assessment flags the weak points honestly.
- no argument commits a logical fallacy such as a straw man, an attack on the person or a false dichotomy.
