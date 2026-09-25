# Step 8, the review of the landing fixes

Reviewer: a fresh claude:opus agent, read-only, over the unstaged landing fixes on main; usage 113,847 tokens, 15 tool uses, 299 s (the runner's completion notification).

## Spec

none

## Proof

none

## Standards

1. `README.md:126`, sentence 9: "The test fails each error the check exists to catch: ..." and sentence 25: "The test exits 2 on each usage error it exercises: ...". Both are false as written. `utils/check_coverage.test.sh` exits 0 and prints `PASS:` when every case holds, and 1 through `fail()` otherwise; it never exits 2. It is `check_coverage.py` that exits 2 (the `[ "$status" -eq 2 ]` assertions) and that fails each error. In the builder's Doc text both sentences had the subject "It" ("It fails each error it exists to catch", "It exits 2 on each usage error it exercises"). The rewrite made the subject "The test", which the text did not say before. The subject also switches between the test and the check for the same verb: sentence 9 "The test fails", sentence 17 "the check passes", sentences 19, 20 and 23 "It fails" / "It also fails" (the check). This breaks prose standard D, "one term per concept". Fix: make the check the subject of "fails" and "exits 2" throughout, as the other bullets do ("checks that `check_rule_inventory.py` passes ... and fails ...").
2. `README.md:126`, sentences 2, 3, 5 and 6: "The list holds a hidden file, a nested file, ...", "It names a lettered roadmap heading ...", "It has an empty table for an empty folder, a skill folder that is a link, fenced lines, ...", "It holds file names with U+2028 or U+0085 in them ...". The coverage list does not hold files or have a skill folder that is a link. Those are in the scratch skill folders (`$root/alpha/.gitkeep`, `ln -s ../real/beta "$root/linked"`, `$root/sep/...`), and the lettered and done lettered forms are in the scratch `docs/roadmap.md`. The builder's text avoided this by listing the items in a parenthesis after "passes a complete coverage list". The four sentences also repeat one construction ("The list holds / It names / It has / It holds"), which prose standard 0 ("No repeated construction") forbids.
3. `README.md:126`, repeated construction later in the bullet: "It also fails" opens sentences 10, 12 and 23; "It fails" opens sentences 19 and 20 in a row; sentence 21 "Such a span is ..." is followed by sentence 22 "It is also a folder in it, ...". In sentence 22, "It" means the span and "it" means the folder, so the pronoun is ambiguous. Prose standard 0 (repeated construction) and E (cold opens) apply.
4. `README.md:126`, sentence 11: "The table errors it fails are a wrong cell count or table header, a missing separator row, a row after the table, a section with no table, and a missing or repeated section." A missing or repeated section is not a table error (the check reports it as `no '## <skill>' section` / `'## <skill>' appears more than once`, lines 278 and 281 of `utils/check_coverage.py`). The label the rewrite added makes the grouping false.
5. `README.md:126`: sentence lengths the prose standard (E, "under roughly 20 words") does not allow, measured by splitting on sentence ends: sentence 5 has 32 words, 11 has 33, 15 has 43, 9 has 42, 25 has 45, 26 has 28 and 17 has 27. Sentences 9, 15 and 25 are enumerations. Prose standard D says "Three or more list-shaped items in paragraph form become a list", but the other bullets in this README section use the same inline form, so this is the house form of the section. Sentences 5 and 11 are rewrite-introduced groupings that could be split further.
6. `docs/academic-coverage.md:14`: "That name is a repository path such as `skills/paper/SKILL.md`, and paths of the source skill may stay beside it." The sentence still holds two statements joined by "and", the form and the permission. The Closed section says "lines 14 and 26 split into sentences of one condition each", which this sentence does not meet. The same line keeps "the file of the new skill that holds what the file did". There "the file" names two different files (the new skill's file and the listed source file).
7. `docs/academic-coverage.md:26`, first sentence: "Once a new skill is built, the same check with `--built <skill>` (repeatable) also fails a row marked `rebuild: <skill>` whose reason names no file of `skills/<skill>/` in backticks." This is 29 words. Standards 1 of the round asked for sentence length (prose standard E) as well as one condition per sentence. The condition split is done, but this sentence is still past the length the standard allows. Moving "(repeatable)" and the when-clause into their own sentence would bring it under the limit.
8. `docs/academic-coverage.md:26`: the page says what `--built` fails, but not what a pass does not prove. The builder's note (8-report.md:542: "it proves that the named file exists in `skills/<skill>/`, not that it holds what the row's source file did. A row can name `skills/<skill>/SKILL.md` for every file and pass.") is carried only into `plan.md` step 10. On the page where the option is shown, a reader can take a `--built` pass as proof that the re-mark was checked. Change standard rule 9 ("A green result states, in the same breath, what it does not cover") and rule 5 apply to this page.

## Behaviour

none

## Verification

- README.md:126, the cases each claim names, checked in `utils/check_coverage.test.sh`: complete, repeated-skill, lettered, lettered-dotted, done-lettered (4.C. and 7.D), roadmap-separators, escaped-last-cell, separator-names, newline-name (one "is not listed" line), nfc-names, order, empty-table/empty-folder, nested-link, backtick-info, fenced-rows/long-fence, closing-hashes, linked-empty/linked-listed, gamma-named, missing-hidden, missing-nested, listed-twice, not-a-file, wrong-section, dotdot/absolute/not-normal, no-backticks, unknown-mark, unknown-skill(-later), empty-reason, two-cells/four-cells, wrong-header, no-separator, row-after-table/blank, indented-table/no-table, no-section, section-twice, new-skills-twice, unclosed-fence, entry-missing, skill-twice, empty-entry/empty-skill, built-named, built-none (with the :29 absence check), built-source-only, built-repeated, built-missing, built-not-a-file loop (`../paper/SKILL.md`, `./SKILL.md`, `.`, `skills/paper/`, `templates`, `Templates/VENUE.tex`, `linked.md`), built-nfc, built-later and control, built-no-row, built-not-new, built-no-value, built-bad-name ("", ., .., paper/templates), built-no-folder, the usage cases, outside-repo, latin1, find-fails, and the snapshot in `direct()`. Every case each sentence names exists and asserts what the sentence says. The exceptions are the subjects and grouping in Standards 1, 2 and 4.
- Clause-by-clause comparison with the Doc text at 8-report.md:548-556: every item of the builder's text appears in the rewrite (pass list, section control, repeated skill, fail list, newline name, New skills cases incl. `## 6.B.`, line separator, `\|` last cell, sort order, `--built` pass incl. other spans and Unicode form, fail incl. source-only, the seven listing-miss forms, not-a-New-skills-row, no-row, the three controls, usage errors incl. find and the four `--built` usage errors, scratch-folder check). None is lost.
- `docs/academic-coverage.md:26` against the code (`built_path_error`, `check` lines 315-318) and a scratch probe: a git repo under $TMPDIR with copies of `docs/academic-coverage.md` and `docs/roadmap.md` and `skills/{code-comments,paper,writing}/SKILL.md`. Results:
  - `--built code-comments`: ":0: --built names 'code-comments', but no row of the sections read is marked 'rebuild: code-comments'", exit 1.
  - `--built writing`: :78, :102, :103 "names no file of skills/writing/ in backticks", exit 1.
  - With every `rebuild: writing` reason given a span:
    - `skills/writing/SKILL.md`: ok.
    - `skills/writing/./SKILL.md`: "names no file of skills/writing/ that exists".
    - `skills/writing/sub` (a folder): the same error.
    - `skills/writing/lnk.md` (a link inside the repository): the same error.
    - `skills/writing/skill.md` (a case variant): the same error.
  - Each sentence of lines 14 and 26 is true of the code. Standards 1 of the round (the one-condition split of line 26) and Standards 2 (the not-normal-form path) are addressed, apart from Standards 6 and 7 above.
- Skills with no `rebuild:` row: `grep -c "| rebuild: $s |" docs/academic-coverage.md` per New skills row printed writing 3, code-comments 0, paper 30, paper-review 21, rebuttal 7, grant 0, literature 19, idea 3, scaffold 0, project-docs 0, researcher 6, submit-manuscript 1, submit-grant 0 (`rebuild later:` also 0 for the zero rows). Entries 4, 8, 11 and 12 (code-comments, grant, scaffold, project-docs) are exactly the entries in the range 3 to 14 with none, as the step 10 line and the Closed section say. submit-grant is entry 15, outside that range.
- `plan.md` step 10 carries Behaviour 1 (entries 4, 8, 11 and 12 leave `--built` out) and the builder's note ("a checked record per built row that the named file holds what the source file did, since `--built` proves only that the file exists"). The source text is at 8-report.md:542. `grep -n '^# Repair round 1' 8-report.md` printed line 286, the section the Closed section cites.
- `orchestrator-state.md` diff: round_reviewer usage "115,791 tokens, 24 tool uses, 431 s" matches 8-refuter.md; `landing: cherry-picking`.
- `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0, last three lines:
  ```
  ok: skills/roadmap/SKILL.md
  ok: skills/spec/SKILL.md
  verify: 12 commands passed
  ```
  (`grep -c '^PASS:'` 10, `grep -c '^ok:'` 10.)
- `sh utils/check_coverage.test.sh 2>&1 | tail -1`: `PASS: check_coverage.py scratch tests`
- `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research`: `ok: docs/academic-coverage.md`, exit 0.
- `LC_ALL=C grep -n '[^ -~]'` over README.md, docs/academic-coverage.md, utils/check_coverage.py, utils/check_coverage.test.sh, plan.md, 8-refuter.md, orchestrator-state.md: hits only on `plan.md` lines 17, 20, 21, 23 and 24, each the U+2705 mark on a done step. The repository's ASCII check allows that character in `.md`. There are no hits in the changed lines.
- `git status --short` at the end is unchanged from the start (the same seven entries). No file in the repository was written.

## Not checked

- The staged diff of `utils/check_coverage.py` and `utils/check_coverage.test.sh` was not re-reviewed beyond its docstring, head comment and cases. The reverts of the round were not rerun.
- `git diff --cached` of `docs/academic-coverage.md` was read only through the lines the unstaged diff touches and lines 20-31 of the working copy.
- The check's behaviour on a case-sensitive file system: not verified.
