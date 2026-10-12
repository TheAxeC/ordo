Everything in the brief and in repair round 1 is done; the one point left for the orchestrator is whether step 1 already raised `refute`'s patch part (its version line stands at 3.0.1).

A line shortened with "..." is not verbatim.

## Open items of the state file

The state file's "Open items" section reads, verbatim:

- none.

## The cases, first read (on the tree before my edits)

1. Plan 5's step 2 in `/spec` while plan 5's step 3 waits on its brief check. Reading: the unchanged `/spec` counts only dispatch entries written at its Steps 9, so a step still preparing is invisible and `/spec` goes on. Finding: the case fails on the unchanged tree, as expected; closed by item 1 (entry written at the end of Steps 1, counted toward the limit).
2. The Paths-compare of Steps 5. Reading: the unchanged Steps 5 compares only with steps in flight in dispatch blocks, so a preparing step is not compared. Finding: fails on the unchanged tree; closed by the Steps 5 text that includes steps at `landing: preparing` whose brief is on disk.
3. Two preparing steps that share a file, and a brief check that changes the paths. Reading: no takeover rule and no recompare after the brief check. Finding: fails; closed by the recompare before the preparation commit (Steps 5, Steps 6).
4. A stop or a wait removes the entry. Reading: holds trivially on the unchanged tree, since no entry is written before Steps 9 ("A stop" 2). Finding: holds; with the entry now written at Steps 1, "A stop, a wait at Steps 5 and each refusal after the entry is written remove it" keeps it true.
5. A session handed over or compacted during a `/spec`. Reading: "Resuming" resolves only `cherry-picking` and `backed-out`; `/spec` refuses at its Steps 1. Finding: fails; closed by the two `landing: preparing` bullets in "Resuming" and `### A /spec taken over`.
6. A red line caused by an uncommitted ledger record of another step. Reading: `land` Steps 6 has no rule; `/spec` and `land` only leave another plan's record alone. Finding: fails; closed by the Steps 6 rule (record the session wrote is fixed in place; record it did not write takes the step back out of main with an open item that names the file). Case 6b (same plan, other step): the brief's phrase "as Steps 12 already says" is wrong, see the last part of this report.
7. A brief-check report arriving during a landing. Reading: `land` Rules say no other commit or skill until the landing commits, nothing on saving a report. Finding: fails; closed by the Rules sub-bullet "A brief-check report that arrives during a landing is saved after the landing's commit."
8. The position line of the closing step. Reading: "Reports" holds the step form and the PAUSED form only. Finding: fails; closed by the closing form with its four next-part bullets.
9. Steps 12 of `land` carrying a waiting `/spec`'s brief and report. Reading: Steps 12 carries all session-written ledger files of the plan, so it would carry them. Finding: fails; closed by the Steps 12 exception.

No case was wrong under the brief's own rules, so nothing was handed back.

## DONE / NOT DONE

| Item | State | Where |
| --- | --- | --- |
| 1. A step is in flight from the start of its `/spec` | DONE | `spec` intro, "What it reads" 3, Steps 1, 5, 6, 7, 9, back-out, "A stop", "The brief check" 1 and 5, Stops (rows "A step in flight", "A brief check still running", worktree row), Rules; `plan-orchestration` Steps 4 to 8, "Two steps in flight"; `land` Steps 2, 10, "What it reads" 3, Stops row; `ordo-help` Steps 3 and 4 and the `/spec refuses` line; `orchestrator-state.md` line 33; `diagnose` lines 43 to 50 and the "No dispatch entry" row; `self-rule.md` lines 151, 155, 161; glossary entries |
| 2. A `/spec` waiting on its brief check beside other skills | DONE | `spec` "The brief check" 1 and Steps 5, 6; `plan-orchestration` Step 5 of the loop and "Two steps in flight" (waiting-/spec bullet); `land` Rules sub-bullet |
| 3. The closing position line | DONE | `plan-orchestration` "Reports"; `plan-terms.md` position line; `orchestrator-state.md` line 68 |
| 4. Resuming for `landing: preparing` | DONE | `plan-orchestration` "Resuming"; `spec` `### A /spec taken over`; `ordo-help` Steps 3 and 4 |
| 5. The red line caused by an uncommitted ledger record | DONE | `land` Steps 6 and Steps 12; `spec` Steps 1 |
| 6. Versions | DONE, no version changes | see below |

