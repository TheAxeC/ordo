# Report: step 3, the skill `handbook`

Everything in the brief and in repair round 1 is done. Two parts stay open because the brief carries them elsewhere (item 13): the user's reading of the text against ADRs 0058 and 0060, an open item of kind 5 at landing, and the `/ordo-help skills` run after the pin of step 8, made by a separate agent. What that run reads is checked on the tree (the description count and the Quick start case below).

## Open items of the state file

From the worktree's `orchestrator-state.md`, "Open items":

```
None.
```

## The cases' first run

First run on the unchanged tree (base 749f499), before any change. The brief's rules got two cases wrong in a way the first run could not show, because the script did not exist yet; see "Anything in the brief that was wrong or impossible" and "Repair round 1".

| Case | First run on the unchanged tree | Now |
|---|---|---|
| Description count | `... \| grep handbook` printed nothing, exit 1 | `1006 skills/code/handbook/SKILL.md` |
| Quick start block closed | `awk: can't open file skills/code/handbook/SKILL.md`, exit 2 | `closed` |
| Sections in order | `ugrep: warning: skills/code/handbook/SKILL.md: No such file or directory` | `12:## Quick start`, `18:## Use instead`, `27:## What it reads`, `41:## Steps`, `137:## Stops`, `147:## Anti-patterns`, `158:## Rules` (title and paragraph above line 12; no reference section) |
| Made-up C++ library, "Building" and "Contributing" | Read: no `SKILL.md` to read (`find skills/code/handbook -type f` printed only `skills/code/handbook/templates/figures.py`); unmet | Read: Steps 4 gives `README.md` its existing path and each new kind its `references/kinds.md` path, with a reason for each kind left out ("a small library: no feature map"); Steps 5 shows them and drafts nothing before the confirmation; Steps 6's made-up example keeps "Building" (as the core's build and run) and "Contributing" around the core, each claim with its source file; Rules bullet 1 writes nothing before the Steps 8 approval |
| Made-up `docs/manual/install.md` | Read: no skill; unmet | Read: Steps 4 keeps the existing path; Steps 6 keeps every fact, shows where each went, and its second made-up example is this case |
| Differing `utils/figures.py` and `utils/manual.py` | Read: no skill; unmet | Read: Steps 3 compares each with `cmp -s`; one that differs is a question at the first stop (keep or replace); Steps 7 draws the drafts with the kept engine; Steps 9 copies "except a copy the user kept at the first stop"; the Stops row "The kinds" shows both questions |
| Existing `utils/diagrams.py` | Read: no skill; unmet | Read: Steps 7 ("its draft keeps every graph of it, each change marked"; written over only with the draft approved at Steps 8); `references/diagrams.md`, "The rules of the file", last bullet |
| `python3` is 3.9 | Read: no skill; unmet (`/usr/bin/python3 --version` prints `Python 3.9.6`) | Read: Steps 3 names the version the engine needs as a question at the first stop and leaves the diagrams kind out until the user answers that `python3` is 3.10 or later, which Steps 3 reads again |
| Label that does not fit | Read: no skill; unmet | Read: Steps 7 shows the error, corrects the graph and runs the draft again, at most three corrections, and a diagram still refused is left out and shown at the drafts stop with the engine's error; the Stops row "The drafts" shows it. The engine's error on a scratch run is quoted under "Runs" |
| Not a repository, no code | Read: no skill; unmet | Read: Steps 1; Stops rows "Not a repository" and "No code", each "with nothing read for drafting and nothing written" |
| `manual.py` main run | `ls skills/code/handbook/templates/` printed `figures.py`: no script; unmet | Met, quoted under "Runs" |
| Page is ASCII, no network | No script; unmet | `0`, and the network grep printed nothing (exit 1) |
| Python 3.9.6 | No script; unmet | exit 0 |
| No document, bad root, missing document | No script; unmet | exit 2 with the usage line; exit 1 naming the path; nothing written |
| `../outside.md` | No script; unmet | exit 1 naming the path; nothing written |
| Not UTF-8 | No script; unmet | exit 1 naming the file; nothing written |
| Another working directory | No script; unmet | wrote under the scratch root, nothing in the working directory |
| Diagram file | Not runnable: the engine stands, but the diagram file's form was not on the tree | Met, quoted under "Runs" |
| `scripts.md` rows | `grep -n 'templates/manual.py' docs/dev/scripts.md` printed nothing (exit 1); the `copies` count printed `0` | line 20 printed (quoted whole under "Every host- or user-visible change") and `1` |
| Private names | Printed nothing (exit 1) | Printed nothing (`private grep exit: 1`) |
| README lines | `0`, `0`, `0`, `2` | `1`, `1`, `1`, `0` |
| ADR 0058 line 3 | `Status: proposed` | ``Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"`` |

