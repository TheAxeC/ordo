# Formatter

The formatter agent reads this page to prepare a LaTeX manuscript for a target format, a citation style or a venue. In a run that does not change the citation style, one start writes two patches per file, the standalone files of the figures `pandoc` drops, `format-report.md`, and for the cases below `refs.bib` and `cover-letter.tex`. In a run that changes the citation style and has a DOCX or Markdown target, the first start writes the `format-convert` patch, `format-report.md` and those other files, and no conversion patch. The session applies that patch to the manuscript and to the conversion copy and compiles the copy. A second start, as a fresh agent, then writes the conversion patch and the figure files, with the citations in the new style. The formatter runs no conversion and changes no other file. It writes each patch with the Write tool, reading the manifest, the `.aux` and the `.bbl` itself, and writes no script and runs none. The session applies the patches, runs `pandoc` and `latexmk` for the target formats, and runs the reference checks. The formatter is not resumed. It starts again as a fresh agent only in the cases of SKILL.md, Steps 10, and for the second start of a run that changes the citation style.

## What the agent reads

- `config.md`: Target formats, Citation style, Venue, Venue limits, Cover letter, Format profile, Materials in hand, Paper type and the Notes. When it writes a cover letter it also reads the rows Authors, Human or patient data and AI use.
- The manuscript's files, each with its block manifest and the patch paths the session gives it, two in a run that does not change the citation style and one in a run that does (`references/patch-file.md`), and the manuscript's `.bib`, which it reads and never patches.
- The path of the conversion copy, a copy of the manuscript's folder in the temporary folder. When the copy was compiled, also its `.aux` and `.bbl`.
- At the second start of a run that changes the citation style, the files of the conversion copy as they stand after the first patch, each with its manifest and one patch path, the `.aux` and `.bbl` of the compile of that copy, and the `format-report.md` of the first start. The other items of this list are read as the first start read them.
- For a `.md` or `.docx` given, the `.tex` the session made from it and the reference list as that `.tex` holds it.
- The latest `citation-report.md` and `review-<r>.md` beside the manuscript, when they stand.
- The template in the Materials in hand row, when the user holds one, and `references/latex-template.md`.
- `references/draft-writer.md`, "The cover letter", when the venue is a journal and no `cover-letter.tex` stands beside the manuscript.
- `lookup.py` with the commands `resolve` and `bibtex`, for the entries of a `refs.bib` it writes (SKILL.md, "Agent prompts").

A limit, a requirement or a layout value that no row of `config.md` and no template holds is never filled from the agent's memory of the venue, its website or its name. The report says that it was not stated.

## The phase boundary

The formatter changes the form of the manuscript and leaves its content as it is.

- It writes no section, abstract or statement, and it rewrites no sentence of the draft.
- It changes no wording of the text. A content change it finds needed goes to the report as an issue for the user.
- A required element that is missing gets the placeholder `[GAP: <element>]` in the `.tex`, at the place the template or the venue gives. The report names the call that writes it, as "The required elements" says.
- It writes no file of an earlier role, and it never edits a patch of another role.

## The two patches

Each file the formatter changes gets two patches when the run does not change the citation style and a DOCX or Markdown target stands. The two are written against the same manifest. Otherwise it gets one patch per start.

| Id | The session applies it to | It holds |
|---|---|---|
| `format-convert` | The main `.tex` and its inputs when a target is `latex`, a citation style other than the manuscript's, or a venue. For a PDF target, to the copy the PDF is compiled in. For a `.tex` made from a `.md` or a `.docx`, to that `.tex`. When the run changes the citation style and a DOCX or Markdown target stands, also to the files of the conversion copy, before the copy is compiled. | The citation style, the venue's template with its required elements, the fields of the format profile in LaTeX, and for a `.md` or `.docx` given the cite commands. |
| `format-convert-copy` | The files of the conversion copy alone, before `pandoc` runs. Never the manuscript. | The changes of "The conversion patch", and in a run that does not change the citation style also every change of the `format-convert` patch for a block. One op for a block. |

- In a run that does not change the citation style, a block that both patches change has the same change of the first in both, so the copy that `pandoc` reads holds the placeholders and the required elements too.
- In a run that changes the citation style, the first start writes the `format-convert` patch only. The second start writes the `format-convert-copy` patch against the copy as the first patch left it, so its ops hold only the changes of "The conversion patch", with the cite commands, the `.aux` and the `.bbl` of the new style.
- The copy patch is written only when a DOCX or Markdown target stands.

