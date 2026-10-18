#!/usr/bin/env python3
"""Make every reference lookup of the /literature skill, on the Python standard library alone.

Usage:

    lookup.py resolve <DOI | arXiv ID | title> [--year <year>]
    lookup.py search <query> [--limit <n>]
    lookup.py refs <DOI | arXiv ID | Semantic Scholar ID | OpenAlex ID>
    lookup.py cited-by <DOI | arXiv ID | Semantic Scholar ID | OpenAlex ID>
    lookup.py bibtex <DOI | arXiv ID>
    lookup.py check-urls <report>
    lookup.py fetch <DOI | arXiv ID> <folder> <key>
    lookup.py quote-check <report> <folder>

Every command prints plain text for a person, one line per record or result, and never JSON.

Identifiers. A DOI may be written as a bare DOI (10.xxxx/...), as https://doi.org/..., http://doi.org/..., https://dx.doi.org/... or doi:... and is stripped to the bare DOI. A DOI 10.48550/arXiv.<id> is also read as the arXiv ID <id>, and an arXiv ID is also read as the DOI 10.48550/arXiv.<id>. An arXiv ID is a new-style ID (2106.15928) or an old-style ID (math/0601001, hep-th/9901001v2), with or without a version suffix, which is dropped. A DOI or a title that reaches a URL is percent-encoded.

Commands:

- resolve queries Crossref, OpenAlex, Semantic Scholar and arXiv and prints one line per index. For a title, each index's search gives candidates; a candidate matches at a title ratio of 0.70 or more, and of the matching candidates those whose year equals --year are preferred when there are any, and the one with the highest ratio is taken. For a DOI or an arXiv ID, the first record found, in the order Crossref, OpenAlex, Semantic Scholar, arXiv, is the reference, each other record's title is compared with it, and a record below 0.70 is printed with DOI_MISMATCH. For a title, arXiv is searched for the title as a phrase (ti:"<title>"). For a DOI or an arXiv ID, arXiv is queried only when the input holds an arXiv ID. The year is read only for a title. A line reads "<index>: ratio <r>: <title> | <authors> | <year> | <venue> | doi ... | arXiv ... | OpenAlex ... | Semantic Scholar ... | open access ...", or "<index>: not found", or "<index>: left out, <reason>".
- search prints the records of the four indexes' searches, --limit per index (20 by default, at most 100), merged when they share a DOI (compared lowercased), an arXiv ID (version dropped) or a Semantic Scholar ID. A merged record keeps the fields of the record with more fields filled, and the other record fills its empty fields. The query goes to Crossref and Semantic Scholar as given, to OpenAlex with each ? and * replaced by a space (OpenAlex reads them as wildcards and answers HTTP 400), and to arXiv in arXiv's own syntax: each word as all:<word>, a quoted phrase as all:"<phrase>", AND and OR kept, NOT written ANDNOT, parentheses kept, and two terms with no operator between them joined by AND. An operator word is read only in capitals. An operator that follows an operator replaces it, and an operator with no term before it or after it is dropped. When the parentheses do not balance, all of them are dropped, and a pair with no term inside is dropped. Every other character is dropped. Crossref ranks by relevance and reads no operator, and arXiv has no search by a sentence: a sentence is read as its words joined by AND, and arXiv can answer "not found" for it. After the records, an index that answered with no record is printed "<index>: not found" and an index that is left out "<index>: left out, <reason>".
- refs and cited-by print the references of a work or the works that cite it, from Semantic Scholar and OpenAlex, merged as search merges, at most 100 per index; a line "<index>: first 100, more exist" says when an index holds more. Crossref and arXiv are not asked. An index that answered with no record is printed "<index>: not found", and an index that is left out "<index>: left out, <reason>". An OpenAlex ID (W...) is read by OpenAlex only and a Semantic Scholar ID (40 hexadecimal digits) by Semantic Scholar only, and the other index is printed as left out with that reason.
- bibtex prints the BibTeX entry https://doi.org/<doi> returns for Accept: application/x-bibtex when its first character other than whitespace is @, as it is given. For an arXiv ID, or a DOI 10.48550/arXiv.<id>, it prints an @misc entry built from the arXiv record, keyed arxiv_<id> with each character other than a letter or digit written _, with eprint and archivePrefix = {arXiv}, each run of whitespace in the title and the authors made one space, and the braces of a value removed when they are not balanced.
- check-urls reads the references.bib in the report's folder. For each key the report cites, it prints the HTTP status, after redirects, of the key's doi (as https://doi.org/<doi>), else its eprint (as https://arxiv.org/abs/<id>), else its url. A cited key with none of the three is printed as "no identifier", a cited key that references.bib lacks as "no entry in references.bib", and a URL that gives no answer as "failed, <reason>".
- fetch writes the full text of a source into <folder>, named from <key> with each / and : written _ (<stem>). It tries, in order, https://arxiv.org/html/<id> and https://arxiv.org/pdf/<id> when the input holds an arXiv ID, the open_access.oa_url of OpenAlex and the openAccessPdf.url of Semantic Scholar. HTML counts only from arxiv.org/html. From every other source only a body starting %PDF- counts. The first that counts is written as <stem>.html or <stem>.pdf, and its text as <stem>.txt, by pdftotext (called with its arguments as a list) for a PDF, with the tags removed by html.parser and the text of script and style elements left out for HTML. A PDF whose text pdftotext cannot make or makes empty counts as no text and is removed, and the next URL is tried. When no full text is found, the abstract the indexes return (the arXiv summary, else the Semantic Scholar abstract, else the OpenAlex abstract_inverted_index put back in word order) is written as <stem>.abstract.txt. fetch prints each lookup and each URL tried with its status, and exits 1 when no full text was found.
- quote-check reads the references.bib in the report's folder and the report. For each passage line "> [@<key>, <locator>]: "<passage>"" it prints found or not found ("not found, no <file>" when the text file is missing); the passage is the text between the first " after "]: " and the last " of the line. It looks the passage up in <folder>/<stem>.txt, or in <folder>/<stem>.abstract.txt when the locator is abstract. Both texts are normalised first: every hyphen at a line end is removed with its line break, every hyphen between two letters is removed, then each run of whitespace becomes one space. A passage is found when the normalised passage occurs in the normalised text, and an empty passage is never found. A line that starts "> [@" and does not have the form of a passage line is printed as malformed. It also prints each cited key with no passage line ("no passage"), each cited key that references.bib lacks ("no entry") and each cited key with neither <stem>.txt nor <stem>.abstract.txt in the folder ("no text").

A citation in a report is [@<key>, <locator>] or [@<a>; @<b>, <locator>]. A line that is a passage line contributes the key of its leading citation only; the passage is not searched for citations.

Pacing and failures:

- Requests to arxiv.org, www.arxiv.org and export.arxiv.org are made one at a time, with at least 3 seconds between the end of one and the start of the next, a redirect included, across every lookup.py process that uses the same temporary folder. Each is made while holding an exclusive flock on the file ordo-lookup-arxiv in the temporary folder (tempfile.gettempdir()), which holds the time the last arXiv request ended. A file that cannot be opened, locked or read, or that holds text other than a time, makes the request wait the full 3 seconds; an empty file, as a new one is, makes it wait not at all.
- An HTTP 429 waits 2 seconds and is retried, at most 3 times. After that the index is left out with the reason "HTTP 429 after 3 retries", fetch prints that reason for the URL, and check-urls prints the status 429.
- An index that answers 404, or 200 with no result, is "not found". An index that answers any other status, fails to connect, or answers a body that does not parse or lacks a field the script reads is left out with its reason, and the other indexes and the records already found go on. No field is written for a lookup that failed.
- Only http and https URLs are requested, including every URL an index returns and every redirect.

Reads:

- The arguments of the call.
- The environment variables S2_API_KEY (sent in the x-api-key header to api.semanticscholar.org), OPENALEX_API_KEY (sent as the api_key parameter to api.openalex.org) and CROSSREF_POLITE_EMAIL (sent as the mailto parameter and in the User-Agent to api.crossref.org). Each is optional, and no value is ever printed.
- The indexes at https://api.crossref.org, https://api.openalex.org, https://api.semanticscholar.org/graph/v1 and https://export.arxiv.org, https://doi.org, https://arxiv.org, and each URL an index returns for an open-access copy.
- For check-urls and quote-check: the report, and references.bib in the report's folder. For quote-check: <folder>/<stem>.txt and <folder>/<stem>.abstract.txt.
- For fetch: the program pdftotext, which it runs on the PDF it wrote.
- For every request to arXiv: the file ordo-lookup-arxiv in the temporary folder.

Writes: fetch writes <stem>.html, <stem>.pdf, <stem>.txt and <stem>.abstract.txt inside <folder>, and nothing else outside it. Every request to arXiv writes the time it ended to ordo-lookup-arxiv in the temporary folder when it could open the file, and creates the file with mode 600 when it is absent.

Errors, each printed as one line on standard error:

- "usage: lookup.py <command> ..." followed by the command list, for no command or an unknown command.
- "error: <command> takes <arguments>", for a wrong count of arguments.
- "error: unknown option <option>", "error: <command> needs a value after <option>", "error: --year needs a four-digit year" and "error: --limit needs a whole number from 1 to 100".
- "error: <value> is not a DOI or an arXiv ID", for bibtex and fetch.
- "error: <value> is not a DOI, an arXiv ID, a Semantic Scholar ID or an OpenAlex ID", for refs and cited-by.
- "error: the key is empty", for fetch.
- "error: <folder>: not a folder", for fetch and quote-check.
- "error: <path>: <reason>", for a report or references.bib that cannot be read (the reason is the operating system's, or "not valid UTF-8"), and for a file fetch cannot write.

Exit status: 0 when the command ran and found nothing to fail; 1 when bibtex got no BibTeX entry, when check-urls or quote-check found a failure (a URL not ending in a 2xx status or giving no answer, a key printed as having no identifier, no entry, no passage or no text, a passage not found, a malformed passage line), or when fetch found no full text; 2 for a call it cannot read (every error line above).
"""

