# The plain request

The session reads this page at Steps 1 when the first word after `/paper` is not the name of a mode or a call. It reads it at Steps 2 when an argument is given in words. It picks the mode from the request, takes the mode's arguments from the request, and gives both to the intake agent. The intake agent's record shows them at the intake confirmation, for the user to confirm or correct.

## Picking the mode

- The session compares the request with the rows of the three tables below. The order is "Requests that fit two modes", "Request kinds", "Requests for a mode this skill does not have".
- The first row whose kind the request fits decides. The plan row stands before the full row in "Request kinds", so a request in plan's signals picks plan.
- A row of "Requests that fit two modes" holds the bare request. A request that names more, such as a topic, a file of comments or a venue, is judged by the other tables.
- A request that is about something other than a paper is the refusal "Unknown mode", which lists the nine modes and the two calls.
- A request to write a paper that fits no row of the tables, and a request from a user who has nothing in hand yet, picks plan. The intake confirmation shows the mode picked, as "The confirmation" says.
- A request that fits both plan and full picks plan, with no stop. The intake confirmation shows that full mode is the other choice, and the user may correct the mode there.
- A request is judged by what it asks for, so a different wording of a listed kind fits that kind.

## Requests that fit two modes

The session asks about these before intake, as the stop "The mode to run". The question names the two modes and what each would do, and the user's answer picks the mode. Choosing a mode this skill does not have gives its row of the table "Requests for a mode this skill does not have". A request that fits both plan and full is not one of these rows, since it picks plan.

