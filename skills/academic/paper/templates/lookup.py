#!/usr/bin/env python3
r"""Make every reference lookup of the paper skill, and the text of a page or PDF it saved, on the Python standard library alone.

Usage:

    lookup.py resolve <DOI | arXiv ID | title> [--year <year>]
    lookup.py resolve <DOI | arXiv ID> <DOI | arXiv ID> ...
    lookup.py search <query>
    lookup.py refs <DOI | arXiv ID | PMID:<n> | OpenAlex ID | Semantic Scholar ID> ...
    lookup.py cited-by <DOI | arXiv ID | PMID:<n> | OpenAlex ID | Semantic Scholar ID> ... [--since <year>]
    lookup.py index-abstract <DOI | arXiv ID | PMID:<n>> ... --into <folder>
    lookup.py dblp <title> ...
    lookup.py bibtex <DOI | arXiv ID>
    lookup.py bibtex <arXiv ID> --page <url>
    lookup.py cite-keys <main.tex> <file.bib>
    lookup.py check-urls <main.tex> <file.bib>
    lookup.py fetch <DOI | arXiv ID | Semantic Scholar ID | OpenAlex ID> <folder> <key> [--page <url>]
    lookup.py quote-check <citation report> <file.bib> <folder>
    lookup.py text [--abstract] <file> <folder> <key>

Every command prints plain text for a person, one line per record or result, and never JSON. bibtex prints the entry alone on standard output and every other line on standard error, so that its standard output can be copied into a .bib as it is.

A venue's page is the page of a work on the site of its conference or journal, such as a page of proceedings.mlr.press, proceedings.neurips.cc or aclanthology.org. It is read by its citation_* meta tags, the standard tags of a scholarly page: citation_title, citation_author, citation_publication_date, citation_date, citation_conference_title, citation_journal_title, citation_volume, citation_firstpage, citation_lastpage and citation_pdf_url. A tag is read by its name in any case, the first tag of a name is the one used and citation_author is read in the order of the page. The year of a page is the first run of four digits in citation_publication_date, else in citation_date. A page is read only at an http or https address whose host, before and after redirects, is not doi.org, dx.doi.org, www.doi.org, arxiv.org, www.arxiv.org or export.arxiv.org, since those hold the preprint or lead to another page of the work.

Identifiers. A DOI may be written as a bare DOI (10.xxxx/...), as https://doi.org/..., http://doi.org/..., https://dx.doi.org/... or doi:... and is stripped to the bare DOI. A DOI 10.48550/arXiv.<id> is also read as the arXiv ID <id>, and an arXiv ID is also read as the DOI 10.48550/arXiv.<id>. An arXiv ID is a new-style ID (2106.15928) or an old-style ID (math/0601001, hep-th/9901001v2), with or without a version suffix, which is dropped. refs, cited-by and index-abstract also read a PMID, written PMID:<n> in any case, and refs and cited-by an OpenAlex ID (W followed by digits) and a Semantic Scholar ID (40 hexadecimal digits). A DOI or a title that reaches a URL is percent-encoded. A DOI asked alone keeps its parentheses, which a path reads as they are. A DOI put in a filter of several DOIs (resolve over several inputs) has every character other than a letter, a digit and _.-~ percent-encoded, so that ; < > # ( ) reach the filter as part of the DOI. A DOI holding | or , is never put in such a filter, since OpenAlex reads | as OR inside a filter value and , separates two filters, percent-encoded or not: it is asked alone, as resolve asks a single DOI.

Commands:

- resolve queries Crossref, OpenAlex, Semantic Scholar and arXiv and prints one line per index. For a title, each index's search gives candidates; a candidate matches at a title ratio of 0.70 or more, and of the matching candidates those whose year equals --year are preferred when there are any, and the one with the highest ratio is taken. For a DOI or an arXiv ID, the first record found, in the order Crossref, OpenAlex, Semantic Scholar, arXiv, is the reference, each other record's title is compared with it, and a record below 0.70 is printed with DOI_MISMATCH. For a title, arXiv is searched for the title as a phrase (ti:"<title>"). For a DOI or an arXiv ID, arXiv is queried only when the input holds an arXiv ID. The year is read only for a title. A line reads "<index>: ratio <r>: <title> | <authors> | <year> | <venue> | vol <volume> | no <issue> | pages <pages> | doi ... | arXiv ... | OpenAlex ... | Semantic Scholar ... | open access ...", each part left out when the record has none, or "<index>: not found", or "<index>: left out, <reason>". <authors> is every author of the record, joined by ", ". The volume, the issue and the pages are Crossref's volume, issue and page, OpenAlex's biblio (volume, issue, first_page and last_page) and Semantic Scholar's journal (volume and pages); arXiv gives none. A page range is written with two hyphens, as BibTeX writes one, and a first page alone stays alone. For a DOI or an arXiv ID, the Crossref record of the work lists in its updated-by field the notices that update the work (Crossref's update types are listed in its schema). Each notice of the type retraction, partial_retraction or expression_of_concern is printed on a line of its own after the Crossref line: "Crossref notice: <type> | <date> | doi <the notice's DOI> | source <publisher or retraction-watch>". The date is the notice's date-time cut to the day, else its date-parts joined with a hyphen. A notice of any other type, such as a correction, is not printed, and a work whose record lists no such notice gets no line. A title prints no notice, since the search record does not carry the field. The notices come from the record resolve already fetches and cost no further request.
- resolve with several DOIs or arXiv IDs prints one block for each argument, in the order of the arguments. A block opens with the line "== <argument>" and holds the lines resolve prints for that input alone. In a batch each index is asked as follows. Crossref is asked in batches of 50 DOIs by its doi filter, an arXiv ID by its DOI 10.48550/arXiv.<id>. OpenAlex is asked in batches of 50 DOIs by its doi: filter, and each input that holds an arXiv ID alone, as resolve asks it alone: OpenAlex gives a preprint the DOI of its published version, so its record could not be matched back to the input, and its filter ids.arxiv takes no list of values. arXiv is asked in batches of 50 by id_list, and Semantic Scholar once for each input. Each record of a batch reply is matched to its input by its DOI, compared lower-cased, or for arXiv by its arXiv ID. An argument that is not a DOI or an arXiv ID is a block of its own with the line "error: <argument> is not a DOI or an arXiv ID", and the other blocks are printed. --year is read only with a single title. An index left out at a batch (a 429 that names more than 60 seconds, which writes its skip file) prints "<index>: left out, <reason>" in each block of that batch and of every later batch, and the other indexes go on.
- resolve prints "pmcid: <PMCID>" on a line of its own after the OpenAlex line, for a DOI, an arXiv ID or a title, when the OpenAlex record names a PMCID in its ids field (read as the PMC followed by digits that ends ids.pmcid). A record that names none gets no such line. The PMCID comes from the record resolve already fetches and costs no further request.
- search prints the records of the searches of Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed, at most 20 per index, merged when they share a DOI (compared lowercased), an arXiv ID (version dropped) or a Semantic Scholar ID. A merged record keeps the fields of the record with more fields filled, counted without the volume, the issue and the pages, and the other record fills its empty fields, the volume, the issue and the pages among them. A record is printed "[<indexes>] <title> | <authors> | ..." with the parts of a line of resolve, except that <authors> is the first three authors, followed by " et al." when the record has more. The query goes to Crossref and Semantic Scholar as given, to OpenAlex with each ? and * replaced by a space (OpenAlex reads them as wildcards and answers HTTP 400), and to arXiv in arXiv's own syntax: each word as all:<word>, a quoted phrase as all:"<phrase>", AND and OR kept, NOT written ANDNOT, parentheses kept, and two terms with no operator between them joined by AND. An operator word is read only in capitals. An operator that follows an operator replaces it, and an operator with no term before it or after it is dropped. When the parentheses do not balance, all of them are dropped, and a pair with no term inside is dropped. Every other character is dropped. Crossref ranks by relevance and reads no operator, and arXiv has no search by a sentence: a sentence is read as its words joined by AND, and arXiv can answer "not found" for it. PubMed is asked by E-utilities: esearch with the query as given gives the PMIDs, and esummary gives their records, each with its PMID, printed "PMID <n>". After the records, an index that answered with no record is printed "<index>: not found" and an index that is left out "<index>: left out, <reason>".
- refs prints, for each input, a line naming the input, the count printed, the count the index gives and the index, "<input>: <n> of <total> references, from <index>", then one line per work the input cites, "[<index>] <title> | <authors> | ...", with the parts of a record of search. The works come from OpenAlex's referenced_works, in the order OpenAlex lists them; their records are asked in batches of 50 OpenAlex IDs (filter openalex:<id>|<id>...) for every input of the call at once. An input OpenAlex does not hold, holds with an empty referenced_works, or for which OpenAlex is left out takes Semantic Scholar's references (paper/<id>/references, up to 1000 in one request), and a PMID then takes Europe PMC's references (MED/<pmid>/references, up to 1000 in one request). A work OpenAlex lists and whose record its batch reply lacks is printed "[OpenAlex] no record in OpenAlex's reply | OpenAlex <id>". When no index gives a list, refs prints "<input>: no references listed; <index>: <reason>; ..." with the reason of each index asked: "not found", "left out, <reason>", "lists none", or "not asked for <the input's kind>" (OpenAlex reads no Semantic Scholar ID, Semantic Scholar no OpenAlex ID).
- cited-by prints the works that cite each input in the same form, "<input>: <n> of <total> citing works, from <index>". OpenAlex is asked for the work's ID, then for its list by the filter cites:<id>, 200 works a page. An input OpenAlex does not hold, whose list is empty, or for which OpenAlex is left out takes Semantic Scholar's citations, and a PMID then Europe PMC's citations. With --since <year>, OpenAlex's filter adds from_publication_date:<year>-01-01 and the head line reads "<n> of <total> citing works from <year> on"; Semantic Scholar and Europe PMC take no year, so their list is read and cut to the works of that year and later, and the head line reads "<n> citing works from <year> on, among <read> of <total> citing works read". A list with no work from that year on is printed in the reasons as "none from <year> on among <read> read".
- refs and cited-by print at most 1000 works of an input, read over every page needed, and the count the index gives for the whole list. A list longer than 1000 prints "cut at 1000 of <total>" in its head line. Semantic Scholar gives no count in a list: when its list has a next page, the count comes from the work's referenceCount or citationCount, one request more.
- index-abstract writes, for each identifier, the abstract of the first index that gives one, in the order OpenAlex (abstract_inverted_index put back in word order), Semantic Scholar (abstract), Crossref (abstract, not asked for a PMID), Europe PMC (abstractText of the record whose DOI or PMID is the input's, searched by DOI:"<doi>" or EXT_ID:<pmid> AND SRC:MED), PubMed (efetch of the PMID, or of the PMID esearch gives for <doi>[doi]) and arXiv (the summary, asked only for an input that holds an arXiv ID). It writes <folder>/<stem>.abstract.txt, <stem> made from the identifier by the rule of fetch, a DOI taken bare and a PMID written PMID_<n>, so that quote-check reads a passage with the locator abstract in it. A PubMed abstract of several labelled parts keeps every part, in order, on a line of its own, "<label>: <text>". In a Crossref JATS or a Europe PMC HTML abstract a heading or a paragraph is a line of its own, every other tag is dropped, the entities are read and a first line "Abstract" is dropped. Each run of whitespace in a line is one space. It prints "<identifier>: <stem>.abstract.txt from <index>", or "<identifier>: no abstract; <index>: <reason>; ..." for each index asked, the reason "not found", "no abstract", "left out, <reason>" or "not asked for <the input's kind>". The file is written to a temporary file of <folder> with mode 600 and linked to its name, so that an existing file is never replaced. An existing <stem>.abstract.txt, a link included, is refused for that identifier with "error: <folder>/<stem>.abstract.txt exists", and the other identifiers go on.
- dblp prints, for each title, the line "== <title>", then each DBLP record whose title has a title ratio of 0.70 or more, the highest ratio first and then by DBLP key: "DBLP: ratio <r>: <title> | <venue> | <year> | pages <pages> | <type> | key <DBLP key>", a part left out when the record has none, the pages written with two hyphens, and " | CoRR record" added when the venue is CoRR, DBLP's record of an arXiv preprint. <type> is the record's type in DBLP's schema, such as Inproceedings, Article or Informal. A title with no such record prints "DBLP: not found", and DBLP left out "DBLP: left out, <reason>". It asks DBLP's SPARQL endpoint https://sparql.dblp.org/sparql, since DBLP's search interface answers a client with no browser by an HTML page with status 202. For each title it sends first an exact query, a GET for the records whose title is one of the title's forms: as given, in sentence case and in title case, each with and without a final full stop (VALUES ?title { ... }), which DBLP answers at once. When the exact query returns no row, or only CoRR records, it also sends the words query, since a proceedings title can differ in case from every form (DBLP holds "Attention is All you Need."); the records of both are printed once each. The words query is a GET for the records whose title, lower-cased, holds the longest run of the title's words, lower-cased, with one space between them (a run is split at any character other than a letter, a digit and a space). Each query returns at most 1000 rows, and the ratio is computed after the rows are read. A reply of 1000 rows adds the line "DBLP: cut at 1000 rows" at the end of the title's block, since a record of the title can lie beyond the cut.
- bibtex prints the BibTeX entry https://doi.org/<doi> returns for Accept: application/x-bibtex when its first character other than whitespace is @, as it is given. When doi.org gives none it prints "doi.org: left out, <reason>" or "doi.org: <reason>, not a BibTeX entry" and exits 1.
- bibtex for an arXiv ID, or a DOI 10.48550/arXiv.<id>, gives the entry of the published version when an index names one. It asks arXiv for the record, Semantic Scholar for paper/ARXIV:<id> with the fields paperId, title, externalIds and publicationVenue, and OpenAlex for works/doi:10.48550/arXiv.<id> with id, title, doi and locations. A published DOI is a DOI not of the form 10.48550/arXiv.<id> that Semantic Scholar names in externalIds.DOI, that OpenAlex names in doi, or that a doi.org landing_page_url of an OpenAlex location names, taken in that order, each once. Each published DOI is resolved as resolve resolves a DOI, in Crossref, OpenAlex and Semantic Scholar, and its first record found is compared with the title of the arXiv record (of the Semantic Scholar record, else of the OpenAlex record, when arXiv gave none). For the first published DOI whose record has a title ratio of 0.70 or more, bibtex prints the entry doi.org gives for that DOI, as for a DOI, and exits 0.
- When doi.org gives no entry for that DOI, bibtex prints the @misc entry below and "published DOI <doi>: doi.org <reason>" (the reason "left out, <reason>", "HTTP <status>", or "HTTP 200, not a BibTeX entry"), and exits 0. When Crossref, OpenAlex and Semantic Scholar are all left out for a published DOI, it prints the @misc entry and one line "<index>: left out, <reason>" for each, and exits 0. A published DOI no index holds prints "published DOI <doi>: not found", with a left-out line for each index left out, and one whose record is below 0.70 prints "published DOI <doi>: title ratio <r> against <index>, below 0.70"; the next published DOI is then tried.
- Otherwise bibtex prints the @misc entry of the arXiv record, keyed arxiv_<id> with each character other than a letter or digit written _, with eprint and archivePrefix = {arXiv}, each run of whitespace in the title and the authors made one space, and the braces of a value removed when they are not balanced, and exits 0. When Semantic Scholar's publicationVenue is of the type conference or journal and neither its name nor an alternate name contains arxiv in any case, it also prints "published in <venue name> (<type>) per Semantic Scholar, with no DOI named by Semantic Scholar or OpenAlex: lookup.py bibtex <arXiv ID> --page <the venue's page of the work>", the clause ending "whose record matches the title" when a published DOI was named and none was taken. Semantic Scholar or OpenAlex left out is printed "<index>: left out, <reason>", so that the published version is known not to have been checked there. With arXiv left out or not found and no published DOI taken, bibtex prints "arXiv: left out, <reason>" or "arXiv: not found" and exits 1.
- bibtex <arXiv ID> --page <url> prints the entry of the published version built from the venue's page at <url>. It asks arXiv and Semantic Scholar as above, and reads the page. The entry is @inproceedings with booktitle when Semantic Scholar's publicationVenue is of the type conference or the page has citation_conference_title, else @article with journal. The venue is citation_conference_title, else citation_journal_title. The entry holds title, author (the citation_author tags joined by and), the venue, year, volume and pages (citation_firstpage and citation_lastpage joined by two hyphens, as BibTeX writes a range, or the first page alone) when present, url (the page's address after redirects), eprint and archivePrefix = {arXiv}, keyed as the @misc entry is, each value made one line with its braces removed when they are not balanced. It refuses, printing "page <url>: <reason>" and exiting 1 with no entry, for a page that cannot be read ("not an http or https URL", "the page is on <host>", "no answer (...)", "HTTP <status>"), that has no citation_title ("no citation_title tag") or no year ("no year tag"), or whose citation_title has a title ratio below 0.70 against the title of the arXiv record, else of the Semantic Scholar record ("citation_title ratio <r>"). With neither record it prints the arXiv line and "page <url>: no record of arXiv <id> to compare its title with", and exits 1.
- Every entry bibtex prints, the one doi.org gives, the @misc entry and the entry of a venue's page, is ASCII. Each value is put in NFC first. A letter with one combining mark is its accent command around the base letter: acute {\'e}, grave {\`e}, circumflex {\^e}, diaeresis {\"o}, tilde {\~n}, cedilla {\c{c}}, caron {\v{c}}, ring {\r{a}}, macron {\=a}, dot above {\.z}, breve {\u{g}}, ogonek {\k{a}}, double acute {\H{o}}, with the dotless forms on i and j ({\'\i}). The sharp s, o with a stroke, l with a stroke and the ligatures ae and oe are {\ss}, {\o}, {\O}, {\l}, {\L}, {\ae}, {\AE}, {\oe} and {\OE}. A Greek letter that has a LaTeX command is that command in braced math, {$\alpha$} or {$\Gamma$}. The hyphens U+2010 and U+2011 are -, the en dash --, the em dash ---, the minus sign {$-$}, the single curly quotes ` and ', the double curly quotes `` and '', the no-break space ~, the ellipsis \ldots{}, and the signs registered, copyright, trade mark, degree, times, plus-minus, less-or-equal and greater-or-equal \textregistered{}, \textcopyright{}, \texttrademark{}, \textdegree{}, {$\times$}, {$\pm$}, {$\leq$} and {$\geq$}. The url and doi fields are not converted: each character in them that is not ASCII is percent-encoded as UTF-8. The key keeps ASCII only: a letter with a diacritic becomes its base letter, and any other character that is not ASCII is dropped. A value that is already ASCII, a LaTeX command, braces or math included, is printed unchanged. Any other character is written {?}, and bibtex prints "warning: <key>: no ASCII form for U+<hex>, written {?}" on standard error for each, <hex> in upper case with at least four digits; the entry is printed and the exit status is as for any printed entry.
- The title ratio, which resolve, bibtex and the title check of check-urls compare by, first writes each form above that holds a letter back as its character and puts the title in NFC, so that a converted entry has the ratio of the original. A form of punctuation alone is dropped by the comparison as its character is.
- cite-keys reads the keys the .tex cites (see "The keys a .tex cites") and the keys of the .bib. It prints "missing: <key>" for each cited key the .bib lacks, in the order the keys first occur in the .tex, then "unused: <key>" for each .bib entry no cited key names, in the order of the .bib. It prints nothing when every cited key has an entry and every entry is cited.
- check-urls reads the keys the .tex cites and the .bib. For each cited key it prints the HTTP status, after redirects, of the key's doi (as https://doi.org/<doi>), else its eprint (as https://arxiv.org/abs/<id>), else its url. A cited key with none of the three is printed as "no identifier", a cited key the .bib lacks as "no entry in <the .bib's file name>", and a URL that gives no answer as "failed, <reason>". A .tex that cites no key prints "the .tex cites no key".
- check-urls also checks the title of a key whose entry has a doi. The doi is stripped to the bare DOI and percent-encoded as resolve does, and the entry's title is compared, by the title ratio of resolve, with the title of the first record the doi resolves to. The indexes are asked in the order Crossref, OpenAlex, Semantic Scholar, and the next one is asked when an index answers "not found" or is left out. The line of the key then ends with ", ratio <r> against <index>", the ratio written as resolve writes it, followed by ", DOI_MISMATCH" when the ratio is below 0.70. It ends with ", doi not found in Crossref, OpenAlex or Semantic Scholar" when each of the three answered "not found", and with ", title not checked: <index> left out, <reason>" when no index gave a record and one or more was left out, one clause for each index left out, the clauses separated by "; ". A key whose URL gave no answer gets the same ending after its "failed, <reason>". A key with a doi costs up to three requests more than its status request.
- fetch writes the full text of a source into <folder>, named from <key> with each / and : written _ (<stem>). It tries, in order, https://arxiv.org/html/<id> and https://arxiv.org/pdf/<id> when the input holds an arXiv ID, the open_access.oa_url of OpenAlex and the openAccessPdf.url of Semantic Scholar. HTML counts only from arxiv.org/html. From every other source only a body starting %PDF- counts. With --page <url>, fetch first reads the venue's page at <url> and tries the PDF its citation_pdf_url names, as an address joined to the page's address after redirects, printing "page <url>: citation_pdf_url <address>", or "page <url>: <reason>" for a page that cannot be read or "page <url>: no citation_pdf_url tag"; when that gives no full text it goes on as without --page. The first that counts is written as <stem>.html or <stem>.pdf, and its text as <stem>.txt, by pdftotext (called with its arguments as a list) for a PDF, with the tags removed by html.parser and the text of script and style elements left out for HTML. A PDF whose text pdftotext cannot make or makes empty counts as no text and is removed, and the next URL is tried. When no full text is found, the abstract the indexes return (the arXiv summary, else the Semantic Scholar abstract, else the OpenAlex abstract_inverted_index put back in word order) is written as <stem>.abstract.txt. Given a Semantic Scholar ID (40 hexadecimal digits) or an OpenAlex ID (W...), fetch asks only the index the ID belongs to for the work's record. When the record gives a DOI, or else an arXiv ID, fetch goes on as for that input. Otherwise it tries the record's open-access URL, and when no full text is found it writes that index's abstract as <stem>.abstract.txt. fetch prints each lookup and each URL tried with its status, and exits 1 when no full text was found.
- quote-check reads the citation report, the .bib and the texts in <folder>. For each passage line "> [@<key>, <locator>]: "<passage>"" of the report it prints found or not found ("not found, no <file>" when the text file is missing); the passage is the text between the first " after "]: " and the last " of the line. It looks the passage up in <folder>/<stem>.txt, or in <folder>/<stem>.abstract.txt when the locator is abstract. Both texts are normalised first: every hyphen at a line end is removed with its line break, every hyphen between two letters is removed, then each run of whitespace becomes one space. A passage is found when the normalised passage occurs in the normalised text, and an empty passage is never found. A line that starts "> [@" and does not have the form of a passage line is printed as malformed. It also prints each cited key with no passage line ("no passage"), each cited key the .bib lacks ("no entry") and each cited key with neither <stem>.txt nor <stem>.abstract.txt in the folder ("no text"). A report that cites no key prints "the citation report cites no key".
- text writes the text of a saved HTML, XML or PDF file <file> into <folder> as <stem>.txt, <stem> made from <key> as fetch makes it, so that quote-check reads a passage in it. With --abstract it writes <stem>.abstract.txt in place of <stem>.txt, for a page that holds only the source's abstract, so that quote-check reads a passage with the locator abstract in it; every other rule below is the same, with <stem>.abstract.txt for <stem>.txt. A body whose first character other than a UTF-8 byte order mark and blank text is < is HTML or XML: it is decoded as UTF-8 after a byte order mark, else by the charset that an XML declaration's encoding or the first meta tag naming a charset declares, else as UTF-8, a byte that does not decode being replaced, and its text is made as fetch makes the text of an HTML copy. A body starting %PDF- is a PDF: pdftotext is run on the file's absolute path, called with its arguments as a list and the timeout fetch uses. The text is written to a temporary file of <folder> and linked to <stem>.txt only when it holds text other than whitespace, so that no <stem>.txt is left otherwise and an existing one is never replaced; the written file is read back and compared with the text. It prints "<stem>.txt: <n> characters from <file>", <n> being the characters of the text, and exits 0. A text that is empty, or a PDF for which pdftotext exits non-zero or times out, prints "<file>: no text" and exits 1, writing nothing. text makes no request and reads and writes no cache.

A citation in a citation report is [@<key>, <locator>] or [@<a>; @<b>, <locator>]. A line that is a passage line contributes the key of its leading citation only; the passage is not searched for citations.

The keys a .tex cites, read by cite-keys and check-urls:

- The files are the main .tex and, where each \input{<name>} or \include{<name>} stands in a file read, the file it names, followed in turn. A name is joined to the main file's folder, whatever the working directory and whatever the folder of the file that names it, and gets .tex added when it has no extension. A name that ends in .tex or has another extension is read as it is written, a .. in a name is followed as written, and an absolute name stays absolute. A file named twice is read once.
- Text from a % that is not preceded by a backslash to the end of the line is left out before any command is read, so a commented \input or \cite is neither followed nor read.
- The keys are those of every command whose name contains cite or Cite (\cite, \citep, \citet, \textcite, \parencite, \autocite and the like, with or without a star) that has a braced argument, except \nocite, which is not read. White space before the argument and optional [...] arguments are skipped, and the braced argument may run over several lines. The keys of one call are split at commas and stripped of white space at both ends, and an empty part is no key. A command with no braced argument cites nothing.
- Each key is listed once, at its first occurrence.

Pacing and failures:

- Requests to a paced host (listed below) are made one at a time, across every lookup.py process that uses the same temporary folder (tempfile.gettempdir()). At least the host's gap passes between the end of one request and the start of the next.
- A redirect is a request to the host it goes to and takes that host's turn.
- Each request is made while holding an exclusive flock on the host's lock file in the temporary folder. The file holds the time the last request to the host ended.
- A lock file that cannot be opened, locked or read, or that holds text other than a time, makes the request wait the full gap. An empty file, as a new one is, makes it wait not at all.
- api.crossref.org is paced by the lock file ordo-lookup-crossref, with a gap of 1 second, or 0.35 second when CROSSREF_POLITE_EMAIL is set.
- api.openalex.org is paced by the lock file ordo-lookup-openalex, with a gap of 1.05 seconds, or 0.21 second when OPENALEX_API_KEY is set.
- api.semanticscholar.org is paced by the lock file ordo-lookup-semanticscholar, with a gap of 2 seconds, with S2_API_KEY set or not.
- eutils.ncbi.nlm.nih.gov (PubMed's E-utilities) is paced by the lock file ordo-lookup-pubmed, with a gap of 0.4 second.
- www.ebi.ac.uk (Europe PMC) is paced by the lock file ordo-lookup-europepmc, with a gap of 0.2 second.
- sparql.dblp.org (DBLP) is paced by the lock file ordo-lookup-dblp, with a gap of 2 seconds. A request to it waits 30 seconds for an answer, as every other request does.
- arxiv.org, www.arxiv.org and export.arxiv.org are paced together by the lock file ordo-lookup-arxiv, with a gap of 3 seconds.
- Every other host (doi.org, a publisher's site, an open-access URL) is not paced.
- An HTTP 429 is retried at most 3 times, each retry in a new turn of its host. The wait runs after the host's lock is released.
- A 429 whose Retry-After holds a whole number of seconds from 0 to 60 waits that many seconds, and a value below 1 waits 1 second.
- A 429 whose Retry-After holds an HTTP date waits the seconds from now to that date, rounded up. A date in the past waits 1 second, and a date with no zone is read as GMT.
- A 429 with no Retry-After, or with any other text in it (a fraction such as 2.5, a negative number, a word), waits 2, then 4, then 8 seconds.
- After the third retry the index is left out with the reason "HTTP 429 after 3 retries".
- A 429 whose Retry-After holds a whole number, or a date, more than 60 seconds ahead is not retried. The request is left out at once with the reason "HTTP 429, retry after <n> s", <n> being the seconds of Retry-After rounded up.
- The API hosts are api.crossref.org, api.openalex.org, api.semanticscholar.org, eutils.ncbi.nlm.nih.gov, www.ebi.ac.uk, sparql.dblp.org and export.arxiv.org. Such a 429 from an API host also writes the time of the reset to the skip file of the host in the temporary folder. From any other host it writes no file.
- The time of the reset is now plus <n> seconds, with <n> capped at 86400.
- The skip file is ordo-lookup-skip-<name>, <name> being crossref, openalex, semanticscholar, pubmed, europepmc, dblp or arxiv. -key is appended to it when the credential of that host is set (CROSSREF_POLITE_EMAIL, OPENALEX_API_KEY or S2_API_KEY), since a budget is per key.
- The skip file is written to a temporary file of the folder with mode 600 and moved into place, so a reader sees a whole time or no file.
- While the time in a skip file is in the future, a request to its host is not sent. It is left out with the reason "HTTP 429, retry after <n> s", <n> being the whole seconds left, rounded up.
- A reply that the cache holds is used before the skip is read. The skip never applies to arxiv.org and www.arxiv.org.
- A skip file that cannot be read, or that holds text other than a time, is ignored.
- A skip is cleared by deleting its file, for example with rm ordo-lookup-skip-* in the temporary folder.
- fetch prints the reason of a 429 for the URL it tried, and bibtex prints "doi.org: <reason>, not a BibTeX entry" on standard error.
- A redirect can lead to another host than that of the URL the call was given. A long 429 or a skip met on that host gives the reason "HTTP 429 at <host>, retry after <n> s", which names it. On the URL's own host the reason stays "HTTP 429, retry after <n> s".
- check-urls prints the status 429 for a key's URL, and "failed, <reason>" for a URL whose request a skip prevented. It names the reason for an index of its title check.
- resolve, search, refs, cited-by and dblp store each reply that an API host answers with status 200 and a body the script parses, keyed by its URL: the batch requests of resolve over several inputs, PubMed's part of search and DBLP's query included. A 200 that parses to no result is stored too.
- A stored reply is used for 30 days. The same URL asked again by any lookup.py process of these five commands sends no request.
- Nothing else is stored: no other status, no body that does not parse, no other host.
- bibtex, check-urls, fetch and index-abstract neither read nor write the cache, so a BibTeX entry, a title check and an abstract come from the replies of the run.
- The cache is the folder ordo-lookup under XDG_CACHE_HOME when that is an absolute path, else under ~/.cache. It is made with mode 700. When the home folder cannot be resolved to an absolute path and XDG_CACHE_HOME is not absolute, the cache is off for the run.
- Each entry is a file with mode 600, named by the SHA-256 hexadecimal digest of the URL, that holds the URL, the time stored and the body. The URL holds no credential. The file is written to a temporary file of the folder and moved into place.
- A folder that cannot be made or written, an entry that cannot be read or parsed, and a temporary file are treated as no entry. The request is sent and no error is printed.
- At its first store, a process removes the entries older than 30 days and the temporary files older than 1 day. The cache is cleared by deleting the folder.
- An index that answers 404, or 200 with no result, is "not found". An index that answers any other status, fails to connect, or answers a body that does not parse or lacks a field the script reads is left out with its reason, and the other indexes and the records already found go on. No field is written for a lookup that failed.
- Only http and https URLs are requested, including every URL an index returns and every redirect.

Reads:

- The arguments of the call.
- The environment variables S2_API_KEY (sent in the x-api-key header to api.semanticscholar.org), OPENALEX_API_KEY (sent as the api_key parameter to api.openalex.org) and CROSSREF_POLITE_EMAIL (sent as the mailto parameter and in the User-Agent to api.crossref.org). Each is optional, and no value is ever printed.
- The environment variables XDG_CACHE_HOME and HOME, which place the cache folder.
- The header Retry-After of a 429 reply.
- The indexes at https://api.crossref.org, https://api.openalex.org, https://api.semanticscholar.org/graph/v1, https://eutils.ncbi.nlm.nih.gov/entrez/eutils, https://www.ebi.ac.uk/europepmc/webservices/rest, https://sparql.dblp.org/sparql and https://export.arxiv.org, https://doi.org, https://arxiv.org, and each URL an index returns for an open-access copy.
- For bibtex --page and fetch --page: the venue's page at the url given or the entry's url, and for fetch --page the PDF its citation_pdf_url names. A venue's page is not paced and not stored.
- For cite-keys and check-urls: the main .tex, each file it inputs or includes, and the .bib. For quote-check: the citation report, the .bib, <folder>/<stem>.txt and <folder>/<stem>.abstract.txt.
- For fetch: the program pdftotext, which it runs on the PDF it wrote.
- For text: <file>, and the program pdftotext, which it runs on <file> when it is a PDF.
- For every request to a paced host: its lock file (ordo-lookup-crossref, ordo-lookup-openalex, ordo-lookup-semanticscholar, ordo-lookup-pubmed, ordo-lookup-europepmc, ordo-lookup-dblp or ordo-lookup-arxiv) in the temporary folder.
- For every request to an API host: the host's skip file ordo-lookup-skip-<name>, with -key appended when the host's credential is set, in the temporary folder.
- For resolve, search, refs, cited-by and dblp: the files of the cache folder.
- For index-abstract: whether <folder>/<stem>.abstract.txt exists.

Writes: fetch writes <stem>.html, <stem>.pdf, <stem>.txt and <stem>.abstract.txt inside <folder>. index-abstract writes <stem>.abstract.txt inside <folder>, with mode 600, through a temporary file of that folder that it removes. text writes <stem>.txt, or with --abstract <stem>.abstract.txt, inside <folder>, with mode 600, through a temporary file of that folder that it removes. Every request to a paced host writes the time it ended to the host's lock file in the temporary folder, when it could open the file. It creates the file with mode 600 when it is absent. A 429 that names more than 60 seconds, from an API host, writes that host's skip file in the temporary folder, with mode 600. resolve, search, refs, cited-by and dblp write the cache entries with mode 600 in the cache folder, which they make with mode 700, making any missing parent folder with the default mode. At their first store they remove the old entries and temporary files of that folder. Nothing else is written.

Errors, each printed as one line on standard error:

- "usage: lookup.py <command> ..." followed by the command list, for no command or an unknown command.
- "error: <command> takes <arguments>", for a wrong count of arguments, and for refs, cited-by, index-abstract and dblp given no identifier or title, or index-abstract given no --into.
- "error: unknown option <option>", "error: <command> needs a value after <option>", "error: --year needs a four-digit year" and "error: --since needs a four-digit year".
- "error: <value> is not a DOI, an arXiv ID, a PMID, an OpenAlex ID or a Semantic Scholar ID", for refs and cited-by, and "error: <value> is not a DOI, an arXiv ID or a PMID", for index-abstract.
- "error: <title> has no word to look up", for dblp given a title with no letter or digit.
- "error: <value> is not a DOI or an arXiv ID", for bibtex.
- "error: --page needs an arXiv ID", for bibtex --page given a DOI that is not of the form 10.48550/arXiv.<id>.
- "error: <value> is not a DOI, an arXiv ID, a Semantic Scholar ID or an OpenAlex ID", for fetch.
- "error: the key is empty", for fetch and text.
- "error: <folder>: not a folder", for fetch, quote-check, text and index-abstract.
- "error: <folder>/<stem>.txt exists", for text, when <stem>.txt exists as a file or as a link, a dangling link included; with --abstract the same for <stem>.abstract.txt.
- "error: <file>: not an HTML, XML or PDF file", for text given a body that is neither, an empty file included.
- "error: pdftotext not found", for text given a PDF when pdftotext is not installed.
- "error: <folder>/<stem>.txt: the text read back differs from the text made", for text, which then removes the file.
- "error: <path>: <reason>", for a .tex, an \input or \include file, a .bib, a citation report or the file of text that cannot be read (the reason is the operating system's, or "not valid UTF-8"), and for a file fetch or text cannot write. The path of an \input or \include file is the main file's folder joined with the name, with .tex added when the name has no extension.

Two lines are printed on standard output among the other lines and not as an error of the call: resolve over several inputs prints "error: <argument> is not a DOI or an arXiv ID" in that argument's block, and index-abstract prints "error: <folder>/<stem>.abstract.txt exists" for an identifier whose file exists, and goes on with the others.

Exit status: 0 when the command ran and found nothing to fail; 1 when resolve over several inputs printed an error block or an input got no record from any index, when refs or cited-by got no list for an input from any index, when index-abstract got no abstract for an identifier, when dblp found no record for a title or left DBLP out, when bibtex got no BibTeX entry (bibtex --page refusing the page included), when cite-keys printed a line, when check-urls or quote-check found a failure (a URL not ending in a 2xx status or giving no answer, a key printed as having no identifier, no entry, no passage or no text, a title flagged DOI_MISMATCH, a doi not found, a title not checked, a passage not found, a malformed passage line), when fetch found no full text, or when text printed "no text"; 2 for a call it cannot read (every error line above), and for index-abstract when it refused an existing file.
"""

