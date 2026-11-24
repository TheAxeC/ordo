# Step 2 refuter report (on .agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-2, base bacb674)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

Every command ran from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The figure script ran on a copy of `docs/figures` in the scratch folder.

```
sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, ... and writes nothing with --check-only
sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
PASS: check_limits.py reads the page count of the log beside the PDF, ... and for a grant-fields.md that is not UTF-8 or holds a heading twice
sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, ... and for a Sections table that lacks a column
python3 docs/figures/gen_figures.py; echo "exit $?"   (on a scratch copy of docs/figures)
wrote docs/figures/pipeline.svg (21941 bytes) ... wrote docs/figures/paper/run-folder.svg (21112 bytes)
exit 0
diff -r <scratch copy>/docs/figures <worktree>/docs/figures   -> no difference (the committed SVGs are what the script writes)
git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/grant.svg
 M docs/figures/paper/full.svg
git diff bacb674 --name-only -z | xargs -0 perl -CSD -ne '<the brief's character-set program>'; echo "ascii exit $?"
ascii exit 0
grep -rn 'venue-compliant' skills; echo "grep exit $?"
grep exit 1
python3 -c '<description lengths>' | sort -n | tail -4
1019 skills/code/codebase-design/SKILL.md
1022 skills/academic/grant/SKILL.md
1022 skills/orchestration/roadmap/SKILL.md
1023 skills/academic/referee/SKILL.md
grep -n 'version:' skills/academic/paper/SKILL.md skills/academic/grant/SKILL.md skills/academic/writing/SKILL.md
skills/academic/writing/SKILL.md:5:  version: "2.2.0"
skills/academic/paper/SKILL.md:5:  version: "5.0.0"
skills/academic/grant/SKILL.md:5:  version: "2.0.0"
grep -rnEi 'limit' skills/academic/paper skills/academic/grant   (filtered to page, word, length, trim, cut, fit, exceed, over; every hit read)
-> no sentence changes a layout value to meet a limit; the hits that concern a length limit cut content (paper Steps 15, draft_writer_agent.md "The limit cut", grant Steps 10) or report (formatter_agent.md, intake_agent.md, journal_submission_guide.md, revision_tracking_template.md, grant intake.md)
grep -rnEi 'margin|font size|spacing' skills README.md docs/dev   (every hit read)
-> no hit changes a margin, a font size or a spacing to gain room; paper SKILL.md:1051 and draft_writer_agent.md:671 forbid it; formatter_agent.md:546 (verbatim font for page width) is unchanged
Section-length command of paper Steps 15, on a scratch .tex with a title, an abstract, a cite, a figure caption and \bibliography:
0 (before the first heading)
11 # Introduction
3 # Methods
1 ## Data
The same command on a scratch .tex with \begin{thebibliography} after a two-word section:
0 (before the first heading)
33 # Conclusion
Page-count command of paper Steps 15 on a scratch log whose statement is broken across lines, and on a one-page log:
Output written on main.pdf (13 pages
Output written on main.pdf (1 page
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `formatter_agent.md`, "Conflict precedence: the layout the venue states", holds the rule of the item; the intake's bullet and its citation use the same heading; the checklist line "IF exceeds" reports for the cut; the pre-submission rule for a page limit stays `for the author` and names the limit and its file. `grep -rn 'venue-compliant' skills` prints nothing.
- 2: violated, Spec 1 (the recount uses a second word counter the brief did not name). The rest of the item holds: Steps 15, full item 12 (count before the targets), Steps 12's list, Steps 13's recount, Steps 14, format-convert items 9 and 11, disclosure item 3, no Stops row, `draft_writer_agent.md` "The limit cut", the `limit-cut` row of `revision_patch_protocol.md`.
- 3: holds. The Failure paths row agrees with Steps 15.
- 4: holds, with Spec 3 and Behaviour 1 on what the new text leaves out. Steps 10, draft items 7, 8, 9 and 11, revise items 3 and 5; the form-field sentence and the description are unchanged.
- 5: holds. Section H of `manuscript-prose-standard.md`; `writing` SKILL.md gives it to the sentence agent only, and both sentences that name the page's sections say "G and H". Standards 1 is about the wording the brief dictated.
- 6: holds. 0026 Decision gains section H; 0036 Decision, "Deviations from academic-paper", gains the bullet naming 0050; 0043 Status and 0050 Consequences name the three places. No other decision text changed (`git diff bacb674 -- docs/adr` shows four one-line hunks, those above).
- 7: holds. 5.0.0, 2.0.0, 2.2.0.
- 8: holds. Both graphs gain a dashed box; the format-convert and disclosure graphs have no final-message node (`paper_format_convert_graph` and `paper_disclosure_graph` read); the README alt texts name the new boxes; the script on a copy writes SVGs identical to the committed ones.
- 9: holds. The greps of check 4 show no remaining sentence that fits a text by layout. The change to `citation_compliance_agent.md` is one item 9 requires (Spec 5).

Cases of the brief's "Cases":

- Full run, format profile with a font size, venue page limit, one page over: met by reading Steps 15 (page count from the log against the profile's page limit, one return, `limit-cut`), `formatter_agent.md` "Conflict precedence: the layout the venue states" and "The limit cut" (no layout value changed). Spec 2 says when such a page limit can exist at all.
- Full run over a declared word limit after the formatter's patches: met by reading Steps 15 (one return, incremental check of the cut's patch, reference checks and compile, count again) and full item 12 (targets after Steps 15). The recount is by another counter (Spec 1).
- The same run still over after the one return, or over again after the findings pass: met. Steps 15 "is not cut again"; Steps 13 "with no further return"; Steps 14 names it with each section's length.
- Format-convert over the venue's word limit: met. Steps 15 "they cut nothing", format-convert item 11 names it, `paper` Rules forbid a layout change.
- `grant` revise over the page limit: met. Revise item 3 and Steps 10.
- `grant` draft one page over: met for a run on the whole application. Draft item 8, Steps 10 (one resume, `limit-cut`, Steps 9 again), draft item 11. Spec 3 covers a run on one section.
- `grant` form field over its limit: met. "A field over its limit goes to the draft writer, resumed, once, and the two commands run again." stands unchanged.
- The sentence "In an earlier version of this section we reported the effect differently": met. Section H names that sentence as its example, and `writing` SKILL.md gives the rule to the sentence agent.
- `grep -rn 'venue-compliant' skills`: met, no line.
- A verbatim block wider than the page: met. `formatter_agent.md:546` is unchanged by the diff.

## 1. Spec

- `skills/academic/paper/SKILL.md:322-324`: "In full and format-convert the first word count is the formatter's, the row Word Count of \"Format Specifications Applied\" in `format-report.md`." / "Every other word count is the sum of the section lengths of the next bullet." What is wrong: item 2 names one count, "the formatter's word count against a declared word limit", and says "the compile and the count are then taken again". The builder substituted a second counter for every count after the first: a command that leaves out the title and the abstract and counts citation keys and caption tokens. The formatter's row has no defined scope (`formatter_agent.md`, "| Word Count | [N] words |"). Format-convert item 9 already computes a third count, `pandoc --citeproc ... -t plain | wc -w`. Under rule 4 of the rules file the substitute is the orchestrator's to write, and the report lists it as judgment call 1 rather than a stop. Failure scenario: the declared word limit is 8000. The formatter counts 8150 words with a 250-word abstract. The draft writer cuts 100 words. The recount by section sum leaves the abstract out and gives about 7800, so the run says the manuscript is within the limit, although by the first count it is still 50 words over. In format-convert, the final message gives a count over the limit next to section lengths that add up to less than the limit. Verdict: item 2 violated.
- `skills/academic/paper/agents/intake_agent.md:97` (unchanged) against `skills/academic/paper/SKILL.md:321`: "Do you want to record the venue's declared limits (word limit, abstract limit, keyword range, required sections, reference ceiling, blind-review model)?" against "A declared limit is a word limit or a page limit that the venue profile of the row Venue Profile of `config.md` states." What is wrong: the venue profile that Steps 15 reads for a page limit is filled only from this question, and the question asks for no page limit. The page-limit half of item 2 and of ruling D4 therefore runs only when the user states a page limit unasked. `intake_agent.md` is among the paths the step writes. The builder confirmed this (brief point 3) and left it unchanged as academic-paper's wording. Failure scenario: a user whose venue limits the paper to 10 pages answers the follow-up with the fields it lists. No page limit is recorded, and a 12-page manuscript ends the full run with no count, no cut and no line in the final message. No verdict; the case reading holds once a page limit is declared. Changing a copied sentence of academic-paper is a deviation to record under ADR 0036, so this is for the orchestrator to decide.
- `skills/academic/grant/SKILL.md:123-132` (Steps 10) against draft item 9 (`:249`) and draft item 2 (`:194`): Steps 10 sends the whole application to the draft writer to cut, with no section restriction. The same skill keeps a run on one section to that section: "For a run on one section the outline holds that section only." and "In a run on one section the direction says that the patch changes lines of that section only, and the session reads the patch's ops against the section's line range before it applies the patch". What is wrong: a `limit-cut` patch in a run on one section can change sections the run was never asked to touch, and it gets none of the line-range check that the findings patch of the same run gets. The brief's item 4 does not settle the case. Failure scenario: `/grant draft` on the section "Methods" of an application whose other sections are the user's finished text compiles one page over. The draft writer cuts 300 words from "State of the art", and the patch is applied without the user having confirmed that section at the stop "The outline".
- `skills/academic/paper/agents/formatter_agent.md:561` and `:902-904` against `skills/academic/paper/SKILL.md:321`: "-> IF exceeds -> report the manuscript over its limit, with the limit and its file, for the cut of `SKILL.md`, Steps 15" and "A word limit that a file of the run declares is held against the count ..." against Steps 15, which counts only a limit "that the venue profile of the row Venue Profile of `config.md` states". What is wrong: the formatter reports a limit from any file of the run (the venue's template or another file of Existing Materials) as over and as headed for the cut, but Steps 15 never counts that limit or cuts for it. Failure scenario: a full run whose venue template states "at most 6000 words" and which has no venue profile. The formatter's pre-submission check gives `not met` and its checklist says the manuscript goes to the cut. Steps 15 takes no count, makes no return, and the final message says nothing about the limit.
- `skills/academic/paper/agents/citation_compliance_agent.md:858`: "the reference fix, the compile fix, the limit cut and the findings pass." What is wrong: the page is outside the brief's "Paths this step writes", which allows other pages only where items 3, 5 and 7 find them. Item 9 requires this change, since the old sentence would be false. The change is correct and the path list is incomplete. Failure scenario: none in the shipped text. A landing that holds the step to its path list alone would drop a needed change. No verdict.
- `skills/academic/paper/SKILL.md:320`, `:745` and `skills/academic/paper/SKILL.md`, disclosure item 3: "Full, format-convert and disclosure use this step" and "Take the count against the declared limits (Steps 15). The run cuts nothing, and the final message names a manuscript over a declared limit." What is wrong: item 2 of the brief asks for this. Disclosure has no intake agent and asks only for a selector (Steps 6: the modes with no intake agent "take what they need from the call"; disclosure item 1). Its `config.md` therefore never holds the row Venue Profile, disclosure makes no compile, and Steps 15 always ends at its second bullet. The text can never act. The builder reports this as brief point 2. Failure scenario: a reader of disclosure mode expects an over-limit manuscript to be named in a disclosure run, and no disclosure run ever names one. No verdict; this is the orchestrator's to settle with the brief.
- `skills/academic/paper/agents/formatter_agent.md:129`, `skills/academic/paper/agents/intake_agent.md:131` and `docs/adr/0036-*.md`, Decision, "Deviations from academic-paper": "A value the venue does not state comes from the declared format profile, and with no profile it is the current default." against ADR 0050's Decision: "In `paper` and `grant`, the layout (font, size, line spacing, margins) is only what the venue or the funder states, and is never changed to meet a limit." What is wrong: read literally, the new rule lets the layout come from the user's format profile or from a default, and ADR 0050 says it is only what the venue states. The brief asked for this wording (item 1). Ruling D4 says the same as 0050 ("the layout is only ever what the venue or funder states"). Under "Finding dispositions" this is a rule clash the brief asked for, so it goes to the user, or under `self_rule: on` to the orchestrator. Failure scenario: a later reviewer who holds a step to 0050's sentence finds a 12pt profile font, which no venue states, and raises it as a breach of 0050. No verdict.

## 2. Proof

- `skills/academic/paper/SKILL.md:324`: "Each section's length in words is taken with `pandoc '<main>.tex' -t markdown | awk ...`, which prints the words under each heading, with the title, the abstract and the reference list left out." What is wrong: the reviewer's run on a scratch `.tex` with `\begin{thebibliography}` printed `33 # Conclusion` for a two-word section. Pandoc writes the hand-set list as a `::: thebibliography` block, and the command counts it into the last section. With `\bibliography{}` the list is left out, as the sentence says. The figure caption and the citation key are counted as words, which the sentence does not say. Decision that rests on it: the count against the word limit, after the first count and in format-convert's section lengths. Failure scenario: format-convert of a user's `.tex` with a reference list set by hand and a 5000-word limit. Seventy references add about 1500 words to "Conclusion", and the recount and the final message's section lengths report a manuscript over its limit by the length of its reference list. Verdict: item 2 violated, with Spec 1.

