# Step 14c refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14c, base e403a796007171fe3b93b2491577e26c8c18089b)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (from the worktree's root; exit=0)
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 10 commands passed

Verify 2 (each added line of `git diff <base>` written alone to a scratch file, `grep -c -F -x -f <file> <target>`): 14 added lines; each prints 1 in its file (12 in skills/grill/SKILL.md, 1 in plan-terms.md, 1 in docs/glossary.md, the term line counted in both).
Byte comparison with the brief: item 1's fenced block (indent of three removed) against `sed -n 53,62p skills/grill/SKILL.md` -> ITEM1-SAME; item 2 text equals line 144; item 3 text equals plan-terms.md:14 -> ITEM3-SAME; glossary.md:19 equals plan-terms.md:14 -> ITEM4-SAME.
Verify 3: diff -U2 /Users/axelfaes/workspace/ordo/<file> <file> for the three files shows only: version 1.1.0 -> 1.2.0; ten + lines after line 52; one + line after the old line 133; the term line replaced in plan-terms.md and glossary.md.
Verify 4: LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md -> no output, grep exit=1
Verify 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary -> ok: the plan-terms block equals the template, exit=0
git status --short (worktree): M docs/glossary.md, M skills/grill/SKILL.md, M skills/repo-setup/templates/plan-terms.md, ?? .scratch/2-e-grill/agents/reviews/14c-report.md

Commands the report quotes, rerun:
$ grep -rnE '\(the user\)\.?[[:space:]]*$' --include='*.md' . | grep -iE 'set aside|thrown out|throw out|stopped|stops|redone|redo\b|restart'   (in the main checkout's .scratch/)
archive/2-d-.../plan.md:38, archive/2-c-.../plan.md:30, archive/2-c-.../plan.md:38, archive/2-b-.../plan.md:98, archive/2-b-.../plan.md:100, 2-e-grill/plan.md:82, 96, 107, 108, 122, 132, 2-e-grill/agents/briefs/14a-input-833e2e8/2-e-grill-plan.md:79, 93, 104, 105, 119, 2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:45, 2-e-grill/agents/reviews/14c-report.md:228 (not a bullet)
$ grep -rn 'carried ruling' skills docs README.md utils -> skills/grill/SKILL.md (22 lines), skills/repo-setup/templates/plan-terms.md:14, docs/glossary.md:19; nothing else
$ grep -rn -i 'set aside' skills docs README.md utils -> skills/plan-retro/SKILL.md:57,70,72; skills/grill/SKILL.md:56,59,62
$ wc -l -> worktree 323 / 120 / 137; main 312 / 120 / 137 (grill, plan-terms, glossary)
Premise "entry 3 has no plan folder": ls -d .scratch/3-* .scratch/archive/3-* -> no matches (read with ls; the reviewer runs no git ls-tree)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `skills/grill/SKILL.md:53-62` equal the brief's block byte for byte at five and seven spaces (ITEM1-SAME), each present once (Verify 2).
- 2: holds. `skills/grill/SKILL.md:144` equals the brief's line at three spaces, after line 143.
- 3: holds. `skills/repo-setup/templates/plan-terms.md:14` equals the brief's text (ITEM3-SAME).
- 4: holds. `docs/glossary.md:19` equals plan-terms.md:14 and the sync check prints ok.
- 5: holds. `skills/grill/SKILL.md:5` reads `version: "1.2.0"`.

Cases of the brief's "Cases" (each walked on the changed text in the main checkout's ledger as it stands):

