# The writer agents

A writer agent changes the files of `<out>` that it is given and no other file. Each writer is a fresh agent that does one task. The session never makes these changes itself.

## Rules for every writer

- The text of a passage line, `> [@<key>, <locator>]: "<passage>"`, is quoted source text. No writer changes a character of it. A writer removes a passage line only together with its citation.
- A claim is supported by a passage line copied unchanged from `<work>/passages/<key>.md`. A writer adds no claim that has no such passage, and fetches and searches nothing.
- Under each paragraph that cites, there is one passage line for each key the paragraph cites.
- Every sentence outside the passage lines follows the prose standard at the path given.
- A style profile, when given, is a soft guide for the wording of the summary and the thematic synthesis. The conventions of the discipline and the objectivity of the report come first.
- A marked gap has the form `[GAP: <what is missing>]`.
- The final message names each change that was asked for and not made, with the reason.

## The revision

Two revision writers run, the first after the first review and the second after the second. Each is given `<out>/report.md`, `<out>/sources.md`, `<work>/editor-<n>.md`, `<work>/devils-advocate-<n>.md`, `<work>/passages/`, the number `<n>`, the prose standard, the style profile or none, and the second-model status when a command failed.

1. List every issue of the editor and of the devil's advocate with its number, its source and its category: Critical, Major, Minor or Suggestion. An Observation needs no action.
2. In revision 1, address every Critical and Major issue. In revision 2, address every Critical and Major issue still open, then every Minor issue and every Suggestion that is viable.
3. Fix an issue by changing the text. When a conclusion goes beyond the evidence, weaken it to match the evidence, or support it with a passage already extracted. When no passage supports it, write a marked gap.
4. Answer an issue you do not apply with a reason in the log. The devil's advocate scores such a reply on its second pass.
5. Keep a section "Revision log" in `report.md` with the columns Issue, Source, Severity, Action and Status. The status is Resolved, Answered or Acknowledged. Add the rows of this revision to the rows of the earlier one.
6. In revision 2, move each issue of Major severity or above that is still open to a section "Acknowledged limitations", with what remains and why. The section holds "none" when it is empty.
7. When the session gives a second-model status, write one sentence in the method section: the program name of the command, and its exit status or that it was not found.
8. Update `sources.md` only when the sources the report uses have changed.

The task is done when each issue has a row in the log and the report still has one passage line for each key cited in each paragraph.

## The prose pass

The prose pass applies the findings of `/writing` that the user picked. The writer is given `<out>/report.md`, the picked findings with their places, quotes and named rules, and the prose standard.

1. For each picked finding, rewrite the quoted passage so that it follows the named rule. Keep the claim, its citations and its passage lines.
2. A finding whose quoted text lies inside a passage line is not applied. The final message names it.
3. A finding on a table cell, a heading or a list item is applied to that text.
4. Apply only the picked findings, and change no other sentence.

The task is done when each picked finding is applied or named as not applied.

## The bibliography

The bibliography writer is given `<out>/report.md` and `<work>/candidates.bib`.

1. List every key cited in `report.md`, including each key after a semicolon in a multi-key citation, in order of first citation.
2. Write `<out>/references.bib` holding, for each cited key, its entry copied unchanged from `candidates.bib`, and no entry of a key the report does not cite.
3. A cited key that `candidates.bib` lacks is left out and named in the final message.

The task is done when the keys of `references.bib` are exactly the keys the report cites, except those named in the final message.

## The removals

The removal writer is given the output of `lookup.py check-urls` and of `lookup.py quote-check`, unchanged, with `<out>/report.md`, `<out>/references.bib`, `<out>/sources.md` and `<work>/passages/`. Each output line names a failure. Every line names a key except `line <n>: malformed passage line` and `the report cites no key`. Handle each line by its failure.

1. A key with "no identifier", "no entry" or "no entry in references.bib" is a source whose identifier no lookup confirmed. List it under "References not confirmed" with the lines the two commands printed for the key, unchanged.
2. A key with "no text" that item 1 does not list is a source with no text. List it under "Sources not accessed" with every URL tried and what each returned, as `sources.md` gives them.
3. For a key listed under either section, remove every citation of the key from the report with its passage line, and remove its entry from `references.bib`. The key is cited in no paragraph afterwards.
4. For a passage that is "not found", a malformed passage line, or a cited key with "no passage", remove that citation and its passage line only. Take the key out of a multi-key citation and leave the others.
5. A claim whose citation was removed becomes a marked gap that says the claim has no source that could be confirmed. When another found passage of the same or another source supports the claim, it keeps that citation and is no gap.
6. A source whose other passages are found stays cited, and is listed in neither section. Remove from `references.bib` each entry whose key the report no longer cites.
7. A `check-urls` status other than 2xx for a source whose text was read and whose passages are found keeps the source cited. Write the status beside the source in `sources.md`.

The task is done when no key listed under a section is cited, no failing citation stays in the report, and each listed source appears once.

## The checks

The checks writer is given the output of the last run of `lookup.py check-urls` and of `lookup.py quote-check`, with the exit status of each, and `<out>/report.md`.

1. Add a section "Checks of citations" as the last section of `report.md`, after every other section. `quote-check` numbered the lines of `report.md` as it stood before this section, so each line number it prints is the line of the final file. `check-urls` prints no line numbers.
2. Put the two outputs in it unchanged, each in a code block with its exit status above it.
3. Change nothing else.

The task is done when the last section of `report.md` holds both outputs as they were printed.
