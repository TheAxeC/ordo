---
name: handbook
description: "Write a software repository's README and its documentation from the code and the existing documents, from a fixed set of kinds: the README, a getting-started guide, manual pages, reference pages, a feature map, diagrams, a one-page manual.html, API pages and a documentation index. It shows the kinds chosen and why others are left out, drafts each page with each claim's source file and every fact of a page that exists, checks the drafts with the repository's format and lint commands on a copy, and writes only the drafts the user approves. It commits the approved pages, the diagrams with their graph file, utils/figures.py, utils/manual.py and an approved exclusion line for a generated file. Triggers on: /handbook, write the README of my repository, document this repository, write the documentation of a repository, write a getting-started guide, write a manual for my project, write reference pages, write a feature map, draw diagrams of the repository, build a one-page manual, update the docs of my repository."
metadata:
  version: "1.0.0"
---

# Handbook

`/handbook` writes a software repository's README and its documentation from the code and the existing documents, from the fixed set of kinds of `references/kinds.md`. It shows which kinds the repository gets before it drafts anything, shows every page as a draft with each claim's source file, checks the drafts with the repository's own format and lint commands on a copy of its working tree, and writes and commits only the drafts the user approves, leaving the pages, the diagrams with `utils/diagrams.py`, `utils/figures.py`, `utils/manual.py` and an approved exclusion line for a generated file those commands reject in one commit in the repository.

## Quick start

```
/handbook [<repository folder>]    the whole run on the repository, the current folder when none is named: the kinds, the drafts, then the approved pages written and committed
```

## Use instead

| When | Use |
|---|---|
| A research project's README, with its questions, results and working state | `/researcher readme` |
| A repository to set up for the plan skills, which writes a short README of its own in a new repository | `/ordo-init` |
| The standards pages a repository's code is held to | `/codebase-design standards` |
| The comments in the code | `/code-comments` |

## What it reads

1. The call: the `<repository folder>`, or the current folder when none is named.
   - A folder that is not inside a git repository is the refusal "Not a repository".
   - A repository whose tracked files hold no source file of a programming language, such as one of Markdown pages alone, is the refusal "No code".
2. The repository's code: the source files, the build files, the manifest of its package manager, its CI configuration, its tests, its examples and its scripts.
3. The repository's existing documentation: `README.md`, each Markdown page under `docs/` and elsewhere, the license file, the changelog, and a roadmap or issue file when the repository holds one.
4. `references/kinds.md`, the kinds with what each holds, when a repository has a use for it and its path, read before the first stop.
5. `references/diagrams.md`, the form of the diagram file, read when the run draws diagrams.
6. `templates/figures.py`, the drawing engine, and `templates/manual.py`, the script that builds `manual.html`, each compared with the repository's copy.
7. The repository's `utils/figures.py`, `utils/manual.py` and `utils/diagrams.py`, when they exist.
8. The output of `python3 --version`, read when the run would copy the engine or `templates/manual.py`.
9. Whether the API tool of the repository's language is installed, read with `command -v <tool>` when the run would build the API pages.
10. The output of each of the repository's format and lint commands, run on the copy of its working tree at Steps 8.

## Steps

1. Find the repository.
   - Run `git -C <folder> rev-parse --show-toplevel`: the folder it prints is the repository root.
   - Write every path of the run relative to the repository root.
   - A non-zero exit is the refusal "Not a repository", before any other file is read.
   - List the tracked files with `git -C <root> ls-files`.
   - A list that holds no source file is the refusal "No code".
   - Done when the root is known and holds code, or the refusal is raised with nothing read for drafting.
2. Read the repository, as "What it reads" 2 and 3 give it.
   - Name the parts of the product a user works with, from the commands of its entry point, the modules a user imports and the subsystems its build files list.
   - Name its public surfaces: the command-line options, the configuration keys, the file formats, the environment variables, the endpoints and the public API.
   - Name its capabilities, each with the files that hold it and the test that covers it, or that no test covers it.
   - Name its language, its build and install commands, its license, and each page of its existing documentation with the kind of `references/kinds.md` that page belongs to.
   - Name each page of the existing documentation that belongs to no kind.
   - Put each fact of such a page into the page of the kind that holds it.
   - Name the repository's format and lint commands, from its manifest, its build files, its CI configuration and its documentation, such as the `format:check` and `lint` scripts of `package.json`, `ruff check` and `ruff format --check`, or `cargo fmt --check`.
   - Leave out a type check, a test run and a build, each with its reason.
   - Leave out a command that needs a build, an install or the network first, such as `cargo clippy`, `uv run`, `pre-commit run` or a script that runs `svelte-kit sync`, with its reason.
   - Leave out a command that writes into the repository, such as `prettier --write .` or one with `--cache`, with its reason.
   - Leave out a command whose tool writes a cache by default into a folder Steps 8 links from the repository, such as `next lint` into a linked `.next`, with its reason.
   - Keep a command whose tool writes its cache inside the copy only, such as `ruff check` into `.ruff_cache`.
   - Note the files searched for the commands.
   - Done when each kind's pages can be named, which parts, which surfaces and which capabilities, and each format or lint command found is kept or left out with its reason.
