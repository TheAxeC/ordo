Everything in the brief is done. The step was built inline by the orchestrating session in the main checkout, as the brief's Decision 1 says; the worktree `.agents/worktrees/2ea-5` is unchanged at its base 3c6119e.

## Open items of the state file, verbatim

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by the user's ruling; what is settled belongs in the closed list.

- Open item E (2026-10-01): `/grill` no longer accepts a "(self-rule)" quoted ruling as the user's answer to a roadmap diff, which ADR 0004's decision does not allow. Stop "A rule clash", from the review over step 6's repair round 1 (`agents/reviews/6-refuter.md`, "Repair round 1, refuted", Spec 4).
  - What the tree shows: ADR 0004 (proposed) decides "`/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)"." Step 6's round brief, item 7, asked that a "(self-rule)" quoted ruling settle its decisions as the orchestrator's choice and not be the user's answer to the roadmap diff, and the builder wrote that at `skills/grill/SKILL.md:76`, `:124` and `:336` in the worktree. So `/grill` accepts a "(the user)" quoted ruling's roadmap diff and refuses a "(self-rule)" one, where the ADR says it accepts both alike. The `roadmap` skill already refuses a "(self-rule)" quoted ruling (`references/self-rule.md`, "A skill with its own approval stop"), so the grill text agrees with what `/roadmap` does.
  - What it breaks: nothing in behaviour; the ADR and the skill text disagree, and a reader of the ADR expects `/grill` to write a roadmap diff from a self-rule bullet.
  - Options:
    - (a) ADR 0004's decision sentence is refined in place to "`/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)", except as the user's answer to a roadmap diff, which `/grill` leaves to the user as `/roadmap` does.", as the ADR folder's README allows for a refinement that keeps the decision; step 6 lands with that edit as a fix at landing. Pros: the roadmap, which is yours, never changes on a decision you did not make; the ADR then states what both `/grill` and `/roadmap` do. Cons: the ADR's "wherever" rule gains one exception a reader must know.
    - (b) A new ADR supersedes 0004 with the same sentence as (a). Pros: the change of the decision is a record of its own. Cons: a whole superseding record for one carve-out that keeps the decision, which the README reserves for a decision that changes.
    - (c) `/grill` goes back to accepting a "(self-rule)" quoted ruling as the answer to the roadmap diff, as the ADR says now: round brief item 7 is undone at landing. Pros: no ADR change. Cons: a decision the orchestrator took alone can rewrite a roadmap entry through `/grill`, while `/roadmap` itself refuses the same bullet.
  - Recommendation: (a), since it keeps the roadmap with you, matches `/roadmap`, and is the refinement the README says is edited in place. Lazy option: leave the ADR and the text as they are, which lands a contradiction.
  - Step 6 waits for the ruling, then lands with it and with the round's other findings (Spec 1 to 3, Standards 1 to 4) fixed at landing.


## The cases' first run, on the unchanged tree (main at 9bd9147)

1. `python3 skills/plan-orchestration/templates/plan_cost.py .scratch/archive/2-e-grill` printed `error: the ledger names no agent`, exit 1.
2. The same for `.scratch/2-f-diagnose`, `.scratch/2-g-git-guard` and `.scratch/2-h-session-retro`: `error: the ledger names no agent`, exit 1, each.
3. No file held a bullet: every count of the table was 0 against the bookings' counts, so the case failed for every booked step.
4. No bullet to match: failed.
5. No bullet for step 3: failed.
6. No numbered item: failed.
7. `grep -c '^## Agents'` printed 0 for the rulings file: failed.
8. `cat <five files> .scratch/2-e-a-self-rule/plan.md | grep -o '^- a[0-9a-f]*' | sort | uniq -d` printed nothing, since only 2.E.A's bullets existed; the planted-copy half could not run with no list to copy into.
9. No model in the files to compare: failed.
10. Of the 206 records of the window, only the 3 lookups of 2.E.A's `/grill` were in a ledger (2.E.A's `plan.md`): failed.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. `agent-roles.md` for plan 2.E | DONE | 78 bullets, 69 numbered items; case 1 below |
| 2. Agents sections of 2.F, 2.G, 2.H | DONE | 19, 15 and 17 bullets, 4 numbered items in 2.F; case 2 below |
| 3. Agents section of the rulings file | DONE | 3 bullets; case 7 |
| 4. No agent in two files, no agent of 2.E.A | DONE | case 8 and the 2.E.A id check below |
| Verify 1, the verify list | DONE | `checks: 11 commands passed` |
| Verify 2, cases 1 and 2 | DONE | each run exits 0 |
| Verify 3, cases 3 and 4 | DONE | table below, every row "yes" |
| Verify 4, cases 8, 9, 10 | DONE | outputs below |
| Verify 5, ASCII and tabs | DONE | outputs below |

### Verify 1

From the main checkout's root, after the files were written: `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` exited 0 and ended `checks: 11 commands passed`; its whole output is quoted under "Repair round 1", "The verify list, from the main checkout's root".

### Verify 2, cases 1 and 2 (the head of each run; the per-agent rows follow in the script's output)

```
$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/archive/2-e-grill
Plan 2.E grill: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                    20     1072   2174         7657349               0   173755974  254012     >=61.89
brief check                21      608   1216         3283877               0    71470326   17194     >=31.06
reviewer                   20      659   1318         3186019               0    76795510   32165     >=31.94
reviewer over a round      17      497    994         2226819               0    51199034   10594     >=21.59
Total                      78     2836   5702        16354064               0   373220844  313965    >=146.48

Agent              Role                               Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-f-diagnose
Plan 2.F diagnose: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     4      171    350         1507639               0    23136636   79910      >=9.20
brief check                 7      196    392         1444861               0    23574681    3450     >=12.01
reviewer                    4      110    220          717098               0    12782912    3025      >=6.20
reviewer over a round       4      102    204          637541               0    11881412    3452      >=5.63
Total                      19      579   1166         4307139               0    71375641   89837     >=33.04

Agent              Role                              Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-g-git-guard
Plan 2.G git guard: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     3      251    504         2296330               0    47712869   51448     >=15.80
brief check                 6      166    332          927568               0    18553612    4108      >=8.43
reviewer                    4      134    268         1261775               0    19958375   19697     >=10.70
reviewer over a round       2       52    104          442482               0     5271613    1281      >=3.29
Total                      15      603   1208         4928155               0    91496469   76534     >=38.22

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-h-session-retro
Plan 2.H session-retro: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     4      182    376         1365678               0    24385810   33806      >=8.63
brief check                 5      139    278          680958               0    13738395    1432      >=6.18
reviewer                    4      135    270          611758               0    14676422    2295      >=6.04
reviewer over a round       4      122    244          623475               0    14290428    9869      >=6.17
Total                      17      578   1168         3281869               0    67091055   47402     >=27.03

Agent              Role                              Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
```

Each run exits 0. The Total's Agents column equals the bullets of its file: 78 (2.E), 19 (2.F), 15 (2.G), 17 (2.H). The "No body" column is high and every cost is a lower bound (`>=`): the response bodies under `~/.claude/api-bodies` cover only the responses since the setting of ADR 0009 was turned on, after these plans ran.

### Verify 3, case 3 (and case 5)

"Booking" counts the agents of the role whose every completion notice's tokens and tool uses stand in the step's Usage line; "Unbooked, named" are the role's other agents of the file. A step with no booking is a step taken back out of main by the revert 8633553 (2.E's first run of 9a; 2.F 2a, 2b, 3a; 2.G 2a, 2b; 2.H 3a) or a stopped agent of a booked step (2.G step 1).

