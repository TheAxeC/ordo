# Step 1 brief check (on main at f8cde68)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## 1. Names

The command: `git grep -n -E "<name>" -- . ':!.scratch/archive'`, with the brief itself left out, run for each of `check-urls`, `quote-check`, `cite-keys`, `lookup\.py`, `lookup\.test\.sh`, `anchorize_tex`, `apply_tex_patch`, `references\.bib`, `skills/paper/templates`, `block-manifest` and `apply-report`. Archived ledgers were left out because they are history. These are the hits outside "Paths this step writes":

- `.scratch/5-paper/plan.md` (lines 7, 11, 13, 14, 20 to 22, 34, 37, 46 to 49, 52, 54, 55, 71, 79, 91, 92, 94), `.scratch/5-paper/orchestrator-state.md:55,73`, `.scratch/choices.md:373-378`. These are ledger records. The two that describe `references.bib` (`plan.md:91`, `choices.md:375`) describe commit 0074728 and stay true. None is made false.
- `docs/adr/0017-...md:11`: "`check-urls` reads the manuscript's `.bib` and the `\cite`-family keys of its `.tex`. The key check ... prints each key the `.bib` lacks and each `.bib` entry no `\cite` uses." The change makes this true. It is not made false.
- `docs/adr/0017-...md:16` (an alternative it rejects: the key check in a script of its own). Not made false.
- `docs/adr/0018-...md:7,11,21`: "`lookup.py quote-check` checks that it occurs in the fetched text". This still holds with the new argument form. Not made false.
- `docs/adr/0020-...md:7,11`: the manifests and apply reports. Not made false.
- `docs/roadmap.md:24,25,59,61,203`: entry 5's goal and gate, entry 15's "`paper`'s `lookup.py`", and entry 9 dropped. The change makes these true. None is made false.
- `docs/academic-coverage.md:58,94,151,195,208,211,212,213,215`: row 94 says "Entry 5 moves in `anchorize_tex.py` and `apply_tex_patch.py`", which the change makes true. The other rows describe source files. None is made false.
- `block-manifest` and `apply-report` have no hit outside the brief.
- `git grep -n 'literature' -- docs/dev skills README.md` printed nothing. So the head comment's "/literature" leaves no hit outside the file.
- The brief does not list one name inside the changed file: `lookup.py:95` at 0074728, `USER_AGENT = "lookup.py (the literature skill of Ordo)"` (`git show 0074728:skills/literature/templates/lookup.py | grep -n 'USER_AGENT = '`). This string is sent in the User-Agent header of every request. See the finding below.

Findings:
- F1.1. Item 4 says `lookup.py` is "the file of commit 0074728, with these changes and no others", and Verify 4 limits the hunks to the head comment, check-urls, quote-check, cite-keys, the key reader and the dispatch. But Verify 7, `grep -rn 'literature\|research-hub\|this hub\|tools/manuscript' skills/paper/templates/`, will print `lookup.py:95` unless `USER_AGENT` is changed. `USER_AGENT` sits in `Client`, which every command uses, so changing it also changes the requests of resolve, search, refs, cited-by, bibtex and fetch, which item 4 and D15 keep "as they are". The brief has to choose: list the `USER_AGENT` change in item 4 and Verify 4, or exempt the line from Verify 7.

## 2. The step line

Each part of step 1's line in `plan.md`, with the requirement that serves it:

