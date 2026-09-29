# Step 1 brief check (on main at bc83a4d)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

## 1. Names

The command for every name below was `git grep -n -i -e '<name>' -- . ':!.scratch/archive'`, run for each of these names: `supersede`, `rule clash`, `ADR`, `not obvious from the code`, `alternatives rejected`, `adr/README`, `adr/template`, `superseded by`, `dated note` and `refinement`. The plan's own hits are not listed below: `.scratch/2-e-grill/plan.md` lines 7, 14, 33, 34, 43, 44 and 74 to 83.

- `docs/adr/README.md` and `docs/adr/template.md` (new files). Hits outside the paths: `skills/repo-setup/SKILL.md:118` and `:119`, the rows that copy the two templates. Both lines describe a new repository and stay true.
- The template README's first paragraph, with the terms "rule clash", "supersedes" and "alternatives rejected". Hits outside the paths:
  - `skills/repo-setup/templates/CLAUDE.md:21:- `docs/adr/`: the decisions, with the alternatives rejected. A change that contradicts an ADR is a rule clash.` Under the new README, only a decision that binds work after its plan closes is an ADR, and "Every other decision stays a ruling of the plan that made it". "the decisions" with no qualifier reads as every decision, so the two lines contradict each other (change-standard, rule 19). The brief says "Neither line needs to change" without addressing this.
  - `docs/glossary.md:73` and `skills/repo-setup/templates/plan-terms.md:68` define "rule clash" as "a contradiction between two established rules or decisions, a stop for the user's ruling". This stays consistent with the new text.
  - `skills/repo-setup/templates/shared-rules.md:9` and `:20` ("Surface rule clashes", "a rule clash") stay true.
  - `skills/plan-orchestration/SKILL.md:278` (the stop "A rule clash") stays true.
  - `skills/repo-setup/templates/docs/adr/template.md:3:Status: <proposed | accepted | superseded by NNNN>` is consistent with the new "whose status then reads `superseded by NNNN`".
  - `docs/dev/change-standard.md:41` and its template copy match on "superseded by a later one". That is about concurrent paths and is unrelated.
- "ADR" in general: `README.md:13` and `:81`, `docs/dev/change-standard.md:31` and its template copy, `skills/repo-setup/templates/docs/dev/change-standard.md:8`, `skills/repo-setup/templates/docs/dev/prose-standard.md:3`, `skills/repo-setup/SKILL.md:3`, `skills/roadmap/SKILL.md:148` stay true; `docs/roadmap.md:24` is unaffected.
- `refinement`, `dated note`, `not obvious from the code`: no hit outside the paths and the plan, except `.scratch/reviews/2026-09-24-audit/4-coverage-and-roadmap.md:63` ("refinement iterations"), which is unrelated.
- Ordo has no tracked `CLAUDE.md`: `git ls-files CLAUDE.md` printed nothing. `git ls-files docs` lists no page that describes Ordo's `docs/` tree, so adding `docs/adr/` makes no listing false.

Findings: `skills/repo-setup/templates/CLAUDE.md:21` ("the decisions, with the alternatives rejected") reads as every decision, which the new README contradicts with "Every other decision stays a ruling of the plan that made it" (change-standard, rule 19). The brief's premise says the line needs no change and its paths leave it out. Either widen the paths with that line, or state in the brief why the line still holds.

## 2. The step line

- "Ordo's own `docs/adr/`, copied from `repo-setup`'s templates" is served by items 2 and 3.
- "the ADR test of ruling A written into `skills/repo-setup/templates/docs/adr/README.md`" is served by item 1.
- "check: `diff` of Ordo's README against the template" is served by Cases 1 and verify item 2.
- "the ruling A sentence read in both" is served by Case 3 for the template, and for Ordo's copy through the empty diff.
- The brief also writes ruling E's change rule (item 1, decision 1). No step line in plan.md assigns ruling E. The brief records this as decision 1, so it is not silent.

Findings: none.

## 3. Premises

