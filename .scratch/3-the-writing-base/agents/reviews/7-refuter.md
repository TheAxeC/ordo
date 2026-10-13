# Step 7 refuter report (on .agents/worktrees/3-the-writing-base-7, base c99b4a6)

## Verification (rerun by the reviewer)
```
$ git status --short
 M skills/writing/SKILL.md
 M skills/writing/references/rules.md
?? .scratch/3-the-writing-base/agents/briefs/7-cases.md
?? .scratch/3-the-writing-base/agents/reviews/7-report.md

$ git diff c99b4a6 --stat
 skills/writing/SKILL.md            | 29 ++++++++++++++++++++++++++---
 skills/writing/references/rules.md | 12 ++++++++----
 2 files changed, 34 insertions(+), 7 deletions(-)

# Verify 1
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/7-report.md | xargs -0 sh -c '...as in the brief...' sh | xargs -0 perl -CSD -ne '...as in the brief...'; echo "charset exit $?"
charset exit 0
(the command was run exactly as the brief's Verify 1 writes it; it is shortened here only in this heading line)

# Verify 2
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

# Verify 3
$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "grep exit $?"
grep exit 1

# Verify 4, the reviewer's form (the builder's form runs `git diff -U0 -- skills/writing`, see Declined)
$ git diff c99b4a6 | awk '/^diff --git/{keep = ($0 ~ / a\/skills\/writing\//)} keep' | grep '^+' | grep -c -i -E 'hccnet|grant|manuscript|step [0-9]|plan\b|finding [0-9]'
0

# Verify 5, a word count of each added sentence over 20 words (a count; the judgment is in the findings)
$ git diff c99b4a6 | awk '...skills/writing only...' | grep '^+[^+]' | sed 's/^+ *- //' | python3 -I -c '<split on ". " and print len(s.split()) when > 20>'
31 | Where the draft gives neither, it is a bracket that names the number, the share of cases the claim holds in, or the specific claim, as a fact for the author.
42 | Every list of places, such as the places of a term used under several names, the sentences of a tense list or the places of another rule, gives each place as its own entry with its place, its passage and its replacement.
24 | Each of the two findings names the other rule by its page and section, never by the number of a finding or a group.
22 | **The last pass.** Before your final message, read your whole report once more, finding by finding and group line by group line.
23 | Check each against "What you report", "A finding", "How you group them" and the section of the rules or registers page it names.
23 | Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost.
21 | The passage and the replacement are written out as text, with no reference to another finding, entry or group ("A finding").
26 | The replacement of a vague qualifier is the number, the specific claim or the bracket, and never a cut that makes the claim universal ("A finding").
23 | Each group line names a loss that one of the group's findings shows and that holds in the draft ("How you group them").
25 | A replacement brings in a technical term whenever its passage does not hold the term, whether the draft defines it somewhere or never defines it.
29 | Where the draft defines such a term later or never defines it, the replacement defines it or names its definition in square brackets as a fact for the author.
23 | Evidence the paragraph gives for a claim it makes, and that is not followed by what it means for that claim, is reported.
21 | A sentence that reports data the paragraph uses for no claim, such as a property of a cohort, is not reported.

$ git diff c99b4a6 | awk '...skills/writing only...' | grep '^+[^+]' | grep -c ";"
0

# The builder's quoted evidence
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/7-report.md
     227 skills/writing/SKILL.md
     223 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     149 .scratch/3-the-writing-base/agents/reviews/7-report.md
     652 total

$ grep -n version skills/writing/SKILL.md
5:  version: "1.0.0"
82:     - The message that ends the turn shows the configured model, the served model and the Claude Code version (`claude --version`).
207:| A model other than the configured one | The runner served the review agent a model that is not the configured one, as `refute`'s Stops table defines it (Steps 6) | The configured model, the served model and the Claude Code version (`claude --version`) | `/writing` again, once the runner serves the configured model or the configuration names another |

# Premises of "What is on the tree"
$ for p in SKILL.md references/rules.md references/registers.md; do git show c99b4a6:skills/writing/$p | wc -l; done
204 / 219 / 53
$ git show c99b4a6:skills/writing/SKILL.md | sed -n '122p;126p;133p;137p;143p;148p;156p;161p;162p;164p;166p'
(each line is the sentence the brief names at that number; 162 is "A finding on a term used under several names gives each place with its passage and replacement.", 166 is "A passage that breaks two rules gets one replacement that ends both breaks.")
$ git show c99b4a6:skills/writing/references/rules.md | sed -n '13p;54p'
- A replacement brings in a technical term when its passage does not hold the term and the draft defines it somewhere.
- A hedge of the strength the evidence carries on an interpretation is not reported.
$ git show c99b4a6:skills/writing/references/registers.md | diff - skills/writing/references/registers.md; echo "registers diff exit $?"
registers diff exit 0
$ git diff c99b4a6 --stat -- docs; echo "docs diff exit $?"
docs diff exit 0
$ grep -l -i -E "writing|review agent|draft" docs/adr/00*.md
docs/adr/0001-the-writing-base-reads-the-prose-standard-where-it-is.md
docs/adr/0003-a-fresh-read-only-agent-reviews-a-draft.md
docs/adr/0002-the-prose-standard-holds-over-the-academic-sources.md

# The ledger copies in the worktree against main
$ diff <main>/.scratch/3-the-writing-base/agents/briefs/7-cases.md <worktree>/.scratch/3-the-writing-base/agents/briefs/7-cases.md; echo "cases diff exit $?"
cases diff exit 0
$ diff <main>/.../briefs/7.md <worktree>/.../briefs/7.md; echo "brief diff exit $?"
brief diff exit 0

# Counts in the step 6 records used for C7 and B1
$ grep -c "^Also:" 6-run/manuscript-report.md
29
$ grep -c "also falls under group" 6-run/grant-report.md
7
$ grep -n "not repeated here" 6-run/manuscript-report.md
580:No claim changes. In the present tense, ... Sentences already rewritten in the groups above are not repeated here. Each entry gives the place, the passage and its replacement.
```