- "`anchorize_tex.py` and `apply_tex_patch.py` copied from `research-hub/tools/manuscript`": items 1 and 2, and Verify 3.
- "research-hub keeping its copy (D14)": the premise "read only for this step" and "Read" 1. No item of What to build states it, but the read-only rule covers it.
- "each with a new offline test in `skills/paper/templates/`": item 3, and cases A1 to A4 and P1 to P8.
- "`lookup.py` and `lookup.test.sh` taken from commit 0074728": items 4 and 6.
- D15 "check-urls reading the manuscript's `.bib` and the `\cite` keys of its `.tex`": item 4, third bullet, and item 5.
- D15 "quote-check reading the passage lines of the integrity record": item 4, fourth bullet.
- D15 "the head comment naming `paper`": item 4, first bullet.
- D15 "the test changed with the two commands": item 6.
- D17 "an offline command that reads the `\cite`-family keys ... prints each key the `.bib` lacks and each `.bib` entry no `\cite` uses": item 4, second bullet, and item 5.
- D17 "the DOI check, check-urls' status for each cited entry with resolve's `DOI_MISMATCH` below a title similarity of 0.70": item 4, third bullet.
- "the three tests added to the verify list in `docs/dev/building.md` and `docs/dev/change-standard.md`": item 7, first and second bullets.
- "the scripts listed in `docs/dev/scripts.md`": item 7, third bullet.
- "ADR 0017 followed": items 4 to 6, and the ADR quoted under "What is on the tree".
- "the check: each test exits 0 with its `PASS:` line": Verify 1.
- "the cases of the two new `lookup.py` commands first run on the unchanged tree": the first-run paragraph of Cases, and Verify 2 and 5.
- "(1 commit)": no requirement. This is the session's commit at landing, not builder work.

Every part of the line has a requirement.

Findings:
- F2.1. Item 4 adds a decision that the step line, D17 and Open item B do not hold, and "Decisions taken in this brief" does not list it. The brief says "with no record found the line says the doi was not found" and "a doi not found also counted as failures". D17 and Open item B (a) name only `DOI_MISMATCH` below 0.70. The decision belongs in the Decisions list, with the case F6.9 below.
- F2.2. Item 7, third bullet, asks for the three tests "each with its job". The "Test scripts" table of `docs/dev/scripts.md` has the columns Script and Proves, not Job (`cat docs/dev/scripts.md`). "In the tables' form" resolves this, but the words disagree with the table.
- Note (no change needed): Open item B option (a), at `plan.md:92`, says "One function reads the cited keys for all three". quote-check takes no `.tex`. The brief's item 5, "one function that `cite-keys` and `check-urls` both call", is the form the closing ruling at `plan.md:79` allows.

## 3. Premises

Each command of "What is on the tree", rerun:

- `ls skills/paper` printed `ls: skills/paper: No such file or directory`, exit 1. Holds.
- `wc -l ../research-hub/tools/manuscript/*.py ../research-hub/tools/manuscript/README.md` printed `130 anchorize_tex.py`, `263 apply_tex_patch.py`, `38 README.md`. `ls -a` lists `__pycache__ . .. anchorize_tex.py apply_tex_patch.py README.md`. Holds.
- `grep -n 'add_argument\|block-manifest' .../anchorize_tex.py` printed `103: ap.add_argument("tex")`, `104: ap.add_argument("--print-blocks", ...` and `109: out = Path(str(path) + ".block-manifest.json")`. The assert is at `anchorize_tex.py:120`. Holds.
- apply_tex_patch.py: the arguments are at `apply_tex_patch.py:191-196`. `fail(2, ...)` is at `:76,:87,:130,:246`, `fail(3, ...)` at `:210` and `fail(4, ...)` at `:253`. Holds, with two omissions:
  - P3.1. `apply_tex_patch.py:243` `ap.error("--output is required unless --check-only is used")` is a second argparse error that exits 2. The premise names only "argparse's own usage error".
  - P3.2. Both scripts exit 1 with a Python traceback on an input they cannot read. Run in a scratch folder under `$TMPDIR` on copies:
    - `python3 -B anchorize_tex.py nosuch.tex` printed `FileNotFoundError: [Errno 2] No such file or directory: 'nosuch.tex'` and exited 1.
    - `python3 -B apply_tex_patch.py m.tex p.json` with no manifest printed `FileNotFoundError: ... 'm.tex.block-manifest.json'` and exited 1.
    - A patch file holding `not json` printed `json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)` and exited 1.
    - The premise lists exits 0, 2, 3 and 4 only.
    - Items 1 and 2 require the head comment to list "every exit status it returns", so the brief should state exit 1 and its causes as a premise.
