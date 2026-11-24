# Refuter report: step 4 of plan 25

## Verification lines

Each command was run from the worktree with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front.

1. `python3 docs/figures/gen_figures.py; echo "exit $?"` printed 24 `wrote ...` lines. Among them were `wrote docs/figures/submit.svg (10225 bytes)` and `wrote docs/figures/paper/lifecycle.svg (21064 bytes)`, and the last two lines were `wrote docs/figures/paper/run-folder.svg (21112 bytes)` and `exit 0`. `git status --short docs/figures` printed:
```
 M docs/figures/gen_figures.py
 M docs/figures/paper/lifecycle.svg
?? docs/figures/submit.svg
```
The `git status --short` taken before the run and the one taken after it were compared with `diff`, which printed nothing, so the set of changed files is the same (`same-set`).
2. The character-set check over the eleven changed files (README.md, docs/dev/building.md, docs/dev/scripts.md, docs/figures/gen_figures.py, docs/figures/paper/lifecycle.svg, docs/glossary.md, docs/figures/submit.svg, the three files under skills/academic/submit/, and the report) printed nothing. The exit status was `ascii exit 0`.
3. The frontmatter check printed `submit 1010 1.0.0 True`.
4. `sh utils/pin.test.sh 2>&1 | tail -1` printed `PASS: pin.sh scratch tests`.
5. `grep -c 'academic/submit' README.md` printed `1`. `grep -n 'twenty-two' README.md` printed nothing and exited 1. The install loop check printed no `missing` line.
6. ADR 0049 was read against the skill bullet by bullet:
   - "one skill, `/submit <url> [<folder>]`": the frontmatter and Quick start.
   - Fresh agent, sheet contents, reads the forms and the folder (with `paper`'s run folder and journal submission guide, the funder config and the fields file): Steps 3 and 4, "What it reads" 4 and 5, and `agents/sheet_agent.md`.
   - Approval before the browser is touched: Steps 5, and the stop "The approval of the sheet".
   - The session drives the browser, and a field the sheet lacks becomes a question: Steps 7 to 9, and "The walk of one page" 2 to 5.
   - Never a password, a licence, a copyright transfer, a payment or the final submit: Rules bullets 1 to 3, and "The walk of one page" 6.
   - Without the extension the skill writes the sheet and stops: Steps 6, and the stop "The extension not connected".
   - lifecycle.svg: `gen_figures.py:1735` `"You submit: /submit",` and `:1753` `"You resubmit: /submit",`. The same labels are in the SVG text and its aria-label.
7. List items and sentence length were read. The departures are under Standards 3 and 4.

The report's other quoted commands were rerun:
- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
- `grep -rn 'twenty-two\|21 skills\|22 skills' skills utils docs agents README.md | grep -v '^docs/adr\|^docs/roadmap.md'` printed nothing.
- `grep -rln 'wait-what' ...` found `skills/explain/wait-what/SKILL.md`, `skills/explain/tutor/SKILL.md`, `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg` and `README.md`. The hit in `gen_figures.py:2339` is the note listing the skills that start no agent, and `submit` starts an agent, so that note stays true.
- `grep -n 'last two' docs/figures/gen_figures.py` printed `30:Every figure but the last two shows the order of a run.` and that sentence still holds.
- `grep -n '/submit' docs/figures/gen_figures.py` printed lines 1735 and 1753 only.

## Verdicts

Items:
1. `SKILL.md`: holds.
   - The frontmatter and sections are in skill-layout order. The call, material, sheet, approval, walk, controls, final-submit stop, no-extension stop, Rules, run folder and extension naming are each present (SKILL.md lines 40-144).
   - The stop "Which config" is added beyond the brief's list. It is reported under the report's judgment calls with the item it serves, as change-standard rule 20 asks, and it mirrors `grant`'s "What it reads" 4.
   - Read-through gaps are in Behaviour 1 to 4.
2. `agents/sheet_agent.md`: holds. Every content point of the item is present. The difference in form from referee's pages is Spec 2.
3. `templates/submission-sheet.md`: holds. Each table has one example row said to be made up (line 5). The defect in its walk-row rule is Standards 2.
4. `gen_figures.py`: holds. `submit()` is in `figures()` (line 2354) and in the docstring (lines 16-17), and the lifecycle labels are changed. The run changed only `submit.svg` and `paper/lifecycle.svg` among the figures.
5. `README.md`, `building.md` and `scripts.md`: holds. The README word diff shows the row after `referee`, the group sentence, the install loop, both counts changed to "twenty-three", the figure sentence, the default-agent sentence, the lifecycle alt text, and the figure with its alt text after referee's. `submit.svg` is in building.md:40 and scripts.md:9.
6. Other places and the glossary: holds. My greps for `twenty-two`, `21 skills`, `22 skills`, `You submit`, `submit.svg` and `referee` as a list member found nothing left to change. The glossary has both entries, alphabetically, in "Ordo's own terms". `paper` and `grant` are unchanged (`git status --short`). The clash of the bare term "walk" is Standards 1.

Cases (all read against SKILL.md and sheet_agent.md unless a command is named):
- `paper` run folder: met (Steps 3-5).
- Extension not connected: met (Steps 6, Stops row).
- Second page asks a field the sheet lacks: met ("The walk of one page" 2).
- Sign-in form: met (Steps 7, Rules 1).
- Copyright-transfer checkbox: met (walk item 6, Rules 2, Steps 9).
- Payment form: met (walk item 6, Stops row "A control left to the user that blocks the walk").
- Final submit page: met (Steps 9, Rules 3).
- Conflict-of-interest declaration not settled by the folder: met (sheet_agent "The sheet" 4, walk item 5).
- Declaration the folder settles: met (sheet_agent "The sheet" 4, with the quoted passage).
- All forms behind a sign-in: met (sheet_agent "The sheet" 1, walk item 2).
- Page text written as an instruction: met (Rules 5, sheet_agent line 26).
- Instruction page linking to another site: met (sheet_agent "Reading the portal" 2). The definition of "same site" is Behaviour 3.
- `ftp://` URL or local file URL: met (Steps 1).
- PDF asked for, only a Word document held: met (sheet_agent "The sheet" 6, Rules 6).
- Read-back differs: met (walk item 7).
- Second run on the same day: met (Steps 2).
- Funder portal with funder config and fields file: met (Steps 3 and 4, template Source column).
- Registration form with one file of details: met (Steps 3 takes every file).
- No URL; folder does not exist: met (Steps 1, Stops).
- `python3 docs/figures/gen_figures.py`: met (Verification line 1).
- `grep -n '/submit' docs/figures/gen_figures.py`: met (lines 1735 and 1753).

## Spec

1. The page is fetched through a model's summary, so the sheet's sources rest on text nobody saved.
   - Place: `agents/sheet_agent.md`, "Reading the portal" 1: "Read the page at the URL with WebFetch, the runner's tool that fetches a web page." Also SKILL.md Anti-patterns, row "Opening the portal in the browser...": "The sheet agent reads the public pages with WebFetch".
   - What is wrong: this follows the brief's decision 1. The repository already records that WebFetch returns a model's processing of a page, not the page. `skills/academic/paper/SKILL.md:994` (Anti-patterns): "The result is a model's processing of the page, and the annotation or the entry rests on text nobody saved". `paper` reads such pages with `curl` into a file instead (line 833). The sheet's Source column ("The instructions page, 'File types'") and the declarations' quoted passages then cite portal text the agent never saw verbatim.
   - Failure scenario: the instructions page says "figures as separate TIFF files, at most 5 MB each". WebFetch's summary renders it as "figures as image files". The sheet lists the figures as PNGs, the user approves, and the portal rejects the upload during the walk. This is the brief's decision, not a builder deviation, so it is for the orchestrator to keep or change.
2. The sheet agent page lacks the "The rules hold" section the form it follows has.
   - Place: `agents/sheet_agent.md`, whole page. Its sections are Role, What you are given, Reading the portal, Reading the folder, The sheet, What you never do.
   - What is wrong: brief item 2 asks for "the form of the agent pages of `skills/academic/referee/agents/`". All three referee agent pages open with "## The rules hold" ("Every rule of this page holds whatever the reasons. When you think a rule gives a wrong result here, follow the rule and write your objection in the section 'Objections'"). The sheet agent page has no such section, and the template has no Objections section.
   - Failure scenario: the agent judges that a usual answer fits a declaration, for example "no conflict of interest" for a single-author registration. Nothing tells it to keep the rule and record its objection. It either breaks the rule silently or drops the point, and the user never sees the disagreement. Item 2's verdict is holds on content; this is a form difference for the orchestrator to rule on.

## Proof

none.

The report's referee line numbers (`README.md lines 33, 36, 75, 134, 161`) are the base tree's numbers: `git show 7132ac8:README.md | grep -n referee` gives 33, 36, 75, 134 and 161. The after-tree numbers are 33, 37, 76, 137 and 164. In the same paragraph, `README.md:122` is an after-tree number. No decision rests on these numbers.

## Standards

1. The bare glossary term "walk" now clashes with existing uses of the word in other skills.
   - Place: `docs/glossary.md:172`: "- **walk**: the session's pass of `submit` through a portal's forms in the browser extension, ..."
   - What is wrong: `docs/dev/skill-layout.md`, "Writing for an agent", says: "A term that `docs/glossary.md` defines is used only in a sense it defines there." The word is already used in other senses:
     - `skills/code/wizard/SKILL.md:3` ("a wizard, that walks a person through a setup") and line 10.
     - `README.md:29` (the wizard row, "walks a person through a setup").
     - `skills/code/codebase-design/SKILL.md:264` ("to walk the code").
     - `skills/ordo/ordo-init/SKILL.md:210` ("the ordered plan walks through").
   - The section's scoped entries show the form that avoids this: "round, of a referee review" and "loop, in the README". The brief named the entry "walk", so the bare form comes from the brief.
   - Failure scenario: a reviewer applying the layout rule flags wizard's description as a misuse of a defined term. A reader of wizard looks the word up and finds a definition about browser portals.
2. The rule for rows added during the walk sits only in the template, which the session does not read, and it collides with the Q<n> rule for the same cell.
   - Place: `templates/submission-sheet.md:7`: "A row the session adds during the walk names its page and reads \"added in the walk\" in its last cell, and its question is added under \"Questions\"."
   - What is wrong: the rule addresses the session, but SKILL.md "What it reads" 6 says the template is "read by the sheet agent". "The walk of one page" 2 ("Add each field, file or declaration with no row to the sheet as a question, with its page") gives no marker. The same template says the last cell holds "the file and the place, or \"Q<n>\"" (lines 22, 29, 36), so one cell is asked to hold two values. This breaks skill-layout "Where a rule goes": a rule that says what to do at one point of the work goes in that step's item.
   - Failure scenario: the session adds a row "ORCID iD | Step 2 | | Q4" with no "added in the walk" marker. Later, `walk.md` and the user cannot tell which rows were approved before the walk and which were added during it.
3. Steps 9 holds three actions in one item.
   - Place: SKILL.md lines 74-78: "9. End on the page of the final submit ... - Walk that page first, as items 1 to 7 ... - Write the closing message to `walk.md` ... - Show the closing message, and say that the user presses the final submit."
   - What is wrong: skill-layout "Sections, in order", row 5, asks for "one action per item". This item walks a page, writes a file and shows a message.
   - Failure scenario: a session that stops part-way through the walk of the final page (at walk item 2, a field the sheet lacks) has no step boundary to resume at. It may write `walk.md` before that page's fields are answered.
4. The description contains a sentence fragment.
   - Place: SKILL.md line 3, description: "For a journal, a funder's portal or a registration form."
   - What is wrong: this is a fragment with no verb, which the prose standard bans under E, "Stop-start fragments: ... Join them".
   - Failure scenario: none for behaviour. A prose review of the skill flags it.

## Behaviour

1. The walk has no instruction for a page that will not pass for a reason other than a blocking control.
   - Place: SKILL.md "The walk of one page" 3: "Leave a field whose row is empty, as the user approved it, empty." Also item 4: "Done when each file is uploaded." And item 8: "Go on to the next page with the portal's own control for it ... Done when the tab shows the next page."
   - What is wrong: three cases leave the session without an instruction:
     - a required field whose approved row is empty;
     - a validation error shown after the next control;
     - an upload the portal refuses (size or format).
     The only stops that fire mid-walk are "A field the sheet lacks" (no row) and "A control left to the user that blocks the walk" (credential, licence, copyright, payment). Item 8's completion criterion cannot be reached in these cases, and no step names a stop or a count.
   - Failure scenario: the user approves the sheet with Q3 "Phone number" left empty. The portal marks it required, and the session presses Next and gets "Phone number is required". The text then lets the session either type a guess, against Rules 4, or press Next again with no count.
2. Steps 7 gives no instruction for getting from the URL to the first page of forms, or for controls on a page other than "next".
   - Place: SKILL.md Steps 7: "Open the portal at the URL in a new tab ... Done when the tab shows the portal's first page of forms." Also Rules 4: "The sheet as approved is the only source of what is typed, uploaded, ticked or answered".
   - What is wrong: the URL a user gives is often a journal's or a call's landing page. Reaching the forms takes presses the sheet does not hold: "Start new submission", "Add co-author", a cookie-consent banner. The only control the text permits is "the portal's own control" for the next page (walk item 8). A cookie banner's "Accept all" is an agreement, and Rules 2 ("never agrees to a licence ...") may or may not cover it, so the text gives two readings.
   - Failure scenario: on first load the portal shows a cookie banner over the page. One session clicks "Accept all", agreeing to terms the user never approved. Another treats it as a blocking control and stops. For a manuscript with three authors, the "Add author" button is pressed on no instruction, or the co-authors' rows are never filled.
3. "Same site" for the sheet agent is defined only by example.
   - Place: `agents/sheet_agent.md`, "Reading the portal" 2: "Follow a link only when it stays on the portal's site: the host of the URL, or a host of the same domain, such as `help.example.org` beside `submit.example.org` (made-up names)."
   - What is wrong: "the same domain" has no rule beyond the example. Hosts under a shared public suffix (`journal.ac.uk` and `other.ac.uk`, `a.github.io` and `b.github.io`) read as "the same domain" under a last-two-labels reading.
   - Failure scenario: an instruction page at `submit.somejournal.ac.uk` links `notes.otheruni.ac.uk`. The agent follows it as "the same domain" and reads text that is no part of the portal. Under the data rule, that text can still shape the sheet's rows.
4. Every file of the folder is the material, with no exclusion for repository metadata.
   - Place: SKILL.md Steps 3: "The material is every file of the folder and its subfolders, `submit-runs/` left out."
   - What is wrong: nothing excludes `.git/`, build caches or virtual environments, and Steps 4 passes "the material of Steps 3 by its paths" to the agent.
   - Failure scenario: a manuscript kept in a git repository passes thousands of `.git/objects/...` paths to the sheet agent, which spends its context on them. A value can then be read from an old object, or a stale build output such as an old `build/main.pdf` can be listed as the file to upload.

## Declined to judge

- The report's first run of the two command cases on the unchanged tree ("printed 23 `wrote ...` lines", "`git status --short docs/figures` printed nothing", "`grep -n '/submit'` printed nothing"). Rerunning them needs a checkout of 7132ac8, by `git worktree add` or `git stash`, which is outside my three git commands. `git show 7132ac8:docs/figures/gen_figures.py | grep -c '/submit'` was not run, so that part is not verified either.
- The report's `git diff --numstat` line counts: that command was not run. `git diff 7132ac8 --stat` gives README.md 15 (9 added, 6 removed) and gen_figures.py 41 (39 added, 2 removed), which agree with the report.
- Whether WebFetch drops portal fields in practice (Spec 1), whether the browser extension's tools show as connected when they are deferred, and any real walk of a portal. No web fetch or browser use was allowed, and the real runs are the gate's step 7.
- One file was written outside the repository: a `git status --short` snapshot at `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/before.txt`, used for the before-and-after comparison in Verification line 1. Nothing in the worktree or the ledger was written.

Agent usage: a69c8e7d7e94743e3, claude-opus-5-5, 154003 tokens, 37 tool uses, 8 min 11 s.

## Repair round 1, refuted

### Verification lines

Each command was run from the worktree with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

1. `python3 docs/figures/gen_figures.py >/dev/null; echo "exit $?"` printed `exit 0`. `git status --short` taken before and after the run, compared with `diff`, printed `same-set`. `git status --short docs/figures` printed:
```
 M docs/figures/gen_figures.py
 M docs/figures/paper/lifecycle.svg
?? docs/figures/submit.svg
```
2. The character-set check, run per file over the ten files the round's section names plus the report (README.md, docs/dev/building.md, docs/dev/scripts.md, docs/figures/gen_figures.py, docs/figures/paper/lifecycle.svg, docs/glossary.md, docs/figures/submit.svg, the three files under skills/academic/submit/, and the report), printed nothing and ended `ascii exit 0`.
3. Frontmatter check printed `submit 1020 1.0.0 True`.
4. `sh utils/pin.test.sh 2>&1 | tail -1` printed `PASS: pin.sh scratch tests`.
5. `grep -c 'academic/submit' README.md` printed `1`. `grep -n 'twenty-two' README.md` printed nothing. The install-loop check printed no `missing` line. `ls skills/*/*/SKILL.md | wc -l` printed `23`, which agrees with "twenty-three" at README.md lines 37 and 175.
6. `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
7. `grep -n '/submit' docs/figures/gen_figures.py` printed `1735:        "You submit: /submit",` and `1753:        "You resubmit: /submit",`.
8. The README alt text of the figure and the `<title>` and `aria-label` of `docs/figures/submit.svg` list the same seven boxes, the sixth being "A page that does not pass: the portal's message, with its row (stop)". `grep -c 'does not pass' docs/figures/submit.svg` printed `4`.
9. `grep -rn 'twenty-two\|21 skills\|22 skills' skills utils docs agents README.md`, with `docs/adr` and `docs/roadmap.md` filtered out, printed nothing. `grep -rn -i 'webfetch\|same site\|same domain'` over `skills/academic/submit`, the glossary, README.md and gen_figures.py printed only `sheet_agent.md:31` ("Read no portal page through WebFetch ...").
10. The delta (`diff -u` of snapshot against worktree) is non-empty for README.md, gen_figures.py, glossary.md, SKILL.md, sheet_agent.md, the template and the two SVGs. It is empty for building.md and scripts.md. `git status --short` lists no changed path outside `files.txt` except the two ledger files (the round's brief and the report).

### Rulings

1. Carried out. `sheet_agent.md` "Reading the portal" 1 saves each page with `curl` into `portal/` and reads the file, with no WebFetch. The first lines and the Source cells name the saved files. SKILL.md Steps 2, 4, "What it reads" 5, the Anti-patterns row, Rules and the glossary follow. Two defects of the curl call are Spec 1, Spec 2 and Behaviour 1 and 2.
2. Carried out. The agent page opens with "The rules hold" in referee's words, the template ends on "Objections" ("None."), and Steps 4 and 5 and the approval stop show the objections.
3. Carried out. The entry is "walk, of a submission" and says the bare "walk" in `submit` means it. `grep -n -i 'walk' docs/glossary.md` shows only the two submit entries, so the wizard and other skills' "walks" no longer clash.
4. Partly. The rule stands in "The walk of one page" 2 and in the template's description of the last cell, and one form `Q<n>, added in the walk` is used. "Names its page" cannot be done in the Files and Declarations tables (Spec 3).
5. Carried out. Steps 9, 10 and 11 are one action each with a Done line. The Stops table and the Anti-patterns row name Steps 11, and the glossary names "Steps 7 to 11".
6. Carried out. The fragment is joined to the preceding sentence and the description is 1020 characters. The attachment reads oddly (Standards 2).
7. Carried out in walk 8, the Stops table, the Anti-patterns row, the figure box, the README row and alt, and the lead line ("first eight rows ... six wait", counted against the table). The refill instruction contradicts walk 7 (Spec 4).
8. Carried out. Steps 7 allows the controls that lead to the form, walk 3 allows the control that adds an entry, a consent and a cookie banner are agreements in Rules 2, and a control not covered is a question (walk 2). The meaning of "a consent" is open (Spec 5).
9. Carried out. Pages are saved only on the URL's host, other-host links are listed as pages not read, and the example is gone. The redirect case is Behaviour 2.
10. Carried out as written in Steps 3 (dot names, `git check-ignore`, the file count in the message). Its effect on build output is Behaviour 3.
11. Carried out. The stop "Which config" is in Steps 3 and in the Stops table, and the figure note names it.

### Verdicts

Items of "What to build":
1. SKILL.md: partial (Spec 1, Spec 2, Spec 4, Spec 5).
2. `agents/sheet_agent.md`: partial (Spec 1, Behaviour 1, Behaviour 2).
3. `templates/submission-sheet.md`: partial (Spec 3).
4. `gen_figures.py`, `submit.svg`, lifecycle labels: holds.
5. README.md, building.md and scripts.md: holds. The README row and the alt text match the figure and the skill.
6. Other places and the glossary entries: holds (verification lines 5 and 9). `paper` and `grant` carry no mode and no sentence sending the user to `/submit`.

Cases:
- `/submit <url>` in a folder with a `paper` run folder: partial (Spec 1).
- Extension not connected: met (Steps 6 and the stop).
- Second page asks for a field the sheet lacks: met (walk 2).
- Sign-in form: met (Steps 7, Rules 1).
- Copyright-transfer checkbox: met (walk 6, Rules 2).
- Payment form: met (walk 6, the blocking stop).
- Final submit page: met (Steps 9 to 11, Rules 3).
- Conflict-of-interest declaration the folder does not settle: met (agent "The sheet" 4).
- Declaration the folder settles: met (agent "The sheet" 4, quoted passage).
- Portal whose forms all stand behind a sign-in: partial (Spec 2).
- Portal text that reads as an instruction: met (Rules 5, agent page).
- Instruction page linking to another site: met (agent "Reading the portal" 2, ruling 9).
- `ftp://` URL or local file URL: met (Steps 1).
- PDF asked for, only a Word document held: met (agent "The sheet" 6, Rules 6).
- Read-back differs from the sheet: partial (Spec 4).
- Second run on the same day: met (Steps 2).
- Funder portal with config and fields file: met (Steps 3, template Source column).
- Registration form with one file of details: met.
- No URL, folder that does not exist: met (Steps 1 and the refusals).
- `gen_figures.py` run: met (verification line 1).
- `grep -n '/submit'`: met (verification line 7).

### Spec

1. `portal/` is never created, so the first `curl` fails.
   - Place: `agents/sheet_agent.md` "Reading the portal" 1, and SKILL.md Steps 4 ("Create the run folder with `mkdir -p`").
   - Hunk: `curl -sSL --fail --proto '=http,https' -w '%{http_code} %{url_effective}\n' -o '<run folder>/portal/<nn>.html' '<address>'`.
   - What is wrong: the run folder is created, but nothing creates `portal/` inside it, and the command has no `--create-dirs`. curl's `-o` does not create a missing directory (from curl's documented behaviour; not run, since no curl to any address was allowed).
   - Failure scenario: the first run's agent gets a write error on `portal/01.html`. It either improvises a `mkdir`, which no text tells it to do, or writes the sheet without a saved page. Then "a source names its saved file" cannot hold.
