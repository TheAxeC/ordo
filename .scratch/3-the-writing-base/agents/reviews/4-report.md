NOT DONE: the step's check does not hold. Of the manuscript run's findings, 35 are not marked right by both markers; of the grant run's, 29. Gate conditions 1, 2, 3 (manuscript run), 5 and 6 fail on the runs; conditions 4 and 7 hold. Each failure is listed under "The gate conditions" below and raised as Open item H in the state file.

# Report of step 4 of plan 3, the repeated runs of /writing

## Open items of the state file

- Open item H (2026-10-13, step 4, kind 3: a new step needs your ruling). Step 4's check fails: the repeated `/writing` runs on the pinned `v7.1.0-rc.2` still give findings that the two markers do not both mark right, and some gate conditions fail. For example, the grant review quotes 17 paragraph splits with sentences shortened to "...", and the manuscript review cuts "many" from "many existing approaches", so the replacement claims something about every approach. The failures are listed in `agents/reviews/4-report.md`, "The gate conditions", and finding by finding in `agents/reviews/4-marks.md`.
  - Option (a), recommended: a fix step 5 that changes `skills/writing/SKILL.md` and `skills/writing/references/` for each failure of this report (passages and replacements written out whole, qualifiers kept, no new term before its definition, the conditional of a split sentence kept, the voice of the draft kept, full paths in every place, the group line naming a loss, the review agent's one command), then main's head tagged `v7.1.0-rc.3` and pinned; step 6 repeats the runs and the marks; the closing becomes step 7. Pro: the gate is reached by the step list that already exists for this purpose. Con: two more steps and one more pin.
  - Option (b): close entry 3 with the gate unmet and the failures booked as a later entry. Pro: none beyond ending now. Con: `/writing` ships with defects its own gate names.
  - Recommendation: (a). The lazy option is (b).

## The cases' first run

`ls .scratch/3-the-writing-base/agents/reviews/4-run .scratch/3-the-writing-base/agents/reviews/4-marks.md`, run before the copies, printed `No such file or directory` for both, for all nine cases. After the step:

- C1: met for the numbered findings (every place `file:line` with its path from the main file's folder, places in included files, 152 of 157 place checks print 1 and the other five are references to another finding's place, checked by hand); not met for the tense list, whose 26 entries after each file's first give the file name without its folder (for example `b_architecture.tex:5`), and whose entry `c_evaluation.tex:1` names finding 39's sentence, which stands at line 6.
- C2: met except paragraph 35 split (b), whose first quoted sentence is finding 4's replacement, not the draft's text.
- C3: not met: groups are named by page and section and each has a line, but both markers of the manuscript name three lines and both markers of the grant name two lines that do not name what the reader loses.
- C4: not met for the manuscript: finding 83 quotes no passage and finding 68 names its sentence by reference; both markers. The grant: met.
- C5: met for the grant; not met for the manuscript, whose review agent ran a second `Bash` command of term greps beside the character-set grep.
- C6: met for both: the manuscript agent read the three pages and all 33 files with `Read` (36 distinct files), the grant agent read the three pages and ran the script.
- C7: met for both, evidence under condition 4 below.
- C8: met: two marks on every finding from two fresh agents per run, none of them a review agent, each `ordo-high` served `claude-opus-5-5`; the manuscript markers were given the report by path (Open item G, C70), and manuscript marker 1 read 16 of the 33 files with `cat -n` in `Bash` and 17 with `Read`.
- C9: met as a record: `4-marks.md` lists the 35 and 29 findings not marked right by both, each with both reasons. The step's check therefore does not hold.

## DONE / NOT DONE

| Check | Result |
|---|---|
| Copies made and equal before the runs | DONE: `diff exit 0`, `cmp exit 0`, `rh status exit 0`, `pinned: v7.1.0-rc.2, 14 skills linked in: ...`, `pin check exit 0` |
| Manuscript run through the Skill tool | DONE: review agent ae6cdd9db984557c9, `ordo-high`, served `claude-opus-5-5`, 211130 tokens, 39 tool uses, 30.5 min |
| Grant run through the Skill tool | DONE: review agent ad72ce97d4f621a3b, `ordo-high`, served `claude-opus-5-5`, 134085 tokens, 6 tool uses, 10.3 min |
| Reports saved into `4-run/` | DONE: each equals the agent's `SubagentHandback` message apart from one letter written by its name (manuscript: `<latin small letter e with acute>`; grant: two `<en dash>`) |
| Four markers | DONE: a06df53aba5d3a063 (244143 tokens, 32 tool uses, 14.3 min), a1adeaa151d894670 (230831 tokens, 42 tool uses, 13.4 min), a0e8b92e8fd4f7258 (118985 tokens, 8 tool uses, 5.5 min), a17c2d12dd7e8cd3f (120846 tokens, 7 tool uses, 6.0 min), each `ordo-high`, served `claude-opus-5-5` |
| Every finding right by both | NOT DONE: 35 manuscript and 29 grant findings are not |
| Gate conditions 1 to 7 | NOT DONE: 1, 2, 3, 5 and 6 fail |
| Copies equal after the marks | DONE: `diff -r exit 0`, `cmp exit 0`, research-hub `git status --short` prints 0 lines |

## The gate conditions

1. Places. Fails. The manuscript: one `sed -n '<line>p' <file> | grep -cF -- '<part>'` per place was run from the main file's folder for the 157 places of numbered findings and tense entries; 152 print `1`. The five that print `0` give their passage by another finding's number (b_implementation.tex:9, b_architecture.tex:14, c_variants.tex:1, c_evaluation.tex:8) or carry the quote on the next line (d_results.tex:15, which `sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'That is, although baseline model results vary'` prints `1`). Failures: 26 tense entries name the file without its path from the main file's folder; the tense entry at `c_evaluation.tex:1` refers to finding 39's sentence, and `sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Likewise, for the comparison against the randomly'` prints `0` where line 6 prints `1`. The grant: each passage part, checked against the numbered paragraph of `docx_paragraphs.py`'s output, is found in 59 of 60 passages; paragraph 35 split (b) is not, since its first sentence is finding 4's replacement.
2. Grouping. Fails. Both reports are grouped by page and section, the first group the one that most changes what the reader trusts, and every heading has one line. Lines that do not name a loss, by both markers: manuscript "Reader's question per section", "Most specific term" (its stated misreading is contradicted by tables/results_finetune.tex), the prose standard's section 0 for its six dash places; grant "Hedging" and "ASCII throughout".
3. One fresh agent that edits no file. Holds for the grant: ad72ce97d4f621a3b, `ordo-high`, served `claude-opus-5-5`, tool uses `Read` 3, `Bash` 2, `SubagentHandback` 1; its commands are the script's command and the same command piped through `LC_ALL=C grep -n '[^ -~]'`. Fails for the manuscript: ae6cdd9db984557c9, `ordo-high`, served `claude-opus-5-5`, tool uses `Read` 36, `Bash` 2, `SubagentHandback` 1, no `Edit`, `Write` or `NotebookEdit`; its first command is the character-set grep over the 33 files, and its second runs `grep -n -o` for 'HCCNet-Pico', 'feature extractor', 'stem|patchify layer|first convolutional layer', AUC and model-size terms over the draft, a read-only command the skill's prompt does not allow ("The one command you run on a .tex ... draft is `LC_ALL=C grep -n '[^ -~]' <file>`"). One `Agent` call stands in each run's span.
4. The session wrote nothing and read no draft. Holds. Manuscript span (session transcript lines 37248 to 37337): `Bash` `grep -n -e '\\input{' -e '\\include{' 'main.tex'` and two loops of the same grep over the listed files, `Agent`, `Bash` `sleep 10; grep -o '"model":"[^"]*"' .../agent-ae6cdd9db984557c9.jsonl | sort -u`, then in the turn the manuscript notice started `Skill` (grant), `Bash` `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`, `Agent`, `Bash` model check of ad72ce97d4f621a3b, `Read` twice of the persisted tool result holding the manuscript report. Grant span (to line 37400): the same after its `Skill` call, then a context compaction and one `Bash` `grep -n -i -E 'Decision|next message|one message|nothing else|whole' .../briefs/4.md | head -40`. No `Write`, `Edit` or `NotebookEdit`; no read of a draft file. The text that ends each turn equals the review agent's `SubagentHandback` message (a comparison of the two strings printed `True` for both). The pin before the first run: `pinned: v7.1.0-rc.2, 14 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills`, `pin check exit 0`; each `Skill` result names `Base directory for this skill: /Users/axelfaes/.claude-backup/skills/writing`.
5. Passage and replacement as text. Fails for the manuscript: finding 83 quotes no passage (both markers); manuscript marker 1 reads the replacements of findings 5, 64 (first break), 66, 67, 68, 69, 71, 82 (first break) and 83 as descriptions of the edit, which marker 2 counts as text. The grant: holds by both markers.
6. Two marks each. Fails on its last part: every finding has two marks from two distinct agents, none a review agent, each `ordo-high` served `claude-opus-5-5`; not every finding is right by both (`4-marks.md`). Marker tool uses: a06df53aba5d3a063 `Read` 24, `Bash` 7; a1adeaa151d894670 `Read` 40, `Bash` 1; a0e8b92e8fd4f7258 `Read` 5, `Bash` 2; a17c2d12dd7e8cd3f `Read` 5, `Bash` 1; each `SubagentHandback` 1, none `Edit`, `Write`, `NotebookEdit`, `Agent` or `Skill`. The grant markers' prompts hold the report equal to the review agent's message (a comparison printed `equal: True 40787 40787` for each). The manuscript markers' prompts give the saved report's path (Open item G). No marker was given another's marks. Manuscript marker 1 read 16 of the 33 files with `cat -n` in `Bash`, not with `Read`.
7. The copies equal their sources after the marks. Holds: `diff -r exit 0`, `cmp exit 0`, research-hub `git status --short` prints 0 lines.
8. What the marks do not check: they judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none.

## Files

```
     116 .scratch/3-the-writing-base/agents/reviews/4-run/grant-marks-1.md
     128 .scratch/3-the-writing-base/agents/reviews/4-run/grant-marks-2.md
     386 .scratch/3-the-writing-base/agents/reviews/4-run/grant-report.md
     333 .scratch/3-the-writing-base/agents/reviews/4-run/manuscript-marks-1.md
     227 .scratch/3-the-writing-base/agents/reviews/4-run/manuscript-marks-2.md
     515 .scratch/3-the-writing-base/agents/reviews/4-run/manuscript-report.md
```

## Judgment calls the brief left open

- The manuscript markers read the report by path (Open item G, C70).
- Three marker starts were stopped before they did any work, since their prompts did not hold the report whole: a16a29426ffdd26f3, a620ea19667843403 and a07ee5da81e8d1b27, each `ordo-high`; none of their output is used.
- A finding with several places is marked per place, and `4-marks.md` gives a row per place where the marks differ.

## User-visible changes

None: the step changes no file outside the ledger.

## Wrong or impossible in the brief

- "The marks", first bullet: the manuscript report, 76936 characters, could not be written into a marker's prompt; Open item G gives the path instead.
