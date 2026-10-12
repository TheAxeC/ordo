# Step 1 brief check (on main at f865e7c, plus the uncommitted brief `.scratch/2-f-diagnose/agents/briefs/1.md` and the added Rulings line in `.scratch/2-f-diagnose/plan.md`)

The brief-check agent's report for `agents/briefs/1.md`. I changed nothing in the repository. The only files I wrote are a scratch export under my session scratchpad (`.../scratchpad/bc1`), used for one `git apply --check`.

## 1. Names

- `diagnose`, `/diagnose`, `diagnosis.md`, `-diagnosis`: `git grep -n -E 'diagnosis\.md|-diagnosis|/diagnose' -- .` finds hits only in `.scratch/2-f-diagnose/plan.md:21,22,23,35` and `.scratch/plan-drafts/2-f-diagnose.md:21-23`. These are ledger text that describes the step, and the change makes none of them false. `git grep -n -i diagnos -- . ':!.scratch/archive'` adds `docs/roadmap.md:28,31,32` (the entry), `skills/plan-orchestration/SKILL.md:100` ("is diagnosed by the orchestrator, read-only", which step 2 changes; it is not false after step 1) and `skills/repo-setup/templates/docs/dev/prose-standard.md:3` ("shipped diagnostics", a different sense). No hit is made false.
- `red command`, `shrunk case`, `diagnosis record`, `hypothesis`: `git grep -n -i -E 'red command|shrunk case|diagnosis record|\bhypothes[ie]s\b' -- . ':!.scratch'` finds only `docs/roadmap.md:32` (the gate, in the same sense). No hit is made false.
- `probe`: `git grep -n -w -i probe -- skills docs README.md` finds `docs/glossary.md:64` and `skills/repo-setup/templates/plan-terms.md:59` (premise: "checked by `/spec` with a grep or a probe") and `skills/spec/SKILL.md:49` ("Each is checked with a grep or a probe"). In those places a probe is any command run to check the tree. Item 3 defines **probe** in the diagnose sense (one change tied to one hypothesis). Under `docs/dev/skill-layout.md` "Writing for an agent" ("A term that `docs/glossary.md` defines is used only in a sense it defines there"), the three existing uses then use the term in a sense the glossary does not define.
- `case`: `docs/glossary.md:19` defines **case** as an example under a brief's "Cases", and a second sense as a real instance on which a brief's format decision is run. The skill will use "the case", "each part of the case", "the original unshrunk case" and "a slow case" for the reproduction scenario, which is a third sense. `skills/plan-orchestration/SKILL.md:100` already says "a slow case" in that undefined sense. Item 3 adds only **shrunk case**.
- `booking` and `finding`: `docs/glossary.md:14` defines **booking** as the record `/land` appends to `plan.md` (and a ledger record of a ruling or stop). `docs/glossary.md:36` defines **finding** as a defect a reviewer reports. Item 1 uses "the cause written in the booking" for the by-hand run, where it means "the commit's last bullet". It also says "written as a finding in the booking" for a place no test can reach, where no reviewer is involved. Both are new senses with no entry.
- Paths shared with work in flight: `sed -n '/^dispatch:/,/^```/p' .scratch/2-e-grill/orchestrator-state.md` shows 2.E step 12a in flight (base ef5d3a9, `landing: not-started`). Its brief's "Paths this step writes" includes "`docs/glossary.md` ("Ordo's own terms" only)", and this brief writes `docs/glossary.md` (the plan-terms block). `.scratch/2-f-diagnose/orchestrator-state.md` "Where things are" says: "a step of this plan whose paths meet a 2.E step in flight waits for it to land." The brief says nothing about this.
- Left to step 2 (README, `ordo-help`, `plan-orchestration`): nothing on main breaks between the two landings.
  - `README.md:11-23` (the skill table) and `README.md:86` (the copy loop listing eleven skills by name) become incomplete, not false.
  - `npx skills add ... --skill '*'` (`README.md:64`) would install `diagnose`, while the copy loop would not.
  - No check lists the skills. `utils/check_coverage.py` works only on named folders. The verify list (`.scratch/2-f-diagnose/orchestrator-state.md` yaml) runs 8 commands, none of which lists `skills/`.
  - `skills/ordo-help/SKILL.md` "Use instead" (lines 21-25) states nothing that becomes false.

