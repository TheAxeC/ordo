# Report: step 11, the call of `idea` and the quoted idea of its novelty pages

Everything in the brief is done.

## Open items of the state file

Quoted verbatim from `.scratch/13-researcher/orchestrator-state.md` of the main checkout (`sed -n '/^## Open items/,/^## Closed/p'`):

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.
```

The section holds no open item.

## The cases' first read (unchanged tree at base 04f2bd5)

- Case 1 (`/researcher idea Cayley-Menger determinant: ...`). Read through "What it reads" 1 ("every other argument is a path"), item 17, "idea" item 3 and Steps 1. Result: `Cayley-Menger` is read as the `<project folder>` and `determinant:` as a `<sketch file>` that does not exist, which gives the refusal "No sketch file". The call also matches no Quick start line, which Steps 1's last bullets send to the stop "The entry point". Unmet: the sketch is not the call's text and the folder is not asked for.
- Case 2 (`/researcher idea`). "What it reads" 1: "A call of `idea` with no `<project folder>` is the refusal "No project folder"". Met.
- Case 3 (`/researcher idea projects/demo`, no such folder). "What it reads" 1 and "idea" item 3: the folder is made, a new project, and with no `<sketch file>` the first message asks for the sketch, the stop "The sketch". Met.
- Case 4 (`/researcher idea projects/demo sketch.md`, no such file). "What it reads" 1: "A `<sketch file>` that does not exist is the refusal "No sketch file"". Met.
- Case 5 (`/researcher full I want to test ...`). Read through "What it reads" 1 and "full" item 2. Result: `I` is read as the project folder and `want` as a `<sketch file>` that does not exist, which gives the refusal "No sketch file". Unmet.
- Case 6 (round-2 page whose first quoted line is the session's summary). Form line 14 of `references/novelty_page.md`, `> <the idea or the candidate claims as the user gave them, each line quoted>`, does not say which lines of a page made by `idea` are the user's. It does not keep the session's summary out of the quotes, and it does not ask for the option an answer took. Unmet under ruling P.
- Case 7 (`> 2 Agree` followed by an unquoted line). The same form line gives no rule to quote the sketch or to name the option taken by its round and choice. Unmet under ruling P.
- Case 8 (`/researcher novelty "<a sentence>"`). Form line 14 quotes the idea as the user gave it, and the example (made by `/researcher novelty`) does so. Met.

No case showed a rule of the brief to be wrong. No hand-back was made and no ruling was needed.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. A call of `idea` whose text is a sentence (ruling O) | DONE | `git diff`: "What it reads" 1, item 17, "idea" item 3, Stops row "The sketch", new Stops row "The project folder", Stops row "No project folder" |
| 2. A call of `full` whose text is a sentence (ruling D45) | DONE | `git diff`: "What it reads" 1 (one sentence covers `idea` and `full`), "full" item 2, the Stops rows above |
| 3. The quoted idea of a page made by `idea` (ruling P) | DONE | `git diff`: `references/novelty_page.md` form line 14 and three bullets under the form; `SKILL.md` "idea" item 5 sub-bullet |
| Verify 1, character set | DONE | the brief's command printed `exit 0` and nothing else |
| Verify 2, fewer than 20 lines | DONE | `git diff --numstat` printed `8<tab>6<tab>skills/academic/researcher/SKILL.md` and `4<tab>1<tab>skills/academic/researcher/references/novelty_page.md` (each `<tab>` stands for the tab character printed); 8 + 6 + 4 + 1 = 19 |
| Verify 3, no private name | DONE | `grep -n 'cr-geometry\|research-hub\|HCCNet\|fastMRI' skills/academic/researcher/SKILL.md skills/academic/researcher/references/novelty_page.md` printed nothing, exit 1 |
| Verify 4, cases on the changed text | DONE | the section "The cases on the changed text" below |
| Verify 5, list items and sentence length | DONE | the section "List items and sentence length" below |

## The cases on the changed text

- Case 1. "What it reads" 1 now reads: "A call of `idea` or `full` with more than two words after the mode reads the whole text after the mode as its sketch, a first word that looks like a path included, and makes no folder from it. In place of the refusal "No project folder", its first message asks for the `<project folder>`, the stop "The project folder", before the mode's first item." Item 17 and "idea" item 3 take "the call's text when ... item 1 reads it as the sketch". The Stops row "The project folder" shows the sketch as read and asks for the folder. Result: the sketch is the whole text after `idea`, no folder `Cayley-Menger` is made, and the first message asks for the project folder. Met.
- Case 2. The new sentence applies only to more than two words. "A call of `idea` with no `<project folder>` is the refusal "No project folder"" still holds for a call with no word. The row "No project folder" excepts only a call whose text is read as the sketch. Met.
- Case 3. One word: the folder is made ("idea" item 3), and the row "The sketch" fires, since its When now reads "gives no `<sketch file>` and no text read as the sketch, and no interview is continued or reopened". Met.
- Case 4. Two words: the sentence on `<sketch file>` still gives the refusal "No sketch file". Met.
- Case 5. More than two words after `full`: by "What it reads" 1 the whole text is the sketch and no folder is made. The first message asks for the folder before "full" item 1. "full" item 2 runs `idea` "with the call's sketch: its `<sketch file>`, or its text when "What it reads" 1 reads it as the sketch". Met.
- Case 6. The new bullets under the form say that in a page made by `idea` the section "The idea" quotes only the sketch from the progress file and the user's answers the round's claims rest on, and that "A line the session writes in "The idea", such as a summary of what a round settled, stands unquoted." So the summary line stands unquoted, and the sketch and the answer `(a), but ...` are quoted. Because that answer takes option (a), the option is stated below it, unquoted, named by round and choice. Met.
- Case 7. The bullet "Under each answer that takes an option, a letter or `Agree`, the page states unquoted the option it took as the round put it, named by its round and its choice, such as "Round 2, choice 2 (the claim), option (a): <the option>"". The page quotes the sketch and `2 Agree`, and states the option below. Met.
- Case 8. Form line 14 still opens "the idea or the candidate claims as the user gave them, each line quoted", and its addition covers only a page made by `idea`. The new bullets each name a page made by `idea`, or answers, which only `idea` gives. `git diff` touches no line of the example. Met.

## List items and sentence length

Each new or changed item was read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, E "Sentence length".

- "What it reads" 1 is one paragraph item that already holds every rule on the call, as the file has it. The two new sentences sit there because that is where the call is read and where the brief puts them. They are about 33 and 25 words long. The first keeps its qualifiers (a first word that looks like a path included, no folder made) in the same sentence as the rule, as "Lists and tables" asks.
- The Stops row "No project folder" When cell is one sentence of about 45 words. It keeps the exception in the same cell as the rule, so the refusal does not state a case the new sentence of item 1 excepts.
- The novelty-page bullet "Under each answer ..." is one sentence of about 40 words, made-up example included. The example shows the naming by round and choice, which the rule alone leaves open to several forms. The example is made up and says nothing of any run.
- Every other new item or sentence is one rule, under about 25 words.

## The terms

- "stop" ("the stop "The project folder"") is used in the glossary's sense of a point in a skill's Stops table where it waits on the user (`grep -n '^- \*\*stop\*\*' docs/glossary.md`, line 130). The new row waits for the user's folder.
- "refusal" ("in place of the refusal "No project folder"") is used in the glossary's sense (`grep -n '^- \*\*refusal\*\*' docs/glossary.md`, line 102).
- "round" in the novelty-page bullets ("the round's claims", "as the round put it", "its round") is the round of the interview of `idea` (glossary line 180). The page's own line 10 names it "round <n> of the interview", and `SKILL.md` "idea" item 5 already uses the bare "the round" ("one page for the round") in the same sense.
- "sketch" has no glossary entry (`grep -n -i sketch docs/glossary.md` printed nothing, exit 1) and is used as `SKILL.md` already uses it.
- The diff adds or changes no glossary entry.

## Files with line counts

- `skills/academic/researcher/SKILL.md`: 749 lines (`wc -l`), 8 added and 6 removed.
- `skills/academic/researcher/references/novelty_page.md`: 119 lines (`wc -l`), 4 added and 1 removed.
- `.scratch/13-researcher/agents/reviews/11-report.md`: this report.

## Judgment calls the brief left open

- Item 3 of "What to build": the sentence that points at the page's form goes in "idea" item 5, as a sub-bullet before the one that adds each page's path to the progress file. That item is where `idea` runs `novelty` and gets its page. "novelty" item 1 is about stating claims, not writing the page.
- The Stops row "No project folder" (a refusal row) is changed too. Its When cell said that a call of `idea` or `full` that gives no project folder is refused, which the new sentence of "What it reads" 1 makes false for a call whose text is read as the sketch. Change standard rule 19 requires that no two statements contradict each other. The row is in `SKILL.md`, a path of the step.
- The question for the project folder comes "before the mode's first item", not inside "idea" item 3. "idea" item 1 reads the progress files of the project folder, and "full" item 1 reads its README, so each needs the folder before it runs.
- "What it reads" 3 ("the `<project folder>` of the call") and Steps 1's Quick start bullets are left as they stand. The folder given at the stop "The project folder" stands as the call's `<project folder>`. "What it reads" 1 says how such a call reads, so the call matches the line of `idea` or `full` and is not sent to the stop "The entry point". The step is at 19 lines, under its limit of 20.
- The form's line 14 stays one line, extended for a page made by `idea`. The rule on the unquoted option is a bullet under the form, not a second form line.

## Host- or user-visible changes

- `/researcher idea <text of more than two words>`. Before: the first word was read as the folder and the second as a missing sketch file, which gave the refusal "No sketch file". After: the whole text is the sketch, no folder is made, and the first message asks for the project folder, at the stop "The project folder".
- `/researcher full <text of more than two words>`. Before: the same refusal. After: the same reading, with the sketch handed to `idea`.
- A novelty page made by `idea`. Before: "The idea" was described only as "the idea or the candidate claims as the user gave them, each line quoted". After: it quotes only the sketch and the user's answers the claims rest on. Under each answer that takes an option, it states the option unquoted, named by round and choice, and a line the session writes stands unquoted.
- A novelty page made by `/researcher novelty`: unchanged.

## Wrong or impossible in the brief

- A premise's line numbers were off. The brief says the bullets under the form of `references/novelty_page.md` are "lines 60 to 64" and that the example starts at line 66. On the base tree (`cat -n skills/academic/researcher/references/novelty_page.md`) the bullets are lines 53 to 62, the heading "## An example" is line 64 and the example's opening sentence is line 66. The content the premise describes is as stated, and the work was not affected.
- `README.md` line 34 names the Quick start lines of `idea` and `full` (`grep -rn 'sketch file' skills docs README.md`). Those lines are unchanged, so the README stays true, and it is outside the step's paths.
