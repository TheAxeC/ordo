# Report: step 5 of plan 5, the gate's comparisons

NOT done: C15, since Axel called lit-review and revision losses and full a tie; C8, since three entries of the lit-review `refs.bib` (Kolda_2009, Agueh_2011, Bonneel_2016) do not resolve. Both are handed to step 5.A by the rulings "The calls and the repair's scope" and "The full call" (`plan.md` Rulings). Everything else in the brief is done.

## Open items of the state file

The state file's open items section holds no item (`sed -n '/^## Open items/,/^## Closed/p' .scratch/5-paper/orchestrator-state.md` prints the heading, its two lines of text and no item).

## The cases' first run

Run on the tree at the launch commit 6016155, before any change:

- C1: `git tag --list v8.4.0-rc.2` printed nothing, and `git -C ~/.local/share/ordo-stable describe --tags` printed `v8.4.0-rc.1`.
- C11: `git -C ../research-hub status --short -- projects/manuscripts/bttn-incident-af projects/manuscripts/raw-pls projects/archive/published/2026/dongho-ecg-clustering .agents/skills/academic-paper` printed nothing.
- C2 to C10, C13 and C14: no run yet. C12 and C15: no record yet.

## DONE / NOT DONE

| Item or case | State | Evidence |
|---|---|---|
| 1 The release candidate | DONE | `git tag v8.4.0-rc.2 678a5a7`; `utils/pin.sh v8.4.0-rc.2` printed "pinned: v8.4.0-rc.2 (678a5a7), 16 skills linked in: ..." and "pinned: 5 agents linked in: ..."; now `git -C ~/.local/share/ordo-stable describe --tags` prints `v8.4.0-rc.2` and `utils/pin.sh` with no argument exits 0 |
| 2 The working folder | DONE | every copy, side, run and judge under `gate5/`; 31 run transcripts there |
| 3 The sides and the runs | DONE | commands and sessions in `5-blind-comparison.md` "Commands" and each comparison's "Sides", and in `5-single-mode-runs.md` |
| 4 The stops | DONE | `5-blind-comparison.md` "Answers to the sides"; `5-single-mode-runs.md` "Stops, questions and answers" |
| 5 The comparison | DONE | three comparisons, each with two judgments and the order swapped; full with two more judgments under a corrected prompt |
| 6 The lit-review entries | NOT DONE | 81 of 84 entries resolve (`5-lit-review-resolve.md`); the three that do not go to step 5.A |
| 7 The four single-mode runs | DONE | `5-single-mode-runs.md`, with Axel's reading under "Axel's reading" |
| 8 The `/writing` findings | DONE | patch 12 answers findings 1 to 39 under the autonomous writer pass; Axel's reading under "Axel's reading" of `5-single-mode-runs.md` |
| 9 The records | DONE | the six records and the outputs as judged, committed in 517f0ea, 432ecb5 and 73f3a5b |
| 10 Nothing written in research-hub, nothing pushed, no money spent | DONE | C11 below; no `git push` ran; `lookup.py` ran on public indexes without keys |
| C1 | met | `git tag --list v8.4.0-rc.2` prints `v8.4.0-rc.2`; `git rev-list -n1 v8.4.0-rc.2` prints `678a5a74694766e8d56046cf6e9bd783ed3de2df`; `describe --tags` prints `v8.4.0-rc.2`; `pin.sh` exit 0 |
| C2 | met | each `init` message reads claude-opus-5-5 (the records list each session's served model) |
| C3 | met | `diff -r -x .git -x .agents -x .claude` against fresh `git archive` copies printed "C3 full-1 diff exit=0", "C3 full-2 diff exit=0", "C3 exit=0" (revision), "C3 code exit=0" (revision `code/` before the resume), and "single-1 C3 exit=0" to "single-5 C3 exit=0"; the lit-review copies are empty folders |
| C4 | met | each `paper` side loads `/Users/axelfaes/.claude/skills/paper`, linked into `~/.local/share/ordo-stable/skills/paper` at v8.4.0-rc.2 (version 2.1.0); its Skill calls name only `writing`; each academic-paper side's `init` lists no skill |
| C5 | met | each side's questions and the one answer it got are in the ledger under `sides/<side>/` and `5-single-mode-runs/<mode>/`; the matched questions got the same words; each denied call is named in the records |
| C6 | met | each hit of the pattern is named in `5-blind-comparison.md` "The C6 hits that are no mark" with why it is no mark |
| C7 | met | two judgments per comparison with the order swapped, read through `5-blind-comparison-key.md` |
| C8 | unmet | Kolda_2009, Agueh_2011 and Bonneel_2016 do not resolve by title (OpenAlex and Semantic Scholar answered HTTP 429); a direct Crossref lookup of each DOI matches the entry |
| C9 | met | every `paper` run stopped first at its intake confirmation, a stop in its mode's list; each later stop, taken under the answer's last sentence, is named with the stop of the mode's list it is |
| C10 | met | each run left its output, and patch 12 applies or lists each of the 39 findings; Axel adopted the record's readings as his own (ruling "The reading of the single-mode outputs") |
| C11 | met | the scan of every `tool_use` input in the 118 transcripts under `~/.claude/projects/*gate5*` (sides, runs, judges and their subagents) printed "tool calls naming research-hub: 0"; the `git -C ../research-hub status --short -- ...` of the case prints nothing |
| C12 | met | the character-set check below prints nothing and exits 0; the record holds Axel's calls |
| C13 | met | no judge's tool call reads a path outside its copy (`facts.py`) |
| C14 | met | each judge used in the record lists 8 instruction files; the two lit-review judgments with `--restricted`, which loaded none, are not used |
| C15 | unmet | lit-review a loss, revision a loss, full a tie |

The checks of "Verify before you report", run from the repository root:

```
$ find .scratch/5-paper/agents/reviews -path '*/5-*' -type f -print0 | xargs -0 perl -CSD -ne '...'; echo "perl exit=$?"
perl exit=0
$ git -C ~/.local/share/ordo-stable describe --tags
v8.4.0-rc.2
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE utils/pin.sh >/dev/null 2>&1; echo "pin.sh exit=$?"
pin.sh exit=0
$ git -C ../research-hub status --short -- projects/manuscripts/bttn-incident-af projects/manuscripts/raw-pls projects/archive/published/2026/dongho-ecg-clustering .agents/skills/academic-paper
$ git status --short
```

The last two print nothing. The plan's whole verify list runs once, at landing on main.

## Each comparison's result

- Lit-review: both judges chose academic-paper. Axel's call: a loss ("Open item 1: Agreed", on the recommendation of a loss).
- Revision: both judges chose academic-paper; judge 1 also counted the missing response letter, which is `rebuttal`'s work, and judge 2 chose academic-paper for other reasons. Axel's call: a loss ("Open item 1: Agreed").
- Full: the first two judges chose `paper`, under a prompt that summed up the answers with an "only" the answers did not hold. The two judges under the prompt that quotes the answers word for word differ: judge 3 `paper` ("Verdict: A, by a narrow margin."), judge 4 academic-paper ("Verdict: A"). Axel's call: a tie ("(a)"), and step 5.A runs the full comparison again.

## Judgment calls the brief left open

- The judges run without `--restricted`, since `--restricted` loads no `instructions` attachment (C109, then the ruling "Step 5's judges run without `--restricted`").
- The `paper` side's compile folders `compile-review6` to `compile-review8` were left out of the full judges' copies, since they hold absolute paths of the copy; the manuscript files and every other file the side wrote are kept.
- Eleven strings the URL search found in the full outputs were set aside as no citation (`gate5/full-urls-dropped.txt`).
- The lit-review academic-paper PDF given to the judges was rebuilt from the blinded `.tex`, since the side's own PDF names the skill.
- The full comparison was judged a second time with a prompt that quotes the answers word for word, on Axel's agreement to the recommendation.
- single-5's reply to the closing `/writing` report was taken as the autonomous writer pass under the answer's last sentence; no one-line pick from Axel was given.

## Host- and user-visible changes

- The tag `v8.4.0-rc.2` on 678a5a7: before, `git tag --list v8.4.0-rc.2` printed nothing; after, it prints the tag. Not pushed.
- The pin: before, `git -C ~/.local/share/ordo-stable describe --tags` printed `v8.4.0-rc.1`; after, `v8.4.0-rc.2`, with 16 skills and 5 agents linked in `~/.claude`, `~/.claude-backup` and `~/.claude-work`.

## Wrong or impossible in the brief

- Item 5 gave each judge `--restricted`; under it no `instructions` attachment loads, so C14 cannot hold. The judges ran without it under the ruling "Step 5's judges run without `--restricted`".
- Item 8's one-line answer from Axel at revision's closing `/writing` report did not happen: the answer's last sentence, given to every run, told the run not to stop, and the run took the autonomous writer pass, which `SKILL.md` Steps 13 offers.
- The done condition "the call is a win or a tie" for each comparison is not met for lit-review and revision; the ruling "A repair step of `paper` before the closing" puts the repair in step 5.A.
