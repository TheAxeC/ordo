# Step 3 brief check (on main at 110488c)

This is the brief check of `.scratch/2-i-several-plans-in-one-session/agents/briefs/3.md`, the uncommitted file on disk. Since 94585e9, main has gained 5aece6b and 110488c. `git show --stat 5aece6b 110488c` shows that each changes only `docs/roadmap.md`, so every premise below was read on 110488c.

## 1. Names

- **`preparing` / `landing: preparing`.** `grep -rn 'preparing' skills docs README.md` printed nothing. There is no hit.
- **"in flight", the glossary term the step changes.** `grep -n 'in flight' README.md skills/plan-orchestration/references/self-rule.md skills/plan/templates/plan.yaml docs/roadmap.md docs/adr/0011*.md` finds these hits outside the paths:
  - `README.md:18` "checks the paths it writes against the steps in flight": still true.
  - `skills/plan/templates/plan.yaml:21` "Steps in flight at once across every open plan": still true.
  - `docs/roadmap.md:24,25` and `docs/adr/0011-...md:7,11,15`: still true.
  - `skills/plan-orchestration/references/self-rule.md:151` "A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling" and `:155` "A step of `Builds on it:` in flight at the review gets its fix step at its landing". **Made false.** Once a step counts as in flight from the start of its `/spec`, a step at `landing: preparing` is both "not yet prepared" and "in flight". The two bullets then prescribe two different actions for it. `:161` ("has landed or is in flight") carries the same question. The file is not in "Paths this step writes". It is listed under "Each file of each skill ... checked", so the builder can only report it, not fix it.
- **"dispatch entry".** `git grep -n -e 'dispatch entr' -- ':!.scratch' ':!docs/glossary.md' ':!skills/spec/SKILL.md' ':!skills/plan-orchestration/SKILL.md' ':!skills/repo-setup/templates/plan-terms.md'` finds these hits outside the paths:
  - `skills/diagnose/SKILL.md:46` "A brief-check finding has no dispatch entry yet, and none is read for it." **Made false**: under item 1 the step has an entry at `landing: preparing` while its brief check runs.
  - `skills/diagnose/SKILL.md:49` "`premise` has no dispatch entry and reads no brief, since the step is not prepared yet." **Made false**: `/diagnose <entry> <step> premise` runs inside `/spec` Steps 2, after item 1 has written the entry.
  - `skills/diagnose/SKILL.md:43,45,357,362-365` (the refusal "No dispatch entry"): `:45` now has to say what an entry at `preparing` means for a reviewer's finding or a red line. As written, an entry exists, so the refusal no longer names the case.
  - `skills/diagnose/` is in neither "Paths this step writes" nor the list of files checked, and it is not among item 6's six skills. A builder held to the paths leaves two false sentences in `diagnose`.
  - `docs/adr/0006-...md:7` and `docs/roadmap.md:218` are context or history. They are not made false.
- **The `landing` values** (`git grep -n -e 'not-started' -e 'landing: cherry' -- ':!.scratch'`): every hit is inside the paths or in `docs/glossary.md`. There is no hit outside.
- **"position line"** (`git grep -n -e 'position line' -- ':!.scratch' ':!docs/glossary.md'`): every hit is inside the paths. Related places outside them:
  - `skills/plan-orchestration/references/self-rule.md:19` "4. The closing's roadmap diff, tag and pin." This names a tag and a pin among the closing's parts that wait on the user, and item 3's list of `<the closing's next part>` has neither. The plan's own Rulings also have the 2.I closing tag `v6.0.0` and pin it ("Open item Step 2, how the real run invokes step 1's texts"). At that part, the 2.I closing has no form to write.