Findings:
1. The **probe** entry makes `skills/spec/SKILL.md:49` and the premise entry (`docs/glossary.md:64`, `plan-terms.md:59`) use "probe" in an undefined sense. The brief should have item 3's entry keep both senses: the diagnose sense, and "also a command run to check a claim about the tree, as `/spec` checks a premise. Stated in: `spec`, 'What it reads' 5". The other option is a different word for the diagnose sense.
2. **case** in the diagnose sense (the reproduction scenario, its parts, the unshrunk case, a slow case) has no entry. The brief should add a sense entry to item 3 ("case, of a diagnosis", as `docs/glossary.md:113` does for "case, of a skill's description"), or tell the builder to write "shrunk case" and "original case" only as defined terms.
3. **booking** (by hand, the commit's last bullet) and **finding** (a place no test reaches, noted by the diagnosing session) are new senses. The brief should either add both senses to item 3, or reword item 1 so the by-hand record is "the commit message's last bullet" and the untestable place is "a finding of the diagnosis record", with that sense defined.
4. `docs/glossary.md` is shared with 2.E step 12a, which is in flight. The brief should state that step 1 is dispatched only after 12a lands, as the state file's rule says, or that the shared path was judged a simple merge (the plan-terms block against "Ordo's own terms"). Then name `docs/glossary.md` under the dispatch entry's `shared_paths:`.

## 2. The step line

- "`skills/diagnose/SKILL.md`": item 1.
- "(and a template only where a step needs one)": item 2, justified by Decision 4.
- "a red command on the exact symptom, run and quoted, before any hypothesis": item 1, "The red command".
- "the case shrunk until each remaining part is needed for the red": item 1, "The case shrunk".
- "three to five ranked hypotheses, each naming the result that would falsify it, shown to Axel, waiting ... by hand and going on under `plan-orchestration`": item 1, "The hypotheses". See finding 1 on "shown".
- "one change per probe, each probe tied to one hypothesis": item 1, "Probes".
- "the fix with a test that is run red without the fix and quoted, where the defect's failure costs something": item 1, "The fix and its test". See finding 2 on the run inside a plan.
- "the cause written in the booking": item 1, "The cause written in the booking".
- "check: the skill read by Axel ...": not a build item. The brief notes it is pending.
- The plan's Goal:
  - Part 1, "one command red on the exact symptom before any theory": "The red command".
  - Part 2, "the case shrunk": "The case shrunk".
  - Part 3, "three to five ranked hypotheses ... shown to you": "The hypotheses".
  - Part 4, "one change per probe": "Probes".
  - Part 5, "the fix with a test that is red without it": "The fix and its test".
  - Part 6, "the cause written in the booking": "The cause written in the booking".
  - The Goal's last sentence ("`plan-orchestration`'s rule ... points at it") belongs to step 2 by the step list.
  - Step 2's "new terms ... in `plan-terms.md`" is pulled into item 3 by Decision 3.

Findings:
1. "shown to Axel" under `plan-orchestration`. Ruling "Step list" D2 (b) reads "under `plan-orchestration` it shows them and goes on". Item 1 says it "writes them into the diagnosis record and goes on", and nothing puts them before Axel. The brief should name where they are shown, for example quoted in the orchestrator's report or the landing report beside the record's path.
2. "a test that is run red without the fix and quoted", inside a plan. Item 1 says only that "the fix text and the test go into the repair round's ruling". It does not say that the diagnosing session runs the test red without the fix and green with it on the scratch copy, and quotes both before the round is sent. Item 2's template asks for "the failing and passing runs quoted", which nothing inside a plan produces. The brief should require both runs on the scratch copy inside a plan, so the round carries a known fix as "Only known fixes" says.

## 3. Premises

- Step 1's line. `grep -n "^- 1 " .scratch/2-f-diagnose/plan.md` prints two lines, `21:- 1 The \`diagnose\` skill, ...` and `29:- 1 and 2 after 2.E's step 10 ...`. The brief quotes line 21 correctly, but the command does not isolate it.
- The Goal. `sed -n 7p` of plan.md matches the quote word for word.
- Ruling "Step list" D2. `plan.md:34` reads "D2 (a) by hand and (b) under `plan-orchestration`, the lazy option being (b) everywhere". The brief's gloss ("by hand the skill waits ... under `plan-orchestration` it shows them and goes on") matches the plan-draft wording and is consistent.
- `skills/plan-orchestration/SKILL.md:99-105`. `grep -n ''` shows 99 is "**Only known fixes.** Each ruling says what to change." and 100-105 hold the quoted text. The quote matches lines 100-105.
- 2.E ruling "Overnight work" 2. `grep -n "^- Overnight work" .scratch/2-e-grill/plan.md` (line 103) reads: "2: a step whose check is Axel's reading (6, 12, 12a) is built, refuted and landed with that reading pending; each is an open item until Axel approves it ...". The brief says it "covers every step whose check is Axel's reading". The ruling names 2.E's steps 6, 12 and 12a. `git grep -n -i overnight -- .scratch ':!.scratch/2-e-grill' ':!.scratch/archive'` finds nothing in 2.F that extends it, except the new Rulings line, which cites only "Overnight work" 5.
- The change standard's rules 1, 2, 13 and 21 and "Scripts compute facts". `docs/dev/change-standard.md` matches the brief's summaries.
- `diagnosing-bugs`. `wc -l` prints 138. `git -C .../mattpocock-skills log -1` prints `d81f3a1 Merge pull request #1120 ...`. The six-phase summary matches the file. It leaves out:
  - way 2 (curl/HTTP) and way 4 (headless browser);
  - way 10 (HITL script, `scripts/hitl-loop.template.sh`);
  - "Tighten the loop" (faster, sharper, more deterministic: pin time, seed RNG, isolate filesystem, freeze network);
  - Phase 4's tool preference (debugger/REPL first, targeted logs at boundaries, never "log everything and grep");
  - the hypothesis format's second prediction ("<changing Z> will make it worse");
  - "Redact"'s "quote only the lines that carry the signal" and "If the redacted output is not enough ... ask the user".
  See section 5, finding 7.
- `ls skills/diagnose` prints "No such file or directory", as the brief says.
- `git grep -n -i diagnos -- skills docs README.md` prints exactly `docs/roadmap.md:28,31,32`, `skills/plan-orchestration/SKILL.md:100` and `skills/repo-setup/templates/docs/dev/prose-standard.md:3`, as the brief says.
- `docs/dev/skill-layout.md` "Writing for an agent": the quote matches.
- `ls docs/adr` prints `README.md template.md`, as the brief says.
- The dry run's defect (Cases, last-but-one case):
  - `git show db9bbec^:utils/pin.sh | grep -n -i -E 'agent|both|same_folder'` prints only the `~/.agents/skills` lines 27-66. At `db9bbec^` pin.sh has no agent folders and no both-folders refusal at all.
  - `git show db9bbec:utils/pin.sh` has `same_folder` (line 147) and the refusal (line 329). Both came in with step 3 itself.
  - The defective version existed only in step 3's worktree before its repair round 1. It is kept in `.scratch/2-e-grill/agents/reviews/3-round-0.diff`: `grep -n 'both a skill folder'` shows line 477 `+        [ "${dir%/}" = "$agent_dir" ] && fail ...`.
  - `git archive db9bbec^ | tar -x -C <scratch>` followed by `git apply --check .../3-round-0.diff` printed "applies cleanly to db9bbec^".
  - The booking (`grep -n "both-folders"` gives `.scratch/2-e-grill/plan.md:173`) reads: "the both-folders refusal compared paths as spelled (a skill folder `<agents folder>//` moved the pinned worktree before failing)".
  - `.scratch/2-e-grill/agents/reviews/3-refuter.md:29` gives the exact symptom: `${dir%/}` strips one trailing slash while agent folders strip every one, so a skill folder `<HOME>/.claude/agents//` is not refused, status 1, "pinned worktree moved from v3 to v4, links removed and 'the links do not match the pin after linking'".

Findings:
1. The dry-run case names "`utils/pin.sh` at `db9bbec^`", which has no both-folders refusal. The brief should name the defective tree as `db9bbec^` with `.scratch/2-e-grill/agents/reviews/3-round-0.diff` applied (checked above to apply cleanly), exported to `$TMPDIR` with `git archive`. It should quote the symptom from `3-refuter.md` "Spec 1" (a doubled trailing slash not refused, the pinned worktree moved). Plan step 3's text ("at the commit before its fix") carries the same premise; that is for step 3's `/spec`.
2. The premise on "Overnight work" 2 overstates the ruling's text. The brief should quote it as written ("(6, 12, 12a)", steps of 2.E) and state that applying it to 2.F step 1 is an extension not yet booked. The other option is to book that extension in 2.F's Rulings the way Decision 1 is booked (see Declined to judge).
3. The step-line command should be `grep -n "^- 1 The" .scratch/2-f-diagnose/plan.md`, which prints the one line quoted.

## 4. Cases and checks

- `ls skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md`: consistent.
- The description length command: consistent. It currently prints 11 skills, the highest being `spec` at 1022.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: consistent. It prints "ok: the plan-terms block equals the template", rc=0, today.
- Reading against `docs/dev/skill-layout.md`: consistent, but item 1 itself conflicts with the standard it reads against (finding 1).
- Reading against item 1 and the Goal's six parts: consistent.
- Reading against `diagnosing-bugs`: consistent.
- The dry run on paper: inconsistent (finding 2).
- The terms against the glossary: consistent.
- Verify items 1-4: consistent with the change standard's "Commands and their filters" and with "Scripts compute facts" (no script is added, so no test).

Findings:
1. Item 1 has the builder write several rules in two or three sections. `docs/dev/skill-layout.md` "Where a rule goes" says "A rule is written once. Another place that needs it names the section it is in", and its Anti-patterns row "The same rule written in two sections" forbids the rest.
   - "No hypothesis ... before the red command" appears in "The red command", again in Anti-patterns ("a hypothesis before the red command") and again in Rules.
   - "one change per probe" appears in "Probes", Anti-patterns ("two changes in one probe") and Rules.
   - "the cause is written where the booking says" appears in its item and in Rules.
   - "a test written after the fix" and "a guard for a fix" appear in "The fix and its test" and in Anti-patterns.
   - "untagged logging" appears in "Probes" and in Anti-patterns.
   The brief should tell the builder to place each rule once, by "Where a rule goes" (a point of the work goes in the step item; a tempting shortcut goes in Anti-patterns with its reason; a rule that holds throughout goes in Rules), and have the other places name that section. As written, the builder must choose between the brief and the standard.
2. The dry-run case allows "a scratch copy under `$TMPDIR`" of `utils/pin.sh`. A pin-mode run of that copy with the real `HOME` moves `~/.local/share/ordo-stable` and the installed skill links. That breaks the state file's standing demands ("never run `utils/pin.sh <tag>` without asking", and tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`). It also breaks the brief's own "Nothing is written outside the worktree and `$TMPDIR`". The brief should say that any run of the scratch copy sets `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` to folders under `$TMPDIR`, as `utils/pin.test.sh:41-46` does, or that nothing is run and the dry run stays on paper.
3. Item 1's "The fix and its test" writes Ordo's rule numbers into a shipped skill: "(change standard rules 1 and 13)", "(rule 1)", "(rule 2)", "(rule 21)". The skills name the rules file by rule, never by number or path. See `skills/land/SKILL.md:88`, `skills/refute/SKILL.md:117,177` and `skills/roadmap/SKILL.md:40`: "the rules file's rule on secrets in quoted command output". The numbers also differ between repositories: `skills/repo-setup/templates/docs/dev/change-standard.md` numbers the secrets rule 20, and its rule 1 says "A defect in code", not "a script". This goes against the README's first paragraph ("The skills carry no project name and no path"). The brief should tell the builder to name each rule by what it says in "the rules file `rules:` names" and to write "a defect in code" (the template's word), with no numbers.

