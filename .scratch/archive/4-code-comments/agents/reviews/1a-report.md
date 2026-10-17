# Step 1a report: the code-comments agents read their prompt from a file, and a file over 256 KB reaches them as its hunks

Everything in the brief is done. Two points need the orchestrator's reading, both listed under "Every judgment call the brief left open": the commands of the prompt file stand in `SKILL.md` and not in a `references/` file (the paths list names only `SKILL.md`), and the step adds one check and one extension of an existing refusal that the brief does not list (judgment call 4).

## Open items of the state file

`sed -n 46,52p .scratch/4-code-comments/orchestrator-state.md` printed, under "## Open items", the single item:

```
- none.
```

## The cases' first run

The first run was made before any change. Cases 1 to 5, 14 and 15 were read on the unchanged tree. Cases 6 to 13 were run with the commands of items 3 and 4 of "What to build" typed by hand, since the unchanged `SKILL.md` gives none of them. Cases 6 to 8 ran in `$TMPDIR/ge-1a` (`git clone -q /Users/axelfaes/workspace/game-engine "$TMPDIR/ge-1a"`, `git -C "$TMPDIR/ge-1a" checkout -q --detach a0aa831`; `git log --oneline -1` printed `a0aa831 Implement save-slot runtime and container functionality`). Cases 9 to 13 ran in a scratch repository `$TMPDIR/sr-1a` made with `git init`. No agent was started. Both scratch folders and every prompt folder were removed afterwards (`ls "$TMPDIR" | grep -i 'p1a\|code-comments\|ge-1a\|sr-1a'` printed nothing and exited 1).

No case is one the brief's own rules get wrong. Every case gave the result the brief states.

| Case | Checked by | First run on the unchanged tree |
|---|---|---|
| 1 | Reading `skills/code-comments/SKILL.md` before the change | Unmet. Steps 3 said "Read each file whole with `cat -n -- '<path>'`" (the session reads the file), and Steps 6, 7 and "The rewrite" 5 said "Its prompt holds these pieces:" with "Each reviewed file whole". |
| 2 | Reading the same file | Unmet. One bullet, "Work from the prompt alone: edit no file, start no agent, invoke no skill, run no command and read no file.", stood in "Finding agent" and in "Checking agent"; "Finding agent" also said "a rule given in the prompt" and "as the prompt names it". |
| 3 | Reading the same file | Unmet. "The rewrite" 5 listed prompt pieces and no prompt file; "Rewrite agent" said "Edit only the files the picked findings name." and nothing about reading a prompt file. |
| 4 | Reading the same file | Unmet. No prompt folder existed in the skill; only the rewrite made a scratch folder, and the review made no folder to remove. |
| 5 | Reading the same file | Unmet. No prompt file existed, so no path of the skill kept one apart from the copies. |
| 6 | `git diff --no-ext-diff --no-color --find-renames --unified=40 c6a46fcae5e7831034afc1213b59d19e434f49c7 a0aa831994dc3c492af9aaf3c94f31108cc9070b -- 'docs/user/manual.html' 'docs/user/manual.html' \| grep '^@@'`, then the brief's item 4 loop | Met. `grep -n '^lines '` of the part printed `1:lines 1160-1264 of docs/user/manual.html`, `107:lines 1433-1513 of docs/user/manual.html`, `189:lines 1827-1907 of docs/user/manual.html`, and `wc -c` of the part printed `128091`. |
| 7 | `git show a0aa831:<path> \| wc -l` against the last number of `git show a0aa831:<path> \| cat -n \| tail -1` for each of the 25 files | Met. The 25 pairs were equal; `src/engine/tests/src/main.cpp` printed `wc-l=2821 last=2821`; the renamed `.scratch/15-rite-editor/adr-input.md` printed `wc-l=85 last=85`. |
| 8 | `git show a0aa831:docs/user/manual.html \| LC_ALL=C grep -n -e '[^ -~]'` and the awk filter on the hunks' line ranges | Met. `manual hits all: 513 bytes 84350`, `manual hunk hits: 104 bytes 51069`; `wc -c` of the whole `finding.md` printed `879073`, at most 1,000,000. |
| 9 | `wc -c < 'exact.cpp'`, `wc -c < 'over.cpp'` and the item 4 command on each | Met. `SIZE 262144 exact.cpp` was given whole (4096 numbered lines, the last numbered `4096`); `SIZE 262145 over.cpp` was given as `lines 1960-2040 of over.cpp`. |
| 10 | The item 4 command with `'rename_old.cpp' 'rename_new.cpp'` after `git mv` and an edit of line 2100 | Met. It printed one heading, `lines 2060-2140 of rename_new.cpp`, 82 lines in all; the command with the new path alone printed `@@ -0,0 +1,4200 @@`, the whole file as one added hunk. |
| 11 | The item 4 command on a 588,902-byte one-line file whose line changed | Met. The diff printed `@@ -1 +1 @@`; the part held the heading `lines 1-1 of oneline.txt` and the one numbered line, numbered `1`. |
| 12 | The item 4 command on `big file.cpp` and `-big.cpp`, each 268,800 bytes, after `git diff --name-only -z HEAD` listed `-big.cpp` and `big file.cpp` | Met. It printed `lines 2960-3040 of big file.cpp` and `lines 2960-3040 of -big.cpp`; `git show 'HEAD:-big.cpp' \| wc -c` printed `268800`. |
| 13 | `git ls-files --others --exclude-standard -z`, a heading by `printf`, then `cat -n -- 'untracked_big.cpp'` | Met. The part held a heading line saying the file is untracked and added whole, then 4200 numbered lines (4202 lines in all). |
| 14 | Reading the Checking agent bullets | Unmet. No bullet asked for an opening line naming the files given as hunks, and no list existed. |
| 15 | Reading ADR 0014's Decision | Unmet. The clause read "reads the diff, each changed file whole and the rules, and reports findings". |

