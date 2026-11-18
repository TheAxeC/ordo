#!/bin/sh
# Offline proof of the parts of lookup.py that compute facts without the network: title matching, the choice among candidates, the DOI mismatch flag, record merging, passage lines, passage normalisation, abstract reassembly, the arXiv query syntax, the OpenAlex query text, the arXiv spacing across processes, the arXiv turn of every request to an arXiv host, the refusal of a URL other than http and https, an index whose body does not parse, the not found lines, the file name made from a key, the DOI in a URL, the PDF and arXiv HTML tests, the credentials each host gets, the URL check-urls requests, the BibTeX of an arXiv record, the BibTeX body test, the text of an HTML page, fetch given an OpenAlex ID or a Semantic Scholar ID (the record asked of that ID's index alone, a record with a DOI fetched as that DOI, and a record with neither its open-access URL tried and that index's abstract written), the keys a .tex cites with the commands of natbib and biblatex and the files it inputs, the output of cite-keys, the title check of check-urls against the record a doi resolves to, the error line for an input file that does not exist, the .bib check-urls names and the .bib quote-check reads, both the one named on the command line, the refusal of the one-argument form of check-urls and of the two-argument form of quote-check, the retraction and expression-of-concern notice lines of resolve, and resolve --entry: the entry read from a .bib (a doi or DOI field, a space before the @, the first of two entries with one key), the input it resolves by (its doi, else its arXiv ID, else its title with its year), the verdict line that confirms the entry by the first record whose title and year agree and prints NOT_CONFIRMED for a year or a title that differs, a record with no year and an entry no index holds, its exit status, the one-line error and exit status 2 for a call or an entry it cannot read, and resolve without --entry printing what it printed. It proves the published version of an arXiv ID: bibtex printing the entry alone on standard output and every other line on standard error, the entry doi.org gives for a published DOI that Semantic Scholar or OpenAlex names and whose record's title agrees, the @misc entry with its reason for a DOI whose title is below 0.70, a doi.org that gives no entry and every index left out, the line that names a conference or journal of Semantic Scholar with no DOI and none for an arXiv venue or another type, bibtex --page building the @inproceedings entry from the citation tags of a PMLR or NeurIPS page and refusing a page with no title tag, no year tag, a title below 0.70, a 404, a redirect to arXiv or doi.org or a file URL, resolve --entry confirming an entry on its venue page and naming the reason it does not, with no page read for an @misc entry, an entry with a doi, an entry a record confirms or a url on arXiv or doi.org, fetch --page reading the PDF a page names before arxiv.org, the URLs resolve, search, refs, cited-by and fetch request, which stay the keys of the cache, the line of resolve that names the PMCID an OpenAlex record holds, and text: the text of a saved PMC page, Europe PMC body and PDF written as <stem>.txt and found by quote-check, the text of a page that holds only the abstract written by text --abstract as <stem>.abstract.txt and found by quote-check with the locator abstract, a declared charset, a byte order mark and an XML declaration before the root, pdftotext given one absolute path through a stand-in written on PATH, its failure and its absence, and the refusal of an existing or linked <stem>.txt or <stem>.abstract.txt, of a body that is neither HTML or XML nor a PDF, of a missing file, an empty key and a folder that is not a folder. It proves that bibtex prints every entry in ASCII by each of its three builders (the doi.org entry, the @misc entry of an arXiv record and the entry of a venue's page): an accented letter as its accent command, also from a decomposed letter, the letters, Greek letters and signs of the table in their LaTeX forms, an en dash as two hyphens, a character with no form as {?} with its warning line and exit status 0, an ASCII value unchanged, the key in ASCII and a url percent-encoded, and that resolve --entry and the title check of check-urls give a converted entry the verdict and ratio of the original. It also proves the pacing of each index across processes (the gap of each host with and without its credential, a redirect that takes the turn of the host it goes to, doi.org that takes none, a lock file that holds inf or nan), a 429 waited out by the Retry-After it names in each form it can take, the 429 that names more than 60 seconds left out at once with its reason and the skip file of its host (named by host and credential, mode 600, capped at 86400 seconds, ignored when it holds no time, read by a request that no cached reply answers, and never written for a host that is not an API host), the reasons bibtex prints for a 429, the host a reason names when the 429 is met on a redirect hop, and the reply cache of resolve, search, refs and cited-by (a reply sent once for the same URL in one process and in another, the replies that are not stored, the 30 days, the pruning, no credential in any file, a cache folder that cannot be made or written, an entry that cannot be used, the cache folder under XDG_CACHE_HOME or under HOME, the modes of its files). Every case runs on scratch temporary, cache and home folders set before lookup is imported, with time.sleep and time.time stubbed together as one clock where a wait is checked. Response bodies are recorded below in the shapes the indexes answer. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
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
# bibtex writes the entry to its output lines and every other line to its notes, which main prints on standard error.
try:
    lines, notes = [], []
    status = lookup.run_bibtex(StubClient([("doi.org", stub_reply(200, " @article{k, title={T}}\n", "application/x-bibtex"))]), ["10.1000/xyz"], lines, notes)
    check("BibTeX body is printed as given", status == 0 and lines == [" @article{k, title={T}}"] and notes == [], repr((lines, notes)))
    lines, notes = [], []
    status = lookup.run_bibtex(StubClient([("doi.org", stub_reply(200, HTML_BODY, "text/html"))]), ["10.1000/xyz"], lines, notes)
    check("a body that is not BibTeX", status == 1 and lines == [] and notes == ["doi.org: HTTP 200, not a BibTeX entry"], repr((lines, notes)))
except Exception as error:
    failures.append(f"bibtex notes raised {type(error).__name__}: {error}")

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
arxiv_doi = "10.48550/arXiv.2511.18945"
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
shannon_replies = [("api.crossref.org", crossref_work("10.1002/j.1538-7305.1948.tb01338.x", "A Mathematical Theory of Communication", 1948))]
result = entry_run(entry_bib("Shannon_1948", "A Mathematical Theory of Communication", "1948", doi="10.1002/j.1538-7305.1948.tb01338.x"), "Shannon_1948", shannon_replies)
check("E1 the verdict line", result[0] == 0 and result[1][-1:] == ["Shannon_1948: CONFIRMED against Crossref, ratio 1.00, year 1948"], repr(result))
check("E1 the lines resolve prints come first", result[1][:-1] == plain_resolve(shannon_replies, "10.1002/j.1538-7305.1948.tb01338.x") and len(result[1]) == 5, repr(result))

# E2: Crossref's record lacks the subtitle (ratio below 0.70) and OpenAlex's record has it, so the first record that agrees is OpenAlex's.
long_title = "XGBoost: A Scalable Tree Boosting System"
chen_replies = [("api.crossref.org", crossref_work("10.1145/2939672.2939785", "XGBoost", 2016)), ("api.openalex.org", openalex_work("10.1145/2939672.2939785", long_title, 2016))]
result = entry_run(entry_bib("Chen_2016", long_title, "2016", doi="10.1145/2939672.2939785"), "Chen_2016", chen_replies)
check("E2 the first record that agrees", result[0] == 0 and result[1][-1] == "Chen_2016: CONFIRMED against OpenAlex, ratio 1.00, year 2016", repr(result))

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
check("E12 resolve of a DOI has no verdict line", not any("CONFIRMED" in line for line in plain_resolve(shannon_replies, "10.1002/j.1538-7305.1948.tb01338.x")))

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
    for host, url, gap in ((CROSSREF, "https://api.crossref.org/works/10.1000/x", 1.0), (OPENALEX, "https://api.openalex.org/works/doi:10.1000/x", 1.05), (SEMANTIC_SCHOLAR, "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/x", 2.0)):
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
    (SEMANTIC_SCHOLAR, "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/x", {}, 2.0),
    (SEMANTIC_SCHOLAR, "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1000/x", {"S2_API_KEY": "key"}, 2.0),
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
        status, lines, err = run_main(["bibtex", "10.1000/xyz"], script)
    check("R7 bibtex prints the reason of the 429 on standard error", status == 1 and lines == [] and err.splitlines() == ["doi.org: HTTP 429, retry after 4356 s, not a BibTeX entry"] and script.asked("doi.org") == 1, repr((status, head(lines), err, hosts_of(script))))
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
        status, lines, err = run_main(["bibtex", DOI], script)
    check("R9 a skip met on the hop to Crossref is named with its host and no request goes to Crossref", status == 1 and lines == [] and err.splitlines() == ["doi.org: left out, HTTP 429 at api.crossref.org, retry after 500 s"] and script.asked(CROSSREF) == 0 and script.asked("doi.org") == 1, repr((status, lines, err, hosts_of(script))))
    temporary, _ = scratch_case()
    script = Script({"doi.org": [BIBTEX_REDIRECT], CROSSREF: [says(429, Retry_After="4356")]})
    with fake_clock():
        status, lines, err = run_main(["bibtex", DOI], script)
    check("R9 a 429 reply on the hop to Crossref is named with its host", status == 1 and lines == [] and err.splitlines() == ["doi.org: HTTP 429 at api.crossref.org, retry after 4356 s, not a BibTeX entry"] and script.asked(CROSSREF) == 1, repr((status, lines, err, hosts_of(script))))
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

