#!/bin/sh
# Offline proof of the parts of lookup.py that compute facts without the network: title matching, the choice among candidates, the DOI mismatch flag, record merging, passage lines, passage normalisation, abstract reassembly, the arXiv query syntax, the OpenAlex query text, the arXiv spacing across processes, the arXiv turn of every request to an arXiv host, the refusal of a URL other than http and https, an index whose body does not parse, the not found lines, the file name made from a key, the DOI in a URL, the PDF and arXiv HTML tests, the credentials each host gets, the URL check-urls requests, the BibTeX of an arXiv record, the BibTeX body test, the text of an HTML page, the keys a .tex cites with the commands of natbib and biblatex and the files it inputs, the output of cite-keys, the title check of check-urls against the record a doi resolves to, the error line for an input file that does not exist, the .bib check-urls names and the .bib quote-check reads, both the one named on the command line, the refusal of the one-argument form of check-urls and of the two-argument form of quote-check, the retraction and expression-of-concern notice lines of resolve, and resolve --entry: the entry read from a .bib (a doi or DOI field, a space before the @, the first of two entries with one key), the input it resolves by (its doi, else its arXiv ID, else its title with its year), the verdict line that confirms the entry by the first record whose title and year agree and prints NOT_CONFIRMED for a year or a title that differs, a record with no year and an entry no index holds, its exit status, the one-line error and exit status 2 for a call or an entry it cannot read, and resolve without --entry printing what it printed. It also proves the pacing of each index across processes (the gap of each host with and without its credential, a redirect that takes the turn of the host it goes to, doi.org that takes none, a lock file that holds inf or nan), a 429 waited out by the Retry-After it names in each form it can take, the 429 that names more than 60 seconds left out at once with its reason and the skip file of its host (named by host and credential, mode 600, capped at 86400 seconds, ignored when it holds no time, read by a request that no cached reply answers, and never written for a host that is not an API host), the reasons bibtex prints for a 429, the host a reason names when the 429 is met on a redirect hop, and the reply cache of resolve, search, refs and cited-by (a reply sent once for the same URL in one process and in another, the replies that are not stored, the 30 days, the pruning, no credential in any file, a cache folder that cannot be made or written, an entry that cannot be used, the cache folder under XDG_CACHE_HOME or under HOME, the modes of its files). Every case runs on scratch temporary, cache and home folders set before lookup is imported, with time.sleep and time.time stubbed together as one clock where a wait is checked. Response bodies are recorded below in the shapes the indexes answer. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/lookup.py" ]; then
    echo "FAIL: $here/lookup.py does not exist"
    exit 1
fi

