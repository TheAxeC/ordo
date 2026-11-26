# Refutation of step 10

# Step 10 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-10, base eb17dd9)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

$ printf '%s\0' <the ten paths of Verify 1> | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0

$ git grep -n -e '^data/$' -e '^results/$' -e '^figures/$' -e '^attic/$' -- skills/academic/researcher/; echo "grep exit: $?"
grep exit: 1

$ sed -n '/^## The deposit/,/^## A README/p' skills/academic/researcher/references/project_layout.md | grep -c -x -e '/data/' -e '/attic/' -e '/results/' -e '/figures/' -e 'secrets/'
9

$ python3 docs/figures/gen_figures.py; echo "exit: $?"; git status --short docs/figures
wrote docs/figures/orchestration/pipeline.svg (23884 bytes)
... (43 "wrote" lines, the last: wrote docs/figures/ordo/session-retro.svg (11029 bytes))
wrote docs/figures/code/handbook.svg (18924 bytes)
exit: 0
 M docs/figures/code/handbook.svg
 M docs/figures/gen_figures.py

$ python3 -c 'import glob,yaml; [print(len(...)) ...]' | grep -e handbook -e researcher
1015 skills/academic/researcher/SKILL.md
1021 skills/code/handbook/SKILL.md
(base, by git show eb17dd9:skills/code/handbook/SKILL.md through the same parse: 1006)

