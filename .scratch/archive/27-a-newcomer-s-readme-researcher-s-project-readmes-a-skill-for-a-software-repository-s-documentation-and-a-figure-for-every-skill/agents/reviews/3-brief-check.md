# Step 3 brief check (on main at d5acc5e)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. A page this report cites is named with its section. A line of code or a grep hit keeps its `file:line`. `git log --oneline -1` prints `d5acc5e Land step 2 of roadmap entry 27: ...`. `git status --short` shows only the state file (modified) and the brief (untracked). I changed nothing.

## 1. Names

- `handbook`: `git grep -n 'handbook' -- . ':!.scratch'`. It hits ADR 0058 (lines 1, 11), ADR 0060 (lines 1, 7, 11, 12, 18, 23), `docs/adr/README.md:67,69`, `docs/dev/scripts.md:9,10,19`, `docs/figures/gen_figures.py:65,114`, `docs/figures/academic/researcher/gen_academic_pipeline.py:3,48`, `docs/figures/ordo_kinds.py:4` and `docs/roadmap.md:26,27`.
  - Outside the paths, the change makes one of these false: `docs/adr/0060-...md:12`, "`handbook` copies it into a documented repository's `utils/`, writes each diagram as a graph in a Python file beside it, and commits the `.svg` it draws". Brief item 12 says the skill "commits nothing there: the user commits". See section 7.
  - The other hits stay true.
- `manual.py`, `utils/figures.py`, `utils/diagrams.py`, `docs/user`: `git grep -n -i '<name>' -- . ':!.scratch'` for each. No hit for any of the four.
- The kinds (`manual.html`, `feature.map`, `getting.started`, `manual pages`, `reference pages`, `docs/README\.md`): the same grep.
  - Hits outside ADR 0058: `skills/academic/paper-review-panel/SKILL.md:49` ("The reference pages, each read by the roles its row names"), `skills/code/codebase-design/SKILL.md:64`, and ADRs 0019 and 0036.
  - None is made false. However, "reference page" already means a skill's own reference file in other skills, and `handbook` will also have its own `references/kinds.md`. Item 9's "at least" two terms then leaves "reference page, of `handbook`" without a glossary entry, although the text will use the phrase in both senses.
- `kind`: `grep -n -o '^- \*\*[^*]*\*\*' docs/glossary.md | grep -i kind` prints `61:- **kind**` and `62:- **kind, of an open item**`. Both are plan terms. The handbook sense needs a qualified headword, which item 9 asks for. See section 4 on where the entry goes.
- The README's count and lists: `git grep -n -i 'twenty-four\|24 skills\|four skills' -- skills utils docs README.md agents` prints only `README.md:38` and `README.md:183`. `grep -n 'codebase-design' README.md` also prints line 30, the row of the table under `## The skills`, which has 24 rows and no `handbook` row.
  - After the step, line 38 says twenty-five skills while that table lists 24. The table makes no "every" claim, so nothing in it becomes false. Its `handbook` row belongs to step 6 ("with the skills table holding `handbook`").
  - `README.md:7` names some skills and no count, so it is unaffected.
- Neighbours' "Use instead" tables, read with `awk '/^## Use instead/{f=1} /^## What it reads/{f=0} f'` for researcher, ordo-init, codebase-design and code-comments: none names `handbook`. Nothing in them becomes false. `/ordo-help` in its sentence mode reads these tables, but adding rows there is outside this brief's paths. Not a finding.

Findings:
- `docs/adr/0060-...md:12` "and commits the `.svg` it draws" is contradicted by brief item 12, and ADR 0060 is not under "Paths this step writes".

## 2. The step line

- "The skill `skills/code/handbook` as ADRs 0058 and 0060 decide": items 1, 3, 4, 5, 6 and 12.
- "with its kinds at the paths of D34": item 2.
- "its `manual.html` script under `templates/`": item 7.
- "that script's entry on `docs/dev/scripts.md`": item 8.
- "the engine of step 1 copied into a documented repository's `utils/`": item 6.
- "and its terms in the glossary": item 9.
- "check: the user reads the text against ADRs 0058 and 0060 and approves": item 13, as an open item of kind 5.
- "`/ordo-help skills` lists `handbook` with its Quick start": item 13 hands the run itself to "a separate agent after the pin of step 8". The builder checks only what that run reads (Case 2 and the description).
  - Step 8's line in `plan.md` does not name an `/ordo-help skills` run.
  - `grep -n -i 'ordo-help' <state file>` prints nothing, so no open item or booking holds it either.
  - As briefed, this part of the check has no owner.
