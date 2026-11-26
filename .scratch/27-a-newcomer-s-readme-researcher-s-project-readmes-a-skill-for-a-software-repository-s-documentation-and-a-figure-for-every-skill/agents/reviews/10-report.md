# Report: step 10, researcher's rule for `.depositignore` and two gaps of `handbook`

Everything in the brief is done. One check does not print the number the brief gives: Verify 2's count prints 9 where the brief expects 5. The brief's own item 2 example accounts for the 4 extra lines; the evidence is under "Anything in the brief that was wrong or impossible".

## Open items of the state file

```
None.
```

## The cases' first run

The unchanged tree was at eb17dd9 for every case. A text case was checked by reading. Each case was read twice: once against the rule on the unchanged tree (`project_layout.md` line 108 and readme item 3 at `SKILL.md` line 447), and once against the brief's item 2 rule, to look for a case that rule gets wrong. The brief's rules get none of the cases wrong, so nothing was handed back.

- **engram's file.** Unchanged tree: the rule "adds each of these lines it lacks" and appends `data/`, `attic/`, `results/` and `figures/`, as the run record `agents/runs/8-engram/stop-1-drafts.md` (Draft 4) shows: `data/` is added beside `/data/`. Under the brief's rule, `/data/` stripped is `data`, so the folder is had. `__pycache__/` and `.pytest_cache/` are exact lines. The rule adds `/attic/`, `/results/`, `/figures/`, `*.pyc`, `.cache/`, `.ipynb_checkpoints/`, `.env`, `.env.*`, `*.pem`, `*.key` and `secrets/`, and puts them at the end because the file has no `!` line. This is the case's expected result.
- **linfoot's file.** Unchanged tree: the rule appends `data/`, `results/`, `figures/` and the rest at the end, as `agents/runs/8-linfoot/drafts/code/.depositignore` holds. The `results/` it adds excludes the folder after the `!results/...` re-includes. Under the brief's rule, `attic/` has attic and `results/*` (stripped `results`) has results. No `!` line has anything. The rule adds `/data/`, `/figures/`, `*.pyc`, `.cache/`, `.pytest_cache/`, `.ipynb_checkpoints/`, `.env`, `.env.*`, `*.pem`, `*.key` and `secrets/` above `!results/phase2_scaled.pt`. This is the expected result.
- **A file holding `!data/README.md` only.** Unchanged tree: `data/` is appended after the `!` line. Brief's rule: a `!` line has nothing, so `/data/` is added above `!data/README.md` and the draft names it as added. This is the expected result.
- **A file holding `data/raw/` only.** Unchanged tree: `data/raw/` is not the line `data/`, so `data/` is added. Brief's rule: stripped `data/raw` is not `data`, so `/data/` is added. This is the expected result.
- **A file holding `database/`.** Unchanged tree: `data/` is added. Brief's rule: stripped `database` is not `data`, so `/data/` is added. This is the expected result.
- **A file holding `.env*` and `!.env.example`.** Unchanged tree: `.env` and `.env.*` are appended after `!.env.example`, and `.env.*` then excludes `.env.example` again. Brief's rule: neither line is the exact line `.env*`, so both are added above `!.env.example`, and `.env.example` stays in. This is the expected result.
- **A project with no `.depositignore`.** Unchanged tree: research item 3 (`SKILL.md` line 273) writes the list, whose folder lines are unanchored (`sed -n 84,99p` printed `data/` ... `secrets/`). After item 1 the list holds the four anchored lines and `secrets/`, and line 273 needs no change. This is the expected result.
- **The feature map.** Unchanged tree: `kinds.md` lines 54 to 56 give no status to a capability the code holds with no test. After item 4, such a capability reads `untested`, code with a test reads `works`, and code that holds part of a capability reads `partial`. This is the expected result.
- **officium.** Unchanged tree: `handbook` runs no repository command (Steps 1 to 11 as read). The case was checked against the new text by reading the run record `agents/runs/8-officium/stop-2-drafts.md`; officium itself was not opened. Its `package.json` scripts table gives `format:check` = `prettier --check .`, `lint` = `eslint .`, `check` = `svelte-kit sync && svelte-check ...`, and `format` = `prettier --write .`. The new Steps 2 keeps `npm run format:check` and `npm run lint`. It leaves out `npm run check` (a type check, and a script that runs `svelte-kit sync`), `npm test`, `npm run build` and `npm run format` (it writes into the repository). The run record shows the generated `manual.html` failing `prettier --check` ("Code style issues found") and `.prettierignore` not listing `docs/`. The new Steps 8 answers that failure with the drafted exclusion `docs/user/manual.html` in `.prettierignore`. Two parts of the case were not run in this step: that the baseline passes and that the commands pass with the exclusion. Running them needs officium, which the dispatch forbids.
- **A repository that names no format or lint command.** Unchanged tree: the first stop has no such line. New Steps 5 bullet: "Show, for a repository that names no format or lint command, that it names none, with the files searched." New Steps 8: "A run with no such command goes on to Steps 9 with no command run." This is the expected result.
- **A run whose kinds leave out the diagrams.** Unchanged tree: only Steps 7 makes a scratch folder. New Steps 8: "Make the scratch folder with `mktemp -d` when Steps 7 did not make one." This is the expected result.
- **`python3 docs/figures/gen_figures.py`.** First run on the unchanged tree: `exit: 0`, and `git status --short docs/figures` printed nothing. After the change: `exit: 0`, and `git status --short docs/figures` printed:

