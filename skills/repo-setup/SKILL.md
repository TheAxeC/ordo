---
name: repo-setup
description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the standards pages (design principles, coding standards, a UI standard), the building page, a roadmap, a glossary and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and the plan configuration .agents/plan.yaml, and, on request, the git guard hook. Shows the whole tree and every file's text, the git guard hook named by its source, before writing. With sync, compares an existing repository's shared-rules block and its glossary's plan-terms block with their templates and rewrites them after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules, sync the glossary."
metadata:
  version: "3.0.0"
---

# Set up a repository

`/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block and its glossary's plan-terms block equal to their templates. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced blocks.

## Quick start

```
/repo-setup [<path>]          a new repository at <path> (default: the current folder, which must hold no tracked file)
/repo-setup sync [<path>]     an existing repository: its shared-rules block and its glossary's plan-terms block against their templates
/repo-setup ... --ruling <ledger file> "<name>"   either form, under a quoted ruling: a draft or a sync change the ruling states is written without the stop
```

## Use instead

| When | Use |
|---|---|
| An existing repository needs only its plan configuration | `/ordo-init` |
| The repository is set up and its roadmap needs an entry | `/roadmap add <goal>` |

## What it reads

1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `plan-terms.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`, `hooks/git_guard.py`, `hooks/git_guard.settings.json`.
2. The user's answers to "The questions".
3. The names of the files the folder holds, for the languages of question 6.
   - The language of a file is read from its extension: C++ from `.cpp`, `.cc`, `.cxx`, `.h`, `.hpp`, `.hh`; Python from `.py`; TypeScript from `.ts`, `.tsx`, `.svelte`.
   - Files under `.git/` are left out.
4. The `ordo-init` and `roadmap` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`.
5. For `sync`, the repository's `CLAUDE.md` and `docs/glossary.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` and the entries of its `docs/glossary.md` for the exit-2 draft.
6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
   - `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
   - The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
   - It is matched against the bullet's text as written, a quotation mark in it included.
   - A draft is the ruled change when each change it makes to a file has a sub-bullet that states it and equals that sub-bullet.
     - What the skill shows beside the change, such as a gate's answer with its reason or the lines around a place, is not part of what is compared.
   - A text of several lines is compared line for line with the fenced block under its sub-bullet.
   - There is no ruling in any of these cases.
     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
     - The file does not exist, or is neither of those two files.
     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
     - The name is a placeholder in angle brackets, such as `<L>`.
     - The bullet's first line does not end with "(the user)", with or without a full stop after it.
   - With no ruling, the skill says which of these it found.
   - With no ruling, every stop stands.

## Steps

1. Run `git init` when the folder is not a repository.
   - A folder with tracked files is a refusal ("Stops").
2. Ask "The questions", together, in plain prose, each with its default in brackets ("Stops").
   - A question a quoted ruling answers ("What it reads" 6) is not asked.
   - Its answer is the ruling's.
   - The questions the ruling leaves open are asked together.
   - The step is done when every question of "The questions" has its answer.
3. Draft "The tree", every file with its full text.
   - The git guard hook is copied byte for byte, so the draft names it by its path and its source and shows no text for it.
   - Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.
   - The plan-terms block of `docs/glossary.md` is filled from `templates/plan-terms.md`, as the shared-rules block of `CLAUDE.md` is from `templates/shared-rules.md`.
   - A placeholder in a template (`<...>`) is filled from the answers or from the files written before.
   - Every placeholder of an installed standards page is filled from the answers, from the files written before, or with the value the template writes inside it when that is a default value (`<1000>` becomes `1000`).
     - A placeholder is a `<...>` that names what fills it, inside inline code or not (`include/<lib>/`).
     - A language's own angle brackets in code (`std::get<>`, `std::span<const T>`) are code and stay as they are.
     - A placeholder none of these fills is listed with the draft at Steps 4, and the user gives its value.
     - A rule whose condition is a choice placeholder (`<yes or no>`, or a value `or none`) is kept when the answer is yes or a value.
       - With the answer yes, the parenthesis is removed.
       - With a value as the answer, the rule holds the value.
     - Such a rule is left out of the installed page, with its sub-list and the placeholders only it holds, when the answer is no or none.
     - A check the repository does not have yet is written as "checked by reading at review" in place of the placeholder's sentence part, so the page states nothing nobody filled in.
   - `coding-standards/typescript.md` keeps its section "Svelte and SvelteKit" only when the repository uses Svelte or SvelteKit (a `.svelte` file, or the answer to question 3).
     - Otherwise the section, its heading included, is left out of the installed page.
     - A repository that uses Svelte or SvelteKit has a user interface, so with question 6's defaults it gets `docs/dev/ui-standard.md`.
     - The draft shows the answer to question 7 as yes, with the file or the answer that made it so.
   - A placeholder inside an HTML comment that shows an entry's form, as in the roadmap's and the glossary's, is written as it is, since it is the form and not a value.
   - Any other placeholder with no answer is shown to the user.
     - It is never written as `<...>`.
   - The step is done when every file of "The tree" is drafted with its full text, the copied hook named by its source and each placeholder with no value listed.
4. Show the draft, the tree and every file's text, the copied hook named by its source, together ("Stops").
   - Under a quoted ruling, the draft is written without the stop only when four things hold.
     - The ruling answers every question of "The questions".
     - It states `worker`, `reviewer` and `libraries` for `/ordo-init`.
     - Every file of the draft that this skill writes (not the files `/ordo-init` drafts, nor the file the skills CLI writes) is a template filled from the answers, or has its full text in the ruling.
     - Steps 3 lists no placeholder for the user's value.
   - Otherwise the draft is shown whole, and the stop stands.
   - Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.
   - Each placeholder Steps 3 lists is named with it.
   - The step is done when the user has approved or corrected the draft, or a quoted ruling covers it.
5. Write the files the user approved.
   - When the answer to question 10 is yes, `templates/hooks/git_guard.py` is copied to `.claude/hooks/git_guard.py`, that one file, the folders made as needed, over a copy already there.
6. Install the project skills from the repository root, per source: `npx skills add <source> --skill <name> [--skill <name>...] -a claude-code -y`.
   - The CLI copies them into `.agents/skills/`, links them under `.claude/skills/`, and writes `skills-lock.json`.
7. List each installed skill with its description in the Skills section of `CLAUDE.md`.
8. Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`.
   - Its check passes.
   - Under a quoted ruling, `/ordo-init` is run with the same `--ruling` arguments.
   - It skips the stops the ruling covers, as its own text says.
   - The `standards` key it drafts lists every standards page written at Steps 5 except the change standard, which is the `rules` key.
   - The answer to question 5 is passed to it as the repository's commit rule, which its commit follows.
   - The step is done when `/ordo-init` has written `.agents/plan.yaml` and its check passes.