## 5. The question

- Case `ls` both files: yes, it could pass without the goal. Two empty files pass. The reading cases and Axel's check carry the goal.
- Case, description length: yes, for the same reason. It checks one fact.
- Case, sync prints ok before and after: yes. It prints ok if no term is added at all. The terms reading case is what checks the terms.
- Reading against skill-layout, reading against item 1 and the Goal, reading against `diagnosing-bugs`, the dry run, the terms reading: each could pass without the goal, because the builder who wrote the skill judges it. The step's check (Axel's reading) is the one that could not.
- The step line's check ("the skill read by Axel against `docs/dev/skill-layout.md` and the goal"): no, Axel reads it against the six parts. It lands pending, so the plan's goal is not reached until his reading.
- Item 1's own requirements, asked of the skill's behaviour:
  - "The red command": no. It requires the exact symptom and three same verdicts.
  - "The hypotheses": yes, under the loop. See section 2 finding 1 ("shown").
  - "Probes": yes. Findings 3 and 6 below.
  - "The fix and its test": yes, inside a plan. See section 2 finding 2.
  - "The cause written in the booking": no by hand. Inside a plan, see finding 4 below.
- Item 2: yes. A template can list the parts while the skill never fills them inside a plan (the passing run). Section 2 finding 2 covers it.
- Item 3: no, given the terms reading and section 1's findings.

