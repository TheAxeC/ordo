# /writing on medicine-docx, second run

Draft: `.scratch/3-the-writing-base/cases/medicine/draft.docx`. Agent ad202f6b86359e3d2, claude-opus-5-5, 71340 tokens, 6 tool uses, 2 min 39 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

Draft: /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx

**references/rules.md, Precision / Most specific term**

- paragraph 19: "By 30 days, a heart attack had occurred in two patients, both in the usual mobilization group."
  The rule asks for each thing to be named with the most specific term the field has for it. "Heart attack" is the lay name for the event, not the clinical term.
  Also breaks references/registers.md, Medicine and Health / Terminology: clinical terms are used as the field defines them.
  Also breaks references/registers.md, Medicine and Health / Register: the text is clinically precise.

**references/rules.md, Objectivity / Limitations and alternative interpretations**

- paragraph 30: "All three occurred in patients with usual mobilization. Usual mobilization may have added to the risk of thrombosis."
  The rule asks the text to acknowledge the alternative interpretations of its results. This result rests on three events in an observational cohort, and the draft gives no alternative interpretation of it, such as chance or a difference between the patients mobilized early and later. Paragraph 35 discusses healthier patients only for the readmission association, and paragraph 19 says that two events in the trial were too few to compare the groups.

**references/rules.md, Formality (manuscripts and grants) / No colloquial words**

- paragraph 25: "The ethics committee approved the use of the nursing notes after a hassle that lasted four months."
  The rule asks for formal, academic vocabulary. "Hassle" is a colloquialism.
  Also breaks references/registers.md, Medicine and Health / Register: the text is formal.

**references/rules.md, Common style errors / Vague phrase**

- paragraph 2: "A cohort of 310 patients showed the same direction."
  The rule asks for a vague phrase to be replaced with the specific claim. The abstract gives the trial's result in numbers, and for the cohort it says only "the same direction". The specific claim, the adjusted odds ratio with its confidence interval, is in paragraph 29.

**references/rules.md, Reader's path / Clarity test**

- paragraph 36: "The effect shows in readmission, not in length of stay."
  The rule says a paragraph whose removal loses nothing is deleted. Paragraph 36 is one sentence that repeats the result in paragraphs 17 and 21, where readmission fell and length of stay had a median of 7 days in each group. The paper still makes sense without it.
  Also breaks references/rules.md, Paragraphs / Evidence followed by what it means: the paragraph restates a result, and no interpretation follows to connect it to a claim.

**references/registers.md, Medicine and Health / Voice**

- paragraph 12: "The authors enrolled the patients on the surgical ward."
  The rule says the authors never refer to themselves in the third person. Their decisions, contributions and results take "we", as paragraph 10 does with "We defined early mobilization".
