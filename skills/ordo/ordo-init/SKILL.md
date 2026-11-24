---
name: ordo-init
description: "Set a repository up for the plan skills, by what the folder holds. In an empty folder it sets up a new repository: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the standards pages, a roadmap, a glossary and an ADR folder, src/ and utils/, .gitignore, LICENSE, README, the project skills and the plan configuration docs/plan.yaml. In an existing repository with no plan.yaml it drafts docs/plan.yaml from what the repository has and offers what it lacks: pages, the shared rules in CLAUDE.md, the glossary's plan terms, the ignore rules, and syncs a block that is already there. In a repository with a plan.yaml it checks that file, then compares the shared-rules block and the glossary's plan-terms block with their templates. It shows every draft and writes after approval. Triggers on: ordo-init, set up the plan skills, init plan.yaml, configure ordo, check plan.yaml, set up a new repo, scaffold a repository, new project repo, sync the shared rules, sync the glossary."
metadata:
  version: "4.0.0"
---

# Set a repository up for the plan skills

`/ordo-init` sets a repository up for the plan skills (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`), by what it finds in the folder: a new repository set up whole in an empty folder, the plan configuration `docs/plan.yaml` drafted, what is missing offered and the two blocks synced in an existing repository, and, in a repository that has a plan configuration, the configuration check of that file and the sync of the shared-rules block and the glossary's plan-terms block. It leaves behind the approved tree or files with the `.gitignore` lines it needed, or the fixed configuration on disk and the synced blocks, the files it wrote in a new or an existing repository and a sync change committed when the repository's commit rule allows it, a file git ignores written and left out of the commit.

## Quick start

```
/ordo-init [<path>] [<folder>]   the repository at <path> (default: the current folder), by what it holds: a new repository in an empty folder, docs/plan.yaml and what is missing in an existing repository, the configuration check and the sync of the two blocks where there is a plan.yaml; <folder> holds the plan.yaml, as a path from the repository root
/ordo-init ... --ruling <ledger file> "<name>"   the same, under a quoted ruling: a draft, a fix or a sync change the ruling states is written without the stop
```

## Use instead

| When | Use |
|---|---|
| The repository is set up and its roadmap needs an entry | `/roadmap add <goal>` |
| The configuration and the roadmap exist and a plan is to be opened | `/plan <entry>` |

## What it reads

1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `plan-terms.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py` and `check_config.py`.
2. The plan skill's `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several): the keys, which are required, each optional key's default, and the comment that says what the key is.
   - The `plan` skill's folder is found from this skill's folder with every link resolved: the folder of that name beside it, and otherwise the folder of that name in a group folder beside this skill's group folder.
   - `templates/check_config.py` finds the `plan` skill's folder in the same order.
   - A `plan` folder that is in neither of those two folders is a refusal, made at Steps 1 before anything is drafted or written, that names the folder and the two folder paths ("Stops").
3. The `roadmap` skill's `templates/roadmap.md`.
   - The `roadmap` skill's folder is found as item 2 finds the `plan` skill's folder.
   - A `roadmap` folder that is in neither of those two folders is the same refusal, made at Steps 1 before anything is drafted or written, that names the folder and the two folder paths ("Stops").
4. The plan configuration, when the repository has one: the first `plan.yaml` found in the folder the call names, then in `.scratch/`, `docs/` and `.agents/` at the repository root, the order the `plan` skill's "What it reads" 1 states.
   - `<folder>` names the `plan.yaml` as the part in front of the entry does in a call of `/plan`: the folder that holds it, as a path from the repository root, with a project's name after it in the `projects:` form.
   - The folder is the longest leading part of `<folder>` that is a folder holding a `plan.yaml`, and what is left of `<folder>` names a project of that file: `/ordo-init . tools/a` reads the project `a` of `tools/plan.yaml`.
   - That folder is found by testing each leading part of `<folder>` for a file `plan.yaml`, the longest first, and when no part holds one the call ends with a message that names `<folder>` and writes nothing.
   - `python3 <this skill's folder>/templates/check_config.py --find . [<the folder>]` prints the file's path, or exits 1 with the places looked in when there is none.
   - The command takes the folder alone: a project's name is taken off `<folder>` before the command runs, and is used afterwards to choose the project in the file found.
   - `<folder>` is given only after `<path>`, and a single argument is the path.
   - Without `<folder>`, the `plan.yaml` is the first found in the three places at the repository root.
5. The repository: `git ls-files`, the CI configuration (`.github/workflows/`, `.gitlab-ci.yml` and the like), the build and package files (`package.json` scripts, `Makefile`, `CMakeLists.txt` and `CMakePresets.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`), the documentation folders, `README.md`, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, and `.gitignore`.
   - The names of the files the folder holds give the languages of question 6.
   - The language of a file is read from its extension: C++ from `.cpp`, `.cc`, `.cxx`, `.h`, `.hpp`, `.hh`; Python from `.py`; TypeScript from `.ts`, `.tsx`, `.svelte`.
   - Files under `.git/` are left out.
6. `references/new-repository.md` in this skill's folder, with "The questions" and "The tree", and the user's answers to the questions.
   - A new repository reads the page whole.
   - An existing or a configured repository reads its questions 1, 5 and 9, only when `CLAUDE.md` is written from `templates/CLAUDE.md`.
