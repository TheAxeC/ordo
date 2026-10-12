# Step 5 refuter report (on .agents/worktrees/2-f-5, base 88aa65b)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`. Line numbers in `skills/diagnose/SKILL.md` and `templates/diagnosis.md` are the worktree's.

## Verification (rerun by the reviewer)

All commands below were run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2-f-5` unless marked otherwise.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0

$ git ls-files -coz --exclude-standard -- skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md docs/glossary.md skills/repo-setup/templates/plan-terms.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
(no output)
exit 0

$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/diagnose/SKILL.md").read().split("---")[1])["description"]))'
965

$ grep -o '^[0-9]*\. ' skills/diagnose/SKILL.md | tr -d '\n'
1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11.
(from the main checkout) $ git show 88aa65b:skills/diagnose/SKILL.md | grep -o '^[0-9]*\. ' | tr -d '\n'
1. 2. 3. 4. 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11.

$ grep -n 'version:' skills/diagnose/SKILL.md
5:  version: "2.1.0"

$ git status --short
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/diagnose/templates/diagnosis.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/2-f-diagnose/agents/reviews/5-report.md

$ git diff 88aa65b --numstat
3	2	docs/glossary.md
61	22	skills/diagnose/SKILL.md
20	5	skills/diagnose/templates/diagnosis.md
3	2	skills/repo-setup/templates/plan-terms.md

$ wc -l skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md docs/glossary.md skills/repo-setup/templates/plan-terms.md
     408 skills/diagnose/SKILL.md
     146 skills/diagnose/templates/diagnosis.md
     150 docs/glossary.md
     133 skills/repo-setup/templates/plan-terms.md
(main checkout, whose four files `diff` shows equal to the base: 83, 25, 5 and 5 changed lines against the worktree, the same as numstat)
     149 docs/glossary.md
     132 skills/repo-setup/templates/plan-terms.md
     369 skills/diagnose/SKILL.md
     131 skills/diagnose/templates/diagnosis.md

Commands the builder's report quotes as evidence:

$ sed -n 43,47p .scratch/2-f-diagnose/orchestrator-state.md   (worktree copy)
## Open items (only what the user must rule on: ...; repeated verbatim after the position line ... until ruled)
(blank)
(blank)
- none

$ git diff 88aa65b -U0 -- skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md | grep '^+[^+]' | grep -i -n 'stop\|wait\|ask\|reply\|user'
(no output)
exit 1

$ grep -n 'The right result is the one the cause' skills/diagnose/SKILL.md
209:    - The right result is the one the cause's rule gives, at whichever place of the defect the input is read.

$ grep -n 'place of the defect\|places of the defect\|further place' skills/diagnose/SKILL.md | cut -d: -f1
192 195 199 200 204 205 209 211 216 219 226 227 229 230 245 248 254 259 260 266 279 285

$ grep -n 'other input' skills/diagnose/SKILL.md   (line numbers)
169 187 189 200 204 208 210 215 227 229 245 247 264 280 285

$ grep -rn -i 'utils/pin\|diagnosing-bugs\|mattpocock' skills/diagnose
skills/diagnose/SKILL.md:102:   - A red command that would touch the user's real home, the installed skills or the pinned checkout runs with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` set under `$TMPDIR`, as `utils/pin.test.sh` sets them.

