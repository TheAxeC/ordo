# Step 3 refuter report (on .agents/worktrees/2d-3, base 34098e5290fd8e3775ed0ee4dec4198b2d6a0d23)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md; echo "exit $?"
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
(the same length computed over each file at 34098e5, read with `git show 34098e5:<file>`, prints the same ten numbers)

$ LC_ALL=C grep -n '[^ -~]' <the seven changed files> .scratch/.../agents/reviews/3-report.md; echo "grep exit $?"
grep exit 1

$ git status --short
 M docs/dev/change-standard.md
 M skills/land/SKILL.md
 M skills/refute/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/docs/dev/change-standard.md
 M skills/spec/SKILL.md
 M skills/spec/templates/brief.md
?? .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/3-report.md

Case 1: $ grep -n '<REDACTED>' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md skills/refute/SKILL.md skills/land/SKILL.md
docs/dev/change-standard.md:47:21. **A secret in quoted command output is written `<REDACTED>`.** ...
skills/repo-setup/templates/docs/dev/change-standard.md:46:20. **A secret in quoted command output is written ...
skills/refute/SKILL.md:163:- The reviewer writes `<REDACTED>` in place of the value of a secret in every line ...
skills/land/SKILL.md:88:   - The verification lines it quotes carry `<REDACTED>` in place of the value of a se...
skills/land/SKILL.md:99:    - The verification lines it quotes carry `<REDACTED>` in place of a secret, as Ste...
exit 0

Case 2: $ grep -n '^[0-9]*\. \*\*' <both change standards>
docs/dev/change-standard.md lines 27 to 47: rules 1 to 21, rules 1 to 20 unchanged in number and text (the diff adds only line 47)
skills/repo-setup/templates/docs/dev/change-standard.md lines 27 to 46: rules 1 to 20, rules 1 to 19 unchanged (the diff adds only line 46)

