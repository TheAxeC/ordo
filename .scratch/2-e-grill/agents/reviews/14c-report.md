Everything in the brief is done: items 1 to 5 are written as given, verify 1 to 6 hold, and no case K1 to K10 is unmet. Four points are left to the orchestrator and are listed under "Anything in the brief that was wrong or impossible"; none blocks an item.

## Open items of the state file (verbatim)

- None.

## The first read of K1 to K10 on the unchanged tree

Taken before any file was changed, by reading `skills/grill/SKILL.md` and the term at the base. The lines are as `grep -n` printed them on the unchanged tree:

```
50:   - Every other section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, an archived plan's included, and every other rulings file under `<ledger_root>/rulings/`, is read for the bullets that name the entry by its number or its title and whose first line ends with "(the user)", ...
51:     - Such a bullet is a carried ruling.
52:     - In an archived `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, ... every bullet whose first line ends with "(the user)", ... of a section whose heading begins `## Rulings`, is a carried ruling, whether or not it names the entry.
53:     - The decisions of the design tree a carried ruling settles are settled (Steps 3).
89:   - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.
90:   - A decision that a carried ruling ("What it reads" 6) settles is marked settled and is not asked again.
96:     - A carried ruling that a later ruling names as the one it replaces settles nothing.
97:     - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.
98:     - A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file, a carried bullet included, replaces every carried ruling that settles the same decision.
133:   - The first round also lists, unnumbered and after the answer form, each decision a carried ruling settles, as Steps 3 shows it.
```

| Case | Result on the unchanged tree |
|---|---|
| K1 | Line 52 matches plan 3's title `# Plan: 3 The writing base` (`3` then a space), so all 16 bullets ending "(the user)" of its `## Rulings (2026-09-28)` (input lines 31 to 46) are carried rulings for every entry, Question 2's entries 4 and 5 included (line 52, 53); the decisions they settle are marked settled (line 90) and listed as settled in round 1 (line 133). Nothing in the text sets plan 3 aside. Result: the defect the step ends. |
| K2 | Same path as K1 with 14 bullets; line 52 carries them, line 53 settles the decisions. Result: as the brief expects (the control). |
| K3 | Line 52 matches `# Plan: 2.D The plan skills ...`; its 8 bullets (lines 35 to 42) are carried rulings. Result: as the brief expects. |
| K4 | `.scratch/archive/2-b-.../plan.md:98` names entry 3 and ends "(the user)", so line 50 and 51 make it a carried ruling that settles no design decision; no line of the text sets a plan aside on it. Result: as the brief expects. |
| K5 | Line 52 carries the later plan's bullets, as no line sets any plan aside. Result: as the brief expects, by the absence of any set-aside rule. |
| K6 | Line 52 carries plan 3's bullets, so the brief's "carried again" holds; line 96 and 97 act on the 2.C bullet as a carried ruling. The case is not yet a test of the change. |
| K7 | Line 52 carries every bullet of plan 3, Question 1 included; no line sets one bullet aside. Result: the defect the step ends. |
| K8 | A bullet of `.scratch/rulings/3-the-writing-base.md` reading "carried from ..." is a line of the rulings file, so line 89 marks its decision settled and it is not asked. Result: the defect the step ends. |
| K9 | A bullet of plan 3 that names a ruling as the one it replaces is carried by line 52, so line 96 to 98 make it the ruling carried and the named ruling settles nothing. Result: the defect the step ends. |
| K10 | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. Result: as expected before the change. |

## Cases the brief's rules got wrong

None. Before the first change, each of K1 to K10 was read against the text item 1 to item 3 give (the stop the brief names), and each gives the result the case states. Two readings of the cases' wording are under "Anything in the brief that was wrong or impossible".

## DONE / NOT DONE

| Item | State | Command that proves it, and its output |
|---|---|---|
| 1. Ten lines after line 52 of `skills/grill/SKILL.md` (six at five spaces, four at seven spaces) | DONE | verify 2 prints 1 for each of the 10 lines, and verify 3 shows them at `skills/grill/SKILL.md` lines 53 to 62 at their indents |
| 2. One line after the base line 133 | DONE | verify 2 prints 1; `skills/grill/SKILL.md:144` |
| 3. `plan-terms.md` line 14 | DONE | verify 2 prints 1 |
| 4. `docs/glossary.md` line 19 | DONE | verify 2 prints 1; verify 5 prints `ok: the plan-terms block equals the template` |
| 5. `version: "1.2.0"` | DONE | verify 2 prints 1 |
| Verify 1 | DONE | quoted below, `checks: 10 commands passed`, exit 0 |
| Verify 2 | DONE | below |
| Verify 3 | DONE | below |
| Verify 4 | DONE | `LC_ALL=C grep -n '[^ -~]' ...` printed nothing, exit 1 (no match) |
| Verify 5 | DONE | `ok: the plan-terms block equals the template` |
| Verify 6 | DONE | the walk below |

## Verify 1, from the worktree's root

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (exit 0)
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
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

## Verify 2, each new or changed line in its file once

Each line is written as the one line of a scratch file under the scratchpad directory, and `grep -c -F -x -f <that file> <file>` printed:

```
item 1, line 1 of the block (skills/grill/SKILL.md): 1
item 1, line 2 of the block (skills/grill/SKILL.md): 1
item 1, line 3 of the block (skills/grill/SKILL.md): 1
item 1, line 4 of the block (skills/grill/SKILL.md): 1
item 1, line 5 of the block (skills/grill/SKILL.md): 1
item 1, line 6 of the block (skills/grill/SKILL.md): 1
item 1, line 7 of the block (skills/grill/SKILL.md): 1
item 1, line 8 of the block (skills/grill/SKILL.md): 1
item 1, line 9 of the block (skills/grill/SKILL.md): 1
item 1, line 10 of the block (skills/grill/SKILL.md): 1
item 2 (skills/grill/SKILL.md): 1
item 3 (skills/repo-setup/templates/plan-terms.md): 1
item 4 (docs/glossary.md): 1
item 5 (skills/grill/SKILL.md): 1
```

## Verify 3, diff -U2 against the base copies on main

`diff -U2 /Users/axelfaes/workspace/ordo/skills/grill/SKILL.md skills/grill/SKILL.md`