| The request | The two modes | What each would do |
|---|---|---|
| "Help me write an outline" | outline-only, or plan mode | outline-only writes the outline, the evidence map and the argument map for approval. Plan mode guides the user chapter by chapter with a Socratic mentor, and ends with the chapter plan. |
| "Help me revise my paper", "improve my paper" | revision, or a full rewrite in full mode | The session first asks whether there are reviewer comments. Revision changes the manuscript for the comments or instructions given. Full mode writes the paper again from the project's materials. |
| "Help me with my revision" | revision, or the referee comments parsed | revision changes the manuscript for the instructions given. The parsed comments and the response letter are `rebuttal`'s. |
| "Help me search for literature", "find literature on <topic>" | lit-review, or a research investigation | lit-review writes an annotated bibliography, a literature matrix and a synthesis analysis on the topic, by the intake agent and then the literature strategist (academic-paper's agents 1 to 2, "Annotated bibliography + synthesis"). A research investigation is `researcher`'s, which roadmap entry 13 builds. |
| "The paper format is wrong" | citation-check, or format-convert | citation-check corrects the reference entries and their format. format-convert converts the manuscript to another format, another citation style or a venue's template. |
| "Review my paper", "review my draft" | draft-review, or the panel review of `paper-review` | draft-review is the peer reviewer's own-draft review, one review file, nothing changed. `paper-review` is a panel of reviewers and an editor. |

## Request kinds

The Spectrum column labels how much the mode varies from run to run. Fidelity means template-heavy, predictable output. Balanced is the default. Originality means exploratory, template-light output. A call that runs one role has no label.

| The request asks for | Mode | Spectrum |
|---|---|---|
| Guidance through the plan of a paper, which the request shows by one of the six signals below | plan | originality |
| A paper written from a project's materials, such as "write a paper on <topic>", "write a paper from this project", or "I have research results, help me write a paper" | full | balanced |
| A paper outline for a named topic or project, such as "give me a paper outline for <topic>" | outline-only | balanced |
| A paper revised, such as "revise section 3", "revise this paper based on feedback", or "revise the paper for the referee comments in <file>" | revision | fidelity |
| An abstract, such as "write an abstract for this paper" | abstract-only | fidelity |
| A literature review, such as "do a literature review on <topic>" | lit-review | fidelity |
| The citations of a paper checked, such as "check my citations" or "check the citations in this paper" | citation-check | fidelity |
| An AI disclosure, such as "AI disclosure for Nature" or "generate an AI usage statement" | disclosure | fidelity |
| A draft reviewed once as its author's own reviewer, such as "give me a peer review of my draft before I revise it" | draft-review (call) | none |
| Figures drawn for an existing manuscript, such as "make the figures for my paper" | figures (call) | none |
| A manuscript converted to another format, another citation style or a venue's template, such as "convert this paper to LaTeX", "convert it to DOCX", "convert the citations to IEEE" or "format it for <venue>" | format-convert | fidelity |

The six signals of plan mode are each sufficient. The session detects the meaning, in any language, and not the exact words.

| Signal | Example |
|---|---|
| The user wants to be guided through writing the paper and not be given a finished one | "guide my paper", "lead me through writing my paper" |
| The user asks for step-by-step or chapter-by-chapter planning | "I want to plan my paper step by step" |
| The user is unsure how to start or how to structure a paper | "I do not know how to start", "I do not know how to structure my paper" |
| The user is writing a first paper, or says so as a beginner | "this is my first paper" |
| The user has results and no shape for a paper | "I have results but don't know how to turn them into a paper" |
| The user wants to think through each section before writing | "I want to think about each section first" |

- A request that shows one of these signals and also fits full mode, such as "I have results but don't know how to turn them into a paper", picks plan.

- A request for a revision gives the request as the revision's instructions, and intake asks for them again in full, as `references/intake.md` says: a comments file, text, or none.
- A request to calibrate the claim check, such as "calibrate the citation check", is the procedure "Calibration" of `references/citation-compliance.md`. It is none of the nine modes, and the session runs it without intake.
- A request to improve or revise a paper with no feedback named is the row "Help me revise my paper" above. Intake asks first whether there are reviewer comments, as the source's mode table does.

## Requests for a mode this skill does not have

| The request asks for | The session gives |
|---|---|
| Referee comments parsed into a plan, such as "I got reviewer comments", "parse these reviews", "should we push back on reviewer 2", "conference rebuttal" or "grant response" | The row of "Use instead" for `rebuttal`. |
| A written response to referee comments audited, such as "audit my rebuttal draft" or "did I miss any reviewer comment" | The row of "Use instead" for `rebuttal`. |

## Arguments from the request

The session takes the arguments of the mode's Quick start line from the request, and from the words of a mode call whose argument is not a path.

- A path the request names that exists is the argument it fits. That is the project folder for full, outline-only and plan, and the main `.tex` for the calls and the other modes. Lit-review takes no path. Format-convert takes the manuscript, which is a `.tex` that holds `\documentclass`, or a `.md`, a `.docx` or a `.bib` that the words name.
- Format-convert takes its target from the request's words, such as "to DOCX" for `docx` or "to IEEE" for `ieee`. A request that names no target takes Markdown, and the intake confirmation shows it.
- A request for revision that names two existing files takes the `.tex` as the manuscript and the other file as the comments file.
- A request for revision that names a manuscript and no comments file has the whole request as its instructions.
- A request for lit-review takes the phrase that follows "on", "about" or "of" as the topic, as the request words it.
- A name or a description in place of a path is words that name a file or folder. The session searches for it from the folder it runs in and from any folder or repository the words name, with `find`, `ls` and `grep`, and reads the files' content.
- A main `.tex` is the file that holds `\documentclass`, found with `grep -l -F '\documentclass'`, whose name, `\title{...}` or first lines hold the words.
- A comments file is a file whose content is referee comments or a `/writing` report.
- A request that names no path and no words for one takes the folder the session runs in as the folder to search.
- One fitting file or folder is taken.
- Several are listed at the intake confirmation with the words, and the user chooses.
- None is the refusal "An argument that does not exist", which names what was looked for and shows the mode's Quick start line.
- A literal path keeps working and is taken as it stands.
- Every path and every value taken from the request reaches a command as one single-quoted argument (Steps 2).

## The confirmation

- The intake agent writes the rows "Mode", "Request" and "Taken from the request" into `config.md`. It writes them from the mode, the request and the arguments the session gives it (SKILL.md, Steps 6). The mode row says the mode was picked from the request, and the Request row holds the request as the user wrote it. The last row lists each argument taken and the words it was taken from.
- A mode call with an argument in words gets the Request and "Taken from the request" rows too.
- The intake confirmation shows these rows with the rest, and the user confirms them or corrects the mode or an argument.
- A corrected mode that is another of the nine starts the intake agent again for that mode. The stop "The mode to run" does not repeat.
