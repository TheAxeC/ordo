# Landing report: step 1 of plan 2.I

Roadmap entry 2.I Several plans in one session; plan step 1 of 3, several plans in one session in the skill texts; next: step 2, the real run in a scratch repository.

## Open items

- Open item ADR 0012, the landing commit's paths (2026-10-12, kind 3: a decision record the user ruled, D29). `docs/adr/0012-every-commit-on-main-names-its-paths.md` says "The landing commit takes its paths from `git diff --cached --name-only`." For a step that renames a file that command lists only the new path, so a commit naming only those paths leaves the old path's deletion staged, and the next commit on main sweeps it in (scratch run in `agents/reviews/1-refuter.md`, Verification). Step 1's `land` text uses `git diff --cached --name-only --no-renames`, which lists both.
  - Option (a), recommended: add "with `--no-renames`" to the ADR's sentence, so the record names the command the skill runs. Pro: the record and the skill agree, and a reader of the ADR gets a complete commit. Con: a change to the text of a record you ruled.
  - Option (b): leave the ADR as it is. Pro: your record stays word for word. Con: the ADR names a command that leaves a rename's old path out, and a reader who follows the ADR gets that defect.
  - Recommendation: (a). The lazy option is (b).

## The landing

- Agents stopped (Steps 1): the runner's agent listing showed no agent of the step running; the builder and both reviewers had completed.
- NOT DONE: nothing of the step. Plan 3's configuration block still holds `workers_at_once: 3` at line 27, removed at plan 3's next resume point (brief 1, Decisions 5).
- Landed with the commit: rulings D15 to D28 and C39 in the texts of `plan-orchestration` with `references/self-rule.md`, `spec`, `land`, `refute`, `plan` with its templates, `ordo-help`, `grill`, `roadmap`, `plan-retro`, `ordo-init`, `repo-setup`, `diagnose`, the glossary (template and block), `README.md`, `.agents/plan.yaml`'s comment and the plan-loop figure: one limit on steps in flight across every open plan, read from `.agents/plan.yaml`; the verify list kept equal to the verification page; worktrees and branches named `<slug>-<step>`; every commit on main naming its paths; `/plan-orchestration` with no entry running every open plan in roadmap order and `/plan-orchestration <entry>` running that plan alone; the projects form; the pause, the report, the recurring-findings pass, the night rule and next-entry mode over several plans; `/ordo-help` with no entry printing each open plan's position. The booking in `plan.md` lists the versions.
- Found: the brief check's findings closed in the brief, its finding on the projects form closed under self-rule as C39; the first review found 10 points and two declined points, closed in repair round 1 except Spec 3 (ADR 0012), raised as the open item above; the run over the round found 2 points, fixed at landing (Spec N1, next-entry mode written over every open plan; Standards N1, the resumption sentence split into one bullet per requirement).
- Verification on main: `land.sh` printed `checks: 6 commands passed` and `22 files changed, 297 insertions(+), 208 deletions(-)`; after the fixes at landing `checks.sh` printed `checks: 6 commands passed`; `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- Next: step 2, the real run: two open plans in a scratch repository whose next steps change the same file, run by the orchestrator over step 1's texts.

## Agents

- Brief check claude-opus-5-5, 286488 tokens, 61 tool uses, 13 min 15 s.
- Builder claude-sonnet-5-5, 126733 tokens, 115 tool uses, 19 min 31 s (round 0); 175667 tokens, 16 tool uses, 2 min 17 s (round 1).
- Reviewer claude-opus-5-5, 295878 tokens, 56 tool uses, 9 min 43 s; reviewer over round 1 claude-sonnet-5-5, 225180 tokens, 31 tool uses, 5 min 21 s.
- The builder's first report did not pass its bar: 10 findings, 9 closed in repair round 1 and 1 raised. Fixes at landing: 2.
