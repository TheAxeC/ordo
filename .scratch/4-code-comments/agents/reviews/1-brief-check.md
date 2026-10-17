# Step 1 brief check (on main at 893b1fd)

The tree was read on main at 893b1fd (`git log --oneline -1` printed `893b1fd Open plan 4, code-comments`). The working tree also holds the uncommitted brief and the state file's dispatch entry (`git status --short` printed ` M .scratch/4-code-comments/orchestrator-state.md` and `?? .scratch/4-code-comments/agents/briefs/1.md`). `LC_ALL=C grep -n '[^ -~]' .scratch/4-code-comments/agents/briefs/1.md` printed nothing, so the brief is ASCII. No file was changed.

## 1. Names

- **The new skill name `code-comments`**: `grep -rn -l 'code-comments' --exclude-dir=.git --exclude-dir=.scratch .` printed `docs/academic-coverage.md`, `docs/roadmap.md` and the ADR 0014 file. The hits are `docs/roadmap.md:21`, `:24` and `:25` (entry 4's heading, Goal and Gate), `docs/academic-coverage.md:35` (`| code-comments | 4 |`) and ADR 0014 lines 7, 11 and 23. They describe the skill this step builds, and the change makes none of them false.
- **The list of who launches the effort agents and runs on `reviewer`** (the phrase "review agents of `writing`"): `grep -rn --exclude-dir=.git --exclude-dir=.scratch -E 'review agents? of .?writing|agents of .?/?writing|`writing` for its' .` printed only paths inside "Paths this step writes" (the five `agents/ordo-*.md` files, `.agents/plan.yaml:10`, `skills/plan/templates/plan.yaml:12,27`, `skills/plan/templates/orchestrator-state.md:14,26`, `plan-terms.md:39,99`, `docs/glossary.md:44,104`), plus `skills/writing/templates/prose_facts.py:2`, which describes `/writing` alone and stays true. The ledger copy `.scratch/4-code-comments/orchestrator-state.md:20` (`grep -rn 'review agents of /writing' .scratch --include=orchestrator-state.md`) will not name `/code-comments` after the change. It belongs to the orchestrator and is not this step's to change.
- **The set of skills whose terms stand in the plan-terms block** (the step gives the term **finding** a `/code-comments` sense in `plan-terms.md`): `grep -rn -E '`/?writing`' skills docs utils agents README.md .agents/plan.yaml` printed `skills/repo-setup/templates/docs/glossary.md:3: This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `writing`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, ...`. This file is outside the paths. The change makes the sentence false, because `code-comments` will use a term of the block in a sense of its own and the list leaves it out. `git show 6105b48 --stat` shows that plan 3's step 1, which added `writing`'s senses of the same terms, also changed `skills/repo-setup/templates/docs/glossary.md`.
- **The comments on `reviewer` and `reviewer_effort` in `skills/plan/templates/plan.yaml` (lines 12 and 27)**: `grep -n -i -E 'comment|#' skills/ordo-init/templates/check_config.py` printed `95: m = re.match(r"^([a-z_]+):\s*(.*?)\s+#\s*(required\.|optional, default (.*?)\.\s)", line)`. `check_config.py` reads this template's comments for each key's required/optional status and its default, and `skills/ordo-init/templates/check_config.test.sh:24` copies the template (`cp "$script_dir/../../plan/templates/plan.yaml" ...`). The change makes nothing false as long as the `required.` and `optional, default high.` prefixes stay. The brief says neither that the prefixes must stay nor that `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` must be run, although change standard rule 6 asks for the checks of the files the step changes.
- **The versions `5.0.1` and `5.2.0`**: `grep -rn --exclude-dir=.git --exclude-dir=.scratch -E '\b5\.0\.1\b|\b5\.2\.0\b' .` printed only `skills/plan/SKILL.md:5` and `skills/repo-setup/SKILL.md:5`. No hit outside the paths.
- **The script name `strip_comments`**: `grep -rn --exclude-dir=.git --exclude-dir=.scratch strip_comments .` printed `docs/roadmap.md:24,25` and ADR 0014 lines 7, 11 and 23. All of them agree with the brief.
- **`skills/plan/templates/plan.projects.yaml`**: `grep -n -E 'reviewer|writing'` printed the keys at lines 14, 29, 41 and 56 with no comment. Nothing there becomes false.

Findings:
- `skills/repo-setup/templates/docs/glossary.md:3` becomes false. It lists the skills whose terms stand in the plan-terms block and will leave out `code-comments`. The path is missing from "Paths this step writes" and from item 4 of "What to build".
- `skills/plan/templates/plan.yaml` lines 12 and 27 are parsed by `skills/ordo-init/templates/check_config.py:95`. The brief does not require their `required.` / `optional, default high.` prefixes to stay. Its "Verify before you report" leaves out `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`, the check that covers that template.

## 2. The step line

- "`skills/code-comments/SKILL.md` (1.0.0) as D1 to D4 and D7 rule": What to build 1 (version "1.0.0", Invocations for D2, the rules for D3, Steps 5 to 8 and the bullets for D4, "The rewrite" for D1 and D7, plus E1 and E2).
- "`templates/strip_comments.py` computing only what D7 approves": What to build 2.
- "its test `templates/strip_comments.test.sh`": What to build 3.
- "added to the verify list in `docs/dev/building.md`": What to build 4, last bullet (building.md and the filter line of change-standard.md).
- "wired in where `writing`'s review agents are named (`agents/ordo-*.md`, the `reviewer` and `reviewer_effort` comments of `skills/plan/templates/plan.yaml` and `.agents/plan.yaml`)": What to build 4, bullets 1 to 3. The brief also covers `orchestrator-state.md` and `plan-terms.md`. `.agents/plan.yaml` has no `reviewer_effort` key (`cat -n .agents/plan.yaml`), so line 10 is its only comment.
- "listed in `README.md` and `docs/dev/scripts.md`": What to build 4, bullets 4 and 5.
- "with ADR 0014 followed": "What is on the tree" (ADR 0014 bullet) and What to build 1.
- "the check: the skill read against `docs/dev/skill-layout.md`, the rulings and ADR 0014": no requirement. "Verify before you report" has the frontmatter parse (2), the grep (3) and the list-item and sentence-length reading (5), but no item that reads `SKILL.md` against the layout, D1 to D7, E1, E2 and ADR 0014.
- "`sh skills/code-comments/templates/strip_comments.test.sh` exits 0 after failing on the unchanged tree": Verify 1, first bullet, and Verify 4. Verify 1 runs it through `2>&1 | tail -1` and checks only the `PASS:` line. The exit status the step line names is not checked, because without `pipefail` the pipeline's status is `tail`'s.
- "the character-set check over the changed files prints nothing": Verify 1, fourth bullet (19 paths, every path of the list except the report).
- "(1 commit)": the landing's job, outside the builder's brief.

Findings:
- The step line's own check, "the skill read against `docs/dev/skill-layout.md`, the rulings and ADR 0014", has no item in "Verify before you report", so neither the builder's report nor `/refute`'s rerun of the named checks carries it.
- "exits 0" is not checked as written. `| tail -1` hides the test's exit status. It needs a run under `set -o pipefail`, or the exit status reported.

## 3. Premises

- "`ls skills` lists 14 folders and no `code-comments`": `ls skills; ls skills | wc -l` printed diagnose, grill, land, ordo-help, ordo-init, plan, plan-orchestration, plan-retro, refute, repo-setup, roadmap, session-retro, spec, writing, and `14`. Matches.
- The agent definitions, lines 3 and 6: `grep -n writing agents/*.md` printed lines 3 and 6 of each of the five files. Matches.
- The configuration comments: `grep -n writing` printed `skills/plan/templates/plan.yaml` 12 and 27, `skills/plan/templates/orchestrator-state.md` 14 and 26, and `.agents/plan.yaml` 10. Matches. `grep -n -E 'reviewer|writing' skills/plan/templates/plan.projects.yaml` printed `14: reviewer`, `29: reviewer_effort`, `32: repair_reviewer`, `41: reviewer`, `56: reviewer_effort` and `59: repair_reviewer`. Lines 14 and 29 match. The second project's keys at 41 and 56, also with no comment, are not named.
- plan-terms: `grep -n writing skills/repo-setup/templates/plan-terms.md` printed lines 39 (**effort agent**), 41 (**finding**, "Also, for `/writing`, ...") and 99 (**reviewer**). `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. Matches.
- README: `grep -n writing README.md` printed 26 (the table row), 77 ("The plan skills, `grill` and `writing` launch their agents through five agent definitions, ...") and 104 (the copy loop). Matches.
- `docs/dev/scripts.md`: `cat -n` shows `prose_facts.py` at line 24. Matches.
- `docs/dev/building.md` `sh` block at lines 6 to 11: `cat -n` shows the fence at 5 and 12 and the commands at 6 to 11. Matches. The `land` skill's Steps 2 (`sed -n 52,62p skills/land/SKILL.md`) compares and rewrites the verify list. Matches.
- Versions: `grep -n '^  version' skills/*/SKILL.md` printed plan `5.0.1` and repo-setup `5.2.0`. Matches.
- `skills/writing/SKILL.md` Steps 4, 6, 7 and 8, "Agent prompts" and Stops: read in full. Matches.
- The gate's diff `a0aa831`. `git show a0aa831 | grep -c '^+[[:space:]]*///'` printed `71`. Matches. `grep -n 'writable='` printed two added lines holding `/*writable=*/true`. `grep -nE '^\+#include.*//'` printed four `#include` lines with trailing `//` comments. Raw strings and digit separators on added C++ lines: both greps printed nothing. These match. Two parts differ:
  - "a string holding `"save as"` and `"rite"` next to a `//` comment" does not match what the diff holds. Diff line 1435 is `CHECK(saves.save(1, ByteSpan::of(payload), "rite", WriteMode::Sync).ok());    // "save as" is fine`: the string literal is `"rite"`, and `"save as"` stands inside the `//` comment.
  - "`#` comments in four `CMakeLists.txt` files": all four files of the diff hold `#` comments in their whole text, but `git show a0aa831 -- <file> | grep -E '^\+' | grep -n '#'` printed added `#` comment lines only for `src/engine/groups/CMakeLists.txt` (1 line) and `src/engine/save/CMakeLists.txt` (6 lines). It printed none for `src/engine/app/CMakeLists.txt` or `src/engine/tests/CMakeLists.txt`.
- The Cathedra head comment: `sed -n 1,60p ../cathedra/utils/scripts/plan/strip_comments.py`. Matches (one space per comment, whitespace runs to one space, a directive keeps its own line, literals whole, imports `source_lexer`). It also says "a backslash-newline outside one is deleted, as the compiler deletes it", which the brief's C and C++ rule leaves out (check 6).
- ADR 0014's title and ADR 0001's quoted Decision: `cat -n docs/adr/0001-*.md docs/adr/0014-*.md`. Both match word for word.
- "ADR 0013 governs `/writing` only": matches its Decision.
- "No other ADR touches the step: 0002 to 0012 govern ... the verify list ...": does not match. ADR 0010's Decision governs the verification page, and this step changes `docs/dev/building.md` (check 7).
- "The verify list in the state file equals the six commands of `docs/dev/building.md`": `grep -n -A12 verify .scratch/4-code-comments/orchestrator-state.md` printed the six commands with the change standard's filters. Matches.

Findings:
- The gate-diff premise calls `"save as"` a string. It stands inside the `//` comment of diff line 1435. The string on that line is `"rite"`.
- The gate-diff premise says four `CMakeLists.txt`. Only `groups/` and `save/` carry `#` comments on lines the diff adds, which is the shape D5 names.
- `plan.projects.yaml` also has the keys at lines 41 and 56, with no comment.
- "No other ADR touches the step" is wrong for ADR 0010.

## 4. Cases and checks

- Cases 1 to 5, 9 to 12 and 14 to 18: consistent with change standard rules 13 and 21 and with "Scripts compute facts; judgment is read". Each tests a behaviour whose failure keeps a code change as `equal` or refuses a comment-only rewrite. Whether each can fail without its rule is check 5.
- Case 6: inconsistent with itself. The case is "a string literal that holds `//`", but its example's literal `"rite"` holds no `//`.
- Case 7: consistent with the rules. Check 5 shows it cannot fail.
- Case 8: consistent with the rules. Check 5 shows it cannot fail.
- Case 13: consistent with the rules.
- Case 19 ("No argument, and `--compare` with one path: the usage and exit 2"): kept as a test. The skill always passes `--compare` and two paths (rewrite item 6), so no caller reaches this path, and the change standard's "Scripts compute facts; judgment is read" says "A test exists only for a script, and only for behaviour whose failure costs something". The brief's cost sentence ("a wrong exit on a file the script cannot read") covers cases 16 to 18, not 19.
- Case 20 ("A path holding a space and a single quote: read as one argument"): kept as a test, but nothing in a Python script handles this. `sys.argv` gives the path as one element whatever it holds, so the test passes with no code for it. Change standard rule 13 calls that an audit, not a proof, and rule 11 forbids additions with no real user. The place where such a path matters is the skill's shell command (rule 15), and that place has no case (check 6).
- Cases 21 to 29: consistent; each is checked by reading `SKILL.md`.
- No case asks the builder to check, quote or explain a place the step does not change. The game-engine lines are fixture text copied into scratch files.

Findings:
- Case 6: the description and the example disagree, since the example's literal holds no `//`.
- Case 19 is kept as a test of a path no caller reaches, against "A test exists only for ... behaviour whose failure costs something".
- Case 20 is an audit by rule 13, since the script has no code it tests. The real place is the skill's command.

## 5. The question

The goal part of step 1 is the skill's text, the script and its test: a review that reads only the comments a diff adds or changes, and a rewrite kept only when `strip_comments.py --compare` prints `equal`, with a file that differs put back as it was.

- Case 1: no. A script without `//` stripping prints `differ`.
- Case 2: no, as a control for case 1. A script that strips nothing also passes it, which is what a control is for.
- Case 3: no. Without `/* */` handling it is `differ`.
- Case 4: no. Without whitespace collapse the reflow is `differ`.
- Case 5: no, for the same reason.
- Case 6: yes. Changing `"rite"` to `"rote"` gives `differ` in a script that reads no string literals at all, since the literal is code either way. A literal holding `//` with the change after the `//`, such as game-engine's `"http://127.0.0.1:"` (`src/engine/tests/src/fetch_main.cpp:71`, from `git grep`), is what fails without the string rule.
- Case 7: yes. `'/'` followed by `/` never forms `//` (the quote stands between the slashes), so a script with no character-literal rule passes both halves. A character literal holding a double quote (`'"'`) or an escaped quote (`'\''`), followed by a `//` comment that changes, fails without the rule. A script that reads no character literals opens a string at that quote and swallows the comment.
- Case 8: yes. `R"x(a */ b // c)x"` holds no `"` and no `\`, so a script that reads it as an ordinary string literal gets the same result wherever the content changes. The case fails without the raw-string rule only when the raw content holds a `"` or ends in a backslash, followed by a change after a `//` inside it.
- Case 9: yes for the `equal` half. `1'000'000` has two separators, so a script that reads `'` as a character literal pairs them into the literal `'000'` and still finds the `//` comment. An odd number of separators, such as `1'000 // c`, makes such a script swallow the comment. The `differ` half passes for any script.
- Case 10: no. A comment that ends at the newline exposes the next line as code.
- Case 11: no. Full whitespace collapse fails the second half.
- Case 12: no.
- Case 13: yes as written. "differ inside a quoted argument holding `#`" passes without the quoted-argument rule whenever the change stands before the `#`. The change has to be after the `#`.
- Case 14: yes as written. A single-line `#[[ ... ]]` read as a `#` line comment still gives `equal`. The bracket comment has to span lines with the change on a later line. The bracket argument `[[ a # b ]]` also has to change after the `#`.
- Case 15: no. A crash or a wrong exit fails it.
- Cases 16 to 18: no.
- Case 19: no, but see check 4.
- Case 20: yes. Python passes it with no code for it (check 4).
- Cases 21 to 23, 26 and 27: no. Reading `SKILL.md` shows the refusal or the exclusion, which is this step's part.
- Cases 24 and 25: no for this step's part, the bullets that produce the result. Whether the agents behave so is the gate's (step 2).
- Case 28: yes. `SKILL.md` can state rewrite item 5 exactly and still miss the case. The `git status --porcelain` comparison cannot see an agent's edit to a file that was already modified before the rewrite, because its status stays ` M`. In the default invocation those are the files under review. `git restore --` would also bring a file back to git's version, not to its state before the rewrite.
- Case 29: yes. On the gate's own diff, rewrite item 3 copies both `src/engine/groups/CMakeLists.txt` and `src/engine/save/CMakeLists.txt` into one scratch folder "keeping its file name". The second copy overwrites the first. Item 6 then compares one file with the other's copy, prints `differ` and "puts the scratch copy back over the file", so one CMakeLists.txt is overwritten with the other's text. `SKILL.md` can follow the brief to the letter and still pass this case by reading.
- The step-line check, "the skill read against skill-layout, the rulings and ADR 0014": not in the brief's Verify list (check 2). Read as the step line says, it does not catch the defects of rewrite items 3 and 5, because the brief dictates them.
- The step-line check "test exits 0 after failing on the unchanged tree": yes for the cases above that pass without their rule (6, 7, 8, 9, 13, 14).
- Character-set check: no. It is a fact over the named files.
- What to build 1 (`SKILL.md`): yes, through rewrite items 3, 5 and 6 as above. Item 6, "For each file the agent changed", does not say how the session knows which files changed. If it uses the status comparison of item 5, a code change in a file that was already modified is never compared and is kept, against D7 and ADR 0014.
- What to build 2 and 3 (script and test): yes, through the cases named above.
- What to build 4 (the wiring): Verify 3 (`grep -n "code-comments" ...` prints a line in each file) is satisfied by one mention anywhere in a file, so it can pass with `plan-terms.md` naming `code-comments` only under **finding**. Reading has to check **effort agent** and **reviewer**. It also leaves out `skills/repo-setup/templates/docs/glossary.md:3` (check 1).

Findings:
- Cases 6, 7, 8, 9 (`equal` half), 13 and 14 can pass with a lexer that lacks the rule each is for. The changes each needs are given above.
- Case 20 passes with no code for it.
- Cases 28 and 29, and What to build 1, can pass by reading while rewrite items 3, 5 and 6 fail the goal. The scratch copies of two `CMakeLists.txt` from the gate's diff collide. The status comparison misses edits to files modified before the rewrite, and `git restore` puts back git's version rather than the file as it was.
- Verify 3 can pass with partial wiring in `plan-terms.md`.

## 6. Implied inputs

This is a code step. These are the inputs the step implies but never states, limited to inputs that have happened or whose wrong answer costs something:

- Two picked files with the same name in different folders. This happens in the gate's diff: `src/engine/groups/CMakeLists.txt` and `src/engine/save/CMakeLists.txt` both carry added `#` comments. Missing. Expected: each scratch copy is kept apart (under its repository path inside the scratch folder), each file is compared with its own copy, and neither file is overwritten with the other's text.
- In the default invocation, a file the diff already modified (or one already untracked), which the rewrite agent also changes although no picked finding names it. This is the normal case of the default invocation. Missing. Expected: the change is detected (by content, not by the porcelain status letters) and the file is put back to its text before the rewrite, so the user's uncommitted work in it is kept. A file a picked finding names that was already modified is compared with its scratch copy (item 6) whatever its status.
- An `#include` line with a trailing `//` comment reworded, such as `#include "save/save_container.h"   // SaveFileOut + finalize/join: the container the "save" kind writes`. Four such lines are in the gate's diff. Missing. Expected: `equal`. A script that copies directive lines verbatim to keep them on their own line gives `differ`.
- A multi-line `#define` continued by backslash-newline. `git grep -l -E '^\s*#\s*define.*\\$'` in game-engine printed 19 files. D7 names "a backslash-newline", and the brief's C and C++ rule covers it only inside a `//` comment. Missing. Expected: the directive runs over its continuation lines. A comment inside it reworded gives `equal`, and a continuation line's code changed gives `differ`.
- A reworded comment that holds an apostrophe and a double quote, such as `// the envelope's `vms`` or `// "save as" is fine`. `git show a0aa831 -- '*.cpp' '*.h' '*.hpp' | grep -nE '^\+.*//.*"' | wc -l` printed 23 such added lines. Missing as a reworded-comment case (case 6 changes the code, not the comment). Expected: `equal`.
- A comment deleted: a trailing `//` comment removed from its code line, a whole comment line removed, and the first line of a file removed when it is a comment (`git show a0aa831:src/engine/save/src/save_runtime.cpp | head -3` starts with a comment line). D3's "serves no purpose" findings are applied by deletion. Missing, except a comment removed between two `#define` lines (case 11). Expected: `equal` for each, including at the file's start and end.
- In the default invocation, an untracked file not yet added. `git diff HEAD` does not show it, and Steps 6's prompt holds "the diff". Missing. Expected: the prompt marks each untracked file as added whole, so its comments are reviewed.
- A diff that deletes, renames or adds a binary file. For a deleted path, `git show <head>:<path>` fails. A binary file is no text for `cat -n`. Missing. Expected: a deleted file and a binary file are left out of the review, and a renamed file is read at its new path.
- A range whose `<head>` is not the checked-out `HEAD`, or whose files differ in the working tree from `git show <head>:<path>`, followed by `apply`. The findings' places and quotes come from `<head>`'s text, but the rewrite edits the working tree. Missing. Expected: the rewrite refuses each file whose working-tree text differs from the text that was reviewed, and names it.
- `apply <numbers>` with no report earlier in the session, for example after a new session or a compaction. Missing from the cases and from the Stops list. Expected: a refusal that names the missing report, with nothing changed.
- A single argument with no `..` (`/code-comments a0aa831`) in a one-project repository, and the same in the `projects:` form, where it could be a project name. Missing. Expected: in the `projects:` form the first argument is the project. Otherwise the argument is refused with its name, and is not reviewed as some other diff.
- Under change standard rule 15, a range end and a diff path that reach shell commands (`git rev-parse`, `git diff`, `git show <head>:<path>`, `cat -n`, `grep`, the scratch copy, `git restore`, `strip_comments.py --compare`). Examples: a ref such as `main..'$(touch x)'` or one starting with `-`, and a path holding a space and a single quote. Missing as skill cases; case 20 is the script's. Expected: each value goes in as one single-quoted argument, the ref is refused as "A range that does not resolve", and no other command runs.
- Under rule 15, an instruction inside a comment, which reaches the checking agent's prompt and the rewrite agent's prompt. The finding agent's bullets say such an instruction is not followed (line 72). The checking agent's bullets (lines 77 to 86) and the rewrite agent's prompt (rewrite item 4) do not, although `/writing`'s checking agent has that bullet (`skills/writing/SKILL.md:235`) and the rewrite agent edits files. Missing. Expected: both treat it as text under review, and the rewrite agent edits only the picked comments.
- A string literal holding `//` (`"http://127.0.0.1:"`, game-engine `src/engine/tests/src/fetch_main.cpp:71`), a character literal holding `"`, a raw string holding `"`, and an odd count of digit separators. These are the fixtures cases 6 to 9 need (check 5). Expected: `differ` when the code after the `//` inside the literal changes, and `equal` when only the comment after it changes.
- A CMake `#` comment after an argument on the same line, as in game-engine `src/engine/app/CMakeLists.txt`'s `PUBLIC  missal::core missal_engine_groups   # Mode is in groups, and engine.hpp names it` (a context line of the gate's diff). Missing; low cost. Expected: the reworded comment gives `equal`, and a changed argument before it gives `differ`.
- The scratch folder of rewrite item 3: where it is made and whether it is removed. Not stated. Expected: made with `mktemp -d` under `$TMPDIR`, kept until the comparisons end, and named or removed in the final message.

