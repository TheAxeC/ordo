# /writing on medicine-docx

Draft: `.scratch/3-the-writing-base/cases/medicine/draft.docx`. Agent af7307205dfd95a1c, claude-opus-5-5, 64516 tokens, 7 tool uses, 1 min 36 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx | LC_ALL=C grep -n '[^ -~]'`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx | grep -n -e 'Usual care began on the second day' -e 'both in the usual care group' -e 'after usual care (RR' -e 'test the approach' -e 'a heart attack had occurred in two patients' -e 'adjusted for age and comorbidity score' -e 'was a hassle' -e 'The trial is randomized; the cohort is observational' -e 'The authors enrolled the patients'`

## The report, whole

**prose-standard.md, section D (Structure), No synonym cycling: one term per concept, repeated.**

- paragraph 10: "Usual care began on the second day." The comparator arm is called "usual mobilization" in paragraphs 8 and 9 and "usual care" here.
- paragraph 20: "both in the usual care group"
- paragraph 22: "8 percent after usual care"
- paragraph 39: "Hospitals that wish to test the approach". Elsewhere the intervention is called "early mobilization", and here it is called "the approach".

**references/rules.md, Precision / Most specific term: a passage names each thing with the most specific term the field has for it.**

- paragraph 20: "a heart attack had occurred in two patients". "Heart attack" is the lay name. The clinical term the field uses is a different word.
  Also breaks references/registers.md, Medicine and Health / Terminology: clinical terms are used as the field defines them.
- paragraph 28: "The analysis adjusted for age and comorbidity score." The passage does not name which comorbidity score was used.

**references/rules.md, Formality (manuscripts and grants) / No colloquial words: the vocabulary is formal and academic, with no colloquialism or slang word.**

- paragraph 26: "Obtaining ethics approval was a hassle that lasted four months."
  Also breaks references/rules.md, Reader's path / Clarity test: a paragraph whose removal loses nothing is deleted. The paragraph is about how long the approval took and says nothing about the cohort's methods.

**references/rules.md, Paragraphs / First sentence states the point: a paragraph's first sentence states the paragraph's main point.**

- paragraph 37: "The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding." The paragraph's main point is in its second sentence. The first sentence only states the two designs.

**references/registers.md, Medicine and Health / Voice: the authors' decisions, contributions and results take "we", and the authors never refer to themselves in the third person.**

- paragraph 12: "The authors enrolled the patients on the surgical ward."

I read the draft by running `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/draft.docx`, which prints its 41 paragraphs. Piping the same output into `LC_ALL=C grep -n '[^ -~]'` found no non-ASCII character (grep exited 1 with no matches). A `grep -n` over the same output confirmed that each quoted passage is at the paragraph given.

The draft is a manuscript in medicine, because it has an abstract, keywords and Methods, Results and Discussion sections for a randomized trial. So I applied the Medicine and Health register and the rules marked (manuscripts and grants). No decision on any finding has been taken; each one is left to you.
