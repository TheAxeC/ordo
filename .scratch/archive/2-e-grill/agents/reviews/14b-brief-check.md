# Step 14b brief check (on main at 0ad884f)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/14b.md` (read on disk, untracked). While this check ran, the working copy also held uncommitted changes to `.scratch/2-e-grill/plan.md` and `orchestrator-state.md` that the check did not make: step 14c and its ruling were added (`git diff --stat` printed `plan.md | 2 ++`, `orchestrator-state.md | 8 +++-----`).

## 1. Names

- Item 4 of `docs/dev/blind-comparison.md` ("The judge's input") and item 9's list: `git grep -n -i -e "judge's input" -e "judge receives" -e "judge gets" -- ':!.scratch'` printed:
  - `docs/dev/blind-comparison.md:8:4. **The judge's input.** ...`
  - `docs/roadmap.md:208:- Waits on: 2.E, for step 14b's judge's input; 2.H, for session-retro; 21, ...`

  The roadmap line refers to step 14b by name and does not restate item 4, so the change leaves it true.
- `git grep -n -i "blind-comparison\|judge" -- skills docs README.md CLAUDE.md ':!docs/dev/blind-comparison.md'` found nothing else that says what the judge receives. It found these:
  - glossary `docs/glossary.md:130` (blind comparison), `:133` (critical failure) and `:137` (verdict);
  - `docs/dev/change-standard.md:21`;
  - the template `change-standard.md:21`;
  - `shared-rules.md:15`.

  The change leaves each of them true.

Findings: none. The brief's premise grep now prints one more line than the brief quotes; that is under 3.

## 2. The step line