Findings: every item above is missing from "Cases". The two that lose work in the gate or in the default invocation come first: the same-name scratch copies, and the status-based detection with `git restore`. These two are also defects of the fix text in rewrite items 3, 5 and 6, not only missing cases.

## 7. ADRs

- **0001** (in force, `proposed`). It touches the step: `code-comments` reads the prose standard. The sentence is "`/writing` and the skills that read the writing base read the prose standard where it is: ...". The brief names it and follows it ("What it reads" 2).
- **0002** (proposed). Its decision governs the texts the writing skills write or review. `code-comments` is not one of them. It does not touch the step.
- **0003** (`superseded by 0013`). Not in force.
- **0004, 0005, 0008, 0009, 0011, 0012**: their decisions govern self-rule endings, the choices file, the cost script's prices and counts, the dispatch blocks and commits on main. The step changes none of these. They do not touch it.
- **0006** (proposed). Its Decision, "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model", governs plan skills, and `code-comments` is not one. It does not touch the step. Its Consequences say "A skill added later that starts an agent records its id and role", but that sentence is outside the Decision, so it is not binding by the glossary's **ADR** entry.
- **0007** (proposed). Its decision governs `repair_reviewer`. The step changes the comments of `reviewer` and `reviewer_effort` only. It does not touch the step.
- **0010** (proposed). It touches the step, because the step changes `docs/dev/building.md`, the verification page. The sentence is "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them. On a difference, the session rewrites the list in the state file and names the change in the brief or the booking." The brief follows it in substance (line 17: "`/land` rewrites it to the page's commands at landing ..."). It does not name the ADR, and line 25 says it does not touch the step.
- **0013** (proposed). It governs `/writing`'s review, and the step changes nothing in `skills/writing/`. It does not touch the step.
- **0014** (proposed). It touches the step. The brief names it and is under its whole Decision. The parts of the brief measured against its sentences:
  - "`templates/strip_comments.py --compare <before> <after>` compares each rewritten C, C++ or CMake file with its version before the rewrite, and a file that compares `differ` is put back as it was". Rewrite items 3 and 6 contradict this on the gate's own diff: the colliding `CMakeLists.txt` copies put back a file that is not "as it was" (check 6). Item 5's `git restore --` puts back git's version, not the file as it was, in the default invocation.
  - "A fresh agent that changes nothing reads the diff, each changed file whole and the rules". The brief's decision 3 and "What it reads" leave every `.md` file of the diff out. That narrows "each changed file" and D2 ("only the comments the diff adds or changes are judged"). In Ordo, where most changed files are Markdown and the plan-terms markers are `<!-- -->` comments, little would be left to review. The brief names this as its own reversible decision, but it does not cite the ADR sentence it narrows.
  - "Non-ASCII on the added lines is found by `LC_ALL=C grep -n '[^ -~]'`". The brief runs the grep over each whole file and leaves it to the agents to pick the hits on added lines (decision 4). That does not contradict the sentence, because the hits on added lines are among what the grep prints, and the brief states its reason.