- Head comments (`sed -n 1,48p` of each, grepped for hub, installed and tools/manuscript) printed `anchorize_tex.py:6 ... so this hub anchors`, `:18 python3 tools/manuscript/anchorize_tex.py` and `apply_tex_patch.py:4 The hub's LaTeX-native stand-in`, `:5 skill's own toolchain is not installed here`, `:39-42 tools/manuscript/...`. Holds.
- `git show 0074728 --stat` lists `skills/literature/templates/lookup.py | 1323` and `lookup.test.sh | 333`. `wc -l` of each `git show` gives 1323 and 333, and `ls skills/literature` printed `No such file or directory`. The head comment line 2 reads "Make every reference lookup of the /literature skill". The commands at `lookup.py:5-13` and `references.bib` at `lookup.py:1049-1051` match. Holds.
- The test's `PASS:`/`FAIL:` line and exit status. The last line is `echo "PASS: lookup.py parses recorded bodies, ...`. `lookup.test.sh:327-330` prints `FAIL:` and exits 1. Holds.
  - P3.3. The import "from its own folder" is at `lookup.test.sh:19-20` (`sys.path.insert(0, sys.argv[1])`, `import lookup`). The command the brief cites, `sed -n 1,12p`, does not show it. The claim holds, but the cited command does not show it.
- Running the 0074728 test from a scratch copy printed `PASS: lookup.py parses recorded bodies, ...` and exited 0, which supports the brief's "L7 passes there".
  - The unchanged commands, run from the same copy: `cite-keys a b` printed `usage: lookup.py <command> ...`, exit 2; `check-urls a b` printed `error: check-urls takes <report>`, exit 2; `quote-check a b c` printed `error: quote-check takes <report> <folder>`, exit 2.
  - These match the "Unchanged" results of L1, L5 and L6.
- `grep -rhoE '\\(no)?cite[a-zA-Z]*\*?' --include='*.tex' projects | sort | uniq -c` printed `2348 \cite`, `114 \citep`, `28 \citet`. Holds.
  - P3.4. `grep -rhoE '\\bibliography\{[^}]*\}' ... | sort | uniq -c` printed the four forms the brief gives (23, 16, 3, 2) and also `\bibliography{referenties}`, `{references/hccnet_fl}`, `{references/hcc_study}`, `{IEEEabrv,main}` and `{IEEEabrv,../bib/paper}`, 1 each. The premise is incomplete. It does not change the design, since under ruling B (a) the `.bib` is named on the command line, and `IEEEabrv` is IEEE's `@STRING` file, which `parse_bib` skips.
- `\input{body.tex}` and `\input{tables/results_reliability}`: both found, 72 `\input`/`\include` calls in all. Holds.
- The verify list and the filtered list each hold 7 commands (awk counts of the `sh` block of `docs/dev/building.md` and of the block under "Commands and their filters": 7 and 7). `docs/dev/scripts.md` has three tables (Development, User, Test). The premise says two tables "list user scripts and test scripts", which is true of those two.
- The state file's verify list equals the change-standard block: a read-only Python compare printed `7 7 True`. `git log --format='%h %ci' -1 -- docs/dev/building.md` printed `c613bd2 2026-10-18 14:48:46`. The plan opened at `98db600 2026-10-19 10:45:50`. Holds.
- The quotes from ADRs 0017, 0018 and 0020 match their Decision and Consequences sections (`awk '/^## Decision/...' docs/adr/*.md`). Holds.
- The five real cases of Decision 1: each was found by `grep -rlF` (`covert-theory/manuscript/main.tex` three times, `linfoot-estimator/manuscript/main.tex`, and `ward-bttr-crosssubject/manuscript/body.tex:165` under `\section{Related Work}` at `:160`). Holds.

Findings: P3.1, P3.2, P3.3 and P3.4 above. P3.2 is the one a requirement depends on.

## 4. Cases and checks

Read against `docs/dev/change-standard.md` ("Scripts compute facts; judgment is read", rules 1, 13, 14, 15 and 16) and the standards pages:

- Each case is an input with its expected result, as "Cases" requires.
- The rule-13 control for a silent result is present: L2 against L1, the "no DOI_MISMATCH" half of L5 against its below-0.70 half, P7 against P1, and L3's `\%` against L1's `% \cite{f}`.
- Defining "the unchanged tree" for A1 to P8 and L1 to L7 as scratch copies is consistent with rule 13's "where it can run there". At the base, `skills/paper/` does not exist.
- Every case has happened in the hub's manuscripts or costs something when wrong. For example, `grep -rcE '\\%.*\\cite'` counts 29 lines like L3's `\%` case.

