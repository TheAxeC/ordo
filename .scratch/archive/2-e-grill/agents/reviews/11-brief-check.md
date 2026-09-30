# Step 11 brief check (on main at 6c51194)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/11.md`. A page this report cites is named with its section. A line of code or a grep hit keeps its `file:line`. The brief is read as it is on disk, uncommitted (`git status --short` printed `?? .scratch/2-e-grill/agents/briefs/11.md`).

## 1. Names

- **ADR** (the term), grepped with `git grep -n -i "adr" -- skills docs README.md agents utils`. Hits outside the brief's paths, and what the change does to each:
  - `README.md:13` and `README.md:97` ("an ADR folder"). Not made false.
  - `docs/dev/change-standard.md:31`, rule 5 ("the ADR that owns the decision"). Not made false.
  - `skills/repo-setup/templates/docs/dev/change-standard.md:8`: "The standards the brief lists, in full: <the standards pages, linked>, and the ADRs the brief names." This is the builder's reading rule in every repository `repo-setup` creates. The change does not make it false. It does leave the `spec` skill's `templates/brief.md:3` ("Then, in full: <the standards the configuration lists>") and `plan-orchestration`'s "The prompt" reading order (the rules file, the brief, the standards) with no place that names the ADRs to read in full. Item 2 puts them under "What is on the tree" only. This is finding N1.
  - `skills/repo-setup/templates/CLAUDE.md:22` ("A change that contradicts an ADR is a rule clash."). Consistent with the change.
  - `docs/adr/README.md:5` and its template copy ("it stops and is ruled on"). Consistent with items 2, 5 and 8.
  - `skills/plan/templates/orchestrator-state.md:23` and `skills/plan/templates/plan.yaml:23` ("/plan, /spec and /refute read them"). This becomes true with the change.
  - `skills/ordo-init/templates/check_config.py:115` and its test ("repo-setup or grill creates it"). Not affected.
  - `skills/repo-setup/templates/docs/dev/design-principles.md:11` ("An exception is an ADR the user rules on"). Not affected.
  - `skills/roadmap/SKILL.md:148`. Not affected.
  - The ADR folder's name form: `docs/adr/README.md:7` says `NNNN-<decision-as-a-phrase>.md`, and item 14's term says `NNNN-<decision>.md`. This is a small difference in the name form (finding N5).
- **ADR status `accepted`** (Decision 2 of the brief), grepped with `grep -n -i "proposed\|accepted" .scratch/2-e-grill/plan.md docs/roadmap.md` and `git grep -n -i accepted -- skills`:
  - `.scratch/2-e-grill/plan.md:82`, ruling G: "the ADR is written as PROPOSED in the same turn".
  - `.scratch/2-e-grill/plan.md:44`, step 12: "the PROPOSED ADR on Axel's yes".
  - `skills/repo-setup/templates/docs/adr/template.md:3`: `Status: <proposed | accepted | superseded by NNNN>`.
  - No text in the tree or the plan says who or what changes a record from `proposed` to `accepted`. Under items 1, 3, 6 and 14, only `accepted` records bind. Every ADR `grill` writes would therefore be skipped by the readers this step builds, until something no step names accepts it (finding N2).
- **rulings file** and `rulings/<slug>`, grepped with `git grep -n -i "rulings file\|rulings/\|<entry slug>" -- skills docs README.md agents utils`: rc=1, no hit.
  - The existing term **ruling** (`docs/glossary.md:76`) is "the user's decision on an open item". The new term calls the file's lines "settled design answers", which does not conflict with it.
  - What the file's lines look like is defined nowhere. Step 12 writes the file, and item 10 copies "each line ... as it stands". See finding C5.
- **Row "A rule clash with an ADR"**, and the term **rule clash**, grepped with `git grep -n -i -E "rule clash|clash" -- skills docs README.md agents utils`:
  - `skills/plan-orchestration/SKILL.md:285`: `| A rule clash | A contradiction between two established rules | The stop message, below | The user's ruling |`. The orchestrator maps a `/spec` stop to this table (`plan-orchestration` Steps 3: "A stop it raises goes to the user by 'Stops'"). The row's When names only "two established rules", while an ADR is a decision; the glossary says "rules or decisions". The change does not make the row false, but the row does not plainly cover the new stop (finding N4).
  - `skills/repo-setup/templates/shared-rules.md:9` and `:20`. Consistent with the change.
