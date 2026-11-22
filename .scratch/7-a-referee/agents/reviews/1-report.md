# Step 1 report: the skill `referee`

Everything in the brief is done, as the cases ruling `agents/briefs/1-cases.md` changed it: the entry **round, of an interview** is not changed, by ruling 1.

## Open items of the state file, verbatim

- Open item 1 (step 1, raised 2026-11-22): does `paper-review-panel` name `referee`? Its triggers hold the phrase "referee report" (`skills/academic/paper-review-panel/SKILL.md`, the description and "What it reads" 3) and its "Use instead" does not name `referee`, so a plain request for a referee report can start the panel; `docs/dev/skill-layout.md`, "Frontmatter", puts a phrase for a neighbouring skill's case in that skill's triggers. Step 1 as briefed changes no file of the panel. (a) Remove the phrase from the panel's triggers and add a "Use instead" row for `referee`: a plain request reaches the right skill; it changes two places of the copy ruled in entry 6. (b) Leave the panel as it is: the copy stays untouched; the overlap stays. Recommended: (a). The lazy option is (b). The build of step 1 does not wait on it.

This is the text of the worktree's copy of the state file. The rewritten brief carries the item as ruled (a), in "The places that list a skill" 7, and this step builds it.

## The cases' first run

On the unchanged tree `ls skills/academic/referee` printed `ls: skills/academic/referee: No such file or directory`, so the first read of every case is: the skill does not exist and no text states the behaviour. The second column is the text that now states it.

