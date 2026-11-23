# Refuter report: step 4 of plan 19-codebase-design

Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4, base 7219d6c. Nothing was changed. The figure script was not executed as a writer: its bodies were computed in memory and compared with the files (see check 5).

Result in one line: the verify checks pass and the stop's form matches the ruling for the made-up repository, but the sorting text of Steps / standards 5 leaves a session guessing in three places (F1, F2, F5), the rules for a new page contradict the rules for groups 2 and 3 (F3), and the stop is not short in a repository that lacks the prose standard or a language page (F4).

## The brief's "Verify before you report", as printed

1. Character-set check over the five files: printed no line, then `exit status 0`.
2. `codebase-design 1019`
3. `0`
4. `12:## Quick start`, `20:## Use instead`, `28:## What it reads`, `65:## Steps`, `268:## Stops`, `281:## Anti-patterns`, `295:## Rules`
5. `grep -c '^| .codebase-design. |' README.md` printed `1`. `git diff 7219d6c --stat` listed `README.md`, the ADR 0047 file, `docs/figures/codebase-design.svg`, `docs/figures/gen_figures.py`, `skills/code/codebase-design/SKILL.md`, "5 files changed, 149 insertions(+), 54 deletions(-)". `awk 'NR==30{print length($0)}' README.md` printed `1161`. `git status --short docs/figures` printed ` M docs/figures/codebase-design.svg` and ` M docs/figures/gen_figures.py`. `python3 docs/figures/gen_figures.py` was not run, since it rewrites 23 files and I may write nothing; instead `python3 -B -c` imported the module and compared each body of `figures()` with its file: all 23 printed `same`, `codebase-design.svg` among them. The script's exit status is therefore not verified by a run.
6. Read by me; results are under Standards below.

## The builder's quoted evidence, rerun

- `grep -n -i 'kind' skills/code/codebase-design/SKILL.md`: prints nothing. Reproduced.
- `grep -n -i '\bgroup\b' docs/glossary.md`: prints nothing. Reproduced.
- `grep -c 'repo-setup' docs/adr/0047-*.md`: `0`. Reproduced.
- Line counts (`wc -l`): SKILL.md 302, README.md 260, ADR 38, gen_figures.py 2362, svg 55. Reproduced. `git diff 7219d6c --numstat`: 136/42, 1/1, 5/5, 3/2, 4/4. Reproduced.
- The example block: lines 157 to 184, `wc -l` prints 28. Reproduced.
- "The eleven lines that name `ordo-init`": `grep -n 'ordo-init' SKILL.md | wc -l` prints 12 (P1).
- "Steps / standards 10, the bullet on group 1, is one sentence of 46 words": `wc -w` on line 139 without its bullet mark prints 35 (P2).
- The report copy in the worktree and the one in the main ledger: `cmp` prints nothing, identical.

## Verdict per item of "What to build"

