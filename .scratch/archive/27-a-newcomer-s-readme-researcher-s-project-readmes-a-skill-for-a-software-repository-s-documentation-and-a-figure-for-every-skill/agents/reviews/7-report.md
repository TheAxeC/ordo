# Report: step 7, research-hub's README standard names researcher's layout of ADR 0057

Everything in the brief is done. Item 6, the user's reading of the changed section against ADR 0057, is the step's check and stays open for the landing as the brief says; nothing is committed in research-hub.

## Open items of the state file, verbatim

None.

## The cases' first run (unchanged tree, research-hub at e77501837, Ordo worktree at ada4e20)

- **`git status --short README.md` prints nothing before the change.** `cd /Users/axelfaes/workspace/research-hub && git status --short README.md` printed nothing. The builder went on.
- **`grep -n '^## \|^### ' README.md` prints the same headings after as before.** First run printed 8 lines: `5:## Where things live`, `13:## Regenerating a fresh clone`, `25:## Project layout and tiers`, `59:### The private README.md`, `73:### The manifest`, `77:### The code/ folder`, `106:### Checks before a deposit`, `117:## Conventions` (saved for the comparison after the change).
- **The changed `### The private README.md` against ADR 0057's first two Decision bullets.** Read on the unchanged tree: the section lists seven parts (`# <project>`, `## What it is and why`, `## Results and how to reproduce`, `## Dead-ends (do not retry)`, `## Data`, `## Method and related work`, `## Next`); `## In short`, `## Research questions and claims`, `## Constraints and limits`, `## Papers`, `## Working state` and every `###` sub-section of the layout are missing, and the order differs. Not met on the base, as the step expects.
- **Each rule of the old section in the new one or replaced (coverage list).** Read on the unchanged tree: the old section's lines 61, 63 to 69 and 71 hold the 24 rules listed under "Coverage list" below. No new text yet.
- **Line 85 and line 93 against ADR 0057's fourth Decision bullet.** Read: line 85 names `attic/, results/, figures/, caches and secrets` and not `data/`; line 93 reads `data/              small public inputs only` and says nothing of the deposit. Not met on the base.
- **Line 32 and line 38 against ADR 0057's first two Decision bullets.** Read: line 32 names the old six (`what+why | results+reproduce | dead-ends | data | method+related-work | next`); line 38 names `history/`, `thesis/`, `derivations/` and neither the sections moved out of `README.md` nor the novelty pages. Not met on the base.
- **The bullet `code/README.md` against ADR 0057's third Decision bullet.** Read line 98: it names none of the code README's eight parts; its own rules (root of the deposit, paths relative to `code/`, no `../` path, public-safe, attic in `attic/README.md`) are there. Not met on the base.
- **The tree and the bullet `paper.py` against line 19 and ADR 0053.** `grep -n 'run_all\|paper.py' README.md` printed lines 19, 87, 97, 98 and 109. The tree (lines 82 to 94) has no `run_all.sh` line; line 87 calls `paper.py` "the one entry point"; line 97 says that for a local pipeline `paper.py` "runs everything". Not met on the base.
- **The sentence on `/researcher readme <project folder>`.** Read: absent on the base.
- **`git diff --stat` lists `README.md`; `git status --short` lists the same other files.** First run of `git diff --stat` listed 6 files (`.oculus/notes/session.md`, `projects/active/sandpile-operator/README.md`, `projects/active/sandpile-operator/code/README.md`, `.../code/theory/check_learnability.py`, `projects/active/sandpile-operator/project.yml`, `.../conformal-tensor-factors/project.yml`), `README.md` not among them; `git status --short` printed 11 lines (6 `M`, 5 `??`), saved for the comparison.
- **`LC_ALL=C grep -n '[^ -~]' README.md` prints no line the change added.** First run printed nothing (exit 1): the base file holds no character outside printable ASCII.
- **From the step worktree root, `git status --short` prints only the report.** First run printed nothing.

No case was found that the brief's rules get wrong.

## DONE / NOT DONE

