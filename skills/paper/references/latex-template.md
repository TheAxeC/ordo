# LaTeX template

The draft writer agent reads this page to set the preamble and the layout of a first draft, and to write a table that fits the page. It also reads it to write a `.bib` entry, to choose a citation command, and to answer the compile lines of a compile fix. The venue's own template, when the Materials in hand row lists one, replaces everything on this page that it states. The page gives the class for a publisher and the layout of a conference paper for the case where no template is in hand.

## The article template

The first draft uses this preamble and layout when the venue gives no template. The sections, the statements and the bibliography lines are the ones `references/draft-writer.md` gives under "The file".

```latex
\documentclass[12pt, a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{times}
\usepackage[margin=1in]{geometry}
\usepackage{setspace}
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{booktabs}
\usepackage{hyperref}
\usepackage{natbib}
\usepackage{url}
\usepackage{float}

\doublespacing
\setlength{\parindent}{0.5in}
\bibliographystyle{apalike}

\title{Paper Title in Title Case}
\author{Author Name \\
  \small Department, Institution \\
  \small \href{mailto:email@example.com}{email@example.com}
}
\date{\today}

\begin{document}
\maketitle

\begin{abstract}
\noindent
Abstract text, without a paragraph indent.
\\[6pt]
\textit{Keywords}: keyword1, keyword2, keyword3, keyword4, keyword5
\end{abstract}

\newpage

\section{Introduction}
...
\bibliography{refs}
\end{document}
```

- Double spacing and the half-inch indent follow APA. Another style or the venue's limits replace them.
- The `\bibliographystyle` line is the style of the Venue row or of the venue's template.
- A table uses `booktabs` rules, a caption above it, and a label. A figure environment uses the `float` package option `[H]` only when the template does not set the placement.
- `hyperref` is loaded last, after the other packages.

## The class of a publisher

The first draft uses the publisher's class in place of `article` when the Materials in hand row holds no template and the Venue row names a journal of one of these publishers.

| Publisher | Class | Engine | Highlights |
|---|---|---|---|
| Elsevier | `elsarticle` | pdfLaTeX | 3 to 5 bullets of at most 85 characters each, in a `highlights` environment before the `abstract` |
| Springer | `svjour3` | none named here | none |
| IEEE | `IEEEtran` | pdfLaTeX | none |
| ACM | `acmart` | pdfLaTeX | none |
| MDPI | `mdpi` | none named here | none |

- The highlights column is what the draft writer adds before the abstract, as `references/draft-writer.md` gives under "Highlights". A manuscript that loads `elsarticle`, whether the class came from this table or from the venue's template, takes them.
- The engine column is the engine the compile of SKILL.md, Steps 11, takes for a manuscript that loads the class. A class with none named leaves the engine to the venue's template, and then to XeLaTeX.
- A manuscript set in `IEEEtran` compiled with XeLaTeX warns that font shapes of the `ptm` family are undefined and prints Latin Modern. With pdfLaTeX it prints the Times family the class sets.

- A venue of another publisher, or a venue that is unknown, takes the `article` template above. The report says that the layout was not taken from the venue's template, and asks the author to check it against the journal's latest author guidelines.
- When the class sets a citation style that differs from the Citation style row, the class wins, since the venue's requirement outranks the author's preference. The report names the change.
- A class the installation lacks is a compile line for the compile fix. The agent does not fall back to `article` without saying so in the report.

## The layout of a conference paper

A Conference Paper with no template in hand is set in two columns: `\documentclass[10pt, twocolumn]{article}`, with the margins of the article template and the body font at 10 pt. The venue's template, its page limit and its limits replace this layout when they state one.

- A figure or a table that is wider than a column uses the environment `figure*` or `table*`, which spans both columns.
- The width of a table column follows "The width of a table column", with the column width of the two-column layout as `\linewidth`.

## The `apa7` class

