# Step 1 report: the skill-text fixes from the retro and the real run

Everything in the brief is done.

## Open items of the state file

none

## The cases' first run

All of it was run on the unchanged tree (the base 64c500d, `git status --short` empty) before any file was changed. No case is one the brief's rules get wrong, so no hand-back was made. `$K` stands for the scratch folder `$TMPDIR/2k` holding the sentence files (`$K/s/i1` and so on, each the sentence of the item exactly as the brief gives it) and the two scripts that ran the cases; they are outside the repository.

- C1, run as `sh $K/c1.sh` from the worktree root, which runs `grep -n -F -f $K/s/<item> <file>` and `grep -c -F -f ...` for each sentence and each file the item names. Every sentence printed no line and count 0:
  - `item 1 docs/dev/change-standard.md: count=0`, `item 1 skills/repo-setup/templates/docs/dev/change-standard.md: count=0`, `item 1 skills/repo-setup/templates/shared-rules.md: count=0`
  - `item 3 skills/land/SKILL.md: count=0`, `item 4 skills/land/SKILL.md: count=0`
  - `item 7 skills/repo-setup/templates/shared-rules.md: count=0`, `item 8 skills/repo-setup/templates/shared-rules.md: count=0`
  - `item 9 skills/plan-orchestration/SKILL.md: count=0`, `item 11a ... count=0`, `item 11b ... count=0`
  - `item 10 skills/roadmap/SKILL.md: count=0`, `item 12 skills/refute/SKILL.md: count=0`
- C2: `grep -c -F -f $K/s/i2b <file>`, the pattern being item 2's text from `xargs -0 sh -c` to `fi; done' sh`: `docs/dev/building.md: 0`, `docs/dev/change-standard.md: 0`.
- C3: `grep -n -F 'A landing is held to the checks main holds once the step is on it.' docs/adr/0010-...md` printed nothing (exit 1); `grep -c -F 'at that moment' docs/adr/0010-...md` printed `1`.
- C4: `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests` (the four cases of the base).
- C5 (read on the unchanged tree; none of items 5 and 13 to 21 is there):
  - item 5: `skills/land/SKILL.md` Steps 2 reads "compare the plan's verify list with the verification page's commands, as the `spec` skill's Steps 1 says", names no worktree copy; "What it reads" 8 says "for the compare of Steps 2" and not whose copy; `grep -n 'git diff --quiet' skills/land/SKILL.md` printed nothing.
  - item 13: `grep -n "printf '%s" skills/spec/SKILL.md skills/spec/templates/brief.md` printed nothing.
  - item 14: `grep -n -i 'character set\|angle brackets' skills/spec/templates/brief.md skills/plan-orchestration/SKILL.md` printed only brief.md line 69, the "Conventions" placeholder (`character set, line shape, ...`); the "Report" section and Steps 6 hold no rule.
  - item 15: Steps 8 "Before the resume" and Steps 6 said nothing of a copy into the worktree's ledger (`grep -n -i "copies the round's brief"` printed nothing; line 94 only says the builder writes its report in the worktree's copy).
  - item 16: `grep -n -i 'character set\|angle brackets' skills/refute/SKILL.md skills/refute/templates/report.md` printed nothing.
  - item 17: `skills/refute/SKILL.md` Steps 6 lines 75 and 76 had the reviewer write the usage line; `report.md` lines 42 and 63 were `Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.`.
  - item 18: `grep -n -i 'closing' skills/plan-orchestration/SKILL.md` printed no line in Steps 2 or 3 (lines 51 to 73).
  - item 19: Steps 4 line 87 `- The no-git rule.` and line 93 `- **The builder.** It never runs a git command.`
  - item 20: the last bullet of "Reports" (line 391) read `Then anything NOT DONE first, then the DONE / NOT DONE ledger naming the command that proves each row.`
  - item 21: `grep -n` of the five entries in `plan-terms.md` printed the "Stated in" lists the brief names (closing step without `plan-orchestration`, rule clash without `land`, hand-back as the stop before any code, delta "from the commit or tree state recorded when the round was sent").
- C6 (read): land 3.0.0, plan-orchestration 5.0.0, refute 3.0.1, spec 5.0.0, roadmap 1.3.1, repo-setup 4.0.0.
- C7, run as `bash $K/c7.sh $K/chk1.txt` (the check text of item 2 in `chk1.txt`, each form run through `bash -o pipefail -c` in a `$TMPDIR` folder holding `a.md` and, for the control, `t.txt` with a tab):
  - `-- old form (no filter), a.md z.md:` printed `Can't open z.md: No such file or directory at -e line 1.` and `exit 0`.
  - `-- new form, a.md z.md:` printed nothing and `exit 0`.
  - `-- new form control, a.md t.txt z.md:` printed `t.txt:1: a<tab>b` and `exit 1`.
