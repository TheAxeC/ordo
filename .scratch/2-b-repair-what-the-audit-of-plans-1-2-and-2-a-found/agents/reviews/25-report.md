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

| Item | State | Command | Output |
|---|---|---|---|
| What to build 1: every list item read | DONE | `items.sh skills/*/SKILL.md` (awk: a line starting with `-`, `*` or `N.` after indentation, outside code fences) on the unchanged tree | 707 items, the brief's count; each read and decided: 138 split into 303 items, 569 kept |
| What to build 1: an item with one requirement stays byte for byte | DONE | `git diff -U0 -- skills/*/SKILL.md` | the only item lines removed are the 138 split items, the three ordo-init lines and one plan-orchestration table line carrying a reference, and the five plan lines re-indented (judgment call 9) |
| What to build 2: what stays joined | DONE | per item; "Items kept" below | every flagged item kept is listed with its reason |
| What to build 3: meaning kept, words moved | DONE | `git diff -U0 --word-diff=plain -- skills/*/SKILL.md`, classified by script | see "Word-diff check": no word added or removed outside the kinds listed there |
| What to build 4: position references kept | DONE | the grep rerun, then `diff <(cut -d: -f1,3 refs-before.txt \| sort) <(cut -d: -f1,3 refs-after.txt \| sort)`; `numbered.py` over the ten files | 105 references after; the only difference is ordo-init `Rules 4` (twice) now `Rules 5` and `Rules 6`; `numbered.py` printed "same sections and numbers" for all ten files (209 numbered items) |
| What to build 5: the report | DONE | this file | all sections of "Report" |
| Verify 1 | DONE | the verify runner | six `PASS:` lines, nothing from the ASCII check, `verify: 7 commands passed`, exit 0 (quoted below) |
| Verify 2 | DONE | `git diff --stat` | the ten `SKILL.md` files only (quoted below); `git status --short` lists them and this report, untracked (`??`) |
| Verify 3 | DONE | word diff | every hunk adding or removing another word named below with its reason |
| Verify 4 | DONE | reference grep rerun | every reference points at the same rule text |
| Verify 5 | DONE | the case commands below | every case holds |

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"` from the worktree root printed:

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

The ASCII check printed nothing. What this green run does not cover: none of the six tests reads the prose of a `SKILL.md`; it shows the scripts still pass and no non-ASCII was added. The prose is covered by the word-diff check, the reference check and the cases below.

`git diff --stat`:

```text
 skills/land/SKILL.md               |  81 +++++++++++++-------
 skills/ordo-init/SKILL.md          |  24 +++---
 skills/plan-help/SKILL.md          |   6 +-
 skills/plan-orchestration/SKILL.md | 150 ++++++++++++++++++++++++++-----------
 skills/plan-retro/SKILL.md         |  16 ++--
 skills/plan/SKILL.md               |  29 ++++---
 skills/refute/SKILL.md             |  27 ++++---
 skills/repo-setup/SKILL.md         |  18 +++--
 skills/roadmap/SKILL.md            |  15 ++--
 skills/spec/SKILL.md               |  93 +++++++++++++++--------
 10 files changed, 312 insertions(+), 147 deletions(-)
```

## Cases on the changed tree

- Cases 1 and 2: `grep -n 'A landed step found short\|The step that finishes it\|A landed commit is reverted\|Its preparation commit stays\|Only a step so reverted' skills/land/SKILL.md` printed 191 `- A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops".`, 192 `- The step that finishes it on top of what landed enters the plan only by the user's ruling.`, 193 `- A landed commit is reverted only on the user's ruling.`, 194 `- Its preparation commit stays.`, 195 `- Only a step so reverted is booked as reverted.` Hold.
- Case 3: `grep -n 'A ledger record is committed only\|Only the session that wrote it' skills/spec/SKILL.md` printed 233 `- A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them.` and 234 `- Only the session that wrote it commits it.` Holds.
- Case 4: `grep -n` on `skills/plan-orchestration/SKILL.md` printed 47 `3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, makes the worktree and writes the dispatch block.`, 48 `   - A stop it raises goes to the user by "Stops".`, 49 `   - A stop, here or at any later step, blocks its own step.`, 50 `   - The loop moves on to the next unblocked step.` Holds.
- Case 5: `grep -n 'carried over, so a run\|A report in both lists' skills/plan-retro/SKILL.md` printed 50 `   - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro.` and 51 `   - A report in both lists has its runs joined in one entry.` Holds.
- Case 6: `grep -n -A1 'its required keys and defaults as `/plan` states them' skills/*/SKILL.md` printed item 1 followed by `   - A required key missing is a refusal ("Stops").` in land 28/29, plan-help 29/30, refute 29/30, spec 30/31 and plan-retro 28/29; roadmap 32 is followed by its `projects:` sub-bullet and then its refusal sub-bullet, as before. Holds.
- Case 7: the kept items print unchanged: plan-orchestration 106 `9. Invoke `/land <entry> <step>`. Its refusals are its own.`, plan-orchestration 166, refute 71 and 99, repo-setup 73, spec 43; ordo-init 76 is unchanged except `as Rules 4 says` now `as Rules 6 says`, since What to build 4 requires the reference to follow its target (ordo-init Rules 4 split). Holds.
- Case 8: refute's Rules are not split (Rules 1 kept: the colon clause defines "fresh", a definition the rule uses). `grep -n 'as Rules 1 says' skills/refute/SKILL.md` printed 66, and the first Rules bullet is still `- The reviewer is a fresh session or agent every time, for the first run and every run over a repair round: never the builder, and never the session that wrote the brief when another is available.` Checked and kept.
- The brief's own runs: land 127 and 128 are the search order and the refusal; spec 131 is the apply with its second sentence and 132 is `   - Read what it prints.`

## Word-diff check

`git diff -U0 --word-diff=plain -- skills/*/SKILL.md`, each changed line classified by a script that prints the words removed other than "and", "then", "it", "that" and the words added other than those removed. Every line it printed is in one of these groups. A lowercase word removed on one line and the same word capitalised on the next line is the first word of a new item.

