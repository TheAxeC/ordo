# Step 5 refuter report (on main, executor inline, no worktree diff; base b8a5947e8eda16c220bc2862ba63600fc07f2104)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ find .scratch/5-paper/agents/reviews -path '*/5-*' -type f -print0 | xargs -0 perl -CSD -ne '<the brief's check 1>'; echo "perl exit=$?"
perl exit=0
$ git -C ~/.local/share/ordo-stable describe --tags
v8.4.0-rc.2
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE utils/pin.sh; echo "pin.sh exit=$?"
pinned: v8.4.0-rc.2, 16 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills
pinned: 5 agents linked in: /Users/axelfaes/.claude/agents, /Users/axelfaes/.claude-backup/agents, /Users/axelfaes/.claude-work/agents
pin.sh exit=0
$ git -C ../research-hub status --short -- projects/manuscripts/bttn-incident-af projects/manuscripts/raw-pls projects/archive/published/2026/dongho-ecg-clustering .agents/skills/academic-paper; echo "rh status exit=$?"
rh status exit=0
$ (C11, tool inputs) python3 -I one-liner over the 118 files of `find ~/.claude/projects/*gate5* -name '*.jsonl'`
118
tool calls 5812 naming research-hub 0
$ git status --short; echo "status exit=$?"
status exit=0
$ git diff b8a5947 -- .scratch/5-paper/plan.md .scratch/choices.md .scratch/5-paper/orchestrator-state.md | grep '^+' | perl -CSD -ne 'print if /[^\x20-\x7E\x{2705}\n]/'
(no output)
```

These are the commands the report quotes as evidence, and the reruns that check them:

```
$ cat .git/refs/tags/v8.4.0-rc.2; cat .git/worktrees/ordo-stable/HEAD      (file reads; git tag and git rev-list are outside the git I may run)
678a5a74694766e8d56046cf6e9bd783ed3de2df
678a5a74694766e8d56046cf6e9bd783ed3de2df
$ grep -n '^version' (sed -n 1,12p) ~/.local/share/ordo-stable/skills/paper/SKILL.md
  version: "2.1.0"
