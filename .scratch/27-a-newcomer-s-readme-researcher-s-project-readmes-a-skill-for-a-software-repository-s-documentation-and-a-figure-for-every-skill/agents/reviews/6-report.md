# Report: step 6, Ordo's README rewritten for a newcomer and "Working on Ordo" moved to its own page

Everything in the brief is done.

## Open items of the state file, verbatim

None.

## The cases' first run, on the unchanged tree (base 1966241)

- **The README's images.** `grep -o '!\[[^]]*\]([^)]*)' README.md | wc -l` printed `27`. `test -f` exited 0 for each of the 27 paths, among them `docs/figures/orchestration/pipeline.svg`, `docs/figures/orchestration/plan-loop.svg` and `docs/figures/academic/paper/lifecycle.svg`; `docs/figures/academic/researcher/lifecycle.svg` was not among them. Red, as expected before the change.
- **Every figure path.** `git grep -ohE 'docs/figures/[A-Za-z0-9_/.-]*\.(svg|py)' -- README.md docs skills ':!docs/roadmap.md' | sort -u | while read -r f; do test -f "$f" || echo "MISSING $f"; done` printed nothing.
- **"Working on Ordo".** `git grep -n --untracked 'Working on Ordo' -- ':!.scratch'` printed four lines: `README.md:247:## Working on Ordo`, `docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md:7:` (the Context line ending `(`README.md`, "Working on Ordo").`), `docs/dev/change-standard.md:96:` (ending `(`README.md`, Working on Ordo).`) and `docs/glossary.md:181:` (the entry **pin**, "Stated in: `README.md`, "Working on Ordo"; ..."). Red.
- **The new page.** `ls docs/dev/working-on-ordo.md` printed `ls: docs/dev/working-on-ordo.md: No such file or directory`. Red.
- **The citations.** `grep -n 'working-on-ordo.md' docs/dev/change-standard.md docs/glossary.md docs/adr/0044-*.md` printed nothing, exit 1. Red.
- **The skills tables.** `grep -n '^### ' README.md` printed `147:### With the skills CLI` and `166:### By copying the folders`; `grep -c '^| `' README.md` printed `24` (one table, no `handbook` row). Red.
- **Each row's text.** Read: the 24 rows of the one table are one to twenty sentences each (the `researcher` row runs to several hundred words). Red.
- **The first paragraph.** Read: README line 3 states "The skills carry no project name and no path. Everything specific to a repository comes from that repository's `plan.yaml`, the plan configuration." Holds.
- **The other citations of the README.** Read: line 3 states the C++ engine, TypeScript tool or research project (ADR 0058), line 5 the fresh reviewer that changes nothing (ADR 0003), line 38 the five group folders (ADR 0048). Holds.
- **The loop.** Read: README line 5 states the loop as the glossary entry **loop, in the README** defines it. Holds.
- **The install.** `grep -n 'By copying the folders\|for skill in orchestration/' README.md` printed line 166 and line 172. `npx skills add TheAxeC/ordo --skill '*' -g -a claude-code` stood at line 150, and the four agent commands at lines 158 to 161. Red on the first half.
- **The sections removed.** `grep -n '^## Configuring a repository\|^## The landing script\|^## Working on Ordo' README.md` printed lines 185, 239 and 247; `grep -n '^#### `plan.yaml`$' README.md` printed nothing, exit 1. Red.
- **The facts kept.** Read: no list existed before the change. Not applicable on the unchanged tree.
- **A newcomer's reading.** Read: the first sentence says what Ordo is; the skills table's rows run to several hundred words and use terms such as "quoted ruling", "brief check" and "base binaries" before any explanation; no "How to use" section exists. Red.
- **The README's length.** `wc -l README.md` printed `270 README.md`; `wc -c README.md` printed `76528 README.md`.
- **The glossary.** `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.

No case of the brief's own rules gave a wrong result on the first run, so no ruling was needed.

## DONE / NOT DONE

Every command below was run from the worktree's root after the change, under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` for the Python script.