- "the description is at most 1,024 characters by the command of `docs/dev/skill-layout.md`": item 1 and Case 1.
- "(1 commit)": not an item. Nothing needed.

Findings:
- The step line's check "`/ordo-help skills` lists `handbook` with its Quick start" is moved to after step 8's pin, and no step line, state-file item or booking holds that run.

## 3. Premises

- `find skills/code/handbook -type f` prints `skills/code/handbook/templates/figures.py`. Matches.
- `sed -n 1,80p skills/code/handbook/templates/figures.py` shows the order of use 1 to 5 as the brief gives it (sys.path, `sys.dont_write_bytecode`, `with_kinds`, `graph()`, `compose(...)` or `lanes_figure(...)`, `write_figures(base, figures, root)`). Matches.
- `grep -n -i 'docs/figures\|research\|paper\|grill\|plan\|orchestration\|ordo' skills/code/handbook/templates/figures.py` prints nothing (rc=1). Matches.
- `grep -n 'from figures import\|import figures' docs/figures/gen_figures.py docs/figures/academic/researcher/gen_academic_pipeline.py` prints `gen_academic_pipeline.py:54:    import figures as fg` and `gen_figures.py:119:    from figures import (`. Matches for the two scripts.
  - A third file also imports the engine: `git grep -n 'import' -- docs/figures/ordo_kinds.py` prints `docs/figures/ordo_kinds.py:11:from figures import Kind, Style`. It is a module, not a script.
- `sed -n 19p docs/dev/scripts.md` prints the row as quoted. Matches.
- `sed -n 38p`, `172p` and `183p README.md` print the three lines as described, and `ls skills/*/*/SKILL.md | wc -l` prints `24`. Matches.
- `skills/ordo/ordo-help/SKILL.md`, "What it reads" 2 and 3 and "Steps / skills" 3 (the `no Quick start block` line), read with `sed -n 33,56p` and `95,110p`. Matches.
- `grep -n '^## ' docs/glossary.md` prints `6:## Plan terms` and `146:## Ordo's own terms`.
  - `grep -n 'slug, of a section' docs/glossary.md` prints line 182.
  - The entries of lines 148 to 191 pass `LC_ALL=C sort -c -f` (prints `sorted`, 44 entries).
  - `grep -n -i 'handbook\|feature map\|getting-started' docs/glossary.md` prints nothing.
  - These match. The sentence "A term only one skill uses goes into 'Ordo's own terms'" has no source on the tree. See section 4.
- `grep -n '^libraries' docs/plan.yaml` prints `14:libraries: avoid ...`. Matches.
- The state file's `verify:` (lines 7 to 22) against `docs/dev/building.md` lines 6 to 21: the same 16 commands with the filters of the change standard. Matches.
- The rulings D24, D26, D27, D29, D34, D35, D38, D41 and Open item A stand in `plan.md` "## Rulings". Matches.
- ADR 0058 Decision bullets and ADR 0060 Decision bullets (read whole) are quoted word for word. Matches.
- "No other ADR governs a file, a name or a rule this step writes": see section 7. It holds apart from the clash already inside ADR 0060.

Findings:
- Line 13, "the two scripts that import the engine today": a third file, `docs/figures/ordo_kinds.py:11`, imports it too. The statement holds for scripts only.

## 4. Cases and checks

