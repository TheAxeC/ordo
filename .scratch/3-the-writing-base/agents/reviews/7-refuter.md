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