## Verdicts
Fixes of the brief's "What to build":
- 1: holds. `SKILL.md`, "The review agent's prompt", has the bullet "The last pass" after "How you group them" and before "A draft with no break". Its 14 checks cover all ten items of the brief's list, two of them split into two checks each. It carries both halves of ruling (a) of `7-cases.md`: "Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost." and the rewrite bullet. It says "changes no file and runs no command". Two of its sentences break standards (findings T1, T2).
- 2: holds. The base lines 162 and 163 (the term bullet and the tense bullet) are replaced by the list-of-places bullet and "An entry is written out also where an entry of another term changed the same place.". The base line 166 now has "That passage and replacement are given whole under each rule's group." and "Each of the two findings names the other rule by its page and section, never by the number of a finding or a group." No sentence is left that lets a finding stand on another finding's passage. The tense bullet merge is reported as a judgment call with its reason. The merged sentence breaks the length rule (finding T3).
- 3: holds. Line 143 is rewritten. The "or" ban and the allowed specific-claim bracket are its sub-bullets.
- 4: holds. Base line 54 is replaced by three bullets. I read them against lines 43 to 54 of "Hedging" and found no contradiction. Line 56 follows from lines 48 and 55, and the brief asks for it. The widened scope is a user-visible change the report does not state (finding B2).
- 5: violated. Line 13 is rewritten as asked. The base line 14 lost its exception "or the replacement defines it", and the exception was moved into a separate bullet (line 15). The rewritten line 14 now contradicts line 15 (finding S1).
- 6: holds. "Explanation of evidence" limits the rule to evidence for a claim the paragraph makes. It has the not-reported sentence for data used for no claim.
Cases:
- C1: met. Each fix-1 row and each of the five group lines names a sentence the base text already held. I checked every quoted sentence against `SKILL.md` lines 107, 130, 132, 133, 135, 137, 138, 141, 143, 150, 158, 163, 174 and 175. Each row also names a last-pass check that exists at lines 184 to 197. The report quotes the ruling of C1 (filler 4) and of grant 12.19.
- C2: met. Grant 11.1 to 11.5, 11.7 and 11.10 break lines 169 and 170. Manuscript report line 229 breaks lines 164 and 165.
- C3: met. Evidence 2's bracket ("..., or the clinical guideline that prescribes it, ...") and vague qualifiers 4's bracket ("the dataset sizes or the share of small datasets") break line 144. Vague qualifiers 2's bracket "[the specific obstacle, as \citep{jin2021predicting} reports it]" meets line 145.
- C4: met. Hedging 2 breaks line 57. Hedging 5 falls under line 55 and is dropped under ruling 3.
- C5: partial (finding S1). Grant 1.1 breaks line 14. Terms 2 is placed against lines 13 and 15, while the brief expects lines 13 and 14. On the text as built, line 14 forbids the use that line 15 allows.
- C6: met. Grant 7.1 falls under line 79.
- C7: partial (finding P2). The grant findings are handled. Several manuscript findings in the C7 list are now asked in the new form, and the report does not name them.

## 1. Spec
- S1. `skills/writing/references/rules.md:14-15`, "Terms defined at first use".
  - Hunk:
    ```
    -- Such a term is used only where the draft defines it at or before the passage, or the replacement defines it.
    +- Such a term is used only where the draft defines it at or before the passage.
    +- Where the draft defines such a term later or never defines it, the replacement defines it or names its definition in square brackets as a fact for the author.
    ```
  - What is wrong: Fix 5 says "Line 14 then also covers a term the draft never defines". The builder instead removed the exception from line 14 and put the later-or-never case in its own bullet. Line 14 now says a term the replacement brings in is used "only" where the draft defines it at or before the passage. Line 15 lets the replacement use that term where the draft defines it later or never. The two sentences contradict each other (`docs/dev/change-standard.md`, rule 19). The exception no longer stands in the same bullet as its rule (`docs/dev/skill-layout.md`, "Lists and tables": "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule"). On its own, line 14 is now narrower than at the base (rule 17).
  - Failure scenario: the review agent writes Terms 2's replacement, which defines "patchify layer" with the words "stem convolution". The draft never defines "stem convolution". Read by line 14, the term may not be used, so the agent drops the defining phrase and the definition the section asks for is lost. Read by line 15, the agent defines "stem convolution" inside the replacement. Two runs, or a run and a marker, read the same page two ways, and a marker who follows line 14 marks a replacement that follows line 15 wrong.
  - Linked verdicts: fix 5 (violated) and C5 (partial).