| Item | State | Command | Output |
|---|---|---|---|
| 1. README rewritten | DONE | `wc -l README.md`; `wc -c README.md` | `149 README.md`; `17746 README.md` (was 270 and 76528) |
| 1. Three images, each a file | DONE | `grep -o '!\[[^]]*\]([^)]*)' README.md \| wc -l`; the paths with `test -f` | `3`; `docs/figures/orchestration/plan-loop.svg`, `docs/figures/academic/paper/lifecycle.svg`, `docs/figures/academic/researcher/lifecycle.svg`, each `test -f exit 0` |
| 1. Alt texts | DONE | Python: each `![...]` against the old README's alt text and `html.unescape` of the SVG's `aria-label` | `plan-loop.svg equals old alt: True`; `paper/lifecycle.svg equals old alt: True equals aria-label: True`; `researcher/lifecycle.svg equals aria-label: True` |
| 1. Five tables, 25 rows | DONE | `grep -n '^### `skills' README.md`; per-heading row count; `ls -d skills/*/*/ \| xargs -n1 basename \| sort \| diff - <rows>` | headings at 13, 26, 34, 44, 56; `8 orchestration`, `3 ordo`, `5 code`, `7 academic`, `2 explain`; diff printed nothing, then `rows equal ls -d skills/*/*/ (25)`; `handbook` in the code table |
| 1. Rows of at most 25 words | DONE | Python word count of each row's cell (whitespace tokens) | highest counts `25` (`codebase-design`, `diagnose`, `plan`, `wizard`); no row has a second sentence (no `. ` or `; ` in any cell) |
| 1. Install by copying gone, CLI and agents kept | DONE | `grep -n 'By copying the folders\|for skill in orchestration/' README.md`; `grep -n -F "npx skills add TheAxeC/ordo --skill '*' -g -a claude-code" README.md` | nothing, `exit 1`; `129:npx skills add TheAxeC/ordo --skill '*' -g -a claude-code`; agent commands at lines 137, 138, 139, 140 |
| 1. Sections removed, `plan.yaml` subheading | DONE | `grep -n '^## Configuring a repository\|^## The landing script\|^## Working on Ordo' README.md`; `grep -n '^#### `plan.yaml`$' README.md` | nothing, `exit 1`; `93:#### `plan.yaml`` |
| 2. New page | DONE | `diff <(git show 1966241:README.md \| sed -n 249,266p) <(sed -n '3,$p' docs/dev/working-on-ordo.md)` | no output, then `IDENTICAL`; line 1 `# Working on Ordo`; line 8 holds `utils/pin.sh v1.1.0`, line 9 `utils/pin.sh` with no tag |
| 3, 4, 5. Citations | DONE | `grep -n 'working-on-ordo.md' docs/dev/change-standard.md docs/glossary.md docs/adr/0044-*.md README.md` | `docs/dev/change-standard.md:96:`, `docs/glossary.md:181:`, `docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md:7:`, `README.md:145:` |
| 6. Nothing else touched | DONE | `git status --short --untracked-files=all` | ` M README.md`, ` M docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md`, ` M docs/dev/change-standard.md`, ` M docs/glossary.md`, `?? docs/dev/working-on-ordo.md`, and this report |
| Verify 1, character set | DONE | the brief's character-set command of "Verify before you report" 1, run as written, after `test -f` of each file; `LC_ALL=C grep -c '[^ -~]' README.md` | see the line under this table |
| Verify 2, glossary | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` |
| Verify 3 | DONE | `grep -o '!\[[^]]*\]([^)]*)' README.md \| sed 's/.*](//; s/)$//'` with `test -f` | the three paths of "Cases", each `test -f exit 0` |
| Verify 4 | DONE | the brief's figure-path loop | nothing |
| Verify 5 | DONE | `git grep -n --untracked 'Working on Ordo' -- ':!.scratch'` | `docs/dev/working-on-ordo.md:1:# Working on Ordo` |
| Verify 6 | DONE | as items 3 to 5 | line 96, line 181, line 7 and `README.md:145` |
| Verify 7, hard wraps | DONE | `awk '/^```/{c=!c;next} !c && NF && !/^#/ && !/^\|/ && !/[.:)]$/'` over both files, and reading | nothing printed; every prose line of both files ends a paragraph or a bullet |
| Verify 8 | DONE | `git status --short --untracked-files=all` | as item 6 |
| Verify 9, list items and sentences | DONE | reading, and a Python count of sentences over 30 words | the departures are under "Judgment calls" |

