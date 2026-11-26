"""Build docs/user/manual.html, one HTML page with a tab per Markdown document of a repository.

The page holds one tab for each document given, in the order given. Each tab's label is the
document's path relative to the repository root. Its id is that path in lower case, with each run
of characters outside a-z and 0-9 written as one "-" and no "-" at either end, so README.md gives
readme-md and docs/README.md gives docs-readme-md. When a later document's id equals an earlier
one's, it gets "-2", "-3" and so on after it, the first number that makes it differ. Each
document is converted from Markdown to HTML by this script.

Run, from the repository root: python3 utils/manual.py . README.md docs/README.md ...
Usage: python3 utils/manual.py <repository root> <document> ...
Each document is a path relative to the root, or an absolute path inside the root. The script
reads every path from its arguments, so it runs from any working directory.

The Markdown it converts:

- headings, paragraphs, bulleted and numbered lists, nested by their indent, and tables;
- fenced code blocks, inside a list item too, and inline code;
- bold, italic, links and images.

Any other line is written as a paragraph of text: a raw HTML line, such as <p align="center">,
is shown as its text and is not read as HTML.

Every text put into the page is escaped for HTML, so a "<", a "&" or a quote in a document
reaches the page as text. A relative link or image path is rewritten relative to
docs/user/manual.html from the folder of the document that holds it, and a link to another
document given points at that document's tab. A link whose scheme is http, https or mailto
is kept as it is. An image whose scheme is http or https, or whose address starts with // and
so takes the page's own scheme, is written as a link to its address, with its alt text, or the
address when the alt text is empty, as the link's text, and never as an image. A target with
any other scheme, such as javascript:, is written as text and not as a link.

The page carries its styles inline, holds no script and loads nothing from the network. It reads
the same in a light or a dark browser theme. It is ASCII where its documents are ASCII.

Reads: each document given, as UTF-8.
Writes: docs/user/manual.html under the root, creating docs/user/ when it does not exist, then
reads the page back. It prints "wrote docs/user/manual.html (<n> bytes)".

Errors, each printed to stderr, after which nothing is written:

- no document given: the usage line, with exit status 2;
- a root that is not a directory: "error: the root <root> is not a directory";
- a document that resolves outside the root: "error: the document <path> lies outside the
  repository root <root>";
- a document that does not exist or is not a file: "error: the document <path> does not exist";
- a document that is not UTF-8: "error: the document <path> is not UTF-8";
- a document that cannot be read: "error: the document <path> cannot be read: <cause>".

Errors of the write, each printed to stderr:

- the page or its folder cannot be written or read back: "error: <page> cannot be written:
  <cause>", the page removed when it was written;
- the text read back differs from the text written: "error: <page>: the text read back differs
  from the text written; the page is removed", the page removed.

Exit status: 0 the page written and read back equal, 1 an error above other than the usage
error, 2 the usage error.

The script imports only the standard library and needs Python 3.9 or later.
"""

from __future__ import annotations

import posixpath
import re
import sys
from dataclasses import dataclass, field
from html import escape
from pathlib import Path

PAGE = "docs/user/manual.html"
PAGE_FOLDER = "docs/user"
USAGE = "usage: python3 utils/manual.py <repository root> <document> ..."
KEPT_SCHEMES = ("http", "https", "mailto")
REMOTE_SCHEMES = ("http", "https")

FENCE = re.compile(r"^( *)(`{3,}|~{3,})(.*)$")
HEADING = re.compile(r"^ {0,3}(#{1,6})(?: +(.*?))?(?: +#+)? *$")
LIST_ITEM = re.compile(r"^( *)([-*+]|\d{1,9}[.)]) +(.*)$")
TABLE_RULE = re.compile(r"^ *\|? *:?-+:? *(?:\| *:?-+:? *)*\|? *$")
SCHEME = re.compile(r"^([A-Za-z][A-Za-z0-9+.-]*):")
LINK = re.compile(
    r"(!?)\[((?:[^\[\]]|\[[^\[\]]*\])*)\]"
    r"\(\s*(<[^<>]*>|(?:[^()\s]|\([^()\s]*\))*)(?:\s+(?:\"[^\"]*\"|'[^']*'))?\s*\)"
)
BOLD = re.compile(r"\*\*(?=\S)(.+?)(?<=\S)\*\*|__(?=\S)(.+?)(?<=\S)__")
ITALIC = re.compile(
    r"\*(?=\S)(.+?)(?<=\S)\*|(?<![A-Za-z0-9])_(?=\S)(.+?)(?<=\S)_(?![A-Za-z0-9])"
)