9. Fill the Build section of `CLAUDE.md` and the command block of `docs/dev/change-standard.md` from `docs/dev/building.md`.
10. Run the checks:

    ```sh
    python3 <this skill's folder>/templates/sync_rules.py .
    python3 <ordo-init's folder>/templates/check_config.py .
    LC_ALL=C grep -rn '[^ -~]' CLAUDE.md README.md docs/
    git check-ignore -q --no-index .agents/skills/probe && ! git check-ignore -q --no-index .agents/plan.yaml
    ```

    - When the answer to question 10 is yes, a fifth check runs: `python3 -c 'import sys; sys.exit(sys.version_info < (3, 9))'`.
    - The setup is done when the first two exit 0, the scan prints nothing, the `git check-ignore` line exits 0, and, when the answer to question 10 is yes, the Python version check exits 0.
11. Show the user what the setup leaves for them to act on: each check's output and, when the answer to question 10 is yes, `templates/hooks/git_guard.settings.json`, for the user to add to `.claude/settings.json` or `.claude/settings.local.json`, into its `hooks.PreToolUse` list when the file already has one.
    - A Claude Code session started in the repository after the text is added reads it.
    - The step is done when the outputs and, when the answer to question 10 is yes, the settings text are shown.
    - The setup goes on to Steps 12 without waiting for the text to be added.
12. Commit the setup's other files in one commit by explicit path list, the subject naming the repository's setup.
    - Every file written is named, except those `/ordo-init` committed at Steps 8.
    - The commit is made only when the answer to question 5 allows it.
    - Otherwise the skill stops ("Stops").
    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
    - When no commit is made, the list of files the stop shows names the ruling the same way.
    - `.agents/skills/` and `.claude/` are ignored and not committed.
    - `skills-lock.json` is committed.
    - The step is done when the files are committed, or the stop "No commit allowed" shows them.

