# Report: step 4, the stop "The draft" of `/codebase-design standards`

Everything in the brief is done. Two points need the orchestrator's reading before landing: the order in which the groups are tried (under "Anything in the brief that was wrong"), and judgment calls 1 to 3.

## Open items of the state file

- none

## The cases' first run, on the unchanged text

Each case was read against `skills/code/codebase-design/SKILL.md` as it stood at the base (208 lines). No case was handed back; the one place where the brief's wording, read literally, gives a wrong result is reported under "Anything in the brief that was wrong", with what the skill's text does about it.

1. Not met. Steps / standards 5 drafted every missing rule and 7 said the draft "shows each addition with the file and the place it goes to": the five rules would be printed in full, each with a file and a place, with no single yes or no.
2. Not met. The pointer rule would be drafted and shown as an addition with its file and place; the text had no count and no "added unless struck".
3. Not met. Steps / standards 4 knew only "present" and "missing", so the annotation rule would be drafted and written on approval like any other; nothing told a rule the code does not follow apart.
4. Not met. No sentence covered a rule about a tool the repository lacks; such a rule was drafted like any missing rule.
5. Not met. Steps / standards 4 looked for "the same rule"; a rule that says otherwise is not the same rule, so the default's rule would be drafted and added beside the one it contradicts.
6. Not met. Steps / standards 7: "It shows each default rule found already present, with where it stands", so 61 rows.
7. Not decided by the text. Steps / standards 3 said a language's page is present "only when a page or a section holds rules for that language"; two size limits that also read `.py` files can be read as such rules. No group 4 existed.
8. Not decided by the text. Steps / standards 6 said both "beside the pages the repository already has" and "takes the file name place 2 of What it reads 4 gives its subject", which is a path under `docs/dev/`.
9. Not met. The question was asked at Steps / standards 2, before the pages were read at Steps / standards 3.
10. Not met. "When every default rule is already present, the draft says so" stood inside the stop, which also listed every present rule; there was no audit file.
11. Not met. The stop showed each addition's file and place and each present rule "with where it stands".
12. Not met. `grep -c 'repo-setup' skills/code/codebase-design/SKILL.md` printed `9`, and "What it reads" 4 and 5 cited the `repo-setup` skill's "The tree" and its "What it reads" 3.

## DONE / NOT DONE

| Item | State | Where it stands, or the check and its output |
|---|---|---|
| 1 present and the five groups | DONE | Steps / standards 5: the bullet "Each rule gets the first of these that fits" with its six sub-bullets, the bullet on a tool's sentence, the bullet on a rule that applies in no place. The word "kind" is not used: `grep -n -i 'kind' skills/code/codebase-design/SKILL.md` prints nothing. |
| 2 what one rule is | DONE | Steps / standards 5: "One rule is one numbered item or one bullet of a default page" and "A default rule that holds more than the repository's rule on the same requirement is present". |
| 3 the order and the forms of the stop | DONE | Steps / standards 10, its bullets and the made-up draft in the code block. |
| 4 no line number alone, no placement | DONE | Steps / standards 10: "A place is named by its page and its section in words. A line number may follow that name and never stands alone." and "No line says where an addition will be placed."; the place is named at Steps / standards 8 and 11. |
| 5 the audit file | DONE | Steps / standards 8. |
| 6 a placeholder stays a question | DONE | Steps / standards 6 (the form of the question) and 10 ("A question stands directly under the line of its rule, or under the new page that holds its rule"). |
| 7 a conditional rule whose condition is false | DONE | Steps / standards 5, third bullet. |
| 8 pointers and examples | DONE | Steps / standards 6, the two bullets on a pointer and on an example. |
| 9 the languages | DONE | "What it reads" 5 with its three bullets. |
| 10 the user interface | DONE | "What it reads" 6, Steps / standards 4 (after 3), the Stops row "The user interface". |
| 11 a language's page | DONE | "What it reads" 4, the two bullets on a language's page; Steps / standards 3 points at them. |
| 12 a new page | DONE | Steps / standards 7, the three bullets on a new page. |
| 13 only places 1 and 2 are compared | DONE | Steps / standards 3 (two bullets) and 10 ("One sentence names the pages of rules that Steps / standards 3 noted and did not read"). |
| 14 the last message | DONE | Steps / standards 11. |
| 15 no stop when nothing is to decide | DONE | Steps / standards 9. |
| 16 `ordo-init` in place of `repo-setup` | DONE | Check 3 below prints `0`. The eleven lines that name `ordo-init` name its folder, its two template folders, the refusal, or the invocation `/ordo-init`; none cites a numbered item or a section of it. |
| 17 the description and the README row | DONE | Check 2 prints `codebase-design 1019`; `awk 'NR==30{print length($0)}' README.md` prints `1161`. Every trigger of the description is kept. |
| 18 Stops, Anti-patterns, sentences on the mode as a whole | DONE | Stops rows "The draft" and "The user interface"; the new Anti-patterns row "A draft that lists placements and line numbers in place of what each rule says"; the paragraph under the title and the Quick start line reworded. |
| 19 ADR 0047 | DONE | `grep -c 'repo-setup' docs/adr/0047-*.md` prints `0`; the Decision's bullet on the `standards` mode states the four cases. Five lines changed, no dated note. |
| 20 the figure's note | DONE | `docs/figures/gen_figures.py`, function `codebase_design`, the note; `python3 docs/figures/gen_figures.py` exits 0 and `git status --short docs/figures` lists the two files. The note still takes four lines in the figure, at the same positions. |

