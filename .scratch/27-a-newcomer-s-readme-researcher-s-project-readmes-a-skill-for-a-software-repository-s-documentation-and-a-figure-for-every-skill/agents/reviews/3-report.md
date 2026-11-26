# Report: step 3, the skill `handbook`

Everything in the brief is done. Item 13's user reading against ADRs 0058 and 0060 and the `/ordo-help skills` run after the pin of step 8 are, as the brief says, the orchestrator's open item and a later agent's run; the builder's on-tree check of what that run reads is done (cases 1 and 2 below).

## Open items of the state file

From the worktree's `orchestrator-state.md`, "Open items":

```
None.
```

## The cases' first run

First run on the unchanged tree (base 749f499), before any change. No case turned out wrong under the brief's rules, so there was no hand-back.

| Case | First run on the unchanged tree | After the change |
|---|---|---|
| Description count | `... \| grep handbook` printed nothing, exit 1 | `1006 skills/code/handbook/SKILL.md` |
| Quick start block closed | `awk: can't open file skills/code/handbook/SKILL.md`, exit 2 | `closed` |
| Sections in order | `ugrep: warning: skills/code/handbook/SKILL.md: No such file or directory` | `12:## Quick start`, `18:## Use instead`, `27:## What it reads`, `41:## Steps`, `122:## Stops`, `132:## Anti-patterns`, `143:## Rules` (title and paragraph above line 12; no reference section) |
| Made-up C++ library, "Building" and "Contributing" | Read: no `SKILL.md` to read (`find skills/code/handbook -type f` printed only `skills/code/handbook/templates/figures.py`); unmet | Read: Steps 4 gives `README.md` its existing path and each new kind its `references/kinds.md` path, with a reason for each kind left out ("a small library: no feature map"); Steps 5 shows them and drafts nothing before the confirmation; Steps 6's made-up example keeps "Building" (as the core's build and run) and "Contributing" around the core, each claim with its source file; Rules bullet 1 writes nothing before the Steps 8 approval |
| Made-up `docs/manual/install.md` | Read: no skill; unmet | Read: Steps 4 bullet 1 keeps the existing path; Steps 6 bullet 3 and its second made-up example keep every fact and show where each went |
| Differing `utils/figures.py` and `utils/manual.py` | Read: no skill; unmet | Read: Steps 3 compares each with `cmp -s`; one that differs is a question at the first stop (keep or replace); Steps 9 copies "except a copy the user kept at the first stop"; the Stops row "The kinds" shows both questions |
| Existing `utils/diagrams.py` | Read: no skill; unmet | Read: Steps 7 bullet 2 ("its draft keeps every graph of it, each change marked, and it is never written over unseen"); `references/diagrams.md`, "The rules of the file", last bullet |
| `python3` is 3.9 | Read: no skill; unmet (`/usr/bin/python3 --version` prints `Python 3.9.6`) | Read: Steps 3 bullet 2 names the version the engine needs as a question at the first stop and leaves the diagrams kind out until the user answers that `python3` is 3.10 or later, which Steps 3 reads again |
| Label that does not fit | Read: no skill; unmet | Read: Steps 7 bullets 4 and 5 (error shown, graph corrected, at most three corrections, a diagram still refused left out and shown at the drafts stop with the engine's error); the Stops row "The drafts" shows it. The engine's error on a scratch run is quoted under "Runs" |
| Not a repository, no code | Read: no skill; unmet | Read: Steps 1 bullets 2 and 3; Stops rows "Not a repository" and "No code", each "with nothing read for drafting and nothing written" |
| `manual.py` main run | `ls skills/code/handbook/templates/` printed `figures.py`: no script; unmet | Met, quoted under "Runs" |
| Page is ASCII, no network | No script; unmet | `0`, and the network grep printed nothing (exit 1) |
| Python 3.9.6 | No script; unmet | exit 0 |
| No document, bad root, missing document | No script; unmet | exit 2 with the usage line; exit 1 naming the path; nothing written |
| `../outside.md` | No script; unmet | exit 1 naming the path; nothing written |
| Not UTF-8 | No script; unmet | exit 1 naming the file; nothing written |
| Another working directory | No script; unmet | wrote under the scratch root, nothing in the working directory |
| Diagram file | Not runnable: the engine stands, but the diagram file's form was not on the tree | Met, quoted under "Runs" |
| `scripts.md` rows | `grep -n 'templates/manual.py' docs/dev/scripts.md` printed nothing (exit 1); the `copies` count printed `0` | `20:\| \`skills/code/handbook/templates/manual.py\` \| The script the \`handbook\` skill copies into a documented repository as \`utils/manual.py\`. ...` (the full line is in the file) and `1` |
| Private names | Printed nothing (exit 1) | Printed nothing (`private grep exit: 1`) |
| README lines | `0`, `0`, `0`, `2` | `1`, `1`, `1`, `0` |
| ADR 0058 line 3 | `Status: proposed` | ``Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"`` |

The command of the first run of the description case was run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The table's "after" cell of the `scripts.md` row is cut with "..." only in this table; the row is quoted whole under "Every host- or user-visible change".

## Runs

Scratch repositories under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/step3/`. `e` is `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

The main `manual.py` case, in `step3/repo` (a git repository with `utils/manual.py` copied from the template, `README.md` holding a heading, a paragraph with inline code, bold and italic, a nested list, a numbered list, a table, a fenced block holding `<script>alert(1)</script>`, the line `<p align="center">`, a link to `docs/README.md`, `[x](javascript:alert(1))`, `[q](a"b.md)` and `![A figure](docs/figures/a.svg)`, and `docs/README.md` linking back; no `docs/user/`):

```
$ e python3 utils/manual.py . README.md docs/README.md
wrote docs/user/manual.html (3019 bytes)
exit: 0
$ ls docs/user
manual.html
$ grep -n '<nav>' -A3 docs/user/manual.html
42:<nav>
43-<a href="#-------md">README.md</a>
44-<a href="#docs--------md">docs/README.md</a>
45-</nav>
$ grep -n '<section' docs/user/manual.html
47:<section class="doc" id="-------md">
65:<section class="doc" id="docs--------md">
$ grep -n '&lt;script&gt;' docs/user/manual.html
60:<pre><code>&lt;script&gt;alert(1)&lt;/script&gt;</code></pre>
$ grep -n '&lt;p align=' docs/user/manual.html
61:<p>&lt;p align=&quot;center&quot;&gt;</p>
$ grep -n 'src=' docs/user/manual.html
63:<p><img src="../figures/a.svg" alt="A figure"></p>
$ grep -n 'javascript' docs/user/manual.html
62:<p>See <a href="#docs--------md">the index</a>, [x](javascript:alert(1)) and <a href="../../a&quot;b.md">q</a>.</p>
$ grep -c '<script' docs/user/manual.html
0
$ LC_ALL=C grep -c '[^ -~]' docs/user/manual.html
0
$ grep -n -i 'http://\|https://\|<link\|<script src' docs/user/manual.html; echo "grep exit: $?"
grep exit: 1
```

Line 62 shows the link to `docs/README.md` pointing at its tab, the `javascript:` link as text, and the `"` escaped in its attribute. The doc's back link reads `<p>Back to <a href="#-------md">the README</a>.</p>`.

The other `manual.py` cases, in the same repository, `snap` a checksum over every file outside `.git`:

```
--- 3.9
Python 3.9.6
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
--- one good one bad
error: the document missing.md does not exist
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

The 3.9 line is `e /usr/bin/python3 utils/manual.py . README.md`; "none" is `utils/manual.py .` and `utils/manual.py` with no argument; "absolute" passes `$PWD/README.md`; "other cwd" is `cd step3/elsewhere && e python3 step3/repo/utils/manual.py step3/repo README.md`, after which `step3/elsewhere` holds no entry; the last `find . -name __pycache__` over `step3` printed nothing.

The diagram case, in `step3/diag`: `utils/figures.py` copied from `templates/figures.py`, `utils/diagrams.py` the code block of `references/diagrams.md` with its graph replaced by three boxes and two arrows, the first label written by `repr` as `'Reads "a\\b"'`:

```
$ grep -n "Reads" utils/diagrams.py
71:        Node('parser', 'Reads "a\\b"', 'part'),
$ e python3 utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (3317 bytes)
exit: 0
$ find . -name __pycache__
$ ls docs/user/diagrams; shasum docs/user/diagrams/parts.svg
parts.svg
a31d99a64054431889893323b987895f25c8cb72  docs/user/diagrams/parts.svg
$ grep -o 'Reads[^<]*' docs/user/diagrams/parts.svg
Reads &quot;a\b&quot; (part of the library); Document model (part of the library); Writer (part of the library).">
Reads "a\b" (part of the library); Document model (part of the library); Writer (part of the library).
Reads "a\b"
$ cd step3/elsewhere && e python3 step3/diag/utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (3317 bytes)
exit: 0
$ shasum step3/diag/docs/user/diagrams/parts.svg
a31d99a64054431889893323b987895f25c8cb72  .../step3/diag/docs/user/diagrams/parts.svg
$ ls -A step3/elsewhere | wc -l
       0
$ cd step3 && find . -name __pycache__; echo "find exit $?"
find exit 0
```

The shasum's path is shortened with "..." here only; the command printed the full scratch path.

The form of `references/diagrams.md` as written, in `step3/form`, and the same with a label that does not fit:

```
$ e python3 utils/diagrams.py; echo "exit: $?"
wrote docs/user/diagrams/parts.svg (4200 bytes)
exit: 0
$ e python3 utils/diagrams.py; echo "exit: $?"   (label 'Document model' replaced by 120 x's)
error: parts.svg: box 'model': the word 'xxxx<114 more x>xx' of the label 'xxxx<114 more x>xx' is longer than a line
exit: 1
$ ls docs
ls: docs: No such file or directory
```

## DONE / NOT DONE

| Item or check | State | Command and output |
|---|---|---|
| 1 `SKILL.md` frontmatter, sections, Quick start, Use instead | DONE | description count `1006 skills/code/handbook/SKILL.md`; Quick start `closed`; sections as in the cases table |
| 2 the kinds in `references/kinds.md` with their paths | DONE | `grep -n '^## ' skills/code/handbook/references/kinds.md` prints the nine kinds' sections, lines 19 to 79 |
| 3 the first stop | DONE | Read: Steps 3 to 5 and the Stops row "The kinds" |
| 4 the README's core | DONE | Read: `references/kinds.md`, "The README"; Steps 6 bullet 4 |
| 5 drafts from the code, each claim's source, the drafts stop | DONE | Read: Steps 6 and 8, the Stops row "The drafts" |
| 6 the diagrams | DONE | Diagram case above; Steps 7; `references/diagrams.md` |
| 7 `templates/manual.py` | DONE | The `manual.py` runs above; `ruff check --select F,W2 ...` prints `All checks passed!`; `ruff check --preview --select E3 ...` prints `All checks passed!`; `awk 'length>100' ...` prints nothing |
| 8 `docs/dev/scripts.md` | DONE | `grep -n 'templates/manual.py' docs/dev/scripts.md` prints line 20; the `copies` count prints `1` |
| 9 glossary entries | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`; `git diff docs/glossary.md` adds eleven lines and removes none |
| 10 ADR 0058 Status | DONE | `sed -n 3p docs/adr/0058-*.md` prints the line of item 10 |
| 11 README lines 38, 172, 183 | DONE | `1`, `1`, `1`, `0`; `git diff --numstat` shows `3 3 README.md` |
| 12 layout, stops before writes, counts, commit by path | DONE | Read: Steps 5 and 8 come before Steps 9 and 10; Steps 7 bullet 5 states the count of three; Steps 10 names each path; Rules bullet 1 |
| 13 on-tree check of what `/ordo-help skills` reads | DONE | Quick start `closed`; frontmatter parses (description count printed) |
| Character-set check over the changed files and this report | DONE | the brief's `printf ... \| xargs -0 perl ...; echo "exit: $?"` printed only `exit: 0` |
| No `__pycache__` | DONE | `find skills docs -name __pycache__; echo "find exit: $?"` printed only `find exit: 0` |
| Rule 14 greps | DONE | below |

The rule 14 greps over `skills/`, `utils/`, `docs/` and `README.md`:

- `grep -rln 'handbook'` lists `docs/adr/0058-...`, `docs/adr/0060-...`, `docs/adr/README.md`, `docs/dev/scripts.md`, `docs/figures/academic/researcher/gen_academic_pipeline.py`, `docs/figures/gen_figures.py`, `docs/figures/ordo_kinds.py`, `docs/glossary.md`, `docs/roadmap.md`, `README.md` and the three new skill files. The figure scripts and `ordo_kinds.py` name the engine's path, which is unchanged. `docs/adr/README.md` lines 67 and 69 are the index rows of the two ADRs, with no status column, so 0058's new status needs no change there. `docs/roadmap.md` names the skill in the entry's goal and gate and is not this step's path. `README.md` holds the three lines of item 11; its other mentions are step 6's.
- `grep -rn 'manual\.py'` outside the skill prints `docs/glossary.md:179` (the new entry) and `docs/dev/scripts.md:20` (the new row).
- `grep -rln 'docs/user/'` prints `docs/dev/scripts.md`, `docs/glossary.md` and the four new skill files: every hit is this step's text.
- `grep -rn 'twenty-four\|24 skills\|twenty four'` over the same places, ADRs and roadmap left out, prints nothing.

## The terms

New entries in `docs/glossary.md`, "Ordo's own terms", each in alphabetical order (the section was sorted before the change, and the eleven lines were put in by the same order), each with its "Stated in" checked by `grep -n '^## '` of `references/kinds.md` and `references/diagrams.md` and by `grep -n` of the Steps items in `SKILL.md`:

- **API pages, of `handbook`**: `kinds.md` line 66 `## The API pages`; `SKILL.md` line 81 (Steps 6) and line 114 (Steps 10).
- **core, of a software README**: `kinds.md` line 19 `## The README`; Steps 6 line 80.
- **diagram file, of `handbook`**: `references/diagrams.md`; Steps 7 line 86.
- **documentation index, of `handbook`**: `kinds.md` line 79; Steps 6 line 82.
- **feature map, of `handbook`**: `kinds.md` line 48. It says that the entry **capability map** does not cover it.
- **getting-started guide, of `handbook`**: `kinds.md` line 31.
- **kind, of `handbook`**: `kinds.md`; Steps 4 line 65 and Steps 5 line 69. It says that **kind** and **kind, of an open item** do not cover it.
- **manual page, of `handbook`**: `kinds.md` line 36.
- **one-page manual, of `handbook`**: `kinds.md` line 61; `templates/manual.py` head comment line 3.
- **reference page, of `handbook`**: `kinds.md` line 42.
- **scratch folder, of `handbook`**: Steps 7 and Steps 11, line 119.

Plan terms the new text uses, each read against its entry:

- **stop**: in its sense "any point in a skill's Stops table where it waits on the user", for "The kinds", "The drafts" and "A command that fails".
- **refusal**: "Not a repository" and "No code" end the skill with no decision and leave nothing, as the entry defines.
- **session, the**: "the session drafts each page" (Rules bullet 2), the user's session running the skill.
- **step**: "Steps <n>" and "this step", an item of a skill's Steps.
- **plan skills**: in the Use instead row of `ordo-init`, the skills `ordo-init` sets a repository up for.
- **capability map**: named only in the feature map entry, to keep the two apart.

"Question" is used as a plain word ("a question for the first stop"), not in the sense of **question, the**. "Case" is not used in the skill's text.

## Files

| File | Lines |
|---|---|
| `skills/code/handbook/SKILL.md` | 147, new |
| `skills/code/handbook/references/kinds.md` | 82, new |
| `skills/code/handbook/references/diagrams.md` | 125, new; a further file under `references/` that the brief allows, serving item 6 and decision 2: the form of `utils/diagrams.py` |
| `skills/code/handbook/templates/manual.py` | 505, new |
| `docs/dev/scripts.md` | +2 -1 |
| `docs/glossary.md` | +11 -0, within "Ordo's own terms" |
| `docs/adr/0058-...-the-user-confirms.md` | +1 -1, line 3 |
| `README.md` | +3 -3, lines 38, 172 and 183 |
| this report | new |

`skills/code/handbook/templates/figures.py` is unchanged (`git status --short` lists none of it).

## Judgment calls the brief left open

- **Diagrams drawn before the approval.** Item 6 has the drafts show each `.svg` the diagram file wrote, and item 12 forbids writing a file of the repository before the approval. Steps 7 runs the draft in a scratch folder made with `mktemp -d` outside the repository, which the root-from-`__file__` rule of item 6 makes write under that folder, and Steps 9 runs it again in the repository after the approval. The glossary carries **scratch folder, of `handbook`**.
- **`manual.html` and the API pages are built after the approval.** They are generated from the approved pages, so the drafts stop shows the documentation index with the command and the tab order, and Steps 9 runs the builds.
- **`python3` below 3.9.** Item 3 names only the engine's version. Steps 3 bullet 3 also leaves `manual.html` out below 3.9, as the same question, since item 7 sets 3.9 for `manual.py`; this serves item 3.
- **Tab ids.** Item 7 says each character outside `[a-z0-9]` becomes `-`, and the script does that literally, so upper-case letters become `-` too: `README.md` gets `-------md` and `docs/README.md` gets `docs--------md`. Two documents whose paths differ only in characters outside `[a-z0-9]` (such as `a_b.md` and `a-b.md`) would share an id; the script does not refuse that, since no case asks it and the skill writes the command itself.
- **Tabs without a script.** The tabs work by CSS `:target`, with `:has` for the default tab and the marked tab, so the page holds no `<script>` element at all. By the stylesheet's rules, a browser without `:has` would show the first document above the one a tab opens; no browser was opened to check this, so it is not verified.
- **Remote images.** Items 63 and 68 meet on a document's `http`/`https` image: item 63 keeps such a target, so the browser loads it from its address. The head comment says so; the page's own styles are inline and it loads no file of its own from the network.
- **Links the script leaves as they are.** A target that starts with `#` or `/` is kept as given; a link to a document of the run drops its fragment and points at that document's tab.
- **The commit.** Steps 10 commits after the drafts stop's approval, which shows the message and the paths, and leaves a path git ignores out (checked with `git check-ignore -q`), as `ordo-init` does, since `git add` exits 1 on an ignored path.
- **The API tools table.** `references/kinds.md` names Doxygen, TypeDoc, pdoc and rustdoc with their output settings as examples ("such as"), the session picking the tool the repository already configures first.
- **Feature map path.** The brief gives the folder `docs/user/feature-map/`; the page is `docs/user/feature-map/README.md`. A getting-started guide is `docs/user/guides/getting-started.md`.

## Sentences and list items read against the standards

Each new list item and sentence was read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard's sentence length. The places that depart:

- The two made-up examples of Steps 6 are each one sentence of over 40 words: each walks one whole case, and split they would no longer read as one example.
- The Stops cells of "The kinds" and "The drafts" are long sentences listing what the stop shows; the list is the cell's content, and the Steps items 5 and 8 hold the same content as bullets.
- The `description` is one paragraph by the frontmatter rule, at 1006 characters.

## Every host- or user-visible change

- New skill `/handbook`, with `skills/code/handbook/SKILL.md`, `references/kinds.md`, `references/diagrams.md` and `templates/manual.py`. Before: `skills/code/handbook/` held `templates/figures.py` alone.
- `docs/dev/scripts.md`, the engine's row. Before: "The drawing engine that both figure scripts of this repository import: it lays out ...". After: "The drawing engine that both figure scripts of this repository import, and that the `handbook` skill copies into a documented repository as `utils/figures.py`, beside the diagram file `utils/diagrams.py` it writes there: it lays out ..." (the rest unchanged).
- `docs/dev/scripts.md`, the new row: "| `skills/code/handbook/templates/manual.py` | The script the `handbook` skill copies into a documented repository as `utils/manual.py`. Run as `python3 utils/manual.py <repository root> <document> ...`, it converts each Markdown document given to HTML and writes `docs/user/manual.html`, one page with a tab per document, and reads it back |".
- ADR 0058 line 3. Before: `Status: proposed`. After: ``Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"``.
- `README.md` line 38. Before: "`skills/code/` holds `code-comments`, `diagnose`, `wizard` and `codebase-design`" and "the twenty-four skills". After: "`skills/code/` holds `code-comments`, `diagnose`, `wizard`, `codebase-design` and `handbook`" and "the twenty-five skills".
- `README.md` line 172. Before: `... code/wizard code/codebase-design academic/paper ...`. After: `... code/wizard code/codebase-design code/handbook academic/paper ...`.
- `README.md` line 183. Before: "The loop copies each of the twenty-four skills". After: "The loop copies each of the twenty-five skills".
- `docs/glossary.md`: eleven new entries under "Ordo's own terms", listed under "The terms".

## Anything in the brief that was wrong or impossible

Nothing. The brief's premises held on the tree: `find skills/code/handbook -type f` printed only `templates/figures.py`; `ls skills/*/*/SKILL.md | wc -l` printed `24` before and prints `25` after; `/usr/bin/python3 --version` prints `Python 3.9.6`.
