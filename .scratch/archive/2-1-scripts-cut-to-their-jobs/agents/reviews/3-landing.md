# Landing of step 3 of plan 2.1

Roadmap entry 2.1, Scripts cut to their jobs; step 3 of 4, the scripts, landed. Next: step 4, the closing.

## Open items

- Open item D (2026-10-06), kind 3 (the reversal of a ruling), raised from step 2's review (`agents/reviews/2-refuter.md`, "3. Standards" 1): plan 3's ledger, `.scratch/3-the-writing-base/plan.md`, opened and not started, still copies entry 3's old gate and rests on its planted text: its "## Gate" section and the gate questions under it, step 2 ("The runs: a planted text with one break of each rule of `references/` ..."), step 3's check ("every planted break named"), and its rulings D9, Open item Gate 3 and Open item Gate 3b, which you ruled when the planted clauses were added. Step 2 of plan 2.1 removed those clauses from the roadmap by your approval of entry 2.1 and your ruling C.
  - (a) Carry the change into plan 3's ledger now: its gate copied again from the roadmap, the gate questions rewritten to match, step 2 running `/writing` on the real manuscript and the real grant only, step 3's check reading "every finding marked right by both reviewers", and a Rulings bullet in plan 3 saying that plan 2.1's ruling C replaces the planted-text parts of D9, Gate 3 and Gate 3b. Pro: plan 3's ledger agrees with the roadmap before anything is built on it. Con: it rewrites rulings of yours in another plan's ledger.
  - (b) Leave plan 3's ledger, and let plan 3's own `/spec` meet the difference as a false premise when it runs. Pro: no change to plan 3 now. Con: plan 3 stays in contradiction with the roadmap until then, and its `/spec` stops on it then.
  - Recommendation: (a). The lazy option is (b). Plan 2.1 goes on: none of its steps depends on the ruling.

## The landing

- Agents stopped: `ListAgents` listed the last reviewer of the step as completed and no agent of the step running.
- NOT DONE: nothing.
- Landed in the commit "Land step 3 of plan 2.1, the scripts": see `plan.md`, "Step 3, the scripts (landed 2026-10-06)", for the files, the deletions, the line counts before and after, and the versions.
- Found: the first review's 10 findings, closed in repair round 1; the run over the round's 3 findings, fixed at landing; two points declined to judge, closed under self-rule (`3-refuter.md`, Closed).
- Verification on main after the fixes: `sh skills/land/templates/checks.sh .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md` printed `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, `checks: 6 commands passed`. C1 on main printed nothing.
- Next: step 4, the closing: `.scratch/2-g-git-guard/` deleted, `/roadmap drop 2.G` with your yes on its diff, the closing report, `/roadmap done 2.1` with your yes, the tag and pin, and the archive.

## Agents

- Usage: brief check claude-opus-5-5 182025 tokens, 47 tool uses, 8.8 min; builder claude-sonnet-5-5 187087 tokens, 123 tool uses, 24.3 min, and round 1 276628 tokens (cumulative), 35 tool uses, 6.1 min; reviewer claude-opus-5-5 304550 tokens, 73 tool uses, 12.7 min; reviewer over round 1 claude-sonnet-5-5 166247 tokens, 42 tool uses, 6.4 min.
- The builder's first report did not pass its bar: the first run found 10 findings. Fixes at landing: 3 (the quoted PyYAML error in the report; exit 127 in `land`'s "The landing script", the state template and each open plan's state file; the reader's exit 1 in `session-retro`).