- No other spec findings. I checked these points:
  - Every premise of "What is on the tree" I could check reproduces (Verification).
  - No decision reserved for the user was taken.
  - The only change no fix names is the merged tense bullet. The report lists it as a judgment call that serves fix 2, as change-standard rule 20 asks.
  - `metadata.version` stays "1.0.0".
  - No ADR in force is contradicted. ADR 0001: no rule of the prose standard is copied. ADR 0003: the last pass is the same agent's, and it changes no file.
  - Every old sentence the brief says to rewrite was replaced, not kept beside the new one. The exception is line 14 of S1, where the rewritten sentence now contradicts the new one.

## 2. Proof
- P1. `7-report.md`, "Judgment calls the brief left open", fifth bullet: "the brief's line 14 is two bullets: the first keeps "Such a term is used only where the draft defines it at or before the passage."". The base line 14, from `git show c99b4a6:skills/writing/references/rules.md`, ends ", or the replacement defines it." The first bullet does not keep that line. It drops its exception. The orchestrator reads that line 14 was kept, so it accepts the split without seeing the contradiction of S1. Linked to S1.
- P2. `7-report.md`, "Each case, read on the unchanged tree", C7: "each of Limitations 2 and 3, ... Clear antecedents 2, ... filler 2 and 3, ... keeps its place, passage, rule and replacement. Grant 5.1, 5.2, 5.3 and 5.5 are asked in the new form".
  - The brief's C7 expects that "A finding the changed text asks in another form, such as a passage that also breaks a second rule (fix 2), is given in the new form, with the sentence that asks it."
  - Several manuscript findings on the C7 list each break a second rule that the step 6 report names in an "Also:" line or a parenthesis, without writing the passage under that rule's group:
    - Limitations 2: "Also: prose standard section 0 ...; "Tense per section" (Results)".
    - Clear antecedents 2: "Also: prose standard section A ("considerably")". Section A's group has no entry for this passage.
    - Filler 3: "(with the Methodology tense)".
    - The tense-bearing entries of "No synonym cycling" 1.1, such as `b_architecture.tex:14`, "concatenated ... prepended". The tense group says "Sentences already rewritten in the groups above are not repeated here."
  - Under the new `SKILL.md` line 169, each of these passages and replacements is now given whole under the second rule's group as well. The report names only the grant findings. The orchestrator and step 8's markers would then expect the manuscript findings unchanged, and would read their repeated entries as new findings or as a defect. Linked to C7 (partial).
- P3. `7-report.md`, DONE / NOT DONE, the `metadata.version` row: "`grep -n version skills/writing/SKILL.md` prints `5:  version: "1.0.0"`". The command prints three lines (Verification): lines 82 and 207 also match. The brief asks for each check's output "as printed". No decision rests on the two lines that were left out, since the version line is right.
- P4. `7-report.md`, DONE / NOT DONE, Verify 5: "DONE: departures are named under the judgment calls". The judgment calls name only the vague-qualifier bullet ("about 30 words") and the last-pass lead bullet. They do not name the 42-word sentence at `SKILL.md:164` or the 29-word sentence at `rules.md:15`. Verify 5 asks that "each place it departs from them is named in the report with why it needs its form". Linked to T3.

## 3. Standards
- T1. `skills/writing/SKILL.md:180`, "The last pass".
  - Hunk: `+  - Rewrite each finding or group line that breaks one of their rules until it meets them.`
  - What is wrong: this is a repeat that ends only when a condition holds, and it gives no count and no end when the condition is not reached. `docs/dev/skill-layout.md`, "Writing for an agent": "A repeat that ends only when a condition holds, such as "until it passes" ... is given a count." The bullet is new text, so that section binds it. The brief's own fix text uses "until it meets the rules"; the standard still applies.
  - Failure scenario: a finding where two rules pull against each other. One case is a replacement that must keep every clause of its passage and also keep each sentence within the length rule. Another is a split part that the added bracket sentences push over four sentences again. The agent has no count and no stated outcome. It either keeps rewriting in its own turn, or hands back the finding still breaking a rule, with nothing telling it to say so.
- T2. `skills/writing/SKILL.md:185`, "The last pass".
  - Hunk: `+    - Each place is in its form, with its full path, and the quoted passage stands there ("A finding").`
  - What is wrong: "A finding" gives the place form as "`file:line` with the file's path from the main file's folder, as in `figures/block.tex:12`" (line 113). "Full path" is a second name for that path, used nowhere else in the skill. That breaks the prose standard's section D, "No synonym cycling", and `docs/dev/skill-layout.md`, "One meaning has one place". The wording comes from the brief's list.
  - Failure scenario: Steps 5 gives the agent the draft's files as absolute paths (line 73, "each absolute"). An agent applying "with its full path" in the last pass rewrites `sections/abstract/abstract.tex:3` as the absolute path of the scratch copy. That breaks the form of line 113, and the user gets places that point into a temporary folder.
