# Step 7a, repair round 1: the rulings

The round starts at the worktree's wip commit named in the dispatch block. The findings are in `agents/reviews/7a-refuter.md`. Each ruling stays inside the brief `agents/briefs/7a.md`; its conventions, cases, "What it must do" and "Verify before you report" hold for the round unchanged, except where a ruling below changes a case, and every case is run again after the round.

## What a real run showed

The orchestrator ran `claude -p --permission-mode acceptEdits` in the worktree with one `--allowedTools "Bash(<line>:*)"` per line that `allow_list.py` prints for this plan's state file, and asked it to run three verify commands. `sh utils/check_rule_inventory.test.sh 2>&1 | tail -1` and `python3 utils/check_skill_layout.py | tail -1` ran: a redirection and a pipe are matched simple command by simple command. The ASCII check was refused, and `claude` printed `Ignoring --allowedTools rule "}':*)": Wildcard tool name "}':*)" is not supported in allow rules`: a rule holding the perl program is cut apart. With `Bash(git ls-files -coz --exclude-standard:*)` and `Bash(xargs -0 perl -CSD -ne:*)` the same command ran and exited 0.

## Paths this round writes

The brief's list, plus `skills/plan/SKILL.md` line 52.

## Rulings

1. **A prefix stops before a word that no rule can hold** (Spec 1, Behaviour 1, the real run). In `allow_list.py`, the prefix of a simple command is its words up to, not including, the first word that holds a quote, a `$`, a backtick, a backslash, `(`, `)`, `{`, `}`, `[`, `]`, `,` or a glob character (`*`, `?`). A simple command whose first word is such a word, or a shell keyword (`if`, `then`, `else`, `elif`, `fi`, `for`, `while`, `until`, `do`, `done`, `case`, `esac`, `!`), and a command holding `$(`, a backtick, or `(`, `)`, `{`, `}` outside quotes, is refused with exit 64 and a message naming the command, never printed as a wrong prefix. The brief's case `git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'print if /a|b/'` now expects `git ls-files -coz --exclude-standard` and `xargs -0 perl -CSD -ne`; the case of this plan's own verify list prints the ASCII check as those two lines. The reviewer's five inputs (`echo $(git ls-files | wc -l)`, the backtick one, `(cd x && sh a.sh) | tail -1`, `{ sh a.sh; } 2>&1 | tail -1`, `if true; then sh a.sh; fi`) become refusal cases.
2. **An entry is trimmed and checked the same way in all three places** (Behaviour 1). A `worker_allow` entry and a line of the allow file are stripped of surrounding blanks; an entry or line that holds a character ruling 1 names is refused: by `check_config.py` as an error naming `worker_allow` and the entry, by `allow_list.py` with exit 64, by `launch.sh` with exit 64 before anything starts. A case for each in each test.
3. **Exit 69** (Spec 2): kept, as `check_paths.py` and the land skill's `verify.sh` use it for a missing dependency; the report lists it as a change no brief item asks for, with that reason.
4. **The five branches no test holds** (Proof 1): each gets a case its revert turns red (`<&`, `>|` and `<>` as redirections; a comment; a backslash inside double quotes; a backslash-newline continuation; a `yml` or `YAML` fence word), or the branch is removed when ruling 1 makes it unreachable, and the report says which for each.
5. **The "land sequence" red** (Proof 2): run the case on base df3c6a7 and on the round's tree, 20 times each, count the reds, and find the cause from the case's lines and `launch.sh`. A wait on a fixed `sleep` is replaced by a wait on the condition the case checks, or the defect in `launch.sh` is fixed. Rule 6 of the change standard: the report traces it, with the counts before and after.
6. **The resume keeps the allow file** (Standards 1). `skills/plan-orchestration/SKILL.md`, "The resume's options" (line 71), names `--allow-file` among what the resume keeps: the same allow file, unless the configuration's `worker_allow` or the brief's check commands changed, when it is written again. Item 1 of "Launching a builder" says the same.
7. **`/plan` writes the key** (Standards 2): `skills/plan/SKILL.md:52` names `worker_allow` among the keys of the configuration block.
8. **The head comment of `launch.sh`** (Standards 4): lines 43-45 rewritten in sentences under about 20 words, one idea each.
9. **Line length** (Standards 5): every added line over 100 characters is wrapped or rewritten, in `check_config.test.sh`, `launch.test.sh`, `allow_list.test.sh` and the scripts.

The README Tests bullets for `launch.test.sh` and `allow_list.test.sh` (Standards 3) are written by the orchestrator at landing, since step 7 holds the README lines next to them. The verify list's new command (Proof 3), the brief's premise line (Spec 3) and step 7's resume (Behaviour 2) are the orchestrator's.

## Report

Rewrite `agents/reviews/7a-report.md` in the worktree's copy of the ledger to the tree after the round, with a section "Repair round 1" that lists each ruling, DONE or NOT DONE, and the command that proves it. Rerun the brief's "Verify before you report" and every case in full, and quote them; each new or changed test names the revert that turns it red, with the red quoted.