The first run of the description case was run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Runs

All runs are of the tree after repair round 1. Scratch repositories stand under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/step3/`. `e` is `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

The brief's main `manual.py` case, in `step3/case`. This is a fresh git repository with `utils/manual.py` copied from the template and no `docs/user/`. Its `README.md` holds:

- a heading and a paragraph with inline code, bold and italic;
- a nested list, a numbered list and a table;
- a fenced block holding `<script>alert(1)</script>`, and the line `<p align="center">`;
- a link to `docs/README.md`, `[x](javascript:alert(1))` and `[q](a"b.md)`;
- `![A figure](docs/figures/a.svg)`.

Its `docs/README.md` links back to the README.

```
$ e python3 utils/manual.py . README.md docs/README.md
wrote docs/user/manual.html (3019 bytes)
exit: 0
$ ls docs/user
manual.html
$ grep -n '^<a href="#\|<section' docs/user/manual.html
43:<a href="#readme-md">README.md</a>
44:<a href="#docs-readme-md">docs/README.md</a>
47:<section class="doc" id="readme-md">
65:<section class="doc" id="docs-readme-md">
$ grep -n '&lt;script&gt;\|&lt;p align=\|src=\|javascript' docs/user/manual.html
60:<pre><code>&lt;script&gt;alert(1)&lt;/script&gt;</code></pre>
61:<p>&lt;p align=&quot;center&quot;&gt;</p>
62:<p>See <a href="#docs-readme-md">the index</a>, [x](javascript:alert(1)) and <a href="../../a&quot;b.md">q</a>.</p>
63:<p><img src="../figures/a.svg" alt="A figure"></p>
$ grep -c '<script' docs/user/manual.html
0
$ LC_ALL=C grep -c '[^ -~]' docs/user/manual.html
0
$ grep -n -i 'http://\|https://\|<link\|<script src' docs/user/manual.html; echo "grep exit: $?"
grep exit: 1
```

Line 62 shows three things: the link to `docs/README.md` points at its tab, the `javascript:` link is text, and the `"` is escaped in its attribute.

The other `manual.py` cases, in `step3/case`. `snap` is a checksum over every file outside `.git`:

```
--- 3.9
wrote docs/user/manual.html (2733 bytes)
exit: 0
--- none
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
tree unchanged; docs/user: ls: docs/user: No such file or directory
--- not utf8
error: the document latin.md is not UTF-8
exit: 1
tree unchanged; docs/user: ls: docs/user: No such file or directory
--- absolute
wrote docs/user/manual.html (2733 bytes)
exit: 0
--- other cwd
wrote docs/user/manual.html (2733 bytes)
exit: 0
entries in elsewhere:        0
manual.html
find exit: 0
```

What each labelled run was:

- "3.9" is `e /usr/bin/python3 utils/manual.py . README.md`, and `/usr/bin/python3 --version` printed `Python 3.9.6`.
- "none" is `utils/manual.py .`, then `utils/manual.py` with no argument.
- "absolute" passes `$PWD/README.md`.
- "other cwd" is `cd step3/elsewhere && e python3 step3/case/utils/manual.py step3/case README.md`.
- The last `find . -name __pycache__` over `step3` printed nothing.

