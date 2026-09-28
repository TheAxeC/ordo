#!/usr/bin/env python3
"""Check Markdown, LaTeX and plain-text files against the mechanical rules of the prose standard.

Usage: check_prose.py [--limit '<section heading>=<words>']... <file>...

Inputs:
- Each <file>, read as UTF-8. A file ending in .md is Markdown, one ending in .tex is LaTeX, and any
  other file is plain text, read as Markdown with no headings. The script never writes to a file.
- Each --limit, a section heading and a positive whole number of words, split at the last "=".
  The heading is matched to the text of a section heading, case-insensitive, with surrounding
  whitespace ignored. A --limit may appear anywhere among the arguments and more than once.

Output: one line per flag, "<file>:<line>: <check>: <message>", sorted by file, then line, then
the order of the checks below, then message, where <file> is the path as given and <message>
opens with at most 60 characters of the text that triggered the flag, in double quotes, with
each run of spaces, tabs and line ends shown as one space.

What counts as prose:
- A CR LF line end is read as LF.
- Markdown: every line outside fenced code blocks and outside YAML frontmatter at the top of the
  file (a first line "---", trailing spaces allowed, closed by a later "---" or "..."), with
  inline code spans removed. A fence opens at a line whose text starts, at any indentation,
  with three or more backticks or tildes (a backtick fence whose info string holds no
  backtick), and closes at a line of only the same character, at least as many, at any
  indentation; a fence left open runs to the end of the file. The leading ">" markers of a
  blockquote line, nested ones too, are stripped before any check, and the rest is read as
  the line it quotes. Headings (# to ######) are prose for every check except semicolons and
  equal-length. A table row (a line starting with "|") is split at each "|" not preceded by a
  backslash, and each cell is its own unit: it is prose for every check except semicolons
  and equal-length, and no sentence runs across a cell boundary.
- LaTeX: every line with these removed: comments ("%" not preceded by a backslash); inline
  math ($...$ with "\\$" not opening it and no blank line inside it, \\(...\\)) and display
  math ($$...$$, \\[...\\], and the environments equation, align, gather, multline,
  eqnarray, displaymath and math, starred
  too); the environments verbatim, lstlisting and minted, starred too; the argument of \\verb
  (any delimiter), \\lstinline and \\mintinline (a delimiter or braces); and the command, its
  [...] options and its first {...} argument of \\texttt, \\url, \\href, \\label, \\ref,
  \\eqref, \\pageref, \\cref, \\Cref, \\autoref, \\cite and its variants, \\parencite and
  \\textcite. A "~" or "\\ " right after "." is read as nothing, so it ends no sentence;
  elsewhere "~", "\\\\" outside a table and the spacing commands \\, \\; \\: \\! and "\\ " are
  read as a space.
  A line of removed code ends a paragraph; a line of removed math does not, so a sentence
  runs on across display math. Structure commands are read in order along each line, so a
  \\begin and its \\end on one line leave the depth as it was, and only the command itself is
  left out: text beside it is read as prose of the place it stands in. Headings are
  \\section, \\subsection and \\subsubsection, starred too and with an optional [...] argument,
  whose title in braces is the heading text, and \\begin{abstract}, the section "Abstract".
  An optional [...] argument after any \\begin{...}, and the {...} arguments after the
  \\begin of a table, are left out. In tabular (starred too), tabularx and longtable, the
  text is split into cells at "&" not preceded by a backslash and at "\\\\" (with its
  optional [...] argument), and each cell is its own unit as in Markdown. \\item starts a
  list item, its optional [...] label read as the item's text, and the text inside itemize,
  enumerate and description after it continues the item.
- A Markdown list item opens with "-", "*", "+" or a number followed by "." or ")", and runs on
  over the lines after it that follow with no blank line, or are indented after one.
- Running prose, which semicolons reads, is the prose outside headings and table cells, list
  items included, less the one-line data rows: a paragraph of one line whose text does not
  end with ".", "!", "?" or ":" (a closing quote, parenthesis or bracket may follow), and the
  LaTeX data rows below. The lines of a paragraph that are LaTeX data rows are left out when
  its lines are counted. Equal-length reads running prose without the list items, and keeps
  the one-line data rows.
- LaTeX data rows: a LaTeX line whose text is one command with its bracketed arguments is
  running prose, counted by semicolons, when either its command is one that carries prose,
  one of PROSE_COMMANDS (\\footnote, \\caption, \\emph, \\textbf, \\textit, \\textsl,
  \\textsc, \\underline, starred forms too), or it is a brace group opened by a size or font
  switch: "{" directly followed by one of SWITCHES (\\tiny, \\scriptsize, \\footnotesize,
  \\small, \\normalsize, \\large, \\Large, \\LARGE, \\huge, \\Huge, \\itshape, \\bfseries,
  \\em, \\it, \\bf), a switch possibly followed by further commands before the text. Every
  other one-command line stays a data row, whether or not it leaves text, \\noindent,
  \\vspace{3pt} and a custom command included. So do the lines after it that hold only its
  further bracketed arguments, up to a blank line, an argument line that leaves no text such
  as "{}" included. A brace group opened by a switch is running prose whatever the line before
  it is, so a {\\small ...} group after \\noindent is running prose. A line of only bracketed
  arguments that no switch opens is running prose when the line before it is not a data row,
  such as a heading line or a line of running prose. A line that also holds a heading, an
  \\item, a table cell, or the \\begin or \\end of an abstract, a list or a table is not a
  data row.
- A word is a run of letters and digits, joined across "'" and "-". A sentence ends at ".", "!"
  or "?" (a closing quote, parenthesis or bracket may follow) followed by white space or the
  end of its paragraph, list item or cell.

The checks:
- non-ascii: every character above U+007F in any line, code and comments included, except a
  letter (Unicode category L*) and a combining mark (category M*) that follows a letter or
  another combining mark, so a name with accents passes whether composed or decomposed.
- dash-aside: in prose, an em dash or en dash, and a spaced hyphen " - " inside a line (the
  marker of a list item is not one). In Markdown, "--" anywhere in prose. In LaTeX, "---"
  anywhere in prose and "--" with a space on at least one side, so "3--5" passes. A "-" or
  "--" between two digits with one space on each side is a number range and passes in both
  forms. Not read: a table cell holding only "-" (a placeholder), in Markdown and LaTeX; in
  Markdown, a table separator row (a line of only "|", "-", ":" and spaces holding a "-"), a
  thematic break (a line of only "-", "*", "_" and spaces holding three or more of them), and
  the comment markers "<!--" and "-->", whose inner text is read as prose by every check.
- history: in prose, case-insensitive, each phrase of HISTORY_PHRASES, "step <number>" and a
  date YYYY-MM-DD. A phrase matches across any run of white space.
- section-words: for each --limit, the words of each section whose heading matches it, counted
  over the prose of the section without the heading, table cells included, and flagged at
  the heading's line when over the limit. A section runs from its heading to the next heading
  of any level; the section "Abstract" ends at \\end{abstract}. A --limit that matches no
  heading of a file is flagged at line 1 of that file.
- semicolons: over running prose, when the semicolons times 1000 are more than 2 times the
  words, every line of running prose holding a semicolon is flagged with the count and the
  word total.
- throat-clearing: in prose, case-insensitive, each phrase of THROAT_PHRASES, across any run of
  white space.
- filler, vague and flagged: in prose, case-insensitive, each entry of FILLER_WORDS,
  VAGUE_WORDS and FLAGGED_WORDS as a whole word, so a hyphenated word such as easy-going does
  not hold easy. The message asks for the word to be checked, since section A of the prose
  standard allows some uses.
- equal-length: five or more consecutive sentences of running prose whose word counts lie
  within 2 words of each other (the longest minus the shortest is at most 2), flagged at the
  first sentence's line with the counts. A run continues across a paragraph break and across
  the lines left out (list items, tables, code), and ends at a heading and at \\end{abstract}.
- contrast: in prose, list items, headings and table cells included, a sentence holding "not
  <window>, <word>" where the word is not one of CONTINUATIONS, or "not <window> but <word>"
  where the window holds no "but". The window is 1 to 10 words, each of letters, digits, "'"
  and "-" only, so any other character ends it. A removed Markdown code span ends the window
  too, and it stands in no word place of the match, so a code span as the word after the comma
  or after "but" stops the match. A match is skipped when the clause that holds
  "not" (the text after the last ",", ";" or ":" before it in the sentence) starts with one of
  SUBORDINATORS, after any opening quote or bracket. A sentence counts once. When a file holds more than 2, each is flagged.
- colon-lists: two consecutive paragraphs that each end with a colon and are each followed by
  a list, with nothing but blank lines, LaTeX comment lines and LaTeX lines of commands only
  between the first list and the second paragraph, flagged at the second paragraph's first line.

Errors, printed on stderr with the usage line:
- "no file given"
- "--limit needs a value"
- "--limit '<value>' is not <heading text>=<positive integer>"
- "cannot read <file>: <reason>", for a missing file, a directory or an unreadable file
- "<file> is not UTF-8"

Exit status: 0 when nothing is flagged, 1 when anything is flagged, 64 for a usage error, in
which case nothing is printed on stdout.
"""
import re
import sys
import unicodedata

