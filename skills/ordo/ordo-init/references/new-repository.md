# A new repository: the questions and the tree

The questions `/ordo-init` asks before it drafts a new repository, and the tree it drafts from the answers. Questions 1, 5 and 9 are also asked where `CLAUDE.md` is written from `templates/CLAUDE.md` in an existing or a configured repository, each only for what the repository does not show.

## The questions

1. The repository's name and one paragraph on what it is.
2. The kind, for the `.gitignore` and the build files: `cpp`, `python`, `typescript`, or another the user names (then the user gives the build system and the patterns to ignore).
3. The build system, language standard and test harness, as far as the user fixes them now.
4. The license [MIT] and its holder.
   - MIT is written from `templates/LICENSE-MIT`.
   - Another license is written from the text the user gives or from its SPDX name's official text, fetched and shown.
5. The commit rule for this repository [commit only when told].
6. The standards pages: Ordo's defaults [the defaults], or pages copied from a sibling repository the user names (each read whole and adapted to this repository's names), or pages written from rules the user states.
   - The defaults are `docs/dev/design-principles.md` and `docs/dev/coding-standards/common.md` always, a language page under `docs/dev/coding-standards/` for each language of question 2 and each language whose files the folder holds, and `docs/dev/ui-standard.md` when the user says the repository has a user interface.
   - A language with no template page (any kind other than C++, Python and TypeScript) gets no language page from the defaults.
     - The draft shown to the user says that this language gets no page.
     - The user may give that language's rules under the third answer.
7. Does the repository have a user interface a reader sees and operates? [no]
8. The project skills: the set in a sibling repository's `skills-lock.json` the user names, a list the user gives, or none.
9. Rules that belong to this repository only, for the Project rules section.
10. The code's layers, top down, and the repository's goals in a sentence, for `docs/dev/design-principles.md`, asked only when question 6 gave the defaults.
11. Whether to write the build driver `utils/build.py`, which runs the commands of `docs/dev/building.md` as `python3 utils/build.py build`, `test`, `check` and `gate` [yes].
    - A page that names no command gets no driver, whatever the answer, and `/ordo-init build` writes it once the page names one.

## The tree

```
CLAUDE.md                        templates/CLAUDE.md, the shared-rules block filled from templates/shared-rules.md, the Skills section left out when question 8 gave none
README.md                        the name, the paragraph, how to build (a pointer to docs/dev/building.md), the license line
LICENSE                          the license of question 4, its year the year of the day the skill runs
.gitignore                       templates/gitignore/common.gitignore, then the kind's file
skills-lock.json                 written by the skills CLI when the project skills are installed, absent when question 8 gave none
docs/dev/change-standard.md      templates/docs/dev/change-standard.md, its placeholders filled
docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md, its calibration exemplar line written as "Calibration exemplar: none yet."
docs/dev/design-principles.md    templates/docs/dev/design-principles.md, its placeholders filled, when question 6 gave the defaults
docs/dev/coding-standards/common.md   templates/docs/dev/coding-standards/common.md, its placeholders filled and each tool the repository does not configure left out as "Steps / A new repository" 3 of SKILL.md says, when question 6 gave the defaults
docs/dev/coding-standards/<language>.md   templates/docs/dev/coding-standards/<language>.md for each language as question 6 says, its placeholders filled and each tool the repository does not configure left out the same way, when question 6 gave the defaults
docs/dev/ui-standard.md          templates/docs/dev/ui-standard.md, its placeholders filled, when question 6 gave the defaults and the repository has a user interface
<the pages question 6 names>     the pages copied from a sibling repository or written from the user's rules, at the paths the answer gives, in place of the default pages above, or beside them for a language with no template page
docs/dev/building.md             written at "Steps / A new repository" 8 of SKILL.md from the build files and the answer to question 3, each command as named and not run; it names the driver's commands when "Steps / A new repository" 9 wrote utils/build.py, and the commands themselves otherwise
docs/roadmap.md                  the roadmap skill's templates/roadmap.md
docs/glossary.md                 templates/docs/glossary.md, the plan-terms block filled from templates/plan-terms.md
docs/adr/README.md               templates/docs/adr/README.md
docs/adr/template.md             templates/docs/adr/template.md
docs/plan.yaml                   written at "Steps / A new repository" 8 of SKILL.md
src/                             the source tree, with the build files for the kind as far as question 3 fixed them
utils/                           scripts the build and the checks run
utils/build.py                   templates/utils/build.py, its lists filled from docs/dev/building.md at "Steps / A new repository" 9 of SKILL.md, absent when question 11 gave no or docs/dev/building.md names no command
```
