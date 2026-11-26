# Step 6 brief check (on main at 5c055cf)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/6.md`. Nothing was written or edited. Every command ran in this session on main at 5c055cf (`git log --oneline -1` printed `5c055cf Land step 5 of roadmap entry 27: a figure for every skill`). `git status --short` showed only the ledger's state file and the brief as changed.

## 1. Names

- "Working on Ordo": `git grep -n 'Working on Ordo' -- ':!.scratch'` printed `README.md:247`, `docs/adr/0044-...md:7`, `docs/dev/change-standard.md:96` and `docs/glossary.md:181`. All four are in "Paths this step writes", so there is no hit outside the paths.
- "Configuring a repository", "By copying the folders", "With the skills CLI": `git grep -n -F '<name>' -- ':!.scratch' ':!docs/roadmap.md'` printed only `README.md:185`, `README.md:166` and `README.md:147`. No hit outside the paths.
- "The landing script": the same grep printed `skills/orchestration/land/SKILL.md:37`, `:65` and `:180`, `docs/glossary.md:138` and `skills/ordo/ordo-init/templates/plan-terms.md:133`. Each one cites `land`'s own section "The landing script", which the step does not touch, so none becomes false.
- "`README.md`, first paragraph": `docs/dev/change-standard.md:94`, `docs/adr/0014-...md:7` and `docs/adr/0044-...md:7`. The brief names all three. Item 1 keeps the fact they cite (no project name, no path, everything from `plan.yaml`), so none becomes false.
- "`README.md`, opening" (`git grep -n -F 'README.md`, opening'`), two hits the brief does not list:
  - `docs/adr/0001-...md:7`: "Ordo's skills carry no project name and no path, and everything specific to a repository comes from its `plan.yaml` (`README.md`, opening)". The first-paragraph requirement keeps this fact, so the citation stays true.
  - `docs/adr/0003-...md:7`: "Ordo already has a fresh reviewer that changes nothing review each step of a plan (`README.md`, opening)". The loop bullet of item 1 keeps this fact, so the citation stays true.
- "`README.md`, the introduction" (`git grep -n -F 'README.md`, the introduction'`): `docs/glossary.md:176` (the brief names it and keeps it) and one hit the brief does not list:
  - `docs/adr/0058-...md:7`: "The skills run a C++ engine, a TypeScript tool or a research project alike (`README.md`, the introduction)."
  - That fact is the last sentence of today's README line 3, "The same skills therefore run a C++ engine, a TypeScript tool or a research project." It is not among the facts item 1 says the introduction keeps.
  - **The change can make it false.**
- The README's sentence on the group folders (`git grep -n -F 'group folders' -- ':!.scratch' ':!docs/roadmap.md'`): `README.md:38` and `docs/adr/0048-...md:31`. The ADR's Consequences say "`README.md`'s sentence on the group folders names five groups."
  - Item 1 replaces line 38 with five `###` headings and dictates only the sentence on how the installed skills stand side by side.
  - No sentence naming the five groups is required, so **the change makes ADR 0048's sentence false** unless the builder happens to keep one.
- "README.md" in Consequences lists (from `git grep -n -o '.\{0,200\}`README.md`[^.;]\{0,120\}' -- docs/adr ...` and a Python read of each line):
  - `docs/adr/0036-...md:51` and `docs/adr/0037-...md:42`: "... the README and the figures carry the change".
  - `docs/adr/0039-...md:42`, `docs/adr/0040-...md:50` and `docs/adr/0042-...md:53`: "`docs/glossary.md`, `README.md` ... carry these decisions" / "`docs/glossary.md` and `README.md`".
  - `docs/adr/0043-...md:106`: "`docs/glossary.md` and `README.md` describe it". The brief names this one.
  - Today's `paper` row carries lit-review detail. A row of at most 25 words will not. These lists record where an earlier change was carried. Whether that makes them false is under "Declined to judge". The brief names only 0043.
- `docs/adr/0052-...md:27`: "`README.md` points at it in one line" (`NOTICE.md`). Kept by item 1's License bullet, so not false.
- "twenty-five skills": `README.md:38` and `README.md:183`, both in the path.
- `skills/orchestration/grill/SKILL.md:76`, "otherwise the opening of `README.md`": this means the README of any repository, not a citation of Ordo's. Not affected.
- No README section is cited from `utils/`, `agents/`, `CLAUDE.md`, `docs/dev/building.md`, `docs/dev/scripts.md` or `ordo-help` (`git grep -n 'README' -- skills/ordo/ordo-help skills/orchestration/plan-orchestration utils agents docs/dev/building.md docs/dev/scripts.md` printed nothing).

Findings:
- ADR 0058 line 7 cites "`README.md`, the introduction" for "The skills run a C++ engine, a TypeScript tool or a research project alike". Item 1's list of introduction facts does not include that sentence, so the rewrite can make the citation false. The brief does not name the ADR.
- ADR 0048 line 31 says "`README.md`'s sentence on the group folders names five groups". The rewrite removes that sentence (line 38) and dictates no replacement, so the ADR's sentence becomes false. The brief does not name the ADR.
- The brief's list of pages that cite the README (the "Pages that cite a section or a paragraph of `README.md`" bullet) misses ADR 0001 line 7 and ADR 0003 line 7 ("opening"), ADR 0058 line 7 and ADR 0048 line 31. Neither of the first two becomes false.

## 2. The step line

- "Ordo's `README.md` rewritten as the goal says": item 1, all of its bullets.
- "with the skills table holding `handbook`": item 1, "`## The skills`" ("all 25 skills, `handbook` in `code`").
- "the three figures of 'How to use'": item 1, "`## How to use`", the bullets on `### The plan skills`, `### A paper`, `### A research project` and "exactly three images".
- "'Working on Ordo' moved to `docs/dev/working-on-ordo.md`": item 2, and item 1's "No section on working on Ordo".
- "which `docs/dev/change-standard.md`'s pin rule and the glossary entry pin cite": items 3 and 4.
- Check, "the user reads and approves the README": this is the orchestrator's stop. The builder's matching case is "A newcomer's reading".
- Check, "each image path exists, and there are three": case "The README's images" and check 3.
- Check, "`git grep -n 'Working on Ordo'` outside `.scratch/` prints no line that names the README": case "Working on Ordo", check 5, and item 5 (ADR 0044) as the premise correction.
- The goal's README part:
  - "an introduction of a few sentences, as the READMEs of [two repositories] open": item 1, first bullet, without the names.
  - "one table per group, one short line each": `## The skills`.
  - "the plan skills part has a subheading on `plan.yaml` that holds in short configuring a repository and the landing script": the `#### plan.yaml` bullet.
  - "short requirements and install, the install by copying the folders left out": the `## Requirements` and `## Install` bullets.
  - "no section on working on Ordo": item 1's "No section..." bullet and item 2.
- Every part of "What to build" serves a requirement. Item 5 serves the step's check. Item 6 serves rule 20 of the rules file.

Findings: none.

## 3. Premises

- `wc -l README.md` printed `270`. Matches. (`wc -c` printed `76528`, which the brief does not state.)
- `grep -n '^#' README.md` printed `1:# Ordo`, `9:## The skills`, `134:## Requirements`, `141:## Install`, `147:### With the skills CLI`, `166:### By copying the folders`, `185:## Configuring a repository`, `239:## The landing script`, `247:## Working on Ordo`, `268:## License`. Matches.
- Lines 3 to 7 are three paragraphs, line 38 is the group sentence, lines 40 to 68 are the order of use and line 70 is the legend paragraph (`sed -n`). Match.
- The skills table: `sed -n '11,36p' README.md | grep -c '^| `'` printed `24`, and `grep -n 'handbook' README.md` printed only lines 38 and 172. So the table has no `handbook` row. Matches.
- `grep -c '^!\[' README.md` printed `27`. Matches.
- `ls -d skills/*/*/ | wc -l` printed `25`, with the groups as the brief lists them. Matches.
- `ls docs/figures/orchestration docs/figures/academic/paper docs/figures/academic/researcher` lists `plan-loop.svg`, `paper/lifecycle.svg` and `researcher/lifecycle.svg`. The README shows the first two at lines 76 and 130 and not the third. Matches.
- Alt texts, by a Python comparison with `html.unescape` of each `aria-label`:
  - `76 docs/figures/orchestration/plan-loop.svg 1142 1060 False`.
  - `130 docs/figures/academic/paper/lifecycle.svg 1446 1446 True`.
  - Match. The researcher figure's label is 1606 characters, with no `[`, `]`, `(` or `)` and no non-ASCII character, so it can stand as alt text unchanged.
- The citing pages: change-standard lines 94 and 96, glossary lines 176 and 181, ADR 0014 Context and ADR 0044 line 7 hold as quoted. **Incomplete**: ADR 0001:7, ADR 0003:7, ADR 0058:7 and ADR 0048:31 also cite the README (section 1).
- `git grep -n 'Working on Ordo' -- ':!.scratch'` printed four lines. Matches.
- `grep -n 'plan-terms' docs/glossary.md`: the block opens at line 5 and ends at line 144. `grep -n '\*\*pin\*\*\|loop, in the README' skills/ordo/ordo-init/templates/plan-terms.md` exited 1. Matches.
- `ls docs/dev` printed blind-comparison.md, building.md, change-standard.md, scripts.md and skill-layout.md. Matches.
- `OTEL_LOG_RAW_API_BODIES` and `plan_cost.py <ledger folder>`: `plan-orchestration`'s `SKILL.md` and `plan_cost.py`. `CLAUDE_CODE_ENABLE_TELEMETRY`: only `plan_cost.py`. Matches.
- `check_config.py --find`: `ordo-init`'s `SKILL.md` and `check_config.py`. `plan.projects.yaml`: also `plan`'s `SKILL.md`. Matches.
- **"The `--glossary <path>` form is written nowhere else": does not match.**
  - `git grep -n -e '\-\-glossary' -- skills docs/dev ...` printed `skills/ordo/ordo-init/SKILL.md:384`: "the run adds `--glossary <the glossary's path from the repository root>`".
  - It also printed `skills/ordo/ordo-init/templates/sync_rules.py:4`, the usage line, and `docs/dev/scripts.md:35` and `:54`.
- `bash -o pipefail`, `PyYAML`, `npx skills add` and `CLAUDE_CODE_EFFORT_LEVEL`: the files are as listed (`git grep -l`). `bash -o pipefail` is also in `skills/ordo/ordo-init/templates/utils/build.py`. Matches in substance.
- **"Git must ignore the worktree root and must not ignore the `plan.yaml`" is "in no other page": does not match.**
  - `skills/ordo/ordo-init/SKILL.md:285` and `:286`: "The configuration file must not be ignored: `git check-ignore -q --no-index docs/plan.yaml` exits 1". Lines 366 and 367 hold the same.
  - `skills/orchestration/plan/templates/plan.yaml:10`: "worktree_root: ... add it to .gitignore."
- The `.agents/plan.yaml` note: `git grep -n -i "\.agents/plan.yaml"` finds the search place in `plan`'s `SKILL.md:213`. No page gives the advice to put `../` in front of each path or to move the file. Matches.
- Search order and relative paths in `plan`'s "What it reads" 1, and the landing script in `land`'s "The landing script": confirmed by `skills/orchestration/land/SKILL.md:30` and `:180`. Matches.
- **Facts missing from the brief's list, held in no other page:**
  - `git grep -n -e 'npx skills' -- skills docs utils` printed only `ordo-init` lines (`npx skills add <source> --skill ...`, `npx skills experimental_install`).
  - So `npx skills update -g`, `npx skills ls -g`, `npx skills remove --global <skill>` and "for a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR`" stand in no other page.
  - The same holds for the CLI copying each skill into `~/.agents/skills` and linking it from `$CLAUDE_CONFIG_DIR/skills`. That fact appears only in `utils/pin.sh`'s comments, as `pin.sh`'s own behaviour.
- The verify list against `docs/dev/building.md`, by a Python comparison: 16 commands each. They are equal except for the `2>&1 | tail -1` filters the state file adds, which are the filters of the rules file's "Commands and their filters". Matches in substance.

Findings:
- `--glossary <path>` is written in `skills/ordo/ordo-init/SKILL.md:384`, `sync_rules.py:4` and `docs/dev/scripts.md:35`. The brief says it is written nowhere else.
- The worktree-root ignore rule and the "`plan.yaml` not ignored" rule are in `skills/ordo/ordo-init/SKILL.md:285-286` and `:366-367`, and in `plan`'s `templates/plan.yaml:10`. The brief says no other page holds them.
- The list of citing pages is incomplete (section 1).
- The list of facts held nowhere else omits the CLI's update, list and remove commands, the second-account rerun, and where the CLI copies and links the skills.

## 4. Cases and checks

The first runs below are on the unchanged tree.

- "The README's images": `grep -o '!\[[^]]*\]([^)]*)' README.md | wc -l` printed `27`. It fails before the change and can pass after. It is consistent with the rules file and the standards.
- "Every figure path": the check 4 command printed nothing (rc 0). It passes before the change, so it is a regression check. It reads `docs/` and `skills/`, places the step does not change, as the gate (D21, Open item B) asks. Consistent.
- **"Working on Ordo" and check 5**: `git grep` searches only tracked files (`git grep -h` lists `--[no-]untracked  search in both tracked and untracked files`).
  - The new page stays untracked in the worktree, since the rules file's "Where the work happens" forbids `add` and `commit`.
  - Check 5 will therefore not print `docs/dev/working-on-ordo.md:1:# Working on Ordo`. As written, it cannot pass on a correct build. It needs `--untracked`.
- "The new page": by reading. Consistent.
- "The citations" and check 6: `grep -n 'working-on-ordo.md' ...` printed nothing (rc 1). It fails before and can pass after. Consistent.
- "The skills tables", "Each row's text", "The first paragraph", "The loop" and "A newcomer's reading": by reading, as "Scripts compute facts; judgment is read" asks. Consistent.
- "The install": the grep printed `166:### By copying the folders` and `172:    for skill in orchestration/...`, and the `npx skills add` command is found once. It fails before and can pass after. Consistent.
- **"The sections removed"**:
  - The first grep printed lines 185, 239 and 247, and `grep -n '^#### plan.yaml' README.md` printed nothing (rc 1). So the case fails before the change and can pass after.
  - The prose standard, "F. Emphasis and formatting", asks for "Inline code for paths, identifiers, literals". The brief writes the group headings with code (`` ### `skills/orchestration/` ``).
  - A heading written `` #### `plan.yaml` `` follows that rule and the brief's own pattern, but fails `'^#### plan.yaml'`. **The case is inconsistent with the prose standard.**
- "The facts kept": by reading the report's list against `git show <base>:README.md`. Consistent. Its scope is discussed in section 5.
- "The README's length": `wc -l` printed 270 and `wc -c` printed 76528 before the change. Consistent.
- "The glossary" and check 2: `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. It passes before the change, so it is a regression check. Consistent.
- **Check 1**: the run printed `Can't open docs/dev/working-on-ordo.md: No such file or directory at -e line 1.` and the same for `.../agents/reviews/6-report.md`, then `exit: 0`. `LC_ALL=C grep -c '[^ -~]' README.md` printed `0`.
  - The check passes on a file that does not exist.
  - The builder writes the report after running the checks, so the report is never checked. It passes for the wrong reason.
- Check 3: on the unchanged tree it printed 27 paths. It fails before and can pass after.
- **Check 8**: `git diff --stat <base>` does not list untracked files. It passes while a stray untracked file outside "Paths this step writes" exists, and it never shows the new page. It passes for the wrong reason. `git status --short` would show both.
- Checks 7 and 9: by reading. Consistent.
- No case asks the builder to check, quote or explain a place the step does not change, apart from "Every figure path" and "The glossary", which the gate asks for.

Findings:
- Case "Working on Ordo" and check 5 use `git grep` without `--untracked`. The new page is untracked in the worktree, so the check cannot print its heading and cannot pass as written.
- Case "The sections removed" greps `'^#### plan.yaml'`. A heading that follows the prose standard's "F. Emphasis and formatting" (inline code for a file name), as the brief's own group headings do, fails it.
- Check 1 exits 0 on a missing file ("Can't open" then `exit: 0`), and the report it lists does not exist when the check runs.
- Check 8 (`git diff --stat <base>`) does not see untracked files, so it cannot prove "names only the paths".

## 5. The question

- "The README's images": no, it cannot pass without the goal. It needs exactly three images at the three paths.
- "Every figure path": yes. It passes on the unchanged tree (rc 0), so it says nothing about the rewrite. It only guards the gate's part.
- "Working on Ordo": as written it cannot pass at all (section 4). With `--untracked`, no: it needs the README line and the other three citations gone and the new heading present.
- "The new page": no, it reads sentence by sentence against lines 249 to 266.
- "The citations" (check 6): no, each of the three lines must name the new page.
- "The skills tables" and "Each row's text": no, they are read row by row.
- "The first paragraph": **yes, for one cited fact.** It checks only the no-project-name, no-path fact. ADR 0058's citation of the introduction ("a C++ engine, a TypeScript tool or a research project") can be dropped and the case still passes.
- "The loop": no, it reads the glossary entry beside the text.
- "The install": no for the code blocks. The inline CLI facts (update, ls, remove, second account) are covered only by "The facts kept".
- "The sections removed": no, though the `#### plan.yaml` form can make it fail on a correct build (section 4).
- "The facts kept": **yes.**
  - Its list covers only `## Configuring a repository`, `## The landing script`, `## Install` and `## Requirements`.
  - The rewrite also shortens the introduction's third paragraph, the 24 table rows, the line 38 group sentence, the order of use and the legend paragraph at line 70. A fact of those can go with no line of the list missing.
  - The line 38 sentence is the one ADR 0048 cites, and the line 3 sentence is the one ADR 0058 cites.
  - The order of use stands whole in `ordo-help`'s `SKILL.md` lines 150 to 192, and the legend stands in `docs/figures/gen_figures.py:204-215`. The table rows and line 38 have no such check.
- "A newcomer's reading": a judgment. The user's approval is the gate.
- "The README's length": yes, any cut passes. The user's reading decides "short".
- "The glossary": yes, it passes on the unchanged tree. It is a regression check only.
- The check on the step's line: no, the user reads and approves the README, and the count and the grep back it.
- Item 1's checks: the cases above plus the user's reading. No, given that reading.
- Item 2: the case "The new page" by reading, and check 5 (broken as written). No, given the reading.
- Items 3, 4 and 5: check 6. No, each line must name the new page. "Nothing else in the line changes" is checked by the review's reading of the diff.
- Item 6: check 8. Yes, it passes with an untracked stray file, since `git diff --stat` does not see one.

Findings:
- "The first paragraph" passes while ADR 0058's cited fact is dropped from the introduction.
- "The facts kept" passes while a fact of the introduction's third paragraph, the table rows, the line 38 group sentence (cited by ADR 0048) or line 3's last sentence (cited by ADR 0058) is lost, since its list covers four sections only.
- Check 8 passes with an untracked file outside the paths.

## 6. Implied inputs

- Not a code step: this is a text step, with no script written.

Findings: none.

## 7. ADRs

61 records are in `docs/adr` (`ls docs/adr | wc -l` printed 61). I read each status line, and grepped each record for `README`, install, pin, `npx` and `agents/ordo`.

ADRs the step touches and the brief names:
- 0014, Context: "Ordo's skills carry no project name and no path (`README.md`, first paragraph)". Kept.
- 0043, Consequences: "`docs/glossary.md` and `README.md` describe it". Kept by the `paper` row.
- 0044, Context, line 7: edited by item 5.
- 0052, Decision: "A file `NOTICE.md` at the repository root names `paper`, `paper-review-panel` and the `integrity` and `manuscript` parts of `researcher` ..., and `README.md` points at it in one line". Kept by the License bullet.

ADRs the step touches and the brief does not name:
- 0001 (proposed; superseded by 0030 only in the `standards` key), Context, line 7: "(`README.md`, opening)" for the no-name, no-path fact. Kept by item 1.
- 0003 (status "superseded by 0013", so not in force), Context, line 7: "(`README.md`, opening)" for the fresh reviewer. Kept by the loop bullet.
- 0048 (proposed), Consequences, line 31: "`wait-what` moves to `skills/explain/`, and `README.md`'s sentence on the group folders names five groups." The step removes that sentence (section 1).
- 0058 (proposed; superseded by 0060 only in its diagrams bullet), Context, line 7: "The skills run a C++ engine, a TypeScript tool or a research project alike (`README.md`, the introduction)." The brief does not keep that fact.
  - Its Decision bullet "Every README holds a core, `# <name>` with its opening paragraph, what it looks like, build and run or install, where to look, and the license" governs the READMEs `handbook` writes, not Ordo's own. It does not bind the step.
- 0036 (Consequences, line 51), 0042 (Consequences, line 53), and 0039 and 0040 (lines 42 and 50, largely superseded): each says the README carries `paper`'s decisions. 0037 (line 42) says the same but is superseded whole by 0042. The step shortens the `paper` row to at most 25 words.

A conflict with this step's rule on private names:
- `git grep -n 'Working on Ordo'` printed ADR 0044 line 7, which the step writes. That line reads, in part: "the folder `research-hub/funding/2026-fwo-senior-transplant/fwo-guidelines/` holds two versions of one scoring grid, marked "v. 2027" and v2025. ... (`research-hub/funding/2026-fwo-senior-transplant/admin/form-fields.md`)".
- These are a private folder and a private file of the author's, with a dated description.
- My instructions apply `CLAUDE.md`'s "A shipped file names nothing private" to every file the step writes. Item 5 says "Nothing else in the record changes", which keeps those paths in a line the step rewrites.

Findings:
- ADR 0058 (Context, line 7) and ADR 0048 (Consequences, line 31) are touched and not named. The rewrite as briefed can make both false.
- ADRs 0001 and 0003 (Context, line 7) are touched and not named. Both stay true under item 1.
- ADRs 0036, 0039, 0040 and 0042 (Consequences) are touched by the shortened `paper` row and not named.
- Item 5's "Nothing else in the record changes" keeps private paths (`research-hub/funding/2026-fwo-senior-transplant/...`) in ADR 0044 line 7, a line the step writes. My instructions apply the "names nothing private" rule to every file the step writes. The rule's own scope names `skills/`, `agents/`, `utils/` and `README.md`, not `docs/adr/`.

## 8. Dictated text

- `# Ordo`: `grep -n '`# Ordo`' <brief>` finds line 46. Holds.
- `## The skills`, and the group headings in the form `` ### `skills/orchestration/` ``: `grep -n '`## The skills`' <brief>` finds line 51, which holds both. They hold under the prose standard's "0. Hard rules" (headings are labels) and "F. Emphasis and formatting" (inline code for a path).
- The columns "Skill" and "What it does": line 51. Holds.
- `## How to use`: `grep -n '`## How to use`' <brief>` finds line 52. Holds: a label, and the goal's words (D3).
- `### The plan skills`: line 54. Holds.
- `#### plan.yaml`: `grep -n '#### plan.yaml' <brief>` finds lines 55 and 84. **It breaks the prose standard's "F. Emphasis and formatting"**, which asks for inline code for paths and literals, when it is written without code. Written with code, it fails the case on line 84 (section 4).
- `### A paper`: line 56. `### A research project`: line 57. Both hold.
- `## Requirements`: line 60. `## Install`: line 61. `## License`: line 63. All hold.
- `# Working on Ordo` (the new page's heading): `grep -n '`# Working on Ordo`' <brief>` finds line 66. Holds.
- ``(`docs/dev/working-on-ordo.md`)`` as the pin rule's citation: `grep -n 'becomes `(`docs/dev/working-on-ordo.md`)`' <brief>` finds line 67. It holds: it is a whole-page citation, which matches the form `(`README.md`, ...)` of its neighbours in the rules file's "Rules this repository already states".
- "`docs/dev/working-on-ordo.md`; `utils/pin.sh`, its head comment." as **pin**'s "Stated in": `grep -n 'docs/dev/working-on-ordo.md`; `utils/pin.sh`, its head comment' <brief>` finds line 68. Holds.
- ``(`docs/dev/working-on-ordo.md`)`` as ADR 0044's citation: `grep -n '`(`README.md`, "Working on' <brief>` finds line 69. The citation itself holds. The rest of line 7 is covered in section 7.
- The order-of-use commands (line 53) and the content lists of lines 46 to 65 are content requirements, not dictated wording.
- `LC_ALL=C grep -c '[^ -~]' <brief>` printed `0`. The brief is ASCII.
- The facts the brief says no other page holds:
  - The worktree-root ignore rule and `--glossary <path>` are held elsewhere (section 3). The `.agents/plan.yaml` note is held nowhere else.
  - Facts of the shortened sections that are missing from the brief's list:
    - From `### With the skills CLI`: `npx skills update -g`, `npx skills ls -g`, `npx skills remove --global <skill>`, the second-account rerun, and that the CLI copies into `~/.agents/skills` and links from `$CLAUDE_CONFIG_DIR/skills`. These are held nowhere else.
    - From `## Install`'s first paragraph: Claude Code reads skills from `~/.claude/skills` or `$CLAUDE_CONFIG_DIR/skills`.
    - From the shortened `## The skills` section: the introduction's line 3 last sentence (cited by ADR 0058), the line 38 group sentence (cited by ADR 0048), the order of use (held in `ordo-help`'s `SKILL.md` lines 150 to 192) and the legend paragraph (held in `docs/figures/gen_figures.py:204-215`).

Findings:
- `#### plan.yaml` (brief lines 55 and 84) breaks the prose standard's "F. Emphasis and formatting" unless the file name is in code, and the case's grep then fails.
- "What is on the tree" says no other page holds two facts that other pages do hold: the worktree-root and `plan.yaml` ignore rules (`skills/ordo/ordo-init/SKILL.md:285-286`, `skills/orchestration/plan/templates/plan.yaml:10`) and `--glossary <path>` (`skills/ordo/ordo-init/SKILL.md:384`).
- The list of where facts stand omits the skills CLI facts above, which no other page holds, and the facts of the shortened introduction and `## The skills` section that ADRs 0058 and 0048 cite.

## Declined to judge

- Whether the Consequences lists of ADRs 0036, 0039, 0040 and 0042, which say the README "carries" `paper`'s decisions, are made false by a 25-word `paper` row, or stay true as records of where that change was carried. This is a reading of what a record's Consequences assert, which is the orchestrator's or the user's call.
- Whether `CLAUDE.md`'s "A shipped file names nothing private" reaches ADR 0044 line 7. The rule names `skills/`, `agents/`, `utils/` and `README.md`. My instructions apply it to every file the step writes. Whether to strip those paths in this step is the user's call.
- Whether "worktree" and "`main`" are terms a Claude Code user knows, as the brief's Conventions assume. That is a judgment on the reader.

Agent usage: a155439c811cde7fc, claude-opus-5-5, 187448 tokens, 40 tool uses, 8 min 16 s.

## Closed

Each finding is closed by a change to `agents/briefs/6.md`:

- Names 1, ADR 0058's citation of the introduction: "What is on the tree" names it, and item 1's introduction keeps "the same skills run a C++ engine, a TypeScript tool or a research project"; a new case, "The other citations of the README", reads it.
- Names 2, ADR 0048's sentence on the group folders: "What is on the tree" names it, and item 1 keeps one sentence above the first table that names the five group folders; the same case reads it.
- Names 3 and ADRs 2, the citing pages ADRs 0001 and 0003: named under "What is on the tree", with the fresh reviewer kept in the introduction; the case "The first paragraph" names ADR 0001.
- ADRs 3 and the declined point, ADRs 0036, 0039, 0040 and 0042: named under "What is on the tree" as records of where a change to `paper` was carried, which stay true; no change to them.
- Premises 1, `--glossary <path>`: corrected to `ordo-init`'s `SKILL.md` line 384, `sync_rules.py` line 4 and `docs/dev/scripts.md` lines 35 and 54, and dropped from the facts the README must keep.
- Premises 2, the ignore rules: corrected to `ordo-init`'s `SKILL.md` lines 284 to 286 and 366 to 367 and `plan`'s `templates/plan.yaml` line 10, and dropped from the facts the README must keep; item 1 still names the rule in short in `#### `plan.yaml``.
- Premises 4 and Dictated text 3, the skills CLI facts held nowhere else: named under "What is on the tree" and added to the facts that stay in the README in short.
- The question 2 and Dictated text 3, the scope of "The facts kept": item 1's last bullet and the case cover the whole old README: the introduction, each table row, the sentence on the group folders, the order of use and the paragraph on how the figures are drawn, with where each stands (the order of use in `ordo-help`, the legend in `gen_figures.py`, each row in its skill's `SKILL.md`).
- Cases 1, `git grep` and the untracked page: the case "Working on Ordo" and check 5 use `git grep -n --untracked`; run on main, the command prints today's four lines.
- Cases 2 and Dictated text 1, the heading `#### plan.yaml`: the heading is dictated as `` #### `plan.yaml` ``, the file name in code, and the case greps `'^#### `plan.yaml`$'`.
- Cases 3, check 1 on a missing file: check 1 runs after the report is written, with `test -f` of each file first.
- Cases 4 and The question 3, check 8: `git status --short --untracked-files=all` in place of `git diff --stat`.
- Declined, ADR 0044 line 7's private paths: `CLAUDE.md`'s rule names `skills/`, `agents/`, `utils/` and `README.md`, and `docs/adr/` is outside it; item 5 changes the citation alone, as the brief says.
- Declined, "worktree" and "`main`" as known terms: left to the user's reading of the README, the step's check.