```diff
--- /Users/axelfaes/workspace/ordo/skills/grill/SKILL.md 2026-09-30 21:55:11
+++ skills/grill/SKILL.md 2026-09-30 22:20:58
@@ -3,5 +3,5 @@
 description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
 metadata:
-  version: "1.1.0"
+  version: "1.2.0"
 ---
 
@@ -51,4 +51,14 @@
      - Such a bullet is a carried ruling.
      - In an archived `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, every bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings`, is a carried ruling, whether or not it names the entry.
+     - A bullet of an archived plan that a ruling of the user sets aside is no carried ruling, for any entry.
+       - Such a bullet settles no decision and replaces no ruling.
+     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, wherever it stands under `<ledger_root>/`, the archived plan it sets aside included.
+     - A ruling sets an archived plan aside when it says that the plan is set aside, thrown out or stopped, or that the entry of the plan is redone.
+       - A ruling that says the entry is redone sets aside only a plan of the entry that stood when the ruling was given.
+       - A plan stood when the ruling was given when the first date of the plan's Rulings is before the ruling's date, or is the same date and the ruling names that plan or one of its steps.
+       - A plan opened after the ruling was given is never set aside by it.
+     - A ruling that sets aside named bullets or steps of an archived plan sets aside only those bullets, and only the bullets of those steps.
+     - A ruling that a later ruling names as the one it replaces sets no plan aside.
+     - A bullet of the entry's Rulings or rulings file that reads "carried from" a bullet now set aside settles nothing.
      - The decisions of the design tree a carried ruling settles are settled (Steps 3).
      - A carried ruling is written into the entry's Rulings or rulings file as "Steps / Writing what settled" 1 says.
@@ -132,4 +142,5 @@
    - The message ends with the answer form: `D<n> => <letter or text>` one line per decision, `D<n> Agree` to take the recommendation, and `D<a>-<b> Agree` to take it for each decision of a range.
    - The first round also lists, unnumbered and after the answer form, each decision a carried ruling settles, as Steps 3 shows it.
+   - The first round also lists each archived plan a ruling sets aside, whole or in part, with the ruling quoted as written and its `<path>:<line>`.
    - The round ends the turn and waits for the answers ("Stops").
    - When the frontier is empty, no round is sent and the turn does not end: the skill goes on to Steps 8, which makes a roadmap diff a quoted ruling states.
```

`diff -U2 /Users/axelfaes/workspace/ordo/skills/repo-setup/templates/plan-terms.md skills/repo-setup/templates/plan-terms.md`

```diff
--- /Users/axelfaes/workspace/ordo/skills/repo-setup/templates/plan-terms.md 2026-09-30 21:52:40
+++ skills/repo-setup/templates/plan-terms.md 2026-09-30 22:20:58
@@ -12,5 +12,5 @@
 - **builder**: the agent that builds one step in the step's worktree under the brief and the rules file. Under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
 - **capability map**: an index the roadmap's introduction links as the map of what the product is, one file per system with each capability's full scope, over which the roadmap is the ordered build plan. Stated in: `roadmap`, "A capability map beside the ordered file".
-- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
+- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
 - **case**: an example under a brief's "Cases", an input with its expected result, from the must-pass and must-refuse examples the step's text gives and, for a code step, the inputs it implies. The first run is the run of every case on the unchanged tree. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run. Stated in: `spec`, Steps 4.
 - **case, of a diagnosis**: the scenario that reproduces a symptom: its input, callers, configuration, data and stages of the run. The original case is that scenario before it is shrunk. Stated in: `diagnose`, Steps 6, 7, 8, 16, 19 and 22, and "Stops".
```

`diff -U2 /Users/axelfaes/workspace/ordo/docs/glossary.md docs/glossary.md`

```diff
--- /Users/axelfaes/workspace/ordo/docs/glossary.md 2026-09-30 21:52:40
+++ docs/glossary.md 2026-09-30 22:20:58
@@ -17,5 +17,5 @@
 - **builder**: the agent that builds one step in the step's worktree under the brief and the rules file. Under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
 - **capability map**: an index the roadmap's introduction links as the map of what the product is, one file per system with each capability's full scope, over which the roadmap is the ordered build plan. Stated in: `roadmap`, "A capability map beside the ordered file".
-- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
+- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
 - **case**: an example under a brief's "Cases", an input with its expected result, from the must-pass and must-refuse examples the step's text gives and, for a code step, the inputs it implies. The first run is the run of every case on the unchanged tree. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run. Stated in: `spec`, Steps 4.
 - **case, of a diagnosis**: the scenario that reproduces a symptom: its input, callers, configuration, data and stages of the run. The original case is that scenario before it is shrunk. Stated in: `diagnose`, Steps 6, 7, 8, 16, 19 and 22, and "Stops".
```

## Verify 4 and 5

