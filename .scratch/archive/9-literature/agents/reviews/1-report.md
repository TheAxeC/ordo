Not done as written, three places. (1) C12's live run of `bibtex` on an arXiv ID whose Atom title spans two lines: no such ID was found on the live index (about 1,300 results of 6 searches held no title with a line break); a recorded Atom body in `lookup.test.sh` proves it, and `bibtex` of a live arXiv ID is quoted below. (2) Point 9 of repair round 1 is applied to the two stops that end the run and not to "Prose findings", which waits for a reply and needs `<work>` for the steps after it; the reason is under point 9. (3) How Semantic Scholar reads a sentence query could not be run, because its shared pool answered HTTP 429 on every run of this round; no sentence of the skill or the head comment states it. Everything else in the brief and in repair round 1 is done.

# Report of step 1, the literature skill, its lookup script and its wiring

## Open items of the state file

```
- none.
```

## The cases' first run

The first run is on the unchanged tree, commit dc0b030 (`git ls-tree dc0b030 skills/literature | wc -l` prints `0`). Each case below gives that run, then the result on the finished tree.

### Rulings carried

1. T5's last assertion uses "mutual information estimation", which is not found; matching stays by substring, with no word-boundary condition. `lookup.test.sh` line 131 asserts it.
2. C14's pacing is shown by `time ... fetch 2511.99999 <scratch> none`, since every real arXiv paper has HTML; C15 is the naming case only; in C14 the changed word is no prefix or extension of the source's word ("dependence" becomes "correlation").
3. The text of `<script>` and `<style>` elements is left out of the text `fetch` writes for HTML (`html_to_text`, `lookup.py` line 697).
4. A doi.org body whose first non-whitespace character is `@` counts as BibTeX and is printed as given (`run_bibtex`, `lookup.py` line 1102); C12 below shows the leading space kept.

### Text cases C1 to C8 (read on the unchanged tree, then on the finished tree)

Commands: `git ls-tree dc0b030 skills/literature | wc -l`; `grep -c 'rebuild: literature' docs/academic-coverage.md`; `grep 'rebuild: literature' docs/academic-coverage.md | grep -c 'skills/literature/'`; `grep -c literature <file>` over the files named in C6; ``grep -c 'with `curl`'`` and ``grep -c 'fetched by `lookup.py fetch`'`` over ADR 0016; `grep -c 'passage line'` over the prose standard and ADR 0002. Counts on the unchanged tree (extracted from dc0b030) and on the finished tree:

```
unchanged tree: skills/literature entries 0; rebuild: literature rows 22; rows naming skills/literature/ 0; ADR 0016 'with `curl`' 1, 'fetched by `lookup.py fetch`' 0; passage line in prose standard 0, in ADR 0002 0; 'literature' in plan-terms.md, docs/glossary.md, template glossary.md, .agents/plan.yaml, plan.yaml template, orchestrator-state.md, the five agents/ordo-*.md, README.md, scripts.md, building.md, change-standard.md: 0 in each
finished tree:  skills/literature has references SKILL.md templates; rebuild: literature rows 22; rows naming skills/literature/ 22; ADR 0016 'with `curl`' 0, 'fetched by `lookup.py fetch`' 1; passage line in prose standard 1, in ADR 0002 1; 'literature' in plan-terms.md 2; 'literature' in docs/glossary.md 2; 'literature' in template glossary.md 1; 'literature' in .agents/plan.yaml 1; 'literature' in plan.yaml template 2; 'literature' in orchestrator-state.md 2; 'literature' in README.md 3; 'literature' in scripts.md 2; 'literature' in building.md 1; 'literature' in change-standard.md 1; each agents/ordo-*.md 2, 2, 2, 2, 2
```

- C1: the unchanged tree has no `skills/literature/SKILL.md` (`git show dc0b030:skills/literature/SKILL.md` prints `fatal: path 'skills/literature/SKILL.md' exists on disk, but not in 'dc0b030'`). The finished `SKILL.md` has these sections in the layout's order, checked by `grep -n '^#' skills/literature/SKILL.md`:

```
8:# Search, verify and cite the literature on a topic
12:## Quick start
23:## Use instead
32:## What it reads
55:## Steps
141:### Full report
148:### Lit-review
155:### Three-way scan
164:## The agents
178:### Agent prompts
189:## The files of a run
200:## Stops
221:## Anti-patterns
238:## Rules
```

