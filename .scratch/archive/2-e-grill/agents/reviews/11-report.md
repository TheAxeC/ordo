Everything in the brief is done. One line number in the brief is wrong (item 17 names `skills/ordo-help/SKILL.md` line 60 for the repair-round text, which is line 59); the dictated text was written at the line that holds it. The step's own check "each change read in place" is answered under "Reading points"; nothing is left undone.

## Open items of the state file (verbatim, read from /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md)

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Approval stops under a ruling (2026-09-30, raised at step 9's landing): step 9 landed the one-ruling sentence for the approvals the orchestrator itself asks for (what a new script computes, a change to the configuration or the verification list). A skill the option runs still stops at its own approval (`/roadmap`'s diff, `/ordo-init`'s and `/repo-setup`'s drafts, `/plan`'s step list), and the option names that stop. A version that let those skills skip their stop under a ruling was built in the repair round and left out of main, since its review found five gaps: the mechanics sat only in the glossary, which no skill reads; the ruling was to be named in a commit that a repository's commit rule can forbid, and `/ordo-init` run alone takes its commit rule from the very stop it would skip; the question stops, `/ordo-init` inside `/repo-setup` and `sync`'s hunks were not covered; `ordo-init`'s rule that a change to an existing file waits for approval was left without the exception; `/plan`'s gate answers are drafted after the ruling. Options: (a) a new step 9a, "approved by a ruling": `plan-orchestration` quotes the ruling when it runs a skill; each of `plan`, `roadmap`, `ordo-init` and `repo-setup` reads the quoted ruling ("What it reads") and, at each approval stop, compares the draft with the ruled text and skips the stop only when they are the same change; the question stops of `repo-setup` and `ordo-init` are skipped when the ruling states the answers; `/ordo-init` inside `/repo-setup` takes the same ruling; `sync`'s hunks included; the ruling is named in the commit, or, where the commit rule forbids one, in the list of files written that the skill shows; `ordo-init`'s Rules 5 gains the exception; `/plan` still stops when a gate or a step's check could pass without the goal. Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", run before step 12, and its text in those four skills. (b) Keep what landed: a skill's own approval stop stays, and the option names it, so the user sees each such change twice. Recommendation: (a), since unattended runs meet those stops and one decision should not be asked twice; (b) is the lazy option.
- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- The old skill name in other repositories (2026-09-30, raised at step 10's review): after the next pin `/plan-help` no longer exists, and these files still name it (`grep -rIl -i plan-help`, `.git` and `.scratch` left out): `game-engine/.agents/plan.yaml:1` and `cathedra/.agents/plan.yaml:1` (the comment listing the plan skills); `research-hub/.agents/plan.yaml:1`, `research-hub/CLAUDE.md:33` (read by every session there), `research-hub/docs/AGENT-APPROACH.md`, `research-hub/tools/figures/gen_figures.py` and `plan-loop.svg`. research-hub is read only, and changing another repository waits for Axel under ruling "Overnight work" 5. Options: (a) step 15, which already edits game-engine's and cathedra's `.agents/plan.yaml` and leaves the edit for Axel to commit, also changes their line 1 to `/ordo-help`; Axel changes research-hub's files himself, or rules that a step of a later plan does. Pros: the pin at 2.E's closing leaves no repository pointing at a missing skill; no extra commit in each repository. Cons: step 15 grows by one line per repository. Approving (a) also approves adding "and line 1's `/plan-help` becomes `/ordo-help`" to step 15's line in plan.md. (b) leave them: the lazy option, since a session in research-hub reads CLAUDE.md's list and types a skill that no longer exists. Recommendation: (a).
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## Cases, first run on the unchanged tree (HEAD acb79f6, `git status --short` empty)

1. `git grep -n -i "adr" -- skills/spec skills/refute skills/plan/SKILL.md` printed one line, `skills/plan/SKILL.md:61:` (the Steps 4 list of configuration keys). As the brief says.
2. `git grep -n "rulings file\|rulings/<slug>" -- skills docs` printed nothing, rc=1. As the brief says.
3. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, rc=0.
4. `git diff --stat` printed nothing.
5. The description length command printed 726 land, 386 ordo-help, 632 ordo-init, 788 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 776 repo-setup, 997 roadmap, 1022 spec; all at most 1024.
6. `ls .scratch/rulings` printed `ls: .scratch/rulings: No such file or directory`.
7. Scratch case for `/plan`'s copy, read on the old text of `skills/plan/SKILL.md` (`cat -n ... | sed -n 20,90p`): "What it reads" has items 1 to 3 (plan.yaml, the roadmap, the verification page); Steps 2 (lines 46-56) copies the goal and gate only, and Steps 6 (lines 69-70) commits `plan.md`, `orchestrator-state.md` and the two `.gitkeep` files. Nothing reads, copies or removes a rulings file. As the brief says.
8. Reading case on the old `spec`, `refute` and `plan` texts: `spec` "What it reads" 5, Steps 2, the six checks of "Steps / The brief check" and its Stops table (first four rows are stops) mention no ADR; `refute` "What it reads" 5, the Spec heading and "Finding dispositions" mention none. So step A of the reading case would not stop under the old text.

No case is wrong under the brief's rules on the unchanged tree. Checked before the change: each anchor line of items 1 to 17 exists once and verbatim, except the one recorded under "Anything in the brief that was wrong": `ordo-help` line 59, not 60.

## Cases and checks after the change

### Case 1: `git grep -n -i "adr" -- skills/spec skills/refute skills/plan/SKILL.md` (line text cut at 110 characters)
```
skills/plan/SKILL.md:40:5. The ADRs in the folder the configuration's `adr` names (`docs/adr` when it has none
skills/plan/SKILL.md:61:   - With the draft, name each design decision the drafted steps rest on that no ADR i
skills/plan/SKILL.md:66:   - The configuration block is filled in from `plan.yaml`, every key of the block wri
skills/plan/SKILL.md:82:| The drafted step list | Every plan, after Steps 2: the skill does the mechanical hal
skills/refute/SKILL.md:40:   - Then the ADRs the brief names under "What is on the tree", and every other `NNN
skills/refute/SKILL.md:98:  - a change that contradicts an ADR that is not superseded, with the ADR's number a
skills/refute/SKILL.md:99:  - an ADR the diff is under that the brief's "What is on the tree" does not name;
skills/refute/SKILL.md:144:- A contradiction of an ADR that the brief asked for is a rule clash: it is raised 
skills/spec/SKILL.md:50:   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the
skills/spec/SKILL.md:85:   - Read the ADRs the step touches, as "What it reads" 5 says. The brief names each u
skills/spec/SKILL.md:86:   - A step's text that contradicts an ADR that is not superseded is a rule clash, a s
skills/spec/SKILL.md:239:   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr`
skills/spec/SKILL.md:248:   - A contradiction the **ADRs** check finds in the step's text is the stop "A rule 
skills/spec/SKILL.md:262:| A rule clash with an ADR | The step's text contradicts an ADR the step touches that
skills/spec/templates/brief-check.md:41:## 7. ADRs
skills/spec/templates/brief-check.md:43:- <each `NNNN-*.md` record in the configured `adr` folder whose status
skills/spec/templates/brief-check.md:45:Findings: <each part of the brief that contradicts an ADR, with the AD
skills/spec/templates/brief.md:3:Read `<rules file from plan.yaml>` first; its rules govern this step unchange
```
Each listed line: plan:40 item 9 (What it reads 5), plan:61 item 11, plan:66 the old Steps 4 line (the former `skills/plan/SKILL.md:61`), plan:82 item 13, refute:40 item 6, refute:98 and :99 item 7, refute:144 item 8, spec:50 item 1, spec:85 and :86 item 2, spec:239 and :248 item 3, spec:262 item 5, brief-check.md:41, :43 and :45 item 4, brief.md:3 item 15. The first line of item 9 (plan:39), item 10 (plan:51) and item 12 (plan:76) name the rulings file and no ADR, as the brief says.

### Case 2: `git grep -n "rulings file\|rulings/<slug>" -- skills docs` (cut at 110)
```
docs/glossary.md:78:- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled desi
skills/plan/SKILL.md:39:4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it,
skills/plan/SKILL.md:51:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into
skills/plan/SKILL.md:76:   - The commit also removes the rulings file copied at Steps 2: `git rm -q -- <path>`
skills/plan/SKILL.md:87:| The plan exists | The ledger folder is already there: a plan is opened once | The fo
skills/repo-setup/templates/plan-terms.md:73:- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which hold
```
That is `plan` "What it reads" 4 (plan:39), Steps 2 (plan:51), Steps 6 (plan:76), the Stops row "The plan exists" (plan:87), and the two glossary copies (docs/glossary.md:78, plan-terms.md:73).

### Case 3
```
ok: the plan-terms block equals the template
```

### Case 4: `git diff --stat`
```
 docs/glossary.md                          |  4 +++-
 skills/ordo-help/SKILL.md                 |  4 ++--
 skills/plan-orchestration/SKILL.md        |  4 ++--
 skills/plan/SKILL.md                      | 10 ++++++++--
 skills/refute/SKILL.md                    |  4 ++++
 skills/repo-setup/templates/plan-terms.md |  4 +++-
 skills/spec/SKILL.md                      |  8 +++++++-
 skills/spec/templates/brief-check.md      |  6 ++++++
 skills/spec/templates/brief.md            |  2 +-
 9 files changed, 36 insertions(+), 10 deletions(-)
```

### Case 5: description length command for spec, refute and plan (unchanged)
```
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
1022 skills/spec/SKILL.md
```

### Glossary written by the sync
`python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`; the diff of docs/glossary.md is the three lines listed under "Changed lines".

### Scratch case for `/plan`'s copy

Run by the script `$TMPDIR/s11/scratch.sh <folder> with|without|untracked`, in `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/s11/`. It computes nothing and does not read `skills/plan/SKILL.md`: it encodes the builder's reading of the text as plain file writes, so the reading, not the script, is the evidence for the text; it is the steps of `/plan 7` as plain file writes and the scratch repository's own git, in a folder made by `mktemp -d "$TMPDIR/s11/scratch.XXXX"`. Git commands it runs, in the scratch folder only: `git init -q`, `git config user.email`, `git config user.name`, `git add -A`, `git commit -q -m "scratch setup"`; at Steps 6 `git add -- <the four paths>`, then, when the rulings file is tracked, `git rm -q -- <rulings file>` and `git commit -q -m "Open plan 7" -- <the four paths and the rulings file>`, or, when it is not tracked, `rm <rulings file>` and `git commit -q -m "Open plan 7" -- <the four paths>`. Files it writes: `.agents/plan.yaml` (the `plan` skill's `templates/plan.yaml` with `ledger_root: .scratch`), `docs/roadmap.md` (one entry `7 Scratch entry` with a goal and a gate), `docs/dev/building.md` (one command, `sh check.sh`), `.scratch/rulings/7-scratch-entry.md` (`# Rulings for 7`, a blank line, `- G1: the scratch answer one (the user).`, `- G2: the scratch answer two (the user).`), then `.scratch/7-scratch-entry/plan.md` (template lines 1 to 28, a Rulings heading, the copied bullet lines, template lines 33 on), `.scratch/7-scratch-entry/orchestrator-state.md` (a copy of the template) and the two `.gitkeep` files. Nothing outside `$TMPDIR/s11/` and this report was written. Step 3's approval was taken as given, and Steps 4 was exercised only as a copy of the template, since this step does not change it.

Run with a rulings file (tracked):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
D  .scratch/rulings/7-scratch-entry.md
== Rulings section
## Rulings (2026-09-30)

- G1: the scratch answer one (the user).
- G2: the scratch answer two (the user).

## Blocked, and by what
```

Run with a rulings file that git does not track (the file is deleted before the commit; the commit does not name it, since git rejects a pathspec it does not know):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
== Rulings section
## Rulings (2026-09-30)

- G1: the scratch answer one (the user).
- G2: the scratch answer two (the user).

## Blocked, and by what
```

Run without a rulings file (the Rulings section holds the template line, the commit deletes nothing):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
== Rulings section
## Rulings (2026-09-30)

- Open item <L> (<date>): <the user's decision in one line, and what it unblocks> (the user).

## Blocked, and by what
```

## Reading points

Scratch ADR: `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/s11/adr-scratch/docs/adr/0001-the-ledger-is-ascii.md` (status `proposed`, Decision "Every file under the ledger root is ASCII, except the green checkmark in `plan.md`."), and a copy `0001-superseded-copy.txt` with status `superseded by 0002`. Step A: "Write the landing report with a Unicode arrow between the old and the new value". Step B: "Write the landing report with the old and the new value side by side".

1. `/spec` on A. Read: `skills/spec/SKILL.md` "What it reads" 5 (line 50) against the scratch ADR; Steps 2 (lines 85-86) against step A; Stops (line 262).
   - Line 50 lists each `NNNN-*.md` file in the folder and reads the Decision of each record whose status does not read `superseded by NNNN`. The scratch status is `proposed`, so the record is read: in force though `proposed`.
   - A record touches the step "when its Decision governs a file, a name, a rule or a behaviour the step's text changes". The Decision governs files under the ledger root; the landing report is such a file; so it touches step A.
   - Line 86: a step's text that contradicts an ADR not superseded is a rule clash, a stop. Step A's words "a Unicode arrow" are non-ASCII, the Decision says ASCII. Contradiction, so the stop.
   - Line 262 is the row "A rule clash with an ADR", its cell "The open item, booked in the open items, naming the ADR and quoting the step's words that contradict it": the open item names ADR 0001 and quotes "a Unicode arrow". Line 86 gives the options: the step changed to follow the ADR, or a new ADR that supersedes it. Holds.
   - Line 85 requires the brief to name each touching ADR with its number, title and Decision sentence; after the stop there is no brief. Holds.
2. Brief check on B, with a brief whose "What to build" adds "join them with a Unicode arrow" and omits the ADR. Read: `skills/spec/SKILL.md` "Steps / The brief check" item 2 (line 239) and item 4 (line 248), and `skills/spec/templates/brief-check.md` section 7 (lines 41-45).
   - Step B's own text (side by side) has no non-ASCII word, so it does not contradict the ADR; the ADR touches it (landing report under the ledger root).
   - Line 239 reads the record, names the touching ADR with its Decision sentence, names "a part of the brief that contradicts one" (the added "join them with a Unicode arrow", against "Every file ... ASCII") and "an ADR the step touches that the brief's 'What is on the tree' does not name" (the brief omits 0001). Both are named, as the case expects.
   - Line 248: the contradiction is found in the brief's own wording, not in the step's text, so it is not the stop; it "is closed by a change to the brief that follows the ADR". Holds.
   - Section 7 has a bullet per record and a Findings line carrying both findings. Holds.
3. `/refute` on B, with a diff that adds an arrow to the landing report though the brief did not ask for it. Read: `skills/refute/SKILL.md` "What it reads" 5 (line 40), "The four headings" Spec (lines 98-99), "Finding dispositions" (line 144).
   - Line 40: the ADRs the brief names, and every other record not superseded whose Decision governs a file the diff changes: 0001 governs the landing report, which the diff changes, so it is read.
   - Line 98: a Spec finding, "a change that contradicts an ADR that is not superseded, with the ADR's number and the sentence of its Decision quoted, and whether the brief asked for it": the arrow contradicts 0001, the brief did not ask, so the finding says so. Line 99: the ADR is also not named in "What is on the tree", a second finding.
   - Line 144, second sentence: one the builder made against the brief "is closed like any other finding, by a change that follows the ADR": a repair round. Holds.
   - The same diff under a brief that asked for the arrow: line 144, first sentence, "raised to the user as an open item, never closed in a repair round or at landing". Holds.
4. Status `superseded by 0002`. Read: the three readers' phrase "whose status does not read `superseded by NNNN`" at `spec` line 50 and line 239, `refute` line 40, `plan` line 40, against `0001-superseded-copy.txt` (line 3 reads `Status: superseded by 0002`). Each reader skips the record, so no reader counts it. Holds.
5. `/plan` Steps 3, a drafted step that chooses a new file format no ADR or ruling settles. Read: `skills/plan/SKILL.md` lines 57-63 and the Stops row at line 82.
   - Line 61 names each design decision the drafted steps rest on that no ADR in force and no line of the Rulings section settles, a format among the listed kinds; "The list is shown, not written into `plan.md`". Line 62 names `/grill <entry>` and says it is not required. The Stops row (line 82) shows the decisions. Holds.
6. Each term against each place its "Stated in" names (`docs/glossary.md` lines 10, 75 and 78, same text in `plan-terms.md`):
   - **ADR**: `spec` "What it reads" 5 (line 50), Steps 2 (lines 85-86), "Steps / The brief check" (lines 239, 248): each states the folder, the not-superseded status and the touch condition; `refute` "What it reads" 5 (line 40), "The four headings" (lines 98-99), "Finding dispositions" (line 144); `plan` "What it reads" 5 (line 40), Steps 3 (line 61). Each place uses the term's sense: `refute` "Finding dispositions" and "The four headings" state the contradiction and not the touch condition, which line 40 states. Holds.
   - **rulings file**: `plan` "What it reads" 4 (line 39), Steps 2 (line 51), Steps 6 (line 76), Stops (line 87): each states the path `<ledger_root>/rulings/<slug>.md`, the bullet-line copy or the removal. Holds.
   - **rule clash**: `spec` Steps 2 (line 86) and Stops (line 262) state a contradiction between a step's text and a decision (an ADR), a stop for a ruling; `refute` "Finding dispositions" (line 144) states it in the words "rule clash"; `refute` "The four headings" (line 98) states the contradiction with an ADR and does not use the words "rule clash". Read against the term's definition "a contradiction between two established rules or decisions", line 98 states such a contradiction as a Spec finding, so the place applies the term; the words appear at line 144 only.

## Result table (DONE / NOT DONE)

| Item | Result | Command and output |
|---|---|---|
| 1 to 5 (`spec` SKILL.md and brief-check.md) | DONE | `git diff -U0` under "Changed lines"; `git grep -n -i "adr" -- skills/spec ...` lines spec:50, 85, 86, 239, 248, 262 and brief-check.md:41-45 |
| 6 to 8 (`refute`) | DONE | refute:40, 98, 99, 144 |
| 9 to 13 (`plan`) | DONE | plan:39, 40, 51, 61, 62, 76, 82, 87 |
| 14 (`plan-terms.md`, glossary by `--write`) | DONE | `written: the plan-terms block now equals the template`, then `ok: the plan-terms block equals the template` |
| 15 (`brief.md`) | DONE | brief.md:3 |
| 16 (`plan-orchestration`) | DONE | plan-orchestration:64 and :285 |
| 17 (`ordo-help`) | DONE | ordo-help:59 and :67 |
| Cases | DONE | as quoted above |
| Verify list | DONE | quoted below |
| ASCII grep | DONE | `git diff --name-only | xargs env LC_ALL=C grep -n '[^ -~]'` printed nothing, rc=1 (grep's no-match status) |
| Tests added or changed | not applicable | The step adds and changes no test; this item of the template does not apply. |

### Verify list, run from the worktree root

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`

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
```

## Files changed (line counts after the change, `wc -l`)

```
     111 docs/glossary.md
      97 skills/ordo-help/SKILL.md
     329 skills/plan-orchestration/SKILL.md
     102 skills/plan/SKILL.md
     179 skills/refute/SKILL.md
      95 skills/repo-setup/templates/plan-terms.md
     289 skills/spec/SKILL.md
      55 skills/spec/templates/brief-check.md
      66 skills/spec/templates/brief.md
    1323 total
```

## Changed lines, before and after, verbatim (`git diff -U0`; a line starting with `-` is before, with `+` is after)

```diff
diff --git a/docs/glossary.md b/docs/glossary.md
--- a/docs/glossary.md
+++ b/docs/glossary.md
@@ -9,0 +10 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
+- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/plan.yaml`'s `adr` names (`docs/adr` by default), holding a decision that binds work after the plan that made it closes. A record is in force, `proposed` or `accepted`, until its status reads `superseded by NNNN`. A record touches a step when its Decision governs a file, a name, a rule or a behaviour the step changes. Stated in: `spec`, "What it reads" 5, Steps 2 and "Steps / The brief check"; `refute`, "What it reads" 5, "The four headings" and "Finding dispositions"; `plan`, "What it reads" 5 and Steps 3.
@@ -74 +75 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes".
+- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes"; `spec`, Steps 2 and Stops; `refute`, "The four headings" and "Finding dispositions".
@@ -76,0 +78 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
+- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops.
diff --git a/skills/ordo-help/SKILL.md b/skills/ordo-help/SKILL.md
--- a/skills/ordo-help/SKILL.md
+++ b/skills/ordo-help/SKILL.md
@@ -59 +59 @@ then, for every step:
-"close them"                  a repair round: the session fixes the findings, reruns, rewrites the report
+"close them"                  a repair round: the session fixes the findings, reruns, rewrites the report; a contradiction of an ADR the brief asked for is raised to you as an open item instead
@@ -67 +67 @@ when a command stops:
-/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choice is yours, or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief
+/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choice is yours, the step contradicts an ADR (a rule clash), or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief
diff --git a/skills/plan-orchestration/SKILL.md b/skills/plan-orchestration/SKILL.md
--- a/skills/plan-orchestration/SKILL.md
+++ b/skills/plan-orchestration/SKILL.md
@@ -64 +64 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
-   - **The prompt.** It states, in its own words: the worktree and that it is the only place to work; the no-git rule; what is never touched (the ledger beyond the builder's report, the main checkout, the user's data); the reading order (the rules file, the brief, the standards); every requirement the step is judged on; that the step's verify list runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, and that the lines it prints are what the report quotes; the report path and shape.
+   - **The prompt.** It states, in its own words: the worktree and that it is the only place to work; the no-git rule; what is never touched (the ledger beyond the builder's report, the main checkout, the user's data); the reading order (the rules file, the brief, the standards, the ADRs the brief names); every requirement the step is judged on; that the step's verify list runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, and that the lines it prints are what the report quotes; the report path and shape.
@@ -285 +285 @@ The table holds seven kinds of stop, each for a decision that is the user's, and
-| A rule clash | A contradiction between two established rules | The stop message, below | The user's ruling |
+| A rule clash | A contradiction between two established rules or decisions, an ADR among them | The stop message, below | The user's ruling |
diff --git a/skills/plan/SKILL.md b/skills/plan/SKILL.md
--- a/skills/plan/SKILL.md
+++ b/skills/plan/SKILL.md
@@ -38,0 +39,2 @@ metadata:
+4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers for the entry, written while no plan was open.
+5. The ADRs in the folder the configuration's `adr` names (`docs/adr` when it has none): each `NNNN-*.md` record whose status does not read `superseded by NNNN`.
@@ -48,0 +51 @@ metadata:
+   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied.
@@ -57,0 +61,2 @@ metadata:
+   - With the draft, name each design decision the drafted steps rest on that no ADR in force and no line of the Rulings section settles: a public shape, a wire format, a config key, a vocabulary, a format or a rule the builder applies across the tree, or a library choice. The list is shown, not written into `plan.md`.
+   - `/grill <entry>` settles such decisions before the plan opens. It is not required: the user may approve the list with them unsettled.
@@ -70,0 +76 @@ metadata:
+   - The commit also removes the rulings file copied at Steps 2: `git rm -q -- <path>` when git tracks it, its path named in the commit with the others, or the file deleted before the commit when git does not.
@@ -76 +82 @@ metadata:
-| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check | The user's approval or correction |
+| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles (Steps 3) | The user's approval or correction |
@@ -81 +87 @@ metadata:
-| The plan exists | The ledger folder is already there: a plan is opened once | The folder | Nothing |
+| The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove | Nothing |
diff --git a/skills/refute/SKILL.md b/skills/refute/SKILL.md
--- a/skills/refute/SKILL.md
+++ b/skills/refute/SKILL.md
@@ -39,0 +40 @@ metadata:
+   - Then the ADRs the brief names under "What is on the tree", and every other `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none), whose status does not read `superseded by NNNN` and whose Decision governs a file, a name, a rule or a behaviour the diff changes.
@@ -96,0 +98,2 @@ metadata:
+  - a change that contradicts an ADR that is not superseded, with the ADR's number and the sentence of its Decision quoted, and whether the brief asked for it;
+  - an ADR the diff is under that the brief's "What is on the tree" does not name;
@@ -140,0 +144 @@ metadata:
+- A contradiction of an ADR that the brief asked for is a rule clash: it is raised to the user as an open item, never closed in a repair round or at landing, since only the user rules between the step and the ADR. One the builder made against the brief is closed like any other finding, by a change that follows the ADR.
diff --git a/skills/repo-setup/templates/plan-terms.md b/skills/repo-setup/templates/plan-terms.md
--- a/skills/repo-setup/templates/plan-terms.md
+++ b/skills/repo-setup/templates/plan-terms.md
@@ -4,0 +5 @@
+- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/plan.yaml`'s `adr` names (`docs/adr` by default), holding a decision that binds work after the plan that made it closes. A record is in force, `proposed` or `accepted`, until its status reads `superseded by NNNN`. A record touches a step when its Decision governs a file, a name, a rule or a behaviour the step changes. Stated in: `spec`, "What it reads" 5, Steps 2 and "Steps / The brief check"; `refute`, "What it reads" 5, "The four headings" and "Finding dispositions"; `plan`, "What it reads" 5 and Steps 3.
@@ -69 +70 @@
-- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes".
+- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes"; `spec`, Steps 2 and Stops; `refute`, "The four headings" and "Finding dispositions".
@@ -71,0 +73 @@
+- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops.
diff --git a/skills/spec/SKILL.md b/skills/spec/SKILL.md
--- a/skills/spec/SKILL.md
+++ b/skills/spec/SKILL.md
@@ -49,0 +50 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
+   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the Decision of each record whose status does not read `superseded by NNNN`. A record touches the step when its Decision governs a file, a name, a rule or a behaviour the step's text changes.
@@ -83,0 +85,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
+   - Read the ADRs the step touches, as "What it reads" 5 says. The brief names each under "What is on the tree", with its number, its title and the sentence of its Decision the step is under, or says that no ADR touches the step.
+   - A step's text that contradicts an ADR that is not superseded is a rule clash, a stop ("Stops"). The open item names the ADR and quotes the step's words that contradict it. Its options are the step changed to follow the ADR, or a new ADR that supersedes it, as the ADR folder's `README.md` says.
@@ -235,0 +239 @@ Steps 5 says when this runs.
+   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names whose status does not read `superseded by NNNN` is read. Each one the step touches is named with the sentence of its Decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
@@ -243,0 +248 @@ Steps 5 says when this runs.
+   - A contradiction the **ADRs** check finds in the step's text is the stop "A rule clash with an ADR", as Steps 2 says. One found only in the brief's own wording is closed by a change to the brief that follows the ADR.
@@ -252 +257 @@ Steps 5 says when this runs.
-The first four rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.
+The first five rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.
@@ -256,0 +262 @@ The first four rows are stops, which leave an open item as "Steps / A stop" says
+| A rule clash with an ADR | The step's text contradicts an ADR the step touches that is not superseded (Steps 2, or the **ADRs** check of "Steps / The brief check") | The open item, booked in the open items, naming the ADR and quoting the step's words that contradict it | A ruling |
diff --git a/skills/spec/templates/brief-check.md b/skills/spec/templates/brief-check.md
--- a/skills/spec/templates/brief-check.md
+++ b/skills/spec/templates/brief-check.md
@@ -40,0 +41,6 @@ Findings: <each implied input missing from "Cases">. Or: none.
+## 7. ADRs
+
+- <each `NNNN-*.md` record in the configured `adr` folder whose status does not read `superseded by NNNN`>: whether it touches the step, and for one that does, the sentence of its Decision the step is under and whether the brief names it under "What is on the tree". Or: no record.
+
+Findings: <each part of the brief that contradicts an ADR, with the ADR's sentence; each ADR the step touches that the brief does not name>. Or: none.
+
diff --git a/skills/spec/templates/brief.md b/skills/spec/templates/brief.md
--- a/skills/spec/templates/brief.md
+++ b/skills/spec/templates/brief.md
@@ -3 +3 @@
-Read `<rules file from plan.yaml>` first; its rules govern this step unchanged. Then, in full: <the standards the configuration lists>.
+Read `<rules file from plan.yaml>` first; its rules govern this step unchanged. Then, in full: <the standards the configuration lists>, and the ADRs this brief names under "What is on the tree".
```

## Judgment calls the brief left open

- The `git rm` and the commit path at Steps 6: the dictated bullet reads "`git rm -q -- <path>` when git tracks it, its path named in the commit with the others, or the file deleted before the commit when git does not". The scratch run read "its path named in the commit" as belonging to the tracked case: for a file git does not track, `git commit -- <path>` is rejected by git with `error: pathspec ... did not match any file(s) known to git`, so the untracked run deletes the file and names only the four paths. The text was written as dictated.
- The reading case's step B with the arrow in the brief: read as the brief-check route of `spec` line 248 (a change to the brief), as the brief says.

## User-visible changes

Each is a skill or template text, before and after under "Changed lines". No script, key or output format changed. The glossary block of `docs/glossary.md` changed only through `sync_rules.py --write` (three lines: the new terms **ADR** and **rulings file**, and the longer "Stated in" of **rule clash**).

## Anything in the brief that was wrong or impossible

- Item 17, first bullet, and the "Paths this step writes" entry `skills/ordo-help/SKILL.md lines 60-60`: the text "a repair round: the session fixes the findings, reruns, rewrites the report" is at line 59 on the tree (`grep -n "repair round" skills/ordo-help/SKILL.md` printed `59:`), and line 60 is `/refute <entry> <step>        again, over the repair round, ...`. The dictated text was written on line 59; line 60 is unchanged. `git log --oneline -3 -- skills/ordo-help/SKILL.md` prints only 6c51194, so main's numbering at that commit is the same.
- Item 8 and `skills/land/SKILL.md:118` / `plan-orchestration` Steps 8 ("Not sent back", line 106): consistent. Item 8's second sentence sends a builder-made contradiction to an ordinary repair; the first sentence covers only one the brief asked for. `git grep -n -i "closed in a repair\|sent back\|fixed at landing"` over `refute`, `land` and `plan-orchestration` shows no other statement that says otherwise.
- A copied rulings line that does not end with "(the user)" is not a ruling that a step's `(ruling <name>)` tag can name, by `spec` "What it reads" 4 (`skills/spec/SKILL.md:44`: "a line of the Rulings section that ends with "(the user)""). Item 10 copies every bullet line as it stands and item 14's term says "one bullet line each"; nothing states that `grill` writes each with "(the user)". Step 12, which writes the file, is where that is fixed; recorded here, not decided.
- Places the change makes stale that the brief's paths do not list: none found by `git grep -n -i -E "first four|four rows|six checks|one heading per check|reads three"` (the `spec` "first four rows" was item 5's own line; `skills/roadmap/SKILL.md:141` and `skills/repo-setup/SKILL.md:158` are about their own tables).

# Repair round 1

Everything in the round's brief (`.scratch/2-e-grill/agents/briefs/11-round-1.md`, points 1 to 9) is done. The refuter report `.scratch/2-e-grill/agents/reviews/11-refuter.md` was read whole first. Old text beside new text follows, each point with its lines; the delta is the diff between the tree as the round was sent (`git diff` saved to `$TMPDIR/s11/round0.diff`, applied to `HEAD` files in a scratch repository under `$TMPDIR/s11/r0`) and the tree now, by `diff -U0`, run per changed file (`-` old, `+` new).

## Changed lines of the round (old beside new, verbatim)

```diff
@@ docs/adr/README.md
-A change that contradicts an ADR is a rule clash: it stops and is ruled on. A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state with no dated note. Git and the plan's booking hold the history.
+A step that contradicts an ADR is a rule clash: it stops and is ruled on. A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state with no dated note. Git and the plan's booking hold the history.
@@ docs/glossary.md
-- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/plan.yaml`'s `adr` names (`docs/adr` by default), holding a decision that binds work after the plan that made it closes. A record is in force, `proposed` or `accepted`, until its status reads `superseded by NNNN`. A record touches a step when its Decision governs a file, a name, a rule or a behaviour the step changes. Stated in: `spec`, "What it reads" 5, Steps 2 and "Steps / The brief check"; `refute`, "What it reads" 5, "The four headings" and "Finding dispositions"; `plan`, "What it reads" 5 and Steps 3.
+- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/plan.yaml`'s `adr` names (`docs/adr` by default), holding a decision that binds work after the plan that made it closes. A record is in force, `proposed` or `accepted`, until its status or its opening lines say it is superseded by another record, in whatever form the repository writes it, such as `Status: superseded by NNNN` or a quoted line `Superseded by ADR NNNN`. A record touches a step when its Decision governs a file, a name, a rule or a behaviour the step changes. Stated in: `spec`, "What it reads" 5, Steps 2 and "Steps / The brief check"; `refute`, "What it reads" 5, "The four headings" and "Finding dispositions"; `plan`, "What it reads" 5 and Steps 3.
@@ docs/glossary.md
-- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes"; `spec`, Steps 2 and Stops; `refute`, "The four headings" and "Finding dispositions".
+- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes"; `spec`, Steps 2, "Steps / The brief check" and Stops; `refute`, "Finding dispositions".
@@ skills/plan/SKILL.md
-5. The ADRs in the folder the configuration's `adr` names (`docs/adr` when it has none): each `NNNN-*.md` record whose status does not read `superseded by NNNN`.
+5. The ADRs in the folder the configuration's `adr` names (`docs/adr` when it has none): each `NNNN-*.md` record whose status, or whose opening lines, do not say it is superseded by another record.
@@ skills/plan/SKILL.md
-   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied.
+   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3, so the user places it before the file is removed.
@@ skills/plan/SKILL.md
-   - The commit also removes the rulings file copied at Steps 2: `git rm -q -- <path>` when git tracks it, its path named in the commit with the others, or the file deleted before the commit when git does not.
+   - The commit also removes the rulings file copied at Steps 2: when git tracks it, `git rm -q -f -- <path>`, and its path named in the commit with the others; when git does not, the file deleted before the commit. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
@@ skills/refute/SKILL.md
-   - Then the ADRs the brief names under "What is on the tree", and every other `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none), whose status does not read `superseded by NNNN` and whose Decision governs a file, a name, a rule or a behaviour the diff changes.
+   - Then the ADRs the brief names under "What is on the tree", and every other `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none), whose status, or whose opening lines, do not say it is superseded by another record and whose Decision governs a file, a name, a rule or a behaviour the diff changes.
@@ skills/repo-setup/templates/CLAUDE.md
-- `docs/adr/`: the decisions that bind work after the plan that made them closes, with the alternatives rejected. A change that contradicts an ADR is a rule clash.
+- `docs/adr/`: the decisions that bind work after the plan that made them closes, with the alternatives rejected. A step that contradicts an ADR is a rule clash.
@@ skills/repo-setup/templates/docs/adr/README.md
-A change that contradicts an ADR is a rule clash: it stops and is ruled on. A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state with no dated note. Git and the plan's booking hold the history.
+A step that contradicts an ADR is a rule clash: it stops and is ruled on. A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state with no dated note. Git and the plan's booking hold the history.
@@ skills/repo-setup/templates/plan-terms.md
-- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/plan.yaml`'s `adr` names (`docs/adr` by default), holding a decision that binds work after the plan that made it closes. A record is in force, `proposed` or `accepted`, until its status reads `superseded by NNNN`. A record touches a step when its Decision governs a file, a name, a rule or a behaviour the step changes. Stated in: `spec`, "What it reads" 5, Steps 2 and "Steps / The brief check"; `refute`, "What it reads" 5, "The four headings" and "Finding dispositions"; `plan`, "What it reads" 5 and Steps 3.
+- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/plan.yaml`'s `adr` names (`docs/adr` by default), holding a decision that binds work after the plan that made it closes. A record is in force, `proposed` or `accepted`, until its status or its opening lines say it is superseded by another record, in whatever form the repository writes it, such as `Status: superseded by NNNN` or a quoted line `Superseded by ADR NNNN`. A record touches a step when its Decision governs a file, a name, a rule or a behaviour the step changes. Stated in: `spec`, "What it reads" 5, Steps 2 and "Steps / The brief check"; `refute`, "What it reads" 5, "The four headings" and "Finding dispositions"; `plan`, "What it reads" 5 and Steps 3.
@@ skills/repo-setup/templates/plan-terms.md
-- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes"; `spec`, Steps 2 and Stops; `refute`, "The four headings" and "Finding dispositions".
+- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes"; `spec`, Steps 2, "Steps / The brief check" and Stops; `refute`, "Finding dispositions".
@@ skills/spec/SKILL.md
-   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the Decision of each record whose status does not read `superseded by NNNN`. A record touches the step when its Decision governs a file, a name, a rule or a behaviour the step's text changes.
+   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the Decision of each record whose status, or whose opening lines, do not say it is superseded by another record. A record touches the step when its Decision governs a file, a name, a rule or a behaviour the step's text changes.
@@ skills/spec/SKILL.md
+   - The ADRs the step touches, as Steps 2 names them.
@@ skills/spec/SKILL.md
+   - a ruling that answers a rule clash with a new ADR is carried out before `/spec` runs again: the session writes the new record from the ADR folder's `template.md` with the ruled decision and status `proposed`, sets the old record's status to `superseded by NNNN`, and adds the new record's row to the folder's `README.md`; the three files go into the next preparation commit;
@@ skills/spec/SKILL.md
-   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names whose status does not read `superseded by NNNN` is read. Each one the step touches is named with the sentence of its Decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
+   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) whose status, or whose opening lines, do not say it is superseded by another record is read. Each one the step touches is named with the sentence of its Decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
@@ skills/spec/templates/brief-check.md
-- <each `NNNN-*.md` record in the configured `adr` folder whose status does not read `superseded by NNNN`>: whether it touches the step, and for one that does, the sentence of its Decision the step is under and whether the brief names it under "What is on the tree". Or: no record.
+- <each `NNNN-*.md` record in the configured `adr` folder (`docs/adr` when the configuration block has none) whose status, or whose opening lines, do not say it is superseded by another record>: whether it touches the step, and for one that does, the sentence of its Decision the step is under and whether the brief names it under "What is on the tree". Or: no record.
@@ skills/spec/templates/brief.md
+- <each ADR the step touches: its number, its title and the sentence of its Decision the step is under; or that no ADR touches the step>.
```

