# Rule inventory: repo-setup

- Old: `skills/repo-setup/SKILL.md` at `709fcf6`
- New: `skills/repo-setup/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /repo-setup | Quick start |
| 3 | Sets up a new repository in the shape the plan skills expect, with the files the description lists | The tree |
| 3 | Shows the whole tree and every file | Steps 4 |
| 3 | Writes nothing before showing them | Rules |
| 3 | With sync, compares the shared-rules block with the template and rewrites it after approval | Steps / sync |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.0.0, now 1.1.0 in metadata.version | Quick start |
| 8 | The title | Quick start |
| 11 | /repo-setup [<path>] sets up a new repository; the default folder must hold no tracked file | Quick start |
| 12 | /repo-setup sync [<path>] checks an existing repository's block against the template | Quick start |
| 15 | Everything the skill writes comes from templates/, the answers, and the ordo-init and roadmap skills | Rules |
| 15 | It shows the full tree and every file's text | Steps 4 |
| 15 | It writes nothing before that | Rules |
| 17 | The questions, as their own section | The questions |
| 19 | Asked together, in plain prose, each with the default in brackets | Steps 2 |
| 21 | Question 1: the name and one paragraph | The questions 1 |
| 22 | Question 2: the kind, and the build system and ignore patterns for another kind | The questions 2 |
| 23 | Question 3: the build system, language standard and test harness | The questions 3 |
| 23 | Build files are written only for what the user names; nothing is assumed | Rules |
| 24 | Question 4: the license and holder, MIT from the template, another from given or fetched text | The questions 4 |
| 25 | Question 5: the commit rule, default commit only when told | The questions 5 |
| 26 | Question 6: the coding standard copied, written from the user's rules, or none | The questions 6 |
| 26 | The skill does not invent coding rules | Rules |
| 27 | Question 7: the project skills from a sibling lock file, a list, or none | The questions 7 |
| 27 | The plan skills are never installed per project; per user, one copy loaded | Rules |
| 28 | Question 8: the repository's own rules, for Project rules | The questions 8 |
| 30 | The tree, as its own section | The tree |
| 32-49 | The tree block, every file with its source | The tree |
| 51 | Placeholders are filled from the answers or the files written before | Steps 3 |
| 51 | A placeholder with no answer is shown and never written as <...> | Steps 3 |
| 53 | The order of work, as numbered steps | Steps |
| 55 | git init when the folder is not a repository | Steps 1 |
| 55 | A folder with tracked files is a refusal naming /repo-setup sync and /ordo-init | Stops 7 |
| 56 | The questions, then the draft with every file's text, shown together | Steps 4 |
| 56 | Nothing is written until the user approves or corrects it | Rules |
| 57 | The files are written | Steps 5 |
| 57 | AGENTS.md is created with ln -s | Steps 6 |
| 58 | The project skills are installed from the root, per source, with the npx command | Steps 7 |
| 58 | The CLI copies into .agents/skills, links under .claude/skills, writes skills-lock.json | Steps 7 |
| 58 | The Skills section of CLAUDE.md lists each installed skill | Steps 8 |
| 59 | /ordo-init runs with its own draft and approval, writes plan.yaml and building.md, its check passes | Steps 9 |
| 59 | The Build section and the change-standard command block are filled from building.md | Steps 10 |
| 60 | The checks are run | Steps 11 |
| 60 | Each check's output is shown | Steps 12 |
| 62-67 | The four check commands | Steps 11 |
| 69 | The setup is done when the first two exit 0, the scan prints nothing, the last exits 0 | Steps 11 |
| 70 | One commit by explicit path list, every file named, the subject naming the setup (by plan 2.B, only when the answer to question 5 allows it, and without the files /ordo-init committed at Steps 9) | Steps 13 |
| 70 | .agents/skills and .claude are not committed; skills-lock.json is | Steps 13 |
| 72 | sync, as its own part | Steps / sync |
| 74 | sync runs the check on the path | Steps / sync 1 |
| 76-78 | The sync_rules.py command | Steps / sync 1 |
| 80 | It acts on the exit status | Steps / sync 1 |
| 82 | Exit 0: the block equals the template; nothing to do | Steps / sync 2 |
| 83 | Exit 1: the diff is shown and the user rules per hunk | Steps / sync 3 |
| 83 | The template's text goes in with --write after approval | Steps / sync 3 |
| 83 | Or the repository's text goes into templates/shared-rules.md, and other repositories differ until synced | Steps / sync 3 |
| 84 | Exit 2: no block, or AGENTS.md not a symlink; the skill drafts the change | Steps / sync 4 |
| 84 | The block inserted after the opening paragraph | Steps / sync 4 |
| 84 | Each rule the block now states listed for removal with its replacement | Steps / sync 4 |
| 84 | A rule that differs in substance kept in Project rules and named | Steps / sync 4 |
| 84 | AGENTS.md replaced by the symlink after its text is compared with CLAUDE.md | Steps / sync 4 |
| 84 | A difference is shown and ruled on first | Stops 5 |
| 84 | It writes after approval | Steps / sync 6 |
| 84 | It runs the check again until it exits 0 | Steps / sync 7 |
| 86 | The change is committed by path when the commit rule allows it | Steps / sync 8 |
| 86 | Otherwise it stops with the files changed and git status --short | Stops 6 |
| 88 | The rules, as their own section | Rules |
| 90 | Nothing is written outside the folder except a ruled change to templates/shared-rules.md | Rules |
| 91 | A page states rules the user or a template gave, never its own | Rules |
| 92 | Every file follows the prose standard: ASCII, one paragraph per line, no history | Rules |