Findings:
1. Under `plan-orchestration` the hypotheses reach only the record. See section 2 finding 1.
2. Inside a plan the fix's test is never run red. See section 2 finding 2.
3. "Where probes run" gives two ways to make the scratch copy, and neither gives the builder's tree unchanged.
   - `cat .agents/worktrees/2e-12a/.git` prints `gitdir: /Users/axelfaes/workspace/ordo/.git/worktrees/2e-12a`. A `cp -R` copy shares the real worktree's index and HEAD, so any git command a probe runs in the copy (`git stash`, `git checkout`, `git bisect`) changes the step's worktree. That breaks "read-only".
   - `git -C .agents/worktrees/2e-12a status --short` shows the builder's work uncommitted (` M README.md`, `?? docs/figures/`), with `log -1` at the base `ef5d3a9`. `git worktree add` of "the step's branch head" therefore gives the base without the builder's work, where the defect usually is not. It also fails while that branch is checked out in the step's worktree.
   The brief should specify either: `git worktree add --detach <tmp> <base>` followed by applying `git -C <worktree> diff <base>` plus the untracked files; or `cp -R` with the `.git` pointer removed (or replaced by a fresh `git init`), so no git command in the copy reaches the step's metadata.
4. No condition ends the diagnosis as "cause not found". "When every hypothesis is falsified, new ones are formed ... and shown again as above", and under the loop there is no stop, so the loop can repeat without end. The "cause not found" open item is never reached by a stated rule. The brief should state when a cause counts as not found (for example, a second ranked list all falsified, or no probe can separate the remaining hypotheses) and that this is the exit to the open item.
5. "By hand" and "under `plan-orchestration`" (ruling D2) are mapped onto the two invocation forms. A user running a plan step by hand ("close them" in the by-hand sequence) who types `/diagnose <entry> <step> <finding>` gets no wait. The brief should key the wait on who runs it (a session under the loop, or a person), not on the invocation form.
6. The red command for a slow case is not defined. "The red command" says it goes red on "the timing", while the baseline measurement sits in "Probes", after the hypotheses. The brief should put the baseline in "The red command" and define red for timing: a threshold stated from the known-good measurement, or from the requirement, and the spread.
7. Against `diagnosing-bugs`, point by point, item 1 does not cover these points. Each lets `diagnosing-bugs` win that point in step 4:
   - the HITL loop for a symptom only a person can trigger (way 10);
   - an HTTP request and a headless-browser script among the ways to build the red command (ways 2 and 4). The skills run a TypeScript tool too, by the README's first paragraph;
   - "Tighten the loop": pin time, seed random numbers, isolate the file system, freeze the network;
   - the debugger or REPL before logs, logs at the boundaries that separate hypotheses, and "log everything and grep" as an anti-pattern;
   - the second prediction a hypothesis may make ("changing Z makes it worse");
   - quoting only the lines of a captured artifact that carry the signal, and asking the user when the redacted output is not enough.
   Each should be an item-1 requirement, or be named as replaced by an Ordo rule. The points item 1 covers equally or better: the red first; three same verdicts; "never on it did not crash"; the rate raised for a flaky symptom; the no-loop stop with the ways tried; shrinking with a green cut put back; 3-5 ranked falsifiable hypotheses; one change and one hypothesis per probe; tagged logs; the baseline first; the test at the place the defect occurs, or the missing place as a finding; the test before the fix; the unshrunk case rerun; cleanup by grep; the cause in the commit; redaction and credentials from the environment. The glossary and ADR reading is covered by "What it reads".