The character-set line: `test -f` exited 0 for each of the six files, the brief's command printed nothing and then `exit: 0`, and `LC_ALL=C grep -c '[^ -~]' README.md` printed `0`.

Other reads: `awk 'prev=="" && $0=="" ...' README.md docs/dev/working-on-ordo.md` printed no double blank line; `grep -n ' - \| -- '` over both files, bullets left out, printed nothing.

## The terms

- **pin**, its "Stated in" changed to `docs/dev/working-on-ordo.md; utils/pin.sh, its head comment`. `grep -n 'pin.sh <tag>\|with no tag' docs/dev/working-on-ordo.md` prints line 14 (`Check mode, `utils/pin.sh` with no tag, ...`) and line 16 (`... `utils/pin.sh <tag>` ...`), and line 8 is `utils/pin.sh v1.1.0      # the worktree ~/.local/share/ordo-stable at v1.1.0, every skill and every agent linked from it`, so the page states the entry.
- **loop, in the README**, unchanged, "Stated in: `README.md`, the introduction". README line 5 states it: roadmap entry, plan in a ledger folder, a brief per step, the build in its own git worktree, the fresh reviewer, the cherry-pick onto `main` after its checks pass there.
- **plan configuration**: README line 3 uses it as "`plan.yaml`, the plan configuration"; the "`plan.yaml`" subsection states the search order and the relative paths as the entry does.
- **roadmap entry**: line 5, "an item of the repository's ordered list of planned work", within the entry's sense.
- **ledger**: line 5, "a ledger folder that holds its step list, its briefs and its reviews", within the entry (`plan.md`, `agents/briefs/`, `agents/reviews/`).
- **brief**, **worktree**, **reviewer**, **step**, **plan**: line 5, each in the entry's sense.
- **plan skills**: line 89 lists them as the entry does: `plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`.
- **gate**: the order of use, "its gate (the check that proves it done)", the entry's sense.
- **repair round**: the order of use, "a repair round: the findings are fixed in the same worktree"; the entry says the findings go back to the same builder, which works in the step's worktree.
- **stop**: line 85, "an orange box a stop where the run waits for you", the entry's second sense.
- **verify list**: line 103, "the plan's verify list (the commands that must pass) ... through `checks.sh`", the entry's sense.
- **cost script**: line 101, `plan_cost.py` of `plan-orchestration`, pricing each agent role from the response bodies and else from the transcripts as a lower bound, the entry's sense.
- **build driver**: not used; the `ordo-init` row says "the script `utils/build.py`".

## Files with line counts

- `README.md`: 149 lines (`wc -l`), 17746 bytes.
- `docs/dev/working-on-ordo.md`: 20 lines, new.
- `docs/dev/change-standard.md`: line 96 changed (`git diff --stat`: 2 +-).
- `docs/glossary.md`: line 181 changed (2 +-).
- `docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md`: line 7 changed (2 +-).
- This report.

## The facts of the old README and where each stands now

Places named "SKILL.md" are the skill's `skills/<group>/<name>/SKILL.md`. "New README" means `README.md` after the change.

### The introduction (old lines 3 to 7)

- Ordo is a set of agent skills for Claude Code that run a multi-step change as a plan: new README line 3.
- No project name, no path, everything from `plan.yaml`: new README line 3, the first paragraph.
- C++ engine, TypeScript tool or research project: new README line 3.
- The loop (roadmap entry, plan in a ledger folder, brief, worktree, fresh reviewer, cherry-pick after checks pass): new README line 5.
- `ordo-init` sets a repository up; `roadmap` keeps the entries; `grill` settles design decisions; `diagnose` finds the cause of a defect in a plan or on its own; `plan-retro` turns recurring findings into rules; `session-retro` reads transcripts and proposes changes: the new rows of each in "The skills".

