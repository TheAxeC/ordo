# Step 4 brief check (on main at cfb53f6)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/4.md`. A page this report cites is named with its section. A line of code or a hit of a grep keeps its `file:line`. Nothing was written, and no git command that changes state was run. `git rev-parse HEAD` printed `cfb53f6c657a5f58053332a77c604c1927b6f983`; `git status --short` printed ` M .scratch/19-codebase-design/orchestrator-state.md`, `?? .scratch/19-codebase-design/agents/briefs/4.md`, `?? .scratch/19-codebase-design/agents/briefs/5.md`.

Findings are numbered F1 to F17 across the sections. The ones that would make the builder guess or build two rules that contradict each other are F4, F6, F7, F8, F9 and F14.

## 1. Names

- `repo-setup` inside the skill, changed to `ordo-init` (item 16): `grep -n 'repo-setup' skills/code/codebase-design/SKILL.md` prints lines 24, 31, 35, 42, 49, 74, 109, 171 and 179. All are inside the paths. Lines 109 and 171 are "Steps / review" 1 and 12, and line 179 is the Stops row for either mode (see F1). Hits of `repo-setup` outside the paths (`README.md`, `docs/`, the other skills) belong to step 5, and step 4 makes none of them false.
- The refusal "No repo-setup folder", changed to "No ordo-init folder": `grep -rn 'No repo-setup folder\|No ordo-init folder' .` prints `skills/code/codebase-design/SKILL.md:35` and `:179` (inside the paths), and `.scratch/19-codebase-design/agents/reviews/1-report.md:22` and `:62`, which are records of step 1 and stay.
- The stop "The user interface", whose condition item 10 changes: `grep -o 'Either mode asks[^<]*' docs/figures/codebase-design.svg` prints `Either mode asks once whether the repository has a user interface, unless it uses`, and `sed -n '2055,2100p' docs/figures/gen_figures.py` shows the note at `docs/figures/gen_figures.py:2091`: "Either mode asks once whether the repository has a user interface, unless it uses Svelte or SvelteKit." Item 10 adds a second case in which the question is not asked (a page of the repository holds a UI standard), so the note becomes false. The brief says the step changes nothing in `docs/figures/gen_figures.py` or the figure, and step 5 writes `gen_figures.py` and `pipeline.svg` only.
- The stop "The draft", whose content changes: `grep -n 'The draft' README.md` prints `README.md:90`, the figure's alternative text ("The standards mode: The draft, a stop; The end: the additions you approved, written"), and the box in `docs/figures/gen_figures.py:2061`. Both stay true. `README.md:30` is inside the paths.
- The sentence "a missing rule is drafted in the form it takes there and written after the user's approval": it stands in `docs/adr/0047-...md`, Decision, and as "each rule stated in the concrete form it takes there" in `docs/roadmap.md:26` (entry 19's goal). The roadmap sentence stays true. The ADR sentence is treated under check 7 (F14).
- The quick start line of the skill (`skills/code/codebase-design/SKILL.md:15`, "each rule the pages lack, drafted in the form it takes here, written after approval") and the first paragraph under the title are sentences about the mode as a whole. They are inside the paths, and no item of "What to build" names them; the change standard's rule 14 asks that they be reread.
- `standards-audit-<timestamp>.md` and "audit file": `grep -rn 'standards-audit\|audit file' .` outside `.scratch/` prints nothing. No hit outside the paths.
- "group" as a term: `grep -n -i 'group' docs/glossary.md` prints lines 25, 58, 102 and 159, all the verb "grouped" or "groups", and no entry. `README.md:36` uses "group folders" for the folders under `skills/`. That is a different page, and the change does not make it false.
- The README row: `grep -n '^| .codebase-design. |' README.md` prints line 30 only, inside the paths.

Findings:

- F1. The brief's closing sentence of "What to build" says "The step changes nothing in the `review` mode", and items 9, 10 and 16 change text the review mode reads or holds. Item 16 with verify 3 (`grep -c` prints 0) forces changes at `SKILL.md:109`, `:171` and `:179`. Items 9 and 10 rewrite "What it reads" 5 and 6, which "Steps / review" 4 reads ("with the languages and the answer on the user interface of 'What it reads' 5 and 6"). The builder cannot meet both. The brief has to say which review-mode text changes (the names; and whether the review mode also leaves out vendored folders and skips the question when a page holds a UI standard).
- F2. The note of the figure (`docs/figures/gen_figures.py:2091` and `docs/figures/codebase-design.svg`) becomes false under item 10, and the brief forbids changing both files. Either the note is in this step's paths with the figure regenerated, or item 10 is worded so that the note still holds.
- F3. The Stops row "The user interface" (`SKILL.md:180`: "Either mode, when the repository uses neither Svelte nor SvelteKit") becomes false under item 10. Item 18 names only the row "The draft" and the Anti-patterns table. The row should be named in item 10 or 18.

## 2. The step line

- "`/codebase-design standards` shows its draft in the five groups and the forms of the ruling 'The standards stop'": items 1 and 3.
- "with the rules found present in a file beside it": item 5, and the last bullet of item 3.
- "has a rule for a default rule the code does not follow": item 1 (group 4) and item 3 (group 4).
- "for a default rule about a tool the repository lacks": item 1 (group 5) and item 3 (group 5).
- "for a default rule that contradicts a rule of the repository": item 1 (group 1) and item 3 (group 1).
- "it names `ordo-init`'s folder as the place of the default pages": item 16.
- "check: the skill's text read against the ruling and the skill layout": verify 6 and the report's DONE / NOT DONE table per item; the reading against the ruling is the reviewer's.
- "the verify list passes on main": verify 1, "The plan's whole verify list runs once, at landing on main."
- The ruling's sentences, each mapped: "keeps the whole comparison" is items 1 and 5; "No line of the stop locates a rule by a line number alone" is item 4; "one sentence in the stop, their list kept in a file the user is not asked to open" is items 3 and 5.

Findings:

- none for a part with no requirement.
- F4. Three requirements go beyond the ruling and are not listed under "Decisions taken in this brief", which says "none silent". (a) The ruling's second group is "the rules of the Ordo template that the page lacks, named in one line"; item 1 narrows it to rules "whose following cannot be read from the repository's code", and item 3 makes it "one line per default page". (b) Item 4's "The stop does not show where an addition will be placed" is not in the ruling, which forbids only a line number alone. (c) Item 13 counts a rule on a page `plan.yaml` does not name as missing.

## 3. Premises

- 208 lines and seven sections: `wc -l skills/code/codebase-design/SKILL.md` prints 208; `grep -n '^## ' skills/code/codebase-design/SKILL.md` prints Quick start (12), Use instead (20), What it reads (28), Steps (60), Stops (175), Anti-patterns (188), Rules (201). Matches. "Steps / standards" has items 1 to 8 (`SKILL.md:74` to `:105`). Matches.
- "Steps / standards" 7: `grep -n 'Show the whole draft' -A6 skills/code/codebase-design/SKILL.md` prints lines 97 to 103, with "It shows each addition with the file and the place it goes to." and "It shows each default rule found already present, with where it stands." Matches.
- "names the `repo-setup` skill 9 times": `grep -c 'repo-setup' skills/code/codebase-design/SKILL.md` prints 9. That is 9 lines; `grep -o 'repo-setup' ... | wc -l` prints 11 occurrences. The two cited sections are at `SKILL.md:42` ("The tree") and `:49` ("What it reads" 3). Matches as a line count.
- Step 5 and the folder: `ls skills/ordo/ordo-init/templates/docs/dev` prints "No such file or directory"; `ls skills/ordo/ordo-init/templates/` prints `check_config.py` and `check_config.test.sh`; the default pages stand under `skills/ordo/repo-setup/templates/docs/dev/`. Brief 5, "What to build" 4, says "`skills/code/codebase-design/` is not touched". Matches.
- The first real run (288 lines, 12 additions, 74 rows, 11 rows, 16 questions, 71 line references, 15 places): the brief gives no command. `grep -rn '288\|71 line\|16 questions\|15 places' .scratch/19-codebase-design --include='*.md'` prints nothing outside the brief. Not verified.
- ADR 0047: the file's line 3 reads "Status: proposed", as every record in the folder does. Its Decision reads "the `standards` mode adds and rewrites nothing that exists: a rule of a default page that already stands in the repository's pages, wherever it stands, is left as written, and a missing rule is drafted in the form it takes there and written after the user's approval".
- ADR 0035 and ADR 0014: read. 0014 decides for `/code-comments` and 0035 for `paper` and `writing`.
- The README row: `grep -n '^| .codebase-design. |' README.md` prints line 30. Matches.

Findings:

- F5. The two quotes the brief gives as ADR 0047's are not its words. "The `standards` mode adds, and rewrites nothing that exists" is the skill's Rules bullet (`SKILL.md:204`); "a rule of the default page already in the repository's pages, wherever it stands, is left as written, and a missing rule is drafted in the form it takes there" is ruling D15 of `plan.md`. The ADR's sentence is quoted above. The meaning is the same.
- F6 (minor). "ADR 0035 and ADR 0014 govern how the skill's agents start" does not hold: neither names `codebase-design`. The step changes no agent start, so nothing rests on it.
- The first-run numbers have no source in the ledger (see "Declined to judge").

## 4. Cases and checks

- Case 1: consistent. `grep -n '^[0-9]*\. \*\*' skills/ordo/repo-setup/templates/docs/dev/change-standard.md` prints rules 1 to 21, and rules 17 to 21 are rules on how work is done.
- Case 2: inconsistent with item 2 and case 4 (F7).
- Case 3: ambiguous against item 1's group 5 (F7) and against case 7 (F8).
- Case 4: the expected result says "the default rules that name those tools appear together in the one line"; item 3 says the line holds "the tools named". The two differ on what the line names.
- Case 5: consistent. The default's rule 6 reads "Before landing, verification runs the checks of the files the step changes."
- Case 6: consistent with items 3 and 5. Its count, 74, is the count the brief gives for the first real run (F10).
- Case 7: consistent with item 11; see F8 for its meeting with case 3.
- Case 8: consistent with item 12 and ruling D14.
- Case 9: consistent with item 10.
- Case 10: consistent with item 15, except where group 5 is not empty (F9).
- Case 11: consistent with item 4 and the ruling.
- Case 12: consistent with item 16 and verify 3.
- No case asks the builder to check a place the step does not change: every case reads `skills/code/codebase-design/SKILL.md`.

Findings:

- F7. Group 5 as item 1 defines it ("a rule that names a tool ... for which the tree holds no configuration") overlaps groups 3 and 4, and item 1 asks for exactly one kind per rule. `skills/ordo/repo-setup/templates/docs/dev/coding-standards/cpp.md:8` is one bullet: "clang-format formats every source file from a `.clang-format` in the repository. It sets a 4-space indent, braces on the same line, left-aligned pointers (`T* p`) and a column limit of <120>." By item 2 it is one rule. Case 4 (no `.clang-format`) puts it in group 5, and case 2 expects the pointer part as a line of group 3; the report must show the stop for cases 1 to 6 together. The same holds for `python.md:21` ("Every function and method annotates each parameter and its return type. ruff's `ANN` rules fail a missing annotation."), which case 3 expects in group 4 and which names ruff, and for `cpp.md:61`. Item 8 (a pointer at something the repository lacks is dropped) points the other way from group 5's definition. The brief needs the order in which the kinds are tried, and what happens to a default bullet that holds a rule the code shows and the name of a tool the repository lacks.
- F8. Items 1 and 11 do not say how the groups apply to a new page. Item 11 and case 7 draft a lacking language page whole. Item 1 sorts every rule of every default page that applies into the six kinds. In a Python repository with no Python page and 0 of 558 annotated functions, the annotation rule is either inside the whole new page (case 7) or a line of group 4 that is not added unless named (case 3).
- F9. Item 15 says that with nothing in groups 1 to 4 and no new page, the skill says "the repository's pages hold every default rule that applies". With rules in group 5 that sentence is false. Item 1 also leaves open a rule that the code could show and that applies in no place ("0 of 0" is neither more than half nor a rule the code breaks).
- F10. The cases are said to be made up, and case 6's 74 equals the first real run's "74 table rows of rules found present". Whether 5,415 of 5,432 and 0 of 558 come from that run is not verified. `CLAUDE.md`, "A shipped file names nothing private", bars a fact that can be sourced only from a private file from a shipped file. The brief should say that no number of the cases goes into the skill's text, or change the numbers.
- F11. Item 3 numbers the lines of group 3 and of group 4, and the user strikes or names "its number". The brief does not say that the numbers run on across the two groups; with each group starting at 1, "2" names two rules.
- F12. Item 6 puts a question "with the rule it belongs to", and item 3 gives group 2 one line per page and group 3 one line per rule, "and nothing else of the comparison". Where a question of a rule in group 2 or 3 stands is not said. The default change standard holds placeholders in rule 14 and in "Read before changing anything" 2.
- F13. "What it must do" says the mode "shows its draft before anything is written", and item 5 writes the audit file before the stop, since the stop gives its path. The "Decisions" section says "writes nothing into the repository before the approval". The first bullet of "What it must do", `SKILL.md:97` and the Stops row (`:181`, "before anything is written") need the same limit.
- Item 9 needs the file extensions of each language, which stand in `skills/ordo/repo-setup/SKILL.md`, "What it reads" 3 (line 32), and the brief's "Read" list does not name that file. The list also leaves out `typescript.md` and `ui-standard.md` of the default pages.

## 5. The question

"The goal" is the part of the plan's goal step 4 delivers: the `standards` mode states each rule in the form it takes in the repository, and its stop is one a person can answer, in the forms of the ruling "The standards stop".

- The step line's check (the text read against the ruling and the skill layout; the verify list on main): no, for the skill's text, since a reader holds each form of the ruling against the text. Whether a run produces such a stop is step 2's second `standards` run. `plan.md`, "Gate", holds a line of this question for the gate, step 1 and step 2, and none for steps 4 and 5.
- Cases 1 to 10: no. Each is read on the text, and passes only when the text states the rule that gives the expected result. Cases 2, 3, 4 and 7 cannot be read to one result until F7 and F8 are closed.
- Case 11: no, read over every form the stop can take.
- Case 12: the grep alone, yes: it prints 0 when the name is removed and the wrong folder is named. With its second clause, read, no.
- Items 1 to 15 and 18: checked by reading only, in the DONE / NOT DONE table. No, as far as each item states one rule; items 1, 3, 6, 11 and 15 can be marked done on a text that still gives two results for one repository (F7, F8, F9, F11, F12).
- Item 16: verify 3 with case 12, no.
- Item 17: yes. Verify 2 and verify 5 pass on the unchanged tree (`python3 -c ...` prints `codebase-design 1020`; the grep prints 1), and "in the row's present length or shorter" has no command. `awk 'NR==30{print length($0)}' README.md` prints 1161 now.
- Verify 1, 2 and 4: yes, each passes on the unchanged tree (run here: verify 1 printed nothing and "exit status 0"). They are checks of facts and prove no item.
- Verify 3 and verify 5's second half: no for the fact each states.
- Verify 6: no, a reading.

Findings:

- F7, F8, F9, F11 and F12 above are the ways an item can be marked done without the stop being one result a person can answer.
- Item 17 lacks the command for the row's length. The description stands at 1,020 of 1,024 characters, so the new words need others cut, and the brief does not say which may go; `docs/dev/skill-layout.md`, "Frontmatter", keeps the triggers.
- The plan has no line of the question for step 4.

## 6. Implied inputs

- Not a code step. The step changes a skill's text and one README row, and no script.

Findings: none.

## 7. ADRs

Read: line 3 (status) and the Decision of each of the 46 records in `docs/adr/` (`ls docs/adr/0*.md | wc -l` prints 46; there is no 0015). The Decisions of 0001 to 0027, 0030, 0035 and 0044 to 0047 were read whole; of 0028, 0029, 0031 to 0034 and 0036 to 0043, all on `paper`, the opening of each Decision was read, and a grep of them for `standards page`, `default page`, `skill layout`, `codebase`, `repo-setup`, `ordo-init` printed one line, on `paper`.

- 0047, status proposed: touches the step. Named in the brief. The sentences the step is under: "the `standards` mode adds and rewrites nothing that exists: a rule of a default page that already stands in the repository's pages, wherever it stands, is left as written, and a missing rule is drafted in the form it takes there and written after the user's approval", and "The skill reads no standards page from a path outside the repository it runs in and its own skills folder." The audit file is written outside the repository and read from nowhere, so the second sentence holds.
- 0001, 0014, 0026 and 0030: each names the `repo-setup` folder as the place of the default prose standard, for `writing`, `code-comments` and `paper`. Step 4 changes none of those skills; the wording is step 5's.
- 0014 and 0035: named in the brief; they decide for other skills (F6).
- 0012 (every commit names its paths): not touched, the mode makes no commit.
- Every other record: does not touch the step.

Findings:

- F14. The brief says of ADR 0047's two sentences "This step keeps both" and "this step leaves the record alone". The second sentence, "a missing rule is drafted in the form it takes there and written after the user's approval", no longer describes the mode in three places: a rule of group 5 is never drafted or offered; a rule of group 4 is shown "in a few words" and written only when named; and under item 13 a rule that stands in the repository on a page `plan.yaml` does not name is counted as missing, against "wherever it stands". The ruling "The standards stop" decides the first two. `docs/adr/README.md` says a refinement that keeps the decision edits the ADR to its current state, and the change standard's rule 5 asks for the ADR in the same step. ADR 0047 is in step 5's paths, for the folder's name only. This is the orchestrator's to settle: which step writes the refinement, or a stop.
- No ADR the step touches is left unnamed.

## 8. Dictated text

- "No ordo-init folder": `grep -n 'No ordo-init folder' .scratch/19-codebase-design/agents/briefs/4.md` prints line 52. Holds.
- `standards-audit-<timestamp>.md`: `grep -n 'standards-audit' ...briefs/4.md` prints line 41. Holds; it follows the form of `architecture-review-<timestamp>.html` in "Steps / review" 8.
- "<n> of <m>": `grep -n '<n> of <m>' ...briefs/4.md` prints line 35. Holds.
- `/ordo-init` in the "Use instead" row: `grep -n '/ordo-init' ...briefs/4.md` prints line 52. Holds (`docs/dev/skill-layout.md`, "Paths and names").
- The names "present" and "group 1" to "group 5" with their labels: `grep -n 'group [1-5],' ...briefs/4.md` finds lines 23 to 26 and 34 to 37. They hold, with F7 on group 5's definition.
- "six kinds" (line 20): breaks `docs/dev/skill-layout.md`, "Writing for an agent", third bullet, if carried into the skill: `docs/glossary.md` defines "kind" as the sentence under which `/plan-retro` groups findings, and "kind, of an open item". The brief's "Conventions" keep "group" for the five groups, so the six need a word that is not a glossary term, and the brief gives none.
- "A pointer binds to its type: `T* p`, never `T *p`. 5,415 of 5,432 declarations." (line 63): an expected line of a stop, not text for a file. It holds against the prose standard. If it goes into the skill as an example it must say that it is made up (`CLAUDE.md`, "A shipped file names nothing private"), and F10 applies to its numbers.

Findings:

- F15. "kinds" for the six sorts of item 1, as above.
- F16. The example line of case 2 and the counts of cases 2, 3 and 6, if carried into the skill, fall under F10.

## Declined to judge

- The first real run's numbers and its list of 15 places: no file of the ledger holds them, and the run's repository is private. Not verified.
- Whether "more than half" is the right line between groups 3 and 4, and whether the stop should hide where an addition goes: the user's, both stated here as decisions of the brief (the second not listed, F4).
- Case 5's outcome when the user chooses the default's rule: the mode then writes a rule that contradicts one the repository keeps, and says that the rewrite is the user's. This follows from ADR 0047 and the ruling; whether it is wanted is the user's.
- The landing order of steps 4 and 5: if step 4 lands first, main holds a skill that names `templates/docs/dev/` of the `ordo-init` folder while `ls skills/ordo/ordo-init/templates/docs/dev` still fails. No command of the verify list reads that. The orchestrator's.
- F17 (not a finding of a check): the refusal "No ordo-init folder" fires when the folder is missing; an `ordo-init` folder without `templates/docs/dev/` is a state the refusal's condition does not name. Whether that state can occur at a pin is not something a read settles.
- `metadata.version` staying at `"1.0.0"`: consistent with `docs/dev/skill-layout.md`, "Frontmatter" ("raises one part ... once" per plan, and this plan created the skill at that version); whether a release candidate counts as a release is the user's.

Agent usage: a3a640202fd2b636a, claude-fable-5-2, 171187 tokens, 27 tool uses, 5.7 minutes.

## Closed

- F1: "What to build", the closing paragraph now says items 9 and 10 change "What it reads" 5 and 6 for both modes, and item 16 names the lines of "Steps / review" and the Stops table.
- F2: item 20 added; the figure's note and the figure are in "Paths this step writes".
- F3: item 18 names the row "The user interface".
- F4: the three choices are listed under "Decisions taken in this brief".
- F5, F6: the ADR 0047 quote is the record's own sentence; the line on ADRs 0035 and 0014 is removed.
- F7: item 1 gives the order and splits a bullet that names a lacking tool; case 4 rewritten.
- F8: item 3 says how the groups apply to a new page; item 11 and case 7 follow.
- F9: item 15 names the tools of group 5; item 1 leaves out a rule that applies in no place.
- F10, F16: the cases' numbers are changed and said to be made up, and a number in the skill's text says it is made up.
- F11: the numbers run on through groups 3 and 4 (item 3).
- F12: a question stands under the line of its rule's group (item 6).
- F13: "into the repository" added in "What it must do" and item 18.
- The Read list names the `repo-setup` skill's "What it reads" 3, `typescript.md` and `ui-standard.md`; item 17 has the command for the row's length.
- F14: item 19 added; ADR 0047 is written by this step alone and removed from step 5's paths.
- F15: item 1 no longer says "kinds" and bars the word.
- F17 and the landing order: step 5 lands before step 4, the orchestrator's.
