HAND-BACK (step 7 of plan 2.E.A): I stopped before changing any text. The first run found one case that the brief's own rules get wrong (case 9), plus two smaller points that need your ruling before I build. The worktree is unchanged: `git status --short` in `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-7` prints nothing, and no report file is written yet. I resume on your ruling.

## Open items of the main checkout's state file (verbatim, read only)

- Open item H (2026-10-01): whether the shared rule on self-rule covers `/grill` and `/plan` run with `--self-rule`. Raised by the brief check of step 7 (`agents/reviews/7-brief-check.md`, "Declined to judge"). Kind 3: a change to the shared rules and to `~/.claude/CLAUDE.md`.
  - What the tree shows: `skills/repo-setup/templates/shared-rules.md:20` reads "Under a plan's `self_rule: on`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review.", and `~/.claude/CLAUDE.md` holds the same sentence (ruling B). In next-entry mode `/grill <entry> --self-rule` and `/plan <entry> --self-rule` run before the next entry's plan exists, under the keys of `.agents/plan.yaml` (ruling F), so no plan's `self_rule: on` is in force while they take decisions.
  - Options:
    - (a) The sentence reads "Under `self_rule: on`, in a plan's configuration block or, for `/grill` and `/plan` run with `--self-rule`, in `.agents/plan.yaml`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review."; the template change joins step 8, which changes the `repo-setup` templates, and you put the same words in `~/.claude/CLAUDE.md`. Pros: a reader of the rule finds next-entry mode covered, and the rule and the skill text say the same. Cons: a change to written rules, one of them your own file.
    - (b) Both sentences stay; a next-entry run is read as the closing plan's run going on under its `self_rule: on`. Pros: no rule changes. Cons: the words "a plan's" do not name `/grill` and `/plan` run before the plan exists, so a session that reads the rule as written stops at each decision `/grill --self-rule` would close, and the shared rule and the skill text disagree.
  - Recommendation: (a), since a written rule that a literal reader reads against the skill text is a clash, and the change is one sentence. Lazy option: (b), which changes nothing and leaves the clash to each reader.
  - Kind 3; it waits for you. It blocks step 9, whose run is the first next-entry run, and no other step.

## The first run of every case, on the unchanged tree (read in place)

Each result below comes from reading the unchanged text of the skills at the base. Evidence commands run:
- `grep -n 'self_rule\|next_entry\|self-rule' skills/{grill,plan,roadmap,plan-orchestration}/SKILL.md`. This shows `grill`, `plan` and `roadmap` carry no key `self_rule` or `next_entry`, and no `--self-rule` argument anywhere.
- The description-length command of Verify 2. It printed 808 (`grill`), 477 (`plan`), 997 (`roadmap`) and 865 (`plan-orchestration`).
- `grep -rn 'replacing Open item <L\|` (Open item <L>)' skills`. It prints `templates/choices.md:14` and `references/self-rule.md:50,56,75`, as the brief says.

| Case | Result on the unchanged tree |
|---|---|
| 1 | Differs. `/grill` knows no `--self-rule` ("What it reads" 1, Quick start); `9 --self-rule` is read as an entry (a "No such entry" refusal naming `/roadmap add <goal>`, or an interview). No refusal naming both keys. |
| 2 | Differs. Steps 6 sends a round and ends the turn; bullets end "(the user)" (`:238`); no choice is written; Steps 10 asks the confirmation and the commit (`:176-181`). |
| 3 | Differs. Every decision goes out in the round, and the bullets end "(the user)". |
| 4 | Differs, same cause as case 2. The decision is sent, but so is every other one. |
| 5 | Differs, same cause as case 2. |
| 6 | Differs. An entry under "Not yet specified" is an entry ("What it reads" 2, `:40`), so the interview runs. |
| 7 | Holds. Steps 6, Writing 1 (`:238`), Steps 10. |
| 8 | Differs. `/plan` has no `--self-rule`, and Steps 3 and the Stops row stop at the drafted list. |
| 9 | Holds. Every plan stops at "The drafted step list" and writes nothing. After the build, the rules of items 4.4 and 4.6 break it (see below). |
| 10 | Differs. No `--self-rule` and no refusal. |
| 11 | Holds. `spec` "What it reads" 4 (`:44`) accepts `(ruling A)` with A ending "(self-rule)" or "(self-rule).". |
| 12 | Differs. Steps 10 ends the loop at a pause or when nothing unblocked is left (`:130`), and nothing follows the closing. |
| 13 | Differs. The run ends after the closing and names no `/roadmap add 12`. |
| 14 | Differs. The run ends after the closing and does not say no open entry is left. |
| 15 | Holds in part. Steps 2 takes several open plans in the roadmap's order and Steps 10 goes back to step 2, so an already open plan is run with no `/grill` and no `/plan`. It does not read the two keys. |
| 16 | Differs. No stop names the entry the next entry waits on. |
| 17 | Holds. The loop ends after the closing because nothing follows it. |
| 18 | Holds. The Stops row "The roadmap diff" keeps the diff with the user, and nothing is taken before the closing completes. |
| 19 | Differs. `roadmap` "What it reads" 6 (`:55`) accepts only "(the user)", so G ending "(self-rule)." gives no ruling and the stop stands. |
| 20 | Holds in outcome. There is no ruling and the stop stands. The failed check it names is the ending, not the report, the plan or the finding. |
| 21 | Holds. No ruling, because of the ending (`:55`), and the stop stands. |
| 22 | Differs. "A skill with its own approval stop" (`self-rule.md:23`) keeps every `/roadmap` option open. |
| 23 | Differs. `Booked:` is `(Open item <L>)`, the review looks in a plan's Rulings (`:69`) and has no rulings-file rule, and `/grill` writes no "(self-rule)" bullet. |
| 24 | Differs. The new bullet reads `replacing Open item <L> (the user)` (`:75`). |
| 25 | Differs. No rule for a review with no plan open. |
| 26 | Differs. `Builds on it:` has no roadmap entry; only "A roadmap diff of `Builds on it:`" (`:83`). |
| 27 | Differs. No record in `Builds on it:`. |
| 28 | Differs. `continue the plan` with no plan open resumes nothing between plans. |

