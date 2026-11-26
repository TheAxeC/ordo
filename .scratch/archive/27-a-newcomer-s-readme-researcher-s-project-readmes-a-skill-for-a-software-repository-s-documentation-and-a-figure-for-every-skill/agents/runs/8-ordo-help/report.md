# Step 8: the run of /ordo-help skills

Agent a829b4222f644a0a3, claude-opus-5-5, 80414 tokens, 5 tool uses, 1 min 23 s.

The run of `ordo-help skills` finished. It refused nothing, every step ran as written, and no file was changed.

How the skills folder was found:
- `cd /Users/axelfaes/.claude/skills/ordo-help && pwd -P` gave `/Users/axelfaes/.local/share/ordo-stable/skills/ordo/ordo-help`.
- Its parent `ordo` is a folder directly inside a folder named `skills`, so it is a group folder. The skills folder is therefore `/Users/axelfaes/.local/share/ordo-stable/skills`, and the skill folders are the folders inside each group folder.
- The names were sorted with `LC_ALL=C sort` on the folder name.
- Two folders named `templates` (`literature/templates/` and `writing/templates/`) hold no `SKILL.md`, so they were skipped.

**1. Full output the skill prints, verbatim**

/code-comments
Reviews the comments a git diff adds or changes, with finding and checking agents, and rewrites the comments the user picks in C, C++ and CMake files.
```
/code-comments                    review the comments of the uncommitted changes against HEAD, untracked files included
/code-comments <base>..<head>     review the comments of a range of commits
apply <numbers>                   after a report: rewrite the comments of those findings, the numbers separated by commas or spaces
apply all                         after a report: rewrite the comments of every finding
```

/codebase-design
Holds a repository's code to written standards pages: fills the pages' missing rules, reviews the code against them in an HTML report, and gives the deep-module vocabulary.
```
/codebase-design standards        fill the repository's standards pages: the rules the pages lack, shown as a short draft in groups, written after approval
/codebase-design review [area]    read the code, or the area named, against the standards pages; write the candidates as an HTML report; turn the picked one into a roadmap entry
/codebase-design                  the vocabulary of deep modules, for work that designs or changes a module; writes no file
```

/diagnose
Finds the cause of a defect before changing anything: a red command on the symptom, a shrunk case, ranked falsifiable hypotheses, one-change probes, then the fix.
```
/diagnose <symptom>                        find the cause of a symptom, given in the user's words, in the checkout the skill is run in
/diagnose <entry> <step> <finding>         find the cause of a finding of a plan's step, written as the refuter report names it
/diagnose <entry> <step> red line          find the cause of a red line at the step's landing whose cause is not known
/diagnose <entry> <step> brief check <n>   find the cause of finding <n> of the step's brief check
/diagnose <entry> <step> premise           find the cause a step's text asks to have found, before the step's brief is written
/diagnose <folder>/<entry> <step> ...      each of the four above, from the plan.yaml in <folder>, a path from the repository root
```

/grant
Drafts, revises, reviews and checks a LaTeX grant application against a funder config, in five modes: config, draft, revise, review and check.
```
/grant config <application folder> <call documents>              draft the funder config from the call documents, for approval
/grant draft <application folder> [<section heading>] [<materials>]  write one section, or the whole application, from the materials
/grant draft <application folder> field <field> [<materials>]    write the text of one form field of the funder config into grant-fields.md
/grant revise <main.tex> <comments file>                         change the application by patches for a panel's feedback, a colleague's comments, a criteria review or a /writing report
/grant review <main.tex> [<file> ...]                            score the application per criterion of the funder config, changing nothing, each further file being one the criteria ask about, such as a CV or a recommendation letter
/grant check <main.tex>                                          compile the application and check its limits and its required sections
/grant <request in plain words>                                  pick the mode from the request (Steps 1)
```

/grill
Settles a roadmap entry's design decisions before its plan opens, by an interview in rounds with options, pros and cons and a recommendation, writing each answer.
```
/grill <entry>                                                  interview about the entry, by number or title, including one under "Not yet specified"
/grill <entry> --bar <industry|state-of-the-art|novel>          the same, with this design bar in place of the configured one, for this interview only
/grill <project>/<entry>                                        the same, in a repository whose plan.yaml lists several projects
/grill <folder>/<entry>                                         the same, from the plan.yaml in <folder>, a path from the repository root
/grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision
/grill <entry> --self-rule                                      the same, run by plan-orchestration in next-entry mode: each decision outside the six kinds takes its recommendation
```

/handbook
Writes a software repository's README and documentation of fixed kinds from the code and existing documents, drafting each page and writing only approved drafts.
```
/handbook [<repository folder>]    the whole run on the repository, the current folder when none is named: the kinds, the drafts, then the approved pages written and committed
```

