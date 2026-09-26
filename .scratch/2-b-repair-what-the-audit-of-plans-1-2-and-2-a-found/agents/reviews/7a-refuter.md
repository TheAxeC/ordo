On .agents/worktrees/2b-7a, base df3c6a7; reviewer claude:opus, a fresh agent, aaa38171d566a2671; 149,503 tokens, 34 tool uses, 1,028 s.

# Refutation: step 7a

## Verification

All commands were run from /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-7a.

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 13 commands passed
exit 0
```
2. `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 | tail -1` printed `PASS: allow_list.py scratch tests`.
3. `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests`.
4. `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
5. `python3 skills/plan-orchestration/templates/allow_list.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` printed 15 lines and exited 0. They are identical to report lines 83-97:
```
sh skills/land/templates/land.test.sh
tail -1
sh skills/ordo-init/templates/check_config.test.sh
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh skills/plan-orchestration/templates/launch.test.sh
sh skills/spec/templates/check_paths.test.sh
sh utils/pin.test.sh
sh skills/land/templates/verify.test.sh
sh utils/check_skill_layout.test.sh
sh utils/check_rule_inventory.test.sh
sh utils/check_coverage.test.sh
python3 utils/check_skill_layout.py
git ls-files -coz --exclude-standard
xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
```
6. `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests`.
7. The ASCII check from change-standard.md printed nothing and exited 0.
8. `python3 utils/check_skill_layout.py` printed `ok:` for every skill.
9. `git diff --numstat df3c6a7` and `wc -l` on the four scripts match the report's file table: allow_list.py 215, allow_list.test.sh 233, launch.sh 660 (+40 -7), launch.test.sh 1092 (+92 -19), and the other rows. The report's grep at line 194 prints 219 hits. `git show` of f23d14a, 76a2b10, 3fbc652 and 6458d52 changes no `version:` line (0 each), as the report says.
10. Revert sample. Each revert was applied to a copy of skills/, utils/, docs/ and README.md under the session scratchpad; the worktree was not touched.
    - L1: the `--allowedTools` append removed. Red with `FAIL: claude without a note: calls were ...|--output-format|json`, expected `...|--allowedTools|Bash(sh a.sh:*)|--allowedTools|Bash(tail -1:*)`. Matches the report.
    - L2: the lock re-run's `--allow-file` removed. Red with `FAIL: a0: launch.sh failed`. Matches.
    - L3: the detached body's `--allow-file` removed. Red with `FAIL: a0: launch.sh failed`. Matches.
    - L8: `abs_path` for the allow file removed. The first run was red at another case, `FAIL: land sequence: no exit file`. The second run gave the reported red, `FAIL: a relative allow file that does not exist, named from the caller's directory: printed .../launch.sh: --allow-file names no readable file: no such allow list`.
    - L9: blank lines passed. Red with `...|Bash(:*)|--allowedTools|Bash(   :*)|...`. Matches.
    - A2: `REDIRECTIONS = ()`. Red with `sh a.test.sh 2>` / `1` / `tail -1`. Matches.
    - A4: quotes not read. Red with `xargs -0 perl -CSD -ne 'print if /a` / `b/'`. Matches.
    - A13: the line-break check removed. Red with `FAIL: a line break inside quotes: exited 0, expected 64: `. Matches.
    - C3: the entry check replaced by `if False:`. Red with `FAIL: allow-empty-entry: expected an error, got a pass: ok: ...`. Matches.
    - Three runs of the unchanged launch.test.sh copy each printed `PASS: launch.sh scratch tests`.

## Spec

1. `skills/plan-orchestration/templates/allow_list.py:82-151` (`simple_commands`). The brief asks for a command to be split "into its simple commands". The splitter only knows quotes and backslashes, so it cuts inside command substitutions, subshells, brace groups and compound commands, and it still exits 0. The docstring (lines 9-13) says "each simple command that remains is printed", which is false for these inputs. Rerun on a scratch state file with `verify: []`:
   - `echo $(git ls-files | wc -l)` gives `echo $(git ls-files` and `wc -l)`.
   - ``echo `a | b` `` gives ``echo `a`` and ``b` ``.
   - `(cd x && sh a.sh) | tail -1` gives `(cd x`, `sh a.sh)` and `tail -1`.
   - `{ sh a.sh; } 2>&1 | tail -1` gives `{ sh a.sh`, `}` and `tail -1`.
   - `if true; then sh a.sh; fi` gives `if true`, `then sh a.sh` and `fi`.

   None of these prefixes, written as `Bash(<prefix>:*)`, matches the command it came from, and `wc -l)` puts an unbalanced `)` inside the rule. The script refuses an unclosed quote (line 144) but emits these without an error. That is a silent wrong result for input a verify list can hold.
