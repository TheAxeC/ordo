# Step 3 report: academic-paper's files marked in the coverage list

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | `docs/academic-coverage.md`: title, introduction (purpose, source and `computedHash` of each skill, the marks, the check command), the New skills table, the `## academic-paper` section | DONE | the file, 108 lines |
| 2 | Each of the 61 files read in full and marked | DONE | `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper` prints `ok: docs/academic-coverage.md`, exit 0 |
| 3 | The list follows the prose standard | DONE | `LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md` prints nothing; each row and paragraph is one source line; no history |
| 4 | The verify list, from the worktree's root | DONE | eight `PASS:` lines (`land.sh and usage.py`, `check_config.py`, `collect_findings.py`, `sync_rules.py`, `pin.sh`, `check_skill_layout.py`, `check_rule_inventory.py`, `check_coverage.py`), the layout check's ten `ok:` lines, a clean ASCII check; exit 0 |

The introduction's check command names the skills that have a section, `academic-paper` for now; steps 4 to 6 add theirs.

The New skills table names the thirteen skills of roadmap entries 3 to 15 by the skill's name, each with its entry number; the check confirms every number is an entry of `docs/roadmap.md`.

Marks in the `academic-paper` section (`grep -o '| \(rebuild: [a-z-]*\|rebuild later: [a-z-]*\|drop\) |' docs/academic-coverage.md | sort | uniq -c`):

| Mark | Files |
|---|---|
| `rebuild: paper` | 24 |
| `rebuild later: paper` | 8 |
| `rebuild: rebuttal` | 5 |
| `rebuild: writing` | 3 |
| `rebuild: literature` | 2 |
| `rebuild later: literature` | 2 |
| `rebuild: paper-review` | 1 |
| `rebuild: submit-manuscript` | 1 |
| `drop` | 15 |
| total | 61 |

Judgment calls, each with the reason recorded in its row:

- `rebuild` against `rebuild later` follows roadmap entry 5's goal, which names drafting, structure, citations, figures and statistics, disclosure statements and revision patches: files that serve those are `rebuild: paper`, and files the first gate (a revision round compared blind) does not need are `rebuild later: paper` (the abstract rules, the formatter, the planning dialogue and its activation signals, LaTeX output, the IMRaD skeleton, failure paths).
- `agents/peer_reviewer_agent.md` is `rebuild: paper-review` although it is academic-paper's own in-pair reviewer, because its rubric and re-review rules are the reviewer role roadmap entry 6 builds.
- `references/venue_disclosure_policies.md` is `rebuild: paper`: the disclosure statements of roadmap entry 5 need the venue policies, so the paper skill holds them until entry 13 moves them into the researcher's `venues/` files. `agents/intake_agent.md` keeps venue limits in the project on the same terms.
- `references/apa7_extended_guide.md` is `rebuild: paper` for its statistics reporting rules, which no other file of the skill states and entry 5's goal names; its APA page rules are not carried.
- `references/policy_anchor_disclosure_protocol.md` is `rebuild: paper` for three venue-neutral disclosure rules no other file states; its four-anchor rendering is not carried.
- `references/domain_evidence_profiles.md` is `rebuild: literature` for its `cs_ml` profile only (preprints and proceedings count as evidence), which the literature skill takes as its default.
- `references/journal_submission_guide.md` is `rebuild: submit-manuscript` for the submission package; its response-letter part goes to `rebuttal`, as its reason says.
- Duplicates are marked where the rule is kept: `examples/plan_mode_guided_writing.md` is `drop` because `agents/socratic_mentor_agent.md` states every step, and `references/plan_mode_protocol.md` is `rebuild later: paper` for the one activation signal stated only there; `references/workflow_phase_details.md` is `drop` because `SKILL.md` and the agents state every item; pairs that both carry rules the new skill needs (the CRediT guide and template, the funding guide and template, the figure agent and standards) are both marked and each reason says they become one page.
- The zh-TW, Taiwanese higher-education and clinical material is dropped wherever it is the file's substance (the Chinese example paper, the Chinese citation guide, the glossary), and named as not carried where it is part of a file that is kept.

## Repair round 1

Each finding of `3-refuter.md`, and the change that closes it in `docs/academic-coverage.md`:

1. `references/apa7_extended_guide.md` marked `rebuild: paper` for its statistics rules; the CI clause now reads "the 95 percent CI format", as the file states it.
2. `references/policy_anchor_disclosure_protocol.md` marked `rebuild: paper`, naming the three rules (when to write a no-AI statement and when to write nothing, AI-quoted text attributed and AI output never a primary source, the copyediting carve-out by venue) and the paper skill's disclosure page as their place.
3. `references/plan_mode_protocol.md` names `SKILL.md` and `references/mode_selection_guide.md` for the activation rules and is marked `rebuild later: paper` for the one signal stated only in it.
4. The CRediT template row puts co-author agreement in the note, outside the checklist.
5. The formatter and planning-dialogue rows are two sentences each.
6. Every reason of 70 words or more rewritten to the items that decide its mark; two remain over 70 words (`references/apa7_extended_guide.md` 71, `references/policy_anchor_disclosure_protocol.md` 73), because each lists the rules no other file states.
7. `references/venue_disclosure_policies.md` marked `rebuild: paper`, the paper skill holding the entries until entry 13; the intake, formatter, failure-paths and policy-table rows no longer point at `venues/` files before entry 13 exists.
8. The introduction's command names the skills that have a section, so it passes on every landing of steps 3 to 6.
