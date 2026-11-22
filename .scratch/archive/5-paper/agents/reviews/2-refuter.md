# Step 2 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-2, base 05a4bd6)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]' | grep 'skills/paper/\|skills/writing/'
838 skills/paper/SKILL.md
779 skills/writing/SKILL.md
$ python3 -c 'import glob,yaml; [print(f, yaml.safe_load(open(f).read().split("---")[1])["name"]) for f in sorted(glob.glob("agents/ordo-*.md"))]'
agents/ordo-high.md ordo-high
agents/ordo-low.md ordo-low
agents/ordo-max.md ordo-max
agents/ordo-medium.md ordo-medium
agents/ordo-xhigh.md ordo-xhigh
$ grep -rn 'research-hub\|entry [0-9]\|step [0-9]\|15\.A' skills/paper/SKILL.md skills/paper/references/
grep 6a exit 1
$ grep -rnw 'literature' skills/paper/SKILL.md skills/paper/references/ | grep -v 'literature strategist\|literature-strategist' | wc -l
      37
(each line read: the ordinary noun, no skill name)
$ character-set perl of the brief over the 28 changed files (14 tracked from git status --short, skills/paper/SKILL.md, the 13 pages)
28 files, charset exit 0
$ the same perl over .scratch/5-paper/agents/reviews/2-report.md
report charset exit 0
$ git diff 05a4bd6 -- .agents/plan.yaml skills/plan/templates/plan.yaml skills/plan/templates/orchestrator-state.md | grep '^[-+][^-+]'
6 changed lines, each `reviewer: <same value> # <comment>` or `reviewer_effort: high # <comment>`: values unchanged, only the comment gains "the role agents of /paper"
$ git diff 05a4bd6 -- docs/academic-coverage.md, compared word by word (python difflib over the 55 -/+ line pairs)
55 55
word changes other than punctuation: 1  (an alignment artifact: `agents/integrity_verification_agent.md`. | becomes `agents/integrity_verification_agent.md`, held in `skills/paper/references/integrity-verification.md`. |, so no word was dropped)
$ git show 05a4bd6:skills/writing/SKILL.md | grep -n -i number ; sed -n 5p
92: ... (line numbers of the draft), 139: ... (neither numbers the findings);   version: "1.0.0"
$ git show 05a4bd6:skills/paper/SKILL.md
fatal: path 'skills/paper/SKILL.md' exists on disk, but not in '05a4bd6'
$ git show 05a4bd6:docs/academic-coverage.md | grep -c 'skills/paper/'
1

