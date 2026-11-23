# Step 5 brief check (on main at 8fd4072)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `.scratch/18-wait-what-and-wizard/agents/briefs/5.md`. Nothing was written, staged or committed. Every scratch run below read the template on standard input (`sed ... | shellcheck -`, `/bin/bash -c '...'`); `/bin/bash --version` prints `GNU bash, version 3.2.57(1)-release (arm64-apple-darwin24)`, `shellcheck --version` prints `version: 0.11.0`. `git status --short` at the end prints ` M .scratch/18-wait-what-and-wizard/orchestrator-state.md`, ` M .scratch/18-wait-what-and-wizard/plan.md`, `?? .scratch/18-wait-what-and-wizard/agents/briefs/5.md`; the `plan.md` change (`git diff`) ticks step 4 and adds the line "Step 4, done", and leaves step 5's line and the ruling "The gate's seven findings" as read.

Sixteen findings: F1 to F16. The ones that change what the builder would build are F3, F4, F5, F6, F8, F9, F12, F13.

## 1. Names

Command: `git grep -n -e '<name>' -- . ':!.scratch'`, once per name.

- `version_at_least`: no hit anywhere. Free name.
- `by_hand`: hits only `skills/code/wizard/templates/template.test.sh:78,79,108,116`, all the existing test helper `expect_left_by_hand`, inside the paths. No clash: a different name, and the new case can reuse that helper.
- `You drive the browser`, `captures the values` (the text of `banner`): `skills/code/wizard/templates/template.sh:64` and `:65` only. No hit outside the paths.
- `Enter keeps current`: `template.sh:134` (`ask`) and `:146` (`ask_secret`, a `printf` format, no expansion in front of `[`). No hit outside the paths.
- `still to do by hand`: `template.sh:23`, `:253`, `template.test.sh:5,78,80,81`. No hit outside the paths.
- `SKIPPED`: `template.sh:49,184,197,234,252,254`; the other hits (`skills/academic/paper/...`) are unrelated names. Inside the paths, `template.sh:49` reads `SKIPPED=()        # things left to do by hand: gh wasn't ready, or the person declined a command`. After 1.5 the array holds a third kind of entry.
- `shellcheck`: `docs/adr/0046-...md:11`, `skills/code/wizard/SKILL.md:71`, `template.sh:205`. The ADR line already states the change. `SC2329|SC1087`: no hit.
- `template.test.sh`: `docs/dev/building.md:19`, `docs/dev/scripts.md:51` (both in the paths), `docs/dev/change-standard.md:83` (the command only, `sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1`; the step changes no command, so it stays true).
- `template.sh`: `docs/dev/scripts.md:18` (the template's row: names no helper, stays true), ADR 0045 lines 7, 15, 16 and ADR 0046 line 11 (stay true), `README.md:29` (the row of `wizard`: names no helper and no banner text, stays true; printed with `sed -n '29p' README.md`).
- `WIZARD_OS` (the helper lists the step extends): `SKILL.md:55,64,83`, `building.md:19`, `scripts.md:51`, `template.test.sh:2`. All inside the paths. `template.test.sh:2` reads "Exercise the helpers of template.sh that run commands: run_cmd, have and WIZARD_OS."; it becomes incomplete once two helpers are tested, and the brief's section 2 asks only for "a line in the head comment that says why it is kept" per case.

Findings:
- F1. `template.sh:49`, the comment of `SKIPPED`, lists two sources of entries and the step adds a third. Rule 14 of the rules file ("A sentence in a document or a head comment that the change makes false is a defect of the change"). The brief's 1.1 to 1.8 do not name the line, and 1.1's "Every function stays byte for byte" neither allows nor asks for it. The brief should name line 49 as a line to change.
- F2. `template.test.sh:2`, the head comment's first sentence, names the three helpers the test exercises. Section 2 of the brief should say that this sentence names the two new helpers too.

## 2. The step line

- "`SKILL.md` says that a stage ends on a pause": 3.1.
- "what a stage does when a tool an earlier stage installs is missing": 3.2, with 1.5.
- "how a command that needs a shell is written": 3.3.
- "that a check skips a stage's commands and never the reading of its value": 3.4.
- "what the `shellcheck` run of Steps 6 must print": 3.6.
- "`template.sh` gains a comparison of a version with a minimum": 1.4 (and 3.5, 3.7).
- "and a helper that records what is left to do by hand": 1.5 (and 3.7).
- "its `shellcheck` run prints nothing": 1.2, 1.6, Verify 2.
- "its opening screen names the commands": 1.3.
- "the test covers the two helpers": section 2 and the four cases marked "test"; 4.1 for the listings.
- "`bash -n` exits 0": Verify 3 and the case on line 79 of the brief.
- "the test passes": Verify 1.
- "a reviewer reads the skill and the library against ADR 0046": the reviewer's; the brief names ADR 0046 under "What is on the tree" and "Read".

The seven points of the ruling "The gate's seven findings": a pause at the end of a stage (3.1); a stage that depends on a declined one (3.2, 1.5); a command that needs a shell (3.3); a minimum version (1.4, 3.5); a stage that both runs a command and reads a value (3.4); the `shellcheck` run (1.2, 1.6, 3.6); the opening screen's text (1.3). Each has an item.

Findings: none.

## 3. Premises

- Line counts: `wc -l` prints `289 .../template.sh`, `113 .../SKILL.md`, `245 .../template.test.sh`. Matches.
- Functions: `grep -n '^[a-z_]*()' skills/code/wizard/templates/template.sh` prints `53:_clear()`, `60:banner()`, `72:stage()`, `80:say()`, `82:step()`, `83:note()`, `84:warn()`, `87:open_url()`, `99:pause()`, `105:confirm()`, `114:_existing()`, `129:ask()`, `142:ask_secret()`, `160:write_env()`, `175:set_secret()`, `189:set_var()`, `215:have()`, `225:run_cmd()`, `247:finish()`, `267:run_wizard() {`. Matches the brief's list and line 267.
- `grep -n 'version_at_least\|by_hand' skills/code/wizard/templates/template.sh`: prints nothing, exit 1. Matches.
- `shellcheck skills/code/wizard/templates/template.sh`: exit 1. Does not match the brief's counts. `shellcheck -f gcc ...` prints five findings:
  `template.sh:105:1: note: This function is never invoked. ... [SC2329]`
  `template.sh:134:36: error: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet). [SC1087]`
  `template.sh:189:1: note: ... [SC2329]`
  `template.sh:215:1: note: ... [SC2329]`
  `template.sh:225:1: note: ... [SC2329]`
  That is SC1087 once (line 134, column 36) and SC2329 four times (`confirm`, `set_var`, `have`, `run_cmd`). The brief's command `shellcheck ... | grep -o 'SC[0-9]*' | sort | uniq -c` prints `2 SC1087` and `5 SC2329` because the default output's closing "For more information:" block names each code once more.
- `banner`, lines 64 to 66: `cat -n` shows the three `printf` lines with the text the brief quotes. Matches.
- `run_cmd` and `finish`: lines 233 to 237 (`SKIPPED+=("command $shown")`, `warn "skipped command: $shown"`, `return 0`) and lines 252 to 255 (`warn "still to do by hand:"`, the loop). Matches.
- `SKILL.md` Steps 5 at lines 54 to 68 and Steps 6 at lines 69 to 76, line 71 "Run `shellcheck <script>` when it is installed.", line 76 "Done when `bash -n` prints nothing, the script is executable and the trace finds every value and every command." Matches.
- `grep -n 'template.test.sh' docs/dev/building.md docs/dev/scripts.md`: `building.md:19` and `scripts.md:51`. Matches.
- ADR 0046: the three quoted sentences stand word for word in its Decision. Matches. ADR 0045 and ADR 0010: in force as the brief says.
- Further runs the brief relies on: `bash -n skills/code/wizard/templates/template.sh` prints nothing, exit 0. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1` prints `PASS: template.sh scratch tests, 8 cases`. The description length command of Verify 4 prints `987`. The character-set command of Verify 1 prints nothing, exit 0.
- Feasibility of 1.2 and 1.6 (template piped to `shellcheck -f gcc -s bash -`): with line 134 changed to `${e}[Enter` alone, the four SC2329 notes remain, exit 1; with that and `# shellcheck disable=SC2329  # reason` on line 2, nothing printed, exit 0; with the directive on the line before `set -euo pipefail` instead, nothing printed, exit 0. `/bin/bash -c` on both forms of the line 134 string prints `same`. So 1.2 and 1.6 can be met, and "at the top of the file" works in either place.

Findings:
- F3. The brief's premise on `shellcheck` says "SC1087 twice, on line 134 ... and SC2329 five times". The tree gives SC1087 once and SC2329 four times; the brief's own counting command counts the footer. 1.2 ("the expansion", singular) is right as written; the premise's two numbers are wrong and should read one and four, with `shellcheck -f gcc` as the command.

## 4. Cases and checks

- test, `version_at_least`, equal and later: consistent with the rules file ("Scripts compute facts", the bullet on tests: a wrong answer installs over a tool that is new enough).
- test, `version_at_least`, earlier: consistent as a case; as a proof see F4.
- test, `version_at_least`, not a version: consistent.
- test, `by_hand`: consistent.
- run, `shellcheck`: consistent; "on the unchanged tree it exits 1 with SC1087 and SC2329" reproduces.
- run, `bash -n`: consistent.
- run, each function of the base equals the worktree's: asks the builder to check places the step does not change, and names no command, while "Paths this step writes" forbids a script. See F5.
- run, the existing eight cases: consistent with rule 13's bullet on a preserved behaviour.
- read, `SKILL.md` against 3.1 to 3.8; read, the head comment; read, nothing private: consistent.

Findings:
- F4. Verify 5 says each test of an added behaviour fails on the unchanged tree and "none of the new cases is an audit". The case "earlier" does not fail there as written. `/bin/bash -c 'set -euo pipefail; if version_at_least 3.9 3.28; then echo taken; else echo not-taken; fi; echo went-on'` prints `/bin/bash: version_at_least: command not found`, `not-taken`, `went-on`, exit 0: an undefined function in the condition of an `if` is a failing condition, so a test function that asserts only "fails" passes before the helper exists. Rule 13 of the rules file asks for the failure on the unchanged tree. The brief should say that the "earlier" inputs are asserted in one test function with a "succeeds" input, or that the function also asserts that nothing is printed on standard output or standard error.
- F5. The case "each function of the base other than `ask` and `banner` equals the worktree's, body for body" is a check of unchanged places with no command named. `git diff <base> -- skills/code/wizard/templates/template.sh` shows it: hunks only in the head comment, at line 49 if F1 is taken, at 64 to 66, at 134, and the added block between `run_cmd` and `finish`. The brief should name that command. Its first run on the unchanged tree is empty by construction, which the brief should say, since "The builder's first task ... is the first run of every case".

## 5. The question

"The goal" here: `wizard` writes a script that runs the commands a stage needs, each shown and confirmed first, and the seven gaps are closed.

- test, equal and later: no. It fails without a working comparison.
- test, earlier: yes, as F4 shows, when asserted alone.
- test, not a version: no, provided the test captures standard error; the "prints nothing" assertion is what fails on a wrong helper.
- test, `by_hand`: partly. It proves the entry reaches `finish` and that the script goes on with status 0. It does not assert the line 1.5 prints through `warn` at the stage; a `by_hand` that only appends to `SKIPPED` passes. The reviewer reads that part.
- run, `shellcheck` prints nothing: no for the fact it states. It says nothing about a generated script, which 3.6 covers by text.
- run, `bash -n`; run, bodies equal; run, the eight cases: no; each is a fact about the file.
- The check on the step's line (`bash -n`, `shellcheck`, the test, a reviewer's read): no, as the plan's Gate section answers it, with F4 and F6 closed.
- Items 1.2, 1.6: checked by the `shellcheck` run; no.
- Item 1.3: checked by reading; no.
- Item 1.4: checked by three test cases; yes for two inputs no case holds, see F6 and F7.
- Item 1.5: as the `by_hand` case above.
- Items 1.7, 3.1 to 3.8, 4.1: checked by reading; whether a script written from the new text behaves is not checked again, which the plan's Gate states ("it is checked once, with no further run of the gate"). 3.3 and 3.5 can be read as present and still leave the gap open, see F8 and F9.

Findings:
- F4 (above).
- The `by_hand` case does not assert the printed line of 1.5; add the assertion that the text appears above "still to do by hand:" as well as under it, or state that the reviewer reads it. (Counted with F12.)

## 6. Implied inputs

A code step. Inputs the step implies:

- A part with a leading zero (`24.04`, `1.09`, `2.08.1`): missing from "Cases". 1.4 says "parts compare as numbers". Under bash 3.2, `/bin/bash -c 'set -euo pipefail; a=09; if (( a >= 8 )); then echo ge; else echo lt; fi; echo went-on'` prints `/bin/bash: ((: 09: value too great for base (error token is "09")`, `lt`, `went-on`; and `a=010; $((a))` gives `8`. A plain `(( ))` comparison prints an error (against "prints nothing"), reports a new enough tool as too old, and reads `010` as 8. Version strings with such parts are common (calendar versions). Expected result: `24.04` against `24.4` succeeds, `1.09` against `1.8` succeeds, `1.010` against `1.9` succeeds, nothing printed.
- An empty part (`3..28`, `3.`, `.5`): missing, and 1.4 has two readings: "a missing part counts as 0" and "An argument that ... holds a part that is not a number, fails". `IFS=. read -r -a p <<<"3..28"` gives three parts with the middle one empty; `"3."` gives one part. Expected result to state: an empty part between or after dots fails.
- A version with a suffix or a prefix (`3.28.1-rc1`, `v3.28`, `2.39.5 (Apple Git-154)`): covered in kind by `3.x` ("a part that is not a number, fails"). The cost is on the skill's side, see F9.
- An empty or missing second argument: the case names "an empty first argument" only. `/bin/bash -c 'set -euo pipefail; f() { local t="$1"; ...}; f'` prints `$1: unbound variable`, exit 1: a call with one argument ends the script under `set -u` unless the helper reads `${2:-}`. The minimum is written by the script's author, so the cost is low; the brief should still say what an absent argument does, since "An argument that is empty ... fails" reads either way.
- `by_hand` with no text or an empty text: unstated. `run_cmd` ends the script with status 2 on no command; `by_hand` under `set -u` with `"$1"` would end it with status 1 and bash's own message. Low cost; one sentence in 1.5 settles it.
- A tool that is not installed when its version is read: missing. `/bin/bash -c 'set -euo pipefail; v=$(wizard-test-no-such-tool --version | head -1); echo went-on'` prints `command not found`, exit 127: the script ends at the assignment. This is the first run of every setup script on a new machine. Expected result: the stage checks `have` first and reads the version only when the tool is there. It belongs in 3.5, see F9.
- A version text ending in a carriage return on Windows: not raised; it has not happened in a run and `$(...)` strips only newlines. Listed for the session's judgment.

Findings:
- F6. No case for a part with a leading zero; expected results above. Without it a straightforward bash 3.2 implementation prints an error and gives the wrong answer.
- F7. 1.4 does not say whether an empty part (`3..28`, `3.`) is 0 or not a number, nor what a missing second argument does. State both, and add `3..28` to the "not a version" case.

## 7. ADRs

Read: the Status line and the Decision of every record `0001` to `0046` in `docs/adr/` (0015 does not exist), with `for f in docs/adr/00[0-4]*.md; do ... awk '/^Status:/{print} /^## Decision/...'` and `cat -n` for 0010, 0045, 0046.

- 0046 (proposed): touches the step. Sentences: "The library of `templates/template.sh` keeps the source's helpers as ADR 0045 leaves them, but for two lines: the opening screen's text in `banner`, which names the commands, and one expansion in `ask`, braced so that `shellcheck` prints nothing on the library. It gains ... a comparison of a version with a minimum, and a helper that records what is left to do by hand." "No command runs without being shown and confirmed." "The library's added helpers have a test." Named in the brief.
- 0045 (proposed, superseded by 0046 for the library, the scope and the sentence on a test): touches the step for the template's character set, the head comment's block of inputs, warnings and exit status, and the three rules on secrets. Named in the brief.
- 0010 (proposed): touches the step through `docs/dev/building.md`. "compare the plan's verify list with the verification page's commands". The step changes line 19's comment and no command; the state file's verify list holds `sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1` (`grep -n template.test orchestrator-state.md`, line 20). Named in the brief.
- 0001 to 0009, 0011 to 0014, 0016 to 0044: none touches the step. They decide the writing base and the prose standard's place for `/writing` (0001, 0002, 0026), `/writing`'s and `/code-comments`' agents (0003, 0013, 0014), self-rule and the choices file (0004, 0005), the ledger's agent records and models (0006, 0007), the cost script (0008, 0009), dispatch blocks and commits on main (0011, 0012), `paper` and its roles, lookups and checks (0016 to 0043), and `grant`'s funder config (0044). None governs a file, a name, a rule or a behaviour of `wizard`, its template, its test, `building.md` line 19 or `scripts.md` line 51.

Findings:
- F8. 3.5 and Decision 2 ("The stage reads that text from the tool itself") make a stage run the tool (`<tool> --version`) in its check, outside `run_cmd`. ADR 0046 says "No command runs without being shown and confirmed", and `SKILL.md` Rules says "every command of a stage goes through `run_cmd`"; Steps 1 allows as a check only "`have` for a tool, or a bash test that reads and changes nothing". The brief does not say how a version read stands with these. Either the brief states that reading a version is part of the check, which reads and changes nothing and is no command of the stage (and has 3.5 extend the bullet of Steps 1 that lists the allowed checks), or this is a clash for the user. I judge it closable in the brief, since Steps 5 already says the check "is not a command of the stage"; the ADR's sentence is about commands a stage runs. The session decides whether that reading holds or is a stop.
- F9. 3.5 leaves the builder to guess what the skill tells an agent to write: it does not say that the stage checks `have` before it reads the version (the run above ends the script with 127 on a missing tool), nor that the stage must cut the tool's output down to the dotted number before the call, although 1.4 makes any other text fail, which then installs over a new enough tool. Both belong in 3.5 as requirements.
- F10. 1.1 says "except the two lines 1.2 and 1.3 name", and 1.3 names lines 64 to 66, three source lines. ADR 0046's "two lines" counts the banner's text as one. Reword 1.1 to "except line 134 and the text of lines 64 to 66".

## 8. Dictated text

The brief dictates three code lines and no prose:

- `run_cmd bash -c '<the line>'`: `grep -n 'run_cmd bash -c' .scratch/18-wait-what-and-wizard/agents/briefs/5.md` prints line 56. As a code line it holds (ASCII, a placeholder in angle brackets, consistent with `run_cmd sh -c 'exit 7'` in the test). The claim attached to it does not hold, see F11.
- `by_hand "install the tool: run stage 2 first"`: `grep -n 'by_hand "install the tool'` prints line 77. A made-up test input; holds.
- The signatures `version_at_least CURRENT MINIMUM` and `by_hand TEXT`: lines 34 and 36; they follow the form of the template's comments (`have TOOL`, `run_cmd COMMAND [ARGUMENT ...]`); hold.
- "still to do by hand:" (lines 15, 36, 77) is existing text of `template.sh:253`, quoted, not dictated.

Every other requirement says what a sentence must say without giving its words, so the builder words it.

Findings:
- F11. 3.3 says the form `run_cmd bash -c '<the line>'` is chosen "so that the person sees the line as it will run". `run_cmd` prints each word with `printf '%q '` (`template.sh:231`). `/bin/bash -c 'printf "%q " bash -c "curl -fsSL https://example.com/install.sh | sh"; echo'` prints `bash -c curl\ -fsSL\ https://example.com/install.sh\ \|\ sh`. The person sees every space and the pipe behind a backslash. The line can be pasted, and nothing expands before it is shown, but it is not "the line as it will run", and `run_cmd` stays byte for byte under 1.1. The brief should either drop that reason and state the true one (nothing is expanded before the line is shown, and the shown line can be pasted), or have the skill's text tell the stage to print the plain line with `say` or `note` above the `run_cmd`. The second changes what a script shows a person, so it is the session's choice to make or raise.

## Points beyond the list

A requirement that leaves the builder to guess:
- F12. 1.5 "prints through `warn` what is left": the printed line's form is open (the text alone, or with a prefix such as the existing "skipped command: "), and 1.7 must then quote that warning in the head comment. State the form. The `by_hand` case should assert the line (see "The question").
- F13. 3.4 and 3.2 against the existing bullets. `SKILL.md:63` reads "Skip a stage that is already done by its check, which stands in the condition of an `if` and is not a command of the stage." and `SKILL.md:42` "so that a second run skips it". 3.4 changes the first to "skips its commands and their instructions only". The brief says "Each rule is written once" and does not name line 63 as the bullet 3.4 replaces; a builder who adds a bullet leaves two statements that disagree (rule 19 of the rules file). Name line 63 as rewritten. The brief also does not say whether a stage whose tool is missing (3.2) still reads and writes its values (3.4 speaks only of the check); state it.
- F14. 3.5 "Steps 1 notes the minimum with the command": Steps 1 ends "Done when ... each command has its three" (`SKILL.md:44`). The brief does not say whether the minimum is a fourth note, which makes "three" false, or part of the existing note on the check. State which.

A requirement that contradicts the template's existing behaviour:
- F15. 3.1 "a stage ends on `pause`" and 1.8 "The example stage and every line from `run_wizard() {` to the end stay as they are". `sed -n '267,289p' skills/code/wizard/templates/template.sh | grep -n pause` prints nothing: the example stage, which Steps 5 has the agent replace and which is the only model of a stage in the file, ends on `set_secret` and is followed by `finish`, which clears the screen (`template.sh:248`). The template then ships an example that breaks the skill's new rule. The step line and the ruling do not ask for a change below the marker, and ADR 0046 speaks of the library only, so adding `pause` to the example is open to the brief; the session decides between changing 1.8 to allow the one line or leaving the example and saying why.
- `set -euo pipefail` and the two helpers: `version_at_least` must return non-zero without any failing bare statement inside it and is used only in a condition, as `have` is; 1.4 says so. `by_hand` returns 0; `SKIPPED+=("...")` and `(( ${#SKIPPED[@]} ))` work on bash 3.2 under `set -u` (`/bin/bash -c 'set -u; S=(); (( ${#S[@]} )) && echo has; S+=("x"); echo "${S[*]}"'` prints `x`, exit 0). No contradiction with `run_cmd`, `SKIPPED` or `finish`.

A line number or count the tree does not reproduce:
- F3 (the two `shellcheck` counts).
- F16. Section 2 says "The last line's count follows" and does not say how many test functions the four "test" cases become (the count printed is the number of names in the `for` list at `template.test.sh:232`). With one function per case the line reads `12 cases`. State the number, so the report's quoted `PASS:` line can be checked against the brief.

## Closed

Each finding is closed by a change to the brief `agents/briefs/5.md`.

- F1: 1.1 names line 49, and the premise quotes it.
- F2: section 2 says line 2 of the test names the two new helpers.
- F3: the premise reads SC1087 once and SC2329 four times, with `shellcheck -f gcc` as its command.
- F4: section 2 has each new test function assert that nothing is printed, so each fails on the unchanged tree.
- F5: the case names `git diff <base> -- skills/code/wizard/templates/template.sh` and says its first run is empty.
- F6: 1.4 reads a part with leading zeros in base 10, and the case "leading zeros" is added.
- F7: 1.4 makes an empty part and an absent argument fail, and the case "not a version" holds `3..28`, `3.`, an empty second argument and a call with one argument.
- F8: 3.5 and decision 7 state that a version read is part of the check and no command of the stage, and that Steps 1's bullet on the allowed checks names it.
- F9: 3.5 requires `have` before the version read and the output cut down to the dotted number.
- F10: 1.1 reads "line 134 (1.2) and the text of lines 64 to 66 (1.3)".
- F11: 3.3 states the true reason, and has the stage print the plain line with `say` above the `run_cmd` (decision 8). Dictated line `run_cmd bash -c '<the line>'`: holds.
- F12: 1.5 gives the printed line `left to do by hand: TEXT` and what a call with no text does, and the `by_hand` case asserts the line. Dictated line `left to do by hand: TEXT`: holds, ASCII, in the form of `skipped command: ` in `run_cmd`.
- F13: 3.4 names line 63 as rewritten, and 3.2 says a stage whose tool is missing reads no value (decision 10).
- F14: 3.5 makes the minimum part of the command's note on its check, so "three" stays true.
- F15: 1.8 gives the example stage one `pause` (decision 9), and the `git diff` case allows that hunk.
- F16: section 2 gives four test functions and the line `PASS: template.sh scratch tests, 12 cases`. Dictated line: holds.
- Declined, `metadata.version`: decision 6 stands; the skill was created by this plan at `1.0.0`, and that is its one raise.

## Declined to judge

- Whether the version read of F8 is a clash with ADR 0046 that needs the user, or a reading the brief can state: the session's call under "A rule clash with an ADR".
- Whether the example stage gains a `pause` (F15) and whether a plain copy of a shell line is printed above `run_cmd` (F11): each changes what a generated script shows a person.
- Whether `metadata.version` stays `1.0.0` (Decision 6): `docs/dev/skill-layout.md`, "Frontmatter", says a plan raises one part once; the skill was created by this plan, and whether creation at `1.0.0` counts as that one raise is the session's reading.
- The wording the builder will give the banner (1.3), the comments and the skill's bullets: not written yet; the reviewer reads them.
- The glossary: the brief uses "case", "brief", "step", "finding", "rules file", "verify list" and "hand back" in the senses `docs/glossary.md` gives; the step adds no term. No command settles this; it is a read.

Agent usage: a8cdca0e12b1ca0ca, claude-fable-5-2, 200355 tokens, 19 tool uses, 4.4 minutes.