A paper in APA 7th uses the `apa7` class in place of `article`. The class sets the running head, the title page and the five heading levels, and in `man` mode it double-spaces.

```latex
\documentclass[man,12pt,natbib]{apa7}

\usepackage{longtable}
\usepackage{booktabs}
\usepackage{array}
\usepackage{graphicx}
\usepackage{float}
\usepackage{hyperref}
\hypersetup{colorlinks=true, linkcolor=black, citecolor=black, urlcolor=blue, breaklinks=true}
\usepackage{xurl}

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

\usepackage{ragged2e}
\usepackage{etoolbox}
\AtBeginDocument{\justifying}
\apptocmd{\maketitle}{\justifying}{}{}
\let\oldraggedright\raggedright
\renewcommand{\raggedright}{\justifying}

\title{Paper Title}
\shorttitle{Short Title for Running Head}
\author{Author Name}
\affiliation{Institution}
\authornote{Author note text.}
\abstract{Abstract text.}
\keywords{keyword1, keyword2, keyword3}
```

| Feature | `apa7` class | `article` class |
|---|---|---|
| Running head | Automatic from `\shorttitle` | Manual with `fancyhdr` |
| Title page | Built in with `\maketitle` | Manual with `titlepage` |
| Abstract | `\abstract{}` in the preamble | `\begin{abstract}` in the body |
| Heading levels | The 5 APA levels, automatic | Manual formatting |
| Double spacing | Automatic in `man` mode | Needs `\doublespacing` |
| Text alignment | Ragged right, so the justification override above is needed | Justified |

- The `apa7` class sets the text ragged right in `man` mode. The block that loads `ragged2e` and `etoolbox` justifies it again, and the draft keeps the block.
- A manuscript that uses `apa7` compiles with the engine of SKILL.md, Steps 11. That is the first that applies of these:
  - the engine a `% !TEX program =` line names;
  - the engine the class table above gives for the class;
  - the engine the venue's template requires;
  - pdfLaTeX in lit-review mode;
  - XeLaTeX.

## The width of a table column

A `longtable` column never has a bare width such as `p{0.25\linewidth}`, which ignores the padding between columns and overflows.

- The width is `p{(\linewidth - N\tabcolsep) * \real{proportion}}`, with `N` equal to `(number of columns - 1) * 2`.
- The proportions of a table add up to 1.

| Columns | N | Width of an equal column |
|---|---|---|
| 3 | 4 | `(\linewidth - 4\tabcolsep) * \real{0.3333}` |
| 4 | 6 | `(\linewidth - 6\tabcolsep) * \real{0.2500}` |
| 5 | 8 | `(\linewidth - 8\tabcolsep) * \real{0.2000}` |

## The `.bib` entry forms

The agent writes an entry from `lookup.py bibtex` when the call prints one, as the bullets below say, and otherwise in the forms that follow them. A title is in sentence case, and a journal in title case.