Plan 2.E
| Step | Role | Booking | Unbooked, named | File | Booking + unbooked = file |
|---|---|---|---|---|---|
| 1 | brief check | 1 | none | 1 | yes |
| 1 | builder | 1 | none | 1 | yes |
| 1 | reviewer | 1 | none | 1 | yes |
| 1 | reviewer over round 1 | 1 | none | 1 | yes |
| 2 | brief check | 1 | none | 1 | yes |
| 2 | builder | 1 | none | 1 | yes |
| 2 | reviewer | 1 | none | 1 | yes |
| 2 | reviewer over round 1 | 1 | none | 1 | yes |
| 4 | brief check | 1 | none | 1 | yes |
| 4 | builder | 1 | none | 1 | yes |
| 4 | reviewer | 1 | none | 1 | yes |
| 4 | reviewer over round 1 | 1 | none | 1 | yes |
| 5 | brief check | 1 | none | 1 | yes |
| 5 | builder | 1 | none | 1 | yes |
| 5 | reviewer | 1 | none | 1 | yes |
| 5 | reviewer over round 1 | 1 | none | 1 | yes |
| 3 | brief check | 1 | none | 1 | yes |
| 3 | builder | 3 | none | 3 | yes |
| 3 | reviewer | 3 | none | 3 | yes |
| 3 | reviewer over round 1 | 1 | none | 1 | yes |
| 6 | brief check | 1 | none | 1 | yes |
| 6 | builder | 1 | none | 1 | yes |
| 6 | reviewer | 1 | none | 1 | yes |
| 6 | reviewer over round 1 | 1 | none | 1 | yes |
| 7 | brief check | 1 | none | 1 | yes |
| 7 | builder | 1 | none | 1 | yes |
| 7 | reviewer | 1 | none | 1 | yes |
| 7 | reviewer over round 1 | 1 | none | 1 | yes |
| 8 | brief check | 1 | none | 1 | yes |
| 8 | builder | 1 | none | 1 | yes |
| 8 | reviewer | 1 | none | 1 | yes |
| 8 | reviewer over round 1 | 1 | none | 1 | yes |
| 9 | brief check | 1 | none | 1 | yes |
| 9 | builder | 1 | none | 1 | yes |
| 9 | reviewer | 1 | none | 1 | yes |
| 9 | reviewer over round 1 | 1 | none | 1 | yes |
| 10 | brief check | 1 | none | 1 | yes |
| 10 | builder | 1 | none | 1 | yes |
| 10 | reviewer | 1 | none | 1 | yes |
| 10 | reviewer over round 1 | 1 | none | 1 | yes |
| 11 | brief check | 1 | none | 1 | yes |
| 11 | builder | 1 | none | 1 | yes |
| 11 | reviewer | 1 | none | 1 | yes |
| 11 | reviewer over round 1 | 1 | none | 1 | yes |
| 12 | brief check | 1 | none | 1 | yes |
| 12 | builder | 1 | none | 1 | yes |
| 12 | reviewer | 1 | none | 1 | yes |
| 12 | reviewer over round 1 | 1 | none | 1 | yes |
| 12a | brief check | 1 | none | 1 | yes |
| 12a | builder | 1 | none | 1 | yes |
| 12a | reviewer | 1 | none | 1 | yes |
| 12a | reviewer over round 1 | 1 | none | 1 | yes |
| 9a | brief check | 1 | ac1981f7bc7d15672, a0efd11b092676656, a39b4380a345c407e, a51b44de3267fa2f1 | 5 | yes |
| 9a | builder | 1 | a931b2d1ac6c7e98d | 2 | yes |
| 9a | reviewer | 1 | a829573acbc0a1734 | 2 | yes |
| 9a | reviewer over round 1 | 1 | none | 1 | yes |
| 14a | brief check | 1 | none | 1 | yes |
| 14a | builder | 1 | none | 1 | yes |
| 14a | reviewer | 1 | none | 1 | yes |
| 14a | reviewer over round 1 | 1 | none | 1 | yes |
| 14b | brief check | 1 | none | 1 | yes |
| 14b | builder | 1 | none | 1 | yes |
| 14b | reviewer | 1 | none | 1 | yes |
| 14b | reviewer over round 1 | 1 | none | 1 | yes |
| 14c | brief check | 1 | none | 1 | yes |
| 14c | builder | 1 | none | 1 | yes |
| 14c | reviewer | 1 | none | 1 | yes |
| 14c | reviewer over round 1 | 1 | none | 1 | yes |

Plan 2.F
| Step | Role | Booking | Unbooked, named | File | Booking + unbooked = file |
|---|---|---|---|---|---|
| 1 | brief check | 1 | none | 1 | yes |
| 1 | builder | 1 | none | 1 | yes |
| 1 | reviewer | 1 | none | 1 | yes |
| 1 | reviewer over round 1 | 1 | none | 1 | yes |
| 2 | brief check | 1 | none | 1 | yes |
| 2 | builder | 1 | none | 1 | yes |
| 2 | reviewer | 1 | none | 1 | yes |
| 2 | reviewer over round 1 | 1 | none | 1 | yes |
| 2a | brief check | no booking | af6b9c9b5dd7db9e4 | 1 | yes |
| 2a | builder | no booking | aaf2a244958131899 | 1 | yes |
| 2a | reviewer | no booking | a737b44c11093528b | 1 | yes |
| 2a | reviewer over round 1 | no booking | a5d29dfd61d79bbfc | 1 | yes |
| 2b | brief check | no booking | ad9c2bb9acc3d0fed | 1 | yes |
| 2b | builder | no booking | a065164924d21655a | 1 | yes |
| 2b | reviewer | no booking | a56363ce0d37f4326 | 1 | yes |
| 2b | reviewer over round 1 | no booking | a04d091169687c8c9 | 1 | yes |
| 3a | brief check | no booking | ad56ca9da30d15e7e, a72228d39458b07f9, a49118f1317517195 | 3 | yes |

Plan 2.G
| Step | Role | Booking | Unbooked, named | File | Booking + unbooked = file |
|---|---|---|---|---|---|
| 1 | brief check | 1 | a87b610859b7caa16 | 2 | yes |
| 1 | builder | 1 | none | 1 | yes |
| 1 | reviewer | 1 | a1c460a174ddbb16c | 2 | yes |
| 1 | reviewer over round 1 | 1 | none | 1 | yes |
| 2 | brief check | 1 | none | 1 | yes |
| 2 | builder | 1 | none | 1 | yes |
| 2 | reviewer | 1 | none | 1 | yes |
| 2 | reviewer over round 1 | 1 | none | 1 | yes |
| 2a | brief check | no booking | a19f3b42d959e5119 | 1 | yes |
| 2b | brief check | no booking | a9b4dbe88a7879eb1, ab724e6a426ca4d22 | 2 | yes |
| 2b | builder | no booking | a64c3043b141e586e | 1 | yes |
| 2b | reviewer | no booking | a1b3ad4e9df60485a | 1 | yes |

Plan 2.H
| Step | Role | Booking | Unbooked, named | File | Booking + unbooked = file |
|---|---|---|---|---|---|
| 1 | brief check | 1 | none | 1 | yes |
| 1 | builder | 1 | none | 1 | yes |
| 1 | reviewer | 1 | none | 1 | yes |
| 1 | reviewer over round 1 | 1 | none | 1 | yes |
| 2 | brief check | 1 | none | 1 | yes |
| 2 | builder | 1 | none | 1 | yes |
| 2 | reviewer | 1 | none | 1 | yes |
| 2 | reviewer over round 1 | 1 | none | 1 | yes |
| 3 | brief check | 1 | none | 1 | yes |
| 3 | builder | 1 | none | 1 | yes |
| 3 | reviewer | 1 | none | 1 | yes |
| 3 | reviewer over round 1 | 1 | none | 1 | yes |
| 3a | brief check | no booking | aa1400dfd58c76810, a567381c0e52c792b | 2 | yes |
| 3a | builder | no booking | af9906813a8c54544 | 1 | yes |
| 3a | reviewer | no booking | a1e73ec4e4e8cf564 | 1 | yes |
| 3a | reviewer over round 1 | no booking | a423bdea6bbd17886 | 1 | yes |

Case 4: every bullet whose step has a booking matched its booking's figures, except the agents named in the table, each of which matches no booking figure (`python3` over `recs.json`, the records table, against each step's Usage line). Case 5: 2.E step 3 has 3 builders (a4e5bce8772d0d657, the Sonnet 5 trial afb733385e80a6b22, the Sonnet 5.5 trial ae2714d2e377ffba9) and 3 reviewers (a616958f65947f02b and the two trial reviewers a9101e85531b9f6e9 and af3f8a357a2c497f3), all booked by their figures.

### Verify 4

Case 8:

```
$ cat <the five files> .scratch/2-e-a-self-rule/plan.md | grep -o "^- a[0-9a-f]*" | sort | uniq -d
$ the same, with a9a57fb6f85b48b52 copied into the rulings file
- a9a57fb6f85b48b52
```

The first prints nothing; the run with the planted id prints that id. The whole runs, with the 2.E.A id check, are quoted under "Repair round 1", "Case 8, the 2.E.A ids, ASCII and tabs".

Case 9: a bash loop over the 205 bullets and numbered items of the five files read each id's transcript (`agent-<id>.jsonl`, or `<session id>.jsonl` for a `claude -p` session), took the `model` of most of its responses with `grep -o '"model":"claude[^"]*"' | sort | uniq -c | sort -rn | head -1`, and printed a line only on a difference: it printed none. No agent's transcript has two models other than `<synthetic>`.

