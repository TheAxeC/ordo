# Landing of step 1 of plan 2.K

Roadmap entry 2.K, the skill-text fixes from the retro and the real run; step 1 of 2, the skill-text fixes; next: step 2, the closing.

Open items: none.

- The check of Steps 1: the runner's agent listing (ListAgents) showed no agent of this step; the builder aa8abf145025a6fc5 and both reviewers had ended.
- NOT DONE: none for this step.
- Landed: 19 files, 163 insertions and 63 deletions against main's head 6cc1ec2 (the base 64c500d), committed with this report; the fixes and versions are in `plan.md`, "Step 1, the skill-text fixes (landed 2026-10-13)". Versions: land 4.0.0, plan-orchestration 6.0.0, refute 4.0.0, spec 6.0.0, roadmap 1.4.0, repo-setup 5.0.0.
- Verify list: rewritten at Steps 2 to the character-set command of `docs/dev/building.md` as the cherry-pick brings it, with the filter that keeps only files on disk.
- Gate, the deleted-file run: the new check, run from a scratch worktree of 6cc1ec2 with `README.md` deleted, printed nothing and exited 0.
- Found: the run over round 1 found Spec 1, Proof 1 and Standards 1 to 3; all five were fixed on main at landing, as `1-refuter.md`, Closed, names.
- Verification on main, after the fixes: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/checks.sh .scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/orchestrator-state.md` printed `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, nothing for the character-set check, and `checks: 6 commands passed`, and exited 0.
- Usage: brief check a0f13c4670d9a0bcb claude-opus-5-5 296448 tokens, 71 tool uses, 12 min 45 s; builder aa8abf145025a6fc5 claude-sonnet-5-5 365423 tokens, 100 tool uses, 16 min 7 s (round 0) and 158969 tokens, 69 tool uses, 7 min 47 s (round 1); reviewer a75ecf975eb8af923 claude-opus-5-5 257289 tokens, 73 tool uses, 11 min 51 s; reviewer over round 1 ada9ebae51d5ff033 claude-sonnet-5-5 237582 tokens, 53 tool uses, 7 min 54 s.
- The builder's first report did not pass its bar (the first run's eleven findings, sent back in round 1); fixes at landing: 5.
- Next: step 2, the closing: the cost script and `agents/reviews/closing.md`, then `/roadmap done 2.K`, the tag and the pin, which go to Axel.
