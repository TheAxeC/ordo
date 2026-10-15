# /writing on social-tex

Draft: `.scratch/3-the-writing-base/cases/social/main.tex`. Agent ab1f0ed86fe59e6fb, claude-opus-5-5, 73462 tokens, 8 tool uses, 2 min 55 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/main.tex`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/main.tex; echo "exit $?"`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/sections.tex; echo "exit $?"`

## The report, whole

Review of `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/main.tex` with its input `sections.tex`, read as one document.

The draft is a manuscript: it has a title, an abstract, keywords and sections from Introduction to Conclusion, so the rules marked (manuscripts and grants) apply. The keyword "sociology" puts it in the Social Sciences register. `LC_ALL=C grep -n '[^ -~]'` found no non-ASCII character in either file (no output, exit 1 for both).

## Prose standard, 0. Hard rules, "Plain prose only"

- `sections.tex:37`: "The interviews suggest a mechanism; the survey shows its size. Together they point to a loss of voice." The rule asks for no punchy one-line summaries and no cute contrasts: state the fact and stop.

## Prose standard, D. Structure, "Vary paragraph length"

- `main.tex:17` (paragraphs at lines 17, 19 and 21, one sentence each): "The study followed residents of two towns that merged in 2019." The rule asks for varied paragraph lengths, because uniform blocks are a template.
- `main.tex:27` (paragraphs at lines 27, 29 and 31, one sentence each): "Residents were eligible if they had lived in either town since before the merger." The rule asks for varied paragraph lengths, because uniform blocks are a template.
- `main.tex:39` (paragraphs at lines 39, 41, 43, 45 and 47, two sentences each): "Fifteen of the 24 participants said that the new council felt distant. They described the loss as a loss of voice: the council no longer listened to them." The rule asks for varied paragraph lengths, because uniform blocks are a template.
- `sections.tex:3` (paragraphs at lines 3, 5 and 7, one sentence each): "A mailed survey tested whether losing a local office lowered trust." The rule asks for varied paragraph lengths, because uniform blocks are a template.
- `sections.tex:23` (paragraphs at lines 23, 25 and 27, two sentences each): "Trust rose with years of residence (r = .18, p below .001) and showed no link to age (r = .04, p = .41). Years of residence may matter more to trust than age." The rule asks for varied paragraph lengths, because uniform blocks are a template.
- `sections.tex:39` (paragraphs at lines 39, 41, 43 and 45, one sentence each): "Local offices give residents a place to be heard (Abara, 2017)." The rule asks for varied paragraph lengths, because uniform blocks are a template.

## Prose standard, D. Structure, "No synonym cycling"

- `sections.tex:15`: "The questionnaire had 18 items and took 10 minutes to complete." Lines 7 and 9 call the same mailed instrument "the survey". The rule asks for one term per concept, repeated.
- `sections.tex:33`: "Interviewees were recruited at the public library, so they may differ from residents who never visit it." Lines 25 to 47 of `main.tex` call the interviewed people "participants". The rule asks for one term per concept, repeated.

## Prose standard, E. Sentence shapes, "Restating closes"

- `sections.tex:19`: "Losing an office was therefore associated with lower trust." The paragraph's first sentence already reports lower trust among those who lost an office. The rule asks for a final sentence that only says the paragraph again in shorter words to be cut.

## references/rules.md, Precision / Term defined at first use

- `main.tex:35`: "Each transcript was coded twice for themes of distance and voice." "Voice" is a technical term here and is not defined where it first appears. The rule asks for a technical term to be defined at its first appearance.
- `sections.tex:7`: "Place attachment was measured in the survey." "Place attachment" is not defined where it first appears. The rule asks for a technical term to be defined at its first appearance.
  Also breaks: references/registers.md, Social Sciences / Terminology, which asks for theoretical constructs to be named and variables operationalized. "Place attachment" is not operationalized.
  Also breaks: references/rules.md, Reader's path / Clarity test, which asks for a paragraph to be deleted when removing it loses nothing. Place attachment is not mentioned again anywhere in the draft.

## references/rules.md, Objectivity / Claims rest on evidence

- `sections.tex:45`: "We suggest that councils keep a local office open for two years after a merger." No evidence in the draft supports the two-year period. The rule asks for a claim to rest on evidence, not on opinion.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation, which asks for a claim to be followed by the data, the citation or the example that supports it.

## references/rules.md, Formality / No colloquial words

- `sections.tex:21`: "The respondents were a mixed bag in age and occupation." The rule asks for formal, academic vocabulary. "A mixed bag" is a colloquialism.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation, which asks for a claim to be followed by the data that supports it. No figures on age or occupation are given.

## references/rules.md, Reader's path / So what per section

- `main.tex:25`: "Participants were recruited through the public library." The Interview Method section gives this recruitment route and does not say what limit it puts on the sample. The draft states that limit only in the Discussion, at `sections.tex:33`. The rule's Methodology row asks the section to show rigor and to acknowledge limitations upfront.
  Also breaks: references/registers.md, Social Sciences / What the reader looks for, which says the reader looks for transparency about limitations and that a methods or results section gives it.

## references/registers.md, Social Sciences / Voice

- `main.tex:31`: "The researcher conducted the interviews in the participants' homes." The rule asks for the researcher's decisions to take "we" and says the authors never refer to themselves in the third person.
