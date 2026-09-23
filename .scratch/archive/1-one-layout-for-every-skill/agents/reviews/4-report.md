# Step 4 report: plan-orchestration restyled

Everything in the brief is done, with brief decision 1 corrected by the orchestrator's ruling in step 4's repair round (frontmatter-only lines map to Quick start).

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/plan-orchestration` | DONE | `ok: skills/plan-orchestration/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md` |
| 3 | the verify list | DONE | `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`; the ASCII check prints nothing, exit 0 |
| 4 | the section names other files cite: "The review, earned" and "Two steps in flight" (the plan skill's `templates/plan.yaml` and `templates/orchestrator-state.md`), "Launching a builder", "Stops", "Usage" (the land skill) | DONE | each `grep -c '^## <name>$'` prints 1 |

Files, as they land: `skills/plan-orchestration/SKILL.md`, 96 lines before and 235 after (`git diff --stat`: 174 insertions, 35 deletions); the inventory, 132 body rows (`grep -c '^| [0-9]'`).

Sections before: The two tiers, and the harnesses; Handing the plan from one orchestrator to another; The loop, one step at a time; The review, earned; The recurring-findings pass; Two steps in flight; Launching a builder; What earns a step of its own; Stops; Reports; Usage; The pace when a deadline is set.

Sections after: Quick start; Use instead (five rows); What it reads (six); Steps (the loop's paragraph, then items 1 to 10 as before, each item's rules as sub-bullets); The two tiers, and the harnesses; Resuming, and handing the plan over; The review, earned; The recurring-findings pass; Two steps in flight; Launching a builder; What earns a step of its own; Reports; Usage; The pace when a deadline is set; Stops (a table of the four stops, then five bullets); Anti-patterns (ten rows); Rules (two).

Judgment calls:

- "Handing the plan from one orchestrator to another" is renamed "Resuming, and handing the plan over", since it also holds the resumption checks; no file names the old heading (`grep -rn 'Handing the plan' skills docs README.md` prints nothing).
- The frontmatter's description names no neighbouring skill, by the layout; the body names them.
- The title paragraph says what the skill does and leaves behind; the old paragraph's content opens the Steps section.
- Rules that forbid a shortcut are rows of Anti-patterns with the reason each fails: a silent relaunch, a scope change sent back, a miss handed back as a gap, a step minted for inconvenience, a rule-breaking option, rewriting a broken rule, changing the rules file without a ruling, narration, an unmeasured number, partial work presented as complete.
- The Use instead rows come from the neighbouring skills' descriptions.
- Each rule is written once; a place that needs a rule held elsewhere names the section or row that holds it.