Item 6: the part needs `spec` a major (step 1 raised it to 5.0.0, not above), `plan-orchestration` a major (5.0.0), `land` a major (3.0.0), `plan` a major from the template output (4.0.0), `repo-setup` at most a major for the `plan-terms.md` text (4.0.0), `ordo-help` a minor (3.1.0: it adds a printed case and extends a refusal line, removes no information), `diagnose` a patch (2.1.1: wording only, same refusal behaviour). Each is the version step 1 already set, so none is raised.

Checks and output as printed:

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
```

`grep -n 'preparing'` over the eight files, file:line list:

```
spec 39 44 74 100 118 199 201 289 294 298 301 400 471 472
plan-orchestration 250 252 310 319
land 35 129 141 221
orchestrator-state 33
ordo-help 54 58 99
diagnose 45 47 50 358
self-rule 151 153 161 167
plan-terms 37
```

`grep -n 'Plan step <m> of <m>: the closing'` over three files, one line each: `skills/repo-setup/templates/plan-terms.md:79`, `skills/plan-orchestration/SKILL.md:373`, `skills/plan/templates/orchestrator-state.md:68`.

`grep -n 'version:'` over the seven SKILL.md files and `refute`'s:

```
skills/spec/SKILL.md:5:  version: "5.0.0"
skills/plan-orchestration/SKILL.md:5:  version: "5.0.0"
skills/land/SKILL.md:5:  version: "3.0.0"
skills/diagnose/SKILL.md:5:  version: "2.1.1"
skills/ordo-help/SKILL.md:5:  version: "3.1.0"
skills/repo-setup/SKILL.md:5:  version: "4.0.0"
skills/plan/SKILL.md:5:  version: "4.0.0"
skills/refute/SKILL.md:5:  version: "3.0.1"
```

Character-set check, in the brief's own form (with `-CSD` and the `\x{2705}` exemption), over the nine changed files, `skills/plan/templates/plan.md`, `skills/refute/SKILL.md` and this report, as printed:

```
$ printf '%s\0' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-orchestration/references/self-rule.md skills/land/SKILL.md skills/plan/templates/orchestrator-state.md skills/ordo-help/SKILL.md skills/diagnose/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md skills/plan/templates/plan.md skills/refute/SKILL.md .scratch/2-i-several-plans-in-one-session/agents/reviews/3-report.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
```

Reading of lists and sentence lengths: every change is a bullet with one fact. Description lengths: diagnose 965, land 725, ordo-help 564, plan-orchestration 1018, spec 1003 characters, all within 1024. No double blank lines, no spaced-dash asides in the changed files. Departures: the bullets that stay longer than about 25 words each name a condition with its exception and would lose the exception if split: in `spec`, the Steps 1 list of own records, the takeover bullets of item 1, the Steps 5 wait bullet, "The brief check" 1 and 3 and the Stops row "A brief check still running"; in `plan-orchestration`, the Resuming bullets for `landing: preparing` and the Reports closing form; in `self-rule.md`, the two `preparing` bullets; in `land`, the Steps 6 red-line bullets and the Steps 6 back-out commit bullet; `diagnose` "What it reads" 3; the `orchestrator-state.md` "Next step" line.

## Terms

Glossary entries changed in `plan-terms.md` (synced into `docs/glossary.md` by `sync_rules.py . --write --only glossary`): dispatch entry, in flight, position line, handover, preparation commit, resume point, session. Terms the diff uses in a new place: `landing: preparing`, `running`, `base`, "waiting on its brief check", "taken over".

Each changed entry's "Stated in" checked with `grep -n` for the literal term in the named section:

- dispatch entry: holds in `spec` Steps 1, Steps 9, "The brief check" 1 and 5; `plan-orchestration` Steps 4, 6, 7, "Launching", "Resuming"; `land` Steps 2 and 6; `diagnose` "What it reads" 3; `ordo-help` Steps 3. `refute` Steps 1, Steps 7 and "Over a repair round" 6 now say "dispatch entry" (repair round 1, ruling 12), so the citations hold: `grep -n 'dispatch entry' skills/refute/SKILL.md` prints lines 57, 78 and 99.
- in flight: holds in `spec` "What it reads" 3 and Steps 1, `plan-orchestration` "Two steps in flight".
- position line: holds in `plan-orchestration` "Reports", `land` Steps 11, `orchestrator-state.md` "Current position" line 68.
- preparation commit, resume point, handover, session: hold in the sections they cite.

## Files of each named skill

- spec: `SKILL.md` changed. `templates/brief.md` and `templates/brief-check.md` read, unchanged, because they hold no statement about dispatch, landing, preparing or waiting.
- plan-orchestration: `SKILL.md` and `references/self-rule.md` changed. `templates/choices.md` read, unchanged, because it names none of the changed terms. `plan_cost.py` read, unchanged, because it reads Agents bullets of the form `brief check of step <n>`, which the takeover's bullet matches. `prices.txt` read, unchanged, because it is a price table.
- land: `SKILL.md` changed. `templates/land.sh`, `templates/checks.sh`, `templates/land.test.sh` read, unchanged, because `land.sh` does not read the dispatch block, the new rules are text-only, and `checks.sh` only runs the verify list.
- plan: `templates/orchestrator-state.md` changed. `SKILL.md` read, unchanged, because its empty dispatch block at Steps 4 and its closing description still hold. `templates/plan.md` changed in repair round 1 (ruling 7): its line 36 now lists the takeover's bullet of a dead brief-check agent and the bullet of a brief-check agent stopped under "The review of a choice". `plan.yaml` and `plan.projects.yaml` read, unchanged, because the `workers_at_once` comment is still true.
- ordo-help: `SKILL.md` changed.
- refute: `SKILL.md` changed in repair round 1 (ruling 12), three places. `templates/report.md` read, unchanged, because it names no dispatch key.
- diagnose: `SKILL.md` changed. `templates/diagnosis.md` read, unchanged, because it names no dispatch or landing value.
- repo-setup: `templates/plan-terms.md` changed. `SKILL.md`, the other templates (`CLAUDE.md`, `docs/*`, `gitignore/*`, `LICENSE-MIT`, `shared-rules.md`, `sync_rules.py`, `sync_rules.test.sh`) and `templates/docs/glossary.md` read, unchanged, because they hold none of the changed terms (the glossary template holds only the two plan-terms markers); the sync test passes. `README.md` read, unchanged, because its lines 18 and 38 are still true.

## Files and line counts (after, with before in parentheses)

`skills/spec/SKILL.md` 494 (434); `skills/plan-orchestration/SKILL.md` 482 (463); `skills/plan-orchestration/references/self-rule.md` 175 (169); `skills/land/SKILL.md` 260 (247); `skills/plan/templates/orchestrator-state.md` 69 (69); `skills/ordo-help/SKILL.md` 129 (126); `skills/diagnose/SKILL.md` 414 (413); `skills/repo-setup/templates/plan-terms.md` 134 (134); `docs/glossary.md` 151 (151, from the base); `skills/plan/templates/plan.md` 43 (43); `skills/refute/SKILL.md` 203 (203). Counts are `wc -l` output from this turn, except the before counts, which are the counts of the files before the step.

## Judgment calls

1. A refusal row "A brief check still running" in `spec` Stops (own entry at `preparing`, `brief_check` reading `"running: <agent id>"`, the agent still listed), so that a hand-typed `/spec` starts no second brief check. It serves items 1 and 4 and case 5.
2. `base: <hash>` is written into the `preparing` entry right after the preparation commit. A takeover reads it to tell whether the preparation commit exists, so it does not mistake an old committed brief of a backed-out step for this run's. Entry with no `base`: start at Steps 1. Entry with `base`: go on at Steps 7 after preflight, worktree and branch exempt from the refusal.
3. At a wait, `plan.md` is put back to the state without this run's premise corrections only, and other changes stay, because a landing may have booked into `plan.md` in the meantime (item 2, case 9).
4. The takeover writes the dead brief-check agent's Agents bullet, `- <agent id>: brief check of step <n>, <served model>`, and Steps 5 starts a fresh check, as ADR 0006 requires an agent to be recorded.
5. `land` "What it reads" 3 and the Stops row "No dispatch block" now cover an entry at `preparing`, which item 1 made necessary. `land` Steps 2 and `plan-orchestration` Steps 6 and 7 say "dispatch entry" where they said "dispatch block", so the glossary's "Stated in" literal check holds.
6. `land` Steps 12 carries `plan.md` and the state file as they are on disk, does not carry a waiting `/spec`'s brief and report, and does not carry a record Steps 6 fixed; the last is not a missed booking.
7. `self-rule.md` kind 4 (line 19) is unchanged because it is still true.

## Host and user visible changes, before and after

- `/spec` with the limit reached: before, it counted only steps with a dispatch entry written at Steps 9; after, a step is counted from the end of its Steps 1, shown with its `landing` value, and the refusal row "A step in flight" names the new remedy: the `/spec` of a step at `landing: preparing` stopped or waited and removed its entry.
- State file during a `/spec`: before, no entry until Steps 9; after, `step: <n>` and `landing: preparing` at Steps 1, `"running: <agent id>"` (quoted, valid YAML) in `brief_check` while the agent runs, `base` after the preparation commit, filled at Steps 9 and set to `not-started`.
- `/spec` run while its brief check still runs: before, nothing covered it; after, a refusal that names the agent.
- Resume: before, only `cherry-picking` and `backed-out` were resolved; after, `landing: preparing` is live (agent listed) and waited for, or interrupted and resolved by `/spec` again.
- Report of the closing step: before, the position line had only the step form and the PAUSED form; after, "Roadmap entry <n> (<title>). Plan step <m> of <m>: the closing. Next: <the closing's next part>." with four next-part values.
- `/land` red line from an uncommitted ledger record: before, no rule; after, fixed in place on disk when the session wrote it, counted and named in the booking with the path, not in the landing commit; when the session did not write it, the step goes back out of main and the open item names the file.
- `/ordo-help` prints a `landing: preparing` step as in `/spec`, with its base and its worktree once they are written, and names `/spec <entry> <step>` as the next command; its `/spec refuses` line carries the limit remedy and the brief-check-running case.
- `/diagnose` refuses on `landing: preparing` with wording for the entry; the behaviour is the same.
- Self-rule "review of a choice": before, a step at `preparing` had its text rewritten and its `/spec` run again; after, that step's `/spec` is ended first (the running brief-check agent stopped and its Agents bullet written, the uncommitted brief restored to main's copy or deleted, the worktree and branches removed after a preparation commit, the entry removed) and the `/spec` runs again from Steps 1.
- The preparation commit: before, the state file first reached main in the launch commit; after, the preparation commit carries the state file holding the step's `preparing` entry (with `brief_check: "running: <agent id>"` until Steps 9), and a landing commit of the same plan can carry another step's `preparing` entry (`spec` Steps 6, `land` Steps 12).
- `/land` of a step at `landing: preparing`: before, the step had no dispatch entry at that point and the refusal "No dispatch block" held; after, the same refusal holds for an entry at `landing: preparing`, whatever it names (`land` "What it reads" 3 and the Stops row).
- A wait at Steps 5 after the brief check: before, a wait came only before the brief check and no report could stand; after, the brief-check report stays on disk as one of the session's own records, the next resume point of its plan carries it, and the `/spec` run again of the step is not refused on it.
- The value of `brief_check` while the brief-check agent runs: before, `running: <agent id>` unquoted (invalid YAML); after, `"running: <agent id>"` quoted in every place that gives the form.

## Anything in the brief wrong or impossible

1. Item 5 and case 6b say a record of another step of the same plan waits "as Steps 12 already says". Steps 12 of the unchanged `land` carries every session-written ledger file of the plan, so such a record would be carried. I wrote the exception into Steps 12 (judgment call 6).
2. The ledger's own `plan.md` (not a path of this step) holds the same sentence on who writes Agents bullets as `skills/plan/templates/plan.md` line 36 did; it is the orchestrator's to bring in line.
3. Disclosure: once, by mistake, I ran `git status >/dev/null 2>&1`, a read-only command with its output discarded, against the rule that the builder runs no git command. It changed nothing.
4. A step taken back out of main because of a record the session did not write counts as that step's one return out of main (a consequence of the landing rules' return limit); noted only, no change.

## Repair round 1

Each ruling of `agents/briefs/3-round-1.md` by its number, with what changed.

1. A brief check that ends while its `/spec` waits. `spec` "Steps / The brief check" 3 gains two bullets: when the agent ends while the `/spec` waits, the session saves its final message at the report path from the completion notice and the `/spec` goes on to item 4; and a brief-check agent is dead only when the runner no longer lists it and no completion notice with its final message arrived. `plan-orchestration` "Resuming, and handing the plan over" gains a sub-bullet under the live-`/spec` bullet: the report is saved from the completion notice, the waiting `/spec` goes on, and the agent is never booked as dead, naming that section. "Steps / A `/spec` taken over" 1 gains a bullet: a finished agent whose report was not saved has it saved from its completion notice, is never booked as dead and is not run again; its dead-agent bullet applies only to an agent dead as item 3 says.
2. A wait at the second path comparison. `spec` Steps 1's list of the session's own records gains "the brief-check report that a wait of this step at Steps 5 left on disk"; the bullet on the report path names it beside the report of a `/spec` taken over; Steps 5's wait bullet says the next resume point of the plan carries that report.
3. The back-out commit. `land` Steps 6, the bullet "The commit also holds the other ledger records of this plan that the session wrote since the last one", now excepts the brief and the brief-check report of a `/spec` waiting on its brief check, with the pointer to `spec` "Steps / The brief check" 1. `spec` "Steps / A stop" 1 carries the same exception and pointer for the ledger files the stop commits.
4. A `preparing` entry with a base and a worktree. `ordo-help` Steps 3 prints such a step as in `/spec`, with its base and its worktree once they are written; `land` "What it reads" 3 refuses an entry at `landing: preparing`, whatever it names (its Stops row "No dispatch block" already refuses any such entry); `diagnose` "What it reads" 3 refuses, for a reviewer's finding or a red line, an entry at `landing: preparing`. `grep -n 'no worktree or base yet' skills/*/SKILL.md` and `grep -n 'names neither' skills/*/SKILL.md` print nothing.
5. "The review of a choice". `references/self-rule.md` now says a step of `Builds on it:` not yet prepared has its text rewritten and its `/spec` run again from Steps 1, and a step at `landing: preparing` has its `/spec` ended first, with five sub-bullets: the running brief-check agent stopped through the runner's stop tool with its Agents bullet written as for a stopped agent, the uncommitted brief restored to main's copy or deleted, the worktree and branches removed after a preparation commit as `land` "Removing a step's worktree" says, the entry removed, the committed brief left for the new `/spec` to write over.
6. The YAML form. The value is `brief_check: "running: <agent id>"` in `spec` Steps 1 (the bullet on a live brief check), "Steps / A `/spec` taken over", "Steps / The brief check" 1 and 5, the Stops row "A brief check still running"; in `plan-orchestration` "Resuming"; in `orchestrator-state.md` line 33; in `plan-terms.md` (dispatch entry), synced into `docs/glossary.md`. "What it reads" of `spec` does not give the form. The YAML check printed `yaml exit 0` (output below).
7. The template's list of who writes Agents bullets. `skills/plan/templates/plan.md` line 36 now reads that `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, and the orchestrator writes a brief-check agent it stopped under "The review of a choice".
8. The glossary's next parts. The entry **position line** in `plan-terms.md` reads "the roadmap diff of `/roadmap done <n>`, for the user's approval" and "the tag and the pin, for the user's approval, where the plan's rulings set them"; synced into `docs/glossary.md`.
9. The Stops row "A brief check still running". Its column "What resumes it" reads: the waiting `/spec` goes on when the agent ends; only a run interrupted after that is taken over by `/spec` again.
10. One rule in three places. The rule that only a waiting `/spec`'s preparation commit carries its brief and brief-check report stands in `spec` "Steps / The brief check" 1 alone. `spec` Steps 1 now has one bullet that names that section; the `spec` Rules bullet reads "A `/spec` waiting on its brief check is an exception to the two bullets above" with the pointer. The bullets of `plan-orchestration` (Steps 4, Steps 8, "Resuming", the `Resuming` closing sentence) and `land` Steps 12 keep the exception and a pointer to that section and no restatement of the rule.
11. Behaviour 1. "Host and user visible changes, before and after" has three more entries with before and after: the preparation commit carrying the `preparing` entry, `/land` refusing a step at `landing: preparing`, a wait at Steps 5 leaving the brief-check report on disk; two more entries cover the self-rule review of a choice and the quoted `brief_check` value.
12. `refute`. `skills/refute/SKILL.md` Steps 1, Steps 7 and "Over a repair round" 6 name "the step's dispatch entry" and its `reviewer_report`; "What it reads" 3 and "Over a repair round" 2 are unchanged. Version line as it stands: `skills/refute/SKILL.md:5:  version: "3.0.1"`. The change is wording only, a patch; the orchestrator checks at landing whether step 1 already raised its patch part.
13. The report's own points. The character-set check is quoted in the brief's form with its real file list (under "DONE / NOT DONE"); the glossary's line count is given as 151 before; the one read-only `git status` is stated under "Anything in the brief wrong or impossible", item 3.

Checks run again after the fixes:

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 -I -c 'import yaml; yaml.safe_load("dispatch:\n- step: 2\n  landing: preparing\n  brief_check: \"running: a6ce8870a2a7c0b32\"\n")'; echo "yaml exit $?"
yaml exit 0
$ grep -n 'version:' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/land/SKILL.md skills/plan/SKILL.md skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md skills/diagnose/SKILL.md skills/refute/SKILL.md
skills/spec/SKILL.md:5:  version: "5.0.0"
skills/plan-orchestration/SKILL.md:5:  version: "5.0.0"
skills/land/SKILL.md:5:  version: "3.0.0"
skills/plan/SKILL.md:5:  version: "4.0.0"
skills/ordo-help/SKILL.md:5:  version: "3.1.0"
skills/repo-setup/SKILL.md:5:  version: "4.0.0"
skills/diagnose/SKILL.md:5:  version: "2.1.1"
skills/refute/SKILL.md:5:  version: "3.0.1"
$ grep -n 'Plan step <m> of <m>: the closing' skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md skills/plan/templates/orchestrator-state.md | cut -c1-90
skills/plan-orchestration/SKILL.md:373:  - A plan whose step being worked is the closing t
skills/repo-setup/templates/plan-terms.md:79:- **position line**: the line of one plan tha
skills/plan/templates/orchestrator-state.md:68:- Next step: <n>, because <why it is next>;
$ grep -n 'no worktree or base yet\|names neither' skills/*/SKILL.md; echo "grep exit $?"
grep exit 1
$ grep -n 'dispatch entry' skills/refute/SKILL.md | cut -c1-70
57:   - The stopped reviewer is recorded under the `reviewer_report` o
78:   - It records the report's path under the `reviewer_report` field
99:   - It records the run in the same field of the step's dispatch en
$ grep -n 'running: ' skills/*/SKILL.md skills/*/templates/*.md docs/glossary.md | grep -v '"running: ' | cut -c1-100; echo "unquoted grep exit $?"
unquoted grep exit 0
```

The last command printed no line before its echo: no unquoted `running: ` stands in a skill, a template or the glossary.

`grep -n 'preparing'` over the eight files, file:line list: skills/spec/SKILL.md 39 44 74 100 118 199 201 289 294 298 301 400 471 472; skills/plan-orchestration/SKILL.md 250 252 310 319; skills/plan-orchestration/references/self-rule.md 151 153 161 167; skills/plan/templates/orchestrator-state.md 33; skills/ordo-help/SKILL.md 54 58 99; skills/diagnose/SKILL.md 45 47 50 358; skills/land/SKILL.md 35 129 141 221; skills/repo-setup/templates/plan-terms.md 37.
