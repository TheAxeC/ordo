# Step 12, the ruling on the cases (round 0)

The builder's first run of the cases handed back cases 1, 3 and 6. The ruling below is Open item N (a) of `plan.md`, closed under self-rule as C4. It adds item 4 to the brief and keeps every value of the Cases.

## Finding A, cases 1 and 3: item 4 is added

The finding holds: a ledger with no `## Agents` heading goes to the cost script, which exits 1 with `error: the ledger names no agent`, so a ledger written before this plan stops at its closing. Open item M (a) says the closing step runs the cost script only when the ledger names an agent. Item 4 makes the text say that.

4. Rewrite the closing step's sub-bullets of `skills/plan/SKILL.md` Steps 2 (lines 86 to 88 on the base) to this text, one bullet each, in this order, in place of the three bullets that stand there now. The bullets on lines 89 to 92 stay as they are.
   - The closing step skips the cost script only when the ledger names no agent: no bullet line stands under a `## Agents` heading of `plan.md`, up to the next `## ` heading, and none stands in `agents/agent-roles.md`.
   - A `plan.md` with no `## Agents` heading, and a ledger with no `agents/agent-roles.md`, hold no such bullet line.
   - A closing step that skips the script writes the closing report, `agents/reviews/closing.md`, with the sentence "The plan started no agent: neither `plan.md`'s Agents section nor `agents/agent-roles.md` holds an agent bullet, so the closing step did not run the cost script."
   - In every other case, before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder.
   - The skip's test is the test under which the script prints `error: the ledger names no agent`, so the closing step and the script never disagree.

   A bullet line is a line that starts with `-`, `*` or `+` after any spaces, followed by a space or the line's end, as `_BULLET` in `skills/plan-orchestration/templates/plan_cost.py:112` reads it; the text above does not name the pattern, and the builder checks that "bullet line" as the closing step reads it gives the same answer as the script on the cases below.

   Every other text that states the closing stays true and is not changed: `skills/plan/templates/plan.md:21`, `skills/plan-orchestration/SKILL.md:289`, and the entries "closing report" and "closing step" of `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`. The builder reads each and says so in the report; one that the new text makes false is fixed in its path and named, the path added to the report's files.

Cases of item 4, each read against the new text and run through the script on a scratch ledger under the scratchpad, with `plan_cost.py <ledger> <empty transcript root>`:

13. A `plan.md` holding only `# Plan: old` and `## Rulings`, no `agents/agent-roles.md`: the closing step skips the script; the script prints `error: the ledger names no agent`.
14. A `plan.md` with its `## Agents` heading and only its sentence under it, no `agents/agent-roles.md`: skip; the same error.
15. A `plan.md` with no `## Agents` heading and an `agents/agent-roles.md` that is empty: skip; the same error.
16. A `plan.md` whose `## Agents` section holds one agent bullet: the closing step runs the script, which does not print `error: the ledger names no agent`.
17. A `plan.md` with no `## Agents` heading and an `agents/agent-roles.md` holding one agent bullet: the script runs, and does not print that error.

The first run of cases 13 to 17 on the unchanged tree is part of the report: on the base, case 13 and case 15 go to the script and stop, the defect item 4 ends.

## Cases 1 and 3: the values stay

With item 4 in, a ledger the skills wrote at 9fc91dc names no agent and closes as before, with the closing report added: output added, so the minor part. A missing transcript or a model missing from the price table stops only a ledger that names an agent, which no skill wrote at 9fc91dc, so it is an input the skill did not accept before. `plan` 1.11.0 and `plan-orchestration` 2.11.0 stand. Case 3's reason in the report names item 4.

## Finding B, case 6: the value stays

`spec`'s `templates/brief.md` line 5 at 9fc91dc (`git show 9fc91dc:skills/spec/templates/brief.md | sed -n 5p`) reads "A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it." A dictated line that a ruling fixes and that breaks a rule of a standards page was therefore already an error in the skill's text, and the stop on it is a refusal of such a value: by the fifth bullet of the rule, no run that worked before. `spec` 1.8.0 stands.

## Paths

`skills/plan/SKILL.md` is already among "Paths this step writes". The brief's other items, its paths and its checks are unchanged.
