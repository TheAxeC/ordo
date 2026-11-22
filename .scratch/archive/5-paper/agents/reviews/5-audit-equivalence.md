Audit report: rules of `paper` that restrict, fix or add to academic-paper 3.2.0 while their record claims academic-paper's design or equivalence

Answer: there are eight places where a deviation is presented as equivalence or as academic-paper's design (verdict A). The known example is the first. One of them, the visualization agent's start limit, rests on the same false premise as the known example, and the reopened ruling BL left it standing. Eleven places are deviations that their records rule openly (verdict B). About 26 checked claims are equivalent (verdict C). In step 3, the rules on starts, resumptions and counts whose record says nothing about academic-paper are listed under "D" below, because academic-paper's text sets no such rules at all.

Base facts used throughout
- academic-paper's text sets no number of starts, resumptions or "fresh" contexts for any agent. `grep -rn -i -E 'subagent|sub-agent|Task tool|Agent tool|spawn|fresh (agent|context|instance)|re-?invoke|resum(e|ed|ption)|same agent|new agent|start(ed)? once|invoked once|called once|one call|2 calls|second call'` over `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper` finds only these:
  - `SKILL.md:151`: Mode B, "User invokes one agent per phase across sessions".
  - `agents/peer_reviewer_agent.md:19`: "let the orchestrator re-invoke `draft_writer_agent`".
  - `agents/formatter_agent.md:448`: "a SECOND, append-only dispatch -- the orchestrator re-invokes this agent".
  - `agents/socratic_mentor_agent.md:527`: "Can be resumed at any time".
  - `SKILL.md:250-259` and `references/failure_paths.md:271`: session resume.
- The ADRs that govern `paper`, from their Status lines (`grep -n Status docs/adr/0*.md`): 0017 (the part not superseded by 0032 and 0034), 0020, 0023 (except what 0029 and 0031 supersede), 0024 (except the part 0033 supersedes), 0026, 0027 (except what 0028, 0029 and 0030 supersede), 0028, 0029, 0030 (except the part 0035 supersedes), 0031, 0032, 0033, 0034 and 0035. ADR 0002 also applies, except the part 0026 supersedes. No ADR 0036 exists (`ls docs/adr`).

=== A: a deviation presented as equivalence or as academic-paper's design ===

A1. The literature strategist is started once (this is the known example, and it is confirmed).
- The `paper` rule:
  - `skills/paper/SKILL.md:819`: "The literature strategist is started once as a fresh agent and then resumed by a second message in four cases."
  - The same rule stands at `SKILL.md:464` ("Start the literature strategist (Steps 8) once") and `references/literature-strategist.md:3` ("It does all of this in one start").
  - `literature-strategist.md:397` adds a limit at the sources' review: "it starts no new search".
- The record:
  - ADR 0027:22: "The strategist and the visualization agent are each started once as a fresh agent. A second message ... resumes each in these cases and no other."
  - `.scratch/5-paper/plan.md:568`, ruling BL: "ADR 0027 stands and no ADR supersedes it, since `paper` keeps academic-paper equivalence (the user)."
- academic-paper on the point: `SKILL.md:90` names one literature strategist in Phase 1. Its file `agents/literature_strategist_agent.md` sets no limit on starts. The grep under "Base facts" finds no limit anywhere in the folder.
- Status now: `plan.md:241` reopened BL and states "that premise was false, since academic-paper's text sets no limit on the strategist's starts". It also says "Not yet carried by a step". So `SKILL.md:819` and ADR 0027:22 still hold the rule. No ADR 0036 exists.

A2. The visualization agent is started once. The reopened BL did not correct this.
- The `paper` rule:
  - `SKILL.md:823`: "The visualization agent is started once as a fresh agent. It is resumed by a second message in two cases."
  - The same rule stands at `SKILL.md:722` (the figures call: "start the visualization agent (Steps 8) once") and `references/visualization.md:5` ("The agent is started once").
- The record:
  - ADR 0027:22 is the same sentence as in A1.
  - Ruling BL (`plan.md:568`) quotes that sentence, which covers both agents, and keeps it "since `paper` keeps academic-paper equivalence".
  - The reopened BL (`plan.md:241`) removes the rule "for the strategist" only.