# F1 and F2: fetch given an OpenAlex ID asks OpenAlex alone for the work's record, and given a Semantic Scholar ID asks Semantic Scholar alone. A record that gives a DOI is fetched as that DOI is: the requests after the record's are those of a fetch of the DOI. A record with neither a DOI nor an arXiv ID has its open-access URL tried, and with no full text the abstract of that index is written as <stem>.abstract.txt and the exit status is 1.
OPENALEX_WORK_URL = "https://api.openalex.org/works/W2004163325?select=" + lookup.OPENALEX_FIELDS + ",abstract_inverted_index"
S2_PAPER_ID = "0123456789abcdef0123456789abcdef01234567"
S2_PAPER_URL = "https://api.semanticscholar.org/graph/v1/paper/" + S2_PAPER_ID + "?fields=" + lookup.S2_FIELDS + ",abstract"
OPENALEX_NO_DOI_BODY = OPENALEX_BODY.replace('"doi":"https://doi.org/10.1103/physreve.69.066138"', '"doi":null').replace('"oa_url":null', '"oa_url":"https://example.org/oa.pdf"')
S2_NO_DOI_BODY = """{"paperId":"0123456789abcdef0123456789abcdef01234567","title":"Estimating mutual information","year":2004,"venue":"Physical Review E",
"authors":[{"name":"A. Kraskov"}],"externalIds":{"CorpusId":7},"openAccessPdf":{"url":"https://example.org/s2.pdf"},"abstract":"We estimate  mutual information."}"""


def fetch_run(arguments, replies):
    """(exit status, lines, URLs asked, the files of the folder with their text) of one fetch into a new scratch folder, answered from replies."""
    scratch_case()
    folder = os.path.dirname(put("fetch%d/.keep" % next(case_numbers), ""))
    script = Script(replies)
    with fake_clock():
        status, lines, err = run_main(["fetch", arguments[0], folder, arguments[1]], script)
    files = {name: read_text(os.path.join(folder, name)) for name in listing(folder) if name != ".keep"}
    return status, lines + ([err.strip()] if err.strip() else []), script.urls, files


for case, given, record_url, replies, as_doi in (
    ("F1", "W2004163325", OPENALEX_WORK_URL, {OPENALEX: [says(200, OPENALEX_BODY)], SEMANTIC_SCHOLAR: [says(200, S2_BODY)]}, "10.1103/physreve.69.066138"),
    ("F2", S2_PAPER_ID, S2_PAPER_URL, {SEMANTIC_SCHOLAR: [says(200, S2_BODY)], OPENALEX: [says(200, OPENALEX_BODY)]}, "10.1103/PhysRevE.69.066138"),
):
    with attempt(f"{case} with a DOI"):
        status, lines, urls, files = fetch_run([given, "k"], replies)
        doi_status, doi_lines, doi_urls, doi_files = fetch_run([as_doi, "k"], replies)
        check(f"{case} with a DOI: the record is asked of its own index first", urls[:1] == [record_url], repr((urls, lines)))
        check(f"{case} with a DOI: the requests after the record are those of a fetch of the DOI", urls[1:] == doi_urls, repr((urls, doi_urls, lines)))
        check(f"{case} with a DOI: the exit status and the files are those of the DOI", status == doi_status == 1 and files == doi_files and "k.abstract.txt" in files, repr((status, doi_status, files, lines)))
for case, given, record_url, replies, oa_url, abstract in (
    ("F1", "W2004163325", OPENALEX_WORK_URL, {OPENALEX: [says(200, OPENALEX_NO_DOI_BODY)], "example.org": [says(200, "<html>a landing page</html>")]}, "https://example.org/oa.pdf", "mutual information is shared information"),
    ("F2", S2_PAPER_ID, S2_PAPER_URL, {SEMANTIC_SCHOLAR: [says(200, S2_NO_DOI_BODY)], "example.org": [says(200, "<html>a landing page</html>")]}, "https://example.org/s2.pdf", "We estimate mutual information."),
):
    with attempt(f"{case} with neither"):
        status, lines, urls, files = fetch_run([given, "k"], replies)
        check(f"{case} with neither: the record, then its open-access URL, and no other request", urls == [record_url, oa_url], repr((urls, lines)))
        check(f"{case} with neither: the abstract of that index is written and the exit status is 1", status == 1 and files == {"k.abstract.txt": abstract + "\n"}, repr((status, files, lines)))
        check(f"{case} with neither: the URL tried is printed", any(line.startswith(f"tried {oa_url}: ") for line in lines), repr(lines))


# The published version of an arXiv ID. The bodies are recorded from the answers for Gradient Descent Finds Global Minima of Deep Neural Networks (arXiv 1811.03804, ICML 2019) and Attention Is All You Need (arXiv 1706.03762, NeurIPS 2017), shortened. PUBLISHED_DOI, PUBLISHED_ENTRY and the body of crossref_published are made up, since the ICML paper has no published DOI of its own.
ICML_ID = "1811.03804"
ICML_TITLE = "Gradient Descent Finds Global Minima of Deep Neural Networks"
ICML_FEED = """<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xmlns:arxiv="http://arxiv.org/schemas/atom">
<entry><id>http://arxiv.org/abs/1811.03804v4</id><published>2018-11-09T07:39:59Z</published>
<title>Gradient Descent Finds Global Minima of Deep Neural Networks</title>
<summary>Gradient descent finds a global minimum in training deep neural networks despite the objective function being non-convex.</summary>
<author><name>Simon S. Du</name></author><author><name>Jason D. Lee</name></author><author><name>Haochuan Li</name></author>
<author><name>Liwei Wang</name></author><author><name>Xiyu Zhai</name></author></entry></feed>"""
ICML_MISC = [
    "@misc{arxiv_1811_03804,",
    "  title = {" + ICML_TITLE + "},",
    "  author = {Simon S. Du and Jason D. Lee and Haochuan Li and Liwei Wang and Xiyu Zhai},",
    "  year = {2018},",
    "  eprint = {1811.03804},",
    "  archivePrefix = {arXiv}",
    "}",
]
ICML_VENUE = {"id": "fc0a208c-acb7-47dc-a0d4-af8190e21d29", "name": "International Conference on Machine Learning", "type": "conference", "alternate_names": ["ICML", "Int Conf Mach Learn"]}


def s2_published(doi="10.48550/arXiv.1811.03804", venue=ICML_VENUE, title=ICML_TITLE, year=2018, paper_id="03e7e8663c69e691be6b6403b1eb1bbf593d31f2", arxiv_id=ICML_ID, corpus_id=53250419):
    """Semantic Scholar's answer for paper/ARXIV:<id> with the fields of the published version."""
    paper = {"paperId": paper_id, "title": title, "year": year, "externalIds": {"ArXiv": arxiv_id, "DOI": doi, "CorpusId": corpus_id}}
    if venue is not ...:
        paper["publicationVenue"] = venue
    return says(200, json.dumps(paper))


def openalex_published(doi="https://doi.org/10.48550/arxiv.1811.03804", landing=()):
    """OpenAlex's answer for works/doi:10.48550/arXiv.<id> with the fields of the published version."""
    locations = [{"landing_page_url": "http://arxiv.org/abs/1811.03804", "doi": None}] + [{"landing_page_url": url, "doi": None} for url in landing]
    return says(200, json.dumps({"id": "https://openalex.org/W2899790086", "title": ICML_TITLE, "doi": doi, "locations": locations}))


PUBLISHED_DOI = "10.1109/x.2020.1"
PUBLISHED_ENTRY = "@inproceedings{Du_2019, title={Gradient Descent Finds Global Minima of Deep Neural Networks}, booktitle={Proceedings of X}, year={2019}}"


def crossref_published(title=ICML_TITLE):
    return says(200, json.dumps({"status": "ok", "message": {"DOI": PUBLISHED_DOI, "title": [title], "issued": {"date-parts": [[2019]]}, "container-title": ["Proceedings of X"]}}))