import difflib
import fcntl
import html
import http.client
import json
import os
import re
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import dataclass, field, replace
from html.parser import HTMLParser

MATCH_THRESHOLD = 0.70
ARXIV_SPACING = 3.0
ARXIV_LOCK_NAME = "ordo-lookup-arxiv"
RETRY_WAIT = 2.0
RETRIES = 3
TIMEOUT = 30
MAX_REDIRECTS = 10
TITLE_CANDIDATES = 5
DEFAULT_LIMIT = 20
MAX_LIMIT = 100
REFERENCE_PAGE = 100
OPENALEX_BATCH = 50
INDEX_NAMES = ("Crossref", "OpenAlex", "Semantic Scholar", "arXiv")
ARXIV_HOSTS = ("arxiv.org", "export.arxiv.org", "www.arxiv.org")
USER_AGENT = "lookup.py (the literature skill of Ordo)"
ATOM = "{http://www.w3.org/2005/Atom}"
ARXIV_ATOM = "{http://arxiv.org/schemas/atom}"
S2_FIELDS = "paperId,title,authors,year,venue,externalIds,openAccessPdf"
OPENALEX_FIELDS = "id,title,authorships,publication_year,primary_location,doi,open_access"
CROSSREF_FIELDS = "DOI,title,author,issued,container-title"

DOI_PREFIX = re.compile(r"^(?:https?://(?:dx\.)?doi\.org/|doi:)", re.IGNORECASE)
DOI_PATTERN = re.compile(r"^10\.\d{4,9}/\S+$")
ARXIV_NEW = re.compile(r"^\d{4}\.\d{4,5}(?:v\d+)?$")
ARXIV_OLD = re.compile(r"^[a-z]+(?:-[a-z]+)*(?:\.[A-Za-z]{2})?/\d{7}(?:v\d+)?$")
ARXIV_DOI = re.compile(r"^10\.48550/arxiv\.(.+)$", re.IGNORECASE)
VERSION_SUFFIX = re.compile(r"v\d+$")
S2_ID = re.compile(r"^[0-9a-f]{40}$")
OPENALEX_ID = re.compile(r"^W\d+$")
CITATION = re.compile(r"\[(@[^\[\]]*)\]")
PASSAGE_LEAD = re.compile(r"^>\s*\[@([^,;\]\s]+),\s*([^\]]+)\]:\s")
PASSAGE_START = re.compile(r"^>\s*\[@")
PARSE_ERRORS = (ValueError, KeyError, TypeError, AttributeError, IndexError, ET.ParseError)
BLOCK_TAGS = frozenset(
    "address article aside blockquote caption dd div dl dt figcaption figure footer h1 h2 h3 h4 h5 h6 header "
    "li main nav ol p pre section table td th tr ul".split()
)
SKIPPED_TAGS = frozenset(("script", "style"))
QUERY_TOKEN = re.compile(r'"[^"]*"|[()]|\w+')
QUERY_OPERATORS = ("AND", "OR", "NOT")
COMMANDS = ("resolve", "search", "refs", "cited-by", "bibtex", "check-urls", "fetch", "quote-check")


class UsageError(Exception):
    """A call the script cannot read: the message is printed after "error: " (or whole, when it starts "usage:")."""


class LeftOut(Exception):
    """An index or a URL that gave no answer to use: the message is the reason printed for it."""


@dataclass
class Record:
    title: str = ""
    authors: list = field(default_factory=list)
    year: int = 0
    venue: str = ""
    doi: str = ""
    arxiv_id: str = ""
    openalex_id: str = ""
    s2_id: str = ""
    oa_urls: list = field(default_factory=list)
    abstract: str = ""
    indexes: list = field(default_factory=list)


@dataclass
class Outcome:
    """What one index gave: its records, or the reason it was left out. No record and no reason is "not found"."""

    records: list = field(default_factory=list)
    left_out: str = ""
    more: bool = False


