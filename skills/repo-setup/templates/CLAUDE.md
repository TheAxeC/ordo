# Working conventions for <name>

<One paragraph: what the repository is, its language and build system, and its main parts.> `AGENTS.md` is a symlink to this file, so Claude Code and Codex read the same text.

<!-- ordo:shared-rules begin -->
<!-- ordo:shared-rules end -->

## Project rules

- **Commits.** <Commit only when told, each time. | Committing is allowed.>
<- Each rule the user states for this repository, one line.>

## Read before you act

- `docs/dev/building.md`: how to build and test, and what the green check is. Read it before running or reporting any build.
- `docs/dev/change-standard.md`: how a change is made and reported. Every brief points here first.
<- `docs/dev/coding-standards.md`: how code is written.>
- `docs/dev/prose-standard.md`: how every comment, page and message is written.
- `docs/roadmap.md`: what is open and in what order. Answer "what is left?" from this file, never from memory.
- `docs/adr/`: the decisions, with the alternatives rejected. A change that contradicts an ADR is a rule clash.

## Build

```sh
<the commands from docs/dev/building.md, one per line, each with a comment>
```

## Skills

`skills-lock.json` lists the project skills; `npx skills experimental_install` restores them into `.agents/skills/` with links under `.claude/skills/`. The plan skills are installed per user and are not listed here.

<- `<skill>`: <its description, one line>.>