### The 24 table rows (old lines 13 to 36)

Each row is replaced by its row in the table of its group. A fact of an old row that the new row leaves out stands in the skill's own `SKILL.md`, which the old row was written from; checked by `grep -c -i -F` of a distinctive phrase of each row in that file, each count at least 1 unless named here:
- `ordo-init`: skills-lock.json (5), `.gitignore` (9), the build driver unless answered no ("Steps / A new repository" 9).
- `roadmap`: capability map (5), Not yet specified (16).
- `grill`: reference line (10), lazy option (4), Agents section (3), `--self-rule` (26).
- `plan`: refuses an entry not yet specified ("Not yet specified" 2), `orchestrator-state.md` (4).
- `spec`: base binaries (3), in flight (18), brief check (38).
- `refute`: whole verify list (2), failure scenario (4).
- `diagnose`: scratch copy (7), three to five (4), diagnosis record (4).
- `land`: its description in SKILL.md.
- `plan-orchestration`: `self_rule` (19), `next_entry` (7).
- `ordo-help`: "I want to revise a paper" (2), Quick start (15).
- `plan-retro`: its description (the rule sentence, text change, standards page, a check only for a fact).
- `session-retro`: time window (1), decides (1).
- `wait-what`: Simplified Technical English (1), glossary (4), `disable-model-invocation` (1), writes no file (2).
- `tutor`: `--page` (10), trusted resources (2). "You and the model both invoke it": the frontmatter carries no `disable-model-invocation`, and `docs/dev/skill-layout.md`, "Frontmatter", says every other skill leaves the key out; ADR 0048's Decision states it for `tutor`.
- `writing`: `.docx` (9), numbered (1), no replacement (2).
- `code-comments`: `strip_comments.py` (4), apply all (5), false comments first (1).
- `wizard`: hidden (2), GitHub variable (3), irreversible (4), never runs (1).
- `codebase-design`: temporary folder (2), before and after (1), `/roadmap add` (5), counted (4). "Loads nothing from the network": `skills/code/codebase-design/references/report.md` line 3 and SKILL.md's Anti-patterns row "A report that loads a style or a script from the network".
- `paper`: `paper-runs/` (4), `pdftocairo` (3), `lookup.py resolve` (1), Generator-Evaluator (7), autonomous writer (2), number of sources (1).
- `paper-review-panel`: `paper-review-panel-runs/` (1), sprint contract (13), just fix it (3), calibration (23); the seven dimensions: "7 review dimensions", its "What it reads" table row for `references/quality_rubrics.md`.
- `referee`: `referee-runs/` (1), new-issue agent (2), revision roadmap (2), the budget (its Steps, "Ask the budget").
- `researcher`: `researcher-runs/` (2), `code/attic/` (7), `.depositignore` (10), `run_all.sh` (10), `add_experiment` (3), login node (4), `--manuscript <name>` (10), 3 correction rounds (3).
- `submit`: `submit-runs/` (4), curl (2), cookie (3), second fill (3), converts no file (1); "you and the model both invoke it" as for `tutor`, by the frontmatter.
- `grant`: `grant-runs/` (2), `grant-config/` (9), `grant-fields.md` (25), CV (1), the engine the application uses (its Steps, "Find the engine once").
- `handbook` had no row; it has one now.

### The sentence on the group folders (old line 38)

- The five group folders: new README line 11, one sentence.
- Which skill stands in which group: the five tables, one per group folder under its `###` heading.
- Installed, the skills stand side by side in one folder under their own names, such as `~/.claude/skills/plan`: new README line 11. The count "twenty-five" is the count of rows of the five tables.

### The order of use (old lines 40 to 68)

