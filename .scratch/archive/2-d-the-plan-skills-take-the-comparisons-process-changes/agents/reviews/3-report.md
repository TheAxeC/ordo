# Report: step 3, briefs name the inputs a script step implies, and secrets are written `<REDACTED>`

Everything in the brief is done.

## Open items of the state file, verbatim

From `sed -n '/^## Open items/,/^## Closed/p'` over the state file in the main checkout:

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

None.
```

## First run, on the unchanged tree (worktree at 34098e5, clean per `git status`)

| Case | Command or reading | Result on the unchanged tree |
|---|---|---|
| 1 | `grep -n '<REDACTED>' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md skills/refute/SKILL.md skills/land/SKILL.md` | nothing printed, `exit 1`, as the brief expects before |
| 2 | `grep -n '^[0-9]*\. \*\*' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md` | rules 1 to 20 in `docs/dev/change-standard.md` (lines 27 to 46), rules 1 to 19 in the template (lines 27 to 45) |
| 3 | By reading `skills/spec/templates/brief.md` "Cases" against `.scratch/archive/2-c-scripts-compute-facts-and-writing-is-removed/agents/briefs/2.md` "Cases" | The one placeholder asks only for "every must-pass and must-refuse example this brief gives". The archived brief's Cases list the test files, revert proofs and greps, and none of the three inputs `checks.sh` refuses (`grep -n 'refuse(' skills/land/templates/checks.sh` prints lines 58, 60, 97 and 101 among others). A brief writer following the old placeholder is not led to them. |
| 4 | the gate's length command | `726 land`, `632 ordo-init`, `386 plan-help`, `788 plan-orchestration`, `616 plan-retro`, `386 plan`, `951 refute`, `630 repo-setup`, `647 roadmap`, `999 spec` |

Premises of "What is on the tree", rerun: `wc -l skills/spec/templates/brief.md` printed `63`; `grep -n -i 'redact\|secret'` over both change standards printed nothing (exit 1); `grep -rn -i 'redact\|secret' skills/refute skills/land` printed nothing (exit 1); the versions read 1.6.1 (spec), 1.7.0 (refute), 1.8.0 (land), 1.1.1 (repo-setup). All hold. One observation on the premise about `/land` Steps 11: its text names no verification lines explicitly (it lists "the check of Steps 1 with what it showed, anything NOT DONE, what landed with the commit, what was found"), but the landing reports quote them (`grep -ln 'commands passed'` over the landing reports lists `1-landing.md` and `2-landing.md` of this plan and those of 2.B). Item 5 is built as the brief says.

No case showed a rule of the brief wrong.

## New and changed text, old beside new

### 1. `skills/spec/templates/brief.md`, "Cases"

Old (line 15, the only bullet):

```
- <every must-pass and must-refuse example this brief gives, in one list: the input, then its expected result>.
```

New (line 15 unchanged, line 16 added):

```
- <every must-pass and must-refuse example this brief gives, in one list: the input, then its expected result>.
- <for a step that builds or changes a script, each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path), with its expected result; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>.
```

Case 3, applied: a brief writer reading this placeholder for the archived brief 2 (which built `skills/land/templates/checks.sh`) would add these three inputs to its Cases, each from a kind the placeholder names, with the expected result taken from the script's rules (exit 2 is "refused before running anything"):

- `sh skills/land/templates/checks.sh <a state file that does not exist or cannot be read>` (a missing or unreadable file): a `checks: ` refusal on standard error, exit 2, no command run.
- a state file whose first yaml block holds `verify: []` (an empty value): a refusal, exit 2, no command run.
- a state file whose `verify:` list holds an item that is not a non-empty string, such as `""` or a mapping (an empty value, a malformed line): a refusal, exit 2, no command run.

Each costs something when wrong: a list that cannot be read or holds nothing would otherwise pass a landing with nothing checked. The three expected results were observed on scratch files under the session scratchpad with `sh skills/land/templates/checks.sh <file>; echo "exit $?"`:

```
checks: cannot read the state file <scratch>/missing.md: No such file or directory
exit 2
checks: the verify: list of <scratch>/empty.md is empty
exit 2
checks: item 1 of the verify: list of <scratch>/item.md is not a non-empty string
exit 2
```

### 2. `skills/spec/SKILL.md`, Steps 4

Old: `metadata.version: "1.6.1"`, and the bullet at line 94 (`   - Under "Cases", every must-pass and must-refuse example the step's text gives, ...`) with no sub-bullet.

New: `metadata.version: "1.6.2"`; line 94 unchanged; a sub-bullet added under it at line 95:

```
     - For a step that builds or changes a script, the list also holds the inputs the step's text implies but never states, as `templates/brief.md`'s "Cases" names them, each with its expected result, found by the session writing the brief from the script's rules and its callers.
```

