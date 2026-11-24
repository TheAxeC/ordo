# Step 5 refuter report (on .agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-5, base a7850f3)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All commands were run from the worktree root. Tests ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests

$ printf '%s\0' README.md docs/figures/gen_figures.py docs/figures/pipeline.svg docs/glossary.md skills/explain/tutor/SKILL.md skills/explain/tutor/references/glossary-format.md skills/explain/tutor/references/learning-record-format.md skills/explain/tutor/references/mission-format.md skills/explain/tutor/references/resources-format.md skills/explain/wait-what/SKILL.md .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/5-report.md | xargs -0 perl -CSD -ne '<the brief's character-set check>'; echo "exit $?"
exit 0          (no line printed)

$ python3 -c 'import yaml; d=yaml.safe_load(open("skills/explain/tutor/SKILL.md").read().split("---")[1]); print(d["name"], len(d["description"]), d["metadata"]["version"], d["disable-model-invocation"])'
tutor 754 1.0.0 True

$ grep -rn 'skills/ordo/wait-what' README.md docs skills utils agents
docs/roadmap.md:80:- [x] 18. wait-what and wizard: at the closing on main (0b8e471), `skills/ordo/wait-what/` and `skills/code/wizard/` hold the skills; ... (one line, under docs/roadmap.md)
$ test ! -e skills/ordo/wait-what; echo "exit $?"
exit 0

$ grep -c 'explain/tutor' README.md
1
$ grep -c 'explain/wait-what' README.md
1
$ grep -n 'twenty-one' README.md
(nothing)
$ for s in $(grep -o 'for skill in [^;]*' README.md | head -1 | cut -d' ' -f4-); do test -f skills/$s/SKILL.md || echo "missing $s"; done
(no line)

$ diff <(git show a7850f3:skills/ordo/wait-what/SKILL.md) skills/explain/wait-what/SKILL.md; echo "exit $?"
exit 0          (no line printed)

$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

$ for each source format page: diff <source>/<X>-FORMAT.md skills/explain/tutor/references/<x>-format.md
GLOSSARY: (nothing)  LEARNING-RECORD: (nothing)  MISSION: (nothing)
RESOURCES:
29c29
< - **Group by Knowledge / Wisdom.** Mirrors the philosophy in [SKILL.md](./SKILL.md). ...
> - **Group by Knowledge / Wisdom.** Mirrors the philosophy in [SKILL.md](../SKILL.md). ...