One fact the first run showed that no case states: `cat -n` and `sed -n` print a file's last line without a line break when the file has none, so a piece appended next joins that line (in case 11 the numbered line had no line break, `wc -l` of the part printed `1`). The skill's commands start each piece's heading with a line break for that reason (judgment call 2).

## DONE / NOT DONE

Final-tree runs of cases 6 to 13 used the commands of `SKILL.md` as written, typed by hand with the placeholders replaced. Their output follows each row.

| Item or case | State | Proof |
|---|---|---|
| Item 1, the prompt folder | DONE | `SKILL.md` Steps 5 (line 77) makes it with `mktemp -d "${TMPDIR:-/tmp}/code-comments-prompt.XXXXXX"` after Steps 4; "The rewrite" 4 (line 106) makes the rewrite's own beside the scratch folder; `finding.md` and `checking.md` are Steps 5 and 7, `rewrite.md` is "The rewrite" 5 (line 115). |
| Item 2, the session does not read the files | DONE | "What it reads" 4 (line 50), Steps 3 "Done when" (line 72, "no file's text has been read") and Steps 5 (lines 76 to 81). |
| Item 3, how a prompt file is written | DONE | "The prompt file" (lines 146 to 262): every piece is a command that appends with `>>`; only the finding agent's final message and the picked findings are typed (lines 173 and 174). |
| Item 4, a file over 256 KB | DONE | Steps 3 (line 69), "What it reads" 4 (lines 44 and 47), `<hunks>` (line 157) and the hunk commands (lines 196 to 215); cases 6 to 12 below. |
| Item 5, the report names the large files | DONE | The list of the files given as hunks (lines 226 to 232) and the Checking agent bullet (line 305). |
| Item 6, the agent's prompt | DONE | Lines 161 to 171 give both prompts; Steps 6 (line 82), Steps 7 (line 91) and "The rewrite" 5 (line 116) point at them. |
| Item 7, the bullets | DONE | "Finding agent" (lines 276 to 291), "Checking agent" (lines 293 to 317), "Rewrite agent" (lines 319 to 330): five one-rule bullets in the first two, the first bullet of "Finding agent" ending "read in the file as the prompt file gives it", the two "given in the prompt" bullets saying "the prompt file". |
| Item 8, removing the prompt folder | DONE | Steps 6 (line 87), Steps 8 (line 93), "The rewrite" 5 (lines 118 and 119), "The rewrite" 8 (lines 137 and 143), and the first Stops row (line 338, "the prompt folder removed; during the rewrite also each file put back and the scratch folder removed"). |
| Item 9, every other place | DONE | Description (line 3), opening paragraph (line 10), "What it reads" 2 and 4, Steps 2, 3, 5 and 8, the Anti-patterns row (line 354), the Rules (lines 363 to 372), the Stops rows. The lists of the other places are under Verify 3 and 6. |
| Item 10, ADR 0014 | DONE | `git diff --numstat -- docs/adr/` printed `1<tab>1<tab>docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md`; `git diff -- docs/adr/0014-*.md \| grep -c '^@@'` printed `1`. |
| Case 1 | DONE | Read: every piece of Steps 6, 7 and "The rewrite" 5 is a piece of a prompt file written by a command of "The prompt file" (lines 173 to 262), apart from the two typed texts of item 3; Steps 3 reads no file text (line 72). |
| Case 2 | DONE | Read: "Finding agent" lines 286 to 290 and "Checking agent" lines 312 to 316 are one bullet per ban (`Read your prompt file and no other file.`, `Edit no file.`, `Start no agent.`, `Invoke no skill.`, `Run no command.`); the two bullets that said "given in the prompt" and "as the prompt names it" now say "the prompt file" (lines 281 and 282). |
| Case 3 | DONE | Read: `rewrite.md` pieces, lines 257 to 262 (picked findings, files, rules, prose standard sections, "Rewrite agent" bullets); the bullets at lines 323 and 324 read the prompt file and the files the picked findings name. Run: a `rewrite.md` built with the commands for `docs/user/manual.html` and `src/engine/save/include/save/save_container.h` printed headings `1:The picked findings`, `5:File docs/user/manual.html, over 256 KB, given as its diff hunks`, `6:lines 1160-1264 of docs/user/manual.html`, `112:lines 1433-1513 of docs/user/manual.html`, `194:lines 1827-1907 of docs/user/manual.html`, `277:File src/engine/save/include/save/save_container.h`, `455:## Rules of a comment`, `467:## 0. Hard rules`, `478:## A. Vocabulary`, `486:## B. Punctuation`, `493:## C. Throat-clearing and meta-commentary`, `501:## E. Sentence shapes`, `512:## Rewrite agent`; `wc -c` printed `144874`. |
| Case 4 | DONE | Read: Steps 5 (the folder is made after Steps 4) and "The rewrite" 4 (after items 1 to 3); removed at Steps 8, on the stop in Steps 6 (and Steps 7 through Steps 6), at "The rewrite" 8 and on the stop of "The rewrite" 5. No other path of the skill ends after the folder is made. |
| Case 5 | DONE | Read: "The rewrite" 4 makes the prompt folder with its own `mktemp -d` and says "The prompt folder is no part of the scratch folder, so no prompt file stands at a repository path in it." |
| Case 6 | DONE | The final-tree run printed `2409:lines 1160-1264 of docs/user/manual.html`, `2515:lines 1433-1513 of docs/user/manual.html`, `2597:lines 1827-1907 of docs/user/manual.html`; `part wc -c:   128091`; the part has 270 lines and its first numbered line is numbered `1160` and its last `1907`. |
| Case 7 | DONE | Final run, last number then `wc -l` then path, 25 rows, `25 files, mismatches: 0`: `33 33 .scratch/13-serialization/plan.md`; `85 85 .scratch/15-rite-editor/adr-input.md`; `128 128 docs/adr/0045-text-fonts-shaping-and-the-glyph-pipeline.md`; `25 25 docs/agents/work-tracking.md`; `123 123 docs/roadmap/engine/editor.md`; `177 177 docs/roadmap/engine/rendering.md`; `342 342 docs/roadmap/execution-order.md`; `404 404 src/core/include/missal/core/collections/hashmap.hpp`; `35 35 src/engine/app/CMakeLists.txt`; `218 218 src/engine/app/include/app/engine.hpp`; `654 654 src/engine/app/src/engine.cpp`; `201 201 src/engine/app/src/engine_internal.h`; `40 40 src/engine/groups/CMakeLists.txt`; `193 193 src/engine/groups/include/groups/sim_stage.h`; `42 42 src/engine/groups/include/groups/write_services.h`; `68 68 src/engine/groups/src/write_services.cpp`; `23 23 src/engine/save/CMakeLists.txt`; `176 176 src/engine/save/include/save/save_container.h`; `120 120 src/engine/save/include/save/save_runtime.h`; `209 209 src/engine/save/src/save_runtime.cpp`; `106 106 src/engine/sim/include/sim/sim_core.h`; `236 236 src/engine/sim/src/sim_core.cpp`; `252 252 src/engine/tests/CMakeLists.txt`; `2821 2821 src/engine/tests/src/main.cpp`; `372 372 src/engine/tests/src/save_container_tests.cpp`. |
| Case 8 | DONE | Final run: `manual hit lines in finding.md: 104 of 513`; `hit lines of the other 25: 152`; `hit lines under all Non-ASCII headings: 256` (104 + 152); `finding.md bytes:   879371`; the checking agent's `checking.md` printed `checking.md bytes:   880266`. |
| Case 9 | DONE | Final run: `SIZE 262144 exact.cpp` under `2:File exact.cpp`; `SIZE 262145 over.cpp` under `4100:File over.cpp, over 256 KB, given as its diff hunks` and `4101:lines 1960-2040 of over.cpp`. |
| Case 10 | DONE | Final run: `4184:File rename_new.cpp, over 256 KB, given as its diff hunks`, `4185:lines 2060-2140 of rename_new.cpp`. |
| Case 11 | DONE | Final run: `4268:File oneline.txt, over 256 KB, given as its diff hunks`, `4269:lines 1-1 of oneline.txt`, then the one numbered line, numbered `1`, and the next heading `File big file.cpp` stands on a line of its own. |
| Case 12 | DONE | Final run: `4271:File big file.cpp, over 256 KB, given as its diff hunks`, `4272:lines 2960-3040 of big file.cpp`, `4355:File -big.cpp, over 256 KB, given as its diff hunks`, `4356:lines 2960-3040 of -big.cpp`. |
| Case 13 | DONE | Final run: `4439:File small_untracked.cpp, untracked, added whole`, then its five numbered lines, numbered `1` to `5`. |
| Case 14 | DONE | Read: the Checking agent bullet at line 305; run: the `checking.md` built with the commands printed, in its first lines, `Files given as hunks`, a blank line and `docs/user/manual.html, 1293416 bytes`; the copy of the diff, files and non-ASCII output was compared with `finding.md` before its rules by `cmp` and printed `identical`. |
| Case 15 | DONE | See item 10; the Decision now reads "The session writes a prompt file with shell commands. It holds the diff and the rules. It holds each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB. A fresh agent that changes nothing reads that file and reports findings;" and its other sentences are unchanged. |
| Verify 1, character-set check | DONE | The command of the brief over the two changed files printed only `exit 0`. |
| Verify 2, frontmatter | DONE | The `python3 -c` command printed `code-comments 1.0.0 939`. |
| Verify 3, the grep | DONE | See "Verify 3" below. |
| Verify 4, cases 6 to 13 | DONE | The rows above. |
| Verify 5, ADR diff | DONE | `git diff -- docs/adr/0014-*.md \| grep -c '^@@'` printed `1`, and `git diff --numstat -- docs/adr/` printed `1<tab>1<tab>docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md`: one line changed. |
| Verify 6, item to place | DONE | See "Verify 6" below. |
| Verify 7, list items and sentence length | DONE | See "Verify 7" below. |

