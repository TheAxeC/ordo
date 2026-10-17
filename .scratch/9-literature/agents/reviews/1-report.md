One check is not done as written: C12's live run of `bibtex` on an arXiv ID whose Atom title spans two lines, because none was found on the live index (about 1,300 results of 6 searches held no title with a line break); that case is proven by a recorded Atom body in `lookup.test.sh`, and `bibtex` of a live arXiv ID is quoted below. Everything else in the brief is done.

# Report of step 1, the literature skill, its lookup script and its wiring

## Open items of the state file

```
- none.
```

## The cases' first run

The first run is on the unchanged tree, commit dc0b030 (`git ls-tree dc0b030 skills/literature | wc -l` prints `0`). Each case below gives that run, then the result on the finished tree.

### Rulings carried

1. T5's last assertion uses "mutual information estimation", which is not found; matching stays by substring, with no word-boundary condition. `lookup.test.sh` line 127 asserts it.
2. C14's pacing is shown by `time ... fetch 2511.99999 <scratch> none`, since every real arXiv paper has HTML; C15 is the naming case only; in C14 the changed word is no prefix or extension of the source's word ("dependence" becomes "correlation").
3. The text of `<script>` and `<style>` elements is left out of the text `fetch` writes for HTML (`html_to_text`, `lookup.py` line 658).
4. A doi.org body whose first non-whitespace character is `@` counts as BibTeX and is printed as given (`run_bibtex`, `lookup.py` line 995); C12 below shows the leading space kept.

### Text cases C1 to C8 (read on the unchanged tree, then on the finished tree)

Commands: `git ls-tree dc0b030 skills/literature | wc -l`; `grep -c 'rebuild: literature' docs/academic-coverage.md`; `grep 'rebuild: literature' docs/academic-coverage.md | grep -c 'skills/literature/'`; `grep -c literature <file>` over the files named in C6; `grep -c 'with `curl`'` and ``grep -c 'fetched by `lookup.py fetch`'`` over ADR 0016; `grep -c 'passage line'` over the prose standard and ADR 0002. Counts on the unchanged tree (extracted from dc0b030) and on the finished tree:

```
unchanged tree: skills/literature entries 0; rebuild: literature rows 22; rows naming skills/literature/ 0; ADR 0016 'with `curl`' 1, 'fetched by `lookup.py fetch`' 0; passage line in prose standard 0, in ADR 0002 0; 'literature' in plan-terms.md, docs/glossary.md, template glossary.md, .agents/plan.yaml, plan.yaml template, orchestrator-state.md, the five agents/ordo-*.md, README.md, scripts.md, building.md, change-standard.md: 0 in each
finished tree:  skills/literature has SKILL.md, references, templates; rebuild: literature rows 22; rows naming skills/literature/ 22; ADR 0016 'with `curl`' 0, 'fetched by `lookup.py fetch`' 1; passage line in prose standard 1, in ADR 0002 1; 'literature' in plan-terms.md 2, docs/glossary.md 2, template glossary.md 1, .agents/plan.yaml 1, plan.yaml template 2, orchestrator-state.md 2, each agents/ordo-*.md 2, README.md 3, scripts.md 2, building.md 1, change-standard.md 1
```