- Capital letter at the start of a new item: land 28/29, 33/34, 35/36, 53/54, 61/62, 70/72, 88/89, 96/97, 116/117, 125/126, 127/128, 191/192, 194/195; ordo-init 79/80, 88/89; plan-help 29/30, 43/44; plan-orchestration 43/44, 49/50, 52/53, 62/63, 79/80, 82/83, 89/90, 103/104, 130/131, 175/176, 210/211, 217/218, 240/241, 251/252, 258/259, 305/306, 309/310; plan 35/36, 53/54, 61/63; refute 29/30, 36/37, 48/49, 77/78, 79/80; repo-setup 47/48, 82/83; roadmap 43/44, 89/90; spec 30/31, 41/42, 67/68, 70/71, 99/100, 102/103, 171/172 (line numbers after the change).
- A subject repeated, or a pronoun subject ("it", "that") replaced by the noun it stands for, so the new item reads alone: land 40, 74, 76, 84, 138; ordo-init 54, 119; plan-orchestration 65, 66, 68, 110, 117, 132, 142, 146, 151, 163, 205, 284, 312, 313; refute 52, 115; repo-setup 41, 150; roadmap 59, 105, 107; spec 55, 60, 97, 104, 106, 114, 148, 167.
- A pronoun subject with the auxiliary of a gapped clause ("is fixed ..., counted ... and named ..."): land 64, 66, 67 ("It is"); plan-retro 72 ("It is"); plan-retro 84 ("It", the proposal, for the second verb of "It says ... and quotes ...").
- A bold label repeated, the label being the scope of the bullet (What to build 3): plan-orchestration 57, 59, 60, 63, 65, 66, 68, 69, 70, 94, 96 to 101, 104, 124, 125; roadmap 90.
- A qualifier repeated: plan-orchestration 151, 152 (", as the bullets above say"), 261, 262 ("At the cut-off"); spec 116 ("When the merge at landing is judged simple"), 118 ("When it is not judged simple"), 152 ("Run by hand, the session").
- A verb restored from a gapped clause: plan-orchestration 259 ("is dispatched", from "A builder is dispatched only while ..., and a reviewer or a fix round only while ..."), 261 and 262 ("is", from "is stopped, its worktree kept, the state file rewritten ..., and the plan paused"), 312 ("is"); repo-setup 67 ("committed", from "`skills-lock.json` is."); spec 176 ("makes", from "Steps 6 makes ..., and Steps 7 a new worktree ...").
- Words moved within one item, none added or removed: spec 131/132 ("read what it prints" after the patch sentence, as the brief's run of spec 111 says); spec 163/164 ("run the diff again, and compare the two with `cmp`" into a sub-bullet after the "With `--binary`" sentence that explains the write).
- "Then" kept at the start of a new sub-bullet where it gives the order: ordo-init 30, plan-orchestration 54.
- Reference numbers changed (What to build 4): ordo-init 76 (`4` to `6`), 111 (`2 and 3` to `2, 3 and 4`), 112 (`4` to `5 and 6`); plan-orchestration 301 (`two` to `five`).
- Indentation only: plan 65 to 69 (judgment call 9).

## Every item split

Old line numbers are on the unchanged tree; "new" lines are the items that replace it, in order.

### skills/land/SKILL.md, 26 items split

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
new:        - The user's unrelated changes are left alone.

old 45: 3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's tree with the ledger root left out, and `git commit -q -m wip` when something is staged.
new:     3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's tree with the ledger root left out.
new:        - `git commit -q -m wip` when something is staged.

old 48:    - Each wait for a lock, here and on main before Steps 4, is bounded at 60 s of waiting; at the bound the landing stops ("Stops").
new:        - Each wait for a lock, here and on main before Steps 4, is bounded at 60 s of waiting.
new:        - At the bound the landing stops ("Stops").

old 55:    - The step's verify list runs through this skill's `templates/verify.sh <state file>` from the root of the checkout it checks (main here), and the lines it prints are what the booking quotes.
new:        - The step's verify list runs through this skill's `templates/verify.sh <state file>` from the root of the checkout it checks (main here).
new:        - The lines it prints are what the booking quotes.

old 56:    - A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here, counted and named the same way as a red line.
new:        - A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here.
new:        - It is counted and named the same way as a red line.

old 57:    - A red line that a fix inside the brief closes is fixed on main, counted as a fix at landing, and named in the booking with its cause.
new:        - A red line that a fix inside the brief closes is fixed on main.
new:        - It is counted as a fix at landing.
new:        - It is named in the booking with its cause.

old 60:    - The dispatch block is then set to `landing: backed-out`, the step's worktree and branches are kept, and the step stays unticked in `plan.md`.
new:        - The dispatch block is then set to `landing: backed-out`.
new:        - The step's worktree and branches are kept.
new:        - The step stays unticked in `plan.md`.

old 61:    - The failure is never sent back to the builder: it is recorded in the step's Step 0 in `plan.md`.
new:        - The failure is never sent back to the builder.
new:        - The failure is recorded in the step's Step 0 in `plan.md`.

old 62:    - The step keeps its line and its tag, and is worked again as that step, with no new ruling.
new:        - The step keeps its line and its tag.
new:        - The step is worked again as that step, with no new ruling.

old 64:    - The state file and `plan.md` are then committed by path, a resume point. The commit also holds the other ledger records the session wrote since the last one.
new:        - The state file and `plan.md` are then committed by path, a resume point.
new:        - The commit also holds the other ledger records the session wrote since the last one.

old 68:    - The mean, the standard deviation and the standard error of the difference are written to the scratchpad and quoted in the booking.
new:        - The mean, the standard deviation and the standard error of the difference are written to the scratchpad.
new:        - The mean, the standard deviation and the standard error of the difference are quoted in the booking.

old 72: 10. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the open item it was raised as, the verification lines, the A/B, the usage row; tick the step.
new:     10. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the open item it was raised as, the verification lines, the A/B, the usage row.
new:         - Tick the step.

old 79:     - Under the loop it is also the report the orchestrator prints; run by hand, it is the message that ends the turn.
new:         - Under the loop it is also the report the orchestrator prints.
new:         - Run by hand, it is the message that ends the turn.

old 98: - An empty `look:` means the step has no look, and the note says so.
new:     - An empty `look:` means the step has no look.
new:     - The note says so.

old 102: - A ledger holds `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made; `/plan` copies it, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger when it opens a plan.
new:     - A ledger holds `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made.
new:     - `/plan` copies it, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger when it opens a plan.

old 105: - Its check on main (Steps 6) is the ledger's verify list: after main's cherry-pick it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root, and a non-zero exit fails the landing with the output of `verify.sh` printed.
new:     - Its check on main (Steps 6) is the ledger's verify list: after main's cherry-pick it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root.
new:     - A non-zero exit fails the landing with the output of `verify.sh` printed.

old 106: - It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`); a missing state file, or a `verify.sh` in none of those places, is refused before main is touched, with the places named.
new:     - It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).
new:     - A missing state file, or a `verify.sh` in none of those places, is refused before main is touched, with the places named.

old 115: - `templates/land.test.sh` proves it on scratch repositories, its verify list run and its lookup of `verify.sh` included, that its defaults run no browser step and no line count, and that a ledger file left uncommitted in the worktree never reaches main; it proves `templates/usage.py` on a Claude Code log and its refusal of a file that is not one.
new:     - `templates/land.test.sh` proves it on scratch repositories, its verify list run and its lookup of `verify.sh` included, that its defaults run no browser step and no line count, and that a ledger file left uncommitted in the worktree never reaches main.
new:     - `templates/land.test.sh` proves `templates/usage.py` on a Claude Code log and its refusal of a file that is not one.

old 118: - Its zero exit passes the checks on main (Steps 6). It never passes the look (Steps 7), which it does not do.
new:     - Its zero exit passes the checks on main (Steps 6).
new:     - It never passes the look (Steps 7), which it does not do.

old 124: 1. Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 11, before the state file was rewritten, and a back-out reads it from the entry. The branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them; no path or branch is built from the step id.
new:     1. Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 11, before the state file was rewritten, and a back-out reads it from the entry.
new:        - The branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them; no path or branch is built from the step id.

old 151: - The last row is a stop after the landing's commit that leaves an open item: the step is on main, and only its worktree and branches are left, named in the open item. Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.
new:     - The last row is a stop after the landing's commit that leaves an open item: the step is on main, and only its worktree and branches are left, named in the open item.
new:     - Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.

old 165: - A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops"; the step that finishes it on top of what landed enters the plan only by the user's ruling.
new:     - A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops".
new:     - The step that finishes it on top of what landed enters the plan only by the user's ruling.

old 166: - A landed commit is reverted only on the user's ruling. Its preparation commit stays, and only a step so reverted is booked as reverted.
new:     - A landed commit is reverted only on the user's ruling.
new:     - Its preparation commit stays.
new:     - Only a step so reverted is booked as reverted.

```

### skills/ordo-init/SKILL.md, 6 items split

```text
old 29: 2. `.agents/plan.yaml`, when it exists; then the skill checks instead of drafting ("Steps / Checking an existing file").
new:     2. `.agents/plan.yaml`, when it exists.
new:        - Then the skill checks instead of drafting ("Steps / Checking an existing file").

old 52:    - A command that fails is not written as a check: it is a stop ("Stops").
new:        - A command that fails is not written as a check.
new:        - A command that fails is a stop ("Stops").

old 77: 13. Run `python3 <this skill's folder>/templates/check_config.py .` and show its output.
new:     13. Run `python3 <this skill's folder>/templates/check_config.py .`.
new:         - Show its output.

old 85: 1. With `.agents/plan.yaml` present, write nothing and run `templates/check_config.py`.
new:     1. With `.agents/plan.yaml` present, write nothing.
new:        - Run `templates/check_config.py`.

old 114: - A page the skill writes states what the repository already does or says, and cites where.
new:     - A page the skill writes states what the repository already does or says.
new:     - A page the skill writes cites where.

old 115: - The skill never overwrites an existing page or `.agents/plan.yaml`. A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
new:     - The skill never overwrites an existing page or `.agents/plan.yaml`.
new:     - A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.

```

### skills/plan-help/SKILL.md, 2 items split

```text
old 29: 1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
new:     1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
new:        - A required key missing is a refusal ("Stops").

old 42:    - An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`.
new:        - An open item that waits on a ruling is printed with it.
new:        - The next line is `Ruled: ...`.

```

### skills/plan-orchestration/SKILL.md, 43 items split

```text
old 43: 1. Read the inputs in the order "What it reads" gives them, and resolve a dispatch block before anything else.
new:     1. Read the inputs in the order "What it reads" gives them.
new:        - Resolve a dispatch block before anything else.

old 47:    - A stop it raises goes to the user by "Stops". A stop, here or at any later step, blocks its own step, and the loop moves on to the next unblocked step.
new:        - A stop it raises goes to the user by "Stops".
new:        - A stop, here or at any later step, blocks its own step.
new:        - The loop moves on to the next unblocked step.

old 49: 4. Choose the step's executor and write it into the dispatch block, then build by that choice.
new:     4. Choose the step's executor.
new:        - Write it into the dispatch block.
new:        - Then build by that choice.

old 51:    - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder". The moment it is launched, write its agent id into the dispatch block under `session_id`.
new:        - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder".
new:        - **`agent`.** The moment it is launched, write its agent id into the dispatch block under `session_id`.

old 52:    - **The launch commit.** Under every executor, the dispatch entry is committed once its builder's identity is in it, and the commit is a resume point. Under `agent` it comes right after the launch, since the builder's agent id exists only once it is launched; under `inline` and `academic-paper` it comes before the build starts. The paths are the state file and the session's own records since the last resume point, named in `git add -- <path> ...`.
new:        - **The launch commit.** Under every executor, the dispatch entry is committed once its builder's identity is in it, and the commit is a resume point.
new:        - **The launch commit.** Under `agent` it comes right after the launch, since the builder's agent id exists only once it is launched; under `inline` and `academic-paper` it comes before the build starts.
new:        - **The launch commit.** The paths are the state file and the session's own records since the last resume point, named in `git add -- <path> ...`.

old 54:    - **The builder.** It never runs a git command, and in the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.
new:        - **The builder.** It never runs a git command.
new:        - **The builder.** In the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.

old 55:    - **`inline`.** The orchestrating session writes `inline` as the builder's identity under `session_id` and makes the launch commit. It then builds the step itself in the worktree under the brief and the rules file. Steps 5 and 8 read "the builder" as itself.
new:        - **`inline`.** The orchestrating session writes `inline` as the builder's identity under `session_id`.
new:        - **`inline`.** The orchestrating session makes the launch commit.
new:        - **`inline`.** The orchestrating session then builds the step itself in the worktree under the brief and the rules file. Steps 5 and 8 read "the builder" as itself.

old 56:    - **`academic-paper`.** The session writes `academic-paper` as the builder's identity under `session_id` and makes the launch commit. The step is then built through that skill with the brief as its input, and its output is the step's report.
new:        - **`academic-paper`.** The session writes `academic-paper` as the builder's identity under `session_id`.
new:        - **`academic-paper`.** The session makes the launch commit.
new:        - **`academic-paper`.** The step is then built through that skill with the brief as its input.
new:        - **`academic-paper`.** Its output is the step's report.

old 60: 6. On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed on its own. Then read the whole diff.
new:     6. On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed on its own.
new:        - Then read the whole diff.

old 64:    - A builder whose first run of the brief's "Cases" finds a case the brief's rules get wrong stops before changing any code and hands back the first run and that case, with the rule and the result; read that hand-back the same way as a report.
new:        - A builder whose first run of the brief's "Cases" finds a case the brief's rules get wrong stops before changing any code and hands back the first run and that case, with the rule and the result.
new:        - Read that hand-back the same way as a report.

old 65:    - Rule on such a case when the fix stays inside the step's scope. Write the ruling into the ledger as the round-0 ruling file `agents/briefs/<step>-cases.md`, and commit it by path as a round sent.
new:        - Rule on such a case when the fix stays inside the step's scope.
new:        - Write the ruling into the ledger as the round-0 ruling file `agents/briefs/<step>-cases.md`.
new:        - Commit it by path as a round sent.

old 66:    - Then resume the same builder with it, by Steps 8's "How" and "Before the resume" with `round: 0`. The builder's final report carries the ruling.
new:        - Then resume the same builder with it, by Steps 8's "How" and "Before the resume" with `round: 0`.
new:        - The builder's final report carries the ruling.

old 70:    - Save its report, and write its path and its usage into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.
new:        - Save its report.
new:        - Write its path and its usage into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.

old 73:    - **Before the resume.** Write `round: n` into the dispatch block. Commit it by path with the round's brief and the session's own records since the last resume point. The commit is a resume point.
new:        - **Before the resume.** Write `round: n` into the dispatch block.
new:        - **Before the resume.** Commit it by path with the round's brief and the session's own records since the last resume point. The commit is a resume point.

old 74:    - **Only known fixes.** Each ruling says what to change. A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed by the orchestrator, read-only, before the round is sent; the round carries the found cause's fix, and a cause not found is not sent: it is noted at landing and raised to the user as an open item, by "Stops". A round never asks the builder to find a cause, to reproduce a fault, or to measure until a condition holds.
new:        - **Only known fixes.** Each ruling says what to change.
new:        - **Only known fixes.** A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed by the orchestrator, read-only, before the round is sent.
new:        - **Only known fixes.** The round carries the found cause's fix.
new:        - **Only known fixes.** A cause not found is not sent.
new:        - **Only known fixes.** A cause not found is noted at landing.
new:        - **Only known fixes.** A cause not found is raised to the user as an open item, by "Stops".
new:        - **Only known fixes.** A round never asks the builder to find a cause, to reproduce a fault, or to measure until a condition holds.

old 76:    - **After each reply.** Read the whole delta and, when the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its usage recorded beside the first.
new:        - **After each reply.** Read the whole delta.
new:        - **After each reply.** When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its usage recorded beside the first.

old 79:    - A red line the orchestrator cannot fix at landing takes the step back out of main. Its failure is recorded in the step's Step 0 in `plan.md`.
new:        - A red line the orchestrator cannot fix at landing takes the step back out of main.
new:        - Its failure is recorded in the step's Step 0 in `plan.md`.

old 80:    - The step keeps its line and its tag, and is worked again as that step, with no new ruling.
new:        - The step keeps its line and its tag.
new:        - The step is worked again as that step, with no new ruling.

old 86:     - The final message opens as "Reports" says, then lists every step landed since the loop began with the path of each report, and the open items.
new:         - The final message opens as "Reports" says.
new:         - The final message then lists every step landed since the loop began with the path of each report, and the open items.

old 92: - **Orchestrator.** It may also run on Claude Fable. It reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
new:     - **Orchestrator.** It may also run on Claude Fable.
new:     - **Orchestrator.** It reads, decides, invokes the skills, lands and books.
new:     - **Orchestrator.** It never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.

old 97: - Any allowed combination is chosen per step; a new combination is booked in the rulings with what decides it, and measured by its usage row.
new:     - Any allowed combination is chosen per step.
new:     - A new combination is booked in the rulings with what decides it.
new:     - A new combination is measured by its usage row.

old 106: - Every other ledger record is written to disk in the main checkout, and carried by the next of those commits. Such records are a builder's report saved, a refuter report saved, a reviewer recorded, a ruling booked and a usage line.
new:     - Every other ledger record is written to disk in the main checkout.
new:     - Every other ledger record is carried by the next of those commits. Such records are a builder's report saved, a refuter report saved, a reviewer recorded, a ruling booked and a usage line.

old 107: - A resume-point commit holds only the paths the session itself wrote since the last one. Each is named in the `git add -- <path> ...` command.
new:     - A resume-point commit holds only the paths the session itself wrote since the last one.
new:     - Each is named in the `git add -- <path> ...` command.

old 108: - A ledger change the session did not make is listed by path and left alone. One on `plan.md` or the state file is a refusal of `/spec` (the `spec` skill's Steps 1).
new:     - A ledger change the session did not make is listed by path.
new:     - A ledger change the session did not make is left alone.
new:     - One on `plan.md` or the state file is a refusal of `/spec` (the `spec` skill's Steps 1).

old 111: - So a session taking over finds no uncommitted record of the session before it. A ledger change it did not make is listed and left alone, as the bullets above say.
new:     - So a session taking over finds no uncommitted record of the session before it.
new:     - A ledger change it did not make is listed, as the bullets above say.
new:     - A ledger change it did not make is left alone, as the bullets above say.

old 121: - A step at `landing: backed-out` was taken back out of main by a red line at its landing. Its worktree and its branches are kept, and it stays unticked in `plan.md`.
new:     - A step at `landing: backed-out` was taken back out of main by a red line at its landing. Its worktree and its branches are kept.
new:     - A step at `landing: backed-out` stays unticked in `plan.md`.

old 122: - It is worked again as that step, its line keeping its tag, with no new ruling. Its failure is in its Step 0 in `plan.md`.
new:     - It is worked again as that step, its line keeping its tag, with no new ruling.
new:     - Its failure is in its Step 0 in `plan.md`.

old 132: - A landed step whose worktree or branches are still there is named by its open item (the `land` skill's Stops row "A worktree that cannot be removed"). The removal is run from that open item, on the worktree and branches it names, each only when it still exists, and the open item is then closed.
new:     - A landed step whose worktree or branches are still there is named by its open item (the `land` skill's Stops row "A worktree that cannot be removed"). The removal is run from that open item, on the worktree and branches it names, each only when it still exists.
new:     - The open item is then closed.

old 155: - Whether two steps can run at once is decided by how simply the second one's change lands on the first's, not by their paths alone. For each pair the orchestrator states what each changes in code the other reads or changes, and how the later landing takes it: nothing to merge, a mechanical rerun (a converter, a formatter, a generator), a hand merge of named functions, or a dependency that forces an order. A pair whose later landing needs more than a mechanical rerun or a hand merge of a few named functions runs in sequence.
new:     - Whether two steps can run at once is decided by how simply the second one's change lands on the first's, not by their paths alone.
new:     - For each pair the orchestrator states what each changes in code the other reads or changes, and how the later landing takes it: nothing to merge, a mechanical rerun (a converter, a formatter, a generator), a hand merge of named functions, or a dependency that forces an order.
new:     - A pair whose later landing needs more than a mechanical rerun or a hand merge of a few named functions runs in sequence.

old 156: - Each brief lists the paths its step writes under "Paths this step writes", and `/spec` compares the list with the briefs of the steps in flight by reading them (the `spec` skill's Steps 5).
new:     - Each brief lists the paths its step writes under "Paths this step writes".
new:     - `/spec` compares the list with the briefs of the steps in flight by reading them (the `spec` skill's Steps 5).

old 157: - Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple. It writes that judgment in the later step's dispatch entry as `shared_paths:`, naming each shared file and why the merge is simple; with no shared file the key is left out.
new:     - Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple.
new:     - The orchestrator writes that judgment in the later step's dispatch entry as `shared_paths:`, naming each shared file and why the merge is simple; with no shared file the key is left out.

old 162: - Landings are one at a time, in the order the steps are verified, and a later one lands on the head the earlier left, its whole diff read again there.
new:     - Landings are one at a time, in the order the steps are verified.
new:     - A later one lands on the head the earlier left, its whole diff read again there.

old 168: - It runs in the background, and the runner tracks it and reports when it ends.
new:     - It runs in the background.
new:     - The runner tracks it and reports when it ends.

old 176: - Everything else is closed in the step that is open: a finding inside a brief by the repair rounds or at landing, a fix in a file another step holds at that step's landing. A finding beyond the brief is raised to the user as an open item, by "Stops".
new:     - Everything else is closed in the step that is open: a finding inside a brief by the repair rounds or at landing, a fix in a file another step holds at that step's landing.
new:     - A finding beyond the brief is raised to the user as an open item, by "Stops".

old 179: - A step enters the step list only by the user's ruling, as a line ending with `(ruling <name>)`, and `/spec` refuses a line without its tag.
new:     - A step enters the step list only by the user's ruling, as a line ending with `(ruling <name>)`.
new:     - `/spec` refuses a line without its tag.

old 188: - The other list, the closed one, is the log of what was raised and how it ended, and no report carries it.
new:     - The other list, the closed one, is the log of what was raised and how it ended.
new:     - No report carries it.

old 198: - Work on other steps inside the same window (the next brief, another step's review read) is not separated, and the row says what it shares.
new:     - Work on other steps inside the same window (the next brief, another step's review read) is not separated.
new:     - The row says what it shares.

old 204: - A builder is dispatched only while the longest step so far still fits before the cut-off, and a reviewer or a fix round only while its usual length fits.
new:     - A builder is dispatched only while the longest step so far still fits before the cut-off.
new:     - A reviewer or a fix round is dispatched only while its usual length fits.

old 205: - At the cut-off anything still running is stopped, its worktree kept, the state file rewritten with what was in flight, and the plan paused.
new:     - At the cut-off anything still running is stopped, its worktree kept.
new:     - At the cut-off the state file is rewritten with what was in flight.
new:     - At the cut-off the plan is paused.

old 226: - The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons. It never goes through a question-box or multiple-choice tool.
new:     - The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons.
new:     - The stop message never goes through a question-box or multiple-choice tool.

old 247: - The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger, and the models it names are those in "The two tiers, and the models".
new:     - The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger.
new:     - The models it names are those in "The two tiers, and the models".

old 250: - After its last round a step lands, and its small findings, the last review's included, are fixed at landing.
new:     - After its last round a step lands.
new:     - Its small findings, the last review's included, are fixed at landing.

old 251: - Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops", never sent back to the builder, and becomes a step only by the user's ruling.
new:     - Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops".
new:     - Everything else that the rounds left undone, or that lies beyond the brief, is never sent back to the builder.
new:     - Everything else that the rounds left undone, or that lies beyond the brief, becomes a step only by the user's ruling.

```

### skills/plan-retro/SKILL.md, 5 items split

```text
old 39:    - The runs the previous retro's "Reports read" lists are left out unless the user asks for a retro over everything. They are matched by plan folder, step and run, so a plan moved into `<archive_root>` stays left out and a round added to a report later is read.
new:        - The runs the previous retro's "Reports read" lists are left out unless the user asks for a retro over everything.
new:        - They are matched by plan folder, step and run, so a plan moved into `<archive_root>` stays left out and a round added to a report later is read.

old 49:    - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro. A report in both lists has its runs joined in one entry.
new:        - The previous retro's "Reports read" entries, carried over, so a run listed once stays skipped by every later retro.
new:        - A report in both lists has its runs joined in one entry.

old 69: - A finding whose text reports no defect (a confirmation such as "None." or "No sentence in the pages is made false") or a closure that holds (such as "Spec 1: closed.") is set aside, by reading, as the kind "no defect", counted and listed in the retro's "No defect" section with no proposal.
new:     - A finding whose text reports no defect (a confirmation such as "None." or "No sentence in the pages is made false") or a closure that holds (such as "Spec 1: closed.") is set aside, by reading, as the kind "no defect".
new:     - It is counted and listed in the retro's "No defect" section with no proposal.

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
new:        - No match is a stop ("Stops").

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
new:        - Where it rules a case, the diff is judged against the ruling.

old 46:    - The step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks (the step's worktree), and the lines it prints are what the refuter report quotes.
new:        - The step's verify list runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks (the step's worktree).
new:        - The lines it prints are what the refuter report quotes.

old 48:    - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so and reproduces what it can from the one build.
new:        - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so.
new:        - The reviewer reproduces what it can from the one build.

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
new:     - A finding becomes a step only by the user's ruling.

```

### skills/repo-setup/SKILL.md, 6 items split

```text
old 40:    - A placeholder with no answer is shown to the user, and never written as `<...>`.
new:        - A placeholder with no answer is shown to the user.
new:        - A placeholder with no answer is never written as `<...>`.

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
new:     - A page it writes never adds a rule of its own.

```

### skills/roadmap/SKILL.md, 5 items split

```text
old 43: 2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below; nothing is written yet.
new:     2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below.
new:        - Nothing is written yet.

old 57:    - A goal whose gate cannot be named is not added: that is a stop ("Stops").
new:        - A goal whose gate cannot be named is not added.
new:        - A goal whose gate cannot be named is a stop ("Stops").

old 87: - **The level of an added entry.** It goes at the level the user names; a goal that does not settle it is a stop ("Stops").
new:     - **The level of an added entry.** It goes at the level the user names.
new:     - **The level of an added entry.** A goal that does not settle it is a stop ("Stops").

old 101: - `done` ticks the entry, and ticks the capability only when every scope item of it is met.
new:     - `done` ticks the entry.
new:     - `done` ticks the capability only when every scope item of it is met.

old 102: - An entry that meets part of a capability ticks those scope items and leaves the capability open.
new:     - An entry that meets part of a capability ticks those scope items.
new:     - An entry that meets part of a capability leaves the capability open.

```

### skills/spec/SKILL.md, 30 items split

```text
old 30: 1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
new:     1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
new:        - A required key missing is a refusal ("Stops").

old 36:    - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight. The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.
new:        - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight.
new:        - The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.

old 39:    - The step list is the section `## Steps, in execution order`, and the rulings are the section `## Rulings`; a `plan.md` without either section is a refusal ("Stops").
new:        - The step list is the section `## Steps, in execution order`, and the rulings are the section `## Rulings`.
new:        - A `plan.md` without either section is a refusal ("Stops").

old 51:    - Any unrelated change of the user's outside the ledger folder is listed by path and left alone.
new:        - Any unrelated change of the user's outside the ledger folder is listed by path.
new:        - Any unrelated change of the user's outside the ledger folder is left alone.

old 55:    - Any other change under the ledger folder is left alone and never committed.
new:        - Any other change under the ledger folder is left alone.
new:        - Any other change under the ledger folder is never committed.

old 57:    - `plan.md` is copied aside to the session's scratch folder before Steps 2. A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.
new:        - `plan.md` is copied aside to the session's scratch folder before Steps 2.
new:        - A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.

old 61:    - A step whose line carries the user's authority goes on, and the session notes the tags that give it.
new:        - A step whose line carries the user's authority goes on.
new:        - The session notes the tags that give it.

old 63:    - A `plan.md` that is missing or not UTF-8, lacks a section, or lists a step twice is a refusal ("Stops"), and so is a step not in the list, with the list printed.
new:        - A `plan.md` that is missing or not UTF-8, lacks a section, or lists a step twice is a refusal ("Stops").
new:        - So is a step not in the list, with the list printed.

old 88:    - A choice the plan leaves open is taken in the brief and listed under "Decisions taken in this brief", each reversible.
new:        - A choice the plan leaves open is taken in the brief.
new:        - A choice the plan leaves open is listed under "Decisions taken in this brief", each reversible.

old 90:    - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree, and the brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.
new:        - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree.
new:        - The brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.

old 91:    - Every item of "What to build" is a change whose content is known. An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item; a cause it cannot find is left out of the brief and raised to the user as an open item.
new:        - Every item of "What to build" is a change whose content is known.
new:        - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item.
new:        - A cause it cannot find is left out of the brief.
new:        - A cause it cannot find is raised to the user as an open item.

old 92:    - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken: it is a stop ("Stops").
new:        - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken.
new:        - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is a stop ("Stops").

old 95:    - The brief is committed at Steps 6, before the apply. Its section "The patch as applied" is added after Steps 7, as Steps 7 says.
new:        - The brief is committed at Steps 6, before the apply.
new:        - Its section "The patch as applied" is added after Steps 7, as Steps 7 says.

old 98:    - A shared path is a file both briefs name, whatever lines each names. It is not a refusal: it goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.
new:        - A shared path is a file both briefs name, whatever lines each names. It is not a refusal.
new:        - A shared path goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.

old 99:    - When the merge at landing is judged simple, the step goes on, and Steps 9 writes `shared_paths:` in its dispatch entry, naming each shared file and why the merge is simple.
new:        - When the merge at landing is judged simple, the step goes on.
new:        - When the merge at landing is judged simple, Steps 9 writes `shared_paths:` in its dispatch entry, naming each shared file and why the merge is simple.

old 100:    - When it is not judged simple, the step waits until the other step lands, and this run leaves nothing. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
new:        - When it is not judged simple, the step waits until the other step lands.
new:        - When it is not judged simple, this run leaves nothing. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).