def bibtex_main(arguments, replies):
    """(exit status, standard output lines, standard error lines, URLs asked) of lookup.py bibtex in this process, answered from replies, on a new scratch folder."""
    scratch_case()
    script = Script(replies)
    with fake_clock():
        status, lines, err = run_main(["bibtex"] + arguments, script)
    return status, lines, err.splitlines(), script.urls


VENUE_LINE = "published in International Conference on Machine Learning (conference) per Semantic Scholar, with no DOI named by Semantic Scholar or OpenAlex: lookup.py bibtex 1811.03804 --page <the venue's page of the work>"

with attempt("V1"):
    result = bibtex_main([ICML_ID], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published()], OPENALEX: [openalex_published()]})
    check("V1 a conference named by Semantic Scholar with no published DOI: the @misc entry and the published in line", result[:3] == (0, ICML_MISC, [VENUE_LINE]), repr(result))
with attempt("V1b"):
    result = bibtex_main(["10.48550/arXiv.1811.03804"], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published()], OPENALEX: [openalex_published()]})
    check("V1b the arXiv DOI is read as its arXiv ID", result[:3] == (0, ICML_MISC, [VENUE_LINE]), repr(result))
with attempt("V2"):
    replies = {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(doi=PUBLISHED_DOI), says(404)], OPENALEX: [openalex_published(), says(404)], CROSSREF: [crossref_published()], "doi.org": [says(200, PUBLISHED_ENTRY, Content_Type="application/x-bibtex")]}
    result = bibtex_main([ICML_ID], replies)
    check("V2 a published DOI named by Semantic Scholar whose record matches: the entry doi.org gives", result[:3] == (0, [PUBLISHED_ENTRY], []), repr(result))
    check("V2 the entry is asked of doi.org for the published DOI", "https://doi.org/" + PUBLISHED_DOI in result[3], repr(result[3]))
with attempt("V3"):
    replies = {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(doi=PUBLISHED_DOI, venue=...), says(404)], OPENALEX: [openalex_published(), says(404)], CROSSREF: [crossref_published("A survey of protein folding kinetics")], "doi.org": [says(200, PUBLISHED_ENTRY)]}
    result = bibtex_main([ICML_ID], replies)
    check("V3 a published DOI whose record's title is below 0.70: the @misc entry and no request to doi.org", result[0] == 0 and result[1] == ICML_MISC and not any("doi.org" in url for url in result[3]), repr(result))
with attempt("V4"):
    for name, openalex in (("doi", openalex_published(doi="https://doi.org/" + PUBLISHED_DOI)), ("landing page", openalex_published(landing=["https://doi.org/" + PUBLISHED_DOI]))):
        replies = {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(venue=...), says(404)], OPENALEX: [openalex, says(404)], CROSSREF: [crossref_published()], "doi.org": [says(200, PUBLISHED_ENTRY)]}
        result = bibtex_main([ICML_ID], replies)
        check("V4 a published DOI named by OpenAlex's " + name + ": the entry doi.org gives", result[:3] == (0, [PUBLISHED_ENTRY], []), repr(result))
with attempt("V5"):
    replies = {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(doi=PUBLISHED_DOI), says(404)], OPENALEX: [openalex_published(), says(404)], CROSSREF: [crossref_published()], "doi.org": [says(404)]}
    result = bibtex_main([ICML_ID], replies)
    check("V5 doi.org answers 404 for the published DOI: the @misc entry and the reason", result[:3] == (0, ICML_MISC, ["published DOI 10.1109/x.2020.1: doi.org HTTP 404"]), repr(result))
with attempt("V6"):
    replies = {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(doi=PUBLISHED_DOI), says(500)], OPENALEX: [openalex_published(), says(500)], CROSSREF: [says(429)], "doi.org": [says(200, PUBLISHED_ENTRY)]}
    result = bibtex_main([ICML_ID], replies)
    check("V6 every index left out for the published DOI's record: the @misc entry and one line per index", result[:3] == (0, ICML_MISC, ["Crossref: left out, HTTP 429 after 3 retries", "OpenAlex: left out, HTTP 500", "Semantic Scholar: left out, HTTP 500"]), repr(result))
with attempt("V7"):
    replies = {ARXIV: [says(429)], SEMANTIC_SCHOLAR: [s2_published(doi=PUBLISHED_DOI), says(404)], OPENALEX: [openalex_published(), says(404)], CROSSREF: [crossref_published()], "doi.org": [says(200, PUBLISHED_ENTRY)]}
    result = bibtex_main([ICML_ID], replies)
    check("V7 arXiv left out: the published DOI's record is compared with Semantic Scholar's title", result[0] == 0 and result[1] == [PUBLISHED_ENTRY], repr(result))
    replies = {ARXIV: [says(429)], SEMANTIC_SCHOLAR: [s2_published(venue=...)], OPENALEX: [openalex_published()]}
    result = bibtex_main([ICML_ID], replies)
    check("V7 arXiv left out and no published DOI: exit status 1 and the arXiv line", result[0] == 1 and result[1] == [] and result[2] == ["arXiv: left out, HTTP 429 after 3 retries"], repr(result))
with attempt("V8"):
    for name, venue in (("named arXiv.org", {"name": "arXiv.org", "type": "journal", "alternate_names": ["ArXiv"]}), ("an alternate name ArXiv", {"name": "e-prints", "type": "journal", "alternate_names": ["ArXiv"]}), ("of type null", {"name": "International Conference on Machine Learning", "type": None}), ("of no type", {"name": "International Conference on Machine Learning"}), ("of another type", {"name": "International Conference on Machine Learning", "type": "repository"})):
        result = bibtex_main([ICML_ID], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(venue=venue)], OPENALEX: [openalex_published()]})
        check("V8 a venue " + name + ": no published in line", result[:3] == (0, ICML_MISC, []), repr(result))
with attempt("V9"):
    result = bibtex_main([ICML_ID], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published(venue=...)], OPENALEX: [openalex_published()]})
    check("V9 no published DOI and no venue: the @misc entry as it was, nothing on standard error", result[:3] == (0, ICML_MISC, []), repr(result))
with attempt("V10"):
    result = bibtex_main([ICML_ID], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [says(429)], OPENALEX: [openalex_published()]})
    check("V10 Semantic Scholar left out: the @misc entry and its line", result[:3] == (0, ICML_MISC, ["Semantic Scholar: left out, HTTP 429 after 3 retries"]), repr(result))
with attempt("V11"):
    result = bibtex_main(["10.1000/xyz"], {"doi.org": [says(200, " @article{k, title={T}}\n", Content_Type="application/x-bibtex")]})
    check("V11 bibtex of a DOI that is not an arXiv DOI asks doi.org alone and prints its entry", result == (0, [" @article{k, title={T}}"], [], ["https://doi.org/10.1000/xyz"]), repr(result))

