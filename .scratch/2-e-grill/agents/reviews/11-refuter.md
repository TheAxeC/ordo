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
