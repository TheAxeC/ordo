# Step 1 landing report

Roadmap entry 2.E (grill). Plan step 1 of 17: Ordo's own `docs/adr/` and the ADR test in the template. Next: step 2, the `plan.yaml` settings.

Open items: none.

Agents stopped before the landing: the runner's agent listing showed the round's reviewer completed and no builder or reviewer running.

NOT DONE: nothing.

Landed with this commit:
- `skills/repo-setup/templates/docs/adr/README.md`: the ADR test of ruling A and the change rule of ruling E, in two paragraphs.
- `docs/adr/README.md` and `docs/adr/template.md`: Ordo's own ADR folder, byte-for-byte copies of the templates, no ADR yet.
- `skills/repo-setup/templates/CLAUDE.md` line 21: `docs/adr/` described by the same test.

Found: the brief check's four findings, closed in the brief before the build; one Standards finding of the review ("ruling" used outside the glossary's sense), closed in repair round 1; the run over the round found nothing.

Verification on main: `land.sh` printed the six `PASS:` lines, `ok: the plan-terms block equals the template` and `checks: 8 commands passed`, exit 0.

Usage: brief check claude:opus 98196 tokens, 13 tool uses, 155 s; builder claude:opus 88121 tokens, 16 tool uses, 140 s (round 0) and 93569 tokens, 3 tool uses, 62 s (round 1); reviewer claude:opus 109566 tokens, 19 tool uses, 166 s, and over round 1 68949 tokens, 11 tool uses, 111 s. The builder's first report did not pass the bar (one finding needed a repair round). Fixes at landing: none.

Next: step 2, `/spec 2.E 2`.
