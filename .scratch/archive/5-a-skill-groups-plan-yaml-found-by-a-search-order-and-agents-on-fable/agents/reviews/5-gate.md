# The gate of entry 5.A, run on main at c7df438

```
HEAD c7df438
$ sh utils/pin.test.sh | tail -1
$ perl grep for skills/ outside the four groups
(exit 0)
$ check_config.test.sh
$ land.test.sh
$ git ls-files docs/plan.yaml .agents/plan.yaml
docs/plan.yaml
$ check_config.py docs/plan.yaml
note: docs/plan.yaml: worktree_paths not set, default [] applies
note: docs/plan.yaml: review not set, default 'every' applies
note: docs/plan.yaml: refute_after_repair not set, default True applies
note: docs/plan.yaml: repair_rounds not set, default 1 applies
note: docs/plan.yaml: review_minutes not set, default 0 applies
note: docs/plan.yaml: look not set, default '' applies
note: docs/plan.yaml: bench not set, default [] applies
note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
note: docs/plan.yaml: design_bar not set, default 'industry' applies
note: docs/plan.yaml: design_references not set, default [] applies
ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
(exit 0)
$ grep writing
(exit 1)
$ grep code-comments
(exit 1)
$ git grep The configured effort cannot apply
docs/adr/0035-paper-and-writing-run-their-agents-on-the-default-agent-when-the-effort-agents-are-missing.md:7:ADR 0030 decides that every role of `paper` "runs as `ordo-medium` on opus", and `paper` r
docs/roadmap.md:27:- Gate: `utils/pin.test.sh` passes with a case for a tag in the grouped layout and one for a tag in the layout before it; `utils/pin.sh <tag>` on a tag of this change links each of 
skills/orchestration/plan-orchestration/SKILL.md:64:     - A variable that is set is the refusal "The configured effort cannot apply" ("Stops"), and the loop dispatches nothing.
skills/orchestration/plan-orchestration/SKILL.md:471:| The configured effort cannot apply | A refusal (Steps 1): `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the def
skills/orchestration/refute/SKILL.md:54:     - A variable that is set is the refusal "The configured effort cannot apply" ("Stops"), and no reviewer is dispatched.
skills/orchestration/refute/SKILL.md:203:| The configured effort cannot apply | `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the definition says (Steps 1) | The vari
skills/orchestration/spec/SKILL.md:94:     - A variable that is set is the refusal "The configured effort cannot apply" ("Stops"), and writes nothing.
skills/orchestration/spec/SKILL.md:493:| The configured effort cannot apply | `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the definition says (Steps 1) | The variab
$ diff guide (hunk heads)
3c3 29,34c29,34 39c39 41c41 102c102 127,128c127,128 131c131 160,161c160,161 
$ git grep -c .agents/plan.yaml
      19
$ served models in Agents section
  15 claude-fable-5-2
   5 claude-sonnet-5-5
$ the three tests, each | tail -1: utils/pin.test.sh, check_config.test.sh, land.test.sh
PASS: pin.sh scratch tests
PASS: check_config.py scratch tests
PASS: land.sh scratch tests
```

The checks on a pinned tag (the pin, its check, the skills CLI, the README copy loop) and the run on a scratch repository are in `4-pinned-checks.md` and `4-scratch-run.md`, on `v9.0.0-rc.1`.
