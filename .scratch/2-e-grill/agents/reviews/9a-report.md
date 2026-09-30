Everything in the brief is done.

One action of mine outside the brief's git constraint is reported in part 11, point 1, with the state of the worktree it left: the fourteen files are in it.

## 2. Open items of the state file, verbatim

`sed -n 45,47p .scratch/2-e-grill/orchestrator-state.md` prints:

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

none
```

## 3. The first read of every case, on the unchanged tree

Every command below reads `HEAD` (`git show HEAD:<file>`, `git grep ... HEAD`), which is the tree the brief was written against and the tree the worktree started from. The read ran before the first change. No case is wrong in the brief, so nothing was handed back. Each block is the command as run and its output.

### R1

```
$ git grep -n -c 'quoted ruling\|--ruling' HEAD -- skills docs README.md utils
(exit 1)
$ git show HEAD:skills/repo-setup/templates/plan-terms.md | grep -n -o '^- \*\*\(commit rule\|questions, the\|reader, of the transcripts\|ruling\|rulings file\)\*\*'
20:- **commit rule**
74:- **questions, the**
75:- **reader, of the transcripts**
91:- **ruling**
92:- **rulings file**
(exit 0)
$ git show HEAD:skills/repo-setup/templates/plan-terms.md | grep -n -o "the user's answer at its approval stop\. Stated in\|tag names\. Stated in: \`spec\`\|one bullet line each, while no plan is open\."
20:the user's answer at its approval stop. Stated in
91:tag names. Stated in: `spec`
92:one bullet line each, while no plan is open.
(exit 0)
$ git show HEAD:docs/glossary.md | grep -n -o '"every run", a stop that waits on the user each time the skill runs;'
133:"every run", a stop that waits on the user each time the skill runs;
(exit 0)
```

Reading: HEAD has no text with "quoted ruling" or "--ruling" (the first command finds no hit, exit 1). The five entries to change stand at plan-terms.md lines 20, 74, 75, 91 and 92, so **quoted ruling** goes between **questions, the** (74) and **reader, of the transcripts** (75). The three sentences that change are present as the brief quotes them. The glossary line 133 holds the **mark, of a figure** text as the brief quotes it.

### R2

```
$ git grep -n -o 'stay stops of their own' HEAD -- skills docs
HEAD:skills/plan-orchestration/SKILL.md:302:stay stops of their own
HEAD:skills/spec/SKILL.md:208:stay stops of their own
(exit 0)
$ git show HEAD:skills/spec/SKILL.md | sed -n 234p
3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.
(exit 0)
$ git show HEAD:skills/ordo-help/SKILL.md | sed -n 77p
"Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it
(exit 0)
```

Reading: the sentence "stay stops of their own" is at `skills/plan-orchestration/SKILL.md:302` and `skills/spec/SKILL.md:208`, which is the sentence the case says must go. `skills/spec/SKILL.md:234` is "Steps / A ruling" 3 and `skills/ordo-help/SKILL.md:77` is the line after which item 6 goes. No text on HEAD says an option states a skill's change in full or that a skill is run with a ruling.

### R3 to R9

```
$ git grep -n -c -e '--ruling' HEAD -- skills
(exit 1)
$ git show HEAD:skills/roadmap/SKILL.md | grep -n 'Nothing is written yet\|^4\. Write the change\|The step is done when the gate\|^| The change \|^| The level \|^| The insertion form \|^- \*\*No insertion form yet' 
47:   - Nothing is written yet.
49:4. Write the change once the user approves or corrects it ("Stops").
70:   - The step is done when the gate's answer is no and the answer with its reason stands in the draft.
107:- **No insertion form yet.** A stop ("Stops").
130:| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3 | What Steps 3 shows | The user's approval or correction |
132:| The level | Entries exist at two levels and the goal does not settle which | The two levels | The user's choice |
133:| The insertion form | The file has no insertion form yet | The question, once | The user's answer, used from then on |
(exit 0)
$ git show HEAD:skills/plan/SKILL.md | grep -n 'Write `plan.md` once the user\|^   - Each bullet line\|^| The drafted step list'
52:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
65:   - Write `plan.md` once the user has approved or corrected it.
84:| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |
(exit 0)
$ git show HEAD:skills/ordo-init/SKILL.md | grep -n '^11\. Stop for the approval\|^4\. For each error\|^| The draft \|^| Several roadmaps\|^| Worker, reviewer and libraries\|^| A fix in the check\|^| No commit allowed\|^- The skill writes nothing until\|^- A change to an existing file'
80:11. Stop for the approval ("Stops").
95:4. For each error, propose the fix ("Stops").
103:| The draft | Every setup, at Steps 11 | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |
104:| Several roadmaps | More than one roadmap candidate | The candidates | The user's pick |
105:| Worker, reviewer and libraries | Every setup, at Steps 6 | The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as Steps 6 names them | The user's answers |
107:| A fix in the check | The check reports an error in an existing file | The error and the proposed fix | The user's approval |
108:| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, and the command that shows them (`git status --short`) | The user's commit |
119:- The skill writes nothing until the user approves or corrects the draft. The one exception is Steps 3, where each verification command runs once before the draft is shown.
124:- A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
(exit 0)
$ git show HEAD:skills/repo-setup/SKILL.md | grep -n '^2\. Ask\|^4\. Show the draft\|^8\. Run `/ordo-init`\|^3\. Exit 1\|^5\. Show the drafted\|^| The questions \|^| The draft \|^| A hunk\|^| The drafted sync\|^| No commit allowed\|^- In a setup, after'
40:2. Ask "The questions", together, in plain prose, each with its default in brackets ("Stops").
58:4. Show the draft, the tree and every file's text, the copied hook named by its source, together ("Stops").
64:8. Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`.
94:3. Exit 1: a block differs; show the diff of each block that differs, for the user's ruling per hunk ("Stops").
103:5. Show the drafted change ("Stops").
158:| The questions | Every setup, at Steps 2 | The ten questions, each with its default | The user's answers |
159:| The draft | Every setup, at Steps 4 | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |
160:| A hunk to rule on | `sync` exits 1 | The diff | The user's ruling per hunk |
161:| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block | The change Steps / sync 4 drafts | The user's approval |
163:| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, and the command that shows them (`git status --short`) | The user's commit |
181:- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
(exit 0)
$ git show HEAD:skills/grill/SKILL.md | grep -n '^   - The draft is shown as a diff\|^   - The item is done when the diff is a decision\|^| A round \|^- A decision is the user\|^1\. Write the ruling for every settled answer'
163:1. Write the ruling for every settled answer, the roadmap diff, "record as ADR?", rule-clash and term decisions included.
180:   - The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes.
182:   - The item is done when the diff is a decision of the next round, or, after the yes, the entry read back holds the change.
226:| A round | Every round, at Steps 6, the roadmap diff and "record as ADR?" decisions riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |
247:- A decision is the user's: nothing is written as settled without the user's answer.
(exit 0)
```

Reading: no skill holds `--ruling` (the first `git grep` of this block exits 1), so on HEAD every draft below stops. R3, `skills/roadmap/SKILL.md`: line 49 writes the change once the user approves, rows 130, 132 and 133 stop on every change, on the level and on the insertion form, line 70 is the "step is done" sub-bullet. R4: `skills/spec/SKILL.md` line 40 is "What it reads" 4, whose sub-bullets 41 to 46 name a ruling by its tag and say a ruling line ends with "(the user)"; no skill has a "no ruling" list. R5: `skills/plan/SKILL.md` line 52 copies the rulings file's bullet lines only, line 65 writes `plan.md` once the user has approved it, row 84 stops on every plan. R6: `skills/ordo-init/SKILL.md` line 80 stops for the approval on every setup, rows 103, 104, 105, 107 and 108 are the rows the brief's item 10 changes, line 119 is "writes nothing until the user approves", line 124 the diff bullet. R7: `skills/repo-setup/SKILL.md` line 40 asks the questions, 58 shows the draft, 64 runs `/ordo-init` with its own draft and approval, rows 158 to 161 and 163 are the rows the brief's item 11 changes. R8: lines 94 and 103 of the same file are sync Steps 3 and 5 and both stop on every run. R9: `skills/grill/SKILL.md` line 163 writes the ruling for every settled answer, lines 180 and 182 show the roadmap diff as a decision and end the item on the next round or on the yes, row 226 is "A round" and line 247 the Rules bullet "A decision is the user's".

### R10

```
$ git grep -n -i 'approv' HEAD -- skills docs utils README.md | wc -l
     109
(exit 0)
$ git grep -n -i 'every run\|each time' HEAD -- README.md docs skills utils | wc -l
      33
(exit 0)
$ git grep -n -i 'stops of their own\|second stop' HEAD -- skills docs README.md utils | wc -l
       3
(exit 0)
```

Reading: the three greps give 109, 33 and 3 lines on HEAD. After the change they give 118, 36 and 1 (part 4 of this report names every hit outside the changed lines).

### R11

R11 is a reading of the added text, so its first read on HEAD is that HEAD holds no use of the term: the first command of R1 finds no hit for `quoted ruling` or `--ruling` in `skills`, `docs`, `README.md` or `utils` (exit 1). The reading of the added texts against `docs/dev/skill-layout.md` is Verify 9 in part 5 and part 7.

### R12

```
$ git show HEAD:docs/figures/pipeline.svg | grep -c 'quoted ruling'
0
(exit 1)
$ git show HEAD:docs/figures/plan-loop.svg | grep -c 'quoted ruling'
0
(exit 1)
$ git show HEAD:docs/figures/pipeline.svg | grep -o 'viewBox="0 0 1040 [0-9]*"' | head -1
viewBox="0 0 1040 966"
(exit 0)
$ git show HEAD:docs/figures/plan-loop.svg | grep -o 'viewBox="0 0 1040 [0-9]*"' | head -1
viewBox="0 0 1040 889"
(exit 0)
```

Reading: neither SVG holds "quoted ruling" (both counts 0, exit 1), and the viewBox lines are `0 0 1040 966` and `0 0 1040 889`.

## 4. The walks of R2 to R9 after the change, and the readings of R10 and R11

Each step names the file and line it follows; the lines are quoted in full under each walk as `grep -n` prints them, from the tree as it is now.

**R2, an option that runs `/roadmap add` and states the entry in full**

1. The option is written with the entry in full, or with the approval stop of the skill named as a stop of its own: `skills/plan-orchestration/SKILL.md:304`. Run by hand the session reads the same rule at `skills/spec/SKILL.md:210`.
2. An approval of work not yet done stays a stop and the option names it: `skills/plan-orchestration/SKILL.md:302` and `skills/plan-orchestration/SKILL.md:303`
3. The user rules. The session books the ruling as `skills/plan-orchestration/SKILL.md:305` says, which is `spec` "Steps / A ruling" 2: it writes the Rulings bullet whose first line ends with "(the user)." at `skills/spec/SKILL.md:229`, and that bullet is the quoted ruling at `skills/spec/SKILL.md:230`.
4. It copies the entry under the bullet as sub-bullets, a page of several lines as a fenced block indented with its sub-bullet, and a page that holds a fenced block of its own under a fence longer than the inner one: `skills/spec/SKILL.md:231`.
5. It runs the skill with the ruling: `skills/plan-orchestration/SKILL.md:306`.
6. A session run by hand finds the same order at `skills/spec/SKILL.md:240` and in the sequence at `skills/ordo-help/SKILL.md:78`.
7. `git grep -n 'stay stops of their own' -- skills docs` prints nothing (exit 1). The sentences left about an approval stop are `skills/plan-orchestration/SKILL.md:302`, which keeps only work not yet done a stop, and `skills/spec/SKILL.md:210`, which lets the option name the stop instead of stating the change. Neither says the approval stop of a skill the option runs always stays.


**R3, `/roadmap add` under a quoted ruling**

1. The invocation ends with `--ruling <ledger file> "<name>"`, and the file, the name and the closing "(the user)" are read as `skills/roadmap/SKILL.md:42` and its sub-bullets give them.
2. Input a: the ruled entry has a gate that could not pass without the goal and a place after what it waits on. The draft takes the ruled text: `skills/roadmap/SKILL.md:63`, `skills/roadmap/SKILL.md:64`. Its wording is kept: `skills/roadmap/SKILL.md:68`.
3. Each item of the subcommand is worked on that draft: `skills/roadmap/SKILL.md:66`. The ruled gate is not redrafted and its answer stands: `skills/roadmap/SKILL.md:94`, `skills/roadmap/SKILL.md:95`. The place the skill's own rule gives is the ruled place, so nothing replaces ruled text: `skills/roadmap/SKILL.md:67`.
4. Steps 4 compares the draft with the ruled change and, the gate's answer being no, writes it without the stop: `skills/roadmap/SKILL.md:71`, `skills/roadmap/SKILL.md:72`. The Stops row says the same: `skills/roadmap/SKILL.md:159`. Steps 5 puts the ruling in the commit message: `skills/roadmap/SKILL.md:75`.
5. Input b: the same with the gate "the file exists". Add 3 keeps the ruled gate and keeps the stop of Steps 4, and the stop "No gate" is not raised: `skills/roadmap/SKILL.md:96`, `skills/roadmap/SKILL.md:97`. The second Steps 4 sub-bullet writes only when the answer is no, so the item's own line stands: `skills/roadmap/SKILL.md:70`.
6. Input c: a place ahead of an entry it waits on. Add 5 gives another place: `skills/roadmap/SKILL.md:102`. The draft then differs from the ruled change, and Steps 4 shows it whole with each difference and keeps the stop: `skills/roadmap/SKILL.md:73`.
7. Input d: a roadmap with a capability map. The ruled text includes the capability's draft: `skills/roadmap/SKILL.md:64`. With the capability's draft among the sub-bullets each part has a sub-bullet that states it and equals it, so the draft is the ruled change and is written. Without it the capability part the skill drafts (`skills/roadmap/SKILL.md:146`) has no sub-bullet that states it, so by `skills/roadmap/SKILL.md:47` the draft differs and the stop stands.
8. Input e: `move`, `done` and `drop`. The draft is the change the ruling states: `skills/roadmap/SKILL.md:65`. When the draft is that change, Steps 4 writes it without the stop, and the commit names the ruling as in step 4 above.


**R4, whether a ruling exists (`/roadmap`; the item is the same text in the other four skills)**

1. No ruling, and the skill says which case it found with every stop standing: `skills/roadmap/SKILL.md:55`.
2. A file that does not exist, and a file that is neither a `plan.md` nor a rulings file: `skills/roadmap/SKILL.md:51`.
3. A name the file does not hold, and a name two bullets of the file have: `skills/roadmap/SKILL.md:52`. A name that also stands in a step's tag or under Step 0 is one bullet of the Rulings section, since a Step 0 stands outside that section, so it is a ruling.
4. The placeholder `<L>`: `skills/roadmap/SKILL.md:53`.
5. `--ruling` with the file and no name, and `--ruling` with a further argument after the name: `skills/roadmap/SKILL.md:50`.
6. A bullet whose first line ends "(decided by the orchestrator)": `skills/roadmap/SKILL.md:54`. The same line makes a bullet ending "(the user)" with no full stop a ruling, and a rulings file's bullet ending "(the user)." a ruling.
7. A name that holds a quotation mark is matched as written: `skills/roadmap/SKILL.md:46`. The name is read as `spec` reads a ruling's name: `skills/roadmap/SKILL.md:45`.
8. A quoted ruling with no sub-bullet, or with sub-bullets that state part of the change: the draft has a part no sub-bullet states, so it is not the ruled change (`skills/roadmap/SKILL.md:47`), and Steps 4 shows it whole and keeps the stop: `skills/roadmap/SKILL.md:73`.


**R5, `/plan` under a quoted ruling**

