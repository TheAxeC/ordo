# Step 1 refuter report (on .agents/worktrees/5-paper-1, base b2b39ec)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All commands below ran from `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-1` unless they name another folder. The tests ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

```
$ sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
$ sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
$ sh skills/paper/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, reads the keys a .tex cites with the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, and takes the .tex, the .bib and the integrity record on the command line
$ printf '%s\0' <the nine files of Verify 1> | xargs -0 perl -CSD -ne '<the brief's character-set check>'; echo "charset exit $?"
charset exit 0          (no line printed)

Verify 3:
$ diff ../research-hub/tools/manuscript/anchorize_tex.py skills/paper/templates/anchorize_tex.py | grep -E '^[0-9]'
2c2  4,9c4  11,13c6  15,16c8  18,19c10,24
$ diff ../research-hub/tools/manuscript/apply_tex_patch.py skills/paper/templates/apply_tex_patch.py | grep -E '^[0-9]'
2c2  4,10c4  12c6,7  13a9,10  32,36c29,32  38,42c34,64
$ diff <(sed -n '/^from __future__/,$p' <hub copy>) <(sed -n '/^from __future__/,$p' <new copy>); echo "<script> code diff exit $?"
anchorize_tex code diff exit 0
apply_tex_patch code diff exit 0
(every hunk lies in the module docstring, lines 2 to 25 and 2 to 65 of the new files; line 2 is the docstring's opening line, which gains the r prefix)

Verify 4, run against a plain-file copy of lookup.py at 0074728 (see "Declined to judge"):
$ diff $TMPDIR/bc1lk.DWcPXx/lookup.py skills/paper/templates/lookup.py | grep -E '^[0-9]'
2c2 11c11,12 13c14 25c26,28 27c30 29c32 30a34,40 34c44 43c53 58c68 60c70 95c105 121c131,136 669a685,689 670a691,709 1047,1052d1085 1131a1165,1199 1136,1138c1204,1206 1142c1210 1151a1220 1153,1157c1222,1225 1159c1227 1165,1166c1233,1234 1169c1237,1238 1289a1359
(read hunk by hunk: head comment, USER_AGENT, TEX_COMMENT and TEX_CALL with COMMANDS, tex_cited_keys, read_report_and_bib removed, title_check and run_cite_keys, run_check_urls, run_quote_check, HANDLERS. Nothing outside the places Verify 4 allows. The report's Verify 4 row gives 670a686,709, 1049,1054d1087 and 1133a1167,1201 where this run prints 669a685,689 with 670a691,709, 1047,1052d1085 and 1131a1165,1199; the hunks' content is the same and no decision rests on the line numbers.)

Verify 7:
$ grep -rn 'literature\|research-hub\|this hub\|tools/manuscript' skills/paper/templates/; echo "grep7 exit $?"
grep7 exit 1          (no line printed)

The report's evidence commands:
$ cd $TMPDIR/b1/hub && sh anchorize_tex.test.sh; echo "exit $?"
PASS: anchorize_tex.py leaves the .tex byte-identical, ... (the same PASS line as above)
exit 0
$ cd $TMPDIR/b1/hub && sh apply_tex_patch.test.sh; echo "exit $?"
PASS: apply_tex_patch.py replaces, inserts after and deletes only ... (the same PASS line as above)
exit 0
  (cmp: hub/anchorize_tex.py and hub/apply_tex_patch.py equal the research-hub files; hub/*.test.sh equal the worktree's tests)
$ cd $TMPDIR/b1/lk && sh lookup.test.sh > <scratch>/refute51-lk-first.txt 2>&1; echo "exit $?"
exit 1
  34 lines; diff against lines 38 to 71 of the builder's report: "quoted block equals rerun"
  (sha1 of lk/lookup.py = 9ffecaf21fd99ddae391f1896774b76c33a181bd, the same as lk0/lookup.py and the brief check's bc1lk.DWcPXx/lookup.py; lk/lookup.test.sh equals the worktree's lookup.test.sh)
$ sh $TMPDIR/b1/lk0/lookup.test.sh >/dev/null 2>&1; echo "orig test on orig: exit $?"
orig test on orig: exit 0
$ for t in anchorize_tex apply_tex_patch lookup; do sh skills/paper/templates/$t.test.sh >/dev/null 2>&1; echo "$t test exit $?"; done
anchorize_tex test exit 0
apply_tex_patch test exit 0
lookup test exit 0
$ grep -n 'tex_cited_keys' skills/paper/templates/lookup.py
686:def tex_cited_keys(main):
1192:    cited = tex_cited_keys(positional[0])
1205:    keys = tex_cited_keys(positional[0])
$ git diff b2b39ec --stat     (in place of the report's `git diff --stat -- docs`)
 docs/dev/building.md        | 3 +++
 docs/dev/change-standard.md | 3 +++
 docs/dev/scripts.md         | 6 ++++++
$ python3 -B skills/paper/templates/apply_tex_patch.py --help | sed -n 1,12p
usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT] ... then "Apply a block patch to a LaTeX manuscript, fail-closed.", "Usage:", the two usage forms, "The script applies the operations of a patch ..."
The report's error and exit runs, on scratch files under the reviewer's scratchpad:
anchorize_tex.py nosuch.tex: FileNotFoundError, exit 1; no argument: exit 2; an unknown option: exit 2
apply_tex_patch.py without --output: "apply_tex_patch.py: error: --output is required unless --check-only is used", exit 2
apply_tex_patch.py with a patch that is not JSON: json.decoder.JSONDecodeError, exit 1; with no manifest: exit 1; with an unwritable output: exit 1; --help: exit 0
The report's run over the hub's manuscripts (cite-keys on each main.tex under research-hub/projects that names a .bib by \bibliography whose file exists, run from /tmp):
ran 31, with stderr or exit above 1: 0
wc -l of the six new files and three pages: 135, 285, 1393, 117, 234, 519, 37, 91, 41, as the report's table gives.
Order of the first runs (stat birth times): the hub tests 11:10, their first run (hub/t) 11:13, the worktree's anchorize_tex.py 11:14; the lookup first run (first-run-lookup.txt) 11:13:20, the worktree's lookup.py 11:16:22; the rerun of the final test on the unchanged lookup.py (fr-lookup.txt, 11:19) is byte-identical to the 11:13 output.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The code below the docstring equals research-hub's (code diff exit 0); the head comment gives the bare usage `anchorize_tex.py <tex> [--print-blocks]`, what the manifest is and why, the read, the write, the printed line, argparse's usage error with exit 2 and the traceback with exit 1 (reproduced above), and no hub, installation or history text (grep7 exit 1).
- 2: holds. The code equals research-hub's; the head comment gives the patch document, the four statuses, both argparse errors with exit 2 (reproduced), exit 1 for an unreadable or unparsable base, manifest or patch (reproduced), the reads and writes, and the bare usage; the `--help` change is named in the report's host-visible changes and reproduced above.
- 3: holds. Both tests are POSIX `sh` around a Python heredoc, work in `mktemp -d "${TMPDIR:-/tmp}/..."` removed by `trap`, print `PASS:` with exit 0 or `FAIL:` with exit 1, and hold A1 to A4 and P1 to P11 (read in full).
- 4: holds. The diff touches only the allowed places (Verify 4 above). `USER_AGENT` reads `lookup.py (the paper skill of Ordo)` (`lookup.py:105`). `cite-keys` prints `missing:` in the `.tex` order and then `unused:` in the `.bib` order, exit 1 when it prints either (`lookup.py:1189-1199`). `check-urls <main.tex> <file.bib>` gives the dictated endings and counts the three new outcomes as failures (`lookup.py:1167-1186`, `1202-1228`). `quote-check <integrity record> <file.bib> <folder>` reads the named `.bib` (`lookup.py:1231-1246`). resolve, search, refs, cited-by, bibtex and fetch are unchanged apart from the header. Judgment call 3: `quote-check` prints `the report cites no key` for a record that cites no key (`lookup.py:611`, inside the shared `quote_check_lines`, unchanged from 0074728 line 596). This holds against the brief. Item 4's quote-check bullet asks for "the same checks", reading the record "in the form the script reads today", and dictates no new words for that line. The brief check's F8.2 asked for words for the no-key line, and the brief's closure of F8.2 gave words only for check-urls (`the .tex cites no key`). Rule 20 of the rules file keeps the line as it is, and the head comment states it as printed (`lookup.py:30`). The wording, a printed line that calls the integrity record "the report", is a vocabulary the brief did not settle; see "Declined to judge".
- 5: holds. One function, `tex_cited_keys` (`lookup.py:686-707`), is called by `run_cite_keys` and `run_check_urls`. It strips an unescaped `%` to the line end before matching (`TEX_COMMENT`, `lookup.py:131`), follows `\input` and `\include` (not `\includegraphics`) joined to the main file's folder, adds `.tex` only when the name has no extension, reads each file once, matches every `\cite...` command with whitespace and `[...]` arguments skipped and a braced argument that may cross lines, splits keys on commas and strips them, and gives an unreadable `\input` file one `error: <path>: <reason>` line with exit 2 through `read_text_file`. The rerun over 31 hub manuscripts gives no error.
- 6: holds. The test at 0074728 is kept whole: the diff against it changes only line 2 (the header), adds `import atexit`, adds lines 320 to 505 and changes the `PASS:` line. The new cases are offline, on recorded bodies through `RecordingClient` and on scratch files. See Standards 1 for assertions beyond the cases.
- 7: holds. `docs/dev/building.md` and `docs/dev/change-standard.md` each gain the three commands before the ASCII check, the first with a comment in the block's column (column 56, as its neighbours), the second with `2>&1 | tail -1`. `docs/dev/scripts.md` gains three "User scripts" rows and three "Test scripts" rows in the tables' columns. The counting sentences ("every command below", "The last command is the ASCII check", "Every script in this repository outside `.scratch/` is listed here") hold. No other page lists the tests (`grep -rln 'check_config.test.sh'` outside `.scratch` gives only these pages and closed roadmap entries).

Cases of the brief's "Cases":

- A1: met, checks `A1 ...` of `anchorize_tex.test.sh:65-71` (three blocks, the manifest beside the `.tex`, the bytes before and after equal), passing on the hub copy and after.
- A2: met, `anchorize_tex.test.sh:74-77`, the table with its inner blank line is one block.
- A3: met, `anchorize_tex.test.sh:80-83`, the two paragraphs inside the document environment are separate blocks.
- A4: met, `anchorize_tex.test.sh:86-102`, the gaps and spans rebuild each file, only whitespace lies outside the blocks, the counts and the file's hash match.
- P1: met, `apply_tex_patch.test.sh:93-108`, exit 0, the exact output text, the base unchanged, the apply report naming `OP001`, `B0002` and `["R2-1b", "R2-2a"]`.
- P2: met, `:111-117`, exit 2 with kind `validation`, no output and no report, the base unchanged.
- P3: met, `:120-128`, exit 2 with kind `stale-manifest`, no output.
- P4: met, `:131-138`, exit 2 with kind `validation`, no output.
- P5: met, `:141-157`, exit 3 with "heading rewritten" and no output without the flag; with it, exit 0, the output and `structural_acknowledged` true in the printed and the written report.
- P6: met, `:160-167`, exit 2 with kind `output` for the same path and for `<scratch>/./p6.tex`, the base unchanged.
- P7: met, `:170-179`, exit 0 with result `checked`, the folder listing unchanged with and without `--output`.
- P8: met, `:182-188`, the exact output `Para 1.\n\nPara 2.\n\nNew para.\n\nPara 3.\n\nPara 5.\n`.
- P9: met, `:191-198`, exit 2 with kind `validation`, one problem naming `OP002`, no output, the base unchanged.
- P10: met, `:201-208`, exit 3, a problem starting `block_touched_ratio 0.800` with `exceeds 0.6`, no output.
- P11: met, `:211-219`, exit 3, `section count changes from 2 to 1`, no output.
- L1: met, `lookup.test.sh:346-350`, exactly `missing: d`, `missing: z`, `unused: g`, `unused: h` and exit 1, run from another folder. First run: usage error, exit 2 (quoted, reproduced).
- L2: met, `:353-356`, no output and exit 0.
- L3: met, `:359-370`, run from `elsewhere/` with `../l3/main.tex`, the ten keys tx, ch, bd, ty, h, k1 to k5 in order, no error for `% \input{gone}` or `\includegraphics`, and the nested `\input{tables/y}` read beside `main.tex`. A reader that resolved against the working directory or the inputting file's folder would exit 2 and fail this check.
- L4: met, `:373-376`, the line `error: ../l4/nosuch.tex: No such file or directory` and exit 2. First run: the usage line, so the check fails there (quoted).
- L5: met, `:422-436`: ratio 1.00 and exit 0; `ratio 0.34 against Crossref, DOI_MISMATCH` and exit 1; `gone: no entry in paper-refs.bib`. First run: `error: check-urls takes <report>` (quoted).
- L5a: met, `:439-442`, Crossref 404 and the ratio taken against OpenAlex, no `doi not found`.
- L5b: met, `:445-455`, the `title not checked:` line with each index's reason and exit 1, no `doi not found`, with the control of all three not found.
- L5c: met, `:458-459`, `{{Estimating} Mutual Information}` gives ratio 1.00 and no `DOI_MISMATCH`.
- L5d: met, `:462-471`, the URL-form doi stripped, and `10.1000/a#b?c` requested as `10.1000/a%23b%3Fc` at doi.org, Crossref, OpenAlex and Semantic Scholar.
- L6: met, `:490-501`, the record's folder holds a decoy `references.bib` with k2 only and the named `.bib` holds k1: `line 3: k1, p. 1: found`, `k2: no entry`, no `k1: no entry`, exit 1, and the two-argument form refused. First run: refused with three arguments (quoted).
- L7: met. Every line of the 0074728 test is kept (diff above); `orig test on orig: exit 0`; none of the 34 first-run failure lines names an old case.