- "Ordo has no `docs/adr/`": `ls docs/adr` printed `ls: docs/adr: No such file or directory`. This matches.
- "`skills/repo-setup/templates/docs/adr/README.md` (7 lines, ...)": `wc -l` printed `8 skills/repo-setup/templates/docs/adr/README.md`. `cat -n` shows the heading `# Architecture decision records` at line 1, the intro paragraph at 3, the naming paragraph at 5, the table at 7 and 8. This does not match.
- `template.md` holds Status, Context, Decision, Alternatives rejected and Consequences: this matches (19 lines by `wc -l`).
- The first paragraph (`sed -n 3p`) matches verbatim.
- `template.md:3` is `Status: <proposed | accepted | superseded by NNNN>`. This matches.
- `skills/repo-setup/SKILL.md:118-119` and `skills/repo-setup/templates/CLAUDE.md:21`: the grep lists exactly those lines outside `.scratch`. This matches, although "neither line needs to change" is disputed in check 1.
- Verify item 1 expects `checks: 8 commands passed`: the `verify:` list holds 8 commands. This matches.

Findings: the premise "7 lines" is wrong: `wc -l` prints 8, and the file opens with a heading the brief leaves out.

## 4. Cases and checks

- Cases 1 and 2 are consistent.
- Case 3 is consistent as a reading case. The text item 1 dictates breaks the prose standard's "D. Structure" rule ("Paragraphs cover one idea and stay under roughly four sentences"): the paragraph has six sentences and covers three ideas. Decision 2 forbids rewording except to fix a breach, and change-standard rule 4 reserves a rewrite of dictated text to the orchestrator. Two sentences are above "E. Sentence shapes" ("under roughly 20 words"): 28 and 26 words.
- Case 4 is consistent with change-standard rule 10.
- Case 5 is consistent.
- The glossary terms "ruling", "rule clash" and "booking" are used in their glossary senses.

Findings: item 1's dictated paragraph breaks the prose standard's "D. Structure" and, in two sentences, "E. Sentence shapes". Split it into a test paragraph and a change paragraph, and revise decision 1 to match.

## 5. The question

- Case 1: yes on its own; an unchanged old README copied gives an empty diff.
- Case 2: yes on its own for the copy; no for item 3's goal.
- Case 3: no.
- Case 4: yes; a guard case.
- Case 5: no.
- The step line's check: no for ruling A; it says nothing of ruling E, which only Case 3 carries.
- Item 1's check: no for the new paragraph; yes for "The file naming paragraph and the empty table stay as they are", which has no case.
- Item 2's check: no. Item 3's check: no.

Findings: item 1's requirement that the naming paragraph and the table stay unchanged could fail without any case going red. Add cases on `git diff bc83a4d` of the template README (line 3 only) and of `template.md` (nothing).

## 6. Implied inputs

- Not a code step.

Findings: none.

## Declined to judge

- Whether ruling E belongs in step 1 (decision 1): the orchestrator's or the user's call; no step line assigns it.
- Whether "with the reasoning and", kept from the old text, may sit inside the ruling A sentence.
- The split wording and the CLAUDE.md wording proposed are suggestions; the orchestrator writes the substitute.

Agent usage: 98196 tokens, 13 tool uses, 2.6 minutes (155 s), claude:opus, a fresh agent (from its completion notice). Saved by the orchestrator from the agent's final message; the lists of hits that stay true are condensed to their `file:line`.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Names, `skills/repo-setup/templates/CLAUDE.md:21`: the premise now says the line changes; item 4 rewrites it to "the decisions that bind work after the plan that made them closes, with the alternatives rejected"; the path is added as `lines 21-21`, with a case and the ASCII check.
- Premises, "7 lines": now "8 lines", naming the heading at line 1 and the paragraph and table line numbers.
- Cases and checks, the dictated paragraph: item 1 now gives two paragraphs (the test, four sentences; the change rule, four sentences), the longest sentences 20 words; decision 1 revised to say so, and to say why ruling E lands here and why the reasoning stays in the test's paragraph.
- The question, the unchanged parts: two cases added, `git diff bc83a4d` of the template README changing only the first paragraph, and of `template.md` printing nothing.