The kinds and the limit are stated once, in the template, and this bullet points at it. The description is unchanged (999 characters before and after).

### 3. The two change standards and `skills/repo-setup/SKILL.md`

Old: `docs/dev/change-standard.md` ends its rules at 20 ("Nothing is changed that no brief item asks for"); the template ends at 19 (the same rule). Neither names a secret.

New: `docs/dev/change-standard.md` line 47, rule 21:

```
21. **A secret in quoted command output is written `<REDACTED>`.** Every quote of a command's output, a verbatim one included, carries `<REDACTED>` in place of the value of a secret in it (a password, an API key, an access token, a private key, a session cookie, a credential inside a URL or a connection string), and keeps the rest of the line as printed.
```

`skills/repo-setup/templates/docs/dev/change-standard.md` line 46, rule 20, the same text after the number:

```
20. **A secret in quoted command output is written `<REDACTED>`.** Every quote of a command's output, a verbatim one included, carries `<REDACTED>` in place of the value of a secret in it (a password, an API key, an access token, a private key, a session cookie, a credential inside a URL or a connection string), and keeps the rest of the line as printed.
```

The clause "a verbatim one included" is there because rule 13 of both pages asks for failing output "verbatim"; with it the two rules do not contradict each other (rule 19 of Ordo's page, 18 of the template's). The existing rules keep their numbers (case 2 below). `skills/repo-setup/SKILL.md` `metadata.version`: `"1.1.1"` to `"1.1.2"`.

### 4. `skills/refute/SKILL.md`

Old: `metadata.version: "1.7.0"`; Standards list with no secret bullet; Rules with no redaction bullet.

New: `metadata.version: "1.7.1"`; in "The four headings", Standards, after "non-ASCII;" (line 107):

```
  - a secret left unredacted in a line the builder's report quotes, under the rules file's rule on secrets in quoted command output;
```

In Rules, after "The reviewer starts no agent" (line 163):

```
- The reviewer writes `<REDACTED>` in place of the value of a secret in every line it quotes, a verbatim one included, as the rules file's rule on secrets in quoted command output says.
```

"a verbatim one included" covers Steps 6's "The verification lines first, verbatim." The description is unchanged (951 before and after).

### 5. `skills/land/SKILL.md`, Steps 9 and Steps 11

Old: `metadata.version: "1.8.0"`; Steps 9 and Steps 11 say nothing of secrets.

New: `metadata.version: "1.8.1"`; Steps 9, sub-bullet at line 88, where the rule is said:

```
   - The verification lines it quotes carry `<REDACTED>` in place of the value of a secret, as the rules file's rule on secrets in quoted command output says.
```

Steps 11, sub-bullet at line 99, pointing at Steps 9:

```
    - The verification lines it quotes carry `<REDACTED>` in place of a secret, as Steps 9 says.
```

The description is unchanged (726 before and after).

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1 brief template, second "Cases" placeholder | DONE | `git diff skills/spec/templates/brief.md`: one line added after line 15, quoted above |
| 2 `/spec` Steps 4, version 1.6.2, description unchanged | DONE | `git diff skills/spec/SKILL.md`: version line and line 95; length command prints `999 skills/spec/SKILL.md` before and after |
| 3 rule 21 and rule 20, same text, numbers kept, repo-setup 1.1.2 | DONE | case 1 and case 2 output below; `sed -n 5p skills/repo-setup/SKILL.md` prints `  version: "1.1.2"` |
| 4 `/refute` Rules bullet, Standards bullet, version 1.7.1, description unchanged | DONE | `git diff skills/refute/SKILL.md`; length `951` before and after |
| 5 `/land` Steps 9 and 11, said once and pointed at, version 1.8.1, description unchanged | DONE | `git diff skills/land/SKILL.md`; length `726` before and after |
| Case 1 | met | output below |
| Case 2 | met | output below |
| Case 3 | met, by reading | placeholder and the three inputs quoted under item 1 |
| Case 4 | met | same ten numbers before and after |
| Verify 1: checks.sh | DONE | output below |
| Verify 2: length command | DONE | output below |
| Verify 3: non-ASCII over changed files | DONE | output below |

Case 1, after:

```
$ grep -n '<REDACTED>' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md skills/refute/SKILL.md skills/land/SKILL.md | cut -c1-110
docs/dev/change-standard.md:47:21. **A secret in quoted command output is written `<REDACTED>`.** Every quote 
skills/repo-setup/templates/docs/dev/change-standard.md:46:20. **A secret in quoted command output is written 
skills/refute/SKILL.md:163:- The reviewer writes `<REDACTED>` in place of the value of a secret in every line 
skills/land/SKILL.md:88:   - The verification lines it quotes carry `<REDACTED>` in place of the value of a se
skills/land/SKILL.md:99:    - The verification lines it quotes carry `<REDACTED>` in place of a secret, as Ste
exit 0
```