2. `allow_list.py:25` and `:205-210`. Exit 69 for a missing PyYAML is outside the brief, which says "It exits 64 on ... ; 0 otherwise." The report states this as judgment call 2 and cites check_paths.py as the precedent. It is a new exit status that no brief item asks for.
3. Brief premise, "What is on the tree", fourth bullet: it says the builder keys are at lines 10, 15, 21 and 23. On df3c6a7 and on 2f0914b, `git show ...:skills/plan/templates/plan.yaml | grep -n '^worker:'` prints line 11, not 10. The report says (lines 196-198) that nothing in the brief was wrong and that "The brief's line numbers matched the tree". The report cites other line numbers for that claim, not this one. This is minor and has no effect on the diff.

## Proof

1. Five branches of allow_list.py stay green when reverted. Each was run on a scratch copy, and `sh .../allow_list.test.sh 2>&1 | tail -1` printed `PASS: allow_list.py scratch tests` every time:
   - `REDIRECTIONS` reduced to `(">>", ">&", ">", "<")`, which drops `<&`, `>|` and `<>` (line 33).
   - Comment removal replaced by `if False:` (line 128). The docstring claims "a comment (a word starting with #) is removed".
   - The backslash escape inside double quotes replaced by `j += 1` (line 142).
   - Backslash-newline continuation replaced by `if False:` (line 133).
   - The fence word test replaced by `match.group(2) == "yaml"` (line 60). The docstring claims "yaml or yml block (any case of the fence word)".

   Rule 13 of change-standard.md says no revert turns these red, so this code is unproven. The report's A1-A13 list names none of these reverts.
2. `skills/plan-orchestration/templates/launch.test.sh:637-645` ("land sequence"). The case went red once in my runs (`FAIL: land sequence: no exit file`, on the L8 copy, whose change does not touch that path) and passed on rerun. The builder hit the same red once (report line 146) and wrote "the cause of its one failure was not traced". The case sends TERM, runs `sleep 2`, then sends KILL, so it depends on timing. An intermittent red in the suite, not traced, is open under rule 6. Whether it also fails on base df3c6a7 was not run.
3. The plan's verify list, which verify.sh runs (13 commands), does not include `allow_list.test.sh`, so /land's verify run does not execute the new test. The report says so at line 78. Adding it is the orchestrator's job in the state file, not the builder's.

## Standards

1. `skills/plan-orchestration/SKILL.md:71` (Steps 8, "The resume's options") reads: "It keeps the launch's `--cwd`, `--model`, `--effort`, `--network`, `--note`, `--label` and `--parent`. Its prompt (the findings), output, stderr, events, exit, pid, session and id files are the round's own." Neither list names the allow file. launch.sh now refuses a claude resume without `--allow-file` (launch.sh:432), so this sentence is incomplete, and the file is on this step's path list. Item 1 of "Launching a builder" (line 171) implies a `repair_allow_file` through the `repair_` prefix, but line 71 does not say whether the file is kept or rebuilt per round. This breaks rule 14.
2. `skills/plan/SKILL.md:52` lists every key /plan writes into the configuration block, ending "`workers_at_once`, `bench`, `launch_note`." It does not name `worker_allow`, which the state template now carries (orchestrator-state.md:24). This breaks rule 14. The report states it at line 191. The cause is the brief's path list, which does not name this file.
3. `README.md:124`, the Tests bullet for `launch.test.sh`, does not mention the allow-file cases, and the Tests bullets have no entry for `allow_list.test.sh` although every other test has one. This breaks rule 14. The report states it at line 192. The cause is the brief's path list (README lines 96 and 105-115 only).
4. `skills/plan-orchestration/templates/launch.sh:43-45`, head comment: "The builder runs under --permission-mode acceptEdits, which refuses a script or a test that no rule allows, since a print-mode run cannot ask for approval, so each line of the file that is not blank reaches claude as --allowedTools "Bash(<line>:*)": the builder may run that command with any further arguments." This is one sentence of about 50 words carrying three ideas. Prose standard E sets sentence length under roughly 20 words.
5. The brief's convention is "lines of about 100 characters at most". Added code lines exceed it. The longest is `skills/ordo-init/templates/check_config.test.sh:194` (the `python3 -c '...replace(...)'` line, 186 characters). Others: `launch.test.sh` has added lines of 104-111 characters (for example the `--stderr "$test_root/no such dir/stderr" ... --allow-file` line, 111), `allow_list.test.sh:14` has 106 and `allow_list.test.sh:191` has 105.

