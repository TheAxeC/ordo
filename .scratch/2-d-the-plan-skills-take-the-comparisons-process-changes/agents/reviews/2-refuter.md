# Step 2 refuter report (on .agents/worktrees/2d-2, base 544c20420c48429c183c3bf60fa9201f5d27c02a)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md   (worktree root)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 7 commands passed
exit 0

$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
386 skills/plan/SKILL.md
951 skills/refute/SKILL.md
630 skills/repo-setup/SKILL.md
647 skills/roadmap/SKILL.md
999 skills/spec/SKILL.md

$ LC_ALL=C grep -n '[^ -~]' skills/refute/SKILL.md skills/refute/templates/report.md skills/plan-retro/SKILL.md
(no output, exit 1)

$ git status --short
 M skills/plan-retro/SKILL.md
 M skills/refute/SKILL.md
 M skills/refute/templates/report.md
?? .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/2-report.md

Commands the builder's report quotes, rerun:
$ git show 544c204:skills/refute/SKILL.md | python3 -c '... len(description)'      -> 775   (first run on the unchanged tree: reproduced)
$ git show 544c204:skills/refute/SKILL.md | grep -n -i -E 'violated|not applicable|unmet|not verifiable|failure scenario|declined to judge|invokes no skill'   -> no output, exit 1; same for -w partial; same over the base report.md   (reproduced)
$ git grep -n -i 'four headings\|Spec, Proof\|Not checked' 544c204 -- skills/land skills/plan-orchestration   -> no output, exit 1   (premise reproduced)
$ wc -l (now) 162 / 62 / 113; base 145 / 46 / 113; git diff --numstat 544c204: 25 8 refute/SKILL.md, 23 7 report.md, 2 2 plan-retro   (reproduced)
$ grep -c 'failure scenario:' skills/refute/templates/report.md   -> 5   (reproduced)
$ grep -n '^#' skills/refute/templates/report.md   -> Verification 5, Verdicts 12, 1. Spec 22, 2. Proof 26, 3. Standards 30, 4. Behaviour 34, Declined to judge 38, Repair round 44, ### Verdicts 50, ### Findings 54, Closed 60   (reproduced)
$ grep -n '^#' .../agents/reviews/1-refuter.md   -> Verification, 1. Spec, 2. Proof, 3. Standards, 4. Behaviour, Not checked, Repair round 1, refuted, ### Round items, ### Spec, ### Proof, ### Standards, ### Behaviour, ### Not checked, Closed   (old form, as the builder says)
$ grep -n -w <each ruled term> skills/refute/SKILL.md skills/refute/templates/report.md   -> holds 3,118 / report 16; violated 3,119,126 / report 16,24,28,32,36,56; not applicable 3,120 / 16; met 3,122 / 20; partial 3,123,126 / 20,...; unmet 3,124,126 / 20,...; not verifiable 3,125 / 20; failure scenario 3,10,57,113 / 24,28,32,36,56; Declined to judge 58,154 / 38; "invokes no skill and starts no agent" 160   (reproduced)
$ git diff -U0 544c204 | grep '^+' | grep -n -E '[^ |] - |--|[^ -~]'   -> no output, exit 1   (reproduced)
$ git diff -U0 544c204 | grep '^+' | grep -n -i -E '\bwas\b|no longer|formerly|previously|instead of|replaces|old '   -> no output, exit 1   (no history words added)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `skills/refute/SKILL.md`, Rules, third bullet: "The reviewer invokes no skill and starts no agent: it reads the inputs "What it reads" lists, runs the commands this skill names, and writes its report itself." It names the behaviour to do instead, as "Writing for an agent" first bullet asks.
- 2: holds. "The verdicts" sits after "The four headings" (`## The four headings` at 83, `## The verdicts` at 115), with the Items list (holds / violated / not applicable), the Cases list (met / partial / unmet / not verifiable), the tie between a violated/partial/unmet verdict and a finding, and the repair-round rule, each worded as the item asks. Steps 5 and Steps 6 both name "The verdicts".
- 3: holds. "The four headings", last bullet: "Each finding, under any of the four headings, carries its failure scenario: the concrete input or state and the wrong result it gives, or, for a finding in text, the reader and what the text leads them to do wrong."
- 4: holds. Steps 6 has the "Declined to judge" bullet with the brief's wording, and the Anti-patterns row's Do instead cell reads "Name it under "Declined to judge" with the reason, as Steps 6 says". `grep -n -i 'not checked'` over the refute skill and template prints nothing.
- 5: holds. The template has `## Verdicts` after Verification with the two lists. `failure scenario:` is on all 5 finding lines (4 headings and the round). `## Declined to judge` replaces `## Not checked`. The round section has `### Verdicts`. The added `verdict:` field and the `### Findings` subheading serve item 2's "name each other" and keep the round's findings out of the Verdicts list. The builder lists both as judgment calls 3 and 4. See Standards 1 for a mismatch between these finding lines and Steps 6.
- 6: holds. The description names both vocabularies, the four headings and the failure scenario. The length command prints `951 skills/refute/SKILL.md`, and `version: "1.7.0"`.
- 7: holds. The fourth bullet of "Grouping" now lists "the Verification, Verdicts, Declined to judge, Not checked, Closed, Closures and Usage lists, and fenced lines". It states no history, and `version: "1.2.1"` (base "1.2.0").

Cases of the brief's "Cases":