/land
Brings a refuted step from its worktree onto main, runs the checks there, books it in the plan, commits it and removes its worktree.
```
/land <entry> <step>     the only way a step reaches main: bring the refuted step over, check it there, book it, commit it, remove its worktree
/land <folder>/<entry> <step>   the same, from the plan.yaml in <folder>, a path from the repository root
```

/ordo-help
Prints the command sequence for running a plan and where each plan stands, lists every skill with its Quick start, or names the skills fitting a sentence.
```
/ordo-help            print the sequence and the choices awaiting review, then the position and open items of each open plan
/ordo-help <entry>    print the sequence and the choices awaiting review, then the named plan's position and the command that comes next; for the number of an entry with no open plan, what the roadmap says of it
/ordo-help <folder>            the first line, for the plans of the plan.yaml in <folder>, a path from the repository root
/ordo-help <folder>/<entry>    the second line, for a plan of the plan.yaml in <folder>
/ordo-help skills     print each skill's name, one line on what it is for and its Quick start block, in folder-name order
/ordo-help <what you want to do>    name the skills that fit a sentence on what you want to do, such as I want to revise a paper, each with its mode and the command to type
```

/ordo-init
Sets a repository up for the plan skills by what the folder holds: scaffolds a new one, drafts plan.yaml for an existing one, or checks and syncs it.
```
/ordo-init [<path>] [<folder>]   the repository at <path> (default: the current folder), by what it holds: a new repository in an empty folder, docs/plan.yaml and what is missing in an existing repository, the configuration check and the sync of the two blocks where there is a plan.yaml; <folder> holds the plan.yaml, as a path from the repository root; a folder named build is given as ./build
/ordo-init build [<path>] [<folder>]   the build driver: utils/build.py written from the commands of the verification page, the page rewritten to name python3 utils/build.py build, test and check, and the gate run once
/ordo-init ... --ruling <ledger file> "<name>"   the same, under a quoted ruling: a draft, a fix or a sync change the ruling states is written without the stop
```

/paper
Writes, revises, plans and formats a LaTeX manuscript with twelve agent roles and twelve modes, every change applied as a patch by script.
```
/paper full <project folder> [--manuscript <name>]               write a paper from the project's materials, from intake to the formatted manuscript, in manuscript/ or manuscript-<name>/
/paper plan <project folder> [--manuscript <name>]               plan the paper chapter by chapter with the Socratic mentor, to the chapter plan
/paper outline-only <project folder> [--manuscript <name>]       write the outline and the evidence map for approval
/paper revision <main.tex> <comments file>                       revise a manuscript for referee comments or a /writing report, by patch, and write the response letter
/paper revision-coach <comments file> [<main.tex>]               parse reviewer comments into a revision roadmap, a tracking template and a response letter skeleton
/paper rebuttal-audit <comments file> <response draft>           check a response letter you wrote against the reviewer comments
/paper response-letter <main.tex> <comments file>                write and check the response letter for a revision already made
/paper abstract-only <main.tex>                                  write the abstract and the keywords
/paper lit-review "<topic>"                                      review the literature on a topic: an annotated bibliography, a literature matrix and a synthesis
/paper format-convert <manuscript> ["<target>"]                  convert the manuscript to DOCX, PDF, Markdown or LaTeX, its citation style, or a venue's template; a .bib gives its reference list in a citation style
/paper citation-check <main.tex>                                 check the citations and their claims against the sources
/paper disclosure <main.tex> [--venue=<v> | --policy-anchor=<a>] write the venue-specific AI-usage disclosure statement
/paper draft-review <main.tex>                                   review the draft as its own peer reviewer, writing one review and changing nothing
/paper figures <main.tex>                                        draw the figures of an existing manuscript and place them by patch
/paper <request in plain words>                                  pick the mode from the request (Steps 1)
```

/paper-review-panel
Reviews an academic paper from several perspectives with five simulated reviewers, in full, re-review, quick, methodology, guided and calibration modes.
```
/paper-review-panel <manuscript>                                                                 review the paper, a path or pasted text, with the full panel: 5 review reports, the Editorial Decision and the Revision Roadmap
/paper-review-panel full <manuscript>                                                            the same review, with the mode named
/paper-review-panel re-review <revised manuscript> <revision roadmap> [<response to reviewers>]  verify whether the revisions address the review comments
/paper-review-panel quick <manuscript>                                                           the EIC quick assessment and the key issues list
/paper-review-panel methodology-focus <manuscript>                                               the in-depth methodology review report
/paper-review-panel guided <manuscript>                                                          the Socratic guided review, issue by issue
/paper-review-panel calibration <gold set folder>                                                measure the reviewer's error profile against papers with known outcomes
Review this paper: [paste paper or provide file]                                                 the simplest command, a plain request: this one runs full (Steps 1)
```

