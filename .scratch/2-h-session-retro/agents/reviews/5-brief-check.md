# Step 5 brief check (on main at 6b7d6d0)

This is the report of the fresh agent for the `spec` skill's "Steps / The brief check", run on `.scratch/2-h-session-retro/agents/briefs/5.md`. Pages are cited by section. Grep hits keep their `file:line`. Where my command piped output through `cut -c1-N`, the quoted line is the cut output exactly as it printed.

## 1. Names

- **End-rule wording ("touches the folder", "touches its folder", "last commit", "latest commit that touches").** Command: `git grep -n -i -e "touches the folder" -e "touches its folder" -e "last commit" -e "latest commit that touches" -e "closing commits" -- . ':!.scratch' | cut -c1-400`.
  - Hits inside the paths: `docs/glossary.md:134`, `skills/repo-setup/templates/plan-terms.md:129`, `skills/session-retro/SKILL.md:3`, `:15`, `:52`, `skills/session-retro/templates/sessions.md:5`.
  - One hit outside the paths: `skills/plan/SKILL.md:170: - When the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), ...`. It means HEAD and has nothing to do with the window, so the change does not make it false. The brief's own grep on line 17 also prints this hit, and the brief does not list it. That omission does no harm.
  - `docs/roadmap.md` has no hit, so the brief's carve-out "`docs/roadmap.md` left out" (lines 17, 42, 111) covers nothing.
- **Places that name `/session-retro <entry>`.** Command: `git grep -n "session-retro" -- skills docs README.md utils ':!skills/session-retro'`. None of these states an end rule, so the change does not make any of them false:
  - `README.md:25` and `README.md:50` ("for a plan, open or closed").
  - `skills/ordo-help/SKILL.md:27` and `:99` (the same "for a plan, open or closed" line). The brief does not name these.
  - The "Use instead" rows of `skills/plan-orchestration/SKILL.md:30`, `skills/refute/SKILL.md:27` and `skills/plan-retro/SKILL.md:25`.
  - `docs/roadmap.md:186` ("`session-retro` against mattpocock's `retro` on the sessions of plan 2.E") states no window. The change does move 2.E's resolved end from deb0d80 (2026-10-01T15:47:02+02:00) to 39ac671 (2026-09-30T23:39:21+02:00), which is the intended effect.
