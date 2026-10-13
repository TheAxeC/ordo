# Step 7 brief check (on main at fa58a09)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/7.md`.

## 1. Names
Findings:
- The step changes no file name, no heading and no key. It rewrites these sentences: `SKILL.md` lines 133 and 134 (kind 3), line 166 (kind 2), and in effect line 143 (kind 4; see section 3). It adds sentences to `references/rules.md`, "Hedging", "Terms defined at first use" and "Explanation of evidence", and adds one bullet to the prompt. `grep -rn --exclude-dir=.scratch --exclude-dir=.git --exclude-dir=.agents -F "<sentence>" .` for each changed sentence ("A passage that breaks two rules", "A word that sets a claim", "Such rules include section A", "bracket that names the number", "brings in a technical term", "A hedge of the strength") prints only `skills/writing/SKILL.md:133`, `:134`, `:143`, `:166`, `skills/writing/references/rules.md:13` and `:54`. All of these are inside the brief's paths. "last pass" hits only `skills/plan-orchestration/SKILL.md:43` and `:310`, where it means the recurring-findings pass, a different use that the change does not make false.
- Outside the paths, the sentences that describe `/writing` as a whole are `README.md:26`, `docs/adr/0003-...md:7` and `:11`, `docs/roadmap.md:24`, and `skills/repo-setup/templates/plan-terms.md:41` with its copy `docs/glossary.md:46` (the term **finding**). None of them is made false by the change. Each still holds: "reports the findings", "reports only breaks of a named rule", "with its place, the quoted passage and a proposed replacement".
- Ledger records quote the sentences as they read at rc.3: `.scratch/3-the-writing-base/agents/reviews/5-refuter.md`, `5-report.md`, `5-brief-check.md`, `3-brief-check.md`, `3-report.md` and `agents/briefs/3.md`, found by `grep -rn -l -F -e 'gets one replacement that ends both' ... .scratch .agents`. They are records of earlier steps, and the change does not make them false.
- Term: the brief uses "kind" for the numbered items of "What to build" ("covered by kind 1", and Verify 4's "serves a kind of 'What to build'"). In `docs/glossary.md`, **kind** is "a sentence that states a defect in general terms ... under which `/plan-retro` groups findings". The use is in the brief, not in skill text. The builder's report, however, must list the glossary terms it uses, so this is a second sense for the builder to keep apart.

## 2. The step line
Findings: each part of step 7's line in `plan.md` is mapped to the requirement that serves it.
- "each row of step 6 not marked right by both markers (`agents/reviews/6-marks.md`) ... fixed in `skills/writing/SKILL.md` or `skills/writing/references/`": kinds 1 to 7. Each of the 20 manuscript rows and 13 grant rows of `6-marks.md`, "Rows not marked right by both", is named under one kind: 13 + 5 rows (kind 1), 8 (kind 2), 2 (kind 3), 1 more (kind 4; Evidence 2 is shared with kind 3), 2 (kind 5), 1 (kind 6) and 1 (kind 7), 33 in all.
- "each failure of a gate condition on the runs that step 6's report `agents/reviews/6-report.md` names": conditions 1 and 5 are under kind 2, and condition 2's five group lines under kind 1. The bare file names of condition 1 are covered by kind 1's check of places.
- "where the text already holds the rule the agent broke, the fix is a last pass in the review agent's prompt that checks each finding against the finding rules before the agent hands back and rewrites the ones that break them": kind 1. The kind adds "A finding the pass cannot make meet the rules is left out of the report", which the line does not ask for, since the line says the pass "rewrites the ones that break them". See section 5.
- "the markers' use of `grep` under condition 6 concerns no text of `/writing` and step 8's Step 0 carries it": "What is on the tree", 5th bullet. `plan.md`, "Step 8, the fourth runs: Step 0", holds it (its first bullet).
- "after the landing, main's head tagged `v7.1.0-rc.4` and pinned with `sh utils/pin.sh v7.1.0-rc.4`": the paragraph after kind 7 gives it to the orchestrator.
- "check: the refuter reads each fix against the row or failure it closes and the skill against `docs/dev/skill-layout.md`, and `checks.sh` ... passes": the refuter's part needs no requirement. `checks.sh` runs at landing (Verify 1, its second sub-bullet).
- The brief lists `skills/writing/references/registers.md` under "Paths this step writes" ("where a fix belongs there"), but no kind writes it. That is not a defect. It does mean that no part of "What to build" uses that path.

## 3. Premises
Findings: the commands rerun.
- `wc -l` prints 204 `skills/writing/SKILL.md`, 219 `references/rules.md`, 53 `references/registers.md` and 159 `templates/docx_paragraphs.py`. `grep -n version skills/writing/SKILL.md` prints `5:  version: "1.0.0"`. Both hold.
- `git diff --quiet 178bc42 HEAD -- skills/writing; echo $?` prints `0`. `diff -r skills/writing ~/.claude-backup/skills/writing` prints nothing, with exit 0. `~/.claude-backup/skills/writing` is a symlink to `~/.local/share/ordo-stable/skills/writing`. `git -C ~/.local/share/ordo-stable describe --tags` prints `v7.1.0-rc.3`. All hold.
- `git diff --quiet 178bc42 HEAD -- docs/dev/building.md docs/dev/change-standard.md` exits 0, and `git diff --quiet 1c26ac1 HEAD -- docs/adr` exits 0. Both hold.
- `docs/dev/skill-layout.md`, "Frontmatter", holds the quoted sentence on `metadata.version`. `git log --diff-filter=A -- skills/writing/SKILL.md` prints `b9f9831 Land step 1 of plan 3, the writing base and /writing`, so the premise that this plan made the skill at 1.0.0 holds.
- `6-marks.md:284` is `## Rows not marked right by both`, with `### The manuscript run (20 rows)` at 286 and `### The grant run (13 rows)` at 349. This holds.
- The quoted `SKILL.md` lines 122, 126, 133, 137, 148, 156, 161, 164, 166 and 169 to 174 each say what the brief says (`cat -n skills/writing/SKILL.md`).
- `grant-report.md`, group 11: its heading stands at line 151 and its findings at lines 154 to 178. The seven "as in" findings and their targets are 11.1 (5.1), 11.2 (5.2), 11.3 (5.3), 11.4 (5.5), 11.5 (1.3), 11.7 (1.6) and 11.10 (4.1). This holds, and so do decision 2's four grant examples. `manuscript-report.md:229` reads as quoted, and the places of item 2 stand at lines 224 and 225. This holds.
- Wrong: "Manuscript section A 4 and Evidence 2 (`6-run/manuscript-report.md` lines 80 and 158)". Line 80 is in the "Evidence for claims" group (heading at line 71), and is Evidence 2's replacement. Line 158 is in the section A vague-qualifiers group (heading at line 142), and is section A 4's replacement. The line numbers are given in the reverse order of the names.
- Wrong: "No sentence of `SKILL.md` says what the bracket names." `SKILL.md:143` reads "Where the draft gives neither, it is a bracket that names the number or the claim as a fact for the author." That sentence names what the bracket holds, and its "or the claim" is what let the agent offer an alternative. Under "What to build"'s rule that the fix "replaces that sentence rather than adding a second one beside it", kind 4 should name line 143 as the sentence it rewrites. It does not.
- Wrong in substance: kind 3 describes Evidence 2 as "an 'Evidence for claims' finding that cut 'usually'" and Voice 3 as "a 'Voice' finding that cut 'several'". Both findings also name section A. `manuscript-report.md` has, under Evidence 2, "Also: prose standard section A ("usually")", and under Voice 3 (line 284 area, discussion.tex:16), "Also: prose standard section A ("several")". Kind 3's new rule keeps a vague qualifier only when the finding's "named rule is not section A's vague qualifiers". Both findings name section A, so the rule does not reach either of them. The defects the markers name are different:
  - Evidence 2: marker 2 says it "offers the clinical guideline as an alternative, with which the claim reads as universal". That is kind 4.
  - Voice 3: both markers say it "is cut with no number, specific claim or bracket". That breaks `SKILL.md` lines 143 and 144, which the text already holds, so under the step line it is a kind 1 row.
- Kind 5 says "a passage whose device already has the strength the evidence carries is not reported". `references/rules.md:54` already reads "A hedge of the strength the evidence carries on an interpretation is not reported." Hedging 5's passage ("indicating that concatenating ... dilutes the T2 signal") is an interpretation, so it breaks an existing rule. The brief neither names line 54 nor says that line is rewritten.
- Kind 6: `references/rules.md:13` reads "A replacement brings in a technical term when its passage does not hold the term and the draft defines it somewhere." By that sentence's own definition, a term the draft never defines is not "brought in". That is the sentence that let Terms 2 through. Kind 6 neither names it nor says it is rewritten, so a second sentence would stand beside it.
- `plan-terms.md:41` holds the quoted sense of **finding** (`sed -n 41p`). The ADR quotes of 0001, 0002 and 0003 match their Decision sections. All hold.
- `6-report.md`, "The gate conditions", condition 2, names the five failing lines as manuscript 13 ("Formality"), 14 (section C), 16 (section D, paragraphs) and 17 (section A filler), and grant 10 (section E, "Passive voice"). This matches kind 1.
- Decision 1's five examples each match their row's reasons in `6-marks.md`. The 28 words of section E 2's third sentence were recounted on `manuscript-report.md` at that finding, and the count holds.

## 4. Cases and checks
Findings:
- C1 against the brief's own kind 1. Kind 1 says the pass reads "against 'A finding' and 'How you group them'" and "names what the pass checks by the part of 'A finding' that holds each rule". Two of its checks have no part of "A finding" to point at:
  - Check 3, "the named rule's own words describe the break, and a word the prose standard's section A keeps is not reported", is `SKILL.md` lines 106 and 107, under "What you report".
  - Check 7, "each technical term the replacement brings in is defined at or before the passage", is `references/rules.md`, "Terms defined at first use".

  C1 expects "the existing sentence of 'A finding' or 'How you group them' each breaks". That cannot be given for grant 1.1, 12.19 (line 106) or filler 4 (line 107).
- C1 and the list of checks. Several kind 1 rows break sentences of "A finding" that none of the eight listed checks names:
  - Limitations 4 ("which suggests the value" now attaches to the ECE rise) breaks line 135, "It adds no claim or relation that the draft does not make".
  - Limitations 1 and Most specific term 1 (averages of relative changes used as rises of the average AUPRC) break line 138, "A number it gives stands in the draft as the replacement uses it". Check 4 names only line 137's "holds against every number".
  - Voice 3, by its markers' reasons, breaks lines 143 and 144.

  For those rows C1's expected "check of the last pass that names that sentence's part" does not exist.
- C3 is inconsistent with the rows. As section 3 shows, both Evidence 2 and Voice 3 name section A, so the new sentence's exemption covers them, and "the scope-word sentence each cut breaks" does not follow.
- Kind 3 against change-standard rule 17 ("A rewrite keeps the meaning of every rule it carries") and rule 19 ("A change leaves no two statements that contradict each other"). `SKILL.md:134` now names, as rules that replace a scope word, "section A's vague qualifiers and the table rows of the rules page, such as "many studies"". Kind 3 rewrites line 134 so that a qualifier is kept by "every replacement whose named rule is not section A's vague qualifiers", which drops the table-rows exception. A `references/rules.md`, "Vague language" finding on "many studies" ("many" is a section A qualifier) would then be told to keep "many". That contradicts that section's table, and likewise "Wordiness", "a large number of". This change of meaning is not asked for.
- Kind 4 against C8 and the prose standard's section A. The prose standard's section A says vague qualifiers "are replaced with the number or the specific claim". Kind 4 makes the bracket name only "the number or the share of cases the claim holds in". C8 row "section A vague qualifiers 2", right by both, has "remains a challenge [the specific obstacle, as \citep{jin2021predicting} reports it]" (`manuscript-report.md`, section A group, item 2). That is a specific claim and not a share, and kind 4's wording would rule it out. Kind 4 is aimed at frequency qualifiers ("often", "usually"), but its words cover every qualifier.
- Kind 2's list-entry sentence overlaps `SKILL.md:162`, "A finding on a term used under several names gives each place with its passage and replacement". It also overlaps line 117 on lists of places. `docs/dev/skill-layout.md`, "Lists and tables", says a qualifier that changes the rule stays in the rule's bullet, and "Where a rule goes" says a rule is written once. The brief does not say whether the new sentence rewrites line 162 or is added beside it.
- Kind 5 and kind 6 add sentences beside `rules.md:54` and `rules.md:13` respectively, against "What to build"'s "replaces that sentence rather than adding a second one beside it" (see section 3).
- Cases that ask the builder to check or quote a place the step does not change:
  - C1 asks for the existing sentences of "A finding", "How you group them", "What you report" and `rules.md`, "Terms defined at first use". This is by design of kind 1.
  - C6 asks for grant 1.1's "existing one", `rules.md:14`.
  - C8 asks the builder to read the 22 right-by-both findings in the reports, which are records.

  None of these asks for an edit there.
- C8 rows checked in `6-marks.md` (awk over the run tables): manuscript Limitations 2 and 3, Hedging 1, 3 and 4, section A vague qualifiers 1, 2 and 3, Terms 1, "No synonym cycling" 1.1, Clear antecedents 2, section D paragraphs 1 and 3, and filler 2 and 3 are each `right | right`. Grant 5.1, 5.2, 11.6, 11.8, 11.9, 12.1 and 14.3 are each `right | right`. All hold.
- Every case is a text case checked by reading. That fits the change standard's "Scripts compute facts; judgment is read", rule 1 (text defects are fixed by reading, with no test) and rule 22.

## 5. The question
Findings:
- The check on the step's line (the refuter reads each fix against its row, the skill against the layout, and `checks.sh` passes): yes, it could pass without the goal. Reading a fix shows that the text addresses the row, not that the review agent then reports right findings. Step 8's rerun is what tests that, as the plan says of step 3.
- Kind 1: yes. The bullet can be written exactly as specified and still leave lines 135, 138 and 143 to 147 without a named check, so Limitations 1 and 4, Most specific term 1 and Voice 3 can recur. Separately, "A finding the pass cannot make meet the rules is left out of the report" lets step 8's marks come out all right by dropping findings the agent could not phrase. That reaches "every finding marked right" while losing breaks the draft holds. It also sits against `SKILL.md:176`, "It covers the whole draft".
- Kind 2: mostly no; the new line 166 and the list-entry rule end the "as in N" form. A partial yes: the earlier finding of a pair still writes "The same sentence also falls under group 11" (grant 5.1, 5.3 and 4.1), a reference by group number that kind 2 does not address. It is minor, since no marker marked it.
- Kind 3: yes. Its exemption covers both rows it is meant to close (section 3), so Voice 3's cut can recur unchanged.
- Kind 4: yes, while line 143's "or the claim" stands beside the new sentence, since the agent can still read "the claim" as licence for an "or" alternative. Its wording can also turn a right row (vague qualifiers 2) wrong.
- Kind 5: no for Hedging 2 and 5, which the new sentences address. Its second half duplicates line 54.
- Kind 6: a partial yes. If line 13's definition of "brings in" stays, the agent can still read a never-defined term as not "brought in".
- Kind 7: no; the sentence addresses 7.1's cause directly.
- C1 to C8: C3 cannot reach its stated result (section 4). C1 cannot name a check for the rows listed in section 4. C2, C4, C5, C6, C7 and C8 could each pass by reading alone, as every text case can, and step 8 is the test.

## 6. Implied inputs
Findings: none. This is a text step: it changes only the prose of `skills/writing/SKILL.md` and `references/rules.md` (and possibly `references/registers.md`), plus the ledger report. It adds no script and no command, and no supplied value reaches a command, a path or generated text. The new pass "changes no file and runs no command".

## 7. ADRs
Findings:
- I read every `docs/adr/NNNN-*.md`, 0001 to 0012. Each has `Status: proposed`, and none is superseded.
- ADR 0001, under "`skills/writing/` holds no copy of it.": the brief holds to it (no rule of the prose standard is copied, and a fix names the section).
- ADR 0002, under "No rule that contradicts the prose standard is carried.": kind 4's bracket limited to "the number or the share of cases" narrows the prose standard's section A, "replaced with the number or the specific claim", for qualifiers whose specific replacement is a claim. The case is section A vague qualifiers 2 (section 4). The brief names ADR 0002 but does not check kind 4 against it.
- ADR 0003, under "`/writing` starts one fresh agent that changes nothing ... and reports only breaks of a named rule.": the pass is the same agent's and changes no file, which holds.
- ADRs 0004 to 0012 govern no file, name or behaviour this step changes. The orchestrator's tag and pin and the landing commit fall under 0010 and 0012, and those are not the builder's work. The brief's "What is on the tree" names every ADR the step touches.

## 8. Dictated text
Findings:
- `grep -n 'Everything in the brief is done' .scratch/3-the-writing-base/agents/briefs/7.md` prints `139:- The first line: anything NOT done, or "Everything in the brief is done".`. These are words for the first line of `7-report.md`. Holds: ASCII, plain, and no rule of the prose standard or `docs/dev/skill-layout.md` is broken.
- `grep -n 'This passage also breaks' .scratch/3-the-writing-base/agents/briefs/7.md` prints line 88, with the quoted sentence "This passage also breaks the prose standard's section A.". It is the brief's example of the review agent's output under decision 2, not text for a file of the step. Read against the rules anyway, it holds: one plain sentence, the rule named by page and section as kind 2 asks.
- The other quoted strings ("How you group them", "A draft with no break", "as in finding N", the `SKILL.md` and report quotes) quote existing text and dictate nothing new. `LC_ALL=C grep -n '[^ -~]'` over the brief prints nothing (exit 1).

Also, the counts, row names and claims checked against the records:
- The 33 rows (20 and 13) and their assignment to kinds hold, every row covered once except Evidence 2, which is named under kinds 3 and 4.
- The brief's short names "section A 4" and "section A 5" leave out "vague qualifiers", the part of the `6-marks.md` group name that tells them apart from "section A, filler and flagged terms". The brief says rows are "named as `6-marks.md` names them". The reader can resolve these only because filler rows are called "filler".
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` (exit 0) on main. `grep -n -E '[^[:space:]] - | -- '` over the three skill files prints nothing (exit 1). Both match the brief's Verify 2 and 3 on the unchanged tree.

## Declined to judge
- Whether the last pass's dropping of a finding it cannot fix is wanted (section 5). The gate counts reported findings only, so this is a design choice for the orchestrator or the user, not a fact this check can settle.
- Whether "indicating" counts as the table's moderate device "indicates" for kind 5. That is a reading of `rules.md`, "Hedging", left to the refuter.

Agent usage: a50f0c31ddca5b769, claude-opus-5-5, 175635 tokens, 39 tool uses, 6.8 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- Names, the term "kind": the brief calls its numbered items "fixes" throughout, and "What is on the tree" says why.
- The step line, the pass dropping findings: fix 1 now says the pass rewrites each finding that breaks a rule until it meets the rules and drops no finding, since the report covers the whole draft. The unused path `references/registers.md` stays listed, as "What to build" allows a fix there.
- Premises, the reversed line numbers: section A vague qualifiers 4 is at line 158 and Evidence 2 at line 80, as "What is on the tree" now says.
- Premises, line 143: "What is on the tree" quotes it, and fix 3 rewrites it in place of adding a sentence beside it.
- Premises, the old kind 3: Evidence 2 and Voice 3 both name section A, so the scope-word fix is dropped. Voice 3 is under fix 1 (it breaks lines 143 and 144, which the pass now checks), and Evidence 2 under fix 3.
- Premises, line 54: fix 4 rewrites line 54 for the same-strength case and adds only the sentence on one strength across places.
- Premises, line 13: "What is on the tree" quotes it, and fix 5 rewrites lines 13 and 14 in place of adding a sentence beside them.
- Cases, C1's checks outside "A finding": fix 1's pass reads against "What you report", "A finding", "How you group them" and the section each finding names. Its checks now name line 135 (no added claim or relation), line 138 (a number stands as the replacement uses it) and lines 143 to 147 (the replacement of a vague qualifier), and the term check names `references/rules.md`, "Terms defined at first use".
- Cases, C3 against the rows: dropped with the old kind 3. C3 is now fix 3's case, with section A vague qualifiers 2 as a finding that stays allowed.
- Cases and ADR 0002, the bracket narrowing section A: fix 3's bracket names the number, the share of cases or the specific claim, so a specific-claim bracket such as vague qualifiers 2's stays allowed and the prose standard's "the number or the specific claim" holds.
- Cases, the overlap with line 162: fix 2 rewrites line 162 to cover every list of places, in place of adding a sentence beside it.
- Cases, fixes 4 and 5 adding sentences beside lines 54 and 13: closed by the rewrites above.
- The question, the reference by group number ("The same sentence also falls under group 11"): fix 2 says each finding names the other rule by page and section, never by a finding's or a group's number.
- Counts, the short names "section A 4" and "section A 5": the brief now writes "section A vague qualifiers 4" and "5".
- Dictated lines added after the check: none. The bracket "[the specific obstacle, as <citation> reports it]" in fix 3 is an example of a form the rule allows, not text for a file.