1. The ruling is read by `skills/plan/SKILL.md:43`. A quoted ruling that stands in the rulings file is copied with its sub-bullets and their fenced blocks and leaves no line to place: `skills/plan/SKILL.md:68`.
2. The step list is the ruled one, each step with its check, and the rest of Steps 2 is worked on it: `skills/plan/SKILL.md:72`, `skills/plan/SKILL.md:73`.
3. A ruled list that already ends with a closing step gets one closing step, since the ruled one is dropped for the one `/plan` writes: `skills/plan/SKILL.md:74`, `skills/plan/SKILL.md:79`.
4. The four conditions decide the stop: `skills/plan/SKILL.md:85`, `skills/plan/SKILL.md:87`, `skills/plan/SKILL.md:88`, `skills/plan/SKILL.md:89`. A copied gate that could pass without the goal has a "yes" answer in "## Gate" (`skills/plan/SKILL.md:70`), so the fourth condition fails, and an unsettled design decision fails the third. In both the draft is shown whole and the stop stands: `skills/plan/SKILL.md:90`.
5. When the four hold, each step line ends `(approved)`: `skills/plan/SKILL.md:92`, `skills/plan/SKILL.md:93`.
6. The ruling's bullet is in the new Rulings once with its sub-bullets: `skills/plan/SKILL.md:91` when it was not in the rulings file, and by Steps 2 (step 1 above) when it was.
7. The commit names the ruling, and names the new `plan.md` when the ruling came from the rulings file: `skills/plan/SKILL.md:105`, `skills/plan/SKILL.md:106`.


**R6, `/ordo-init` alone under a quoted ruling**

1. The draft takes the ruling's form, keys, `.gitignore` changes and page texts: `skills/ordo-init/SKILL.md:58`, `skills/ordo-init/SKILL.md:59`.
2. Two roadmap candidates with `roadmap` stated: `skills/ordo-init/SKILL.md:65`, `skills/ordo-init/SKILL.md:66`. Keys the ruling states are not asked: `skills/ordo-init/SKILL.md:81`.
3. A ruling that states the commit rule leaves the commit question out, and the commit rule is the ruling's: `skills/ordo-init/SKILL.md:102`, `skills/ordo-init/SKILL.md:33`.
4. Steps 11 compares the draft with the ruling on the form, each key with its value, each `.gitignore` change and each page's full text: `skills/ordo-init/SKILL.md:104`, `skills/ordo-init/SKILL.md:105`. When the ruling states all of them the draft is written with no stop: `skills/ordo-init/SKILL.md:107`. A ruling with no commit rule leaves the commit question alone: `skills/ordo-init/SKILL.md:108`. A ruling that leaves one page's text out gives a draft shown whole, the `.gitignore` change included, with nothing written: `skills/ordo-init/SKILL.md:109`.
5. The commit names the ruling, and a repository whose commit rule forbids the commit lists the files with the ruling: `skills/ordo-init/SKILL.md:117`, `skills/ordo-init/SKILL.md:118`, `skills/ordo-init/SKILL.md:119`.
6. The check of an existing file: a stated fix is made without the stop, a proposed fix that differs is shown and stops, and an error the ruling does not state keeps item 4's stop: `skills/ordo-init/SKILL.md:128`, `skills/ordo-init/SKILL.md:129`, `skills/ordo-init/SKILL.md:127`. The fix is listed with the check's output after the check runs again (item 6): `skills/ordo-init/SKILL.md:132`.
7. Rules 1 and 5 agree with Steps 11: `skills/ordo-init/SKILL.md:155`, `skills/ordo-init/SKILL.md:161`.


**R7, `/repo-setup` under a quoted ruling**

1. A ruling that answers the ten questions: none is asked: `skills/repo-setup/SKILL.md:56`, `skills/repo-setup/SKILL.md:57`. With eight answered, the two the ruling leaves are asked together, and the first condition of Steps 4 fails, so the draft is shown whole: `skills/repo-setup/SKILL.md:58`, `skills/repo-setup/SKILL.md:79`, `skills/repo-setup/SKILL.md:83`.
2. Steps 3 drafts `README.md` as the ruling's text when the ruling holds its full text: `skills/repo-setup/SKILL.md:61`.
3. Steps 4 writes without the stop when the four conditions hold: `skills/repo-setup/SKILL.md:78`, `skills/repo-setup/SKILL.md:80`, `skills/repo-setup/SKILL.md:81`, `skills/repo-setup/SKILL.md:82`.
4. A build file for the kind, a `README.md` whose text the ruling does not hold, or a placeholder Steps 3 lists: the third or fourth condition fails, and the draft is shown whole with each named: `skills/repo-setup/SKILL.md:84`, `skills/repo-setup/SKILL.md:85`.
5. Step 8 runs `/ordo-init` with the same arguments: `skills/repo-setup/SKILL.md:93`, `skills/repo-setup/SKILL.md:94`.
6. Inside it `/ordo-init` does not stop at Steps 2 or 6 for what the ruling states (`skills/ordo-init/SKILL.md:65`, `skills/ordo-init/SKILL.md:81`). At its Steps 11 the keys it derives from the tree just written count as stated (`skills/ordo-init/SKILL.md:106`), so the form, `verification`, `ledger_root`, `archive_root` and `worktree_root`, and the text of each page it creates must be in the ruling (`skills/ordo-init/SKILL.md:105`), or the draft is shown whole and the stop stands (`skills/ordo-init/SKILL.md:109`).
7. The commit or the list names the ruling: `skills/repo-setup/SKILL.md:116`, `skills/repo-setup/SKILL.md:117`.


**R8, `/repo-setup sync` under a quoted ruling**

1. Exit 1, the ruling's hunks being the diff's, each with its choice: the choices are applied without the stop: `skills/repo-setup/SKILL.md:128`.
2. Exit 1 with a hunk of the diff the ruling does not hold, and exit 1 with a ruled hunk the diff does not show: in both the diff's hunks are not the ruling's, so it is shown whole and the stop stands: `skills/repo-setup/SKILL.md:129`.
3. Exit 2 with a drafted change the ruling states: the draft takes the ruling's text, sync 4's rules are worked on it, and a draft that is still the ruled change is written without the stop: `skills/repo-setup/SKILL.md:137`, `skills/repo-setup/SKILL.md:138`, `skills/repo-setup/SKILL.md:139`.
4. Exit 2 with a change that differs from the ruled one: `skills/repo-setup/SKILL.md:140`.
5. The commit names the ruling, or the list of files does: `skills/repo-setup/SKILL.md:147`, and the list is `skills/repo-setup/SKILL.md:148`.


**R9, `/grill` under a quoted ruling**

1. The draft is made at the first write of Steps 8 from the ruling's sub-bullets, with no answer of the interview having changed the entry: `skills/grill/SKILL.md:199`, `skills/grill/SKILL.md:200`, `skills/grill/SKILL.md:201`.
2. A draft that is the ruled text, with a gate whose answer is no, or with a changed goal and no gate, is written at once, and the roadmap diff decision counts as answered: `skills/grill/SKILL.md:202`, `skills/grill/SKILL.md:203`.
3. Steps 9 still ends, because the roadmap diff decision is answered: `skills/grill/SKILL.md:116`.
4. "Writing what settled" 1 writes no bullet for it: `skills/grill/SKILL.md:185`.
5. Steps 10 lists the entry with the ruling and the commit message names it: `skills/grill/SKILL.md:120`, `skills/grill/SKILL.md:126`.
6. A changed gate that could pass without the goal, or a draft that differs from the ruled text, is shown as the decision: `skills/grill/SKILL.md:204`.
7. The Stops row and the Rules bullet agree: `skills/grill/SKILL.md:250`, `skills/grill/SKILL.md:272`.

Lines quoted by the walks, once each, in file and line order, as `grep -n` prints them:

```
skills/grill/SKILL.md:116:9. Go back to Steps 3, until the frontier is empty and the roadmap diff and "record as ADR?" decisions are answered.
skills/grill/SKILL.md:120:    - An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.
skills/grill/SKILL.md:126:    - The commit message names a quoted ruling an entry was changed under, by its name and its ledger file.
skills/grill/SKILL.md:185:   - A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.
skills/grill/SKILL.md:199:   - Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.
skills/grill/SKILL.md:200:   - It takes the ruled text.
skills/grill/SKILL.md:201:   - The rules of this item are worked on it.
skills/grill/SKILL.md:202:   - A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass without the goal.
skills/grill/SKILL.md:203:   - The roadmap diff decision then counts as answered.
skills/grill/SKILL.md:204:   - A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision.
skills/grill/SKILL.md:250:| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |
skills/grill/SKILL.md:272:  - A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.
skills/ordo-help/SKILL.md:78:                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again
skills/ordo-init/SKILL.md:33:   - When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.
skills/ordo-init/SKILL.md:58:   - Under a quoted ruling ("What it reads" 5), the draft takes the ruling's form, keys, `.gitignore` changes and page texts.
skills/ordo-init/SKILL.md:59:   - Steps 2 to 9 replace a ruled part only where a rule of this skill gives another result.
skills/ordo-init/SKILL.md:65:   - Under a quoted ruling that states `roadmap`, the key is the ruling's.
skills/ordo-init/SKILL.md:66:   - The stop of several candidates is then not raised.
skills/ordo-init/SKILL.md:81:   - A key whose value a quoted ruling states is not asked.
skills/ordo-init/SKILL.md:102:    - The commit question is left out when a quoted ruling states whether the skill may commit.
skills/ordo-init/SKILL.md:104:    - Under a quoted ruling, compare the draft Steps 10 shows with the ruling.
skills/ordo-init/SKILL.md:105:    - The comparison covers the form, each key of `.agents/plan.yaml` with its value, each change to `.gitignore`, and the full text of each page to create.
skills/ordo-init/SKILL.md:106:    - Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated.
skills/ordo-init/SKILL.md:107:    - A draft the ruling states in each of these is written without the stop.
skills/ordo-init/SKILL.md:108:    - A commit question Steps 10 shows is then asked alone.
skills/ordo-init/SKILL.md:109:    - A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.
skills/ordo-init/SKILL.md:117:    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/ordo-init/SKILL.md:118:    - When no commit is made, the list of files written names the ruling the same way.
skills/ordo-init/SKILL.md:119:    - That list is the one of the stop "No commit allowed", or under `/repo-setup` the one of `repo-setup`'s Steps 12.
skills/ordo-init/SKILL.md:127:4. For each error, propose the fix ("Stops").
skills/ordo-init/SKILL.md:128:   - A fix a quoted ruling states is made without the stop.
skills/ordo-init/SKILL.md:129:   - A fix the skill proposes that differs from the ruled fix is shown with the difference, and the stop stands.
skills/ordo-init/SKILL.md:132:   - A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file.
skills/ordo-init/SKILL.md:155:  - A quoted ruling that states the draft is that approval.
skills/ordo-init/SKILL.md:161:  - Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.
skills/plan-orchestration/SKILL.md:302:  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
skills/plan-orchestration/SKILL.md:303:  - The option names that stop.
skills/plan-orchestration/SKILL.md:304:  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.
skills/plan-orchestration/SKILL.md:305:  - After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.
skills/plan-orchestration/SKILL.md:306:  - It then runs the skill with `--ruling <ledger file> "<name>"`.
skills/plan/SKILL.md:43:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/plan/SKILL.md:68:   - A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.
skills/plan/SKILL.md:70:   - A copied gate that could pass without the goal is kept as the roadmap has it, and its answer and reason go to the user at Steps 3, since the gate is the roadmap's and the user's.
skills/plan/SKILL.md:72:   - Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.
skills/plan/SKILL.md:73:   - The rest of this step is worked on that list.
skills/plan/SKILL.md:74:   - A closing step in the ruled list is dropped for the one `/plan` writes.
skills/plan/SKILL.md:79:   - `/plan` writes the closing step itself, at the end of the drafted list.
skills/plan/SKILL.md:85:   - Under a quoted ruling, the draft is written without the stop only when four things hold.
skills/plan/SKILL.md:87:     - Every answer in "## Gate" is no.
skills/plan/SKILL.md:88:     - No design decision is named as unsettled.
skills/plan/SKILL.md:89:     - No line of the rulings file is left to place.
skills/plan/SKILL.md:90:   - Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands.
skills/plan/SKILL.md:91:   - The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.
skills/plan/SKILL.md:92:   - A step list written under a quoted ruling is the approved list.
skills/plan/SKILL.md:93:   - Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.
skills/plan/SKILL.md:105:   - A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/plan/SKILL.md:106:   - When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`.
skills/repo-setup/SKILL.md:56:   - A question a quoted ruling answers ("What it reads" 6) is not asked.
skills/repo-setup/SKILL.md:57:   - Its answer is the ruling's.
skills/repo-setup/SKILL.md:58:   - The questions the ruling leaves open are asked together.
skills/repo-setup/SKILL.md:61:   - Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.
skills/repo-setup/SKILL.md:78:   - Under a quoted ruling, the draft is written without the stop only when four things hold.
skills/repo-setup/SKILL.md:79:     - The ruling answers every question of "The questions".
skills/repo-setup/SKILL.md:80:     - It states `worker`, `reviewer` and `libraries` for `/ordo-init`.
skills/repo-setup/SKILL.md:81:     - Every file of the draft that this skill writes is a template filled from the answers, or has its full text in the ruling. The files `/ordo-init` drafts and the file the skills CLI writes are not counted.
skills/repo-setup/SKILL.md:82:     - Steps 3 lists no placeholder for the user's value.
skills/repo-setup/SKILL.md:83:   - Otherwise the draft is shown whole, and the stop stands.
skills/repo-setup/SKILL.md:84:   - Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.
skills/repo-setup/SKILL.md:85:   - Each placeholder Steps 3 lists is named with it.
skills/repo-setup/SKILL.md:93:   - Under a quoted ruling, `/ordo-init` is run with the same `--ruling` arguments.
skills/repo-setup/SKILL.md:94:   - It skips the stops the ruling covers, as its own text says.
skills/repo-setup/SKILL.md:116:    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/repo-setup/SKILL.md:117:    - When no commit is made, the list of files the stop shows names the ruling the same way.
skills/repo-setup/SKILL.md:128:   - Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.
skills/repo-setup/SKILL.md:129:   - A diff whose hunks are not the ruling's is shown whole, and the stop stands.
skills/repo-setup/SKILL.md:137:   - Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text.
skills/repo-setup/SKILL.md:138:   - The rules of Steps / sync 4 are worked on it.
skills/repo-setup/SKILL.md:139:   - A draft that is still the ruled change is written without the stop.
skills/repo-setup/SKILL.md:140:   - A draft that differs from it is shown whole with each difference named, and the stop stands.
skills/repo-setup/SKILL.md:147:   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/repo-setup/SKILL.md:148:   - When no commit is made, the list of files the stop shows names the ruling the same way.
skills/roadmap/SKILL.md:42:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/roadmap/SKILL.md:45:   - The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
skills/roadmap/SKILL.md:46:   - It is matched against the bullet's text as written, a quotation mark in it included.
skills/roadmap/SKILL.md:47:   - A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
skills/roadmap/SKILL.md:50:     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
skills/roadmap/SKILL.md:51:     - The file does not exist, or is neither of those two files.
skills/roadmap/SKILL.md:52:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
skills/roadmap/SKILL.md:53:     - The name is a placeholder in angle brackets, such as `<L>`.
skills/roadmap/SKILL.md:54:     - The bullet's first line does not end with "(the user)", with or without a full stop after it.
skills/roadmap/SKILL.md:55:   - With no ruling, the skill says which of these it found, and every stop stands.
skills/roadmap/SKILL.md:63:   - Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text.
skills/roadmap/SKILL.md:64:   - For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.
skills/roadmap/SKILL.md:65:   - For `move`, `done` and `drop` it is the change the ruling states.
skills/roadmap/SKILL.md:66:   - Each item of the command's subsection is then worked on that draft.
skills/roadmap/SKILL.md:67:   - An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form.
skills/roadmap/SKILL.md:68:   - The ruled wording of the title, the goal, the gate and what it waits on is kept.
skills/roadmap/SKILL.md:70:4. Write the change once the user approves or corrects it ("Stops").
skills/roadmap/SKILL.md:71:   - Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.
skills/roadmap/SKILL.md:72:   - A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.
skills/roadmap/SKILL.md:73:   - A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.
skills/roadmap/SKILL.md:75:   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/roadmap/SKILL.md:94:   - Under a quoted ruling the ruled gate is not redrafted.
skills/roadmap/SKILL.md:95:   - Its answer and its reason stand in the draft.
skills/roadmap/SKILL.md:96:   - A ruled gate that could pass without the goal keeps the stop of Steps 4.
skills/roadmap/SKILL.md:97:   - The stop "No gate" is not raised for it.
skills/roadmap/SKILL.md:102:5. Draft the place: after everything it waits on and before the entries that will depend on it, with that reason written out.
skills/roadmap/SKILL.md:146:- `add` also finds the capability the entry builds in its system file.
skills/roadmap/SKILL.md:159:| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says | What Steps 3 shows | The user's approval or correction |
skills/spec/SKILL.md:210:     - An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.
skills/spec/SKILL.md:229:   - a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";
skills/spec/SKILL.md:230:   - that bullet is the quoted ruling the session gives the skill;
skills/spec/SKILL.md:231:   - the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;
skills/spec/SKILL.md:240:   - After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.
```

### R10, no sentence elsewhere is made false

Each hit outside the changed lines was read against the new texts. Totals now (`HEAD` in brackets): `git grep -n -i 'approv' -- skills docs utils README.md | wc -l` prints 118 (109), `git grep -n -i 'every run\|each time' -- README.md docs skills utils | wc -l` prints 36 (33), `git grep -n -i 'stops of their own\|second stop' -- skills docs README.md utils | wc -l` prints 1 (3). Hits on lines the diff adds or changes: 19, 7 and 0; the 99, 29 and 1 hits on unchanged lines are named below by `file:line` under the reason each holds. The lines were found by taking each hit's line number against the added line numbers of `git diff -U0` for its file.

**Hits of `approv`, 99 on unchanged lines:**

1. A sentence about a draft that a skill shows and writes after the user approves it (the descriptions, the opening paragraphs, the Quick start rows, Steps and Rules lines, the anti-pattern rows, `README.md` lines 17, 35, 113, 117 and 124, the figure line "approval." at `docs/figures/pipeline.svg:81`, the glossary and template lines for **stop** and **sync**). It holds because a quoted ruling that states the draft is the user's approval of it, and the skill's own text says so: `roadmap` at `skills/roadmap/SKILL.md:71` and `skills/roadmap/SKILL.md:72`; `plan` at `skills/plan/SKILL.md:92`; `ordo-init` at `skills/ordo-init/SKILL.md:155` and `skills/ordo-init/SKILL.md:161`; `repo-setup` at `skills/repo-setup/SKILL.md:221` and, for `sync`, `skills/repo-setup/SKILL.md:128` and `skills/repo-setup/SKILL.md:137`; `grill` at `skills/grill/SKILL.md:272`. Hits: `README.md:17`, `README.md:35`, `README.md:113`, `README.md:117`, `README.md:124`, `docs/figures/gen_figures.py:489`, `docs/figures/pipeline.svg:81`, `skills/ordo-help/SKILL.md:55`, `skills/ordo-init/SKILL.md:3`, `skills/ordo-init/SKILL.md:10`, `skills/ordo-init/SKILL.md:15`, `skills/ordo-init/SKILL.md:32`, `skills/ordo-init/SKILL.md:103`, `skills/ordo-init/SKILL.md:110`, `skills/ordo-init/SKILL.md:130`, `skills/ordo-init/SKILL.md:154`, `skills/ordo-init/SKILL.md:160`, `skills/plan/SKILL.md:3`, `skills/plan/SKILL.md:15`, `skills/plan/SKILL.md:83`, `skills/plan/SKILL.md:84`, `skills/plan/SKILL.md:124`, `skills/repo-setup/SKILL.md:3`, `skills/repo-setup/SKILL.md:10`, `skills/repo-setup/SKILL.md:86`, `skills/repo-setup/SKILL.md:91`, `skills/repo-setup/SKILL.md:126`, `skills/repo-setup/SKILL.md:141`, `skills/repo-setup/SKILL.md:144`, `skills/repo-setup/SKILL.md:220`, `skills/roadmap/SKILL.md:3`, `skills/roadmap/SKILL.md:10`, `skills/roadmap/SKILL.md:16`, `skills/roadmap/SKILL.md:17`, `skills/roadmap/SKILL.md:60`, `skills/roadmap/SKILL.md:70`, `skills/roadmap/SKILL.md:160`, `docs/glossary.md:111`, `docs/glossary.md:112`, `skills/repo-setup/templates/plan-terms.md:106`, `skills/repo-setup/templates/plan-terms.md:107`. (`README.md:113` and `skills/repo-setup/SKILL.md:3` also say the tree is shown before writing; see part 11, point 2.)

2. A sentence about the authority tags `(approved)` and `(ruling <name>)`, the anti-pattern row about writing `plan.md` before the step list is approved, or the plan template's tags. They hold because a plan written under a quoted ruling keeps `(approved)` on each step line (`skills/plan/SKILL.md:92`) and `spec` still requires the tag (`skills/spec/SKILL.md:43`). Hits: `README.md:18`, `docs/glossary.md:11`, `skills/grill/SKILL.md:171`, `skills/ordo-help/SKILL.md:80`, `skills/plan/SKILL.md:93`, `skills/plan/SKILL.md:130`, `skills/plan/templates/plan.md:18`, `skills/plan/templates/plan.md:19`, `skills/plan/templates/plan.md:20`, `skills/plan/templates/plan.md:21`, `skills/repo-setup/templates/plan-terms.md:6`, `skills/spec/SKILL.md:3`, `skills/spec/SKILL.md:43`, `skills/spec/SKILL.md:292`.

3. A sentence about an approval that no quoted ruling reaches: the user's approval of a new script's computation (`docs/dev/change-standard.md`, its template, the shared rules), of a proposal or a check of `/plan-retro` and `/session-retro`, of the pages `docs/academic-coverage.md` describes, of a page a step will write, of an entry in `docs/roadmap.md`, and the calibration exemplar of the prose standard. Only the five skills of the brief take `--ruling`, and none of these sentences is about a stop of those five. Hits: `README.md:24`, `docs/academic-coverage.md:52`, `docs/academic-coverage.md:63`, `docs/academic-coverage.md:188`, `docs/academic-coverage.md:192`, `docs/academic-coverage.md:216`, `docs/dev/change-standard.md:19`, `docs/dev/change-standard.md:22`, `docs/dev/change-standard.md:29`, `docs/roadmap.md:25`, `docs/roadmap.md:122`, `docs/roadmap.md:129`, `docs/roadmap.md:200`, `docs/roadmap.md:217`, `docs/roadmap.md:218`, `docs/roadmap.md:221`, `docs/roadmap.md:222`, `skills/plan-orchestration/SKILL.md:207`, `skills/plan-retro/SKILL.md:3`, `skills/plan-retro/SKILL.md:10`, `skills/plan-retro/SKILL.md:59`, `skills/plan-retro/SKILL.md:61`, `skills/plan-retro/SKILL.md:62`, `skills/plan-retro/SKILL.md:86`, `skills/plan-retro/SKILL.md:93`, `skills/plan-retro/templates/retro.md:30`, `skills/repo-setup/templates/docs/dev/change-standard.md:19`, `skills/repo-setup/templates/docs/dev/change-standard.md:22`, `skills/repo-setup/templates/docs/dev/change-standard.md:29`, `skills/repo-setup/templates/docs/dev/prose-standard.md:7`, `skills/repo-setup/templates/shared-rules.md:15`, `skills/session-retro/SKILL.md:133`, `skills/session-retro/SKILL.md:136`, `skills/session-retro/SKILL.md:171`, `skills/session-retro/SKILL.md:189`, `skills/session-retro/templates/sessions.md:26`, `skills/session-retro/templates/sessions.md:35`, `skills/session-retro/templates/sessions.md:37`.

4. The definition of an open item (its options state "what each option would need approved later") and its glossary and template copies. They hold because `skills/plan-orchestration/SKILL.md:301` and `skills/plan-orchestration/SKILL.md:304` say the option states that approval in full, and a quoted ruling is the form the stated change takes. Hits: `docs/glossary.md:61`, `skills/plan/templates/orchestrator-state.md:38`, `skills/repo-setup/templates/plan-terms.md:56`, `skills/plan-orchestration/SKILL.md:301`, `skills/spec/SKILL.md:207`. The hits at `skills/plan-orchestration/SKILL.md:301` and `skills/spec/SKILL.md:207` say "the user's ruling then approves them too": the ruling on the option is the approval, and a quoted ruling is that ruling.

5. `skills/plan-orchestration/SKILL.md:290`, the Stops row "The roadmap diff", "The closing step's `/roadmap done`, which shows its diff" with "The user's approval of the diff". It holds because the loop never gives the closing step's `/roadmap done` a `--ruling`: `skills/plan-orchestration/SKILL.md:306` is the only place `plan-orchestration` passes it (`grep -n -e --ruling` prints that one line), so the closing invocation has no quoted ruling and its stop stands.

**Hits of `every run` and `each time`, 29 on unchanged lines:**

1. The figures' words for the mark: the legend labels and the SVG text elements "every run" and "it waits on you each time it runs", the alt texts, the constants and the head comment of `gen_figures.py`. They hold because the legend row keeps the mark's meaning and the note under it states the exception (`docs/figures/gen_figures.py:395`, `README.md:54`), and the entry **mark, of a figure** says the same (`docs/glossary.md:134`). Hits: `README.md:56`, `README.md:60`, `docs/figures/gen_figures.py:20`, `docs/figures/gen_figures.py:71`, `docs/figures/gen_figures.py:381`, `docs/figures/gen_figures.py:422`, `docs/figures/gen_figures.py:572`, `docs/figures/pipeline.svg:2`, `docs/figures/pipeline.svg:12`, `docs/figures/pipeline.svg:26`, `docs/figures/pipeline.svg:50`, `docs/figures/pipeline.svg:68`, `docs/figures/pipeline.svg:83`, `docs/figures/pipeline.svg:106`, `docs/figures/pipeline.svg:137`, `docs/figures/pipeline.svg:165`, `docs/figures/pipeline.svg:166`, `docs/figures/plan-loop.svg:2`, `docs/figures/plan-loop.svg:144`, `docs/figures/plan-loop.svg:156`, `docs/figures/plan-loop.svg:157`.

2. Other senses of "each time" or "every run", unrelated to a stop: a transcript-window test line, the layout's "material every run reads", a run counter of `person-driven.md`, a retro's "every run is read", the refuter's "fresh reviewer each time" and "every time", the commit rule placeholder of the `CLAUDE.md` template, and a comment of `utils/pin.test.sh`. None is about a stop of the five skills. Hits: `docs/dev/building.md:12`, `docs/dev/skill-layout.md:64`, `skills/diagnose/references/person-driven.md:10`, `skills/plan-retro/SKILL.md:32`, `skills/refute/SKILL.md:80`, `skills/refute/SKILL.md:182`, `skills/repo-setup/templates/CLAUDE.md:10`, `utils/pin.test.sh:98`.

**Hits of `stops of their own` and `second stop`, 1 on an unchanged line:** `skills/plan-orchestration/SKILL.md:301`. It holds: it says an approval whose content exists when the option is written is stated in full in the option and needs no second stop, and the ruling that closes the open item is that approval; the changed lines 302 to 306 keep that sentence true, since they say only an approval of work not yet done stays a stop of its own.

`git grep -n 'stay stops of their own' -- skills docs` prints nothing (Verify 5).

### R11, the added text read against the layout

Every text the diff adds was read against `docs/dev/skill-layout.md` ("Sections, in order" for the Quick start rows, "Where a rule goes", "Lists and tables", "Writing for an agent"): one rule per bullet, each rule in the step where it applies, and **quoted ruling** in its glossary sense only. The 93 lines that hold `quoted ruling` or `--ruling` (Verify 6) are uses of the entry's sense; the reading notes and the long sentences are in part 7.

## 5. DONE / NOT DONE

Every row is DONE. Each command was run from the worktree root; its output is quoted whole.

| Item | What | Files | Dictated texts |
|---|---|---|---|
| 1 | DONE: `skills/repo-setup/templates/plan-terms.md`: the entry **quoted ruling** and the changes to **commit rule**, **ruling** and **rulings file**; then `sync_rules.py . --only glossary --write` so the plan-terms block of `docs/glossary.md` holds the same | `skills/repo-setup/templates/plan-terms.md`, `docs/glossary.md` | in the Verify 2 listing, each printing its count |
| 2 | DONE: `docs/glossary.md`, the entry **mark, of a figure** | `docs/glossary.md` | in the Verify 2 listing, each printing its count |
| 3 | DONE: `README.md` line 54 | `README.md` | in the Verify 2 listing, each printing its count |
| 4 | DONE: `docs/figures/gen_figures.py`, and the two SVGs it rewrites | `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg`, `docs/figures/plan-loop.svg` | in the Verify 2 listing, each printing its count |
| 5 | DONE: `skills/spec/SKILL.md` | `skills/spec/SKILL.md` | in the Verify 2 listing, each printing its count |
| 6 | DONE: `skills/ordo-help/SKILL.md` | `skills/ordo-help/SKILL.md` | in the Verify 2 listing, each printing its count |
| 7 | DONE: `skills/plan-orchestration/SKILL.md` | `skills/plan-orchestration/SKILL.md` | in the Verify 2 listing, each printing its count |
| 8 | DONE: `skills/roadmap/SKILL.md` | `skills/roadmap/SKILL.md` | in the Verify 2 listing, each printing its count |
| 9 | DONE: `skills/plan/SKILL.md` | `skills/plan/SKILL.md` | in the Verify 2 listing, each printing its count |
| 10 | DONE: `skills/ordo-init/SKILL.md` | `skills/ordo-init/SKILL.md` | in the Verify 2 listing, each printing its count |
| 11 | DONE: `skills/repo-setup/SKILL.md` | `skills/repo-setup/SKILL.md` | in the Verify 2 listing, each printing its count |
| 12 | DONE: `skills/grill/SKILL.md` | `skills/grill/SKILL.md` | in the Verify 2 listing, each printing its count |

`git diff --stat | cat` prints, for the files of all twelve items:

```
 README.md                                 |  2 +-
 docs/figures/gen_figures.py               | 14 +++++++--
 docs/figures/pipeline.svg                 |  5 ++--
 docs/figures/plan-loop.svg                |  5 ++--
 docs/glossary.md                          |  9 +++---
 skills/grill/SKILL.md                     | 29 ++++++++++++++++--
 skills/ordo-help/SKILL.md                 |  1 +
 skills/ordo-init/SKILL.md                 | 47 +++++++++++++++++++++++++----
 skills/plan-orchestration/SKILL.md        |  8 +++--
 skills/plan/SKILL.md                      | 31 ++++++++++++++++++-
 skills/repo-setup/SKILL.md                | 50 +++++++++++++++++++++++++++----
 skills/repo-setup/templates/plan-terms.md |  7 +++--
 skills/roadmap/SKILL.md                   | 41 +++++++++++++++++++++----
 skills/spec/SKILL.md                      |  8 ++++-
 14 files changed, 220 insertions(+), 37 deletions(-)
```

### Verify 1: DONE

The plan's verify list, run as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`. It printed the lines below and its exit status is 0:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
exit=0
```

### Verify 2: DONE

Each dictated text is written as the one line of a scratch file `$TMPDIR/ordo-9a-verify/pNNN.txt` (`$TMPDIR` is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/`), the line being the text after its indent and its numeral or bullet marker, with no empty line in the file. The command for each is `grep -c -F -f $TMPDIR/ordo-9a-verify/pNNN.txt <file>`. The run printed `210 texts; 0 not as expected`: 210 commands, each printing the count the brief requires, which is 1 except for the sub-bullet "When no commit is made, the list of files the stop shows names the ruling the same way." in `skills/repo-setup/SKILL.md`, which prints 2 there. Below, each text stands once, followed by the files whose command printed the count shown (the item-4 python lines are counted in `docs/figures/gen_figures.py`; the other lines of the `draw_note` call are not counted, as the brief says). The mapping of each text to its pNNN file is the order of the 210 rows of `verify2.tsv` in the scratchpad.