## The case the brief's rules get wrong: case 9

Case 9 reads: "`/plan 9 --self-rule` with a step's check still answered yes after two redrafts: the stop "The drafted step list" stands, nothing written."

The rules that give the wrong result:
- Item 4.4 (`plan` Steps 2) rewrites the `Booked:` line of each choice whose bullet is copied from the rulings file "to the new `plan.md` and the line the bullet stands on there".
- Item 4.6 (Steps 6) says "the opening commit also holds the choices file when Steps 2 or 3 changed it".
- Steps 2 runs before the stop of Steps 3, so on this case the choices file is already changed.

The result they give:
- The choices file is changed and its `Booked:` lines point at a `plan.md` that was never written.
- The rulings file is still there, because the opening commit that removes it never ran.
- A later `C<n> Agree` or `C<n> => ...` follows `Booked:` to a missing `plan.md` and refuses, though the bullet is still in the rulings file.
- "Nothing written" is false.
- The same flaw applies to a by-hand `/plan` whose draft the user has not yet approved, since item 4.4 has no condition on `--self-rule`.

Rulings I need (the same ruling covers the other `/plan` bullets, which would be worded to match):
- (a) The rewrite is made when `plan.md` is written, at the end of Steps 3 under the approval or the closing of Open item A, and is carried by the opening commit (Steps 6). Pros: a stop that stands leaves the choices file and the rulings file as they were, which is what case 9 says; the line number is the written one. Cons: it moves the brief's "Steps 2" to Steps 3, which is a change to text the brief dictates.
- (b) The rewrite stays at Steps 2 as the brief has it, and case 9 is read as "no `plan.md` written". Pros: the brief's text is followed to the letter. Cons: it leaves the dangling `Booked:` above.
- Recommendation: (a). Lazy option: (b).

## Two smaller points, for your ruling together with the above

1. Case 28 against item 5.7 (Steps 10 under `--self-rule`):
   - When `/grill --self-rule` is run again and finds nothing open, it writes no file.
   - The rule "the files written, the choices file among them, are committed by explicit path in one commit" would commit an unchanged choices file. `git commit -- <path>` on an unchanged path exits 1.
   - Unless you rule otherwise, I write "the files it wrote, the choices file among them when it wrote it", and a run that wrote none makes no commit. I list this under judgment calls, serving case 28.
2. Item 5.4 against Decision 2:
   - Decision 2 says the six kinds are "named by that section and never listed again in `grill`", and item 5.4 then lists examples in `grill`'s words: "a decision on an ADR in force", "a changed term of a standards page" and others. Those are not the reference's words for kind 3, which reads "a contradiction of an ADR in force, or an option that supersedes one". Writing them as given restates a kind in other words, which the brief calls a finding.
   - (a) Write the sentence naming the reference's section and give no list. Pros: the rule is written once. Cons: it drops the dictated examples.
   - (b) Keep the list, with each example in the reference's own words for its kind. Pros: a reader of `grill` sees which of its decisions are those. Cons: the list stays a second place that names the kinds.
   - Recommendation: (a). Lazy option: (b).
   - Cases 3 to 5 are met by either, since they use rule clash, new term, new script and "do not rank", all words the reference holds.

Also, so you are not surprised, item 6.2 as written ("nothing is added that the user did not ask for, or that a quoted ruling ending "(self-rule)" names") reads as a prohibition of both on its face. I will write it as "Nothing is added except what the user asked for or what a quoted ruling ending "(self-rule)" names as a finding of a running plan", which has the brief's meaning, and list it under judgment calls.
