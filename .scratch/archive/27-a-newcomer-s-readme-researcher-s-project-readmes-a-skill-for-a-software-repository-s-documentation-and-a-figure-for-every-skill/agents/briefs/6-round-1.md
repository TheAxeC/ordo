# Repair round 1 of step 6

The findings of `agents/reviews/6-refuter.md`, each with its ruling. Every rule of the brief `agents/briefs/6.md` still holds. Work in the same worktree, under the same git rules. When the round is done, add a section "Repair round 1" to your report `agents/reviews/6-report.md` that answers each ruling by its number, with the checks rerun and their output, and keep the rest of the report true for the tree as it then stands.

1. **Spec 1: the length of `` #### `plan.yaml` ``.** The brief's "at most about 15 lines of text" means rendered lines at about 100 characters, about 1500 characters of text in all, not source lines. The subsection is cut to that length: each part keeps the facts the brief names for it, in fewer words, and points to the page that states the rest.
   - The cost script's settings take one sentence. It names `CLAUDE_CODE_ENABLE_TELEMETRY=1` and `OTEL_LOG_RAW_API_BODIES=file:<folder>`, says the script reads them from Claude Code's settings files, and names `plan-orchestration`'s `templates/plan_cost.py` head comment as the page that states the rest. Read the head comment first, and name it only when it states the settings files the script reads.
   - The `.agents/plan.yaml` note takes one sentence.
   - The report gives the subsection's character count, with the command.
2. **Spec 2: `templates/plan.projects.yaml`.** It describes no key. The sentence says that `templates/plan.yaml` describes every key and the default of each optional one, and that `templates/plan.projects.yaml` holds the same keys for each of several projects, a plan then named `<project>/<entry>`, as that file's second comment line states.
3. **Spec 3: four sentences that misstate a skill.**
   - The `spec` row and the `/spec` line of the order of use say the brief check runs for a full step only, as the `spec` skill's description says.
   - The "close them" line says a repair round runs up to `repair_rounds` times and that a small text step has none, as the glossary entry **repair round** says.
   - The sentence before the plan loop figure leaves `ordo-help` out of the skills that run each step, or says what `ordo-help` does: it prints the commands and where a plan stands.
   - The introduction's sentence on the other skills does not say they work outside a plan, since `diagnose` works in a plan or on its own. It says what the other skills do, with no claim about where.
4. **Spec 4: the landing script and the ledger.** The sentence keeps the old meaning: `land.sh` runs from the `land` skill's own folder, and no copy of it goes into the ledger. It makes no claim about which ledger files reach `main`.
5. **Standards 1: terms a newcomer meets unexplained.** Each of these is explained where it first appears, or reworded in plain words a Claude Code user knows:
   - "checks the step's premises against the tree" (the `spec` row): such as "checks what the step assumes against the repository".
   - "standards pages" (the `codebase-design` row): the repository's written pages of design and coding rules.
   - "a task of a resumed agent" (the paragraph on how to read the figures): an agent sent a further message, as the figures' legends mean it.
   - "the shared rules for `CLAUDE.md`" and "the plan terms for the glossary" (the `plan.yaml` subsection): what each is in a few words, the shared rules being the rules every repository set up by `ordo-init` holds in its `CLAUDE.md`, and the plan terms the definitions of the plan skills' terms in its glossary, each kept equal to its template in `ordo-init`'s `templates/`.
   - "prices each agent role" (the cost script): "computes what each agent role cost".
   - Then read the whole README once more for any other term used before it is explained, and explain or reword each one found. The report lists each.
6. **Standards 2: the list of where each old fact stands.** Rewrite the list to the rules file's rule 18: one row per fact of the old text, and for each row the line of the named place that states it, quoted, found by `grep -n`. A row whose place does not state the fact whole is a fact the new README keeps, in short, or the row names a place that does state it. Correct the two rows the review found: the `/roadmap` and `/ordo-init` bullets of `references/self-rule.md` stand under its section "A skill with its own approval stop", and the row on the example files follows ruling 2.

Run again every check of the brief's "Verify before you report" and every case of its "Cases", and quote their output.
