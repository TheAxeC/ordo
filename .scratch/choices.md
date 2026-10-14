# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C70

# Entry 2.I Several plans in one session

## C40. How a step in /spec is recorded (2026-10-12)

A user-visible choice: a value of the dispatch entry, a term of the glossary. Step 3's line has a step count toward the limit on steps in flight, and have its paths compared, from the start of its `/spec`. Ruling D17 and ADR 0011 make the dispatch blocks of every open plan the one record the skills count and compare over, and `/spec` writes a step's dispatch entry only at its Steps 9, after the worktree. The glossary's dispatch entry gives `landing` the values `not-started`, `cherry-picking` and `backed-out`.
  - Option (a), recommended: `/spec` writes the step's dispatch entry at the end of its preflight, holding the step and `landing: preparing`; the entry counts toward the limit, its brief is compared once written, Steps 9 fills the entry and sets `landing: not-started`, a stop or a wait removes it, and on resumption an entry at `landing: preparing` is an interrupted `/spec`. Pro: the dispatch blocks stay the one record, as D17 and ADR 0011 say, and a session or a new orchestrator sees the step. Con: a fourth value of `landing`, in the glossary and the state-file template.
  - Option (b): a separate list of the steps in `/spec`, beside the dispatch block in the state file. Pro: the dispatch entry keeps its shape. Con: a second record to count and compare over, against D17 and ADR 0011.
  - Option (c): a step counts from the moment its brief is on disk. Pro: no new value. Con: the window from the preflight to the brief stays unseen, which is run finding 9's defect left in part.
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/archive/2-i-several-plans-in-one-session/plan.md:92` (Open item Step 3, how a step in /spec is recorded)
Builds on it: step 3

# Entry 2.K The skill-text fixes from the retro and the real run

## C41. No breakage testing (2026-10-13)

The goal part "no breakage testing, in docs/dev/change-standard.md, the repo-setup change-standard template and the shared-rules template". What exists now: none of the three files names breakage testing (`grep -n -i breakage` prints nothing in each). The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`, "Approved proposals".
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:30` (D1 no breakage testing)
Builds on it: step 1

## C42. The character-set check reads only files on disk (2026-10-13)

The goal part "the character-set check of docs/dev/building.md and docs/dev/change-standard.md reads only files that exist on disk". What exists now: both pages feed `git ls-files -coz --exclude-standard` straight to `perl`, which fails on a file deleted from the working tree. The part's text is the computation the user approved, `.scratch/retros/sessions-2026-10-12.md`, "Approved proposals".
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:31` (D2 the character-set check reads only files on disk)
Builds on it: step 1

## C43. Land never settles a clash of two rulings (2026-10-13)

The goal part "land never settles a clash between two of the user's rulings at landing". What exists now: `land` Steps 6 fixes a small finding inside the brief at landing and says nothing of a clash. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:32` (D3 land never settles a clash of two rulings)
Builds on it: step 1

## C44. Land carries out a ruling only on what it names (2026-10-13)

The goal part "land carries out a ruling only on what it names". What exists now: `land` Steps 6 has no such bullet. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:33` (D4 land carries out a ruling only on what it names)
Builds on it: step 1

## C45. A ruling given outside a plan is written down (2026-10-13)

The goal part "the shared rules write a ruling given outside a plan into the repository in the same turn". What exists now: `skills/repo-setup/templates/shared-rules.md` has no such rule. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: Nygard's ADR post keeps every decision written: "If a decision is reversed, we will keep the old one around, but mark it as superseded" (https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:34` (D5 a ruling given outside a plan is written down)
Builds on it: step 1

## C46. A proposal says what exists now (2026-10-13)

