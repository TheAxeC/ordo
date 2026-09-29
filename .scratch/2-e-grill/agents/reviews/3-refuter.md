# Step 3 refuter report (on .agents/worktrees/2e-3, the Opus build, base 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01)

A page this report cites is named with its section, never with a line number. A finding in code keeps its `file:line`. Saved by the orchestrator from the reviewer's final message, condensed where it repeats passing output.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
... every line PASS or ok, the ASCII line printed nothing ...
checks: 8 commands passed
exit=0
Verify 2: PASS: pin.sh scratch tests
Verify 3: 457 utils/pin.sh
Verify 4 as written: every hit under .scratch/; as cases ruling 2 gives it, with -- ':!.scratch': no output, exit 1
Verify 5, reverts sampled on scratch copies: M07, M13, M14, M20, M03b, M08c each red as the report quotes
Cases ruling 1: EQUAL (48 lines each)
The five agent files: cmp-identical to item 1's text; frontmatter keys description, effort, name only
README copy loop under a scratch HOME: ordo-gone.md removed, mine.md kept
Brief premises at the base: all reproduce
```

## Verdicts

- Items 1, 3, 4, 5, 6, 6a, 6b, 7, 8, 9: hold. Item 2: violated, Spec 1.
- Cases: all met, the case "a skill folder that is also another's agents folder" met for the form tested (Spec 1 is the form not refused).

## 1. Spec

- Spec 1, `utils/pin.sh:317`: `[ "${dir%/}" = "$agent_dir" ] && fail "$agent_dir is both a skill folder and an agent folder"` strips one trailing slash, while the agent folders strip every trailing slash (`utils/pin.sh:112`). A skill folder `<HOME>/.claude/agents//` is not refused: a probe gave status 1 with the pinned worktree moved from v3 to v4, links removed and "the links do not match the pin after linking". Failure scenario: a doubled trailing slash in `ORDO_SKILL_DIRS` gives a half-changed pin where the brief requires a refusal before anything changes. Fix: one line, stripping every trailing slash. Verdict: item 2 violated.
- The builder did not hand back the grep case at its first run; it built and reported the defect after. The diff meets cases ruling 1, so nothing depends on the missed stop. Verdict: none.

## 2. Proof

none

## 3. Standards

- `utils/pin.test.sh:531`: the comment says that with the directory refusal dropped "ln -sfn would then link inside that directory"; with that branch dropped the entry is still refused by the real-file branch (`utils/pin.sh:335-336`), and the test goes red only on the message (the report's M11). The comment states a consequence the revert does not produce (rules file rules 13 and 14).

## 4. Behaviour

- The report says the next pin "of a tag holding `agents/`" creates `~/.claude/agents`; pin mode runs `mkdir -p` for every agent folder whatever the tag holds (`utils/pin.sh:415`), so any pin creates it, a re-pin of v2.5.0 included, and `~/.agents/agents` when `ORDO_SKILL_DIRS` holds `~/.agents/skills`. The behaviour is item 2's; the report's before and after understates when it happens.

## Declined to judge

- Verify 7: the orchestrator's, at landing.
- Whether the runner's agent listing is what the skills can check: settled by the first dispatch after the next pin.
- The report's lines on the cases ruling predate `3-cases.md`.
- The README "With the skills CLI" commands against a real `npx skills` install: would touch the real HOME.

Reviewer usage: 197731 tokens, 33 tool uses, 10.4 minutes (621 s), claude:opus, a fresh agent (from its completion notice).
