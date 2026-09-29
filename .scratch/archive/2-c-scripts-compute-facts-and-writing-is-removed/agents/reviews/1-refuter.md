# Step 1, refuter report

Reviewer: a fresh agent on claude:opus, read-only, over `git diff 64cac89` in `.agents/worktrees/2c-1`.

## Verification lines

`sh ~/.claude/skills/land/templates/verify.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"` from the worktree root:

```
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
Can't open skills/writing/SKILL.md: No such file or directory at -e line 1.
Can't open skills/writing/references/academic-prose.md: No such file or directory at -e line 1.
Can't open skills/writing/references/anti-patterns.md: No such file or directory at -e line 1.
Can't open skills/writing/references/judgment.md: No such file or directory at -e line 1.
Can't open skills/writing/references/prose-standard.md: No such file or directory at -e line 1.
Can't open skills/writing/templates/check_prose.py: No such file or directory at -e line 1.
Can't open skills/writing/templates/check_prose.test.sh: No such file or directory at -e line 1.
verify: 7 commands passed
exit 0
```

The `Can't open` lines come from the deletions being unstaged in the worktree: `git ls-files -c` still lists the seven files. The ASCII check over the files that exist printed nothing and exited 0. Verify 2 run against a scratch index holding the changes printed nothing; verify 3 printed only the `standards:` line and the rule 10 hunk of both change standards; verify 4, both forms, printed nothing; every case gave its after result; `check_config.py .` printed ok.

## Spec

none. Every premise of "What is on the tree" reproduced on 64cac89, and `git diff 64cac89 --stat` names only the brief's paths.

## Proof

1. `agents/reviews/1-report.md` line 24: the first-run grep is said to find "11 lines inside `skills/writing/`" and lists twelve; `git grep -n -e check_prose -e skills/writing/ -e '`/writing' 64cac89 -- skills/writing | wc -l` prints 12. No decision rests on the number.
2. The report quotes verify 2 and verify 3 in part (the 75 deleted lines and the rule 10 lines shortened) where the brief asked for verbatim. The reviewer's own run of verify 3 matches the claim.

Every other command the report quotes as evidence gave the output it states.

## Standards

1. `skills/repo-setup/SKILL.md` line 154, restored with its v2.0.0 text: "- Every file it writes follows the prose standard: ASCII, one paragraph per source line, no history." The restored prose standard holds no rule about history (`grep -n -i history skills/repo-setup/templates/docs/dev/prose-standard.md` exits 1); the no-history rule is in `skills/repo-setup/templates/shared-rules.md` line 23. The sentence names the prose standard as the source of a rule it does not hold.

Other names grepped (`writing`, `prose-standard`, `prose standard`, `check_prose`, `academic-prose`, `anti-patterns.md`, `judgment.md`, `No history in a rule`): nothing the diff makes false. No non-ASCII.

## Behaviour

1. The report's "User-visible changes" has no item for the removal of the skill itself: before, the tree had a `writing` skill (`/writing <file>`, running `check_prose.py`); after, it has none.

## Not checked

The verify list and `git diff v2.0.0` on the committed state in the real index; the installed skills under `~/.claude/skills`; the ledger deletions made at landing; the report's statement that the first run was made on a clean tree.

## Closed

- Proof 1: the count in the builder's report is wrong and no decision rests on it; closed at landing by correcting line 24 of `1-report.md` to twelve lines.
- Proof 2: the partial quotes carry no claim the reviewer's rerun contradicts; closed at landing, the booking quotes the orchestrator's own run of verify 2 and verify 3 on main.
- Standards 1: fixed at landing on main, a fix inside the brief: line 154 of `skills/repo-setup/SKILL.md` names the prose standard for ASCII and one paragraph per source line, and the shared rules for no history. Step 1's check in `plan.md` is corrected so `git diff v2.0.0 -- skills/repo-setup/SKILL.md` prints only that line.
- Behaviour 1: closed at landing; the landing report and the booking state the skill's removal with its before and after.