@dataclass
class Identifier:
    kind: str  # "doi", "arxiv" or "title"
    text: str
    doi: str = ""
    arxiv_id: str = ""


@dataclass
class Reply:
    status: int
    body: bytes
    url: str
    content_type: str = ""

    def text(self):
        match = re.search(r"charset=([\w-]+)", self.content_type or "", re.IGNORECASE)
        try:
            return self.body.decode(match.group(1) if match else "utf-8", errors="replace")
        except LookupError:
            return self.body.decode("utf-8", errors="replace")


# Text and identifiers.


def collapse_spaces(text):
    return re.sub(r"\s+", " ", text or "").strip()


def normalise_title(title):
    title = re.sub(r"[^\w ]|_", "", (title or "").lower())
    return re.sub(r" +", " ", title).strip()


def title_ratio(first, second):
    a, b = normalise_title(first), normalise_title(second)
    if not a or not b:
        return 0.0
    return difflib.SequenceMatcher(None, a, b).ratio()


def strip_version(arxiv_id):
    return VERSION_SUFFIX.sub("", arxiv_id)


def is_arxiv_id(text):
    return bool(ARXIV_NEW.match(text) or ARXIV_OLD.match(text))


def strip_doi(text):
    return DOI_PREFIX.sub("", text.strip())


def classify(text):
    text = text.strip()
    doi = strip_doi(text)
    if DOI_PATTERN.match(doi):
        arxiv_doi = ARXIV_DOI.match(doi)
        if arxiv_doi and is_arxiv_id(arxiv_doi.group(1)):
            return Identifier("doi", text, doi, strip_version(arxiv_doi.group(1)))
        return Identifier("doi", text, doi)
    if is_arxiv_id(text):
        arxiv_id = strip_version(text)
        return Identifier("arxiv", text, "10.48550/arXiv." + arxiv_id, arxiv_id)
    return Identifier("title", text)


def quote_doi(doi):
    return urllib.parse.quote(doi, safe="/:()")


def file_stem(key):
    return key.replace("/", "_").replace(":", "_")


def is_pdf(body):
    return body.startswith(b"%PDF-")


def is_arxiv_html_url(url):
    parts = urllib.parse.urlsplit(url)
    return parts.hostname == "arxiv.org" and parts.path.startswith("/html/")


def normalise_record(record):
    arxiv_doi = ARXIV_DOI.match(record.doi)
    if arxiv_doi and not record.arxiv_id and is_arxiv_id(arxiv_doi.group(1)):
        record.arxiv_id = arxiv_doi.group(1)
    record.arxiv_id = strip_version(record.arxiv_id)
    return record


# Parsing the bodies the indexes answer.


def abstract_from_inverted_index(index):
    words = {}
    for word, positions in (index or {}).items():
        for position in positions:
            words[position] = word
    return " ".join(words[position] for position in sorted(words))


def parse_crossref_item(item):
    names = []
    for author in item.get("author") or []:
        name = collapse_spaces(" ".join(part for part in (author.get("given"), author.get("family")) if part))
        names.append(name or collapse_spaces(author.get("name")))
    issued = ((item.get("issued") or {}).get("date-parts") or [[None]])[0]
    titles = item.get("title") or []
    return normalise_record(
        Record(
            title=collapse_spaces(titles[0]) if titles else "",
            authors=[name for name in names if name],
            year=issued[0] if issued and isinstance(issued[0], int) else 0,
            venue=collapse_spaces((item.get("container-title") or [""])[0]),
            doi=item.get("DOI") or "",
            indexes=["Crossref"],
        )
    )


def parse_crossref_work(text):
    return parse_crossref_item(json.loads(text)["message"])


def parse_crossref_search(text):
    return [parse_crossref_item(item) for item in json.loads(text)["message"]["items"]]


def parse_openalex_work_object(work):
    source = (work.get("primary_location") or {}).get("source") or {}
    oa_url = (work.get("open_access") or {}).get("oa_url")
    return normalise_record(
        Record(
            title=collapse_spaces(work.get("title") or work.get("display_name")),
            authors=[collapse_spaces(a["author"]["display_name"]) for a in work.get("authorships") or []],
            year=work.get("publication_year") or 0,
            venue=collapse_spaces(source.get("display_name")),
            doi=strip_doi(work.get("doi") or ""),
            openalex_id=work["id"].rstrip("/").rsplit("/", 1)[-1],
            oa_urls=[oa_url] if oa_url else [],
            abstract=abstract_from_inverted_index(work.get("abstract_inverted_index")),
            indexes=["OpenAlex"],
        )
    )


def parse_openalex_work(text):
    return parse_openalex_work_object(json.loads(text))


def parse_openalex_search(text):
    return [parse_openalex_work_object(work) for work in json.loads(text)["results"]]


def referenced_ids(body):
    return [url.rsplit("/", 1)[-1] for url in body.get("referenced_works") or []]


def parse_openalex_work_links(text):
    """(OpenAlex ID, OpenAlex IDs of the referenced works) of a work."""
    body = json.loads(text)
    return body["id"].rstrip("/").rsplit("/", 1)[-1], referenced_ids(body)


def parse_openalex_referenced(text):
    return referenced_ids(json.loads(text))


def parse_openalex_citing(text):
    """(the works that cite a work, whether more than one page of them exist)."""
    body = json.loads(text)
    return [parse_openalex_work_object(work) for work in body["results"]], body["meta"]["count"] > REFERENCE_PAGE


def parse_s2_paper_object(paper):
    external = paper.get("externalIds") or {}
    oa_url = (paper.get("openAccessPdf") or {}).get("url")
    return normalise_record(
        Record(
            title=collapse_spaces(paper.get("title")),
            authors=[collapse_spaces(a.get("name")) for a in paper.get("authors") or [] if a.get("name")],
            year=paper.get("year") or 0,
            venue=collapse_spaces(paper.get("venue")),
            doi=external.get("DOI") or "",
            arxiv_id=external.get("ArXiv") or "",
            s2_id=paper["paperId"],
            oa_urls=[oa_url] if oa_url else [],
            abstract=collapse_spaces(paper.get("abstract")),
            indexes=["Semantic Scholar"],
        )
    )


def parse_s2_paper(text):
    return parse_s2_paper_object(json.loads(text))


def parse_s2_search(text):
    return [parse_s2_paper_object(paper) for paper in json.loads(text).get("data") or []]


def parse_s2_links(key):
    """The parser of a references (key "citedPaper") or citations (key "citingPaper") answer, with whether more pages exist."""

    def parse(text):
        body = json.loads(text)
        records = [parse_s2_paper_object(item[key]) for item in body.get("data") or [] if item.get(key)]
        return records, body.get("next") is not None

    return parse


