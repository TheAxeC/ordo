# /writing on sciences-docx

Draft: `.scratch/3-the-writing-base/cases/sciences/draft.docx`. Agent a00c480376f117436, claude-opus-5-5, 71753 tokens, 6 tool uses, 2 min 49 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

Review of `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/draft.docx`. The draft is a manuscript with a title, abstract, keywords, Introduction, Method, Results, Discussion and Conclusion, so the (manuscripts and grants) rules apply. Its discipline is agroecology, so the Sciences (Natural, Applied) register applies. The non-ASCII scan of the printed paragraphs returned no lines.

## prose-standard.md, D. Structure, "No synonym cycling"

- paragraph 1: "Hedgerow Width and Ground Beetle Diversity on Arable Farms". The rule asks for one term per concept, repeated. The title calls the measured quantity "Diversity", but the abstract, keywords and body call it "species richness".
  Also breaks: references/rules.md, Precision / Most specific term.

## prose-standard.md, E. Sentence shapes, "Restating closes"

- paragraph 32: "Beetles were therefore most active in early summer." The rule asks for a final sentence that says the paragraph again in shorter words to be cut. This sentence restates "Beetle activity peaked in June".

## prose-standard.md, E. Sentence shapes, "Passive voice"

- paragraph 7: "Species richness, the number of species in a plot, was expected to rise with hedgerow width." The rule asks for the passive to be rewritten unless the actor is irrelevant. The actor of the expectation is the authors, and it is their hypothesis.
  Also breaks: references/registers.md, Sciences (Natural, Applied) / Voice.

## references/rules.md, Precision / Term defined at first use

- paragraph 2: "species richness rose by 3.1 species per additional metre of hedgerow width". The rule asks for a technical term to be defined where it first appears. "Species richness" first appears here, but its definition stands at paragraph 7.
- paragraph 2: "A second survey found peak beetle activity in June." The rule asks for a technical term to be defined where it first appears. "Beetle activity" is defined nowhere. Paragraph 32 measures it as a share of captures without saying so.
- paragraph 25: "Wide hedgerows held 9 forest specialists and narrow hedgerows held 2". The rule asks for a technical term to be defined where it first appears. "Forest specialists" is not defined.
  Also breaks: references/rules.md, Common style errors / Vague phrase ("Wide" and "narrow" give no widths).

## references/rules.md, Objectivity / Claims rest on evidence

- paragraph 38: "Older hedgerows are wider in this sample, so age may explain part of the gain." The rule asks for a claim to rest on evidence. The draft reports no measurement of hedgerow age, and the next sentence proposes an age survey as future work.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation.

## references/rules.md, Hedging / Hedge where a claim is uncertain

- paragraph 36: "Wider hedgerows hold more species, which suggests that width adds habitat." The rule asks for a generalization from a limited sample to be hedged. This sentence states the result as a general fact, but paragraph 15 says all plots lay in one region.

## references/rules.md, Transitions / Transition that states the relation

- paragraph 22: "Plots wider than 5 m held 16 species on average. Richness therefore kept rising at the wide end of the width range." The rule asks for a transition to state a relation the two sentences have, and for one they do not have to be cut. A mean of 16 species above 5 m does not show that richness kept rising within that range, so "therefore" states a cause-and-effect relation the sentences lack.

## references/rules.md, Common style errors / Vague phrase

- paragraph 23: "Three species occurred only in the widest hedgerows." The rule asks for a vague phrase to be replaced with the specific claim. "The widest hedgerows" gives no width.

## references/rules.md, Reader's path / Clarity test

- paragraph 11: "Soil moisture was sampled 6 inches below the surface." The rule asks for a paragraph to be deleted if removing it loses nothing. Soil moisture is not reported or used anywhere else in the draft.
  Also breaks: references/registers.md, Sciences (Natural, Applied) / Terminology (the measurement is in inches, not SI units).
- paragraph 33: "We were delighted to find Carabus auratus in the third hedgerow." The rule asks for a paragraph to be deleted if removing it loses nothing. The sentence reports neither richness nor the timing of activity, and no numbered hedgerow is defined.
  Also breaks: references/registers.md, Sciences (Natural, Applied) / Register (formal and impersonal).

## references/rules.md, Reader's path / So what per section

- paragraph 28: "Beetles were sampled along hedgerows." The rule asks the Methodology section to show rigor. The Activity Method section gives no number of hedgerows or traps, no trap type and no sampling interval or dates.
  Also breaks: references/registers.md, Sciences (Natural, Applied) / What the reader looks for (precision of measurement and method).

## references/registers.md, Sciences (Natural, Applied) / Voice

- paragraph 12: "The researchers identified each beetle to species." The rule asks that the authors never refer to themselves in the third person.