- **Places inside the paths that the change makes false and the brief does not name.** These are listed here so the builder does not miss them:
  - `skills/spec/SKILL.md:189` "No commit, worktree or dispatch entry is made." (the wait). Under item 1 an entry was made and is then removed.
  - `skills/spec/SKILL.md:264` "Steps 9 writes a new dispatch entry at `round: 0`, `landing: not-started`." ("Steps / A step taken back out of main" 6). Under item 1, Steps 9 fills the `preparing` entry.
  - "Steps / A step taken back out of main" 5 removes the backed-out entry inside the preflight, before item 1 writes the `preparing` one. The brief never says how the two meet.
  - `skills/spec/SKILL.md:413`, the Stops row "A step in flight", column "What resumes it": "A step landed, or a red line took its landing back out of main". A slot held by a `preparing` entry is also freed by a stop or a wait of that `/spec`.
  - `skills/ordo-help/SKILL.md:96` "the step that holds it must land first". This becomes incomplete in the same way.
  - `skills/plan/templates/orchestrator-state.md:68` "Next step: <n>, because <why it is next>; or PAUSED ...". It has no closing form, and `ordo-help` Steps 3 prints the position from the state file.
  - `skills/plan-orchestration/SKILL.md:102` "While the builder runs, do ledger work only: the next step's premise checks, the bookings." Item 2 lets the session run `/land`, `/refute` and another `/spec` while a brief check runs. Rule 19 of the rules file asks that the two not contradict, and the brief does not name this line.
  - The same-plan commits, which include the waiting `/spec`'s records:
    - `skills/land/SKILL.md:132` "The commit also holds the files of this plan's ledger that the session wrote since the last resume point";
    - `skills/plan-orchestration/SKILL.md:83` (the launch commit) and `:137` (the round sent): "with ... the session's own records of the step's plan since the last resume point";
    - `:216-217` "It holds only the paths the session itself wrote since the last one";
    - `skills/spec/SKILL.md:199` together with `:67` ("a report or a reviewer it recorded").

    By these texts, any commit of the same plan made while a `/spec` waits carries that `/spec`'s uncommitted brief, and its brief-check report once saved, because the session wrote both since the last resume point. Item 2's second bullet says those records "stay out of them" because "each of their commits names its own paths, as ADR 0012 says". ADR 0012 says only that a commit names its paths. Which paths it names is set by the lines above, and the brief does not ask for them to be changed. Case 9 checks only `plan.md`.

Findings:
1. `skills/diagnose/SKILL.md:46` and `:49` are made false by item 1. `skills/diagnose/SKILL.md` is outside the paths and outside the file list and version list of items 6 and 7.
2. `skills/plan-orchestration/references/self-rule.md:151/155/161` give two different actions for a step at `landing: preparing`, and the file is outside the paths.
3. `self-rule.md:19` names a tag and a pin among the closing's parts, and item 3's list of next parts lacks them.
4. Item 2's claim that the waiting `/spec`'s brief and report stay out of other commits is false for same-plan commits: `land` Steps 12 (`:132`), `plan-orchestration` `:83`, `:137` and `:216-217`, and `spec` Steps 6 (`:199`). The brief names none of these places. The builder either writes a sentence that these texts contradict (rule 19) or changes texts the brief does not mention.
5. The unnamed in-path places `spec:189`, `spec:264` and the back-out section's step 5, `spec:413`, `ordo-help:96`, `orchestrator-state.md:68` and `plan-orchestration:102` are left to the builder's own grep.

## 2. The step line

- "`spec` and `plan-orchestration` count a step toward the limit on steps in flight, and compare its paths with the other steps', from the start of its `/spec`": served by item 1.
- "and say how a `/spec` that waits on its brief check stands beside the other skills that run and commit meanwhile (run finding 9)": served by item 2.
- "`plan-orchestration` 'Reports' gives the position line of a plan at its closing (finding 10)": served by item 3.
- "`land` and `spec` keep another open plan's uncommitted record from failing a landing's character-set check (finding 2)": served by item 5.
- "every file of each changed skill checked against the change": served by the paragraph after item 6. That list leaves out `skills/repo-setup/SKILL.md` and repo-setup's other templates, although `repo-setup` is a changed skill (item 6 lists it). It also leaves out `skills/diagnose/` (section 1, finding 1).
- "each changed skill's version raised as `docs/dev/skill-layout.md` says": served by item 6.
- "after the landing, main's head is tagged `v6.0.0-rc.2` and pinned with `utils/pin.sh v6.0.0-rc.2`": no requirement. This is the orchestrator's work after landing, but the brief does not name it anywhere.
- The line's check `git -C ~/.local/share/ordo-stable rev-parse HEAD` prints the commit of `v6.0.0-rc.2`: no requirement and no verify line. Its other checks (the glossary sync, and `checks.sh` at landing) are in "Verify before you report".