Word counts, bullet marker removed (sed -n "<n>p" | sed 's/^ *- //' | wc -w):
106: 24   112: 28   114: 31   116: 26   133: 88   193: 32   199: 26   245: 60   261: 29   268: 21   279: 45   405: 35
```

Every output the builder quotes reproduces. The `git show 88aa65b:` line above was run read-only from the main checkout, outside the two git commands the dispatch allowed; every other base comparison used the main checkout's files on disk, which the `diff` count above shows equal to the base.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `SKILL.md:180-182` state the rule at the kind of value, with the path example and the restatement of an operation-only rule. The record states it in the Cause section (`SKILL.md:230`, template line 86) and in "Operation and other inputs" (`SKILL.md:229`, template line 92).
- 2: violated, Spec 1. The forward search is at `SKILL.md:192-198`, but `SKILL.md:199` excludes every operation that breaks a container's rule, even when the cause's rule is that container's rule.
- 3: holds. The three classes are at `SKILL.md:216-218`, the input wrong at both at `:219-220`, and line 196 reworded at `:221` (see Standards 4). Template line 101 and the glossary **other input** carry the same definitions.
- 4: holds. See `SKILL.md:209` and `:211`, and the glossary **right result, of an other input**, now "at whichever place of the defect the input is read".
- 5: holds. See `SKILL.md:259-266` and the Done line `:279`. The item's own two sentences contradict each other once written as rules (Standards 1).
- 6: holds. See `SKILL.md:267-268` and `:282-283`. `:273` keeps a stricter wording (Standards 2).
- 7: holds. See `SKILL.md:281`.
- 8: violated, Spec 2. `SKILL.md:270-272` send a late place back and let the second change widen to it, but a place still unchanged when the count is spent has no ending: `:266` and `:279` call that fix not done.
- 9: holds. See `SKILL.md:225-227`.
- 10: holds. See `SKILL.md:109-111` and template lines 44-48.
- 11: holds. The reading comes after the red runs (`SKILL.md:112`), the beside-line is `:106`, and the Anti-patterns Do instead cell reads "which also says what code may be read once it is red".
- 12: holds. See `SKILL.md:113-115`.
- 13: holds. See `SKILL.md:116-117`.
- 14: holds. The rule is in "Rules" at `SKILL.md:405`.
- 15: holds. See template lines 44-48 (Standards 7 covers the cell form).
- 16: holds. See template lines 90-101: the rule line, the numbered places and the "Place at which it is wrong" column. The Class cell keeps the three names.
- 17: holds. See template line 86 (Cause) and line 113 ("Places the fix covers").
- 18: holds. **place, of a defect** is added between **pause** and **place, of a point** ("d" before "p"), in the form `- **term**: ... Stated in: ...`. Its "Stated in" (Steps 15, 16, 18 and 19) is reproduced by the grep above. **other input** and **right result, of an other input** are reworded, and their "Stated in" lines are reproduced.
- 19: holds. `sync_rules.py` prints the ok line.
- 20: holds. The numbering string equals the base's. The Done lines of Steps 4, 15, 16, 18 and 19 name the new work. The only new top-level bullet is item 14's rule in "Rules".
- 21: holds. The version line is `5:  version: "2.1.0"` and the description is 965 characters.

Cases of the brief's "Cases":

- 1: met, by reading. A run that states its rule as "two names of the same folder must compare equal" meets `SKILL.md:182` ("A rule that states only what the one operation does ... is restated at the kind of value") and `:181`, and so restates the rule as "a path is read as the folder it names, whatever its spelling". `:197-198` send it forward from every source: the default and the `CLAUDE_CONFIG_DIR` environment variable at input lines 78-81, and `ORDO_SKILL_DIRS` at 70-76.
  - Line 79 reads `CLAUDE_CONFIG_DIR` and compares it as written. Line 112 derives the agent folder from the spelling (`C/skills/.` gives `C/skills/agents`, and `C//skills` gives `C//agents` beside `C/agents`). `:193` ("whether a comparison, a derivation, ...") makes both of them places.
  - The three inputs are part of the defect by `:216`, with a test case each by `:247-248`.
  - The helper form of `:261` covers 79, 112 and 317. The source form of `:261` collides with `:266` and `:279` (Standards 1).