1. Violated in part. The six definitions and the order stand in Steps / standards 5, and `kind` is not used. They do not let a session tell every rule apart: F1 (a rule that differs without being incompatible), F2 (a requirement in the same sentence as a tool), F5 (a rule that is a paragraph).
2. Holds. Steps / standards 5: "One rule is one numbered item or one bullet of a default page" and the bullet "A default rule that holds more than the repository's rule on the same requirement is present". See F5 for what the definition leaves out, which the brief's wording causes.
3. Violated in part. The order and the forms of groups 1 to 5, the sentence on the count and the audit path stand in Steps / standards 10. The rules of a new page of groups 2 and 3 are not answered consistently: F3.
4. Holds. Steps / standards 10: "A place is named by its page and its section in words. A line number may follow that name and never stands alone." and "No line says where an addition will be placed."; the place is in Steps / standards 8 and 11.
5. Holds. Steps / standards 8, all five contents, "The user is not asked to open it."
6. Holds. Steps / standards 6 ("stays a question: one plain sentence that says what is not known and what each answer would write") and 10 ("A question stands directly under the line of its rule, or under the new page that holds its rule"). For a rule of group 2 the line is the line of its default page; the text does not say so, and I judge a session reads it that way.
7. Holds. Steps / standards 5, third bullet.
8. Holds. Steps / standards 6, the bullets on a pointer and on an example.
9. Holds. "What it reads" 5. The extensions equal those of `skills/ordo/repo-setup/SKILL.md` line 32 (`grep -n '\.cpp' ...`). `ledger_root` and `archive_root` are keys of `skills/orchestration/plan/templates/plan.yaml` lines 8 and 9.
10. Holds. "What it reads" 6, Steps / standards 4 after 3, the Stops row "The user interface".
11. Holds for the `standards` mode. The definition was placed in "What it reads" 4, which `review` reads too: B1.
12. Holds. Steps / standards 7, the two bullets on a new page; the two contradicting sentences of the base are gone.
13. Holds. Steps / standards 3 and 10. The sentence of 10 has no "when there are any": F7 (low).
14. Holds. Steps / standards 11.
15. Holds. Steps / standards 9.
16. Holds. Check 3 prints 0; the lines of Steps / review 1 and 12 and the Stops row name `ordo-init`. One sentence that was already there still cites a section of it: F8 (low).
17. Holds. 1019 characters; the trigger list equals the base's; README row 1161.
18. Holds. Stops rows "The draft" and "The user interface", the new Anti-patterns row, the title paragraph, the Quick start line, "before anything is written into the repository".
19. Holds. The Decision's bullet states the four cases; the five `repo-setup` mentions read `ordo-init`; no dated note. Two Context and Consequences sentences are true only once step 5 has landed (see Declined to judge).
20. Holds. The note in `codebase_design` and the four `<text>` lines of the svg say the same; in-memory body equals the file.

## Verdict per case, by reading the text as it stands

1. Met. The five rules lack and cannot be read from code: group 2. Steps / standards 10 gives one line for the default change standard that names them by title, one yes or no.
2. Met. More than half: group 3; "one numbered line per rule: the rule in the words it would be added in, then its count as "<n> of <m>""; Steps / standards 11 adds it unless struck.
3. Met. 3 of 240 is half or fewer: group 4, one numbered line with what adopting breaks and the count; added only when named.
4. Partial (F2). The line of group 5 names the tools and none of their rules is added. Whether the pointer requirement is sorted on its own depends on a guess: in the shipped default page it stands in the sentence "It sets a 4-space indent, braces on the same line, left-aligned pointers (`T* p`) and a column limit of <120>." of the clang-format bullet.
5. Met for the case as the brief words it ("only the checks of the changed files"), since the two cannot both be followed. The skill's own example of this case quotes a default sentence that can be followed together with the repository's: F6.
6. Met. One sentence with the count and the path; no row of present rules in the stop.
7. Met for the sorting: the two size limits do not make the page present ("What it reads" 4), the page is new, holds groups 2 and 3, and the annotation rule is a line of group 4. How the user answers on the page's rules is F3.
8. Met. Steps / standards 7: the page "stands beside those pages, under the file name of its fixed name", so `docs/dev/standards/<name>.md`, and is added to the `standards` list.
9. Met. Step 4 follows step 3; "What it reads" 6 asks once.
10. Met. Steps / standards 9.
11. Met, with one remark: a change to `plan.yaml` shown in the stop names the new page's path, which the brief's item 3 itself asks for; in a repository without a `plan.yaml` no rule of the text shows the path of a new page.
12. Partial (F8). The grep prints 0. Line 279, unchanged from the base, reads "The skills that `review` invokes, `/ordo-init`, `/roadmap add` and `/grill`, stop as their own Stops tables say.", which cites a section of the `ordo-init` skill.

## Findings

### Spec

F1. A default rule that differs from the repository's rule and can be followed together with it fits none of the six. Place: SKILL.md, Steps / standards 5, lines 96 to 100. Text: "Present: the repository's pages hold a rule that asks the same on the same requirement", "Group 1, a contradiction: ... says otherwise, so that the two cannot both be followed", and groups 2 to 4 each open "the pages lack it". The brief's own definitions overlapped; the text made them exclusive and opened a gap. Scenario: the repository says a source file stays under 1,500 lines, the default says under 1,000. The two do not ask the same; both can be followed by keeping to 1,000, so it is no contradiction; the pages do not lack a rule on file size. One session calls it present, a second a contradiction, a third reads line 102 ("A default rule that holds more than the repository's rule ... is present") as covering it. The user either never hears of the stricter default or is asked to choose, depending on the session.