PMLR_URL = "https://proceedings.mlr.press/v97/du19c.html"
PMLR_PAGE = """<!DOCTYPE html><html><head>
<meta name="citation_publisher" content="PMLR"/>
<meta name="citation_title" content="Gradient Descent Finds Global Minima of Deep Neural Networks"/>
<meta name="citation_pdf_url" content="http://proceedings.mlr.press/v97/du19c/du19c.pdf">
<meta name="citation_firstpage" content="1675">
<meta name="citation_lastpage" content="1685">
<meta name="citation_author" content="Simon Du">
<meta name="citation_author" content="Jason Lee">
<meta name="citation_author" content="Haochuan Li">
<meta name="citation_author" content="Liwei Wang">
<meta name="citation_author" content="Xiyu Zhai">
<meta name="citation_publication_date" content="2019/05/24">
<meta name="citation_conference_title" content="International Conference on Machine Learning"/>
</head><body><h1>Gradient Descent Finds Global Minima of Deep Neural Networks</h1><p>Proceedings of the 36th International Conference on Machine Learning, PMLR 97:1675-1685, 2019.</p></body></html>"""
PMLR_HOST = "proceedings.mlr.press"
ICML_INPROCEEDINGS = [
    "@inproceedings{arxiv_1811_03804,",
    "  title = {" + ICML_TITLE + "},",
    "  author = {Simon Du and Jason Lee and Haochuan Li and Liwei Wang and Xiyu Zhai},",
    "  booktitle = {International Conference on Machine Learning},",
    "  year = {2019},",
    "  pages = {1675--1685},",
    "  url = {" + PMLR_URL + "},",
    "  eprint = {1811.03804},",
    "  archivePrefix = {arXiv}",
    "}",
]
NEURIPS_FEED = """<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xmlns:arxiv="http://arxiv.org/schemas/atom">
<entry><id>http://arxiv.org/abs/1706.03762v7</id><published>2017-06-12T17:57:34Z</published>
<title>Attention Is All You Need</title>
<summary>The dominant sequence transduction models are based on complex recurrent or convolutional neural networks in an encoder-decoder configuration.</summary>
<author><name>Ashish Vaswani</name></author><author><name>Noam Shazeer</name></author><author><name>Niki Parmar</name></author><author><name>Jakob Uszkoreit</name></author>
<author><name>Llion Jones</name></author><author><name>Aidan N. Gomez</name></author><author><name>Lukasz Kaiser</name></author><author><name>Illia Polosukhin</name></author></entry></feed>"""
NEURIPS_URL = "https://proceedings.neurips.cc/paper_files/paper/2017/hash/3f5ee243547dee91fbd053c1c4a845aa-Abstract.html"
NEURIPS_PAGE = """<html><head><meta name="citation_title" content="Attention is All you Need">
<meta name="citation_author" content="Vaswani, Ashish">
<meta name="citation_author" content="Shazeer, Noam">
<meta name="citation_journal_title" content="Advances in Neural Information Processing Systems">
<meta name="citation_volume" content="30">
<meta name="citation_pdf_url" content="https://proceedings.neurips.cc/paper_files/paper/2017/file/3f5ee243547dee91fbd053c1c4a845aa-Paper.pdf">
<meta name="citation_publication_date" content="2017"></head><body></body></html>"""
NEURIPS_VENUE = {"id": "d9720b90-d60b-48bc-9df8-87a30b9a60dd", "name": "Neural Information Processing Systems", "type": "conference", "alternate_names": ["Neural Inf Process Syst", "NeurIPS", "NIPS"]}


def page_reply(page):
    return says(200, page, Content_Type="text/html; charset=utf-8")


with attempt("V12"):
    result = bibtex_main([ICML_ID, "--page", PMLR_URL], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published()], PMLR_HOST: [page_reply(PMLR_PAGE)]})
    check("V12 --page on the PMLR page: the @inproceedings entry of the published version", result[:3] == (0, ICML_INPROCEEDINGS, []), repr(result))
with attempt("V13"):
    replies = {ARXIV: [says(200, NEURIPS_FEED)], SEMANTIC_SCHOLAR: [s2_published(doi="10.48550/arXiv.1706.03762", venue=NEURIPS_VENUE, title="Attention is All you Need", year=2017, paper_id="204e3073870fae3d05bcbc2f6a8e263d9b72e776", arxiv_id="1706.03762", corpus_id=13756489)], "proceedings.neurips.cc": [page_reply(NEURIPS_PAGE)]}
    result = bibtex_main(["1706.03762", "--page", NEURIPS_URL], replies)
    check("V13 --page on the NeurIPS page with a conference named by Semantic Scholar: @inproceedings with the journal title as booktitle", result[0] == 0 and result[1][:1] == ["@inproceedings{arxiv_1706_03762,"] and "  booktitle = {Advances in Neural Information Processing Systems}," in result[1] and "  year = {2017}," in result[1] and "  volume = {30}," in result[1] and not any(line.startswith("  journal") for line in result[1]), repr(result))
with attempt("V14"):
    no_title = PMLR_PAGE.replace('<meta name="citation_title" content="Gradient Descent Finds Global Minima of Deep Neural Networks"/>', "")
    no_year = PMLR_PAGE.replace('<meta name="citation_publication_date" content="2019/05/24">', "")
    other = PMLR_PAGE.replace("Gradient Descent Finds Global Minima of Deep Neural Networks", "A survey of protein folding kinetics")
    for name, url, replies, reason in (
        ("no citation_title", PMLR_URL, {PMLR_HOST: [page_reply(no_title)]}, "no citation_title tag"),
        ("no year tag", PMLR_URL, {PMLR_HOST: [page_reply(no_year)]}, "no year tag"),
        ("a citation_title below 0.70", PMLR_URL, {PMLR_HOST: [page_reply(other)]}, "citation_title ratio %.2f" % lookup.title_ratio(ICML_TITLE, "A survey of protein folding kinetics")),
        ("a 404", PMLR_URL, {PMLR_HOST: [says(404)]}, "HTTP 404"),
        ("a redirect to arxiv.org", PMLR_URL, {PMLR_HOST: [says(302, Location="https://arxiv.org/abs/1811.03804")], "arxiv.org": [page_reply(PMLR_PAGE)]}, "the page is on arxiv.org"),
        ("a redirect to doi.org", PMLR_URL, {PMLR_HOST: [says(302, Location="https://doi.org/10.48550/arXiv.1811.03804")], "doi.org": [page_reply(PMLR_PAGE)]}, "the page is on doi.org"),
        ("file:///etc/passwd", "file:///etc/passwd", {}, "not an http or https URL"),
    ):
        replies = {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published()], **replies}
        result = bibtex_main([ICML_ID, "--page", url], replies)
        check("V14 --page refuses a page with " + name, result[0] == 1 and result[1] == [] and result[2][-1:] == [f"page {url}: {reason}"], repr(result))
with attempt("V15"):
    page = PMLR_PAGE.replace('content="Simon Du"', 'content="Simon Du}, note = {injected"').replace('content="1675"', 'content="1675\n}"')
    result = bibtex_main([ICML_ID, "--page", PMLR_URL], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published()], PMLR_HOST: [page_reply(page)]})
    check("V15 a tag whose braces do not balance cannot end its field: its braces are removed", result[0] == 0 and "  author = {Simon Du, note = injected and Jason Lee and Haochuan Li and Liwei Wang and Xiyu Zhai}," in result[1] and "  pages = {1675 --1685}," in result[1] and not any(line.startswith("  note") for line in result[1]), repr(result))


# A: every entry bibtex prints is ASCII, by each of its three builders. The bodies hold their characters as escapes, so this file stays ASCII.
def doi_bibtex(body):
    return bibtex_main(["10.1000/xyz"], {"doi.org": [says(200, body, Content_Type="application/x-bibtex")]})


def is_ascii(lines):
    return all(ord(character) < 128 for line in lines for character in line)


with attempt("A1"):
    body = "@article{LeCun_2015, title={Caf\u00e9 \u00edndices, fa\u00e7ades, \u010dlanky, \u00e5ngstrom, Gro\u00dfe, \u03b1 and \u0393 in non\u2010linear \u2212 models\u00ae and \u201cquoted\u201d terms}, url={http://dx.doi.org/10.1000/xyz}, DOI={10.1000/xyz}, journal={Nature}, author={LeCun, Yann}, year={2015}, pages={1660\u20131673} }"
    expected = r"@article{LeCun_2015, title={Caf{\'e} {\'\i}ndices, fa{\c{c}}ades, {\v{c}}lanky, {\r{a}}ngstrom, Gro{\ss}e, {$\alpha$} and {$\Gamma$} in non-linear {$-$} models\textregistered{} and ``quoted'' terms}, url={http://dx.doi.org/10.1000/xyz}, DOI={10.1000/xyz}, journal={Nature}, author={LeCun, Yann}, year={2015}, pages={1660--1673} }"
    result = doi_bibtex(body)
    check("A1 a doi.org entry with accented letters, Greek letters and typographic signs is printed in ASCII", result[:3] == (0, [expected], []) and is_ascii(result[1]), repr(result))
with attempt("A2"):
    result = doi_bibtex("@article{k, title={Snow \u2603 and \U0001D6FC}, year={2020}}")
    check("A2 a character with no ASCII form is written {?} with one warning for each, and the exit status is 0", result[:3] == (0, ["@article{k, title={Snow {?} and {?}}, year={2020}}"], ["warning: k: no ASCII form for U+2603, written {?}", "warning: k: no ASCII form for U+1D6FC, written {?}"]), repr(result))
with attempt("A3"):
    result = doi_bibtex("@article{k, title={Cafe\u0301}, year={2020}}")
    check("A3 a decomposed letter is put in NFC and written as one accent command", result[:3] == (0, [r"@article{k, title={Caf{\'e}}, year={2020}}"], []), repr(result))
with attempt("A4"):
    entry = r'@article{k, title={{\"o}ber {DNA} and $\beta$}, year={2020}}'
    result = doi_bibtex(entry)
    check("A4 a value that is already ASCII is printed unchanged", result[:3] == (0, [entry], []), repr(result))