output=$(python3 -B -I - "$here" 2>&1 <<'PYTHON'
import atexit
import contextlib
import email.utils
import fractions
import io
import itertools
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
import urllib.parse

# The temporary folder, the cache folder and the home folder are scratch folders under the temporary folder, set before lookup is imported and removed at exit,
# so that no case reads or writes the real ordo-lookup-* files or the real cache.
SCRATCH = tempfile.mkdtemp()
atexit.register(shutil.rmtree, SCRATCH, True)
os.makedirs(os.path.join(SCRATCH, "tmp"))
os.makedirs(os.path.join(SCRATCH, "home"))
os.environ["TMPDIR"] = os.path.join(SCRATCH, "tmp")
os.environ["XDG_CACHE_HOME"] = os.path.join(SCRATCH, "cache")
os.environ["HOME"] = os.path.join(SCRATCH, "home")
tempfile.tempdir = None

sys.path.insert(0, sys.argv[1])
import lookup

failures = []


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


CROSSREF_BODY = """{"status":"ok","message":{"DOI":"10.1103/PhysRevE.69.066138","title":["Estimating mutual information"],
"author":[{"given":"Alexander","family":"Kraskov"},{"given":"Harald","family":"St\\u00f6gbauer"},{"given":"Peter","family":"Grassberger"}],
"issued":{"date-parts":[[2004,6,23]]},"container-title":["Physical Review E"]}}"""

OPENALEX_BODY = """{"id":"https://openalex.org/W2004163325","title":"Estimating mutual information","doi":"https://doi.org/10.1103/physreve.69.066138",
"publication_year":2004,"authorships":[{"author":{"display_name":"Alexander Kraskov"}}],
"primary_location":{"source":{"display_name":"Physical Review E"}},"open_access":{"oa_url":null},
"abstract_inverted_index":{"mutual":[0],"information":[1,4],"is":[2],"shared":[3]}}"""

OPENALEX_OTHER_TITLE_BODY = OPENALEX_BODY.replace("Estimating mutual information", "A survey of protein folding kinetics")

S2_BODY = """{"paperId":"0123456789abcdef0123456789abcdef01234567","title":"Estimating mutual information","year":2004,
"venue":"Physical Review E","authors":[{"authorId":"1","name":"A. Kraskov"}],
"externalIds":{"DOI":"10.1103/PhysRevE.69.066138","ArXiv":"cond-mat/0305641v1"},"openAccessPdf":{"url":"https://example.org/paper.pdf"}}"""

ARXIV_FEED = """<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xmlns:arxiv="http://arxiv.org/schemas/atom">
<entry><id>http://arxiv.org/abs/2511.18945v2</id><published>2025-11-24T10:00:00Z</published>
<title>A study of the
  estimation of mutual information</title>
<summary>  We study the
  estimation of mutual information.  </summary>
<author><name>A. Author</name></author><author><name>B.  Author</name></author></entry></feed>"""

# Parsing of recorded bodies.
crossref = lookup.parse_crossref_work(CROSSREF_BODY)
check("crossref title", crossref.title == "Estimating mutual information", repr(crossref.title))
check("crossref year", crossref.year == 2004, repr(crossref.year))
check("crossref authors", crossref.authors[1] == "Harald St\u00f6gbauer", repr(crossref.authors))
openalex = lookup.parse_openalex_work(OPENALEX_BODY)
check("openalex id", openalex.openalex_id == "W2004163325", repr(openalex.openalex_id))
check("openalex doi", openalex.doi == "10.1103/physreve.69.066138", repr(openalex.doi))
check("openalex no oa url", openalex.oa_urls == [], repr(openalex.oa_urls))
s2 = lookup.parse_s2_paper(S2_BODY)
check("s2 arxiv id has no version", s2.arxiv_id == "cond-mat/0305641", repr(s2.arxiv_id))
check("s2 oa url", s2.oa_urls == ["https://example.org/paper.pdf"], repr(s2.oa_urls))
arxiv = lookup.parse_arxiv_feed(ARXIV_FEED)[0]
check("arxiv title on one line", arxiv.title == "A study of the estimation of mutual information", repr(arxiv.title))
check("arxiv id has no version", arxiv.arxiv_id == "2511.18945", repr(arxiv.arxiv_id))
check("arxiv authors", arxiv.authors == ["A. Author", "B. Author"], repr(arxiv.authors))
check("arxiv abstract on one line", arxiv.abstract == "We study the estimation of mutual information.", repr(arxiv.abstract))

# T1: titles.
check("T1 same title", lookup.title_ratio("Neural Estimation of Mutual Information", "Neural estimation of mutual information.") == 1.0)
short = lookup.title_ratio("Mutual information", "Neural estimation of mutual information")
check("T1 short title", abs(short - 0.63) < 0.005 and short < lookup.MATCH_THRESHOLD, repr(short))

# T2: of two candidates at 0.70 or more, the one with the year given is taken, although its ratio is lower.
query = "Neural estimation of mutual information"
in_year = lookup.Record(title="Neural estimation of mutual information bounds", year=2018)
better = lookup.Record(title="Neural estimation of mutual information", year=2019)
low_in_year = lookup.title_ratio(query, in_year.title)
check("T2 setup", lookup.MATCH_THRESHOLD <= low_in_year < lookup.title_ratio(query, better.title), repr(low_in_year))
picked = lookup.choose_candidate([better, in_year], query, 2018)
check("T2 year given", picked is not None and picked[1] is in_year)
picked = lookup.choose_candidate([in_year, better], query, 0)
check("T2 no year", picked is not None and picked[1] is better)
picked = lookup.choose_candidate([lookup.Record(title="Protein folding", year=2018)], query, 2018)
check("T2 below the threshold", picked is None)

# T3: DOI_MISMATCH.
def mismatch_lines(other_body):
    outcomes = [
        lookup.Outcome([crossref]),
        lookup.Outcome([lookup.parse_openalex_work(other_body)]),
        lookup.Outcome(left_out="HTTP 429 after 3 retries"),
        lookup.Outcome(),
    ]
    return lookup.identifier_lines(outcomes)

lines = mismatch_lines(OPENALEX_OTHER_TITLE_BODY)
check("T3 below 0.70 is flagged", "DOI_MISMATCH" in lines[1], lines[1])
check("T3 the reference is not flagged", "DOI_MISMATCH" not in lines[0], lines[0])
lines = mismatch_lines(OPENALEX_BODY)
check("T3 a match is not flagged", "DOI_MISMATCH" not in lines[1], lines[1])
check("T3 an index left out names its reason", lines[2] == "Semantic Scholar: left out, HTTP 429 after 3 retries", lines[2])
check("T3 an index with no record is not found", lines[3] == "arXiv: not found", lines[3])

# T4: merging.
def merged(first, second):
    return lookup.merge_records([first, second])

check("T4 DOI case", len(merged(lookup.Record(title="A", doi="10.1000/ABC"), lookup.Record(title="B", doi="10.1000/abc"))) == 1)
check("T4 arXiv version", len(merged(lookup.Record(title="A", arxiv_id="2106.15928v1"), lookup.Record(title="B", arxiv_id="2106.15928"))) == 1)
check("T4 old-style arXiv version", len(merged(lookup.Record(title="A", arxiv_id="hep-th/9901001v2"), lookup.Record(title="B", arxiv_id="hep-th/9901001"))) == 1)
check("T4 Semantic Scholar ID", len(merged(lookup.Record(title="A", s2_id="abc"), lookup.Record(title="B", s2_id="abc"))) == 1)
check("T4 no shared identifier", len(merged(lookup.Record(title="Neural estimation of mutual information", doi="10.1/a"), lookup.Record(title="Neural estimation of mutual information", doi="10.1/b"))) == 2)
fuller = lookup.Record(title="Fuller", authors=["X"], year=2020, venue="V", doi="10.1000/x")
sparse = lookup.Record(title="Sparse", doi="10.1000/X", arxiv_id="2001.00001", oa_urls=["https://example.org/a.pdf"])
result = merged(sparse, fuller)
check("T4 one record", len(result) == 1)
check("T4 keeps the fuller record's fields", result[0].title == "Fuller" and result[0].year == 2020 and result[0].venue == "V" and result[0].authors == ["X"], repr(result[0]))
check("T4 the other fills the empty fields", result[0].arxiv_id == "2001.00001" and result[0].oa_urls == ["https://example.org/a.pdf"], repr(result[0]))
from_bodies = lookup.merge_records([crossref, openalex, s2, arxiv])
check("T4 recorded bodies", len(from_bodies) == 2, repr([r.title for r in from_bodies]))

# T5: finding a passage.
text = "mutual infor-\nmation   estimators"
check("T5 hyphen at a line end and spaces", lookup.passage_found("mutual information estimators", text))
check("T5 hyphen between letters, broken line", lookup.passage_found("self-supervised estimators", "self-\nsupervised estimators"))
check("T5 hyphen between letters, one line", lookup.passage_found("self-supervised estimators", "self-supervised estimators"))
check("T5 one word changed", not lookup.passage_found("mutual information estimation", text))
check("T5 an empty passage is not found", not lookup.passage_found("", text))

# T6: passage lines and the keys a citation report cites.
line = '> [@a, p. 3]: "the "plug-in" estimator"'
parsed = lookup.passage_line(line)
check("T6 passage with quotation marks", parsed == ("a", "p. 3", 'the "plug-in" estimator'), repr(parsed))
check("T6 not a passage line", lookup.passage_line("Plain text.") is None)
check("T6 malformed passage line", lookup.passage_line("> [@a, p. 3] no quotes") == "malformed")
record = 'Claim [@a; @b, p. 3].\n\n> [@a, p. 3]: "the plug-in estimator"\n'
lines, failed = lookup.quote_check_lines(record, {"a", "b"}, lambda name: "the plug-in estimator" if name.startswith("a.") else None)
check("T6 key b has no passage", "b: no passage" in lines, repr(lines))
check("T6 key a is found", "line 3: a, p. 3: found" in lines, repr(lines))
check("T6 key b has no text", "b: no text" in lines, repr(lines))
check("T6 a failure is reported", failed)
check("T6 a key with no entry", "c: no entry" in lookup.quote_check_lines("Claim [@c, p. 1].\n", {"a"}, lambda name: None)[0])

# T7: an abstract put back in word order.
index = {"mutual": [0], "information": [1, 4], "is": [2], "shared": [3]}
check("T7 abstract", lookup.abstract_from_inverted_index(index) == "mutual information is shared information", lookup.abstract_from_inverted_index(index))
check("T7 no abstract", lookup.abstract_from_inverted_index(None) == "")

# The arXiv query syntax.
check("arXiv Boolean string", lookup.arxiv_query('"mutual information" AND (neural OR amortized) NOT kernel') == 'all:"mutual information" AND (all:neural OR all:amortized) ANDNOT all:kernel', lookup.arxiv_query('"mutual information" AND (neural OR amortized) NOT kernel'))
check("arXiv words without an operator", lookup.arxiv_query("mutual information neural") == "all:mutual AND all:information AND all:neural")
check("arXiv NOT after AND", lookup.arxiv_query("a AND NOT b") == "all:a ANDNOT all:b", lookup.arxiv_query("a AND NOT b"))
check("arXiv operators with no term are dropped", lookup.arxiv_query("AND a OR") == "all:a", lookup.arxiv_query("AND a OR"))
check("arXiv parentheses that differ in number are dropped", lookup.arxiv_query("(a b") == "all:a AND all:b", lookup.arxiv_query("(a b"))
check("arXiv phrase keeps its punctuation", lookup.arxiv_query('"x ( y" z') == 'all:"x ( y" AND all:z', lookup.arxiv_query('"x ( y" z'))
check("arXiv parentheses out of order are dropped", lookup.arxiv_query(")a(") == "all:a", lookup.arxiv_query(")a("))
check("arXiv empty parentheses are dropped", lookup.arxiv_query("a AND () b") == "all:a AND all:b", lookup.arxiv_query("a AND () b"))

# The OpenAlex query text.
check("OpenAlex wildcards are removed", lookup.openalex_query("How accurate are neural estimators?") == "How accurate are neural estimators" and lookup.openalex_query("neural* nets") == "neural nets")

# The arXiv spacing across processes: two processes make one request each, a third finds an unreadable time.
CHILD = """
import sys, time
sys.path.insert(0, sys.argv[1])
import lookup
t0 = time.time()
def call():
    start = time.time()
    time.sleep(0.2)
    return start, time.time()
start, end = lookup.arxiv_turn(call)
print(t0, start, end)
"""


def child_env(temporary_folder):
    """The environment of every child process: its own temporary folder and the scratch cache and home folders."""
    return {"TMPDIR": temporary_folder, "XDG_CACHE_HOME": os.environ["XDG_CACHE_HOME"], "HOME": os.environ["HOME"]}


def spawn(folder):
    return subprocess.Popen([sys.executable, "-B", "-I", "-c", CHILD, sys.argv[1]], env=child_env(folder), stdout=subprocess.PIPE, text=True)


shared, unreadable = tempfile.mkdtemp(), tempfile.mkdtemp()
with open(os.path.join(unreadable, lookup.ARXIV_LOCK_NAME), "w") as handle:
    handle.write("not a time")
children = [spawn(shared), spawn(shared), spawn(unreadable)]
times = [tuple(float(number) for number in child.communicate()[0].split()) for child in children]
shutil.rmtree(shared)
shutil.rmtree(unreadable)
first, second = sorted(times[:2], key=lambda row: row[1])
check("pacing: the second process starts 3 seconds after the first ended", second[1] >= first[2] + lookup.ARXIV_SPACING, repr(times))
check("pacing: a first request with no earlier request does not wait", first[1] - first[0] < lookup.ARXIV_SPACING, repr(times))
check("pacing: an unreadable time waits the full spacing", times[2][1] - times[2][0] >= lookup.ARXIV_SPACING, repr(times))


# Every request to an arXiv host, a redirect to one included, takes its turn through arxiv_turn, and only http and https URLs are requested.
turns, sent = [], []
real_turn = lookup.arxiv_turn


def recording_turn(call):
    turns.append(True)
    return call()


def stub_send(self, url, headers, read_body):
    sent.append(url)
    if "redirect.example" in url:
        return 302, b"", {"Location": url.split("to=", 1)[1]}
    return 200, b"{}", {"Content-Type": "application/json"}


real_send = lookup.Client.send
lookup.arxiv_turn, lookup.Client.send = recording_turn, stub_send
client = lookup.Client({})
client.get("https://export.arxiv.org/api/query?id_list=2511.18945")
check("arXiv turn: an arXiv host takes a turn", len(turns) == 1, repr(sent))
client.get("https://api.crossref.org/works/10.1103/PhysRevE.69.066138")
check("arXiv turn: another host takes none", len(turns) == 1, repr(sent))
client.get("https://redirect.example/?to=https://arxiv.org/pdf/2511.18945")
check("arXiv turn: a redirect to arXiv takes a turn", len(turns) == 2 and sent[-1] == "https://arxiv.org/pdf/2511.18945", repr(sent))
for url in ("file:///etc/hosts", "https://redirect.example/?to=file:///etc/hosts"):
    before = list(sent)
    try:
        client.get(url)
        reason = None
    except lookup.LeftOut as error:
        reason = str(error)
    check("scheme: " + url, reason == "not an http or https URL" and not any(item.startswith("file:") for item in sent[len(before):]), repr((reason, sent)))
lookup.arxiv_turn, lookup.Client.send = real_turn, real_send


# A body that does not parse leaves one index out and keeps the other's records.
class StubClient:
    cache = None

    def __init__(self, replies):
        self.replies = replies

    def get(self, url, accept="*/*", read_body=True):
        for part, reply in self.replies:
            if part in url:
                return reply
        raise lookup.LeftOut("no stub for " + url)


def stub_reply(status, body, content_type="application/json"):
    return lookup.Reply(status, body.encode("utf-8"), "https://example.org/", content_type)


S2_CITATIONS = '{"data":[{"citingPaper":{"paperId":"abc","title":"A citing paper","year":2020}}],"next":null}'
HTML_BODY = "<html><body>Maintenance</body></html>"
unparsed = "OpenAlex: left out, HTTP 200, the body does not parse"
for command, kind in (("cited-by", "citingPaper"), ("refs", "citedPaper")):
    lines = []
    status = lookup.run_links(StubClient([("openalex.org", stub_reply(200, HTML_BODY, "text/html")), ("semanticscholar.org", stub_reply(200, S2_CITATIONS.replace("citingPaper", kind)))]), ["10.1103/PhysRevE.69.066138"], lines, command)
    check("body that does not parse, " + command + ": exit status", status == 0, repr(lines))
    check("body that does not parse, " + command + ": OpenAlex left out", unparsed in lines, repr(lines))
    check("body that does not parse, " + command + ": Semantic Scholar records stay", any(line.startswith("[Semantic Scholar] A citing paper") for line in lines), repr(lines))
lines = []
lookup.run_links(StubClient([("openalex.org", stub_reply(200, '{"results":[{"title":"No id"}],"meta":{"count":1}}'))]), ["W123"], lines, "cited-by")
check("body without a key the script reads", unparsed in lines, repr(lines))
lines = []
lookup.run_links(StubClient([("openalex.org", stub_reply(200, '{"id":"https://openalex.org/W1","referenced_works":[1,2]}'))]), ["10.1103/PhysRevE.69.066138"], lines, "refs")
check("a referenced work that is no URL", unparsed in lines, repr(lines))

# Not found lines for the indexes that answered with no record.
asked = [("Crossref", lookup.Outcome([crossref])), ("OpenAlex", lookup.Outcome()), ("Semantic Scholar", lookup.Outcome(left_out="HTTP 429 after 3 retries")), ("arXiv", lookup.Outcome())]
lines = lookup.merged_lines(asked)
check("not found: an index with no record", "OpenAlex: not found" in lines and "arXiv: not found" in lines, repr(lines))
check("not found: an index with records has no line", "Crossref: not found" not in lines and not any(line.startswith("Crossref:") for line in lines), repr(lines))
check("not found: an index left out names its reason", "Semantic Scholar: left out, HTTP 429 after 3 retries" in lines, repr(lines))
lines = lookup.merged_lines([("OpenAlex", lookup.Outcome()), ("Semantic Scholar", lookup.Outcome([s2], more=True))])
check("not found: only the indexes asked have a line", lines[-2:] == ["OpenAlex: not found", "Semantic Scholar: first 100, more exist"] and not any("Crossref" in line or "arXiv:" in line for line in lines), repr(lines))

# T8: the retraction and expression-of-concern notices Crossref lists in the "updated-by" field of the work's own record (recorded body of a retracted work, shortened).
CROSSREF_RETRACTED_BODY = """{"status":"ok","message-type":"work","message":{"DOI":"10.1016/s0140-6736(97)11096-0","type":"journal-article",
"title":["RETRACTED: Ileal-lymphoid-nodular hyperplasia, non-specific colitis, and pervasive developmental disorder in children"],
"author":[{"given":"AJ","family":"Wakefield"},{"given":"SH","family":"Murch"}],"issued":{"date-parts":[[1998,2]]},"container-title":["The Lancet"],
"updated-by":[{"DOI":"10.1016/s0140-6736(04)15715-2","type":"correction","label":"Correction","source":"retraction-watch","updated":{"date-parts":[[2004,3,6]],"date-time":"2004-03-06T00:00:00Z","timestamp":1078531200000},"record-id":"17269"},
{"DOI":"10.1016/s0140-6736(10)60175-4","type":"retraction","label":"Retraction","source":"retraction-watch","updated":{"date-parts":[[2010,2,6]],"date-time":"2010-02-06T00:00:00Z","timestamp":1265414400000},"record-id":"4036"}]}}"""
CROSSREF_CONCERN_BODY = CROSSREF_RETRACTED_BODY.replace('"type":"retraction","label":"Retraction","source":"retraction-watch"', '"type":"expression_of_concern","label":"Expression of concern","source":"publisher"')
CROSSREF_CORRECTED_BODY = CROSSREF_RETRACTED_BODY.replace('"type":"retraction","label":"Retraction"', '"type":"erratum","label":"Erratum"')


def resolve_lines(crossref_body):
    lines = []
    status = lookup.run_resolve(StubClient([("api.crossref.org", stub_reply(200, crossref_body))]), ["10.1016/S0140-6736(97)11096-0"], lines)
    return status, lines


status, lines = resolve_lines(CROSSREF_RETRACTED_BODY)
notices = [line for line in lines if "notice" in line]
check("T8 the retraction is printed", notices == ["Crossref notice: retraction | 2010-02-06 | doi 10.1016/s0140-6736(10)60175-4 | source retraction-watch"], repr(lines))
check("T8 the Crossref record line stays the first line", lines[0].startswith("Crossref: ratio 1.00: RETRACTED: Ileal-lymphoid-nodular hyperplasia"), repr(lines))
check("T8 the exit status stays 0", status == 0, repr(status))
status, lines = resolve_lines(CROSSREF_CONCERN_BODY)
notices = [line for line in lines if "notice" in line]
check("T8 the expression of concern is printed", notices == ["Crossref notice: expression_of_concern | 2010-02-06 | doi 10.1016/s0140-6736(10)60175-4 | source publisher"], repr(lines))
status, lines = resolve_lines(CROSSREF_CORRECTED_BODY)
check("T8 a correction and an erratum print no notice", not any("notice" in line for line in lines), repr(lines))
status, lines = resolve_lines(CROSSREF_BODY)
check("T8 a work with no notice prints none", not any("notice" in line for line in lines) and lines[0].startswith("Crossref: ratio 1.00: Estimating mutual information"), repr(lines))

# File names, DOIs in URLs, the PDF test and the arXiv HTML test.
folder = os.path.join(os.sep, "scratch", "folder")
for key in ("smith:2006/a", "../../etc/passwd", "..", ".", "a\\b", "x/../y"):
    name = lookup.file_stem(key) + ".txt"
    check("file name for " + repr(key), os.path.dirname(os.path.normpath(os.path.join(folder, name))) == folder and os.sep not in name, name)
check("file name for a key with / and :", lookup.file_stem("smith:2006/a") == "smith_2006_a")
check("DOI in a URL keeps its parentheses", lookup.quote_doi("10.1016/S0019-9958(57)90116-X") == "10.1016/S0019-9958(57)90116-X", lookup.quote_doi("10.1016/S0019-9958(57)90116-X"))
check("DOI in a URL encodes # and ?", lookup.quote_doi("10.1000/a#b?c") == "10.1000/a%23b%3Fc", lookup.quote_doi("10.1000/a#b?c"))
check("PDF body", lookup.is_pdf(b"%PDF-1.7\nrest") and not lookup.is_pdf(b"<html>%PDF-1.7") and not lookup.is_pdf(b""))
check("arXiv HTML page", lookup.is_arxiv_html_url("https://arxiv.org/html/2511.18945") and lookup.is_arxiv_html_url("https://arxiv.org/html/math/0601001v1"))
check("not an arXiv HTML page", not lookup.is_arxiv_html_url("https://example.org/html/2511.18945") and not lookup.is_arxiv_html_url("https://arxiv.org.example.org/html/x") and not lookup.is_arxiv_html_url("https://arxiv.org/abs/2511.18945") and not lookup.is_arxiv_html_url("https://arxiv.org/pdf/2511.18945"))

# Credentials go only to their own host.
client = lookup.Client({"S2_API_KEY": "s2-secret", "OPENALEX_API_KEY": "oa-secret", "CROSSREF_POLITE_EMAIL": "me@example.org"})
url, headers, host = client.prepare("https://api.semanticscholar.org/graph/v1/paper/x", "*/*")
check("Semantic Scholar key in the header", headers.get("x-api-key") == "s2-secret" and "oa-secret" not in url and "me@example.org" not in url, repr(headers))
url, headers, host = client.prepare("https://api.openalex.org/works?search=x", "*/*")
check("OpenAlex key in the URL", url.endswith("&api_key=oa-secret") and "x-api-key" not in headers and "me@example.org" not in url, url)
url, headers, host = client.prepare("https://api.crossref.org/works/x", "*/*")
check("Crossref address in the URL and User-Agent", "mailto=me%40example.org" in url and "mailto:me@example.org" in headers["User-Agent"] and "x-api-key" not in headers and "secret" not in url, repr((url, headers)))
for other in ("https://export.arxiv.org/api/query?id_list=1", "https://doi.org/10.1000/x", "https://example.org/paper.pdf"):
    url, headers, host = client.prepare(other, "*/*")
    check("no credential for " + other, url == other and "secret" not in str(headers) and "me@example.org" not in str(headers), repr((url, headers)))

# The URL check-urls requests for an entry.
check("check-urls prefers the DOI", lookup.entry_url({"doi": "10.1000/a#b", "eprint": "2001.00001", "url": "https://example.org"}) == "https://doi.org/10.1000/a%23b")
check("check-urls then the eprint", lookup.entry_url({"eprint": "2001.00001", "url": "https://example.org"}) == "https://arxiv.org/abs/2001.00001")
check("check-urls then the url", lookup.entry_url({"url": "https://example.org"}) == "https://example.org")
check("check-urls with no identifier", lookup.entry_url({"title": "T"}) == "")

# The BibTeX of an arXiv record, and the test of a BibTeX body.
bibtex = lookup.arxiv_bibtex(lookup.Record(title="A {title", authors=["X   Y", "Z W"], year=2020, arxiv_id="2001.00001"))
check("arXiv BibTeX", bibtex == "@misc{arxiv_2001_00001,\n  title = {A title},\n  author = {X Y and Z W},\n  year = {2020},\n  eprint = {2001.00001},\n  archivePrefix = {arXiv}\n}\n", repr(bibtex))
lines = []
status = lookup.run_bibtex(StubClient([("doi.org", stub_reply(200, " @article{k, title={T}}\n", "application/x-bibtex"))]), ["10.1000/xyz"], lines)
check("BibTeX body is printed as given", status == 0 and lines == [" @article{k, title={T}}"], repr(lines))
lines = []
status = lookup.run_bibtex(StubClient([("doi.org", stub_reply(200, HTML_BODY, "text/html"))]), ["10.1000/xyz"], lines)
check("a body that is not BibTeX", status == 1 and lines == ["doi.org: HTTP 200, not a BibTeX entry"], repr(lines))

# The text of an HTML page leaves out script and style text.
page = "<p>Keep this.</p><script>var hidden = 1;</script><style>p { color: red }</style><p>And this.</p>"
check("HTML text", lookup.html_to_text(page) == "Keep this.\nAnd this.\n", repr(lookup.html_to_text(page)))

# The keys a .tex cites, cite-keys, the title check of check-urls and the arguments of check-urls and quote-check.
work = tempfile.mkdtemp()
atexit.register(shutil.rmtree, work, True)
os.makedirs(os.path.join(work, "elsewhere"))


def put(name, text):
    path = os.path.join(work, name)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as handle:
        handle.write(text)
    return path


def command(arguments, folder="elsewhere"):
    """(exit status, standard output lines, standard error lines) of lookup.py run from a folder of the scratch folder."""
    done = subprocess.run([sys.executable, "-B", "-I", os.path.join(sys.argv[1], "lookup.py")] + arguments, cwd=os.path.join(work, folder), capture_output=True, text=True)
    return done.returncode, done.stdout.splitlines(), done.stderr.splitlines()


def bib_of(*entries):
    return "".join("@article{%s, title={%s}}\n" % (key, key.upper()) for key in entries)


# L1: the keys of every \cite-family command, \input files included, with the commented \cite left out.
put("l1/main.tex", "Intro \\cite{a,b} and \\citep[see][p. 3]{c}, \\citet{d}.\n\n\\input{sec}\n\n% \\cite{f}\nLater \\cite{z}.\n")
put("l1/sec.tex", "Section text \\cite{e}.\n")
put("l1/refs.bib", bib_of("g", "a", "b", "c", "e", "h"))
result = command(["cite-keys", "../l1/main.tex", "../l1/refs.bib"])
check("L1 cite-keys", result == (1, ["missing: d", "missing: z", "unused: g", "unused: h"], []), repr(result))

# L2: every cited key has an entry and every entry is cited.
put("l2/main.tex", "Text \\cite{a, b}.\n")
put("l2/refs.bib", bib_of("a", "b"))
result = command(["cite-keys", "../l2/main.tex", "../l2/refs.bib"])
check("L2 cite-keys with nothing to print", result == (0, [], []), repr(result))

# L2b: the natbib and biblatex commands of references/latex-template.md are all read, a \nocite is not.
put("l2b/main.tex", "Text \\textcite{a} and \\parencite[see][p. 3]{b}, \\autocite{c}, \\Parencite{d}, \\citet{e}, \\citeauthor*{f}, \\nocite{g}.\n")
put("l2b/refs.bib", bib_of("a", "b", "c", "d", "e", "f"))
result = command(["cite-keys", "../l2b/main.tex", "../l2b/refs.bib"])
check("L2b cite-keys reads the biblatex commands", result == (0, [], []), repr(result))

# L3: the files a .tex inputs are read relative to the main file's folder, whatever the working directory, and a % that is not escaped starts a comment.
put("l3/main.tex", "\\input{tables/x}\n\\include{chap}\n\\input{body.tex}\n\\input{sections/s}\n\\input{tables/x}\n% \\input{gone}\n\\includegraphics[width=3cm]{fig/plot}\nA gain of 5\\% \\cite{h}\n\\cite {k1}\n\\cite{k2, k3}\n\\cite{k4,\nk5}\n")
put("l3/tables/x.tex", "\\cite{tx}\n")
put("l3/chap.tex", "\\cite{ch}\n")
put("l3/body.tex", "\\cite{bd}\n")
put("l3/sections/s.tex", "\\input{tables/y}\n")
put("l3/tables/y.tex", "\\cite{ty}\n")
put("l3/refs.bib", "\n")
result = command(["cite-keys", "../l3/main.tex", "../l3/refs.bib"])
expected = ["missing: " + key for key in ("tx", "ch", "bd", "ty", "h", "k1", "k2", "k3", "k4", "k5")]
check("L3 keys of the main file and of the files it inputs", result == (1, expected, []), repr(result))

# L4: an \input file that does not exist is one error line naming it.
put("l4/main.tex", "\\input{nosuch}\n")
put("l4/refs.bib", "\n")
result = command(["cite-keys", "../l4/main.tex", "../l4/refs.bib"])
named = os.path.join("..", "l4", "nosuch.tex")
check("L4 missing input file", result == (2, [], [f"error: {named}: No such file or directory"]), repr(result))


class RecordingClient:
    """Answers a request with the reply of the first part found in its URL, raises a reply that is an exception, and keeps the URLs asked."""

    cache = None

    def __init__(self, replies):
        self.replies, self.requested = replies, []

    def get(self, url, accept="*/*", read_body=True):
        self.requested.append(url)
        for part, reply in self.replies:
            if part in url:
                if isinstance(reply, Exception):
                    raise reply
                return reply
        raise AssertionError("no reply recorded for " + url)


def check_urls(replies, tex, bib):
    client = RecordingClient(replies)
    lines = []
    status = lookup.run_check_urls(client, [tex, bib], lines)
    return status, lines, client.requested


def check_urls_of(entry, replies, text="Text \\cite{k}.\n", bib_name="paper-refs.bib"):
    return check_urls(replies, put("u/main.tex", text), put("u/" + bib_name, entry))


DOI_URL = "https://doi.org/10.1103/PhysRevE.69.066138"
DOI_ENTRY = "@article{k, title={Estimating mutual information}, doi={10.1103/PhysRevE.69.066138}}\n"
DOI_REPLY = ("https://doi.org/", stub_reply(200, ""))
CROSSREF_REPLY = ("api.crossref.org", stub_reply(200, CROSSREF_BODY))
NOT_FOUND = stub_reply(404, "")
RATE_LIMITED = stub_reply(429, "")
OUTAGE = lookup.LeftOut("no answer (URLError)")

# L5: the title of a key with a doi is compared with the record the doi resolves to.
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, CROSSREF_REPLY])
check("L5 a title that matches", result[:2] == (0, [f"k: 200 {DOI_URL}, ratio 1.00 against Crossref"]), repr(result))
mismatch_reply = ("api.crossref.org", stub_reply(200, CROSSREF_BODY.replace("Estimating mutual information", "A survey of protein folding kinetics")))
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, mismatch_reply])
check("L5 a title below 0.70", result[:2] == (1, [f"k: 200 {DOI_URL}, ratio 0.34 against Crossref, DOI_MISMATCH"]), repr(result))
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, CROSSREF_REPLY], text="Text \\cite{k, gone}.\n")
check("L5 a key the .bib lacks", result[:2] == (1, [f"k: 200 {DOI_URL}, ratio 1.00 against Crossref", "gone: no entry in paper-refs.bib"]), repr(result))
result = check_urls_of("@misc{k, title={T}}\n", [])
check("L5 a key with no identifier", result[:2] == (1, ["k: no identifier"]), repr(result))
result = check_urls_of("@misc{k, title={T}, url={https://example.org/a}}\n", [("example.org", stub_reply(200, ""))])
check("L5 a key with a url has no title check", result[:2] == (0, ["k: 200 https://example.org/a"]) and result[2] == ["https://example.org/a"], repr(result))
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, CROSSREF_REPLY], text="No citation here.\n")
check("L5 a .tex that cites no key", result[:2] == (0, ["the .tex cites no key"]), repr(result))

