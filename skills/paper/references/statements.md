# Statements

The draft writer reads this page to write the six statements of a paper: author contributions, funding, conflict of interest, data availability, ethics and, with `references/ai-disclosure.md`, the AI disclosure. The facts come from `config.md` of the run, and each statement is written into the first draft in full mode and as a patch in disclosure mode, as `references/patch-file.md` gives.

## Facts and gaps

- Every fact a statement states comes from a row of `config.md`: Authors, Contributions, Funding, Conflicts of interest, Data availability, Human or patient data.
- A fact the record lacks is a gap under the draft writer's anti-leakage rule: it is written as a visible placeholder and listed in the report, never filled from the model.
- The report lists each statement the co-authors must agree on before submission: the contribution roles, the funder details and the conflicts.
- Each statement is written in the manuscript's language.
- A statement stands even when nothing is to declare: no funding, no conflict, no new data and no human data each get their own sentence.

## Author contributions

The statement uses the 14 roles of CRediT, the Contributor Roles Taxonomy. Each role is a contribution by one or more authors.

| Role | Definition |
|---|---|
| Conceptualization | Ideas; formulation or evolution of overarching research goals and aims. |
| Data curation | Management activities to annotate (produce metadata), scrub data and maintain research data, including software code where it is necessary for interpreting the data itself, for initial use and later re-use. |
| Formal analysis | Application of statistical, mathematical, computational or other formal techniques to analyze or synthesize study data. |
| Funding acquisition | Acquisition of the financial support for the project leading to this publication. |
| Investigation | Conducting a research and investigation process, specifically performing the experiments, or data and evidence collection. |
| Methodology | Development or design of methodology; creation of models. |
| Project administration | Management and coordination responsibility for the research activity planning and execution. |
| Resources | Provision of study materials, reagents, materials, patients, laboratory samples, animals, instrumentation, computing resources or other analysis tools. |
| Software | Programming and software development; designing computer programs; implementation of the computer code and supporting algorithms; testing of existing code components. |
| Supervision | Oversight and leadership responsibility for the research activity planning and execution, including mentorship external to the core team. |
| Validation | Verification, whether as a part of the activity or separate, of the overall replication or reproducibility of results, experiments and other research outputs. |
| Visualization | Preparation, creation or presentation of the published work, specifically visualization and data presentation. |
| Writing -- original draft | Preparation, creation or presentation of the published work, specifically writing the initial draft, including substantive translation. |
| Writing -- review & editing | Preparation, creation or presentation of the published work by those from the original research group, specifically critical review, commentary or revision, including pre- or post-publication stages. |

- The role names are written as the table gives them; in LaTeX `--` typesets as the dash of the CRediT names.
- The author table has one row per author: name, affiliation, ORCID and whether the author is the corresponding author.
- The contribution matrix has one cell per author and role, with `Lead` for the author primarily responsible, `Supporting` for an assisting role and `--` for no part.
- The matrix leaves no author without a role.
- Each role that applies to the study has at least one author.
- At least one author is `Lead` for Writing -- original draft, and at least one author has Writing -- review & editing.
- The statement lists, for each author in the matrix order, the roles with `Lead` or `Supporting`.
- The statement has this form:

```
Author Contributions:
<Author 1>: <Role>, <Role>, <Role>.
<Author 2>: <Role>, <Role>.
```

- When two authors share first authorship, one more line follows: `<Author 1> and <Author 2> contributed equally to this work and share first authorship.`
- A paper with one author has no contribution statement unless the venue asks for one.
- Where the venue's submission system collects the roles, the matrix is the record to enter there, and the statement in the manuscript stays.

## Authorship

An author meets all four conditions of the International Committee of Medical Journal Editors (ICMJE):

1. Substantial contributions to the conception or design of the work, or to the acquisition, analysis or interpretation of data.
2. Drafting the work or revising it critically for important intellectual content.
3. Final approval of the version to be submitted.
4. Agreement to be accountable for all aspects of the work, so that questions about the accuracy or integrity of any part are investigated and resolved.

- A person who meets fewer than four conditions is named in the acknowledgments with the contribution, not in the author list.
- These contributions alone belong in the acknowledgments: funding, administrative support or resources, language editing or translation, data entry or transcription, and heading a department without involvement in the research.
- These belong in the author list: designing the research framework or the methodology, writing or substantially revising the manuscript, performing the data analysis, supervising the research and giving academic guidance, and obtaining funding together with taking part in the research.
- An AI tool is never an author or a co-author, since it cannot approve the final version (condition 3) and cannot be accountable (condition 4); the tool is disclosed under `references/ai-disclosure.md`.
- The acknowledgments name each person with the contribution, as in: "The authors thank <name> of <institution> for administrative support and <name> for language editing."

## Funding

