## Verification lines (run from the worktree root)

1. Character-set check (brief's command, over docs/guide.md and the report):
```
exit 0
```
(it printed no other line)
2. `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` printed `1`
3. `wc -l < docs/guide.md` printed `3` (padded as `       3`)
4. Prose reading, my own: the added text is `Once the install has run, the command `sh run.sh <name>` runs the project.` (13 words by `wc -w`). `LC_ALL=C grep -n '[^ -~]' docs/guide.md` printed nothing (exit 1). `grep -n -E ' - | -- |;|->|<em dash>|<en dash>' docs/guide.md` printed nothing. There is no filler word from section A, no passive voice, no bold, no sentence over 20 words. The wording is covered under Standards below.

Other commands I ran:
- `git diff --numstat b7d8bd2` printed `1    1    docs/guide.md`.
- `git diff b7d8bd2 --name-only` printed `docs/guide.md`.
- `git status --short` printed ` M docs/guide.md` and `?? .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md`.
- `ls docs/adr` printed `ls: docs/adr: No such file or directory`.
- `ls run.sh` printed `ls: run.sh: No such file or directory`.
- On the base, `git show b7d8bd2:docs/guide.md | sed -n 3p | grep -c '<the step check>'` printed `0` and `git show b7d8bd2:docs/guide.md | wc -l` printed `3`.
- `sed -n 3p docs/guide.md | grep -c -F 'The command `sh install.sh` installs the project. '` printed `1`.
- `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` printed `1`.
- `git diff --stat` printed ` docs/guide.md | 2 +-` and ` 1 file changed, 1 insertion(+), 1 deletion(-)`.

Reproduced from the builder's report: every quoted command printed what the report claims. No unreproduced claim.

Size line: a small text step holds. The diff changes no script, test or configuration file, and it changes 1 line added and 1 deleted (2 changed lines, under 20).

The diff, in full:
```
-This project is a small scratch repository ... The command `sh install.sh` installs the project.
+This project is a small scratch repository ... The command `sh install.sh` installs the project. Once the install has run, the command `sh run.sh <name>` runs the project.
```

## Item verdicts ("What to build")

1. Opening paragraph, line 3, gains right after the install sentence a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run; the step check prints 1. Holds. Evidence: line 3 as shown above; verification line 2 printed `1`.
2. One sentence appended at the end of line 3 after a single space; paragraph stays one line; lines 1 and 2 and the earlier sentences of line 3 unchanged; no other file changes. Holds. Evidence: the diff shows only line 3 changed, with the old text as an unchanged prefix of the new line. `--numstat` shows `1 1 docs/guide.md`. `wc -l` prints 3. The only other path in `git status --short` is the report the brief names.
3. The command is written in backticks as `` `sh run.sh <name>` `` with `<name>` as is. Holds. Evidence: the diff hunk.
4. The sentence says the command is run after the install, does not repeat `sh install.sh`, and holds no full stop before `sh run.sh <name>`. Holds. Evidence: "Once the install has run, the command ..." has no full stop before `sh run.sh`; `grep -c 'sh install\.sh'` on line 3 printed `1`, the install sentence's own occurrence.
5. Plain prose under prose-standard: ASCII only, no dash aside, no section A filler word. Holds. Evidence: the ASCII check, the dash grep and the filler-word reading above. The wording point is under Standards.

## Case verdicts ("Cases")

1. Step check prints 1 after the change and 0 on the unchanged tree. Met. After: `1`. Base: `0` (`git show b7d8bd2:docs/guide.md | sed -n 3p | grep -c ...`).
2. The install sentence is unchanged and the grep with the trailing space prints 1. Met. After: `1`. The report's first run printed `0` on the unchanged tree because no space follows the sentence there; that is the expected result, and the brief itself says 1 only after the change.
3. The paragraph stays one line and `wc -l` prints 3. Met. After: `3`. Base: `3`.
4. The new sentence, read in place, says `sh run.sh <name>` is run once the install has run. Met. Evidence: "Once the install has run, the command `sh run.sh <name>` runs the project."

The report gives a first run of every case on the unchanged tree, with a result for each. The one text case is noted as read on the unchanged tree.

## Spec

None.
- A premise of "What is on the tree" is not reproduced differently by my commands: the guide is 3 lines, the check prints 0 on the base, `run.sh` is absent, `docs/adr` is absent, `docs/faq.md` line 5 is as stated.
- The brief says "read on main at c59dbea" and the base is b7d8bd2, whose parent is c59dbea. The Prepare commit adds the brief only, so the premises hold.

## Proof

None.

## Standards

None found. One point the reviewer reports for the orchestrator's judgment, not as a finding:
- `docs/guide.md` line 3. Hunk: `The command `sh install.sh` installs the project. Once the install has run, the command `sh run.sh <name>` runs the project.` The two sentences share the shape "the command X <verb>s the project". The prose standard's rule "No repeated construction" speaks of a shape that recurs across entries or sections, and this is two sentences in one paragraph that the brief dictates. The report names the parallel and says why it stays, and its heading sentence "It departs from none of them" sits beside that admission. Failure scenario: none that misleads a reader; I found nothing the text leads a reader to do wrong.
- No non-ASCII in the diff. No sentence in a document is made false: `docs/faq.md` line 5 ("the guide says how to install the project and how to run it") stays true. A grep for the whole words `run`, `runs`, `install` and `installs` across `docs` outside `docs/dev` found only guide.md, the roadmap entries (5 and 3, unchanged and consistent) and faq.md line 5. Entry 5's gate (`grep -c 'sh install\.sh'` on line 3 prints 1) still prints 1.

## Behaviour

None. The report states the before and after of line 3. The guide now names `sh run.sh <name>` while no `run.sh` exists on the tree. The brief and the plan decide this, the report states it, and the step writes no script.

## Declined to judge

- Whether `<name>` should be explained in the guide. The brief dictates `<name>` as is and the step check requires it literally; this is the orchestrator's or the user's call. A reader who types the command literally gets a failure, since the script does not exist.
- The wording quality of "Once the install has run, the command ... runs the project": it is a reading judgment; I found no rule it breaks, and have no evidence beyond my reading.
- The plan's whole verify list on main: it runs once at landing, not before; I ran only the character-set check over the changed files.

Usage: a8a41fe99a8b7fb42, claude-sonnet-5-5, 68370 tokens, 9 tool uses, 50 s

## Closed

- Fix at landing: the em dash and en dash characters in the quoted `grep -n -E` pattern above are written as `<em dash>` and `<en dash>`, so the record holds to the character set the verify list checks.

- No finding under the four headings.
- The point on the two sentences that share the shape "the command X runs or installs the project": no change. The prose standard's rule on repeated construction speaks of a shape that recurs across entries or sections; two sentences of one paragraph that name two commands are not that, and the parallel tells the reader the two commands belong together.