The runs of rulings 1 and 2 are under "Repair round 1".

The diagram case, in `step3/diag`. Its `utils/figures.py` is copied from `templates/figures.py`. Its `utils/diagrams.py` is the code block of `references/diagrams.md`, with the graph replaced by three boxes and two arrows and the first label written by `repr` as `'Reads "a\\b"'`:

```
$ grep -n "Reads" utils/diagrams.py
71:        Node('parser', 'Reads "a\\b"', 'part'),
$ e python3 utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (3317 bytes)
exit: 0
$ find . -name __pycache__
$ shasum docs/user/diagrams/parts.svg
a31d99a64054431889893323b987895f25c8cb72  docs/user/diagrams/parts.svg
$ grep -o 'Reads[^<]*' docs/user/diagrams/parts.svg
Reads &quot;a\b&quot; (part of the library); Document model (part of the library); Writer (part of the library).">
Reads "a\b" (part of the library); Document model (part of the library); Writer (part of the library).
Reads "a\b"
$ cd step3/elsewhere && e python3 step3/diag/utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (3317 bytes)
exit: 0
$ shasum step3/diag/docs/user/diagrams/parts.svg
a31d99a64054431889893323b987895f25c8cb72  /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/step3/diag/docs/user/diagrams/parts.svg
$ ls -A step3/elsewhere | wc -l
       0
```

Next, the form of `references/diagrams.md` as written, in `step3/form`, then the same form with the label `'Document model'` replaced by a word of 120 `x`. The command's output went through `sed -E 's/x{100,}/<a word of 120 x>/g'`:

```
$ e python3 utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (4200 bytes)
exit: 0
$ e python3 utils/diagrams.py 2>&1 | sed -E 's/x{100,}/<a word of 120 x>/g'
error: parts.svg: box 'model': the word '<a word of 120 x>' of the label '<a word of 120 x>' is longer than a line
$ ls docs
ls: docs: No such file or directory
$ cd step3 && find . -name __pycache__; echo "find exit: $?"
find exit: 0
```

## DONE / NOT DONE