- "`docs/dev/blind-comparison.md`, item 4 'The judge's input'": What to build item 1.
- "the judge gets the input without the files of either skill being compared": item 1, its first sub-bullet.
- "beside what item 4 already leaves out": item 1 keeps the existing line unchanged as the parent.
- "every page that restates item 4 changed with it": no item. The premise says no page restates it, and section 1 confirms that.
- "check: the changed text read in place": Verify 5 (the case walk).
- "and step 14 run again under it": this is the orchestrator's run after landing, as the brief's introduction says. Whether the dictated text can be carried out in that run is under 5.
- "(1 commit)": nothing to map.
- What to build item 2 (the record's new sub-bullet) serves none of the step line's parts. It carries the brief's Decision 3.

Findings: none.

## 3. Premises

- `grep -n "^- The judge's input" .scratch/2-e-grill/plan.md` printed `131:` on disk. `git show HEAD:.scratch/2-e-grill/plan.md | grep -n "^- The judge's input"` printed `130:`. The brief (line 130) matches main. The uncommitted 14c lines move it to 131, and the preparation commit will carry that into the builder's base.
- `grep -n '^- 14b' .scratch/2-e-grill/plan.md` printed `49:`. Matches.
- The review file: at line 22 the judges are "given only a clean clone of the input at 833e2e8". At line 360, "Judges 1 and 2 read `skills/grill/SKILL.md` from the input clone and judged both outputs by its decision form". Matches.
- `cat -n docs/dev/blind-comparison.md` printed item 1 at line 5, item 2 at line 6, item 3 at line 7 and item 4 at line 8. **Differs:** the brief says "Item 1 (line 6)" and "item 2 (line 7)". Item 1 is line 5 and item 2 is line 6.
- `git grep -n -i -e "judge's input" -e "judge receives" -e "judge gets" -- ':!.scratch'` printed `docs/dev/blind-comparison.md:8` and `docs/roadmap.md:208`. **Differs:** the brief says it "prints only `docs/dev/blind-comparison.md:8`". Line 208 came with 07279c7 (entry 22.A). The conclusion that no page restates item 4 still holds.
- Glossary lines 130 and 137: `sed -n 130p` and `sed -n 137p` printed "blind comparison" and "verdict, of a blind comparison". Matches.
- `git grep -n blind -- skills` printed only `skills/repo-setup/templates/docs/dev/change-standard.md:21` and `skills/repo-setup/templates/shared-rules.md:15`. Matches.
- `ls docs/adr` printed 0001, 0002, 0003, README.md and template.md. Matches.
- What to build item 2's anchor: `grep -n -x -F '   - the input, or its path;' docs/dev/blind-comparison.md` printed `14:`. Matches.

Findings:
1. Item 1 is line 5 and item 2 is line 6, not 6 and 7.
2. The grep prints `docs/roadmap.md:208` as well. The brief should quote it and say it stays true.
3. The ruling's line is 130 on main but 131 once the uncommitted 14c lines are committed. The brief's "read on main at 0ad884f" line number will be stale at the builder's base.

## 4. Cases and checks

- C1 to C6 as cases: none breaks the rules file or a standard as a reading.
- The dictated text of What to build item 1, against the standards:
  - **Its first sub-bullet holds two rules joined by "and".** "the judge's copy of it has them removed, and the record names each path removed" are two requirements, each breakable while the other holds. `docs/dev/skill-layout.md`, "Lists and tables", first bullet, makes those two bullets. The second is also stated again by What to build item 2 (item 9's list), so it can simply be dropped from item 4.
  - **Passive voice where the actor matters.** "the judge's copy of it has them removed" hides who removes the files. Prose standard section E, "Passive voice", says to rewrite unless the actor is irrelevant. Items 2 and 3 of the same page name the actor ("the orchestrator removes ...").
  - **Two words for one act.** The parent line says "The judge receives" and the sub-bullet says "The judge gets". Prose standard section D, "No synonym cycling", asks for one term.
- The brief's "Read, with sections or line ranges" item 3 says: "`docs/dev/skill-layout.md`, 'Lists and tables': a qualifier stays in a sub-bullet under its rule." The standard says the opposite: "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule" (`grep -n -i qualifier docs/dev/skill-layout.md` printed line 49). The brief misstates the standard the builder is told to take from it.

Findings:
1. The first sub-bullet has two rules in one bullet (skill-layout, "Lists and tables").
2. "has them removed" is passive with the actor relevant (prose standard, E).
3. "receives" and "gets" cycle between two words (prose standard, D).
4. Read item 3 misstates skill-layout's qualifier rule.

## 5. The question

The goal the step delivers: a judge of a blind comparison is never held to, or shown, the text of either skill compared.

- **C1: yes, it could pass without the goal being reached.** Removing `skills/grill/` from a copy of 833e2e8 leaves grill's full text and its decision form in the judge's copy. Each item below is quoted text in files that are not "files of the skill":
  - `git show 833e2e8:.scratch/2-e-grill/agents/reviews/12-round-0.diff` holds `+++ b/skills/grill/SKILL.md` with `@@ -0,0 +1,226 @@` (the whole SKILL.md as added lines) and `+++ b/skills/grill/references/decision-form.md`.
  - `.scratch/2-e-grill/agents/briefs/12.md` is the build specification of the skill.
  - `docs/glossary.md:29, 32, 33, 43, 84, 93` at 833e2e8 define **decision form**, **design bar**, **design tree**, **frontier**, **reference line** and **round**, each "Stated in: `grill`".
  - `skills/repo-setup/templates/plan-terms.md` holds the same terms.
  - `.scratch/2-e-grill/plan.md` Rulings G and G2 and the "Step 12, ..." bullets describe the decision form.
  - `git grep -l -i grill 833e2e8 | wc -l` printed 136 files.

  Evidence that this reaches a judge in practice: judge 4's transcript (`~/.claude/projects/-Users-axelfaes-workspace-ordo/3998c800-.../subagents/agent-afb497f8e385d0af2.jsonl`, run on a copy with `skills/grill/` removed) has, at line 31, `plan.md`'s "the reference line of `grill`'s decision form is labelled by the bar ..." and "**decision form**, **design bar** and **reference line** from rulings G and G2".

  The same transcript at line 5 shows the installed grill's description ("grill: Settle a roadmap entry's design decisions before its plan opens, ...") in the judge's skill listing. `ls -la ~/.claude/skills | grep grill` printed the link `grill -> /Users/axelfaes/.local/share/ordo-stable/skills/grill`, so the runner shows every judge that text at launch whatever file rule the judge follows, and the Skill tool can load the whole SKILL.md. C1's "A judge reads neither skill's text anywhere, an installed copy included" is therefore not delivered by removal plus "no other file".

  Removing every file that quotes grill does not work either. `.scratch/2-e-grill/plan.md` holds both grill's form (Rulings G, G2, Step 12) and the ruling "Entry 3 and step 13" that both outputs must be checked against. Judges 3 and 4 counted a misstated ruling from that file as a critical failure, and after step 14a grill quotes such rulings. Removing that file would break item 5's "a claim the input contradicts".

  Judges 3 and 4 were kept off grill's standard by an instruction: "Judge each output by what the entry and the user need ... not to take any skill's text as the standard". The dictated text carries no such instruction, and item 4's "nothing else" reads as forbidding one. Judge 4's prompt also said "do not use the Skill tool"; the dictated text does not say that either.
- **C2: yes.** An input that holds none of a skill's files can still quote its text. `grep -l "Settle a roadmap entry's design decisions before its plan opens" ~/.claude/projects/-Users-axelfaes-workspace-ordo/*.jsonl | wc -l` printed 2 of 5, so session transcripts carry installed skills' descriptions. Entry 22.A's `session-retro` comparison takes 2.E's sessions as input (`docs/roadmap.md:207`). A diff that changes a skill's text is the same case. "Nothing removed, record says none" passes while the judge reads the skill's text.
- **C3: yes.** "The files the input names as its sources ... are part of the input, less the files of either skill" names no one who removes those files. The sources are read in place (judges 2 and 4 read `/Users/axelfaes/workspace/research-hub` directly), not from a copy. A judge given no skill name cannot tell which files to avoid, which is the argument the brief's own Decision 1 makes. For research-hub: `grep -rl -i grill` found `tools/skills/catalog.yaml:1229-1241` (summaries of `grilling` and `grill-with-docs`) and `projects/ideas/engram/skills-lock.json:40-49`, which are text about the compared skill, not its files. In a sources repository that holds a skill's folder, the carve-out would be enforced by nobody. `find` shows `cathedra/.agents/skills/grill-with-docs` and `game-engine/.agents/skills/grill-with-docs` exist, so such a repository exists on this machine.
- **C4: yes.** The text forbids opening the installed file, but the runner shows the installed skill's description at launch (judge 4's transcript, line 5), and the text does not forbid the Skill tool. The case passes as a reading while the judge is shown the skill's text.
- **C5: no.** Reading another clone of the other skill is ruled out by "no other file". This holds only as far as the judge's instruction does, and the installed-copy point of C4 applies to a skill installed on the machine.
- **C6: no.** It is a preservation check. It says nothing on the goal, and cannot pass by missing it.
- **The step line's check, "the changed text read in place" (Verify 5): yes.** A walk of C1 to C6 on the changed page confirms the text says what it says, and every case above can be walked true while the judge still reads grill's text through the ledger, the glossary or the skill listing.
- **"step 14 run again under it": yes.** An orchestrator following the dictated text removes `skills/grill/`, names it in the record, and gives the judge a copy that still holds `12-round-0.diff`, `briefs/12.md`, the glossary terms and plan.md's rulings. It also launches the judge with the installed grill listed. That is the same input judges 3 and 4 had, minus the instruction that kept them off grill's standard.
- **"and no other file" against the protocol's other items:** it conflicts with item 5. Item 5 counts "a citation that does not resolve" as a critical failure, and outputs cite URLs and files outside the input. Side-1's output cites `https://raw.githubusercontent.com/vercel-labs/writing-guidelines/main/README.md`, `https://docs.vale.sh/...`, `https://developers.google.com/style/dashes` and others (`sed -n 24,212p` of the record, grepped for URLs). Grill's reference line requires a source read in the session.

  The text does not say whether fetching a URL is reading a file. Read strictly, the judge cannot check whether those citations resolve, so item 5 cannot be applied to them. Judge 4's prompt allowed "files outside it that the outputs cite". The dictated text withdraws that, and the step 14 rerun would use the narrower rule.
- **What to build item 1, Verify 2 and 3: yes.** A line counted once and a diff limited to the two edits both pass on the dictated text, so they cannot catch the gaps above.
- **What to build item 2 (the record's sub-bullet): yes.** Naming the paths removed shows the user what was taken out. It does not show what the judge still read or was shown.

Findings:
1. C1: removing the skill's folder leaves grill's full text in the input: `12-round-0.diff` (226 added lines of SKILL.md plus decision-form.md), `briefs/12.md`, the glossary's six grill terms, `plan-terms.md` and plan.md's rulings. Judge 4 read the latter under a removal like this one. Removing those files instead would break item 5, since `plan.md` also holds the rulings the outputs are checked against. What closes it is a rule on the judge's standard, like the instruction judges 3 and 4 were given ("judge by what the input and its user need; no skill's text, wherever it is quoted, is the standard"). Item 4's "nothing else" currently reads as forbidding that instruction. This is a change of the ruling's scope and the protocol's wording, which is the user's call.
2. C1 and C4: an installed copy is shown to the judge by the runner's skill listing, and the Skill tool can load it. Judge 4's transcript line 5 shows the grill description, and `~/.claude/skills/grill` is a link. The dictated text has no rule that the judge uses no skill, and none that the judge is launched without either compared skill installed. File removal plus "no other file" cannot reach this.
3. C2: an input that is itself a record (session transcripts, a diff that changes a skill) quotes skill text with no skill files to remove. Two of five top-level transcripts carry grill's description, and 22.A's `session-retro` comparison uses such transcripts as its input.
4. C3: "less the files of either skill" in a sources repository is enforced by nobody. The sources are read in place, not copied, and the judge has no skill name. Either the orchestrator copies the named sources into the judge's copy and removes from that copy too, or the text says who removes them.
5. "and no other file" conflicts with item 5's "a citation that does not resolve". URL citations, and files outside the input that an output cites, cannot be checked under a strict reading. The step 14 judges' prompt allowed them. The text must say whether a judge may open what an output cites, other than a file of either skill.

## 6. Implied inputs

- Not a code step: the brief changes one page's text and no script.

Findings: none.

## 7. ADRs

- `docs/adr/0001-the-writing-base-reads-the-prose-standard-where-it-is.md` (proposed): governs where `/writing` reads the prose standard. It does not touch the step.
- `docs/adr/0002-the-prose-standard-holds-over-the-academic-sources.md` (proposed): governs which rules the writing skills apply. It does not touch the step.
- `docs/adr/0003-a-fresh-read-only-agent-reviews-a-draft.md` (proposed): governs `/writing`'s reviewer. It is about a review of a draft, not a blind comparison's judge, so it does not touch the step.
- The brief says no ADR touches the step, which agrees.

Findings: none.

## Declined to judge

- Which remedy for findings 5.1 to 5.5 is right: an instruction on the judge's standard, a judge launched without the compared skills installed, copying and pruning the sources, a rule on URLs. Each changes the protocol beyond the ruling's words, so these are the user's call.
- Whether What to build item 2 (a new field of the record, from the brief's Decision 3) needs the user's yes as a protocol change the ruling did not name. Declined as the session's judgment.
- The builder's Verify 1 (`checks.sh`, "checks: 10 commands passed") was not run. The state file's `verify:` list has 10 entries (`grep -n -A15 "verify:"` on the state file), so the expected count matches.

Agent usage: claude-opus-5-5 (from this agent's environment; the session reads the served model from the runner's record). Tokens, tool uses and minutes are not visible from inside this agent; about 35 tool calls were made.

Usage from the completion notice: 129145 tokens, 43 tool uses, 384165 ms; served model claude-opus-5-5 (from its transcript).
