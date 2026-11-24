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

## Repair round 1, refuted

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests

$ printf '%s\0' <the 11 files of the brief's check: README.md docs/figures/gen_figures.py docs/figures/pipeline.svg docs/glossary.md skills/explain/tutor/SKILL.md the 4 references/*.md skills/explain/wait-what/SKILL.md and the ledger report 5-report.md> | xargs -0 perl -CSD -ne '<the brief's character-set check>'; echo "ascii exit $?"
ascii exit 0          (no line printed)

$ python3 -c 'import yaml; d=yaml.safe_load(open("skills/explain/tutor/SKILL.md").read().split("---")[1]); print(d["name"], len(d["description"]), d["metadata"]["version"], d["disable-model-invocation"])'
tutor 754 1.0.0 True

$ grep -rn 'skills/ordo/wait-what' README.md docs skills utils agents
docs/roadmap.md:80:- [x] 18. wait-what and wizard: at the closing on main (0b8e471), `skills/ordo/wait-what/` ... (one hit, in docs/roadmap.md)
$ test ! -e skills/ordo/wait-what; echo "exit $?"
exit 0

$ grep -c 'explain/tutor' README.md        -> 1
$ grep -c 'explain/wait-what' README.md    -> 1
$ grep -n 'twenty-one' README.md           -> (nothing)
$ for s in $(grep -o 'for skill in [^;]*' README.md | head -1 | cut -d' ' -f4-); do test -f skills/$s/SKILL.md || echo "missing $s"; done   -> (no line)

$ diff <(git show a7850f3:skills/ordo/wait-what/SKILL.md) skills/explain/wait-what/SKILL.md; echo "diff exit $?"
diff exit 0

$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

$ diff <source>/<X>-FORMAT.md skills/explain/tutor/references/<x>-format.md   (four pages)
GLOSSARY same, LEARNING-RECORD same, MISSION same, RESOURCES differs (the ../SKILL.md link only, as in the first report)

$ git diff a7850f3 --stat
README.md 7, docs/figures/gen_figures.py 2, docs/figures/pipeline.svg 4, docs/glossary.md 4, skills/ordo/wait-what/SKILL.md 52 deleted (5 files changed); skills/explain/ is untracked

