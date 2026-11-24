# Report: step 5, the skill `tutor` and the group folder `skills/explain/`

Everything in the brief is built. Two points are handed back as stops, and the orchestrator decides them: the Stops table, which item 1 fixes at four rows, and the glossary file name that the shipped format pages use. Both are under "Anything in the brief that was wrong or impossible".

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
  - Step 3 waits for these two answers. Nothing else in the plan waits on step 3 except the gate's runs of step 6.
- Open item C (step 4, the skill `submit`; one question): how the submission sheet learns what the portal asks. ADR 0049 says the sheet holds "every field the portal asks for", that the agent "reads the portal's forms for what is asked", and that you approve the sheet "before the browser is touched". The forms of most journal and funder portals stand behind a sign-in, and reading them needs the browser.
  - Option 1: the sheet is first written from what the portal shows without a sign-in (its public pages and instructions) and from the folder. You approve it. During the walk, each field the portal asks that the sheet lacks is added to the sheet as a question to you. The browser is not opened before the approval, as the ADR says. For a portal behind a sign-in the first sheet holds little of the real form, and most fields reach you as questions during the walk.
  - Option 2 (recommended): two passes. You sign in, and the session goes through the portal's form pages reading only: it types nothing, uploads nothing and ticks nothing. The agent writes the sheet from those pages and the folder. You approve it. The session then fills the forms from the approved sheet. The sheet holds the real fields before you approve it. The browser is opened before the approval, so the ADR's sentence becomes "nothing is typed, uploaded or ticked before the approval". A portal that shows a later page only once an earlier one is filled still gives fields the first pass could not see, and those are added as questions, as in option 1.
  - Recommendation: option 2, because an approval of a sheet that lacks most of the form approves little. Option 1 is the one that costs less to build.
  - Taken without asking, since the layout's rule settles it: `submit` carries `disable-model-invocation: true`, so only you start it.
  - Step 4 waits for this answer. Nothing else in the plan waits on step 4 except the gate's runs of step 6.

## The cases' first run, on the unchanged tree

| Case | Result on the unchanged tree |
|---|---|
| Each heading, frontmatter key and format page of the source, found in "Deviations" | no skill |
| `/tutor <topic>` in an empty folder | no skill |
| `/tutor <topic>` in a workspace whose mission the request would change | no skill |
| `/tutor explain <concept>` in a code repository with no `MISSION.md` | no skill |
| `/tutor explain <concept>` in a teaching workspace | no skill |
| `/tutor explain <concept> --page` in a teaching workspace | no skill |
| `/tutor explain <concept> --page` elsewhere with no path given | no skill |
| The model deciding by itself that a lesson is due | no skill |
| `grep -rn 'skills/ordo/wait-what' README.md docs skills utils agents` | one line, `docs/roadmap.md:80:- [x] 18. wait-what and wizard: at the closing on main (0b8e471), ...`; exit 0 |
| `/tutor` with no topic in a workspace with learning records | no skill |
| `/tutor explain` with no concept | no skill |
| `/tutor --page` without `explain` | no skill |
| `/tutor explain "a/b ../c" --page` in a teaching workspace | no skill |
| `/tutor explain <concept> --page` elsewhere, with a path at which a file stands | no skill |
| The install-loop command | no line; exit 0 |
| `diff <(git show HEAD:skills/ordo/wait-what/SKILL.md) skills/explain/wait-what/SKILL.md` | `diff: skills/explain/wait-what/SKILL.md: No such file or directory`; exit 2 |

The first run found no case that the brief's rules get wrong. The Stops point below concerns item 1's row count. It does not concern the expected result of any case.

## Cases after the change, by reading

