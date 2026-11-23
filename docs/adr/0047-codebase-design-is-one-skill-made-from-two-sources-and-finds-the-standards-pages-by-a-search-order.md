# 0047. codebase-design is one skill made from two sources, and finds the standards pages by a search order

Status: proposed

## Context

Roadmap entry 19's goal names two public sources in the repository mattpocock/skills: `skills/engineering/codebase-design` (a vocabulary for module design, with the pages `DEEPENING.md` and `DESIGN-IT-TWICE.md`) and `skills/engineering/improve-codebase-architecture` (a scan that writes candidates and grills through the one the user picks). The second source loads the first through the Skill tool on every run. The source ends in its grilling loop and writes no roadmap entry. Ordo's standards pages ship as templates of `repo-setup`, and a repository keeps its own filled pages where its plan configuration says: the same repository can hold them under another folder than `docs/dev/`, or hold none. `paper` reads the prose standard from `docs/dev/prose-standard.md` and then from the `repo-setup` folder beside its own (`skills/academic/paper/SKILL.md`, "What it reads" 1).

## Decision

`codebase-design` is one skill with two modes. The `standards` mode fills the standards pages of an existing repository from the default pages `repo-setup` ships. The `review` mode reads the repository against its standards pages, writes candidates, and ends in a roadmap entry written through `grill` for the candidate the user picks. The content of both sources is kept in the one skill.

The skill finds the standards pages by a search order, and no step of it refuses a repository:

1. the pages the repository's `plan.yaml` names under `rules` and `standards`, when the repository has one;
2. the fixed names under `docs/dev/`;
3. the default pages in the `repo-setup` skill's folder, which stands beside this skill's folder.

The skill reads no standards page from a path outside the repository it runs in and its own skills folder.

The skill treats a repository's own pages in two ways:

- the `standards` mode adds and rewrites nothing that exists: a rule of a default page that already stands in the repository's pages, wherever it stands, is left as written, and a missing rule is drafted in the form it takes there and written after the user's approval;
- for a kind of page the repository lacks, the `review` mode holds the code to the default page, says in each such candidate that the rule comes from the default page, and skips a sentence that still holds an unfilled placeholder.

## Alternatives rejected

- Two skills, as the sources have them: the review would load the other skill on every run, and the vocabulary and the pages would be described in two places.
- The pages read only through `plan.yaml`: a repository without one is refused, and the `standards` mode exists for a repository that has nothing yet.
- The fixed names under `docs/dev/` and then the defaults, as `paper` reads the prose standard: a repository that keeps filled pages elsewhere would be reviewed against the defaults, and its own rules ignored.
- A copy of the default pages inside the skill: two copies of each page, which drift apart.
- The `standards` mode rewriting each page into the default page's structure: it would rewrite rules the user already approved, and every record and brief that cites a line of them would go stale.
- The `review` mode silent on a kind of page the repository lacks: the default pages are the standards the skill exists to hold a repository to.
- The review ending in the source's grilling loop: the result would stay in the conversation, where the plan skills cannot run it.

## Consequences

One skill holds the vocabulary once. A change that splits the skill, fixes a page's path, or ends the review without a roadmap entry contradicts this record and needs a record that supersedes it. The skill depends on `repo-setup` standing beside it, as `paper`, `writing` and `code-comments` already do. The search order has three places to state and keep true in the skill text.