3. Check the tools and the copies the run would use.
   - When the run would draw diagrams or build `manual.html`, read `python3 --version`.
   - A version below 3.10 is a question for the first stop, since the engine needs Python 3.10 or later.
   - The diagrams kind is then left out until the user answers that `python3` now is 3.10 or later, which this step reads again.
   - A version below 3.9 also leaves `manual.html` out, as the same question, since `templates/manual.py` needs Python 3.9 or later.
   - Compare each of `utils/figures.py` and `utils/manual.py` that exists with its template by `cmp -s <template> <copy>`.
   - A copy that equals its template is kept as it stands.
   - A copy that differs is a question for the first stop: keep it, or replace it with the template.
   - When the run would build the API pages, check with `command -v <tool>` that the tool is installed.
   - A tool that is not installed is named at the first stop with its install command.
   - The API pages kind is then left out of the run with that reason.
   - Check that the tool of each format or lint command kept is installed: with `command -v <tool>`, or with `test -x <path>` for a tool the package manager installs inside the repository, such as `node_modules/.bin/prettier`.
   - A command whose tool is not installed is named at the first stop with that reason, and Steps 8 does not run it.
   - Done when the version, each copy, the API tool and the tool of each format or lint command are known, or known not to be needed.
4. Choose the kinds, as `references/kinds.md` gives each kind's use.
   - Give each kind the repository gets its pages.
   - Give each page its path: the path of the page that exists, or the kind's new path.
   - Give each kind left out its reason, such as "a small library: no feature map".
   - Done when every kind of `references/kinds.md` is either chosen with its paths or left out with its reason.
5. Show the kinds, the stop "The kinds".
   - Show each kind the repository gets with each page's path, marked as a page that exists or a new page.
   - Show each kind left out with its reason.
   - Show each question of Steps 3.
   - Show each format or lint command found, and each command left out with its reason.
   - Show, for a repository that names no format or lint command, that it names none, with the files searched.
   - Nothing is drafted or written, and no command read from the repository's files runs, before the user confirms the kinds.
   - Kinds the user changes are shown again as changed.
   - Done when the user has confirmed the kinds and answered each question.
6. Draft each page of the confirmed kinds, except the diagrams, from the code and the existing documentation.
   - Name each claim's source file in the draft, beside the claim.
   - Write what no file holds as a question in the draft, under its section, for the user to answer at Steps 9.
   - Bring a page that exists up to date with every fact of it kept.
   - Show in the draft of a page that exists where each fact of the old page went.
   - Draft the README with its core in the order of `references/kinds.md`, "The README".
   - Keep each section of the README's own, brought up to date, placed where it reads best around the core.
   - Draft the API tool's configuration, with its output folder `docs/user/reference/api/`.
   - Leave the pages the API tool builds out of the drafts, since they are build output.
   - Draft the documentation index with the command that rebuilds `manual.html`, `python3 utils/manual.py . <document> ...`, naming the run's Markdown pages in the order of the tabs.
   - A made-up example: a C++ library whose README holds "Building" and "Contributing" sections and whose repository has no `docs/` folder gets a README draft with `# <name>` and its opening paragraph, "What it looks like", "Building" as its build and run, "Where to look", "Contributing" and "License", each claim with its source file, such as `CMakeLists.txt` for the build commands and `LICENSE` for the license.
   - A made-up example: a repository whose `docs/manual/install.md` exists gets its manual page on installing drafted at `docs/manual/install.md`, every fact of the old page kept and its place in the draft shown.
   - Done when each page of the confirmed kinds but the diagrams has its draft, and each fact of each page that exists stands in a draft.
7. Draft the diagrams, when the kind is confirmed, in the form of `references/diagrams.md`.
   - Write each diagram of the run as a function of the diagram file's draft, each label written by `repr`.
   - A `utils/diagrams.py` that exists is a page that exists: its draft keeps every graph of it, each change marked.
   - Write over a `utils/diagrams.py` that exists only with the draft the user approved at Steps 9.
   - Make a scratch folder outside the repository with `mktemp -d`.
   - Copy into it, as `<scratch>/utils/figures.py`, the engine the run will use: the repository's own `utils/figures.py` when the user kept it at the first stop, and `templates/figures.py` otherwise, so the `.svg` the drafts stop shows is drawn by the engine that draws the committed one.
   - Write the draft into it as `<scratch>/utils/diagrams.py`, and run `python3 <scratch>/utils/diagrams.py`, which writes each `.svg` under `<scratch>/docs/user/diagrams/`.
   - Show the error of a diagram the engine refuses with a `FigureError`, such as a label that does not fit its box, a non-ASCII label or a cycle not marked as a return.
   - Correct the refused diagram's graph in the draft, and run the draft again.
   - Each diagram gets at most three corrections.
   - A diagram still refused after the third is left out of the draft.
   - The drafts stop shows a diagram left out with the engine's error.
   - Done when each diagram of the run is drawn in the scratch folder or left out with its error.