F2. The tool rule works by sentence, and the shipped default pages put requirements and tools in one sentence. Place: Steps / standards 5, lines 93, 94 and 101. Text: "A sentence of a rule that names a tool ... is taken out of the rule and goes to group 5." and "What is left of such a rule is sorted on its own, one requirement at a time, where the code shows the requirement without the tool." Evidence from the default pages (`grep -n -i clang skills/ordo/repo-setup/templates/docs/dev/coding-standards/cpp.md`): line 61 "An accessor is `[[nodiscard]]`, and clang-tidy's `modernize-use-nodiscard` warns on one without it." is one sentence; line 8's second sentence "It sets a 4-space indent, ... left-aligned pointers (`T* p`) and a column limit of <120>." names no tool, only "It"; line 43 ends with a tool sentence after four naming requirements. Scenario: a session following the text takes the whole sentence of line 61 to group 5, so the `[[nodiscard]]` requirement is never offered although the code shows it without the tool, which is the opposite of what item 1 asks ("only the sentence about the tool goes to group 5"). For line 8 a session must guess whether "It sets ..." names a tool; if it decides yes, the pointer line of case 2 and case 4 never appears. The text also does not say what happens to a requirement left over that the code does not show without the tool.

F3. The rules for a new page contradict the rules for groups 2 and 3. Place: Steps / standards 7 line 121, 10 line 147, 11 lines 191, 192 and 196. Text: "A rule of group 2 or 3 that a new page holds is shown in that page only." against "The rules of group 2 are added on the user's yes.", "A rule of group 3 is added unless the user struck its number." and "A new page and a change to `plan.yaml` are written as shown, or as the user corrected them." Scenario, case 7's repository: the user answers no to the rules on how work is done. The new Python page holds rules of group 2. Line 191 says they are not added; line 196 says the page is written as shown, with them. The session picks one. A rule of group 3 inside the page has no number and no count in the stop, so the user cannot strike it by number and does not see how firmly the code follows it, which the ruling gives every rule of that group ("one line each with its count, added unless the user strikes it"). The builder reports this as judgment call 1; the brief's item 3 can be read either way, so the orchestrator decides the reading, but the contradiction between lines 191 and 196 stands under either.

F4. The stop is not short where a page is new, and the largest case is the prose standard. Place: Steps / standards 7 line 122 and 10 line 146. Text: "The prose standard is copied as it is when the repository has none" and "Each new page follows, shown as it would be written". Scenario: a repository that lacks only the prose standard gets a stop that prints the whole default page, 75 lines (`wc -l`), which the user is asked to read to approve a verbatim copy; a repository lacking a language page gets that whole page printed. The ruling says the stop "is short and not cryptic". The brief's item 3 asks for this form, and the builder names it as judgment call 2 and did not decide it, which is right under rule 4 of the change standard. It is the orchestrator's or the user's to rule: one line for a page copied as it is would end it.

F5. "One rule is one numbered item or one bullet" leaves the default pages' rules that are paragraphs unsorted. Place: Steps / standards 5 line 91. Evidence: the default change standard's section "Commands and their filters" is two paragraphs and a code block with the placeholder `<each verification command from docs/dev/building.md, ...>` (template lines 64 to 70); `design-principles.md` line 16 "A principle that a check of the repository enforces names that check: <the checks>." is a paragraph. Scenario: a repository whose change standard lacks the commands section never gets it offered, or a session decides on its own that a paragraph is a rule; either way it is a guess. The definition is the brief's item 2 taken literally, so this goes to the orchestrator as a gap of the brief, not as a miss of the builder.