old 102:    - What "Steps / A step taken back out of main" did stays done. The patch stays in the ledger, and `/spec` run again prepares the step with it.
new:        - What "Steps / A step taken back out of main" did stays done. The patch stays in the ledger.
new:        - `/spec` run again prepares the step with it.

old 107:    - The paths are written out in the `git add -- <path> ...` command. A ledger change the session did not make is not among them.
new:        - The paths are written out in the `git add -- <path> ...` command.
new:        - A ledger change the session did not make is not among them.

old 111:    - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`, and read what it prints. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
new:        - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
new:        - Read what it prints.

old 114:    - Before the dispatch commit, the session adds the section "The patch as applied" to the brief. It lists the files applied clean and the files left with conflict markers, which the builder finishes from the markers.
new:        - Before the dispatch commit, the session adds the section "The patch as applied" to the brief.
new:        - It lists the files applied clean and the files left with conflict markers, which the builder finishes from the markers.

old 125:    - The entry is not committed here. It is committed once the builder's identity is in it: under `agent` right after the launch, and under `inline` and `academic-paper` before the build starts.
new:        - The entry is not committed here.
new:        - The entry is committed once the builder's identity is in it: under `agent` right after the launch, and under `inline` and `academic-paper` before the build starts.

old 127:    - Under `plan-orchestration`, its Steps 4 makes that commit under every executor. Run by hand, the session writes itself as the identity and makes it before the build starts.
new:        - Under `plan-orchestration`, its Steps 4 makes that commit under every executor.
new:        - Run by hand, the session writes itself as the identity.
new:        - Run by hand, the session makes it before the build starts.

old 134: 1. Read the entry's `base` and `worktree`. The branch is the worktree folder's name, and `<branch>-land` beside it; no path or branch is built from the step id.
new:     1. Read the entry's `base` and `worktree`.
new:        - The branch is the worktree folder's name, and `<branch>-land` beside it; no path or branch is built from the step id.

old 135: 2. From inside the kept worktree, `git status --porcelain --untracked-files=all` lists only paths under the ledger root. Any other path is a refusal ("Stops") that names it, and nothing is removed.
new:     2. From inside the kept worktree, `git status --porcelain --untracked-files=all` lists only paths under the ledger root.
new:        - Any other path is a refusal ("Stops") that names it, and nothing is removed.

old 136: 3. Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file, run the diff again, and compare the two with `cmp`. With `--binary` the patch carries a binary file's content.
new:     3. Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file. With `--binary` the patch carries a binary file's content.
new:        - Run the diff again, and compare the two with `cmp`.

old 138:    - An empty diff writes no patch and removes a patch an earlier back-out of the step left there.
new:        - An empty diff writes no patch.
new:        - An empty diff removes a patch an earlier back-out of the step left there.

old 142: 5. Remove the entry from the dispatch block, and read the state file back: the other entries, the comment and blank lines under `dispatch:`, and every other byte as they were.
new:     5. Remove the entry from the dispatch block.
new:        - Read the state file back: the other entries, the comment and blank lines under `dispatch:`, and every other byte as they were.

old 145:    - Steps 6 makes a new preparation commit, and Steps 7 a new worktree with the patch applied by `git apply --3way`.
new:        - Steps 6 makes a new preparation commit.
new:        - Steps 7 makes a new worktree with the patch applied by `git apply --3way`.

old 168:    - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).", and the step's tag names it as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;
new:        - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).";
new:        - the step's tag names it as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;

old 201: - A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them. Only the session that wrote it commits it.
new:     - A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them.
new:     - Only the session that wrote it commits it.

```

