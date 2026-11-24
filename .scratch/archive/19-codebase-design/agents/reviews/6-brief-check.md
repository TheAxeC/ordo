# Step 6 brief check

Brief check of step 6, plan 19-codebase-design. Read on main at 8697e39 (`git rev-parse --short HEAD`). Nothing was changed in the repository; one throwaway git repository was made in the scratchpad folder to rerun the brief's claim about `git add`, and removed.

Not read whole, so nothing below rests on the unread parts: `docs/glossary.md` and `templates/plan-terms.md` (grepped for the terms the step touches), `check_config.py` (head comment and `plan_skill()` read), `sync_rules.test.sh` (grepped), ADRs 0001 to 0046 (status line and the first four lines of each Decision, plus every line a grep for the step's subjects hit; 0047 read whole).

The findings that should change the brief before dispatch, in order of cost:

- F1. Item 9's text does not give the expected sorting of case 15, and sorts cases 12 and 14 two ways (check 4).
- F2. Case 14 is the pair the skill's own example of a difference shows (lines 170 to 175 of `skills/code/codebase-design/SKILL.md`); the brief does not say the example must be replaced (check 9).
- F3. Item 4 covers only "a file to create". An ignored `CLAUDE.md` that exists and is changed by the sync breaks the commit the same way, and this repository is in that state (check 6).
- F4. Verify 4 cannot hold: none of the four files the grep lists holds a copy of the block (check 3).
- F5. "Each skill's `metadata.version` rises" contradicts `docs/dev/skill-layout.md` for `ordo-init`, which this plan already raised once (check 9).
- F6. Item 2's wording points at a section an existing `CLAUDE.md` need not have (checks 6 and 8).
- F7. Case 10 passes without the "close to half" rule; case 11 depends on a page kind it does not state (checks 4 and 5).

## 1. Names

Command: `git grep -n -e '<name>' -- . ':!.scratch'` for each name below.

- The Prose rule's sentence, `The standard is \`docs/dev/prose-standard.md\``: one hit, `skills/ordo/ordo-init/templates/shared-rules.md:26`, inside the paths. No hit outside.
- `ordo:shared-rules begin`: `README.md`, `templates/CLAUDE.md`, `templates/sync_rules.py`, `templates/sync_rules.test.sh`. None holds the block's text (see check 3). Not made false.
- `beside this skill` / `skills beside it`:
  - `skills/ordo/ordo-init/SKILL.md:29`, `:30`, `:405` (Rules: "from the templates of the `plan` and `roadmap` skills beside it"): inside the paths; line 405 is made false by item 6 and no item names it.
  - `skills/ordo/ordo-init/templates/check_config.py:9` and `:111`, `check_config.test.sh:21`: outside the paths; they state the order item 6 copies; not made false.
  - Same construct for the `ordo-init` folder, not made false by the step, and not mentioned by the brief: `skills/code/codebase-design/SKILL.md:31` and `:287`, `docs/adr/0047-...md:17` and `:38`, `skills/academic/writing/SKILL.md:30`, `skills/code/code-comments/SKILL.md:32`, `skills/academic/paper/SKILL.md:76` and `:77`, `skills/academic/grant/SKILL.md:35` and `:361`, `skills/academic/referee/SKILL.md:29` and `:227`. In this repository's layout the folder they name does not exist: `ls -d skills/code/ordo-init` prints "No such file or directory". Rule 14 of the change standard makes the builder grep the construct and "carry the change to every hit or say why not"; the brief should say these stay, or the builder has to decide it.
- `A failing command`: `skills/ordo/ordo-init/SKILL.md:384` (inside); `docs/figures/gen_figures.py:2206`, `docs/figures/pipeline.svg:18`, `README.md:68` (outside). The stop stays for an existing repository, so none is made false.
- `No commit allowed`: `SKILL.md:166`, `:285`, `:391` (inside); `docs/figures/gen_figures.py:2213`, `docs/figures/pipeline.svg:34`, `README.md:68` (outside). The stop's name stays; not made false.
- `git status --short` as the command that shows the files written: `skills/ordo/ordo-init/SKILL.md:391` only, among `ordo-init`'s files. The other hits (`diagnose`, `grill:213`, `land`, `refute`, `spec`, `plan-orchestration`, the state-file template) are other skills' own uses; not made false.
- `of <m>` (the count's form): `skills/code/codebase-design/SKILL.md:146` (inside). The hits in `docs/glossary.md:87`, `plan-terms.md:82`, `plan-orchestration/SKILL.md:413` and `:415`, `plan/templates/orchestrator-state.md:69` are the position line, another thing; not made false.
- `asks something else` / `holds more than`: `skills/code/codebase-design/SKILL.md:98` and `:103` only (inside).
- `Read before you act`: `skills/ordo/ordo-init/SKILL.md:246`, `templates/CLAUDE.md:13` (both inside). No hit outside.
- `ruff\|pyright` outside the Python template: `templates/gitignore/python.gitignore:8` (`.ruff_cache/`). Not made false.
- `README.md:29` (the `codebase-design` row): "a rule that differs from yours in full, a rule your code follows in one counted line". Still true after items 7 to 9. `README.md:13`, `:40`, `:177` to `:189` (the `ordo-init` text): no sentence found that the nine items make false.
- `docs/glossary.md` entries on the step's subjects (lines 29, 32, 46, 94, 121, 130: commit rule, configured repository, existing repository, the questions, shared-rules block, sync): each ends "Stated in: ..." with item numbers of `ordo-init` ("Steps / An existing repository" 6 and 15, "Steps / A configured repository" 7 to 15 and 10, "Steps / A new repository" 3). They are made false only if the builder renumbers items; the brief does not say to keep the numbering.

## 2. The step line

Each part of step 6's line (plan.md line 22) and its item:

- "no longer runs a verification command in a new repository whose tree holds nothing for it to run on": item 1.
- "its shared rules name the prose standard without a fixed path, so the written `CLAUDE.md` names no page the repository lacks": item 2.
- "adds a glossary it writes in a configured repository to the plan configuration's `standards` list": item 3.
- "writes a `CLAUDE.md` that git ignores, leaves it ignored and out of the commit, and says so": item 4. The item is wider (the glossary, a page) and narrower (only a file to create; see check 6).
- "the default Python page it writes names no tool the repository does not configure": item 5. The item is wider: the three language pages.
- "finds the `plan` and `roadmap` templates in the installed layout": item 6.
- "marks an estimated count as an estimate": item 7.
- "shows a default rule that a sentence of the repository's pages contradicts as a difference": item 8.
- "counts a repository rule that the default only narrows as present": item 9.
- "check: both skills' text read against the ruling ... and the skill layout, and the verify list passes on main": "Verify before you report" 5 and the landing.

Parts of items with no part of the step line:

- Item 7, the sorting rule ("a rule whose estimate lies so close to half ... is put in group 4"). The step line says only "marks". It stands on the brief's decision 3, not on the ruling.
- Item 9, "and when it is weaker (it permits what the repository's rule forbids)". The step line and the ruling say "only narrows". Cases 13 and 14 rest on "weaker" alone.
- Item 1, the Rules sentence: no part of the step line; it is the ruling's sub-bullet "A red command is red".
- Item 4, "never changes that ignore rule, never offers to": the ruling's sub-bullet on the ignored `CLAUDE.md`.

No part of the step line is without an item.

## 3. Premises

- `grep -n 'beside this skill' skills/ordo/ordo-init/SKILL.md` prints lines 29 and 30. Holds. `ls -d skills/*/plan skills/*/roadmap` prints `skills/orchestration/plan` and `skills/orchestration/roadmap`. Holds. The installation: `ls -la ~/.claude/skills/` shows `ordo-init -> .../ordo-stable/skills/ordo/ordo-init`, `plan -> .../skills/orchestration/plan`, `roadmap -> .../skills/orchestration/roadmap`. Holds.
- `grep -n 'run once\|is not written as a check' skills/ordo/ordo-init/SKILL.md` prints 190 and 192. Holds. "the tree just written, which holds no source and no test": `references/new-repository.md` line 44 writes `src/` "with the build files for the kind as far as question 3 fixed them", so the tree holds build files and no source. Holds as far as the page says.
- `templates/shared-rules.md` line 26: holds, quoted text equal. `sync_rules.py` compares the block with the file line for line (read, lines 171 to 184). Holds.
- "Steps / A configured repository" 10 writes the glossary (line 348) and no item of those steps adds it to `standards`: holds by reading items 1 to 15. "Steps / An existing repository" 8 lists an offered glossary (line 222): holds.
- `git add -- <path> ...` at lines 157 and 279, `git status --short` at line 391: holds. "Its only ignore checks are for the worktree root and the configuration file ('Steps / An existing repository' 10)": not exact. `grep -n 'check-ignore' skills/ordo/ordo-init/SKILL.md` also prints line 149, "Steps / A new repository" 10: `git check-ignore -q --no-index .agents/skills/probe && ! git check-ignore -q --no-index docs/plan.yaml`. That line checks `.agents/skills`, which is not the worktree root. Item 4's "The ignore checks that exist ... stay as they are" names two checks and leaves this third one unnamed.
- "`git add` refuses an ignored path, and `git status --short` does not list it": rerun in a scratch repository with `.gitignore` holding `CLAUDE.md`: `git add -- b.txt CLAUDE.md` printed "The following paths are ignored by one of your .gitignore files: CLAUDE.md" and exit 1; `git status --short` printed only `A  b.txt`; `git check-ignore -v -- CLAUDE.md` printed `.gitignore:1:CLAUDE.md<U+0009>CLAUDE.md`. Holds. One fact the brief does not state: the same `git add` call staged `b.txt` and still exited 1.
- `grep -c 'ruff\|pyright' templates/docs/dev/coding-standards/python.md` prints 12; lines 8 to 10 only configure. Holds. `grep -c 'ruff\|pyright\|clang' skills/ordo/ordo-init/SKILL.md` prints 0. Holds. Rules line 415 "Build files are written only for what the user names". Holds. `cpp.md` and `typescript.md` name tools the same way: holds by reading, with a difference that matters for item 5 (check 9).
- `codebase-design/SKILL.md` line 105 and line 146: both quotes hold. Lines 97, 98 and 103: quotes hold.
- ADR 0047: read whole. Lines 23 lists four outcomes of the `standards` mode and none is made false by items 7 to 9. Holds.
- "No other ADR touches the step": see check 7; ADR 0001 touches item 2's subject.
- Item 2's premise in "What to build", "Every tracked file outside `.scratch/` that holds a copy of the block (find them with `git grep -l 'ordo:shared-rules begin' -- . ':!.scratch'`)": the command prints `README.md`, `skills/ordo/ordo-init/templates/CLAUDE.md`, `skills/ordo/ordo-init/templates/sync_rules.py`, `skills/ordo/ordo-init/templates/sync_rules.test.sh`. None holds a copy: `README.md:177` names the two markers in a sentence, `templates/CLAUDE.md` lines 5 and 6 hold the markers with nothing between them by design, and the script and its test hold the marker strings in code. The repository's own `CLAUDE.md` is untracked and ignored (`git check-ignore -v CLAUDE.md` prints `.gitignore:6:/CLAUDE.md`) and holds no block: `python3 skills/ordo/ordo-init/templates/sync_rules.py .` prints "error: CLAUDE.md has no single shared-rules block" and exits 2. So this half of item 2 has nothing to act on, and "Verify before you report" 4 ("each holds the template's text between its markers") is false for all four files and cannot be made true without filling `templates/CLAUDE.md` or changing a script, which the brief forbids.
- Case 16 on the unchanged tree: `PASS: sync_rules.py scratch tests`, `PASS: check_config.py scratch tests`, `ok: the plan-terms block equals the template`.

## 4. Cases and checks

Inconsistent or under-stated cases:

- Case 3. Cases 1 to 9 are "read", and this one expects a script's output on a folder that does not exist. Its second half also holds on the unchanged tree, since any block copied from the template equals it.
- Case 8. Question 3 of `references/new-repository.md` is "The build system, language standard and test harness"; a linter is none of the three. The case is consistent with item 5 ("the user named it in an answer") but the page gives the user no question that asks for it.
- Case 10. 25 of 60 is below half, so the rule is in group 4 by line 101 as it stands. The case shows the word "about" and nothing of the sorting rule item 7 adds.
- Case 11. It does not say what kind of page holds "mutation tables that prove each rule red". Item 8 takes a page "compared or noted at item 3"; "Steps / standards" 3 notes only a page "that holds rules". A design page or a README that holds no rules is neither, and the rule then goes to group 2. The expected result follows only for a compared or noted page.
- Case 14 contradicts the skill's example (check 9, F2).

A case that asks about a place the step does not change: case 2 (the one run in an existing repository) and case 16 (the two scripts). Both are behaviour the step keeps.

Cases 12 to 15 against item 9 as the brief words it. Item 9 has three sentences: S1 "covers everything the default rule covers and asks the same or more of it" gives present; S2 says this holds when the default is narrower in scope or weaker; S3 "A difference stays a difference only where following the default would break the repository's rule on a point the default requires, or the other way round".

- Case 12, expected present. Does not follow cleanly. The default's rule 1 is one numbered item whose second half reads "A defect in text or in a judgment ... is fixed by reading, with no test". That is worded as a requirement, and the same page holds "A test exists only for code". Under S3, following the default on a text defect (no test) breaks the repository's rule (a failing test first) on a point the default states, so S3 gives a difference. Under S2, the same sentence is "exempts a kind of defect", which gives present. The item needs to say that a default sentence that takes a kind of file or defect out of a requirement counts as an exemption however it is worded.
- Case 13, expected present. Follows only with the existing line 103 added. The repository's rule covers "the API"; the default rule covers every free function and forbids all but two kinds. A free function outside the API that is not file-local is forbidden by the default and not covered by the repository's rule, so S1's "covers everything the default rule covers" fails. Present comes out only when line 103 ("holds more than the repository's rule, and asks nothing else on what both cover") is kept and read together with S2.
- Case 14, expected present. Follows from S1 and S2 when the default is read as a minimum. S3 as worded can give a difference: following the default (only the checks of the changed files before landing, the whole list "once, at landing") breaks the repository's rule. S3's words "would break the repository's rule" are true of every weaker default, so S3 and S2 pull apart unless "on a point the default requires" is read as "something the default demands that the repository's rule forbids".
- Case 15, expected a difference. Does not follow from the item's text. The default (no polling at all) is stricter than the repository's rule (no polling loop shorter than a minute). S1 does not apply. S3 does not make it a difference: following the default breaks nothing of the repository's rule, and following the repository's rule breaks nothing the repository's rule requires. Line 103 as it stands can even read it as present (the default holds more and asks nothing else on short polling loops). The brief's reason, "the default forbids what the repository's rule permits", is a criterion the item never states. The item needs one more sentence: a default rule that forbids what the repository's rule expressly allows is a difference, set apart from line 103's default that says more where the repository's rule is silent.

## 5. The question: could this pass without the goal being reached?

Cases:

- 1: yes in part. It names a test command only. A build or install command derived from the build files could still be run, fail, and reach the stop.
- 2: yes; it holds on the unchanged tree. It is a control.
- 3: yes. A block that names "Read before you act" names no path, so the case passes also where `CLAUDE.md` has no such section or no line for the prose standard.
- 4: yes in part. It passes with a `standards` key present and the one-project form; a missing key and the `projects:` form are untested.
- 5 and 6: yes. They cover a created `CLAUDE.md`; an existing ignored one changed by the sync still breaks the commit.
- 7 and 8: yes in part. Python only, where every tool sentence opens "ruff's"; the C++ and TypeScript pages name tools by rule name or by config file.
- 9: no for the text; whether a session resolves the link is not in the case.
- 10: yes; see check 4.
- 11: yes or no by the page kind; see check 4.
- 12 to 14: yes; a builder can write the three sentences of item 9 as given and declare each present while S3 says otherwise.
- 15: it cannot follow from the item as worded; the builder has to add a rule the brief does not give.
- 16: yes; it holds on the unchanged tree and shows only that the scripts still run.

Items:

- 1: no, if every command of the new-repository case is unrun; yes under the narrower reading (check 9).
- 2: yes. The block can equal the template and still point at a section the file lacks.
- 3: yes in part, as case 4.
- 4: yes, as cases 5 and 6.
- 5: yes for C++ and TypeScript, since "names the tool" is not defined for a tool's rule names.
- 6: no, read as written.
- 7: yes for the sorting half; no threshold and no case.
- 8: yes; the pages item 8 reads are not settled (check 9).
- 9: yes; see check 4.

The check on the step's line (text read against the ruling and the skill layout, the verify list on main): yes. No command of the verify list touches any of the nine behaviours, and a reading shows what the text says, not what a session does with it. The plan answers this with step 2's five runs, which follow.

## 6. Implied inputs

Each has happened or would cost something.

- An ignored `CLAUDE.md` that exists and is untracked, changed by the sync or by an inserted block. This repository is in that state (`.gitignore:6:/CLAUDE.md`, the file on disk, no block). Item 4 covers only "a file to create". `git add -- CLAUDE.md` then fails at "Steps / A configured repository" 15 or "Steps / An existing repository" 16. The brief gives no expected result; by the ruling it is: written, left ignored, left out of the commit, listed apart.
- The ignored file is the only file written (a configured repository whose sync exits 2 with "no CLAUDE.md"). The commit then has no path. Expected result not stated; a sensible one is no commit and a last message that says so.
- `git add` with an ignored path among others exits 1 after staging the others (rerun in check 3). The text must take the ignored path out of the `git add` call, not rely on the call's exit status.
- An ignore rule outside the repository's `.gitignore` (a global excludes file, `.git/info/exclude`). `git check-ignore -v` then names a file outside the repository. Expected: the draft names that file; the brief's "which line of which ignore file" covers it, and Rules' "Every path in this skill's text is relative to the repository root" does not bind a printed path. Stated here so the builder does not restrict the wording to `.gitignore`.
- An existing `CLAUDE.md` with no "Read before you act" section that gets the block inserted ("Steps / A configured repository" 10, "Steps / An existing repository" 11). The new Prose rule then names a section the file lacks. This repository's own `CLAUDE.md` has no such section (`cat CLAUDE.md`: its only section is "A shipped file names nothing private"). No expected result in the brief.
- A repository with no prose standard, where the line is left out of "Read before you act" (line 246: "a line whose page the repository has not and the draft does not offer is left out"). The Prose rule then points at a line that is absent. No expected result.
- A configured repository whose `plan.yaml` has no `standards` key. The key is optional with default `[]` (`grep -n 'standards' skills/orchestration/plan/templates/plan.yaml`, line 14). Item 3 says "added to that `standards` list". Expected: the key written with the one path and the example's comment, as "Steps / An existing repository" 9 says of a written key; the brief does not say.
- The `projects:` form in item 3. "What it reads" 8 reads the glossary from the project the call names, or from the first project whose list names one. With none naming one, the brief does not say which project's list gets the path.
- A configured repository with an open plan. `grill` adds a new glossary's path "to the `standards` line of the configuration block of each open plan" (`skills/orchestration/grill/SKILL.md:307`). Item 3 adds it to `plan.yaml` only, so the open plan's briefs do not name the glossary until the block is rewritten. No expected result.
- A new repository where a command other than the test command comes from the build files. See check 9, item 1.
- A C++ or TypeScript repository with no linter or formatter configured. See check 9, item 5.
- The common page, `templates/docs/dev/coding-standards/common.md` line 7: "Each language has one formatter, with its configuration pinned in the repository." It names no tool by name, so item 5 leaves it, and the written page still states a tool the repository does not configure. The step line names only the Python page, so this is outside it; it is the same defect on the page written beside it.

## 7. ADRs

Reading as stated at the top: 0047 whole; 0001 to 0046 by status and the opening of the Decision, plus `grep -n -i 'ordo-init\|shared.rules\|sync_rules\|check_config\|glossary\|gitignore\|ignored\|verification page\|prose-standard\|standards. list\|estimate' docs/adr/00*.md`.

- ADR 0047 (status proposed). Touched by items 7 to 9 under its sentence "the `standards` mode adds and rewrites nothing that exists: a rule of a default page that already stands in the repository's pages, wherever it stands, is left as written; a missing rule that the code follows, or that is about how work is done, is drafted ... a missing rule that the code does not follow is listed, and written only when the user names it". No part of the brief contradicts it. Item 6's construct stands in its lines 17 and 38 for `ordo-init` ("which stands beside this skill's folder", "The skill depends on `ordo-init` standing beside it"); the step does not change that.
- ADR 0001 (status "proposed; superseded by 0030 in the `standards` key"). Touched by item 2 and not named by the brief. Its decision: "read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `ordo-init` skill's `templates/docs/dev/prose-standard.md`". It decides this for `/writing` and the skills that read the writing base, not for the shared rules, so item 2 does not contradict it. Item 2 gives the shared rules a third way of naming the same page (through `CLAUDE.md`), beside the two the ADR and `paper` use.
- ADR 0010 (verify list equal to the verification page): the brief names it; the step changes no command of this repository's verification page. Holds. Item 1 changes what a new repository's verification page holds (commands never run), which is that repository's page, not a matter of this ADR.
- ADR 0012 ("Every commit a skill makes on main names its paths in the commit command, `git commit -m <message> -- <path> ...`"): item 4 keeps that form and only takes a path out of it. No contradiction; the brief does not name it.
- No other ADR was found to touch the step. 0014 and 0026 name the prose standard's place for `code-comments` and for a manuscript; the step changes neither.

## 8. Dictated text

- Item 2: "the standard is the repository's prose standard, the page `CLAUDE.md` names under "Read before you act"". Place: `grep -n 'The standard is' skills/ordo/ordo-init/templates/shared-rules.md` prints line 26. Against the prose standard: holds (ASCII, no dash, no banned word). Against the change standard's rule 14 ("A sentence ... that the change makes false is a defect"): the sentence is false in a `CLAUDE.md` that has no such section or no prose-standard line in it (check 6).
- Item 7: `"about <n> of <m>"`. Place: `grep -n 'of <m>' skills/code/codebase-design/SKILL.md` prints line 146; the example's counts are at lines 183 and 187. Holds.
- Item 4: "as written and ignored by git", for the list of files. Place: the row "No commit allowed", `grep -n 'git status --short' skills/ordo/ordo-init/SKILL.md` prints line 391, and lines 166, 285, 374. Holds.
- Case 4: `../docs/glossary.md` in `.agents/plan.yaml`. Holds against "Steps / An existing repository" 9 (paths relative to the folder that holds the file).
- Item 1: "Rules says so in one sentence" gives no words, but the sentence asked for is a bare prohibition ("No step ... writes a test, a source file or any other file so that a command passes"). `docs/dev/skill-layout.md`, "Writing for an agent": "a rule written as a prohibition names the behaviour to do instead, in the same bullet". The bullet has to say what is done instead (the command is written as named, or the stop stands), still in one sentence.
- No other line of the brief gives words for a file.

Two limits the brief does not state: `python3 -c ...` of "Verify" 3 prints `ordo-init 1013 4.0.0` and `codebase-design 1019 1.0.0` on the unchanged tree. The descriptions have 11 and 5 characters left under 1,024, so "the frontmatter description where it states the behaviour" can take almost no added words.

## 9. Whether each item can be built as written

- Item 1. Two readings. (a) In a new repository no command is run at all and each is written unrun. (b) Only "the commands the user named in question 3" are unrun, and a command the skill derives from the build files it wrote is still run once. Under (b) a failing derived command reaches the stop "A failing command", which the item says is never reached from a new repository. Also touches, without the brief naming them: Rules line 406 (the "two exceptions", one of them "the one run of each verification command"), "Steps / An existing repository" 12 item 3 ("with the commands' results for a verification page") and line 192 ("A command that fails is not written as a check"), each of which needs the new-repository exception. The general clause covers them; they are listed so none is missed.
- Item 2. Buildable. Its second half and "Verify" 4 have nothing to act on (check 3, F4). `templates/CLAUDE.md` is in the paths and no item says what changes in it.
- Item 3. Two readings for the `projects:` form and for a missing `standards` key (check 6). Rules line 412 "The skill never overwrites an existing page or plan configuration" stands beside it; a diff after approval is allowed by line 413, so no contradiction.
- Item 4. Narrower than the ruling's "handles the ignored file" (check 6, F3). "A page" in the list of files to check also needs the three-case wording at "Steps / A new repository" 3, where the `.gitignore` is itself only drafted when the check runs; the brief does not say whether the check there reads the drafted `.gitignore`. Reading (a): `git check-ignore` on the folder as it is, which in an empty folder sees no rule. Reading (b): the drafted ignore file is taken into account. `templates/gitignore/common.gitignore` ignores `.agents/*` and `.claude/` only, so (a) costs nothing for the default files.
- Item 5. Two readings of "a rule that only configures or runs the tool" and of "the sentence or clause that names the tool".
  - `cpp.md` line 8: "clang-format formats every source file from a `.clang-format` ... It sets a 4-space indent, braces on the same line, left-aligned pointers (`T* p`) and a column limit". Reading (a): it only configures the tool and is left out whole. Reading (b): the indent, the braces and the pointer style are requirements and stay. `codebase-design` "Steps / standards" 5 already takes reading (b) for the same page ("split by requirement", and the example's rule "A pointer binds to its type").
  - `typescript.md` lines 19, 34 and others name a rule of a tool and not the tool: "`@typescript-eslint/no-non-null-assertion` fails a non-null assertion `!`", "`no-var` fails a `var`". Reading (a): these name ESLint and go. Reading (b): they name no tool and stay. Line 19 holds a requirement only by implication, so leaving it out drops the requirement.
  - `typescript.md` line 7, "`tsconfig.json` sets `"strict": true`": whether the compiler is "a type checker" the page names is open.
  - The existing rule at "Steps / A new repository" 3, "A check the repository does not have yet is written as 'checked by reading at review' in place of the placeholder's sentence part", treats a missing check the other way (a replacement, not a removal). Item 5 does not contradict it, since that rule is for a placeholder, but the builder has to keep the two apart in one place.
- Item 6. Two readings. `check_config.py` reads "this skill's folder ... with every link resolved" and so, installed, never looks in the folder of links; it finds `plan` in the group folders of the pinned worktree. Reading (a): the text says the same, links resolved. Reading (b): the text starts from the folder the skill was reached through. The two find the same file in the present installation and can differ where the links of one skills folder lead to different trees. "State the same order" settles the order, not the starting folder. Rules line 405 is made false and is in the paths. The script finds only `plan`; `roadmap` has no script, so "the text and the script cannot disagree" holds for `plan` alone.
- Item 7. "so close to half that the pattern's error could move it across" has no measure. Reading (a): a judgment per rule. Reading (b): a fixed margin the builder picks, which would be a number the brief reserves for nobody. No case tests either.
- Item 8. It reads pages "compared or noted at item 3". "Steps / standards" 3 says "Only these pages are compared, so a rule that stands on another page of the repository counts as missing", and step 10 (line 157) tells the user the noted pages "were not compared". After item 8 the noted pages are read for the opposite of each default rule, so both sentences need new wording that the brief does not give. Reading (a): noted pages are read whole for contradictions only. Reading (b): only the compared pages are, and "noted" in the item is loose. Line 143 ("The words of group 1 say that the two pages state the rule differently") and the form of line 141 ("the repository's rule quoted") do not fit a described practice that is no rule. Step 11's "the repository's rule of such a difference is left as written" fits.
- Item 9. See check 4 for S1 to S3. It also contradicts two parts of the skill the brief does not say to change:
  - Line 98: "asks something else, such as a different limit, a different order or a different check, whether or not the two can both be followed". S3 makes a difference depend on the two not being followable together, which is the opposite of "whether or not".
  - The made-up example of the draft, lines 170 to 175: difference A is "The builder runs the whole verify list on the whole tree before it reports" against the default's changed-files checks. That is case 14's pair, which the brief expects to be present with nothing shown. The example must get another difference, and the count "61 default rules already stand" with it. The item asks for "one made-up example of each of the two" and does not say this one goes.
  - Line 103 (the default that "holds more") has to stay and be set apart from the new rule, or case 15 comes out present.
- "Each skill's `metadata.version` rises as `docs/dev/skill-layout.md` says" and "Verify" 3 "each version has risen". `docs/dev/skill-layout.md` line 24: "A plan that changes a skill raises one part of its `metadata.version` once". `git show v9.3.0:skills/ordo/ordo-init/SKILL.md | grep version` prints 3.0.0 and the tree holds 4.0.0, raised by step 5 of this plan. A second raise in the same plan breaks that sentence. For `codebase-design`, `git cat-file -e v9.3.0:skills/code/codebase-design/SKILL.md` fails: no release holds the skill, and brief 4 line 93 kept 1.0.0 for that reason ("no release holds the skill yet, only the release candidate of this plan"). The same reason still holds. If a raise is wanted anyway, the part is open too: the written Python page, the shared-rules block and the sorting of rules all change output, which skill-layout's line on the major part covers, while each can also be read as a minor change.
- "A path beyond this list that an item makes false is changed and named in the report": `docs/figures/gen_figures.py` and the two figures are not in the list; nothing in them was found to be made false (check 1).

## Declined to judge

- Whether the nine defects are the right account of what the runs on `v9.4.0-rc.2` showed: the runs' records were not part of this check.
- Whether the brief's three decisions (commands written unrun, the prose standard named through `CLAUDE.md`, an uncertain count to group 4) are the right designs. They are the user's or the orchestrator's.
- Which reading is the right one wherever two are given above.
- Whether a session that follows the changed text behaves as the text says; that is step 2's runs.
- The parts of ADRs 0001 to 0046 beyond their status and the opening of their Decision, and the parts of `docs/glossary.md`, `plan-terms.md`, `check_config.py` and `sync_rules.test.sh` not read, as listed at the top.

## Closed

- F1, F2 (item 9, cases 12 to 15, the example): item 9 rewritten with one criterion for present and one for a difference, the sentence of line 98 and the example's difference A named for change, cases 12 to 15 restated.
- F3 (an ignored file that exists): item 4 covers a file created or changed, the commit with no path left, and the path taken out of `git add`.
- F4 (no copy of the block): the second half of item 2 and check 4 of "Verify before you report" removed.
- F5 (versions): no version rises; the brief says why.
- F6 (the Prose rule's wording): the rule names the repository's prose standard and no section.
- F7 (cases 10 and 11): case 10 restated with a count near half and a second case far from it, a measure given; case 11 names the page as one compared or noted.
- Check 1 (the same construct in other skills): item 6 widened to every skill that names the `ordo-init` folder as beside its own, and the paths with it.
- Check 6 (implied inputs): a missing `standards` key, the `projects:` form and open plans stated in item 3; the common page stated in item 5.
- Check 8 (a bare prohibition): item 1's Rules sentence names what is done instead.
- Check 9 (two readings): items 1, 4, 5, 6, 7 and 8 each state the one reading.

Agent usage: a33239329078fdf56, claude-fable-5-2, 210438 tokens, 21 tool uses, 7.3 minutes.