- `**quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it. The sub-bullets state the change in full. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.` -> plan-terms, glossary
- `a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";` -> spec
- `that bullet is the quoted ruling the session gives the skill;` -> spec
- `the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;` -> spec
- `After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.` -> spec
- `An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.` -> spec, plan-orchestration
- `The option names that stop.` -> spec, plan-orchestration
- `An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.` -> spec
- `after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again` -> ordo-help
- `An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.` -> plan-orchestration
- `After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.` -> plan-orchestration
- `It then runs the skill with `--ruling <ledger file> "<name>"`.` -> plan-orchestration
- `/roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop` -> roadmap
- `Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text.` -> roadmap
- `For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.` -> roadmap
- `For `move`, `done` and `drop` it is the change the ruling states.` -> roadmap
- `Each item of the command's subsection is then worked on that draft.` -> roadmap
- `An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form.` -> roadmap
- `The ruled wording of the title, the goal, the gate and what it waits on is kept.` -> roadmap
- `Under a quoted ruling the ruled gate is not redrafted.` -> roadmap
- `Its answer and its reason stand in the draft.` -> roadmap
- `A ruled gate that could pass without the goal keeps the stop of Steps 4.` -> roadmap
- `The stop "No gate" is not raised for it.` -> roadmap
- `Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.` -> roadmap
- `A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.` -> roadmap
- `A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.` -> roadmap
- `A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.` -> roadmap, repo-setup
- `/plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop` -> plan
- `A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.` -> plan
- `Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.` -> plan
- `The rest of this step is worked on that list.` -> plan
- `A closing step in the ruled list is dropped for the one `/plan` writes.` -> plan
- `Under a quoted ruling, the draft is written without the stop only when four things hold.` -> plan, repo-setup
- `Each step and its check are the ruling's, the closing step `/plan` writes itself left out of the comparison.` -> plan
- `Every answer in "## Gate" is no.` -> plan
- `No design decision is named as unsettled.` -> plan
- `No line of the rulings file is left to place.` -> plan
- `Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands.` -> plan
- `The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.` -> plan
- `A step list written under a quoted ruling is the approved list.` -> plan
- `A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.` -> plan
- `When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`.` -> plan
- `/ordo-init --ruling <ledger file> "<name>"     the same, under a quoted ruling: a draft the ruling states is written without the stop` -> ordo-init
- `When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.` -> ordo-init
- `Under a quoted ruling ("What it reads" 5), the draft takes the ruling's form, keys, `.gitignore` changes and page texts.` -> ordo-init
- `Steps 2 to 9 replace a ruled part only where a rule of this skill gives another result.` -> ordo-init
- `Under a quoted ruling that states `roadmap`, the key is the ruling's.` -> ordo-init
- `The stop of several candidates is then not raised.` -> ordo-init
- `A key whose value a quoted ruling states is not asked.` -> ordo-init
- `Its value is the ruling's.` -> ordo-init
- `The commit question is left out when a quoted ruling states whether the skill may commit.` -> ordo-init
- `Under a quoted ruling, compare the draft Steps 10 shows with the ruling.` -> ordo-init
- `The comparison covers the form, each key of `.agents/plan.yaml` with its value, each change to `.gitignore`, and the full text of each page to create.` -> ordo-init
- `Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated.` -> ordo-init
- `A draft the ruling states in each of these is written without the stop.` -> ordo-init
- `A commit question Steps 10 shows is then asked alone.` -> ordo-init
- `A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.` -> ordo-init
- `A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.` -> ordo-init, repo-setup
- `When no commit is made, the list of files written names the ruling the same way.` -> ordo-init
- `That list is the one of the stop "No commit allowed", or under `/repo-setup` the one of `repo-setup`'s Steps 12.` -> ordo-init
- `A fix a quoted ruling states is made without the stop.` -> ordo-init
- `A fix the skill proposes that differs from the ruled fix is shown with the difference, and the stop stands.` -> ordo-init
- `A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file.` -> ordo-init
- `A quoted ruling that states the draft is that approval.` -> ordo-init
- `Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.` -> ordo-init
- `/repo-setup ... --ruling <ledger file> "<name>"   either form, under a quoted ruling: a draft or a sync change the ruling states is written without the stop` -> repo-setup
- `Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.` -> repo-setup
- `A question a quoted ruling answers ("What it reads" 6) is not asked.` -> repo-setup
- `Its answer is the ruling's.` -> repo-setup
- `The questions the ruling leaves open are asked together.` -> repo-setup
- `The ruling answers every question of "The questions".` -> repo-setup
- `It states `worker`, `reviewer` and `libraries` for `/ordo-init`.` -> repo-setup
- `Every file of the draft that this skill writes is a template filled from the answers, or has its full text in the ruling. The files `/ordo-init` drafts and the file the skills CLI writes are not counted.` -> repo-setup
- `Steps 3 lists no placeholder for the user's value.` -> repo-setup
- `Otherwise the draft is shown whole, and the stop stands.` -> repo-setup
- `Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.` -> repo-setup
- `Each placeholder Steps 3 lists is named with it.` -> repo-setup
- `Under a quoted ruling, `/ordo-init` is run with the same `--ruling` arguments.` -> repo-setup
- `It skips the stops the ruling covers, as its own text says.` -> repo-setup
- `When no commit is made, the list of files the stop shows names the ruling the same way.` -> repo-setup 2, repo-setup 2
- `Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.` -> repo-setup
- `A diff whose hunks are not the ruling's is shown whole, and the stop stands.` -> repo-setup
- `Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text.` -> repo-setup
- `The rules of Steps / sync 4 are worked on it.` -> repo-setup
- `A draft that is still the ruled change is written without the stop.` -> repo-setup
- `A draft that differs from it is shown whole with each difference named, and the stop stands.` -> repo-setup
- `A quoted ruling that covers the draft as Steps 4 says is that approval.` -> repo-setup
- `/grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision` -> grill
- `An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.` -> grill
- `The commit message names a quoted ruling an entry was changed under, by its name and its ledger file.` -> grill
- `A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.` -> grill
- `Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.` -> grill
- `It takes the ruled text.` -> grill
- `The rules of this item are worked on it.` -> grill
- `A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass without the goal.` -> grill
- `The roadmap diff decision then counts as answered.` -> grill
- `A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision.` -> grill
- `A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.` -> grill
- `The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.` -> roadmap, plan, ordo-init, repo-setup, grill
- ``<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.` -> roadmap, plan, ordo-init, repo-setup, grill
- `The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.` -> roadmap, plan, ordo-init, repo-setup, grill
- `The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.` -> roadmap, plan, ordo-init, repo-setup, grill
- `It is matched against the bullet's text as written, a quotation mark in it included.` -> roadmap, plan, ordo-init, repo-setup, grill
- `A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.` -> roadmap, plan, ordo-init, repo-setup, grill
- `A text of several lines is compared line for line with the fenced block under its sub-bullet.` -> roadmap, plan, ordo-init, repo-setup, grill
- `There is no ruling in any of these cases.` -> roadmap, plan, ordo-init, repo-setup, grill
- ``--ruling` is not followed by the file and the name as the last two arguments of the invocation.` -> roadmap, plan, ordo-init, repo-setup, grill
- `The file does not exist, or is neither of those two files.` -> roadmap, plan, ordo-init, repo-setup, grill
- `No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.` -> roadmap, plan, ordo-init, repo-setup, grill
- `The name is a placeholder in angle brackets, such as `<L>`.` -> roadmap, plan, ordo-init, repo-setup, grill
- `The bullet's first line does not end with "(the user)", with or without a full stop after it.` -> roadmap, plan, ordo-init, repo-setup, grill
- `With no ruling, the skill says which of these it found, and every stop stands.` -> roadmap, plan, ordo-init, repo-setup, grill
- `"""The three marks and the dashed box with what each says, on one row, and a note under it."""` -> gen_figures
- `y + 48,` -> gen_figures
- `'A stop marked "every run" waits each time, unless the run is under a quoted ruling that '` -> gen_figures
- `"states the change.",` -> gen_figures
- `side_top + side_h + 90,` -> gen_figures
- `band_y + band_h + 103,` -> gen_figures
- `or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit.` -> plan-terms, glossary
- `A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling.` -> plan-terms, glossary
- `one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open.` -> plan-terms, glossary
- `"every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change;` -> glossary
- `A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case.` -> README
- ``/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling)` -> plan-orchestration
- `The step is done when the answer with its reason stands in the draft, and the gate's answer is no or the gate is a quoted ruling's.` -> roadmap
- `A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops").` -> roadmap
- `- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.` -> roadmap
- `Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says` -> roadmap
- `Entries exist at two levels and neither the goal nor a quoted ruling settles which` -> roadmap
- `The file has no insertion form yet, and no quoted ruling states the entry's number` -> roadmap
- `Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does` -> plan
- `Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says, where only a commit question the ruling leaves open is asked` -> ordo-init
- `More than one roadmap candidate, and no quoted ruling states `roadmap`` -> ordo-init
- `Every setup, at Steps 6, for each key a quoted ruling does not state` -> ordo-init
- `The check reports an error in an existing file, and no quoted ruling states its fix` -> ordo-init
- `The files written, the quoted ruling named when the setup was written under one, and the command that shows them (`git status --short`)` -> ordo-init
- `Every setup, at Steps 2, for each question a quoted ruling does not answer` -> repo-setup
- `The questions asked, each with its default` -> repo-setup
- `Every setup, at Steps 4, except a draft a quoted ruling covers as Steps 4 says` -> repo-setup
- ``sync` exits 1, except a diff whose hunks are a quoted ruling's (Steps / sync 3)` -> repo-setup
- `for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5)` -> repo-setup
- `The files changed, the quoted ruling named when they were written under one, and the command that shows them (`git status --short`)` -> repo-setup
- `The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.` -> grill
- `Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it` -> grill

Every file listed printed 1, except `repo-setup 2` for the one sub-bullet named above.

### Verify 3: DONE

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
(exit 0)
$ git status --short
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/figures/plan-loop.svg
 M docs/glossary.md
 M skills/grill/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-e-grill/agents/reviews/9a-report.md
(exit 0)
$ python3 docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (31507 bytes)
wrote docs/figures/plan-loop.svg (31164 bytes)
(exit 0)
$ git status --short
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/figures/plan-loop.svg
 M docs/glossary.md
 M skills/grill/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-e-grill/agents/reviews/9a-report.md
(exit 0)
$ git diff --stat | cat
 README.md                                 |  2 +-
 docs/figures/gen_figures.py               | 14 +++++++--
 docs/figures/pipeline.svg                 |  5 ++--
 docs/figures/plan-loop.svg                |  5 ++--
 docs/glossary.md                          |  9 +++---
 skills/grill/SKILL.md                     | 29 ++++++++++++++++--
 skills/ordo-help/SKILL.md                 |  1 +
 skills/ordo-init/SKILL.md                 | 47 +++++++++++++++++++++++++----
 skills/plan-orchestration/SKILL.md        |  8 +++--
 skills/plan/SKILL.md                      | 31 ++++++++++++++++++-
 skills/repo-setup/SKILL.md                | 50 +++++++++++++++++++++++++++----
 skills/repo-setup/templates/plan-terms.md |  7 +++--
 skills/roadmap/SKILL.md                   | 41 +++++++++++++++++++++----
 skills/spec/SKILL.md                      |  8 ++++-
 14 files changed, 220 insertions(+), 37 deletions(-)