- The source's headings: each one is found where the map below names it.
- `/tutor <topic>` in an empty folder: "Teaching" item 2 runs the mission interview as the first job, before any lesson, and the Stops row is "The mission interview".
- A request that would change the mission: "Teaching" item 3 asks for the confirmation, and the Stops row is "The confirmation before the mission is changed".
- `/tutor explain` outside a workspace: "Explaining" items 1 to 3 give an answer in the conversation that is tied to the work at hand and names each fetched source. Item 4 writes nothing without `--page`, and item 5 applies only in a teaching workspace.
- `/tutor explain` in a workspace: the same answer, then "Explaining" item 5 offers a learning record, which is written only on a yes.
- `--page` in a workspace: "The page" item 2 gives `reference/<name>`, and item 4 writes it in the lesson's form of "Teaching" item 8.
- `--page` elsewhere with no path: "The page" item 2 asks for the path (Stops, "The page's path").
- The model invoking the skill: blocked by `disable-model-invocation: true` (verify 3 prints `True`).
- `/tutor` with no topic: "Teaching" item 5 chooses the most relevant thing in the zone of proximal development, from the learning records and the mission.
- `/tutor explain` with no concept: "The call" item 2 asks for the concept.
- `/tutor --page`: "The call" item 1 refuses and names `/tutor [<topic>]`, `/tutor explain <concept>` and `/tutor explain <concept> --page`.
- `"a/b ../c" --page`: "The page" item 1 gives `a-b-c.html` directly under `reference/`, and its sub-bullet states that the name holds no `/` and no `..`.
- A file standing at the path: "The page" item 3 asks before replacing it.
- The install loop and the `diff`: see the table below.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 `SKILL.md` | DONE | verify 3: `tutor 754 1.0.0 True` |
| 2 the four format pages | DONE | `diff` of each source page against its copy prints only `29c29` for `resources-format.md`, the link `./SKILL.md` changed to `../SKILL.md`; the other three print nothing |
| 3 explain mode | DONE | read: "Steps / Explaining" |
| 4 `--page` | DONE | read: "Steps / The call" and "Steps / The page" |
| 5 move of `wait-what` | DONE | `test ! -e skills/ordo/wait-what; echo "exit $?"` prints `exit 0`; the `diff` case prints nothing, exit 0 |
| 6 `README.md` | DONE | `grep -c 'explain/tutor' README.md` prints `1`; `grep -c 'explain/wait-what' README.md` prints `1`; `grep -n 'twenty-one' README.md` prints nothing; the loop command prints no line, exit 0 |
| 7 deviations | DONE | the section "Deviations" below |
| 8 other places | DONE | `python3 docs/figures/gen_figures.py` exit 0; `git status --short docs/figures` prints only `M docs/figures/gen_figures.py` and `M docs/figures/pipeline.svg`; the note now reads "These start no agent: /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro, /wizard, /tutor, and /wait-what and /ordo-help, which have no stop." |
| 9 glossary terms | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 \| tail -1` prints `PASS: pin.sh scratch tests` |
| Verify 2 | DONE | the character-set check over the 11 existing changed files prints nothing; exit 0 |
| Verify 3 | DONE | `tutor 754 1.0.0 True` |
| Verify 4 | DONE | the grep prints only `docs/roadmap.md:80:...`; `exit 0` |
| Verify 5 | DONE | `1`, `1`, nothing, no line |
| Verify 6 | DONE | read heading by heading (map below); nothing else differs from the source beyond the rows of "Deviations" |
| Verify 7 | DONE | the departures are listed under "Lists and sentences" |

The item 8 grep, run after the change with `grep -rn 'wait-what\|four group\|twenty-one\|skills/ordo/wait' skills utils docs agents README.md`, excluding `docs/adr/` and `docs/roadmap.md`: the hits are `wait-what`'s own `SKILL.md`, the Use instead row of `tutor`, `gen_figures.py:2296` with `pipeline.svg:108`, and `README.md:25`, `:36` and `:161`, all as intended. The sentences about the whole set still hold. "Five group folders" matches `ls skills | wc -l`, which prints `5`. "Twenty-two skills" matches `ls skills/*/*/SKILL.md | wc -l`, which prints `22`.

The alt text of `pipeline.svg` in `README.md` (line 69) is unchanged. It holds none of the note's text: `grep -o 'wizard\|start no agent\|ordo-help\|wait-what'` over that line prints nothing. The step does not make any of it false.

## Each heading of the source, and where its content stands in `tutor`

| Source | `tutor` |
|---|---|
| frontmatter `name` | `name: tutor` |
| frontmatter `description` | `description`, in the layout's form |
| frontmatter `disable-model-invocation` | kept |
| frontmatter `argument-hint` | dropped; the call with no topic is the Quick start line `/tutor` |
| opening paragraph (a stateful request over several sessions) | the paragraph under `# Tutor` |
| Teaching Workspace | "What it reads" 2 (paths resolve from the run folder, `references/` from the skill folder); "The teaching workspace" (each file); "Teaching" item 1 |
| Philosophy | "Knowledge, skills and wisdom"; "Teaching" item 4 (resources first); Rules 2 and Anti-patterns row 1 (parametric knowledge) |
| Fluency vs Storage Strength | "Knowledge, skills and wisdom" (the two strengths); "Teaching" item 6 (desirable difficulty, the three techniques) |
| Lessons | "Teaching" items 8 and 10; "The teaching workspace", `lessons/*.html` |
| Assets | "Teaching" item 7; Anti-patterns row 3 |
| The Mission | "Teaching" items 2 and 3; Stops rows 1 and 2; Rules 1; Anti-patterns row 2 |
| Zone Of Proximal Development | "Teaching" item 5; item 8 (lesson in the zone) |
| Knowledge | "Teaching" item 6 (only what the skill needs, knowledge first, no difficulty, from `RESOURCES.md`); item 8 (citations) |
| Skills | "Teaching" item 6 (difficulty is the tool, interactive lessons, feedback loop, quiz rules); Anti-patterns row 4 |
| Acquiring Wisdom | Rules 5 and 6; "Knowledge, skills and wisdom", Wisdom |
| Reference Documents | "Teaching" item 9 |
| `NOTES.md` | Rules 4; "The teaching workspace", `NOTES.md` |
| `GLOSSARY-FORMAT.md` | `references/glossary-format.md`, named from "Teaching" item 9 |
| `LEARNING-RECORD-FORMAT.md` | `references/learning-record-format.md`, named from "Teaching" item 3, "Explaining" item 5, Rules 3 and "The teaching workspace" |
| `MISSION-FORMAT.md` | `references/mission-format.md`, named from "Teaching" item 2 |
| `RESOURCES-FORMAT.md` | `references/resources-format.md`, named from "Teaching" item 4 |
| `agents/openai.yaml` | not shipped |

