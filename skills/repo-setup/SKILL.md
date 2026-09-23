---
name: repo-setup
description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules and AGENTS.md as a symlink to it, docs/ with the change standard, the prose standard, the building page, a roadmap and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and .agents/plan.yaml through /ordo-init. Shows the whole tree and every file before writing. With sync, compares an existing repository's shared-rules block with the template and rewrites it after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules."
metadata:
  version: "1.1.0"
---

# Set up a repository

`/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block equal to the template. It leaves behind the approved tree in one commit, or the synced block.

## Quick start

```
/repo-setup [<path>]          a new repository at <path> (default: the current folder, which must hold no tracked file)
/repo-setup sync [<path>]     an existing repository: its shared-rules block against the template
```

## Use instead

| When | Use |
|---|---|
| An existing repository needs only its plan configuration | `/ordo-init` |
| The repository is set up and its roadmap needs an entry | `/roadmap add <goal>` |

## What it reads

1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.
2. The user's answers to "The questions".
3. The `ordo-init` and `roadmap` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`.
4. For `sync`, the repository's `CLAUDE.md` and `AGENTS.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` for the exit-2 draft.

## Steps

1. Run `git init` when the folder is not a repository.
   - A folder with tracked files is a refusal ("Stops").
2. Ask "The questions", together, in plain prose, each with its default in brackets ("Stops").
3. Draft "The tree", every file with its full text.
   - A placeholder in a template (`<...>`) is filled from the answers or from the files written before.
   - A placeholder with no answer is shown to the user, and never written as `<...>`.
4. Show the draft, the tree and every file's text together ("Stops").
5. Write the files the user approved.
6. Create `AGENTS.md` with `ln -s CLAUDE.md AGENTS.md`.
7. Install the project skills from the repository root, per source: `npx skills add <source> --skill <name> [--skill <name>...] -a claude-code -a codex -y`.
   - The CLI copies them into `.agents/skills/`, links them under `.claude/skills/`, and writes `skills-lock.json`.
8. List each installed skill with its description in the Skills section of `CLAUDE.md`.
9. Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`, and its check passes.
10. Fill the Build section of `CLAUDE.md` and the command block of `docs/dev/change-standard.md` from `docs/dev/building.md`.
11. Run the checks:

    ```sh
    python3 <this skill's folder>/templates/sync_rules.py .
    python3 <ordo-init's folder>/templates/check_config.py .
    LC_ALL=C grep -rn '[^ -~]' CLAUDE.md README.md docs/
    git check-ignore -q --no-index .agents/skills/probe && ! git check-ignore -q --no-index .agents/plan.yaml
    ```

    - The setup is done when the first two exit 0, the scan prints nothing, and the last line exits 0.
12. Show each check's output.
13. Commit the setup in one commit, by explicit path list, every file written named, the subject naming the repository's setup.
    - `.agents/skills/` and `.claude/` are ignored and not committed; `skills-lock.json` is.

### sync

1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`; steps 2 to 8 follow its exit status.
2. Exit 0: the block equals the template; nothing to do.
3. Exit 1: the block differs; show the diff, for the user's ruling per hunk ("Stops").
   - The template's text goes into the repository: `--write`, after the approval.
   - Or the repository's text is the wording wanted everywhere: the change goes into `templates/shared-rules.md` in this skill's folder, after which every repository set up from it differs until it is synced.
4. Exit 2 (no block, or `AGENTS.md` not a symlink to `CLAUDE.md`): draft the change.
   - The block inserted after the opening paragraph.
   - Each rule of the existing `CLAUDE.md` that the block now states, listed for removal with the block rule that replaces it.
   - A rule that differs in substance, kept in Project rules and named.
   - `AGENTS.md` replaced by the symlink, after its text is compared with `CLAUDE.md`; a difference is shown and ruled on first ("Stops").
