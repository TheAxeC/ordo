# Ethics check

The integrity agent reads this page to run the ethics check at both depths, in the check before the review and in the final check before delivery, as the last part of each integrity record. The check is a self-check before a human ethics committee and does not replace one.

## Verdict and stop

| Verdict | Meaning | What happens |
|---|---|---|
| CLEARED | No ethics concern. | The run goes on. |
| CONDITIONAL | A concern the paper can address. | The issue names the exact fix and goes to `/paper revision` with the issue list as its comments, or to the final message when the fix needs a fact only the user has. |
| BLOCKED | A critical integrity violation. | The run stops once for the user. |

- BLOCKED is reserved for these integrity violations: one fabricated reference, no AI disclosure, plagiarism, systematic misrepresentation of sources, and concrete harm-enabling content without safeguards.
- Concrete harm-enabling content is specific operational detail that materially lowers the barrier to a weaponizable method. A sensitive topic is not such content.
- Subject matter alone never blocks. Public-interest, government-critical, institution-critical and politically sensitive research are not grounds to halt.
- Human or patient data with no approval stated is CONDITIONAL, and it must be addressed before delivery.
- An issue that Phase A to E of the same record already reports, such as a fabricated reference, goes to the correction round of the integrity verdict. The ethics check blocks for it only when it is still there after the correction rounds.
- A BLOCKED verdict names the specific problem and a resolution path.
- At the stop the user accepts the fix, overrides with reasons, or revises the passage.
- The session records the user's decision in the run's state in the run folder `researcher-runs/<mode>-<date>/`, with the reasons of an override verbatim.
- An item the user overrode is not blocked again.
- Dual use is advisory: a topic or method open to misuse leads to a responsible-use statement and never to BLOCKED. Only concrete harm-enabling content without safeguards, as defined above, is BLOCKED.
- The check reviews all eight dimensions below and does not skip one: AI disclosure, attribution, dual use, fair representation, data, conflict of interest, reproducibility, and human and patient data.

## AI disclosure

- AI assistance is disclosed in the paper, with the tools named, the scope of the AI's involvement, the human oversight (who reviewed what, at which stages) and the version or date of the tool.
- The scope names which of these the AI took part in: literature search assistance, source screening, evidence synthesis, draft writing, editing or revision, data analysis, translation.
- The limitations of the AI are acknowledged, such as a possible hallucination.
- No AI-generated content is passed off as human-authored.
- The disclosure is present and accurate against what the run did. The `paper` skill's `references/disclosure_mode_protocol.md` holds the forms.

## Attribution

- The citation audit of the `paper` skill's `agents/citation_compliance_agent.md` and the reference and claim checks of `agents/integrity_verification_agent.md` cover citations, fabricated references and retractions. This check reads their issues and does not repeat them.
- Ideas are attributed to the original authors and not to an intermediary source.
- Quotations are exact and attributed.
- Paraphrase is a real paraphrase and not a rearrangement of words.
- Self-citation is proportionate and does not exclude the field's other work.

## Dual use

The check screens on concrete specifics and never on subject matter. The dual-use check triggers only when the work itself supplies specific operational detail that materially lowers the barrier to harm. Studying surveillance is fine; shipping a step-by-step deployment recipe is the trigger.

Each question asks whether the content of the work supplies the specific, not whether the topic is sensitive:

1. Does the work give concrete operational detail that would let a reader carry out harm against individuals or communities, beyond describing that the harm exists?
2. Does it disclose a specific, currently exploitable vulnerability together with enough detail to exploit it, and not only that vulnerabilities exist?
3. Does it give a usable method to build surveillance or control mechanisms, and not only an analysis or critique of them?
4. Does it contain weaponizable specifics, a recipe, a design or a procedure, and not a discussion of the risk of weaponization?
5. Does it supply a concrete means to discriminate against a group, and not only a record that discrimination occurs?

If the answer rests on the topic being sensitive and not on specific enabling detail in the text, the level is None.

| Level | Meaning | Action |
|---|---|---|
| None | No foreseeable misuse, such as historical analysis or pure theory. | None. |
| Low | Unlikely misuse and minimal harm potential, such as general education research. | A brief note in the limitations. |
| Moderate | Could be misused in specific contexts, such as an analysis of surveillance technology or a study of social manipulation. | A responsible-use statement. |
| High | Clear potential for harm if misused, such as vulnerability research or weapons-related work. | A prominent warning and a recommendation of limited distribution. |
| Critical | Should not be published without safeguards, such as specific exploitation methods. | A responsible-use statement and a recommendation of institutional ethics review before publication. |