USAGE = "usage: check_prose.py [--limit '<section heading>=<words>']... <file>..."
USAGE_STATUS = 64
QUOTE_LENGTH = 60

CHECKS = (
    "non-ascii", "dash-aside", "history", "section-words", "semicolons", "throat-clearing",
    "filler", "vague", "flagged", "equal-length", "contrast", "colon-lists",
)

FILLER_WORDS = ("easy", "simple", "quick", "very", "really", "just", "simply")
VAGUE_WORDS = (
    "significantly", "many", "often", "typically", "generally", "near-zero", "sub-second",
    "most requests",
)
FLAGGED_WORDS = (
    "delve", "tapestry", "landscape", "pivotal", "crucial", "foster", "showcase", "testament",
    "navigate", "leverage", "realm", "embark", "underscore", "multifaceted", "nuanced",
    "comprehensive", "robust", "intricate", "cornerstone", "paradigm", "synergy", "holistic",
    "streamline", "cutting-edge", "groundbreaking",
)
THROAT_PHRASES = (
    "In the realm of", "It's important to note that", "It is worth mentioning that",
    "This serves as a testament to", "It goes without saying that", "In order to",
    "It should be noted that", "When it comes to", "At the end of the day",
    "With that being said", "This section explains", "The following covers", "Now that we",
    "With this setup complete", "In today's rapidly evolving", "It is important to note that",
    "As a matter of fact", "We now turn our attention to", "This section will discuss",
    "The following paragraph examines",
)
HISTORY_PHRASES = (
    "previously", "formerly", "was changed", "were changed", "was added", "added in",
    "moved from", "renamed from", "used to", "no longer", "as of",
)
CONTINUATIONS = ("and", "or", "nor", "so", "because", "which", "as", "if", "when")

