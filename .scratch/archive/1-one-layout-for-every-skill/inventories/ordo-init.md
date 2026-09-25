# Rule inventory: ordo-init

- Old: `skills/ordo-init/SKILL.md` at `aa7cfe2`
- New: `skills/ordo-init/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /ordo-init | Quick start |
| 3 | Draft .agents/plan.yaml from what the repository has | Steps |
| 3 | Offer the pages it lacks | Steps |
| 3 | Make git ignore the worktree root | Steps 9 |
| 3 | Keep the configuration tracked | Steps 9 |
| 3 | Write nothing until the user approves | Rules 1 |
| 3 | On a repository with .agents/plan.yaml, check the file instead | Steps / Checking an existing file 1 |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.0.0, now 1.1.0 in metadata.version | Quick start |
| 10 | /ordo-init writes the one file the plan skills need, and the pages it names when the repository lacks them | Quick start |
| 10 | It drafts from the repository | Rules 2 |
| 10 | It shows the draft | Steps 10 |
| 10 | It writes only what the user approves | Rules 1 |
| 10 | Run from the repository root | Steps |
| 14 | The plan skill's example files: the keys, the required ones, the defaults and the comments | What it reads 1 |
| 15 | .agents/plan.yaml when it exists; then the skill checks instead of drafting | What it reads 2 |
| 16 | The repository's files listed | What it reads 4 |
| 20 | Separate tools with their own build and docs are drafted in the projects: form, one per directory, worktree_paths set | Steps 1 |
| 20 | Otherwise the one-project form | Steps 1 |
| 20 | The draft says which form and why | Steps 1 |
| 22 | Each required key | Steps |
| 24 | roadmap: the tracked file listing the open work, one entry per piece | Steps 2 |
| 24 | The candidates' names | Steps 2 |
| 24 | With a capability map beside an ordered plan, the key names the ordered file | Steps 2 |
| 24 | The draft names the map in the key's comment | Steps 2 |
| 24 | Several candidates are shown and the user picks | Stops 2 |
| 24 | None: offer docs/roadmap.md from the roadmap skill's template, with no entries | Steps 2 |
| 25 | verification: the page defining the green check, the commands and their directories | Steps 3 |
| 25 | An existing page qualifies only when it states commands | Steps 3 |
| 25 | None: offer docs/dev/building.md from the CI and build commands | Steps 3 |
| 25 | Each command is run once before it is written | Steps 3 |
| 25 | Its exit status and last lines are shown beside it | Steps 3 |
| 25 | A failing command is not written as a check | Steps 3 |
| 25 | It is shown, and the user decides | Stops 4 |
| 26 | rules: the page that says how a change is made | Steps 4 |
| 26 | None: offer docs/dev/change-standard.md from repo-setup's template | Steps 4 |
| 26 | Its placeholders filled from this repository | Steps 4 |
| 26 | Each rule the repository states elsewhere added, citing its file | Steps 4 |
| 26 | It does not invent a rule | Anti-patterns 1 |
| 27 | The three roots: an existing folder of plans or worktrees kept, else the example's values | Steps 5 |
| 28 | worker and reviewer asked, with the example's value offered | Steps 6 |
| 30 | Each optional key left out unless the repository gives a reason | Steps 7 |
| 30 | A key written names its reason in its comment | Steps 7 |
| 30 | standards lists the standard pages the repository has | Steps 7 |
| 30 | worktree_paths is the project's directory in the projects: form | Steps 7 |
| 30 | bench and look are left out unless the user names them | Steps 7 |
| 32 | Every key carries the example's comment, without the marker, in the example's order | Steps 8 |
| 34 | Ignore rules | Steps 9 |
| 36 | The worktree root must be ignored, checked by check-ignore | Steps 9 |
| 36 | When it is not, /<worktree_root>/ is added to .gitignore | Steps 9 |
| 37 | .agents/plan.yaml must not be ignored, checked by check-ignore | Steps 9 |
| 37 | A rule ignoring all of .agents/ is rewritten as .agents/* with the exception, since git cannot re-include under an excluded folder | Steps 9 |
| 41 | What is shown, in order: the form, the draft, each page with the commands' results, the .gitignore lines | Steps 10 |
| 41 | Nothing is written until the user approves or corrects the draft (by plan 2.B, except the one run of each verification command before the draft is shown) | Rules 1 |
| 41 | After writing it runs check_config.py | Steps 13 |
| 44 | The check command | Steps 13 |
| 47 | It shows the output; the setup is done only when that exits 0 | Steps 13 |
| 47 | The files written are committed by explicit path list, one commit naming the plan configuration (by plan 2.B, only when the repository's commit rule allows it) | Steps 14 |
| 51 | With plan.yaml present, the skill writes nothing and runs check_config.py | Steps / Checking an existing file 1 |
| 51 | What the check reports | Steps / Checking an existing file 2 |
| 51 | Optional keys left out are listed as notes with their default | Steps / Checking an existing file 3 |
| 51 | For each error the skill proposes the fix | Steps / Checking an existing file 4 |
| 51 | It makes the fix after approval | Steps / Checking an existing file 5 |
| 51 | After the fixes, runs the check again | Steps / Checking an existing file 6 |
| 55 | The skill draws only from the repository and the user | Rules 2 |
| 55 | A page it writes states what the repository does or says, and cites where | Rules 3 |
| 56 | It never overwrites an existing page or .agents/plan.yaml | Rules 4 |
| 56 | Changes to an existing file are shown as a diff and approved like the draft | Rules 4 |
| 57 | Every path is relative to the repository root (by plan 2.B, except launch_note, an absolute path) | Rules 5 |