F6. The example of a contradiction does not meet the text's own definition. Place: Steps / standards 10, the code block, lines 162 and 163. Text: yours "The builder runs the whole verify list on the whole tree before it reports.", the default "The builder and the reviewer run the checks the brief names for the files the step changes." A builder who runs the whole list has run the checks of the changed files, so the two can both be followed; under line 97 this is no contradiction. The sentence that conflicts is the default's "The plan's whole verify list runs once, at landing on main." Scenario: a session takes the example as the measure and raises every pair of rules that merely differ as a contradiction (the opposite reading of F1); a user reading the stop sees two quotes that do not conflict and cannot tell what the choice changes until the "Under ..." lines. The example also shows that the text does not say whether "the default's rule quoted" means the whole numbered item (rule 6 of the default change standard has nine sentences) or the sentence that conflicts.

F7 (low). Place: Steps / standards 10 line 149: "One sentence names the pages of rules that Steps / standards 3 noted and did not read". Item 13 says "when the repository holds other pages of rules it did not read"; the text has no such condition. Scenario: with no such page a session prints a sentence that says there are none, one more line the user reads for nothing. The same bullet says the pages were "not read", while step 3 can only note that a page "holds rules" by reading it.

F8 (low). Place: Stops, line 279, unchanged from the base: "stop as their own Stops tables say". Case 12 asks that no sentence cite a section of the `ordo-init` skill. The skill layout requires a Stops table in every skill, so step 5's rewrite cannot remove what is cited; the sentence is literally outside the case and harmless.

F9 (low). Place: Steps / standards 10 line 187 against 11 line 195. Text: "Done when the user has answered each choice, the yes or no of group 2 and each question, or has corrected the draft." and "A rule whose question the user left unanswered is not written, and the last message names it." Scenario: the user answers everything but one question. By line 187 the step is not done, so one session asks again; by line 195 another writes the rest and names the rule. Same for a contradiction left without a choice, for which step 11 has no rule at all.

No decision reserved for the user was taken; the builder handed the order of the groups and judgment calls 1 to 3 to the orchestrator. No contradiction of ADR 0047 as it now reads. Every case has its first run in the report.

### Proof

P1. Report, DONE table, item 16: "The eleven lines that name `ordo-init`". `grep -n 'ordo-init' skills/code/codebase-design/SKILL.md | wc -l` prints 12 (lines 24, 31, 35, 79, 202, 255, 256, 264, 272, 279, 299, 300). No decision rests on the count.

P2. Report, check 6: "one sentence of 46 words". `wc -w` on the bullet prints 35. No decision rests on it.

P3. Report, check 5: `gen exit 0` is the builder's run; I did not rerun the writer. The in-memory comparison shows the files equal the script's bodies.

### Standards

S1. Skill layout, "Lists and tables", one rule per bullet. Steps / standards 10 line 152 holds two sentences, "A place is named by its page and its section in words. A line number may follow that name and never stands alone."; the builder names it and the second is a limit on the first, which the layout allows in the same bullet. No finding beyond the note.

S2. Prose standard, B, semicolons at most 2 per 1000 words of running prose. ADR 0047's bullet on the `standards` mode now carries four semicolons (three added); the record is under 1,000 words. The builder names it as a departure with its reason (one bullet per mode, the record's form). Scenario: none for a session; a reader of the record meets one sentence of 86 words. Low.

S3. A sentence the diff leaves false until step 5 lands: ADR 0047 Context, "`paper` reads the prose standard from `docs/dev/prose-standard.md` and then from the `ordo-init` folder beside its own", and Consequences, "as `paper`, `writing` and `code-comments` already do". On this worktree `skills/ordo/ordo-init/templates/` holds only `check_config.py` and its test (`ls`). The brief assigns the record to this step and the move to step 5, so it is true only when both have landed; landing step 4 alone leaves the record and the skill's "What it reads" 2 false and the skill refusing with "No ordo-init folder".

