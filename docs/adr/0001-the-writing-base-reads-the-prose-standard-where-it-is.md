# 0001. The writing base reads the prose standard where it is

Status: proposed

## Context

The writing skills (`literature`, `paper`, `paper-review`, `grant`) share one set of prose rules, the writing base of roadmap entry 3. Ordo already ships the prose standard as the `repo-setup` skill's `templates/docs/dev/prose-standard.md`, which `/repo-setup` installs as `docs/dev/prose-standard.md` and which a repository's `standards` key can name. Ordo's skills carry no project name and no path, and everything specific to a repository comes from its `.agents/plan.yaml` (`README.md`, opening). research-hub, where the writing skills are used, has no prose-standard page of its own.

## Decision

`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`. `skills/writing/` holds no copy of it.

## Alternatives rejected

- A copy in `skills/writing/references/` kept equal to the template by a compare script: two copies of one rule set, and a script whose only job is to keep them from drifting.
- The only copy moved into `skills/writing/references/`, installed by `repo-setup` from there: `repo-setup` would depend on `writing`, and every path that names the template would change.

## Consequences

A repository's own prose page takes precedence over Ordo's default, as its other standards pages do. `writing` needs the `repo-setup` skill installed beside it for a repository with no page of its own. A change to the prose standard reaches every writing skill at once.