Findings:
- ADR 0010 touches the step and is not named under "What is on the tree". Line 25 says the opposite.
- Rewrite items 3, 5 and 6 contradict ADR 0014's "a file that compares `differ` is put back as it was" for two same-name files (the gate's two `CMakeLists.txt`) and for files already modified in the default invocation.
- Decision 3 (Markdown left out) narrows ADR 0014's "each changed file whole" without citing it.

## 8. Dictated text

- `"1.0.0"` (`grep -n -F '"1.0.0"' <brief>`, line 34): holds.
- `apply <numbers>` / `apply all` (lines 40, 89, 161): holds.
- `git rev-parse --verify --end-of-options <ref>^{commit}` (line 38): holds. On git 2.49.0, `git rev-parse --verify --end-of-options 'HEAD^{commit}'` printed the hash with exit 0. The same command on `nosuchbranch` and on `--foo` printed `fatal: Needed a single revision` with exit 128. Adding `-q` gives exit 1 and no message, if the refusal is to name the ref itself.
- Refusal and stop names "Nothing to review", "The configured effort cannot apply", "A model other than the configured one", "No plan configuration", "Unknown project", "No prose standard", "A range that does not resolve", "A number the report does not hold" (lines 60, 61, 63, 97): hold. Each is a label (prose standard 0, "Headings are labels").
- `LC_ALL=C grep -n '[^ -~]'` with `'\''` quoting (line 62): holds.
- The comment rules (lines 49 to 55): the wording holds the prose standard. "It carries no step, roadmap, ticket or plan number." (line 53, `grep -n -F 'It carries no step'`) adds "roadmap, ticket or plan" to D3's and the Goal's "no step numbers". That breaks change standard rule 17 ("every condition, exception and limit of the old text is kept and none is added"). It also leaves open whether the gate diff's many `(ADR 0048 D10/D13)` citations are findings. "Sections D and F are not applied to comments." (line 55) is passive, which is allowed where the actor is irrelevant (prose standard E). It holds.
- Finding-agent bullets (lines 68 to 74):
  - Line 70, "A finding gives the place `path:line` of the comment's first line, the comment quoted as the file has it, the rule it breaks named as the prompt names it, and what that rule asks for. It proposes no replacement." (`grep -n -F 'A finding gives the place'`). Two requirements that can each be broken alone are joined by a second sentence, which breaks `docs/dev/skill-layout.md`, "Lists and tables" ("One rule per bullet ... a second sentence, are two bullets"). The first sentence has 35 words, against prose standard E, "Sentence length" (under roughly 20 unless the mechanism needs more). A list of a finding's four parts may need its length; the second sentence should be a bullet of its own, as `/writing` keeps it.
  - Lines 68, 69, 71, 72, 73 and 74: hold.