```
LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
(no output; grep exit 1)
python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

## Verify 6, the walk of K1 to K10 on the changed text

The lines the walks follow, as `grep -n` prints them on the changed files:

```
50:   - Every other section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, an archived plan's included, and every other rulings file under `<ledger_root>/rulings/`, is read for the bullets that name the entry by its number or its title and whose first line ends with "(the user)", with or without a full stop after it.
51:     - Such a bullet is a carried ruling.
52:     - In an archived `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, every bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings`, is a carried ruling, whether or not it names the entry.
53:     - A bullet of an archived plan that a ruling of the user sets aside is no carried ruling, for any entry.
54:       - Such a bullet settles no decision and replaces no ruling.
55:     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, wherever it stands under `<ledger_root>/`, the archived plan it sets aside included.
56:     - A ruling sets an archived plan aside when it says that the plan is set aside, thrown out or stopped, or that the entry of the plan is redone.
57:       - A ruling that says the entry is redone sets aside only a plan of the entry that stood when the ruling was given.
58:       - A plan stood when the ruling was given when the first date of the plan's Rulings is before the ruling's date, or is the same date and the ruling names that plan or one of its steps.
59:       - A plan opened after the ruling was given is never set aside by it.
60:     - A ruling that sets aside named bullets or steps of an archived plan sets aside only those bullets, and only the bullets of those steps.
61:     - A ruling that a later ruling names as the one it replaces sets no plan aside.
62:     - A bullet of the entry's Rulings or rulings file that reads "carried from" a bullet now set aside settles nothing.
63:     - The decisions of the design tree a carried ruling settles are settled (Steps 3).
99:   - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.
100:   - A decision that a carried ruling ("What it reads" 6) settles is marked settled and is not asked again.
106:     - A carried ruling that a later ruling names as the one it replaces settles nothing.
107:     - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.
108:     - A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file, a carried bullet included, replaces every carried ruling that settles the same decision.
143:   - The first round also lists, unnumbered and after the answer form, each decision a carried ruling settles, as Steps 3 shows it.
144:   - The first round also lists each archived plan a ruling sets aside, whole or in part, with the ruling quoted as written and its `<path>:<line>`.
229:     - A decision a bullet of the entry's Rulings or rulings file already settles, a bullet carried in an earlier session included, gets no carried bullet.
skills/repo-setup/templates/plan-terms.md:14:- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
docs/glossary.md:19:- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
```

The inputs, from the main checkout, as `grep -n` prints them (long lines cut at 160 characters):

```
1:# Plan: 3 The writing base
29:## Rulings (2026-09-28)
32:- Question 1 (2026-09-28): (a), the prose standard moves into the `writing` skill, and `/repo-setup` copies it from there, so each rule is written once (the 
33:- Question 2 (2026-09-28): (a), `/writing <file>` checks a file and reports each problem with its line, changing nothing; rewriting belongs to entries 4 and 
45:- Open item J and the review of Ordo (2026-09-28): the user rules: Ordo is fixed, not reset; plan 3 stops at step 5, and everything of `/writing` is thrown o
2-c plan.md:30:- The review of Ordo (2026-09-28): Ordo is fixed, not reset; plan 3 stops at step 5, and everything of `/writing` is thrown out rather than repai
1:# Plan: 2.D The plan skills take the comparison's process changes
33:## Rulings (2026-09-29)
2-d plan.md lines 35-42: - The step list: approved as drafted, with its choices (the 
2-d plan.md lines 35-42: - Open item A: "one trigger per case" means at least one `Tr
2-d plan.md lines 35-42: - Open item B: the inputs a code step implies but never stat
2-d plan.md lines 35-42: - Open item C: a side of a blind comparison that stops witho
2-d plan.md lines 35-42: - Open item D: the six gates that named "the protocol of 2.D
2-d plan.md lines 35-42: - Open item E: the glossary template of `/repo-setup` carrie
2-d plan.md lines 35-42: - The extended `sync_rules.py`: it checks the plan-terms blo
2-d plan.md lines 35-42: - Open item F: `/ordo-init` lists `docs/glossary.md` in `sta
2-b plan.md:98:- The way back on track is option C: this repair plan, run in agent mode through the skills, then entry 3; no restart (the user).
5:- D3 Where the prose standard lives for `/writing` (2026-09-30): (a) one text, read where it is: the page `standards` lists, or `docs/dev/prose-standard.md`, 
```

The grep over every bullet ending "(the user)" under the ledger for the words of line 56 found, in the ledger as it stands, only `2-c plan.md:30` and input line 45 as rulings that say a plan stops or the entry is redone (`grep -rnE '\(the user\)\.?[[:space:]]*$' --include='*.md' . | grep -iE 'set aside|thrown out|throw out|stopped|stops|redone|redo\b|restart'` in `.scratch/` of the main checkout). The other hits were read: `2-d plan.md:38` says a side of a blind comparison "stops without a whole output", `2-c plan.md:38` says a script "stops at the first no...", `2-b plan.md:98` says "no restart", and `2-e-grill/plan.md` lines 82, 96, 107, 108 and 122 use "stops" for a stop of a skill; none of them says a plan is set aside, thrown out or stopped, or that an entry is redone. `2-e-grill/plan.md:132`, the ruling of step 14a, says what `grill` does with such a ruling and names no plan. The copy without lines 45 and 46 has no such bullet (the same grep over it printed nothing).

### K1

1. `/grill 3` reads plan 3 placed as an archived plan: the title `# Plan: 3 The writing base` is `3` and a space, so line 52 makes its `## Rulings (2026-09-28)` bullets candidate carried rulings.
2. Line 55 makes input line 45 and `2-c plan.md:30` rulings of the user, since each ends "(the user)" and line 55 includes the archived plan the ruling sets aside.
3. Line 56: input line 45 says "plan 3 stops at step 5, and everything of `/writing` is thrown out ... roadmap entry 3 is redone", and `2-c plan.md:30` says the same words, so both set plan 3 aside.
4. Line 57 and 58 (the redo reaches only a plan that stood when the ruling was given): plan 3's Rulings are first dated 2026-09-28, the date of both rulings, and both name plan 3 ("plan 3 stops at step 5"), so plan 3 stood.
5. Line 53: every bullet of plan 3's Rulings (input lines 31 to 46) is no carried ruling for any entry, Question 2 (input line 33), which names entries 4 and 5, included; line 54: none settles a decision or replaces a ruling.
6. `2-c plan.md:30` stands in the archived plan 2.C, which no ruling sets aside, and names "roadmap entry 3", so lines 50 and 51 make it a carried ruling; it states no answer to a decision of the writing base's design tree, which reading finds (line 63), so it settles none.
7. Line 99: a decision `.scratch/rulings/3-the-writing-base.md` settles is marked settled; its D3 (line 5) settles where the prose standard lives, so that decision is not asked. The other decisions plan 3's bullets would have settled are open and enter the frontier and the round (line 100 does not reach them).
8. Line 144: round 1 lists plan 3 as an archived plan a ruling sets aside, with each of the two rulings quoted as written and its `<path>:<line>` (input line 45 and `2-c plan.md:30`). Met.

### K2

1. The copy without lines 45 and 46 is placed as the archived plan; line 52 makes its bullets candidates.
2. Lines 55 and 56 over the ledger with `2-c plan.md:30` absent: no ruling of the user says plan 3 is set aside, thrown out or stopped, or that entry 3 is redone (the grep above printed nothing over the copy).
3. Line 53 is not reached, so line 52 holds: the copy's 14 bullets ending "(the user)" are carried rulings.
4. Line 63: the decisions of the design tree they settle are settled. Met; its difference from K1 is the absence of the two rulings.

### K3

1. `/grill 2.D`: line 52 matches the title `# Plan: 2.D The plan skills take ...` (`2.D` and a space).
2. Lines 55 and 56: no ruling of the user under the ledger says plan 2.D is set aside, thrown out or stopped, or that entry 2.D is redone (the grep above; `2-d plan.md:38` says "stops" of a blind comparison).
3. Line 53 is not reached: the 8 bullets of lines 35 to 42 are carried rulings (line 52), and line 63 settles their decisions. Met.

### K4

1. `2-b plan.md:98` ("then entry 3; no restart") names entry 3 and ends "(the user)", so lines 50 and 51 make it a carried ruling.
2. Line 56: it does not say a plan is set aside, thrown out or stopped, and it says no restart, not that the entry is redone, so it sets no plan aside, and line 53 applies to no plan. Met.

### K5

1. The later plan of entry 3, archived with its Rulings first dated 2026-10-01, next to `2-c plan.md:30` dated 2026-09-28.
2. Line 56 and 57: the ruling's "entry 3 is redone" sets aside only a plan that stood when it was given.
3. Line 58: the first date of the later plan's Rulings, 2026-10-01, is after 2026-09-28 and not the same date, so it did not stand; line 59: a plan opened after the ruling is never set aside by it, although the ruling's words "plan 3 stops" name the entry's number.
4. Line 53 is not reached, so line 52 carries its bullets. Met.

### K6

1. The input is the copy without lines 45 and 46 as the archived plan, `2-c plan.md:30`, and a later ruling "... replacing The review of Ordo (the user)." beside it.
2. Line 61: `2-c plan.md:30` is named by a later ruling as the one it replaces, so it sets no plan aside.
3. Line 56 finds no other ruling that sets plan 3 aside, so line 53 is not reached and line 52 carries plan 3's bullets again. Met.

### K7

1. The input is the copy without lines 45 and 46 and a ruling "plan 3's Question 1 is set aside (the user)."
2. Line 56: it says a bullet is set aside, not that plan 3 is, so plan 3 is not set aside; line 60: it names a bullet of the plan, so only that bullet is set aside.
3. Line 53: the copy's bullet `Question 1 (2026-09-28)` is no carried ruling, and line 54: it settles no decision.
4. Line 52: the plan's other 13 bullets ending "(the user)" are carried rulings. Met.

### K8

1. By K1's walk plan 3 is set aside, so the bullet the carried copy names, `.scratch/archive/3-the-writing-base/plan.md:32` (Question 1), is a bullet now set aside.
2. Line 62: the bullet of `.scratch/rulings/3-the-writing-base.md` that reads "carried from `.scratch/archive/3-the-writing-base/plan.md:32`" settles nothing.
3. Line 99 marks settled only a decision that a line of the rulings file settles, and this line settles none, so the decision is open, enters the frontier and is asked; line 229 (a decision a bullet already settles gets no carried bullet) does not apply. Met.

### K9

1. A bullet of plan 3 names another ruling as the one it replaces; plan 3 is set aside by K1's walk.
2. Line 53 and 54: the bullet is no carried ruling, settles no decision and replaces no ruling.
3. Lines 106 to 108 (a later ruling replaces a carried ruling or a bullet of the entry's Rulings) are reached only by a ruling that is carried or a bullet of the entry's own Rulings; the set-aside bullet is neither, so the ruling it names is not replaced and stands as it did. Met.

### K10

1. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` over the changed tree printed `ok: the plan-terms block equals the template` (Verify 5, exit 0); `plan-terms.md:14` and `docs/glossary.md:19` are the same line (Verify 2, items 3 and 4). Met.

## Files changed, with line counts

| File | Lines at the base | Lines now | Change |
|---|---|---|---|
| `skills/grill/SKILL.md` | 312 | 323 | `version` 1.1.0 to 1.2.0 (line 5); ten lines after the base line 52 (now lines 53 to 62); one line after the base line 133 (now line 144) |
| `skills/repo-setup/templates/plan-terms.md` | 120 | 120 | line 14 replaced |
| `docs/glossary.md` | 137 | 137 | line 19 replaced |
| `.scratch/2-e-grill/agents/reviews/14c-report.md` | 0 | this file | the report |

Line counts taken with `wc -l` on the worktree's files and on the main checkout's base copies.

## Judgment calls the brief left open

None. Each text was written as given. Two cases (K1 and K6) needed a reading of their wording; both are under the last heading and change no text.

## User-visible changes, before and after

- What `grill` carries from an archived plan of the entry. Before: every bullet ending "(the user)" of an archived plan of the entry is a carried ruling (line 52 of the base), whatever any later ruling says. After: a bullet of an archived plan that a ruling of the user sets aside (line 56 to 59, 60) is no carried ruling for any entry, settles no decision and replaces no ruling (lines 53 and 54); a carried copy of such a bullet in the entry's Rulings or rulings file settles nothing (line 62); a ruling that a later ruling names as the one it replaces sets no plan aside (line 61).
- What round 1 shows. Before: the decisions carried rulings settle (base line 133). After: also each archived plan a ruling sets aside, whole or in part, with the ruling quoted as written and its `<path>:<line>` (line 144).
- The term **carried ruling** (`skills/repo-setup/templates/plan-terms.md:14`, `docs/glossary.md:19`). Before: "... or of the Rulings of an archived plan of that entry; the decisions it settles ...". After: "... or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside; the decisions it settles ...".
- `grill`'s version. Before: 1.1.0. After: 1.2.0.

## Anything in the brief that was wrong or impossible

Nothing made an item impossible or a case unmet. Four points are for the orchestrator, none decided by the builder (rule 4 of the rules file):

1. The Stops table of `skills/grill/SKILL.md`, line 297, column "What it shows", says the first round shows "the decisions carried rulings settle". Item 2 makes the first round show also the archived plans a ruling sets aside, so the cell is incomplete after the change. No brief item changes the table, so it is unchanged (rule 20 of the rules file); the cell would need "and the archived plans a ruling sets aside".
2. Item 2 (line 144) reads "each archived plan a ruling sets aside ... with the ruling quoted as written and its `<path>:<line>`", in the singular. K1 expects round 1 to quote both rulings that set plan 3 aside. K1 was walked reading the line once for each ruling that sets a plan aside, which lists both; the line does not say so in words.
3. K6 names no input file. It was walked on the copy without lines 45 and 46 of plan 3 plus `2-c plan.md:30` and the replacing ruling, where plan 3's bullets are carried again. On the file with line 45 (named "Open item J and the review of Ordo", not "The review of Ordo"), line 45 is a second ruling that sets plan 3 aside (line 56 to 58), and line 61 lifts only the ruling the replacement names, so plan 3 stays set aside unless the replacing ruling names line 45 as well.
4. Lines 55 to 61 give no order for this loop: ruling X of plan P1 sets plan P2 aside, and ruling Y of plan P2 names X as the one it replaces. Line 61 says X then sets no plan aside, so Y is not set aside and counts; line 53 says Y is a bullet of a set-aside plan, so it replaces nothing and X stands. Both readings hold and the text picks neither. No case K1 to K10 is this shape.

Checks of the new rules against the rest of the text (rule 19): `grep -rn 'carried ruling' skills docs README.md utils` hits `skills/grill/SKILL.md`, `skills/repo-setup/templates/plan-terms.md:14` and `docs/glossary.md:19` only; `grep -rn -i 'set aside' skills docs README.md utils` hits `skills/grill/SKILL.md` lines 56, 59 and 62 and three unrelated lines of `skills/plan-retro/SKILL.md` (findings set aside as "no defect"). Line 62 is the stated exception to line 99 for a carried copy of a set-aside bullet, and line 229 gives no carried bullet for a decision the entry's file already settles, which line 62 leaves true, since a copy that settles nothing settles no decision.

One read-only `git ls-tree` ran in the main checkout while the brief's premise about entry 3's folder was read; it changed nothing, and no other git command was run.

## Repair round 1

Every item of `.scratch/2-e-grill/agents/briefs/14c-round-1.md` is done, every check below ran, and K1 to K13 are met. One case premise is stated under "Not done, and readings" (K7).

### The changes, item by item, with before and after

Lines are those of `skills/grill/SKILL.md` as it stands now.

1. Line 55, "A ruling of the user". Before: `... with or without a full stop after it, wherever it stands under `<ledger_root>/`, the archived plan it sets aside included.` After: `... with or without a full stop after it, of a section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, or of a rulings file under `<ledger_root>/rulings/`, the archived plan it sets aside included.`
2. Line 147. Before: `The first round also lists each archived plan a ruling sets aside, whole or in part, with the ruling quoted as written and its `<path>:<line>`.` After: `The first round also lists each archived plan whose bullets would otherwise be carried rulings for the entry and that a ruling sets aside, whole or in part, with each ruling that sets it aside quoted as written and its `<path>:<line>`.`
3. Lines 61 and 54.
   - Line 61. Before: `A ruling that a later ruling names as the one it replaces sets no plan aside.` After: `... sets no plan aside, and neither does any other ruling that sets the same plan, bullets or steps aside and is dated no later than the ruling replaced.`
   - Line 54. Before: `Such a bullet settles no decision and replaces no ruling.` After: `Such a bullet settles no decision, and replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.`
4. Stops row "A round", line 304, cell "What it shows". Before: `... and in the first round the decisions carried rulings settle`. After: `... and in the first round the decisions carried rulings settle and the archived plans a ruling sets aside`.
5. Four sub-bullets, each under its rule and two spaces further in (all new lines):
   - Line 100, at five spaces, under line 99: `A bullet that reads "carried from" a bullet now set aside settles nothing ("What it reads" 6).`
   - Line 109, at seven spaces, under line 108: `A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says, and the ruling it names stays the one carried.`
   - Line 112, at seven spaces, under line 111: `A bullet that settles nothing ("What it reads" 6) makes no rule clash.`
   - Line 235, at seven spaces, under line 234: `A bullet carried in an earlier session from a bullet now set aside settles nothing, and is removed as the next sub-bullet says.`
6. Line 236, at five spaces, after line 235 (new): `A bullet that reads "carried from" a bullet now set aside ("What it reads" 6) is removed from the entry's Rulings or rulings file at the first write of Steps 8, and Steps 10 lists each removal with the bullet as it stood.` Line 166, at four spaces in Steps 10, after line 165 (new): `List each "carried from" bullet removed ("Steps / Writing what settled" 1), with the bullet as it stood and its `<path>:<line>`.`
7. Line 167, at four spaces in Steps 10, after line 166 (new): `List each archived plan a ruling sets aside, as the first round lists it (Steps 6), those of an interview whose first pass found no frontier included.`
8. The term **carried ruling**, `skills/repo-setup/templates/plan-terms.md:14` and `docs/glossary.md:19`. Before: `... or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside; the decisions it settles ...`. After: `... or of the Rulings of an archived plan of that entry, and that is no bullet of an archived plan a ruling of the user sets aside; the decisions it settles ...`. The two lines are equal (check 5).

Nothing else in the three files was changed in this round.

### Check 1

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (exit 0)
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
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

### Check 2, each new line once (`grep -c -F -x -f <scratch file with the one line> <file>`), each replaced line 0

```
new 1 (line 55) in skills/grill/SKILL.md: 1
new 2 (line 147) in skills/grill/SKILL.md: 1
new 3a (line 61) in skills/grill/SKILL.md: 1
new 3b (line 54) in skills/grill/SKILL.md: 1
new 5a (under the settled-decision rule) in skills/grill/SKILL.md: 1
new 5b (under the later-ruling rule) in skills/grill/SKILL.md: 1
new 5c (under the rule clash rule) in skills/grill/SKILL.md: 1
new 5d (under "already settles") in skills/grill/SKILL.md: 1
new 6a (removal) in skills/grill/SKILL.md: 1
new 6b (Steps 10, removals) in skills/grill/SKILL.md: 1
new 7 (Steps 10, plans) in skills/grill/SKILL.md: 1
new 4 (Stops row "A round") in skills/grill/SKILL.md: 1
new 8 (plan-terms.md line 14) in skills/repo-setup/templates/plan-terms.md: 1
new 8 (glossary.md line 19) in docs/glossary.md: 1
replaced old line 55 (item 1) in skills/grill/SKILL.md: 0
replaced old line 144 (item 2) in skills/grill/SKILL.md: 0
replaced old line 61 (item 3a) in skills/grill/SKILL.md: 0
replaced old line 54 (item 3b) in skills/grill/SKILL.md: 0
replaced old Stops row (item 4) in skills/grill/SKILL.md: 0
replaced old term line (item 8), plan-terms.md in skills/repo-setup/templates/plan-terms.md: 0
replaced old term line (item 8), glossary.md in docs/glossary.md: 0
```

### Check 3, diff -U2 against the base copies on main (the brief's changes and this round's)

`diff -U2 /Users/axelfaes/workspace/ordo/skills/grill/SKILL.md skills/grill/SKILL.md`

```diff
--- /Users/axelfaes/workspace/ordo/skills/grill/SKILL.md 2026-09-30 21:55:11
+++ skills/grill/SKILL.md 2026-09-30 22:38:54
@@ -3,5 +3,5 @@
 description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
 metadata:
-  version: "1.1.0"
+  version: "1.2.0"
 ---
 
@@ -51,4 +51,14 @@
      - Such a bullet is a carried ruling.
      - In an archived `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, every bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings`, is a carried ruling, whether or not it names the entry.
+     - A bullet of an archived plan that a ruling of the user sets aside is no carried ruling, for any entry.
+       - Such a bullet settles no decision, and replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.
+     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, or of a rulings file under `<ledger_root>/rulings/`, the archived plan it sets aside included.
+     - A ruling sets an archived plan aside when it says that the plan is set aside, thrown out or stopped, or that the entry of the plan is redone.
+       - A ruling that says the entry is redone sets aside only a plan of the entry that stood when the ruling was given.
+       - A plan stood when the ruling was given when the first date of the plan's Rulings is before the ruling's date, or is the same date and the ruling names that plan or one of its steps.
+       - A plan opened after the ruling was given is never set aside by it.
+     - A ruling that sets aside named bullets or steps of an archived plan sets aside only those bullets, and only the bullets of those steps.
+     - A ruling that a later ruling names as the one it replaces sets no plan aside, and neither does any other ruling that sets the same plan, bullets or steps aside and is dated no later than the ruling replaced.
+     - A bullet of the entry's Rulings or rulings file that reads "carried from" a bullet now set aside settles nothing.
      - The decisions of the design tree a carried ruling settles are settled (Steps 3).
      - A carried ruling is written into the entry's Rulings or rulings file as "Steps / Writing what settled" 1 says.
@@ -88,4 +98,5 @@
    - The roadmap diff and "record as ADR?" ("Steps / Writing what settled") are decisions of their own, numbered like the rest.
    - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.
+     - A bullet that reads "carried from" a bullet now set aside settles nothing ("What it reads" 6).
    - A decision that a carried ruling ("What it reads" 6) settles is marked settled and is not asked again.
      - The first round lists it as settled (Steps 6): the words of the carried ruling that settle it, quoted as written, with the ruling's `<path>:<line>`.
@@ -96,6 +107,8 @@
      - A carried ruling that a later ruling names as the one it replaces settles nothing.
      - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.
+       - A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says, and the ruling it names stays the one carried.
      - A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file, a carried bullet included, replaces every carried ruling that settles the same decision.
      - A carried ruling that contradicts another carried ruling, or a bullet of the entry's Rulings or rulings file, neither naming the other as the one it replaces, is a rule clash ("Steps / An answer that contradicts").
+       - A bullet that settles nothing ("What it reads" 6) makes no rule clash.
      - Whether a bullet of the entry's Rulings or rulings file already settles a decision of a carried ruling is judged by reading, since the line a carried ruling stands on can move.
    - An entry that has a goal already has one decision for each part of its current goal: the part kept, changed or dropped.
@@ -132,4 +145,5 @@
    - The message ends with the answer form: `D<n> => <letter or text>` one line per decision, `D<n> Agree` to take the recommendation, and `D<a>-<b> Agree` to take it for each decision of a range.
    - The first round also lists, unnumbered and after the answer form, each decision a carried ruling settles, as Steps 3 shows it.
+   - The first round also lists each archived plan whose bullets would otherwise be carried rulings for the entry and that a ruling sets aside, whole or in part, with each ruling that sets it aside quoted as written and its `<path>:<line>`.
    - The round ends the turn and waits for the answers ("Stops").
    - When the frontier is empty, no round is sent and the turn does not end: the skill goes on to Steps 8, which makes a roadmap diff a quoted ruling states.
@@ -150,4 +164,6 @@
     - List every decision settled in the interview with where each was written: the Rulings line, the entry, the glossary line, the ADR.
       - The decisions carried rulings settle are listed among them, each with its carried ruling's `<path>:<line>`, those of an interview whose first pass found no frontier included.
+    - List each "carried from" bullet removed ("Steps / Writing what settled" 1), with the bullet as it stood and its `<path>:<line>`.
+    - List each archived plan a ruling sets aside, as the first round lists it (Steps 6), those of an interview whose first pass found no frontier included.
     - An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.
     - List each change owed to an open plan ("Steps / A plan already open"): a step whose text an answer changed, and the lines of `plan.md`'s "## Goal" or "## Gate" an answer changed.
@@ -217,4 +233,6 @@
    - A carried ruling ("What it reads" 6) is written at the first write of Steps 8 as one bullet for each decision it settles, numbered as Steps 6 numbers a decision: ``- D<n> <the decision, as a phrase> (<the carried ruling's date>): "<the words of the carried ruling that settle it, quoted as written>", carried from `<path>:<line>` (the user).``
      - A decision a bullet of the entry's Rulings or rulings file already settles, a bullet carried in an earlier session included, gets no carried bullet.
+       - A bullet carried in an earlier session from a bullet now set aside settles nothing, and is removed as the next sub-bullet says.
+     - A bullet that reads "carried from" a bullet now set aside ("What it reads" 6) is removed from the entry's Rulings or rulings file at the first write of Steps 8, and Steps 10 lists each removal with the bullet as it stood.
      - The carried ruling's date is the date its bullet gives, or else the date its Rulings heading gives.
      - Words that settle the decision in the ruling's sub-bullets or fenced blocks are quoted in the one line, since `/plan` copies bullet lines only.
@@ -284,5 +302,5 @@
 | Stop | When | What it shows | What resumes it |
 |---|---|---|---|
-| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle | The user's answers |
+| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle and the archived plans a ruling sets aside | The user's answers |
 | The end | Steps 10 | The decisions settled with where each was written, the step changes owed, and the question of the shared understanding and the commit | The user's confirmation and answer on the commit |
 | A lookup agent served another model | The runner served a lookup agent a model that is not the configured one ("Steps / Looking up a fact") | The configured value of `reviewer` and the served model | The user's instruction, then the lookup started again |
```

`diff -U2 /Users/axelfaes/workspace/ordo/skills/repo-setup/templates/plan-terms.md skills/repo-setup/templates/plan-terms.md`

```diff
--- /Users/axelfaes/workspace/ordo/skills/repo-setup/templates/plan-terms.md 2026-09-30 21:52:40
+++ skills/repo-setup/templates/plan-terms.md 2026-09-30 22:38:54
@@ -12,5 +12,5 @@
 - **builder**: the agent that builds one step in the step's worktree under the brief and the rules file. Under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
 - **capability map**: an index the roadmap's introduction links as the map of what the product is, one file per system with each capability's full scope, over which the roadmap is the ordered build plan. Stated in: `roadmap`, "A capability map beside the ordered file".
-- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
+- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry, and that is no bullet of an archived plan a ruling of the user sets aside; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
 - **case**: an example under a brief's "Cases", an input with its expected result, from the must-pass and must-refuse examples the step's text gives and, for a code step, the inputs it implies. The first run is the run of every case on the unchanged tree. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run. Stated in: `spec`, Steps 4.
 - **case, of a diagnosis**: the scenario that reproduces a symptom: its input, callers, configuration, data and stages of the run. The original case is that scenario before it is shrunk. Stated in: `diagnose`, Steps 6, 7, 8, 16, 19 and 22, and "Stops".
```

`diff -U2 /Users/axelfaes/workspace/ordo/docs/glossary.md docs/glossary.md`

```diff
--- /Users/axelfaes/workspace/ordo/docs/glossary.md 2026-09-30 21:52:40
+++ docs/glossary.md 2026-09-30 22:38:54
@@ -17,5 +17,5 @@
 - **builder**: the agent that builds one step in the step's worktree under the brief and the rules file. Under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
 - **capability map**: an index the roadmap's introduction links as the map of what the product is, one file per system with each capability's full scope, over which the roadmap is the ordered build plan. Stated in: `roadmap`, "A capability map beside the ordered file".
-- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
+- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry, and that is no bullet of an archived plan a ruling of the user sets aside; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.
 - **case**: an example under a brief's "Cases", an input with its expected result, from the must-pass and must-refuse examples the step's text gives and, for a code step, the inputs it implies. The first run is the run of every case on the unchanged tree. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run. Stated in: `spec`, Steps 4.
 - **case, of a diagnosis**: the scenario that reproduces a symptom: its input, callers, configuration, data and stages of the run. The original case is that scenario before it is shrunk. Stated in: `diagnose`, Steps 6, 7, 8, 16, 19 and 22, and "Stops".
```

### Checks 4 and 5

```
LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
(no output; grep exit 1)
python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

### Check 6, the walks of K1 to K13 on the changed text

The lines of `skills/grill/SKILL.md` the walks follow, as `grep -n` prints them:

```
50:   - Every other section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, an archived plan's included, and every other rulings file under `<ledger_root>/rulings/`, is read for the bullets that name the entry by its number or its titl
51:     - Such a bullet is a carried ruling.
52:     - In an archived `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, every bullet whose first line ends with "(the user)", with or without a full stop after it, of a 
53:     - A bullet of an archived plan that a ruling of the user sets aside is no carried ruling, for any entry.
54:       - Such a bullet settles no decision, and replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.
55:     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, or of a rulings file under `<ledger_root>/rulings/`,
56:     - A ruling sets an archived plan aside when it says that the plan is set aside, thrown out or stopped, or that the entry of the plan is redone.
57:       - A ruling that says the entry is redone sets aside only a plan of the entry that stood when the ruling was given.
58:       - A plan stood when the ruling was given when the first date of the plan's Rulings is before the ruling's date, or is the same date and the ruling names that plan or one of its steps.
59:       - A plan opened after the ruling was given is never set aside by it.
60:     - A ruling that sets aside named bullets or steps of an archived plan sets aside only those bullets, and only the bullets of those steps.
61:     - A ruling that a later ruling names as the one it replaces sets no plan aside, and neither does any other ruling that sets the same plan, bullets or steps aside and is dated no later than the ruling replaced.
62:     - A bullet of the entry's Rulings or rulings file that reads "carried from" a bullet now set aside settles nothing.
63:     - The decisions of the design tree a carried ruling settles are settled (Steps 3).
99:   - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.
101:   - A decision that a carried ruling ("What it reads" 6) settles is marked settled and is not asked again.
108:     - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.
109:       - A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says, and the ruling it names stays the one carried.
110:     - A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file, a carried bullet included, replaces every carried ruling that settles the same decision.
111:     - A carried ruling that contradicts another carried ruling, or a bullet of the entry's Rulings or rulings file, neither naming the other as the one it replaces, is a rule clash ("Steps / An answer that contradicts").
112:       - A bullet that settles nothing ("What it reads" 6) makes no rule clash.
147:   - The first round also lists each archived plan whose bullets would otherwise be carried rulings for the entry and that a ruling sets aside, whole or in part, with each ruling that sets it aside quoted as written and its `<path>:<line>`.
149:   - When the frontier is empty, no round is sent and the turn does not end: the skill goes on to Steps 8, which makes a roadmap diff a quoted ruling states.
165:      - The decisions carried rulings settle are listed among them, each with its carried ruling's `<path>:<line>`, those of an interview whose first pass found no frontier included.
166:    - List each "carried from" bullet removed ("Steps / Writing what settled" 1), with the bullet as it stood and its `<path>:<line>`.
167:    - List each archived plan a ruling sets aside, as the first round lists it (Steps 6), those of an interview whose first pass found no frontier included.
169:    - List each change owed to an open plan ("Steps / A plan already open"): a step whose text an answer changed, and the lines of `plan.md`'s "## Goal" or "## Gate" an answer changed.
170:    - List each clash with a term of the plan-terms block as a change for the user to make in the Ordo repository's `skills/repo-setup/templates/plan-terms.md`.
235:       - A bullet carried in an earlier session from a bullet now set aside settles nothing, and is removed as the next sub-bullet says.
236:     - A bullet that reads "carried from" a bullet now set aside ("What it reads" 6) is removed from the entry's Rulings or rulings file at the first write of Steps 8, and Steps 10 lists each removal with the bullet as it stood.
304:| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle an
skills/repo-setup/templates/plan-terms.md:14:- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an
docs/glossary.md:19:- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that en
```

The ledger as it stands in the main checkout (`/Users/axelfaes/workspace/ordo/.scratch`), read with these commands, output cut at 100 characters:

```
cd .scratch; find . \( -name plan.md -o -path "./rulings/*.md" \) | sort
./2-e-grill/plan.md
./2-f-diagnose/plan.md
./2-g-git-guard/plan.md
./2-h-session-retro/plan.md
./archive/1-one-layout-for-every-skill/inventories/plan.md
./archive/1-one-layout-for-every-skill/plan.md
./archive/2-a-launch-notes-for-builders-run-as-their-own-process/plan.md
./archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md
./archive/2-c-scripts-compute-facts-and-writing-is-removed/plan.md
./archive/2-coverage-inventory-of-the-academic-skills/plan.md
./archive/2-d-the-plan-skills-take-the-comparisons-process-changes/plan.md
./rulings/3-the-writing-base.md
for each of them: grep -n -E '\(the user\)\.?[[:space:]]*$' <file> | grep -i -E 'set aside|thrown out|throw out|stopped|stops|redone|redo\b|restart'
./2-e-grill/plan.md:82:- C (b): `/spec`'s premise check, its brief check and `/refute` read the ADRs the step touches; a
./2-e-grill/plan.md:96:- O5: the revert rule (a), step 8; ruling Y stays (a) after the count of 2.C's and 2.D's stops (2
./2-e-grill/plan.md:107:- Overnight work (2026-09-30), four rulings on the orchestrator's proposal. 1: `worker:` stays `
./2-e-grill/plan.md:108:- Plan drafts (2026-09-30): the step lists of roadmap entries 2.F, 2.G and 2.H are drafted by `/
./2-e-grill/plan.md:122:- Approval stops under a ruling (2026-09-30): Axel ruled (a). Step 9a is added: `plan-orchestrat
./2-e-grill/plan.md:132:- Step 14a, an archived plan the entry has since set aside (2026-09-30): Axel ruled (b). `grill`
./archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md:98:- The way back on track is option C: this repair plan, run in agent mode through the skills, then
./archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md:100:- Contradiction 3a: the closing step's roadmap diff is a stop of `plan-orchestration`. 3b: a sha
./archive/2-c-scripts-compute-facts-and-writing-is-removed/plan.md:30:- The review of Ordo (2026-09-28): Ordo is fixed, not reset; plan 3 stops at step 5, and everythi
./archive/2-c-scripts-compute-facts-and-writing-is-removed/plan.md:38:- Open item A (2026-09-28): (b), a script runs the verify list, not the session: `skills/land/tem
./archive/2-d-the-plan-skills-take-the-comparisons-process-changes/plan.md:38:- Open item C: a side of a blind comparison that stops without a whole output, because it fails o
find 2-e-grill/agents -name plan.md | wc -l   (the brief input copies and the reports are files of another name)
       0
find . -maxdepth 3 -type d -name '3-*'   (entry 3 has no plan folder: no output)
grep -n -E "^# Plan: |^## Rulings" (2-c and the brief input copy of plan 3)
archive/2-c-scripts-compute-facts-and-writing-is-removed/plan.md:1:# Plan: 2.C Scripts compute facts, and /writing is removed
archive/2-c-scripts-compute-facts-and-writing-is-removed/plan.md:28:## Rulings (2026-09-28)
2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:1:# Plan: 3 The writing base
2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:29:## Rulings (2026-09-28)
```

Reading of those bullets: `archive/2-c-.../plan.md:30` ("The review of Ordo (2026-09-28)") is the only bullet in a `## Rulings` section of a `plan.md`, or in a rulings file, that says a plan stops or is thrown out and that an entry is redone; it names plan 3. The other hits say "stops" of a skill, a script, a side of a blind comparison or a stop of `/plan`, or "no restart" (`2-b plan.md:98`), and `2-e-grill/plan.md:132` states how `grill` treats such a ruling and names no plan. The brief input copy `.scratch/2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:45` and the reports are not in a file named `plan.md` or in `rulings/`, so line 55 does not make them rulings.

Placements the cases state are made for the walk: plan 3 as `.scratch/archive/3-the-writing-base/plan.md` (a copy of the brief input copy named `plan.md`, its `## Rulings (2026-09-28)` at input line 29) for K1, K6, K8 and K12, and the copy without lines 45 and 46 for K2, K5 and K7. The brief input copies stay where they are in every walk.

### K1

1. `/grill 3` with plan 3 placed as an archived plan: the title `# Plan: 3 The writing base` is `3` and a space, so line 52 makes its `## Rulings (2026-09-28)` bullets candidate carried rulings.
2. Line 55: the placed plan 3's line 45 and `2-c plan.md:30` are rulings of the user, each a bullet ending "(the user)" of a `## Rulings` section of a `plan.md` under `.scratch/`. The brief input copy is neither.
3. Line 56: both say "plan 3 stops at step 5, and everything of `/writing` is thrown out ... roadmap entry 3 is redone", so both set plan 3 aside.
4. Lines 57 and 58: plan 3's Rulings are first dated 2026-09-28, the date of both rulings, and both name plan 3, so plan 3 stood when they were given.
5. Line 53: none of plan 3's bullets is a carried ruling for any entry, Question 2 (input line 33, naming entries 4 and 5) included; line 54: none settles a decision or replaces a ruling, since no bullet of plan 3 names a ruling as the one it replaces (`grep -n -i replac` over the input copy printed nothing).
6. `2-c plan.md:30` names "roadmap entry 3", stands in a plan no ruling sets aside, and is a carried ruling (lines 50 and 51); it states no answer to a decision of the writing base's design tree, so line 63 settles none.
7. Line 99: a decision `.scratch/rulings/3-the-writing-base.md` settles is marked settled; its D3 (line 5) settles where the prose standard lives. The other decisions plan 3 would have settled are open and asked.
8. Line 147: plan 3's bullets would otherwise be carried for entry 3 (line 52) and a ruling sets plan 3 aside, so round 1 lists it with each of the two rulings quoted as written and its `<path>:<line>`: `.scratch/archive/3-the-writing-base/plan.md:45` and `.scratch/archive/2-c-.../plan.md:30`. Line 304 names the list among what the round shows. Met.

### K2

1. The copy without lines 45 and 46 is placed as the archived plan; line 52 makes its 14 bullets ending "(the user)" candidates.
2. Lines 55 and 56 over the ledger with `2-c plan.md:30` removed, as the case states: no ruling in a `## Rulings` section of a `plan.md` or a rulings file says plan 3 is set aside, thrown out or stopped, or that entry 3 is redone (the grep list above without its `2-c plan.md:30` line). The brief input copy's line 45 is not a ruling by line 55.
3. Line 53 is not reached; line 52 and line 63 hold: the 14 bullets are carried rulings and settle their decisions. Met, the control of K1.

### K3

1. `/grill 2.D`: line 52 matches the title `# Plan: 2.D The plan skills take ...`.
2. Lines 55 and 56: no ruling in the grep list says plan 2.D is set aside, thrown out or stopped or entry 2.D redone (`2-d plan.md:38` says a side of a blind comparison "stops").
3. Line 53 is not reached: the 8 bullets of lines 35 to 42 are carried rulings (line 52) and settle their decisions (line 63). Plan 3, placed or not, is not listed by line 147 for 2.D: its bullets would not be carried for 2.D, since its title does not match and none names 2.D. Met.

### K4

1. `2-b plan.md:98` ("then entry 3; no restart") names entry 3 and ends "(the user)", so lines 50 and 51 make it a carried ruling.
2. Line 56: it says no plan is set aside and no entry redone, so it sets nothing aside. Met.

### K5

1. The later plan of entry 3, archived, its Rulings first dated 2026-10-01, beside `2-c plan.md:30` dated 2026-09-28.
2. Lines 56 and 57: the ruling's "entry 3 is redone" sets aside only a plan that stood when it was given.
3. Line 58: 2026-10-01 is after 2026-09-28 and not the same date, so the later plan did not stand; line 59: a plan opened after the ruling is never set aside by it, although "plan 3 stops" carries the entry's number.
4. Line 53 is not reached; line 52 carries its bullets. Met.

### K6

1. Input: plan 3 placed with lines 45 and 46, `2-c plan.md:30`, and a later ruling Z of 2026-10-01 in a `## Rulings` section: "... replacing The review of Ordo (the user)."
2. Line 61: `2-c plan.md:30` is named by a later ruling as the one it replaces, so it sets no plan aside.
3. Line 61, second clause: the placed line 45 is another ruling that sets the same plan aside, dated 2026-09-28, no later than the ruling replaced (2026-09-28), so it sets no plan aside either.
4. Lines 55 and 56 find no other ruling that sets plan 3 aside, so line 53 is not reached and line 52 carries plan 3's bullets again. The same holds on the copy without lines 45 and 46. Met.

### K7

1. Input: the copy without lines 45 and 46 placed, and the ruling "plan 3's Question 1 is set aside (the user)." in a `## Rulings` section; the case states no 2.C ruling for this walk, as K2 does, so `2-c plan.md:30` is out of the ledger (see "Not done, and readings").
2. Line 56: the ruling says a bullet is set aside, not the plan, so plan 3 is not set aside; line 60: it names a bullet, so only that bullet is set aside.
3. Line 53: the copy's `Question 1 (2026-09-28)` is no carried ruling; line 54: it settles no decision.
4. Line 52: the plan's other 13 bullets ending "(the user)" are carried rulings; the brief input copy's line 45 is no ruling (line 55). Met.

### K8

1. By K1's walk plan 3 is set aside, so its Question 1 (`.scratch/archive/3-the-writing-base/plan.md:32`) is a bullet now set aside.
2. Line 62 and line 100: the bullet of `.scratch/rulings/3-the-writing-base.md` reading "carried from `.scratch/archive/3-the-writing-base/plan.md:32`" settles nothing, and line 99 marks settled only a decision a line settles, so the decision is open and asked.
3. Line 236: the bullet is removed at the first write of Steps 8; line 166: Steps 10 lists the removal. Met.

### K9

1. A bullet of plan 3, set aside by K1's walk, names another ruling as the one it replaces.
2. Lines 53 and 54: it is no carried ruling, settles no decision, and replaces no ruling, since the ruling it names is not one that sets its own plan aside.
3. Line 109 (under line 108): a bullet of a set-aside plan replaces no ruling, and the ruling it names stays the one carried. Met.

### K10

1. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` (check 5); `plan-terms.md:14` and `docs/glossary.md:19` are equal (check 2, item 8). Met.

### K11

1. P1's ruling X (2026-09-28) says plan P2 is set aside, so by lines 55 and 56 it sets P2 aside; Y (2026-09-29) in P2's own Rulings reads "... replacing X (the user).".
2. Line 61: X is named by a later ruling as the one it replaces, so X sets no plan aside; P2 stands.
3. Line 54: Y is a bullet of an archived plan that no ruling sets aside, so line 53 does not reach it; line 52, or line 50 for the entry it names, carries it, and the exception of line 54 (replaces a ruling that sets its own plan aside) states the same for the case that P2 were set aside. P2's bullets are carried. Met.

### K12

1. `.scratch/rulings/3-the-writing-base.md` holds a bullet reading "carried from `.scratch/archive/3-the-writing-base/plan.md:32`", whose source plan 3 is set aside (K1).
2. Line 62 and line 100: it settles nothing, so its decision is open and asked (line 99 does not mark it settled).
3. Line 236: at the first write of Steps 8 the bullet is removed from the rulings file; line 235: a bullet carried in an earlier session from a set-aside bullet settles nothing and is removed.
4. Line 166: Steps 10 lists the removal with the bullet as it stood and its `<path>:<line>`. Met.

### K13

1. The entry's rulings file settles every decision, and plan 3 is an archived plan of entry 3 set aside by K1's rulings.
2. Line 149: the frontier is empty, so no round is sent and the skill goes on to Steps 8.
3. Line 167: Steps 10 lists each archived plan a ruling sets aside as the first round lists it (line 147), those of an interview whose first pass found no frontier included: plan 3, with each ruling that sets it aside quoted and its `<path>:<line>`. Met.

### Not done, and readings

Nothing in the round is undone. One premise of a case is stated here so that no walk is read as narrower than it is. K7 names no 2.C ruling. On the ledger as it stands, `2-c plan.md:30` is present and sets plan 3 aside whole (lines 55 to 58), so plan 3's other bullets are not carried on it whatever the K7 ruling says. The walk therefore removes `2-c plan.md:30` from the ledger for K7, as K2 states for itself, and every other file stands as it is. K2 and K7 are the only walks with that removal.