```
 M docs/figures/code/handbook.svg
 M docs/figures/gen_figures.py
```

`gen_figures.py` is the source the brief names for change. `docs/figures/code/handbook.svg` is the only figure that changed.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. The deposit list anchored | DONE | `sed -n '/^## The deposit/,/^- `\/attic/p' skills/academic/researcher/references/project_layout.md \| grep -c -x -e '/data/' -e '/attic/' -e '/results/' -e '/figures/' -e 'secrets/'` | `5` |
| 2. The rule for a `.depositignore` that exists, written once | DONE | `git grep -n depositignore -- skills docs` (readme item 3 now names the section) | `skills/academic/researcher/SKILL.md:447:   - Draft `<code folder>/.depositignore` as `references/project_layout.md`, "The deposit", gives it: the section's lines for a new file, and its rules for adding them to a file that exists.` |
| 3. research's first writing unchanged | DONE | read of `SKILL.md` line 273 and `project_layout.md` "research" item 3 bullet | both unchanged |
| 4. `untested` status | DONE | `sed -n '/^## A feature map/,/^## Diagrams/p' skills/code/handbook/references/kinds.md \| grep -n '`untested`'` | `5:  - `untested`: the code holds all of it and no test covers it;` |
| 5. The new Steps 8 of handbook, renumbering, stops, Rules, description | DONE | `grep -n 'Steps [0-9]' skills/code/handbook/SKILL.md` | every reference to the old 8 to 11 reads 9 to 12 (list under "Terms") |
| 6. ADR 0061 and its row | DONE | `tail -1 docs/adr/README.md` | `\| [0061](0061-handbook-checks-the-files-it-writes-with-the-repository-s-own-format-and-lint-commands-on-a-copy.md) \| handbook checks the files it writes with the repository's own format and lint commands, on a copy \|` |
| 7. The figure | DONE | `python3 docs/figures/gen_figures.py; echo "exit: $?"; git status --short docs/figures` | `exit: 0`, ` M docs/figures/code/handbook.svg`, ` M docs/figures/gen_figures.py` |
| 8. Every page that states the rules follows | DONE | greps under "Item 8's greps" | see there |
| Verify 1a, glossary sync | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` |
| Verify 1b, character set | DONE | the brief's `printf ... \| xargs -0 perl ...; echo "exit: $?"` over the ten paths | `exit: 0` (nothing else printed) |
| Verify 2a, no unanchored folder line | DONE | `git grep -n -e '^data/$' -e '^results/$' -e '^figures/$' -e '^attic/$' -- skills/academic/researcher/` | nothing printed, exit 1 |
| Verify 2b, the count of the section | DONE, prints 9, not 5 | `sed -n '/^## The deposit/,/^## A README/p' skills/academic/researcher/references/project_layout.md \| grep -c -x -e '/data/' -e '/attic/' -e '/results/' -e '/figures/' -e 'secrets/'` | `9` (see "Anything in the brief that was wrong") |
| Verify 3, figures | DONE | as item 7 | as item 7 |
| Verify 4, description lengths | DONE | the command of `docs/dev/skill-layout.md`, filtered with `grep -E 'handbook\|researcher'` | `1015 skills/academic/researcher/SKILL.md`, `1021 skills/code/handbook/SKILL.md` |
| Verify 5, list items and sentence length read | DONE | read | departures listed under "Judgment calls" |

## Item 8's greps

- `git grep -n depositignore -- skills docs README.md`: the hits at `researcher/SKILL.md` lines 10, 80, 273, 281, 421, 444, 446, 460 and 731, `project_layout.md` lines 21, 82 and 106, ADR 0053 line 20 and ADR 0057 line 14 still hold. Line 447 and the old line 108 changed. ADR 0057 line 14 names the folders in prose and stays true, as the brief says.
- The four folder lines: the hits outside the deposit section are the glossary entry **clean copy** (line 156), ADR 0057 lines 14 and 26, `project_layout.md` lines 32 and 71, the paper skill's manuscript `figures/` folder, and `submit`'s `sheet_agent.md` line 39, which gives `results/` as an example line of a leave-out list. They name folders, not lines of the list, and none is made false.
- `works`, `partial`, `planned`, `untested`: `kinds.md` and glossary line 167 changed. `handbook` Steps 2 said "each with the files that hold it and the test that covers it". That sentence presumed every capability has a test, so it now adds ", or that no test covers it". The other hits are in other skills (`paper-review-panel`, `researcher`'s compliance protocol, `codebase-design`) and use the words in their own senses.
- The renumbered steps: `git grep -n -E 'Steps [0-9]'` over `skills/code/handbook`, `docs/glossary.md`, `docs/figures/gen_figures.py` and ADRs 0058 and 0060. The hits that named the old Steps 8 to 11 now name 9 to 12, in `SKILL.md` (Steps 6, 7, 9, 10, 11, 12, Stops, Anti-patterns and Rules) and in glossary lines 148 and 191. `kinds.md` (Steps 3) and `diagrams.md` (Steps 7) name unchanged steps, so `diagrams.md` needed no edit. No page outside `handbook`'s folder and the glossary names a step of `handbook` (`git grep -n handbook -- skills README.md docs/dev docs/roadmap.md ':!skills/code/handbook'`).

## Terms

- **feature map, of `handbook`** (changed): it now reads "with its status, `works`, `untested`, `partial` or `planned`". Its Stated in, `kinds.md` "A feature map", was checked with `sed -n '/^## A feature map/,/^## Diagrams/p' ... | grep -n`, which prints all four statuses on lines 4 to 7.
- **API pages, of `handbook`** (changed): its Stated in now reads "Steps 6 and 11". Steps 11 holds "Leave the API pages out of the commit, since they are build output." (`awk '/^11\. /,/^12\. /' ... | grep -n 'API pages'`).
- **scratch folder, of `handbook`** (changed): it now names the copy of the working tree. Its Stated in now reads "Steps 7, 8 and 12". Steps 7 has the bullet "Make a scratch folder outside the repository with `mktemp -d`.", Steps 8 has "Make the scratch folder with `mktemp -d` when Steps 7 did not make one.", and Steps 12 has "Remove the scratch folder of Steps 7 or 8, with the copy of Steps 8 in it."
- Used in a new place: "scratch folder" in Steps 8, the Rules and ADR 0061, in the entry's sense; "kind" in Steps 5, in the sense of **kind, of `handbook`**. The copy of Steps 8 is called "the copy of its working tree" or "the copy", which is not the glossary's **clean copy** (that term belongs to `research`).

## Files with line counts (`git diff --numstat`, `wc -l`)

- `skills/academic/researcher/references/project_layout.md`: +46 -9
- `skills/academic/researcher/SKILL.md`: +1 -1
- `skills/code/handbook/SKILL.md`: +63 -31
- `skills/code/handbook/references/kinds.md`: +2 -1
- `docs/glossary.md`: +3 -3 (lines 148, 167, 191)
- `docs/adr/0061-handbook-checks-the-files-it-writes-with-the-repository-s-own-format-and-lint-commands-on-a-copy.md`: new, 27 lines
- `docs/adr/README.md`: +1
- `docs/figures/gen_figures.py`: +9 -2 (inside `handbook()`)
- `docs/figures/code/handbook.svg`: +86 -75 (written by the script)
- `skills/code/handbook/references/diagrams.md`: unchanged, because no sentence in it is made false.

## Judgment calls the brief left open

- **The description of `handbook`.** Adding the check and the exclusion took it past 1,024 characters. To get it to 1,021, the kinds list drops three qualifiers: "with its core" after the README, "drawn by a Python engine it copies" after diagrams, and "by the language's own tool" after the API pages. "keeps every fact of a page that exists" is folded into the drafting clause. Each dropped qualifier is still stated in the introduction and the Steps. The `Triggers on:` list is unchanged.
- **The comment line of the added lines.** The example writes it as `# Left out of a public deposit`. The rule asks for one comment line and does not fix its text.
- **The example in `project_layout.md`.** It shows the whole draft, all 13 added lines, because a partial list would misstate the rule.
- **The copy.** The step copies only listed files that "stand on disk". `ls-files --cached` also lists a tracked file deleted in the working tree, and such a file cannot be copied.
- **The tool check.** For a format or lint command it sits in Steps 3, beside the API tool's check: `command -v`, or `test -x` for a tool inside the repository such as `node_modules/.bin/prettier`.
- **What it reads 10.** A new item, the output of the commands, in the form items 8 and 9 already use for tool outputs.
- **The ruff example.** It names `ruff.toml` before `pyproject.toml`, as the brief does. Ruff also reads `.ruff.toml` first. The brief did not name it, so it is left out.
- **Departures from the length and list rules (Verify 5):**
  - The bullet "A folder line of the list, such as `/data/`, is had when ..." runs to about 35 words. The condition has to stay whole in one bullet because each part is a qualifier of the rule.
  - The Steps 8 bullet "Put each draft and each file the run generates at its path in the copy: ..." runs to about 50 words, because it lists the files the step names.
  - The Steps 2 bullet that names the commands, and the description sentences, run to 30 or 40 words, because each holds a list of examples.
  - Every other new sentence is under about 25 words, one rule per bullet.