The checks of "Verify before you report", as printed:

1. The character-set check printed no line, then `exit status 0`.
2. `codebase-design 1019`
3. `0`
4. `12:## Quick start`, `20:## Use instead`, `28:## What it reads`, `65:## Steps`, `268:## Stops`, `281:## Anti-patterns`, `295:## Rules`
5. `grep -c '^| .codebase-design. |' README.md` printed `1`. `git diff --stat` listed `README.md`, the ADR 0047 file, `docs/figures/codebase-design.svg`, `docs/figures/gen_figures.py` and `skills/code/codebase-design/SKILL.md`, "5 files changed, 149 insertions(+), 54 deletions(-)". `python3 docs/figures/gen_figures.py >/dev/null; echo "gen exit $?"` printed `gen exit 0`. `git status --short docs/figures` printed ` M docs/figures/codebase-design.svg` and ` M docs/figures/gen_figures.py`.
6. Read against the skill layout's "Lists and tables" and the prose standard's sentence length. The departures:
   - Steps / standards 10, the bullet on group 1, is one sentence of 46 words: it lists the five things a contradiction shows, which belong together as one form.
   - Steps / standards 10 holds a code block inside a list item. A section of its own would add a `##` heading, which check 4 does not allow.
   - The Stops row "The draft" has long cells in "What it shows" and "What resumes it": each is one sentence that lists what the stop shows by the groups, as item 18 asks; the rules themselves stand in Steps / standards 10 and 11.
   - The bullet on a place in Steps / standards 10 has two sentences: the second is the limit on the first.
   - The ADR's bullet on the `standards` mode holds four clauses joined by semicolons, in the record's existing form of one bullet per mode.

No test was written and none was run: the step changes text and one note string of the figure script.

## The stop, for the made-up repository of cases 1 to 6 taken together

This is the block that stands in Steps / standards 10, every rule, count and path in it made up. It is 28 lines, blank lines included (the block with its two fence lines counts 30).

```
The draft: 8 rules to decide. Nothing is written until you answer.

Your page and the default page contradict each other. Choose one.

A. Which checks a builder runs before landing
   Your change standard, section "Verification", says: "The builder runs the whole verify list on the whole tree before it reports."
   The default says: "The builder and the reviewer run the checks the brief names for the files the step changes."
   Under yours: every step waits for the whole list, also a step that changes one page.
   Under the default: a failure outside the changed files shows only at landing.
   Keep yours, or take the default's?

Rules on how work is done that your pages lack. Add them all, yes or no?

   From the default change standard: "A rewrite keeps the meaning of every rule it carries", "A change leaves no two statements that contradict each other", "Nothing is changed that no brief item asks for", "A secret in quoted command output is written `<REDACTED>`", "No breakage testing".

Rules your code already follows. Each is added unless you strike its number.

   1. A pointer binds to its type: `T* p`, never `T *p`. 1,180 of 1,204 declarations.

Rules your code does not follow. None is added unless you name its number.

   2. Every Python function annotates its parameters and its return type. 3 of 240 functions do, so adopting it leaves 237 breaking it.

Rules about tools the repository lacks, none added: clang-format, clang-tidy.

61 default rules already stand in your pages. They are listed in /tmp/standards-audit-20260101-120000.md.

Answer with: yours or the default's for A, yes or no for the rules on how work is done, the numbers to strike, the numbers to add.
```