### Verify 3

`grep -n -i 'read no file\|whole\|prompt\|scratch folder' skills/code-comments/SKILL.md` printed the lines below, each read:

- Line 3 (description) and line 10 (opening paragraph): items 1 and 9, a prompt file the session writes with shell commands.
- Line 27 (Use instead row): "as a whole" is about a step's diff; unrelated.
- Lines 41 and 44 to 50 ("What it reads" 3 and 4): items 4 and 9, whole or hunks, and the session does not read the file.
- Lines 69, 70 and 72 (Steps 3): items 2, 4 and 9.
- Lines 76 to 78 (Steps 5): items 1, 2 and 3.
- Lines 82, 87, 90 and 91 (Steps 6 and 7): items 6 and 8.
- Lines 93 and 95 (Steps 8): items 8 and 9.
- Lines 106 to 108, 114 to 116, 118, 119, 137 and 143 ("The rewrite" 4, 5 and 8): items 1, 5 and 8.
- Lines 146 to 262 ("The prompt file"): items 3, 4 and 6.
- Lines 280 to 282, 286, 304, 306, 312 and 323 (agent bullets): items 5 and 7. Line 304 is the Checking agent's "Number the kept findings from 1 across the whole report" and is unrelated.
- Lines 338 (first Stops row), 341 (No prose standard row, judgment call 4), 354 (Anti-patterns row) and 357 ("Scratch copies kept by file name alone", unchanged): items 8 and 9.
- Lines 363 to 365, 369 and 372 (Rules): item 9.