## The output formats

The session converts to each target the user named. The formatter prepares the `.tex` for them.

| Target | Made by | The formatter's part |
|---|---|---|
| LaTeX | The `format-convert` patch the session applies to the `.tex` | The citation style, the venue's template and its required elements, and the format profile's fields in LaTeX. |
| PDF | `latexmk` from the `.tex` with the `format-convert` patch | The same patch. A PDF is made from the `.tex` only, and never from a `.docx`. |
| DOCX | `pandoc -s` from the conversion copy with the `format-convert-copy` patch, with the reference document of "The format profile" | The copy patch, so the `.tex` that `pandoc` reads holds the citations, the cross-references and the figures the DOCX needs. |
| Markdown | `pandoc -s -t gfm` from the same copy | The same copy patch. Markdown is the default target. |

- A `.docx` given reaches no PDF target through any route, and the report says so when a PDF was asked for.
- `pandoc` prints the citations of a DOCX and a Markdown output from the CSL file in hand, and in its own default style, Chicago author-date, when none is in hand.
- The `\bibliographystyle` line of the `.tex` does not reach `pandoc`'s output.
- A numbered style is the exception that "The conversion patch" makes.
- The session runs `pandoc` without `--citeproc` only for a numbered style ("The conversion patch"), since the patch has printed its numbers and its list. Every other copy runs with `--citeproc`, with the CSL file when one is held: an author-year style, a label that is no number, an `.aux` with no `\bibcite` line (as `biblatex` writes), and no `.aux`.
- For an author-year style with no CSL file the report says that the output is in Chicago author-date, and that a CSL file of the configured style would change it.
- A runner without `pandoc` gets no DOCX or Markdown output, and the final message names `pandoc` as missing.

## Journal-specific formatting

When the Venue row names a journal or a conference, the formatter checks these requirements against the Venue limits row, the template in hand and the publisher's class:

- the word and page limit;
- the abstract limit and its form, structured or unstructured;
- the heading format;
- the reference style, which may differ from the paper's citation style;
- the placement of figures and tables, inline or at the end;
- the author information, and for a blind review the removal of every author detail;
- the required sections;
- the format of the supplementary materials;
- whether the venue requires the figures as separate files.

The report lists the supplementary-materials format and the separate-figure-files requirement when the Venue limits row or the template says so, and says "not stated" for each the row and the template leave out.

**The class of the venue.** The publisher classes of `references/latex-template.md`, "The class of a publisher", apply: `elsarticle`, `svjour3`, `IEEEtran`, `acmart` and `mdpi`. A change of the document class is a structural patch.

**An unknown venue.** The formatter uses the generic `article` template of `references/latex-template.md`, and the report reminds the user to check the layout against the journal's latest author guidelines.

**The precedence.** The journal's requirement wins over the user's preference. When the venue's reference style differs from the Citation style row, the venue's style is applied. The report names the change, the venue's requirement and the user's preference that it replaced.

**A word or page limit.** The formatter reports a manuscript over a limit with the sections it could shorten. It changes no content to meet a limit.

## Citation conversion

The formatter converts the citation style of the `.tex` between APA 7, Chicago (author-date and notes-bibliography), MLA 9, IEEE and Vancouver. The `.bib` entries stay as they are, and the bibliography style and the cite commands change.

### How each style cites

| Feature | APA 7 | Chicago author-date | Chicago notes-bibliography | MLA 9 | IEEE | Vancouver |
|---|---|---|---|---|---|---|
| In-text form | (Smith, 2024) | (Smith 2024) | A footnote | (Smith 45) | [1] | (1), or a superscript |
| Direct quote | (Smith, 2024, p. 45) | (Smith 2024, 45) | A footnote with the page | (Smith 45) | [1, p. 45] | The number with the page |
| List title | References | References | Bibliography | Works Cited | References | References |
| Order | Alphabetical | Alphabetical | Alphabetical | Alphabetical | Order of appearance | Order of appearance |
| Author form | Last, F. M. | Last, First | Last, First | Last, First | F. M. Last | Last FM |
| Year | After the author | After the author | After the author in the bibliography | At the end of the entry | After the author | After the author |
| Title case | Sentence case | Headline case | Headline case | Headline case | Sentence case | Sentence case |
| Journal title | Italic | Italic | Italic | Italic | Italic | Abbreviated |
| DOI form | `https://doi.org/...` | `https://doi.org/...` | `https://doi.org/...` | `doi:...` | `doi:...` | `doi:...` |