The goal part "the shared rules have a proposal say what exists now, what changes, what it replaces and why". What exists now: `skills/repo-setup/templates/shared-rules.md` has no such rule. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:35` (D6 a proposal says what exists now)
Builds on it: step 1

## C47. The builder's prompt says a shortcut is a finding (2026-10-13)

The goal part "the builder's prompt says a shortcut is a finding". What exists now: `plan-orchestration` Steps 4, "The prompt", lists seven things and not this one. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:36` (D7 the builder's prompt says a shortcut is a finding)
Builds on it: step 1

## C48. Roadmap compares the written file with the draft (2026-10-13)

The goal part "roadmap compares the written file with the approved draft before the commit". What exists now: `roadmap` Steps 4 writes the change and Steps 5 commits it, with no compare between. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:37` (D8 roadmap compares the written file with the draft)
Builds on it: step 1

## C49. A dictated sentence about a script is run first (2026-10-13)

The goal part "a sentence a brief or a round dictates about how a script behaves is run on the script before it is written". What exists now: `plan-orchestration` Steps 8, "Dictated text", holds dictated text against the rules and not against the script. The part's text is the user's two approved sentences, `.scratch/retros/sessions-2026-10-12.md`, merged into one when entry 2.K was written.
  - Option (a), recommended: keep the part as the entry writes it, in `plan-orchestration` Steps 4, "The prompt", for the builder, and Steps 8, "Dictated text", for the orchestrator, the run quoted in the round's brief. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: Python's doctest "searches for pieces of text that look like interactive Python sessions, and then executes those sessions to verify that they work exactly as shown" (https://docs.python.org/3/library/doctest.html).
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:38` (D9 a dictated sentence about a script is run first)
Builds on it: step 1

## C50. The reviewer's git commands (2026-10-13)

The goal part "refute's reviewer runs no git command other than git diff <base>, git status --short and git show <base>:<path>". What exists now: `refute` "What it reads" 5 allows `git diff <base>` and `git status --short`, and run finding 8 of the first run shows a reviewer needing `git show <base>:<path>` to read the unchanged tree. The part's text is the user's approved sentence with `git show <base>:<path>` added when entry 2.K was written.
  - Option (a), recommended: keep the part as the entry writes it, in `refute` Rules, with "What it reads" 5 naming the same three commands. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: GitHub's Copilot cloud agent "cannot directly run `git push` or other Git commands" (https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations).
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:39` (D10 the reviewer's git commands)
Builds on it: step 1

## C51. How a verify command that starts with git reaches a builder (2026-10-13)

The goal part "a verify command that starts with git reaches a builder in a form that runs no git". What exists now: `spec` Steps 4 puts the character-set check of the verify list among a brief's checks, and the verify list feeds it from `git ls-files`; the first scratch run's briefs carried that form, a builder replaced it with `printf` on its own, and later briefs gave `printf '%s\0' <files> |` (run finding 1 of the first run).
  - Option (a), recommended: `spec` Steps 4 writes such a check in the brief with its file list given as `printf '%s\0' <the files the step changes> |` in place of the git command, the rest of the command as the verify list has it. Pro: the builder runs the check with no git, and the reviewer reruns the same line. Con: the brief's line differs from the verify list's, which the brief says.
  - Option (b): the builder may run `git ls-files`. Pro: the brief copies the list's line. Con: a fourth reading command beside the rules file's three, and the builder's rule grows.
  - Industry: GitHub's Copilot cloud agent "cannot directly run `git push` or other Git commands" (https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations).
  - Recommendation: (a): it keeps the builder inside the rules file's reading commands and is the form the second run's briefs used. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:40` (D11 how a verify command that starts with git reaches a builder)
Builds on it: step 1

## C52. A builder's saved report passes the character-set check (2026-10-13)

The goal part "a builder's report saved into the ledger passes the character-set check". What exists now: `plan-orchestration` Steps 6 saves the report as the builder wrote it, and a report that quotes output with a tab fails the check on main (run finding 3 of the first run).
  - Option (a), recommended: the builder's prompt and the brief's report shape say the report is written in the rules file's character set, a character outside it in quoted output written by name, such as `<tab>` or `<em dash>`; the session runs the character-set check on the report it saves and fixes a hit in place by the same naming, without changing what the report says. Pro: the check holds whoever slips. Con: two sentences in two places.
  - Option (b): the session fixes the saved report alone. Pro: one sentence. Con: every report is fixed after the fact, and the builder's own quotes still carry the character.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a): the report is right when written and the save is checked. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:41` (D12 a builder's saved report passes the character-set check)
Builds on it: step 1

## C53. A repair round's brief reaches the builder in its worktree (2026-10-13)