def parse_arxiv_feed(text):
    records = []
    for entry in ET.fromstring(text).findall(ATOM + "entry"):
        identifier = entry.findtext(ATOM + "id") or ""
        if "/abs/" not in identifier:
            continue
        published = entry.findtext(ATOM + "published") or ""
        records.append(
            normalise_record(
                Record(
                    title=collapse_spaces(entry.findtext(ATOM + "title")),
                    authors=[collapse_spaces(a.findtext(ATOM + "name")) for a in entry.findall(ATOM + "author")],
                    year=int(published[:4]) if published[:4].isdigit() else 0,
                    doi=collapse_spaces(entry.findtext(ARXIV_ATOM + "doi")),
                    arxiv_id=identifier.split("/abs/", 1)[1],
                    abstract=collapse_spaces(entry.findtext(ATOM + "summary")),
                    indexes=["arXiv"],
                )
            )
        )
    return records


# Records: merging, matching and printing.


def filled_count(record):
    return sum(1 for name in ("title", "authors", "year", "venue", "doi", "arxiv_id", "openalex_id", "s2_id", "oa_urls", "abstract") if getattr(record, name))


def record_keys(record):
    keys = set()
    if record.doi:
        keys.add(("doi", record.doi.lower()))
    if record.arxiv_id:
        keys.add(("arxiv", strip_version(record.arxiv_id)))
    if record.s2_id:
        keys.add(("s2", record.s2_id))
    return keys


def combine_records(first, second):
    base, other = (first, second) if filled_count(first) >= filled_count(second) else (second, first)
    merged = replace(base, authors=list(base.authors), oa_urls=list(base.oa_urls), indexes=list(first.indexes))
    for name in ("title", "authors", "year", "venue", "doi", "arxiv_id", "openalex_id", "s2_id", "oa_urls", "abstract"):
        if not getattr(merged, name):
            setattr(merged, name, getattr(other, name))
    merged.indexes += [index for index in second.indexes if index not in merged.indexes]
    return merged


def merge_records(records):
    merged = []
    for record in records:
        combined = record
        position = len(merged)
        absorbed = True
        while absorbed:
            absorbed = False
            for number, existing in enumerate(merged):
                if record_keys(existing) & record_keys(combined):
                    merged.pop(number)
                    position = min(position, number)
                    combined = combine_records(existing, combined)
                    absorbed = True
                    break
        merged.insert(min(position, len(merged)), combined)
    return merged


def choose_candidate(records, query, year):
    scored = [(title_ratio(query, record.title), record) for record in records]
    matching = [pair for pair in scored if pair[0] >= MATCH_THRESHOLD]
    if year:
        in_year = [pair for pair in matching if pair[1].year == year]
        matching = in_year or matching
    return max(matching, key=lambda pair: pair[0]) if matching else None


def format_record(record):
    authors = ", ".join(record.authors[:3]) + (" et al." if len(record.authors) > 3 else "")
    parts = [record.title, authors, str(record.year) if record.year else "", record.venue]
    if record.doi:
        parts.append("doi " + record.doi)
    if record.arxiv_id:
        parts.append("arXiv " + record.arxiv_id)
    if record.openalex_id:
        parts.append("OpenAlex " + record.openalex_id)
    if record.s2_id:
        parts.append("Semantic Scholar " + record.s2_id)
    if record.oa_urls:
        parts.append("open access " + " ".join(record.oa_urls))
    return " | ".join(part for part in parts if part)


def title_lines(query, year, outcomes):
    lines = []
    for name, outcome in zip(INDEX_NAMES, outcomes):
        chosen = None if outcome.left_out else choose_candidate(outcome.records, query, year)
        if outcome.left_out:
            lines.append(f"{name}: left out, {outcome.left_out}")
        elif chosen is None:
            lines.append(f"{name}: not found")
        else:
            lines.append(f"{name}: ratio {chosen[0]:.2f}: {format_record(chosen[1])}")
    return lines


def identifier_lines(outcomes):
    reference = next((o.records[0] for o in outcomes if not o.left_out and o.records), None)
    lines = []
    for name, outcome in zip(INDEX_NAMES, outcomes):
        if outcome.left_out:
            lines.append(f"{name}: left out, {outcome.left_out}")
        elif not outcome.records:
            lines.append(f"{name}: not found")
        else:
            record = outcome.records[0]
            ratio = title_ratio(reference.title, record.title)
            flag = " DOI_MISMATCH," if ratio < MATCH_THRESHOLD else ""
            lines.append(f"{name}:{flag} ratio {ratio:.2f}: {format_record(record)}")
    return lines


def merged_lines(named):
    """The lines of search, refs and cited-by for named, a list of (index name, Outcome) of the indexes that were asked."""
    records = merge_records([record for _, outcome in named for record in outcome.records])
    lines = [f"[{', '.join(record.indexes)}] {format_record(record)}" for record in records]
    for name, outcome in named:
        if outcome.left_out:
            lines.append(f"{name}: left out, {outcome.left_out}")
        elif outcome.more:
            lines.append(f"{name}: first {REFERENCE_PAGE}, more exist")
        elif not outcome.records:
            lines.append(f"{name}: not found")
    return lines


# Reports and BibTeX.


def cited_keys(line):
    """The keys of the citations in one line of a report, in order."""
    keys = []
    for bracket in CITATION.findall(line):
        for part in bracket.split(";"):
            part = part.strip()
            if part.startswith("@"):
                key = part[1:].split(",")[0].strip()
                if key:
                    keys.append(key)
    return keys


def passage_line(line):
    """(key, locator, passage) for a passage line, "malformed" for a line that starts like one and is not, else None."""
    lead = PASSAGE_LEAD.match(line)
    if not lead:
        return "malformed" if PASSAGE_START.match(line) else None
    rest = line[lead.end():]
    first, last = rest.find('"'), rest.rfind('"')
    if first < 0 or last <= first:
        return "malformed"
    return lead.group(1), lead.group(2).strip(), rest[first + 1:last]


def read_report(report_text):
    """(passages, malformed lines, cited keys in order) of a report. A passage line gives the key of its leading citation only."""
    passages, malformed, keys = [], [], []
    for number, line in enumerate(report_text.splitlines(), 1):
        parsed = passage_line(line)
        if parsed == "malformed":
            malformed.append(number)
            continue
        if parsed:
            passages.append((number,) + parsed)
            found = [parsed[0]]
        else:
            found = cited_keys(line)
        keys += [key for key in found if key not in keys]
    return passages, malformed, keys


def normalise_passage_text(text):
    text = re.sub(r"-\r?\n", "", text)
    text = re.sub(r"(?<=[^\W\d_])-(?=[^\W\d_])", "", text)
    return re.sub(r"\s+", " ", text)


def passage_found(passage, text):
    needle = normalise_passage_text(passage)
    return bool(needle) and needle in normalise_passage_text(text)