## Points

1. Status test: the words "whose status does not read `superseded by NNNN`" are replaced by "whose status, or whose opening lines, do not say it is superseded by another record" in `skills/spec/SKILL.md` (lines 50 and 241, 2 replacements), `skills/refute/SKILL.md:40`, `skills/plan/SKILL.md:40` and `skills/spec/templates/brief-check.md:43`. The term **ADR** in `plan-terms.md` now reads "until its status or its opening lines say it is superseded by another record, in whatever form the repository writes it, such as `Status: superseded by NNNN` or a quoted line `Superseded by ADR NNNN`." spec:86, spec:262 and refute:98 keep their words (not in the delta).
2. The default folder: spec:241 and brief-check.md:43 gain "(`docs/adr` when the block has none)" and "(`docs/adr` when the configuration block has none)".
3. `skills/spec/SKILL.md` "Steps / A ruling" item 2 gains the bullet on a ruling that answers a rule clash with a new ADR, after the bullet "a ruling that sets a public shape ...", at the same indentation.
4. `skills/plan/SKILL.md` Steps 6 bullet is replaced by the dictated `git rm -q -f -- <path>` text.
5. `skills/plan/SKILL.md` Steps 2 copy bullet gains the sentence on other lines shown at Steps 3.
6. `skills/spec/templates/brief.md` gains the bullet for each ADR the step touches after the "each fact the step rests on" bullet; `skills/spec/SKILL.md` Steps 4 gains "The ADRs the step touches, as Steps 2 names them." after the premises bullet.
7. The term **rule clash** "Stated in:" ends "; `spec`, Steps 2, "Steps / The brief check" and Stops; `refute`, "Finding dispositions"." in `plan-terms.md`; `sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template` and the check then printed `ok: the plan-terms block equals the template`.
8. "A change that contradicts an ADR is a rule clash" became "A step that contradicts an ADR is a rule clash" in `docs/adr/README.md:5`, `skills/repo-setup/templates/docs/adr/README.md:5` and `skills/repo-setup/templates/CLAUDE.md:22`, nothing else on those lines. `diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md` printed nothing, rc=0.
9. Proof: the scratch section above now says the script does not read `skills/plan/SKILL.md` and encodes the builder's reading, so the reading is the evidence for the text. The scratch script gained a fourth mode, `modified`, and `git rm -q -f` at the tracked branch. Output below.