No line says the agents read no file or get each file whole without the prompt file or the 256 KB exception: `grep -n -i 'read no file\|work from the prompt alone\|each changed file whole' skills/code-comments/SKILL.md` printed nothing.

### Verify 6

Each item of "What to build" with the place in `skills/code-comments/SKILL.md` (line numbers as on the tree now):

1. The prompt folder: Steps 5 line 77, "The rewrite" 4 line 106 and line 107, `rewrite.md` in "The rewrite" 5 line 115.
2. The session does not read the files: "What it reads" 4 line 50, Steps 3 line 72, Steps 5 lines 78 to 81.
3. How a prompt file is written: lines 148 to 262; heading lines are written by `printf`, each file by `cat -n` or `git show '<head>:<path>' \| cat -n`, the diff by the command of Steps 3 with `--no-color` (line 71), the non-ASCII output by `<hits>` (line 155), the rules by `awk` over the headings (lines 221 to 223), the list of hunked files by `printf` (lines 228 to 232), the rewrite's picked findings typed (line 174).
4. A file over 256 KB: Steps 3 line 69, the `<hunks>` command line 157 (a count left out of `+c,d` is 1, `d=${d:-1}`), the hunk loop lines 196 to 215, a file added whole or untracked given whole (line 47), a file with no hunk keeping its heading and no lines (line 196).
5. The report names the large files: line 305, the list at lines 226 to 232.
6. The agent's prompt: lines 161 to 171, Steps 6 line 82, Steps 7 line 91, "The rewrite" 5 line 116.
7. The bullets: lines 276 to 330.
8. Removing the prompt folder: lines 87, 93, 118, 119, 137, 143 and the Stops row line 338.
9. Every other place: description, opening paragraph, "What it reads" 4, Steps 3, 5 and 8, Anti-patterns row (line 354), Rules (lines 363 to 372).
10. ADR 0014: its Decision, one line.