- `/ordo-init`, `/roadmap add <goal>`, `/grill <entry>` (optional), `/plan <entry>`, `/spec`, "build it", `/refute`, "close them", `/land`, `/plan-orchestration`: new README, "How to use", the command block.
- `/ordo-init build`, `/roadmap add <entry>`, `/diagnose <entry> <step> <finding>`, `C<n> Agree`, `C<n> => <your ruling>`, `/plan-orchestration <entry>`, `/plan-retro`, `/session-retro <entry>`, `/diagnose <symptom>`, and the longer text of each line: `skills/ordo/ordo-help/SKILL.md`, "The sequence, printed verbatim".
- `/ordo-help` prints the full sequence with what to do when a command stops: new README line 83.

### The paragraph on how the figures are drawn (old line 70)

- Box, solid, dashed, orange, dotted arrow, dotted loop, grey box, rounded box, scripts left out except where named: `docs/figures/gen_figures.py`, its head comment ("A box is an agent start ...") and its `Legend(...)` rows; each figure's own legend. The new README line 85 gives the legends of the three figures it shows.
- A stop waits each time unless the run is under a quoted ruling; under `self_rule: on` a stop waits only when `plan-orchestration` leaves it open (one of its six kinds, `/roadmap` except an `add` a finding names, `/ordo-init`): `skills/orchestration/plan-orchestration/references/self-rule.md`, "The six kinds left open" and its bullets on `/roadmap` and `/ordo-init`; each skill's Stops for the quoted ruling.
- The figures other than the three and the paragraphs that introduce them (old lines 72, 74, 78 to 128): left out, as the goal says; each figure stands under `docs/figures/<group>/`, which new README line 85 links.

### `## Requirements` (old lines 134 to 139)

- git, POSIX `sh`, `python3` with PyYAML; `checks.sh` also needs `bash`: new README "Requirements", item 1.
- `perl` for the ASCII check and `sync_rules.test.sh`: item 2.
- `node` and `npx` on `PATH` for the skills CLI, used by the install and by `ordo-init`'s project skills: item 3.
- Claude Code: item 4.

### `## Install` (old lines 141 to 183)

- Install all skills, since they call each other and read each other's templates: new README "Install", first paragraph.
- Claude Code reads skills from `~/.claude/skills` or `$CLAUDE_CONFIG_DIR/skills`: "Install", the paragraph after the first command.
- Remove copies under `.agents/skills` or `.claude/skills`: "Install", first paragraph.
- Five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, read from `~/.claude/agents` or `$CLAUDE_CONFIG_DIR/agents`: "Install", third paragraph.
- `CLAUDE_CODE_EFFORT_LEVEL` must be unset: "Install", last paragraph; also `spec` Steps 1, `refute` Steps 1, `plan-orchestration` Steps 1, `grill`, `diagnose`.
- The warning for a missing `ordo-<level>` agent and the default agent with no model and no effort: "Install", last paragraph.
- `writing`, `code-comments`, `codebase-design`, `paper`, `paper-review-panel`, `referee`, `submit`, `grant` start every agent on the default agent: "Install", last paragraph.
- `npx skills add TheAxeC/ordo --skill '*' -g -a claude-code`: "Install", first code block.
- The CLI finds each skill in its group folder, copies it into `~/.agents/skills`, links it from `$CLAUDE_CONFIG_DIR/skills` or `~/.claude/skills`: "Install", second paragraph.
- Second account: rerun with `CLAUDE_CONFIG_DIR` set: "Install", second paragraph.
- `npx skills update -g`, `npx skills ls -g`, `npx skills remove --global <skill>`: "Install", second paragraph.
- The CLI installs skills only; after `add` and each `update -g`, copy the agents from a clone, and the four commands: "Install", third paragraph and second code block.
- Second account for the agents: "Install", last paragraph, first sentence.
- `### By copying the folders`, its loop and its paragraph (old lines 166 to 183): left out, as the goal says.

### `## Configuring a repository` (old lines 185 to 237)