## Commands after the round

`git grep -n "superseded by NNNN" -- skills docs` (cut at 130):
```
docs/adr/README.md:5:A step that contradicts an ADR is a rule clash: it stops and is ruled on. A decision that changes gets a new 
docs/adr/template.md:3:Status: <proposed | accepted | superseded by NNNN>
docs/glossary.md:10:- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in the folder `.agents/pla
skills/repo-setup/templates/docs/adr/README.md:5:A step that contradicts an ADR is a rule clash: it stops and is ruled on. A decis
skills/repo-setup/templates/docs/adr/template.md:3:Status: <proposed | accepted | superseded by NNNN>
skills/repo-setup/templates/plan-terms.md:5:- **ADR**: an architecture decision record, a file `NNNN-<decision-as-a-phrase>.md` in
skills/spec/SKILL.md:218:   - a ruling that answers a rule clash with a new ADR is carried out before `/spec` runs again: the sess
```
Each hit: `docs/adr/README.md:5` and `skills/repo-setup/templates/docs/adr/README.md:5` (the README sentence), the two `template.md:3` `Status:` examples, `skills/spec/SKILL.md:218` ("Steps / A ruling"'s new bullet), `plan-terms.md:5` and `docs/glossary.md:10` (the term's example). Nothing else, so the test's literal string no longer stands in the readers.

`git grep -n "A change that contradicts an ADR" -- skills docs README.md`:
```
rc=1
```

`python3 skills/repo-setup/templates/sync_rules.py . --only glossary`:
```
ok: the plan-terms block equals the template
```

`diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md; echo rc=$?`:
```
rc=0
```

`git diff --name-only | xargs env LC_ALL=C grep -n "[^ -~]"`:
```
rc=1 (grep no-match status)
```

`git diff --stat`:
```
 docs/adr/README.md                             |  2 +-
 docs/glossary.md                               |  4 +++-
 skills/ordo-help/SKILL.md                      |  4 ++--
 skills/plan-orchestration/SKILL.md             |  4 ++--
 skills/plan/SKILL.md                           | 10 ++++++++--
 skills/refute/SKILL.md                         |  4 ++++
 skills/repo-setup/templates/CLAUDE.md          |  2 +-
 skills/repo-setup/templates/docs/adr/README.md |  2 +-
 skills/repo-setup/templates/plan-terms.md      |  4 +++-
 skills/spec/SKILL.md                           | 10 +++++++++-
 skills/spec/templates/brief-check.md           |  6 ++++++
 skills/spec/templates/brief.md                 |  3 ++-
 12 files changed, 42 insertions(+), 13 deletions(-)