| Item or check | State | Command and output |
|---|---|---|
| 1 `SKILL.md` frontmatter, sections, Quick start, Use instead | DONE | description count `1006 skills/code/handbook/SKILL.md`; Quick start `closed`; sections as in the cases table |
| 2 the kinds in `references/kinds.md` with their paths | DONE | `grep -n '^## ' skills/code/handbook/references/kinds.md` prints the nine kinds' sections, lines 19 to 86 |
| 3 the first stop | DONE | Read: Steps 3 to 5 and the Stops row "The kinds" |
| 4 the README's core | DONE | Read: `references/kinds.md`, "The README"; Steps 6 |
| 5 drafts from the code, each claim's source, the drafts stop | DONE | Read: Steps 6 and 8, the Stops row "The drafts" |
| 6 the diagrams | DONE | Diagram case above; Steps 7; `references/diagrams.md` |
| 7 `templates/manual.py` | DONE | The `manual.py` runs above and under "Repair round 1"; `ruff check --select F,W2 skills/code/handbook/templates/manual.py` prints `All checks passed!`; `ruff check --preview --select E3 skills/code/handbook/templates/manual.py` prints `All checks passed!`; `awk 'length>100' skills/code/handbook/templates/manual.py` prints nothing |
| 8 `docs/dev/scripts.md` | DONE | `grep -n 'templates/manual.py' docs/dev/scripts.md` prints line 20; `grep -n 'figures.py' docs/dev/scripts.md \| grep -c 'copies'` prints `1` |
| 9 glossary entries | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`; `git diff docs/glossary.md` adds eleven lines and removes none |
| 10 ADR 0058 Status | DONE | `sed -n 3p docs/adr/0058-*.md` prints the line of item 10 |
| 11 README lines 38, 172, 183 | DONE | `1`, `1`, `1`, `0`; `git diff --numstat` shows `3 3 README.md` |
| 12 layout, stops before writes, counts, commit by path | DONE | Read: Steps 5 and 8 come before Steps 9 and 10; Steps 7 states the count of three; Steps 10 names each path; Rules bullet 1; one rule per bullet after repair round 1, ruling 4 |
| 13 on-tree check of what `/ordo-help skills` reads | DONE | Quick start `closed`; frontmatter parses (description count printed) |
| Character-set check over the changed files and this report | DONE | the brief's `printf '%s\0' ... \| xargs -0 perl -CSD -ne '...'; echo "exit: $?"` printed only `exit: 0` |
| No `__pycache__` | DONE | `find skills docs -name __pycache__; echo "find exit: $?"` printed only `find exit: 0` |
| Rule 14 greps | DONE | below |

The rule 14 greps over `skills/`, `utils/`, `docs/` and `README.md`:

- `grep -rln 'handbook'` lists 13 files:
  - `docs/adr/0058-...`, `docs/adr/0060-...`, `docs/adr/README.md`, `docs/dev/scripts.md`, `docs/glossary.md`, `docs/roadmap.md` and `README.md`;
  - `docs/figures/academic/researcher/gen_academic_pipeline.py`, `docs/figures/gen_figures.py` and `docs/figures/ordo_kinds.py`;
  - the three new skill files.
- Why the `handbook` hits outside this step need no change:
  - The figure scripts and `ordo_kinds.py` name the engine's path, which is unchanged.
  - `docs/adr/README.md` lines 67 and 69 are the index rows of the two ADRs. The index has no status column, so 0058's new status needs no change there.
  - `docs/roadmap.md` names the skill in the entry's goal and gate, and is not a path of this step.
  - `README.md` holds the three lines of item 11; its other mentions are step 6's.
- `grep -rn 'manual\.py'` outside the skill prints `docs/glossary.md:179` (the new entry) and `docs/dev/scripts.md:20` (the new row).
- `grep -rln 'docs/user/'` prints `docs/dev/scripts.md`, `docs/glossary.md` and the four new skill files: every hit is this step's text.
- `grep -rn 'twenty-four\|24 skills\|twenty four'` over the same places, ADRs and roadmap left out, prints nothing.

## The terms

The new entries stand in `docs/glossary.md`, "Ordo's own terms", in alphabetical order: the section was sorted before the change, and the eleven lines were put in by the same order. Each entry's "Stated in" was checked by `grep -n '^## '` of `references/kinds.md` and `references/diagrams.md`, and by `grep -n` of the Steps items in `SKILL.md` (lines as they stand after repair round 1):

- **API pages, of `handbook`**: `kinds.md` line 71 `## The API pages`; Steps 6 at `SKILL.md` line 87 and Steps 10 at line 129.
- **core, of a software README**: `kinds.md` line 19 `## The README`; Steps 6 at line 85.
- **diagram file, of `handbook`**: `references/diagrams.md`; Steps 7 at line 93.
- **documentation index, of `handbook`**: `kinds.md` line 86; Steps 6 at line 89.
- **feature map, of `handbook`**: `kinds.md` line 51. It says that the entry **capability map** does not cover it.
- **getting-started guide, of `handbook`**: `kinds.md` line 32.
- **kind, of `handbook`**: `kinds.md`; Steps 4 at line 68 and Steps 5 at line 73. It says that **kind** and **kind, of an open item** do not cover it.
- **manual page, of `handbook`**: `kinds.md` line 38.
- **one-page manual, of `handbook`**: `kinds.md` line 65; the head comment of `templates/manual.py`.
- **reference page, of `handbook`**: `kinds.md` line 44.
- **scratch folder, of `handbook`**: Steps 7 at line 93, and Steps 11 at line 134.