- Case 1 (the description count) is consistent with `docs/dev/skill-layout.md`, "Frontmatter". `python3 -c 'import yaml'` works (PyYAML 6.0.2). On main the command piped through `grep handbook` prints nothing (rc=1), as the case says.
- Case 2 (the Quick start awk) is consistent in intent. See section 5 on what it can miss.
- Case 3 (`grep -n '^## '`) is consistent with "Sections, in order".
- Cases 4 to 7 (reading on made-up repositories) are consistent with the change standard, "Scripts compute facts; judgment is read", and with the brief's rule that a text case is checked by reading.
- Cases 8 to 10 (manual.py escaping, a path outside the root, a non-UTF-8 document) are consistent with change standard rules 15 and 16.
- Case 11 (run from another directory) is consistent, but its expected result is either of two outcomes ("writes under the repository it is given ... or refuses as it says"). Decision 3 already fixes the root as an argument, so the expected result can be "writes under the root it is given". As written, the case passes whatever the script does, so long as its head comment matches.
- Case 12 (the diagram file) is consistent.
- Case 13 (`grep -n 'handbook' docs/dev/scripts.md`): see section 5.
- Case 14 (the private-names grep) uses `git grep`. See section 5.
- Case 15 (README) is consistent, but it does not cover line 172 or 183. See section 5.
- Item 7, first bullet: the head comment says "what it does, how it is run, what it reads, what it writes and each error it raises". Change standard rule 14 also requires "every exit status it returns". The bullet leaves exit statuses out.
- Item 9 and premise line 17: the rule "A term only one skill uses goes into 'Ordo's own terms'" is not written anywhere.
  - `git grep -n -i "own terms" -- skills docs CLAUDE.md` finds it in no rule.
  - `docs/dev/skill-layout.md`, "Writing for an agent", bullet 3, says: "A skill that needs a new term, or a term in a new sense, adds or changes its entry in `skills/ordo/ordo-init/templates/plan-terms.md` first". Handbook's `kind` is a plan term (`docs/glossary.md:61`) used in a new sense.
  - The placement the brief picks does match the glossary template (`skills/ordo/ordo-init/templates/docs/glossary.md:3`, which limits the block to the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `writing`, `code-comments`, `paper` and `ordo-init`). It also matches the precedents `case, of research` and `slug, of a section of a project's README`.
  - The brief should cite that line as its source and say why the rule of "Writing for an agent" does not apply, rather than state an unsourced rule.
- No case asks the builder to check, quote or explain a place the step does not change.

Findings:
- Case 11's expected result accepts two outcomes, so it cannot fail.
- Item 7's head-comment bullet leaves out the exit statuses that change standard rule 14 requires.
- Item 9 and premise line 17 state a placement rule with no source, against the literal words of `docs/dev/skill-layout.md`, "Writing for an agent", bullet 3. The source that supports it is `skills/ordo/ordo-init/templates/docs/glossary.md:3` and is not cited.

## 5. The question

"The goal" here is a new skill `skills/code/handbook` that writes a software repository's README and its supporting documentation as ADR 0058 decides, drawing diagrams with the engine under its `templates/` as ADR 0060 decides.

- Case 1: no. It measures a fact the goal needs.
- Case 2: yes. The awk does not stop at the next `## ` heading, so a code block anywhere after `## Quick start` satisfies it, even when Quick start holds none, and `/ordo-help skills` would then print `no Quick start block`. Shown with `printf '## Quick start\n\nNo block here.\n\n## Use instead\n\n## Steps\n\n```sh\nx\n```\n' | awk '/^## Quick start/{f=1;next} f&&/^```/{n++} f&&n==2{print "closed"; exit}'`, which prints `closed`.
- Case 3: no, for the order of sections. The content is the user's reading.
- Cases 4 to 7: these are the builder reading its own text. They could pass on a lenient read. The user's reading in item 13 is what closes them, so no as a whole.
- Case 8: yes, in part. A page can pass with a tab per document and the code block escaped while:
  - every relative image and link of a document outside `docs/user/` is broken in `docs/user/manual.html`, for example a README's images at `docs/figures/...` read from `docs/user/`;
  - a raw HTML line outside a code block, the common case in software READMEs, is not in the input, so its escaping is never exercised.
