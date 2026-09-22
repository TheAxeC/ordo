---
name: repo-setup
description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules and AGENTS.md as a symlink to it, docs/ with the change standard, the prose standard, the building page, a roadmap and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and .agents/plan.yaml through /ordo-init. Shows the whole tree and every file before writing. With sync, compares an existing repository's shared-rules block with the template and rewrites it after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules."
metadata:
  version: "1.0.0"
---

# Set up a repository

```
/repo-setup [<path>]          a new repository at <path> (default: the current folder, which must hold no tracked file)
/repo-setup sync [<path>]     an existing repository: its shared-rules block against the template
```

Everything the skill writes comes from `templates/` in this skill's folder, from the answers the user gives, and from the `ordo-init` and `roadmap` skills beside it. It shows the full tree and every file's text before it writes anything.

## What it asks

Asked together, in plain prose, each with the default in brackets:

1. The repository's name and one paragraph on what it is.
2. The kind, for the `.gitignore` and the build files: `cpp`, `python`, `typescript`, or another the user names (then the user gives the build system and the patterns to ignore).
3. The build system, language standard and test harness, as far as the user fixes them now. Build files are written only for what the user names; nothing is assumed.
4. The license [MIT] and its holder. MIT is written from `templates/LICENSE-MIT`; another license is written from the text the user gives or from its SPDX name's official text, fetched and shown.
5. The commit rule for this repository [commit only when told].
6. The coding standard: copied from a sibling repository the user names (its page read whole and adapted to this repository's names), written from rules the user states, or none yet. The skill does not invent coding rules.
7. The project skills: the set in a sibling repository's `skills-lock.json` the user names, a list the user gives, or none. The plan skills are never installed per project: they are installed per user, and one copy is loaded.
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

Placeholders in a template (`<...>`) are filled from the answers or from the files written before; a placeholder with no answer is shown to the user and never written as `<...>`.

## Order of work

1. `git init` when the folder is not a repository. The folder must hold no tracked file; a folder with tracked files is a refusal that names `/repo-setup sync` and `/ordo-init`.
2. The questions, then the draft: the tree above with every file's full text, shown together. Nothing is written until the user approves or corrects it.
3. The files are written. `AGENTS.md` is created with `ln -s CLAUDE.md AGENTS.md`.
4. The project skills are installed from the repository root, per source, with `npx skills add <source> --skill <name> [--skill <name>...] -a claude-code -a codex -y`. The CLI copies them into `.agents/skills/`, links them under `.claude/skills/`, and writes `skills-lock.json`. The Skills section of `CLAUDE.md` lists each installed skill with its description.
5. `/ordo-init` runs, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`, and its check passes. The Build section of `CLAUDE.md` and the command block of `docs/dev/change-standard.md` are then filled from `docs/dev/building.md`.
6. The checks, each run and its output shown:

   ```
   python3 <this skill's folder>/templates/sync_rules.py .
   python3 <ordo-init's folder>/templates/check_config.py .
   LC_ALL=C grep -rn '[^ -~]' CLAUDE.md README.md docs/
   git check-ignore -q --no-index .agents/skills/probe && ! git check-ignore -q --no-index .agents/plan.yaml
   ```

   The setup is done when the first two exit 0, the scan prints nothing, and the last line exits 0.
7. One commit by explicit path list, every file written named, the subject naming the repository's setup. `.agents/skills/` and `.claude/` are ignored and not committed; `skills-lock.json` is.

## sync

`/repo-setup sync` runs

```
python3 <this skill's folder>/templates/sync_rules.py <path>
```

and acts on its exit status:

- **0**: the block equals the template; nothing to do.
- **1**: the block differs; the diff is shown. The user rules per hunk: the template's text goes into the repository (`--write` after approval), or the repository's text is the wording wanted everywhere, and the change goes into `templates/shared-rules.md` in this skill's folder, after which every repository set up from it differs until it is synced.
- **2**: no block, or `AGENTS.md` is not a symlink to `CLAUDE.md`. The skill drafts the change: the block inserted after the opening paragraph, each rule of the existing `CLAUDE.md` that the block now states listed for removal with the block rule that replaces it, a rule that differs in substance kept in Project rules and named, and `AGENTS.md` replaced by the symlink after its text is compared with `CLAUDE.md` (a difference is shown and ruled on first). It writes after approval, then runs the check again until it exits 0.

The change is committed by explicit path list when the repository's commit rule allows it; otherwise the skill stops with the files changed and the command that shows them (`git status --short`).

## Rules

- The skill writes nothing outside the repository's folder, except a change to `templates/shared-rules.md` the user rules on in sync.
- A page it writes states rules the user or a template gave; it never adds a rule of its own.
- Every file it writes follows the prose standard: ASCII, one paragraph per source line, no history.