STYLE = """
:root { --bg: #ffffff; --fg: #0f172a; --muted: #475569; --line: #cbd5e1;
  --code: #f1f5f9; --tab: #e2e8f0; --accent: #4f46e5; }
@media (prefers-color-scheme: dark) {
  :root { --bg: #0f172a; --fg: #e2e8f0; --muted: #94a3b8; --line: #334155;
    --code: #1e293b; --tab: #1e293b; --accent: #a5b4fc; }
}
* { box-sizing: border-box; }
body { margin: 0; background: var(--bg); color: var(--fg);
  font: 16px/1.55 ui-sans-serif, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
nav { display: flex; flex-wrap: wrap; gap: 4px; padding: 12px 16px;
  border-bottom: 1px solid var(--line); }
nav a { padding: 6px 10px; border-radius: 6px; background: var(--tab); color: var(--fg);
  text-decoration: none; font-size: 14px; }
main { max-width: 860px; margin: 0 auto; padding: 8px 16px 48px; }
.doc { display: none; }
.doc:first-child, .doc:target { display: block; }
main:has(.doc:target) .doc:first-child:not(:target) { display: none; }
body:not(:has(.doc:target)) nav a:first-child { background: var(--accent); color: var(--bg); }
a { color: var(--accent); }
img { max-width: 100%; }
pre, code { font-family: ui-monospace, Menlo, Consolas, monospace; font-size: 14px; }
code { background: var(--code); padding: 1px 4px; border-radius: 4px; }
pre { background: var(--code); padding: 12px; border-radius: 6px; overflow-x: auto; }
pre code { padding: 0; }
table { border-collapse: collapse; margin: 12px 0; display: block; overflow-x: auto; }
th, td { border: 1px solid var(--line); padding: 6px 10px; text-align: left;
  vertical-align: top; }
th { background: var(--code); }
h1, h2, h3, h4, h5, h6 { line-height: 1.25; }
"""


class ManualError(Exception):
    """An error that stops the run with exit status 1."""


@dataclass
class Document:
    """One document of the page: its path relative to the root, its tab's id and its text."""

    label: str
    tab: str
    text: str


@dataclass
class Place:
    """Where a document stands, and the tab of each document given, by its path."""

    folder: str
    tabs: dict[str, str]


@dataclass
class Item:
    """One item of a list: its indent, its marker, and its content as HTML parts and text."""

    indent: int
    ordered: bool
    start: str
    parts: list[str] = field(default_factory=list)
    words: list[str] = field(default_factory=list)


def tab_id(label: str, taken: set[str]) -> str:
    """The tab's id: the path lower-cased, each run outside a-z and 0-9 one "-", made unique."""
    base = re.sub(r"[^a-z0-9]+", "-", label.lower()).strip("-")
    tab = base
    number = 2
    while tab in taken:
        tab = f"{base}-{number}"
        number += 1
    taken.add(tab)
    return tab


def read_documents(root: Path, names: list[str]) -> list[Document]:
    """Read each document, refusing one outside the root, missing or not UTF-8."""
    top = root.resolve()
    documents = []
    taken: set[str] = set()
    for name in names:
        given = Path(name)
        path = (given if given.is_absolute() else top / given).resolve()
        if not path.is_relative_to(top):
            raise ManualError(f"the document {name} lies outside the repository root {root}")
        if not path.is_file():
            raise ManualError(f"the document {name} does not exist")
        try:
            text = path.read_bytes().decode("utf-8")
        except UnicodeDecodeError:
            raise ManualError(f"the document {name} is not UTF-8") from None
        except OSError as error:
            raise ManualError(f"the document {name} cannot be read: {error}") from error
        label = path.relative_to(top).as_posix()
        documents.append(Document(label, tab_id(label, taken), text))
    return documents


def target(raw: str, place: Place) -> str | None:
    """The href or src for a link target, or None for a target that stays text."""
    if raw.startswith("<") and raw.endswith(">"):
        raw = raw[1:-1]
    scheme = SCHEME.match(raw)
    if scheme:
        return raw if scheme.group(1).lower() in KEPT_SCHEMES else None
    if raw.startswith(("#", "/")) or not raw:
        return raw
    path, hash_sign, fragment = raw.partition("#")
    path, question, query = path.partition("?")
    if not path:
        return raw
    joined = posixpath.normpath(posixpath.join(place.folder, path))
    if joined in place.tabs:
        return "#" + place.tabs[joined]
    moved = posixpath.relpath(joined, PAGE_FOLDER)
    return moved + question + query + hash_sign + fragment


def emphasis(text: str) -> str:
    """Bold and italic in text that is already escaped."""
    text = BOLD.sub(lambda match: f"<strong>{match.group(1) or match.group(2)}</strong>", text)
    return ITALIC.sub(lambda match: f"<em>{match.group(1) or match.group(2)}</em>", text)