Case 10: the window runs from 2.E's opening commit bc83a4d (2026-09-29T17:59:33Z) to 2.E.A's opening commit 9fc91dc (2026-09-30T22:31:16Z), after 2.E's closing 39ac671 (2026-09-30T21:39:21Z) and 2.H's last change 8633553 (2026-09-30T15:45:29Z). It holds 206 records: 179 subagent records under the three session folders and the scratchpad project folders, 26 `claude -p` sessions in scratchpad project folders, and one interactive session. 202 are in the five files, 3 are 2.E.A's `/grill` lookups in 2.E.A's `plan.md` (a508428b7705f46eb, af464f4a770b333a6, aea0212a318abe908), and 1 is no plan's: e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8, the interactive session (entrypoint `cli`) in the folder `-private-tmp-ordo-diagnose-3` that ran `/diagnose` for 2.F step 3, which 2.F's booking records as Axel's own session ("the session is Axel's ... no agent of the orchestrator ran", `.scratch/2-f-diagnose/plan.md`, step 3's booking).

### Verify 5

`LC_ALL=C grep -n '[^ -~]'` over the five files prints only the tick marks (U+2705) of the ticked step lines already in the three `plan.md` files (2.F lines 21-22, 2.G 19-20, 2.H 27-29); the same grep over the added lines (`git diff -U0 | grep '^+'` and the new file) prints nothing. Tab count 0 in each of the five files.

## Files

- `.scratch/archive/2-e-grill/agents/agent-roles.md`: new, 154 lines.
- `.scratch/2-f-diagnose/plan.md`: 130 lines, +33 (`## Agents` before `## Blocked, and by what`, its numbered list first and its bullets under "Agents in the roles the cost script prices:").
- `.scratch/2-g-git-guard/plan.md`: 94 lines, +20.
- `.scratch/2-h-session-retro/plan.md`: 117 lines, +22.
- `.scratch/rulings/3-the-writing-base.md`: 33 lines, +8.

## Agents placed by their prompt or the timeline, with the evidence

- Every unbooked priced agent's prompt names its plan, its step and its brief or worktree (`.scratch/2-e-grill/agents/briefs/9a.md`, `worktrees/2f-2a`, `.scratch/2-g-git-guard/agents/briefs/1.md` and so on); a51b44de3267fa2f1 ("Brief check 2.E 9a, fourth") names 2.F step 2b as well, and is placed by its description and its brief.
- The three `/grill 3` lookups: the parent session 3998c800 invoked `Skill grill 3` at 2026-09-30T16:55:43Z, started a2cd8be14d77ebe85 and a9d12b91117bb4165 at 16:58, and ac071af1b2da2bf66 at 17:27 after "round 2 of the interview goes out once a lookup agent comes back".
- 2.E step 3: the claude-code-guide a8b166abc8ac4a21f (19:24, "Subagent definition facts for effort", between step 5's last review and step 3's brief check); the `effort-probe-proj` sessions and their six subagents (19:28 to 19:42, agent types `probe-high`, `probe-xhigh`, `probe-max`); the two sessions in the 6266a558 scratchpad (19:59 and 21:16, "Reply with the word ok", served claude-sonnet-5-5, each just before a Sonnet trial build); `model-probe` with its two subagents (21:17); `verify7` with its `ordo-high` subagent (22:11, after step 3's review over round 1, before step 6's brief check).
- 2.E step 14b: the `probe` sessions (20:06 to 20:10, between 14b's brief check and its builder), the `r14b-judge-a` to `-e` sessions and the subagent ac00e4f3140387c2b (20:20 to 20:24, during 14b's review), and the `14b-probe-a` sessions (20:38 to 20:51, the landing's probe, "Checked by a probe from a scratch folder" in 14b's booking).
- 2.E step 14: judges 5 and 6 are the sessions c5eaa986-6efe-4ffc-a8f4-7fa8778affaa and 96f3dbfc-cfab-4281-8ca7-dfc5d6c49eba in `scratchpad-bc14r-judge-1` and `-judge-2`, the folders `14-blind-comparison.md` lines 529-530 name; the depth-2 agents by their `toolUseId` in the side's transcript.
- 2.E step 9a's seven scratch runs (items 22 to 28): subagent records of the parent session 3998c800, descriptions "9a scratch run 1 of roadmap" to "9a scratch run 7 of roadmap", started at 18:38:38Z (runs 1 to 5), 18:40:13Z (run 6) and 18:41:49Z (run 7) on 2026-09-30, while step 9a was being built and before its reverted run was booked.
- 2.E step 14's first-run sides (items 46 and 47): subagent records of 3998c800, descriptions "Step 14 comparison side 1" and "Step 14 comparison side 2", started at 18:39:12Z on 2026-09-30.
- 2.E step 14's first-run judges (items 54 to 57): subagent records of 3998c800, descriptions "Step 14 judge, first order" and "Step 14 judge, swapped order" (18:49:30Z), "Step 14 judge 3, first order" and "Step 14 judge 4, swapped order" (18:56:56Z), after the two sides.
- 2.E step 14's stopped rerun sides (items 58 and 59): subagent records of 3998c800, descriptions "Step 14 rerun, side 1" and "Step 14 rerun, side 2", started at 21:03:58Z; their last records are at 21:07:42Z and 21:07:10Z, the parent session's request was interrupted at 21:07:57Z, and the parent started the two booked rerun sides a2d1285df87e5583c and ad25c3abcf1869a03 with the same descriptions at 21:08:26Z and 21:08:31Z.
- 2.F step 4's sides and judges: by description ("Blind comparison side one" and so on) and time (13:41 to 13:50 on 2026-09-30), matching 1da8886 "Record the blind comparison of step 4 of plan 2.F".

## Records named as no plan's

- e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8: Axel's own interactive `/diagnose` session for 2.F step 3, as above.
- Before 2.E opened, in the design conversation of entry 2.E (the parent session 6266a558 between 16:30 and 17:42 on 2026-09-29, ending with "Rulings noted: E (b), F (a) and H (a)" and the rulings A to H written before `plan.md` existed), two agents whose prompt ties them to no step of 2.E: a5f748843ab789cc0 ("Audit Axel's requests against what was done", an audit of every request across the whole session) and ae64bcf0b2ed543b4 ("Count ruling-Y stops in 2.C and 2.D", the stops of plans 2.C and 2.D). The other three agents of that conversation are numbered items 1 to 3 of `agent-roles.md`, placed by their prompt.

## Judgment calls

- The agents of 2.E's design conversation are placed by the prompt test of item 1 ("when their prompt or time ties them to a step of 2.E"): a432f885c9164e19d (the game-engine design session, its design decisions shown to the user) to step 12, the `grill` skill; a87e3855655e33f19 (oculus's design rules and coding standards) to steps 4 and 5; ab9ea8af2b5f1b654 (the effort field of an agent definition) to step 3. Each item says "before the plan opened".
- The `claude -p` probe sessions of 2.E steps 3 and 14b (24 sessions: 8 of step 3, 16 of step 14b) are numbered items beside the probe subagents they started, since they are processes started for the step as judges 5 and 6 are; each carries its session id in place of an agent id.
- Step 14's two booked rerun sides (a2d1285df87e5583c, ad25c3abcf1869a03) are numbered items, as every side and judge is: no priced role names a side.
- Numbered items carry the served model of most responses; the two claude-code-guide agents ran on claude-haiku-4-5-20251001.

## Anything in the brief wrong or impossible

- "Every record under the three session folders" grew to 419 ordo records (409 under the main project folder, 10 in scratchpad folders) while the step ran; the window of case 10 fixes the set.
- None beyond the record count above.


## Repair round 1

Everything in the round's brief (`agents/briefs/5-round-1.md`) is done.