7. The repository's commit rule.
   - In a new repository it is the answer to question 5.
   - In an existing repository it is the answer to question 5 when "Steps / An existing repository" 6 asks it, and otherwise the user's answer at the approval stop of "Steps / An existing repository" 13.
   - In a configured repository it is what the repository's rules state, in its `CLAUDE.md` or in the page its `rules` key names.
     - When they state none, the skill asks whether it may commit at the stop that shows the change ("Steps / A configured repository" 9 and 11), with the change.
     - Where "Steps / A configured repository" 10 asks question 5, its answer is the commit rule.
   - Under a quoted ruling that states whether the skill may commit, the commit rule is what the ruling states.
   - The question whether the skill may commit is not asked when every file of the change is ignored by git, since no commit is then made, as Rules says of a file git ignores, and where an item asks it together with other questions it is left out of them.
8. For the sync, the repository's `CLAUDE.md` and its glossary, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` and the entries of its glossary for the exit-2 draft.
   - The glossary is the page the plan configuration names in its `standards` list, as `/plan`'s "What it reads" 1 says.
   - In the `projects:` form, the glossary is read from the `standards` list of the project the call names.
   - In the `projects:` form with no project named, the glossary is read from the first project in the file's order whose list names one.
   - With a `standards` list that names no glossary, the glossary is `docs/glossary.md`.
9. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
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

Run from the repository root, the folder `<path>` names or else the current folder.

1. Find the case from what the folder holds, in this order.
   - A plan configuration found ("What it reads" 4) makes it a configured repository: follow "Steps / A configured repository".
   - Otherwise a tracked file, a line `git ls-files` prints, makes it an existing repository: follow "Steps / An existing repository".
   - Otherwise the folder, with no tracked file or with no git repository, gets a new repository: follow "Steps / A new repository".
   - No argument chooses the case.
   - Before a case is followed, the `plan` skill's folder and the `roadmap` skill's folder are found as "What it reads" 2 and 3 say, and a folder in neither of its two folders is the refusal "A skill's folder not found" ("Stops").
   - The step is done when the case is known and both folders are found, or the refusal is raised with nothing drafted or written.

### A new repository

1. Run `git init` when the folder is not a repository.
   - The step is done when the folder is a git repository.
2. Read `references/new-repository.md` and ask "The questions" of that page, together, in plain prose, each with its default in brackets ("Stops").
   - A question a quoted ruling answers ("What it reads" 9) is not asked.
   - Its answer is the ruling's.
   - The questions the ruling leaves open are asked together.
   - The step is done when every question of the page has its answer.
3. Draft "The tree" of `references/new-repository.md`, every file with its full text.
   - Under a quoted ruling ("What it reads" 9), a file whose full text the ruling holds is drafted as that text.
   - The plan-terms block of `docs/glossary.md` is filled from `templates/plan-terms.md`, as the shared-rules block of `CLAUDE.md` is from `templates/shared-rules.md`.
   - Before a file is drafted, its path is checked as Rules says of a file git ignores, and the draft marks an ignored file as that rule says.
   - A placeholder in a template (`<...>`) is filled from the answers or from the files written before.
   - Every placeholder of an installed standards page is filled from the answers, from the files written before, or with the value the template writes inside it when that is a default value (`<1000>` becomes `1000`).
     - A placeholder is a `<...>` that names what fills it, inside inline code or not (`include/<lib>/`).
     - A language's own angle brackets in code (`std::get<>`, `std::span<const T>`) are code and stay as they are.
     - The year of `LICENSE` is the year of the day the skill runs.
     - The calibration exemplar line of `docs/dev/prose-standard.md` is written as "Calibration exemplar: none yet.", since a new repository has no approved page.
     - The layers and the goals of `design-principles.md` are the answer to question 10.
     - A placeholder none of these fills is listed with the draft at "Steps / A new repository" 4, and the user gives its value.
     - A rule whose condition is a choice placeholder (`<yes or no>`, or a value `or none`) is kept when the answer is yes or a value.
       - With the answer yes, the parenthesis is removed.
       - With a value as the answer, the rule holds the value.
     - Such a rule is left out of the installed page, with its sub-list and the placeholders only it holds, when the answer is no or none.
     - A check the repository does not have yet is written as "checked by reading at review" in place of the placeholder's sentence part, so the page states nothing nobody filled in.
     - The closing paragraph of `design-principles.md` is the exception: when the repository has no check for any principle, the whole paragraph is written as the one sentence "Each principle is checked by reading at review."
   - A default coding-standards page written into a repository, the common page or a language page, names no tool the repository does not configure.
     - A tool here is a formatter, a linter or a static type checker run as its own command.
     - A language's own compiler and its configuration file are not such a tool.
     - A tool counts as configured only when the repository holds its configuration file or section, or the user named it in an answer.
     - For a tool that is not configured, each rule of the page is split by requirement, as the `codebase-design` skill's "Steps / standards" 5 splits a rule that names a tool.
     - A requirement that can be read and followed without the tool is written in plain words, without the tool's name, its rule codes or its configuration file.
     - What only the tool can do is left out: that it runs, its configuration, and a selection of its rule groups.
     - A line that names a rule code of the tool names the tool.
     - A placeholder for a check that only such a tool runs is left out with it, and the bullet on "checked by reading at review" above holds for every other placeholder of a check.
     - The common page's Formatting rule is written for the languages whose formatter is configured, each named, and is left out only when no language of the repository has a configured formatter.
     - With one language configured out of two, the rule opens with that language in place of "Each language": in a made-up repository of C++ and Python whose only configured formatter is a Python formatter named `pyfmt`, it reads "Python has one formatter, `pyfmt`, with its configuration pinned in the repository.", and its two other sentences speak of that formatter alone.
     - With no linter configured, a made-up rule "A handler names the exception class it catches. The linter's rule `X100` fails a bare handler." is written as "A handler names the exception class it catches."
     - The draft lists, in one line per page, the tools left out.
   - `coding-standards/typescript.md` keeps its section "Svelte and SvelteKit" only when the repository uses Svelte or SvelteKit (a `.svelte` file, or the answer to question 3).
     - Otherwise the section, its heading included, is left out of the installed page.
     - A repository that uses Svelte or SvelteKit has a user interface, so with question 6's defaults it gets `docs/dev/ui-standard.md`.
     - The draft shows the answer to question 7 as yes, with the file or the answer that made it so.
   - A placeholder inside an HTML comment that shows an entry's form, as in the roadmap's and the glossary's, is written as it is, since it is the form and not a value.
   - Any other placeholder with no answer is shown to the user.
     - It is never written as `<...>`.
   - The step is done when every file of the tree is drafted with its full text and each placeholder with no value listed.