- C8: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.

## DONE / NOT DONE

Every row is DONE. Line numbers are those of the tree as it stands.

| Item | Proof (command or reading, output as printed) |
|---|---|
| 1 | `sh $K/c1.sh`: `C1 item 1 docs/dev/change-standard.md: count=1 55:22. **No breakage testing.** ...`, `C1 item 1 skills/repo-setup/templates/docs/dev/change-standard.md: count=1 53:21. ...`, `C1 item 1 skills/repo-setup/templates/shared-rules.md: count=1 17:- **No breakage testing.** ...`. Rule 13 bullets 1 and 2 (`docs/dev/change-standard.md` lines 42 and 43, the template lines 41 and 42), `skills/spec/templates/brief.md` lines 82 to 85 and `skills/refute/SKILL.md` lines 135 to 137 now say one run on the unchanged tree before the code changes, a preserved behaviour run there before and after, an edit read; `grep -rn 'unchanged tree' skills docs README.md utils` (quoted below) shows no sentence asking for a run on the old code after the code changed. The sentence "The report quotes each run verbatim beside the test's name and names no revert." stays in rule 13. |
| 2 | C2 after: `docs/dev/building.md: 11:git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f"` and `docs/dev/change-standard.md: 75:git ls-files -coz ...`. `docs/dev/building.md` line 25: "...every untracked file git does not ignore that exists on disk, so a file deleted in a worktree and not yet staged is left out: it prints each line...". The command taken from line 75 and run with `bash -o pipefail -c` in a scratch repository whose tracked `z.md` was deleted printed nothing and exited 0. |
| 3 | `C1 item 3 skills/land/SKILL.md: count=1 82:   - A finding that is a clash between two of the user's ...` |
| 4 | `C1 item 4 skills/land/SKILL.md: count=1 83:   - A ruling is carried out on what it names; ...` |
| 5 | `skills/land/SKILL.md` lines 44 ("What it reads" 8), 52 to 62 (Steps 2). `docs/adr/0010-...md` line 20 (C3 below). The sentence "`git diff --quiet <base> -- <page>`, run from inside the worktree, exits 1" was run before it was written, in a scratch repository: unchanged page `exit 0`; page edited and uncommitted in the worktree `exit 1`. No script changed. |
| 6 | `skills/land/templates/land.test.sh` lines 158 to 181 (new case `verification`), head comment lines 5 to 11, `docs/dev/building.md` line 6, `skills/land/SKILL.md` line 199. The runs are quoted under "The new land.test.sh case" below. |
| 7 | `C1 item 7 skills/repo-setup/templates/shared-rules.md: count=1 9:- **A decision is written down when it is given.** ...` |
| 8 | `C1 item 8 skills/repo-setup/templates/shared-rules.md: count=1 7:- **A proposal says what exists now.** ...` |
| 9 | `C1 item 9 skills/plan-orchestration/SKILL.md: count=1 97:     - That a shortcut is a finding, ...` |
| 10 | `C1 item 10 skills/roadmap/SKILL.md: count=1 90:   - The file is then compared with the approved draft, ...`. Steps 2 lines 79 and 80 and 87 write the draft whole to the scratch folder, Steps 3 (line 88) shows the diff against the draft, the "The step is done when" bullet of Steps 4 (line 94) stays last. |
| 11 | `C1 item 11a skills/plan-orchestration/SKILL.md: count=1 98:     - That a sentence the brief or a round gives ...` and `C1 item 11b skills/plan-orchestration/SKILL.md: count=1 149:     - A dictated sentence that says how a script behaves ...` |
| 12 | `C1 item 12 skills/refute/SKILL.md: count=1 208:- The reviewer runs no git command other than ...`. "What it reads" 5 lines 41 to 42, "Over a repair round" 2 and 3 lines 96 and 97, `skills/plan-orchestration/SKILL.md` line 153 (saves `git diff <base>` to `agents/reviews/<step>-round-<n>-sent.diff`), the term **delta** in `plan-terms.md` line 31 and `docs/glossary.md`. |
| 13 | `skills/spec/SKILL.md` line 175 and `skills/spec/templates/brief.md` line 77 (`grep -n -F "printf '%s"`). |
| 14 | `skills/spec/templates/brief.md` line 93 ("Report"), `skills/plan-orchestration/SKILL.md` lines 118 and 119 (Steps 6). |
| 15 | `skills/plan-orchestration/SKILL.md` lines 151 and 152 (Steps 8 "Before the resume") and 129 and 130 (Steps 6, the cases ruling). |
| 16 | `skills/refute/SKILL.md` Rules line 209, Steps 7 lines 82 and 83, `skills/refute/templates/report.md` line 5. |
| 17 | `skills/refute/SKILL.md` Steps 6 lines 77 and 78 (the usage line is no longer written by the reviewer, "Done when" no longer names it), Steps 7 line 81, "Over a repair round" 6 line 104; `skills/refute/templates/report.md` lines 44 and 65: `Reviewer usage: <the session fills this from the completion notice: agent id, served model, tokens, tool uses, minutes>.` |
| 18 | `skills/plan-orchestration/SKILL.md` Steps 2 lines 62 to 67. |
| 19 | `skills/plan-orchestration/SKILL.md` line 93 (the prompt) and line 101 ("The builder"); `grep -rn "no-git rule\|never runs a git command" skills docs README.md` printed nothing. |
| 20 | `skills/plan-orchestration/SKILL.md` "Reports" lines 397 to 401 (the opening line, then the position lines, the landed steps, the choices) and line 408 (the closing DONE / NOT DONE ledger); line 401 keeps the landing report's own order through `land` Steps 11. |
| 21 | `skills/repo-setup/templates/plan-terms.md` lines 23, 31, 47, 79 and 103, and the same in `docs/glossary.md`; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. |