def quote_check_lines(report_text, bib_keys, read_text):
    """The lines quote-check prints and whether any of them is a failure. read_text(name) gives the text of <name> or None."""
    passages, malformed, keys = read_report(report_text)
    lines, failed = [], False
    for number in malformed:
        lines.append(f"line {number}: malformed passage line")
        failed = True
    for number, key, locator, passage in passages:
        suffix = ".abstract.txt" if locator == "abstract" else ".txt"
        text = read_text(file_stem(key) + suffix)
        if text is None:
            lines.append(f"line {number}: {key}, {locator}: not found, no {file_stem(key) + suffix}")
            failed = True
        elif passage_found(passage, text):
            lines.append(f"line {number}: {key}, {locator}: found")
        else:
            lines.append(f"line {number}: {key}, {locator}: not found")
            failed = True
    with_passage = {key for _, key, _, _ in passages}
    for key in keys:
        problems = []
        if key not in bib_keys:
            problems.append("no entry")
        if key not in with_passage:
            problems.append("no passage")
        if all(read_text(file_stem(key) + suffix) is None for suffix in (".txt", ".abstract.txt")):
            problems.append("no text")
        for problem in problems:
            lines.append(f"{key}: {problem}")
            failed = True
    if not keys:
        lines.append("the report cites no key")
    return lines, failed


def read_bib_value(text, i):
    """(value, next index) of the BibTeX value that starts at text[i]: braced, quoted, or a bare token; values joined by # are joined."""
    parts = []
    while True:
        while i < len(text) and text[i].isspace():
            i += 1
        if i < len(text) and text[i] in '{"':
            close, depth, start = ("}" if text[i] == "{" else '"'), 0, i + 1
            j = i
            while j < len(text):
                if text[j] == "\\":
                    j += 2
                    continue
                if text[j] == "{":
                    depth += 1
                elif text[j] == "}":
                    depth -= 1
                    if close == "}" and depth == 0:
                        break
                elif text[j] == '"' and close == '"' and depth == 0 and j > i:
                    break
                j += 1
            parts.append(text[start:j])
            i = j + 1
        else:
            match = re.compile(r"[^\s,{}()]*").match(text, i)
            parts.append(match.group())
            i = match.end()
        while i < len(text) and text[i].isspace():
            i += 1
        if i < len(text) and text[i] == "#":
            i += 1
            continue
        return "".join(parts), i


def parse_bib(text):
    """The entries of a BibTeX file as {key: {field name in lower case: value}}; the first entry of a key is kept."""
    entries = {}
    start = re.compile(r"@(\w+)\s*([{(])")
    position = 0
    while True:
        at = text.find("@", position)
        if at < 0:
            return entries
        match = start.match(text, at)
        if not match:
            position = at + 1
            continue
        close = "}" if match.group(2) == "{" else ")"
        comma = text.find(",", match.end())
        if match.group(1).lower() in ("comment", "string", "preamble") or comma < 0:
            position = match.end()
            continue
        key = text[match.end():comma].strip()
        fields, i = {}, comma + 1
        while i < len(text):
            while i < len(text) and (text[i].isspace() or text[i] == ","):
                i += 1
            if i >= len(text) or text[i] == close:
                i += 1
                break
            name = re.compile(r"([A-Za-z][\w\-:.]*)\s*=").match(text, i)
            if not name:
                break
            value, i = read_bib_value(text, name.end())
            fields[name.group(1).lower()] = value
        entries.setdefault(key, fields)
        position = i


def bibtex_value(text):
    """A value for a braced BibTeX field: the braces are removed when they are not balanced, so the value cannot end its field early."""
    text = collapse_spaces(text)
    depth = 0
    for character in text:
        depth += (character == "{") - (character == "}")
        if depth < 0:
            break
    if depth != 0:
        text = text.replace("{", "").replace("}", "")
    return text


def arxiv_bibtex(record):
    name = "arxiv_" + re.sub(r"[^A-Za-z0-9]", "_", record.arxiv_id)
    fields = [
        ("title", bibtex_value(record.title)),
        ("author", " and ".join(bibtex_value(author) for author in record.authors)),
        ("year", str(record.year) if record.year else ""),
        ("eprint", record.arxiv_id),
        ("archivePrefix", "arXiv"),
    ]
    body = ",\n".join(f"  {label} = {{{value}}}" for label, value in fields if value)
    return f"@misc{{{name},\n{body}\n}}\n"


def html_to_text(page):
    """The text of an HTML page: tags removed, script and style text left out, a line break after each block element."""

    class Extractor(HTMLParser):
        def __init__(self):
            super().__init__(convert_charrefs=True)
            self.parts, self.skipped = [], 0

        def handle_starttag(self, tag, attrs):
            if tag in SKIPPED_TAGS:
                self.skipped += 1
            elif tag == "br":
                self.parts.append("\n")

        def handle_endtag(self, tag):
            if tag in SKIPPED_TAGS:
                self.skipped = max(0, self.skipped - 1)
            elif tag in BLOCK_TAGS:
                self.parts.append("\n")

        def handle_data(self, data):
            if not self.skipped:
                self.parts.append(data)

    extractor = Extractor()
    extractor.feed(page)
    extractor.close()
    lines = [line.strip() for line in "".join(extractor.parts).splitlines()]
    return "".join(line + "\n" for line in lines if line)


# HTTP.


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


def arxiv_turn(call):
    """Run call, one request to arXiv, so that it starts at least 3 seconds after the last arXiv request of any lookup.py process that uses the same temporary folder ended.

    The turn is an exclusive flock on a file named ARXIV_LOCK_NAME in the temporary folder. The file holds the time the last request ended.
    A file that cannot be opened, locked or read leaves the request to wait the full 3 seconds.
    """
    path = os.path.join(tempfile.gettempdir(), ARXIV_LOCK_NAME)
    descriptor, last = None, None
    try:
        descriptor = os.open(path, os.O_RDWR | os.O_CREAT, 0o600)
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        recorded = os.read(descriptor, 64).decode("ascii", "replace").strip()
        last = float(recorded) if recorded else None
    except (OSError, ValueError):
        last = time.time()
    try:
        while last is not None:
            wait = min(ARXIV_SPACING, ARXIV_SPACING - (time.time() - last))
            if wait <= 0:
                break
            time.sleep(wait)
        return call()
    finally:
        if descriptor is not None:
            try:
                os.lseek(descriptor, 0, os.SEEK_SET)
                os.ftruncate(descriptor, 0)
                os.write(descriptor, repr(time.time()).encode("ascii"))
            except OSError:
                pass
            os.close(descriptor)