## Behaviour

1. `allow_list.py:167-168` prints `worker_allow` entries without stripping them, and `launch.sh:480-483` passes allow-file lines without stripping them. On a state file with `worker_allow: [" sh a.sh ", "sh b.sh)"]`, `od -c` of the output shows ` sh a.sh ` with its spaces and `sh b.sh)`. These reach claude as `Bash( sh a.sh :*)` and `Bash(sh b.sh):*)`. The first probably never matches and the second holds a stray `)`, and nothing refuses either. check_config.py:82 accepts both entries too. The report does not state this. Under rule 15 this is an untrusted value reaching a command line.
2. The new `launch.sh claude` behaviour (`--allow-file` required, exit 64) is stated with before and after in the report (lines 181-182). Any existing caller that launches or resumes a claude builder without it now fails with exit 64. That includes the planned resume of step 7's builder, `launch.sh --resume ec7fe645-...` in plan.md:122, which must now pass `--allow-file`. The report does not name that consequence for the pending resume.

## Not checked

- Whether each printed prefix, as `Bash(<prefix>:*)`, actually matches under Claude Code. Three things are open:
  - whether `sh X 2>&1 | tail -1` is allowed by `Bash(sh X:*)` plus `Bash(tail -1:*)`, that is, how Claude Code treats the `2>&1` redirection and the pipe;
  - whether the ASCII-check prefix, which contains `(`, `)`, `:` and `$`, parses as a single rule;
  - whether commands the change standard lets a builder run (`git diff`, `git status`, `wc -l`, revert runs on a scratch copy, `LAUNCH_SHELL=dash sh ...`) are allowed without an entry.

  Reading the claude binary's rule parser was denied by the permission classifier, and no `claude -p` run was made. The brief leaves the real run to the orchestrator at landing.
- Whether the "land sequence" flake also occurs on base df3c6a7.
- The reverts not sampled: A1, A3, A5-A12, C1, C2, C4, S1, L4-L7 and L10-L13.
- Behaviour when the allow file is removed between the launch's check and the builder's start (launch.sh:484, `|| exit`). It has no test and I did not run it.
- Prose-standard review of every changed sentence beyond the ones cited.

## Usage

About 140k tokens and 28 tool uses, from the token counter falling from 15,000,000 to about 14,860,000. Minutes were not measured.


# Repair round 1, refuted

On .agents/worktrees/2b-7a, round from 3204a18, base df3c6a7; reviewer claude:opus, a fresh agent, afa0482792415b1e8; 165,597 tokens, 42 tool uses, 991 s.

## 1. Verification lines, verbatim

All commands were run from /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-7a.

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 13 commands passed
exit 0
```
- `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 | tail -1` printed `PASS: allow_list.py scratch tests`.
- `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests`.
- `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests`.
- `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
- `python3 skills/plan-orchestration/templates/allow_list.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` exited 0 and printed 15 lines, the same as report lines 124-138. The last two lines are `git ls-files -coz --exclude-standard` and `xargs -0 perl -CSD -ne`. No printed prefix holds a quote, a parenthesis or a brace, so each one can be written as a `Bash(<prefix>:*)` rule.
- The ASCII check from change-standard.md printed nothing and exited 0.
- `git diff --numstat df3c6a7` and `wc -l` match the report's file table: allow_list.py 252, allow_list.test.sh 329, launch.sh +51 -7 (671), launch.test.sh +121 -31 (1109), and the other rows.
- I ran reverts on scratch copies; the worktree was not touched. Each of these went red with the output the report quotes:
  - B1, the cut removed: `FAIL: a pipe inside quotes: printed ... 'print if /a|b/'`.
  - B3, the refusal inside double quotes removed: `FAIL: the command echo "$(date)" | wc -l: exited 0, expected 64`.
  - B5, `KEYWORDS = set()`: `FAIL: the first word if`.
  - The backtick removed from UNRULY: `FAIL: worker_allow entry sh `x``.
  - `$` removed from UNRULY: `FAIL: the cut before each character`.
  - B6, entries not stripped: `FAIL: worker_allow entries with blanks`.
  - B7, entry characters not checked: `FAIL: worker_allow entry sh 'q'`.
  - B2, the refusal outside quotes removed: `FAIL: the command echo $(git ls-files | wc -l)`.
  - A8c, the newline removed from SEPARATORS: `FAIL: a newline and &`.
  - launch.sh F2, the character check removed: `FAIL: an allow file holding sh b.sh): exited 0, expected 64`.
  - launch.sh F1, lines not stripped: red at the `claude without a note` call comparison.
  - check_config.py C5, the character check replaced by `elif False:`: `FAIL: allow-unruly: expected an error, got a pass`.

