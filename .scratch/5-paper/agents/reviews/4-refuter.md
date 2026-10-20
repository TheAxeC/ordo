# Step 4 refuter report (on .agents/worktrees/5-paper-4, base 3b6d071)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-4. Brief: /Users/axelfaes/workspace/ordo/.scratch/5-paper/agents/briefs/4.md. Builder's report: /Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-4/.scratch/5-paper/agents/reviews/4-report.md.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, reads the keys a .tex cites with the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, reports an input file that does not exist, reads the .bib named on the command line in check-urls and quote-check, and refuses the one-argument check-urls and the two-argument quote-check
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ printf '%s\0' <the 38 paths of "Paths this step writes" that exist, the glob expanded to the nine SVGs> | xargs -0 perl -CSD -ne '<the brief's check>'
(nothing printed)
exit 0
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
exit 0
$ python3 docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (31975 bytes)
wrote docs/figures/plan-loop.svg (32184 bytes)
wrote docs/figures/paper.svg (35816 bytes)
wrote docs/figures/grill.svg (20702 bytes)
wrote docs/figures/writing.svg (14389 bytes)
wrote docs/figures/code-comments.svg (18832 bytes)
exit 0
$ python3 docs/figures/academic-paper-comparison/gen_comparison.py
wrote docs/figures/academic-paper-comparison/full.svg (18932 bytes)
wrote docs/figures/academic-paper-comparison/outline-only.svg (7762 bytes)
wrote docs/figures/academic-paper-comparison/revision.svg (12283 bytes)
wrote docs/figures/academic-paper-comparison/abstract-only.svg (5699 bytes)
wrote docs/figures/academic-paper-comparison/lit-review.svg (5624 bytes)
wrote docs/figures/academic-paper-comparison/citation-check.svg (6144 bytes)
wrote docs/figures/academic-paper-comparison/disclosure.svg (5118 bytes)
wrote docs/figures/academic-paper-comparison/academic-paper-only-modes.svg (7740 bytes)
wrote docs/figures/academic-paper-comparison/academic-pipeline.svg (22598 bytes)
exit 0
$ cmp docs/figures/pipeline.svg <git show 3b6d071:docs/figures/pipeline.svg>
cmp pipeline.svg exit 0
$ cmp docs/figures/plan-loop.svg <git show 3b6d071:docs/figures/plan-loop.svg>
cmp plan-loop.svg exit 0
$ shasum -c <the shasums of every SVG taken before both runs> | grep -vc ': OK$'
0
$ cd <scratchpad>/cwdtest2 && python3 <worktree>/docs/figures/academic-paper-comparison/gen_comparison.py | tail -1; ls -A <scratchpad>/cwdtest2 | wc -l
wrote docs/figures/academic-paper-comparison/academic-pipeline.svg (22598 bytes)
exit 0
0
$ LC_ALL=C grep -c '[^ -~]' <each of the 13 new SVGs>
0 (for each of the 13)
$ git status --short | wc -l
32 (the same 25 modified or deleted paths and 7 untracked paths as before the runs)
$ grep -rn -i -E '<C3's pattern>' skills/paper
skills/paper/SKILL.md:35:| The integrity check of a finished manuscript's references, claims, numbers and figures, or its ethics check | `researcher` |
$ grep -n 'The findings to apply' skills/paper/SKILL.md            (C9)
(nothing printed) exit 1
$ grep -n -i 'null result\|null-result\|null finding\|negative result' skills/paper/SKILL.md skills/paper/references/*.md    (C11)
(nothing printed) exit 1
$ grep -n 'integrity record' skills/paper/templates/lookup.py skills/paper/templates/lookup.test.sh    (C22)
(nothing printed) exit 1
$ grep -rn -E '<item 20's pattern>' skills --include='*.md' | grep -v '^skills/paper/'    (item 20, C21)
(nothing printed) exit 1
$ ls skills/paper/references/    (C2)
ai-disclosure.md citation-compliance.md draft-writer.md intake.md literature-strategist.md patch-file.md peer-reviewer.md planner.md statements.md visualization.md
$ grep -c '^| `' docs/academic-coverage.md; grep -c 'rebuild: paper' ...; grep -c 'rebuild: researcher' ...
169
55
14
$ grep -n 'integrity-verification\|ethics\.md' docs/academic-coverage.md | grep -v f9a00ab
(nothing printed)
$ python3 -I -c '<ast.get_docstring of writing_svg in docs/figures/gen_figures.py>'
'The steps of /writing in order, its three finding agents, its checking agent and its "\n    "refusals.'
```

The figure scripts rewrote the same bytes: the shasum comparison printed no changed file, and `git status --short` lists the same 32 lines. `docs/figures/__pycache__/`, created by gen_comparison.py's import of gen_figures.py, is ignored by `.gitignore` (`__pycache__/`).

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. Read in skills/paper/SKILL.md: version "2.0.0", the description names the five roles and the citation compliance agent of citation-check mode, Steps 7, 11, 12 and 14, the Rules bullet on the stops, every mode's items and stops lists as the brief gives them, the Agent prompts table, the Stops table without "The findings to apply" and "The ethics stop" and its count sentence ("The first nine rows are stops") equal to its nine stop rows, and the "Use instead" row for `researcher`. Spec 2 names one departure inside citation-check, which does not change its order.
- 2: holds. skills/paper/references/planner.md read whole against the two removed pages at the base (`git show 3b6d071:`); every rule stands, with the outline, the evidence map and the argument map with its weak-argument signs written in one start.
- 3: holds. draft-writer.md holds the abstract and keywords rules of the removed abstract.md, the six statements in the first draft and in disclosure mode, the abstract alone in abstract-only, the reference-fix pass and the autonomous writer pass.
- 4: violated, Spec 1. The three permission rows, the strategist sentence and the removal of "figures in parallel" hold; "DOI checking" Strict does not reach the agent that decides whether a reference is confirmed.
- 5: holds. peer-reviewer.md: no `integrity-1.md`, round 1 and reading 1 given the outputs of `cite-keys` and `check-urls`, the patches and the two scripts named in place of "the citation and integrity checks", the criteria, the two rounds and the round-2 rule unchanged.
- 6: holds. citation-compliance.md holds "Reading the source" (the fetch into the temporary folder, the Read tool for a PDF, text for HTML, never WebFetch, the passage line with its locator, `quote-check`, the abstract-only source, the source that cannot be fetched).
- 7: holds. ai-disclosure.md: no served-model loop, the identifier the session gives, the integrity-record sentence removed and the line still claiming no check, audit or verification.
- 8: holds. literature-strategist.md: lit-review in one start writing `review.md`, `refs.bib` and, given a `.tex`, the `.bib` patch; the revision start for new references; no check of entries and no second start.
- 9: holds. visualization.md: the revision start within intake's permissions, the start beside the first draft, `figures.md` named as the record `researcher`'s check reads.
- 10: holds. statements.md carries the three triggers of ruling I part 4.
- 11: holds. The five pages are absent (`ls skills/paper/references/`) and `git status --short` shows them as ` D`.
- 12: holds. The grep of the item printed nothing.
- 13: violated, Standards 3 and 4. `check_coverage.py` prints `ok:`, and every row that names integrity-verification.md or ethics.md names `f9a00ab`; rows 191, 235 and 258 state places that do not hold the rule.
- 14: violated, Standards 6 (grill.svg's "a round" box) and Standards 5 (the docstring of `writing_svg`). The four figures are written, the head comment names six figures, `pipeline.svg` and `plan-loop.svg` are byte-equal, and README.md shows the four new figures with alt text that lists their boxes.
- 15: holds. gen_comparison.py writes its nine SVGs into its own folder only, from the root and from another directory, ASCII; the full and revision figures show D43's and D49's differences; the academic-pipeline figure marks boxes solid or dashed by `skills/<name>` being a folder, with the mapping in the head comment; the nine SVGs are linked in "paper against academic-paper" with alt text.
- 16: holds. docs/dev/scripts.md names the six figures and adds gen_comparison.py under "Development scripts".
- 17: holds. docs/dev/building.md names both scripts, what each writes, that every skill that launches agents has its figure, and that a change to a Stops table, a sequence or a name changes the labels and the script is run again.
- 18: violated, Standards 1.
- 19: violated, Standards 7. The **draft review** "Stated in" names `paper`, "Steps / full" 8, which SKILL.md's full mode item 8 states.
- 20: holds. The grep of the item printed nothing; skills/writing/SKILL.md's sentence on `paper` reads true.
- 21: holds. lookup.py and lookup.test.sh name the citation report; the test prints its PASS line; ADR 0017's sentence and ADR 0020's list are edited in place.

Cases of the brief's "Cases":

- C1: met, `sed -n 1,6p skills/paper/SKILL.md` shows `version: "2.0.0"` and the description as the case asks.
- C2: met, the `ls` above.
- C3: met, the grep prints only SKILL.md:35, the `researcher` row of "Use instead".
- C4: met, read in SKILL.md "### full".
- C5: met, read in SKILL.md "### revision".
- C6: met, read in SKILL.md "### lit-review".
- C7: met, read in SKILL.md "### citation-check", Steps 7 and 11, and citation-compliance.md "Reading the source".
- C8: met, read in SKILL.md "### disclosure", ai-disclosure.md and draft-writer.md.
- C9: met, read in SKILL.md Steps 12 and 14; the grep prints nothing.
- C10: partial, the Strict answer of "DOI checking" leads to no stop, Spec 1. The three permissions and the Rules bullet on choices hold.
- C11: met, the grep prints nothing.
- C12: partial, `ok:` prints, but rows 191, 235 and 258 read false, Standards 3 and 4.
- C13: met, the run and the two `cmp` above.
- C14: met, the runs from the root and from the scratchpad, nothing written in the working directory or in docs/figures/, ASCII.
- C15: met, read in both scripts: a label that does not fit prints `error: ...` naming the figure, the box and the label to stderr, and the script exits 1 before any file is written.
- C16: partial, the README `paper` row (Standards 1) and grill.svg's "a round" box (Standards 6) read false against their skills; paper.svg, writing.svg and code-comments.svg, read box by box, match.
- C17: met, read in draft-writer.md.
- C18: met, read in peer-reviewer.md.
- C19: met, read in literature-strategist.md and visualization.md.
- C20: met, read in statements.md.
- C21: met, the grep prints nothing.
- C22: met, the PASS line and the grep above; ADR 0017 and ADR 0020 read true of the rebuilt skill.

## 1. Spec

- skills/paper/references/citation-compliance.md:7 and :18: "- `config.md`: Citation style, Authors, Discipline and Paper type." and "| A DOI that cannot be found | Marks the entry "DOI not available" and does not block the run. |"; what is wrong: item 4 asks that Strict DOI checking lead to "A reference that cannot be confirmed" in citation-check mode. intake.md "DOI checking" says so, and the Stops table of SKILL.md names "strict DOI checking leaves a citation whose DOI fails". But SKILL.md "### citation-check" item 2 raises that stop for "A reference it cannot confirm", which is the citation compliance agent's judgment. That agent is not given the DOI checking row (line 7 lists four fields), and its own table says a DOI that cannot be found "does not block the run". At the base this rule lived in the integrity agent's page; the diff moved the question to citation-check without giving the agent the answer. Failure scenario: a user in a field that cites by DOI answers Strict at intake; the agent marks a citation whose DOI fails lookup "DOI not available" as its page tells it, writes no "unconfirmed", the session raises no stop, and the run ends as if mark-only had been chosen; verdict: item 4 violated, C10 partial.
- skills/paper/SKILL.md:156: "In citation-check mode, a failure of the three commands starts the citation compliance agent again as a fresh agent (Steps 8 and 9). ... The commands then run again, and a failure left is named in the final message with the line as printed."; what is wrong: the brief's item 1 keeps citation-check "unchanged in its order" and gives the rerun of the checks only for full, revision and lit-review (ruling I, part 2). The base sent a failing line to the citation compliance agent and ran each command once ("Each runs once, after the owning role's corrections, with no further pass"); the second run of the three commands is added. The builder lists it under its judgment calls. The order of the mode's items is unchanged. Failure scenario: a citation-check run now runs `cite-keys`, `check-urls` and `quote-check` a second time and writes a second set of entries into `checks.md`, which no ruling named; verdict: none.
- skills/paper/references/citation-compliance.md:33: "- More than 5 missing keys point to a `.bib` that does not belong to this manuscript, and the report says so."; what is wrong: the base said the missing keys "point to sources the draft writer took from outside the literature report". The reason for this rule changed, and no item asks for a new reason. Since citation-check has no literature report, a rewrite was needed, but the report does not list it as a judgment call (change standard rule 20). Failure scenario: an author whose manuscript cites six new papers not yet added to the `.bib` is told the `.bib` "does not belong to this manuscript"; verdict: none.

## 2. Proof

- .scratch/5-paper/agents/reviews/4-report.md:1118: "- citation-compliance.md:9 | - `review.md` and `refs.bib` of the literature strategist, when they exist. Each source in them is the ground truth for its citation information. ... | stands in skills/paper/references/citation-compliance.md:7: - `config.md`: Citation style, Authors, Discipline and Paper type.; also stands in skills/paper/references/citation-compliance.md:8: ..."; what is wrong: change standard rule 18 asks each removed rule to name the place that now holds it or to say it is dropped. The rule that the strategist's sources are the ground truth for an entry is removed from citation-compliance.md, and lines 7 and 8 do not hold it (they list config.md fields and the `.tex` and `.bib`). The row should say the rule is dropped, since citation-check runs no strategist. Failure scenario: a reader checking that no rule was lost reads the row as "carried" and does not notice that the ground-truth rule is gone; verdict: none.
- .scratch/5-paper/agents/reviews/4-report.md:691: "- integrity-verification.md:44 | - Every cited entry is looked up with `lookup.py resolve`, whatever the agent remembers of it. ... | researcher: stands whole at f9a00ab:skills/paper/references/integrity-verification.md:44, sent by docs/academic-coverage.md row(s) 191,235"; what is wrong: rows 191 and 235 of docs/academic-coverage.md say the opposite: citation-check "takes the reference lookup" (191) and "the resolving" (235), and neither row names the every-entry lookup among what goes to `researcher`. The builder's judgment call says the new citation compliance agent resolves only the sources of failing lines, so the every-entry lookup is moved to `researcher`, and the page should say so. Failure scenario: the builder of roadmap entry 13 reads row 191 for what `researcher` must take, does not find the every-entry lookup there, and does not carry it; verdict: item 13 violated, C12 partial (with Standards 3).

## 3. Standards

- README.md:28: "Citation-check mode checks each cited claim against a passage read in the run, and the other modes run the citation scripts and give their output to the writer and the reviewer."; what is wrong: item 18 asks every sentence of the row to be true of the rebuilt skill. SKILL.md Steps 11 says "Lit-review without a `.tex`, outline-only, abstract-only and disclosure run none", and lit-review has no reviewer. Four of the six other modes do not do what the sentence says. Failure scenario: a user runs `/paper abstract-only` expecting the abstract's citations to be checked by script, and nothing checks them; verdict: item 18 violated, C16 partial.
- docs/academic-coverage.md:258: "The human-subject determination and de-identification rules are in `references/ethics_checklist.md`, which `paper` takes at entry 5."; what is wrong: the diff re-marks row 255, `references/ethics_checklist.md`, as `rebuild: researcher` ("`researcher` (entry 13) takes it ..."). The unchanged sentence of row 258 is now false. Item 13 asks each row to be checked by reading. Failure scenario: a reader of the coverage page looks for the human-subject rules in `paper` and does not find them; verdict: item 13 violated, C12 partial.
- docs/academic-coverage.md:191 and :235: "Citation-check mode takes the reference lookup, the DOI that resolves to another paper, the missing and unused keys and the claim traced to a passage it read, held in `skills/paper/references/citation-compliance.md` and `skills/paper/SKILL.md`" and "The paper skill's citation-check mode takes the resolving, the mismatched DOI, the unconfirmed reference sent to the user and the removal of a fabricated one, ... held in `skills/paper/references/citation-compliance.md` and `skills/paper/templates/lookup.py`."; what is wrong: (a) row 191 does not name, among what goes to `researcher`, the lookup of every cited entry with its verdicts (verified, not found, mismatched), which citation-compliance.md no longer holds (Proof 2); (b) row 235 says citation-compliance.md holds "the removal of a fabricated one". That page holds no removal: the removal is one of the user's options at the SKILL.md stop "A reference that cannot be confirmed", and SKILL.md is not named in row 235. Item 13 asks a kept rule to name the page that holds it and a moved rule to name its new place. Failure scenario: a reader checks citation-compliance.md for the fabricated-reference rule and finds nothing, or the builder of entry 13 leaves out the every-entry lookup; verdict: item 13 violated, C12 partial.
- docs/figures/gen_figures.py:1125-1126: `"""The steps of /writing in order, its three finding agents, its checking agent and its "` / `    "refusals."""`; what is wrong: the docstring holds a stray `"` and a line break with four spaces before a second `"`. Python reads it as `'The steps of /writing in order, its three finding agents, its checking agent and its "\n    "refusals.'`. This breaks the coding standards' rule that a docstring states what the function does in readable text. Failure scenario: `help(writing_svg)` or an editor's hover shows the broken sentence with stray quotes; verdict: item 14 violated (minor).
- docs/figures/gen_figures.py:662-663 and the new label strings, such as :1031-1033 (`"the decisions "` / `"the "` / `"goal and gate need ..."`) and :1038-1040 (`"its "`); what is wrong: a base string of plan_loop_svg is split at a new place (`"... A finding "` / `"whose "`), which no item asks for (change standard rule 20, "Nothing is changed that no brief item asks for"), and many new labels are split into one-word pieces. The SVG output is byte-equal. Failure scenario: the next person who changes a Stops table (docs/dev/building.md says the labels are then edited in the script) has to rejoin one-word fragments to find the sentence; verdict: none.
- docs/figures/gen_figures.py:1035-1041 (grill.svg, the box "a round": `(Group(EVERY_RUN, ("A round",)),)` with no note) and README.md:68 / gen_figures.py:415 `SKILL_LEGEND_NOTE`: "A stop marked "every run" waits each time the box runs, unless its text names a flag that closes it."; what is wrong: skills/grill/SKILL.md Steps 6 says that under `--self-rule` the round is not sent and only decisions of the six kinds are sent as "A round", which makes it "only when" under that flag. The "close" box carries "Under --self-rule nothing is asked and the commit is made.", but the "a round" box names no flag, so by the legend it waits on every run under `--self-rule` too. Item 14 asks each label to be written from the skill's SKILL.md. Failure scenario: a user who reads grill.svg expects `plan-orchestration`'s `/grill --self-rule` to stop at every round and waits for a question that never comes; verdict: item 14 violated, C16 partial.
- docs/glossary.md, **mark, of a figure**: "the label a box of the README's figures carries ...: "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change or, under `self_rule: on`, `plan-orchestration` closes the stop, ..."; what is wrong: README.md now shows six figures, and the four new ones define "every run" by SKILL_LEGEND_NOTE ("unless its text names a flag that closes it"). The term the glossary gives is true of the two plan figures only. Item 19 asks any term the change makes false to be fixed. Failure scenario: a reader of paper.svg looks up the mark in the glossary and reads the plan figures' exception, which `/paper` does not have; verdict: item 19 violated (minor).

## 4. Behaviour

- skills/paper/SKILL.md "### full" item 1: "Start the literature strategist (Steps 8) only when `config.md` holds no `.bib` among the materials in hand. A `refs.bib` already in `<project folder>/manuscript/` is a `.bib` held."; what is wrong: at the base, the strategist ran when `config.md` held no `.bib` among the materials or the user asked for a search; it was given an existing manuscript `refs.bib` and wrote a patch that added new entries. Now an existing manuscript `refs.bib` stops the strategist, the request for a search no longer starts it, no `review.md` is written, and the planner works without a literature report; new entries come only from the draft writer when the New references row is a yes. The brief's "only when no `.bib` is held" allows this reading. The builder's report states it only as a judgment call; its "Host- or user-visible changes" entry for `/paper full` does not give this before and after. Failure scenario: a user with a starter `refs.bib` of three entries asks `/paper full` to search the literature; no search runs and the outline is planned from three references; verdict: none.

## Declined to judge

- The check run (a `claude -p` revision run of the rebuilt skill on a copy of dongho-ecg-clustering): the orchestrator's, outside this review's scope by the brief.
- Whether commit f9a00ab holds integrity-verification.md and ethics.md at the lines the coverage rows and the builder's coverage list cite: that needs `git show f9a00ab:<path>`, outside the three git commands this review may run.
- Whether the one-line shell commands with which the builder assembled the rows of its coverage list count as a script that needs the user's approval: the user's call, as for open item H.
- The plan's whole verify list: run once at landing on main, by the brief.
- A read of every row: the diff of docs/academic-coverage.md (65 insertions, 25 deletions) was read whole and its unchanged rows were sampled, which is how row 258 was found; of the builder's 915 coverage-list rows, those of citation-compliance.md, intake.md and integrity-verification.md were read and the rest were sampled.
- The builder's claim that every other new or changed sentence is at most 35 words: not rerun.

Reviewer usage: ac9aab32d59df88c5, claude-opus-5-5, 116742 tokens, 103 tool uses, 15.1 min.
