---
name: ordo-init
description: "Set a repository up for the plan skills: draft .agents/plan.yaml from what the repository already has (the roadmap, the page that defines the checks, the change standard, the check commands its CI and build files run, one project or several), offer the pages it lacks, make git ignore the worktree root and keep the configuration tracked, and write nothing until the user approves. On a repository that already has .agents/plan.yaml it checks the file instead: required keys, unknown keys, values, the pages it names, the ignore rules. Triggers on: ordo-init, set up the plan skills, init plan.yaml, configure ordo, check plan.yaml."
metadata:
  version: "1.0.0"
---

# Set a repository up for the plan skills

`/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It drafts from the repository, shows the draft, and writes only what the user approves. Run from the repository root.

## What it reads

1. The plan skill's `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several), in the `plan` folder beside this skill's folder: the keys, which are required, and each optional key's default and the comment that says what the key is.
2. `.agents/plan.yaml`, when it exists. Then the skill checks instead of drafting (see "Checking an existing file").
3. The repository: `git ls-files`, the CI configuration (`.github/workflows/`, `.gitlab-ci.yml` and the like), the build and package files (`package.json` scripts, `Makefile`, `CMakeLists.txt` and `CMakePresets.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`), the documentation folders, `README.md`, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, and `.gitignore`.

## Drafting the file

One project or several: a repository whose tools each have their own build file and their own documentation under separate directories (`tools/<name>/`, `packages/<name>/`) is drafted in the `projects:` form, one project per directory, named by the directory and with `worktree_paths` set to it. Otherwise the one-project form. The draft says which form and why.

Each required key:

- `roadmap`: the tracked file that lists the open work, one entry per piece of it. Candidates are files named `roadmap`, `ROADMAP`, `execution-order`, `TODO` or `backlog` in any documentation folder. A repository can keep an ordered build plan next to a capability map (a file per feature, or an index that the ordered plan walks through): the key names the ordered file, because `/plan` matches `<entry>` against its entries, and the draft names the map in the key's comment. Several candidates: they are shown and the user picks. None: the skill offers to write `docs/roadmap.md` from the `roadmap` skill's `templates/roadmap.md` (in the `roadmap` folder beside this skill's folder), with no entries; `/roadmap add` fills it.
- `verification`: the page that defines the green check, with the commands every step runs and the directory each runs from. An existing page qualifies only when it states commands. None: the skill offers to write `docs/dev/building.md` from the commands the CI jobs and build files run (install, build, test, lint, type check). Each command is run once from its directory before it is written; its exit status and the last lines of its output are shown beside it. A command that fails is not written as a check: it is shown, and the user decides.
- `rules`: the page that says how a change is made (a change standard, `CONTRIBUTING.md`, or the rules section of `AGENTS.md` or `CLAUDE.md`). None: the skill offers to write `docs/dev/change-standard.md` from the `repo-setup` skill's `templates/docs/dev/change-standard.md` (in the `repo-setup` folder beside this skill's folder), its placeholders filled from this repository (the standards pages, the folders a renamed name is grepped across, the verification commands with their filters), plus each rule the repository already states elsewhere, citing the file it came from. It does not invent a rule.
- `ledger_root`, `archive_root`, `worktree_root`: an existing folder of plans (a folder whose subfolders hold `plan.md` and `orchestrator-state.md`) or of worktrees is kept; otherwise the example's values.
- `worker` and `reviewer`: asked, with the example's value as the offered answer.

Each optional key is left out, so its default applies, unless the repository gives a reason, and a key that is written names that reason in its comment: `standards` lists coding, layout or prose standard pages the repository has; `worktree_paths` is the project's directory in the `projects:` form; `bench` and `look` are left out unless the user names binaries or a view.

Every key written carries the example's comment for it, without the required/optional marker, in the example's order.

## Ignore rules

- The worktree root must be ignored: `git check-ignore -q --no-index <worktree_root>/probe` exits 0. When it does not, the skill adds `/<worktree_root>/` to `.gitignore`.
- `.agents/plan.yaml` must not be ignored: `git check-ignore -q --no-index .agents/plan.yaml` exits 1. A rule that ignores the whole `.agents/` folder is rewritten as `.agents/*` with `!.agents/plan.yaml` after it, since git cannot re-include a file whose parent folder is excluded.

## Approval, then writing

The skill shows, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` lines it would add or rewrite. It writes nothing until the user approves or corrects the draft. After writing, it runs

```
python3 <this skill's folder>/templates/check_config.py .
```

and shows the output; the setup is done only when that exits 0. The files written are committed by explicit path list, in one commit whose subject names the plan configuration.

## Checking an existing file

With `.agents/plan.yaml` present, the skill writes nothing and runs `templates/check_config.py`, which reports: a required key missing, an unknown key, a value of the wrong kind (`worker` or `reviewer` not `claude:<model>` or `codex:<model>`, `review` neither `every` nor `earned`, a value whose kind differs from its default's), a page named by `roadmap`, `verification`, `rules` or `standards` that does not exist, a `worktree_paths` entry that does not exist, a worktree root git does not ignore, and a configuration file git ignores. Optional keys left out are listed as notes with the default that applies. For each error the skill proposes the fix, and makes it after the user approves, then runs the check again.

## Rules

- The skill draws only from the repository and the user. A page it writes states what the repository already does or says, and cites where.
- It never overwrites an existing page or `.agents/plan.yaml`; changes to an existing file are shown as a diff and approved like the draft.
- Every path is relative to the repository root.