| Item | State | Command or reading, and its output as printed |
|---|---|---|
| 1. `### The private README.md` names researcher's layout, lists its sections in order with `###` sub-sections, keeps the hub's rules and details, says what `/researcher readme` does | DONE | Read lines 59 to 85 against ADR 0057's first two Decision bullets: items 1 to 13 at lines 63 to 75 name `# <project>`, `## In short`, `## What it is and why` (`### The problem`, `### Why it matters`, `### What it does`), `## Research questions and claims`, `## Data`, `## Method` (`### The approach`, `### What is not claimed`), `## Constraints and limits`, `## Related work` (`### The closest prior work`, `### What this project adds`), `## Results and how to reproduce`, `## Papers`, `## Dead ends (do not retry)`, `## Next`, `## Working state` (`### The stage and campaign that stand`, `### Where things live`, `### Cluster facts`), in that order, `## Constraints and limits` right after `## Method`. Line 85 holds the `readme` sentence. |
| 2. Line 32 and line 38 | DONE | Read: line 32 `README.md            the one private human doc, in researcher's layout: in-short \| what+why \| questions+claims \| data \| method \| constraints+limits \| related-work \| results+reproduce \| papers \| dead-ends \| next \| working-state`; line 38 adds `sections moved out of README.md (notes/<slug>.md) \| novelty pages` before `history/`. |
| 3. `### The code/ folder` (lines 93, 99, 101, 102, 108, 112, 113) | DONE | Read: line 93 names the raw inputs of the code README's `## Data`; line 99 names `data/, attic/, results/, figures/, caches and secrets`; line 101 is the new `run_all.sh` line, which rebuilds every result in `results/` from the raw inputs and then runs `paper.py`; line 102 says `paper.py` rebuilds the figures and tables from `results/`; line 108 says `data/` is left out of the deposit; line 112 states that `run_all.sh` rebuilds every result and then runs `paper.py`, so the one documented command rebuilds every number, table and figure, and that `paper.py` alone rebuilds the figures and tables from `results/`; line 113 names the eight parts in order and keeps every rule of the old bullet. |
| 4. Nothing else of `README.md` changes; differences listed | DONE | `git diff --numstat README.md` printed `31<tab>16<tab>README.md`; the whole diff below touches only the brief's ranges. Line 124 (base line 109) is unchanged. Differences listed under "Anything in the brief that was wrong or impossible". |
| 5. The hub's own style | DONE | Verify 2 below prints `0`; each paragraph and item is one line; no `--`, ` - ` aside or em dash in an added line (read in the diff below); no history word in the added text. |
| 6. The user's approval, left open at landing as an open item of kind 5 | Open for the landing, as the brief says | Not a builder action. Nothing committed: `git status --short README.md` prints ` M README.md`. |
| Verify 1: report ASCII check | DONE | from the worktree root, the brief's command printed `exit: 0` and nothing else |
| Verify 2: `git diff -U0 README.md \| grep '^+' \| LC_ALL=C grep -c '[^ -~]'` | DONE | printed `0` |
| Verify 3: `git diff --stat` and `git status --short` | DONE | quoted below |
| Verify 4: list items and sentences read against the standards | DONE | departures listed under "Judgment calls" |
| Case: headings | DONE | `grep -n '^## \|^### ' README.md` after the change printed `5:## Where things live`, `13:## Regenerating a fresh clone`, `25:## Project layout and tiers`, `59:### The private README.md`, `87:### The manifest`, `91:### The code/ folder`, `121:### Checks before a deposit`, `132:## Conventions`; `diff <(cut -d: -f2- headings-before.txt) <(grep -n '^## \|^### ' README.md \| cut -d: -f2-)` printed nothing, exit 0: the same headings, the line numbers after line 59 moved by the added lines. |
| Case: non-ASCII | DONE | `LC_ALL=C grep -n '[^ -~]' README.md` printed nothing, exit 1. |
| Case: other files of the user | DONE | `diff status-before.txt status-after.txt` printed `1a2` / `>  M README.md`: only `README.md` was added to the list. |
| Case: worktree status | DONE | from the worktree root, `git status --short` printed `?? .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/7-report.md` and nothing else |

Verify 3, from `/Users/axelfaes/workspace/research-hub`, `git diff --stat`:

~~~text
 .oculus/notes/session.md                           |  2 -
 README.md                                          | 47 ++++++++++++++--------
 projects/active/sandpile-operator/README.md        |  4 +-
 projects/active/sandpile-operator/code/README.md   |  2 +
 .../code/theory/check_learnability.py              | 29 ++++++-------
 projects/active/sandpile-operator/project.yml      |  6 +--
 .../conformal-tensor-factors/project.yml           |  8 ++--
 7 files changed, 57 insertions(+), 41 deletions(-)
~~~

`git status --short`:

~~~text
 M .oculus/notes/session.md
 M README.md
 M projects/active/sandpile-operator/README.md
 M projects/active/sandpile-operator/code/README.md
 M projects/active/sandpile-operator/code/theory/check_learnability.py
 M projects/active/sandpile-operator/project.yml
 M projects/manuscripts/conformal-tensor-factors/project.yml
?? projects/active/sandpile-operator/code/theory/check_continuum.py
?? projects/active/sandpile-operator/code/theory/check_proofs.py
?? projects/active/sandpile-operator/notes/
?? projects/manuscripts/conformal-tensor-factors/code/results/hpc/refit_ll1_K4L1_n30.json
?? projects/manuscripts/hccnet-revision/code/hpc/wholecohort_tiny.slurm
~~~

The other six files' line counts in `git diff --stat` (2, 4, 2, 29, 6, 8) are the same as in the first run.

## Coverage list of the old section's rules