### The change in the `.tex`

- The bibliography style or the `biblatex` style changes to one of the target style. A name the installation lacks is a compile line for the session, and the formatter names the style it chose and never falls back to another without saying so.
- Author-year to numbered: each `\citep` and `\citet` of `natbib` becomes `\cite`, and the package option becomes `numbers`. Numbered to author-year reverses this, with `\citep` for a parenthetical citation and `\citet` for a narrative one.
- To Chicago notes-bibliography: each parenthetical citation becomes `\footcite`, which prints the full citation in the first footnote and a shortened form in the later ones.
- From Chicago notes-bibliography: each `\footcite` becomes the cite command of the target style.
- The order of the list follows the style: alphabetical for APA, Chicago author-date, Chicago notes-bibliography and MLA, and order of first appearance for IEEE and Vancouver.
- A page given as `\citep[p.~45]{key}` keeps its page in the target style's form.

### What changes between styles

| From APA 7 to | Changes |
|---|---|
| Chicago notes-bibliography | The citations become footnotes, first names are written out, titles take headline case, a URL ends with a period, and the list is titled "Bibliography". |
| MLA 9 | The years leave the citations and page numbers enter, first names are written out, "&" becomes "and", the entry order becomes volume, number and year, a DOI is dropped unless the source is online only, and the list is titled "Works Cited". |
| IEEE | The citations become numbers in brackets, the list follows the order of appearance, author names take initials first, a DOI takes the prefix `doi:`, and months are abbreviated. |
| Vancouver | The citations become numbers, the list follows the order of appearance, initials lose their spaces, journal titles are abbreviated by the NLM catalogue, and semicolons and colons separate volume and pages. |

Another pair of styles changes the same features, read from the table above.

### How each style cites AI-generated content

| Style | Form |
|---|---|
| APA 7 | OpenAI. (2024). ChatGPT (Version 4) [Large language model]. https://chat.openai.com |
| Chicago | OpenAI. ChatGPT. Version 4. 2024. Large language model. https://chat.openai.com. |
| MLA 9 | "ChatGPT response to [prompt description]." OpenAI, 15 Mar. 2024, chat.openai.com. |
| IEEE | [N] OpenAI, "ChatGPT," ver. 4, 2024. [Online]. Available: https://chat.openai.com |
| Vancouver | OpenAI. ChatGPT [Large language model]. 2024. Available from: https://chat.openai.com |

The formatter uses this form for an AI tool the `.bib` already holds as an entry. It adds no entry for an AI tool.

### The verification checklist

After the conversion the report lists each of these, with the result the formatter reads from the files, or the command of the session that measures it:

- The number of cite commands and of `.bib` entries before the patches, as the formatter counts them. The patches delete no cite command and no entry. The session counts the cite commands and the cited entries again after the patches, and the final message sets its counts beside these (SKILL.md, "format-convert", "Check the content of each output").
- Every author name, year, title, DOI, volume, issue and page of an entry is kept, and only the case of a title changes under the target style.
- The in-text form matches the target style.
- The order of the list is the one the style needs.
- No citation is orphaned. This is measured by `lookup.py cite-keys`, which prints a `missing:` line for a cited key with no entry and an `unused:` line for an entry no command cites.

## The conversion patch

`pandoc` drops or prints raw what it cannot read. The `format-convert-copy` patch makes each such construct readable in the conversion copy, and the manuscript stays as it is. The patch is written for a DOCX or Markdown target. It holds these changes, each in the block that holds the construct.

- **A wrapper around a table.** A table set inside `\resizebox`, `\scalebox` or `\adjustbox` loses the wrapper, and the table and its caption stay.
- **An algorithm.** An `algorithm` environment, such as that of `algorithm2e` or `algorithmicx`, becomes its caption in bold with its number, and its steps as a numbered list, one step to an item:
  - A comment in a step is written in the step's text.
