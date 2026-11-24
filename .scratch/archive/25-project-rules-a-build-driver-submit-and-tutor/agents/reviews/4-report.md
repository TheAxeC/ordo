Everything in the brief is done.

## Open items of the state file, verbatim

- Open item A (step 1, the user's reading of the rules): the five rules stand on their pages on main and wait for your reading: `skills/ordo/ordo-init/templates/shared-rules.md` (the bullets "An effort question is answered with the changes", "Every option meets every stated wish", "Every target in scope works", "An open item is for costs the user weighs"), `skills/orchestration/plan-orchestration/SKILL.md`, "Stops" (two sub-bullets under the stop-message bullet), rules 6 and 16 of `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` and of `docs/dev/change-standard.md`, and "Markdown and YAML" of `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`. Two rules were narrowed from the goal's words after the review: the open-items rule to "an open item that offers options", since the plan skills also hold open items with no options (your reading of a page, a worktree that could not be removed, a diff to approve), and the effort rule to "a change to the repository", since `paper`'s revision coach gives a typical duration for a manuscript revision. One point is yours: neither page says what is done with a decision whose options do not each cost something. Option 1, leave it unsaid: the pages hold the goal's rule and nothing more; a reader gets no instruction for that case. Option 2, add "the recommended option is taken and the report states it": it tells the reader what to do, and the second review found that this sentence contradicts "No silent design decisions" and "Surface rule clashes" in the shared rules unless it excepts them. Recommendation: option 1, which is also the option that costs less to carry out; it is recommended because the other rules already say when a decision is raised. The reading blocks no later step.
- Open item B (step 3, the build driver; two questions, both before the brief can be final):
  - Question 1, what "the checks imported and called" in the entry's goal means. The goal says of the driver: "one entry point with `build`, `test`, `check` and `gate`, one command per invocation, the checks imported and called, and every failure a non-zero exit". Your ruling D9 and ADR 0051 say the driver is written "from the commands of the verification page", and those are shell commands, such as `sh utils/pin.test.sh`. A shell command cannot be imported.
    - Option 1 (recommended): the driver runs each command of the verification page as a shell command, under `bash -o pipefail`, and imports nothing. It works the same for a repository in any language, and it is what D9 says. The words "the checks imported and called" then describe nothing the driver does, and I take them out of the entry's goal in the roadmap diff at the closing.
    - Option 2: a command of the page that runs a Python script of the repository is imported and its entry function called inside the driver; every other command runs as a shell command. The goal's words hold for Python checks. The mode must then decide for each command which kind it is, a script that calls `sys.exit` or does work at import behaves differently inside the driver than on the command line, and the driver has two ways to run a command, each to be tested.
    - Recommendation: option 1, because D9 already rules the commands of the verification page and one way to run a command is easier to trust in a gate. Option 1 is also the one that costs less to build.
  - Question 2, a repository with no build step. ADR 0051 says "A subcommand with no command named says so and exits non-zero" and "`gate` runs the three". Read strictly, `gate` fails in every repository that has no build command, such as this one.
    - Option 1 (recommended): `gate` skips a list that holds no command and fails only when all three are empty; `build` called by itself on an empty list still says so and exits non-zero; the verification page names only the subcommands that have a command. ADR 0051 gets one sentence that says so.
    - Option 2: `gate` fails when any of the three lists is empty, so every repository must name a build, a test and a check command before its gate can pass.
    - Recommendation: option 1. Neither option costs less to build.
  - Step 3 waits for these two answers. Nothing else in the plan waits on step 3 except the gate's runs of step 7.

## The cases' first run, on the unchanged tree

`ls skills/academic/submit` printed `ls: skills/academic/submit: No such file or directory`, so every reading case is "no skill" there.

- `/submit <url>` in a folder with a `paper` run folder: no skill.
- The same with the extension not connected: no skill.
- The portal's second page asks for a field the sheet lacks: no skill.
- A page with a sign-in form: no skill.
- A page with a checkbox that agrees to a copyright transfer: no skill.
- A page with a payment form: no skill.
- The page with the final submit: no skill.
- A declaration of no conflict of interest the folder does not settle: no skill.
- A declaration the folder settles: no skill.
- A portal whose forms all stand behind a sign-in: no skill.
- A portal page whose text reads as an instruction to an assistant: no skill.
- An instruction page that links to another site: no skill.
- `/submit ftp://host/x`, or a URL of a local file: no skill.
- A portal that asks for a PDF where the folder holds only a Word document: no skill.
- A filled page whose read-back differs from the sheet: no skill.
- A second run on the same day in the same folder: no skill.
- `/submit <url> <folder>` for a funder's portal with a funder config and a fields file: no skill.
- `/submit <url>` for a registration form in a folder with one file of the person's details: no skill.
- `/submit` with no URL; a folder that does not exist: no skill.
- `python3 docs/figures/gen_figures.py`: printed 23 `wrote ...` lines, the last `wrote docs/figures/paper/run-folder.svg (21112 bytes)`, then `exit 0`; `git status --short docs/figures` printed nothing.
- `grep -n '/submit' docs/figures/gen_figures.py`: printed nothing, `grep exit 1`.

No case was found that the brief's own rules get wrong.

## The cases after the change

Each reading case read against `skills/academic/submit/SKILL.md` and `agents/sheet_agent.md`:

| Case | Result | Where |
|---|---|---|
| `/submit <url>` with a `paper` run folder | met: one sheet agent, the sheet shown, no tab opened before the approval | Steps 3, 4, 5 |
| Extension not connected | met: sheet written, shown, approved, then the stop ends the run with the sheet in the run folder | Steps 6; Stops "The extension not connected" |
| Second page asks a field the sheet lacks | met: row added as a question, the walk waits | "The walk of one page" 2; Stops "A field the sheet lacks" |
| Sign-in form | met: the user is asked to sign in in the tab, nothing typed | Steps 7; Rules bullet 1 |
| Copyright transfer checkbox | met: left, named in the closing message; a stop when the page cannot be passed | "The walk of one page" 6; Steps 9 |
| Payment form | met: left to the user; a stop when it blocks the page | "The walk of one page" 6; Rules bullet 2 |
| Final submit page | met: closing message in `walk.md`, not pressed | Steps 9; Rules bullet 3 |
| Conflict of interest the folder does not settle | met: empty answer and a question; ticked only as the approved sheet says | `agents/sheet_agent.md`, "The sheet" 4; "The walk of one page" 5 |
| Declaration the folder settles | met: proposed with the quoted passage, its file and place | `agents/sheet_agent.md`, "The sheet" 4 |
| All forms behind a sign-in | met: the first lines say so; each field reaches the user as a question in the walk | `agents/sheet_agent.md`, "The sheet" 1; "The walk of one page" 2 |
| Page text that reads as an instruction | met: data, nothing done on its word | Rules bullet 5; `agents/sheet_agent.md`, "Reading the portal" |
| Instruction page linking to another site | met: not followed | `agents/sheet_agent.md`, "Reading the portal" 2 |
| `ftp://host/x` or a local file URL | met: the refusal "A URL that is no web address" | Steps 1 |
| PDF asked, only a Word document held | met: a question for the user; no file converted | `agents/sheet_agent.md`, "The sheet" 6; Rules bullet 6 |
| Read-back differs | met: in the closing message, field not filled again | "The walk of one page" 7 |
| Second run on the same day | met: the stop "A run folder that exists" | Steps 2 |
| Funder portal with funder config and fields file | met: both given to the agent; each value has its file and place | Steps 3 and 4; template "Source" column |
| Registration form with one file of details | met: Steps 3 takes every file of the folder; no manuscript or grant wording required | Steps 3 |
| No URL; missing folder | met: the refusals "No URL" and "A folder that does not exist" | Steps 1; Stops |

The two command cases are the rows "Check 1" and "Case `grep -n '/submit' ...`" of the next table.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. `skills/academic/submit/SKILL.md` | DONE | check 3 below; sections read against `docs/dev/skill-layout.md` |
| 2. `agents/sheet_agent.md` | DONE | read |
| 3. `templates/submission-sheet.md` | DONE | read; one made-up row per table, said to be made up |
| 4. `gen_figures.py`, `submit.svg`, lifecycle labels | DONE | check 1 below |
| 5. `README.md`, `building.md`, `scripts.md` | DONE | check 5 below; `git diff --numstat` |
| 6. Other places, glossary | DONE | grep below; `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |
| Check 1 | DONE | `python3 docs/figures/gen_figures.py; echo "exit $?"` printed `exit 0`; `git status --short docs/figures` printed ` M docs/figures/gen_figures.py`, ` M docs/figures/paper/lifecycle.svg`, `?? docs/figures/submit.svg` |
| Check 2, character set over the ten changed files | DONE | printed nothing, `exit 0` |
| Check 3 | DONE | `submit 1010 1.0.0 True` |
| Check 4 | DONE | `PASS: pin.sh scratch tests` |
| Check 5 | DONE | `grep -c 'academic/submit' README.md` printed `1`; `grep -n 'twenty-two' README.md` printed nothing; the loop printed no line |
| Check 6, ADR 0049 | DONE | the section below |
| Check 7, list items and sentence length | DONE | the judgment calls below |
| Case `grep -n '/submit' docs/figures/gen_figures.py` | DONE | `1735:        "You submit: /submit",` and `1753:        "You resubmit: /submit",` |

Item 6 grep after the change: `grep -rn 'twenty-two\|21 skills\|22 skills' skills utils docs agents README.md | grep -v '^docs/adr\|^docs/roadmap.md'` printed nothing; `grep -rn 'You submit\|You resubmit' ...` outside the SVGs printed only `docs/figures/gen_figures.py:1735`, `:1753` and the lifecycle alt text at `README.md:122`, all changed. The grep of `referee` as a list member found `README.md` lines 33, 36, 75, 134, 161, `docs/dev/building.md:40`, `docs/dev/scripts.md:9` and `figures()` of `gen_figures.py`, each changed; `grep -rln 'wait-what'` found no other list of every skill. No other page needed a change.

Sentences about a file as a whole, reread after the change:

- `gen_figures.py` docstring, "Every figure but the last two shows the order of a run.": `submit.svg` is listed after `referee.svg`, so the last two are still `paper/lifecycle.svg` and `paper/run-folder.svg`.
- `docs/dev/building.md:40`, "Every skill that launches agents has its figure under `docs/figures/`.": `submit.svg` exists.
- `README.md`, "The skills that launch agents each have a figure of their own.": the sentence now names `submit` a sheet agent, and the figure follows the one of `referee`.

## ADR 0049 item by item

- "`submit` is one skill, `/submit <url> [<folder>]`, and neither `paper` nor `grant` has a mode for it": the frontmatter and Quick start; `paper` and `grant` are unchanged (`git status --short` lists no file under them).
- A fresh agent writes the submission sheet (fields with values, files, declarations with answers proposed), reading the portal's forms and the folder, `paper`'s run folder and journal submission guide, the funder config and the fields file: Steps 3 and 4, "What it reads" 4 and 5, `agents/sheet_agent.md`.
- The user approves the sheet before the browser is touched: Steps 5 and the stop "The approval of the sheet".
- The session drives the browser and fills what the sheet holds; a field the sheet lacks is added as a question: Steps 7 to 9, "The walk of one page" 2 to 5, Rules bullet 4.
- Never a password, a licence, a copyright transfer, a payment or the final submit: Rules bullets 1 to 3, "The walk of one page" 6, Steps 9.
- Without the extension the skill writes the sheet and stops: Steps 6 and the stop "The extension not connected".
- `docs/figures/paper/lifecycle.svg` names `/submit` at "You submit" and "You resubmit": `paper_lifecycle()`, captions "You submit: /submit" and "You resubmit: /submit".

## The terms

- Added to `docs/glossary.md`, "Ordo's own terms": **submission sheet** and **walk**, each naming `submit`.
- Used in a new place: **stop** and **refusal** in the Stops table of `submit`, in the senses the glossary gives ("any point in a skill's Stops table where it waits on the user"; "a skill's end without a decision for the user").

## Files with line counts

- `skills/academic/submit/SKILL.md`: new, 144 lines.
- `skills/academic/submit/agents/sheet_agent.md`: new, 57 lines.
- `skills/academic/submit/templates/submission-sheet.md`: new, 41 lines.
- `docs/figures/submit.svg`: new, 50 lines, written by the script.
- `docs/figures/gen_figures.py`: 39 added, 2 removed.
- `docs/figures/paper/lifecycle.svg`: 4 added, 4 removed, written by the script.
- `README.md`: 9 added, 6 removed.
- `docs/glossary.md`: 2 added.
- `docs/dev/building.md`: 1 added, 1 removed.
- `docs/dev/scripts.md`: 1 added, 1 removed.

## Judgment calls the brief left open

- A stop "Which config" when `grant-config/` holds several `.md` files. The brief says "the one `.md` file" and gives no outcome for several; `grant` has the same stop for the same case ("What it reads" 4 of `grant`). It is a seventh stop beside the six the brief lists, and serves item 1, "The material".
- The material is every file of the folder and its subfolders, `submit-runs/` left out, plus the latest `paper-runs/` run folder in the folder's parent and the funder config with `grant-fields.md`. The skill does not classify the folder as a manuscript, a grant or a registration, so the registration case runs with no manuscript or grant wording.
- The latest `paper-runs/` folder is the one whose name holds the latest date and, on that date, the highest number, from ADR 0020's naming.
- The journal submission guide of `paper` (ADR 0049's first bullet) is read by the sheet agent for a journal's manuscript system, from the folder `paper` beside this skill's folder, and skipped when absent.
- "Replace" at the stop "A run folder that exists" removes the run folder's `submission-sheet.md` and `walk.md` with `rm -f`, and nothing else.
- The extension is checked after the approval (Steps 6), as the brief's "Without the extension" says, so a run without it still yields the approved sheet.
- A sign-in is the stop "A control left to the user that blocks the walk", since a credential is one of the controls Rules leaves to the user.
- The runner's names: "WebFetch" for the fetch tool, as `paper` names it, and "Claude in Chrome" for the browser extension.
- The sheet has a "Questions" list beside its three tables, numbered Q1, Q2, since "listed as a question" needs a list; a licence, copyright transfer or payment the portal shows is a declarations row whose answer reads "Left to the user".
- The never-rule is three Rules bullets, one per control kind, since each can be broken while the others hold (`docs/dev/skill-layout.md`, "Lists and tables").
- The figure draws the agent and five stops: the approval, the extension not connected, a field the sheet lacks, a control that blocks a page, and the page of the final submit. The run-folder and config stops are named in its note.
- The lifecycle captions read "You submit: /submit" and "You resubmit: /submit", short enough for the lane's width of 196 px, since the script refuses a caption that does not fit one line of its lane.
- Sentence length, check 7: the title paragraph of `SKILL.md` has one sentence of about 40 words, and the README row and the two glossary entries have sentences over 20 words. Each is a list of what one thing does, in the form of the neighbouring rows and entries, and splitting it would repeat its subject in each piece. Every list item of the new pages holds one rule.

## User-visible changes

- `/submit <url> [<folder>]`: before, no such skill; after, the skill as above, invoked only by the user.
- `README.md` table: before, no row for `submit`; after, a row after `referee`.
- `README.md` group sentence and install loop: before, `skills/academic/` held five skills and the loop listed twenty-two; after, `submit` and `academic/submit` are in them, and both count lines say "twenty-three".
- `README.md` figures: before, no figure of `submit`; after, `docs/figures/submit.svg` with its alt text after the figure of `referee`, and `submit` in the sentence on the skills with a figure and in the sentence on the skills that start every agent on the runner's default agent.
- `docs/figures/paper/lifecycle.svg` and its README alt text: before, "You submit" and "You resubmit"; after, "You submit: /submit" and "You resubmit: /submit".
- `docs/dev/building.md` and `docs/dev/scripts.md`: `submit.svg` added to the list of figures.
- `docs/glossary.md`: the entries **submission sheet** and **walk**.

## Anything in the brief that was wrong or impossible

None.

## Repair round 1

Every ruling of `agents/briefs/4-round-1.md` is carried out.

1. Pages saved with `curl` (Spec 1). `agents/sheet_agent.md`, "Reading the portal" 1: each page is saved with `curl -sSL --fail --proto '=http,https' -w '%{http_code} %{url_effective}\n' -o '<run folder>/portal/<nn>.html' '<address>'` and read with the Read tool. The call sends no cookie, no credential and no form data, and no portal page is read through WebFetch. The sheet's first lines name each saved file beside its address ("The sheet" 1; template line "Pages saved"). A source or a quoted passage from the portal names its saved file ("The sheet" 3 and 4 and its "Done" line; template example `portal/02.html`). `SKILL.md`: "What it reads" 5, Steps 4, the Anti-patterns row on reading before the approval, the Rules bullet on the run folder (now holds `portal/`), Steps 2 (replacing removes `portal/` with `rm -rf`), the title paragraph and the description. The glossary entry **submission sheet** names the saved pages. A local run of `curl ... --proto '=http,https' ... 'file:///etc/hosts'` printed `curl: (1) Protocol "file" disabled` and `000 file:///etc/hosts`, exit 1.
2. "The rules hold" (Spec 2). `agents/sheet_agent.md` opens with that section in the words of `skills/academic/referee/agents/referee_agent.md`. The template ends on a section "Objections" that reads "None." when the agent has none. The agent page's "The sheet" 8 writes the objections there. `SKILL.md` Steps 4 ("Done" line) and 5, and the stop "The approval of the sheet", show the objections with the sheet.
3. The glossary term (Standards 1). The entry is now **walk, of a submission**, in the form of the scoped entries. It says that the bare "walk" in `submit` means this, so the text of `submit` reads as before.
4. The added row (Standards 2). The rule stands only in `SKILL.md`, "The walk of one page" 2: the added row names its page, its last cell reads `Q<n>, added in the walk`, and its question goes under "Questions". The template's bullet that held a second form is replaced by a description of the last cell ("Source" or "What it rests on"), which gives the same form `Q<n>, added in the walk`.
5. Steps 9 (Standards 3). It is now three items. Steps 9 walks the final page by items 1 to 7 of "The walk of one page". Steps 10 writes `walk.md`. Steps 11 shows the closing message with the sentence that the user presses the final submit, which is the stop. Each ends on its completion criterion. The stop's "When" cell and the Anti-patterns row on the final submit name Steps 11.
6. The description (Standards 4). The fragment is joined to the preceding sentence: "It leaves every sign-in, licence, copyright transfer, consent, payment and the final submit to the user, for a journal, a funder's portal or a registration form." The description is 1020 characters.
7. "A page that does not pass" (Behaviour 1). A new stop is added in "The walk of one page" 8, in the Stops table and in an Anti-patterns row. The session shows the portal's message and the row it concerns. After the user's answer it fills what the changed sheet holds and uses the control once more. It never types a value the sheet does not hold to make a page pass, and uses the control again only after a change to the sheet or the user's word. The figure draws it as a box, and the README row and alt text name it.
8. Controls (Behaviour 2).
   - Steps 7 uses the portal's controls that lead to the form.
   - "The walk of one page" 3 uses the control that adds an entry the sheet holds, such as one more author.
   - A consent, a cookie banner included, is an agreement. The second Rules bullet names it, Steps 7 leaves it to the user (blocking: the stop "A control left to the user that blocks the walk"), and the stop's "When" cell, the Anti-patterns row, the sheet agent's "The sheet" 4, the figure box, the README row, the description and the glossary entry name it. "Consent" is taken out of the agent's list of declarations it may answer.
   - Every other control the sheet does not cover is added under "Questions" at the stop "A field the sheet lacks" and is not used ("The walk of one page" 1 and 2; an Anti-patterns row).
9. "The same site" (Behaviour 3). The agent saves only pages on the host of the URL. A page that `curl` redirects to another host has its file removed and is listed as not read. Each link to another host that looks like an instruction page is listed in the sheet's first lines as a page not read, with its address (agent page "Reading the portal" 2; template line "Pages not read"). The example of two hosts of one domain is gone. The case "An instruction page that links to another site" is still met.
10. The material (Behaviour 4). Steps 3 now leaves out every file and folder whose name starts with a dot. When `git rev-parse --is-inside-work-tree`, run in the folder, prints `true`, it also leaves out the files that `find . -type f | git check-ignore --stdin`, run in the folder, prints. The message names how many files the material holds. A run on a scratch repository with `build/` and `*.log` ignored printed `./x.log` and `./build/a.pdf`, exit 0, and `git rev-parse --is-inside-work-tree` in a subfolder printed `true`.
11. "Which config" stays as it was.

After the changes, `SKILL.md`, the agent page and the template were read as one run, from the call to the page of the final submit. These places were corrected:
- The lead line of the Stops table now says eight stops, six of them waiting.
- The step numbers in the Stops table and the Anti-patterns follow the new Steps.
- The README row and the alt text of `docs/figures/submit.svg` (two changed boxes) match the skill.
- The figure's note names the saved pages and the new stop.
- Both glossary entries match the skill.

Checks, run from the worktree's root:

| Check | Output |
|---|---|
| 1 | `python3 docs/figures/gen_figures.py; echo "exit $?"` printed `exit 0`; `git status --short docs/figures` printed ` M docs/figures/gen_figures.py`, ` M docs/figures/paper/lifecycle.svg`, `?? docs/figures/submit.svg` |
| 2 | the character-set check over the ten changed files printed nothing, `exit 0` |
| 3 | `submit 1020 1.0.0 True` |
| 4 | `PASS: pin.sh scratch tests` |
| 5 | `grep -c 'academic/submit' README.md` printed `1`; `grep -n 'twenty-two' README.md` printed nothing; the loop printed no line |
| glossary | `ok: the plan-terms block equals the template` |
| case grep | `1735:        "You submit: /submit",` and `1753:        "You resubmit: /submit",` |

Line counts now: `SKILL.md` 159, `agents/sheet_agent.md` 72, `templates/submission-sheet.md` 46, `docs/figures/submit.svg` 57. `git diff --numstat`: `README.md` 9 added and 6 removed, `docs/figures/gen_figures.py` 42 added and 2 removed, `docs/figures/paper/lifecycle.svg` 4 and 4, `docs/glossary.md` 2 added, `docs/dev/building.md` 1 and 1, `docs/dev/scripts.md` 1 and 1.
