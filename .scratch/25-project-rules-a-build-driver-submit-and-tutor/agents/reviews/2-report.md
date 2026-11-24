# Report: step 2, a length limit is met by cutting content

Everything in the brief is done. Three points need the orchestrator's reading: the second word counter of `paper` (judgment call 1), the disclosure count that never runs (brief point 2), and a page the brief's path list does not name (brief point 1).

## Open items of the state file, verbatim

- Open item A (step 1, the user's reading of the rules): the five rules stand on their pages on main and wait for your reading: `skills/ordo/ordo-init/templates/shared-rules.md` (the bullets "An effort question is answered with the changes", "Every option meets every stated wish", "Every target in scope works", "An open item is for costs the user weighs"), `skills/orchestration/plan-orchestration/SKILL.md`, "Stops" (two sub-bullets under the stop-message bullet), rules 6 and 16 of `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` and of `docs/dev/change-standard.md`, and "Markdown and YAML" of `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`. Two rules were narrowed from the goal's words after the review: the open-items rule to "an open item that offers options", since the plan skills also hold open items with no options (your reading of a page, a worktree that could not be removed, a diff to approve), and the effort rule to "a change to the repository", since `paper`'s revision coach gives a typical duration for a manuscript revision. One point is yours: neither page says what is done with a decision whose options do not each cost something. Option 1, leave it unsaid: the pages hold the goal's rule and nothing more; a reader gets no instruction for that case. Option 2, add "the recommended option is taken and the report states it": it tells the reader what to do, and the second review found that this sentence contradicts "No silent design decisions" and "Surface rule clashes" in the shared rules unless it excepts them. Recommendation: option 1, which is also the option that costs less to carry out; it is recommended because the other rules already say when a decision is raised. The reading blocks no later step.

## The cases' first read, on the unchanged tree (base bacb674)

None of the cases is wrong under the brief's rules. Each reading below was made before any change, with the command shown.

| Case | Reading on the unchanged tree |
|---|---|
| Full run, format profile font size, venue page limit, one page over | `grep -rn 'venue-compliant' skills` printed `formatter_agent.md:127` (the formatter applies the venue-compliant layout value) and `intake_agent.md:131`. `grep -n -i 'page limit\|over its limit\|over the limit\|limit-cut' skills/academic/paper/SKILL.md` printed nothing. The layout was changed, and there was no return |
| Full run over a declared word limit after the formatter's patches | `grep -n -A2 'Word/Page Limit' formatter_agent.md` printed `559-    -> IF exceeds -> suggest sections to trim`. There was no return, no recount and no incremental check of a cut |
| The same run still over, or over again after the findings pass | The same greps: no return, and no final message with section lengths |
| Format-convert over the venue's word limit | Nothing was cut. The formatter's line 127 could change a layout value. The over-limit result reached the final message only as a `not met` pre-submission check for a journal venue (`formatter_agent.md:902`, "since the formatter has no page count") |
| `grant` revise over the page limit | `grep -n 'over the page limit\|limit-cut' skills/academic/grant/SKILL.md` printed only `247:` (draft's message). There was no return in either mode |
| `grant` draft one page over | The same line 247: the message said which compile was over, with no cut |
| `grant` form field over its limit | `279:   - A field over its limit goes to the draft writer, resumed, once, and the two commands run again.` The expected result already held |
| The sentence "In an earlier version of this section we reported the effect differently" | `grep -n -i 'process history\|earlier version'` over the writing pages and the prose standard printed nothing. No rule and no agent covered it |
| `grep -rn 'venue-compliant' skills` | Printed 2 lines (above) |
| Verbatim block wider than the page | `546:- If verbatim content exceeds page width, use fontsize=\small or \footnotesize`. The expected result already held |

## DONE / NOT DONE

| # | Item or check | State | Command and output as printed |
|---|---|---|---|
| 1 | Formatter and intake: the rule replaced, the heading and its citation agree, the checklist line, the page-limit rule | DONE | `grep -rn 'Conflict precedence' skills/academic/paper/agents` gives the formatter heading `### Conflict precedence: the layout the venue states` and the intake's two citations of it (passages quoted below) |
| 2 | Full mode: count, return once, `limit-cut`, incremental check, reference fix, still-over naming, recount after the findings pass, format-convert and disclosure, no stop, draft writer section, protocol id | DONE | `paper` SKILL.md Steps 15, full item 12, Steps 12, 13 and 14, format-convert items 9 and 11, disclosure item 3. `draft_writer_agent.md`, "The limit cut". `revision_patch_protocol.md`, row `limit-cut` |
| 3 | Failure paths row | DONE | Quoted below |
| 4 | `grant` draft and revise | DONE | `grant` SKILL.md Steps 10, draft items 7, 8, 9 and 11, revise items 3 and 5. The description is unchanged: `git diff bacb674 -- skills/academic/grant/SKILL.md \| grep '^[-+]description'` printed nothing |
| 5 | Manuscript prose standard rule, given to one agent | DONE | Section H on the page. `writing` SKILL.md:188 `- The sentence agent also gets the rule "H. The deliverable / No process history".` Lines 87 and 183 now name "sections G and H" |
| 6 | ADRs 0026, 0036, 0043 Status, 0050 | DONE | `git diff --numstat` gives 1/1, 1/0, 1/1, 1/1 |
| 7 | Versions | DONE | Check 6 below |
| 8 | Figures and alt text | DONE | Check 1 below. README alt text quoted below |
| 9 | Other places the change makes false | DONE | Greps of check 4, plus `citation_compliance_agent.md:858` (brief point 1) |
| V1 | The four tests and the figure script | DONE | `PASS: anchorize_tex.py leaves the .tex byte-identical, ...`, `PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks ...`, `PASS: check_limits.py reads the page count of the log beside the PDF, ...`, `PASS: check_sections.py prints ok for each heading ...`. `python3 docs/figures/gen_figures.py; echo "exit $?"` printed `exit 0`. `git status --short docs/figures` printed ` M docs/figures/gen_figures.py`, ` M docs/figures/grant.svg`, ` M docs/figures/paper/full.svg`. The tests were not run on the base before the change. The step changes no script, as `git diff --stat bacb674 -- 'skills/*/templates/*'` printing nothing shows, so each test ran the same code it runs on the base |
| V2 | Character-set check over the changed files | DONE | `git diff --name-only -z \| xargs -0 perl -CSD -ne '<the brief's program>'; echo "ascii exit $?"` printed only `ascii exit 0` |
| V3 | `grep -rn 'venue-compliant' skills` | DONE | Printed nothing, exit 1 |
| V4 | Limit, margin, font size and spacing greps, each hit read | DONE | Hits listed under "Check 4" below |
| V5 | Description lengths | DONE | The highest counts printed are `1022 skills/academic/grant/SKILL.md`, `1022 skills/orchestration/roadmap/SKILL.md` and `1023 skills/academic/referee/SKILL.md`. None is above 1024 |
| V6 | Versions | DONE | `skills/academic/writing/SKILL.md:5:  version: "2.2.0"`, `skills/academic/grant/SKILL.md:5:  version: "2.0.0"`, `skills/academic/paper/SKILL.md:5:  version: "5.0.0"` |
| V7 | List items and sentence length | DONE | Departures are listed under "Check 7" below |

### Check 4: every hit that concerns meeting a length limit

The hits of `grep -rnEi 'limit' skills/academic/paper skills/academic/grant` total 273 once `limitation` is left out. They were read by file. Most are about other things: a rate limit, a search limit, "limited", or the scripts' own counts. These hits concern meeting a length limit:

- `paper` SKILL.md, Steps 12, 13, 14 and 15, full item 12, format-convert items 9 and 11, disclosure item 3, Failure paths, Rules: cuts content (full) or reports (format-convert, disclosure).
- `formatter_agent.md:85-86` (the checklist of journal requirements), `:560-562` (Word/Page Limit), `:566` and `:634` (abstract word limit), `:297` (the Format Compliance line), `:902-904` (the pre-submission rules): reports.
- `formatter_agent.md:702` "IF requires user judgment (e.g., word limit exceeded) -> flag as reminder": reports. Unchanged, academic-paper's text.
- `draft_writer_agent.md:664-670` (The limit cut): cuts content. `:215`, `:316-317`, `:343`, `:361`, the trims against a section's target: cut content, unchanged.
- `structure_architect_agent.md:203` "proportionally trim from largest section": cuts content against the allocation, unchanged.
- `revision_patch_protocol.md:99`: cuts content.
- `templates/revision_tracking_template.md:194` "Word count is within the journal's limit after revisions": reports, unchanged.
- `journal_submission_guide.md:18, 31`: reports, unchanged.
- `intake_agent.md:95, 97, 131`: the venue profile's limits; line 131 reports, with no layout changed.
- `grant` SKILL.md Steps 9 and 10, draft items 2, 5, 7, 8, 9 and 11, revise items 3 and 5: cuts content (Steps 10) or reports. "draft of a form field" item 4 (line 292): cuts content, unchanged.
- `grant/references/intake.md:55, 78, 96, 125`: report a target or a limit, unchanged.
- `grant/templates/check_limits.py`, its test and `check_sections.py`: report. The scripts are unchanged.

Every hit of `grep -rnEi 'margin|font size|spacing' skills README.md docs/dev` was read. No hit changes a margin, a font size or a spacing to meet a length limit. The hits are:

- The CSS of `codebase-design/references/report.md`: unchanged, not a length limit.
- `paper` SKILL.md:634, reference `.docx` options, and :689-690, `.bbl` macros: unchanged, not a length limit.
- `paper` SKILL.md:1047, the new rule: forbids it.
- `latex_template_reference.md:14, 15, 25, 177, 322`, the venue's layout: unchanged, not a length limit.
- `visualization_agent.md:16, 92, 275`, figure readability: unchanged, not a length limit.
- `intake_agent.md:126`, the format-profile question: unchanged, not a length limit.
- `draft_writer_agent.md:671`: forbids it.
- The examples `revision_mode_example.md:38, 174` (figure font) and `revision_recovery_example.md:87, 346` (paragraph words): unchanged, not a length limit.
- `formatter_agent.md:66, 123, 294, 472-473, 628, 834`, layout specifications: unchanged, not a length limit. `:129`: forbids it.
- `formatter_agent.md:546`, the verbatim font: unchanged, not a length limit.
- `formatter_agent.md:725`, "font may be smaller (10pt)" for a conference paper: the venue's stated layout, unchanged, not a length limit.
- The `literature_strategist`, `paper-review-panel` and `perspective_reviewer` "marginal" hits: unchanged, not a length limit.
- `grant` SKILL.md:224, `fwo-postdoc-2027.md:37-39`, `config_drafter_agent.md:37`, `funder_config_template.md:33-35`, the funder's layout: unchanged, not a length limit.
- `docs/dev/scripts.md:26`, `reference_docx.py`'s job: unchanged, not a length limit.
- The script hits (`reference_docx.py` with its test, `lookup.py` with its test, `latex_article_template.tex`, `check_sections.test.sh`): unchanged, not a length limit.

### Check 7: list items and sentence length

Each new bullet was read against `docs/dev/skill-layout.md`, "Lists and tables". Bullets that joined two rules were split. These depart from the rules:

- Some sentences run past about 20 words, because they hold one mechanism with its command or its list of sources:
  - `paper` Steps 15, the section-length bullet, which carries an awk command.
  - The page-count bullet, which carries the log reading.
  - The return bullet.
  - `grant` Steps 10, the source of the lengths.
  - The formatter's new paragraph, which names the layout fields.
- The `paper` Failure paths cell holds two sentences. The row is a table row, and the brief asks for that cell to change.
- `grant` Steps 10's lengths bullet holds three sentences. The second and the third say where the lengths come from, which is a qualifier of the first.

## Changed passages, before and after

**`skills/academic/paper/agents/formatter_agent.md`, "Format Profile".**

- Heading before: `### Conflict precedence: venue compliance wins`
- Heading after: `### Conflict precedence: the layout the venue states`
- Before: "... this is that one principle applied to layout. Where a declared layout field would push the manuscript past a declared `venue_profile` limit (e.g. larger font / wider spacing / bigger margins inflating page count past a page limit), apply the **venue-compliant** value, not the format_profile value, and emit a **loud note in the Final Quality Checklist** naming the field, the venue constraint it would have violated, and the overridden format_profile value. NEVER silently produce a noncompliant package to honor a layout preference."
- After: the first sentence stays. A new paragraph follows it:

  > **Paper's addition: the layout is never changed to meet a limit.** A layout value the venue states, in its template or in another file the run gives, is used. A value the venue does not state comes from the declared format profile, and with no profile it is the current default. No layout value (font, size, line spacing, margins) is ever changed to gain room, and a manuscript over a declared `venue_profile` limit is not made to fit by layout: the Final Quality Checklist reports it over its limit, with the limit and its file, and in full mode the session sends it to the draft writer to cut content (`SKILL.md`, Steps 15).

**The same page, "Final Quality Checklist".** Before: `any venue-compliance override noted (field + violated venue constraint + overridden value)`. After: `a manuscript over a declared limit noted (limit + its file), with no layout value changed to gain room`.

**The same page, "Journal Submission Format Adjustment Checklist".** Before: `-> IF exceeds -> suggest sections to trim`. After: `-> IF exceeds -> report the manuscript over its limit, with the limit and its file, for the cut of SKILL.md, Steps 15; change no layout value`.

**The same page, "The pre-submission checks".** Before: `since the formatter has no page count`. After: `since the session takes the page count (SKILL.md, Steps 15)`.

**`skills/academic/paper/agents/intake_agent.md`, Steps 3 and 5.**

- Line 95, before: `("Conflict precedence: venue compliance wins" of ...)`. After: `("Conflict precedence: the layout the venue states" of ...)`.
- Line 131, before: `- **Venue compliance wins:** ... the formatter applies the venue-compliant value and notes the override; it never silently ships a noncompliant package to honor a layout preference.`
- Line 131, after: `- **Paper's addition: the layout the venue states:** the recorded layout is a rendering preference. A layout value the venue states is used, and a value the venue does not state comes from this profile. No layout value is ever changed to gain room, and a manuscript over a declared venue_profile limit is not made to fit by layout ("Conflict precedence: the layout the venue states" of agents/formatter_agent.md).`

**`skills/academic/paper/SKILL.md`.**

- New Steps 15, "Take the count against the declared limits, and in full mode send a manuscript over a limit back to the draft writer once". It holds 20 bullets: the declared limit, the counts, the commands, the return, `limit-cut`, the incremental check, the reference checks and compile, no second cut, the final message, no stop, format-convert and disclosure, and the done criterion.
- Full item 12, before: "Apply its patches (Steps 10), compile again (Steps 11), and make each target ...".
- Full item 12, after: "Apply its patches (Steps 10) and compile again (Steps 11)." / "Take the count against the declared limits (Steps 15) before any target is made. ..." / "Then make each target ...". Its done criterion gains Steps 15.
- Steps 12, the list of later patches, gains "the limit cut (Steps 15)".
- Steps 13 gains: "In full mode the count of Steps 15 is then taken again. A manuscript then over a declared limit is named in the message that ends the reply, as Steps 15 names it, with no further return to the draft writer."
- Steps 14 gains: "In full mode it names a manuscript still over a declared limit, and says when the page limit was not checked (Steps 15)."
- Format-convert item 9 gains the count with the page count of item 7's compile. Item 11 gains: "It names a manuscript over a declared limit, with the count against the limit and each section's length in words, and says that the run cut nothing (Steps 15)."
- Disclosure item 3 gains: "Take the count against the declared limits (Steps 15). The run cuts nothing, and the final message names a manuscript over a declared limit."
- The lead of Steps: "Steps 7 to 14" became "Steps 7 to 15".
- Failure paths, before: `| Word count significantly over/under target | Identify problematic chapters, suggest trimming/expansion |`.
- Failure paths, after: `| Word count significantly over/under target | The draft writer trims or expands a section against its target as it drafts. A manuscript over a declared limit goes back to the draft writer once to cut content in full mode, and what is still over is named in the final message (Steps 15) |`.
- Rules gain: "No layout value (font, size, line spacing, margins) is changed to gain room, in any mode. The layout is what the venue or the format profile states (agents/formatter_agent.md, "Conflict precedence: the layout the venue states"), and a manuscript over a declared limit is cut by the draft writer in full mode (Steps 15)."

**`skills/academic/paper/agents/draft_writer_agent.md`.** A new section, "The limit cut", stands under "Paper's addition: the LaTeX manuscript", after "The compile fix". It holds:

- what the cut reads: the manuscript with its manifests, and `outline.md` and `arguments.md` when the run has them;
- the order of the cut: redundant argument first, then the material the argument needs least;
- the words to cut for a page limit;
- no layout value, no float's size and no font changed;
- every claim, number and citation of a kept sentence kept;
- the trace-table rows removed with their statements, in full mode;
- what its report gives: each section's length before and after, what was cut, and each section left as it was, with the reason.

**`skills/academic/paper/references/revision_patch_protocol.md`.** The ids table gains a row: `| limit-cut | The draft writer | A manuscript over a declared word or page limit after the formatter's patches in full mode, by a cut of content (agents/draft_writer_agent.md, "The limit cut") |`.

**`skills/academic/paper/agents/citation_compliance_agent.md`, "The incremental check".** Before: "... the reference fix, the compile fix and the findings pass." After: "... the reference fix, the compile fix, the limit cut and the findings pass."

**`skills/academic/grant/SKILL.md`.**

- New Steps 10, "Cut an application whose compile is over the page limit". It holds:
  - when the application is over the page limit: a line `over:` for `(whole document)` in pages;
  - the draft writer resumed once, and `revise`'s writer;
  - the direction;
  - `limit-cut`, and its incremental check in `draft`;
  - Steps 9 run again;
  - once in a run;
  - the message, with the source of each section's length;
  - the done criterion.
- The lead of Steps: "Items 6 to 9" became "Items 6 to 10".
- Draft item 7 gains: "No value of the layout is changed to gain room: the layout stays what the "Layout" of the funder config states, and an application over its page limit is cut by the draft writer (Steps 10)."
- Draft item 8 and revise item 3 each gain: "An application over the page limit goes back to the draft writer once, before the writing review (Steps 10)." Their done criteria name Steps 10.
- Draft item 9 gains: "An application then over the page limit is named in the message that ends the run, as Steps 10 says, with no further return to the draft writer."
- Draft item 11 and revise item 5 each gain: "An application still over the page limit is given with each section's length against its limit, as Steps 10 says."
- The sentence "A field over its limit goes to the draft writer, resumed, once, and the two commands run again." is unchanged.

**`skills/academic/writing/references/manuscript-prose-standard.md`.** A new section:

> ## H. The deliverable
>
> - **No process history.** Every sentence of a deliverable answers the reader or states a change, and the text holds no process history: what was tried, what was changed since an earlier version, or how the text came about. The cover letter of a resubmission states a change to the manuscript, such as "Section 3 now reports the effect for each cohort". A paper never writes "In an earlier version of this section we reported the effect differently". Both examples are made up for this page.

**`skills/academic/writing/SKILL.md`.**

- Line 87, "its section G is given", became "its sections G and H are given".
- Line 183, "and its own section G.", became "and its own sections G and H."
- New line 188: `- The sentence agent also gets the rule "H. The deliverable / No process history".`

**ADRs.**

- 0026 Decision gains: "Its section H holds that every sentence of a deliverable answers the reader or states a change, and that the text holds no process history: what was tried, what was changed since an earlier version, or how the text came about (ADR 0050)."
- 0036 Decision, "Deviations from academic-paper", gains a bullet: the layout is only what the venue or the declared format profile states; full mode's one return by `limit-cut`; format-convert and disclosure cut nothing (ADR 0050). Its reason: a layout changed to gain room is one the venue did not state, and a suggestion to trim leaves a manuscript over its limit.
- 0043 Status line, before: "superseded by 0050 in the formatter's sentence that applies a venue-compliant layout value to meet a limit".
- 0043 Status line, after: the same, followed by ", in its copy on the intake's page, and in the list of the draft writer's resumed tasks of Decision 3, which gains the cut of a manuscript over a declared limit".
- 0050 Consequences, before: "This record supersedes ADR 0043 in that one sentence of the formatter's page."
- 0050 Consequences, after: "This record supersedes ADR 0043 in three places: the formatter's sentence that applies a venue-compliant layout value to meet a limit, its copy on the intake's page, and the list of the draft writer's resumed tasks of 0043's Decision 3, which gains the cut of a manuscript over a declared limit."

**Figures and README.**

- `paper_full_graph()` gains the dashed box "Draft writer, resumed: content cut once, when over a declared word or page limit", between the formatter and `/writing`.
- `grant()` gains the dashed box "Draft writer, resumed: content cut once, when the compile is over the page limit", between the formatter and the writing findings. Its note now says that the scripts run "again after the cut and after the review's patch", and that revise "ends with the same cut and the same writing review".
- The README alt text of each figure names the new box in its place.
- The README rows of `paper` and `grant` each gain one sentence on the cut (judgment call 4).

## The modes of `paper` that got the return, and where the deviation is recorded

- Full mode only (`paper` SKILL.md, Steps 15 and full item 12).
- Format-convert and disclosure cut nothing and name the over-limit result in the final message.
- The deviation is recorded in ADR 0036's Decision, "Deviations from academic-paper", naming 0050, and in 0043's Status line and 0050's Consequences.
- The new text on the agent pages is marked "Paper's addition". SKILL.md marks no addition of its own, so the new Steps 15 is not marked (judgment call 3).

## Terms

The diff adds no glossary term and changes none. It uses these terms of `docs/glossary.md` in new places:

- "incremental citation check": the limit cut's patch in `paper` Steps 12 and 15, `citation_compliance_agent.md:858` and `grant` Steps 10. This is the sense the entry defines, a later patch of the draft writer.
- "stop": "The return raises no stop".
- "funder config": `grant` draft item 7.

## Files with line counts (`git diff --numstat`, added and removed)

- README.md 4/4
- docs/adr/0026-*.md 1/1
- docs/adr/0036-*.md 1/0
- docs/adr/0043-*.md 1/1
- docs/adr/0050-*.md 1/1
- docs/figures/gen_figures.py 11/4
- docs/figures/grant.svg 42/35
- docs/figures/paper/full.svg 46/40
- skills/academic/grant/SKILL.md 20/4
- skills/academic/paper/SKILL.md 35/7
- skills/academic/paper/agents/citation_compliance_agent.md 1/1
- skills/academic/paper/agents/draft_writer_agent.md 12/0
- skills/academic/paper/agents/formatter_agent.md 7/5
- skills/academic/paper/agents/intake_agent.md 2/2
- skills/academic/paper/references/revision_patch_protocol.md 1/0
- skills/academic/writing/SKILL.md 4/3
- skills/academic/writing/references/manuscript-prose-standard.md 4/0

## Judgment calls the brief left open

1. **The word counts after the first.** Item 2 names the formatter's word count for the first count, and that count is kept for full and format-convert.
   - The formatter runs no command (`paper` SKILL.md, format-convert item 4: "It writes no script and runs none"), so its count is the agent's own reading.
   - The brief does not say who counts again after the cut. No formatter runs then, so every later count is the sum of the section lengths that the session takes by command.
   - The command is `pandoc '<main>.tex' -t markdown | awk ...`. It counts the words under each heading, with the title, the abstract and the reference list left out. On a scratch `.tex` it printed `0 (before the first heading)`, `6 # Introduction`, `3 # Methods`, `1 ## Data`.
   - The result is that the first count and the recount come from two counters. If the orchestrator wants one counter, the substitute is to drop the formatter's count and take the first count by the same command too.
2. **The page count.** `tr -d '\n' < '<log>' | grep -o 'Output written on [^(]*([0-9]* pages\{0,1\}' | tail -1` reads the log the way `check_limits.py` does, with the line breaks removed. On the scratch compile it printed `Output written on main.pdf (1 page`.
3. **"Paper's addition" marking.** The new text on the agent pages is marked "Paper's addition" in the form those pages use. SKILL.md marks none of its own additions (Steps 7 to 14 carry no mark), so Steps 15 carries none either.
4. **README rows of `paper` and `grant`.** Each gains one sentence on the cut. This serves items 2 and 4 under rule 5 of the rules file, since those rows describe the skills' behaviour to the user.
5. **`grant` incremental check of the cut in `draft`.** The cut's patch gets the incremental check when the `paper` skill's Steps 12 gives it one, as the findings pass does in `draft` item 9. This serves item 4, since a cut that rewrites a cited sentence would otherwise go unchecked. `revise` checks no citation, as before.
6. **`grant` section lengths when the run made no cut** (an application over the limit only after the findings pass). In `draft` they come from `draft-report.md` of draft item 5. In `revise` they come from the lines of `check_limits.py`, since revise has no length report.
7. **The figures.**
   - In both figures the cut box stands on the path, dashed, with no bypass arrow. `grant()` already draws its dashed boxes that way.
   - In `paper/full.svg`, adding a bypass arrow, with or without a label, makes `gen_figures.py` stop with `error: paper/full.svg: the edge label 'your answer: resumed for the format work only' has no free place beside its arrow`.
   - The format-convert and disclosure graphs show no final message, so they are unchanged.
8. **The heading wording** is "Conflict precedence: the layout the venue states".

## User-visible changes

- **`paper` full run over a declared limit.** Before: a layout value could change, the checklist suggested sections to trim, and the run went on. After: no layout value changes, the draft writer cuts content once, the check and the compile run again, and a manuscript still over is named in the final message with each section's length in words.
- **`paper` format-convert.** Before: a layout value could change to meet a limit. After: nothing is cut, no layout value changes, and the final message names a manuscript over a declared limit.
- **`grant` draft and revise.** Before: the message said which compile was over the page limit. After: one cut by the draft writer and the compile and both scripts again. An application still over is given with each section's length against its limit.
- **`/writing` on a manuscript.** Before: no rule on process history. After: the sentence agent checks "H. The deliverable / No process history".
- **Versions.** `paper` 4.1.3 became 5.0.0, `grant` 1.0.1 became 2.0.0, and `writing` 2.1.2 became 2.2.0.

## What in the brief was wrong or impossible

1. **The path list leaves out a page that item 9 needs.** "Paths this step writes" allows other pages of `paper`, `grant` and `writing` only where items 3, 5 and 7 find them. Item 9 also requires every sentence the change makes false to be changed. `citation_compliance_agent.md:858` listed the patches that get the incremental check, and it would have been false without the limit cut. It was changed under item 9. It is the only file outside the named paths, found with `grep -rn 'incremental check' skills/academic/paper/agents/citation_compliance_agent.md`.
2. **The disclosure count has no limit to read.** Disclosure asks only for a selector (`paper` SKILL.md, Steps 6 and disclosure item 1), so its `config.md` never holds the row Venue Profile. Steps 15 therefore ends at its first bullet in disclosure. The sentences for disclosure hold as written, but a disclosure run names no over-limit manuscript in practice. Making it real would need disclosure to ask for the venue profile, which no item of the brief asks.
3. **A page limit may never be declared.** The intake's venue-profile question (`intake_agent.md:97`) lists word limit, abstract limit, keyword range, required sections, reference ceiling and blind-review model, but no page limit. So the page-limit case of Steps 15 arises only when the user states a page limit unasked. That sentence is academic-paper's copied wording and no item asks to change it, so it was left as it was.