/plan
Opens a plan for one roadmap entry: creates its ledger folder, writes plan.md with goal, gate and a drafted step list for approval, and the state file.
```
/plan <entry>             open the plan for one roadmap entry: the ledger folder the step skills and the orchestrator run from, its step list drafted for approval
/plan <project>/<entry>   the same, in a repository whose plan.yaml lists several projects
/plan <folder>/<entry>    the same, from the plan.yaml in <folder>, a path from the repository root
/plan <folder>/<project>/<entry>   the same, for one project of the plan.yaml in <folder>
/plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop
/plan <entry> --self-rule   the same, run by plan-orchestration in next-entry mode: the orchestrator takes the drafted step list as its choice
```

/plan-orchestration
Runs every open plan, or the one named, unattended step by step: brief, builder, refuter, repair rounds, landing and booking, stopping only for the user's decisions.
```
/plan-orchestration                  run the steps of every open plan unattended until a pause of every open plan, or until no open plan has an unblocked step; with no plan open, under self_rule: on and next_entry: on, take the next roadmap entry
/plan-orchestration <entry>          the same for the plan of that entry alone
/plan-orchestration <entry> inline   the same, with the orchestrating session building every code step itself
/plan-orchestration <folder>         the first line, for the open plans of the plan.yaml in <folder>, a path from the repository root
/plan-orchestration <folder>/<entry>   the second line, for a plan of the plan.yaml in <folder>
continue the plan                    the same as /plan-orchestration with no entry, resuming from the state files after a compaction or in another session
```

/plan-retro
Reads every refuter report of a repository's plans, groups and counts recurring defect kinds, and proposes for each the change that stops it at its source.
```
/plan-retro             the retro over every refuter run the previous retro did not list
/plan-retro <project>   the same, for one project of a plan.yaml in the projects: form
/plan-retro <folder>    the same, from the plan.yaml in <folder>, a path from the repository root
/plan-retro <folder>/<project>   the same, for one project of the plan.yaml in <folder>
```

/referee
Referees someone else's paper for a journal: five reviewers, graded and budgeted points, and one referee report in one voice; a second round checks a revision.
```
/referee <manuscript>                                                                 referee the paper, a path or pasted text: the first round
/referee re-review <revised manuscript> <response letter> [<the first-round comments>]  referee the revision against the authors' response: the second round
Referee this paper: [paste paper or provide file]                                     a plain request, whose words give the round (Steps 1)
```

/refute
Reviews a built step without changing anything: a fresh reviewer reads the diff against the brief and standards, reruns the checks, and writes verdicts and findings.
```
/refute <entry> <step>   a fresh reviewer reads the step's diff, reruns the checks the brief's "Verify before you report" names and every quoted command, never the plan's whole verify list, and writes verdicts and findings
/refute <folder>/<entry> <step>   the same, from the plan.yaml in <folder>, a path from the repository root
```

/researcher
Takes an idea to results and a paper, through modes for novelty, idea, research, readme, full, integrity, manuscript and revision.
```
/researcher full <project folder> [<sketch file>]                   take a rough idea to a paper: idea, then research and manuscript as it shows them and you confirm
/researcher full <sketch, more than two words>                      take a rough idea typed in the call to a paper, as the line above; the first message asks for the project folder
/researcher idea <project folder> [<sketch file>]                   take a rough sketch to research questions and claims in rounds of the interview, and write them into the project's README.md
/researcher idea <sketch, more than two words>                      take a rough sketch typed in the call through the interview, as the line above; the first message asks for the project folder
/researcher novelty <idea> [<project folder>]                       search the closest prior work on each claim of an idea, a sentence in quotes or a file, and write a page with a verdict per claim and a .bib
/researcher research <project folder>                               take the project's research questions to results through six stages, or resume it from its README.md at the stage that stands
/researcher research adopt <project folder>                         read a project underway that research did not start, and continue it from the first stage not done
/researcher readme <project folder>                                 draft the project's README.md and its code README in the newcomer's layout, and write them after you approve the drafts
/researcher manuscript <project folder>                             write the paper from the project's materials, then check it, review it, revise it and check it again
/researcher manuscript <project folder> --manuscript <name>         write a further paper of the project in manuscript-<name>/, with the same checks, review and revision
/researcher manuscript <main.tex>                                   take a draft that exists from the first integrity check through review, revision and the final check
/researcher manuscript <main.tex> <comments file>                   take a draft with review comments in hand: the first integrity check, then the revision for the comments
/researcher revision <project folder> <comments file> [--manuscript <name>]  answer referee comments on a paper of the project: new results by campaigns of research, then the revision, its response letter and the checks
/researcher integrity <main.tex>                                    check a finished manuscript at the full depth: references, citations, data, originality, claims, the ethics check last
/researcher integrity pre-review <main.tex>                         the same check at the sampled depth of the check before a review
```