import datetime
import difflib
import email.utils
import fcntl
import hashlib
import html
import http.client
import json
import math
import os
import re
import subprocess
import sys
import tempfile
import time
import unicodedata
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import dataclass, field, replace
from html.parser import HTMLParser

MATCH_THRESHOLD = 0.70
ARXIV_SPACING = 3.0
LOCK_PREFIX = "ordo-lookup-"
ARXIV_LOCK_NAME = LOCK_PREFIX + "arxiv"
SKIP_PREFIX = "ordo-lookup-skip-"
RETRY_WAITS = (2.0, 4.0, 8.0)
RETRIES = len(RETRY_WAITS)
LONG_WAIT = 60
SKIP_CAP = 86400
CACHE_NAME = "ordo-lookup"
CACHE_AGE = 30 * 86400
TEMPORARY_AGE = 86400
TEMPORARY_PREFIX = "tmp."
TIMEOUT = 30
PDFTOTEXT_TIMEOUT = 120
MAX_REDIRECTS = 10
TITLE_CANDIDATES = 5
SEARCH_LIMIT = 20
INDEX_NAMES = ("Crossref", "OpenAlex", "Semantic Scholar", "arXiv")
SEARCH_NAMES = INDEX_NAMES + ("PubMed",)
# The indexes index-abstract asks, in its order: first those resolve asks, then the biomedical indexes, then arXiv.
ABSTRACT_NAMES = ("OpenAlex", "Semantic Scholar", "Crossref", "Europe PMC", "PubMed", "arXiv")
# The works of one OpenAlex request of refs and of resolve over several inputs, and of one Crossref or arXiv request of resolve over several inputs.
OPENALEX_BATCH = 50
BATCH = 50
# refs and cited-by print at most this many works of one input.
LIST_CAP = 1000
OPENALEX_PAGE = 200
ARXIV_HOSTS = ("arxiv.org", "export.arxiv.org", "www.arxiv.org")
# host: (name, seconds from the end of one request to the start of the next, the same when the host's credential is set). The arXiv hosts are paced by arxiv_turn.
PACED_HOSTS = {
    "api.crossref.org": ("crossref", 1.0, 0.35),
    "api.openalex.org": ("openalex", 1.05, 0.21),
    "api.semanticscholar.org": ("semanticscholar", 2.0, 2.0),
    "eutils.ncbi.nlm.nih.gov": ("pubmed", 0.4, 0.4),
    "www.ebi.ac.uk": ("europepmc", 0.2, 0.2),
    "sparql.dblp.org": ("dblp", 2.0, 2.0),
}
# The hosts of the indexes with the name of each in the skip files: a 429 from one of them that asks a long wait is written to its skip file, and its 200 replies are cached.
API_HOSTS = {**{host: name for host, (name, _, _) in PACED_HOSTS.items()}, "export.arxiv.org": "arxiv"}
CACHED_COMMANDS = ("resolve", "search", "refs", "cited-by", "dblp")
EUTILS = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils"
EUROPEPMC = "https://www.ebi.ac.uk/europepmc/webservices/rest"
DBLP_SPARQL = "https://sparql.dblp.org/sparql"
DBLP_ACCEPT = "application/sparql-results+json"
# The records of a title in DBLP: one row for each record and type other than dblp:Publication, which every record has. @MATCH@ is the part that picks the titles: the exact titles of DBLP_EXACT, or the words of DBLP_WORDS.
DBLP_LIMIT = 1000
DBLP_QUERY = (
    "PREFIX dblp: <https://dblp.org/rdf/schema#> PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> "
    "SELECT ?publ ?title ?venue ?year ?pages ?type WHERE { @MATCH@ "
    "?publ rdf:type ?type . FILTER(?type != dblp:Publication) "
    "OPTIONAL { ?publ dblp:publishedIn ?venue } OPTIONAL { ?publ dblp:yearOfPublication ?year } "
    f"OPTIONAL {{ ?publ dblp:pagination ?pages }} }} LIMIT {DBLP_LIMIT}"
)
# @TITLES@ is the title's forms, each a quoted literal: DBLP's index answers a title given exactly at once.
DBLP_EXACT = "VALUES ?title { @TITLES@ } ?publ dblp:title ?title ."
# @PHRASE@ is the longest run of the title's words, lower-cased: a scan of every title, asked only when no exact form is found.
DBLP_WORDS = '?publ dblp:title ?title . FILTER(CONTAINS(LCASE(?title), "@PHRASE@"))'
DBLP_RECORD = "https://dblp.org/rec/"
USER_AGENT = "lookup.py (the paper skill of Ordo)"
ATOM = "{http://www.w3.org/2005/Atom}"
ARXIV_ATOM = "{http://arxiv.org/schemas/atom}"
S2_FIELDS = "paperId,title,authors,year,venue,externalIds,openAccessPdf,journal"
OPENALEX_FIELDS = "id,title,authorships,publication_year,primary_location,doi,open_access,ids,biblio"
CROSSREF_FIELDS = "DOI,title,author,issued,container-title,volume,issue,page"
# The fields bibtex asks of an arXiv ID's record to find its published version, in requests of their own, so that the requests of the other commands and their cached replies stay as they are.
S2_PUBLISHED_FIELDS = "paperId,title,externalIds,publicationVenue"
OPENALEX_PUBLISHED_FIELDS = "id,title,doi,locations"
PUBLISHED_VENUE_TYPES = ("conference", "journal")
# A venue's page is never read on these hosts, which hold the preprint or redirect to a page of the work.
PAGE_EXCLUDED_HOSTS = ("doi.org", "dx.doi.org", "www.doi.org", "arxiv.org", "www.arxiv.org", "export.arxiv.org")
PAGE_ACCEPT = "text/html,application/xhtml+xml;q=0.9,*/*;q=0.8"
VENUE_PAGE = "<the venue's page of the work>"
NOTICE_TYPES = ("retraction", "partial_retraction", "expression_of_concern")
# The fields of a Record that search counts to choose the record kept when two records merge.
COUNTED_FIELDS = ("title", "authors", "year", "venue", "doi", "arxiv_id", "openalex_id", "s2_id", "pmid", "oa_urls", "abstract")
# The fields the record kept takes from the other record when its own is empty.
RECORD_FIELDS = ("title", "authors", "year", "venue", "volume", "issue", "pages", "doi", "arxiv_id", "openalex_id", "s2_id", "pmid", "oa_urls", "abstract")