- T3. `skills/writing/SKILL.md:164` and `skills/writing/references/rules.md:15`.
  - Hunks:
    - `+  - Every list of places, such as the places of a term used under several names, the sentences of a tense list or the places of another rule, gives each place as its own entry with its place, its passage and its replacement.` (42 words)
    - `+- Where the draft defines such a term later or never defines it, the replacement defines it or names its definition in square brackets as a fact for the author.` (29 words)
  - What is wrong: both sentences are well past the prose standard's section E, "Sentence length", which says "under roughly 20 words unless the mechanism needs more". The report does not name either of them with a reason (P4). The first also says "each place ... with its place", which repeats itself; the three examples could stand as sub-bullets.
  - Failure scenario: a reader of the prompt, the review agent included, has to parse a 42-word rule with three nested examples to find its one requirement, "each place is its own entry". The examples are the part most likely to be taken as the whole scope. An agent may then treat a list of another kind, such as section A's filler list, as outside the rule.
- No other standards findings. I checked these points:
  - The changed files and the report are ASCII (Verify 1).
  - There is no spaced hyphen (Verify 3) and no semicolon in any added line.
  - There is no history in the text, and no sentence names a draft, a finding number or the plan (Verify 4).
  - The prose standard is named by its section and never copied.
  - A grep of the changed sentences' key words across `skills`, `docs`, `README.md` and `utils` found no sentence outside `skills/writing/` that the diff makes false. The search covered "finding on tense", "under several names", "brings in a technical term", "hedge of the strength", "same strength", "Explanation of evidence", "last pass", "breaks two rules", "share of cases", "one strength", "tense list" and "full path". Its only hits outside the skill are the unrelated "last pass" of `plan-orchestration`. The README row, the roadmap goal and the glossary entry for **finding** in `/writing`'s sense still hold.

## 4. Behaviour
- B1. `7-report.md`, "User-visible changes".
  - The report quotes: "Before: a finding could read "Passage and replacement as in 5.1" ... After: such a passage is given whole under each rule's group with the other rule named by page and section".
  - The change reaches more than the "as in N" references. At the base, a passage that broke two rules was written out once, under one group, with an "Also: <rule>" line. The step 6 manuscript report has 29 such lines (`grep -c "^Also:"`). Its tense group states "Sentences already rewritten in the groups above are not repeated here." The grant report has 7 "also falls under group" notes.
  - Under the new line 169, each of those passages and replacements is now written out whole under every group whose rule it breaks. The user's report grows by one full entry per extra rule, and the tense group no longer leaves out sentences already given elsewhere.
  - The report gives neither the "Also:" form as a before nor the repeated entries as an after.
  - Failure scenario: a user of `/writing` who reads the report's change log expects only the "as in N" lines to change. They meet the same sentence two or three times under different groups and take it for duplicated findings, or apply each entry and get conflicting edits. Linked to P2.
- B2. `7-report.md`, "User-visible changes", After: "hedges of one claim share one strength".
  - At the base, only "A hedge of the strength the evidence carries on an interpretation is not reported". Now any passage whose device already has the strength the evidence carries is not reported, whatever kind of claim it hedges. A replacement may no longer swap a device for another of the same strength.
  - Fewer "Hedging" findings reach the user, and a same-strength swap such as "indicating" to "which suggests" disappears. The report states neither with a before and after.
  - Failure scenario: the user compares a step 8 report with step 6's and finds Hedging findings gone. With nothing in the change log about it, they cannot tell an intended narrowing from a missed break.

## Declined to judge
- The builder's Verify 4 command, `git diff -U0 -- skills/writing | grep '^+' | grep -c ...`, was not run. It is a git command outside the three allowed: it diffs the working tree against the index, not against the base. I ran the same filter over `git diff c99b4a6` (Verification), and it prints 0. Whether the index equals c99b4a6 would be settled by `git diff --cached --quiet c99b4a6`.
- The brief's premise that `docs/adr` is unchanged since 1c26ac1 (`git diff --quiet 1c26ac1 HEAD -- docs/adr`) and its premise about the pinned copy (`diff -r skills/writing ~/.claude-backup/skills/writing`, `git -C ~/.local/share/ordo-stable describe --tags`) were not run. Both need git commands outside the three allowed, and the pinned copy lies outside the worktree. `git diff c99b4a6 --stat -- docs` shows the step touches no ADR.
- The report's "`git status --short` before any change printed nothing" cannot be reproduced now. It describes a past state.
- The untracked `.scratch/3-the-writing-base/agents/briefs/7-cases.md` in the worktree equals main's committed copy (`diff` exit 0). I did not determine who placed it there or how the landing's wip commit and cherry-pick treat a file already on main. `git log --oneline c99b4a6..HEAD` in the worktree and a trial of `land.sh` would settle that. Neither is allowed here.
- How the changed prompt behaves on the real drafts, and whether the last pass catches each row in practice, is step 8's run. I did not start the review agent.
- The cohesion of the whole of `references/registers.md` was not reread, since the diff leaves it unchanged (`diff` exit 0).