- academic-paper on the point: it sets no limit. It also names the visualization agent for two phases: `SKILL.md:99` says "Phase 4 / Phase 7", and `SKILL.md:155` says multi-phase (Bucket B) agents "do exactly the work specified by the caller's invocation for that phase". So its text expects more than one invocation.
- Verdict A. The false premise that BL corrected for the strategist still stands for this agent.

A3. The decision after draft review round 2, and the round-1 Reject stop.
- The `paper` rule:
  - `SKILL.md:342-350`: after round 2 the overall score alone decides, "whatever its verdict, Reject included". A score below 6.5 with a Critical issue unresolved is a stop with three answers: Accept, an expanded revision, or end the run. The stop "shows Accept as its recommendation".
  - `references/peer-reviewer.md:293`: "The stop offers three answers, and its recommendation is accept".
  - `peer-reviewer.md:297`: "A verdict Reject in draft review round 1 reaches the same stop, with the same three answers."
  - `SKILL.md:353`: an originality root cause returns to the planner, item 4.
- The records:
  - Ruling "The second repair of paper" item (3) (`plan.md:228`): "the draft review after round 2 decides as academic-paper's `agents/peer_reviewer_agent.md:425-452` does: ... the stop ... with its options accept, expanded revision and end the run, accept being the recommendation, ... a `[GAP]` placeholder the user's answers asked for is no issue".
  - Coverage row `docs/academic-coverage.md:125`: "After round 2 the overall score decides, as academic-paper's round-2 rule does".
  - Coverage row `academic-coverage.md:150`: "F7 (a rejection verdict) is held in `skills/paper/references/peer-reviewer.md`, with the stop that offers three answers: accept, an expanded revision ..., and ending the run."
  - Open item AD3 (`plan.md:146`): the expanded revision is "as academic-paper's peer reviewer's Option B".
- academic-paper on the point:
  - `peer_reviewer_agent.md:429-434` covers a score below 6.5 with a Critical issue unresolved: "Notify user, suggest options: (a) Manually revise and resubmit (b) Lower paper ambitions ... (c) Accept current state". There is no expanded revision or end of the run here, and no recommendation.
  - `peer_reviewer_agent.md:439-452` is a different trigger, "verdict is still Major Revision or Reject". It offers Options A (accept), B (expanded revision) and C (terminate), and also names no recommendation.
  - `:448` maps "Originality problem -> suggest repositioning research contribution" and names no phase.
  - The round-1 Reject case is in `references/failure_paths.md:168-185`, F7. It classifies the problems, then "Recommend Major Revision", "Return to Phase 3" or "Return to Phase 0", and "Execute revision after user confirmation". `peer_reviewer_agent.md:69` reads "Reject | Fundamental restructuring needed; user decision".
- How `paper` deviates under the claim of equivalence:
  - It recommends Accept, which academic-paper never does. Under F7, academic-paper recommends revision instead.
  - It drops options (a) and (b) of the branch that applies, and takes the answers of the other trigger.
  - It sends the originality root cause to the outline.
  - The ruling adds the `[GAP]` rule inside its "as academic-paper does" list.
- Related: ruling AV4 (`plan.md:182`) is still in Rulings and says "the round-2 stop also offers 'revise by hand and resubmit' and 'lower the venue'", which is academic-paper's (a) and (b). `SKILL.md:347-350` and `:781` do not offer them. Ruling 5.C(3) names ruling U as the ruling it changes (`plan.md:228`, "this changes ruling U"), and does not name AV4.

A4. Where the literature strategist searches and reads.
- The `paper` rule:
  - `references/literature-strategist.md:53`: the agent selects "two or three primary databases for each field the Discipline row names ... as academic-paper's layer 1 does".
  - `:74`: "Google Scholar | Not reached".
  - `:81`: "The agent never signs in, never passes a bot check or a CAPTCHA, never pays".
  - `:148`, layer 3: `lookup.py cited-by` or the citing links of PubMed or Europe PMC.
  - `:149`, layer 4: Semantic Scholar only.
  - `:259`: a short source count leads to "widens the year range by 5 years and then states 'limited literature available'".
  - `:193`: never through WebFetch.
