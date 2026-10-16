# /writing on social-tex, second run

Draft: `.scratch/3-the-writing-base/cases/social/main.tex`. Agent a751cde6b2a6041ff, claude-opus-5-5, 81959 tokens, 8 tool uses, 4 min 13 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/main.tex`
- Read: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/sections.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/main.tex`
- Bash: `LC_ALL=C grep -n '[^ -~]' /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/cases/social/sections.tex`

## The report, whole

Review of `main.tex` with `sections.tex` (one document, read in that order). The keywords line (`main.tex:11`) names sociology, so the Social Sciences register applies. The draft has an abstract and the sections of a research paper, so it is a manuscript, and the rules marked (manuscripts and grants) apply. `LC_ALL=C grep -n '[^ -~]'` found no non-ASCII character in either file (exit 1, no output for each).

**Prose standard, 0. Hard rules, "Plain prose only"**

- `sections.tex:35`: "The interviews suggest a mechanism; the survey shows its size." The rule bans punchy one-line summaries and cute contrasts, and asks the text to state the fact and stop. This sentence is a paragraph on its own: a balanced two-part summary line.
  - Also breaks `references/rules.md`, Hedging / Hedge where a claim is uncertain: "shows" states an interpretation without a hedge, while `sections.tex:33` names an alternative explanation for the same pattern. The rule asks for a hedge on an interpretation that has alternative explanations.

**Prose standard, 0. Hard rules, "No repeated construction"**

- `main.tex:17`: "A loss of trust after a merger would thus reach many of them." The rule says a sentence shape that recurs across sections is a template and is rewritten. A paragraph ends with "<subject> thus <conclusion>" four times, across three sections: `main.tex:17` (Introduction), `main.tex:41` (Interview Results), and `sections.tex:17` and `sections.tex:21` (Survey Results).
  - Also breaks prose standard A. Vocabulary: "many" is a vague qualifier. The rule asks for the number or the specific claim in its place.
- `main.tex:41`: "A nearby office thus appeared to preserve that contact." This is the same recurring "thus" closer as `main.tex:17`.
- `sections.tex:17`: "Those who had lost an office thus fell just below the scale's neutral point, and the others above it." This is the same recurring "thus" closer as `main.tex:17`.
- `sections.tex:21`: "Years of residence thus related more closely to trust than age did." This is the same recurring "thus" closer as `main.tex:17`.
  - Also breaks prose standard E. Sentence shapes, "Restating closes": the sentence repeats the paragraph's first sentence in shorter words. The rule asks for such a sentence to be cut.

**Prose standard, D. Structure, "No synonym cycling"**

- `main.tex:15`: "Residents who lose a local office may feel less political trust, the belief that a government acts in the interest of its citizens (Abara, 2017)." The rule asks for one term per concept, repeated. The concept is "political trust" here, but "trust in local government" in the title (`main.tex:2`) and the abstract (`main.tex:8`), and "trust" everywhere else.

**Prose standard, E. Sentence shapes, "Cold opens"**

- `sections.tex:33`: "The pattern may also reflect residents who already distrusted the merger." The rule bans a body paragraph whose first sentence has no antecedent, and asks for the prior subject to be carried forward. The paragraph before this one (`sections.tex:31`) is about recruitment at the library, so the reader has to guess which pattern is meant.
- `sections.tex:39`: "The loss appears to concern voice, not service quality, since six participants described better services." The paragraph before this one (`sections.tex:37`) is about local offices and contact with the council, so "The loss" (of trust, of voice or of an office) has no antecedent.

**references/rules.md, Precision / Term defined at first use**

- `sections.tex:5`: "Place attachment was measured in the survey." The rule asks for a technical term to be defined where it first appears. "Place attachment" is not defined here or anywhere else in the draft.
  - Also breaks Reader's path / Clarity test: place attachment never appears again, so removing this paragraph loses nothing. The rule asks for such a paragraph to be deleted.
  - Also breaks Social Sciences / Terminology: the rule asks for theoretical constructs to be named and variables to be operationalized. Place attachment is not operationalized.

**references/rules.md, Objectivity / Claims rest on evidence**

- `main.tex:8`: "In interviews with 24 residents, trust fell where the merger moved services away." The rule asks for a claim to rest on evidence. The Interview Results section (`main.tex:35` to `main.tex:43`) reports distance, voice and contact, and reports no measure of trust or of change in trust.
  - Also breaks Hedging / Hedge where a claim is uncertain: this is an unhedged claim of change from 24 interviews held after the merger. The rule asks for a hedge on a causal claim from correlational data and on a generalization from a limited sample.

**references/rules.md, Formality / No colloquial words**

- `sections.tex:19`: "The respondents were a mixed bag in age and occupation, with ages from 22 to 87 years and 31 occupations." "mixed bag" is a colloquialism. The rule asks for formal, academic vocabulary.
  - Also breaks Social Sciences / Register: the rule asks for formal text.

**references/rules.md, Paragraphs / First sentence states the point**

- `main.tex:39`: "Without a local office, participants faced a trip of 20 to 40 minutes to the new town hall." The rule asks for a paragraph's first sentence to state its main point. This paragraph's point, that distance cut contact with the council because four participants stopped visiting, is in its second sentence.

**references/rules.md, Common style errors / Tense per section**

- `main.tex:39`: "Four of them stopped visiting, which suggests that distance cut their contact with the council." The rule gives Results the past tense. "suggests" is in the present tense inside the Interview Results section.

**references/rules.md, Reader's path / Clarity test**

- `main.tex:43`: "One participant said that the council "stopped listening," which illustrated the loss of voice that 15 participants described." The rule asks for a paragraph to be deleted when removing it loses nothing. `main.tex:35` already reports that 15 participants described a loss of voice and that "the council no longer listened to them".

**references/rules.md, Reader's path / So what per section**

- `main.tex:21`: "\section{Interview Method}". For Methodology, the rule's job is to show rigour and acknowledge limitations upfront. The section states no limitation. The limitation of recruiting at the library appears only in the Discussion (`sections.tex:31`).
  - Also breaks Social Sciences / What the reader looks for: the reader looks for transparency about limitations, and a methods or results section gives it. Neither the Interview Method section nor the Interview Results section states a limitation of the interview strand.

**references/registers.md, Social Sciences / Voice**

- `main.tex:29`: "The researcher conducted the interviews in the participants' homes." The rule says the authors never refer to themselves in the third person and that the researcher's decisions take "we". The draft uses "we" elsewhere (`main.tex:8`, `sections.tex:3`, `sections.tex:41`).