Findings:
- F4.1. Rule 15 makes each place where a supplied value reaches a command, a path or generated text a case. "Values that reach a path" names the `\input` names (L3, L4) but not the new place this step adds: a `.bib` entry's `doi` reaching the Crossref, OpenAlex and Semantic Scholar URLs of check-urls' title lookup. The existing kept test covers `quote_doi` (`lookup.test.sh:282-283`) and the status URL (`:301`), not the new call site. Expected result: the doi is stripped and percent-encoded as `resolve` does, for example `10.1000/a#b?c` requested as `.../works/10.1000/a%23b%3Fc`.
- F4.2. The plan's answer for step 1 says the copied scripts' cases follow coverage row 94. Row 94 reads "one stale hash rejects the whole patch, structural changes need acknowledgement" (`grep -n revision_patch_protocol docs/academic-coverage.md`). P2 is one op, so the "whole patch" part has no case (see F6.1). P5 covers one of the three structural triggers named at `apply_tex_patch.py:150-169` and in research-hub's README "On exit 3" (see F6.2).
- F4.3. P8 does not name the file's block count. Two ops on a file of three blocks give 2/3 = 0.667, above `BLOCK_RATIO_LIMIT = 0.6` (`apply_tex_patch.py:55,159`), so the patch exits 3, not 0. A `delete_block` of a block holding `\section` changes the section count and also exits 3. The case should give a block count and op layout that stays under both, or say the ops are separate patches.
- No case asks the builder to check, quote or explain a place the step does not change.

## 5. The question

"Could this pass without the goal being reached?" The goal here is the three scripts with their tests passing in the skill, and the `\cite`-against-`.bib` check and the DOI check made by `lookup.py` passing their tests.

- The check on the step's line ("each test exits 0 with its `PASS:` line, the cases of the two new `lookup.py` commands first run on the unchanged tree"): yes. On the unchanged tree every L case fails because `cite-keys` does not exist or the argument count is refused (section 3: `usage: lookup.py <command> ...`, `error: check-urls takes <report>`). A failing first run therefore proves only that the command is absent, and a `PASS:` line proves only what the test asserts. What holds the goal is the content of the cases, and the cases miss the forms in F6.3 to F6.9.
- Item 1 (anchorize copy), checked by Verify 3 and A1 to A4: no. Verify 3 pins the code to research-hub's, and A1 to A4 run it.
- Item 2 (apply copy), checked by Verify 3 and P1 to P8: no for the code, which Verify 3 pins. The test, though, can pass with the whole-patch rejection and two of the three structural triggers unasserted (F4.2), so the test kept "in the skill" proves less than row 94.
- Item 3 (the two tests): no, given the cases. The reviewer reads the assertions.
- Item 4 (the lookup.py changes), checked by Verify 4 and L1 to L7: yes, in part.
  - L5 asserts only a recorded Crossref title. An implementation that asks Crossref alone passes L5 and then reports "doi not found" for the 14 arXiv DOIs (`10.48550/...`) in the hub's `.bib` files, which Crossref does not hold (F6.8).
  - L6 asserts the passages but not that the named `.bib` is the one the "no entry" check reads (F6.10).
- Item 5 (the key reader), checked by L1, L3 and L4: yes. A reader that misses `\cite {k}`, a `\cite` whose keys run onto the next line, `\cite{a, b}`, `\input{body.tex}`, nested `\input`s or a commented `\input`, or that resolves names against the working directory, passes L1, L3 and L4 and gives wrong answers on hub manuscripts (F6.3 to F6.7).
- Item 6 (the test): no. L7 and the kept cases can be checked by reading the diff of the test.
- Item 7 (the pages), checked by Verify 6 by reading: no.
- Verify 3: its wording, "the head comment left out, prints only the head comment's lines", says two things. With the head comment left out the diff prints nothing; with it kept, it prints only the head comment's lines. Either reading pins the code, so the answer is no, but the brief should say which.
- A1: no. A2: no. A3: no. A4: no. The rebuild assertion holds only for ordered, non-overlapping spans, a real property.
- P1: no. P2: no for one op, and yes for row 94's "whole patch" (F6.1). P3: no. P4: no. P5: no. P6: no. P7: no. P8: no, once F4.3 is fixed.
- L1: no, though the order requirement of item 4 ("each list in the order the keys first occur") is not exercised, since L1 gives one missing key and one unused key.
- L2: no.
- L3: yes, if the test runs from `main.tex`'s folder. A reader that resolves names against the working directory then passes (F6.7).
- L4: yes, if the test asserts the exit status alone, since the unchanged tree's usage error also exits 2. The case's "one error line naming the file" must be asserted.
- L5: yes, in part (F6.8, F6.9).
- L6: yes, in part (F6.10).
- L7: no.

