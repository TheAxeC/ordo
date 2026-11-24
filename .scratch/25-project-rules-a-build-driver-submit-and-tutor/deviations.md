# Deviations of `tutor` from the source skill `teach`

The source is mattpocock's skill `teach`, whose copy as read stands in `sources/teach/` of this ledger. A character outside ASCII is written here by its name in angle brackets.

| Source has | `tutor` has | Reason | Approved by |
|---|---|---|---|
| `name: teach` | `name: tutor` | the skill runs a course and answers one question | ADR 0048, the name; D2 |
| `description: Teach the user a new skill or concept, within this workspace.` | a one-paragraph description ending in `Triggers on:` | the layout's frontmatter | ADR 0048, the layout point |
| `argument-hint: "What would you like to learn about?"` | no `argument-hint`; the Quick start line `/tutor` for the call with no topic | the layout's frontmatter has no such key | ADR 0048, the layout point; brief decision 6 |
| no version | `metadata.version: "1.0.0"` | the layout's frontmatter | ADR 0048, the layout point |
| `agents/openai.yaml` | none | this repository ships no such file | ADR 0048, the layout point |
| format pages `GLOSSARY-FORMAT.md`, `LEARNING-RECORD-FORMAT.md`, `MISSION-FORMAT.md`, `RESOURCES-FORMAT.md` beside `SKILL.md` | `references/glossary-format.md`, `learning-record-format.md`, `mission-format.md`, `resources-format.md`, words unchanged apart from the three rows below | the layout puts reference pages in `references/` with lower-case names | ADR 0048, the layout point; brief decision 1 |
| "A 1<en dash>10 self-rating" in `GLOSSARY-FORMAT.md`, the range written with an en dash | "A 1-10 self-rating", the range written with a hyphen | ASCII | ADR 0048, the ASCII point |
| "{<ellipsis>}" under "Success looks like" in `MISSION-FORMAT.md`, one ellipsis character between the braces | "{...}", three full stops between the braces | ASCII | ADR 0048, the ASCII point |
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
| "Never trust your parametric knowledge.", said of lessons | Rules: "Never trust the model's parametric knowledge", said of every lesson and every explanation | the explain mode draws on sources fetched in the run | ADR 0048, the explain mode |
| "The state of their learning is captured in this directory in several files:" | "The state of the user's learning is captured in these files of the folder:", as the first line of the reference section "The teaching workspace" | the layout's reference section; second person written as an instruction | ADR 0048, the layout point |

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
