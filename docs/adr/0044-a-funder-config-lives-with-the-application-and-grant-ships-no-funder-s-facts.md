# 0044. A funder config lives with the application, and grant ships no funder's facts

Status: proposed

## Context

Roadmap entry 8's goal has the `grant` skill work from a funder config: the funder's required sections, limits, layout rules and evaluation criteria. A funder changes these with each call: the folder `research-hub/funding/2026-fwo-senior-transplant/fwo-guidelines/` holds two versions of one scoring grid, marked "v. 2027" and v2025. Funders state their limits in different units, FWO in pages for the project outline and in characters for form fields (`research-hub/funding/2026-fwo-senior-transplant/admin/form-fields.md`), and each has its own criteria and scale. The skills of this repository carry no project name and no path (`README.md`, first paragraph), and the installed skills change only through a tagged release (`README.md`, "Working on Ordo").

## Decision

`grant` ships the format of a funder config and one filled example, and holds no funder's facts. The mode `/grant config` has an agent draft a config from the call documents the user gives; the user approves it; it is saved beside the application, named by funder, programme and call year. Every other mode reads the config from there. A config is one Markdown page with fixed headings and tables, each fact with the page of the call it came from.

## Alternatives rejected

- Configs shipped in the skill, one per programme and year: each goes out of date with the next call, and an application to a new funder would wait on a release of the skills.
- Shipped configs that a config in the repository overrides: a run would look in two places, and the shipped ones would still go out of date.

## Consequences

An application to any funder can start the day its call is out, and the config a run used stays with the application it was used for. The first application to each call costs one config run and the user's read of it. A defect in a config is fixed in the application's repository and is no change to the skill.