WORD = re.compile(r"[^\W_]+(?:['-][^\W_]+)*")
SENTENCE_END = re.compile(r"[.!?]+[\"')\]]*(?=\s|$)")
ENDS_SENTENCE = re.compile(r"[.!?][\"')\]]*\s*$")
ENDS_LEAD_IN = re.compile(r"[.!?:][\"')\]]*\s*$")
CODE_SPAN = re.compile(r"(?<!`)(`+)(?!`)(.+?)(?<!`)\1(?!`)")
BLOCKQUOTE = re.compile(r"(?:[ \t]*>[ \t]?)+")
FENCE_OPEN = re.compile(r"[ \t]*(`{3,}|~{3,})(.*)$")
FENCE_CLOSE = re.compile(r"[ \t]*(`{3,}|~{3,})[ \t]*$")
MD_HEADING = re.compile(r" {0,3}(#{1,6})(?=[ \t]|$)(.*)$")
MD_ITEM = re.compile(r"[ \t]*(?:[-*+]|\d{1,9}[.)])(?:[ \t]+|$)")
SEPARATOR_ROW = re.compile(r"[|:\- \t]*-[|:\- \t]*$")
CELL_SPLIT = re.compile(r"(?<!\\)\|")
PLACEHOLDER_CELL = re.compile(r"(?<=\|)[ \t]*-[ \t]*(?=\||$)")
COMMENT_MARKER = re.compile(r"<!--|-->")
MD_DASH = re.compile(r"[\u2013\u2014]|-{2,}|(?<=\S)[ \t]+-(?=[ \t])")
TEX_DASH = re.compile(r"[\u2013\u2014]|-{3,}|(?<!-)--(?!-)|(?<=\S)[ \t]+-(?=[ \t])")
TEX_RAW_REGIONS = re.compile(
    r"(?P<verbatim>\\begin\{(?P<env>verbatim|lstlisting|minted)(?P<star>\*?)\}.*?\\end\{(?P=env)(?P=star)\})"
    r"|(?P<inline>\\(?:verb\*?|lstinline(?:\[[^\]]*\])?|mintinline(?:\[[^\]]*\])?\{[^{}]*\})"
    r"(?:(?P<delim>[^A-Za-z\s{*])(?:(?!(?P=delim))[^\n])*(?P=delim)|\{[^{}]*\}))"
    r"|(?P<command>\\(?:texttt|url|href|label|ref|eqref|pageref|cref|Cref|autoref|cite[a-zA-Z]*|parencite"
    r"|textcite)\*?(?:\[[^\]]*\])*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\})"
    r"|(?P<comment>(?<!\\)%[^\n]*)",
    re.S,
)
TEX_MATH = re.compile(
    r"\\begin\{(equation|align|gather|multline|eqnarray|displaymath|math)(\*?)\}.*?\\end\{\1\2\}"
    r"|(?<!\\)\$\$.*?(?<!\\)\$\$"
    r"|(?<!\\)\\\[.*?\\\]"
    r"|(?<!\\)\\\(.*?\\\)"
    r"|(?<!\\)\$(?:\\.|(?!\n[ \t]*\n)[^$\\])+?\$",
    re.S,
)
TEX_STRUCTURE = re.compile(
    r"(?P<heading>\\(?:sub)?(?:sub)?section\*?\s*(?:\[[^\]]*\]\s*)?\{)"
    r"|(?P<begin>\\begin\{(?P<benv>[A-Za-z]+\*?)\})"
    r"|(?P<end>\\end\{(?P<eenv>[A-Za-z]+\*?)\})"
    r"|(?P<item>\\item\b(?:[ \t]*\[(?P<label>[^\]]*)\])?)"
    r"|(?P<cell>(?<!\\)&|\\\\(?:\[[^\]]*\])?)"
)
TEX_LISTS = ("itemize", "enumerate", "description")
TEX_TABLES = ("tabular", "tabular*", "tabularx", "longtable")
TEX_COMMAND = re.compile(r"\\[A-Za-z@]+\*?")
PROSE_COMMANDS = ("footnote", "caption", "emph", "textbf", "textit", "textsl", "textsc", "underline")
SWITCHES = (
    "tiny", "scriptsize", "footnotesize", "small", "normalsize", "large", "Large", "LARGE", "huge",
    "Huge", "itshape", "bfseries", "em", "it", "bf",
)
SWITCH_GROUP = re.compile(r"\{\\(?:%s)(?![A-Za-z@])" % "|".join(SWITCHES))
TEX_PLAIN_STEPS = (
    (re.compile(
        r"\\(?:input|include|includegraphics|bibliography|bibliographystyle|usepackage|documentclass"
        r"|vspace|hspace|newcommand|renewcommand|setlength)(?![A-Za-z@])\*?"
        r"(?:\s*(?:\[[^\]]*\]|\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}))*"), " "),
    (re.compile(r"\\\\(?:\[[^\]]*\])?"), " "),
    (re.compile(r"\\['`^\"~=.]\{?([A-Za-z])\}?"), r"\1"),
    (re.compile(r"\\([%&$#_{}])"), r"\1"),
    (re.compile(r"(?<=\.)(?:~|\\ )"), ""),
    (re.compile(r"\\[,;:! ]"), " "),
    (re.compile(r"\\[A-Za-z@]+\*?"), " "),
    (re.compile(r"[{}]"), ""),
    (re.compile(r"~"), " "),
)
WINDOW = r"(?:\s+(?!but\b)(?:[^\W_]|['-])+){1,10}"
CONTRAST_COMMA = re.compile(r"\bnot(%s),\s+([^\W_]+)" % WINDOW.replace(r"(?!but\b)", ""), re.I)
CONTRAST_BUT = re.compile(r"\bnot(%s)\s+but\s+([^\W_]+)" % WINDOW, re.I)
CLAUSE_BREAK = re.compile(r"[,;:]")
SUBORDINATORS = ("if", "when", "unless", "whether", "because", "although", "since", "while")