2. No instruction for a page curl cannot save.
   - Place: `agents/sheet_agent.md` "Reading the portal" 1 and 2, and "The sheet" 1. The flag `--fail` yields no file on an HTTP 401, 403 or 404, and the options for the first line, "whole, in part, or not at all because it stands behind a sign-in", do not include "no page saved".
   - Failure scenario: a portal answers the URL with 403 to a command-line client, or its page is a script-built shell. The URL's own page is not saved, and no text says what the sheet then states or that the user is told the page failed. The case "a portal whose forms stand behind a sign-in" ends in an unspecified sheet. The Done line of item 2 ("or `curl` failed on it") records no failure in the sheet's lines "Pages saved" or "Pages not read".
3. "The added row names its page" cannot be done in two of the three tables.
   - Place: SKILL.md "The walk of one page" 2: "The added row names its page, and its last cell reads `Q<n>, added in the walk`". The template's Files table has the columns File, Path, Requirement it meets and Source (line 27), and the Declarations table has Declaration, Answer proposed and What it rests on (line 34). Neither has a Page column. Only Fields has one.
   - Failure scenario: the session adds a declaration row for a portal's second page and has no cell for "Step 2". It puts the page in the first cell in one run and drops it in another, so the sheet and `walk.md` carry two forms. Ruling 4 asked for one cell and one form.