- `/ordo-init` in an empty folder (no tracked file) sets up a new repository: new README "`plan.yaml`", first paragraph; `ordo-init` SKILL.md, Steps 1 and "Steps / A new repository".
- Its questions (name, kind, license, commit rule, standards pages, user interface, project skills, build driver): `skills/ordo/ordo-init/references/new-repository.md`, "The questions" 1 to 11.
- It shows the whole tree and every file's text: new README "`plan.yaml`", first paragraph; `ordo-init`, "Steps / A new repository" 4.
- What it writes (`CLAUDE.md`, the standards, the standards pages with their defaults, roadmap, glossary, ADR folder, `.gitignore`, `LICENSE`, `README.md`): `ordo-init` description and `references/new-repository.md` "The tree" and question 6.
- The project skills installed, `skills-lock.json` written: `ordo-init`, "Steps / A new repository" 6.
- `docs/plan.yaml` drafted for approval: new README "`plan.yaml`", first paragraph; `ordo-init`, "Steps / A new repository" 8.
- The build driver in a new repository unless answered no and when `docs/dev/building.md` names a command, and in an existing one only by `/ordo-init build`: `ordo-init`, "Steps / A new repository" 9 and "Steps / An existing repository" 3 (last bullet); `references/new-repository.md` question 11; the new `ordo-init` row names `build`.
- It writes no Claude Code settings file: `ordo-init`, Rules ("The skill never writes a Claude Code settings file").
- The shared-rules markers and the copy of `templates/shared-rules.md`; the plan-terms markers and the copy of `templates/plan-terms.md`; the project's own terms after the block: `skills/ordo/ordo-init/templates/sync_rules.py`, its head comment; `skills/ordo/ordo-init/templates/CLAUDE.md` line 5 and `templates/docs/glossary.md` lines 5 to 8 ("## Project terms" after the block); glossary entries **shared-rules block** and **plan-terms block**.
- On a repository with a `plan.yaml`: check, then compare both blocks, show each differing block's diff, rewrite after approval: new README "`plan.yaml`", first paragraph; `ordo-init`, "Steps / A configured repository" 1, 7 and 9.
- No block yet: draft where it goes and what it replaces: `ordo-init`, "Steps / A configured repository" 10.
- The comparison on its own, `--only glossary` for a repository whose `CLAUDE.md` has no block, `--glossary <path>` resolving inside the repository, and the three command forms: `sync_rules.py`, its head comment (Usage line, the `--only glossary` sentence, the usage-line errors for `--glossary`); `ordo-init`, "Steps / A configured repository" 7 and line 384; `docs/dev/scripts.md`.
- `<skills>` is `~/.claude/skills`, and in a clone a skill's folder is `skills/<group>/<name>`: new README line 11 (the group folders and the installed folder); `utils/pin.sh`, head comment line 22.
- `/ordo-init [<path>] [<folder>]` passes the glossary the `standards` list names: `ordo-init`, Quick start and "Steps / A configured repository" 7, first bullet.
- An existing repository opts in with a `plan.yaml`; the search order; paths relative to the file's folder; the folder in front of the entry (`/plan apps/web/12`): new README "`plan.yaml`", second paragraph; `plan`, "What it reads" 1.
- Run `/ordo-init` from the repository root: new README "`plan.yaml`", first paragraph.
- Existing repository: draft `docs/plan.yaml`, shown with pages and `.gitignore` lines; the same draft holds the shared rules and plan terms, inserted with rules or entries listed for removal or written from the template; written after approval, then a block already there compared in the same run: new README "`plan.yaml`", first paragraph in short; `ordo-init`, "Steps / An existing repository" 10 to 15 and "Steps / A configured repository" 10.
- `check_config.py` checks the file; `--find` prints the file the search order finds; the two command forms: `ordo-init`, "What it reads" 4 and "Steps / A configured repository" 1; `check_config.py`, its head comment (Usage).
- The two example files and the two `cp` commands, `plan.projects.yaml` giving `<project>/<entry>`: new README "`plan.yaml`", third paragraph; `plan`, "What it reads" 1, last bullet; `templates/plan.yaml` line 1 ("Copy it to docs/plan.yaml").
- The example describes every key, its paths written for a file in `docs/`: new README third paragraph; `templates/plan.yaml` lines 1 to 3 and its key comments.
- Eight required keys; a missing one stops the skill and is named: new README third paragraph (the eight keys); `templates/plan.yaml` line 2 and the `required` comments.
- Every other key optional, its default in the comment, a path default read from the repository root, the examples `worktree_root`, `worktree_paths`, `look`: new README third paragraph ("the default of each optional one", `.agents/worktrees`); `templates/plan.yaml` line 3 and the comments of `worktree_root`, `worktree_paths` and `look`.
- Git must ignore the worktree root and not the `plan.yaml`: new README third paragraph; `ordo-init`, "Steps / An existing repository" 10 and "Steps / A configured repository" (the two report bullets); `plan`'s `templates/plan.yaml`, the `worktree_root` comment.
- The `.agents/plan.yaml` note (found in the fourth place, paths read from `.agents/`, `../` or a move to `docs/plan.yaml`, `check_config.py` names each page it does not find by its resolved path): new README "`plan.yaml`", second paragraph.
- A plan's verify list is the `verify:` key of the first `yaml` or `yml` block of `orchestrator-state.md`, run by `checks.sh`: new README "`plan.yaml`", last paragraph (in short); `land`, "The landing script" (the `checks.sh` bullets); `checks.sh`, its head comment; glossary **verify list**.
- Each command runs through `bash -o pipefail -c` and passes on exit 0; every command runs; each failure printed; the count of failures: `land`, "The landing script"; `checks.sh`, its head comment; `docs/dev/building.md` line 26.
- Commands that depend on each other joined with `&&`; each command exits non-zero when it fails; long output uses quiet mode or a filter under `pipefail`: `docs/dev/building.md` line 33.
- The head comment of `checks.sh` states what it prints and its exit statuses: the head comment itself.
- The cost script, run at the closing step when a plan started an agent, pricing each agent role from the response bodies kept under `CLAUDE_CODE_ENABLE_TELEMETRY=1` and `OTEL_LOG_RAW_API_BODIES=file:<folder>`, else from the transcripts as a lower bound; the folder grows and holds each prompt; the script reads the variable from its environment or the `env` key of the three settings files; a tool's shell does not receive it: new README "`plan.yaml`", fourth paragraph; `plan-orchestration`, "Usage"; `plan_cost.py`, its head comment.
- `python3 <skills>/plan-orchestration/templates/plan_cost.py <ledger folder> [<transcript root>]`, on any ledger folder, `<transcript root>` defaulting to `~/.claude/projects`: `plan-orchestration`, "Usage", third bullet; `plan_cost.py`, its head comment (Usage and the default).

