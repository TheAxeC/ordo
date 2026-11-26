# Step 3 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-3, base 749f499)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ printf '%s\0' skills/code/handbook/SKILL.md skills/code/handbook/references/*.md skills/code/handbook/templates/manual.py docs/dev/scripts.md docs/glossary.md docs/adr/0058-*.md README.md .scratch/27-.../agents/reviews/3-report.md | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0
$ env -u ... python3 -c 'import glob,yaml; ...' | grep handbook
1006 skills/code/handbook/SKILL.md
$ ruff check --select F,W2 skills/code/handbook/templates/manual.py
All checks passed!
$ ruff check --preview --select E3 skills/code/handbook/templates/manual.py
All checks passed!
$ awk 'length>100' skills/code/handbook/templates/manual.py
(nothing)
$ awk '/^## Quick start/{f=1;next} ... ' skills/code/handbook/SKILL.md
closed
$ grep -n '^## ' skills/code/handbook/SKILL.md
12:## Quick start
18:## Use instead
27:## What it reads
41:## Steps
122:## Stops
132:## Anti-patterns
143:## Rules
$ grep -n 'templates/manual.py' docs/dev/scripts.md
20:| `skills/code/handbook/templates/manual.py` | The script the `handbook` skill copies into a documented repository as `utils/manual.py`. ...
$ grep -n 'figures.py' docs/dev/scripts.md | grep -c 'copies'
1
$ grep -rn -i 'research-hub\|cathedra\|game-engine\|oculus\|/Users/\|~/' skills/code/handbook; echo "exit $?"
exit 1
$ sed -n 38p README.md | grep -c handbook; sed -n 172p README.md | grep -c 'code/codebase-design code/handbook'; sed -n 183p README.md | grep -c twenty-five; grep -c twenty-four README.md
1
1
1
0
$ sed -n 3p docs/adr/0058-*.md
Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"
$ ls skills/*/*/SKILL.md | wc -l
      25