4. Two instructions disagree about filling a field again.
   - Place: walk 8, "After the user's answer, fill what the changed sheet holds and use the control once more." Against walk 7, "Fill no field a second time", and the Anti-patterns row "Filling a field again after the read-back finds a difference".
   - What is wrong: "what the changed sheet holds" can mean every row of the page, including a field the read-back flagged. No read-back follows the second fill.
   - Failure scenario: a portal rewrites a value, the read-back notes the difference, the page then refuses to pass, and the user changes another row. One session refills the whole page and overwrites the field the user corrected in the tab. Another fills only the changed row. `walk.md` misses any difference of the second fill.
5. "A consent" has two readings.
   - Place: Rules 2, "a consent the portal asks for, a cookie banner included". Agent page "The sheet" 4 lists an ethics statement as a declaration to propose from the folder, while the brief's list of declarations includes "a consent".
   - Failure scenario: a portal asks "Informed consent of participants was obtained: Yes/No". The folder's ethics section settles it. The agent writes "Left to the user" because the row says a consent, or proposes the answer because it is an ethics declaration. The two runs of one folder differ.

### Proof

none. The skill has no script and no test, and nothing in the delta needs one.

### Standards

1. Steps 7 holds more than one action.
   - Place: SKILL.md Steps 7, "Open the portal at the URL in a new tab, and go to its first page of forms." It then holds a sign-in stop and a consent stop as bullets. `docs/dev/skill-layout.md` asks "one action per item".
   - Scenario: the step is two actions (open the tab, reach the form), and a resume after the sign-in stop has no boundary between them. Steps 3 has the same shape: it resolves the material and then sends a message.