- **The `/spec` stops and the repair loop in the sequence**, grepped with `git grep -n -i -E "six checks|...|first four rows|four rows|five rows|brief-check|brief check" -- ...`:
  - `skills/ordo-help/SKILL.md:67`: "/spec stops ... a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choice is yours, or the brief-check agent was served a model other than the configured one ...". This line lists `/spec`'s stops, and after item 5 it leaves one out. It is made false by omission (finding N3).
  - `skills/ordo-help/SKILL.md:60`: "close them: a repair round: the session fixes the findings". Under item 8, a rule-clash finding is never fixed in a round. The sentence becomes partly false. This can be absorbed in the same `ordo-help` edit as N3.
  - `skills/land/SKILL.md:118`: "What is wrong in them is fixed at landing when it is small and inside the brief". Under item 8's wording, a small ADR contradiction the builder made inside the brief is never fixed at landing. The two texts contradict each other for that input (see finding C1).
- **"The first five rows are stops"**: the only other hit is `skills/roadmap/SKILL.md:141`, which is about `roadmap`'s own table. Not affected.
- **The check "ADRs" and the section "## 7. ADRs"**: no hit outside `skills/spec`.
  - Nothing counts the brief check's checks. The skill says "one heading per check of item 2".
  - `plan-orchestration` Steps 3 reads only the report's "Closed" heading.
  - `plan-retro` reads refuter reports only.
  - `docs/roadmap.md:222` cites "1. Names" in a done entry. Not affected.
- **The numbering of `plan`'s "What it reads"**: every citation found cites 1, 2 or 3 (`docs/glossary.md` lines 48, 54, 61, 94, and their template lines). Adding 4 and 5 renumbers nothing.
  - No text says `/plan` reads three things (`git grep -n -i -E "reads three|three (inputs|things)"`: only `skills/spec/SKILL.md:191`, which is about something else).
- **`spec`'s "What it reads" 5**: `docs/glossary.md:58`, the term **premise**, cites it. It stays true.

Findings:
- N1. Neither the `spec` skill's `templates/brief.md:3` nor `plan-orchestration`'s "The prompt" reading order names the ADRs the brief names as reading for the builder. The `repo-setup` change-standard template (`:8`) expects that. A builder told only one Decision sentence under "What is on the tree" does not read the record's Alternatives rejected, and can rebuild a rejected alternative. The fix is outside the brief's paths: widen to `skills/spec/templates/brief.md` (the line-3 read list, "and the ADRs the brief names under 'What is on the tree'"). The `spec` skill is its folder, and the brief template is part of it.
- N2. Only `accepted` records bind, while `grill` writes records as `proposed` (ruling G), and no text names when a record becomes `accepted`. The readers would then skip every record `grill` produces. This is a decision the brief takes (Decision 2) on a rule applied across the tree, and ruling G's status word runs into it.
- N3. `skills/ordo-help/SKILL.md:67` (and `:60`) is made incomplete by items 5 and 8, and is outside the paths. Widen the paths to `skills/ordo-help/SKILL.md` lines 60 and 67, rather than leaving it to step 12, which edits the same file for a different line.
- N4. `skills/plan-orchestration/SKILL.md:285`: the row "A rule clash" reads "two established rules". Widen it to "rules or decisions, an accepted ADR among them", or state in the report why it stands.
- N5. The name form `NNNN-<decision>.md` in item 14 differs from the README's `NNNN-<decision-as-a-phrase>.md`.

## 2. The step line

Step line, from `grep -n "^- 11 " .scratch/2-e-grill/plan.md`: line 43.

- `/spec`'s premise check reads the ADRs the step touches: items 1 and 2.
- The brief check reads them: items 3 and 4.
- `/refute` reads them: items 6 and 7.
- "in the configured `adr` folder": items 1, 3, 6 and 9 (with the default).
- "a contradiction being a rule clash that stops": items 2 and 5 for `/spec`, items 7 and 8 for `/refute`. For the brief check, item 3 names the contradiction as a finding, but no item routes it to a stop (see finding C2).
- `/plan` copies the rulings file into a new plan's Rulings: items 9 and 10.
- "and removes it": item 12.
- "names at its approval stop the design decisions that lack an ADR or a ruling": items 9 (What it reads 5), 11 and 13.
- The check "each change read in place": the reading case under "Cases".
- The check "one scratch case for `/plan`'s copy": the scratch case under "Cases".
- Item 14, the glossary, serves no part of the line. `docs/dev/skill-layout.md`'s "Writing for an agent" requires it.

