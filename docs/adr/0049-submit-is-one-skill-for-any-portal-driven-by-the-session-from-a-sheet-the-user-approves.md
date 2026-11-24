# 0049. submit is one skill for any portal, driven by the session from a sheet the user approves

Status: proposed

## Context

Roadmap entry 25's goal names a skill that makes a submission through a web portal: it writes down everything the portal asks for, fills the portal's forms, uploads the files, and stops before the final submit. The user ruled that it serves any submission, a manuscript, a grant application or a registration for an event among them. An earlier roadmap entry for a manuscript-only skill was dropped because each portal differs and a submission is made a few times a year. That reason held for a skill that knows each portal in advance. A browser extension now lets the session read a portal's pages and act on them, so the skill reads what a portal asks from the portal. `paper`'s modes are academic-paper's, copied (ADR 0043), and academic-paper has no mode that walks a portal.

## Decision

`submit` is one skill, `/submit <url> [<folder>]`, and neither `paper` nor `grant` has a mode for it.

- A fresh agent writes the submission sheet: every field the portal asks for with its value, every file to upload, and every declaration with the answer proposed. It reads the portal's forms for what is asked and the folder for the material: for a manuscript `paper`'s run folder and journal submission guide when they are there, for a grant application the funder config and the fields file.
- The user approves the sheet before the browser is touched.
- The session drives the browser and fills what the sheet holds. A field the portal asks that the sheet lacks is added to the sheet as a question to the user.
- The session never types a password, never agrees to a licence, a copyright transfer or a payment, and never presses the final submit.
- Without the extension connected, the skill writes the sheet and stops.
- `docs/figures/paper/lifecycle.svg` names `/submit` at "You submit" and "You resubmit".

## Alternatives rejected

- A `submit` mode of `paper`: it cannot hold a grant application or a registration, and it adds a thirteenth mode against ADR 0043 for steps that are not about a manuscript.
- The skill plus thin modes in `paper` and `grant` that call it: three places name the same steps.
- An agent drives the browser: the user cannot answer an agent in the middle of a walk, and a portal the skill has not seen raises questions.
- The skill ticks every declaration and agreement the portal shows: a licence, a copyright transfer and a payment bind the user, who must make them.

## Consequences

`paper` stays at twelve modes and two calls. The skill depends on the browser extension for the walk and is still of use without it, through the sheet. A portal that needs a file the folder lacks, such as a PDF of a Word document, gets it from the user, since the skills export no Word document.