- C2: the call forms stand in Quick start, lines 15 to 17 of `SKILL.md`, each with `[--bib <path>] [--out <folder>]`, and line 18 shows the `projects:` form; the unchanged tree has no such lines.
- C3: Steps 4 (effort agent and `CLAUDE_CODE_EFFORT_LEVEL` check) and 7 (every agent, writers included, started as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names, with the served-model read and the stop "A model other than the configured one") come before and after every start; Steps 14 to 17 run the editor, the devil's advocate and two revisions in every mode; the mode subsections add no step that skips them. Read against `skills/writing/SKILL.md` Steps 4, 6 and 7.
- C4: the coverage records below name, for each of the 22 rows, the file and the section or line holding each part; no part a row sends to `idea`, `paper`, `paper-review`, `researcher`, entry 15.A or `writing` is built.
- C5: ADR 0015 (fresh agents in turn, editor and devil's advocate for every mode): `SKILL.md` Steps 7 to 23 (lines 78 to 132) and "The agents" (line 164); ADR 0016 (locator and verbatim passage, fetched by `lookup.py fetch`, abstract-only citation, no-text listing): `references/reading.md` lines 14 to 64 and `SKILL.md` Anti-patterns lines 221 to 236; ADR 0017 (one standard-library script): `SKILL.md` Steps 21 and "What it reads" 7, `templates/lookup.py` head comment lines 1 to 61.
- C6: the eight files of ruling B's edits and the five `agents/ordo-*.md` name `literature` (counts above). `git diff -U0 .agents/plan.yaml skills/plan/templates/plan.yaml skills/plan/templates/orchestrator-state.md | grep '^[+-][^+-]' | grep -vc '#'` prints `0` of `10` changed lines: every changed line is comment text.
- C7: each of the 22 reasons names a `skills/literature/` file in backticks (22 rows counted above), and each file is the one its coverage record names; `check_coverage.py` is quoted under check 2 below.
- C8: ADR 0016 line 11 now reads "The full text is fetched by `lookup.py fetch` into a temporary folder" (`sed -n 11p docs/adr/0016-*.md | grep -c 'fetched by `lookup.py fetch` into a temporary folder'` prints `1`); the prose standard's "How it is applied" paragraph (line 75) and ADR 0002's Consequences (line 20) each hold the passage-line sentence.

### Code cases kept as tests, T1 to T7

First run on the unchanged tree (the test script copied into the extracted dc0b030 tree, where `lookup.py` does not exist):

```
sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1
FAIL: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/base/skills/literature/templates/lookup.py does not exist
(exit status of the script: 1)
```

Run on the finished tree:

```
sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces arXiv across processes, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, and reads BibTeX and HTML
lookup.test.sh exit 0
```

Each case is asserted in `lookup.test.sh`: T1 lines 72 to 75, T2 lines 77 to 88, T3 lines 90 to 106, T4 lines 108 to 124, T5 lines 126 to 132, T6 lines 134 to 146, T7 lines 148 to 151. The test imports `lookup.py` from its own folder with `python3 -B -I`, and `lookup.py` holds no parameter, variable or file for the test.

### Code cases checked by a run, C9 to C17

On the unchanged tree each of these commands prints (the same for every command):

```
python3 skills/literature/templates/lookup.py resolve 2511.18945
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '.../skills/literature/templates/lookup.py': [Errno 2] No such file or directory
exit 2
```

On the finished tree, run live from the worktree root (the index answers vary with the shared Semantic Scholar pool, whose HTTP 429 shows as `Semantic Scholar: left out, HTTP 429 after 3 retries` where it did not answer):

**C9**: `python3 skills/literature/templates/lookup.py resolve 2511.18945`

```
Crossref: not found
OpenAlex: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | Gritsai, German, Richards, Megan, M<latin small letter e with acute>loux, Maxime et al. | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2511.18945 | arXiv 2511.18945 | OpenAlex W7106664066 | open access https://arxiv.org/pdf/2511.18945
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | arXiv 2511.18945
exit 0
```

**C10**: `python3 skills/literature/templates/lookup.py resolve "Mutual Information Neural Estimation" --year 2018`

```
Crossref: not found
OpenAlex: ratio 1.00: Mutual Information Neural Estimation. | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeshwar et al. | 2018 | International Conference on Machine Learning | OpenAlex W2803832867
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 0.94: MINE: Mutual Information Neural Estimation | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeswar et al. | 2018 | arXiv 1801.04062
exit 0
```

**C11 (bare DOI)**: `python3 skills/literature/templates/lookup.py resolve 10.1016/S0019-9958(57)90116-X`

```
Crossref: ratio 1.00: An informational measure of correlation | E.H. Linfoot | 1957 | Information and Control | doi 10.1016/s0019-9958(57)90116-x
OpenAlex: ratio 1.00: An informational measure of correlation | Edward H. Linfoot | 1957 | Information and Control | doi 10.1016/s0019-9958(57)90116-x | OpenAlex W2070480153 | open access https://www.sciencedirect.com/science/article/pii/S001999585790116X/pdf
Semantic Scholar: ratio 1.00: An Informational Measure of Correlation | E. H. Linfoot | 1957 | Information and Control | doi 10.1016/S0019-9958(57)90116-X | Semantic Scholar 8468c1d420b6d78f920b74cd685bfa05d8c0e923 | open access https://www.sciencedirect.com/science/article/pii/S001999585790116X/pdf
arXiv: left out, the input has no arXiv ID
exit 0
```

**C11 (DOI as a URL)**: `python3 skills/literature/templates/lookup.py resolve https://doi.org/10.1016/S0019-9958(57)90116-X`

```
Crossref: ratio 1.00: An informational measure of correlation | E.H. Linfoot | 1957 | Information and Control | doi 10.1016/s0019-9958(57)90116-x
OpenAlex: ratio 1.00: An informational measure of correlation | Edward H. Linfoot | 1957 | Information and Control | doi 10.1016/s0019-9958(57)90116-x | OpenAlex W2070480153 | open access https://www.sciencedirect.com/science/article/pii/S001999585790116X/pdf
Semantic Scholar: ratio 1.00: An Informational Measure of Correlation | E. H. Linfoot | 1957 | Information and Control | doi 10.1016/S0019-9958(57)90116-X | Semantic Scholar 8468c1d420b6d78f920b74cd685bfa05d8c0e923 | open access https://www.sciencedirect.com/science/article/pii/S001999585790116X/pdf
arXiv: left out, the input has no arXiv ID
exit 0
```

**C12 (DOI)**: `python3 skills/literature/templates/lookup.py bibtex 10.1103/PhysRevE.69.066138`

```
 @article{Kraskov_2004, title={Estimating mutual information}, volume={69}, ISSN={1550-2376}, url={http://dx.doi.org/10.1103/PhysRevE.69.066138}, DOI={10.1103/physreve.69.066138}, number={6}, journal={Physical Review E}, publisher={American Physical Society (APS)}, author={Kraskov, Alexander and St<latin small letter o with diaeresis>gbauer, Harald and Grassberger, Peter}, year={2004}, month=June }
exit 0
```

**C12 (arXiv ID)**: `python3 skills/literature/templates/lookup.py bibtex 1801.00862`

```
@misc{arxiv_1801_00862,
  title = {Quantum Computing in the NISQ era and beyond},
  author = {John Preskill},
  year = {2018},
  eprint = {1801.00862},
  archivePrefix = {arXiv}
}
exit 0
```

C12's arXiv title that spans two lines: not run live. Six arXiv searches returned about 1,300 results and none had a newline in its title. The case is proven by the recorded Atom body in `lookup.test.sh` (line 67, assertion "arxiv title on one line"), which holds a title and an abstract broken across lines and expects them on one line. The `@misc` entry above shows the live output form.

**C13**: the scratch report holds a passage with a quotation mark, a multi-key citation, a citation with no passage line (`noid2001`), a key absent from `references.bib` (`absent2000`) and the entry `gritsai2025` copied from the gate's library (`doi = {10.48550/arXiv.2511.18945}`, no `eprint`). `python3 skills/literature/templates/lookup.py check-urls <scratch>/c13/report.md`:

```
gritsai2025: 200 https://doi.org/10.48550/arXiv.2511.18945
linfoot1957: 200 https://doi.org/10.1016/S0019-9958(57)90116-X
noid2001: no identifier
absent2000: no entry in references.bib
exit 1
```

With the faulty citations removed (`<scratch>/c13ok/report.md`):

```
gritsai2025: 200 https://doi.org/10.48550/arXiv.2511.18945
linfoot1957: 200 https://doi.org/10.1016/S0019-9958(57)90116-X
exit 0
```

**C14**: `time python3 skills/literature/templates/lookup.py fetch 10.48550/arXiv.2511.18945 <scratch> gritsai2025`, which wrote `gritsai2025.html` and `gritsai2025.txt` in `<scratch>`:

```
tried https://arxiv.org/html/2511.18945: HTTP 200, full text
python3 -B $L fetch 10.48550/arXiv.2511.18945 $S/c14 gritsai2025  0.13s user 0.03s system 5% cpu 2.727 total
exit 0
```

`quote-check` of a scratch report whose passage is copied from that `.txt`, then of the same report with "dependence" changed to "correlation":

```
line 3: gritsai2025, section 1: found
exit 0
```

```
line 3: gritsai2025, section 1: not found
exit 1
```

Pacing, by ruling 2: `time python3 skills/literature/templates/lookup.py fetch 2511.99999 <scratch> none` (an ID with no paper, so the arXiv HTML and PDF requests both fail and are made one after the other):

```
tried https://arxiv.org/html/2511.99999: HTTP 404
tried https://arxiv.org/pdf/2511.99999: HTTP 404
lookup OpenAlex: not found
lookup Semantic Scholar: left out, HTTP 429 after 3 retries
no full text and no abstract
python3 -B $L fetch 2511.99999 $S/c14p none  0.09s user 0.03s system 1% cpu 11.831 total
exit 1
```

The two arXiv requests, timed by calling the script's own `Client.get` for the two URLs (`python3 -B -I -` with `lookup` imported from the templates folder), started right after the run above, so the first waits for the 3 seconds that follow the last arXiv request of that run:

```
2.77 s after the start: HTTP 404 https://arxiv.org/html/2511.99999
5.89 s after the start: HTTP 404 https://arxiv.org/pdf/2511.99999
```

The second request ends 3.12 s after the first ended, which is at least 3 s (`ARXIV_SPACING = 3.0`, `lookup.py` line 82).

**C15**: `python3 skills/literature/templates/lookup.py fetch math/0601001 <scratch>/inner 'smith:2006/a'`; `find <scratch>/c15 -type f` lists only the two files below, both inside `inner`:

```
tried https://arxiv.org/html/math/0601001: HTTP 200, full text
exit 0
```

```
<scratch>/c15/inner/smith_2006_a.txt
<scratch>/c15/inner/smith_2006_a.html
```

**C16**: `fetch 10.1007/BF02024507 <scratch> renyi1959` (no file written; `ls <scratch>/c16` is empty):

```
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: no open-access URL
no full text and no abstract
exit 1
```

`fetch 10.1002/9780470316726.ch2 <scratch> wiley1` (DOI named for the report: OpenAlex holds an `abstract_inverted_index` and no `oa_url`; it wrote `wiley1.abstract.txt`):

```
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: no open-access URL
no full text; the abstract is in wiley1.abstract.txt
exit 1
```

`quote-check` of a scratch report whose passage with the locator `abstract` is copied from that file:

```
line 3: wiley1, abstract: found
exit 0
```

**C17**: `OPENALEX_API_KEY=not-a-key python3 skills/literature/templates/lookup.py resolve 2511.18945`, then `grep -c not-a-key` over that output (prints `0`, exit status 1 meaning no match):

```
Crossref: not found
OpenAlex: left out, HTTP 401
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | arXiv 2511.18945
exit 0
```

## DONE / NOT DONE

| Item of the brief | Status | Check |
|---|---|---|
| 1 SKILL.md, layout, description at most 1,024 | DONE | check 3 below; C1 |
| 2 Quick start, Use instead | DONE | C2; `SKILL.md` lines 12 to 30 |
| 3 What it reads | DONE | `SKILL.md` lines 32 to 53 |
| 4 The agents, effort check, served model, two revisions | DONE | C3 |
| 5 The eight `references/` files | DONE | coverage records; `wc -l` below |
| 6 The outputs | DONE | `SKILL.md` Steps 3 and 12, "The files of a run" lines 189 to 198 |
| 7 The run in order | DONE | `SKILL.md` Steps 8 to 25 |
| 8 An index left out is named | DONE | `references/synthesis.md` line 112 (method section), `SKILL.md` Rules |
| 9 to 11 `lookup.py` | DONE | live runs C9 to C17; head comment lists inputs, errors and exit statuses |
| 12 `lookup.test.sh` | DONE | check 1 |
| 13 ADR 0016 | DONE | C8 |
| 14 Prose standard and ADR 0002 sentences | DONE | C8 |
| 15 Ruling B's five edits | DONE | check 1 (second line), check 2 sync, C6 |
| 16 `agents/ordo-*.md` | DONE | C6 |
| 17 README row, line 78, install loop | DONE | `git diff README.md` |
| 18 `docs/dev/scripts.md` | DONE | `git diff docs/dev/scripts.md` |
| 19 Coverage reasons | DONE | C7; check 2 |
| 20 Coverage records | DONE | the section below |

Checks of "Verify before you report", run from the worktree root after the last edit:

1. The checks of the verify list that cover the changed files:

```
sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces arXiv across processes, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, and reads BibTeX and HTML
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
```

The character-set check in the brief's form, over the files the step changes, is quoted in full under point 21 of repair round 1 below, with its exit status.

2. `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research`:

```
ok: docs/academic-coverage.md
exit 0
```

3. The description-length command, filtered to this skill (`... | grep literature`):

```
920 skills/literature/SKILL.md
```

4. The live runs C9 to C17 are quoted above.

5. `lookup.test.sh` ran on the unchanged tree, where `lookup.py` does not exist (`FAIL`, exit 1, quoted above), and passes now. `lookup.py` and `lookup.test.sh` hold no character outside ASCII: `LC_ALL=C grep -n '[^ -~]' skills/literature/templates/lookup.py skills/literature/templates/lookup.test.sh` prints nothing and exits 1 (no match).

6. List items and sentences, read against the prose standard's section E and the layout's "Writing for an agent". The prose standard sets a sentence at about 20 words unless the mechanism needs more. A scan of `SKILL.md` and the eight reference files for sentences of more than 30 words outside code blocks and tables (backticked text counted as one word), `python3` over the files, prints these places, each a statement that lists the items of one definition or one mechanism and that splitting would separate from its list:

```
SKILL.md 185 32 - Every value a user, a source or an index supplies, such as a title, 
references/failure-paths.md 34 31 - **A Critical issue in both passes.** It is named in the message that
references/failure-paths.md 45 31 - **The synthesis agent.** It uses the framework of the primary field 
references/reading.md 39 31 Where the text breaks a word with a hyphen at the end of a line, write
references/reading.md 42 33 - The locator is the page for a PDF, the section heading for an HTML p
references/search.md 21 32 Any other source gets its first author's family name in lowercase ASCI
references/search.md 124 32 A share of 70 percent or more is written as the dimension, the value, 
references/synthesis.md 39 33 - Before a sentence cites a source for an event, a version, a state of
references/synthesis.md 49 34 - For the main results, list every plausible explanation, judge each b
references/synthesis.md 85 36 - A pair is a candidate when the two sources share a sub-question, sha
references/synthesis.md 90 34 - End the table with a coverage note that gives the number of sources,
references/synthesis.md 98 36 Surface borrowing, a method forced on a question it does not fit, trea
references/synthesis.md 155 37 The files are done when every citation has a passage line, every kept 
```

Each of these lists the items of one definition or one mechanism, or states a condition with its exception, and is kept whole for that reason. The long lists of the sources (the scales, the grades, the red flags, the statuses, the method section) are bulleted. The description line and the Quick start comment column are data lines.

## Coverage records

Paths are under `skills/literature/`. Line numbers are those of the finished files. "Not built here" names a part the row sends to another skill or drops.

- **Row 59**, `agents/literature_strategist_agent.md`:
  - Boolean, chaining and semantic searches: `references/search.md` "The searches" layers 1 to 4 (lines 48 to 62).
  - Preset criteria with the question: `references/search.md` "The method, written before the first search" (24 to 32).
  - Two-stage screening: `references/search.md` "Screening" (76 to 91).
  - Theme matrix: `references/search.md` "What `search.md` holds" Theme matrix (line 122); gap types: `references/synthesis.md` "The matrix, convergence and gaps" (51 to 67).
  - Saturation stops: `references/search.md` "The stopping rule" (64 to 74).
  - 70 percent concentration advisory: `references/search.md` Coverage advisory (line 124).
  - Not built here: Taiwan databases, the passport corpus protocol and the trust-chain fields (the row drops them).
- **Row 84**, `references/domain_evidence_profiles.md`:
  - The `cs_ml` profile (preprints and proceedings count beside journals): `references/verification.md` Definitions, Peer-reviewed (line 22), and "Grading each confirmed source" (line 90); `references/search.md` Rules (line 22) and Screening (line 85).
  - Non-reproducible results and benchmark cherry-picking surfaced: `references/verification.md` "Claims and their status" (line 133) and `references/devils-advocate.md` "Biases" (59 to 63).
  - Made the ML default: `references/search.md` line 22 (`cs_ml` for machine learning, statistics and computing topics).
  - Not built here: the other profiles and their machinery.
- **Row 166**, `references/literature_corpus_consumers.md`:
  - Search starts from the user's `.bib`, screened under the same criteria, each skipped entry given a reason, library never modified, external search filling the gaps: `references/search.md` "Starting from the library" (34 to 46); `SKILL.md` "What it reads" 4 (line 44) and Anti-patterns (line 236).
  - Not built here: the passport block format.
- **Row 184**, `SKILL.md`:
  - Phases from topic to a written report with devil's-advocate checkpoints, every claim cited, unconfirmed references kept out: `SKILL.md` Steps 8 to 23 (lines 86 to 132), "The agents" (line 164).
  - Lit-review and three-way scan modes: `SKILL.md` Quick start (lines 16 to 17) and the mode subsections (141 to 162); `references/synthesis.md` "The sections of each mode" (107 to 149).
  - Optional style profile for summary and synthesis: `SKILL.md` "What it reads" 5 (line 47); `references/synthesis.md` "The style profile" (101 to 105); `references/writer.md` rule at line 11.
  - Not built here: the writing check (`writing`); the quick brief and monitoring (entry 15.A); guided mode (`idea`), review mode (`paper-review`), fact-checking, the ethics stop and the AI disclosure (`paper`); systematic review; the method blueprint and the handoff to writing (`researcher`); routing notes, invocation contract, pipeline pointer, version lines, spectrum labels and the integration list (dropped).
- **Row 185**, `agents/bibliography_agent.md`:
  - Criteria first, title then full-text screening, the 70 percent concentration flag, the bibliography minimums: `references/search.md` ("The method, written before the first search" 24 to 32, "Screening" 76 to 91, "Minimums" 93 to 100, Coverage advisory line 124); the 30 percent cap counts the kept sources older than 5 years unless seminal (line 97), as `bibliography_agent.md` says.
  - Fuller record kept of two results sharing an index ID: `templates/lookup.py` `merge_records` (line 422) and "Rules for the whole search" (`references/search.md` line 20).
  - Result text treated as data: `references/search.md` line 15; a source verified only once its original was read: `references/reading.md` line 77 and `references/verification.md` line 15; field of a failed lookup omitted: `templates/lookup.py` head comment (failure bullet, line 35) and `references/verification.md` line 16.
  - Starts from the project's `.bib`: `references/search.md` 34 to 46.
  - Not built here: the passport corpus and trust-chain fields, the APA formats and check, the phase boundary and `phase{M}_*/` folder rule.
- **Row 186**, `agents/devils_advocate_agent.md`:
  - Cherry-picking, explained-away contradictions, dependence on the inclusion criteria: `references/devils-advocate.md` "The checks on the synthesis" (20 to 29).
  - Stress test removing the strongest source: "The stress tests" (42 to 49).
  - Checks of the finished report: "The checks on the finished output" (31 to 40).
  - Concession protocol: "The second pass: replies to issues" (123 to 139).
  - Optional second-model critique with the user's consent: `references/devils-advocate.md` "Second-model critique" (115 to 121) and `SKILL.md` Steps 5 and 13.
  - Not built here: the scoping check (`idea`), the AI-disclosure question (`paper`), the origin note (dropped).
- **Row 187**, `agents/editor_in_chief_agent.md`:
  - Five weighted dimensions scored 1 to 5, at least three strengths, every weakness, a fix for each critical or major issue: `references/editor.md` "What it does" and "Dimensions" (12 to 31).
  - No Accept while a critical issue stands: `references/editor.md` line 43.
  - Two revisions driven by the editor and the devil's advocate: `SKILL.md` Steps 14 to 17 (lines 104 to 115); `references/writer.md` "The revision" (15 to 28).
  - Editor confined to reviewing: `references/editor.md` line 3.
  - Not built here: the APA item, the review-phase folder layout and its checker; paper review (`paper-review`).
- **Row 191**, `agents/report_compiler_agent.md`:
  - Every claim traced to the bibliography, a topic the sources miss as a marked gap, a source dated before what it evidences, a locator on each citation: `references/synthesis.md` "Where every claim comes from" (13 to 20) and "Citations and passage lines" (22 to 40).
  - Two-revision log driven by the editor and the devil's advocate: `references/writer.md` "The revision" item 5 (line 23).
  - Style profile applied only when available: `SKILL.md` "What it reads" 5; `references/synthesis.md` 101 to 105.
  - Not built here: ethics feedback, the AI disclosure and the abstract-only protections (`paper`); the quick structure (entry 15.A); the writing check (`writing`); the APA layout, HTML-comment layers, claim manifest and experiment ids (dropped).
- **Row 196**, `agents/source_verification_agent.md`:
  - References resolved, a DOI pointing at another title flagged, an unconfirmed reference listed, a fabricated one removed: `references/verification.md` "Resolving each kept source" (28 to 64) and "The files" (135 to 153); `templates/lookup.py` `DOI_MISMATCH` (line 490).
  - Predatory-venue screen: `references/verification.md` (111 to 121). Doubt about ML sources older than two or three years: line 98. Seven evidence levels graded by fitness: lines 66 to 109.
  - The verifier writes only its report: `references/verification.md` line 3.
  - Not built here: the phase-two folder rule and its checker.
- **Row 197**, `agents/synthesis_agent.md`:
  - Source-by-theme matrix, contradictions explained by method, context or time or flagged unresolved, possibly conflicting pairs never claimed complete, a locator on each citation: `references/synthesis.md` (42 to 91, 22 to 40).
  - Delivers only the synthesis: `references/synthesis.md` line 3.
  - Not built here: citation marker layers, the claim manifest, the phase-three folders and their checker.
- **Row 208**, `references/argumentation_reasoning_framework.md`:
  - Warrant, causal criteria with temporality required, rival explanations (the two strongest discussed), claim language matched to the evidence: synthesis part `references/synthesis.md` "Integration, not summary" (42 to 49) and "Citations and passage lines" claim-language table (22 to 40); devil's advocate part `references/devils-advocate.md` "Argument checks" (51 to 57); verifier part `references/verification.md` "Claims and their status" (123 to 133).
  - Not built here: the mentor's Toulmin decomposition (`idea`), the architect's part (`researcher`); `paper-review` and `paper` are not users.
- **Row 209**, `references/arxiv_api_protocol.md`:
  - Match at 0.70, title-search fallback, pacing about three seconds, citations without an arXiv ID skipped: `templates/lookup.py` `MATCH_THRESHOLD` (line 81), `ARXIV_SPACING` (line 82) with `arxiv_turn` (line 736), `lookup_arxiv` (line 877, "the input has no arXiv ID"); the title search every source with an identifier also gets: `references/verification.md` "Resolving each kept source" items 1 and 2 (lines 32 and 33).
- **Row 211**, `references/cross_agent_quality_definitions.md`:
  - Peer review, source age by field (three years for CS and AI), source classes, verification coverage and CRITICAL severity: `references/verification.md` "Definitions" (20 to 26); sampling by the classes in the coverage definition (line 26).
  - Not built here: the per-mode source counts (the minimums of `bibliography_agent.md` are used, `references/search.md` 93 to 100) and the handoff-schemas pointer.
- **Row 212**, `references/crossref_api_protocol.md`:
  - Match at 0.70, title-search fallback, year from `issued`, backoff on rate limits, field omitted when unreachable: `templates/lookup.py` `parse_crossref_item` year from `issued` (line 265), `MATCH_THRESHOLD` (line 81), head comment line 34 (429 retries) and the "left out" lines; the title search every source with an identifier also gets: `references/verification.md` "Resolving each kept source" item 2 (line 33).
- **Row 213**, `references/openalex_api_protocol.md`:
  - DOI match only when the title agrees at 0.70, tie-break by year, the four indexes: `templates/lookup.py` `choose_candidate` (line 441) and `run_resolve` (line 1055); the title search every source with an identifier also gets: `references/verification.md` item 2 (line 33).
- **Row 214**, `references/semantic_scholar_api_protocol.md`:
  - 0.70 title match and a flagged DOI pointing at another title: `templates/lookup.py` (line 490); the title search that settles such a DOI and the mismatch rules: `references/verification.md` "Resolving each kept source" (lines 39 to 41); duplicates detected by paper ID: `record_keys` (line 401) and `merge_records` (line 422); a miss followed by DOI resolution and web search before "not found": `references/verification.md` Resolving item 3 (line 34) and line 43.
- **Row 217**, `references/failure_paths.md`:
  - Too few sources, weak sources, a conclusion beyond its evidence, a critical devil's-advocate issue, the revision limit, a failed cross-field synthesis: `references/failure-paths.md` (lines 5 to 46), each with what the run does; the second trigger of "Too few sources" is `SKILL.md` Steps 10 (line 90) and, for no kept source, what the run leaves (line 12).
  - Not built here: the question and dialogue paths (`idea`), method-mismatch and resume paths (`researcher`), the ethics stop (`paper`), the Chinese-literature path (dropped).
- **Row 218**, `references/interdisciplinary_bridges.md`:
  - Shared concepts under different names, migrating methods, reframed problems and pitfalls: `references/synthesis.md` "Drawing on other fields" (93 to 99); for search, adjacent-field vocabulary, review papers in bridging fields and reverse citation tracking: `references/search.md` layer 5 (lines 56 to 60).
  - Not built here: forward-citation tracking of `literature_strategist_agent.md` (covered by row 59's `cited-by`), the method step's use (`researcher`), the discipline maps, examples, journal list and conference advice (dropped).
- **Row 221**, `references/logical_fallacies.md`:
  - The 32 fallacies with detection questions: `references/devils-advocate.md` "Fallacies and their detection questions" (65 to 102); ML results such as a best seed reported alone: "Biases" (59 to 63).
- **Row 223**, `references/mode_selection_guide.md`:
  - Routing between search, three-way scan and synthesis, pointing to `idea`, `paper-review` and `paper`: `SKILL.md` Quick start (12 to 21) and Use instead (23 to 30).
  - Not built here: the quick-mode routing (entry 15.A), systematic-review routing (dropped), the mappings to academic-paper modes and the full pipeline (`researcher`).
- **Row 227**, `references/source_quality_hierarchy.md`:
  - Seven-level scale, fitness by the field's gold standard, median with an integrity floor for undisclosed conflicts: `references/verification.md` "Grading each confirmed source" (66 to 109); predatory-journal screen (111 to 121); ML gold standard from the `cs_ml` profile (line 90).
- **Row 231**, `templates/literature_matrix_template.md`:
  - Source-by-theme matrix marked supports or contradicts, convergence summary strong to contested, gap table by type: `references/synthesis.md` "The matrix, convergence and gaps" (51 to 67).

## The terms

Terms of `docs/glossary.md` that the diff changes or uses in a new place, each read against its entry.

- **effort agent** (entry changed in `plan-terms.md` line 39 and `docs/glossary.md` line 44): "the agents of `literature`" added to the list launched as `ordo-<reviewer_effort>`, and "`literature`, Steps 4 and 7" added to "Stated in". Check, `grep -n 'effort agent' skills/literature/SKILL.md`:

```
68:4. Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `printenv CLA
78:7. Start an agent, in the background, as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names. Eve
219:| The configured effort cannot apply | The runner lists no `ordo-<level>` agent for the level `reviewer_effort` name
```

- **reviewer** (entry changed in `plan-terms.md` line 99 and `docs/glossary.md` line 104): "the agents of `literature`" added to those that run on `reviewer:`, and "`literature`, Steps 7" added to "Stated in". Check, `sed -n '/^7\. Start/,/^8\. Start/p' skills/literature/SKILL.md | grep -n reviewer`:

```
1:7. Start an agent, in the background, as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names. Every step that starts a
```

- **stop** and **refusal**: used in the entries' senses. A stop is a halt for a decision (`SKILL.md` Stops table rows 1 to 4, which the entry's "Also any point in a skill's Stops table where it waits on the user" covers, and which leave no open item); a refusal names its cause and leaves nothing (rows 5 to 12). "To stop an agent" in Rules is the entry's "end a running agent through the runner's stop tool". The entries' "Stated in" lists are not changed.
- **finding**: used only for what `/writing` reports (`SKILL.md` Quick start line 20, Steps 18 and 19, Stops row "Prose findings"; `references/writer.md` "The prose pass"), the entry's `/writing` sense. What the editor and the devil's advocate report are "issues"; what a study found is a "result" in every reference file.
- **runner**, **standards**, **plan configuration** (the refusal's quoted name, as `/writing` has it), **open item** (Stops introduction: the stops leave none): used in the entries' senses.
- **builder**: appears only inside the quoted section title "Launching a builder" of `plan-orchestration`.
- Words that are glossary terms and appear in another sense are kept out: "base" appears only in "Base-rate neglect" (a fallacy name), "authority" only in "Appeal to authority" (a fallacy name), "case" only in "case-control", and "premise" does not appear. "Step" and "Steps N" in `SKILL.md` name the skill's own numbered steps, as every skill's text does; `references/verification.md` says "one grade" where a grade is raised.
- No term is added. The skill says "issues" (never "findings") for what the editor and the devil's advocate report, "two revisions" (never "loops"), and "the folder named after the topic" (never "slug"); `grep -rn -w 'loop\|loops\|slug\|tier\|tiers' skills/literature` prints nothing (checked below under repair round 1, point 15).

## Files with line counts

New files (`wc -l`):

```
     256 skills/literature/SKILL.md
     152 skills/literature/references/devils-advocate.md
      70 skills/literature/references/editor.md
      46 skills/literature/references/failure-paths.md
      79 skills/literature/references/reading.md
     127 skills/literature/references/search.md
     155 skills/literature/references/synthesis.md
     153 skills/literature/references/verification.md
      73 skills/literature/references/writer.md
    1323 skills/literature/templates/lookup.py
     296 skills/literature/templates/lookup.test.sh
    2730 total
```

Changed files (`git diff --numstat`, added, removed):

```
1  1  .agents/plan.yaml
3  2  README.md
2  2  agents/ordo-high.md
2  2  agents/ordo-low.md
2  2  agents/ordo-max.md
2  2  agents/ordo-medium.md
2  2  agents/ordo-xhigh.md
22  22  docs/academic-coverage.md
1  1  docs/adr/0002-the-prose-standard-holds-over-the-academic-sources.md
1  1  docs/adr/0016-a-cited-claim-rests-on-a-verbatim-passage-read-from-the-source-in-the-same-run.md
1  0  docs/dev/building.md
1  0  docs/dev/change-standard.md
2  0  docs/dev/scripts.md
2  2  docs/glossary.md
2  2  skills/plan/templates/orchestrator-state.md
2  2  skills/plan/templates/plan.yaml
1  1  skills/repo-setup/templates/docs/dev/prose-standard.md
1  1  skills/repo-setup/templates/docs/glossary.md
2  2  skills/repo-setup/templates/plan-terms.md
```

`.scratch/9-literature/agents/reviews/1-report.md` is this report.

## Judgment calls

1. The evidence profile is `cs_ml` for a topic in machine learning, statistics or computing, and neutral for any other topic (`references/search.md` line 22).
2. The three-way scan keeps a shortlist of 5 to 10 sources; the full report and the lit-review keep at least 10 (`references/search.md` "Minimums").
3. A reading agent extracts at most 10 passages per source (`references/reading.md` line 44).
4. The "at most 30 percent older" minimum counts the kept sources older than 5 years unless they are seminal works, as `bibliography_agent.md` says (`references/search.md` "Minimums" line 97); the currency age of the field (3 years for computer science and AI) stays in `references/verification.md` "Definitions" for what it governs there.
5. A critical issue still standing after the second revision goes to "Acknowledged limitations" and the run goes on; it does not stop (`references/failure-paths.md` "A critical issue of the devil's advocate").
6. A failing check of a citation goes to the list that D16 names for its cause: a source with no text under "Sources not accessed", a source whose identifier no lookup confirmed under "References not confirmed"; a passage not found or a malformed passage line takes out that citation only, and a status other than 2xx for a source that was read keeps it cited (`references/writer.md` "The removals" items 1 to 7).
7. The second-model command runs once, before the first review, as `sh -c "$LITERATURE_SECOND_MODEL" < report > <work>/second-model.md`; the question to the user and the method section name it by its program name, the first word of the value, and the value is never printed (`SKILL.md` Steps 5 and 13).
8. With no kept source the run skips the reading agents and the review and revisions, and leaves a method-only `report.md`, an empty `references.bib` and `sources.md` (`references/failure-paths.md` "Too few sources"; `SKILL.md` Steps 11). With fewer than 3 kept sources the search is expanded once and the new candidates are verified (`SKILL.md` Steps 10).
9. The editor and the devil's advocate run in turn, not side by side, so that the one-agent-at-a-time rule that protects arXiv holds for every agent; the pacing of arXiv requests also holds across every `lookup.py` process on the machine (`arxiv_turn`).
10. The `/writing` pass ends the turn, so the run waits once for `apply <numbers>`, `apply all` or `apply none` (the stop "Prose findings"); any reply that names no number applies none. This stop does not end the run, so `<work>` stays for Steps 19 to 23.
11. A writer task "The checks" puts the last outputs of `check-urls` and `quote-check` into a last section "Checks of citations", after every other section, so each line number they print is the line of the final `report.md` and the session writes no part of the output (`references/writer.md` "The checks"; `SKILL.md` Steps 23).
12. `SKILL.md` accepts the `projects:` form of `.agents/plan.yaml` as `/writing` and `/code-comments` do: the first argument of the call is the project, before the mode and the topic, and Steps 18 passes it to `/writing` (`SKILL.md` "What it reads" 1 and 2).
13. The search agent also writes the texts it fetches to screen, under `<work>/screening/`, and each reading agent also writes the files `lookup.py fetch` writes for its key under `<work>`; both are named in "The agents" (`SKILL.md` lines 164 to 187), and Steps 6 makes `<work>/screening`.
14. The reasons in `docs/academic-coverage.md` keep every original word and gain a closing sentence naming the files, since row 76's inline form ("held in `...`") cannot take several files for one row without rewording the reason.
15. `lookup.test.sh` runs its Python with `-B` so that the test leaves no `__pycache__` folder in the skill's folder.

## Host- or user-visible changes

- New skill `literature`. Before: none. After: `/literature <topic>`, `/literature review <topic>` and `/literature scan <topic>` exist, and `/literature <project> ...` in the `projects:` form; the install loop in `README.md` copies the skill folder with the other skills.
- `README.md`. Before: skills table had no `literature` row; line 78 listed `grill`, `writing` and `code-comments`; the install loop had no `literature`. After: a `literature` row follows the `code-comments` row; line 78 and the install loop name `literature`.
- `agents/ordo-low.md` to `agents/ordo-max.md`, lines 3 and 6. Before: the description and first sentence named the agents of the plan skills, `grill`, `writing` and `code-comments`. After: both also name `literature`'s agents; the runner's agent listing shows the longer description.
- Comments of `.agents/plan.yaml` (line 10), `skills/plan/templates/plan.yaml` (12, 27) and `skills/plan/templates/orchestrator-state.md` (14, 26). Before: listed the agents of `/writing` and `/code-comments` as running on `reviewer` and at `reviewer_effort`. After: also list the agents of `/literature`; only comment text changed.
- `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md`. Before: **effort agent** and **reviewer** did not name `literature`. After: both name it with `literature` Steps in "Stated in"; the template glossary's line 3 names `literature` among the skills whose terms stand in the block.
- `docs/adr/0016-...md` line 11. Before: "fetched with `curl`". After: "fetched by `lookup.py fetch`".
- `docs/adr/0002-...md` Consequences and the prose standard template's "How it is applied". Before: no sentence on passage lines. After: one sentence each: a passage line of a `literature` report is quoted source text, kept as the source has it, and a `/writing` finding inside it is not applied. A repository that copied the prose standard receives the sentence at its next `/repo-setup sync`.
- `docs/dev/building.md`, `docs/dev/change-standard.md`, `docs/dev/scripts.md`. Before: no `lookup` test or script. After: the test command with its comment in building.md, the filtered command in change-standard.md, and the script and test rows in scripts.md; the plan's verify list is rewritten at the landing.
- `docs/academic-coverage.md`, the 22 `rebuild: literature` rows. Before: reasons named no file of `skills/literature/`. After: each reason ends with a sentence naming the files that hold its content; `check_coverage.py` still exits 0.

## Anything in the brief that was wrong or impossible

- C12's second clause cannot be run live as written: about 1,300 arXiv results across six searches held no title with a newline, so no ID with such a title was found to run live. The behaviour (whitespace in a title made one space) is proven by the recorded Atom body in `lookup.test.sh` and shown on a live `@misc` entry in C12 above.
- T5's last assertion and C14's pacing and changed-word conditions, the script and style text of HTML and the `@` BibTeX body were ruled on before the build (the four rulings above); the finished test and script follow those rulings.
- Item 4 says each agent writes one named file. The search agent writes `<work>/search.md` and the screening texts, and each reading agent also holds the files `fetch` writes for its key; each stays inside its own paths and no agent writes another agent's file.
- The brief's list of places that name the agents (line 39) was complete. After the edits, this command prints only lines that stay as they are (the **finding** entry of `plan-terms.md`, as the brief says, its copy in `docs/glossary.md`, `docs/academic-coverage.md`, `docs/roadmap.md`, and the `strip_comments` script, test and command lines):

```
grep -rn 'code-comments' skills utils docs README.md agents .agents/plan.yaml | grep -v '^skills/code-comments/' | grep -v 'docs/adr/0014' | grep -v -i literature | cut -c1-90
skills/repo-setup/templates/plan-terms.md:41:- **finding**: a defect a reviewer reports, w
docs/glossary.md:46:- **finding**: a defect a reviewer reports, with its place, the quoted
docs/academic-coverage.md:35:| code-comments | 4 |
docs/roadmap.md:196:- [x] 4. code-comments: at the closing on main (c4d6916), `/code-comme
docs/dev/scripts.md:17:| `skills/code-comments/templates/strip_comments.py` | Prints the c
docs/dev/scripts.md:32:| `skills/code-comments/templates/strip_comments.test.sh` | `skills
docs/dev/change-standard.md:70:sh skills/code-comments/templates/strip_comments.test.sh 2>
docs/dev/building.md:6:sh skills/code-comments/templates/strip_comments.test.sh   # strip_
README.md:27:| `code-comments` | Reviews the comments a git diff adds or changes, the unco
```

## Repair round 1

All 21 points of `.scratch/9-literature/agents/briefs/1-round-1.md` are done, with the three readings named in the first line of this report. Line numbers are those of the files as they stand at the end of the round. Each point gives the old text beside the new text, then the command that shows it. `lookup.py:214` (the `10.48550/arXiv.<id>` reading of `classify`) and line 17 of the head comment are as they were (open item E).

### Point 1, the `projects:` form

- Old: the call forms had no project, and a plan file in the `projects:` form was refused as "No plan configuration" (old judgment call 12). New: in the `projects:` form the first argument is always the project whose keys are read, before the mode and the topic. A name no project has is the refusal "Unknown project", which lists the projects. The top-level form is unchanged.
- Where: Quick start line 18; "What it reads" 1 (line 36) and 2 (line 37); Steps 1 (line 57) and 18 (line 115, `/writing <project> '<out>/report.md'`); Stops row "Unknown project" (line 212).

```
18:/literature <project> ...                                    the same when .agents/plan.yaml has the projects: form; <project> names the project whose keys are read
36:   - In the `projects:` form the first argument of the call is always the project whose keys are read, before the mode and the topic. A name no project has is the refu
37:2. `.agents/plan.yaml` of the repository the session is in: `reviewer`, `reviewer_effort` (`high` when absent) and `standards` (`[]` when absent), the keys of the proj
58:   - Done when the project in the `projects:` form, the mode, the topic, `--bib`, `--out`, the style profile, `reviewer`, `reviewer_effort` and `standards` are known, 
115:18. Invoke `/writing '<out>/report.md'` through the Skill tool, or `/writing <project> '<out>/report.md'` in the `projects:` form, and show its report whole as the me
212:| Unknown project | In the `projects:` form, the first argument names no project | The projects the file lists | `/literature` again with a listed project |
```

The real case, read only, `grep -n 'projects:\|oculus' /Users/axelfaes/workspace/research-hub/.agents/plan.yaml`:

```
3:projects:
4:  oculus:
5:    roadmap: tools/oculus/.scratch/ROADMAP.md      # the roadmap beside the ledger: where each item lands in oculus; o
6:    verification: tools/oculus/.scratch/migration/orchestrator-state.md   # the verify block of the running migration 
7:    rules: tools/oculus/.scratch/migration/agents/spec.md   # the standing spec is the change standard until it is mov
```

The same wording as `skills/writing/SKILL.md` and `skills/code-comments/SKILL.md` in their "What it reads" 1, `grep -n 'projects:' skills/writing/SKILL.md skills/code-comments/SKILL.md | cut -c1-200`:

```
skills/writing/SKILL.md:16:/writing <project> <file>   the same when .agents/plan.yaml has the projects: form; <project> names the project whose keys are read
skills/writing/SKILL.md:31:   - In the `projects:` form the first argument of the call names the project whose keys are read. A name no project has is a refusal that lists the projects.
skills/writing/SKILL.md:276:| Unknown project | In the `projects:` form, the first argument names no project | The projects the file lists | `/writing` again with a listed project |
skills/code-comments/SKILL.md:17:/code-comments <project> ...      the same when .agents/plan.yaml has the projects: form; <project> names the project whose keys are read
skills/code-comments/SKILL.md:33:   - In the `projects:` form the first argument of the call is always the project whose keys are read. A name no project has is the refusal "Unknown project", which lists the projects.
skills/code-comments/SKILL.md:43:   - Outside the `projects:` form, an argument that holds no `..` is the refusal "Not a range", which names it. The skill never reviews it as another diff.
```

### Point 2, too few sources after verification

- Old: `references/failure-paths.md` "Too few sources" named the second trigger and no step carried it. New: Steps 10 (line 90) expands the search once when `<work>/verified.md` keeps fewer than 3 sources: the search agent is started again with the word "expansion", then the verification agent verifies the sources the expansion added; the run goes on with what is kept after that. `references/search.md` "The expansion" (102 to 112) and `references/verification.md` "What it is given" (line 10) hold the agents' part; `references/failure-paths.md` (lines 5 to 12) names both triggers and points at Steps 10.
- Numbering: the new step is 10, so the old steps 10 to 24 are 11 to 25. Every number that names a step is carried, `grep -n 'Steps [0-9]' skills/literature/SKILL.md skills/literature/references/*.md`:

```
skills/literature/SKILL.md:68:4. Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1, as the `refute` skill
skills/literature/SKILL.md:76:   - It is the first write of the run, made after the last refusal and the question of Steps 5.
skills/literature/SKILL.md:81:   - A served model that is not the configured one, as the `refute` skill's Steps 1 defines it, is the stop "A model other than the configured one".
skills/literature/SKILL.md:91:    - Start the search agent again with `references/search.md`, the word "expansion", `<work>/search.md`, `<work>/verified.md` and the values of Steps 8.
skills/literature/SKILL.md:92:    - Start the verification agent again with `references/verification.md`, `<work>/search.md`, `<work>/verified.md` and the values of Steps 9, to verify the sources the 
skills/literature/SKILL.md:97:    - With no kept source, skip this step and Steps 13 to 19. The run goes on with Steps 12 and 20 to 25, and `references/failure-paths.md` names what it leaves.
skills/literature/SKILL.md:101:13. When the user said yes at Steps 5, run `sh -c "$LITERATURE_SECOND_MODEL" < '<out>/report.md' > '<work>/second-model.md'`.
skills/literature/SKILL.md:107:    - Give it `<out>`, `<work>`, the two files of Steps 14, the prose standard and the style profile or none.
skills/literature/SKILL.md:110:16. Review the revision the second time: start the editor agent and then the devil's advocate agent as Steps 14 starts them, with the number 2.
skills/literature/SKILL.md:112:17. Start the second revision writer as Steps 15 starts the first, with the number 2 and the two files of Steps 16.
skills/literature/SKILL.md:127:    - Then run the two commands of Steps 21 once more.
skills/literature/SKILL.md:208:| A model other than the configured one | The runner served an agent a model that is not the configured one (Steps 7); the run ends as Rules says | The configured model,
skills/literature/SKILL.md:209:| An agent wrote no file | An agent ended twice without writing a file its task names (Steps 7); the run ends as Rules says | The agent, the file and the last message of
skills/literature/SKILL.md:210:| Second critique | `LITERATURE_SECOND_MODEL` is set (Steps 5) | The program name of the command and the material it receives | The user's yes or no |
skills/literature/SKILL.md:211:| Prose findings | The second revision is done (Steps 18) | The report of `/writing`, whole | `apply <numbers>`, `apply all` or `apply none` |
skills/literature/SKILL.md:219:| The configured effort cannot apply | The runner lists no `ordo-<level>` agent for the level `reviewer_effort` names, or `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs e
skills/literature/SKILL.md:251:- The run does not stop to ask before it searches, apart from the question of Steps 5.
skills/literature/references/failure-paths.md:10:- **Fewer than 3 sources after verification.** The session starts the search agent once more for the expansion (`SKILL.md` Steps 10). Then it starts th
```

Each hit read against the step it names: Steps 4 is the effort check, 5 the second-model question, 7 the start of an agent, 10 the expansion, 11 the reading agents ("skip this step and Steps 13 to 19" is the second-model run, the reviews, the revisions, `/writing` and the prose pass; "goes on with Steps 12 and 20 to 25" is the synthesis, the bibliography, the checks and the end), 13 the second-model run, 14 and 16 the reviews, 15 and 17 the revisions, 18 the `/writing` stop, 21 the two checks, 22 the removals and 23 the checks writer. The coverage records above and the judgment calls use the new numbers; `plan-terms.md` and `docs/glossary.md` name Steps 4 and 7, which keep their numbers:

```
literature`, Steps 4 and 7
literature`, Steps 7
```

### Point 3, a DOI that resolves to another paper

- Old: `references/verification.md` "Resolving each kept source" ran the identifier first and the title search only when the source had no identifier or the identifier was not found, so a DOI that resolves to another paper confirmed the source. New: a source with a DOI or an arXiv ID is resolved by the identifier and also by `lookup.py resolve '<title>' --year <year>` (items 1 and 2, lines 32 to 33). The source is confirmed when the title search matches a record that carries its DOI or arXiv ID (line 39). When the title search matches a record with another identifier, the mismatch is written in the row, the record of the title search confirms the source and its identifier is the source's from then on (line 40). When the title search matches nothing, the source is confirmed only if the records its identifier gives carry its title (line 41). `lookup.py` is not changed for this point.
- Coverage rows 209, 212, 213 and 214 name this text, `grep -c 'title search that every source with an identifier also gets' docs/academic-coverage.md` prints `3` (rows 209, 212 and 213); row 214 names the title search that settles a DOI pointing at another title and the web search. The sentences, `grep -o`:

```
209:and the title search that every source with an identifier also gets, in `skills/literature/references/verification.md` "Resolving each kept source".
212:and the title search that every source with an identifier also gets, in `skills/literature/references/verification.md` "Resolving each kept source".
213:and the title search that every source with an identifier also gets, in `skills/literature/references/verification.md` "Resolving each kept source".
214:and the title search that settles a DOI pointing at another title, and the DOI resolution and web search before a source is called not found, in `skills/literature/references/verification.md` "Resolving each kept source".
214:and the title search that settles a DOI pointing at another title, and the DOI resolution and web search before a source is called not found, in `skills/literature/references/verification.md` "Resolving each kept source".
```

- A live title search shows what item 2 reads, `python3 -B skills/literature/templates/lookup.py resolve 'Attention is all you need' --year 2017` (the Crossref line is another paper at ratio 0.88, the OpenAlex and arXiv lines are the paper at ratio 1.00 and 1.00, and the records carry their identifiers in the line):

```
Crossref: ratio 0.88: Is Attention All You Need? | Patrick Mineault | 2025 | From Human Attention to Computational Attention | doi 10.1007/978-3-031-84300-6_13
OpenAlex: ratio 1.00: Attention Is All You Need | Ashish Vaswani, Noam Shazeer, Niki Parmar et al. | 2025 | doi 10.65215/2q58a426 | OpenAlex W2626778328 | open access https://
Semantic Scholar: ratio 1.00: Attention is All you Need | Ashish Vaswani, Noam Shazeer, N. Parmar et al. | 2017 | Neural Information Processing Systems | arXiv 1706.03762 | Se
arXiv: ratio 1.00: Attention Is All You Need | Ashish Vaswani, Noam Shazeer, Niki Parmar et al. | 2017 | arXiv 1706.03762
```

### Point 4, arXiv Boolean strings

- Old: `search_arxiv` sent the string to arXiv as `all:<string>`, so `AND`, `OR`, `NOT` and parentheses were words. New: `arxiv_query` (line 904) writes each word as `all:<word>`, a quoted phrase as `all:"<phrase>"`, keeps `AND` and `OR`, writes `NOT` as `ANDNOT`, keeps parentheses and joins two terms with no operator by `AND`. A string with no operator, no quotation mark and no parenthesis keeps the form it had. An operator is read only in capitals; an operator after an operator replaces it; an operator with no term before or after it is dropped; parentheses that do not balance (their numbers differ or a closing one comes first) are all dropped; a pair of parentheses with no term inside is dropped.
- The reviewer's Boolean string, run live, `python3 -B skills/literature/templates/lookup.py search '"mutual information" AND (neural OR amortized) NOT kernel' --limit 3`, which now returns arXiv records, and the query it sends:

```
[Crossref] A mutual information kernel for sequences | M. Cuturi, J.-P. Vert | 2004 IEEE International Joint Conference 
[Crossref] Amortized Fourier Neural Operators | Zipeng Xiao, Siqi Kou, Zhongkai Hao et al. | 2024 | Advances in Neural I
[Crossref] Amortized Eigendecomposition for Neural Networks | Tianbo Li, Zekun Shi, Jiaxi Zhao et al. | 2024 | Advances 
[OpenAlex] Mutual Information Neural Estimation. | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeshwar et al. | 20
[OpenAlex] Using mutual information for selecting features in supervised neural net learning | Roberto Battiti | 1994 | 
[OpenAlex] Mutual information, neural networks and the renormalization group | Maciej Koch-Janusz, Zohar Ringel | 2018 |
[arXiv] Explicit mutual information for simple networks and neurons with lognormal activities | Maurycy Chwi<latin small letter l with stroke>ka, Jan Kar
[arXiv] Mutual Information of Three-State Low Activity Diluted Neural Networks with Self-Control | D. Bolle', D. R. C. D
[arXiv] Conditional Mutual Information Neural Estimator | Sina Molavipour, Germ<latin small letter a with acute>n Bassi, Mikael Skoglund | 2019 | doi 10
Semantic Scholar: left out, HTTP 429 after 3 retries
exit 0
```

```
search_query=all%3A%22mutual+information%22+AND+%28all%3Aneural+OR+all%3Aamortized%29+ANDNOT+all%3Akernel <- "mutual information" AND (neural OR amortized) NOT kernel
   decoded: all:"mutual information" AND (all:neural OR all:amortized) ANDNOT all:kernel
```

- A sentence query, `python3 -B skills/literature/templates/lookup.py search 'How accurate are neural estimators of mutual information in high dimensions?' --limit 3`, and a plain string, `... search 'mutual information neural estimation' --limit 3`; arXiv has no search by a sentence, and its "not found" for the sentence is the last line but one of the first output (Semantic Scholar answered HTTP 429 on these runs):

```
[Crossref, OpenAlex] A Benchmark Suite for Evaluating Neural Mutual Information Estimators on Unstructured Datasets | Ky
[Crossref] Beyond Normal: On the Evaluation of Mutual Information Estimators | Pawel Czyz, Frederic Grabowski, Julia Vog
[Crossref] An Experimental Evaluation of Neural Estimators Applied to the Mutual Information between Random Vectors Mode
[OpenAlex] Improving Numerical Stability of Normalized Mutual Information Estimator on High Dimensions | Marko Tuononen,
[OpenAlex] Entropy and mutual information in models of deep neural networks* | Marylou Gabri<latin small letter e with acute>, Andre Manoel, Cl<latin small letter e with acute>ment Lun
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: not found
exit 0
```

```
[Crossref] Unsupervised Side-Channel Analysis Based on Mutual Information and its Neural Estimation | Valence Cristiani 
[Crossref] Neural Mutual Information Estimation with Vector Copulas | Yanzhi Chen, Zijing Ou, Adrian Weller et al. | 202
[Crossref] Estimation of Entropy and Mutual Information | Liam Paninski | 2003 | Neural Computation | doi 10.1162/089976
[OpenAlex] Mutual Information Neural Estimation. | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeshwar et al. | 20
[OpenAlex] MINE: Mutual Information Neural Estimation | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeswar et al. 
[OpenAlex] On Mutual Information Neural Estimation for Localization | Sven Hinderer, Manuel Buchfink, Bin Yang | 2025 | 
[arXiv] Estimating Mutual Information for Discrete-Continuous Mixtures | Weihao Gao, Sreeram Kannan, Sewoong Oh et al. |
[arXiv] On Information Plane Analyses of Neural Network Classifiers -- A Review | Bernhard C. Geiger | 2020 | doi 10.110
[arXiv] Estimating Quantum Mutual Information Through a Quantum Neural Network | Myeongjin Shin, Junseo Lee, Kabgyun Jeo
Semantic Scholar: left out, HTTP 429 after 3 retries
exit 0
```

- `references/search.md`: layer 1 (line 52) says Crossref ranks by relevance and reads no operator, and that arXiv reads `AND`, `OR` and `NOT` in capitals and the parentheses; layer 4 (line 55) says arXiv has no search by a sentence, so the hits come from OpenAlex and Semantic Scholar and "arXiv: not found" for it is expected. The head comment states the translation in the `search` bullet (line 22). Test assertions: lines 154 to 161.
- Extra to the 21 points, found by the live sentence query above: OpenAlex answers HTTP 400 for a query holding `?` or `*`, which it reads as wildcards. `openalex_query` (line 889) replaces each by a space before the string goes to OpenAlex; the head comment states it, and the test asserts it (line 164). The sentence run above has OpenAlex records for a query that ends in `?`.

### Point 5, arXiv pacing across processes

- Old: `Client` kept the time of the last arXiv request in the process (`last_arxiv`), so two `lookup.py` processes could ask arXiv together. New: `arxiv_turn` (line 736) makes each arXiv request while holding an exclusive `fcntl.flock` on `ordo-lookup-arxiv` in `tempfile.gettempdir()`; the file holds the time the last arXiv request ended, and a request starts no sooner than 3 seconds after it. A file that cannot be opened, locked or read, or that holds text other than a time, makes the request wait the full 3 seconds; an empty file, as a new one is, makes it wait not at all. `Client.once` (line 804) routes every request to `arxiv.org`, `www.arxiv.org` and `export.arxiv.org`, redirects and 429 retries included, through it. The head comment states it in the pacing bullet (line 33), the Reads list and the Writes paragraph.
- The offline test (lines 166 to 195) starts three child processes with `TMPDIR` set to a scratch folder, so `lookup.py` holds no test parameter: two share one folder and the second starts at least `ARXIV_SPACING` after the first ended; the first, with no earlier request, does not wait; the third finds the text `not a time` and waits the full spacing. Its run on the base tree is the `FAIL` line of the tests table below; on the finished tree the test passes (check 1).
- `time` over two live `lookup.py resolve 2511.18945` runs started together, `time ( a > p5a.out & b > p5b.out & wait )` with `TIMEFMT='real %*E s'`:

```
real 7.050 s
```

Both runs got every index's line, the arXiv line included (`cut -c1-90` of the two output files):

```
Crossref: not found
OpenAlex: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | Gritsa
Semantic Scholar: ratio 1.00: MIST: Mutual Information Estimation via Supervised Training 
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gr
Crossref: not found
OpenAlex: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | Gritsa
Semantic Scholar: ratio 1.00: MIST: Mutual Information Estimation via Supervised Training 
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gr
```

The arXiv requests themselves, two processes started together, each timed by `Client.get` on `https://export.arxiv.org/api/query?id_list=2511.18945`, times in seconds from the common start (the second asked at 0.33 s and was answered 3.11 s after the first was answered, which is at least 3 s):

```
process A: HTTP 200, asked at 0.33 s, answered at 0.44 s
process B: HTTP 200, asked at 0.33 s, answered at 3.55 s
```

### Point 6, a body that does not parse

- Old: `linked_openalex` called `json.loads` on its replies and `referenced_works` reads outside a parse function, so an HTML body raised an exception to `main`. New: every body the script parses goes through `get_parsed`, which turns a body that does not parse, or lacks a key the code reads, into `left out, HTTP 200, the body does not parse` for that index. The OpenAlex reads of `linked_openalex` are the parse functions `parse_openalex_work_links` (line 317), `parse_openalex_referenced` (line 323), `parse_openalex_citing` (line 327) and `parse_openalex_search` (batch), each called by `get_parsed` (line 831).
- `grep -n "json.loads(\|ET.fromstring(" skills/literature/templates/lookup.py`, each hit named:

```
280:    return parse_crossref_item(json.loads(text)["message"])
284:    return [parse_crossref_item(item) for item in json.loads(text)["message"]["items"]]
306:    return parse_openalex_work_object(json.loads(text))
310:    return [parse_openalex_work_object(work) for work in json.loads(text)["results"]]
319:    body = json.loads(text)
324:    return referenced_ids(json.loads(text))
329:    body = json.loads(text)
353:    return parse_s2_paper_object(json.loads(text))
357:    return [parse_s2_paper_object(paper) for paper in json.loads(text).get("data") or []]
364:        body = json.loads(text)
373:    for entry in ET.fromstring(text).findall(ATOM + "entry"):
```

Handling: line 280 is inside `parse_crossref_work`; line 284 is inside `parse_crossref_search`; line 306 is inside `parse_openalex_work`; line 310 is inside `parse_openalex_search`; line 319 is inside `parse_openalex_work_links`; line 324 is inside `parse_openalex_referenced`; line 329 is inside `parse_openalex_citing`; line 353 is inside `parse_s2_paper`; line 357 is inside `parse_s2_search`; line 364 is inside `parse`; line 373 is inside `parse_arxiv_feed`. Each of those functions is reached only through `get_parsed` (`grep -n 'get_parsed(' skills/literature/templates/lookup.py` below), which catches `ValueError`, `KeyError`, `TypeError`, `AttributeError`, `IndexError` and `ET.ParseError` (`PARSE_ERRORS`, line 113).

```
831:def get_parsed(client, url, parse):
864:    return outcome_of(lambda: get_parsed(client, f"https://api.crossref.org/works/{quote_doi(identifier.doi)}", parse_crossref_work))
869:    return outcome_of(lambda: get_parsed(client, url, parse_openalex_work))
874:    return outcome_of(lambda: get_parsed(client, url, parse_s2_paper))
881:    return outcome_of(lambda: get_parsed(client, url, parse_arxiv_feed))
886:    return outcome_of(lambda: get_parsed(client, f"https://api.crossref.org/works?{params}", parse_crossref_search))
896:    return outcome_of(lambda: get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_search))
901:    return outcome_of(lambda: get_parsed(client, f"https://api.semanticscholar.org/graph/v1/paper/search?{params}", parse_s2_search))
949:    return outcome_of(lambda: get_parsed(client, f"https://export.arxiv.org/api/query?{params}", parse_arxiv_feed))
964:    return get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_search)
973:        found = get_parsed(client, url, parse_openalex_work_links)
979:        found = get_parsed(client, f"https://api.openalex.org/works?{params}", parse_openalex_citing)
982:        referenced = get_parsed(client, f"https://api.openalex.org/works/{work_id}?select=id,referenced_works", parse_openalex_referenced)
996:    return get_parsed(client, url, parse_s2_links(key)) or []
```

The `[...]` reads of a parsed body outside a parse function: `grep -n '\["' skills/literature/templates/lookup.py` lists `item["..."]`-style reads only inside the parse functions (lines 260 to 371 plus `parse_s2_links`); the remaining index reads are `outcome.records[0]` after a test that the list is not empty (lines 480, 488 and 1111) and `found[0]` of a tuple `parse_*` returned (`outcome_of`).

```
272 274 280 284 293 297 300 310 320 330 344 347 387 783 787 821 1128 1130 1199 
```

The test (lines 198 to 228) gives `run_links` a stub client whose OpenAlex reply is the HTML body `<html><body>Maintenance</body></html>` for `cited-by` and `refs`: exit status 0, the line `OpenAlex: left out, HTTP 200, the body does not parse` is printed, the Semantic Scholar records stay, and no exception reaches `main`; two more cases give a body without a key the code reads and a referenced work that is no URL.

### Point 7, "not found"

- Old: `search`, `refs` and `cited-by` printed nothing for an index that answered with no record. New: `merged_lines(named)` (line 495) takes the `(index name, Outcome)` pairs of the indexes asked and prints `<index>: not found` for each that answered with no record, `<index>: left out, <reason>` for each left out, and `<index>: first 100, more exist` where it applies; `run_search` and `run_links` pass the pairs. The head comment states it in the `search` and the `refs` and `cited-by` bullets and in the failure bullet (line 35).
- Live, `python3 -B skills/literature/templates/lookup.py search 'mutual information neural estimation' --limit 3` printed no "not found" line above because every index answered or was left out; the sentence run in point 4 printed `arXiv: not found`. The test (lines 230 to 237) calls `merged_lines` on recorded outcomes: an index with no record prints its line, an index with records prints none, an index left out prints its reason, and only the indexes asked have a line (`refs` asks two).

### Point 8, the screening folder

- Old: the step that made `<work>` made `<work>/passages` only, and the search agent wrote its screening texts into a folder nothing made. New: Steps 6 (line 75) makes `<work>/passages` and `<work>/screening` with `<work>`, and its Done line names the three folders.

```
6. Make the run's temporary folder `<work>` with `mktemp -d "${TMPDIR:-/tmp}/literature.XXXXXX"`, and inside it the folders `<work>/passages` and `<work>/screening`.
   - It is the first write of the run, made after the last refusal and the question of Steps 5.
   - Done when `<work>`, `<work>/passages` and `<work>/screening` exist.
```

### Point 9, what a stop leaves

- Old: the stop procedure stood in Steps 7 and said nothing about `<work>` or `<out>` for the other stops. New: Rules (lines 241 and 242) state once what a stop that ends the run leaves: with `<work>` existing it stops every agent still running through the runner's stop tool, uses nothing they wrote and removes `<work>` with `rm -rf`; with `<out>` existing it leaves `<out>` as it is, for the user to read or remove. The Stops rows "A model other than the configured one" and "An agent wrote no file" point at Rules and say what resumes them (`/literature` again, with another `--out` when `<out>` exists); the Stops introduction names these two rows.
- Reading handed back with its reason: "Prose findings" is a stop raised after `<work>` exists, and it is not given the rule. It waits for the reply and the run goes on, and Steps 20 (bibliography: `<work>/candidates.bib`), 21 and 22 (`quote-check` reads `<work>`'s passage files) and 23 read `<work>` after the reply, so removing `<work>` at that stop would end the run it waits for. The stops after which no step follows are the two rows above; the second critique is asked before `<work>` is made (Steps 5 before 6).

```
51:   - Each is optional, and Rules says where their values never appear. The lookups read the first three themselves.
204:The first two rows end the run, and Rules says what such a stop leaves. "Prose findings" waits for a reply and ends nothing.
208:| A model other than the configured one | The runner served an agent a model that is not the configured one (Steps 7); the run ends as Rules says | The configured model, the served model and the C
209:| An agent wrote no file | An agent ended twice without writing a file its task names (Steps 7); the run ends as Rules says | The agent, the file and the last message of the agent | The user's dec
```

### Point 10, which list a failing source goes to

- Old: `references/writer.md` "The removals" sent every failure except "no text" to "References not confirmed" and removed the source whole. New: items 1 to 7 of "The removals" (51 to 63): a key with "no text" goes under "Sources not accessed" with every URL tried and what each returned; a key with "no identifier" or "no entry in references.bib" (an identifier no lookup confirmed) goes under "References not confirmed" with the lines the commands printed; a key under either section is cited in no paragraph and has no entry in `references.bib` (item 3); a passage that is not found, a malformed passage line or a cited key with no passage line takes out that citation and its passage line only (item 4), the claim becomes a marked gap unless another found passage of the same or another source supports it (item 5), and the source stays cited where its other passages are found and is listed in neither section (item 6); a `check-urls` status other than 2xx for a source whose text was read and whose passages are found keeps it cited, with the status written beside it in `sources.md` (item 7). Steps 22 gives the writer `<out>/sources.md` and `<work>/passages/` for this.

```
## The removals

The removal writer is given the output of `lookup.py check-urls` and of `lookup.py quote-check`, unchanged, with `<out>/report.md`, `<out>/references.bib`, `<out>/sources.md` and `<work>/passages/`. Each output line names a key an

1. A key with "no text" is a source with no text. List it under "Sources not accessed" with every URL tried and what each returned, as `sources.md` gives them.
2. A key with "no identifier" or "no entry in references.bib" is a source whose identifier no lookup confirmed. List it under "References not confirmed" with the lines the two commands printed for the key, unchanged.
3. For a key listed under either section, remove every citation of the key from the report with its passage line, and remove its entry from `references.bib`. The key is cited in no paragraph afterwards.
4. For a passage that is "not found", a malformed passage line, or a cited key with "no passage", remove that citation and its passage line only. Take the key out of a multi-key citation and leave the others.
5. A claim whose citation was removed becomes a marked gap that says the claim has no source that could be confirmed. When another found passage of the same or another source supports the claim, it keeps that citation and is no ga
6. A source whose other passages are found stays cited, and is listed in neither section. Remove from `references.bib` each entry whose key the report no longer cites.
7. A `check-urls` status other than 2xx for a source whose text was read and whose passages are found keeps the source cited. Write the status beside the source in `sources.md`.

The task is done when no key listed under a section is cited, no failing citation stays in the report, and each listed source appears once.
```

### Point 11, the line numbers of the checks

- Old: the checks writer put the two outputs into a subsection of the method section, before the cited paragraphs, so their line numbers were those of a report that later lines pushed down. New: the outputs stand in the last section "Checks of citations", after every other section, so each line number they print is the line of the final `report.md`. `references/writer.md` "The checks" (line 69) says it, `references/synthesis.md` (line 116) has the method section name that section, and `SKILL.md` Steps 23 (line 130) has the same Done line.

```
skills/literature/SKILL.md:131:    - Done when the last section of `<out>/report.md` is "Checks of citations" and holds both outputs as they were printed.
skills/literature/references/synthesis.md:116:- That the checks of the citations stand in the last section of the report, "Checks of citations", which a writer adds after the revisions.
skills/literature/references/writer.md:69:1. Add a section "Checks of citations" as the last section of `report.md`, after every other section. Both commands numbered the lines of `report.md` as it stood before
```

### Point 12, the style profile

- Old: the words `style profile` followed by anything named the style profile. New: "What it reads" 5 (lines 47 to 49) states once that the words name the style profile only when the path after them is an existing file, and otherwise stay part of the topic.

```
5. The style profile, a file the user names with the words `style profile` and its path in the call.
   - The words name the style profile only when the path after them is an existing file. Otherwise the words stay part of the topic.
   - Without a style profile, none is used.
```

### Point 13, single quotes in a supplied value

- Old: command lines put supplied values in single quotes with no rule for a quote inside the value. New: "Agent prompts" (line 185) states the rule once for every agent, and Rules (line 252) states it once for the session's own command lines. `references/search.md`, `references/verification.md` and `references/reading.md` each point at the prompt's bullet in one line.

```
skills/literature/SKILL.md:185:- Every value a user, a source or an index supplies, such as a title, a search string, an identifier, a key or a path, reaches a command as one single-quoted argument. A single quote inside it is wri
skills/literature/SKILL.md:252:- Each path the session puts in a command line of its own, such as `<out>` and `<work>`, is one single-quoted argument, a single quote inside it written `'\''`.
skills/literature/references/reading.md:12:Each command line puts a supplied value in single quotes as the prompt's bullet on supplied values says.
skills/literature/references/search.md:19:- Each command line puts a supplied value in single quotes as the prompt's bullet on supplied values says.
skills/literature/references/verification.md:18:- Each command line puts a supplied value in single quotes as the prompt's bullet on supplied values says.
```

### Point 14, the head comment of `lookup.py` read against the code

The head comment is lines 1 to 61. Each statement below was read against the code at the line given; a statement the code shows false was corrected, and these are the corrected ones (rule 14).

| Head comment (line) | Statement | Code that shows it holds (line) |
|---|---|---|
| Usage: (line 4) | the eight commands | `COMMANDS` (121), `HANDLERS` (1286) |
| Identifiers. (line 17) | a DOI in four written forms is stripped; `10.48550/arXiv.<id>` and an arXiv ID read as each other (open item E); old-style and new-style IDs; a DOI or title in a URL is percent-encoded | `DOI_PREFIX` (102), `classify` (210), `quote_doi` (224), `urlencode` calls |
| - resolve queries (line 21) | four indexes, one line each; a title: five candidates, match at 0.70, those of the year given preferred, then the highest ratio; an identifier: the first record found is the reference and a record below 0.70 against it is `DOI_MISMATCH`; arXiv is searched for a title as a phrase and queried by ID only when the input holds an arXiv ID; the line forms | `run_resolve` (1055), `choose_candidate` (441), `title_lines` (466), `identifier_lines` (479), `search_arxiv` phrase (946), `lookup_arxiv` (877) |
| - search prints (line 22) | limit 20 default and 100 at most; merge by DOI (lowercase), arXiv ID (no version) or Semantic Scholar ID; the fuller record wins; the query reaches Crossref and Semantic Scholar as given, OpenAlex without `?` and `*`, arXiv in its syntax; operators and parentheses rules; `not found` and `left out` lines | `run_search` (1072), `merge_records` (422), `record_keys` (401), `openalex_query` (889), `arxiv_query` (904), `merged_lines` (495) |
| - refs and cited-by (line 23) | Semantic Scholar and OpenAlex only, at most 100 each, `first 100, more exist`, merged as search; an OpenAlex ID or a Semantic Scholar ID is read by its own index only and the other is printed as left out; `not found` lines | `run_links` (1082), `linked_s2` (991), `linked_openalex` (967), `merged_lines` |
| - bibtex prints (line 24) | the doi.org body when its first non-blank character is `@`; for an arXiv ID or a DOI `10.48550/arXiv.<id>` an `@misc` entry keyed `arxiv_<id>`; whitespace made one space; unbalanced braces removed | `run_bibtex` (1102), `arxiv_bibtex` (684), `bibtex_value` (671) |
| - check-urls reads (line 25) | status after redirects of the doi, else the eprint, else the url; `no identifier`, `no entry in references.bib` and `failed, <reason>` | `run_check_urls` (1134), `entry_url` (1126) |
| - fetch writes (line 26) | stem from the key; the URL order; HTML only from `arxiv.org/html`; `%PDF-` for any other body; text by `pdftotext` or `html.parser` with script and style left out; an unreadable or empty PDF removed and the next URL tried; the abstract order; exit 1 without a full text | `run_fetch` (1254), `FetchRun.attempt` (1211), `is_pdf` (232), `is_arxiv_html_url` (236), `file_stem` (228), `html_to_text` (697) |
| - quote-check reads (line 27) | found or not found per passage line (`not found, no <file>` when the file is missing); normalisation; `malformed`; `no passage`, `no entry`, `no text` | `quote_check_lines` (565), `normalise_passage_text` (554), `passage_line` (525) |
| - Requests to arxiv.org (line 33) | one at a time, 3 seconds after the last end, across processes, by a flock on `ordo-lookup-arxiv`; an unreadable file waits 3 seconds | `arxiv_turn` (736), `Client.once` (804) |
| - An HTTP 429 (line 34) | 2 seconds, at most 3 retries, then `HTTP 429 after 3 retries`; check-urls prints the status 429; fetch prints the reason for the URL | `Client.get` (810), `status_reason` (827) |
| - An index that answers 404 (line 35) | 404 or a 200 with no result is `not found`; any other status, no connection, or a body that does not parse or lacks a field is left out with its reason | `get_parsed` (831), `outcome_of` (844) |
| - Only http and https (line 36) | every URL and every redirect | `Client.get` scheme test (814) |
| Reads: (line 38) | arguments; the three credentials and where each goes; the indexes; the report and `references.bib`; `pdftotext`; the lock file | `Client.prepare` (778), `read_report_and_bib` (1049), `arxiv_turn` |
| Writes: (line 47) | the four fetch files and the lock file, which is created with mode 600 when the file can be opened | `FetchRun.write` (1186), `arxiv_turn` (745) |
| Errors (line 49) | each error line of the list is raised at one of the sites | `raise UsageError` sites (`grep -c 'raise UsageError' skills/literature/templates/lookup.py` prints `12`: the path line has three sites, the other lines one each) and `main` (1302) |
| Exit status (line 60) | 0, 1 and 2 and what gives each | `main` (1302), `run_bibtex`, `run_check_urls`, `run_quote_check`, `run_fetch` |

The reviewer's four places: line 21 ("For a title, arXiv is searched for the title as a phrase") is true of `search_arxiv` with `phrase` True, set by `run_resolve` for a title; the failure bullet (line 35) and the `refs` and `cited-by` bullet (line 23) name the commands that print "not found" and the one that prints "first 100, more exist"; the sentence about an index left out for a body that does not parse (same bullet) holds after point 6, since `get_parsed` covers every parsed body. Line 17 is unchanged.

Rule 14 greps, for the names this round changed: `last_arxiv` (removed) in `skills`, `utils`, `docs` and `README.md`:

```
$ grep -rn 'last_arxiv' skills utils docs README.md
(exit status 1)
```

and the one function whose signature changed, `merged_lines`, across the same places:

```
skills/literature/templates/lookup.py:495:def merged_lines(named):
skills/literature/templates/lookup.py:1078:    out.extend(merged_lines(list(zip(INDEX_NAMES, searches(client, positional[0], int(limit), False)))))
skills/literature/templates/lookup.py:1098:    out.extend(merged_lines([("OpenAlex", openalex_outcome), ("Semantic Scholar", s2_outcome)]))
skills/literature/templates/lookup.test.sh:232:lines = lookup.merged_lines(asked)
skills/literature/templates/lookup.test.sh:236:lines = lookup.merged_lines([("OpenAlex", lookup.Outcome()), ("Semantic Scholar", lookup.Outcome([s2], more=True))])
```

### Point 15, each rule once

- "Library not found": stated in "What it reads" 4 (line 45) and in its Stops row (line 218); Steps 3 says "Check the library as 'What it reads' 4 says" (line 66). The key-value rule: stated in Rules (line 255) with the four variables named; "What it reads" 6 points at Rules (line 51).

```
45:   - A path that is no file is the refusal "Library not found", which names the path.
51:   - Each is optional, and Rules says where their values never appear. The lookups read the first three themselves.
218:| Library not found | `--bib` names a path that is no file | The path | `/literature` again with a file |
255:- The value of `S2_API_KEY`, `OPENALEX_API_KEY`, `CROSSREF_POLITE_EMAIL` or `LITERATURE_SECOND_MODEL` never appears in a prompt, a file or a message.
```

`grep -rn -w 'loop\|loops\|slug\|tier\|tiers' skills/literature`:

```
$ grep -rn -w 'loop\|loops\|slug\|tier\|tiers' skills/literature
(exit status 1)
```

### Point 16, Use instead

- Old: a row of Use instead pointed at `/literature` itself for growing a scan into a review. New: the row is gone (Use instead holds four rows, none of them `literature`), and "What it reads" 4 holds the call: `--bib <scan folder>/references.bib` (line 46).

```
## Use instead

| When | Use |
|---|---|
| The question is not yet formed and needs a dialogue | `idea` |
| A paper is to be reviewed | `paper-review` |
| The claims of a paper are to be fact-checked | `paper` |
| The prose of a draft is to be reviewed | `/writing <file>` |
```

### Point 17, "very"

- Old: "every index misses very recent work" in `references/verification.md` "Resolving each kept source". New: "every index misses recent work, non-English work and grey literature" (line 43). `grep -rn -w 'very' skills/literature`:

```
$ grep -rn -w 'very' skills/literature
(exit status 1)
```

### Point 18, one rule per bullet in Steps 7

- Old: one bullet held the stop for a served model that is not the configured one and the stop for an agent that wrote no file. New: Steps 7 (line 78) has one bullet for each of the two stops and one for the restart.

```
7. Start an agent, in the background, as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names. Every step that starts an agent follows this one.
   - The prompt gives the agent the absolute path of its file in `references/`, the values that file lists under "What it is given", and the bullets of "Agent prompts".
   - Read the agent's id and the model the runner served it from the runner's record of the agent, as the `plan-orchestration` skill's "Launching a builder" says.
   - A served model that is not the configured one, as the `refute` skill's Steps 1 defines it, is the stop "A model other than the configured one".
   - An agent that ends without writing a file its reference names is started once more.
   - A second failure is the stop "An agent wrote no file".
   - Start the next agent only after the runner reports that the previous one ended, so that one `lookup.py` process at a time reaches arXiv.
   - Done when the runner has started the agent, its served model is the configured one and the files it names exist, or the stop is raised.
```

### Point 19, the currency minimum

- Old: "No more than 30 percent of the kept sources are older than the currency age, unless they are seminal works" (the field's age, 3 years for computer science). New: "older than 5 years" (`references/search.md` line 97), as `deep-research/agents/bibliography_agent.md:434` says; the field's currency age stays in `references/verification.md` "Definitions" (line 23) for what it governs there. Row 185 of the coverage list holds (its record above names the line).

```
- No more than 30% sources older than 5 years (unless seminal)
97:- No more than 30 percent of the kept sources are older than 5 years, unless they are seminal works.
```

### Point 20, the tests table

The base tree (commit dc0b030) has no `lookup.py` (`git ls-tree dc0b030 skills/literature | wc -l` prints `0`), so every behaviour of the new script fails there on the same line, quoted once in full:

```
sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1
FAIL: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/base/skills/literature/templates/lookup.py does not exist
(exit status of the script: 1)
```

Each behaviour whose failure costs something, its case in `skills/literature/templates/lookup.test.sh`, and the failing line, which for every row is the line above:

| Behaviour (cost of a failure) | Case or assertion (line) | Failing line on the base tree |
|---|---|---|
| Title match at 0.70 and the year tiebreak (a wrong paper confirms a source) | T1 (73), T2 (82 to 88) | the `FAIL:` line above |
| `DOI_MISMATCH` flag (a DOI to another work is not seen) | T3 (101 to 106) | the `FAIL:` line above |
| Merge of records by DOI, arXiv ID and Semantic Scholar ID (one source counted twice, or two merged) | T4 (112 to 124) | the `FAIL:` line above |
| Passage found in the source text (an unsupported quotation passes) | T5 (128 to 132) | the `FAIL:` line above |
| Passage lines and cited keys of a report (a citation goes unchecked) | T6 (137 to 146) | the `FAIL:` line above |
| Abstract put back in word order | T7 (150, 151) | the `FAIL:` line above |
| arXiv query syntax (a Boolean search is read as words) | arXiv query assertions (154 to 161) | the `FAIL:` line above |
| OpenAlex wildcards (HTTP 400 and the index lost) | OpenAlex query (164) | the `FAIL:` line above |
| arXiv pacing across processes (arXiv blocks the machine) | three child processes (193 to 195) | the `FAIL:` line above |
| A body that does not parse (an exception stops the command and the other index's records are lost) | stub client (220 to 228) | the `FAIL:` line above |
| `not found` lines (a missing record reads as a failed lookup, or a lookup reads as done) | `merged_lines` (233 to 237) | the `FAIL:` line above |
| File name made from a key (a write outside the folder) | `file_stem` (244) | the `FAIL:` line above |
| DOI in a URL (the wrong paper is fetched) | `quote_doi` (245 and 246) | the `FAIL:` line above |
| `%PDF-` test and the `arxiv.org/html` host test (a login page kept as the paper's text) | `is_pdf`, `is_arxiv_html_url` (247 to 249) | the `FAIL:` line above |
| Credentials go only to their own host (a key sent to another site) | `Client.prepare` (254 to 258) | the `FAIL:` line above |
| URL that `check-urls` requests (a wrong entry checked) | `entry_url` (264 to 267) | the `FAIL:` line above |
| BibTeX of an arXiv record and the BibTeX body test (a broken entry in `references.bib`) | `arxiv_bibtex`, `run_bibtex` (271 to 277) | the `FAIL:` line above |
| HTML text (script text taken as the paper's text) | `html_to_text` (281) | the `FAIL:` line above |

The test's head comment (line 2) lists what it proves: title matching, the choice among candidates, the DOI mismatch flag, record merging, passage lines, passage normalisation, abstract reassembly, the arXiv query syntax, the OpenAlex query text, the arXiv spacing across processes, an index whose body does not parse, the not found lines, the file name made from a key, the DOI in a URL, the PDF and arXiv HTML tests, the credentials each host gets, the URL check-urls requests, the BibTeX of an arXiv record, the BibTeX body test and the text of an HTML page. The test passes on the finished tree:

```
$ sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces arXiv across processes, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, and reads BibTeX and HTML
(exit status 0)
```

### Point 21, the character-set check

In the brief's form, over the files the step changes (the modified files of `git status --short`, the new files of the skill folder and the three new files of `.scratch/9-literature/agents`), with the exit status of the last command:

```
printf '%s\0' '.agents/plan.yaml' 'README.md' 'agents/ordo-high.md' 'agents/ordo-low.md' 'agents/ordo-max.md' 'agents/ordo-medium.md' 'agents/ordo-xhigh.md' 'docs/academic-coverage.md' 'docs/adr/0002-the-prose-standard-holds-over-the-academic-sources.md' 'docs/adr/0016-a-cited-claim-rests-on-a-verbatim-passage-read-from-the-source-in-the-same-run.md' 'docs/dev/building.md' 'docs/dev/change-standard.md' 'docs/dev/scripts.md' 'docs/glossary.md' 'skills/plan/templates/orchestrator-state.md' 'skills/plan/templates/plan.yaml' 'skills/repo-setup/templates/docs/dev/prose-standard.md' 'skills/repo-setup/templates/docs/glossary.md' 'skills/repo-setup/templates/plan-terms.md' '.scratch/9-literature/agents/briefs/1-cases.md' '.scratch/9-literature/agents/briefs/1-round-1.md' '.scratch/9-literature/agents/reviews/1-report.md' 'skills/literature/references/devils-advocate.md' 'skills/literature/references/editor.md' 'skills/literature/references/failure-paths.md' 'skills/literature/references/reading.md' 'skills/literature/references/search.md' 'skills/literature/references/synthesis.md' 'skills/literature/references/verification.md' 'skills/literature/references/writer.md' 'skills/literature/SKILL.md' 'skills/literature/templates/lookup.py' 'skills/literature/templates/lookup.test.sh' | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
```

It prints nothing; exit status 0 (checked after this report was written, on the report as it stands).

### Reruns after the round

- Every check of the first brief's "Verify before you report": quoted under "DONE / NOT DONE" above (checks 1 to 6), run on the final files.
- C1 to C8 (text cases) are re-read above on the finished tree with the commands they name; C9 to C17 are the live runs above; T1 to T7 are in the test whose pass line is under "Code cases kept as tests".
- The new cases (arXiv query, OpenAlex query, pacing, bodies that do not parse, not found lines, `file_stem`, `quote_doi`, `is_pdf`, `is_arxiv_html_url`, credentials, `entry_url`, BibTeX, HTML text) are in the same test and its pass line names them.
- The live runs of points 4 and 5 and the `grep` of point 6 are under their points.
- No `__pycache__` folder stays in the skill: `find skills -name __pycache__` prints nothing:

```
$ find skills -name __pycache__
(exit status 0)
```

### SKILL.md and the reference files against `docs/dev/skill-layout.md`, rule by rule

- Frontmatter: `name` equals the folder, one-paragraph description of at most 1,024 characters that starts with what the skill does and ends with `Triggers on:`, `metadata.version` only. Found: the description-length check under check 3 prints `920` for this skill; `sed -n 2,3p skills/literature/SKILL.md | cut -c1-80`:

```
name: literature
description: "Search the literature on a topic through Crossref, OpenAlex, Seman
```

- Sections in order: title paragraph, Quick start, Use instead, What it reads, Steps, reference sections, Stops, Anti-patterns, Rules; no other `##`. Found: `grep -n '^## ' skills/literature/SKILL.md`:

```
12:## Quick start
23:## Use instead
32:## What it reads
55:## Steps
164:## The agents
189:## The files of a run
200:## Stops
221:## Anti-patterns
238:## Rules
```

- Steps: a numbered list in execution order, each item ending on its completion criterion. Found: the number of top-level steps and of `Done when` lines under Steps (the mode subsections have theirs):

```
steps 25
steps whose last line is not a Done when: []
```

- A repeat states its count and what follows it. Found: the repeats of Steps: the restart of an agent (once, then the stop), the expansion (once), the removals and checks (twice at most, the last output held), the two reviews and two revisions:

```
82:   - An agent that ends without writing a file its reference names is started once more.
90:10. When `<work>/verified.md` keeps fewer than 3 sources, expand the search once.
93:    - The expansion runs once, whatever it keeps. The run goes on with the sources kept after it.
113:    - The run has two revisions and no third.
127:    - Then run the two commands of Steps 21 once more.
128:    - The commands run twice at most. The output of the last run is held.
174:| Editor, twice | `references/editor.md` | `<work>/editor-<n>.md` |
175:| Devil's advocate, twice | `references/devils-advocate.md` | `<work>/devils-advocate-<n>.md` |
209:| An agent wrote no file | An agent ended twice without writing a file its task names (Steps 7); the run ends as Rules says | The agent, the file 
241:- A stop that ends the run once `<work>` exists stops every agent still running through the runner's stop tool. It uses nothing they wrote and rem
242:- A stop that ends the run once `<out>` exists leaves `<out>` as it is, for the user to read or remove.
```

- A step that can refuse or stop comes before every step that writes what it guards. Found: the refusals are raised in Steps 1 to 4; the question of Steps 5 is asked before `<work>` is made (Steps 6); the stops of Steps 7 follow the first agent start

```
5. When `LITERATURE_SECOND_MODEL` is set, ask the user whether to send the report to its command for a second critique.
   - Name the command by its program name, the first word of the value, and say that it receives the text of `report.md`, passage lines incl
   - This question is the only one before the searches. A run with no such variable asks nothing.
```

- One rule per bullet; a rule written once. Found: the repeated rules of the first review are now written once: `grep -c` of the four phrases (Library not found rule, key-value rule, stop rule, single-quote rule) in `SKILL.md`:

```
is the refusal "Library not found": 1
never appears in a prompt: 1
ends the run once `<work>` exists: 1
single-quoted argument: 2
```

- Bold only for a list item's label, no em dash, no `very` filler. Found: `SKILL.md` holds no bold (`grep -c '\*\*' skills/literature/SKILL.md` prints `0`); `LC_ALL=C grep -n '[^ -~]' skills/literature/SKILL.md skills/literature/references/*.md` prints nothing (it is covered by the brief-form check under point 21). In the reference files, the lines whose bold is not of the form `- **Label.** text` or `N. **Label.** text` are listed by the next command; the only line is the label of an item that has no text after it. The bullets of `failure-paths.md` take the label form too:

```
skills/literature/references/devils-advocate.md:146:- **Minor issues and observations.**
```

- Tables: Stops has the columns Stop, When, What it shows, What resumes it; Anti-patterns has Anti-pattern, Why it fails, Do instead. Found: `grep -n '^| Stop\|^| Anti-pattern\|^| When' skills/literature/SKILL.md`:

```
25:| When | Use |
206:| Stop | When | What it shows | What resumes it |
223:| Anti-pattern | Why it fails | Do instead |
```

- Reference material goes in `references/`, and `templates/` holds what the skill runs from its own folder. Found: `ls skills/literature/references skills/literature/templates`:

```
skills/literature/references:
devils-advocate.md
editor.md
failure-paths.md
reading.md
search.md
synthesis.md
verification.md
writer.md

skills/literature/templates:
lookup.py
lookup.test.sh
```

- Paths: a file of this skill is named from the skill's folder; a file of another skill with its skill. Found: `SKILL.md` names `references/<file>` and `templates/lookup.py`, "the `repo-setup` skill's folder", "the `refute` skill's Steps 1" and "the `plan-orchestration` skill's" sections: `grep -n 'skill.s folder\|skill.s Steps\|skill.s "' skills/literature/SKILL.md | cut -c1-140`:

```
42:   - `templates/docs/dev/prose-standard.md` in the `repo-setup` skill's folder, which stands beside this skill's folder.
68:4. Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `printenv CLAUDE_CODE_EFFORT_LEVE
80:   - Read the agent's id and the model the runner served it from the runner's record of the agent, as the `plan-orchestration` skill's "L
81:   - A served model that is not the configured one, as the `refute` skill's Steps 1 defines it, is the stop "A model other than the confi
123:21. Run `python3 '<this skill's folder>/templates/lookup.py' check-urls '<out>/report.md'` and `python3 '<this skill's folder>/templates
```

- Each reference file states the task it does and a done condition; a rule is written once across the files. Found: `grep -c 'done when' skills/literature/references/*.md` (a file of paths, `failure-paths.md`, is no task and has none; `devils-advocate.md` and `editor.md` state theirs for the file they write):

```
skills/literature/references/devils-advocate.md:1
skills/literature/references/editor.md:1
skills/literature/references/failure-paths.md:0
skills/literature/references/reading.md:1
skills/literature/references/search.md:2
skills/literature/references/synthesis.md:1
skills/literature/references/verification.md:1
skills/literature/references/writer.md:5
```

- Glossary terms used only in their sense. Found: see "The terms" above
Found against the rules that need reading rather than counting: Stops introduction names the two rows that end the run and points at Rules; "The agents", "Agent prompts" and "The files of a run" are reference sections every run reads; the mode subsections are the `###` lists the layout asks for; each Anti-patterns row names the behaviour to do instead in its third column; `projects:`-form text sits only in "What it reads" 1 and 2, Steps 1 and 18, Quick start and one Stops row. The reference files hold no `##` heading that is a sentence or a slogan, no date, version or history (`grep -rn -i 'added in\|v1\|2026' skills/literature` prints nothing; below).

```
$ grep -rn -i 'added in\|v1\.\|2026' skills/literature
(exit status 1)
```

