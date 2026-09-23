# Step 4 report: academic-paper-reviewer's files marked in the coverage list

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | The `## academic-paper-reviewer` section after the `academic-paper` section, with the same table | DONE | `docs/academic-coverage.md`, 139 lines |
| 2 | Each of the 26 files read in full and marked | DONE | `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer` prints `ok: docs/academic-coverage.md`, exit 0 |
| 3 | The introduction's check command names `academic-paper academic-paper-reviewer` | DONE | before, the command's skill list was `academic-paper`; after, it is `academic-paper academic-paper-reviewer`, the command in row 2, which passes |
| 4 | The prose standard, with no sentence over about 35 words | DONE | `LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md` prints nothing; a split of each reason on a full stop followed by a space and a capital or backtick finds no row over two sentences, no sentence over 35 words, and no reason in either section that opens with a label and a colon in its first 45 characters |
| 5 | The verify list, from the worktree's root | DONE | eight `PASS:` lines, the layout check's ten `ok:` lines, a clean ASCII check; exit 0 |

Marks in the `academic-paper-reviewer` section (`sed -n '/^## academic-paper-reviewer/,$p' docs/academic-coverage.md | grep -o '| \(rebuild later: [a-z-]*\|rebuild: [a-z-]*\|drop\) |' | sort | uniq -c`):

| Mark | Files |
|---|---|
| `rebuild: paper-review` | 18 |
| `rebuild later: paper-review` | 3 |
| `rebuild: rebuttal` | 1 |
| `drop` | 4 |
| total | 26 |

Judgment calls, each with the reason recorded in its row:

- `rebuild` against `rebuild later` follows roadmap entry 6's goal (the reviewer roles, the editor's synthesis and the re-review mode) and gate (a blind comparison on a paper with known referee reports): calibration, the guided mode and the sprint-contract pre-commitment are `rebuild later`. The perspective reviewer and the statistical reporting reference are `rebuild`, since the four-reviewer panel includes the third reviewer and the methodology reviewer works from the statistics file.
- `examples/interdisciplinary_review_example.md` is kept although its field is higher education, because its methodology findings are ML checks (temporal leakage, oversampling with few positives) that the methodology reviewer's list lacks; `examples/hei_paper_review_example.md` is dropped as applying the rules without adding one.
- `templates/revision_response_template.md` goes to `rebuttal`, since the author's response letter is roadmap entry 7's output.
- `references/top_journals_by_field.md` is dropped: it names no ML venue, and the field analyst and editor take the venue named for the paper at intake (`academic-paper/agents/intake_agent.md`), as their rows say.
- `references/review_criteria_framework.md` and `references/quality_rubrics.md` are both `rebuild`; the review skill keeps the 0-to-100 scale of `references/quality_rubrics.md` and restates the 1-to-5 criteria of the framework and of `references/editorial_decision_standards.md` on it.

## Repair round 1

Each finding of `4-refuter.md`, and the change that closes it in `docs/academic-coverage.md`:

- Spec 1: the review-quality row gives writing the score first as the fix for the trap of mild comments and harsh scores.
- Spec 2: the devil's-advocate row says a concession right after another needs a five.
- Spec 3: the synthesis row counts consensus over the four reviewers besides the devil's advocate.
- Spec 4: the panel confirmation moved from the field-analyst row to the `SKILL.md` row.
- Spec 5: the interdisciplinary example row names temporal leakage and oversampling with twelve positives as the checks the methodology reviewer lacks.
- Spec 6: the reviewer `SKILL.md` row names the quick and methodology-only modes, untrusted review materials, and sends the revision coaching to `rebuttal`.
- Spec 7: the perspective reviewer is `rebuild: paper-review`, with the edge case for purely technical papers as the source states it.
- Spec 8: the statistical reporting reference is `rebuild: paper-review`, naming what the methodology reviewer uses (the universal checklist, the completeness score, the red flags) and what is not carried.
- Spec 9: the criteria-framework, quality-rubric and decision-standards rows name the 0-to-100 scale as the one kept.
- Spec 10: the field-analyst and editor rows take the venue named at intake, and the journals row points at them.
- Spec 11: the re-review row limits the traceability check to priority-one items, states the 80 percent rule for priority two, and sends the residual coaching to `rebuttal`.
- Standards 1: every reason in both sections that opened with a label and a colon was rewritten as a sentence, and the repeated "It and ... become one ... page" and "Roadmap entry 5 names" shapes were varied.
- Standards 2: the sprint-contract clause is worded per row and names where the phases go.
- Proof 3: row 3 of the table gives the command's skill list before and after.
