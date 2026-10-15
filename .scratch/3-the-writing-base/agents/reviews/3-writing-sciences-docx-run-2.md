# /writing on sciences-docx, second run

Draft: `.scratch/3-the-writing-base/cases/sciences/draft.docx`. Agent a5237796b250abb4e, claude-opus-5-5, 84715 tokens, 6 tool uses, 4 min 50 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

Review of `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/draft.docx`. I read the draft with `docx_paragraphs.py`, which printed 38 body paragraphs and no paragraphs from other parts of the file. The non-ASCII scan (`... | LC_ALL=C grep -n '[^ -~]'`) printed nothing and exited 1. The draft is an ecology field study of hedgerows and ground beetles, so I applied the Sciences (Natural, Applied) register. It has a title, an abstract, keywords, Introduction, Method, Results, Discussion and Conclusion, so it is a manuscript and I applied the rules marked (manuscripts and grants).

## Prose standard, 0. Hard rules, No repeated construction (a sentence shape that recurs across sections is a template and is rewritten)

- paragraph 18: "Three species occurred only in hedgerows wider than 6 m, so width may have decided which species could persist." This is the first of three sentences in the same shape, an observation followed by ", so" and an inference, in Richness Results (paragraphs 18 and 21) and in the Discussion (paragraph 33).
- paragraph 21: "Hedgerow age rose with width (r = 0.64, p = .001), so the older hedgerows were also the wider ones." This is the second sentence of that shape.
  Also breaks references/rules.md, Paragraphs / Evidence followed by what it means: the clause after "so" says the correlation again, and no interpretation connects the evidence to the paragraph's claim.
- paragraph 33: "Older hedgerows are wider in this sample, so age may explain part of the gain." This is the third sentence of that shape.
  Also breaks the prose standard, D. Structure / No synonym cycling: "the gain" is a further name for the width and species-richness association that paragraphs 16 and 17 call "the positive association".

## Prose standard, A. Vocabulary (a vague qualifier is replaced with the number or the specific claim)

- paragraph 27: "A survey limited to late summer would therefore have missed most of the activity." The vague qualifier is "most".
  Also breaks references/rules.md, Common style errors / Vague phrase: "late summer" is a vague phrase, and the rule asks for the specific claim.

## Prose standard, D. Structure, No synonym cycling (one term per concept, repeated)

- paragraph 11: "The researchers identified each beetle to species." The authors are "we" in paragraphs 2, 12 and 36 and "the researchers" here.
  Also breaks references/registers.md, Sciences (Natural, Applied) / Voice: the authors never refer to themselves in the third person, and a procedure takes the passive.
- paragraph 19: "Farm size was an unlikely source of the width effect." The association called "the positive association" in paragraphs 16 and 17 is called "the width effect" here.
  Also breaks references/rules.md, Hedging / Hedge where uncertain: "effect" makes a causal claim from correlational data, and it is not hedged.
- paragraph 32: "The pattern matches earlier surveys in Denmark (Holm, 2012)." The finding is called "The result" in paragraph 31 and "The pattern" here. Paragraph 25 also uses "the pattern" for a different concept, the seasonal activity pattern.
- paragraph 35: "The gain relates to width, not to hedgerow length, since every transect was 20 m long." This uses "The gain" for the same association.
  Also breaks references/rules.md, Objectivity / Claims rest on evidence: the evidence given, a fixed transect length, does not support the claim that the gain is unrelated to hedgerow length, and the draft does not report hedgerow length.

## references/rules.md, Objectivity / Claims rest on evidence (a claim rests on evidence, not on opinion)

- paragraph 12: "We kept the plots at least 100 m apart so that the samples stayed independent." The claim that 100 m makes the samples independent has no data and no citation.
  Also breaks references/rules.md, Paragraphs / Claim with evidence or citation.
- paragraph 34: "A 5 m strip removes land from the crop; the same strip holds 16 species on average." The evidence for 16 species, in paragraph 17, is for plots wider than 5 m, not for a 5 m strip.
  Also breaks references/rules.md, Hedging / Hedge where uncertain: it generalises from a limited sample (24 plots in one region) and is not hedged.

## references/rules.md, Formality / No colloquial words (the vocabulary is formal and academic)

- paragraph 28: "We were delighted to find Carabus auratus in the third hedgerow."
  Also breaks references/rules.md, Reader's path / Clarity test: the paper loses nothing if this paragraph is removed.
  Also breaks references/registers.md, Sciences (Natural, Applied) / Register: the text is formal, impersonal and focused on the method.

## references/rules.md, Transitions / Transition that states the relation (a transition states the relation its sentence has to the sentence before it)

- paragraph 29: "Width thus appeared to shape the number of species in a plot and to leave their season of activity unchanged." The sentence before it reports no link between width and timing. That supports only the second half of this sentence, so "thus" states a cause-and-effect relation the first half does not have.

## references/rules.md, Reader's path / Clarity test (a paragraph whose removal loses nothing is deleted)

- paragraph 10: "Soil moisture was sampled 6 inches below the surface." Soil moisture is not mentioned anywhere else in the draft.
  Also breaks references/registers.md, Sciences (Natural, Applied) / Terminology: measurements are precise and in SI units.

## references/rules.md, Reader's path / Reader's four questions (at any point the reader can answer "Why am I here?" from the connection to the research question)

- paragraph 23: "A second survey recorded when ground beetles were most active." The Introduction states only the width and species-richness hypothesis (paragraph 6). Nothing at this point connects the activity survey to that research question, and the Discussion does not mention it.

## references/registers.md, Sciences (Natural, Applied) / What the reader looks for (precision of measurement and method, given in a methods or results section)

- paragraph 23: "Beetles were sampled along hedgerows." The Activity Method does not give the number of plots or traps, the sampling method, the sampling period or the year.