### `## The landing script` (old lines 239 to 245)

- `land.sh` does the cherry-pick and the checks on `main` as one command: new README "`plan.yaml`", last paragraph; `land`, "The landing script".
- The command line with its four arguments, `<slug>` and `<plan.yaml>`: `land`, "The landing script", first bullet and its sub-bullets.
- It runs from the `land` skill itself, and nothing is copied into the ledger: new README "`plan.yaml`", last paragraph.
- It reads `worktree_root` and `ledger_root` from the given `plan.yaml` only, relative to its folder; exit 64 on a missing fourth argument or `ledger_root`; the default `worktree_root`; the `projects:` form: `land`, "The landing script", second bullet and its sub-bullets.
- After main's cherry-pick it runs the verify list through its own `checks.sh`: new README; `land`, "The landing script", third bullet.
- It prints the diff stat and the staged paths: `land`, "The landing script" ("It then prints the booking data").
- An uncommitted ledger file never reaches `main`, one a commit holds does: `land`, Steps 5, the bullet on `templates/land.sh` and the ledger root.
- `land.test.sh` proves `land.sh` on scratch repositories: `land`, "The landing script", the `land.test.sh` bullet.
- The section states the refusals and exit statuses: `land`, "The landing script"; the new README names that section.

### `## Working on Ordo` (old lines 247 to 266)

- Every sentence and both lines of the code block: `docs/dev/working-on-ordo.md` lines 3 to 20, identical by `diff` (see the table).

### `## License` (old line 270)

- New README line 149, identical.

## Judgment calls the brief left open