- The records:
  - ADR 0032:11: "finds and reads its sources where academic-paper's literature strategist does".
  - ADR 0032:20: "The strategist's search reaches what academic-paper's reaches."
  - Ruling "The third repair of paper" (`plan.md:232`): "searches and reads as academic-paper 3.2.0's `agents/literature_strategist_agent.md` does".
  - Ruling "Where the strategist searches" (`plan.md:234`): "finds and reads sources where academic-paper's does".
- academic-paper's text:
  - `literature_strategist_agent.md:104`, the General row: "Google Scholar, Web of Science, Scopus".
  - `:417`: "Select 2-3 primary databases by discipline". This is per discipline, not per field.
  - `:435`: layer 3 uses "Google Scholar / Scopus 'Cited by'".
  - `:444`: layer 4 uses "Semantic Scholar / Connected Papers".
  - `:554`: "Add search databases (add Google Scholar)".
  - `:575`: a missing discipline uses "general databases (Google Scholar + Scopus)".
  - No reading tool and no access limit is named anywhere: `grep -rn -i 'WebFetch\|WebSearch'` finds only `SKILL.md:410` and `:434`, "verified via DOI or WebSearch".
- Verdict A. The rules drop Google Scholar, Scopus "Cited by", Connected Papers and the "add Google Scholar" step. They multiply the database choice by field and add the access and WebFetch limits, all under records that claim the same search.

A5. The compile engine.
- The `paper` rule:
  - `SKILL.md:194-199`: the engine is taken from the `% !TEX program` line, else the class table, else the venue's template, else XeLaTeX. The flags include "`-pdf` for pdfLaTeX".
  - `references/latex-template.md:65-68`: elsarticle, IEEEtran and acmart are mapped to pdfLaTeX.
- The records:
  - Ruling AV11 (`plan.md:189`) sits under the AV header (`plan.md:178`): "every one is built as academic-paper has it". AV11 reads: "the compile uses the engine the venue's template requires, and XeLaTeX otherwise".
  - Coverage row `academic-coverage.md:122` lists the engine rule among what `paper` "takes" from `agents/formatter_agent.md`.
- academic-paper's text:
  - `formatter_agent.md:680`: "PDF MUST be compiled from LaTeX via `tectonic` or `xelatex`".
  - `:713`: "must use xelatex or lualatex".
  - `:886`: "Verify using xelatex (not pdflatex)".
  - `:832-835` maps publishers to classes and names no engine.
- Verdict A. `paper` adds pdfLaTeX through a class-to-engine table that academic-paper does not have and whose engine its text forbids.

A6. The anonymous copy for a double-blind venue.
- The `paper` rule: `references/draft-writer.md:254-256`. Self-citations are written "in the third person", and "The acknowledgments and the funding statement are left out", as is every line that names a person, institution, grant or approval board.
- The record: ruling AV9 (`plan.md:187`), under the header "every one is built as academic-paper has it" (`plan.md:178`).
- academic-paper's text: `formatter_agent.md:756`, "Blind review version -> remove all author information", and `references/journal_submission_guide.md:21`, "Anonymized for double-blind review (if required)". It has no self-citation rule and no rule on acknowledgments: `grep -rn -i 'third person'` finds only general register lines, `academic_writing_style.md:25` and `draft_writer_agent.md:83`.
- Verdict A, a small one. `paper` fixes what "author information" covers.

A7. The three light colours drawn only with a black outline.
- The `paper` rule: `references/visualization.md:144`, cyan, orange and grey "are drawn only with a" black outline.
- The record: ruling AV19 (`plan.md:197`), under the same AV header (`plan.md:178`).
- academic-paper's text:
  - `agents/visualization_agent.md:115-120` lists the three colours in its palette.
  - `:127` reads "Minimum contrast ratio: 3:1 against background".
  - `grep -rn -i 'black outline\|edge contrast'` over the folder finds nothing.
- Verdict A. `paper` resolves a conflict inside academic-paper's text with a rule academic-paper does not have, and the record presents it as academic-paper's.

