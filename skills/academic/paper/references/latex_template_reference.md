# LaTeX Template Reference

Used by the formatter for LaTeX output generation.

## Basic Article Template

```latex
\documentclass[12pt, a4paper]{article}

% === Packages ===
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{times}                    % Times New Roman
\usepackage[margin=1in]{geometry}     % 1-inch margins
\usepackage{setspace}                 % Line spacing
\usepackage{amsmath}                  % Math support
\usepackage{graphicx}                 % Figures
\usepackage{booktabs}                 % Professional tables
\usepackage{hyperref}                 % Clickable links
\usepackage{natbib}                   % APA-style citations
\usepackage{url}                      % URL formatting
\usepackage{float}                    % Figure placement

% === Settings ===
\doublespacing                        % APA requires double spacing
\setlength{\parindent}{0.5in}         % First-line indent
\bibliographystyle{apalike}           % APA citation style

% === Metadata ===
\title{Paper Title in Title Case}
\author{Author Name \\
  \small Department, Institution \\
  \small \href{mailto:email@example.com}{email@example.com}
}
\date{\today}

% === Document ===
\begin{document}

\maketitle

\begin{abstract}
\noindent
Abstract text here (150-250 words). No paragraph indent in abstract.
\\[6pt]
\textit{Keywords}: keyword1, keyword2, keyword3, keyword4, keyword5
\end{abstract}

\newpage

\section{Introduction}
Introduction text here.

\section{Literature Review}
\subsection{Theme One}
Text with citation \citep{Smith2024}.

\subsection{Theme Two}
\citet{Jones2023} found that...

\section{Methodology}
\subsection{Research Design}
\subsection{Data Collection}
\subsection{Data Analysis}

\section{Results}
\subsection{Finding One}
See Table~\ref{tab:results}.

\begin{table}[H]
\centering
\caption{Descriptive Statistics}
\label{tab:results}
\begin{tabular}{lccc}
\toprule
Variable & $M$ & $SD$ & $N$ \\
\midrule
Variable 1 & 3.45 & 0.82 & 120 \\
Variable 2 & 4.12 & 0.67 & 120 \\
\bottomrule
\end{tabular}
\end{table}

\section{Discussion}
\subsection{Interpretation}
\subsection{Implications}
\subsection{Limitations}

\section{Conclusion}

% === AI Disclosure ===
\subsection*{AI Disclosure}
This paper was prepared with the assistance of AI-powered academic
writing tools. All content was reviewed and verified by the author(s).

% === References ===
\newpage
\bibliography{references}

\end{document}
```

## APA 7.0 Template (`apa7` Class): Preferred for APA Output

When APA 7.0 format is requested, use the `apa7` document class instead of `article`. This ensures correct running heads, title page layout, and heading levels.

```latex
\documentclass[man,12pt,natbib]{apa7}

% === Fonts (XeTeX) ===
\usepackage{fontspec}
\setmainfont{Times New Roman}
\setmonofont{Courier New}

% === Additional packages ===
\usepackage{longtable}
\usepackage{booktabs}
\usepackage{array}
\usepackage{graphicx}
\usepackage{float}
\usepackage{hyperref}
\hypersetup{colorlinks=true, linkcolor=black, citecolor=black, urlcolor=blue, breaklinks=true}
\usepackage{xurl}  % URL line breaking (after hyperref)

% === Table column types ===
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% === Justify text (CRITICAL: apa7 man mode defaults to raggedright) ===
\usepackage{ragged2e}
\usepackage{etoolbox}
\AtBeginDocument{\justifying}
\apptocmd{\maketitle}{\justifying}{}{}
\let\oldraggedright\raggedright
\renewcommand{\raggedright}{\justifying}

% === Pandoc compatibility ===
\newcounter{none}
\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% === Metadata ===
\title{Paper Title}
\shorttitle{Short Title for Running Head}
\author{Author Name}
\affiliation{Institution}
\authornote{Author note text.}

% === Abstract (primary language) ===
\abstract{
  Primary language abstract text...

  \newpage

  \begin{center}\textbf{Second Language Abstract Title}\end{center}

  Second language abstract text...
}

\keywords{keyword1, keyword2, keyword3}

\begin{document}
\maketitle

% Body sections here...

\end{document}
```