- **"What it reads" item numbers.** Command: `grep -n '"What it reads" [0-9]' skills/session-retro/SKILL.md` printed `47:` (item 2), `128:` (item 7), `172:` (item 1) and `173:` (item 2). The brief's item 2 lists the references as "lines 47, 128 and 173" and leaves out line 172. Both placements the brief allows (an item after 7, or a sub-bullet of 2) keep item 1's number, so nothing breaks. The list is still incomplete. `git grep -n "session-retro.*What it reads" -- skills docs README.md` printed nothing, so no other file cites these numbers.
- **`metadata.version`.** The only occurrence is `skills/session-retro/SKILL.md:5`.
- **Ledger hits (outside the step's paths, owned by the orchestrator).** Command: `git grep -n -i -e "touches the folder" -e "touches its folder" -e "last commit that touches" -e "latest commit that touches" -- .scratch ':!.scratch/2-h-session-retro/agents/briefs/5.md'`.
  - `.scratch/2-h-session-retro/plan.md:46`, the Rulings bullet "Step 2, the skill's shape", part (2), says "to one second after the last commit that touches its folder in `<ledger_root>` or `<archive_root>`". The change makes this ruling no longer the rule in force. The ruling on line 57 ("Open item Step 4, the end of a plan's window", self-rule) replaces it, but line 46 carries no "replaced by" marking.
  - The other hits are history records: briefs 2 and 3, the round diffs, `3-brief-check.md`, `choices.md:23`, `retros/sessions-2026-10-12.md:5` and plan.md:91 (Step 0). The change makes none of them false as records.

Findings:
- `skills/session-retro/SKILL.md:172` is missing from item 2's list of "What it reads" references. This is harmless under both allowed placements.
- `.scratch/2-h-session-retro/plan.md:46`, part (2) of the ruling "Step 2, the skill's shape", still states the folder rule the step replaces. This is the orchestrator's booking, outside the step's paths.

## 2. The step line

Step 5's line, part by part:
- "`session-retro` ends a plan's window at the latest commit that touches the plan's `plan.md` or `orchestrator-state.md`, under either root": What to build 1 (the bullet and the command).
- "in `skills/session-retro/SKILL.md` Steps 1": What to build 1.
- "and its 'What it reads'": What to build 2.
- "so a later plan's commit into the archived folder does not widen the window": What to build 1 asks for this as the why-clause. No requirement makes it true. On the tree it is false for three archived plans (see 3, 5 and 6), so the rule as ruled does not deliver this part.
- "check: the skill text read in place": Cases 4 and Verify 5. Case 4 reads items 3, 4 and 5 only. Items 1 and 2 are read under Verify 5 (list items and sentence length) and the report's terms section.
- "and the window it gives for `/session-retro 2.C` ends one second after 75c987f's committer time, 2026-09-29T12:04:42+02:00": Cases 1 and 3, and Verify 3.
- "(1 commit)": no requirement. This belongs to the landing, so no requirement is expected.
- The brief goes beyond the line with items 3 to 6 (description, Quick start, template, glossary, version) under Decisions 1 and 2. Each of those texts states the end rule or the version, so the widening is backed by the grep in Names.

Findings: the part "so a later plan's commit into the archived folder does not widen the window" has no requirement that makes it hold. The rule the line names does not make it hold for plans 1, 2 and 2.A (evidence in 3).

## 3. Premises

- **Line 12.** `grep -n "The end is one second after" skills/session-retro/SKILL.md` printed `52:   - The end is one second after the committer time of the latest commit that touches the folder under either root, or the time of the run when the folder is still under `<ledger_root>/`:`. `grep -n 'git log -1 --format=%cI' skills/session-retro/SKILL.md` printed `54:     git log -1 --format=%cI -- "<ledger_root>/<slug>" "<archive_root>/<slug>"`. Matches.
- **Line 13.** `grep -n "ledger_root\|archive_root" .agents/plan.yaml` printed `6:ledger_root: .scratch` and `7:archive_root: .scratch/archive` (each followed by its comment). Matches.
- **Line 14.**
  - `git log -1 --format='%h %cI' -- .scratch/2-c-scripts-compute-facts-and-writing-is-removed .scratch/archive/2-c-scripts-compute-facts-and-writing-is-removed` printed `ef9f292 2026-10-06T01:10:43+02:00`.
  - `git show -s --format='%h %cI %s' ef9f292` printed `ef9f292 2026-10-06T01:10:43+02:00 Land step 3 of plan 2.1, the scripts`.
  - `git show --stat ef9f292 -- .scratch/archive/2-c-...` printed `.../agents/reviews/6-reverts.py | 210 ---------------------`.
  - The size 8374595 bytes is in plan.md "Step 0 of step 4" (read with `sed -n '89,92p'`).
  - Matches.
- **Line 15.** The command over the four plan.md and state paths printed `75c987f 2026-09-29T12:04:41+02:00`, with the subject "Correct the next step in the archived state file of plan 2.C". The `python3` +1s line printed `2026-09-29T12:04:42+02:00`. Matches.
- **Line 16.** `git log --diff-filter=A --format='%h %cI' -- .scratch/2-c-.../plan.md | tail -1` printed `ab2cb50 2026-09-28T22:51:46+02:00`. Matches.
- **Lines 17 to 22.** The brief's grep printed the six in-path hits the brief lists, plus `skills/plan/SKILL.md:170`, which the brief does not list and which is unrelated. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exit 0. README lines 25 and 50 state no end rule. Matches, apart from the unlisted unrelated hit.
- **Line 23.** I read "What it reads" in full (`cat -n skills/session-retro/SKILL.md`, lines 28 to 38). No item names the commits. Matches.
- **Line 24.** `version: "1.0.1"` is at line 5. The `skill-layout.md` "Frontmatter" sentence is quoted correctly. `git log -L5,5:skills/session-retro/SKILL.md` shows 1.0.0 set by 0379c38 (plan 2.H step 2) and 1.0.1 by ef9f292 (plan 2.1). `git tag --contains 0379c38` lists v2.6.0 through v4.1.0, so the skill has shipped. Matches.
- **Line 25.** `ls docs/adr` lists twelve `NNNN-*.md` records (0001 to 0012). Matches.
- **Decisions 3.** I reran it over every folder of `.scratch/archive/`. For each folder the command gave the latest commit over the whole folder, then the latest commit over its plan.md and state file under both roots:
  ```
  1-one-layout-for-every-skill | 8becbcd 2026-09-26T04:49:17+02:00 | 8becbcd 2026-09-26T04:49:17+02:00
  2-1-scripts-cut-to-their-jobs | 1212148 2026-10-07T14:52:51+02:00 | 1212148 2026-10-07T14:52:51+02:00
  2-a-launch-notes-for-builders-run-as-their-own-process | 8becbcd 2026-09-26T04:49:17+02:00 | 8becbcd 2026-09-26T04:49:17+02:00
  2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found | ef9f292 2026-10-06T01:10:43+02:00 | 5264a06 2026-09-28T12:24:19+02:00
  2-c-scripts-compute-facts-and-writing-is-removed | ef9f292 2026-10-06T01:10:43+02:00 | 75c987f 2026-09-29T12:04:41+02:00
  2-coverage-inventory-of-the-academic-skills | 8becbcd 2026-09-26T04:49:17+02:00 | 8becbcd 2026-09-26T04:49:17+02:00
  2-d-the-plan-skills-take-the-comparisons-process-changes | 8ea1b6d 2026-09-29T17:38:29+02:00 | 8ea1b6d 2026-09-29T17:38:29+02:00
  2-e-a-self-rule | 7f459fb 2026-10-04T23:58:42+02:00 | 7f459fb 2026-10-04T23:58:42+02:00
  2-e-grill | deb0d80 2026-10-01T15:47:02+02:00 | 39ac671 2026-09-30T23:39:21+02:00
  2-f-diagnose | 6043818 2026-10-12T14:26:50+02:00 | 6043818 2026-10-12T14:26:50+02:00
  ```
  - The five rows the brief gives match.
  - The brief says the run was "over each folder of `.scratch/archive/`" but lists five of the ten folders.
  - Three of the five it leaves out are 1, 2 and 2.A. Each of them ends at 8becbcd under both the old rule and the new one.
  - `git show -s --format='%B' 8becbcd`: "Correct the ledgers of the three archived plans from a re-run ... Book step 15 of plan 2.B as landed". This is plan 2.B's landing of its step 15 (2.B's plan.md was added at 9be174e, 2026-09-24T20:30:44). It rewrote the archived `plan.md` and `orchestrator-state.md` of plans 1, 2 and 2.A.
  - Those plans closed at a866716 (2026-09-23T17:11:54), 15703ec (2026-09-23T21:33:36) and 7d1f90e (2026-09-24T01:23:03), from `git log` over their plan.md and state paths.
  - Under the new rule, `/session-retro 1` still ends at 2026-09-26T04:49:18+02:00, two and a half days after plan 1 closed, and takes in plan 2's, 2.A's and 2.B's sessions.