class Client:
    """The requests of one run, with the optional credentials of the environment."""

    def __init__(self, environment):
        self.s2_key = environment.get("S2_API_KEY", "")
        self.openalex_key = environment.get("OPENALEX_API_KEY", "")
        self.crossref_email = environment.get("CROSSREF_POLITE_EMAIL", "")
        self.opener = urllib.request.build_opener(NoRedirect)

    def prepare(self, url, accept):
        """The URL and headers of one request: the credentials go only to the host they belong to."""
        host = urllib.parse.urlsplit(url).hostname or ""
        headers = {"User-Agent": USER_AGENT, "Accept": accept}
        if host == "api.semanticscholar.org" and self.s2_key:
            headers["x-api-key"] = self.s2_key
        if host == "api.openalex.org" and self.openalex_key:
            url += ("&" if "?" in url else "?") + urllib.parse.urlencode({"api_key": self.openalex_key})
        if host == "api.crossref.org" and self.crossref_email:
            headers["User-Agent"] = f"{USER_AGENT}; mailto:{self.crossref_email}"
            url += ("&" if "?" in url else "?") + urllib.parse.urlencode({"mailto": self.crossref_email})
        return url, headers, host

    def send(self, url, headers, read_body):
        try:
            try:
                response = self.opener.open(urllib.request.Request(url, headers=headers), timeout=TIMEOUT)
            except urllib.error.HTTPError as error:
                response = error
            body = response.read() if read_body else b""
            result = (response.getcode(), body, response.headers)
            response.close()
        except (urllib.error.URLError, OSError, http.client.HTTPException) as error:
            raise LeftOut(f"no answer ({type(error).__name__})") from None
        return result

    def once(self, url, accept, read_body):
        url, headers, host = self.prepare(url, accept)
        if host in ARXIV_HOSTS:
            return arxiv_turn(lambda: self.send(url, headers, read_body))
        return self.send(url, headers, read_body)

    def get(self, url, accept="*/*", read_body=True):
        """A Reply for a GET, redirects followed (at most 10) and a 429 retried 3 times after 2 seconds each; LeftOut when no answer comes."""
        for _ in range(MAX_REDIRECTS + 1):
            if urllib.parse.urlsplit(url).scheme not in ("http", "https"):
                raise LeftOut("not an http or https URL")
            for attempt in range(RETRIES + 1):
                status, body, headers = self.once(url, accept, read_body)
                if status != 429 or attempt == RETRIES:
                    break
                time.sleep(RETRY_WAIT)
            if status in (301, 302, 303, 307, 308) and headers.get("Location"):
                url = urllib.parse.urljoin(url, headers["Location"])
                continue
            return Reply(status, body, url, headers.get("Content-Type", ""))
        raise LeftOut("too many redirects")


def status_reason(reply):
    return "HTTP 429 after 3 retries" if reply.status == 429 else f"HTTP {reply.status}"


def get_parsed(client, url, parse):
    """What parse makes of a 200 answer from url; None for a 404. LeftOut for any other status and for a body that does not parse."""
    reply = client.get(url)
    if reply.status == 404:
        return None
    if reply.status != 200:
        raise LeftOut(status_reason(reply))
    try:
        return parse(reply.text())
    except PARSE_ERRORS:
        raise LeftOut(f"HTTP {reply.status}, the body does not parse") from None


def outcome_of(call):
    try:
        found = call()
    except LeftOut as reason:
        return Outcome(left_out=str(reason))
    if isinstance(found, tuple):
        return Outcome(found[0], more=found[1])
    if found is None:
        return Outcome()
    return Outcome(found if isinstance(found, list) else [found])


# The four indexes.


def s2_path(identifier):
    return "ARXIV:" + identifier.arxiv_id if identifier.arxiv_id else "DOI:" + quote_doi(identifier.doi)


def lookup_crossref(client, identifier):
    return outcome_of(lambda: get_parsed(client, f"https://api.crossref.org/works/{quote_doi(identifier.doi)}", parse_crossref_work))


def lookup_openalex(client, identifier, select=OPENALEX_FIELDS):
    url = f"https://api.openalex.org/works/doi:{quote_doi(identifier.doi)}?select={select}"
    return outcome_of(lambda: get_parsed(client, url, parse_openalex_work))


def lookup_s2(client, identifier, fields=S2_FIELDS):
    url = f"https://api.semanticscholar.org/graph/v1/paper/{s2_path(identifier)}?fields={fields}"
    return outcome_of(lambda: get_parsed(client, url, parse_s2_paper))


def lookup_arxiv(client, identifier):
    if not identifier.arxiv_id:
        return Outcome(left_out="the input has no arXiv ID")
    url = f"https://export.arxiv.org/api/query?id_list={urllib.parse.quote(identifier.arxiv_id, safe='/.')}"
    return outcome_of(lambda: get_parsed(client, url, parse_arxiv_feed))


def search_crossref(client, query, limit):
    params = urllib.parse.urlencode({"query.bibliographic": query, "rows": limit, "select": CROSSREF_FIELDS})
    return outcome_of(lambda: get_parsed(client, f"https://api.crossref.org/works?{params}", parse_crossref_search))


def openalex_query(query):
    """query without ? and *, which OpenAlex reads as wildcards and answers with HTTP 400 in its default search."""
    return collapse_spaces(query.replace("?", " ").replace("*", " "))


def search_openalex(client, query, limit):
    params = urllib.parse.urlencode({"search": openalex_query(query), "per_page": limit, "select": OPENALEX_FIELDS})
    return outcome_of(lambda: get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_search))


def search_s2(client, query, limit):
    params = urllib.parse.urlencode({"query": query, "limit": limit, "fields": S2_FIELDS})
    return outcome_of(lambda: get_parsed(client, f"https://api.semanticscholar.org/graph/v1/paper/search?{params}", parse_s2_search))


def arxiv_query(query):
    """query in arXiv's own search syntax: each word as all:<word>, a quoted phrase as all:"<phrase>", AND and OR kept, NOT written ANDNOT,
    parentheses kept, and two terms with no operator between them joined by AND. Other characters are dropped."""
    tokens = QUERY_TOKEN.findall(query)
    depth = 0
    for token in tokens:
        depth += (token == "(") - (token == ")")
        if depth < 0:
            break
    if depth != 0:
        tokens = [token for token in tokens if token not in ("(", ")")]
    position = 0

    def read_group():
        nonlocal position
        parts, pending = [], ""
        while position < len(tokens):
            token = tokens[position]
            position += 1
            if token in QUERY_OPERATORS:
                if parts:
                    pending = "ANDNOT" if token == "NOT" else token
                continue
            if token == ")":
                break
            if token == "(":
                inner = read_group()
                term = "(" + inner + ")" if inner else ""
            elif token.startswith('"'):
                phrase = collapse_spaces(token.strip('"'))
                term = 'all:"' + phrase + '"' if phrase else ""
            else:
                term = "all:" + token
            if not term:
                continue
            parts.append(((pending or "AND") + " " if parts else "") + term)
            pending = ""
        return " ".join(parts)

    return read_group()


def search_arxiv(client, query, limit, phrase):
    terms = 'ti:"' + query.replace('"', " ") + '"' if phrase else arxiv_query(query)
    params = urllib.parse.urlencode({"search_query": terms, "max_results": limit})
    return outcome_of(lambda: get_parsed(client, f"https://export.arxiv.org/api/query?{params}", parse_arxiv_feed))


def searches(client, query, limit, phrase):
    return [
        search_crossref(client, query, limit),
        search_openalex(client, query, limit),
        search_s2(client, query, limit),
        search_arxiv(client, query, limit, phrase),
    ]


def openalex_batch(client, work_ids):
    ids = "|".join(work_ids)
    params = urllib.parse.urlencode({"filter": "openalex:" + ids, "per_page": len(work_ids), "select": OPENALEX_FIELDS})
    return get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_search)


