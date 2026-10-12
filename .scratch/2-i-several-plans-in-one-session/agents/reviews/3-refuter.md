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

## Repair round 1, refuted

```
$ git status --short        (from the worktree .agents/worktrees/2-i-several-plans-in-one-session-3)
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/land/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/references/self-rule.md
 M skills/plan/templates/orchestrator-state.md
 M skills/plan/templates/plan.md
 M skills/refute/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/spec/SKILL.md
?? .scratch/2-i-several-plans-in-one-session/agents/reviews/3-report.md
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 -I -c 'import yaml; yaml.safe_load("dispatch:\n- step: 2\n  landing: preparing\n  brief_check: \"running: a6ce8870a2a7c0b32\"\n")'; echo "yaml exit $?"
yaml exit 0
$ printf '%s\0' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-orchestration/references/self-rule.md skills/land/SKILL.md skills/plan/templates/orchestrator-state.md skills/plan/templates/plan.md skills/ordo-help/SKILL.md skills/diagnose/SKILL.md skills/refute/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md .scratch/2-i-several-plans-in-one-session/agents/reviews/3-report.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ grep -n 'version:' skills/spec/SKILL.md skills/plan-orchestration/SKILL.md skills/land/SKILL.md skills/plan/SKILL.md skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md skills/diagnose/SKILL.md skills/refute/SKILL.md
skills/land/SKILL.md:5:  version: "3.0.0"
skills/plan-orchestration/SKILL.md:5:  version: "5.0.0"
skills/spec/SKILL.md:5:  version: "5.0.0"
skills/ordo-help/SKILL.md:5:  version: "3.1.0"
skills/diagnose/SKILL.md:5:  version: "2.1.1"
skills/plan/SKILL.md:5:  version: "4.0.0"
skills/refute/SKILL.md:5:  version: "3.0.1"
skills/repo-setup/SKILL.md:5:  version: "4.0.0"
$ git show 0158079 -- skills/refute/SKILL.md | grep -n '^[-+]  version'
25:-  version: "3.0.0"
26:+  version: "3.0.1"
$ git diff 3ab3ff4 -- skills/refute/SKILL.md | grep -n 'version'     (prints nothing)
$ grep -n 'Plan step <m> of <m>: the closing' skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md skills/plan/templates/orchestrator-state.md | cut -c1-90
skills/plan/templates/orchestrator-state.md:68:- Next step: <n>, because <why it is next>;
skills/repo-setup/templates/plan-terms.md:79:- **position line**: the line of one plan tha
skills/plan-orchestration/SKILL.md:373:  - A plan whose step being worked is the closing t
$ git grep -n 'running: ' -- . ':!.scratch' | grep -v '"running: '       (prints nothing; 11 quoted hits in spec, plan-orchestration, orchestrator-state.md, plan-terms.md, glossary)
$ grep -n 'preparing' <the eight files>   (file:line lists)
spec 39 44 74 100 118 199 201 289 294 298 301 400 471 472; plan-orchestration 250 252 310 319; self-rule 151 153 161 167; orchestrator-state 33; ordo-help 54 58 99; diagnose 45 47 50 358; land 35 129 141 221; plan-terms 37
$ grep -n 'dispatch' skills/refute/SKILL.md   (dispatch entry at 57, 78, 99; dispatch block left at 10 (no), 36, 91 as ruled)
$ wc -l <files>: spec 494, plan-orchestration 482, self-rule 175, land 260, orchestrator-state 69, ordo-help 129, diagnose 414, plan-terms 134, glossary 151, plan.md 43, refute 203  (equal to the report's counts)
$ python3 -c '... description lengths ...': diagnose 965, land 725, ordo-help 564, plan-orchestration 1018, spec 1003  (equal to the report, all under 1024)
$ git diff 3ab3ff4 -U0 | grep '^+' | grep -c <tab>   (0 in each of the 11 files); no em dash or en dash in added lines
$ git grep -n 'no worktree or base yet\|names neither' -- skills   (prints nothing)
```

Not run, not required by the brief for this step: land.test.sh, check_config.test.sh, pin.test.sh (they run at landing). The builder's report quotes the character-set check in the brief's form with the real file list, the glossary count of 151 from the base, and the read-only `git status` under "Anything in the brief wrong or impossible" 3; all three reproduce.

### Verdicts

Items of the brief's "What to build", over the whole diff since 3ab3ff4:

- 1: holds. The `preparing` entry is written at the end of Steps 1 and counted (spec "What it reads" 3, Steps 1, `plan-orchestration` "Two steps in flight"). Steps 5 and the second comparison, Steps 9 filling the entry, the back-out, stop and wait removals, the glossary, the template comment and `diagnose` are built. `"running: <agent id>"` is quoted in all 11 places. `self-rule.md` says what a step at `preparing` takes. The removal procedure inside that rule has a gap, Standards B.
- 2: holds. Every sentence that makes a resume-point commit carry the session's records now names the exception: `land` Steps 6 and Steps 12, `plan-orchestration` Steps 4, Steps 8, the resume-point bullet and the closing sentence, `spec` Steps 1, Steps 6, "A stop" 1, and Rules. Standards E is about the rule being restated, not about a missing exception.
- 3: holds. See Standards D for the wording of the glossary list.
- 4: holds. The two "Resuming" bullets, "Steps / A `/spec` taken over", and `ordo-help` Steps 3 and 4 are built. The refusal wording in `land` and `diagnose` no longer says "no worktree or base yet".
- 5: holds. The new red-line rule is in `land` Steps 6, the exclusion is in Steps 12, and `spec` Steps 1 names the exception.
- 6: holds. No version changed in this round. `refute` is wording only and step 1 already raised it from 3.0.0 to 3.0.1 (commit 0158079, command above), so no further raise is due and the orchestrator's check at landing has its answer. The other seven are as in the first report.

Cases of the brief's "Cases":

- 1: met. `spec` Steps 1 and "What it reads" 3 count the other plan's `preparing` entry and refuse with "A step in flight", which names each step with its plan and `landing` value.
- 2: met. Steps 5 compares with "every other step in flight ... a step at `landing: preparing` included", each brief read in the main checkout, committed or not.
- 3: met. Steps 5 skips a `preparing` step whose brief is not written, and the later run makes the compare. The second comparison before the preparation commit is in Steps 5.
- 4: met. Steps 1 ("each refusal after the entry is written remove it") and "A stop" 2 ("the entry ... is removed before the commit of item 1").
- 5: met. The takeover is exempt from the brief, entry, `plan.md` and report refusals, and the worktree is exempt at Steps 7. `ordo-help` Steps 4 gives `/spec <entry> <step>`. A listed agent gives the refusal "A brief check still running". An agent that ended is saved from its notice and not run again ("Steps / A `/spec` taken over" 1, "The brief check" 3). The wording residue is Standards A.
- 6: met. `land` Steps 6 fixes a session-written record in place and names the path, Steps 12 leaves it out of the commit, and a record the session did not write takes the step back out of main with an open item that names the file.
- 7: met. `land` Rules ("A brief-check report that arrives during a landing is saved after the landing's commit") and `spec` "The brief check" 1.
- 8: met. `plan-orchestration` "Reports" (line 373 and the four next-part bullets).
- 9: met. `land` Steps 12 holds `plan.md` and the state file as on disk and leaves out the waiting `/spec`'s brief and report. `spec` Steps 6 names them only when they differ from main's head.

Closures, ruling by ruling (my own read or rerun):

- 1: reproduces. `spec` "The brief check" 3 saves the final message from the notice and defines dead; `plan-orchestration` "Resuming" and "A `/spec` taken over" 1 point at it.
- 2: reproduces. Steps 1 lists the Steps 5 wait's report as an own record and exempts it from the report-path refusal; Steps 5 says the next resume point carries it.
- 3: reproduces. `land` Steps 6 and `spec` "A stop" 1 carry the exception with a pointer.
- 4: reproduces, apart from Standards B. The three "names neither / no worktree or base yet" clauses are gone and `land` "What it reads" 3 refuses any `preparing` entry.
- 5: reproduces as text. Standards B is a defect in a step of it.
- 6: reproduces for `brief_check`. The sample block parses and no unquoted `running: ` remains. See Standards C for the rest of the block.
- 7: reproduces (`plan.md` line 36).
- 8: reproduces in `plan-terms.md` and the glossary. Standards D is about its form.
- 9: reproduces (Stops row).
- 10: reproduces. Steps 1 holds one pointer bullet and Rules one sentence with the pointer. The rule itself stands in "The brief check" 1. Standards E is about other places.
- 11: reproduces. The report lists the three changes with before and after, plus two more.
- 12: reproduces. Steps 1, Steps 7 and "Over a repair round" 6 say "dispatch entry", and the glossary citation holds (lines 57, 78, 99). "What it reads" 3 and "Over a repair round" 2 are untouched as ruled. The ruling widened the paths to this file, so no finding of reaching beyond the finding.
- 13: reproduces (see the paragraph under the verification block).

No finding was closed by removing a check, and none reaches beyond its ruling.

### Findings

**Spec: none.**

**Proof: none.**

**Standards**

