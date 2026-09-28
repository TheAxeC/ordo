# Step 1 refuter report (on .agents/worktrees/3-1, base c1de4b5)

Reviewer: a fresh claude:opus agent, read-only. Usage: 113,019 tokens, 20 tool uses, 470 s.

## Verification (rerun by the reviewer)

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"`, from the worktree root:

```
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
Can't open skills/repo-setup/templates/docs/dev/prose-standard.md: No such file or directory at -e line 1.
verify: 7 commands passed
exit 0
```

- The `Can't open` line comes only from the unstaged deletion (`git ls-files -co --exclude-standard | grep prose-standard` lists both paths). On a scratch clone with the step's state committed over c1de4b5, `git diff --stat` shows a 100% rename, and the same verify command prints the six `PASS:` lines, no ASCII line, `verify: 7 commands passed`, exit 0.
- Cases 1 to 5 reproduced as the report gives them; the case-1 reverts of `.agents/plan.yaml`, `docs/dev/skill-layout.md` and `skills/repo-setup/SKILL.md` print the line the report quotes; `wc -l` gives 154, 72, 12 and 75; `LC_ALL=C grep -n "[^ -~]"` over the four touched files and the report prints nothing; `find skills/repo-setup/templates -type f` supports the new "What it reads" 1.

## 1. Spec

1. `README.md` lines 58 and 70: "The skills call each other and read each other's templates, so install all of them.", and the copy-install loop `for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec; do`. After the step `/repo-setup` reads the `writing` skill's `references/prose-standard.md` from a folder beside its own, and the loop does not copy `writing`. The brief's grep did not cover the skill list, so `README.md` was left out of the step's paths.
2. The `standards:` line of `.scratch/3-the-writing-base/orchestrator-state.md` still names the old path; the brief gives that change to the orchestrator at landing.

## 2. Proof

1. `1-report.md`: the DONE/NOT DONE row for the `SKILL.md` edits and the revert table row cite "the four `grep -n` lines of the SKILL.md check" with `lines found: 4` and `lines found: 0`, and never quote the four commands, so the output cannot be reproduced from the report (change standard rule 7). The four lines are correct by direct reading (lines 28, 30, 109, 146).

## 3. Standards

1. `skills/repo-setup/SKILL.md` line 30, "What it reads" 3: one item holds four inputs from three skills, against `docs/dev/skill-layout.md` row 4, "A numbered list, one input per item". The two-skill form existed at the base, and the brief asked for the same form.
2. Line 28, "What it reads" 1, lists the contents of `templates/` in one item; the same pattern at the base.

## 4. Behaviour

1. A copy install from the README's loop gets a `/repo-setup` that cannot find the prose standard: on a scratch install of the step's state, `ls inst/repo-setup/../writing/references/prose-standard.md` prints `No such file or directory`, while the roadmap skill's file is found. At the base the file was in `repo-setup` itself.
2. While `skills/writing/` has no `SKILL.md` (until step 4), `utils/pin.sh` (line 95) and the skills CLI route link only folders with `SKILL.md`, so a tag cut between step 1 and step 4 would install a `repo-setup` without its sibling `writing`. The installed skills stay at v2.0.0 unless `pin.sh <tag>` runs.
3. The ASCII check skips a tracked file missing on disk (perl prints `Can't open ...` without setting `$bad`). This is at the base, not caused by the step.

## Not checked

- Whether the skills CLI installs a folder without `SKILL.md` (network, and it writes outside the repository).
- The landing run on main itself; reproduced on a scratch clone only.
- A live `/repo-setup` run on a new repository.