Findings: none. Every part has an item. The brief-check part of "a contradiction ... stops" is served only in part, and is reported as C2.

## 3. Premises

- Step 11's line: `grep -n "^- 11 " .scratch/2-e-grill/plan.md` printed `43:- 11 The ADR readers (rulings B, C and F): ...`. It matches the quoted text.
- Rulings at lines 76-81: `sed -n 76,81p` printed A, B, C (b), D, E (b), F (a). The quotes of A, B, C and F match, and B's quote is a shortened prefix of the line.
- The ADR folder: `ls docs/adr` printed `README.md` and `template.md`. `diff -r docs/adr skills/repo-setup/templates/docs/adr` printed nothing, rc=0. The README line-5 quote matches. The template's status line and its four sections match. No field names governed files. It matches.
- The configuration block: `.scratch/2-e-grill/orchestrator-state.md:31` and `skills/plan/templates/orchestrator-state.md:23` both read `adr: docs/adr # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.` `/plan` Steps 4 is `skills/plan/SKILL.md:61`. It matches.
- `git grep -n -i "adr" -- skills/spec skills/refute skills/plan/SKILL.md` printed one line, `skills/plan/SKILL.md:61:...`. It matches.
- `skills/spec/SKILL.md`: "What it reads" 5 is line 48 and its sub-bullet line 49. Steps 2 is lines 79-83. Item 2's checks are lines 229-236, with Implied inputs at 235 and "The checks are done" at 236. "The first four rows are stops" is line 252, and the first four rows are lines 256-259. `templates/brief-check.md` runs "## 1. Names" to "## 6. Implied inputs" (line 35). It matches.
- `skills/refute/SKILL.md`: "What it reads" 4 is line 35, with sub-bullets 36-37. **Spec.** is lines 90-98, and the anchor bullet is line 96, verbatim. "Finding dispositions" is the heading at line 137. Line 139 is its first bullet and line 140 the sub-bullet. The brief's "(line 139)" is the bullet, not the heading. That is fine for the anchor.
- `skills/plan/SKILL.md`: "What it reads" is lines 28-38 with three items. Steps 2 is lines 46-56, and the anchor at line 48 is verbatim. Steps 3 is lines 57-59, and the anchor at line 58 is verbatim. Steps 6 is lines 69-70, and the anchor at line 70 is verbatim. The Stops row is line 76, and its "What it shows" cell ends "for the gate and for each step's check". It matches.
- `grep -n ledger_root .agents/plan.yaml` printed `6:ledger_root: .scratch ...`. `ls .scratch/rulings` printed "No such file or directory", rc=1. It matches.
- `grep -n -i "adr\|rulings file" skills/repo-setup/templates/plan-terms.md`: the brief says it "prints nothing". It printed line 18, the term **configuration block** ("... `bench`, `adr`, `design_bar` ..."), rc=0. The claim the brief draws from it (no term for an ADR or the rulings file) still holds, but the command's output differs from the brief.
- The term **rule clash** at `plan-terms.md:69`, with the quoted "Stated in:". It matches.
- `ls skills/grill` printed "No such file or directory". It matches.

Findings:
- P1. The plan-terms premise: the brief says the grep prints nothing, and it prints `18:- **configuration block**: ... \`adr\` ...`. The brief should narrow the pattern (for example `grep -n -i "\*\*adr\|rulings file"`) or quote the one hit.

## 4. Cases and checks

