#!/usr/bin/env python3
"""Print the facts of a draft that have one right answer, for the review agents of /writing.

Usage: prose_facts.py <draft> <prose standard>

<draft> is the main file of the draft: a .tex, .md, .txt or .docx file. <prose standard> is the prose standard page.

Reads:

- The draft. A .md or .txt file is read as UTF-8 text. A .docx file is read with numbered_paragraphs of docx_paragraphs.py, imported from this script's folder, so both scripts number the paragraphs alike. A .tex file is read as UTF-8 text together with the files its \\input{...} and \\include{...} commands name, in the order of the skill's Steps 3: the main file first, each named file right after the file that names it, a command after an unescaped % not followed, a name resolved against the main file's folder (a .. part or an absolute path as written), .tex added to a name without an extension, and a file listed once.
- The prose standard: in its section A, the "Banned as filler" list and the "Flagged, not banned" list. The "Vague qualifiers" list is not read.

Paragraphs:

- .docx: each paragraph docx_paragraphs.py prints. Its place is "paragraph <n>", with the part in square brackets for a footnote or an endnote, as in "paragraph 70 [word/footnotes.xml]".
- .md and .txt: a run of non-blank lines. A Markdown heading line (#) and a fenced code block are no paragraph and end a run. A list item line (starting with -, *, + or a number and . or ")") and a table row (starting with |) each start a new run. Its place is "<file>:<line>" of its first line.
- .tex: a run of source lines that are neither blank nor markup lines. Everything from an unescaped % to the end of a line is no text, and a line that holds only a comment is passed over without ending the run, as LaTeX reads it. A markup line holds no word outside commands and their arguments, such as \\section{...}, \\begin{abstract} and \\maketitle, and ends a run. Its place is "<file>:<line>" of its first line, the file named from the main file's folder.
- A run with no word is no paragraph.

The text of a .tex paragraph is read so: \\item starts a new sentence; \\cite, \\ref, \\eqref, \\autoref and \\cref with their argument count as one word; \\label{...} is no text; another command with a braced argument is its argument's text; a command with no argument is no text; inline math between $ signs counts as one word; ~ is a space.

A word is a whitespace-separated token with at least one letter or digit. A paragraph's text is split after ., ? or ! (and any closing quote or bracket) that is followed by whitespace and then an upper-case letter, a digit or an opening quote or bracket. There is no split after e.g., i.e., et al., etc., vs., Fig., Eq., No., Dr., cf. or a single upper-case letter (an initial), and none inside a decimal such as 0.05.

Prints these sections, each headed "## <name>" and separated from the next by a blank line, with "none" under a heading that has no line:

- Paragraphs: "<place>: <s> sentences, <w> words" per paragraph.
- Sentences: "<place> s<k>: <w> words" per sentence, k counting the paragraph's sentences from 1.
- Runs of equal length: "<first place> s<k> to <last place> s<k>: <n> sentences of <w> words" per run of five or more consecutive sentences, across paragraph ends, of the same word count.
- Semicolons: "<c> semicolons in <W> words, <r> per 1000 words", W the words of every paragraph and r rounded to two decimals, then "<place>: <count>" per paragraph with a semicolon.
- Non-ASCII: "<place>: U+<hex> <Unicode name>" per character above U+007E on any line of any file of the draft, or in any .docx paragraph, the name "no name" where Unicode gives none. A place in a .tex, .md or .txt draft is "<file>:<line>".
- Listed words: '<place> s<k>: "<word>" (<list>)' per case-insensitive whole-word hit of an entry of the two lists, the word as the draft writes it. An entry's parenthesis is not part of it.
- Contractions: '<place> s<k>: "<token>"' per token that ends in n't, or is it, that, there, here, what, who, I, you, we, they, he, she or let followed by 's, 're, 've, 'll, 'd or 'm, the apostrophe straight or U+2019, in any case.

Nothing is judged: a hit of "just" is printed whether it is temporal or a softener.

Errors, each printed as one line on standard error:

- "usage: prose_facts.py <draft> <prose standard>", for a count of arguments other than two.
- "error: <file>: <reason>", for a draft, an input or include file, or a prose standard that cannot be read (the reason is the operating system's, or "not valid UTF-8"); a draft extension other than .tex, .md, .txt and .docx; a .docx error docx_paragraphs.py reports, with its reason; and a prose standard whose section A lacks the "Banned as filler" or the "Flagged, not banned" list (the reason names the list).

Exit status: 0 when the facts were printed, 1 on an "error:" line, 2 on the usage line. The facts are printed as UTF-8, whatever the locale.
"""

import importlib.util
import os
import re
import sys
import unicodedata
from dataclasses import dataclass

