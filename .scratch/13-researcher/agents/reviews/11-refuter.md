# Step 11 refuter report (on .agents/worktrees/13-researcher-11, base 04f2bd5)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All commands were run from the worktree root, /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-11.

```
$ printf '%s\0' skills/academic/researcher/SKILL.md skills/academic/researcher/references/novelty_page.md | xargs -0 perl -CSD -ne '...the brief's character-set check, as written in the brief...'; echo "exit $?"
exit 0

$ git diff --numstat
8<tab>6<tab>skills/academic/researcher/SKILL.md
4<tab>1<tab>skills/academic/researcher/references/novelty_page.md
(8 + 6 + 4 + 1 = 19 lines, fewer than 20)

$ grep -n 'cr-geometry\|research-hub\|HCCNet\|fastMRI' skills/academic/researcher/SKILL.md skills/academic/researcher/references/novelty_page.md; echo "grep exit $?"
grep exit 1

$ git diff 04f2bd5 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo $?
1    (no non-ASCII in any added line)

$ grep -n -i 'cayley\|menger\|cr-geometry\|research-hub\|HCCNet\|fastMRI\|heisenberg\|gabor\|benchmark hell' skills/academic/researcher/SKILL.md skills/academic/researcher/references/novelty_page.md
(nothing)

$ git status --short
 M skills/academic/researcher/SKILL.md
 M skills/academic/researcher/references/novelty_page.md

The commands the builder's report quotes as evidence, rerun:
$ wc -l skills/academic/researcher/SKILL.md skills/academic/researcher/references/novelty_page.md
     749 skills/academic/researcher/SKILL.md
     119 skills/academic/researcher/references/novelty_page.md
$ git show 04f2bd5:skills/academic/researcher/references/novelty_page.md | grep -n '^- \|^## An example\|^The idea, the claims'
  the bullets under the form are lines 53 to 62, "## An example" is line 64, the example's opening sentence is line 66 (this matches the builder's premise correction)
$ grep -n '^- \*\*stop\*\*\|^- \*\*refusal\*\*\|^- \*\*round' docs/glossary.md
102:- **refusal**: ...   130:- **stop**: ...   180:- **round, of the interview of `idea`**: ...
$ grep -n -i sketch docs/glossary.md
(nothing, exit 1)
$ grep -rn 'sketch file' skills docs README.md
SKILL.md lines 15, 16, 49, 67, 90, 91, 196, 403, 640, 668, and README.md:34
$ sed -n '/^## Open items/,/^## Closed/p' .scratch/13-researcher/orchestrator-state.md   (main checkout)
6 lines: the heading, its explanatory paragraph and blank lines; no open item, as the report quotes it
```

Size check for a small text step: the diff changes no script, no test and no configuration file (only the two `.md` files above), and 19 lines added plus removed as `git diff --numstat` counts them. It stays a small text step.

## Verdicts

Items of the brief's "What to build":

- 1: holds. "What it reads" 1 gains the sentence-call reading and the ask for the folder in place of the refusal. Item 17 and "idea" item 3 take the call's text as the sketch. The row "The sketch" is qualified, and the new Stops row "The project folder" gives When, What it shows and What resumes it. A call with no argument stays the refusal. Standards 1 and 2 name text outside the places the item lists that still competes with the new reading.
- 2: holds. The same sentence of "What it reads" 1 covers `full`, and "full" item 2 hands `idea` "its `<sketch file>`, or its text when "What it reads" 1 reads it as the sketch". Standards 1 and 2 also apply to `full`.
- 3: holds. Form line 14 of `references/novelty_page.md` is extended for a page made by `idea`. Three bullets under the form give the rule: only the user's words are quoted, the option taken is stated unquoted by round and choice, and a session line stands unquoted. "idea" item 5 gains a sub-bullet that points at the form. A page made by `novelty` keeps line 14's first alternative, and the example is untouched.

Cases of the brief's "Cases":