- A Critical level does not block. A human, not the agent, adjudicates it.
- Every record of the check states a dual-use level.

## Fair representation

- Multiple perspectives on contested issues are presented.
- Minority and dissenting viewpoints are not dismissed without engagement.
- Subjects and communities are described accurately and respectfully, and vulnerable populations are not stigmatized.
- Language is inclusive, non-discriminatory and non-stigmatizing.
- Cultural context is acknowledged where it matters.
- Power dynamics are considered: who is studied and who studies.
- The sources show geographic and cultural diversity.
- For sensitive topics the language follows these points:
  - Indigenous knowledge follows the OCAP principles: Ownership, Control, Access, Possession.
  - Disability uses person-first language unless the community prefers identity-first language.
  - Gender and sexuality use inclusive, current terminology.
  - Race and ethnicity use the terms the communities themselves prefer.
  - Socioeconomic status avoids deficit framing.
  - Mental health avoids stigmatizing language.
- The representation audit asks four questions: whose voices are centered and whose are missing, whether communities are described on their own terms, whether the framing carries implicit bias, and whether the subjects would recognize themselves in the description.

## Data

- Every data source is legal to use: public data is in the public domain or under an appropriate license, licensed data is used within the license terms, and institutional data has confirmed authorized access.
- Scraped data complies with robots.txt and the site's terms of service.
- Personal data complies with GDPR or the applicable privacy law.
- No personally identifiable information appears without consent.
- Aggregated data is used where possible.
- Small groups are protected from identification, and so are indirect identifiers such as a combination of department, year and gender.
- Institutional identities are protected when they are not public.
- The training-data biases of the AI tools used are acknowledged in the paper.
- AI-generated data is labelled as AI-generated, and no AI-generated content is cited as a source, under the `paper` skill's `references/disclosure_mode_protocol.md`.

## Conflict of interest

- The conflicts to assess are financial (funding source, consulting), institutional (an author evaluating the author's own institution), intellectual (an author defending the author's own prior work), personal, political, commercial and AI-specific (an AI tool company's influence on the research design).
- The research purpose is disclosed: who benefits.
- The funding sources are identified.
- The biases of the researchers and of the AI tools are acknowledged.
- Any conflict found is disclosed with an assessment of whether it could have influenced the results, in the conflict of interest statement of the `paper` skill's `references/funding_statement_guide.md`.

## Reproducibility

- The search strategies are documented: databases, terms and dates.
- The inclusion and exclusion criteria are documented.
- The analytical methods are described in replicable detail.
- The AI prompts and instructions are documented where they matter.
- The data processing steps are documented.
- The code and scripts are shared where that applies.

## Human and patient data

- The check first decides whether the work collects, uses or analyzes human-related data, and whether that data is personally identifiable.
- Data that is public and de-identified is stated as such in the paper.
- The paper states the approval of the board that approved the collecting study, with the approval number.
- The paper states the consent obtained: the consent given by participants, or the board's waiver of it.
- The paper states the de-identification applied:
  - direct identifiers removed, such as names, student IDs and national ID numbers.
  - the risk of indirect identifiers assessed.
  - the risk of re-identification in small samples assessed, since a small department may allow it.
  - identifiable details removed from qualitative quotations.
  - data storage encrypted with access controls.
  - a timeline for retention and destruction.
- The check judges what the paper states. It does not plan the data collection, and the approval is the collecting study's.

## Record

The ethics check ends the integrity record in the section "Ethics check", with:

- the verdict.
- eight lines, one per dimension above, each with pass, warn, fail or not applicable, and the dual-use level.
- the issues, numbered `I<m>` in the integrity record's sequence, each marked Critical, Conditional or Advisory.
- the responsible-use statement text when the level is Moderate or above.
- before delivery, the confirmation of each of these items:
  - the AI disclosure is present and accurate.
  - no fabricated citation was found.
  - the dual-use level is stated.
  - the fair-representation review is done.
  - the data sources are legal and ethical.
  - conflicts are disclosed.
  - reproducibility is documented.
  - the writing is inclusive and respectful.
  - the paper benefits its stated audience without a foreseeable harm.
  - human data has its approval stated.