## 6. Implied inputs

The rules file's rule from "Scripts compute facts; judgment is read" applies: a script handles a case only when that case has happened or when a wrong answer on it costs something. Each implied input missing from Cases that meets that rule, with its expected result:

- F6.1. A patch with two ops, one with a valid `old_hash` and one with a stale `old_hash`. This is row 94's rule, and a wrong answer applies part of a revision. Expected: exit 2, kind `validation`, no output file, the base byte-identical (`apply_tex_patch.py:108-112,129-130`).
- F6.2. A patch touching more than 60 percent of the blocks, and a patch whose `delete_block` removes a `\section` block. A wrong answer applies a structural change without acknowledgement. Expected: exit 3 for each, with the flags `block_touched_ratio ... exceeds 0.6` and `section count changes from <n> to <m>` (`apply_tex_patch.py:158-164`).
- F6.3. `\cite {key}`, with whitespace between the command name and the brace. This has happened: `grep -rnoE '\\cite[a-zA-Z]*[ ]+[\[{]'` hits `archive/phd/phd-thesis/manuscript/chapters/chapter-4/chapter-4.tex:26` (`linear regression \cite {liang2012decoding}`) and further lines at `chapter-4.tex:251,253,255` and `chapter-5.tex:194,196,198`. Expected: `liang2012decoding` read. Item 5 does not say whether whitespace before the argument is skipped.
- F6.4. A `\cite` whose keys run onto the next line. This has happened: `manuscripts/covert-theory/manuscript/main.tex:635` `~\cite{steinke2017between,` with `bun2014fingerprinting}` on line 636, and `manuscripts/bttd-source-eeg/manuscript/main.tex:418`. Expected: both keys read. Item 5's per-line `%` rule must not cut the call at the line break.
- F6.5. `\cite{a, b}`, keys separated by a comma and a space. This has happened: 151 calls (`grep -rhoE '\\cite[a-zA-Z]*(\[[^]]*\])*\{[^}]*, [^}]*\}' ... | wc -l`). Item 5 states it, but no case holds it (L1 uses `\cite{a,b}`). Expected: `a` and `b`, with no key carrying a space.
- F6.6. `\input{body.tex}`, a name that already ends in `.tex`. This has happened: 10 hits, among them `manuscripts/ward-bttr-crosssubject/manuscript/main.tex:65`, the manuscript of the gate's lit-review topic. Expected: `body.tex` read, not `body.tex.tex`. L3 covers only names without an extension.
- F6.7. A nested `\input` and the working directory.
  - This has happened: `manuscripts/hccnet-revision/manuscript/sections/4_experiments/d_results.tex:1` `\input{tables/results_finetune}`, where `tables/` sits beside `main.tex`, not beside `d_results.tex`.
  - Expected: the nested file's name read relative to the main file's folder, and the keys of every file reached read, with the command run from a working directory other than the main file's folder, as the skill runs it.
  - A commented `\input` has also happened: `archive/published/2026/hccnet-fl/manuscript/main.tex:80` `% \input{sections/8_acknowledgment}` and `manuscripts/dries-bttr-ecg/notes/thesis/main.tex:120` `% \include{...}`. Expected: not followed, and no error when the file is absent.
