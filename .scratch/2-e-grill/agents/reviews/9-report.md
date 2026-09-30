# Step 9 report

Everything in the brief is done.

## Open items of the state file

None from this step. Nothing in the brief was found wrong or impossible; three observations for the orchestrator are under "Anything in the brief that was wrong" (none needs a ruling).

## Cases, first run on the unchanged tree (worktree at 9f667d6, `git status` clean)

No case was got wrong by the brief's rules; no hand-back.

| Case | Result on the unchanged tree | Expected |
|---|---|---|
| `git grep -n -E "approval it would need later\|need approved later" -- skills docs README.md` | nothing (rc=1) | nothing, met |
| `git grep -n "The user approves what it computes" -- skills` | `skills/plan-orchestration/SKILL.md:204` and `skills/plan-retro/SKILL.md:85` | those two, met |
| `git grep -n -c "already approved in full, by a ruling on an open item" -- skills` | nothing (rc=1) | nothing, met |
| `git grep -n -E "names another repository\|path from the folder that holds this repository" -- skills` | nothing (rc=1) | nothing, met |
| ``grep -n -E "research-hub's\|`tools/manuscript`" docs/roadmap.md`` | line 151 only | line 151, met |
| `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` | ok line, met |
| `git diff --stat HEAD -- . ':!.scratch'` | empty | empty, met |
| Every line the items change, read with `sed -n` | 204; 296-297; spec 192; state template 38; plan-terms 44; plan-retro 85; roadmap 155-158; ordo-init 122-125; repo-setup 176-178; roadmap.md 151; glossary 49 all match the brief's quotes | met |

Reading cases have no first run; they are read after the change, below.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 plan-orchestration Stops sub-bullet | DONE | `git diff`, below; now `skills/plan-orchestration/SKILL.md:298` |
| 2 plan-orchestration:204 | DONE | `git grep -n "The user approves what it computes" -- skills; echo rc=$?` prints `rc=1` (nothing) |
| 3 spec:192 and sub-bullet | DONE | `skills/spec/SKILL.md:192` and `:193` |
| 4 state template line 38 | DONE | grep case 1 hit `skills/plan/templates/orchestrator-state.md:38` |
| 5 plan-terms line 44 and glossary | DONE | `sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`; then `--only glossary` prints `ok: the plan-terms block equals the template` |
| 6 plan-retro:85 | DONE | `git diff`, below |
| 7 two roadmap bullets | DONE | `skills/roadmap/SKILL.md:158` and `:159` |
| 8 docs/roadmap.md:151 | DONE | ``grep -n -E "research-hub's\|`tools/manuscript`" docs/roadmap.md; echo rc=$?`` prints `rc=1` (nothing) |
| 9 the bullet in three skills | DONE | `git grep -n -c "already approved in full, by a ruling on an open item" -- skills` prints `skills/ordo-init/SKILL.md:1`, `skills/repo-setup/SKILL.md:1`, `skills/roadmap/SKILL.md:1` |
| Case 1 (later approval) | DONE | hits: `docs/glossary.md:49`, `skills/plan-orchestration/SKILL.md:298`, `skills/plan/templates/orchestrator-state.md:38`, `skills/repo-setup/templates/plan-terms.md:44`, `skills/spec/SKILL.md:193`; one line each |
| Case 4 (roadmap bullets) | DONE | hits: `skills/roadmap/SKILL.md:158` and `:159` |
| Diff stat | DONE | `git diff --stat HEAD -- . ':!.scratch'` ends `10 files changed, 14 insertions(+), 7 deletions(-)`; files: docs/glossary.md, docs/roadmap.md, skills/ordo-init/SKILL.md, skills/plan-orchestration/SKILL.md, skills/plan-retro/SKILL.md, skills/plan/templates/orchestrator-state.md, skills/repo-setup/SKILL.md, skills/repo-setup/templates/plan-terms.md, skills/roadmap/SKILL.md, skills/spec/SKILL.md |
| ASCII over the ten files | DONE | `git diff --name-only \| while read f; do LC_ALL=C grep -n '[^ -~]' "$f"; done` printed nothing |
| No test added or changed | Not applicable | The step adds and changes no test |
| Verify list | DONE | below |

Verify list, run from the worktree root as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

## Reading cases

