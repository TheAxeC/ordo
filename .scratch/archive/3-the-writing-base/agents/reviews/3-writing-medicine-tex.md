# /writing on medicine-tex

Draft: `.scratch/3-the-writing-base/cases/medicine/main.tex`. Agent a312a7fbbc04aa1fa, claude-opus-5-5, 71132 tokens, 9 tool uses, 2 min 34 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `cat -n /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/main.tex`
- Bash: `cat -n /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/main.tex; echo "exit $?"`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/sections.tex; echo "exit $?"`
- Bash: `cd /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine && grep -n -e 'Usual care began' -e 'usual care group' -e 'after usual care' -e 'The authors enrolled' -e 'a heart attack had occurred' -e 'Each group held 240' -e 'usual mobilization' main.tex; grep -n -e 'hassle' -e 'Late mobilization may' -e 'The effect appears' -e 'the 170 others' -e 'The study adds' -e 'surgery on the day' -e 'Hospitals that wish' sections.tex; wc -w main.tex sections.tex; grep -c ';' main.tex sections.tex`

## The report, whole

Review of `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/medicine/main.tex` with `sections.tex`, read as one document

I read the draft as a manuscript because it has a title, an abstract, keywords and Introduction, Methods, Results, Discussion and Conclusion sections. Its discipline is medicine (geriatric medicine), so I applied the Medicine and Health register. `LC_ALL=C grep -n '[^ -~]'` found no non-ASCII character in `main.tex` or `sections.tex`; both runs exited with status 1.

## prose-standard.md, section D, "Vary paragraph length"

- sections.tex:21-33. The Discussion has seven paragraphs. Six are one sentence long and one is two sentences long:
  "The study adds randomized and observational evidence to the two small trials of early mobilization (Okoye, 2022)." / "The trial and the cohort agree in direction, which suggests that early mobilization reduces readmission." / "Both studies took place at one hospital, so the effect may differ elsewhere." / "Healthier patients, who could be mobilized earlier, may account for part of the cohort association." / "The trial is randomized; the cohort is observational. Agreement between the two designs strengthens the finding." / "The effect appears in readmission, not in length of stay." / "Hospitals that wish to test the approach could schedule physiotherapy on the day of surgery."
  The rule asks for paragraphs of varied length, because uniform blocks are a template.

## prose-standard.md, section D, "No synonym cycling"

- main.tex:25. "Usual care began on the second day." Lines 21 and 23 call the comparison arm "usual mobilization", and this line calls it "usual care". The rule asks for one term per concept, used every time the concept comes back.
- main.tex:45. "both in the usual care group". The arm is "usual mobilization" at lines 21 and 23. The rule asks for one term per concept, used every time the concept comes back.
- main.tex:49. "8 percent after usual care". The arm is "usual mobilization" at lines 21 and 23. The rule asks for one term per concept, used every time the concept comes back.
- sections.tex:17. "Late mobilization may have added to the risk of thrombosis." The same group of cohort patients is called "the 170 others" at line 15 and "patients mobilized after the first day" in the sentence before this one. The rule asks for one term per concept, used every time the concept comes back.

## references/rules.md, Precision / Most specific term

- main.tex:45. "By 30 days, a heart attack had occurred in two patients". The rule asks that each thing be named with the most specific term the field has for it.
  Also breaks: references/registers.md, Medicine and Health / Terminology, which asks that clinical terms be used as the field defines them.

## references/rules.md, Formality / No colloquial words (manuscripts and grants)

- sections.tex:7. "Obtaining ethics approval was a hassle that lasted four months." The rule asks for formal, academic vocabulary with no colloquial word.
  Also breaks: references/registers.md, Medicine and Health / Register, which asks that the text be formal.

## references/rules.md, Hedging / No hedge on facts

- sections.tex:31. "The effect appears in readmission, not in length of stay." The sentence reports the trial's results with "appears", which the rule's own table lists as a hedging device. The rule asks that reported data be stated without a hedge.

## references/rules.md, Paragraphs / First sentence states the point

- main.tex:43. "Each group held 240 patients. All 480 patients completed follow-up and entered the analysis. With no loss to follow-up, attrition cannot account for the difference in readmission." The point of the paragraph is that follow-up was complete, so attrition cannot explain the result, but the first sentence gives the group sizes. The rule asks that a paragraph's first sentence state its main point.

## references/registers.md, Medicine and Health / Voice

- main.tex:29. "The authors enrolled the patients on the surgical ward." The rule asks that the authors' decisions, contributions and results take "we", and that the authors never refer to themselves in the third person.
