Everything in the brief is done.

# Report: step 1, the paper skill's scripts and their tests

## Open items of the state file

- none.

## The cases' first run

The unchanged tree, as the brief defines it: the two research-hub scripts copied to `$TMPDIR/b1/hub/` (checked equal to the originals with `cmp`, printing `hub copies unchanged`), `lookup.py` of commit 0074728 written to `$TMPDIR/b1/lk/lookup.py` by `git show 0074728:skills/literature/templates/lookup.py` (`cmp` against the written copy printed `lk/lookup.py is the 0074728 file`), and the new test beside each. Each test runs its cases as named checks and prints one line per check that fails, so a passing run prints only its `PASS:` line.

No case is one the brief's own rules get wrong: A1 to A4 and P1 to P11 pass on the unchanged scripts, L1 to L6 fail on `lookup.py` of 0074728 for the reason the brief states, and L7 passes. No ruling was needed.

### A1 to A4 (anchorize_tex.py)

Command: `cd $TMPDIR/b1/hub && sh anchorize_tex.test.sh; echo $?`. Output (A1 three blocks and the .tex byte-identical, A2 the table is one block, A3 the paragraphs inside the document environment are separate blocks, A4 the spans, the whitespace outside the blocks, the character counts and the file's hash; the checks are named A1 to A4 in the test and none printed a failure line):

```
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
exit 0
```

### P1 to P11 (apply_tex_patch.py)

Command: `cd $TMPDIR/b1/hub && sh apply_tex_patch.test.sh; echo $?`. P1 replace_block with the manifest's hash (output, base, apply report naming the op, block B0002 and `["R2-1b", "R2-2a"]`), P2 wrong old_hash (exit 2, kind validation), P3 stale manifest (exit 2, kind stale-manifest), P4 two ops on one block (exit 2), P5 heading rewritten (exit 3 without the flag; exit 0 with it and the flag in the apply report), P6 output equal to the base, written two ways (exit 2), P7 --check-only (exit 0, nothing written), P8 insert_after on block 2 with delete_block on block 4 of five (exact output text), P9 one good op and one stale op (exit 2, no output), P10 four of five blocks (exit 3, `block_touched_ratio 0.800 ... exceeds 0.6`), P11 delete of a `\section` block (exit 3, `section count changes from 2 to 1`). Output, none of the checks named P1 to P11 printed a failure line:

```
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
exit 0
```

### L1 to L6 (lookup.py of 0074728)

Command: `cd $TMPDIR/b1/lk && sh lookup.test.sh; echo $?` with the final `lookup.test.sh`. Output as printed (34 lines, exit 1):

```
L1 cite-keys (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L2 cite-keys with nothing to print (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L3 keys of the main file and of the files it inputs (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L4 missing input file (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L4 missing .bib (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L4 missing main file (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L4 one argument (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])
L5 a title that matches ('error: check-urls takes <report>', [], [])
L5 a title below 0.70 ('error: check-urls takes <report>', [], [])
L5 a key the .bib lacks ('error: check-urls takes <report>', [], [])
L5 a key with no identifier ('error: check-urls takes <report>', [], [])
L5 a key with a url has no title check ('error: check-urls takes <report>', [], [])
L5 a .tex that cites no key ('error: check-urls takes <report>', [], [])
L5a the ratio against OpenAlex ('error: check-urls takes <report>', [], [])
L5b every index left out ('error: check-urls takes <report>', [], [])
L5b one index left out, two not found ('error: check-urls takes <report>', [], [])
L5b a record after an index left out ('error: check-urls takes <report>', [], [])
L5b control, a doi no index holds ('error: check-urls takes <report>', [], [])
L5b a url that gives no answer keeps its title check ('error: check-urls takes <report>', [], [])
L5c braces in the title ('error: check-urls takes <report>', [], [])
L5d a doi written as a URL ('error: check-urls takes <report>', [], [])
L5d the doi at the status request ['', '', '', '']
L5d the doi at Crossref ['', '', '', '']
L5d the doi at OpenAlex ['', '', '', '']
L5d the doi at Semantic Scholar ['', '', '', '']
L5d the line ('error: check-urls takes <report>', [], [])
check-urls a .bib that cannot be read ('error: check-urls takes <report>', [], [])
check-urls one argument ('error: only-one: No such file or directory', [])
L6 the passage is checked against the folder's text []
L6 the key the named .bib lacks []
L6 exit status ('error: quote-check takes <report> <folder>', [])
L6 two arguments (1, ['line 3: k1, p. 1: found', 'k1: no entry', 'k2: no passage', 'k2: no text'])
L6 a .bib that cannot be read ('error: quote-check takes <report> <folder>', [])
FAIL: lookup.py does not hold the behaviour above
```

Reading of it, by case:

- L1: `cite-keys` does not exist, usage error, exit 2.
- L2: the same.
- L3: the same (the check runs from a folder other than `main.tex`'s).
- L4: the same for the missing `\input` file, the missing `.bib`, the missing main file and one argument. The brief says the unchanged copy also exits 2; the check fails because the error line is the usage line.
- L5, L5a, L5b, L5c, L5d: `check-urls` takes one argument (`error: check-urls takes <report>`), so two arguments are refused with exit 2, as the brief says. The four `L5d the doi at ...` lines are empty because no request was made. The one line `check-urls one argument` shows the unchanged command reading its single argument as a report file.
- L6: `quote-check` takes two arguments, so three are refused; the line `L6 two arguments (1, [...])` shows two arguments accepted, with `references.bib` of the record's folder (a decoy holding k2 only) read in place of the named `.bib`: `k1: no entry` is printed for the key the named `.bib` holds.
- `L6 the key the named .bib holds` (`k1: no entry` is absent) passes vacuously on the unchanged tree because the command is refused first; its control in the same test is `L6 the key the named .bib lacks`, which fails there.

### L7 (the cases of the test at 0074728)

Command: `sh $TMPDIR/b1/lk0/lookup.test.sh >/dev/null 2>&1; echo "orig test on orig: exit $?"` (the test of 0074728 beside the file of 0074728). Output: `orig test on orig: exit 0`. The new `lookup.test.sh` keeps every case of the old one unchanged, and none of the 34 first-run lines above names an old case.

### After the change

Command: `for t in anchorize_tex apply_tex_patch lookup; do sh skills/paper/templates/$t.test.sh >/dev/null 2>&1; echo "$t test exit $?"; done` printed:

```
anchorize_tex test exit 0
apply_tex_patch test exit 0
lookup test exit 0
```

and the three `PASS:` lines are quoted in the DONE / NOT DONE table. Every case A1 to A4, P1 to P11, L1 to L7 (with L5a to L5d) has its named checks in the test of its script and none fails.

Real manuscripts: `lookup.py cite-keys <main.tex> <bib>` run over the 31 `main.tex` files of `../research-hub/projects` that name a `.bib` with `\bibliography` and whose `.bib` exists (a loop over `find projects -name main.tex`, stdout discarded) printed `ran 31, with stderr 0`; the nested `tables/` of `hccnet-revision` and the `body.tex` of `ward-bttr-crosssubject` are among them. This run is not a test of the step and writes nothing.

## The table of rule 13

The behaviours the change adds or changes whose failure costs something, each with the check of the test that fails on the unchanged tree and the line it printed (the full lines are in the first-run output above).

| Behaviour | Case and test check | Failing line on the unchanged tree |
|---|---|---|
| `cite-keys` prints `missing:` then `unused:` in the `.tex` and `.bib` orders and exits 1 | L1, `L1 cite-keys` | `L1 cite-keys (2, [], ['usage: lookup.py <command> ...', 'commands: resolve, search, refs, cited-by, bibtex, check-urls, fetch, quote-check'])` |
| `cite-keys` prints nothing and exits 0 when keys and entries agree | L2, `L2 cite-keys with nothing to print` | `L2 cite-keys with nothing to print (2, [], ['usage: lookup.py <command> ...', ...])` as printed in the output above |
| The key reader follows `\input` and `\include` relative to the main file's folder, skips `% \input{gone}`, reads `\%`, `\cite {k1}`, `\cite{k2, k3}` and a call over two lines, and does not follow `\includegraphics` | L3, `L3 keys of the main file and of the files it inputs` | `L3 keys of the main file and of the files it inputs (2, [], ['usage: lookup.py <command> ...', ...])` as printed above |
| An `\input` file, a `.bib` or a main file that cannot be read gives one `error: <path>: <reason>` line and exit 2 | L4, `L4 missing input file`, `L4 missing .bib`, `L4 missing main file`, `L4 one argument` | the four `L4 ...` lines above |
| `check-urls <main.tex> <file.bib>`: the keys come from the `.tex`, `no entry in <the .bib's name>`, `the .tex cites no key`, no title check for a key without a doi | L5, `L5 a key the .bib lacks`, `L5 a key with no identifier`, `L5 a key with a url has no title check`, `L5 a .tex that cites no key` | `L5 a key the .bib lacks ('error: check-urls takes <report>', [], [])` and the three lines after it |
| The title ratio against the first record the doi resolves to, `DOI_MISMATCH` below 0.70, exit 1 on it | L5, `L5 a title that matches`, `L5 a title below 0.70` | `L5 a title that matches ('error: check-urls takes <report>', [], [])` and `L5 a title below 0.70 ('error: check-urls takes <report>', [], [])` |
| An arXiv doi Crossref does not hold is compared with OpenAlex's record, and Semantic Scholar is not asked | L5a, `L5a the ratio against OpenAlex` | `L5a the ratio against OpenAlex ('error: check-urls takes <report>', [], [])` |
| An index left out is named with its reason and an outage is never `doi not found`; a doi all three answer as not found is `doi not found`; a URL that gave no answer keeps its title check | L5b, `L5b every index left out`, `L5b one index left out, two not found`, `L5b a record after an index left out`, `L5b control, a doi no index holds`, `L5b a url that gives no answer keeps its title check` | the five `L5b ...` lines above, each ending `'error: check-urls takes <report>', [], [])` |
| The braces of a `.bib` title do not lower the ratio | L5c, `L5c braces in the title` | `L5c braces in the title ('error: check-urls takes <report>', [], [])` |
| A doi reaches the three indexes stripped of its prefix and percent-encoded | L5d, `L5d a doi written as a URL`, `L5d the doi at the status request`, `... at Crossref`, `... at OpenAlex`, `... at Semantic Scholar`, `L5d the line` | the six `L5d ...` lines above |
| `check-urls` with one argument and a `.bib` that cannot be read | `check-urls one argument`, `check-urls a .bib that cannot be read` | `check-urls one argument ('error: only-one: No such file or directory', [])` and `check-urls a .bib that cannot be read ('error: check-urls takes <report>', [], [])` |
| `quote-check <record> <file.bib> <folder>` reads the named `.bib`, not the record's folder's | L6, `L6 the passage is checked against the folder's text`, `L6 the key the named .bib lacks`, `L6 exit status`, `L6 two arguments`, `L6 a .bib that cannot be read` | the five `L6 ...` lines above |

The `USER_AGENT` string changed from `lookup.py (the literature skill of Ordo)` to `lookup.py (the paper skill of Ordo)`. No case is written for it: a failure of a constant costs nothing and a test over it would be an assertion over a constant (rule 13, fourth bullet of its list). The change is checked by `git diff` (hunk at line 95) and by reading.

Behaviour the change preserves, run on the unchanged tree and after: A1 to A4 and P1 to P11 (the copied scripts' code is unchanged, `diff` below), and the old cases of `lookup.test.sh` (L7). Each passed on the unchanged tree and passes after.

A test that would still pass with its behaviour taken out, named so the reviewer can find it: `L5a Semantic Scholar is not asked` and `L6 the key the named .bib holds` are silent-rule assertions. Their controls in the same test are `L5d the doi at Semantic Scholar` (Semantic Scholar is asked when the other two answer not found) and `L6 the key the named .bib lacks`.

## DONE / NOT DONE

Run from the worktree's root, `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-1`.

| Item | Command | Output as printed | Status |
|---|---|---|---|
| 1. `anchorize_tex.py` copied, head comment rewritten | `diff <(sed -n '/^from __future__/,$p' ../research-hub/tools/manuscript/anchorize_tex.py) <(sed -n '/^from __future__/,$p' skills/paper/templates/anchorize_tex.py); echo "code diff exit $?"` | `code diff exit 0` | DONE |
| 2. `apply_tex_patch.py` copied, head comment rewritten | the same with `apply_tex_patch.py` | `code diff exit 0` | DONE |
| 3. `anchorize_tex.test.sh` and `apply_tex_patch.test.sh` | see the two test rows below | | DONE |
| 4. `lookup.py` of 0074728 with the changes | `diff <(git show 0074728:skills/literature/templates/lookup.py) skills/paper/templates/lookup.py` | hunks listed below | DONE |
| 5. The cited keys, one function for both commands | `grep -n 'tex_cited_keys' skills/paper/templates/lookup.py` | the definition and the calls in `run_cite_keys` and `run_check_urls` | DONE |
| 6. `lookup.test.sh` | the lookup row below | | DONE |
| 7. The three pages | `git diff --stat -- docs` | `docs/dev/building.md 3 +++`, `docs/dev/change-standard.md 3 +++`, `docs/dev/scripts.md 6 ++++++` | DONE |
| Verify 1: `sh skills/paper/templates/anchorize_tex.test.sh 2>&1 \| tail -1` | run | `PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file` (test exit 0) | DONE |
| Verify 1: `sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 \| tail -1` | run | `PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only` (test exit 0) | DONE |
| Verify 1: `sh skills/paper/templates/lookup.test.sh 2>&1 \| tail -1` | run | `PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, reads the keys a .tex cites with the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, and takes the .tex, the .bib and the integrity record on the command line` (test exit 0) | DONE |
| Verify 1: the character-set check over the nine changed files (the brief's `printf '%s\0' ... \| xargs -0 perl -CSD -ne ...`) | run | prints nothing; `ascii exit 0` | DONE |
| Verify 2: every case's first run quoted, and its run after | the section "The cases' first run" | quoted | DONE |
| Verify 3: `diff` of each copy against the research-hub copy prints only head-comment lines | `diff ../research-hub/tools/manuscript/anchorize_tex.py skills/paper/templates/anchorize_tex.py \| grep -E '^[0-9]'` | `2c2`, `4,9c4`, `11,13c6`, `15,16c8`, `18,19c10,24`; the module docstring ends at line 25 and `from __future__` is line 26 (research-hub: line 21) | DONE |
| Verify 3, apply | the same with `apply_tex_patch.py` | `2c2`, `4,10c4`, `12c6,7`, `13a9,10`, `32,36c29,32`, `38,42c34,64`; the docstring ends at line 65 and `from __future__` is line 66 (research-hub: line 44) | DONE |
| Verify 4: hunks of `lookup.py` against 0074728 | `diff <(git show 0074728:skills/literature/templates/lookup.py) skills/paper/templates/lookup.py \| grep -E '^[0-9]'` | `2c2`, `11c11,12`, `13c14`, `25c26,28`, `27c30`, `29c32`, `30a34,40`, `34c44`, `43c53`, `58c68`, `60c70`, `95c105`, `121c131,136`, `670a686,709`, `1049,1054d1087`, `1133a1167,1201`, `1136,1138c1204,1206`, `1142c1210`, `1151a1220`, `1153,1157c1222,1225`, `1159c1227`, `1165,1166c1233,1234`, `1169c1237,1238`, `1289a1359`; each listed with its item below | DONE |
| Verify 5: each new test run on the unchanged tree first, again after | the section "The cases' first run" | quoted | DONE |
| Verify 6: the new lines of the three pages read against the standards | below | | DONE |
| Verify 7 | `grep -rn 'literature\|research-hub\|this hub\|tools/manuscript' skills/paper/templates/; echo "grep7 exit $?"` | `grep7 exit 1` (no line printed) | DONE |

Outside this step: the plan's whole verify list, which the brief says runs once, at landing on main. The three commands this step adds to `docs/dev/building.md` make the page hold ten commands, so the landing rewrites the plan's verify list from 7 to 10 (ADR 0010); no ledger file other than this report was changed.

### The hunks of lookup.py against 0074728 (verify 4)

| Hunk, as `diff` prints it (old lines, new lines) | Change | Item |
|---|---|---|
| `2c2` | The head comment opens `r"""Make every reference lookup of the paper skill ...`; raw because it now holds `\input` and `\cite` | 4, first bullet |
| `11c11,12`, `13c14` | The usage lines of `cite-keys`, `check-urls` and `quote-check` | 4 |
| `25c26,28` | Bullets of `cite-keys` and of `check-urls` (its key source, its lines, its title check) | 4 |
| `27c30` | The bullet of `quote-check` | 4 |
| `29c32`, `30a34,40` | The citation paragraph names the integrity record; the new section "The keys a .tex cites" | 4, 5 |
| `34c44` | The 429 bullet names the title check | 4 |
| `43c53` | The reads of `cite-keys`, `check-urls` and `quote-check` | 4 |
| `58c68` | The `error: <path>: <reason>` bullet names a `.tex`, an `\input` or `\include` file, a `.bib` and an integrity record | 4, error lines |
| `60c70` | The exit status names `cite-keys` and the three added failures | 4 |
| `95c105` | `USER_AGENT = "lookup.py (the paper skill of Ordo)"` | 4, first bullet |
| `121c131,136` | `TEX_COMMENT` and `TEX_CALL`, and `COMMANDS` gains `cite-keys` | 5, dispatch |
| `670a686,709` | `tex_cited_keys`, the one function both commands call | 5 |
| `1049,1054d1087` | `read_report_and_bib` removed; both commands read their files by `read_text_file` and `parse_bib` | 4 |
| `1133a1167,1201` | `title_check` and `run_cite_keys` | 4 |
| `1136,1138c1204,1206`, `1142c1210`, `1151a1220`, `1153,1157c1222,1225`, `1159c1227` | `run_check_urls` takes `<main.tex> <file.bib>`, reads the keys from the `.tex`, appends the title check, prints `no entry in <the .bib's name>` and `the .tex cites no key` | 4 |
| `1165,1166c1233,1234`, `1169c1237,1238` | `run_quote_check` takes `<integrity record> <file.bib> <folder>` | 4 |
| `1289a1359` | `HANDLERS` gains `cite-keys` | 4, dispatch |

(The new-file line numbers are those of `skills/paper/templates/lookup.py`; the head comment hunks are the first twelve rows.)

### Sentences and list items of the three pages against the standards (verify 6)

- `docs/dev/building.md`: three comments in the block, one per command, in the block's form (`# <script> on <inputs>: <what it proves>`). They run 24, 30 and 24 words against the roughly 20 the prose standard asks; they depart because the block's form is one comment per command and each lists the behaviours its test proves, as the existing comment of `land.test.sh` (36 words) does.
- `docs/dev/change-standard.md`: three command lines, no prose.
- `docs/dev/scripts.md`: six table rows, each cell one phrase. The jobs of `apply_tex_patch.py` (28 words) and `lookup.py` (35 words) are over 20 words; they list the several things the script does, as the job of `prose_facts.py` (42 words) does. The three test rows are a path and a path.
- No page sentence that counts or lists the commands or scripts was found false: `grep -n -i 'seven\|six tests' docs/dev/*.md README.md` prints nothing, and the sentences of `building.md` ("every command below", "the last command is the ASCII check") and `scripts.md` ("every script ... outside `.scratch/` is listed here") hold after the change.

## The terms

Each term of `docs/glossary.md` found in text the diff adds (read by listing the glossary's terms against the added lines), each use read against its entry. The step changes no glossary entry, so no "Stated in" was changed or re-checked.

- **base**: the arguments `<base>`, and the JSON fields `base_file` and `base_sha256`, of `apply_tex_patch.py` name the .tex a patch applies to, not the preparation-commit hash of the glossary. They keep the script's names; the three docs pages and the test headers say "the input" and "the patched .tex" instead.
- **kind** and **round**: `kind` is the JSON field of an op and of a rejection, `round` the field of a patch, both from the script. The glossary's "kind" (plan-retro) and "round" (repair round, round of an interview) are other senses. `anchorize_tex.py`'s head comment says "revision round" for a round of revising a manuscript; no glossary entry covers it, and the skill text of step 2 is where the term is stated.
- **case**: the test headers call each check a case, in the glossary's sense of an example with an expected result.
- **gate**: the unchanged code comment of `structural_flags` says a measure "does not gate", meaning decide whether a patch is applied. It is code and kept byte for byte.
- **refusal**, **reviewer**, **part**, **place**: in the added head comments and docs text the words are avoided (reworded to "rejects", "answers with exit 3", "clause", "where ... stands"); `reviewer` and `refusal` remain only inside unchanged code strings of `apply_tex_patch.py`.
- **integrity record**: used in `lookup.py`'s head comment and usage. It is no glossary term; ADRs 0018 and 0020 name it, and the skill text of step 2 states it. Not defined here.

## The files

| File | Lines |
|---|---|
| `skills/paper/templates/anchorize_tex.py` | 135 |
| `skills/paper/templates/apply_tex_patch.py` | 285 |
| `skills/paper/templates/lookup.py` | 1393 |
| `skills/paper/templates/anchorize_tex.test.sh` | 117 |
| `skills/paper/templates/apply_tex_patch.test.sh` | 234 |
| `skills/paper/templates/lookup.test.sh` | 519 |
| `docs/dev/building.md` | 37 (3 lines added) |
| `docs/dev/change-standard.md` | 91 (3 lines added) |
| `docs/dev/scripts.md` | 41 (6 lines added) |
| `.scratch/5-paper/agents/reviews/1-report.md` | this file |

Line counts are those of `wc -l`. `lookup.py` is 1323 lines at 0074728 and `lookup.test.sh` 333.

## Judgment calls the brief left open

1. Key order: the keys are listed in the order of the text, a file named by `\input` or `\include` being read at the place of the command. The brief says "in the order the keys first occur"; this reads it as document order, as LaTeX reads the files.
2. `check-urls` appends the title check to the line of a key whose URL gave no answer: `<key>: failed, <reason> <url>, ratio ...`. The brief gives the words of the status line and of the three endings; it does not say whether a failed URL skips the title check. Skipping it would leave a key with a doi unchecked during an outage of doi.org alone.
3. `quote-check` prints `the report cites no key` unchanged for a record that cites no key. The brief calls the file the integrity record; changing that output line is outside its items (rule 20), so the head comment names the line as printed. The orchestrator may rule on renaming it.
4. A `doi` field whose text matches no DOI pattern is passed to the three indexes stripped (`Identifier("doi", doi, doi)`) instead of through `classify` alone, which would give an empty doi and request the index's list endpoint. No entry of the hub's `.bib` files has such a field (`parse_bib` over `projects/**/*.bib`: 467 entries with a doi, none failing `DOI_PATTERN` after `strip_doi`); a wrong answer there is a false `DOI_MISMATCH`.
5. An entry with a doi and no `title`, or a record with an empty title, gives ratio 0.00 and `DOI_MISMATCH`, as `resolve` does for an empty title. The same scan found no entry with a doi and without a title.
6. The names after `\input` and `\include` are stripped of surrounding white space; an empty part between commas is no key; `\input` and `\include` are matched only when no letter follows (`\includegraphics` and `\includeonly` are not followed), a case added to L3 since a wrong reading would make every manuscript with a figure fail with exit 2.
7. The path printed for an `\input` error is the main file's folder joined with the name, with `.tex` added when the name has no extension (`../l4/nosuch.tex` in the test), the same form `read_text_file` prints for every other file.
8. `cite-keys` stands between `bibtex` and `check-urls` in `COMMANDS`, the usage lines and the head comment.
9. The head comments of the two manuscript scripts are raw docstrings (`r"""`) because they hold `\begin` and `\section`. The head comment of `anchorize_tex.py` also lists the `AssertionError` its self-check can end with, and both list `-h`/`--help` exit 0.
10. The tests are a POSIX `sh` wrapper around a Python heredoc, as `lookup.test.sh` is, and extend assertions past the brief's literal lines where the head comment promises an error line: an unreadable `.bib` or main file (L4, a `check-urls` `.bib`, a `quote-check` `.bib`), the argument-count lines of `cite-keys`, `check-urls` and `quote-check`, the mixed left-out case of L5b and its control (a doi all three answer as not found), and a left-out index followed by a record.
11. The three commands stand in `docs/dev/building.md` and `docs/dev/change-standard.md` after the `ordo-init` line (skills in alphabetical order, `paper` before `repo-setup`), before the ASCII check as the brief asks.

## Host- or user-visible changes

- `lookup.py check-urls <report>` becomes `lookup.py check-urls <main.tex> <file.bib>`: before, the keys came from a report and the `.bib` was `references.bib` in the report's folder (`error: check-urls takes <report>` for two arguments); after, the keys come from the `.tex` and the files it inputs, a key with a doi gets `, ratio <r> against <index>` (with `, DOI_MISMATCH` below 0.70), `, doi not found in Crossref, OpenAlex or Semantic Scholar` or `, title not checked: <index> left out, <reason>`, and these three count as failures; `no entry in references.bib` becomes `no entry in <the .bib's file name>`; `the report cites no key` becomes `the .tex cites no key`.
- `lookup.py quote-check <report> <folder>` becomes `lookup.py quote-check <integrity record> <file.bib> <folder>`; before, `references.bib` in the report's folder, after, the `.bib` named.
- `lookup.py cite-keys <main.tex> <file.bib>` is new: `missing: <key>` and `unused: <key>` lines, exit 1 when it printed either.
- The `User-Agent` header of every request reads `lookup.py (the paper skill of Ordo)`; before, `lookup.py (the literature skill of Ordo)`.
- `lookup.py`'s head comment names the `paper` skill and lists the changed commands, the key reader, the reads, the errors and the exit status.
- `apply_tex_patch.py --help` prints the rewritten head comment: before it began `Apply a block patch to a LaTeX manuscript, fail-closed.` / `The hub's LaTeX-native stand-in for the academic-paper skill's revision-mode apply step. ...`; after, `Usage:` with the two forms, then `The script applies the operations of a patch to the blocks that anchorize_tex.py recorded in the manifest of <base>. ...`. (`python3 -B skills/paper/templates/apply_tex_patch.py --help | sed -n 1,12p` printed this.) `anchorize_tex.py` has no `--help` text of its own beyond argparse's.
- `docs/dev/building.md` and `docs/dev/change-standard.md` hold three more commands each (ten in all), and `docs/dev/scripts.md` lists the three scripts and the three tests.

## Anything in the brief that was wrong or impossible

Nothing was found wrong or impossible. Every sentence the brief gives word for word about a script was run before it was written: the exit statuses and tracebacks of both scripts (`python3 -B anchorize_tex.py nosuch.tex` exit 1 with `FileNotFoundError`, no arguments and an unknown option exit 2; `apply_tex_patch.py` with no manifest, a missing base, a patch that is not JSON and an unwritable output exit 1 with `FileNotFoundError` or `json.decoder.JSONDecodeError`, a missing `--output` exit 2 with `--output is required unless --check-only is used`, `--help` exit 0), and each line of `check-urls` through the L5 checks. One point the brief's list of exit 1 causes lacks: `anchorize_tex.py` can also end with an `AssertionError` traceback from its self-check, and its head comment says so.