The report's quoted commands:
$ sed -n '/^## The deposit/,/^- `\/attic/p' skills/academic/researcher/references/project_layout.md | grep -c -x -e '/data/' -e '/attic/' -e '/results/' -e '/figures/' -e 'secrets/'
5
$ diff <(git show eb17dd9:.../project_layout.md | sed -n 84,99p) <(sed -n 84,99p .../project_layout.md)
2,5c2,5 (data/ attic/ results/ figures/ -> /data/ /attic/ /results/ /figures/; no other line differs)
$ git grep -n depositignore -- skills docs README.md
hits at researcher/SKILL.md 10, 80, 273, 281, 421, 444, 446, 447, 460, 731; project_layout.md 21, 82, 104, 107, 109, 119; ADR 0053 line 20; ADR 0057 line 14 (as the report lists, with 447 and the new bullets changed)
$ grep -n 'Steps [0-9]' skills/code/handbook/SKILL.md, and grep -rn 'Steps [0-9]' over skills/code/handbook, docs/glossary.md, ADRs 0058 and 0060
every reference to the old 8 to 11 reads 9 to 12; kinds.md (Steps 3) and diagrams.md (Steps 7) name unchanged steps; glossary Stated-in lines: API pages "Steps 6 and 11", scratch folder "Steps 7, 8 and 12"; no page outside handbook's folder and the glossary names a handbook step
$ tail -1 docs/adr/README.md
| [0061](0061-handbook-checks-...-on-a-copy.md) | handbook checks the files it writes with the repository's own format and lint commands, on a copy |
```

The count of 9 against the brief's 5: the `sed` range also covers the made-up example that item 2 puts in the same section. Its draft holds `/data/`, `/attic/`, `/figures/` and `secrets/`. Over the list alone the count is 5, as the report says. The brief's expected value is wrong, and the diff has no defect here. Verify 3's "lists only handbook.svg" cannot hold as written, because item 7 changes `docs/figures/gen_figures.py`, which is under `docs/figures`. Only one figure changed.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The four folder lines are anchored and every other line of the list is unchanged (the diff of lines 84 to 99 above). The bullets spell `/attic/`, `/results/`, `/figures/` and `/data/`, and the bullet "The four folder lines start with `/`, ..." says why. `secrets/` stays unanchored, and its bullet says "at any depth".
- 2: holds. The rule is written once, in "The deposit", in place of old line 108, with each part of the brief's rule as its own bullet. Readme item 3 (SKILL.md line 447) names the section and states no rule of its own. The made-up example is correct under its own rule: the list less `/results/` is 13 lines, all 13 are added under one comment line directly above `!results/model.pt`, and both of the file's own lines are kept in order.
- 3: holds. SKILL.md line 273 is unchanged, and project_layout.md line 107 ("research" item 3 writes these lines) stays true.
- 4: holds. kinds.md "A feature map" has `untested` between `works` and `partial`, and `partial` reads as the brief asks. Glossary line 167 names the four statuses.
- 5: holds. New Steps 8 has the commands, the first stop, the copy, the baseline, the run's files, what is acted on with the three-round cap, the drafts stop, the approval and the removal (Steps 10 and 12). The Rules bullet names the copy. Steps 9 to 12, the Stops, the Anti-patterns and the glossary lines 148 and 191 are renumbered. The description (1021 characters) and the introduction name the drafted exclusion. See Behaviour 1 and Spec 2 and 3 for the gaps in the new text.
- 6: violated, Spec 1. ADR 0061 has its context, decision, alternatives and consequences, and its row is in `docs/adr/README.md`. Nowhere does it record itself as a refinement of 0058.
- 7: holds. `handbook()` gains `CK` of kind `step` with the brief's wording. The edges are D to CK, G to CK and CK to SD in place of D to SD and G to SD, plus the return "a failure in a file of the run: corrected, at most 3 times". The figure script exits 0 and changes only `code/handbook.svg`. The head comment's line "code/wizard.svg, code/handbook.svg: the steps and stops of each skill" stays true.
- 8: holds. I reran the greps of `depositignore`, of the folder lines, of the statuses and of `Steps [0-9]` across `skills/`, `docs/` and `README.md`. No sentence the step makes false is left. ADR 0057 line 14 names the folders in prose and stays true. `docs/roadmap.md` holds no affected clause.

Cases of the brief's "Cases":

- engram's file: met. I read the 16 lines in `agents/runs/8-engram/drafts/code/.depositignore` against the rule. `/data/` stripped is `data`, so it is had. `__pycache__/` and `.pytest_cache/` are exact lines. The 11 lines the case names are added at the end, since the file has no `!` line, and `/data/` is named as the line that has the folder.
- linfoot's file: met. Reading `agents/runs/8-linfoot/drafts/code/.depositignore`: `attic/` and `results/*` have their folders, no `!` line has anything, and `__pycache__/` is exact. The 11 lines the case names go directly above `!results/phase2_scaled.pt`.
- A file holding `!data/README.md` only: met by reading. A `!` line has nothing, so `/data/` is added above it and shown as added.
- A file holding `data/raw/` only: met. Stripped, it reads `data/raw`, which is not `data`.
- A file holding `database/`: met. Stripped, it reads `database`, which is not `data`.
- `.env*` and `!.env.example`: met. Neither `.env` nor `.env.*` is the exact line, so both are added above `!.env.example`.
- No `.depositignore`: met. Line 273 writes the list, which now holds the four anchored lines and `secrets/`.
- The feature map: met, as item 4 shows.
- officium: not verifiable here. By reading, the new Steps 2 keeps `format:check` (`prettier --check .`) and `lint` (`eslint .`), and leaves out `check` (it runs `svelte-kit sync`). I read officium's `package.json` scripts read-only. Steps 8 drafts `docs/user/manual.html` in `.prettierignore`. That the baseline passes and that the commands pass with the exclusion is settled only by the rerun on the new pin that Open item M calls for.
- No format or lint command: met. Steps 5 has the bullet "Show, for a repository that names no format or lint command, ...", and Steps 8 has "A run with no such command goes on to Steps 9 with no command run."
- No diagrams kind: met. Steps 8 has "Make the scratch folder with `mktemp -d` when Steps 7 did not make one."
- `python3 docs/figures/gen_figures.py`: met. It exits 0, and the only figure listed is `docs/figures/code/handbook.svg`. The other line is the changed source, `gen_figures.py`.

## 1. Spec

- 1. `docs/adr/0061-...-on-a-copy.md`, Context and Status: "ADR 0058 has `handbook` show every page as a draft and write it after the user's approval."
  - What is wrong: item 6 asks the record to record item 5 "as a refinement of ADR 0058". The record never says that it refines 0058, or in which sentence. 0058's Status line names only 0060, unlike the repository's pattern of "refined by NNNN" on the older record (ADR 0036's Status line).
  - What is also wrong, in the brief: Decision 6 of the brief chose a new ADR. `docs/adr/README.md` says "A refinement that keeps the decision edits the ADR to its current state", and `grill` says the same. Decision 6 departs from that rule. The builder followed the brief, and `docs/adr/0058-*` is not in the brief's paths.
  - Failure scenario: a reader of 0058's Decision ("Every page is shown as a draft and written after the user's approval") does not learn that a drafted exclusion line can now be committed, or that a check runs before the drafts stop. A reader of 0061 cannot tell which part of 0058 it changes.
  - Fix: one sentence in 0061, such as "This refines ADR 0058 in its sentence on drafts and approval". Whether 0058 also gets a pointer, or is edited in place as the ADR README's rule says, is the orchestrator's call.
  - Verdict: item 6 violated.
- 2. `skills/code/handbook/SKILL.md:118`: "8. Run the repository's format and lint commands ..., when Steps 3 kept one whose tool is installed."
  - What is wrong: commands are kept or left out at Steps 2, by its bullets and its "Done when". Steps 3 only checks that each kept tool is installed.
  - Failure scenario: a reader looks in Steps 3 for the keep or leave-out rule and does not find it.
  - Fix: "when Steps 2 kept one and Steps 3 found its tool installed".
  - Verdict: none (a wording defect).
- 3. `skills/code/handbook/SKILL.md:134`: "gets that path drafted in the exclusions of the file ruff reads, `ruff.toml` before `pyproject.toml`."
  - What is wrong: ruff reads `.ruff.toml` before `ruff.toml`. The builder's report names this point and leaves it out because the brief did not name it. The example also does not say that the path goes in `extend-exclude`: the `exclude` key replaces ruff's default exclusions. Both points are tool behaviour stated from the tool's documentation and not run in this review.
  - Failure scenario: a repository configured by `.ruff.toml` gets the line drafted into a `ruff.toml` that ruff does not read, so the check stays red after three rounds. Or a repository with no `exclude` key gets `exclude = ["utils/figures.py"]`, which drops ruff's default exclusions.
  - Verdict: none. The example is brief-dictated and small enough to fix at landing.

## 2. Proof

- 1. `10-report.md`, "Judgment calls", the description: "Each dropped qualifier is still stated in the introduction and the Steps."
  - What is wrong: the introduction (SKILL.md line 10) does not hold "with its core", "drawn by a Python engine it copies" or "by the language's own tool". Only Steps 3, 6 and 7 hold them.
  - The decision that rests on it: whether the shorter description is accepted.
  - Failure scenario: at selection time a model reads only the description. It no longer learns that the diagrams need Python 3.10 through a copied engine, or that the API pages need the language's own tool installed. My judgment is that this loss is small, since `utils/figures.py` is still named in the commit list.
  - Verdict: none.

## 3. Standards

none

## 4. Behaviour

- 1. `skills/code/handbook/SKILL.md:124` and the Rules bullet:
  - The quoted lines: "Link each folder a command reads that git ignores, such as `node_modules` or `.venv`, from the repository with `ln -s <root>/<folder> <scratch>/check/<folder>`." and "The skill writes no file of the repository before the user approves the drafts at Steps 9; the scratch folder of Steps 7 and 8, with the copy of Steps 8 in it, stands outside the repository."
  - What is wrong: a command run in the copy writes into the repository through a link whenever its tool writes into that linked folder by default. The only writes Steps 2 leaves out are writes named by the command line ("`prettier --write .` or one with `--cache`").
  - Two concrete cases, from the tools' documented behaviour and not run here:
    - A Python linter run from a `.venv` made by `uv`, which does not compile bytecode by default, writes `__pycache__/*.pyc` into `<root>/.venv/` on its first import.
    - `next lint` caches by default under `.next/cache/` when `.next` is linked.
  - The report states the Rule as kept and does not name this.
  - Failure scenario: before the drafts stop, files appear under the repository's ignored `.venv/` or `.next/`. The Rule's claim is then false, and nothing in Steps 8 tells the session to check or prevent it.
  - Fix, in one bullet: either leave out a command whose tool writes into a linked folder, or set `PYTHONDONTWRITEBYTECODE=1` and similar settings for the run. Or, if the orchestrator accepts these writes, state the exception in the Rules bullet.
  - Verdict: none (item 5 does what the brief's text says; this is a gap in the design the brief gave).

## Declined to judge

- That officium's baseline passes and that `prettier --check .` passes with the drafted exclusion. Settling it needs a run of the new Steps 8 on officium, which is the rerun of Open item M and outside a read and a rerun here.
- How Steps 8 behaves with a folder ignored only through `.git/info/exclude`, which the fresh `git init` of the copy does not carry; with submodules; and with tracked symlinks that point into the repository. These are behaviours of the tools on inputs this review has none of. Settling them needs a run on such a repository.
- Whether the shorter `handbook` description is acceptable (Proof 1). That is the user's reading at the step's check.
- Whether 0058 gets a pointer to 0061 or is edited in place (Spec 1). That is the orchestrator's call between the brief's Decision 6 and `docs/adr/README.md`.
- The tool behaviour cited in Spec 3 and Behaviour 1 (ruff's config order and `exclude` against `extend-exclude`, uv not compiling bytecode, `next lint`'s default cache). It is stated from the tools' documentation and was not run in this review.
- What git ignores in the worktree, beyond `git status --short`. Settling it needs `git check-ignore -v <path>`, which is outside the three git commands allowed.

Reviewer usage: af1e418a616f06810, claude-opus-5-5, 187333 tokens, 36 tool uses, 7 min 17 s.

## Repair round 1, refuted

```
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

$ printf '%s\0' <the ten paths of Verify 1, ADR 0058 in place of 0061> | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0

$ git grep -n -e '^data/$' -e '^results/$' -e '^figures/$' -e '^attic/$' -- skills/academic/researcher/; echo "grep exit $?"
grep exit 1

$ sed -n '/^## The deposit/,/^## A README/p' .../project_layout.md | grep -c -x -e '/data/' -e '/attic/' -e '/results/' -e '/figures/' -e 'secrets/'
9
$ sed -n '/^## The deposit/,/^- `\/attic/p' .../project_layout.md | grep -c -x -e '/data/' ... -e 'secrets/'      (the list alone)
5
(the 9 includes the made-up example in the same section; over the list alone it is 5, as the round brief says)

$ python3 docs/figures/gen_figures.py >/dev/null; echo "exit $?"; git status --short docs/figures
exit 0
 M docs/figures/code/handbook.svg
 M docs/figures/gen_figures.py

$ python3 -c '...description length...' | grep -e handbook -e researcher
1015 skills/academic/researcher/SKILL.md
1021 skills/code/handbook/SKILL.md

$ git grep -n 0061 -- skills docs README.md; echo "0061 exit $?"
0061 exit 1

$ git status --short   (relevant lines)
 M docs/adr/0058-...-the-user-confirms.md      (docs/adr/README.md is not listed; 0061 is not on disk)

The report's quoted commands, rerun:
- find probe (scratch folder holding repo/.venv/old older than the marker, a link check/.venv to it, x written through the link after the marker):
  find -L .../check/.venv -type f -newer .../marker -print  printed only  .../check/.venv/x ; exit 0
- man find, -L: "Cause the file information and file type (see stat(2)) returned for each symbolic link to be those of the file referenced by the link, not the link itself. If the referenced file does not exist, the file information and type will be for the link itself."
- man find, -newer: "True if the current file has a more recent last modification time than file."  Both as the report quotes them.
- ruff, docs.astral.sh/ruff/configuration/ "Config file discovery": "the `.ruff.toml` file will take precedence over the `ruff.toml` file, and the `ruff.toml` file will take precedence over the `pyproject.toml` file."
- ruff, docs.astral.sh/ruff/settings/, `extend-exclude`: "A list of file patterns to omit from formatting and linting, in addition to those specified by `exclude`." `exclude` has a default list (`.git`, `.venv`, `node_modules`, ...) and the note "you'll typically want to use extend-exclude to modify the excluded paths."
```

The ruff sentence in Steps 8 matches the documentation: the file order is right, and `extend-exclude` adds to the default `exclude` list. The page and sentence the report gives are the ones I read. The `exclude` default is a list in the documentation. That setting `exclude` replaces it is an inference from the documentation, and an ordinary one.

The delta, as read:
- Files.txt paths with a difference: `skills/code/handbook/SKILL.md`, `docs/adr/README.md` (the 0061 row removed) and the deleted 0061 file.
- Files.txt paths with no difference: `gen_figures.py`, `handbook.svg`, `glossary.md`, researcher `SKILL.md`, `project_layout.md`, `kinds.md`.
- ADR 0058 is listed in no files.txt and changed now. Its part of `git diff eb17dd9` is read.

### Verdicts

Items of "What to build", for the whole diff since the base:

- 1: holds. The four folder lines are anchored, as in the first report. The round did not change `project_layout.md`: its delta against the snapshot is 0 lines.
- 2: holds. The delta against the snapshot is 0 lines, so the rule stays written once in "The deposit", and readme item 3 still names the section.
- 3: holds. The round changed neither researcher `SKILL.md` nor `project_layout.md`.
- 4: holds. The round changed neither `kinds.md` nor the glossary (delta 0), and the glossary's `feature map, of handbook` entry names `works`, `untested`, `partial` or `planned`.
- 5: holds on the text the brief asks for. Standards 1 and 2 are the gaps in the new text. The condition of Steps 8 now reads "when Steps 2 kept one and Steps 3 found its tool installed", which closes the first report's Spec 2. The Steps 2 bullet on caching tools, the `PYTHONDONTWRITEBYTECODE=1` bullet, the marker and the `find` are in place. The drafts stop and the Stops row name each file the `find` printed. The Rules bullet is added.
- 6: as the round's ruling 1 replaced it: holds.
  - ADR 0058 now says the following. Its Context states that a generated file can fail the repository's own format check, in one sentence with no private name. The Decision bullet on drafts names "each drafted exclusion line for a generated file". A new Decision bullet states the check: where the commands are read from, what is left out, the copy in a scratch folder, one run before and one after the drafts, at most three rounds, and an approved exclusion committed with the drafts. Alternatives rejected gains the three alternatives. Consequences gains one sentence. The Status line is unchanged.
  - 0061 is not on disk, `docs/adr/README.md` is not among the files changed since the base, and `git grep -n 0061 -- skills docs README.md` prints nothing.
  - The 0058 text contains no date or history.
- 7: holds. The delta of `gen_figures.py` and `handbook.svg` against the snapshot is 0 lines. The script exits 0, and only `handbook.svg` and `gen_figures.py` are listed.
- 8: holds. I grepped `PYTHONDONTWRITEBYTECODE`, `marker`, `extend-exclude`, `ruff.toml` and `0061` across `skills/`, `docs/` and `README.md`, leaving out the figure SVGs.
  - The only hits that bear on the delta are the new lines in `handbook`'s `SKILL.md` (127, 128, 136, 141).
  - The ADR 0045 hits are an unrelated word, "marker".
  - `docs/dev/building.md:39` is a different "marker".
  - `build.test.sh:12` is an unrelated `unset`.
  - The glossary's `scratch folder, of handbook` entry ("Steps 7, 8 and 12") stays true with the marker inside the scratch folder.

Cases:

- engram's file: met. The text of the rule is unchanged in the round, so the first report's reading stands.
- linfoot's file: met, as above.
- `!data/README.md` only: met, as above.
- `data/raw/` only: met, as above.
- `database/`: met, as above.
- `.env*` with `!.env.example`: met, as above.
- No `.depositignore`: met, as above.
- The feature map: met, as above.
- officium: not verifiable. Settling it needs a run of Steps 8 on officium, Open item M's rerun. By reading, `format:check` (`prettier --check .`) and `lint` (`eslint .`) are kept, `npm run check` is left out, and the `.prettierignore` line is drafted. I know of no default cache for those two tools. That is from memory, not run here.
- No format or lint command: met. The Steps 5 bullet and the "A run with no such command goes on to Steps 9" bullet are unchanged.
- No diagrams kind: met. The line "Make the scratch folder with `mktemp -d` when Steps 7 did not make one" is unchanged.
- `gen_figures.py`: met. Exit 0, and only `handbook.svg` is listed beside the changed `gen_figures.py`.

### Findings

Closures, ruling by ruling:

- Ruling 1: reproduced by the greps and the diff above. The ADR carries every item the ruling lists, and the record leaves no 0061.
- Ruling 2: reproduced. Steps 8, first line.
- Ruling 3: reproduced, as judged above.
- Ruling 4: reproduced for the sentence. The three places the report names exist.
  - "with its core" is at `SKILL.md:98` and `kinds.md:21`.
  - The engine and Python 3.10 are at `SKILL.md:67` and `:111`.
  - The tool being installed is at `:73`, and the API tool's configuration at `:100`.
  - Those lines hold the idea, not the phrase. The phrase "the language's own tool" is in `kinds.md:14` and `:74`, and the report does not name those two places.
  - The description is unchanged at 1021.
- Ruling 5: partly reproduced. The find probe reproduced, and the `man find` quotes are exact. The Steps 2 bullet, the environment variable, the marker and the Rules bullet are in the text. Standards 1 and 2 below hold, and Standards 3 is the wording of the Rules bullet.

No finding was closed by removing a check. No fix reaches beyond its finding.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

1. `skills/code/handbook/SKILL.md:62` (Steps 2): "Leave out a command whose tool writes a cache by default, such as `next lint`, with its reason."
   - What is wrong: read literally, it contradicts the Steps 2 line 59 example that names `ruff check` as a command to keep. Ruff writes `.ruff_cache` by default; `docs.astral.sh/ruff/settings/`, `cache-dir`, says "By default, Ruff stores cache results in a `.ruff_cache` directory in the current project root."
   - Rule broken: `change-standard.md`, rule 19, "A change leaves no two statements that contradict each other".
   - The harm the ruling guards against is a write into a linked folder. A cache written into the copy, not through a link, does no harm. The bullet states the wider condition.
   - Failure scenario: a Python repository whose `format:check` or `lint` runs `ruff check`. The session reads the bullet and leaves out the command, so the check never runs. Or it reads line 59 and keeps it, and cannot tell which line holds. In either case a `ruff.toml`-excluded file is never tested.
   - Verdict: item 5 holds, with this finding.
2. `skills/code/handbook/SKILL.md:141` and `:136` (Steps 8): "After the last run, run `find -L ... -print` for each linked folder: each file it prints was written into the repository by a command, and the drafts stop names it with the commands that ran in the copy, since one search after the last run cannot tell which of them wrote it."
   - What is wrong: this bullet is 58 words and holds the search, what a hit means and a reason. Line 136, the ruff example, is 39 words. `skill-layout.md`, "Lists and tables", asks for one rule per bullet, and the prose standard asks for sentences under roughly 20 words.
   - The report's "Departures from the length and list rules" (Verify 5) names the bullets at 35, 50 and "30 or 40" words and then says "Every other new sentence is under about 25 words". The round added two bullets over that and named neither. Report Verify 5 requires each departure to be named with why it needs its form.
   - Failure scenario: a reader of the skill sees the stop named in a clause behind a colon and reads the explanation of why the command is not named as the rule.
   - Verdict: item 5 holds, with this finding.
3. `skills/code/handbook/SKILL.md:201` (Rules): "The commands of Steps 8 write nothing into the repository, and a file found written through a linked folder is named at the drafts stop."
   - What is wrong: the first clause is a claim of prevention. The mechanism only detects: `PYTHONDONTWRITEBYTECODE` covers Python tools only, the cache rule covers the tools the session recognises, and the `find` runs after the writes. The second clause says that a write can happen. The two clauses contradict each other, and the line above (`:200`) says the skill writes no file of the repository before approval. A file found is already in the repository when the drafts stop names it.
   - Rule broken: `change-standard.md`, rule 19.
   - Failure scenario: a reader trusts the first clause, finds a `__pycache__` or `.next/cache` file in an ignored folder after a run, and takes the skill as broken. The text should say that the run takes the three measures and names any file it could not prevent.
   - Verdict: item 5 holds, with this finding. The round brief's own wording for this bullet is the cause, so the orchestrator's call is whether to keep it or change it.

## 4. Behaviour

none. The report's "Host- or user-visible changes" and its "Repair round 1" section state the new Steps 2 bullet, the environment variable, the marker, the search and the stop line, with before and after.

### Declined to judge

- That `next lint` writes a cache by default, that `uv`-made `.venv`s are left without bytecode when the variable is unset, and that `eslint` and `prettier --check` write no cache by default. These are tool behaviours stated from documentation or memory, not run here.
- Whether a search after the last run names the command that wrote a file. The builder departs from the ruling's wording ("the commands that ran in the copy", not "the command") and names the reason. Whether to keep it or to search after each run is the orchestrator's call.
- Whether the 0058 Decision bullet on the check (about 95 words) is too long for an ADR. The prose standard is the standard for the skills' pages and the ADR has no length rule I could cite.
- Whether the officium run passes (Open item M's rerun).
- What git ignores in the worktree beyond `git status --short`. Settling it needs `git check-ignore -v`, outside the three git commands allowed.

Reviewer usage: ad6d31d762deb1ecf, claude-sonnet-5-5, 123000 tokens, 26 tool uses, 2 min 38 s.

## Closed

- First run, Spec 1 (ADR 0061 not recorded as a refinement of 0058): closed in repair round 1, ruling 1; ADR 0058 edited to its current state, 0061 and its row removed, as `docs/adr/README.md` says; `git grep -n 0061 -- skills docs README.md` prints nothing.
- First run, Spec 2 (the condition of Steps 8): closed in round 1, ruling 2.
- First run, Spec 3 (ruff's order and `extend-exclude`): closed in round 1, ruling 3; at landing the bullet was split into the example and one sentence on the file ruff reads (Standards 2 of the round's run).
- First run, Proof 1 (the report's sentence on the description): closed in round 1, ruling 4.
- First run, Behaviour 1 (writes through a linked folder): closed in round 1, ruling 5, and at landing: a fresh marker before each run and the `find` after each run, so the drafts stop names the command that wrote a file, in place of one search after the last run.
- Round 1, Standards 1 (the cache bullet against `ruff check`): fixed at landing; Steps 2 leaves out a command whose tool writes a cache by default into a folder Steps 8 links, such as `next lint` into a linked `.next`, and keeps one whose cache stays inside the copy, such as `ruff check` into `.ruff_cache`.
- Round 1, Standards 2 (two long bullets): fixed at landing; the `find` bullet is now three bullets beside the marker, and the ruff example two bullets.
- Round 1, Standards 3 (the Rules bullet claims prevention): fixed at landing; it reads "Steps 2 and 8 keep the commands of Steps 8 from writing into the repository where they can; a file a command writes through a linked folder all the same is found after its run and named at the drafts stop with that command."
- Verification after the fixes: `checks.sh` printed `checks: 16 commands passed`; the `handbook` description is 1021 characters.
