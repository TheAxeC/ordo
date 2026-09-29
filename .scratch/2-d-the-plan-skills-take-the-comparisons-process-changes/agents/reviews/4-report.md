# Report: step 4, the roadmap and plan checks

Everything in the brief is done.

## Open items of the state file, verbatim

From `sed -n '/^## Open items/,/^## Closed/p'` over the state file in the main checkout (the same text as the worktree's copy; `diff` of the two extracts printed nothing):

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- B (2026-09-29, step 3): whether the brief's list of inputs a step implies but never states covers product code as well as scripts. Your ruling row 4 says "for a step that builds a script", and step 3 landed with that wording in `skills/spec/templates/brief.md`, "Cases", and `skills/spec/SKILL.md`, Steps 4. The brief template serves every repository `/repo-setup` sets up, and its own "Cases" paragraph already speaks of "a code step (a script, or a product's code)". Options: (a) keep "a step that builds or changes a script"; pro: exactly your ruling, and briefs for product code stay shorter; con: in a product repository a step that changes a parser or an API handler gets no list of the inputs it implies, which is where a missed empty value or malformed line costs most. (b) widen to "a code step (a script, or a product's code)", the two lines changed on main; pro: the same protection for product code, and one wording with the template's paragraph; con: longer briefs in product repositories, and each listed input becomes a case the reviewer expects a test for. Recommendation: (b), because the reason for the rule (a wrong answer on an unstated input costs something) holds for product code as much as for scripts, and the cost condition already keeps the list short. (a) is the cheaper option, since nothing changes; (b) is recommended for the coverage, not the cost.

## Closed items (the log of what was raised and how it ended; no report carries it)
```

## First run, on the unchanged tree (worktree at 77aa788, clean per `git status`)

Premises of "What is on the tree", rerun:

- `grep -n -i 'without the goal' skills/roadmap/SKILL.md skills/plan/SKILL.md` printed nothing, exit 1.
- `grep -n '^# ' skills/roadmap/templates/roadmap.md` printed `1:# Roadmap`, `7:# Open, in execution order`, `19:# Done`, `23:# Dropped`.
- `grep -rn -i 'not yet specified' skills docs README.md utils` printed only `docs/roadmap.md:22` (entry 2.D's goal), no skill text.
- Versions read 1.1.2 (roadmap) and 1.9.0 (plan); `skills/repo-setup/SKILL.md:112` installs `docs/roadmap.md` from the `roadmap` skill's `templates/roadmap.md`.

All hold.

| Case | Reading on the unchanged tree |
|---|---|
| 1. Entry 7 under "Not yet specified", `/plan 7` | The template has no such section, so the scratch roadmap (below, `roadmap-case1.md`) was built by inserting it before "# Done". Old `skills/plan/SKILL.md` "What it reads" 2 matches `7` against the entries by number and finds `## 7. Referee replies`; nothing refuses by section, so `/plan` goes on to Steps 1 and 2 and drafts a plan, with no gate to copy. As the brief expects before. |
| 2. Entry 7 in the open order with a gate, `/plan 7` | Matches and goes on to Steps 2, as on the new tree. |
| 3. Gate "`docs/dev/blind-comparison.md` exists" for "one blind-comparison protocol page, as ruled" | Old "Steps / add" 2 accepts "an observable result someone can check", and a file existing is one; nothing asks whether the gate could pass without the goal. Old `/plan` Steps 2 copies the gate and drafts a step whose check could be the same file test. The reader is not led to answer yes or to redraft. |
| 4. The length command | `647 skills/roadmap/SKILL.md`, `386 skills/plan/SKILL.md` (full output: 726 land, 632 ordo-init, 386 plan-help, 788 plan-orchestration, 616 plan-retro, 386 plan, 951 refute, 630 repo-setup, 647 roadmap, 999 spec). |

No case showed a rule of the brief wrong.

## The cases on the changed tree

| Case | Result by reading the new text | Verdict |
|---|---|---|
| 1 | New `skills/plan/SKILL.md` "What it reads" 2: `7` matches `## 7. Referee replies`, which stands under the roadmap's "Not yet specified" section, so it is a refusal that names `/roadmap add 7` ("Stops", row "Not yet specified", which shows the entry, what must be known ("which journals' reply formats") and `/roadmap add 7`). No step runs. | met |
| 2 | The entry stands under "Open, in execution order"; the refusal names the section only, so `/plan 7` goes on to Steps 1 and 2 and asks the question of the copied gate. | met |
| 3 | New "Steps / add" 3 asks "could this pass without the goal being reached?" of "`docs/dev/blind-comparison.md` exists": its first example, "a file that exists without saying what the goal asks", fits, so the answer is yes (an empty file or a page without the protocol passes it) and the gate is redrafted. The gate "the page, read by the user, states each of the six ruled points" cannot pass unless the page states the protocol, so the answer is no and Steps / add 3 is done. New `/plan` Steps 2: as a step's check the file test is answered yes and redrafted; as the gate copied from the roadmap it is kept as the roadmap has it and shown to the user with the answer and the reason, as Decision 3 of the brief sets. | met |
| 4 | `884 skills/roadmap/SKILL.md`, `477 skills/plan/SKILL.md`, both at most 1,024. | met |

The scratch roadmaps, under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/2d-4/`, built from the changed `skills/roadmap/templates/roadmap.md` by a Python string insertion after each section's comment.

`roadmap-case1-new.md` (cases 1 and 3):

```markdown
# Roadmap

What is open, in the order it is built, what is not yet specified, and what is done. An entry is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`).

The section "Not yet specified" holds work whose gate cannot yet be named, each entry with its goal and what must be known before its gate can be named. `/plan` refuses such an entry until `/roadmap add <entry>` names its gate and places it in the open order.

Status: `[ ]` open, `[~]` in progress, `[x]` done (its gate ran and passed, with the output beside it).

# Open, in execution order

<!-- An entry:

## <n>. <title>

- Status: [ ]
- Goal: <what exists when it is done, in one or two sentences>
- Gate: <the command, the test and what it asserts, or the observable result>
- Waits on: <entry numbers with the reason, or nothing>
-->

# Not yet specified

<!-- An entry:

## <n>. <title>

- Goal: <what exists when it is done, in one or two sentences>
- Must be known: <what must be known before its gate can be named>
-->

## 7. Referee replies

- Goal: A reply to each referee point of a manuscript's review, drafted from the manuscript and the review.
- Must be known: which journals' reply formats

# Done

<!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->

# Dropped

<!-- - <n>. <title>: <the reason> -->
```

`roadmap-case2-new.md` (case 2) is the same file with entry 7 after the open section's comment instead, and the "Not yet specified" section holding only its comment:

```markdown
## 7. Referee replies

- Status: [ ]
- Goal: A reply to each referee point of a manuscript's review, drafted from the manuscript and the review.
- Gate: the reply, read by the user, gives a verdict per referee point (addressed / partly / not / cannot be checked from the manuscript), each with the passage that answers it
- Waits on: nothing
```

## New and changed text, old beside new

### `skills/roadmap/SKILL.md`

Frontmatter. Old:

```
description: "Keep the roadmap, the ordered list of work a plan is opened for: show the open entries in order with what each waits on and which has a plan open, add an entry (goal, gate, what it waits on) in the file's own format and in dependency order, move an entry, mark one done with its gate's output, or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, mark the entry done, drop the entry, reorder the roadmap."
  version: "1.1.2"
```

New:

```
description: "Keep the roadmap, the ordered list of work a plan is opened for: show the open entries in order with what each waits on and which has a plan open, and the entries under Not yet specified apart from them, add an entry (goal, a gate that could not pass without the goal being reached, what it waits on) in the file's own format and in dependency order, put work whose gate cannot yet be named under Not yet specified with what must be known first, name the gate of such an entry, move an entry, mark one done with its gate's output, or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, mark the entry done, drop the entry, reorder the roadmap."
  version: "1.2.0"
```

Quick start. Old:

```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
```

New:

```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one; then the entries not yet specified
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
/roadmap add <entry>                      for an entry under "Not yet specified": drafts its gate and its place in the order, writes it after approval
```

"Steps / Show". Old: items 1 and 2 only. New item added:

```
3. List the entries under "Not yet specified" after the next one, apart from the open order, each with its title and what must be known before its gate can be named; the show is done when every entry of that section is listed.
```

"Steps / add". Old:

```
1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.
2. Draft the gate: the check that proves the entry done, as a command from the verification page, a test named and what it asserts, or an observable result someone can check.
   - A goal whose gate cannot be named is not added.
     - That is a stop ("Stops").
3. Draft what it waits on: the entries (open or done) the work depends on, found from the goal and the entries' text, each with the reason.
   - A dependency the roadmap does not hold is a stop ("Stops").
4. Draft the place: after everything it waits on and before the entries that will depend on it, with that reason written out.
   - When the file's order is foundation first, a new entry never goes ahead of an entry it depends on to reach something sooner.
5. Show the draft with the lines around its place and, for a map, the capability's draft.
```

New:

```
1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.
   - When the argument matches an entry under "Not yet specified" by number or title, the title and the goal are that entry's, and the draft moves it from "Not yet specified" to the place of Steps / add 5 with the gate of Steps / add 2 and 3 and what it waits on, keeping its number.
2. Draft the gate: the check that proves the entry done, as a command from the verification page, a test named and what it asserts, or an observable result someone can check.
   - A goal whose gate cannot be named is a stop ("Stops", row "No gate").
   - An entry the user puts under "Not yet specified" at that stop is drafted there in the form "The format is the file's", bullet "Not yet specified", gives, and goes to Steps / add 6 without Steps / add 3 to 5.
3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason.
   - A gate that could (a file that exists without saying what the goal asks, a command that exits 0 on an empty result, a count with no content behind it) is redrafted and asked again.
   - A goal for which every gate drafted could pass without it is a goal whose gate cannot be named (Steps / add 2).
   - The step is done when the gate's answer is no and its reason is written.
4. Draft what it waits on: the entries (open or done) the work depends on, found from the goal and the entries' text, each with the reason.
   - A dependency the roadmap does not hold is a stop ("Stops").
5. Draft the place: after everything it waits on and before the entries that will depend on it, with that reason written out.
   - When the file's order is foundation first, a new entry never goes ahead of an entry it depends on to reach something sooner.
6. Show the draft with the lines around its place, the gate's answer of Steps / add 3 with its reason and, for a map, the capability's draft.
```

"Steps / move". Old:

```
1. Check the new place against both entries' dependencies.
2. A place ahead of something the entry waits on is a refusal that names it ("Stops").
```

New:

```
1. An entry under "Not yet specified" is a refusal that names `/roadmap add <entry>`, which names its gate and places it ("Stops").
2. Check the new place against both entries' dependencies.
3. A place ahead of something the entry waits on is a refusal that names it ("Stops").
```

"The format is the file's". Old:

```
- **No roadmap.** A repository with none gets `templates/roadmap.md`: the introduction, the legend, and the Open, Done and Dropped sections, with no entries.
```

New:

```
- **Not yet specified.** Work whose gate cannot yet be named sits in the section "Not yet specified", after the open entries and before the done ones, each entry with its title, its goal and what must be known before its gate can be named.
- **No such section yet.** A roadmap without "Not yet specified" gets it, in the file's own heading form, the first time an entry goes there.
- **No roadmap.** A repository with none gets `templates/roadmap.md`: the introduction, the legend, and the Open, Not yet specified, Done and Dropped sections, with no entries.
```

"Stops". Old row:

```
| No gate | The goal's gate cannot be named | What is missing | The user's answer |
```

New row, and one row added after "A place too early":

```
| No gate | The goal's gate cannot be named | What is missing, and the two options: name the gate, or put the entry under "Not yet specified" with what must be known before its gate can be named | The user's gate, or the user's approval of the entry under "Not yet specified" |
| Not yet specified | `move` of an entry under "Not yet specified" | The entry and `/roadmap add <entry>` | `/roadmap add <entry>` |
```

The table's closing lines ("The first five rows are stops", "The rest are refusals") still hold: rows 1 to 5 are the change, no gate, the level, the insertion form and a missing dependency, and the new row is a refusal placed among the refusals.

"Rules". Old:

```
- Entry text states the goal, the gate and the dependencies.
- Every entry this skill writes has a goal and a gate, since `/plan <entry>` matches `<entry>` against the entries by number or title and copies the entry's goal and gate into the plan.
```

New:

```
- Entry text states the goal, the gate and the dependencies, except that an entry under "Not yet specified" states the goal and what must be known, as the next rule says.
- Every entry this skill writes has a goal and a gate, since `/plan <entry>` matches `<entry>` against the entries by number or title and copies the entry's goal and gate into the plan; an entry under "Not yet specified" has a goal and what must be known before its gate can be named in place of a gate, and `/plan` refuses it.
```

### `skills/roadmap/templates/roadmap.md`

Old introduction (line 3):

```
What is open, in the order it is built, and what is done. An entry is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`).
```

New introduction (lines 3 and 5):

```
What is open, in the order it is built, what is not yet specified, and what is done. An entry is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`).

The section "Not yet specified" holds work whose gate cannot yet be named, each entry with its goal and what must be known before its gate can be named. `/plan` refuses such an entry until `/roadmap add <entry>` names its gate and places it in the open order.
```

New section, between "# Open, in execution order" and "# Done" (old: none):

```
# Not yet specified

<!-- An entry:

## <n>. <title>

- Goal: <what exists when it is done, in one or two sentences>
- Must be known: <what must be known before its gate can be named>
-->
```

### `skills/plan/SKILL.md`

Frontmatter. Old:

```
description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, each approved step tagged (approved), and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
  version: "1.9.0"
```

New:

```
description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, each approved step tagged (approved), and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
  version: "1.10.0"
```

"What it reads" 2. Old:

```
   - `<entry>` is matched against the entries by number or title.
     - No match is a stop ("Stops").
```

New:

```
   - `<entry>` is matched against the entries by number or title.
     - No match is a stop ("Stops").
     - An entry that stands under the roadmap's "Not yet specified" section is a refusal that names `/roadmap add <entry>`, which names its gate ("Stops").
```

Steps 2 and 3. Old:

```
   - The entry's goal and its gate are copied in.
   - The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.
...
3. Show the draft to the user.
```

New:

```
   - The entry's goal and its gate are copied in.
   - The session asks of the copied gate "could this pass without the goal being reached?" and writes the answer with its reason.
   - A copied gate that could pass without the goal is kept as the roadmap has it, and its answer and reason go to the user at Steps 3, since the gate is the roadmap's and the user's.
   - The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.
   - The session asks the same question of each step's check, the goal being what that step delivers, and writes the answer with its reason.
   - A step's check that could pass without the goal (such as the forms the `roadmap` skill's "Steps / add" 3 names) is redrafted and asked again before the draft is shown.
...
3. Show the draft to the user, with the answer and its reason for the gate and for each step's check (Steps 2).
```

"Stops". Old row:

```
| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check | The user's approval or correction |
```

New row, and one row added after "No such entry":

```
| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, with the answer to "could this pass without the goal being reached?" and its reason for the gate and for each check | The user's approval or correction |
| Not yet specified | `<entry>` stands under the roadmap's "Not yet specified" section, so it has no gate to draft steps from | A refusal that names the entry, what must be known before its gate can be named, and `/roadmap add <entry>` | `/roadmap add <entry>`, then `/plan` again |
```

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. `/roadmap add` asks the question of the gate, the draft states the answer with its reason, a gate that could is redrafted until no | DONE | "Steps / add" 3 and 6 as quoted above; case 3 |
| 2. "Not yet specified" in `skills/roadmap/SKILL.md`: add at the "No gate" stop, the row showing both options | DONE | "Steps / add" 2, "Stops" row "No gate" |
| 2. An entry leaves the section through `/roadmap add <entry>` with the gate (item 1's question), its place and what it waits on | DONE | "Steps / add" 1, Quick start line |
| 2. "Steps / Show" lists the section apart from the open order with what must be known | DONE | "Steps / Show" 3 |
| 2. A roadmap without the section gets it in its own heading form; "No roadmap" names it | DONE | "The format is the file's", bullets "No such section yet" and "No roadmap" |
| 2. The Rules bullet on goal and gate | DONE | "Rules", second bullet as quoted |
| 2. Version 1.2.0, description names the section, at most 1,024 | DONE | `version: "1.2.0"`; length command `884 skills/roadmap/SKILL.md` |
| 3. Template section between the open order and "Done", with the entry form, and the introduction naming it | DONE | `grep -n '^# ' skills/roadmap/templates/roadmap.md` prints `1:# Roadmap`, `9:# Open, in execution order`, `21:# Not yet specified`, `31:# Done`, `35:# Dropped` |
| 4. `/plan` refuses an entry under "Not yet specified", naming `/roadmap add <entry>` | DONE | "What it reads" 2, "Stops" row "Not yet specified"; case 1, and case 2 as its control |
| 4. Steps 2 asks the question of the gate and of each step's check; Steps 3 shows each answer and reason; a check is redrafted, a copied gate shown to the user | DONE | Steps 2 and 3, "Stops" row "The drafted step list"; case 3 |
| 4. Version 1.10.0, description at most 1,024 | DONE | `version: "1.10.0"`; length command `477 skills/plan/SKILL.md` |
| Verify 1 | DONE | output below |
| Verify 2 | DONE | output below |
| Verify 3 | DONE | output below |

Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md; echo "exit $?"` from the worktree root, run after this report was written:

```
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
exit 0
```

This checks the scripts' tests and ASCII over the tree; the step changes no script, and whether the new skill text is right is judged by reading (the cases above).

Verify 2, the length command, whole:

```
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
```

Verify 3, `LC_ALL=C grep -n '[^ -~]' skills/roadmap/SKILL.md skills/roadmap/templates/roadmap.md skills/plan/SKILL.md; echo "exit $?"`: nothing printed, `exit 1`.

No test is added or changed: the step changes skill text only, which change-standard rule 1 has fixed by reading, with the text before and after quoted above.

## Files and line counts

`wc -l` on copies of the files taken before the change and on the files after; `git diff --stat` prints `3 files changed, 48 insertions(+), 19 deletions(-)`.

| File | Before | After |
|---|---|---|
| `skills/roadmap/SKILL.md` | 144 | 155 |
| `skills/roadmap/templates/roadmap.md` | 25 | 37 |
| `skills/plan/SKILL.md` | 89 | 95 |
| `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/4-report.md` | none | this file |

## Judgment calls

- `/roadmap move` of an entry under "Not yet specified" is a refusal naming `/roadmap add <entry>` ("Steps / move" 1, "Stops" row "Not yet specified"). It serves item 2's "leaves it when its gate is named" and the Rules bullet: without it, `move` could put an entry with no gate into the open order, which the Rules bullet forbids (change-standard rule 19). The refusal is item 1 of `move`, ahead of the checks, as `docs/dev/skill-layout.md`, "Lists and tables", orders a refusing step.
- For a step's check, "the goal" of the ruled question is read as what that step delivers (`/plan` Steps 2). Read as the entry's goal, every step's check would answer yes, since one step delivers only part of the entry.
- The Quick start carries a line for `/roadmap add <entry>`, since `docs/dev/skill-layout.md` asks for every invocation there; the command vocabulary is unchanged (Decision 1).
- The first Rules bullet ("Entry text states the goal, the gate and the dependencies") takes the exception for "Not yet specified", since it would otherwise contradict the second (change-standard rule 19).
- `skills/plan/SKILL.md`'s description names the question, and `skills/roadmap/SKILL.md`'s names it for the gate; both stay under 1,024.
- The template's field for what must be known is `- Must be known:`.
- An entry leaving "Not yet specified" keeps its number, as "Anti-patterns", row "Renumbering an existing entry", requires of every entry.
- `skills/plan/SKILL.md` names the forms of a gate that could pass without its goal by pointing at the `roadmap` skill's "Steps / add" 3, where they are written once.

Change of meaning asked by the brief (change-standard rule 17): old "A goal whose gate cannot be named is not added. That is a stop" becomes a stop whose second option is the entry under "Not yet specified"; an entry without a gate is still never added to the open order.

## User-visible changes

| Surface | Before | After |
|---|---|---|
| `/roadmap` (Show) | The open entries in order and the next one | The same, then the entries under "Not yet specified", each with what must be known |
| `/roadmap add <goal>` draft | Title, goal, gate, what it waits on, the place | The same, plus the gate's answer to "could this pass without the goal being reached?" with its reason; a gate that could is redrafted |
| `/roadmap add` with no nameable gate | A stop showing what is missing | A stop offering the gate or the entry under "Not yet specified" |
| `/roadmap add <entry>` on an entry under "Not yet specified" | No such form | Drafts its gate, what it waits on and its place, and moves it into the open order |
| `/roadmap move` of an entry under "Not yet specified" | No such section | A refusal naming `/roadmap add <entry>` |
| New roadmap from the template | Open, Done, Dropped | Open, Not yet specified, Done, Dropped |
| `/plan <entry>` on an entry under "Not yet specified" | Matched and drafted | A refusal naming `/roadmap add <entry>` |
| `/plan` drafted step list | Goal, gate, steps, each check | The same, with the answer and its reason for the gate and each check |

## Doc text

Found with `grep -rn -i 'not yet specified\|without the goal\|Done and Dropped\|Open, Done\|Steps / add\|No gate\|goal and a gate\|gate cannot\|roadmap add\|Steps / Show\|open entries\|1\.1\.2\|1\.9\.0' docs skills README.md utils`, then `grep -rn -i 'execution order\|Dropped\|step list is drafted\|drafted step list\|copies the entry\|goal and its gate\|matched against the entries' docs skills README.md utils` and `grep -rn -i roadmap docs`. Hits that stay true (`skills/ordo-init/SKILL.md:23`, `:47`, `skills/repo-setup/SKILL.md:24`, `skills/plan/SKILL.md:24`, the fixture `utils/check_coverage.test.sh:27`, `skills/repo-setup/SKILL.md:5`'s own version 1.1.2) are left out. Each entry below is made incomplete by the change and is not changed by this step.

- `README.md:15`, current: "| `roadmap` | Keeps the roadmap that `/plan` opens entries from. It shows the open entries in order and adds an entry with its goal, gate and place. It moves an entry, marks one done with the gate's output, and drops one. It learns the file's own format, including an ordered build plan over a capability map |". Replacement: "| `roadmap` | Keeps the roadmap that `/plan` opens entries from. It shows the open entries in order and the entries not yet specified. It adds an entry with its goal, a gate that could not pass without the goal being reached, and its place, or puts work whose gate cannot yet be named under "Not yet specified" until its gate is named. It moves an entry, marks one done with the gate's output, and drops one. It learns the file's own format, including an ordered build plan over a capability map |".
- `README.md:16`, current: "| `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, `orchestrator-state.md` |". Replacement: "| `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, `orchestrator-state.md`. It refuses an entry not yet specified |".
- `README.md:29`, current: "/roadmap add <goal>           an entry with its goal, gate and place in the order". Replacement: the same line, followed by "/roadmap add <entry>          for an entry not yet specified: its gate and place in the order, before /plan opens it".
- `skills/plan-help/SKILL.md:50` (in "The sequence, printed verbatim"), current: "/roadmap add <goal>           an entry with its goal, gate and place in the order, for /plan to open". Replacement: the same line, followed by "/roadmap add <entry>          for an entry not yet specified: its gate and place in the order, before /plan can open it".
- `docs/roadmap.md:3` (step 7's), current: "What is open, in the order it is built, and what is done. An entry is one piece of work `/plan` can open: ...". Replacement: the new template's lines 3 and 5 as quoted above, and the section "# Not yet specified" between "# Open, in execution order" and the done section, as step 7 adds it.