- Cases 9 and 10: no.
- Case 11: yes. It accepts either outcome (section 4).
- Case 12: yes, in part. It runs a diagram file the builder writes by hand against the template engine under this machine's `python3` (3.13.4). It shows nothing of the skill's text, and it would pass while a documented repository's `python3` cannot import the engine. `/usr/bin/python3 --version` prints `Python 3.9.6`, and the engine's head comment says it "needs Python 3.10 or later" (it imports `itertools.pairwise`).
- Case 13: yes. `docs/dev/scripts.md` lines 9, 10 and 19 already contain `handbook` in the path `skills/code/handbook/templates/figures.py` (`git grep -n handbook -- docs/dev/scripts.md`). The grep therefore prints "the engine's row naming `handbook`" on the unchanged tree, without the row saying that `handbook` copies the engine. It needs a pattern on the new words, such as a grep on the engine's row for "copies".
- Case 14: yes. `git grep` reads tracked files only. The builder may not `git add` (change standard, "Where the work happens"), so the new files under `skills/code/handbook/` are untracked and the grep prints nothing whatever they hold. Shown on the untracked brief: `git grep -n -c 'handbook' -- <ledger>/agents/briefs/3.md` prints nothing (rc=1), while `git grep --untracked -n -c ...` prints `...3.md:35`. It needs `--untracked` or plain `grep -rn`.
- Case 15: yes. It checks line 38 and the absence of "twenty-four", not that line 172's loop holds `code/handbook` or that line 183 reads "twenty-five". If the loop entry is missing, the documented install copies 24 skills and leaves `handbook` uninstalled.
- The step line's check: "the user reads the text against ADRs 0058 and 0060" is no. "`/ordo-help skills` lists `handbook`" has no run anywhere (section 2), so it can pass by not being run. "description at most 1,024" is no.
- Item 1: no; Cases 1 to 3 and the user's reading cover it.
- Items 2 to 5: no; they are covered by the user's reading.
- Item 6: yes, in part (Case 12 above). Nothing covers the second run, where `utils/diagrams.py` already exists (section 6).
- Item 7: yes, in part (Case 8 above).
  - Bullet 4 (ASCII where the documents are ASCII, styles inline, nothing loaded from the network, both themes) has no case, though the first three are facts a machine computes: `LC_ALL=C grep -n '[^ -~]'`, and a grep for `http`, `<link` and `src=` on the page.
  - The "differs from the template" bullet has no case for `manual.py` (Case 6 covers only `figures.py`).
- Item 8: yes (Case 13).
- Item 9: no; it is read. The sync check covers only the plan-terms block.
- Item 10: no case. A grep of ADR 0058's Decision for `.dot` would be a fact. As briefed it rests on the reviewer reading it, and see section 7 on whether it is the right edit.
- Item 11: yes (Case 15).
- Items 12 and 13: no; they are read by the user.

Findings:
- Case 2 passes with no code block under `## Quick start`.
- Case 8 passes with broken relative images and links and with untested raw HTML.
- Case 11 passes either way.
- Case 12 passes under a `python3` that the documented repository may not have.
- Case 13 passes on the unchanged tree.
- Case 14 passes vacuously because `git grep` skips untracked files.
- Case 15 passes without the install loop's `code/handbook`.
- Item 7, bullet 4, and its "differs" bullet for `manual.py` have no case.
- The `/ordo-help skills` part of the step line has no run.

## 6. Implied inputs

