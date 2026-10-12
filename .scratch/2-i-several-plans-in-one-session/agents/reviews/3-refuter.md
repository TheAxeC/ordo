# Step 3 refuter report (on .agents/worktrees/2-i-several-plans-in-one-session-3, base 3ab3ff4)

The diff does the brief's six items in substance, and every check the brief names prints its pass. Of the findings below, three need a decision before landing: Standards 1 (a step that waits at the second path comparison cannot be prepared again), Standards 2 (one commit sentence in `land` lacks the waiting-`/spec` exception) and Spec 1 (a brief check that ended but whose report was not saved is treated as dead). The rest are small text fixes that can be made at landing, plus two problems in the brief's own dictated text (Standards 4 and 5).

## Verification (rerun by the reviewer)

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ printf '%s\0' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-orchestration/references/self-rule.md skills/land/SKILL.md skills/plan/templates/orchestrator-state.md skills/ordo-help/SKILL.md skills/diagnose/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md .scratch/2-i-several-plans-in-one-session/agents/reviews/3-report.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ (builder's form) printf '%s\0' <same ten files> | xargs -0 perl -ne 'print "$ARGV:$.: $_" if /[^\x20-\x7e\n]/'; echo "exit $?"
exit 0
$ grep -n 'preparing' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-orchestration/references/self-rule.md skills/plan/templates/orchestrator-state.md skills/ordo-help/SKILL.md skills/diagnose/SKILL.md skills/land/SKILL.md skills/repo-setup/templates/plan-terms.md   (file:line only)
spec 39 44 74 100 118 199 201 289 294 298 301 399 468 469; plan-orchestration 251 252 310 319; self-rule 151 155 161; orchestrator-state 33; ordo-help 54 58 99; diagnose 45 47 50 358; land 35 129 141 221; plan-terms 37
(equal to the builder's list)
$ grep -n 'Plan step <m> of <m>: the closing' skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md skills/plan/templates/orchestrator-state.md
skills/repo-setup/templates/plan-terms.md:79:...   skills/plan-orchestration/SKILL.md:373:...   skills/plan/templates/orchestrator-state.md:68:...   (one line each)
$ grep -n 'version:' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/land/SKILL.md skills/plan/SKILL.md skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md skills/diagnose/SKILL.md
skills/spec/SKILL.md:5:  version: "5.0.0"
skills/plan-orchestration/SKILL.md:5:  version: "5.0.0"
skills/land/SKILL.md:5:  version: "3.0.0"
skills/ordo-help/SKILL.md:5:  version: "3.1.0"
skills/diagnose/SKILL.md:5:  version: "2.1.1"
skills/plan/SKILL.md:5:  version: "4.0.0"
skills/repo-setup/SKILL.md:5:  version: "4.0.0"
$ wc -l (after) / git show 3ab3ff4:<f> | wc -l (before)
spec 491/434, plan-orchestration 482/463, self-rule 169/169, land 260/247, orchestrator-state 69/69, ordo-help 129/126, diagnose 414/413, plan-terms 134/134, glossary 151/151
$ git status --short
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/land/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/references/self-rule.md
 M skills/plan/templates/orchestrator-state.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/spec/SKILL.md
?? .scratch/2-i-several-plans-in-one-session/agents/reviews/3-report.md
$ python3 -I -c 'import yaml; yaml.safe_load("dispatch:\n- step: 2\n  landing: preparing\n  brief_check: running: a6ce8870a2a7c0b32\n")'
ERROR: mapping values are not allowed here | in "<unicode string>", line 4, column 23
```

**The builder's form of the character-set check.** The builder's report quotes the check in a different form from the brief's. It does matter, as a matter of proof. The `perl` in the builder's form never sets a non-zero exit status, so its `exit 0` proves nothing; only its empty output does. It also has no `-CSD` and no `\x{2705}` exemption, so it flags every non-ASCII byte, which is stricter than the brief's form. Its file list is a placeholder, so the quoted line is not verbatim. The outcome is unchanged: the brief's form, rerun above, prints nothing and exits 0.

**One count in the builder's report does not reproduce.** The report gives `docs/glossary.md` as "151 (152)". The before count at the base is 151. No decision rests on this count, so it is not a finding.

## Verdicts

Items of the brief's "What to build":

- 1: violated, Standards 1. The rest of the item is built:
  - the `preparing` entry is written at the end of Steps 1 and counted;
  - the compare covers steps at `preparing` and runs again after the brief check;
  - `running: <agent id>` is written;
  - Steps 9 fills the entry, and the back-out and stop texts match;
  - the glossary, the template, `diagnose` and `self-rule.md` are updated.
- 2: violated, Standards 2. The places the brief lists all say the exception (`land` Steps 12, `plan-orchestration` Steps 4 and 8, "Resuming", `spec` Steps 1 and 6), as do "The brief check" 1, the re-check before the preparation commit (Steps 6) and the `land` Rules bullet. The back-out commit sentence in `land` Steps 6 does not.
- 3: holds. The form is in `plan-orchestration` "Reports" with the four next parts, the "not open" sentence, the glossary entry **position line** and the template's "Current position". See Standards 7 for a wording difference in the glossary.
- 4: violated, Standards 3. The two "Resuming" bullets, "Steps / A `/spec` taken over" and `ordo-help` Steps 4 are built. `ordo-help` Steps 3 prints "no worktree or base yet" for an entry that can hold both. Spec 1 is a gap beside this item.
- 5: holds. `land` Steps 6 has the new red-line rule, Steps 12 leaves a fixed record out of the commit, and `spec` Steps 1 names the exception.
- 6: holds. No version changed. The part each change needs is no higher than step 1's raise:
  - `spec`, `plan-orchestration` and `land`: new refusals, so major; step 1 raised each to a new major.
  - `ordo-help`: an added output case, so minor; step 1 raised its minor.
  - `diagnose`: wording only; the state it now refuses could not exist before; patch, already raised.
  - `plan` and `repo-setup`: changed template output; step 1 raised each to a new major.

Cases of the brief's "Cases":

- 1: met. Two places refuse at the preflight once the steps in flight, the step's own entry left out, reach `workers_at_once`: `spec` "What it reads" 3 ("its dispatch entry at `landing: preparing` counts") and the Steps 1 bullet. The Stops row shows "each named with its plan and its `landing` value".
- 2: met. Steps 5 compares with "every other step in flight ..., a step at `landing: preparing` included", each brief "read ... in the main checkout, committed or not".
- 3: met. Steps 5 says "A step in flight at `landing: preparing` whose brief is not yet written is not compared by this run", and the step that later writes its brief compares in its own Steps 5. The compare runs again when "Paths this step writes" changes at the brief check.
- 4: met. "Steps / A stop" 2 says the entry is "removed before the commit of item 1, the state file reading back with only this step's entry removed".
- 5: partial, Spec 1. The parts that are met:
  - The takeover is exempt from the brief, entry and `plan.md` refusals (Steps 1 list, the brief and report path bullets, "Resuming").
  - `/ordo-help` gives `/spec <entry> <step>`.
  - A listed agent is waited for, and the preflight refuses with "A brief check still running".
  - With a `base` in the entry, the run goes on at Steps 7 and the worktree is exempt.

  The missing part: a waited-for agent that ends with no report saved is then classed as dead, and a second brief check starts.
- 6: met. `land` Steps 6 fixes a record the session wrote in place, the booking names the path, and Steps 12 says "Not among them either is a record that Steps 6 fixed in place". A record of the same plan is covered. A record the session did not write takes the step back out of main, with an open item naming the file.
- 7: met. `land` Rules: "A brief-check report that arrives during a landing is saved after the landing's commit". `spec` "The brief check" 1 adds "no commit of this `/spec` is made before then".
- 8: met. `plan-orchestration` "Reports" gives "Roadmap entry <n> (<title>). Plan step <m> of <m>: the closing. Next: <the closing's next part>." with "the roadmap diff of `/roadmap done <n>`, for the user's approval".
- 9: met. `land` Steps 12 holds `plan.md` as on disk, the waiting `/spec`'s corrections included, and leaves out its brief and report. `spec` Steps 6 names `plan.md` "only when they differ from main's head".

## 1. Spec

- `skills/plan-orchestration/SKILL.md` "Resuming, and handing the plan over", and `skills/spec/SKILL.md` "Steps / A `/spec` taken over" 1.
  - The hunks: "A step at `landing: preparing` whose `brief_check` reads `running: <agent id>` and whose agent the runner still lists is a live `/spec` waiting on its brief check, and is waited for." and "With no report on disk, a brief-check agent that the entry's `brief_check` records as `running: <agent id>` and the runner no longer lists is dead."
  - What is wrong: nothing says what happens when the waited-for agent ends. A builder has the parallel rule ("A finished builder resumes at the read of its report."). The brief check has none: no rule saves its final message at `agents/reviews/<step>-brief-check.md` ("The brief check" 3) and goes on with the waiting `/spec`.
  - Once the agent ends, the entry still reads `running: <agent id>` and the runner no longer lists the agent. The step then matches "Any other step at `landing: preparing`", and the takeover classes a finished agent whose report was not saved as dead.
  - Failure scenario: after a compaction, the session waits for a listed brief check, which then ends. Following "Resuming", the session runs `/spec <entry> <step>`. The takeover finds no report on disk and an unlisted agent, so it books the finished agent as dead and starts a second brief check. The finished report is lost, and the cost is paid twice (the step 3 brief check cost 232837 tokens).
  - Verdict: case 5 partial.

## 2. Proof

- none. The two differences in the builder's report (the form of the character-set check, and the glossary line count) are under Verification. Neither is a finding under the refute skill's Proof rules: the outcome reproduces, and no decision rests on the count.

## 3. Standards

- **Standards 1.** `skills/spec/SKILL.md` Steps 5, against Steps 1.
  - The hunks: "This run leaves only the session's own records of Steps 1's list, and the report of its brief check when one stands." and "A step whose brief's "Paths this step writes" changes after this comparison, at its brief check, compares again before its preparation commit ... The bullets above then apply to what the second comparison finds."
  - Against the unchanged Steps 1 refusal: "An uncommitted change at the brief check's report path `agents/reviews/<step>-brief-check.md` is a refusal ("Stops") ... - The report of a `/spec` taken over is no such change."
  - What is wrong: the diff adds a wait after the brief check (the second comparison) and keeps the report on disk at that wait. The wait also removes the entry, so the next `/spec` of the step is no takeover, and the preflight refuses on the uncommitted report. Before the diff, a wait came only before the brief check, so no report could stand. This is a contradiction under rule 19 of the rules file ("A change leaves no two statements that contradict each other"). The sentences "`/spec` run again redoes Steps 2" and "unless the step's brief-check report already stands in the ledger" expect the re-run to work.
  - Failure scenario:
    - Plan 5's step 2's brief check adds a path that plan 3's step 1 also writes, and the merge is judged not simple, so step 2 waits.
    - Its entry is removed, and `agents/reviews/2-brief-check.md` stays uncommitted. No resume-point commit of plan 5 comes before the re-run: plan 3's landing commits only plan 3's records.
    - Plan 3's step 1 lands, and `/spec 5 2` is refused as "A failed preflight", naming the report path.
  - Verdict: item 1 violated.
- **Standards 2.** `skills/land/SKILL.md` Steps 6, the back-out commit (line 99 to 100).
  - The hunk: "The state file and `plan.md` are then committed, a resume point, in the form Steps 12 states. - The commit also holds the other ledger records of this plan that the session wrote since the last one."
  - What is wrong: this is one of the sentences that make a resume-point commit carry every record the session wrote since the last one. It did not get the exception that Steps 12, `plan-orchestration` Steps 4 and 8 and "Resuming" now carry. The brief's item 2 asks each such sentence to say it.
  - Failure scenario: plan 5's step 1 is taken back out of main while plan 5's step 2's `/spec` waits on its brief check. The session follows this bullet, and the back-out commit takes step 2's uncommitted brief before its brief check has closed. The brief then reaches main in a commit other than its preparation commit.
  - A related place: `spec` "Steps / A stop" 1 ("The ledger files of this plan that the session wrote, committed as a resume point in the form Steps 6 states"). It reaches the exception only through Steps 6 and Steps 1.
  - Verdict: item 2 violated.
- **Standards 3.** `skills/ordo-help/SKILL.md` Steps 3, `skills/land/SKILL.md` "What it reads" 3 and `skills/diagnose/SKILL.md` "What it reads" 3.
  - The hunks: "A step whose dispatch entry reads `landing: preparing` is printed as in `/spec`, with no worktree or base yet."; "None, or an entry at `landing: preparing`, which names neither, is a refusal"; "one that reads `landing: preparing` and names no worktree or base yet, is a refusal".
  - What is wrong: under the builder's judgment call 2, `spec` Steps 6 writes `base: <hash>` into the `preparing` entry right after the preparation commit, and Steps 7 makes the worktree before Steps 9 sets `not-started`. A `preparing` entry can therefore hold a base and have a worktree, which makes these three clauses false.
  - The `diagnose` refusal is also worded differently from its Stops row, which refuses any entry at `preparing` with no qualifier. Read literally, "What it reads" 3 does not refuse an entry at `preparing` that names a base.
  - Failure scenario: a `/spec` is interrupted between Steps 7 and 9. `/ordo-help <entry>` prints the step with no worktree or base, while both exist and the takeover will reuse them.
  - Verdict: item 4 violated.
- **Standards 4.** `skills/plan-orchestration/references/self-rule.md` "The review of a choice".
  - The hunk: "A step of `Builds on it:` not yet prepared, one at `landing: preparing` included, has its text rewritten to the new ruling, and its `/spec` runs again."
  - This conflicts with the `spec` preflight refusal "A brief check still running", and with "Steps / A `/spec` taken over" 2: "An entry with a `base` ... goes on at Steps 7 ... and does not run Steps 2 to 6 again."
  - What is wrong: for a step at `preparing` there are two cases.
    - Its `/spec` is waiting on a live brief check: the `/spec` run again is refused, and the waiting run then finishes with the brief written under the old ruling.
    - Its entry already holds a `base`: the `/spec` run again skips Steps 2 to 6, so the rewritten text never reaches the committed brief.

    Neither case removes the entry or the brief, or stops the running brief check. The brief dictates this rule (item 1, last bullet, and its Decision 7).
  - Failure scenario: under self-rule the user types `C<n> => <ruling>` while a step of `Builds on it:` is at `preparing` and has its preparation commit. Its text is rewritten, and `/spec` is run again. The builder then gets the brief written under the replaced choice.
  - Verdict: none, since this is the brief's own rule. It is for the orchestrator to decide.
- **Standards 5.** `skills/spec/SKILL.md` "Steps / The brief check" 1, `skills/plan/templates/orchestrator-state.md` line 33 and `skills/repo-setup/templates/plan-terms.md` **dispatch entry**.
  - The hunk: "`running: <agent id>`, which the session writes into the `brief_check` key of this step's dispatch entry".
  - What is wrong: `brief_check: running: <agent id>` is not valid YAML; the rerun above prints "mapping values are not allowed here". The glossary defines the dispatch block as the second `yaml` block of the state file. Until Steps 9 replaces the value, it is committed to main by the preparation commit and by any same-plan commit that names the state file. Rule 16 of the rules file asks that a write re-parse what it wrote.
  - Today no script reads the dispatch block. A grep of `skills` and `utils` `*.py`/`*.sh` for `dispatch` finds nothing, and `land.sh` and `checks.sh` read only `.agents/plan.yaml` and the first block.
  - The brief dictated the form (Decision 6). The builder reported it under "Anything in the brief wrong", item 2.
  - Failure scenario: a session or tool that reads the entry back with a YAML parser fails on the whole block, and every entry in it is lost to that reader. The fix is the quoted form `brief_check: "running: <agent id>"`, written into the three places.
  - Verdict: none, since the brief dictated the form.
- **Standards 6.** `skills/plan/templates/plan.md:36`, outside the step's paths.
  - The hunk: "... `/spec` writes a brief-check agent stopped for another model, the session that starts a diagnosis agent writes its numbered item ...".
  - What is wrong: the takeover now also writes the Agents bullet of a dead brief-check agent ("Steps / A `/spec` taken over" 1, judgment call 4, which ADR 0006 requires). The template's list of who writes Agents bullets is now incomplete, and the same sentence stands in the plan's own `plan.md`. The builder reported it.
  - Failure scenario: a reader of `plan.md` who checks the Agents section against that list takes the takeover's bullet for one no skill writes.
  - Verdict: none. It is a fix at landing to `skills/plan/templates/plan.md`.
- **Standards 7.** `skills/repo-setup/templates/plan-terms.md` **position line**.
  - The hunk: "the next part being the closing report, the roadmap diff of `/roadmap done <n>`, the tag and the pin, or the move of the folder to `<archive_root>/`".
  - What is wrong: the glossary drops ", for the user's approval" and "where the plan's rulings set them", which `plan-orchestration` "Reports" gives as part of the next part. The same next part is then worded two ways, against the prose standard's D, "No synonym cycling".
  - Failure scenario: an orchestrator who writes from the glossary writes "Next: the roadmap diff of `/roadmap done 2.I`.", while case 8 expects ", for the user's approval".
  - Verdict: none.
- **Standards 8.** `skills/spec/SKILL.md` Stops row "A brief check still running".
  - The hunk, in the column "What resumes it": "The brief check ended and its `/spec` finished, then `/spec` again".
  - What is wrong: once its `/spec` has finished, the step is prepared and its worktree exists, so `/spec` run again is refused as "A worktree or branch that exists". The resume is either nothing, when the waiting `/spec` goes on to its end, or `/spec` again to take over an interrupted run.
  - Failure scenario: a user who typed `/spec` by hand while the check ran waits, runs `/spec` again as the row says, and is refused.
  - Verdict: none.
- **Standards 9.** `skills/spec/SKILL.md` Rules, last bullet, beside Steps 1 and "Steps / The brief check" 1.
  - The hunk: "The brief and the brief-check report of a `/spec` waiting on its brief check are carried by its preparation commit alone".
  - What is wrong: the same rule is stated in Steps 1 ("Only its preparation commit (Steps 6) carries them"), in "The brief check" 1 and in Rules. `docs/dev/skill-layout.md` "Where a rule goes" says "A rule is written once. Another place that needs it names the section it is in." Its Anti-patterns row "The same rule written in two sections" applies.
  - Failure scenario: a later edit that changes one copy leaves the others stating the old rule.
  - Verdict: none.
- `skills/refute/SKILL.md` Steps 1, Steps 7 and "Over a repair round" 6, raised by the builder, is not a finding against this diff. The text there says "dispatch block". The glossary's **dispatch entry** "Stated in" cited the same places at the base: `git show 3ab3ff4:skills/repo-setup/templates/plan-terms.md` gives the same citation, and `skills/refute/SKILL.md` had no "dispatch entr" at the base. `git diff 3ab3ff4 --stat -- skills/refute` is empty. The mismatch is older than this step, and three words in `refute` would end it.

## 4. Behaviour

- **Behaviour 1.** The builder report's section "Host and user visible changes, before and after" leaves out three changes a user sees on main or in the tree:
  - The preparation commit now commits the state file holding the step's `landing: preparing` entry, with `brief_check: running: <agent id>`. Before, a dispatch entry first reached main in the launch commit. A same-plan landing commit can now carry another step's `preparing` entry (`spec` Steps 6, `land` Steps 12).
  - `/land` now refuses a step whose entry reads `landing: preparing` (`land` "What it reads" 3 and the Stops row "No dispatch block"). This is named only under judgment call 5, with no before and after.
  - A wait at Steps 5 now leaves the brief-check report on disk (`spec` Steps 5).
  - Failure scenario: a user who reads `git log -p` on main sees `landing: preparing` entries in commits and has no report that says this is now expected.
  - Verdict: none.

## Declined to judge

- **The builder's git command.** The orchestrator says the builder disclosed one read-only `git status`. The report file does not mention it: `grep -n -i 'git ' .../3-report.md` prints nothing. The rules file, "Where the work happens", allows reading with `git status`. The brief ("since the builder runs no git command") and the launch prompt's no-git rule do not. `git status --short` shows only the step's nine files and the report, so the tree is unaffected. Whether this is booked is the orchestrator's call.
- **Two sessions running at once.** I did not judge whether "the runner still lists that agent" can tell a live brief check that belongs to another running session. The texts support only one orchestrator at a time, plus a handover.
- **Where the dispatch blocks are read for the count.** I did not judge whether the preflight reads other plans' dispatch blocks from disk or from main's head ("What it reads" 3 does not say). An uncommitted `preparing` entry is seen only on disk. Settling it needs a ruling on the source of the count.
- **The tag and the pin.** The tag `v6.0.0-rc.2`, its pin and the `rev-parse` check are the orchestrator's work after landing, which the brief assigns there. They are not part of this diff.

Reviewer usage: ab30d93c9a0113445, claude-opus-5-5, 230576 tokens, 47 tool uses, 9 min 10 s.