- Skill layout, "Writing for an agent" and "Lists and tables": read each new bullet in place. `plan-orchestration:298` is a sub-bullet at two spaces under the stop-message bullet, beside the question-box sub-bullet. `spec:193` is at five spaces under the open-item bullet at three. The roadmap bullets (158, 159), and the item 9 bullets (roadmap:161, ordo-init:125, repo-setup:179) are at column 0 in their Rules lists. Each is one line with its qualifier in the same bullet. In the two new roadmap bullets "project" does not appear; `git grep -n -i project -- skills/roadmap/SKILL.md` still lists only lines 21 and 34 (the `projects:` sense) plus the description and prose of the file, none in the new lines.
- `skills/roadmap/SKILL.md:156` ("as the next rule says") still points at line 157, "Every entry this skill writes has a goal and a gate ... an entry under "Not yet specified" has a goal and what must be known ...": the new bullets are at 158 and 159, after 157. The bullet at 159 says "the one exception to the next rule"; the next rule is line 160, "Every path is relative to the repository root."
- The one-ruling sentences against `plan-orchestration` 197-205 (read after the edit: line 204 "The user's ruling on the proposal approves what it computes, before it is written." then 205 "The user rules on each proposal."), `plan-retro` item 4 (line 85, "The user's decision on the proposal approves what it computes, before it is written.") and Steps 10 (line 58, "Take the user's decision on each proposal, one by one: approved, corrected or declined"), and the rules file's "A new script needs the user's approval of what it computes before it is written": the approval of a script's computation is given by the ruling or decision on the proposal or option that states it. `git grep -n "The user approves what it computes" -- skills` prints nothing, so no text asks for a second approval after it.
- Rule 19, each approval stop against the new bullet, no ruling having stated the change: `roadmap` Steps 4 (line 48) and Stops "The change" (line 129) still say the change is written once the user approves or corrects it, and the new bullet only makes a ruling that stated the change that approval. `ordo-init` Steps 11 (line 80), Stops "The draft" (103) and "A fix in the check" (107) and Rules line 124 (diff shown, made after approval) hold when no ruling stated the change; the new line 125 states the case where one did. `repo-setup` lines 90 and 99 and Stops "The drafted sync change" (153) hold the same way. `spec` "Steps / A ruling" and `plan-orchestration` Stops row "The roadmap diff" (287, "The user's approval of the diff") hold when no ruling stated the diff; where the ruling on an option stated it, roadmap:161 makes that ruling the approval.
- The roadmap bullets against `docs/roadmap.md` lines 73, 151 (after), 172, 179, 218: line 73 (goal, names `research-hub/tools/manuscript` as the source of a migration, with the path) satisfies bullet 158 and 159; line 151 (after) names `research-hub/CLAUDE.md` and `research-hub/tools/manuscript` as paths and research-hub as a whole in "removed from research-hub" (the entry changes it); lines 172 and 179 (gates) name Cathedra as the repository a gate runs on; line 218 is the done record of a command with an absolute path. None is made wrong, and bullet 159 (path from the folder that holds this repository, exception to the next rule) does not contradict "Every path is relative to the repository root", which its own text marks as excepted.

## Files changed, each changed line before and after

Line counts after the change (`wc -l`): see the last section. Changed lines, verbatim:

1. `skills/plan-orchestration/SKILL.md:204`
   - Before: `  - The user approves what it computes before it is written.`
   - After: `  - The user's ruling on the proposal approves what it computes, before it is written.`
2. `skills/plan-orchestration/SKILL.md`, new line 298 (after the question-box sub-bullet)
   - After: `  - Each option states in full every approval it would need later, such as what a new script computes, a change to the configuration or the verification list, or a diff the user must see. The user's ruling on the item then approves them too, and the work goes on with no second stop.`
3. `skills/spec/SKILL.md:192`
   - Before: `   - The open item in the state file. It holds the step, what the tree shows against the step's text, the choice the user owns, and one recommendation with its reasons.`
   - After: `   - The open item in the state file. It holds the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.`
4. `skills/spec/SKILL.md`, new line 193
   - After: `     - Each option states in full every approval it would need later, such as what a new script computes, a change to the configuration or the verification list, or a diff the user must see. The user's ruling then approves them too.`
5. `skills/plan/templates/orchestrator-state.md:38`
   - Before: `- <a stop awaiting the user's ruling, or a proposal of the recurring-findings pass, with its options, the pros and cons of each, and one recommendation, as plan-orchestration's Stops section says; or "none">. An item is booked here the moment it is raised; it leaves only when the user has ruled, and then goes to the closed list.`
   - After: `- <a stop awaiting the user's ruling, or a proposal of the recurring-findings pass, with its options, the pros and cons of each, what each would need approved later, and one recommendation, as plan-orchestration's Stops section says; or "none">. An item is booked here the moment it is raised; it leaves only when the user has ruled, and then goes to the closed list.`