Reviewer usage: afe8061d591582615, claude-opus-5-5, 198184 tokens, 40 tool uses, 8.0 minutes.

## Repair round 1, refuted (run over the worktree .agents/worktrees/3-the-writing-base-7, base c99b4a6, snapshot .agents/worktrees/3-the-writing-base-7-round-1)

### Verification (rerun by the reviewer)
```
$ cd .agents/worktrees/3-the-writing-base-7 ; git status --short
 M skills/writing/SKILL.md
 M skills/writing/references/rules.md
?? .scratch/3-the-writing-base/agents/briefs/7-cases.md
?? .scratch/3-the-writing-base/agents/briefs/7-round-1.md
?? .scratch/3-the-writing-base/agents/reviews/7-report.md

$ git diff c99b4a6 --stat
 skills/writing/SKILL.md            | 38 ++++++++++++++++++++++++++++++++++----
 skills/writing/references/rules.md | 12 ++++++++----
 2 files changed, 42 insertions(+), 8 deletions(-)

# Brief Verify 1 (run exactly as the brief writes it)
charset exit 0

# Brief Verify 2
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

# Brief Verify 3
$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "grep exit $?"
grep exit 1

# Brief Verify 4, the reviewer's form over git diff c99b4a6 (the builder's form is `git diff c99b4a6 -- skills/writing | ...`, same filter)
$ git diff c99b4a6 | awk '/^diff --git/{keep = ($0 ~ / a\/skills\/writing\//)} keep' | grep '^+' | grep -c -i -E 'hccnet|grant|manuscript|step [0-9]|plan\b|finding [0-9]'
0
$ git diff c99b4a6 | awk '...skills/writing only...' | grep '^+[^+]' | grep -c ";"
0

# The builder's quoted evidence
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/7-report.md
     234 skills/writing/SKILL.md
     223 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     195 .scratch/3-the-writing-base/agents/reviews/7-report.md
$ grep -n version skills/writing/SKILL.md
5:  version: "1.0.0"
82:     - The message that ends the turn shows the configured model, the served model and the Claude Code version (`claude --version`).
214:| A model other than the configured one | The runner served the review agent a model that is not the configured one, as `refute`'s Stops table defines it (Steps 6) | The configured model, the served model and the Claude Code version (`claude --version`) | `/writing` again, once the runner serves the configured model or the configuration names another |
$ LC_ALL=C grep -n '[^ -~]' skills/writing/SKILL.md skills/writing/references/rules.md ; echo "exit $?"
exit 1
$ diff main/.scratch/.../briefs/{7.md,7-cases.md,7-round-1.md} and .../reviews/7-report.md against the worktree copies
7-cases.md diff exit 0 / 7-round-1.md diff exit 0 / 7.md diff exit 0 / report diff exit 0
$ grep -n -i 'full path' skills/writing/SKILL.md skills/writing/references/*.md; echo "exit $?"
exit 1

# Added sentences of 18 words or more (a count; python3 -I over the added lines of git diff c99b4a6 under skills/writing, split on ". ")
31 | Where the draft gives neither, it is a bracket that names the number, the share of cases the claim holds in, or the specific claim, as a fact for the author.
21 | That entry names the other list's rule by its page and section, or its term, in a line of its own.
21 | A passage that breaks two or more rules is reported once, in one finding, with one replacement that ends every break.
22 | **The last pass.** Before your final message, read your whole report once more, ... (19 words after the label)
28 | A finding or group line that still breaks a rule after the second rewrite stays in the report, with a line that names the rule it still breaks.
23 | Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost.
21 | The passage and the replacement are written out as text, with no reference to another finding, entry or group ("A finding").
22 | Each place is in its form, with the file's path from the main file's folder where the form has one ("A finding").
25 | The replacement of a vague qualifier is the number, the specific claim or the bracket, never a cut that makes the claim universal ("A finding").
23 | Each group line names a loss that one of the group's findings shows and that holds in the draft ("How you group them").
22 | A replacement brings in a technical term whenever its passage does not hold the term, whether or not the draft defines it.
23 | Evidence the paragraph gives for a claim it makes, and that is not followed by what it means for that claim, is reported.
21 | A sentence that reports data the paragraph uses for no claim, such as a property of a cohort, is not reported.
(the other lines of that output are 18 to 20 words)
$ python3 -I (word count of two sentences the report counts)
17 Every list of places gives each place as its own entry, with its passage and its replacement.
16 Such lists include a term's places under several names, a tense list and another rule's places.
```
Every sentence over 20 words in that list is named in the report's judgment calls. `docs/adr` and the pinned copy were not checked (see Declined to judge).