4. Show the draft, the tree and every file's text, together ("Stops").
   - Under a quoted ruling, the draft is written without the stop only when four things hold.
     - The ruling answers every question of `references/new-repository.md`.
     - It states `worker`, `reviewer` and `libraries` for "Steps / An existing repository" 6.
     - Every file of the draft that "Steps / A new repository" 5 writes (not the files "Steps / An existing repository" drafts, nor the file the skills CLI writes) is a template filled from the answers, or has its full text in the ruling.
     - "Steps / A new repository" 3 lists no placeholder for the user's value.
   - Otherwise the draft is shown whole, and the stop stands.
   - Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.
   - Each placeholder "Steps / A new repository" 3 lists is named with it.
   - The step is done when the user has approved or corrected the draft, or a quoted ruling covers it.
5. Write the files the user approved.
   - The step is done when each approved file is on disk.
6. Install the project skills from the repository root, per source: `npx skills add <source> --skill <name> [--skill <name>...] -a claude-code -y`.
   - The CLI copies them into `.agents/skills/`, links them under `.claude/skills/`, and writes `skills-lock.json`.
   - The step is done when `skills-lock.json` lists each project skill, or the answer to question 8 is none.
7. List each installed skill with its description in the Skills section of `CLAUDE.md`.
   - When the answer to question 8 is none, `CLAUDE.md` is drafted and written without the Skills section, its heading included, since no `skills-lock.json` exists.
   - The step is done when the Skills section lists each installed skill, or `CLAUDE.md` has no Skills section.
8. Follow "Steps / An existing repository" on the tree written, with its own draft and approval: it writes `docs/plan.yaml` and `docs/dev/building.md`.
   - No command meant for the verification page is run, whether the user named it in question 3 or the skill read it from a build file it wrote, since the tree holds no source for it.
   - Each such command is written on the verification page as named.
   - The draft of the configuration says, beside each command, that it was not run and why.
   - The stop "A failing command" is not raised from this item.
   - Its configuration check passes.
   - Under a quoted ruling, it runs under the same ruling.
   - It skips the stops the ruling covers, as its own items say.
   - The `standards` key it drafts lists every standards page written at "Steps / A new repository" 5 except the change standard, which is the `rules` key.
   - The answer to question 5 is the repository's commit rule, which its commit follows.
   - The step is done when `docs/plan.yaml` is written and its configuration check passes.
9. Fill the Build section of `CLAUDE.md` and the command block of `docs/dev/change-standard.md` from `docs/dev/building.md`.
   - The step is done when both hold the commands of `docs/dev/building.md`.
10. Run these commands:

    ```sh
    python3 <this skill's folder>/templates/sync_rules.py .
    python3 <this skill's folder>/templates/check_config.py --find .
    python3 <this skill's folder>/templates/check_config.py docs/plan.yaml
    LC_ALL=C grep -rn '[^ -~]' CLAUDE.md README.md docs/
    git check-ignore -q --no-index .agents/skills/probe && ! git check-ignore -q --no-index docs/plan.yaml
    ```

    - The setup is done when the first three exit 0, the second prints `docs/plan.yaml`, the scan prints nothing and the `git check-ignore` line exits 0.
11. Show the user each command's output.
    - The setup goes on to "Steps / A new repository" 12 without waiting.
    - The step is done when the outputs are shown.
12. Commit the setup's other files in one commit, the subject naming the repository's setup.
    - Each file is staged with `git add -- <path> ...`.
    - The commit names the same paths: `git commit -m <message> -- <path> ...`.
    - Every file written is named, except those committed at "Steps / A new repository" 8 and a file git ignores, which Rules keeps out of both commands.
    - When every file written is ignored by git, no commit is made, no stop is raised and the last message says so.
    - Otherwise, when the answer to question 5 allows it, the commit is made without the ignored paths.
    - Otherwise the skill stops ("Stops").
    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
    - When no commit is made, the list of files the stop shows names the ruling the same way.
    - `.agents/skills/` and `.claude/` are ignored and not committed.
    - `skills-lock.json` is committed.
    - The step is done when the files git does not ignore are committed, or the stop "No commit allowed" shows the files written, or every file written is ignored and the last message says that no commit was made.

### An existing repository

1. Choose the form.
   - A repository whose tools each have their own build file and their own documentation under separate directories (`tools/<name>/`, `packages/<name>/`) is drafted in the `projects:` form, one project per directory, named by the directory and with `worktree_paths` set to it.
   - Otherwise the one-project form.
   - The draft says which form and why.
   - Under a quoted ruling ("What it reads" 9), the draft takes the ruling's form, keys, `.gitignore` changes, page texts and changes to `CLAUDE.md` and the glossary.
   - "Steps / An existing repository" 2 to 11 replace a ruled part only where a rule of this skill gives another result.
   - The step is done when the draft names the form and why.
