# Step 14 report: the layout check wired in

NOT DONE in the worktree: item 4, the `verify` list in `orchestrator-state.md`. The ledger is written only on main, so the brief places it at landing; the landing adds the line and runs the list on main. Everything else in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | `docs/dev/building.md`: the command in the block, after the tests and before the ASCII check, with its comment; a paragraph with its pass | DONE | the block's eighth line `python3 utils/check_skill_layout.py             # every skills/*/SKILL.md against docs/dev/skill-layout.md` |
| 2 | `docs/dev/change-standard.md`: the command in "Commands and their filters", same place; item 2 names the layout standard | DONE | `grep -n 'check_skill_layout.py' docs/dev/change-standard.md` prints line 49, `python3 utils/check_skill_layout.py`; item 2 is line 8 |
| 3 | `README.md` Tests: the check of the skills, with its command | DONE | `README.md:125: python3 utils/check_skill_layout.py` |
| 4 | The `verify` list | NOT DONE in the worktree; written on main at landing, per the brief | none until the landing's run |
| 5 | Every command of `docs/dev/building.md` passes, from the worktree's root | DONE | each line run in order: `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`, all exit 0; the layout check exit 0 with 10 `ok:` lines (`python3 utils/check_skill_layout.py \| grep -c '^ok:'` prints `10`); the ASCII check prints nothing, exit 0 |
| 6 | `npx skills add . --list 2>&1 \| grep Found` | DONE | `Found 10 skills` |
| 7 | The new line checks something | DONE | on a copy of the tracked tree in the scratchpad, with `## Rules` in `skills/spec/SKILL.md` renamed `## Rule list`, `python3 utils/check_skill_layout.py` printed the lines below and exit 1 |

```
skills/spec/SKILL.md:112: section 'Rule list' is outside the place between Steps and Stops
skills/spec/SKILL.md:114: section 'Rules' is missing
exit 1
```

Files: `README.md` 145 lines before, 151 after; `docs/dev/building.md` 20 before, 23 after; `docs/dev/change-standard.md` 59 before, 60 after (`git diff --stat 47a7abc`: `3 files changed, 14 insertions(+), 4 deletions(-)`). `orchestrator-state.md` is unchanged in the worktree.

The grep over `skills/`, `utils/`, `docs/` and `README.md`, and its hits (cut at 110 characters):

```
$ grep -rn -E "check_skill_layout|standards page|the seven" skills utils docs README.md | grep -v "^utils/check_skill_layout" | cut -c1-110
skills/plan-retro/SKILL.md:59:12. Make the approved edits: the rules page, a standards page, `.agents/plan.yam
skills/plan-retro/SKILL.md:74:1. **The rule is not written anywhere.** Grep the rules page and the standards p
skills/ordo-init/SKILL.md:54:   - Its placeholders are filled from this repository: the standards pages, the f
skills/repo-setup/templates/docs/dev/change-standard.md:8:2. The standards the brief lists, in full: <the stan
utils/check_rule_inventory.py:41:utils/check_skill_layout.py.
docs/dev/skill-layout.md:3:Every `skills/<name>/SKILL.md` follows this layout, so a reader finds the same thin
docs/dev/change-standard.md:47:sh utils/check_skill_layout.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:49:python3 utils/check_skill_layout.py
docs/dev/building.md:11:sh utils/check_skill_layout.test.sh             # the layout check on complete and bro
docs/dev/building.md:13:python3 utils/check_skill_layout.py             # every skills/*/SKILL.md against docs
README.md:18:| `plan-retro` | Reads every refuter report, groups the findings by kind, and for each kind that 
README.md:110:sh utils/check_skill_layout.test.sh
README.md:119:- `check_skill_layout.test.sh` checks that `check_skill_layout.py` passes a complete `SKILL.md`,
README.md:125:python3 utils/check_skill_layout.py
```

None is made false: the `plan-retro`, `ordo-init`, template and README.md:18 hits speak of any repository's standards pages; the rest are the new lines, the test lines, the page that says the check exists, and the inventory check's header.

What a reader of each page sees, before and after:

- `docs/dev/building.md`: before, seven tests and the ASCII check; after, the same with `python3 utils/check_skill_layout.py` between them, and a paragraph saying it takes no filter, prints `ok: <path>` per skill and `<path>:<line>: <what is wrong>` per error, and passes on exit 0.
- `docs/dev/change-standard.md`: before, "Ordo has no standards page yet; a brief that names one points at it."; after, "`docs/dev/skill-layout.md` is the standard for every `skills/*/SKILL.md`." The command block gains the layout check. The lead-in to the block: before, "and its output goes through a filter for its summary lines so raw build output never enters the context:"; after, "and each test's output goes through a filter for its summary lines so raw build output never enters the context; the layout check and the ASCII check take no filter:". Outside the brief's items, the red-run paragraph gains "The layout check prints each error with its file and line; exit 0 is the pass."
- `docs/dev/building.md`, first paragraph: before, "The green check is every test below passing"; after, "The green check is every command below passing".
- `README.md`: before, the Tests section listed the seven tests only; after, it ends with a paragraph and a block giving the check of the skills themselves.
- The `verify` list: seven tests and the ASCII check; the layout check goes between them at landing.

Judgment calls:

- The layout check takes no filter in the command blocks: its output is one short line per skill, and an error line is the information a reader needs.

## Repair round 1

Every finding of `14-refuter.md` is closed; none is booked. After the round, each command of `docs/dev/building.md` run in order from the worktree's root: the seven tests exit 0 with their `PASS:` lines, the layout check exits 0 with 10 `ok:` lines, the ASCII check exits 0 with no output.

| Finding | Closure |
|---|---|
| Spec 1 | The red-run sentence is listed as a change outside the brief's items, quoted |
| Proof 1 | Item 4 is NOT DONE in the worktree, named first, with no proof until the landing's run |
| Proof 2 | The grep is quoted with its command and every hit |
| Standards 1 | `docs/dev/building.md`: "The green check is every command below passing" |
| Standards 2 | `docs/dev/change-standard.md`: "each test's output goes through a filter ...; the layout check and the ASCII check take no filter:" |
| Behaviour 2 | The new sentence is quoted in the before-and-after list |

