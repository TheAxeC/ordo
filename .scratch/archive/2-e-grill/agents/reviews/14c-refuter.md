

## Repair round 1, refuted

Run on /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14c, base e403a796007171fe3b93b2491577e26c8c18089b. The round's delta was read as the whole diff now (`git diff <base>`, saved to the scratchpad) against `.scratch/2-e-grill/agents/reviews/14c-round-0.diff`. Diffing the two diffs shows that the round changed only these: the term line; `skills/grill/SKILL.md` lines 54, 55, 61, 100, 109, 112, 147, 166, 167, 235 and 236; and the Stops row "A round" (line 304).

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (from the worktree's root)
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = ...'
checks: 10 commands passed
exit=0

Check 2 (each added line of `git diff <base>` written alone to a scratch file, `grep -c -F -x -f <file> <target>`):
  skills/grill/SKILL.md: 20 added lines, each prints 1; the removed base lines (version "1.1.0", the old Stops row) print 0
  plan-terms.md and glossary.md: added term line 1, base term line 0 in each
  lines the round replaced: "wherever it stands under" 0; old line 61 text 0; old line 54 text 0; "with the ruling quoted as written" 0; "and that no ruling of the user sets aside" 0 in both term files
  each new line 54, 55, 61, 100, 109, 112, 147, 166, 167, 235, 236 stripped of its indent is found once in 14c-round-1.md (grep -c -F prints 1 for each); at its stated indent each is at the line the round names (python byte comparison: 5 sp line 55, 3 sp line 147, 5 sp line 61, 7 sp line 54, 5 sp line 100, 7 sp line 109, 7 sp line 112, 7 sp line 235, 5 sp line 236, 4 sp lines 166 and 167)
  Stops cell at line 304 equals the round's quoted cell: True
  brief item 1 lines 53, 56, 57, 58, 59, 60, 62 with the fence's three spaces: each found once in 14c.md
  term line equals brief item 3 with round item 8's substitution: True; plan-terms.md:14 and glossary.md:19 byte-equal (cmp)
Check 3: main's three files equal the base (`git diff <base> --stat` on main for the three paths prints nothing); diff -U2 main-copy vs worktree for skills/grill/SKILL.md gives the same +/- lines as `git diff <base>` (DIFF-U2-EQUALS-GITDIFF); plan-terms.md and glossary.md each show only the term line replaced.
Check 4: LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md: no output, grep exit=1
Check 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary: ok: the plan-terms block equals the template, exit=0
git status --short (worktree): M docs/glossary.md, M skills/grill/SKILL.md, M skills/repo-setup/templates/plan-terms.md, ?? .scratch/2-e-grill/agents/reviews/14c-report.md

Commands the round's report quotes, rerun in /Users/axelfaes/workspace/ordo/.scratch:
$ find . \( -name plan.md -o -path "./rulings/*.md" \) | sort
  the same 12 files as the report (4 open plans, 7 archived plan.md files including archive/1-.../inventories/plan.md, rulings/3-the-writing-base.md)
$ per file: grep -n -E '\(the user\)\.?[[:space:]]*$' | grep -i -E 'set aside|thrown out|throw out|stopped|stops|redone|redo\b|restart'
  2-e-grill/plan.md:82, 96, 107, 108, 122, 132; archive/2-b/plan.md:98, 100; archive/2-c/plan.md:30, 38; archive/2-d/plan.md:38 (same list as the report)
$ find 2-e-grill/agents -name plan.md | wc -l
       0
$ find . -maxdepth 3 -type d -name '3-*'
  (no output)
$ grep -n -E "^# Plan: |^## Rulings" (2-c plan.md and the brief input copy)
  2-c:1 "# Plan: 2.C Scripts compute facts, and /writing is removed", 2-c:28 "## Rulings (2026-09-28)", copy:1 "# Plan: 3 The writing base", copy:29 "## Rulings (2026-09-28)"
$ grep -n -i replac 14c-input/3-the-writing-base-plan.md
  (no output, exit 1)
Bullet counts (awk over the ## Rulings section, lines ending "(the user)"): the copy without lines 45 and 46 holds 14, the full copy 16 (the report's 14, and 13 left after Question 1 in K7)
archive/1-.../inventories/plan.md: "# Rule inventory: plan", no ## Rulings, 0 "(the user)" bullets
```

The report's quoted outputs match these reruns.

### Verdicts

Items of the brief's "What to build" (whole diff since the base):

- 1: holds. `skills/grill/SKILL.md` lines 53, 56 to 60 and 62 equal the brief's block at their indents. Lines 54, 55 and 61 are the brief's lines as round items 3 and 1 replace them.
- 2: holds. Line 147 is the brief's line after the old line 133, as round item 2 replaces it.
- 3: holds. `skills/repo-setup/templates/plan-terms.md:14` equals the brief's text with round item 8's substitution.
- 4: holds. `docs/glossary.md:19` equals plan-terms.md:14 (cmp), and the sync check prints ok.
- 5: holds. Line 5 reads `version: "1.2.0"`.

Items of the round's brief:

- R1: holds, line 55.
- R2: holds, line 147.
- R3: holds. Line 61 at five spaces and line 54 at seven.
- R4: holds. The cell at line 304 is as given.
- R5: holds. Lines 100, 109, 112 and 235 are each under the rule the round names, two spaces further in.
- R6: holds. Line 236 is at five spaces after line 235, and line 166 is at four spaces after line 165.
- R7: holds. Line 167 is at four spaces after line 166.
- R8: holds. The term line is changed in both files, and the two lines are equal.

Cases. Each was walked by me on the changed text, on the ledger in the main checkout as it stands (the brief input copies included), with the placements each case states:

- K1: met.
  - Placed at `.scratch/archive/3-the-writing-base/plan.md`, plan 3's title matches line 52.
  - Under line 55, two bullets are rulings of the user: the placed line 45 ("Open item J and the review of Ordo") and `archive/2-c-.../plan.md:30`. Each is a bullet of a `## Rulings` section of a `plan.md`. The brief input copy is no longer a ruling, since it is not a `plan.md`.
  - Both say "plan 3 stops at step 5 ... thrown out ... roadmap entry 3 is redone" (line 56).
  - Plan 3's Rulings are first dated 2026-09-28, the same date, and both rulings name plan 3, so the plan stood (lines 57 and 58).
  - Under line 53 no bullet of plan 3 is carried, Question 2 included.
  - D3 of `.scratch/rulings/3-the-writing-base.md:5` settles where the prose standard lives (line 99), and the rest is asked.
  - No rule clash is raised between D3 and plan 3's Question 1 (line 112).
  - Round 1 lists plan 3 with both rulings quoted and each `<path>:<line>` (line 147), and line 304 names that list.
- K2: met.
  - The case's premise says "no 2.C ruling", which allows `2-c/plan.md:30` to be taken out of this walk.
  - With the copy without lines 45 and 46 placed, no bullet of a `## Rulings` section of a `plan.md`, and no bullet of a rulings file, says that plan 3 is set aside, thrown out or stopped, or that entry 3 is redone. The remaining ledger hits were read in full: 2-e:82, 96, 107, 108, 122 and 132; 2-b:98 and 100; 2-c:38; 2-d:38.
  - Line 53 is therefore not reached, and the 14 bullets are carried (line 52).
  - For 2-c:32, see "Declined to judge".
- K3: met.
  - The 2.D title matches line 52, and its 8 bullets are at lines 35 to 42.
  - No ruling sets plan 2.D aside. 2-e:96's "2.D's stops" counts stops of the approval kind, and 2-d:38 speaks of a side of a comparison that stops.
- K4: met. `2-b/plan.md:98` names entry 3 (line 50) and sets nothing aside (line 56).
- K5: met. A plan whose Rulings are first dated 2026-10-01 did not stand on 2026-09-28 (line 58), and line 59 keeps the 2.C ruling from setting it aside.
- K6: met.
  - Line 61's first clause: once a later ruling Z replaces "The review of Ordo", 2-c:30 sets nothing aside.
  - Line 61's second clause: the placed line 45 is dated 2026-09-28 and sets the same plan aside, so it no longer sets it aside either.
  - Plan 3's bullets are carried again (line 52).
- K7: partial (Proof 1).
  - Met part: line 60 sets aside only Question 1, and lines 53 and 54 make that bullet settle nothing.
  - Missing part: on the ledger as it stands, `2-c/plan.md:30` sets plan 3 aside whole (lines 55 to 58), so "plan 3's other (the user) bullets are carried" does not follow.
  - K7's premise does not remove the 2.C ruling, unlike K2's.
- K8: met. Under lines 62 and 100 the "carried from" bullet settles nothing, and its decision is asked (line 99). Line 236 removes it.
- K9: met.
  - Line 54: the bullet replaces no ruling, since the ruling it names does not set its own plan aside.
  - Line 109 keeps the named ruling as the one carried.
  - Line 107 read alone gives the opposite result (Standards 1).
- K10: met. `ok: the plan-terms block equals the template`, exit 0.
- K11: met.
  - Line 54's exception: Y, a bullet of P2, replaces X, the ruling that set P2 aside.
  - Line 61: X then sets nothing aside, so P2 stands and Y is an ordinary carried bullet.
  - Either starting reading reaches the same state, so the two results the first report found are gone.
- K12: met. Under lines 62 and 100 the bullet settles nothing, so its decision is asked. Lines 235 and 236 remove it at the first write of Steps 8, and line 166 lists the removal.
- K13: met. With an empty frontier no round is sent (line 149). Steps 10 at line 167 lists the set-aside plan "as the first round lists it", with its rulings.

Findings of the first report, each checked against the delta:

- Spec 1 (the singular "the ruling" at line 144, and the list not limited to the entry): closed by line 147, which says "each ruling that sets it aside" and limits the list to plans "whose bullets would otherwise be carried rulings for the entry". K1 is met.
- Spec 2 (K6): closed by line 61's second clause. K6 is met on K1's input.
- Proof 1 (walks that ignored the brief input copy): closed. Line 55 now reads only `## Rulings` sections of a `plan.md` and rulings files, and the rerun `find 2-e-grill/agents -name plan.md | wc -l` prints 0. The new walks raise a new Proof finding on K7 (Proof 1 below).
- Standards 1 (the sense of "ruling" at line 55): closed. The sense now matches `docs/glossary.md:98`: a line ending "(the user)" in the Rulings section of `plan.md`, or one bullet of the Rulings or the rulings file.
- Standards 2 (Stops row "A round"): closed by line 304.
- Standards 3 (exceptions kept away from the rules at lines 99, 107, 109 and 229 of the base): closed for the four rules the round named, by lines 100, 109, 112 and 235. Two more rules of the same kind remain (Standards 1 below).
- Standards 4 (lines 53 and 54 against line 61, the K11 shape): closed by line 54's exception. K11 is met.
- Standards 5 (the term's qualifier covered every carried ruling): closed. The term now says "that is no bullet of an archived plan a ruling of the user sets aside", which matches lines 53 and 60.
- Standards 6 (a dead "carried from" bullet stays in the rulings file and `/plan` copies it): closed by lines 236 and 166 for every run of `/grill` on the entry.
- Behaviour 1 (the set-aside list is never shown when the frontier is empty): closed by line 167. K13 is met.

None of these closures removes a check instead of fixing what it guarded. Each changed line is one the round dictated, and nothing reaches beyond it.

### Findings

Spec: none.

Proof:

1. `.scratch/2-e-grill/agents/reviews/14c-report.md`, "Repair round 1", its first line and walk K7.
   - Quoted: "Every item ... is done, every check below ran, and K1 to K13 are met." and "the case states no 2.C ruling for this walk, as K2 does, so `2-c plan.md:30` is out of the ledger".
   - What is wrong: the round brief says to walk "with the ledger in the main checkout as it stands". K7's premise ("A ruling that sets aside part of a plan ... only Question 1 is set aside; plan 3's other "(the user)" bullets are carried") says nothing about the 2.C ruling. K2's premise does say "no 2.C ruling".
   - On the ledger as it stands, `archive/2-c-.../plan.md:30` is a ruling of the user (line 55). It says plan 3 "stops" and entry 3 "is redone" (line 56), and it names plan 3 on the same date (line 58), so plan 3 is set aside whole. My rerun therefore does not reproduce "Met" for K7.
   - The builder states the narrowing under "Not done, and readings", but the round's first line still says all cases are met.
   - The text of `grill` gives the right result: a ruling that sets one bullet aside does not bring back a plan that another ruling set aside whole. The defect is in K7's premise, not in the skill.
   - Decision resting on it: whether K7 counts as met when the step lands. The fix is the orchestrator's: a cases ruling that gives K7 the premise "no 2.C ruling", as K2 has, under which my walk gives met. No text changes.
   - Failure scenario: the landing books K7 as met on the real ledger. A reader of the booking takes it as shown that, on today's ledger, setting aside plan 3's Question 1 leaves plan 3's other rulings carried. `/grill 3` with plan 3 archived carries none of them.
   - Verdict: K7 partial.

Standards:

1. `skills/grill/SKILL.md:107` and `:110`, against `:54`.
   - Line 107: "     - A carried ruling that a later ruling names as the one it replaces settles nothing."
   - Line 110: "     - A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file, a carried bullet included, replaces every carried ruling that settles the same decision."
   - What is wrong: both rules take "a later ruling" to include a bullet of a set-aside plan, since line 55 makes such a bullet a ruling of the user. Line 54 says such a bullet "replaces no ruling except a ruling that sets its own plan aside".
   - The exception sits under line 108 (line 109) and in "What it reads" 6, not under lines 107 or 110. The round placed exceptions under four rules, and these two rules of the same kind have none.
   - This breaks `docs/dev/skill-layout.md`, "Lists and tables" ("a qualifier that changes the rule ... stays in the same bullet as the rule"), and rule 19 of `docs/dev/change-standard.md` ("A change leaves no two statements that contradict each other"). The first report did not list these two lines either.
   - Failure scenario: an archived plan P of entry E is set aside, and its bullet Y, dated after a live carried ruling C, reads "... replacing C (the user).".
     - A session that follows line 107 treats C as settling nothing and asks C's decision again.
     - Where Y names a bullet of the entry's rulings file, a session that follows line 110 drops every carried ruling on that decision.
     - Line 54 keeps both in force.
   - A fix at landing: a sub-bullet at seven spaces under line 107 and one under line 110, worded as line 109 is, "A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says".
   - Verdict: none. K9 is met because its walk reads line 109, but line 107 read alone gives the opposite result.

Behaviour: none.

### Declined to judge

- **`archive/2-c-.../plan.md:32` and plan 3's own line 46.** These are two rulings that plan 3's "ledger folder is deleted from the tree, not archived". The builder's word grep does not find them, and its walks of K2 and K7 do not address them.
  - My reading: neither one says that plan 3 is set aside, thrown out or stopped, or that entry 3 is redone (line 56). They decide where the folder goes, so they set nothing aside, and K2 stays met.
  - Line 56 is judged by reading, and a reader who takes "deleted" as "thrown out" would get K2 unmet. What would settle it is a sentence from the orchestrator on whether a disposal ruling of that kind sets a plan aside.
- **Line 61's second clause when a partial set-aside is reversed.** The clause reads "any other ruling that sets the same plan, bullets or steps aside and is dated no later than the ruling replaced".
  - Shape: a later ruling W sets aside only Question 1 of a plan that an earlier ruling X set aside whole, and Z replaces W.
  - One reading counts X among the rulings that set "the same ... bullets" aside, which brings back the whole plan. That reading goes against the round's ruling, "the latest ruling of the user on whether a plan stands decides".
  - The text is dictated, no case has this shape, and none is on the tree. It is the orchestrator's call whether the shape is real.
- **Line 167 has no limit of its own.** "List each archived plan a ruling sets aside, as the first round lists it (Steps 6)" does not repeat line 147's limit to plans whose bullets would be carried for the entry. I read "as the first round lists it" as bringing in line 147 whole, so I raise no finding.
- **The Stops row "The end" (line 305).** It does not name the two new lists of Steps 10 (lines 166 and 167). The row already left out several lists of Steps 10 at the base (entries changed under a quoted ruling, term clashes, `/roadmap add`), so it reads as a summary, and the change does not make it false in a new way.
- **The same rule in several places.** The "settles nothing" rule is stated at lines 62, 100 and 235, and the "replaces no ruling" rule at lines 54 and 109. This is against `docs/dev/skill-layout.md`, "Where a rule goes" ("A rule is written once"). The round dictated the copies to meet the qualifier rule of "Lists and tables"; each copy names its section and they agree now. How to weigh the two layout rules against each other is the orchestrator's call.
- **A bullet of a set-aside plan that sets another plan aside.** Line 54 says such a bullet settles nothing and replaces nothing. It does not say whether the bullet can still set a different plan aside.
  - No bullet on the tree has this shape: plan 3's line 45 sets only plan 3 aside.
  - It is a design question for the user and has no case.
- **Line 236 removing a bullet that a step tag names.** Line 236 removes a "carried from" bullet from an open plan's Rulings, and a step's `(ruling <name>)` tag may name that bullet. No step on the tree does. Line 166 shows the removal with its `<path>:<line>`, and `/spec` would refuse the step rather than go on.
- **The main checkout's copy of the report.** It is byte-equal (cmp) to the worktree copy, and main's `git status --short` shows it modified. A read cannot tell who wrote the main copy.

Reviewer usage: tokens and minutes not visible to me; about 35 tool uses.