## 3. Standards

- `skills/academic/writing/references/manuscript-prose-standard.md`, "H. The deliverable": "Every sentence of a deliverable answers the reader or states a change, and the text holds no process history: what was tried, what was changed since an earlier version, or how the text came about." What is wrong: rule 19 of `docs/dev/change-standard.md` (no two statements that contradict each other). The sentence permits "states a change" and in the same breath forbids "what was changed since an earlier version", which is what a resubmission's cover letter states. The rule's own example ("Section 3 now reports the effect for each cohort") settles it in practice. The words of the first sentence come from item 5 of the brief. Failure scenario: the sentence agent of `/writing` reads a resubmission cover letter that says "Section 3 now reports the effect for each cohort", and it can cite the rule's own words for a finding that the example says is no finding. No verdict.
- `skills/academic/paper/agents/draft_writer_agent.md:666` against `skills/academic/grant/SKILL.md:125-126`: "which the session sends once after the formatter's patches in full mode (`SKILL.md`, Steps 15). The session gives the limit with its file, the count, and each section's length in words." `grant`'s Steps 10 also sends this task. Its direction gives "the page limit, the page count of the last compile and the lines `check_limits.py` printed", with no file of the limit and no length in words for each section. What is wrong: rule 19 of the rules file. The page that `grant` points its draft writer to says the task comes only from `paper` full mode and with inputs that `grant` does not give. Failure scenario: `grant`'s draft writer reads "The limit cut", looks for each section's length in words and for the limit's file in its direction, finds neither, and counts the sections itself. Its report then gives words for a section whose limit is in characters.