## Differences handed back because no point of ADR 0048 and no ruling covers them

None. Every row of "Deviations" names its point or ruling.

## The terms

- Added to `docs/glossary.md`, "Ordo's own terms": **learning record**, **lesson**, **mission**, **teaching workspace**, each naming `tutor`.
- Used in a new place: **stop**, in the Stops table of `tutor`; **refusal**, in "The call" item 1; **session, the**, in "Explaining" item 1 ("what the session is doing").
- "feedback loop" stands in "Teaching" item 6 as the source's compound term. The glossary's **loop** is the unattended run of `plan-orchestration`, and the compound is not used in that sense. This is listed as a judgment call.

## Files with line counts

- `skills/explain/tutor/SKILL.md`, new, 190 lines.
- `skills/explain/tutor/references/glossary-format.md`, new, 35 lines.
- `skills/explain/tutor/references/learning-record-format.md`, new, 46 lines.
- `skills/explain/tutor/references/mission-format.md`, new, 31 lines.
- `skills/explain/tutor/references/resources-format.md`, new, 32 lines.
- `skills/explain/wait-what/SKILL.md`, moved from `skills/ordo/wait-what/SKILL.md` with `mv`, 52 lines, unchanged.
- `README.md`: 4 insertions and 3 deletions (`git diff --stat` prints 7 changed lines).
- `docs/figures/gen_figures.py`: 1 line.
- `docs/figures/pipeline.svg`: 2 lines.
- `docs/glossary.md`: 4 insertions.