### Checks of the rulings
- Ruling 1 (S1, P1), closed. `rules.md` "Terms defined at first use" now has "Such a term is used only where the draft defines it at or before the passage." with the sub-bullet "Otherwise the replacement defines it, or names its definition in square brackets as a fact for the author." The rule and its exception stand in one bullet and no sentence contradicts the first. Base line 14 (`git show c99b4a6`) read "..., or the replacement defines it."; the report's judgment call states that and the new text, which reproduces. Line 13 is 22 words and is named.
- Ruling 2 (B1, P2), implemented as ruled: the "An entry is written out also where ..." bullet is gone, the list-of-places bullet keeps its rule, the passage that breaks two or more rules is reported once with its rule named by page and section in a line of its own, a place reached by two lists is given once in the first list, and the pass's first check keeps "no reference to another finding, entry or group". New defects the form brings are findings T1, T2 and B1 below.
- Ruling 3 (T1), closed. "Rewrite each finding or group line that breaks one of their rules, at most twice." and the line for one that still breaks a rule. The count and its outcome are stated. It interacts badly with the drop rule (B1) and with "and nothing else" (T3).
- Ruling 4 (T2), closed. "full path" is gone (grep exit 1), the check reads "with the file's path from the main file's folder where the form has one", and the quoted-passage check is its own item.
- Ruling 5 (T3), closed for the two sentences named. The list-of-places rule is now 17 words with a 16-word examples sub-bullet, and `rules.md` line 15 is 18 words. The remaining over-20 sentences are named, but their reasons are weak (T5).
- Ruling 6 (P3, P4), closed. The `metadata.version` row quotes all three lines as my rerun prints them. Verify 5 and the judgment calls name every added sentence over 20 words that my count finds.
- Ruling 7 (B1, B2), closed for the three listed changes: the two-rule form with the step 6 forms as the before, the narrowed "Hedging", and the last pass's count and line. The "Elsewhere" bullet (vague-qualifier bracket, undefined term, data used for no claim) gives only an after (B2).
- Ruling 8 (P2, C7), closed. The report reads Limitations 2, Clear antecedents 2, filler 3 and the tense-bearing entries against ruling 2 and states each form. I checked them against `6-run/manuscript-report.md`. Limitations 2 has "Also: ... section 0 ...; "Tense per section" (Results)" at line 13. Clear antecedents 2 has "Also: ... section A ("considerably")" at line 251, and section A's group has no entry for it. Filler 3 is at line 575 with "(with the Methodology tense)". The six tense-bearing entries are at lines 211, 213, 214, 218, 220 and 228. The report reads "No synonym cycling 1.1" as these six entries, while `6-marks.md` row 1.1 is the heading at `b_architecture.tex:5`. The wider reading covers the refuter's example, so it is not a finding.
- First-run findings: S1, P1, P2, P3, P4, T1, T2, T3, B1 and B2 are each closed as above. T3 and P4 closed in form, with the weak reasons of T5 left.

### Verdicts, whole step since the base
Fixes of the brief, as the rulings change them:
- 1, the last pass: holds. It is after "How you group them" and before "A draft with no break". It has both halves of ruling (a) of `7-cases.md`, the count, and 15 checks each naming its part, and it changes no file and runs no command. Findings T3, T6 and B1 attach to it.
- 2, a passage that breaks two rules, as ruling 2 of round 1 replaces it: holds. All four sub-requirements of the ruling are in the text, and the "as in N" form is no longer allowed. Findings T1, T2 and T4 attach to it.
- 3, the bracket of a qualifier: holds. SKILL.md lines 143 to 145 (the section "A finding").
- 4, hedging: holds. `rules.md` "Hedging" has the three bullets. Hedging 5 falls under "A passage whose device already has the strength the evidence carries is not reported."
- 5, an undefined term: holds. `rules.md` "Terms defined at first use", lines 13 to 15. Terms 2 breaks the three lines, and grant 1.1 breaks line 14.
- 6, explanation of evidence: holds. `rules.md` "Explanation of evidence".

Cases:
- C1: met. Each fix-1 row and the five group lines name an existing sentence and a pass check, and the report carries the rulings on filler 4 and grant 12.19.
- C2: met. Grant 11.1 to 11.5, 11.7 and 11.10 break "No other group gives an entry for the passage or refers to it." Manuscript report line 229 breaks "A place that two lists of places reach is given once, in the first list that reaches it." and "The later list leaves the place out and refers to it nowhere."
- C3: met. The "or" brackets of Evidence 2 and vague qualifiers 4 break line 144. Vague qualifiers 2's bracket meets line 145. The bracket of vague qualifiers 1 is "[by the measured amount, with its citation]" and that of vague qualifiers 3 is "[The share of traditional approaches, with its citation]". Neither has an "or", although the report says "an amount or a share".
- C4: met.
- C5: met.
- C6: met.
- C7: met. The forms named in the report reproduce against the step 6 reports.

### 1. Spec
None. Fix 5 and S1 are closed, and no ADR (0001 to 0003 read) is contradicted: nothing is copied from the prose standard and the agent still changes no file.