# L5a: an arXiv doi that Crossref does not hold is compared with the record OpenAlex holds.
arxiv_doi = "10.48550/arXiv.2601.21830"
result = check_urls_of("@misc{k, title={Estimating mutual information}, doi={%s}}\n" % arxiv_doi, [("https://doi.org/", stub_reply(200, "")), ("api.crossref.org", NOT_FOUND), ("api.openalex.org", stub_reply(200, OPENALEX_BODY))])
check("L5a the ratio against OpenAlex", result[:2] == (0, [f"k: 200 https://doi.org/{arxiv_doi}, ratio 1.00 against OpenAlex"]), repr(result))
check("L5a Semantic Scholar is not asked", not any("semanticscholar" in url for url in result[2]), repr(result[2]))

# L5b: an index that is left out is named with its reason, and an outage is never printed as not found. The control is a doi that all three answer as not found.
every_index_out = [DOI_REPLY, ("api.crossref.org", RATE_LIMITED), ("api.openalex.org", RATE_LIMITED), ("api.semanticscholar.org", OUTAGE)]
result = check_urls_of(DOI_ENTRY, every_index_out)
check("L5b every index left out", result[:2] == (1, [f"k: 200 {DOI_URL}, title not checked: Crossref left out, HTTP 429 after 3 retries; OpenAlex left out, HTTP 429 after 3 retries; Semantic Scholar left out, no answer (URLError)"]), repr(result))
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, ("api.crossref.org", NOT_FOUND), ("api.openalex.org", RATE_LIMITED), ("api.semanticscholar.org", NOT_FOUND)])
check("L5b one index left out, two not found", result[:2] == (1, [f"k: 200 {DOI_URL}, title not checked: OpenAlex left out, HTTP 429 after 3 retries"]), repr(result))
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, ("api.crossref.org", OUTAGE), ("api.openalex.org", stub_reply(200, OPENALEX_BODY))])
check("L5b a record after an index left out", result[:2] == (0, [f"k: 200 {DOI_URL}, ratio 1.00 against OpenAlex"]), repr(result))
result = check_urls_of(DOI_ENTRY, [DOI_REPLY, ("api.crossref.org", NOT_FOUND), ("api.openalex.org", NOT_FOUND), ("api.semanticscholar.org", NOT_FOUND)])
check("L5b control, a doi no index holds", result[:2] == (1, [f"k: 200 {DOI_URL}, doi not found in Crossref, OpenAlex or Semantic Scholar"]), repr(result))
result = check_urls_of(DOI_ENTRY, [("https://doi.org/", OUTAGE), CROSSREF_REPLY])
check("L5b a url that gives no answer keeps its title check", result[:2] == (1, [f"k: failed, no answer (URLError) {DOI_URL}, ratio 1.00 against Crossref"]), repr(result))