## Items read, split and kept, per file

Items counted by `items.sh` (outside code fences; tables have no list items) before and after the change.

| File | Items read | Split | Kept | Items the splits became | Items after |
|---|---|---|---|---|---|
| `skills/land/SKILL.md` | 101 | 26 | 75 | 55 | 130 |
| `skills/ordo-init/SKILL.md` | 60 | 6 | 54 | 12 | 66 |
| `skills/plan-help/SKILL.md` | 12 | 2 | 10 | 4 | 14 |
| `skills/plan-orchestration/SKILL.md` | 141 | 43 | 98 | 105 | 203 |
| `skills/plan-retro/SKILL.md` | 46 | 5 | 41 | 11 | 52 |
| `skills/plan/SKILL.md` | 39 | 6 | 33 | 13 | 46 |
| `skills/refute/SKILL.md` | 73 | 9 | 64 | 18 | 82 |
| `skills/repo-setup/SKILL.md` | 59 | 6 | 53 | 12 | 65 |
| `skills/roadmap/SKILL.md` | 50 | 5 | 45 | 10 | 55 |
| `skills/spec/SKILL.md` | 126 | 30 | 96 | 63 | 159 |
| Total | 707 | 138 | 569 | 303 | 872 |

## Items kept

The reasons are the kinds of What to build 2: qualifier (an exception, a limit, a condition, a default), list (a list inside one requirement), explanation (a since/so/because clause, a reason, or a pointer to where the rule is stated), definition, entry (of a semicolon-ended list), one act.