- K1: partial. Walk: plan 3's title "# Plan: 3 The writing base" matches line 52; `2-c/plan.md:30` and plan 3's own line 45 are rulings of the user (line 55) that say "plan 3 stops at step 5" and "roadmap entry 3 is redone" (line 56); plan 3's Rulings are first dated 2026-09-28, the same date, and both name plan 3, so it stood (lines 57, 58); line 53 makes none of its bullets a carried ruling for any entry, Question 2 included; `.scratch/rulings/3-the-writing-base.md:5` (D3) still settles where the prose standard lives (line 99), and the rest are asked. That part is met. The missing part is round 1's list: line 144 says "with the ruling quoted", singular, which does not require both rulings, and line 55 also makes the brief input copy `.scratch/2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:45` a third "ruling of the user" to quote. Spec 1, Standards 1.
- K2: unmet. With the copy without lines 45 and 46 placed and no 2.C ruling, line 55 still reaches `.scratch/2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:45` ("plan 3 stops at step 5 ... roadmap entry 3 is redone ... (the user)."), dated 2026-09-28 and naming plan 3, so lines 56 to 58 set plan 3 aside and line 53 carries none of its bullets. Standards 1, Proof 1.
- K3: met. `archive/2-d-.../plan.md` title matches line 52; the rerun grep finds no ruling under the ledger that says plan 2.D is set aside, thrown out or stopped or entry 2.D redone (2.D line 38's "stops" is a side of a blind comparison); its 8 bullets at lines 35 to 42 (`grep -n -E '\(the user\)\.?$'`) are carried.
- K4: met. `archive/2-b-.../plan.md:98` "then entry 3; no restart (the user)." names entry 3 (line 50) and says no plan is set aside or entry redone (line 56).
- K5: met. A later plan of entry 3 first dated 2026-10-01 did not stand on 2026-09-28 (line 58), and line 59 keeps it from being set aside by the 2.C ruling and by the brief input copy of line 45, both dated 2026-09-28.
- K6: unmet. Line 61 lifts only the ruling the later ruling names ("The review of Ordo", `2-c/plan.md:30`). On K1's input, plan 3's line 45, named "Open item J and the review of Ordo", still sets plan 3 aside; on the copy without it, the brief input copy's line 45 does (line 55). Either way plan 3's bullets are not carried again. Spec 2, Standards 1, Proof 1.
- K7: partial. Line 60 gives "only Question 1" for the ruling "plan 3's Question 1 is set aside (the user).". The missing part is that the other bullets are not carried on this tree, since the brief input copy's line 45 (line 55) sets plan 3 aside whole. Standards 1, Proof 1.
- K8: met. Line 62: the "carried from" bullet settles nothing, so line 99 ("A decision that a line ... settles") does not mark the decision settled and it is asked. The placement defect is Standards 3.
- K9: met. Line 54: a bullet of the set-aside plan "replaces no ruling", so the ruling it names stands. Lines 106 and 107 read alone give the opposite result (Standards 3).
- K10: met. `ok: the plan-terms block equals the template`, exit 0.

## 1. Spec

- `skills/grill/SKILL.md:144`, item 2 against case K1: "   - The first round also lists each archived plan a ruling sets aside, whole or in part, with the ruling quoted as written and its `<path>:<line>`." What is wrong: K1 expects round 1 to quote both rulings that set plan 3 aside, but "the ruling" is singular, so a plan set aside by two rulings is listed with one of them. "Each archived plan a ruling sets aside" is also not limited to the plans whose bullets `grill` would otherwise carry for the entry. The builder reported the first point (its point 2). Failure scenario: on `/grill 3` a session following the line quotes only `2-c/plan.md:30` and leaves out plan 3's own line 45. On `/grill 2.D`, with plan 3 archived, round 1 lists plan 3 as set aside although no bullet of plan 3 names 2.D. Verdict: K1 partial.
- Brief case K6 against `skills/grill/SKILL.md:61` and plan 3's line 45: "     - A ruling that a later ruling names as the one it replaces sets no plan aside." What is wrong: the case expects "plan 3's bullets are carried again" when a later ruling replaces "The review of Ordo". Plan 3 is set aside by two separate bullets of the same user decision, `2-c/plan.md:30` "The review of Ordo" and plan 3's line 45 "Open item J and the review of Ordo". The replacement names one of them, so the text keeps plan 3 set aside. The builder walked K6 on the copy without line 45 and noted this (its point 3). Either the case or the text needs to change: the case to name both bullets, or the text to say that one decision booked in two places is lifted by naming either. Failure scenario: the user reverses the review of Ordo by naming 2.C's ruling, and `/grill 3` still asks every decision of plan 3 again. Verdict: K6 unmet.

## 2. Proof

- `.scratch/2-e-grill/agents/reviews/14c-report.md`, first line and walks K2, K6 and K7: "Lines 55 and 56 over the ledger with `2-c plan.md:30` absent: no ruling of the user says plan 3 is set aside ... (the grep above printed nothing over the copy)." and "Line 56 finds no other ruling that sets plan 3 aside". What is wrong: the report's own grep, rerun above, lists `2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md:45` under the ledger root. Line 55 makes that bullet a ruling of the user "wherever it stands under `<ledger_root>/`". The walks checked only the placed copy. The decision that rests on this claim is the case verdicts and the first line "no case K1 to K10 is unmet", on which the orchestrator decides whether the step lands without a repair round. Failure scenario: the orchestrator lands the step as met on K2, and on main the control input gives the result of K1. Verdict: K2 unmet, K6 unmet, K7 partial.

## 3. Standards

- `skills/grill/SKILL.md:55`: "     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, wherever it stands under `<ledger_root>/`, the archived plan it sets aside included." What is wrong: this gives the glossary term "ruling" a new sense without a plan-terms entry, against `docs/dev/skill-layout.md`, "Writing for an agent" ("A term that `docs/glossary.md` defines is used only in a sense it defines there"). `docs/glossary.md:98` defines a ruling as the user's decision, "written in the Rulings section of `plan.md`", or "one bullet of the Rulings or the rulings file". Line 55 counts every such bullet anywhere under the ledger, while line 50 reads carried rulings only from `## Rulings` sections and rulings files. On this tree that takes in brief inputs and review reports (`grep -c` of "(the user)" bullets): `14c-input/3-the-writing-base-plan.md` 16, `14a-input-833e2e8/2-e-grill-plan.md` 34, `reviews/11-report.md` 13 (scratch "G1: the scratch answer one (the user)."), `reviews/12-report.md` 5. Failure scenario: a copy made for a case sets a real plan aside. Here the brief input copy of plan 3's line 45 makes K2 fail, keeps K6 and K7 from being met, and appears in K1's round 1 as the user's ruling. After 2.E is archived the copy stays under `.scratch/archive/`, which is still under the ledger root. Verdict: K1 partial, K2 unmet, K6 unmet, K7 partial.
- `skills/grill/SKILL.md:297`, Stops row "A round", column "What it shows": "The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle". What is wrong: item 2 makes the first round also list the archived plans a ruling sets aside, so this cell no longer lists all the round shows. This breaks rule 14 of `docs/dev/change-standard.md` ("A sentence in a document or a head comment that the change makes false is a defect of the change"). The builder reported it (its point 1). Failure scenario: a reader who checks the round against the Stops table takes the set-aside list for a surplus and leaves it out. Verdict: none. A fix at landing is possible: "..., and in the first round the decisions carried rulings settle and the archived plans a ruling sets aside".
- `skills/grill/SKILL.md:54` and `:62`: "       - Such a bullet settles no decision and replaces no ruling." and "     - A bullet of the entry's Rulings or rulings file that reads "carried from" a bullet now set aside settles nothing." What is wrong: these are exceptions to the rules of Steps 3 on what settles a decision and what replaces a ruling, but they sit in "What it reads" 6, and nothing in Steps 3 points to them. The following lines stay unqualified:
  - line 99: "A decision that a line of the Rulings or the rulings file settles ... is marked settled";
  - line 107: "Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried";
  - line 109: a carried ruling that contradicts "a bullet of the entry's Rulings or rulings file" is a rule clash;
  - line 229: "a bullet carried in an earlier session included".

  This breaks `docs/dev/skill-layout.md`, "Lists and tables" ("a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule") and "Where a rule goes". Failure scenario: after plan 3 is set aside, the rulings file still holds a "carried from" bullet. A new carried ruling that contradicts it is raised by line 109 as a rule clash against a bullet that line 62 says settles nothing, and the user is asked to choose between a live ruling and a dead one. Reading line 107 alone, a set-aside bullet that names a ruling becomes "the one carried" (K9). Verdict: none. K8 and K9 are met only when lines 54 and 62 are read as the exceptions.
- `skills/grill/SKILL.md:53-54` against `:61`, a ruling of one plan replaced by a ruling of the plan it set aside (the builder's point 4). What is wrong: ruling X of plan P1 names P2 as set aside, and a later bullet Y of P2 reads "... replacing X (the user).". Line 61 says X then sets no plan aside, so Y counts. Lines 53 and 54 say Y is a bullet of a set-aside plan and "replaces no ruling", so X stands. The text gives both results, against rule 19 of `docs/dev/change-standard.md` ("A change leaves no two statements that contradict each other"). Failure scenario: the user revives a plan by booking the reversal in that plan's own Rulings, and two sessions of `/grill` on the same tree reach opposite design trees. Verdict: none. No case has this shape.
- `skills/repo-setup/templates/plan-terms.md:14` and `docs/glossary.md:19` against `skills/grill/SKILL.md:53`, `:56`, `:60`: the term says "... or of the Rulings of an archived plan of that entry, and that no ruling of the user sets aside". What is wrong: the qualifier covers every carried ruling, including one from another open plan's Rulings or another rulings file (line 50). The skill defines setting aside only for "a bullet of an archived plan" (line 53) and "named bullets or steps of an archived plan" (line 60), and line 51 carries every other bullet with no exception. The term and the skill disagree, against rule 19 and `docs/dev/skill-layout.md`, "Writing for an agent". Failure scenario: a later ruling says a bullet of entry 4's rulings file that names entry 3 is set aside. A reader of the glossary treats that bullet as no carried ruling, while `/grill 3` following line 51 carries it and marks its decision settled. Verdict: none.
- `docs/glossary.md:99` ("**rulings file**: ... which holds the user's settled design answers for a roadmap entry, one bullet line each ... `/plan` copies its bullet lines into the new plan's Rulings") and `skills/plan/SKILL.md:68` ("Each bullet line (`- ...`) of the rulings file ... is copied into the Rulings section as it stands"), against `skills/grill/SKILL.md:62`. What is wrong: after the change, the rulings file can hold a "carried from" bullet ending "(the user)" that settles nothing. `/plan` copies it into the new plan's Rulings as a ruling, and the glossary sentence "holds the user's settled design answers" becomes false for it. This breaks rule 14 of `docs/dev/change-standard.md`. Failure scenario: `/grill 3` after plan 3 is set aside asks the prose-standard decision again and writes a new D-bullet beside the stale "carried from" bullet. `/plan 3` then copies both into plan 3's Rulings, where `/spec` reads two contradictory "(the user)" rulings on one decision. Verdict: none.

## 4. Behaviour

- `skills/grill/SKILL.md:144` with `:146` and `:162`: "   - When the frontier is empty, no round is sent and the turn does not end ..." and "      - The decisions carried rulings settle are listed among them, each with its carried ruling's `<path>:<line>`, those of an interview whose first pass found no frontier included." What is wrong: the list of set-aside plans exists only in the first round, and when the frontier is empty no round is sent. Steps 10 shows the carried-ruling decisions for that case but not the set-aside plans. The report's before and after for "What round 1 shows" does not say that the set-aside list is never shown in that case. The brief's decision 6 wants the user to see why the old plan's decisions are asked again, and why its rulings no longer count. Failure scenario: the entry's rulings file settles every decision, and an archived plan of the entry, set aside by reading, held a ruling that would have raised a rule clash with that file. The frontier is empty, the clash is never asked, and the user is never told that `grill` judged the plan set aside. Verdict: none.

## Declined to judge

- The builder's read-only `git ls-tree` in the main checkout. None of the four headings covers it: a heading's findings are about the diff and the report's claims, and this command changed neither. Main's `git status --short` shows only ` M .scratch/2-e-grill/orchestrator-state.md` and `?? .scratch/2-e-grill/agents/reviews/14c-report.md`, and the report states the command. It does break the brief's "The builder runs no git command" and the rules file's "Where the work happens" (the worktree, never the main checkout, and reading limited to `git status`, `git diff` and `git show`). Against that, the brief's own premise quotes this same command as its evidence. How much weight to give the breach is the orchestrator's call.
- The report exists in both the worktree and the main checkout, and the two copies are byte-identical (`cmp`). The main copy's mtime is 22:25:28 and the worktree copy's is 22:25:14. A read cannot tell whether the builder or the orchestrator wrote the main copy.
- Whether a ruling that names a step ("plan 3 stops at step 5") sets aside the whole plan (line 56) or only that step's bullets (line 60). On K1 the redo clause sets plan 3 aside in either reading, so no case depends on it, and I raise no finding.
- Sentence length of lines 55 and 58 (about 33 and 37 words) against the prose standard's "Sentence shapes". They are definitions whose conditions all count, which the standard's "unless the mechanism needs more" allows, so I raise no finding.
- Whether the date limit of line 57 holds for a plan whose Rulings carry no date. Every plan's Rulings heading on this tree carries a date (grep of `^## Rulings` over every plan.md), so no case on the tree reaches it.

Reviewer usage: tokens not visible to me, about 32 tool uses, minutes not visible to me.