- **A cross-reference.** Each `\ref`, `\eqref`, `\autoref` and `\cref` becomes the number that the `.aux` gives for its label, with the word the command adds:
  - `\ref` adds no word.
  - `\eqref` puts the number in parentheses.
  - `\autoref` and `\cref` add the name of the kind.
  - A label the `.aux` lacks keeps its command, and the report lists it.
- **A drawing.** Each figure drawn by `tikzpicture` or `pgfplots` becomes `\includegraphics[width=\linewidth]{<main>-figure-<n>.png}` in its `figure` environment, and the caption stays. The formatter writes `<main>-figure-<n>.tex` into the conversion copy for each, with `<main>` the main `.tex`'s name without `.tex` and `<n>` counting from 1 in the order of the manuscript:
  - The class is `standalone` with `border=2pt`.
  - The packages, the `\pgfplotsset` line, the TikZ libraries and the macros that the picture needs are copied from the manuscript's preamble.
  - The body is the picture and nothing else.
  - The session compiles each file with `latexmk` and converts the PDF with `pdftocairo -png -r 300 -singlefile`.
  - The session copies each PNG beside `<main>.md` under the same name, so that the links of the Markdown resolve after the temporary folder is removed. The DOCX embeds the image.
- **A numbered citation style.** The style is numbered when the `.aux` holds at least one `\bibcite` line and the label of each is a number and no year, as `{3}` or `natbib`'s `{{3}{}{{}}{{}}}`. An author-year line of `natbib` holds a number too, with the year after it, and that style is author-year. A label such as `alpha`'s `{Aba16}` is no number, and `biblatex` writes `\abx@aux@cite` lines in place of `\bibcite`; neither is a numbered style here. When the style is numbered, each cite command becomes the numbers of its keys, joined and bracketed as the compile's PDF prints them, such as `[2], [3]` for IEEE. The `\bibliography{...}` line becomes the reference list of the `.bbl`:
  - The list is a bold line with the style's list title, which is no heading, so the headings of the `.tex` and of the output stay equal in number.
  - Each entry is a paragraph that starts with its number in the style's bracket.
  - The text of each entry is the `.bbl`'s, without the `\providecommand` and `\BIBentry` lines, `\newblock` and `\hskip` spacing.
  - The session runs `pandoc` on such a copy without `--citeproc`.
- **Any other style.** The citations stay as they are, and the session runs `pandoc --citeproc`, with the CSL file in hand or in Chicago author-date.
- **A `.md` or `.docx` given.** The reference list that the input held as text is removed once the `.tex` names the `.bib`. This change goes into the `format-convert` patch, since the `.tex` is a file the run made. In a run that does not change the citation style the copy patch holds it too, and in one that does the copy already holds it from the first patch.

The numbers and the list come from the compile of the conversion copy before the formatter's start in a run that does not change the citation style. In a run that does change it, they come from the compile of the copy after the first patch, which the second start reads, so the citations and the list of the conversion patch are in the new style. A patch of a run that does not change the style but changes the class leaves the numbers as the compile of the copy printed them, and the report names the style of the list. A conversion copy that was not compiled has no numbers, and the report says that the cross-references and the numbered style were not made.

## A `.md` or `.docx` given

The session made the `.tex` from the input. The `.tex` holds the reference list as text and the citations as the input wrote them. It names its figures by relative paths in `figures/`.

- The formatter writes `refs.bib` beside the new `.tex`, once, and never over an existing file. When a `refs.bib` stands there, it writes `refs-2.bib`, the `.tex` names that file, and the report names it.
- It makes each entry from the reference text. It runs `lookup.py resolve` for the reference, and with a DOI or an arXiv ID `lookup.py bibtex`.
- An entry that neither command gives is written from the reference text as the formatter reads it, and the report lists it under "Entries written from the reference text". No entry is dropped.
- The `format-convert` patch gives each citation of the text a cite command with the entry's key, names the `.bib`, and removes the reference list held as text.
- The patch changes no wording of the text.
- The session compiles this `.tex` in the conversion copy before the patch, for its cross-reference numbers; its `.aux` holds no `\bibcite` line, since the `.tex` cites nothing yet. With no citation style among the targets its DOCX and Markdown outputs use `pandoc --citeproc`. With one, the run changes the citation style, the session compiles the copy after the first patch, and the second start reads the numbers or the author-year form from that compile.

## The format profile

The Format profile row holds the fields the user stated: body font and size, caption font, placement and alignment, line spacing, page margins in centimetres and table borders. A run with no row has no profile, and the formatter keeps its defaults.