## Judgment calls the brief left open

- The page's file name is formed from each run of letters and digits, lower-cased and joined by hyphens, followed by `.html`. Every other character separates words.
- A path the user gives that names a folder that exists holds the page under the formed name. Any other path is used as the page's file.
- The question before replacing a file at the page's path is in the Stops row "The page's path", together with the request for a path. This keeps the four rows of item 1.
- The offer of a learning record comes once the user has shown understanding, as the format page's "When to write a learning record" says.
- The page is written before the offer of a learning record ("Explaining" items 4 and 5). Each stop stands before the write it guards.
- The source's Philosophy stays a reference section, "Knowledge, skills and wisdom", because the shipped `resources-format.md` says "Mirrors the philosophy in [SKILL.md](../SKILL.md)". The workspace's file list is the reference section "The teaching workspace", which both modes read.
- The lesson's form stands once, in "Teaching" item 8, and "The page" item 4 names it there, so the rule is written once.
- The Use instead table has one row, `/wait-what`. No other skill of this repository is a neighbour.
- The `tutor` row of `README.md` stands after the `wait-what` row.
- "feedback loop" is kept, as stated under "The terms".

## Lists and sentences (verify 7)

The items that run longer than about 20 words, or that hold a list inside one bullet:
- the description: one paragraph, as the layout requires;
- "Teaching" item 6, the desirable-difficulty bullet: one rule with its three techniques, each defined;
- "Teaching" item 7, its first bullet: the rule and its reason;
- "Teaching" item 9, the topics bullet: five topic pairs;
- Rules 5: the rule and the definition of a community, with its examples.

Each keeps one rule with its qualifiers, as "Lists and tables" asks. The two strengths and the three needs are bold-labelled list items.

## Every user-visible change

- `README.md`, the group sentence. Before: "one of four group folders ... `skills/ordo/` holds `ordo-init`, `ordo-help`, `session-retro` and `wait-what`; ... the twenty-one skills". After: "one of five group folders ... `skills/ordo/` holds `ordo-init`, `ordo-help` and `session-retro`; `skills/explain/` holds `tutor` and `wait-what`; ... the twenty-two skills".
- `README.md`, the install loop. Before: `ordo/session-retro ordo/wait-what code/...`. After: `ordo/session-retro explain/wait-what explain/tutor code/...`.
- `README.md`, the count under the loop: "each of the twenty-one skills" became "each of the twenty-two skills".
- `README.md`, a new table row for `tutor`.
- `docs/figures/pipeline.svg`, the note. Before: "... /session-retro, /wizard, and /wait-what and /ordo-help, which have no stop." After: "... /session-retro, /wizard, /tutor, and /wait-what and /ordo-help, which have no stop."
- The installed skill `wait-what` moves to `skills/explain/wait-what`. `utils/pin.sh` relinks it on the next pin, since it reads `skills/<group>/<name>` for any group.
- The new skill `/tutor`, with its four calls in Quick start.
- `docs/glossary.md`, four new entries.

## Anything in the brief that was wrong or impossible

1. **Item 1, "The Stops table holds four rows".** This is a stop, and the orchestrator decides it. Items 4 and the cases add two more points where the run waits or ends: the question for a missing concept ("The call" item 2) and the refusal of `--page` without `explain` ("The call" item 1). Every other skill lists such points in its Stops table: `grant` has "A missing input" and "A config that exists", `paper` has "Unknown mode", "An argument that does not exist" and "A converted file to replace", and `writing` has "Draft refused" (`awk '/^## Stops/...' skills/*/*/SKILL.md`). The skill keeps the brief's four rows, as change-standard rule 4 says, and the two points stand only in their Steps items.
   - Option 1 (recommended): add two rows, "No concept" and "`--page` without `explain`". This matches the layout's Stops section and every other skill. It costs two table rows.
   - Option 2: keep the four rows. The table then omits two points where the run waits or ends.
