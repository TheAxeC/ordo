# /writing on sciences-tex, second run

Draft: `.scratch/3-the-writing-base/cases/sciences/main.tex`. Agent a3f7e7427fe01e4d2, claude-opus-5-5, 86060 tokens, 8 tool uses, 4 min 49 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/main.tex`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/main.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/sections.tex`

## The report, whole

Prose review of the draft in `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/sciences/` (`main.tex`, which inputs `sections.tex`)

The draft is a manuscript: it has an abstract, keywords and the sections Introduction, Method, Results, Discussion and Conclusion. So the (manuscripts and grants) rules of `references/rules.md` apply. The discipline is agroecology, and its register is Sciences (Natural, Applied). In the non-ASCII scan, `LC_ALL=C grep -n '[^ -~]'` found nothing in either file (exit status 1 for both).

## Prose standard, D. Structure: No synonym cycling

- `main.tex:27`: "The researchers identified each beetle to species."
  The rule asks for one term per concept, repeated. The authors are "We" at `main.tex:29` and elsewhere, and "The researchers" here.
  Also breaks: `references/registers.md`, Sciences (Natural, Applied) / Voice. The authors never refer to themselves in the third person.
- `main.tex:43`: "Farm size was an unlikely source of the width effect."
  The rule asks for one term per concept, repeated. The relation between width and species richness is "positively associated" and "the positive association" at `main.tex:37` and `main.tex:39`, and "the width effect" here.
- `sections.tex:15`: "Width thus appeared to shape the number of species in a plot and to leave their season of activity unchanged."
  The rule asks for one term per concept, repeated. The abstract defines "species richness" (`main.tex:8`), and this sentence calls it "the number of species in a plot". The sentence before it calls the same concept "The timing of activity", and this sentence calls it "their season of activity".
  Also breaks: `references/rules.md`, Transitions / Transition that states the relation. "thus" states cause and effect, but the sentence before (no link between timing and width) supports only the second half. The claim that width shapes the number of species comes from the Richness Results, not from that sentence.
- `sections.tex:23`: "Older hedgerows are wider in this sample, so age may explain part of the gain."
  The rule asks for one term per concept, repeated. The Results call the relation between width and species richness "the positive association", and here it is "the gain".
- `sections.tex:27`: "The gain relates to width, not to hedgerow length, since every transect was 20 m long."
  The rule asks for one term per concept, repeated. The same relation is "the positive association" in the Results and "the gain" here.

## Prose standard, E. Sentence shapes: Passive voice

- `main.tex:33`: "Beetles were counted in the laboratory under a microscope by two observers who worked independently."
  The rule asks for the passive to be rewritten unless the actor is irrelevant. The sentence names its actor, and the next sentence relies on that actor (the two observers' agreement).
- `main.tex:33`: "the counts were used without correction"
  The rule asks for the passive to be rewritten unless the actor is irrelevant. The clause reports a decision whose actor is the authors.
  Also breaks: `references/registers.md`, Sciences (Natural, Applied) / Voice. The authors' decisions take "we".

## references/rules.md, Objectivity: Claims rest on evidence

- `sections.tex:25`: "A 5 m strip removes land from the crop; the same strip holds 16 species on average. Farmers therefore weigh a loss of cropland against a gain in species."
  The rule asks for a claim to rest on evidence, not on opinion. The draft has no data on how farmers decide. The 16 species reported at `main.tex:39` were for plots wider than 5 m, not for a 5 m strip.
  Also breaks: `references/rules.md`, Hedging / Hedge where a claim is uncertain. "holds 16 species on average" is a generalization from a limited sample (24 plots in one region, `main.tex:21`, `main.tex:29`), stated without a hedge.

## references/rules.md, Paragraphs: Evidence followed by what it means

- `main.tex:47`: "Hedgerow age rose with width (r = 0.64, p = .001), so the older hedgerows were also the wider ones."
  The rule asks for evidence in a paragraph to be followed by an interpretation that connects it to the paragraph's claim. The clause after "so" restates the correlation and does not interpret it.

## references/rules.md, Common style errors: Vague phrase

- `sections.tex:11`: "A survey limited to late summer would therefore have missed most of the activity."
  The rule asks for a vague phrase to be replaced with the specific claim. "late summer" names no months, and "most of the activity" gives no share of the captures.

## references/rules.md, Reader's path: Clarity test

- `main.tex:25`: "Soil moisture was sampled 6 inches below the surface."
  The rule asks for a paragraph whose removal loses nothing to be deleted. Soil moisture appears in no result, discussion point or conclusion, and the paper makes the same sense without this paragraph.
  Also breaks: `references/registers.md`, Sciences (Natural, Applied) / Terminology. Measurements are in SI units, and "6 inches" is not an SI unit.
- `sections.tex:13`: "We were delighted to find Carabus auratus in the third hedgerow."
  The rule asks for a paragraph whose removal loses nothing to be deleted. The paragraph bears on no hypothesis, result or conclusion.
  Also breaks: `references/registers.md`, Sciences (Natural, Applied) / Register. The text is formal, impersonal and focused on the method.

## references/rules.md, Reader's path: Reader's four questions

- `sections.tex:3`: "A second survey recorded when ground beetles were most active."
  The rule asks that at any point the reader can answer "Why am I here?" through the connection to the research question. The Introduction states one research question and one hypothesis, both about richness and width (`main.tex:17`). It never mentions the activity survey, and this section opens without a connection to that question.

## references/rules.md, Reader's path: So what per section

- `sections.tex:3`: "Beetles were sampled along hedgerows."
  The rule asks a Methodology section to answer "Can I trust these results?" by showing rigor. The Activity Method gives no trap type, plot count, sampling interval or sampling dates.
  Also breaks: `references/registers.md`, Sciences (Natural, Applied) / What the reader looks for. The reader looks for precision of measurement and method, and a methods section gives it.