def inline(text: str, place: Place) -> str:
    """One line or paragraph of Markdown as HTML: code spans, links, images and emphasis."""
    out = []
    plain = []
    index = 0
    while index < len(text):
        char = text[index]
        if char == "`":
            run = len(text[index:]) - len(text[index:].lstrip("`"))
            fence = "`" * run
            close = text.find(fence, index + run)
            while close != -1 and text[close + run : close + run + 1] == "`":
                close = text.find(fence, close + run + 1)
            if close != -1:
                out.append(emphasis(escape("".join(plain))))
                plain = []
                code = text[index + run : close]
                if code.startswith(" ") and code.endswith(" ") and code.strip():
                    code = code[1:-1]
                out.append(f"<code>{escape(code)}</code>")
                index = close + run
                continue
            plain.append(fence)
            index += run
            continue
        if char in "![":
            link = LINK.match(text, index)
            if link:
                out.append(emphasis(escape("".join(plain))))
                plain = []
                out.append(link_html(link, place))
                index = link.end()
                continue
        plain.append(char)
        index += 1
    out.append(emphasis(escape("".join(plain))))
    return "".join(out)


def link_html(link: re.Match[str], place: Place) -> str:
    """A link or an image as HTML, or its Markdown as text when its target is not kept."""
    image, words, raw = link.group(1), link.group(2), link.group(3)
    href = target(raw, place)
    if href is None:
        return escape(link.group(0))
    scheme = SCHEME.match(href)
    remote = bool(scheme) and scheme.group(1).lower() in REMOTE_SCHEMES
    if image and (remote or href.startswith("//")):
        return f'<a href="{escape(href)}">{escape(words or href)}</a>'
    if image:
        return f'<img src="{escape(href)}" alt="{escape(words)}">'
    return f'<a href="{escape(href)}">{inline(words, place)}</a>'


def split_row(line: str) -> list[str]:
    """The cells of a table row, split on each "|" outside inline code and not escaped."""
    row = line.strip()
    if row.startswith("|"):
        row = row[1:]
    if row.endswith("|") and not row.endswith("\\|"):
        row = row[:-1]
    cells = []
    current = []
    in_code = False
    index = 0
    while index < len(row):
        char = row[index]
        if char == "\\" and row[index + 1 : index + 2] == "|":
            current.append("|")
            index += 2
            continue
        if char == "`":
            in_code = not in_code
        if char == "|" and not in_code:
            cells.append("".join(current).strip())
            current = []
        else:
            current.append(char)
        index += 1
    cells.append("".join(current).strip())
    return cells


def is_table(lines: list[str], index: int) -> bool:
    """Whether a table starts at this line: a row with a "|" over a rule of dashes."""
    return (
        index + 1 < len(lines)
        and "|" in lines[index]
        and "-" in lines[index + 1]
        and TABLE_RULE.match(lines[index + 1]) is not None
    )


def table(lines: list[str], index: int, place: Place) -> tuple[str, int]:
    """The table that starts at this line, and the index of the line after it."""
    head = split_row(lines[index])
    out = ["<table>", "<thead><tr>"]
    out.extend(f"<th>{inline(cell, place)}</th>" for cell in head)
    out.append("</tr></thead>")
    out.append("<tbody>")
    index += 2
    while index < len(lines) and lines[index].strip() and "|" in lines[index]:
        cells = split_row(lines[index])
        cells += [""] * (len(head) - len(cells))
        out.append("<tr>" + "".join(f"<td>{inline(cell, place)}</td>" for cell in cells) + "</tr>")
        index += 1
    out.append("</tbody></table>")
    return "\n".join(out), index


def code_block(lines: list[str], index: int, fence: re.Match[str]) -> tuple[str, int]:
    """The fenced code block that starts at this line, and the index of the line after it."""
    indent = len(fence.group(1))
    mark = fence.group(2)
    body = []
    index += 1
    while index < len(lines):
        line = lines[index]
        stripped = line.strip()
        if stripped.startswith(mark[0] * len(mark)) and not stripped.strip(mark[0]):
            index += 1
            break
        body.append(line[indent:] if line[:indent].strip() == "" else line.lstrip())
        index += 1
    return "<pre><code>" + escape("\n".join(body)) + "</code></pre>", index


def flush(item: Item, place: Place) -> None:
    """Move the item's pending words into its parts as HTML."""
    if item.words:
        text = inline(" ".join(item.words), place)
        item.parts.append(text if not item.parts else f"<p>{text}</p>")
        item.words = []


def render_list(items: list[Item]) -> str:
    """The items as nested lists, each item nested under the last item of a smaller indent."""
    out = []
    stack: list[tuple[int, str]] = []
    for item in items:
        tag = "ol" if item.ordered else "ul"
        while stack and item.indent < stack[-1][0]:
            out.append(f"</li></{stack.pop()[1]}>")
        if stack and item.indent == stack[-1][0] and tag != stack[-1][1]:
            out.append(f"</li></{stack.pop()[1]}>")
        if stack and item.indent == stack[-1][0]:
            out.append("</li><li>")
        else:
            number = item.start.rstrip(".)")
            start = f' start="{int(number)}"' if item.ordered and int(number) != 1 else ""
            out.append(f"<{tag}{start}><li>")
            stack.append((item.indent, tag))
        out.append("\n".join(item.parts))
    while stack:
        out.append(f"</li></{stack.pop()[1]}>")
    return "".join(out)