- Case 1: partial. Read through "What it reads" 1, item 17 and "idea" item 3, the call gives the expected result: the whole text is the sketch, no folder `Cayley-Menger` is made, and the stop "The project folder" asks for the folder. The missing part is Steps 1: its bullet "Any other call that matches no line of Quick start ... is the stop "The entry point"" still catches this call, because no Quick start line has the sentence form (Standards 1).
- Case 2: met. With zero words after `idea`, the "more than two words" sentence does not apply, and the older sentence and the row "No project folder" give the refusal.
- Case 3: met. With one word, the folder is made ("idea" item 3), and the row "The sketch" fires: "gives no `<sketch file>` and no text read as the sketch".
- Case 4: met. With two words, "A `<sketch file>` that does not exist is the refusal "No sketch file"" still applies.
- Case 5: partial. "What it reads" 1 and "full" item 2 give the sketch handed to `idea`, no folder made and the folder asked for. The same Steps 1 entry-point bullet still competes (Standards 1).
- Case 6: met. The bullet "A line the session writes in "The idea", such as a summary of what a round settled, stands unquoted" takes the session's summary out of the quotes. The bullet "quotes only the user's words: the sketch from the progress file and the user's answers" quotes the sketch and "(a), but ...". The option-taken bullet adds the unquoted option line below it.
- Case 7: met. The option-taken bullet covers `Agree`, and "2 Agree" is quoted with the option stated unquoted, named by round and choice.
- Case 8: met. Line 14's first alternative, "the idea or the candidate claims as the user gave them, each line quoted", is unchanged for a page made by `novelty`, and the diff touches no line of the example.

## 1. Spec

- none. The change to the Stops row "No project folder" is not named by an item, but rule 19 of the change standard requires it for item 1. The builder reports it under its judgment calls with the item it serves, as rule 20 asks. The only ADR that governs the change is ADR 0054. Its Decision says nothing of the call's arguments or of the page's quoted idea, and the diff does not contradict it. `deviations.md` records that `idea` and `references/novelty_page.md` are this repository's own, so no deviation line is due.

## 2. Proof

- none. Every count, path and line number the builder's report quotes was reproduced by the reviewer's rerun: the numstat, `wc -l`, the base-tree line numbers of the premise correction, the glossary lines and the private-name grep.

## 3. Standards

- Standards 1, about `SKILL.md` Quick start (lines 15 and 16) and Steps 1 (the bullets at lines 90 and 91, and the bullet "Any other call that matches no line of Quick start is read against `agents/pipeline_orchestrator_agent.md`, "1. Intent Detection", and `references/mode_advisor.md`, and the line it matches is the stop "The entry point"").
  - The quoted hunk: none. The diff leaves these lines unchanged, and they still list `idea` and `full` only as `<project folder> [<sketch file>]`.
  - What is wrong: `docs/dev/skill-layout.md`, "Sections, in order", row 2, says Quick start is "A code block with every invocation". The new call `/researcher idea <a sentence>` (and the same call of `full`) is an invocation, and no line lists it.
  - What is wrong, continued: Steps 1 sends a call that "matches no line of Quick start" to the stop "The entry point". On the base tree the builder's own first read of Case 1 applied exactly this bullet ("The call also matches no Quick start line, which Steps 1's last bullets send to the stop "The entry point""). After the diff the call still matches no Quick start line literally.
  - What is wrong, continued: the builder's reason for leaving Quick start and Steps 1 as they stand ends with "The step is at 19 lines, under its limit of 20". That reason is the cost of the work, which the lazy-option rule says is never a reason. Adding the lines would make the step a full step, and that is the orchestrator's decision to take, never a reason to leave the text competing. Change standard rule 19 (no two statements that contradict) also applies.
  - Failure scenario: an agent that runs `/researcher idea Cayley-Menger determinant: ...` reads Steps 1 in order. It finds no Quick start line with more than two arguments and raises the stop "The entry point" with the line of `idea`, instead of taking the sketch and asking for the folder at the stop "The project folder". A user who reads Quick start does not learn that a sentence call is accepted.
  - The fix would be a Quick start line each for `idea` and `full`, such as `/researcher idea <sketch, more than two words>`, and the same form in the Steps 1 bullets at lines 90 and 91. That fix is small, inside the step's paths and inside items 1 and 2.
  - Verdict: makes Case 1 and Case 5 partial.