## 6. Implied inputs

Not a code step: the check of `templates/brief.md` "Cases" does not apply as written. Read against what a skill's text must handle, item 1 leaves these inputs unhandled.

Findings:
1. A performance regression. Partly handled. See section 5 finding 6: the brief should define the timing red and the threshold, with the baseline before hypotheses.
2. A symptom only the user can trigger (a click, an interactive prompt, the runner itself). Not handled: "runs unattended in seconds where the symptom allows" leaves it open. The brief should add a human-driven red command, where the skill prints the exact action for the user and reads back the captured output. Under the loop this is the "no red command" stop, raised as an open item.
3. A defect in skill text or a page (a skill that instructs the wrong behaviour). "The fix and its test" handles the fix by reading, but "The red command" requires one command that drives a code path, so the skill's first step has no defined outcome for a text defect. The brief should say what the red is for a text defect (for example, the quoted text and the run or transcript line that shows the wrong behaviour it led to), or that a text defect with a known cause goes to `/spec`, not `/diagnose`.
4. A finding whose refuter report is missing, or a failure that is not a refuter finding. The Stops refusals cover "no such finding in the refuter report" but not "no refuter report" (`agents/reviews/<step>-refuter.md` absent). A red line at landing whose cause is not known (`skills/plan-orchestration/SKILL.md` Steps 9) or a brief-check finding cannot be named by `<finding>`. The brief should also say how `<finding>` is written. The refuter template names findings "as heading and number" (`skills/refute/templates/report.md` "Verdicts").
5. A scratch copy that cannot reproduce because the defect needs the real environment (the installed skills, `~/.local/share/ordo-stable`, a service, the runner). Not handled. Inside a plan, probes must run on the scratch copy. The brief should say this is the "no red command can be built" case: under the loop, the cause-not-found open item; by hand, a request to the user. It should also say that a red command never runs against the user's real installed state or home folder without the user's leave, with state paths redirected under `$TMPDIR` as `utils/pin.test.sh:41-46` does.
6. A red command that needs a secret. Partly handled ("takes it from the environment"). Not handled: the secret absent from the environment (under the loop, the orchestrator may not have it), and `cp -R` copying a `.env` or credentials file into `$TMPDIR`. The brief should make an absent credential a stop that asks the user, never read it from a file into the command line or the record, and name secret files among what cleanup removes.
7. Two findings of one step diagnosed, or a second repair round. The record path `agents/reviews/<step>-diagnosis.md` (Decision 1) holds one diagnosis, so a second one overwrites the first. The brief should say a later diagnosis is appended below the earlier one, as `spec` "Steps / The brief check" item 3 does for a report, or give each finding its own path. The second choice changes the booked public shape, so it would need booking.
8. A repository with no `.agents/plan.yaml`, run by hand. "What it reads" reads the rules file "when `.agents/plan.yaml` names them", but "The fix and its test" rests on the rules file's rules (test first, a guard is not a fix, which behaviour gets a test). The brief should say which rules hold when there is no rules file, for example the skill's own Rules stating test-first and guard-not-fix in full.