class UsageError(Exception):
    pass


def phrase_pattern(phrase, boundary):
    body = r"\s+".join(re.escape(word) for word in phrase.split())
    return re.compile(r"(?<!%s)%s(?!%s)" % (boundary, body, boundary), re.I)


def quote(text):
    return '"%s"' % re.sub(r"[ \t\r\n]+", " ", text).strip(" ")[:QUOTE_LENGTH]


def words(text):
    return len(WORD.findall(text))


def latex_plain(text):
    for pattern, replacement in TEX_PLAIN_STEPS:
        text = pattern.sub(replacement, text)
    return text


def braced(text, start):
    """Return the end of the group whose opening bracket is at text[start - 1]."""
    opening = text[start - 1]
    closing = "}" if opening == "{" else "]"
    depth = 1
    i = start
    while i < len(text) and depth:
        if text[i] == opening:
            depth += 1
        elif text[i] == closing:
            depth -= 1
        i += 1
    return i


def only_arguments(text, position=0):
    """True when text from position on holds only bracketed arguments and white space."""
    while True:
        while position < len(text) and text[position] in " \t":
            position += 1
        if position == len(text):
            return True
        if text[position] not in "{[":
            return False
        position = braced(text, position + 1)


def latex_data_row(text, after_row):
    """True when text, a stripped LaTeX line read as one piece of prose or as nothing, is a data row.

    after_row says whether the line before it is a data row.
    """
    command = TEX_COMMAND.match(text)
    if command and only_arguments(text, command.end()):
        return command.group(0).rstrip("*")[1:] not in PROSE_COMMANDS
    return after_row and only_arguments(text) and not SWITCH_GROUP.match(text)