with attempt("A5"):
    result = doi_bibtex("@article{M\u00f6ller_2020, title={T}, url={https://example.org/caf\u00e9}, DOI={10.1000/xyz}, year={2020}}")
    check("A5 the key keeps the base letter and the url is percent-encoded", result[:3] == (0, ["@article{Moller_2020, title={T}, url={https://example.org/caf%C3%A9}, DOI={10.1000/xyz}, year={2020}}"], []), repr(result))
with attempt("A6"):
    page = PMLR_PAGE.replace('content="Simon Du"', 'content="Ren\u00e9 Du"')
    result = bibtex_main([ICML_ID, "--page", PMLR_URL], {ARXIV: [says(200, ICML_FEED)], SEMANTIC_SCHOLAR: [s2_published()], PMLR_HOST: [page_reply(page)]})
    check("A6 bibtex --page writes an accented author of the page's tags as its accent command", result[0] == 0 and r"  author = {Ren{\'e} Du and Jason Lee and Haochuan Li and Liwei Wang and Xiyu Zhai}," in result[1] and is_ascii(result[1]), repr(result))
with attempt("A7"):
    feed = ICML_FEED.replace("<name>Simon S. Du</name>", "<name>J\u00f6rg S. Du</name>")
    result = bibtex_main([ICML_ID], {ARXIV: [says(200, feed)], SEMANTIC_SCHOLAR: [s2_published(venue=...)], OPENALEX: [openalex_published()]})
    check("A7 the @misc entry of an arXiv record writes an accented author as its accent command", result[0] == 0 and r'  author = {J{\"o}rg S. Du and Jason D. Lee and Haochuan Li and Liwei Wang and Xiyu Zhai},' in result[1] and is_ascii(result[1]), repr(result))
with attempt("A8"):
    original_title = "\u03b1-stable estimates of mutual information in caf\u00e9s"
    converted_title = r"{$\alpha$}-stable estimates of mutual information in caf{\'e}s"
    replies = [("api.crossref.org", crossref_work("10.1103/PhysRevE.69.066138", original_title, 2004))]
    converted = entry_run(entry_bib("k", converted_title, "2004", doi="10.1103/PhysRevE.69.066138"), "k", replies)
    original = entry_run(entry_bib("k", original_title, "2004", doi="10.1103/PhysRevE.69.066138"), "k", replies)
    check("A8 resolve --entry reads a converted entry as the original: the same verdict and ratio", converted[:2] == original[:2] and original[1][-1:] == ["k: CONFIRMED against Crossref, ratio 1.00, year 2004"], repr((converted, original)))
    check_replies = [DOI_REPLY, ("api.crossref.org", crossref_work("10.1103/PhysRevE.69.066138", original_title, 2004))]
    converted = check_urls_of("@article{k, title={%s}, doi={10.1103/PhysRevE.69.066138}}\n" % converted_title, check_replies)
    original = check_urls_of("@article{k, title={%s}, doi={10.1103/PhysRevE.69.066138}}\n" % original_title, check_replies)
    check("A8 the title check of check-urls reads a converted entry as the original", converted[:2] == original[:2] and original[0] == 0, repr((converted, original)))


def openalex_arxiv_record(year=2018, title=ICML_TITLE):
    """OpenAlex's answer for works/doi:10.48550/arXiv.1811.03804 with the fields resolve asks."""
    return says(200, json.dumps({"id": "https://openalex.org/W2899790086", "title": title, "doi": "https://doi.org/10.48550/arxiv.1811.03804", "publication_year": year, "authorships": [], "primary_location": {"source": {"display_name": "arXiv (Cornell University)"}}, "open_access": {"oa_url": None}}))


def page_entry(kind="inproceedings", title=ICML_TITLE, year="2019", url=PMLR_URL, **extra):
    fields = {"title": title, "booktitle": "International Conference on Machine Learning", "year": year, "url": url, "eprint": ICML_ID, "archivePrefix": "arXiv", **extra}
    return "@%s{arxiv_1811_03804,\n" % kind + ",\n".join("  %s = {%s}" % pair for pair in fields.items()) + "\n}\n"


def entry_main(bib_text, replies):
    """(exit status, standard output lines, URLs asked) of lookup.py resolve --entry on the key arxiv_1811_03804, answered from replies, on a new scratch folder."""
    scratch_case()
    path = put("g/refs.bib", bib_text)
    script = Script(replies)
    with fake_clock():
        status, lines, _ = run_main(["resolve", "--entry", path, "arxiv_1811_03804"], script)
    return status, lines, script.urls


ARXIV_RECORDS = {CROSSREF: [says(404)], OPENALEX: [openalex_arxiv_record()], SEMANTIC_SCHOLAR: [says(404)], ARXIV: [says(200, ICML_FEED)]}
ENTRY_2019 = "arxiv_1811_03804: NOT_CONFIRMED against OpenAlex, ratio 1.00, year 2018, entry year 2019"

with attempt("G1"):
    result = entry_main(page_entry(), {**ARXIV_RECORDS, PMLR_HOST: [page_reply(PMLR_PAGE)]})
    check("G1 an entry confirmed on its venue page", result[0] == 0 and result[1][-1] == "arxiv_1811_03804: CONFIRMED against OpenAlex, ratio 1.00, year 2018; year 2019 found on " + PMLR_URL, repr(result))
with attempt("G2"):
    page = PMLR_PAGE.replace("2019/05/24", "2018/05/24")
    result = entry_main(page_entry(), {**ARXIV_RECORDS, PMLR_HOST: [page_reply(page)]})
    check("G2 a year tag that differs from the entry's year", result[0] == 1 and result[1][-1] == ENTRY_2019 + "; " + PMLR_URL + ": year 2018 on the page", repr(result))
with attempt("G3"):
    page = "<html><head><title>" + ICML_TITLE + "</title></head><body><p>" + ICML_TITLE + ", 2017, 2018, 2019, 2020.</p></body></html>"
    result = entry_main(page_entry(), {**ARXIV_RECORDS, PMLR_HOST: [page_reply(page)]})
    check("G3 a page with the title and years in its text and no citation tags", result[0] == 1 and result[1][-1] == ENTRY_2019 + "; " + PMLR_URL + ": no citation_title tag", repr(result))
with attempt("G4"):
    result = entry_main(page_entry(), {**ARXIV_RECORDS, PMLR_HOST: [says(404)]})
    check("G4 a page that answers 404", result[0] == 1 and result[1][-1] == ENTRY_2019 + "; " + PMLR_URL + ": HTTP 404", repr(result))
with attempt("G5"):
    page = PMLR_PAGE.replace('content="Gradient Descent Finds Global Minima of Deep Neural Networks"', 'content="GRADIENT DESCENT finds global minima of deep neural networks"')
    result = entry_main(page_entry(title="{G}radient {D}escent Finds Global Minima of Deep Neural Networks"), {**ARXIV_RECORDS, PMLR_HOST: [page_reply(page)]})
    check("G5 braces in the entry's title and another capitalisation on the page", result[0] == 0 and result[1][-1] == "arxiv_1811_03804: CONFIRMED against OpenAlex, ratio 1.00, year 2018; year 2019 found on " + PMLR_URL, repr(result))
with attempt("G6"):
    for url, extra in (
        ("file:///etc/passwd", {}),
        ("ftp://proceedings.mlr.press/v97/du19c.html", {}),
        ("https://arxiv.org/abs/1811.03804", {}),
        ("https://export.arxiv.org/abs/1811.03804", {}),
        ("https://doi.org/10.48550/arXiv.1811.03804", {}),
        (PMLR_URL, {PMLR_HOST: [says(302, Location="https://arxiv.org/abs/1811.03804")], "arxiv.org": [page_reply(PMLR_PAGE)]}),
    ):
        result = entry_main(page_entry(url=url), {**ARXIV_RECORDS, **extra})
        check("G6 a url whose page is not read: " + url + (" redirected to arxiv.org" if extra else ""), result[0] == 1 and result[1][-1] == ENTRY_2019, repr(result))
        if not extra:
            check("G6 no request to the url " + url, url not in result[2], repr(result[2]))
with attempt("G7"):
    replies = {CROSSREF: [crossref_published()], OPENALEX: [says(404)], SEMANTIC_SCHOLAR: [says(404)], ARXIV: [says(200, ICML_FEED)], PMLR_HOST: [page_reply(PMLR_PAGE)]}
    result = entry_main(page_entry(year="2018", doi=PUBLISHED_DOI), replies)
    check("G7 an entry with a doi is resolved by its DOI and no page is read", result[0] == 1 and result[1][-1] == "arxiv_1811_03804: NOT_CONFIRMED against Crossref, ratio 1.00, year 2019, entry year 2018" and result[2][0] == "https://api.crossref.org/works/" + PUBLISHED_DOI and not any(PMLR_HOST in url for url in result[2]), repr(result))
