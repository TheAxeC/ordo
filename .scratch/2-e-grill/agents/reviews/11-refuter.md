# Step 11 refuter report (on .agents/worktrees/2e-11, base acb79f6)

A page this report cites is named by its section, not by line number. A finding in code keeps its `file:line`. I changed nothing in the worktree or in the ledger. My own scratch runs were in `mktemp -d "$TMPDIR/r11.XXXX"` folders; the script that drove them is `$SP/r11.sh` in the session scratchpad.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0

git diff acb79f6 --stat -> the 9 files the brief lists, "9 files changed, 36 insertions(+), 10 deletions(-)"; git status --short adds only ?? .scratch/2-e-grill/agents/reviews/11-report.md
git diff acb79f6 --name-only | xargs env LC_ALL=C grep -n '[^ -~]' -> nothing, rc=1; the same grep on the report -> rc=1
git grep -n -i "adr" -- skills/spec skills/refute skills/plan/SKILL.md -> 18 lines: plan:40,61,66,82; refute:40,98,99,144; spec:50,85,86,239,248,262; brief-check.md:41,43,45; brief.md:3 (matches the report)
git grep -n "rulings file\|rulings/<slug>" -- skills docs -> docs/glossary.md:78, plan:39,51,76,87, plan-terms.md:73 (matches the report)
description length command -> 477 plan, 951 refute, 1022 spec
git show acb79f6:skills/ordo-help/SKILL.md | grep -n "repair round: the session" -> 59: (the report's line-59 correction holds)
git log --oneline -3 -- skills/ordo-help/SKILL.md -> 6c51194 only
wc -l over the 9 files -> 1323 total (matches)
Scratch /plan case, redone by hand from the new text with sh $SP/r11.sh <mode>:
  tracked:   git rm rc=0, commit rc=0; ls fails; HEAD "Open plan 7": A x4 (.gitkeep x2, orchestrator-state.md, plan.md), D .scratch/rulings/7-scratch-entry.md; Rulings = G1, G2 only, no heading
  untracked: commit rc=0; ls fails; A x4, no D; Rulings = G1, G2
  none:      commit rc=0; A x4; Rulings = the template's placeholder line
  modified (tracked, then a G3 line appended and not committed): "error: the following file has local modifications: .scratch/rulings/7-scratch-entry.md", git rm rc=1; commit rc=0 with "M .scratch/rulings/7-scratch-entry.md"; the file is still on disk
git commit -m x -- b gone (gone never tracked, deleted) -> "error: pathspec 'gone' did not match any file(s) known to git", rc=1 (reproduces the builder's point on Steps 6)
```

## Verdicts

Items of the brief's "What to build". For every item I compared the diff with the dictated text word for word.

- 1: holds, spec:50.
- 2: holds, spec:85-86. See Spec 1 on the text itself.
- 3: holds, spec:239 and spec:248. See Spec 6.
- 4: holds, brief-check.md:41-46, with a blank line before "## Declined to judge".
- 5: holds, spec:262. "first five rows" is at spec:257.
- 6: holds, refute:40.
- 7: holds, refute:98-99.
- 8: holds, refute:144.
- 9: holds, plan:39-40.
- 10: holds, plan:51.
- 11: holds, plan:61-62, placed before the write bullet.
- 12: holds, plan:76. See Standards 3.
- 13: holds, plan:82 and plan:87.
- 14: holds. The three lines in plan-terms.md match the dictation, and docs/glossary.md was written by the sync ("ok" above). See Standards 1.
- 15: holds, brief.md:3.
- 16: holds, plan-orchestration:64 and :285.
- 17: holds, ordo-help:59 (the brief said 60; line 59 is where the text is) and :67.

Cases of the brief's "Cases":

- The `adr` grep: met. It prints the old line (now plan:66) plus the lines of items 1-9, 11, 13 and 15. Item 9's first line, item 10 and item 12 do not appear.
- The rulings-file grep: met. It also prints plan:87, the "The plan exists" row that item 13 changed. The brief's expected list left that row out; the report names it.
- sync ok: met.
- `git diff --stat`: met.
- Description lengths: met, all at most 1024 and unchanged.
- Scratch `/plan` copy: met. My own rerun, following the text by hand, reproduces the expected output for tracked, untracked and no rulings file. The variant the case did not cover (a tracked file with uncommitted changes) fails; see Spec 3.
- Reading, `/spec` on A: met. spec:50 counts a `proposed` record as in force, spec:86 stops, and the row at spec:262 names the ADR and quotes the step's words.
- Reading, brief check on B: met. spec:239 names both findings, and spec:248 closes a clash in the brief's own wording by a change to the brief.
- Reading, `/refute` on B: met. refute:98 gives the Spec finding; refute:144 repairs one the builder made and raises one the brief asked for.
- Reading, superseded record: met for the template's own form, `Status: superseded by 0002`. The status forms used in cathedra fail; see Spec 2.
- Reading, `/plan` Steps 3: met, plan:61-62 and :82.
- Reading, each term against its "Stated in": partial. **ADR** and **rulings file** hold. **rule clash** points at a section that does not state the term, and misses one that does; see Standards 1.

The step line's check ("each change read in place, and one scratch case"): it could pass without the goal, in part. The readings were done on inputs in the template's exact form, and the scratch script encodes the builder's reading of the text rather than reading the text. The check therefore passed while two things are still wrong:
- The readers can count a superseded record as binding in a repository that writes its status another way (Spec 2).
- A rule-clash stop ruled as "a new ADR that supersedes it" cannot resume (Spec 1).

## 1. Spec

All six findings are in the text the brief dictated, so no item verdict is violated by them.

**Spec 1.** `skills/spec/SKILL.md` Steps 2, with "Steps / A ruling" and the Stops row "A rule clash with an ADR"; also `skills/ordo-help/SKILL.md` "when a command stops".
- Quoted text: "Its options are the step changed to follow the ADR, or a new ADR that supersedes it".
- What is wrong: no text says who writes the superseding ADR, or when. "Steps / A ruling" books the ruling and rewrites the step's text, then says "`/spec <entry> <step>` is typed again". ordo-help's next line says "/spec <entry> <step> again; it now writes the brief".
- Failure scenario: the user types "Ruled: new ADR supersedes 0001". The session books it. `/spec` runs again, and Steps 2 still reads 0001 as not superseded, because no 0002 exists and 0001's status is unchanged. It stops again with the same open item. The only other outcome is a session writing an ADR, which no text authorizes.
- Suggested fix: a sentence in "Steps / A ruling" saying that a ruling for a new ADR is carried out before `/spec` runs again. The new record is written from the folder's `template.md` with status `proposed`, the old record's status becomes `superseded by NNNN`, and the index row is added. Who writes it (the session, or `/grill` from step 12) is a decision for the orchestrator under "Overnight work" 5 or for Axel.

**Spec 2.** The status test "whose status does not read `superseded by NNNN`", at spec:50 and :239, refute:40, plan:40, brief-check.md:43 and in the **ADR** glossary term.
- What is wrong: the test is written as the template's literal string. The repositories these readers will run in write superseded status in other forms.
  - Command: `grep -l -i "superseded by"` over cathedra/docs/adr (93 records).
  - `0003-...md`: "> **Superseded by [ADR 0029](...)**", with no Status line.
  - `0010-...md`: "> **Superseded by ADR 0033**".
  - `0047-...md`: "> **SUPERSEDED by [ADR 0050](...)**".
  - `0005-...md` and `0007-...md`: "> **Status: superseded by ADR 0015.**" and "... by ADR 0013.".
  - game-engine/docs/adr has 52 records, most with no Status line.
- Failure scenario: `/spec` on a cathedra step that follows ADR 0029's dispatch. The session reads 0003 as a record whose status does not read `superseded by NNNN` (it has no status line), counts it as in force, and stops on a false rule clash. Or the brief names 0003 as binding and the builder is held to a rejected design.
- Suggested fix: "whose status, or whose opening lines, do not say it is superseded by another record", in all six places.

**Spec 3.** `skills/plan/SKILL.md` Steps 6 (plan:76).
- Quoted text: "`git rm -q -- <path>` when git tracks it".
- What is wrong: git refuses to remove a tracked rulings file that has uncommitted changes. My "modified" run: `git rm rc=1` with "has local modifications"; the commit by path then committed the file as `M` and left it on disk.
- Failure scenario: a second `/grill` session appends G3 to a rulings file that was already committed. `/plan` copies G3 into plan.md, `git rm` fails, and the opening commit keeps the rulings file.
- Suggested fix: `git rm -q -f -- <path>`. Forcing is safe here because Steps 2 has already copied the file's bullet lines into plan.md.

**Spec 4.** `skills/plan/SKILL.md` Steps 2 (plan:51).
- Quoted text: "the file's other lines, such as a heading or a blank line, are not copied".
- What is wrong: a hard-wrapped continuation line or an indented sub-bullet is also "another line". It is dropped, and Steps 6 then deletes the file.
- Failure scenario: a hand-written, untracked rulings file with an answer wrapped over two lines. The second line is lost for good.
- Suggested fix: a line that is neither a bullet line, a heading nor blank is shown with the draft at Steps 3 before the file is removed. Step 12 may instead fix the file's format, but `/plan` also reads hand-written files.

**Spec 5.** `skills/spec/templates/brief.md` "What is on the tree", and `skills/spec/SKILL.md` Steps 4, first bullet.
- What is wrong: Steps 2 requires the brief to name each ADR the step touches (its number, title and Decision sentence), or to say that none does. The template's "What is on the tree" placeholder has no place for this, and Steps 4 lists only the rules file and the standards. The spec skill is its folder, so the fix stopped at line 3 of the template.
- Failure scenario: a session writing from the template leaves out the ADR line. Only the brief check's ADRs check then catches it.

**Spec 6.** spec:239 (the ADRs check) and brief-check.md:43.
- What is wrong: unlike spec:50, refute:40 and plan:40, this check does not give the default `(docs/adr when the block has none)`.
- Evidence: `grep -c '^adr:'` prints 0 for cathedra/.scratch/38-4-what-the-split-left/orchestrator-state.md and for research-hub/tools/oculus/.scratch/migration/orchestrator-state.md. cathedra/docs/adr exists.
- Failure scenario: after the pin, the brief-check agent on cathedra's open plan finds no `adr` key, reads no ADR, and reports "no record" while /spec's own Steps 2 reads docs/adr.

## 2. Proof

**Proof 1.** The builder's report, "Scratch case for `/plan`'s copy", and `$TMPDIR/s11/scratch.sh`.
- What is wrong: the report calls the script "the steps of `/plan 7`". The script follows the text for the parts the case checks:
  - the slug `7-scratch-entry`;
  - the bullet-only copy (`grep '^- '`) in place of line 31;
  - `git add` and a commit by path;
  - `git rm` plus naming the path when the file is tracked, and `rm` plus the four paths when it is not.
- It does less than the text elsewhere:
  - Steps 2's goal and gate are not copied in, so plan.md keeps the template's placeholders.
  - No step list or Gate answers are drafted.
  - Steps 4 is a plain copy of the template; the report does say this.
- It never reads SKILL.md, so it prints the same output with `skills/plan/SKILL.md` reverted.
- No decision rests on this beyond the case, and my own rerun by hand reproduces the case's expected result.
- Failure scenario: a reader takes the script's green output as evidence that the text leads a session there. The evidence for that is the reading, not the script.

## 3. Standards

**Standards 1.** `skills/repo-setup/templates/plan-terms.md`, **rule clash** (and its synced copy in docs/glossary.md).
- Quoted text: "`refute`, "The four headings" and "Finding dispositions"".
- What is wrong: refute's "The four headings" does not state the term. refute:98 states an ADR contradiction as a finding, and under refute:144 that is a rule clash only when the brief asked for it. Meanwhile `spec` "Steps / The brief check" (spec:248), which names the stop "A rule clash with an ADR", is left out.
- The builder's reading also noticed that the words are absent at refute:98, but marked the point as holding.
- Failure scenario: a reader who looks up where `/refute` states a rule clash lands on the Spec finding list, and may treat every ADR contradiction as a stop.
- Verdict: the terms reading case is partial.

**Standards 2.** `docs/adr/README.md` (and `skills/repo-setup/templates/docs/adr/README.md`), and `skills/repo-setup/templates/CLAUDE.md:22`.
- Quoted text: "A change that contradicts an ADR is a rule clash: it stops and is ruled on."
- What is wrong: the diff makes this sentence false for two cases:
  - refute:144, "One the builder made against the brief is closed like any other finding";
  - spec:248, "One found only in the brief's own wording is closed by a change to the brief".
- Failure scenario: in a repository `repo-setup` made, the user or a landing session reads the README and stops a step for a builder's slip that `/refute` says to repair. Or the user expects a stop that never comes.
- Suggested fix: the README sentence reads "A step that contradicts an ADR ..." or "A change a step asks for ...".

**Standards 3.** plan:76.
- Quoted text: "`git rm -q -- <path>` when git tracks it, its path named in the commit with the others, or the file deleted before the commit when git does not".
- What is wrong: the middle clause can be read as applying to both branches. The builder's reading (it belongs to the tracked branch) is right, and git confirms it: naming an untracked, deleted path gives `error: pathspec 'gone' did not match any file(s) known to git`, rc=1. The prose standard asks for one reading.
- Failure scenario: a session names the untracked path in the commit, and the opening commit fails.
- Suggested fix: "when git tracks it, `git rm -q -- <path>` and its path named in the commit with the others; when git does not, the file deleted before the commit".

## 4. Behaviour

None. The report's "User-visible changes" section points to every changed line, before and after.

## Declined to judge

- Whether `proposed` records should bind. This is Decision 2, booked as ruling "Step 11, which ADRs bind" for Axel to overturn.
- The cost of reading every record in each `/spec` run, brief check and `/refute` run: 93 records in cathedra, 52 in game-engine. It is a design cost, not a defect a read can settle.
- Whether a step whose diff carries an ADR clash the brief asked for lands with the item pending. `plan-orchestration` Steps 3 ("A stop, here or at any later step, blocks its own step") keeps it off main under the orchestrator. A hand-run `/land` refuses only a finding "neither closed nor raised". I did not trace that route further.
- A copied rulings line that does not end in "(the user)" cannot be named by a `(ruling <name>)` tag. This is the builder's point 3, carried to step 12's brief in the state file's position.
- Naming `/grill` before step 12 writes it. The installed skills are pinned until 2.E's closing ("Overnight work" 3).

Reviewer usage: not measured by the reviewer (the completion notice carries it); about 45 tool uses.

## Repair round 1, refuted

I changed no file. My only git in the worktree was `git diff acb79f6`, `git status --short` and `git grep`, plus `diff`. My scratch runs were in fresh `mktemp -d "$TMPDIR/rr11.XXXX"` and `rr11h.XXXX` folders. The round's delta is `git diff acb79f6 -- . ':!.scratch'` compared with `11-round-0.diff`. It holds exactly the nine points of `11-round-1.md` and nothing else. There is no change outside the round brief's paths.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0

git grep -n "superseded by NNNN" -- skills docs -> 7 lines:
  docs/adr/README.md:5, docs/adr/template.md:3, docs/glossary.md:10,
  skills/repo-setup/templates/docs/adr/README.md:5, skills/repo-setup/templates/docs/adr/template.md:3,
  skills/repo-setup/templates/plan-terms.md:5, skills/spec/SKILL.md:218
  (matches the report)
git grep -n "A change that contradicts an ADR" -- skills docs README.md -> rc=1
python3 skills/repo-setup/templates/sync_rules.py . --only glossary -> ok: the plan-terms block equals the template
diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md -> nothing, rc=0
git diff acb79f6 --name-only | xargs env LC_ALL=C grep -n '[^ -~]' -> rc=1; the same grep on 11-report.md -> rc=1
git diff acb79f6 --stat -> 12 files changed, 42 insertions(+), 13 deletions(-) (matches the report)
description length command of docs/dev/skill-layout.md -> 477 plan, 951 refute, 1022 spec
git grep -n -i "adr" -- skills/spec skills/refute skills/plan/SKILL.md -> 21 lines:
  the 18 of round 0, plus spec:99, spec:218 and brief.md:10
git grep -n "rulings file\|rulings/<slug>" -- skills docs -> glossary:78, plan:39,51,76,87, plan-terms:73
The report copy in the main checkout and the one in the worktree -> diff rc=0

sh $TMPDIR/s11/scratch.sh <fresh folder> <mode>, rerun by me:
  with:      ls fails; HEAD "Open plan 7": A x4, D .scratch/rulings/7-scratch-entry.md; Rulings = G1, G2
  untracked: ls fails; A x4, no D; Rulings = G1, G2
  modified:  ls fails; A x4, D .scratch/rulings/7-scratch-entry.md; Rulings = G1, G2, G3
  without:   A x4; Rulings = the template's placeholder line
  (matches the report)

By hand, a rulings file that is staged but was never committed
(git ls-files lists it; "when git tracks it" applies):
  git rm -q -f -- .scratch/rulings/7-x.md -> rc=0
  git commit -q -m "Open plan 7" -- .scratch/7-x/plan.md .scratch/rulings/7-x.md
    -> "error: pathspec '.scratch/rulings/7-x.md' did not match any file(s) known to git", rc=1
```

### Closure of the first report's findings

- **Spec 1** (who writes a superseding ADR): partly closed. spec:218 now says the session writes the new record, sets the old record's status and adds the index row. Four gaps remain on concrete inputs (findings R1, R2, R3 below).
- **Spec 2** (the status test): closed for the forms the first report named. The five readers and the term now say "status, or opening lines". Read against cathedra 0003, 0010, 0047, 0005 and 0007, each counts as superseded. It does not settle partial supersession, or supersession stated only in the newer record (R4).
- **Spec 3** (git rm on a modified file): closed. My `modified` rerun gives `D` and the file is gone. There is one edge that still fails: a staged, never-committed file (R7).
- **Spec 4** (lines dropped from the rulings file): partly closed (R6).
- **Spec 5** (the brief template has no place for ADRs): closed.
  - `brief.md:10` holds the ADR bullet.
  - spec:99 in Steps 4 says "The ADRs the step touches, as Steps 2 names them."
- **Spec 6** (the default folder): closed. spec:241 and brief-check.md:43 both carry the default.
- **Proof 1** (the scratch script): closed in substance. Report line 92 now says the script "does not read `skills/plan/SKILL.md`" and that the reading is the evidence. The same line still describes the old script (R9).
- **Standards 1** (the term **rule clash**): closed. I read each place its "Stated in" names:
  - plan-orchestration:285;
  - shared-rules.md:9;
  - spec:86, spec:250 and spec:264;
  - refute:144.
  Each one states the term.
- **Standards 2** (the README sentence): partly closed (R8).
- **Standards 3** (the ambiguous Steps 6 clause): closed. plan:76 now separates the two branches with a semicolon.
- No closure was made by removing what a finding guarded.

### Verdicts

Items of "What to build". Where the round brief replaced an item's text, I judged the item against the round text.

- 1: holds, spec:50.
- 2: holds, spec:85-86.
- 3: holds, spec:241 and spec:250.
- 4: holds, brief-check.md:41-46.
- 5: holds, spec:264; "first five rows" at spec:259.
- 6: holds, refute:40.
- 7: holds, refute:98-99.
- 8: holds, refute:144.
- 9: holds, plan:39-40.
- 10: holds, plan:51, with the round's added sentence.
- 11: holds, plan:61-62.
- 12: holds, plan:76 as the round dictated.
- 13: holds, plan:82 and plan:87.
- 14: holds; plan-terms.md:5, :70 and :73, synced ("ok").
- 15: holds, brief.md:3.
- 16: holds, plan-orchestration:64 and :285.
- 17: holds, ordo-help:59 and :67.

Cases:

- `adr` grep: met, 21 lines as listed above.
- Rulings-file grep: met.
- sync ok: met.
- `git diff --stat`: met with the paths the round widened to (12 files).
- Description lengths: met.
- Scratch `/plan` copy: met for all four modes. The staged-only variant fails (R7).
- Reading, `/spec` on A: met (spec:50, :86, :264).
- Reading, the brief check on B: met (spec:241, :250).
- Reading, `/refute` on B: met (refute:98, :144).
- Reading, a superseded record: partial. It is met for the template form and for the cathedra forms the first report named. It is unmet for partial supersession, and for supersession stated only in the newer record (R4).
- Reading, `/plan` Steps 3: met (plan:61-62, :82).
- Reading, the terms against their "Stated in": met.

### Findings

**R1. Spec: the new ADR files are not in the preparation commit.** Place: spec:218, read with spec Steps 1 and Steps 6.
- Quoted text: "the three files go into the next preparation commit".
- What is wrong:
  - Steps 1 counts only changes under the ledger folder as the session's own records. It says "Any unrelated change of the user's outside the ledger folder is listed by path. It is left alone."
  - Steps 6 lists what the preparation commit holds: the brief, the brief check's report, the patch, the session's own records, `plan.md` and the state file. The ADR folder's files are not in that list.
  - A ruling is booked "in any session on the repository", so `/spec` often runs in a different session from the one that booked it.
- Failure scenario:
  1. The user rules "new ADR supersedes 0001". The session writes `docs/adr/0002-...md`, edits 0001 and edits `README.md`.
  2. A fresh session runs `/spec`. Its preflight lists the three files as the user's changes and leaves them alone. Steps 6 commits without them.
  3. The worktree is made from that commit, so it has no 0002 and 0001 is still in force.
  4. `/refute` reads the ADR folder in the worktree and raises the brief-asked contradiction of 0001 as a rule clash again. The three files stay uncommitted on main.
- Verdict: none of the items; it is the round's text.

**R2. Spec: what the new record holds, and where it is written from.** Place: spec:218.
- Quoted text: "writes the new record from the ADR folder's `template.md` with the ruled decision".
- What is wrong with the content:
  - The template has four sections: Context, Decision, Alternatives rejected and Consequences. Ruling A's test requires "the alternatives rejected".
  - A ruling such as `Ruled: (b)` or `Ruled: new ADR supersedes 0001` names no decision text. Nothing says where the Decision comes from. The likely source is the step's words that the open item quoted.
  - Nothing says where the other three sections come from. The likely sources are the open item's facts, its options and their cons, with the old record's decision as the alternative rejected.
- What is wrong with the files it assumes:
  - `ls` shows that `cathedra/docs/adr` has neither `template.md` nor `README.md`.
  - `game-engine/docs/adr` has a `README.md` but no `template.md`.
- Failure scenario: a session invents the Context, Alternatives rejected and Consequences of a record that binds at once (it is `proposed`, and `proposed` binds), without the user ever reading them. In cathedra, the session has no template to write from and no index to add a row to, and it improvises the record's form.

**R3. Spec: a clash raised by `/refute` has no follow-through.** Place: refute:144, read with spec:218.
- What is wrong: refute:144 raises a brief-asked contradiction as an open item. The new bullet covers only a ruling "before `/spec` runs again". When the user rules "new ADR" on a clash that `/refute` raised, no text says who writes 0002 and supersedes 0001 before the step lands.
- Failure scenario: the step lands under the ruling while 0001 is still in force on main. The next `/spec` whose step touches the same subject stops on 0001.

**R4. Spec: partial supersession and supersession stated only in the newer record.** Places: the status test at spec:50, spec:241, refute:40, plan:40 and brief-check.md:43, and the term **ADR**.
- Quoted text: "whose status, or whose opening lines, do not say it is superseded by another record".
- What is wrong: the test is all-or-nothing, and it reads only the record's own lines.
- Opening lines that say part of a record is superseded (from `grep -n -i supersed` and `head` over the records):
  - game-engine 0021: "section 7's "JSON default" is superseded".
  - game-engine 0022: "The single-threaded design here is superseded by that".
  - game-engine 0023: "The "Editor hook, control inversion" section below is superseded ... everything else here are as written".
  - cathedra 0019: "The "no methods" stance here is superseded".
  - cathedra 0053: "Status: PART DELIVERED, PART SUPERSEDED".
  - cathedra 0062: "Decisions 3 ... are superseded".
- Supersession stated only in the newer record:
  - game-engine 0059:36: "This supersedes the transform/`Node2D`/`Node3D` portions of ADR 0037. Historical ADRs are left unedited."
  - game-engine 0049:3 supersedes 0042's `parseJson` facade.
  - Neither 0037 nor 0042 mentions supersession.
- Failure scenarios:
  - A reader drops 0022 entirely and misses its standing rule that the VFS is internal.
  - A reader keeps 0037's transform portions as binding and stops `/spec` on a false rule clash for a step that follows 0059.
- A reading that settles it: a record in force except for the part its opening lines, or a later record, names as superseded.

**R5. Spec: records without a Decision section.** This finding is from round 0's text and is not new in this round. Places: spec:50, spec:241, refute:40, brief-check.md:43 and brief.md:10.
- Quoted text: "the Decision of each record", and "the sentence of its Decision the step is under".
- What is wrong: `grep -l '^## Decision'` finds that heading in only 51 of 93 cathedra records and 29 of 51 game-engine records. game-engine 0001 is a title followed by prose. cathedra 0003 is a title, a quote, a body and Consequences.
- Failure scenario: a literal reader finds no Decision in 42 cathedra records, judges that they touch no step, and misses a real clash.

**R6. Spec: Spec 4 is only partly closed.** Places: plan:51 against plan Steps 3 (plan:60-64), the Stops row at plan:82, and plan:76.
- Quoted text: "is shown with the draft at Steps 3, so the user places it before the file is removed".
- What is wrong:
  - Steps 3's bullets do not name these lines.
  - The Stops row "The drafted step list" does not list them among what it shows.
  - No text says what happens when the user approves without placing them.
- Failure scenario: the user answers "approved". Steps 6 runs `git rm -q -f` and the wrapped line is lost, which is the first report's scenario once again. A session working from Steps 3 or from the Stops table does not show the line at all.

**R7. Spec, minor: a staged rulings file breaks the opening commit.** Place: plan:76.
- Quoted text: "when git tracks it, `git rm -q -f -- <path>`, and its path named in the commit with the others".
- What is wrong: a file that is staged but was never committed counts as tracked. My run: `git rm` gives rc=0, then the commit gives "pathspec ... did not match any file(s) known to git", rc=1.
- Failure scenario: after an interrupted `git add`, `/plan`'s opening commit fails. The test that works is "when HEAD holds it".

**R8. Standards: Standards 2 is only partly closed.** Places: `docs/adr/README.md:5`, its template copy, and `skills/repo-setup/templates/CLAUDE.md:22`.
- Quoted text: "A step that contradicts an ADR is a rule clash: it stops and is ruled on."
- What is wrong: the glossary defines **step** (docs/glossary.md:87) as "one deliverable and one dispatch of its executor". Under that definition, a builder's diff that contradicts an ADR against its brief is "a step that contradicts an ADR". refute:144 says such a contradiction is "closed like any other finding".
- Failure scenario: a landing session reads CLAUDE.md and stops for a builder's slip that `/refute` says to repair.
- A wording that fits refute:144 and spec:250: "A step's text that contradicts an ADR", with a builder's contradiction against its brief repaired.

**R9. Proof, minor: the report still describes the old script.** Place: `11-report.md:92`.
- Quoted text: "`$TMPDIR/s11/scratch.sh <folder> with|without|untracked`" and "`git rm -q -- <rulings file>`".
- What is wrong: the script now has four modes and runs `git rm -q -f`. The round section says so, but the edited line 92 does not. No decision rests on it.
- Failure scenario: a reader of the first section takes the old command as the one that ran.

### Declined to judge

- Whether `/plan` and `/spec` should follow a repository's commit rule. Both commit whatever that rule says (plan Steps 6, spec Steps 6), and only `repo-setup` and `ordo-init` read the rule (`git grep -n -i "commit rule"`). The new bullet inherits this; the round did not introduce it, so I did not judge it as the round's defect.
- The case of a grill session appending to the rulings file between Steps 2's copy and Steps 6's `git rm -f`. The `-f` sentence ("whose bullet lines Steps 2 has already copied") is then false for the new line. That depends on how step 12 writes the file, which does not exist yet.
- The ledger ruling "Step 11, which ADRs bind" in plan.md still quotes the old literal test. It is ledger text, outside the diff.
- The tokens and time of this review: the completion notice carries them.

Reviewer usage: tokens not measured by the reviewer; about 40 tool uses.

## Closed

- First run, Spec 1 to 6, Proof 1 and Standards 1 to 3: closed in repair round 1, as the round's reviewer verified, except where the round's findings below reopen them.
- Round 1, R1 and R3: fixed at landing, the superseding-ADR bullet of `spec` "Steps / A ruling" covers a clash raised by `/spec` or `/refute` and the session commits the record's files by path at once.
- Round 1, R2: fixed at landing, the new record's decision, context, alternatives rejected and consequences named from the open item, and its form taken from the folder's latest record when the folder has no `template.md`.
- Round 1, R4 and R5: fixed at landing in `spec` "What it reads" 5 (which the other readers point at), the brief check, `refute`, `plan`, the brief-check template, the brief template and the term **ADR**: a record in force except for the part its own opening lines or a later record supersede, and its decision read from a record without a Decision section.
- Round 1, R6: fixed at landing, `plan` Steps 3 shows the rulings file's other lines, the Stops row names them, and a line left unplaced is copied as it stands.
- Round 1, R7: fixed at landing, the removal keyed on the last commit holding the file, with `git rm -q -f --cached` for a staged file; shown on a scratch repository.
- Round 1, R8: fixed at landing in both ADR READMEs and the CLAUDE.md template.
- Round 1, R9: left; the builder's report's first section names the old script form, the round section names the current one, and no decision rests on it.