### 2. Proof
- P1. `7-report.md`, "Repair round 1", row 5: "the rule in one sentence of 16 words and the examples as a sub-bullet of 15 words". `SKILL.md:164` has 17 words (`python3 -I` count above) and `SKILL.md:165` has 16. The counts are off by one, and no decision rests on them. Failure scenario: the orchestrator copies the counts into the booking, and a reviewer who recounts reads them as an unreproduced claim.
- P2. `7-report.md:132`, the `metadata.version` row. The cell quotes line 214 of the Stops table, which contains `|` characters. Hunk: "`214:| A model other than the configured one | The runner served ...`". The unescaped pipes split the cell into extra columns where the report is rendered. The command's output is correct, but it is unreadable in the table. Failure scenario: the orchestrator reads a row whose cells are shifted and cannot tell which text is the output.

### 3. Standards
- T1. `SKILL.md:164` and `SKILL.md:166-169`.
  - Hunk: `- Every list of places gives each place as its own entry, with its passage and its replacement.` and, as the next bullet, `- A place that two lists of places reach is given once, in the first list that reaches it.` with `- The later list leaves the place out and refers to it nowhere.`
  - What is wrong: the rule says every list gives each place, and the exception (a later list leaves out a place an earlier list gave) stands in a sibling bullet. `docs/dev/skill-layout.md`, "Lists and tables", keeps an exception in the same bullet as its rule, and `change-standard.md` rule 19 forbids two statements that contradict each other. The sub-bullet at line 165 makes a tense list a list of places, so the tense list is told both to give each of its sentences and to leave out those given before.
  - Failure scenario: the review agent reads line 164 for the tense list and writes `b_architecture.tex:14` under tense again, or reads line 169 and leaves out a tense sentence no other list reached. The two readings give different reports, and a marker who reads one marks the other wrong.