5. Exit 2: show the drafted change ("Stops").
6. Exit 2: write it once the user approves.
7. Exit 2: run the check again, until it exits 0.
8. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it; otherwise stop ("Stops").

## The questions

1. The repository's name and one paragraph on what it is.
2. The kind, for the `.gitignore` and the build files: `cpp`, `python`, `typescript`, or another the user names (then the user gives the build system and the patterns to ignore).
3. The build system, language standard and test harness, as far as the user fixes them now.
4. The license [MIT] and its holder. MIT is written from `templates/LICENSE-MIT`; another license is written from the text the user gives or from its SPDX name's official text, fetched and shown.
5. The commit rule for this repository [commit only when told].
6. The coding standard: copied from a sibling repository the user names (its page read whole and adapted to this repository's names), written from rules the user states, or none yet.
7. The project skills: the set in a sibling repository's `skills-lock.json` the user names, a list the user gives, or none.
8. Rules that belong to this repository only, for the Project rules section.

## The tree

```
CLAUDE.md                        templates/CLAUDE.md, the shared-rules block filled from templates/shared-rules.md
AGENTS.md -> CLAUDE.md           a symlink, so Claude Code and Codex read one text
README.md                        the name, the paragraph, how to build (a pointer to docs/dev/building.md), the license line
LICENSE
.gitignore                       templates/gitignore/common.gitignore, then the kind's file
skills-lock.json                 written by the skills CLI when the project skills are installed
docs/dev/change-standard.md      templates/docs/dev/change-standard.md, its placeholders filled
docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md
docs/dev/coding-standards.md     only when question 6 gave one
docs/dev/building.md             written by /ordo-init from the build files
docs/roadmap.md                  the roadmap skill's templates/roadmap.md
docs/adr/README.md               templates/docs/adr/README.md
docs/adr/template.md             templates/docs/adr/template.md
src/                             the source tree, with the build files for the kind as far as question 3 fixed them
utils/                           scripts the build and the checks run
.agents/plan.yaml                written by /ordo-init
```

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The questions | Every setup, at Steps 2 | The eight questions, each with its default | The user's answers |
| The draft | Every setup, at Steps 4 | The tree and every file's text | The user's approval or correction |
| A hunk to rule on | `sync` exits 1 | The diff | The user's ruling per hunk |
| The drafted sync change | `sync` exits 2 | The change Steps / sync 4 drafts | The user's approval |
| An `AGENTS.md` difference | `AGENTS.md` is a file whose text differs from `CLAUDE.md` | The difference | The user's ruling |
| No commit allowed | The repository's commit rule does not allow the commit | The files changed, and the command that shows them (`git status --short`) | The user's commit |
| Tracked files | The folder for a new repository holds tracked files | A refusal that names `/repo-setup sync` and `/ordo-init` | One of those, or a folder with no tracked file |

- The first six rows are stops: each waits on the user.
- The last row is a refusal: it names its cause and changes nothing.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A build file for something the user did not name | It fixes a choice nobody made | See Rules: build files only for what the user names |
| A coding rule the user did not state | The repository then binds builders to something nobody decided | See Rules: the skill never invents a coding rule |
| The plan skills installed per project | Two copies load, and the project's copy drifts from the user's | See Rules: the plan skills are installed per user |
| A `<...>` placeholder written into a file | The file then states something nobody filled in | See Steps 3 |

## Rules

- Everything the skill writes comes from `templates/` in this skill's folder, from the user's answers, and from the `ordo-init` and `roadmap` skills beside it.
- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
- The skill writes nothing outside the repository's folder, except a change to `templates/shared-rules.md` the user rules on in `sync`.
- A page it writes states rules the user or a template gave; it never adds a rule of its own.
- The skill never invents a coding rule.
- Build files are written only for what the user names; nothing is assumed.
- The plan skills are never installed per project: they are installed per user, and one copy is loaded.
- Every file it writes follows the prose standard: ASCII, one paragraph per source line, no history.