### sync

1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`, which checks the shared-rules block of `CLAUDE.md` and then the plan-terms block of `docs/glossary.md`.
   - Steps 2 to 9 follow its exit status and, on exit 2, its `error:` lines.
2. Exit 0: both blocks equal their templates, so nothing is to be done.
3. Exit 1, when a block differs: show the diff of each block that differs, for the user's ruling per hunk ("Stops").
   - The template's text goes into the repository: `--write`, after the approval.
   - Or the repository's text is the wording wanted everywhere: the change goes into `templates/shared-rules.md` or `templates/plan-terms.md` in this skill's folder, after which every repository set up from it differs until it is synced.
   - Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.
   - A diff whose hunks are not the ruling's is shown whole, and the stop stands.
   - The item is done when each hunk has the user's ruling or the quoted ruling's choice.
4. Exit 2 with `error: CLAUDE.md has no single shared-rules block` or `error: docs/glossary.md has no single plan-terms block`: draft the change for each block the lines name.
   - The shared-rules block inserted after the opening paragraph of `CLAUDE.md`.
   - Each rule of the existing `CLAUDE.md` that the block now states, listed for removal with the block rule that replaces it.
   - A rule that differs in substance, kept in Project rules and named.
   - With no `docs/glossary.md`, the file written from `templates/docs/glossary.md`, its plan-terms block filled from `templates/plan-terms.md`.
   - With a `docs/glossary.md` that has no single block, the plan-terms block inserted after its opening paragraph, and each existing entry that the block now defines listed for removal.
5. Show the drafted change ("Stops").
   - Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text.
   - The rules of Steps / sync 4 are worked on it.
   - A draft that is still the ruled change is written without the stop.
   - A draft that differs from it is shown whole with each difference named.
   - The stop then stands.
   - The item is done when the drafted change is shown, or written under a quoted ruling.
6. Write it once the user approves.
7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names.
   - A no-single-block line of the same run is still drafted, as step 4 says.
   - Show the line with the file it names ("Stops").
   - The file named in the line is fixed first, by the user or with the user's approval.
8. After a written draft or a fixed file: run the check again, at most twice, following steps 2 to 7 on its exit status each time.
   - A check that does not exit 0 on the second of those runs is a stop ("Stops").
9. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it, and otherwise stop ("Stops").
   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
   - When no commit is made, the list of files the stop shows names the ruling the same way.
   - The item is done when the change is committed, or the stop shows the files changed.

## The questions

1. The repository's name and one paragraph on what it is.
2. The kind, for the `.gitignore` and the build files: `cpp`, `python`, `typescript`, or another the user names (then the user gives the build system and the patterns to ignore).
3. The build system, language standard and test harness, as far as the user fixes them now.
4. The license [MIT] and its holder.
   - MIT is written from `templates/LICENSE-MIT`.
   - Another license is written from the text the user gives or from its SPDX name's official text, fetched and shown.
5. The commit rule for this repository [commit only when told].
6. The standards pages: Ordo's defaults [the defaults], or pages copied from a sibling repository the user names (each read whole and adapted to this repository's names), or pages written from rules the user states.
   - The defaults are `docs/dev/design-principles.md` and `docs/dev/coding-standards/common.md` always, a language page under `docs/dev/coding-standards/` for each language of question 2 and each language whose files the folder holds, and `docs/dev/ui-standard.md` when the user says the repository has a user interface.
   - A language with no template page (any kind other than C++, Python and TypeScript) gets no language page from the defaults.
     - The draft at Steps 4 says so.
     - The user may give that language's rules under the third answer.
7. Does the repository have a user interface a reader sees and operates? [no]
8. The project skills: the set in a sibling repository's `skills-lock.json` the user names, a list the user gives, or none.
9. Rules that belong to this repository only, for the Project rules section.
10. Install the git guard? [no]
    - It is a hook that refuses `git push`, `git reset --hard`, `git clean` with force and `git checkout` or `git restore` of the whole tree in an agent's commands, which the user then runs by hand.
    - It is copied into `.claude/hooks/`, which `.gitignore` ignores, so each clone installs it itself.
    - It needs `python3` 3.9 or later.

## The tree

```
CLAUDE.md                        templates/CLAUDE.md, the shared-rules block filled from templates/shared-rules.md
README.md                        the name, the paragraph, how to build (a pointer to docs/dev/building.md), the license line
LICENSE
.gitignore                       templates/gitignore/common.gitignore, then the kind's file
skills-lock.json                 written by the skills CLI when the project skills are installed
docs/dev/change-standard.md      templates/docs/dev/change-standard.md, its placeholders filled
docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md
docs/dev/design-principles.md    templates/docs/dev/design-principles.md, its placeholders filled, when question 6 gave the defaults
docs/dev/coding-standards/common.md   templates/docs/dev/coding-standards/common.md, its placeholders filled, when question 6 gave the defaults
docs/dev/coding-standards/<language>.md   templates/docs/dev/coding-standards/<language>.md for each language as question 6 says, its placeholders filled, when question 6 gave the defaults
docs/dev/ui-standard.md          templates/docs/dev/ui-standard.md, its placeholders filled, when question 6 gave the defaults and the repository has a user interface
<the pages question 6 names>     the pages copied from a sibling repository or written from the user's rules, at the paths the answer gives, in place of the default pages above, or beside them for a language with no template page
docs/dev/building.md             written by /ordo-init from the build files
docs/roadmap.md                  the roadmap skill's templates/roadmap.md
docs/glossary.md                 templates/docs/glossary.md, the plan-terms block filled from templates/plan-terms.md
docs/adr/README.md               templates/docs/adr/README.md
docs/adr/template.md             templates/docs/adr/template.md
src/                             the source tree, with the build files for the kind as far as question 3 fixed them
utils/                           scripts the build and the checks run
.agents/plan.yaml                written by /ordo-init
.claude/hooks/git_guard.py       templates/hooks/git_guard.py when question 10 is yes, ignored by .gitignore, so it stays in this clone
```

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The questions | Every setup, at Steps 2, for each question a quoted ruling does not answer | The questions asked, each with its default | The user's answers |
| The draft | Every setup, at Steps 4, except a draft a quoted ruling covers as Steps 4 says | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |
| A hunk to rule on | `sync` exits 1, except a diff whose hunks are a quoted ruling's (Steps / sync 3) | The diff | The user's ruling per hunk |
| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5) | The change Steps / sync 4 drafts | The user's approval |
| A file sync cannot use | `sync` exits 2 with one of the `error:` lines of Steps / sync 7 | The `error:` line and the file it names | The file fixed, then the check again (Steps / sync 8) |
| The check still fails | The check run again after the change does not exit 0 on its second run (Steps / sync 8) | The check's output | The user's decision, then `/repo-setup sync` again |
| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, the quoted ruling named when they were written under one, and the command that shows them (`git status --short`) | The user's commit |
| Tracked files | The folder for a new repository holds tracked files | A refusal that names `/repo-setup sync` and `/ordo-init` | One of those, or a folder with no tracked file |

- The first seven rows are stops: each waits on the user.
- The last row is a refusal: it names its cause and changes nothing.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A build file for something the user did not name | It fixes a choice nobody made | See Rules: build files only for what the user names |
| A coding rule that is neither in Ordo's shipped pages nor stated by the user | The repository then binds builders to something nobody decided | See Rules: the skill adds no other rule |
| The plan skills installed per project | Two copies load, and the project's copy drifts from the user's | See Rules: the plan skills are installed per user |
| A `<...>` placeholder written into a file, other than one inside an HTML comment that shows an entry's form | The file then states something nobody filled in | See Steps 3 |

## Rules

- Everything the skill writes comes from `templates/` in this skill's folder, from the user's answers, and from the `ordo-init` and `roadmap` skills beside it.
- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
  - A quoted ruling that covers the draft as Steps 4 says is that approval.
- The skill writes nothing outside the repository's folder, except a change to `templates/shared-rules.md` or `templates/plan-terms.md` the user rules on in `sync`.
- The skill adds no rule other than Ordo's shipped defaults and the user's.
- Build files are written only for what the user names.
- The plan skills are never installed per project: they are installed per user, and one copy is loaded.
- The skill never writes a Claude Code settings file: it shows the git guard's settings text for the user to add, as Steps 11 says.
- Every file it drafts is ASCII with one paragraph per source line, as the prose standard says.
- Every file it drafts carries no history, as the shared rules say.
- The copied git guard hook is copied byte for byte.
