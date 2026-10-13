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
| 1 | `sh $K/c1.sh`: `C1 item 1 docs/dev/change-standard.md: count=1 55:22. **No breakage testing.** ...`, `C1 item 1 skills/repo-setup/templates/docs/dev/change-standard.md: count=1 53:21. ...`, `C1 item 1 skills/repo-setup/templates/shared-rules.md: count=1 17:- **No breakage testing.** ...`. Rule 13 bullets 1 and 2 (`docs/dev/change-standard.md` lines 42 and 43, the template lines 41 and 42), `skills/spec/templates/brief.md` lines 82 to 85 and `skills/refute/SKILL.md` lines 138 to 140 now say one run on the unchanged tree before the code changes, a preserved behaviour run there before and after, an edit read; `grep -rn 'unchanged tree' skills docs README.md utils` (quoted below) shows no sentence asking for a run on the old code after the code changed. The sentence "The report quotes each run verbatim beside the test's name and names no revert." stays in rule 13. |
| 2 | C2 after: `docs/dev/building.md: 11:git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f"` and `docs/dev/change-standard.md: 75:git ls-files -coz ...`. `docs/dev/building.md` line 25: "...every untracked file git does not ignore that exists on disk, so a file deleted in a worktree and not yet staged is left out: it prints each line...". The command taken from line 75 and run with `bash -o pipefail -c` in a scratch repository whose tracked `z.md` was deleted printed nothing and exited 0. |
| 3 | `skills/land/SKILL.md` Steps 6 lines 82 to 84, in the form repair round 1 ruling 4 gives it (so the brief's original sentence of item 3 is no longer in the file: `C1 item 3 skills/land/SKILL.md: count=0`), and the Stops row "A rule clash at landing" at line 230. |
| 4 | `skills/land/SKILL.md` Steps 6 lines 85 to 88, in the form repair round 1 ruling 4 gives it (`C1 item 4 skills/land/SKILL.md: count=0` for the brief's original sentence). |
| 5 | `skills/land/SKILL.md` lines 44 ("What it reads" 8), 52 to 62 (Steps 2). `docs/adr/0010-...md` line 20 (C3 below). The sentence "`git diff --quiet <base> -- <page>`, run from inside the worktree, exits 1" was run before it was written, in a scratch repository: unchanged page `exit 0`; page edited and uncommitted in the worktree `exit 1`. No script changed. |
| 6 | `skills/land/templates/land.test.sh` lines 159 to 180 (new case `verification`), head comment lines 5 to 12, `docs/dev/building.md` line 6, `skills/land/SKILL.md` line 204. The case shows that a step's new test script and its command, left uncommitted in the worktree, reach main and that `checks.sh` runs the command there after the cherry-pick, with the verify list the fixture gives. The runs are quoted under "The new land.test.sh case" below. |
| 7 | `C1 item 7 skills/repo-setup/templates/shared-rules.md: count=1 9:- **A decision is written down when it is given.** ...` |
| 8 | `C1 item 8 skills/repo-setup/templates/shared-rules.md: count=1 7:- **A proposal says what exists now.** ...` |
| 9 | `C1 item 9 skills/plan-orchestration/SKILL.md: count=1 97:     - That a shortcut is a finding, ...` |
| 10 | `C1 item 10 skills/roadmap/SKILL.md: count=1 90:   - The file is then compared with the approved draft, ...`. Steps 2 lines 79 and 80 and 87 write the draft whole to the scratch folder, Steps 3 (line 88) shows the diff against the draft, the "The step is done when" bullet of Steps 4 (line 94) stays last. |
| 11 | `C1 item 11a skills/plan-orchestration/SKILL.md: count=1 98:     - That a sentence the brief or a round gives ...` and `C1 item 11b skills/plan-orchestration/SKILL.md: count=1 149:     - A dictated sentence that says how a script behaves ...` |
| 12 | `C1 item 12 skills/refute/SKILL.md: count=1 211:- The reviewer runs no git command other than ...`. "What it reads" 5 lines 41 to 42, `skills/plan-orchestration/SKILL.md` lines 153 to 158 (Steps 8 "Before the resume": the snapshot folder `<worktree_root>/<slug>-<step>-round-<n>/` with `files.txt`), `skills/refute/SKILL.md` lines 96 to 99 (the delta read from that snapshot), `skills/land/SKILL.md` line 220 (the folder removed with the worktree), the term **delta** in `plan-terms.md` line 31 and `docs/glossary.md`. |
| 13 | `skills/spec/SKILL.md` line 175 and `skills/spec/templates/brief.md` line 77 (`grep -n -F "printf '%s"`). |
| 14 | `skills/spec/templates/brief.md` line 93 ("Report"), `skills/plan-orchestration/SKILL.md` lines 118 and 119 (Steps 6). |
| 15 | `skills/plan-orchestration/SKILL.md` lines 151 and 152 (Steps 8 "Before the resume") and 129 and 130 (Steps 6, the cases ruling). |
| 16 | `skills/refute/SKILL.md` Rules line 212, Steps 7 lines 82 and 83, `skills/refute/templates/report.md` line 5. |
| 17 | `skills/refute/SKILL.md` Steps 6 lines 77 and 78 (the usage line is no longer written by the reviewer, "Done when" no longer names it), Steps 7 line 81, "Over a repair round" 6 line 106; `skills/refute/templates/report.md` lines 44 and 65: `Reviewer usage: <the session fills this from the completion notice: agent id, served model, tokens, tool uses, minutes>.` |
| 18 | `skills/plan-orchestration/SKILL.md` Steps 2 lines 62 to 67. |
| 19 | `skills/plan-orchestration/SKILL.md` line 93 (the prompt) and line 101 ("The builder"), both in the words of the change standards' "Where the work happens" with no "only"; `grep -rn "no-git rule\|never runs a git command\|reads only with" skills docs README.md` printed nothing. |
| 20 | `skills/plan-orchestration/SKILL.md` "Reports" lines 397 to 401 (the opening line, then the position lines, the landed steps, the choices) and lines 413 and 414 (the closing DONE / NOT DONE table, not called a ledger); line 401 keeps the landing report's own order through `land` Steps 11. |
| 21 | `skills/repo-setup/templates/plan-terms.md` lines 23, 31, 47, 79 and 103, and the same in `docs/glossary.md`; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. |

Checks (from the worktree root):

- `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests`.
- `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
- `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'` printed the counts 965 diagnose, 877 grill, 725 land, 564 ordo-help, 632 ordo-init, 1018 plan-orchestration, 616 plan-retro, 477 plan, 989 refute, 783 repo-setup, 1022 roadmap, 831 session-retro, 1003 spec; none is above 1024 and no description was changed.
- C1 after, `sh $K/c1.sh`: one line for every sentence and file (`count=1`) except items 3 and 4, whose sentences are in the form repair round 1 ruling 4 gives (`count=0` for the brief's original wording); the lines are quoted in the rows above.
- C2 after: one line in each file (`docs/dev/building.md: 11:...`, `docs/dev/change-standard.md: 75:...`).
- C3 after: `grep -n -F 'A landing is held to the checks main holds once the step is on it.' docs/adr/0010-...md` printed `20:A landing is held to the checks main holds once the step is on it. Each prepa...`; `grep -c -F 'at that moment' ...` printed `0`.
- C6 after: land 4.0.0, plan-orchestration 6.0.0, refute 4.0.0, spec 6.0.0, roadmap 1.4.0, repo-setup 5.0.0, each one part raised and the parts after it 0.
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
- `grep -rn 'Reviewer usage\|usage line' skills` hits: `skills/refute/SKILL.md` lines 77, 81, 86, 106 and `skills/refute/templates/report.md` lines 44 and 65 (all changed), `skills/spec/SKILL.md` lines 430 and 436 (the brief-check report's own usage line, already filled by the session, unchanged), and two in `sync_rules.py` that mean a command's usage message.
- `grep -rn 'unchanged tree' skills docs README.md utils` hits outside the lines changed: `skills/refute/SKILL.md:42` and `:127`, `skills/spec/SKILL.md:180`, `skills/spec/templates/brief.md:29, 32, 35`, `plan-terms.md`/`glossary.md` "case" (the first run of every case on the unchanged tree, before any change) and `skills/repo-setup/templates/docs/dev/coding-standards/common.md:13` (names rule 13 by its title, which is unchanged); none asks for a run on the old code after the code has changed.
- Sentences about a changed file as a whole, each reread: `land.test.sh` head comment lines 2 to 12 lists five cases and holds; `docs/dev/building.md` line 6 lists five cases, and line 25 is the changed paragraph; `skills/land/SKILL.md` line 10 (introduction), line 197 (the cases) and the Steps 2 "Done when" line 61 hold; `skills/plan-orchestration/SKILL.md` line 10 (introduction), the Stops table's "seven kinds of stop" and the Rules bullet on counts hold, and line 233 lists a repair round sent as its round brief and the round's entry; `skills/refute/SKILL.md` line 10 (what it leaves behind) and the Quick start line hold; `skills/roadmap/SKILL.md` line 10 holds; the introductions of `docs/dev/change-standard.md` and its template hold; the glossary entry **position line** said the position line is "the orchestrator's report" and was reworded to "follows the opening line of the orchestrator's report" because item 20 puts a line before it.

## The terms

Each term of `docs/glossary.md` the diff adds, changes or uses in a new place, read against its entry:

- **closing step**: used in `plan-orchestration` Steps 2 lines 62 to 67 as "the last step of a plan, which `/plan` writes itself"; entry changed: "Stated in: `plan`, Steps 2; `plan-orchestration`, Steps 2." `grep -n 'closing step' skills/plan-orchestration/SKILL.md` within Steps 2 (lines 56 to 71): lines 62 and 67.
- **rule clash**: used in `skills/land/SKILL.md` as the stop "A rule clash at landing" (Steps 6 line 84 and the Stops row at line 230); entry changed: "...; `refute`, \"Finding dispositions\"; `land`, Steps 6." `grep -n -i 'rule clash' skills/land/SKILL.md` printed lines 84 and 230; line 84 is inside Steps 6 (lines 75 to 115).
- **hand-back**: used as "handed back" in `plan-orchestration` Steps 4 lines 97 and 98 and as "hands back" in Steps 6 line 123; entry changed to cover the return before the report, "Stated in: `plan-orchestration`, Steps 4 and 6." `grep -n 'handed back\|hands back' skills/plan-orchestration/SKILL.md` printed lines 97, 98 and 123.
- **delta**: used in `skills/refute/SKILL.md` "Over a repair round" 3 and 4 (lines 97 and 100) and `plan-orchestration` Steps 8 line 177; entry changed to the difference, path by path, between the snapshot taken when the round was sent and the worktree. `grep -n 'delta'` printed those lines.
- **position line**: entry reworded (not named in item 21), "Stated in" unchanged; `grep -n 'position line' skills/plan-orchestration/SKILL.md` printed lines 393, 394, 401, 403, 406, 408 and 469 in "Reports" and Stops.
- Used in a new place, entry unchanged and still true: **completion notice** (`refute` Steps 7 and "Over a repair round" 6, as the source of the usage line), **base** (`git diff <base>` in `refute` and `plan-orchestration`), **ledger** (the copy into the worktree's copy of the ledger, as the entry says the worktree holds a copy), **brief** and **cases ruling** (copied into that copy), **Declined to judge** (`refute` Rules line 211), **ruling** and **open item** (`land` lines 82 to 88), **in flight** and **dispatch entry** (the closing step has no dispatch entry and takes no slot), **landing** (the closing step's commits are outside any landing), **orchestrator**, **builder**, **rules file**, **verify list** is not a glossary term.

## The versions

Each is one part raised, the parts after it 0, read against `docs/dev/skill-layout.md` "Frontmatter".

- land 3.0.0 to 4.0.0 (major): what a landing compares and books changes (Steps 2 compares the verify list with the page as the cherry-pick brings it and rewrites the list on a difference), and a landing that went on before now stops on a clash between two of the user's rulings (a new Stops row).
- plan-orchestration 5.0.0 to 6.0.0 (major): the orchestrator's final report no longer opens with the position lines but with a NOT DONE line and ends with a DONE / NOT DONE table, so its output is changed; the prompt, Steps 6 and Steps 8 also gain text.
- refute 3.0.1 to 4.0.0 (major): the reviewer's report no longer carries the usage line it wrote, which the session now fills, and a run over a round reads its delta from a snapshot folder instead of the output of `git diff <base>` saved at the round; the reviewer also writes its report in the rules file's character set.
- spec 5.0.0 to 6.0.0 (major): the brief it writes changes (the `printf` form of a git-started check, the character-set rule for the builder's report, a test run once on the unchanged tree), and the brief-check report gains a character-set rule.
- roadmap 1.3.1 to 1.4.0 (minor): Steps 2 to 4 keep the draft as a whole file in the scratch folder and compare the written file with it; every run that worked before still works.
- repo-setup 4.0.0 to 5.0.0 (major): the change standard and the plan terms it writes change (rule 21, rule 13's first two bullets, the shared-rules bullets, the entries of the plan-terms block); `SKILL.md` is changed for the version only.

## The files, with line counts

```
  20 docs/adr/0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md
  29 docs/dev/building.md
  87 docs/dev/change-standard.md
 151 docs/glossary.md
 273 skills/land/SKILL.md
 182 skills/land/templates/land.test.sh
 506 skills/plan-orchestration/SKILL.md
 215 skills/refute/SKILL.md
  69 skills/refute/templates/report.md
 245 skills/repo-setup/SKILL.md
  73 skills/repo-setup/templates/docs/dev/change-standard.md
 134 skills/repo-setup/templates/plan-terms.md
  27 skills/repo-setup/templates/shared-rules.md
 219 skills/roadmap/SKILL.md
 499 skills/spec/SKILL.md
  64 skills/spec/templates/brief-check.md
 107 skills/spec/templates/brief.md
 249 .scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/agents/reviews/1-report.md
```

Counts are the output of `wc -l` on the final tree. `skills/plan-orchestration/references/self-rule.md` was read against the changes and holds no sentence they make false, so it is unchanged.

## Judgment calls

- Rule numbers: "No breakage testing" is rule 22 of `docs/dev/change-standard.md` and rule 21 of the template, the next number of each.
- Rule 13 bullets 1 and 2 keep "new or changed" (the ruling says "a new test"), so the scope of the old text is kept.
- Item 5: the compare reads the page "as the cherry-pick will bring it" in three bullets, and the merge case is stated as replacing either copy; "What it reads" 8 says whose copy.
- Item 6: the scratch case keeps the verification page `docs/verification.md` as part of the step's change in the fixture; its `plan.yaml` holds only `ledger_root` and `worktree_root`, the keys `land.sh` reads.
- Item 10: Steps 2 gets a separate bullet for the scratch draft, and the Steps 4 "The step is done when" bullet now also says `diff` prints nothing; it stays last.
- Item 12: the round's snapshot is made for a repair round only (the round-0 builder has changed nothing, so it has no delta); `plan-orchestration` "Resuming, and handing the plan over" line 233 names a repair round sent as its round brief and the round's entry; `refute` Steps 4 gains one sub-bullet saying a quoted command that runs another git command is named under "Declined to judge" and not run, since "runs every command the report quotes" would otherwise contradict the new Rules bullet (rule 19 of the rules file). That sub-bullet serves item 12. "Over a repair round" 3 uses `git diff <base> -- <path>`, which is `git diff <base>` limited to one path, so the Rules sentence of item 12 and "What it reads" 5 keep their wording.
- Item 17: the report template's usage lines carry a placeholder naming the session as who fills them, and `refute` Steps 6 says the reviewer leaves the line as the template gives it.
- Item 18: the sentence is a closing-step bullet with four sub-bullets, one rule each, in Steps 2.
- Item 19: the prompt and "The builder" give the git rule in the words of the change standards' "Where the work happens": no git command that changes state (no `add`, `commit`, `stash`, `checkout`, `mv`, `restore`), reading with `git status`, `git diff` and `git show` is fine, a file is moved with `mv`.
- Item 20: the first bullet on the orchestrator's report is rewritten to open with the NOT DONE line, the landing report bullet carries the `land` Steps 11 order, and the **position line** glossary entry is reworded; the last bullet is rewritten to the closing DONE / NOT DONE table.
- Prose standard E (sentences over about 20 words): the sentences given word for word are long by their approved wording: items 1 (37 words in two sentences, the first 30), 3 (26), 4 (24), 7 (51), 8 (27), 9 (37), 11 (38 and 28) and 12 (49), and the ADR sentence; item 10 (18) is within the guide. Mine over about 25 words, each kept because it states one rule with its qualifier: rule 13 bullets 1 and 2 in both change standards (28 to 34 words), `skills/spec/SKILL.md` line 175 and `skills/spec/templates/brief.md` line 77 (about 48 and 50 words, one rule whose form is the `printf` text), `skills/plan-orchestration/SKILL.md` line 93 and the "The builder" bullet (33 and 37, the rules file's git rule with its six subcommands), the Reports bullet at line 413 (about 20), `skills/refute/SKILL.md` Proof bullets (31 and 34), `skills/roadmap/SKILL.md` Steps 3 (37, the original was 29), the glossary entries **delta** (about 55, the one sentence ruling 7 asks for) and **hand-back** (second sentence 30), and the existing 79-word line 228 of `plan-orchestration`, which gained a clause.

## Host- or user-visible changes, before and after

- Written rules (`docs/dev/change-standard.md`, its template, `shared-rules.md`): before, rule 13's first two bullets asked for a test to be "run there again after every change to the test", no rule forbade breaking code to test a test, and the shared rules had no bullet on a decision given outside a plan or on a proposal's contents; after, rule 22 (rule 21 in the template) and a shared-rules bullet are "No breakage testing", rule 13's first two bullets ask for one run on the unchanged tree before the code changes with an edit checked by reading, and the shared rules gain "A decision is written down when it is given" and "A proposal says what exists now".
- The character-set check in `docs/dev/building.md` and `docs/dev/change-standard.md`: before, it listed `git ls-files -coz` output and printed `Can't open z.md: ...` for a tracked file deleted in a worktree; after, it passes only files that exist on disk (C7).
- `land`: before, Steps 2 compared the verify list with the verification page on main, Steps 6 said nothing on a clash between two rulings or on how far a ruling reaches, a step's `<worktree>-round-<n>` folders did not exist, and the Stops table had no clash row; after, Steps 2 compares with the page as the cherry-pick brings it (worktree copy, main copy or the merge), a clash between two of the user's rulings takes the step back out of main and is raised under the new Stops row "A rule clash at landing", a place a ruling's reason reaches beyond what it names is booked as an open item and the landing goes on, and "Removing a step's worktree" also removes each `<worktree>-round-<n>` folder. ADR 0010's Consequences sentence read "at that moment" and reads "once the step is on it".
- `land.test.sh`: before, four cases (a conflict, a ledger file left in the worktree, a failing check, a clean landing); after, a fifth case in which a step's new test script and its command, left uncommitted in the worktree, reach main and `checks.sh` runs the command there after the cherry-pick.
- `plan-orchestration`: before, the prompt said "The no-git rule." and "The builder" said "It never runs a git command.", the prompt had no line on a shortcut or on a dictated script sentence, a builder's report was saved with no character check, a round's brief and a cases ruling were not copied into the worktree, a repair round recorded no state of the worktree, Steps 2 and 3 said nothing of the closing step, and "Reports" ended with "the DONE / NOT DONE ledger" with the position lines first; after, both give the change standards' git rule, the prompt gains the shortcut and dictated-sentence items, Steps 6 checks the saved report's characters and copies a cases ruling into the worktree, Steps 8 copies the round's brief, snapshots the round's changed files into `<worktree_root>/<slug>-<step>-round-<n>/` with `files.txt` and quotes a script sentence's run, Steps 2 states the closing step, and "Reports" opens with the NOT DONE line and ends with a DONE / NOT DONE table.
- `refute`: before, the reviewer's git was `git diff <base>` and `git status --short`, a run over a round read its delta "from the commit or tree state recorded when the round was sent", the reviewer wrote its usage line, and the report had no character-set rule; after, the reviewer's git adds `git show <base>:<path>`, the round's delta is read from the snapshot folder, the session fills the usage line from the completion notice, the report is in the rules file's character set and the session checks it, and the usage line fill and the character-set check of an appended run are two bullets.
- `spec`: before, a brief gave a git-started check as written and the Report section of `templates/brief.md` had no character-set rule, and the brief-check report had none either; after, a brief names a git-started check with `printf '%s\0' <files> |`, says the builder's report is in the rules file's character set, and the brief-check agent writes its report in that set, which the session checks and fixes in place.
- `roadmap`: before, Steps 2 drafted the change with nothing written, Steps 3 showed it as a diff and Steps 4 wrote it, with no comparison of the written file; after, the draft is a whole file in the scratch folder, shown as a diff against the file, and the written file is compared with it before the commit.
- Glossary and plan terms: before, **delta** was the difference between two saved `git diff <base>` outputs, **hand-back** a builder's stop before any code, **closing step** and **rule clash** lacked `plan-orchestration` and `land` in "Stated in"; after, **delta** is the path-by-path difference from the snapshot, and the other entries are as ruling 21 of the brief says.

## Anything in the brief that was wrong or impossible

Nothing. Two points the brief did not say, with the evidence: the old form of the character-set check (`printf '%s\0' a.md z.md | xargs -0 perl ...`) exits 0 as well as printing `Can't open z.md`, so the difference C7 shows between the forms is the printed line; and `git diff --quiet <base> -- <page>` on a page that is new and untracked in the worktree exits 0 (git diff reads tracked files), which does not arise for the verification page, a tracked file.

## Repair round 1

Everything in the round brief is done. No row is NOT DONE. `$K` is the scratch folder `$TMPDIR/2k`, outside the repository. The one path the round adds is `skills/spec/templates/brief-check.md` (ruling 9), and `$K/cs.sh` checks it with the others.

| Ruling | State | Command or reading that shows it |
|---|---|---|
| 1 | DONE | `skills/plan-orchestration/SKILL.md` line 93 (the prompt) and line 101 ("The builder") read: no git command that changes state (no `add`, `commit`, `stash`, `checkout`, `mv`, `restore`), reading with `git status`, `git diff` and `git show` is fine, a file is moved with `mv`. `grep -n 'reads only\|only with' skills/plan-orchestration/SKILL.md` printed nothing. The change standards' "Where the work happens" bullet (`docs/dev/change-standard.md` line 60, the template line 58) holds the same words, and this ruling edits neither. |
| 2 | DONE | `skills/land/SKILL.md` line 204 ("The landing script"), `docs/dev/building.md` line 6, `skills/land/templates/land.test.sh` head comment lines 9 to 12 and the case's own comment lines 159 to 162 each say the case shows that a step's new test script and its command, left uncommitted in the worktree, reach main and that `checks.sh` runs the command there after the cherry-pick, with the verify list the fixture gives, and no more. `grep -n 'verification:' skills/land/templates/land.test.sh` printed nothing; `docs/verification.md` is still part of the step's change in the fixture (`commit_file ... docs/verification.md` line 168 and the worktree copy line 174). `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests`. |
| 3 | DONE | `grep -n '^  version:' skills/{land,plan-orchestration,refute,spec,roadmap,repo-setup}/SKILL.md` printed land 4.0.0, plan-orchestration 6.0.0, refute 4.0.0, spec 6.0.0, roadmap 1.4.0, repo-setup 5.0.0. The reasons are under "The versions". |
| 4 | DONE | `skills/land/SKILL.md` Steps 6 lines 82 to 84: a clash between two of the user's rulings is never fixed at landing, takes the step back out of main as a red line for the user does, before any other commit, and is raised as the open item of the stop "A rule clash at landing". The Stops table has that row at line 230 (when: a finding at landing is a clash between two of the user's rulings; shows: the open item naming both rulings and the step taken back out of main; resumes: the user's ruling), and the bullets below the table count the rows (lines 241 to 246). Lines 85 to 88: a place a ruling's reason reaches beyond what it names is not changed at landing, the landing goes on with the ruling carried out on what it names, the other place is booked as an open item in the state file and named in the booking (Steps 9), and "This is no stop." |
| 5 | DONE | `skills/plan-orchestration/SKILL.md` lines 413 and 414: the report ends with a DONE / NOT DONE table, one row per step landed or stopped since the loop began, each row naming the landing report and the command it quotes, or the open item that proves it. `grep -n -i 'ledger' skills/plan-orchestration/SKILL.md | grep -i 'table\|DONE'` printed nothing. |
| 6 | DONE | `skills/refute/SKILL.md` lines 106 and 107 are two bullets: the usage line filled from the completion notice, and the character-set check of the appended text. |
| 7 | DONE | `skills/plan-orchestration/SKILL.md` lines 153 to 158 (Steps 8 "Before the resume"): `git status --porcelain --untracked-files=all` from inside the worktree, each listed path outside the ledger root copied into `<worktree_root>/<slug>-<step>-round-<n>/` at the same relative path, `files.txt` written by the session, a deleted path named and not copied, the folder under the worktree root which git ignores; the commit bullet (line 159) no longer carries a diff, and line 233 drops "the diff saved for its reviewer". `skills/refute/SKILL.md` lines 96 to 99 (the snapshot folder read; the delta per path of `files.txt` by `diff -u`, a deleted path against nothing, and per path changed now and not listed by `git diff <base> -- <path>` or the whole file when untracked, read against the whole diff since the base). `skills/repo-setup/templates/plan-terms.md` line 31 and `docs/glossary.md` line 36 give **delta** in one sentence. `skills/land/SKILL.md` line 220 runs `rm -r` on each `<worktree>-round-<n>` folder beside the worktree when it exists. `grep -rn 'sent.diff\|saved diff\|diff saved' skills docs` printed nothing; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. |
| 8 | DONE | "Host- or user-visible changes, before and after" above gives the before and the after in every bullet. |
| 9 | DONE | `skills/spec/templates/brief-check.md` line 5 says the report is written in the rules file's character set, a character outside it in a quoted line written by its name in angle brackets. `skills/spec/SKILL.md` "Steps / The brief check" 1 line 389 tells the agent the same; item 3 lines 431 and 432 have the session check the saved report with the character-set check and fix a hit in place by the same naming, and line 436 ("Done when") names the characters. |
| 10 | DONE | In this round the only git commands run in the worktree were `git status --short` and `git diff` (with `--stat`, and over single files); no file of the tree was changed for this ruling. |

Checks run after the changes, from the worktree root, output as printed:

- `sh skills/land/templates/land.test.sh 2>&1 | tail -1`: `PASS: land.sh scratch tests`
- `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`: `PASS: sync_rules.py scratch tests`
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, `exit 0`
- the description lengths, `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'`: `965 diagnose`; `877 grill`; `725 land`; `564 ordo-help`; `632 ordo-init`; `1018 plan-orchestration`; `616 plan-retro`; `477 plan`; `989 refute`; `783 repo-setup`; `1022 roadmap`; `831 session-retro`; `1003 spec`; none is above 1024 and no description was changed.
- C1, `sh $K/c1.sh`: 
  - `C1 item 1 docs/dev/change-standard.md: count=1 55:22. **No breakage testing.** Code is never deliberately b`
  - `C1 item 1 skills/repo-setup/templates/docs/dev/change-standard.md: count=1 53:21. **No breakage testing.** Code is never deliberately b`
  - `C1 item 1 skills/repo-setup/templates/shared-rules.md: count=1 17:- **No breakage testing.** Code is never deliberately bro`
  - `C1 item 3 skills/land/SKILL.md: count=0 `
  - `C1 item 4 skills/land/SKILL.md: count=0 `
  - `C1 item 7 skills/repo-setup/templates/shared-rules.md: count=1 9:- **A decision is written down when it is given.** A decis`
  - `C1 item 8 skills/repo-setup/templates/shared-rules.md: count=1 7:- **A proposal says what exists now.** Each proposal or op`
  - `C1 item 9 skills/plan-orchestration/SKILL.md: count=1 97:     - That a shortcut is a finding, a narrower reading o`
  - `C1 item 10 skills/roadmap/SKILL.md: count=1 90:   - The file is then compared with the approved draft, a`
  - `C1 item 11a skills/plan-orchestration/SKILL.md: count=1 98:     - That a sentence the brief or a round gives word fo`
  - `C1 item 11b skills/plan-orchestration/SKILL.md: count=1 149:     - A dictated sentence that says how a script behave`
  - `C1 item 12 skills/refute/SKILL.md: count=1 211:- The reviewer runs no git command other than git diff `
- C2, `grep -n -F -f $K/s/i2b <file>`: 
  - `docs/dev/building.md: 11:git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then p`
  - `docs/dev/change-standard.md: 75:git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then p`
- C3: 
  - `grep -n -F 'A landing is held to the checks main holds once the step is on it.' <ADR 0010>` printed `20:A landing is held to the checks main holds once the step is on it. Each preparation and`
  - `grep -c -F 'at that moment' <ADR 0010>` printed `0`
- C4, `sh skills/land/templates/land.test.sh 2>&1 | tail -1`: `PASS: land.sh scratch tests`, with the `verification` case among the cases run.
- C6: land 4.0.0, plan-orchestration 6.0.0, refute 4.0.0, spec 6.0.0, roadmap 1.4.0, repo-setup 5.0.0, each one part raised, the parts after it 0.
- C7, `bash $K/c7.sh $K/chk1.txt`: 
  - `-- old form (no filter), a.md z.md:`
  - `Can't open z.md: No such file or directory at -e line 1.`
  - `exit 0`
  - `-- new form, a.md z.md:`
  - `exit 0`
  - `-- new form control, a.md t.txt z.md:`
  - `t.txt:1: a<tab>b`
  - `exit 1`
  - `exit status of the script: 0`
- C8, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, `exit 0`.
- The character-set check over 19 paths (the 17 changed files, `skills/plan-orchestration/references/self-rule.md` and the report), `bash -o pipefail $K/cs.sh`: it printed nothing and the exit status was `exit 0`.

C1 items 3 and 4 print `count=0` because ruling 4 gives those two sentences in a new form; C1 item 12 prints `count=1`, the Rules sentence of `refute` being unchanged.

The versions as they now stand, each with its reason, are under "The versions" above.