- T2. `SKILL.md:166-169` against `SKILL.md:172-176`.
  - Hunks:
    - `- A place that two lists of places reach is given once, in the first list that reaches it.`
    - `- Its replacement carries every change at that place.`
    - `- That entry names the other list's rule by its page and section, or its term, in a line of its own.`
    - `- The later list leaves the place out and refers to it nowhere.`
    - `- A passage that breaks two or more rules is reported once, in one finding, with one replacement that ends every break.`
    - `- That finding stands under the group of one of those rules.`
    - `- That finding names each other rule it breaks by its page and section, in a line of its own.`
    - `- No other group gives an entry for the passage or refers to it.`
    - `- ... the replacement gives the text at that place as it reads after every finding on it.`
  - What is wrong: one situation is governed by two bullet groups. Line 165 makes the group of any rule a list of places, so a passage with two rules is also a place that two lists reach. The two groups differ on where it stands (line 173 "the group of one of those rules", line 166 "the first list"). The naming sentence is written in both (lines 168 and 174), the no-reference sentence in both (169 and 175), and "carries every change" in three (167, 172, 176). `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once."
  - Failure scenario: a sentence in a term list that also breaks the tense rule is placed by line 173 under whichever group the agent picks, and by line 166 under the first group. Two runs differ, and the first marker sees a finding in the tense group, the second in the term group.
- T3. `SKILL.md:105` against `SKILL.md:186`.
  - Hunks: `Report a break of a rule of the prose standard, the rules page or the registers page, and nothing else.` and `A finding or group line that still breaks a rule after the second rewrite stays in the report, with a line that names the rule it still breaks.`
  - What is wrong: the new line is report content that is no break of a draft. It is also no finding, since a finding gives its place, passage, rule and replacement. ADR 0003 says the agent "reports only breaks of a named rule", and line 105 says "nothing else". `change-standard.md` rule 19 forbids the contradiction. The report states the line as a user-visible change but does not reconcile it with line 105.
  - Failure scenario: an agent weighing "nothing else" against the line omits the line and leaves a self-flawed finding unmarked. The user applies it, and the marker cannot tell which findings the agent doubted.
- T4. `SKILL.md:172-175`, a synonym for a name the skill already uses.
  - Hunks: `- A passage that breaks two or more rules is reported once, in one finding, ...` and `- No other group gives an entry for the passage or refers to it.`
  - What is wrong: "finding" and "entry" name the same thing in adjacent bullets. Line 117 and line 164 use "entry" for a list item, but line 175 uses it for a finding under a group.
  - Failure scenario: an agent takes "entry" in line 175 as a list item only and puts the passage again as a plain finding under the second group.
- T5. `7-report.md`, "Judgment calls", the over-20-word bullets.
  - Hunk: `31 words ... It names the three things the bracket may name, and the brief dictates the three.` and `28 words ... the ruling asks for both.`
  - What is wrong: the reasons name who asked for the sentence, not why the mechanism needs more than about 20 words. `7-round-1.md` ruling 5 asks for a shortened sentence or a reason it needs its length. Both sentences split without loss: the 31-word one into the three things as sub-bullets, the 28-word one into the outcome and the line. Line 163 also calls 21 and 22 words "within roughly 20". The 25-word check at `SKILL.md:199` is the same case.
  - Failure scenario: step 8's markers or a later refuter find 31 and 28 words in a prompt a model follows by reading, with a reason that is the brief's say-so. The same finding returns each step.
- T6. `SKILL.md:199` against `SKILL.md:146-147`.
  - Hunks: `- The replacement of a vague qualifier is the number, the specific claim or the bracket, never a cut that makes the claim universal ("A finding").` and `- Where the draft holds the claim in every case, by a definition or by its own data, the replacement cuts the qualifier. The finding names that definition or those data.`
  - What is wrong: the check restates the rule of lines 143 to 146 without its exception at line 147. The brief dictated this check. The restatement without the exception is still two statements that disagree, which `change-standard.md` rule 19 forbids.
  - Failure scenario: the last pass meets a finding like step 6's vague qualifiers 8 ("Generally, lower MAE values ..." cut, because the claim holds by the MAE's definition). The check reads that cut as one that "makes the claim universal", and the agent puts the qualifier back or rewrites it to a bracket, so the right finding is lost.

### 4. Behaviour
- B1. `SKILL.md:187` with `SKILL.md:175` and `SKILL.md:185-186`.
  - Hunk: `- Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost.`
  - What is wrong: the new rule forbids a second group's entry for a passage ("No other group gives an entry for the passage"). A report that has such a duplicate breaks "A finding", so the pass must remove one entry. Line 187 allows a drop only for a passage that is not reported. A duplicate cannot be rewritten into something else, nor dropped, and lines 185 and 186 end with it left in place and a line that names the rule it breaks. The pass has no check for the duplicate either.
  - Failure scenario: the agent's draft report gives a passage with two rules under both groups. The pass notes it, cannot drop it, and hands back both entries plus a self-flag line. The user then applies the same passage twice with two replacements, the conflict that ruling 2 was written to prevent.
- B2. `7-report.md`, "User-visible changes", the "Elsewhere" bullet.
  - Hunk: "Elsewhere: a bracket for a vague qualifier offers no "or" alternative that leaves the claim universal. A term the draft never defines is defined in the replacement or its definition is bracketed. Data the paragraph uses for no claim is not reported under "Explanation of evidence"."
  - What is wrong: three user-visible changes of `/writing`'s report have an after and no before. Before: a bracket could offer an "or" alternative that left the claim universal, a replacement need not define a term the draft never defines, and data used for no claim was reported under "Explanation of evidence". `change-standard.md` rule 7 asks for the before and after of each.
  - Failure scenario: the user compares step 8's report with step 6's. Brackets with an alternative disappear and findings for data like grant 7.1 are gone. With no before in the change log, the user cannot tell an intended change from a missed break.

### Declined to judge
- How the changed prompt behaves on the real drafts, and whether the pass and the one-finding form reproduce the markers' right marks, is step 8's run. I did not start the review agent.
- The brief's premises about git history (`git diff --quiet 1c26ac1 HEAD -- docs/adr`, `git diff --quiet 178bc42 HEAD -- skills/writing`), the pinned copy (`diff -r skills/writing ~/.claude-backup/skills/writing`, `git -C ~/.local/share/ordo-stable describe --tags`), and whether the index equals c99b4a6 (`git diff --cached --quiet c99b4a6`) need git commands outside the three allowed or lie outside the worktree. `git diff c99b4a6 --stat` shows no change under `docs/`, `registers.md` or any ADR, so no ADR text is touched.
- The report's "`git status --short` before any change printed nothing" describes a past state and cannot be reproduced.
- The untracked ledger copies in the worktree (`7-cases.md`, `7-round-1.md`, `7-report.md`) equal main's (`diff` exit 0 on each). How the landing's wip commit and cherry-pick treat files already on main would be settled by `git log` and `land.sh`, which I may not run.
- The hand count of the "22 to 21 words" sentences in the judgment calls: the lead of "The last pass" is 19 words after its label, which I did not treat as a finding.

Reviewer usage: a5ac0aefa8b6630f9, claude-sonnet-5-5, 203204 tokens, 37 tool uses, 6.8 minutes.

## Closed

- First run, S1, P1 to P4, T1 to T3, B1 and B2: closed by repair round 1 (`agents/briefs/7-round-1.md`, rulings 1 to 8). Ruling 2 replaced fix 2's form with one finding per passage that names its other rules. The run over round 1 found each ruling's change in the two skill pages and the report.
- Run over round 1, T1, T2 and T4: fixed at landing in `skills/writing/SKILL.md`. The passage rule and the two-list place rule are one rule: a passage or place is given once, in the first group that reaches it, names its other rules or term by page and section, and is not given again or referred to. The list-of-places bullet carries the exception as a sub-bullet, and "entry" stands only for an item of a list of places.
- Run over round 1, T3: fixed at landing in `SKILL.md`. "What you report" says a finding may carry the last pass's line on a rule it still breaks, as part of the finding.
- Run over round 1, B1: fixed at landing in `SKILL.md`. The last pass drops a finding whose passage an earlier group already gives, and checks that no passage or place is given twice.
- Run over round 1, T5: fixed at landing in `SKILL.md`. The 31-word bracket sentence and the 28-word still-breaks sentence are split. The added sentences that remain over 20 words run 21 to 23 words.
- Run over round 1, T6: fixed at landing in `SKILL.md`. The vague-qualifier check says the replacement takes one of the forms "A finding" gives for it.
- Run over round 1, P1, P2 and B2: fixed at landing in `7-report.md` (the counts 17 and 16, the escaped pipes, and the before and after of each "Elsewhere" change).