2. The description's last clause attaches to the wrong sentence.
   - Place: SKILL.md line 3: "It leaves every sign-in, licence, copyright transfer, consent, payment and the final submit to the user, for a journal, a funder's portal or a registration form."
   - What is wrong: "for a journal, a funder's portal or a registration form" reads as the purpose of leaving the controls, not as the skill's scope. This is the join the ruling asked for, but the sentence now says something other than the fragment did.
   - Scenario: a model matching a request on the description reads the scope as a rider on one sentence.

### Behaviour

1. The `curl` command as written, with an address that holds a single quote.
   - Place: `agents/sheet_agent.md` "Reading the portal" 1: "each value single-quoted", `'<address>'`, and `-o '<run folder>/portal/<nn>.html'`.
   - What it does: a `'` inside the address ends the quoted string early. An address `https://host/a'b` leaves an unterminated quote, so the shell waits for input or fails with a syntax error. An address `https://host/a';touch x;'` runs `touch x` in the session's shell. The text gives no escaping rule and no instruction to percent-encode the quote, so it does not handle the case.
   - Where the address comes from: item 2 takes it from links on the portal's pages, which are untrusted data and may hold a `'` in a path. The same applies to the run folder path of a folder such as `Author's thesis`, which the `-o` value holds.
   - Failure scenario: a portal page links `https://host/guide';<command>;'`. The agent pastes it into the command and the command runs, or any apostrophe in a path stops the fetch.