- **Decisions 3, its stated reason.** The brief says other ledger files "are written in the same commits as one of the two under the resume-point rules of `plan-orchestration`". The tree contradicts this. A per-plan loop listed the commits that touch a plan's folder but neither its own plan.md nor its state file. It printed more than 80 such own commits, for example:
  - `4840eb5 Write the closing report of plan 2.1`
  - `8b1a0b1 Write the closing report of plan 2.F`
  - `68a18c2 Prepare step 1 of plan 2.H, the transcript reader`
  - every "Brief step N of plan 1" commit

  The conclusion still holds on the tree for a different reason. Each plan's closing commit moves its plan.md, and that commit comes after all of these. The same loop shows that no own commit after a plan's move touches only other ledger files; the only ones after a move are ef9f292 and deb0d80, both from later plans.

Findings:
- **Decisions 3 is incomplete, and the step's claim fails on the tree.** The run covers five of the ten archived folders. For three of the five left out (1, 2, 2.A), a later plan's commit (8becbcd, plan 2.B) touches their plan.md and state file. So the new rule still widens those windows, against the step line's "so a later plan's commit into the archived folder does not widen the window" and against the why-clause item 1 dictates.
- **Decisions 3's reason is false.** Briefs, reviews and closing reports are often committed without plan.md or the state file. The rule holds for a plan's own commits only because the closing commit moves plan.md after them.