- The formatter applies each declared field to each target as far as the target allows, and keeps its default for a field not declared.
- It takes no value from the venue, the institution, the language or a file name.

| Field | In LaTeX and PDF |
|---|---|
| Body font and size | The class option or the font package, and the size of the class |
| Caption | The `caption` package: font, size, placement and alignment |
| Line spacing | `setspace`: single, `\onehalfspacing`, `\doublespacing`, or `\setstretch` with the fixed value |
| Margins in centimetres | `geometry` |
| Table borders | Three-line: `booktabs` rules. Full grid: `|` column rules and `\hline`. None: no rule. |

- A DOCX target carries a profile field through a reference document, since `pandoc` takes fonts, margins and spacing from it. When the user holds none, the session writes one with `templates/reference_docx.py`, which takes each declared field as an option and keeps its default layout for the others: Times New Roman 12 pt, double line spacing, margins of 2.54 cm, a full-grid table and the page number at the top right. Every field reaches the DOCX through it except the caption's placement, which `pandoc` fixes: a table's caption above the table and a figure's below the figure. The report lists a declared caption placement as not honoured for the DOCX target.
- When the user holds a reference `.docx`, `pandoc` takes its layout from that document and the script does not run. The report then lists each declared field as not honoured for the DOCX target, and names that document.
- A Markdown target has no layout, and the profile is not asked for it.
- A declared field that the target cannot honour is listed with the field, the target and the reason.
- A declared field that would take the manuscript past a limit of the Venue limits row takes the venue's value. The report lists the field, the venue's limit and the value overridden, and the final message names it.

## The cover letter

For a journal venue with no `cover-letter.tex` beside the manuscript, the formatter writes `cover-letter.tex` in the manuscript's folder.

- It writes the letter by `references/draft-writer.md`, "The cover letter", from the rows Cover letter, Authors, Human or patient data and AI use.
- The letter is written once and is not a patch.
- A venue that is not a journal gets no letter.

## The required elements

The formatter checks that the manuscript holds each of these where the venue or its template requires it, and writes the placeholder `[GAP: <element>]` in the `.tex` for each that is missing, except the last two:

- the title page's details: title, authors, affiliations and the corresponding author;
- the abstract and the keywords;
- the AI disclosure statement;
- the limitations section;
- the CRediT, funding, conflict-of-interest, data availability and ethics statements;
- the acknowledgements;
- the cover letter, for a journal venue, which the formatter writes as a file;
- a DOI that a `.bib` entry lacks, for each source that has one. The formatter never patches the `.bib`, so it writes no placeholder for it. It lists each such entry in `format-report.md`, and the final message names it with the call `/paper citation-check`.

The report names, for each missing element, its placeholder and the call that writes it:

| Missing | The call |
|---|---|
| The AI disclosure, and the CRediT, funding, conflict-of-interest, data availability and ethics statements | `/paper disclosure` |
| The abstract and the keywords | `/paper abstract-only` |
| The title page's details, the limitations and the acknowledgements | `/paper revision` |
| A DOI of a `.bib` entry | `/paper citation-check` |

A placeholder is a block the patch inserts into the `.tex`. The AI disclosure statements stay with the draft writer, and the formatter writes none.

## The paper type

- A Conference Paper takes two columns and a smaller font when the venue's template gives none, as `references/latex-template.md` gives under "The layout of a conference paper".
- A Policy Brief does not use the standard academic format, and its layout is freer. The venue's template decides it. The formatter may add sidebars and callout boxes, written with the template's own boxes or, when the template has none, with `tcolorbox`.
- A thesis chapter follows the university's template when the venue names one. The report lists each element of that template that the manuscript lacks, such as a cover page, a table of contents or acknowledgements.

## The version advisory

Before it writes the report, the formatter reads the `.bib` and the sentences that cite a work. It looks for a sentence that mixes versions of one work, by the rules of `references/citation-compliance.md`, "Versions of one work". It lists each such sentence as an issue and names the versions and the fixes that section offers. It changes nothing.

## The quality checklist

The formatter reports on each item of this list. It marks an item it can judge from the files, and for an item the session measures it names the command.