class Piece:
    """A part of one line read as one kind: text, item, cont, heading, cell, or a boundary.

    contrast_text is the text the contrast check reads: the same text, with each removed
    Markdown code span shown as a backtick instead of a space, so that it ends the window.
    """

    def __init__(self, line, kind, text="", contrast_text=None):
        self.line = line
        self.kind = kind
        self.text = text
        self.contrast_text = text if contrast_text is None else contrast_text
        self.data_row = False


class Block:
    """Pieces read together: a paragraph, a list item, a heading, a table cell, or a boundary."""

    def __init__(self, kind, piece):
        self.kind = kind
        self.pieces = [piece]


class Document:
    """A file split into pieces in reading order, and the text dash-aside reads on each line.

    Piece kinds: text (running prose), item (the start of a list item), cont (the rest of a list
    item), heading, cell (one table cell), blank, code (code, frontmatter or a line of removed
    LaTeX code), math (a line of removed LaTeX math), rule (a separator row or thematic break),
    begin and end (a LaTeX list environment), other (a LaTeX table's begin or end) and close (\\end{abstract}).
    """

    def __init__(self, path, text):
        self.path = path
        text = text.replace("\r\n", "\n")
        self.raw = text.split("\n")
        if text.endswith("\n"):
            self.raw.pop()
        self.dash = [None] * len(self.raw)
        self.pieces = []
        self.headings = []
        self.latex = path.endswith(".tex")
        if self.latex:
            self.parse_latex(text)
        else:
            self.parse_markdown(path.endswith(".md"))
        self.blocks = self.make_blocks()
        for block in self.blocks:
            text = self.block_text(block)
            rest = [p for p in block.pieces if not p.data_row]
            if (block.kind == "para" and len({p.line for p in rest}) == 1
                    and not ENDS_LEAD_IN.search("\n".join(p.text for p in rest))):
                for piece in rest:
                    piece.data_row = True

    def add(self, line, kind, text="", contrast_text=None):
        self.pieces.append(Piece(line, kind, text, contrast_text))
        return self.pieces[-1]

    def parse_markdown(self, with_headings):
        count = len(self.raw)
        start = 0
        if count and self.raw[0].rstrip() == "---":
            for j in range(1, count):
                if self.raw[j].rstrip() in ("---", "..."):
                    for k in range(j + 1):
                        self.add(k, "code")
                    start = j + 1
                    break
        fence = None
        last = None
        blank_before = False
        for i in range(start, count):
            line = BLOCKQUOTE.sub("", self.raw[i], count=1) if self.raw[i].lstrip().startswith(">") else self.raw[i]
            if fence:
                self.add(i, "code")
                closing = FENCE_CLOSE.match(line)
                if closing and closing.group(1)[0] == fence[0] and len(closing.group(1)) >= len(fence):
                    fence = None
                continue
            opening = FENCE_OPEN.match(line)
            if opening and not (opening.group(1)[0] == "`" and "`" in opening.group(2)):
                fence = opening.group(1)
                self.add(i, "code")
                last = "code"
                continue
            if not line.strip():
                self.add(i, "blank")
                blank_before = True
                continue
            text = CODE_SPAN.sub(" ", line)
            marked = CODE_SPAN.sub("`", line)
            marks = line.replace(" ", "").replace("\t", "")
            heading = MD_HEADING.match(text) if with_headings else None
            item = MD_ITEM.match(text)
            dash_text = COMMENT_MARKER.sub(lambda m: " " * len(m.group(0)), text)
            if len(marks) >= 3 and not marks.strip("-*_"):
                kind = "rule"
                self.add(i, kind)
            elif SEPARATOR_ROW.match(line):
                kind = "rule"
                self.add(i, kind)
            elif line.startswith("|"):
                kind = "cell"
                for cell, marked_cell in zip(CELL_SPLIT.split(text), CELL_SPLIT.split(marked)):
                    self.add(i, "cell", cell, marked_cell)
                dash_text = PLACEHOLDER_CELL.sub(lambda m: " " * len(m.group(0)), dash_text)
            elif heading:
                kind = "heading"
                title = re.sub(r"(?:^|[ \t]+)#+$", "", heading.group(2).strip()).strip()
                start = heading.end(2) - len(heading.group(2).lstrip())
                self.headings.append([len(self.pieces), title, None])
                self.add(i, kind, title, marked[start:start + len(title)])
            elif item:
                kind = "item"
                self.add(i, kind, text[item.end():], marked[item.end():])
            elif last in ("item", "cont") and (not blank_before or line[:1] in " \t"):
                kind = "cont"
                self.add(i, kind, text, marked)
            else:
                kind = "text"
                self.add(i, kind, text, marked)
            if kind != "rule":
                self.dash[i] = dash_text
            last = kind
            blank_before = False

    def parse_latex(self, text):
        removed = {}

        def blank_out(match, kind):
            span = match.group(0)
            if kind:
                first = text.count("\n", 0, match.start())
                for line in range(first, first + span.count("\n") + 1):
                    removed[line] = kind
            return re.sub(r"[^\n]", " ", span)

        processed = TEX_RAW_REGIONS.sub(lambda m: blank_out(m, "code" if m.group("verbatim") else None), text)
        processed = TEX_MATH.sub(lambda m: blank_out(m, "math"), processed)
        lines = processed.split("\n")
        state = {"list": 0, "table": 0, "abstract": None, "row": False}
        for i in range(len(self.raw)):
            line = lines[i]
            if not self.raw[i].strip():
                self.add(i, "blank")
                state["row"] = False
                continue
            if not line.strip():
                if i in removed:
                    self.add(i, removed[i])
                continue
            self.dash[i] = self.scan_latex_line(i, line, state)

    def scan_latex_line(self, i, line, state):
        """Add the pieces of one LaTeX line in order and return the text dash-aside reads."""
        dash = line
        position = 0
        first = len(self.pieces)

        def segment(start, end):
            nonlocal dash
            chunk = line[start:end]
            plain = latex_plain(chunk)
            if state["table"]:
                if chunk.strip() == "-":
                    dash = dash[:start] + " " * (end - start) + dash[end:]
                self.add(i, "cell", plain)
            elif plain.strip():
                self.add(i, "cont" if state["list"] else "text", plain)

        for match in TEX_STRUCTURE.finditer(line):
            if match.start() < position:
                continue
            if match.group("cell") and not state["table"]:
                continue
            segment(position, match.start())
            position = match.end()
            if match.group("heading"):
                close = braced(line, match.end())
                title = " ".join(latex_plain(line[match.end():close - 1]).split())
                self.headings.append([len(self.pieces), title, None])
                self.add(i, "heading", title)
                position = close
            elif match.group("begin"):
                env = match.group("benv")
                while position < len(line) and (line[position] == "[" or line[position] == "{" and env in TEX_TABLES):
                    position = braced(line, position + 1)
                if env == "abstract":
                    state["abstract"] = len(self.headings)
                    self.headings.append([len(self.pieces), "Abstract", None])
                    self.add(i, "heading", "Abstract")
                elif env in TEX_LISTS:
                    state["list"] += 1
                    self.add(i, "begin")
                elif env in TEX_TABLES:
                    state["table"] += 1
                    self.add(i, "other")
            elif match.group("end"):
                env = match.group("eenv")
                if env == "abstract":
                    if state["abstract"] is not None:
                        self.headings[state["abstract"]][2] = len(self.pieces)
                        state["abstract"] = None
                    self.add(i, "close")
                elif env in TEX_LISTS:
                    state["list"] = max(state["list"] - 1, 0)
                    self.add(i, "end")
                elif env in TEX_TABLES:
                    state["table"] = max(state["table"] - 1, 0)
                    self.add(i, "other")
            elif match.group("item"):
                self.add(i, "item", latex_plain(match.group("label") or ""))
        segment(position, len(line))
        added = [p for p in self.pieces[first:] if p.kind in ("text", "cont")]
        alone = len(self.pieces) == first or len(added) == 1 and len(self.pieces) - first == 1
        row = alone and latex_data_row(line.strip(), state["row"])
        for piece in added:
            piece.data_row = row
        state["row"] = row
        return dash

    def make_blocks(self):
        blocks = []
        previous = None
        for piece in self.pieces:
            kind = piece.kind
            if kind == "text":
                if previous == "text" and blocks and blocks[-1].kind == "para":
                    blocks[-1].pieces.append(piece)
                else:
                    blocks.append(Block("para", piece))
            elif kind == "cont" and blocks and blocks[-1].kind == "item":
                blocks[-1].pieces.append(piece)
            elif kind in ("item", "cont"):
                blocks.append(Block("item", piece))
            elif kind == "math" and previous in ("text", "item", "cont"):
                blocks[-1].pieces.append(piece)
                continue
            elif kind != "blank":
                blocks.append(Block(kind, piece))
            previous = kind
        return blocks

    def block_text(self, block):
        return "\n".join(piece.text for piece in block.pieces)

    def line_at(self, block, offset):
        return block.pieces[self.block_text(block).count("\n", 0, offset)].line + 1

    def prose_blocks(self):
        return [b for b in self.blocks if b.kind in ("para", "item", "heading", "cell")]

    def sentences(self, block):
        """Yield (line, text, word count, offset) for each sentence of a block that holds a word."""
        text = self.block_text(block)
        spans = []
        position = 0
        for end in SENTENCE_END.finditer(text):
            spans.append((position, end.end()))
            position = end.end()
        if text[position:].strip():
            spans.append((position, len(text)))
        for start, end in spans:
            sentence = text[start:end]
            count = words(sentence)
            if count:
                lead = len(sentence) - len(sentence.lstrip())
                yield self.line_at(block, start + lead), sentence.strip(), count, start + lead