### Key Differences: `apa7` vs `article`

| Feature | `apa7` class | `article` class |
|---------|-------------|-----------------|
| Running head | Automatic (`\shorttitle`) | Manual (`fancyhdr`) |
| Title page | Built-in (`\maketitle`) | Manual (`titlepage`) |
| Abstract | `\abstract{}` in preamble | `\begin{abstract}` in body |
| Heading levels | APA 5-level automatic | Manual formatting |
| Double spacing | Automatic in `man` mode | Requires `\doublespacing` |
| Text alignment | **Ragged-right (must override!)** | Justified by default |

### Table Column Width Formula (Mandatory)

**NEVER** use bare `p{0.25\linewidth}` in longtable: this ignores inter-column padding and causes overflow.

**Correct formula**: `p{(\linewidth - N\tabcolsep) * \real{proportion}}`

Where N = `(number_of_columns - 1) x 2`

| Columns | N (tabcolseps) | Example |
|---------|---------------|---------|
| 3 | 4 | `(\linewidth - 4\tabcolsep) * \real{0.3333}` |
| 4 | 6 | `(\linewidth - 6\tabcolsep) * \real{0.2500}` |
| 5 | 8 | `(\linewidth - 8\tabcolsep) * \real{0.2000}` |

## BibTeX Entry Formats