EXTENSIONS = (".tex", ".md", ".txt", ".docx")
LIST_LABELS = ("Banned as filler", "Flagged, not banned")
MIN_RUN = 5
REFERENCE_COMMANDS = ("cite", "ref", "eqref", "autoref", "cref")

# Private-use characters stand in the text of a .tex paragraph for a sentence break and for the escaped symbols that would otherwise read as syntax.
SENTENCE_BREAK = "\ue000"
ESCAPED_SYMBOLS = {"$": "\ue001", "{": "\ue002", "}": "\ue003"}

COMMAND = re.compile(r"\\[A-Za-z@]+\*?")
ESCAPED_SYMBOL = re.compile(r"\\([${}])")
INLINE_MATH = re.compile(r"\$[^$]*\$")
ITEM = re.compile(r"\\item(?![A-Za-z@])")
INPUT_COMMAND = re.compile(r"\\(?:input|include)\s*\{([^}]*)\}")
MARKDOWN_HEADING = re.compile(r" {0,3}#{1,6}(?:\s|$)")
FENCE = re.compile(r" {0,3}(?:```|~~~)")
LIST_OR_TABLE_LINE = re.compile(r"\s*(?:(?:[-*+]|\d+[.)])\s|\|)")
DOCX_LINE = re.compile(r"(\d+)( \[[^\]]+\])?: (.*)\Z", re.DOTALL)
SENTENCE_END = re.compile(r"[.?!][\"')\]\u201d\u2019]*\s+")
OPENERS = "\"'([{`\u201c\u2018"
ABBREVIATION = re.compile(r"(?:^|[\s(\[\"'])(?:e\.g|i\.e|et al|etc|vs|Fig|Eq|No|Dr|cf|[A-Z])\.$")
CONTRACTION = re.compile(r"(?:\w*n't|(?:it|that|there|here|what|who|i|you|we|they|he|she|let)'(?:s|re|ve|ll|d|m))\Z", re.IGNORECASE)


class FactsError(Exception):
    def __init__(self, path, reason):
        super().__init__(reason)
        self.path = path
        self.reason = reason


@dataclass
class Paragraph:
    place: str
    text: str
    sentences: list


@dataclass
class Draft:
    paragraphs: list
    non_ascii: list


def count_words(text):
    return sum(1 for token in text.split() if any(char.isalnum() for char in token))


def read_lines(path):
    """The lines of a UTF-8 text file, split on newlines only so the numbers match `cat -n`."""
    try:
        with open(path, encoding="utf-8", newline="") as handle:
            text = handle.read()
    except OSError as problem:
        raise FactsError(path, problem.strerror or str(problem))
    except UnicodeDecodeError:
        raise FactsError(path, "not valid UTF-8")
    lines = [line.rstrip("\r") for line in text.split("\n")]
    if lines[-1] == "":
        lines.pop()
    return lines


def section_a_lines(lines):
    """The lines of the prose standard's section A, from its heading to the next heading."""
    section = []
    inside = False
    for line in lines:
        if line.startswith("## "):
            inside = line.startswith("## A.")
        elif inside:
            section.append(line)
    return section


def without_parentheses(text):
    kept = []
    depth = 0
    for char in text:
        if char == "(":
            depth += 1
        elif char == ")":
            depth = max(depth - 1, 0)
        elif depth == 0:
            kept.append(char)
    return "".join(kept)


def read_word_lists(path):
    """[(label, [entry, ...]), ...] for the two lists of section A."""
    section = section_a_lines(read_lines(path))
    lists = []
    for label in LIST_LABELS:
        entries = []
        for line in section:
            if line.startswith(label) and ":" in line:
                items = without_parentheses(line.split(":", 1)[1]).split(",")
                entries = [item.strip().rstrip(".").strip() for item in items]
                entries = [entry for entry in entries if entry]
                break
        if not entries:
            raise FactsError(path, f'the "{label}" list is not in section A')
        lists.append((label, entries))
    return lists


def strip_comment(line):
    """The line up to its first unescaped %."""
    index = 0
    while index < len(line):
        if line[index] == "\\":
            index += 2
        elif line[index] == "%":
            return line[:index]
        else:
            index += 1
    return line


def group_end(text, start):
    """The index after the {...} or [...] group that opens at start; the end of the text for a group never closed."""
    if text[start] == "[":
        end = text.find("]", start)
        return len(text) if end == -1 else end + 1
    depth = 0
    for index in range(start, len(text)):
        if text[index] == "{":
            depth += 1
        elif text[index] == "}":
            depth -= 1
            if depth == 0:
                return index + 1
    return len(text)