with attempt("G8"):
    pdf_url = "https://proceedings.neurips.cc/paper_files/paper/2017/file/3f5ee243547dee91fbd053c1c4a845aa-Paper.pdf"
    result = entry_main(page_entry(url=pdf_url), {**ARXIV_RECORDS, "proceedings.neurips.cc": [says(200, "%PDF-1.4\n%binary\n", Content_Type="application/pdf")]})
    check("G8 a PDF as the url", result[0] == 1 and result[1][-1] == ENTRY_2019 + "; " + pdf_url + ": no citation_title tag", repr(result))
with attempt("G9"):
    result = entry_main(page_entry(kind="misc", year="2018"), {**ARXIV_RECORDS, PMLR_HOST: [page_reply(PMLR_PAGE)]})
    check("G9 an @misc entry that a record confirms: CONFIRMED as before, no page read", result[0] == 0 and result[1][-1] == "arxiv_1811_03804: CONFIRMED against OpenAlex, ratio 1.00, year 2018" and not any(PMLR_HOST in url for url in result[2]), repr(result))
    result = entry_main(page_entry(kind="inproceedings", year="2018"), {**ARXIV_RECORDS, PMLR_HOST: [page_reply(PMLR_PAGE)]})
    check("G9 an @inproceedings entry whose year a record equals: CONFIRMED as before, no page read", result[0] == 0 and result[1][-1] == "arxiv_1811_03804: CONFIRMED against OpenAlex, ratio 1.00, year 2018" and not any(PMLR_HOST in url for url in result[2]), repr(result))

with attempt("W1"):
    scratch_case()
    folder = os.path.dirname(put("w1/.keep", ""))
    real_pdf_text = lookup.FetchRun.pdf_text

    def recorded_pdf_text(self, pdf_path):
        with open(self.base + ".txt", "w") as handle:
            handle.write("the text of the PMLR PDF\n")
        return ""

    lookup.FetchRun.pdf_text = recorded_pdf_text
    try:
        script = Script({PMLR_HOST: [page_reply(PMLR_PAGE), says(200, "%PDF-1.4 pmlr")], ARXIV: [says(200, ICML_FEED)]})
        with fake_clock():
            status, lines, err = run_main(["fetch", ICML_ID, folder, "arxiv_1811_03804", "--page", PMLR_URL], script)
        check("W1 fetch --page reads the PDF the page's citation_pdf_url names, before arxiv.org", status == 0 and script.urls[:2] == [PMLR_URL, "http://proceedings.mlr.press/v97/du19c/du19c.pdf"] and not any("arxiv.org/" in url for url in script.urls) and read_text(os.path.join(folder, "arxiv_1811_03804.txt")) == "the text of the PMLR PDF\n", repr((status, lines, err, script.urls)))
        script = Script({PMLR_HOST: [says(404)]})
        with fake_clock():
            status, lines, err = run_main(["fetch", ICML_ID, folder, "other", "--page", PMLR_URL], script)
        plain = Script({})
        with fake_clock():
            run_main(["fetch", ICML_ID, folder, "plain"], plain)
        check("W1 with the page failing, fetch goes on as without --page", script.urls[:1] == [PMLR_URL] and script.urls[1:] == plain.urls and status == 1, repr((status, lines, script.urls, plain.urls)))
    finally:
        lookup.FetchRun.pdf_text = real_pdf_text

# The URLs resolve, search, refs, cited-by and fetch request for an arXiv ID and a DOI, which are the keys of the reply cache. Every host answers 404.
S2_SELECT = "paperId,title,authors,year,venue,externalIds,openAccessPdf"
OPENALEX_SELECT = "id,title,authorships,publication_year,primary_location,doi,open_access,ids"
EXPECTED_URLS = (
    (["resolve", ICML_ID], [
        "https://api.crossref.org/works/10.48550/arXiv.1811.03804",
        "https://api.openalex.org/works/doi:10.48550/arXiv.1811.03804?select=" + OPENALEX_SELECT,
        "https://api.semanticscholar.org/graph/v1/paper/ARXIV:1811.03804?fields=" + S2_SELECT,
        "https://export.arxiv.org/api/query?id_list=1811.03804",
    ]),
    (["resolve", "10.1002/j.1538-7305.1948.tb01338.x"], [
        "https://api.crossref.org/works/10.1002/j.1538-7305.1948.tb01338.x",
        "https://api.openalex.org/works/doi:10.1002/j.1538-7305.1948.tb01338.x?select=" + OPENALEX_SELECT,
        "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1002/j.1538-7305.1948.tb01338.x?fields=" + S2_SELECT,
    ]),
    (["search", "gradient descent"], [
        "https://api.crossref.org/works?query.bibliographic=gradient+descent&rows=20&select=DOI%2Ctitle%2Cauthor%2Cissued%2Ccontainer-title",
        "https://api.openalex.org/works?search=gradient+descent&per_page=20&select=id%2Ctitle%2Cauthorships%2Cpublication_year%2Cprimary_location%2Cdoi%2Copen_access%2Cids",
        "https://api.semanticscholar.org/graph/v1/paper/search?query=gradient+descent&limit=20&fields=paperId%2Ctitle%2Cauthors%2Cyear%2Cvenue%2CexternalIds%2CopenAccessPdf",
        "https://export.arxiv.org/api/query?search_query=all%3Agradient+AND+all%3Adescent&max_results=20",
    ]),
    (["refs", ICML_ID], [
        "https://api.semanticscholar.org/graph/v1/paper/ARXIV:1811.03804/references?fields=paperId%2Ctitle%2Cauthors%2Cyear%2Cvenue%2CexternalIds%2CopenAccessPdf&limit=100",
        "https://api.openalex.org/works/doi:10.48550/arXiv.1811.03804?select=id,referenced_works",
    ]),
    (["cited-by", "10.1002/j.1538-7305.1948.tb01338.x"], [
        "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1002/j.1538-7305.1948.tb01338.x/citations?fields=paperId%2Ctitle%2Cauthors%2Cyear%2Cvenue%2CexternalIds%2CopenAccessPdf&limit=100",
        "https://api.openalex.org/works/doi:10.1002/j.1538-7305.1948.tb01338.x?select=id,referenced_works",
    ]),
    (["fetch", ICML_ID, "FOLDER", "k"], [
        "https://arxiv.org/html/1811.03804",
        "https://arxiv.org/pdf/1811.03804",
        "https://api.openalex.org/works/doi:10.48550/arXiv.1811.03804?select=" + OPENALEX_SELECT + ",abstract_inverted_index",
        "https://api.semanticscholar.org/graph/v1/paper/ARXIV:1811.03804?fields=" + S2_SELECT + ",abstract",
        "https://export.arxiv.org/api/query?id_list=1811.03804",
    ]),
    (["fetch", "10.1002/j.1538-7305.1948.tb01338.x", "FOLDER", "k"], [
        "https://api.openalex.org/works/doi:10.1002/j.1538-7305.1948.tb01338.x?select=" + OPENALEX_SELECT + ",abstract_inverted_index",
        "https://api.semanticscholar.org/graph/v1/paper/DOI:10.1002/j.1538-7305.1948.tb01338.x?fields=" + S2_SELECT + ",abstract",
    ]),
)
for arguments, expected in EXPECTED_URLS:
    with attempt("U1 " + " ".join(arguments)):
        scratch_case()
        folder = os.path.dirname(put("u1/.keep", ""))
        script = Script({})
        with fake_clock():
            run_main([folder if argument == "FOLDER" else argument for argument in arguments], script)
        check("U1 the URLs of " + " ".join(arguments), script.urls == expected, repr(script.urls))

# X: text writes the text of a saved HTML, XML or PDF file as <folder>/<stem>.txt, or with --abstract as <folder>/<stem>.abstract.txt, with a pdftotext stand-in on PATH where a PDF is read.
text_work = tempfile.mkdtemp()
atexit.register(shutil.rmtree, text_work, True)
text_numbers = itertools.count(1)
# The stand-in's folder and kind are written into it, since $0 can be the bare name the program was found by.
STAND_IN = """#!/bin/sh
printf '%%s\\n' "$@" > '%s/arguments'
case '%s' in
    fails) exit 1 ;;
    empty) : > "$2" ;;
    *) printf 'the text of the PDF\\n' > "$2" ;;
esac
"""


