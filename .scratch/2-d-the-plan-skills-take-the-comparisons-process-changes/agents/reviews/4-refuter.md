# Step 4 refuter report (on .agents/worktrees/2d-4, base 77aa78803f98d7d017c22fd10f022357e2529b1c)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md; echo "exit $?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 7 commands passed
exit 0

$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
630 skills/repo-setup/SKILL.md
884 skills/roadmap/SKILL.md
999 skills/spec/SKILL.md

$ LC_ALL=C grep -n '[^ -~]' skills/plan/SKILL.md skills/roadmap/SKILL.md skills/roadmap/templates/roadmap.md .scratch/.../agents/reviews/4-report.md; echo "grep exit $?"
grep exit 1   (nothing printed)

The report's evidence, rerun:
$ (base lengths) git show 77aa788:<f> | python3 ... for roadmap, plan
647
386
$ git grep -n -i 'not yet specified' 77aa788 -- skills docs README.md utils
77aa788:docs/roadmap.md:22:- Goal: The existing skills carry ... (only hit)
$ git grep -n -i 'without the goal' 77aa788 -- skills/roadmap/SKILL.md skills/plan/SKILL.md; echo "exit $?"
exit 1
$ git show 77aa788:skills/roadmap/templates/roadmap.md | grep -n '^# '
1:# Roadmap / 7:# Open, in execution order / 19:# Done / 23:# Dropped
$ grep -n '^# ' skills/roadmap/templates/roadmap.md
1:# Roadmap / 9:# Open, in execution order / 21:# Not yet specified / 31:# Done / 35:# Dropped
$ git diff 77aa788 --stat | tail -1
 3 files changed, 48 insertions(+), 19 deletions(-)
$ wc -l (base via git show, then worktree)
144, 25, 89  ->  155 skills/roadmap/SKILL.md, 37 skills/roadmap/templates/roadmap.md, 95 skills/plan/SKILL.md
$ git status --short
 M skills/plan/SKILL.md
 M skills/roadmap/SKILL.md
 M skills/roadmap/templates/roadmap.md
?? .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/4-report.md
```

Every count, path and heading the builder's report quotes reproduced. The cases' scratch roadmaps were rebuilt by the reviewer from the changed template under `$TMPDIR`'s scratchpad (`refute-2d-4/case1.md`: entry `## 7. Referee replies` with its Goal and `- Must be known: which journals' reply formats` at line 31, under `# Not yet specified` at line 21, before `# Done` at line 36; `refute-2d-4/case2.md`: the same entry with Status, Goal, Gate and Waits on at line 21, under `# Open, in execution order` at line 9, and `# Not yet specified` at line 28 holding only its comment).

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `skills/roadmap/SKILL.md` "Steps / add" 3 asks the ruled question word for word, lists the three forms of a gate that could pass, redrafts and asks again, and ends on "the step is done when the gate's answer is no and its reason is written"; "Steps / add" 6 shows the answer with its reason. See Standards 3 on where "write the answer" puts it.
- 2: holds. "Steps / add" 2 and the "No gate" row give both options; "Steps / add" 1's sub-bullet takes an entry out of the section through `/roadmap add <entry>` with the gate of add 2 and 3, the place and what it waits on; "Steps / Show" 3 lists the section apart from the open order with what must be known; "The format is the file's" has "Not yet specified", "No such section yet" and "No roadmap" naming the section; the Rules bullet says it; version 1.2.0; description names the section at 884. See Spec 1 (the added `move` refusal leaves the anchor side open), Standards 2 (triggers) and Standards 4 (readability).
- 3: holds. `# Not yet specified` sits between the open section and `# Done` with a comment giving title, goal and "Must be known", and a new introduction paragraph names what it holds. See Standards 1 (the old introduction sentence now contradicts it).
- 4: holds. "What it reads" 2 and the Stops row "Not yet specified" refuse and name `/roadmap add <entry>`; Steps 2 asks the question of the copied gate and of each step's check, redrafts a check, and keeps a copied gate while showing its answer to the user (brief decision 3); Steps 3 and the "The drafted step list" row show each answer; version 1.10.0; description 477. See Standards 3.

Cases of the brief's "Cases":

- Scratch roadmap with "7. Referee replies" under "Not yet specified", `/plan 7`: met. Read against `case1.md`, "What it reads" 2 matches `7` to `## 7. Referee replies`, which stands under `# Not yet specified`, so it is a refusal that names `/roadmap add 7`, and the Stops row shows the entry, "which journals' reply formats" and `/roadmap add 7`. On the base text nothing refused by section (base "What it reads" 2 has only "No match is a stop"), as the report's first run says.
- The same entry under "Open, in execution order" with a gate, `/plan 7`: met. Read against `case2.md`, the refusal names only the section; the entry matches and `/plan` goes to Steps 1 and 2.
- Gate "`docs/dev/blind-comparison.md` exists" for "one blind-comparison protocol page, as ruled": met. "Steps / add" 3's first form, "a file that exists without saying what the goal asks", leads to yes and a redraft; "the page, read by the user, states each of the six ruled points" leads to no. In `/plan` Steps 2 the same gate as a step's check is redrafted (through the pointer to "Steps / add" 3), and as a copied gate it is kept and shown to the user with the answer and reason, which is brief decision 3.
- The length command at most 1,024 for roadmap and plan: met, 884 and 477 (base 647 and 386, reproduced).