Findings:
1. The tag and pin, and their check on the step's line, have no place in the brief. Nothing in the brief stops the step from being booked done without them.
2. The file list of "every file of each changed skill" leaves out `skills/repo-setup/SKILL.md`, repo-setup's other templates, and `skills/diagnose/SKILL.md`.

## 3. Premises

- **The rulings.** `grep -n 'Open item Step 2, condition 7 shown only through a hold (2026-10-12)\|Open item Step 3, how a step in /spec is recorded (2026-10-12)' .scratch/2-i-several-plans-in-one-session/plan.md` prints lines 91 and 92. `grep -n 'C40' .scratch/choices.md` prints `9:## C40. How a step in /spec is recorded (2026-10-12)`. Matches.
- **The run findings.** `2-report.md` "## Findings of the run" holds findings 2, 9 and 10 as the brief describes them. Matches.
- **The `spec` places.** `grep -n 'in flight\|dispatch block\|dispatch entr\|landing: ' skills/spec/SKILL.md` prints 36-41 ("What it reads" 3), 177 (Steps 5, the quoted text), 224 (Steps 9), 280 ("No brief, no worktree and no dispatch block exist for the stopped step.") and 413 (the Stops row "A step in flight"). Matches.
- **The `plan-orchestration` places.** `grep -n 'in flight\|landing: ' skills/plan-orchestration/SKILL.md` prints 300 ("**The limit.**") and 308 (the `/spec` compare). Matches.
- **No rule for a waiting `/spec`.** `grep -n 'brief check' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md` prints 28 lines, and none of them says how a waiting `/spec` stands beside other skills. The `land` "Rules" sentence the brief quotes is at `skills/land/SKILL.md` and matches word for word. Matches.
- **The position line.** `grep -n 'position line\|Next:' skills/plan-orchestration/SKILL.md` prints 359 and 360 with the two forms. `plan-terms.md:79` holds the same forms. `grep -n -i closing skills/plan/templates/plan.md` prints line 21 with the quoted parts. `grep -n 'The roadmap diff' skills/plan-orchestration/SKILL.md` prints 405. Matches.
- **Records of another open plan.** `grep -n 'another open plan\|red line' skills/land/SKILL.md skills/spec/SKILL.md` prints `spec:71` and `land:143` with the quoted texts. Matches.
- **"`land` Steps 6 (lines 64 to 96)".** **Differs.** `grep -n '^[0-9]*\. ' skills/land/SKILL.md` prints `63:4. On main: ...`, `67:5. Restore ...` and `69:6. Run the verification commands ...`, then `97:7.`. Steps 6 is lines 69 to 96. Lines 64 to 68 are the end of Steps 4 and all of Steps 5.
- **The character-set check reads untracked files.** `sed -n 11p docs/dev/building.md` prints the `git ls-files -coz --exclude-standard | xargs -0 perl ...` line. Matches.
- **Where the `landing` values are given.**
  - `plan-terms.md:37` (`not-started`, `cherry-picking` or `backed-out`) and `:50` (the **in flight** text quoted): match.
  - "the state-file template `skills/plan/templates/orchestrator-state.md` line 33": **differs**. `cat -n skills/plan/templates/orchestrator-state.md` line 33 lists "... brief_check (...), landing, round." The key `landing` is named there with no values. Item 1 then asks for the comment to be changed, which still works, but the premise that the template gives the three values is false.
- **"Resuming" lines 245 and 246.** `grep -n 'landing: ' skills/plan-orchestration/SKILL.md` prints `245: ... landing: cherry-picking ...` and `246: ... landing: backed-out ...`. No other value appears. Matches.
- **`ordo-help`.** `sed -n 50,59p skills/ordo-help/SKILL.md` shows line 53 "(a step in flight, its worktree, its base, its round)" and line 56 "print one line from that position: the command that comes next". Matches.
- **Versions.**
  - `sed -n 22,28p docs/dev/skill-layout.md` holds the version rules, the quoted sentence on line 23. Line 28 is blank. The premise says "lines 22 to 28" and item 6 says "lines 23 to 28".
  - `git show 0158079 -- 'skills/*/SKILL.md' | grep '^[-+]  version'`, mapped to files, gives:
    - `spec` 4.1.0 to 5.0.0;
    - `plan-orchestration` 4.0.0 to 5.0.0;
    - `land` 2.0.0 to 3.0.0;
    - `plan` 3.0.0 to 4.0.0;
    - `repo-setup` 3.0.0 to 4.0.0;
    - `ordo-help` 3.0.0 to 3.1.0;
    - also `diagnose` 2.1.0 to 2.1.1, which the brief does not list.
  - `grep -n 'version:' skills/{spec,plan-orchestration,land,plan,ordo-help,repo-setup}/SKILL.md` prints 5.0.0, 3.1.0, 3.0.0, 5.0.0, 4.0.0 and 4.0.0.
  - `git log --oneline 0158079..HEAD -- skills` prints nothing.
  - Matches.
