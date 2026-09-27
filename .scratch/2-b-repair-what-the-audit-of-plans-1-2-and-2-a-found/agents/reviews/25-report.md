Everything in the brief is done.

# Report: step 25, the ten skills brought in line with the one-rule-per-bullet rule

## Open items of the state file, verbatim

None. `awk '/^## Open items/{p=1;print;next} /^## /{p=0} p' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` prints the heading and two blank lines, nothing else.

## Cases, first run on the unchanged tree

Run before any change, each line as `sed -n <n>p` printed it, with what the brief expects. Every quoted line matched the brief's quote, and no case was one the brief's rules get wrong, so the build went on without a hand-back.

```text
== sed -n 165p skills/land/SKILL.md
- A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops"; the step that finishes it on top of what landed enters the plan only by the user's ruling.
   expected: two Rules bullets, the first ending at "Stops", the second "The step that finishes it on top of what landed enters the plan only by the user's ruling."
== sed -n 166p skills/land/SKILL.md
- A landed commit is reverted only on the user's ruling. Its preparation commit stays, and only a step so reverted is booked as reverted.
   expected: three bullets (revert only on the user's ruling; the preparation commit stays; only a reverted step is booked as reverted)
== sed -n 201p skills/spec/SKILL.md
- A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them. Only the session that wrote it commits it.
   expected: two Rules bullets
== sed -n 47p skills/plan-orchestration/SKILL.md
   - A stop it raises goes to the user by "Stops". A stop, here or at any later step, blocks its own step, and the loop moves on to the next unblocked step.
   expected: three sibling sub-bullets under Steps 3
== sed -n 49p skills/plan-retro/SKILL.md
   - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro. A report in both lists has its runs joined in one entry.
   expected: two sub-bullets, the "so" clause with the first
== sed -n 28p skills/land/SKILL.md
1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
   expected: item 1 keeps its number and first half; "A required key missing is a refusal ("Stops")." becomes a sub-bullet; the same in every skill with this item (plan-help 29, refute 29, spec 30; plan-retro 28 and roadmap 32 already have the refusal as a sub-bullet)
== sed -n 78p skills/plan-orchestration/SKILL.md
9. Invoke `/land <entry> <step>`. Its refusals are its own.
   expected: kept
== sed -n 123p skills/plan-orchestration/SKILL.md
- `/spec` of such a step saves its work as a patch and prepares it again from main's head. The `spec` skill's "Steps / A step taken back out of main" says how.
   expected: kept
== sed -n 66p skills/refute/SKILL.md
   - a finding closed by removing a check rather than fixing what the check guarded;
   expected: kept
== sed -n 91p skills/refute/SKILL.md
  - a null guard, an early return or a fallback standing where a fix was asked for;
   expected: kept
== sed -n 70p skills/repo-setup/SKILL.md
3. Exit 1: the block differs; show the diff, for the user's ruling per hunk ("Stops").
   expected: kept
== sed -n 40p skills/spec/SKILL.md
   - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on.
   expected: kept
== sed -n 74p skills/ordo-init/SKILL.md
10. Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` changes, as Rules 4 says; and, when the skill runs alone, the question whether it may commit.
   expected: kept
== sed -n 61p skills/refute/SKILL.md
1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, on a fresh reviewer each time, as Rules 1 says.
   expected: "Rules 1" changed only if a refute Rules bullet at or before the first is split; otherwise kept and reported as checked
== sed -n 165p skills/spec/SKILL.md
   - the open item is closed with the ruling's text and its date;