6. `skills/repo-setup/templates/plan-terms.md:44`, and `docs/glossary.md:49` (written by the sync)
   - Before: `- **open item**: an entry of the state file's open items. It is a decision only the user can make, with its options, their pros and cons and one recommendation, closed by the user's ruling, or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".`
   - After: `- **open item**: an entry of the state file's open items. It is a decision only the user can make, with its options, their pros and cons, what each option would need approved later, and one recommendation, closed by the user's ruling, or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".`
7. `skills/plan-retro/SKILL.md:85`
   - Before: `   - The user approves what it computes before it is written.`
   - After: `   - The user's decision on the proposal approves what it computes, before it is written.`
8. `skills/roadmap/SKILL.md`, new lines 158 and 159 (after line 157)
   - After 158: `- A goal says what the work delivers, and names another repository only where the entry reads or changes it, such as the source of a migration; the gate and the dependencies name one under the same condition, such as the target of a switch-over or the repository a gate runs on.`
   - After 159: `- A file or folder in another repository is written as its path from the folder that holds this repository, such as `research-hub/tools/manuscript`, the one exception to the next rule.`
9. The item 9 bullet, new line in each: `skills/roadmap/SKILL.md:161` (end of file, after "Every path is relative to the repository root."), `skills/ordo-init/SKILL.md:125` (after the diff-after-approval rule at 124), `skills/repo-setup/SKILL.md:179` (end of file, after line 178):
   - After: `- A change whose content the user already approved in full, by a ruling on an open item that stated it, is written without stopping for approval again, and the report names that ruling.`
10. `docs/roadmap.md:151`
   - Before: ``- Gate: with the user's explicit permission, asked for before any of it: your global `CLAUDE.md` and research-hub's `CLAUDE.md` name the new skills; the installed academic skills are removed from research-hub; `tools/manuscript` points at `paper`. Nothing of it is done without that permission.``
   - After: ``- Gate: with the user's explicit permission, asked for before any of it: your global `CLAUDE.md` and `research-hub/CLAUDE.md` name the new skills; the installed academic skills are removed from research-hub; `research-hub/tools/manuscript` points at `paper`. Nothing of it is done without that permission.``

No other line of the ten files changed (`git diff` shows 14 insertions and 7 deletions, the changes above).

## Judgment calls the brief left open

None. Every text was written as dictated, applied with the script `$TMPDIR/edit9.py`, which replaces or inserts the dictated lines at the dictated line numbers, asserting the old text or neighbouring line first; the file's other bytes, trailing newline included, are as they were.

## User-visible changes

- The stop message, the open item of `spec`, the state file's open-items placeholder and the glossary term **open item** now say each option states what it would need approved later; before, they named options, pros and cons and one recommendation only (`spec` did not name options).
- A recurring-findings check or a retro check is approved by the ruling or decision on the proposal, where before the text asked for a further approval.
- `roadmap`, `ordo-init` and `repo-setup` write a change without a second stop when a ruling on an open item stated it in full, and the report names that ruling; before, each stopped again.
- The `roadmap` skill's Rules require another repository to be named only where the entry reads or changes it, and a file or folder in it to be written as its path from the folder that holds this repository; `docs/roadmap.md:151` names its two research-hub files by that path.

## Anything in the brief that was wrong

Nothing wrong or impossible. Observations, none acted on (rule 20):

- `skills/ordo-init/SKILL.md:119` ("The skill writes nothing until the user approves or corrects the draft") and `skills/repo-setup/SKILL.md:173` ("nothing is written until the user approves or corrects the draft") are worded without the exception of the new bullet; read together, a ruling that stated the change is the user's approval, so they do not contradict it, but a reader who stops at those lines will not see the exception.
- The glossary term **open item** does not carry the sentence "the work goes on with no second stop"; the term now lists what each option would need approved later, which is what item 5 dictated.
- `skills/roadmap/SKILL.md:21` and `:34` still use "project" in the `projects:` sense only; the new bullets use "repository", as decision 5 says.

## Files with line counts (after)
         109 docs/glossary.md
         228 docs/roadmap.md
         126 skills/ordo-init/SKILL.md
         328 skills/plan-orchestration/SKILL.md
         113 skills/plan-retro/SKILL.md
          67 skills/plan/templates/orchestrator-state.md
         179 skills/repo-setup/SKILL.md
          93 skills/repo-setup/templates/plan-terms.md
         161 skills/roadmap/SKILL.md
         282 skills/spec/SKILL.md
        1686 total