- F6.8. A doi that Crossref does not hold, where OpenAlex or Semantic Scholar does. This has happened: a read-only Python count over the hub's `.bib` files printed `{'bare': 402, 'arxiv': 14, 'url': 4, 'datacite-zenodo': 2}`, with an arXiv DOI in `manuscripts/dongho-ecg-clustering/manuscript/refs.bib` (`10.48550/arXiv.2601.21830`), the gate's manuscript. Expected, on recorded bodies: Crossref answers 404, and the ratio is taken against the next index's title in the order Crossref, OpenAlex, Semantic Scholar, with no "doi not found".
- F6.9. Every index left out. HTTP 429 and failed connections are the failures `lookup.py` already handles (`lookup.py:47-50` of its head comment). Under item 4's wording "with no record found the line says the doi was not found", an outage would print that real DOIs were not found, and row 195 has a fabricated reference removed. Expected (for the brief to state): the line gives each index's reason, says nothing of "not found", and counts as a failure.
- F6.10. quote-check with a key the named `.bib` holds and a key it lacks. Expected: no "no entry" line for the first and `<key>: no entry` for the second, so the test shows that the `.bib` named on the command line is the one read.
- F6.11. A `.bib` title in braces, such as `title = {{Estimating} Mutual Information}`. This has happened: 135 of 2037 `title =` lines in the hub's `.bib` files start with `{{` (`grep -rhiE '^\s*title\s*=\s*\{\{' --include='*.bib' . | wc -l`). A wrong answer is a false `DOI_MISMATCH`. Expected: a ratio of 0.70 or more against the recorded title "Estimating mutual information", as `normalise_title` gives (`lookup.py`, `normalise_title`).
- F6.12. A `doi` field in URL form, `https://doi.org/10...`. This has happened 4 times, in `manuscripts/dongho-ecg-clustering/notes/thesis/referenties.bib`. Expected: stripped as `entry_url` strips it (`strip_doi`) before the title lookup.
- F6.13. The exit-1 paths of the two copied scripts (P3.2): a missing `.tex`, a missing manifest, a patch that is not JSON. These need no case, since the code is copied unchanged and the failure leaves the base untouched. The head comment must list them, and the brief should say so in items 1 and 2.

Implied inputs that do not meet the rule, so no case is needed:
- An `\input` cycle, and an `\input` naming `..` (`grep -rnE '\\(input|include)\{[^}]*\.\.'` printed nothing).
- `\cite*` (no hit), `\cite` inside a macro definition (`grep ... '#'` printed nothing), and the brace-less `\input name` (one hit, inside a comment).
- A `.tex` that cites no key. The line printed today, "the report cites no key" (`lookup.py:596,1159`), would name a report the commands no longer read. This is no case, but its words are for the brief to state (see 8).

## 7. ADRs

Every record was read through its status line and its Decision and Consequences sections (`for f in docs/adr/00*.md; do sed -n 1,8p "$f"; awk '/^## Decision/{p=1} ...' "$f"; done`). 0003 is "superseded by 0013" and 0016 is "superseded by 0018", wholly. The others are `proposed`.

The records the step touches:

- 0017: "`check-urls` reads the manuscript's `.bib` and the `\cite`-family keys of its `.tex`. The key check reads the `\cite`-family keys of the `.tex` and of every file it `\input`s or `\include`s, and prints each key the `.bib` lacks and each `.bib` entry no `\cite` uses." Its Consequences add: "The script and its offline test, with recorded responses, are kept with `paper`, and the script is listed on `docs/dev/scripts.md`." The brief names it. No contradiction.
- 0018: "The passage is written into the run's integrity record as a passage line with its locator, and `lookup.py quote-check` checks that it occurs in the fetched text." The brief names it. No contradiction.
- 0020: "A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` ... the manifests, the patches, the apply reports". The brief names it.
  - It is not contradicted: the step keeps the scripts' write places and leaves the placement to step 2.
  - `anchorize_tex.py` has no option for the manifest's place (`anchorize_tex.py:109`), so step 2 can place it only by moving it, which the brief says ("moving the files").
- 0010: "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ... On a difference, the session rewrites the list in the state file and names the change in the brief or the booking."
  - The step changes the verification page (`docs/dev/building.md`), so the landing must rewrite the state file's verify list, which goes from 7 to 10 commands.
  - Not named under "What is on the tree", though the brief's verify-list premise touches it.
- 0019: "The run stops for the user ... at the acknowledgement of a structural patch." This governs the `--acknowledge-structural` behaviour (exit 3) that the step brings into the tree (P5). Not named.
- 0021: "The draft writer writes each accepted finding's fix as a patch, applied through anchorize, patch and apply". This governs the two scripts the step adds. Not named.
- 0001, 0002, 0004 to 0009 and 0011 to 0014 govern files, names or behaviours the step does not change. 0013 and 0014 name rows of `docs/dev/scripts.md` that the step keeps.

No part of the brief contradicts a record in force.

Findings:
- F7.1. "No other ADR touches the step" (`grep -n 'No other ADR touches the step'` gives line 22) is false for 0010, 0019 and 0021. Under "What is on the tree", each of these records should be named with its decision sentence, and 0010 with the landing's rewrite of the verify list.

## 8. Dictated text

Each line of text the brief dictates for a file, with the `grep -n` that finds it in `.scratch/5-paper/agents/briefs/1.md`:

- `cite-keys <main.tex> <file.bib>` (`grep -n 'cite-keys <main.tex> <file.bib>'` gives 34). Holds.
- `missing: <key>` and `unused: <key>` (`grep -n 'missing: <key>'` gives 34). Holds. These are plain lines for a person to read, as "Scripts compute facts; judgment is read" asks of what a tool gives the user.
- `check-urls <main.tex> <file.bib>` (`grep -n 'check-urls <main.tex> <file.bib>'` gives 35 and 75). Holds.
- "no identifier", "no entry in <the .bib's file name>", "failed, <reason>" (`grep -n 'no entry in <the'` gives 35), and L5's "no entry in <file.bib's name>" (75). Holds. The two forms say the same thing.
- `DOI_MISMATCH` (`grep -n 'DOI_MISMATCH'` gives 35 and 75). Holds. It is the identifier `resolve` already prints, not ALL-CAPS emphasis in prose (prose standard, F).
- `quote-check <integrity record> <file.bib> <folder>` (`grep -n 'quote-check <integrity record> <file.bib> <folder>'` gives 36). Holds.
- `> [@<key>, <locator>]: "<passage>"` (`grep -n '> \[@<key>, <locator>\]: "<passage>"'` gives 36). Holds. It is the format `lookup.py` reads today.
- The usage paths in head comments. The brief requires "its usage with the path `skills/paper/templates/anchorize_tex.py`" (line 29), "usage with `skills/paper/templates/` paths" (line 30) and "the scripts' paths are `skills/paper/templates/...`" (line 140), found by `grep -n 'usage with the path\|usage with .skills/paper/templates/. paths\|the scripts. paths are'`. This breaks:
  - `docs/dev/change-standard.md`, "Rules this repository already states", first bullet: "The skills carry no project name and no path" (`README.md`, first paragraph).
  - `docs/dev/skill-layout.md`, "Paths and names": "A file of this skill is named from the skill's folder: `templates/<file>`".
  - The installed skill runs from the pinned worktree through the skill links, not from `skills/paper/templates/` of the manuscript's repository. Every other script under a skill's `templates/` writes its usage with the bare script name: `prose_facts.py:4` `Usage: prose_facts.py <draft> <prose standard>`, `check_config.py:4` `Usage: check_config.py [repository root]`, and `strip_comments.py:52` `usage: strip_comments.py <file>`. `lookup.py` at 0074728 does the same (`lookup.py <command>`).
- The three test commands for the pages (`grep -n '2>&1 | tail -1'` gives 147, 148, 149, and 43 for the filter). Holds.
- "Everything in the brief is done" (`grep -n 'Everything in the brief is done'` gives 170). Holds.
- `LC_ALL=C grep -n '[^ -~]' .scratch/5-paper/agents/briefs/1.md` printed nothing: the brief is printable ASCII.

Findings:
- F8.1. The usage-path lines 29, 30 and 140, as above.
- F8.2. Item 4 gives no words for the doi title check's addition to a check-urls line, or for "the doi was not found". The no-key line `the report cites no key` (`lookup.py:596,1159`) would name a report that check-urls and quote-check no longer read. These are printed lines of a user script, which the skill text of step 2 will quote, so the brief should give their words. Without them, rule 4 of the rules file leaves the shape of a user-visible output to the builder.
- F8.3. A consequence the brief does not name: `apply_tex_patch.py:189` builds its parser with `description=__doc__`, so rewriting the head comment changes what `--help` prints. Item 2 says "same behaviour". Item 2 or the report's "user-visible change" part should name the `--help` change as intended.

## Declined to judge

- Which way F1.1 is settled: changing `USER_AGENT`, which changes every command's request header against D15's "as they are", or exempting the line from Verify 7. This is the orchestrator's call between two of the brief's own requirements.
- Whether a doi with no record found, and an outage of every index (F6.9), should count as failures. This is a user-visible exit-status semantic the rulings do not fix (F2.1). It is the orchestrator's call under self-rule, or the user's.
- Whether the copied `anchorize_tex.py` should keep counting `\begin{...}` inside a `%` comment toward the environment depth (`anchorize_tex.py:55-57`). This happens only in `manuscripts/dongho-ecg-clustering/notes/thesis/main.tex:419,430,589,1101,1104` and in no `manuscripts/*/manuscript` file (`grep -rnE '^[^%]*%.*\\begin\{(figure|table|equation|align)' --include='*.tex' manuscripts/*/manuscript` printed nothing). D14 copies the behaviour, so a change would need a ruling.
- The key reader's behaviour on every hub manuscript was not run, since no implementation exists yet. The forms in F6.3 to F6.7 were found by grep, not by running a reader.
- Whether OpenAlex and Semantic Scholar hold the 14 arXiv DOIs of F6.8. This needs the network, and the case uses recorded bodies.

Agent usage: a68298ac67b2eca9f, claude-opus-5-5, 254482 tokens, 50 tool uses, 12.4 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- F1.1, `USER_AGENT` against Verify 7: item 4's first bullet now changes `USER_AGENT` to `lookup.py (the paper skill of Ordo)`, Verify 4 lists it, and decision 5 gives the reason; Verify 7 stands.
- F2.1, the doi not found: decision 4 states it, with the words in item 4, and cases L5a and L5b cover it.
- F2.2, the Proves column: item 7's third bullet now says "each with the script it proves, in the tables' columns".
- P3.1 and P3.2, the second argparse error and the exit-1 tracebacks: added to "What is on the tree", and items 1 and 2 require the head comments to list them.
- P3.3, the cited command: now `sed -n 1,22p`, lines 19 and 20.
- P3.4, the other `\bibliography` forms: added to "What is on the tree".
- F4.1, the doi reaching the title lookup's URLs: case L5d, and the paragraph on values that reach a path or a URL.
- F4.2, F6.1 and F6.2, row 94's whole-patch rejection and the other structural triggers: cases P9, P10 and P11.
- F4.3, P8's layout: P8 now gives five blocks, two touched, no heading.
- F6.3 to F6.7, the key reader's forms: item 5 states each, and case L3 holds each, run from another working directory; L1 now has two missing and two unused keys for the order.
- F6.8, F6.9, F6.11 and F6.12: cases L5a, L5b, L5c and L5d, and item 4's words.
- F6.10: case L6 now holds a key the named `.bib` lacks.
- F6.13: items 1 and 2 require the exit-1 paths in the head comments; no case, as the report states.
- F7.1, ADRs 0010, 0019 and 0021: named under "What is on the tree" with their decision sentences.
- F8.1, the usage paths: items 1 and 2 and the Conventions now ask for the bare script name.
- F8.2, the words of the check-urls lines: item 4 dictates them, and `the .tex cites no key`.
- F8.3, `--help`: added to "What is on the tree", and item 2 asks the report to name the change.
- Verify 3's wording: now "prints only lines of the head comment (the module docstring)".
- L4's assertion: L4 now asserts the error line as well as the exit status.
- Declined to judge, the comment-depth of `anchorize_tex.py`: decision 6 keeps it, under D14.
- Dictated line added after the check, `USER_AGENT` reads `lookup.py (the paper skill of Ordo)`: holds; it names the skill as the head comment does (prose standard, no rule broken).
- Dictated line added after the check, `<key>: <status> <url>, ratio <r> against <index>` with `, DOI_MISMATCH`: holds; plain words for a person, the identifier `resolve` already prints.
- Dictated line added after the check, `<key>: <status> <url>, doi not found in Crossref, OpenAlex or Semantic Scholar`: holds.
- Dictated line added after the check, `<key>: <status> <url>, title not checked: <index> left out, <reason>`: holds; it reuses the "left out, <reason>" words the script prints today.
- Dictated line added after the check, `the .tex cites no key`: holds.
