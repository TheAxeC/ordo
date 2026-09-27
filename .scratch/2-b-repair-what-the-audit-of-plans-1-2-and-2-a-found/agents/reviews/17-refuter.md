# Refuter report: step 17

Reviewer: a fresh claude:opus agent, read-only, under ruling DD. Usage: 95,185 tokens, 21 tool uses, 268 s.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` from the worktree root, exit 0:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
```

## Spec

None. Every double-quoted string of the brief's "What to build" was counted in each of the four files (after stripping an `N. ` or `- ` prefix): each occurs once in each file it goes into and 0 times elsewhere; the rule 18 sentence occurs once in `docs/dev/change-standard.md` and 0 times in the template. The brief's strings match retro lines 45 to 246 word for word except the P5 correction, P10's `- ` prefix and rule 15's quoted first sentence. `git diff -U0 8e0847c` shows `@@ -18 +18,5 @@` for the coverage page and `@@ -45 +45 @@`, `@@ -46,0 +47 @@` for `skill-layout.md`; P2 directly after "**Edges are exercised, not assumed.**", P9 before P14 in rule 14. Fourteen proposals, no script proposal.

## Proof

None. Case 1: `grep -c` prints 20 and 19. Case 2: P1, P5, P13, P17 on lines 29 to 32, and P1, P13, P17 on lines 29 to 31 of the template. Case 4: the diff's hunks are `3c3 8c8 26c26 30,32c30,31 43c42 46,52c45 55c48 57,64c50` against `3c3 8c8 26c26 39c39 42,48c42 51c45 53,60c47` at the base, the other hunks' lines identical, line 26 differing only by the grep path. Case 5: `ok: docs/academic-coverage.md`, exit 0. `git diff 8e0847c --numstat` prints 5/1, 8/4, 2/1, 7/4; `grep -c ''` prints 241, 64, 72, 50.

## Standards

None. `LC_ALL=C grep -n '[^ -~]'` over the four files prints nothing; no spaced-dash asides; no history in the new lines; `git status --short` shows the four files and the report.

## Behaviour

1. `docs/dev/skill-layout.md:3` reads "Every `skills/<name>/SKILL.md` follows this layout". The new line 45 ("two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets") makes it false. Three Rules bullets on the tree break it: `skills/land/SKILL.md:165` (two requirements joined by a semicolon), `skills/land/SKILL.md:166` (a second sentence holding an independent requirement), `skills/spec/SKILL.md:191` (two sentences, two requirements). The report neither lists the sentence nor reports a stop; the fix lies in `SKILL.md` files outside the brief's paths.

## Not checked

- Whether every existing `SKILL.md` step order satisfies the new line 47 bullet.
- Whether the roughly 200 existing coverage rows satisfy the new P7, P11 and P16 sentences; `check_coverage.py` checks only listing, marks and the presence of reasons.
- Whether P16 conflicts with the `rebuild later:` bullet's "may go to entry 15.A".

## Closed

- Behaviour 1: not sent back and not fixed at landing. The three bullets named are a sample: a heuristic count over the ten `SKILL.md` files (list items outside fences holding a semicolon or a second sentence) gives 161 of 692 items as candidates, an upper bound, since a qualifier in a second sentence is allowed. Bringing the skills in line with the new rule is a sweep across all ten skills that no brief item asks for, so it is raised to the user as open item GG.
- Not checked 3: read by the orchestrator. No conflict: a `rebuild later:` part is one the skill's first gate does not need, so the first entry whose gate needs it is 15.A, which is what P16 says.