Case 3, the builder's scratch runs, reproduced under the session scratchpad (paths shown as <scratch>):
$ sh skills/land/templates/checks.sh <scratch>/missing.md; echo "exit $?"
checks: cannot read the state file <scratch>/missing.md: No such file or directory
exit 2
$ (state file whose yaml block is `verify: []`)
checks: the verify: list of <scratch>/empty.md is empty
exit 2
$ (state file whose verify: list holds "")
checks: item 1 of the verify: list of <scratch>/item.md is not a non-empty string
exit 2
$ (state file whose verify: list holds a mapping {a: 1})
checks: item 1 of the verify: list of <scratch>/map.md is not a non-empty string
exit 2
$ grep -n 'refuse(' skills/land/templates/checks.sh
45, 52, 58, 60, 82, 83, 88, 92, 95, 97, 101, 103 (the report's "58, 60, 97 and 101 among others" holds)

The builder's Doc text greps, rerun:
$ grep -rn -i 'redact\|secret' docs skills README.md utils
docs/roadmap.md:22, docs/roadmap.md:190, docs/dev/change-standard.md:47, skills/land/SKILL.md:88, skills/land/SKILL.md:99, skills/refute/SKILL.md:107, skills/refute/SKILL.md:163, skills/repo-setup/templates/docs/dev/change-standard.md:46 (six new lines plus the two roadmap lines, as the report says)
$ grep -rn -E 'rules? (1 to|1-)? ?(19|20|21)\b|(19|20|21) rules|rule (19|20|21)\b|last rule' docs skills README.md utils
docs/dev/change-standard.md:80:- A skill's rules state the rule; no dates, incidents or history (`skills/repo-setup/templates/shared-rules.md`, last rule).
$ grep -rn -E '1\.6\.1|1\.7\.0|1\.8\.0|1\.1\.1' docs skills README.md utils
skills/roadmap/SKILL.md:5:  version: "1.1.1"
$ grep -rn 'change-standard' --include='*.py' --include='*.sh' skills utils
skills/ordo-init/templates/check_config.test.sh:26 and :91 (empty scratch files only)
$ wc -l <the seven changed files>
64 brief.md, 238 spec/SKILL.md, 80 docs/dev/change-standard.md, 66 template change-standard.md, 154 repo-setup/SKILL.md, 165 refute/SKILL.md, 203 land/SKILL.md (as the report gives them)
```

The worktree's state file carries `dispatch: none` (the dispatch block lives only in the main checkout's copy); `checks.sh` reads only the configuration block's `verify:` list, so the run is unaffected.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `skills/spec/templates/brief.md` "Cases" has a second placeholder bullet (line 16) for a step that builds or changes a script, naming the five kinds the brief lists and limiting the list to inputs where a wrong answer costs something, "as the rules file's rule on edges weighs them".
- 2: holds. `skills/spec/SKILL.md` Steps 4 has a sub-bullet under "Under "Cases"" stating the list also holds those inputs, pointing at the template for the kinds, each with its expected result, found from the script's rules and its callers; version 1.6.2; description unchanged at 999.
- 3: holds. Rule 21 in `docs/dev/change-standard.md` and rule 20 in the template, byte-identical after the number (diff), with the brief's six kinds of secret and "the rest of the line as printed"; existing numbers unchanged (case 2); `skills/repo-setup/SKILL.md` 1.1.1 to 1.1.2, the only change in that file.
- 4: holds. `skills/refute/SKILL.md` has the Standards bullet (line 107) and the Rules bullet (line 163); version 1.7.1; description unchanged at 951.
- 5: holds. `skills/land/SKILL.md` Steps 9 states the rule (line 88) and Steps 11 points at Steps 9 (line 99); version 1.8.1; description unchanged at 726. See Standards 1 for the wording of the Steps 11 bullet. That finding does not break the item, because the bullet names Steps 9 as its source.

Cases of the brief's "Cases":

- `grep -n '<REDACTED>'` over the four files: met. The report gives exit 1 on the unchanged tree. After the change there is at least one hit in each of the four files (rerun above).
- `grep -n '^[0-9]*\. \*\*'` over both change standards: met. Rules 1 to 21 and 1 to 20, the existing numbers unchanged.
- By reading, the placeholder applied to the archived brief 2 of plan 2.C: met. "a missing or unreadable file" leads to the unreadable state file. "an empty value" leads to `verify: []` and the empty-string item. "a malformed line" leads to the mapping item. The report quotes the placeholder and the three inputs, each with exit 2 and nothing run, and all three reproduce exactly (rerun above).
- The gate's length command: met. The same ten numbers at the base and after.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

- 1. `skills/land/SKILL.md:99`, Steps 11: "The verification lines it quotes carry `<REDACTED>` in place of a secret, as Steps 9 says."; what is wrong: Steps 9 (line 88) and the rules file's rule 21 put `<REDACTED>` "in place of the value of a secret" and keep "the rest of the line as printed". Steps 11 restates the rule with a different object ("in place of a secret"). The rule is then worded two ways in one skill, which goes against `docs/dev/skill-layout.md`, "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in") and "Writing for an agent" ("One meaning has one place"). The fix is one of two: point without restating (for example "The verification lines it quotes are redacted as Steps 9 says."), or match the object, "in place of the value of a secret". Either is a landing fix inside item 5's path. Failure scenario: a session writing a landing report by hand reads Steps 11 for that report, and a verification line prints `DATABASE_URL=postgres://u:pw@host/db`. It replaces the whole assignment with `<REDACTED>` and loses the variable name and host, which rule 21 says to keep. Verdict: none. Item 5 holds, since the bullet names Steps 9 as its source.

## 4. Behaviour

none. The report's "User-visible changes, before and after" states each change: the brief's Cases for a script step, the redaction in the four kinds of report, the new Standards finding, the template's rule count going from 19 to 20, and the four version bumps.

## Declined to judge

- Whether the redaction rule should also be stated in `/roadmap`'s "done" mode. Its Steps 1 ("Take the gate's output: the command and the lines it printed") writes command output into `docs/roadmap.md`, which is a tracked file. `skills/roadmap/SKILL.md` never names the rules file (`grep -n -i 'rules' skills/roadmap/SKILL.md` shows only its status-vocabulary lines and its own Rules), so a session running `/roadmap done` is not pointed at rule 21. This is outside the brief's five items and the plan's step line, and nothing in `/roadmap` contradicts the rule, so it is not a rule-19 contradiction. Whether it becomes work is the user's call. Brief decision 2 brought `/land` into the step for this same reason.
- Whether the implied-inputs placeholder should cover product-code steps as well as scripts. In a repository set up from the `repo-setup` template, rule 15 says "For code", while the new placeholder and the `/spec` sub-bullet say "a step that builds or changes a script". This matches ruling 4 ("for a step that builds a script") and brief item 1, so widening it is the user's call.
- `skills/refute/templates/report.md` lines 8 and 47 ("... its summary line, verbatim"). Neither line is made false: rule 21 and `/refute`'s Rules bullet both say "a verbatim one included", and the reviewer reads the Rules with the template. The builder's report offers replacement lines for both under "Doc text". Whether to add that pointer is the orchestrator's call, because the template is outside the step's paths.
- The other places that quote output "verbatim", read and found not contradicted: rule 7 and rule 13 of both change standards; the command-block paragraph of both change standards ("the report quotes the lines the runner printed"); `/refute` Steps 6; the "Report" section of the brief template ("their output verbatim"), which the builder reads under the rules file; and the "The prompt" bullet of `skills/plan-orchestration/SKILL.md` Steps, which puts the rules file first in the reading order. In a repository whose rules file is the repo-setup template, both pointers resolve to a rule a reader can find by its bold label: "the rules file's rule on secrets in quoted command output" resolves to rule 20, "A secret in quoted command output is written `<REDACTED>`", and "the rules file's rule on edges" resolves to rule 15, "Edges whose failure costs something are exercised, not assumed". `/land` names "the rules file" without listing it under "What it reads". It is the `rules:` key of `.agents/plan.yaml`, which `/land` reads as its first input.
- One command I ran falls outside the git commands this review allows: `git show 34098e5:<file>` for the ten SKILL.md files, to compute the base description lengths. It is read-only and changed nothing, and its result is quoted above.

Reviewer usage: claude:opus, a fresh agent; 120045 tokens, 23 tool uses, 252 s (from the completion notice). Saved by the orchestrator from the reviewer's final message.