$ python3 -I docs/figures/gen_figures.py   (run on a copy of the worktree in the scratch folder, not in the worktree)
exit 0
$ diff -rq <copy>/docs/figures <worktree>/docs/figures; echo "diff exit $?"
diff exit 0     (the regenerated figures equal the worktree's; git diff a7850f3 --stat shows pipeline.svg as the only changed figure)

$ ls skills/*/*/SKILL.md | wc -l
22
$ ls skills
academic code explain orchestration ordo
$ grep -o 'for skill in [^;]*' README.md | head -1 | cut -d' ' -f4- | wc -w
22

$ git status --short
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/glossary.md
 D skills/ordo/wait-what/SKILL.md
?? .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/5-report.md
?? skills/explain/
```

The builder's item-8 grep (wait-what, four group, twenty-one, skills/ordo) was rerun across skills, utils, docs, agents, README.md and CLAUDE.md, with docs/adr/ and docs/roadmap.md left out. Its hits are the ones the report names: `wait-what`'s own SKILL.md, tutor's Use instead row, `gen_figures.py:2296`, `pipeline.svg:108`, and README lines 25, 36 and 161. Every other hit names `skills/ordo/ordo-init`, `skills/ordo/session-retro` or the generic "group folder" lookup, and the move does not make any of them false. The alt text of `pipeline.svg` (README.md:69) does not contain `wait-what`.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated, Spec 1 and Spec 2. The source's sentences are carried over except for those Spec 1 names, and the additions of Spec 2 have no row. The frontmatter, the version, `disable-model-invocation: true`, the calls, the dropped `argument-hint` and the four Stops rows hold, as verify 3 and a read show. Standards 1 and 2 also bear on this item, and in both the builder followed the brief.
- 2: holds. The diff of each source page against its copy shows only the `../SKILL.md` link path.
- 3: holds. "Steps / Explaining" items 1 to 5 match ADR 0048's explain point: the explanation is given in the conversation, tied to the work at hand, with each fetched source named; no file is written without `--page`; and in a workspace a learning record is offered and written only on a yes. Standards 4 is a minor gap in item 5's completion criterion.
- 4: holds. "The call" item 1 refuses `--page` without `explain` and names the three calls, and item 2 asks for a missing concept. "The page" item 1 forms a name that holds no `/` and no `..`, item 2 chooses the path, item 3 asks before replacing a file, and item 4 writes the page in the lesson's form.
- 5: holds. `test ! -e skills/ordo/wait-what` gives exit 0, and the diff against the base copy prints nothing.
- 6: holds. README has the tutor row, the five-group sentence and both `explain/` loop entries, says twenty-two on both lines, and the loop check prints nothing.
- 7: violated, Spec 1, Spec 2 and Spec 3. The section "Deviations" leaves out the dropped and added behaviours those findings name, and the two ASCII characters that differ from the public source.
- 8: holds. The grep above is clean, `/tutor` is in the pipeline() note, the regenerated figures equal the worktree's, and only pipeline.svg changed.
- 9: holds. The four entries stand in "Ordo's own terms", in alphabetical order and in the section's form, and the sync check prints ok.

Cases of the brief's "Cases":

- Each heading, frontmatter key and format page of the source, found in "Deviations": partial. Every heading is mapped, but the dropped and added content of Spec 1, Spec 2 and Spec 3 is not listed (Spec 1, Spec 2, Spec 3).
- `/tutor <topic>` in an empty folder: met by reading. "Teaching" item 2 runs the mission interview as the run's first job, and its Stops row is "The mission interview".
- `/tutor <topic>` in a workspace whose mission the request would change: met by reading, "Teaching" item 3 and the Stops row "The confirmation before the mission is changed".
- `/tutor explain <concept>` in a code repository with no `MISSION.md`: met by reading, "Explaining" items 1 to 3. Item 4 writes nothing without `--page`, and item 5 applies only in a workspace (see Standards 4).
- `/tutor explain <concept>` in a teaching workspace: met by reading, "Explaining" item 5 and the Stops row "The offer of a learning record".
- `/tutor explain <concept> --page` in a teaching workspace: met by reading, "The page" item 2 (`reference/<name>`) and item 4 (the lesson's form).
- `/tutor explain <concept> --page` elsewhere with no path given: met by reading, "The page" item 2 and the Stops row "The page's path".
- The model deciding by itself that a lesson is due: met. Verify 3 prints `True`.
- `grep -rn 'skills/ordo/wait-what' ...`: met. Its only hit is docs/roadmap.md:80.
- `/tutor` with no topic in a workspace with learning records: met by reading, "Teaching" item 5.
- `/tutor explain` with no concept: met by reading, "The call" item 2.
- `/tutor --page` without `explain`: met by reading, "The call" item 1.
- `/tutor explain "a/b ../c" --page` in a teaching workspace: met by reading. "The page" item 1 gives `a-b-c.html`, and item 2 places it directly under `reference/`.
- `/tutor explain <concept> --page` elsewhere, with a path at which a file stands: met by reading, "The page" item 3.
- The install-loop command: met. It printed no line.
- `diff <(git show HEAD:...) skills/explain/wait-what/SKILL.md`: met. The diff against base a7850f3 printed no line.

## 1. Spec

- Spec 1, `skills/explain/tutor/SKILL.md:87` and `:100-101`, two sentences of the source that the copy drops or weakens, with no row in "Deviations":
  - What is there: "   - Its typography and layout are clean and readable, in the manner of Edward Tufte, since the user returns to the lessons to review." The source's "Lessons" section says: "A lesson should be **beautiful**, with clean, readable typography and layout, since the user will return to these later to review. Think Tufte." The copy drops "beautiful" for lessons and keeps it only for reference documents (`:99`).
  - What is there: "   - Reference documents suit these topics: ..., and a glossary for any topic with its own nomenclature." followed by "   - Write a glossary in the format of `references/glossary-format.md`." The source's "Reference Documents" section says: "Glossaries, in particular, are an essential reference." The copy gives the glossary the same rank as the other four kinds of reference document.
  - What is wrong: the brief's item 1 asks for every instruction of the source to be carried over, and item 7 asks for every difference to be listed. The prose-standard bullet of "Deviations" lists "Think Tufte." becoming "in the manner of Edward Tufte" but neither of these two changes.
  - Failure scenario: an agent writing a lesson is no longer told that the lesson must be beautiful, only clean, and an agent choosing reference documents is no longer told to favour a glossary. The user who reads deviations.md for the gate, which says "nothing else differs", finds two unlisted differences.
  - Verdict: item 1 and item 7 violated, and the case "Each heading ..." partial.
- Spec 2, `skills/explain/tutor/SKILL.md:51` and `:105`, behaviour the copy adds, with no row in "Deviations":
  - What is there: "1. Read the teaching workspace: each file and folder "The teaching workspace" lists that exists." The source asks the agent to read `learning-records` ("Zone Of Proximal Development") and `./assets/` ("Assets"), and to refer back to `NOTES.md`. It never asks for every lesson and every reference document to be read on each run.
  - What is there: "    - Done when the lesson is open, or the user is given its path." The source says only "If possible, open the lesson file for the user by running a CLI command"; giving the path when no command is available is new.
  - What is wrong: the brief asks for every added behaviour to be listed with its approval, and neither addition has a row.
  - Failure scenario: in a workspace with thirty lessons, every `/tutor` run reads thirty HTML files whole before teaching, which the source never does, and deviations.md does not tell the user.
  - Verdict: item 1 and item 7 violated, and the case "Each heading ..." partial.
- Spec 3, "Deviations" in the builder's report (to become `deviations.md`), the format-page row:
  - What is there: "| format pages ... | `references/glossary-format.md`, ... words unchanged | ...", and under "Format pages": "Their text is the source's apart from the one link path."
  - What is wrong: the brief's premise says that the ledger copies already write two characters of the public source in ASCII: the range "1-10" in `GLOSSARY-FORMAT.md` and "{...}" in `MISSION-FORMAT.md`. Those two differences from mattpocock's `teach` are shipped and not listed. The approval exists (ADR 0048's ASCII point); only the listing is missing.
  - Failure scenario: the user checks deviations.md against the public source for the gate and finds two differences that are not listed.
  - Verdict: item 7 violated, and the case "Each heading ..." partial.

## 2. Proof

- none. Every command the builder's report quotes was rerun and printed what the report claims: verify 1 to 5, the format-page diffs, the wait-what diff, the glossary sync, the skill count 22, the group count 5 and the figure regeneration.

## 3. Standards

- Standards 1, `skills/explain/tutor/SKILL.md:42-45` and `:164-171`, the Stops table. This is the builder's first hand-back, judged here.
  - The quoted hunk: "1. Refuse a call that holds `--page` without `explain`, naming the three calls: ..." and "2. Ask the user for the concept when the call holds `explain` with no concept." The Stops table holds only the four rows the brief fixed.
  - What is wrong: the run halts at both points, the first ending in a refusal and the second waiting on the user, and neither has a row. `docs/dev/skill-layout.md`, "Sections, in order", row 7, makes Stops the section where a reader finds where a skill halts. Its text does not say outright that a refusal needs a row. The repository's skills do give one: `grant` has "A missing input", `ordo-help` and `refute` list their refusals under a lead line, and wait-what's single "No stop" row says the skill never halts at all. The builder followed the brief's "The Stops table holds four rows", as change-standard rule 4 requires, and handed the point back.
  - My judgment: the hand-back is right. Adding the two rows ("No concept" and "`--page` without `explain`") is the better option, and keeping four rows is the cheaper one. ADR 0048's "its two stops are the source's" is not contradicted, since both rows belong to the calls the ADR adds.
  - Failure scenario: someone reads the Stops table to learn every point where `/tutor` halts and does not learn that `/tutor --page` is refused or that `/tutor explain` with no concept waits for one.
  - Verdict: none. The brief asked for the four rows, so this goes to the orchestrator as a change to the brief's text.
- Standards 2, `skills/explain/tutor/references/glossary-format.md:1,3` and `references/learning-record-format.md:41` against `SKILL.md:97-101,141`. This is the builder's second hand-back, judged here.
  - The quoted hunks: "`GLOSSARY.md` is the canonical language for this teaching workspace. All explainers, exercises, and learning records should adhere to its terminology." and "- Anything already captured tersely in [[GLOSSARY.md]] as a term definition. Don't duplicate." Against them: "9. Write the reference documents of the lesson, as HTML files in `reference/`" with "   - Write a glossary in the format of `references/glossary-format.md`.", and "**`reference/*.html`.** ... glossaries".
  - What is wrong: two shipped pages name a file `GLOSSARY.md` that the skill never writes, while the skill writes the glossary as an HTML reference document (change-standard rule 19, no two statements that contradict each other). The source has the same clash, but it lay dormant there, because the source's `SKILL.md` never links `GLOSSARY-FORMAT.md` (docs-teach.md, "Prerequisites", issue #559). The copy's new link from "Teaching" item 9 (brief item 1 and decision 5) makes the clash reach the agent, and brief item 2 forbids rewording the pages. Both readings come from the brief.
  - My judgment: no choice keeps both source texts true. The source's `SKILL.md` puts glossaries in `reference/*.html`, and its format pages name `GLOSSARY.md` as a Markdown file linked like `MISSION.md`. The builder's option 1, `reference/GLOSSARY.md` in the format page's structure, keeps the most text true: both format pages and the skill's "glossaries in `reference/`". Only the `*.html` pattern then becomes false. Option 2, leaving the pages as built, is the cheaper one and leaves the clash in place. Any option needs a line in ADR 0048 or a ruling, since the ADR keeps the workspace files and format pages as the source's.
  - Failure scenario: an agent writes the glossary as `reference/glossary.html`. In a later session it writes a learning record, looks for `[[GLOSSARY.md]]` to avoid duplicating terms, finds no such file and records a term the glossary already defines. Another agent might instead write `GLOSSARY.md` at the root, outside the workspace files the skill lists.
  - Verdict: none. The brief asked for both halves, so this is raised to the orchestrator and the user.
- Standards 3, `skills/explain/tutor/SKILL.md:72-73` and `:153-154`:
  - The quoted hunks: "   - Keep the knowledge free of difficulty, which eats the working memory the user needs for understanding." and "   - Make the practice of the skill effortful, since effortful retrieval builds storage strength." against "- **Knowledge.** Captured from high-quality, high-trust resources, and acquired best without difficulty." and "- **Skills.** ... and made durable and flexible by difficulty, which is the tool here."
  - What is wrong: the rule on where difficulty belongs is written in two sections. This breaks `docs/dev/skill-layout.md`, "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in"), and "Writing for an agent" ("One meaning has one place").
  - Failure scenario: a later edit changes one copy, and the reader can no longer tell which one holds.
  - Verdict: none.
- Standards 4, `skills/explain/tutor/SKILL.md:119-121`:
  - The quoted hunk: "5. In a teaching workspace, offer a learning record ... only on the user's yes." with "   - Done when the user has answered, and after a yes the record stands in `learning-records/`."
  - What is wrong: the completion criterion covers only the case where the offer is made. It has no branch for a folder that is not a teaching workspace, or for a user who has not yet shown understanding. Item 4 beside it does have such a branch ("or the call holds no `--page`"). This breaks `docs/dev/skill-layout.md`, "Writing for an agent": each item of Steps ends on its completion criterion.
  - Failure scenario: an agent running `/tutor explain` in a code repository reaches item 5 and finds no state that ends the step, so it may offer a learning record outside a workspace.
  - Verdict: none. Case "/tutor explain in a code repository" is still met by reading, since the item's first words limit it to a workspace.

## 4. Behaviour

- none. The report states each change a user sees, with its before and after: the README group sentence, the loop and the count, the new tutor row, the pipeline.svg note, the four glossary entries, the move of the installed `wait-what`, and the new `/tutor` calls.

## Declined to judge

- How `/tutor` behaves at run time (a mission written from an interview, a lesson and a reference sheet written, the next lesson chosen from the learning records, the explain mode and its page): a read cannot settle it. Step 6 runs the installed skill for that.
- A real `utils/pin.sh <tag>` relinking `wait-what` from `skills/explain/`: it was not run, since it changes the installation. `pin.test.sh` passes, and the head comment of `pin.sh` reads any `skills/<group>/<name>`.
- Whether landing will collide with the report, which stands untracked both in the worktree (`.scratch/.../agents/reviews/5-report.md`) and in the main checkout, the two files identical by `cmp`. `git status --short` shows it untracked rather than ignored in the worktree, so `land.sh`'s wip commit may include it and the cherry-pick may meet the untracked copy on main. This is the landing's mechanics, and checking it needs `git check-ignore -v` and the land script's own run, neither of which is among the three git commands allowed.
- The skill-layout sentence that sends a new term to `plan-terms.md` first. It was not raised: brief item 9 names "Ordo's own terms", and other skills' terms such as **funder config** stand there.
- "feedback loop" against the glossary term **loop**: not raised as a finding. It is a compound noun from the source with a different referent, and the builder lists it as a judgment call. Whether it needs its own glossary sense is the orchestrator's reading.

Reviewer usage: aadec4c5e8a7aae13, claude-opus-5-5, 175234 tokens, 32 tool uses, 6 min 54 s.