# L5c: the braces of a .bib title do not count.
result = check_urls_of("@article{k, title={{Estimating} Mutual Information}, doi={10.1103/PhysRevE.69.066138}}\n", [DOI_REPLY, CROSSREF_REPLY])
check("L5c braces in the title", result[:2] == (0, [f"k: 200 {DOI_URL}, ratio 1.00 against Crossref"]), repr(result))

# L5d: a doi reaches the three indexes stripped of its prefix and percent-encoded.
result = check_urls_of("@article{k, title={Estimating mutual information}, doi={https://doi.org/10.1103/PhysRevE.69.066138}}\n", [DOI_REPLY, CROSSREF_REPLY])
check("L5d a doi written as a URL", result[2] == [DOI_URL, "https://api.crossref.org/works/10.1103/PhysRevE.69.066138"], repr(result))
result = check_urls_of("@article{k, title={Estimating mutual information}, doi={10.1000/a#b?c}}\n", [DOI_REPLY, ("api.crossref.org", NOT_FOUND), ("api.openalex.org", NOT_FOUND), ("api.semanticscholar.org", stub_reply(200, S2_BODY))])
asked = result[2] + [""] * 4
check("L5d the doi at the status request", asked[0] == "https://doi.org/10.1000/a%23b%3Fc", repr(asked))
check("L5d the doi at Crossref", asked[1] == "https://api.crossref.org/works/10.1000/a%23b%3Fc", repr(asked))
check("L5d the doi at OpenAlex", asked[2].startswith("https://api.openalex.org/works/doi:10.1000/a%23b%3Fc?"), repr(asked))
check("L5d the doi at Semantic Scholar", asked[3].startswith("https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/a%23b%3Fc?"), repr(asked))
check("L5d the line", result[1] == ["k: 200 https://doi.org/10.1000/a%23b%3Fc, ratio 1.00 against Semantic Scholar"], repr(result))

# The arguments of check-urls: the .tex and the .bib.
def run_in_process(function, arguments):
    """(exit status or "error: <message>", the lines printed) of a command function called with an empty set of recorded replies."""
    lines = []
    try:
        status = function(RecordingClient([]), arguments, lines)
    except lookup.UsageError as error:
        return "error: " + str(error), lines
    return status, lines


result = run_in_process(lookup.run_check_urls, ["only-one"])
check("check-urls one argument", result == ("error: check-urls takes <main.tex> <file.bib>", []), repr(result))

# L6: quote-check reads the citation report, the .bib named and the texts of a folder.
put("l6/texts/k1.txt", "Here the plug-in estimator is biased for small samples.\n")
record = put("l6/record/record.md", "Claim [@k1, p. 1] and [@k2, p. 2].\n\n> [@k1, p. 1]: \"the plug-in estimator is biased\"\n")
put("l6/record/references.bib", bib_of("k2"))
named = put("l6/named/refs.bib", bib_of("k1"))
texts = os.path.join(work, "l6", "texts")
status, lines = run_in_process(lookup.run_quote_check, [record, named, texts])
check("L6 the passage is checked against the folder's text", "line 3: k1, p. 1: found" in lines, repr(lines))
check("L6 the key the named .bib lacks", "k2: no entry" in lines, repr(lines))
check("L6 the key the named .bib holds", "k1: no entry" not in lines, repr(lines))
check("L6 exit status", status == 1, repr((status, lines)))
result = run_in_process(lookup.run_quote_check, [record, texts])
check("L6 two arguments", result == ("error: quote-check takes <citation report> <file.bib> <folder>", []), repr(result))

# E: resolve --entry reads one entry of a .bib, resolves it as resolve resolves its identifier or title, and ends with a verdict line.
def crossref_work(doi, title, year=None):
    message = {"DOI": doi, "title": [title], "author": [{"given": "A", "family": "Author"}], "container-title": ["A Journal"]}
    if year:
        message["issued"] = {"date-parts": [[year]]}
    return stub_reply(200, json.dumps({"status": "ok", "message": message}))


def openalex_work(doi, title, year):
    work = {"id": "https://openalex.org/W1", "title": title, "doi": "https://doi.org/" + doi, "publication_year": year, "authorships": [], "primary_location": {"source": {"display_name": "A Journal"}}, "open_access": {"oa_url": None}}
    return stub_reply(200, json.dumps(work))


def crossref_hits(*hits):
    items = [{"DOI": "10.1000/h%d" % number, "title": [title], "issued": {"date-parts": [[year]]}} for number, (title, year) in enumerate(hits)]
    return stub_reply(200, json.dumps({"message": {"items": items}}))


def openalex_hits(*hits):
    results = [{"id": "https://openalex.org/W%d" % (number + 1), "title": title, "publication_year": year} for number, (title, year) in enumerate(hits)]
    return stub_reply(200, json.dumps({"results": results}))


EVERYTHING_ELSE = ("", NOT_FOUND)


def entry_bib(key="k", title="Estimating mutual information", year="2004", **fields):
    lines = ["@article{%s," % key, "  title = {%s}," % title, "  year = {%s}," % year] if year is not None else ["@article{%s," % key, "  title = {%s}," % title]
    lines += ["  %s = {%s}," % pair for pair in fields.items()]
    return "\n".join(lines) + "\n}\n"


def entry_run(bib_text, key, replies):
    path = put("e/refs.bib", bib_text)
    client = RecordingClient(replies + [EVERYTHING_ELSE])
    lines = []
    try:
        status = lookup.run_resolve(client, ["--entry", path, key], lines)
    except lookup.UsageError as error:
        status = "error: " + str(error)
    return status, lines, client.requested


def plain_resolve(replies, argument, *options):
    lines = []
    lookup.run_resolve(RecordingClient(replies + [EVERYTHING_ELSE]), [argument, *options], lines)
    return lines


# E1: the verdict of a DOI whose Crossref record agrees, after the lines resolve prints for the DOI.
kolda_replies = [("api.crossref.org", crossref_work("10.1137/07070111x", "Tensor Decompositions and Applications", 2009))]
result = entry_run(entry_bib("Kolda_2009", "Tensor Decompositions and Applications", "2009", doi="10.1137/07070111x"), "Kolda_2009", kolda_replies)
check("E1 the verdict line", result[0] == 0 and result[1][-1:] == ["Kolda_2009: CONFIRMED against Crossref, ratio 1.00, year 2009"], repr(result))
check("E1 the lines resolve prints come first", result[1][:-1] == plain_resolve(kolda_replies, "10.1137/07070111x") and len(result[1]) == 5, repr(result))

# E2: Crossref's record lacks the subtitle (ratio below 0.70) and OpenAlex's record has it, so the first record that agrees is OpenAlex's.
long_title = "Wasserstein barycentric coordinates: histogram regression using optimal transport"
bonneel_replies = [("api.crossref.org", crossref_work("10.1145/2897824.2925918", "Wasserstein barycentric coordinates", 2016)), ("api.openalex.org", openalex_work("10.1145/2897824.2925918", long_title, 2016))]
result = entry_run(entry_bib("Bonneel_2016", long_title, "2016", doi="10.1145/2897824.2925918"), "Bonneel_2016", bonneel_replies)
check("E2 the first record that agrees", result[0] == 0 and result[1][-1] == "Bonneel_2016: CONFIRMED against OpenAlex, ratio 1.00, year 2016", repr(result))

# E3: the title agrees in every record and the year does not.
result = entry_run(entry_bib("Entry_2018", "Estimating mutual information", "2018", doi="10.1103/PhysRevE.69.066138"), "Entry_2018", [("api.crossref.org", crossref_work("10.1103/PhysRevE.69.066138", "Estimating mutual information", 2019)), ("api.openalex.org", openalex_work("10.1103/PhysRevE.69.066138", "Estimating mutual information", 2019))])
check("E3 the year differs", result[0] == 1 and result[1][-1] == "Entry_2018: NOT_CONFIRMED against Crossref, ratio 1.00, year 2019, entry year 2018", repr(result))

# E4: every record's title is below 0.70, and the verdict gives the first record's ratio.
other = "A survey of protein folding kinetics"
result = entry_run(entry_bib("k", "Estimating mutual information", "2004", doi="10.1103/PhysRevE.69.066138"), "k", [("api.crossref.org", crossref_work("10.1103/PhysRevE.69.066138", other, 2004)), ("api.openalex.org", openalex_work("10.1103/PhysRevE.69.066138", "Another unrelated title", 2004))])
check("E4 the titles differ", result[0] == 1 and result[1][-1] == "k: NOT_CONFIRMED against Crossref, ratio 0.34, year 2004, entry year 2004", repr(result))