## 7. ADRs

- `ls docs/adr` prints `README.md template.md`: no record.

Findings: none.

## Other checks asked for

- Against `plan-orchestration` Steps 8 "Only known fixes": nothing in the brief contradicts it. The scratch copy keeps the worktree read-only and the fix goes out as the round's ruling. The contradictions in practice are in section 5 findings 2 and 3: the test is never run red before the round, and the two copy methods either share git metadata with the worktree or lack the builder's work.
- Against change standard rule 1: consistent, by the "Scripts compute facts" section. A script defect whose failure costs nothing gets no test. The brief does not say this outright; implied input 8 and section 4 finding 3 cover how the skill should name the rule.
- Against rule 2: consistent.
- Against rule 13: consistent for by-hand runs. Inside a plan, the builder's round runs it under the rules file, but see section 2 finding 2.
- Against rule 21: consistent. See implied input 6.
- Decision 3 (terms in step 1, not step 2) against the step list. Step 2's line (`plan.md:22`) assigns "new terms (such as **red command** and **hypothesis**) in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`". `docs/dev/skill-layout.md` requires a skill to add its terms "first". The change standard says "nothing in a brief overrides" the standards, so step 1 must add them.
  - Moving that work earlier removes no scope. Step 2's check (`sync_rules.py ... exits 0`) still runs, and its premise check will find the terms present.
  - It is not a contradiction only Axel can rule on. It does change the allocation of an approved step list, though, and the Rulings line added for step 1 (quoted below) does not cover it. It should be booked in 2.F's Rulings, marked "decided by the orchestrator overnight", with its options and the lazy option.