Reruns of the report's part 6 (S1 to S20) and C15, on a fresh mktemp -d folder (/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/tmp.hb64mjpue5), $K = skills/paper/templates, lookup.py under env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE:
S1  anchorize_tex.py main.tex -> "main.tex.block-manifest.json: 5 blocks, 141/150 chars in blocks", exit 0, the manifest beside the file
S2/S3  mv to patches/pending/, then to patches/01-main.tex.*; --check-only exit 0; --manifest --output patches/01-main.tex.patched exit 0; ls patches: 01-main.tex.block-manifest.json 01-main.tex.patch.json 01-main.tex.patched 01-main.tex.patched.apply-report.json pending; cp; cmp exit 0; shasum bb68732234bb...14c16ae equals "output_sha256": "bb68732234bb...14c16ae"
S4  manifest 01 against the file after the copy -> "kind": "stale-manifest", exit 2
S5/S10  empty roadmap_item_ids -> validation "OP001: roadmap_item_ids must name at least one reviewer item" exit 2; ops [] -> schema "ops must be a non-empty list" exit 2; blank new_text -> validation "OP001: new_text is empty; use delete_block to remove a block" exit 2; two ops on B0003 -> validation "OP002: block B0003 is already addressed by OP001; a block takes at most one op" exit 2; kind rename_block -> validation "OP001: kind must be one of [...]" exit 2
S6  --output main.tex -> "kind": "output", exit 2, base hash unchanged; no --output and no --check-only -> "apply_tex_patch.py: error: --output is required unless --check-only is used", exit 2
S7  \section{Intro} to \section{Other} -> structural "heading rewritten: \\section{Intro} becomes \\section{Other}", exit 3; with --acknowledge-structural exit 0
S8  patch file "not json" -> JSONDecodeError, exit 1; anchorize_tex.py missing.tex -> FileNotFoundError, exit 1; anchorize_tex.py with no argument exit 2
S9  refs.bib of 3 entries separated by blank lines -> 3 blocks; nob.bib of 2 entries on consecutive lines -> "1 blocks"
C15 bib  insert_after on refs.bib adding scratchkey2026: apply exit 0, cmp exit 0; cite-keys for a .tex not citing it -> "unused: scratchkey2026" exit 1; citing it -> nothing, exit 0
S11  cite-keys: citing a2020,c2022 -> "unused: b2021" exit 1; citing d2023 -> "missing: d2023" and three unused, exit 1; citing all three -> exit 0
S12  check-urls up: good ratio 1.00; mism "ratio 0.19 against Crossref, DOI_MISMATCH"; noid "no identifier"; ghostdoi "404 ..., doi not found in Crossref, OpenAlex or Semantic Scholar"; badurl "failed, no answer (URLError) ..."; absent "no entry in u.bib"; exit 1. Proxy to a closed port: each DOI line "failed, no answer (URLError) ..., title not checked: Crossref left out, no answer (URLError); OpenAlex left out ...; Semantic Scholar left out ...", exit 1. search x --limit 101 -> "error: --limit needs a whole number from 1 to 100" exit 2; --year -> "error: unknown option --year" exit 2
S13  resolve 10.1038/nature14539 -> Crossref and OpenAlex ratio 1.00, "Semantic Scholar: not found", "arXiv: left out, the input has no arXiv ID", exit 0; resolve 'Attention is all you need' --year 2017 -> arXiv ratio 1.00, "Semantic Scholar: left out, HTTP 429 after 3 retries", exit 0
S14  fetch 1706.03762 ft vaswani/2017:att -> "tried https://arxiv.org/html/1706.03762: HTTP 200, full text", exit 0, vaswani_2017_att.txt; fetch 10.9999/nonexistent.12345 -> "no full text and no abstract" exit 1; fetch 10.1126/science.1127647 ft k -> "no full text; the abstract is in k.abstract.txt" exit 1
S15  quote-check: "line 6: malformed passage line", "line 2: ... sec. 1: found", "line 3: k, abstract: found", "line 4: k, abstract: not found", "line 5: absent, p. 1: not found, no absent.txt", "absent: no entry", "absent: no text", exit 1
S16  search 'deep learning' --limit 100 -> exit 0, 99 [arXiv], 100 [Crossref], 99 [OpenAlex], "Semantic Scholar: left out, HTTP 429 after 3 retries"; refs -> exit 0, 51 lines; cited-by -> exit 0, 102 lines, "OpenAlex: first 100, more exist"
S17  bibtex 10.1038/nature14539 -> "@article{LeCun_2015, title={Deep learning}, ..."; bibtex 1706.03762 -> "@misc{arxiv_1706_03762, ..."; bibtex 10.9999/nonexistent.12345 -> "doi.org: HTTP 404, not a BibTeX entry" exit 1
S18  resolve with the three variables set to marker values -> exit 0, marker lines 0, "OpenAlex: left out, HTTP 401", "Semantic Scholar: left out, HTTP 403"
S19  printenv CLAUDE_CODE_EFFORT_LEVEL -> exit 1; grep -l -F -e '\begin{abstract}' -e '\abstract{' main.tex bad.tex none.tex -> "main.tex" exit 0; on none.tex exit 1
S20  latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex -> exit 0, main.pdf; on bad.tex -> exit 12, "! Undefined control sequence."
C16 by reading (grep -n of the real files, research-hub read only): dongho:839 \bibliography{refs}, folder has refs.bib; linfoot:501 \bibliography{main}, main.bib, its \input{tables_generated} holds no bibliography line (grep -c 0); meseret:566 \bibliography{References} and :570 "% \bibliography{References}", folder has references.bib; bare_jrnl:1082 \bibliography{IEEEabrv,main}; ecg-readable-substrate: no \bibliography, thebibliography at 288 and 436
C17  quoted path '/tmp/my dir/it'\''s here/main.tex' and topic 'state "of the art" $(echo INJECTED) `echo INJ2`' through sh -c "printf '[%s]\n' $qp $qt" -> two lines, each value whole, nothing substituted, exit 0
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated, Standards 7 (the reference section "The patch file" is not read by every run). Frontmatter, version "1.0.0", "Triggers on:" (grep -c 1), description 838 and the section order hold.
- 2: holds, Quick start has the seven modes with D26's arguments, the `projects:` form and the refusal of an unknown mode and `/paper plan` (Steps 1 and Stops "Unknown mode").
- 3: holds, Use instead has the six rows, `idea` among them, and Steps 1 states the plan-mode sentence.
- 4: holds, "What it reads" 1 to 9 match the item; C16 by reading.
- 5: holds, Steps 1 to 7 in order with their criteria; quoting run in C17.
- 6: violated, Spec 4 (parallel figures before the outline's approval and before `arguments.md` exists), Spec 5 (the integrity agent of revision gets no `.tex`), Behaviour 2 (disclosure mode gives an agent a served model no agent has yet).
- 7: violated, Spec 2 (`patches/pending/` staging in place of the item's numbered manifest and patch path).
- 8: holds, Steps 12 and full 14, revision 1 and 6; Behaviour 1 records an id collision that originates in Decision 6.
- 9: holds, Steps 11; Behaviour 3 is minor.
- 10: holds, every stop and refusal the item lists stands in Stops and in the steps that reach it; Spec 3 records an extra stop the report does not name as an addition.
- 11: violated, Standards 1 to 4 and 6, Spec 6.
- 12: holds, full mode's closing checks hold the formatter checklist of `formatter_agent.md` "Pre-Output Final Checklist" item by item and the six statements; Standards 5 records a contradiction between the orphan-citation check and Steps 11.
- 13: holds, README row, line 79 and the install loop.
- 14: holds, the six comment lines change only comment text, sync_rules prints ok, the five agents parse.
- 15: holds, 55 rows gain "held in" with every original word kept (word comparison above), check_coverage exits 0; the "held in" sample is under Proof; Spec 1 records that the edit was made by an unapproved script, and Spec 7 records two inaccurate "held in" placements.
- 16: holds, sample of 19 records under Proof, all 31 quoted lines found at the named place.
- 17: holds, every S1 to S20 command reproduces its sentence on my rerun; exit 4 judged by reading (below); Proof 1 and 2 are evidence defects only.
- 18: holds, `skills/writing/SKILL.md` version "1.1.0", the numbering rule in the checking agent's report rules, "numbered" in the description, no other file of `skills/writing/` changed (git status --short).

NOT DONE (1), the exit-4 sentence: correct under the no-breakage rule. Reaching exit 4 needs a broken script, and the rule forbids that. By reading, `skills/paper/templates/apply_tex_patch.py:51` ("self-check, when a block no op names is not in the written output ... The output is removed then."), `:63` ("4 for a self-check failure, which is a defect of this script.") and the `fail(4, "self-check", ...)` call at `:275` give the exit and its meaning. Steps 10 ("Exit 4 or exit 1: the stop "A script failed" ... The file stays as it was.") is true: the output is removed and the file has not yet been copied over. NOT DONE (2) is a fact of the runner and needs no ruling.

Cases of the brief's "Cases":

- C1: met, the headings run Quick start, Use instead, What it reads, Steps, seven mode subsections, Agent prompts, The patch file, Stops, Anti-patterns, Rules; every Steps and mode item ends on "Done when" except the seven "End the run (Steps 13)" items, which take Steps 13's criterion; `git show 05a4bd6:skills/paper/SKILL.md` fails on the base.
- C2: met, read in Quick start and Steps 1.
- C3: met, read in Use instead.
- C4: met, Steps 4 and 8 and the Agent prompts table.
- C5: met, for the 19 sampled records and the 24 sampled "held in" rows; Spec 7 is a wording point of two rows.
- C6: partial, Spec 6 (citation compliance judges a claim unsupported with no passage read, against ADR 0018 and the skill's Rules) and Spec 8 (the integrity record of the first check is overwritten, against ADR 0020).
- C7: partial, Spec 2.
- C8: met, Steps 12 and revision item 1.
- C9: partial, Spec 8 (the files full mode leaves lose the first check's record). The temporary folder: made with `mktemp -d` and removed "on every path that ends the run", which holds.
- C10: met.
- C11: met.
- C12: met.
- C13: met, `git show 05a4bd6:skills/writing/SKILL.md` has no numbering rule; the worktree has it.
- C14: met, "What it reads" 7 and Steps 6.
- C15: met, rerun above.
- C16: met, by reading the real files' lines against "What it reads" 5.
- C17: met, sh -c run above.

## 1. Spec

- Brief "Paths this step writes", closing paragraph: "No script is written for this step, by the builder or by the session that runs it inline, other than a script the step builds under "What to build". Any other script needs the user's approval of what it computes, quoted from a line of `plan.md`'s Rulings." What is wrong: the builder wrote and ran scripts under `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/paper2/`. They are `bibrule.pl` (computed C16), `cov/apply.py` (wrote the 55 coverage edits into the worktree: `doc="/Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-2/docs/academic-coverage.md"` and `open(doc,"w",encoding="utf-8").write("\n".join(lines))`), `cov/verify.py` (the check of the records' quotes), `gen/build.py` to `build4.py` and `gen/cov.py` (built the report text) and `c17/mk.py`. `grep -n -i script .scratch/5-paper/plan.md` shows no Rulings line approving any of them. The report names `bibrule.pl` and `verify.py`, and it does not name `cov/apply.py` or the report generators. Failure scenario: the user reads "Each record was written after reading the source file whole" and "the quoted stretches were re-checked by a script", and cannot tell which parts of the records and of the coverage edits a reading produced. My checks stand without these scripts: the word comparison of the 55 rows, the 31 quotes read at their places, the 24 "held in" rows read against their pages, and C16 read from the real files. Verdict: the brief's script rule is broken; no item verdict changes, since the reruns reproduce the outputs. Disposition belongs to the user (open item).
- `skills/paper/SKILL.md`, Steps 9 and 10: "Move that manifest with `mv` to `patches/pending/<file name>.block-manifest.json`" and "Move its manifest and its patch from `patches/pending/` to `patches/<nn>-<file name>.block-manifest.json`". What is wrong: item 7 has the session move the manifest straight to `patches/<nn>-<file name>.block-manifest.json`, and the agent writes `patches/<nn>-<file name>.patch.json`. The staging folder replaces that shape. The report lists no judgment call for it, and a manifest whose agent wrote no patch stays in `pending/` (my rerun's `ls patches` shows `pending`). Failure scenario: an agent is given `sections/method.tex` and `appendix/method.tex`. The second `mv` overwrites `patches/pending/method.tex.block-manifest.json`, and both patches would be written to `patches/pending/method.tex.patch.json`. One file's patch is lost or checked against the other file's manifest. The item's numbered names do not collide. Verdict: item 7 violated, C7 partial.
- `skills/paper/SKILL.md`, Stops, the introduction "The first eleven rows are stops", and the row "The draft review does not pass". What is wrong: item 10 lists ten stops. The eleventh is an addition, and judgment call 3 only counts eleven without naming it as one. Failure scenario: the orchestrator reading the report takes the Stops table as item 10's list and does not rule on a stop that ends a full run. Verdict: none on item 10 (its stops are all present); the addition is unreported.
- `skills/paper/SKILL.md`, ### full, item 4: "When the Notes of `config.md` say "figures in parallel", start the visualization agent of item 7 together with it, and start item 6 after both have ended." What is wrong: Decision 2 orders visualization after the first draft. Item 7, which this bullet starts, is given "`outline.md`, `arguments.md`", and `arguments.md` does not exist while the argument builder that writes it is running. The start also falls before the stop "The outline's approval" (item 5). Failure scenario: the user changes the outline at item 5. The figures in `figures.md` were built on the outline the user changed and on no argument, and item 6's draft includes them. Verdict: item 6 violated.
- `skills/paper/SKILL.md`, ### revision, item 4: "Start the integrity verification agent (Steps 8) for the check of changes, given its row of `references/integrity-verification.md`, `config.md`, the apply reports of the patches, the `.bib`, the temporary folder and the project's materials." What is wrong: the item names no main `.tex` or the files it inputs, and Steps 9 is not named, so no file path reaches the agent. An apply report holds only counts per op (rerun: keys `op_id, kind, block_id, section, roadmap_item_ids, rationale, chars_before, chars_after`). The check-of-changes row ("Every claim a patch changed", "Every paragraph a patch added or substantially changed") needs the changed text. The Agent prompts row for integrity verification also lists no `.tex`. Failure scenario: a revision changes a sentence's number from 12% to 21%. The integrity agent holds `chars_before: 35, chars_after: 36` and cannot read or judge the claim. Verdict: item 6 violated.
- `skills/paper/references/citation-compliance.md`, An unsupported claim: "A claim that the annotation does not contain and that the agent cannot place in the source is an unsupported claim." and "A claim that is not in its source at all is marked Critical, stops the check, and the session raises the stop "A claim the run cannot support" for it." What is wrong: the judgment rests on the `review.md` annotation, and the citation compliance agent is given no temporary folder and no fetch. ADR 0018 holds that a judged claim rests on a passage read in the run, and so do the skill's Rules ("A claim rests on a passage read in the run from the source's full text.") and its Anti-patterns ("A claim judged from the abstract, from memory or from the source's title"). In citation-check mode no `review.md` is given (### citation-check, item 2), so the stop "A cited claim not in its source" that item names cannot rest on anything. Failure scenario: a full run's annotation omits a result that the source states on page 7. The agent marks the claim Critical and stops the run for the user, and no passage was read. Verdict: C6 partial, item 11 violated.
- `docs/academic-coverage.md`, rows 169 and 82. Row 169: "sampled sentences searched on the web and graded from original to verbatim, and a self-plagiarism check against the authors' earlier papers, held in `skills/paper/references/integrity-verification.md`". Row 82: "an unknown venue's policy is requested, held in `skills/paper/references/ai-disclosure.md` and `skills/paper/SKILL.md`". What is wrong: integrity-verification.md searches through `lookup.py search` and its note says "It does not search web pages", so row 169 now marks a web search as held. Item 15's word rule kept "on the web". Row 82's request is the intake question "Venue AI policy" in `references/intake.md`, Questions, marked by mode, and `SKILL.md` holds no request. Failure scenario: a reader of the coverage inventory looks for a web search or a policy request in the named file and does not find it. Verdict: none (item 15's form is met); a wording point for the user.
- `skills/paper/SKILL.md`, ### full, item 13: "It writes `integrity.md` again." and `skills/paper/references/integrity-verification.md` (the issue numbering list): "A later check writes a new record with its own numbers." What is wrong: ADR 0020 and D27 keep "the integrity record with its passages" in the run folder. The second check overwrites the first check's record, so the passage lines of the claims only the first check judged are lost. The ids `I<m>` restart, and the patch trail then names `I1` for two different issues. Failure scenario: the rebuttal skill, or the user, reads `patches/03-main.tex.patch.json` naming `I2` and finds a different `I2` in `integrity.md`. A claim judged at the first check has no passage left in the run folder. Verdict: C6 partial, C9 partial.

## 2. Proof

- Report part 6, S5: "== output kind: --output equal to the base" over a validation rejection ("the patch's base_sha256 does not match the manifest ..."), and the command text "its heading is the name of the attempt it came from". What is wrong: the heading labels a validation output as the output kind, and the sentence narrates the builder's attempt. My rerun gives the output kind only for `--output main.tex` with a valid patch (exit 2, "kind": "output"), as S6 shows. Failure scenario: a reader takes S5's third block as the evidence for `kind` `output`. Verdict: none; item 17 holds by rerun.
- Report part 6, S14: "$ lookup.py fetch 10.1126/science.1127647 ftdir3 k" with "no full text; the abstract is in k10_1126_science_1127647_.abstract.txt". What is wrong: the same command form on my rerun, with the stem `k`, printed "the abstract is in k.abstract.txt" and wrote `k.abstract.txt`. The builder's log line does not show the argument that ran. The sentence in integrity-verification.md, Reading the source ("The stem is the key with each `/` and `:` written `_`"), matches my rerun. Failure scenario: a reader checking the stem rule against S14 finds a stem that contradicts it. Verdict: none; the sentence holds.
- Coverage records, sample of 19 records (rows 51, 52, 53, 54, 55, 56, 57, 58, 59, 62, 63, 65, 66, 74, 76, 78, 81, 82, 105 by their cited lines). The 31 quoted lines were printed with `sed -n <line>p` and each quote stands at its named place: SKILL.md full items 5, 12, 15 and the closing checks; abstract.md Which abstract, The five parts, The keywords, Abstract-only mode; argument-builder.md The weak-argument signs; citation-compliance.md Retractions and An unsupported claim; draft-writer.md Citations, Patches, The anti-leakage rule, Statistics and language; intake.md DOI checking; literature-strategist.md The four searches and The distribution advisory; peer-reviewer.md The verdict and The second draft review round; structure-architect.md word counts; visualization.md Pitfalls and The ten checks; integrity-verification.md Claims that go beyond their source; statements.md Authorship; ai-disclosure.md Categories and The full statement. Each line holds the part it is cited for. Findings: none.
- "Held in" sample of 24 rows read against the file each names: 51, 54, 57, 59, 63, 76, 81, 82, 85, 87, 92, 94, 96, 99, 104, 105, 151, 159, 169, 187, 190, 213, 215, 232. Each named file holds the part, except the two wording points of Spec 7. Row 56's closing checks were compared with `formatter_agent.md` "Pre-Output Final Checklist" item by item. Conversion content loss, table counts and conversion commands are not built, and the row sends them to entry 15.A and to submit-manuscript.

## 3. Standards

- `skills/paper/references/structure-architect.md`, The structure: "The Conference Paper skeleton is the default, since most papers of the hub go to conferences." What is wrong: "the hub" names a project, research-hub. `docs/dev/change-standard.md`, "Rules this repository already states": "The skills carry no project name and no path". The brief's Conventions say the same. The brief's grep 6a does not match "hub". Failure scenario: a user of another repository reads a reason that refers to a repository they do not have. Verdict: item 11 violated.
- `skills/paper/references/literature-strategist.md`, The BibTeX entries: "an included source whose DOI or key is already in it gets no new entry" and "A new entry whose key only collides with an existing key gets the key with the first unused letter appended". What is wrong: the two rules contradict each other for a key that is in the `.bib` with another DOI (change-standard rule 19). The wording comes from brief item 11 ("skipped when its key or its DOI is already in the `.bib` and given a new key when only its key collides"). Failure scenario: the `.bib` holds `smith2020` with DOI A, and an included source has key `smith2020` with DOI B. The first rule skips it, the second writes `smith2020a`, and two runs can differ. Verdict: item 11 violated, origin the brief.
- `skills/paper/references/citation-compliance.md`, The checks of the whole reference list: "**Retractions.** A retracted source is removed and replaced by another source." against The corrections: "A correction that has one right answer is written as a patch" and "An ambiguous case is flagged and is never changed." What is wrong: the choice of a replacement source has no single right answer, so the two rules contradict each other (rule 19). The replacement source is also cited without a passage read. Failure scenario: the agent writes a patch that swaps a retracted source for one it picked from memory, and the claim now rests on a source no one read. Verdict: item 11 violated.
- `skills/paper/SKILL.md`, ### full, item 12: "After draft review round 2, an overall score of 6.5 or more goes on to item 13" and "A verdict Reject, or a Critical issue unresolved after draft review round 2, is the stop "The draft review does not pass"." Also `skills/paper/references/peer-reviewer.md`, The second draft review round: "A score below 6.5 with a Critical issue unresolved, or a verdict of Reject in either draft review round, stops the run". What is wrong: three conditions for one stop that disagree (rule 19). Failure scenario: round 2 gives 7.0 with one Critical issue open. The first bullet goes on, the second stops, and the peer reviewer's page goes on. Verdict: item 6 violated (the stop a mode reaches is not determinate).
- `skills/paper/SKILL.md`, ### full, the closing checks: "Every cited key has an entry in the `.bib`, and every entry is cited, as the output of `lookup.py cite-keys` shows.", with "each check that fails is an issue of its report". Against Steps 11: "An `unused:` line goes to the user in the final message, and no role removes the entry", and Anti-patterns: "An `unused:` entry removed from the `.bib`". What is wrong: an uncited entry becomes a peer-review issue sent to the draft writer, while Steps 11 sends the same fact to the user and forbids removing the entry (rule 19). The brief asks for both (items 9 and 12). The skill can route this check's failures as "needs the user", which the peer reviewer's page already defines. Failure scenario: a full run whose strategist's `.bib` holds 60 screened sources, 40 of them cited. Twenty `D1-<m>` issues go to the draft writer, which either cites sources the argument does not use or leaves the issues open into round 2. Verdict: none on item 12 (it is built as asked); the contradiction is the brief's.
- `skills/paper/references/draft-writer.md`, Paragraphs: "A load-bearing paragraph ... is written with the most care and revised several times." And `skills/paper/references/literature-strategist.md`, The four searches: "The search stops when at least 3 of these conditions hold:" with "When none of the 5 holds after 4 passes of searching, the agent records a "search limitation" in the report and goes on." What is wrong: `docs/dev/skill-layout.md`, "Writing for an agent": "Every repeat a skill asks for states its count and what happens when the count is reached". "Several times" has no count. The search has an end only when 3 conditions hold or none holds, so a search where 1 or 2 hold after 4 passes has no stated end. Failure scenario: two of five conditions hold after the fourth pass, and the strategist either searches without end or stops on its own judgment. Verdict: item 11 violated.
- `skills/paper/SKILL.md`, the reference section "The patch file". What is wrong: `docs/dev/skill-layout.md`, "Writing for an agent": "A reference section of row 6 of "Sections, in order" holds only material every run reads." Outline-only mode and lit-review without a `.tex` write no patch, so they do not read it. Failure scenario: an outline-only run loads a section it never uses. The cost is small. Verdict: item 1 violated (minor).

## 4. Behaviour

- `skills/paper/SKILL.md`, ### revision, item 1: "A comments file that is a `/writing` report gives items `W<k>`", and Steps 12: "Each op of its patch names `W<k>` for the finding `k` it answers". What is wrong: one revision run of a `/writing` report gives two sets of `W<k>` ids, the input report's and the ending `/writing` run's, in the same `patches/` trail. The id table in "The patch file" has one `W<k>` row. The scheme comes from brief Decision 6, and the report does not state the collision. Failure scenario: patch 01 names `W3` for the input report's finding 3, and patch 06 names `W3` for the closing `/writing` run's finding 3. A reader of the trail, such as the rebuttal skill reading the apply reports (ADR 0020), maps both to one finding. Verdict: none on item 8 (built as the brief asks); a brief defect for the user.
- `skills/paper/SKILL.md`, ### disclosure, item 1: "Start the draft writer (Steps 8 and 9), given `config.md`, ... and the model the runner served the agents of the run." Also `skills/paper/references/ai-disclosure.md`, The full statement: "The model identifier is the one the runner served, never one written from memory." What is wrong: in disclosure mode the draft writer is the first and only agent. Steps 8 reads the served model "right after the start", after the prompt is given, so no served model exists to put in its prompt. Failure scenario: the session writes the configured model name from `.agents/plan.yaml` into the prompt, which is what the page forbids, or it writes nothing and the statement lacks the identifier. Verdict: item 6 violated.
- `skills/paper/references/citation-compliance.md`, DOI and URL, and `skills/paper/SKILL.md`, Steps 11: "A `missing:` line or a doi status failure goes to the citation compliance agent". What is wrong: with the network down, check-urls prints for every entry with a DOI "failed, no answer (URLError) https://doi.org/..., title not checked: Crossref left out, ...", exit 1 (rerun with the proxy at a closed port). The line matches both the "failed, <reason>" rule (look the source up and correct it, or flag it) and the "title not checked" rule (pass it to the user unchanged). Failure scenario: a network outage turns every DOI entry into a `C<m>` issue and a correction pass, where a single network note to the user was meant. Verdict: none (item 9's text is followed); minor.

## Declined to judge

- Whether each coverage record "was written after reading the source file whole": a reading cannot be rerun. The sample above checks only that the quoted lines exist and hold their parts.
- The builder's first runs on the unchanged tree (report part 3), other than the four `git show 05a4bd6:` checks above. The rest would need a checkout of the base, and the brief allows only `git diff 05a4bd6`, `git status --short` and `git show 05a4bd6:<path>`.
- The builder's quoted `git status --porcelain -uall` and `git diff --stat -- docs/academic-coverage.md` were not run in that form. I used `git status --short`, and `git diff 05a4bd6` with `--stat` and with path arguments, which only read.
- The exit-4 sentence by a run: the no-breakage rule forbids it. Judged by reading, above.
- Network variance between the builder's runs and mine: Semantic Scholar answered "not found" for the builder and "left out, HTTP 429 after 3 retries" for me on the title resolve. The DOI_MISMATCH ratio was 0.16 for the builder and 0.19 for me, because my scratch entry had another title. Neither changes a sentence's truth.
- Whether the skill works when run through the Skill tool, and the blind comparisons: step 3's part, by plan.md's Step 0.
- Whether the builder's scripts (Spec 1) are accepted after the fact: the user's ruling.

Reviewer usage: a20e791c4d7c8dedd, claude-opus-5-5, 221292 tokens, 122 tool uses, 20.9 min.

## Repair round 1, refuted

```
$ sh skills/repo-setup/templates/check_config.test.sh        (run from the repository root)
PASS: check_config.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template      (exit 0)
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md                     (exit 0)
$ description lengths (paper, writing)
838, 779                                          (both under the limit)
$ the five agents/ordo-*.md frontmatters parse with their names                    (exit 0)
$ character-set check over the 29 changed files, and over the report file       (exit 0, nothing outside the set)
$ the brief's grep 6a                              (prints nothing, exit 1)
$ the brief's literature grep                      (37 lines)
$ grep -rn 'pending\|integrity\.md\|The patch file\|patch rule\|hub\|several times' skills/paper/
the hits equal the builder's list: integrity.md for revision and lit-review, "sources pending" and "[GAP: abstract pending]", the title of patch-file.md, the variable `pending` in templates/lookup.py. Nothing in a page names patches/pending, "The patch file" of SKILL.md, a "patch rule" outside patch-file.md or a project.
$ grep -n -w 'again\|until\|several\|repeatedly\|repeat' skills/paper/SKILL.md skills/paper/references/*.md
every repeat that loops carries a count: SKILL.md Steps 9 and 10 (one new patch), outline stops (at most 3 times), draft review (round 2, once more), disclosure (once more, a second mismatch is the stop); literature-strategist.md "The review passes only when every gate holds" ("A failed gate is handled once, as its row says"); visualization.md "The rendered figure" (at most 2 fix passes); integrity-verification.md (asked again once, fetches again once). The remaining hits are prose ("several sources", "run again" in a stop table row for the user), not loops.
$ C15 on a fresh mktemp -d folder: anchorize_tex.py, mv to patches/01-main.tex.block-manifest.json, apply_tex_patch.py --check-only --manifest, apply with --output patches/01-main.tex.patched, cp, cmp
cmp exit 0; shasum -a 256 of the file equals output_sha256 of patches/01-main.tex.patched.apply-report.json; after the cp a second apply against the old manifest exits 2 with kind stale-manifest; empty roadmap_item_ids exits 2 with kind validation; a patch written against another version exits 2 with kind validation and the validation block; insert_after on refs.bib with cite-keys prints "unused: beta2021" or nothing, as SKILL.md Steps 11 says.
$ C16: grep -n '\\bibliography\|\\addbibresource' on the five real main files, text after an unescaped % left out
dongho 839 (refs), linfoot 501 (main), meseret 566 (References; 570 is commented), bare_jrnl 1082 (two files: refusal naming line 1082), ecg-readable-substrate no \bibliography line (refusal). The builder's lines match.
$ C17: sh -c "set -- $qp $qt; echo \"arguments: \$#\""
arguments: 2                                        (the printf run prints the two whole arguments, nothing substituted)
$ python3 skills/paper/templates/lookup.py fetch 10.1126/science.1127647 <folder> k       (public indexes, no key)
wrote <folder>/k.abstract.txt, exit 1
$ python3 skills/paper/templates/lookup.py check-urls behind a closed proxy
a line "failed ..., title not checked: Crossref left out ...", exit 1
$ python3 skills/paper/templates/lookup.py quote-check on a citation-report.md-shaped file
found / not found lines, exit 1 for a not-found line
$ find in the worktree and in $TMPDIR for files newer than files.txt           (none; the three templates are unchanged)
```

Rows sampled for "held in" (each read against the place it names): 51, 52, 55, 56, 65, 66, 76, 78, 82, 83, 89, 90, 94, 96, 97, 99, 148 and 169 (18 rows). Fifteen hold: for each, the named page and section state the part. Three do not read as the brief and the standards ask: 78, 148 and 169 (Findings 2, 3 and 4). Rows 55, 94, 82 and 51/56 name places that hold their parts: `references/patch-file.md` "The patch file" holds the JSON form and "copies `base_sha256` and each `old_hash` from the manifest"; SKILL.md Steps 10 holds the numbered paths, `--acknowledge-structural`, the stale-manifest exit and "Never edit a patch by hand"; row 82's `references/intake.md` "Venue AI policy" row exists; SKILL.md "the closing checks" holds the cite-keys and `unused:` lines that rows 51 and 56 cite. Records: I checked 30 sampled quotes by `sed -n` at their cited lines (SKILL.md 115, 123, 126, 129, 131, 226, 227, 305; structure-architect.md 24; literature-strategist.md 97; citation-compliance.md 82; peer-reviewer.md 162; patch-file.md head and all patch-file.md names in SKILL.md 63, 113, 331, 342 to 348) and each stands at its line; the other records of the 355 are not re-verified one by one here (see Declined).

### Verdicts

Items of the brief's "What to build", for the whole diff since 05a4bd6:

- 1: holds, SKILL.md `metadata.version` "1.0.0", description 838 characters, sections in the layout's order.
- 2: holds, Quick start has the seven modes and the `projects:` form; a mode outside the list and `/paper plan` are refused with the list.
- 3: holds, Use instead rows present, one phrase per When cell.
- 4: holds, What it reads, including the `.bib` rule of C16 and the intake record offered from the latest earlier `config.md`.
- 5: holds, the shared steps end on a completion criterion, the temporary folder is made and removed on every ending path, quoting rule in single quotes.
- 6: partial, the served-model check after a start has no defined result for a disclosure patch that holds no model identifier, Finding 6.
- 7: holds, the patch rule stands in `references/patch-file.md` and SKILL.md Steps 9 and 10 with numbered paths; C15 reproduces.
- 8: holds, `/writing` is invoked through the Skill tool; the findings are `F<k>` and the comments-file findings `W<k>` in Steps 12, the id table, `draft-writer.md` and `peer-reviewer.md`.
- 9: holds, `cite-keys`, `check-urls` and `quote-check` run once after the owner's corrections; a "title not checked: <index> left out" line goes to the user unchanged (`citation-compliance.md` "DOI and URL", Steps 11).
- 10: holds, the Stops table holds the brief's stops; the eleventh, "The draft review does not pass", is named in the report as the build's addition with its source.
- 11: partial, `references/visualization.md` check 9 and the trace are unconditional under "figures in parallel" (Finding 1), and `integrity-verification.md` "What the agent reads" and the Agent prompts row say "every check" while the lit-review check gets no `.tex` (Finding 5).
- 12: holds, SKILL.md holds the full-mode rows; the one draft-review stop rule is consistent in full item 12, `peer-reviewer.md` "The verdict" and "The second draft review round", and the Stops row.
- 13: holds, README row, line 79 and the install loop of line 106 name `paper`.
- 14: holds, `git diff 05a4bd6 -- .agents/plan.yaml skills/plan/templates/plan.yaml` changes only comment text on the `reviewer` and `reviewer_effort` lines; the five `agents/ordo-*.md` parse.
- 15: partial, 55 rows changed as `git diff 05a4bd6 -- docs/academic-coverage.md | grep -c '^+|'` printed in the builder's report, and `check_coverage.py` exits 0, but rows 78, 148 and 169 are not as the brief and the standards ask (Findings 2, 3, 4).
- 16: partial, the records stand at their lines in the sample, but the record of row 78 quotes a line that does not state the part (Finding 4).
- 17: holds, the three scripts are unchanged and no script file was written after the snapshot; each sentence about a script reproduced above.
- 18: holds, `skills/writing/SKILL.md` line 251 numbers the findings and `metadata.version` is "1.1.0".

Cases of the brief's "Cases":

- C1: met, SKILL.md has every layout section in order with completion criteria.
- C2: met, Quick start read against the brief.
- C3: met, Use instead read against the brief.
- C4: partial, the served-model check after a start in disclosure mode has no defined result when the patch holds no identifier, Finding 6.
- C5: partial, rows 78, 148 and 169, Findings 2, 3 and 4.
- C6: met, the ADR rules read against named lines (ADR 0017 to 0021): the temporary folder, passage lines before a judgment, stops, the numbered trail.
- C7: met, the patch rule stands once in `references/patch-file.md` and every writing step names it; every exit status has its handling.
- C8: met, the closing `/writing` run, the one-line answer and the accepted findings as patches are in Steps 12.
- C9: met, run folder, local date, `-2` rule, `mktemp -d` and its removal read against Steps.
- C10: met, the stops and refusals of item 10 stand in Stops and in the steps that reach them.
- C11: met, the README, the comments and the glossary terms name `paper`; the diff of the two plan templates shows comment text only.
- C12: partial, `check_coverage.py` exits 0, but the reasons of rows 78, 148 and 169 are not as above.
- C13: met, SKILL.md of `writing` line 251.
- C14: met, the intake record of an earlier run is offered at intake (What it reads, Steps).
- C15: met, reproduced on a fresh `mktemp -d` folder: `cmp` exits 0, the hash equals `output_sha256`, stale-manifest and validation exit 2.
- C16: met, results read from the `grep -n` lines above.
- C17: met, `sh -c` printed two whole arguments with nothing substituted.

### Findings

- 1. Standards. `skills/paper/references/visualization.md` "The ten checks of a figure": "- Check 9 compares the plotted values with the data file and with the numbers the manuscript reports for the same quantity. The agent reads values from the script's inputs and the manuscript, and a number that differs is reported in `figures.md`." and "The trace" template "- Claims in the manuscript:" with "<claim text> (<section and paragraph>)"; what is wrong: round point 4 makes the visualization agent start together with the draft writer, given only `outline.md` and `arguments.md`, so no manuscript exists when check 9 runs and when the trace lists claims; "What the agent reads" says "The main `.tex`, when it exists" but check 9 and the trace do not, and no page says the check is skipped or done later (change-standard rule 14: a change carries to every place that names it; rule 19); failure scenario: a run with "figures in parallel" reaches check 9, the agent has no manuscript to read, and either invents "reported numbers" or marks the figure NEEDS_REVIEW, which the integrity agent then reads as a defect of the figure; verdict: item 11 partial.
- 2. Standards. `docs/academic-coverage.md` row 169 (`references/plagiarism_detection_protocol.md`): "sampled sentences searched on the web and graded from original to verbatim, searched with `lookup.py search` in place of a web search, and a self-plagiarism check against the authors' earlier papers"; what is wrong: the round brief asked that the reason "keeps its words" and "reads plainly", and the insertion was placed literally after "graded from original to verbatim", so one sentence says the sentences are searched on the web and, two clauses later, that they are searched with `lookup.py search` instead of a web search, and "a self-plagiarism check" follows a list of participles (prose-standard: one statement per sentence, no self-contradiction); failure scenario: a reader of the map asking what the skill does for the originality screen reads that it searches the web, and then that it does not; the skill (`integrity-verification.md` "The screen of sampled sentences") does the second only; verdict: item 15 partial, C5 partial, C12 partial.
- 3. Spec. `docs/academic-coverage.md` row 148 (`academic-pipeline SKILL.md`): "`paper` takes the optional parallel drafting, held in `skills/paper/SKILL.md` and `skills/paper/references/draft-writer.md`"; what is wrong: in the source (`academic-pipeline/SKILL.md` Parallelization) visualization runs with the argument builder and the draft writer waits for both; the skill now runs visualization with the draft writer after the outline's approval and adds the figures by a later patch, a different shape, and the reason says "takes" without saying so (rule 17: a rewrite keeps meaning; the map says what changed); the shape came from round point 4, so the builder followed the brief, and whether the departure is acceptable is the orchestrator's call; failure scenario: a later reader of the map who checks the source against the skill finds a different parallelism and cannot tell from row 148 whether it was meant; verdict: C5 partial.
- 4. Standards. `docs/academic-coverage.md` row 78 (`references/apa7_extended_guide.md`): "Venue templates replace the title page, running head, abstract page, headings and table and figure format, held in `skills/paper/SKILL.md`." with the record quote `SKILL.md` "the closing checks": "The font, spacing, margins and page numbers follow the venue's template or the limits stated in `config.md`."; what is wrong: the named place says the font, spacing, margins and page numbers follow the template; the title page, running head, abstract page, headings and table and figure format are not stated as template-governed in SKILL.md or any page (change-standard rule 18: a map row names a place that states each part); failure scenario: a reader trusts "held in" and does not look for a rule on the running head or the table format, which the skill does not give, and the writer follows no template for them; verdict: item 15 partial, item 16 partial, C5 partial.
- 5. Standards. `skills/paper/SKILL.md` Agent prompts, Integrity verification row: "the main `.tex` and the files it inputs for every check", and `skills/paper/references/integrity-verification.md` "What the agent reads": "- The main `.tex` and the files it inputs, and the `.bib`, in every check."; what is wrong: the lit-review check of entries (SKILL.md lit-review item 2) is given `config.md`, `review.md`, `refs.bib` and the temporary folder only, and lit-review without a `.tex` has none (rule 19: no two statements that contradict); the round brief point 5 asked for "for every check", so the origin is the brief, but the rule is still false for that check; failure scenario: the integrity agent started for a lit-review reads "in every check", looks for a `.tex` it was not given and either reports a missing input or judges nothing against a manuscript; verdict: item 11 partial.
- 6. Behaviour. `skills/paper/SKILL.md` ### disclosure, item 1: "Before the patch is applied, compare that identifier, read from the patch's `new_text`, with the model the runner served the agent, read at Steps 8." and "Unequal: the patch is not applied. Start the draft writer once more as a fresh agent (Steps 8 and 9) with the served model in its prompt, and compare again. A second mismatch is the stop "A patch that does not apply"."; what is wrong: `references/ai-disclosure.md` "The sentence" gives the statement "No AI was used in preparing this paper." with no model identifier, and the no-answer case writes no statement and so no patch; the step defines no result when the `new_text` holds no identifier or no patch exists; failure scenario: a disclosure run for a paper with no AI use writes the one-sentence statement, the session finds no identifier, takes it as unequal, restarts the writer, gets the same sentence and raises "A patch that does not apply" for a correct patch; verdict: item 6 partial, C4 partial.

### Declined to judge

- Whether the new shape of "figures in parallel" is acceptable against the source (Finding 3), because it is the orchestrator's decision and round point 4 ordered it.
- Whether each of the other 325 records of the 355 quotes its line, because I re-read a sample of 30 by `sed -n` and the builder's own 260-standing count was not recomputed.
- The wording of the "read whole" claims in the coverage records, because a read and a rerun cannot settle whether the builder read a source whole.
- The exit-4 sentence of `apply_tex_patch.py`, which is judged by reading only, since a run needs a failing output file and no breakage testing is allowed.
- The network behaviour of the `fetch` and `check-urls` runs, because they depend on the public indexes and on the proxy at the time; the S14 and S13 runs printed what is quoted above and are not claimed to repeat.
- `references/ethics.md`: "BLOCKED is reserved for ... concrete harm-enabling content" beside "Dual use is advisory ... never to BLOCKED" contradict each other in the page, and the source `deep-research/agents/ethics_review_agent.md` has the same pair, so it is carried faithfully and is not a finding of this round; the choice to keep or resolve it belongs to the orchestrator.
- `references/citation-compliance.md` "An unsupported claim": an annotation that already holds the claim stands with no passage read, which follows round point 6 as written; whether that meets ADR 0018 for every case is the orchestrator's call.
- `docs/academic-coverage.md` row 68 says "the paper skill's example will be a hub ML paper"; that text is in the base tree, lies outside `skills/paper/` and outside the 55 edits, and the round brief's point 7 covers pages only.

Reviewer usage: a0cba8ec4935041d4, claude-sonnet-5-5, 102980 tokens, 98 tool uses, 11.7 min.

## Closed

First run (Spec 1 to 8, Proof 1 to 3, Standards 1 to 7, Behaviour 1 to 3): each was sent in repair round 1 as points 1 to 21 of `agents/briefs/2-round-1.md`, and the run over round 1 gives its items and cases holds or met except those its six findings name.

Run over round 1, all fixed at landing on main, since each is small and inside the brief:

- 1 (Standards, `references/visualization.md`, figures in parallel): fixed at landing, "What the agent reads" says that under "figures in parallel" no `.tex` exists when the agent runs, check 9 compares with the data file and the numbers `arguments.md` states, and the trace lists the claims of `arguments.md` by chain; the integrity check's "The figures and the tables" then compares them with the manuscript.
- 2 (Standards, row 169): fixed at landing, the reason says the sampled sentences are searched with `lookup.py search` in place of the source's web search and graded from original to verbatim, in one plain sentence.
- 3 (Spec, row 148): fixed at landing, the reason states the shape the skill takes: the visualization agent runs beside the draft writer after the outline's approval, where the source runs it beside the argument builder, and the figures are added by a patch after the first draft.
- 4 (Standards, row 78): fixed at landing, `SKILL.md` "the closing checks" states that the title page, running head, abstract page, heading format and the format of tables and figures follow the venue's template, which the row names.
- 5 (Standards, integrity inputs): fixed at landing, `SKILL.md` Agent prompts and `references/integrity-verification.md` "What the agent reads" give the main `.tex` and the files it inputs for every check of a manuscript, and name the check of entries, which reads `review.md` and `refs.bib` in their place.
- 6 (Behaviour, disclosure mode): fixed at landing, disclosure item 1 says that a statement which names no model, such as "No AI was used in preparing this paper.", has nothing to compare and goes on to Steps 10, and that no patch means nothing to compare.

Two points the run declined to judge, fixed at landing because each is a sentence a page contradicts:

- `references/ethics.md` "Verdict and stop": "Dual use is advisory ... never to BLOCKED" beside BLOCKED for concrete harm-enabling content: the dual-use bullet now says a topic or method open to misuse is advisory, and only concrete harm-enabling content without safeguards, as defined above it, is BLOCKED.
- `references/citation-compliance.md` "An unsupported claim": "A claim is judged only on a passage the agent read in this run from the source's full text" beside the annotation that needs no fetch: the first bullet now follows ADR 0018, a claim judged only on text read in this run, and a source of which only the abstract was read supporting only what the abstract says.
