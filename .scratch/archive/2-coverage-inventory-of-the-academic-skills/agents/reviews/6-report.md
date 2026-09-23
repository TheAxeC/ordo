# Step 6 report: deep-research's files marked; the check over the whole list

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | The `## deep-research` section after the `academic-pipeline` section, with the same table | DONE | `docs/academic-coverage.md`, 231 lines |
| 2 | Each of the 52 files read in full and marked; the check over all four skills | DONE | `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` prints `ok: docs/academic-coverage.md`, exit 0 |
| 3 | The introduction names all four skills | DONE | before, line 3 spoke of the skills that have a section below and the command named three skills; after, line 3 says the list covers every file of the four skills and the command names all four |
| 4 | The prose standard | DONE | `LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md` prints nothing; a split of every reason finds no reason over two sentences, no sentence over 35 words, no opening label and colon, and no three-word ending shared by two rows (two-word endings shared by at most two rows) |
| 5 | The verify list, from the worktree's root | DONE | eight `PASS:` lines, ten `ok:` lines, a clean ASCII check; exit 0 |

Marks in the `deep-research` section (`sed -n '/^## deep-research/,$p' docs/academic-coverage.md | grep -o '| \(rebuild later: [a-z-]*\|rebuild: [a-z-]*\|drop\) |' | sort | uniq -c`):

| Mark | Files |
|---|---|
| `rebuild: literature` | 16 |
| `rebuild later: literature` | 4 |
| `rebuild: idea` | 3 |
| `rebuild: paper-review` | 1 |
| `rebuild later: paper` | 2 |
| `rebuild: researcher` | 1 |
| `rebuild later: researcher` | 1 |
| `drop` | 24 |
| total | 52 |

Marks over the whole list (169 rows): 30 `rebuild: paper`, 11 `rebuild later: paper`, 21 `rebuild: paper-review`, 3 `rebuild later: paper-review`, 19 `rebuild: literature`, 6 `rebuild later: literature`, 7 `rebuild: rebuttal`, 6 `rebuild: researcher`, 1 `rebuild later: researcher`, 3 `rebuild: writing`, 3 `rebuild: idea`, 1 `rebuild: submit-manuscript`, 58 `drop`.

Rows outside the new section reworded so no two rows share an ending, facts unchanged: `academic-paper/examples/plan_mode_guided_writing.md`, `academic-paper/references/writing_judgment_framework.md`, `academic-paper/templates/literature_review_template.md`, `academic-paper-reviewer/agents/methodology_reviewer_agent.md`, `academic-paper-reviewer/references/guided_mode_protocol.md`.

Judgment calls, each with the reason recorded in its row:

- Search, source verification, synthesis, the report rules and the four index lookups (Semantic Scholar, OpenAlex, Crossref, arXiv) are `rebuild: literature`, the sources roadmap entry 9 names; monitoring, version families and the quick brief come after its first gate.
- The question agent, the guided interview and its question bank are `rebuild: idea`; the method blueprint is `rebuild later: researcher`, since designing the next experiments is the researcher loop's job in roadmap entry 13.
- The shared quality definitions are `rebuild: literature` for the source tiers and the peer-review rule, which the verifier uses without defining.
- The systematic-review mode (meta-analysis, risk of bias, PRISMA, GRADE, preregistration, reporting guidelines) is dropped: entry 9 has no such mode, and the instruments are clinical and social-science practice.
- The ethics agent and checklist are `rebuild later: paper` for the paper's ethics and broader-impact statements.
- The argumentation framework and the fallacy catalogue are `rebuild: paper-review` for the reviewers.
- The handoff example is `rebuild: researcher` for the written stage formats of entry 13.

## Repair round 1

Each finding of `6-refuter.md`, and the change that closes it in `docs/academic-coverage.md`:

- Spec 1: the editor drop names `academic-paper-reviewer/references/quality_rubrics.md` for the rubric and the reviewer `SKILL.md` for the narrower devil's-advocate rule.
- Spec 2: the verifier row sends an unconfirmed reference to the user and removes a fabricated one.
- Spec 3: the interdisciplinary drop names where its search strategies are covered and says the journal and conference lists serve other fields.
- Spec 4: the shared definitions are `rebuild: literature` for the tiers and peer-review rule; the counts and severity wording are dropped.
- Spec 5: the deep-research `SKILL.md`, devil's advocate, ethics, report compiler, argumentation, failure-paths and fallacies rows place every part or drop it.
- Spec 6: the bibliography row keeps the fuller record of two results sharing one index ID, which leaves version choice to the scholar later.
- Spec 7: the method blueprint is `rebuild later: researcher`.
- Spec 8: the hierarchy row replaces the clinical pyramid with an ML scale built on `academic-paper/references/domain_evidence_profiles.md`.
- Spec 9: the fact-check row says most claims get a corrected sentence or advice.
- Spec 10: the bibliography and Crossref rows say the field of a failed lookup is omitted.
- Proof 1: the shared "first gate" endings are reworded.
- Standards 1 to 9: the "without" endings, the "marked for" appositives, the three roadmap-entry-9 clauses (now one, on the OpenAlex row), the methodology row's sprint-contract sentence, the dangling "without" clauses, the passive verifier sentence, the monitoring wording and the verbless openers of lines 54, 64, 67, 75, 86, 88, 90, 95, 98, 103, 107, 124 and 128 were rewritten.