## 4. Cases and checks

- **Case 1 (`/session-retro 2.C`).** It agrees with the rules file and the standards except for "run on main by hand". The change standard, "Where the work happens", says the builder works "In the git worktree the brief names, never in the main checkout". The worktree is created at main's head, so its `git log` gives the same output, and "on main" can be read as the history of main. Saying "in the worktree" would remove the conflict.
- **Case 2 (open plan 2.H).** Consistent. The Steps 1 loop, run with `<entry>` = 2.H, printed `.scratch/2-h-session-retro/plan.md`, a folder under `<ledger_root>/`. The end-time bullet is the bullet item 1 rewrites, so the case checks a place the step changes.
- **Case 3 (ef9f292 not the end).** Consistent.
- **Case 4 (items 3 to 5 read in place, plus the grep).** Consistent. The grep reaches `skills`, `docs` and `README.md` beyond the changed files, which is what change-standard rule 14 asks for. The `docs/roadmap.md` carve-out has nothing to exclude.
- **Generic test bullets (brief lines 46 to 53).** Consistent with "Scripts compute facts; judgment is read". No test is asked for.
- **The Report section against change-standard rule 7.** Rule 7 asks for "a DONE / NOT DONE table, one row per item". The brief's Report asks for "The DONE / NOT DONE table with the checks above", and its five verify items do not cover What to build 2 ("What it reads"), 6 (the version) or 7 (no other file). Those three would get no row unless the builder adds them.

Findings:
- Case 1 says "run on main by hand". This conflicts in wording with the change standard, "Where the work happens".
- The Report's table is tied to "the checks above" rather than one row per item of What to build, as change-standard rule 7 asks. Items 2, 6 and 7 have no named check.

No case asks the builder to check, quote or explain a place the step does not change.

## 5. The question

"The goal" here is the part of the plan's goal this step delivers: `/session-retro <entry>` reads the window of the plan's own sessions.

- **Case 1:** yes, it could pass without the goal. It holds for 2.C while plans 1, 2 and 2.A still resolve to 8becbcd, a commit of plan 2.B.
- **Case 2:** it checks behaviour the step keeps and passes whatever the goal. It is not offered as proof of the goal, so this is acceptable.
- **Case 3:** yes, it could pass without the goal, for the same reason as Case 1. It covers a later commit outside plan.md and the state file, but not a later commit into them (8becbcd).
- **Case 4:** no, the reading part decides it. The grep alone could pass with "its last commit" left in the description and the Quick start, because neither of its patterns matches that phrase. The reading of items 3 to 5 covers this.
- **The check on the step's line** ("text read in place" and the 2.C end): yes, it could pass without the goal. Only 2.C is checked, and the purpose clause fails for plans 1, 2 and 2.A.
- **Item 1:** yes, it could pass without the goal. The dictated command is met, and the windows of plans 1, 2 and 2.A are still widened by plan 2.B's commit.
- **Item 2:** no. It is checked only by reading, and no verify line names it.
- **Item 3:** no, by reading. The length check (Verify 2, now `779`) passes with the text unchanged.
- **Item 4:** no. Verify 4's grep fails while "touches its folder" stays.
- **Item 5:** no, by Verify 4. The sync check (Verify 1) passes when both files are left unchanged, so it proves equality only.
- **Item 6:** no check named. A version left at 1.0.1 passes every verify line, and only a reading catches it.
- **Item 7:** no check named, such as `git diff --name-only` against the paths. The reviewer's reading of the diff would catch a stray file.

Findings:
- Case 1, Case 3, item 1 and the step line's check could all pass while the goal fails for plans 1, 2 and 2.A, whose windows plan 2.B's commit 8becbcd still widens.
- Items 6 and 7 have no named check.

## 6. Implied inputs

This is a text step with shell commands in it. These are the inputs the commands imply:

- **An archived plan whose `plan.md` or `orchestrator-state.md` a later plan's commit touched.** This has happened: 8becbcd, plan 2.B's step 15 landing, touched plans 1, 2 and 2.A. It is missing from Cases.
  - Expected result, by the step line's purpose: the plan's own last commit. For plan 1 that is a866716, giving an end of 2026-09-23T17:11:55+02:00.
  - The new command prints `2026-09-26T04:49:17+02:00`. The rule as ruled cannot meet this case, so closing it changes the part the step builds. I judge it the stop "A brief check finding the brief cannot absorb" (or, under self-rule, a choice for the orchestrator).
  - The evidence I computed bears on the options; it is not a recommendation.
    - **Option (a), keep C37's rule.** Plans 1, 2 and 2.A keep a window that runs into plan 2.B, and the why-clause cannot be written truthfully.
    - **Option (b), the plan's own move plus its own corrections.** The end is the latest of two things: the commit that added `<archive_root>/<slug>/plan.md`, and later commits that touch the plan's plan.md or state file and no other plan's ledger folder. A read-only loop gave each of the ten archived plans its own close or own correction: a866716, 1212148, 7d1f90e, 5264a06, 75c987f, 15703ec, 8ea1b6d, 7f459fb, 39ac671, 6043818.
    - **Option (c), end at the commit that moved the folder.** This was the rejected option (b) of ruling "Step 2, the skill's shape". It drops 2.C's 75c987f and 2.D's 8ea1b6d.
    - **A rule that rejects any commit touching another plan's folder.** This fails for 2.E, whose closing commit 39ac671 also wrote `.scratch/2-f-diagnose/orchestrator-state.md`. It gave 4e4a619, a commit before the close.
- **A plan's own commits after its move that touch only briefs or reviews.** This has not happened: the per-plan loop in 3 found none. If it did happen, the new rule would drop such a commit.
- **A slug renamed, or a plan moved back out of the archive.** This has not happened. The `git log --diff-filter=R` check found no slug change. Every archived plan has exactly one plan.md addition under each root (`added-under-ledger=1 added-under-archive=1` for all ten).
- **An archived plan with no state-file history.** None: the loop over the ten archived plans printed none.
- **A folder name with spaces.** The dictated command quotes every path, and slugs are derived without spaces. Not happened, and the command would handle it.
- **An open plan (2.H).** Covered by Case 2.

Findings: the archived plan whose plan.md or state file a later plan's commit touched (8becbcd for plans 1, 2 and 2.A) has happened and is missing from Cases. Its expected result is the plan's own close, a866716 for plan 1 (end 2026-09-23T17:11:55+02:00), which the dictated command does not give.

## 7. ADRs

I read the Decision section of each record with `awk '/^## Decision/...' docs/adr/[0-9]*.md`. All twelve are `Status: proposed`, and `grep -n -i supersed` found no record superseded.

- **0001** (the writing base reads the prose standard where it is): does not touch the step.
- **0002** (the prose standard holds over the academic sources): does not touch the step.
- **0003** (a fresh read-only agent reviews a draft): does not touch the step.
- **0004** (a self-rule decision ends "(self-rule)"): does not touch the step. Its sentence "A later ruling of the user replaces it without a rule clash" bears on the replacement of the ruling "Step 2, the skill's shape" (2), but that is a ledger matter, not a file the step writes.
- **0005** (choices in one file): does not touch the step.
- **0006** (agent ids in the ledger): does not touch the step.
- **0007** (repair-round reviewer model): does not touch the step.
- **0008** (cost script price table): does not touch the step.
- **0009** (cost script response bodies): does not touch the step.
- **0010** (verify list kept equal to the verification page): does not touch the step.
- **0011** (each plan keeps its own dispatch block): does not touch the step.
- **0012** (every commit on main names its paths): does not touch the step.

Findings: none. The brief's "No ADR touches this step" holds.

## 8. Dictated text

- **Item 1's command.** `git log -1 --format=%cI -- "<ledger_root>/<slug>/plan.md" "<ledger_root>/<slug>/orchestrator-state.md" "<archive_root>/<slug>/plan.md" "<archive_root>/<slug>/orchestrator-state.md"` is found by `grep -n 'git log -1 --format=%cI -- "<ledger_root>/<slug>/plan.md"'` at line 29.
  - Run with the 2.C slug, it printed `2026-09-29T12:04:41+02:00`.
  - It is ASCII and quotes every path.
  - Holds as a command. It breaks change-standard rule 14 together with the why-clause below, because it does not deliver what the bullet's clause says it does.