The goal part "a repair round's brief reaches the builder in its worktree". What exists now: `plan-orchestration` Steps 8 commits the round's brief on main after the worktree was made, so the worktree holds no copy, and a builder read it from the main checkout (run finding 7 of the first run).
  - Option (a), recommended: before the resume the orchestrator copies the committed round's brief, and a cases ruling, into the worktree's copy of the ledger at the same path, and the message names that path. Pro: the worktree stays the builder's only place. Con: a copy step per round.
  - Option (b): the resume message carries the round's brief whole. Pro: no copy. Con: a long brief in a message, and the brief and the message can drift.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the worktree is the builder's only place to work. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:43` (D14 a repair round's brief reaches the builder in its worktree)
Builds on it: step 1

## C54. A reviewer's saved report passes the character-set check (2026-10-13)

The goal part "a reviewer's report saved into the ledger passes the character-set check". What exists now: `refute` Steps 7 saves the report as the reviewer wrote it, and a report that quoted an em dash failed the check on main (run finding 2 of the second run).
  - Option (a), recommended: `refute` Steps 6 has the reviewer write in the rules file's character set, a character outside it in a quote written by name, as D12 says for the builder; Steps 7 has the session check the saved report and fix a hit in place the same way. Pro: one rule for both reports. Con: two sentences.
  - Option (b): the session fixes the saved report alone. Pro: one sentence. Con: as D12 (b).
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), the same rule as D12. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:44` (D15 a reviewer's saved report passes the character-set check)
Builds on it: step 1

## C55. Who writes a reviewer's usage line (2026-10-13)

The goal part "the session writes a reviewer's usage line from the reviewer's completion notice, and the reviewer does not". What exists now: `refute` Steps 6 has the reviewer write its own usage line, and five of six reviewers of the second run wrote figures that differ from their notices (run finding 3 of the second run); `spec` "Steps / The brief check" 3 has the session fill the same line.
  - Option (a), recommended: `refute` Steps 6 drops the usage line from what the reviewer writes, and Steps 7 has the session fill the template's usage line from the completion notice, as `spec` does for the brief check. Pro: the figures are the runner's. Con: none.
  - Option (b): drop the part. Con: the wrong figures stay.
  - Industry: the Agent SDK's Agent tool result carries `totalToolUseCount`, `totalDurationMs` and `totalTokens`, and "Claude Code fills `usage` and `totalTokens` from the subagent's final API request" (https://code.claude.com/docs/en/agent-sdk/typescript), so the runner, not the model, holds the figures.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:45` (D16 who writes a reviewer's usage line)
Builds on it: step 1

## C56. How a closing step runs beside the other steps (2026-10-13)

The goal part "plan-orchestration says whether a closing step goes through /spec and takes a slot". What exists now: neither `plan-orchestration` nor `spec` says; both scratch runs ran their closings without `/spec` or a dispatch entry (run finding 5 of the second run).
  - Option (a), recommended: a closing step runs without `/spec` and without a dispatch entry, takes no slot of `workers_at_once`, starts only when every other step of its plan has landed, and makes its commits outside any landing. Pro: it states what both runs did, and a closing has no brief or worktree for `/spec` to make. Con: a closing does not show in the count of steps in flight.
  - Option (b): the closing goes through `/spec` and takes a slot. Pro: one path for every step. Con: `/spec` would write a brief and a worktree a closing does not use.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is none: both options are a sentence.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:46` (D17 how a closing step runs beside the other steps)
Builds on it: step 1

## C57. The builder's git rule (2026-10-13)

The goal part "the builder's git rule reads the same in plan-orchestration and in skills/repo-setup/templates/docs/dev/change-standard.md". What exists now: `plan-orchestration` Steps 4 says "The builder. It never runs a git command."; the template's "Where the work happens", and Ordo's own `docs/dev/change-standard.md`, allow reading with `git status`, `git diff` and `git show` (run finding 7 of the second run).
  - Option (a), recommended: `plan-orchestration` Steps 4 states the rules file's rule: the builder runs no git command that changes state, and reads only with `git status`, `git diff` and `git show`. Pro: the skill follows the rules file the user owns, and the three reading commands let a builder see its own diff. Con: none.
  - Option (b): both change standards say no git at all. Pro: the narrowest rule. Con: a change to the user's rules file and standards page, which only the user rules (kind 3).
  - Industry: GitHub's Copilot cloud agent "cannot directly run `git push` or other Git commands" (https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations); the page says nothing of reading commands.
  - Recommendation: (a): the rules file ranks it, since a brief and a skill never override the rules file. The lazy option is none.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:47` (D18 the builder's git rule)
Builds on it: step 1

## C59. Each changed skill's version raised (2026-10-13)

The goal part "each changed skill's version is raised as docs/dev/skill-layout.md says". What exists now: `docs/dev/skill-layout.md` "Frontmatter" sets one raise per plan. The part's text is the entry's own.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:49` (D20 each changed skill's version raised)
Builds on it: step 1

## C60. The gate's grep and fresh reviewer (2026-10-13)

The gate part "each fix's sentence is found in its file by grep -n -F of its text and read in place by a fresh reviewer agent against the proposal or finding it answers". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:50` (D21 the gate's grep and fresh reviewer)
Builds on it: step 1

## C61. The gate's deleted-file worktree run (2026-10-13)

The gate part "the character-set check of docs/dev/building.md, run in a worktree in which a tracked file was deleted, exits 0". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:52` (D23 the gate's deleted-file worktree run)
Builds on it: step 1

## C62. The gate's version check (2026-10-13)

The gate part "each changed skill's version read against docs/dev/skill-layout.md". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:53` (D24 the gate's version check)
Builds on it: step 1

## C63. The gate's checks.sh run (2026-10-13)

The gate part "sh skills/land/templates/checks.sh passes". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:54` (D25 the gate's checks.sh run)
Builds on it: step 1

## C64. The gate's land.test.sh case (2026-10-13)

The gate part "`sh skills/land/templates/land.test.sh 2>&1 | tail -1` prints a PASS: line, with a case in which a step adds a command to the verification page and that command's `$ <command>` line is in its landing's checks output". What exists now: the entry's gate holds it, and D13 (a) settles that the session brings the new command into the verify list before `land.sh` runs.
  - Option (a), recommended: keep the part, the case a step that adds a test script and its command to the page, whose landing output holds the command's `$ <command>` line. Pro: it checks the D13 part of the goal at the script the landing runs. Con: the case also passes on the unchanged script, since D13 (a) changes no script.
  - Option (b): drop the part. Con: the D13 part of the goal goes unchecked by any run.
  - Rule: the entry's gate, `docs/roadmap.md:25`.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:51` (D22 the gate's land.test.sh case)
Builds on it: step 1

## C65. The roadmap diff of entry 2.K (2026-10-13)

No answer of the interview changes the entry's goal, its gate or what it waits on; each settles how a part of the goal is done.
  - Option (a), recommended: no change to the entry. Pro: the entry stays the text the user approved. Con: none.
  - Option (b): write the decisions' detail into the goal. Con: the `roadmap` skill's Rules keep the entry to the goal, the gate and the dependencies, and the detail lives in the rulings.
  - Rule: the `roadmap` skill's Rules.
  - Recommendation: (a). The lazy option: none, since (a) leaves no work undone.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:55` (D26 the roadmap diff of entry 2.K)
Builds on it: the roadmap diff of entry 2.K, step 1

## C66. Record as ADR? (2026-10-13)

D13 refines ADR 0010's Consequences sentence; the other decisions are skill text.
  - Option (a), recommended: no new record; ADR 0010 is edited in place by the step that does D13. Pro: the ADR folder's README says a refinement that keeps the decision edits the ADR with no dated note. Con: none.
  - Option (b): a new record superseding ADR 0010. Con: the decision does not change, so a superseding record misstates it.
  - Rule: `docs/adr/README.md:5`.
  - Recommendation: (a). The lazy option: none, since the ADR edit is done in either case.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:56` (D27 record as ADR?)
Builds on it: step 1

## C67. The step list of plan 2.K as drafted (2026-10-13)

`/plan 2.K --self-rule` drafted two steps: step 1, every skill-text fix of the goal with the gate's checks as its check, and step 2, the closing. No fix needs another fix's landed result, and the content of each is known in advance from the rulings D1 to D27, so `/plan` Steps 2 makes them one step. Every answer of "## Gate" is no, no design decision is left unsettled after `/grill 2.K --self-rule`, and no line of the rulings file was left to place.
  - Option (a), recommended: open the plan with the list as drafted. Pro: the plan opens and step 1 can be prepared at once; one builder holds every fix, so the shared files (`plan-orchestration`, `land`, the change standards) are changed once and each skill's version is raised once. Con: one large step for one builder and one review.
  - Option (b): keep the draft for the user. Pro: the user sees the list before the plan opens. Con: the plan does not open, and nothing in the written rules needs the user's call here.
  - Rule: the `plan` skill's Steps 2 and 3.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:57` (Open item A)
Builds on it: step 1, step 2