For `templates/manual.py`:
- Relative image and link paths in a document outside `docs/user/` (has happened: Ordo's own `README.md` holds 27 image paths under `docs/figures/`). Missing. The expected result should be decided: each relative path rewritten relative to `docs/user/manual.html`, or a link to another document of the run pointed at its tab. As written, every image of the root README is broken in the page.
- Two documents with the same file name, which happens in every run that holds both kinds: `README.md` and `docs/README.md`. Missing. Expected: a distinct tab label and a distinct id for each. The brief never says where a tab's label and id come from.
- A raw HTML line outside a code block, such as `<p align="center">` or `<img ...>` in a README, common in software READMEs. Missing. Expected: escaped and shown as text (rule 15).
- A link whose target holds a `"`, or uses the `javascript:` scheme. Missing. Expected: the quote escaped inside the attribute. Whether a `javascript:` target is refused or written as text should be decided.
- A document path that does not exist, which will happen when a page named in the stored command of `docs/README.md` is renamed. Missing. Expected: exit non-zero naming the path, nothing written.
- No document given. Missing. Expected: a usage error, exit non-zero, nothing written.
- `docs/user/` absent under the root (a run whose kinds write nothing else there). Missing. Expected: the folder created, or a refusal, stated in the head comment.
- A root argument that is not a directory. Missing. Expected: exit non-zero naming it.
- An absolute document path that lies inside the root. Missing. Decision 3 says relative to the root. Expected: accepted, or refused, stated.
- A read-back that differs (item 7, bullet 2). The brief does not say whether the refused file is left on disk. Expected: stated in the head comment.
- The Python version `manual.py` needs. Missing (see the engine below).

For the copy of the engine and the diagram file into a documented repository:
- A `python3` older than 3.10 (has happened: `/usr/bin/python3 --version` prints `Python 3.9.6` on this machine; the engine says it "needs Python 3.10 or later"). Missing. Expected: the skill checks `python3 --version` before it copies, and the first stop names the version needed. Otherwise `python3 utils/diagrams.py` fails on import in the user's repository.
- `utils/diagrams.py` that already exists, which every second run of `/handbook` on the same repository meets, or a foreign file of that name. Missing. Item 6 guards only `figures.py` and `manual.py`. Expected: treated as a page that exists, shown as a draft with every graph kept and every change marked, and never written over unseen.
- `utils/manual.py` that differs from the template: stated in item 7 but missing from "Cases" (Case 6 covers `figures.py` only). Expected: not written over, and shown at the first stop as a question.
- A diagram the engine refuses with `FigureError`: a label that does not fit, a non-ASCII label (`write_figures` refuses a non-ASCII body, `figures.py:1305`), or a cycle not marked as a return. Missing. Expected: the error shown, and the graph corrected in the draft within a stated number of tries (`docs/dev/skill-layout.md`, "Writing for an agent", on repeats).
- A label holding a quote or a backslash, written into `utils/diagrams.py` as a Python string (rule 15, generated text). Missing. Expected: the generated file runs and draws the label as given.
- `utils/diagrams.py` run from a directory other than the root. Missing; Case 11 covers this for `manual.py` only. Expected: the `.svg` files written under `docs/user/diagrams/` of the repository, found from the file's own path.

Findings: each item above marked "Missing".

## 7. ADRs

I read each `docs/adr/NNNN-*.md` for its part in force. A grep for the step's names (`git grep -l -i 'utils/\|scripts\.md\|glossary\|README\|handbook\|figures\|skill-layout\|code/'`) selected the records to read in full.

- 0058 touches the step. The step is under every Decision bullet the brief quotes (line 21). Named.
- 0060 touches the step. It is under "The layout engine of `gen_figures.py` is kept once, in `handbook`'s `templates/`" and "`handbook` copies it into a documented repository's `utils/`, writes each diagram as a graph in a Python file beside it, and commits the `.svg` it draws". Named.
- 0057 is the research-project counterpart and does not govern a file the step writes. Named as not changed.
- 0010 (verify list equal to the verification page): the step does not change `docs/dev/building.md`. The brief's premise covers it.
- 0051 (`utils/build.py` by `ordo-init`): it governs `ordo-init`'s writes to `utils/`, not `handbook`'s. Does not touch the step.
- 0043 and 0049 (figure paths, step 1), 0045, 0046 and 0047 (`wizard`, `codebase-design`), 0053 and 0059: do not govern a file, name or rule this step writes.
- The remaining records (0001 to 0044 on writing, paper, cost and ledger; 0050, 0052, 0054 to 0056): no part touches the step.

Contradictions:
- Brief item 12, "It writes no file of the documented repository before the user's approval, and commits nothing there: the user commits", contradicts ADR 0060's Decision, "... and commits the `.svg` it draws".
  - `docs/adr/README.md` says: "A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on."
  - The brief neither follows the sentence, nor raises a stop, nor lists ADR 0060 under "Paths this step writes" for a refinement. The ruling D38 ("its `.svg` committed") does not say who commits.

ADR 0058's "diagrams as `.dot`" against ADR 0060:
- The brief treats the change as a refinement and edits ADR 0058's kinds bullet in place (premise line 23, item 10). In my judgment this does not follow `docs/adr/README.md`.
- That page says: "A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state."
- The diagram format is a decision that changed. ADR 0060 decides it anew and lists Graphviz under "Alternatives rejected" ("Graphviz: every documented repository would need it installed"). That is a new ADR deciding against the old sentence, which is the case the README gives to supersession, not a refinement that keeps the decision.
- The tree's practice for a part replaced by a later record is a status line naming the part:
  - ADR 0053 reads `Status: proposed; superseded by 0056 in the sentence "Jobs are submitted only after it.", and by 0057 in the bullet ...`;
  - ADR 0045 reads `Status: proposed; superseded by 0046 in ...`.
  - (`grep -n '^Status' docs/adr/0*.md`.)
- The plan-terms entry **ADR** says a record is in force "except for the part its own opening lines, or a later record, say is superseded". Today neither 0058's Status line nor 0060 says so, so both bullets are in force and contradict each other.
- The handling consistent with the README: ADR 0058's Status line becomes `proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"`, and its Decision text is left as written. The in-place edit of item 10 removes the decided sentence and leaves no record that 0060 replaced it.
- The precedent of D8 (paths in ADRs 0043 and 0049 edited as a refinement) was a path change that kept each decision, so it does not carry over.

Findings:
- Brief item 12 contradicts ADR 0060's "commits the `.svg` it draws". This is a rule clash that needs a stop and a ruling, or the brief follows the ADR.
- The ADR 0058 handling (premise line 23, item 10) edits a superseded decision as a refinement, against `docs/adr/README.md`. The README and the tree's practice call for 0058's Status line to record the supersession by 0060 in that bullet.
- No ADR the step touches is missing from "What is on the tree".

## 8. Dictated text

- `name: handbook`: `grep -n 'name: handbook' <brief>` gives line 29. Holds (`docs/dev/skill-layout.md`, "Frontmatter": `name` equals the folder's name).
- `metadata.version: "1.0.0"`: `grep -n 'version: "1.0.0"' <brief>` gives line 28. Holds.
- `/handbook [<repository folder>]`: `grep -n '/handbook \[<repository folder>\]' <brief>` gives line 30. Holds ("Sections, in order", row 2, which needs a short comment beside it, left to the builder).
- `python3 utils/manual.py <repository root> <document> ...`: `grep -n 'python3 utils/manual.py <repository root> <document> \.\.\.' <brief>` gives line 114. Holds (ASCII three dots, prose standard B).
- The kinds table's cells and paths (`docs/user/guides/`, `docs/user/manual/`, `docs/user/reference/`, `docs/user/feature-map/`, `docs/user/diagrams/`, `docs/user/manual.html`, `docs/README.md`, and their kind phrases): `grep -n '| \`docs/user/' <brief>` gives lines 37 to 42. Holds; the paths are D34's and the kind phrases are ADR 0058's.
- `docs/user/diagrams/<name>.svg` and `utils/diagrams.py`: `grep -n 'docs/user/diagrams/<name>.svg' <brief>` gives line 113. Holds.
- "twenty-five" and `code/handbook` for README lines 38, 172 and 183: `grep -n 'twenty-five' <brief>` gives lines 15 and 61. Holds.
- ADR 0058's new bullet words, "diagrams as graphs in a Python file drawn by the engine of ADR 0060, each with its `.svg`": `grep -n 'diagrams as graphs in a Python file drawn by the engine of ADR 0060' <brief>` gives line 60.
  - It holds against the prose standard: ASCII, no dash aside, plain.
  - "graphs in a Python file" writes the brief's reversible Decision 2 (one file for every diagram) into an ADR. ADR 0060 says "each diagram as a graph in a Python file".
  - Section 7 recommends against this edit altogether.
- `LC_ALL=C grep -n '[^ -~]' <brief>` prints nothing (rc=1): the brief is ASCII.

Findings: none against the rules, apart from the remark on the ADR 0058 bullet above.

## Declined to judge

- Whether D35's "no test" for `manual.py` should stand, given that its escaping and path refusal are places of change standard rule 15. This is the user's ruling (change standard rule 23 is the user's to apply).
- Brief Decision 1 (`handbook` starts no agent) and Decision 4 (API pages as build output, not committed): reversible decisions of the brief that no ADR sentence settles. These are for the orchestrator.
- Whether the neighbour skills' "Use instead" tables (`researcher`, `ordo-init`) should gain a `handbook` row: outside this brief's paths and not made false by it. This is for the orchestrator.
- Whether the page's tabs may use an inline script of the page's own. The brief allows it implicitly ("no `<script>` element from a document"). This is a design choice.

Agent usage: af894f369408218fe, claude-opus-5-5, 182732 tokens, 44 tool uses, 7 min 45 s.

## Closed

- Names and ADRs, item 12 against ADR 0060's "commits the `.svg` it draws": a contradiction in the brief's own wording, closed by following the ADR; item 12 now has the skill commit, after the approval, every file it wrote in the run by explicit path and never push, the generated API pages left out; "What is on the tree" quotes the sentence, and decision 5 says why every written file goes into the commit.
- Names, "reference page" in two senses: item 9 now asks for `kind, of handbook`, `reference page, of handbook` and the core of a software README, each with a qualified headword; item 2 calls `references/kinds.md` a reference page.
- The step line, `/ordo-help skills` with no run: `plan.md` gains "### Step 8, carried", which records the separate agent's run of `/ordo-help skills` after the pin as step 3's check; item 13 names it.
- Premises, a third importer: "What is on the tree" names `docs/figures/ordo_kinds.py` line 11.
- Cases, case 11 with two outcomes: it now expects the page under the root given and nothing in the working directory.
- Cases, item 7's head comment: it now names the Python version and every exit status (change standard rule 14).
- Cases, the glossary placement: "What is on the tree" cites `skills/ordo/ordo-init/templates/docs/glossary.md` line 3 and says which skills "Writing for an agent" bullet 3 governs.
- The question, case 2: the awk stops at the next `## ` heading; item 1 says the block closes before it.
- The question, case 8: the `manual.py` case now holds `README.md` and `docs/README.md`, a raw HTML line, a link to the other document, a `javascript:` link, a target with a quote and an image under `docs/figures/`, with the expected result of each; item 7 states the behaviour of each.
- The question, case 12 and the Python version: item 3 reads `python3 --version` before the engine is copied and names a version below 3.10 at the first stop; a reading case for it is added; `manual.py` runs on 3.9 or later, with a case under `/usr/bin/python3`.
- The question, case 13: it greps the new row by `templates/manual.py` and the engine's row for "copies", with the unchanged tree's output.
- The question, case 14: a plain `grep -rn`, since the new files are untracked.
- The question, case 15: lines 172 and 183 are checked too.
- The question, item 7 bullet 4 and the `manual.py` copy that differs: a case on the page's characters and network loads, and the differing-copy reading case now covers `utils/manual.py`.
- The question, item 10: a case prints ADR 0058's Status line.
- Implied inputs, `manual.py`: item 7 now states relative paths rewritten, tabs labelled and identified by path, schemes other than `http`, `https` and `mailto` written as text, attribute escaping, raw HTML escaped, no document (exit 2), a root that is no directory and a missing document refused, `docs/user/` created, an absolute path inside the root accepted, the page removed on a read-back that differs; the cases cover them.
- Implied inputs, the engine's copy and the diagram file: item 6 now states `utils/diagrams.py` that exists treated as a page that exists, the root found from `__file__`, labels written by `repr`, and a refused diagram corrected at most three times then shown at the drafts stop; the diagram case and three reading cases cover them.
- ADRs, ADR 0058 edited as a refinement: closed by following `docs/adr/README.md`; item 10 now writes ADR 0058's Status line as `Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"`, its Decision left as written; the premise correction says why.
- Dictated text added after the check: that Status line, read against the prose standard and the form of ADR 0053's Status line: holds (ASCII, the form `superseded by NNNN in <the part>`).