# E5: an entry with an eprint and archivePrefix arXiv is resolved by its arXiv ID, never by its title.
arxiv_title = "A study of the estimation of mutual information"
result = entry_run(entry_bib("a", arxiv_title, "2025", eprint="2511.18945", archivePrefix="arXiv"), "a", [("api.crossref.org", NOT_FOUND), ("api.openalex.org", openalex_work("10.48550/arXiv.2511.18945", arxiv_title, 2025)), ("export.arxiv.org", stub_reply(200, ARXIV_FEED))])
check("E5 the verdict", result[0] == 0 and result[1][-1] == "a: CONFIRMED against OpenAlex, ratio 1.00, year 2025", repr(result))
check("E5 asked by the arXiv ID", any(url.startswith("https://export.arxiv.org/api/query?id_list=2511.18945") for url in result[2]) and not any("query.bibliographic" in url or "search=" in url for url in result[2]), repr(result[2]))

# E6: an entry with neither is resolved by its title, with its year given.
title = "Neural estimation of mutual information"
near = "Neural estimation of mutual information bounds"
result = entry_run(entry_bib("t", title, "2019"), "t", [("api.crossref.org", crossref_hits((near, 2018))), ("api.openalex.org", openalex_hits((title, 2019)))])
check("E6 a later index agrees", result[0] == 0 and result[1][-1] == "t: CONFIRMED against OpenAlex, ratio 1.00, year 2019", repr(result))
result = entry_run(entry_bib("t", title, "2019"), "t", [("api.crossref.org", crossref_hits((near, 2018))), ("api.openalex.org", openalex_hits((title, 2020)))])
check("E6 no index agrees", result[0] == 1 and result[1][-1] == "t: NOT_CONFIRMED against Crossref, ratio 0.92, year 2018, entry year 2019", repr(result))
result = entry_run(entry_bib("t", title, "2019"), "t", [("api.crossref.org", crossref_hits((title, 2018), (near, 2019)))])
check("E6 the candidate of the entry's year is preferred", result[0] == 0 and result[1][-1] == "t: CONFIRMED against Crossref, ratio 0.92, year 2019", repr(result))

# E7: the field written DOI and a space before @ are read.
spaced = " @article{k,\n  title={Estimating mutual information},\n  DOI={10.1103/PhysRevE.69.066138},\n  year={2004}}\n"
result = entry_run(spaced, "k", [("api.crossref.org", crossref_work("10.1103/PhysRevE.69.066138", "Estimating mutual information", 2004))])
check("E7 the DOI field in capitals", result[0] == 0 and result[1][-1] == "k: CONFIRMED against Crossref, ratio 1.00, year 2004" and result[2][0] == "https://api.crossref.org/works/10.1103/PhysRevE.69.066138", repr(result))

# E8: a doi field that is no DOI counts as absent, so the arXiv ID is used.
result = entry_run(entry_bib("a", arxiv_title, "2025", doi="not available", eprint="2511.18945", archivePrefix="arXiv"), "a", [("api.crossref.org", NOT_FOUND), ("api.openalex.org", openalex_work("10.48550/arXiv.2511.18945", arxiv_title, 2025))])
check("E8 the arXiv ID is used", result[0] == 0 and result[1][-1] == "a: CONFIRMED against OpenAlex, ratio 1.00, year 2025" and "https://api.crossref.org/works/10.48550/arXiv.2511.18945" in result[2], repr(result))
result = entry_run(entry_bib("a", arxiv_title, "2025", url="https://arxiv.org/abs/2511.18945v2"), "a", [("api.crossref.org", NOT_FOUND), ("api.openalex.org", openalex_work("10.48550/arXiv.2511.18945", arxiv_title, 2025))])
check("E8 the arXiv ID of the url", result[0] == 0 and "https://api.crossref.org/works/10.48550/arXiv.2511.18945" in result[2] and not any("query.bibliographic" in url for url in result[2]), repr(result))
result = entry_run(entry_bib("a", arxiv_title, "2025", doi="10.48550/arXiv.2511.18945"), "a", [("api.crossref.org", NOT_FOUND), ("api.openalex.org", openalex_work("10.48550/arXiv.2511.18945", arxiv_title, 2025))])
check("E8 the arXiv DOI", result[0] == 0 and result[1][-1] == "a: CONFIRMED against OpenAlex, ratio 1.00, year 2025", repr(result))

# E9: a record with no year is printed as year none and is never a confirmation.
result = entry_run(entry_bib("k", "Estimating mutual information", "2004", doi="10.1103/PhysRevE.69.066138"), "k", [("api.crossref.org", crossref_work("10.1103/PhysRevE.69.066138", "Estimating mutual information"))])
check("E9 a record with no year", result[0] == 1 and result[1][-1] == "k: NOT_CONFIRMED against Crossref, ratio 1.00, year none, entry year 2004", repr(result))

# E10: no index prints a record.
result = entry_run(entry_bib("k", "Estimating mutual information", "2004", doi="10.1103/PhysRevE.69.066138"), "k", [])
check("E10 every index answers not found", result[0] == 1 and result[1][-1] == "k: NOT_CONFIRMED, no record", repr(result))
result = entry_run(entry_bib("k", "Estimating mutual information", "2004"), "k", [("api.crossref.org", RATE_LIMITED), ("api.openalex.org", OUTAGE), ("api.semanticscholar.org", RATE_LIMITED), ("export.arxiv.org", OUTAGE)])
check("E10 every index left out", result[0] == 1 and result[1][-1] == "k: NOT_CONFIRMED, no record" and result[1][0] == "Crossref: left out, HTTP 429 after 3 retries", repr(result))

# E11: a call or an entry that cannot be read is one error line and exit status 2, before any request.
def entry_error(arguments, bib_text="@article{k, title={T}, year={2004}, doi={10.1000/x}}\n"):
    path = put("e/refs.bib", bib_text)
    return command(["resolve"] + [path if argument == "BIB" else argument for argument in arguments])


def expected_error(message):
    return (2, [], ["error: " + message])


check("E11 a key the .bib lacks", entry_error(["--entry", "BIB", "nokey"]) == expected_error("nokey: the .bib has no entry with this key"), repr(entry_error(["--entry", "BIB", "nokey"])))
check("E11 a key that differs in case", entry_error(["--entry", "BIB", "K"]) == expected_error("K: the .bib has no entry with this key"), repr(entry_error(["--entry", "BIB", "K"])))
check("E11 a key with a line break", entry_error(["--entry", "BIB", "k\nx"]) == expected_error("the key holds a line break"), repr(entry_error(["--entry", "BIB", "k\nx"])))
result = command(["resolve", "--entry", os.path.join(work, "e", "absent.bib"), "k"])
check("E11 a .bib that does not exist", result == (2, [], ["error: %s: No such file or directory" % os.path.join(work, "e", "absent.bib")]), repr(result))
with open(os.path.join(work, "e", "latin.bib"), "wb") as handle:
    handle.write(b"@article{k, title={T\xe9}, year={2004}}\n")
result = command(["resolve", "--entry", os.path.join(work, "e", "latin.bib"), "k"])
check("E11 a .bib that is not UTF-8", result == (2, [], ["error: %s: not valid UTF-8" % os.path.join(work, "e", "latin.bib")]), repr(result))
result = entry_error(["--entry", "BIB", "k"], "@article{k, year={2004}}\n")
check("E11 an entry with no title", result == expected_error("k: the entry has no title"), repr(result))
result = entry_error(["--entry", "BIB", "k"], "@article{k, title={T}}\n")
check("E11 an entry with no year", result == expected_error("k: the entry has no year"), repr(result))
result = entry_error(["--entry", "BIB", "k"], "@article{k, title={T}, year={2009a}}\n")
check("E11 a year that is not four digits", result == expected_error("k: the year of the entry is not four digits"), repr(result))
result = entry_error(["--entry", "BIB", "k", "--year", "2004"])
check("E11 --entry with --year", result == expected_error("--entry cannot be used with --year"), repr(result))
result = entry_error(["--entry", "BIB"])
check("E11 --entry with one value", result == expected_error("--entry takes <file.bib> <key>"), repr(result))
result = entry_error(["--entry", "BIB", "k", "extra"])
check("E11 --entry with another positional argument", result == expected_error("--entry takes <file.bib> <key>"), repr(result))
result = entry_error(["10.1000/x", "--entry", "BIB", "k"])
check("E11 --entry after a positional argument", result == expected_error("--entry takes <file.bib> <key>"), repr(result))

# E12: resolve without --entry prints what it printed before.
title_replies = [("api.crossref.org", crossref_hits((near, 2018), (title, 2019))), ("api.openalex.org", openalex_hits((title, 2019)))]
lines = plain_resolve(title_replies, title, "--year", "2019")
check("E12 resolve of a title", len(lines) == 4 and lines[0].startswith("Crossref: ratio 1.00: Neural estimation of mutual information |") and lines[1].startswith("OpenAlex: ratio 1.00: Neural estimation of mutual information |") and lines[2:] == ["Semantic Scholar: not found", "arXiv: not found"], repr(lines))
check("E12 resolve of a DOI has no verdict line", not any("CONFIRMED" in line for line in plain_resolve(kolda_replies, "10.1137/07070111x")))

# E13: of two entries with one key, the first is resolved.
duplicate = "@article{dup, title={First title}, year={2001}, doi={10.1000/first}}\n@article{dup, title={Second title}, year={2002}, doi={10.1000/second}}\n"
result = entry_run(duplicate, "dup", [("api.crossref.org/works/10.1000/first", crossref_work("10.1000/first", "First title", 2001)), ("api.crossref.org/works/10.1000/second", crossref_work("10.1000/second", "Second title", 2002))])
check("E13 the first entry", result[0] == 0 and result[1][-1] == "dup: CONFIRMED against Crossref, ratio 1.00, year 2001" and not any("second" in url for url in result[2]), repr(result))


# Pacing, 429 handling and the reply cache. Each case runs on a new scratch temporary folder and cache folder. Where a wait is checked, time.sleep and time.time are
# stubbed together as one fake clock, and Client.send answers from a script.
CREDENTIALS = ("S2_API_KEY", "OPENALEX_API_KEY", "CROSSREF_POLITE_EMAIL")
case_numbers = itertools.count()
DOI = "10.1103/PhysRevE.69.066138"
IDENTIFIER = lookup.classify(DOI)
CROSSREF, OPENALEX, SEMANTIC_SCHOLAR, ARXIV = "api.crossref.org", "api.openalex.org", "api.semanticscholar.org", "export.arxiv.org"
NO_RESULT = {
    CROSSREF: '{"message":{"items":[]}}',
    OPENALEX: '{"results":[]}',
    SEMANTIC_SCHOLAR: '{"data":[]}',
    ARXIV: '<?xml version="1.0"?><feed xmlns="http://www.w3.org/2005/Atom"></feed>',
}


def scratch_case(credentials=None):
    """New empty temporary and cache folders for one case, with the given credentials set in the environment and the others unset; (the temporary folder, the cache folder)."""
    folder = os.path.join(SCRATCH, "case%d" % next(case_numbers))
    temporary = os.path.join(folder, "tmp")
    os.makedirs(temporary)
    tempfile.tempdir = temporary
    os.environ["TMPDIR"] = temporary
    os.environ["XDG_CACHE_HOME"] = os.path.join(folder, "cache")
    for name in CREDENTIALS:
        os.environ.pop(name, None)
    os.environ.update(credentials or {})
    return temporary, os.path.join(folder, "cache", "ordo-lookup")