$ for each path of files.txt: diff -u <snapshot>/<path> <worktree>/<path>
README.md, docs/figures/gen_figures.py, docs/figures/pipeline.svg, docs/glossary.md, the four references/*.md, skills/explain/wait-what/SKILL.md: no difference.
skills/explain/tutor/SKILL.md: the one delta of the round (hunks quoted below).

$ wc -l skills/explain/tutor/SKILL.md
198
```

The delta holds only `skills/explain/tutor/SKILL.md`; no path outside `files.txt` changed besides the ledger report and the round's brief. Every change in that file is one of the eight rulings, or one of the sentence-level changes the report lists under "The sentence-by-sentence read". I judged each of those against the source and found none that reaches beyond its sentence.

### Verdicts

Items of the brief's "What to build" (item 1's Stops count is six by the round's ruling 5), for the whole diff since a7850f3:

- 1: violated, Spec 1. The six Stops rows, the calls, the frontmatter and the lesson and reference-document bullets of rulings 1 and 2 hold. Two source instructions are still changed or added without a row.
- 2: holds. Three pages are identical to the source; the fourth differs in the `../SKILL.md` link path only.
- 3: holds. "Explaining" items 1 to 5 match ADR 0048's explain point. Item 5's criterion now has the no-workspace branch.
- 4: holds. "The call" items 1 and 2 and "The page" items 1 to 4 are unchanged and read as before.
- 5: holds. `test ! -e skills/ordo/wait-what` exits 0 and the diff against the base copy prints nothing.
- 6: holds. README names five group folders, `explain/wait-what` and `explain/tutor` in the loop, twenty-two skills on both lines, and the loop command prints no line.
- 7: violated, Spec 1 and Spec 2. "Deviations" has rows for the three round rulings (3, 4, 5) and the sentence changes the report lists, but the differences named in Spec 1 have none, and the two ASCII rows do not show their characters.
- 8: holds. The grep above prints only the roadmap hit, and no delta touches README or the figures.
- 9: holds. The sync check prints ok, and the four glossary entries are unchanged by the round.

Cases of the brief's "Cases":

- Each heading, frontmatter key and format page of the source, found in "Deviations": partial, Spec 1 and Spec 2.
- `/tutor <topic>` in an empty folder, in a workspace whose mission the request would change, and `/tutor explain <concept>` in a code repository: met by reading, as in the first report. Item 1 of "Teaching" now reads three files, and item 2 still opens with the interview.
- `/tutor explain <concept>` in a teaching workspace: met by reading. Item 5 now ends on a criterion that holds with and without an offer.
- `--page` in a workspace, `--page` elsewhere with no path, `--page` with a file standing at the path, the `a/b ../c` name: met by reading, since "The page" is unchanged.
- The model deciding by itself that a lesson is due: met, verify 3 prints `True`.
- `grep -rn 'skills/ordo/wait-what' ...`: met, one hit in `docs/roadmap.md`.
- `/tutor` with no topic in a workspace with learning records: met by reading; "Teaching" item 1 reads the learning records and item 5 chooses from them.
- `/tutor explain` with no concept, and `/tutor --page` without `explain`: met by reading, and each is now a Stops row that "The call" items 1 and 2 name.
- The install-loop command and the `wait-what` diff: met, both print nothing.

### Findings

Closures of the eight rulings, checked and holding: ruling 1 (`SKILL.md:90` "It is beautiful, with clean, readable typography and layout in the manner of Edward Tufte, since the user returns to the lessons later to review." and `:104` "Glossaries, in particular, are an essential reference."); ruling 2 (`:51-54`); ruling 3 (row "If possible, open the lesson file ..." in "Deviations" names the layout's completion-criterion rule); ruling 5 (six rows at `:174-179`, named from `:42` and `:44`); ruling 6 (`:125`); rulings 7 and 8 (no delta in the two sections or the two format pages; open item D stands in `orchestrator-state.md`). Ruling 4 is closed in form only, see Spec 2. Findings, by heading:

**1. Spec**

- Spec 1, `skills/explain/tutor/SKILL.md:67`, `:194`, `:115` and "Deviations": "In the zone of proximal development the user feels challenged "just enough" in each lesson." and "The model's own knowledge is untrusted: every lesson and every explanation draws its knowledge from high-quality, high-trust resources." and "Fetch sources on the concept in this run: high-quality, high-trust resources, and in a teaching workspace the resources of `RESOURCES.md` first."; what is wrong: the source says "Each lesson, the user should always feel as if they are being challenged 'just enough'" (an instruction with "always"), and "Never trust your parametric knowledge" (a prohibition that names the term "parametric knowledge"). The copy turns the first into a description without "always" and the second into a statement about "the model's own knowledge", and extends it to explanations. "RESOURCES.md first" in the explain mode is behaviour that no ADR 0048 point and no brief item states. None of the three has a row in "Deviations" (the only mention of the second is the Anti-patterns bullet's quote of "Never trust your parametric knowledge"), and the round's closing sentence says every other sentence of the source stands with its meaning. The brief asks that every difference have a row or be put back as the source has it; failure scenario: a user who checks "Deviations" against the public source for the gate reads "nothing else differs" and finds these three differences; an agent drafting a lesson is no longer told that the user must always feel challenged "just enough", and an agent in the explain mode reads `RESOURCES.md` before searching, which the ADR does not ask for; verdict: item 1 violated, item 7 violated, and the case "Each heading ..." partial.
- Spec 2, the two ASCII rows of "Deviations" in `agents/reviews/5-report.md`: "the range in `GLOSSARY-FORMAT.md`, "A 1{range}10 self-rating", written with a non-ASCII range character in the public source" and "the braces' content in `MISSION-FORMAT.md`, "{...}" under "Success looks like", written with an ellipsis character in the public source"; what is wrong: ruling 4 asks for a row for each of the two characters. The rows exist, but the first quotes the range as the placeholder `{range}`, so the row shows neither the source's character nor the copy's, and the second does not say what the three dots replace. The row for the format pages above them still says "words unchanged", which these two rows contradict. The brief's character check rule (the report names such a character in angle brackets) is not applied to the characters themselves; failure scenario: the user, who does the gate check against the public pages, cannot tell from the row which character differs and finds the "words unchanged" row false for two pages; verdict: item 7 violated (with Spec 1).

**2. Proof**

- `agents/reviews/5-report.md`, "Repair round 1 / The sentence-by-sentence read": "'Teaching Workspace': the sentence "The state of their learning is captured in this directory in several files" now opens "The teaching workspace"."; what is wrong: the sentence now reads (`SKILL.md:143`) "The state of the user's learning is captured in these files of the folder:". It does not open with "The teaching workspace", so the report's account of that change does not reproduce. The change itself (an added lead-in to the list) has no row in "Deviations" either. The report's closing claim "Every other sentence of the source stands in `tutor` with its meaning" also does not reproduce, as Spec 1 shows; failure scenario: the orchestrator, who reads the diff against the report's list to decide the delta is within the rulings, takes the reworded sentence as the one the report describes, and takes the sentence-by-sentence read as complete; verdict: none (supports item 7).

**3. Standards**

- `skills/explain/tutor/SKILL.md:64`: "4. Read `RESOURCES.md`, and while it is not well populated, make it the focus to find high-quality, high-trust resources that help the user acquire knowledge, and record them there in the format of `references/resources-format.md`."; what is wrong: `docs/dev/skill-layout.md`, "Sections, in order" row 5 ("one action per item") and the prose standard, section E (cold opens, a pronoun that has no clear antecedent). The item holds three actions (read, find, record), and "make it the focus" reads as making `RESOURCES.md` the focus, where the source's focus is on finding resources; failure scenario: an agent reads "make it the focus" as treating the file as the thing to work on, and either skips the search for resources when the file is empty or spends the run on editing the file; verdict: none.

**4. Behaviour**

- none. The round changes the wording of a skill the user has not yet run and adds two stop rows and a no-workspace branch that "Deviations" and the report state; no host-visible change is unstated.

### Declined to judge

- Whether the public source has a non-ASCII range character in the glossary format page and an ellipsis character in the mission format page: the brief states it as a premise and fetching the public repository is barred; the ledger copies are ASCII, and `diff` shows the two copies match them.
- How `/tutor` behaves at run time (a mission interview, a lesson written, the explain mode's offer and page): a read cannot settle it; step 6 runs the installed skill.
- Whether landing collides with the report and the round's brief, which `git status --short` shows as untracked in the worktree's `.scratch/`, and with the same files in the main checkout: `git check-ignore -v` and the land script's own run would settle it, and neither is a git command allowed here.
- A real `utils/pin.sh <tag>` relinking of `wait-what` from `skills/explain/`: it would change the installation; `pin.test.sh` passes.
- Rulings 7 and 8 (the `GLOSSARY.md` clash raised as open item D, and the rule on difficulty in two sections): left unchanged on purpose by the round's brief; not re-judged.
- The sentence-length rule of the prose standard (under about 20 words) over the new bullets: the long bullets are the first report's verify 7 point, and the delta adds none over about 45 words.

Reviewer usage: ad09d6adfa6f4853c, claude-sonnet-5-5, 145111 tokens, 15 tool uses, 3 min 15 s.

## Closed

- Spec 1, Spec 2, Spec 3, Standards 1 and Standards 4 of the first run: closed in round 1, in the report's section "Repair round 1".
- Standards 2 of the first run, the format pages that name `GLOSSARY.md`: raised to the user as open item D of the state file.
- Standards 3 of the first run, the rule on difficulty in two sections: left as built, since the source states it in both and the copy keeps the source's text.
- Spec 1 of the run over round 1: fixed at landing. "Teaching" item 5 says "In each lesson the user always feels challenged \"just enough\"."; the Rules bullet opens "Never trust the model's parametric knowledge" and has a row in `deviations.md` for its reach to explanations; the words on `RESOURCES.md` first are taken out of "Explaining" item 2.
- Spec 2 and Proof 1 of the run over round 1: fixed at landing in `deviations.md`: the two ASCII rows name the source's character in angle brackets and the copy's, the format pages' row names the three rows that differ, and the first line of "The teaching workspace" has a row.
- Standards 1 of the run over round 1: fixed at landing. "Teaching" item 4 opens "While `RESOURCES.md` is not well populated, focus on finding".