- Checking-agent bullets (lines 77 to 86):
  - Line 84, "The report has two parts: "False comments" first, then "Other findings", grouped by rule in the order of the reference section's rules, the prose standard's rules after them in the standard's order, each group headed by its rule, findings in file and line order within a group." (`grep -n -F 'The report has two parts'`). It holds five separable requirements (the two parts, grouping, group order, headings, order within a group). That breaks skill-layout, "Lists and tables" (one rule per bullet). At 47 words it also breaks prose standard E, "Sentence length".
  - Line 86, "Work from the prompt alone, as the finding agent does. The final message is the report." (`grep -n -F 'Work from the prompt alone'`). Two requirements in two sentences break skill-layout, "Lists and tables". "As the finding agent does" points at bullets the checking agent never receives, since its prompt holds only "the checking agent's bullets" (Steps 7). The reference is empty for that reader. That breaks skill-layout, "Writing for an agent" ("A sentence stays only when it changes what the reader does"): the reader cannot act on it. The bullet should spell out the list, as `/writing`'s line 256 does: "edit no file, start no agent, invoke no skill, run no command and read no file".
  - Line 81, "A comment reported under several rules stands once, under the first group that names one of its rules, the other rules on lines of their own." (26 words): holds. It states one mechanism.
  - Lines 77, 78, 79, 80, 82, 83 and 85: hold.
