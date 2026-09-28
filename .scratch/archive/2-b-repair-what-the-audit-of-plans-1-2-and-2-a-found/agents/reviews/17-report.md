# Report: step 17, the approved retro proposals applied to the rules pages

Everything in the brief is done.

## Open items of the state file, verbatim

The section "## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)" of `orchestrator-state.md` is empty (`grep -n -i -A6 'open items' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` prints line 35, then blank lines 36 and 37, then line 38 `## Closed items`).

## The premises, checked on the unchanged tree

- Rules 1 to 16 on lines 13 to 28 of both pages; `diff docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md` showed at the base the hunks `3c3`, `8c8`, `26c26` (rule 14's grep path only), `39c39`, `42,48c42`, `51c45`, `53,60c47`.
- `sed -n 45,46p docs/dev/skill-layout.md` and `sed -n 14,18p docs/academic-coverage.md` printed the lines the brief quotes.
- `grep -rln "rule inventory" skills docs README.md` printed nothing, exit 1.
- `grep -rn "rule 1[3-9]\|rules 1 to\|sixteen\|16 rules\|rule 16" skills docs README.md` printed one line only, `docs/academic-coverage.md:96`, a "sixteen-field matrix" of a source file, which is not a count of the rules.

No case of the brief turned out wrong against its own rules, so the step went on without a stop.

## The cases, first run (unchanged tree)

The cases were run by one shell file in the session scratchpad, `cases.sh`, which runs the brief's greps as written; case 3 greps each sentence of "What to build" whole with `grep -F -c`, in each of the four files (C = `docs/dev/change-standard.md`, T = `skills/repo-setup/templates/docs/dev/change-standard.md`, L = `docs/dev/skill-layout.md`, A = `docs/academic-coverage.md`), the brackets naming the files it belongs in.

```text
case 1:
$ grep -c '^[0-9]*\. \*\*' docs/dev/change-standard.md
16
$ grep -c '^[0-9]*\. \*\*' skills/repo-setup/templates/docs/dev/change-standard.md
16
case 2:
$ grep -n '^17\. \|^18\. \|^19\. \|^20\. ' docs/dev/change-standard.md
$ grep -n '^17\. \|^18\. \|^19\. \|^20\. ' skills/repo-setup/templates/docs/dev/change-standard.md
case 3:
P19 [CT] C=0 T=0 L=0 A=0
P6 [CT] C=0 T=0 L=0 A=0
P9 [CT] C=0 T=0 L=0 A=0
P14 [CT] C=0 T=0 L=0 A=0
P2 [CT] C=0 T=0 L=0 A=0
P1 [CT] C=0 T=0 L=0 A=0
P5 [C] C=0 T=0 L=0 A=0
P13 [CT] C=0 T=0 L=0 A=0
P17 [CT] C=0 T=0 L=0 A=0
P10 [L] C=0 T=0 L=0 A=0
P18 [L] C=0 T=0 L=0 A=0
P16 [A] C=0 T=0 L=0 A=0
P11a [A] C=0 T=0 L=0 A=0
P11b [A] C=0 T=0 L=0 A=0
P7 [A] C=0 T=0 L=0 A=0
case 4:
$ diff docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md
3c3 / 8c8 / 26c26 / 39c39 / 42,48c42 / 51c45 / 53,60c47   (hunk headers; exit 1)
case 5:
ok: docs/academic-coverage.md
check_coverage exit 0
```

## The cases, after the change

```text
case 1:
$ grep -c '^[0-9]*\. \*\*' docs/dev/change-standard.md
20
$ grep -c '^[0-9]*\. \*\*' skills/repo-setup/templates/docs/dev/change-standard.md
19
case 2:
$ grep -n '^17\. \|^18\. \|^19\. \|^20\. ' docs/dev/change-standard.md
29:17. **A rewrite keeps the meaning of every rule it carries.** When a change rewrites, m
30:18. **A map from old text to new places names one rule per row and a place that states 
31:19. **A change leaves no two statements that contradict each other.** Each rule the cha
32:20. **Nothing is changed that no brief item asks for.** A change outside the brief's it
$ grep -n '^17\. \|^18\. \|^19\. \|^20\. ' skills/repo-setup/templates/docs/dev/change-standard.md
29:17. **A rewrite keeps the meaning of every rule it carries.** When a change rewrites, m
30:18. **A change leaves no two statements that contradict each other.** Each rule the cha
31:19. **Nothing is changed that no brief item asks for.** A change outside the brief's it
case 3:
P19 [CT] C=1 T=1 L=0 A=0
P6 [CT] C=1 T=1 L=0 A=0
P9 [CT] C=1 T=1 L=0 A=0
P14 [CT] C=1 T=1 L=0 A=0
P2 [CT] C=1 T=1 L=0 A=0
P1 [CT] C=1 T=1 L=0 A=0
P5 [C] C=1 T=0 L=0 A=0
P13 [CT] C=1 T=1 L=0 A=0
P17 [CT] C=1 T=1 L=0 A=0
P10 [L] C=0 T=0 L=1 A=0
P18 [L] C=0 T=0 L=1 A=0
P16 [A] C=0 T=0 L=0 A=1
P11a [A] C=0 T=0 L=0 A=1
P11b [A] C=0 T=0 L=0 A=1
P7 [A] C=0 T=0 L=0 A=1
case 4:
$ diff docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md
diff exit 1
3c3
8c8
26c26
30,32c30,31
< 18. **A map from old text to new places names one rule per row and a place that states it.** In the coverage
< 19. **A change leaves no two statements that contradict each other.** Each rule the change writes is grepped
< 20. **Nothing is changed that no brief item asks for.** A change outside the brief's items is left out; when
---
> 18. **A change leaves no two statements that contradict each other.** Each rule the change writes is grepped
> 19. **Nothing is changed that no brief item asks for.** A change outside the brief's items is left out; when
43c42
46,52c45
55c48
57,64c50
case 5:
ok: docs/academic-coverage.md
check_coverage exit 0
```

Case 4 in detail: the hunks `3c3`, `8c8`, `43c42`, `46,52c45`, `55c48` and `57,64c50` are the base hunks `3c3`, `8c8`, `39c39`, `42,48c42`, `51c45` and `53,60c47`, moved by the four inserted lines, with the same text. Hunk `26c26` is rule 14, which differed at the base by its grep path; the check that it still differs by that path only: `diff <(sed -n 26p docs/dev/change-standard.md) <(sed -n 26p skills/repo-setup/templates/docs/dev/change-standard.md | sed 's/<the source tree, the tests, the examples and `docs\/`>/`skills\/`, `utils\/`, `docs\/` and `README.md`/') && echo "line 26 differs only by the grep path"` printed `line 26 differs only by the grep path`. The only new hunk is `30,32c30,31`: rule 18 of this repository's page and the renumbering after it.

## DONE / NOT DONE

Each "What to build" sentence is proven by its row of case 3 above (full-sentence `grep -F -c`, 1 in each file it goes into, 0 in the others); the placement is shown by the command in the last column.

| Item | Status | Proof: case 3 row | Placement |
|---|---|---|---|
| 1. Rule 4, P19 appended | DONE | `P19 [CT] C=1 T=1 L=0 A=0` | appended at the end of line 16 of both pages (`git diff` shows the one changed line) |
| 1. Rule 13, P6 appended | DONE | `P6 [CT] C=1 T=1 L=0 A=0` | end of line 25 of both pages |
| 1. Rule 14, P9 then P14 appended | DONE | `P9 [CT] C=1 T=1 L=0 A=0`, `P14 [CT] C=1 T=1 L=0 A=0` | end of line 26, P9 before P14 (`diff <(sed -n 13,29p C) <(sed -n 13,29p T)` prints line 14 of the range with both, in that order) |
| 1. Rule 15, P2 after its first sentence | DONE | `P2 [CT] C=1 T=1 L=0 A=0` | `sed -n 27p docs/dev/change-standard.md` prints `15. **Edges are exercised, not assumed.** For a script, every form of input ...` followed by the old second sentence `Every id or key a change introduces ...` |
| 1. New rule 17, P1 | DONE | `P1 [CT] C=1 T=1 L=0 A=0` | case 2, line 29 |
| 1. New rule 18, P5 as corrected ("In the coverage list") | DONE | `P5 [C] C=1 T=0 L=0 A=0` | case 2, line 30 |
| 1. New rule 19, P13 | DONE | `P13 [CT] C=1 T=1 L=0 A=0` | case 2, line 31 |
| 1. New rule 20, P17 | DONE | `P17 [CT] C=1 T=1 L=0 A=0` | case 2, line 32 |
| 2. Template: rules 4, 13, 14, 15 changed, P1, P13, P17 as 17, 18, 19, P5 left out | DONE | the CT rows above with T=1, and `P5 [C] ... T=0` | case 1 prints 19; case 2 prints P1, P13, P17 on lines 29, 30, 31 |
| 3. skill-layout line 45, P10 | DONE | `P10 [L] C=0 T=0 L=1 A=0` | `git diff -U0 docs/dev/skill-layout.md` shows `@@ -45 +45 @@` replacing the old bullet |
| 3. skill-layout after line 46, P18 | DONE | `P18 [L] C=0 T=0 L=1 A=0` | same diff shows `@@ -46,0 +47 @@`, the new bullet after "A numbered list means order." |
| 4. academic-coverage P16 after the mark bullets | DONE | `P16 [A] C=0 T=0 L=0 A=1` | `git diff -U0 docs/academic-coverage.md`: new line 18, its own paragraph after the blank line that follows the `drop` bullet |
| 4. academic-coverage P11, line 18's second sentence | DONE | `P11a [A] ... A=1`, `P11b [A] ... A=1` | same diff: the old line 18 is now line 20, first sentence "Every file was read in full before it was marked." unchanged |
| 4. academic-coverage P7 after line 18 | DONE | `P7 [A] C=0 T=0 L=0 A=1` | same diff: new line 22, its own paragraph |
| Cases, first run and after | DONE | the two runs above | |
| Verify list | DONE | see below | |
| ASCII, no hard wraps, no history | DONE | `LC_ALL=C grep -n '[^ -~]'` over the four files printed nothing, exit 1; each new sentence is one line (case 3 finds each whole sentence with the line-based `grep -F`); the new text carries no retro name, proposal number, date or step number (the sentences are the brief's, and case 3 matches them whole) | |
| Only the four files changed | DONE | `git status --short` prints ` M` for the four files and nothing else | |

The verify runner, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, printed (the ASCII check printed nothing), exit 0:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
```

A green run of this list covers the scripts' tests, the coverage test and the ASCII check. It does not read the meaning of the new rules; the cases above are the checks of the prose.

## Files changed

`git diff --numstat` and `grep -c ''` (lines after the change):

| File | Added | Removed | Lines now |
|---|---|---|---|
| `docs/academic-coverage.md` | 5 | 1 | 241 |
| `docs/dev/change-standard.md` | 8 | 4 | 64 |
| `docs/dev/skill-layout.md` | 2 | 1 | 72 |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 7 | 4 | 50 |

`git diff --stat` shows these four files and no other; nothing under the ledger changed but this report.

## Judgment calls

None. Every placement was given by the brief.

## Anything in the brief that was wrong

Nothing. Every premise of "What is on the tree" held on the unchanged tree, with the commands and output under "The premises, checked on the unchanged tree".