Checks (from the worktree root):

- `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests`.
- `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
- `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'` printed the counts 965 diagnose, 877 grill, 725 land, 564 ordo-help, 632 ordo-init, 1018 plan-orchestration, 616 plan-retro, 477 plan, 989 refute, 783 repo-setup, 1022 roadmap, 831 session-retro, 1003 spec; none is above 1024 and no description was changed.
- C1 after, `sh $K/c1.sh`: one line for every sentence and file (`count=1`), the lines quoted in the rows above.
- C2 after: one line in each file (`docs/dev/building.md: 11:...`, `docs/dev/change-standard.md: 75:...`).
- C3 after: `grep -n -F 'A landing is held to the checks main holds once the step is on it.' docs/adr/0010-...md` printed `20:A landing is held to the checks main holds once the step is on it. Each prepa...`; `grep -c -F 'at that moment' ...` printed `0`.
- C6 after: land 3.1.0, plan-orchestration 6.0.0, refute 3.1.0, spec 5.1.0, roadmap 1.4.0, repo-setup 4.1.0, each one part raised and the parts after it 0.
- C7 after, the same `bash $K/c7.sh $K/chk1.txt` run: `Can't open z.md: No such file or directory at -e line 1.` and `exit 0` (old form); nothing and `exit 0` (new form); `t.txt:1: a<tab>b` and `exit 1` (control).
- C8 after: `ok: the plan-terms block equals the template`, exit 0.
- C4 after: `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests`, with the new case among those run.
- The character-set check over the 18 paths of "Paths this step writes", the report included, `printf '%s\0' <the 18 paths> | xargs -0 perl -CSD -ne '<the check, as the brief gives it>'`, run as `bash -o pipefail $K/cs.sh` (the file holds that command with the paths written out): it printed nothing and the exit status was `exit 0`.

### The new land.test.sh case

It is a test of a behaviour the change preserves in `land.sh` (it runs the list it is given on main after the wip commit and the cherry-pick), so it passes on the unchanged tree and after the change, and there is no failing run to quote for it. The step changes neither `land.sh` nor `checks.sh` (`cmp` below). It asserts `$ sh utils/added.test.sh`, `PASS: added test` and `checks: 1 commands passed` in the output of `land.sh` for a step whose script and verification page are left uncommitted in the worktree; the output of that case, printed by a scratch copy of the test with one extra `printf` of `$verification_output`, was:

```
$ sh utils/added.test.sh
PASS: added test
checks: 1 commands passed
=== booking ===
Staged paths:
docs/verification.md
utils/added.test.sh
=== end booking ===
```

Runs, each from `sh <file> 2>&1 | tail -1`:

- Changed `land.test.sh` with `land.sh` and `checks.sh` from `git show HEAD:skills/land/templates/` (byte-equal to the tree's, `cmp` printed nothing), run before the head comment and the other parts were finished: `PASS: land.sh scratch tests`. The same arrangement run again after the last change: `PASS: land.sh scratch tests`.
- The base `land.test.sh` from `git show HEAD:skills/land/templates/land.test.sh`: `PASS: land.sh scratch tests`.
- The changed `land.test.sh` in place, after the change: `PASS: land.sh scratch tests`.

### Rule 14

- `grep -rn "no-git rule\|never runs a git command" skills docs README.md` printed nothing.
- `grep -rln "git ls-files -coz" skills utils docs README.md` printed `docs/dev/change-standard.md` and `docs/dev/building.md`; the template change standard holds the command block placeholder only.
- `grep -rn 'Reviewer usage\|usage line' skills` hits: `skills/refute/SKILL.md` lines 77, 81, 86, 104 and `skills/refute/templates/report.md` lines 44 and 65 (all changed), `skills/spec/SKILL.md` lines 429 and 433 (the brief-check report's own usage line, already filled by the session, unchanged), and two in `sync_rules.py` that mean a command's usage message.
- `grep -rn 'unchanged tree' skills docs README.md utils` hits outside the lines changed: `skills/refute/SKILL.md:42` and `:124`, `skills/spec/SKILL.md:180`, `skills/spec/templates/brief.md:29, 32, 35`, `plan-terms.md`/`glossary.md` "case" (the first run of every case on the unchanged tree, before any change) and `skills/repo-setup/templates/docs/dev/coding-standards/common.md:13` (names rule 13 by its title, which is unchanged); none asks for a run on the old code after the code has changed.
- Sentences about a changed file as a whole, each reread: `land.test.sh` head comment lines 2 to 11 lists five cases and holds; `docs/dev/building.md` line 6 lists five cases, and line 25 is the changed paragraph; `skills/land/SKILL.md` line 10 (introduction), line 197 (the cases) and the Steps 2 "Done when" line 61 hold; `skills/plan-orchestration/SKILL.md` line 10 (introduction), the Stops table's "seven kinds of stop" and the Rules bullet on counts hold, and line 228 lists the diff saved for the reviewer among the round's commit contents; `skills/refute/SKILL.md` line 10 (what it leaves behind) and the Quick start line hold; `skills/roadmap/SKILL.md` line 10 holds; the introductions of `docs/dev/change-standard.md` and its template hold; the glossary entry **position line** said the position line is "the orchestrator's report" and was reworded to "follows the opening line of the orchestrator's report" because item 20 puts a line before it.

## The terms

Each term of `docs/glossary.md` the diff adds, changes or uses in a new place, read against its entry:

- **closing step**: used in `plan-orchestration` Steps 2 lines 62 to 67 as "the last step of a plan, which `/plan` writes itself"; entry changed: "Stated in: `plan`, Steps 2; `plan-orchestration`, Steps 2." `grep -n 'closing step' skills/plan-orchestration/SKILL.md` within Steps 2 (lines 56 to 71): lines 62 and 67.
- **rule clash**: used in `skills/land/SKILL.md` line 82 as the stop "A rule clash" of `plan-orchestration`; entry changed: "...; `refute`, \"Finding dispositions\"; `land`, Steps 6." `grep -n -i 'rule clash' skills/land/SKILL.md` printed line 82 only, which is inside Steps 6 (lines 75 to 110).
- **hand-back**: used as "handed back" in `plan-orchestration` Steps 4 lines 97 and 98 and as "hands back" in Steps 6 line 123; entry changed to cover the return before the report, "Stated in: `plan-orchestration`, Steps 4 and 6." `grep -n 'handed back\|hands back' skills/plan-orchestration/SKILL.md` printed lines 97, 98 and 123.
- **delta**: used in `skills/refute/SKILL.md` "Over a repair round" 3 and 4 (lines 97 and 98) and `plan-orchestration` Steps 8 line 172; entry changed to the difference of two `git diff <base>` outputs. `grep -n 'delta'` printed those lines.
- **position line**: entry reworded (not named in item 21), "Stated in" unchanged; `grep -n 'position line' skills/plan-orchestration/SKILL.md` printed lines 388, 389, 396, 398, 401, 403 and 463 in "Reports" and Stops.
- Used in a new place, entry unchanged and still true: **completion notice** (`refute` Steps 7 and "Over a repair round" 6, as the source of the usage line), **base** (`git diff <base>` in `refute` and `plan-orchestration`), **ledger** (the copy into the worktree's copy of the ledger, as the entry says the worktree holds a copy), **brief** and **cases ruling** (copied into that copy), **Declined to judge** (`refute` Rules line 208), **ruling** and **open item** (`land` lines 82 to 83), **in flight** and **dispatch entry** (the closing step has no dispatch entry and takes no slot), **landing** (the closing step's commits are outside any landing), **orchestrator**, **builder**, **rules file**, **verify list** is not a glossary term.

## The versions

- land 3.0.0 to 3.1.0 (minor): Steps 2 reads a page the step changed from the worktree and Steps 6 holds two new rules; every run that worked before still works.
- plan-orchestration 5.0.0 to 6.0.0 (major): the orchestrator's final report no longer opens with the position lines but with a NOT DONE line and ends with a new ledger, so its output is changed; the prompt, Steps 6 and Steps 8 also gain text.
- refute 3.0.1 to 3.1.0 (minor): the reviewer may run `git show <base>:<path>`, reads a saved round diff, writes its report in the rules file's character set and no longer writes its usage line, which the session fills; the refuter report keeps every part it had.
- spec 5.0.0 to 5.1.0 (minor): the brief gains the `printf` form of a git-started check and the character-set rule for the report, and its test-run requirement narrows to one run on the unchanged tree.
- roadmap 1.3.1 to 1.4.0 (minor): Steps 2 to 4 keep the draft as a whole file in the scratch folder and compare the written file with it.
- repo-setup 4.0.0 to 4.1.0 (minor): the shared-rules block and the change standard it writes gain rules and the plan-terms block changes entries; `SKILL.md` is changed for the version only.

## The files, with line counts

```
  20 docs/adr/0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md
  29 docs/dev/building.md
  87 docs/dev/change-standard.md
 151 docs/glossary.md
 266 skills/land/SKILL.md
 182 skills/land/templates/land.test.sh
 500 skills/plan-orchestration/SKILL.md
 212 skills/refute/SKILL.md
  69 skills/refute/templates/report.md
 245 skills/repo-setup/SKILL.md
  73 skills/repo-setup/templates/docs/dev/change-standard.md
 134 skills/repo-setup/templates/plan-terms.md
  27 skills/repo-setup/templates/shared-rules.md
 219 skills/roadmap/SKILL.md
 496 skills/spec/SKILL.md
 107 skills/spec/templates/brief.md
 183 .scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/agents/reviews/1-report.md
```

Counts are the output of `wc -l` on the final tree. `skills/plan-orchestration/references/self-rule.md` was read against the changes and holds no sentence they make false, so it is unchanged.

## Judgment calls

- Rule numbers: "No breakage testing" is rule 22 of `docs/dev/change-standard.md` and rule 21 of the template, the next number of each.
- Rule 13 bullets 1 and 2 keep "new or changed" (the ruling says "a new test"), so the scope of the old text is kept.
- Item 5: the compare reads the page "as the cherry-pick will bring it" in three bullets, and the merge case is stated as replacing either copy; "What it reads" 8 says whose copy.
- Item 6: the scratch case adds `verification: docs/verification.md` to its `plan.yaml`; `land.sh` reads only `ledger_root` and `worktree_root`, so the key is the realistic fixture and nothing reads it.
- Item 10: Steps 2 gets a separate bullet for the scratch draft, and the Steps 4 "The step is done when" bullet now also says `diff` prints nothing; it stays last.
- Item 12: the saved diff is made for a repair round only (the round-0 builder has changed nothing, so it has no delta); `plan-orchestration` "Resuming, and handing the plan over" line 228 names the saved diff among a round's commit contents; `refute` Steps 4 gains one sub-bullet saying a quoted command that runs another git command is named under "Declined to judge" and not run, since "runs every command the report quotes" would otherwise contradict the new Rules bullet (rule 19 of the rules file). That sub-bullet serves item 12.
- Item 17: the report template's usage lines carry a placeholder naming the session as who fills them, and `refute` Steps 6 says the reviewer leaves the line as the template gives it.
- Item 18: the sentence is a closing-step bullet with four sub-bullets, one rule each, in Steps 2.
- Item 19: the rules file's `mv` is written `git mv` in the prompt and "The builder", since the rule lists git subcommands.
- Item 20: the first bullet on the orchestrator's report is rewritten to open with the NOT DONE line, the landing report bullet carries the `land` Steps 11 order, and the **position line** glossary entry is reworded; the last bullet is rewritten to the closing ledger.
- Versions: plan-orchestration is raised by a major part because its final report's opening and order changed (the other five skills by a minor part). The orchestrator may rule that this is a minor change.
- Prose standard E (sentences over about 20 words): the sentences given word for word are long by their approved wording: items 1 (37 words in two sentences, the first 30), 3 (26), 4 (24), 7 (51), 8 (27), 9 (37), 11 (38 and 28) and 12 (49), and the ADR sentence; item 10 (18) is within the guide. Mine over about 25 words, each kept because it states one rule with its qualifier: rule 13 bullets 1 and 2 in both change standards (28 to 34 words), `skills/spec/SKILL.md` line 175 and `skills/spec/templates/brief.md` line 77 (about 48 and 50 words, one rule whose form is the `printf` text), `skills/plan-orchestration/SKILL.md` line 93 and the "The builder" bullet (33 and 37, the rules file's git rule with its six subcommands), the Reports bullet at line 408 (33), `skills/refute/SKILL.md` Proof bullets (31 and 34) and "Over a repair round" 3 (29), `skills/roadmap/SKILL.md` Steps 3 (37, the original was 29), the glossary entries **delta** (40) and **hand-back** (second sentence 30), and the existing 79-word line 228 of `plan-orchestration`, which gained a clause.

## Host- or user-visible changes, before and after

- Written rules: `docs/dev/change-standard.md` and its template gain "No breakage testing" (22, 21), rule 13's first two bullets change from "run again after every change to the test" to one run before the code changes, and `shared-rules.md` gains three bullets (A proposal says what exists now, A decision is written down when it is given, No breakage testing).
- The character-set check in `docs/dev/building.md` and `docs/dev/change-standard.md`: before, it listed `git ls-files -coz` output and printed `Can't open z.md: ...` for a tracked file deleted in a worktree; after, it passes only files that exist on disk (C7).
- `land`: before, Steps 2 compared the list with the page on main; after, with the page as the cherry-pick brings it (worktree copy, main copy or the merge). Two new Steps 6 rules. ADR 0010's Consequences sentence reads "once the step is on it".
- `plan-orchestration`: the builder's prompt and "The builder" state the git rule and two new prompt items; Steps 6 checks the saved report's characters and copies a cases ruling into the worktree; Steps 8 copies the round's brief, saves `agents/reviews/<step>-round-<n>-sent.diff` and quotes a script sentence's run; Steps 2 states the closing step; "Reports" gives the new final-report order.
- `refute`: reviewer git is `git diff <base>`, `git status --short` and `git show <base>:<path>`; the round's delta is read against the saved diff; the usage line is filled by the session; the report is in the rules file's character set.
- `spec`: a brief names a git-started check with `printf '%s\0' <files> |` and says the report is in the rules file's character set.
- `roadmap`: the draft is a whole file in the scratch folder, shown as a diff against the file, compared with the written file before the commit.

## Anything in the brief that was wrong or impossible

Nothing. Two points the brief did not say, with the evidence: the old form of the character-set check (`printf '%s\0' a.md z.md | xargs -0 perl ...`) exits 0 as well as printing `Can't open z.md`, so the difference C7 shows between the forms is the printed line; and `git diff --quiet <base> -- <page>` on a page that is new and untracked in the worktree exits 0 (git diff reads tracked files), which does not arise for the verification page, a tracked file.
