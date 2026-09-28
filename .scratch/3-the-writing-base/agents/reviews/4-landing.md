# Step 4 landing report

Roadmap entry 3 (The writing base). Plan step 4 of 7: the `writing` skill. Next: step 5, a real draft of the user's.

## Open items

- Open item H (2026-09-28): step 5 needs `/writing`, and the installed skills are pinned at v2.0.0, which has no `writing` skill (`ls ~/.claude/skills ~/.claude-work/skills` lists none), so the runner cannot invoke `/writing`. Options: (a) tag main after step 4's landing as v2.1.0 and run `utils/pin.sh v2.1.0`, which links `writing` and moves every installed skill to main's version; step 5 then invokes `/writing` as a user would; pro: step 5 tests the skill as installed, con: the plan skills running this plan change mid-plan to main's version (the changes since v2.0.0 are the ones plans 2.B and 3 landed). (b) the orchestrator reads `skills/writing/SKILL.md` from main and carries out its Steps by hand, disclosed as not an invocation; pro: nothing installed changes, con: it does not test the skill's installation, frontmatter or triggers. Recommendation: (a). The lazy option is (b).

## The check of Steps 1

The runner's agent listing (ListAgents) showed no subagent running; the builder and both reviewers had finished. The peer session research-hub-20 is not an agent of this step.

## NOT DONE

- Nothing inside step 4.

## What landed

- `skills/writing/SKILL.md` (107 lines): `/writing <file> [--limit ...]` runs `templates/check_prose.py`, judges each flag against the rule it names, reads the text against the reference pages, and lists each problem with its line and rule, the allowed flags apart with their reasons. It writes nothing.
- `docs/academic-coverage.md` lines 82, 106 and 107 name their files of `skills/writing/`; the coverage check prints `ok: docs/academic-coverage.md`.
- `README.md`: a `writing` row, a sentence at line 7, and a paragraph after the order of use.
- `skills/writing/references/prose-standard.md` section 0: the no-history rule, with text about past events exempt (open item G, ruled (a)). `anti-patterns.md` names where the rule of every check of the script lives.
- Verification on main after the fixes at landing: seven `PASS:` lines, `verify: 8 commands passed`.

## What was found

- The first review: 2 Spec, 2 Proof, 2 Standards and 1 Behaviour finding, closed in repair round 1 (seven rulings, with open item G).
- The review over round 1: 1 Spec, 3 Proof, 3 Standards and 2 Behaviour findings. The `history` rule of Steps 2, the unmatched `--limit` flag, the Rules bullet and the long sentences were fixed at landing, with the 19 shifted citations in `3-rows.md`: 5 fixes. Each disposition is under the Closed heading of `4-refuter.md`.

## What is next

Step 5: `/writing` on `/Users/axelfaes/workspace/research-hub/funding/2026-fwo-senior-transplant/proposal/main.tex`, read only, once open item H is ruled.