$ cmp skills/code/handbook/templates/figures.py <(git show 749f499:skills/code/handbook/templates/figures.py) && echo figures-unchanged
figures-unchanged
(every skill folder of the README line 172 loop exists: 25 names, no "missing")
```

The perl command and the ledger path are shortened with "..." in this block only; they were run as the brief writes them.

The `manual.py` runs, on scratch repository `.../scratchpad/step3-review/repo` (a git repository, `utils/manual.py` copied from the template, `README.md` with a heading, a paragraph with inline code, bold and italic, a nested list, a numbered list, a table, a fenced block holding `<script>alert(1)</script>`, the line `<p align="center">`, a link to `docs/README.md`, `[x](javascript:alert(1))`, `[q](a"b.md)`, `![A figure](docs/figures/a.svg)`, and one extra line with an `https` image, `JaVaScRiPt:`, `data:` and `//host` targets; `docs/README.md` linking `../README.md`; no `docs/user/`):

```
$ python3 utils/manual.py . README.md docs/README.md; echo "exit: $?"
wrote docs/user/manual.html (3092 bytes)
exit: 0
$ ls docs/user
manual.html
43-<a href="#-------md">README.md</a>
44-<a href="#docs--------md">docs/README.md</a>
47:<section class="doc" id="-------md">
65:<section class="doc" id="docs--------md">
59:<pre><code>&lt;script&gt;alert(1)&lt;/script&gt;</code></pre>
60:<p>&lt;p align=&quot;center&quot;&gt;</p>
61:<p>See <a href="#docs--------md">the index</a>, [x](javascript:alert(1)) and <a href="../../a&quot;b.md">q</a>.</p>
62:<p><img src="../figures/a.svg" alt="A figure"></p>
63:<p><img src="https://img.shields.io/badge/x.svg" alt="badge"> [bad](JaVaScRiPt:alert(2)) [d](data:text/html,hi) <a href="//evil.example/a.png">p</a></p>
67:<p>Back to <a href="#-------md">the README</a>.</p>
$ grep -c '<script' docs/user/manual.html
0
$ LC_ALL=C grep -c '[^ -~]' docs/user/manual.html
0
$ grep -n -i 'http://\|https://\|<link\|<script src' docs/user/manual.html
63:<p><img src="https://img.shields.io/badge/x.svg" ...   (only the extra line; without it the brief's document gives nothing)
--- 3.9
Python 3.9.6
wrote docs/user/manual.html (2806 bytes)
exit: 0
--- none (`.` alone, then no argument)
usage: python3 utils/manual.py <repository root> <document> ...
exit: 2
usage: python3 utils/manual.py <repository root> <document> ...
exit: 2
--- root
error: the root ./nothere is not a directory
exit: 1
error: the root README.md is not a directory
exit: 1
--- missing
error: the document missing.md does not exist
exit: 1
--- outside
error: the document ../outside.md lies outside the repository root .
exit: 1
--- latin
error: the document latin.md is not UTF-8
exit: 1
--- dir as doc
error: the document docs does not exist
exit: 1
no docs/user
--- absolute ($PWD/README.md)
wrote docs/user/manual.html (2806 bytes)
exit: 0
--- other cwd (cd elsewhere && python3 <scratch>/repo/utils/manual.py <scratch>/repo README.md)
wrote docs/user/manual.html (2806 bytes)
exit: 0
       0          (entries in elsewhere)
manual.html       (in <scratch>/repo/docs/user)
find <scratch> -name __pycache__: nothing, exit 0
```

Tab id collision, scratch repository `.../step3-review/collide`, `README.md` linking `DESIGN.md`:

```
$ python3 utils/manual.py . README.md DESIGN.md; echo "exit: $?"
wrote docs/user/manual.html (2335 bytes)
exit: 0
43:<a href="#-------md">README.md</a>
44:<a href="#-------md">DESIGN.md</a>
47:<section class="doc" id="-------md">
49:<p>See <a href="#-------md">design</a>.</p>
51:<section class="doc" id="-------md">
```

The diagram runs: `.../step3-review/form` holds `utils/figures.py` from the template and `utils/diagrams.py` extracted verbatim from the code block of `references/diagrams.md`; `.../step3-review/diag` the same with three boxes and two arrows, the first label written by `repr`:

```
(form) $ python3 utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (4200 bytes)
exit: 0
(diag) 71:        Node('parser', 'Reads "a\\b"', 'part'),
$ python3 utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (3317 bytes)
exit: 0
a31d99a64054431889893323b987895f25c8cb72  docs/user/diagrams/parts.svg
Reads "a\b"
(from elsewhere) wrote docs/user/diagrams/parts.svg (3317 bytes)
exit: 0
a31d99a64054431889893323b987895f25c8cb72  .../diag/docs/user/diagrams/parts.svg
       0   (entries in elsewhere)
(form, 'Document model' replaced by 120 x's)
error: parts.svg: box 'model': the word 'xxxx...' ...
ls: docs: No such file or directory
(form, 'Writer' replaced by a label with a non-ASCII letter)
error: parts.svg: the body holds a character that is not ASCII
find <scratch> -name __pycache__: nothing, exit 0
```

The builder's shasum `a31d99a6...` is reproduced. The builder's 3019-byte figure for its own main document is not reproduced, since my document differs. No decision rests on it.

Rule 14 greps (reviewer's): `grep -rln handbook skills utils docs README.md` gives the same 13 files the report lists. `grep -rn 'manual\.py'` outside the skill gives `docs/glossary.md:179` and `docs/dev/scripts.md:20`. `grep -rn 'twenty-four\|24 skills\|twenty four\|twenty-three'` outside the roadmap and the ADRs prints nothing. `docs/adr/README.md` rows 67 and 69 have no status column. The glossary's "Ordo's own terms" headwords are sorted (`sort -c -f` over them prints `sorted`).

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `name: handbook`, version `1.0.0`, description 1006 characters naming no neighbouring skill, the Quick start block closed with `/handbook [<repository folder>]`, and the four Use instead rows the item names. The sections are in the layout's order.
- 2: holds. `references/kinds.md` gives the nine kinds, each with what it holds, when a repository has a use for it and its path under the D34 folders. "A page of a kind that exists stays at its path."
- 3: holds. Steps 2 to 5 read the code first, then `python3 --version` when the engine would be copied, with a version below 3.10 asked at the first stop. Nothing is drafted before the confirmation (Steps 5).
- 4: holds. `references/kinds.md`, "The README", gives the core's order and the placement of the repository's own sections. Steps 6 drafts it that way.
- 5: holds. Steps 6 names each claim's source and turns what no file holds into a question. Steps 8 shows every draft whole with its changes and where each old fact went. Steps 9 writes only after the approval.
- 6: violated, Behaviour 1. The copy, the `__file__` root, `repr`, the three corrections and the drafts stop are as the item says, and my runs reproduce them. When the user keeps a differing `utils/figures.py`, however, the `.svg` the drafts stop shows was not drawn by the engine that draws the committed one.
- 7: violated, Spec 1. Most of the item holds, by my runs: tab labels, relative paths, schemes, escaping, raw HTML, the errors, the exit statuses, 3.9, any working directory, read-back by reading `write_page`. The exception is that an `http`/`https` image makes the page load from the network, against "loads nothing from the network". Spec 2 also concerns this item: the id rule the brief dictates makes two tabs share one id.
- 8: holds. The new row is line 20, and the engine's row says that `handbook` copies the engine (count 1).
- 9: holds. Eleven entries with qualified headwords, in order, each with its "Stated in". The plan-terms block is unchanged (sync check ok).
- 10: holds. `sed -n 3p` prints the Status line of the item. The Decision text is unchanged by the diff.
- 11: holds. Lines 38, 172 and 183 are changed as asked (counts 1, 1, 1, 0). The diff changes no other README line, and the group lists sum to 25.
- 12: holds. "The kinds" (Steps 5) and "The drafts" (Steps 8) come before Steps 9 and 10, which write and commit. The scratch run of Steps 7 writes outside the repository, which ADR 0060's "commits the `.svg` it draws" allows, since the repository's `.svg` is drawn at Steps 9 after the approval. The commit names each path, the API pages are left out, there is no push, and the Stops table has the five rows. The minor layout points are in Standards 1.
- 13: holds for what the step does. The Quick start block and the frontmatter that `/ordo-help skills` reads are checked on the tree. The user's reading and the run after the pin are carried, as the brief says.

Cases of the brief's "Cases":

- Description count: met, `1006 skills/code/handbook/SKILL.md`.
- Quick start closed: met, `closed`.
- Sections in order: met, the seven `##` headings in the layout's order, with no reference section.
- Made-up C++ library with "Building" and "Contributing": met by reading. Steps 4 and 5 give the paths and the reasons, Steps 6 and its first made-up example keep both sections, and Rules 1 writes nothing before the approval.
- Existing `docs/manual/install.md`: met by reading (Steps 4 bullet 1, and Steps 6 bullet 3 with its second example).
- Differing `utils/figures.py` and `utils/manual.py`: met by reading. Steps 3 compares each copy with `cmp -s` and asks about one that differs at the first stop, and Steps 9 copies "except a copy the user kept".
- Existing `utils/diagrams.py`: met by reading (Steps 7 bullet 2).
- `python3` 3.9: met by reading (Steps 3 bullet 2 and the Stops row "The kinds").
- A label that does not fit: met. Steps 7 bullets 4 and 5 say so, and my run shows the engine's error and nothing written.
- Not a repository, no code: met by reading (Steps 1 and the two refusal rows).
- `manual.py` main run: met, by the run above, lines 43 to 67.
- The page is ASCII and loads nothing from the network: met for the brief's document (`0`, and the grep empty without my extra line). See Spec 1 for a document with an `https` image.
- `/usr/bin/python3` 3.9.6: met, exit 0.
- No document, bad root, missing document: met, exit 2 with the usage line, then exit 1 naming the path, and no `docs/user`.
- `../outside.md`: met, exit 1 naming it.
- Not UTF-8: met, exit 1 naming the file.
- Another working directory: met, it wrote under the scratch root and left 0 entries in the working directory.
- Diagram file: met. Exit 0, the same sha from two working directories, no `__pycache__`, and `Reads "a\b"` drawn as given.
- `scripts.md` rows: met, line 20 and `1`.
- Private names: met, the grep exit is 1. The examples say "A made-up example" (`SKILL.md`, Steps 6) and "invented for this page" (`references/diagrams.md`).
- README lines: met, `1 1 1 0`.
- ADR 0058 line 3: met.

## 1. Spec

- 1. `skills/code/handbook/templates/manual.py:25-27`: "A target whose scheme is http, https or mailto is kept as it is, so an image with such a target is loaded from its address." Same file, `:29`: "loads no file of its own from the network".
  - What is wrong: item 7 says both that an `http`/`https` target is kept and that the page "loads nothing from the network". For an image the two bullets conflict. The builder settled the conflict itself: it kept `<img src="https://...">` and narrowed the head comment to "no file of its own". The report lists this as a judgment call, "Remote images", and says "Nothing" under "Anything in the brief that was wrong or impossible". Change standard rule 4 says a point the brief leaves to the orchestrator is reported as a stop and never decided as a judgment call.
  - Failure scenario: a documented README with the usual badges (`![build](https://img.shields.io/...)`) gives a `manual.html` that fetches every badge when opened. My run's line 63 shows `<img src="https://img.shields.io/badge/x.svg"`. A reader of item 7 or of `references/kinds.md` ("read the documentation offline in one file") expects a page that loads nothing.
  - The orchestrator's options: (a) write an `http`/`https` image as a link to its address rather than an `<img>`, which meets both bullets; (b) rule that remote images load, and change item 7's wording.
  - Verdict: item 7 violated.
- 2. `skills/code/handbook/templates/manual.py:153-155`: `return re.sub(r"[^a-z0-9]", "-", label)`.
  - What is wrong: this follows item 7's rule word for word, but the rule fails the purpose the item states for it ("so ... get two tabs that differ"). Upper-case letters are outside `[a-z0-9]`, so any two upper-case file names of equal length in one folder get one id. My run gives `README.md` and `DESIGN.md` the same id `-------md`. `INSTALL.md`, `HACKING.md`, `AUTHORS.md` and `ROADMAP.md` would also share one id with each other. Under D34 an existing page keeps its path, so such names reach the script.
  - The brief tells the builder to stop and hand back a case its rules get wrong. The report instead mentions only `a_b.md` and `a-b.md` and says the script does not refuse a shared id. That understates the case: the common one is upper-case names, not punctuation.
  - Failure scenario: a run on a repository with `README.md` and `DESIGN.md` exits 0, but the DESIGN tab and every link to `DESIGN.md` open the README section, and the DESIGN section can never be shown. The output is wrong with no error.
  - The rule is the brief's, so this is the orchestrator's ruling: for example, lower-case the path before the replacement, and add a suffix or refuse when two ids still match.
  - Verdict: makes item 7 violated together with Spec 1.

## 2. Proof

- none. The report's quoted runs reproduce: the description count, the sha `a31d99a6...`, the error texts and the exit statuses. The report's understatement of the id collision is under Spec 2.

## 3. Standards

- 1. `skills/code/handbook/SKILL.md`, Steps 8, last bullet: "A draft the user corrects is shown again with the corrections, and each answer to a question goes into its section."
  - Steps 1, bullet 3, has the same problem: "List the tracked files with `git -C <root> ls-files`, and a list that holds no source file is the refusal "No code"."
  - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables", says one rule per bullet. Each of these bullets joins with "and" two requirements that can each be broken while the other holds.
  - Failure scenario: a reviewer checking a later diff of either bullet cannot tell which rule a change dropped. This is minor, with no behaviour change.
  - Verdict: none (item 12 holds otherwise).

## 4. Behaviour

- 1. `skills/code/handbook/SKILL.md`, Steps 7 bullet 3: "holding `utils/figures.py` copied from the template". Steps 9 bullet 1: "except a copy the user kept at the first stop". Steps 9 bullet 4: "Run `python3 utils/diagrams.py` from the root".
  - What is wrong: when the user answers "keep" for a differing `utils/figures.py`, the drafts stop shows `.svg` files drawn by the template engine in the scratch folder. Steps 9 then draws the committed `.svg` with the repository's kept engine, which may lay it out differently or refuse it. No step compares the committed `.svg` with the one shown. The report's judgment call "Diagrams drawn before the approval" does not state this case.
  - Failure scenario: a repository whose own `utils/figures.py` changes a style or a width. The user approves a diagram at Steps 8, and Steps 10 commits a different `.svg` the user never saw, which goes against item 5 ("every page is shown as a draft"). If the kept engine refuses the graph, Steps 9 reaches "A command that fails" after the approval, with no correction loop.
  - The fix: copy the copy the run will use (the kept one, or the template) into the scratch folder at Steps 7.
  - Verdict: item 6 violated.

## Declined to judge

- How the page renders in a browser: the tabs work by CSS `:target` and `:has`, and the page should read the same in a light and a dark theme. This needs a browser to open the page, and the builder also marks it not verified.
- The `/ordo-help skills` run after the pin, and the user's reading of the text against ADRs 0058 and 0060. Both are carried by the brief (item 13): the first to step 8, the second to the user as an open item.
- What git ignores in a documented repository, for Steps 10's `check-ignore`. This is not needed for a verdict, and it would take `git check-ignore`, which is outside the three git commands allowed.

Reviewer usage: a70dc44bade66da5f, claude-opus-5-5, 184814 tokens, 33 tool uses, 7 min 12 s.

## Repair round 1, refuted

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ printf '%s\0' <SKILL.md, references/*.md, manual.py, scripts.md, glossary.md, ADR 0058, README.md, 3-report.md> | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0
$ python3 -c 'import glob,yaml; ...' | grep handbook
1006 skills/code/handbook/SKILL.md
$ ruff check --select F,W2 skills/code/handbook/templates/manual.py
All checks passed!
$ ruff check --preview --select E3 skills/code/handbook/templates/manual.py
All checks passed!
$ awk 'length>100' skills/code/handbook/templates/manual.py
(nothing)
$ awk '/^## Quick start/{f=1;next} ...' skills/code/handbook/SKILL.md
closed
$ grep -n '^## ' skills/code/handbook/SKILL.md
12 Quick start, 18 Use instead, 27 What it reads, 41 Steps, 137 Stops, 147 Anti-patterns, 158 Rules
$ grep -n 'templates/manual.py' docs/dev/scripts.md   -> line 20 (the new row)
$ grep -n 'figures.py' docs/dev/scripts.md | grep -c copies
1
$ grep -rn -i 'research-hub\|cathedra\|game-engine\|oculus\|/Users/\|~/' skills/code/handbook; echo "exit $?"
exit 1
$ README: sed -n 38p | grep -c handbook; sed -n 172p | grep -c 'code/codebase-design code/handbook'; sed -n 183p | grep -c twenty-five; grep -c twenty-four README.md
1 / 1 / 1 / 0
$ sed -n 3p docs/adr/0058-*.md
Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"
$ ls skills/*/*/SKILL.md | wc -l
25
$ cmp skills/code/handbook/templates/figures.py <(git show 749f499:skills/code/handbook/templates/figures.py)
figures-unchanged
$ find skills docs -name __pycache__          (nothing)
```

The round's delta is SKILL.md, references/kinds.md, references/diagrams.md and templates/manual.py. README.md, ADR 0058, scripts.md and glossary.md are identical to the snapshot. No path outside `files.txt` changed besides the report.

`manual.py` runs, in `step3-round-review/repo`. The document set is `README.md`, `DESIGN.md` and `docs/README.md`, with no `docs/user/`:

```
$ python3 utils/manual.py . README.md DESIGN.md docs/README.md   -> wrote docs/user/manual.html (3528 bytes), exit 0
44:<a href="#readme-md">README.md</a>
45:<a href="#design-md">DESIGN.md</a>
46:<a href="#docs-readme-md">docs/README.md</a>
49:<section class="doc" id="readme-md">   68: id="design-md"   72: id="docs-readme-md"
63:<p>See <a href="#docs-readme-md">the index</a>, <a href="#design-md">the design</a>, [x](javascript:alert(1)) and <a href="../../a&quot;b.md">q</a>.</p>
61:<pre><code>&lt;script&gt;alert(1)&lt;/script&gt;</code></pre>
62:<p>&lt;p align=&quot;center&quot;&gt;</p>
64:<p><img src="../figures/a.svg" alt="A figure"></p>
65:<p>Badge: <a href="https://img.shields.io/badge/x.svg">build status</a>, empty: <a href="https://example.org/b.png">https://example.org/b.png</a>, caps: <a href="HTTPS://example.org/c.png">c</a>, ...
$ grep -c '<script' docs/user/manual.html            -> 0
$ LC_ALL=C grep -c '[^ -~]' docs/user/manual.html    -> 0
$ grep -n -i 'http://\|https://\|<link\|<script src' -> only the link lines of line 65 (anchors, no <img>)
66:<p>Proto: <img src="//evil.example/p.png" alt="p"> and root: <img src="/abs/r.png" alt="r"> and mail <img src="mailto:a@b.c" alt="m"></p>
```

- The same set under `/usr/bin/python3` (3.9.6) exits 0.
- No document: exit 2 with the usage line, and again with no argument at all. `docs/user` is not created.
- Root `./nothere` and root `README.md`: exit 1, "error: the root ... is not a directory".
- Missing document: exit 1 naming the path.
- `../outside.md`: exit 1, "lies outside the repository root".
- A Latin-1 document: exit 1, "is not UTF-8". Nothing was written.
- An absolute document path inside the root: exit 0.
- Run from another directory: it wrote `<scratch>/docs/user/manual.html` and 0 entries in the working directory.
- `x/a_b.md`, `x/a-b.md` and `x/a.b.md` give `x-a-b-md`, `x-a-b-md-2` and `x-a-b-md-3`.
- `x/a-b.md`, `x/a_b.md` and `x/a-b-2.md` give `x-a-b-md`, `x-a-b-md-2` and `x-a-b-2-md`.
- `README.md` given twice gives `readme-md` and `readme-md-2`.

Diagram case, in `step3-round-review/diag`. `utils/figures.py` is the template, and `utils/diagrams.py` is the code block of `references/diagrams.md` with the label made `'Reads "a\\b"'`:

```
$ python3 utils/diagrams.py -> wrote docs/user/diagrams/parts.svg (4158 bytes), exit 0
$ grep -o 'Reads "a.b"' docs/user/diagrams/parts.svg   -> Reads "a\b"
from another directory: exit 0, 0 entries in the working directory; the sha of the .svg is the same as before (d920ac9d..., for the unedited form)
a label of 120 x's: "error: parts.svg: box 'model': the word 'xxxx...", exit 1, nothing written
$ find <scratch> -name __pycache__   (nothing)
```

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. Frontmatter, the 1006-character description, the Quick start block and the Use instead rows are as before. The round's edits to `SKILL.md` leave the section order unchanged.
- 2: holds. `references/kinds.md` is intact. The splits keep what each bullet says, and the new "Offline" bullet says the same as the head comment.
- 3: holds. Steps 3 and 5 are unchanged in effect.
- 4: holds. Steps 6 and `kinds.md` "The README" give the core's order, and the split of "Its own sections" and "Their place" keeps the rule.
- 5: holds. Steps 6 and 8 are as before. The split bullets keep their meaning.
- 6: holds. Ruling 3 closes Behaviour 1. Steps 7 now has three bullets, and the second copies `<scratch>/utils/figures.py` from the repository's own copy when the user kept it at the first stop, and from `templates/figures.py` otherwise. Steps 9 skips copying "a copy the user kept". The drafts stop and the commit therefore use the same engine. The diagram runs above reproduce the root from `__file__`, `repr`, the error and no `__pycache__`.
- 7: violated, Spec 1 below. The tab id rule (ruling 2) holds in my runs. The `http`/`https` image is now a link in my runs. A protocol-relative image target still loads from the network.
- 8: holds. `scripts.md` line 20 is the new row, and the `copies` count is 1.
- 9: holds. The glossary is identical to the snapshot. The "Stated in" of `core`, `diagram file`, `documentation index`, `scratch folder`, `one-page manual` and `kind` still point at sections and steps that exist, and no Steps number changed.
- 10: holds. Line 3 of ADR 0058 prints as item 10 asks.
- 11: holds. README counts are 1, 1, 1 and 0, and the tree has 25 skills.
- 12: holds for ordering and commit rules. "Stops" still has five rows, the refusals come before the writes, and the commit names its paths. The one-rule-per-bullet part of the item is not fully met, see Standards 1.
- 13: holds for what the step does, as in the first report.

Cases of the brief's "Cases":

- Description count, Quick start closed and sections in order: met (`1006`, `closed`, the seven headings).
- The C++ library, `docs/manual/install.md`, a differing `utils/figures.py` or `utils/manual.py`, an existing `utils/diagrams.py`, Python 3.9, a refused label, and not a repository or no code: met by reading. The round's edits keep these paths. The differing-figures case is now also consistent between Steps 7 and 9.
- `manual.py` main run: met. The escapes, the `../figures/a.svg` image, the tab link, the `javascript:` text link and the escaped quote are all as the brief asks.
- The page is ASCII and loads nothing from the network: partial. The brief's document gives `0` and an empty grep. A document holding `![p](//evil.example/p.png)` gives `<img src="//evil.example/p.png">`. See Spec 1.
- `/usr/bin/python3` 3.9.6, no document, bad root, missing document, `../outside.md`, non-UTF-8 and another working directory: met.
- Diagram case: met.
- `scripts.md` rows, private names, README lines and ADR 0058 line 3: met.
- Round 1 runs: the three-document run with a link from `README.md` to DESIGN's tab (met), and a badge image written as a link (met).

### Findings

1. Spec: `skills/code/handbook/templates/manual.py:199` and `:264-267`. The line `if raw.startswith(("#", "/")) or not raw: return raw` keeps a target such as `//evil.example/p.png`. In `link_html`, `scheme = SCHEME.match(href)` finds no scheme for it, so the image branch gives `<img src="//evil.example/p.png" alt="p">`.
   - What is wrong: ruling 1 claims the page "loads nothing from the network" and that an image at a remote address is never an `<img>`. My run (`step3-round-review/repo`, `README.md` line `Proto: ![p](//evil.example/p.png)`) gives output line 66 with that `<img>`. The head comment (line 33), `references/kinds.md` ("Offline"), `SKILL.md` Steps 9 and the report all say the page loads nothing. A `http` target, and one in capitals (`HTTPS://`), are handled. The scheme-relative target is not.
   - Failure scenario: a README with `![badge](//img.example.org/b.svg)` gives a `manual.html` that fetches the image when opened over `http` or `https`. A reader of `kinds.md` expects an offline page.
   - Verdict: item 7 violated. The case "loads nothing from the network" is partial. The fix keeps the ruling's intent: write a target that starts with `//` as an image link too, or refuse it as an image.

2. Standards: `skills/code/handbook/SKILL.md` lines 60, 66 and 102. Ruling 4 told the builder to split every bullet found with the same fault, and the report lists the bullets it split under "found in the further reading". Three bullets that join independent rules are still whole, so the report's claim of completeness is not reproduced.
   - Line 60: "A version below 3.10 is a question for the first stop: the engine needs Python 3.10 or later, and the diagrams kind is left out until the user answers that `python3` now is 3.10 or later, which this step reads again."
   - Line 66: "A tool that is not installed is named at the first stop with its install command, and the API pages kind is left out of the run with that reason."
   - Line 102: "Each diagram gets at most three corrections; a diagram still refused after the third is left out of the draft, and the drafts stop shows it with the engine's error."
   - Rule broken: `docs/dev/skill-layout.md`, "Lists and tables": two requirements that can each be broken while the other holds, joined by 'and' or a semicolon, are two bullets.
   - Failure scenario: a later diff of any of these bullets cannot tell which requirement a change dropped. In line 102, a builder can keep the limit of three and drop "shows it with the engine's error". Each of the three has this form, and none changes behaviour.
   - Verdict: none (item 12 is unaffected in behaviour).

3. Proof, Behaviour: none. Ruling 1 for `http`, `https` and `HTTPS` images, ruling 2, ruling 3 and ruling 5 are reproduced by my own runs and by reading. The report's three-document run, the `-2` run and the badge run give the lines it quotes. Nothing was closed by removing a check: the splits of `kinds.md` and `diagrams.md` keep each rule's meaning, no "Steps n" reference moved, and the glossary was not touched. The extra bullet in `SKILL.md` Steps 9 (line 120) restates `manual.py`'s head comment, which ruling 1 asked for, and I raise no finding on it.

### Declined to judge

- How the page renders in a browser, including the CSS `:target` and `:has` tabs. This needs a browser, and the report marks it not verified.
- The `/ordo-help skills` run after the pin, and the user's reading of the text against ADRs 0058 and 0060. The brief carries both (item 13).
- Whether the remaining bullets of `kinds.md` that list two conditions of one rule (lines 63, 69 and 76) and `SKILL.md` Rules bullet 1 are one rule or two. I read them as one rule with its condition and raise no finding.
- `git check-ignore` for Steps 10. It is outside the three git commands I may run.

Reviewer usage: af7bdca8540146551, claude-sonnet-5-5, 136257 tokens, 23 tool uses, 2 min 54 s.

## Closed

Each finding of the run over repair round 1, closed at landing:

- 1 (Spec, an image whose address starts with `//` written as `<img>`): fixed on main. In `link_html` of `templates/manual.py`, an image whose target has the scheme `http` or `https`, or starts with `//`, is written as a link to its address; the head comment, `references/kinds.md` "Offline" and `SKILL.md` Steps 9 name the `//` form. On a scratch repository whose `README.md` holds `![p](//evil.example/p.png)`, `https`, a local image and a `//` text link, the page holds `<a href="//evil.example/p.png">p</a>`, one `<img>` (the local `../figures/a.svg`), and `grep -n -i 'src="//\|src="http'` prints nothing, under `python3` and `/usr/bin/python3` 3.9.6; the reviewer's run before the fix gave `<img src="//evil.example/p.png" alt="p">`.
- 2 (Standards, three bullets of `SKILL.md` each holding two rules): fixed on main. Steps 3's Python bullet and API tool bullet are two bullets each, and Steps 7's corrections bullet is three; no Steps number moved.
- After both fixes: `ruff check --select F,W2` and `ruff check --preview --select E3` print `All checks passed!`, `awk 'length>100'` prints nothing, the description is 1006 characters, and the verify list prints `checks: 16 commands passed`.

