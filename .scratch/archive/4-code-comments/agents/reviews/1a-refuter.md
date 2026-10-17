# Step 1a refuter report (on .agents/worktrees/4-code-comments-1a, base d4809cd)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' skills/code-comments/SKILL.md docs/adr/0014-...-compare-equal.md | xargs -0 perl -CSD -ne '<the brief's character-set check>'; echo "exit $?"
exit 0

$ python3 -c 'import yaml; d=yaml.safe_load(open("skills/code-comments/SKILL.md").read().split("---")[1]); print(d["name"], d["metadata"]["version"], len(d["description"]))'
code-comments 1.0.0 935

$ LC_ALL=C grep -n '[^ -~]' skills/code-comments/SKILL.md docs/adr/0014-*.md .scratch/4-code-comments/agents/reviews/1a-report.md; echo "grep exit $?"
grep exit 1

$ grep -n -i 'read no file\|whole\|prompt\|scratch folder' skills/code-comments/SKILL.md
lines 3, 10, 27, 41, 44, 47, 50, 69, 71, 75, 76, 77, 81, 86, 89, 90, 92, 94, 105, 106, 107, 113, 114, 115, 117, 118, 136, 142, 145, 147, 149, 160, 163, 166, 169, 173, 181, 191, 195, 202, 235, 238, 242, 256, 277, 278, 279, 283, 301, 302, 308, 319, 334, 350, 353, 359, 360, 361, 365, 368
(each read: line 27 "as a whole" and line 301 "the whole report" are unrelated; every other line matches items 1 to 9 as the builder's "Verify 3" maps them)

$ git diff d4809cd --numstat
1<tab>1<tab>docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md
178<tab>60<tab>skills/code-comments/SKILL.md
$ git diff d4809cd -- docs/adr/ | grep -c '^[-+][^-+]'
2
$ git status --short
 M docs/adr/0014-...-compare-equal.md
 M skills/code-comments/SKILL.md
?? .scratch/4-code-comments/agents/reviews/1a-report.md

Premises, on the base:
$ git show d4809cd:skills/code-comments/SKILL.md | wc -l   ->  254 ; sed -n 5p -> version: "1.0.0"
$ git show d4809cd:skills/code-comments/SKILL.md | grep -n -i 'whole\|read no file\|prompt\|line numbers'
27, 40, 43, 59, 65, 67, 73, 77, 79, 90, 92, 98, 121, 123, 172, 173, 174, 178, 192, 198, 244, 245 (the brief's quoted lines stand at its numbers; 129, 219 and 249 read as the brief quotes them)
$ grep -n -o 'The prompt you are given holds the whole task[^.]*\.' agents/ordo-*.md   -> line 6 in each of the five
$ python3 over every */subagents/**/*.jsonl, largest input + cache tokens of one response
638 (406505, 'claude-opus-5-5', '7bdaf343-.../subagents/agent-ad3f887161cb31e53.jsonl')

Scratch clone: git clone -q /Users/axelfaes/workspace/game-engine "$TMPDIR/ge-refute-1a" && git -C "$TMPDIR/ge-refute-1a" checkout -q --detach a0aa831
a0aa831 Implement save-slot runtime and container functionality
rev-parse of the ends: c6a46fcae5e7831034afc1213b59d19e434f49c7, a0aa831994dc3c492af9aaf3c94f31108cc9070b
grep -c -e '^## [0ABCE]\. ' -- '<repo-setup template prose-standard.md>'  ->  5
finding.md built with the commands of "The prompt file" as written (diff, 26 files, non-ASCII, three awk pieces):
HUNKS M 1293416 docs/user/manual.html
  879370 .../code-comments-prompt.vujVWD/finding.md
2408:File docs/user/manual.html, over 256 KB, given as its diff hunks
2409:lines 1160-1264 of docs/user/manual.html
2515:lines 1433-1513 of docs/user/manual.html
2597:lines 1827-1907 of docs/user/manual.html
9193:## Rules of a comment ... 9205:## 0. ... 9216:## A. ... 9224:## B. ... 9231:## C. ... 9239:## E. ... 9250:## Finding agent
case 6 part:   128091 bytes, 270 lines, first 1160 last 1907
case 7: 25 rows "last count wc-l same", e.g. "2821 2821 2821 same src/engine/tests/src/main.cpp", "85 85 85 same .scratch/15-rite-editor/adr-input.md"; "files 25 mismatches 0"
case 8: manual hits under its heading 104; all manual hits 513; other 25: direct grep 152 (my count under the headings printed 153, the extra line being "## Rules of a comment", see ST1); manual hits bytes 84350 all, 51069 on its hunks; wc -c finding.md 879370
case 14: checking.md head: "Files given as hunks", "", "docs/user/manual.html, 1293416 bytes"; the copy from finding.md compared by cmp: identical; wc -c 880209 (with my stand-in for the finding agent's message)
case 3: rewrite.md headings 1:The picked findings, 5:File docs/user/manual.html, over 256 KB, given as its diff hunks, 6:lines 1160-1264, 112:lines 1433-1513, 194:lines 1827-1907, 277:File src/engine/save/include/save/save_container.h, 454:## Rules of a comment, 466 to 500: ## 0. to ## E., 511:## Rewrite agent; wc -c 144830 (my stand-in)

Scratch repository $TMPDIR/sr-refute-1a, default call (git diff HEAD), files committed then changed:
HUNKS 268800 -big.cpp            -> 91:lines 2960-3040 of -big.cpp
HUNKS 268800 big file.cpp        -> 175:lines 2960-3040 of big file.cpp
WHOLE 262144 exact.cpp           -> 258:File exact.cpp, 4096 numbered lines
WHOLE 34 nonl.cpp                -> "     2<tab>int c; // no newline at end" then "File oneline.txt, ..." on its own line
HUNKS 300001 oneline.txt         -> diff "@@ -1 +1 @@"; 4360:lines 1-1 of oneline.txt, one numbered line
HUNKS 262145 over.cpp            -> 4364:lines 1960-2040 of over.cpp
HUNKS 268800 rename_new.cpp (R099 after git mv and an edit) -> 4448:lines 2060-2140 of rename_new.cpp, 81 lines; with the new path alone "@@ -0,0 +1,4200 @@"
4531:File small_untracked.cpp, untracked, added whole
4538:File untracked_big.cpp, untracked, added whole, 4200 numbered lines, last "4200<tab>// untracked line 004200 ..."
awk -F: -v c=1160 -v e=1264 '$1 >= c && $1 <= e' over "999:x 1200:y 12000:z 2:w"  ->  1200:y

rewrite.md with nonl.cpp as its last file, then the rules awk piece:
     2<tab>int c; // no newline at end## Rules of a comment
grep -c '^## Rules of a comment$'  ->  0

Commands the builder's report quotes, rerun:
$ sed -n 46,52p .scratch/4-code-comments/orchestrator-state.md    -> "- none." under "## Open items" (main's state file also holds "- none.")
$ grep -rn -i 'writes no file\|write no file\|read no file\|prompt alone\|each changed file whole\|reviewed file whole\|file whole with\|Hold the output' --exclude-dir=.git --exclude-dir=.scratch .
docs/adr/0014-...:11, skills/code-comments/SKILL.md:360, skills/writing/SKILL.md:82, :131, :256
$ grep -n -i 'read no file\|work from the prompt alone\|each changed file whole' skills/code-comments/SKILL.md; echo "exit $?"
exit 1
$ grep -n 'ordo-<reviewer_effort>' skills/code-comments/SKILL.md   -> 72, 80, 114
$ ls "$TMPDIR" | grep -i 'ge-\|sr-\|code-comments'  (before my runs)  -> only typescript-language-server502, no folder of the builder left
wc -l: SKILL.md 372, ADR 0014 23.
```

Every scratch folder of mine was removed (`ls "$TMPDIR" | grep -i 'refute-1a\|code-comments\|ge-1a\|sr-1a'` printed nothing, exit 1).

## Verdicts

Items of the brief's "What to build", in its numbering:
- 1: holds. Steps 5 (SKILL.md:75-76) makes the prompt folder after Steps 4 with the brief's `mktemp -d`; "The rewrite" 4 (SKILL.md:105-106) makes its own beside the scratch folder after items 1 to 3; `finding.md`, `checking.md`, `rewrite.md` at Steps 5, 7 and "The rewrite" 5.
- 2: holds. "What it reads" 4 (SKILL.md:50), Steps 3's "Done when" (SKILL.md:71, "no file's text has been read"), Steps 5 (SKILL.md:77); the old "Hold the output" is gone.
- 3: holds. Every piece is a command appending with `>>`; the two typed texts are named (SKILL.md:172-173); the rules are copied by `awk` from the skill's file and the absolute prose-standard path. My runs reproduce the pieces. ST1 is a defect in the format's own sentence on line breaks, not in what this item asks.
- 4: holds. Steps 3 (SKILL.md:69), `<hunks>` with `--no-color --find-renames --unified=40` and both paths (SKILL.md:156), `d=${d:-1}`, the hunk loop (SKILL.md:199); added and untracked files whole (SKILL.md:47); a file with no hunk keeps its heading (SKILL.md:195). Cases 6, 9 to 12 reproduce.
- 5: holds. SKILL.md:302 and the list piece (SKILL.md:224-230); case 14 reproduces.
- 6: holds. SKILL.md:160-170 give both prompts with role, absolute path, "whole, every line, in parts when your read tool cuts it" and "the only file you read"; the rewrite prompt adds the files it edits; the pieces lists are SKILL.md:238-259.
- 7: holds. Five one-rule bullets in "Finding agent" (SKILL.md:283-287) and "Checking agent" (SKILL.md:308-312); SKILL.md:277-279 say "the prompt file"; "Rewrite agent" SKILL.md:319-320.
- 8: holds. Steps 6 (SKILL.md:86), Steps 8 (SKILL.md:92), "The rewrite" 5 (SKILL.md:117-118) and 8 (SKILL.md:136, 142), first Stops row (SKILL.md:334).
- 9: holds. Description, opening paragraph, "What it reads" 4, Steps 3, 5 and 8, Rules SKILL.md:359-368, Anti-patterns row SKILL.md:350; the grep of rule 14 finds no stale sentence (above).
- 10: holds. One line changed (numstat 1/1), the clause says what the item says, no dated note, title and other sections unchanged. ST2 concerns the sentence's length.

Cases of the brief's "Cases":
- 1: met. No piece of Steps 6, 7 or "The rewrite" 5 is typed except the two named typed texts; no step reads file text into the session.
- 2: met. One bullet per ban; SKILL.md:278-279 say "the prompt file".
- 3: met. Pieces at SKILL.md:254-259 and my rewrite.md run; bullets SKILL.md:319-320. ST1 affects how the rules piece joins a last file with no final newline.
- 4: met. Folders made after Steps 4 and "The rewrite" 3; removed at Steps 8, on the model stop (Steps 6, reached from Steps 7), at "The rewrite" 5's stop and at "The rewrite" 8. No other exit of the skill follows the folder's creation.
- 5: met. SKILL.md:105-106, a separate `mktemp -d`.
- 6: met. Three headings, part 128091 bytes, numbered 1160 to 1907.
- 7: met. 25 files, 0 mismatches, `main.cpp` 2821/2821, the renamed file 85/85.
- 8: met. 104 of 513 for `manual.html`, 152 hits for the other 25, `finding.md` 879370 bytes.
- 9: met. 262144 bytes whole (4096 lines), 262145 bytes as `lines 1960-2040 of over.cpp`.
- 10: met. `lines 2060-2140 of rename_new.cpp`; the new path alone gives `@@ -0,0 +1,4200 @@`.
- 11: met. `@@ -1 +1 @@` gives `lines 1-1 of oneline.txt` and one numbered line.
- 12: met. `big file.cpp` and `-big.cpp` each get `lines 2960-3040 of <path>` as the diff lists the path.
- 13: met. `File untracked_big.cpp, untracked, added whole` and 4200 numbered lines.
- 14: met. SKILL.md:302; the list stands in `checking.md`.
- 15: met. One Decision line changed, no dated note.

The four points the builder raised:
- (1) The commands in a `## The prompt file` reference section instead of `references/`: holds. Every review run reads the section (Steps 5 and 7 point at it). The parts that only some runs need (untracked file, file given as hunks, `rewrite.md`) are short branches of one format, like the "for a range" branches in Steps. `docs/dev/skill-layout.md`, "Writing for an agent", gives "a long format, a table of cases, a protocol" as examples of what goes to `references/`. The brief's paths name only `SKILL.md`, so the builder was right to report the point and not add a file.
- (2) The heading check in Steps 2: holds. It serves item 3. When a section is missing, the `awk` copy prints nothing and the agents get an empty rules piece with no warning, which is the silent partial result change standard rule 2 forbids. Rule 20 allows the addition when an item needs it and it is listed with that item among the judgment calls. The report lists it with item 3 and states it under the user-visible changes. The `grep -c` pattern and the `awk` test agree on the template (5 headings, 5 sections copied).
- (3) `checking.md` holding whole rules sections: holds. Item 3's general bullet already lists "the rules of 'Rules of a comment', the prose standard's sections 0, A, B, C and E, and the agent's bullets" as pieces of a prompt file, and whole sections contain "the text of each rule a finding names". Sections A and C state their rules as unlabelled paragraphs, so a command per rule has no fixed boundary to cut at. The checking bullets judge only the findings, so they keep the same meaning.
- (4) The heading `printf` starting with a line break: holds. Run on `nonl.cpp`, it puts the next heading on its own line, and SKILL.md:158 states why. The piece that does not start with a `printf` is ST1.

## 1. Spec

None.

## 2. Proof

None. Every count, path and measurement a decision rests on reproduced (above). The builder's case 11 used a 588,902-byte file and mine a 300,001-byte file, and the builder's `checking.md` (880222) and `rewrite.md` (144873) sizes depend on its stand-in text, where mine printed 880209 and 144830. No decision rests on these numbers.

## 3. Standards

- ST1. SKILL.md:158, "Each `printf` that starts a piece writes a line break first. A reviewed file that ends without one then never joins the next heading.", is false for `rewrite.md`. Its piece 3, the rules, is written by `awk '/^## /{p = ($0 == "## Rules of a comment")} p' ...` (SKILL.md:219), which starts with no line break, right after piece 2, the files. Run: a `rewrite.md` whose last file is `nonl.cpp` (no final newline) holds `     2<tab>int c; // no newline at end## Rules of a comment`, and `grep -c '^## Rules of a comment$'` prints 0. The same missing break also affects `finding.md` and `checking.md`. There the last file's heading `Non-ASCII hits in src/engine/tests/src/save_container_tests.cpp` has `## Rules of a comment` on the next line, so SKILL.md:202, "A heading with no line under it means no hit", does not hold for the last file with no hit. Failure scenario: `apply` picks a finding in a C++ file that ends without a newline and stands last in `rewrite.md`. The rewrite agent reads the comment on that file's last line as `// ... ## Rules of a comment` and finds no `## Rules of a comment` heading line, so it judges the comment against text the file does not hold. No file of the gate's range lacks a final newline (`tail -c1` over the range's C, C++ and CMake files printed nothing), but the skill is written for any repository, and the builder's own line-break rule exists for exactly this input. Fix: a `printf '\n' >> <out>` before the first rules piece, written into "The rules" bullet, so the guarantee at SKILL.md:158 covers every piece.
- ST2. Prose standard, section E, "Sentence length", with Verify 7 of the brief, which asks for every departure to be named with its reason. The edited Decision sentence of ADR 0014 (docs/adr/0014-...:11) is 76 words: "A fresh agent that changes nothing reads the diff, each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB, and the rules, from a prompt file the session writes with shell commands, and reports findings; a fresh checking agent ...". SKILL.md:10's first sentence grew from 27 to 39 words with the nested clause "each reading a prompt file that the session writes with shell commands". The report's "Verify 7" names neither. Failure scenario: a reader of ADR 0014 can attach "or as its diff hunks" to "the diff", and "from a prompt file" to "the rules" alone, and so take the diff itself to be cut to hunks, or take the files to be read some other way. Item 10 keeps the rest of the Decision, but the clause could stand as a sentence of its own, such as "The session writes the agent's prompt file with shell commands: the diff, each changed file whole or, over 256 KB, as its diff hunks with 40 lines on either side, and the rules.", before the agent's sentence.

## 4. Behaviour

- B1. The frontmatter `description` (SKILL.md:3) gains the sentence "Each agent reads its whole task from a prompt file the session writes with shell commands, and a file over 256 KB reaches it as its diff hunks." and the clause "it names each file given as hunks". The runner shows that text in every session's skill listing. The report mentions it only as judgment call 10, with its length, and leaves it out of "Every host- or user-visible change". Failure scenario: the orchestrator writing the booking from that list leaves the change to the skill listing out of the landing record. Fix: one bullet with the before and after text.

## Declined to judge

- The report's `git diff --numstat -- docs/adr/` and `git diff -- docs/adr/0014-*.md | grep -c '^@@'` in the worktree are not among the three git commands I may run there, so I did not run them in that form. In their place I ran `git diff d4809cd --numstat` (1 and 1 for the ADR) and `git diff d4809cd -- docs/adr/ | grep -c '^[-+][^-+]'` (2).
- Whether an agent reads the 879,370-byte `finding.md` and the 880 KB `checking.md` whole in parts, and holds them, with lines up to 5331 characters. The premise of 406,505 tokens reproduces, but the token count of the file is not verified. Starting an agent, which this review may not do, would settle it, and so will the gate run of step 2.
- Outside this step: game-engine at `a0aa831` tracks no `.agents/plan.yaml`. A clone has no `.agents` folder, and the file in `/Users/axelfaes/workspace/game-engine/.agents/` is untracked. So `/code-comments` in a fresh clone stops at the refusal "No plan configuration" until that file is copied in. Its `standards` key names no prose standard, so the run falls back to the `repo-setup` template. This bears on step 2's setup.

Reviewer usage: acaa6da129278eb92, claude-opus-5-5, 249732 tokens, 58 tool uses, 15m 8s.

## Repair round 1, refuted

```
Worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/4-code-comments-1a, base d4809cd.

$ printf '%s\0' skills/code-comments/SKILL.md docs/adr/0014-...-compare-equal.md | xargs -0 perl -CSD -ne '<the brief's character-set check>'; echo "exit $?"
exit 0
$ (same check over .agents/.../1a-report.md, the report) ; echo "report exit $?"
report exit 0
$ python3 -c 'import yaml; d=yaml.safe_load(open("skills/code-comments/SKILL.md").read().split("---")[1]); print(d["name"], d["metadata"]["version"], len(d["description"]))'
code-comments 1.0.0 939
$ LC_ALL=C grep -n '[^ -~]' skills/code-comments/SKILL.md docs/adr/0014-*.md .scratch/4-code-comments/agents/reviews/1a-report.md; echo "grep exit $?"
grep exit 1
$ git diff -- docs/adr/0014-*.md | grep -c '^@@'
1
$ git diff d4809cd --numstat
1<tab>1<tab>docs/adr/0014-...-compare-equal.md
182<tab>60<tab>skills/code-comments/SKILL.md
$ grep -n -i 'read no file\|work from the prompt alone\|each changed file whole' skills/code-comments/SKILL.md; echo "exit $?"
exit 1
$ wc -l skills/code-comments/SKILL.md      -> 376
$ awk (double blank line) over SKILL.md     -> printed nothing
$ git status --short
 M docs/adr/0014-...md
 M skills/code-comments/SKILL.md
?? .scratch/4-code-comments/agents/briefs/1a-round-1.md
?? .scratch/4-code-comments/agents/reviews/1a-report.md
$ git show d4809cd:skills/code-comments/SKILL.md (description length)   -> 756
$ grep -n -i 'read no file\|whole\|prompt\|scratch folder' skills/code-comments/SKILL.md
  (66 lines, each read: line 27 "as a whole" and line 304 "the whole report" are unrelated; every other line matches items 1 to 9 of "What to build")
$ the report's "After" description text compared with the file's parsed description  -> equal (939 characters); the "Before" text compared with the base's -> equal (756 characters)

ST1 rebuild, scratch repository $TMPDIR/sr-refute-1a-r1 (a.c with a non-ASCII char, z.c ending "// new z" with no final newline (od -c of its tail: "w   z", no \n), untracked u.c), default call, every piece typed with the commands of "The prompt file" as they stand now:
finding heading count:  grep -c '^## Rules of a comment$' -> 1
checking heading count: grep -c '^## Rules of a comment$' -> 1
rewrite heading count:  grep -c '^## Rules of a comment$' -> 1
rewrite.md:  line 10 "     2<tab>// new z", line 11 "## Rules of a comment"   (the last file's last line stands alone)
finding.md:  "     2<tab>// new z" then "File u.c, untracked, added whole" on the next line; "Non-ASCII hits in u.c", blank, "## Rules of a comment"
checking.md: "     2<tab>// new z" on its own line; "## Rules of a comment" once
mid-line search for "## Rules of a comment", "Non-ASCII hits in", "Files given as hunks" and "File <path>" headings after other text in the three files -> nothing
Hunk branch, big.c (322,816 bytes, 5000 lines, last line changed, no final newline), `<hunks>` loop + non-ASCII-on-hunks piece + rules piece:
  3:lines 2960-3040 of big.c, 85:lines 4960-5000 of big.c, 127:Non-ASCII hits in big.c, on the lines of its hunks, 130:## Rules of a comment (1 heading); the last hunk's last line "5000 // changed last line" is followed by a line break from the next piece.
The same input with the commands of the snapshot (pre-round) SKILL.md: rewrite.md `grep -c` -> 0, with the line "     2<tab>// new z## Rules of a comment"; finding.md `grep -c` -> 1 with "## Rules of a comment" directly under "Non-ASCII hits in z.c". This reproduces the report's BEFORE figures.

Scratch clone: git clone -q /Users/axelfaes/workspace/game-engine "$TMPDIR/ge-refute-1a-r1" && git -C ... checkout -q --detach a0aa831
a0aa831 Implement save-slot runtime and container functionality
ends: c6a46fcae5e7831034afc1213b59d19e434f49c7, a0aa831994dc3c492af9aaf3c94f31108cc9070b; 26 files in the diff (name-status -z, rename R kept as one row)
finding.md built with the commands of "The prompt file": HUNKS 1293416 docs/user/manual.html (the only one); wc -c finding.md -> 879371; grep -c '^## Rules of a comment$' -> 1
case 6: 2409:lines 1160-1264 of docs/user/manual.html, 2515:lines 1433-1513 of docs/user/manual.html, 2597:lines 1827-1907 of docs/user/manual.html; the part (from 2409 to the line before the next "File" heading's blank line): wc -c 128091, 270 lines, first numbered line 1160, last 1907
case 7: files 25 mismatches 0 (last numbered line against git show a0aa831:<path> | wc -l); "2821 2821 src/engine/tests/src/main.cpp"; "85 85 .scratch/15-rite-editor/adr-input.md"
case 8: manual.html hit lines under its heading 104; git show ... manual.html | grep -c -> 513; other 25 files: direct count 152, under their headings 152; wc -c finding.md 879371 (at most 1,000,000)
case 14: checking.md (finding agent message as a stand-in) starts "Files given as hunks", blank, "docs/user/manual.html, 1293416 bytes"; the part copied from finding.md equals finding.md before its rules (cmp: identical); wc -c 880233; rules heading count 1
case 3: rewrite.md (manual.html as hunks, save_container.h whole) headings: 1:The picked findings, 4:File docs/user/manual.html, over 256 KB, given as its diff hunks, 5:lines 1160-1264, 111:lines 1433-1513, 193:lines 1827-1907, 276:File src/engine/save/include/save/save_container.h, 454:## Rules of a comment, 466:## 0. Hard rules, 477:## A. Vocabulary, 485:## B. Punctuation, 492:## C. Throat-clearing and meta-commentary, 500:## E. Sentence shapes, 511:## Rewrite agent; wc -c 144830; rules heading count 1

Commands the round's report quotes as evidence, rerun: the character-set check -> exit 0; python3 frontmatter -> `code-comments 1.0.0 939`; ADR `grep -c '^@@'` -> 1 and numstat `1 1`; the BEFORE/AFTER heading counts (above: 0/1 before, 1/1/1 after); the grep for the stale phrases -> exit 1 (nothing); `wc -l` -> 376; the description before/after text -> equal to the base and to the file. The report's byte counts for checking.md (880266) and rewrite.md (144874) rest on its stand-in text for the typed pieces; mine are 880233 and 144830, and no decision rests on them.
Scratch folders removed: `ls "$TMPDIR" | grep -i 'refute-1a\|code-comments\|ge-r1\|r1-added\|r1-base'` printed nothing, exit 1.
```

### Verdicts

Round rulings:
- ST1 (line break before the rules piece): closed. SKILL.md "The prompt file" has `printf '\n' >> <out>` before the rules awk lines (SKILL.md:220) and before the `checking.md` copy (SKILL.md:237), and the sentence at SKILL.md:159 states the rule. My rebuild gives heading count 1 in `finding.md`, `checking.md` and `rewrite.md`, the last file's last line stands alone, and the same input with the pre-round commands gives 0 in `rewrite.md`. No check was removed. No other piece follows text without a line break; the typed text is the first piece and nothing precedes it (see finding 1).
- ST2 (sentence length): closed for the two places the ruling names. ADR 0014's Decision is now three short sentences before the agent's sentence, so "or as its diff hunks" attaches to the files, and the ADR still differs from the base by its one Decision line (numstat 1/1). SKILL.md:10 is three sentences of 27, 27 and 30 words, the first two being the split clause. The ruling's requirement to name each sentence over 20 words that stays is only partly met (finding 2).
- B1 (description bullet): closed. "Every host- or user-visible change" has the `description` bullet; its before (756 characters) and after (939) texts equal the base's and the file's description.
- Fixes that reach beyond the findings: the round also split sentences in the description, "What it reads" 4 (the clause "since their one hunk is the whole file" is dropped), Steps 3's hunk bullet (now two bullets), `<ends>`, "Writing the typed text" and the Checking agent's opening-line bullet (now two bullets). The report's ruling 2 section lists them. Each keeps the meaning (change standard rule 17) and serves ST2's "under about 20 words". I take them as the same finding's work and raise no finding.
- Closure claims my rerun does not reproduce: none.

Items of "What to build" (whole diff since the base):
- 1: holds. Steps 5 (SKILL.md:76-77) makes the folder after Steps 4 with `mktemp -d "${TMPDIR:-/tmp}/code-comments-prompt.XXXXXX"`; "The rewrite" 4 (SKILL.md:106-107) makes its own beside the scratch folder.
- 2: holds. "What it reads" 4 (SKILL.md:50), Steps 3 (SKILL.md:72, "no file's text has been read"), Steps 5.
- 3: holds. Every piece is a command appending with `>>`, and now every piece except the first typed text starts with a line break; ST1 is closed.
- 4: holds. Steps 3 (SKILL.md:69-70), `<hunks>` (SKILL.md:157), the hunk loop (SKILL.md:196-201); added and untracked files whole (SKILL.md:47). Cases 6 and 9 to 13 hold, and the hunk branch and the untracked file ran in my scratch repository.
- 5: holds. SKILL.md:305-306 and the list piece (SKILL.md:226-232).
- 6: holds. SKILL.md:161-171, Steps 6, Steps 7 and "The rewrite" 5 point at them.
- 7: holds. Five one-rule bullets in "Finding agent" (SKILL.md:286-290) and "Checking agent" (SKILL.md:312-316); SKILL.md:280-282 say "the prompt file"; "Rewrite agent" SKILL.md:323-324.
- 8: holds. Steps 6 (SKILL.md:87), Steps 8 (SKILL.md:93), "The rewrite" 5 (SKILL.md:118-119) and 8 (SKILL.md:137, 143), first Stops row (SKILL.md:338).
- 9: holds. Description, opening paragraph, "What it reads" 4, Steps 3, 5 and 8, Rules (SKILL.md:363-372), Anti-patterns row (SKILL.md:354). The grep for the stale phrases prints nothing.
- 10: holds. One Decision line changed; the new sentences say what the item says; no dated note; title and other sections unchanged.

Cases (whole diff since the base):
- 1: met. No piece of Steps 6, 7 or "The rewrite" 5 is typed except the two named typed texts; no step reads file text into the session.
- 2: met. One bullet per ban in both agents' bullet lists, and no "given in the prompt" wording remains.
- 3: met. Rerun above, with the bullets at SKILL.md:323-324.
- 4: met. Folder made after Steps 4 and after "The rewrite" 3; removed at Steps 8, on the stop of Steps 6 (reached from Steps 7), at "The rewrite" 8 and at the stop of "The rewrite" 5.
- 5: met. SKILL.md:107 and a separate `mktemp -d`.
- 6: met. Rerun above.
- 7: met. Rerun above.
- 8: met. Rerun above.
- 9: met, unchanged by the round, verdict kept after reading Steps 3's "over 262144 bytes" and the `<hunks>` text.
- 10: met, unchanged, read in the current text (SKILL.md:196-201 with `--find-renames` and both paths).
- 11: met, unchanged (`d=${d:-1}` for the `@@ -1 +1 @@` header, SKILL.md:157, 200).
- 12: met, unchanged (every supplied path single-quoted with `--` or `-e`).
- 13: met. My default-call run gives `File u.c, untracked, added whole` and the file whole.
- 14: met. Rerun above.
- 15: met. `git diff` shows one Decision line changed.

### Findings

No finding makes a verdict violated, partial or unmet. The three below are Standards points for the orchestrator to rule on.

1. Standards (change standard rule 19, "A change leaves no two statements that contradict each other"). Place: skills/code-comments/SKILL.md:159 against :174. Hunk: "Each piece starts with a line break. Its own `printf` writes it, or `printf '\n' >> <out>` before the piece." and "The session writes it with its file-writing tool as the first piece of the prompt file." The typed text is a piece (SKILL.md:251, 258) and the text gives it no line break. The round's rewording dropped the old qualifier "Each `printf` that starts a piece", which had excluded it. Failure scenario: a session that reads the sentence literally begins the typed text with a blank line. This is harmless, but the sentence is false for one piece, and the report notes the exception ("apart from the typed text") while the skill does not. Fix: say "Each piece after the first".
2. Standards (round ruling 2, Verify 7). The ruling asks the report to "name each sentence over 20 words that stays, with why". My count (a code span as one word, as the report counts) finds 15 new or changed sentences of 21 to 23 words that Verify 7 does not name. Examples: SKILL.md:50 (22), :62 (21), :71 (22), :78 (21), :107 (21), :108 (22), :148 (22), :174 (23, a sentence this round created by splitting), :196 (22), :217 (21), :234 (23), :259 (23), :307 (22), :363 (22) and :372 (21). The list covers sentences of 24 words and more, plus a few smaller ones. Failure scenario: the orchestrator reads Verify 7 as the full list of departures and books it as such. All 15 are within "roughly 20" by the prose standard, so this is a report gap and not a text defect. Fix: add the 15 lines, or have the orchestrator rule that "about 20" excludes 21 to 23.
3. Standards (prose standard, sections 0 "No repeated construction" and E "Stop-start fragments"; a judgment). Place: the ADR 0014 Decision. Hunk: "The session writes a prompt file with shell commands. It holds the diff and the rules. It holds each changed file whole, or as its diff hunks with 40 lines on either side when the file is over 256 KB." Two adjacent sentences open with "It holds" and state one idea (what the file holds). The first refuter proposed one sentence of about 35 words. The ruling asked for "under about 20 words where the mechanism allows", and the sentence the builder kept is 24 words. Failure scenario: a reader of the ADR sees the same shape twice in a row, and the ADR does not say that the checking agent reads its own prompt file. Low severity; it stays or changes at the orchestrator's reading.

### Declined to judge

- Whether an agent reads the 879,371-byte `finding.md` (and the 880 KB `checking.md`) whole, in parts, and holds it. Not verified. The 406,505-token premise reproduced in the first report, but the file's token count was not measured, and starting an agent is not allowed to this review. Step 2's gate run will settle it.
- Outside this step: game-engine at `a0aa831` tracks no `.agents/plan.yaml`, so `/code-comments` in a fresh clone stops at "No plan configuration" until that file is copied in, and its `standards` key names no prose standard. This bears on step 2's setup. I did not recheck it this round.

Reviewer usage: a8e96a35d67f32122, claude-sonnet-5-5, 185170 tokens, 43 tool uses, 6m 28s.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- ST1 (first run, the line break before the rules piece): closed in the round, `skills/code-comments/SKILL.md`, "The prompt file", `printf '\n' >> <out>` before the rules piece and the copy for `checking.md`; the run over round 1 rebuilt the input and printed `grep -c '^## Rules of a comment$'` 1 in `finding.md`, `checking.md` and `rewrite.md`.
- ST2 (first run, sentence length): closed in the round, ADR 0014's Decision and `SKILL.md`'s opening paragraph split; the run over round 1 found the clause attaching to the files and the ADR differing by its Decision line only.
- B1 (first run, the description change): closed in the round, the report's "Every host- or user-visible change" bullet with the description before and after, checked equal to the base and the file by the run over round 1.
- Round 1, finding 1 (the sentence "Each piece starts with a line break." is false for the typed text, the first piece): fixed at landing, `SKILL.md`, "The prompt file", the sentence made "Each piece after the first starts with a line break."
- Round 1, finding 2 (Verify 7 names no sentence of 21 to 23 words): closed with no change, by reading: the prose standard, section E, "Sentence length", says "under roughly 20 words unless the mechanism needs more", and a sentence of 21 to 23 words is within "roughly 20", so it is no departure the brief's Verify 7 asks to name.
- Round 1, finding 3 (two sentences of ADR 0014's Decision open with "It holds"): fixed at landing, ADR 0014's Decision, the two sentences joined as "It holds the diff, the rules and each changed file, whole or, when the file is over 256 KB, as its diff hunks with 40 lines on either side."