8. Run the repository's format and lint commands on a copy of its working tree that holds the drafts, when Steps 2 kept one and Steps 3 found its tool installed.
   - A run with no such command goes on to Steps 9 with no command run.
   - Make the scratch folder with `mktemp -d` when Steps 7 did not make one.
   - List the files to copy with `git -C <root> ls-files -z --cached --others --exclude-standard`: the tracked files and the untracked files git does not ignore.
   - Copy each listed file that stands on disk, as it stands there, to its path under `<scratch>/check`.
   - Run `git init -q` in `<scratch>/check`, so that a tool that reads the ignore files only inside a git repository finds them.
   - Link each folder a command reads that git ignores, such as `node_modules` or `.venv`, from the repository with `ln -s <root>/<folder> <scratch>/check/<folder>`.
   - Run the commands with what the repository has installed: install nothing and fetch nothing.
   - Run each command with `PYTHONDONTWRITEBYTECODE=1` set, so that a Python tool writes no bytecode into a linked `.venv`.
   - Run `touch <scratch>/marker` before each run of a command.
   - After each run, run `find -L <scratch>/check/<folder> -type f -newer <scratch>/marker -print` for each linked folder.
   - Each file it prints was written into the repository by that run's command, and the drafts stop names it with that command.
   - Run each command once in `<scratch>/check` before any draft is put there: its failures are the repository's own, named at the drafts stop and not acted on.
   - Put each draft and each file the run generates at its path in the copy: the pages, the copies of `utils/`, `utils/diagrams.py` with each `.svg` Steps 7 drew, `docs/user/manual.html` built there with `python3 utils/manual.py . <document> ...`, and the API pages built there with the tool's build command when that kind is confirmed.
   - Run each command again in `<scratch>/check`.
   - Act only on a failure in a file the run writes.
   - Correct a failure in a drafted file, a page or `utils/diagrams.py`, in its draft.
   - Answer a failure in a file the run generates and does not draft, `manual.html`, an `.svg`, the API pages, `utils/figures.py` or `utils/manual.py`, with a drafted exclusion: a line that names the file in the file the command reads its exclusions from.
   - A made-up example: a TypeScript repository whose `prettier --check .` rejects `docs/user/manual.html` gets the line `docs/user/manual.html` drafted in its `.prettierignore`, or in a new `.prettierignore` when it has none.
   - A made-up example: a Python repository whose `ruff check` rejects `utils/figures.py` gets that path drafted under `extend-exclude`, which adds to ruff's default exclusions where `exclude` replaces them.
   - Ruff reads the first of `.ruff.toml`, `ruff.toml` and `pyproject.toml` that it finds, so the path goes in that file.
   - A drafted exclusion keeps every line of the file it changes.
   - Put each correction and each exclusion in the copy, and run the commands again.
   - The failures of the run's files get at most three rounds of corrections.
   - A failure still there after the third is named at the drafts stop.
   - Done when each command has run on the copy before and after the run's files, and each failure in a file of the run is corrected, excluded or named after the third round, and each linked folder has been searched after each run.
9. Show the drafts, the stop "The drafts".
   - Show each draft whole, with every change from the file it replaces.
   - Show, for each fact of a page that exists, the place in the draft it went to.
   - Show each claim's source file and each question of the drafts.
   - Show the diagram file's draft and each `.svg` it drew in the scratch folder, by its path, and each diagram left out with the engine's error.
   - Show the files the run copies, `utils/figures.py` and `utils/manual.py`, each as new, kept or replaced as the first stop's answer says.
   - Show each command of Steps 8 with its output before and after the run's files were put in the copy, each draft it corrected, each drafted exclusion, each failure still there after the third round, and each file the `find` of Steps 8 printed, with the command that wrote it.
   - Show the commit of Steps 11: its message and each path it names.
   - A draft the user corrects is put in the copy, and the commands of Steps 8 run again on it, before it is shown again with the corrections.
   - Each answer to a question goes into the section that holds the question.
   - Done when the user has approved each draft, or has left a draft out of the run.