DOI_PREFIX = re.compile(r"^(?:https?://(?:dx\.)?doi\.org/|doi:)", re.IGNORECASE)
DOI_PATTERN = re.compile(r"^10\.\d{4,9}/\S+$")
ARXIV_NEW = re.compile(r"^\d{4}\.\d{4,5}(?:v\d+)?$")
ARXIV_OLD = re.compile(r"^[a-z]+(?:-[a-z]+)*(?:\.[A-Za-z]{2})?/\d{7}(?:v\d+)?$")
ARXIV_DOI = re.compile(r"^10\.48550/arxiv\.(.+)$", re.IGNORECASE)
VERSION_SUFFIX = re.compile(r"v\d+$")
S2_ID = re.compile(r"^[0-9a-f]{40}$")
OPENALEX_ID = re.compile(r"^W\d+$")
PMID_INPUT = re.compile(r"^pmid:(\d+)$", re.IGNORECASE)
# A DOI holding | or , is never put in a filter of several DOIs: OpenAlex reads | as OR there and , separates two filters, percent-encoded or not.
FILTER_SEPARATORS = re.compile(r"[|,]")
# The tags of an abstract's markup (JATS, HTML) that end a line; every other tag is dropped.
LINE_TAG = re.compile(r"<\s*/?\s*(?:[A-Za-z][\w.-]*:)?(?:p|h[1-6]|title|sec|div|br|li|abstract)\b[^>]*>", re.IGNORECASE)
ANY_TAG = re.compile(r"<[^>]*>")
CITATION = re.compile(r"\[(@[^\[\]]*)\]")
PASSAGE_LEAD = re.compile(r"^>\s*\[@([^,;\]\s]+),\s*([^\]]+)\]:\s")
PASSAGE_START = re.compile(r"^>\s*\[@")
PARSE_ERRORS = (ValueError, KeyError, TypeError, AttributeError, IndexError, ET.ParseError)
BLOCK_TAGS = frozenset(
    (
        "address", "article", "aside", "blockquote", "caption", "dd", "div", "dl", "dt", "figcaption", "figure",
        "footer", "h1", "h2", "h3", "h4", "h5", "h6", "header", "li", "main", "nav", "ol", "p", "pre", "section",
        "table", "td", "th", "tr", "ul",
    )
)
SKIPPED_TAGS = frozenset(("script", "style"))
QUERY_TOKEN = re.compile(r'"[^"]*"|[()]|\w+')
QUERY_OPERATORS = ("AND", "OR", "NOT")
TEX_COMMENT = re.compile(r"(?<!\\)%.*")
TEX_CALL = re.compile(
    r"\\(?:input|include)(?![A-Za-z@])\s*\{(?P<name>[^}]*)\}"
    r"|\\(?!nocite(?![A-Za-z]))[A-Za-z]*[Cc]ite[A-Za-z]*\*?(?:\s*\[[^\]]*\])*\s*\{(?P<keys>[^}]*)\}"
)
COMMANDS = ("resolve", "search", "refs", "cited-by", "index-abstract", "dblp", "bibtex", "cite-keys", "check-urls", "fetch", "quote-check", "text")
PMCID = re.compile(r"(PMC\d+)/?$")
UTF8_BOM = b"\xef\xbb\xbf"
# The charset a saved page declares: an XML declaration's encoding, else the first meta tag that names a charset.
XML_ENCODING = re.compile(rb"<\?xml[^>]*?encoding\s*=\s*[\"']([A-Za-z0-9._-]+)", re.IGNORECASE)
META_CHARSET = re.compile(rb"<meta[^>]*?charset\s*=\s*[\"']?([A-Za-z0-9._-]+)", re.IGNORECASE)

# The LaTeX form of each character bibtex writes in ASCII, by code point. An accented letter that is not here is written by ACCENTS.
LATEX_FORMS = {
    0x00DF: r"{\ss}", 0x00F8: r"{\o}", 0x00D8: r"{\O}", 0x0142: r"{\l}", 0x0141: r"{\L}",
    0x00E6: r"{\ae}", 0x00C6: r"{\AE}", 0x0153: r"{\oe}", 0x0152: r"{\OE}",
    0x03B1: r"{$\alpha$}", 0x03B2: r"{$\beta$}", 0x03B3: r"{$\gamma$}", 0x03B4: r"{$\delta$}", 0x03B5: r"{$\varepsilon$}", 0x03F5: r"{$\epsilon$}",
    0x03B6: r"{$\zeta$}", 0x03B7: r"{$\eta$}", 0x03B8: r"{$\theta$}", 0x03D1: r"{$\vartheta$}", 0x03B9: r"{$\iota$}", 0x03BA: r"{$\kappa$}",
    0x03BB: r"{$\lambda$}", 0x03BC: r"{$\mu$}", 0x03BD: r"{$\nu$}", 0x03BE: r"{$\xi$}", 0x03C0: r"{$\pi$}", 0x03C1: r"{$\rho$}",
    0x03C2: r"{$\varsigma$}", 0x03C3: r"{$\sigma$}", 0x03C4: r"{$\tau$}", 0x03C5: r"{$\upsilon$}", 0x03C6: r"{$\varphi$}", 0x03D5: r"{$\phi$}",
    0x03C7: r"{$\chi$}", 0x03C8: r"{$\psi$}", 0x03C9: r"{$\omega$}",
    0x0393: r"{$\Gamma$}", 0x0394: r"{$\Delta$}", 0x0398: r"{$\Theta$}", 0x039B: r"{$\Lambda$}", 0x039E: r"{$\Xi$}", 0x03A0: r"{$\Pi$}",
    0x03A3: r"{$\Sigma$}", 0x03A5: r"{$\Upsilon$}", 0x03A6: r"{$\Phi$}", 0x03A8: r"{$\Psi$}", 0x03A9: r"{$\Omega$}",
    0x2010: "-", 0x2011: "-", 0x2013: "--", 0x2014: "---", 0x2212: "{$-$}", 0x2018: "`", 0x2019: "'", 0x201C: "``", 0x201D: "''",
    0x00A0: "~", 0x2026: r"\ldots{}", 0x00AE: r"\textregistered{}", 0x00A9: r"\textcopyright{}", 0x2122: r"\texttrademark{}",
    0x00B0: r"\textdegree{}", 0x00D7: r"{$\times$}", 0x00B1: r"{$\pm$}", 0x2264: r"{$\leq$}", 0x2265: r"{$\geq$}",
}
# The accent command of each combining mark, by code point: a symbol is written {\'e}, a letter {\c{c}}.
ACCENTS = {
    0x0301: "'", 0x0300: "`", 0x0302: "^", 0x0308: '"', 0x0303: "~", 0x0327: "c", 0x030C: "v",
    0x030A: "r", 0x0304: "=", 0x0307: ".", 0x0306: "u", 0x0328: "k", 0x030B: "H",
}
LATEX_ACCENT = re.compile(r"\{\\(?:([`'^\"~=.])(\\[ij]|[A-Za-z])|([cvrukH])\{(\\[ij]|[A-Za-z])\})\}")
# The forms that hold a letter, mapped back to their character before a title is compared; a form of punctuation alone is dropped by the comparison as its character is.
LATEX_LETTERS = {form: chr(point) for point, form in LATEX_FORMS.items() if re.search(r"[A-Za-z]", form)}
LATEX_LETTER = re.compile("|".join(re.escape(form) for form in sorted(LATEX_LETTERS, key=len, reverse=True)))
URL_FIELDS = ("url", "doi")
ENTRY_HEAD = re.compile(r"\s*@\w+\s*[{(]")
FIELD_GAP = re.compile(r"[ \t\r\n,]*")
FIELD_NAME = re.compile(r"([A-Za-z][\w\-:.]*)\s*=")