def linked_openalex(client, text, identifier, citing):
    """The works that cite the input (citing) or that it references, from OpenAlex."""
    if OPENALEX_ID.match(text):
        work_id, referenced = text, None
    else:
        url = f"https://api.openalex.org/works/doi:{quote_doi(identifier.doi)}?select=id,referenced_works"
        found = get_parsed(client, url, parse_openalex_work_links)
        if found is None:
            return []
        work_id, referenced = found
    if citing:
        params = urllib.parse.urlencode({"filter": "cites:" + work_id, "per_page": REFERENCE_PAGE, "select": OPENALEX_FIELDS})
        found = get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_citing)
        return [] if found is None else found
    if referenced is None:
        referenced = get_parsed(client, f"https://api.openalex.org/works/{work_id}?select=id,referenced_works", parse_openalex_referenced)
        if referenced is None:
            return []
    records = []
    for start in range(0, min(len(referenced), REFERENCE_PAGE), OPENALEX_BATCH):
        records += openalex_batch(client, referenced[start:min(start + OPENALEX_BATCH, REFERENCE_PAGE)]) or []
    return records, len(referenced) > REFERENCE_PAGE


def linked_s2(client, text, identifier, citing):
    path = text if S2_ID.match(text) else s2_path(identifier)
    kind, key = ("citations", "citingPaper") if citing else ("references", "citedPaper")
    params = urllib.parse.urlencode({"fields": S2_FIELDS, "limit": REFERENCE_PAGE})
    url = f"https://api.semanticscholar.org/graph/v1/paper/{path}/{kind}?{params}"
    return get_parsed(client, url, parse_s2_links(key)) or []


# The commands.


def parse_options(arguments, names, command):
    """(positional arguments, {option: value}) for the options in names; -- ends the options."""
    positional, options, i = [], {}, 0
    while i < len(arguments):
        argument = arguments[i]
        if argument == "--":
            positional += arguments[i + 1:]
            break
        if argument.startswith("--") and argument in names:
            if i + 1 >= len(arguments):
                raise UsageError(f"{command} needs a value after {argument}")
            options[argument] = arguments[i + 1]
            i += 2
            continue
        if argument.startswith("--"):
            raise UsageError(f"unknown option {argument}")
        positional.append(argument)
        i += 1
    return positional, options


def expect_arguments(positional, count, command, shape):
    if len(positional) != count:
        raise UsageError(f"{command} takes {shape}")


def require_identifier(text, with_ids=False):
    identifier = classify(text)
    if identifier.kind != "title":
        return identifier
    if with_ids and (S2_ID.match(text) or OPENALEX_ID.match(text)):
        return Identifier("id", text)
    raise UsageError(
        f"{text} is not a DOI, an arXiv ID, a Semantic Scholar ID or an OpenAlex ID" if with_ids else f"{text} is not a DOI or an arXiv ID"
    )


def read_text_file(path):
    try:
        with open(path, encoding="utf-8") as handle:
            return handle.read()
    except UnicodeDecodeError:
        raise UsageError(f"{path}: not valid UTF-8") from None
    except OSError as error:
        raise UsageError(f"{path}: {error.strerror or error}") from None


def read_report_and_bib(report):
    report_text = read_text_file(report)
    bib = parse_bib(read_text_file(os.path.join(os.path.dirname(os.path.abspath(report)), "references.bib")))
    return report_text, bib


def run_resolve(client, arguments, out):
    positional, options = parse_options(arguments, ("--year",), "resolve")
    expect_arguments(positional, 1, "resolve", "<DOI | arXiv ID | title> [--year <year>]")
    year = options.get("--year", "")
    if year and not re.fullmatch(r"\d{4}", year):
        raise UsageError("--year needs a four-digit year")
    identifier = classify(positional[0])
    if identifier.kind == "title":
        outcomes = searches(client, identifier.text, TITLE_CANDIDATES, True)
        lines = title_lines(identifier.text, int(year) if year else 0, outcomes)
    else:
        outcomes = [lookup_crossref(client, identifier), lookup_openalex(client, identifier), lookup_s2(client, identifier), lookup_arxiv(client, identifier)]
        lines = identifier_lines(outcomes)
    out.extend(lines)
    return 0


def run_search(client, arguments, out):
    positional, options = parse_options(arguments, ("--limit",), "search")
    expect_arguments(positional, 1, "search", "<query> [--limit <n>]")
    limit = options.get("--limit", str(DEFAULT_LIMIT))
    if not (limit.isdigit() and 1 <= int(limit) <= MAX_LIMIT):
        raise UsageError(f"--limit needs a whole number from 1 to {MAX_LIMIT}")
    out.extend(merged_lines(list(zip(INDEX_NAMES, searches(client, positional[0], int(limit), False)))))
    return 0


def run_links(client, arguments, out, command):
    positional, _ = parse_options(arguments, (), command)
    expect_arguments(positional, 1, command, "<DOI | arXiv ID | Semantic Scholar ID | OpenAlex ID>")
    text = positional[0].strip()
    identifier = require_identifier(text, with_ids=True)
    citing = command == "cited-by"
    s2_text = text if S2_ID.match(text) else ""
    openalex_text = text if OPENALEX_ID.match(text) else ""
    if openalex_text:
        s2_outcome = Outcome(left_out="the input is an OpenAlex ID")
    else:
        s2_outcome = outcome_of(lambda: linked_s2(client, s2_text, identifier, citing))
    if s2_text:
        openalex_outcome = Outcome(left_out="the input is a Semantic Scholar ID")
    else:
        openalex_outcome = outcome_of(lambda: linked_openalex(client, openalex_text, identifier, citing))
    out.extend(merged_lines([("OpenAlex", openalex_outcome), ("Semantic Scholar", s2_outcome)]))
    return 0


def run_bibtex(client, arguments, out):
    positional, _ = parse_options(arguments, (), "bibtex")
    expect_arguments(positional, 1, "bibtex", "<DOI | arXiv ID>")
    identifier = require_identifier(positional[0])
    if identifier.arxiv_id:
        outcome = lookup_arxiv(client, identifier)
        if outcome.left_out or not outcome.records:
            out.append("arXiv: " + (f"left out, {outcome.left_out}" if outcome.left_out else "not found"))
            return 1
        out.append(arxiv_bibtex(outcome.records[0]).rstrip("\n"))
        return 0
    try:
        reply = client.get(f"https://doi.org/{quote_doi(identifier.doi)}", accept="application/x-bibtex")
    except LeftOut as reason:
        out.append(f"doi.org: left out, {reason}")
        return 1
    body = reply.text()
    if reply.status == 200 and body.lstrip().startswith("@"):
        out.append(body.rstrip("\n"))
        return 0
    out.append(f"doi.org: {status_reason(reply)}, not a BibTeX entry")
    return 1