## 4. Behaviour

- `skills/academic/grant/SKILL.md:131`: "A run that made no cut takes them from `draft-report.md` of `draft` item 5 in `draft`, and from the lines `check_limits.py` printed in `revise`." What is wrong: in `draft`, an application that goes over the page limit only after the findings pass, or that was over before the cut but whose cut ran no report, has its section lengths taken from the report of the first draft. That report was written before the layout patch, the compile fix and the findings pass. `check_limits.py` prints the current count of every section with a word or character limit after each compile (its head comment, "ok:" and "over:" lines), and `revise` already uses it. The report lists this as judgment call 6 but not with the case in which the numbers are stale. Failure scenario: the findings pass adds 400 words to section "1.b" and the compile becomes one page over. The final message gives section 1.b at its first-draft length, under its limit, while the last `check_limits.py` run in `checks.md` prints `over: 1.b ...`. The user is told the wrong section length.

## Declined to judge

- The claim (judgment call 7) that a bypass arrow in `paper_full_graph()` makes `gen_figures.py` stop with an edge-label error. Checking it would mean changing the script, even in a copy, which the reviewer's rules forbid.
- Every one of the 273 `limit` hits the report counts. The reviewer read the hits that concern a page, a word count, a length, a trim, a cut, a fit, an excess or an overage (listed above), not the hits on rate limits, search limits or "limited".
- Check 7 of the brief (sentence length and list items against the standards pages). The reviewer did not read each new bullet against `docs/dev/skill-layout.md`, "Lists and tables"; the report's list of departures is not reproduced.
- Whether the venue profile YAML would store a page limit the user states unasked, given "a field the scholar does not state stays null" and no field list. Settling it needs a run of the intake agent.
- Whether a `config.md` row Venue Profile that reads `absent` counts as "no such row" under Steps 15. A run of full mode with a declined follow-up would show it. By reading, "whose profile states neither" covers it in effect.
- What git ignores in the worktree, and the tree after staging, would need a git command outside the three the reviewer may run (`git status --short --ignored`, `git add -n`).

