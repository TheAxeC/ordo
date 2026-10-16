# /writing on social-docx, second run

Draft: `.scratch/3-the-writing-base/cases/social/draft.docx`. Agent a3850563e0de9aa84, claude-opus-5-5, 70979 tokens, 6 tool uses, 2 min 37 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

## Prose standard, 0. Hard rules, "Plain prose only"

- paragraph 37: "The interviews suggest a mechanism; the survey shows its size." The rule asks for plain prose with no punchy one-line summaries and no cute contrasts: state the fact and stop. This one-sentence paragraph sums up the two studies as a balanced pair of half-sentences.
  Also breaks: `references/rules.md`, Hedging / Hedge where a claim is uncertain. The rule asks for a hedge on a causal claim drawn from correlational data. "the survey shows its size" presents the cross-sectional survey difference as the size of a causal mechanism, without a hedge.

## Prose standard, 0. Hard rules, "No repeated construction"

- paragraph 6: "A loss of trust after a merger would thus reach many of them." The rule asks that a sentence shape which recurs across sections be rewritten. This is one of 4 paragraph-closing sentences shaped "subject + thus + conclusion from the sentence before", in the Introduction, Interview Results and Survey Results (paragraphs 6, 18, 28, 30).
  Also breaks: Prose standard, A. Vocabulary, vague qualifiers. "many" is to be replaced with the number or the specific claim.
  Also breaks: `references/rules.md`, Paragraphs / First sentence states the point. The paragraph's main point, that a loss of trust would reach many residents, stands in this closing sentence. The first sentence only gives the 18 percent figure.
- paragraph 18: "A nearby office thus appeared to preserve that contact." Same rule. This is the second of the 4 sentences of this shape.
- paragraph 28: "Those who had lost an office thus fell just below the scale's neutral point, and the others above it." Same rule. This is the third of the 4 sentences of this shape.
- paragraph 30: "Years of residence thus related more closely to trust than age did." Same rule. This is the fourth of the 4 sentences of this shape.
  Also breaks: Prose standard, E. Sentence shapes, "Restating closes". The rule asks that a final sentence which says the paragraph again in shorter words be cut. This sentence restates the two correlations given just before it (r = .18 against r = .04).

## Prose standard, E. Sentence shapes, "Cold opens"

- paragraph 39: "The loss appears to concern voice, not service quality, since six participants described better services." The rule asks that a body paragraph's first sentence carry the prior subject forward, so that its referent is not a guess. "The loss" has no antecedent in paragraph 38, which is about offices as a place to be heard and about contact with the council. The reader has to guess whether it means the loss of trust, the loss of an office or the loss of voice.

## Prose standard, E. Sentence shapes, "Passive voice"

- paragraph 13: "Each transcript was coded twice for themes of distance and voice, the sense of being heard by the council." The rule asks that a passive be rewritten unless the actor is irrelevant. Here the actor matters: double coding by one coder and by two coders are different procedures, and the passive hides which one was used.

## `references/rules.md`, Precision / Term defined at first use

- paragraph 22: "Place attachment was measured in the survey." The rule asks that a technical term be defined where it first appears. "Place attachment" is not defined here or anywhere else in the draft.
  Also breaks: `references/rules.md`, Reader's path / Clarity test. The rule asks that a paragraph whose removal loses nothing be deleted. Place attachment does not come up again in the Survey Results, the Discussion or the Conclusion.
  Also breaks: `references/registers.md`, Social Sciences / Terminology. The rule asks that variables be operationalized. The draft gives no items and no scale for place attachment.

## `references/rules.md`, Formality (manuscripts and grants) / No colloquial words

- paragraph 29: "The respondents were a mixed bag in age and occupation, with ages from 22 to 87 years and 31 occupations." The rule asks for formal, academic vocabulary in a manuscript. "a mixed bag" is a colloquialism.
  Also breaks: `references/rules.md`, Paragraphs / Evidence followed by what it means. The rule asks that evidence be followed by an interpretation that connects it to the paragraph's claim. The age range and the occupation count are given and are not connected to any claim.
  Also breaks: `references/registers.md`, Social Sciences / Register. The rule asks for formal text.

## `references/rules.md`, Paragraphs / First sentence states the point

- paragraph 17: "Without a local office, participants faced a trip of 20 to 40 minutes to the new town hall." The rule asks that a paragraph's first sentence state its main point. The point, that distance cut four participants' contact with the council, is only in the second sentence. The first sentence gives the travel time.

## `references/rules.md`, Reader's path / So what per section

- paragraph 9: "Participants were recruited through the public library." The rule gives a methodology section the job of showing rigor and acknowledging limitations upfront. The Interview Method section (paragraphs 9 to 13) acknowledges no limitation. The limitation that follows from library recruitment is stated only in the Discussion, in paragraph 35.
  Also breaks: `references/registers.md`, Social Sciences / What the reader looks for. The rule says the reader looks for transparency about limitations and that a methods or results section gives it. The interview sections give none.

## `references/registers.md`, Social Sciences / Voice

- paragraph 12: "The researcher conducted the interviews in the participants' homes." The rule asks that the researcher's decisions take "we" and that the authors never refer to themselves in the third person. Elsewhere the draft uses "We" for the authors (paragraphs 2, 21 and 40), but here they refer to themselves as "The researcher".