Case 2, after (the bold label of each rule, cut at its closing `**`):

```
docs/dev/change-standard.md:27:1. **A defect in a script begins with a test that fails on the tree as it is.
docs/dev/change-standard.md:28:2. **A guard is not a fix.
docs/dev/change-standard.md:29:3. **A check that goes red is a design fact, never a number to get under.
docs/dev/change-standard.md:30:4. **The brief's fix text is the specification.
docs/dev/change-standard.md:31:5. **Every user-visible surface changed is documented in the same step
docs/dev/change-standard.md:32:6. **Verification runs the verify list and every check, over the whole tree
docs/dev/change-standard.md:33:7. **The report states the end state only.
docs/dev/change-standard.md:34:8. **A test is not a user.
docs/dev/change-standard.md:35:9. **A test never asserts a known defect, and no check is loosened to pass.
docs/dev/change-standard.md:36:10. **No history in code or comments.
docs/dev/change-standard.md:37:11. **Nothing added on a hypothesis.
docs/dev/change-standard.md:38:12. **Nothing inside the brief is left undone.
docs/dev/change-standard.md:39:13. **A test proves the change by failing without it, and the report quotes the red.
docs/dev/change-standard.md:40:14. **A change carries to every place that names it.
docs/dev/change-standard.md:41:15. **Edges whose failure costs something are exercised, not assumed.
docs/dev/change-standard.md:42:16. **A write verifies its own result.
docs/dev/change-standard.md:43:17. **A rewrite keeps the meaning of every rule it carries.
docs/dev/change-standard.md:44:18. **A map from old text to new places names one rule per row and a place that states it.
docs/dev/change-standard.md:45:19. **A change leaves no two statements that contradict each other.
docs/dev/change-standard.md:46:20. **Nothing is changed that no brief item asks for.
docs/dev/change-standard.md:47:21. **A secret in quoted command output is written `<REDACTED>`.
skills/repo-setup/templates/docs/dev/change-standard.md:27:1. **A defect in code begins with a test that fails on the tree as it is.
skills/repo-setup/templates/docs/dev/change-standard.md:28:2. **A guard is not a fix.
skills/repo-setup/templates/docs/dev/change-standard.md:29:3. **A check that goes red is a design fact, never a number to get under.
skills/repo-setup/templates/docs/dev/change-standard.md:30:4. **The brief's fix text is the specification.
skills/repo-setup/templates/docs/dev/change-standard.md:31:5. **Every user-visible surface changed is documented in the same step
skills/repo-setup/templates/docs/dev/change-standard.md:32:6. **Verification runs the verify list and every check, over the whole tree
skills/repo-setup/templates/docs/dev/change-standard.md:33:7. **The report states the end state only.
skills/repo-setup/templates/docs/dev/change-standard.md:34:8. **A test is not a user.
skills/repo-setup/templates/docs/dev/change-standard.md:35:9. **A test never asserts a known defect, and no check is loosened to pass.
skills/repo-setup/templates/docs/dev/change-standard.md:36:10. **No history in code or comments.
skills/repo-setup/templates/docs/dev/change-standard.md:37:11. **Nothing added on a hypothesis.
skills/repo-setup/templates/docs/dev/change-standard.md:38:12. **Nothing inside the brief is left undone.
skills/repo-setup/templates/docs/dev/change-standard.md:39:13. **A test proves the change by failing without it, and the report quotes the red.
skills/repo-setup/templates/docs/dev/change-standard.md:40:14. **A change carries to every place that names it.
skills/repo-setup/templates/docs/dev/change-standard.md:41:15. **Edges whose failure costs something are exercised, not assumed.
skills/repo-setup/templates/docs/dev/change-standard.md:42:16. **A write verifies its own result.
skills/repo-setup/templates/docs/dev/change-standard.md:43:17. **A rewrite keeps the meaning of every rule it carries.
skills/repo-setup/templates/docs/dev/change-standard.md:44:18. **A change leaves no two statements that contradict each other.
skills/repo-setup/templates/docs/dev/change-standard.md:45:19. **Nothing is changed that no brief item asks for.
skills/repo-setup/templates/docs/dev/change-standard.md:46:20. **A secret in quoted command output is written `<REDACTED>`.
```

Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md; echo "exit $?"`:

```
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
exit 0
```

Verify 2, the gate's length command, after:

```
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
```

The same ten numbers as the first run.

Verify 3, `LC_ALL=C grep -n '[^ -~]'` over the seven changed files and this report: nothing printed, `exit 1`.

## Files and line counts

`wc -l` after, and `git diff --stat`:

```
      64 skills/spec/templates/brief.md
     238 skills/spec/SKILL.md
      80 docs/dev/change-standard.md
      66 skills/repo-setup/templates/docs/dev/change-standard.md
     154 skills/repo-setup/SKILL.md
     165 skills/refute/SKILL.md
     203 skills/land/SKILL.md