- `### The rewrite` (line 88), and the report parts "False comments" and "Other findings" (line 84): hold, as noun-phrase labels (skill-layout, "Sections, in order", row 6, and prose standard 0).
- `PASS: strip_comments.py scratch tests`, `FAIL: ...`, the `strip_comments: ` prefix, and `equal` / `differ` (lines 107 to 109 and 117): hold.
- The **finding** sense, "(a comment of a diff that breaks a named rule, given with its place, the quoted comment and the rule it breaks with what that rule asks for)" (line 123, `grep -n -F 'gains its sense'`): holds the standards. Its content leaves out "with no proposed replacement", which `/writing`'s sense carries and which the finding-agent bullet on line 70 requires. It also leaves out what a false comment's finding adds ("what the code does instead"). Under skill-layout, "Writing for an agent" ("A term that `docs/glossary.md` defines is used only in a sense it defines there"), the sense should match what the skill's findings hold.
- The building.md and change-standard command lines (line 126) and the Verify commands (lines 241 to 248): hold.

Findings:
- Line 53 adds "roadmap, ticket or plan" numbers to D3's "no step numbers", against change standard rule 17.
- Line 70 joins two requirements in one bullet, against skill-layout "Lists and tables", and its first sentence runs 35 words.
- Line 84 holds five requirements in one 47-word sentence, against skill-layout "Lists and tables" and prose standard E "Sentence length".
- Line 86 joins two requirements, and its "as the finding agent does" points at text the checking agent's prompt does not hold, against skill-layout "Lists and tables" and "Writing for an agent".
- Line 123's sense of **finding** leaves out "with no proposed replacement" and the false-comment addition, so it does not match the finding bullets on lines 70 and 71.