def stand_in(kind):
    """A folder holding a pdftotext stand-in that writes its arguments to the file arguments beside it, and then writes a text (kind writes), nothing (empty) or exits 1 (fails)."""
    folder = os.path.join(text_work, "bin-%d" % next(text_numbers), kind)
    os.makedirs(folder)
    path = os.path.join(folder, "pdftotext")
    with open(path, "w") as handle:
        handle.write(STAND_IN % (folder, kind))
    os.chmod(path, 0o755)
    return folder


def text_case(body, name="page.html"):
    """(the saved file, an empty folder for the text) in a new scratch folder."""
    case = os.path.join(text_work, "case-%d" % next(text_numbers))
    os.makedirs(os.path.join(case, "texts"))
    path = os.path.join(case, name)
    with open(path, "wb") as handle:
        handle.write(body)
    return path, os.path.join(case, "texts")


def run_text(arguments, path_folder=None, cwd=None):
    """(exit status, standard output lines, standard error lines) of lookup.py text, with PATH holding path_folder alone when one is given."""
    environment = dict(os.environ)
    if path_folder is not None:
        environment["PATH"] = path_folder
    done = subprocess.run([sys.executable, "-B", "-I", os.path.join(sys.argv[1], "lookup.py"), "text"] + arguments, env=environment, cwd=cwd or text_work, capture_output=True, text=True)
    return done.returncode, done.stdout.splitlines(), done.stderr.splitlines()


def text_of(folder, name):
    path = os.path.join(folder, name)
    return read_text(path) if os.path.exists(path) else None


PMC_PAGE = b"""<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8"><title>Soil carbon after tillage</title>
<style>p { color: red; }</style><script>var tracker = "read this";</script></head>
<body><article><section><h2>Results</h2><p>Tillage depth predicted the carbon loss in</p><p>the first season.</p></section></article></body></html>
"""

# X1: a PMC article page: tags removed, no script or style text, a passage split across two p elements, and the line that names the text.
with attempt("X1"):
    page, folder = text_case(PMC_PAGE)
    status, out, err = run_text([page, folder, "smith2020"])
    text = text_of(folder, "smith2020.txt")
    check("X1 text of a PMC page", status == 0 and text == "Soil carbon after tillage\nResults\nTillage depth predicted the carbon loss in\nthe first season.\n" and out == ["smith2020.txt: %d characters from %s" % (len(text), page)] and err == [], repr((status, out, err, text)))

    # X2: quote-check finds a passage of that page in the text text wrote.
    report = os.path.join(os.path.dirname(folder), "citation-report.md")
    with open(report, "w") as handle:
        handle.write('Claim [@smith2020, p. 4].\n\n> [@smith2020, p. 4]: "Tillage depth predicted the carbon loss in the first season."\n')
    bib = os.path.join(os.path.dirname(folder), "refs.bib")
    with open(bib, "w") as handle:
        handle.write("@article{smith2020, title={Soil carbon after tillage}}\n")
    status, lines = run_in_process(lookup.run_quote_check, [report, bib, folder])
    check("X2 quote-check finds the passage in the text text wrote", status == 0 and "line 3: smith2020, p. 4: found" in lines, repr((status, lines)))

# X3: a Europe PMC fullTextXML body.
with attempt("X3"):
    xml = b"<article><front><article-meta><title-group><article-title>Soil carbon after tillage</article-title></title-group></article-meta></front><body><sec><title>Results</title><p>The first paragraph of the results.</p><p>The second paragraph.</p></sec></body></article>"
    page, folder = text_case(xml, "europepmc.xml")
    status, out, err = run_text([page, folder, "smith2020"])
    text = text_of(folder, "smith2020.txt") or ""
    check("X3 text of a fullTextXML body", status == 0 and "The first paragraph of the results.\n" in text and "The second paragraph.\n" in text, repr((status, out, err, text)))

# X4: a PDF is read by pdftotext, given the file's absolute path and an output path as a list of two arguments, and its text is <stem>.txt.
with attempt("X4"):
    page, folder = text_case(b"%PDF-1.4\n%recorded body\n", "paper.pdf")
    tool = stand_in("writes")
    status, out, err = run_text([page, folder, "smith2020"], tool)
    arguments = read_text(os.path.join(tool, "arguments")).splitlines() if os.path.exists(os.path.join(tool, "arguments")) else []
    check("X4 text of a PDF", status == 0 and text_of(folder, "smith2020.txt") == "the text of the PDF\n" and out == ["smith2020.txt: 20 characters from %s" % page] and listing(folder) == ["smith2020.txt"], repr((status, out, err, listing(folder))))
    check("X4 pdftotext gets the absolute path and one output path", len(arguments) == 2 and arguments[0] == os.path.abspath(page) and os.path.dirname(arguments[1]) == os.path.abspath(folder), repr(arguments))

# X5: the stem of a key is made as fetch makes it.
with attempt("X5"):
    page, folder = text_case(PMC_PAGE)
    status, out, err = run_text([page, folder, "doi:10.1000/x:y"])
    check("X5 the stem of doi:10.1000/x:y", status == 0 and listing(folder) == ["doi_10.1000_x_y.txt"] and out[:1] and out[0].startswith("doi_10.1000_x_y.txt: "), repr((status, out, err, listing(folder))))

# X6: a <stem>.txt that exists is refused and kept.
with attempt("X6"):
    page, folder = text_case(PMC_PAGE)
    with open(os.path.join(folder, "smith2020.txt"), "w") as handle:
        handle.write("the text a passage was quoted from\n")
    result = run_text([page, folder, "smith2020"])
    check("X6 an existing text is refused", result == (2, [], ["error: %s exists" % os.path.join(folder, "smith2020.txt")]) and text_of(folder, "smith2020.txt") == "the text a passage was quoted from\n" and listing(folder) == ["smith2020.txt"], repr((result, listing(folder))))

# X7: a JSON body and an empty file are neither HTML or XML nor a PDF.
with attempt("X7"):
    for body in (b'{"a": 1}', b""):
        page, folder = text_case(body, "reply.json")
        result = run_text([page, folder, "smith2020"])
        check("X7 refused: %r" % body, result == (2, [], ["error: %s: not an HTML, XML or PDF file" % page]) and listing(folder) == [], repr((result, listing(folder))))

# X8: a file that does not exist.
with attempt("X8"):
    page, folder = text_case(PMC_PAGE)
    missing = page + ".missing"
    result = run_text([missing, folder, "smith2020"])
    check("X8 a missing file", result == (2, [], ["error: %s: No such file or directory" % missing]) and listing(folder) == [], repr(result))

# X9: an HTML page with no text.
with attempt("X9"):
    page, folder = text_case(b"<html><head><script>var x = 1;</script></head><body><div></div></body></html>")
    result = run_text([page, folder, "smith2020"])
    check("X9 a page with no text", result == (1, ["%s: no text" % page], []) and listing(folder) == [], repr((result, listing(folder))))

# X10: an empty key, and a folder that is not a folder.
with attempt("X10"):
    page, folder = text_case(PMC_PAGE)
    result = run_text([page, folder, ""])
    check("X10 an empty key", result == (2, [], ["error: the key is empty"]) and listing(folder) == [], repr(result))
    result = run_text([page, page, "smith2020"])
    check("X10 a folder that is a file", result == (2, [], ["error: %s: not a folder" % page]), repr(result))

# X11: lookup.py with no argument lists text among the commands.
with attempt("X11"):
    status, out, err = command([])
    listed = err[1].split(": ", 1)[1].split(", ") if len(err) > 1 and ": " in err[1] else []
    check("X11 the command list names text", status == 2 and "text" in listed, repr((status, out, err)))

# X12: a Windows-1252 page that declares its charset.
with attempt("X12"):
    page, folder = text_case(b'<html><head><meta charset="windows-1252"></head><body><p>caf\xe9 au lait</p></body></html>')
    status, out, err = run_text([page, folder, "smith2020"])
    check("X12 a Windows-1252 page", status == 0 and text_of(folder, "smith2020.txt") == "caf\u00e9 au lait\n", repr((status, out, err, text_of(folder, "smith2020.txt"))))

# X13: a byte order mark, and an XML declaration and a DOCTYPE after blank text, before the root.
with attempt("X13"):
    for body, wanted in (
        (b"\xef\xbb\xbf<html><body><p>Text after a byte order mark.</p></body></html>", "Text after a byte order mark.\n"),
        (b'\n  <?xml version="1.0"?>\n<!DOCTYPE article PUBLIC "-//NLM//DTD JATS (Z39.96) Journal Archiving DTD v1.2//EN" "JATS-archivearticle1.dtd">\n<article><body><sec><p>Text after a declaration.</p></sec></body></article>', "Text after a declaration.\n"),
    ):
        page, folder = text_case(body)
        status, out, err = run_text([page, folder, "smith2020"])
        check("X13 read as HTML or XML: %r" % body[:12], status == 0 and text_of(folder, "smith2020.txt") == wanted, repr((status, out, err, text_of(folder, "smith2020.txt"))))