```

```
 docs/dev/change-standard.md                             | 1 +
 skills/land/SKILL.md                                    | 4 +++-
 skills/refute/SKILL.md                                  | 4 +++-
 skills/repo-setup/SKILL.md                              | 2 +-
 skills/repo-setup/templates/docs/dev/change-standard.md | 1 +
 skills/spec/SKILL.md                                    | 3 ++-
 skills/spec/templates/brief.md                          | 1 +
 7 files changed, 12 insertions(+), 4 deletions(-)
```

No test is new or changed: every change is text, fixed by reading under the rules file's rule 1.

## Judgment calls

None the brief left open. Wording choices inside the brief's items: the phrase "a verbatim one included" in the rule and in `/refute`'s Rules bullet, so the new rule does not contradict rule 13's "verbatim" or `/refute` Steps 6's "verbatim"; `/spec`'s bullet points at the template for the kinds and the limit, so they are stated once.

## User-visible changes, before and after

- A brief written by `/spec` for a script step: before, its Cases hold only the examples the step's text gives; after, they also hold the implied inputs, each with its expected result.
- A builder's report, a refuter report, a booking and a landing report: before, command output is quoted as printed, secrets included; after, a secret's value is written `<REDACTED>`, the rest of the line as printed.
- A refuter report: before, an unredacted secret in the builder's report is no finding; after, it is a Standards finding.
- A repository set up by `/repo-setup`: before, its change standard has 19 rules; after, 20.
- Skill versions: spec 1.6.1 to 1.6.2, refute 1.7.0 to 1.7.1, land 1.8.0 to 1.8.1, repo-setup 1.1.1 to 1.1.2.

## Doc text

Greps run over `docs/`, `skills/`, `README.md` and `utils/` after the change:

- `grep -rn -E 'rules? (1 to|1-)? ?(19|20|21)\b|(19|20|21) rules|rule (19|20|21)\b|last rule'`: one hit, `docs/dev/change-standard.md:80:- A skill's rules state the rule; no dates, incidents or history (`skills/repo-setup/templates/shared-rules.md`, last rule).`, which names the last rule of `shared-rules.md`, a file this step does not touch; it stays true.
- `grep -rn -i 'twenty\|nineteen\|twenty-one'`: nothing, exit 1.
- `grep -rn -E '1\.6\.1|1\.7\.0|1\.8\.0|1\.1\.1'`: one hit, `skills/roadmap/SKILL.md:5:  version: "1.1.1"`, the roadmap skill's own version; unrelated.
- `grep -rn -i 'must-pass\|must-refuse'`: `skills/spec/SKILL.md:94` and `skills/spec/templates/brief.md:15`, the two places this step extends; both still true, since the first bullet of each is unchanged and the second is added beside it.
- `grep -rn -i 'redact\|secret'`: the six new lines, and `docs/roadmap.md:22` (entry 2.D's goal, "secrets in quoted command output are written `<REDACTED>`", now true) and `docs/roadmap.md:190` (the `wizard` entry, unrelated).
- `grep -rn 'verbatim'`: the hits about quoted output are rules 7 and 13 of both change standards, `skills/refute/SKILL.md:55` ("The verification lines first, verbatim."), and `skills/refute/templates/report.md:8` and `:47` ("<each command of the brief's verification list, and its summary line, verbatim>"). None is made false: the new rule and `/refute`'s Rules bullet each say "a verbatim one included". `skills/refute/templates/report.md` is outside this step's paths; a reviewer filling the template reads the skill's Rules with it. If the orchestrator wants the pointer in the template too, the replacement for line 8 is `<each command of the brief's verification list, and its summary line, verbatim, a secret written `<REDACTED>` as the skill's Rules say>` and for line 47 `<each verification command rerun over the repaired tree, and its summary line, verbatim, a secret written `<REDACTED>` as the skill's Rules say>`.
- Scripts that read the change standard: `grep -rn 'change-standard' --include='*.py' --include='*.sh' skills utils` prints only two lines of `skills/ordo-init/templates/check_config.test.sh` (26 and 91), which create an empty `change-standard.md` in scratch repositories and do not read its rules. `skills/repo-setup/templates/sync_rules.py` compares the shared-rules block of `CLAUDE.md` with `templates/shared-rules.md` (its docstring, lines 2 to 8) and never reads a change standard, so the new rule changes nothing it compares or copies. `sync_rules.test.sh` passes in verify 1.

No sentence elsewhere is made false by the change, so no replacement is required.