The brief's flag count (187) is not reproduced by any count I ran (see "Anything in the brief that was wrong"). The widest count I could reproduce, an item holding a semicolon or a full stop followed by a space anywhere, nothing stripped, flags 164 items; 80 of them were split and these 84 were kept:

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
- land 45 was split; land 47 (qualifier: "while no `git` process runs"); land 69 (definition, then the rule "fixed before the booking"); land 83 (explanation: already staged, so not re-added); land 89 (explanation: what a left file means, then the amend); land 96 (qualifier: fixed when small, otherwise raised, a default, judgment call 2); land 127 (definition of the stop: it names the path and removes nothing).
- plan-orchestration 122 (qualifier: "its line keeping its tag" is an absolute phrase; its second sentence was split); 133 (explanation: the second clause is the first rule stated negatively); 138 (list of the two conditions); 141 (qualifier: a limit under `earned`); 146 (one act: grouping needs the reading); 148 (qualifier: the exception "only when no command can check it"); 222 (list: booked in two places, one act of booking).
- refute 47 (one act: the comparison needs the rerun); 108 (qualifier: "each finding's disposition under the Closed heading" says where); 132 (definition, see case 8).
- repo-setup 44 (explanation: what the CLI does, not a step of the skill); 147 (explanation: installed per user and one copy loaded restate the prohibition).
- spec 67 (explanation: "never left for the builder to hit" restates the rule); 101 (list: what "this run leaves nothing" consists of); 137 (definition of the refusal: nothing is removed); 170 (entry, with its explanation).