- A. `skills/plan-orchestration/SKILL.md` "Resuming, and handing the plan over", the bullet on `landing: preparing`, and `skills/spec/SKILL.md` Stops row "A brief check still running", column "What resumes it".
  - Hunks: "When that agent ends, its report is saved from its completion notice and the waiting `/spec` goes on, and the agent is never booked as dead" and "The waiting `/spec` goes on when the agent ends; only a run interrupted after that is taken over by `/spec` again".
  - What is wrong: "Resuming" is read after a compaction or a handover. "Steps / A `/spec` taken over" itself says that a compaction cuts a `/spec` off. In that state no `/spec` is waiting, so "the waiting `/spec` goes on" names nothing. The row says only a run interrupted after the agent ended is taken over, while an entry whose `/spec` was cut off before the agent ended is taken over too, once the agent is unlisted.
  - Failure scenario: after a compaction the session waits for the listed agent, saves the report from its notice, and then waits for a `/spec` to go on. Nothing runs `/spec` again, because the "Any other step at `landing: preparing`" bullet is read at resumption and not when the agent ends. The step stays at `preparing` and counts toward the limit.
  - Verdict: none (case 5 is met by reading the takeover rules; this is the wording that leaves out the step).

- B. `skills/plan-orchestration/references/self-rule.md` "The review of a choice", with `skills/land/SKILL.md` "Removing a step's worktree" 1 and `skills/ordo-help/SKILL.md` Steps 3.
  - Hunks: "After a preparation commit, the step's worktree and branches are removed as the `land` skill's "Removing a step's worktree" says." and "printed as in `/spec`, with its base and its worktree once they are written".
  - What is wrong: "Removing a step's worktree" 1 takes `worktree` from the dispatch entry and says "No path or branch is built from the step id". `spec` Steps 9 writes `worktree` into the entry together with `landing: not-started`, and Steps 7 makes the worktree before that. A `preparing` entry therefore never holds `worktree`, though the worktree can exist (`spec` Steps 7, takeover item 2).
  - Failure scenario: a ruling `C<n> =>` arrives while a `/spec` is cut off between Steps 7 and 9. The entry holds `base` and no `worktree`. The orchestrator cannot follow "Removing a step's worktree" 1 and either removes nothing or builds the path from the step id, which that section forbids. If it removes nothing, the new `/spec` is refused with "A worktree or branch that exists". `ordo-help` can never print the worktree of a `preparing` step.
  - Verdict: none (the rule in item 1's last bullet is stated; its removal step cannot be followed).

- C. `skills/spec/SKILL.md` "Steps / The brief check" 1, `skills/plan/templates/orchestrator-state.md` line 33 and the glossary entry **dispatch entry**.
  - Hunk: "`brief_check: "running: <agent id>"`, which the session writes into this step's dispatch entry, quoted so that the block stays valid YAML".
  - What is wrong: the quoted value is valid, but the dispatch block is still not valid YAML once any step holds forms the skills prescribe unquoted. `refute` Steps 1, Steps 7 and "Over a repair round" 6 (lines this round edits) write `over round <n>: <agent id>, ...` into `reviewer_report`. `plan-orchestration` Steps 8 and 6 add round figures to `builder_usage`. I parsed the ledger's own state file with `python3 -I`: block 0 parses, block 1 fails ("mapping values are not allowed here", line 9, column 67, at `19 min 38 s; round 1:` in `builder_usage`).
  - Failure scenario: with `workers_at_once` above 1, one step's entry is at `preparing` with a quoted value while another step's entry carries a repair-round record. A reader that parses the block still fails on the whole block, which is the failure ruling 6 was made to end, and the sentence "so that the block stays valid YAML" is false for that block.
  - Verdict: none. Ruling 6 covers `brief_check` only, so this is for the orchestrator to widen or leave. The pre-existing forms in `refute` and `plan-orchestration` are not edited in this round beyond ruling 12's wording.

- D. `skills/repo-setup/templates/plan-terms.md` **position line** (synced into `docs/glossary.md`), `skills/repo-setup/templates/docs/dev/prose-standard.md` D.
  - Hunk: "the next part being the closing report, the roadmap diff of `/roadmap done <n>`, for the user's approval, the tag and the pin, for the user's approval, where the plan's rulings set them, or the move of the folder to `<archive_root>/`".
  - What is wrong: four items in paragraph form, two of them with their own commas, in one sentence of about 55 words. The prose standard D says three or more list-shaped items become a list, and E asks for sentences under about 20 words. `plan-orchestration` "Reports" gives the same four as a bullet list.
  - Failure scenario: an orchestrator writing from the glossary reads six items, "for the user's approval" and "where the plan's rulings set them" among them, and writes "Next: for the user's approval." or splits the roadmap diff from its approval.
  - Verdict: none.

- E. `docs/glossary.md` entries **handover**, **preparation commit**, **resume point**, **session, the**, `skills/land/SKILL.md` Steps 12 and `skills/spec/SKILL.md` Steps 6, against `docs/dev/skill-layout.md` "Where a rule goes" and the Anti-patterns row "The same rule written in two sections".
  - Hunks: "other than the brief and the brief check's report of a `/spec` waiting on its brief check" (in three entries), "which its preparation commit alone carries" (in **session, the**), "It is the only commit that carries the brief and the brief check's report of a `/spec` waiting on its brief check" (in **preparation commit**); `land` Steps 12 "`plan.md` and the state file are held as they stand on disk" and `spec` Steps 6 "since a commit of the same plan made while this run waited carries them as they stood on disk then".
  - What is wrong: ruling 10 puts the "only its preparation commit carries them" rule in `spec` "Steps / The brief check" 1 alone. The glossary now restates it in four entries, and the entries **handover**, **resume point** and **session, the** do not cite that section in "Stated in". The companion rule, that a same-plan commit carries `plan.md` and the state file as on disk, is written in "The brief check" 1, in `spec` Steps 6 and in two `land` Steps 12 bullets, and only some of them name the section.
  - Failure scenario: a later edit changes the rule in "The brief check" 1 (for instance to let a `/land` back-out commit carry the report) and leaves four glossary entries and two other places on the old rule. A reader of the glossary entry **resume point** is told something different from `spec`.
  - Verdict: none.

**Behaviour: none.** The three changes of ruling 11 and the two added entries are in the report's "Host and user visible changes, before and after" with before and after. I found no other host- or user-visible change in the round's diff that the report leaves out.

### Declined to judge

- Whether the preflight reads other plans' dispatch blocks from disk or from main's head ("What it reads" 3 does not say), and whether "the runner still lists that agent" can tell a live brief check of another running session from a dead one. Both stay as in the first report; settling them needs a ruling on the source of the count and on the number of orchestrator sessions at once.
- Whether a brief-check report committed in a preparation commit may stand for a step whose text "The review of a choice" rewrites (Steps 5 does not run the check again for a report in the ledger). It follows the existing "runs once per full step" rule, and changing it is the user's call.
- A preparation commit made but `base` not yet written into the entry (an interruption between Steps 6's commit and its entry write). The takeover would start at Steps 1 and write a second brief. I did not judge whether that case has happened or costs anything.
- The tag `v6.0.0-rc.2`, its pin and the `rev-parse` check. They are the orchestrator's work after landing and are not part of this diff.
- Whether the builder's one read-only `git status` is booked. The report discloses it (item 3), `git status --short` shows only the step's files, and booking is the orchestrator's call.

Reviewer usage: a3b381607c4f71126, claude-sonnet-5-5, 221081 tokens, 41 tool uses, 5 min 47 s.

## Closed

- The first run's findings (Spec 1, Standards 1 to 9, Behaviour 1, and the report's own points) were sent to the builder in repair round 1, as rulings 1 to 13 of `agents/briefs/3-round-1.md`. The run over round 1 reproduces each closure.
- The run over round 1 is the run over the last round (`repair_rounds: 1`), so its findings go to no builder (`refute` "Steps / Over a repair round" 7). Each is small and inside the brief, and is fixed at landing on main:
  - A. `plan-orchestration` "Resuming, and handing the plan over" and the `spec` Stops row "A brief check still running" say what happens when the agent ends with no `/spec` waiting on it, as after a compaction: the session runs `/spec <entry> <step>` again, which takes the entry over and saves the report from the agent's completion notice ("Steps / A `/spec` taken over" 1).
  - B. `spec` Steps 7 writes `worktree` into the step's dispatch entry before `git worktree add`, so a `preparing` entry names its worktree from then on, and Steps 9 no longer adds it; the template comment and the glossary entry **dispatch entry** say the same.
  - C. The dispatch entry's values that hold `: ` (`brief_check` while its agent runs, `builder_usage` after a round, `reviewer_report` after a run over a round) are written in double quotes, as the template `skills/plan/templates/orchestrator-state.md` and the glossary entry **dispatch entry** state once, and `spec` "Steps / The brief check" 1 points at that rule. The ledger's own state file is brought to that form.
  - D. The glossary entry **position line** names the closing's next part by pointing at `plan-orchestration` "Reports", in place of the four parts in one sentence.
  - E. The glossary entries **handover**, **preparation commit**, **resume point** and **session, the**, `land` Steps 12 and `spec` Steps 6 keep only a pointer to `spec` "Steps / The brief check" 1 for the rule on what a `/spec` waiting on its brief check leaves out of other commits.