2. A redirect to another host is fetched before it is checked.
   - Place: "Reading the portal" 2: "Save a page only when its address is on the host of the URL." and "A page whose final address `curl` prints is on another host is not read: remove its file". The command uses `-L`. The "What you never do" line says "Never save a page of another host".
   - What is wrong: with `-L`, curl has already requested the other host and saved the file when the text checks the final address. The text then orders a file removed that the "never" line says is never saved.
   - Failure scenario: a link on the portal's host redirects to an internal or third-party address. The request is made and the response saved before the host check, and the page text can reach the agent's context before the removal.
3. Git-ignored files are left out of the material, which can drop the file to upload.
   - Place: SKILL.md Steps 3, the bullet on `git check-ignore`. The round's section reports the exclusion but not this effect.
   - Failure scenario: a manuscript folder in a repository ignores `build/` (usual for LaTeX output). The portal asks for the manuscript as a PDF, and `build/main.pdf` is the only PDF. It is left out, so the sheet lists the PDF as a question "the folder lacks", and the user supplies a path the folder does hold.
4. Raw saved HTML is read with the Read tool, with no instruction for a page it cannot read in one call.
   - Place: "Reading the portal" 1, "read the saved file with the Read tool".
   - Failure scenario: a minified page of several hundred kilobytes is refused or truncated by the reader. The text gives no way to read it in parts and no step to make text from it, as `paper` does with `lookup.py text`, so the agent silently works from a partial page. The sheet's fields come from what it happened to read.