def find_phrases(doc, patterns, message):
    flags = []
    for block in doc.prose_blocks():
        text = doc.block_text(block)
        for pattern in patterns:
            for match in pattern.finditer(text):
                flags.append((doc.line_at(block, match.start()), "%s: %s" % (quote(match.group(0)), message)))
    return flags


def check_non_ascii(doc, limits):
    flags = []
    for number, line in enumerate(doc.raw, 1):
        previous = ""
        for char in line:
            category = unicodedata.category(char)
            if ord(char) > 0x7F and not category.startswith("L"):
                if not (category.startswith("M") and previous[:1] in ("L", "M")):
                    flags.append((number, '"%s": U+%04X is not ASCII and not a letter' % (char, ord(char))))
            previous = category
    return flags


def check_dash_aside(doc, limits):
    flags = []
    pattern = TEX_DASH if doc.latex else MD_DASH
    for index, text in enumerate(doc.dash):
        if text is None:
            continue
        for match in pattern.finditer(text):
            start, end = match.start(), match.end()
            core = match.group(0).strip(" \t")
            core_start = end - len(core)
            if doc.latex and core == "--" and not (text[core_start - 1:core_start].isspace() or text[end:end + 1].isspace()):
                continue
            before, after = text[:core_start], text[end:]
            if core in ("-", "--") and re.search(r"\d $", before) and re.match(r" \d", after):
                continue
            left = len(before.rstrip())
            left = left - len(re.search(r"\S*$", before[:left]).group(0))
            right = end + len(after) - len(after.lstrip())
            right = right + len(re.match(r"\S*", text[right:]).group(0))
            flags.append((index + 1, "%s: a dash used as an aside" % quote(text[left:right])))
    return flags


