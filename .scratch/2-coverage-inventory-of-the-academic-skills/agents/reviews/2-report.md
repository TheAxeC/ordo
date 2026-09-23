# Step 2 report: the coverage check's test joined to the checks

NOT DONE in the worktree: item 4, the `verify` list. The ledger is written only on main, so the brief places it at landing; the landing adds the line and runs the list on main. Everything else in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | `README.md`: the command in the Tests block after the rule inventory test; a bullet after the rule inventory bullet | DONE | `README.md:112: sh utils/check_coverage.test.sh`; the bullet at `README.md:122` |
| 2 | `docs/dev/building.md`: the command after the rule inventory test, with a comment | DONE | `docs/dev/building.md:13: sh utils/check_coverage.test.sh                 # the coverage check on complete and broken coverage lists` |
| 3 | `docs/dev/change-standard.md`: the command with its filter after the rule inventory test | DONE | `docs/dev/change-standard.md:49: sh utils/check_coverage.test.sh 2>&1 \| tail -1` |
| 4 | The `verify` list | NOT DONE in the worktree; written on main at landing, per the brief | none until the landing's run |
| 5 | Every command of `docs/dev/building.md`, from the worktree's root | DONE | each exit 0, in order: `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`, `PASS: check_coverage.py scratch tests`; the layout check's 10 `ok:` lines; the ASCII check prints nothing |

Files: `README.md` 151 lines before, 153 after; `docs/dev/building.md` 23 before, 24 after; `docs/dev/change-standard.md` 60 before, 61 after (`git diff --stat`: `3 files changed, 4 insertions(+)`). `LC_ALL=C grep -n '[^ -~]'` over the three prints nothing.

The grep over `skills/`, `utils/`, `docs/` and `README.md`, and its hits (cut at 120 characters):

```
$ grep -rn -E "seven|the tests|check_rule_inventory.test.sh" skills utils docs README.md | grep -v "^utils/check_rule_inventory" | cut -c1-120
skills/spec/SKILL.md:108:| A brief that tells the builder where to look | A builder told only where to look will not mee
skills/repo-setup/templates/docs/dev/change-standard.md:26:14. **A change carries to every place that names it.** After 
docs/roadmap.md:135:- [x] 1. One layout for every skill: `docs/dev/skill-layout.md` approved (plan 1's rulings); `python
docs/dev/change-standard.md:48:sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
docs/dev/building.md:12:sh utils/check_rule_inventory.test.sh           # the rule inventory check on complete and broke
README.md:111:sh utils/check_rule_inventory.test.sh
README.md:121:- `check_rule_inventory.test.sh` checks that `check_rule_inventory.py` passes a complete inventory and fai
```

None is made false: `roadmap.md:135` quotes entry 1's gate output as it ran ("seven `PASS:` lines"), which stays a record of that run; the `spec` and template hits use "tests" in another sense; the rest are the rule inventory lines the new ones follow.

What a reader of each page sees, before and after:

- `README.md` Tests: before, seven test commands and seven bullets; after, eight of each, the new bullet saying what `check_coverage.test.sh` passes and fails.
- `docs/dev/building.md` and `docs/dev/change-standard.md`: before, seven tests in the command block; after, eight, the coverage test after the rule inventory test.

## Repair round 1

Every finding of `2-refuter.md` is closed; none is booked. The round changed one line, the `check_coverage.test.sh` bullet at `README.md:122`; `README.md` stays 153 lines, and `LC_ALL=C grep -n '[^ -~]' README.md` prints nothing.

| Finding | Closure |
|---|---|
| Spec 1 | The passing list adds the same file name in two skills' sections, a skill named twice and checked once, and a backtick in a fence's info string that opens no fence; a sentence says only the named skills' sections are read, with its control; the failures add a lettered entry written with a trailing dot |
| Spec 2 | The usage errors are the seven the test exercises, each named |
| Spec 3 | The New skills errors are grouped: "and in New skills an entry that is not in the roadmap or is written with a trailing dot after its letter, a skill named twice, or an empty cell" |

Before the round the bullet listed eight passing cases, "an empty cell" among the errors, and "the usage errors that exit 2"; after, as above.