Each plan term the new text uses was read against its entry:

- **stop**: used in the sense "any point in a skill's Stops table where it waits on the user", for "The kinds", "The drafts" and "A command that fails".
- **refusal**: "Not a repository" and "No code" end the skill with no decision and leave nothing, as the entry defines.
- **session, the**: "the session drafts each page" (Rules bullet 2), the user's session running the skill.
- **step**: "Steps <n>" and "this step", an item of a skill's Steps.
- **plan skills**: in the Use instead row of `ordo-init`, the skills `ordo-init` sets a repository up for.
- **capability map**: named only in the feature map entry, to keep the two apart.

"Question" is used as a plain word ("a question for the first stop"), not in the sense of **question, the**. "Case" does not appear in the skill's text.

## Files

| File | Lines |
|---|---|
| `skills/code/handbook/SKILL.md` | 163, new |
| `skills/code/handbook/references/kinds.md` | 89, new |
| `skills/code/handbook/references/diagrams.md` | 126, new. The brief allows a further file under `references/`; this one serves item 6 and decision 2, the form of `utils/diagrams.py` |
| `skills/code/handbook/templates/manual.py` | 520, new |
| `docs/dev/scripts.md` | +2 -1 |
| `docs/glossary.md` | +11 -0, within "Ordo's own terms" |
| `docs/adr/0058-...-the-user-confirms.md` | +1 -1, line 3 |
| `README.md` | +3 -3, lines 38, 172 and 183 |
| this report | new |

`skills/code/handbook/templates/figures.py` is unchanged: `git status --short` lists none of it.

## Judgment calls the brief left open

- **Diagrams drawn before the approval.** Item 6 has the drafts show each `.svg` the diagram file wrote, and item 12 forbids writing a file of the repository before the approval.
  - Steps 7 runs the draft in a scratch folder made with `mktemp -d` outside the repository. The root-from-`__file__` rule of item 6 makes the file write under that folder.
  - The scratch folder holds the engine the run will use (ruling 3).
  - Steps 9 runs the diagram file again in the repository after the approval.
  - The glossary carries **scratch folder, of `handbook`**.
- **`manual.html` and the API pages are built after the approval.** They are generated from the approved pages. The drafts stop shows the documentation index with the command and the tab order, and Steps 9 runs the builds.
- **`python3` below 3.9.** Item 3 names only the engine's version. Steps 3 also leaves `manual.html` out below 3.9, as the same question, since item 7 sets 3.9 for `manual.py`. This serves item 3.
- **Tabs without a script.** The tabs work by CSS `:target`, with `:has` for the default tab and the marked tab, so the page holds no `<script>` element at all. By the stylesheet's rules, a browser without `:has` would show the first document above the one a tab opens. No browser was opened to check this, so it is not verified.
- **Links the script leaves as they are.** A target that starts with `#` or `/` is kept as given. A link to a document of the run drops its fragment and points at that document's tab.
- **The commit.** Steps 10 commits after the approval at the drafts stop, which shows the message and the paths. It leaves out a path git ignores (checked with `git check-ignore -q`), as `ordo-init` does, since `git add` exits 1 on an ignored path.
- **The API tools table.** `references/kinds.md` names Doxygen, TypeDoc, pdoc and rustdoc with their output settings as examples ("such as"). The session picks first the tool the repository already configures.
- **Feature map and guide paths.** The brief gives the folder `docs/user/feature-map/`; the page is `docs/user/feature-map/README.md`. A getting-started guide is `docs/user/guides/getting-started.md`.

## Sentences and list items read against the standards

Each new list item and sentence was read against `docs/dev/skill-layout.md`, "Lists and tables", and against the prose standard's sentence length. The places that depart:

- The two made-up examples of Steps 6 are each one sentence of over 40 words. Each walks one whole case, and split they would no longer read as one example.
- The Stops cells of "The kinds" and "The drafts" are long sentences that list what the stop shows. The list is the cell's content, and Steps 5 and 8 hold the same content as bullets.
- Steps 7's bullet on the engine in the scratch folder is one sentence of over 40 words, since the two sources of the engine and the reason are one rule.
- The `description` is one paragraph, as the frontmatter rule requires, at 1006 characters.

## Every host- or user-visible change

- **The new skill.** `/handbook`, with `skills/code/handbook/SKILL.md`, `references/kinds.md`, `references/diagrams.md` and `templates/manual.py`. Before: `skills/code/handbook/` held `templates/figures.py` alone.
- **The engine's row in `docs/dev/scripts.md`.**
  - Before: "The drawing engine that both figure scripts of this repository import: it lays out boxes and arrows, ...".
  - After: "The drawing engine that both figure scripts of this repository import, and that the `handbook` skill copies into a documented repository as `utils/figures.py`, beside the diagram file `utils/diagrams.py` it writes there: it lays out boxes and arrows, ...". The rest of the row is unchanged.
- **The new row of `docs/dev/scripts.md`**: "| `skills/code/handbook/templates/manual.py` | The script the `handbook` skill copies into a documented repository as `utils/manual.py`. Run as `python3 utils/manual.py <repository root> <document> ...`, it converts each Markdown document given to HTML and writes `docs/user/manual.html`, one page with a tab per document, and reads it back |".
- **ADR 0058 line 3.** Before: `Status: proposed`. After: ``Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"``.
- **`README.md` line 38.**
  - Before: "`skills/code/` holds `code-comments`, `diagnose`, `wizard` and `codebase-design`" and "the twenty-four skills".
  - After: "`skills/code/` holds `code-comments`, `diagnose`, `wizard`, `codebase-design` and `handbook`" and "the twenty-five skills".
- **`README.md` line 172.** Before: `... code/wizard code/codebase-design academic/paper ...`. After: `... code/wizard code/codebase-design code/handbook academic/paper ...`.
- **`README.md` line 183.** Before: "The loop copies each of the twenty-four skills". After: "The loop copies each of the twenty-five skills".
- **`docs/glossary.md`.** Eleven new entries under "Ordo's own terms", listed under "The terms".

## Anything in the brief that was wrong or impossible

Two points of item 7 were wrong. The orchestrator ruled on both in repair round 1.

- **Item 7's two bullets on images conflict.** The bullet "A link or image target whose scheme is not `http`, `https` or `mailto` ... is written as text" keeps an `http`/`https` image as an image. The bullet "loads nothing from the network" forbids the fetch that this causes.
  - The script before the round kept the image. Ruling 1 writes such an image as a link.
  - The run that shows the conflict and its end is under "Repair round 1", ruling 1. A README with `![build status](https://img.shields.io/badge/x.svg)` now gives `<a href="https://img.shields.io/badge/x.svg">build status</a>` and no `<img src="http`.
- **Item 7's id rule collides for upper-case names.** The rule was "the path with each character outside `[a-z0-9]` written as `-`". Upper-case letters are outside that set, so `README.md` and `DESIGN.md` both gave `-------md`: two tabs with one id, and no way to show the second.
  - The first build gave `README.md` the id `-------md` and `docs/README.md` the id `docs--------md`.
  - Ruling 2 lower-cases the path and adds a number to a later id that still matches.
  - The run with `README.md`, `DESIGN.md` and `docs/README.md` is under "Repair round 1", ruling 2.

The brief's premises held on the tree:

- `find skills/code/handbook -type f` printed only `templates/figures.py`.
- `ls skills/*/*/SKILL.md | wc -l` printed `24` before the change and prints `25` after it.
- `/usr/bin/python3 --version` prints `Python 3.9.6`.

## Repair round 1

The round's brief is `agents/briefs/3-round-1.md`, answering the findings of `agents/reviews/3-refuter.md`. Each ruling is listed with the lines that close it and the runs that show it.

### Ruling 1, remote images