- The case `git grep -n -i "adr" -- skills/spec skills/refute skills/plan/SKILL.md`, expected after the change as "that line and the lines of items 1 to 13". This is wrong as written. Item 10 ("Each line of the rulings file ... copied into the Rulings section"), item 12 ("The rulings file copied at Steps 2 is removed ...") and the first line of item 9 ("4. The rulings file ...") contain no "adr". A builder following the case would either report a mismatch or bend the reading.
- The case `git grep -n "rulings file\|rulings/<slug>" -- skills docs`. Consistent: `plan` "What it reads" 4 and Steps 2 and 6, and the two glossary lines.
- The case `sync_rules.py . --only glossary` printing `ok: ...`. Consistent (the rules file's "Commands and their filters"). The argument order `. --only glossary --write` is accepted: `sync_rules.py:76` reads "in any order".
- The case `git diff --stat` listing six files. Consistent. The report path is untracked in the worktree and does not show in `--stat`.
- The description-length case. Consistent. The command now prints 1022 for spec, 951 for refute and 477 for plan.
- The scratch case for `/plan`'s copy:
  - It runs `git init`, `git commit` and `git rm` in a `mktemp -d` repository. The rules file's "Where the work happens" says "No git command that changes state: no `add`, `commit`, ...", and its opening says nothing in a brief overrides the page. The section's first bullet ties the work to "the git worktree the brief names", and step 10's brief set the same kind of scratch-git run. Read strictly, though, the case asks for what the page forbids. The brief should state that the rule binds the worktree and the main checkout, and that a scratch repository under `$TMPDIR` is outside it (as brief 10 did), or the session should confirm that reading.
  - `/plan`'s "What it reads" 3 reads the verification page `plan.yaml` names (`docs/dev/building.md` in the template), and Steps 4 copies its commands. The scratch setup names only the roadmap, so the builder must add a verification page the case does not name.
  - "`git -C <scratch> show --stat HEAD` lists the file as deleted": `--stat` prints `path | n -` and no "deleted" or "delete mode" line. `--summary` or `--name-status` shows the deletion.
- The reading case with the scratch ADR `0001-the-ledger-is-ascii.md`:
  - The `/spec` and brief-check points are consistent.
  - The `/refute` point ("a diff that adds an arrow to a ledger file is ... raised to the user ..., never sent back to the builder") cannot arise as set up. The scenario's step line itself asks for the arrow, so `/spec` Steps 2 stops and no brief or diff exists. A diff with the arrow can then come only from a supersede ruling, where there is no clash, or from a builder adding the arrow when the brief did not ask for it. For the second, the rules file's rule 4 and `plan-orchestration` Steps 8 make it an ordinary repair ("an item ... whose diff does not do what the brief's fix text says"). The case pins item 8's over-broad wording (C1).

Findings:
- C1. Item 8 ("A finding that is a rule clash with an ADR is raised to the user as an open item, never closed in a repair round or at landing") covers too much. When the brief follows the ADR and the builder broke it, the fix restores an established decision. It changes no decision, so it is a repair under `plan-orchestration` Steps 8 ("Not sent back" names only a finding that changes an established decision). Item 8 as written contradicts `skills/land/SKILL.md:118` and `refute`'s "Over a repair round" 7 ("fixed at landing when it is small and inside the brief") for that input. Ruling C's stop concerns a step that contradicts an ADR. Suggested narrowing: "a rule clash the brief itself asks for (the brief's text contradicts the ADR) is raised to the user ...". A clash the builder introduced against the brief is closed in a repair round or at landing. The `/refute` reading case changes with it.
- C2. A contradiction the brief check finds has no stated route to the stop. Item 3 names it as a finding. The `spec` skill's "Steps / The brief check" 4 closes a finding by a change to the brief unless the fix changes scope or makes a user-visible choice. The new Stops row's When names only "(Steps 2)". A session could "close" a step-text clash by editing the brief to follow the ADR, which is the side-picking that ruling C and the ADR README forbid. Suggested: the row's When reads "(Steps 2, or a finding of 'Steps / The brief check')", or item 3 says a contradiction by the step's text is a stop, as Steps 2 says.
- C3. The expected output of the grep case is wrong for items 9 (first line), 10 and 12.
- C4. The scratch case: the git-in-scratch scope is not stated against "Where the work happens", the verification page is missing from the setup, and `--stat` does not show "deleted".
- C5. Item 10 copies "each line of the rulings file ... as it stands". The file's format is defined by nothing on the tree (step 12 writes it). A heading, a blank line or a title in the file would then enter the Rulings section. The template's Rulings section also holds a placeholder line (`skills/plan/templates/plan.md:31`, `- Open item <L> (<date>): ...`), and the item does not say whether the copied lines replace it. Suggested: "each bullet line (`- ...`)", replacing the template's placeholder line.

## 5. The question

"The goal" for this step is the part of the plan's goal and of rulings B, C and F it delivers: settled answers reaching the plan's Rulings, and the ADRs binding `/spec`, the brief check and `/refute`.

- The step line's check ("each change read in place, and one scratch case"): yes, it could pass without the goal. The texts can read correctly while the readers bind nothing `grill` writes, because of the `proposed`/`accepted` gap in N2. The reading checks the text, not whether any record will ever qualify.
- The grep case on "adr": yes. It shows words present, not behaviour, and it is also mis-specified (C3).
- The rulings-file grep: yes, for the same reason. It is an audit, and the reading case carries the meaning.
- `sync_rules.py` ok: yes. It proves the two glossary copies are equal, not that the terms are right. The reading case covers the terms.
- `git diff --stat`: yes. It is a scope fact only.
- Description lengths: yes. It is unaffected by the step and proves nothing about it.
- The scratch case: in part. It shows copy and removal as the builder performs them. The builder knows the intent and can pass while the text stays ambiguous for a session that does not. Two examples:
  - Steps 6's first bullet lists what is committed ("`plan.md`, `orchestrator-state.md` and the two `.gitkeep` files by path"). A session committing with `git commit -- <those paths>` commits only those paths and leaves the staged `git rm` of the rulings file uncommitted. A builder who runs `git add` then `git commit` passes the case anyway. Suggested: name the rulings file's path in Steps 6's list of what the commit holds.
  - The case's rulings file holds only two bullet lines, so it does not exercise C5.
- The reading case: in part. The `/spec` and brief-check points could not pass with the gap in C2 visible, but the case does not probe a clash found only by the brief check. The `/refute` point pins C1's over-broad behaviour.
- Items 1 to 14, each "read in place": no for each, provided the reading is done against the case. The exceptions are N2 and C1/C2 above.

Judgments the caller asked for, read as a session applying the texts would read them:
- **Is "touches" decidable by reading?** Mostly. "Its Decision governs a file, a name, a rule or a behaviour the step's text changes" is a judgment made by reading, which is where the rules file puts it. A general Decision (for example "no globals") touches every code step. The text then only makes the brief name it, which is harmless. There are two small differences:
  - `spec` "What it reads" 5 reaches the records through "the index in its `README.md`", while item 3's check reads "every ADR ... in the folder". A record present in the folder but missing from the index is read by one and not the other. Suggested: list the folder's `NNNN-*.md` files in both.
  - `refute` "What it reads" 4 asks for ADRs "whose Decision governs ... the diff changes", but the diff is item 5, read after item 4 in the order Steps 2 fixes.
- **Does `/plan` Steps 2's copy happen before Steps 3 shows the draft?** Yes. Steps 2 drafts `plan.md` and Steps 3 shows it, so the copied lines are in the draft shown.
  - Item 11's two bullets are placed after "Write `plan.md` once the user has approved or corrected it". The instruction to name the undecided decisions in the draft therefore stands after the write it should precede.
  - Nothing says whether the named decisions are written into `plan.md` or only shown. The Stops row in item 13 says only "What it shows".
  - Suggested: put the bullets before the write bullet, and say "shown with the draft, not written into `plan.md`" (or the opposite).
- **Is removing the rulings file at Steps 6 right when the user corrects the draft?** Yes. Once the plan opens, the lines live in `plan.md`'s Rulings as corrected, and ruling B says "copies ... and removes it". A ruling the user strikes is his correction. Git keeps the file's history.
  - A corner case: a run that writes `plan.md` at Steps 3 and ends before Steps 6 leaves the file behind. `/plan` run again then stops at "The plan exists", and the rulings file lingers with no reader. This is low risk. A sentence at the "plan exists" stop could name it.
- **Does naming `/grill` before step 12 writes it lead a session wrong?** Only in the repository text between the two landings. The installed skills are pinned, with no pin before the closing (ruling "Overnight work" 3). The overnight `/plan` drafts of 2.F, 2.G and 2.H run from the pinned copy. `grill` is already named in shipped templates before it exists (`skills/plan/templates/plan.yaml:23-25`, `check_config.py:115`). So no session is misled in practice.
  - `docs/dev/skill-layout.md` ("Sections, in order", row 3) puts a neighbouring skill for a situation in "Use instead". A row such as "Design decisions of the entry are not settled | `/grill <entry>`" is the layout's place for it. The brief names `/grill` only inside Steps 3. Step 12 could add the row, but the step line of 12 names only `ordo-help`'s sequence.

Findings:
- Q1. The step line's check could pass while the readers never bind a `grill`-written record (N2).
- Q2. The scratch case passes under either reading of "commit by path". Steps 6's list of what the commit holds should name the rulings file.
- Q3. Item 11's bullets are placed after the write bullet, and nothing says whether the decisions are written into `plan.md`.

## 6. Implied inputs

- Not a code step. Every item changes skill text, and the one script run (`sync_rules.py`) is not changed. The inputs a session meets when it applies the new text are covered above: C5 (the file's format and the template's placeholder line), the stale file after a partial run (section 5), and the folder-versus-index difference (section 5).

Findings: none.

## Declined to judge

- Whether only `accepted` records should bind, or `proposed` ones as well, or who accepts a record. This is a rule applied across the tree, and ruling G's status word runs into it. It is the user's call, or the orchestrator's under "Overnight work" 5. This report states only the gap (N2).
- Whether the ADR reading belongs as a sub-bullet of `spec` "What it reads" 5 (the tree) or as its own numbered item, as `plan` gets. `docs/dev/skill-layout.md` says "one input per item". The ADRs are on the tree, so either reading is defensible. Not judged.
- The check "ADRs" (item 3) does not apply to this step's own brief check, which runs on the pre-change skill with six checks. For the record, `docs/adr` holds no records, so no ADR touches step 11.
- Whether rulings E's "a refinement edits the ADR" should be a third option at the Steps 2 stop. A contradiction is by definition a change, not a refinement, so the two options stand as far as a read can tell. Not judged further.

Agent usage (completion notice): claude-opus-5-5 (from its transcript), 172226 tokens, 33 tool uses, 387 s.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- N1: items 15 and 16 added: `spec`'s `templates/brief.md:3` names the ADRs the brief names as reading in full, and `plan-orchestration`'s "The prompt" adds them to the reading order; paths widened.
- N2: Decision 2 rewritten: a record binds while `proposed` or `accepted` and stops at `superseded by NNNN`; every item that said `accepted` changed to match; premise added; booked as ruling "Step 11, which ADRs bind", decided by the orchestrator overnight.
- N3: item 17 added: `ordo-help:60` and `:67`; paths widened.
- N4: item 16's second bullet: `plan-orchestration:285` reads "rules or decisions, an ADR among them".
- N5: item 14's term uses `NNNN-<decision-as-a-phrase>.md`.
- P1: the premise's grep narrowed to `\*\*adr\|rulings file`, and the broader grep's one hit quoted.
- C1: item 8 narrowed: a contradiction the brief asked for is raised to the user; one the builder made against the brief is repaired; item 7 says whether the brief asked for it; item 17's `ordo-help:60` text and the reading case follow; Decision 3 rewritten.
- C2: item 3 gains a bullet in "Steps / The brief check" 4: a contradiction in the step's text is the stop, one in the brief's wording is closed by a change to the brief; item 5's row names both routes; Decision 5 added.
- C3: the grep case now lists the items whose lines name an ADR and names the three that do not.
- C4: the scratch case states that the no-git rule binds the worktree and the main checkout, adds the verification page to the setup, and uses `--name-status`.
- C5: item 10 copies bullet lines only, in place of the template's placeholder line; the scratch rulings file gains a heading and a blank line to exercise it.
- Q1: closed with N2.
- Q2: item 12 names the rulings file's path in the commit with the others.
- Q3: item 11 moved before the write bullet and says the list is shown, not written into `plan.md`.
- Section 5, folder against index: items 1, 3, 4, 6 and 9 read the folder's `NNNN-*.md` files; premise added.
- Section 5, `refute`'s reading order: item 6 moved under "What it reads" 5, after the diff.
- Section 5, a rulings file left by a partial run: item 13 names it at the Stops row "The plan exists".
- Section 5, a "Use instead" row for `/grill`: left to step 12, which writes the skill it points at (Decision 6); the step 12 brief carries it.
