# 0048. tutor is a copy of mattpocock's teach, with the name, an explain mode and its page added

Status: proposed

## Context

Roadmap entry 25's goal names a skill that teaches one topic over several sessions and also explains one concept on request. The teaching has a public source, the skill `teach` in the repository mattpocock/skills, at `skills/productivity/teach/`: `SKILL.md` and four format pages for the mission, the resources, a learning record and the glossary. It treats the folder it is run in as a teaching workspace with `MISSION.md`, `RESOURCES.md`, `lessons/`, `reference/`, `learning-records/`, `assets/` and `NOTES.md`. A lesson is one self-contained HTML page. Its written stops are the interview for the mission and the confirmation before the mission is changed. It applies recall from memory and spacing as rules for designing a lesson and schedules no review. The source's page `docs/productivity/teach.md` says the skill is not the tool for one explanation in passing. The user asked for exactly that as well: during a design interview an option names a method the user does not know, and the user asks to have it explained without leaving the session. `docs/roadmap.md` says an entry that rebuilds an existing skill follows that skill's design, and a deviation is made only with its reason and the user's ruling.

## Decision

`tutor` is a copy of the source's `teach`: its workspace files, its format pages, its lesson form and its two stops are the source's. Only the user invokes it. It differs from the source only in these points:

- the sections and the frontmatter of `docs/dev/skill-layout.md`, ASCII, the prose standard applied to the skill text, and no `agents/openai.yaml`, which this repository forces;
- the name `tutor`, since the skill both runs a course and answers one question;
- the glossary is the Markdown file `reference/GLOSSARY.md`, which stands among the HTML reference documents, since the source's format page gives it that name and form;
- the mode `/tutor explain <concept>`, which the source does not have. It explains one concept in the conversation, tied to the work at hand, from sources fetched in the run and named in the answer, as the source requires of a lesson. It writes no file. In a teaching workspace it offers a learning record for what the user showed they understand;
- `/tutor explain <concept> --page`, which also writes the explanation as one HTML page in the lesson's form, to `reference/` in a teaching workspace and elsewhere to a path the user gives or is asked for.

`tutor` and `wait-what` stand in the group folder `skills/explain/`.

## Alternatives rejected

- `teach` copied under its own name with no explain mode: the user's case, a concept met in the middle of other work, would have no skill, and the source's own page sends that case away.
- The explanation written as an HTML page by default: it stops the work the user was in to produce a page for an answer that is usually a few paragraphs.
- The explain mode added to `wait-what`: ADR 0045 keeps that skill's instruction at the source's one sentence, and it explains a message again without reading a source, which is another job.
- A review schedule added to the learning records: the source has none, and a copy keeps the source's design.

## Consequences

A later change to the workspace files, the lesson form or the stops contradicts this record and needs a record that supersedes it, with the run that showed the copy falling short. The explain mode is this repository's own and is changed like any other skill text. `wait-what` moves to `skills/explain/`, and `README.md`'s sentence on the group folders names five groups.
