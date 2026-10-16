# /writing on sciences-tex

Draft: `.scratch/3-the-writing-base/cases/sciences/main.tex`. Agent a77cd3d2e2044f130, claude-opus-5-5, 72182 tokens, 8 tool uses, 2 min 48 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/main.tex`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/main.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/sections.tex`

## The report, whole

## docs/dev/prose-standard.md, D. Structure, "Vary paragraph length"

- `main.tex:25-35`: "Pitfall traps were placed 1 m apart along a 20 m transect." / "Soil moisture was sampled 6 inches below the surface." / "The researchers identified each beetle to species." / "We kept the plots at least 100 m apart so that the samples stayed independent." / "The traps were emptied every 7 days from April to September." / "A limitation of the richness survey was that all plots lay in one region." The rule asks for varied paragraph lengths, because uniform blocks are a template. These are six one-sentence paragraphs in a row.
- `sections.tex:3-9`: "A second survey recorded when ground beetles were most active." / "Beetles were sampled along hedgerows." / "Species were identified from published keys." / "Only one season was sampled, and the pattern may differ in other years." The rule asks for varied paragraph lengths. The whole Activity Method section is four one-sentence paragraphs in a row.

## docs/dev/prose-standard.md, E. Sentence shapes, "Restating closes"

- `sections.tex:13`: "Beetles were therefore most active in early summer." The rule asks for a final sentence that only says the paragraph again in shorter words to be cut. This sentence repeats the paragraph's opening, "Beetle activity peaked in June, with 41 percent of all captures."

## docs/dev/prose-standard.md, E. Sentence shapes, "Passive voice"

- `main.tex:19`: "Species richness, the number of species in a plot, was expected to rise with hedgerow width." The rule asks for the passive to be rewritten unless the actor is irrelevant. Here the actor is whoever held the expectation, and the sentence does not say who that was.
  Also breaks: references/registers.md, Sciences (Natural, Applied), "Voice": the authors' decisions, contributions and results take "we".

## references/rules.md, Precision, "Term defined at first use"

- `main.tex:8`: "species richness rose by 3.1 species per additional metre of hedgerow width". The rule asks for a technical term to be defined where it first appears. "Species richness" first appears here, in the abstract, and is used again at main.tex:17 ("ground beetle richness"). It is defined only at main.tex:19.

## references/rules.md, Hedging, "Hedge where a claim is uncertain"

- `sections.tex:21`: "Wider hedgerows hold more species, which suggests that width adds habitat." The rule asks for a generalization from a limited sample to be hedged. The first clause states a general present-tense claim from 24 plots that, by main.tex:35, all lay in one region.

## references/rules.md, Transitions, "Transition that states the relation"

- `main.tex:49`: "Plots wider than 5 m held 16 species on average. Richness therefore kept rising at the wide end of the width range." The rule asks for a transition to state a relation the two sentences actually have, and for one they do not have to be cut. A single average for plots wider than 5 m does not show that richness kept rising within the wide end of the range, so "therefore" claims a cause-and-effect relation the sentences lack.

## references/rules.md, Paragraphs, "Claim with evidence or citation"

- `sections.tex:25`: "Older hedgerows are wider in this sample, so age may explain part of the gain." The rule asks for a claim to be followed by the data, citation or example that supports it. Neither method section reports any measure of hedgerow age, and the next sentence calls for "A survey of hedgerow age on the same plots".

## references/rules.md, Common style errors, "Vague phrase"

- `sections.tex:7`: "Species were identified from published keys." The rule asks for a vague phrase to be replaced with the specific claim, as in the rule's own example of "some researchers" giving way to the researchers named with citations. The keys are neither named nor cited.
  Also breaks: references/registers.md, Sciences (Natural, Applied), "What the reader looks for": precision of method, given in a methods section.

## references/rules.md, Reader's path, "Clarity test"

- `main.tex:27`: "Soil moisture was sampled 6 inches below the surface." The rule asks for a paragraph whose removal loses nothing to be deleted. Soil moisture appears nowhere else in the draft, in the results, the discussion or the conclusion.
  Also breaks: references/registers.md, Sciences (Natural, Applied), "Terminology": measurements in SI units, and "6 inches" is not an SI unit.
- `sections.tex:15`: "We were delighted to find Carabus auratus in the third hedgerow." The rule asks for a paragraph whose removal loses nothing to be deleted. The find is not connected to the activity result or to any later section, and "the third hedgerow" refers to no numbering given anywhere in the draft.
  Also breaks: references/registers.md, Sciences (Natural, Applied), "Register": the text is formal, impersonal and focused on the method.

## references/rules.md, Reader's path, "So what per section"

- `sections.tex:5`: "Beetles were sampled along hedgerows." The rule asks the methodology section to answer "Can I trust these results?" by showing rigor. The Activity Method section gives no trap type, number of plots or traps, sampling dates or interval.
  Also breaks: references/registers.md, Sciences (Natural, Applied), "What the reader looks for": precision of measurement and method, given in a methods section.

## references/registers.md, Sciences (Natural, Applied), "Voice"

- `main.tex:29`: "The researchers identified each beetle to species." The rule asks that the authors never refer to themselves in the third person.
