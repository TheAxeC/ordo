# 0042. Paper's literature search is academic-paper's, with the report and the .bib written by the strategist

Status: proposed

## Context

Paper's literature search had grown rules that academic-paper 3.2.0 does not have: a fixed split into search themes with one theme run each (ADR 0037), merge jobs and citation rounds started by the session, a merge run and a synthesis start, a screening file and a counts file for each start, a check of each start's transcript with its restarts, and the rule that every query to an index goes through `lookup.py` and that the strategist writes no script (ADR 0041).

- The runs measured the cost. On step 5's request, rc.16's theme runs took 83 to 95 min, 246 to 264 responses and 355,000 to 431,000 output tokens each. academic-paper's two runs on the same request took 25 to 68 min, 52 to 144 responses and 66,000 to 237,000 output tokens, from the runs' transcripts (`.scratch/5-paper/plan.md`, ruling "Paper's lit-review as academic-paper's").
- The user ruled that a rule or an ADR exists only where it makes the product better (same ruling).
- academic-paper's skill text sets no theme run and no merge run. In both of its runs the session chose the split itself (`.scratch/5-paper/agents/reviews/5.N-report.md`, G5 decision D1 and AP2's "Theme split").
- academic-paper's strategist writes scripts. Its second run wrote its annotations as strings in `new.py` for `build.py` to join into the report (`.scratch/5-paper/plan.md`, ruling "The lit-review run under the rules", item 3). The report's sentences and the `.bib`'s entries are content the agent writes from what it read. Under the user's rule that a script computes facts and the agent writes judgment, that content belongs in the agent's own edits. Writing it straight into the files costs no more than writing it as strings in a script.

## Decision

1. `skills/paper/references/literature-strategist.md` is academic-paper's `agents/literature_strategist_agent.md`, copied section by section with the same words in the same order. The only edits are these:
   - `paper`'s names for academic-paper's files and roles;
   - the sentences on roles, skills and mechanisms `paper` has none of, left out, among them the Chinese-language search rules;
   - references to academic-paper's other files pointed at `paper`'s page or left out;
   - the character set and the no-history rule of this repository;
   - the change of item 3.
2. The session decides whether one strategist runs or several with a merge, and writes each start's brief (`SKILL.md`, Steps 8). The decision goes in `config.md` under "Decisions". `SKILL.md` sets no theme split, no merge run, no merge job, no citation round and no synthesis start. In lit-review mode the one strategist, or the merge, writes the annotated bibliography, the literature matrix and the synthesis analysis.
3. The strategist writes its report file and its `.bib` with its own Write and Edit tools, straight into the files. No script writes or assembles them. A script of the strategist's own that queries an index, fetches a page or counts records is allowed, and it and the texts it fetches stay in the start's folder of the run's temporary folder (ADR 0020). The manuscript's `.bib` in full and revision mode still changes only by a patch, as `SKILL.md`'s Rules say. The rule of this item stands once, in the strategist's page under "Output Format".
4. Removed from the search:
   - the `lookup.py`-only rule and the strategist's command list;
   - the lock and skip files of Steps 7;
   - the screening and counts files;
   - the strategist check;
   - the section "The prompts of a literature search";
   - the theme search, the merge jobs, the citation rounds with the stop "The citation loop does not close", the merge run, the synthesis start and the joining of files with `cat`;
   - lit-review item 4's checks other than the identifier check;
   - lit-review mode's split of the research question into parts.
   The `lookup.py` commands stay in the script.
5. Kept:
   - the session's identifier check, `lookup.py resolve` over every entry of `refs.bib` in lit-review items 2 and 4, and over the entries added or corrected at the sources' review in item 6;
   - under strict, a failing identifier going to the strategist that wrote `refs.bib`;
   - the stop "The sources' review";
   - the intake, the run folder and the final message;
   - each mode's own inputs to the strategist;
   - lit-review item 7, the formatter for a target other than `markdown`.

## Alternatives rejected

- A patch of step 5.O's design: every rule it keeps is one academic-paper's text does not have, and the measured cost comes from those rules.
- A ban on query scripts: academic-paper's strategist writes them, and a query script computes facts, which the user's rule gives to scripts.

## Consequences

The strategist follows academic-paper's page, and the session writes each brief from the request. A run's structure can differ from run to run, as academic-paper's two runs differ, and `config.md` records the structure chosen. The files the change reaches are:

- `skills/paper/SKILL.md`, `skills/paper/references/literature-strategist.md`, `skills/paper/references/intake.md` and `skills/paper/references/modes.md`;
- the status lines of ADRs 0017, 0027, 0032, 0036, 0037, 0038, 0040 and 0041, and `docs/adr/README.md`;
- `docs/glossary.md`, `docs/academic-coverage.md` and `README.md`;
- both figure scripts and the figures they write.

ADRs 0037 and 0041 are superseded whole. ADR 0017 is superseded in the strategist's search, ADR 0038 in lit-review mode's split and the strategist's use of the parts, ADR 0040 in the entries the strategist writes from the record it confirmed, and ADR 0032 in the confirmation of each kept reference by a live lookup, which lit-review's identifier check alone keeps. ADR 0036's refinement by 0040 on ASCII entries ends, so the strategist writes its entries under no character rule, as academic-paper's strategist does. ADR 0032's search through each database's own interface and ADR 0036's sentence that the session decides the starts are restored for the search.

An outline-only run's `refs.bib` is not resolved by the run: outline-only mode has no identifier check, and the strategist's own confirmation of each entry by a live lookup ends with this record. A full run's references are checked by the citation compliance agent, and a lit-review run's by its identifier check.