## The terms

- group: no entry in `docs/glossary.md` (`grep -n -i '\bgroup\b' docs/glossary.md` prints nothing). Used only for the five groups, defined at its first use in Steps / standards 5.
- kind: not used in the skill.
- stop: used for the stop "The draft" and "The user interface", the second sense of the entry (a point in a skill's Stops table where it waits on the user).
- refusal: "No ordo-init folder", as the entry has it: it names its cause and leaves nothing.
- standards: the `standards` list of `plan.yaml`, the entry's first sense.
- ADR, plan configuration (`plan.yaml`), `projects:` form, session: used as before, in the entries' senses.
- "place" is used for the places of the search order and for where an addition goes, as the skill already did; the entries "place, of a defect" and "place, of a point" are qualified terms of other skills.
- "part", "base", "case", "finding" and "verdict" are not used in the new text.

No glossary entry is added or changed.

## Files, with line counts

- `skills/code/codebase-design/SKILL.md`: 302 lines, 136 added and 42 removed.
- `README.md`: 260 lines, line 30 changed.
- `docs/adr/0047-codebase-design-is-one-skill-made-from-two-sources-and-finds-the-standards-pages-by-a-search-order.md`: 38 lines, 5 changed.
- `docs/figures/gen_figures.py`: 2362 lines, 3 added and 2 removed, inside `codebase_design`.
- `docs/figures/codebase-design.svg`: 55 lines, 4 changed.
- `.scratch/19-codebase-design/agents/reviews/4-report.md`: this report.

## Judgment calls the brief left open

1. A rule of group 2 or 3 that belongs to a new page is shown in that page only, not also as a line of its group. Item 3 says the page "holds its rules of groups 2 and 3" and only its rules of group 4 "stand as lines", and case 7 reads the same way. The consequence: such a rule has no number and no count in the stop (the count is in the audit file), and the user removes one by correcting the page.
2. Item 3 is followed as written for the prose standard: in a repository without one it is a new page and is shown as it would be written, which prints the whole default page in the stop. A one-line mention would be shorter; the brief does not allow it.
3. One line of the `review` mode changed, to serve item 11: Steps / review 4 read "A language the repository has, with no rules for it in the repository's pages, is such a subject" and now reads "A language the repository has, and whose page it lacks, is such a subject". Left as it was, it would contradict the new definition in "What it reads" 4.
4. Item 11's definition stands in "What it reads" 4, which both modes read, with a made-up example marked as made up; Steps / standards 3 points at it.
5. The ledger folders of item 9 are written as the `ledger_root` and the `archive_root` of the repository's `plan.yaml`.
6. A new page in a repository with a `plan.yaml` keeps the file name of its fixed name, such as `python.md`; a repository with a `plan.yaml` and no page of its own gets the page at its fixed name, added to the `standards` list.
7. The stop's headings are plain sentences and do not print "Group 1" to "Group 5"; a contradiction is lettered, so the user answers by letter and by number. The stop ends with one line that says how to answer.
8. A rule whose question the user leaves unanswered is not written, and the last message names it (Steps / standards 11), so no placeholder reaches a page.
9. The other pages of rules that item 13's sentence names are noted at Steps / standards 3, by reading the repository's file names, with a contribution guide as the example.
10. In the ADR, all five mentions of `repo-setup` now read `ordo-init`, the sentence on where `paper` reads the prose standard included, since each names the folder of the default pages.
11. The description no longer says "nothing that exists is rewritten", to stay under 1,024 characters; the rule stands in Rules and in the paragraph on the mode.

## User-visible changes, before and after

- The stop "The draft". Before: each addition with its file and place, each new page whole, each change to `plan.yaml`, each default rule already present with where it stands. After: the form shown above.
- A rule the code does not follow, a rule about a tool the repository lacks and a rule that contradicts a rule of the repository. Before: each was drafted and written on approval like any missing rule. After: the first is written only when the user names its number, the second never, the third only when the user chooses the default's rule, with the repository's rule left for the user's own rewrite.
- A new file outside the repository, `standards-audit-<timestamp>.md` in the temporary folder.
- No stop when the pages hold every default rule that applies. Before: the stop was raised and said so.
- The question on the user interface. Before: asked at the start, unless the repository used Svelte or SvelteKit. After: asked after the pages are read, and not when a page holds a UI standard or the repository tracks a `.svelte` file. This holds for `review` too.
- The languages. Before: from the file extensions as another skill listed them. After: from the files git tracks, vendored folders and the ledger folders left out, the extensions stated in the skill. This holds for `review` too.
- The refusal. Before: "No repo-setup folder". After: "No ordo-init folder". On this worktree the default pages still stand under `skills/ordo/repo-setup/templates/`, so the skill finds them only once step 5 has landed.
- The last message of the mode names, for each addition, the page and the section it stands in.
- README line 30, the description, the Quick start line and the figure's note say the above.

## Anything in the brief that was wrong or impossible

- Item 1 says the skill "tries them in the order below", with present defined as "the repository's pages hold a rule on the same requirement" and group 5 tried last. Read literally, case 5 comes out as present (a rule that says otherwise is a rule on the same requirement), and the tool rules of case 4 reach group 4 before group 5 (the code follows them in none of their places). The skill's text keeps the brief's order and makes the definitions exclusive, as item 1 also asks ("so that a session can tell them apart"): present is a rule that "asks the same on the same requirement"; a contradiction is one where "the two cannot both be followed"; the sentences that name a tool with no configuration are taken out of their rule before the order is tried, and group 5 is defined as those sentences. With that text every case gives its expected result. If the orchestrator wants the order itself changed instead, that is its ruling to make.
- Nothing was impossible.

## Round 1

Everything the rulings of `agents/briefs/4-round-1.md` name is done. Two things in it are for the orchestrator's reading: judgment calls 1 and 2 below.

### The rulings

| Ruling | State | Where the change stands |
|---|---|---|
| 1 (F1) a rule that differs | DONE | Steps / standards 5: "Group 1, a difference: the repository's pages hold a rule on the same requirement that asks something else, such as a different limit, a different order or a different check, whether or not the two can both be followed." Groups 2 to 4 each open "the pages hold nothing on the requirement". Steps / standards 10: "The words of group 1 say that the two pages state the rule differently."; the example's heading reads "Your page and the default page state a rule differently. Choose one." `grep -n -i 'contradict' skills/code/codebase-design/SKILL.md` prints only the title of a default rule quoted in the example and two lines of the `review` mode on ADRs. |
| 2 (F2) a tool | DONE | Steps / standards 5, the three bullets on a tool: the rule "is split by requirement, and each requirement is sorted on its own"; a requirement the code shows without the tool "is sorted like any other rule, even when its sentence names the tool or speaks of it by a pronoun"; "Only what cannot be met without the tool goes to group 5: that the tool runs, its configuration file, and a requirement that only the tool can check." |
| 3 (F3, F4) a new page | DONE | Steps / standards 8 (the drafted text of each new page written beside the audit file as `standards-page-<subject>-<timestamp>.md`); Steps / standards 10 (the five bullets on a new page: one lettered line with its own yes or no, its contents, the prose standard's line, rules of groups 2 and 3 in that line only, a rule of group 4 kept as a numbered line); Steps / standards 11 (the bullets on groups 2, 3 and 4 and "A new page is written on its own yes and on nothing else, with every rule its line named"); the example's line B. |
| 4 (F5) what one rule is | DONE | Steps / standards 5, first bullet: "One rule is one numbered item, one bullet, or one paragraph or block outside any list that states a requirement, such as a section that gives the commands to run." |
| 5 (F6) the example | DONE | The example's default quote reads "The whole verify list runs once, at landing. Before that, the builder runs only the checks of the files the step changes."; the block's lead-in says every rule, quote, count and path in it is made up. Steps / standards 10: "Each quote of a difference is the sentence or the sentences that differ, never a whole item of several sentences." |
| 6 (F7) other pages of rules | DONE | Steps / standards 10: "When Steps / standards 3 noted other pages of rules, one sentence names them and says that they were not compared, so a rule standing only there counts as missing." |
| 7 (F9) what is left unanswered | DONE | Steps / standards 10: "Done when the user has answered or corrected the draft." Steps / standards 11: "A difference left without a choice, a yes or no left unanswered and a question left unanswered each count as no: nothing is written for it, and the last message names it." The rule stands once, in step 11. |
| 8 (B1, B2) the report's rows | DONE | The two rows under "User-visible changes added in round 1" below. |
| 9 the other texts, reread | DONE | Changed: the paragraph under the title (the drafted text of each new page is also left outside the repository), the Stops row "The draft" (a difference, one line per new page, yes or no for each new page), README line 30 ("a rule that differs from yours in full", and shortened to 1160 characters). Read and left as they are, each still true: the description, the Quick start line, the Anti-patterns row on placements, ADR 0047's sentence on a missing rule, the figure's note. |

### The checks, as printed

1. The character-set check printed no line, then `exit status 0`.
2. `codebase-design 1019`
3. `0`
4. `12:## Quick start`, `20:## Use instead`, `28:## What it reads`, `65:## Steps`, `281:## Stops`, `294:## Anti-patterns`, `308:## Rules`
5. `grep -c '^| .codebase-design. |' README.md` printed `1`; `awk 'NR==30{print length($0)}' README.md` printed `1160`. `git diff --stat` listed the same five files. `git diff --numstat` printed `1 1 README.md`, `5 5` for the ADR, `4 4 docs/figures/codebase-design.svg`, `3 2 docs/figures/gen_figures.py`, `149 42 skills/code/codebase-design/SKILL.md`. `python3 docs/figures/gen_figures.py >/dev/null; echo "gen exit $?"` printed `gen exit 0`, and `git status --short docs/figures` printed ` M docs/figures/codebase-design.svg` and ` M docs/figures/gen_figures.py`. `wc -l skills/code/codebase-design/SKILL.md` printed `315`.
6. Departures of the new text from the rules on list items and sentence length: the bullet on group 1 in Steps / standards 5 and the bullet on what a new page's line gives in Steps / standards 10 are each one long sentence, since each lists what one form holds; the bullet on what counts as no in Steps / standards 11 joins three cases that share one rule. The departures of the first build stand.

### Cases 1 to 16, read on the text as it stands

1. Met. The five rules are ones the pages hold nothing on and the code cannot show: group 2, one line for the default change standard that names them by title, one yes or no.
2. Met. The pointer requirement is one the code shows without the tool, so it is sorted on its own: group 3, one numbered line with "1,180 of 1,204".
3. Met. 3 of 240 is half or fewer: group 4, a numbered line with what adopting it breaks; added only when named.
4. Met. That the two tools run, and their configuration files, go to group 5, whose line names the tools; the pointer requirement is sorted on its own "even when its sentence names the tool or speaks of it by a pronoun".
5. Met. The two rules ask something else on the same requirement: group 1, both quoted, what goes wrong under each, the choice; the default's is added only on the user's choice.
6. Met. One sentence with the count and the audit file's path; no row of present rules.
7. Met. The page is lacking ("What it reads" 4); it is a new page, shown in one line that names its rules of groups 2 and 3; the annotation rule stays a numbered line of group 4.
8. Met. Steps / standards 7: beside the pages in `docs/dev/standards/`, added to the `standards` list.
9. Met. Steps / standards 4 follows 3; the question is asked once.
10. Met. Steps / standards 9: one message with the count and the path, no stop.
11. Met as the rulings now have it: no line number stands alone, and no line says where a rule added to a page that exists will be placed. A new page's line gives the path of the page, as ruling 3 asks.
12. Met. The grep prints `0`; no sentence cites a numbered item or a named section of the `ordo-init` skill beyond the Stops sentence the review left as it is (F8, not sent).
13. Met. "A different limit" is named in the definition of group 1: both sentences quoted, the user chooses.
14. Met. The `[[nodiscard]]` requirement is one the code shows without the linter: group 3, "40 of 44". The linter's warning is "a requirement that only the tool can check": group 5, whose line names the linter.
15. Met. The page is new, so Steps / standards 9 does not end the run; the stop holds the opening line, one lettered line for the prose standard that says it is the default page unchanged, the sentence on the rules found present and the line on how to answer. The page's text is not printed.
16. Met. Steps / standards 11: "A new page is written on its own yes and on nothing else, with every rule its line named" and "The rules of group 2 that go to pages that exist are added on the user's yes to group 2."

### The stop for the made-up repository of the example

It is the block of Steps / standards 10, 32 lines with its blank lines.

```
The draft. Nothing is written until you answer.

Your page and the default page state a rule differently. Choose one.

A. Which checks a builder runs before landing
   Your change standard, section "Verification", says: "The builder runs the whole verify list on the whole tree before it reports."
   The default says: "The whole verify list runs once, at landing. Before that, the builder runs only the checks of the files the step changes."
   Under yours: every step waits for the whole list, also a step that changes one page.
   Under the default: a failure outside the changed files shows only at landing.
   Keep yours, or take the default's?

Rules on how work is done that your pages lack. Add them all, yes or no?

   From the default change standard: "A rewrite keeps the meaning of every rule it carries", "A change leaves no two statements that contradict each other", "Nothing is changed that no brief item asks for", "A secret in quoted command output is written `<REDACTED>`", "No breakage testing".

Rules your code already follows. Each is added unless you strike its number.

   1. A pointer binds to its type: `T* p`, never `T *p`. 1,180 of 1,204 declarations.

Rules your code does not follow. None is added unless you name its number.

   2. Every Python function annotates its parameters and its return type. 3 of 240 functions do, so adopting it leaves 237 breaking it. It would go into page B.

Rules about tools the repository lacks, none added: clang-format, clang-tidy.

New pages. Yes or no to each?

B. The Python coding standards, at docs/dev/coding-standards/python.md, with 4 rules: "The code runs on Python 3.11 or newer", "Modules and functions are `snake_case`", "A handler names the exception class it catches", "A path is a `pathlib.Path`". Its text is in /tmp/standards-page-python-20260101-120000.md.

61 default rules already stand in your pages. They are listed in /tmp/standards-audit-20260101-120000.md.

Answer with: yours or the default's for A, yes or no for the rules on how work is done, the numbers to strike, the numbers to add, yes or no for B.
```

### User-visible changes added in round 1

| Change | Before | After |
|---|---|---|
| When the `review` mode takes a language's page as lacking | A repository that used a language lacked its page when it had "no rules for that language in its pages" | The page is present only when a page of place 1 or 2 is a page for that language or holds a section for it; a sentence about that language's files inside a rule of another subject does not count. `review` then holds that language's code to the default page and marks those candidates as coming from it. |
| Other pages of rules | The stop did not mention them | When the repository holds pages of rules that neither `plan.yaml` nor the fixed names under `docs/dev/` name, the stop names them in one sentence and says that they were not compared. |

Round 1 also changes these, against the first build: a new page is one line with its own yes or no and is not printed; its drafted text is a file beside the audit file; a default rule that asks something else than the repository's is put to the user also when both could be followed.

### Judgment calls the rulings left open

1. The split by requirement is written for a default rule that names a tool the tree holds no configuration for, and for no other rule. Ruling 2 says "Each requirement of a default rule is sorted on its own"; applied to every rule it would undo item 2 of the brief, under which the sentences a default rule holds beyond the repository's are not drafted.
2. A line of group 4 whose rule belongs to a new page names that page ("It would go into page B."), and Steps / standards 11 writes such a rule only when the page also has its yes. Without it the user cannot see that naming the number depends on the page.
3. The new pages stand after group 5 in the stop, lettered on after the differences, in the order the brief's item 3 gives.
4. The file of a new page's drafted text is named `standards-page-<subject>-<timestamp>.md`.
5. The line of the prose standard names the page's sections in place of rules, since the page is copied whole and is not sorted into rules.
6. The opening line of the stop no longer gives a count of rules to decide.
7. The README row says "a rule that differs from yours in full" and "in one counted line", and does not mention the line of a new page, to stay within 1161 characters.
8. The bullet "A default rule that holds more than the repository's rule" now adds "and asks nothing else on what both cover", so that it does not overlap with group 1.
