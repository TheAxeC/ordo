#!/bin/sh
# Offline proof of the parts of lookup.py that compute facts without the network: title matching, the choice among candidates, the DOI mismatch flag, record merging, passage lines, passage normalisation, abstract reassembly, the arXiv query syntax, the OpenAlex query text, the arXiv spacing across processes, the arXiv turn of every request to an arXiv host, the refusal of a URL other than http and https, an index whose body does not parse, the not found lines, the file name made from a key, the DOI in a URL, the PDF and arXiv HTML tests, the credentials each host gets, the URL check-urls requests, the BibTeX of an arXiv record, the BibTeX body test and the text of an HTML page. Response bodies are recorded below in the shapes the indexes answer. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/lookup.py" ]; then
    echo "FAIL: $here/lookup.py does not exist"
    exit 1
fi

output=$(python3 -B -I - "$here" 2>&1 <<'PYTHON'
import os
import shutil
import subprocess
import sys
import tempfile

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

# T6: passage lines and the keys a report cites.
line = '> [@a, p. 3]: "the "plug-in" estimator"'
parsed = lookup.passage_line(line)
check("T6 passage with quotation marks", parsed == ("a", "p. 3", 'the "plug-in" estimator'), repr(parsed))
check("T6 not a passage line", lookup.passage_line("Plain text.") is None)
check("T6 malformed passage line", lookup.passage_line("> [@a, p. 3] no quotes") == "malformed")
report = 'Claim [@a; @b, p. 3].\n\n> [@a, p. 3]: "the plug-in estimator"\n'
lines, failed = lookup.quote_check_lines(report, {"a", "b"}, lambda name: "the plug-in estimator" if name.startswith("a.") else None)
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


def spawn(folder):
    return subprocess.Popen([sys.executable, "-B", "-I", "-c", CHILD, sys.argv[1]], env={"TMPDIR": folder}, stdout=subprocess.PIPE, text=True)


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

echo "PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, and reads BibTeX and HTML"