# X14: a pdftotext that exits 1 or writes nothing leaves no text and no temporary file; no pdftotext on PATH is an error.
with attempt("X14"):
    for kind in ("fails", "empty"):
        page, folder = text_case(b"%PDF-1.4\n", "paper.pdf")
        result = run_text([page, folder, "smith2020"], stand_in(kind))
        check("X14 pdftotext %s" % kind, result == (1, ["%s: no text" % page], []) and listing(folder) == [], repr((result, listing(folder))))
    page, folder = text_case(b"%PDF-1.4\n", "paper.pdf")
    empty_path = os.path.join(text_work, "no-programs-%d" % next(text_numbers))
    os.makedirs(empty_path)
    result = run_text([page, folder, "smith2020"], empty_path)
    check("X14 no pdftotext", result == (2, [], ["error: pdftotext not found"]) and listing(folder) == [], repr((result, listing(folder))))

# X15: a PDF whose path holds a space and a single quote, and one named -layout.pdf given relative to the working directory, reach pdftotext as one absolute path.
with attempt("X15"):
    for name in ("it's a paper.pdf", "-layout.pdf"):
        page, folder = text_case(b"%PDF-1.4\n", name)
        tool = stand_in("writes")
        status, out, err = run_text([name, folder, "smith2020"], tool, cwd=os.path.dirname(page))
        arguments = read_text(os.path.join(tool, "arguments")).splitlines() if os.path.exists(os.path.join(tool, "arguments")) else []
        check("X15 one absolute path for %s" % name, status == 0 and arguments[:1] == [os.path.realpath(page)] and len(arguments) == 2 and text_of(folder, "smith2020.txt") == "the text of the PDF\n", repr((status, out, err, arguments)))

# X16: a <stem>.txt that is a dangling link is refused, and nothing is written through it.
with attempt("X16"):
    page, folder = text_case(PMC_PAGE)
    target = os.path.join(os.path.dirname(folder), "outside.txt")
    os.symlink(target, os.path.join(folder, "smith2020.txt"))
    result = run_text([page, folder, "smith2020"])
    check("X16 a dangling link is refused", result == (2, [], ["error: %s exists" % os.path.join(folder, "smith2020.txt")]) and not os.path.exists(target) and os.path.islink(os.path.join(folder, "smith2020.txt")), repr((result, os.path.exists(target))))

# X17: two keys with one stem: the second is refused.
with attempt("X17"):
    page, folder = text_case(PMC_PAGE)
    first = run_text([page, folder, "a/b"])
    other, _ = text_case(b"<html><body><p>Another page.</p></body></html>")
    second = run_text([other, folder, "a:b"])
    check("X17 the second key of one stem", first[0] == 0 and second == (2, [], ["error: %s exists" % os.path.join(folder, "a_b.txt")]) and "Tillage depth" in (text_of(folder, "a_b.txt") or ""), repr((first, second)))

# X18: resolve prints the PMCID OpenAlex names after the OpenAlex line, and no pmcid line for a record that names none.
with attempt("X18"):
    work_with_ids = {"id": "https://openalex.org/W1", "title": "Estimating mutual information", "doi": "https://doi.org/10.1103/physreve.69.066138", "publication_year": 2004, "authorships": [], "primary_location": {"source": {"display_name": "Physical Review E"}}, "open_access": {"oa_url": None}, "ids": {"openalex": "https://openalex.org/W1", "doi": "https://doi.org/10.1103/physreve.69.066138", "pmcid": "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1234567"}}
    lines = plain_resolve([("api.openalex.org", stub_reply(200, json.dumps(work_with_ids)))], "10.1103/PhysRevE.69.066138")
    openalex_at = next((number for number, line in enumerate(lines) if line.startswith("OpenAlex: ")), None)
    check("X18 the pmcid line follows the OpenAlex line", openalex_at is not None and lines[openalex_at + 1:openalex_at + 2] == ["pmcid: PMC1234567"] and sum(line.startswith("pmcid:") for line in lines) == 1, repr(lines))
    del work_with_ids["ids"]["pmcid"]
    lines = plain_resolve([("api.openalex.org", stub_reply(200, json.dumps(work_with_ids)))], "10.1103/PhysRevE.69.066138")
    check("X18 no pmcid line for a record without one", any(line.startswith("OpenAlex: ") for line in lines) and not any(line.startswith("pmcid") for line in lines), repr(lines))


ABSTRACT_PAGE = b"""<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8"><title>Soil carbon after tillage</title></head>
<body><section class="abstract"><h2>Abstract</h2><p>Tillage depth predicted the carbon loss in the first season.</p></section></body></html>
"""

# X19: text --abstract writes the text of a saved page that holds only the abstract as <stem>.abstract.txt and no <stem>.txt, and quote-check finds a passage with the locator abstract in it.
with attempt("X19"):
    page, folder = text_case(ABSTRACT_PAGE)
    status, out, err = run_text(["--abstract", page, folder, "smith2020"])
    text = text_of(folder, "smith2020.abstract.txt")
    check("X19 text --abstract of an abstract page", status == 0 and listing(folder) == ["smith2020.abstract.txt"] and text is not None and "Tillage depth predicted the carbon loss in the first season.\n" in text and out == ["smith2020.abstract.txt: %d characters from %s" % (len(text), page)] and err == [], repr((status, out, err, listing(folder), text)))
    report = os.path.join(os.path.dirname(folder), "citation-report.md")
    with open(report, "w") as handle:
        handle.write('Claim [@smith2020, abstract].\n\n> [@smith2020, abstract]: "Tillage depth predicted the carbon loss in the first season."\n')
    bib = os.path.join(os.path.dirname(folder), "refs.bib")
    with open(bib, "w") as handle:
        handle.write("@article{smith2020, title={Soil carbon after tillage}}\n")
    status, lines = run_in_process(lookup.run_quote_check, [report, bib, folder])
    check("X19 quote-check finds the abstract passage in the file text --abstract wrote", status == 0 and "line 3: smith2020, abstract: found" in lines, repr((status, lines)))

# X20: text --abstract refuses a <stem>.abstract.txt that exists, keeps it and writes nothing.
with attempt("X20"):
    page, folder = text_case(ABSTRACT_PAGE)
    with open(os.path.join(folder, "smith2020.abstract.txt"), "w") as handle:
        handle.write("the abstract fetch wrote\n")
    status, out, err = run_text(["--abstract", page, folder, "smith2020"])
    target = os.path.join(folder, "smith2020.abstract.txt")
    check("X20 an existing abstract text is refused", status == 2 and err == ["error: %s exists" % target] and listing(folder) == ["smith2020.abstract.txt"] and text_of(folder, "smith2020.abstract.txt") == "the abstract fetch wrote\n", repr((status, out, err, listing(folder))))


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

echo "PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, fetches a source by an OpenAlex ID or a Semantic Scholar ID through the record of that ID's index, reads the keys a .tex cites with the commands of natbib and biblatex and the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, reports an input file that does not exist, reads the .bib named on the command line in check-urls and quote-check, refuses the one-argument check-urls and the two-argument quote-check, prints the retraction and expression-of-concern notices of a Crossref record and none for a correction, an erratum or a work without a notice, and resolves an entry of a .bib by its doi, its arXiv ID or its title and prints a verdict that CONFIRMED or NOT_CONFIRMED the entry with exit status 0 or 1, refuses a call or an entry it cannot read with exit status 2, and leaves the output of resolve without --entry as it was, gives the published version of an arXiv ID the entry doi.org gives for its published DOI or the line that names its venue, builds and refuses the entry of a venue's page, confirms an entry on its venue's page, fetches the PDF a venue's page names, writes every bibtex entry in ASCII and compares a converted title as the original, keeps the URLs of the other commands, paces every API host across processes, waits out a 429 by its Retry-After, leaves a 429 that names more than 60 seconds out at once with its reason, names the host of a redirect hop that met it, and writes the skip file of the host, caches the index replies of resolve, search, refs and cited-by on disk for 30 days, prints the PMCID an OpenAlex record names, and writes with text the text of a saved HTML, XML or PDF file as <stem>.txt, or with text --abstract as <stem>.abstract.txt, and refuses to replace one"
