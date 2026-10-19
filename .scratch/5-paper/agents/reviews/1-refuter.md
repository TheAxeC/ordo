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

## Repair round 1, refuted

All commands ran from `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-1` unless a folder is named. The tests ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. Scratch files are under `.../scratchpad/refute51r1/`. The round's delta is `diff -u` of the snapshot `.agents/worktrees/5-paper-1-round-1/` against the worktree for each path of its `files.txt`. Of the nine paths, only `lookup.py` and `lookup.test.sh` differ; the other seven, the three pages and the four other scripts and tests included, are byte-equal to the snapshot (`diff -q` printed nothing). The one changed path that `files.txt` does not list is the builder's report. I read both deltas whole (`lookup.py`: the quote-check bullet of the head comment, the title-check bullet, the docstrings, the renames of `read_report` to `read_record` and `report_text` to `record_text`, and the printed line; `lookup.test.sh`: the head comment, the T6 rename, the five removed checks and their setup, the `PASS:` line).

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, reads the keys a .tex cites with the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, reports an input file that does not exist, and refuses the one-argument check-urls and the two-argument quote-check
$ for t in anchorize_tex apply_tex_patch lookup; do env -u ... sh skills/paper/templates/$t.test.sh >/dev/null 2>&1; echo "$t test exit $?"; done
anchorize_tex test exit 0
apply_tex_patch test exit 0
lookup test exit 0
$ printf '%s\0' <the nine files of Verify 1> | xargs -0 perl -CSD -ne '<the brief's character-set check>'; echo "charset exit $?"
charset exit 0          (no line printed)
$ for f in anchorize_tex apply_tex_patch; do diff ../research-hub/tools/manuscript/$f.py skills/paper/templates/$f.py | grep -E '^[0-9]' | tr '\n' ' '; echo; diff <(sed -n '/^from __future__/,$p' <hub copy>) <(sed -n '/^from __future__/,$p' <new copy>); echo "$f code diff exit $?"; done
2c2 4,9c4 11,13c6 15,16c8 18,19c10,24
anchorize_tex code diff exit 0
2c2 4,10c4 12c6,7 13a9,10 32,36c29,32 38,42c34,64
apply_tex_patch code diff exit 0
$ grep -rn 'literature\|research-hub\|this hub\|tools/manuscript' skills/paper/templates/; echo "grep7 exit $?"
grep7 exit 1          (no line printed)
$ diff <(cat <plain-file copy of lookup.py at 0074728>) skills/paper/templates/lookup.py | grep -E '^[0-9]' | tr '\n' ' '
2c2 11c11,12 13c14 25c26,28 27c30 29c32 30a34,40 34c44 43c53 58c68 60c70 95c105 121c131,136 513c528 537,538c552,553 540c555 565c580 567c582 596c611 670a686,709 1049,1054d1087 1133a1167,1201 1136,1138c1204,1206 1142c1210 1151a1220 1153,1157c1222,1225 1159c1227 1165,1166c1233,1234 1169c1237,1238 1175c1244 1289a1359
  (the report's hunk list, hunk for hunk; the same two files compared as two path arguments print 668a684,707 and 1131a1165,1199 for the two insertions, the same inserted text placed two lines higher. The renames at 513, 537, 540, 565, 567, 596 and 1175 lie in cited_keys, read_record, quote_check_lines and run_quote_check, the quote-check places Verify 4 allows. Nothing lies outside the places Verify 4 allows.)
```

The round's evidence commands, rerun in my scratch folder:

```
$ cd <scratch>/lk && sh lookup.test.sh > first.txt 2>&1; echo "exit $?"      (0074728 lookup.py as a plain file, sha1 9ffecaf21fd99ddae391f1896774b76c33a181bd; the worktree's lookup.test.sh)
exit 1
  29 lines; diff against lines 38 to 66 of the builder's report: "quoted block equals rerun"
$ sh $TMPDIR/b1/lk0/lookup.test.sh >/dev/null 2>&1; echo "orig test on orig exit $?"
orig test on orig exit 0
$ cd <scratch>/hub (the two research-hub scripts and the worktree's two tests) && sh anchorize_tex.test.sh; sh apply_tex_patch.test.sh
PASS: anchorize_tex.py leaves the .tex byte-identical, ...   exit 0
PASS: apply_tex_patch.py replaces, inserts after and deletes only ...   exit 0
$ diff $TMPDIR/b1/lk0/lookup.test.sh skills/paper/templates/lookup.test.sh | grep -E '^[0-9]'
2c2 12a13 134c135 140,141c141,142 318a320,324 319a326,492 333c506      (the five lines it removes are the header, the T6 comment, two T6 lines and the PASS line; no case of 0074728's test is gone)
Point 1, from <scratch>/r1/other, scratch files in ../l4/, ../rec.md, ../texts (output order as printed; the report's blocks print the `exit 2` line before the `error:` line, the lines and statuses are the same):
$ python3 -B -I lookup.py cite-keys ../l4/plain.tex ../l4/nosuch.bib
error: ../l4/nosuch.bib: No such file or directory
exit 2
$ python3 -B -I lookup.py cite-keys ../l4/nosuch.tex ../l4/refs.bib
error: ../l4/nosuch.tex: No such file or directory
exit 2
$ python3 -B -I lookup.py cite-keys ../l4/plain.tex
error: cite-keys takes <main.tex> <file.bib>
exit 2
$ python3 -B -I lookup.py check-urls ../l4/cites.tex ../l4/nosuch.bib
error: ../l4/nosuch.bib: No such file or directory
exit 2
$ python3 -B -I lookup.py quote-check ../rec.md ../l4/nosuch.bib ../texts
error: ../l4/nosuch.bib: No such file or directory
exit 2
Point 3, a scratch record holding "No citation in this record.", the snapshot's lookup.py as lookup_before.py:
$ python3 -B -I lookup_before.py quote-check ../rec.md ../refs.bib ../texts
the report cites no key
exit 0
$ python3 -B -I lookup.py quote-check ../rec.md ../refs.bib ../texts
the integrity record cites no key
exit 0
$ grep -c 'L4 missing .bib\|L4 missing main file\|L4 one argument\|a .bib that cannot be read' skills/paper/templates/lookup.test.sh
0   (exit 1)
$ grep -n 'report' skills/paper/templates/lookup.py skills/paper/templates/lookup.test.sh | cut -c1-110
skills/paper/templates/lookup.test.sh:146:check("T6 a failure is reported", failed)
skills/paper/templates/lookup.test.sh:506:echo "PASS: lookup.py parses recorded bodies, matches titles, merges
$ grep -n -i 'report' skills/paper/templates/lookup.py | cut -c1-80
524:# Reports and BibTeX.
$ grep -rn 'cites no key\|read_report\|report_text\|quote-check <report\|check-urls <report' . (outside .scratch and .git)
skills/paper/templates/lookup.py:27 (the .tex line), :30, :611, :1227 and skills/paper/templates/lookup.test.sh:429; no other hit
$ wc -l skills/paper/templates/*
     135 anchorize_tex.py   117 anchorize_tex.test.sh   285 apply_tex_patch.py   234 apply_tex_patch.test.sh   1393 lookup.py   506 lookup.test.sh   (2670 total)
Point 2, read from the code: lookup.py:94 RETRY_WAIT = 2.0, :95 RETRIES = 3, :96 TIMEOUT = 30, :97 MAX_REDIRECTS = 10, :817 prepare, :822 x-api-key, :824 api_key, :826-827 mailto, :849 get, :851 the redirect loop, :854 range(RETRIES + 1), :858 time.sleep(RETRY_WAIT), :1167 title_check, :1176 the order Crossref, OpenAlex, Semantic Scholar, :1223 the call from run_check_urls. Each of lookup_crossref, lookup_openalex and lookup_s2 (:902-913) makes one get_parsed call.
```

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. `anchorize_tex.py` is equal to the snapshot's and its code below the docstring equals research-hub's (code diff exit 0); its head comment names no hub, no installation and no history (grep7 exit 1).
- 2: holds. The same for `apply_tex_patch.py` (code diff exit 0, grep7 exit 1); its test run on the research-hub copy passes.
- 3: holds. Both tests pass (above) and are equal to the snapshot's; A1 to A4 and P1 to P11 are present as named checks (`anchorize_tex.test.sh:64-102`, `apply_tex_patch.test.sh:92-219`), read again.
- 4: holds. The hunks stay inside the places Verify 4 allows. `USER_AGENT` is at `lookup.py:105`, `cite-keys` and `check-urls` as before this round, and `quote-check <integrity record> <file.bib> <folder>` now prints `the integrity record cites no key` (rerun above), the head comment stating the line (`lookup.py:30`). The title-check bullet gains the sentence "A key with a doi costs up to three requests more than its status request." (`lookup.py:28`). Standards 1 below is a residual comment of this file; it does not change this verdict.
- 5: holds. `tex_cited_keys` (`lookup.py:686`) is the one reader both commands call; unchanged this round.
- 6: holds. The test of 0074728 is kept whole (diff above); the new cases are offline. Standards 2 and 3 below are leftovers of the round's removals; they do not change this verdict.
- 7: holds. The three pages equal the snapshot's, each gaining three commands or six rows as before.

Cases of the brief's "Cases":

- A1: met, `anchorize_tex.test.sh:67-71`, passes.
- A2: met, `:76-77`.
- A3: met, `:82-83`.
- A4: met, the checks from `:85`.
- P1: met, `apply_tex_patch.test.sh:98-108`.
- P2: met, `:115-117`.
- P3: met, `:126-128`.
- P4: met, `:135-138`.
- P5: met, `:146-151`.
- P6: met, `:159-167`.
- P7: met, `:175-179`.
- P8: met, `:186-188`.
- P9: met, `:195-198`.
- P10: met, `:205-208`.
- P11: met, `:216-219`.
- L1: met, `lookup.test.sh:350`; the first run of the final test on the 0074728 file prints the usage line with exit 2 (rerun above, equal to the report's block).
- L2: met, `:356`.
- L3: met, `:368`, run from `elsewhere/`.
- L4: met, `:375`, the error line and exit 2; its first run prints the usage line.
- L5: met, `:418-429`: ratio 1.00 with exit 0, `ratio 0.34 against Crossref, DOI_MISMATCH` with exit 1, `gone: no entry in paper-refs.bib`; first run `error: check-urls takes <report>`.
- L5a: met, `:434-435`.
- L5b: met, `:440-448`, with the control at `:446`.
- L5c: met, `:452`.
- L5d: met, `:456-463`.
- L6: met, `:486-491`: the decoy `references.bib` is not read, `k2: no entry` is printed and `k1: no entry` is not; first run refused with three arguments.
- L7: met. No line of the 0074728 test is gone (diff above), `orig test on orig exit 0`, and none of the 28 failing first-run lines names an old case.

### Findings

Spec: none. The round's delta contains no change that no point asks for and no script.

Proof:

- Report, "Repair round 1", Point 2, third bullet: "Without an `S2_API_KEY`, Semantic Scholar is asked only for a doi neither Crossref nor OpenAlex holds, so a 429 from it shows as `title not checked: Semantic Scholar left out, HTTP 429 after 3 retries`, which is a rate limit and not a defect of the reference." What is wrong: `lookup.py:1176-1184` moves to the next index when an index answers not found and also when it is left out (`if outcome.left_out: left_out.append(...)`, then the loop continues), so Semantic Scholar is also asked for a doi that Crossref or OpenAlex could not answer because of an HTTP 429 or an outage. The claim is a statement about the request count that the tree does not reproduce, and a decision rests on it: step 2's text describing `check-urls` from this report. Failure scenario: step 2's author writes "Semantic Scholar is reached only for a doi the other two do not hold"; on a day Crossref rate-limits a run of 55 dois, every key goes on to Semantic Scholar without an `S2_API_KEY`, and the writer's explanation of the resulting `title not checked` lines does not match the requests made. Verdict: none (the other figures of Point 2, 6 s per request, 18 s per key, at most 4n requests, 4 attempts per request, and every line number it names, reproduce from the code).

Standards:

- `skills/paper/templates/lookup.py:524`: "# Reports and BibTeX." What is wrong: Point 3 asks that every comment that calls the integrity record a report name it the integrity record "and any other you find". This section comment heads `cited_keys`, `passage_line`, `read_record` and `quote_check_lines`, which all read the integrity record, and the report's reading "`lookup.py` has no hit left" holds only for the case-sensitive `grep -n 'report'`; `grep -n -i 'report'` prints this line. Rule 14 of `docs/dev/change-standard.md`, "The rules", asks that a changed name be carried to every place that names it. Failure scenario: a maintainer reading the section list sees "Reports" and looks for a report in the file, where the vocabulary the round set (the integrity record) is the one the head comment, the usage line and the printed line use. Verdict: none (item 4 holds).
- `skills/paper/templates/lookup.test.sh:398-400`: "except lookup.UsageError as error:" / "status = "error: " + str(error)" in `check_urls`. What is wrong: this branch served only the removed check `check-urls a .bib that cannot be read`, which expected the `error:` status; every remaining call of `check_urls` and `check_urls_of` passes files that exist, so the branch cannot run. Point 1 asked to remove "any setup line that only they use". Failure scenario: a reader of the helper believes a refused call can come back through it, and a later check that passes a missing file gets a status string instead of the traceback it should show. Verdict: none (item 6 holds).
- `skills/paper/templates/lookup.test.sh:2` (head comment) and `:506` (the `PASS:` line): "reports an input file that does not exist, and refuses the one-argument check-urls and the two-argument quote-check". What is wrong: the line replaced "takes the .tex, the .bib and the integrity record on the command line" and no longer names two things the test proves, that `quote-check` reads the `.bib` named on the command line and not the `references.bib` of the record's folder (`:479-491`, with the decoy) and that `check-urls` names the `.bib` it was given (`:423`). Item 6 asks for a `PASS:` line naming what the test proves. Failure scenario: a maintainer who reads the `PASS:` line at landing sees no sign that the named-`.bib` behaviour is covered and may drop `L6` as unlisted. Verdict: none (item 6 holds).

Behaviour:

- Report, "Host- or user-visible changes", first bullet: "The requests of the title check are stated in "Repair round 1", point 2." What is wrong: the round asked that this section state the before and after of the requests (one status request per key before; that request plus up to three more per key with a doi, retries and credentials included, now). The section holds a pointer and no before or after; the statement is in the "Repair round 1" section, which the final message of the builder is. Failure scenario: step 2's author, or the orchestrator copying the host-visible changes into a booking or a skill page, reads only this section and describes `check-urls` as making one request per key, which is the scenario the first report's Behaviour finding named. Verdict: none.

Closures: Point 1 is closed. The five checks the first report's Standards finding named are the five removed, the three that guard a wrong pass (`L4 missing input file`, `check-urls one argument`, `L6 two arguments`) stay, the five behaviours are checked by runs that reproduce, and no case of the brief lost its test. Point 2 is closed except Proof 1 and Behaviour 1. Point 3 is closed except Standards 1: the printed line, the head comment, the docstrings at `:528` and `:553`, the renames and the T6 comment and variable all reproduce.

### Declined to judge

- That the plain-file copy of `lookup.py` at 0074728 (sha1 9ffecaf21fd99ddae391f1896774b76c33a181bd, equal to the builder's `lk0` and `lk` copies and the brief-check agent's copy) is the commit's file, and the report's Verify 4 command in its `diff <(git show 0074728:...)` form: only `git show 0074728:skills/literature/templates/lookup.py` settles it, and the refute skill's Rules allow no git command but the three it names.
- The report's `git diff --stat -- docs`: not run in that form; the three pages equal the snapshot's (`diff -q`) and `git diff b2b39ec --stat` prints the three files with 3, 3 and 6 added lines.
- Whether the report should quote, under rule 14 of the rules file, a grep of the renamed names across `skills/`, `utils/`, `docs/` and `README.md`: its grep covers the two files only. I ran that grep outside `.scratch` and found no hit of `read_report`, `report_text` or the old printed line, so no defect stands in the tree.
- How the three indexes answer in practice and the real time a run takes: the figures are counted from the retry code, not measured, and no network request was made.
- The plan's whole verify list and the rewrite of the state file's verify list from 7 to 10 commands under ADR 0010: both happen at landing on main.
- The ADRs in force (0017 and 0018 on `quote-check` and the integrity record, 0019, 0020, 0021) were read against the delta; none governs a change this round makes beyond the printed line, which follows ADR 0018's name for the record.

Reviewer usage: a2421c20d030e1072, claude-sonnet-5-5, 195943 tokens, 40 tool uses, 6.2 min.

## Closed

- First run, 3. Standards 1 (the five checks that pin error wording): closed in the round, point 1; the five checks are gone (`grep -c` of their names prints 0) and their behaviours are quoted as runs, rerun by the reviewer over round 1.
- First run, 4. Behaviour 1 (the added requests of check-urls): closed in the round, point 2, with the report's section and the head comment's sentence at `skills/paper/templates/lookup.py:28`; its two residues are the round's Proof 1 and Behaviour 1 below.
- First run, Declined to judge, the line "the report cites no key": closed in the round, point 3; `quote-check` prints `the integrity record cites no key`, rerun by the reviewer over round 1.
- Round 1, Proof 1 (Semantic Scholar asked only for a doi the others do not hold): fixed at landing, the sentence of `agents/reviews/1-report.md`, "Repair round 1", point 2, now says Semantic Scholar is asked when Crossref and OpenAlex both answered not found or were left out, a 429 or an outage included, as `lookup.py:1176-1184` does.
- Round 1, Standards 1 (`# Reports and BibTeX.`): fixed at landing, `skills/paper/templates/lookup.py:524` reads `# Integrity records and BibTeX.`; `grep -n -i 'report' skills/paper/templates/lookup.py` prints nothing.
- Round 1, Standards 2 (the dead `except lookup.UsageError` branch of `check_urls` in the test): fixed at landing, removed from `skills/paper/templates/lookup.test.sh`; the test prints its `PASS:` line on main.
- Round 1, Standards 3 (the head comment and the `PASS:` line no longer name the named `.bib`): fixed at landing, both name the `.bib` check-urls and quote-check read from the command line.
- Round 1, Behaviour 1 (the report's "Host- or user-visible changes" points at the round's section): fixed at landing, its first bullet states the before and the after of the requests.
