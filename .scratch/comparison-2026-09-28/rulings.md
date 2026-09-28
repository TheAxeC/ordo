# Comparison of Ordo with other skill packs: proposals and rulings

The record of the comparison of Ordo with mattpocock/skills, obra/superpowers, ConnorGriffin/skills, Mzzkc/marianne-ai-compose and broadkent/self-hydrating-notebook, and of Axel's rulings on each proposal. It is the input for the roadmap entries that carry the accepted items. `findings-by-cause.md` beside it is the count of the 953 findings of the 53 refuter reports of the four archived plans by cause, which points 1 and 10 rest on (recounted with `grep -c` per cause: BRIEF 116, BUILDER 807, REVIEWER-WRONG 13, OTHER 15, UNCLEAR 2).

The source repositories were cloned under the session scratchpad; the file and line citations below are into those clones (mattpocock at c55ee46, superpowers at 8ca22db, ConnorGriffin at aa454ca, marianne at e9f9c3b).

## Ruled

| Item | What it is | Ruling (2026-09-29, Axel) |
|---|---|---|
| CLAUDE.md sentence | "Write for a reader who was not inside my reasoning: each item says what exists now, what changes, what it replaces and why; these rules ban flourishes, never explanation." added to the plain-prose rule of `~/.claude/CLAUDE.md` | yes; written |
| 1 | orchestrator reproduces each reviewer finding before sending it | withdrawn: double work; 0 of 13 wrong findings reached a builder |
| 2 | `refute` Rules: the reviewer invokes no skill and starts no agent | yes |
| 3 | refuter report template: heading "Declined to judge" | yes |
| 4 | brief, for a step that builds a script: the inputs the step implies but never names, each with its expected result | yes |
| 5 | secrets in quoted command output replaced with `<REDACTED>` | yes |
| 6 / C | `diagnose` skill: one command red on the exact symptom before any theory; shrink; 3-5 ranked falsifiable hypotheses shown to Axel; one change per probe; fix with a test red without it; cause in the booking. `plan-orchestration` line 96 points at it. Source: mattpocock `skills/engineering/diagnosing-bugs/SKILL.md` | yes |
| 7 | `/roadmap add` and `/plan` ask of every gate and step check "could this pass without the goal being reached?" Source: marianne `docs/validation-patterns-guide.md` line 511 | yes |
| 8 | `docs/dev/skill-layout.md`: a description is at most 1,024 characters; `spec`'s description (1,031) shortened | yes |
| 9 | expand-contract for wide renames in `/plan` | dropped for now; raised again when a plan in a code repository has a wide rename |
| 10 | at `/spec`, after the brief and before the build, a fresh read-only agent checks the brief against the tree: every name the step changes grepped, hits outside the path list listed; every item of the plan's step line present; every premise command rerun; Cases consistent with the rules | yes |
| A | `grill` skill (from mattpocock `grilling`): rounds of every question whose prerequisites are settled, each with options, pros and cons, a recommendation and the lazy option; facts looked up by agents; answers written into the roadmap entry, the plan's Rulings and the glossary as they settle; one skill, so the writing half cannot be skipped | yes |
| B | glossary: `docs/glossary.md` in Ordo and in `repo-setup`'s templates; `skill-layout.md` rule that a term is used only as the glossary defines it | yes |
| D | `session-retro`, reading session transcripts | no: Axel would not use it |
| E1 | `/refute` gives a verdict per item of the brief's "What to build" and per Case (holds / violated / not applicable; met / partial / unmet / not verifiable); a finding carries a failure scenario. Source: ConnorGriffin `skills/tools/code-review/SKILL.md` | yes |
| E2 | standalone `/review` of any diff since a commit, outside plans, same verdict form | yes |
| F | `/roadmap`: a "Not yet specified" section for work whose gate cannot yet be named; `/plan` refuses such an entry. Source: mattpocock `skills/engineering/wayfinder/SKILL.md`, "Fog of war" | yes |
| G | `repo-setup` offers a PreToolUse hook blocking `git push`, `git reset --hard`, `git clean -f`, `git checkout .`, `git restore .`, leaving `git branch -D` and `git worktree remove` to `/land`; Axel installs it. Source: mattpocock `skills/misc/git-guardrails-claude-code/SKILL.md` | yes |
| wait-what | a skill Axel types when a message did not land: re-explain with the missing context, in simple English, with the glossary's terms. Source: mattpocock `skills/productivity/wait-what/SKILL.md` | yes |
| Blind comparisons (entries 5, 6, 7, 9, 10) | one protocol cited by each gate: same input for both outputs; judge sees them unlabelled in random order with only the input; each output read whole and its critical failures listed before a preference; verdict written with reasons; judged twice with the order swapped, disagreement is a tie; a fresh agent judges twice and Axel reads both outputs and the verdict for the final call | yes |
| Entry 9 | the gate adds: for a sample of citations the cited passage is read and supports the claim; an inaccessible source is reported, not written around | yes |
| Entry 7 | the gate adds a verdict per referee point: addressed / partly / not / cannot be checked from the manuscript, judged by reading | yes |
| Entry 10 | its interview is `grill` (A) pointed at a research idea; the novelty check stays | follows from A |
| Entries 3 and 4 lesson | "run checks on a real corpus" | withdrawn: 2.C removes those checks and 3 and 4 are redrafted |
| codebase-design | a design-standard skill and page, focused on design principles in the form of Cathedra's `docs/dev/standards/coding-standards.md` "Design principles" (lines 58-70): each principle (single responsibility, separation of concerns, open/closed, Liskov, interface segregation, dependency inversion, DRY, keep it simple, YAGNI) stated in the concrete form it takes in the repository, "a principle without a concrete form is a slogan", a check named where one exists. Source: mattpocock `codebase-design` | yes (2026-09-29, Axel) |
| improve-codebase-architecture | an Ordo skill that scans a repository for violations of those same design principles, writes candidates (files, problem, fix, benefit, strength), and grills through the one Axel picks into a roadmap entry | yes (2026-09-29, Axel) |
| grill | as A | yes, confirmed again (2026-09-29, Axel) |
| writing-for-agents | its rules into `docs/dev/skill-layout.md` | yes (2026-09-29, Axel) |
| wayfinder | no separate skill; F and A cover it | agreed (2026-09-29, Axel) |
| pruning pass | the writing-for-agents rules applied to every Ordo skill, Axel reads the whole diff | yes, as the last entry of the roadmap, after 16 (Switch over), no sooner (2026-09-29, Axel) |
| wizard | a skill that generates a script walking a person through steps only a person can do, writing each value to `.env` or a secret, confirming before each irreversible action | yes, wanted (2026-09-29, Axel) |
| teach | a teaching workspace: mission file, short lessons tied to it, reference sheets, learning records, retrieval practice and spacing | Axel disagreed both that it does not belong in Ordo and that mattpocock's should be installed as is: it is reimplemented as an Ordo skill (2026-09-29) |