Checked and clean: no non-ASCII in the five files (check 1); no history, date of the work, plan or step number in the skill's text; the example block and the `.py` size-limit example are marked as made up; no private name or path in a shipped file; every step item of `standards` keeps a "Done when" line; the section order is the layout's; no other file under `skills/`, `docs/`, `utils/` or `README.md` still states the old stop, the old refusal or the old Svelte condition (`grep -rnoE` for "whole draft", "No repo-setup folder", "Svelte or SvelteKit", "standards mode" over those trees; the only hits outside the changed files are `docs/roadmap.md` line 26, the entry's goal, which a step does not edit, and unrelated uses of "whole draft" in `paper`).

### Behaviour

B1. The `review` mode's rule for when a language's page is lacking changed, and the report's list of user-visible changes does not state it. Place: "What it reads" 4, lines 46 and 47, and Steps / review 4 line 215. Before: "A repository that uses a language and has no rules for that language in its pages lacks that language's page". After: the page "is present only when a page found at place 1 or 2 is a page for that language or holds a section for it", and sentences inside rules of another subject do not count. Scenario: in a repository whose common page holds Python rules outside a section of their own, `review` now holds the Python code to the default Python page and writes candidates marked as coming from the default page, where it did not before. The brief says "Nothing else of the `review` mode changes" beyond items 9 and 10; the report lists the reworded line as judgment call 3 and the placement as call 4, but not the change in what `review` does, with its before and after. Keeping one definition for both modes is the consistent choice in my judgment; the ruling on it is the orchestrator's.

B2. The stop names other pages of rules that were not read (line 149). It is new and user-visible and is absent from the report's before and after list; it is stated only in the DONE table, item 13.

## The reading the task asks for above all

- Can a person who has not opened the pages answer the stop in a few minutes: yes for the stop the example shows (28 lines, each heading says what answering does, the last line says how to answer). No where a page is new (F4), and the contradiction block needs the "Under ..." lines to make sense of two quotes that do not conflict (F6). A rule of group 2 whose placeholder the session filled from the code, such as the folders of rule 14 of the default change standard, is approved by title without the filled text being shown; that follows the ruling ("named in one line and not reprinted").
- Short and not cryptic: short without a new page; "strike its number" and "name its number" are explained by the headings above them. Not cryptic in the example.
- Can a session sort every default rule into exactly one of present or the five groups without guessing: no. Three places need a guess: F1, F2, F5.
- Do two rules of the text contradict each other: yes, F3 (lines 191 and 192 against 196) and F9 (line 187 against 195).

## Declined to judge

- Whether the stop should print a new page whole or name it in one line (F4): the ruling says short, the brief says shown as written; the user's or the orchestrator's call.
- Whether a rule of group 2 or 3 on a new page should also stand as a line of its group (F3, judgment call 1): the brief's item 3 allows both readings.
- Whether the order of the six should change in place of the narrowed definitions (the builder's point under "Anything in the brief that was wrong"): the orchestrator's ruling.
- Whether "more than half" is the right line between groups 3 and 4, and whether the three vendored folder names are the right list: decisions the brief took.
- The exit status of `python3 docs/figures/gen_figures.py`: not run, since it writes files; checked by comparing bodies in memory.
- The plan's whole verify list: not run, as instructed.
- Whether step 5 moves the default pages and changes `paper`, `writing` and `code-comments` so that S3's sentences become true: outside this step's diff.
- How the svg renders: read as text only.
- `metadata.version` staying "1.0.0": a decision the brief took.

Files: /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/skills/code/codebase-design/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/docs/adr/0047-codebase-design-is-one-skill-made-from-two-sources-and-finds-the-standards-pages-by-a-search-order.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/README.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/docs/figures/gen_figures.py, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/docs/figures/codebase-design.svg, /Users/axelfaes/workspace/ordo/.scratch/19-codebase-design/agents/reviews/4-report.md, /Users/axelfaes/workspace/ordo/.scratch/19-codebase-design/agents/briefs/4.md.

Agent usage: a0f5e5d3a9d6b9ca8, claude-fable-5-2, 138507 tokens, 15 tool uses, 4.8 minutes.

## Repair round 1, refuted

Review of repair round 1 of step 4 (worktree .agents/worktrees/19-codebase-design-4, base 7219d6c). I changed nothing. I read everything in your order and ran the checks below from the worktree root. I did not run `python3 docs/figures/gen_figures.py`, because it writes files. The builder's "gen exit 0" is therefore not reproduced by me. `diff -u` of `docs/figures/codebase-design.svg`, `gen_figures.py` and the ADR against the round-1 snapshot printed nothing, so the round left those three unchanged. (`files.txt` lists the paths with a status prefix, so I ran each diff with the bare path.)

## Checks as printed

- Character-set check over the five files: printed no line, `exit status 0`.
- Description check: `codebase-design 1019`.
- `grep -c 'repo-setup' SKILL.md`: `0`.
- `grep -n '^## '`: `12 Quick start`, `20 Use instead`, `28 What it reads`, `65 Steps`, `281 Stops`, `294 Anti-patterns`, `308 Rules`.
- `grep -c '^| .codebase-design. |' README.md`: `1`. `awk 'NR==30{print length($0)}' README.md`: `1160`, which is at most 1161.
- `git diff 7219d6c --stat`: the same five files, 162 insertions and 54 deletions. `git status --short docs/figures`: only `codebase-design.svg` and `gen_figures.py`.
- `--numstat`: README `1 1`, ADR `5 5`, svg `4 4`, `gen_figures.py` `3 2`, SKILL.md `149 42`. This equals the report.
- `wc -l SKILL.md`: `315`, equal to the report.
- `grep -n -i 'kind'`: prints nothing.
- `grep -n -i 'contradict'`: lines 178, 252 and 254. The first is a title of a default rule inside the example. The other two are the `review` mode on ADRs. This equals the report.
- `grep -c 'ordo-init'`: `12`.

## Rulings 1 to 9

1. Carried out as written. Steps / standards 5 defines group 1 as a rule that "asks something else, such as a different limit, a different order or a different check, whether or not the two can both be followed". Groups 2 to 4 open with "the pages hold nothing on the requirement". Step 10 and the example say "state a rule differently". Nothing was closed by removal.
2. Carried out. The split is by requirement, a pronoun does not keep a requirement in group 5, and only "that the tool runs, its configuration file, and a requirement that only the tool can check" goes to group 5. See judgment call 1 below for a narrowing.
3. Carried out. A new page is one lettered line with its own yes or no, and its text is not printed. The drafted text goes to `standards-page-<subject>-<timestamp>.md` beside the audit file (Step 8). A rule of group 2 or 3 on a new page is decided by that page's line only. A rule of group 4 stays a numbered line. Steps 7, 10 and 11 agree. The example gains line B. Two additions beyond the ruling are findings S1 and S2.
4. Carried out. "One paragraph or block outside any list that states a requirement, such as a section that gives the commands to run."
5. Carried out. The example's default quote is the made-up "The whole verify list runs once, at landing. Before that, the builder runs only the checks of the files the step changes." The bullet says a quote is the sentence or sentences that differ.
6. Carried out. The sentence is shown only "When Steps / standards 3 noted other pages of rules" and says they were not compared.
7. Carried out. Step 10 is "Done when the user has answered or corrected the draft." Step 11 counts a difference without a choice, an unanswered yes or no and an unanswered question as no, and the last message names it. See S3 for a clash this creates.
8. The two rows are in the report with before and after. Their content matches what I read in "What it reads" 4 and Step 10.
9. Reread as claimed. The title paragraph, the Stops row "The draft" and the README row changed. The description, Quick start, the Anti-patterns row, the ADR sentence and the figure note are unchanged, and I find each still true. Two sentences are thinner than before:
   - The ADR bullet says nothing about a rule that differs from the repository's.
   - The README row does not mention the line of a new page. The builder names this in judgment call 7.

No claim of closure in the report failed to reproduce by my reading. The builder's case 12 note is correct: line 292 ("stop as their own Stops tables say") remains and is not a numbered item or section citation.

## Items 1 to 20 of the brief, on the whole diff

- Item 1: holds. Group 5 is defined only as "what the bullets on a tool send there", so a session has to reread the three bullets above it to apply it (S4).
- Item 2: holds (see judgment call 1).
- Item 3: holds, with the forms changed by rulings 1 to 3.
- Item 4: violated in part (S1). The group 4 line "It would go into page B." says where an addition goes.
- Items 5 to 11: hold.
- Item 12: holds.
- Item 13: holds, with the condition added by ruling 6.
- Items 14 to 18: hold.
- Item 19: holds. The ADR bullet does not cover a rule that differs (a brief-defined text, not a defect of the round).
- Item 20: holds. The svg and the note are unchanged by the round, and the body comparison was done by the first reviewer, not by me.

## Cases 1 to 16, walked through the text as it stands

- Cases 1, 2, 3, 5, 6, 8, 9, 10, 13, 14 and 16: met.
  - Case 14: the `[[nodiscard]]` requirement goes to group 3 with "40 of 44", and the linter's warning is "a requirement that only the tool can check", so it goes to group 5.
  - Case 16: "A new page is written on its own yes and on nothing else, with every rule its line named", and group 2 rules go only to pages that exist.
- Case 4: met. The tools go to group 5, and the pointer requirement is sorted on its own.
- Case 7: met. A new Python page lists its group 2 and 3 rules in line B, and the annotation rule stays a numbered group 4 line.
- Case 11: partial (S1). The new page's line gives its path, which ruling 3 asks for, but the group 4 line also says where a rule will go.
- Case 12: met. The grep prints 0, and the one sentence that names another skill's "Stops tables" is unchanged from the base.
- Case 15: partial. A short stop is produced, with one lettered prose standard line saying "default page unchanged" and its yes or no. The text does not say which letter the first page takes when there is no group 1 difference (S5).

## Judged by reading

- Can a session sort every default rule into exactly one of present or the five groups without guessing? Nearly. The order is "present, 1, 2, 3, 4, 5", each group's opening is exclusive of the others, and paragraphs count as rules. Two guesses remain:
  - Group 5 is defined only by reference to the tool bullets (S4).
  - A non-tool default rule that holds two requirements, of which the repository holds one, is "present" as a whole (judgment call 1).
- Do two bullets of Steps / standards 5 to 11 contradict each other? One pair does (S3). Steps 7, 10 and 11 agree on new-page rules.
- Can a person who has not opened the pages answer the example's stop in a few minutes? Yes. The example has 32 lines, each heading says what answering does, and the last line lists the answers. Only the group 4 line is hard to read (S1).
- Is any line cryptic? "It would go into page B." appears before B is introduced. "the numbers to strike, the numbers to add" is readable from the headings.
- Does the example match the rules above it? Yes on order (1, 2, 3, 4, 5, new pages, present sentence, answer line), lettering (A, then B), numbering (1, 2 running on) and what each line holds. The `plan.yaml` change line, a question line, the other-pages sentence and the prose standard line are not shown, which the rules do not require.

## The builder's eight judgment calls

1. The split by requirement applies only to a default rule that names a tool, not to every rule. This is a decision that was not the builder's alone. Ruling 2 says "Each requirement of a default rule is sorted on its own", and the builder read that as limited to tool rules so as not to undo brief item 2. The reading is defensible, but the orchestrator should rule on it.
2. The group 4 line names the new page, and Step 11 writes the rule only with the page's yes. This is outside the rulings. The ruling says only that the rule "stays a numbered line of group 4" and enters when named. See S1.
3. The order of the new pages after group 5 is inside the rulings and the brief.
4. The file name `standards-page-<subject>-<timestamp>.md` is inside ruling 3.
5. The prose standard's line names sections in place of rules. This is inside ruling 3, which says it "says that it is the default page unchanged".
6. The opening line lost its count "8 rules to decide". No ruling names it, but no count is true for the new form. Harmless. The text now has no bullet on the opening line at all.
7. The README row wording is inside ruling 9, within 1161 characters.
8. The added clause "and asks nothing else on what both cover" is inside ruling 1, because it removes an overlap with group 1.

## Findings

### Spec

S1. Group 4 line names a page and where a rule goes.
- Place: SKILL.md line 154 and the example line "2. ... 237 breaking it. It would go into page B."
- Text: "A rule of group 4 that belongs to a new page stays a numbered line of group 4, and its line names the page."
- What is wrong: this is the builder's addition (call 2). Brief item 4 and case 11 say no line says where an addition will be placed. Step 10's "No line says where a rule added to a page that exists will be placed" now carves out new pages. The example shows "page B" before page B appears.
- Scenario: a session or reviewer reads item 4 and sees the stop saying where a rule goes. A user reads "page B" and cannot tell what it is until the end.
- Small to fix? Yes. Either remove the sentence, or, as a decision for the orchestrator, keep it and state it in item 4's carve-out and in the example's ordering.

S2. Step 11 makes a group 4 rule on a new page also depend on the page's yes.
- Place: line 205.
- Text: "and one that belongs to a new page only when that page also has its yes."
- What is wrong: it follows from "a new page is written on its own yes", but it is a second rule the ruling did not state.
- Scenario: none harmful, since a page without a yes is not written.
- Small to fix? Yes, optional.

S3. Two bullets of Step 11 contradict each other.
- Place: lines 207 and 209.
- Text: "A new page is written on its own yes and on nothing else, with every rule its line named" and "a question left unanswered ... counts as no: nothing is written for it".
- Scenario: the page line for B holds a rule with an unanswered placeholder question. One session writes the page whole, another drops the rule or the page. Case 16 says the page is written "with every rule it was shown to hold".
- Small to fix? Yes: one sentence saying whether an unanswered question under a page's line drops the rule or the page.

S4. Group 5 is defined only by reference.
- Place: line 100, "Group 5, a rule about a tool the repository lacks: what the bullets on a tool send there."
- Scenario: a session reads this bullet alone and has no test for group 5 until it rereads the three bullets above it.
- Small to fix? Yes, one clause.

S5. The first letter of a new page is not specified when there is no difference.
- Place: line 150, "lettered on after the differences".
- Scenario: case 15 has no group 1. Sessions start at "A" or stop at an undefined point.
- Small to fix? Yes.

### Proof

- None. Every command the round's report quotes reproduced (counts, grep results, README length, numstat, line count). The builder's "gen exit 0" is not reproduced by me, since I did not run the writer.

### Standards

- The list-item standard says one rule per bullet and a bullet is one sentence where it can be. Three added bullets are 41 words each (line 99 for group 1, line 151 for the new page's line, line 153 for new-page rules of groups 2 and 3). The report names the first two as departures. The bullet at line 153 is not named in the report's departure list. Each is a list of what one form holds. Small to fix? The 153 bullet could be split in two.
- The ADR's bullet on the `standards` mode carries three semicolons in one sentence of more than 80 words. This was already named in the first review (S2) and is unchanged.

### Behaviour

- B1. The stop does not tell the user that silence counts as no. Step 11 says a difference, a yes or no or a question left unanswered counts as no, and the last message names each. The answer line at the end of the stop does not say so. Scenario: a user who skips lettered line B gets nothing written for it and learns only from the last message. Small to fix? Yes, one clause in the answer line.
- B2. Judgment call 7 leaves the README row silent on the new page's one-line form. The row is not false. Not small, not required.

## Declined to judge

- Whether a stop that is thirty-odd lines in the example is short enough in the user's sense. I judged it readable in a few minutes, but "short" is the user's call.
- Whether the split by requirement should apply to every default rule (judgment call 1): the orchestrator's ruling.
- Whether the group 4 line should name its page (S1): the orchestrator's decision.
- The exit status and output of `python3 docs/figures/gen_figures.py`: not run, since it writes files.
- How the svg renders: not viewed.
- Whether step 5 makes the ADR's `ordo-init` sentences true: outside this diff.

Files: /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/skills/code/codebase-design/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/README.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/docs/adr/0047-codebase-design-is-one-skill-made-from-two-sources-and-finds-the-standards-pages-by-a-search-order.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/docs/figures/gen_figures.py, /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-4/docs/figures/codebase-design.svg

Agent usage: a36ce253e9ce66cbf, claude-sonnet-5-5, 116459 tokens, 10 tool uses, 2.6 minutes.