- The decisions under "Decisions taken in this brief":
  - Decisions 1 and 2 are booked. `git diff .scratch/2-f-diagnose/plan.md` adds: "- Step 1, the invocations and the record (2026-09-30, decided by the orchestrator overnight under 2.E's ruling "Overnight work" 5): `/diagnose <symptom>` by hand and `/diagnose <entry> <step> <finding>` inside a plan, the diagnosis record saved inside a plan at `agents/reviews/<step>-diagnosis.md`, probes inside a plan run on a scratch copy and the fix sent as the round's ruling. Options: (a) that; (b) one invocation, `/diagnose <symptom>`, with the plan found from the symptom's text; (c) no record file, the diagnosis kept in the round brief only. Recommendation (a): `plan-orchestration` runs the diagnosis read-only and needs the finding named, and step 3's review reads the record. The lazy option is (c), which leaves the probes unrecorded."
  - Decision 3 is not booked (see above).
  - Decision 4 follows the step line's "(and a template only where a step needs one)".

Findings:
1. Decision 3 is not booked in 2.F's Rulings. The brief's Decision 3 should cite a Rulings line once one is added.

## Declined to judge

- Whether 2.E's ruling "Overnight work" (items 2 and 5) extends to plan 2.F. Its text names 2.E's steps and says "booked here". Extending it to another plan is Axel's call. Both this brief's landing-pending note and the booked Rulings line rest on it.
- Whether plan step 3's text ("put back on a scratch copy of the tree at the commit before its fix") needs rewording, since the defect was never on main (section 3 finding 1). The defect can be rebuilt from `3-round-0.diff`, so step 3 stays feasible. That is for step 3's `/spec`, or for Axel if the wording of his approved line matters.
- Whether `templates/` rather than `references/` is the right folder for the diagnosis record. `docs/dev/skill-layout.md` reserves `templates/` for "files a skill copies into a repository", and the record is written into the ledger as `spec`'s `templates/brief.md` is, so the precedent supports `templates/`. I did not judge it further.