def outside_commands(text):
    """The text with each command and its bracketed and braced arguments removed."""
    kept = []
    index = 0
    while index < len(text):
        match = COMMAND.match(text, index) if text[index] == "\\" else None
        if match is None:
            kept.append(text[index])
            index += 1
            continue
        index = match.end()
        while index < len(text) and text[index] in "[{":
            index = group_end(text, index)
    return "".join(kept)


def read_commands(text):
    """The text of a .tex paragraph with each command read as the module docstring says."""
    pieces = []
    index = 0
    while index < len(text):
        match = COMMAND.match(text, index) if text[index] == "\\" else None
        if match is None:
            pieces.append(text[index])
            index += 1
            continue
        name = match.group(0)[1:].rstrip("*")
        index = match.end()
        if index >= len(text) or text[index] != "{":
            continue
        end = group_end(text, index)
        if name in REFERENCE_COMMANDS:
            pieces.append("ref")
        elif name != "label":
            pieces.append(read_commands(text[index + 1:end - 1]))
        index = end
    return "".join(pieces)


def clean_tex(text):
    text = ESCAPED_SYMBOL.sub(lambda match: ESCAPED_SYMBOLS[match.group(1)], text)
    text = INLINE_MATH.sub("math", text)
    text = ITEM.sub(SENTENCE_BREAK, text)
    text = read_commands(text).replace("{", "").replace("}", "").replace("~", " ")
    for symbol, stand_in in ESCAPED_SYMBOLS.items():
        text = text.replace(stand_in, symbol)
    return " ".join(text.split())


def ends_sentence(chunk, match):
    following = chunk[match.end():match.end() + 1]
    if following == "" or not (following.isupper() or following.isdigit() or following in OPENERS):
        return False
    punctuation = match.start()
    return not (chunk[punctuation] == "." and ABBREVIATION.search(chunk[:punctuation + 1]))


def split_sentences(text):
    sentences = []
    for chunk in text.split(SENTENCE_BREAK):
        start = 0
        for match in SENTENCE_END.finditer(chunk):
            if ends_sentence(chunk, match):
                sentences.append(chunk[start:match.end()])
                start = match.end()
        sentences.append(chunk[start:])
    return [sentence.strip() for sentence in sentences if count_words(sentence) > 0]


def paragraph_of(place, text):
    """The paragraph at place, or None for a run of text that holds no word."""
    sentences = split_sentences(text)
    return Paragraph(place, text, sentences) if sentences else None


def non_ascii_facts(place, text):
    return [f"{place}: U+{ord(char):04X} {unicodedata.name(char, 'no name')}" for char in text if ord(char) > 0x7E]


def tex_files(main):
    """[(name from the main file's folder, lines), ...] for the main file and the files it inputs and includes."""
    folder = os.path.dirname(os.path.abspath(main))
    listed = set()
    files = []

    def visit(path):
        key = os.path.abspath(path)
        if key in listed:
            return
        listed.add(key)
        lines = read_lines(path)
        files.append((os.path.relpath(key, folder), lines))
        for line in lines:
            for name in INPUT_COMMAND.findall(strip_comment(line)):
                name = name.strip()
                if os.path.splitext(name)[1] == "":
                    name += ".tex"
                visit(os.path.join(folder, name))

    visit(main)
    return files


def tex_paragraphs(name, lines):
    runs = []
    current = None
    for number, line in enumerate(lines, 1):
        if line.strip().startswith("%"):
            continue
        text = strip_comment(line).strip()
        if text == "" or not any(char.isalnum() for char in outside_commands(text)):
            current = None
        elif current is None:
            current = (number, [text])
            runs.append(current)
        else:
            current[1].append(text)
    paragraphs = [paragraph_of(f"{name}:{number}", clean_tex(" ".join(texts))) for number, texts in runs]
    return [paragraph for paragraph in paragraphs if paragraph is not None]


def plain_paragraphs(name, lines):
    runs = []
    current = None
    fenced = False
    for number, line in enumerate(lines, 1):
        if FENCE.match(line):
            fenced = not fenced
            current = None
        elif fenced or MARKDOWN_HEADING.match(line) or line.strip() == "":
            current = None
        elif current is None or LIST_OR_TABLE_LINE.match(line):
            current = (number, [line.strip()])
            runs.append(current)
        else:
            current[1].append(line.strip())
    paragraphs = [paragraph_of(f"{name}:{number}", " ".join(texts)) for number, texts in runs]
    return [paragraph for paragraph in paragraphs if paragraph is not None]