5. A walk the user ends at a stop leaves no closing message.
   - Place: Steps 10 writes `walk.md` only after Steps 9. The stops "A page that does not pass" and "A field the sheet lacks" give no "the user ends the run" branch.
   - Failure scenario: the user stops at page 3 of 5, after pages 1 and 2 were filled and one file uploaded. No text writes the filled fields, the uploaded file or the controls left to the user into `walk.md`, so the portal holds a half-filled draft with no record in the run folder.

Run read-through, from the call to the page of the final submit: the places where the text leaves the session or the sheet agent without an instruction or gives two that disagree are Spec 1, 2, 3, 4 and 5 and Behaviour 1, 2, 4 and 5 above. No other place was found.

### Declined to judge

- The report's `git rev-parse --is-inside-work-tree` and `git check-ignore` runs (the scratch-repository result "printed `./x.log` and `./build/a.pdf`"): outside the three allowed git commands, and not rerun. The commands named are `git rev-parse --is-inside-work-tree` and `find . -type f | git check-ignore --stdin`.
- The report's local `curl ... 'file:///etc/hosts'` run ("Protocol "file" disabled"): not rerun, because no curl to any address was allowed. The behaviour of `-o` into a missing directory (Spec 1) and of `--fail` (Spec 2) rests on curl's documentation, not on a run here.
- The report's `git diff --numstat` line counts: not rerun. `git diff 7132ac8 --stat` was not run either. The line counts of the three skill files were not rechecked with a command.
- The first run of the cases on the unchanged tree, and any real walk of a portal: needs a checkout of 7132ac8 or a browser, both outside what was allowed.