A8. The retry at the stop "A patch that does not apply".
- The `paper` rule: `SKILL.md:180`. "the user may ask for one more try ... a rejection of it leaves the change listed as not applied." So the user gets one retry, with no escalation.
- The record: open item AD5 (`plan.md:148`): "also offers to anchorize again and retry the round, as academic-paper's patch protocol does".
- academic-paper's text: `references/revision_patch_protocol.md:47`: "On a second failure, stop and decide: re-anchorize and retry the round, escalate to full re-emission, or abort". It sets no cap on retries and offers full re-emission (`:58`).
- Verdict A, a small one. The retry itself is equivalent. The cap and the missing escalation are not.

=== B: deviations openly ruled as deviations ===

- B1. The search's end: condition 2 must hold, with up to 8 passes. `literature-strategist.md:165-167`. Ruling BI 4 (`plan.md:224`) says "recorded as a deviation from academic-paper", and the coverage row (`academic-coverage.md:124`) says "where academic-paper stops at any 3 conditions". academic-paper: `literature_strategist_agent.md:453-463`.
- B2. Incremental citation checks, and a peer reviewer reading of the findings pass. `SKILL.md:228-236` and `:248-250`. ADR 0029:20 says this "departs from academic-paper's single check", and `plan.md:560` lists it as a deviation.
- B3. Numbers and data-handling descriptions checked against the result files. `SKILL.md:377-378`. ADR 0028, listed as a deviation at `plan.md:560`.
- B4. The closing `/writing` review and the reply to it. `SKILL.md:238-254`. ADR 0023:3 ("academic-paper applies its writing-quality check inside the draft without asking") and ADR 0031:3 ("Academic-paper ends its runs with no such review").
- B5. A web search for the venue page of a published arXiv paper. `SKILL.md:742`. Ruling BP (`plan.md:238`) calls it "a deviation from academic-paper kept under rule 23", and ADR 0034 records it.
- B6. The plan-mode cap of more than 30 rounds in all. `references/socratic-mentor.md` "Limits", the row "More than 30 rounds in all". The coverage row (`academic-coverage.md:150`) says "at more than 30 rounds and not the 15 of F8", with its reason. academic-paper contradicts itself here: `socratic_mentor_agent.md:445` says 30, and `:515` and `failure_paths.md` F8 say 15.
- B7. No integrity check and no ethics check in `paper`, which move to `researcher`. ADR 0027:11 and rulings D42 and V (`plan.md:101`, `:132`).
- B8. Model and effort fixed in the skill: opus at medium, and the formatter on sonnet. `SKILL.md:74`. ADR 0030:3 says "academic-paper set no model and no effort". Ruling 5.E (`plan.md:242`) keeps sonnet "since no run shows a loss from it".
- B9. revision-coach and rebuttal-audit moved to `rebuttal`, and no response letter in revision. Rulings D1 (`plan.md:43`) and "The response letter stays in `rebuttal`" (`plan.md:212`). academic-paper: `SKILL.md:270`, `:276`, `:278`.
- B10. The in-text locator, the output gate and the trust-chain field are not built, and a passage check is used instead. Ruling AI1 (`plan.md:164`). The Retraction Watch cross-check is replaced by Crossref notices, ruling AD7 (`plan.md:150`).
- B11. Parts that are left out and named as left out: the generator-evaluator contract (`academic-coverage.md:117`), and tectonic and the provenance gates (`academic-coverage.md:122`). The prose standard holds over academic-paper's writing rules (ADR 0002, except the part ADR 0026 supersedes).

=== C: equivalent ===

Count: 26. These were checked on both sides:
- The rejected alternative at ADR 0027:34, "academic-paper ends the loop at round 2".
- ADR 0027:35 and ruling AF: citation compliance in full and revision (`SKILL.md:268`, `:270`).
- Rulings J, AD1, AD2, AD4, AD6, AD8, AD10, AD11 with AV15, AD14, AD15, AB, AG, AJ, X, AV6, AV14 (F5 and the second start), AV16, AV17 and BB.
- The checkpoint content and mentor limits of ruling AY, apart from B6.
- The two fix passes of the rendered-figure check (`vlm_figure_verification.md:64`).
- Ruling 5.C(4), agents started together.
- "starts no agent" (`SKILL.md:745` against `literature_strategist_agent.md:19`).
- Ruling 5.D's "per strand" items: academic-paper's strategist has screening counts overall (`:224-228`), none per strand.