The skill read against `docs/dev/skill-layout.md`: frontmatter keys and `description` of 939 characters; sections in the order Title, Quick start, Use instead, What it reads, Steps, reference sections, Stops, Anti-patterns, Rules; "The prompt file" is a reference section with a noun-phrase label; each step ends on a completion criterion; no history, date or version in the text; the refusal in Steps 2 comes before Steps 5, the first write; the model stop in Steps 6 and 7 removes the folder. The skill read against ruling C of `plan.md`: the prompt file read whole as the agent's only file (lines 161 to 164), a file over 256 KB as its hunks with 40 lines on either side, the report naming each such file, the bullets, Rules and Anti-patterns saying the same. The skill read against ADR 0014 as edited: two agents, the report, the rewrite and its comparison are unchanged. The skill read against ADR 0001: the prose standard's sections are copied from the file Steps 2 finds (line 222) into the prompt folder, which is removed, so the skill keeps no copy.

### Verify 7

Each new or changed list item and sentence was read against the layout's rule of one rule per bullet and the prose standard's sentence length. Departures:

- The bullets that define a name in "The prompt file" (lines 150 to 157) each state a name and its command in one sentence; `<hunks>` (line 157) runs past 20 words because it holds its command.
- The two prompt templates (lines 164 and 170) are text the session types into an agent, three short sentences each, inside a `text` block.
- The hunk loops (lines 200 and 214) are one command each on one line, since the layout and the brief give commands as one line to type.
- The Steps 3 "Done when" (line 72) names four things held, since they are one state the next step reads.
- Steps 8 (line 93) holds two actions, removing the folder and showing the report, joined by "then", as "The rewrite" 8 already does.
- The Rules bullets at lines 364 and 365 carry an exception inside the rule, as the layout asks for a qualifier that changes the rule.
- The pieces lists (lines 243 to 262) are nested numbered lists, since the order of the pieces is the order of the file.
- "The prompt file" holds commands used only when a file is over 256 KB (the hunk commands). `docs/dev/skill-layout.md`, "Writing for an agent", puts material a step needs only in some runs in `references/<name>.md`. The brief's paths list names only `SKILL.md`, so they stand in the reference section; this is judgment call 1.