/roadmap
Keeps the roadmap of work plans are opened for: shows the open entries, and adds, specifies, moves, marks done or drops entries after approval.
```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one; then the entries not yet specified
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
/roadmap add <entry>                      for an entry under "Not yet specified": drafts its gate and its place in the order, writes it after approval
/roadmap move <entry> before|after <entry>  moves the entry to the place named, after approval
/roadmap done <entry>                     marks it done with the gate's output; the closing step of a plan uses it
/roadmap drop <entry> <reason>            moves the entry to where the file keeps dropped work, with the reason, after approval
/roadmap <project> ...                    the same, for one project of a plan.yaml in the projects: form
/roadmap <folder> ...                     the same, from the plan.yaml in <folder>, a path from the repository root
/roadmap <folder>/<project> ...           the same, for one project of the plan.yaml in <folder>
/roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop
```

/session-retro
Reads Claude Code session transcripts of a plan, one session or a time window, and reports what went well and wrong, each with a proposed change.
```
/session-retro <entry>                 review the Claude Code sessions of a plan, from the commit that added its plan.md to its own last commit, or to the time of the run while it is open
/session-retro <folder>/<entry>        the same, from the plan.yaml in <folder>, a path from the repository root
/session-retro session <session id>    review one Claude Code session with its subagents
/session-retro <start> <end>           review any window, two ISO 8601 times with a zone, such as 2026-09-28T22:51:46+02:00
/session-retro <folder> session <session id>   the session form, from the plan.yaml in <folder>
/session-retro <folder> <start> <end>          the window form, from the plan.yaml in <folder>
```

/spec
Prepares one step of an open plan: checks its authority and premises, writes the brief, has it checked, creates the worktree and records the dispatch.
```
/spec <entry> <step>     write the one file a builder works from, have a fresh agent check it against the tree for a full step, and put the tree in the state the builder expects
/spec <folder>/<entry> <step>   the same, from the plan.yaml in <folder>, a path from the repository root
Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says; then /spec <entry> <step> again
```

/submit
Makes a submission through a web portal from an approved submission sheet, filling the forms and stopping before the final submit, which stays with the user.
```
/submit <url>             the portal at <url>, with the material of the folder the session runs in
/submit <url> <folder>    the portal at <url>, with the material of <folder>
```

/tutor
Teaches one topic over several sessions with a mission, HTML lessons with tasks and learning records, or explains one concept in the conversation from fetched sources.
```
/tutor <topic>                     start or continue teaching a topic in this folder, the teaching workspace
/tutor                             the next lesson of this workspace, chosen from its learning records and its mission
/tutor explain <concept>           explain one concept in the conversation, tied to the work at hand
/tutor explain <concept> --page    the same, and write the explanation as one HTML page in the lesson's form
```

/wait-what
Explains again, in the conversation, a last message the user did not understand, writing no file.
```
/wait-what    the last message did not land: explain it again
```

/wizard
Generates an interactive bash script that walks a person through a setup or procedure, showing and confirming each command; the session checks it but never runs it.
```
/wizard <procedure>    write the script for a procedure, named in the user's words: a setup, a migration or a cutover, with the commands its stages run, each shown and confirmed first
```

/writing
Reviews a draft's prose with a counting script and four fresh agents against the prose standard and academic writing rules, reporting each rule break with no replacement.
```
/writing <file>             review the draft <file>: a .tex main file, a .md, a .txt or a .docx
```

**2. The lines printed for `handbook`**

The line on what it is for:

> Writes a software repository's README and documentation of fixed kinds from the code and existing documents, drafting each page and writing only approved drafts.

Its Quick start block:

> ```
> /handbook [<repository folder>]    the whole run on the repository, the current folder when none is named: the kinds, the drafts, then the approved pages written and committed
> ```

The `handbook` folder is `/Users/axelfaes/.local/share/ordo-stable/skills/code/handbook/`. Its `SKILL.md` has a frontmatter `description`, and that description is what the line above was written from. In this session's own list of available skills, `handbook` appears with no description.

**3. Where `~/.claude/skills/ordo-help` points**

It points to `/Users/axelfaes/.local/share/ordo-stable/skills/ordo/ordo-help`. Output of `ls -l ~/.claude/skills/ordo-help`:

```
lrwxr-xr-x@ 1 axelfaes  staff  62 Nov 26 11:56 /Users/axelfaes/.claude/skills/ordo-help -> /Users/axelfaes/.local/share/ordo-stable/skills/ordo/ordo-help
```

The descriptions and Quick start blocks were extracted with one shell loop over the sorted folders, which read each `SKILL.md`. Its full output is saved at `/Users/axelfaes/.claude/projects/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/tool-results/bxhfn9arj.txt`.