- C1: the unchanged tree has no `skills/literature/SKILL.md` (`git show dc0b030:skills/literature/SKILL.md` prints `fatal: path 'skills/literature/SKILL.md' exists on disk, but not in 'dc0b030'`). The finished `SKILL.md` has these sections in the layout's order: `## Quick start` (line 12), `## Use instead` (22), `## What it reads` (32), `## Steps` (51, with `### Full report` 132, `### Lit-review` 139, `### Three-way scan` 146), `## The agents` and `## The files of a run` (reference sections, 155 and 179), `## Stops` (190), `## Anti-patterns` (208), `## Rules` (225); the title paragraph is line 10. Checked by `grep -n '^#' skills/literature/SKILL.md`.
- C2: the three call forms stand in Quick start, lines 15 to 17 of `SKILL.md`, each with `[--bib <path>] [--out <folder>]`; the unchanged tree has no such lines.
- C3: Steps 4 (effort agent and `CLAUDE_CODE_EFFORT_LEVEL` check) and 7 (every agent, writers included, started as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names, with the served-model read and the stop "A model other than the configured one") come before and after every start; Steps 13 to 16 run the editor, the devil's advocate and two revisions in every mode; the mode subsections add no step that skips them. Read against `skills/writing/SKILL.md` Steps 4, 6 and 7.
- C4: the coverage records below name, for each of the 22 rows, the file and the section or line holding each part; no part a row sends to `idea`, `paper`, `paper-review`, `researcher`, entry 15.A or `writing` is built.
- C5: ADR 0015 (fresh agents in turn, editor and devil's advocate for every mode): `SKILL.md` Steps 7 to 22 and "The agents" (line 155); ADR 0016 (locator and verbatim passage, fetched by `lookup.py fetch`, abstract-only citation, no-text listing): `references/reading.md` lines 12 to 62 and `SKILL.md` Anti-patterns lines 212 to 217; ADR 0017 (one standard-library script): `SKILL.md` Steps 20 and "What it reads" 7, `templates/lookup.py` head comment lines 1 to 60.
- C6: the eight files of ruling B's edits and the five `agents/ordo-*.md` name `literature` (counts above). `git diff -U0 .agents/plan.yaml skills/plan/templates/plan.yaml skills/plan/templates/orchestrator-state.md | grep '^[+-][^+-]' | grep -vc '#'` prints `0` of `10` changed lines: every changed line is comment text.
- C7: each of the 22 reasons names a `skills/literature/` file in backticks (22 rows counted above), and each file is the one its coverage record names; `check_coverage.py` is quoted under check 2 below.
- C8: ADR 0016 line 11 now reads "The full text is fetched by `lookup.py fetch` into a temporary folder"; the prose standard's "How it is applied" paragraph (line 75) and ADR 0002's Consequences (line 20) each hold the passage-line sentence.

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
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages and rebuilds abstracts
lookup.test.sh exit 0
```

Each case is asserted in `lookup.test.sh`: T1 lines 69 to 71, T2 lines 73 to 84, T3 lines 86 to 102, T4 lines 104 to 120, T5 lines 122 to 128, T6 lines 130 to 142, T7 lines 144 to 147. The test imports `lookup.py` from its own folder with `python3 -B -I`, and `lookup.py` holds no parameter, variable or file for the test.

### Code cases checked by a run, C9 to C17

On the unchanged tree each of these commands prints (the same for every command):

```
python3 skills/literature/templates/lookup.py resolve 2511.18945
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '.../skills/literature/templates/lookup.py': [Errno 2] No such file or directory
exit 2
```

On the finished tree, run live from the worktree root (the index answers vary with the shared Semantic Scholar pool, which answered in this run):

**C9**: `python3 skills/literature/templates/lookup.py resolve 2511.18945`

```
Crossref: not found
OpenAlex: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | Gritsai, German, Richards, Megan, M<latin small letter e with acute>loux, Maxime et al. | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2511.18945 | arXiv 2511.18945 | OpenAlex W7106664066 | open access https://arxiv.org/pdf/2511.18945
Semantic Scholar: ratio 1.00: MIST: Mutual Information Estimation via Supervised Training | G. Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | Trans. Mach. Learn. Res. | arXiv 2511.18945 | Semantic Scholar acf4d498834a00aa21de8ad69b7e240aa24ad282
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | arXiv 2511.18945
exit 0
```

**C10**: `python3 skills/literature/templates/lookup.py resolve "Mutual Information Neural Estimation" --year 2018`

```
Crossref: not found
OpenAlex: ratio 1.00: Mutual Information Neural Estimation. | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeshwar et al. | 2018 | International Conference on Machine Learning | OpenAlex W2803832867
Semantic Scholar: ratio 1.00: Mutual Information Neural Estimation | Mohamed Ishmael Belghazi, A. Baratin, S. Rajeswar et al. | 2018 | International Conference on Machine Learning | arXiv 1801.04062 | Semantic Scholar 6b73775f40467aed52784ff355b9bb7168e9078c
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

C12's arXiv title that spans two lines: not run live. Six arXiv searches returned about 1,300 results and none had a newline in its title. The case is proven by the recorded Atom body in `lookup.test.sh` (line 63, assertion "arxiv title on one line"), which holds a title and an abstract broken across lines and expects them on one line. The `@misc` entry above shows the live output form.

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
python3 -B $L fetch 10.48550/arXiv.2511.18945 $F/c14 gritsai2025  0.13s user 0.03s system 26% cpu 0.590 total
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
lookup Semantic Scholar: not found
no full text and no abstract
python3 -B $L fetch 2511.99999 $F/c14p none  0.08s user 0.04s system 1% cpu 12.051 total
fetch exit (see time)
exit 1
```

The two arXiv requests, timed by calling the script's own `Client.get` for the two URLs (`python3 -B -I -` with `lookup` imported from the templates folder):

```
0.11 s after the start: HTTP 404 https://arxiv.org/html/2511.99999
3.22 s after the start: HTTP 404 https://arxiv.org/pdf/2511.99999
```

The second request ends 3.22 s after the start while the first ended at 0.11 s, so it began at least 3 s after the first ended (`ARXIV_SPACING = 3.0`, `lookup.py` line 79).

**C15**: `python3 skills/literature/templates/lookup.py fetch math/0601001 <scratch>/inner 'smith:2006/a'`; `find <scratch> -type f` lists only the two files below, both inside `inner`:

```
tried https://arxiv.org/html/math/0601001: HTTP 200, full text
exit 0
```

```
<scratch>/inner/smith_2006_a.txt
<scratch>/inner/smith_2006_a.html
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
Semantic Scholar: ratio 1.00: MIST: Mutual Information Estimation via Supervised Training | G. Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | Trans. Mach. Learn. Res. | arXiv 2511.18945 | Semantic Scholar acf4d498834a00aa21de8ad69b7e240aa24ad282
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | arXiv 2511.18945
exit 0
```

## DONE / NOT DONE

| Item of the brief | Status | Check |
|---|---|---|
| 1 SKILL.md, layout, description at most 1,024 | DONE | check 3 below; C1 |
| 2 Quick start, Use instead | DONE | C2; `SKILL.md` lines 12 to 30 |
| 3 What it reads | DONE | `SKILL.md` lines 32 to 49 |
| 4 The agents, effort check, served model, two revisions | DONE | C3 |
| 5 The eight `references/` files | DONE | coverage records; `wc -l` below |
| 6 The outputs | DONE | `SKILL.md` Steps 3 and 11, "The files of a run" lines 179 to 188 |
| 7 The run in order | DONE | `SKILL.md` Steps 12 to 24 |
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
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages and rebuilds abstracts
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
```

The character-set check of `docs/dev/building.md` (`git ls-files -coz --exclude-standard | ... perl -CSD -ne ...`), which covers every tracked and new file including this report: prints nothing, exit status 0.

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

5. `lookup.test.sh` ran on the unchanged tree before `lookup.py` existed (`FAIL`, exit 1, quoted above) and passes now. `lookup.py` and `lookup.test.sh` hold no character outside ASCII: `LC_ALL=C grep -n '[^ -~]' skills/literature/templates/lookup.py skills/literature/templates/lookup.test.sh` prints nothing and exits 1 (no match).

6. List items and sentences, read against the prose standard's section E and the layout's "Writing for an agent". The prose standard sets a sentence at about 20 words unless the mechanism needs more. Sentences of more than 30 words remain in these places, each a statement that lists the items of one definition or one mechanism and that splitting would separate from its list: `SKILL.md` lines 78, 90 and 95 (a stop procedure, the synthesis agent's inputs, the first review's inputs: one action with its values); `references/devils-advocate.md` line 54 (the nine causal criteria); `references/failure-paths.md` line 8 (the one expansion of a search); `references/reading.md` lines 37 and 40 (how a passage is written and located); `references/search.md` lines 18 and 43 and 105 to 109 (the key rule, the stale-library note, the advisory computation); `references/synthesis.md` lines 70, 72, 77, 85 and 135 (the conflicting-pairs table and the done condition); `references/verification.md` line 32. The long lists of the sources (the scales, the grades, the red flags, the statuses, the method section) are bulleted. The description line and the Quick start comment column are data lines. Each Steps item ends on a "Done when" bullet (`grep -c 'Done when' skills/literature/SKILL.md` prints 31); every repeat has a count (two revisions, two runs of the checks, 10 passages, 3 retries, 3 of 5 conditions).

## Coverage records

Paths are under `skills/literature/`. Line numbers are those of the finished files. "Not built here" names a part the row sends to another skill or drops.

- **Row 59**, `agents/literature_strategist_agent.md`:
  - Boolean, chaining and semantic searches: `references/search.md` "The searches" layers 1 to 4 (lines 45 to 60).
  - Preset criteria with the question: `references/search.md` "The method, written before the first search" (21 to 30).
  - Two-stage screening: `references/search.md` "Screening" (73 to 89).
  - Theme matrix: `references/search.md` "What `search.md` holds" Theme matrix (107); gap types: `references/synthesis.md` "The matrix, convergence and gaps" (51 to 68).
  - Saturation stops: `references/search.md` "The stopping rule" (61 to 72).
  - 70 percent concentration advisory: `references/search.md` Coverage advisory (109).
  - Not built here: Taiwan databases, the passport corpus protocol and the trust-chain fields (the row drops them).
- **Row 84**, `references/domain_evidence_profiles.md`:
  - The `cs_ml` profile (preprints and proceedings count beside journals): `references/verification.md` Definitions, Peer-reviewed (20), and "Grading each confirmed source" (85); `references/search.md` Rules (19) and Screening (82).
  - Non-reproducible results and benchmark cherry-picking surfaced: `references/verification.md` "Claims and their status" (128) and `references/devils-advocate.md` "Biases" (63).
  - Made the ML default: `references/search.md` line 19 (`cs_ml` for machine learning, statistics and computing topics).
  - Not built here: the other profiles and their machinery.
- **Row 166**, `references/literature_corpus_consumers.md`:
  - Search starts from the user's `.bib`, screened under the same criteria, each skipped entry given a reason, library never modified, external search filling the gaps: `references/search.md` "Starting from the library" (31 to 44); `SKILL.md` "What it reads" 4 (43) and Anti-patterns (223).
  - Not built here: the passport block format.
- **Row 184**, `SKILL.md`:
  - Phases from topic to a written report with devil's-advocate checkpoints, every claim cited, unconfirmed references kept out: `SKILL.md` Steps 8 to 22 (82 to 122), "The agents" (155).
  - Lit-review and three-way scan modes: `SKILL.md` Quick start (15 to 17) and the mode subsections (132 to 153); `references/synthesis.md` "The sections of each mode" (107 to 149).
  - Optional style profile for summary and synthesis: `SKILL.md` "What it reads" 5 (45); `references/synthesis.md` "The style profile" (101); `references/writer.md` rule at line 11.
  - Not built here: the writing check (`writing`); the quick brief and monitoring (entry 15.A); guided mode (`idea`), review mode (`paper-review`), fact-checking, the ethics stop and the AI disclosure (`paper`); systematic review; the method blueprint and the handoff to writing (`researcher`); routing notes, invocation contract, pipeline pointer, version lines, spectrum labels and the integration list (dropped).
- **Row 185**, `agents/bibliography_agent.md`:
  - Criteria first, title then full-text screening, the 70 percent concentration flag, the bibliography minimums: `references/search.md` (21 to 30, 73 to 98, Coverage advisory 109).
  - Fuller record kept of two results sharing an index ID: `templates/lookup.py` `merge_records` (387) and "Rules for the whole search" (`references/search.md` 17).
  - Result text treated as data: `references/search.md` line 14; a source verified only once its original was read: `references/reading.md` line 75 and `references/verification.md` line 14; field of a failed lookup omitted: `templates/lookup.py` head comment (resolve lines) and `references/verification.md` line 15.
  - Starts from the project's `.bib`: `references/search.md` 31 to 44.
  - Not built here: the passport corpus and trust-chain fields, the APA formats and check, the phase boundary and `phase{M}_*/` folder rule.
- **Row 186**, `agents/devils_advocate_agent.md`:
  - Cherry-picking, explained-away contradictions, dependence on the inclusion criteria: `references/devils-advocate.md` "The checks on the synthesis" (20 to 29).
  - Stress test removing the strongest source: "The stress tests" (42 to 49).
  - Checks of the finished report: "The checks on the finished output" (31 to 40).
  - Concession protocol: "The second pass: replies to issues" (123 to 139).
  - Optional second-model critique with the user's consent: `references/devils-advocate.md` "Second-model critique" (115 to 121) and `SKILL.md` Steps 5 and 12.
  - Not built here: the scoping check (`idea`), the AI-disclosure question (`paper`), the origin note (dropped).
- **Row 187**, `agents/editor_in_chief_agent.md`:
  - Five weighted dimensions scored 1 to 5, at least three strengths, every weakness, a fix for each critical or major issue: `references/editor.md` "What it does" and "Dimensions" (12 to 31).
  - No Accept while a critical issue stands: `references/editor.md` line 43.
  - Two revisions driven by the editor and the devil's advocate: `SKILL.md` Steps 13 to 16 (95 to 105); `references/writer.md` "The revision" (15 to 28).
  - Editor confined to reviewing: `references/editor.md` line 3.
  - Not built here: the APA item, the review-phase folder layout and its checker; paper review (`paper-review`).
- **Row 191**, `agents/report_compiler_agent.md`:
  - Every claim traced to the bibliography, a topic the sources miss as a marked gap, a source dated before what it evidences, a locator on each citation: `references/synthesis.md` "Where every claim comes from" (13 to 20) and "Citations and passage lines" (22 to 41).
  - Two-revision log driven by the editor and the devil's advocate: `references/writer.md` "The revision" item 5 (23).
  - Style profile applied only when available: `SKILL.md` "What it reads" 5; `references/synthesis.md` 101 to 105.
  - Not built here: ethics feedback, the AI disclosure and the abstract-only protections (`paper`); the quick structure (entry 15.A); the writing check (`writing`); the APA layout, HTML-comment layers, claim manifest and experiment ids (dropped).
- **Row 196**, `agents/source_verification_agent.md`:
  - References resolved, a DOI pointing at another title flagged, an unconfirmed reference listed, a fabricated one removed: `references/verification.md` "Resolving each kept source" (26 to 60) and "The files" (130 to 148); `templates/lookup.py` `DOI_MISMATCH` (455).
  - Predatory-venue screen: `references/verification.md` (106 to 117). Doubt about ML sources older than two or three years: line 93. Seven evidence levels graded by fitness: lines 61 to 90.
  - The verifier writes only its report: `references/verification.md` line 3.
  - Not built here: the phase-two folder rule and its checker.
- **Row 197**, `agents/synthesis_agent.md`:
  - Source-by-theme matrix, contradictions explained by method, context or time or flagged unresolved, possibly conflicting pairs never claimed complete, a locator on each citation: `references/synthesis.md` (42 to 92, 22 to 41).
  - Delivers only the synthesis: `references/synthesis.md` line 3.
  - Not built here: citation marker layers, the claim manifest, the phase-three folders and their checker.
- **Row 208**, `references/argumentation_reasoning_framework.md`:
  - Warrant, causal criteria with temporality required, rival explanations (the two strongest discussed), claim language matched to the evidence: synthesis part `references/synthesis.md` "Integration, not summary" (42 to 50) and "Citations and passage lines" claim-language table (29 to 41); devil's advocate part `references/devils-advocate.md` "Argument checks" (51 to 57); verifier part `references/verification.md` "Claims and their status" (118 to 129).
  - Not built here: the mentor's Toulmin decomposition (`idea`), the architect's part (`researcher`); `paper-review` and `paper` are not users.
- **Row 209**, `references/arxiv_api_protocol.md`:
  - Match at 0.70, title-search fallback, pacing about three seconds, citations without an arXiv ID skipped: `templates/lookup.py` `MATCH_THRESHOLD` (78), `ARXIV_SPACING` (79), `lookup_arxiv` (808 to 810, "the input has no arXiv ID"); the fallback to a title search: `references/verification.md` Resolving item 2 (31).
- **Row 211**, `references/cross_agent_quality_definitions.md`:
  - Peer review, source age by field (three years for CS and AI), source classes, verification coverage and CRITICAL severity: `references/verification.md` "Definitions" (18 to 25); sampling by the classes in the coverage definition (24).
  - Not built here: the per-mode source counts (the minimums of `bibliography_agent.md` are used, `references/search.md` 90 to 98) and the handoff-schemas pointer.
- **Row 212**, `references/crossref_api_protocol.md`:
  - Match at 0.70, title-search fallback, year from `issued`, backoff on rate limits, field omitted when unreachable: `templates/lookup.py` `parse_crossref_work` year from `issued` (250), `MATCH_THRESHOLD` (78), head comment line 34 (429 retries) and the "left out" lines; the fallback: `references/verification.md` 31.
- **Row 213**, `references/openalex_api_protocol.md`:
  - DOI match only when the title agrees at 0.70, tie-break by year, the four indexes: `templates/lookup.py` `choose_candidate` (406) and `run_resolve` (947); the fallback to a title search: `references/verification.md` 31.
- **Row 214**, `references/semantic_scholar_api_protocol.md`:
  - 0.70 title match and a flagged DOI pointing at another title: `templates/lookup.py` (455); duplicates detected by paper ID: `record_keys` (366) and `merge_records` (387); a miss followed by DOI resolution and web search before "not found": `references/verification.md` Resolving item 3 (32) and line 47.
- **Row 217**, `references/failure_paths.md`:
  - Too few sources, weak sources, a conclusion beyond its evidence, a critical devil's-advocate issue, the revision limit, a failed cross-field synthesis: `references/failure-paths.md` (5 to 44), each with what the run does and, for no kept source, what it leaves (10).
  - Not built here: the question and dialogue paths (`idea`), method-mismatch and resume paths (`researcher`), the ethics stop (`paper`), the Chinese-literature path (dropped).
- **Row 218**, `references/interdisciplinary_bridges.md`:
  - Shared concepts under different names, migrating methods, reframed problems and pitfalls: `references/synthesis.md` "Drawing on other fields" (93 to 100); for search, adjacent-field vocabulary, review papers in bridging fields and reverse citation tracking: `references/search.md` layer 5 (53 to 58).
  - Not built here: forward-citation tracking of `literature_strategist_agent.md` (covered by row 59's `cited-by`), the method step's use (`researcher`), the discipline maps, examples, journal list and conference advice (dropped).
- **Row 221**, `references/logical_fallacies.md`:
  - The 32 fallacies with detection questions: `references/devils-advocate.md` "Fallacies and their detection questions" (65 to 102); ML results such as a best seed reported alone: "Biases" (63).
- **Row 223**, `references/mode_selection_guide.md`:
  - Routing between search, three-way scan and synthesis, pointing to `idea`, `paper-review` and `paper`: `SKILL.md` Quick start (12 to 20) and Use instead (22 to 30).
  - Not built here: the quick-mode routing (entry 15.A), systematic-review routing (dropped), the mappings to academic-paper modes and the full pipeline (`researcher`).
- **Row 227**, `references/source_quality_hierarchy.md`:
  - Seven-level scale, fitness by the field's gold standard, median with an integrity floor for undisclosed conflicts: `references/verification.md` "Grading each confirmed source" (61 to 105); predatory-journal screen (106 to 117); ML gold standard from the `cs_ml` profile (85).
- **Row 231**, `templates/literature_matrix_template.md`:
  - Source-by-theme matrix marked supports or contradicts, convergence summary strong to contested, gap table by type: `references/synthesis.md` "The matrix, convergence and gaps" (51 to 68).

## The terms

Terms of `docs/glossary.md` that the diff changes or uses in a new place, each read against its entry.

- **effort agent** (entry changed in `plan-terms.md` line 39 and `docs/glossary.md` line 44): "the agents of `literature`" added to the list launched as `ordo-<reviewer_effort>`, and "`literature`, Steps 4 and 7" added to "Stated in". Check, `grep -n 'effort agent' skills/literature/SKILL.md`:

```
64:4. Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `printenv CLA
74:7. Start an agent, in the background, as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names. Eve
206:| The configured effort cannot apply | The runner lists no `ordo-<level>` agent for the level `reviewer_effort` name
```

- **reviewer** (entry changed in `plan-terms.md` line 99 and `docs/glossary.md` line 104): "the agents of `literature`" added to those that run on `reviewer:`, and "`literature`, Steps 7" added to "Stated in". Check, `sed -n '/^7\. Start/,/^8\. Start/p' skills/literature/SKILL.md | grep -n reviewer`:

```
1:7. Start an agent, in the background, as the effort agent `ordo-<reviewer_effort>` on the model `reviewer` names. Every step that starts a
```

- **stop** and **refusal**: used in the entries' senses. A stop is a halt for a decision (`SKILL.md` Stops table rows 1 to 4, which the entry's "Also any point in a skill's Stops table where it waits on the user" covers, and which leave no open item); a refusal names its cause and leaves nothing (rows 5 to 11). "To stop an agent" in Steps 7 is the entry's "end a running agent through the runner's stop tool". The entries' "Stated in" lists are not changed.
- **finding**: used only for what `/writing` reports (`SKILL.md` Quick start line 19, Steps 17 and 18, Stops row "Prose findings"; `references/writer.md` "The prose pass"), the entry's `/writing` sense. What the editor and the devil's advocate report are "issues"; what a study found is a "result" in every reference file.
- **runner**, **standards**, **plan configuration** (the refusal's quoted name, as `/writing` has it), **open item** (Stops introduction: the stops leave none): used in the entries' senses.
- **builder**: appears only inside the quoted section title "Launching a builder" of `plan-orchestration`.
- Words that are glossary terms and appear in another sense are kept out: "base" appears only in "Base-rate neglect" (a fallacy name), "authority" only in "Appeal to authority" (a fallacy name), "case" only in "case-control", and "premise" does not appear. "Step" and "Steps N" in `SKILL.md` name the skill's own numbered steps, as every skill's text does; `references/verification.md` says "one grade" where a grade is raised.
- No term is added. The skill says "issues" (never "findings") for what the editor and the devil's advocate report, "two revisions" (never "loops"), and "the folder named after the topic" (never "slug"); `grep -rn -w 'loop\|loops\|slug\|tier\|tiers' skills/literature` prints nothing.

## Files with line counts

New files (`wc -l`):

```
     240 skills/literature/SKILL.md
     152 skills/literature/references/devils-advocate.md
      70 skills/literature/references/editor.md
      44 skills/literature/references/failure-paths.md
      77 skills/literature/references/reading.md
     112 skills/literature/references/search.md
     154 skills/literature/references/synthesis.md
     148 skills/literature/references/verification.md
      73 skills/literature/references/writer.md
    1217 skills/literature/templates/lookup.py
     162 skills/literature/templates/lookup.test.sh
    2449 total
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

1. The evidence profile is `cs_ml` for a topic in machine learning, statistics or computing, and neutral for any other topic (`references/search.md` line 19).
2. The three-way scan keeps a shortlist of 5 to 10 sources; the full report and the lit-review keep at least 10 (`references/search.md` "Minimums").
3. A reading agent extracts at most 10 passages per source (`references/reading.md` line 42).
4. The "at most 30 percent older" minimum uses the currency age of the topic (5 years, 3 for computer science and AI).
5. A critical issue still standing after the second revision goes to "Acknowledged limitations" and the run goes on; it does not stop (`references/failure-paths.md` "A critical issue of the devil's advocate").
6. A `quote-check` failure "no text" moves the source to "Sources not accessed"; every other failure moves it to "References not confirmed" (`references/writer.md` "The removals" 3).
7. The second-model command runs once, before the first review, as `sh -c "$LITERATURE_SECOND_MODEL" < report > <work>/second-model.md`; the question to the user and the method section name it by its program name, the first word of the value, and the value is never printed (`SKILL.md` Steps 5 and 12).
8. With no kept source the run skips the reading agents and the review and revisions, and leaves a method-only `report.md`, an empty `references.bib` and `sources.md` (`references/failure-paths.md` "Too few sources"; `SKILL.md` Steps 10).
9. The editor and the devil's advocate run in turn, not side by side, so that the one-agent-at-a-time rule that protects arXiv holds for every agent.
10. The `/writing` pass ends the turn, so the run waits once for `apply <numbers>`, `apply all` or `apply none` (the stop "Prose findings"); any reply that names no number applies none.
11. A writer task "The checks" puts the last outputs of `check-urls` and `quote-check` into the method section, so the session writes no part of the output (`references/writer.md` "The checks"; `SKILL.md` Steps 22).
12. `SKILL.md` does not accept the `projects:` form of `.agents/plan.yaml` that `/writing` accepts: the first words of a `/literature` call are the mode or the topic, so a project name would read as part of the topic. A plan file in that form is refused as "No plan configuration". If the user wants the form, the call needs a flag such as `--project <name>`; that is a change to the call forms D30 fixes, so it is raised here and not built.
13. The search agent also writes the texts it fetches to screen, under `<work>/screening/`, and each reading agent also writes the files `lookup.py fetch` writes for its key under `<work>`; both are named in "The agents" (`SKILL.md` line 155 to 167).
14. The reasons in `docs/academic-coverage.md` keep every original word and gain a closing sentence naming the files, since row 76's inline form ("held in `...`") cannot take several files for one row without rewording the reason.
15. `lookup.test.sh` runs its Python with `-B` so that the test leaves no `__pycache__` folder in the skill's folder.

## Host- or user-visible changes

- New skill `literature`. Before: none. After: `/literature <topic>`, `/literature review <topic>` and `/literature scan <topic>` exist; the install loop in `README.md` copies the skill folder with the other skills.
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
- The brief's list of places that name the agents (line 39) was complete. After the edits, this command prints only lines that stay as they are (`plan-terms.md` line 41 **finding**, as the brief says, its copy in `docs/glossary.md`, `docs/academic-coverage.md` line 35, `docs/roadmap.md` line 196, and the `strip_comments` script, test and command lines):

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