- The funding register has one row per funder: the funder, the grant type, the grant number, the PI or role of the author, the period and, optionally, the amount.
- The amount does not appear in the published statement.
- The funder role table marks, for each funder, whether it took part in the study design, the data collection, the analysis, the publication decision and the manuscript preparation.
- A funder that took part in none of them gets the sentence "The funder had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript."
- A funder's own required disclaimer is quoted verbatim, and the statement does not paraphrase it.
- Every funding source is listed, an institutional grant included, with the funder's official full name at the time the grant was approved, and not an acronym on first mention.
- Grant numbers are complete and copied from `config.md`.
- Several funders are ordered by significance, or alphabetically when none is more significant.
- The funding statement and the conflict statement are two separate statements.

The statement has one of these forms.

Single funder:

```
Funding: This work was supported by the <Funder Full Name> (Grant No. <Number>). The funder had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript.
```

Several funders:

```
Funding: This work was supported by the <Funder 1> (Grant No. <Number 1>); the <Funder 2> (Grant No. <Number 2>); and the <Funder 3> (Grant No. <Number 3>). The funders had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript.
```

No funding:

```
Funding: This research received no specific grant from any funding agency in the public, commercial, or not-for-profit sectors.
```

Partial funding:

```
Funding: This work was partially supported by the <Funder> (Grant No. <Number>). The funder had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript.
```

A funder whose format is given here is written in that format. The funder's own disclaimer, where the format has one, stays verbatim.

| Funder | Format |
|---|---|
| NSF | This work was supported by the National Science Foundation under Grant No. <Number>. Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation. |
| NIH | Research reported in this publication was supported by the <Institute Name> of the National Institutes of Health under Award Number <Number>. The content is solely the responsibility of the authors and does not necessarily represent the official views of the National Institutes of Health. |
| ERC | This project has received funding from the European Research Council (ERC) under the European Union's Horizon 2020 research and innovation programme (Grant Agreement No. <Number>). |
| Horizon Europe | This project has received funding from the European Union's Horizon Europe research and innovation programme under Grant Agreement No. <Number>. |
| UKRI | This work was supported by the <Council Name, such as Economic and Social Research Council (ESRC)> [Grant No. <Number>]. |
| SSHRC | This research was supported by the Social Sciences and Humanities Research Council of Canada (SSHRC) [Grant No. <Number>]. |
| NSERC | This work was supported by the Natural Sciences and Engineering Research Council of Canada (NSERC) [Grant No. <Number>]. |
| ARC | This research was supported by the Australian Research Council [Grant No. <Number>]. |

## Conflict of interest

- The conflict statement declares financial interests, consulting relationships, equity, patents and other relationships that could affect the objectivity of the work, and covers more than the funding of this research.
- The types to ask about are financial, institutional (an author evaluating the author's own institution), intellectual (an author defending the author's own prior work), personal, political (government-funded research on government policy) and commercial.
- When an AI tool company influenced the research design, that is a conflict to state.
- The statement is written when none exists, as in the first form below.

No conflict:

```
Declaration of Interest: The authors declare that they have no known competing financial interests or personal relationships that could have appeared to influence the work reported in this paper.
```

A conflict exists:

```
Declaration of Interest: <Author Name> has received <research grants / consulting fees / speaker honoraria> from <Organization>. <Author Name> serves on the <advisory board / editorial board> of <Organization or Journal>. The remaining authors declare no competing interests.
```

## Data availability

The statement has one of these forms, chosen by the Data availability row of `config.md`.

Open data:

```
The data that support the findings of this study are openly available in <repository name> at <URL or DOI>.
```

Restricted data:

```
The data that support the findings of this study are available from <source> but restrictions apply to the availability of these data, which were used under license for the current study, and so are not publicly available. Data are available from the authors upon reasonable request and with permission of <source>.
```

No new data:

```
Data sharing is not applicable to this article as no new data were created or analyzed in this study.
```

- The repository name and the URL or DOI of the open form are copied from `config.md`, and a missing one is a gap.
- Data available on request from the authors, without restrictions from a third party, is written as "The data that support the findings of this study are available from the corresponding author upon reasonable request."

## Ethics

- The ethics statement concerns human or patient data, and it states what the Human or patient data row of `config.md` gives: the approving board, the approval number, the consent obtained and the de-identification applied.
- The form is "This study was approved by <board> (Approval No. <number>). <the consent obtained>. <the de-identification applied>."
- The statement states the approval the collecting study obtained and does not plan the approval.
- A study without human or patient data states "This study used no data from human participants or patients."
- A missing approval number, consent or de-identification of a study with human data is a gap. The writer's report and the final message name it as a gap for the user to fill.

## Responsible use

- A responsible-use statement is written when the venue or the user asks for one. The request is recorded in the Notes of `config.md`.
- The statement has this form:

```
Responsible Use: This research is intended for <stated purpose>. The authors acknowledge that findings related to <sensitive area> could potentially be applied in ways not intended by this research. Users of this research are urged to consider the ethical implications of their applications and to prioritize <specific ethical principle>.
```

## Reproducibility

- A reproducibility statement is written when the venue or the user asks for one. The request is recorded in the Notes of `config.md`.
- The statement has this form:

```
Reproducibility: The search strategy, inclusion criteria, and analytical methods used in this research are documented in <section or appendix>. The AI-assisted components used <specific prompts or parameters>. Researchers wishing to replicate or extend this work should note <relevant limitations or conditions>.
```