## Declined to judge

- Whether D7's approval, "computing a file's text with its comments removed", covers the brief's whitespace normalisation (whitespace runs in code become one space, a directive keeps its own line). That normalisation goes beyond removing comments, and cases 4 and 5 need it. Whether the approved computation includes it is the user's call, since a new script's computation needs the user's approval. ADR 0014's Context cites Cathedra's comment-stripped forms, which normalise the same way.
- Whether leaving `.md` files out of the review (decision 3) is an acceptable narrowing of D2 and ADR 0014. It is a scope choice the user ruled on.
- Whether the widening to "roadmap, ticket or plan" numbers in line 53 should stand, and whether `ADR 0048 D13`-style citations count as such numbers. That is D3's scope, the user's.
- Which part of `skills/repo-setup/SKILL.md`'s version to raise. The brief says the patch part, 5.2.1. A new sense in `plan-terms.md` adds to what `/repo-setup` writes and what `sync` rewrites, which reads as skill-layout's minor part, "adds to its output". Plan 3's step 1 raised the minor part for the same kind of change together with prose-standard additions (`git log -L5,5:skills/repo-setup/SKILL.md`, 6105b48: 5.1.0 to 5.2.0). The session rules on this.
- Whether cases 24 and 25 hold in practice. Reading `SKILL.md` cannot settle how the agents behave; the gate run of step 2 does.
- No test or script of this step exists on the tree, so nothing was run beyond the commands quoted above.