Agent usage: acaac3eedcad88ce6, claude-sonnet-5-5, 132859 tokens, 16 tool uses, 4 min 15 s.

## Closed

First review, each closed in repair round 1 by the ruling of the same number in `agents/briefs/4-round-1.md`: Spec 1 (ruling 1), Spec 2 (ruling 2), Standards 1 to 4 (rulings 3 to 6), Behaviour 1 to 4 (rulings 7 to 10). Behaviour 4's exclusion of the files git ignores was taken out again at landing (Behaviour 3 below).

Run over round 1, each fixed at landing on main:

- Spec 1, `portal/` never created: Steps 4 of `SKILL.md` creates the run folder and its `portal/`.
- Spec 2, a page `curl` cannot save: such a page is listed as a page not read with its status; when it is the page at the URL, the sheet's first lines say that no page was saved. The template's two lines follow.
- Spec 3, the page of an added row: the added row's question under "Questions" names its page, so the rule holds for all three tables.
- Spec 4, filling again after a page that does not pass: only the rows the user's answer changed are filled, and they are read back.
- Spec 5, the two readings of "a consent": the Rules bullet and the agent page say that a consent is one to the portal's own terms, and that a statement about the submission, such as informed consent of participants, is a declaration.
- Standards 1, Steps 7: the item is one action, to reach the first page of forms in a new tab opened at the URL. Steps 3 is left: naming the material is how the item ends.
- Standards 2, the description's last clause: the scope leads the sentence.
- Behaviour 1, a single quote in an address: each `'` of the address is written `%27`, and the command runs with the run folder as the working directory, so no path stands in it.
- Behaviour 2, a redirect fetched before it is checked: `curl` runs without `-L` and prints the redirect's address; it is saved only when it is on the host of the URL, at most five times in a row.
- Behaviour 3, a file to upload that git ignores: the exclusion of the files git ignores is taken out; the names that start with a dot stay left out.
- Behaviour 4, a saved page too long for one read: it is read in parts, to its end.
- Behaviour 5, a walk the user ends at a stop: the closing message is written for the pages walked so far.