- **The place of the paragraph on how to read the figures.** It stands after the order of use and before `### The plan skills` (line 85), since the brief allows before or after the three figures and the three stand under three subheadings.
- **The legends.** The paragraph names, per figure, the legend items the brief lists that the figure has: the loop's solid box, dashed box, orange box and dotted arrow; the paper lifecycle's solid and dashed box; the research lifecycle's solid box and dotted arrow. The lifecycle figures have no orange box, and their legends say so by having none.
- **The link to `docs/figures/`.** Written as the Markdown link ``[`docs/figures/`](docs/figures/)``, with `docs/figures/<group>/` in code before it; the figure-path check matches no path ending in a folder.
- **The sentence to the new page** (line 145): "To change Ordo itself, with the installed skills held at a tagged version while the change is made, follow [`docs/dev/working-on-ordo.md`](docs/dev/working-on-ordo.md)."
- **Terms in the tables before "How to use".** The `plan` row says "the check that proves it done" for the gate, the `ordo-init` row says "the script `utils/build.py`" for the build driver, and the `codebase-design` row says "a change you pick" for a candidate, so no table row uses a term the README has not explained.
- **"Claude Code's default agent"** in "Install" replaces the old text's "the runner's default agent", since "runner" is not explained in the README; the runner of these skills is Claude Code, so the statement keeps its meaning.
- **Departures from the prose standard's sentence and paragraph lengths, each with its reason:**
  - Line 7, the sentence on the other skills (about 50 words): the brief asks for one sentence naming the code, the paper and research, and the explain skills.
  - Line 11, the sentence on the group folders (about 37 words): the brief asks for one sentence that names the five folders and says how the skills stand installed.
  - Line 85, the paragraph on the figures, six sentences: the brief asks for one paragraph that gives three legends and the link to `docs/figures/`.
  - Line 101, the cost script, two sentences of about 40 words each: the brief asks for the settings in one or two sentences, and the sentences hold the two variables, the three settings files and the lower bound.
  - Lines 97 and 99, sentences of 35 to 42 words: each carries one mechanism (the search order with its example; the two example files with their difference).
  - Line 143, the warning sentence and the list of eight skills: a list of names a reader looks up in place.
- **Semicolons**: two in running prose (line 99 and Requirements item 1), under the prose standard's 2 per 1000 words; the remaining hits of `grep -o ';'` are inside the three alt texts and the code blocks.
- **The `plan.yaml` subsection's length**: 5 source lines of 2676 characters (`sed -n 95,103p README.md | awk 'NF{...}'`). The brief's "at most about 15 lines of text" is met as source lines; rendered at about 100 characters a line it is about 27 lines. It holds every part item 1 names for it, with the facts no other page states.

## Host- or user-visible changes

- `README.md`: before, 270 lines and 76528 bytes, with one 24-row table, 27 figures, `## Configuring a repository`, `## The landing script`, `### By copying the folders` and `## Working on Ordo`. After, 149 lines and 17746 bytes: the introduction, five tables of 25 rows, "How to use" with the three figures and the `plan.yaml` subsection, "Requirements", "Install" with the CLI and the agents, the sentence to `docs/dev/working-on-ordo.md`, "License".
- `docs/dev/working-on-ordo.md`: new, the old README's "Working on Ordo" text under `# Working on Ordo`.
- `docs/dev/change-standard.md` line 96: before "(`README.md`, Working on Ordo)", after "(`docs/dev/working-on-ordo.md`)".
- `docs/glossary.md` line 181: before "Stated in: `README.md`, "Working on Ordo"; `utils/pin.sh`, its head comment.", after "Stated in: `docs/dev/working-on-ordo.md`; `utils/pin.sh`, its head comment."
- ADR 0044 line 7: before "(`README.md`, "Working on Ordo")", after "(`docs/dev/working-on-ordo.md`)".

## Anything in the brief that was wrong or impossible

Nothing. Every premise of "What is on the tree" held on the first run: the 270 lines and the headings, the 27 images, the 24 rows, the four "Working on Ordo" lines, the absence of `docs/dev/working-on-ordo.md`, the alt texts (the plan loop's alt text differs from its `aria-label`, the paper lifecycle's equals it), and the glossary check's `ok:` line.
