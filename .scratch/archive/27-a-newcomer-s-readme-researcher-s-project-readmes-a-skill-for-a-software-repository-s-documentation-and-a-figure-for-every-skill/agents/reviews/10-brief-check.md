# Brief check of step 10

On main at 6013f22 (`git log --oneline -1` printed `6013f22 Book Open item J of roadmap entry 27: ...`). Brief: `L/agents/briefs/10.md`. I changed nothing in Ordo or officium. My scratch work was a throwaway clone of officium under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/bc10/`, made with `--no-hardlinks` and removed afterwards.

## 1. Names

- **The five folder lines** (`data/`, `attic/`, `results/`, `figures/`, `secrets/`).
  - `git grep -n depositignore -- skills docs README.md` hits only places the step writes, plus three others:
    - `docs/adr/0057-...md:14` ("`code/.depositignore` leaves `data/`, `attic/`, `results/`, `figures/`, caches and secrets out of the deposit"). Anchoring keeps that sentence true for four folders. For `secrets/` it narrows the rule: see the findings.
    - `docs/adr/0053-...md:20` (the default layout). Not about the deposit, so not made false.
    - `skills/academic/researcher/SKILL.md:80`, `:281`, `:421`, `:460`, `:731`. These lie inside a path the step writes, and none quotes the lines.
  - `` git grep -n -E '`(data|attic|results|figures|secrets)/`' -- skills/academic/researcher `` also hits `project_layout.md:32`, `:71` (code README layout, not false) and `examples/mid_entry_example.md:354` (unrelated). It also hits `project_layout.md:101-103`, the bullets under the list. Those name `attic/`, `results/`, `figures/` and `data/` unanchored; they are not false, but they no longer match the list's spelling.
- **The statuses** works, partial, planned and untested. I grepped each status in backticks, and the bare word `untested`, over skills, docs and README.md, with `docs/roadmap.md` excluded.
  - `` `works` ``, `` `partial` `` and `` `planned` `` hit only `kinds.md:54-56` and `glossary.md:167`, both in the paths. The other hits use a different set of words and are not made false: `paper-review-panel/references/re_review_mode_protocol.md:53` and `researcher/references/compliance_checkpoint_protocol.md:108` (`partial`), `codebase-design/SKILL.md:271` and `statistical_reporting_standards.md:82` (the word "untested").
- **Step numbers of handbook** (Steps 8 to 11 become 9 to 12).
  - Command: `git grep -n -E 'Steps [0-9]+' -- skills/code/handbook docs/figures/gen_figures.py`, plus a grep of `docs/glossary.md` for handbook.
  - Hits outside the paths (the glossary path is "line 167" only):
    - `docs/glossary.md:148`, **API pages, of `handbook`**: "Stated in: ... `SKILL.md`, Steps 6 and 10". Steps 10 (the commit) becomes 11, so the line becomes false.
    - `docs/glossary.md:191`, **scratch folder, of `handbook`**: "Stated in: `skills/code/handbook/SKILL.md`, Steps 7 and 11". Steps 11 becomes 12, so it becomes false. Its definition ("in which `handbook` runs the diagram file's draft with a copy of the engine ...") also becomes incomplete, since the clone of item 5 stands in that folder.
  - Hits outside the paths that stay true: `references/diagrams.md:14` (Steps 7), `kinds.md:63`, `:76` (Steps 3), and `glossary.md:159`, `:164`, `:165`, `:173` (Steps 4 to 7).
  - Inside SKILL.md, these follow the renumbering: lines 84, 98, 114, 128, 138, 148, 149, 160, 164 and 166.
- **The figure's boxes** (R, K, SK, D, G, SD, W, SC, C, E): `docs/figures/gen_figures.py:1712-1764` only. `git grep -n handbook.svg` hits `docs/dev/building.md:41`, `docs/dev/scripts.md:9` and `gen_figures.py:23`, `:2486`. None is made false.
- **Sentences about the whole of handbook's SKILL.md** (change-standard rule 14), inside a path but not named by the brief:
  - The `description` says "It leaves the approved pages, the diagrams with their graph file, utils/figures.py and utils/manual.py in one commit".
  - The introduction says "leaving the pages, the diagrams with `utils/diagrams.py`, `utils/figures.py` and `utils/manual.py` in one commit".
  - Both become incomplete once the commit can hold a drafted exclusion line. The description has 1006 characters now (the `python3 -c 'import glob,yaml; ...'` of skill-layout printed `1006 skills/code/handbook/SKILL.md`), which leaves 18 characters before the 1,024 limit.

Findings:
- `docs/glossary.md:148` and `:191` become false after the renumbering, and line 191's definition becomes incomplete. Neither line is in "Paths this step writes", which lists the glossary as "line 167" only.
- The description and the introduction of handbook's `SKILL.md` become incomplete about what the commit holds, and the brief names neither. The description has 18 characters of room.

## 2. The step line

- **"The deposit" writes its folder lines anchored**: item 1.
- **readme item 3 adds a line only when no line already names that folder in any form**: item 2.
- **research's first writing follows the same rule**: item 3. No new rule is needed, since research writes the file only when none exists.
- **kinds.md gains `untested`**: item 4. The glossary entry is in item 4 too.
- **The format check on each file it generates, with the ignore line drafted for approval**: item 5.
- **Each skill's `metadata.version` left as this plan set it**: stated only in "What is on the tree" (the versions bullet). No item of "What to build" and no verify line covers it. Since this is a non-change, that is acceptable.
- **Every page and figure that states these rules follows**: items 6 and 7.
- **The step's check** (the user reads the text; the `git grep` of the five lines): verify 2 and the landing read.

Findings: none. Every part maps to an item or to a stated non-change.

## 3. Premises

- **project_layout.md, "The deposit"**: `sed -n 78,110p` puts the heading at line 80, the fenced list at lines 84 to 99 (14 lines, as the brief lists them), "research item 3 writes these lines" at line 107 and the readme rule at line 108. Matches.
- **SKILL.md lines 273 and 447**: `git grep -n depositignore -- skills docs` prints both texts as quoted. Matches.
- **engram**: the run record `8-engram/stop-1-drafts.md`, Draft 4, shows `/data/` with the comment "silently excluded the whole of src/engram/data/ (nine source files) from every commit", and shows `data/` added (Q15). Matches.
  - The `ls code/src/engram/data` listing (`__init__.py`, `dedup.py`) was not rerun: it is in research-hub, outside what this check reads.
- **linfoot**: `8-linfoot/stop-1-drafts.md`, Draft 3, holds `results/*` with the `!` lines quoted, and adds `results/`. The record's question 1 says the weights leave the deposit. Matches.
- **kinds.md, "A feature map"**: lines 51 to 56 hold the three statuses as quoted. `8-officium/stop-2-drafts.md:925` and `:1286` hold question 3, with rows marked "in the code, no test" (lines 966 to 969). Matches.
- **glossary.md line 167**: matches. `grep -n 'ordo:plan-terms' docs/glossary.md` prints 5 and 144, and `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`. Matches.
- **handbook SKILL.md**: read whole. Steps 7, 8, 9 and 11 and the Rules bullet are as the brief says. Two facts the brief does not state:
  - Steps 7 makes the scratch folder only "when the kind is confirmed" (the diagrams).
  - "What it reads" 2 lists the manifest and the build files, but no CI configuration.
- **officium facts**:
  - `grep -n 'format:check' package.json` prints `22: "format:check": "prettier --check ."`, and `cat .prettierignore` lists no `docs/`. Matches.
  - `prettier --check preview/manual.html --ignore-path=/dev/null` in the run folder printed "Code style issues found in the above file", exit 1. Matches.
  - Not in the brief, and it matters: officium's HEAD 42cad59 still ignores `/docs/`. `git diff .gitignore` shows `-/docs/` as an uncommitted change (Open item K). `git status --short` lists `.agents/building.md`, `.agents/plan.yaml`, `.gitignore` and `tests/privacy.test.ts` as modified.
- **gen_figures.py, `handbook()`**: lines 1712 to 1764 hold the ten boxes as listed. `git grep -n handbook.svg` shows no README image. Matches.
- **Versions**:
  - `grep -n 'version:'` prints researcher `2.0.0` and handbook `1.0.0`.
  - `git log -S'version: "2.0.0"' -- skills/academic/researcher/SKILL.md` prints d5acc5e, the landing of step 2.
  - `git log -- skills/code/handbook/SKILL.md` gives bcfb2e8 as the first commit (step 3).
  - skill-layout, "Frontmatter", holds the sentence quoted. All match.
- **ADRs 0057, 0058 and 0060**: the quoted sentences are as the brief quotes them (`grep -n` of each file).
- **The verify list equals building.md**: the `sh`/`python3` commands of the state file's `verify:` block and of building.md's code block match one for one, and each has one ASCII check line. Matches.

Findings: none differ from what the brief says. One fact the brief omits changes the officium case: officium's HEAD still ignores `/docs/`, and K's removal of that line is uncommitted (section 6, inputs 9 and 10).

## 4. Cases and checks

- **engram's file**: consistent with the rules file. It leaves out the non-folder lines the rule adds. Draft 4 shows engram lacks `*.pyc`, `.cache/`, `.ipynb_checkpoints/`, `.env`, `.env.*`, `*.pem` and `*.key`, so the expected result is not stated whole.
- **linfoot's file**: consistent.
- **A file holding `!data/README.md` only**: consistent with the step line ("or a `!` line under it"), but inconsistent with ADR 0057's sentence that the file "leaves `data/` ... out of the deposit". A negation with no exclusion before it excludes nothing, so under this case the whole `data/` folder goes into the public deposit (section 7).
- **A file holding `database/`**: consistent.
- **No `.depositignore`**: consistent.
- **The feature map**: consistent.
- **officium**: the case asks the builder to judge a run in a repository the step does not change. That is allowed as a reading of the unchanged tree, but its expected result depends on officium's state outside the step:
  - At officium's HEAD the clone ignores `/docs/`, so prettier skips `manual.html` and nothing is drafted.
  - With the working tree's changes, the check already fails on `tests/privacy.test.ts`.
  - Section 6, inputs 9 and 10, gives the runs.
- **No format or lint command**: consistent.
- **The figure run**: consistent.
- **Verify 1 to 5**: consistent with change-standard rules 6 and 14. Verify 4 is close to its limit for handbook (1006 of 1024).
- **The check in item 5 repeats with no count** ("checked again until the check passes"). This breaks skill-layout, "Writing for an agent": "A repeat that ends only when a condition holds, such as 'until it passes' ..., is given a count". Steps 7 gives its own repeat a count (three corrections).
- **Item 2 writes one rule in two places** (`project_layout.md` line 108 and readme item 3). This breaks skill-layout, "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in"), and "Writing for an agent" ("One meaning has one place").

Findings:
- The `!data/README.md` case asks for a result that publishes `data/`, against ADR 0057.
- The officium case's expected result does not hold against officium as it stands, whether the clone is taken at HEAD or with the working-tree changes.
- The engram case does not state the non-folder lines expected.
- Item 5's repeat has no count (skill-layout, "Writing for an agent").
- Item 2 dictates the same rule in two files (skill-layout, "Where a rule goes").

## 5. The question

"The goal" here is the deposit leaving out what ADR 0057 names without losing shipped files, plus handbook's two gaps closed.

- **engram case**: yes, it could pass without the goal. A rule that adds the folder lines correctly but drops a non-folder line still meets the case as written.
- **linfoot case**: no. It names every expected addition and the lines that must not be added.
- **`!data/README.md` case**: yes. It passes with `data/` published, which is the opposite of the goal.
- **`database/` case**: no.
- **No-file case**: no.
- **Feature-map case**: no. A reading of kinds.md fails while `untested` is missing.
- **officium case**: no as a pass. As designed it fails rather than passes falsely.
- **No-command case**: yes in part. "The drafts stop says no check was found" is met just as well by a skill that never looks for a command.
- **Figure case**: no for the change. `git status` shows `handbook.svg` changed, but whether the box is right needs the read.
- **Verify 2 (the grep)**: yes, alone. It prints nothing if the list is deleted or indented. The step's check pairs it with the user's reading, so the step's check as a whole: no.
- **Item 1**: no, with the reading.
- **Item 2**: yes. Its "starts with that name followed by `/`" clause and its `!` clause make a file holding only `/data/*.csv`, `data/raw/` or `!data/README.md` count as having the folder. The rest of the folder then goes into the deposit.
- **Item 3**: no.
- **Item 4**: no.
- **Item 5**: yes, in three ways:
  - A clone of HEAD misses an uncommitted ignore change. officium's HEAD ignores `/docs/`, so the check passes with no line drafted, while the real tree after K rejects `docs/user/manual.html`. Run: `git clone --quiet --local --no-hardlinks officium <scratch>/check`, then `ln -s .../node_modules`, then the preview copied to `docs/user/manual.html`, then `npm run --silent format:check`, printed "All matched files use Prettier code style!", exit 0. With officium's uncommitted `.gitignore` diff applied, the same check printed `[warn] docs/user/manual.html`, exit 1.
  - The API pages the run builds at Steps 9 are never put into the copy, so a check that reads them passes in the copy and fails in the repository.
  - "Until the check passes" never ends when the repository already fails the check. Run: officium's working-tree diff applied in the clone printed `[warn] tests/privacy.test.ts`, exit 1, before any draft was added.
- **Item 6**: no.
- **Item 7**: no.

Findings:
- Item 2's prefix and `!` clauses, and the `!data/README.md` case, pass with data published.
- Item 5 passes with no exclusion drafted when the clone is of HEAD and the working tree differs. It also leaves out the API pages, and it cannot end on a repository that is already red.
- The engram case and the no-command case could pass with the goal unmet, as described above.

## 6. Implied inputs

This is a text step whose rules a reader applies like code. Each input below has happened or costs something if answered wrong.

1. **A line `**/data/` or `src/data/`.** Missing from Cases. Expected: not had, `/data/` added. That is harmless.
2. **A line `/data/*.csv` or `data/raw/` alone.** Missing. By item 2 it is had, so nothing is added and the rest of `data/` is published. Expected by ADR 0057: `/data/` added, or a question in the draft.
3. **`!data/README.md` alone.** Listed, with the wrong expected result (section 4).
4. **An added line placed after the file's own `!` lines.** Missing. Example: a file with `.env*` and `!.env.example` gets `.env.*` appended, and `.env.example` is then left out. Expected: the draft places the added line before the first `!` line, or names the line it overrides.
5. **Comment lines and blank lines.** Missing. Expected: not read as lines of the rule. A `#` line never matches today, so the cost is low.
6. **A repository that names several check commands.** Missing. officium names `lint`, `format:check` and `check`; the brief's own ruff example has two commands. Expected: each format or lint command runs, and the text says which kinds of command count. `npm run check` (svelte-check) is a type check.
7. **A check whose tool is not installed** (ruff named in `pyproject.toml` but not on PATH; no `node_modules`). Missing. Expected: no check runs, and the drafts stop names the command and the reason.
8. **A check that needs a build or the network first.** Missing. Examples: `npm run check` runs `svelte-kit sync`; `cargo clippy` builds; `uv run ruff` syncs a virtual environment; `pre-commit run` fetches hooks. Expected: the check is not run, and the drafts stop says so, since "nothing is installed and nothing is fetched".
9. **A working tree that differs from HEAD.** Missing. This is officium now, and the runs in section 5 show the wrong answer. Expected: the copy holds the working tree's tracked changes and its untracked files that are not ignored, or the run stops on a working tree that differs from HEAD.
10. **A check that fails on the repository's tree before any draft is added.** Missing; officium with K applied fails on `tests/privacy.test.ts`. Expected: the check runs once on the clean copy first. Only failures in files the run writes are acted on, the earlier failures are named at the stop, and the repeat has a count.
11. **A tool that writes through a linked folder.** Missing. Examples: `prettier --cache` or `eslint --cache` write `node_modules/.cache`; `uv run` writes to `.venv`; `cargo` writes to a linked `target/`. Any of these writes inside the repository before the approval, which breaks the Rules bullet item 5 keeps.
    - Expected: only folders the check reads are linked, and a command that writes to one is not run, or the folder is copied instead of linked.
    - officium's `prettier --check .` and `eslint .` carry no `--cache`, and `ls officium/node_modules/.cache` printed "No such file or directory" after both ran in the clone.
12. **The API pages' output** (Steps 9 builds `docs/user/reference/api/`). Missing. Expected: built in the copy and checked, or their exclusion drafted.
13. **A run with the diagrams kind left out.** Missing. Steps 7 makes no scratch folder in that run, so `<scratch>/check` has no parent. Expected: the new step makes the scratch folder when Steps 7 did not, and the glossary entry **scratch folder, of `handbook`** says so.
14. **A draft the user corrects at the drafts stop.** Missing. Expected: the check runs again on the corrected draft.
15. **The check command read from the repository's files reaches a shell before the user has seen it** (change-standard rule 15). Missing. Expected: the command is shown at the stop "The kinds" and runs only on the user's confirmation.
16. **No exclusion file yet** (no `.prettierignore`), or ruff configured in `ruff.toml` rather than `pyproject.toml`. Missing. Expected: a new `.prettierignore` is drafted; ruff's exclusion goes in the file ruff reads (ruff gives `ruff.toml` precedence over `pyproject.toml`).
17. **A capability the code holds in part, with no test.** Missing. Expected: `partial`, named in kinds.md, since the four statuses now overlap.
18. **Submodules or Git LFS.** Missing. A local clone holds neither, so the check can fail for reasons unrelated to the run. Expected: named at the stop. This is rare.

How workable item 5 is by repository type:
- **Node**: works for officium. `prettier --check .` and `eslint .` in the clone with a linked `node_modules` both exit 0 at HEAD, and the link appears as `?? node_modules` (untracked, since `node_modules/` with its slash does not match a symlink).
- **Python with ruff**: works when ruff is on PATH. `ruff check --isolated` printed "Found 1 error." on the two handbook templates, and `ruff format --check --isolated` printed "2 files would be reformatted", so the copies would be rejected and an exclusion drafted. It fails on `uv run ruff` or on a linked `.venv` that gets written (input 11).
- **Rust**: `cargo fmt --check` needs nothing linked and checks no file handbook writes, so it passes trivially. `cargo clippy` needs a build and breaks "nothing fetched", or writes into a linked `target/`.

The clone does keep handbook's rule that nothing of the repository is written before approval, provided inputs 11 and 13 are covered.

Findings: inputs 1, 2, 4 and 6 to 18 are missing from Cases. Input 3 is listed with a result that contradicts ADR 0057. Inputs 9, 10 and 11 carry the highest cost.

## 7. ADRs

`ls docs/adr | wc -l` printed 61. I ran `grep -l -i -E 'handbook|depositignore|deposit|lint|clone|prettier|ignore'` over them and read the records that touch the step:

- **0057**: the step is under "`code/.depositignore` leaves `data/`, `attic/`, `results/`, `figures/`, caches and secrets out of the deposit". The brief names it. Two contradictions:
  - The `!data/README.md` case and item 2's prefix and `!` clauses let `data/` into the deposit.
  - Anchoring `/secrets/` lets a deeper `secrets/` folder into a public deposit, while the brief keeps "a secret file ... left out at any depth". The one real case behind the change, engram, concerned `data/` only.
- **0058**: the step is under "a feature map with each capability's status" and "Every page is shown as a draft and written after the user's approval". The brief names it. Its Decision, "It writes from a fixed set of kinds", lists everything handbook writes. With this step, handbook runs repository commands and writes a non-documentation file (`.prettierignore`, or `pyproject.toml` for ruff), which is no kind.
  - Change-standard rule 5 asks that the ADR owning a decision be documented in the same step when the change touches it. The brief neither refines 0058 nor puts it in the paths.
  - I judge this an extension rather than a contradiction. Whether 0058 needs a refinement is for the orchestrator.
- **0060**: the step is under "`handbook` copies it ... and commits the `.svg` it draws". The engine is unchanged. It holds, and the brief names it.
- **0053**: the default layout names `data/`, `results/` and the rest as folders. It is not touched.
- The other records contain no sentence on these files.

Findings:
- The anchored `/secrets/` and the "had" rule's `!` and prefix clauses go against 0057's sentence.
- 0058's Decision does not cover the exclusion file or the running of repository commands, and the brief neither updates it nor lists it in the paths (change-standard rule 5).

## 8. Dictated text

- **"`/data/`, `/attic/`, `/results/`, `/figures/` and `/secrets/`"** (`grep -n '/secrets/' L/agents/briefs/10.md` printed line 29): holds for the prose standard. It conflicts with ADR 0057 for `/secrets/` (section 7).
- **"`untested`, the code holds it and no test covers it"** (`grep -n 'untested' ...` printed line 36): holds.
- **The made-up example: "a `.depositignore` holding `results/*` and `!results/model.pt` gets no `/results/` line, and one holding no line on `data` gets `/data/`"** (`grep -n 'model.pt'` printed line 34): holds. It is made up and says so, and its pattern is a common gitignore idiom with nothing from a private file (CLAUDE.md, "A shipped file names nothing private").
- **"`git clone --quiet --local <root> <scratch>/check`"** (`grep -n 'git clone'` printed line 39): it is valid as a command. It breaks nothing in the prose standard, but it copies HEAD only (section 5).
- **"the line `docs/user/manual.html` in `.prettierignore`"** (`grep -n 'prettierignore'` printed lines 18, 40 and 56): holds.
- **"checked again until the check passes"** (`grep -n 'until the check passes'` printed line 40): breaks skill-layout, "Writing for an agent" (a repeat with no count), and the skill-layout Anti-patterns row "A repeat with no count".
- **The box label "The repository's format check run on a scratch copy holding the drafts"** (`grep -n "format check run on a scratch copy"` printed line 93): holds for ASCII and the prose standard. It says "format check" while item 5 also runs lint commands. The figure has no loop for the new step's repeat, while the legend says a repeated step has "a dotted loop ... with its cap".
- **"no check was found"** (`grep -n 'no check was found'` printed line 57): holds.

Findings:
- "checked again until the check passes" breaks skill-layout, "Writing for an agent", and its Anti-patterns row on a repeat with no count.
- The box label names a format check only, and the figure draws no loop with a cap for the new step.

## On Open item M

The brief carries out M's words: it adds `untested`, a check of the files the run generates, and an ignore line drafted for approval and committed with the rest. It goes beyond M in two ways, both consistent with the step line: it also runs lint commands, and it corrects drafted pages the check rejects.

As written it would not do what M asks on the run M names. officium's HEAD still ignores `/docs/`, so a clone of HEAD drafts no line; with K's working-tree changes, the check fails on `tests/privacy.test.ts` and never passes. M's purpose is met only if the copy reflects the working tree, the check runs once on the clean copy first, and the repeat has a count.

On Open item L: its words, "a line added only when the file does not already name that folder", are narrower than the step line's "or a `!` line under it", which the brief follows. The `!` clause and item 2's prefix clause are what publish `data/` in the `!data/README.md` case. Neither real file (engram, linfoot) needs them: `/data/`, `attic/` and `results/*` are each had by equality after stripping.

## Declined to judge

- Whether 0058 needs a refinement, or whether `/secrets/` should stay unanchored. These are rulings for the orchestrator or the user, and section 7 gives the evidence.
- Whether the officium rerun should wait for the user to commit K. That is the user's repository.
- engram's `ls code/src/engram/data` listing was not rerun: research-hub is outside what this check reads, and the run record is the source.

Agent usage: a8c25cbeecbc26775, claude-opus-5-5, 165475 tokens, 36 tool uses, 8 min 36 s.

## Closed

Each finding closed by a change to the brief `agents/briefs/10.md`, read back after the change:

- Names, glossary lines 148 and 191: both added to "Paths this step writes" and to item 5's renumbering bullet; the scratch folder entry also names the copy.
- Names, the description and the introduction of handbook's `SKILL.md`: item 5's last bullet has them name the drafted exclusion, within 1,024 characters.
- Cases, `!data/README.md`: item 2 now says a `!` line has no folder, and the case expects `/data/` added above it. The prefix clause is removed: `data/raw/`, `/data/*.csv`, `**/data/` and `src/data/` do not have the folder, with a case for `data/raw/`.
- Cases, the officium case: it now names the working tree as it stands, the copy of item 5 takes the working tree (tracked files on disk and untracked files not ignored), and the baseline run comes first. The working tree's own prettier failure on `tests/privacy.test.ts` was the orchestrator's uncommitted edit of ruling K, reformatted with `npx prettier --write`; `npx prettier --check .` in officium then printed "All matched files use Prettier code style!".
- Cases, the engram case: every line expected is listed, the non-folder lines included.
- Cases, the repeat with no count: item 5 caps it at three, as Steps 7 does, and the figure gains a return with its cap.
- Cases, one rule in two places: item 2 writes the rule once, in `project_layout.md`, "The deposit", and readme item 3 names that section.
- The question, item 5's three ways: the working-tree copy, the API pages built in the copy, and the baseline run whose failures are named and not acted on.
- Implied inputs 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 and 17: each covered by item 2 (placement above the first `!` line, comments and blank lines) or item 5 (several commands; tool not installed; build, install or network first; working tree; baseline; a command that writes into the repository left out; API pages; scratch folder made when Steps 7 did not; a corrected draft checked again; the commands shown at the first stop and run only after confirmation; a new `.prettierignore` or the file ruff reads) or item 4 (`partial` for a capability held in part). Inputs 1, 2 and 3 follow from item 2's stricter rule. Input 18 (submodules, LFS) is left out: it has not happened in any repository read, and a failure it causes shows in the baseline run, which the stop names.
- ADRs, `/secrets/`: `secrets/` stays unanchored (Decisions 2), and the step line in `plan.md` and its check were corrected to match.
- ADRs, 0058 and change-standard rule 5: item 6 adds ADR 0061, a refinement of 0058, with its row in `docs/adr/README.md`.
- Dictated text, the box label: it now names format and lint commands, and the figure has the return with its cap.