- Standards 2, about `SKILL.md` "What it reads" 1, the older sentences.
  - The quoted hunk: ""`<idea>` is a sentence in quotes, ...; every other argument is a path." ... "A call of `idea` with no `<project folder>` is the refusal "No project folder"" ... "A call of `research`, `research adopt`, `full` or `revision` with no `<project folder>` is the refusal "No project folder"". ... "For `research` and `full`, a `<project folder>` that does not exist is made, a new project", followed later by the new "In place of the refusal "No project folder", its first message asks for the `<project folder>"".
  - What is wrong: four sentences of the item still state, without qualification, rules that the new sentence overrides for a sentence call:
    - every other argument is a path;
    - `idea` with no folder is refused;
    - `full` with no folder is refused;
    - a missing `full` folder is made.
  - What is wrong, continued: the exception comes two to eight sentences later in the same item. That satisfies the letter of "Lists and tables" (the qualifier is in the same item). But change standard rule 19 asks that no two statements contradict each other. The first sentence a reader meets on the refusal says the opposite of the later one, and "every other argument is a path" is now false for a sentence call.
  - Failure scenario: an agent that applies the first matching sentence of item 1 reads `Cayley-Menger` as a path, as "every other argument is a path" says. For `full` it may make that folder ("For `research` and `full`, a `<project folder>` that does not exist is made") before it reaches "makes no folder from it". The run then ends with a stray folder or with the refusal "No sketch file".
  - The fix would be to carry the qualifier into those sentences ("with no word after the mode", "every other argument of a call of two arguments or fewer is a path"), or to put the new sentence before them.
  - Verdict: none (the items hold on the places they name). This is fixable at landing inside item 1.
- Standards 3, about `SKILL.md` Stops, the new row "The project folder", cell What resumes it, read against "idea" items 1 and 2.
  - The quoted hunk: "| The user's project folder, made when it does not exist, a new project ("idea" item 3), and the run goes on with the call's sketch |".
  - What is wrong: "idea" item 1 says "An interview continued skips items 2 and 3", and item 2's reopening "takes the section that stands and the reopening evidence in place of a sketch". So when the folder the user gives holds an unfinished progress file or a README with claims, the call's sketch is not used, against the row's "the run goes on with the call's sketch". The same gap exists on the base tree for a `<sketch file>`, but the new row states the promise outright. This falls under change standard rule 19.
  - Failure scenario: the user types a sentence call, then gives an existing project folder whose newest progress file holds open choices. The session continues the old interview, and the sentence the user typed is dropped without a word, although the row told the reader it would be used.
  - The fix would be for the row (or "idea" item 1) to say what happens to the call's sketch then. It could be shown beside the continued interview, or stated as set aside.
  - Verdict: none. This is minor, and it could be fixed at landing or raised.

## 4. Behaviour

- none. The report's "Host- or user-visible changes" gives each change with its before and after: the sentence call of `idea`, the sentence call of `full`, a page made by `idea`, and a page made by `novelty` unchanged. Its judgment calls state the change to the refusal row "No project folder". One case follows from decision 2 of the brief and is covered by the report's general line "`<text of more than two words>`": `/researcher idea projects/demo I want ...` with an existing folder now asks for the folder again, and the path becomes part of the sketch.

## Declined to judge

- Whether a model running the skill would in practice route a sentence call to the stop "The entry point" (Standards 1). I did not judge this, because it needs a run of the skill and a read cannot settle it. The finding rests on the text alone.
- Whether adding the Quick start and Steps 1 lines, which takes the step to 20 lines or more and so to a full step, is done at landing or as a repair. I did not judge this, because it is the orchestrator's decision under the small-text-step rules.
- Whether README.md line 34 should also name the sentence call. I did not judge this, because README.md is outside the brief's paths and its sentence is still true as written. If Standards 1 is fixed by a Quick start line, the README row is the next place a grep of the new line would reach.
- Whether the brief's line numbers "read on main at 6d04bf5", against base 04f2bd5, change any premise. I did not check this, because it would need `git show 6d04bf5:<path>`, which is outside the three git commands I may run. The premises reproduce on the base tree, except the line numbers of the novelty-page bullets, which the builder corrected and I reproduced.

Reviewer usage: a25f4c569eaec55b5, claude-opus-5-5, 126075 tokens, 22 tool uses, 3m 19s.

## Closed

- Standards 1: fixed on main at landing; Quick start has the lines `/researcher idea <sketch, more than two words>` and `/researcher full <sketch, more than two words>`, and the two bullets of Steps 1 that list the lines of `idea` and `full` name them.
- Standards 2: fixed on main at landing; the exception stands in the sentence "every other argument is a path", and the refusals read "A call of `idea` with no argument" and "or of `full` with no argument".
- Standards 3: fixed on main at landing; the row "The project folder" says that an interview continued or a reopening sets the call's sketch aside, as it does a `<sketch file>`, and that its first round says so.