class UsageError(Exception):
    """A call the script cannot read: the message is printed after "error: " (or whole, when it starts "usage:")."""


class LeftOut(Exception):
    """An index or a URL that gave no answer to use: the message is the reason printed for it."""


class ExcludedPage(Exception):
    """A venue's page whose address, before or after redirects, is on a host of PAGE_EXCLUDED_HOSTS: the message is the reason printed for it."""


@dataclass
class Record:
    title: str = ""
    authors: list = field(default_factory=list)
    year: int = 0
    venue: str = ""
    volume: str = ""
    issue: str = ""
    pages: str = ""
    doi: str = ""
    arxiv_id: str = ""
    openalex_id: str = ""
    s2_id: str = ""
    oa_urls: list = field(default_factory=list)
    abstract: str = ""
    indexes: list = field(default_factory=list)
    notices: list = field(default_factory=list)
    pmcid: str = ""
    pmid: str = ""


@dataclass
class Outcome:
    """What one index gave: its records, or the reason it was left out. No record and no reason is "not found"."""

    records: list = field(default_factory=list)
    left_out: str = ""


@dataclass
class Published:
    """What Semantic Scholar or OpenAlex says of the published version of an arXiv ID: the record's title, the DOIs it names and Semantic Scholar's publicationVenue."""

    title: str = ""
    dois: list = field(default_factory=list)
    venue: dict = field(default_factory=dict)


@dataclass
class Identifier:
    kind: str  # "doi", "arxiv" or "title"; for refs, cited-by and index-abstract also "pmid", "openalex" or "s2"
    text: str
    doi: str = ""
    arxiv_id: str = ""
    pmid: str = ""


@dataclass
class Reply:
    status: int
    body: bytes
    url: str
    content_type: str = ""
    reason: str = ""  # what to print for the status when it is not just "HTTP <status>"

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
    title = re.sub(r"[^\w ]|_", "", unicodedata.normalize("NFC", from_latex(title or "")).lower())
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


def quote_filter_value(value):
    """A DOI or an ID put in a filter of several values: every character other than a letter, a digit and _.-~ percent-encoded, so that none of ; < > # ( ) is read by the URL or the filter."""
    return urllib.parse.quote(value, safe="")


def classify_work(text):
    """The Identifier of a work for refs, cited-by and index-abstract: a DOI or an arXiv ID as classify reads it, else PMID:<n>, an OpenAlex ID (W...) or a Semantic Scholar ID (40 hexadecimal digits); kind "title" for any other text."""
    text = text.strip()
    identifier = classify(text)
    if identifier.kind != "title":
        return identifier
    pmid = PMID_INPUT.match(text)
    if pmid:
        return Identifier("pmid", text, pmid=pmid.group(1))
    if OPENALEX_ID.match(text):
        return Identifier("openalex", text)
    if S2_ID.match(text):
        return Identifier("s2", text)
    return identifier


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


def index_value(value):
    """The text of a volume, an issue or a page an index gives, "" for a field that is null or absent."""
    return "" if value is None else collapse_spaces(str(value))


def page_range(pages):
    """A page range written with two hyphens, as BibTeX writes one; a single page stays as it is."""
    return re.sub(r"\s*-+\s*", "--", index_value(pages))


def abstract_from_inverted_index(index):
    words = {}
    for word, positions in (index or {}).items():
        for position in positions:
            words[position] = word
    return " ".join(words[position] for position in sorted(words))


def notice_date(update):
    stamp = (update.get("updated") or {}).get("date-time") or ""
    if re.match(r"\d{4}-\d{2}-\d{2}", stamp):
        return stamp[:10]
    parts = ((update.get("updated") or {}).get("date-parts") or [[]])[0]
    return "-".join(f"{part:04d}" if number == 0 else f"{part:02d}" for number, part in enumerate(parts) if isinstance(part, int))


def crossref_notices(item):
    """The retraction and expression-of-concern notices in the updated-by field of a Crossref work, as lines for resolve."""
    lines = []
    for update in item.get("updated-by") or []:
        if update.get("type") not in NOTICE_TYPES:
            continue
        parts = [update["type"], notice_date(update)]
        if update.get("DOI"):
            parts.append("doi " + update["DOI"])
        if update.get("source"):
            parts.append("source " + update["source"])
        lines.append("Crossref notice: " + " | ".join(part for part in parts if part))
    return lines


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
            volume=index_value(item.get("volume")),
            issue=index_value(item.get("issue")),
            pages=page_range(item.get("page")),
            doi=item.get("DOI") or "",
            indexes=["Crossref"],
            notices=crossref_notices(item),
        )
    )


def parse_crossref_work(text):
    return parse_crossref_item(json.loads(text)["message"])


def parse_crossref_search(text):
    return [parse_crossref_item(item) for item in json.loads(text)["message"]["items"]]


def parse_openalex_work_object(work):
    source = (work.get("primary_location") or {}).get("source") or {}
    oa_url = (work.get("open_access") or {}).get("oa_url")
    pmcid = PMCID.search((work.get("ids") or {}).get("pmcid") or "")
    biblio = work.get("biblio") or {}
    first_page, last_page = index_value(biblio.get("first_page")), index_value(biblio.get("last_page"))
    return normalise_record(
        Record(
            title=collapse_spaces(work.get("title") or work.get("display_name")),
            authors=[collapse_spaces(a["author"]["display_name"]) for a in work.get("authorships") or []],
            year=work.get("publication_year") or 0,
            venue=collapse_spaces(source.get("display_name")),
            volume=index_value(biblio.get("volume")),
            issue=index_value(biblio.get("issue")),
            pages=f"{first_page}--{last_page}" if first_page and last_page else first_page,
            doi=strip_doi(work.get("doi") or ""),
            openalex_id=work["id"].rstrip("/").rsplit("/", 1)[-1],
            oa_urls=[oa_url] if oa_url else [],
            abstract=abstract_from_inverted_index(work.get("abstract_inverted_index")),
            indexes=["OpenAlex"],
            pmcid=pmcid.group(1) if pmcid else "",
        )
    )


def parse_openalex_work(text):
    return parse_openalex_work_object(json.loads(text))


def parse_openalex_search(text):
    return [parse_openalex_work_object(work) for work in json.loads(text)["results"]]


