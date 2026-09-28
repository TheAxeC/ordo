---
name: writing
description: "Check a text file against the prose standard and the writing reference pages, and list each problem with its line and the rule it breaks, changing nothing. Triggers on: writing, check the prose, check this draft, prose check, style check, check the writing."
metadata:
  version: "1.0.0"
---

# Writing check

`/writing <file>` checks a text file against the prose standard and the writing reference pages. It leaves a list of problems in the conversation, each with its line and rule, and writes no file.

## Quick start

```
/writing <file>                                        check the file and list each problem with its line
/writing <file> --limit '<section heading>=<words>'    the same, with a word limit for the named section
```

## Use instead

| When | Use |
|---|---|
| A built plan step, reviewed against its brief before it lands | `/refute <entry> <step>` |
| The rules that the reviews of past plans keep finding broken | `/plan-retro` |

## What it reads

1. The file named, `<file>`: a `.md` file as Markdown, a `.tex` file as LaTeX and any other file as plain text.
   - A file that is missing, a directory, unreadable or not UTF-8 is a refusal ("Stops"), the script's exit 64.
2. `references/prose-standard.md`, for its sections 0 and A to F, which every file is read against.
3. `references/anti-patterns.md`, for the patterns judged by hand and the variation in sentence length each section of a text needs.
4. `references/academic-prose.md`, for an academic text as Steps 3 defines it: its terms, hedging, transitions, paragraph shape, wordy and vague forms and tense per section.
5. `references/judgment.md`, for an academic text: the clarity test, the reader's four questions, the voice of each discipline and the "so what" of each section.
6. Each `--limit '<section heading>=<words>'`, the most words the named section may hold, passed on to the script.
   - A value not in that form is a refusal ("Stops"), the script's exit 64.

## Steps

1. Run `python3 <this skill's folder>/templates/check_prose.py [--limit '<section heading>=<words>']... <file>` and read its output and its exit status.
   - Exit 0 means the script flagged nothing, and exit 1 means it printed one line per flag.
   - Exit 64 is a refusal that prints the script's error ("Stops").
2. Judge each flag the script prints against the rule it names.
   - A `flagged`, `filler` or `vague` word is allowed where prose standard, section A, exempts it: a flagged word that is standard terminology in the text's discipline, a temporal "just", or a "just" that states a genuine minimum.
   - A `flagged`, `filler` or `vague` word is allowed where the text quotes it as an example rather than using it.
   - A `flagged`, `filler` or `vague` word is allowed in a heading that the layout the text follows requires, such as "Quick start".
   - An `equal-length` report is judged by the variation that `references/anti-patterns.md` gives the section the run stands in.
   - A `history` flag is a problem where its words say when a rule, a spec, a skill, a rules page or a code comment was made, what came before it, or which step or session wrote it: prose standard, section 0.
   - A `history` flag is allowed, with the reason, everywhere else. Such places are a text or section whose subject is past events, a text section 0 does not cover (a README, a user page, a paper's Results), a quoted example, and words that state no history, such as "no longer" for a present condition or "Step 0" as the name of a section.
   - A `section-words` flag of a section over its limit is a problem, and its line cites the `--limit` it exceeds.
   - A `section-words` flag at line 1 that says no heading matches a `--limit` is no problem of the text. It is listed under "Script flags kept as allowed", with the `--limit` to correct as the reason.
   - A flag of another check is allowed only where the page that holds its rule exempts the instance, such as a dash inside a quotation, which `references/academic-prose.md` leaves to be judged by hand.
3. Read the whole text against the rules the script does not check.
   - For every file: the patterns of `references/anti-patterns.md` judged by hand, and sections 0 and A to F of `references/prose-standard.md`.
   - For an academic text, a `.tex` file or a file the user names as a manuscript, proposal or paper: `references/academic-prose.md` and `references/judgment.md` as well.
4. List the problems in line order, in the shape "The problem list" gives.
   - Each flag the script prints is one line of the list, so two flags on one line of the text stay two lines.
   - A script flag that Steps 2 judged a problem is listed under the script's check name.
   - A problem found by reading in Steps 3 is listed under the name of the reference page that holds the rule.
   - A script flag that Steps 2 judged allowed is listed apart, under the line "Script flags kept as allowed", with the reason it is allowed.
5. End with the list, leaving the file as it was ("Rules").

## The problem list

Each problem is one line:

```text
<file>:<line>: <source>: "<text>": <the rule broken and what to change>
```

- `<source>` is the script's check name for a script flag, such as `semicolons` or `dash-aside`.
- `<source>` is the reference page's file name without `.md` for a problem found by reading: `prose-standard`, `academic-prose`, `judgment` or `anti-patterns`.
- For a script flag, `<file>:<line>: <check>: "<text>"` is exactly what the script prints, and only the message after it is rewritten as the rule and the change.
- For a problem found by reading, `<text>` is the text the problem stands in, in double quotes and at most 60 characters.
- A file with no problem and no allowed flag gets the one line `<file>: no problem found`, such as `README.md: no problem found`.

An example of each kind of line, for a draft `paper.tex`:

```text
paper.tex:5: dash-aside: "baseline --- converges": a dash as an aside, prose standard, section 0; rewrite with commas or parentheses
paper.tex:5: dash-aside: "method --- unlike": a dash as an aside, prose standard, section 0; rewrite with commas or parentheses
paper.tex:7: judgment: "A t-test was run on the two groups ($p < 0.01$).": the Results section opens with the statistical test, judgment, the "so what" of each section; open with the finding
paper.tex:8: academic-prose: "The response rate appeared to be 78\%.": reported data hedged, academic-prose, When not to hedge; state the figure without the hedge
Script flags kept as allowed
paper.tex:4: flagged: "robust": standard terminology in statistics, a "robust estimator", prose standard, section A
```

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No stop | The skill never waits on the user; the rows below are refusals, which name their cause and leave nothing | Nothing | Nothing |
| An unusable file | No file is named, or the file is missing, a directory, unreadable or not UTF-8: the script exits 64 | The script's error and its usage line | A readable UTF-8 file, then `/writing <file>` again |
| A bad `--limit` | A `--limit` has no value, or its value is not `<heading text>=<positive whole number>`: the script exits 64 | The script's error and its usage line | A `--limit` in that form, then `/writing` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Rewriting the file, or a part of it | The user asked for a check, and the rewrite changes text the user has not reviewed | "Rules", and the list of Steps 4 |
| Dropping a script flag without a stated reason | A reader cannot tell a false alarm from a missed problem | Steps 4: the flag under "Script flags kept as allowed", with its reason |
| Listing a problem without its line | The user cannot find the text to change | "The problem list" |
| Taking the script's exit 0 as a clean text | The script finds the mechanical rules only, and the patterns judged by hand still apply | Steps 3 |

## Rules

- The skill writes nothing: the file checked and every other file stay as they were.
- Every listed problem names the rule it breaks, as Steps 2 and "The problem list" give it.