## 1. Spec

- none.

## 2. Proof

- none.

## 3. Standards

- `skills/paper/templates/lookup.test.sh:378`, `:380`, `:382`, `:485`, `:504`: `check("L4 missing .bib", ...)`, `check("L4 missing main file", ...)`, `check("L4 one argument", result == (2, [], ["error: cite-keys takes <main.tex> <file.bib>"]), ...)`, `check("check-urls a .bib that cannot be read", ...)`, `check("L6 a .bib that cannot be read", ...)`. What is wrong: these checks pin error lines that no case of the brief lists (judgment call 10 of the report adds them). The behaviour they guard costs nothing when it fails. The rules file, "Scripts compute facts; judgment is read", says a test exists "only for behaviour whose failure costs something: lost work, a broken installation, a wrong configuration accepted". The brief's Cases section says "Every other case of a code step is checked by a run the report quotes, and no test is kept for it". Each check was judged on its own failure:
  - An unreadable `.bib` or main file that reached a bare `open()` would end in a traceback with exit 1. For cite-keys, check-urls and quote-check, exit 1 is a failure, and an unreadable `.bib` read as empty would print every key as missing or `no entry`. Either way nothing passes silently.
  - `cite-keys` with one argument would end in an `IndexError` traceback with exit 1, again a failure.
  - The two kept argument checks that do guard a wrong pass are left out of this finding. `check-urls one argument` (`:487`) guards the old one-argument form, which on a `.tex` would print "the report cites no key" with exit 0. `L6 two arguments` (`:501`) guards the old form that silently reads the folder's `references.bib`.
  - Failure scenario: a later change rewords one of these error messages, for example to name the `.bib` argument. `lookup.test.sh` then goes red in the verify list at landing with no wrong result prevented, and the maintainer edits the expected strings to match. The checks are kept only to pin wording.
  - Verdict: none (item 6 holds; this is a test the rules file's test rule does not call for).

## 4. Behaviour

- `skills/paper/templates/lookup.py:1176` and `:1223`: `for name, ask in (("Crossref", lookup_crossref), ("OpenAlex", lookup_openalex), ("Semantic Scholar", lookup_s2)):` and `title, title_failed = title_check(client, bib[key])`. What a host and a user see change: before, `check-urls` made one request per cited key with an identifier. After, every cited key with a doi gets up to three more requests, to api.crossref.org, api.openalex.org and api.semanticscholar.org. Each of them is retried on HTTP 429 with a 2-second wait up to 3 times, and each carries the `CROSSREF_POLITE_EMAIL`, `OPENALEX_API_KEY` or `S2_API_KEY` that host gets. So a run takes longer and meets the indexes' rate limits sooner. The report's "Host- or user-visible changes" gives the new line endings and the new failures, but not the added requests per key, their cost in time, or the credentials those requests send, with the before and after.
  - Failure scenario: the builder of step 2 writes the skill text's description of `check-urls` from this report and expects one request per key. On a manuscript with 55 dois, a run then makes up to 220 requests. Without an `S2_API_KEY`, Semantic Scholar answers 429 whenever Crossref and OpenAlex do not hold a doi. The resulting `title not checked` lines and exit 1 are read as reference defects instead of rate limits, or the run is cut short by a time limit the text did not plan for.
  - Verdict: none.

## Declined to judge

- That the plain-file copies used as `lookup.py` and `lookup.test.sh` at commit 0074728 (`$TMPDIR/bc1lk.DWcPXx/`, written by the brief-check agent, sha1 9ffecaf21fd99ddae391f1896774b76c33a181bd for `lookup.py`, equal to the builder's `$TMPDIR/b1/lk/` and `lk0/` copies) are the commit's files. Only `git show 0074728:skills/literature/templates/lookup.py` and `git show 0074728:skills/literature/templates/lookup.test.sh` settle it, and the reviewer runs no git command but the three of the refute skill's Rules. The report's Verify 4 command, `diff <(git show 0074728:...) skills/paper/templates/lookup.py`, was not run in that form for the same reason; the diff above against the copy stands in for it.
- The report's `git diff --stat -- docs` was not run in that form; `git diff b2b39ec --stat` gives the same three lines.
- Whether `quote-check`'s printed line `the report cites no key` should name the integrity record instead, and whether the internal docstrings of `cited_keys` and `read_report` (`lookup.py:524`, `:528`, `:553`) should follow. This is a word of a user-visible output that the brief does not settle, a vocabulary the rules file's rule 4 reserves for the orchestrator. As built, it follows the brief (item 4 verdict).
- How Crossref, OpenAlex and Semantic Scholar actually answer for the hub's dois, the 14 arXiv dois included. The case uses recorded bodies, and live lookups were not made.
- The plan's whole verify list, and the rewrite of the state file's verify list from 7 to 10 commands under ADR 0010. Both happen at landing on main.
- Whether `.scratch/5-paper/agents/reviews/1-report.md`, untracked in the worktree, is ignored by the landing's ASCII check, and what git ignores in the worktree. `git check-ignore -v` would settle it; the file has no character outside printable ASCII (`LC_ALL=C grep -n '[^ -~]'` printed nothing), and its two copies are equal (`cmp`).

Reviewer usage: a8f3bf8ec5b9a9df5, claude-opus-5-5, 300438 tokens, 58 tool uses, 14.5 min.
