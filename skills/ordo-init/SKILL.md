---
name: ordo-init
description: "Set a repository up for the plan skills: draft .agents/plan.yaml from what the repository already has (the roadmap, the page that defines the checks, the change standard, the check commands its CI and build files run, one project or several), offer the pages it lacks, make git ignore the worktree root and keep the configuration tracked, and write nothing until the user approves. On a repository that already has .agents/plan.yaml it checks the file instead: required keys, unknown keys, values, the pages it names, the ignore rules. Triggers on: ordo-init, set up the plan skills, init plan.yaml, configure ordo, check plan.yaml."
metadata:
  version: "1.1.0"
---

# Set a repository up for the plan skills

`/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.

## Quick start

```
/ordo-init     draft .agents/plan.yaml and the pages it lacks for approval, or check the .agents/plan.yaml that is there
```

## Use instead

| When | Use |
|---|---|
| A new repository, set up from nothing | `/repo-setup` |
| The configuration exists and the roadmap needs an entry | `/roadmap add <goal>` |
| The configuration and the roadmap exist and a plan is to be opened | `/plan <entry>` |

## What it reads

1. The plan skill's `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several), in the `plan` folder beside this skill's folder: the keys, which are required, each optional key's default, and the comment that says what the key is.
2. `.agents/plan.yaml`, when it exists; then the skill checks instead of drafting ("Steps / Checking an existing file").
3. The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11.
4. The repository: `git ls-files`, the CI configuration (`.github/workflows/`, `.gitlab-ci.yml` and the like), the build and package files (`package.json` scripts, `Makefile`, `CMakeLists.txt` and `CMakePresets.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`), the documentation folders, `README.md`, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, and `.gitignore`.

## Steps

Run from the repository root.

1. Choose the form.
   - A repository whose tools each have their own build file and their own documentation under separate directories (`tools/<name>/`, `packages/<name>/`) is drafted in the `projects:` form, one project per directory, named by the directory and with `worktree_paths` set to it.
   - Otherwise the one-project form.
   - The draft says which form and why.
2. Draft `roadmap`: the tracked file that lists the open work, one entry per piece of it.
   - Candidates are files named `roadmap`, `ROADMAP`, `execution-order`, `TODO` or `backlog` in any documentation folder.
   - A repository can keep an ordered build plan next to a capability map (a file per feature, or an index that the ordered plan walks through): the key names the ordered file, because `/plan` matches `<entry>` against its entries.
   - The draft names the map in the key's comment.
   - Several candidates are a stop ("Stops").
   - None: the skill offers to write `docs/roadmap.md` from the `roadmap` skill's `templates/roadmap.md` (in the `roadmap` folder beside this skill's folder), with no entries; `/roadmap add` fills it.
3. Draft `verification`: the page that defines the green check, with the commands every step runs and the directory each runs from.
   - An existing page qualifies only when it states commands.
   - None: the skill offers to write `docs/dev/building.md` from the commands the CI jobs and build files run (install, build, test, lint, type check).
   - Each command is run once from its directory before it is written.
   - Its exit status and the last lines of its output are shown beside it.
   - A command that fails is not written as a check: it is a stop ("Stops").
4. Draft `rules`: the page that says how a change is made (a change standard, `CONTRIBUTING.md`, or the rules section of `AGENTS.md` or `CLAUDE.md`).
   - None: the skill offers to write `docs/dev/change-standard.md` from the `repo-setup` skill's `templates/docs/dev/change-standard.md` (in the `repo-setup` folder beside this skill's folder).
   - Its placeholders are filled from this repository: the standards pages, the folders a renamed name is grepped across, the verification commands with their filters.
   - Each rule the repository already states elsewhere is added, citing the file it came from.
5. Draft `ledger_root`, `archive_root` and `worktree_root`: an existing folder of plans (a folder whose subfolders hold `plan.md` and `orchestrator-state.md`) or of worktrees is kept; otherwise the example's values.
6. Ask for `worker` and `reviewer`, with the example's value as the offered answer ("Stops").
7. Leave each optional key out, so its default applies, unless the repository gives a reason.
   - A key that is written names that reason in its comment.
   - `standards` lists the coding, layout or prose standard pages the repository has.
   - `worktree_paths` is the project's directory in the `projects:` form.
   - `bench` and `look` are left out unless the user names binaries or a view.
   - `launch_note` is left out unless the user names a command that records launched builders.
8. Give every key written the example's comment for it, without the required/optional marker, in the example's order.
9. Draft the ignore rules.
   - The worktree root must be ignored: `git check-ignore -q --no-index <worktree_root>/probe` exits 0.
   - When it does not, the draft adds `/<worktree_root>/` to `.gitignore`.
   - `.agents/plan.yaml` must not be ignored: `git check-ignore -q --no-index .agents/plan.yaml` exits 1.
   - A rule that ignores the whole `.agents/` folder is drafted as `.agents/*` with `!.agents/plan.yaml` after it, since git cannot re-include a file whose parent folder is excluded.
10. Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` changes, as Rules 4 says; and, when the skill runs alone, the question whether it may commit.
11. Stop for the approval ("Stops").
12. Write what was approved.
13. Run `python3 <this skill's folder>/templates/check_config.py .` and show its output.
    - The setup is done only when that exits 0.
14. Commit the files written by explicit path list, in one commit whose subject names the plan configuration.
    - The commit is made only when the repository's commit rule ("What it reads" 3) allows it.
    - Otherwise the skill stops ("Stops"), except under `/repo-setup`, where the setup goes on and `repo-setup`'s Steps 13 raises the one stop.

### Checking an existing file

1. With `.agents/plan.yaml` present, write nothing and run `templates/check_config.py`.
2. It reports: a required key missing; an unknown key; a value of the wrong kind (`worker` or `reviewer` not `claude:<model>` or `codex:<model>`, `review` neither `every` nor `earned`, a value whose kind differs from its default's); a page named by `roadmap`, `verification`, `rules` or `standards` that does not exist; a `worktree_paths` entry that does not exist; a `launch_note` that is not an absolute path to an executable file (relative, missing, a directory, or not executable); a worktree root git does not ignore; a configuration file git ignores.
3. Optional keys left out are listed as notes, with the default that applies.
4. For each error, propose the fix ("Stops").
5. Make each fix the user approved.
6. After the fixes, run the check again.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The draft | Every setup, at Steps 11 | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |
| Several roadmaps | More than one roadmap candidate | The candidates | The user's pick |
| Worker and reviewer | Every setup, at Steps 6 | The offered answer Steps 6 names | The user's answer |
| A failing command | A command meant for the verification page fails its one run | What Steps 3 shows beside it | The user's decision |
| A fix in the check | The check reports an error in an existing file | The error and the proposed fix | The user's approval |
| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, and the command that shows them (`git status --short`) | The user's commit |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A rule the repository does not state, written into a page | The page then binds the builders to something nobody decided | Rules 2 and 3 |
| Overwriting an existing page or `.agents/plan.yaml` | The user's text is lost without a decision | Rules 4 |

## Rules

- The skill writes nothing until the user approves or corrects the draft. The one exception is Steps 3, where each verification command runs once before the draft is shown.
- The skill draws only from the repository and the user, for the file it drafts and for every page.
- A page the skill writes states what the repository already does or says, and cites where.
- The skill never overwrites an existing page or `.agents/plan.yaml`. A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
- Every path is relative to the repository root, except `launch_note`, which is an absolute path.