```

## Scratch case, four modes

Mode `with` (`sh $TMPDIR/s11/scratch.sh <fresh mktemp -d folder> with`, script rc printed after):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
D  .scratch/rulings/7-scratch-entry.md
== Rulings section
## Rulings (2026-09-30)

- G1: the scratch answer one (the user).
- G2: the scratch answer two (the user).

## Blocked, and by what
script rc=0
```

Mode `untracked` (`sh $TMPDIR/s11/scratch.sh <fresh mktemp -d folder> untracked`, script rc printed after):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
== Rulings section
## Rulings (2026-09-30)

- G1: the scratch answer one (the user).
- G2: the scratch answer two (the user).

## Blocked, and by what
script rc=0
```

Mode `modified` (`sh $TMPDIR/s11/scratch.sh <fresh mktemp -d folder> modified`, script rc printed after):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
D  .scratch/rulings/7-scratch-entry.md
== Rulings section
## Rulings (2026-09-30)

- G1: the scratch answer one (the user).
- G2: the scratch answer two (the user).
- G3: the scratch answer three (the user).

## Blocked, and by what
script rc=0
```

Mode `without` (`sh $TMPDIR/s11/scratch.sh <fresh mktemp -d folder> without`, script rc printed after):
```
== Step 1: slug
7-scratch-entry
folder does not exist
== Step 2: draft plan.md from the template, with the rulings copy
== Step 4: orchestrator-state.md
== Step 5: .gitkeep
== Step 6: commit by path
== after
ls: .scratch/rulings/7-scratch-entry.md: No such file or directory
Open plan 7

A  .scratch/7-scratch-entry/agents/briefs/.gitkeep
A  .scratch/7-scratch-entry/agents/reviews/.gitkeep
A  .scratch/7-scratch-entry/orchestrator-state.md
A  .scratch/7-scratch-entry/plan.md
== Rulings section
## Rulings (2026-09-30)

- Open item <L> (<date>): <the user's decision in one line, and what it unblocks> (the user).

## Blocked, and by what
script rc=0
```