### Journal Article
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
```

### Book
```bibtex
@book{Brown2023,
  author    = {Brown, Alice},
  title     = {Book Title in Sentence Case},
  publisher = {Publisher Name},
  year      = {2023},
  edition   = {2nd},
  address   = {City}
}
```

### Book Chapter
```bibtex
@incollection{Lee2024,
  author    = {Lee, David},
  title     = {Chapter title in sentence case},
  booktitle = {Book Title in Sentence Case},
  editor    = {Editor, First A.},
  publisher = {Publisher Name},
  year      = {2024},
  pages     = {45--67}
}
```

### Conference Paper
```bibtex
@inproceedings{Chen2024,
  author    = {Chen, Wei and Wang, Ming},
  title     = {Paper title in sentence case},
  booktitle = {Proceedings of the Conference Name},
  year      = {2024},
  pages     = {101--110},
  address   = {City, Country},
  doi       = {10.1234/conf.2024.001}
}
```

### Report / Technical Report
```bibtex
@techreport{MOE2024,
  author      = {{Ministry of Education}},
  title       = {Report title in sentence case},
  institution = {Ministry of Education},
  year        = {2024},
  type        = {Annual Report},
  url         = {https://www.example.com}
}
```

### Thesis / Dissertation
```bibtex
@phdthesis{Wang2024,
  author = {Wang, Mei-Ling},
  title  = {Dissertation title in sentence case},
  school = {National Taiwan University},
  year   = {2024},
  type   = {Doctoral dissertation}
}
```

### Website
```bibtex
@misc{WHO2024,
  author       = {{World Health Organization}},
  title        = {Page title in sentence case},
  year         = {2024},
  howpublished = {\url{https://www.who.int/page}},
  note         = {Accessed: 2024-03-15}
}
```

## Citation Commands

### natbib Commands
| Command | Output | Use For |
|---------|--------|---------|
| `\citet{Smith2024}` | Smith (2024) | Narrative citation |
| `\citep{Smith2024}` | (Smith, 2024) | Parenthetical citation |
| `\citep{Smith2024,Jones2023}` | (Jones, 2023; Smith, 2024) | Multiple |
| `\citeauthor{Smith2024}` | Smith | Author only |
| `\citeyear{Smith2024}` | 2024 | Year only |
| `\citep[p.~45]{Smith2024}` | (Smith, 2024, p. 45) | With page |

### biblatex Commands (Alternative)
| Command | Output |
|---------|--------|
| `\textcite{Smith2024}` | Smith (2024) |
| `\parencite{Smith2024}` | (Smith, 2024) |
| `\autocite{Smith2024}` | (Smith, 2024); adapts to style |

## Common LaTeX Compilation Issues

| Issue | Solution |
|-------|---------|
| Bibliography not appearing | Run: latex -> bibtex -> latex -> latex |
| Citations showing [?] | Run bibtex and recompile |
| Hyperlinks not working | Ensure `hyperref` is loaded last |
| Table/figure placement wrong | Use `[H]` from `float` package |
| UTF-8 encoding errors | Ensure `\usepackage[utf8]{inputenc}` |

## Pandoc Conversion Commands

### Markdown to LaTeX
```bash
pandoc paper.md -o paper.tex --bibliography=references.bib --csl=apa.csl
```

### Markdown to PDF (via LaTeX)
```bash
pandoc paper.md -o paper.pdf --pdf-engine=xelatex \
  --bibliography=references.bib --csl=apa.csl \
  -V geometry:margin=1in -V fontsize=12pt -V linestretch=2
```

### Markdown to DOCX
```bash
pandoc paper.md -o paper.docx --bibliography=references.bib --csl=apa.csl
```

## Paper's addition: the class, the engine and the `.bib` entries

This section is `paper`'s addition to academic-paper's page. The draft writer reads it to choose the class of a first draft, every role that writes a `.bib` entry reads it for the entry, and the session reads it for the engine of the compile.

### The class of a publisher

The first draft uses the publisher's class in place of `article` when the Materials in hand row holds no template and the Venue row names a journal of one of these publishers.

| Publisher | Class | Engine |
|---|---|---|
| Elsevier | `elsarticle` | pdfLaTeX |
| Springer | `svjour3` | none named here |
| IEEE | `IEEEtran` | pdfLaTeX |
| ACM | `acmart` | pdfLaTeX |
| MDPI | `mdpi` | none named here |

- The engine column is the engine the compile takes (see "The engine of the compile" below) for a manuscript that loads the class. A class with none named leaves the engine to the venue's template, and then to XeLaTeX.

- A venue of another publisher, or a venue that is unknown, takes the Basic Article Template above. The report says that the layout was not taken from the venue's template, and asks the author to check it against the journal's latest author guidelines.
- When the class sets a citation style that differs from the Citation Format row, the class wins, since the venue's requirement outranks the author's preference. The report names the change.
- A class the installation lacks is a compile line for the compile fix. The agent does not fall back to `article` without saying so in the report.

### The engine of the compile

The session compiles with `latexmk`, and the engine is the first of these that applies:

- the engine a `% !TEX program =` line of the main `.tex` names;
- the engine the class table above gives for the publisher class the main `.tex` loads;
- the engine the venue's template requires, read from the template among the Materials in hand;
- XeLaTeX.

The flags are `-pdf` for pdfLaTeX, `-xelatex` and `-lualatex`. A manuscript set in `IEEEtran` compiled with XeLaTeX warns that font shapes of the `ptm` family are undefined and prints Latin Modern; with pdfLaTeX it prints the Times family the class sets. Under pdfLaTeX an encoding error is answered by `\usepackage[utf8]{inputenc}`.

### The `.bib` entry forms

A role writes an entry from `lookup.py bibtex` when the call prints one, as the bullets below say, and otherwise in the forms that follow them. A title is in sentence case, and a journal in title case.

- The entry is what `bibtex` prints on standard output. Its lines on standard error are notes, and the entry never holds them. A `{?}` in the entry `bibtex` prints is replaced as `SKILL.md`, Rules, says.
- For an arXiv ID whose published version an index names by its DOI, `bibtex` prints the published version's entry.
- When `bibtex` prints the line "published in <venue> (<type>) per Semantic Scholar" for a source, the entry is the one `lookup.py bibtex '<arXiv ID>' --page '<url>'` prints. The `<url>` is that source's page at the venue the line names.
  - An address of that page the agent already holds (the `.bib` entry's `url`, `review.md` beside the key, or the reference text) is tried first, with no search.
  - Without such an address, or when `--page` refuses the address held, the agent may run one web search to find that source's page at the venue the line names. It passes the address it finds to `--page` and runs no second search.
  - The page is never read through WebFetch, and the agent passes no sign-in, payment or bot check.
- Without a page, or when `--page` refuses it, the entry is the `@misc` entry, and the agent's report names the key with the "published in" line as printed.
- Every other lookup of the draft writer, the formatter and the citation compliance agent is made with `lookup.py`. The citation compliance agent also saves a cited source's pages with `curl`, as `agents/citation_compliance_agent.md` says.