## Host- or user-visible changes

- **`researcher` readme mode.** Before: an existing `.depositignore` got each list line it lacked, appended at the end, unanchored, such as `data/` beside `/data/` and `results/` after `!results/...`. After: the four folder lines are anchored, a folder already covered is not added again, and the added lines go above the first `!` line under one comment. The draft names the line that has each line not added.
- **`researcher` research item 3.** Before: a new `code/.depositignore` held `data/`, `attic/`, `results/` and `figures/`. After: it holds `/data/`, `/attic/`, `/results/` and `/figures/`. Every other line is unchanged.
- **`handbook` feature map.** Before: three statuses. After: four, with `untested` added for code with no test.
- **`handbook` run.** Before: 11 steps, and no repository command was run. After: 12 steps, and in the new Steps 8 the repository's format and lint commands run on a copy of the working tree in the scratch folder. The first stop shows the commands found and those left out. The drafts stop shows each command's output before and after, each corrected draft and each drafted exclusion. An approved exclusion is written and committed with the other drafts.
- **The figure `docs/figures/code/handbook.svg`.** It gains the box "The repository's format and lint commands run on a scratch copy holding the drafts", with the edges D and G into it, it into "The drafts", and its own loop "a failure in a file of the run: corrected, at most 3 times".

## Anything in the brief that was wrong or impossible

- **Verify 2's count.** The brief expects 5 and the command prints 9. The `sed` range runs from `## The deposit` to `## A README`, so it also covers the made-up example that item 2 asks for in the same section. The example's draft holds the lines `/data/`, `/attic/`, `/figures/` and `secrets/`. `grep -n -x` over the range prints the five list lines at range lines 6 to 9 and 19, and the four example lines at 52 to 54 and 64. Limited to the list, the range from `## The deposit` to the first bullet, the count is `5`. The example was not changed to fit the check.
- **The officium case.** Two parts of it need officium itself: that the baseline passes, and that the commands pass with the exclusion. The dispatch forbids reading or running that repository, so those two parts were checked against the step 8 run record and not run here.