== sed -n 106p skills/land/SKILL.md
- It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`); a missing state file, or a `verify.sh` in none of those places, is refused before main is touched, with the places named.
   expected (brief's own run): two bullets
== sed -n 111p skills/spec/SKILL.md
   - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`, and read what it prints. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
   expected (brief's own run): the apply with its second sentence, and "Read what it prints."
```

Position-reference baseline, saved before any change: `grep -rnoE '(Rules|Steps|Stops|Anti-patterns|What it reads|What it checks|"[A-Z][^"]{2,40}") [0-9]+[a-z]?\b' skills/*/SKILL.md skills/*/templates docs README.md` printed 105 lines. The target text of each, before and after, is in "Position references before and after".

## DONE / NOT DONE

The tree as it stands after repair round 1. Round 1 amended What to build 3 and Decision 1 by ruling A of `agents/briefs/25-round-1.md`.

| Item | State | Command | Output |
|---|---|---|---|
| What to build 1: every list item read | DONE | `items.sh skills/*/SKILL.md` (awk: a line starting with `-`, `*` or `N.` after indentation, outside code fences) on the base files | 707 items; each read and decided: 136 split into 304 items, 571 kept |
| What to build 1: an item with one requirement stays as it is | DONE | `git diff -U0 -- skills/*/SKILL.md` | the item lines removed are the 136 split items, two ordo-init lines carrying a reference, five plan lines and two spec lines re-indented (judgment calls 9 and 10): 145 deletions |
| What to build 2: what stays joined | DONE | per item; "Items kept" below | every flagged item kept is listed with its reason |
| What to build 3, as amended by ruling A: meaning kept, form of a split | DONE | the token check of every split against its base line; `formcheck.py skills/*/SKILL.md`; the pronoun check; the re-read of every split against rule 17 (Repair round 1, ruling 12) | Every condition, exception and limit of a split item is still stated with each requirement it governs: in the new item itself, or in the parent item it is a sub-bullet of. The only words added are pronoun or short-form subjects, verbs restored from a gapped clause, two repeated qualifiers, and the texts rulings 1, 5 and 8 give. The only words removed are joining words and, at plan-orchestration 56, "its", which became "That skill's". No bold label is repeated, no item is deeper than three levels, and no split makes three consecutive items open the same way. |
| What to build 4: position references kept | DONE | the grep rerun; `diff <(cut -d: -f1,3 refs-before.txt \| sort) <(cut -d: -f1,3 refs-after2.txt \| sort)`; `numbered.py` | 105 references; the only difference is ordo-init `Rules 4` now `Rules 5`, plus ordo-init 112 `Rules 4 and 5`, where the grep captures only the first number; 209 numbered items, "same sections and numbers" in all ten files |
| What to build 5: the report | DONE | this file | all sections of "Report", and "Repair round 1" |
| Verify 1 | DONE | the verify runner | six `PASS:` lines, nothing from the ASCII check, `verify: 7 commands passed`, exit 0 (quoted below) |
| Verify 2 | DONE | `git diff --stat` | the ten `SKILL.md` files only (quoted below) |
| Verify 3 | DONE | word check | every added or removed word is listed in "Word check" |
| Verify 4 | DONE | reference grep rerun | every reference points at the same rule text |
| Verify 5 | DONE | the case commands below | every case holds; Cases 1, 3 and 4 hold in the form ruling A gives them |

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"` from the worktree root, after round 1, printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit=0
```

The ASCII check printed nothing. What this does not cover: none of the six tests reads the prose of a `SKILL.md`. The prose is covered by the word check, the form checks, the reference check and the cases.

`git diff --stat`:

```text
 skills/land/SKILL.md               |  79 ++++++++++++-------
 skills/ordo-init/SKILL.md          |  22 ++++--
 skills/plan-help/SKILL.md          |   3 +-
 skills/plan-orchestration/SKILL.md | 150 ++++++++++++++++++++++++++-----------
 skills/plan-retro/SKILL.md         |  16 ++--
 skills/plan/SKILL.md               |  29 ++++---
 skills/refute/SKILL.md             |  27 ++++---
 skills/repo-setup/SKILL.md         |  18 +++--
 skills/roadmap/SKILL.md            |  15 ++--
 skills/spec/SKILL.md               |  99 ++++++++++++++++--------
 10 files changed, 313 insertions(+), 145 deletions(-)
```

`git status --short` lists the ten files as `M`, and this report, the round brief and the refuter report as `??`.

## Cases on the changed tree

`bash cases25.sh` (scratchpad) prints each case's lines on the tree as it now stands. Its output:

```text
Case 1:
$ sed -n '191,192p' skills/land/SKILL.md
- A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops".
  - The step that finishes it on top of what landed enters the plan only by the user's ruling.
Case 2:
$ sed -n '193,195p' skills/land/SKILL.md
- A landed commit is reverted only on the user's ruling.
  - Its preparation commit stays.
  - Only a step so reverted is booked as reverted.
Case 3:
$ sed -n '235,236p' skills/spec/SKILL.md
- A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them.
  - Only the session that wrote it commits it.
Case 4:
$ sed -n '47,50p' skills/plan-orchestration/SKILL.md
3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, makes the worktree and writes the dispatch block.
   - A stop it raises goes to the user by "Stops".
   - A stop, here or at any later step, blocks its own step.
     - The loop moves on to the next unblocked step.
Case 5:
$ sed -n '50,51p' skills/plan-retro/SKILL.md
   - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro.
     - A report in both lists has its runs joined in one entry.
Case 6:
$ grep -n -A1 'its required keys and defaults as `/plan` states them' skills/*/SKILL.md
skills/land/SKILL.md:28:1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
skills/land/SKILL.md-29-   - A required key missing is a refusal ("Stops").
--
skills/plan-help/SKILL.md:29:1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
skills/plan-help/SKILL.md-30-   - A required key missing is a refusal ("Stops").
--
skills/plan-retro/SKILL.md:28:1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them: `ledger_root`, `archive_root`, `rules`, `standards`, `verification`.
skills/plan-retro/SKILL.md-29-   - A required key missing is a refusal ("Stops").
--
skills/refute/SKILL.md:29:1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
skills/refute/SKILL.md-30-   - A required key missing is a refusal ("Stops").
--
skills/roadmap/SKILL.md:32:1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them: `roadmap`, `ledger_root`, `archive_root`, `verification`.
skills/roadmap/SKILL.md-33-   - In the `projects:` form, the named project's keys.
--
skills/spec/SKILL.md:30:1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
skills/spec/SKILL.md-31-   - A required key missing is a refusal ("Stops").
Case 7:
$ grep -n 'Invoke `/land <entry> <step>`. Its refusals are its own.' skills/plan-orchestration/SKILL.md
106:9. Invoke `/land <entry> <step>`. Its refusals are its own.
$ grep -n '^- `/spec` of such a step saves its work' skills/plan-orchestration/SKILL.md
167:- `/spec` of such a step saves its work as a patch and prepares it again from main's head. The `spec` skill's "Steps / A step taken back out of main" says how.
$ sed -n '71p;99p' skills/refute/SKILL.md
   - a finding closed by removing a check rather than fixing what the check guarded;
  - a null guard, an early return or a fallback standing where a fix was asked for;
$ grep -n 'Exit 1: the block differs' skills/repo-setup/SKILL.md
73:3. Exit 1: the block differs; show the diff, for the user's ruling per hunk ("Stops").
$ sed -n '43p' skills/spec/SKILL.md
   - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on.
$ sed -n '76p' skills/ordo-init/SKILL.md
10. Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` changes, as Rules 5 says; and, when the skill runs alone, the question whether it may commit.
Case 8:
$ grep -n 'Rules 1' skills/refute/SKILL.md
66:1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, on a fresh reviewer each time, as Rules 1 says.
$ grep -n -A2 '^## Rules' skills/refute/SKILL.md
139:## Rules
140-
141-- The reviewer is a fresh session or agent every time, for the first run and every run over a repair round: never the builder, and never the session that wrote the brief when another is available.
```

What each shows against what the brief expects:

- Case 1 (land base 165): two items; the first ends at "Stops". The second is a sub-bullet, since its "it" stands for the landed step of the first (ruling A.1).
- Case 2 (land base 166): three requirements: the revert only on the user's ruling, the preparation commit stays, only a reverted step is booked as reverted. The second and third are sub-bullets of the first.
- Case 3 (spec base 201): a ledger record committed only at a resume point, and only the session that wrote it commits it, as a sub-bullet.
- Case 4 (plan-orchestration base 47), as ruling 10 corrects it: the stop goes to the user; a stop blocks its own step; the loop moves on, nested under the stop item.
- Case 5 (plan-retro base 49): the carried-over entries with their "so" clause, and "A report in both lists has its runs joined in one entry." nested under it, since "both lists" names the list in the item above.
- Case 6 (land base 28): item 1 keeps its number and first half, with the refusal as a sub-bullet, in land, plan-help, plan-retro, refute and spec. roadmap's item 1 has no refusal clause in the base; its sub-bullet is the base's `projects:` sub-bullet.
- Case 7: the kept items are unchanged. `bash -c` comparing each base line with its line now printed "identical" for plan-orchestration base 78 (now 106) and 123 (now 167), refute base 66 (now 71) and 61 (now 66), repo-setup base 70 (now 73), spec base 40 (now 43); refute base 91 is now line 99, found by `grep -nF` with its full text. ordo-init base 74 (now 76) is unchanged except `as Rules 4 says`, now `as Rules 5 says`, since the Rules item it names was split (What to build 4).
- Case 8: refute's Rules are not split, so `as Rules 1 says` (refute 66) stays and still names the reviewer-is-fresh rule (refute 141).

## Word check

`python3 wordcheck.py` (scratchpad) compares, for every split, the words of the base line with the words of the lines that replace it, case-insensitively, trailing punctuation dropped, and prints, by base line number, each split whose words differ other than by removed joining words ("and", "or", "but", "so", "then", "nor"). Splits not printed differ from their base line only by joining words and punctuation. Its full output:

```text
land:36 added=['are', 'they'] removed=[]
land:55 added=['`verify.sh`'] removed=['it']
land:56 added=['is', 'it'] removed=[]
land:57 added=['is', 'is', 'it', 'it'] removed=[]
land:62 added=['it'] removed=[]
land:68 added=['are', 'they'] removed=[]
ordo-init:114 added=['it'] removed=[]
plan-orchestration:55 added=['it'] removed=[]
plan-orchestration:56 added=['it', "skill's", 'that'] removed=['its']
plan-orchestration:74 added=['a', 'a', 'cause', 'cause', 'is', 'such', 'such'] removed=['it']
plan-orchestration:80 added=['it'] removed=[]
plan-orchestration:86 added=['it'] removed=[]
plan-orchestration:92 added=['it'] removed=[]
plan-orchestration:97 added=['is', 'it'] removed=[]
plan-orchestration:106 added=['is', 'it'] removed=[]
plan-orchestration:108 added=['is', 'it'] removed=[]
plan-orchestration:111 added=['above', 'as', 'bullets', 'is', 'it', 'say', 'the'] removed=[]
plan-orchestration:157 added=['orchestrator', 'the'] removed=['it']
plan-orchestration:204 added=['before', 'cut-off', 'dispatched', 'is', 'the'] removed=[]
plan-orchestration:205 added=['is', 'is', 'is'] removed=[]
plan-orchestration:251 added=['is', 'it', 'it'] removed=[]
plan-retro:69 added=['is', 'it'] removed=[]
plan-retro:78 added=['it'] removed=[]
refute:46 added=['`verify.sh`'] removed=['it']
refute:48 added=['it'] removed=[]
repo-setup:40 added=['is', 'it'] removed=[]
repo-setup:64 added=['committed'] removed=[]
roadmap:101 added=['it'] removed=[]
roadmap:102 added=['it'] removed=[]
spec:51 added=['is', 'it'] removed=[]
spec:55 added=['is', 'it'] removed=[]
spec:63 added=['("stops")', 'a', 'refusal'] removed=[]
spec:88 added=['is', 'it'] removed=[]
spec:91 added=['a', 'cause', 'is', 'such'] removed=[]
spec:102 added=['patch', 'that'] removed=['it']
spec:114 added=['section', 'the'] removed=['it']
spec:127 added=['commit', 'that'] removed=[]
spec:138 added=['it'] removed=[]
spec:145 added=['makes'] removed=[]
spec:168 added=['a', 'for', 'line', 'ruling', 'rulings', 'such', 'the'] removed=['it']
```

What the added words are:

- "it", "they" and a restored "is" or "are": the pronoun subject of a new item, and the auxiliary the base clause shared with the clause before it (ruling A.2).
- "Such a cause" (plan-orchestration base 74, twice; spec base 91): the short-form subject at the third level (ruling A.3).
- "That skill's" (plan-orchestration 56, replacing "its"), "The orchestrator" (plan-orchestration 157, replacing "it"), "that patch" (spec 102, replacing "it"), "The section" (spec 114, replacing "it"), "that commit" (spec 127): a subject named where a pronoun would be ambiguous.
- "`verify.sh`" (land 55, refute 46, replacing "it"): the text of ruling 1.
- "a refusal ("Stops")" (spec 63): the text of ruling 8.
- "for such a ruling ... the Rulings line" (spec 168, replacing "it"): the text of ruling 5.
- "is dispatched" (plan-orchestration 204), "committed" (repo-setup 64), "makes" (spec 145): a verb restored from a gapped clause.
- ", as the bullets above say" (plan-orchestration 111) and "before the cut-off" (plan-orchestration 204): a qualifier of the base line repeated in the new item it governs (ruling 12).

No word other than a joining word is removed except "it" or "its" where the new subject replaces it. Outside the splits, ordo-init 76 changes `Rules 4` to `Rules 5` and ordo-init 112 changes `Rules 4` to `Rules 4 and 5`; the indentation changes are judgment calls 9 and 10.

## Form checks (ruling A)

- `grep -c '\*\*Only known fixes\.\*\*' skills/plan-orchestration/SKILL.md` printed `1`.
- `python3 formcheck.py skills/*/SKILL.md` prints every bold label repeated among the items of one list, every item deeper than three levels (counted by ancestors), and every run of three consecutive items whose first two words (after a label) are the same. It printed one line only: `skills/plan-retro/SKILL.md:43-45: SAME OPENING x3: "for each"`. That is plan-retro Steps 3 to 5 ("For each kind, count ...", "For each kind, name ...", "For each kind, quote ..."), text this step does not change: `git diff -U0 skills/plan-retro/SKILL.md` has no hunk there. It is reported under "Anything in the brief that was wrong", not edited.
- `python3 pronoun.py` (scratchpad), run from the worktree, reads every item line the diff adds and prints each one that opens with a pronoun or linker ("It", "Its", "They", "Their", "That", "This", "These", "Those", "One", "Each", "None", "Such", "Removing them", "Then", "So", after any bold label) and has no parent item above it. Its output:

```text
skills/land/SKILL.md:124: NO PARENT: - Its check on main (Steps 6) is the ledger's verify list: after main's cherry-pick it runs `sh <ver
skills/land/SKILL.md:126: NO PARENT: - It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the rep
skills/land/SKILL.md:140: NO PARENT: - Its zero exit passes the checks on main (Steps 6).
skills/plan-orchestration/SKILL.md:123: NO PARENT: - **Orchestrator.** It may also run on Claude Fable.
skills/plan-orchestration/SKILL.md:150: NO PARENT: - So a session taking over finds no uncommitted record of the session before it.
skills/plan-orchestration/SKILL.md:203: NO PARENT: - Each brief lists the paths its step writes under "Paths this step writes".
skills/plan-orchestration/SKILL.md:218: NO PARENT: - It runs in the background.
skills/roadmap/SKILL.md:89: NO PARENT: - **The level of an added entry.** It goes at the level the user names.
```

  - plan-orchestration 123 and roadmap 89 open with a bold label, which names the subject ("**Orchestrator.** It may ...", "**The level of an added entry.** It goes ..."); ruling A.2 writes the label once and nests the rest under it.
  - plan-orchestration 203 ("Each brief lists ...") names its own subject.
  - land 124, 126 and 140, plan-orchestration 150 and 218 are the first part of a split whose base line opens the same way: land base 105 "Its check on main", 106 "It finds", 118 "Its zero exit"; plan-orchestration base 111 "So a session taking over", 168 "It runs in the background". Their opening is the base text, not made by a split, and the requirements split from them are nested under them.
  - No item a split creates has its subject or antecedent only in a sibling.

## Every item split

Old line numbers are on the base files (aa0cd84); the `new:` lines are the items that replace each, in order, as they stand in the tree. `python3 gensplits.py` (scratchpad) prints this listing from the split data that `apply2.py` applies to the base files.

### skills/land/SKILL.md, 25 items split

```text
old 28: 1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
new:     1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
new:        - A required key missing is a refusal ("Stops").

old 32: 3. The dispatch block naming this step, with its worktree and base; none is a refusal ("Stops").
new:     3. The dispatch block naming this step, with its worktree and base.
new:        - None is a refusal ("Stops").

old 33: 4. The ledger's `land.sh`, as "The landing script" says; none is a refusal ("Stops").
new:     4. The ledger's `land.sh`, as "The landing script" says.
new:        - None is a refusal ("Stops").

old 36:    - The user's unrelated changes are listed by path and left alone.
new:        - The user's unrelated changes are listed by path.
new:          - They are left alone.

old 45: 3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's tree with the ledger root left out, and `git commit -q -m wip` when something is staged.
new:     3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's tree with the ledger root left out.
new:        - `git commit -q -m wip` when something is staged.

old 48:    - Each wait for a lock, here and on main before Steps 4, is bounded at 60 s of waiting; at the bound the landing stops ("Stops").
new:        - Each wait for a lock, here and on main before Steps 4, is bounded at 60 s of waiting.
new:          - At the bound the landing stops ("Stops").

old 55:    - The step's verify list runs through this skill's `templates/verify.sh <state file>` from the root of the checkout it checks (main here), and the lines it prints are what the booking quotes.
new:        - The step's verify list runs through this skill's `templates/verify.sh <state file>` from the root of the checkout it checks (main here).
new:        - The lines `verify.sh` prints are what the booking quotes.

old 56:    - A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here, counted and named the same way as a red line.
new:        - A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here.
new:          - It is counted and named the same way as a red line.

old 57:    - A red line that a fix inside the brief closes is fixed on main, counted as a fix at landing, and named in the booking with its cause.
new:        - A red line that a fix inside the brief closes is fixed on main.
new:          - It is counted as a fix at landing.
new:          - It is named in the booking with its cause.

old 60:    - The dispatch block is then set to `landing: backed-out`, the step's worktree and branches are kept, and the step stays unticked in `plan.md`.
new:        - The dispatch block is then set to `landing: backed-out`.
new:          - The step's worktree and branches are kept.
new:          - The step stays unticked in `plan.md`.

old 61:    - The failure is never sent back to the builder: it is recorded in the step's Step 0 in `plan.md`.
new:        - The failure is never sent back to the builder.
new:          - It is recorded in the step's Step 0 in `plan.md`.

old 62:    - The step keeps its line and its tag, and is worked again as that step, with no new ruling.
new:        - The step keeps its line and its tag.
new:          - It is worked again as that step, with no new ruling.

old 64:    - The state file and `plan.md` are then committed by path, a resume point. The commit also holds the other ledger records the session wrote since the last one.
new:        - The state file and `plan.md` are then committed by path, a resume point.
new:          - The commit also holds the other ledger records the session wrote since the last one.

old 68:    - The mean, the standard deviation and the standard error of the difference are written to the scratchpad and quoted in the booking.
new:        - The mean, the standard deviation and the standard error of the difference are written to the scratchpad.
new:          - They are quoted in the booking.

old 72: 10. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the open item it was raised as, the verification lines, the A/B, the usage row; tick the step.
new:     10. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the open item it was raised as, the verification lines, the A/B, the usage row.
new:         - Tick the step.

old 79:     - Under the loop it is also the report the orchestrator prints; run by hand, it is the message that ends the turn.
new:         - Under the loop it is also the report the orchestrator prints.
new:         - Run by hand, it is the message that ends the turn.

old 102: - A ledger holds `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made; `/plan` copies it, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger when it opens a plan.
new:     - A ledger holds `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made.
new:       - `/plan` copies it, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger when it opens a plan.

old 105: - Its check on main (Steps 6) is the ledger's verify list: after main's cherry-pick it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root, and a non-zero exit fails the landing with the output of `verify.sh` printed.
new:     - Its check on main (Steps 6) is the ledger's verify list: after main's cherry-pick it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root.
new:       - A non-zero exit fails the landing with the output of `verify.sh` printed.

old 106: - It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`); a missing state file, or a `verify.sh` in none of those places, is refused before main is touched, with the places named.
new:     - It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).
new:       - A missing state file, or a `verify.sh` in none of those places, is refused before main is touched, with the places named.

old 115: - `templates/land.test.sh` proves it on scratch repositories, its verify list run and its lookup of `verify.sh` included, that its defaults run no browser step and no line count, and that a ledger file left uncommitted in the worktree never reaches main; it proves `templates/usage.py` on a Claude Code log and its refusal of a file that is not one.
new:     - `templates/land.test.sh` proves it on scratch repositories, its verify list run and its lookup of `verify.sh` included, that its defaults run no browser step and no line count, and that a ledger file left uncommitted in the worktree never reaches main.
new:       - It proves `templates/usage.py` on a Claude Code log and its refusal of a file that is not one.

old 118: - Its zero exit passes the checks on main (Steps 6). It never passes the look (Steps 7), which it does not do.
new:     - Its zero exit passes the checks on main (Steps 6).
new:       - It never passes the look (Steps 7), which it does not do.

old 124: 1. Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 11, before the state file was rewritten, and a back-out reads it from the entry. The branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them; no path or branch is built from the step id.
new:     1. Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 11, before the state file was rewritten, and a back-out reads it from the entry.
new:        - The branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them.
new:        - No path or branch is built from the step id.

old 151: - The last row is a stop after the landing's commit that leaves an open item: the step is on main, and only its worktree and branches are left, named in the open item. Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.
new:     - The last row is a stop after the landing's commit that leaves an open item: the step is on main, and only its worktree and branches are left, named in the open item.
new:       - Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.

old 165: - A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops"; the step that finishes it on top of what landed enters the plan only by the user's ruling.
new:     - A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops".
new:       - The step that finishes it on top of what landed enters the plan only by the user's ruling.

old 166: - A landed commit is reverted only on the user's ruling. Its preparation commit stays, and only a step so reverted is booked as reverted.
new:     - A landed commit is reverted only on the user's ruling.
new:       - Its preparation commit stays.
new:       - Only a step so reverted is booked as reverted.
```

### skills/ordo-init/SKILL.md, 6 items split

```text
old 29: 2. `.agents/plan.yaml`, when it exists; then the skill checks instead of drafting ("Steps / Checking an existing file").
new:     2. `.agents/plan.yaml`, when it exists.
new:        - Then the skill checks instead of drafting ("Steps / Checking an existing file").

old 52:    - A command that fails is not written as a check: it is a stop ("Stops").
new:        - A command that fails is not written as a check.
new:          - It is a stop ("Stops").

old 77: 13. Run `python3 <this skill's folder>/templates/check_config.py .` and show its output.
new:     13. Run `python3 <this skill's folder>/templates/check_config.py .`.
new:         - Show its output.

old 85: 1. With `.agents/plan.yaml` present, write nothing and run `templates/check_config.py`.
new:     1. With `.agents/plan.yaml` present, write nothing.
new:        - Run `templates/check_config.py`.

old 114: - A page the skill writes states what the repository already does or says, and cites where.
new:     - A page the skill writes states what the repository already does or says.
new:       - It cites where.

old 115: - The skill never overwrites an existing page or `.agents/plan.yaml`. A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
new:     - The skill never overwrites an existing page or `.agents/plan.yaml`.
new:     - A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
```

### skills/plan-help/SKILL.md, 1 item split

```text
old 29: 1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
new:     1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
new:        - A required key missing is a refusal ("Stops").
```

### skills/plan-orchestration/SKILL.md, 43 items split

```text
old 43: 1. Read the inputs in the order "What it reads" gives them, and resolve a dispatch block before anything else.
new:     1. Read the inputs in the order "What it reads" gives them.
new:        - Resolve a dispatch block before anything else.

old 47:    - A stop it raises goes to the user by "Stops". A stop, here or at any later step, blocks its own step, and the loop moves on to the next unblocked step.
new:        - A stop it raises goes to the user by "Stops".
new:        - A stop, here or at any later step, blocks its own step.
new:          - The loop moves on to the next unblocked step.

old 49: 4. Choose the step's executor and write it into the dispatch block, then build by that choice.
new:     4. Choose the step's executor.
new:        - Write it into the dispatch block.
new:        - Then build by that choice.

old 51:    - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder". The moment it is launched, write its agent id into the dispatch block under `session_id`.
new:        - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder".
new:          - The moment it is launched, write its agent id into the dispatch block under `session_id`.

old 52:    - **The launch commit.** Under every executor, the dispatch entry is committed once its builder's identity is in it, and the commit is a resume point. Under `agent` it comes right after the launch, since the builder's agent id exists only once it is launched; under `inline` and `academic-paper` it comes before the build starts. The paths are the state file and the session's own records since the last resume point, named in `git add -- <path> ...`.
new:        - **The launch commit.** Under every executor, the dispatch entry is committed once its builder's identity is in it, and the commit is a resume point.
new:          - Under `agent` it comes right after the launch, since the builder's agent id exists only once it is launched; under `inline` and `academic-paper` it comes before the build starts.
new:          - The paths are the state file and the session's own records since the last resume point, named in `git add -- <path> ...`.

old 54:    - **The builder.** It never runs a git command, and in the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.
new:        - **The builder.** It never runs a git command.
new:          - In the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.

old 55:    - **`inline`.** The orchestrating session writes `inline` as the builder's identity under `session_id` and makes the launch commit. It then builds the step itself in the worktree under the brief and the rules file. Steps 5 and 8 read "the builder" as itself.
new:        - **`inline`.** The orchestrating session writes `inline` as the builder's identity under `session_id`.
new:          - It makes the launch commit.
new:          - It then builds the step itself in the worktree under the brief and the rules file. Steps 5 and 8 read "the builder" as itself.

old 56:    - **`academic-paper`.** The session writes `academic-paper` as the builder's identity under `session_id` and makes the launch commit. The step is then built through that skill with the brief as its input, and its output is the step's report.
new:        - **`academic-paper`.** The session writes `academic-paper` as the builder's identity under `session_id`.
new:          - It makes the launch commit.
new:          - The step is then built through that skill with the brief as its input.
new:          - That skill's output is the step's report.

old 60: 6. On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed on its own. Then read the whole diff.
new:     6. On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed on its own.
new:        - Then read the whole diff.

old 64:    - A builder whose first run of the brief's "Cases" finds a case the brief's rules get wrong stops before changing any code and hands back the first run and that case, with the rule and the result; read that hand-back the same way as a report.
new:        - A builder whose first run of the brief's "Cases" finds a case the brief's rules get wrong stops before changing any code and hands back the first run and that case, with the rule and the result.
new:          - Read that hand-back the same way as a report.

old 65:    - Rule on such a case when the fix stays inside the step's scope. Write the ruling into the ledger as the round-0 ruling file `agents/briefs/<step>-cases.md`, and commit it by path as a round sent.
new:        - Rule on such a case when the fix stays inside the step's scope.
new:          - Write the ruling into the ledger as the round-0 ruling file `agents/briefs/<step>-cases.md`.
new:          - Commit it by path as a round sent.

old 66:    - Then resume the same builder with it, by Steps 8's "How" and "Before the resume" with `round: 0`. The builder's final report carries the ruling.
new:        - Then resume the same builder with it, by Steps 8's "How" and "Before the resume" with `round: 0`.
new:          - The builder's final report carries the ruling.

old 70:    - Save its report, and write its path and its usage into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.
new:        - Save its report.
new:          - Write its path and its usage into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.

old 73:    - **Before the resume.** Write `round: n` into the dispatch block. Commit it by path with the round's brief and the session's own records since the last resume point. The commit is a resume point.
new:        - **Before the resume.** Write `round: n` into the dispatch block.
new:          - Commit it by path with the round's brief and the session's own records since the last resume point. The commit is a resume point.

old 74:    - **Only known fixes.** Each ruling says what to change. A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed by the orchestrator, read-only, before the round is sent; the round carries the found cause's fix, and a cause not found is not sent: it is noted at landing and raised to the user as an open item, by "Stops". A round never asks the builder to find a cause, to reproduce a fault, or to measure until a condition holds.
new:        - **Only known fixes.** Each ruling says what to change.
new:          - A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed by the orchestrator, read-only, before the round is sent.
new:          - The round carries the found cause's fix.
new:          - A cause not found is not sent.
new:          - Such a cause is noted at landing.
new:          - Such a cause is raised to the user as an open item, by "Stops".
new:          - A round never asks the builder to find a cause, to reproduce a fault, or to measure until a condition holds.

old 76:    - **After each reply.** Read the whole delta and, when the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its usage recorded beside the first.
new:        - **After each reply.** Read the whole delta.
new:          - When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its usage recorded beside the first.

old 79:    - A red line the orchestrator cannot fix at landing takes the step back out of main. Its failure is recorded in the step's Step 0 in `plan.md`.
new:        - A red line the orchestrator cannot fix at landing takes the step back out of main.
new:          - Its failure is recorded in the step's Step 0 in `plan.md`.

old 80:    - The step keeps its line and its tag, and is worked again as that step, with no new ruling.
new:        - The step keeps its line and its tag.
new:          - It is worked again as that step, with no new ruling.

old 86:     - The final message opens as "Reports" says, then lists every step landed since the loop began with the path of each report, and the open items.
new:         - The final message opens as "Reports" says.
new:           - It then lists every step landed since the loop began with the path of each report, and the open items.

old 92: - **Orchestrator.** It may also run on Claude Fable. It reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
new:     - **Orchestrator.** It may also run on Claude Fable.
new:       - It reads, decides, invokes the skills, lands and books.
new:       - It never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.

old 97: - Any allowed combination is chosen per step; a new combination is booked in the rulings with what decides it, and measured by its usage row.
new:     - Any allowed combination is chosen per step.
new:     - A new combination is booked in the rulings with what decides it.
new:       - It is measured by its usage row.

old 106: - Every other ledger record is written to disk in the main checkout, and carried by the next of those commits. Such records are a builder's report saved, a refuter report saved, a reviewer recorded, a ruling booked and a usage line.
new:     - Every other ledger record is written to disk in the main checkout. Such records are a builder's report saved, a refuter report saved, a reviewer recorded, a ruling booked and a usage line.
new:       - It is carried by the next of those commits.

old 107: - A resume-point commit holds only the paths the session itself wrote since the last one. Each is named in the `git add -- <path> ...` command.
new:     - A resume-point commit holds only the paths the session itself wrote since the last one.
new:       - Each is named in the `git add -- <path> ...` command.

old 108: - A ledger change the session did not make is listed by path and left alone. One on `plan.md` or the state file is a refusal of `/spec` (the `spec` skill's Steps 1).
new:     - A ledger change the session did not make is listed by path.
new:       - It is left alone.
new:       - One on `plan.md` or the state file is a refusal of `/spec` (the `spec` skill's Steps 1).

old 111: - So a session taking over finds no uncommitted record of the session before it. A ledger change it did not make is listed and left alone, as the bullets above say.
new:     - So a session taking over finds no uncommitted record of the session before it.
new:       - A ledger change it did not make is listed, as the bullets above say.
new:         - It is left alone, as the bullets above say.

old 121: - A step at `landing: backed-out` was taken back out of main by a red line at its landing. Its worktree and its branches are kept, and it stays unticked in `plan.md`.
new:     - A step at `landing: backed-out` was taken back out of main by a red line at its landing.
new:       - Its worktree and its branches are kept.
new:       - It stays unticked in `plan.md`.

old 122: - It is worked again as that step, its line keeping its tag, with no new ruling. Its failure is in its Step 0 in `plan.md`.
new:       - It is worked again as that step, its line keeping its tag, with no new ruling.
new:       - Its failure is in its Step 0 in `plan.md`.

old 132: - A landed step whose worktree or branches are still there is named by its open item (the `land` skill's Stops row "A worktree that cannot be removed"). The removal is run from that open item, on the worktree and branches it names, each only when it still exists, and the open item is then closed.
new:     - A landed step whose worktree or branches are still there is named by its open item (the `land` skill's Stops row "A worktree that cannot be removed"). The removal is run from that open item, on the worktree and branches it names, each only when it still exists.
new:       - The open item is then closed.

old 155: - Whether two steps can run at once is decided by how simply the second one's change lands on the first's, not by their paths alone. For each pair the orchestrator states what each changes in code the other reads or changes, and how the later landing takes it: nothing to merge, a mechanical rerun (a converter, a formatter, a generator), a hand merge of named functions, or a dependency that forces an order. A pair whose later landing needs more than a mechanical rerun or a hand merge of a few named functions runs in sequence.
new:     - Whether two steps can run at once is decided by how simply the second one's change lands on the first's, not by their paths alone.
new:     - For each pair the orchestrator states what each changes in code the other reads or changes, and how the later landing takes it: nothing to merge, a mechanical rerun (a converter, a formatter, a generator), a hand merge of named functions, or a dependency that forces an order.
new:     - A pair whose later landing needs more than a mechanical rerun or a hand merge of a few named functions runs in sequence.

old 156: - Each brief lists the paths its step writes under "Paths this step writes", and `/spec` compares the list with the briefs of the steps in flight by reading them (the `spec` skill's Steps 5).
new:     - Each brief lists the paths its step writes under "Paths this step writes".
new:       - `/spec` compares the list with the briefs of the steps in flight by reading them (the `spec` skill's Steps 5).

old 157: - Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple. It writes that judgment in the later step's dispatch entry as `shared_paths:`, naming each shared file and why the merge is simple; with no shared file the key is left out.
new:     - Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple.
new:       - The orchestrator writes that judgment in the later step's dispatch entry as `shared_paths:`, naming each shared file and why the merge is simple; with no shared file the key is left out.

old 162: - Landings are one at a time, in the order the steps are verified, and a later one lands on the head the earlier left, its whole diff read again there.
new:     - Landings are one at a time, in the order the steps are verified.
new:       - A later one lands on the head the earlier left, its whole diff read again there.

old 168: - It runs in the background, and the runner tracks it and reports when it ends.
new:     - It runs in the background.
new:       - The runner tracks it and reports when it ends.

old 176: - Everything else is closed in the step that is open: a finding inside a brief by the repair rounds or at landing, a fix in a file another step holds at that step's landing. A finding beyond the brief is raised to the user as an open item, by "Stops".
new:     - Everything else is closed in the step that is open: a finding inside a brief by the repair rounds or at landing, a fix in a file another step holds at that step's landing.
new:     - A finding beyond the brief is raised to the user as an open item, by "Stops".

old 179: - A step enters the step list only by the user's ruling, as a line ending with `(ruling <name>)`, and `/spec` refuses a line without its tag.
new:     - A step enters the step list only by the user's ruling, as a line ending with `(ruling <name>)`.
new:       - `/spec` refuses a line without its tag.

old 188: - The other list, the closed one, is the log of what was raised and how it ended, and no report carries it.
new:     - The other list, the closed one, is the log of what was raised and how it ended.
new:       - No report carries it.

old 198: - Work on other steps inside the same window (the next brief, another step's review read) is not separated, and the row says what it shares.
new:     - Work on other steps inside the same window (the next brief, another step's review read) is not separated.
new:       - The row says what it shares.

old 204: - A builder is dispatched only while the longest step so far still fits before the cut-off, and a reviewer or a fix round only while its usual length fits.
new:     - A builder is dispatched only while the longest step so far still fits before the cut-off.
new:     - A reviewer or a fix round is dispatched only while its usual length fits before the cut-off.

old 205: - At the cut-off anything still running is stopped, its worktree kept, the state file rewritten with what was in flight, and the plan paused.
new:     - At the cut-off anything still running is stopped.
new:       - Its worktree is kept.
new:       - The state file is rewritten with what was in flight.
new:       - The plan is paused.

old 226: - The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons. It never goes through a question-box or multiple-choice tool.
new:     - The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons.
new:       - It never goes through a question-box or multiple-choice tool.

old 247: - The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger, and the models it names are those in "The two tiers, and the models".
new:     - The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger.
new:       - The models it names are those in "The two tiers, and the models".

old 250: - After its last round a step lands, and its small findings, the last review's included, are fixed at landing.
new:     - After its last round a step lands.
new:       - Its small findings, the last review's included, are fixed at landing.

old 251: - Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops", never sent back to the builder, and becomes a step only by the user's ruling.
new:     - Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops".
new:       - It is never sent back to the builder.
new:       - It becomes a step only by the user's ruling.
```

### skills/plan-retro/SKILL.md, 5 items split

```text
old 39:    - The runs the previous retro's "Reports read" lists are left out unless the user asks for a retro over everything. They are matched by plan folder, step and run, so a plan moved into `<archive_root>` stays left out and a round added to a report later is read.
new:        - The runs the previous retro's "Reports read" lists are left out unless the user asks for a retro over everything.
new:          - They are matched by plan folder, step and run, so a plan moved into `<archive_root>` stays left out and a round added to a report later is read.

old 49:    - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro. A report in both lists has its runs joined in one entry.
new:        - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro.
new:          - A report in both lists has its runs joined in one entry.

old 69: - A finding whose text reports no defect (a confirmation such as "None." or "No sentence in the pages is made false") or a closure that holds (such as "Spec 1: closed.") is set aside, by reading, as the kind "no defect", counted and listed in the retro's "No defect" section with no proposal.
new:     - A finding whose text reports no defect (a confirmation such as "None." or "No sentence in the pages is made false") or a closure that holds (such as "Spec 1: closed.") is set aside, by reading, as the kind "no defect".
new:       - It is counted and listed in the retro's "No defect" section with no proposal.

old 75: 1. **The rule is not written anywhere.** Grep the rules page and the standards pages for it. When it is absent, the proposal is the rule's text, in the voice and numbering of the page it goes into (the rules page for how a change is made and reported, a standards page for what the code or prose looks like), with the findings it would have prevented cited.
new:     1. **The rule is not written anywhere.** Grep the rules page and the standards pages for it.
new:        - When it is absent, the proposal is the rule's text, in the voice and numbering of the page it goes into (the rules page for how a change is made and reported, a standards page for what the code or prose looks like), with the findings it would have prevented cited.

old 78: 4. **The same, and no command can check the rule.** Only then is the proposal a sharper sentence for the existing rule. It says why no command can check the rule, and quotes the findings that show how builders read the current one.
new:     4. **The same, and no command can check the rule.** Only then is the proposal a sharper sentence for the existing rule.
new:        - It says why no command can check the rule.
new:        - It quotes the findings that show how builders read the current one.
```

### skills/plan/SKILL.md, 6 items split

```text
old 35:    - `<entry>` is matched against the entries by number or title; no match is a stop ("Stops").
new:        - `<entry>` is matched against the entries by number or title.
new:          - No match is a stop ("Stops").

old 37: 4. The `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py`, found as `land.sh` finds `verify.sh`. They are read from the `land` skill's `templates/` under the first of these that holds them: the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`). Not found is a stop ("Stops").
new:     4. The `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py`, found as `land.sh` finds `verify.sh`. They are read from the `land` skill's `templates/` under the first of these that holds them: the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).
new:        - Not found is a stop ("Stops").

old 51: 3. Show the draft to the user, and write `plan.md` once the user has approved or corrected it.
new:     3. Show the draft to the user.
new:        - Write `plan.md` once the user has approved or corrected it.

old 58:    - The dispatch block is empty, the open items are empty, and the position names the first step.
new:        - The dispatch block is empty.
new:        - The open items are empty.
new:        - The position names the first step.

old 59: 5. Copy the `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger folder. `/land` requires the ledger's `land.sh`. With the four beside each other, the ledger's `land.sh` and `land.test.sh` run from the ledger whatever skills are installed. Then make the `ADAPT` edits of `land.sh` and `land.test.sh` from `plan.yaml`:
new:     5. Copy the `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger folder. `/land` requires the ledger's `land.sh`. With the four beside each other, the ledger's `land.sh` and `land.test.sh` run from the ledger whatever skills are installed.
new:        - Then make the `ADAPT` edits of `land.sh` and `land.test.sh` from `plan.yaml`:

old 66: 7. Commit `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh`, `usage.py` and the two `.gitkeep` files by path as the plan's opening commit. Its subject holds the roadmap entry's number.
new:     7. Commit `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh`, `usage.py` and the two `.gitkeep` files by path as the plan's opening commit.
new:        - Its subject holds the roadmap entry's number.
```

### skills/refute/SKILL.md, 9 items split

```text
old 29: 1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
new:     1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
new:        - A required key missing is a refusal ("Stops").

old 35:    - The cases ruling `agents/briefs/<step>-cases.md` when one exists, read with the brief: where it rules a case, the diff is judged against the ruling.
new:        - The cases ruling `agents/briefs/<step>-cases.md` when one exists, read with the brief.
new:          - Where it rules a case, the diff is judged against the ruling.

old 46:    - The step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks (the step's worktree), and the lines it prints are what the refuter report quotes.
new:        - The step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks (the step's worktree).
new:        - The lines `verify.sh` prints are what the refuter report quotes.

old 48:    - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so and reproduces what it can from the one build.
new:        - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so.
new:          - It reproduces what it can from the one build.

old 55: 7. The orchestrator or the session saves the report at `agents/reviews/<step>-refuter.md`. It records the report's usage in the state file's table and its path under the dispatch block's `reviewer_report` field.
new:     7. The orchestrator or the session saves the report at `agents/reviews/<step>-refuter.md`.
new:        - It records the report's usage in the state file's table and its path under the dispatch block's `reviewer_report` field.

old 70: 6. The orchestrator or the session appends the run's findings to the same file under "Repair round <n>, refuted", in the same shape. It records the run as Steps 7 says.
new:     6. The orchestrator or the session appends the run's findings to the same file under "Repair round <n>, refuted", in the same shape.
new:        - It records the run as Steps 7 says.

old 71: 7. The findings of the run over the last round are never sent to the builder: each is fixed at landing when it is small and inside the brief, or raised to the user as "Finding dispositions" says.
new:     7. The findings of the run over the last round are never sent to the builder.
new:        - Each is fixed at landing when it is small and inside the brief, or raised to the user as "Finding dispositions" says.

old 72: 8. With `refute_after_repair: no` these runs do not happen, and the orchestrator's read of the delta stands in for them.
new:     8. With `refute_after_repair: no` these runs do not happen.
new:        - The orchestrator's read of the delta stands in for them.

old 106: - A finding is closed by the builder in a repair round (at most `repair_rounds`, or one more under `plan-orchestration`'s exception), or at landing, or raised to the user as an open item in the state file, as `plan-orchestration`'s Stops section says; it becomes a step only by the user's ruling.
new:     - A finding is closed by the builder in a repair round (at most `repair_rounds`, or one more under `plan-orchestration`'s exception), or at landing, or raised to the user as an open item in the state file, as `plan-orchestration`'s Stops section says.
new:       - It becomes a step only by the user's ruling.
```

### skills/repo-setup/SKILL.md, 6 items split

```text
old 40:    - A placeholder with no answer is shown to the user, and never written as `<...>`.
new:        - A placeholder with no answer is shown to the user.
new:          - It is never written as `<...>`.

old 46: 8. Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`, and its check passes.
new:     8. Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`.
new:        - Its check passes.

old 64:     - `.agents/skills/` and `.claude/` are ignored and not committed; `skills-lock.json` is.
new:         - `.agents/skills/` and `.claude/` are ignored and not committed.
new:         - `skills-lock.json` is committed.

old 79: 7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing, and show the line with the file it names ("Stops").
new:     7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing.
new:        - Show the line with the file it names ("Stops").

old 89: 4. The license [MIT] and its holder. MIT is written from `templates/LICENSE-MIT`; another license is written from the text the user gives or from its SPDX name's official text, fetched and shown.
new:     4. The license [MIT] and its holder.
new:        - MIT is written from `templates/LICENSE-MIT`; another license is written from the text the user gives or from its SPDX name's official text, fetched and shown.

old 144: - A page it writes states rules the user or a template gave; it never adds a rule of its own.
new:     - A page it writes states rules the user or a template gave.
new:       - It never adds a rule of its own.
```

### skills/roadmap/SKILL.md, 5 items split

```text
old 43: 2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below; nothing is written yet.
new:     2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below.
new:        - Nothing is written yet.

old 57:    - A goal whose gate cannot be named is not added: that is a stop ("Stops").
new:        - A goal whose gate cannot be named is not added.
new:          - That is a stop ("Stops").

old 87: - **The level of an added entry.** It goes at the level the user names; a goal that does not settle it is a stop ("Stops").
new:     - **The level of an added entry.** It goes at the level the user names.
new:       - A goal that does not settle it is a stop ("Stops").

old 101: - `done` ticks the entry, and ticks the capability only when every scope item of it is met.
new:     - `done` ticks the entry.
new:       - It ticks the capability only when every scope item of it is met.

old 102: - An entry that meets part of a capability ticks those scope items and leaves the capability open.
new:     - An entry that meets part of a capability ticks those scope items.
new:       - It leaves the capability open.
```

### skills/spec/SKILL.md, 30 items split

```text
old 30: 1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
new:     1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
new:        - A required key missing is a refusal ("Stops").

old 36:    - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight. The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.
new:        - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight.
new:          - The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.

old 39:    - The step list is the section `## Steps, in execution order`, and the rulings are the section `## Rulings`; a `plan.md` without either section is a refusal ("Stops").
new:        - The step list is the section `## Steps, in execution order`, and the rulings are the section `## Rulings`.
new:          - A `plan.md` without either section is a refusal ("Stops").

old 51:    - Any unrelated change of the user's outside the ledger folder is listed by path and left alone.
new:        - Any unrelated change of the user's outside the ledger folder is listed by path.
new:          - It is left alone.

old 55:    - Any other change under the ledger folder is left alone and never committed.
new:        - Any other change under the ledger folder is left alone.
new:          - It is never committed.

old 57:    - `plan.md` is copied aside to the session's scratch folder before Steps 2. A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.
new:        - `plan.md` is copied aside to the session's scratch folder before Steps 2.
new:          - A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.

old 61:    - A step whose line carries the user's authority goes on, and the session notes the tags that give it.
new:        - A step whose line carries the user's authority goes on.
new:          - The session notes the tags that give it.

old 63:    - A `plan.md` that is missing or not UTF-8, lacks a section, or lists a step twice is a refusal ("Stops"), and so is a step not in the list, with the list printed.
new:        - A `plan.md` that is missing or not UTF-8, lacks a section, or lists a step twice is a refusal ("Stops").
new:        - A step not in the list is a refusal ("Stops"), with the list printed.

old 88:    - A choice the plan leaves open is taken in the brief and listed under "Decisions taken in this brief", each reversible.
new:        - A choice the plan leaves open is taken in the brief.
new:          - It is listed under "Decisions taken in this brief", each reversible.

old 90:    - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree, and the brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.
new:        - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree.
new:          - The brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.

old 91:    - Every item of "What to build" is a change whose content is known. An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item; a cause it cannot find is left out of the brief and raised to the user as an open item.
new:        - Every item of "What to build" is a change whose content is known.
new:        - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item.
new:          - A cause it cannot find is left out of the brief.
new:          - Such a cause is raised to the user as an open item.

old 92:    - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken: it is a stop ("Stops").
new:        - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken.
new:          - It is a stop ("Stops").

old 95:    - The brief is committed at Steps 6, before the apply. Its section "The patch as applied" is added after Steps 7, as Steps 7 says.
new:        - The brief is committed at Steps 6, before the apply.
new:          - Its section "The patch as applied" is added after Steps 7, as Steps 7 says.

old 98:    - A shared path is a file both briefs name, whatever lines each names. It is not a refusal: it goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.
new:        - A shared path is a file both briefs name, whatever lines each names. It is not a refusal.
new:          - It goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.

old 99:    - When the merge at landing is judged simple, the step goes on, and Steps 9 writes `shared_paths:` in its dispatch entry, naming each shared file and why the merge is simple.
new:        - When the merge at landing is judged simple, the step goes on.
new:          - Steps 9 writes `shared_paths:` in its dispatch entry, naming each shared file and why the merge is simple.

old 100:    - When it is not judged simple, the step waits until the other step lands, and this run leaves nothing. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
new:        - When it is not judged simple, the step waits until the other step lands.
new:          - This run leaves nothing. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).

old 102:    - What "Steps / A step taken back out of main" did stays done. The patch stays in the ledger, and `/spec` run again prepares the step with it.
new:        - What "Steps / A step taken back out of main" did stays done.
new:          - The patch stays in the ledger.
new:          - `/spec` run again prepares the step with that patch.

old 107:    - The paths are written out in the `git add -- <path> ...` command. A ledger change the session did not make is not among them.
new:        - The paths are written out in the `git add -- <path> ...` command.
new:          - A ledger change the session did not make is not among them.

old 111:    - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`, and read what it prints. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
new:        - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
new:          - Read what it prints.

old 114:    - Before the dispatch commit, the session adds the section "The patch as applied" to the brief. It lists the files applied clean and the files left with conflict markers, which the builder finishes from the markers.
new:        - Before the dispatch commit, the session adds the section "The patch as applied" to the brief.
new:          - The section lists the files applied clean and the files left with conflict markers, which the builder finishes from the markers.

old 125:    - The entry is not committed here. It is committed once the builder's identity is in it: under `agent` right after the launch, and under `inline` and `academic-paper` before the build starts.
new:        - The entry is not committed here.
new:          - It is committed once the builder's identity is in it: under `agent` right after the launch, and under `inline` and `academic-paper` before the build starts.

old 127:    - Under `plan-orchestration`, its Steps 4 makes that commit under every executor. Run by hand, the session writes itself as the identity and makes it before the build starts.
new:        - Under `plan-orchestration`, its Steps 4 makes that commit under every executor.
new:        - Run by hand, the session writes itself as the identity.
new:          - It makes that commit before the build starts.

old 134: 1. Read the entry's `base` and `worktree`. The branch is the worktree folder's name, and `<branch>-land` beside it; no path or branch is built from the step id.
new:     1. Read the entry's `base` and `worktree`.
new:        - The branch is the worktree folder's name, and `<branch>-land` beside it.
new:        - No path or branch is built from the step id.

old 135: 2. From inside the kept worktree, `git status --porcelain --untracked-files=all` lists only paths under the ledger root. Any other path is a refusal ("Stops") that names it, and nothing is removed.
new:     2. From inside the kept worktree, `git status --porcelain --untracked-files=all` lists only paths under the ledger root.
new:        - Any other path is a refusal ("Stops") that names it, and nothing is removed.

old 136: 3. Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file, run the diff again, and compare the two with `cmp`. With `--binary` the patch carries a binary file's content.
new:     3. Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file. With `--binary` the patch carries a binary file's content.
new:        - Run the diff again, and compare the two with `cmp`.

old 138:    - An empty diff writes no patch and removes a patch an earlier back-out of the step left there.
new:        - An empty diff writes no patch.
new:          - It removes a patch an earlier back-out of the step left there.

old 142: 5. Remove the entry from the dispatch block, and read the state file back: the other entries, the comment and blank lines under `dispatch:`, and every other byte as they were.
new:     5. Remove the entry from the dispatch block.
new:        - Read the state file back: the other entries, the comment and blank lines under `dispatch:`, and every other byte as they were.

old 145:    - Steps 6 makes a new preparation commit, and Steps 7 a new worktree with the patch applied by `git apply --3way`.
new:        - Steps 6 makes a new preparation commit.
new:        - Steps 7 makes a new worktree with the patch applied by `git apply --3way`.

old 168:    - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).", and the step's tag names it as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;
new:        - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).";
new:        - for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;

old 201: - A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them. Only the session that wrote it commits it.
new:     - A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them.
new:       - Only the session that wrote it commits it.
```

## Items read, split and kept, per file

`items.sh` (list items outside code fences) on the base and changed files, the split data, and `wc -l`:

| File | Items read | Split | Kept | Items after | Lines before | Lines after |
|---|---|---|---|---|---|---|
| land | 101 | 25 | 76 | 130 | 167 | 196 |
| ordo-init | 60 | 6 | 54 | 66 | 116 | 122 |
| plan-help | 12 | 1 | 11 | 13 | 93 | 94 |
| plan-orchestration | 141 | 43 | 98 | 205 | 252 | 316 |
| plan-retro | 46 | 5 | 41 | 52 | 105 | 111 |
| plan | 39 | 6 | 33 | 46 | 92 | 99 |
| refute | 73 | 9 | 64 | 82 | 135 | 144 |
| repo-setup | 59 | 6 | 53 | 65 | 148 | 154 |
| roadmap | 50 | 5 | 45 | 55 | 137 | 142 |
| spec | 126 | 30 | 96 | 161 | 202 | 237 |
| Total | 707 | 136 | 571 | 875 | 1447 | 1615 |

The 136 split items became 304 items (875 - 571).

## Items kept

The reasons are the kinds of What to build 2: qualifier (an exception, a limit, a condition, a default), list (a list inside one requirement), explanation (a since/so/because clause, a reason, or a pointer to where the rule is stated), definition, entry (of a semicolon-ended list), one act.

The brief's flag count (187) is not reproduced by any count I ran (see "Anything in the brief that was wrong"). The widest count I could reproduce, an item holding a semicolon or a full stop followed by a space and a word anywhere, nothing stripped, flags 164 items; `python3 flagged.py` (scratchpad) prints "164 flagged; 80 split; 84 kept". These 84 were kept:

- land 52 (explanation: "the ledger is written only on main" is the reason for the restore); land 53 (explanation: the "so" clause with its limit); land 65 (explanation: the second sentence points at where it is said how); land 108, 109, 110, 111 (entries); land 116 (explanation: the second sentence is what follows from the first); land 125 (qualifier: a worktree already gone skips steps 2 and 3, an exception); land 126 (explanation: the reason); land 128, 129 (explanation: why `--force`, why `-D`); land 154 (explanation: how `/spec` does it, with the pointer).
- ordo-init 46 (explanation: "`/roadmap add` fills it" says why it has no entries); ordo-init 57 (qualifier: the default "otherwise the example's values"); ordo-init 74 (list, the brief's case; its reference number follows its target); ordo-init 86 (list: what the check reports); ordo-init 112 (qualifier: the one exception).
- plan-orchestration 46 (explanation: what `/spec` does); 50 (qualifier: one precedence with its defaults); 53 (list: what the prompt states); 62 (definition: the notification carries the final message, which the next sentence uses); 68 (list: the review values in the parenthesis); 78 (explanation, the brief's case); 82 (explanation: pointer); 104 (explanation: the second sentence states the same rule by where things are); 105 (definition with its list); 109 (explanation: the first sentence is the reason for the second); 110 (definition: a handover is a resume point, used by the second sentence); 123 (explanation, the brief's case); 158 (explanation: no script checks the judgment); 183 (definition: the position line's form); 193 (list: the row's columns); 194 (definition: what the columns measure, which the rule "judged on both" uses); 249 (qualifier: the round cap with its exception and its two limits).
- plan-retro 31 (qualifier: the default with no previous retro); 50 (explanation: the consequence); 105 (explanation: where those live instead).
- plan 88 (definition, with its exception); 92 (explanation: where history lives instead).
- refute 56 (explanation: the second sentence says when they are committed, with the pointer); refute 66, 67, 77 to 83, 86 to 92, 95 to 100 (entries).
- repo-setup 68 (explanation: how the steps below are ordered); 69 (one requirement under one condition, with its definition); 70 (the brief's case: one action under one condition); 82 (qualifier: the default "otherwise stop"); 146 (explanation: "nothing is assumed" restates the limit).
- roadmap 85 (list: the examples in the parenthesis).
- spec 53 (definition); 56 (explanation: the reason); 75 (definition of "settled" with what it entails and its limit, judgment call 6); 94 (qualifier: the condition, then the brief's contents as a list); 112 (qualifier: the condition the second sentence handles); 116 (definition of "main's change"); 120 (definition and default: none named, none staged); 122 (qualifier: the two shapes by condition); 124 (qualifier: the default "with no shared file the key is left out"); 151 (definition: what the open item holds); 165, 166, 169 (entries); 167 (entry holding a list: its own line and its own Step 0); 171 (explanation: what `/spec` does).

Kept items not flagged by any count, at least three per file where the flagged list above has fewer, and the kept items joined by "and" that were closest to a split:

- plan-help 30 (one requirement: how `<entry>` resolves); 31 (explanation: why the heading, not the folder name, finds the plan; the same item in land 30, refute 31, spec 32); 33 (list of inputs); 40 (list of what is printed).
- plan-retro 38 (definition, then "noted with" its list); 67 (qualifier: "or set aside when ..." is the exception); 102 (one rule: the skill only reads, "reads ... and never edits"; kept, so plan-retro's `Rules 2` still points at the counts rule).
- plan 54 (qualifier and list: every key written, defaults included); 55 (explanation: not a project specific, so not in `plan.yaml`).
- roadmap 42 (explanation: "it changes nothing and shows nothing for approval" says what "ends there" means); 60 (definition of the place, with its reason); 99 (qualifier: in its format, every scope item open).
- ordo-init 60 (list: how `libraries` is asked, with its reason); 68 (one act: write the keys as the example has them, its comment and its order, judgment call 6).
- land 47 (qualifier: "while no `git` process runs"); land 69 (definition, then the rule "fixed before the booking"); land 83 (explanation: already staged, so not re-added); land 89 (explanation: what a left file means, then the amend); land 96 (qualifier: fixed when small, otherwise raised, a default, judgment call 2); land 127 (definition of the stop: it names the path and removes nothing).
- plan-orchestration 133 (explanation: the second clause is the first rule stated negatively); 138 (list of the two conditions); 141 (qualifier: a limit under `earned`); 146 (one act: grouping needs the reading); 148 (qualifier: the exception "only when no command can check it"); 222 (list: booked in two places, one act of booking).
- refute 47 (one act: the comparison needs the rerun); 108 (qualifier: "each finding's disposition under the Closed heading" says where); 132 (definition, see case 8).
- repo-setup 44 (explanation: what the CLI does, not a step of the skill); 147 (explanation: installed per user and one copy loaded restate the prohibition).
- spec 67 (explanation: "never left for the builder to hit" restates the rule); 101 (list: what "this run leaves nothing" consists of); 137 (definition of the refusal: nothing is removed); 170 (entry, with its explanation).
- plan-help 42 (one output, one act: an open item waiting on a ruling is printed with its `Ruled: ...` line; ruling 3 of repair round 1).
- land 98 (definition: "An empty `look:` means the step has no look" defines the case the note states; ruling 7 of repair round 1).

## Position references before and after

The grep of "What is on the tree", rerun on the changed tree, printed 105 lines, as before. `diff <(cut -d: -f1,3 refs-before.txt | sort) <(cut -d: -f1,3 refs-now.txt | sort)` printed only:

```text
21c21
< skills/ordo-init/SKILL.md:Rules 4
---
> skills/ordo-init/SKILL.md:Rules 5
```

The grep captures only the first number of "Rules 4 and 5" at ordo-init 112, which was "Rules 4". ordo-init Rules 4 of the base ("The skill never overwrites an existing page or `.agents/plan.yaml`. A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.") is now Rules 4 (the overwrite) and Rules 5 (the diff); Rules 3 gained a sub-bullet, which is not a Rules bullet, so Rules 5 and 6 of the old count do not apply. ordo-init 76 (`the .gitignore changes, as Rules 5 says`) names the diff rule; ordo-init 111 (`Rules 2 and 3`) is unchanged; ordo-init 112 (`Rules 4 and 5`) names both halves. plan-orchestration 303's "the round cap and the two bullets after it" names Rules 310, 311 and 313, since the requirements split from those two bullets are their sub-bullets.

Each reference, resolved by `refs.py` (scratchpad) to the list it names (`Steps <n>` and `"What it reads" <n>` to the numbered item of that section, `Rules <n>` to the n-th Rules bullet, and to another skill's list where the text names that skill), with its line before and after and the rule text it points at after the change. The spec 127 row is resolved by hand: its text names `plan-orchestration`'s Steps 4, which `refs.py` resolves to spec's own list.

```text
land:48 -> 53 | Steps 4 -> Steps 4 | same rule | On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, so the landing applies t
land:73 -> 90 | Steps 14 -> Steps 14 | same rule | Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 1
land:78 -> 95 | Steps 1 -> Steps 1 | same rule | Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
land:90 -> 108 | Steps 11 -> Steps 11 | same rule | Read the step's `worktree` from its dispatch entry, for Steps 14.
land:94 -> 112 | Steps 7 -> Steps 7 | same rule | Open the changed views, as "The look" says.
land:104 -> 123 | Steps 3, 4, 6 -> Steps 3, 4, 6 | same rule | In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's t
land:105 -> 124 | Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
land:118 -> 140 | Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
land:118 -> 141 | Steps 7 -> Steps 7 | same rule | Open the changed views, as "The look" says.
land:122 -> 145 | Steps 14 -> Steps 14 | same rule | Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 1
land:124 -> 147 | Steps 11 -> Steps 11 | same rule | Read the step's `worktree` from its dispatch entry, for Steps 14.
land:137 -> 162 | Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
land:138 -> 163 | Steps 3 -> Steps 3 | same rule | In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's t
land:142 -> 167 | plan`s Steps 5 -> Steps 5 | same rule | Copy the `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/us
land:145 -> 170 | Steps 1 -> Steps 1 | same rule | Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
land:146 -> 171 | Steps 14 -> Steps 14 | same rule | Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 1
land:146 -> 171 | Steps 11 -> Steps 11 | same rule | Read the step's `worktree` from its dispatch entry, for Steps 14.
ordo-init:30 -> 31 | Steps 11 -> Steps 11 | same rule | Stop for the approval ("Stops").
ordo-init:74 -> 76 | Rules 4 -> Rules 5 | updated, same rule | A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
ordo-init:80 -> 83 | What it reads 3 -> What it reads 3 | same rule | The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, 
ordo-init:81 -> 84 | repo-setup`s Steps 12 -> Steps 12 | same rule | Commit the setup's other files in one commit by explicit path list, the subject naming the repository's setup.
ordo-init:96 -> 100 | Steps 11 -> Steps 11 | same rule | Stop for the approval ("Stops").
ordo-init:96 -> 100 | Steps 10 -> Steps 10 | same rule | Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in fu
ordo-init:98 -> 102 | Steps 6 -> Steps 6 | same rule | Ask the user for the keys the repository cannot give ("Stops").
ordo-init:98 -> 102 | Steps 6 -> Steps 6 | same rule | Ask the user for the keys the repository cannot give ("Stops").
ordo-init:99 -> 103 | Steps 3 -> Steps 3 | same rule | Draft `verification`: the page that defines the green check, with the commands every step runs and the directo
ordo-init:101 -> 105 | Steps 14 -> Steps 14 | same rule | Commit the files written by explicit path list, in one commit whose subject names the plan configuration.
ordo-init:107 -> 111 | Rules 2, 3 -> Rules 2, 3 | same rule | The skill draws only from the repository and the user, for the file it drafts and for every page. / A page the
ordo-init:108 -> 112 | Rules 4 -> Rules 4, 5 | updated, same rule | The skill never overwrites an existing page or `.agents/plan.yaml`. / A change to an existing file, `.gitignor
ordo-init:112 -> 116 | Steps 3 -> Steps 3 | same rule | Draft `verification`: the page that defines the green check, with the commands every step runs and the directo
plan-help:89 -> 90 | Steps 1 -> Steps 1 | same rule | Print the sequence in "The sequence, printed verbatim".
plan-orchestration:48 -> 51 | spec`s Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
plan-orchestration:55 -> 66 | Steps 5, 8 -> Steps 5, 8 | same rule | While the builder runs, do ledger work only: the next step's premise checks, the bookings, the usage table. / 
plan-orchestration:61 -> 76 | Steps 4 -> Steps 4 | same rule | Choose the step's executor.
plan-orchestration:66 -> 84 | Steps 8 -> Steps 8 | same rule | Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the
plan-orchestration:108 -> 147 | spec`s Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
plan-orchestration:156 -> 204 | spec`s Steps 5 -> Steps 5 | same rule | Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by read
plan-orchestration:161 -> 210 | Steps 4 -> Steps 4 | same rule | Choose the step's executor.
plan-orchestration:167 -> 217 | Steps 4 -> Steps 4 | same rule | Choose the step's executor.
plan-orchestration:169 -> 220 | Steps 8 -> Steps 8 | same rule | Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the
plan-orchestration:170 -> 221 | Steps 6 -> Steps 6 | same rule | On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed o
plan-orchestration:196 -> 250 | land`s Steps 9 -> Steps 9 | same rule | Produce the orchestrator's usage row with `templates/usage.py <session log> <from> <to>`: the session log is t
plan-retro:30 -> 30 | Steps 1 -> Steps 1 | same rule | Read each report "What it reads" 2 lists, run by run: the first review, under its Spec, Proof, Standards and B
plan-retro:37 -> 37 | What it reads 2 -> What it reads 2 | same rule | Every refuter report under `<ledger_root>/` and `<archive_root>/`, each `agents/reviews/<step>-refuter.md`, le
plan-retro:84 -> 90 | Steps 10 -> Steps 10 | same rule | Take the user's decision on each proposal, one by one: approved, corrected or declined ("Stops").
plan-retro:86 -> 92 | Steps 1 -> Steps 1 | same rule | Read each report "What it reads" 2 lists, run by run: the first review, under its Spec, Proof, Standards and B
plan-retro:97 -> 103 | Steps 10, 12 -> Steps 10, 12 | same rule | Take the user's decision on each proposal, one by one: approved, corrected or declined ("Stops"). / Make the a
plan-retro:98 -> 104 | Rules 2 -> Rules 2 | same rule | Counts come from the findings listed in the retro, each with its report and location, and the grouping written
plan:72 -> 79 | Steps 2 -> Steps 2 | same rule | Draft `plan.md` from `templates/plan.md`.
plan:76 -> 83 | What it reads 4 -> What it reads 4 | same rule | The `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.p
plan:83 -> 90 | Steps 3 -> Steps 3 | same rule | Show the draft to the user.
refute:61 -> 66 | Rules 1 -> Rules 1 | same rule | The reviewer is a fresh session or agent every time, for the first run and every run over a repair round: neve
refute:70 -> 76 | Steps 7 -> Steps 7 | same rule | The orchestrator or the session saves the report at `agents/reviews/<step>-refuter.md`.
refute:124 -> 133 | Steps 6 -> Steps 6 | same rule | The reviewer writes the report from `templates/report.md`.
refute:127 -> 136 | Steps 3, 4 -> Steps 3, 4 | same rule | The reviewer runs every command in the brief's verification list, from the directory each names, piped through
refute:128 -> 137 | Steps 6 -> Steps 6 | same rule | The reviewer writes the report from `templates/report.md`.
repo-setup:61 -> 63 | Steps 8 -> Steps 8 | same rule | Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`.
repo-setup:119 -> 124 | Steps 2 -> Steps 2 | same rule | Ask "The questions", together, in plain prose, each with its default in brackets ("Stops").
repo-setup:120 -> 125 | Steps 4 -> Steps 4 | same rule | Show the draft, the tree and every file's text together ("Stops").
repo-setup:124 -> 129 | Steps 12 -> Steps 12 | same rule | Commit the setup's other files in one commit by explicit path list, the subject naming the repository's setup.
repo-setup:137 -> 142 | Steps 3 -> Steps 3 | same rule | Draft "The tree", every file with its full text.
repo-setup:142 -> 147 | Steps 1 -> Steps 1 | same rule | Run `git init` when the folder is not a repository.
repo-setup:142 -> 147 | Steps 4 -> Steps 4 | same rule | Show the draft, the tree and every file's text together ("Stops").
roadmap:109 -> 114 | Steps 3 -> Steps 3 | same rule | Show each change as a diff of the roadmap file, and of the system file for a map.
roadmap:128 -> 133 | Rules 1 -> Rules 1 | same rule | Nothing is added that the user did not ask for.
roadmap:129 -> 134 | Rules 2 -> Rules 2 | same rule | Entry text states the goal, the gate and the dependencies.
spec:37 -> 39 | Steps 5 -> Steps 5 | same rule | Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by read
spec:42 -> 45 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:54 -> 58 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:56 -> 61 | Steps 2, 9 -> Steps 2, 9 | same rule | Check every premise the step's text makes against the tree. / Write the dispatch block into the state file: st
spec:57 -> 62 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:57 -> 63 | Steps 5 -> Steps 5 | same rule | Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by read
spec:58 -> 64 | Steps 4 -> Steps 4 | same rule | Write `agents/briefs/<step>.md` from `templates/brief.md`.
spec:60 -> 66 | What it reads 4 -> What it reads 4 | same rule | `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
spec:65 -> 73 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:68 -> 76 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:89 -> 98 | Steps 3 -> Steps 3 | same rule | Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
spec:94 -> 108 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:95 -> 109 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:95 -> 110 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:95 -> 110 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:99 -> 116 | Steps 9 -> Steps 9 | same rule | Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `
spec:101 -> 119 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:103 -> 123 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:105 -> 125 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:124 -> 147 | Steps 5 -> Steps 5 | same rule | Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by read
spec:126 -> 150 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:127 -> 151 | plan-orchestration`s Steps 4 -> Steps 4 | same rule | Choose the step's executor.
spec:132 -> 158 | land`s Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
spec:132 -> 158 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:143 -> 175 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:144 -> 176 | Steps 4 -> Steps 4 | same rule | Write `agents/briefs/<step>.md` from `templates/brief.md`.
spec:145 -> 177 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:145 -> 178 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:146 -> 179 | Steps 9 -> Steps 9 | same rule | Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `
spec:168 -> 202 | What it reads 4 -> What it reads 4 | same rule | `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
spec:169 -> 203 | Steps 3 -> Steps 3 | same rule | Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
spec:170 -> 204 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:179 -> 213 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:180 -> 214 | Steps 3 -> Steps 3 | same rule | Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
spec:181 -> 215 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:182 -> 216 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:183 -> 217 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:186 -> 220 | land`s Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
spec:187 -> 221 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
105 references; the two rows marked by refs.py for a hand check are the ordo-init updates, checked by hand above
```

## Numbered items

`python3 numbered.py orig <ten skills>` (scratchpad), run from the worktree, prints for each file whether the numbered items keep their sections and numbers, and every item whose text is no longer a prefix of its base text. Its output:

```text
land 25 numbered items, same sections and numbers
TEXT NOT PREFIX ordo-init ## Steps 10 | Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification 
ordo-init 24 numbered items, same sections and numbers
plan-help 6 numbered items, same sections and numbers
plan-orchestration 16 numbered items, same sections and numbers
plan-retro 24 numbered items, same sections and numbers
plan 11 numbered items, same sections and numbers
refute 22 numbered items, same sections and numbers
repo-setup 33 numbered items, same sections and numbers
roadmap 23 numbered items, same sections and numbers
TEXT NOT PREFIX spec ### A step taken back out of main 3 | Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file. With `--binary` the patch carrie
spec 25 numbered items, same sections and numbers
```

The counts add to 209. The two "TEXT NOT PREFIX" lines are the ordo-init reference update (What to build 4) and spec "A step taken back out of main" 3, whose "run the diff again, and compare the two with `cmp`" became its sub-bullet (judgment call 8).

## Judgment calls

1. **The test for two requirements.** Two clauses with their own verbs, each of which can be broken while the other holds, were split. A list of objects under one verb ("booked in the open items ... and under the step's Step 0", "asked with its two values ... and with no offered answer") was kept as a list inside one requirement. A second action that cannot be done without the first (read, then group; rerun, then compare; diagnose, then write the found cause) was kept: the second cannot hold while the first is broken, so they are one act.
2. **A conditional with a default.** A rule that sends each case one way under a condition and the other way otherwise ("fixed at landing when it is small and inside the brief, or raised ..."; "otherwise stop"; "MIT is written from ...; another license is written from ...") was kept as one rule with its default (land base 96, refute base 71's sub-bullet, repo-setup 82 and 89's sub-bullet). Where a branch held two acts, the acts were split and the second is a sub-bullet of the first, which carries the condition (spec 152-153: "Run by hand, the session writes itself as the identity." with "It makes that commit before the build starts." under it).
3. **"Is not X: it is Y".** An item saying what is not done and what is done instead was split, since each can be broken alone (a stop not raised; a thing done and a stop raised): land base 61, ordo-init base 52, roadmap base 57, spec base 92 and 125, refute base 71. The same for "listed by path and left alone" (land base 36, plan-orchestration base 108 and 111, spec base 51) and "left alone and never committed" (spec base 55). The second half is a sub-bullet with a pronoun subject (ruling A.2).
4. **Labels written once (ruling A.2).** A labelled item whose later requirements share its label keeps the label on the first requirement, and the later requirements are its sub-bullets without the label: plan-orchestration 64 (`inline`), 67 (`academic-paper`), 95 ("Only known fixes"), 123 ("Orchestrator"); roadmap 89 ("The level of an added entry"). The label references "Steps 4 ("The builder")" and "Steps 8's "How" and "Before the resume"" still find their items. At plan-orchestration 123-125 the sub-bullets under "**Orchestrator.** It may also run on Claude Fable." state what the orchestrator does and does not do on any model; the label, not the parent sentence, is their scope, and nesting adds no condition to them.
5. **A requirement whose subject or condition is in the item above (ruling A.1).** It is a sub-bullet of that item: Case 1's and Case 2's later requirements, Case 4's "The loop moves on" (ruling 10), Case 5's "A report in both lists", land 177 "Removing them", plan-help 43 kept whole. Where the base item was itself a sub-bullet, the new item is at the third level; plan base 60-64 and spec base 115-116 were moved one level deeper to stay under the item that now holds their lead-in (judgment call 9).
6. **The third level (ruling A.3).** Where a fourth level would be needed, the requirements stay siblings at the third level with a short-form subject: plan-orchestration 99-100 ("Such a cause is noted at landing.", "Such a cause is raised to the user ..."), spec 104 ("Such a cause is raised to the user as an open item."). No item is deeper than three levels (`formcheck.py`).
7. **Kept, where a split needs words the old text does not have or would part a qualifier from its rule.** plan-orchestration base 76's "its usage recorded beside the first" and base 122's "its line keeping its tag" are absolute phrases; splitting them needs a new verb. plan-orchestration base 70 keeps "on disk; the next resume-point commit carries them" with the write it attaches to. spec base 75 (a ruled candidate "is settled", what that entails, and its limit) is one definition with its limit. ordo-init base 68 (the example's comment and its order) is one act, writing the keys as the example has them. plan-orchestration base 249 (the round cap, its exception and its two limits) is kept whole (now line 310), so the Anti-patterns reference counts it as one bullet. refute Rules 1 is kept (Case 8).
8. **Verbs and qualifiers repeated.** Where a split parts clauses that shared one verb, the verb is repeated in the new item ("is", "are", "is dispatched", "makes", "committed"). Where a qualifier governed both halves and the second half is a sibling, the qualifier is repeated in it (plan-orchestration 260 "before the cut-off"; 151-152 ", as the bullets above say"). spec "A step taken back out of main" 3 keeps "With `--binary` the patch carries a binary file's content." with the write it explains, and the rerun and `cmp` become its sub-bullet above the existing sub-bullets about the compare; spec base 111 follows the brief's own run (the apply with its second sentence, then "Read what it prints.").
9. **Re-indented lines.** plan Steps 5's lead-in "Then make the `ADAPT` edits of `land.sh` and `land.test.sh` from `plan.yaml`:" is a requirement of its own and became a sub-bullet; its five entries (base 60-64) were indented two more spaces (`     - `) to stay its entries. spec base 115-116 ("It lists the files skipped ...", "It lists the binary files ...") were indented the same way to stay under "The section lists ..." (spec 137), whose parent now holds "Before the dispatch commit, the session adds the section". No word of the re-indented lines changed (`git diff -U0 --word-diff=plain` shows only the indentation).
10. **Pronoun subjects.** A new item that is a sub-bullet uses a pronoun for a subject its parent names (ruling A.2). A new item that is not a sub-bullet names its subject (for example "The lines `verify.sh` prints ...", "The failure is never sent back to the builder.", "The orchestrator ..."). `pronoun.py` lists the pronoun-led items the diff adds that have no parent; each is explained under "Form checks".

## Anything in the brief that was wrong

- The brief's flag count, "187 hold a semicolon or a second sentence outside backticks and parentheses: land 32 of 101, ordo-init 10 of 60, plan-help 2 of 12, plan-orchestration 43 of 141, plan-retro 8 of 46, plan 6 of 39, refute 28 of 73, repo-setup 14 of 59, roadmap 3 of 50, spec 41 of 126", is not reproduced by any count I ran over the 707 items: semicolon or ". " outside backticks and parentheses gives 161; the same with nothing stripped gives 164 (`flagged.py`); adding ": " gives 270 to 289. The brief does not give its command. The scope is unaffected: every one of the 707 items was read and decided, and the brief says the count is a guide. The totals the brief states are confirmed: 707 items (`items.sh`) and 1447 lines (`wc -l`).
- Cases 4's text, which made "The loop moves on to the next unblocked step." a sibling, is corrected by ruling 10 of repair round 1; the tree follows the ruling.
- plan-retro 43-45 open "For each kind" three times in a row, against ruling A.4 and prose-standard section 0. The text is in the base and the diff does not touch it (`git diff -U0 skills/plan-retro/SKILL.md` has hunks at 39, 49, 69, 75 and 78 only). Rewriting it is outside this step's brief (rule 20); it is raised here for the orchestrator.
- Ruling 8 gives spec 71 the text "A step not in the list is a refusal ("Stops"), with the list printed.", which is also the text of spec 46 ("What it reads" 4's sub-bullet, base line 43). The two items state the same rule in two sections; the tree follows the ruling.

## Repair round 1

Each ruling of `agents/briefs/25-round-1.md`, with the file:line where the tree now holds it and the new text. Every row's line and text are printed by `grep -nF -- '<text>' skills/<file>/SKILL.md`, run over the list in `rows25.txt` (scratchpad); the surrounding lines by `sed -n '<a>,<b>p'`.

| Ruling | File:line | New text | Command |
|---|---|---|---|
| A.1, A.2 | every split | a new item names its subject and condition, or is a sub-bullet of the item that does; a shared label is written once | `formcheck.py`, `pronoun.py` (Form checks) |
| A.3 | every split | no item deeper than three levels; third-level siblings use "Such a cause" | `formcheck.py` prints no DEPTH line |
| A.4 | every split | no opening repeated in three consecutive items the diff touches | `formcheck.py` prints only plan-retro 43-45, outside the diff |
| 1 | land:62 | `   - The lines `verify.sh` prints are what the booking quotes.` | `grep -nF 'The lines `verify.sh` prints are what the booking quotes.' skills/land/SKILL.md` |
| 1 | land:64 | `     - It is counted and named the same way as a red line.` (under 63, the finding fixed on main) | `sed -n '63,64p' skills/land/SKILL.md` |
| 1 | land:66, 67 | `     - It is counted as a fix at landing.` / `     - It is named in the booking with its cause.` (under 65, the red line fixed on main) | `sed -n '65,67p' skills/land/SKILL.md` |
| 1 | land:177 | `  - Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.` (under 176) | `sed -n '176,177p' skills/land/SKILL.md` |
| 1 | land:194 | `  - Its preparation commit stays.` (under 193, the landed commit reverted) | `sed -n '193,195p' skills/land/SKILL.md` |
| 1 | plan-orchestration:144 | `  - Each is named in the `git add -- <path> ...` command.` (under 143) | `sed -n '143,144p' skills/plan-orchestration/SKILL.md` |
| 1 | plan-orchestration:147 | `  - One on `plan.md` or the state file is a refusal of `/spec` (the `spec` skill's Steps 1).` (under 145) | `sed -n '145,147p' skills/plan-orchestration/SKILL.md` |
| 1 | plan-orchestration:212 | `  - A later one lands on the head the earlier left, its whole diff read again there.` (under 211) | `sed -n '211,212p' skills/plan-orchestration/SKILL.md` |
| 1 | plan-orchestration:242 | `  - No report carries it.` (nested) | `grep -nF 'No report carries it.' skills/plan-orchestration/SKILL.md` |
| 1 | plan-orchestration:312 | `  - Its small findings, the last review's included, are fixed at landing.` (under 311) | `sed -n '311,312p' skills/plan-orchestration/SKILL.md` |
| 1 | plan-retro:40 | `     - They are matched by plan folder, step and run, ...` (nested) | `grep -nF 'They are matched by plan folder' skills/plan-retro/SKILL.md` |
| 1 | plan-retro:72 | `  - It is counted and listed in the retro's "No defect" section with no proposal.` (nested) | `grep -nF 'No defect" section' skills/plan-retro/SKILL.md` |
| 1 | refute:37 | `     - Where it rules a case, the diff is judged against the ruling.` (nested) | `grep -nF 'Where it rules a case' skills/refute/SKILL.md` |
| 1 | refute:49 | `   - The lines `verify.sh` prints are what the refuter report quotes.` | `grep -nF 'The lines `verify.sh` prints are what the refuter report quotes.' skills/refute/SKILL.md` |
| 1 | spec:136-139 | `   - Before the dispatch commit, the session adds the section "The patch as applied" to the brief.` with `     - The section lists ...` and the two `It lists` items under it | `sed -n '136,139p' skills/spec/SKILL.md` |
| 1 | spec:122 | `     - `/spec` run again prepares the step with that patch.` (under 120) | `sed -n '120,122p' skills/spec/SKILL.md` |
| 1 | spec:153 | `     - It makes that commit before the build starts.` (under 152, "Run by hand, ...") | `sed -n '152,153p' skills/spec/SKILL.md` |
| 2 | plan-orchestration:64-66 | `**`inline`.**` once, at 64; 65 and 66 nested | `grep -c '\*\*`inline`\.\*\*' skills/plan-orchestration/SKILL.md` prints 1 |
| 2 | plan-orchestration:67-70 | `**`academic-paper`.**` once, at 67; 68-70 nested, 70 `That skill's output is the step's report.` | `sed -n '67,70p' skills/plan-orchestration/SKILL.md` |
| 2 | plan-orchestration:95-101 | `**Only known fixes.**` once, at 95; 96-101 nested; 99 and 100 open "Such a cause" | `grep -c '\*\*Only known fixes\.\*\*' skills/plan-orchestration/SKILL.md` prints 1 |
| 2 | plan-orchestration:123-125 | `**Orchestrator.**` once, at 123; 124-125 nested | `sed -n '123,125p' skills/plan-orchestration/SKILL.md` |
| 2 | plan-orchestration:313-315 | `- Everything else that the rounds left undone, or that lies beyond the brief, is raised ...` once, with `  - It is never sent back to the builder.` and `  - It becomes a step only by the user's ruling.` | `sed -n '313,315p' skills/plan-orchestration/SKILL.md` |
| 2 | roadmap:89-90 | `**The level of an added entry.**` once, at 89; 90 nested | `sed -n '89,90p' skills/roadmap/SKILL.md` |
| 3 | plan-help:43 | `   - An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`.` (the base item) | `grep -nF 'An open item that waits on a ruling' skills/plan-help/SKILL.md` |
| 4 | spec:37-38 | `    - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight.` with `      - The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.` | `sed -n '37,38p' skills/spec/SKILL.md` |
| 5 | spec:202 | `   - for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it: ...` | `grep -nF "for such a ruling, the step's tag names the Rulings line" skills/spec/SKILL.md` |
| 6 | refute:51-52 | `    - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so.` with `      - It reproduces what it can from the one build.` | `sed -n '51,52p' skills/refute/SKILL.md` |
| 7 | land:116 | `- An empty `look:` means the step has no look, and the note says so.` (the base item) | `grep -nF 'An empty `look:` means' skills/land/SKILL.md` |
| 8 | spec:71 | `    - A step not in the list is a refusal ("Stops"), with the list printed.` | `sed -n '70,71p' skills/spec/SKILL.md` |
| 9 | land:70-72 | `    - The dispatch block is then set to `landing: backed-out`.` with `      - The step's worktree and branches are kept.` and `      - The step stays unticked in `plan.md`.` | `sed -n '70,72p' skills/land/SKILL.md` |
| 10 | plan-orchestration:48-50 | `     - The loop moves on to the next unblocked step.` under 49 | `sed -n '47,50p' skills/plan-orchestration/SKILL.md` |
| 11 | land:147-149 | `    - The branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them.` / `    - No path or branch is built from the step id.` | `sed -n '147,149p' skills/land/SKILL.md` |
| 11 | spec:160-162 | `    - The branch is the worktree folder's name, and `<branch>-land` beside it.` / `    - No path or branch is built from the step id.` | `sed -n '160,162p' skills/spec/SKILL.md` |
| 11 | plan-orchestration:162-164 | `- A step at `landing: backed-out` was taken back out of main by a red line at its landing.` with `  - Its worktree and its branches are kept.` and `  - It stays unticked in `plan.md`.` | `sed -n '162,166p' skills/plan-orchestration/SKILL.md` |
| 11 | plan-orchestration:261-264 | `- At the cut-off anything still running is stopped.` with `  - Its worktree is kept.`, `  - The state file is rewritten with what was in flight.`, `  - The plan is paused.` | `sed -n '259,265p' skills/plan-orchestration/SKILL.md` |
| 11 | spec:120-122 | `    - What "Steps / A step taken back out of main" did stays done.` with `      - The patch stays in the ledger.` and `      - `/spec` run again prepares the step with that patch.` | `sed -n '118,123p' skills/spec/SKILL.md` |
| 12 | every split | re-read against rule 17: every condition, exception and limit of a split item is stated with each requirement it governs, in the item or its parent; the DONE row of What to build 3 states this, and the report's former line saying no rule changed in scope is replaced by it | `wordcheck.py`, `formcheck.py`, `pronoun.py` |
| 12 | plan-orchestration:260 | `- A reviewer or a fix round is dispatched only while its usual length fits before the cut-off.` ("before the cut-off" repeated from the base sentence) | `grep -nF 'while its usual length fits before the cut-off' skills/plan-orchestration/SKILL.md` |
| 12 | plan-orchestration:151-152 | `  - A ledger change it did not make is listed, as the bullets above say.` with `    - It is left alone, as the bullets above say.` | `sed -n '150,152p' skills/plan-orchestration/SKILL.md` |

### The re-read against rule 17 (ruling 12)

Each of the 136 splits in "Every item split" was read against its base line for every condition, exception and limit. The result:

- A condition that opens the base item ("Where ...", "When ...", "Run by hand, ...", "At the cut-off ...", "A step at `landing: backed-out` ...") is in the first new item, and every later requirement it governs is a sub-bullet of that item. The rulings 4, 6, 9 and 11 rows are the places where a sibling had held a requirement without its condition; each is now nested.
- A qualifier that ends the base sentence and governs both halves is repeated in each (plan-orchestration 260, 151-152).
- A base item whose two halves were one output (plan-help 43) or a definition with its rule (land 116) is kept whole (rulings 3 and 7).
- No split adds a requirement, removes one, or narrows or widens one: the only words added are those listed under "Word check".

### Counts after the round

- Items split: 136 (land 25, ordo-init 6, plan-help 1, plan-orchestration 43, plan-retro 5, plan 6, refute 9, repo-setup 6, roadmap 5, spec 30); 571 kept; 304 new items; 875 items after (`items.sh`).
- Lines: 1447 before, 1615 after (`wc -l skills/*/SKILL.md`).
- `git diff --stat`: 10 files changed, 313 insertions(+), 145 deletions(-). The 145 deletions are the 136 split items, the two ordo-init lines with a reference, and the seven re-indented lines (plan 5, spec 2).
- Numbered items: 209, same sections and numbers in all ten files (`numbered.py`).
- Position references: 105, each on the same rule (`refs.py`).
- `grep -c '\*\*Only known fixes\.\*\*' skills/plan-orchestration/SKILL.md` printed `1`. `formcheck.py skills/*/SKILL.md` printed no repeated label and no depth line; its one line is the base text at plan-retro 43-45.

### Verify lines

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit=0
```