- Content: every section is present, no content is lost, tables and figures are present, the citations are intact and the reference list is complete. The session measures the headings, the figures, the tables and the abstract of each output by the counts of SKILL.md, "format-convert", "Check the content of each output".
- Format: the target's specification is met, the heading levels are right, the font, spacing and margins follow the requirements, the page numbers follow the template and the venue's requirements are met. The compile of the session measures that the `.tex` compiles.
- The format profile: the declared fields are reflected, each field a target could not honour is listed, and each venue override is listed.
- The required elements of "The required elements".
- The submission package: the main file, the `.bib` and the cover letter, for a journal venue.

An item that fails is fixed in the patch when the fix changes form only. An item that needs a content change goes to the report as an issue.

## The edge cases

| Case | The formatter does |
|---|---|
| No target venue | Uses the generic format and puts the reminder of "Journal-specific formatting" in the report. |
| No target format | Takes Markdown. The session shows it at the intake confirmation. |
| No `citation-report.md` beside the manuscript | Writes in the report that the citations were not checked against their sources. |
| The latest `review-<r>.md` has a verdict other than Accept | Writes in the report that the manuscript has not passed its last draft review. |
| The citation formats of the `.tex` are chaotic | Unifies them as far as it can, and writes "citation format requires manual verification" in the report. |
| A required element is missing | Inserts the placeholder in the `.tex` and names the call, as above. |
| A DOI is missing in a `.bib` entry | Lists the entry in the report and names `/paper citation-check`. |

## The files

The formatter writes these, and only these, besides its patches, each with the Write tool:

- `format-report.md` in the run folder.
- `refs.bib` (or `refs-2.bib` when a `refs.bib` stands) beside the `.tex` made from a `.md` or `.docx`.
- `cover-letter.tex` beside the manuscript, for a journal venue with none standing.
- `<main>-figure-<n>.tex` in the conversion copy, one for each drawing of the `.tex` that `pandoc` drops.

It writes no other file and no script, and no file outside the run folder and the conversion copy except the files listed above.

Its patches have the ids `format-convert` and `format-convert-copy` (`references/patch-file.md`), one patch of each id for each file it changes, at the paths the session gives.

### The report

```
## Output package

### Files
| File | Format | Description |

### Format specifications applied
| Specification | Value |
Citation style, Target venue ("General" for none), Language (the language the `.tex` sets by `babel` or `polyglossia`, or English when it sets none), and the word count of the main `.tex` as the formatter counts it.

### The checks
The checklist of "The quality checklist", each item marked or named with the command that measures it.

### Format profile
Each field a target could not honour (field, target, reason) and each venue override (field, the venue's limit, the value overridden).

### The conversion patch
Each change made in the conversion copy, each label or citation the `.aux` lacks, each drawing made into a PNG, and the style of the reference list.

### The required elements
Each missing element with its placeholder and its call, and each `.bib` entry without a DOI with the call `/paper citation-check`.

### Issues for the user
Each content change found needed, each entry written from the reference text, each version issue, and each statement of "The edge cases".

### Conversion commands
The formatter leaves this section out. After the conversion the session appends it, with each command it ran and its exit status, read from `checks.md`.
```

## Left out

- The provenance gates, the zh-TW and Chinese settings (`xeCJK` and the Chinese `pandoc` options), and the submission-package verifier. The verifier belongs to `submit-manuscript`.
- The AI disclosure statements. They stay with the draft writer, and a missing one gets its placeholder.
- The stripping of ARS HTML-comment markers. A manuscript of this skill holds no such marker, since its block anchors live in a manifest beside the file (`references/patch-file.md`).
- `tectonic` as a compiler. The PDF is made by `latexmk` with the engine of SKILL.md, Steps 11.
- The pass threshold of 1 percent for the word count before and after a conversion. The session measures the headings, the figures, the tables and the words of each output, and the report lists each difference with no threshold (SKILL.md, "format-convert", "Check the content of each output").
- The `Verbatim` block with `fancyvrb` for wide verbatim content, and the placement of a second-language abstract. The formatter writes no verbatim block and no second abstract, and a listing the manuscript holds stays as written.
- The Chinese paper for an international journal with a Chinese abstract as supplementary material, and every other zh-TW rule, since `paper` writes no bilingual abstract.
- The lookup of a venue's requirements in a journal submission guide, which belongs to `submit-manuscript`. The requirements come from the Venue limits row, the template in hand and the publisher's class.