def check_history(doc, limits):
    patterns = [phrase_pattern(p, r"\w") for p in HISTORY_PHRASES]
    patterns.append(re.compile(r"(?<!\w)step\s+\d+(?!\w)", re.I))
    patterns.append(re.compile(r"(?<!\w)\d{4}-\d{2}-\d{2}(?!\w)"))
    return find_phrases(doc, patterns, "a word of history, to be checked")


def check_section_words(doc, limits):
    flags = []
    counted = ("text", "item", "cont", "cell")
    starts = [h[0] for h in doc.headings]
    for key, limit in limits:
        matched = False
        for start, title, end in doc.headings:
            if title.strip().lower() != key.lower():
                continue
            matched = True
            if end is None:
                later = [s for s in starts if s > start]
                end = later[0] if later else len(doc.pieces)
            total = sum(words(p.text) for p in doc.pieces[start + 1:end] if p.kind in counted)
            if total > limit:
                line = doc.pieces[start].line + 1
                flags.append((line, "%s: %d words, over the limit of %d" % (quote(title), total, limit)))
        if not matched:
            flags.append((1, "%s: no heading matches this limit" % quote(key)))
    return flags


def check_semicolons(doc, limits):
    running = [p for p in doc.pieces if p.kind in ("text", "item", "cont") and not p.data_row]
    total_words = sum(words(p.text) for p in running)
    total = sum(p.text.count(";") for p in running)
    if total * 1000 <= 2 * total_words:
        return []
    noun = "semicolon" if total == 1 else "semicolons"
    message = "%d %s in %d words of running prose, more than 2 per 1000 words" % (total, noun, total_words)
    lines = {}
    for piece in running:
        lines.setdefault(piece.line, []).append(piece.text)
    return [(line + 1, "%s: %s" % (quote(" ".join(texts)), message))
            for line, texts in lines.items() if ";" in "".join(texts)]


def check_throat_clearing(doc, limits):
    patterns = [phrase_pattern(p, r"\w") for p in THROAT_PHRASES]
    return find_phrases(doc, patterns, "a throat-clearing opener, to be cut")


def check_filler(doc, limits):
    patterns = [phrase_pattern(w, r"[\w-]") for w in FILLER_WORDS]
    return find_phrases(doc, patterns, "a filler word, to be checked against section A of the prose standard")


def check_vague(doc, limits):
    patterns = [phrase_pattern(w, r"[\w-]") for w in VAGUE_WORDS]
    return find_phrases(doc, patterns, "a vague qualifier, to be checked against section A of the prose standard")


def check_flagged(doc, limits):
    patterns = [phrase_pattern(w, r"[\w-]") for w in FLAGGED_WORDS]
    return find_phrases(doc, patterns, "a flagged word, to be checked against section A of the prose standard")