class FakeClock:
    """time.time and time.sleep as one clock: a sleep moves the time, so a wait loop that reads the clock ends. sleeps lists each wait, and a sleep after the first limit ones raises TooManySleeps when limit is set.
    The time is kept exactly, so that a wait shorter than the spacing of floats near the epoch still moves the time that time() reports."""

    def __init__(self, limit=None):
        self.exact = fractions.Fraction(int(time.time()))
        self.sleeps, self.limit = [], limit

    @property
    def now(self):
        return float(self.exact)

    @now.setter
    def now(self, value):
        self.exact = fractions.Fraction(value)

    def time(self):
        return self.now

    def sleep(self, seconds):
        if self.limit is not None and len(self.sleeps) >= self.limit:
            raise TooManySleeps(f"more than {self.limit} sleeps")
        self.sleeps.append(seconds)
        self.exact += fractions.Fraction(seconds)


class TooManySleeps(Exception):
    """A wait that does not end: a FakeClock with a limit raises it at the sleep after the last one it allows."""


@contextlib.contextmanager
def fake_clock(limit=None):
    clock = FakeClock(limit)
    real = time.time, time.sleep
    time.time, time.sleep = clock.time, clock.sleep
    try:
        yield clock
    finally:
        time.time, time.sleep = real


def says(status, body="", **headers):
    return (status, body, {name.replace("_", "-"): value for name, value in headers.items()})


class Script:
    """Answers Client.send from a list of replies for each host: the n-th request to a host gets the n-th reply and the last reply repeats. A host with no list gets 404."""

    def __init__(self, replies):
        self.replies = {host: list(items) for host, items in replies.items()}
        self.urls, self.times = [], []

    def send(self, url, headers, read_body):
        self.urls.append(url)
        self.times.append(time.time())
        items = self.replies.get(urllib.parse.urlsplit(url).hostname)
        if not items:
            return 404, b"", {}
        status, body, header = items.pop(0) if len(items) > 1 else items[0]
        return status, body.encode("utf-8"), dict(header)

    def asked(self, host):
        return sum(1 for url in self.urls if urllib.parse.urlsplit(url).hostname == host)


@contextlib.contextmanager
def serving(script):
    real = lookup.Client.send
    lookup.Client.send = lambda self, url, headers, read_body: script.send(url, headers, read_body)
    try:
        yield script
    finally:
        lookup.Client.send = real


def run_main(arguments, script):
    """(exit status, standard output lines, standard error text) of lookup.main in this process, answered from the script."""
    out, err = io.StringIO(), io.StringIO()
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err), serving(script):
        status = lookup.main(arguments)
    return status, out.getvalue().splitlines(), err.getvalue()


DRIVER = """
import contextlib, io, json, sys, urllib.parse
sys.path.insert(0, sys.argv[1])
import lookup
config = json.loads(sys.argv[2])
requests = []
def send(self, url, headers, read_body):
    requests.append(url)
    status, body, header = config["replies"].get(urllib.parse.urlsplit(url).hostname, [404, "", {}])
    return status, body.encode("utf-8"), header
lookup.Client.send = send
out = io.StringIO()
with contextlib.redirect_stdout(out):
    status = lookup.main(config["arguments"])
print(json.dumps({"status": status, "lines": out.getvalue().splitlines(), "requests": requests}))
"""


def run_child(arguments, replies):
    """The result of lookup.main in another process that shares the scratch folders; replies maps a host to its one reply (status, body, headers)."""
    done = subprocess.run([sys.executable, "-B", "-I", "-c", DRIVER, sys.argv[1], json.dumps({"arguments": arguments, "replies": replies})], env=child_env(tempfile.gettempdir()), capture_output=True, text=True)
    return json.loads(done.stdout) if done.returncode == 0 else {"status": done.returncode, "lines": [], "requests": [], "stderr": done.stderr}


@contextlib.contextmanager
def attempt(name):
    """A case that raises is a failure of that case, not the end of the run."""
    try:
        yield
    except Exception as error:
        failures.append(f"{name} raised {type(error).__name__}: {error}")


def brief(outcome):
    return [record.title for record in outcome.records], outcome.left_out


def hosts_of(script):
    return [urllib.parse.urlsplit(url).hostname for url in script.urls]


def head(lines):
    return [line[:30] for line in lines]


def files_under(folder):
    return [os.path.join(top, name) for top, _, names in os.walk(folder) for name in names]


def read_text(path):
    with open(path) as handle:
        return handle.read()


def read_bytes(path):
    with open(path, "rb") as handle:
        return handle.read()


def skip_files(temporary):
    return sorted(name for name in os.listdir(temporary) if name.startswith("ordo-lookup-skip-"))


def mode_of(path):
    return os.stat(path).st_mode & 0o777 if os.path.exists(path) else None


def listing(folder):
    return sorted(os.listdir(folder)) if os.path.isdir(folder) else []


# P1: each API host is paced across processes. Two processes each make one request to the host, sharing a temporary folder.
PACED_CHILD = """
import sys, time
sys.path.insert(0, sys.argv[1])
import lookup
t0 = time.time()
span = []
def send(self, url, headers, read_body):
    span.append(time.time())
    time.sleep(0.2)
    span.append(time.time())
    return 200, b"{}", {}
lookup.Client.send = send
lookup.Client({}).get(sys.argv[2])
print(t0, *span)
"""
with attempt("P1"):
    started = {}
    for host, url, gap in ((CROSSREF, "https://api.crossref.org/works/10.1000/x", 1.0), (OPENALEX, "https://api.openalex.org/works/doi:10.1000/x", 1.05), (SEMANTIC_SCHOLAR, "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/x", 1.05)):
        folder, _ = scratch_case()
        started[host] = (gap, [subprocess.Popen([sys.executable, "-B", "-I", "-c", PACED_CHILD, sys.argv[1], url], env=child_env(folder), stdout=subprocess.PIPE, text=True) for _ in range(2)])
    for host, (gap, children) in started.items():
        times = [tuple(float(number) for number in child.communicate()[0].split()) for child in children]
        first, second = sorted(times, key=lambda row: row[1])
        check(f"P1 {host}: the second process starts {gap} seconds after the first ended", second[1] >= first[2] + gap, repr(times))
        check(f"P1 {host}: the first process does not wait", first[1] - first[0] < gap, repr(times))

# P2: the gap of each host by its environment, seen as the wait of a second request that follows the first at once. The fake clock's float time near the epoch can add a wait of a few
# millionths of a second to the gap, so the waits are summed.
for host, url, credentials, gap in (
    (CROSSREF, "https://api.crossref.org/works/10.1000/x", {}, 1.0),
    (CROSSREF, "https://api.crossref.org/works/10.1000/x", {"CROSSREF_POLITE_EMAIL": "me@example.org"}, 0.35),
    (OPENALEX, "https://api.openalex.org/works/doi:10.1000/x", {}, 1.05),
    (OPENALEX, "https://api.openalex.org/works/doi:10.1000/x", {"OPENALEX_API_KEY": "key"}, 0.21),
    (SEMANTIC_SCHOLAR, "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/x", {}, 1.05),
    (SEMANTIC_SCHOLAR, "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/x", {"S2_API_KEY": "key"}, 1.05),
    (ARXIV, "https://export.arxiv.org/api/query?id_list=2511.18945", {}, 3.0),
    ("arxiv.org", "https://arxiv.org/abs/2511.18945", {}, 3.0),
):
    with attempt(f"P2 {host}"):
        scratch_case()
        script = Script({host: [says(200, "{}")]})
        with fake_clock() as clock, serving(script):
            client = lookup.Client(credentials)
            client.get(url)
            client.get(url)
        check(f"P2 {host} {sorted(credentials)}: the gap is {gap}", abs(sum(clock.sleeps) - gap) < 1e-6 and clock.sleeps[0] > gap - 1e-6, repr(clock.sleeps))

# P3: a request to doi.org takes no turn, and a redirect from it to Crossref takes Crossref's turn.
with attempt("P3"):
    temporary, _ = scratch_case()
    script = Script({"doi.org": [says(200, "{}")]})
    with fake_clock() as clock, serving(script):
        lookup.Client({}).get("https://doi.org/10.1000/y")
        lookup.Client({}).get("https://doi.org/10.1000/y")
    check("P3 doi.org alone takes no turn and leaves no lock file", clock.sleeps == [] and os.listdir(temporary) == [], repr((clock.sleeps, os.listdir(temporary))))
    temporary, _ = scratch_case()
    script = Script({"doi.org": [says(302, Location="https://api.crossref.org/works/10.1000/x")], CROSSREF: [says(200, "{}")]})
    with fake_clock() as clock, serving(script):
        lookup.Client({}).get("https://doi.org/10.1000/y")
        lookup.Client({}).get("https://doi.org/10.1000/y")
    check("P3 a redirect from doi.org takes Crossref's turn", script.asked("doi.org") == 2 and len(clock.sleeps) == 1 and abs(clock.sleeps[0] - 1.0) < 1e-9 and os.listdir(temporary) == ["ordo-lookup-crossref"], repr((clock.sleeps, os.listdir(temporary))))


# P5: a lock file that holds inf or nan is no time: the request waits the full gap once and is then sent. The clock allows 10 sleeps, so a wait that never ends fails the case.
for lock, host, url, gap in (
    (lookup.ARXIV_LOCK_NAME, ARXIV, "https://export.arxiv.org/api/query?id_list=2511.18945", 3.0),
    ("ordo-lookup-crossref", CROSSREF, "https://api.crossref.org/works/10.1000/x", 1.0),
):
    for text in ("inf", "nan"):
        with attempt(f"P5 {lock} {text}"):
            temporary, _ = scratch_case()
            with open(os.path.join(temporary, lock), "w") as handle:
                handle.write(text)
            script = Script({host: [says(200, "{}")]})
            ended = None
            with fake_clock(10) as clock, serving(script):
                try:
                    lookup.Client({}).get(url)
                except TooManySleeps as error:
                    ended = str(error)
            check(f"P5 {lock} holding {text!r}: the full gap once, then the request", ended is None and script.asked(host) == 1 and abs(sum(clock.sleeps) - gap) < 1e-6 and clock.sleeps[0] > gap - 1e-6, repr((ended, clock.sleeps, hosts_of(script))))


def crossref_run(first, then):
    """(the clock, the outcome of a Crossref lookup, the script) when Crossref answers first and then then; first is a function of the clock's start when it holds a date."""
    scratch_case()
    with fake_clock() as clock:
        script = Script({CROSSREF: [first(clock.now) if callable(first) else first, then]})
        with serving(script):
            outcome = lookup.lookup_crossref(lookup.Client({}), IDENTIFIER)
    return clock, outcome, script


# R1 and R1b: a 429 with Retry-After is retried after that many seconds, at most 3 times.
with attempt("R1"):
    clock, outcome, script = crossref_run(says(429, Retry_After="5"), says(200, CROSSREF_BODY))
    check("R1 one wait of 5 seconds, then the record", clock.sleeps == [5.0] and [record.title for record in outcome.records] == ["Estimating mutual information"] and not outcome.left_out, repr((clock.sleeps, brief(outcome))))
    clock, outcome, script = crossref_run(says(429, Retry_After="5"), says(429, Retry_After="5"))
    check("R1b four 429s: waits of 5, 5 and 5 seconds, then the 3 retries reason", clock.sleeps == [5.0, 5.0, 5.0] and outcome.left_out == "HTTP 429 after 3 retries" and len(script.urls) == 4, repr((clock.sleeps, brief(outcome), hosts_of(script))))

