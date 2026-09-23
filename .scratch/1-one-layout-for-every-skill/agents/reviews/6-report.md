# Step 6 report: spec restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/spec` | DONE | `ok: skills/spec/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/spec.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md` |
| 3 | the verify list | DONE | seven `PASS:` lines; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/spec/SKILL.md`, 54 lines before, 114 after; the inventory, 71 lines, 64 body rows.

Sections before: What it reads; What it writes; Preflight, before any write; When it stopped; Rules. After: Quick start; Use instead (four); What it reads (five); Steps (seven: the preflight, the premise checks, the brief, the preparation commit, the worktree, the base binaries, the dispatch block; then `### A stop` and `### A ruling`, each numbered); Stops (eight: three stops that leave an open item, five refusals that name their cause); Anti-patterns (three); Rules (one).

Judgment calls:

- The preflight becomes step 1, since it runs before any write.
- The refusals the old text states inline are Stops rows, and the items where they arise point there, by the plan's ruling.
- Line 10's "a premise found false is a stop" and line 51's "corrected in the plan before the brief exists" are one bullet of step 2; the scope change is the second.
- The old section "When it stopped" is `### A stop` and `### A ruling` under Steps, numbered, since a ruling is a sequence; no other file names the old section, nor "What it writes" or "Preflight, before any write" of this skill (`grep -rn` over skills, docs and README.md finds only plan-retro's and refute's own "What it writes").
- The brief's rules (every requirement in its own words, no harness or vendor, no history) are anti-pattern rows with their reasons; the `git -C` rule stays in Rules.

User-visible changes, before and after:

- The opening: before, "It refuses rather than guesses: a premise found false is a stop, booked in the open items, and the brief is not written until the plan's text is corrected". After, "prepares one step of an open plan for its builder. It leaves behind the brief and the dispatch block, committed, the step's worktree at the base, and the base binaries copied aside"; the refusal rule is Stops row 1 and step 2.
- Refusals and stops: before, the text called the missing key, folder, in-flight step and unknown step refusals, and the premise, scope and user-visible cases stops. After, the same words, with the Stops section saying the first three rows leave an open item and the rest name their cause and leave nothing.
- The ruling: before, prose under "When it stopped". After, `### A ruling`, three numbered items, ending with `/spec <entry> <step>` typed again.

## Repair round 1

Every finding of `6-refuter.md` is closed; none is booked.

| Finding | Closure |
|---|---|
| Every refusal called a stop, so "a stop leaves three things" covered refusals | Refusals are called refusals again; the Stops section says the first three rows are stops, which leave the open item, and the rest are refusals, which leave nothing |
| "The dispatch block ... allows one"; the same step in flight not refused | Stops row 7: "A step is already in flight, and the configuration block does not allow more than one"; What it reads 3 points there |
| The "more than one" condition written twice | Only in Stops row 7 |
| Step 2's two bullets said the same thing | One bullet: a false premise is a stop and the brief waits for the plan's correction, made before the brief exists, never left for the builder |
| The opening's false sentence on what is committed | "the brief and the dispatch block, committed, the step's worktree at the base, and the base binaries copied aside" |
| The opening and Quick start said the same sentence | The opening says what the skill does in other words; Quick start keeps the old sentence, and inventory row 10 points there |
| Who runs /spec after a ruling | "Then `/spec <entry> <step>` is typed again", after "books the ruling and nothing else", as the old text had it |
| "No folder ... opens with # Plan" | "No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>`" |
| Inventory row 51 pointed at Steps 2 | It points at Stops 2 |
| The heading "When it stopped"; the ruling as unordered bullets | `### A stop` and `### A ruling` under Steps, numbered |
| No line count for the inventory, no grep for removed names, no before and after | Added above |

The grep for the removed section names, over every path rule 14 names, and its output (only other skills' own sections):

```
$ grep -rn -E 'What it writes|Preflight, before any write|When it stopped' skills utils docs README.md | grep -v '^skills/spec/'
skills/plan-retro/SKILL.md:43:## What it writes
skills/refute/SKILL.md:36:## What it writes
```

The preflight's wording, before: "A preflight that fails stops the skill with what it saw." After: "A preflight that fails is a refusal", and Stops row 4 shows "What it saw". It runs before any write, so, as before, it leaves nothing.