| Case | First read | Where the built text states it |
|---|---|---|
| `/referee paper.pdf`, panel skill beside it | no skill | `SKILL.md`, Steps 1 to 3, then "first round" item 1: the intake "in one message, before any agent starts" |
| `/referee paper.pdf`, no panel folder | no skill | "What it reads" 1, Steps 1 first bullet ("before anything is written"), Stops row "The panel skill is not installed" |
| `/referee re-review revised.pdf`, no response letter | no skill | "What it reads" 3, Stops row "A missing input" |
| An intake with nothing named | no skill | "first round" item 1: "balanced", "medium", 7 major, 7 minor, 1,200 words, the default fields of the report template |
| Panel shrunk to the EIC and the methodology reviewer | no skill | "first round" item 4: the methodology-focus contract, two calls each, "A reviewer the intake left out is not started" |
| Panel shrunk to the methodology and the domain reviewer | no skill | "first round" item 4: "Any other shrunk panel runs each of its reviewers in one call, with no contract" |
| 60 comments, the default budget | no skill | `agents/referee_agent.md`, "The selection" 1, 5, 7, 8 and its closing paragraph; "first round" item 5's completion criterion |
| The user moves a left-out comment | no skill | "first round" item 6 (the referee is resumed with the user's changes) and `agents/referee_agent.md`, "The user's changes" |
| The report shows no panel, holds no roadmap | no skill | `agents/referee_agent.md`, "The report", bullets 3 to 5 and its last paragraph; Anti-patterns rows 2 and 4 |
| Second round, the all-five question unanswered | no skill | `references/second_round.md` items 2, 3, 4 ("Start no editorial synthesizer") and 5 ("Without that answer, start none of them") |
| Second round without the first-round comments | no skill | `references/second_round.md` item 1, fourth bullet |
| Both folders read side by side | the folder does not exist | No page is copied. Every panel page is named with its skill. The Rules on how an agent starts and on the run folder are written in this skill's own sentences |

Cases the brief's rules got wrong, handed back before any change, and the orchestrator's ruling (`agents/briefs/1-cases.md`):

1. The rule: "The places that list a skill" 5 asked the entry **round, of an interview** to gain words, in `docs/glossary.md`. The result: that entry is on line 107, inside the plan-terms block (markers on lines 5 and 140), which `sync_rules.py . --only glossary` compares with `skills/ordo/repo-setup/templates/plan-terms.md`, a file outside the step's paths, so the change would have made check 1 exit 1. Ruling: the entry is not changed in either file; only the new entry **round, of a referee review** is written, outside the block; no path is added.
2. The rule: the run folder, named with `<round>`, was made before the intake asked the round of a plain request that does not say it. The result: no folder name and no subsection for that request. Ruling: the round is settled when the call is read; `/referee re-review ...` is a second round, every other `/referee ...` call a first round; a plain request that says revision, second round or re-review is a second round; one that does not say it is asked once, a stop with its own Stops row; the intake no longer asks the round.
3. The point left unsaid: the EIC in a second round with all five reviewers. Ruling: the five are fresh agents under the full contract, the EIC among them, beside the EIC that made the check; the selection reads the EIC's check and the five reports.

Each is built as ruled: `SKILL.md`, Steps 1 and the Stops row "The round"; `references/second_round.md` item 5; `docs/glossary.md`, the new entry.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| Five files of the skill | DONE | `find skills/academic/referee -type f \| sort` prints `skills/academic/referee/agents/referee_agent.md`, `skills/academic/referee/references/second_round.md`, `skills/academic/referee/SKILL.md`, `skills/academic/referee/templates/referee_report_template.md`, `skills/academic/referee/templates/selection_template.md` |
| Check 1, the glossary | DONE | `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0 |
| Check 1, the character set | DONE | the brief's `printf ... \| xargs -0 perl ...` command over the 13 files prints nothing, exit 0 |
| Check 2, the figures | DONE | `python3 docs/figures/gen_figures.py` exit 0, its 21 lines below; `git status --short docs/figures` prints ` M docs/figures/gen_figures.py` and `?? docs/figures/referee.svg` |
| Check 3, the frontmatter | DONE | the brief's `python3 -c ...` prints `referee 882 1.0.0` |
| Check 4, the sections | DONE | `grep -n '^## ' skills/academic/referee/SKILL.md` prints `12:## Quick start`, `20:## Use instead`, `27:## What it reads`, `37:## Steps`, `103:## Stops`, `117:## Anti-patterns`, `126:## Rules`; the skill has no reference section |
| Check 5, the panel skill | DONE | `git status --short skills/academic/paper-review-panel` prints ` M skills/academic/paper-review-panel/SKILL.md`; `git diff --numstat -- skills/academic/paper-review-panel/SKILL.md` prints `4<tab>3<tab>skills/academic/paper-review-panel/SKILL.md` |
| Check 6, the reading | DONE | read; the departures are listed under "Lists and sentence length" |
| The listings | DONE | `git diff --numstat -- README.md docs skills` prints `8<tab>5<tab>README.md`, `1<tab>1<tab>docs/dev/building.md`, `1<tab>1<tab>docs/dev/scripts.md`, `46<tab>0<tab>docs/figures/gen_figures.py`, `2<tab>1<tab>docs/glossary.md`, `4<tab>3<tab>skills/academic/paper-review-panel/SKILL.md`, `2<tab>2<tab>skills/academic/paper/SKILL.md` |
| "eighteen skills" twice | DONE | `grep -n 'seventeen\|eighteen' README.md` prints lines 32 and 165 only, both "eighteen" |

The character-set check covers ASCII only. The checks above compute facts; whether the skill's text carries out each ruling is for the review to read.

The 21 lines of `python3 docs/figures/gen_figures.py`:

```
wrote docs/figures/pipeline.svg (22107 bytes)
wrote docs/figures/plan-loop.svg (21454 bytes)
wrote docs/figures/grill.svg (7455 bytes)
wrote docs/figures/writing.svg (5191 bytes)
wrote docs/figures/paper-review-panel.svg (12433 bytes)
wrote docs/figures/referee.svg (11620 bytes)
wrote docs/figures/code-comments.svg (5921 bytes)
wrote docs/figures/paper/full.svg (43468 bytes)
wrote docs/figures/paper/revision.svg (27596 bytes)
wrote docs/figures/paper/lit-review.svg (22537 bytes)
wrote docs/figures/paper/outline-only.svg (14761 bytes)
wrote docs/figures/paper/abstract-only.svg (4733 bytes)
wrote docs/figures/paper/citation-check.svg (12264 bytes)
wrote docs/figures/paper/disclosure.svg (7245 bytes)
wrote docs/figures/paper/plan.svg (9415 bytes)
wrote docs/figures/paper/format-convert.svg (11257 bytes)
wrote docs/figures/paper/revision-coach.svg (6681 bytes)
wrote docs/figures/paper/rebuttal-audit.svg (5779 bytes)
wrote docs/figures/paper/response-letter.svg (5981 bytes)
wrote docs/figures/paper/lifecycle.svg (21010 bytes)
wrote docs/figures/paper/run-folder.svg (21112 bytes)
```

A sentence about the figure script, checked by that run: it writes `referee.svg` beside the other figures and rewrites every other figure with the same bytes, since `git status --short docs/figures` lists no other figure file.

Rule 14, the grep for other places that list the skills: `grep -rn 'seventeen' README.md docs skills utils` (ADRs and the roadmap left out) prints nothing; `grep -rln 'paper-review-panel'` outside the two skill folders and `docs/adr/` prints `README.md`, `docs/glossary.md`, `docs/roadmap.md`, `docs/figures/gen_figures.py`, `docs/figures/paper-review-panel.svg`, `docs/figures/referee.svg`, `docs/figures/academic-pipeline/gen_academic_pipeline.py`, `docs/figures/academic-pipeline/academic-pipeline.svg`, `docs/dev/scripts.md`, `docs/dev/building.md`, `skills/academic/paper/SKILL.md`. The two academic-pipeline files draw the stages of another pipeline and list no skills, and `docs/roadmap.md` is the orchestrator's; the others are changed or generated.

## Lists and sentence length

Each new or changed item was read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, section E. The places that depart, each with why:

- `SKILL.md`, the opening paragraph's first sentence, about 30 words: it is the definition, with the two things the report is (one reviewer's, for the editor).
- `SKILL.md`, "first round" item 1, the five "Ask ..." bullets: each holds a question and its default in a second sentence; the default is the qualifier of that question.
- `SKILL.md`, Rules, the run-folder bullet: one rule with the two values of `<round>` and the form of `<date>`.
- `SKILL.md`, Rules, the bullet on how an agent starts: one rule (fresh, the general-purpose agent, the runner's defaults, no model, no effort), written as one sentence of 30 words.
- `agents/referee_agent.md`, "The selection" 1 to 6: a numbered method, where an item holds the action and the sentence that qualifies it.
- `README.md`, the row of `referee`: five sentences in one cell, as the rows of `paper` and `paper-review-panel` are.
- `docs/glossary.md`, the new entry: two sentences of about 28 words each, the definition and its scope.
- The `description` of `SKILL.md`: one paragraph, as the layout requires, with a first sentence that lists what a run does.

## The terms

- **referee review**: changed entry. Used in `SKILL.md`'s opening paragraph in the entry's sense. "Stated in: `skills/academic/referee/SKILL.md`, the introduction": `grep -n 'referee review' skills/academic/referee/SKILL.md` prints line 10, the opening paragraph.
- **round, of a referee review**: new entry, outside the plan-terms block, after **results check**. "Stated in: `skills/academic/referee/SKILL.md`, Steps 1 and Rules; `skills/academic/referee/references/second_round.md`": `grep -n 'round'` over Steps 1 prints its bullets on the first and the second round (lines 39 to 47), over Rules the run-folder bullets (lines 128 and 130), and `grep -c 'round' skills/academic/referee/references/second_round.md` prints 18.
- **round, of an interview**: unchanged, by ruling 1. Its sentence "elsewhere it is a repair round" still stands beside the new entry.
- **draft review**, **panel review**: used once each, in `SKILL.md`'s opening paragraph, in the entries' senses.
- **stop**, **refusal**: used in the second sense of **stop** (a point of a skill's Stops table) and in the sense of **refusal**.
- **step**: used as an item of a skill's Steps.
- **runner**, **session, the**: used in the entries' senses.
- **reviewer**: used for a reviewer of the panel, as `paper-review-panel` and the entry **panel review** use it, which is not the sense of the entry **reviewer**. The brief dictates the word.

## The files, with line counts

- `skills/academic/referee/SKILL.md`: 137 lines, new.
- `skills/academic/referee/agents/referee_agent.md`: 64 lines, new.
- `skills/academic/referee/references/second_round.md`: 54 lines, new.
- `skills/academic/referee/templates/selection_template.md`: 53 lines, new.
- `skills/academic/referee/templates/referee_report_template.md`: 31 lines, new.
- `docs/figures/referee.svg`: 63 lines, new, written by the script.
- `docs/figures/gen_figures.py`: 46 added, 0 removed.
- `README.md`: 8 added, 5 removed.
- `docs/dev/building.md`, `docs/dev/scripts.md`: 1 added, 1 removed each.
- `docs/glossary.md`: 2 added, 1 removed.
- `skills/academic/paper/SKILL.md`: 2 added, 2 removed.
- `skills/academic/paper-review-panel/SKILL.md`: 4 added, 3 removed.
- `.scratch/7-a-referee/agents/reviews/1-report.md`: this report.

## Judgment calls the brief left open

1. The Steps of `SKILL.md`: the brief's first-round items 1 and 2 (the call, the run folder) hold for both rounds, so they stand as Steps 1 and 2 above the two subsections, with Steps 3 running the round's items, the shape `paper-review-panel` has. "first round" then holds items 1 to 8, the brief's items 3 to 10.
2. The brief's first-round item 6 (no synthesizer, no roadmap, no coaching) is no action, so it has no item of its own. It stands as a bullet of item 5, a bullet of item 8 and the Anti-patterns row on the revision roadmap.
3. The rules of the selection and of the report stand whole in `agents/referee_agent.md`, the page the referee is given, and items 5 and 7 of "first round" name its sections, since the layout has a rule written once. Item 5's completion criterion keeps the two facts the session checks: both files stand, and the selection is within the budget.
4. The refusal of a second-round call without a response letter is raised at Steps 1, before the run folder, and `references/second_round.md` item 1 names it there.
5. The second round writes the EIC's check as `revision-check.md`, and its `selection.md` holds the list "First-round points resolved".
6. The intake also asks the values of the journal's recommendation, which the brief's report bullet takes from the intake.
7. `templates/selection_template.md` has a count line (comments in the reports, under a selected point, left out) and a Status line for a second round, and `left-out.md` is its section "Left-out comments" as it stands.
8. The Rules on how an agent starts and on the run folder say what the brief dictates in sentences of this skill's own, so no passage of the panel's Rules longer than a sentence stands in the skill.
9. The figure: three stops and four agent boxes around the five reviewers, with the second round, the shrunk panel and the question on the round in its note. The stop "The round" is not drawn, since only a plain request reaches it.
10. The description keeps the trigger "referee report", which item 7 removes from the panel.
11. The wording of the README row, of the alternative text (the form of the panel's line, from the figure's nodes) and of the glossary entry.

## User-visible changes, before and after

- `/referee` and `/referee re-review`: before, no such skill. After, the skill of `skills/academic/referee/`.
- `README.md`: before, "seventeen skills" twice, `skills/academic/` holding `paper`, `paper-review-panel` and `writing`, no row, no image and no install entry for `referee`. After, "eighteen skills" twice, `referee` in the group sentence, a row after `paper-review-panel`, `referee` in the sentence on the figures and in the sentence on the default agent, the image line for `docs/figures/referee.svg`, and `academic/referee` in the install loop.
- `skills/academic/paper/SKILL.md` line 69: before, `` `referee` (roadmap entry 7.A, not built yet) ``. After, `` `referee` ``. Version "4.1.1" to "4.1.2".
- `skills/academic/paper-review-panel/SKILL.md`: before, "manuscript review, referee report, review my paper" in the description and in "What it reads" 3, and no row for `referee`. After, "manuscript review, review my paper" in both, and the "Use instead" row `| Someone else's paper to review as its referee | `/referee` |`. Version "1.0.0" to "1.0.1". A plain request for a referee report no longer matches the panel's triggers.
- `docs/glossary.md`: **referee review** before ended "Stated in: `docs/roadmap.md`, the entry of `referee`." and now ends "Stated in: `skills/academic/referee/SKILL.md`, the introduction." The entry **round, of a referee review** is new.
- `docs/dev/building.md` line 37 and `docs/dev/scripts.md` line 9: `referee.svg` added after `paper-review-panel.svg`.
- `docs/figures/gen_figures.py`: the function `referee()`, its line in the head comment and its entry in `figures()`. `docs/figures/referee.svg` is new.

## What in the brief was wrong or impossible

- The two cases handed back, with their rulings, under "The cases' first run".
- Outside the step's paths and not changed: the entry **panel review** of `docs/glossary.md` still ends "`docs/roadmap.md`, the entry of `referee`" (`grep -n 'panel review' docs/glossary.md`, line 153), and the entry **round, of an interview** still says the bare "round" outside `grill` is a repair round. The first is no part of any brief item; the second is ruling 1.

## Repair round 1

Each of the five rulings of `agents/briefs/1-round-1.md` is carried out. Only the files under `skills/academic/referee/` and this report changed in the round; `templates/referee_report_template.md` needed no change.

1. Spec 1, `SKILL.md`, Steps 2 and 3. They now read: "2. Create the run folder before the intake, at the place and under the name the first three bullets of Rules give." with "Done when the folder is there and holds no file.", and "3. Go on with the settled round: "first round" for a first round, "re-review" for a second round." with "Done when that subsection's last item is done."
2. Standards 1, `references/second_round.md`, item 4. The EIC is now also given the `paper-review-panel` skill's `references/re_review_mode_protocol.md`, and a new bullet tells it that in this call its output is the check of the revision, written as `revision-check.md`, in place of the EIC Review Card. The item's completion criterion and item 6 name `revision-check.md`. `SKILL.md`, Rules, has a new bullet: "A second round also holds `revision-check.md`, the EIC's check of the revision."
3. Standards 2, the same item. It names only "Verification Logic" and "New Issue Detection", "and in no other section of it"; `grep -c 'Commitment' skills/academic/referee/references/second_round.md` prints 0. New bullets say a first-round major point is checked as a Priority 1 item, a first-round minor point as a Priority 2 item, there is no Priority 3 item, points read from the response letter with no grade are each checked as a Priority 1 item, and the check gives each first-round point one of three statuses: resolved, resolved in part, or not resolved.
4. Standards 3. `SKILL.md`, "first round" item 6: the session no longer writes the files. When the user changes anything it resumes the same referee agent with the changes, shows the rewritten lists, which the user confirms or changes again, and with no change the referee is not resumed there. The item is done "when the user has confirmed and, where the user changed anything, the referee has rewritten the two files". `agents/referee_agent.md` has the new section "The user's changes" between "The selection" and "The report", with the five bullets of the ruling; its Role says it is started once and resumed once or twice; "What you are given" lists the user's changes; "The report" opens "Take the confirmed selection as it stands, also where it goes past the budget." `docs/figures/gen_figures.py` is not changed.
5. Standards 4. `templates/selection_template.md` has the section "First-round points resolved", marked second round only in its opening paragraph, and its count line ends "Resolved first-round points: [n]." `references/second_round.md`, "The selection and the report": a first-round point whose status is resolved goes in that third list with one clause on how the revision resolved it, every listed comment stands once in one of the three lists, the report's general comments name the resolved points from that list, and the selection stop shows the list beside the other two. `agents/referee_agent.md`, "The report", second bullet, now ends "In a second round the general comments also name the points of the list "First-round points resolved"." `SKILL.md`, the Stops row "The selection", shows the third list in a second round.

One repeat the round adds, read against the layout's rule on repeats: after the referee rewrites the two files the user is shown them and confirms or changes again, a repeat the user ends by answering.

The checks, run from the worktree's root after the last change:

- Check 1, `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: prints `ok: the plan-terms block equals the template`, exit 0.
- Check 1, the brief's character-set command over its 13 files: prints nothing, exit 0. The same command over the five files of the skill: prints nothing, exit 0.
- Check 3, the brief's `python3 -c ...`: prints `referee 882 1.0.0`.
- Check 4, `grep -n '^## ' skills/academic/referee/SKILL.md`: prints `12:## Quick start`, `20:## Use instead`, `27:## What it reads`, `37:## Steps`, `103:## Stops`, `117:## Anti-patterns`, `126:## Rules`.

Line counts after the round (`wc -l`): `SKILL.md` 137, `agents/referee_agent.md` 61, `references/second_round.md` 52, `templates/selection_template.md` 53, `templates/referee_report_template.md` 31. `git status --short` outside `.scratch/` lists the same paths as before the round.