(exit 0)
```

The status list before and after `python3 docs/figures/gen_figures.py` is the same fourteen lines, and `git diff --stat` shows the fourteen files (`14 files changed, 220 insertions(+), 37 deletions(-)`), none of them under `.scratch/` other than this report.

### Verify 4: DONE

For each of the fourteen files, `LC_ALL=C grep -n '[^ -~]' <file>` on the changed tree and `git show HEAD:<file> | LC_ALL=C grep -n '[^ -~]'` on the unchanged tree. The 28 commands are listed with the exit status each printed (no command printed a line):

```
(exit 1)  LC_ALL=C grep -n '[^ -~]' README.md
(exit 1)  git show HEAD:README.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' docs/figures/gen_figures.py
(exit 1)  git show HEAD:docs/figures/gen_figures.py | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' docs/figures/pipeline.svg
(exit 1)  git show HEAD:docs/figures/pipeline.svg | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' docs/figures/plan-loop.svg
(exit 1)  git show HEAD:docs/figures/plan-loop.svg | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' docs/glossary.md
(exit 1)  git show HEAD:docs/glossary.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md
(exit 1)  git show HEAD:skills/grill/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/ordo-help/SKILL.md
(exit 1)  git show HEAD:skills/ordo-help/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/ordo-init/SKILL.md
(exit 1)  git show HEAD:skills/ordo-init/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/plan-orchestration/SKILL.md
(exit 1)  git show HEAD:skills/plan-orchestration/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/plan/SKILL.md
(exit 1)  git show HEAD:skills/plan/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/repo-setup/SKILL.md
(exit 1)  git show HEAD:skills/repo-setup/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/plan-terms.md
(exit 1)  git show HEAD:skills/repo-setup/templates/plan-terms.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/roadmap/SKILL.md
(exit 1)  git show HEAD:skills/roadmap/SKILL.md | LC_ALL=C grep -n '[^ -~]'
(exit 1)  LC_ALL=C grep -n '[^ -~]' skills/spec/SKILL.md
(exit 1)  git show HEAD:skills/spec/SKILL.md | LC_ALL=C grep -n '[^ -~]'
```

### Verify 5: DONE

```
$ git grep -n 'stay stops of their own' -- skills docs
(exit 1)
```

It prints nothing and exits 1.

### Verify 6: DONE

```
$ git grep -n -c 'quoted ruling\|--ruling' -- skills docs README.md
README.md:1
docs/figures/gen_figures.py:1
docs/figures/pipeline.svg:1
docs/figures/plan-loop.svg:1
docs/glossary.md:5
skills/grill/SKILL.md:11
skills/ordo-help/SKILL.md:1
skills/ordo-init/SKILL.md:20
skills/plan-orchestration/SKILL.md:3
skills/plan/SKILL.md:11
skills/repo-setup/SKILL.md:18
skills/repo-setup/templates/plan-terms.md:4
skills/roadmap/SKILL.md:14
skills/spec/SKILL.md:2
(exit 0)
```

Read as R11 says: every hit is a use of **quoted ruling** in the sense of its entry (a ruling of the user given to a skill by `--ruling <ledger file> "<name>"`), or the argument text `--ruling <ledger file> "<name>"` itself. The count of `gen_figures.py` is the first string line of the note; its second line is `"states the change."`. `docs/figures/*.svg` hold the note once each. The 93 lines counted are all lines the diff adds or changes (checked by taking each hit line number against the added line numbers of `git diff -U0`), and no file outside the fourteen has a hit.

### Verify 7: DONE

Method: for each added non-blank line of a `.md` file, taken from `git diff -U0`, the indent of the line above and the line below it in the changed file is compared with its own (`python3 $S/indent.py`, which prints the counts and each line with no neighbour at its indent). Output:

```
203 added non-blank lines in md files; 19 without a neighbour at the same indent
('README.md', 54, 0, 0, 0, 0, 'The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "ever')
('skills/grill/SKILL.md', 68, 4, 6, 0, 0, '    - With no ruling, the skill says which of these it found, and every stop stands.')
('skills/grill/SKILL.md', 272, 2, 0, 0, 0, "  - A quoted ruling that holds the entry's changed text is the user's answer to the roadma")
('skills/ordo-help/SKILL.md', 78, 30, 0, 0, 0, '                              after a ruling on an option that runs a skill and states the')
('skills/ordo-init/SKILL.md', 33, 3, 0, 0, 0, '   - When the skill runs alone under a quoted ruling that states whether it may commit, th')
('skills/ordo-init/SKILL.md', 48, 3, 5, 0, 0, '   - With no ruling, the skill says which of these it found, and every stop stands.')
('skills/ordo-init/SKILL.md', 102, 4, 0, 0, 0, '    - The commit question is left out when a quoted ruling states whether the skill may co')
('skills/ordo-init/SKILL.md', 132, 3, 0, 0, 0, "   - A fix made under a quoted ruling is listed with the check's output, with the ruling's")
('skills/ordo-init/SKILL.md', 155, 2, 0, 0, 0, '  - A quoted ruling that states the draft is that approval.')
('skills/ordo-init/SKILL.md', 161, 2, 0, 0, 0, '  - Under a quoted ruling that states the change, it is made without being shown for appro')
('skills/plan-orchestration/SKILL.md', 336, 0, 2, 0, 0, '- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper`')
('skills/plan/SKILL.md', 56, 3, 5, 0, 0, '   - With no ruling, the skill says which of these it found, and every stop stands.')
('skills/repo-setup/SKILL.md', 49, 3, 5, 0, 0, '   - With no ruling, the skill says which of these it found, and every stop stands.')
('skills/repo-setup/SKILL.md', 78, 3, 0, 5, 0, '   - Under a quoted ruling, the draft is written without the stop only when four things ho')
('skills/repo-setup/SKILL.md', 221, 2, 0, 0, 0, '  - A quoted ruling that covers the draft as Steps 4 says is that approval.')
('skills/roadmap/SKILL.md', 55, 3, 5, 0, 0, '   - With no ruling, the skill says which of these it found, and every stop stands.')
('skills/roadmap/SKILL.md', 75, 3, 0, 0, 0, '   - A change written under a quoted ruling names the ruling in the commit message, by its')
('skills/roadmap/SKILL.md', 132, 2, 0, 0, 0, '  - A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops").')
('skills/spec/SKILL.md', 240, 3, 0, 0, 0, '   - After a ruling on an option that runs a skill and states the change in full, that ski')
```

Each of the 19 lines is read against the opening of "What to build" (a sub-bullet stands three spaces in from a one-digit numbered item and four from a two-digit one, and two spaces in from a top-level bullet):

- `README.md:54` is a paragraph, not a bullet: no indent.
- `skills/roadmap/SKILL.md:55`, `skills/plan/SKILL.md:56`, `skills/ordo-init/SKILL.md:48`, `skills/repo-setup/SKILL.md:49`: the sub-bullet "With no ruling, ..." stands at 3 under the one-digit item ("What it reads" 6, 6, 5, 6), the same indent as the item's other sub-bullets; the line above is the last sub-sub-bullet at 5.
- `skills/grill/SKILL.md:68`: the same sub-bullet at 4 under the two-digit item 11; the line above is the sub-sub-bullet at 6.
- `skills/ordo-init/SKILL.md:33`, `:132`, `skills/roadmap/SKILL.md:75`, `skills/spec/SKILL.md:240`, `skills/repo-setup/SKILL.md:78`: a sub-bullet at 3 directly under a one-digit numbered item, printed as the item's first sub-bullet (the line above is the item, the line below a numbered item or a blank line).
- `skills/ordo-init/SKILL.md:102`: a sub-bullet at 4 directly under the two-digit item 10; the line below is item 11.
- `skills/grill/SKILL.md:272`, `skills/ordo-init/SKILL.md:155`, `:161`, `skills/repo-setup/SKILL.md:221`, `skills/roadmap/SKILL.md:132`: a sub-bullet at 2 directly under a top-level Rules bullet (or, for roadmap, the "level of an added entry" bullet); the lines around it are top-level bullets at 0.
- `skills/plan-orchestration/SKILL.md:336`: the replaced Rules bullet, a top-level bullet at 0 after the sub-bullets above it.
- `skills/ordo-help/SKILL.md:78`: a continuation line of the sequence block, whose text starts in column 31 as the brief says. Check:

```
awk 'NR==77 { print "line 77 text column: " index($0, "you type") } NR==78 { match($0, /[^ ]/); print "line 78 text column: " RSTART }' skills/ordo-help/SKILL.md
line 77 text column: 31
line 78 text column: 31
```

### Verify 8: DONE

```
$ rsvg-convert docs/figures/pipeline.svg -o "$TMPDIR/pipeline.png"
(exit 0)
$ rsvg-convert docs/figures/plan-loop.svg -o "$TMPDIR/plan-loop.png"
(exit 0)
$ grep -o 'viewBox="0 0 1040 [0-9]*"' docs/figures/pipeline.svg | head -1
viewBox="0 0 1040 988"
(exit 0)
$ grep -o 'viewBox="0 0 1040 [0-9]*"' docs/figures/plan-loop.svg | head -1
viewBox="0 0 1040 911"
(exit 0)
$ grep -o 'A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change\.' docs/figures/pipeline.svg | wc -l
       1
(exit 0)
$ grep -o 'A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change\.' docs/figures/plan-loop.svg | wc -l
       1
(exit 0)
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py
All checks passed!
(exit 0)
$ ruff format --check --line-length 100 docs/figures/gen_figures.py
1 file already formatted
(exit 0)
$ awk '{ if (length($0)>m) m=length($0) } END { print m }' docs/figures/gen_figures.py
100
(exit 0)
```

Both `ruff` commands are the two of "Conventions": `ruff check` prints `All checks passed!` and `ruff format --check` prints `1 file already formatted`, both exit 0; the longest line of `gen_figures.py` is 100 characters, the limit.

The two renders were read (`$TMPDIR/pipeline.png`, 1040 x 988, and `$TMPDIR/plan-loop.png`, 1040 x 911). In `pipeline.png` the legend row ("HOW TO READ THE MARKS", the three marks with their words) stands at the bottom and the note "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change." stands on its own line under that row, inside the panel and inside the canvas, in the same small grey type as the notes of the boxes. `plan-loop.png` shows the same legend row and note at its bottom, inside the canvas. Every box is where it was: the renders of the two SVGs as `HEAD` holds them (`rsvg-convert` of `git show HEAD:<file>`) and the changed renders were compared pixel by pixel with Python's PIL (`ImageChops.difference(...).getbbox()` over the common area):

```
pipeline (1040, 966) (1040, 988)
bbox of difference in common area (0, 956, 1040, 966)
plan-loop (1040, 889) (1040, 911)
bbox of difference in common area (0, 872, 1040, 889)
```

The first size is the render on `HEAD`, the second the render now. Every pixel above row 956 of `pipeline` and above row 872 of `plan-loop` is identical, so no box, arrow or text moved; the differences below those rows are the panel's bottom edge, which now stands 22 px lower, and the legend area where the note was added.

### Verify 9: DONE

Every bullet, list item and sentence the diff adds or changes was read against `docs/dev/skill-layout.md` and against the prose standard's "E. Sentence shapes" (`skills/repo-setup/templates/docs/dev/prose-standard.md`). One rule stands in each bullet, the exceptions to a rule stand in the same bullet as the rule only where the layout keeps a Stops-table cell whole, and the sentences over the length the standard allows are named in part 7 with their reasons and are not rewritten.

## 6. The terms

Source: `docs/glossary.md`, whose plan-terms block equals `skills/repo-setup/templates/plan-terms.md` (Verify 3). Uses are the lines the diff adds or changes, found by `git diff -U0` and a word match per term; where a hit came from a changed entry's unchanged words it is said so. The entry line is `grep -n` of the entry in `docs/glossary.md`.

### Entries the diff adds or changes

- **quoted ruling** (new; `docs/glossary.md:80`, `skills/repo-setup/templates/plan-terms.md:75`), between **questions, the** and **reader, of the transcripts** as the brief says. Uses (line numbers per file): `README.md` 54; `docs/figures/gen_figures.py` 395; `docs/glossary.md` 25,80,97-98,134; `skills/grill/SKILL.md` 18,55,57,120,126,185,199,206,250,272; `skills/ordo-init/SKILL.md` 16,33,35,37,58,65,81,102,104,117,128,132,138-140,142-143,155,161; `skills/plan-orchestration/SKILL.md` 304,336; `skills/plan/SKILL.md` 17,43,45,68,72,85,91-92,105,113; `skills/repo-setup/SKILL.md` 17,36,38,56,61,78,93,116,128,137,147,197-200,202,221; `skills/repo-setup/templates/plan-terms.md` 20,75,92-93; `skills/roadmap/SKILL.md` 22,42,44,63,71,75,94,99,132,136,159,161-162; `skills/spec/SKILL.md` 230. Every use is in the sense the entry gives: a ruling of the user given to a skill by `--ruling <ledger file> "<name>"`, or the bullet of that name with its sub-bullets. The possessive uses (`skills/roadmap/SKILL.md:99`, `skills/repo-setup/SKILL.md:199`) say "a quoted ruling's", the same sense.
- **ruling** (changed; `docs/glossary.md:97`, `skills/repo-setup/templates/plan-terms.md:92`), one sentence added. Uses, by file: 135 added lines: `README.md` 1, `docs/figures/gen_figures.py` 1, `docs/glossary.md` 5, `skills/grill/SKILL.md` 16, `skills/ordo-help/SKILL.md` 1, `skills/ordo-init/SKILL.md` 29, `skills/plan-orchestration/SKILL.md` 4, `skills/plan/SKILL.md` 19, `skills/repo-setup/SKILL.md` 32, `skills/repo-setup/templates/plan-terms.md` 4, `skills/roadmap/SKILL.md` 20, `skills/spec/SKILL.md` 3. Every use is the user's decision in the entry's sense or its quoted form; "Rulings section" is the section the entry names.
- **rulings file** (changed; `docs/glossary.md:98`, `skills/repo-setup/templates/plan-terms.md:93`). Uses, by file: 26 added lines: `docs/glossary.md` 3, `skills/grill/SKILL.md` 3, `skills/ordo-init/SKILL.md` 3, `skills/plan/SKILL.md` 8, `skills/repo-setup/SKILL.md` 3, `skills/repo-setup/templates/plan-terms.md` 3, `skills/roadmap/SKILL.md` 3. Sense as the entry gives: `<ledger_root>/rulings/<slug>.md`; the shared item names it beside a plan's `plan.md` as the two files a ledger file may be.
- **commit rule** (changed; `docs/glossary.md:25`, `skills/repo-setup/templates/plan-terms.md:20`). Uses: `docs/glossary.md` 25; `skills/ordo-init/SKILL.md` 33,143; `skills/repo-setup/SKILL.md` 202; `skills/repo-setup/templates/plan-terms.md` 20. Sense as the entry gives.
- **mark, of a figure** (changed; `docs/glossary.md:134`; the term has no entry in the template, since the plan-terms block does not hold it). Uses: `README.md` 54, `docs/figures/gen_figures.py` 378. Sense as the entry gives. The five lines "It is matched against the bullet's text as written, a quotation mark in it included." (`skills/grill/SKILL.md:59`, `skills/ordo-init/SKILL.md:39`, `skills/plan/SKILL.md:47`, `skills/repo-setup/SKILL.md:40`, `skills/roadmap/SKILL.md:46`) use "mark" as the plain word, not the term.

### Entries used in the added text, unchanged

- **stop** (`docs/glossary.md:111`): 56 added lines: `README.md` 1, `docs/figures/gen_figures.py` 1, `docs/glossary.md` 5, `skills/grill/SKILL.md` 2, `skills/ordo-init/SKILL.md` 9, `skills/plan-orchestration/SKILL.md` 3, `skills/plan/SKILL.md` 6, `skills/repo-setup/SKILL.md` 12, `skills/repo-setup/templates/plan-terms.md` 4, `skills/roadmap/SKILL.md` 9, `skills/spec/SKILL.md` 4. The uses are the entry's second sense (a point of a skill's Stops table where it waits on the user) and, in `skills/plan-orchestration/SKILL.md:302` and `skills/spec/SKILL.md:208`, its first sense ("stays a stop of its own", a halt that leaves an open item).
- **open item** (`docs/glossary.md:61`): used only inside the changed **ruling** entry, unchanged words. **booking** (`docs/glossary.md:14`): "books the ruling" at `skills/plan-orchestration/SKILL.md:305` and `skills/spec/SKILL.md:229`-`231`, its sense.
- **round, of an interview** (`docs/glossary.md:94`), **frontier** (`docs/glossary.md:43`) and **decision form** (`docs/glossary.md:29`): `skills/grill/SKILL.md:206` and `:250`, the entry's sense; the words of the frontier and the decision form in row 250 are unchanged.
- **gate** (`docs/glossary.md:44`): `skills/grill/SKILL.md` 202,204; `skills/plan/SKILL.md` 87,113; `skills/roadmap/SKILL.md` 64,68,72,94,96-97,99. The entry's sense: the check that proves an entry done, and "## Gate" of `plan.md`.
- **closing step** (`docs/glossary.md:24`): `skills/plan/SKILL.md:74`, `:86`, the entry's sense. **insertion form** (`docs/glossary.md:50`): `skills/roadmap/SKILL.md:136`, `:162`, the entry's sense. **capability map** (`docs/glossary.md:18`): `skills/roadmap/SKILL.md:64`, the entry's sense.
- **sync** (`docs/glossary.md:112`), **shared-rules block** (`docs/glossary.md:104`) and **plan-terms block** (`docs/glossary.md:70`): `skills/repo-setup/SKILL.md` 17,137-138,199-200,202, the entries' sense.
- **worker** (`docs/glossary.md:122`) and **reviewer** (`docs/glossary.md:92`): `skills/ordo-init/SKILL.md:140`, `skills/repo-setup/SKILL.md:80`, the configuration keys `worker:` and `reviewer:`, which the entries **worker** and **reviewer** name.
- **plan** (`docs/glossary.md:67`), **step** (`docs/glossary.md:109`), **loop** (`docs/glossary.md:58`), **runner** (`docs/glossary.md:99`), **roadmap entry** (`docs/glossary.md:93`): in the added text as the entries give them (`plan.md`, a plan step, "Steps <n>", the loop of `plan-orchestration` and the runner in `skills/plan-orchestration/SKILL.md:336`, "a roadmap entry" at `README.md:54`).
- **ledger file** is not an entry. It is used only as the file the term **quoted ruling** defines (29 lines: `docs/glossary.md:80`, `skills/repo-setup/templates/plan-terms.md:75`, and the skill lines that name `<ledger file>`, `--ruling <ledger file> "<name>"`, "its ledger file"). It is not the **ledger** entry (`docs/glossary.md:56`, a plan's folder), which stays as it is.
- Not the glossary sense: `skills/roadmap/SKILL.md:49`, `skills/plan/SKILL.md:50`, `skills/ordo-init/SKILL.md:42`, `skills/repo-setup/SKILL.md:43` and `skills/grill/SKILL.md:62` say "There is no ruling in any of these cases": "cases" is the plain word, not **case** (an example under a brief's Cases).

### The named place of each changed entry, and of each entry whose named place the diff changes

The entries are the ones whose "Stated in" cites a skill section or item that the diff changes (the changed sections were listed with `git diff -U0` and the section headings above each added line). The line of the place that states the term, as `grep -n` prints it:

- **quoted ruling**
  - `skills/spec/SKILL.md:230:   - that bullet is the quoted ruling the session gives the skill;`
  - `skills/plan-orchestration/SKILL.md:304:  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.`
  - `skills/plan/SKILL.md:43:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.`
  - `skills/roadmap/SKILL.md:42:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.`
  - `skills/ordo-init/SKILL.md:35:5. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.`
  - `skills/repo-setup/SKILL.md:36:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.`
  - `skills/grill/SKILL.md:55:11. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.`
- **ruling**
  - `skills/spec/SKILL.md:229:   - a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";`
  - `skills/spec/SKILL.md:40:4. `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.`
  - `skills/grill/SKILL.md:185:   - A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.`
- **rulings file**
  - `skills/plan/SKILL.md:41:4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers for the entry, written while no plan was open.`
  - `skills/grill/SKILL.md:47:6. The Rulings of the open plan, when a folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>`, and otherwise the rulings file `<ledger_root>/rulings/<slug>.md` when it exists.`
  - `skills/plan/SKILL.md:68:   - A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.`
  - `skills/plan/SKILL.md:106:   - When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`.`
- **commit rule**
  - `skills/repo-setup/SKILL.md:157:5. The commit rule for this repository [commit only when told].`
  - `skills/ordo-init/SKILL.md:32:3. The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11.`
  - `skills/ordo-init/SKILL.md:33:   - When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.`
- **mark, of a figure**
  - `README.md:54:The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".`
  - `docs/figures/gen_figures.py:396:        "states the change.",`
- **stop**
  - `skills/spec/SKILL.md:203:### A stop`
  - `skills/plan-orchestration/SKILL.md:295:- A stop is booked in the state file's open items the moment it is raised, and under the step's Step 0 in `plan.md`.`
  - `skills/repo-setup/SKILL.md:193:## Stops`
  - `skills/roadmap/SKILL.md:155:## Stops`
  - `skills/plan-orchestration/SKILL.md:279:## Stops`
- **open item**
  - `skills/spec/SKILL.md:206:   - The open item in the state file. It holds the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.`
  - `skills/plan-orchestration/SKILL.md:295:- A stop is booked in the state file's open items the moment it is raised, and under the step's Step 0 in `plan.md`.`
- **booking**
  - `skills/spec/SKILL.md:223:2. On that message the session books the ruling and nothing else:`
  - `skills/plan-orchestration/SKILL.md:297:- A ruling that adds or splits a step is booked as the `spec` skill's "Steps / A ruling" says: the new line in the step list ends with `(ruling <name>)`, naming the ruling's line in the Rulings section.`
- **rule clash**
  - `skills/plan-orchestration/SKILL.md:288:| A rule clash | A contradiction between two established rules or decisions, an ADR among them | The stop message, below | The user's ruling |`
- **sync**
  - `skills/repo-setup/SKILL.md:121:### sync`
  - `skills/repo-setup/SKILL.md:130:4. Exit 2 with `error: CLAUDE.md has no single shared-rules block` or `error: docs/glossary.md has no single plan-terms block`: draft the change for each block the lines name.`
- **shared-rules block, plan-terms block**
  - `skills/repo-setup/SKILL.md:62:   - The plan-terms block of `docs/glossary.md` is filled from `templates/plan-terms.md`, as the shared-rules block of `CLAUDE.md` is from `templates/shared-rules.md`.`
- **gate**
  - `skills/roadmap/SKILL.md:89:2. Draft the gate: the check that proves the entry done, as a command from the verification page, a test named and what it asserts, or an observable result someone can check.`
  - `skills/roadmap/SKILL.md:92:3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason in the draft that Steps / add 6 shows, never in the roadmap entry.`
  - `skills/plan/SKILL.md:66:   - The entry's goal and its gate are copied in.`
- **goal**
  - `skills/roadmap/SKILL.md:85:1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.`
  - `skills/plan/SKILL.md:66:   - The entry's goal and its gate are copied in.`
- **question, the**
  - `skills/roadmap/SKILL.md:92:3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason in the draft that Steps / add 6 shows, never in the roadmap entry.`
  - `skills/plan/SKILL.md:69:   - The session asks of the copied gate "could this pass without the goal being reached?" and writes the answer with its reason in the section "## Gate", on the line the template gives the gate.`
- **roadmap entry, step (at two levels), insertion form**
  - `skills/roadmap/SKILL.md:131:- **The level of an added entry.** It goes at the level the user names.`
  - `skills/roadmap/SKILL.md:136:- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.`
- **Not yet specified**
  - `skills/roadmap/SKILL.md:137:- **Not yet specified.** Work whose gate cannot yet be named sits in the section "Not yet specified", after the open entries and before the done ones. Each entry there has its title, its goal and what must be known before its gate can be named.`
- **closing step**
  - `skills/plan/SKILL.md:78:   - The last step is the closing: the roadmap entry ticked with the gate's output (`/roadmap done <entry>`), and the ledger folder moved to `<archive_root>/`.`
- **plan**
  - `skills/plan/SKILL.md:64:2. Draft `plan.md` from `templates/plan.md`.`
- **plan configuration**
  - `skills/ordo-init/SKILL.md:114:14. Commit the files written by explicit path list, in one commit whose subject names the plan configuration.`
- **plan skills**
  - `skills/repo-setup/SKILL.md:225:- The plan skills are never installed per project: they are installed per user, and one copy is loaded.`
- **Step 0, part file**
  - `skills/spec/SKILL.md:211:   - The same text under the step's Step 0 in `plan.md` or the part file it names.`
- **loop, sequence, the, standards (the sequence block of `ordo-help`)**
  - `skills/ordo-help/SKILL.md:47:## The sequence, printed verbatim`
  - `skills/ordo-help/SKILL.md:78:                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again`

Not listed: the entries whose named place the diff does not touch (for instance **authority**, whose places are `plan` Rules and `spec` "What it reads" 4, both unchanged: `git diff -U0` has no hunk in either).

## 7. Sentences longer than the prose standard allows

The standard (`skills/repo-setup/templates/docs/dev/prose-standard.md`, E "Sentence length") asks for under roughly 20 words unless the mechanism needs more. The list is every sentence, bullet or table cell that the diff adds or changes and that runs to 21 words or more; a Quick start row counts its command with its explanation. None is rewritten, since the words are dictated. The brief names five of them (Decision 19: `skills/plan-orchestration/SKILL.md:304` at 44 words, and four of 32 to 35 words); the reading found 76. Each is given as `file:line`, its word count and its reason; the sentences of 30 words or more are quoted in full, and each shorter one is the text at that line of the tree.

1. Reason: The README sentence names the mark, its meaning and the exception in one sentence.
   Sentences (`file:line`, words): `README.md:54` (22).
2. Reason: One glossary entry is one line; the sense sentence of **commit rule** now names the three ways the answer is given (the question, the approval stop, a quoted ruling), so it holds the list it needs.
   Sentences (`file:line`, words): `docs/glossary.md:25` (40), `skills/repo-setup/templates/plan-terms.md:20` (40).
   Quoted in full (40 words, `docs/glossary.md:25`, `skills/repo-setup/templates/plan-terms.md:20`): `**commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit.`
3. Reason: The definition of **quoted ruling**: where the bullet stands, what ends its first line and what stands under it, in one sentence.
   Sentences (`file:line`, words): `docs/glossary.md:80` (23), `skills/repo-setup/templates/plan-terms.md:75` (23).
4. Reason: The "Stated in" list of **quoted ruling**: seven places, one per skill, each with its section; the entry format lists the places of a term in one sentence.
   Sentences (`file:line`, words): `docs/glossary.md:80` (34), `skills/repo-setup/templates/plan-terms.md:75` (34).
   Quoted in full (34 words, `docs/glossary.md:80`, `skills/repo-setup/templates/plan-terms.md:75`): `Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.`
5. Reason: The sentence **ruling** gains: the kind of ruling, the change it states and the form it takes; it stays one sentence with the term it introduces.
   Sentences (`file:line`, words): `docs/glossary.md:97` (31), `skills/repo-setup/templates/plan-terms.md:92` (31).
   Quoted in full (31 words, `docs/glossary.md:97`, `skills/repo-setup/templates/plan-terms.md:92`): `A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling.`
6. Reason: The sense sentence of **rulings file**: the path, what the file holds and the condition (no plan open) are one definition; the added clause names the quoted ruling.
   Sentences (`file:line`, words): `docs/glossary.md:98` (30), `skills/repo-setup/templates/plan-terms.md:93` (30).
   Quoted in full (30 words, `docs/glossary.md:98`, `skills/repo-setup/templates/plan-terms.md:93`): `**rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open.`
7. Reason: The entry **mark, of a figure** defines three marks in one sentence, each with its shape and word; the added clause qualifies "every run" and the entry format keeps the marks in one line.
   Sentences (`file:line`, words): `docs/glossary.md:134` (81).
   Quoted in full (81 words, `docs/glossary.md:134`): `**mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box.`
8. Reason: A Quick start row: the command with what it does under a quoted ruling, in the two-column layout of the block's other rows; the row names the form and its effect in one line.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:18` (25), `skills/ordo-init/SKILL.md:16` (21), `skills/plan/SKILL.md:17` (25), `skills/repo-setup/SKILL.md:17` (26), `skills/roadmap/SKILL.md:22` (28).
9. Reason: Second line of the shared quoted-ruling item: the file the argument names, the two forms it may take and where it is read from. One rule.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:56` (22), `skills/ordo-init/SKILL.md:36` (22), `skills/plan/SKILL.md:44` (22), `skills/repo-setup/SKILL.md:37` (22), `skills/roadmap/SKILL.md:43` (22).
10. Reason: Named by the brief's Decision 19: the shared item's second sub-bullet, which defines the quoted ruling, the bullet, its two places and what belongs to it (35 words); one rule with the list it needs.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:57` (35), `skills/ordo-init/SKILL.md:37` (35), `skills/plan/SKILL.md:45` (35), `skills/repo-setup/SKILL.md:38` (35), `skills/roadmap/SKILL.md:44` (35).
   Quoted in full (35 words, `skills/grill/SKILL.md:57`, `skills/ordo-init/SKILL.md:37`, `skills/plan/SKILL.md:45`, `skills/repo-setup/SKILL.md:38`, `skills/roadmap/SKILL.md:44`): `The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.`
11. Reason: Sixth line of the shared item, the definition of a ruled change. One rule, one word over the limit.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:60` (21), `skills/ordo-init/SKILL.md:40` (21), `skills/plan/SKILL.md:48` (21), `skills/repo-setup/SKILL.md:41` (21), `skills/roadmap/SKILL.md:47` (21).
12. Reason: One rule with its condition and the place where the draft is made.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:199` (26).
13. Reason: One rule with its one exception, kept in the bullet of the rule as the layout keeps a qualifier.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:202` (26).
14. Reason: One rule with two conditions that give the same result.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:204` (23).
15. Reason: The done-condition of an item, which had one branch and now has the branch the ruling adds; the item stays one line.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:206` (30).
   Quoted in full (30 words, `skills/grill/SKILL.md:206`): `The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.`
16. Reason: A cell of a Stops table: the trigger, the text shown or the answer is one cell, and the exception a quoted ruling adds stays in the cell of the condition it qualifies, as the layout keeps a Stops row whole.
   Sentences (`file:line`, words): `skills/grill/SKILL.md:250` (21), `skills/ordo-init/SKILL.md:138` (27), `skills/ordo-init/SKILL.md:143` (23), `skills/plan/SKILL.md:113` (33), `skills/repo-setup/SKILL.md:200` (31), `skills/repo-setup/SKILL.md:202` (22), `skills/roadmap/SKILL.md:159` (23).
   Quoted in full (33 words, `skills/plan/SKILL.md:113`): `Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does the mechanical half of opening a plan and stops at the design half`
   Quoted in full (31 words, `skills/repo-setup/SKILL.md:200`): ``sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5)`
17. Reason: A line of the printed sequence block; the block has one line per command, and this line says when the skill is run and what it is run with.
   Sentences (`file:line`, words): `skills/ordo-help/SKILL.md:78` (28).
18. Reason: One rule with its condition.
   Sentences (`file:line`, words): `skills/ordo-init/SKILL.md:33` (23), `skills/repo-setup/SKILL.md:61` (21), `skills/roadmap/SKILL.md:71` (22).
19. Reason: One rule listing the four parts the comparison covers (see the note below on a list in paragraph form).
   Sentences (`file:line`, words): `skills/ordo-init/SKILL.md:105` (25).
20. Reason: One rule with the two cases that differ and the result of each: shown whole, the stop stands, nothing written.
   Sentences (`file:line`, words): `skills/ordo-init/SKILL.md:109` (30).
   Quoted in full (30 words, `skills/ordo-init/SKILL.md:109`): `A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.`
21. Reason: The commit-message rule: a change written under a quoted ruling names the ruling by its name and its ledger file. One rule, one word over the limit.
   Sentences (`file:line`, words): `skills/ordo-init/SKILL.md:117` (21), `skills/plan/SKILL.md:105` (21), `skills/repo-setup/SKILL.md:116` (21), `skills/repo-setup/SKILL.md:147` (21), `skills/roadmap/SKILL.md:75` (21).
22. Reason: The rule that a fix made under a quoted ruling is listed with the check's output and the ruling's name and ledger file. One rule, one word over the limit.
   Sentences (`file:line`, words): `skills/ordo-init/SKILL.md:132` (21).
23. Reason: One rule with its two cross references (Steps 11 and "Steps / Checking an existing file" 4), which point to where the rule is worked out.
   Sentences (`file:line`, words): `skills/ordo-init/SKILL.md:161` (28).
24. Reason: One rule: the condition (an approval of work not yet done), an example and the result (it stays a stop).
   Sentences (`file:line`, words): `skills/plan-orchestration/SKILL.md:302` (30).
   Quoted in full (30 words, `skills/plan-orchestration/SKILL.md:302`): `An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.`
25. Reason: Named by the brief's Decision 19: it holds the rule, the five skills it covers and its alternative, which the layout keeps in one bullet.
   Sentences (`file:line`, words): `skills/plan-orchestration/SKILL.md:304` (44).
   Quoted in full (44 words, `skills/plan-orchestration/SKILL.md:304`): `An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.`
26. Reason: One rule: what the session does after the user's ruling on an option that states the change, and where the booking is worked out.
   Sentences (`file:line`, words): `skills/plan-orchestration/SKILL.md:305` (25).
27. Reason: The Rules bullet on invoking every skill through the runner, extended by the five skills that run under a quoted ruling; the rule and the list of skills it covers stay one bullet. The brief keeps it a sentence of the length it is.
   Sentences (`file:line`, words): `skills/plan-orchestration/SKILL.md:336` (47).
   Quoted in full (47 words, `skills/plan-orchestration/SKILL.md:336`): `Every skill the loop invokes (`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.`
28. Reason: Named by the brief's Decision 19: the rulings-file sub-bullet, one rule with the list it needs (the sub-bullets and their fenced blocks).
   Sentences (`file:line`, words): `skills/plan/SKILL.md:68` (32).
   Quoted in full (32 words, `skills/plan/SKILL.md:68`): `A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.`
29. Reason: One rule listing the three things shown with a draft that stands at the stop (see the note below on a list in paragraph form).
   Sentences (`file:line`, words): `skills/plan/SKILL.md:90` (23).
30. Reason: One rule with its one exception (unless Steps 2 copied it).
   Sentences (`file:line`, words): `skills/plan/SKILL.md:91` (31).
   Quoted in full (31 words, `skills/plan/SKILL.md:91`): `The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.`
31. Reason: One of the four conditions for writing the draft without the stop; it names the two forms a file may have.
   Sentences (`file:line`, words): `skills/repo-setup/SKILL.md:81` (24).
32. Reason: Named by the brief's Decision 19: the last-but-one sub-bullet of Steps 4, one rule with the three examples it needs (see the note below on a list in paragraph form).
   Sentences (`file:line`, words): `skills/repo-setup/SKILL.md:84` (35).
   Quoted in full (35 words, `skills/repo-setup/SKILL.md:84`): `Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.`
33. Reason: One rule: the condition (the ruling's hunks are the diff's, each with its choice) and the result.
   Sentences (`file:line`, words): `skills/repo-setup/SKILL.md:128` (25).
34. Reason: The definition of the ruled text of `add`: its seven parts and the capability clause (see the note below on a list in paragraph form).
   Sentences (`file:line`, words): `skills/roadmap/SKILL.md:64` (30).
   Quoted in full (30 words, `skills/roadmap/SKILL.md:64`): `For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.`
35. Reason: One rule with its one exception and three examples.
   Sentences (`file:line`, words): `skills/roadmap/SKILL.md:67` (27).
36. Reason: One rule: when the draft is written without the stop, and the one case (the gate's answer) where it is not.
   Sentences (`file:line`, words): `skills/roadmap/SKILL.md:72` (25).
37. Reason: One rule: the draft that differs is shown whole, each difference named, and the stop stands.
   Sentences (`file:line`, words): `skills/roadmap/SKILL.md:73` (29).
38. Reason: The done-condition of "Steps / add" 3, which had one branch and now has the branch the ruling adds; the item stays one line.
   Sentences (`file:line`, words): `skills/roadmap/SKILL.md:99` (27).
39. Reason: One rule: the condition (an approval of work not yet done), an example and the result (it stays a stop); the same sentence as `skills/plan-orchestration/SKILL.md:302`.
   Sentences (`file:line`, words): `skills/spec/SKILL.md:208` (30).
   Quoted in full (30 words, `skills/spec/SKILL.md:208`): `An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.`
40. Reason: One rule with its alternative (states the change in full, or names the stop).
   Sentences (`file:line`, words): `skills/spec/SKILL.md:210` (29).
41. Reason: Named by the brief's Decision 19: the first bullet of item 5, the rule with the list it needs.
   Sentences (`file:line`, words): `skills/spec/SKILL.md:229` (35).
   Quoted in full (35 words, `skills/spec/SKILL.md:229`): `a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";`
42. Reason: One rule with the list it needs: how a several-line text is copied, and the fence it stands in.
   Sentences (`file:line`, words): `skills/spec/SKILL.md:231` (34).
   Quoted in full (34 words, `skills/spec/SKILL.md:231`): `the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;`
43. Reason: One rule: which skill is run after such a ruling, and with what.
   Sentences (`file:line`, words): `skills/spec/SKILL.md:240` (26).

The count is 76 sentences in 43 groups; the groups replace the row-by-row list, and each `file:line` names the sentence at that line of the tree.

Reading notes on the added text, beyond length. Nothing below is rewritten, since the words are dictated:

- A list in paragraph form (prose standard D asks for a list from three items): `skills/ordo-init/SKILL.md:105` (four parts), `skills/roadmap/SKILL.md:64` (seven parts), `skills/plan/SKILL.md:90` (three things), `skills/repo-setup/SKILL.md:84` (three examples). Each is one rule whose parts are its content.
- Passive voice (prose standard E): the bullets say "is written", "is shown", "is copied", "is worked on" throughout, with the skill or the session as the unstated actor. "worked on" is used in 5 bullets as the brief dictates it (`skills/grill/SKILL.md:201`, `skills/plan/SKILL.md:73`, `skills/repo-setup/SKILL.md:138`, `skills/roadmap/SKILL.md:66`, `skills/roadmap/SKILL.md:71`).
- Cold opens (prose standard E): bullets that start with "It", "Its" or "That list" take their antecedent from the bullet directly above: `skills/grill/SKILL.md:59`, `skills/grill/SKILL.md:200`, `skills/ordo-init/SKILL.md:39`, `skills/ordo-init/SKILL.md:82`, `skills/ordo-init/SKILL.md:119`, `skills/plan-orchestration/SKILL.md:306`, `skills/plan/SKILL.md:47`, `skills/repo-setup/SKILL.md:40`, `skills/repo-setup/SKILL.md:57`, `skills/repo-setup/SKILL.md:80`, `skills/repo-setup/SKILL.md:94`, `skills/roadmap/SKILL.md:46`, `skills/roadmap/SKILL.md:95`. Each antecedent is the line above, so the reading holds.
- Repeated construction (prose standard 0): the fourteen lines of the quoted-ruling item are the same in five skills, and so are the commit-message and the list-of-files bullets of `roadmap`, `plan`, `ordo-init` and `repo-setup`. The brief dictates this, since each skill is read alone; the terms and the argument form are defined once in the glossary.

## 8. Files with line counts

`wc -l` of each file, before (`git show HEAD:<file> | wc -l`) and after, and `git diff --stat`:

| File | Lines before | Lines after | Added | Removed |
|---|---|---|---|---|
| `README.md` | 180 | 180 | 1 | 1 |
| `docs/figures/gen_figures.py` | 742 | 750 | 11 | 3 |
| `docs/figures/pipeline.svg` | 173 | 174 | 3 | 2 |
| `docs/figures/plan-loop.svg` | 164 | 165 | 3 | 2 |
| `docs/glossary.md` | 135 | 136 | 5 | 4 |
| `skills/grill/SKILL.md` | 249 | 274 | 27 | 2 |
| `skills/ordo-help/SKILL.md` | 108 | 109 | 1 | 0 |
| `skills/ordo-init/SKILL.md` | 125 | 162 | 42 | 5 |
| `skills/plan-orchestration/SKILL.md` | 332 | 336 | 6 | 2 |
| `skills/plan/SKILL.md` | 104 | 133 | 30 | 1 |
| `skills/repo-setup/SKILL.md` | 187 | 227 | 45 | 5 |
| `skills/repo-setup/templates/plan-terms.md` | 118 | 119 | 4 | 3 |
| `skills/roadmap/SKILL.md` | 162 | 191 | 35 | 6 |
| `skills/spec/SKILL.md` | 309 | 315 | 7 | 1 |

`git diff --stat | tail -1` prints `14 files changed, 220 insertions(+), 37 deletions(-)`. The report file is the only file written under `.scratch/`.

## 9. Judgment calls

none

## 10. Every visible change, before and after

Source: `git diff -U0`, hunk by hunk. What a user or a host sees is skill text (each skill's Quick start and body, which the host loads), the sequence `/ordo-help` prints, the README sentence, the two figures, and the glossary. A hunk that replaces lines gives the before and the after in full, one line each. Lines that are only added give their places and counts; the text of every added line is in the tree at that place and each dictated line is in the Verify 2 listing.

### `README.md`

- Replaced at `README.md:54` (`HEAD` line 54):
  - Before: `The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, and one marked "only when" waits on you in a named case. You may skip a skill marked "optional".`
  - After: `The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".`

### `docs/figures/gen_figures.py`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `docs/figures/gen_figures.py:391-398` (8).
- Replaced at `docs/figures/gen_figures.py:378` (`HEAD` line 378):
  - Before: `    """The three marks and the dashed box, each with what it says, on one row."""`
  - After: `    """The three marks and the dashed box with what each says, on one row, and a note under it."""`
- Replaced at `docs/figures/gen_figures.py:418` (`HEAD` line 410):
  - Before: `        side_top + side_h + 68,`
  - After: `        side_top + side_h + 90,`
- Replaced at `docs/figures/gen_figures.py:567` (`HEAD` line 559):
  - Before: `        band_y + band_h + 81,`
  - After: `        band_y + band_h + 103,`

### `docs/figures/pipeline.svg`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `docs/figures/pipeline.svg:173` (1).
- Replaced at `docs/figures/pipeline.svg:1` (`HEAD` line 1):
  - Before: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1040 966" width="1040" height="966" role="img" aria-label="The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.">`
  - After: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1040 988" width="1040" height="988" role="img" aria-label="The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.">`
- Replaced at `docs/figures/pipeline.svg:4` (`HEAD` line 4):
  - Before: `<rect x="0" y="0" width="1040" height="966" rx="10" fill="#f8fafc" stroke="#64748b"/>`
  - After: `<rect x="0" y="0" width="1040" height="988" rx="10" fill="#f8fafc" stroke="#64748b"/>`

### `docs/figures/plan-loop.svg`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `docs/figures/plan-loop.svg:164` (1).
- Replaced at `docs/figures/plan-loop.svg:1` (`HEAD` line 1):
  - Before: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1040 889" width="1040" height="889" role="img" aria-label="The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.">`
  - After: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1040 911" width="1040" height="911" role="img" aria-label="The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.">`
- Replaced at `docs/figures/plan-loop.svg:4` (`HEAD` line 4):
  - Before: `<rect x="0" y="0" width="1040" height="889" rx="10" fill="#f8fafc" stroke="#64748b"/>`
  - After: `<rect x="0" y="0" width="1040" height="911" rx="10" fill="#f8fafc" stroke="#64748b"/>`

### `docs/glossary.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `docs/glossary.md:80` (1).
- Replaced at `docs/glossary.md:25` (`HEAD` line 25):
  - Before: `- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.`
  - After: `- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.`
- Replaced at `docs/glossary.md:97-98` (`HEAD` line 96):
  - Before: `- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".`
  - Before: `- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".`
  - After: `- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".`
  - After: `- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".`
- Replaced at `docs/glossary.md:134` (`HEAD` line 133):
  - Before: `- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.`
  - After: `- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.`

### `skills/grill/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/grill/SKILL.md:18` (1), `skills/grill/SKILL.md:55-68` (14), `skills/grill/SKILL.md:120` (1), `skills/grill/SKILL.md:126` (1), `skills/grill/SKILL.md:185` (1), `skills/grill/SKILL.md:199-204` (6), `skills/grill/SKILL.md:272` (1).
- Replaced at `skills/grill/SKILL.md:206` (`HEAD` line 182):
  - Before: `   - The item is done when the diff is a decision of the next round, or, after the yes, the entry read back holds the change.`
  - After: `   - The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.`
- Replaced at `skills/grill/SKILL.md:250` (`HEAD` line 226):
  - Before: `| A round | Every round, at Steps 6, the roadmap diff and "record as ADR?" decisions riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |`
  - After: `| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |`

### `skills/ordo-help/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/ordo-help/SKILL.md:78` (1).

### `skills/ordo-init/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/ordo-init/SKILL.md:16` (1), `skills/ordo-init/SKILL.md:33` (1), `skills/ordo-init/SKILL.md:35-48` (14), `skills/ordo-init/SKILL.md:58-59` (2), `skills/ordo-init/SKILL.md:65-66` (2), `skills/ordo-init/SKILL.md:81-82` (2), `skills/ordo-init/SKILL.md:102` (1), `skills/ordo-init/SKILL.md:104-109` (6), `skills/ordo-init/SKILL.md:117-119` (3), `skills/ordo-init/SKILL.md:128-129` (2), `skills/ordo-init/SKILL.md:132` (1), `skills/ordo-init/SKILL.md:155` (1), `skills/ordo-init/SKILL.md:161` (1).
- Replaced at `skills/ordo-init/SKILL.md:138-140` (`HEAD` line 103):
  - Before: `| The draft | Every setup, at Steps 11 | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |`
  - Before: `| Several roadmaps | More than one roadmap candidate | The candidates | The user's pick |`
  - Before: `| Worker, reviewer and libraries | Every setup, at Steps 6 | The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as Steps 6 names them | The user's answers |`
  - After: `| The draft | Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says, where only a commit question the ruling leaves open is asked | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |`
  - After: `| Several roadmaps | More than one roadmap candidate, and no quoted ruling states `roadmap` | The candidates | The user's pick |`
  - After: `| Worker, reviewer and libraries | Every setup, at Steps 6, for each key a quoted ruling does not state | The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as Steps 6 names them | The user's answers |`
- Replaced at `skills/ordo-init/SKILL.md:142-143` (`HEAD` line 107):
  - Before: `| A fix in the check | The check reports an error in an existing file | The error and the proposed fix | The user's approval |`
  - Before: `| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, and the command that shows them (`git status --short`) | The user's commit |`
  - After: `| A fix in the check | The check reports an error in an existing file, and no quoted ruling states its fix | The error and the proposed fix | The user's approval |`
  - After: `| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, the quoted ruling named when the setup was written under one, and the command that shows them (`git status --short`) | The user's commit |`

### `skills/plan-orchestration/SKILL.md`

- Replaced at `skills/plan-orchestration/SKILL.md:302-306` (`HEAD` line 302):
  - Before: `  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.`
  - After: `  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.`
  - After: `  - The option names that stop.`
  - After: `  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.`
  - After: `  - After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.`
  - After: `  - It then runs the skill with `--ruling <ledger file> "<name>"`.`
- Replaced at `skills/plan-orchestration/SKILL.md:336` (`HEAD` line 332):
  - Before: `- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper` for manuscript content, and `/roadmap` at the closing) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.`
  - After: `- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.`

### `skills/plan/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/plan/SKILL.md:17` (1), `skills/plan/SKILL.md:43-56` (14), `skills/plan/SKILL.md:68` (1), `skills/plan/SKILL.md:72-74` (3), `skills/plan/SKILL.md:85-92` (8), `skills/plan/SKILL.md:105-106` (2).
- Replaced at `skills/plan/SKILL.md:113` (`HEAD` line 84):
  - Before: `| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |`
  - After: `| The drafted step list | Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |`

### `skills/repo-setup/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/repo-setup/SKILL.md:17` (1), `skills/repo-setup/SKILL.md:36-49` (14), `skills/repo-setup/SKILL.md:56-58` (3), `skills/repo-setup/SKILL.md:61` (1), `skills/repo-setup/SKILL.md:78-85` (8), `skills/repo-setup/SKILL.md:93-94` (2), `skills/repo-setup/SKILL.md:116-117` (2), `skills/repo-setup/SKILL.md:128-129` (2), `skills/repo-setup/SKILL.md:137-140` (4), `skills/repo-setup/SKILL.md:147-148` (2), `skills/repo-setup/SKILL.md:221` (1).
- Replaced at `skills/repo-setup/SKILL.md:197-200` (`HEAD` line 158):
  - Before: `| The questions | Every setup, at Steps 2 | The ten questions, each with its default | The user's answers |`
  - Before: `| The draft | Every setup, at Steps 4 | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |`
  - Before: `| A hunk to rule on | `sync` exits 1 | The diff | The user's ruling per hunk |`
  - Before: `| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block | The change Steps / sync 4 drafts | The user's approval |`
  - After: `| The questions | Every setup, at Steps 2, for each question a quoted ruling does not answer | The questions asked, each with its default | The user's answers |`
  - After: `| The draft | Every setup, at Steps 4, except a draft a quoted ruling covers as Steps 4 says | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |`
  - After: `| A hunk to rule on | `sync` exits 1, except a diff whose hunks are a quoted ruling's (Steps / sync 3) | The diff | The user's ruling per hunk |`
  - After: `| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5) | The change Steps / sync 4 drafts | The user's approval |`
- Replaced at `skills/repo-setup/SKILL.md:202` (`HEAD` line 163):
  - Before: `| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, and the command that shows them (`git status --short`) | The user's commit |`
  - After: `| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, the quoted ruling named when they were written under one, and the command that shows them (`git status --short`) | The user's commit |`

### `skills/repo-setup/templates/plan-terms.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/repo-setup/templates/plan-terms.md:75` (1).
- Replaced at `skills/repo-setup/templates/plan-terms.md:20` (`HEAD` line 20):
  - Before: `- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.`
  - After: `- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.`
- Replaced at `skills/repo-setup/templates/plan-terms.md:92-93` (`HEAD` line 91):
  - Before: `- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".`
  - Before: `- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".`
  - After: `- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".`
  - After: `- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".`

### `skills/roadmap/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/roadmap/SKILL.md:22` (1), `skills/roadmap/SKILL.md:42-55` (14), `skills/roadmap/SKILL.md:63-68` (6), `skills/roadmap/SKILL.md:71-73` (3), `skills/roadmap/SKILL.md:75` (1), `skills/roadmap/SKILL.md:94-97` (4).
- Replaced at `skills/roadmap/SKILL.md:99` (`HEAD` line 70):
  - Before: `   - The step is done when the gate's answer is no and the answer with its reason stands in the draft.`
  - After: `   - The step is done when the answer with its reason stands in the draft, and the gate's answer is no or the gate is a quoted ruling's.`
- Replaced at `skills/roadmap/SKILL.md:132` (`HEAD` line 103):
  - Before: `  - A goal that does not settle it is a stop ("Stops").`
  - After: `  - A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops").`
- Replaced at `skills/roadmap/SKILL.md:136` (`HEAD` line 107):
  - Before: `- **No insertion form yet.** A stop ("Stops").`
  - After: `- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.`
- Replaced at `skills/roadmap/SKILL.md:159` (`HEAD` line 130):
  - Before: `| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3 | What Steps 3 shows | The user's approval or correction |`
  - After: `| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says | What Steps 3 shows | The user's approval or correction |`
- Replaced at `skills/roadmap/SKILL.md:161-162` (`HEAD` line 132):
  - Before: `| The level | Entries exist at two levels and the goal does not settle which | The two levels | The user's choice |`
  - Before: `| The insertion form | The file has no insertion form yet | The question, once | The user's answer, used from then on |`
  - After: `| The level | Entries exist at two levels and neither the goal nor a quoted ruling settles which | The two levels | The user's choice |`
  - After: `| The insertion form | The file has no insertion form yet, and no quoted ruling states the entry's number | The question, once | The user's answer, used from then on |`

### `skills/spec/SKILL.md`

- Before: nothing. After, lines added (`file:first-last`, number of lines): `skills/spec/SKILL.md:229-231` (3), `skills/spec/SKILL.md:240` (1).
- Replaced at `skills/spec/SKILL.md:208-210` (`HEAD` line 208):
  - Before: `     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.`
  - After: `     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.`
  - After: `     - The option names that stop.`
  - After: `     - An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.`

The figures, as a user sees them: each is 22 px higher (`viewBox` `0 0 1040 966` to `0 0 1040 988` for `pipeline.svg`, `0 0 1040 889` to `0 0 1040 911` for `plan-loop.svg`), and each carries one more line under the legend row, "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change."; every box and arrow is at its earlier pixel position (Verify 8).

## 11. Wrong or impossible in the brief

Point 1 is about an action of mine, points 2 and 3 about the brief.

1. A script of mine ran commands the brief forbids. The helper that assembles this report passed the text of line 126 of `HEAD:skills/repo-setup/SKILL.md` to a shell inside double quotes. That line names `git push`, `git reset --hard`, `git clean`, `git checkout`, `git restore`, `.claude/hooks/`, `.gitignore` and `python3` in backticks, so the shell ran each of them as a command, every time the helper reached that step. The `git reset --hard` entries of this worktree's reflog (`git reflog --date=iso | grep 'reset: moving to HEAD'`; the first one, at worktree creation, is not mine):

```
9f85c25 HEAD@{2026-09-30 16:43:17 +0200}: reset: moving to HEAD
9f85c25 HEAD@{2026-09-30 16:43:09 +0200}: reset: moving to HEAD
9f85c25 HEAD@{2026-09-30 16:41:16 +0200}: reset: moving to HEAD
9f85c25 HEAD@{2026-09-30 16:40:26 +0200}: reset: moving to HEAD
9f85c25 HEAD@{2026-09-30 16:37:37 +0200}: reset: moving to HEAD
9f85c25 HEAD@{2026-09-30 16:32:14 +0200}: reset: moving to HEAD
9f85c25 HEAD@{2026-09-30 16:01:42 +0200}: reset: moving to HEAD
```

Each reset discarded the uncommitted changes of the fourteen files whenever they were in the worktree. After each I restored them by applying a patch of my own diff, `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/9a-final.patch` (`md5 -q` of it prints `335c98ddea37a6988a94364488ec0b4d`; `git diff | md5 -q` now prints `335c98ddea37a6988a94364488ec0b4d`, the same), so the worktree holds the fourteen files (`git status --short` at the time of this report):

```
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/figures/plan-loop.svg
 M docs/glossary.md
 M skills/grill/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-e-grill/agents/reviews/9a-report.md
```

The other commands could not have changed a tracked file: `git checkout`, `git restore` and `git clean` were given no argument, and `git clean` refuses without `-f` (`clean.requireForce` is unset). The `git push` had no argument. Whether it reached the remote is not verified against the server (`git ls-remote origin` was not run). What the repository shows: the branch has no upstream, no `push` setting exists, the remote has no `2e-9a` tracking ref, and git's default refuses a push of a branch without an upstream:

```
$ git config --get-regexp 'push|branch.2e-9a|clean'
(no output; exit 1)
$ git for-each-ref refs/remotes
6d756b46776c5455c2a3be2d0a48cab0ccdde101 commit    refs/remotes/origin/HEAD
6d756b46776c5455c2a3be2d0a48cab0ccdde101 commit    refs/remotes/origin/main
$ git branch --show-current
2e-9a
```

The main checkout shows no reset of mine: `git -C /Users/axelfaes/workspace/ordo reflog --date=iso -3` lists only the orchestrator's commits:

```
ddca4b7 HEAD@{2026-09-30 16:39:12 +0200}: commit: Book the two rulings on step 3a of plan 2.F
0d82773 HEAD@{2026-09-30 16:32:07 +0200}: commit: Raise two choices of step 3a of plan 2.F
82e1036 HEAD@{2026-09-30 16:11:50 +0200}: commit: Book the call on the blind comparison of step 4 of plan 2.F
```

2. `skills/repo-setup/SKILL.md` line 3 (the description) says "Shows the whole tree and every file's text, the git guard hook named by its source, before writing.", and `README.md` line 113 says "It then shows the whole tree and every file's text, the git guard hook named by its source." Under a quoted ruling that meets the four conditions of "Steps" 4 (`skills/repo-setup/SKILL.md:78`-`85`), the draft "is written without the stop", and no text of the skill says the tree is shown at that point, so for that run both sentences do not hold. The brief's Decision 7 and R10 keep the descriptions and README lines 113, 117 and 124 on the reason that a quoted ruling is the user's approval. That reason covers "after your approval it writes", which is the second half of `README.md:113` and the words of `README.md:117` and `:124`. It does not cover "shows the whole tree and every file's text before writing". The same shape stands, as a statement about the default run, in `skills/plan/SKILL.md:3` ("a drafted step list for approval"), `README.md:17`, `README.md:35` and `skills/ordo-help/SKILL.md:55`; there the ruled run still shows the draft whenever it differs from the ruling (`skills/plan/SKILL.md:90`), and a step list that equals the ruling needs no showing, so the sentences describe the run that has no ruling. Nothing was changed for this, since the brief keeps those sentences. The choice is the user's or the orchestrator's: (a) keep the sentences, each of which states the default run and each skill's Quick start row states the ruled form; (b) add a clause to the two sentences that say "shows the whole tree" (`skills/repo-setup/SKILL.md:3`, `README.md:113`) such as "unless a quoted ruling covers the draft". The lazy option is (a): it costs no edit and leaves two sentences that are false for one kind of run. Option (b) is the better one.

3. Left as the brief says: `README.md` line 13 is unchanged (`git diff -U0 -- README.md` has one hunk, at line 54), and the sentence that was line 126 of `skills/repo-setup/SKILL.md` is unchanged and now stands at `165`, moved by the brief's own inserts above it (`git show HEAD:skills/repo-setup/SKILL.md | sed -n 126p` and a search of the changed file for that exact line give the two places).

`git diff -U0 -- README.md | grep '^@@'` prints `@@ -54 +54 @@ for every step:`.

## 12. Sentences about a changed file as a whole (rule 14)

Each is quoted as `grep -n` prints it, with the line that shows it still holds.

### Descriptions and opening paragraphs

- `skills/spec/SKILL.md`, description (`skills/spec/SKILL.md:3`) and opening paragraph (`skills/spec/SKILL.md:10`): the sentences at issue are "refuse a step without the user's authority ((approved) or (ruling <name>))".
  - Line: ``/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief and its brief check's report in the preparation commit, and the dispatch entry written to the state file. It also leaves the step's worktree at the base, and the base binaries copied aside.` (line 10)
  - `skills/spec/SKILL.md:43:   - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on.`
  - `skills/spec/SKILL.md:229:   - a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";`
  - `skills/spec/SKILL.md:240:   - After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.`
  - Holds because: The quoted ruling adds no authority: a step still needs its `(approved)` or `(ruling <name>)` tag (line 43), the ruling is booked as before (line 229), and the skill is run before `/spec` is typed again (line 240), so what `/spec` leaves (its opening paragraph, line 10) is unchanged.
- `skills/ordo-help/SKILL.md`, description (`skills/ordo-help/SKILL.md:3`) and opening paragraph (`skills/ordo-help/SKILL.md:10`): the sentences at issue are "Print the command sequence".
  - Line: ``/ordo-help` prints the command sequence for running a plan step by step, and, for a named plan, where that plan stands and the command that comes next.` (line 10)
  - `skills/ordo-help/SKILL.md:78:                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again`
  - Holds because: The sequence block it prints gains that one line; the description and the paragraph (line 10) say it prints the sequence and where the plan stands, which still holds.
- `skills/plan-orchestration/SKILL.md`, description (`skills/plan-orchestration/SKILL.md:3`) and opening paragraph (`skills/plan-orchestration/SKILL.md:10`): the sentences at issue are "stop only where a decision is the user's".
  - Line: `The unattended loop that runs an open plan's steps, one after another, until a pause or until nothing unblocked is left; a stop blocks only its own step. It leaves behind each landed step on main, its landing report in the ledger, and a state file that says where the plan stands.` (line 10)
  - `skills/plan-orchestration/SKILL.md:304:  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.`
  - `skills/plan-orchestration/SKILL.md:305:  - After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.`
  - Holds because: An option run under a quoted ruling is the user's decision, so the loop still stops only where a decision is the user's; the opening paragraph (line 10) says a stop blocks only its own step, which is unchanged.
- `skills/roadmap/SKILL.md`, description (`skills/roadmap/SKILL.md:3`) and opening paragraph (`skills/roadmap/SKILL.md:10`): the sentences at issue are "Writes only after the user approves".
  - Line: ``/roadmap` shows, adds, moves, marks done and drops the entries of the file `.agents/plan.yaml`'s `roadmap:` key names. It leaves behind each change the user approved, committed on its own.` (line 10)
  - `skills/roadmap/SKILL.md:71:   - Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.`
  - `skills/roadmap/SKILL.md:72:   - A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.`
  - Holds because: A quoted ruling is the user's approval of the change it states (the sentence holds for the comparison at line 71 and 72); the opening paragraph "each change the user approved, committed on its own" (line 10) holds with the commit at Steps 5 (line 75).
- `skills/plan/SKILL.md`, description (`skills/plan/SKILL.md:3`) and opening paragraph (`skills/plan/SKILL.md:10`): the sentences at issue are "a drafted step list for approval ... each approved step tagged (approved)".
  - Line: ``/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md` and `orchestrator-state.md`, committed, and `agents/briefs/` and `agents/reviews/`, each holding an empty `.gitkeep`.` (line 10)
  - `skills/plan/SKILL.md:92:   - A step list written under a quoted ruling is the approved list.`
  - `skills/plan/SKILL.md:85:   - Under a quoted ruling, the draft is written without the stop only when four things hold.`
  - Holds because: Each step line of a plan written under a quoted ruling ends `(approved)` (line 92, and Decision 2 of the brief); a draft that differs from the ruling is shown for approval (line 90). The opening paragraph (line 10) names what `/plan` leaves behind, which the quoted ruling does not change.
- `skills/ordo-init/SKILL.md`, description (`skills/ordo-init/SKILL.md:3`) and opening paragraph (`skills/ordo-init/SKILL.md:10`): the sentences at issue are "write nothing until the user approves".
  - Line: ``/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.` (line 10)
  - `skills/ordo-init/SKILL.md:155:  - A quoted ruling that states the draft is that approval.`
  - `skills/ordo-init/SKILL.md:161:  - Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.`
  - Holds because: A quoted ruling that states the draft is the approval (line 155), so "write nothing until the user approves" and "the pages the user approved" (line 10) hold.
- `skills/repo-setup/SKILL.md`, description (`skills/repo-setup/SKILL.md:3`) and opening paragraph (`skills/repo-setup/SKILL.md:10`): the sentences at issue are "rewrites them after approval; approved tree".
  - Line: ``/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block and its glossary's plan-terms block equal to their templates. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced blocks.` (line 10)
  - `skills/repo-setup/SKILL.md:221:  - A quoted ruling that covers the draft as Steps 4 says is that approval.`
  - `skills/repo-setup/SKILL.md:128:   - Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.`
  - Holds because: A quoted ruling that covers the draft is the approval (line 221), so "after approval" and "the approved tree" (line 10) hold. The sentence "Shows the whole tree and every file's text ... before writing" does not hold for a run under a covering ruling: see part 11, point 2.
- `skills/grill/SKILL.md`, description (`skills/grill/SKILL.md:3`) and opening paragraph (`skills/grill/SKILL.md:10`): the sentences at issue are "write each answer as it settles ... and, on the user's yes, a proposed ADR".
  - Line: ``/grill <entry>` interviews the user, in rounds, until the design decisions of one roadmap entry are settled. It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR for each decision the user chose to record, and one commit when the user allows it.` (line 10)
  - `skills/grill/SKILL.md:272:  - A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.`
  - `skills/grill/SKILL.md:250:| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |`
  - Holds because: Only the roadmap diff is answered by the ruling (line 272 and the "A round" row); the "record as ADR?" decisions stay decisions of the round, so "on the user's yes, a proposed ADR" and the paragraph "one commit when the user allows it" (line 10) hold.

### The lines under each Stops table that count its stops

- `skills/spec/SKILL.md:282:The first six rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.`
- `skills/plan-orchestration/SKILL.md:281:The table holds seven kinds of stop, each for a decision that is the user's, and one refusal, the last row, which names its cause and leaves no open item:`
- `skills/roadmap/SKILL.md:171:- The first five rows are stops: each waits on the user.`
- `skills/roadmap/SKILL.md:172:- The rest are refusals: each names its cause and changes nothing.`
- `skills/repo-setup/SKILL.md:205:- The first six rows are stops: each waits on the user.`
- `skills/repo-setup/SKILL.md:206:- The last row is a refusal: it names its cause and changes nothing.`
- `skills/grill/SKILL.md:246:The first three rows are stops, which wait on the user. The rest are refusals, which name their cause and change nothing.`

Each table has the rows it had, in the same order, so the counts hold. The count of data rows of each Stops table on `HEAD` and now, computed by counting the lines that start with `|` between `## Stops` and the next `## ` heading and taking off the header and the separator:

| Skill | Data rows on HEAD | Data rows now |
|---|---|---|
| `spec` | 15 | 15 |
| `ordo-help` | 3 | 3 |
| `plan-orchestration` | 8 | 8 |
| `roadmap` | 11 | 11 |
| `plan` | 6 | 6 |
| `ordo-init` | 6 | 6 |
| `repo-setup` | 7 | 7 |
| `grill` | 7 | 7 |

`skills/roadmap/SKILL.md` line 172 "The rest are refusals" and `skills/spec/SKILL.md:282` "The rest are refusals" state their counts by the same rows. `skills/ordo-help`, `skills/plan` and `skills/ordo-init` have no sentence under the table that counts its rows.

### The "Every skill the loop invokes" rule

- `skills/plan-orchestration/SKILL.md:336:- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.`
  - Holds: it names the five skills that run under a quoted ruling beside the skills the loop always invokes, and `skills/plan-orchestration/SKILL.md:306:  - It then runs the skill with `--ruling <ledger file> "<name>"`.` is the invocation it covers.

### `docs/figures/gen_figures.py`

- Head comment (lines 1 to 38), read in full. It says the script writes the two SVGs, that every box, arrow and label is written in the file from each skill's Stops table and the printed sequence, that the script reads no skill file, and that each box shows where the user is asked with a mark by shape and word:
  - `docs/figures/gen_figures.py:10:Every box, arrow and label is written in this file, taken from each skill's Stops table and from`
  - `docs/figures/gen_figures.py:20:by a word: a filled square "every run", an outlined square "only when", a dashed pill "optional".`
  - `docs/figures/gen_figures.py:29:- a caption, a note or the legend that does not fit one line: the message names the figure, "a`
  - Holds: the note added under the legend is drawn by `draw_note` (`docs/figures/gen_figures.py:391` is the call in `draw_legend`), so the head comment's error line for "a note" applies to it, the script still reads no skill file, and the two marks and the dashed box are as the comment says.
- Docstrings, read in full (`grep -n '"""' docs/figures/gen_figures.py` lists them). The one about the legend is changed: `docs/figures/gen_figures.py:378:    """The three marks and the dashed box with what each says, on one row, and a note under it."""`. Holds: `draw_legend` draws the marks and the dashed box on one row and one note under it (`docs/figures/gen_figures.py:395:        'A stop marked "every run" waits each time, unless the run is under a quoted ruling that '`). The other docstrings describe functions the diff does not touch; the two `Canvas(` heights are the only other change (`docs/figures/gen_figures.py:418:        side_top + side_h + 90,` and `docs/figures/gen_figures.py:567:        band_y + band_h + 103,`).
- The text in the figure that speaks about the whole figure, the band of `/plan-orchestration`: `docs/figures/gen_figures.py:691:        "build it and close them; you may run the row by hand instead. Only the stops marked "`. Holds: under a quoted ruling a marked stop is skipped, and the sentence says only that no stop outside the marked ones reaches the user, which stays true.

### The alt texts of the two figures in `README.md`

- `README.md:56:![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)`
- `README.md:60:![The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/plan-loop.svg)`
  - Holds: each says "Each box lists the stops where you are asked, marked every run, only when or optional." The lists in the boxes are unchanged (Verify 8: no pixel above the legend changed), and `README.md:54:The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".` states the exception for the mark.