def entry_url(fields):
    if fields.get("doi"):
        return "https://doi.org/" + quote_doi(strip_doi(fields["doi"]))
    if fields.get("eprint"):
        return "https://arxiv.org/abs/" + urllib.parse.quote(fields["eprint"], safe="/.")
    return fields.get("url", "")


def run_check_urls(client, arguments, out):
    positional, _ = parse_options(arguments, (), "check-urls")
    expect_arguments(positional, 1, "check-urls", "<report>")
    report_text, bib = read_report_and_bib(positional[0])
    keys = read_report(report_text)[2]
    failed = False
    for key in keys:
        if key not in bib:
            out.append(f"{key}: no entry in references.bib")
            failed = True
            continue
        url = entry_url(bib[key])
        if not url:
            out.append(f"{key}: no identifier")
            failed = True
            continue
        try:
            status = client.get(url, read_body=False).status
        except LeftOut as reason:
            out.append(f"{key}: failed, {reason} {url}")
            failed = True
            continue
        out.append(f"{key}: {status} {url}")
        failed = failed or not 200 <= status < 300
    if not keys:
        out.append("the report cites no key")
    return 1 if failed else 0


def run_quote_check(client, arguments, out):
    positional, _ = parse_options(arguments, (), "quote-check")
    expect_arguments(positional, 2, "quote-check", "<report> <folder>")
    folder = positional[1]
    if not os.path.isdir(folder):
        raise UsageError(f"{folder}: not a folder")
    report_text, bib = read_report_and_bib(positional[0])

    def read_text(name):
        path = os.path.join(folder, name)
        return read_text_file(path) if os.path.exists(path) else None

    lines, failed = quote_check_lines(report_text, set(bib), read_text)
    out.extend(lines)
    return 1 if failed else 0


class FetchRun:
    """One fetch: the files it writes inside the folder, and the lines it prints."""

    def __init__(self, client, folder, stem, out):
        self.client, self.base, self.out = client, os.path.join(os.path.abspath(folder), stem), out

    def write(self, suffix, data):
        path = self.base + suffix
        try:
            with open(path, "wb") as handle:
                handle.write(data)
        except OSError as error:
            raise UsageError(f"{path}: {error.strerror or error}") from None
        return path

    def pdf_text(self, pdf_path):
        """The text pdftotext makes of the PDF, written to <stem>.txt; the reason when there is none."""
        text_path = self.base + ".txt"
        try:
            done = subprocess.run(["pdftotext", pdf_path, text_path], capture_output=True, timeout=120)
        except FileNotFoundError:
            return "pdftotext not found"
        except subprocess.TimeoutExpired:
            return "pdftotext timed out"
        if done.returncode != 0:
            return f"pdftotext exited {done.returncode}"
        with open(text_path, encoding="utf-8", errors="replace") as handle:
            if not handle.read().strip():
                return "the PDF has no text"
        return ""

    def attempt(self, url, kind):
        """Try one URL; True when it gave a full text, which is then written."""
        try:
            reply = self.client.get(url)
        except LeftOut as reason:
            self.out.append(f"tried {url}: {reason}")
            return False
        if not 200 <= reply.status < 300:
            self.out.append(f"tried {url}: {status_reason(reply)}")
            return False
        if kind == "html":
            if not is_arxiv_html_url(reply.url):
                self.out.append(f"tried {url}: HTTP {reply.status}, not a page of arxiv.org/html")
                return False
            self.write(".html", reply.body)
            self.write(".txt", html_to_text(reply.text()).encode("utf-8"))
            self.out.append(f"tried {url}: HTTP {reply.status}, full text")
            return True
        if not is_pdf(reply.body):
            self.out.append(f"tried {url}: HTTP {reply.status}, not a PDF")
            return False
        pdf_path = self.write(".pdf", reply.body)
        reason = self.pdf_text(pdf_path)
        if reason:
            for path in (pdf_path, self.base + ".txt"):
                if os.path.exists(path):
                    os.remove(path)
            self.out.append(f"tried {url}: HTTP {reply.status}, {reason}")
            return False
        self.out.append(f"tried {url}: HTTP {reply.status}, full text")
        return True

    def note(self, name, outcome, what):
        if outcome.left_out:
            self.out.append(f"lookup {name}: left out, {outcome.left_out}")
        elif not outcome.records:
            self.out.append(f"lookup {name}: not found")
        elif not what:
            self.out.append(f"lookup {name}: no open-access URL")
        else:
            self.out.append(f"lookup {name}: found")


def run_fetch(client, arguments, out):
    positional, _ = parse_options(arguments, (), "fetch")
    expect_arguments(positional, 3, "fetch", "<DOI | arXiv ID> <folder> <key>")
    identifier = require_identifier(positional[0])
    folder, key = positional[1], positional[2]
    if not key.strip():
        raise UsageError("the key is empty")
    if not os.path.isdir(folder):
        raise UsageError(f"{folder}: not a folder")
    run = FetchRun(client, folder, file_stem(key), out)
    if identifier.arxiv_id:
        quoted = urllib.parse.quote(identifier.arxiv_id, safe="/.")
        if run.attempt(f"https://arxiv.org/html/{quoted}", "html") or run.attempt(f"https://arxiv.org/pdf/{quoted}", "pdf"):
            return 0
    openalex = lookup_openalex(client, identifier, OPENALEX_FIELDS + ",abstract_inverted_index")
    s2 = lookup_s2(client, identifier, S2_FIELDS + ",abstract")
    for name, outcome in (("OpenAlex", openalex), ("Semantic Scholar", s2)):
        urls = [url for record in outcome.records for url in record.oa_urls]
        run.note(name, outcome, urls)
        if any(run.attempt(url, "pdf") for url in urls):
            return 0
    abstracts = [lookup_arxiv(client, identifier)] if identifier.arxiv_id else []
    abstracts += [s2, openalex]
    abstract = next((record.abstract for outcome in abstracts for record in outcome.records if record.abstract), "")
    if abstract:
        path = run.write(".abstract.txt", (abstract + "\n").encode("utf-8"))
        out.append(f"no full text; the abstract is in {os.path.basename(path)}")
    else:
        out.append("no full text and no abstract")
    return 1


HANDLERS = {
    "resolve": run_resolve,
    "search": run_search,
    "bibtex": run_bibtex,
    "check-urls": run_check_urls,
    "fetch": run_fetch,
    "quote-check": run_quote_check,
}


def run_command(client, command, arguments, out):
    if command in ("refs", "cited-by"):
        return run_links(client, arguments, out, command)
    return HANDLERS[command](client, arguments, out)


def main(argv):
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    if not argv or argv[0] not in COMMANDS:
        print("usage: lookup.py <command> ...", file=sys.stderr)
        print("commands: " + ", ".join(COMMANDS), file=sys.stderr)
        return 2
    out = []
    try:
        status = run_command(Client(os.environ), argv[0], argv[1:], out)
    except UsageError as error:
        for line in out:
            print(line)
        print(f"error: {error}", file=sys.stderr)
        return 2
    for line in out:
        print(line)
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
