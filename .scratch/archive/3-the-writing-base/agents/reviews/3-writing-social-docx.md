# /writing on social-docx

Draft: `.scratch/3-the-writing-base/cases/social/draft.docx`. Agent a0b65a0508268b7a0, claude-opus-5-5, 65790 tokens, 6 tool uses, 1 min 53 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

Draft: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/draft.docx`. I read it by running `docx_paragraphs.py`, which prints 46 paragraphs, all in the body. The same output piped into `LC_ALL=C grep -n '[^ -~]'` printed nothing and exited 1, so the draft has no non-ASCII characters. The draft is a manuscript: it has an abstract, keywords, and Introduction, Method, Results, Discussion and Conclusion sections. Its keywords name sociology, so the Social Sciences register applies, and so do the rules that `references/rules.md` marks (manuscripts and grants).

## prose-standard.md, D. Structure, "No synonym cycling"

- paragraph 38: "Interviewees were recruited at the public library, so they may differ from residents who never visit it." Paragraphs 10 to 21 call the same people "participants". The rule asks for one term per concept, repeated.
- paragraph 42: "A longer trip to the town hall may reduce contact with officials." Paragraphs 12, 19 and 20 call this "contact with the council". The rule asks for one term per concept, repeated.

## prose-standard.md, E. Sentence shapes, "Restating closes"

- paragraph 31: "Losing an office was therefore associated with lower trust." This last sentence says the paragraph's first sentence again in shorter words: "Respondents who had lost a local office reported lower trust than the others". The rule asks for such a final sentence to be cut.

## references/rules.md, Precision / Term defined at first use

- paragraph 15: "Each transcript was coded twice for themes of distance and voice." "Voice" first appears here as a theme. The draft says what it means only in paragraph 17 ("a loss of voice: the council no longer listened to them"). The rule asks for a technical term to be defined where it first appears.
- paragraph 25: "Place attachment was measured in the survey." "Place attachment" first appears here and is not defined.
  Also breaks: references/registers.md, Social Sciences / Terminology. That rule asks for variables to be operationalized, and this paragraph does not say how place attachment was measured.

## references/rules.md, Objectivity / Claims rest on evidence

- paragraph 44: "We suggest that councils keep a local office open for two years after a merger." No data in the draft supports the period of two years. The rule asks for a claim to rest on evidence, not on opinion.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation. That rule asks for a claim to be followed by the data, the citation or the example that supports it.

## references/rules.md, Formality (manuscripts and grants) / No colloquial words

- paragraph 32: "The respondents were a mixed bag in age and occupation." The rule asks for formal, academic vocabulary in place of a colloquialism.
  Also breaks: references/rules.md, Common style errors / Vague phrase. That rule asks for a vague phrase to be replaced with the specific claim.

## references/rules.md, Hedging / Hedge where a claim is uncertain

- paragraph 40: "The interviews suggest a mechanism; the survey shows its size." The sentence states without a hedge an interpretation that has an alternative explanation. Paragraph 39 gives that alternative: "The pattern may also reflect residents who already distrusted the merger." The rule asks for an interpretation with alternative explanations to be hedged.

## references/registers.md, Social Sciences / Voice

- paragraph 13: "The researcher conducted the interviews in the participants' homes." Here the authors refer to themselves in the third person. Elsewhere the draft uses "we" (paragraphs 2, 24 and 44). The rule says the researcher's decisions take "we" and that the authors never refer to themselves in the third person.