- **Item 1's why-clause.** "a later plan's commit into the archived folder, such as a sweep that deletes files across the ledger, does not widen the window" is found by `grep -n 'such as a sweep that deletes files across the ledger'` at line 29. The brief gives its content after a colon, and the builder words the bullet.
  - It breaks change-standard rule 14 ("A sentence in a document ... that the change makes false is a defect of the change"). For plans 1, 2 and 2.A, a later plan's commit into the archived folder (8becbcd) does widen the window under the new rule.
  - It holds against the no-history rules. It names no date, plan or incident.
- **Item 3's phrase.** "the last commit of its `plan.md` or state file" is found by ``grep -n 'stated as the last commit of its `plan.md` or state file'`` at line 31.
  - It breaks the prose standard, D "No synonym cycling", within one skill. Item 1 and the Steps say "latest commit" and `orchestrator-state.md`, while this phrase says "last commit" and "state file".
  - "state file" is a glossary term for `orchestrator-state.md`, and the skill's text uses it nowhere else (read in full).
  - Inside the Quick start's code block, backticks around `plan.md` would print literally. The current line 15 writes plain `plan.md`.
- **Item 4's phrase.** "the latest commit that touches its `plan.md` or `orchestrator-state.md`" is found by ``grep -n 'becomes the latest commit that touches its `plan.md` or `orchestrator-state.md`'`` at line 32. Holds: ASCII, glossary vocabulary, and inline code for paths per prose standard F. The template's line 5 already writes `plan.md` without backticks elsewhere in the same placeholder, so the two forms would sit in one line. This is a minor consistency point, not a broken rule.
- **Item 5's phrase.** "says the end is one second after the latest commit that touches the plan's `plan.md` or `orchestrator-state.md`" is found by `grep -n 'says the end is one second after the latest commit'` at line 33. It states what the entry must say, so the builder words it. It is read as a requirement and holds.
- **Item 6's line.** `version: "2.0.0"` is found by `grep -n 'version: "2.0.0"'` at line 34.
  - It holds under `docs/dev/skill-layout.md`, "Frontmatter": "The major part when, under the same inputs and the default keys, ... its output is changed".
  - The same section's "A plan that changes a skill raises one part of its `metadata.version` once" also holds. Plan 2.H created the skill at 1.0.0 and has not raised it since; 1.0.1 came from plan 2.1.
- **Item 2's form.** Item 2 says "an item, or a sub-bullet of item 2". This is not dictated text, but a sub-bullet of item 2 would put a second input (the git commits) into the item for the ledger folder. `docs/dev/skill-layout.md`, "Sections, in order", row 4, says "A numbered list, one input per item". A new item 8 holds; the sub-bullet form arguably breaks that row.

`LC_ALL=C grep -n '[^ -~]'` over the brief printed nothing.

Findings:
- Item 1's why-clause would be a sentence the change makes false (change standard, rule 14) for plans 1, 2 and 2.A.
- Item 3's phrase uses "last commit" and "state file" where the rest of the skill and the brief use "latest commit" and `orchestrator-state.md` (prose standard, D "No synonym cycling").
- Item 2's sub-bullet option conflicts with `docs/dev/skill-layout.md`, "Sections, in order", row 4 ("one input per item").

## Declined to judge

- **Whether 8becbcd belongs to plans 1, 2 and 2.A.** Ruling "Step 2, the skill's shape" (2) says corrections after the move are part of a plan's sessions, and 8becbcd's subject is "Correct the ledgers of the three archived plans". Its body and timing make it plan 2.B's step 15 landing. Whether it should end those plans' windows is a design call for the orchestrator, or the user under self-rule's limits. A read and a rerun establish the facts above but cannot settle the call.
- **Which replacement rule to adopt (the options in 6).** This changes the part the step builds, so it is the orchestrator's or the user's call.
- **The installed pinned copy under `~/.local/share/ordo-stable`.** Not read. The step does not write it, and the change standard says it is never edited.

Agent usage: af3f25fec9cb469d4, claude-opus-5-5, 178009 tokens, 48 tool uses, 7.7 min.