- 2: met, by reading. Input line 73 splits the list on spaces. `SKILL.md:199` makes that split no place of a path rule, so the input is another defect (`:218`), written with its result (`:222`) and not widened for (`:268`). This rests on the clause Spec 1 finds too broad for other defects.
- 3: met, by reading. With `part 4 links unchanged: ok` green, `SKILL.md:111` classes the part as not caught.
  - `:112` has the code that would produce the removal read along the red command's path after the red runs, which reaches input lines 430-438.
  - `:113-114` change the command to assert the removal where it happens (line 436's `pin: removed ...` output or an intermediate state), and `:115` makes the part red. The Done line `:133` requires the changed command's three runs and the parts list.
  - `:116` and Rules `:405` forbid "only removes links the new tag dropped" without the lines.
- 4: met, by reading. See `SKILL.md:116-117` and the template's "Lines read" and "Reproduced" columns.
- 5: partial, Spec 2.
  - Met part: a place found after the first change goes back (`:270`) and the second change may widen to it (`:272`).
  - Missing part: a place found after the second change, or one the second change does not reach, has no ending. The input is written not fixed (`:274`), but `:266` and the Done line `:279` ("none left unchanged") can never be met.
- 6: met, by reading. The rule "a user name is read without regard to letter case" follows from `:182`. The lookup in the lower-case-keyed map is a place by `:193`, found by reading forward from where the name is read (`:197`). There is a test case per place (`:248`) and a fix covering both. The "one change where the name is read" form hits Standards 1, and the form that changes each place does not.
- 7: met, by reading. A further place is defined at `:226`, its situations at `:227`, the place read after the fix at `:284`, and no test at `:253`. The text before and after is quoted by the Done lines of Steps 17 and 18.
- 8: met. The added lines hold no stop, wait or reply (the grep above exits 1), and the first "Rules" bullet is unchanged.
- 9: met. The numbering string is the same as on the base (above).

## 1. Spec

- `skills/diagnose/SKILL.md:199`: "An operation that breaks only a rule of the container, such as how a list is divided into values, is not a place of the defect."
  - What is wrong: the clause is absolute. It is right when the cause's rule is about the values a list holds, which is case 2. When the cause's rule is the container's own rule, the clause excludes exactly the operations that break the cause's rule. That contradicts the step's line ("an operation that breaks the same rule on the same value as the operation the cause names is part of the defect ... only an operation breaking another rule is another defect") and item 2 ("every operation of any kind ... that reads a value of that kind against that rule and breaks it"). The builder lists it as judgment call 1. The brief's case 2 asks for the classing only where "the split's rule is how the list is divided, not how a path is read".
  - Failure scenario: a diagnosis finds that a list of paths is split on spaces at one place, so the cause's rule at the kind of value is "a list of paths is divided only at newlines". A second operation splits the same list on spaces too. `:199` tells the run that this second split "is not a place of the defect", so the run classes it as another defect and fixes one split of two. That is the failure step 5 exists to end, moved to a list-valued kind.
  - The fix at landing is a qualifier, for example: "An operation that breaks only a rule of the container that holds the values, when the cause's rule is about the values, such as how a list is divided, is not a place of the defect."
  - Verdict: item 2 violated.
- `skills/diagnose/SKILL.md:266`, `:270-274` and `:279`: "A fix that leaves a place of the defect unchanged is not done.", "A place found only after the fix is made goes back through Steps 15 to 17.", "Its test case is run on the tree as the first change left it, and its failure quoted.", "The second change may widen the fix to that place." and the Done line "Done when the fix is in the tree the probes ran in at every place of the defect, none left unchanged, ...".
  - What is wrong, the count: item 8 asks for a late place to be handled "inside the count of two changes Steps 18 already sets". The text gives an ending at the count for an input (`:274`, written not fixed) but none for a place. A place found after the second change, for example by the runs of Steps 19, cannot be changed, since the count is spent, and still makes the step "not done" by `:266` and `:279`. Steps 18 then has two instructions that cannot both hold, and "Writing for an agent" in `docs/dev/skill-layout.md` requires a repeat to say what happens when its count is reached.
  - What is wrong, the return path: "goes back through Steps 15 to 17" pulls in Steps 15's "Run it on the tree without the fix and on the tree with the change of the probe" with "Undo that change as Steps 13 says", and Steps 17's "The tree is the one Steps 13 left, with every probe's change undone". The next bullet runs the test on "the tree as the first change left it". The text does not say which tree Steps 15's runs use on the way back, or that undoing does not apply to the fix.
  - Failure scenario: in the pin case, Steps 19's run of `CLAUDE_CONFIG_DIR="$HOME/.claude//"` after a second change shows line 79 is still a place nobody changed. The diagnosis agent either makes a third change, against the count, or ends with Steps 18 neither done nor stopped. The record then reads as a fix that covers every place when one is left.
  - The fix at landing: a place left unchanged after the second change is written in the record as not fixed with its inputs, named in the Cause section and the final message, and the Done line accepts it as written. The return path says Steps 15's runs on the way back are on the tree the first change left, and that Steps 13's undoing does not apply to the fix.
  - Verdict: item 8 violated; case 5 partial.

## 2. Proof

- `.scratch/2-f-diagnose/agents/reviews/5-report.md`, "DONE / NOT DONE", the character-set row: "`git ls-files -coz ... | xargs -0 perl -CSD -ne '...'` printed nothing, exit 0".
  - What is wrong: the brief's "Report" says "A line shortened with "..." is not verbatim", and this row quotes the check's command line shortened. My rerun of the full command printed nothing and exited 0, so the result holds, but the row is not the verbatim line the brief asked for.
  - Failure scenario: a reader auditing the booking cannot tell from the report which pattern the builder ran, for example whether the `\x{2705}` allowance for `.md` was in it.
  - Verdict: none.
- `.scratch/2-f-diagnose/agents/reviews/5-report.md`, "Lines over 20 words".
  - What is wrong: verify item 6 asks that "each new or changed list item and sentence" over 20 words be named with why it keeps its form. The section names the lines of `SKILL.md` and the template, but none of the three glossary entries the diff writes in `docs/glossary.md` and `plan-terms.md`.
  - My count over the added lines prints `148` for **other input**, `84` for **place, of a defect** and `54` for **right result, of an other input**. Split at sentence ends, **other input** holds sentences of 48 and 66 words.
  - Failure scenario: the 66-word class sentence (Standards 6) reaches landing without anyone having judged its form against prose-standard E.
  - Verdict: none.

## 3. Standards

- `skills/diagnose/SKILL.md:261` against `:266` and `:279`: "Where the places can share one change, the fix is that change: a helper every place calls, or one written form made at every source the values come from." against "A fix that leaves a place of the defect unchanged is not done." and "none left unchanged".
  - What is wrong: the source form of `:261` leaves the code at each place unchanged by design, since the values reach the places already in one written form. `:266` and `:279` then call that fix not done. That is two statements that say otherwise (`docs/dev/change-standard.md`, rule 19). Brief item 5 carries both sentences, and the builder wrote them as given.
  - Failure scenario: in case 1, a run that takes "one written form made at both sources" (lines 70-76 and 78-81), which the case allows, finds lines 112 and 317 textually unchanged and is told it is not done. It then adds redundant changes at 112 and 317, or reports the fix as not done. In case 6, "one change where the name is read" meets the same Done line.
  - The fix at landing: in `:266` and `:279`, "unchanged" becomes "still giving a wrong result", or "a place the fix does not reach".
  - Verdict: none (items 5 and the cases are met through the helper form).
- `skills/diagnose/SKILL.md:273` against `:267`: "The second change leaves every input not part of the defect as it was on the tree without the fix." against "Every input not part of the defect gives its right result, as it did on the tree without the fix."
  - What is wrong: `:267` was reworded so a change at a source may change an output that stays right. `:273`, which binds the second change that `:272` now lets widen to a place, keeps "as it was", which reads as the same output. The first and second change are held to different standards for the same class (`docs/dev/change-standard.md`, rule 19).
  - Failure scenario: a second change widens the fix by putting the skill folders in one written form at the sources. The not-part input `C/skills/`, right everywhere, is now listed as `C/skills` where the folders are shown. That is right under `:267` and a breach under `:273`, so the run drops the widening it was just allowed.
  - Verdict: none.
- `skills/diagnose/SKILL.md:268`: "An input of another defect is left out of the result, and the fix is not widened to make it right."
  - What is wrong: two requirements that can each be broken while the other holds, joined by "and" (`docs/dev/skill-layout.md`, "Lists and tables": one rule per bullet). An input can be left out of the result while the fix is widened for it, or kept in the result with no widening. `:271` ("Its test case is run on the tree as the first change left it, and its failure quoted.") joins a run and a quote the same way. The brief's Conventions repeat the one-rule rule.
  - Failure scenario: a reviewer of a later diff that drops "the fix is not widened" from the bullet cannot see a rule removed, since the bullet still reads as one rule.
  - Verdict: none.
- `skills/diagnose/SKILL.md:221`: "An input that is part of the defect breaks the cause's rule, so its failure costs what the defect's failure costs."
  - What is wrong: by the skill's own definition (`:193`) an operation breaks the rule and an input is wrong at a place, so the sentence's subject is wrong. "The defect's failure" is defined nowhere, while the places of one defect can fail in different ways: in the pin case, line 317 refuses and line 112 links agents into the wrong folder. Item 3 asked for line 196 to be reworded "so it holds for every place of the defect".
  - Failure scenario: a run takes `:221` as a test of membership and classes an input by whether it "breaks the cause's rule". For example, an unusual spelling that is right at every place gets put in part of the defect, against `:216-217`.
  - The sentence can read "An input that is part of the defect is wrong at a place of the defect, so its failure costs something whenever the reported input's does", or be cut, since `:247` already gives each such input a test case.
  - Verdict: none.
- `skills/diagnose/SKILL.md:197`, `:246` and `:120`: "Read forward from every place a value of the kind the rule is about is read or assembled ...", "write a test that reproduces the shrunk case at the place the defect occurs" and "a failing test at the place the defect occurs".
  - What is wrong: the diff adds the glossary term **place, of a defect**, and `docs/dev/skill-layout.md`, "Writing for an agent", says a defined term is used only in a sense the glossary defines. `:197` uses "place" for a source location in the same group of bullets that define places of the defect. `:246` and `:120` still speak of "the place the defect occurs" in the singular, where a defect now has several places.
  - Failure scenario: a run reading `:246` writes the test at the operation the cause names only. `:248` corrects this only for a reader who reaches it.
  - Verdict: none.
- `docs/glossary.md`, **other input** (same text in `skills/repo-setup/templates/plan-terms.md`): "Each is put in one of three classes: part of the defect, wrong on the tree without the fix at a place of the defect, also when it is wrong at an operation of another rule; not part of the defect, right on the tree without the fix; or another defect, wrong on the tree without the fix only at an operation that breaks another rule."
  - What is wrong: one 66-word sentence. Commas separate each class name from its definition and also sit inside the definitions (`skills/repo-setup/templates/docs/dev/prose-standard.md`, E, sentence length).
  - Failure scenario: a reader cannot tell whether "also when it is wrong at an operation of another rule" belongs to the definition of part of the defect or opens a fourth item. The Skill text at `SKILL.md:216-220` settles it, but the glossary is where a term is looked up.
  - Verdict: none.
- `skills/diagnose/templates/diagnosis.md:48`, the Reproduced cell: "yes, caught once the red command was changed to assert the part where it happens, with the changed command and its three runs quoted".
  - What is wrong: the cell asks for a command and three runs inside a Markdown table cell, which cannot hold a code block. The section's own "Red command" and "Runs" blocks (lines 24-34) hold "the one command" and its runs, and the template does not say whether they hold the original command or the changed one. Steps 4's Done line (`SKILL.md:133`) wants "the command, as changed ..., run and its output quoted".
  - Failure scenario: a diagnosis agent pastes three runs into the cell and breaks the table, or leaves the "Red command" block with the original command, which is no longer the red command, so Steps 5 and 6 tighten and shrink a command that does not catch the part.
  - Verdict: none.

## 4. Behaviour

- none. The builder's "Host- or user-visible changes" states each change to Steps 4, 15, 16, 18, 19, "Rules", the template and the glossary, with before and after.

## Declined to judge

- Whether step 5 keeps `diagnose` a minor raise. The brief's Decision 6 rules minor. `docs/dev/skill-layout.md`, "Frontmatter", calls a change major when, under the same inputs, a run's output is changed, and a run on a defect with a further place now gives a wider fix and a different record. The plan has already raised 2.0.0 to 2.1.0. Whether the plan's one raise should be major is the orchestrator's or Axel's call, not one a read of this diff settles.
- The builder's note on `skills/diagnose/SKILL.md:102`. The line naming `utils/pin.test.sh`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` is in the base text (`sed -n 102p` on the main checkout prints it) and outside this step's items, so leaving it is right under rule 20. The grep of `utils/pin\|ORDO_` over every other `skills/*/SKILL.md` prints nothing, and README's first paragraph says "The skills carry no project name and no path". This is a separate concern for the orchestrator, not a finding of this diff.
- The builder's first-run remark that input-tree lines 388-410 make the skill links. Those lines are not among the input-tree lines the brief quotes, and I did not open the input tree. No verdict rests on them.
- Whether the changed text wins or ties the blind comparison. That is the orchestrator's work after landing and Axel's call.
- The plan's whole verify list (`land.test.sh`, `check_config.test.sh`, `sync_rules.test.sh`, `pin.test.sh`). The brief and the change standard run it once, at landing on main.

Reviewer usage: a036114524a3a76dd, claude-opus-5-5, 196646 tokens, 36 tool uses, 8.7 minutes.