2. **Item 1, "no `GLOSSARY.md` is added to the workspace", against item 2, "word for word".** The shipped `references/glossary-format.md` opens "`GLOSSARY.md` is the canonical language for this teaching workspace", and `references/learning-record-format.md` line 41 links `[[GLOSSARY.md]]`. Neither page could be changed, because item 2 keeps their words. The skill writes the glossary as a reference document under `reference/`, as "Teaching" item 9 says. Two shipped pages therefore name a file that the skill never writes (change-standard rule 19). Evidence: `grep -n -i 'glossar' .scratch/.../sources/teach/*.md` prints `GLOSSARY-FORMAT.md:1`, `:3` and `LEARNING-RECORD-FORMAT.md:41`. The source has the same inconsistency, as its page `docs-teach.md` line 38 says.
   - Option 1 (recommended): the glossary is written as `reference/GLOSSARY.md` in the format page's structure. Both pages then name a file that exists, and the format page's words stay the source's. The deviation is a Markdown file among `reference/*.html`, which needs a line in ADR 0048 or a ruling.
   - Option 2: keep it as built, with the contradiction between the pages and the skill.
   - Option 3: change the words of the two format pages to name the reference document. Item 2 forbids this.

## Deviations

Every difference between `tutor` and the source `teach`:

| Source has | `tutor` has | Reason | Approved by |
|---|---|---|---|
| `name: teach` | `name: tutor` | the skill runs a course and answers one question | ADR 0048, the name; D2 |
| `description: Teach the user a new skill or concept, within this workspace.` | a one-paragraph description ending in `Triggers on:` | the layout's frontmatter | ADR 0048, the layout point |
| `argument-hint: "What would you like to learn about?"` | no `argument-hint`; the Quick start line `/tutor` for the call with no topic | the layout's frontmatter has no such key | ADR 0048, the layout point; brief decision 6 |
| no version | `metadata.version: "1.0.0"` | the layout's frontmatter | ADR 0048, the layout point |
| `agents/openai.yaml` | none | this repository ships no such file | ADR 0048, the layout point |
| format pages `GLOSSARY-FORMAT.md`, `LEARNING-RECORD-FORMAT.md`, `MISSION-FORMAT.md`, `RESOURCES-FORMAT.md` beside `SKILL.md` | `references/glossary-format.md`, `learning-record-format.md`, `mission-format.md`, `resources-format.md`, words unchanged | the layout puts reference pages in `references/` with lower-case names | ADR 0048, the layout point; brief decision 1 |
| `[SKILL.md](./SKILL.md)` in `RESOURCES-FORMAT.md` | `[SKILL.md](../SKILL.md)` | the page moved one folder down | ADR 0048, the layout point |
| `GLOSSARY-FORMAT.md` linked from no part of `SKILL.md` | `references/glossary-format.md` named from "Teaching" item 9 | the layout: a reference page is named by its path from the step that reads it | ADR 0048, the layout point; brief decision 5 |
| `*-FORMAT.md` links resolve from the skill's folder | paths under `references/` resolve from the skill's folder | the pages moved | ADR 0048, the layout point |
| `/teach` and its sections | `/tutor`, the calls `/tutor [<topic>]`, `/tutor explain <concept>`, `/tutor explain <concept> --page` | the name and the two added calls | ADR 0048, the name, the explain mode and the page; D2, D11 |
| no explain mode | "Steps / Explaining": one concept explained in the conversation, tied to the work at hand, from sources fetched and named, no file written, a learning record offered in a teaching workspace and written on a yes | the user's case of a concept met mid-work | ADR 0048, the explain mode; D2 |
| no page | "Steps / The page": one HTML page in the lesson's form, to `reference/` in a workspace, elsewhere to a path given or asked for; name from the concept's words with no `/` and no `..`; no file replaced without a yes | the page of the explain mode | ADR 0048, the page; D11 |
| no argument checks | "Steps / The call": `--page` without `explain` refused with the three calls; `explain` with no concept asks for it | the calls of the explain mode | ADR 0048, the explain mode and the page (the mode is this repository's own) |
| two stops written in prose | the Stops table with the source's two stops and the explain mode's two | the layout's Stops section | ADR 0048, the layout point and the explain mode |
| the skill in `skills/productivity/teach/` | `skills/explain/tutor/`, beside `skills/explain/wait-what/` | the group folder | ADR 0048, the last sentence; D12, D13 |

The differences that the layout, ASCII and the prose standard force, listed by kind:
- **Sections.** The source's sections became the layout's nine sections: the title and paragraph, Quick start, Use instead with the row `/wait-what`, What it reads, Steps with "The call", "Teaching", "Explaining" and "The page", the reference sections "The teaching workspace" and "Knowledge, skills and wisdom", Stops, Anti-patterns and Rules. "Each heading of the source" above gives where each source section went.
- **Steps.** Each Steps item ends on a "Done when" completion criterion, as the layout requires.
- **Anti-patterns.** The table is made from the source's prohibitions ("Never trust your parametric knowledge", "never inline code a future lesson would duplicate", "Don't give the user any clues", lessons before the mission), with one row for the explain mode.
- **Second person.** The source's "you" (the agent) and "your first job" are written as instructions.
- **ASCII and the prose standard.** The spaced-hyphen asides ("stateful request - they", "from the lessons - cheat sheets", "the mission - the reason", "This is normal - make sure", "citations - links", "immediately - and ideally automatically", "revisited later - reference documents will be", "lessons - they are useful") are reworded. "Think Tufte." became "in the manner of Edward Tufte". "completable very quickly" became "short enough to finish in one sitting". "real-world goals" became "real-world aims", since **goal** is a glossary term. "designed for quick reference" became "made for reference at a glance". "steps to take (for instance, yoga poses)" became "real-world actions, such as yoga poses", since **step** is a plan term.
- **Format pages.** Their text is the source's apart from the one link path. The source copies were already ASCII and one paragraph per line, so no other change was needed.

`wait-what`: moved with `mv`. The `diff` case prints no line, so its `SKILL.md` is unchanged.

## Repair round 1

Every ruling of `agents/briefs/5-round-1.md` is carried out. None was found wrong on the tree. The only shipped file changed is `skills/explain/tutor/SKILL.md`, now 198 lines.

### Findings

1. "Teaching" item 8 now reads "It is beautiful, with clean, readable typography and layout in the manner of Edward Tufte, since the user returns to the lessons later to review." "Teaching" item 9 gains the bullet "Glossaries, in particular, are an essential reference."
2. "Teaching" item 1 now reads `MISSION.md`, the learning records in `learning-records/` and `NOTES.md`, each that exists. Its sub-bullets say that `RESOURCES.md` is read by items 4 and 6 and `assets/` by item 7, before the lesson is written, and that no lesson and no reference document is read whole unless a step needs it. Item 4 now opens with "Read `RESOURCES.md`" and keeps the source's "focus" on finding resources while it is not well populated.
3. "Teaching" item 10 is unchanged. Its criterion now has a row in "Deviations".
4. Two rows are added to "Deviations", one for each ASCII character of the copies.
5. The Stops table gains the rows "`--page` without `explain`" and "No concept", so it has six rows. "The call" items 1 and 2 now name these rows.
6. The criterion of "Explaining" item 5 now reads: "Done at once, with nothing offered, when the folder is no teaching workspace or the user has not shown that they understand the concept; otherwise done when the user has answered, and after a yes the record stands in `learning-records/`."
7. Nothing is changed.
8. Nothing is changed.

### The sentence-by-sentence read against the source

These sentences were weakened or missing in the copy, and are now put back as the source has them:
- "Assets": "Reuse is the default" is added to "Teaching" item 7 as "Reuse of components is the default." The binary contrast "not the exception" is cut, as the prose standard requires.
- "Knowledge": the feedback loop is again "interactive" ("Teaching" item 6).
- "Skills": "Make the knowledge stick" is folded into the effortful-practice bullet of "Teaching" item 6.
- "Teaching Workspace": "loosely equivalent to architectural decision records" is now "Loosely like architectural decision records".
- "Teaching Workspace": the sentence "The state of their learning is captured in this directory in several files" now opens "The teaching workspace".
- "Lessons": "short, and completable very quickly" is now "short and fast to complete". The words "very" and "quick" are banned fillers under the prose standard. The sitting-length wording is removed.
- "Fluency vs Storage Strength": "storage strength is the real goal" is now "the real aim the lessons build towards". **goal** is a glossary term.

Every other sentence of the source stands in `tutor` with its meaning, at the place the heading map gives. The behaviours the copy adds are the rows of "Deviations".

### Checks

- `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1` prints `PASS: pin.sh scratch tests`.
- The character-set check over the 11 existing changed files prints nothing; `exit 0`.
- The YAML command prints `tutor 754 1.0.0 True`.
- `grep -rn 'skills/ordo/wait-what' README.md docs skills utils agents` prints only `docs/roadmap.md:80:...`, and `test ! -e skills/ordo/wait-what; echo "exit $?"` prints `exit 0`.
- `grep -c 'explain/tutor' README.md` prints `1`, and `grep -c 'explain/wait-what' README.md` prints `1`.
- `grep -n 'twenty-one' README.md` prints nothing.
- The loop command prints no line.
- The `diff` case prints nothing; exit 0.

### Deviations, as they now stand

| Source has | `tutor` has | Reason | Approved by |
|---|---|---|---|
| `name: teach` | `name: tutor` | the skill runs a course and answers one question | ADR 0048, the name; D2 |
| `description: Teach the user a new skill or concept, within this workspace.` | a one-paragraph description ending in `Triggers on:` | the layout's frontmatter | ADR 0048, the layout point |
| `argument-hint: "What would you like to learn about?"` | no `argument-hint`; the Quick start line `/tutor` for the call with no topic | the layout's frontmatter has no such key | ADR 0048, the layout point; brief decision 6 |
| no version | `metadata.version: "1.0.0"` | the layout's frontmatter | ADR 0048, the layout point |
| `agents/openai.yaml` | none | this repository ships no such file | ADR 0048, the layout point |
| format pages `GLOSSARY-FORMAT.md`, `LEARNING-RECORD-FORMAT.md`, `MISSION-FORMAT.md`, `RESOURCES-FORMAT.md` beside `SKILL.md` | `references/glossary-format.md`, `learning-record-format.md`, `mission-format.md`, `resources-format.md`, words unchanged | the layout puts reference pages in `references/` with lower-case names | ADR 0048, the layout point; brief decision 1 |
| the range in `GLOSSARY-FORMAT.md`, "A 1{range}10 self-rating", written with a non-ASCII range character in the public source | "A 1-10 self-rating" | ASCII | ADR 0048, the ASCII point |
| the braces' content in `MISSION-FORMAT.md`, "{...}" under "Success looks like", written with an ellipsis character in the public source | "{...}" with three dots | ASCII | ADR 0048, the ASCII point |
| `[SKILL.md](./SKILL.md)` in `RESOURCES-FORMAT.md` | `[SKILL.md](../SKILL.md)` | the page moved one folder down | ADR 0048, the layout point |
| `GLOSSARY-FORMAT.md` linked from no part of `SKILL.md` | `references/glossary-format.md` named from "Teaching" item 9 | the layout: a reference page is named by its path from the step that reads it | ADR 0048, the layout point; brief decision 5 |
| "When to write a learning record" only in `LEARNING-RECORD-FORMAT.md` | Rules 3 names that section of `references/learning-record-format.md` from `SKILL.md` | the layout: a reference page is named by its path from the step or rule that reads it | ADR 0048, the layout point |
| `*-FORMAT.md` links resolve from the skill's folder | paths under `references/` resolve from the skill's folder | the pages moved | ADR 0048, the layout point |
| "If possible, open the lesson file for the user by running a CLI command." with no criterion | "Teaching" item 10 with "Done when the lesson is open, or the user is given its path." | the layout: each item of Steps ends on its completion criterion, which must hold when no command can open the file | ADR 0048, the layout point; round 1 ruling 3 |
| no completion criteria | each item of Steps ends on "Done when" | the layout, "Writing for an agent" | ADR 0048, the layout point |
| `/teach` and its sections | `/tutor`, the calls `/tutor [<topic>]`, `/tutor explain <concept>`, `/tutor explain <concept> --page` | the name and the two added calls | ADR 0048, the name, the explain mode and the page; D2, D11 |
| no explain mode | "Steps / Explaining": one concept explained in the conversation, tied to the work at hand, from sources fetched and named, no file written, a learning record offered in a teaching workspace and written on a yes | the user's case of a concept met mid-work | ADR 0048, the explain mode; D2 |
| no page | "Steps / The page": one HTML page in the lesson's form, to `reference/` in a workspace, elsewhere to a path given or asked for; name from the concept's words with no `/` and no `..`; no file replaced without a yes | the page of the explain mode | ADR 0048, the page; D11 |
| no argument checks | "Steps / The call": `--page` without `explain` refused with the three calls; `explain` with no concept asks for it | the calls of the explain mode | ADR 0048, the explain mode and the page (the mode is this repository's own) |
| two stops written in prose | the Stops table: the source's two stops, the explain mode's offer of a learning record and the page's path, and the rows "No concept" and "`--page` without `explain`" | the layout's Stops section | ADR 0048, the layout point and the explain mode; round 1 ruling 5 |
| the skill in `skills/productivity/teach/` | `skills/explain/tutor/`, beside `skills/explain/wait-what/` | the group folder | ADR 0048, the last sentence; D12, D13 |

The differences that the layout, ASCII and the prose standard force, listed by kind:
- **Sections.** The source's sections became the layout's nine sections: the title and paragraph, Quick start, Use instead with the row `/wait-what`, What it reads, Steps with "The call", "Teaching", "Explaining" and "The page", the reference sections "The teaching workspace" and "Knowledge, skills and wisdom", Stops, Anti-patterns and Rules. The heading map of the step's report gives where each source section went.
- **Anti-patterns.** The table is made from the source's prohibitions ("Never trust your parametric knowledge", "never inline code a future lesson would duplicate", "Don't give the user any clues", a lesson before the mission), with one row for the explain mode.
- **Second person.** The source's "you" (the agent) and "your first job" are written as instructions.
- **ASCII and the prose standard.**
  - The spaced-hyphen asides of the source are reworded, among them "stateful request - they", "from the lessons - cheat sheets", "the mission - the reason", "This is normal - make sure", "citations - links", "immediately - and ideally automatically", "real-world interaction - testing", "attempt to answer - but", "revisited later - reference documents will be" and "these documents - they are useful".
  - "Think Tufte." became "in the manner of Edward Tufte".
  - "completable very quickly" became "fast to complete".
  - "Reuse is the default, not the exception" became "Reuse of components is the default".
  - "real-world goals" became "real-world aims" and "the real goal" became "the real aim", since **goal** is a glossary term.
  - "designed for quick reference" became "made for reference at a glance".
  - "steps to take (for instance, yoga poses)" became "real-world actions, such as yoga poses", since **step** is a plan term.
- **Format pages.** Their text is the source's apart from the link path and the two ASCII characters above.

`wait-what`: moved with `mv`. The `diff` case prints no line, so its `SKILL.md` is unchanged.

The point of ruling 7 stays raised for the user. The format pages name `GLOSSARY.md`, and the workspace writes no file of that name.