2. Draft `roadmap`: the tracked file that lists the open work, one entry per piece of it.
   - Candidates are files named `roadmap`, `ROADMAP`, `execution-order`, `TODO` or `backlog` in any documentation folder.
   - A repository can keep an ordered build plan next to a capability map (a file per feature, or an index that the ordered plan walks through): the key names the ordered file, because `/plan` matches `<entry>` against its entries.
   - The draft names the map in the key's comment.
   - Several candidates are a stop ("Stops").
     - Under a quoted ruling that states `roadmap`, the key is the ruling's.
     - The stop of several candidates is then not raised.
   - None: the skill offers to write `docs/roadmap.md` from the `roadmap` skill's `templates/roadmap.md` ("What it reads" 3), with no entries.
     - `/roadmap add` fills it.
   - The step is done when the draft names the roadmap file, offers `docs/roadmap.md`, or the stop of several candidates stands.
3. Draft `verification`: the page that defines the green check, with the commands every step runs, each written as the `plan` skill's "What it reads" 3 says.
   - An existing page qualifies only when it states commands.
   - None: the skill offers to write `docs/dev/building.md` from the commands the CI jobs and build files run (install, build, test, lint, type check).
   - Each command is run once, as it is to be written, before it is written, except when these steps run from "Steps / A new repository" 8, where no command is run and each is written as that item says.
   - The exit status of a command that was run and the last lines of its output are shown beside it.
   - A command that fails its one run is not written as a check.
     - It is a stop ("Stops").
   - The step is done when the draft names the verification page, offers `docs/dev/building.md` with each command's result or, from "Steps / A new repository" 8, with the note that the command was not run and why, or the stop of a failing command stands.
4. Draft `rules`: the page that says how a change is made (a change standard, `CONTRIBUTING.md`, or the rules section of `AGENTS.md` or `CLAUDE.md`).
   - None: the skill offers to write `docs/dev/change-standard.md` from `templates/docs/dev/change-standard.md`.
   - Its placeholders are filled from this repository: the standards pages, the folders a renamed name is grepped across, the verification commands with their filters.
   - Each rule the repository already states elsewhere is added, citing the file it came from.
   - The step is done when the draft names the rules page or offers `docs/dev/change-standard.md`.
5. Draft `ledger_root`, `archive_root` and `worktree_root`.
   - An existing folder of plans (a folder whose subfolders hold `plan.md` and `orchestrator-state.md`) or of worktrees is kept.
   - Otherwise `ledger_root` and `archive_root` take the example's values, and `worktree_root` is left out, so its default `.agents/worktrees` at the repository root applies.
   - The step is done when the draft holds the roots, or leaves `worktree_root` to its default.
6. Ask the user for the keys the repository cannot give ("Stops").
   - A key whose value a quoted ruling states is not asked.
   - Its value is the ruling's.
   - `worker` and `reviewer` are asked with the example's value as the offered answer.
   - `libraries` is asked with its two values and what each means, and with no offered answer, since the example's value is only an example.
   - `check` means `/spec` looks for a library for every capability a step builds before it writes the brief.
   - `avoid` means a step adds no new dependency.
   - In a repository with no `CLAUDE.md`, questions 1, 5 and 9 of `references/new-repository.md` are asked with the keys, each only for what the repository does not show ("Stops", "The questions").
   - The step is done when every key the repository cannot give, and every question asked with them, has its value.
7. Find the repository's glossary, the page under the file name `glossary.md`, wherever it is, and draft its plan terms when the glossary is missing or holds no single plan-terms block.
   - A glossary with no single plan-terms block gets the change "Steps / A configured repository" 10 drafts for it.
   - With no glossary, `docs/glossary.md` is offered from `templates/docs/glossary.md`, its plan-terms block filled from `templates/plan-terms.md`.
   - Nothing is drafted for a plan-terms block that is there: the sync of "Steps / An existing repository" 15 compares it in the same run.
   - The step is done when the change or the file is drafted, or the block is there.
