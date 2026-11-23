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