1. **Spec 1.** Before: `agent-roles.md` had 66 numbered items, and the report named ab9ea8af2b5f1b654, a432f885c9164e19d and a87e3855655e33f19 as no plan's by the time they started. After: the three are numbered items 1 to 3, each "before the plan opened" and tied by its prompt to step 3, steps 4 and 5, and step 12; the list has 69 items and the file 154 lines. a5f748843ab789cc0 and ae64bcf0b2ed543b4 stay named as no plan's, with the reason that their prompts tie them to no step of 2.E ("Records named as no plan's").
2. **Spec 2 and Proof 1.** The reading ran from scratch files in the session's scratchpad: `table.py` (the meta records, their transcripts' models and their completion notices; facts only), `assign.py` (the session's placements, typed by hand from the descriptions, prompts, figures and timeline), and for this round `case4.py`, `case9.sh` and `case10.py`, quoted whole below. None is in the repository. The placement of every bullet is under "Case 4 and the placement of each bullet" below; the placement of every numbered item is in "Agents placed by their prompt or the timeline" above, one line per group of items with its descriptions, times and parent session.
3. **Proof 2.** Before: "to 2.E.A's opening commit 9fc91dc ..., which holds 2.H's last booking", "27 `claude -p` sessions", "the `claude -p` session in `scratchpad-mp-ordo-diagnose-3`". After: the window's end is 9fc91dc, after 2.E's closing 39ac671 and 2.H's last change 8633553; 26 `claude -p` sessions and one interactive session; e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8 is the interactive session (entrypoint `cli`) in `-private-tmp-ordo-diagnose-3`.
4. **Behaviour.** Before: 2.F's Agents section held the paragraph, the bullets, then "Agents in no role the cost script prices:" and items 1 to 4, so a bullet `land` Steps 9 appends would stand under the unpriced line. After: the paragraph, "Agents in no role the cost script prices:" with items 1 to 4, then "Agents in the roles the cost script prices:" with the 19 bullets, so an appended bullet stands under the priced line. The paragraph is unchanged; `plan_cost.py` still reads 19 agents for 2.F.

### The verify list, from the main checkout's root

```
$ sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md
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
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
exit 0
```

### Cases 1 and 2, each run whole

```
$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/archive/2-e-grill
Plan 2.E grill: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                    20     1072   2174         7657349               0   173755974  254012     >=61.89
brief check                21      608   1216         3283877               0    71470326   17194     >=31.06
reviewer                   20      659   1318         3186019               0    76795510   32165     >=31.94
reviewer over a round      17      497    994         2226819               0    51199034   10594     >=21.59
Total                      78     2836   5702        16354064               0   373220844  313965    >=146.48

Agent              Role                               Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a7e2d8da2f7e6b429  builder of step 1                  claude-opus-5-5         18     38           75398               0     1238411    6331      >=0.75
aca77c40330700c5a  builder of step 2                  claude-opus-5-5         45     92          493753               0     6112981   14724      >=3.99
a4e5bce8772d0d657  builder of step 3                  claude-opus-5-5         89    178          760669               0    17725652   38276      >=8.11
ae2714d2e377ffba9  builder of step 3                  claude-sonnet-5-5       43     86          201805               0     5866628     358      >=1.68
afb733385e80a6b22  builder of step 3                  claude-sonnet-5        109    218          474356               0    25591809   88184      >=7.19
ab59f62dd9e66f9e7  builder of step 4                  claude-opus-5-5         25     52          185770               0     2214777   12471      >=1.62
a875f9d0a947f6cda  builder of step 5                  claude-opus-5-5         40     82          273934               0     4450005   25593      >=2.77
a298a7e61f0556c39  builder of step 6                  claude-sonnet-5-5       20     42          178312               0     1291734     323      >=0.71
aef5fa9f4f1c80805  builder of step 7                  claude-sonnet-5-5       31     64          309861               0     2980485     400      >=1.37
a645de77ce926447e  builder of step 8                  claude-sonnet-5-5       22     46          192796               0     1795691     602      >=0.85
adbcd73f19dbe7eae  builder of step 9                  claude-sonnet-5-5       20     42          200143               0     1621428     406      >=0.83
a931b2d1ac6c7e98d  builder of step 9a                 claude-sonnet-5-5      193    386         1168956               0    39830728    4711     >=10.94
a9e8d4ac4aea212dc  builder of step 9a                 claude-sonnet-5-5      133    266          868429               0    26225485    3246      >=7.45
ac9a7eb3cc16f546c  builder of step 10                 claude-sonnet-5-5       22     46          200858               0     1854208     406      >=0.88
ae449ee78f0bf9ddf  builder of step 11                 claude-sonnet-5-5       40     82          255896               0     4296913     548      >=1.50
af8ac1a436c7c2213  builder of step 12                 claude-sonnet-5-5       53    108          483194               0     8852404   29057      >=3.27
ac6b1b3f4e4cf034e  builder of step 12a                claude-sonnet-5-5       68    138          421880               0     9738730   11132      >=3.11
a75765a1669931042  builder of step 14a                claude-sonnet-5-5       33     68          372613               0     4485382   10264      >=1.93
a12869b0c03367f5b  builder of step 14b                claude-sonnet-5-5       24     50          225195               0     2180156    6466      >=1.06
a23f99bf273bb8deb  builder of step 14c                claude-sonnet-5-5       44     90          313531               0     5402367     514      >=1.87
a9a57fb6f85b48b52  brief check of step 1              claude-opus-5-5         13     26           79750               0      855648    1002      >=0.59
af96ee837d1adb7c7  brief check of step 2              claude-opus-5-5         21     42           91670               0     1539688    1444      >=0.80
a728eba74e934416e  brief check of step 3              claude-opus-5-5         32     64          153916               0     3199919    1953      >=1.45
a789dc55985f66723  brief check of step 4              claude-opus-5-5         24     48           93324               0     1809838    1498      >=0.86
a22ab0fbcb877745c  brief check of step 5              claude-opus-5-5         30     60          125655               0     2923728    1998      >=1.25
ad84caedae9698163  brief check of step 6              claude-opus-5-5         17     34          104603               0     1223424     370      >=0.78
a7007aa25798273ed  brief check of step 7              claude-opus-5-5         25     50           99602               0     1979101     227      >=0.90
af4721357ea684de7  brief check of step 8              claude-opus-5-5         23     46          106178               0     1990030     168      >=0.93
a699640613f47d817  brief check of step 9              claude-opus-5-5         34     68          102827               0     2716938     330      >=1.06
a0efd11b092676656  brief check of step 9a             claude-opus-5-5         34     68          262754               0     6277521     597      >=2.58
a20881af2c74bd1b8  brief check of step 9a             claude-opus-5-5         22     44          255187               0     3721659    1088      >=2.04
a39b4380a345c407e  brief check of step 9a             claude-opus-5-5         37     74          332061               0     8589579    1726      >=3.41
a51b44de3267fa2f1  brief check of step 9a             claude-opus-5-5         41     82          306467               0     7579401    2140      >=3.09
ac1981f7bc7d15672  brief check of step 9a             claude-opus-5-5         25     50          214097               0     3641958     425      >=1.81
a28e51aabff829bf9  brief check of step 10             claude-opus-5-5         21     42           93820               0     1593350     154      >=0.79
aeb2528252e557bc4  brief check of step 11             claude-opus-5-5         28     56          144794               0     3238923     219      >=1.38
aec1f452c11e139cf  brief check of step 12             claude-opus-5-5         51    102          180328               0     6470248     516      >=2.21
ae32aff2265c8e0b3  brief check of step 12a            claude-opus-5-5         23     46          124166               0     1907135     157      >=1.01
a1e387a9c8dd5a603  brief check of step 14a            claude-opus-5-5         36     72          165061               0     4088448     347      >=1.65
abb43dec216464426  brief check of step 14b            claude-opus-5-5         39     78          121891               0     3235818     338      >=1.26
ae2bc9c93a6368c8a  brief check of step 14c            claude-opus-5-5         32     64          125726               0     2887972     497      >=1.22
a8e14477c535e8fa7  reviewer of step 1                 claude-opus-5-5         18     36           90880               0     1398446    1270      >=0.76
aad960981c84ce993  reviewer of step 2                 claude-opus-5-5         30     60          129801               0     3054170    3794      >=1.34
a616958f65947f02b  reviewer of step 3                 claude-opus-5-5         32     64          178655               0     3927522    1987      >=1.72
a9101e85531b9f6e9  reviewer of step 3                 claude-opus-5-5         35     70          166015               0     3963538     584      >=1.63
af3f8a357a2c497f3  reviewer of step 3                 claude-opus-5-5         32     64          166948               0     3678811     397      >=1.58
a5c8dae5aa6c9ede4  reviewer of step 4                 claude-opus-5-5         20     40          103829               0     1564588    1296      >=0.86
abffc5023d497db11  reviewer of step 5                 claude-opus-5-5         24     48          131212               0     2332513   11092      >=1.34
a48841ec0c221192f  reviewer of step 6                 claude-opus-5-5         29     58          110376               0     2564599    1068      >=1.09
ab6e40dc47138ff5d  reviewer of step 7                 claude-opus-5-5         32     64          149903               0     3564580     461      >=1.47
a848bfe82e08a3ec9  reviewer of step 8                 claude-opus-5-5         24     48          105387               0     1948209     367      >=0.92
a3a8bfb51e9648236  reviewer of step 9                 claude-opus-5-5         29     58          147517               0     2923377     321      >=1.33
a24e51727b5e7824c  reviewer of step 9a                claude-opus-5-5         48     96          277254               0     8147747    1382      >=3.04
a829573acbc0a1734  reviewer of step 9a                claude-opus-5-5         35     70          318217               0     6569666    3370      >=2.97
abb5c887c9bdd2def  reviewer of step 10                claude-opus-5-5         34     68          133531               0     3390213    1112      >=1.37
ae9547ab20b63fbcf  reviewer of step 11                claude-opus-5-5         42     84          163243               0     5445300     961      >=1.92
a2d31217ca1dc30ac  reviewer of step 12                claude-opus-5-5         34     68          180434               0     4324738     443      >=1.78
a05acfd10a5295fde  reviewer of step 12a               claude-opus-5-5         40     80          162678               0     4436691     617      >=1.71
a129bf73e9c12ed81  reviewer of step 14a               claude-opus-5-5         42     84          178418               0     5004529     633      >=1.91
ac62ce4943bc04190  reviewer of step 14b               claude-opus-5-5         42     84          136105               0     4626274     405      >=1.61
a0dd6a3b93ed6d820  reviewer of step 14c               claude-opus-5-5         37     74          155616               0     3929999     605      >=1.58
a4a7cc6b81613559f  reviewer of step 1 over round 1    claude-opus-5-5         12     24           50772               0      598028     708      >=0.39
a0eb27e12f5d699cc  reviewer of step 2 over round 1    claude-opus-5-5         15     30           81888               0     1060973    1193      >=0.65
a3d58afa74ebc4e91  reviewer of step 3 over round 1    claude-opus-5-5         45     90          202353               0     5820992     935      >=2.20
a9c0655a40ba85f12  reviewer of step 4 over round 1    claude-opus-5-5         17     34           94884               0     1146420    1130      >=0.73
ae0092694ce1afb80  reviewer of step 5 over round 1    claude-opus-5-5         26     52           97616               0     1855760    1042      >=0.88
aeb0058246f011df3  reviewer of step 6 over round 1    claude-opus-5-5         19     38           98556               0     1478879     195      >=0.79
ac08d005e9158bb2c  reviewer of step 7 over round 1    claude-opus-5-5         33     66          156261               0     3787874     362      >=1.55
aea73ed60282cb9b8  reviewer of step 8 over round 1    claude-opus-5-5         23     46          127993               0     1980017     362      >=1.04
aabd9379789f88aa7  reviewer of step 9 over round 1    claude-opus-5-5         26     52          124370               0     2440017     251      >=1.12
afacbebdfc83a75a7  reviewer of step 9a over round 1   claude-opus-5-5         30     60          184760               0     3655282     466      >=1.66
a1737316019904bbd  reviewer of step 10 over round 1   claude-opus-5-5         25     50           93042               0     1948032     303      >=0.86
a3f572b6261f0ac53  reviewer of step 11 over round 1   claude-opus-5-5         37     74          146402               0     4238139     317      >=1.59
a8acf863141d60192  reviewer of step 12 over round 1   claude-opus-5-5         30     60          166151               0     3499169     521      >=1.54
abc32ab2475e25d69  reviewer of step 12a over round 1  claude-opus-5-5         33     66          139824               0     3664058     994      >=1.45
a8118738207170d54  reviewer of step 14a over round 1  claude-opus-5-5         41     82          177417               0     4795301     796      >=1.86
a4b8de56cd2a793b3  reviewer of step 14b over round 1  claude-opus-5-5         50    100          144405               0     5443123     519      >=1.82
a8d77d92940469860  reviewer of step 14c over round 1  claude-opus-5-5         35     70          140125               0     3786970     500      >=1.47
exit 0

$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-f-diagnose
Plan 2.F diagnose: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     4      171    350         1507639               0    23136636   79910      >=9.20
brief check                 7      196    392         1444861               0    23574681    3450     >=12.01
reviewer                    4      110    220          717098               0    12782912    3025      >=6.20
reviewer over a round       4      102    204          637541               0    11881412    3452      >=5.63
Total                      19      579   1166         4307139               0    71375641   89837     >=33.04

Agent              Role                              Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a3f22d22a0a9ce902  builder of step 1                 claude-sonnet-5-5       44     90          383885               0     5794967   14683      >=2.27
a92dbbab7da8946e3  builder of step 2                 claude-sonnet-5-5       36     74          325895               0     4087152     740      >=1.64
aaf2a244958131899  builder of step 2a                claude-sonnet-5-5       44     90          356384               0     5343707   35943      >=2.32
a065164924d21655a  builder of step 2b                claude-sonnet-5-5       47     96          441475               0     7910810   28544      >=2.97
ae8069985976682a1  brief check of step 1             claude-opus-5-5         38     76          118810               0     3562863     508      >=1.32
aa8ec600489819d0b  brief check of step 2             claude-opus-5-5         47     94          152173               0     5047779     371      >=1.78
af6b9c9b5dd7db9e4  brief check of step 2a            claude-opus-5-5         10     20          142883               0     1015228     334      >=0.92
ad9c2bb9acc3d0fed  brief check of step 2b            claude-opus-5-5         11     22          165964               0     1102805     790      >=1.07
a49118f1317517195  brief check of step 3a            claude-opus-5-5         37     74          228715               0     5669466     629      >=2.29
a72228d39458b07f9  brief check of step 3a            claude-opus-5-5         31     62          458807               0     4380347     637      >=3.18
ad56ca9da30d15e7e  brief check of step 3a            claude-opus-5-5         22     44          177509               0     2796193     181      >=1.45
af7e2a18c24b5e8b5  reviewer of step 1                claude-opus-5-5         37     74          165943               0     3931012     882      >=1.63
a6e2f8b6509bc4fd2  reviewer of step 2                claude-opus-5-5         40     80          164254               0     4912856    1268      >=1.83
a737b44c11093528b  reviewer of step 2a               claude-opus-5-5         17     34          164969               0     1801188     135      >=1.19
a56363ce0d37f4326  reviewer of step 2b               claude-opus-5-5         16     32          221932               0     2137856     740      >=1.55
a6d878965211568b3  reviewer of step 1 over round 1   claude-opus-5-5         34     68          168740               0     4067747     441      >=1.67
a45303ae9211bb147  reviewer of step 2 over round 1   claude-opus-5-5         29     58          106077               0     2655639     377      >=1.07
a5d29dfd61d79bbfc  reviewer of step 2a over round 1  claude-opus-5-5         13     26          139878               0     1449464    1473      >=1.02
a04d091169687c8c9  reviewer of step 2b over round 1  claude-opus-5-5         26     52          222846               0     3708562    1161      >=1.88
exit 0

$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-g-git-guard
Plan 2.G git guard: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     3      251    504         2296330               0    47712869   51448     >=15.80
brief check                 6      166    332          927568               0    18553612    4108      >=8.43
reviewer                    4      134    268         1261775               0    19958375   19697     >=10.70
reviewer over a round       2       52    104          442482               0     5271613    1281      >=3.29
Total                      15      603   1208         4928155               0    91496469   76534     >=38.22

Agent              Role                             Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a9bba431490a852e7  builder of step 1                claude-sonnet-5-5      108    216         1473476               0    24085950   36595      >=8.87
a609efe535711a48c  builder of step 2                claude-sonnet-5-5       21     44          168000               0     1560204    7046      >=0.80
a64c3043b141e586e  builder of step 2b               claude-sonnet-5-5      122    244          654854               0    22066715    7807      >=6.13
a1ff1a7de09f656b4  brief check of step 1            claude-opus-5-5         34     68          112543               0     3086748    2027      >=1.22
a87b610859b7caa16  brief check of step 1            claude-opus-5-5         18     36           98631               0     1201366     140      >=0.74
a8f74fb0fb6f2338b  brief check of step 2            claude-opus-5-5         48     96          145622               0     4766912     846      >=1.70
a19f3b42d959e5119  brief check of step 2a           claude-opus-5-5         15     30          173493               0     1890768     131      >=1.25
a9b4dbe88a7879eb1  brief check of step 2b           claude-opus-5-5         23     46          188582               0     3346420     636      >=1.63
ab724e6a426ca4d22  brief check of step 2b           claude-opus-5-5         28     56          208697               0     4261398     328      >=1.90
a1c460a174ddbb16c  reviewer of step 1               claude-opus-5-5         15     30          118886               0     1164790     258      >=0.83
a37c83404490fe650  reviewer of step 1               claude-opus-5-5         41     82          167768               0     5084004   15370      >=2.16
a26039d8e67ff072f  reviewer of step 2               claude-opus-5-5         23     46          105976               0     1995576     407      >=0.94
a1b3ad4e9df60485a  reviewer of step 2b              claude-opus-5-5         55    110          869145               0    11714005    3662      >=6.76
a75e0f9dff19d98cc  reviewer of step 1 over round 1  claude-opus-5-5         27     54          336816               0     3074470     934      >=2.32
a484a17ab43519cb0  reviewer of step 2 over round 1  claude-opus-5-5         25     50          105666               0     2197143     347      >=0.97
exit 0

$ python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-h-session-retro
Plan 2.H session-retro: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.
Response bodies from /Users/axelfaes/.claude/api-bodies.

Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     4      182    376         1365678               0    24385810   33806      >=8.63
brief check                 5      139    278          680958               0    13738395    1432      >=6.18
reviewer                    4      135    270          611758               0    14676422    2295      >=6.04
reviewer over a round       4      122    244          623475               0    14290428    9869      >=6.17
Total                      17      578   1168         3281869               0    67091055   47402     >=27.03

Agent              Role                              Model              No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
af66dae24a3304e3e  builder of step 1                 claude-sonnet-5-5       49    100          366672               0     6844300   25327      >=2.54
a27f84a753259fcf8  builder of step 2                 claude-sonnet-5-5       42     86          314286               0     5029207     744      >=1.80
a79c87e7558835577  builder of step 3                 claude-sonnet-5-5       33     72          223294               0     2882824     553      >=1.14
af9906813a8c54544  builder of step 3a                claude-sonnet-5-5       58    118          461426               0     9629479    7182      >=3.15
a6b3d05e2c122296a  brief check of step 1             claude-opus-5-5         39     78          110003               0     3390371     285      >=1.23
ae7b9370da9c638cf  brief check of step 2             claude-opus-5-5         30     60           95242               0     2496140     218      >=0.98
ae9fefd79737247b9  brief check of step 3             claude-opus-5-5         34     68          126343               0     3522022     300      >=1.34
a567381c0e52c792b  brief check of step 3a            claude-opus-5-5         17     34          182912               0     2029971     492      >=1.33
aa1400dfd58c76810  brief check of step 3a            claude-opus-5-5         19     38          166458               0     2299891     137      >=1.30
a6ceb87b4b1863638  reviewer of step 1                claude-opus-5-5         45     90          161845               0     5194336     445      >=1.86
a3970fbfab5ee34e0  reviewer of step 2                claude-opus-5-5         39     78          142884               0     3935131     497      >=1.51
ab77be5d56c360421  reviewer of step 3                claude-opus-5-5         34     68          119638               0     3287530     467      >=1.27
a1e73ec4e4e8cf564  reviewer of step 3a               claude-opus-5-5         17     34          187391               0     2259425     886      >=1.41
a3aff77b6281b67c2  reviewer of step 1 over round 1   claude-opus-5-5         37     74          161127               0     4211780    4880      >=1.75
a0081826dba130f95  reviewer of step 2 over round 1   claude-opus-5-5         43     86          186476               0     6000851    2823      >=2.19
a820569a1a43369fc  reviewer of step 3 over round 1   claude-opus-5-5         29     58          111492               0     2631841     383      >=1.09
a423bdea6bbd17886  reviewer of step 3a over round 1  claude-opus-5-5         13     26          164380               0     1445956    1783      >=1.15
exit 0
```

### Case 4 and the placement of each bullet

```
$ cat case4.py
# Case 4 and the placement list: for each bullet of the four plan files, the booking figure pairs that tie it, or the prompt words that place it.
import json,re,os,glob
R=os.path.expanduser('~/.claude/projects')
def notices(aid):
    out=[]
    for f in glob.glob(R+'/*ordo*/*.jsonl')+glob.glob(R+'/*ordo*/*/subagents/*.jsonl'):
        t=open(f).read()
        if aid+'</task-id>' not in t: continue
        for b in t.replace('\\n','\n').split('<task-notification>')[1:]:
            if '<task-id>'+aid+'</task-id>' in b:
                m=re.search(r'tokens>(\d+)<.*?tool_uses>(\d+)<',b,re.S)
                if m and m.groups() not in out: out.append(m.groups())
    return out
def prompt(aid):
    f=glob.glob(R+'/*/*/subagents/agent-%s.jsonl'%aid)[0]
    for l in open(f):
        d=json.loads(l)
        if d.get('type')=='user':
            c=d['message']['content']; return c if isinstance(c,str) else ' '.join(x.get('text','') for x in c if isinstance(x,dict))
for name,lf,pf in [('2.E','.scratch/archive/2-e-grill/agents/agent-roles.md','.scratch/archive/2-e-grill/plan.md'),('2.F','.scratch/2-f-diagnose/plan.md',None),('2.G','.scratch/2-g-git-guard/plan.md',None),('2.H','.scratch/2-h-session-retro/plan.md',None)]:
    plan=open(pf or lf).read()
    usage={m.group(1):[l for l in m.group(2).split('\n') if l.startswith('- Usage')] for m in re.finditer(r'(?m)^### Step (\w+),.*\n((?:(?!### ).*\n)*)',plan)}
    print('Plan',name)
    for aid,role,step in re.findall(r'(?m)^- (a[0-9a-f]{16}): ((?:.+?) of step (\w+)(?: over round 1)?), ',open(lf).read()):
        pairs=['%s tokens, %s tool uses'%p for p in notices(aid)]
        u=usage.get(step) or ['']
        if pairs and all(p in u[0] for p in pairs): print('- %s, %s: booked, %s'%(aid,role,'; '.join(pairs)))
        else:
            words=sorted(set(re.findall(r'(?:\.scratch/[\w./-]*?briefs/[\w.-]+\.md|worktrees/[\w-]+|(?:plan|of) 2\.[EFGH]\b|step \d+[a-c]?\b)',prompt(aid))))[:5]
            print('- %s, %s: not booked (%s); its prompt names %s'%(aid,role,'; '.join(pairs) or 'no completion notice with figures', ', '.join(words)))
$ python3 case4.py
Plan 2.E
- a9a57fb6f85b48b52, brief check of step 1: booked, 98196 tokens, 13 tool uses
- a7e2d8da2f7e6b429, builder of step 1: booked, 88121 tokens, 16 tool uses; 93569 tokens, 3 tool uses
- a8e14477c535e8fa7, reviewer of step 1: booked, 109566 tokens, 19 tool uses
- a4a7cc6b81613559f, reviewer of step 1 over round 1: booked, 68949 tokens, 11 tool uses
- af96ee837d1adb7c7, brief check of step 2: booked, 110579 tokens, 21 tool uses
- aca77c40330700c5a, builder of step 2: booked, 193038 tokens, 37 tool uses; 206243 tokens, 8 tool uses
- aad960981c84ce993, reviewer of step 2: booked, 148659 tokens, 32 tool uses
- a0eb27e12f5d699cc, reviewer of step 2 over round 1: booked, 102774 tokens, 18 tool uses
- a789dc55985f66723, brief check of step 4: booked, 112374 tokens, 25 tool uses
- ab59f62dd9e66f9e7, builder of step 4: booked, 96874 tokens, 14 tool uses; 131510 tokens, 12 tool uses
- a5c8dae5aa6c9ede4, reviewer of step 4: booked, 122792 tokens, 20 tool uses
- a9c0655a40ba85f12, reviewer of step 4 over round 1: booked, 113579 tokens, 19 tool uses
- a22ab0fbcb877745c, brief check of step 5: booked, 144932 tokens, 33 tool uses
- a875f9d0a947f6cda, builder of step 5: booked, 142808 tokens, 33 tool uses; 176911 tokens, 13 tool uses
- abffc5023d497db11, reviewer of step 5: booked, 150395 tokens, 34 tool uses
- ae0092694ce1afb80, reviewer of step 5 over round 1: booked, 116266 tokens, 25 tool uses
- a728eba74e934416e, brief check of step 3: booked, 173243 tokens, 33 tool uses
- a4e5bce8772d0d657, builder of step 3: booked, 270520 tokens, 83 tool uses; 319642 tokens, 28 tool uses
- afb733385e80a6b22, builder of step 3: booked, 322209 tokens, 118 tool uses
- ae2714d2e377ffba9, builder of step 3: booked, 205260 tokens, 47 tool uses
- a616958f65947f02b, reviewer of step 3: booked, 197731 tokens, 33 tool uses
- a9101e85531b9f6e9, reviewer of step 3: booked, 175588 tokens, 37 tool uses
- af3f8a357a2c497f3, reviewer of step 3: booked, 177523 tokens, 38 tool uses
- a3d58afa74ebc4e91, reviewer of step 3 over round 1: booked, 208385 tokens, 51 tool uses
- ad84caedae9698163, brief check of step 6: booked, 112737 tokens, 21 tool uses
- a298a7e61f0556c39, builder of step 6: booked, 79172 tokens, 14 tool uses; 101447 tokens, 8 tool uses
- a48841ec0c221192f, reviewer of step 6: booked, 135966 tokens, 32 tool uses
- aeb0058246f011df3, reviewer of step 6 over round 1: booked, 123555 tokens, 20 tool uses
- a7007aa25798273ed, brief check of step 7: booked, 124603 tokens, 25 tool uses
- aef5fa9f4f1c80805, builder of step 7: booked, 145032 tokens, 27 tool uses; 168713 tokens, 7 tool uses
- ab6e40dc47138ff5d, reviewer of step 7: booked, 175635 tokens, 33 tool uses
- ac08d005e9158bb2c, reviewer of step 7 over round 1: booked, 179912 tokens, 37 tool uses
- af4721357ea684de7, brief check of step 8: booked, 133639 tokens, 25 tool uses
- a645de77ce926447e, builder of step 8: booked, 103483 tokens, 15 tool uses; 130028 tokens, 8 tool uses
- a848bfe82e08a3ec9, reviewer of step 8: booked, 129512 tokens, 25 tool uses
- aea73ed60282cb9b8, reviewer of step 8 over round 1: booked, 153339 tokens, 25 tool uses
- a699640613f47d817, brief check of step 9: booked, 129625 tokens, 36 tool uses
- adbcd73f19dbe7eae, builder of step 9: booked, 103880 tokens, 16 tool uses; 136520 tokens, 8 tool uses
- a3a8bfb51e9648236, reviewer of step 9: booked, 155862 tokens, 31 tool uses
- aabd9379789f88aa7, reviewer of step 9 over round 1: booked, 150149 tokens, 27 tool uses
- a28e51aabff829bf9, brief check of step 10: booked, 119927 tokens, 24 tool uses
- ac9a7eb3cc16f546c, builder of step 10: booked, 114615 tokens, 19 tool uses; 123972 tokens, 6 tool uses
- abb5c887c9bdd2def, reviewer of step 10: booked, 157759 tokens, 35 tool uses
- a1737316019904bbd, reviewer of step 10 over round 1: booked, 116342 tokens, 27 tool uses
- aeb2528252e557bc4, brief check of step 11: booked, 172226 tokens, 33 tool uses
- ae449ee78f0bf9ddf, builder of step 11: booked, 128707 tokens, 30 tool uses; 165797 tokens, 14 tool uses
- ae9547ab20b63fbcf, reviewer of step 11: booked, 190050 tokens, 44 tool uses
- a3f572b6261f0ac53, reviewer of step 11 over round 1: booked, 171290 tokens, 38 tool uses
- aec1f452c11e139cf, brief check of step 12: booked, 192474 tokens, 54 tool uses
- af8ac1a436c7c2213, builder of step 12: booked, 223659 tokens, 53 tool uses; 263668 tokens, 15 tool uses
- a2d31217ca1dc30ac, reviewer of step 12: booked, 193419 tokens, 42 tool uses
- a8acf863141d60192, reviewer of step 12 over round 1: booked, 178724 tokens, 34 tool uses
- ae32aff2265c8e0b3, brief check of step 12a: booked, 132593 tokens, 26 tool uses
- ac6b1b3f4e4cf034e, builder of step 12a: booked, 186727 tokens, 57 tool uses; 240625 tokens, 22 tool uses
- a05acfd10a5295fde, reviewer of step 12a: booked, 174560 tokens, 41 tool uses
- abc32ab2475e25d69, reviewer of step 12a over round 1: booked, 170576 tokens, 38 tool uses
- ac1981f7bc7d15672, brief check of step 9a: not booked (231093 tokens, 34 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, plan 2.E, step 9a
- a0efd11b092676656, brief check of step 9a: not booked (301182 tokens, 46 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, plan 2.E, step 9a
- a39b4380a345c407e, brief check of step 9a: not booked (365066 tokens, 53 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, plan 2.E, step 9a
- a51b44de3267fa2f1, brief check of step 9a: not booked (318017 tokens, 55 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, plan 2.E, plan 2.F, plan 2.G, step 2b
- a20881af2c74bd1b8, brief check of step 9a: booked, 258965 tokens, 34 tool uses
- a931b2d1ac6c7e98d, builder of step 9a: not booked (48769 tokens, 190 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, plan 2.E, plan 2.G, step 2b, step 9a
- a9e8d4ac4aea212dc, builder of step 9a: booked, 243201 tokens, 132 tool uses; 288483 tokens, 14 tool uses
- a829573acbc0a1734, reviewer of step 9a: not booked (344198 tokens, 49 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, plan 2.E, step 9a, worktrees/2e-9a
- a24e51727b5e7824c, reviewer of step 9a: booked, 291216 tokens, 54 tool uses
- afacbebdfc83a75a7, reviewer of step 9a over round 1: booked, 193193 tokens, 33 tool uses
- a1e387a9c8dd5a603, brief check of step 14a: booked, 176162 tokens, 40 tool uses
- a75765a1669931042, builder of step 14a: booked, 171803 tokens, 33 tool uses; 202604 tokens, 10 tool uses
- a129bf73e9c12ed81, reviewer of step 14a: booked, 186088 tokens, 46 tool uses
- a8118738207170d54, reviewer of step 14a over round 1: booked, 191514 tokens, 42 tool uses
- abb43dec216464426, brief check of step 14b: booked, 129145 tokens, 43 tool uses
- a12869b0c03367f5b, builder of step 14b: booked, 112867 tokens, 22 tool uses; 130940 tokens, 7 tool uses
- ac62ce4943bc04190, reviewer of step 14b: booked, 170820 tokens, 50 tool uses
- a4b8de56cd2a793b3, reviewer of step 14b over round 1: booked, 172870 tokens, 51 tool uses
- ae2bc9c93a6368c8a, brief check of step 14c: booked, 153480 tokens, 34 tool uses
- a23f99bf273bb8deb, builder of step 14c: booked, 142904 tokens, 35 tool uses; 189621 tokens, 15 tool uses
- a0dd6a3b93ed6d820, reviewer of step 14c: booked, 187381 tokens, 39 tool uses
- a8d77d92940469860, reviewer of step 14c over round 1: booked, 169016 tokens, 36 tool uses
Plan 2.F
- ae8069985976682a1, brief check of step 1: booked, 148959 tokens, 40 tool uses
- a3f22d22a0a9ce902, builder of step 1: booked, 163309 tokens, 36 tool uses; 227963 tokens, 15 tool uses
- af7e2a18c24b5e8b5, reviewer of step 1: booked, 179275 tokens, 39 tool uses
- a6d878965211568b3, reviewer of step 1 over round 1: booked, 199800 tokens, 37 tool uses
- aa8ec600489819d0b, brief check of step 2: booked, 163352 tokens, 49 tool uses
- a92dbbab7da8946e3, builder of step 2: booked, 156026 tokens, 35 tool uses; 173400 tokens, 6 tool uses
- a6e2f8b6509bc4fd2, reviewer of step 2: booked, 188649 tokens, 42 tool uses
- a45303ae9211bb147, reviewer of step 2 over round 1: booked, 129069 tokens, 34 tool uses
- af6b9c9b5dd7db9e4, brief check of step 2a: not booked (170502 tokens, 19 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2a.md, plan 2.F, step 2a
- aaf2a244958131899, builder of step 2a: not booked (161787 tokens, 37 tool uses; 209610 tokens, 12 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2a.md, plan 2.F, step 2a, worktrees/2f-2a
- a737b44c11093528b, reviewer of step 2a: not booked (173973 tokens, 26 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2a.md, plan 2.F, step 2a, worktrees/2f-2a
- a5d29dfd61d79bbfc, reviewer of step 2a over round 1: not booked (165136 tokens, 25 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2a-round-1.md, .scratch/2-f-diagnose/agents/briefs/2a.md, plan 2.F, step 2a, worktrees/2f-2a
- ad9c2bb9acc3d0fed, brief check of step 2b: not booked (196736 tokens, 21 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2b.md, plan 2.F, step 2b
- a065164924d21655a, builder of step 2b: not booked (211125 tokens, 33 tool uses; 291176 tokens, 24 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2b.md, plan 2.F, step 2b, worktrees/2f-2b
- a56363ce0d37f4326, reviewer of step 2b: not booked (246779 tokens, 29 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2b.md, plan 2.F, step 2b, worktrees/2f-2b
- a04d091169687c8c9, reviewer of step 2b over round 1: not booked (230709 tokens, 34 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/2b-round-1.md, .scratch/2-f-diagnose/agents/briefs/2b.md, plan 2.F, step 2b, worktrees/2f-2b
- ad56ca9da30d15e7e, brief check of step 3a: not booked (203037 tokens, 29 tool uses); its prompt names .scratch/2-e-grill/agents/briefs/9a.md, .scratch/2-f-diagnose/agents/briefs/3a.md, .scratch/2-g-git-guard/agents/briefs/2b.md, plan 2.F, step 3a
- a72228d39458b07f9, brief check of step 3a: not booked (260910 tokens, 38 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/3a.md, plan 2.F, step 3a
- a49118f1317517195, brief check of step 3a: not booked (260506 tokens, 44 tool uses); its prompt names .scratch/2-f-diagnose/agents/briefs/3a.md, plan 2.F, step 3a
Plan 2.G
- a87b610859b7caa16, brief check of step 1: not booked (no completion notice with figures); its prompt names .scratch/2-g-git-guard/agents/briefs/1.md, plan 2.G, step 1
- a1ff1a7de09f656b4, brief check of step 1: booked, 139503 tokens, 37 tool uses
- a9bba431490a852e7, builder of step 1: booked, 237370 tokens, 45 tool uses; 89033 tokens, 71 tool uses
- a1c460a174ddbb16c, reviewer of step 1: not booked (no completion notice with figures); its prompt names .scratch/2-g-git-guard/agents/briefs/1.md, plan 2.G, step 1, worktrees/2g-1
- a37c83404490fe650, reviewer of step 1: booked, 173997 tokens, 42 tool uses
- a75e0f9dff19d98cc, reviewer of step 1 over round 1: booked, 184214 tokens, 40 tool uses
- a8f74fb0fb6f2338b, brief check of step 2: booked, 156313 tokens, 51 tool uses
- a609efe535711a48c, builder of step 2: booked, 94135 tokens, 21 tool uses; 110514 tokens, 5 tool uses
- a26039d8e67ff072f, reviewer of step 2: booked, 130146 tokens, 26 tool uses
- a484a17ab43519cb0, reviewer of step 2 over round 1: booked, 128025 tokens, 29 tool uses
- a19f3b42d959e5119, brief check of step 2a: not booked (203167 tokens, 25 tool uses); its prompt names .scratch/2-g-git-guard/agents/briefs/2a.md, plan 2.G, step 2a
- a9b4dbe88a7879eb1, brief check of step 2b: not booked (219616 tokens, 29 tool uses); its prompt names .scratch/2-g-git-guard/agents/briefs/2b.md, plan 2.G, step 2b
- ab724e6a426ca4d22, brief check of step 2b: not booked (237113 tokens, 39 tool uses); its prompt names .scratch/2-g-git-guard/agents/briefs/2b.md, plan 2.G, step 2b
- a64c3043b141e586e, builder of step 2b: not booked (390587 tokens, 99 tool uses); its prompt names .scratch/2-g-git-guard/agents/briefs/2b.md, plan 2.G, step 2b, worktrees/2g-2b
- a1b3ad4e9df60485a, reviewer of step 2b: not booked (321512 tokens, 66 tool uses); its prompt names .scratch/2-g-git-guard/agents/briefs/2b.md, plan 2.G, step 2b, worktrees/2g-2b
Plan 2.H
- a6b3d05e2c122296a, brief check of step 1: booked, 143089 tokens, 40 tool uses
- af66dae24a3304e3e, builder of step 1: booked, 151005 tokens, 32 tool uses; 221569 tokens, 19 tool uses
- a6ceb87b4b1863638, reviewer of step 1: booked, 172806 tokens, 47 tool uses
- a3aff77b6281b67c2, reviewer of step 1 over round 1: booked, 168731 tokens, 40 tool uses
- ae7b9370da9c638cf, brief check of step 2: booked, 120502 tokens, 33 tool uses
- a27f84a753259fcf8, builder of step 2: booked, 163696 tokens, 39 tool uses; 188618 tokens, 12 tool uses
- a3970fbfab5ee34e0, reviewer of step 2: booked, 147982 tokens, 42 tool uses
- a0081826dba130f95, reviewer of step 2 over round 1: booked, 211393 tokens, 57 tool uses
- ae9fefd79737247b9, brief check of step 3: booked, 150427 tokens, 35 tool uses
- a79c87e7558835577, builder of step 3: booked, 83850 tokens, 13 tool uses; 91819 tokens, 20 tool uses; 117739 tokens, 34 tool uses; 124996 tokens, 5 tool uses
- ab77be5d56c360421, reviewer of step 3: booked, 142223 tokens, 36 tool uses
- a820569a1a43369fc, reviewer of step 3 over round 1: booked, 135543 tokens, 29 tool uses
- aa1400dfd58c76810, brief check of step 3a: not booked (195356 tokens, 30 tool uses); its prompt names .scratch/2-h-session-retro/agents/briefs/3a.md, plan 2.H, step 3a
- a567381c0e52c792b, brief check of step 3a: not booked (195649 tokens, 27 tool uses); its prompt names .scratch/2-h-session-retro/agents/briefs/3a.md, plan 2.H, step 3a
- af9906813a8c54544, builder of step 3a: not booked (202711 tokens, 50 tool uses; 277139 tokens, 24 tool uses); its prompt names .scratch/2-h-session-retro/agents/briefs/3a.md, plan 2.H, step 3a, worktrees/2h-3a
- a1e73ec4e4e8cf564, reviewer of step 3a: not booked (210664 tokens, 31 tool uses); its prompt names .scratch/2-h-session-retro/agents/briefs/3a.md, plan 2.H, step 3a, worktrees/2h-3a
- a423bdea6bbd17886, reviewer of step 3a over round 1: not booked (188651 tokens, 32 tool uses); its prompt names plan 2.H, step 3a, worktrees/2h-3a
```

"booked" lists the completion notices' figure pairs, each found in the step's Usage line; "not booked" lists the figures that no Usage line holds and the plan, step and brief or worktree the agent's prompt names.

### Case 8, the 2.E.A ids, ASCII and tabs

Run at landing, in bash from the main checkout's root, with the five files in `F`:

```
$ cat <the five files> .scratch/2-e-a-self-rule/plan.md | grep -o "^- a[0-9a-f]*" | sort | uniq -d
exit of the pipe: 0
$ the same over copies in a scratch folder, a9a57fb6f85b48b52 appended to the rulings-file copy
- a9a57fb6f85b48b52
$ the ids of 2.E.A (plan.md and the state file) found in the five files
ids: 26
end of list
```

The two lines `exit of the pipe` and `end of list` are printed by the run's own `echo`; nothing stands between `ids: 26` and `end of list`, so none of the 26 ids is in the five files.

### Case 9

```
$ cat case9.sh
# Case 9: each entry's model in the five files against the model of most responses in its transcript; prints a line only on a difference.
F5=".scratch/archive/2-e-grill/agents/agent-roles.md .scratch/2-f-diagnose/plan.md .scratch/2-g-git-guard/plan.md .scratch/2-h-session-retro/plan.md .scratch/rulings/3-the-writing-base.md"
n=0
for line in $(cat $F5 | grep -E '^(- a[0-9a-f]{16}: |[0-9]+\. [0-9a-f-]+: )' | sed -E 's/^(- |[0-9]+\. )([0-9a-f-]+):.*, ([^,]*)$/\2=\3/'); do
  id=${line%%=*}; fm=${line#*=}; n=$((n+1))
  case $id in *-*) f=$(ls ~/.claude/projects/*/$id.jsonl) ;; *) f=$(ls ~/.claude/projects/*/*/subagents/agent-$id.jsonl) ;; esac
  tm=$(grep -o '"model":"claude[^"]*"' "$f" | sort | uniq -c | sort -rn | head -1 | sed -E 's/.*"model":"([^"]*)"/\1/')
  [ "$fm" = "$tm" ] || echo "DIFF $id file=$fm transcript=$tm"
done
echo "checked $n entries"
$ bash case9.sh
checked 205 entries
```

### Case 10

```
$ cat case10.py
# Case 10: every subagent record and every scratchpad session that starts between 2.E's opening commit bc83a4d and 2.E.A's opening commit 9fc91dc, and where it is recorded.
import glob,os,re,json
R=os.path.expanduser('~/.claude/projects')
lo,hi='2026-09-29T17:59:33','2026-09-30T22:31:16'
def first(f):
    for l in open(f):
        m=re.search(r'"timestamp":"([^"]+)"',l)
        if m: return m.group(1)
recs=[]
for m in glob.glob(R+'/*/*/subagents/agent-*.meta.json'):
    if 'workspace-ordo' not in m: continue
    t=first(m[:-10]+'.jsonl')
    if t and lo<=t<hi: recs.append(os.path.basename(m)[6:-10])
for f in glob.glob(R+'/-private-tmp*/*.jsonl'):
    t=first(f)
    if t and lo<=t<hi: recs.append(os.path.basename(f)[:-6])
five=''.join(open(p).read() for p in ['.scratch/archive/2-e-grill/agents/agent-roles.md','.scratch/2-f-diagnose/plan.md','.scratch/2-g-git-guard/plan.md','.scratch/2-h-session-retro/plan.md','.scratch/rulings/3-the-writing-base.md'])
ea=open('.scratch/2-e-a-self-rule/plan.md').read()
a=[r for r in recs if r in five]; b=[r for r in recs if r not in five and r in ea]; c=[r for r in recs if r not in five and r not in ea]
print('records',len(recs),'in the five files',len(a),'in 2.E.A plan.md',len(b),'neither',c)
$ python3 case10.py
records 206 in the five files 202 in 2.E.A plan.md 3 neither ['e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8']
```
