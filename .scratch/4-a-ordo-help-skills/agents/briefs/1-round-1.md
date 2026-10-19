# Brief: 1, repair round 1

The brief `agents/briefs/1.md` still governs the step: its rules, conventions, paths and checks hold unchanged. This round closes the four findings of the refuter report `agents/reviews/1-refuter.md`, each with the ruling below. The paths it writes are those of the brief; no path is added.

## Rulings

1. **Standards 1, the skills folder read two ways** (`skills/ordo-help/SKILL.md`, "What it reads" 2 and "Steps / skills" 1). Rewrite both so the order cannot be misread: first this skill's folder, the base directory the runner states when the skill loads, is resolved to its real path with `cd <base directory> && pwd -P`; then the skills folder is the parent of that resolved path. The completion line of "Steps / skills" 1 names the parent of the resolved path. Nowhere may the text say or allow taking the parent of the unresolved base directory.
2. **Standards 2, "nothing else" stated only in the title paragraph** (`skills/ordo-help/SKILL.md`, "Steps / skills"). Ruling D2 holds throughout the `skills` mode, so write it once where `docs/dev/skill-layout.md`, "Where a rule goes", puts such a rule: one bullet that says the `skills` mode prints only the name lines, the Quick start blocks, the `no Quick start block` lines and the blank lines between skills. Reword "Steps / skills" 1 and 2 so they find and list without printing (for example "Find", "Sort"), each completion line saying what is known, not what is printed. The title paragraph may keep "and nothing else" as the summary it is.
3. **Standards 3, the figure names the argument as a bare word** (`docs/figures/gen_figures.py` lines 539-540, `docs/figures/pipeline.svg`). Reword the box body so a reader of the figure alone learns the command is `/ordo-help skills`, for example by writing `/ordo-help skills` in full, worded so the script still exits 0 with no `error:` line. Regenerate `pipeline.svg` with `python3 docs/figures/gen_figures.py`; `plan-loop.svg` stays byte for byte as on the base.
4. **Behaviour 1, the report has no before-and-after section** (`agents/reviews/1-report.md`). Add the section "Every host- or user-visible change with its before and after", holding each such change with its before and its after: `/ordo-help skills` (before: `skills` read as `<entry>` and refused with "No ledger folder" naming `/plan`; after: the name lines and blocks), the new trigger phrases, the README row, the pipeline figure's `/ordo-help` box (its body lines and the positions that moved), the `### The sequence and the plans` heading over the old Steps and the three references rewritten, and the two version numbers. Each before and after is taken from the base (`git show 7e8082d:<path>`) and the changed tree, not from memory.

## Verify before you report

Every check of the brief's "Verify before you report" again, from the worktree root, with its output quoted verbatim in the rewritten report. For ruling 1, quote the new "What it reads" 2 and "Steps / skills" 1 lines. For ruling 2, quote the new bullet and the reworded items 1 and 2. For ruling 3, quote lines 539-540 and the script's output.

## Report

Rewrite `.scratch/4-a-ordo-help-skills/agents/reviews/1-report.md` in the brief's shape, end state only, with a section "Repair round 1" that names each of the four findings, the change that closes it with its `file:line`, and the check that shows it.