def check_equal_length(doc, limits):
    sections = [[]]
    for block in doc.blocks:
        if block.kind == "para":
            sections[-1].extend(doc.sentences(block))
        elif block.kind in ("heading", "close"):
            sections.append([])
    flags = []
    for sentences in sections:
        start = 0
        while start < len(sentences):
            end = start
            low = high = sentences[start][2]
            while end < len(sentences):
                low, high = min(low, sentences[end][2]), max(high, sentences[end][2])
                if high - low > 2:
                    break
                end += 1
            if end - start >= 5:
                counts = ", ".join(str(s[2]) for s in sentences[start:end])
                line, text = sentences[start][0], sentences[start][1]
                flags.append((line, "%s: %d consecutive sentences of %s words" % (quote(text), end - start, counts)))
                start = end
            else:
                start += 1
    return flags


def subordinate(sentence, position):
    clause = CLAUSE_BREAK.split(sentence[:position])[-1].split()
    return bool(clause) and clause[0].lower().lstrip("`'\"([{") in SUBORDINATORS


def check_contrast(doc, limits):
    found = []
    for block in doc.prose_blocks():
        marked = "\n".join(piece.contrast_text for piece in block.pieces)
        for line, sentence, count, offset in doc.sentences(block):
            target = marked[offset:offset + len(sentence)]
            matches = [m for m in CONTRAST_COMMA.finditer(target) if m.group(2).lower() not in CONTINUATIONS]
            matches.extend(CONTRAST_BUT.finditer(target))
            matches = [m for m in matches if not subordinate(sentence, m.start())]
            if matches:
                first = min(matches, key=lambda m: m.start())
                found.append((doc.line_at(block, offset + first.start()), first.group(0)))
    if len(found) <= 2:
        return []
    return [(line, "%s: a binary contrast, %d in this file, more than 2" % (quote(text), len(found))) for line, text in found]


def check_colon_lists(doc, limits):
    units = []
    for block in doc.blocks:
        if block.kind in ("item", "begin", "end"):
            if not (units and units[-1][0] == "list"):
                units.append(("list", block))
        else:
            units.append(("para" if block.kind == "para" else "other", block))
    flags = []
    for i in range(3, len(units)):
        first, first_list, second, second_list = units[i - 3], units[i - 2], units[i - 1], units[i]
        if (first[0] == "para" and first_list[0] == "list" and second[0] == "para" and second_list[0] == "list"
                and doc.block_text(first[1]).rstrip().endswith(":")
                and doc.block_text(second[1]).rstrip().endswith(":")):
            flags.append((second[1].pieces[0].line + 1, "%s: a second consecutive paragraph that ends with a colon and opens a list"
                          % quote(doc.block_text(second[1]))))
    return flags


CHECK_FUNCTIONS = (
    check_non_ascii, check_dash_aside, check_history, check_section_words, check_semicolons,
    check_throat_clearing, check_filler, check_vague, check_flagged, check_equal_length,
    check_contrast, check_colon_lists,
)


def parse_arguments(arguments):
    limits = []
    paths = []
    i = 0
    while i < len(arguments):
        if arguments[i] == "--limit":
            if i + 1 >= len(arguments):
                raise UsageError("--limit needs a value")
            value = arguments[i + 1]
            key, equals, number = value.rpartition("=")
            if not equals or not key.strip() or not re.fullmatch(r"[0-9]+", number) or int(number) == 0:
                raise UsageError("--limit '%s' is not <heading text>=<positive integer>" % value)
            limits.append((key.strip(), int(number)))
            i += 2
        else:
            paths.append(arguments[i])
            i += 1
    if not paths:
        raise UsageError("no file given")
    return limits, paths


def read(path):
    try:
        with open(path, "rb") as handle:
            data = handle.read()
    except OSError as error:
        raise UsageError("cannot read %s: %s" % (path, error.strerror or error))
    try:
        return data.decode("utf-8")
    except UnicodeDecodeError:
        raise UsageError("%s is not UTF-8" % path)


def main(arguments):
    try:
        limits, paths = parse_arguments(arguments)
        texts = [(path, read(path)) for path in paths]
    except UsageError as error:
        sys.stderr.write("check_prose.py: %s\n%s\n" % (error, USAGE))
        return USAGE_STATUS
    flags = []
    for path, text in texts:
        doc = Document(path, text)
        for name, function in zip(CHECKS, CHECK_FUNCTIONS):
            for line, message in function(doc, limits):
                flags.append((path, line, CHECKS.index(name), name, message))
    flags.sort(key=lambda f: (f[0], f[1], f[2], f[4]))
    for path, line, _, name, message in flags:
        sys.stdout.buffer.write(("%s:%d: %s: %s\n" % (path, line, name, message)).encode("utf-8"))
    return 1 if flags else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
