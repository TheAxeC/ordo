# Step 5 report: academic-pipeline's files marked in the coverage list

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | The `## academic-pipeline` section after the `academic-paper-reviewer` section, with the same table | DONE | `docs/academic-coverage.md`, 174 lines |
| 2 | Each of the 30 files read in full and marked | DONE | `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline` prints `ok: docs/academic-coverage.md`, exit 0 |
| 3 | The introduction's check command | DONE | before, its skill list was `academic-paper academic-paper-reviewer`; after, `academic-paper academic-paper-reviewer academic-pipeline`, the command in row 2 |
| 4 | The prose standard | DONE | `LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md` prints nothing; a split of every reason in the file on a full stop followed by a space and a capital or backtick finds no reason over two sentences, no sentence over 35 words, no opening label and colon in the first 45 characters, and no four-word ending shared by two rows |
| 5 | The verify list, from the worktree's root | DONE | eight `PASS:` lines, the layout check's ten `ok:` lines, a clean ASCII check; exit 0 |

Marks in the `academic-pipeline` section (`sed -n '/^## academic-pipeline/,$p' docs/academic-coverage.md | grep -o '| \(rebuild later: [a-z-]*\|rebuild: [a-z-]*\|drop\) |' | sort | uniq -c`):

| Mark | Files |
|---|---|
| `rebuild: researcher` | 5 |
| `rebuild: paper` | 6 |
| `rebuild later: paper` | 1 |
| `rebuild: literature` | 1 |
| `rebuild: paper-review` | 1 |
| `rebuild: rebuttal` | 1 |
| `drop` | 15 |
| total | 30 |

Rows outside the new section changed to meet the whole-list standard, facts unchanged except where noted:

- `academic-paper/agents/literature_strategist_agent.md`: the gaps and the 70 percent concentration advisory, stated in the source (the `DISTRIBUTIONAL_SKEW_ADVISORY` at 70 percent), are named again; "backward and forward" is shortened to "citation chaining".
- `academic-paper/SKILL.md` and `academic-paper-reviewer/templates/revision_response_template.md`: endings reworded so no two rows end alike.

Judgment calls, each with the reason recorded in its row:

- The pipeline's orchestration (`SKILL.md`, the orchestrator, the state tracker, the state machine, the mode advisor) is `rebuild: researcher`, the skill roadmap entry 13 builds; Ordo's plan ledger already covers the state record, so the researcher takes the prerequisite table, the closing audit trail and the entry from existing materials.
- The integrity check, the claim-faithfulness audit, the claim verification protocol, the AI research failure modes and the integrity-failure example are `rebuild: paper`, since roadmap entry 5's paper skill checks claims and citations; the originality screen is `rebuild: paper` because the integrity check runs it at both gates, and the judge calibration is `rebuild later: paper`.
- The collaboration-depth observer and the process summary, which score the user, are dropped.
- The passport reset protocol, the adapters contract and the team protocol are dropped: Ordo resumes from files on disk, the hub keeps `.bib` files, and one researcher runs it.
- `examples/mid_entry_example.md` is dropped because it skips the integrity check that `SKILL.md` makes mandatory.

## Repair round 1

Each finding of `5-refuter.md`, and the change that closes it in `docs/academic-coverage.md`:

- Spec 1: the full-pipeline example row says the run skips both integrity checks and uses four reviewers and two revision cycles, against `SKILL.md`.
- Spec 2: the two-stage row names `agents/pipeline_orchestrator_agent.md` and the reviewer's `references/re_review_mode_protocol.md` for the coaching.
- Spec 3: the integrity-agent row gives the paper skill all of it, lookup rules included; the literature skill reuses them.
- Spec 4: the `SKILL.md` and orchestrator rows say where each part goes (researcher, `paper`, `paper-review`, `rebuttal`, `submit-manuscript`) or that it is dropped.
- Spec 5: the claim-verification row says the integrity agent's Phase E repeats it and names the example column as its only unique part.
- Spec 6: the plagiarism row says the paper skill can add the screen after its first gate.
- Spec 7: the external-review row says everything is accepted only when the user skips the discussion.
- Spec 8: the state-tracker row gives the researcher the closing audit trail as well as the prerequisite table.
- Spec 9: the reset row says it applies with `ARS_PASSPORT_RESET=1` set.
- Spec 10: the integrity-review row says a fuller check after revision.
- Spec 11: the orchestrator row names integrity checks, review decisions and finalisation.
- Spec 12: the literature-strategist row names period, place, method or venue and 70 percent of known entries.
- Standards 1: the "not carried", "left out" and "stay behind" endings across the file were rewritten into different constructions; four "not carried" remain.
- Standards 2 to 5: the researcher rows, the drop rows' "so" clauses, the passive openers and the unclear phrases were reworded.
- The paper-skill changelog row, a fragment, is one sentence.
