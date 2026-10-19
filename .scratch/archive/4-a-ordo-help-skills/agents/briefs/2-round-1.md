# Brief: 2, repair round 1

The brief `agents/briefs/2.md` still governs the step: its rules, conventions, paths and checks hold unchanged. This round closes the six findings of the refuter report `agents/reviews/2-refuter.md`, each with the ruling below. The step is built inline, so the session that ran the step makes these changes. The paths it writes are those of the brief, and the only file this round changes is `.scratch/4-a-ordo-help-skills/agents/reviews/2-report.md` in the main checkout's ledger. `2-run.txt` stays as it is, since it is the run's record.

The worktree holds no change (`git status --short` from inside it prints nothing), so the round's snapshot `.agents/worktrees/4-a-ordo-help-skills-2-round-1/` holds an empty `files.txt` and, beside it, `2-report.before.md`, the report as it stood when the round was sent, for the reviewer over the round to diff against.

## Rulings

1. **Spec 1, where the two files were written** (`2-report.md`, "The files"). The sentence that says the brief asked for the files to be written in the main checkout's ledger is replaced by the fact: both files were written straight into the main checkout's ledger, while the brief's "What to build" opening asks for them to stand in the worktree's ledger copy first and be saved from there. The section "Anything in the brief that was wrong or impossible" names this as a departure from the brief, with the transcript's tool use as evidence, and says that the end place is the one the brief names.
2. **Spec 2, the final newline** (`2-report.md`, "Judgment calls the brief left open" and "Anything in the brief that was wrong or impossible"). The newline is moved out of "Judgment calls" into "Anything in the brief that was wrong or impossible": item 4 asks for the message text byte for byte, the message text is 6886 bytes (`jq -j ... | wc -c`) and `2-run.txt` 6887 (`wc -c`), and without the added newline the last block cut of item 6 would end in a line with no newline. "Judgment calls" then reads "none".
3. **Spec 3, the shortened command and the missing line count** (`2-report.md`, DONE / NOT DONE, row "Verify 1", and "The files"). The row quotes the brief's character-set command in full, as run, with its output `exit=0`. "The files" gives the report's own line count from `wc -l` after the round's changes, and the line count of `2-run.txt` (109).
4. **Standards 1, line numbers in a ledger file** (`2-report.md`, "The terms", case 2, "Every host- or user-visible change"). Each page is cited by its section: the glossary's entries **pin** and **dispatch entry** by their names, the roadmap by its entry 3, "The writing base", and `skills/ordo-help/SKILL.md` by its frontmatter `version` key. The line numbers are removed.
5. **Standards 2, the second output line** (`2-report.md`, "How 2-run.txt was taken", last bullet). The command's output is quoted as printed, both lines, the second being `Shell cwd was reset to /Users/axelfaes/workspace/ordo`.
6. **Behaviour 1, the line printed during the run** (`2-report.md`). A section states that the session printed one other assistant message to the user between the 7th and 8th `SKILL.md` reads: the transcript record `be5deec2` at 06:49:59.643Z, with its text quoted. It was a progress line the runner asked for while the run went on ("The user hasn't heard from you in a while"), and no step of the skill prints it. It is outside message `3ce9e401`, so `2-run.txt` and cases 6 and 9 do not cover it. The section gives the before (the user saw the 109 lines and nothing more) and the after (the user saw that one line during the run and then the 109 lines).

## Verify before you report

From the main checkout's root:

1. The character-set check of the brief's "Verify before you report" 1, over the two files, prints only `exit=0`.
2. `grep -n 'line [0-9]' .scratch/4-a-ordo-help-skills/agents/reviews/2-report.md` prints no citation of a page by a line number. It may still print a count or a transcript line range.
3. Case 9's `diff` is run again and prints nothing, since `2-run.txt` is unchanged.

## Report

Rewrite `2-report.md` in the brief's shape, end state only, with a section "Repair round 1" that names each of the six findings, the change that closes it and the check that shows it.