def parse_s2_paper_object(paper):
    external = paper.get("externalIds") or {}
    oa_url = (paper.get("openAccessPdf") or {}).get("url")
    journal = paper.get("journal") or {}
    return normalise_record(
        Record(
            title=collapse_spaces(paper.get("title")),
            authors=[collapse_spaces(a.get("name")) for a in paper.get("authors") or [] if a.get("name")],
            year=paper.get("year") or 0,
            venue=collapse_spaces(paper.get("venue")),
            volume=index_value(journal.get("volume")),
            pages=page_range(journal.get("pages")),
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


def parse_s2_published(text):
    paper = json.loads(text)
    if "paperId" not in paper:
        raise KeyError("paperId")
    doi = (paper.get("externalIds") or {}).get("DOI") or ""
    venue = paper.get("publicationVenue")
    return Published(collapse_spaces(paper.get("title")), [doi] if doi else [], venue if isinstance(venue, dict) else {})


def parse_openalex_published(text):
    """The DOIs an OpenAlex work names: its doi, and each landing_page_url of its locations that is a doi.org address."""
    work = json.loads(text)
    if "id" not in work:
        raise KeyError("id")
    dois = [work.get("doi") or ""]
    dois += [location.get("landing_page_url") or "" for location in work.get("locations") or [] if DOI_PREFIX.match(location.get("landing_page_url") or "")]
    return Published(collapse_spaces(work.get("title")), dois=[strip_doi(doi) for doi in dois if doi])


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


def parse_openalex_links(text):
    """(the OpenAlex ID of a work, the OpenAlex IDs of the works it cites, in the order OpenAlex lists them)."""
    work = json.loads(text)
    return work["id"].rstrip("/").rsplit("/", 1)[-1], [item.rstrip("/").rsplit("/", 1)[-1] for item in work.get("referenced_works") or []]


def parse_openalex_page(text):
    """(the records of one page of an OpenAlex list, the count OpenAlex gives for the whole list)."""
    body = json.loads(text)
    return [parse_openalex_work_object(work) for work in body["results"]], int(body["meta"]["count"])


def parse_openalex_abstract(text):
    work = json.loads(text)
    if "id" not in work:
        raise KeyError("id")
    return abstract_from_inverted_index(work.get("abstract_inverted_index"))


def parse_s2_list(key):
    """The parser of a page of Semantic Scholar's references (key citedPaper) or citations (key citingPaper): (the records with a title or an ID, the works listed, whether a next page exists)."""

    def parse(text):
        body = json.loads(text)
        papers = [item[key] or {} for item in body.get("data") or []]
        records = [parse_s2_paper_object({**paper, "paperId": paper.get("paperId") or ""}) for paper in papers if paper.get("paperId") or paper.get("title")]
        return records, len(papers), "next" in body

    return parse


def parse_s2_count(name):
    """The parser of a Semantic Scholar paper record asked for one count, citationCount or referenceCount."""

    def parse(text):
        return int(json.loads(text)[name])

    return parse


def parse_s2_abstract(text):
    paper = json.loads(text)
    if "paperId" not in paper:
        raise KeyError("paperId")
    return paper.get("abstract") or ""


def parse_crossref_abstract(text):
    return markup_text(json.loads(text)["message"].get("abstract") or "")


def europepmc_record(item):
    """A record of a reference, a citation or a search result of Europe PMC. Its authorString is a list of names separated by ", " and ending with a full stop."""
    authors = [name.strip().rstrip(".").strip() for name in (item.get("authorString") or "").split(", ")]
    year = str(item.get("pubYear") or "")
    source_id = item.get("id") or ""
    return normalise_record(
        Record(
            title=collapse_spaces(item.get("title")),
            authors=[name for name in authors if name],
            year=int(year) if year.isdigit() else 0,
            venue=collapse_spaces(item.get("journalAbbreviation") or item.get("journalTitle")),
            volume=index_value(item.get("volume")),
            issue=index_value(item.get("issue")),
            pages=page_range(item.get("pageInfo")),
            doi=item.get("doi") or "",
            pmid=item.get("pmid") or (source_id if item.get("source") == "MED" else ""),
            indexes=["Europe PMC"],
        )
    )


def parse_europepmc_list(list_name, item_name):
    """The parser of Europe PMC's references (referenceList, reference) or citations (citationList, citation) of a work: (the records, the hitCount Europe PMC gives)."""

    def parse(text):
        body = json.loads(text)
        items = (body.get(list_name) or {}).get(item_name) or []
        return [europepmc_record(item) for item in items], int(body["hitCount"])

    return parse


def parse_europepmc_search(text):
    """The results of a Europe PMC search, each as (its record, its abstractText)."""
    return [(europepmc_record(item), item.get("abstractText") or "") for item in json.loads(text)["resultList"]["result"]]


def parse_esearch(text):
    return list(json.loads(text)["esearchresult"]["idlist"])


def parse_esummary(text):
    result = json.loads(text)["result"]
    records = []
    for uid in result["uids"]:
        item = result[uid]
        dois = [entry.get("value") or "" for entry in item.get("articleids") or [] if entry.get("idtype") == "doi"]
        date = item.get("pubdate") or ""
        records.append(
            normalise_record(
                Record(
                    title=collapse_spaces(item.get("title")),
                    authors=[collapse_spaces(author.get("name")) for author in item.get("authors") or [] if author.get("authtype") == "Author" and author.get("name")],
                    year=int(date[:4]) if date[:4].isdigit() else 0,
                    venue=collapse_spaces(item.get("source")),
                    volume=index_value(item.get("volume")),
                    issue=index_value(item.get("issue")),
                    pages=page_range(item.get("pages")),
                    doi=dois[0] if dois else "",
                    pmid=str(uid),
                    indexes=["PubMed"],
                )
            )
        )
    return records


def parse_pubmed_abstract(text):
    """The abstract of a PubMed efetch reply, one line for each part, a labelled part written "<label>: <text>"; None when the reply holds no article."""
    article = ET.fromstring(text).find(".//PubmedArticle")
    if article is None:
        return None
    parts = []
    for node in article.findall(".//Abstract/AbstractText"):
        body = collapse_spaces("".join(node.itertext()))
        if body:
            parts.append(f"{node.get('Label')}: {body}" if node.get("Label") else body)
    return "\n".join(parts)


def parse_dblp(text):
    """(the records of a reply of DBLP's SPARQL endpoint, one for each record key, as dicts of key, title, venue, year, pages and type; the count of rows of the reply)."""
    hits = {}
    rows = json.loads(text)["results"]["bindings"]
    for row in rows:
        value = {name: cell["value"] for name, cell in row.items()}
        if not value["publ"].startswith(DBLP_RECORD):
            raise ValueError(value["publ"])
        key = value["publ"][len(DBLP_RECORD):]
        hit = hits.setdefault(key, {"key": key, "title": "", "venue": "", "year": "", "pages": "", "type": ""})
        for name in ("title", "venue", "year", "pages"):
            hit[name] = hit[name] or collapse_spaces(value.get(name))
        hit["type"] = hit["type"] or value.get("type", "").rsplit("#", 1)[-1]
    return list(hits.values()), len(rows)


def markup_text(text):
    """The text of an abstract given as JATS or HTML markup: a heading or a paragraph is a line of its own, every tag is dropped, the entities are read, and a first line "Abstract" (the title of a JATS abstract) is dropped."""
    lines = [collapse_spaces(html.unescape(line)) for line in ANY_TAG.sub("", LINE_TAG.sub("\n", text or "")).splitlines()]
    lines = [line for line in lines if line]
    if lines and lines[0].lower() == "abstract":
        lines = lines[1:]
    return "\n".join(lines)


# Records: merging, matching and printing.


def filled_count(record):
    return sum(1 for name in COUNTED_FIELDS if getattr(record, name))


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
    for name in RECORD_FIELDS:
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


def format_record(record, every_author=False):
    """The record as one line. resolve lists every author (every_author), so that an entry can be written from its line; search lists the first three and " et al."."""
    if every_author:
        authors = ", ".join(record.authors)
    else:
        authors = ", ".join(record.authors[:3]) + (" et al." if len(record.authors) > 3 else "")
    parts = [record.title, authors, str(record.year) if record.year else "", record.venue]
    if record.volume:
        parts.append("vol " + record.volume)
    if record.issue:
        parts.append("no " + record.issue)
    if record.pages:
        parts.append("pages " + record.pages)
    if record.doi:
        parts.append("doi " + record.doi)
    if record.arxiv_id:
        parts.append("arXiv " + record.arxiv_id)
    if record.openalex_id:
        parts.append("OpenAlex " + record.openalex_id)
    if record.s2_id:
        parts.append("Semantic Scholar " + record.s2_id)
    if record.pmid:
        parts.append("PMID " + record.pmid)
    if record.oa_urls:
        parts.append("open access " + " ".join(record.oa_urls))
    return " | ".join(part for part in parts if part)


def pmcid_lines(record):
    """The line that names the PMCID of a record of resolve, when the record holds one."""
    return [f"pmcid: {record.pmcid}"] if record.pmcid else []


def title_lines(outcomes, chosen):
    """The lines of resolve for a title, given the Outcome of each index and its chosen candidate, a (ratio, Record) pair or None."""
    lines = []
    for name, outcome, pair in zip(INDEX_NAMES, outcomes, chosen):
        if outcome.left_out:
            lines.append(f"{name}: left out, {outcome.left_out}")
        elif pair is None:
            lines.append(f"{name}: not found")
        else:
            lines.append(f"{name}: ratio {pair[0]:.2f}: {format_record(pair[1], every_author=True)}")
            lines.extend(pmcid_lines(pair[1]))
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
            lines.append(f"{name}:{flag} ratio {ratio:.2f}: {format_record(record, every_author=True)}")
            lines.extend(record.notices)
            lines.extend(pmcid_lines(record))
    return lines


def merged_lines(named):
    """The lines of search for named, a list of (index name, Outcome) of the indexes that were asked."""
    records = merge_records([record for _, outcome in named for record in outcome.records])
    lines = [f"[{', '.join(record.indexes)}] {format_record(record)}" for record in records]
    for name, outcome in named:
        if outcome.left_out:
            lines.append(f"{name}: left out, {outcome.left_out}")
        elif not outcome.records:
            lines.append(f"{name}: not found")
    return lines


# Citation reports and BibTeX.


def cited_keys(line):
    """The keys of the citations in one line of a citation report, in order."""
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


def read_record(record_text):
    """(passages, malformed lines, cited keys in order) of a citation report. A passage line gives the key of its leading citation only."""
    passages, malformed, keys = [], [], []
    for number, line in enumerate(record_text.splitlines(), 1):
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


def quote_check_lines(record_text, bib_keys, read_text):
    """The lines quote-check prints and whether any of them is a failure. read_text(name) gives the text of <name> or None."""
    passages, malformed, keys = read_record(record_text)
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
        lines.append("the citation report cites no key")
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


def tex_cited_keys(main):
    """The keys cited in the main .tex file and in the files it inputs or includes, each key once, in the order of first occurrence."""
    folder = os.path.dirname(main)
    keys, read = {}, set()

    def read_tex(path):
        read.add(os.path.abspath(path))
        text = TEX_COMMENT.sub("", read_text_file(path))
        for call in TEX_CALL.finditer(text):
            name = call.group("name")
            if name is None:
                for key in call.group("keys").split(","):
                    if key.strip():
                        keys.setdefault(key.strip())
                continue
            name = name.strip()
            target = os.path.join(folder, name if os.path.splitext(name)[1] else name + ".tex")
            if os.path.abspath(target) not in read:
                read_tex(target)

    read_tex(main)
    return list(keys)


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

def latex_form(character):
    """The ASCII form of a character that is not ASCII: its form in LATEX_FORMS, else, for an ASCII letter with one combining mark of ACCENTS, the accent command around the letter, dotless on i and j; None otherwise."""
    if ord(character) in LATEX_FORMS:
        return LATEX_FORMS[ord(character)]
    decomposed = unicodedata.normalize("NFD", character)
    if len(decomposed) != 2 or ord(decomposed[1]) not in ACCENTS or not (decomposed[0].isascii() and decomposed[0].isalpha()):
        return None
    letter, accent = decomposed[0], ACCENTS[ord(decomposed[1])]
    if letter in "ij":
        letter = "\\" + letter
    return "{\\%s{%s}}" % (accent, letter) if accent.isalpha() else "{\\%s%s}" % (accent, letter)


def latex_ascii(text, unknown):
    """text put in NFC, with each character that is not ASCII written in its LaTeX form, or {?} where it has none; each such character is appended to unknown."""
    written = []
    for character in unicodedata.normalize("NFC", text):
        form = character if character.isascii() else latex_form(character)
        if form is None:
            unknown.append(character)
            form = "{?}"
        written.append(form)
    return "".join(written)


def url_ascii(text):
    """text put in NFC, with each character that is not ASCII percent-encoded as UTF-8."""
    return "".join(character if character.isascii() else urllib.parse.quote(character, safe="") for character in unicodedata.normalize("NFC", text))


def key_ascii(key):
    """The key in ASCII: a letter with a diacritic becomes its base letter, and any other character that is not ASCII is dropped."""
    return "".join(character for character in unicodedata.normalize("NFD", key) if character.isascii())


def from_latex(text):
    """text with each LaTeX form of ascii_entry that holds a letter written back as its character, so that a converted title compares as the original."""

    def accented(match):
        accent, letter = (match.group(1), match.group(2)) if match.group(1) else (match.group(3), match.group(4))
        mark = next(point for point, command in ACCENTS.items() if command == accent)
        return unicodedata.normalize("NFC", letter.lstrip("\\") + chr(mark))

    return LATEX_LETTER.sub(lambda match: LATEX_LETTERS[match.group()], LATEX_ACCENT.sub(accented, text))


def ascii_entry(entry, notes):
    """The entry bibtex prints, in ASCII: the key by key_ascii, a url or doi field by url_ascii and every other part by latex_ascii. Each character written {?} adds a warning to notes."""
    unknown = []
    head = ENTRY_HEAD.match(entry)
    comma = entry.find(",", head.end()) if head else -1
    if comma < 0:
        written, key, i = [], "", 0
    else:
        key = key_ascii(entry[head.end():comma]).strip()
        written, i = [entry[:head.end()], key_ascii(entry[head.end():comma])], comma
    while True:
        name = FIELD_NAME.match(entry, FIELD_GAP.match(entry, i).end())
        if not name:
            written.append(latex_ascii(entry[i:], unknown))
            break
        _, end = read_bib_value(entry, name.end())
        value = entry[name.end():end]
        written.append(entry[i:name.end()] + (url_ascii(value) if name.group(1).lower() in URL_FIELDS else latex_ascii(value, unknown)))
        i = end
    notes.extend(f"warning: {key}: no ASCII form for U+{ord(character):04X}, written {{?}}" for character in unknown)
    return "".join(written)


def arxiv_key(arxiv_id):
    return "arxiv_" + re.sub(r"[^A-Za-z0-9]", "_", arxiv_id)


def bibtex_entry(kind, name, fields):
    body = ",\n".join(f"  {label} = {{{value}}}" for label, value in fields if value)
    return f"@{kind}{{{name},\n{body}\n}}\n"


def arxiv_bibtex(record):
    fields = [
        ("title", bibtex_value(record.title)),
        ("author", " and ".join(bibtex_value(author) for author in record.authors)),
        ("year", str(record.year) if record.year else ""),
        ("eprint", record.arxiv_id),
        ("archivePrefix", "arXiv"),
    ]
    return bibtex_entry("misc", arxiv_key(record.arxiv_id), fields)


def citation_tags(page):
    """The citation_* meta tags of an HTML page, the standard tags of a scholarly page: {name in lower case: [content, ...]} in the order of the page."""

    class Tags(HTMLParser):
        def __init__(self):
            super().__init__(convert_charrefs=True)
            self.tags = {}

        def handle_starttag(self, tag, attrs):
            if tag != "meta":
                return
            values = {name.lower(): value or "" for name, value in attrs}
            name = values.get("name", "").strip().lower()
            if name.startswith("citation_") and collapse_spaces(values.get("content")):
                self.tags.setdefault(name, []).append(collapse_spaces(values["content"]))

    parser = Tags()
    parser.feed(page)
    parser.close()
    return parser.tags


def first_tag(tags, name):
    return (tags.get(name) or [""])[0]


def page_year(tags):
    """The year of citation_publication_date, else of citation_date: the first run of four digits in the tag; None when neither tag holds one."""
    for name in ("citation_publication_date", "citation_date"):
        found = re.search(r"(?<!\d)\d{4}(?!\d)", first_tag(tags, name))
        if found:
            return int(found.group())
    return None


def page_bibtex(arxiv_id, tags, url, conference):
    """The entry of the published version from the citation tags of its venue's page: @inproceedings with booktitle for a conference, else @article with journal."""
    venue = first_tag(tags, "citation_conference_title") or first_tag(tags, "citation_journal_title")
    kind, venue_label = ("inproceedings", "booktitle") if conference or tags.get("citation_conference_title") else ("article", "journal")
    first, last = first_tag(tags, "citation_firstpage"), first_tag(tags, "citation_lastpage")
    fields = [
        ("title", bibtex_value(first_tag(tags, "citation_title"))),
        ("author", " and ".join(bibtex_value(author) for author in tags.get("citation_author") or [])),
        (venue_label, bibtex_value(venue)),
        ("year", str(page_year(tags))),
        ("volume", bibtex_value(first_tag(tags, "citation_volume"))),
        ("pages", bibtex_value(f"{first}--{last}" if first and last else first)),
        ("url", bibtex_value(url)),
        ("eprint", arxiv_id),
        ("archivePrefix", "arXiv"),
    ]
    return bibtex_entry(kind, arxiv_key(arxiv_id), fields)


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


def read_time(text):
    """The time that text holds, as a lock file or a skip file holds one; ValueError when text is not a finite number."""
    value = float(text)
    if not math.isfinite(value):
        raise ValueError(text)
    return value


def host_turn(lock_name, gap, call):
    """Run call, one request to a paced host, so that it starts at least gap seconds after the last request to that host of any lookup.py process that uses the same temporary folder ended.

    The turn is an exclusive flock on a file named lock_name in the temporary folder. The file holds the time the last request ended.
    A file that cannot be opened, locked or read, or that holds text other than a time, leaves the request to wait the full gap.
    """
    path = os.path.join(tempfile.gettempdir(), lock_name)
    descriptor, last = None, None
    try:
        descriptor = os.open(path, os.O_RDWR | os.O_CREAT, 0o600)
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        recorded = os.read(descriptor, 64).decode("ascii", "replace").strip()
        last = read_time(recorded) if recorded else None
    except (OSError, ValueError):
        last = time.time()
    try:
        while last is not None:
            wait = min(gap, gap - (time.time() - last))
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


def arxiv_turn(call):
    """Run call, one request to an arXiv host, in the turn of arXiv: ARXIV_SPACING seconds after the last arXiv request of any process that shares the temporary folder ended."""
    return host_turn(ARXIV_LOCK_NAME, ARXIV_SPACING, call)


def write_atomically(folder, path, data):
    """Write data, as bytes, to a new file of the folder with mode 600 and move it to path, so that a reader sees all of data or no file. OSError when it cannot be written."""
    descriptor, temporary = tempfile.mkstemp(prefix=TEMPORARY_PREFIX, dir=folder)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(data)
        os.replace(temporary, path)
    except OSError:
        try:
            os.remove(temporary)
        except OSError:
            pass
        raise


def retry_after(text):
    """The whole seconds, rounded up, that the text of a Retry-After header asks to wait, from now when it is an HTTP date; None when it is neither a whole number nor a date. A date with no zone is read as GMT."""
    text = (text or "").strip()
    if re.fullmatch("[0-9]+", text):
        try:
            return int(text)
        except ValueError:
            return None
    try:
        moment = email.utils.parsedate_to_datetime(text)
    except (TypeError, ValueError, OverflowError):
        return None
    if moment.tzinfo is None:
        moment = moment.replace(tzinfo=datetime.timezone.utc)
    return math.ceil((moment - datetime.datetime.fromtimestamp(time.time(), datetime.timezone.utc)).total_seconds())


def long_reason(seconds, host, origin):
    """The reason of a 429 that asks a long wait: it names the host when that is not origin, the host of the URL the call was given."""
    where = f" at {host}" if host != origin else ""
    return f"HTTP 429{where}, retry after {seconds} s"


class ReplyCache:
    """The 200 replies of the API hosts, stored on disk as one file for each URL and used for 30 days."""

    def __init__(self, folder):
        self.folder, self.pruned = folder, False

    def path(self, url):
        return os.path.join(self.folder, hashlib.sha256(url.encode("utf-8")).hexdigest())

    def load(self, url):
        """The body stored for url less than 30 days ago; None when there is no such entry or it cannot be read."""
        try:
            with open(self.path(url), encoding="ascii") as handle:
                entry = json.load(handle)
            if entry["url"] == url and time.time() - entry["stored"] < CACHE_AGE and isinstance(entry["body"], str):
                return entry["body"]
        except (OSError, ValueError, KeyError, TypeError):
            pass
        return None

    def store(self, url, body):
        """Store body as the reply of url, after the first store of the process has removed what is too old. A folder that cannot be made or written stores nothing."""
        try:
            os.makedirs(self.folder, mode=0o700, exist_ok=True)
            if not self.pruned:
                self.pruned = True
                self.prune()
            write_atomically(self.folder, self.path(url), json.dumps({"url": url, "stored": time.time(), "body": body}).encode("ascii"))
        except OSError:
            pass

    def prune(self):
        """Remove the entries older than 30 days and the temporary files older than 1 day; a file this cache did not name stays."""
        now = time.time()
        for name in os.listdir(self.folder):
            temporary = name.startswith(TEMPORARY_PREFIX)
            if not temporary and not re.fullmatch("[0-9a-f]{64}", name):
                continue
            path = os.path.join(self.folder, name)
            try:
                if now - os.path.getmtime(path) > (TEMPORARY_AGE if temporary else CACHE_AGE):
                    os.remove(path)
            except OSError:
                continue  # another process removed it first


def cache_folder(environment):
    """$XDG_CACHE_HOME/ordo-lookup when XDG_CACHE_HOME is an absolute path, else ~/.cache/ordo-lookup."""
    base = environment.get("XDG_CACHE_HOME", "")
    if not os.path.isabs(base):
        base = os.path.join(os.path.expanduser("~"), ".cache")
    return os.path.join(base, CACHE_NAME)


class Client:
    """The requests of one run, with the optional credentials of the environment. With cache on, get_parsed stores and reads the replies of the API hosts."""

    def __init__(self, environment, cache=False):
        self.s2_key = environment.get("S2_API_KEY", "")
        self.openalex_key = environment.get("OPENALEX_API_KEY", "")
        self.crossref_email = environment.get("CROSSREF_POLITE_EMAIL", "")
        self.opener = urllib.request.build_opener(NoRedirect)
        folder = cache_folder(environment) if cache else ""
        # A home folder that cannot be resolved leaves a relative folder, which would put the cache in the working directory: the cache stays off.
        self.cache = ReplyCache(folder) if os.path.isabs(folder) else None

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

    def credential(self, host):
        """The credential this client holds for the host; an empty string when the host has none or the client has none for it."""
        return {"api.crossref.org": self.crossref_email, "api.openalex.org": self.openalex_key, "api.semanticscholar.org": self.s2_key}.get(host, "")

    def skip_path(self, host):
        """The skip file of an API host: one for each host, and a second for the runs that hold the host's credential, since a budget is per key."""
        return os.path.join(tempfile.gettempdir(), SKIP_PREFIX + API_HOSTS[host] + ("-key" if self.credential(host) else ""))

    def skip_left(self, host):
        """The whole seconds, rounded up, that the skip file of an API host still holds the host back; 0 for a host that is not an API host, for no file, and for a file that holds no time."""
        if host not in API_HOSTS:
            return 0
        try:
            with open(self.skip_path(host), encoding="ascii") as handle:
                until = read_time(handle.read(64).strip())
        except (OSError, ValueError):
            return 0
        return max(0, math.ceil(until - time.time()))

    def write_skip(self, host, seconds):
        """Write the time a wait of that many seconds ends, at most SKIP_CAP seconds from now, to the skip file of an API host. A file that cannot be written is not written."""
        if host not in API_HOSTS:
            return
        try:
            write_atomically(tempfile.gettempdir(), self.skip_path(host), repr(time.time() + min(seconds, SKIP_CAP)).encode("ascii"))
        except OSError:
            pass

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

    def once(self, url, accept, read_body, origin):
        """One request, in its host's turn when the host is paced; LeftOut with the skip's reason, and no request, while the host's skip file holds a time in the future.
        origin is the host of the URL the call was given, which the reason names when the request goes to another host."""
        url, headers, host = self.prepare(url, accept)
        seconds = self.skip_left(host)
        if seconds:
            raise LeftOut(long_reason(seconds, host, origin))

        def request():
            return self.send(url, headers, read_body)

        if host in ARXIV_HOSTS:
            return arxiv_turn(request)
        if host in PACED_HOSTS:
            name, gap, credential_gap = PACED_HOSTS[host]
            return host_turn(LOCK_PREFIX + name, credential_gap if self.credential(host) else gap, request)
        return request()

    def get(self, url, accept="*/*", read_body=True):
        """A Reply for a GET, redirects followed (at most 10). A 429 is retried at most 3 times, after its Retry-After seconds, or after 2, 4 and 8 seconds when it names none,
        and a 429 that names more than 60 seconds is not retried: its Reply carries the reason, and an API host's skip file is written. LeftOut when no answer comes."""
        origin = urllib.parse.urlsplit(url).hostname or ""
        for _ in range(MAX_REDIRECTS + 1):
            if urllib.parse.urlsplit(url).scheme not in ("http", "https"):
                raise LeftOut("not an http or https URL")
            for attempt in range(RETRIES + 1):
                status, body, headers = self.once(url, accept, read_body, origin)
                if status != 429:
                    break
                seconds = retry_after(headers.get("Retry-After"))
                if seconds is not None and seconds > LONG_WAIT:
                    host = urllib.parse.urlsplit(url).hostname or ""
                    self.write_skip(host, seconds)
                    return Reply(status, body, url, headers.get("Content-Type", ""), long_reason(seconds, host, origin))
                if attempt == RETRIES:
                    break
                time.sleep(RETRY_WAITS[attempt] if seconds is None else max(seconds, 1))
            if status in (301, 302, 303, 307, 308) and headers.get("Location"):
                url = urllib.parse.urljoin(url, headers["Location"])
                continue
            return Reply(status, body, url, headers.get("Content-Type", ""))
        raise LeftOut("too many redirects")


def status_reason(reply):
    if reply.reason:
        return reply.reason
    return "HTTP 429 after 3 retries" if reply.status == 429 else f"HTTP {reply.status}"


def get_parsed(client, url, parse, accept="*/*"):
    """What parse makes of a 200 answer from url; None for a 404. LeftOut for any other status and for a body that does not parse.

    When the client's cache is on and url is on an API host, a stored answer that parses is used with no request, and a 200 answer that parses is stored.
    """
    cache = client.cache if urllib.parse.urlsplit(url).hostname in API_HOSTS else None
    if cache is not None:
        body = cache.load(url)
        if body is not None:
            try:
                return parse(body)
            except PARSE_ERRORS:
                pass  # an entry that does not parse is no entry
    reply = client.get(url, accept)
    if reply.status == 404:
        return None
    if reply.status != 200:
        raise LeftOut(status_reason(reply))
    text = reply.text()
    try:
        found = parse(text)
    except PARSE_ERRORS:
        raise LeftOut(f"HTTP {reply.status}, the body does not parse") from None
    if cache is not None:
        cache.store(url, text)
    return found


def outcome_of(call):
    try:
        found = call()
    except LeftOut as reason:
        return Outcome(left_out=str(reason))
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


def lookup_s2_published(client, identifier):
    url = f"https://api.semanticscholar.org/graph/v1/paper/{s2_path(identifier)}?fields={S2_PUBLISHED_FIELDS}"
    return outcome_of(lambda: get_parsed(client, url, parse_s2_published))


def lookup_openalex_published(client, identifier):
    url = f"https://api.openalex.org/works/doi:{quote_doi(identifier.doi)}?select={OPENALEX_PUBLISHED_FIELDS}"
    return outcome_of(lambda: get_parsed(client, url, parse_openalex_published))


def read_page(client, url):
    """(the citation tags, the final address) of a venue's page of a work. ExcludedPage, with no request, for an address on a host of PAGE_EXCLUDED_HOSTS, and for a page whose address after redirects is on one;
    LeftOut for an address other than http and https, a page that gives no answer and a status other than 2xx."""
    host = urllib.parse.urlsplit(url).hostname or ""
    if host in PAGE_EXCLUDED_HOSTS:
        raise ExcludedPage(f"the page is on {host}")
    reply = client.get(url, accept=PAGE_ACCEPT)
    host = urllib.parse.urlsplit(reply.url).hostname or ""
    if host in PAGE_EXCLUDED_HOSTS:
        raise ExcludedPage(f"the page is on {host}")
    if not 200 <= reply.status < 300:
        raise LeftOut(status_reason(reply))
    return citation_tags(reply.text()), reply.url


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


def search_pubmed(client, query, limit):
    """PubMed's records of a query: esearch gives the PMIDs, esummary their records."""

    def call():
        params = urllib.parse.urlencode({"db": "pubmed", "term": query, "retmax": limit, "retmode": "json"})
        pmids = get_parsed(client, f"{EUTILS}/esearch.fcgi?{params}", parse_esearch)
        if not pmids:
            return None
        params = urllib.parse.urlencode({"db": "pubmed", "id": ",".join(pmids), "retmode": "json"})
        return get_parsed(client, f"{EUTILS}/esummary.fcgi?{params}", parse_esummary)

    return outcome_of(call)


# Several inputs at once: the batches of resolve.


def in_batches(items, size):
    return [items[start:start + size] for start in range(0, len(items), size)]


def batch_records(client, dois, size, url_of, parse, key_of):
    """({key: Record}, {key: reason}) for the lower-cased DOIs asked in batches: key_of gives the key of a record of a reply, and every DOI of a batch left out gets that batch's reason."""
    found, left = {}, {}
    for batch in in_batches(list(dict.fromkeys(dois)), size):
        try:
            records = get_parsed(client, url_of(batch), parse) or []
        except LeftOut as reason:
            left.update(dict.fromkeys(batch, str(reason)))
            continue
        for record in records:
            found.setdefault(key_of(record), record)
    return found, left


def crossref_batch_url(dois):
    return "https://api.crossref.org/works?filter=" + ",".join("doi:" + quote_filter_value(doi) for doi in dois) + f"&rows={len(dois)}"


def openalex_batch_url(dois):
    return "https://api.openalex.org/works?filter=doi:" + "|".join(quote_filter_value(doi) for doi in dois) + f"&per_page={len(dois)}&select={OPENALEX_FIELDS}"


def arxiv_batch_url(arxiv_ids):
    """One arXiv ID alone is asked by the URL resolve asks it by, so that both share the cached reply."""
    url = "https://export.arxiv.org/api/query?id_list=" + ",".join(urllib.parse.quote(arxiv_id, safe="/.") for arxiv_id in arxiv_ids)
    return url if len(arxiv_ids) == 1 else url + f"&max_results={len(arxiv_ids)}"


def batch_outcome(key, found, left):
    if key in left:
        return Outcome(left_out=left[key])
    return Outcome([found[key]]) if key in found else Outcome()


def resolve_many(client, texts, out):
    """The blocks of resolve over several inputs, in the order of the arguments; the exit status, 1 when an input is not a DOI or an arXiv ID or got no record from any index."""
    identifiers = [classify(text) for text in texts]
    batched = [identifier for identifier in identifiers if identifier.kind != "title" and not FILTER_SEPARATORS.search(identifier.doi)]
    dois = [identifier.doi.lower() for identifier in batched]
    # The globals are read at the call, so that a test can set a smaller batch.
    crossref = batch_records(client, dois, BATCH, crossref_batch_url, parse_crossref_search, lambda record: record.doi.lower())
    # OpenAlex gives a preprint the DOI of its published version, so a record asked by an arXiv DOI in a filter cannot be matched back to its input, and its filter ids.arxiv takes one value only: an input with an arXiv ID is asked alone.
    openalex_dois = [identifier.doi.lower() for identifier in batched if not identifier.arxiv_id]
    openalex = batch_records(client, openalex_dois, OPENALEX_BATCH, openalex_batch_url, parse_openalex_search, lambda record: record.doi.lower())
    arxiv_ids = [identifier.arxiv_id for identifier in batched if identifier.arxiv_id]
    arxiv = batch_records(client, arxiv_ids, BATCH, arxiv_batch_url, parse_arxiv_feed, lambda record: record.arxiv_id)
    status = 0
    for text, identifier in zip(texts, identifiers):
        out.append(f"== {text}")
        if identifier.kind == "title":
            out.append(f"error: {text} is not a DOI or an arXiv ID")
            status = 1
            continue
        if identifier not in batched:
            outcomes = [lookup_crossref(client, identifier), lookup_openalex(client, identifier), lookup_s2(client, identifier), lookup_arxiv(client, identifier)]
        else:
            doi = identifier.doi.lower()
            in_arxiv = batch_outcome(identifier.arxiv_id, *arxiv) if identifier.arxiv_id else Outcome(left_out="the input has no arXiv ID")
            in_openalex = lookup_openalex(client, identifier) if identifier.arxiv_id else batch_outcome(doi, *openalex)
            outcomes = [batch_outcome(doi, *crossref), in_openalex, lookup_s2(client, identifier), in_arxiv]
        out.extend(identifier_lines(outcomes))
        if not any(outcome.records for outcome in outcomes):
            status = 1
    return status


# The works an input cites and the works that cite it: refs and cited-by.


@dataclass
class Listing:
    """What one index gave for the works of one input: the records read, the count the index gives for the whole list, and, when it gave no list, what is printed for it."""

    records: list = field(default_factory=list)
    total: int = 0
    note: str = ""


def listing_of(call):
    """The Listing of call, which returns (records, total) or None for an input the index does not hold."""
    try:
        found = call()
    except LeftOut as reason:
        return Listing(note=f"left out, {reason}")
    if found is None:
        return Listing(note="not found")
    records, total = found
    if records:
        return Listing(records, total)
    return Listing(note=f"lists {total} works, none with a title or an ID" if total else "lists none")


def not_asked(identifier):
    return "not asked for " + {"pmid": "a PMID", "openalex": "an OpenAlex ID", "s2": "a Semantic Scholar ID", "doi": "a DOI", "arxiv": "an arXiv ID"}[identifier.kind]


def openalex_work_url(identifier, select):
    """The URL of the OpenAlex record of a work, the fields select asked; None for a Semantic Scholar ID, which OpenAlex does not read."""
    if identifier.kind == "s2":
        return None
    if identifier.kind == "openalex":
        path = identifier.text
    elif identifier.kind == "pmid":
        path = "pmid:" + identifier.pmid
    else:
        path = "doi:" + quote_doi(identifier.doi)
    return f"https://api.openalex.org/works/{path}?select={select}"


def s2_work_path(identifier):
    """The path of a work in Semantic Scholar's graph; None for an OpenAlex ID, which Semantic Scholar does not read."""
    if identifier.kind == "openalex":
        return None
    if identifier.kind == "s2":
        return identifier.text
    if identifier.kind == "pmid":
        return "PMID:" + identifier.pmid
    return s2_path(identifier)


def referenced_ids(client, url):
    """(the OpenAlex IDs the work at url cites, their count); None when OpenAlex does not hold the work."""
    found = get_parsed(client, url, parse_openalex_links)
    return None if found is None else (found[1], len(found[1]))


def openalex_references(client, identifiers):
    """The Listing of OpenAlex for each input of refs: the works its referenced_works names, at most LIST_CAP, their records asked in batches of OPENALEX_BATCH IDs for every input at once."""
    linked = []
    for identifier in identifiers:
        url = openalex_work_url(identifier, "id,referenced_works")
        linked.append(listing_of(lambda: referenced_ids(client, url)) if url else Listing(note=not_asked(identifier)))
    wanted = [work_id for listing in linked for work_id in listing.records[:LIST_CAP]]
    found, left = {}, {}
    for batch in in_batches(list(dict.fromkeys(wanted)), OPENALEX_BATCH):
        params = urllib.parse.urlencode({"filter": "openalex:" + "|".join(batch), "per_page": len(batch), "select": OPENALEX_FIELDS})
        try:
            records = get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_search) or []
        except LeftOut as reason:
            left.update(dict.fromkeys(batch, str(reason)))
            continue
        found.update((record.openalex_id, record) for record in records)
    listings = []
    for listing in linked:
        shown = listing.records[:LIST_CAP]
        reasons = [left[work_id] for work_id in shown if work_id in left]
        if reasons:
            listings.append(Listing(note=f"left out, {reasons[0]}"))
            continue
        records = [found.get(work_id) or Record(openalex_id=work_id, title="no record in OpenAlex's reply", indexes=["OpenAlex"]) for work_id in shown]
        listings.append(Listing(records, listing.total, listing.note))
    return listings


def openalex_citing(client, identifier, since):
    """The Listing of the works OpenAlex lists as citing the input, from the year since on when since is given, read 200 a page up to LIST_CAP."""
    if identifier.kind == "openalex":
        work_id = identifier.text
    else:
        url = openalex_work_url(identifier, "id")
        if url is None:
            return Listing(note=not_asked(identifier))
        try:
            found = get_parsed(client, url, parse_openalex_links)
        except LeftOut as reason:
            return Listing(note=f"left out, {reason}")
        if found is None:
            return Listing(note="not found")
        work_id = found[0]
    selected = "cites:" + work_id + (f",from_publication_date:{since}-01-01" if since else "")

    def pages():
        records, total = [], 0
        for page in range(1, LIST_CAP // OPENALEX_PAGE + 1):
            params = urllib.parse.urlencode({"filter": selected, "per_page": OPENALEX_PAGE, "page": page, "select": OPENALEX_FIELDS})
            found = get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_page)
            if found is None:
                break
            records += found[0]
            total = found[1]
            if len(found[0]) < OPENALEX_PAGE or len(records) >= min(total, LIST_CAP):
                break
        return records[:LIST_CAP], total

    return listing_of(pages)


def s2_listing(client, identifier, citing):
    """The Listing of Semantic Scholar's citations (citing) or references of the input: one request of up to LIST_CAP works, and, when a next page exists, one request for the count of the whole list."""
    path = s2_work_path(identifier)
    if path is None:
        return Listing(note=not_asked(identifier))
    kind, key, count = ("citations", "citingPaper", "citationCount") if citing else ("references", "citedPaper", "referenceCount")

    def call():
        found = get_parsed(client, f"https://api.semanticscholar.org/graph/v1/paper/{path}/{kind}?fields={S2_FIELDS}&limit={LIST_CAP}", parse_s2_list(key))
        if found is None:
            return None
        records, listed, more = found
        if not more:
            return records, listed
        try:
            total = get_parsed(client, f"https://api.semanticscholar.org/graph/v1/paper/{path}?fields={count}", parse_s2_count(count))
        except LeftOut:
            total = None
        return records, max(total or 0, listed + 1)

    return listing_of(call)


def europepmc_listing(client, identifier, citing):
    """The Listing of Europe PMC's citations (citing) or references of a PMID: one page of up to LIST_CAP works."""
    if identifier.kind != "pmid":
        return None
    kind, parse = ("citations", parse_europepmc_list("citationList", "citation")) if citing else ("references", parse_europepmc_list("referenceList", "reference"))
    url = f"{EUROPEPMC}/MED/{identifier.pmid}/{kind}?format=json&page=1&pageSize={LIST_CAP}"
    return listing_of(lambda: get_parsed(client, url, parse))


def link_lines(text, name, listing, noun, since, filtered):
    """The lines of one input of refs or cited-by from the index that gave its list: the head line, then one line per record. filtered is true when the index's list was read whole and cut to the works from since on."""
    records = [record for record in listing.records if record.year >= since] if filtered else listing.records
    read = len(listing.records)
    if filtered:
        head = f"{len(records)} {noun} from {since} on, among {read} of {listing.total} {noun} read"
    else:
        span = f" from {since} on" if since else ""
        head = f"cut at {LIST_CAP} of {listing.total} {noun}{span}" if listing.total > LIST_CAP else f"{read} of {listing.total} {noun}{span}"
    return [f"{text}: {head}, from {name}"] + [f"[{name}] {format_record(record)}" for record in records], records


def run_links(client, arguments, out, citing):
    """refs (citing false) and cited-by (citing true); the exit status, 1 when an input got no list from any index."""
    command, noun = ("cited-by", "citing works") if citing else ("refs", "references")
    shape = "<DOI | arXiv ID | PMID:<n> | OpenAlex ID | Semantic Scholar ID> ..." + (" [--since <year>]" if citing else "")
    positional, options = parse_options(arguments, ("--since",) if citing else (), command)
    if not positional:
        raise UsageError(f"{command} takes {shape}")
    since = options.get("--since", "")
    if since and not re.fullmatch(r"\d{4}", since):
        raise UsageError("--since needs a four-digit year")
    identifiers = []
    for text in positional:
        identifier = classify_work(text)
        if identifier.kind == "title":
            raise UsageError(f"{text} is not a DOI, an arXiv ID, a PMID, an OpenAlex ID or a Semantic Scholar ID")
        identifiers.append(identifier)
    year = int(since) if since else 0
    openalex = [openalex_citing(client, identifier, since) for identifier in identifiers] if citing else openalex_references(client, identifiers)
    status = 0
    for text, identifier, first in zip(positional, identifiers, openalex):
        notes = []
        for name, fetch, filtered in (
            ("OpenAlex", lambda: first, False),
            ("Semantic Scholar", lambda: s2_listing(client, identifier, citing), bool(year)),
            ("Europe PMC", lambda: europepmc_listing(client, identifier, citing), bool(year)),
        ):
            listing = fetch()
            if listing is None:
                continue
            if listing.records:
                lines, shown = link_lines(text, name, listing, noun, year, filtered)
                if shown:
                    out.extend(lines)
                    break
                listing = Listing(note=f"none from {since} on among {len(listing.records)} read")
            notes.append(f"{name}: {listing.note}")
        else:
            out.append(f"{text}: no {noun} listed; " + "; ".join(notes))
            status = 1
    return status


# The abstract of a work from the indexes: index-abstract.


def openalex_abstract(client, identifier):
    url = openalex_work_url(identifier, "id,abstract_inverted_index")
    return get_parsed(client, url, parse_openalex_abstract)


def s2_abstract(client, identifier):
    return get_parsed(client, f"https://api.semanticscholar.org/graph/v1/paper/{s2_work_path(identifier)}?fields=paperId,abstract", parse_s2_abstract)


def crossref_abstract(client, identifier):
    return get_parsed(client, f"https://api.crossref.org/works/{quote_doi(identifier.doi)}", parse_crossref_abstract)


def europepmc_abstract(client, identifier):
    """The abstract of the Europe PMC record whose PMID or DOI is the input's; None when Europe PMC holds no such record."""
    query = f"EXT_ID:{identifier.pmid} AND SRC:MED" if identifier.kind == "pmid" else f'DOI:"{identifier.doi}"'
    params = urllib.parse.urlencode({"query": query, "resultType": "core", "format": "json"})
    for record, abstract in get_parsed(client, f"{EUROPEPMC}/search?{params}", parse_europepmc_search) or []:
        if (identifier.kind == "pmid" and record.pmid == identifier.pmid) or (identifier.kind != "pmid" and record.doi.lower() == identifier.doi.lower()):
            return markup_text(abstract)
    return None


def pubmed_abstract(client, identifier):
    """The abstract of the PubMed record of a PMID, or of the PMID esearch gives for the input's DOI; None when PubMed holds none."""
    pmid = identifier.pmid
    if not pmid:
        params = urllib.parse.urlencode({"db": "pubmed", "term": identifier.doi + "[doi]", "retmode": "json"})
        pmids = get_parsed(client, f"{EUTILS}/esearch.fcgi?{params}", parse_esearch)
        if not pmids:
            return None
        pmid = pmids[0]
    params = urllib.parse.urlencode({"db": "pubmed", "id": pmid, "rettype": "abstract", "retmode": "xml"})
    return get_parsed(client, f"{EUTILS}/efetch.fcgi?{params}", parse_pubmed_abstract)


def arxiv_abstract(client, identifier):
    outcome = lookup_arxiv(client, identifier)
    if outcome.left_out:
        raise LeftOut(outcome.left_out)
    return outcome.records[0].abstract if outcome.records else None


def first_abstract(client, identifier):
    """(the index, the abstract) of the first index of ABSTRACT_NAMES that gives an abstract, and the line of each index asked before it, or of every index when none gives one."""
    sources = {
        "OpenAlex": openalex_abstract,
        "Semantic Scholar": s2_abstract,
        "Crossref": None if identifier.kind == "pmid" else crossref_abstract,
        "Europe PMC": europepmc_abstract,
        "PubMed": pubmed_abstract,
        "arXiv": arxiv_abstract if identifier.arxiv_id else None,
    }
    notes = []
    for name in ABSTRACT_NAMES:
        if sources[name] is None:
            notes.append(f"{name}: {not_asked(identifier)}")
            continue
        try:
            found = sources[name](client, identifier)
        except LeftOut as reason:
            notes.append(f"{name}: left out, {reason}")
            continue
        text = "\n".join(line for line in (collapse_spaces(part) for part in (found or "").splitlines()) if line)
        if text:
            return name, text + "\n", notes
        notes.append(f"{name}: not found" if found is None else f"{name}: no abstract")
    return "", "", notes


def write_new_text(folder, target, text):
    """Write text to target with mode 600, through a temporary file of folder that is linked to target, so that an existing file is never replaced. False when target exists; UsageError when it cannot be written."""
    try:
        descriptor, temporary = tempfile.mkstemp(prefix=TEMPORARY_PREFIX, suffix=".txt", dir=os.path.abspath(folder))
    except OSError as error:
        raise UsageError(f"{folder}: {error.strerror or error}") from None
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8") as handle:
            handle.write(text)
        os.link(temporary, target)
    except FileExistsError:
        return False
    except OSError as error:
        raise UsageError(f"{target}: {error.strerror or error}") from None
    finally:
        try:
            os.remove(temporary)
        except OSError:
            pass
    return True


# DBLP's records of a title: dblp.


def dblp_phrase(title):
    """The longest run of the title's words, lower-cased, with one space between words: the text the SPARQL query looks for in DBLP's titles, so that punctuation the title and DBLP write differently does not stop a match."""
    runs = [collapse_spaces(run) for run in re.split(r"[^\w ]|_", title.lower())]
    return max(runs, key=len, default="")


def sparql_literal(text):
    return '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


def dblp_title_forms(title):
    """The forms of a title the exact query asks for: as given, in sentence case and in title case, each with and without a final full stop, each once."""
    title = collapse_spaces(title)
    sentence = title[:1].upper() + title[1:].lower()
    capitalized = " ".join(word[:1].upper() + word[1:] for word in title.split(" "))
    forms = []
    for form in (title, sentence, capitalized):
        bare = form.rstrip(".")
        forms += [bare + ".", bare]
    return list(dict.fromkeys(forms))


def dblp_query_url(match):
    return DBLP_SPARQL + "?" + urllib.parse.urlencode({"query": DBLP_QUERY.replace("@MATCH@", match)})


def dblp_lines(client, title):
    """The lines of dblp for one title: each DBLP record with a title ratio of 0.70 or more, the highest ratio first, and the cut line of a reply of DBLP_LIMIT rows, else DBLP's not found or left-out line.
    The exact query is asked first; the query on the title's words when the exact one returns no row or only CoRR records, since a proceedings title can differ in case from every exact form."""
    exact = DBLP_EXACT.replace("@TITLES@", " ".join(sparql_literal(form) for form in dblp_title_forms(title)))
    words = DBLP_WORDS.replace("@PHRASE@", dblp_phrase(title))
    try:
        hits, rows = get_parsed(client, dblp_query_url(exact), parse_dblp, accept=DBLP_ACCEPT) or ([], 0)
        if all(hit["venue"] == "CoRR" for hit in hits):
            keys = {hit["key"] for hit in hits}
            more, rows = get_parsed(client, dblp_query_url(words), parse_dblp, accept=DBLP_ACCEPT) or ([], 0)
            hits = hits + [hit for hit in more if hit["key"] not in keys]
    except LeftOut as reason:
        return [f"DBLP: left out, {reason}"]
    scored = sorted(((title_ratio(title, hit["title"]), hit) for hit in hits), key=lambda pair: (-pair[0], pair[1]["key"]))
    lines = []
    for ratio, hit in scored:
        if ratio < MATCH_THRESHOLD:
            continue
        parts = [hit["title"], hit["venue"], hit["year"], "pages " + page_range(hit["pages"]) if hit["pages"] else "", hit["type"], "key " + hit["key"]]
        if hit["venue"] == "CoRR":
            parts.append("CoRR record")
        lines.append(f"DBLP: ratio {ratio:.2f}: " + " | ".join(part for part in parts if part))
    lines = lines or ["DBLP: not found"]
    if rows >= DBLP_LIMIT:
        lines.append(f"DBLP: cut at {DBLP_LIMIT} rows")
    return lines


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


def resolve_input(client, identifier, year):
    """The lines resolve prints for a classified input. The year is 0 when none is given."""
    if identifier.kind == "title":
        outcomes = searches(client, identifier.text, TITLE_CANDIDATES, True)
        chosen = [None if outcome.left_out else choose_candidate(outcome.records, identifier.text, year) for outcome in outcomes]
        return title_lines(outcomes, chosen)
    outcomes = [lookup_crossref(client, identifier), lookup_openalex(client, identifier), lookup_s2(client, identifier), lookup_arxiv(client, identifier)]
    return identifier_lines(outcomes)


def run_resolve(client, arguments, out):
    positional, options = parse_options(arguments, ("--year",), "resolve")
    if len(positional) > 1 and "--year" not in options:
        return resolve_many(client, positional, out)
    expect_arguments(positional, 1, "resolve", "<DOI | arXiv ID | title> [--year <year>], or <DOI | arXiv ID> <DOI | arXiv ID> ...")
    year = options.get("--year", "")
    if year and not re.fullmatch(r"\d{4}", year):
        raise UsageError("--year needs a four-digit year")
    out.extend(resolve_input(client, classify(positional[0]), int(year) if year else 0))
    return 0


def run_search(client, arguments, out):
    positional, _ = parse_options(arguments, (), "search")
    expect_arguments(positional, 1, "search", "<query>")
    outcomes = searches(client, positional[0], SEARCH_LIMIT, False) + [search_pubmed(client, positional[0], SEARCH_LIMIT)]
    out.extend(merged_lines(list(zip(SEARCH_NAMES, outcomes))))
    return 0


def run_refs(client, arguments, out):
    return run_links(client, arguments, out, citing=False)


def run_cited_by(client, arguments, out):
    return run_links(client, arguments, out, citing=True)


def run_index_abstract(client, arguments, out):
    """Write the abstract the indexes give for each identifier as <folder>/<stem>.abstract.txt; the exit status, 2 when an existing file was refused, else 1 when an identifier got no abstract."""
    shape = "<DOI | arXiv ID | PMID:<n>> ... --into <folder>"
    positional, options = parse_options(arguments, ("--into",), "index-abstract")
    if not positional or "--into" not in options:
        raise UsageError(f"index-abstract takes {shape}")
    folder = options["--into"]
    if not os.path.isdir(folder):
        raise UsageError(f"{folder}: not a folder")
    identifiers = []
    for text in positional:
        identifier = classify_work(text)
        if identifier.kind not in ("doi", "arxiv", "pmid"):
            raise UsageError(f"{text} is not a DOI, an arXiv ID or a PMID")
        identifiers.append(identifier)
    status = 0
    for text, identifier in zip(positional, identifiers):
        stem = file_stem({"doi": identifier.doi, "arxiv": text.strip(), "pmid": "PMID:" + identifier.pmid}[identifier.kind])
        target = os.path.join(folder, stem + ".abstract.txt")
        # A link counts as existing, a dangling one included, so that no abstract is written through it.
        if os.path.lexists(target):
            out.append(f"error: {target} exists")
            status = 2
            continue
        name, abstract, notes = first_abstract(client, identifier)
        if not abstract:
            out.append(f"{text}: no abstract; " + "; ".join(notes))
            status = status or 1
            continue
        if not write_new_text(folder, target, abstract):
            out.append(f"error: {target} exists")
            status = 2
            continue
        out.append(f"{text}: {os.path.basename(target)} from {name}")
    return status


def run_dblp(client, arguments, out):
    """The DBLP records of each title; the exit status, 1 when a title got no record."""
    positional, _ = parse_options(arguments, (), "dblp")
    if not positional:
        raise UsageError("dblp takes <title> ...")
    for title in positional:
        if not dblp_phrase(title):
            raise UsageError(f"{title} has no word to look up")
    status = 0
    for title in positional:
        lines = dblp_lines(client, title)
        out.append(f"== {title}")
        out.extend(lines)
        if not lines[0].startswith("DBLP: ratio "):
            status = 1
    return status


def doi_entry(client, doi):
    """(the BibTeX entry https://doi.org/<doi> returns for Accept: application/x-bibtex, the reason there is none, the status of the reply or None when no answer came)."""
    try:
        reply = client.get(f"https://doi.org/{quote_doi(doi)}", accept="application/x-bibtex")
    except LeftOut as reason:
        return "", str(reason), None
    body = reply.text()
    if reply.status == 200 and body.lstrip().startswith("@"):
        return body.rstrip("\n"), "", reply.status
    return "", status_reason(reply), reply.status


def published_dois(outcomes):
    """The DOIs of a published version that the records of outcomes name, in order, each once: a DOI that is not of the form 10.48550/arXiv.<id>."""
    dois = []
    for outcome in outcomes:
        for record in outcome.records:
            for doi in record.dois:
                if DOI_PATTERN.match(doi) and not ARXIV_DOI.match(doi) and doi.lower() not in (known.lower() for known in dois):
                    dois.append(doi)
    return dois


def published_venue(outcome):
    """The name and type of Semantic Scholar's publicationVenue when it is a conference or a journal whose name and alternate names do not contain arxiv in any case; None otherwise."""
    venue = next((record.venue for record in outcome.records if record.venue), {})
    names = [venue.get("name") or ""] + [name for name in venue.get("alternate_names") or [] if isinstance(name, str)]
    if venue.get("type") not in PUBLISHED_VENUE_TYPES or not collapse_spaces(names[0]) or any("arxiv" in name.lower() for name in names):
        return None
    return collapse_spaces(names[0]), venue["type"]


def published_entry(client, title, dois, notes):
    """(the entry of the first published DOI whose record's title has a ratio of 0.70 or more against title, whether the search is settled).
    The search is settled, with no entry, when doi.org gives no entry for that DOI or every index is left out when its record is resolved; each reason goes to notes."""
    for doi in dois:
        identifier = Identifier("doi", doi, doi)
        named = list(zip(INDEX_NAMES, (lookup_crossref(client, identifier), lookup_openalex(client, identifier), lookup_s2(client, identifier))))
        left_out = [f"{name}: left out, {outcome.left_out}" for name, outcome in named if outcome.left_out]
        if len(left_out) == len(named):
            notes.extend(left_out)
            return "", True
        found = next(((name, outcome.records[0]) for name, outcome in named if outcome.records), None)
        if found is None:
            notes.extend(left_out)
            notes.append(f"published DOI {doi}: not found")
            continue
        ratio = title_ratio(title, found[1].title)
        if ratio < MATCH_THRESHOLD:
            notes.append(f"published DOI {doi}: title ratio {ratio:.2f} against {found[0]}, below 0.70")
            continue
        entry, reason, status = doi_entry(client, doi)
        if entry:
            return entry, True
        if status is None:
            reason = f"left out, {reason}"
        elif status == 200:
            reason += ", not a BibTeX entry"
        notes.append(f"published DOI {doi}: doi.org {reason}")
        return "", True
    return "", False


def arxiv_line(outcome):
    return "arXiv: " + (f"left out, {outcome.left_out}" if outcome.left_out else "not found")


def arxiv_entry(client, identifier, out, notes):
    """bibtex for an arXiv ID: the entry of the published version when an index names its DOI and doi.org gives it, else the @misc entry of the arXiv record."""
    arxiv = lookup_arxiv(client, identifier)
    s2 = lookup_s2_published(client, identifier)
    openalex = lookup_openalex_published(client, identifier)
    for name, outcome in (("Semantic Scholar", s2), ("OpenAlex", openalex)):
        if outcome.left_out:
            notes.append(f"{name}: left out, {outcome.left_out}")
    titles = [record.title for outcome in (arxiv, s2, openalex) for record in outcome.records if record.title]
    dois = published_dois([s2, openalex])
    entry, settled = published_entry(client, titles[0] if titles else "", dois, notes)
    if entry:
        out.append(entry)
        return 0
    if not arxiv.records:
        notes.append(arxiv_line(arxiv))
        return 1
    out.append(arxiv_bibtex(arxiv.records[0]).rstrip("\n"))
    venue = None if settled else published_venue(s2)
    if venue:
        named = "with no DOI named by Semantic Scholar or OpenAlex" + (" whose record matches the title" if dois else "")
        notes.append(f"published in {venue[0]} ({venue[1]}) per Semantic Scholar, {named}: lookup.py bibtex {identifier.arxiv_id} --page {VENUE_PAGE}")
    return 0


def venue_page_entry(client, identifier, url, out, notes):
    """bibtex <arXiv ID> --page <url>: the entry of the published version built from the citation tags of the venue's page of the work, checked against the arXiv ID's record."""
    arxiv = lookup_arxiv(client, identifier)
    s2 = lookup_s2_published(client, identifier)
    if s2.left_out:
        notes.append(f"Semantic Scholar: left out, {s2.left_out}")
    titles = [record.title for outcome in (arxiv, s2) for record in outcome.records if record.title]
    if not titles:
        notes.append(arxiv_line(arxiv))
        notes.append(f"page {url}: no record of arXiv {identifier.arxiv_id} to compare its title with")
        return 1
    try:
        tags, final = read_page(client, url)
    except (LeftOut, ExcludedPage) as reason:
        notes.append(f"page {url}: {reason}")
        return 1
    page_title = first_tag(tags, "citation_title")
    if not page_title:
        notes.append(f"page {url}: no citation_title tag")
        return 1
    if page_year(tags) is None:
        notes.append(f"page {url}: no year tag")
        return 1
    ratio = title_ratio(titles[0], page_title)
    if ratio < MATCH_THRESHOLD:
        notes.append(f"page {url}: citation_title ratio {ratio:.2f}")
        return 1
    conference = any(record.venue.get("type") == "conference" for record in s2.records)
    out.append(page_bibtex(identifier.arxiv_id, tags, final, conference).rstrip("\n"))
    return 0


def run_bibtex(client, arguments, out, notes):
    """bibtex: the entry goes to out in ASCII (ascii_entry), which main prints on standard output, and every other line to notes, which it prints on standard error."""
    entries = []
    status = bibtex_lookup(client, arguments, entries, notes)
    out.extend(ascii_entry(entry, notes) for entry in entries)
    return status


def bibtex_lookup(client, arguments, out, notes):
    """The entry of bibtex as doi.org, the arXiv record or the venue's page gives it, before ascii_entry."""
    positional, options = parse_options(arguments, ("--page",), "bibtex")
    expect_arguments(positional, 1, "bibtex", "<DOI | arXiv ID> [--page <url>]")
    identifier = require_identifier(positional[0])
    if "--page" in options:
        if not identifier.arxiv_id:
            raise UsageError("--page needs an arXiv ID")
        return venue_page_entry(client, identifier, options["--page"], out, notes)
    if identifier.arxiv_id:
        return arxiv_entry(client, identifier, out, notes)
    entry, reason, status = doi_entry(client, identifier.doi)
    if entry:
        out.append(entry)
        return 0
    notes.append(f"doi.org: left out, {reason}" if status is None else f"doi.org: {reason}, not a BibTeX entry")
    return 1


def entry_url(fields):
    if fields.get("doi"):
        return "https://doi.org/" + quote_doi(strip_doi(fields["doi"]))
    if fields.get("eprint"):
        return "https://arxiv.org/abs/" + urllib.parse.quote(fields["eprint"], safe="/.")
    return fields.get("url", "")


def title_check(client, fields):
    """(the text a key's line ends with, whether it is a failure) for the title of an entry with a doi, compared with the first record the doi resolves to; ("", False) for an entry with no doi."""
    doi = strip_doi(fields.get("doi", ""))
    if not doi:
        return "", False
    identifier = classify(doi)
    if identifier.kind == "title":
        identifier = Identifier("doi", doi, doi)
    left_out = []
    for name, ask in (("Crossref", lookup_crossref), ("OpenAlex", lookup_openalex), ("Semantic Scholar", lookup_s2)):
        outcome = ask(client, identifier)
        if outcome.left_out:
            left_out.append(f"{name} left out, {outcome.left_out}")
        elif outcome.records:
            ratio = title_ratio(fields.get("title", ""), outcome.records[0].title)
            mismatch = ratio < MATCH_THRESHOLD
            return f", ratio {ratio:.2f} against {name}" + (", DOI_MISMATCH" if mismatch else ""), mismatch
    if left_out:
        return ", title not checked: " + "; ".join(left_out), True
    return ", doi not found in Crossref, OpenAlex or Semantic Scholar", True


def run_cite_keys(client, arguments, out):
    positional, _ = parse_options(arguments, (), "cite-keys")
    expect_arguments(positional, 2, "cite-keys", "<main.tex> <file.bib>")
    cited = tex_cited_keys(positional[0])
    entries = parse_bib(read_text_file(positional[1]))
    cited_set = set(cited)
    missing = [key for key in cited if key not in entries]
    unused = [key for key in entries if key not in cited_set]
    out.extend(f"missing: {key}" for key in missing)
    out.extend(f"unused: {key}" for key in unused)
    return 1 if missing or unused else 0


def run_check_urls(client, arguments, out):
    positional, _ = parse_options(arguments, (), "check-urls")
    expect_arguments(positional, 2, "check-urls", "<main.tex> <file.bib>")
    keys = tex_cited_keys(positional[0])
    bib = parse_bib(read_text_file(positional[1]))
    failed = False
    for key in keys:
        if key not in bib:
            out.append(f"{key}: no entry in {os.path.basename(positional[1])}")
            failed = True
            continue
        url = entry_url(bib[key])
        if not url:
            out.append(f"{key}: no identifier")
            failed = True
            continue
        try:
            status = client.get(url, read_body=False).status
            line, key_failed = f"{key}: {status} {url}", not 200 <= status < 300
        except LeftOut as reason:
            line, key_failed = f"{key}: failed, {reason} {url}", True
        title, title_failed = title_check(client, bib[key])
        out.append(line + title)
        failed = failed or key_failed or title_failed
    if not keys:
        out.append("the .tex cites no key")
    return 1 if failed else 0


def run_quote_check(client, arguments, out):
    positional, _ = parse_options(arguments, (), "quote-check")
    expect_arguments(positional, 3, "quote-check", "<citation report> <file.bib> <folder>")
    folder = positional[2]
    if not os.path.isdir(folder):
        raise UsageError(f"{folder}: not a folder")
    record_text = read_text_file(positional[0])
    bib = parse_bib(read_text_file(positional[1]))

    def read_text(name):
        path = os.path.join(folder, name)
        return read_text_file(path) if os.path.exists(path) else None

    lines, failed = quote_check_lines(record_text, set(bib), read_text)
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
            done = subprocess.run(["pdftotext", pdf_path, text_path], capture_output=True, timeout=PDFTOTEXT_TIMEOUT, check=False)
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

    def page(self, url):
        """Try the PDF that the citation_pdf_url tag of a venue's page names; True when it gave a full text, which is then written."""
        try:
            tags, final = read_page(self.client, url)
        except (LeftOut, ExcludedPage) as reason:
            self.out.append(f"page {url}: {reason}")
            return False
        pdf = first_tag(tags, "citation_pdf_url")
        if not pdf:
            self.out.append(f"page {url}: no citation_pdf_url tag")
            return False
        pdf_url = urllib.parse.urljoin(final, pdf)
        self.out.append(f"page {url}: citation_pdf_url {pdf_url}")
        return self.attempt(pdf_url, "pdf")

    def abstract(self, outcomes):
        """Write the first abstract of the outcomes' records as <stem>.abstract.txt; the exit status of a fetch with no full text."""
        abstract = next((record.abstract for outcome in outcomes for record in outcome.records if record.abstract), "")
        if abstract:
            path = self.write(".abstract.txt", (abstract + "\n").encode("utf-8"))
            self.out.append(f"no full text; the abstract is in {os.path.basename(path)}")
        else:
            self.out.append("no full text and no abstract")
        return 1

    def note(self, name, outcome, what):
        if outcome.left_out:
            self.out.append(f"lookup {name}: left out, {outcome.left_out}")
        elif not outcome.records:
            self.out.append(f"lookup {name}: not found")
        elif not what:
            self.out.append(f"lookup {name}: no open-access URL")
        else:
            self.out.append(f"lookup {name}: found")


def lookup_by_id(client, text):
    """(the index's name, its outcome) for the record of a Semantic Scholar ID or an OpenAlex ID, asked of that index alone, with the abstract."""
    if OPENALEX_ID.match(text):
        url = f"https://api.openalex.org/works/{text}?select={OPENALEX_FIELDS},abstract_inverted_index"
        return "OpenAlex", outcome_of(lambda: get_parsed(client, url, parse_openalex_work))
    url = f"https://api.semanticscholar.org/graph/v1/paper/{text}?fields={S2_FIELDS},abstract"
    return "Semantic Scholar", outcome_of(lambda: get_parsed(client, url, parse_s2_paper))


def run_fetch(client, arguments, out):
    positional, options = parse_options(arguments, ("--page",), "fetch")
    expect_arguments(positional, 3, "fetch", "<DOI | arXiv ID | Semantic Scholar ID | OpenAlex ID> <folder> <key> [--page <url>]")
    text = positional[0].strip()
    identifier = require_identifier(text, with_ids=True)
    folder, key = positional[1], positional[2]
    if not key.strip():
        raise UsageError("the key is empty")
    if not os.path.isdir(folder):
        raise UsageError(f"{folder}: not a folder")
    run = FetchRun(client, folder, file_stem(key), out)
    if "--page" in options and run.page(options["--page"]):
        return 0
    if identifier.kind != "id":
        return fetch_identifier(run, client, identifier)
    name, outcome = lookup_by_id(client, text)
    if not outcome.records:
        run.note(f"{name} {text}", outcome, [])
        return run.abstract([])
    record = outcome.records[0]
    given = [found for found in (classify(record.doi), classify(record.arxiv_id)) if found.kind != "title"]
    if given:
        out.append(f"lookup {name} {text}: found, {'doi' if given[0].kind == 'doi' else 'arXiv'} {given[0].text}")
        return fetch_identifier(run, client, given[0])
    out.append(f"lookup {name} {text}: found, no DOI and no arXiv ID" + ("" if record.oa_urls else ", no open-access URL"))
    if any(run.attempt(url, "pdf") for url in record.oa_urls):
        return 0
    return run.abstract([outcome])


def fetch_identifier(run, client, identifier):
    """The full text of a DOI or an arXiv ID, else its abstract, written by run; the exit status of fetch."""
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
    return run.abstract(abstracts + [s2, openalex])


def saved_kind(body):
    """"markup" for an HTML or XML body (its first character other than a byte order mark and blank text is <), "pdf" for a body starting %PDF-, and "" for any other."""
    if body.startswith(UTF8_BOM):
        body = body[len(UTF8_BOM):]
    if body.lstrip().startswith(b"<"):
        return "markup"
    return "pdf" if is_pdf(body) else ""


def page_text(body):
    """A saved HTML or XML body as text: UTF-8 after a byte order mark, else the charset the body declares, else UTF-8, with replacement."""
    if body.startswith(UTF8_BOM):
        return body[len(UTF8_BOM):].decode("utf-8", errors="replace")
    declared = XML_ENCODING.search(body) or META_CHARSET.search(body)
    try:
        return body.decode(declared.group(1).decode("ascii") if declared else "utf-8", errors="replace")
    except LookupError:
        return body.decode("utf-8", errors="replace")


def pdf_to_text(path, output):
    """True when pdftotext wrote the text of the PDF at path to output, False when it exited non-zero or timed out. UsageError when pdftotext is not installed.
    The PDF goes to pdftotext as its absolute path, so a name that starts with - is never read as an option."""
    try:
        done = subprocess.run(["pdftotext", os.path.abspath(path), output], capture_output=True, timeout=PDFTOTEXT_TIMEOUT, check=False)
    except FileNotFoundError:
        raise UsageError("pdftotext not found") from None
    except subprocess.TimeoutExpired:
        return False
    return done.returncode == 0


def run_text(client, arguments, out):
    """Write the text of a saved HTML, XML or PDF file as <folder>/<stem>.txt, or with --abstract as <folder>/<stem>.abstract.txt. It makes no request, so the client goes unused."""
    # --abstract takes no value, so it is taken out before the options that take one are parsed.
    end = arguments.index("--") if "--" in arguments else len(arguments)
    abstract = "--abstract" in arguments[:end]
    arguments = [argument for argument in arguments[:end] if argument != "--abstract"] + arguments[end:]
    positional, _ = parse_options(arguments, (), "text")
    expect_arguments(positional, 3, "text", "[--abstract] <file> <folder> <key>")
    path, folder, key = positional
    if not key.strip():
        raise UsageError("the key is empty")
    if not os.path.isdir(folder):
        raise UsageError(f"{folder}: not a folder")
    target = os.path.join(folder, file_stem(key) + (".abstract.txt" if abstract else ".txt"))
    # A link counts as existing, a dangling one included, so that no text is written through it.
    if os.path.lexists(target):
        raise UsageError(f"{target} exists")
    try:
        with open(path, "rb") as handle:
            body = handle.read()
    except OSError as error:
        raise UsageError(f"{path}: {error.strerror or error}") from None
    kind = saved_kind(body)
    if not kind:
        raise UsageError(f"{path}: not an HTML, XML or PDF file")
    try:
        descriptor, temporary = tempfile.mkstemp(prefix=TEMPORARY_PREFIX, suffix=".txt", dir=os.path.abspath(folder))
        os.close(descriptor)
    except OSError as error:
        raise UsageError(f"{folder}: {error.strerror or error}") from None
    try:
        if kind == "pdf":
            text = ""
            if pdf_to_text(path, temporary):
                with open(temporary, encoding="utf-8", errors="replace") as handle:
                    text = handle.read()
        else:
            text = html_to_text(page_text(body))
            try:
                with open(temporary, "w", encoding="utf-8") as handle:
                    handle.write(text)
            except OSError as error:
                raise UsageError(f"{target}: {error.strerror or error}") from None
        if not text.strip():
            out.append(f"{path}: no text")
            return 1
        # A link fails when the target exists, so a text that appeared since the check above is never replaced.
        try:
            os.link(temporary, target)
        except FileExistsError:
            raise UsageError(f"{target} exists") from None
        except OSError as error:
            raise UsageError(f"{target}: {error.strerror or error}") from None
    finally:
        try:
            os.remove(temporary)
        except OSError:
            pass
    # The text is read back, so a text on disk that differs from the one made is refused and removed.
    with open(target, encoding="utf-8", errors="replace") as handle:
        written = handle.read()
    if written != text:
        os.remove(target)
        raise UsageError(f"{target}: the text read back differs from the text made")
    out.append(f"{os.path.basename(target)}: {len(text)} characters from {path}")
    return 0


HANDLERS = {
    "resolve": run_resolve,
    "search": run_search,
    "refs": run_refs,
    "cited-by": run_cited_by,
    "index-abstract": run_index_abstract,
    "dblp": run_dblp,
    "cite-keys": run_cite_keys,
    "check-urls": run_check_urls,
    "fetch": run_fetch,
    "quote-check": run_quote_check,
    "text": run_text,
}


def run_command(client, command, arguments, out, notes):
    """The exit status of one command; out is printed on standard output and notes, which only bibtex writes, on standard error."""
    if command == "bibtex":
        return run_bibtex(client, arguments, out, notes)
    return HANDLERS[command](client, arguments, out)


def main(argv):
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    if not argv or argv[0] not in COMMANDS:
        print("usage: lookup.py <command> ...", file=sys.stderr)
        print("commands: " + ", ".join(COMMANDS), file=sys.stderr)
        return 2
    out, notes = [], []
    try:
        status = run_command(Client(os.environ, cache=argv[0] in CACHED_COMMANDS), argv[0], argv[1:], out, notes)
    except UsageError as error:
        for line in out:
            print(line)
        print(f"error: {error}", file=sys.stderr)
        return 2
    for line in out:
        print(line)
    for line in notes:
        print(line, file=sys.stderr)
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
