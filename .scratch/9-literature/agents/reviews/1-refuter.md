# Step 1 refuter report (on .agents/worktrees/9-literature-1, base dc0b03092ee34ad5f7f8b1205d88d6a3019161bb)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All commands were run from the worktree root. The diff is uncommitted, so it was read with `git diff dc0b030` (the form `git diff dc0b030...` prints nothing) plus `git status --short`.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages and rebuilds abstracts
(exit status of the script: 0)
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
sync exit 0
$ <the 32 paths of `git diff dc0b030 --name-only` and `git ls-files --others --exclude-standard`, NUL-separated> | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = ...; END { $? ||= 1 if $bad }'
(prints nothing)
charset exit 0
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]' | grep literature
920 skills/literature/SKILL.md
```

The first run on the unchanged tree. `lookup.py` does not exist at the base, so the test was copied alone into an empty scratch folder and run there:

```
$ git show dc0b030:skills/literature/templates/lookup.py
fatal: path 'skills/literature/templates/lookup.py' exists on disk, but not in 'dc0b030'
$ sh <scratch>/base-t/lookup.test.sh 2>&1 | tail -1
FAIL: <scratch>/base-t/lookup.py does not exist
exit 1
```

The commands the builder's report quotes, rerun live in separate tool calls, so that more than 3 seconds passed between processes that reach arXiv:

```
$ python3 skills/literature/templates/lookup.py resolve 2511.18945
Crossref: not found
OpenAlex: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | Gritsai, German, Richards, Megan, M<latin small letter e with acute>loux, Maxime et al. | 2025 | arXiv (Cornell University) | doi 10.48550/arxiv.2511.18945 | arXiv 2511.18945 | OpenAlex W7106664066 | open access https://arxiv.org/pdf/2511.18945
Semantic Scholar: ratio 1.00: MIST: Mutual Information Estimation via Supervised Training | G. Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | Trans. Mach. Learn. Res. | arXiv 2511.18945 | Semantic Scholar acf4d498834a00aa21de8ad69b7e240aa24ad282
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | arXiv 2511.18945
exit 0
$ python3 skills/literature/templates/lookup.py resolve "Mutual Information Neural Estimation" --year 2018
Crossref: not found
OpenAlex: ratio 1.00: Mutual Information Neural Estimation. | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeshwar et al. | 2018 | International Conference on Machine Learning | OpenAlex W2803832867
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 0.94: MINE: Mutual Information Neural Estimation | Mohamed Ishmael Belghazi, Aristide Baratin, Sai Rajeswar et al. | 2018 | arXiv 1801.04062
exit 0
(the Semantic Scholar 429 is the shared pool, noted and not counted as a defect)
$ python3 skills/literature/templates/lookup.py resolve '10.1016/S0019-9958(57)90116-X'
Crossref: ratio 1.00: An informational measure of correlation | E.H. Linfoot | 1957 | Information and Control | doi 10.1016/s0019-9958(57)90116-x
OpenAlex: ratio 1.00: An informational measure of correlation | Edward H. Linfoot | 1957 | Information and Control | doi 10.1016/s0019-9958(57)90116-x | OpenAlex W2070480153 | open access https://www.sciencedirect.com/science/article/pii/S001999585790116X/pdf
Semantic Scholar: ratio 1.00: An Informational Measure of Correlation | E. H. Linfoot | 1957 | Information and Control | doi 10.1016/S0019-9958(57)90116-X | Semantic Scholar 8468c1d420b6d78f920b74cd685bfa05d8c0e923 | open access https://www.sciencedirect.com/science/article/pii/S001999585790116X/pdf
arXiv: left out, the input has no arXiv ID
exit 0
$ python3 skills/literature/templates/lookup.py resolve 'https://doi.org/10.1016/S0019-9958(57)90116-X'
(the same four lines as above)
exit 0
$ python3 skills/literature/templates/lookup.py bibtex 10.1103/PhysRevE.69.066138
 @article{Kraskov_2004, title={Estimating mutual information}, volume={69}, ISSN={1550-2376}, url={http://dx.doi.org/10.1103/PhysRevE.69.066138}, DOI={10.1103/physreve.69.066138}, number={6}, journal={Physical Review E}, publisher={American Physical Society (APS)}, author={Kraskov, Alexander and St<latin small letter o with diaeresis>gbauer, Harald and Grassberger, Peter}, year={2004}, month=June }
exit 0
$ python3 skills/literature/templates/lookup.py bibtex 1801.00862
@misc{arxiv_1801_00862,
  title = {Quantum Computing in the NISQ era and beyond},
  author = {John Preskill},
  year = {2018},
  eprint = {1801.00862},
  archivePrefix = {arXiv}
}
exit 0
$ curl -s 'https://export.arxiv.org/api/query?id_list=1810.04805' | grep -A2 '<title>' | head -5
    <title>BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding</title>
(one probe: a long arXiv title comes back on one line)
$ python3 skills/literature/templates/lookup.py check-urls <scratch>/c13/report.md
(the scratch report holds a passage with quotation marks, [@gritsai2025; @linfoot1957, p. 1], noid2001 with no identifier and absent2000 with no entry; gritsai2025 is copied with doi = {10.48550/arXiv.2511.18945} and no eprint)
gritsai2025: 200 https://doi.org/10.48550/arXiv.2511.18945
linfoot1957: 200 https://doi.org/10.1016/S0019-9958(57)90116-X
noid2001: no identifier
absent2000: no entry in references.bib
exit 1
$ python3 skills/literature/templates/lookup.py check-urls <scratch>/c13ok/report.md
gritsai2025: 200 https://doi.org/10.48550/arXiv.2511.18945
linfoot1957: 200 https://doi.org/10.1016/S0019-9958(57)90116-X
exit 0
$ time python3 skills/literature/templates/lookup.py fetch 10.48550/arXiv.2511.18945 <scratch>/f gritsai2025
tried https://arxiv.org/html/2511.18945: HTTP 200, full text
python3 skills/literature/templates/lookup.py fetch 10.48550/arXiv.2511.18945  0.13s user 0.03s system 25% cpu 0.615 total
exit 0
(it wrote gritsai2025.html, 786661 bytes, and gritsai2025.txt, 145891 bytes)
$ python3 skills/literature/templates/lookup.py quote-check <scratch>/q1/report.md <scratch>/f
line 3: gritsai2025, section 1: found
exit 0
$ python3 skills/literature/templates/lookup.py quote-check <scratch>/q2/report.md <scratch>/f
("dependence" changed to "correlation" in the passage)
line 3: gritsai2025, section 1: not found
exit 1
$ time python3 skills/literature/templates/lookup.py fetch 2511.99999 <scratch>/p none
tried https://arxiv.org/html/2511.99999: HTTP 404
tried https://arxiv.org/pdf/2511.99999: HTTP 404
lookup OpenAlex: not found
lookup Semantic Scholar: left out, HTTP 429 after 3 retries
no full text and no abstract
python3 skills/literature/templates/lookup.py fetch 2511.99999 $S/p none  0.08s user 0.03s system 0% cpu 11.495 total
exit 1
$ python3 skills/literature/templates/lookup.py fetch math/0601001 <scratch>/c15/inner 'smith:2006/a'
tried https://arxiv.org/html/math/0601001: HTTP 200, full text
exit 0
$ find <scratch>/c15 -type f
<scratch>/c15/inner/smith_2006_a.txt
<scratch>/c15/inner/smith_2006_a.html
(the .txt holds the paper's text: "Codepth Two and Related Topics ... Lars Kadison ... Abstract.")
$ python3 skills/literature/templates/lookup.py fetch 10.1007/BF02024507 <scratch>/c16 renyi1959
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: no open-access URL
no full text and no abstract
exit 1
(ls -A of the folder prints nothing)
$ python3 skills/literature/templates/lookup.py fetch 10.1002/9780470316726.ch2 <scratch>/c16b wiley1
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: no open-access URL
no full text; the abstract is in wiley1.abstract.txt
exit 1
$ python3 skills/literature/templates/lookup.py quote-check <scratch>/q3/report.md <scratch>/c16b
line 3: wiley1, abstract: found
exit 0
$ OPENALEX_API_KEY=<REDACTED> python3 skills/literature/templates/lookup.py resolve 2511.18945
(the value was the deliberately invalid string from C17)
Crossref: not found
OpenAlex: left out, HTTP 401
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: ratio 1.00: MIST: Mutual Information Estimation Via Supervised Training | German Gritsai, Megan Richards, Maxime M<latin small letter e with acute>loux et al. | 2025 | arXiv 2511.18945
exit 0
$ grep -c <the value> <that output>
0
$ git diff dc0b030 -U0 .agents/plan.yaml skills/plan/templates/plan.yaml skills/plan/templates/orchestrator-state.md | grep '^[+-][^+-]' | grep -vc '#'
0
(with the comment removed from each line, the 5 removed lines and the 5 added lines have the same values: reviewer and reviewer_effort unchanged)
$ grep -c 'Done when' skills/literature/SKILL.md
31
$ grep -rn -w 'loop\|loops\|slug\|tier\|tiers' skills/literature
grep exit 1
```

Each of the 22 changed coverage rows was checked against its row on the base: the old reason is a prefix of the new one (a python comparison over `git diff dc0b030 -U0 -- docs/academic-coverage.md` printed `True` 22 times).

Further live runs by the reviewer, behind Behaviour 1:

```
$ python3 skills/literature/templates/lookup.py search '"mutual information" AND (neural OR amortized) NOT kernel' --limit 3
[Crossref] A mutual information kernel for sequences | M. Cuturi, J.-P. Vert | 2004 IEEE International Joint Conference on Neural Networks (IEEE Cat. No.04CH37541) | doi 10.1109/ijcnn.2004.1380902
[Crossref] Amortized Fourier Neural Operators | ...
[Crossref] Amortized Eigendecomposition for Neural Networks | ...
[OpenAlex] Mutual Information Neural Estimation. | ...
[OpenAlex] Using mutual information for selecting features in supervised neural net learning | ...
[OpenAlex] Mutual information, neural networks and the renormalization group | ...
Semantic Scholar: left out, HTTP 429 after 3 retries
arXiv: left out, HTTP 400
exit 0
(three lines shortened with "..." by the reviewer)
$ python3 skills/literature/templates/lookup.py search 'How accurate are neural estimators of mutual information in high dimensions?' --limit 3 | grep -E '^\[[^]]*arXiv|^arXiv'
(prints nothing: arXiv gives no record and prints no line)
$ python3 skills/literature/templates/lookup.py search 'mutual information neural estimation' --limit 3 | grep -c 'arXiv\]\|arXiv,'
3
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The sections stand in the layout's order, `metadata.version` is "1.0.0", the description is 920 characters and holds "Triggers on:", and it names no neighbouring skill. The minor points are Standards 3, 4 and 6.
- 2: holds. The three forms in Quick start each take `[--bib <path>] [--out <folder>]`. Use instead names `idea`, `paper-review`, `paper` and `/writing`. Its self-pointing row is Standards 4.
- 3: violated, Spec 1. The skill has no rule for the `projects:` form, which `/writing` reads. The other inputs hold: the prose standard is found as `/writing` finds it, the library is read only, and the environment variables are optional and never printed.
- 4: holds. Steps 4 runs the effort check and Steps 7 reads each served model and starts every agent in turn. Steps 13 to 16 give two reviews and two revisions in every mode. The file of each agent is named. How the stops clean up is Behaviour 7.
- 5: violated. The failure path after verification has no step to start it (Spec 2). The DOI cross-check and the title-search fallback are missing (Spec 3). The currency minimum is changed (Standards 7). The Boolean and semantic layers do not reach arXiv (Behaviour 1).
- 6: holds. Steps 3 sets the folder name and its two refusals. "The files of a run" sets the citation and passage-line form. `references.bib` comes from `references/writer.md` "The bibliography", `<work>` is made by `mktemp -d` and removed at Steps 23.
- 7: holds. The steps run in the brief's order: second-model question, `/writing`, apply, bibliography, the checks, removals, the checks once more, the method section, removal of `<work>`. Behaviour 8 and 9 are minor.
- 8: holds. `references/synthesis.md` puts the indexes left out into the method section. Rules repeats it.
- 9: violated. The head comment is false in places (Standards 2). An arXiv search with operators or a sentence gives nothing (Behaviour 1). A body that does not parse ends the run with a traceback (Behaviour 3). No "not found" line is printed for search, refs or cited-by (Behaviour 4). The other commands match the brief, as the reruns above show.
- 10: violated, Behaviour 2. Pacing holds within one process. It does not hold across the processes of one agent. The 429 retries and the credential headers match the brief, and the run with `OPENALEX_API_KEY` set printed no key.
- 11: holds. The output is plain text, one line per record.
- 12: holds. The test runs offline on recorded bodies and functions of the script. It failed where `lookup.py` is absent and passes now. Read against T1 to T7, each assertion would fail without its behaviour, and the silent cases carry controls (T3 "a match is not flagged", T5 the changed word).
- 13: holds. The `git diff` hunk of ADR 0016 changes only the fetch sentence.
- 14: holds. The prose standard's "How it is applied" and ADR 0002's Consequences each hold one passage-line sentence.
- 15: holds. Both command lines are in place, in order. **effort agent** and **reviewer** name the agents of `literature` with "Stated in" (`literature`, Steps 4 and 7; Steps 7), the glossary sync prints ok, the template glossary's line 3 names `literature`, and the three comments changed comment text only.
- 16: holds. All five `agents/ordo-*.md` change lines 3 and 6.
- 17: holds. The README gains the table row, the line-78 list entry and the install-loop entry.
- 18: holds. `docs/dev/scripts.md` gains both rows in alphabetical order.
- 19: holds. The 22 reasons keep their old words and each names the files that hold its content, and `check_coverage.py` exits 0. The content of three named places is Spec 3.
- 20: violated in part. The records exist for all 22 rows. For rows 209, 212, 213 and 214 they name `references/verification.md` Resolving item 2 for a fallback it does not state (Spec 3). For row 185 the minimums are changed (Standards 7).

Cases of the brief's "Cases":

- C1: met. `SKILL.md` has the sections in order, and the file does not exist at the base (`git show` above).
- C2: met. Quick start lines 15 to 17.
- C3: met. Steps 4 and 7, which every agent start follows. Steps 13 to 16 hold for every mode.
- C4: partial. Rows 209, 212, 213 and 214 lack the fallback on a mismatch (Spec 3). Row 185 has the changed currency minimum (Standards 7). Rows 184, 186, 187, 191, 197 and 223 were read against the skill's files only (Declined to judge).
- C5: partial. D11's "arXiv paced at one request per 3 seconds on one connection" is not met across processes (Behaviour 2). ADR 0017's "an index that fails is left out with its reason" is not met for an OpenAlex body that does not parse (Behaviour 3).
- C6: met. The rerun above shows comment text only and no value changed.
- C7: met. The prefix check printed True 22 times and `check_coverage.py` prints ok.
- C8: met. The ADR 0016 hunk and the two passage-line sentences.
- T1: met. Test lines 69 to 71, PASS.
- T2: met. Lines 73 to 84, with the no-year and below-threshold controls.
- T3: met. Lines 86 to 102, on recorded bodies through `identifier_lines`.
- T4: met. Lines 104 to 120.
- T5: met. Lines 122 to 128, with the last assertion as ruling 1 of the cases ruling words it.
- T6: met. Lines 130 to 142.
- T7: met. Lines 144 to 147. The assertion calls `abstract_from_inverted_index` directly. The C16 run shows the parse path that `fetch` uses filling the abstract.
- C9: met. All four indexes answered as quoted above.
- C10: met. OpenAlex 1.00 and arXiv 0.94 for 2018. Semantic Scholar answered 429.
- C11: met, for the bare DOI and the URL form.
- C12: partial. The DOI form is met. The arXiv form ran live, but no arXiv ID with a two-line Atom title was run live, so only the recorded body in the test proves the joined title (Declined to judge).
- C13: met. Exit 1 with the faulty citations, exit 0 without them.
- C14: met. The fetch writes `.html` and `.txt`, quote-check finds the copied passage and reports the changed word as not found with exit 1. The two arXiv requests of the 2511.99999 run were made one after the other, and `Client.once` (lookup.py:720-739) holds 3 seconds between them, as read.
- C15: met. The files `smith_2006_a.html` and `smith_2006_a.txt` are written inside `inner`.
- C16: met. No file is written for renyi1959. `wiley1.abstract.txt` is written and its `abstract` passage is found.
- C17: met. OpenAlex is left out with 401, exit 0, and no value is printed.

## 1. Spec

- `skills/literature/SKILL.md`, "What it reads" 2 and Steps 17: "A missing file, or a file without `reviewer`, is the refusal "No plan configuration", which names `/ordo-init`." and "Invoke `/writing '<out>/report.md'` through the Skill tool". The builder's report, judgment call 12, says: "the first words of a `/literature` call are the mode or the topic, so a project name would read as part of the topic ... raised here and not built".
  - What is there: `/Users/axelfaes/workspace/research-hub/.agents/plan.yaml` is in the `projects:` form. Its top level holds only `projects:`, with one project, `oculus`, whose keys include `reviewer: claude:opus` and `standards: []`. It has no top-level `reviewer` and no `reviewer_effort`.
  - The skill's text has no rule for that form. "A file without `reviewer`" does not say top level, so an agent can refuse there (the builder's reading) or take `oculus`'s keys with no rule saying so.
  - `skills/writing/SKILL.md` "What it reads" 1 reads the project from the first argument of the call. `skills/code-comments/SKILL.md` "What it reads" says "In the `projects:` form the first argument of the call is always the project whose keys are read". So the premise of judgment call 12 is wrong: in that form the first word is the project, and it is not read as part of the topic.
  - Steps 17 passes no project. In research-hub, `/writing` reads `<out>/report.md` as the project name and refuses "Unknown project", listing `oculus`. With no `--out`, Steps 3 also writes `literature/<name>/` inside research-hub, which the plan holds read only.
  - The brief asks for the refusal "as `/writing` refuses", and the change standard's rule 4 makes such a point a stop, not a judgment call.
  - Failure scenario: step 2's gate runs `/literature "neural and amortized estimators ..." --bib projects/active/linfoot-estimator/manuscript/main.bib` in research-hub. Under the builder's reading it stops at Steps 1 with "No plan configuration". Under the other reading it runs on `oculus`'s keys, writes into research-hub, and at Steps 17 `/writing` refuses with "Unknown project", so D20's prose pass never runs.
  - Verdict: item 3 violated. The decision is the orchestrator's. Either step 1 builds the form (in the `projects:` form the first argument is the project, as `/code-comments` has it, and Steps 17 passes it to `/writing`), or step 2 runs in ordo with an absolute `--bib` and an `--out` outside research-hub.
- `skills/literature/references/failure-paths.md`, "Too few sources": "**Trigger.** The search agent keeps fewer than 5 sources after its stopping rule, or fewer than 3 remain after the verification agent removes sources." and "**The search agent** expands the search once."
  - What is wrong: `SKILL.md` Steps 9 is followed by Steps 10 (the reading agents), and no step starts the search agent again after verification. The second trigger therefore has no step that carries it out. The brief's item 5 asks for each path "with what the run does".
  - Failure scenario: verification removes 8 of 10 sources as not confirmed or predatory. The run goes on with 2 sources and no expansion.
  - Verdict: items 5 and 7 violated.
- `skills/literature/references/verification.md`, "Resolving each kept source", items 2 and 1 and the bullets below them: "When the source has no identifier, or the identifier is not found in any index, run `lookup.py resolve '<title>' --year <year>`." and "A record that matches at a title ratio of 0.70 or more and carries no `DOI_MISMATCH` confirms the source." and "Compare each confirmed record with the search record: title, authors and year must agree, and a venue or year that disagrees is written in the source's row."
  - What is wrong: for a DOI, `lookup.py` `identifier_lines` (lookup.py:444-457) compares each index with the first record found, not with the title being verified. A DOI that resolves to a real but unrelated paper therefore gets ratio 1.00 in every index and no `DOI_MISMATCH`, and the text counts that as confirmation.
  - The bullet that asks the title to agree names no outcome when it does not, and the title search runs only when the identifier is not found.
  - The sources send a DOI whose title fails against the cited title to a title search: `crossref_api_protocol.md` "Pattern 2: Title Search (fallback when DOI absent or DOI_MISMATCH)", `openalex_api_protocol.md` "The caller falls through to title search", `arxiv_api_protocol.md` Pattern 1 "fall through to title search".
  - The brief's item 5 says "by identifier first and by title search when the identifier fails". The coverage records for rows 209, 212, 213 and 214 name this item for the fallback.
  - Failure scenario: a search result "Neural estimation of the Linfoot correlation (2023)" carries the DOI of an unrelated chemistry paper. It resolves at 1.00 in Crossref, OpenAlex and Semantic Scholar, is marked `VERIFIED`, and is cited.
  - Verdict: item 5 violated, item 20 partial, C4 partial.
- `skills/literature/templates/lookup.py:214`: `return Identifier("arxiv", text, "10.48550/arXiv." + arxiv_id, arxiv_id)`. The head comment, line 17, says: "and an arXiv ID is also read as the DOI 10.48550/arXiv.<id>".
  - What is wrong: choice 7 (a) and item 9 approve reading the DOI `10.48550/arXiv.<id>` as an arXiv ID, not the reverse. Rule 11 says nothing is added, and the report does not list this among its judgment calls.
  - Its effect: Crossref is queried with a DataCite DOI and prints "Crossref: not found" for every arXiv input (C9 above), while OpenAlex finds the work by that DOI.
  - Failure scenario: none of cost found. A reader of the head comment cannot tell that this computation was never approved.
  - Verdict: none. The orchestrator rules whether it stays.

## 2. Proof

- `.scratch/9-literature/agents/reviews/1-report.md`, "Code cases kept as tests, T1 to T7": "Each case is asserted in `lookup.test.sh`: T1 lines 69 to 71, ...".
  - What is wrong: rule 13 of the change standard asks for a table listing each costly behaviour, its case and the failing line quoted for it. The report gives line ranges and one FAIL line for the whole file. The rerun reproduces that FAIL line.
  - Failure scenario: a reader cannot see which behaviours with a cost lack a case. The `%PDF-` gate, the arxiv.org/html host check, the key-to-file-name mapping and the DOI encoding have no test and rest on C11, C14, C15 and C16.
  - Verdict: none.
- The same report, DONE / NOT DONE, check 1: "The character-set check of `docs/dev/building.md` (`git ls-files -coz --exclude-standard | ... perl -CSD -ne ...`) ... prints nothing, exit status 0."
  - What is wrong: the brief names the `printf` form over the changed files, and its report shape says a line shortened with "..." is not verbatim. The rerun of the brief's form over the 32 changed and new files prints nothing and exits 0, so no decision rests on the gap.
  - Failure scenario: none, beyond a report line that cannot be rerun as written.
  - Verdict: none.

## 3. Standards

- Rule 15 of the change standard, in the skill's command lines:
  - `skills/literature/references/verification.md` "Resolving each kept source" 2: "run `lookup.py resolve '<title>' --year <year>`".
  - `skills/literature/references/search.md` "The searches" 1 to 3 and "Screening" 2: `'<boolean string>'`, `'<id>'`, `'<work>/screening' '<key>'`.
  - `skills/literature/SKILL.md` Steps 12, 20 and 23: `'<out>/report.md'`, `'<work>'`.
  - What is wrong: a supplied value (a title, a topic-derived string, an `--out` path) reaches a shell command inside single quotes, with no rule for a single quote inside the value. `skills/writing/SKILL.md` Steps 5 states the rule: "a single quote inside a path written as `'\''`".
  - Failure scenario: the verification agent resolves a title holding an apostrophe, such as "Kendall's tau ...". The command `lookup.py resolve 'Kendall's tau ...'` fails with an unterminated quote, or passes the wrong argument. An `--out` path holding `'` breaks Steps 20 and 23.
  - Verdict: none of the items. It is a rule-15 case the text does not handle.
- Rule 14 of the change standard, the head comment of `skills/literature/templates/lookup.py`:
  - Line 21: "arXiv is queried only when the input holds an arXiv ID." This is false for a title: `run_resolve` calls `searches`, which runs `search_arxiv` for every title (lookup.py:839-845, 955).
  - Line 53: "error: <value> is not a DOI or an arXiv ID", for bibtex, fetch, refs and cited-by." For refs and cited-by, `require_identifier(text, with_ids=True)` (lookup.py:978) prints only the message of line 54.
  - Line 35: "An index that answers ... a body that does not parse is left out with its reason". False at lookup.py:864-875 (Behaviour 3).
  - Failure scenario: a reader of the head comment expects arXiv to be skipped for titles, and expects a parse failure to be reported as a left-out index.
  - Verdict: item 9 violated, through the rule-14 head comment.
- `skills/literature/SKILL.md`, "What it reads" 4 ("A path that is no file is the refusal "Library not found", which names the path.") and Steps 3 ("A `--bib` path that is no file is the refusal "Library not found"."). Also "What it reads" 6 ("no value is printed, written to a file or put in a prompt") and Rules ("A key or a variable value never appears in a prompt, a file or a message.").
  - What is wrong: `docs/dev/skill-layout.md` "Where a rule goes" says "A rule is written once".
  - Failure scenario: an edit to one copy leaves the other copy stale.
  - Verdict: none.
- `skills/literature/SKILL.md`, Use instead: "| A scan's shortlist is to grow into a review or a full report | `/literature review <topic> --bib <scan folder>/references.bib` |".
  - What is wrong: the layout's row 3 gives Use instead "the situations where a neighbouring skill is the right one", and this row points at the skill itself.
  - Failure scenario: none of cost.
  - Verdict: none.
- `skills/literature/references/verification.md`, "Resolving each kept source": "because every index misses very recent work".
  - What is wrong: the prose standard, section A, bans "very" as filler.
  - Verdict: none.
- `skills/literature/SKILL.md` Steps 7: "On that stop every agent of the run still running is stopped through the runner's stop tool, nothing any of them wrote is used, and `<work>` is removed with `rm -rf`."
  - What is wrong: three rules in one bullet, against the layout's "Lists and tables": "One rule per bullet or item".
  - Verdict: none.
- `skills/literature/references/search.md`, "Minimums": "No more than 30 percent of the kept sources are older than the currency age, unless they are seminal works." The source, `deep-research/agents/bibliography_agent.md:434`, says: "No more than 30% sources older than 5 years (unless seminal)".
  - What is wrong: with the currency age of `references/verification.md` (3 years for computer science and AI), the rule tightens from 5 years to 3 for the gate's topic. Rule 17 of the change standard says a rewrite keeps every rule's meaning, and a change of meaning is reported as a stop. The report records it as judgment call 4.
  - Failure scenario: for the gate's topic on mutual-information estimators, MINE (2018) and the 2019 to 2022 bounds papers count against a 30 percent cap at 3 years unless each is called seminal. That pushes the search to replace them with 2023 and later work.
  - Verdict: item 5 violated (the bibliography minimums of `bibliography_agent.md`), C4 partial (row 185).

## 4. Behaviour

- `skills/literature/templates/lookup.py:834`: `terms = " AND ".join("all:" + word for word in re.findall(r"\w+", query))`.
  - What is wrong: every word of the query becomes a required `all:` term, the operator words included.
  - Live: a Boolean string gives "arXiv: left out, HTTP 400". A sentence query gives no arXiv record and no arXiv line. Crossref ignores the operators: its first hit for `... NOT kernel` was "A mutual information kernel for sequences".
  - `references/search.md` layer 1 ("Run `lookup.py search '<boolean string>'`") and layer 4 ("with the question written as a sentence") feed exactly these two shapes.
  - Failure scenario: in a run on the gate's machine-learning topic, arXiv drops out of every Boolean and every semantic search, and the search agent records "arXiv: left out, HTTP 400" for each string.
  - Verdict: item 9 violated ("each index's search"), item 5 partial.
- `skills/literature/templates/lookup.py:704` and `:722`: `self.last_arxiv = None` and `if host in ARXIV_HOSTS and self.last_arxiv is not None:`.
  - What is wrong: the 3-second spacing is kept within one process only, and each new process makes its first arXiv request at once.
  - `SKILL.md` Steps 7 serialises the agents. Nothing in `references/search.md`, `reading.md` or `verification.md` asks an agent to leave 3 seconds between two `lookup.py` runs, or forbids two at once.
  - Failure scenario: the search agent's full-text screening ("For each included or maybe candidate, run `lookup.py fetch ...`") runs as a shell loop, or several `lookup.py search` calls go out in parallel tool calls. arXiv then receives requests less than 3 seconds apart and on several connections, against the terms the brief quotes, and an arXiv block drops the index for the run.
  - Verdict: item 10 violated across processes, C5 partial.
- `skills/literature/templates/lookup.py:864-875` (`body = json.loads(reply.text())`, `body["results"]`, `body["meta"]["count"]`, `json.loads(reply.text()).get("referenced_works")`) and `:860-863` (`work["id"]`).
  - What is wrong: these run outside `get_parsed`. `outcome_of` (776-779) catches only `LeftOut` and `main` (1206) only `UsageError`, so a body that does not parse, or a body without those keys, ends in a Python traceback with exit 1. The head comment gives exit 1 to "found a failure" and says such an index is left out.
  - Failure scenario: OpenAlex answers 200 with an HTML maintenance page to `filter=cites:`. `cited-by` prints a traceback and loses the Semantic Scholar records it had already fetched.
  - Verdict: item 9 violated.
- `skills/literature/templates/lookup.py:460-467` (`merged_lines`) prints a line for an index only when it is left out or "more exist".
  - What is wrong: choice 7 (a) says "an index's 404, or a 200 with no result, prints "not found" for that index". For `search`, `refs` and `cited-by`, an index that finds nothing prints nothing.
  - Failure scenario: `refs` of a DOI that neither OpenAlex nor Semantic Scholar holds prints nothing and exits 0. The search agent cannot tell this from a work with no references. The sentence query above printed nothing for arXiv.
  - Verdict: item 9 partial.
- `skills/literature/SKILL.md` Steps 6: "Make the run's temporary folder `<work>` ... and the folder `<work>/passages`." `references/search.md` "Screening" 2 says "run `lookup.py fetch '<id>' '<work>/screening' '<key>'`".
  - What is wrong: no step makes `<work>/screening`, and `run_fetch` (lookup.py:1155) refuses a folder that does not exist.
  - Failure scenario: the first screening fetch prints "error: <work>/screening: not a folder" and exits 2.
  - Verdict: none.
- `skills/literature/SKILL.md` Steps 7: "A second failure is the stop "An agent wrote no file"". The Stops rows for that stop and for "A model other than the configured one" say what resumes them: "The user's decision, then `/literature` again".
  - What is wrong: on "An agent wrote no file", nothing removes `<work>`, which holds the fetched papers, although Rules says "`<work>` is removed at the end of the run, so no copy of a paper stays".
  - On either stop after Steps 11, `<out>/report.md` stays, so `/literature` again with the same folder is refused "Output folder in use".
  - Failure scenario: the user follows the Stops row and is refused. The papers stay in the temporary folder.
  - Verdict: none.
- `skills/literature/references/writer.md`, "The removals" 3: "List the source under "Sources not accessed" when the failure is "no text", and under "References not confirmed" for every other failure."
  - What is wrong: a passage that is "not found", or a publisher URL that answers 403, lists a source that exists and was read as "not confirmed". The removal also takes out only the failing citation.
  - Failure scenario: a key cited in two paragraphs, with one passage mistyped, is still cited in the other paragraph while it is listed under "References not confirmed". That contradicts the rule "A source that cannot be accessed or confirmed is cited for nothing". The report records this as judgment call 6.
  - Verdict: none.
- `skills/literature/references/writer.md`, "The checks" 2: "Put the two outputs in it unchanged".
  - What is wrong: `quote-check` prints report line numbers (`line 3: ...`), and the subsection is inserted into the method section, which stands before the cited paragraphs.
  - Failure scenario: every line number in the quoted output points several lines off in the final `report.md`.
  - Verdict: none.
- `skills/literature/SKILL.md` "What it reads" 1: "and the path after the words `style profile`".
  - What is wrong: a topic holding those words is cut short.
  - Failure scenario: `/literature writing style profile detection` takes "detection" as the style profile's path.
  - Verdict: none.

## Declined to judge

- The builder's claim that about 1,300 arXiv results across six searches held no title with a line break was not rerun, since that takes hundreds of arXiv requests. One probe, 1810.04805, returned its long title on one line, which agrees with the claim. C12's second clause rests on the recorded Atom body in the test.
- The builder's ad-hoc `Client.get` timing (3.22 s) was not rerun, since the report gives no command. The spacing was checked by reading lookup.py:720-739, together with the 11.5 s run above.
- Whether `.scratch/9-literature/agents/briefs/1-cases.md`, untracked in the worktree, was put there by the orchestrator would take `git log`, which this review does not run.
- Where step 2's gate session runs, ordo or research-hub, is the orchestrator's decision. `plan.md`'s step 2 does not say. Spec 1 gives what the skill does in research-hub.
- Whether arXiv answers 200 to `arxiv.org/html/<id>` for a paper whose HTML conversion failed, which `fetch` would count as full text, was not probed.
- The coverage records were read against their source files for rows 185 (the minimums), 209, 212, 213 and 214. The other 17 rows were read against the skill's files and the row reasons only.
- Sentence length was judged by reading each reference file; no word count was made per sentence.
- The reruns of C13 to C16 and the base-tree test wrote their scratch reports, `references.bib` files and fetched texts only under the session scratchpad. Nothing in the repository, the worktree, the ledger or research-hub was written.

Reviewer usage: a3ac3230ac86633aa, claude-opus-5-5, 313702 tokens, 62 tool uses, 17.7 minutes.
