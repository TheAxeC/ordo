Everything in the brief is done; two texts outside the step's paths (`skills/plan/templates/plan.md` line 36 and the `refute` skill's citations) need the orchestrator's ruling, items 3 and 4 of "Anything in the brief wrong or impossible".

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
spec 39 44 74 100 118 199 201 289 294 298 301 399 468 469
plan-orchestration 251 252 310 319
land 35 129 141 221
orchestrator-state 33
ordo-help 54 58 99
diagnose 45 47 50 358
self-rule 151 155 161
plan-terms 37
```

`grep -n 'Plan step <m> of <m>: the closing'` over three files, one line each: `skills/repo-setup/templates/plan-terms.md:79`, `skills/plan-orchestration/SKILL.md:373`, `skills/plan/templates/orchestrator-state.md:68`.

`grep -n 'version:'` over the seven SKILL.md files:

```
skills/spec/SKILL.md:5:  version: "5.0.0"
skills/plan-orchestration/SKILL.md:5:  version: "5.0.0"
skills/land/SKILL.md:5:  version: "3.0.0"
skills/diagnose/SKILL.md:5:  version: "2.1.1"
skills/ordo-help/SKILL.md:5:  version: "3.1.0"
skills/repo-setup/SKILL.md:5:  version: "4.0.0"
skills/plan/SKILL.md:5:  version: "4.0.0"
```

Character-set check: see the last line of this part, run after the report was written.

Character-set check over the nine changed files and this report (no tabs, nothing outside printable ASCII), as printed:

```
$ printf '%s\0' <the nine files and this report> | xargs -0 perl -ne 'print "$ARGV:$.: $_" if /[^\x20-\x7e\n]/'; echo "exit $?"
exit 0
```

Reading of lists and sentence lengths: every change is a bullet with one fact. Description lengths: diagnose 965, land 725, ordo-help 564, plan-orchestration 1018, spec 1003 characters, all within 1024. No double blank lines, no spaced-dash asides in the changed files. Departures: the bullets that stay longer than about 25 words each name a condition with its exception and would lose the exception if split: `spec` lines 74, 297, 300, 303, 394, 398, 401; `plan-orchestration` 128 (an existing 40-word sentence in which one word changed), 250, 251; `self-rule.md` 151 and 155 (28 words); `land` 79 (30); `diagnose` 45 (32); `orchestrator-state.md` 68 (35).

## Terms

Glossary entries changed in `plan-terms.md` (synced into `docs/glossary.md` by `sync_rules.py . --write --only glossary`): dispatch entry, in flight, position line, handover, preparation commit, resume point, session. Terms the diff uses in a new place: `landing: preparing`, `running`, `base`, "waiting on its brief check", "taken over".

Each changed entry's "Stated in" checked with `grep -n` for the literal term in the named section:

- dispatch entry: holds in `spec` Steps 1, Steps 9, "The brief check" 1 and 5; `plan-orchestration` Steps 4, 6, 7, "Launching", "Resuming"; `land` Steps 2 and 6; `diagnose` "What it reads" 3; `ordo-help` Steps 3. The citations of `refute` (Steps 1, Steps 7, "Over a repair round" 6) do not contain the literal "dispatch entry": `refute` says "dispatch block". That text is outside this step's paths, see below.
- in flight: holds in `spec` "What it reads" 3 and Steps 1, `plan-orchestration` "Two steps in flight".
- position line: holds in `plan-orchestration` "Reports", `land` Steps 11, `orchestrator-state.md` "Current position" line 68.
- preparation commit, resume point, handover, session: hold in the sections they cite.

## Files of each named skill

- spec: `SKILL.md` changed. `templates/brief.md` and `templates/brief-check.md` read, unchanged, because they hold no statement about dispatch, landing, preparing or waiting.
- plan-orchestration: `SKILL.md` and `references/self-rule.md` changed. `templates/choices.md` read, unchanged, because it names none of the changed terms. `plan_cost.py` read, unchanged, because it reads Agents bullets of the form `brief check of step <n>`, which the takeover's bullet matches. `prices.txt` read, unchanged, because it is a price table.
- land: `SKILL.md` changed. `templates/land.sh`, `templates/checks.sh`, `templates/land.test.sh` read, unchanged, because `land.sh` does not read the dispatch block, the new rules are text-only, and `checks.sh` only runs the verify list.
- plan: `templates/orchestrator-state.md` changed. `SKILL.md` read, unchanged, because its empty dispatch block at Steps 4 and its closing description still hold. `templates/plan.md` read, unchanged, because it is outside the step's paths; its line 36 is made incomplete, see the last part. `plan.yaml` and `plan.projects.yaml` read, unchanged, because the `workers_at_once` comment is still true.
- ordo-help: `SKILL.md` changed.
- diagnose: `SKILL.md` changed. `templates/diagnosis.md` read, unchanged, because it names no dispatch or landing value.
- repo-setup: `templates/plan-terms.md` changed. `SKILL.md`, the other templates (`CLAUDE.md`, `docs/*`, `gitignore/*`, `LICENSE-MIT`, `shared-rules.md`, `sync_rules.py`, `sync_rules.test.sh`) and `templates/docs/glossary.md` read, unchanged, because they hold none of the changed terms (the glossary template holds only the two plan-terms markers); the sync test passes. `README.md` read, unchanged, because its lines 18 and 38 are still true.

## Files and line counts (after, with before in parentheses)

`skills/spec/SKILL.md` 491 (434); `skills/plan-orchestration/SKILL.md` 482 (463); `skills/plan-orchestration/references/self-rule.md` 169 (169); `skills/land/SKILL.md` 260 (247); `skills/plan/templates/orchestrator-state.md` 69 (69); `skills/ordo-help/SKILL.md` 129 (126); `skills/diagnose/SKILL.md` 414 (413); `skills/repo-setup/templates/plan-terms.md` 134 (134); `docs/glossary.md` 151 (152). Counts are `wc -l` output; the after counts of the first three and `land` are from the run in this turn.

## Judgment calls

1. A refusal row "A brief check still running" in `spec` Stops (own entry at `preparing`, `brief_check` reading `running: <agent id>`, the agent still listed), so that a hand-typed `/spec` starts no second brief check. It serves items 1 and 4 and case 5.
2. `base: <hash>` is written into the `preparing` entry right after the preparation commit. A takeover reads it to tell whether the preparation commit exists, so it does not mistake an old committed brief of a backed-out step for this run's. Entry with no `base`: start at Steps 1. Entry with `base`: go on at Steps 7 after preflight, worktree and branch exempt from the refusal.
3. At a wait, `plan.md` is put back to the state without this run's premise corrections only, and other changes stay, because a landing may have booked into `plan.md` in the meantime (item 2, case 9).
4. The takeover writes the dead brief-check agent's Agents bullet, `- <agent id>: brief check of step <n>, <served model>`, and Steps 5 starts a fresh check, as ADR 0006 requires an agent to be recorded.
5. `land` "What it reads" 3 and the Stops row "No dispatch block" now cover an entry at `preparing`, which item 1 made necessary. `land` Steps 2 and `plan-orchestration` Steps 6 and 7 say "dispatch entry" where they said "dispatch block", so the glossary's "Stated in" literal check holds.
6. `land` Steps 12 carries `plan.md` and the state file as they are on disk, does not carry a waiting `/spec`'s brief and report, and does not carry a record Steps 6 fixed; the last is not a missed booking.
7. `self-rule.md` kind 4 (line 19) is unchanged because it is still true.

## Host and user visible changes, before and after

- `/spec` with the limit reached: before, it counted only steps with a dispatch entry written at Steps 9; after, a step is counted from the end of its Steps 1, shown with its `landing` value, and the refusal row "A step in flight" names the new remedy: the `/spec` of a step at `landing: preparing` stopped or waited and removed its entry.
- State file during a `/spec`: before, no entry until Steps 9; after, `step: <n>` and `landing: preparing` at Steps 1, `running: <agent id>` in `brief_check` while the agent runs, `base` after the preparation commit, filled at Steps 9 and set to `not-started`.
- `/spec` run while its brief check still runs: before, nothing covered it; after, a refusal that names the agent.
- Resume: before, only `cherry-picking` and `backed-out` were resolved; after, `landing: preparing` is live (agent listed) and waited for, or interrupted and resolved by `/spec` again.
- Report of the closing step: before, the position line had only the step form and the PAUSED form; after, "Roadmap entry <n> (<title>). Plan step <m> of <m>: the closing. Next: <the closing's next part>." with four next-part values.
- `/land` red line from an uncommitted ledger record: before, no rule; after, fixed in place on disk when the session wrote it, counted and named in the booking with the path, not in the landing commit; when the session did not write it, the step goes back out of main and the open item names the file.
- `/ordo-help` prints a `landing: preparing` step as in `/spec`, with no worktree or base yet, and names `/spec <entry> <step>` as the next command; its `/spec refuses` line carries the limit remedy and the brief-check-running case.
- `/diagnose` refuses on `landing: preparing` with wording for the entry; the behaviour is the same.
- Self-rule "review of a choice": a `preparing` step is not yet prepared, its text is rewritten and its `/spec` runs again.

## Anything in the brief wrong or impossible

1. Item 5 and case 6b say a record of another step of the same plan waits "as Steps 12 already says". Steps 12 of the unchanged `land` carries every session-written ledger file of the plan, so such a record would be carried. I wrote the exception into Steps 12 (judgment call 6).
2. `brief_check: running: <agent id>` as one line is not valid YAML (python yaml: "mapping values are not allowed here"; the quoted form parses). No skill or script parses the dispatch block, so I left the form as the brief dictates. The orchestrator can rule whether to write it quoted.
3. `skills/plan/templates/plan.md` line 36 lists who writes Agents bullets ("`/spec` writes a brief-check agent stopped for another model"). The takeover's dead-agent bullet makes the sentence incomplete. The file is outside this step's paths, so I did not change it. The same sentence stands in the ledger's own `plan.md` (not mine). The step needs `skills/plan/templates/plan.md` added to its paths.
4. `skills/refute/SKILL.md` says "dispatch block" in the places the glossary cites for "dispatch entry" (Steps 1, Steps 7, "Over a repair round" 6). The skill is outside the paths. Either `refute` joins the paths or the glossary drops those citations.
5. A step taken back out of main because of a record the session did not write counts as that step's one return out of main (a consequence of the landing rules' return limit); noted only, no change.