## Position references before and after

The grep of "What is on the tree", rerun on the changed tree, printed 105 lines, as before. `diff <(cut -d: -f1,3 refs-before.txt | sort) <(cut -d: -f1,3 refs-after.txt | sort)` printed only:

```text
20,21c20,21
< skills/ordo-init/SKILL.md:Rules 4
< skills/ordo-init/SKILL.md:Rules 4
---
> skills/ordo-init/SKILL.md:Rules 5
> skills/ordo-init/SKILL.md:Rules 6
```

Each reference, resolved by `refs.py` to the list it names (`Steps <n>` and `"What it reads" <n>` to the numbered item of that section, `Rules <n>` to the n-th Rules bullet, and to another skill's list where the text names that skill), with its line before and after and the rule text it points at after the change. The grep captures only the first number of "Rules 2 and 3"; `refs.py` reads all numbers. The three ordo-init rows marked "updated" are the references whose target moved; the plan-orchestration table cell "the round cap and the two bullets after it" (line 243 before, 301 after) is a position reference of a kind the grep does not match, and is updated from "two" to "five" because the round cap's two following bullets are now five (plan-orchestration Rules: the round cap, then "After its last round a step lands.", "Its small findings ... are fixed at landing.", and the three bullets of "Everything else that the rounds left undone ..."). The row for spec 127 was resolved by hand: "Under `plan-orchestration`, its Steps 4" names plan-orchestration's Steps 4.

```text
land:48 -> 53 | Steps 4 -> Steps 4 | same rule | On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, so the landing applies t
land:73 -> 90 | Steps 14 -> Steps 14 | same rule | Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 1
land:78 -> 95 | Steps 1 -> Steps 1 | same rule | Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
land:90 -> 108 | Steps 11 -> Steps 11 | same rule | Read the step's `worktree` from its dispatch entry, for Steps 14.
land:94 -> 112 | Steps 7 -> Steps 7 | same rule | Open the changed views, as "The look" says.
land:104 -> 124 | Steps 3, 4, 6 -> Steps 3, 4, 6 | same rule | In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's t
land:105 -> 125 | Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
land:118 -> 141 | Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
land:118 -> 142 | Steps 7 -> Steps 7 | same rule | Open the changed views, as "The look" says.
land:122 -> 146 | Steps 14 -> Steps 14 | same rule | Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 1
land:124 -> 148 | Steps 11 -> Steps 11 | same rule | Read the step's `worktree` from its dispatch entry, for Steps 14.
land:137 -> 162 | Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
land:138 -> 163 | Steps 3 -> Steps 3 | same rule | In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's t
land:142 -> 167 | plan`s Steps 5 -> Steps 5 | same rule | Copy the `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/us
land:145 -> 170 | Steps 1 -> Steps 1 | same rule | Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
land:146 -> 171 | Steps 14 -> Steps 14 | same rule | Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 1
land:146 -> 171 | Steps 11 -> Steps 11 | same rule | Read the step's `worktree` from its dispatch entry, for Steps 14.
ordo-init:30 -> 31 | Steps 11 -> Steps 11 | same rule | Stop for the approval ("Stops").
ordo-init:74 -> 76 | Rules 4 -> Rules 6 | updated, same rule | A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
ordo-init:80 -> 83 | What it reads 3 -> What it reads 3 | same rule | The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, 
ordo-init:81 -> 84 | repo-setup`s Steps 12 -> Steps 12 | same rule | Commit the setup's other files in one commit by explicit path list, the subject naming the repository's setup.
ordo-init:96 -> 100 | Steps 11 -> Steps 11 | same rule | Stop for the approval ("Stops").
ordo-init:96 -> 100 | Steps 10 -> Steps 10 | same rule | Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in fu
ordo-init:98 -> 102 | Steps 6 -> Steps 6 | same rule | Ask the user for the keys the repository cannot give ("Stops").
ordo-init:98 -> 102 | Steps 6 -> Steps 6 | same rule | Ask the user for the keys the repository cannot give ("Stops").
ordo-init:99 -> 103 | Steps 3 -> Steps 3 | same rule | Draft `verification`: the page that defines the green check, with the commands every step runs and the directo
ordo-init:101 -> 105 | Steps 14 -> Steps 14 | same rule | Commit the files written by explicit path list, in one commit whose subject names the plan configuration.
ordo-init:107 -> 111 | Rules 2, 3 -> Rules 2, 3, 4 | updated, same rule | The skill draws only from the repository and the user, for the file it drafts and for every page. / A page the
ordo-init:108 -> 112 | Rules 4 -> Rules 5, 6 | updated, same rule | The skill never overwrites an existing page or `.agents/plan.yaml`. / A change to an existing file, `.gitignor
ordo-init:112 -> 116 | Steps 3 -> Steps 3 | same rule | Draft `verification`: the page that defines the green check, with the commands every step runs and the directo
plan-help:89 -> 91 | Steps 1 -> Steps 1 | same rule | Print the sequence in "The sequence, printed verbatim".
plan-orchestration:48 -> 51 | spec`s Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
plan-orchestration:55 -> 66 | Steps 5, 8 -> Steps 5, 8 | same rule | While the builder runs, do ledger work only: the next step's premise checks, the bookings, the usage table. / 
plan-orchestration:61 -> 76 | Steps 4 -> Steps 4 | same rule | Choose the step's executor.
plan-orchestration:66 -> 84 | Steps 8 -> Steps 8 | same rule | Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the
plan-orchestration:108 -> 147 | spec`s Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
plan-orchestration:156 -> 203 | spec`s Steps 5 -> Steps 5 | same rule | Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by read
plan-orchestration:161 -> 209 | Steps 4 -> Steps 4 | same rule | Choose the step's executor.
plan-orchestration:167 -> 216 | Steps 4 -> Steps 4 | same rule | Choose the step's executor.
plan-orchestration:169 -> 219 | Steps 8 -> Steps 8 | same rule | Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the
plan-orchestration:170 -> 220 | Steps 6 -> Steps 6 | same rule | On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed o
plan-orchestration:196 -> 249 | land`s Steps 9 -> Steps 9 | same rule | Produce the orchestrator's usage row with `templates/usage.py <session log> <from> <to>`: the session log is t
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
spec:103 -> 122 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:105 -> 124 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:124 -> 146 | Steps 5 -> Steps 5 | same rule | Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by read
spec:126 -> 149 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:127 -> 150 | plan-orchestration`s Steps 4 -> Steps 4 | same rule | Choose the step's executor. (its sub-bullets "**The launch commit.**" are still under item 4)
spec:132 -> 157 | land`s Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
spec:132 -> 157 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:143 -> 173 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:144 -> 174 | Steps 4 -> Steps 4 | same rule | Write `agents/briefs/<step>.md` from `templates/brief.md`.
spec:145 -> 175 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:145 -> 176 | Steps 7 -> Steps 7 | same rule | Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
spec:146 -> 177 | Steps 9 -> Steps 9 | same rule | Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `
spec:168 -> 200 | What it reads 4 -> What it reads 4 | same rule | `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
spec:169 -> 201 | Steps 3 -> Steps 3 | same rule | Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
spec:170 -> 202 | Steps 6 -> Steps 6 | same rule | Make the preparation commit, a resume point ("Rules").
spec:179 -> 211 | Steps 2 -> Steps 2 | same rule | Check every premise the step's text makes against the tree.
spec:180 -> 212 | Steps 3 -> Steps 3 | same rule | Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
spec:181 -> 213 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:182 -> 214 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:183 -> 215 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
spec:186 -> 218 | land`s Steps 6 -> Steps 6 | same rule | Run the verification commands of the configuration block on main, in order, each through its filter, stopping 
spec:187 -> 219 | Steps 1 -> Steps 1 | same rule | Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
```

The three updated references and what they point at:

- ordo-init 74 (76 after), Steps 10: "the `.gitignore` changes, as Rules 4 says". Old Rules 4 was "The skill never overwrites an existing page or `.agents/plan.yaml`. A change to an existing file, `.gitignore` included, is shown as a diff and made after approval." The `.gitignore` rule is its second sentence, now Rules 6: "A change to an existing file, `.gitignore` included, is shown as a diff and made after approval."
- ordo-init 107 (111 after), Anti-patterns "A rule the repository does not state, written into a page": "Rules 2 and 3" to "Rules 2, 3 and 4". Old Rules 3 ("A page the skill writes states what the repository already does or says, and cites where.") is now Rules 3 and Rules 4.
- ordo-init 108 (112 after), Anti-patterns "Overwriting an existing page or `.agents/plan.yaml`": "Rules 4" to "Rules 5 and 6", old Rules 4's two sentences.

`refute`'s `Rules 1`, `plan-retro`'s `Rules 2` and `roadmap`'s `Rules 1` and `Rules 2` are unchanged: no Rules bullet of those skills was split, as the Rules lists printed by `awk '/^## Rules/{r=1;next} r&&/^- /{n++; print n": "$0}'` show. Other relative references checked with `grep -rnE 'bullets? (above|below|after|before)|(first|second|third|last|next|previous) (bullet|rule|item|sub-bullet)|(two|three|four|five) bullets|above say|below say' skills docs README.md`: plan-orchestration 111 "as the bullets above say" still points at the bullets above it (the ledger-change rule, now lines 145 and 146); land 85 "The message's last bullet" is about a commit message; `docs/dev/change-standard.md` 64 "last rule" is about `shared-rules.md`. `grep -rnE 'SKILL\.md:[0-9]+|SKILL\.md\` line' docs README.md skills` printed nothing, before and after, so no page cites a changed line number.

## Files with line counts

`wc -l skills/*/SKILL.md` before and after:

| File | Before | After |
|---|---|---|
| `skills/land/SKILL.md` | 167 | 196 |
| `skills/ordo-init/SKILL.md` | 116 | 122 |
| `skills/plan-help/SKILL.md` | 93 | 95 |
| `skills/plan-orchestration/SKILL.md` | 252 | 314 |
| `skills/plan-retro/SKILL.md` | 105 | 111 |
| `skills/plan/SKILL.md` | 92 | 99 |
| `skills/refute/SKILL.md` | 135 | 144 |
| `skills/repo-setup/SKILL.md` | 148 | 154 |
| `skills/roadmap/SKILL.md` | 137 | 142 |
| `skills/spec/SKILL.md` | 202 | 235 |
| total | 1447 | 1612 |

The user-visible change is the text of the ten installed skills; each change, before and after, is in "Every item split" and in the three reference updates above. No rule was added, removed or changed in scope; no other file changed.

## Judgment calls

1. **The test for two requirements.** Two clauses with their own verbs, each of which can be broken while the other holds, were split. A list of objects under one verb ("booked in the open items ... and under the step's Step 0", "asked with its two values ... and with no offered answer") was kept as a list inside one requirement. A second action that cannot be done without the first (read, then group; rerun, then compare; diagnose, then write the found cause) was kept: the second cannot hold while the first is broken, so they are one act.
2. **A conditional with a default.** A rule that sends each case one way under a condition and the other way otherwise ("fixed at landing when it is small and inside the brief, or raised ..."; "otherwise stop"; "MIT is written from ...; another license is written from ...") was kept as one rule with its default (land 96, refute 71's sub-bullet, repo-setup 82 and 89's sub-bullet). Where a branch held two acts, the acts were split and each carries its condition (spec 127: "Run by hand, the session writes itself as the identity." and "Run by hand, the session makes it before the build starts.").
3. **"Is not X: it is Y".** An item saying what is not done and what is done instead was split, since each can be broken alone (a stop not raised; a thing done and a stop raised): land 61, ordo-init 52, roadmap 57, spec 92, spec 125, refute 71. The same for "listed by path and left alone" (land 36, plan-orchestration 108 and 111, spec 51) and "left alone and never committed" (spec 55).
4. **Labels repeated.** A labelled sub-bullet split into siblings repeats its bold label on each, the label being the bullet's scope (plan-orchestration Steps 4 and 8, "The two tiers, and the models", roadmap "The format is the file's"). The label references "Steps 4 ("The builder")" and "Steps 8's "How" and "Before the resume"" still find their bullets.
5. **A sibling that relies on the one before it.** Case 4's third bullet is "The loop moves on to the next unblocked step.", as the case gives it; the condition ("A stop, ...") is in the sibling directly above, and Steps 10 points at step 3 for "what a stop does to the loop". Repeating the condition there would need a word the old text does not have ("On a stop"). plan-help 43/44 ("The next line is `Ruled: ...`." after "An open item that waits on a ruling is printed with it.") and spec 199/200 (the tag entry after the Rulings-line entry of "a ruling that adds or splits a step") rely on the item above in the same way. A sub-bullet split out of a numbered item's text carries that item's leading qualifier by its place under it (land Steps 3's `git commit` under "In the worktree, from inside it, after waiting for its `index.lock` to go"; ordo-init "Checking an existing file" 1's `Run` under "With `.agents/plan.yaml` present").
6. **Kept, where a split needs words the old text does not have or would part a qualifier from its rule.** plan-orchestration 76's "its usage recorded beside the first" and 122's "its line keeping its tag" are absolute phrases; splitting them needs a new verb. plan-orchestration 70 keeps "on disk; the next resume-point commit carries them" with the write it attaches to in the old sentence, and "Save its report." is its own item (the commit timing of a saved refuter report is stated in "Resuming, and handing the plan over", lines 141 and 142 after the change). land 56 keeps "It is counted and named the same way as a red line." as one item, a single pointer to the red-line rule that lines 65 to 67 now state as three items. spec 75 (a ruled candidate "is settled", what that entails, and its limit) is one definition with its limit; the brief recording the ruling is also stated in spec Steps 4's "Libraries checked" item. ordo-init 68 (the example's comment and its order) is one act, writing the keys as the example has them. plan-orchestration 249 (the round cap, its exception and its two limits) is kept whole, so the Anti-patterns reference counts it as one bullet. refute Rules 1 is kept (case 8).
7. **Verbs restored from a gapped clause.** Where a split parts clauses that shared one verb, the shared verb is repeated in the new item ("is", "is dispatched", "makes", "committed"; listed under "Word-diff check"). These are words of the old item, repeated, not new words.
8. **Pronoun subjects.** Where a new item would start with "it" or "that" standing for a noun in the old sentence, the noun is repeated (for example "The failure is recorded ...", "A shared path goes to ...", "The entry is committed ...", "The stop message never goes ..."). Where the antecedent is a short noun in the sibling directly above and the old text already relied on it ("It is counted as a fix at landing.", "It records the run as Steps 7 says."), the pronoun is kept.
9. **plan Steps 5 re-indented.** Its item text ended "Then make the `ADAPT` edits of `land.sh` and `land.test.sh` from `plan.yaml`:" above five entries. That sentence is a requirement of its own (copying and making the edits can each be skipped), so it became a sub-bullet, and its five entries were indented two more spaces (`     - `) to stay its entries. No word of them changed. This serves What to build 1 and 3.
10. **Two sentences moved inside their item.** spec 111 follows the brief's own run (the apply with its second sentence, then "Read what it prints."). spec "A step taken back out of main" 3 keeps "With `--binary` the patch carries a binary file's content." with the write it explains, in the item text, and the rerun and `cmp` become its sub-bullet, above the existing sub-bullets about the compare.
11. **plan-orchestration Anti-patterns cell.** The cell "as the round cap and the two bullets after it in "Rules" say" is a position reference whose targets moved when plan-orchestration Rules 4 and 5 (old lines 250 and 251) split; "two" became "five" so it names the same rules. The cell's other text is unchanged (Decision 3 leaves table cells out of the splitting).

## Anything in the brief that was wrong

- The brief's flag count, "187 hold a semicolon or a second sentence outside backticks and parentheses: land 32 of 101, ordo-init 10 of 60, plan-help 2 of 12, plan-orchestration 43 of 141, plan-retro 8 of 46, plan 6 of 39, refute 28 of 73, repo-setup 14 of 59, roadmap 3 of 50, spec 41 of 126", is not reproduced by any count I ran over the 707 items: semicolon or ". " outside backticks and parentheses gives 161 (land 28, ordo-init 7, plan-help 1, plan-orchestration 42, plan-retro 7, plan 5, refute 27, repo-setup 8, roadmap 2, spec 34); the same with nothing stripped gives 164; adding ": " gives 270 to 289. The brief does not give its command. The scope is unaffected: every one of the 707 items was read and decided, and the brief says the count is a guide. The totals the brief states are confirmed: 707 items (`items.sh`) and 1447 lines (`wc -l skills/*/SKILL.md`, `1447 total`).
- Nothing else in the brief was found wrong: the lines it quotes (land 28, 106, 165, 166; plan-orchestration 47, 78, 123; plan-retro 49; refute 61, 66, 91; repo-setup 70; spec 40, 111, 165, 201; ordo-init 74) matched their quotes on the unchanged tree, and the Rules references it lists (ordo-init 107 and 108, plan-retro 98, roadmap 128 and 129, refute 61) were at those lines.
