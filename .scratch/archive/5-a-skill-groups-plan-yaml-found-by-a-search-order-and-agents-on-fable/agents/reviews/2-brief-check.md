# Brief check of step 2, plan 5.A (brief `.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/2.md`, tree at cd05466)

Nothing in the repository was changed. All commands ran from `/Users/axelfaes/workspace/ordo`.

## 1. Names

**1a. `/ordo-help skills` lists four skills instead of sixteen under a grouped pin, and the brief forbids the fix.**
`sed -n '35,38p' skills/ordo-help/SKILL.md`:
```
2. For `/ordo-help skills`, the skills folder, which is the parent of this skill's folder after that folder is resolved to its real path.
   - This skill's folder is the base directory the runner states when the skill loads, resolved through any link by `cd <base directory> && pwd -P`.
   - The parent of the base directory as stated is never the skills folder.
3. For `/ordo-help skills`, the `SKILL.md` of each folder in the skills folder.
```
- Under a pin of a grouped tag, `~/.claude/skills/ordo-help` resolves to `<pinned worktree>/skills/ordo/ordo-help`, so the parent is `skills/ordo`, which holds four skills.
- "What to build" 2 says a skill's text "is not rewritten to a group path", and no item or case covers this.
- `README.md:23` ("For `skills` it prints the name and the Quick start block of every skill") and the skill's description become false under the pin route.

**1b. `README.md:163` to `182`: the `<skills>` placeholder is false for a clone.** The gate's line cannot print it.
`git grep -nE '<skills>' -- ':!.scratch'` and `sed -n '163p' README.md`:
```
README.md:163: ... (`<skills>` is `~/.claude/skills`, or `skills/` in a clone) ...
README.md:166:python3 <skills>/repo-setup/templates/sync_rules.py <repository>
README.md:175:python3 <skills>/ordo-init/templates/check_config.py <repository>
README.md:181:cp <skills>/plan/templates/plan.yaml .agents/plan.yaml            # one project
README.md:202:python3 <skills>/plan-orchestration/templates/plan_cost.py <ledger folder> [<transcript root>]
```
In a grouped clone no single folder holds `repo-setup`, `ordo-init`, `plan` and `plan-orchestration`. `README.md` is in the write list, but the brief names only the copy loop, the table and the CLI text.