Agent usage: agent a0c9f327f17f5773c, ordo-high, served claude-opus-5-5, 237,377 tokens, 45 tool uses, 786,396 ms.

## Closed

Each finding was closed in `agents/briefs/1.md` before dispatch:

- Names: `skills/repo-setup/templates/docs/glossary.md` (line 3, the skill list) added to "What is on the tree", to What to build item 4, to "Paths this step writes", to the character-set check and to Verify 3.
- Versions: `skills/repo-setup/SKILL.md` goes to the minor part, 5.3.0, with the reason from `docs/dev/skill-layout.md`, "Frontmatter".
- Configuration comments: the `required.` and `optional, default high.` prefixes that `check_config.py:95` reads are kept, said in What to build item 4, and `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` added to Verify 1.
- Premises: the `"rite"` literal and the `"save as"` comment stated as they stand; the `#` comments named in `groups/` and `save/` only; `plan.projects.yaml` lines 41 and 56 added; ADR 0010 named with its decision and its effect on the step; the stripped form's backslash-newline rule stated.
- Invocations: the refusal "Not a range" for an argument without `..`; the refusal "No report to apply"; rule-15 quoting of every range end and path.
- What it reads: untracked files marked added whole; deleted and binary files left out; renamed files read at the new path; Markdown files reviewed for their `<!-- -->` comments only.
- Rules and bullets: "It carries no step numbers."; the long bullets split into one rule per bullet; the instruction-inside-comment bullet given to the finding, checking and rewrite agents; the finding agent's no-tool bullet spelled out for the checking agent.
- The rewrite: copies kept under repository paths in a `mktemp -d` folder; every dirty file copied first; changed files found by content; files put back from their copy, `git restore --` only for a file equal to `HEAD`; a range head that differs from the working tree not rewritten; the scratch folder removed at the end.
- The script: the backslash-newline deletion stated for C and C++.
- Cases: 6 to 9 and 18 to 19 reworked so each fails without its rule; implied cases added (a continued `#define`, an `#include` with a trailing comment, comment deletions, an apostrophe and a quote in a reworded comment, a CMake comment after an argument, and skill cases 27 to 33, 36, 38 and 40 to 45); the wrong-argument case kept as a quoted run, since no caller passes a wrong argument count; the path-quoting case moved to the skill cases.
- Decision 3 replaced: a Markdown file is reviewed for its `<!-- -->` comments, so ADR 0014 is not narrowed.
- Verify: the test's exit status checked apart from `tail`; Verify 3 checks the **effort agent** and **reviewer** entries; a new Verify 5 reads `SKILL.md` against the layout, D1 to D7, E1, E2 and ADR 0014.
- Declined to judge, the line-53 widening: the bullet now reads "It carries no step numbers.", as D3 has it.
- Declined to judge, the whitespace normalisation of `strip_comments.py`: raised to the user as an open item, since it is a script computation (kind 3).
