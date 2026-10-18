# Step 1 brief check (on main at a901cfe)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

`git rev-parse HEAD` printed `a901cfeb047920d7a32d92e73e322d5608a3944f`. `git status --short` printed ` M .scratch/9-literature/orchestrator-state.md`, ` M .scratch/9-literature/plan.md`, `?? .scratch/9-literature/agents/briefs/1.md`. Step 1's line was read as the working tree holds it: `git diff .scratch/9-literature/plan.md` shows the line rewritten from `agents/reviews/1-coverage.md` to the section "Coverage records" of `agents/reviews/1-report.md`, with "and each such row's reason naming that file, as the page's introduction says" added.

## 1. Names

- The places that list who runs on `reviewer` and as `ordo-<reviewer_effort>`: `grep -rn 'code-comments' skills utils docs README.md agents .agents/plan.yaml | grep -v '^skills/code-comments/' | grep -v '^docs/adr/0014'`. Hits outside "Paths this step writes": `docs/roadmap.md:196` (entry 4's closing line; the change does not make it false). Hits inside the paths that no item of "What to build" edits:
  - `skills/repo-setup/templates/plan-terms.md:41` and `docs/glossary.md:46`, **finding**: "a defect a reviewer reports ... Also, for `/writing`, ... Also, for `/code-comments`, ...". The change makes it incomplete. The skill will call what the editor and the devil's advocate report "findings" (D14 "whose findings drive the two-loop revision", D22 "adds its new findings to the devil's advocate's list", brief item 4 "whose findings drive two revision loops"), and the entry defines no such sense. The brief's list of places under "What is on the tree" leaves this hit out, although its own grep prints it.
  - Every other hit of that grep is one the brief lists and an item edits: `.agents/plan.yaml:10`, `skills/plan/templates/plan.yaml:12,27`, `skills/plan/templates/orchestrator-state.md:14,26`, `plan-terms.md:39,99`, `docs/glossary.md:44,104`, `skills/repo-setup/templates/docs/glossary.md:3`, `agents/ordo-*.md:3,6`, `README.md:27,78,105`, `docs/dev/scripts.md:17,31`, `docs/dev/building.md:6`, `docs/dev/change-standard.md:70` and `docs/academic-coverage.md:35`. The last already lists `literature`.
- The ledger copies of the same comments: `grep -rln 'agents of /code-comments' .scratch` printed `.scratch/archive/4-code-comments/orchestrator-state.md`, two archived reports and `.scratch/9-literature/orchestrator-state.md`. This plan's configuration block will no longer list every agent on `reviewer`. It is a copy made when the plan opened and belongs to the orchestrator, so the change makes nothing false that the step must change.
- Other lists of the skills: `grep -rn -E 'session-retro' skills utils docs README.md agents ... | grep -v '^skills/session-retro/'` and `grep -n -E '/writing|/code-comments|`writing`|`code-comments`' skills/ordo-help/SKILL.md README.md docs/dev/*.md utils/* skills/*/SKILL.md`. The change makes none of these false:
  - `README.md:7` lists the skills around the loop and names neither `writing` nor `code-comments`.
  - `README.md:53` and `skills/ordo-help/SKILL.md:27,109` hold the sequence, which names neither skill.
  - `docs/figures/gen_figures.py:5`, and `docs/dev/building.md:32` about it: the figures hold only the pipeline skills.
  - `utils/pin.sh:341` finds the skills from `skills/*/SKILL.md` and keeps no list.
  - `skills/plan-orchestration/SKILL.md` "The two tiers, and the models" lists only the plan skills' agents.
  - No test enumerates the skills: `grep -rn -E 'writing' utils/*.test.sh skills/*/templates/*.test.sh | grep -v '^skills/writing'` printed nothing.
- The new names: `grep -rn -E 'skills/literature|lookup\.py|lookup\.test\.sh|LITERATURE_SECOND_MODEL' . | grep -v '^./.scratch/'` printed `docs/adr/0017-...:11` and `docs/roadmap.md:25`. Both agree with the change.
- Terms the skill's text will use in a sense `docs/glossary.md` does not define. The brief's Conventions say "the step adds no new term". The layout's "Writing for an agent" says a term in a new sense is first added or changed in `plan-terms.md`. The term lines come from `grep -n -E '^- \*\*(slug|loop|finding)\*\*' docs/glossary.md`:
  - `docs/glossary.md:120` **slug**, "the ledger folder's name". Item 6 (`1.md:89`) uses `literature/<topic slug>/` and "the slug the topic lowercased ...".
  - `docs/glossary.md:65` **loop**, "the unattended run of `plan-orchestration` ...". Items 4 and 5 and the Conventions (`1.md:79`, `1.md:85`, `1.md:237`) use "two revision loops", from D14 and ADR 0015.
  - `docs/glossary.md:46` **finding**: the sense of the first bullet above.

Findings:
- The **finding** entry (`plan-terms.md:41`, `docs/glossary.md:46`) needs a sense for `literature`'s editor and devil's advocate, and item 13 does not name it.
- The Conventions' "the step adds no new term" contradicts the words the rulings force on the skill: "slug", "loop" and "finding" in new senses. The brief must either name the `plan-terms.md` entries to add or change, or give other words.

## 2. The step line

- `SKILL.md` (1.0.0): item 1.
- The three call forms of D30: item 2.
- The agents of D14 and D31: item 4.
- The citation tie of D15: item 5 (`references/reading.md`) and item 6.
- The outputs of D16 to D18 and D21: item 6. D16's "a claim that needed one becomes a marked gap" and "'References not confirmed' lists each with the lookups made" are not stated. Row 191's marked gap in `synthesis.md` is for a topic the sources miss, which is a different gap.
- No stop before searching (D19): items 5 and 7.
- The `/writing` pass of D20: item 7.
- The second-model critique of D22: item 5 (`review.md`), item 7 and decision 7.
- Its `references/` holding what each agent is given: item 5.
- `templates/lookup.py` computing only what D11 and D27 approve: items 9 to 11.
- The offline test with recorded responses: item 12.
- Added to the verify list in `docs/dev/building.md` and to the command block of `docs/dev/change-standard.md`: item 13.
- Wired in as D31 says: items 13 and 14.
- Listed in `README.md` and `docs/dev/scripts.md`: items 15 and 16.
- ADRs 0015, 0016 and 0017 followed: items 4, 5 and 9. See section 7 for the parts that contradict them.
- The five edits of ruling B: item 13.
- One record per row in "Coverage records": item 18.
- Each row's reason naming that file: item 17.
- The check, the skill read against the layout, the rulings and the three ADRs: C1 to C4 in part. No case and no item of "Verify before you report" names the reading against ADRs 0015 to 0017 and the rulings.
- The check, `lookup.test.sh` exits 0 after failing on the unchanged tree: Verify 1 and 5.
- The check, `resolve 2511.18945` run live and read: C8.
- The check, each coverage record read: C4 and item 18.
- The check, the character-set check: Verify 1.
- (1 commit): no requirement. The builder makes no commit.

Findings:
- "the agents of D14": the scan has no agent that writes its output. Item 4 says "The scan runs the search and verification agents and one reading agent per shortlisted source", with no synthesis agent. Item 4 also says "The session ... writes no part of the output". Yet item 5 gives `synthesis.md` "the scan's per-paper WHY, HOW and WHAT".
- "its `references/` holding what each agent is given" has two gaps:
  - The writer agent, which makes each revision (D14) and applies the `/writing` findings (D20), has no reference file.
  - The editor and the devil's advocate share `review.md`, against decision 1's "one per agent role".
- Parts that the 22 rows' reasons take for `literature` are missing from item 5's lists, or are placed in one file where the row names several. Item 18 asks for every part, but item 5 reads as the content of each file. The missing parts:
  - The optional style profile of rows 184 and 191, with no input in item 3 and no place.
  - The confinement of each agent to its own output: rows 185, 187, 196 and 197.
  - Row 185's "keeps the fuller record of two results sharing one index ID". Neither item 9's merge nor `search.md` says which record's fields survive.
  - Row 208's verifier and devil's advocate parts. Item 5 puts row 208 in `synthesis.md` only.
  - The title-search fallback of rows 209, 212, 213 and 214.
  - Row 214's "goes on to DOI resolution and web search before being called not found".
  - Row 212's "the year read from the `issued` field".
  - Row 211's CRITICAL severity and "Its verifier samples by the tiers".
  - Row 218's use in synthesis and its "review papers in bridging fields".
  - Row 227's "combined by a median with an integrity floor for undisclosed conflicts".
  - Row 166's "external search then fills only the gaps".
- "the citation tie of D15", with ADR 0017's `quote-check`: no item says when the skill runs `quote-check` and `check-urls` on the report, or what the run does when either exits 1. The checks would have to run after the revision loops and the `/writing` apply, and before the temporary folder is removed. `grep -n -E 'quote-check|check-urls' .scratch/9-literature/agents/briefs/1.md` printed only lines 83, 104, 106, 139, 156, 157, 209 and 211: the command definitions, cases and decisions, and no step of the skill. Without such a step, a writer agent's change to a passage line goes unchecked.
- "computing only what D11 and D27 approve": item 9 says "D11, D27 and open item C" and adds computations of the brief's own:
  - `check-urls` on every `http` or `https` URL of the report's text;
  - the reference record for an ID with no expected title;
  - `--limit` with a default of 20;
  - exit status 2.

  Open item C fixes what `check-urls`, `quote-check` and `fetch` read and write, and it was closed under self-rule. `plan-orchestration`'s `references/self-rule.md`, "The six kinds left open", kind 3, leaves open "an option that adds a check, a command in the verification list or a script, since the rules file reserves to the user the approval of what a new script computes". The rules file's "Scripts compute facts; judgment is read" says the same.
- Minor, with no effect: item 1's preamble cites "D1 to D22, D25 to D33". `grep -o -E '^- D[0-9]+' .scratch/9-literature/plan.md` lists no D13 and no D24.

## 3. Premises

- `ls skills/literature` printed `ls: skills/literature: No such file or directory`. Matches.
- `grep -c 'rebuild: literature' docs/academic-coverage.md` printed `22`. `grep -n` printed rows 59, 84, 166, 184, 185, 186, 187, 191, 196, 197, 208, 209, 211, 212, 213, 214, 217, 218, 221, 223, 227 and 231. Matches.
- `wc -l` of the 22 source files printed 627, 38, 160, 548, 436, 192, 167, 341, 219, 354, 68, 75, 14, 72, 64, 107, 331, 292, 192, 331, 188 and 85 (total 4901). Each matches its row. An `awk` over the section headings confirms each row's skill folder.
- `grep -n 'rebuild later: literature' docs/academic-coverage.md` printed rows 74, 109, 190, 198, 220 and 233. Matches.
- The introduction's sentence stands at `docs/academic-coverage.md:14`, word for word. Row 76's reason holds "held in `skills/writing/references/rules.md`". `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, `exit=0`. Matches.
- `grep -n -E '^#|^[0-9]+\. |No plan configuration' skills/writing/SKILL.md` shows Steps 4, 6 and 7 as the brief says, and the stop at `skills/writing/SKILL.md:275`: "No plan configuration ... A refusal that names `/ordo-init`". `skills/code-comments/SKILL.md` Steps 4, 6 and 7 match. Matches.
- The places on `reviewer`: `.agents/plan.yaml:10` holds the comment. `grep -n reviewer .agents/plan.yaml` shows no `reviewer_effort` line. `plan.yaml:12,27`, `orchestrator-state.md:14,26`, `plan-terms.md:39,99`, `docs/glossary.md:44,104`, the glossary template's line 3, `agents/ordo-*.md` lines 3 and 6, and `README.md:27,78,105` all match. The list's omission of `plan-terms.md:41` is in section 1.
- `docs/dev/scripts.md` has "User scripts" (Script, Job) and "Test scripts" (Script, Proves). The quote stands at `docs/dev/building.md:34`, and PASS and FAIL at `docs/dev/building.md:15`. Matches.
- `which pdftotext` printed `/opt/homebrew/bin/pdftotext`, and `python3 --version` printed `Python 3.13.4`. Matches. "which the Read tool also uses for PDFs over 10 pages": not verified.
- The four indexes: the brief gives no command, so they were not rerun. My probes agree with the brief and add facts:
  - `https://api.crossref.org/works/10.0000/does-not-exist` answered `404 text/plain b'Resource not found.'`.
  - `https://export.arxiv.org/api/query?id_list=2511.99999` answered 200 with no entry.
  - `id_list=notanid` answered `HTTP Error 400: Bad Request`.
  - `https://api.crossref.org/works/10.48550/arXiv.2511.18945` answered 404.
- The ADR quotes of 0001, 0002 and 0013 match their Decision sections, read with `cat docs/adr/00*.md`. "No other ADR's decision governs ..." does not hold for 0010: see section 7.
- The step line's correction: `git diff .scratch/9-literature/plan.md` shows the line on a901cfe naming `agents/reviews/1-coverage.md`, and the working tree naming the section "Coverage records". The correction is uncommitted. Matches what the brief says.
- The verify list against `docs/dev/building.md`: a `python3 -I -c` compare of the state file's `verify:` with the building page's block printed `True` seven times and `7 7`. Matches.

Findings: none.

## 4. Cases and checks

- C1, C2, C4, C5, C7: consistent.
- C3: consistent. It covers the agents of D14 only, not the writer agent of D20 (item 7).
- C6: inconsistent with ruling B. "The six places of ruling B": ruling B names five edits over eight files (`docs/dev/building.md`, `docs/dev/change-standard.md`, `plan-terms.md`, `docs/glossary.md`, the glossary template, `.agents/plan.yaml`, the `plan` skill's `templates/plan.yaml` and `templates/orchestrator-state.md`). "Six" matches neither count, so a reviewer cannot tell which places the case means.
- T1: consistent. `difflib.SequenceMatcher(None, "mutual information", "neural estimation of mutual information").ratio()` printed `0.631578947368421`.
- T2, T3, T4: consistent. For T2 and T3, see section 5.
- T5: inconsistent with item 6 and open item C. The report holds the passage "on one line", yet the case's passage "mutual infor-\nmation estimators" holds the hyphen and the line break itself. The passage should be "mutual information estimators", with the split only in the source text.
- C8 to C12: consistent.
- C13: the case cannot exercise what it names. `fetch` of `10.1000/a:b`, a DOI that does not exist, fetches nothing, and item 9 says it "exits 1 when none worked". No file is ever written, so the naming rule never runs. Rule 15 needs an id that `fetch` can write, such as an old-style arXiv id like `math/0601001`.
- C14: as written, it can be produced only by a parameter for the test alone (rule 11) or a fault put into the code (rule 22), because the brief names no real failing request. The case needs a real one, such as an invalid key for one index, after a run shows that index refusing it. Not verified for any index.
- Rule 15 ("Each place where a supplied value reaches a command, a path or generated text is a case"): item 10 cites rule 15 for percent-encoding, but no case covers a DOI or title reaching a URL. No case covers the id reaching `pdftotext`'s arguments, or arXiv metadata reaching the generated `@misc` text.
- Places the step does not change: Verify 1 runs `sh skills/land/templates/land.test.sh` "(the state-file template's comments changed)". `grep -n -E 'orchestrator-state|templates/plan.yaml' skills/land/templates/*.sh` shows the test builds its own scratch state files and never reads `skills/plan/templates/orchestrator-state.md`. `check_config.py` does read `templates/plan.yaml` (its head comment at `skills/ordo-init/templates/check_config.py:6`).

Findings:
- C6's count of six.
- T5's passage form contradicts item 6.
- C13 writes no file.
- C14 has no real failing request, which leaves the builder rule 11 or rule 22 to break.
- Rule 15 has no case for the URL, for the `pdftotext` arguments, or for the generated BibTeX.
- Verify 1 gives `land.test.sh` a reason that is false: it does not read the file the reason names.

## 5. The question

- C1: no. It must be read with the other text cases.
- C2: no.
- C3: no.
- C4: no.
- C5: yes. A report the builder writes by hand exercises the parser only on the forms the builder chose. Section 6's inputs are not in it: a quote inside a passage, a multi-key citation, a missing passage line.
- C6: no.
- C7: yes. A reason can name any `skills/literature/` file and `check_coverage.py` still exits 0, since it checks only marks and reasons. C4 closes this only if its reading compares the file the reason names with the record.
- T1: no.
- T2: yes. When the candidate with the year also has the higher ratio, a script that ignores the year passes. The case must give that candidate the lower ratio.
- T3: yes. A script that prints `DOI_MISMATCH` on every DOI lookup passes. The case needs the control of a body at 0.70 or more that prints no `DOI_MISMATCH`.
- T4: no.
- T5: yes. Both sides of the case hold "infor-\nmation", so a normaliser that keeps the hyphen, or turns "-\n" into a space, still finds the passage. The real one-line passage "mutual information estimators" would then not be found.
- C8: no, for an ID lookup.
- C9: no.
- C10: no.
- C11: no.
- C12: yes, on the gate's library. The case's scratch bib is the builder's own. `main.bib`'s arXiv entries carry `doi = {10.48550/arXiv.2511.18945}` and no `eprint`, from `grep -i -o -E '^\s*(doi|eprint|url|archiveprefix)\s*=\s*.{0,60}' main.bib`. `quote-check`, which "finds the key's `doi` or `eprint`", then looks for `10.48550_arXiv.2511.18945.txt`, while `fetch 2511.18945` wrote `2511.18945.txt`.
- C13: yes. It passes with nothing written.
- C14: yes, or it cannot be run (section 4).
- The step line's check, "`lookup.test.sh` exits 0 after failing on the unchanged tree": yes. On the unchanged tree `lookup.py` does not exist, so every test fails there whatever it asserts. Only reading judges T1 to T5, as rule 13's audit bullet says.
- The step line's check, `resolve 2511.18945` live: no for the ID path. The title path is C9.
- The step line's checks, the readings: no. The character-set check is a fact.
- Item 1 (C1 and Verify 3), item 2 (C2), item 4 (C3), item 5 (C4), item 13 and item 14 (C6 and the sync check), item 18 (C4): no.
- Items 3, 6, 7, 8, 15 and 16: no case names them. They are judged only by the reviewer's reading of the item, which answers no.
- Item 10: yes. The arXiv pacing, the 429 retry and the percent-encoding have no case and no run, and a script with none of them passes every case. A quoted run would show the pacing without a parameter for the test: `time` over a `fetch` that tries the arXiv HTML and then the PDF, at 3 seconds or more.
- Item 12: as T1 to T5 above.
- Item 17 (C7): as C7.
- Verify 1's `land.test.sh`: yes. It checks nothing of the change. No command parses the YAML block of the state-file template after its comment changes.

Findings:
- T2, T3, T5, C5, C7, C12, C13 and C14, each as above.
- Item 10 has no case or run for pacing, retry or encoding.
- `land.test.sh` covers no changed file.

## 6. Implied inputs

- A DOI needing encoding: missing. The gate's library holds `10.1016/S0019-9958(57)90116-X`, and SICI DOIs hold `<`, `>`, `;` and `#`. Expected: the DOI percent-encoded in each index's URL (`#` as `%23`), and the record found.
- An old-style arXiv id, `math/0601001` or `hep-th/9901001v2`: missing (T4 has only the new style). Expected: read as an arXiv id and not as a title by `resolve`, `bibtex` and `fetch`; the version stripped for the merge; the file `math_0601001.txt`.
- An arXiv paper named by its DataCite DOI, `10.48550/arXiv.<id>`: missing. Four entries of `main.bib` have this form. Expected: `fetch` tries arXiv for it, and `quote-check` finds the text whichever id `fetch` was given. One naming rule must be fixed for both commands.
- A cited key with only `url` (`kingma2015`), or with no identifier (`sklar1959`, `belghazi2018`), from a `python3 -I -c` listing of `main.bib`'s identifier fields: missing.
  - Expected for `check-urls`: a key with no identifier printed as such, with exit 1 (D6).
  - Expected for `quote-check`: an arXiv `url` used to find the text.
  - D18 keeps a library entry unchanged, so an entry with no identifier cannot be fixed by the run. This is a conflict for the orchestrator to rule on.
- An index answering 200 with an empty result: missing. The arXiv probe returned 200 with no entry. Expected: a not-found line for that index and no record.
- A body that is not JSON: missing. Crossref answered `404 text/plain b'Resource not found.'`. Expected: not found, told apart from a failure. A 200 with a body that is not JSON is left out with its reason.
- A 400 from arXiv for a malformed id: missing. Expected: the index left out with the status.
- A PDF with no text layer: missing. Expected: `fetch` reports no text and the source counts as not accessed, not as every passage "not found". D11 does not approve that computation.
- A redirect to a login or landing page, answering 200 with HTML, from an `oa_url` or an `openAccessPdf.url`: missing. Expected: only a PDF body (`%PDF-`) or arXiv's HTML counts as full text, and the next URL is tried. Otherwise an abstract page passes as full text, against D15 and ADR 0016.
- A passage holding a quotation mark: missing. Expected: the passage is the text between the first `"` after `]: ` and the last `"` of the line.
- A citation with no passage line, or a passage line in another form (curly quotes, no colon), and a report with no citations: missing. Expected: each citation without its passage line reported with exit 1. Otherwise `quote-check` finds no line and exits 0.
- A key cited but absent from `references.bib`: missing. Expected: named by `check-urls` and `quote-check`, with exit 1.
- A Pandoc multi-key citation, `[@a; @b, p. 3]`: missing. Expected: every key checked.
- An abstract-only citation (ADR 0016): missing. `fetch` writes no `.txt` for it, so `quote-check` prints no text and exits 1 on a citation the ADR allows. Expected: the abstract's text checked.
- A real hyphen broken at a line end, "self-\nsupervised": missing. The join gives "selfsupervised", so a correct copy is not found. Expected: found. A change to the normalisation needs D11's owner.
- Non-ASCII in `pdftotext` output (ligatures, curly quotes, en dashes): missing. Expected: a passage copied byte for byte is found. See ADR 0002 in section 7.
- A version-suffix mismatch, `fetch 2511.18945v2` against `eprint = {2511.18945}`: missing. Expected: file names without the version.
- Two `lookup.py` processes against arXiv at once, when reading agents run together: missing. Expected: item 4 says the reading agents run one at a time, or the pacing holds across processes.
- The Crossref year (row 212, `issued`, not `created`): missing. Expected: the year from `issued`.
- An arXiv Atom title with line breaks or `$...$` reaching the `@misc` entry: missing. Expected: whitespace runs made one space, and braces balanced.
- doi.org answering with something other than BibTeX for a DOI: missing, and not probed (for example, `10.52202/075280-0742`). Expected: the status printed and exit 1.
- `--out` naming a folder that already holds `report.md`: missing. The wrong answer is lost work. Expected: a refusal naming the folder.
- A topic whose slug is empty or holds non-ASCII letters: missing. Expected: the rule stated for both.
- `LITERATURE_SECOND_MODEL` naming a command that is not found or exits non-zero: missing. Expected: the report says the critique did not run, with the status, and the run goes on.
- A DOI given as a URL or with `doi:`, in the call or in a `doi` field: missing. Not in `main.bib`. The cost would be `https://doi.org/https://...`. Expected: the prefix stripped.
- A `/writing` finding inside a verbatim passage line, such as an <em dash> or a long sentence in a quoted source: missing. Expected: the apply leaves passage lines unchanged, or `quote-check` runs again after the apply.
- A network failure: C14. A 429 after its retries: item 10, with no case.

Findings: every item above marked missing.

## 7. ADRs

- 0001: touches the step. Under "`/writing` and the skills that read the writing base read the prose standard where it is". Named. Holds.
- 0002: touches the step. Under "The prose standard holds for every text the writing skills write or review." Named. It is contradicted: item 6 puts passages "as it stands in the source's `.txt`" into `report.md`, a text the skill writes. Such passages hold non-ASCII, dashes, long sentences and the passive. The prose standard's "B. Punctuation" requires "ASCII throughout", and "How it is applied" says "A violation a page quotes from elsewhere is fixed at its source in the same change". The brief does not say how a verbatim passage stands under 0002, nor what D20's `/writing` pass does with its findings in a passage.
- 0003: "Status: superseded by 0013". No part is in force.
- 0004, 0005, 0007, 0008, 0009, 0011, 0012, 0014: do not touch the step. The skill makes no commit, and the comment lists are not 0014's decision.
- 0006: its decision governs the agents of plan skills, so it does not touch the step. Its Consequences sentence, "A skill added later that starts an agent records its id and role", is met as `/writing` meets it: the brief has the skill read each id and served model.
- 0010: touches the step, since the step changes the verification page that its decision reads: "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands". Not named. The brief says "0004 to 0012 ... govern the plan skills' own machinery, which this step does not change". The verify list's gain of `lookup.test.sh` happens at `/land` by this record.
- 0013: touches the step. Under "`/writing` first runs a script ... It then starts four fresh agents", and item 7 invokes `/writing`. Named. Holds.
- 0015: touches the step. Named. Contradicted three times:
  - Item 4's lit-review and scan run no editor or devil's advocate, against "A fresh editor agent and a fresh devil's advocate agent then review the report, and their findings drive two revision loops". D30 (self-rule) set this. `references/self-rule.md` kind 3 names a contradiction of an ADR in force.
  - The scan has no "synthesis agent that writes the report from the extracted passages only", while "The session ... writes no part of the report".
  - Its Consequences say "The skill's steps name each agent, what it is given and the file it writes". No item names the file each agent writes.
- 0016: touches the step. Named. Contradicted twice:
  - "The full text is fetched with `curl` into a temporary folder" stands against item 5's "`lookup.py fetch` into the run's temporary folder" and item 9's "the standard library only". D15 says `curl`, while D11 (the user) and open item C say `fetch`. The brief does not say whether `fetch` calls `curl`.
  - "A source of which only the abstract was read is cited only for what the abstract says" stands against `quote-check`'s "no text" for such a citation (section 6).
- 0017: touches the step. Named. Under "as the entry's ruling D11 states them". The brief adds open item C and its own decisions 4 and 5 (section 2).

Findings:
- 0002 against item 6's verbatim passages and the `/writing` pass.
- 0010 touches the step and is not named.
- 0015 against item 4's lit-review and scan, and the scan's missing writer.
- 0016's `curl` against `fetch`.
- 0016's abstract-only citation against `quote-check`.

## 8. Dictated text

- "`/literature <topic>`", "`/literature review <topic>`", "`/literature scan <topic>`": `grep -n -F '`/literature' 1.md` finds 74, 75 and 76. Holds.
- "No plan configuration": `grep -n -F '"No plan configuration"'` finds 38 and 78. Holds.
- "A model other than the configured one": `grep -n -F` finds 79. Holds.
- "`literature/<topic slug>/`" and "the slug the topic lowercased ...": `grep -n -F 'topic slug'` finds 89. Breaks `docs/dev/skill-layout.md`, "Writing for an agent" (a glossary term used only in its defined sense), against `docs/glossary.md` **slug**.
- "`[@<key>, <locator>]`", "`> [@<key>, <locator>]: "<passage>"`", "Sources not accessed", "References not confirmed", "none": `grep -n -F '"Sources not accessed"'` finds 83 and 90. Holds: the headings are labels, as the prose standard's "0. Hard rules" asks.
- "`DOI_MISMATCH`": `grep -n -F 'DOI_MISMATCH'` finds 100, 112 and 147. Holds as the literal D11 (the user) names.
- "`@misc` ... `eprint` and `archivePrefix = {arXiv}`": `grep -n -F 'archivePrefix = {arXiv}'` finds 103. Holds.
- "found", "not found", "no text": `grep -n -F 'printed as no text'` finds 106. Holds.
- "`PASS:`", "`FAIL:`": `grep -n -F 'starting `PASS:`'` finds 47, 112 and 245 to 247. Holds.
- "`sh skills/literature/templates/lookup.test.sh`": `grep -n -F` finds 117. Holds.
- "`sh skills/literature/templates/lookup.test.sh 2>&1 | tail -1`": `grep -n -F 'lookup.test.sh 2>&1 | tail -1`, in'` finds 118. Holds.
- "the agents of `literature`": `grep -n -F` finds 119. Holds, in the form of `docs/glossary.md:44`.
- "the agents of /literature": `grep -n -F` finds 121. Holds, in the form of `.agents/plan.yaml:10`.
- "held in `<file>`", the form of row 76: `grep -n -F 'in the form row 76 uses'` finds 125. Holds. Each lengthened reason sentence stays within the prose standard's "E. Sentence shapes" allowance for a coverage reason cell.
- "Coverage records": `grep -n -F 'section "Coverage records"'` finds 63 and 129. Holds.
- The test strings "Neural Estimation of Mutual Information" (145) and "mutual infor-\nmation estimators" (149), found by `grep -n -F`: hold the standards. Line 149's conflict with item 6 is in section 4.

Findings: line 89's "slug" breaks `docs/dev/skill-layout.md`, "Writing for an agent", against the glossary's **slug**.

## Declined to judge

- Whether open item C and D30 should have stayed open under `references/self-rule.md` kind 3. That is the user's or the orchestrator's call; the facts are in sections 2 and 7.
- Whether the four indexes' facts dated 2026-10-17 still hold beyond my probes, and whether the Read tool uses `pdftotext`. The brief gives no command, and the Read tool's behaviour cannot be shown by one.
- Whether agent material read in every run belongs in `references/` or in reference sections of `SKILL.md`. "Writing for an agent" names `references/` for material needed only in some runs, while `writing` and `code-comments` keep their agent prompts in `SKILL.md` sections. The layout does not settle the question.
- Whether the uncommitted rewrite of step 1's line in `plan.md` is within `/spec`'s authority. That is the `spec` skill's matter.
- Whether doi.org gives BibTeX for `10.52202` DOIs, and whether publishers refuse the script with 403. Neither was probed.

Agent usage: a5a672294bcd03f60, claude-opus-5-5, 220323 tokens, 53 tool uses, 14.6 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

The step stopped on open item D ("A step that does not converge"), so the brief was removed as the `spec` skill's "Steps / The brief check" 4 says. The changes below that close a finding by a change to the brief are made by the next `/spec 9 1`, after the ruling on open item D; the findings marked "open item D" are its choices 1 to 7.

- 1, **finding**, "slug", "loop": the skill's text calls what the editor and the devil's advocate report "issues", calls the two revision passes "two revisions", and calls the output folder "the folder named after the topic"; Conventions name the three glossary terms the skill does not use outside their sense. No `plan-terms.md` entry changes.
- 2, the scan has no writer: item 4 has the scan run the synthesis agent, which writes the per-paper WHY, HOW and WHAT and the cross-paper synthesis. Whether the lit-review and the scan are reviewed: open item D, choice 1.
- 2, the writer agent has no reference file, and the editor and the devil's advocate share one: `references/` gains `writer.md` (each revision and the `/writing` apply), and `review.md` becomes `editor.md` and `devils-advocate.md`; decision 1 and "Paths this step writes" follow.
- 2, the missing parts of the rows: item 5 gains each part the report lists, in the file of the agent the row's reason gives it to: the style profile (a file the user names with the call, given to the synthesis and writer agents as an optional guide; item 3 names it), each agent confined to its own output file (every reference file), the fuller record (the merge rule of open item D, choice 7), row 208's verifier and devil's advocate parts (`verification.md`, `devils-advocate.md`), the title-search fallback and row 214's DOI resolution and web search before "not found" (`verification.md`), the `issued` year (choice 7), row 211's CRITICAL severity and tier sampling (`verification.md`), row 218's synthesis use and bridging-field review papers (`search.md`, `synthesis.md`), row 227's median with an integrity floor (`verification.md`), and row 166's external search filling only the gaps (`search.md`).
- 2, no step runs `quote-check` and `check-urls`: item 7 gains a step after the `/writing` apply and before the temporary folder is removed: the skill runs `check-urls` and `quote-check` on `report.md`; each citation that fails is removed by a fresh writer agent, its claim written as a marked gap and the source listed under "Sources not accessed" or "References not confirmed" with the lookups made (D16); the two commands then run once more and their output stands in the method section.
- 2, computations beyond D11: open item D, choices 4 to 7; `check-urls` on URLs of the report's text is dropped, since D11 names "each cited DOI and URL".
- 2, D13 and D24: item 1's preamble reads "the Rulings section's lines D1 to D12, D14 to D22 and D25 to D33".
- 2, D16's marked gap and the lookups made: item 6 states both.
- 4, C6: "the eight files of ruling B's five edits".
- 4 and 5, T5: the passage is the one line "mutual information estimators", the source text "mutual infor-\nmation   estimators"; the hyphen rule of open item D, choice 5, adds its own case.
- 4 and 5, C13: the id is `math/0601001`, written `math_0601001` (or by the key, open item D, choice 6).
- 4 and 5, C14: a real refusal: a run with `S2_API_KEY` set to a value that is no key, after a probe shows Semantic Scholar refusing it, prints that index's reason line and the other indexes' records and exits 0.
- 4, rule 15: cases for `resolve 10.1016/S0019-9958(57)90116-X` live, for an arXiv title over two lines reaching the `@misc` entry, and for `pdftotext` run with its arguments as a list, never through a shell.
- 4 and 5, `land.test.sh`: removed from Verify 1; the comment changes of the two `plan` templates are checked by C6's `git diff`, and `check_config.test.sh` stays for `templates/plan.yaml`.
- 5, T2: the candidate with the year has the lower ratio. T3: a control body at 0.70 or more that prints no `DOI_MISMATCH`.
- 5, C5: the scratch report holds a passage with a quotation mark, a multi-key citation, a citation with no passage line and a key absent from `references.bib`.
- 5, C7: C4's reading compares the file each reason names with the coverage record.
- 5, C12: run on a `references.bib` copied from the gate library's entry `gritsai2025` (`doi = {10.48550/arXiv.2511.18945}`, no `eprint`); the naming of open item D, choice 6.
- 5, item 10: a quoted `time` over a `fetch` that tries the arXiv HTML and then the PDF, at 3 seconds or more between the two requests.
- 6, the implied inputs: each one whose expected result is a computation of the script is in open item D, choice 7 (or choices 4 to 6); `--out` naming a folder that holds `report.md` is refused with the folder named; a topic that gives an empty folder name is refused, and letters outside ASCII are written `-`; a `LITERATURE_SECOND_MODEL` command that is not found or exits non-zero is named with its status in the method section, and the run goes on; the reading agents run one at a time (D14), so one `lookup.py` reaches arXiv at a time.
- 7, 0002 and the `/writing` pass: open item D, choice 3.
- 7, 0010: named under "What is on the tree", with its sentence on comparing the verify list with the verification page.
- 7, 0015: choice 1; the scan's writer as above; each reference file names the file its agent writes.
- 7, 0016 `curl`: choice 2. 0016 abstract-only: choice 4.
- 8, line 89's "slug": as the first line of this section.
- The `/spec 9 1` run after the ruling on open item D wrote the brief with each change above, and with open item D's seven answers in items 4 to 9, 13 and 14, the cases T5 to T7, C8, C11 to C17 and "Paths this step writes".
- A dictated line added after the check, "The full text is fetched by `lookup.py fetch` into a temporary folder" (`grep -n -F 'fetched by `lookup.py fetch` into a temporary folder' agents/briefs/1.md`): holds; ASCII, one plain sentence, the words open item D's choice 2 rules.
- The dictated labels added after the check, "issues", "two revisions", "the folder named after the topic", "no identifier", "no passage", "no text" and "not found" (`grep -n -F -e '"issues"' -e '"no passage"' agents/briefs/1.md`): hold; none is a term of `docs/glossary.md` (`grep -n -E '^- \*\*(issue|revision|passage)' docs/glossary.md` prints nothing), and each is a plain label under the prose standard's "0. Hard rules".