- Sentences over about 20 words that stay, each counted with a code span as one word, and why (line numbers of `SKILL.md`; the ADR's are in its one Decision line):
  - ADR 0014: the first sentence (32 words, "`/code-comments` reads a git diff, by default ..."), the sentence "A fresh agent that changes nothing reads that file and reports findings; a fresh checking agent keeps ..." (41 words) and the sentence on `strip_comments.py --compare` (32 words) are the Decision's existing text, and this round changed none of their words except "that file". The sentence "It holds each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB." (24 words) holds the file, its form and its one condition, which cannot be told apart.
  - Line 10: the three sentences are the most the layout allows for the opening paragraph; the first (27 words) names the diff and the two agents, the second (27 words) names the prompt file and its removal before the report, and the third (30 words) is the existing sentence on `apply`.
  - Lines 39, 44, 69 and 305 (24 and 25 words): each states one input or rule with its one exception or condition, which the layout keeps in the same bullet as the rule.
  - Lines 72 (37 words) and 92 (25 words): completion criteria, each naming everything that is true when the step is done.
  - Lines 89, 93 and 115 (34, 31 and 34 words): the heads of Steps 7, Steps 8 and "The rewrite" 5, each holding the ordered actions of its item, as the old items did; each action is repeated in the bullets under it only where a rule applies to it.
  - Line 79 (26 words): the existing sentence that the agents, not the session, judge which hit lines are comments, moved from the old "Hold the output" bullet.
  - Lines 280 and 282 (28 and 35 words): the existing bullets of "Finding agent", whose ending item 7 of the brief dictates ("read in the file as the prompt file gives it") and whose wording "the prompt file" replaces "the prompt".
  - Lines 364 and 365 (50 and 26 words): Rules bullets whose exception stays in the same bullet as the rule, as the layout asks.
  - The cells of the Stops and Anti-patterns rows (lines 338, 341 and 354) are phrases in table cells, to which the sentence-length rule does not apply.

## The terms

Terms of `docs/glossary.md` used by the diff, each read against its entry. No entry is added or changed, so no "Stated in" is changed.

- **effort agent**: Steps 4 (line 73), Steps 6 (line 81), Steps 7 (through Steps 6, line 90) and "The rewrite" 5 (line 115) still launch the agents as `ordo-<reviewer_effort>`. `grep -n 'ordo-<reviewer_effort>' skills/code-comments/SKILL.md` printed lines 73, 81 and 115.
- **reviewer**: Steps 6 (line 81) and "The rewrite" 5 (line 115) say "on the model `reviewer` names". The entry's "Stated in" for `code-comments` is Steps 6, which holds.
- **finding**: the finding agent's final message, the picked findings and the "Finding agent" and "Checking agent" sections (lines 276 and 293) use it as the entry defines it for `/code-comments`.
- **completion notice**: used at line 174 for the finding agent's final message; the entry says it is what the runner reports when an agent ends, its final message and tokens. Same sense.
- **refusal**: the new clause of "No prose standard" (line 39) is a refusal that names its cause and leaves nothing, raised in Steps 2 before any folder exists. Same sense.
- **stop**: unchanged use; the first Stops row now also shows the prompt folder removed.
- **runner**, **step** ("Steps 3" and so on): unchanged use.
- "prompt folder" and "prompt file" are plain words the skill defines where it makes them (Decision 10 of the brief), and no entry is added.

## Files changed

- `skills/code-comments/SKILL.md`: 376 lines (254 on main); `metadata.version` stays `"1.0.0"`.
- `docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md`: 23 lines, one line changed (the Decision).
- `.scratch/4-code-comments/agents/reviews/1a-report.md`: this report.

`git status --short` in the worktree printed ` M docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md` and ` M skills/code-comments/SKILL.md` besides the untracked report.

Rule 14 of the change standard: `grep -rn -i 'writes no file\|write no file\|read no file\|prompt alone\|each changed file whole\|reviewed file whole\|file whole with\|Hold the output' --exclude-dir=.git --exclude-dir=.scratch .` printed only `skills/code-comments/SKILL.md:360` (the new Rules bullet), the ADR's Decision (which says "each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB") and `skills/writing/SKILL.md` lines 82, 131 and 256, the `writing` skill's own agents, which this step does not change. `README.md:27`, `README.md:78`, `docs/roadmap.md:24` and `agents/ordo-*.md:6` were read and stay true.

## Every judgment call the brief left open

1. The commands of items 3 and 4 stand in a reference section "The prompt file" of `SKILL.md`, which Steps 5, 7 and "The rewrite" 5 point at, so each command is written once. The hunk commands are needed only when a file is over 256 KB, and the layout would place such material in `references/<name>.md`; the paths list names only `SKILL.md`. Item served: 3 and 4. The orchestrator rules on moving them.
2. Each piece starts with a line break, written by its own `printf` or by `printf '\n' >> <out>` before it, so a reviewed file that ends without a final newline never joins the next heading. Item served: 3.
3. Heading lines: `The diff`, `File <path>`, `File <path>, over 256 KB, given as its diff hunks`, `File <path>, untracked, added whole`, `Non-ASCII hits in <path>`, `Non-ASCII hits in <path>, on the lines of its hunks`, `Files given as hunks`, `lines <first>-<last> of <path>`. Item served: 3 and 4.
4. The rules and the prose standard's sections are copied by `awk` over the headings, since section D lies between C and E in the prose standard and an `awk` over headings does not depend on line numbers. A prose standard without one of the headings `## 0.`, `## A.`, `## B.`, `## C.`, `## E.` would give an empty piece without a word, so Steps 2 checks that `grep -c -e '^## [0ABCE]\. ' -- '<path>'` prints 5, "What it reads" 2 (line 39) makes a file lacking one a "No prose standard" refusal that names that file, and the Stops row (line 341) says so. Item served: 3; this is the one addition the brief does not list.
5. `checking.md` holds the "Rules of a comment" section and the prose standard's five sections whole, where the brief says "the text of each rule a finding names". Selecting only the named rules would need a judgment by the session or a command per rule; the whole sections contain every rule a finding can name. Item served: 3.
6. `checking.md` starts with the finding agent's final message, written with the file-writing tool, which creates the file; the commands then append the rest. `rewrite.md` starts with the picked findings the same way. Item served: 3 (the typed texts are the only text the session writes).
7. The copy of the diff, the files and the non-ASCII output into `checking.md` is `sed '/^## Rules of a comment$/,$d' '<prompt>/finding.md'`, which relies on `finding.md` holding the rules after them. Item served: Decision 4.
8. The rewrite's files use the working tree's text (`cat -n -- '<path>'`), the review's ends and `wc -c < '<path>'`. For a range the working-tree text equals the reviewed text, which "The rewrite" 3 checks. Item served: 3 and 4.
9. A file added whole or untracked is given whole at any size (Decision 3 of the brief), so a very large added file makes a very large prompt file. Case 8's limit of 1,000,000 bytes holds for the gate's range (`finding.md` 879,371 bytes).
10. The description gains two sentences and a clause (939 characters, at most 1,024). Item served: 9.

## Every host- or user-visible change

- What the review writes. Before: nothing ("Write no file and change nothing."). After: a prompt folder under `${TMPDIR:-/tmp}`, outside the repository, removed before the report is shown; the rewrite writes its scratch folder and its own prompt folder and removes both.
- What reaches the agents. Before: the session typed the diff, every file and the rules into each agent's prompt, and the agents read no file. After: each agent's prompt names its prompt file, which the agent reads whole and which is the only file it reads; the rewrite agent also reads and edits the files its picked findings name.
- A reviewed file over 262,144 bytes. Before: given whole. After: given as its diff hunks with 40 lines on either side, unless the diff adds it whole or it is untracked; the checking agent's report opens with a line naming each such file with its size in bytes, or saying none was.
- A prose standard lacking one of its sections 0, A, B, C and E. Before: no check. After: the refusal "No prose standard", naming the file.
- The first Stops row's "What it shows" and the stop's message in "The rewrite" 5 name the prompt folder removed besides the scratch folder.
- The frontmatter `description`, which the runner shows in every session's skill listing. Before (756 characters): "Review the comments a git diff adds or changes, the uncommitted changes or a range of commits, with a finding agent and a checking agent that change nothing, and rewrite the comments the user picks in C, C++ and CMake files. The report shown to the user lists each comment that breaks a named rule with its place, the quoted comment and what the rule asks for, the false comments first, and proposes no replacement. A rewrite is kept only when the file's code compares equal to its code before the rewrite. Triggers on: /code-comments, /code-comments <base>..<head>, review the comments of a diff, review the comments of a range, check the comments of my changes, check the comments against the code, apply the comment findings, apply <numbers>, apply all." After (939 characters): "Review the comments a git diff adds or changes, the uncommitted changes or a range of commits, with a finding agent and a checking agent that change nothing, and rewrite the comments the user picks in C, C++ and CMake files. Each agent reads its whole task from a prompt file the session writes with shell commands. A file over 256 KB reaches it as its diff hunks. The report shown to the user lists each comment that breaks a named rule with its place, the quoted comment and what the rule asks for, the false comments first, and proposes no replacement. The report names each file given as hunks. A rewrite is kept only when the file's code compares equal to its code before the rewrite. Triggers on: /code-comments, /code-comments <base>..<head>, review the comments of a diff, review the comments of a range, check the comments of my changes, check the comments against the code, apply the comment findings, apply <numbers>, apply all."
- ADR 0014's Decision. Before: "A fresh agent that changes nothing reads the diff, each changed file whole and the rules, and reports findings;". After: "The session writes a prompt file with shell commands. It holds the diff and the rules. It holds each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB. A fresh agent that changes nothing reads that file and reports findings;".

## Anything in the brief that was wrong or impossible

Nothing was impossible, and no case or sentence of the brief proved false when run. Two points for the orchestrator:

- The brief says the session writes the finding agent's final message and the picked findings "with its file-writing tool", and the tool replaces a file's text. Writing each as the first piece of its prompt file, with the commands appending after it, meets that (judgment call 6).
- "N1" to "N4" of the brief check are met: lines 281 and 282 say "the prompt file"; the untracked mark is the heading of the untracked-file block (line 192); the Stops row and the stop's message name both folders; the two words need no glossary entry (Decision 10).

## Repair round 1

Ruling 1 (ST1), the line break before every piece.
- Changed: `printf '\n' >> <out>` stands before the rules block and before the copy block of `checking.md` in "The prompt file" (lines 220 and 237), and the sentence at line 159 now reads "Each piece starts with a line break. Its own `printf` writes it, or `printf '\n' >> <out>` before the piece. A reviewed file that ends without a final newline then never joins the next heading." Every other piece starts with its own `printf`, apart from the typed text, which is the first piece of its file.
- Before the change, in a scratch repository under `$TMPDIR` with `a.c` and `z.c` as the reviewed files, `z.c` ending `// new z` without a final newline (`od -c` of its last bytes ended `n e w   z` with no `\n`), `finding.md` and `rewrite.md` built with the skill's commands as they stood printed: `BEFORE finding.md: rules heading lines = 1`, `BEFORE rewrite.md: rules heading lines = 0`, and `grep -n 'Rules of a comment'` of `rewrite.md` printed `11:     2<tab>// new z## Rules of a comment`. In `finding.md` the last file's heading `Non-ASCII hits in z.c` had no line under it and `## Rules of a comment` stood directly under it.
- After the change, the same input with the changed commands printed `AFTER finding.md: rules heading lines = 1`, `AFTER rewrite.md: rules heading lines = 1` and `AFTER checking.md: rules heading lines = 1`. In `rewrite.md` the last file's last line `     2<tab>// new z` stands alone above `## Rules of a comment`, and in `finding.md` `Non-ASCII hits in z.c` is followed by a blank line and then `## Rules of a comment`. The scratch repository and prompt folder were removed afterwards.

Ruling 2 (ST2), sentence length.
- ADR 0014's Decision: the clause on how the agent gets the files is now sentences before the agent's sentence, "The session writes a prompt file with shell commands. It holds the diff and the rules. It holds each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB.", and the agent's sentence begins "A fresh agent that changes nothing reads that file and reports findings;". `git diff --numstat -- docs/adr/` printed `1<tab>1<tab>docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md` and `git diff -- docs/adr/0014-*.md | grep -c '^@@'` printed `1`: the Decision line only.
- `SKILL.md`: the opening paragraph is three sentences, with the clause on the prompt file as its own second sentence (line 10). Other sentences shortened: the description's prompt-file sentence is split and "The report names each file given as hunks." is its own sentence (line 3); "A file the diff adds whole and an untracked file are given whole at any size." (line 47); the Steps 3 bullet on hunks is two bullets (lines 69 and 70); "Writing the typed text" is two sentences (line 174); `<ends>` is two sentences (line 151); the Checking agent bullet on the opening line is two bullets (lines 305 and 306).
- The sentences over about 20 words that stay are named, each with why, in Verify 7 above.

Ruling 3 (B1), the description.
- Added to "Every host- or user-visible change": the bullet for the frontmatter `description`, with its text before (756 characters) and after (939 characters).

Rerun of the brief's checks on the changed text:
- Character-set check over `SKILL.md` and the ADR file: printed only `exit 0`; over the report as well it printed only `exit 0`.
- `python3 -c` frontmatter check: `code-comments 1.0.0 939`.
- ADR diff: `1<tab>1<tab>docs/adr/0014-...` and one `@@` hunk, as above.
- `grep -n -i 'read no file\|work from the prompt alone\|each changed file whole' skills/code-comments/SKILL.md` printed nothing and exited 1; `awk` for a double blank line printed nothing; `wc -l skills/code-comments/SKILL.md` printed `376`.
- Verify 3's grep was rerun and its lines read again (list above, renumbered). Verify 6 and 7: the item-to-place lists were renumbered against the changed file.
- Case 3 (`rewrite.md` built for `docs/user/manual.html` and `save_container.h`): headings `5:File docs/user/manual.html, over 256 KB, given as its diff hunks`, `6:lines 1160-1264 of docs/user/manual.html`, `112:lines 1433-1513 of docs/user/manual.html`, `194:lines 1827-1907 of docs/user/manual.html`, `277:File src/engine/save/include/save/save_container.h`, `455:## Rules of a comment`, `467:## 0. Hard rules`, `478:## A. Vocabulary`, `486:## B. Punctuation`, `493:## C. Throat-clearing and meta-commentary`, `501:## E. Sentence shapes`, `512:## Rewrite agent`; `rewrite.md bytes:   144874`.
- Case 6: `2409:lines 1160-1264 of docs/user/manual.html`, `2515:lines 1433-1513 of docs/user/manual.html`, `2597:lines 1827-1907 of docs/user/manual.html`; `case 6 part wc -c: 128091`.
- Case 7: `case 7: 25 files, mismatches: 0` (last number against `wc -l` for the 25 files, as in the table above).
- Case 8: `case 8: manual hits in finding.md: 104 of 513; all hit lines in finding.md: 256; rules headings: 1`; `finding.md bytes:   879371`.
- Case 14: `checking.md` printed `Files given as hunks`, a blank line and `docs/user/manual.html, 1293416 bytes`; `checking.md bytes:   880266; rules headings: 1`.
- The scratch clone, the scratch repository and the prompt folders were removed (`ls "$TMPDIR" | grep -E '^(ge-r1|sr-r1|r1-folder|r1-names|desc-|code-comments-prompt)'` printed nothing and exited 1).