- **`templates/manual.py`, the constant.** `REMOTE_SCHEMES = ("http", "https")`.
- **`templates/manual.py`, `link_html`.** An image whose scheme is in `REMOTE_SCHEMES` returns `<a href="{escape(href)}">{escape(words or href)}</a>`, and never `<img>`. A link with `http`, `https` or `mailto` stays a link, as before.
- **The head comment.**
  - "An image whose scheme is http or https is written as a link to its address, with its alt text, or the address when the alt text is empty, as the link's text, and never as an image."
  - "The page carries its styles inline, holds no script and loads nothing from the network." This takes the place of "loads no file of its own from the network".
- **`references/kinds.md`, "A one-page manual.html".** A new bullet: "**Offline.** The page loads nothing from the network: its styles are inline, it holds no script, and an image at an `http` or `https` address is written as a link to that address, with its alt text as the link's text."
- **`SKILL.md` Steps 9.** A new bullet after the `manual.py` run: "The page loads nothing from the network: an image at an `http` or `https` address is written as a link to that address, as `templates/manual.py`'s head comment says."
- **The run.** In `step3/repo`, whose `README.md` adds the line "A badge: `![build status](https://img.shields.io/badge/x.svg)`, an empty one: `![](https://example.org/b.png)`, and `[the site](https://example.org)`":

```
$ e python3 utils/manual.py . README.md docs/README.md
wrote docs/user/manual.html (3280 bytes)
exit: 0
$ grep -n 'shields\|example.org' docs/user/manual.html
64:<p>A badge: <a href="https://img.shields.io/badge/x.svg">build status</a>, an empty one: <a href="https://example.org/b.png">https://example.org/b.png</a>, and <a href="https://example.org">the site</a>.</p>
$ grep -c '<img' docs/user/manual.html
1
$ grep -n -i '<link\|<script src\|src="http' docs/user/manual.html; echo "src/link grep exit: $?"
src/link grep exit: 1
```

The one `<img>` left is the local `../figures/a.svg`.

### Ruling 2, tab ids

- **`templates/manual.py`, `tab_id(label, taken)`.**
  - It computes `re.sub(r"[^a-z0-9]+", "-", label.lower()).strip("-")`.
  - A later id that equals one already taken gets `-2`, `-3` and so on: the first number that makes it differ.
  - `read_documents` passes one set `taken` through the documents in tab order.
- **Links.** Links follow the ids by the unchanged `place.tabs` map from each document's path to its id.
- **The head comment.** It states the rule: "Its id is that path in lower case, with each run of characters outside a-z and 0-9 written as one "-" and no "-" at either end, ... When a later document's id equals an earlier one's, it gets "-2", "-3" and so on after it, the first number that makes it differ."
- **The runs**, in `step3/repo`, the second run with two paths that give one id:

```
$ e python3 utils/manual.py . README.md DESIGN.md docs/README.md
wrote docs/user/manual.html (3534 bytes)
exit: 0
$ grep -n '<section\|^<a href="#' docs/user/manual.html
44:<a href="#readme-md">README.md</a>
45:<a href="#design-md">DESIGN.md</a>
46:<a href="#docs-readme-md">docs/README.md</a>
49:<section class="doc" id="readme-md">
69:<section class="doc" id="design-md">
73:<section class="doc" id="docs-readme-md">
$ grep -n 'the design\|Back to' docs/user/manual.html
67:<p>See <a href="#design-md">the design</a>.</p>
71:<p>Back to <a href="#readme-md">the README</a>.</p>
75:<p>Back to <a href="#readme-md">the README</a>.</p>
$ e python3 utils/manual.py . x/a_b.md x/a-b.md README.md
wrote docs/user/manual.html (3396 bytes)
exit: 0
$ grep -n '<section' docs/user/manual.html
49:<section class="doc" id="x-a-b-md">
52:<section class="doc" id="x-a-b-md-2">
55:<section class="doc" id="readme-md">
```