| # | Rule of the old section (base line) | Where the new text states it, or the layout's rule that replaces it |
|---|---|---|
| 1 | The README is the one private human document (61) | Line 61: "A project's `README.md` is the one private human document" |
| 2 | Written for Axel resuming the project cold (61) | Line 61: "read top to bottom by a newcomer, Axel resuming the project cold among them" (the layout's reader, with the hub's case named, as item 1 asks) |
| 3 | One file read top to bottom (61) | Line 61: "one file read top to bottom" |
| 4 | In the Ward voice of the `CLAUDE.md` "Writing docs" section (61) | Line 61: "in the Ward voice of the `CLAUDE.md` "Writing docs" section" |
| 5 | Private, so dead-ends and private notes go in it freely (61) | Line 61: "It is private, so dead-ends and private notes go in it freely." |
| 6 | Its seven sections, in order (61, 63-69) | Replaced by the layout's title line and twelve sections, lines 61 ("Its title line and sections, in order") and 63 to 75 |
| 7 | Title: one line on what, status, venue, any private-only status note with its example (63) | Line 63, unchanged |
| 8 | What it is and why: the so-what, the framing, the decisions and pivots a cold reader needs (64) | Line 65, after the layout's three `###` headings |
| 9 | Results: each headline number with the file it comes from and the command that regenerates it (65) | Replaced by the layout's rule, line 71: "one `### <result>` per result, with its number, its file under `code/results/`, the command that regenerates it, ... and whether it beats the baseline and reaches what was set as good enough" |
| 10 | Results: the compute it takes (local or HPC, dependencies, seed) (65) | Line 71: "the compute it takes (local or HPC, dependencies, seed)" |
| 11 | Dead-ends: every dead-end with the reason it failed (66) | Replaced by the layout's rule, line 73: "`## Dead ends (do not retry)`: one `### <method>` per dead-end, with its folder in `code/attic/` and the reason it failed" (the layout's heading `Dead ends` replaces `Dead-ends`) |
| 12 | Data: each external dataset with source, version, access, local path, HPC path, cache recipe (67) | Line 67: "one `### <dataset>` per external dataset, with its source, version, access, local path, HPC path, the reason it was chosen, its cache recipe as a code block" |
| 13 | Data: each dataset's registry key (67) | Line 67: "and its registry key" |
| 14 | Method and related work: full sections while the manuscript is absent or provisional (68) | Line 77: "While the manuscript is absent or provisional, `## Method` and `## Related work` are full sections." (the layout's two sections replace the one `## Method and related work`) |
| 15 | Once the manuscript is canonical: a pointer to its Methods and Related Work plus only what the paper does not hold (gotchas of the implementation, the novelty re-check, what is not claimed) (68) | Line 77: "Once the manuscript is the canonical record, each holds a pointer to the manuscript's Methods or Related Work plus only what the paper does not hold (gotchas of the implementation, the novelty re-check, what is not claimed)." |
| 16 | Next: a numbered resume list with the paths, script names and open decisions needed to act without re-deriving anything (69) | Line 74: "a short numbered list of the next actions, each with the paths, script names and open decisions needed to act on it without re-deriving anything; a finished item moves to `## Results and how to reproduce` or to `## Dead ends (do not retry)`" |
| 17 | A section too long to read in one sitting (a large campaign log, a long dead-end list) moves to its own file, linked from `README.md` (71) | Replaced by the layout's rule, line 79: "A section past 200 lines moves to `notes/<slug>.md`, ... and `README.md` keeps the heading with a link to the file." The layout's rule for an empty section is added there: "the line `None yet.`" |
| 18 | No other loose documents are kept: `CONTEXT.md`, `RESULTS.md`, `DATA.md`, `IDEA.md`, `NOVELTY*.md`, `METHOD_NOTES.md`, `RELATED_WORK.md` or an ad-hoc decision note is folded into `README.md` (71) | Line 81, the same list without `NOVELTY*.md`; replaced for novelty pages by the layout's rule: "a novelty page stays a file of `notes/`, linked from `### The closest prior work`" |
| 19 | Folding loses nothing, checked by content: every number, dead-end, command and recipe (as a code block in `## Data`), citation distinction, venue, provenance note and private-only note is found in `README.md` before the old file is deleted and its links repointed (71) | Line 81, the same sentence |
| 20 | A deleted figure is first confirmed byte-identical (`md5`); a moved figure is moved with `git mv` (71) | Line 81, the same sentence |
| 21 | Filler with no content is dropped (71) | Line 81, the same sentence |
| 22 | A private-only note is never replaced by a pointer to a manuscript that does not contain it (71) | Line 81, the same sentence |
| 23 | A project's `README.md` and manifest name no file in another project's folder; they restate the fact or name the other project by its `id` (71) | Line 83, the same sentence |
| 24 | A project's `CLAUDE.md` exists only for agent-specific notes (compute, the one run command, a framing rule), stays short, points at `README.md` and `code/README.md` (71) | Line 83, the same sentence |

The rules of the old bullets of `### The code/ folder` the step rewrote:

| Rule (base line) | Where the new text states it |
|---|---|
| A stranger reproduces each result with one documented command (79) | Line 93, with the raw inputs the code README's `## Data` names added, as item 3 asks |
| `paper.py`: for an HPC pipeline the `hpc/*.slurm` jobs do the heavy compute and `paper.py` assembles the figures and tables from `results/` (97) | Line 112, the same sentence |
| `paper.py`: for a local pipeline it runs everything and writes every figure and table (97) | Replaced, as item 3 and repair round 1 ask, by line 112: "`run_all.sh` rebuilds every result in `results/` from the raw inputs and then runs `paper.py`, so the one documented command rebuilds every number, table and figure; `paper.py` alone rebuilds every figure and table from `results/`." |
| `paper.py` reproduces the headline results of `README.md` before a manuscript exists (97) | Line 112: "Before a manuscript exists, `paper.py` reproduces the headline results of `README.md`." |
| Running `paper.py` never takes a `python -c "import sys; sys.path.insert(...)"` line (97) | Line 112: "Running `paper.py` never takes ..." |
| `code/README.md`: the two-minute reader, with the mapping from each `.slurm` job or `paper.py` output to its table or figure (98) | Line 113, the same sentence |
| Written as the root of the deposit: paths relative to `code/`, no `../` path, nothing above `code/`, only what ships, public-safe (98) | Line 113, the same sentence |
| The attic is documented in `attic/README.md`, which the deposit leaves out (98) | Line 113, the same sentence |

## The diff of research-hub's README.md, whole, as `git diff README.md` prints it

~~~diff
diff --git a/README.md b/README.md
index 64921cc7f..bc65d57fe 100644
--- a/README.md
+++ b/README.md
@@ -29,13 +29,13 @@ The folder a project sits in files it, and the folder name is the manifest's `id
 ```
 projects/active/<id>/   (or projects/manuscripts/<id>/)
   project.yml          manifest (at-a-glance + tags + code_availability + path overrides)
-  README.md            the one private human doc: what+why | results+reproduce | dead-ends | data | method+related-work | next
+  README.md            the one private human doc, in researcher's layout: in-short | what+why | questions+claims | data | method | constraints+limits | related-work | results+reproduce | papers | dead-ends | next | working-state
   CLAUDE.md            optional: thin agent notes (compute | the one run command | framing)
   manuscript/          main.tex | main.pdf | refs.bib | figures/ | supplementary.* (the artifact only)
   reviews/             editorial decisions | reviewer reports | response to reviewers
   admin/               cover letter | submission front matter | editor correspondence | version snapshots
   code/                the self-contained deposit root: README.md + source + the code's generated results/ and figures/
-  notes/               optional records: history/ (dated memos) | thesis/ (originating thesis) | derivations/ (scratch math)
+  notes/               optional records: sections moved out of README.md (notes/<slug>.md) | novelty pages | history/ (dated memos) | thesis/ (originating thesis) | derivations/ (scratch math)
   theory/              optional: formal proofs that build to a PDF
 
 projects/ideas/<id>/        project.yml | README.md
@@ -58,17 +58,31 @@ projects/archive/**/<id>/   project.yml + any real content it has (README.md dea
 
 ### The private README.md
 
-A project's `README.md` is the one private human document, written for Axel resuming the project cold: one file read top to bottom, in the Ward voice of the `CLAUDE.md` "Writing docs" section. It is private, so dead-ends and private notes go in it freely. Its sections, in order:
+A project's `README.md` is the one private human document: one file read top to bottom by a newcomer, Axel resuming the project cold among them, in the Ward voice of the `CLAUDE.md` "Writing docs" section. It is private, so dead-ends and private notes go in it freely. The hub's standard for it is the layout in which `researcher` writes and keeps it: Ordo's ADR 0057 and, in Ordo, `skills/academic/researcher/references/project_layout.md`, section "The README". Its title line and sections, in order:
 
 1. `# <project>`: one line on what it is, the status and the venue, and any private-only status note (for example that a revision was an internal pass, so no peer-review status is claimed).
-2. `## What it is and why`: the so-what, the framing, and the decisions and pivots a cold reader needs.
-3. `## Results and how to reproduce`: each headline number with the file it comes from and the command that regenerates it, plus the compute it takes (local or HPC, dependencies, seed).
-4. `## Dead-ends (do not retry)`: every dead-end with the reason it failed.
-5. `## Data`: each external dataset (source, version, access, local path, HPC path, cache recipe) and its registry key.
-6. `## Method and related work`: full sections while the manuscript is absent or provisional; once the manuscript is the canonical record, a pointer to its Methods and Related Work plus only what the paper does not hold (gotchas of the implementation, the novelty re-check, what is not claimed).
-7. `## Next`: a numbered resume list with the paths, script names and open decisions needed to act without re-deriving anything.
+2. `## In short`: the project in a few sentences.
+3. `## What it is and why`, with `### The problem`, `### Why it matters` (for a method applied to a clinical dataset, its clinical relevance) and `### What it does`: the so-what, the framing, and the decisions and pivots a cold reader needs.
+4. `## Research questions and claims`: each research question, then each claim with the result that would show it, the baseline and the metric.
+5. `## Data`: one `### <dataset>` per external dataset, with its source, version, access, local path, HPC path, the reason it was chosen, its cache recipe as a code block and its registry key.
+6. `## Method`, with `### The approach` (each campaign's method) and `### What is not claimed`.
+7. `## Constraints and limits`: what counts as good enough, the limits on storage, compute, time and access, and the setting (manual or automatic) with its count of methods.
+8. `## Related work`, with `### The closest prior work`, which links the project's novelty pages in `notes/`, and `### What this project adds`.
+9. `## Results and how to reproduce`: one `### <result>` per result, with its number, its file under `code/results/`, the command that regenerates it, the compute it takes (local or HPC, dependencies, seed), and whether it beats the baseline and reaches what was set as good enough.
+10. `## Papers`: each paper's folder with the results it reports.
+11. `## Dead ends (do not retry)`: one `### <method>` per dead-end, with its folder in `code/attic/` and the reason it failed.
+12. `## Next`: a short numbered list of the next actions, each with the paths, script names and open decisions needed to act on it without re-deriving anything; a finished item moves to `## Results and how to reproduce` or to `## Dead ends (do not retry)`.
+13. `## Working state`, with `### The stage and campaign that stand` (the stage that stands, the campaign that stands within Experiments and each job id not yet read), `### Where things live` (each folder of the project, under the project's own name for it) and `### Cluster facts` (the cluster's facts, or the line `No cluster: the jobs run where the session runs.`).
 
-A section too long to read in one sitting (a large campaign log, a long dead-end list) moves to its own file, linked from `README.md`. No other loose documents are kept: a `CONTEXT.md`, `RESULTS.md`, `DATA.md`, `IDEA.md`, `NOVELTY*.md`, `METHOD_NOTES.md`, `RELATED_WORK.md` or ad-hoc decision note is folded into `README.md`. Folding loses nothing, checked by content and not by numbers alone: every number, dead-end, command and recipe (as a code block in `## Data`), citation distinction, venue, provenance note and private-only note is found in `README.md` before the old file is deleted and the links to it are repointed. A deleted figure is first confirmed byte-identical (`md5`) to a copy that stays, and a figure that moves is moved with `git mv`. Filler with no content is dropped rather than carried over. A private-only note is never replaced by a pointer to a manuscript that does not contain it. A project's `README.md` and manifest name no file in another project's folder; they restate the fact or name the other project by its `id`. A project's `CLAUDE.md` exists only when the project has agent-specific notes (compute, the one run command, a framing rule) and stays short, pointing at `README.md` and `code/README.md`.
+While the manuscript is absent or provisional, `## Method` and `## Related work` are full sections. Once the manuscript is the canonical record, each holds a pointer to the manuscript's Methods or Related Work plus only what the paper does not hold (gotchas of the implementation, the novelty re-check, what is not claimed).
+
+A section past 200 lines moves to `notes/<slug>.md`, the slug being its heading in lower case, with each run of characters other than letters and digits written as one `-` and no `-` at either end (`## Dead ends (do not retry)` gives `notes/dead-ends-do-not-retry.md`), and `README.md` keeps the heading with a link to the file. A section with nothing to hold yet keeps its heading and the line `None yet.`
+
+No other loose documents are kept: a `CONTEXT.md`, `RESULTS.md`, `DATA.md`, `IDEA.md`, `METHOD_NOTES.md`, `RELATED_WORK.md` or ad-hoc decision note is folded into `README.md`, and a novelty page stays a file of `notes/`, linked from `### The closest prior work`. Folding loses nothing, checked by content and not by numbers alone: every number, dead-end, command and recipe (as a code block in `## Data`), citation distinction, venue, provenance note and private-only note is found in `README.md` before the old file is deleted and the links to it are repointed. A deleted figure is first confirmed byte-identical (`md5`) to a copy that stays, and a figure that moves is moved with `git mv`. Filler with no content is dropped rather than carried over. A private-only note is never replaced by a pointer to a manuscript that does not contain it.
+
+A project's `README.md` and manifest name no file in another project's folder; they restate the fact or name the other project by its `id`. A project's `CLAUDE.md` exists only when the project has agent-specific notes (compute, the one run command, a framing rule) and stays short, pointing at `README.md` and `code/README.md`.
+
+`/researcher readme <project folder>` brings a project's `README.md`, and the `README.md` and `.depositignore` of its code folder, to `researcher`'s layouts: it drafts each file whole from the file it replaces and the project's files, shows each draft with where each fact of the old text went, and writes the files only after Axel approves the drafts.
 
 ### The manifest
 
@@ -76,26 +90,27 @@ A section too long to read in one sitting (a large campaign log, a long dead-end
 
 ### The code/ folder
 
-`code/` serves two readers: the public deposit, which is `code/` minus what `code/.depositignore` excludes, and Axel's own runnable record of everything, dead-ends included. A stranger with only `code/` reproduces each result with one documented command.
+`code/` serves two readers: the public deposit, which is `code/` minus what `code/.depositignore` excludes, and Axel's own runnable record of everything, dead-ends included. A stranger with only `code/` and the raw inputs that the `## Data` section of `code/README.md` names reproduces each result with one documented command.
 
 ```
 code/
   README.md          the public deposit root
   requirements.txt   the dependencies the code imports
-  .depositignore     attic/, results/, figures/, caches and secrets: tracked in the hub, left out of the deposit
+  .depositignore     data/, attic/, results/, figures/, caches and secrets: tracked in the hub, left out of the deposit
   LICENSE            MIT unless the coauthors agree otherwise
-  paper.py           the one entry point that rebuilds the paper's figures and tables
+  run_all.sh         the one documented command: rebuilds every result in results/ from the raw inputs, then runs paper.py (hpc/run_all.sh where the pipeline is a SLURM dependency graph)
+  paper.py           rebuilds the paper's figures and tables from the results in results/
   core/              the library, where the algorithm lives
   experiments/       the runners that produce the results
   hpc/               the .slurm files, when the project uses the cluster
   results/           generated tables and CSVs (ROOT = code/, never the project root)
   figures/           generated figures
-  data/              small public inputs only
+  data/              small public inputs only, left out of the deposit: a newcomer obtains the raw inputs as the ## Data section of code/README.md says
   attic/             dead-end experiments, each runnable, with attic/README.md indexing them
 ```
 
-- **`paper.py`.** For a local pipeline it runs everything and writes every figure and table. For an HPC pipeline the `hpc/*.slurm` jobs do the heavy compute and `paper.py` assembles the figures and tables from `results/`. Before a manuscript exists, it reproduces the headline results of `README.md`. Running it never takes a `python -c "import sys; sys.path.insert(...)"` line.
-- **`code/README.md`.** A reader knows within two minutes what the project is (a plain summary and the public headline), how `code/` is organised, which `core/` module holds the algorithm, the exact commands that produce the paper's results, and where the outputs land, with the explicit mapping from each `.slurm` job or `paper.py` output to its manuscript table or figure. It is written as the root of the deposit: paths are relative to `code/` (`core/`, never `code/core/`), it has no `../` path and points at nothing above `code/`, it documents only what ships, and it is public-safe (no dead-ends, no null results, no private notes). The attic is documented in `attic/README.md`, which the deposit leaves out.
+- **`run_all.sh` and `paper.py`.** `run_all.sh` rebuilds every result in `results/` from the raw inputs and then runs `paper.py`, so the one documented command rebuilds every number, table and figure; `paper.py` alone rebuilds every figure and table from `results/`. For an HPC pipeline the `hpc/*.slurm` jobs do the heavy compute and `paper.py` assembles the figures and tables from `results/`. Before a manuscript exists, `paper.py` reproduces the headline results of `README.md`. Running `paper.py` never takes a `python -c "import sys; sys.path.insert(...)"` line.
+- **`code/README.md`.** It holds the sections of `researcher`'s code README, in this order: `# <project>: code` with a short introduction (what the code is for and the paper it serves), `## What it computes`, `## Requirements`, `## Data` (each raw input, where it is obtained and where `run_all.sh` reads it), `## Run`, `## What each result comes from`, `## Layout` and `## License and citation`. A reader knows within two minutes what the project is (a plain summary and the public headline), how `code/` is organised, which `core/` module holds the algorithm, the exact commands that produce the paper's results, and where the outputs land, with the explicit mapping from each `.slurm` job or `paper.py` output to its manuscript table or figure. It is written as the root of the deposit: paths are relative to `code/` (`core/`, never `code/core/`), it has no `../` path and points at nothing above `code/`, it documents only what ships, and it is public-safe (no dead-ends, no null results, no private notes). The attic is documented in `attic/README.md`, which the deposit leaves out.
 - **Self-contained.** The whole chain from the raw inputs to every manuscript table lives in `code/`, raw-data preprocessing included; what another project's pipeline does is copied in, never depended on. Every number is reproduced, descriptive tables included, and a table with no script that writes it is a gap to close.
 - **`hpc/` jobs take no arguments.** Paths, model and budget sit in one editable place (a `paths.sh` that every job sources, or constants in a `config.py`), and `hpc/` has one job that runs everything plus one job per table for parallel walltime.
 - **`attic/`.** Each dead-end experiment runs end to end and opens with a header saying what it tried, what it found, how to run it and which `README.md` dead-end it backs.
~~~

## Judgment calls the brief left open

- The bullet labelled **`paper.py`** is labelled **`run_all.sh` and `paper.py`.** at line 112, since it now states what each script rebuilds (item 3).
- The `run_all.sh` line of the tree (line 101) carries line 19's alternative "(hpc/run_all.sh where the pipeline is a SLURM dependency graph)", so the tree and line 19 say the same.
- Item 3 of the list keeps the hub's "the so-what, the framing, and the decisions and pivots a cold reader needs" after the layout's three `###` headings; the brief's list of hub details does not name it, and rule 17 keeps it.
- Item 5 adds the layout's "the reason it was chosen" beside the hub's dataset details, and item 13 gives each `###` of `## Working state` a short phrase from `project_layout.md`, "The README", item 12, as item 1 asks of every section.
- Line 79 states the slug rule of `project_layout.md` in one clause with its example, so a reader of the hub names the `notes/` file without Ordo at hand.
- The old one paragraph at base line 71 is split into the paragraphs at lines 79, 81 and 83, by subject (size, folding, other projects and `CLAUDE.md`), each rule kept as the coverage list shows.
- Verify 4, places that depart from the prose standard's sentence length (about 20 words) and why they keep their form: line 61 (the reader clause and the source sentence, each naming one thing whole), the list items at lines 65, 67, 71, 74 and 75 (each names a section's contents as one list, which the brief asks in a short phrase per section), line 79 (the slug clause with its example), the kept sentences of line 81 and line 83 (carried word for word, rule 17), line 85 (the mode's three actions in order), line 93, and line 113's first sentence (the eight parts in order). Semicolons in added text: line 74 (one, joining the item's two parts as base line 69's list style did), line 83 (carried from base line 71) and line 112 (one, joining what the one command does to what `paper.py` does alone). The hub's "Writing docs" rules hold for every added line: one line per paragraph and item, ASCII only, no dash aside, no em dash.

## User-visible changes, before and after

- Line 32, before: `README.md            the one private human doc: what+why | results+reproduce | dead-ends | data | method+related-work | next`; after: `README.md            the one private human doc, in researcher's layout: in-short | what+why | questions+claims | data | method | constraints+limits | related-work | results+reproduce | papers | dead-ends | next | working-state`.
- Line 38, before: `notes/               optional records: history/ (dated memos) | ...`; after: `notes/               optional records: sections moved out of README.md (notes/<slug>.md) | novelty pages | history/ (dated memos) | ...`.
- `### The private README.md`, before: seven sections for Axel resuming cold, the too-long rule without a threshold, `NOVELTY*.md` folded into `README.md`; after: the layout's title line and twelve sections with their `###` headings, named as researcher's layout with its source, the hub's details beside each, the 200-line rule with `notes/<slug>.md`, `None yet.`, novelty pages kept in `notes/`, and the `/researcher readme` sentence (lines 61 to 85).
- Line 93 (base 79), last sentence, before: "A stranger with only `code/` reproduces each result with one documented command."; after: "A stranger with only `code/` and the raw inputs that the `## Data` section of `code/README.md` names reproduces each result with one documented command."
- Line 99 (base 85): `data/` added to the list of what `.depositignore` leaves out.
- Line 101: new tree line for `run_all.sh`. Line 102 (base 87), before: "the one entry point that rebuilds the paper's figures and tables"; after: "rebuilds the paper's figures and tables from the results in results/".
- Line 108 (base 93), before: "small public inputs only"; after: "small public inputs only, left out of the deposit: a newcomer obtains the raw inputs as the ## Data section of code/README.md says".
- Line 112 (base 97) and line 113 (base 98): as the diff shows.

## Anything in the brief that was wrong or impossible, and each place of item 4

Nothing in the brief was wrong or impossible. The places where the hub's text and researcher's layout still differ after the change, none of them writable by this step:

- `/Users/axelfaes/workspace/research-hub/CLAUDE.md` line 88: `A project carries ONE private `README.md` (what+why / results+reproduce / dead-ends / data / method+related-work / next), ...`. Words that bring it in line: "A project carries ONE private `README.md` in `researcher`'s layout (in-short / what+why / questions+claims / data / method / constraints+limits / related-work / results+reproduce / papers / dead-ends / next / working-state), ...".
- `/Users/axelfaes/workspace/research-hub/.oculus/config.yml` lines 41 to 44, `deposit:` with `default_ignore: [attic/]` at line 43 (the patterns used when a project's code folder has no `.depositignore`). Words that bring it in line: `default_ignore: [data/, attic/, results/, figures/, __pycache__/, '*.pyc', .cache/, .pytest_cache/, .ipynb_checkpoints/, .env, '.env.*', '*.pem', '*.key', secrets/]`, the fourteen lines of `project_layout.md`, "The deposit". This is oculus's configuration, read by the Deposit view; the user decides whether it follows the layout.
- `/Users/axelfaes/workspace/research-hub/README.md` line 124 (base line 109), "Checks before a deposit" item 2: "For a local pipeline, `paper.py` and one experiment driver are run and reproduce the headline numbers of `README.md`". It stays, as item 4 says; the layout's Consolidate runs `run_all.sh` from the raw inputs in a clean copy. Words that would bring it in line: "For a local pipeline, `run_all.sh` is run from the raw inputs in a clean copy of `code/` and reproduces the headline numbers of `README.md`".
- The projects' own `README.md` files: `grep -rl --include=README.md -e '^## Method and related work' -e '^## Dead-ends (do not retry)' projects side-projects | grep -v '/code/' | wc -l` printed `51`, and `grep -rl --include=README.md '^## Working state' projects side-projects | wc -l` printed `0`: no project README is in the layout yet. Each is brought to it by `/researcher readme <project folder>`, which the installed researcher gains only with step 8's pin (`readlink -f ~/.claude/skills/researcher` points into `~/.local/share/ordo-stable/`, per the brief); so the hub's README is best committed after that pin, as item 6 says.
- `/Users/axelfaes/workspace/research-hub/README.md` lines 30 to 39, the project tree of "Project layout and tiers": it has no `logs/` and keeps formal proofs in `theory/` (line 39, `theory/              optional: formal proofs that build to a PDF`), where `project_layout.md`, "The tree", and ADR 0053's default layout have `logs/` (the output and error file of each job, named by the job) and put proofs under `notes/`. Words that would bring it in line: a line `  logs/                the output and error file of each job, named by the job` after the `notes/` line, `proofs` added to the `notes/` line (`notes/               optional records: proofs | sections moved out of README.md (notes/<slug>.md) | novelty pages | history/ (dated memos) | thesis/ (originating thesis) | derivations/ (scratch math)`), and the `theory/` line removed, its proofs moved under `notes/`. The tree is not changed: the folders a project holds are the hub's own convention, for the user to rule on.
- The deposit check at `.oculus/config.yml` line 57 reads the README's `## Data` section, which the layout keeps: no difference.

## Repair round 1

- Ruling 1 (Spec 1, what `run_all.sh` does) is closed by research-hub `README.md` line 101, `  run_all.sh         the one documented command: rebuilds every result in results/ from the raw inputs, then runs paper.py (hpc/run_all.sh where the pipeline is a SLURM dependency graph)`, and line 112, "`run_all.sh` rebuilds every result in `results/` from the raw inputs and then runs `paper.py`, so the one documented command rebuilds every number, table and figure; `paper.py` alone rebuilds every figure and table from `results/`." The rest of each line is as it stood: the `hpc/run_all.sh` alternative of line 101, and the HPC sentence, the headline sentence and the `python -c` rule of line 112.
- Ruling 2 (Spec 1, the project tree) is closed by the new entry for lines 30 to 39 in "Anything in the brief that was wrong or impossible, and each place of item 4" above. The tree is unchanged: `sed -n 30,39p README.md` prints the same ten lines as before this round.
- Checks rerun after the round, from `/Users/axelfaes/workspace/research-hub`:
  - `git status --short README.md` printed ` M README.md`.
  - `git diff -U0 README.md | grep '^+' | LC_ALL=C grep -c '[^ -~]'` printed `0`.
  - `LC_ALL=C grep -n '[^ -~]' README.md` printed nothing, exit 1.
  - `git diff --numstat README.md` printed `31<tab>16<tab>README.md`; `git diff --stat` printed the same seven lines and `7 files changed, 57 insertions(+), 41 deletions(-)` as quoted under Verify 3, and `git status --short` the same twelve lines.
  - `grep -n '^## \|^### ' README.md` printed `5:## Where things live`, `13:## Regenerating a fresh clone`, `25:## Project layout and tiers`, `59:### The private README.md`, `87:### The manifest`, `91:### The code/ folder`, `121:### Checks before a deposit`, `132:## Conventions`, the same as after the build.
  - `grep -n 'run_all\|paper.py' README.md` printed lines 19, 101, 102, 112, 113 and 124.
- Case on the tree and the bullet `paper.py`, reread against line 19, ADR 0053 and `project_layout.md`, "The tree": line 101 names `run_all.sh` as the one documented command that rebuilds every result from the raw inputs and then runs `paper.py`; line 102 and line 112 name `paper.py` as rebuilding the figures and tables from `results/`. Both are named, each with what it rebuilds. Met.
- The report's ASCII check (Verify 1) and the worktree's `git status --short` are quoted below, as run after this round.
  - Verify 1, from the worktree root, printed `exit: 0` and nothing else.
  - `git status --short` from the worktree root printed `?? .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/briefs/7-round-1.md` and `?? .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/7-report.md`. The first is the orchestrator's round brief; the builder wrote only the report.