## 2. Repair round 1, refuted

### Spec

1. `skills/plan-orchestration/templates/allow_list.py:158-159`
   ```
   if c == '"' and (command[j] == "`" or command.startswith("$(", j)):
       raise grouped
   ```
   Ruling 1 refuses `$(` and a backtick "outside quotes". The diff also refuses them inside double quotes. No ruling asks for this wider refusal set. The report discloses it as judgement call 6 (line 241). It is a shape a ruling fixed, and the builder changed it, so the orchestrator should confirm it. With the ruling's literal text, `echo "$(date)" | wc -l` would print `echo` and `wc -l`; the diff refuses it.

2. Ruling 5 is not closed. See Proof 1 and Behaviour 1.

### Proof

1. `skills/plan-orchestration/templates/launch.test.sh:630-646`, the "land sequence" case, which now waits on the leader instead of sending KILL:
   ```
   -sleep 2
   -if kill -0 "$leader" 2>/dev/null; then
   -    kill -KILL "$leader"
   -fi
   -wait_until "land sequence: the session leader is still running" not_alive "$leader"
   +wait_until "land sequence: the session leader did not end on TERM" not_alive "$leader"
   ```
   The intermittent red that ruling 5 asked to trace and end is not ended. It is still in the case above, "land sequence with KILL" (`launch.test.sh:585-597`). That case sends TERM, sleeps a fixed 2 s, sends KILL and requires an exit file. It has the same timing race: the leader's stop (the one-second grace plus two process scans) can still be running at 2 s, and the KILL then ends the leader before it writes the exit file. My runs, whole suite, on copies:
   - Round's tree, 4 copies at once: 3 PASS, 1 `FAIL: land sequence with KILL: no exit file`.
   - Round's tree, 16 copies at once: 16 of 16 `FAIL: land sequence with KILL: no exit file`.
   - Base df3c6a7, 16 copies at once: 16 of 16 the same.

   The report's "after: 20/20 and 32/32 PASS" (lines 17 and 55) was measured with a harness that runs only the "land sequence" case, so it never exercises the case where the red now appears. The closure does not reproduce on the suite. The fix also removed the check rather than fixing what it guarded:
   - The old case exercised the land skill's real sequence (TERM, then KILL at 2 s) and required an exit file.
   - The new case sends no KILL. Its failure labels still say "land sequence".
   - No case now covers a KILL that arrives before the exit file is written. "land sequence with KILL" holds the leader alive with a hanging note `end`, which runs after the exit file is written, so it covers only a KILL that arrives after that point.
   - The wait itself is bounded: `wait_until` gives up after `max_ticks` (300 ticks of 0.1 s, or 30 of 1 s, set at lines 213-217).

2. `allow_list.py`, the removed line-break refusal (round 0: `if any("\n" in prefix or "\r" in prefix for prefix in found): raise Refusal(...)`). Report line 42 says "no prefix can hold a line break". A carriage return outside quotes proves that false. On a state file with `verify: ["sh a\rb.sh z", "sh c.sh\r"]`:
   - The round's script exits 0 and prints `sh a\rb.sh z` and `sh c.sh\r` (`od -c` shows `\r` inside both lines).
   - Round 0 (`git show 3204a18:...allow_list.py`) refused it: `allow_list.py: the command holds a line break inside a word: 'sh a\rb.sh z'`, exit 64.

   The case "a line break inside quotes" (`allow_list.test.sh:160-163`) was changed from expecting 64 to expecting `sh a.sh`. No case covers `\r` outside quotes. `launch.sh` strips a trailing `\r` but passes a `\r` inside a line into `Bash(...:*)`, and its `unruly` check does not catch it. This is a check removed without the input it guarded being handled.

3. `allow_list.test.sh:97-99`. The comment says:
   ```
   # quote, $, a backtick inside single quotes, a backslash, [, ], a comma, * or ?. Red when the cut is
   # removed (the whole simple command is printed) or when any of the characters is not in the set.
   ```
   With the backtick taken out of UNRULY, "the cut before each character" stays green. The first red is the later `worker_allow entry sh `x`` case. The word `'`'` holds a quote, so it is cut whatever the backtick does. For the backtick, `(`, `)`, `{` and `}`, this case cannot go red. The comment claims otherwise.

4. Report line 245 (judgement call 10) says the resume rule "is written once". `skills/plan-orchestration/SKILL.md:72` ("A `claude -p` resume keeps the launch's allow file, or writes it again when `worker_allow` or the brief's check commands changed") and line 175 state the same rule. Ruling 6 asked for both places, so the text is right, but the report's claim does not reproduce.

### Standards

1. `skills/plan-orchestration/SKILL.md:197`, the added bullet:
   ```
   - A permission rule holding a quote, `$`, a backtick, ... or `?` is cut apart or ignored by `claude`, so `templates/allow_list.py` ends a prefix before the first word holding one, and refuses a command whose parts are not simple commands (...) or that starts with a shell keyword.
   ```
   - It is one sentence of about 60 words with three ideas, against prose standard E ("under roughly 20 words").
   - "is cut apart or ignored by `claude`" is passive with a named actor, also against E.
   - Ruling 8 fixed the same defect in launch.sh's head comment.

2. `skills/plan-orchestration/templates/launch.sh:27-28`, head comment (unchanged text):
   ```
   # own code when it had already ended) and calls end, so TERM followed by KILL two seconds later
   # leaves no builder process and an exit file.
   ```
   - The builder's own trace (report lines 50 and 57) shows this is false: in 7 of 64 runs under load the stop took more than 2 s and no exit file was written.
   - My whole-suite runs above reproduce it.
   - The round measured the defect and left the sentence as it was. Rule 14: a head comment the change's evidence shows false. Rule 12: a miss reported as a known limit (report line 57).

3. Ruling 9 holds, including the test files. `git diff -U0 df3c6a7` with an awk length check prints no added `.py` or `.sh` line over 100 characters. The long lines in check_config.py (68, 74, 126) and check_config.test.sh are pre-existing. `grep` on df3c6a7 finds them at 62, 68 and 111.

   The added lines over 100 are the Markdown lines, `plan.yaml:24` and `orchestrator-state.md:24`. The builder's exemption for them holds against the prose standard's actual text: section F requires "one paragraph or bullet per source line, no hard wrapping". `plan.yaml:24` carries the comment the brief prescribed word for word, and check_config.py reads the default from `# optional, default <value>.` on that same line.

### Behaviour

1. The land skill (`skills/land/SKILL.md:41-43`) sends a shell builder TERM, then KILL two seconds later, and refuses the landing when no exit file is present.
   - Before and after this round, a builder that ignores TERM on a loaded machine can lose its exit file under that sequence, so /land refuses.
   - The report states the measurement (line 57) and leaves both the 2 s and the grace unchanged.
   - Ruling 5 allowed "the defect in launch.sh is fixed". The builder changed the test instead, and the defect the old case caught remains. It is not listed under the user-visible changes with its before and after.
   - The report's only related user-visible line (254) describes the test change.

2. `allow_list.py` now passes a mid-word `\r` from a verify or brief command through to the allow file and on to `--allowedTools`. Before this round, such a command was refused with exit 64. The report does not list this change (see Proof 2).

## 3. Not checked

- Whether the printed prefixes match under a real `claude -p --allowedTools` run. No claude run was made.
- The reverts not sampled: A1-A7, A9-A12, B4, B4b, C1-C8, and launch.sh L1-L13 and E.
- The 16-at-once and 4-at-once suite runs under `LAUNCH_SHELL=dash`.
- Whether the "land sequence with KILL" red occurs with one suite at a time on this machine. My single runs passed. The first reviewer's single-run red was in the other case.
- A line of the allow file changed between launch.sh's check and the builder's start (launch.sh reads the file again in `run_claude`).
- A prose-standard review of every changed sentence beyond those cited.

## 4. Usage

About 157k tokens (the counter fell from 15,000,000 to about 14,843,000) and about 30 tool uses. Minutes were not measured.