# R2 and R3: a Retry-After above 60 seconds is left out at once and written to the skip file of the host, which later requests and processes read.
OPENALEX_LONG = {OPENALEX: [says(429, Retry_After="4356"), says(200, OPENALEX_BODY)], CROSSREF: [says(404)], SEMANTIC_SCHOLAR: [says(404)]}
with attempt("R2"):
    temporary, _ = scratch_case()
    script = Script(OPENALEX_LONG)
    with fake_clock() as clock:
        start = clock.now
        status, lines, _ = run_main(["resolve", DOI], script)
    check("R2 left out at once with the seconds named", "OpenAlex: left out, HTTP 429, retry after 4356 s" in lines and script.asked(OPENALEX) == 1 and clock.sleeps == [], repr((head(lines), hosts_of(script), clock.sleeps)))
    check("R2 the skip file of OpenAlex without a key", skip_files(temporary) == ["ordo-lookup-skip-openalex"], repr(os.listdir(temporary)))
    path = os.path.join(temporary, "ordo-lookup-skip-openalex")
    check("R2 the skip file holds the time of the reset", os.path.exists(path) and float(read_text(path)) == start + 4356, repr(os.listdir(temporary)))
    check("R2 the skip file has mode 600", mode_of(path) == 0o600, repr(mode_of(path)))
    temporary, _ = scratch_case({"OPENALEX_API_KEY": "key"})
    with fake_clock():
        run_main(["resolve", DOI], Script(OPENALEX_LONG))
    check("R2 the skip file with a key has -key appended", skip_files(temporary) == ["ordo-lookup-skip-openalex-key"], repr(os.listdir(temporary)))

with attempt("R3"):
    temporary, _ = scratch_case()
    script = Script(OPENALEX_LONG)
    with fake_clock() as clock, serving(script):
        start = clock.now
        lookup.lookup_openalex(lookup.Client({}), IDENTIFIER)
        clock.now = start + 0.4
        outcome = lookup.lookup_openalex(lookup.Client({}), IDENTIFIER)
        check("R3 a second client sends no request and names the seconds left, rounded up", script.asked(OPENALEX) == 1 and outcome.left_out == "HTTP 429, retry after 4356 s", repr((brief(outcome), hosts_of(script))))
        clock.now = start + 4355.5
        outcome = lookup.lookup_openalex(lookup.Client({}), IDENTIFIER)
        check("R3 half a second left is one second", script.asked(OPENALEX) == 1 and outcome.left_out == "HTTP 429, retry after 1 s", repr((brief(outcome), hosts_of(script))))
        clock.now = start + 0.4
        outcome = lookup.lookup_openalex(lookup.Client({"OPENALEX_API_KEY": "key"}), IDENTIFIER)
        check("R3 a run with the key is not skipped by the file written without it", script.asked(OPENALEX) == 2 and len(outcome.records) == 1, repr((brief(outcome), hosts_of(script))))
        clock.now = start + 4356
        outcome = lookup.lookup_openalex(lookup.Client({}), IDENTIFIER)
        check("R3 past the reset the request is sent", script.asked(OPENALEX) == 3 and len(outcome.records) == 1, repr((brief(outcome), hosts_of(script))))
    skipped = run_child(["resolve", DOI], {host: [200, "{}", {}] for host in (CROSSREF, OPENALEX, SEMANTIC_SCHOLAR)})
    seconds = [int(number) for line in skipped["lines"] for number in re.findall(r"OpenAlex: left out, HTTP 429, retry after (\d+) s", line)]
    check("R3 a process of its own sends no request to OpenAlex and names the seconds left", not any(OPENALEX in url for url in skipped["requests"]) and len(seconds) == 1 and 4340 <= seconds[0] <= 4356, repr({key: (head(value) if key == 'lines' else value) for key, value in skipped.items()}))

# R4: 429s with no Retry-After wait 2, 4 and 8 seconds, apart from the turn's waits, on a host whose gap is under 2 seconds.
with attempt("R4"):
    scratch_case()
    script = Script({OPENALEX: [says(429)]})
    with fake_clock() as clock, serving(script):
        outcome = lookup.lookup_openalex(lookup.Client({"OPENALEX_API_KEY": "key"}), IDENTIFIER)
    check("R4 retry waits of 2, 4 and 8 seconds, then the 3 retries reason", clock.sleeps == [2.0, 4.0, 8.0] and outcome.left_out == "HTTP 429 after 3 retries" and len(script.urls) == 4, repr((clock.sleeps, brief(outcome))))

# R5: the forms of Retry-After. again is True where the reply repeats, so that the schedule of waits runs out; else a 200 follows.
def ahead(seconds, zone=" GMT"):
    return lambda now: says(429, Retry_After=email.utils.formatdate(now + seconds, usegmt=True).replace(" GMT", zone))


SCHEDULE = [2.0, 4.0, 8.0]
FORMS = (
    ("a date 30 seconds ahead", ahead(30), False, [30.0], ""),
    ("a date in the past", ahead(-100), False, [1.0], ""),
    ("a date 4356 seconds ahead", ahead(4356), False, [], "HTTP 429, retry after 4356 s"),
    ("a date with no zone", ahead(30, ""), False, [30.0], ""),
    ("soon", says(429, Retry_After="soon"), True, SCHEDULE, "HTTP 429 after 3 retries"),
    ("2.5", says(429, Retry_After="2.5"), True, SCHEDULE, "HTTP 429 after 3 retries"),
    ("-5", says(429, Retry_After="-5"), True, SCHEDULE, "HTTP 429 after 3 retries"),
    ("0", says(429, Retry_After="0"), False, [1.0], ""),
    ("60", says(429, Retry_After="60"), False, [60.0], ""),
    ("61", says(429, Retry_After="61"), False, [], "HTTP 429, retry after 61 s"),
)
for name, first, again, sleeps, reason in FORMS:
    with attempt("R5 " + name):
        clock, outcome, script = crossref_run(first, first if again else says(200, CROSSREF_BODY))
        check(f"R5 {name}", clock.sleeps == sleeps and outcome.left_out == reason, repr((clock.sleeps, brief(outcome))))

# R6: a skip file that holds no time is ignored, and a huge Retry-After is capped at 86400 seconds.
with attempt("R6"):
    for text in ("not a time", "inf", "nan", ""):
        temporary, _ = scratch_case()
        with open(os.path.join(temporary, "ordo-lookup-skip-openalex"), "w") as handle:
            handle.write(text)
        script = Script({OPENALEX: [says(200, OPENALEX_BODY)]})
        with fake_clock(), serving(script):
            outcome = lookup.lookup_openalex(lookup.Client({}), IDENTIFIER)
        check(f"R6 a skip file holding {text!r} is ignored", script.asked(OPENALEX) == 1 and len(outcome.records) == 1, repr((brief(outcome), hosts_of(script))))
    temporary, _ = scratch_case()
    script = Script({OPENALEX: [says(429, Retry_After="999999999")]})
    with fake_clock() as clock, serving(script):
        start = clock.now
        outcome = lookup.lookup_openalex(lookup.Client({}), IDENTIFIER)
    check("R6 the skip file holds a time 86400 seconds ahead", [float(read_text(os.path.join(temporary, name))) for name in skip_files(temporary)] == [start + 86400] and outcome.left_out == "HTTP 429, retry after 999999999 s", repr((skip_files(temporary), start, brief(outcome))))

# R7: a Retry-After above 60 seconds from a host that is not an API host is left out with its reason and writes no skip file.
with attempt("R7"):
    temporary, _ = scratch_case()
    script = Script({"doi.org": [says(429, Retry_After="4356")]})
    with fake_clock():
        status, lines, _ = run_main(["bibtex", "10.1000/xyz"], script)
    check("R7 bibtex prints the reason of the 429", status == 1 and lines == ["doi.org: HTTP 429, retry after 4356 s, not a BibTeX entry"] and script.asked("doi.org") == 1, repr((status, head(lines), hosts_of(script))))
    check("R7 no skip file is written", skip_files(temporary) == [], repr(os.listdir(temporary)))

# R8: a skip active for OpenAlex and its reply in the cache: the cached records are printed and no reason.
with attempt("R8"):
    temporary, _ = scratch_case()
    script = Script({CROSSREF: [says(200, CROSSREF_BODY)], OPENALEX: [says(200, OPENALEX_BODY)], SEMANTIC_SCHOLAR: [says(404)]})
    with fake_clock() as clock:
        status, first_lines, _ = run_main(["resolve", DOI], script)
        with open(os.path.join(temporary, "ordo-lookup-skip-openalex"), "w") as handle:
            handle.write(repr(clock.now + 1000))
        status, lines, _ = run_main(["resolve", DOI], script)
    check("R8 the cached records are printed and no reason", lines == first_lines and not any(line.startswith("OpenAlex: left out") for line in lines) and script.asked(OPENALEX) == 1, repr((head(lines), head(first_lines), hosts_of(script))))

# R9: a 429 met on a redirect hop names the host of the hop: doi.org answers 302 to Crossref, and Crossref's skip is active, or Crossref answers 429 with a long Retry-After.
BIBTEX_REDIRECT = says(302, Location="https://api.crossref.org/v1/works/10.1103%2FPhysRevE.69.066138/transform")
with attempt("R9"):
    temporary, _ = scratch_case()
    with fake_clock() as clock:
        with open(os.path.join(temporary, "ordo-lookup-skip-crossref"), "w") as handle:
            handle.write(repr(clock.now + 500))
        script = Script({"doi.org": [BIBTEX_REDIRECT]})
        status, lines, _ = run_main(["bibtex", DOI], script)
    check("R9 a skip met on the hop to Crossref is named with its host and no request goes to Crossref", status == 1 and lines == ["doi.org: left out, HTTP 429 at api.crossref.org, retry after 500 s"] and script.asked(CROSSREF) == 0 and script.asked("doi.org") == 1, repr((status, lines, hosts_of(script))))
    temporary, _ = scratch_case()
    script = Script({"doi.org": [BIBTEX_REDIRECT], CROSSREF: [says(429, Retry_After="4356")]})
    with fake_clock():
        status, lines, _ = run_main(["bibtex", DOI], script)
    check("R9 a 429 reply on the hop to Crossref is named with its host", status == 1 and lines == ["doi.org: HTTP 429 at api.crossref.org, retry after 4356 s, not a BibTeX entry"] and script.asked(CROSSREF) == 1, repr((status, lines, hosts_of(script))))
    check("R9 the 429 of the hop writes Crossref's skip file", skip_files(temporary) == ["ordo-lookup-skip-crossref"], repr(os.listdir(temporary)))

# K1: with the cache on, the same index URL is sent once, in this process and in another.
THREE_BODIES = {CROSSREF: [says(200, CROSSREF_BODY)], OPENALEX: [says(200, OPENALEX_BODY)], SEMANTIC_SCHOLAR: [says(200, S2_BODY)]}
CHILD_BODIES = {CROSSREF: [200, CROSSREF_BODY, {}], OPENALEX: [200, OPENALEX_BODY, {}], SEMANTIC_SCHOLAR: [200, S2_BODY, {}]}
baseline = []
with attempt("K1"):
    scratch_case()
    script = Script(THREE_BODIES)
    with fake_clock():
        status, lines, _ = run_main(["resolve", DOI], script)
        sent_first = len(script.urls)
        status, again, _ = run_main(["resolve", DOI], script)
    baseline = lines
    check("K1 the first run sends one request to each index", sent_first == 3, repr(hosts_of(script)))
    check("K1 the same URLs again in the same process send nothing and print the same records", len(script.urls) == 3 and again == lines, repr((hosts_of(script), head(again), head(lines))))
    other = run_child(["resolve", DOI], CHILD_BODIES)
    check("K1 another process sends nothing and prints the same records", other["requests"] == [] and other["lines"] == lines, repr({key: (head(value) if key == 'lines' else value) for key, value in other.items()}))