- **The verify list.** `awk '/^verify:/...' orchestrator-state.md` holds the six commands of `docs/dev/building.md` lines 6 to 11, with the filters of `docs/dev/change-standard.md`. Matches.
- **ADRs.** `ls docs/adr` lists 0001 to 0012, `README.md` and `template.md`. The quoted decision sentences of 0011 and 0012 match the files. Matches.
- **The glossary sync.** `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0. Matches.

Findings:
1. "`land` Steps 6 (lines 64 to 96)" is wrong: Steps 6 is lines 69 to 96. A builder reading 64 to 68 as part of Steps 6 takes the end of Steps 4 and all of Steps 5 to be the place to change.
2. "`orchestrator-state.md` line 33" does not give the three `landing` values. It names the key alone.

## 4. Cases and checks

- **Case 1** (the second `/spec` refused at `workers_at_once: 2`): consistent. Its expected refusal "names plan 5's step 2 at `landing: preparing`", while the Stops row "A step in flight" shows only "The steps in flight, each named with its plan". The case reads correctly if "at `landing: preparing`" describes the step rather than the message.
- **Case 2**: consistent with the rules file and the standards.
- **Case 3**: inconsistent with the brief's own item 2. Plan 5's step 2 starts first, and item 2 allows other skills only while a brief-check agent runs, which is after Steps 4. In one session, plan 5's step 2 has its brief on disk before plan 3's step 1 can start, so the case cannot arise as written ("The same", that is, two runs in one session). It arises in two sessions, or when plan 5's `/spec` was interrupted before its Steps 4 and is taken over later.
- **Case 4**: consistent.
- **Case 5**: inconsistent with `skills/spec/SKILL.md:78` ("An uncommitted change on this plan's `plan.md` or state file that the session did not make is a refusal") and `skills/plan-orchestration/SKILL.md` "Resuming", "One on the `plan.md` or the state file of the plan a `/spec` run prepares a step of is a refusal of `/spec`".
  - The session that takes over did not write the uncommitted `landing: preparing` entry, nor any premise correction in `plan.md`.
  - Item 4's third bullet exempts only the brief and the brief-check report.
  - If the stopping session committed its records at the handover, as "Resuming" requires, then the brief is committed too, and the case's "uncommitted brief" does not arise.
  - Either way, the expected "does not refuse" has no rule behind it.
- **Case 6**: consistent with `land` Steps 6 and Steps 12.
- **Case 7**: consistent with `land` "Rules" and ADR 0012.
- **Case 8**: consistent in form. Its wording "for the user's ruling" is the subject of a finding in section 8.
- **Case 9**: consistent.
- **Item 6, "under `docs/dev/skill-layout.md` lines 23 to 28".** This is a requirement of "What to build", read against the rules file. The rules file, "Where the work happens", says "A ledger file cites a page (the rules page, a standard, a skill's text) by its section, never by a line number". This cites a standards page by line number, and the section is "Frontmatter". The premises elsewhere give a grep hit's line together with its section, which the brief-check template allows for a grep hit.
- No case asks the builder to check, quote or explain a place the step does not change.

Findings:
1. Case 3 cannot arise in one session under item 2's own rule. Its first read on the changed texts proves nothing about the compare it is meant to check. It needs two sessions, or a takeover of an interrupted `/spec` before its Steps 4.
2. Case 5 expects no refusal where `spec` Steps 1 (`:78`) and "Resuming" refuse on the state-file entry and on any `plan.md` correction left by a session that did not take over cleanly. Item 4 exempts only the brief and the report. Following the brief, the builder writes an exemption that the unchanged line 78 overrides.
3. Item 6 cites `docs/dev/skill-layout.md` by line number, against the rules file's "Where the work happens".

## 5. The question

Here the goal is the part of the plan's goal this step delivers: the texts fixed so that step 4's second real run can show the gate with no hold by hand, with one limit across plans, the compare across plans, landings one at a time and the one report with each plan's position.

- **Case 1**: no. A text that still counts only `not-started` entries fails this read.
- **Case 2**: yes. The compare is read against the other step's brief as it stands before that step's brief check ends. Item 1 has "the later one to reach its Steps 5" make the compare, but "Steps / The brief check" 4 lets the session change the earlier step's brief, its "Paths this step writes" included, after the later step has compared against it. No rule compares again. In step 4's run, a brief-check finding that adds a path leaves a shared file unseen, and the case still reads as met.
- **Case 3**: yes, because it cannot arise in one session (section 4). A reading can mark it met without any run exercising it.
- **Case 4**: no.
- **Case 5**: yes. A reader who checks only the brief and report exemption passes the case while `spec:78`, and `spec:86-87` ("A worktree or branch that exists") for a `/spec` interrupted after its Steps 7, still refuse the takeover. Item 4 covers only an interruption before the preparation commit. A `/spec` interrupted after Steps 6 or 7 leaves a committed brief, a worktree and a `preparing` entry. Running `/spec` again is then refused by `:86-87`, which exempts only a `backed-out` entry.
- **Case 6**: no for another plan's record. It does not cover a record of the same plan: another step's uncommitted report fails this step's landing in the same way. That is the shape step 4 sets up, since plan 3's steps 1 and 2 can run in parallel. Item 5 and case 6 cover only "another open plan", so step 4 can hit finding 2 again inside one plan.
- **Case 7**: no.
- **Case 8**: no.
- **Case 9**: yes, for the brief and the brief-check report. The case checks only `plan.md`. The same-plan commits that the texts sweep with "the session's own records" (section 1, finding 4) also take the waiting `/spec`'s brief and report, and case 9 still reads as met.
- **The step line's check.** Yes: each changed text is read against the line, the glossary sync passes, `checks.sh` passes and the pin is checked, and all of that can hold while `skills/diagnose/SKILL.md:46/49` and `self-rule.md:151/155` contradict the change, since they are outside the paths. Step 4's run is the real proof.
- **Verify 1** (glossary sync, sync test, character set): yes. These are facts about the form only, which is acceptable for a text step, since they do not judge content.
- **Verify 2** (`grep -n 'preparing' ...`): yes. It finds the word, not whether the rules around it hold (cases 2 and 5 above). Reading in place is the guard.
- **Verify 3** (`grep -n 'the closing' ...`): yes. "the closing" already appears in `plan-orchestration` (for example "after a closing", "The closing step's `/roadmap done`"), so the grep prints lines without the new form being present. The check needs the form's own words, such as `grep -n 'Plan step <m> of <m>: the closing'`.
- **Verify 4** (versions): yes. It prints the versions and does not judge them. It leaves out `diagnose`, which needs a change.
- **Verify 5** (reading against the list rules): no, it is a read.
- **Items 2 and 5**: no verify line locates them. They are judged by reading, which is acceptable for a text step.
- **Item 1**: yes, without a way to tell an interrupted `/spec` from a live one. A step at `landing: preparing` whose `/spec` is waiting on its brief check, in this session or another, looks the same as an interrupted one. The entry holds only `step` and `landing`. Under items 1 and 4, `/spec` run again (by hand, following `ordo-help`'s next command from item 4) takes the entry over. No report is on disk yet, so it starts a second brief-check agent beside the live one. Recording the brief-check agent's id in the entry when it starts, as `session_id` records a builder's, would let the preflight and "Resuming" check the runner's listing.
- **Item 1, "the state file reads back as it was apart from the session's own records"**: yes, ambiguous. If a same-plan landing rewrote the state file while the `/spec` waited (removing its entry and the position line), "as it was" read as "as at the preflight" restores the landed step's entry. The reading that holds is "with only this step's entry removed".
- **Item 2**: yes (section 1, finding 4). It also assumes the brief-check agent runs in the background. `spec` "Steps / The brief check" 1 does not say so, and `plan-orchestration` says it only for a builder ("Launching a builder": "It runs in the background").
- **Item 3**: no for the three named parts. The tag and the pin of kind 4 have no form (section 1).
- **Item 4**: yes, as given under case 5.
- **Item 5**: yes, for a record of the same plan, as given under case 6.
- **Item 6**: yes, since `diagnose` is left out.

Findings:
1. Case 2 and item 1: no compare again after the earlier step's brief changes at its brief check.
2. Case 5 and item 4: the takeover is refused by `spec:78` and, after Steps 7, by `spec:86-87`.
3. Item 1 gives no way to tell a live waiting `/spec` from an interrupted one, so a second brief check can start beside a live one.
4. Case 6 and item 5 do not cover the same-plan record.
5. Case 9 and item 2 miss the same-plan commits that take the waiting brief and report.
6. Verify 3's grep passes without the new form.
7. Item 1's "reads back as it was" is ambiguous after a same-plan commit.
8. Item 2 relies on the brief-check agent running in the background, which `spec` does not state.

## 6. Implied inputs

This is not a code step. Every path in "Paths this step writes" is a `.md` file, and the brief says "No script changes: the step is a text step".

Findings: none.

## 7. ADRs

- **0001 to 0005, 0007 to 0009.** Read from each record's "Status: proposed" line and Decision section. None touches the step: they govern the writing base, the prose standard over academic sources, a draft reviewer, the self-rule ending, the choices file, the repair-round reviewer model and the cost script.
- **0006**, "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: ... the brief check in `brief_check`". The step changes when the dispatch entry exists, not where the brief check is recorded, which is still `brief_check` at Steps 9. It does not touch the step as the brief writes it. It would touch the step if the brief took up section 5, finding 3, recording the brief-check agent in the `preparing` entry.
- **0010**, "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands". The step does not change this. Decision 1 places the entry after the compare. Named by the brief.
- **0011**, "Each plan keeps its own dispatch block in its own state file. The skills read the dispatch blocks of every open plan to count the steps in flight against the one limit, to compare a brief's paths with the steps in flight, and to resume." This touches the step and is named by the brief. Item 1 keeps the count and the compare over the dispatch blocks, so there is no contradiction.
- **0012**, "Every commit a skill makes on main names its paths in the commit command" and "A landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill." This touches the step and is named by the brief. Items 2 and 7 keep both sentences. Item 2 reads more into the first sentence than it says (section 1, finding 4), but that is not a contradiction of the record.

Findings: none.

## 8. Dictated text

- "Roadmap entry <n> (<title>). Plan step <m> of <m>: the closing. Next: <the closing's next part>." Found by `grep -n 'Plan step <m> of <m>' .../briefs/3.md`, which prints line 76. Holds.
- "the closing report" (`grep -n 'the closing report;'`, line 78): holds.
- "the roadmap diff of `/roadmap done <n>`, for the user's ruling" (`grep -n "for the user.s ruling"`, lines 79 and 114, in item 3 and case 8): breaks two rules.
  - `skills/repo-setup/templates/docs/dev/prose-standard.md`, D, "No synonym cycling". The same wait is "The user's approval of the diff" in `plan-orchestration` "Stops" row "The roadmap diff" (line 405), and "the user's approval of that diff" in `references/self-rule.md` lines 62 and 64.
  - `docs/dev/skill-layout.md`, "Writing for an agent". "A term that `docs/glossary.md` defines is used only in a sense it defines there", and the glossary's **ruling** is "the user's decision on an open item, typed as `Ruled: <the choice>`". The roadmap diff is approved at `/roadmap`'s own approval stop.
  - "for the user's approval" holds.
- "the move of the folder to `<archive_root>/`" (`grep -n 'the move of the folder'`, line 80): holds.
- `step: <n>` and `landing: preparing` (`grep -n 'landing: preparing'`, line 56): code lines, read whole. Holds.
- `/spec <entry> <step>` (`grep -n '`/spec <entry> <step>`'`, lines 85 and 87): a command. Holds.
- The glossary wording of **in flight** is not dictated ("The builder words the entry").

Findings:
1. "for the user's ruling" (lines 79 and 114) breaks the prose standard's D, "No synonym cycling", and `docs/dev/skill-layout.md` "Writing for an agent" (the glossary sense of "ruling"). Use "for the user's approval", in item 3 and in case 8.

## Declined to judge

- Decision 4: whether a correct step should be taken back out of main because of an uncommitted file of another plan that the session did not write, or whether the landing should stop without a back-out. That is a design choice for the orchestrator, or for the user. The brief states its reason, and a read cannot settle it.
- Run finding 4 of `2-report.md` (`plan` Steps 2 and the "Could run in parallel" sub-bullet). Neither the ruling "Open item Step 2, condition 7 shown only through a hold" (findings 1, 3, 6, 7 and 8) nor this step assigns it. `docs/roadmap.md` entry 2.K names findings 1, 3, 6 and 7. It lies outside this step's line, so it is not judged here.
- Whether the orchestrator's pick in `plan-orchestration` Steps 2 needs its own text on a step at `preparing` is not judged: "The limit." bullet, which item 1 changes, governs it.

Usage: a6ce8870a2a7c0b32, claude-opus-5-5, 232837 tokens, 45 tool uses, 9 min 16 s


## Closed

Each finding is closed by a change to the brief `agents/briefs/3.md`.

- Names 1 (`diagnose` made false): `skills/diagnose/SKILL.md` is added to "Paths this step writes", to the reading list and to the files checked; item 1 asks for its lines 43 to 49 and its refusal "No dispatch entry" to be worded for a step at `landing: preparing`; item 6 and Verify 4 cover its version.
- Names 2 (`self-rule.md` "The review of a choice"): the file is added to the paths and the reading list; item 1 asks which action a step at `landing: preparing` takes, and Decision 7 takes it: not yet prepared.
- Names 3 (kind 4 names a tag and a pin): item 3 adds "the tag and the pin, for the user's approval, where the plan's rulings set them" to the closing's next parts.
- Names 4 (same-plan commits take the waiting `/spec`'s records): item 2's second bullet now says only the preparation commit carries the waiting `/spec`'s brief and brief-check report, and names each sentence that must say this exception; case 9 checks it.
- Names 5 (unnamed in-path places): each is listed under "What is on the tree", and items 1, 2 and 3 name the change at `spec` Steps 5 line 189, "Steps / A step taken back out of main" 5 and 6, the Stops row "A step in flight", `ordo-help` line 96, the state-file template's position line and `plan-orchestration` Steps 5.
- The step line 1 (tag and pin): a section "After the landing: the orchestrator's part, not the builder's" names the tag, the pin and their check.
- The step line 2 (the file list): `skills/repo-setup/` with `SKILL.md` and every template, and `skills/diagnose/SKILL.md`, are added.
- Premises 1: `land` Steps 6 is cited as lines 69 to 96.
- Premises 2: the template's line 33 is described as naming the key `landing` with no values; item 1 asks the comment to give the values.
- Cases 1 (case 3): case 3 is rewritten to an interrupted `/spec` taken over, and gains the compare made again after a brief check changes the paths.
- Cases 2 (case 5) and the question 2: item 4 now says the run that takes over treats the entry, the brief, the brief-check report and its plan's `plan.md` changes as its own records, and goes on at Steps 7 after the preparation commit with the worktree and branch exempt; case 5 checks both.
- Cases 3 (line-number citation): item 6 and the premise cite `docs/dev/skill-layout.md` by its section "Frontmatter".
- The question 1 (no compare again): item 1 adds the compare made again before the preparation commit when the paths change at the brief check.
- The question 3 (live or dead brief check): item 1 writes `running: <agent id>` into `brief_check` when the agent starts, item 4 waits for a listed agent, and Decision 6 records why the existing key is used.
- The question 4 (same-plan record): item 5 and case 6 cover a record of another step of the same plan.
- The question 5: closed with Names 4.
- The question 6 (Verify 3): it greps `Plan step <m> of <m>: the closing` in three files.
- The question 7 ("reads back as it was"): item 1 says "with only this step's entry removed".
- The question 8 (background): item 2 asks `spec` "Steps / The brief check" 1 to say the agent runs in the background, and `plan-orchestration` Steps 5 to stop forbidding the other skills meanwhile.
- Dictated text 1: "for the user's ruling" becomes "for the user's approval" in item 3 and case 8. The lines rewritten or added after the check, held line by line against the prose standard and `docs/dev/skill-layout.md`: "the roadmap diff of `/roadmap done <n>`, for the user's approval;" holds, the wording of `plan-orchestration` "Stops" row "The roadmap diff"; "the tag and the pin, for the user's approval, where the plan's rulings set them;" holds; `running: <agent id>`, a code value, holds.