Line 67 is the link from `README.md` to `DESIGN.md`, and it points at DESIGN's tab.

### Ruling 3, the engine that draws the drafts

`SKILL.md` Steps 7 now has three bullets in place of the one that copied the template:

- "Make a scratch folder outside the repository with `mktemp -d`."
- "Copy into it, as `<scratch>/utils/figures.py`, the engine the run will use: the repository's own `utils/figures.py` when the user kept it at the first stop, and `templates/figures.py` otherwise, so the `.svg` the drafts stop shows is drawn by the engine that draws the committed one."
- "Write the draft into it as `<scratch>/utils/diagrams.py`, and run `python3 <scratch>/utils/diagrams.py`, which writes each `.svg` under `<scratch>/docs/user/diagrams/`."

### Ruling 4, one rule per bullet

Each bullet below now stands as two or three, one rule each.

**`SKILL.md`, the two the ruling names:**

- Steps 8, last bullet: "A draft the user corrects is shown again with the corrections." and "Each answer to a question goes into the section that holds the question."
- Steps 1, bullet 3: "List the tracked files with `git -C <root> ls-files`." and "A list that holds no source file is the refusal "No code"."

**`SKILL.md`, found in the further reading:**

- Steps 1, bullet 1: the repository root, and "Write every path of the run relative to the repository root."
- Steps 2, the page that belongs to no kind: naming it, and putting its facts into the page of the kind that holds them.
- Steps 4, bullet 1: "Give each kind the repository gets its pages." and "Give each page its path: ...".
- Steps 6, the page that exists: bringing it up to date with every fact kept, and showing where each fact went.
- Steps 6, the README: its core in order, and keeping each of its own sections, placed around the core.
- Steps 6, the API tool: its configuration, and "Leave the pages the API tool builds out of the drafts, since they are build output."
- Steps 7, the existing `utils/diagrams.py`: its draft keeps every graph, and it is written over only with the draft approved at Steps 8.
- Steps 7, the refused diagram: showing its error, and correcting its graph before the draft runs again.
- Steps 7, the scratch folder: making it, copying the engine and running the draft, as ruling 3 gives.
- Steps 10, bullet 1: running `check-ignore`, leaving an ignored path out of the commit, and naming it in the last message.
- Rules, bullet 3: "The skill commits only the files Steps 9 wrote." and "The skill leaves the push to the user."

**`references/kinds.md`:**

- "The README": "Its own sections." and "Their place."
- "A getting-started guide": "What it holds." and "Its commands."
- "Reference pages": "Not the API pages." and "The link to the API pages."
- "Diagrams": "What they hold." and "Where they are shown."
- "The API pages": "What they hold.", "What the skill writes." and "Build output."

**`references/diagrams.md`:**

- The ASCII label: "Each label is ASCII, ..." and "The draft names each label changed to ASCII."

`git diff --no-index` against copies of the three files taken before the round shows:

- `SKILL.md`: `1 file changed, 29 insertions(+), 13 deletions(-)`;
- `kinds.md`: 19 changed lines;
- `diagrams.md`: 5 changed lines.

The Steps numbering is unchanged, so every "Steps <n>" reference and every "Stated in" of the glossary still holds.

### Ruling 5, the report

"Anything in the brief that was wrong or impossible" names both points, each with its run.

### Checks rerun after the round

- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- The description count printed `1006 skills/code/handbook/SKILL.md`; the Quick start case printed `closed`.
- Both ruff checks printed `All checks passed!`; `awk 'length>100'` printed nothing.
- `find skills docs -name __pycache__; echo "find exit: $?"` printed only `find exit: 0`.
- The private-name grep printed nothing (`private grep exit: 1`).
- The `scripts.md`, README and ADR greps printed as in the cases table.
- The character-set check over the changed files and this report printed only `exit: 0`.
- Every `manual.py` case and the diagram case, under "Runs", were rerun on the changed tree.