Reviewer usage: a98a16ecb5987063a, claude-opus-5-5, 219080 tokens, 49 tool uses, 9 min 6 s.

## Repair round 1, refuted

```
(from the worktree root, under env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE)
sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environmen...
sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's...
sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
PASS: check_limits.py reads the page count of the log beside the PDF, a statement of one page and a broken one...
sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, mi...
python3 gen_figures.py on a copy of docs/figures in my scratch folder; echo "exit $?"
(23 "wrote" lines, last three paper/response-letter, lifecycle, run-folder) exit 0
cmp of the copy's grant.svg and paper/full.svg with the worktree's: identical
git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/grant.svg
 M docs/figures/paper/full.svg
character-set check over the 17 files of git diff --name-only bacb674 outside .scratch: no output, exit 0
grep -rn 'venue-compliant' skills: no line, exit 1
description lengths: highest 1023 (skills/academic/referee/SKILL.md), none above 1024
grep -n 'version:' ...: writing "2.2.0", paper "5.0.0", grant "2.0.0"
```

The round's word-count command (Steps 15 of `paper`, line 322, extracted from the page by script, `<main>.tex` replaced by `main.tex`), run on my own scratch files. Each has a title, a 5-word abstract, a 6-word text before the first heading, a figure caption of 3 words, `\cite{smith2024}` mid-sentence, the sections Introduction (with a subsection Data) and Methods, and a reference list. `a/main.tex` ends with `\bibliography{refs}`, `b/main.tex` with a `thebibliography` environment of one 7-word item.