- The length command prints at most 1,024 for `skills/refute/SKILL.md` (775 on the unchanged tree): met. It prints 951 now and 775 at the base, both rerun above.
- A reader finds each ruled term in the new SKILL.md and template: met. The `grep -n -w` output above finds both vocabularies word for word, "failure scenario", "Declined to judge" and the rule on skills and agents. The same terms grepped at the base print nothing.
- `/plan-retro`'s fourth bullet over a report in the new form keeps the findings and sets aside the Verdicts and Declined to judge lists: met, checked by reading.
  - `1-refuter.md` is in the old form (its `^#` headings above), so the new form was read from the new template and from this report. Under the bullet, the items under 1. Spec to 4. Behaviour are kept, including this report's Standards 1. The `## Verdicts` and `## Declined to judge` lists and the fence are set aside. In a round, the `### Verdicts` list is set aside and the items under `### Findings` are kept as "items of a repair round". The clause "the list before a round's subheadings when one of them is Spec, ..." does not fire, since the new round's subheadings are Verdicts and Findings.
  - Over `1-refuter.md`, the bullet still sets aside both "Not checked" lists, since "Not checked" stays in the bullet.
  - No script parses the report's headings. `git ls-files | grep -i -E 'collect|findings'` finds only `.scratch/comparison-2026-09-28/findings-by-cause.md`, `skills/plan-retro/templates/` holds only `retro.md`, and `git grep -l -i refuter -- '*.sh' '*.py'` prints nothing. `skills/plan-retro/templates/collect_findings.py` does not exist, so no script can misread the new "Verdicts", "Declined to judge" or level-3 "Findings" sections. The headings are read only by the session, under the bullet.

## 1. Spec

- none.

## 2. Proof

- none. Every count, path and output the builder's report quotes was rerun and reproduced (block above).

## 3. Standards

- 1. `skills/refute/SKILL.md:57` against `skills/refute/templates/report.md:28`, `:32`, `:36` (also `:24`, `:56`). Rule broken: `docs/dev/change-standard.md`, rule 19, "A change leaves no two statements that contradict each other". The diff rewrote both of these lines, and they still disagree on what a finding carries.
  - Steps 6 (line 57) reads: "each finding with its place (a file and a line in code, a page and its section in a page), the quoted hunk, what is wrong and its failure scenario".
  - The template's finding lines, all rewritten by this diff, carry no slot for the quoted hunk: `- <file:line, or page and section>: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>; failure scenario: <...>; verdict: <...>. Or: none.` (Proof). The Standards line is `<the rule broken, with the standard's file and rule>; failure scenario: ...`, and the Behaviour line has no place and no hunk.
  - The mismatch exists at the base as well. The diff rewrote both statements in this step and did not reconcile them or report them as a stop.
  - Failure scenario: a reviewer who fills `templates/report.md` line by line, as Steps 6 tells it to, writes Proof, Standards and Behaviour findings without the quoted hunk. The builder in a repair round, or the orchestrator at landing, then has to find the text again from a place alone, and a finding in a page (cited by section, with no line number, under the template's own first paragraph) cannot be located exactly.
  - Verdict: none. Item 5's text holds (it asks only for the failure scenario on these lines).

## 4. Behaviour

- none. The builder's "User-visible changes" table states each change (the report form, the reviewer rule, the description and Quick start, `/plan-retro`'s set-aside list, the versions), with before and after.

## Declined to judge

- The Rules bullet joins two prohibitions ("invokes no skill and starts no agent") in one bullet. `docs/dev/skill-layout.md`, "Lists and tables", asks for one requirement per bullet when each can be broken while the other holds, and these two can be. The brief's item 1 dictates one bullet and ruling 2 states it as one rule, so splitting it is the orchestrator's or the user's call, not the builder's.
- The three "Doc text" sentences the builder lists, `README.md:18`, `README.md:35` and `skills/plan-help/SKILL.md:57` ("writes findings"), are incomplete after the change but not false. Correcting them lies outside the step's path list, so whether they are fixed at landing is the orchestrator's call. `git grep` over `skills`, `docs`, `README.md`, `utils` and `CLAUDE.md` finds no other sentence the diff makes false: `skills/land/SKILL.md` names only the Closed heading, `plan-orchestration` names no report heading, and `docs/roadmap.md` lines 22 and 162 to 163 describe the new form.
- The repair-round section of the template has no "Declined to judge" list, although the time-box rule (Rules, last bullet) and the Anti-patterns row "An unchecked point" apply to every run. `1-refuter.md`'s round carried a `### Not checked` list for that reason. The gap exists at the base, and no item of this brief asks for the list, so adding it is the orchestrator's call under change-standard rule 20.
- Semicolon density (prose standard, "B. Punctuation"): the added semicolons (23 in `+` lines, 4 in `-` lines) are in list-item terminators and template placeholder rows, which I read as data rows rather than running prose. The body's running-prose semicolons went down: Steps 6 lost its parenthesis of two. The one mid-sentence semicolon added is in the description, where it separates the two verdict vocabularies. Whether list terminators count as running prose is a reading of the standard that the standard does not settle.
- Whether the verdict form serves the user better than the old form is the user's reading at the gate, and a read and a rerun cannot settle it.

Reviewer usage: claude:opus, a fresh agent; 114631 tokens, 23 tool uses, 264 s (from the completion notice). Saved by the orchestrator from the reviewer's final message.