- The entry is what `bibtex` prints on standard output. Its lines on standard error are notes, and the entry never holds them. A `{?}` in the entry `bibtex` prints is replaced as `SKILL.md`, Rules, says.
- For an arXiv ID whose published version an index names by its DOI, `bibtex` prints the published version's entry.
- When `bibtex` prints the line "published in <venue> (<type>) per Semantic Scholar" for a source, the entry is the one `lookup.py bibtex '<arXiv ID>' --page '<url>'` prints. The `<url>` is that source's page at the venue the line names.
  - An address of that page the agent already holds (the `.bib` entry's `url`, `review.md` beside the key, or the reference text) is tried first, with no search.
  - Without such an address, or when `--page` refuses the address held, the agent may run one web search to find that source's page at the venue the line names. It passes the address it finds to `--page` and runs no second search.
  - The page is never read through WebFetch, and the agent passes no sign-in, payment or bot check.
- Without a page, or when `--page` refuses it, the entry is the `@misc` entry, and the agent's report names the key with the "published in" line as printed.
- Every other lookup of the draft writer, the formatter and the citation compliance agent is made with `lookup.py`. The citation compliance agent also saves a cited source's pages with `curl`, as `references/citation-compliance.md`, "Reading the source", says.

```bibtex
@article{Smith2024,
  author  = {Smith, John A. and Jones, Betty C.},
  title   = {Article title in sentence case},
  journal = {Journal Title in Title Case},
  year    = {2024},
  volume  = {45},
  number  = {2},
  pages   = {123--145},
  doi     = {10.1234/example.2024.001}
}

@book{Brown2023,
  author    = {Brown, Alice},
  title     = {Book Title in Sentence Case},
  publisher = {Publisher Name},
  year      = {2023},
  edition   = {2nd},
  address   = {City}
}

@incollection{Lee2024,
  author    = {Lee, David},
  title     = {Chapter title in sentence case},
  booktitle = {Book Title in Sentence Case},
  editor    = {Editor, First A.},
  publisher = {Publisher Name},
  year      = {2024},
  pages     = {45--67}
}

@inproceedings{Chen2024,
  author    = {Chen, Wei and Wang, Ming},
  title     = {Paper title in sentence case},
  booktitle = {Proceedings of the Conference Name},
  year      = {2024},
  pages     = {101--110},
  address   = {City, Country},
  doi       = {10.1234/conf.2024.001}
}

@techreport{MOE2024,
  author      = {{Ministry of Education}},
  title       = {Report title in sentence case},
  institution = {Ministry of Education},
  year        = {2024},
  type        = {Annual Report},
  url         = {https://www.example.com}
}

@phdthesis{Wang2024,
  author = {Wang, Mei-Ling},
  title  = {Dissertation title in sentence case},
  school = {National Taiwan University},
  year   = {2024},
  type   = {Doctoral dissertation}
}

@misc{WHO2024,
  author       = {{World Health Organization}},
  title        = {Page title in sentence case},
  year         = {2024},
  howpublished = {\url{https://www.who.int/page}},
  note         = {Accessed: 2024-03-15}
}
```

- An organization as author is written in double braces so that BibTeX keeps its name whole.
- `lookup.py cite-keys` reads every command whose name contains `cite` or `Cite`, except `\nocite`, so the commands below are all read.

## The citation commands

With `natbib`:

| Command | Output | Use for |
|---|---|---|
| `\citet{Smith2024}` | Smith (2024) | A narrative citation |
| `\citep{Smith2024}` | (Smith, 2024) | A parenthetical citation |
| `\citep{Smith2024,Jones2023}` | (Jones, 2023; Smith, 2024) | Several sources |
| `\citeauthor{Smith2024}` | Smith | The author alone |
| `\citeyear{Smith2024}` | 2024 | The year alone |
| `\citep[p.~45]{Smith2024}` | (Smith, 2024, p. 45) | A source with a page |

With `biblatex`:

| Command | Output |
|---|---|
| `\textcite{Smith2024}` | Smith (2024) |
| `\parencite{Smith2024}` | (Smith, 2024) |
| `\autocite{Smith2024}` | (Smith, 2024), adapting to the style |

- A manuscript uses the commands of the package its style loads. A plain `\cite{key}` is the default of `references/draft-writer.md` when the style loads neither.

## Compile issues

The compile fix answers a compile line by the row it matches.

| Issue | Solution |
|---|---|
| The bibliography does not appear | Run `latex`, `bibtex`, `latex` and `latex` again, which `latexmk` does |
| A citation shows as [?] | Run `bibtex` and compile again |
| Hyperlinks do not work | Load `hyperref` last |
| A table or figure lands in the wrong place | Use `[H]` from the `float` package |
| An encoding error under pdfLaTeX | Load `\usepackage[utf8]{inputenc}`. XeLaTeX reads UTF-8 and needs no such line |
| A table overflows the page | Write its column widths with the formula above |