## 1. Spec

- 1. `skills/roadmap/SKILL.md`, "Steps / move" 1 and the Stops row "Not yet specified": "1. An entry under "Not yet specified" is a refusal that names `/roadmap add <entry>`, which names its gate and places it ("Stops")."; what is wrong: the builder added this refusal under item 2 (judgment call, change-standard rule 20), and it serves item 2 and the Rules bullet, but it guards only the entry being moved. The anchor of `move <entry> before|after <entry>` can be an entry under "Not yet specified", and "Steps / move" 2 checks only both entries' dependencies, which an entry with no "Waits on" never fails; failure scenario: a roadmap with open entries 1 to 6 and "7. Referee replies" under "Not yet specified"; `/roadmap move 4 before 7` passes "Steps / move" 1 to 3 and drafts entry 4, with its Status and Gate, inside the "Not yet specified" section; after approval `/plan 4` refuses it and `/roadmap` Show lists it apart from the open order with no "what must be known"; verdict: none (item 2's own bullets hold).

## 2. Proof

none

## 3. Standards

- 1. `skills/roadmap/templates/roadmap.md`, introduction: "An entry is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on." beside the new "The section "Not yet specified" holds work whose gate cannot yet be named ... `/plan` refuses such an entry"; what is wrong: the second sentence still says every entry is work `/plan` can open and has a gate (change-standard rule 19); failure scenario: a user of a repository `/repo-setup` sets up is told each entry has a gate and can be opened by `/plan`, writes a "Not yet specified" entry with a placeholder `- Gate:` line, or is surprised by `/plan`'s refusal; verdict: none (item 3's text is done).
- 2. `skills/roadmap/SKILL.md`, Frontmatter `description`: the description names two new cases (put work under "Not yet specified"; name the gate of such an entry) and `Triggers on:` has no phrase for either (`docs/dev/skill-layout.md`, Frontmatter: at least one phrase for each case); the list's ", and the entries under Not yet specified apart from them, add an entry" puts an "and" before a non-final item, and the unquoted section name reads as prose; failure scenario: a user types "park this idea on the roadmap until we know how to test it" or "name the gate for entry 7"; no trigger phrase matches, and the session edits `docs/roadmap.md` by hand without the "No gate" stop or the question of "Steps / add" 3; verdict: none.
- 3. `skills/roadmap/SKILL.md`, "Steps / add" 3, and `skills/plan/SKILL.md`, Steps 2: "write(s) the answer with its reason"; what is wrong: neither text says where the answer is written; the roadmap entry form has no field for it and `skills/plan/templates/plan.md` has no place for it, while the Stops row puts it in the drafted `plan.md` (`docs/dev/skill-layout.md`, "Writing for an agent": each item of Steps ends on what is true or what exists when it is done); failure scenario: one session writes the answer into the roadmap entry, a field the template does not have; another writes it after a step line of `plan.md`, so the line no longer ends with `(approved)` as `/spec` checks; a third shows it only in chat, so the approved `plan.md` does not record why a check was judged sufficient; verdict: none.
- 4. `skills/roadmap/SKILL.md`, "Steps / add" 1's sub-bullet (56 words, three requirements), "Steps / add" 2's second sub-bullet (43 words, the verb after two quoted labels), Rules bullet 2 (63 words, restating a rule `skills/plan/SKILL.md` states), "Steps / Show" 3 ("after the next one" ambiguous); what is wrong: `docs/dev/skill-layout.md`, "Lists and tables" (two requirements that can each be broken are two bullets) and "Writing for an agent" (one meaning has one place); prose standard E (sentences under roughly 20 words unless the mechanism needs more); failure scenario: an agent reading add 1's sub-bullet renumbers the entry into the insertion form (`3.A`), since "keeping its number" is the last clause of a 56-word sentence; an agent reading Show 3 lists only the "Not yet specified" entries numbered after the next open entry; verdict: none.

## 4. Behaviour

none. The report's "User-visible changes" table states each change with before and after, the `move` refusal included.

## Declined to judge

- Whether ruling row 7's "the goal", for a step's check, means what that step delivers (the builder's reading in `/plan` Steps 2) or the entry's goal. The reviewer judges the builder's reading the workable one, since under the entry-goal reading every step's check answers yes; the user confirming it, or the ruling's source (marianne `docs/validation-patterns-guide.md` line 511, not on this tree), would settle it.
- How a new entry under "Not yet specified" is numbered: neither "Steps / add" 2 nor "The format is the file's" says, while the template gives `## <n>. <title>`; not checked against a roadmap that interleaves numbers such as Ordo's own.
- README lines 15, 16 and 29 and `skills/plan-help/SKILL.md`'s line for `/roadmap add`, made incomplete; the report's "Doc text" lists each with a replacement. No other hit outside the three changed files. `utils/check_coverage.py` matches a roadmap entry by its `## <n>. ` heading and would accept an entry under "Not yet specified"; outside this step's paths.

Reviewer usage: claude:opus, a fresh agent; 126545 tokens, 21 tool uses, 348 s (from the completion notice). Saved by the orchestrator from the reviewer's final message.