Agent usage: claude-opus-5-5. About 45 tool uses. Tokens and minutes are not known to me; the runner's completion notice has them.

## Closed

Agent usage (completion notice): claude-opus-5-5 (served model, read from the agent's transcript); 148959 tokens, 40 tool uses, 429 s; $1.32-3.68 at Opus rates.

The session's change to the brief for every finding above, made before the preparation commit:

- Names 1: item 3's **probe** entry keeps both senses (the premise and `spec` sense, and the diagnose sense), with both "Stated in" places.
- Names 2: item 3 adds **case, of a diagnosis**.
- Names 3: item 3 says the skill uses "booking" and "finding" only in the glossary's senses; outside a plan it says "the commit message's last bullet", and an untestable place is "No test reaches it" in the record (item 1 and item 2).
- Names 4: "Paths this step writes" says `docs/glossary.md` is shared with 2.E step 12a and the step is dispatched after 12a lands, prepared on that head.
- The step line 1: "The hypotheses" says that under `plan-orchestration` they are quoted in the round brief and in the landing report beside the record's path.
- The step line 2: "The fix and its test" says that inside a plan the test is run red without the fix and green with it on the scratch copy, both runs quoted, before the round is sent.
- Premises 1: the dry-run case names the defect as `db9bbec^` with `3-round-0.diff` applied, and quotes the symptom of `3-refuter.md` "Spec 1".
- Premises 2: the premise says ruling "Overnight work" 2 names 2.E's steps, and its application to 2.F is booked in 2.F's Rulings as "Overnight work applies to this plan", citing Axel's request for the night; it is also an open item for Axel.
- Premises 3: the step-line command is `grep -n "^- 1 The"`.
- Cases and checks 1: item 1 says each rule is written once where "Where a rule goes" puts it; the red-command, guard and logging shortcuts are stated only in Anti-patterns, which the Steps items name.
- Cases and checks 2: the dry run stays on paper and nothing is run; "Where probes run" redirects `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` under `$TMPDIR` for any red command that would touch them, or asks leave.
- Cases and checks 3: item 1 names rules by what they say, never by number or path, and says "a defect in code".
- The question 1 and 2: as The step line 1 and 2.
- The question 3: "Where probes run" gives the detached worktree at the base, the step's diff applied and the untracked files copied, removed with `git worktree remove --force`.
- The question 4: a new item, "The cause not found", with its conditions.
- The question 5: a new item, "Who is present", keys the waits on who runs the skill.
- The question 6: the slow-case baseline and threshold are in "The red command".
- The question 7: HTTP and headless-browser ways, the person-driven red command, tightening, the debugger before logs and logs at boundaries, the "makes it worse" prediction, quoting only the lines that carry the symptom, and asking when redaction leaves too little are all item-1 requirements; "logging everything and searching afterwards" is an Anti-patterns row.
- Implied inputs 1: as The question 6.
- Implied inputs 2: the person-driven red command, a stop that waits on the user; under the loop, the cause not found.
- Implied inputs 3: a new item, "A defect in text", defines its red.
- Implied inputs 4: `<finding>` also takes `red line` and `brief check <n>`; a missing report or finding is a refusal naming it.
- Implied inputs 5: a symptom that needs the real environment is the "no red command" case.
- Implied inputs 6: an absent credential is part of the "no red command" case; secret files copied into `$TMPDIR` are removed at cleanup; a credential never goes from a file into the command line or the record.
- Implied inputs 7: a later diagnosis of the same step is appended to the record under its own heading.
- Implied inputs 8: with no rules file, the skill's Rules state test-first, guard-not-fix and redaction in full.
- Other checks 1: Decision 3 is booked in 2.F's Rulings as "Step 1, the terms moved from step 2", and the brief cites it.
- Declined 2 (step 3's wording): left for step 3's `/spec`, where the premise check meets it; the dry run here uses the rebuilt defect.
- Declined 3 (`templates/` for the record): kept, by the precedent the report names.