# K2: what is not stored. The control is a 200 search with no result, which is stored and read back as not found.
INDEX_ONLY = [CROSSREF, OPENALEX, SEMANTIC_SCHOLAR]
with attempt("K2 404"):
    scratch_case()
    script = Script({host: [says(404)] for host in INDEX_ONLY})
    with fake_clock():
        run_main(["resolve", DOI], script)
        run_main(["resolve", DOI], script)
    check("K2 a 404 is not stored", script.asked(CROSSREF) == 2, repr(hosts_of(script)))
with attempt("K2 429"):
    scratch_case()
    script = Script({CROSSREF: [says(429)]})
    with fake_clock():
        run_main(["resolve", DOI], script)
        run_main(["resolve", DOI], script)
    check("K2 a 429 is not stored", script.asked(CROSSREF) == 8, repr(hosts_of(script)))
with attempt("K2 body"):
    scratch_case()
    script = Script({CROSSREF: [says(200, "<html>Maintenance</html>")]})
    with fake_clock():
        status, lines, _ = run_main(["resolve", DOI], script)
        run_main(["resolve", DOI], script)
    check("K2 a 200 whose body does not parse is not stored", script.asked(CROSSREF) == 2 and "Crossref: left out, HTTP 200, the body does not parse" in lines, repr((hosts_of(script), head(lines))))
with attempt("K2 host"):
    temporary, cache = scratch_case()
    script = Script({"example.org": [says(200, "{}")], CROSSREF: [says(200, "{}")]})
    with fake_clock(), serving(script):
        client = lookup.Client(os.environ, cache=True)
        for _ in range(2):
            lookup.get_parsed(client, "https://example.org/x", json.loads)
        check("K2 a 200 from a host that is not one of the four is not stored", script.asked("example.org") == 2, repr(hosts_of(script)))
        for _ in range(2):
            lookup.get_parsed(client, "https://api.crossref.org/works/x", json.loads)
        check("K2 control: a 200 from an API host is stored", script.asked(CROSSREF) == 1, repr(hosts_of(script)))
with attempt("K2 bibtex"):
    scratch_case()
    script = Script({ARXIV: [says(200, ARXIV_FEED)]})
    with fake_clock():
        run_main(["bibtex", "2511.18945"], script)
        run_main(["bibtex", "2511.18945"], script)
    check("K2 bibtex of an arXiv ID neither reads nor writes the cache", script.asked(ARXIV) == 2, repr(hosts_of(script)))
with attempt("K2 check-urls"):
    temporary, _ = scratch_case()
    tex = put("k2/main.tex", "Text \\cite{k}.\n")
    bib = put("k2/refs.bib", DOI_ENTRY)
    script = Script({"doi.org": [says(200)], CROSSREF: [says(200, CROSSREF_BODY)]})
    with fake_clock():
        status, lines, _ = run_main(["check-urls", tex, bib], script)
        run_main(["check-urls", tex, bib], script)
    check("K2 the title check of check-urls neither reads nor writes the cache", script.asked(CROSSREF) == 2 and lines == [f"k: 200 {DOI_URL}, ratio 1.00 against Crossref"], repr((hosts_of(script), head(lines))))
with attempt("K2 fetch"):
    temporary, _ = scratch_case()
    folder = put("k2/fetched/.keep", "")
    script = Script({OPENALEX: [says(200, OPENALEX_BODY)], SEMANTIC_SCHOLAR: [says(200, S2_BODY)]})
    with fake_clock():
        run_main(["fetch", DOI, os.path.dirname(folder), "k"], script)
        run_main(["fetch", DOI, os.path.dirname(folder), "k"], script)
    check("K2 fetch neither reads nor writes the cache", script.asked(OPENALEX) == 2 and script.asked(SEMANTIC_SCHOLAR) == 2, repr(hosts_of(script)))
with attempt("K2 no result"):
    scratch_case()
    script = Script({host: [says(200, body)] for host, body in NO_RESULT.items()})
    with fake_clock():
        status, lines, _ = run_main(["search", "zzz"], script)
        sent = len(script.urls)
        status, again, _ = run_main(["search", "zzz"], script)
    check("K2 a 200 search with no result is stored and read back as not found", sent == 4 and len(script.urls) == 4 and again == lines == ["Crossref: not found", "OpenAlex: not found", "Semantic Scholar: not found", "arXiv: not found"], repr((hosts_of(script), head(lines), head(again))))

# K3: an entry older than 30 days is not used and is replaced, and the first store removes entries older than 30 days and temporary files older than 1 day.
DAY = 86400
with attempt("K3 age"):
    scratch_case()
    script = Script(THREE_BODIES)
    with fake_clock() as clock:
        start = clock.now
        run_main(["resolve", DOI], script)
        clock.now = start + 30 * DAY - 1
        run_main(["resolve", DOI], script)
        check("K3 an entry of 30 days less a second is used", len(script.urls) == 3, repr(hosts_of(script)))
        clock.now = start + 30 * DAY + 1
        run_main(["resolve", DOI], script)
        check("K3 an entry older than 30 days is not used", len(script.urls) == 6, repr(hosts_of(script)))
        clock.now = start + 30 * DAY + 2
        run_main(["resolve", DOI], script)
        check("K3 the old entry was replaced by the new reply", len(script.urls) == 6, repr(hosts_of(script)))
with attempt("K3 pruning"):
    temporary, cache = scratch_case()
    os.makedirs(cache, mode=0o700)
    script = Script(THREE_BODIES)
    with fake_clock() as clock:
        planted = {"a" * 64: 31 * DAY, "b" * 64: 29 * DAY, "tmp.old": 2 * DAY, "tmp.young": 3600}
        for name, age in planted.items():
            path = os.path.join(cache, name)
            with open(path, "w") as handle:
                handle.write("{}")
            os.utime(path, (clock.now - age, clock.now - age))
        run_main(["resolve", DOI], script)
    left = {name for name in planted if os.path.exists(os.path.join(cache, name))}
    check("K3 the first store removes the entry older than 30 days and the temporary file older than 1 day only", left == {"b" * 64, "tmp.young"}, repr(sorted(os.listdir(cache))))

# K4: no file of the cache folder or the temporary folder holds a credential.
with attempt("K4"):
    secrets = {"S2_API_KEY": "s2-marker-one", "OPENALEX_API_KEY": "oa-marker-two", "CROSSREF_POLITE_EMAIL": "cr-marker-three@example.org"}
    temporary, cache = scratch_case(secrets)
    script = Script(THREE_BODIES)
    with fake_clock():
        run_main(["resolve", DOI], script)
        script = Script({OPENALEX: [says(429, Retry_After="4356")], CROSSREF: [says(404)], SEMANTIC_SCHOLAR: [says(404)]})
        run_main(["search", "marker query"], script)
    sent_with_secrets = any("oa-marker-two" in url for url in script.urls)
    found = [path for path in files_under(os.path.dirname(cache)) + files_under(temporary) for value in ("s2-marker-one", "oa-marker-two", "cr-marker-three") if value in path or value.encode() in read_bytes(path)]
    check("K4 the requests did carry the credentials", sent_with_secrets, repr(hosts_of(script)))
    check("K4 the cache holds the three entries and the skip file is the one of the key", len(listing(cache)) == 3 and skip_files(temporary) == ["ordo-lookup-skip-openalex-key"], repr((skip_files(temporary), listing(cache))))
    check("K4 no file holds a credential", found == [], repr(found))

# K5: a cache that cannot be used leaves the output as it is, with no error line.
with attempt("K5"):
    for what in ("folder that cannot be made", "folder that cannot be written", "invalid entries", "temporary files"):
        temporary, cache = scratch_case()
        script = Script(THREE_BODIES)
        with fake_clock():
            if what == "folder that cannot be made":
                blocker = os.path.join(temporary, "a-file")
                with open(blocker, "w") as handle:
                    handle.write("x")
                os.environ["XDG_CACHE_HOME"] = os.path.join(blocker, "inside")
            elif what == "folder that cannot be written":
                os.makedirs(cache, mode=0o700)
                os.chmod(cache, 0o500)
            else:
                run_main(["resolve", DOI], Script(THREE_BODIES))
                check(f"K5 {what}: the cache held the entries", len(listing(cache)) == 3, repr(listing(cache)))
                for name in listing(cache):
                    path = os.path.join(cache, name)
                    if what == "invalid entries":
                        with open(path, "w") as handle:
                            handle.write("{")
                    else:
                        os.rename(path, os.path.join(cache, "tmp." + name))
            try:
                status, lines, err = run_main(["resolve", DOI], script)
            finally:
                if what == "folder that cannot be written":
                    os.chmod(cache, 0o700)
        if what == "folder that cannot be written":
            check(f"K5 {what}: no entry was written", listing(cache) == [], repr(listing(cache)))
        check(f"K5 {what}: the request is sent and the output is the uncached output", len(script.urls) == 3 and lines == baseline and err == "", repr((hosts_of(script), head(lines), head(baseline), err)))

# K6: the cache folder is under an absolute XDG_CACHE_HOME, else under ~/.cache.
with attempt("K6"):
    for what in ("absolute", "relative", "unset", "empty"):
        temporary, cache = scratch_case()
        home = os.path.join(os.path.dirname(temporary), "home")
        elsewhere = os.path.join(os.path.dirname(temporary), "elsewhere")
        os.makedirs(elsewhere)
        real_home, real_directory = os.environ["HOME"], os.getcwd()
        try:
            os.environ["HOME"] = home
            os.chdir(elsewhere)
            if what == "relative":
                os.environ["XDG_CACHE_HOME"] = "relative-cache"
            elif what == "unset":
                del os.environ["XDG_CACHE_HOME"]
            elif what == "empty":
                os.environ["XDG_CACHE_HOME"] = ""
            with fake_clock():
                run_main(["resolve", DOI], Script(THREE_BODIES))
        finally:
            os.environ["HOME"] = real_home
            os.chdir(real_directory)
        wanted = cache if what == "absolute" else os.path.join(home, ".cache", "ordo-lookup")
        check(f"K6 {what} XDG_CACHE_HOME: the entries are under {os.path.relpath(wanted, os.path.dirname(temporary))}", len(listing(wanted)) == 3 and os.listdir(elsewhere) == [], repr((wanted, listing(wanted), os.listdir(elsewhere))))

# K7: the cache folder has mode 700, and each entry, skip file and lock file mode 600.
with attempt("K7"):
    real_mask = os.umask(0)
    try:
        temporary, cache = scratch_case()
        with fake_clock():
            run_main(["resolve", DOI], Script(THREE_BODIES))
            run_main(["search", "mode query"], Script({OPENALEX: [says(429, Retry_After="4356")]}))
    finally:
        os.umask(real_mask)
    entries = [os.path.join(cache, name) for name in listing(cache)]
    locks = [os.path.join(temporary, name) for name in os.listdir(temporary)]
    check("K7 the cache folder has mode 700", mode_of(cache) == 0o700, repr(mode_of(cache)))
    check("K7 each entry, skip file and lock file has mode 600", len(entries) == 3 and locks and all(mode_of(path) == 0o600 for path in entries + locks) and len(skip_files(temporary)) == 1, repr([(path, mode_of(path)) for path in entries + locks]))


for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: lookup.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, reads the keys a .tex cites with the commands of natbib and biblatex and the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, reports an input file that does not exist, reads the .bib named on the command line in check-urls and quote-check, refuses the one-argument check-urls and the two-argument quote-check, prints the retraction and expression-of-concern notices of a Crossref record and none for a correction, an erratum or a work without a notice, and resolves an entry of a .bib by its doi, its arXiv ID or its title and prints a verdict that CONFIRMED or NOT_CONFIRMED the entry with exit status 0 or 1, refuses a call or an entry it cannot read with exit status 2, and leaves the output of resolve without --entry as it was, paces every API host across processes, waits out a 429 by its Retry-After, leaves a 429 that names more than 60 seconds out at once with its reason, names the host of a redirect hop that met it, and writes the skip file of the host, and caches the index replies of resolve, search, refs and cited-by on disk for 30 days"
