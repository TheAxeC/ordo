# Step 1a brief check (on main at ea6c2c3)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1a.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

State checked: `git rev-parse HEAD` printed `ea6c2c3c7e2b55ab7599d94ec821344e981343db`; `git status --short` printed ` M .scratch/4-code-comments/orchestrator-state.md`, ` M .scratch/4-code-comments/plan.md`, `?? .scratch/4-code-comments/agents/briefs/1a.md`. Hit lines below that end early were cut by `cut -c1-<n>` in the command that printed them.

## 1. Names

The names the step changes: the bullet "Work from the prompt alone: ..." of "Finding agent" and "Checking agent"; "Its prompt holds these pieces"; "each whole" / "each reviewed file whole" / "each changed file whole" (SKILL.md and ADR 0014's Decision); the Rules bullet "The review writes no file and changes nothing." and Steps 8's "Write no file and change nothing."; "read in the whole file" (bullet 172); and the new names "prompt folder", "prompt file", `finding.md`, `checking.md`, `rewrite.md`, `code-comments-prompt.XXXXXX`.

- `grep -rn -i 'each changed file whole\|changed file whole\|reviewed file whole\|file whole with\|prompt alone\|prompt folder\|prompt file\|256 KB\|262144' --exclude-dir=.git .` (the brief's own hits left out). Hits outside the paths:
  - `skills/writing/SKILL.md:131` and `:256`, "Work from this prompt alone: edit no file, start no agent, invoke no skill, run no command and read no file.": the `writing` skill's own agents. Not made false.
  - `.scratch/4-code-comments/plan.md:54` (D4, "a fresh read-only finding agent reads the diff, each changed file whole and the rules"), `plan.md:38`, `:39`, `:40`, `:65` (open item C and ruling C), `plan.md:15` and `:21` (the step-1a question line and the step line): ledger records. Ruling C at `plan.md:65` states the change to D4. Not made false.
  - `.scratch/4-code-comments/agents/briefs/1.md:69`, `:70`, `:80`, `:97`, `:105`, `:241`; `agents/briefs/1-round-1.md:22`; `agents/reviews/1-refuter.md:167`; `agents/reviews/1-brief-check.md:154`, `:160`, `:175`; `.scratch/archive/3-the-writing-base/agents/reviews/4-refuter.md:202` and `4-report.md:54`; `.scratch/archive/2-i-.../1-refuter.md:107`; `.scratch/archive/2-a-.../briefs/1.md:8`; `.scratch/archive/2-b-.../plan.md:192` and `agents/reviews/2-report.md:56`, `:57` (an unrelated `<prompt file>` of `claude -p`): history records. Not made false.
  - `.scratch/4-code-comments/orchestrator-state.md:80`, "Next step: 1a, the prompt file": stays true.
- `grep -rn -i 'writes no file\|write no file\|read no file\|reads no file' --exclude-dir=.git --exclude-dir=.scratch .`: outside the paths only `skills/writing/SKILL.md:82` ("Write no file and add no finding."), `:131`, `:256`, all `writing`'s own. Not made false.
- `grep -rn -i 'code-comments' --exclude-dir=.scratch --exclude-dir=.git --exclude-dir=.agents .`, each hit outside the paths read in full:
  - `README.md:27` (the skills table row), `README.md:78` (agents launched through the five definitions), `README.md:105` (the install loop): nothing on how files reach the agents. Not made false.
  - `agents/ordo-{low,medium,high,xhigh,max}.md:3` and `:6`, "The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write.": stays true, since the typed prompt names the prompt file and tells the agent to read it, as the brief says.
  - `docs/roadmap.md:21`, `:24`, `:25`: the Goal says "A fresh agent that changes nothing reports the findings", and the Gate says "the run's transcripts show the review made by fresh agents that edit no file". Both stay true, since the session writes the prompt folder and the agents still edit nothing.
  - `docs/glossary.md:44` and `skills/repo-setup/templates/plan-terms.md:39` (**effort agent**, "Stated in: ... `code-comments`, Steps 4, 6 and 7, and "Steps / The rewrite" 5"), `docs/glossary.md:104` and `plan-terms.md:99` (**reviewer**, "`code-comments`, Steps 6"), `docs/glossary.md:46` and `plan-terms.md:41` (**finding**, "`code-comments`, "Finding agent" and "Checking agent""): these stay true while Steps 6, 7 and "The rewrite" 5 keep the launch as `ordo-<reviewer_effort>` and the two bullet sections keep their names. The brief moves neither.
  - `docs/academic-coverage.md:35`, `docs/dev/scripts.md:17`, `:31`, `docs/dev/building.md:6`, `docs/dev/change-standard.md:70`, `skills/plan/templates/plan.yaml:12`, `:27`, `skills/plan/templates/orchestrator-state.md:14`, `:26`, `skills/repo-setup/templates/docs/glossary.md:3`: model, effort, script and test lines. Not made false.
- Inside `skills/code-comments/SKILL.md` but not named by the brief: `grep -rn -i 'prompt' skills/code-comments/ ...` printed `skills/code-comments/SKILL.md:173:- Report each comment that breaks a rule given in the prompt, where that rule's words describe the break.` and `skills/code-comments/SKILL.md:174:- A finding gives the comment's place as `path:line` of its first line, the comment as the file has it, the rule it breaks as the prompt names it, and what that rule asks for.`
- The new names: no hit outside the brief except the unrelated archive `<prompt file>`. `docs/glossary.md` has no entry for "prompt folder" or "prompt file". It does define **working folder** ("the folder `mktemp -d` makes under `$TMPDIR` for one run of `/session-retro` ... removed at the run's end"), which is the same kind of thing for another skill.

Findings:
- N1. SKILL.md:173 and :174 say the rules are "given in the prompt" and that the finding names a rule "as the prompt names it". After the change the rules stand in the prompt file, and the typed prompt holds only the role, the path and the reading instruction. Neither line is in the brief's list under "What is on the tree", in item 6 or in item 8. Failure scenario: the builder leaves both lines as they are, and the finding agent reads "given in the prompt" as the typed prompt, which holds no rule.
- N2. SKILL.md:67, "Mark each untracked file as added whole in the text given to the agents.", and Steps 5's "Hold the output for the agents." (SKILL.md:74) describe text handed to the agents. Neither is listed, and item 2 gives no command that writes the "added whole" mark into the prompt file. Failure scenario: on the default call an untracked file reaches `finding.md` with no mark, so the agent cannot tell that every line of it is added.
- N3. The first Stops row's "What it shows" ("during the rewrite also each file put back and the scratch folder removed") and "The rewrite" 5's bullet "The stop's message names each file put back and the scratch folder removed." (SKILL.md:129) name only the scratch folder. Item 7 removes the rewrite's prompt folder at that stop, but it says only that the rewrite's final message names both folders. Item 8 does not list the Stops table or that bullet. This breaks change standard rule 19 (no two statements that contradict each other) once the prompt folder exists.
- N4. "prompt folder" and "prompt file" are new names. The brief neither adds a glossary entry (`skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` are not in "Paths this step writes") nor says that the words are plain and need none. Under skill-layout "Writing for an agent" ("A skill that needs a new term ... adds or changes its entry in `skills/repo-setup/templates/plan-terms.md` first"), and with **working folder** defined for the same construct, this needs the orchestrator's call in the brief. Otherwise the builder must decide a vocabulary question outside its paths.

## 2. The step line

The step line, from `git diff -- .scratch/4-code-comments/plan.md` (the uncommitted line 21), mapped part by part:

- "`skills/code-comments/SKILL.md` changed as ruling C says": "What to build" items 1 to 8 and the paths list.
- "the session writes each agent's prompt (the diff, `cat -n` of each reviewed file, the non-ASCII output, the rules and the bullets) into a file in a scratch folder with shell commands": items 1 and 2.
- "the agent's prompt names that file, which the agent reads whole and is the only file it reads": items 5 and 6. For the rewrite agent, the brief adds that it also reads and edits the files its picked findings name (see C7).
- "a reviewed file over 256 KB is given as each of its diff hunks with 40 lines on either side in place of the whole file": item 3.
- "the report names each such file": item 4.
- "the agents' bullets, the Rules, the Anti-patterns and every other place of the skill that says the agents read no file or get each file whole say the same": items 6 and 8. Partly mapped: SKILL.md:67, :74, :173, :174, :129 and the first Stops row are not named (N1 to N3).
- "the sentence of ADR 0014's Decision on what the finding agent reads edited to its current state, as `docs/adr/README.md` says of a refinement that keeps the decision": item 9, case 11, Verify 5.
- "the check: the skill read against ruling C, `docs/dev/skill-layout.md` and ADR 0014": Verify 6.
- "a prompt file built by the skill's commands for `a0aa831^..a0aa831` in a scratch clone of `game-engine` holds `manual.html` as hunks and every other file whole": cases 6 to 8, Verify 4. Partly mapped. The cases check `manual.html` and two of the other 25 files (`main.cpp`, `save_container.h`). No requirement checks that each of the other 23 files stands whole in `finding.md`, among them the renamed `.scratch/15-rite-editor/adr-input.md` (see Q-step).
- "the character-set check over the changed files prints nothing": Verify 1.
- "(1 commit)": not a requirement of the build.

Findings: no part of the line lacks a requirement entirely. Two parts are mapped in part: "every other place of the skill" (N1 to N3) and "every other file whole" (only two of 25 checked).

## 3. Premises

- "`skills/code-comments/SKILL.md` is 254 lines, `metadata.version` `"1.0.0"`": `wc -l skills/code-comments/SKILL.md` printed `254 skills/code-comments/SKILL.md`; `sed -n 1,8p` shows `  version: "1.0.0"`. Holds.
- The grep list: `grep -n -i 'whole\|read no file\|prompt\|line numbers' skills/code-comments/SKILL.md` printed lines 27, 40, 43, 59, 65, 67, 73, 77, 79, 90, 92, 98, 121, 123, 172, 173, 174, 178, 192, 198, 244, 245. Each line the brief quotes stands at the number it gives (43, 59, 65, 77 to 83, 90 to 96, 100, 121 to 126, 172, 178, 198, 244, 245). The Rules bullet "The review writes no file and changes nothing." is SKILL.md:249. The brief's list leaves out 67, 173 and 174, which the change bears on (N1, N2). Lines 27, 40, 73, 98 and 192 are not affected.
- The gate's range, rerun in the scratch clone (`git rev-parse HEAD` printed `a0aa831994dc3c492af9aaf3c94f31108cc9070b`):
  - `git diff --name-only --find-renames c6a46fc a0aa831 | wc -l` printed `26`; `git rev-parse a0aa831^` printed `c6a46fcae5e7831034afc1213b59d19e434f49c7`.
  - The size loop printed `1293416 docs/user/manual.html`, with `158810 src/engine/tests/src/main.cpp` next; the sum of the other 25 printed `473668`; `git show a0aa831:docs/user/manual.html | wc -l` printed `8820`.
  - `git diff --no-ext-diff --find-renames c6a46fc a0aa831 | wc -c` printed `136251`.
  - `git diff --no-ext-diff --numstat -z c6a46fc a0aa831` prints two counts for each file (`0<tab>0` for the rename `.scratch/13-rite-editor/adr-input.md` to `.scratch/15-rite-editor/adr-input.md`) and no `-`.
  - All hold.
- "`docs/dev/building.md:87` of game-engine names `./utils/build.py site`": `git show a0aa831:docs/dev/building.md | sed -n 87p` contains "or both with a bare `./utils/build.py site`", and line 100 has `./utils/build.py site manual # regenerates the diagrams, then the manual`. Holds.
- Decision 2's five cases: `git diff --no-ext-diff --unified=40 c6a46fc a0aa831 -- <path> | grep '^@@'` printed:
  - `@@ -1160,105 +1160,105 @@`, `@@ -1433,81 +1433,81 @@`, `@@ -1827,81 +1827,81 @@` for `manual.html`;
  - `@@ -86,81 +86,81 @@`, `@@ -182,80 +182,90 @@`, `@@ -299,95 +309,96 @@` for `hashmap.hpp`;
  - `@@ -89,80 +89,82 @@`, `@@ -2726,80 +2728,82 @@` for `main.cpp`;
  - `@@ -1,40 +1,40 @@` for `groups/CMakeLists.txt`;
  - `@@ -0,0 +1,176 @@` for `save_container.h`.

  The headings the brief gives follow from these. The item-3 extraction, run as a pipeline into `wc -c`, printed `128091`, `13219`, `11094`, `2475` and `10704`. All hold.
- "`agents/ordo-high.md` line 6 says ...": `sed -n 1,12p agents/ordo-high.md` shows the sentence. Holds.
- "No other page of the repository describes how `code-comments` passes files to its agents": the grep in section 1 confirms the claim. The brief's list of hits is incomplete: it leaves out `README.md:78` and `:105`, `docs/roadmap.md:21`, `:24` and `:25`, `docs/academic-coverage.md:35`, `docs/dev/building.md:6`, `docs/dev/change-standard.md:70`, `docs/dev/scripts.md:31`, `docs/glossary.md:44` and `:104`, `skills/repo-setup/templates/docs/glossary.md:3` and ADR 0014. None of them describes how files reach the agents.
- ADR 0014's premise: the file's Status is `proposed`, and the Decision is the single line 11. The text the brief quotes is the first clause of a sentence that goes on "; a fresh checking agent keeps a finding only where its quote stands at its place, ...". The brief calls the clause "Its Decision sentence". Case 11's "one changed line" holds whatever is edited, since the whole Decision is one line. `docs/adr/README.md` paragraph 2 says "A refinement that keeps the decision edits the ADR to its current state with no dated note." Holds.
- "`docs/dev/skill-layout.md` line 23" and "the version stays `1.0.0`": `sed -n 23p` printed "- A plan that changes a skill raises one part of its `metadata.version` once, and sets the parts after it to 0." Plan 4 set 1.0.0 when it created the skill, so the rule's words hold. (The tag `v8.2.0-rc.1` shipped 1.0.0, and `rc.2` will ship changed behaviour under the same version. The rule ties versions to plans, so this is no finding.)
- "The verify list of the state file equals the command block of `docs/dev/building.md`": `cat -n .scratch/4-code-comments/orchestrator-state.md` and `sed -n 1,25p docs/dev/building.md` give the same seven commands in the same order, the test lines with `2>&1 | tail -1`. Holds.
- The clone command of "Cases", `git clone -q ../game-engine "$TMPDIR/ge-1a"`, run "from inside the worktree": `.agents/plan.yaml` has `worktree_root: .agents/worktrees`, so the worktree is `.agents/worktrees/4-code-comments-1a`, and `../game-engine` from there is `.agents/worktrees/game-engine`. `ls -d .agents/worktrees/game-engine` printed `ls: .agents/worktrees/game-engine: No such file or directory`.

Findings:
- P1. The clone command of "Cases" does not resolve: from inside the worktree, `../game-engine` names `.agents/worktrees/game-engine`, which does not exist. game-engine is at `../../../../game-engine` from the worktree, or at its absolute path. Failure scenario: the first run of cases 6 to 9 fails at the clone, and the builder either stops or finds a source of its own.
- P2. The "No other page" premise names an incomplete list of hits (above). The conclusion holds, so this is a correction of the list only.

## 4. Cases and checks

Each case read against the change standard, `docs/dev/skill-layout.md`, the prose standard and the glossary:

- Case 1 holds against the rules, but see C6.
- Cases 2, 3, 5, 9, 10 and 11 hold.
- Case 4: see C1.
- Case 6, "about 128 KB": see C3.
- Case 7, "2,800 or more numbered lines": see C3.
- Case 8: see C4.

No case asks the builder to check, quote or explain a place the step does not change. Cases 6 to 9 run in a game-engine clone, which is the step line's own check.

Findings:
- C1. Item 1 makes the prompt folder "At the start of the review (before Steps 6)". Skill-layout, "Lists and tables": "A step that can refuse or stop comes before every step that writes, drafts or commits what the refusal or stop guards." Steps 1 to 4 hold refusals ("No plan configuration", "Not a range", "A range that does not resolve", "Nothing to review", "The configured effort cannot apply"). Item 7 removes the folder only after the checking agent and on the model stop. Failure scenario: a builder who reads "the start of the review" as before Steps 1 makes the folder there, and a refusal at Steps 3 or 4 leaves it behind, which case 4 ("no step leaves it behind") does not detect, since it lists only three removal points. Expected: the folder is made after Steps 5, as the first write of the review. The same question applies to the rewrite's prompt folder, whose place item 1 gives only as "made the same way".
- C2. The brief cites a standard and a skill's text by line number: "as `docs/dev/skill-layout.md` line 54 asks" (item 6), "`docs/dev/skill-layout.md` line 23" (premise and decision 7), "the Rules bullets 244 and 245" (item 8) and "line 172's" (item 6). Change standard, "Where the work happens": "A ledger file cites a page (the rules page, a standard, a skill's text) by its section, never by a line number". The premise list's `grep -n` hits, quoted with their text, fall under the exception for quoted current lines. Item 6, item 8 and decision 7 cite a page without its section and are not grep hits. Expected: skill-layout, "Lists and tables"; skill-layout, "Frontmatter"; SKILL.md, Rules, the bullets quoted by their words; SKILL.md, "Finding agent", the first bullet.
- C3. Case 7 expects "2,800 or more numbered lines". `git show a0aa831:src/engine/tests/src/main.cpp | wc -l` printed `2821`. A part missing its last 21 lines passes. Change standard rule 9: "no check is loosened to pass". Expected: exactly 2821 numbered lines, the last numbered `2821`. Case 6 likewise says "about 128 KB" where decision 2 gives the measured 128091. Expected: `128091`.
- C4. Case 8 asks for the size of `finding.md` "quoted with `wc -c`" and gives no expected value or bound, so any size passes. See Q8.
- C5. Item 6 says the bullet "becomes one that says the agent works from its prompt file alone and reads no other file, with the same four other bans, one rule per bullet". "Becomes one" and "one rule per bullet" read two ways: one bullet holding five bans, or five bullets. Expected: the brief says which. Skill-layout, "Lists and tables" ("two requirements that can each be broken while the other holds ... are two bullets") points to separate bullets.
- C6. Item 2 has the session write the finding agent's final message "once to a file in the prompt folder" (and the picked findings "the same way"). Its last bullet says "The skill gives each of these commands, so a session runs them as written". The brief names no command that writes an agent's final message to a file without the session typing it, and item 8's Anti-patterns row gives the reason a typed copy fails ("a typed copy can drop or change a line"). Failure scenario: the builder writes "the session writes it with a heredoc" or "with the Write tool", which is a typed copy of the findings that the brief's own Anti-patterns row warns against, and case 1 still passes, since the findings are not "file text". Expected: the brief names where the runner keeps a background agent's final message, if it keeps one as a file, or says that the session writes it with the Write tool and why that copy is acceptable. Whether Claude Code keeps the message as a file is not verified here.
- C7. Item 5 and item 6 let the rewrite agent read and edit the files its picked findings name besides its prompt file. Ruling C says "the agent reads that file whole as the only file it reads". The exception is needed, since the rewrite agent edits those files. But it is a decision the brief takes, and "Decisions taken in this brief (each reversible, none silent)" does not list it.

## 5. The question

"The goal" here is the part of the plan's goal step 1a delivers: on the gate's real range and on any diff, a fresh finding agent and a fresh checking agent that change nothing get every changed comment with the code around it, with no file text typed by the session.

- Case 1: yes, in part. It passes while the session types the finding agent's message and the picked findings into files (C6), since those are not "file text".
- Case 2: no for the bans. It passes while SKILL.md:173 and :174 still say the rules are "in the prompt" (N1), since the case reads only the ban bullets.
- Case 3: no. It reads the rewrite agent's file and bullets.
- Case 4: yes. A folder made before a refusal of Steps 3 or 4 is left behind, and the case lists only three removal points (C1).
- Case 5: no.
- Case 6: yes, in part. "About 128 KB" passes a part with an off-by-one `sed` range under the right headings (C3).
- Case 7: yes. "2,800 or more" passes a truncated part (C3).
- Case 8: yes. It quotes a size with no bound. Measured as the sum of the parts piped into `wc -c` (no file written): the 25 files under `cat -n` `523249`, all non-ASCII output `116149`, the diff `136251`, the `manual.html` hunks `128091`, together `903740` bytes before the rules, the prose sections, the bullets and the headings. Open item C's own estimate was "about 0.6 MB" and carried "Not verified: the context size of the agent the runner serves for `claude:opus`". `checking.md` holds the same plus the findings. A prompt file the agent cannot hold passes case 8, and the gate then fails at step 2. Not verified: the served model's context size and the token count of `finding.md`. What would settle it: a token count of the built `finding.md` (for example by the API's token-counting endpoint) compared with the served model's context window, run as a case with that bound as its expected result.
- Case 9: no. It runs the comparison on files of both sizes.
- Case 10: no as a reading. No agent runs, so the checking agent's real first line is not seen, which the brief accepts.
- Case 11: no.
- Q-step, the check on the step line: yes, in part. "Every other file whole" is checked for 2 of 25 files. A build that drops, for instance, the renamed `.scratch/15-rite-editor/adr-input.md` or a CMake file passes. Expected: for each of the 25 files, its heading in `finding.md` and a numbered part whose line count equals `git show a0aa831:<path> | wc -l`.
- What to build items:
  - Item 1: checked by case 5 and by reading. No, except C1.
  - Item 2: checked by cases 1 and 8. Yes, as above.
  - Item 3: checked by cases 6 to 9. Yes, for the renamed and untracked inputs of section 6, which no case runs.
  - Item 4: checked by case 10. No.
  - Item 5: checked by case 1 and Verify 6. No.
  - Item 6: checked by cases 2 and 3. Yes, as for case 2.
  - Item 7: checked by case 4. Yes (C1).
  - Item 8: checked by Verify 3 and 6, by reading. Its grep is `'read no file\|whole'`, which does not find SKILL.md:173, :174 or :129. Yes.
  - Item 9: checked by case 11 and Verify 5. No.

## 6. Implied inputs

This is not a code step in the glossary's terms: it adds no script and no test and changes a skill's text. The text gives shell commands a session runs, so the inputs those commands take are judged here. Change standard rule 15 makes each place where a supplied value reaches a command, a path or generated text a case.

The inputs, with whether the brief's cases cover them:
- I1. A renamed file over 256 KB. This has happened: the gate's range holds `R100 .scratch/13-rite-editor/adr-input.md .scratch/15-rite-editor/adr-input.md`. Item 3's command names only the new path and has no `--find-renames`. In the scratch clone, `git diff --no-ext-diff --unified=40 c6a46fc a0aa831 -- '.scratch/15-rite-editor/adr-input.md'` printed `new file mode 100644` and `@@ -0,0 +1,85 @@`, so the file comes back as one hunk of the whole file. With both paths and `--find-renames`, it printed `similarity index 100%`, `rename from ...`, `rename to ...` and no hunk. Cost: a large renamed and edited file reaches the agent whole, under a `lines 1-<n>` heading, while the report names it as given as hunks. Expected: the hunk command takes `--find-renames` and both paths, and gives only the changed hunks. Missing from "Cases".
- I2. The default call with an untracked file over 256 KB. `git diff HEAD -- '<path>'` prints nothing for an untracked file, so the size check routes the file to a command that gives no hunk, and the file reaches the agent as nothing. The brief's rule "A file added whole has one hunk, the whole file, and is given whole" gives the right result only if the skill says that an untracked file is added whole before the size check. Cost: a silent partial review, with the comments of that file never judged. Expected: an untracked file is given whole with its "added whole" mark (N2). Missing.
- I3. A hunk header without a count (`+c`). Item 3 states the rule ("A count left out of the header (`+c`) is 1"). The form occurs in the gate's diff at `-U0` (`@@ -1200 +1200 @@` and seven more for `manual.html`), and at `--unified=40` it occurs for a file whose new side is one line, such as a minified one-line file over 256 KB. Cost: a parse that needs `,d` gives no range, and the file is dropped. Expected: `lines 1-1 of <path>`, the file's one line. Missing from "Cases".
- I4. The non-ASCII output of a file given as hunks. Item 2 appends "the non-ASCII output of Steps 5, by the same commands", and Steps 5 runs over the whole file. In the scratch clone, `git show a0aa831:docs/user/manual.html | LC_ALL=C grep -n -e '[^ -~]' | wc -c` printed `84350` bytes over `513` lines, of which `104` lie inside the three hunks (awk over the line numbers). Steps 5 itself says only a hit on a changed comment line can become a finding. Cost: 84 KB of `manual.html`'s text outside its hunks reaches the agent after all, as lines it cannot place against any code it has. Expected: for a file given as hunks, the non-ASCII output holds only the hits on its hunks' lines. Missing.
- I5. A path with a space, a single quote or a leading `-` reaching the new commands (`wc -c < '<path>'`, `git show '<head>:<path>' | wc -c`, the hunk command, the line extraction, the `>>` append) and the heading line `lines <c>-<c+d-1> of <path>`, which puts the path into generated text. Rule 15 makes each of these places a case. Expected: each command acts on that one file, and the heading names it as the diff's `-z` listing gives it. Missing from "Cases". The Conventions bullet states the quoting rule, but no case runs it.
- I6. A file deleted by the diff, and a binary file: both are left out by "What it reads" 4 before any size check. Covered, and no case is needed.
- I7. A file over 256 KB whose only change is its mode, or a pure rename (`R100`): the hunk command prints no hunk, and the file reaches the agent as a heading with no lines. No comment changed in it, so a wrong answer costs nothing. No case is needed, but the brief does not say whether such a file is named in the report's line.
- I8. A user's git configuration with `color.diff=always`. Item 3's command has no `--no-color`, so escape codes would come before `@@` and the header parse would find no hunk. Not seen in this tree. Its cost would be a large file silently dropped. Expected: `--no-color` in the hunk command. Listed as a cost case. Whether it has happened is not known.
- Line length, checked and no finding: three of the eight changed lines of `manual.html` are 2407, 5331 and 3211 characters long (`git diff -U0 ... | awk '{print length($0)}'`), and 17 lines of its hunks exceed 2000 characters. A Read of the clone's `docs/user/manual.html` at line 1224 in this runner returned the whole 5331-character line.

Findings: I1, I2, I3, I4 and I5 are missing from "Cases", each with the expected result above. I8 is a cost case the brief may add or leave, with the reason stated.

## 7. ADRs

Each record read in full (`for f in docs/adr/00*.md; do cat -n "$f"; done`) with `docs/adr/README.md`:

- 0001, 0002, 0004 to 0014: `Status: proposed`. Each is in force, and no later record supersedes a part of one.
- 0003: `Status: superseded by 0013`, superseded whole.

Records the step touches:
- 0014, in force. The step is under its Decision sentence "A fresh agent that changes nothing reads the diff, each changed file whole and the rules, and reports findings; a fresh checking agent keeps a finding only where its quote stands at its place, the rule's words describe it and applying it would not make the comment worse." The brief names 0014 and edits that clause by `docs/adr/README.md`'s refinement rule, as ruling C and the corrected step line say. The brief also leaves 0014's "Non-ASCII on the added lines is found by `LC_ALL=C grep -n '[^ -~]'`" unchanged. Giving a hunked file's whole-file grep output (I4) goes further from "the added lines" than giving its hunks' hits. That is no contradiction the brief introduces, since Steps 5 already greps the whole file.
- 0001, in force, arguably. Its Decision: "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`. `skills/writing/` holds no copy of it." `code-comments` reads the prose rules of entry 3's writing base ("Waits on: 3, for the prose rules", `docs/roadmap.md:26`). The step changes how those sections reach the agents (copied by `sed` from the prose standard's file into a run's prompt file). Item 2 copies "from ... the prose standard's file" found by Steps 2, so it keeps reading the standard where it is, and the copy is removed with the folder. No contradiction. The brief's "What is on the tree" says 0014 "is the ADR the step touches" and does not name 0001.
- 0013 governs `/writing` only ("each given in its prompt the draft's text"). Not touched. 0002, 0004 to 0012 govern other skills or the plan skills' ledger and commits. Not touched.

Findings:
- A1. No part of the brief contradicts a record in force.
- A2. ADR 0001 arguably touches the step and is not named under "What is on the tree". The step keeps it, so the fix is one premise line naming it with its sentence.

## 8. Dictated text

Each dictated line, found with `grep -n -F '<text>' .scratch/4-code-comments/agents/briefs/1a.md`, read against the change standard, `docs/dev/skill-layout.md`, the prose standard and the glossary. `LC_ALL=C grep -n '[^ -~]' .scratch/4-code-comments/agents/briefs/1a.md; echo "exit $?"` printed only `exit 1`, so the brief is ASCII throughout.

- `mktemp -d "${TMPDIR:-/tmp}/code-comments-prompt.XXXXXX"` (`grep -n -F 'code-comments-prompt.XXXXXX'` printed line 34): holds. It is the form of "The rewrite" 4's existing command.
- `finding.md`, `checking.md` and `rewrite.md` (`grep -n -F '`finding.md`, `checking.md`'` printed line 34): holds.
- `wc -c < '<path>'` and `git show '<head>:<path>' | wc -c` (`grep -n -F "wc -c < '<path>'"` printed line 43): holds. The path reaches `wc` by redirection, so no `--` applies. `[ "$(printf x | wc -c)" -gt 0 ]` passed in `zsh`, `sh` and `bash` with BSD `wc`'s leading spaces.
- `git diff --no-ext-diff --unified=40 <the diff's ends> -- '<path>'` (`grep -n -F -- "--unified=40 <the diff's ends>"` printed line 43): holds against the standards pages and the SKILL.md Rules on quoting and `--`. Its behaviour on a renamed file is I1, and on a colour configuration I8.
- `lines <c>-<c+d-1> of <path>` (`grep -n -F 'lines <c>-<c+d-1> of <path>'` printed line 43): holds against the standards pages. The path in generated text is a rule-15 case (I5).
- "read in the file as the prompt file gives it, whole or as its hunks" (`grep -n -F 'read in the file as the prompt file gives it, whole or as its hunks'` printed line 46): breaks prose standard, section E, "Sentence length" ("under roughly 20 words unless the mechanism needs more"). With the phrase, the bullet reads "Judge only the comments the diff adds or changes, each against the code it stands above or beside, read in the file as the prompt file gives it, whole or as its hunks." That is 33 words, against 23 before (`sed -n 172p ... | wc -w` printed `24` before and `34` after, the leading `-` counted). The qualifier belongs in the same bullet under skill-layout, "Lists and tables", so the fix is shorter wording (for example "read in the file as the prompt file gives it", with "whole or as its hunks" left to the Rules bullet that states item 3), not a split.
- `rm -rf '<prompt folder>'` (`grep -n -F "rm -rf '<prompt folder>'"` printed line 47): holds. The path is the absolute one `mktemp` printed, not a value the user or the diff supplies, as with the existing `rm -rf '<scratch>'`.
- Item 6's quoted old bullet ("Work from the prompt alone: ...") is old text being replaced, not dictated new text.
- Items 4, 7, 8 and 9 say what a sentence must say without giving its words, so they are not dictated.

Findings: one dictated line breaks a rule (prose standard, section E, Sentence length). Every other dictated line holds.

## Declined to judge

- The served model's context window, and whether an agent can read a `finding.md` of about 904 KB plus the rules (and a larger `checking.md`) whole in parts. Not verifiable without starting an agent, which this check may not do. Section 5, case 8 says what would settle it.
- Whether the runner keeps a background agent's final message as a file a command can append (C6). Not verified.
- Whether ruling C's change to ADR 0014 is a refinement rather than a changed decision that needs a superseding record. The user's ruling C says it keeps the decision, and the brief and the corrected step line follow it. That is the user's call, and I report it as holding by the ruling's words.
- Whether "prompt folder" and "prompt file" need glossary entries (N4). That is the orchestrator's call in the brief, and I report only that the brief leaves it open.
- I wrote no file. So the measurement of `finding.md` is the sum of its parts piped into `wc -c`, and the rules, the prose sections, the bullets and the heading lines are not included in it.

Agent usage: ac9dd04a4278294c4, claude-opus-5-5, 204421 tokens, 42 tool uses, 14m 10s.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- N1 (`SKILL.md:173` and `:174` say "the prompt"): lines 173 and 174 added to "What is on the tree"; "What to build" item 7 has both say "the prompt file"; case 2 checks it.
- N2 (the "added whole" mark and Steps 5's "Hold the output"): lines 67 and 74 added to "What is on the tree"; item 3 writes the untracked file's heading line by `printf`; item 2 has Steps 3 and 5 write into the prompt file; case 13 checks the mark.
- N3 (the Stops row and "The rewrite" 5's stop message): both added to "What is on the tree"; item 8 has them name both folders removed.
- N4 ("prompt folder" and "prompt file" as terms): decision 10, plain words defined where the skill makes them, no glossary entry.
- P1 (the clone path from the worktree): "Cases" clones from `/Users/axelfaes/workspace/game-engine`.
- P2 (the list of `code-comments` hits): the premise lists every hit, and the glossary entries whose "Stated in" names the skill.
- C1 (where the prompt folder is made): item 1 makes it after Steps 4, the last refusal, and the rewrite's at "The rewrite" 4 after its items 1 to 3; case 4 checks that none is made before a refusal.
- C2 (pages cited by line number): `docs/dev/skill-layout.md` is cited by "Lists and tables" and "Frontmatter", and the `SKILL.md` places of item 9 by their words; the `grep -n` hits of "What is on the tree" keep their lines as quoted current lines.
- C3 (loose bounds in cases 6 and 7): case 6 expects 128091 bytes; case 7 expects each of the 25 files at its `wc -l` count, `main.cpp` at 2821 lines, the last numbered 2821.
- C4 and Q8 (no bound on `finding.md`): a premise names the largest context an agent on `claude-opus-5-5` has held in this runner, 406,505 tokens, read from the subagent transcripts; case 8 bounds `finding.md` at 1,000,000 bytes.
- C5 (one bullet or five): item 7 makes five bullets, one rule each.
- C6 (the finding agent's message copied by the session): item 3 and decision 9 name it, with the picked findings, as the only text the session writes itself, and why.
- C7 (the rewrite agent reads the files it edits): decision 8.
- Q-step (2 of 25 files checked): case 7 covers all 25, the renamed file among them.
- I1 (a renamed file): item 4's command takes `--find-renames` and both paths; case 10.
- I2 (an untracked file over 256 KB): item 4 and decision 3 give it whole; case 13 checks the mark.
- I3 (a header with no count): case 11.
- I4 (non-ASCII output of a hunked file): item 3 keeps only the hits on its hunks' lines; decision 11; case 8 checks 104 of 513 (`git show a0aa831:docs/user/manual.html | LC_ALL=C grep -n -e '[^ -~]' | cut -d: -f1 | awk ...` printed `513 104`).
- I5 (a path with a space or a leading `-`): case 12.
- I7 (a large file with no hunk): item 4 names it in the list with no lines.
- I8 (`color.diff=always`): `--no-color` in item 3's diff and item 4's hunk command.
- The dictated line "read in the file as the prompt file gives it, whole or as its hunks": shortened in item 7 to "read in the file as the prompt file gives it"; the bullet then reads "Judge only the comments the diff adds or changes, each against the code it stands above or beside, read in the file as the prompt file gives it.", 28 words, a qualifier kept in its bullet as `docs/dev/skill-layout.md`, "Lists and tables", says, and the mechanism needs the length.
- A2 (ADR 0001 not named): named under "What is on the tree" with its decision's sentence, and listed under "Read".
- Added after the check, dictated: the five bans of item 7 are stated as their rule, not their words; the heading line `lines <c>-<c+d-1> of <path>` is unchanged and holds.
