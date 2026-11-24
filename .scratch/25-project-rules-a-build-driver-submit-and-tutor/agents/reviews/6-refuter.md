# Refuter report: step 6 of plan 25

## Verification lines

Check 1, `git diff 6c0ae1b --numstat`:
```
1<tab>0<tab>docs/adr/0048-tutor-is-a-copy-of-mattpocock-s-teach-with-the-name-an-explain-mode-and-its-page-added.md
1<tab>0<tab>docs/adr/0050-a-length-limit-is-met-by-cutting-content-and-the-layout-is-only-what-the-venue-or-funder-states.md
4<tab>4<tab>skills/explain/tutor/SKILL.md
```
That is three files and 10 lines added plus removed.

Check 2, the brief's character-set check, run with `printf '%s\0'` over the three changed files: it printed nothing and the shell printed `exit 0`. The same scan over `6-report.md` printed nothing.

Check 3, `grep -rn 'GLOSSARY.md' skills/explain/tutor`:
```
skills/explain/tutor/SKILL.md:105:   - Write the glossary as the Markdown file `reference/GLOSSARY.md` of the teaching workspace, in the structure that `references/glossary-format.md` gives.
skills/explain/tutor/SKILL.md:147:- **`reference/*.html` and `reference/GLOSSARY.md`.** The reference documents: the compressed learnings from the lessons, which are the raw units of learning, such as cheat sheets, reference algorithms, syntax and yoga poses as HTML files, and the glossary as a Markdown file in the structure of `references/glossary-format.md`.
skills/explain/tutor/references/glossary-format.md:1:# GLOSSARY.md Format
skills/explain/tutor/references/glossary-format.md:3:`GLOSSARY.md` is the canonical language for this teaching workspace. All explainers, exercises, and learning records should adhere to its terminology. Building it is itself part of learning: compressing a concept into a tight definition is evidence the user understands it.
skills/explain/tutor/references/learning-record-format.md:41:- Anything already captured tersely in [[GLOSSARY.md]] as a term definition. Don't duplicate.
```

On the unchanged tree, the same grep run on `git show 6c0ae1b:` of each of the three files printed only the three format-page lines above (`glossary-format.md:1`, `:3` and `learning-record-format.md:41`). It printed no line of `SKILL.md`.

The builder's evidence commands, rerun:
- `python3 -c 'import yaml; print(yaml.safe_load(open("skills/explain/tutor/SKILL.md").read().split("---")[1])["metadata"])'` printed `{'version': '1.0.1'}`.
- `git diff 6c0ae1b -- skills/explain/tutor/references | wc -l` printed `0`.
- `grep -n -i 'glossar' skills/explain/tutor/SKILL.md` printed lines 34, 100, 103, 104, 105, 106 and 147.
- `grep -n -i 'font\|profile\|default\|does not state'` on `git show 6c0ae1b:docs/adr/0050-...` printed lines 11 and 26. On the tree it printed lines 11, 13 (the new bullet) and 27.
- `grep -n -i 'format profile\|reference document' docs/glossary.md` printed nothing (exit 1).
- `grep -rn -i 'format profile' skills/academic/grant` printed `references/intake.md:35`, `:79` and `SKILL.md:181`, `:225`, `:226`, `:228`.
- `grep -n -i 'glossar' README.md` printed lines 13, 15, 25, 176, 178, 180, 184, 185 and 190, none of them about `tutor`.

## Verdicts

Items:
1. Holds, with finding S1. `SKILL.md:105` names `reference/GLOSSARY.md` as a Markdown file in the structure of `references/glossary-format.md`. `SKILL.md:100` (the opening of item 9) and `SKILL.md:147` ("The teaching workspace") are the other two places that list the contents of `reference/`, and both now name the file. The version is `1.0.1`, raised by its patch part as the brief says. The format pages are unchanged (`wc -l` of their diff is `0`). The version raise the brief dictates is the subject of S1.
2. Holds. ADR 0048, Decision: one bullet was added at line 15, with the name, the Markdown form, its place among the HTML reference documents, and the reason.
3. Holds. ADR 0050, Decision: one bullet was added under the opening sentence at line 13, and the diff shows no other line of the record changed.

Cases:
- Item 9 reached for a topic with its own nomenclature: met (`SKILL.md:105`). First run on the unchanged tree, as the report gives it: not met.
- A learning record linking `[[GLOSSARY.md]]`: met (`SKILL.md:147` puts the file in `reference/`). First run as the report gives it: not met.
- ADR 0050 asked where the font size comes from when the venue states none: met (line 13). First run: not met; base lines 11 and 26 do not answer it, which my rerun reproduces.
- `grep -rn 'GLOSSARY.md' skills/explain/tutor`: met (check 3 above). First run: not met, which my base run reproduces.

## Spec

S1. The version is raised a second time in the same plan, and by the wrong part. Place: `skills/explain/tutor/SKILL.md`, frontmatter, and the brief's "Decisions taken in this brief" 1. Hunk:
```
-  version: "1.0.0"
+  version: "1.0.1"
```
What is wrong:
- `docs/dev/skill-layout.md`, "Frontmatter", says: "A plan that changes a skill raises one part of its `metadata.version` once, and sets the parts after it to 0." `tutor` was created at 1.0.0 by step 5 of this same plan. `plan.md` line 60 reads "Landed: `skills/explain/tutor/` (`SKILL.md` 1.0.0 ...". The plan applies that rule as one raise per plan elsewhere: `plan.md` line 35, on `ordo-init`, says step 1 "leaves that version as it is".
- The same section defines the patch part as: "The patch part when only the wording changes and every run behaves as before." That is not the case here. Before this step, item 9 had the agent write every reference document "as HTML files in `reference/`", with no name for the glossary. After it, a run writes `reference/GLOSSARY.md` in Markdown, so a run's output changes.

Failure scenario: the skill is first released at this plan's close as 1.0.1. A reader of the version infers that a 1.0.0 with a different glossary behaviour shipped before, though none did. A later plan that follows the "once per plan" rule finds this plan raised `tutor` twice.

The fix is that the version stays `1.0.0`, since the plan's one raise is the skill's creation. It is a one-line change at landing. The builder followed the brief, so this is the orchestrator's to correct in the brief's decision 1.

S2. The `deviations.md` row required by the step's text is missing. Place: `.scratch/25-project-rules-a-build-driver-submit-and-tutor/plan.md` line 29 (step 6) says: "with one line in the Decision of ADR 0048 and its row in `deviations.md`". What is wrong:
- The brief's "What to build" and "Paths this step writes" leave `deviations.md` out, and the diff does not touch it.
- `deviations.md` has no row for the glossary's name, form and place.
- Its last paragraph is now false: "The point of ruling 7 stays raised for the user. The format pages name `GLOSSARY.md`, and the workspace writes no file of that name."
- If S1 is not taken, its row "no version | `metadata.version: "1.0.0"`" is stale as well.

Failure scenario: at the gate the user checks "the plan's ledger lists every deviation from the design of mattpocock's `teach` ... and nothing else differs" (plan.md line 11). They find no row for `reference/GLOSSARY.md`, and a sentence saying the workspace writes no such file, so the ledger contradicts the skill. Under the change standard ("Nothing under the ledger folder is edited except the report the brief names") the builder could not write this file, so the row and the corrected paragraph fall to the orchestrator at landing.

## Proof

None. Every quoted command I reran gave the output the report claims: the numstat rows, the yaml version, the `0` from the references diff, the GLOSSARY grep, the ADR 0050 greps on the base and the tree, the glossary grep exiting 1, the grant grep and the README grep.

## Standards

St1. The report omits the state file's open items. Place: `6-report.md` as a whole. `docs/dev/change-standard.md`, rule 7, says: "First line: anything NOT DONE, or that everything in the brief is done. Then the state file's open items verbatim." The report goes from its first line straight to "The cases' first run" and gives no open items, nor a line saying there are none. The same page says "nothing in a brief overrides anything here", so the brief's shorter report shape does not lift this. Failure scenario: an orchestrator landing from the report cannot tell whether an open item bears on this step, such as the raised point of ruling 7 that S2 concerns, without opening the state file separately.

The names the diff changed were grepped across the shipped tree: `GLOSSARY.md`, `reference/`, "glossary" with "tutor", "teaching workspace" and "format profile", over `skills/`, `docs/` and `README.md`. These hits still hold:
- `docs/glossary.md:168` ("teaching workspace", which lists `reference/`).
- ADR 0048 lines 7 and 17.
- README.md:26.
- `SKILL.md:133`.
- `formatter_agent.md:129`, which states the same rule as the new ADR 0050 bullet.
- `grant` `SKILL.md:225-228`, where the profile holds only the funder's stated values, so the bullet stays true for `grant`.

No other finding: the diff has no non-ASCII character, no history, date or step number in shipped text, nothing private and no em dash.

## Behaviour

None. The one user-visible change is that the glossary becomes the Markdown file `reference/GLOSSARY.md` instead of an unnamed HTML file. The report states it with before and after, in the cases' first run and in "Each changed sentence, before and after".

## Declined to judge

- The report's ASCII check "fed by `git diff --name-only -z`": that is a git command outside the three allowed. I ran the check over the three files named explicitly instead.
- The report's `git diff --numstat` with no base: I ran `git diff 6c0ae1b --numstat`, which is the form my brief gives.
- Whether `tutor` 1.0.0 was ever tagged or pinned before this step, which bears on S1, would take `git tag --contains 6c12304` or `git log`. Neither was run. The plan's ledger (line 60, and step 7's "release candidate tagged and pinned") points to no release yet.
- The state file's open items, which St1 concerns, were not read, since the state file is outside my reading list.

Agent usage: a5a55e89c91a2caba, claude-opus-5-5, 116573 tokens, 12 tool uses, 3 min 0 s.

## Closed

- S1, the version raised a second time in the plan: fixed at landing, `metadata.version` of `tutor` stays 1.0.0, since the plan's one raise is the skill's creation.
- S2, the row in `deviations.md`: written at landing, with the last paragraph of that file corrected.
- St1, the open items missing from the builder's report: the state file held no open item that bears on the step when the report was written; nothing to change on main.