```
a and b, identical output, exit 0:
5 (abstract)
6 (before the first heading)
9 Introduction
1 Data
3 Methods
24 (total)
c/main.tex, section "S" with the body "One two three four\cite{k}." (4 words, a citation, a full stop):
0 (abstract)
0 (before the first heading)
5 S
5 (total)
the builder's own lc2/a and lc2/b files, "One two three four \cite{smith2024}." then "Five six." and a 3-word caption:
10 Introduction
19 (total)
```

The page-count command of line 326 on the builder's two compile logs prints `Output written on main.pdf (1 page` for each.

### Verdicts

Items of the brief's "What to build", for the whole diff since bacb674:

- 1: holds. `formatter_agent.md` line 129 and the checklist and "Word/Page Limit" lines state the rule, and `grep -rn 'venue-compliant' skills` prints nothing. The "Ensure word count compliance" line (Standards 2) is not part of item 1.
- 2: violated, Proof 1 (the sentence on what the command counts is false) and Spec 1 (no sentence names the number held against a limit). The return, the `limit-cut` patch, the incremental check, the recount after the findings pass, the final message and the absent Stops row hold. Format-convert item 9 uses the command. Disclosure is out of Steps 15 and its item 3 equals the base (`git diff bacb674 -- skills/academic/paper/SKILL.md | grep -n -i disclosure` shows no hunk in the disclosure section).
- 3: holds. The Failure paths row (line 929) agrees with Steps 15.
- 4: holds. Grant Steps 10 has the one-section bound (ruling 3) and the `check_limits.py` lengths (ruling 10). `draft` items 8, 9 and 11, `revise` items 3 and 5, the form-field sentence and the description are as before.
- 5: holds. Section H keeps "states a change" and the process-history list now reads "what an earlier version of the text said". `writing/SKILL.md` gives H to the sentence agent only.
- 6: violated, Standards 1 (ADR 0026's Decision now quotes a list the page no longer holds). ADR 0036 names the cut and the page limit, ADR 0050 and 0043 name the three places, and format-convert alone is named in the 0036 bullet.
- 7: holds. paper 5.0.0, grant 2.0.0, writing 2.2.0.
- 8: holds. The copy-run SVGs equal the committed ones. `gen_figures.py` shows the cut only in the full figure (line 1376) and in grant (line 1998), and no figure or README sentence names a count in disclosure.
- 9: violated, Standards 2 (formatter "Ensure word count compliance") and Standards 3 (README paper row, which the builder named).

Cases of the brief's "Cases":

- Full run, format profile with a font size, venue page limit, one page over: met by reading Steps 15 (page count from the log, one return with `limit-cut`) and formatter line 129 (no layout value changed). It needs the venue's page limit to reach the profile, which intake line 97 now asks for.
- Full run over a declared word limit: met in sequence (one return, incremental check, reference checks and compile, count again, then targets). The number compared with the limit is unspecified, Spec 1.
- Still over after the return, or over after the findings pass: met (Steps 15 and Steps 13, no second return).
- Format-convert over a word limit: met (Steps 15, format-convert item 9, nothing cut). The count is again the one of Spec 1.
- `grant revise` over the page limit: met (Steps 10, `revise` items 3 and 5).
- `grant draft` one page over: met for the whole application (one resume, `limit-cut`, both scripts again). A run on one section is now bound to that section's lines.
- `grant` form field over its limit: met, the sentence at line 295 is unchanged.
- "In an earlier version of this section we reported the effect differently": met (section H's example, given to the sentence agent).
- `grep -rn 'venue-compliant' skills`: met.
- Verbatim block wider than the page: met, no hunk touches it.

### Findings

1. Spec

- `skills/academic/paper/SKILL.md`, Steps 15, bullets 322 to 330, and `agents/formatter_agent.md` lines 129, 297 and 560 to 562: "A count above its limit is over that limit." and "Its direction gives the limit with its file, the count and each part's length". What is wrong: the command prints a total that includes the abstract and the text before the first heading, plus one line per part. No sentence says which printed number is held against a declared word limit, or which against an abstract limit, which the formatter's page lists as a requirement to check (lines 86 and 634). A venue limit that excludes the abstract is common, and the page leaves the choice to each session. Failure scenario: a venue states 3000 words for the text without the abstract, the manuscript's body is 2950 and its abstract 150. One session compares the total 3100 and sends the manuscript back to the draft writer for a cut it does not need. Another compares the body and counts nothing over. The same manuscript is cut in one run and left alone in the other. Verdict: item 2 violated.

2. Proof

- `skills/academic/paper/SKILL.md:324`: "It counts the words of the body, the captions included and each citation key as one word." What is wrong: the command counts no citation key. Pandoc without `--citeproc` reads `\cite{k}` as a Cite node whose content is a RawInline, and the command counts only Str nodes. In the builder's file the Introduction's 10 is 4 + 2 + 3 caption words + the "." Str that stands after the Cite, not the key (my run on `c/main.tex`: 4 words, a citation and a full stop print 5). The command therefore adds one word for each punctuation mark that follows a citation (also one after an inline formula or any other node that splits the Str), and counts the citation itself as nothing. The round's ruling 1 required the sentence to say what the command counts as it runs. The builder's report gives "the key (1)" as the reason for 10, and my rerun on its own file shows otherwise. The decision resting on it: the count against a word limit and the lengths the draft writer is told. Failure scenario: a manuscript with 120 citations, most followed by a comma or full stop, is counted 80 to 120 words too high, and a manuscript 60 words under its limit is reported over and sent to the draft writer to cut content that the venue did not ask to be cut. Verdict: item 2 violated.

3. Standards

- `docs/adr/0026-*.md`, Decision: "no process history: what was tried, what was changed since an earlier version, or how the text came about (ADR 0050)." What is wrong: ruling 8 changed the list on the page to "what an earlier version of the text said", and added the sentence that a change the reader asked for is no process history. ADR 0026 is not in the round's path list and still holds the old wording, which is the wording the ruling removed because it contradicted "states a change" (rule 19 of `docs/dev/change-standard.md`, no two statements that contradict each other, and the rule "A change carries to every place that names it"). Failure scenario: a reader of the ADR takes "what was changed since an earlier version" as forbidden, as the page's first version did, and holds a resubmission's cover letter to it. Verdict: item 6 violated. Closed by changing that clause of the ADR to the page's list.
- `skills/academic/paper/agents/formatter_agent.md:99`: "Ensure word count compliance". What is wrong: the page says elsewhere that the formatter takes no count and makes no cut (line 129, lines 560 to 562, lines 902 to 904, Steps 15). This sentence in "Step 2: Apply Formatting" tells the formatter to make the text comply, and brief item 9 asks that any sentence that tells an agent to make a text fit be changed. The builder left it as copied wording of academic-paper, but it is one of the sentences the change makes contradictory. Failure scenario: the formatter, told to ensure compliance, trims words or tightens a layout value to reach the limit, which ADR 0050 forbids and which Steps 15 gives to the draft writer once. Verdict: item 9 violated.
- `README.md:30` (the `paper` row): "a full run over a word or page limit the venue profile declares goes back to the draft writer once to cut content". What is wrong: Steps 15 now counts a limit that the venue profile or another file of the run declares. The builder named this sentence and left it for the landing. It is inside the step's brief (the step's path list holds `README.md`) and is a small fix, "the venue profile declares" to "a file of the run declares". Failure scenario: a user whose template states a limit and who has no profile reads the README and expects no count, and the run counts and cuts. Verdict: item 9 violated.

4. Behaviour

- none.

### Declined to judge

- Whether `format-report.md` of a real formatter run names a limit in the line "Format profile applied (if declared)" when a venue profile declares a limit but no format profile is declared: the page ties the naming to a line that holds the qualifier "(if declared)" and to the "Pre-submission checks" section of a journal run only. This needs a run of the formatter, which a read cannot give, so I raise it as a reading and not as a finding.
- Pandoc's reading of `\cite`, a `thebibliography` Div and a Figure caption is from pandoc 3.11 on this machine, and I did not check other versions.
- Ruling 7, ADR 0050's "only what the venue or the funder states" against "comes from the declared format profile": unchanged on purpose and open item E of the state file, so it is not judged.
- The ruling 5 claim "no change was needed in the tree": the path list lives in the ledger, which I do not read for edits. The change to `citation_compliance_agent.md` stands in the diff and is correct.

Reviewer usage: ab9fe8e68965015ba, claude-sonnet-5-5, 150292 tokens, 36 tool uses, 4 min 15 s.

## Closed

- Spec 1 and Proof 1 (the word counters), Spec 2 (the page limit in the intake's question), Spec 3 (`grant`, a run on one section), Spec 4 (which limits are counted), Spec 6 (disclosure), Standards 1 (section H), Standards 2 (the limit cut's two senders) and Behaviour 1 (`grant`'s section lengths) of the first run: closed in round 1, in the report's section "Repair round 1".
- Spec 5 of the first run, `citation_compliance_agent.md` outside the path list: the change stands; the round's brief adds the file to the step's paths.
- Spec 7 of the first run, the layout value the venue does not state: raised to the user as open item E of the state file.
- Proof 1 of the run over round 1, the sentence on what the command counts: fixed at landing. The command counts a token only when it holds a letter or a digit, and the sentence reads "A citation and a formula count as no word, and so does a punctuation mark that stands apart from a word." Run on two scratch files, one per form of reference list: both print 5, 6, 11, 1, 3 and the total 26.
- Spec 1 of the run over round 1, which number is held against a limit: fixed at landing by one bullet of Steps 15 (the total against a word limit, less the abstract's line where the limit's file leaves the abstract out; the abstract's line against an abstract limit).
- Standards 1 of the run over round 1, ADR 0026's clause: fixed at landing, the clause reads "what an earlier version of the text said".
- Standards 2 of the run over round 1, the formatter's "Ensure word count compliance": fixed at landing, the line names the limits for the session's count and says the formatter cuts nothing.
- Standards 3 of the run over round 1, the `paper` row of `README.md`: fixed at landing, "a file of the run declares".