8. Leave each optional key out, so its default applies, unless the repository gives a reason.
   - A key that is written names that reason in its comment.
   - `standards` lists every standards page the repository has, wherever it is (design principles, coding standards, a UI standard, a layout or prose standard), and the repository's glossary when it has one, wherever it is, so every brief names them.
     - The glossary is listed under the file name `glossary.md`, by which the skills find it (the `plan` skill's "What it reads" 1).
     - A glossary that "Steps / An existing repository" 7 offers is listed as the repository's glossary.
     - A page of terms under another file name, such as `docs/terms.md`, is listed as it stands and is not renamed.
     - The draft says of such a page that the skills read a glossary only under the file name `glossary.md`, so the page is a standards page and no glossary for them.
     - The paths a new repository gets by default are `docs/dev/design-principles.md`, the pages under `docs/dev/coding-standards/` and `docs/dev/ui-standard.md`.
   - `worktree_paths` is the project's directory in the `projects:` form.
   - `bench` and `look` are left out unless the user names binaries or a view.
   - `adr` is written only when the repository keeps its decision records (a folder of `NNNN-*.md` records) in a folder other than `docs/adr`, and it names that folder.
   - `design_bar`, `design_references`, `worker_effort`, `reviewer_effort`, `self_rule`, `next_entry` and `repair_reviewer` are left out unless the user gives a value.
   - The step is done when each optional key is left out or written with its reason in its comment.
9. Give every key written the example's comment for it, without the required/optional marker, in the example's order.
   - The file is drafted for `docs/plan.yaml`, and each path in it is written relative to `docs/`, the folder that holds it, as the `plan` skill's "What it reads" 1 reads it: `roadmap.md` for `docs/roadmap.md`, `../CONTRIBUTING.md` for a page at the repository root, `../.scratch` for a ledger root at the repository root.
   - Its head comment says that every path is relative to the folder that holds the file.
   - The step is done when every key written has its comment and the file has its head comment.
10. Draft the ignore rules.
    - The worktree root must be ignored: `git check-ignore -q --no-index <worktree_root>/probe` exits 0, `<worktree_root>` being the folder as it reads from the repository root, `.agents/worktrees` when the key is left out.
    - When it does not, the draft adds `/<worktree_root>/` to `.gitignore`.
    - The configuration file must not be ignored: `git check-ignore -q --no-index docs/plan.yaml` exits 1.
    - The step is done when both commands were run and the draft holds each `.gitignore` change they call for.
11. Draft the shared rules in `CLAUDE.md`, when the repository's `CLAUDE.md` is missing or holds no single shared-rules block.
    - A `CLAUDE.md` with no single shared-rules block gets the change "Steps / A configured repository" 10 drafts for it.
    - With no `CLAUDE.md`, the file is offered from `templates/CLAUDE.md`, its shared-rules block filled from `templates/shared-rules.md`.
      - Its placeholders are filled from what the repository shows: its name, what its `README.md` says it is, and for the Build section the commands of the verification page.
      - A placeholder the repository does not fill takes the answer to its question among questions 1, 5 and 9 of `references/new-repository.md`, asked at "Steps / An existing repository" 6 or at "Steps / A configured repository" 10.
      - A placeholder with no value is shown to the user and never written as `<...>`, as "Steps / A new repository" 3 says.
      - Each line of "Read before you act" names the page of that kind the plan configuration names, drafted or found, or the draft offers, at its path, and a line whose page the repository has not and the draft does not offer is left out.
      - The Skills section is kept only when the repository has a `skills-lock.json`, its list filled with each skill that file names and its description.
    - Nothing is drafted for a shared-rules block that is there: the sync of "Steps / An existing repository" 15 compares it in the same run.
    - The step is done when the change or the file is drafted, or the block is there.
12. Show, in this order:
    1. The form and why.
    2. The draft `docs/plan.yaml` in full.
    3. Each page it would create, `CLAUDE.md` and the glossary included, in full, and for a verification page each command's result or, from "Steps / A new repository" 8, the note that the command was not run and why.
    4. The `.gitignore` changes, and the changes to an existing `CLAUDE.md` and to an existing glossary with what each lists for removal, as Rules says of a change to an existing file.
    5. Where question 5 was not asked, the question whether the skill may commit.
    - The commit question is left out when a quoted ruling states whether the skill may commit.
    - A page to create or a file to change that git ignores is marked as Rules says of a file git ignores, from the check made before it was drafted.
    - The step is done when everything this item lists is shown.
13. Stop for the approval ("Stops").
    - Under a quoted ruling, compare the draft "Steps / An existing repository" 12 shows with the ruling.
    - The draft is held against the ruling in its form, in each key of the drafted `docs/plan.yaml` with its value, each change to `.gitignore`, to `CLAUDE.md` and to the glossary, and the full text of each page to create.
    - When these steps run from "Steps / A new repository" 8, a key derived from the tree written there counts as stated.
    - A draft the ruling states in each of these is written without the stop.
    - A commit question "Steps / An existing repository" 12 shows is then asked alone.
    - A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named.
    - The stop then stands with nothing written.
    - The step is done when the draft is written, or it is shown and the stop stands with nothing written.
14. Write what was approved.
    - The step is done when each approved file and change is on disk.
15. Run `python3 <this skill's folder>/templates/check_config.py --find .`, which prints the file the plan skills will read, and then `python3 <this skill's folder>/templates/check_config.py <the path it printed>`.
    - The path printed is `docs/plan.yaml`.
    - When the user declined the plan configuration at "Steps / An existing repository" 13, so that none was written, these two commands are skipped, the sync below still runs with `docs/glossary.md` as the glossary, and the last message says that the repository has no plan configuration.
    - Show its output.
    - Then run the sync, as "Steps / A configured repository" 7 to 14 say, on the blocks written and on a block that was already there.
      - A block that differs is shown per hunk, as "Steps / A configured repository" 9 says.
      - A block the user declined at "Steps / An existing repository" 13 is not drafted again: the sync's line that the file has no single block is shown, and that block is left out of the count of blocks below.
      - The sync runs at most twice in all after a block is written or rewritten, the reruns of "Steps / A configured repository" 14 counted among them, and a second run that does not print the `ok:` line of each block is the stop "The sync still fails" ("Stops").
    - The setup is done only when the configuration check exits 0 and the sync prints the `ok:` line of each block the repository holds.
16. Commit the files written, a block the sync rewrote included, in one commit whose subject names the plan configuration.
    - Each file is staged with `git add -- <path> ...`.
    - The commit names the same paths: `git commit -m <message> -- <path> ...`.
    - When every file written is ignored by git, no commit is made, no stop is raised and the last message says so.
    - Otherwise, when the repository's commit rule ("What it reads" 7) allows it, the commit is made without the ignored paths, as Rules says of a file git ignores.
    - Otherwise the skill stops ("Stops"), except when these steps run from "Steps / A new repository" 8, where the setup goes on and "Steps / A new repository" 12 raises the one stop.
    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
    - When no commit is made, the list of files written names the ruling the same way.
    - That list is the one of the stop "No commit allowed", raised here or at "Steps / A new repository" 12.
    - The step is done when the files written that git does not ignore are in one commit, or the list of files written is shown, or every file written is ignored and the last message says that no commit was made.

### A configured repository

1. Run the command of "What it reads" 4 that finds the plan configuration, and then `python3 <this skill's folder>/templates/check_config.py <the path it printed>`, so the file checked is the file the plan skills read.
   - The configuration check writes nothing by itself and drafts no plan configuration.
   - Each line the configuration check prints names the file by its path from the repository root, and a page or a folder it does not find by the path it resolves to, read from the folder that holds the file.
   - The item is done when the configuration check has run on the path printed.
2. It reports each of these.
   - A key written twice.
   - A key beside `projects:` in the `projects:` form.
   - A required key missing.
   - An unknown key.
   - A value of the wrong kind.
     - `worker` or `reviewer` not `claude:<model>` or written with no value.
     - `repair_reviewer` not `claude:<model>`.
     - `self_rule` or `next_entry` neither `on` nor `off`.
     - `review` neither `every` nor `earned`.
     - `libraries` neither `check` nor `avoid`.
     - `adr` not naming a folder under the repository root.
     - A path that resolves outside the repository.
     - A `ledger_root` or a `worktree_root` that is the repository root.
     - `design_bar` outside `industry`, `state-of-the-art` and `novel`.
     - `design_references` not a list of text.
     - `worker_effort` or `reviewer_effort` outside `low`, `medium`, `high`, `xhigh` and `max`.
     - A value whose kind differs from its default's.
   - A page named by `roadmap`, `verification`, `rules` or `standards` that does not exist.
   - A `worktree_paths` entry that does not exist.
   - A worktree root git does not ignore, `.agents/worktrees` at the repository root when the key is left out.
   - A configuration file git ignores.
   - The item is done when each of these that holds is reported.
3. Optional keys left out are listed as notes with the default that applies, which for `repair_reviewer` is the `reviewer` value.
   - The default ADR folder `docs/adr` is also listed as a note when `adr` names it and the folder does not exist yet.
   - `next_entry` on while `self_rule` is off or left out is noted as acting only under self-rule, and not noted when `self_rule` has an error.
   - The item is done when each optional key left out, and the default ADR folder where it applies, has its note.
4. For each error, propose the fix ("Stops").
   - A fix a quoted ruling states is made without the stop.
   - A fix the skill proposes that differs from the ruled fix is shown with the difference.
   - The stop then stands.
   - The item is done when each error has its fix made under a quoted ruling, or proposed at the stop.
5. Make each fix the user approved.
   - The item is done when each approved fix is in the file.
6. After the fixes, run the configuration check again.
   - A fix made under a quoted ruling is listed with the configuration check's output, with the ruling's name and its ledger file.
   - The item is done when the configuration check's output after the fixes is shown.
7. Run the sync: `python3 <this skill's folder>/templates/sync_rules.py .`, which compares the shared-rules block of `CLAUDE.md` and then the plan-terms block of the glossary.
   - When the plan configuration names a glossary ("What it reads" 8), the run adds `--glossary <the glossary's path from the repository root>`, and each later run of "Steps / A configured repository" adds it too.
   - Otherwise the script runs without the option, on the glossary "What it reads" 8 gives.
   - "Steps / A configured repository" 8 to 15 follow its exit status and, on exit 2, its `error:` lines.
   - The item is done when the sync has run and its exit status is known.
8. Exit 0: both blocks equal their templates, so nothing is written, and the two `ok:` lines are shown with the configuration check's output.
   - The item is done when the two lines are shown.
9. Exit 1, when a block differs: show the diff of each block that differs, for the user's ruling per hunk ("Stops").
   - The template's text goes into the repository: `--write`, after the approval.
   - Or the repository's text is the wording wanted everywhere: the change goes into `templates/shared-rules.md` or `templates/plan-terms.md` in this skill's folder, after which every repository set up from it differs until it is synced.
   - Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.
   - A diff whose hunks are not the ruling's is shown whole, and the stop stands.
   - Before the diff is shown, the file of each block that differs is checked as Rules says of a file git ignores, and the diff of an ignored file is marked as that rule says.
   - The item is done when each hunk has the user's ruling or the quoted ruling's choice.
10. Exit 2 with `error: CLAUDE.md has no single shared-rules block`, `error: <glossary> has no single plan-terms block` or `error: no CLAUDE.md in`, `<glossary>` being the path passed with `--glossary` or else `docs/glossary.md`: draft the change for each block or file the lines name.
    - Before a file or a change is drafted, its path is checked as Rules says of a file git ignores, and the draft marks an ignored file as that rule says.
    - The shared-rules block inserted after the opening paragraph of `CLAUDE.md`.
    - Each rule of the existing `CLAUDE.md` that the block now states, listed for removal with the block rule that replaces it.
    - A rule that differs in substance, kept in Project rules and named.
    - With no file at the glossary's path, the file written there from `templates/docs/glossary.md`, its plan-terms block filled from `templates/plan-terms.md`.
      - When the plan configuration found lists no glossary in `standards`, the drafted change adds the new glossary's path to that list, written relative to the folder that holds the `plan.yaml`, as the `plan` skill's "What it reads" 1 reads a path: `../docs/glossary.md` in `.agents/plan.yaml`.
      - A configuration with no `standards` key gets the key with that one path and the comment "Steps / An existing repository" 9 gives a written key.
      - In the `projects:` form the list is that of the project the call names, and with none named, of the first project.
      - The glossary's path, written relative to the repository root, is also added to the `standards` line of the configuration block of each open plan of that `plan.yaml`, the open plans found as `plan-orchestration`'s "What it reads" 1 says, as the `grill` skill's "Steps / Writing what settled" 2 adds the path of a glossary it creates, so the next `/spec` of an open plan reads the glossary.
      - These additions are shown as a diff with the rest of the change, and written with it.
    - With a glossary that has no single block, the plan-terms block inserted after its opening paragraph, and each existing entry that the block now defines listed for removal.
    - With no `CLAUDE.md`, the file drafted from `templates/CLAUDE.md`, as "Steps / An existing repository" 11 says of a repository with no `CLAUDE.md`.
      - Before that draft, questions 1, 5 and 9 of `references/new-repository.md` are asked, together, each only for what the repository does not show ("Stops", "The questions").
      - A question a quoted ruling answers is not asked.
    - The item is done when a change is drafted for each block or file the lines name.
11. Show the drafted change ("Stops").
    - Under a quoted ruling that states the drafted change, the draft of "Steps / A configured repository" 10 takes the ruling's text.
    - The rules of "Steps / A configured repository" 10 are worked on it.
    - A draft that is still the ruled change is written without the stop.
    - A draft that differs from it is shown whole with each difference named.
    - The stop then stands.
    - The item is done when the drafted change is shown, or written under a quoted ruling.
12. Write it once the user approves.
    - After a glossary's path is written into `standards`, the `plan.yaml` is read back and holds the path relative to the folder that holds it, and each open plan's configuration block is read back and holds the path relative to the repository root.
    - The configuration check is then run again on the changed `plan.yaml`, before the sync of "Steps / A configured repository" 14, and an error it reports is handled as "Steps / A configured repository" 4 says.
    - The item is done when the approved change is on disk and, where a path was written into `standards`, the read-back holds it in both places and the configuration check has run again.
13. Exit 2 with any other `error:` line (`is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names.
    - A no-single-block line of the same run is still drafted, as "Steps / A configured repository" 10 says.
    - Show the line with the file it names ("Stops").
    - The file named in the line is fixed first, by the user or with the user's approval.
    - The item is done when the line is shown with the file it names.
14. After a written draft or a fixed file: run the sync again, at most twice, following "Steps / A configured repository" 8 to 13 on its exit status each time.
    - A sync that does not exit 0 on the second of those runs is a stop ("Stops").
    - When "Steps / A configured repository" 10 wrote a new glossary's path into `standards`, the first of these runs follows the read-back and the configuration check of "Steps / A configured repository" 12, and each run adds `--glossary <the glossary's path, relative to the repository root>`, as "Steps / A configured repository" 7 says of a glossary the plan configuration names.
    - The item is done when a run exits 0, or the stop stands.
15. After exit 1 or exit 2: end by the first of these three that holds.
    - When every file changed is ignored by git, no commit is made, no stop is raised and the last message says so.
    - Otherwise, when the repository's commit rule allows it, the change is committed in the form "Steps / A new repository" 12 states, without the ignored paths.
    - Otherwise the skill stops ("Stops").
    - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
    - When no commit is made, the list of files the stop shows names the ruling the same way.
    - The item is done when the change to the files git does not ignore is committed, or the stop shows the files changed, or every file changed is ignored and the last message says that no commit was made.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A skill's folder not found | Steps 1, in each of the three cases, when the `plan` or the `roadmap` skill's folder is in neither of the two folders "What it reads" 2 gives | A refusal that names the folder and the two folder paths, with nothing drafted or written | The skill installed, then `/ordo-init` again |
| The questions | A new repository, at "Steps / A new repository" 2, and a `CLAUDE.md` written from the template, at "Steps / An existing repository" 6 or "Steps / A configured repository" 10, for each question asked there that a quoted ruling does not answer | The questions asked, each with its default | The user's answers |
| The draft of the tree | A new repository, at "Steps / A new repository" 4, except a draft a quoted ruling covers as that item says | The tree of `references/new-repository.md`, every file's text, the placeholders that "Steps / A new repository" 3 lists for the user's value and the tools that item leaves out of each coding-standards page | The user's approval or correction |
| Several roadmaps | More than one roadmap candidate, and no quoted ruling states `roadmap` | The candidates | The user's pick |
| Worker, reviewer and libraries | At "Steps / An existing repository" 6, for each key a quoted ruling does not state | The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as that item names them | The user's answers |
| A failing command | In an existing repository, a command meant for the verification page fails its one run; never from "Steps / A new repository" 8, where no command is run | What "Steps / An existing repository" 3 shows beside it | The user's decision |
| The draft of the configuration | At "Steps / An existing repository" 13, except a draft a quoted ruling states as that item says, where only a commit question the ruling leaves open is asked | What "Steps / An existing repository" 12 lists | The user's approval or correction, and the answer to the commit question when it is shown |
| A fix in the configuration check | The configuration check reports an error in a plan configuration, and no quoted ruling states its fix | The error and the proposed fix | The user's approval |
| A hunk to rule on | The sync exits 1, except a diff whose hunks are a quoted ruling's ("Steps / A configured repository" 9) | The diff, and the commit question where "What it reads" 7 says to ask it | The user's ruling per hunk, and the answer to the commit question when it is asked |
| The drafted sync change | The sync exits 2 with an `error:` line of "Steps / A configured repository" 10, for the shared-rules block, the plan-terms block or a missing `CLAUDE.md`, except a change a quoted ruling states ("Steps / A configured repository" 11) | The change "Steps / A configured repository" 10 drafts, and the commit question where "What it reads" 7 says to ask it | The user's approval, and the answer to the commit question when it is asked |
| A file sync cannot use | The sync exits 2 with one of the `error:` lines of "Steps / A configured repository" 13 | The `error:` line and the file it names | The file fixed, then the sync again ("Steps / A configured repository" 14) |
| The sync still fails | The sync run again after the change does not exit 0 on its second run ("Steps / A configured repository" 14, "Steps / An existing repository" 15) | The sync's output | The user's decision, then `/ordo-init` again |
| No commit allowed | The repository's commit rule ("What it reads" 7) does not allow the commit, at "Steps / A new repository" 12, "Steps / An existing repository" 16 or "Steps / A configured repository" 15, and a file written or changed is not ignored by git | The files written or changed, the quoted ruling named when they were written under one, the command that shows them (`git status --short`), and apart from them each file written and ignored by git, as Rules says | The user's commit |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A build file for something the user did not name | It fixes a choice nobody made | See Rules: build files only for what the user names |
| A rule that is neither in Ordo's shipped pages, nor stated by the user, nor stated by the repository, written into a page | The page then binds the builders to something nobody decided | See Rules: the skill adds no other rule, and a page states what the repository already does or says |
| The plan skills installed per project | Two copies load, and the project's copy drifts from the user's | See Rules: the plan skills are installed per user |
| A `<...>` placeholder written into a file, other than one inside an HTML comment that shows an entry's form | The file then states something nobody filled in | See "Steps / A new repository" 3 |
| Overwriting an existing page or plan configuration | The user's text is lost without a decision | See Rules: no existing page is overwritten, and a change to an existing file is shown as a diff |
| A test or a source file written so that a verification command passes | The verification page then shows green for a check that proves nothing about the repository | See Rules: a command that fails is shown as failing and left as it is |
| An ignored file staged with `git add -f`, or its ignore rule changed | The file is ignored by the user's choice, and the commit publishes it | See Rules: a file git ignores is written, left ignored and kept out of the commit |
| A tool of a default coding-standards page written into a repository that does not configure it | The page binds the builders to a tool nobody chose | See "Steps / A new repository" 3: the requirement in plain words, the tool left out and listed in the draft |

## Rules

- Everything the skill writes comes from `templates/` in this skill's folder, from the templates of the `plan` and `roadmap` skills, found as "What it reads" 2 and 3 say, from the repository and from the user's answers.
- The skill writes nothing until the user approves or corrects the draft it shows, with two exceptions: `git init` at "Steps / A new repository" 1, and the one run of each verification command at "Steps / An existing repository" 3 before the draft is shown, which is not made when those steps run from "Steps / A new repository" 8.
  - A quoted ruling that covers or states the draft, as the item of its stop says, is that approval.
- A command that fails is shown as failing and left as it is, and no step writes a test, a source file or any other file so that a command passes.
- Before the skill drafts a file to create or a change to a file that exists, such as `CLAUDE.md`, the glossary or a page, in each of the three cases, it runs `git check-ignore -q -- <path>` for that file on the folder as it stands, and an exit status of 0 says that git ignores the path.
  - A path git ignores is still offered, and written or changed on approval.
  - The draft says, beside that file, that git ignores it, and names the line and the ignore file that `git check-ignore -v -- <path>` prints, which may be a file outside the repository.
  - The skill leaves that ignore rule as it is and never offers to change it.
  - The path is left out of every `git add` and `git commit` command the skill writes, and is never forced into a commit, since `git add` exits 1 on an ignored path even when it stages the others.
  - When every file written is ignored, no commit is made and the last message says so.
  - The last message, and each stop that lists the files written, names such a file apart, as written and ignored by git, since `git status --short` does not list it.
  - The checks of the worktree root and of the configuration file ("Steps / An existing repository" 10, "Steps / A new repository" 10 and "Steps / A configured repository" 2) are apart from this check and keep their own results.
- The skill writes nothing outside the repository's folder, except a change to `templates/shared-rules.md` or `templates/plan-terms.md` the user rules on at "Steps / A configured repository" 9.
- The skill adds no rule other than Ordo's shipped defaults, the user's, and the rules an existing repository already states.
- A page the skill writes in an existing or a configured repository states, beside its template's text, what the repository already does or says.
  - It cites where.
- The skill never overwrites an existing page or plan configuration.
- A change to an existing file, `.gitignore`, `CLAUDE.md` and the glossary included, is shown as a diff and made after approval.
  - Under a quoted ruling that states the change, it is made without being shown for approval, as "Steps / An existing repository" 13 and "Steps / A configured repository" 4, 9 and 11 say.
- Build files are written only for what the user names.
- The plan skills are never installed per project: they are installed per user, and one copy is loaded.
- The skill never writes a Claude Code settings file; a setting the user asks for is written out in the reply, for the user to add.
- Every file it drafts is ASCII with one paragraph per source line, as the prose standard says.
- Every file it drafts carries no history, as the shared rules say.
- Every path in this skill's text is relative to the repository root, except `templates/` and `references/`, which stand in this skill's folder, and a path in the drafted `plan.yaml` is written relative to `docs/`, as "Steps / An existing repository" 9 says.