$ python3 -I scratchpad/tools/facts.py gate5 judge-lit-review-1 ... judge-full-4   (read-only)
SIDE lit-review-1: session 2437b798-...; init model claude-opus-5-5; Skill calls none; Agent calls 1; denied ['Monitor']; modelUsage ['claude-opus-5-5']; instruction files 8
SIDE lit-review-2: session 14b8f695-...; init model claude-opus-5-5; Skill calls none; Agent calls 10; denied ['Monitor', 'mcp__claude_ai_PubMed__search_articles']; modelUsage ['claude-haiku-5-5', 'claude-opus-5-5']; instruction files 8
SIDE revision-1: session 61d07524-...; Skill calls ['writing']; Agent calls 16; denied none; instruction files 8
SIDE full-1: session 92497cd0-...; Skill calls ['writing']; Agent calls 32; denied none; instruction files 8
SIDE full-2: session dcd45d24-...; Skill calls none; Agent calls 12; denied [two PubMed tools]; modelUsage haiku and opus; instruction files 8
JUDGE judge-<each of the 8>: init model claude-opus-5-5; tools ['Glob', 'Grep', 'Read']; skills []; modelUsage ['claude-opus-5-5']; denied none; instruction files 8; reads outside the copy none
(every session id equals the one the record gives)
$ own python3 -I scan of each judge transcript: file_path, path, pattern and glob of every tool call, realpath against the copy; instruction files of the session's attachment
judge-<each of the 8>: outside []; instr ['CLAUDE.md', 'invoke-the-skill.md', 'no-claim-without-a-command.md', 'no-breakage-testing.md', 'never-take-the-lazy-option.md', 'no-quick-answers.md', 'scripts-compute-facts.md', 'answers-reach-axel-in-full.md']
$ grep -c '"type":"instructions"' on the sessions of the two restricted judges (6c8a0f94-..., 5049bb72-...)
0
0
$ ls gate5/*.jsonl | wc -l
31
$ own python3 -I scan of all 31 stream transcripts and of every subagent transcript: served models
every init model claude-opus-5-5; subagents {'claude-opus-5-5': 8541, '<synthetic>': 2}
$ grep -o 'Base directory for this skill: ...' in each paper session transcript under ~/.claude/projects/*gate5-*
lit-review-1, revision-1, full-1, single-1 to single-5: /Users/axelfaes/.claude/skills/paper (and /Users/axelfaes/.claude/skills/writing where the closing review ran); readlink ~/.claude/skills/paper -> /Users/axelfaes/.local/share/ordo-stable/skills/paper
$ verdict lines of 5-blind-comparison/<comparison>/judgment-*.md
lit-review 1 "Verdict: A." (A = academic-paper); 2 "Verdict: B." (B = academic-paper)
revision 1 "Verdict: A." (A = academic-paper); 2 "Verdict: B, by a narrow margin." (B = academic-paper)
full 1 "Verdict: A." (A = paper); 2 "Verdict: B." (B = paper); 3 "Verdict: A, by a narrow margin." (A = paper); 4 "## Verdict: A" (A = academic-paper)
$ diff -rq of each judge copy's outputs/output-A and output-B against the ledger's output-A/B, swapped for judges 2 and 4
only the binaries differ (literature_review.pdf, the three full figures); key and ledger agree
$ the order commands in the main transcript, with their tool results
02:06 old is A (lit-review); 09:56 old is A (revision); 10:49 new is A (full); each run once
$ diff -rq of each judge copy's input (code/, notes/, manuscript/, admin/) against ref-full, ref-rev, ref-rev-code
full-1 to full-4 input same; rev-1 and rev-2 input same; RESULTS.md differs only at line 144, ", then draft the paper."
$ C6 pattern of the brief, grep -rn -i -E, over each judge copy
lit-review 366 lines, revision 579, full 574 (equal across the two or four copies of one comparison); distinct matches W<n>, F<n>, /paper, ordo, ars_link_resources_navbar
$ C3 commands in the main transcript (20:45:29, 23:38 and 23:40:23, 23:42, 00:49:39) and the first timestamps of the side sessions (20:45:46, 23:40:29, 00:49:49)
"C3 full-1 diff exit=0", "C3 full-2 diff exit=0", "C3 exit=0", "C3 code exit=0", "single-1 C3 exit=0" to "single-5 C3 exit=0", each before its side started
$ own python3 -I check of 5-lit-review-resolve.md against refs.bib of gate5/lit-review-1 and the three raw resolve outputs
bib keys 84 unique 84; blocks 84 keys covered 84 missing set() extra set(); status disagreements []; blocks differing from source []
$ grep -o '\[GAP[^]]*\]' gate5/full-2/paper/final/manuscript.tex | wc -l
50
$ URL lists and saved pages: grep -c '' lit-urls, rev-urls, full-urls, full-urls-dropped; ls outputs/pages | wc -l
65, 77, 170, 11; 66, 78, 171 (with index.md)
$ shasum -a 256 of the lit-review PDFs and the full figures; the same against ref-full/.../code/results/*.png
4f6a0dc1... (rebuilt), f603c8b3... (side's); figures 1ebe7f3e..., 9f4a958b..., e1147de2... equal to clin_eval.png, bttr_vs_bttn.png, beat_saliency.png of the input
$ single-mode counts: ops per patch json; grep -c GAP; per-file +/- of the ledger diffs; [GAP count of single-4; @-entries of single-1 refs.bib; wc -l of outline, arguments, review
01:47 04:2 07:29 09:2 11:8 12:42; 6; main.tex +639 -525, refs.bib +6 -4; disclosure +9 -10, abstract-only +25 -26, citation-check +3 -3; 16; 45; 413, 88, 993
$ permission_denials of every result message in single-1-turn2.jsonl and single-5-turn2.jsonl
single-1-turn2: [Monitor "forward-tracking cited-by results as each finishes"]; single-5-turn2: [Monitor "wait for the index re-lookups to finish", Monitor "FedAvg and CLOCS third askings finished"]
$ cat gate5/revision-1/.git/logs/HEAD
0000000 c973f16... commit (initial): input
c973f16 4f6ae499ec291e84cb5942755f3ec52bc30f00ee ... commit: code
$ sed -n 206p .scratch/5-paper/plan.md; grep -n "^- Step 5's judges run without" .scratch/5-paper/plan.md
- Step 5's stops answered by the orchestrator (2026-11-14): ...
207:- Step 5's judges run without `--restricted` (2026-11-15): ...
$ grep -n -E 'facts\.py|audit\.py|mk-rules|blind\.py|resolve_all|resolve_record|to_charset' .scratch/5-paper/plan.md .scratch/choices.md
(no output)
$ ls -la scratchpad/tools
audit.py blind.py facts.py mk-rules-full.py resolve_all.py resolve_record.py to_charset.py rules-full-p.json rules-full-q.json rules-lit.json rules-rev.json (and scratch text files)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The tag ref and the pinned worktree's HEAD are both 678a5a74694766e8d56046cf6e9bd783ed3de2df, `describe --tags` prints `v8.4.0-rc.2`, and `pin.sh` with no argument exits 0. The report's quotes of the two `pin.sh` outputs are incomplete (Proof 8).
- 2: holds. Every copy, side, run and judge is under `gate5/`, in neutral folder names, and there are 31 run transcripts there.
- 3: holds. The command forms in the main transcript match the brief, and every init model is claude-opus-5-5.
- 4: violated. Spec 1 (both `paper` comparison sides applied their `/writing` findings in the comparison) and Proof 5 (paths outside the copy not named).
- 5: violated. Spec 3: the blinding was done by the unapproved scripts `blind.py` and `mk-rules-full.py`. The blinding itself checks out: the judge copies equal the ledger outputs, and the key, the order and the RESULTS.md rewrite all hold.
- 6: violated. Spec 3: the resolves were run and graded by the unapproved scripts `resolve_all.py` and `resolve_record.py`. Their outputs reproduce: 81 of 84, with every block quoted verbatim. The three unresolved entries are stated truthfully as not done.
- 7: holds. Each of the four runs is on its own fresh copy (C3 lines), committed, with its output recorded.
- 8: violated. Spec 2: the user's one-line pick never happened, yet the report books item 8 as DONE.
- 9: violated. Spec 3 (the `to_charset.py` copies, and records whose evidence rests on scratchpad scripts) and Spec 4 (the record lacks the user's words and the judges' instruction files).
- 10: holds for research-hub: C11 is rerun clean. "Nothing pushed" and "no money spent" are under "Declined to judge".

Cases of the brief's "Cases":

- C1: met. The tag file holds 678a5a7's hash, the worktree HEAD equals it, `describe` prints `v8.4.0-rc.2`, and `pin.sh` exits 0.
- C2: met. Every init model is claude-opus-5-5 across the 31 stream transcripts, and every subagent is opus.
- C3: met. Each C3 diff printed exit=0 in the main transcript before its side's first timestamp. The revision `code/` check ran before the resume.
- C4: met. Each `paper` session loads `/Users/axelfaes/.claude/skills/paper`, which links into the pinned worktree at v8.4.0-rc.2, version 2.1.0. Skill calls name only `writing`, and the academic-paper inits list 0 skills.
- C5: partial. Two denied Monitor calls of single-5 and one of single-1 are recorded as none, or as no denial. Proof 1.
- C6: partial. No hit is a mark of a side, but the record's list does not cover every hit. Proof 2.
- C7: met. Two judgments per comparison with the order swapped, plus judges 3 and 4 for full, are read correctly through the key.
- C8: unmet, as the report states. Kolda_2009, Agueh_2011 and Bonneel_2016 do not resolve, and the rulings "The calls and the repair's scope" and the 5.A line take them.
- C9: partial. The record gives no reading of the comparison sides' intake questions, and their stops are not named as stops of the mode's list. Spec 5.
- C10: partial. No finding was accepted by the user in item 8. Spec 2.
- C11: met. 0 of 5812 tool inputs name research-hub, and its status prints nothing.
- C12: partial. The character-set check passes, but the record does not hold the user's calls in their words. Spec 4.
- C13: met. No judge tool input resolves outside its copy, checked by my own scan.
- C14: met. Each judge used lists CLAUDE.md and the seven rules files, the same eight as the sides. The two restricted judges have no instructions attachment and are not used.
- C15: unmet, as the report states. Lit-review and revision are losses, full is a tie.

The report states C8 and C15 truthfully, and their hand-over to 5.A rests on the rulings "The calls and the repair's scope", "The full call" and "A repair step of `paper` before the closing". Its first line, "Everything else in the brief is done", is not true. Item 8's pick is missing (Spec 2), item 4's ban on applying findings in the comparisons was broken (Spec 1), and the brief's ban on unapproved scripts was broken (Spec 3).

## 1. Spec

- Spec 1. `5-blind-comparison/revision/sides/paper/final-message.md:365-367`: "### The autonomous pass has already run / Under your standing instruction, the autonomous pass has already run on all 57 findings. Patch 15 has 53 operations". `5-blind-comparison/full/sides/paper/final-message.md:3`: "The run is finished, including the autonomous writer pass on the `/writing` findings", and `:178`: "Patch 26 applied findings 1 to 31 and 33 to 45". `full/sides/paper/paper-runs/full-2026-11-14/config.md:109`: "Steps 13 reply: the autonomous writer pass is taken".
  - What is wrong: the brief's item 4 says "the `/writing` findings are applied only in item 8". Decision 7 says "neither side gets a further pass the other did not". Both `paper` comparison sides applied their closing `/writing` findings inside the comparison, and the outputs were judged with those patches. `5-blind-comparison.md` never says so, and the report books item 4 as DONE.
  - Failure scenario: the user reads the record and the verdicts believing the judged `paper` outputs stop at the closing report, as in the setup step 3 used. Step 5.A's check reruns the comparisons "on the same input with the same answers", so the same extra pass recurs unannounced, and the user's next calls rest on an unequal setup they were never told of.
  - Verdict: item 4 violated.
- Spec 2. `5-report.md`, DONE / NOT DONE row 8: "| 8 The `/writing` findings | DONE | patch 12 answers findings 1 to 39 under the autonomous writer pass". `5-report.md`, "Wrong or impossible in the brief": "Item 8's one-line answer from Axel at revision's closing `/writing` report did not happen: the answer's last sentence, given to every run, told the run not to stop". `5-single-mode-runs.md:81`: "The pick of findings to apply was not given by Axel".
  - What is wrong: item 8, D40 and open item E require the user's one-line answer to the closing report. The answer that suppressed it is `gate5/single-5-answer1.txt`, whose last line is the "From here on, do not stop ..." sentence. The orchestrator chose to send it. The ruling "The same lines to every side" names sides, and the brief's item 4 applies the two lines to "both sides of the full and the lit-review comparisons". So the brief was not wrong or impossible here; the step did not do what it asked, and the report calls it DONE. The user was told the pick was "no longer open" (main transcript, 2026-11-15T11:07) but was given no option to rule on.
  - Failure scenario: a reader of the report's first line and row 8 takes D40's route (the user's pick applied by the draft writer) as checked by the gate. It was never run, so step 5.A and the closing go on with that route untested.
  - Verdict: item 8 violated, C10 partial.
- Spec 3. `5-blind-comparison.md:5`: "read with `tools/facts.py` and `tools/audit.py` in the scratchpad"; `:58`: "written by `tools/mk-rules-full.py`"; `5-lit-review-resolve.md:3`: "run from the ordo checkout by `resolve_all.py` in the session's scratchpad"; `5-report.md` row C13: "(`facts.py`)".
  - What is wrong: the brief, "Paths this step writes", says "No script is written for this step ... Any other script needs the user's approval of what it computes, quoted from a line of `plan.md`'s Rulings ... Each command of this step is typed whole". The scratchpad holds seven scripts the step wrote and ran: `audit.py`, `blind.py`, `facts.py`, `mk-rules-full.py`, `resolve_all.py`, `resolve_record.py` and `to_charset.py`. The grep for them over `plan.md` and `choices.md` prints nothing, so no ruling approves them. They did the blinding, the resolve and its grading, the ledger copies' character conversion, and C13's check. I reproduced their results with my own read-only one-liners, so no result changes, but the step broke the brief's rule. The records also cite scripts that live only in a temporary folder.
  - Failure scenario: the user has twice ruled that an unapproved script's output is not used (open items AE and AU). Under the record as it stands they cannot see that the blinding and the resolve grading went through such scripts, and a later reader cannot rerun the cited evidence once the scratchpad is cleared.
  - Verdict: items 5, 6 and 9 violated.
- Spec 4. `5-blind-comparison.md:87-89`: "Lit-review: a loss (2026-11-15), as recommended", "Revision: a loss (2026-11-15), as recommended", "Full: a tie (2026-11-15), as recommended". `:29`: "8 instruction files".
  - What is wrong: C12 asks for the user's call "in his words". The record gives neither "Open item 1: Agreed" (2026-11-15T11:11) nor "(a)" (12:00); only the report quotes them. `docs/dev/blind-comparison.md` item 9 asks for "the global instruction files it loaded", and the record gives only a count for each judge. The files are the global CLAUDE.md and the seven rules files, per my scan.
  - Failure scenario: a reader of the comparison record alone, such as a later plan or the closing report, cannot see what the user said or which instruction files each judge had. They would have to trust the orchestrator's paraphrase "as recommended".
  - Verdict: item 9 violated, C12 partial.
- Spec 5. `5-blind-comparison.md:16`: "Each side ended its first turn at its intake questions. Each was answered once ... No side stopped a second time." `5-report.md` row C9: "met | ... each later stop, taken under the answer's last sentence, is named with the stop of the mode's list it is".
  - What is wrong: C9 asks that each stop of each `paper` side be named in the record as the stop of its mode's list it is. It also asks that each question be read for whether its recommendation follows from the run's goal, covering the turns before the two lines. For the three comparison sides the record does neither. Their intake questions hold recommended defaults: lit-review-1 Q3, Q4, Q6 and Q7; revision-1 Q5 "Recommendation: yes ... [no]" and Q8 "Recommendation: yes ... [no]". The later stops each side took under the instruction (sources' review, outline's approval, citation style, structural patches, claims, the draft review not passing) are only in the sides' `config.md` copies. The report's C9 sentence holds for `5-single-mode-runs.md` alone.
  - Failure scenario: the gate clause "asks nothing whose recommendation follows from the run's goal" is booked as met for the three comparison sides with no reading on record. The user would accept a clause no one read.
  - Verdict: C9 partial.

## 2. Proof

- Proof 1. `5-single-mode-runs.md:21`: "In single-1 one Monitor call was refused by the runner's command check ... It is no permission denial and no `result` message lists it." The table rows single-1 and single-5 read "| none |" under Denied calls.
  - What is wrong: the `permission_denials` of a `result` message in `single-1-turn2.jsonl` lists that Monitor call (tool_use_id toolu_01W8Tw5kUrfy1bmF9wEUZge1). Those of `single-5-turn2.jsonl` list two Monitor calls (toolu_01Kywf6SKQckc5m8SxZrYmXy, toolu_01FmFuNNdYan6DpZyZ1ngLTB). The record's own line 11 says the column comes from "the permission_denials of each `result` message". The report's C5 row says "each denied call is named in the records".
  - Failure scenario: a reader checking C5 against the record takes single-5's run as free of denials. They would miss two waits the runner refused during the `/writing` revision run whose output the user adopted.
  - Verdict: C5 partial.
- Proof 2. `5-blind-comparison.md`, "The C6 hits that are no mark".
  - What is wrong: the list does not cover every hit of the brief's C6 grep. The uncovered hits are:
    - "ordo" inside "Gordon" in saved pages of lit-review (`outputs/pages/page-051.html`, `page-058.html`) and revision (`page-009.html`);
    - "ordo" inside a base64 run in revision's `page-077.html`;
    - "ars_" in "events__webinars_link_resources_navbar" (revision `page-056.html` to `page-062.html`);
    - "w170" in the DOI `10.13026/8a4q-w170` (full `page-023.html`, `page-099.html`);
    - "w72", "w120", "w144", "w153" and "w316" in Springer image URLs (full `page-005.html`, `page-006.html`, `page-052.html`, `page-078.html`, `page-079.html`).
    The record names "ordo" only inside `tensordot` of the full input's code. None of these hits is a mark. The report's C6 row says each hit is named.
  - Failure scenario: a reader who reruns C6 to land the step finds unnamed hits. They cannot tell from the record whether these were judged or missed.
  - Verdict: C6 partial.
- Proof 3. `5-blind-comparison.md:57`: "Its run ran `python3` twice against the answer's "do not run anything" (one start with empty input, one `python3 -I` one-liner counting columns), both named in its own `config.md`".
  - What is wrong: `gate5/full-2-turn2.jsonl` holds seven `python3` runs after the answer: two scripts rewriting `paper_configuration_record.md`, three CSV row counts over `cohort_icd_*.csv`, one arithmetic print, one Markdown transform of `argument_blueprint.md`, and the empty start. `full-2-turn1.jsonl` holds two more CSV one-liners. The count comes from the side's own `config.md`, not from its transcript.
  - The decision that rests on it: the user's assessment, for the full call and for step 5.A's rerun, of how far the academic-paper side kept the "Do not run anything" instruction.
  - Failure scenario: the user, reading "twice", judges the academic-paper side nearly compliant. The transcript shows nine runs.
- Proof 4. `5-blind-comparison.md:37`: "`code/` from 4f6ae49, which each side received after its first turn".
  - What is wrong: 4f6ae49 is the copy's own second commit, "code" (`gate5/revision-1/.git/logs/HEAD`). The code was archived from research-hub f8c5e7176 (main transcript, 2026-11-14T23:42, `git -C .../research-hub archive f8c5e7176 $P/code`), as the brief and the ruling "The revision comparison's first stops" require.
  - Failure scenario: a reader checking the input's provenance looks for research-hub commit 4f6ae49. It does not exist, and the reader is led to doubt C3 for revision.
- Proof 5. `5-blind-comparison.md:23`: lit-review academic-paper side, "It downloaded the Harshman 1970 working paper (... into a temporary folder)". `:22`: lit-review `paper` side, "Outside its copy it read the skill's files and used temporary folders".
  - What is wrong: item 4 requires the record to name each tool call that names a path outside the copy. Unnamed calls of `lit-review-2`:
    - Writes of `/tmp/claude-502/fmt/md2tex.py` and `/tmp/claude-502/fmt/tex2plain.py`;
    - Writes of `/var/folders/.../T/bibcheck_scripts/verify_ids.py` and six `merge_build/*.md` files;
    - redirects to `/tmp/claude-502/bibkeys.txt`, `/tmp/bk.txt`, `/tmp/k_bib.txt` and other `/tmp` files.
    `lit-review-1`'s two Reads of its own session folder under `~/.claude/projects/` are not named either. Step 3's record named each such file.
  - Failure scenario: the user, checking what the sides left on the host outside the scratchpad, finds files under `/tmp/claude-502/fmt/` that the record does not account for.
  - Verdict: item 4 violated, together with Spec 1.
- Proof 6. `.scratch/choices.md`, C109: "Booked: `.scratch/5-paper/plan.md:206` ("Step 5's judges run without `--restricted`")".
  - What is wrong: line 206 is "Step 5's stops answered by the orchestrator". The judge ruling is at line 207.
  - Failure scenario: the user reviewing C109 under self-rule opens line 206 and reads the wrong ruling.
- Proof 7. `5-single-mode-runs.md:76`: "`main.tex` 645 insertions and 529 deletions, `refs.bib` 10 lines".
  - What is wrong: the ledger's `writing-revision/manuscript.diff` gives `main.tex` +639 -525 and `refs.bib` +6 -4. 645 and 529 are the totals over both files.
  - The decision that rests on it: the reading the user adopted as their own under "The reading of the single-mode outputs".
  - Failure scenario: a reader comparing the adopted reading with the diff finds the per-file numbers wrong.
- Proof 8. `5-report.md`, DONE / NOT DONE row 1: "`utils/pin.sh v8.4.0-rc.2` printed "pinned: v8.4.0-rc.2 (678a5a7), 16 skills linked in: ..."", and "`utils/pin.sh` with no argument exits 0".
  - What is wrong: item 1 asks the report to quote both outputs. The run with the argument is quoted with its paths cut to "...". The run with no argument is quoted only by its exit status, since the verify block sends its output to `/dev/null`. The main transcript does hold both full lines.
  - Failure scenario: a reader cannot see from the report which skill folders the pin linked.
- Proof 9. `5-report.md` row C8: "a direct Crossref lookup of each DOI matches the entry".
  - What is wrong: for Bonneel_2016, Crossref's title lacks the entry's subtitle. `5-lit-review-resolve.md` says so ("The entry's title adds the subtitle ...").
  - Failure scenario: a reader of the report alone takes Bonneel_2016's entry as matching Crossref exactly. It does not, and that mismatch is part of the cause 5.A must end.

## 3. Standards

- Standards 1. `5-report.md`, whole.
  - What is wrong: `docs/dev/change-standard.md`, "The rules" 7, asks for "every file changed with its line count". The report has no such list for the 647 files of the diff, or for its grouping by record and outputs folder.
  - Failure scenario: the lander cannot check that the commit's paths are only the step's without rerunning `git diff --stat`.
- Standards 2. `.scratch/5-paper/plan.md:207`: "- Step 5's judges run without `--restricted` (2026-11-15): ... (self-rule)."
  - What is wrong: `plan-orchestration` `references/self-rule.md`, "Closing an open item", items 3 and 4, require two things for an item closed under self-rule. The Rulings bullet must read "- Open item <L> (<date>): ... (self-rule)." The Closed items must get "- <date>: Open item <L>, <what was raised>: closed under self-rule, C<n>." The bullet has no open-item letter, and the state file's Closed items has no line for C109.
  - Failure scenario: a reviewer of the choices file under self-rule cannot find C109's open item in the state file's log. The `C<n> Agree` review route would not find the item.

Records otherwise pass: ASCII, one line per bullet, no em dash or dash stand-in, plain prose, the user referred to as "the user" or with "their".

## 4. Behaviour

- Behaviour 1. `.scratch/5-paper/orchestrator-state.md`, "Current position": "- Step 5, the sixth of 7 steps, the gate's comparisons, prepared (brief `agents/briefs/5.md`, base b8a5947); ... It runs inline: the orchestrator runs the sides, the runs and the judges, and Axel answers their stops." Also "Closed items", which has no line dated 2026-11-15.
  - What is wrong: the diff since the base changes this file only at preparation. The position was not rewritten for the runs ending, for step 5.A being added, or for the hand-over of C8 and C15. The open items step 5 raised are in neither Open items nor Closed items: the three calls, the unresolved entries, the full prompt's error and the readings, ruled as "Open item 1: Agreed", "Open item 2: (b)", "(a)" and "(b)". The section is headed "rewritten before every step commit".
  - Failure scenario: a new orchestrator resuming from the state file alone, as `plan-orchestration` "Resuming, and handing the plan over" expects, reads step 5 as prepared and not run. It could start the sides again, and it would not know that 5.A exists or that step 5 lands with C8 and C15 handed over.

## Declined to judge

- The commits the report names (517f0ea, 432ecb5, 73f3a5b), the launch commit 6016155 of "The cases' first run", and 9d037d7 of the 5.A line. Settling them needs `git log --oneline b8a5947..HEAD`, which is outside the git this brief allows.
- That nothing was pushed. Settling it needs `git ls-remote --tags origin v8.4.0-rc.2`, a network git command not allowed here.
- That `~/.local/share/ordo-stable` is unmodified beyond the pin. Settling it needs `git -C ~/.local/share/ordo-stable status --short`, not allowed here.
- That no money was spent on an API. No command available here settles it. The academic-paper sides' `modelUsage` lists claude-haiku-5-5, while every subagent transcript shows opus. The haiku use is not explained in the record, and it is not shown to be a model stop.
- That each output was copied into the ledger "as soon as its side or run ends". The ledger copies match the judge copies, but their timing would need the commit times.
- Whether every URL each output cites is in its pages folder. I checked the counts (65, 77, 170) and found no missing citation by a rough scan, apart from regex artifacts and IEEEtran template URLs. A full check needs the orchestrator's URL extraction rules.
- Whether the orchestrator's answers to the sides were right in content: for example revision-1's Q8 "No" against the run's recommendation, and the full research question and venue it wrote. The ruling "Step 5's stops answered by the orchestrator" makes them the orchestrator's, and whether they were right is the user's call.
- Whether leaving the full `paper` side's `compile-review6` to `compile-review8` out of the judges' copies was right. It is listed as a judgment call. Whether it changed the full verdicts is the user's call.
- The quality of the outputs, the judgments and the calls. The calls are the user's, and the user adopted the single-mode readings under "The reading of the single-mode outputs".
- Whether step 5 may land with C8 and C15 unmet under the rulings that hand them to 5.A. That is for `/land` and the user.

Reviewer usage: ae35f1410f792b5fa, claude-opus-5-5, 283470 tokens, 93 tool uses, 20.9 minutes.

## Closed

Step 5 runs inline, so each finding is fixed in the step's records by the orchestrator or raised to Axel as an open item in the state file.

- Spec 1: raised as open item BD; the record now states the pass (`5-blind-comparison.md`, "The stops of the `paper` sides (C9)").
- Spec 2: raised as open item BE; the report books item 8 as NOT DONE.
- Spec 3: raised as open item BF; the record and the report name the scripts and say their outputs wait on the ruling.
- Spec 4: fixed; "Axel's calls" gives Axel's words, and "Commands" names the eight instruction files.
- Spec 5: fixed; `5-blind-comparison.md` "The stops of the `paper` sides (C9)" reads each side's intake questions and names each later stop with the stop of its mode's list it is.
- Proof 1: fixed; the single-mode table and its note give the three denied Monitor calls.
- Proof 2: fixed; "The C6 hits that are no mark" names the hits inside the saved pages.
- Proof 3: fixed; the full academic-paper side's `python3` runs are counted from its transcripts, 10 in all.
- Proof 4: fixed; `code/` is named as research-hub f8c5e7176, committed in the copy as 4f6ae49.
- Proof 5: fixed; `5-blind-comparison/outside-paths.md` lists each comparison side's tool calls naming a path outside its copy.
- Proof 6: fixed; C109 books `plan.md:207`, and the choices file's last number reads C109.
- Proof 7: fixed; the per-file counts are 639 and 525 for `main.tex`, 6 and 4 for `refs.bib`.
- Proof 8: fixed; the report quotes both pin outputs whole.
- Proof 9: fixed; the report's C8 row names Bonneel_2016's subtitle.
- Standards 1: fixed; the report ends with every file changed and its line counts.
- Standards 2: fixed; the ruling reads "Open item BC (2026-11-15): step 5's judges run without `--restricted`", and the Closed items log BC as closed under self-rule, C109.
- Behaviour 1: fixed; the state file's position names step 5's end state, step 5.A and open items BD to BF, and the Closed items log the rulings of 2026-11-15.