def load_docx_paragraphs_module():
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "docx_paragraphs.py")
    spec = importlib.util.spec_from_file_location("docx_paragraphs", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def read_docx(path):
    module = load_docx_paragraphs_module()
    try:
        numbered = module.numbered_paragraphs(path)
    except module.DocxError as problem:
        raise FactsError(path, str(problem))
    paragraphs = []
    non_ascii = []
    for line in numbered:
        number, part, text = DOCX_LINE.match(line).groups()
        place = f"paragraph {number}{part or ''}"
        non_ascii += non_ascii_facts(place, text)
        paragraph = paragraph_of(place, text)
        if paragraph is not None:
            paragraphs.append(paragraph)
    return Draft(paragraphs, non_ascii)


def read_draft(path):
    extension = os.path.splitext(path)[1].lower()
    if extension not in EXTENSIONS:
        raise FactsError(path, f'extension "{extension}" is not .tex, .md, .txt or .docx')
    if extension == ".docx":
        return read_docx(path)
    if extension == ".tex":
        files = tex_files(path)
        read_paragraphs = tex_paragraphs
    else:
        files = [(os.path.basename(path), read_lines(path))]
        read_paragraphs = plain_paragraphs
    paragraphs = []
    non_ascii = []
    for name, lines in files:
        paragraphs += read_paragraphs(name, lines)
        for number, line in enumerate(lines, 1):
            non_ascii += non_ascii_facts(f"{name}:{number}", line)
    return Draft(paragraphs, non_ascii)


def numbered_sentences(paragraphs):
    """[(place, k, sentence, words), ...] in document order."""
    return [
        (paragraph.place, k, sentence, count_words(sentence))
        for paragraph in paragraphs
        for k, sentence in enumerate(paragraph.sentences, 1)
    ]


def paragraph_facts(paragraphs):
    return [
        f"{p.place}: {len(p.sentences)} sentences, {sum(count_words(s) for s in p.sentences)} words"
        for p in paragraphs
    ]


def sentence_facts(sentences):
    return [f"{place} s{k}: {words} words" for place, k, _, words in sentences]


def run_facts(sentences):
    facts = []
    start = 0
    for index in range(1, len(sentences) + 1):
        if index < len(sentences) and sentences[index][3] == sentences[start][3]:
            continue
        if index - start >= MIN_RUN:
            first, last = sentences[start], sentences[index - 1]
            facts.append(f"{first[0]} s{first[1]} to {last[0]} s{last[1]}: {index - start} sentences of {first[3]} words")
        start = index
    return facts


def semicolon_facts(paragraphs):
    total_words = sum(count_words(s) for p in paragraphs for s in p.sentences)
    counts = [(p.place, p.text.count(";")) for p in paragraphs]
    total = sum(count for _, count in counts)
    rate = 1000 * total / total_words if total_words else 0.0
    facts = [f"{total} semicolons in {total_words} words, {rate:.2f} per 1000 words"]
    return facts + [f"{place}: {count}" for place, count in counts if count]


def listed_word_facts(sentences, lists):
    patterns = [
        (label, re.compile(r"\b(?:" + "|".join(re.escape(entry) for entry in entries) + r")\b", re.IGNORECASE))
        for label, entries in lists
    ]
    facts = []
    for place, k, sentence, _ in sentences:
        hits = [(match.start(), match.group(0), label) for label, pattern in patterns for match in pattern.finditer(sentence)]
        facts += [f'{place} s{k}: "{word}" ({label})' for _, word, label in sorted(hits)]
    return facts


def contraction_facts(sentences):
    facts = []
    for place, k, sentence, _ in sentences:
        for token in sentence.split():
            bare = re.sub(r"^\W+|\W+$", "", token)
            if CONTRACTION.match(bare.replace("\u2019", "'")):
                facts.append(f'{place} s{k}: "{bare}"')
    return facts


def facts_report(draft, lists):
    sentences = numbered_sentences(draft.paragraphs)
    sections = [
        ("Paragraphs", paragraph_facts(draft.paragraphs)),
        ("Sentences", sentence_facts(sentences)),
        ("Runs of equal length", run_facts(sentences)),
        ("Semicolons", semicolon_facts(draft.paragraphs)),
        ("Non-ASCII", draft.non_ascii),
        ("Listed words", listed_word_facts(sentences, lists)),
        ("Contractions", contraction_facts(sentences)),
    ]
    blocks = ["\n".join([f"## {title}"] + (facts or ["none"])) for title, facts in sections]
    return "\n\n".join(blocks)


def main(argv):
    if len(argv) != 3:
        print("usage: prose_facts.py <draft> <prose standard>", file=sys.stderr)
        return 2
    try:
        draft = read_draft(argv[1])
        lists = read_word_lists(argv[2])
    except FactsError as problem:
        print(f"error: {problem.path}: {problem.reason}", file=sys.stderr)
        return 1
    sys.stdout.reconfigure(encoding="utf-8")
    print(facts_report(draft, lists))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