## Open, for Axel

- Where the accepted items go. Recommendation: two roadmap entries after 2.C, through `/roadmap add`: 2.D, process changes to existing skills (2, 3, 4, 5, 7, 8, 10, E1, F, writing-for-agents into `skill-layout.md`, the blind-comparison protocol and the gate changes of entries 7, 9 and 10 as roadmap edits); 2.E, new skills (grill with the glossary, diagnose, standalone review, git guard, wait-what, codebase-design, improve-codebase-architecture, wizard, teach). The pruning pass is ruled as the last roadmap entry. The lazy option is one large entry.
- Step 3 of 2.C: tag v2.2.0 and `utils/pin.sh v2.2.0` (open item B of the 2.C state file).

## Answers owed or given, for the record

- grilling, grill-me, grill-with-docs: one interview. `grilling` (28 lines) is the interview. `grill-me` is one line that calls `grilling`, for use outside a repository. `grill-with-docs` is one line that calls `grilling` and `domain-modeling`, which writes a glossary and decision records as the interview settles them; its docs page says its most reported problem is that the model loads `grilling` and skips `domain-modeling` (`docs/engineering/grill-with-docs.md` line 52). Ordo's `grill` (A) is the grill-with-docs behaviour in one skill.
- wayfinder: its "Not yet specified" section is F. The rest (a map of decision tickets on an issue tracker, one ticket per session, research tickets run in parallel by agents) is covered by F and A in Ordo's roadmap and ledger; no separate skill.
- codebase-design: a vocabulary for module design (module, interface, depth, seam, adapter, leverage, locality), the deletion test, "one adapter is a hypothetical seam, two a real one", and testability rules. improve-codebase-architecture: scans a repository's recently changed areas for shallow modules, writes a report of candidates each with files, problem, solution, benefits and a recommendation strength, then grills through the one Axel picks. Ordo runs plans in other repositories (Cathedra among them), so both are in scope for Ordo; the earlier "not Ordo's job" was wrong.
- writing-for-agents: rules for text an agent reads: a description is a trigger (front-load the leading word, one trigger per case); state the target behaviour rather than a prohibition, which draws attention to what it forbids; one source of truth per meaning; delete every sentence that does not change behaviour from the default; each step ends on a completion criterion; push reference material out of the main file.
- wizard: generates a bash script that walks a person through steps only a person can do (open a dashboard URL, copy a key, paste it), writing each value to `.env` or a GitHub secret, with a confirmation before each irreversible action.
- teach: a stateful teaching workspace: a mission file, short HTML lessons tied to it, reference sheets, learning records, retrieval practice and spacing.