=== Step 3: other rules on starts, resumptions, counts and limits whose records make no claim about academic-paper (D) ===

academic-paper's text sets none of these, as the grep under "Base facts" shows. The records give `paper`'s own reasons, mainly ADR 0027:22 and :40 and ADR 0029. None of them says academic-paper does the same, and none says the rule departs from academic-paper.
- The Socratic mentor: started once, resumed with each answer, and a fresh start for a continued run (`SKILL.md:821`, `:501`). ADR 0027:30 refers to academic-paper only to say that "the mentor is an agent of its own", which is true (`SKILL.md:98`).
- The planner: resumed only for a structural or originality expanded revision, and a fresh agent otherwise (`SKILL.md:820`).
- The formatter: "never resumed", with the named fresh starts (`SKILL.md:822`). academic-paper re-invokes it for the provenance section (`formatter_agent.md:448`), which `paper` leaves out (B11).
- "No other agent receives a second message" (`SKILL.md:824`). This is the same ADR 0027:22 sentence that BL quoted, but BL quoted only the part about the two named agents.
- One agent at a time, except full item 7 and revision items 3 and 4 (`SKILL.md:145`).
- On a `validation` or `schema` rejection: a fresh restart, then a stop at the second rejection. A refused structural patch is narrowed once (`SKILL.md:174-178`). academic-paper's text for exit 3 is `revision_patch_protocol.md:49`.
- The draft writer:
  - reference-fix "once" (`SKILL.md:189`);
  - compile-fix "once" (`:202`);
  - one pass after round 1 (`:339`);
  - one pass in revision (`:440`);
  - the items of the findings-pass reading "once" (`:250`);
  - the anonymous-copy start (`:256`);
  - the disclosure-identifier start (`:149`).
- Citation compliance "once more as a fresh agent", with a failure left named in the final message (`SKILL.md:227`, `:234`).
- A fresh peer reviewer for round 2 and for reading 2 (`SKILL.md:339`, `:441`).
- The ban on web lookups for every role except the strategist and the venue-page search (`SKILL.md:741`), from ADR 0017's part in force. academic-paper allows "DOI or WebSearch" (`SKILL.md:410`, `:434`).
- ADR 0033 cites academic-paper's "via DOI or WebSearch" as context but keeps the WebFetch ban for `paper`'s own reason.
- The peer reviewer runs no script (`SKILL.md:749`).
- A PDF is made only from the `.tex` by `latexmk` (ADR 0027:24). academic-paper also allows Pandoc to PDF (`formatter_agent.md:69-71`).

=== Not settled ===

- These rulings were not compared with academic-paper's text in this audit: AH, AI2, AM, Y, AA, AV1, AV2, AV3, AV5, AV7, AV8, AV10 (the class table itself; its engine part is A5), AV12 and AV13. Reading each `paper` page against the academic-paper file the ruling names would settle them.
- After round 2, academic-paper's text holds two triggers that conflict for a Major Revision verdict with every Critical issue resolved: `peer_reviewer_agent.md:427` accepts, while `:439` offers options. `paper` takes the first without saying so. Whether that counts as a deviation depends on which line of academic-paper governs. A ruling on which one holds would settle it.

Files read: `/Users/axelfaes/workspace/ordo/skills/paper/SKILL.md`, `/Users/axelfaes/workspace/ordo/skills/paper/references/literature-strategist.md`, `/Users/axelfaes/workspace/ordo/docs/adr/0017` to `0035` and `0002`, `/Users/axelfaes/workspace/ordo/.scratch/5-paper/plan.md` (Rulings, lines 41 to 243, and line 568), `/Users/axelfaes/workspace/ordo/docs/academic-coverage.md` (lines 47 to 178), and the academic-paper files cited above. Nothing was changed.

Usage: a8b70597bb7b81e60, claude-opus-5-5, 291084 tokens, 63 tool uses, 8m 26s. Line numbers of skills/paper/SKILL.md are as before the landing of step 5.E (6b2bc13); after it the start rules stand at SKILL.md:830 to 834, the round-2 stop at :355 and the retry at :187.