In the `modified` mode the script runs under `set -e`, so `git rm -q -f -- <path>` exiting 0 is what lets the commit line run; the commit lists `D .scratch/rulings/7-scratch-entry.md`, `ls` of the file fails, and the Rulings section holds G1, G2 and G3.

## Verify list, run from the worktree root

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`
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
```

## Readings over the new text

1. A cathedra-style record, `$TMPDIR/s11/adr-scratch/docs/adr/0010-old-dispatch.md`, whose first lines are `# 0010 Old dispatch`, a blank line and `> **Superseded by ADR 0033**`, with no Status line. Read: `skills/spec/SKILL.md:50` and `:241`, `skills/refute/SKILL.md:40`, `skills/plan/SKILL.md:40` and `skills/spec/templates/brief-check.md:43` ("whose status, or whose opening lines, do not say it is superseded by another record") against the record. Its opening lines say it is superseded by ADR 0033, so the record fails the test at all five places and no reader counts it, and the term **ADR** (`plan-terms.md:5`, "in whatever form the repository writes it, such as ... a quoted line `Superseded by ADR NNNN`") agrees. A record with no Status line and no such line stays in force, as before. Holds for all readers.
2. `Ruled: new ADR supersedes 0001`, then `/spec` again. Read: `skills/spec/SKILL.md` "Steps / A ruling" item 2, the new bullet at line 218, then item 3 ("Then `/spec <entry> <step>` is typed again"), then "What it reads" 5 (line 50) and Steps 2 (lines 85-86), on the scratch ADR `0001-the-ledger-is-ascii.md` (status `proposed`). The bullet has the session, before `/spec` runs again, write `0002` from the folder's `template.md` with the ruled decision and status `proposed`, set 0001's status to `superseded by 0002`, and add 0002's row to `README.md`, all three going into the next preparation commit. On the next run line 50 finds 0001 with status `superseded by 0002`, so it fails the status test and is not read; 0002 is read, and step A's arrow is judged against 0002's Decision, which the ruling made. So `/spec` no longer stops on 0001. Holds. The ruling's decision (what 0002 says) comes from the user's ruling text, and the bullet does not choose it.
3. The term **rule clash** (`plan-terms.md`, synced in `docs/glossary.md`) against each place its "Stated in" names: `plan-orchestration` "Stops" (the row "A rule clash", "rules or decisions, an ADR among them"); `repo-setup` `templates/shared-rules.md` "Surface rule clashes"; `spec` Steps 2 (`skills/spec/SKILL.md:86`, "is a rule clash, a stop"); `spec` "Steps / The brief check" (`:250`, the stop "A rule clash with an ADR", as Steps 2 says, and its sentence that a clash in the brief's wording is closed by a change to the brief); `spec` Stops (row at `:264`, "A rule clash with an ADR"); `refute` "Finding dispositions" (`refute:144`, "is a rule clash"). Each states the term in the glossary's sense, a contradiction between rules or decisions that stops for the user's ruling, or, at spec:250, the route by which one found in the brief's wording is not the stop. `refute` "The four headings" is no longer named, since refute:98 is a finding and not a statement of the term.