**1c. `docs/dev/change-standard.md:8` holds a glob that matches nothing after the move.** The gate's line cannot print it, and item 6 names only the same glob in `skill-layout.md`.
`git grep -nE 'skills/(\*|<|\$)' -- ':!.scratch'`:
```
docs/dev/change-standard.md:8:2. ... `docs/dev/skill-layout.md` is the standard for every `skills/*/SKILL.md`.
docs/dev/skill-layout.md:3:Every `skills/<name>/SKILL.md` follows this layout ...
docs/dev/skill-layout.md:18: ... glob.glob("skills/*/SKILL.md") ...
README.md:147:        rm -rf "$dir/$skill" && cp -R /tmp/ordo/skills/$skill "$dir/"
```

**1d. The plan's state file names old paths, and the builder may not edit it.**
`grep -n 'skills/' <ledger>/orchestrator-state.md`:
```
7:- sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
...
16:- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
21:standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md]
```
- ADR 0010 has `/land` rewrite the verify list (lines 7 to 16) from the verification page before it runs.
- Nothing rewrites line 21, the `standards` value that later briefs and reviewers read.

**1e. `check_config.py` resolves links, so the pin route no longer has `ordo-init` and `plan` side by side.**
`grep -n realpath skills/ordo-init/templates/check_config.py`:
```
91:    here = os.path.dirname(os.path.realpath(__file__))
```
The brief's premise "as they do installed" is false for the pin route after the step. Item 2's second lookup covers it; no case runs the script through a link (see 6).

**Searched with no finding:**
- `.gitignore` (two rules, neither a skill path).
- No CI file, no `skills-lock.json` (`git ls-files -- ':!.scratch' ':!skills' ':!docs/adr'`).
- `agents/*.md` (no skill path).
- `docs/figures/gen_figures.py` and `gen_comparison.py` (no read of a skill folder; one docstring path the gate prints).
- `utils/check_coverage.py` (skills root is an argument).
- `.claude/settings.local.json` (one hit, `~/.claude/skills/`).
- Other scripts under `skills/*/templates` reach only their own folder (`grep -n 'dirname\|__file__\|realpath' skills/*/templates/*.py skills/*/templates/*.sh`).

## 2. The step line

| Item of "What to build" | Part of the step 2 line |
|---|---|
| 1 | "the sixteen skill folders moved under ... as the goal lists them" |
| 2 | "each skill installed under its own name"; the `check_config` part serves "the verify list passes" |
| 3 | "`utils/pin.sh` ... read the grouped layout and the layout before it, each skill installed under its own name" |
| 4 | "its test"; "`utils/pin.test.sh` passes with a case for a tag in the grouped layout and one for a tag in the layout before it" |
| 5 | "the README's install routes"; "the README's copy loop run from the worktree ..." |
| 6 | "`.agents/plan.yaml`, `docs/dev/building.md` and every path in the tracked files outside the ledgers"; "the `perl` line of the gate prints nothing" |
| 7 | no part of the line; it serves `docs/dev/skill-layout.md`, "Frontmatter" |

- Parts of the line with no requirement: none.
- Requirements inside items with no part of the line: the refusal of a doubled skill name (item 3, declared as decision 2), and C8.
- `skills/repo-setup/templates/plan-terms.md` is in the write list, and no requirement changes it. `grep -n 'skills/' skills/repo-setup/templates/plan-terms.md` prints only line 83, `.agents/skills/`; the gate's line prints nothing in it; the glossary's nine hits are on lines 3 and 146 to 159, outside the block that ends at line 140.

## 3. Premises

The `npx` premise was not rerun. Reran: `ls skills`, `wc -l utils/pin.sh`, `sed -n '95,101p' utils/pin.test.sh`, `grep -n 'for skill in\|npx skills add' README.md`, the gate's `perl` line with per-file counts, `sed -n '85,95p'` of `check_config.py`, `grep -n 'plan/templates'` of `check_config.test.sh`, `sed -n '3p;18p' docs/dev/skill-layout.md`. Counts agree: 215 lines, 41 files, 48 lines in 29 ADR files, the twelve per-file numbers.

Differences:
- **"in the refusals".** The brief says `pin.sh` builds the `skill_root` path "in the refusals", and item 3 repeats it. `cat -n utils/pin.sh` shows `skill_root` used at lines 170, 228, 235, 439 and 450 only. The refusals (lines 401 to 420) test `$dir/$skill`, the target's prefix and the link's name.
- **README line 146.** The brief quotes the loop as one line. The tree has three: 146 `for skill in ...; do`, 147 `rm -rf "$dir/$skill" && cp -R /tmp/ordo/skills/$skill "$dir/"`, 148 `done`.
- **"as they do installed".** False for the pin route after this step (1e).
- **The `npx` premise ran on "a scratch copy of the skills"**, not on a checkout. The checkout also tracks `.scratch/archive/2-c-scripts-compute-facts-and-writing-is-removed/agents/briefs/1-v2.0.0/skills/repo-setup/SKILL.md` (`git ls-files | grep -E '(^|/)SKILL\.md$' | grep -vE '^skills/[^/]+/SKILL\.md$'`). C5 runs in the worktree and would show any effect.

## 4. Cases and checks

**4a. C3 contradicts item 4.** Item 4 keeps every existing case "on the flat layout it builds today"; the gate's line prints two lines of that test.
`grep '^utils/' <gate output>`:
```
utils/pin.test.sh:129: git -C "$repo" rm -q -r skills/alpha
utils/pin.test.sh:186: git -C "$ORDO_STABLE" checkout -q -- skills/beta/SKILL.md
```
C3 can print nothing only if these lines are respelled. The brief does not say so, and the plan's gate at the closing prints them too.

**4b. Item 7 contradicts `skill-layout.md` and step 1's brief for `grill`.**
- `skill-layout.md`, "Frontmatter": "A plan that changes a skill raises one part of its `metadata.version` once".
- `grep -n -i version <ledger>/agents/briefs/1.md` line 29: step 1 raises "the second part for ... `grill`".
- Step 2's only change to a skill's text is `skills/grill/SKILL.md:202`, for which item 7 asks the third part.
- Result: two raises in one plan and two edits of the same line (`skills/grill/SKILL.md:5`, `version: "1.3.1"`) in worktrees that must merge. The brief's "Conventions" asks for the opposite.
- Item 7 does not say whether the change to `check_config.py` counts as `ordo-init`'s "own text" (`version: "2.0.1"`), which step 3 also changes.

**4c. C2 writes outside its scratch folder.** With `~/.claude/skills` replaced by `<scratch>`, `README.md:148` to `150` run:
```
    agents=$(dirname "$dir")/agents
    mkdir -p "$agents"
    rm -f "$agents"/ordo-*.md && cp /tmp/ordo/agents/*.md "$agents/"
```
That is `${TMPDIR:-/tmp}/agents`: created, its `ordo-*.md` removed. The case should name `<scratch>/skills`.

**4d. "Paths this step writes" carries no line ranges.** `change-standard.md`, "Where the work happens": "A brief's 'Paths this step writes' keeps its line ranges, numbered as on main at the base."

**4e. The "Report" section says "in the shape rule 7 ... gives" and then lists a different shape.** Missing from it:
- rule 7's "the state file's open items verbatim", "every file changed with its line count" and "every user-visible change with the before and after";
- rule 13's table of behaviour, case and failing line;
- rule 14's quoted grep and the reread whole-file sentences.

**4f. C8 states neither ground the rule asks for.** `change-standard.md`: "A script handles a case only when that case has happened or when a wrong answer on it costs something." No tag holds a file directly under `skills/` or a group folder without a skill, and the brief names no cost.

**4g. Rule 13 against a test that stops at its first failure.** `pin.test.sh` exits at the first `fail`. One run on the unchanged `pin.sh` shows the failure of the first new case only, and the brief asks for one first run of C1. Rule 13 wants each new case's failure quoted.

**A case that checks a place the step does not change:** none. C5 checks an outside tool, but against the layout the step makes.

## 5. The question

Yes only:
- **C1.** The last line is the fixed text `PASS: pin.sh scratch tests` (`pin.test.sh:425`). It prints the same whether or not the three new cases exist or assert anything.
- **C2.** Passes while the loop has no stop with a message for a skill it does not find (item 5 asks for it; no case runs the loop with a skill missing), and while `README.md:163` to `182` stay false (1b).
- **C3.** Passes while these remain or arise:
  - a path the pattern cannot match (1b, 1c);
  - a path rewritten to the wrong group (`skills/code/plan`);
  - a sentence left false around a rewritten path;
  - a path deleted instead of rewritten.
- **C4.** `ls skills` and a count of 16 pass with a skill in the wrong group. The goal lists the members of each group, and no case compares them.
- **C9.** Passes while a run through a link is never made (1e); the grouped half exercises the same lookup, so the risk is only a builder who drops `realpath`.
- **Item 2.** Its sentence on a skill's text passes while `/ordo-help skills` is broken under the pin (1a).
- **Item 3, fifth bullet.** "Check mode reports such a link" has no case: the grouped case only asserts that check mode passes, with no control (rule 13, third bullet).
- **Item 6.** `grep -rn '\.\./' skills utils` (item 2) does not print the form `check_config.py:92` uses (`"..", ".."`). Today no other script uses that form: `grep -rnE '"\.\."|pardir' skills utils` prints only `check_config.py:92` and `:111`, `lookup.test.sh:319` and `:424`, `land.sh:141`.

## 6. Implied inputs

| Input | Expected result | In "Cases" |
|---|---|---|
| Worktree at a flat tag, grouped tag pinned (the state on this machine: `git -C ~/.local/share/ordo-stable describe --tags` prints `v8.4.0`, sixteen links to `.../ordo-stable/skills/<name>`) | Each link replaced by the link into its group; check passes | Yes: C7, new case 2 |
| Worktree at a grouped tag, flat tag pinned (`README.md:228`: "going back is `utils/pin.sh <older tag>`"), and a grouped tag followed by `v1.0.0`, the top-level tag | Each link points at `<worktree>/skills/<name>` (or `<worktree>/<name>`), none into a group folder, check passes | **Missing** |
| Check mode on a grouped pin, links sound | Exit 0, skills line counts the skills | Yes: new case 1 |
| Check mode on a grouped pin with a link at the earlier place `<worktree>/skills/<name>` | Exit 1, one line naming the link | **Missing** |
| Same input, second message: `pin.sh:247` (`[ -f "$target/SKILL.md" ]`) also prints "links to ..., which the pinned tag does not have" | Not stated; the line is false, since the tag holds the skill, and the head comment must say what check mode prints | **Missing** |
| A tag that tracks a `SKILL.md` outside the three layouts: `.scratch/.../briefs/1-v2.0.0/skills/repo-setup/SKILL.md`, present from `v2.2.0` on (loop over `git tag` with `git ls-tree -r --name-only`) and on main | Not a skill; the tag pins. A pattern not anchored at the root, or a `find` over the worktree, sees a second `repo-setup` and refuses every such tag | **Missing** |
| The removal loop `pin.sh:450`, grouped tag: a link into the worktree whose skill the tag lacks | Removed with its line; a held skill's link kept | Kept half by new case 1; removal on a grouped tag **missing** (existing case is flat, `pin.test.sh:138` to `143`) |
| A link into the live clone at a skill's old place (`<clone>/skills/<name>`, dangling once the clone is grouped) or new place (`<clone>/skills/<group>/<name>`) | Check mode names it; pin mode replaces it when the tag holds the name, refuses when not | Old place: existing cases (`pin.test.sh:146`, `:157`). New place: **missing**; the code tests the prefix `"$repo"/*` and the link's name, so it holds unless the builder changes those tests |
| One name in the flat and the grouped layout of one tag (`skills/x` and `skills/a/x`) | Refused as a doubled name | **Missing**; C6 covers two groups only |
| `check_config.py` run through a link whose real path is grouped (the pin route) | Finds `plan/templates/plan.yaml` in the sibling group, prints `ok:` | Not as a link; same lookup as C9's first half |
| `check_config.py` with `plan` in neither place (one skill installed alone) | An error line naming where it looked, listed in the head comment (rule 14); today a traceback from `open(example)` at line 94 | **Missing**, expected result unstated |
| No tag holds `skills/<a>/<b>/SKILL.md` today (same tag loop), so no flat tag is misread as grouped | Nothing to handle | Not needed |

## 7. ADRs

Decisions that govern a place or layout the step touches (`awk` over each file's "Decision" section):
- **0010**: "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ... On a difference, the session rewrites the list in the state file". Governs the verify list once `docs/dev/building.md` changes (1d).
- **0012**: "The landing commit takes its paths from `git diff --cached --name-only --no-renames`, so a rename's old path is named too." Governs the landing of the move.
- **0001**: "... in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`. `skills/writing/` holds no copy of it."
- **0017**: "`skills/paper/templates/lookup.py`, on the Python standard library alone ... makes every lookup of the skill".
- **0019, 0022, 0025, 0027**: each role "with its own page under `skills/paper/agents/`".
- **0026**: "... with the differences `skills/writing/references/manuscript-prose-standard.md` lists."
- **0037, 0042**: name `skills/paper/agents/literature_strategist_agent.md`.
- **0043**: files "copied into one page of `skills/paper/`".

No ADR decides how skills are installed or pinned, or what `/ordo-help skills` reads.

Contradiction with the brief: none. `docs/adr/README.md` allows the path rewrite: "A refinement that keeps the decision edits the ADR to its current state with no dated note."

## 8. Dictated text

The brief dictates no line of file text word for word. The nearest are the prefix `pin: ` for the new refusal (holds: `pin.sh:60`, "Every refusal ... prints a line starting \"pin: \"") and the four folder names, which are the goal's.

## Declined to judge

- Whether the paths inside recorded gate outputs of done roadmap entries (for example `docs/roadmap.md:109`, "`skills/repo-setup/templates/shared-rules.md` (line 15)" at 566a198) should be rewritten. The gate's line and the brief's decision 3 require it; the gate is the user's.
- Whether `/ordo-help skills` should list all sixteen skills under a grouped pin or only its group. 1a states the break; the choice of behaviour is a ruling.
- How the skills CLI discovers skills in the grouped layout: the `npx` command was not run, as instructed.
- Whether the path rewrites of this step and step 1's edits to the same ADR and glossary lines merge cleanly: step 1's worktree was not read.

Agent usage: a4acb97b2cf90ba34, claude-fable-5-2, 172921 tokens, 25 tool uses, 7.0 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1a, `/ordo-help skills` under a grouped pin: item 2 of "What to build" asks for the sixteen skills in both installations, C8 checks it, `skills/ordo-help/SKILL.md` added to the paths.
- 1b, the `<skills>` placeholder of the README: item 5.
- 1c, the glob of `docs/dev/change-standard.md`: item 6.
- 1d, the `standards` line of the plan's state file: the ledger is the orchestrator's; it rewrites that line at the landing of step 2, with the verify list.
- 1e, `check_config.py` through a link: premise corrected, C9 runs the script through a link.
- 3, the refusals of `pin.sh`, the README's loop, "as they do installed": corrected in "What is on the tree".
- 4a, the two lines of `utils/pin.test.sh` the gate's line prints: item 4 has the fixture's folder written through a variable.
- 4b, two raises of one version in one plan: item 7 raises none in this step.
- 4c, C2 writing outside its scratch folder: C2 names `<scratch>/skills`.
- 4d, line ranges: each path of the list is a whole file, which the brief template writes without a range.
- 4e, the report shape: the section names rules 7, 13 and 14 with every part they name.
- 4f, C8 without a ground: removed; the tracked `SKILL.md` inside a ledger folder, which every tag from v2.2.0 holds, is a case of item 4.
- 4g, one first run for three new cases: C1 has each new case run alone on the unchanged script.
- 5, C1: each new case prints its name line. C2: the loop run with a skill missing. C4: `ls skills/*` against the groups. Item 3's check mode: a case of item 4. Item 6: the wider grep of item 2.
- 6, missing inputs: a grouped pin followed by a flat one, check mode on a link at the earlier place with its one line, the removal on a grouped tag, one name in the flat and the grouped place, `plan` in neither place: cases of item 4, items 2 and 3, and C9.
- 7: no contradiction; ADR 0010 and 0012 govern the landing, which the orchestrator runs.
- 8: no dictated text; none added.
