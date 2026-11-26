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