def list_block(lines: list[str], index: int, place: Place) -> tuple[str, int]:
    """The list that starts at this line, and the index of the line after it."""
    items: list[Item] = []
    while index < len(lines):
        line = lines[index]
        match = LIST_ITEM.match(line)
        if match:
            if items:
                flush(items[-1], place)
            marker = match.group(2)
            items.append(Item(len(match.group(1)), marker[0].isdigit(), marker))
            items[-1].words.append(match.group(3))
            index += 1
            continue
        if not line.strip():
            after = index
            while after < len(lines) and not lines[after].strip():
                after += 1
            if after < len(lines) and (
                LIST_ITEM.match(lines[after]) or lines[after].startswith(" ")
            ):
                flush(items[-1], place)
                index = after
                continue
            break
        if not line.startswith(" "):
            break
        fence = FENCE.match(line)
        if fence:
            flush(items[-1], place)
            html, index = code_block(lines, index, fence)
            items[-1].parts.append(html)
            continue
        items[-1].words.append(line.strip())
        index += 1
    flush(items[-1], place)
    return render_list(items), index


def starts_block(lines: list[str], index: int) -> bool:
    """Whether the line starts a block other than a paragraph."""
    line = lines[index]
    return bool(
        FENCE.match(line) or HEADING.match(line) or LIST_ITEM.match(line) or is_table(lines, index)
    )


def convert(text: str, place: Place) -> str:
    """A Markdown document as HTML."""
    lines = text.expandtabs(4).splitlines()
    out = []
    index = 0
    while index < len(lines):
        line = lines[index]
        if not line.strip():
            index += 1
            continue
        fence = FENCE.match(line)
        if fence:
            html, index = code_block(lines, index, fence)
            out.append(html)
            continue
        heading = HEADING.match(line)
        if heading:
            level = len(heading.group(1))
            out.append(f"<h{level}>{inline(heading.group(2) or '', place)}</h{level}>")
            index += 1
            continue
        if is_table(lines, index):
            html, index = table(lines, index, place)
            out.append(html)
            continue
        if LIST_ITEM.match(line):
            html, index = list_block(lines, index, place)
            out.append(html)
            continue
        words = [line.strip()]
        index += 1
        while index < len(lines) and lines[index].strip() and not starts_block(lines, index):
            words.append(lines[index].strip())
            index += 1
        out.append(f"<p>{inline(' '.join(words), place)}</p>")
    return "\n".join(out)


def page(name: str, documents: list[Document]) -> str:
    """The whole HTML page: the tabs, then one section per document."""
    tabs = {document.label: document.tab for document in documents}
    marks = "\n".join(
        f'body:has([id="{document.tab}"]:target) nav a[href="#{document.tab}"] '
        "{ background: var(--accent); color: var(--bg); }"
        for document in documents
    )
    links = "\n".join(
        f'<a href="#{escape(document.tab)}">{escape(document.label)}</a>' for document in documents
    )
    sections = "\n".join(
        f'<section class="doc" id="{escape(document.tab)}">\n'
        f"{convert(document.text, Place(posixpath.dirname(document.label), tabs))}\n"
        "</section>"
        for document in documents
    )
    return (
        "<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\">\n"
        '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
        f"<title>{escape(name)} manual</title>\n<style>{STYLE}{marks}\n</style>\n</head>\n"
        f"<body>\n<nav>\n{links}\n</nav>\n<main>\n{sections}\n</main>\n</body>\n</html>\n"
    )


def write_page(root: Path, body: str) -> str:
    """Write the page under the root and read it back; return the line the run prints."""
    path = root / PAGE
    try:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="utf-8", newline="\n") as handle:
            handle.write(body)
        written = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError) as error:
        path.unlink(missing_ok=True)
        raise ManualError(f"{PAGE} cannot be written: {error}") from error
    if written != body:
        path.unlink()
        raise ManualError(f"{PAGE}: the text read back differs from the text written; "
                          "the page is removed")
    return f"wrote {PAGE} ({len(body.encode('utf-8'))} bytes)"


def main(argv: list[str]) -> int:
    if len(argv) < 3:
        print(USAGE, file=sys.stderr)
        return 2
    root = Path(argv[1])
    try:
        if not root.is_dir():
            raise ManualError(f"the root {argv[1]} is not a directory")
        documents = read_documents(root, argv[2:])
        print(write_page(root, page(root.resolve().name, documents)))
    except ManualError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