10. Write what the user approved.
    - Copy `templates/figures.py` to `utils/figures.py` and `templates/manual.py` to `utils/manual.py` where the run uses them, except a copy the user kept at the first stop.
    - Write each approved draft at its path, the drafted exclusion of Steps 8 among them.
    - Write no file the approved drafts do not hold, beside the copies and the outputs of the commands of this step.
    - Run `python3 utils/diagrams.py` from the root when the diagrams kind is confirmed, which writes each `.svg` under `docs/user/diagrams/`.
    - Run `python3 utils/manual.py . <document> ...` from the root with the documents the index names when the `manual.html` kind is confirmed, which writes `docs/user/manual.html`.
    - The page loads nothing from the network: an image at an `http` or `https` address, or at one that starts with `//`, is written as a link to that address, as `templates/manual.py`'s head comment says.
    - Run the API tool's build command when the tool is installed.
    - A command of this step that exits non-zero is the stop "A command that fails".
    - Done when each file, read back, is the draft the user approved, and each command has exited 0.
11. Commit every file Steps 10 wrote, in one commit.
    - Run `git -C <root> check-ignore -q -- <path>` for each file written.
    - Leave a path git ignores out of the commit.
    - Name such a path in the last message, as written and ignored by git.
    - Run `git -C <root> add -- <path> ...` and `git -C <root> commit -m "<message>" -- <path> ...`, each path named, the message the one the drafts stop showed.
    - Leave the API pages out of the commit, since they are build output.
    - A commit that exits non-zero is the stop "A command that fails".
    - Done when `git -C <root> show --stat HEAD` lists each path of the commit.
12. End the run.
    - Name each file written by its path, the commit by its hash, and the commands that rebuild the diagrams, `manual.html` and the API pages.
    - Remove the scratch folder of Steps 7 or 8, with the copy of Steps 8 in it.
    - Done when the message is sent.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| Not a repository | Steps 1, when `git rev-parse --show-toplevel` exits non-zero | A refusal that names the folder, with nothing read for drafting and nothing written | `/handbook` again on a git repository |
| No code | Steps 1, when the tracked files hold no source file | A refusal that names the repository root, with nothing read for drafting and nothing written | `/handbook` again on a repository that holds code |
| The kinds | Steps 5, before any page is drafted | Each kind the repository gets with each page's path, each kind left out with its reason, the `python3` version below 3.10, or below 3.9, as a question, each `utils/figures.py` or `utils/manual.py` that differs from its template as a question, each API tool not installed with its install command, and each format or lint command found or left out with its reason, or none with the files searched | The user's confirmation of the kinds or their change, shown again as changed, and the answer to each question |
| The drafts | Steps 9, before any file of the repository is written | Each draft whole with every change from the file it replaces, where each fact of a page that exists went, each claim's source file, each question, the diagram file's draft with each `.svg` drawn in the scratch folder, each diagram left out with the engine's error, the copies of `utils/`, each format or lint command's output before and after the run's files, each draft it corrected, each drafted exclusion and each file written through a linked folder, and the commit's message and paths | The user's approval of each draft, a corrected draft checked again and shown again, and each answer written into its section (Steps 10) |
| A command that fails | Steps 10 or 11, when `utils/diagrams.py`, `utils/manual.py`, the API tool's build command or the commit exits non-zero | The command and its output, and each file written so far | The user's decision, then the run goes on from that command |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Every kind drafted for every repository | A small library gets a feature map and manual pages it has no use for | Choose the kinds by `references/kinds.md` and show them at the first stop, as Steps 4 and 5 say |
| A claim written from what such a repository usually holds | The page then states what this repository does not do | Write each claim from a file and name it; what no file holds is a question, as Steps 6 says |
| A page that exists rewritten from the code alone | Facts only the old page held are lost | Keep every fact and show where it went, as Steps 6 says |
| A diagram drawn in the repository before the approval | A file of the repository is written before the user has seen it | Draw it in the scratch folder, as Steps 7 says |
| A differing `utils/figures.py` or `utils/manual.py` written over | The repository's own changes to it are lost | Ask at the first stop, as Steps 3 says |
| `git add -A` or `git commit -a` for the commit | Files the run did not write go into the commit | Name each path, as Steps 11 says |

## Rules

- The skill writes no file of the repository before the user approves the drafts at Steps 9; the scratch folder of Steps 7 and 8, with the copy of Steps 8 in it, stands outside the repository.
- Steps 2 and 8 keep the commands of Steps 8 from writing into the repository where they can; a file a command writes through a linked folder all the same is found after its run and named at the drafts stop with that command.
- The skill runs in the user's session and starts no agent: the session drafts each page from the files it reads.
- The skill commits only the files Steps 10 wrote.
- The skill leaves the push to the user.
