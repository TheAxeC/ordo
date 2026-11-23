# 0045. wait-what and wizard are copies of their sources, with the differences this repository forces

Status: proposed

## Context

Roadmap entry 18's goal names two skills. Each has a public source in the repository mattpocock/skills: `skills/productivity/wait-what/SKILL.md` and `skills/engineering/wizard/SKILL.md` with its `template.sh`. The body of the source's `wait-what` is one sentence, and its page `docs/productivity/wait-what.md` gives the reason: a model copies the length of a skill, so a long skill about clear answers yields long answers. The source's `wizard` keeps a fixed bash library above a marker in `template.sh`, the same in every script it writes, and has the agent write only the stages below the marker. `docs/dev/skill-layout.md` gives every skill of this repository nine sections, which leaves room around `wait-what`'s one sentence that a later change could fill.

## Decision

`wait-what` and `wizard` are copies of their sources. The instruction of `wait-what` stays the source's one sentence, and the library of `wizard`'s template stays the source's, above its marker. They differ from the sources only where this repository forces it:

- the sections and the frontmatter of `docs/dev/skill-layout.md`;
- the glossary found at the path the plan configuration lists, with `wait-what` still working when a repository has none;
- `template.sh` in ASCII, and listed on `docs/dev/scripts.md`;
- no `agents/openai.yaml`;
- the prose standard applied to the skill text.

Only the user invokes `wait-what`: its frontmatter holds `disable-model-invocation: true`. The user and the model both invoke `wizard`.

## Alternatives rejected

- Both skills written as Ordo's own design from the goal: `wait-what` would gain steps, against the source's reason for its length, and the bash library would be written again with nothing the goal asks for gained.
- `wizard` as a copy and `wait-what` as Ordo's own design: the same objection for `wait-what`.

## Consequences

Both skills are short to build and to read. A change that adds an instruction to `wait-what`, or edits the template's library, contradicts this record and needs a record that supersedes it, with the run that showed the copy falling short. The template's library has no test, since its logic is the source's.
