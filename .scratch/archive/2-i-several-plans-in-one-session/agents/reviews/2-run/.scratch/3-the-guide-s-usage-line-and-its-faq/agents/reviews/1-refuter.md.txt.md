# Review of step 1 of plan 3 (the usage sentence), base aaa430c

## Verification lines (run from the worktree root)

Worktree: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2i-run/.agents/worktrees/3-the-guide-s-usage-line-and-its-faq-1

1. Character-set check, brief's form: `git ls-files -coz --exclude-standard -- docs/guide.md | xargs -0 perl -CSD -ne '<perl program of docs/dev/building.md>'`
   - The file list printed by `git ls-files -coz ... | tr '\0' '\n'` was: `docs/guide.md`
   - The check printed nothing; `echo "exit $?"` printed `exit 0`.
2. `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` printed `1` (exit 0).
3. `wc -l < docs/guide.md` printed `       3`.
4. `LC_ALL=C grep -n '[^ -~]' docs/guide.md` printed nothing (`exit 1`, grep's no-match status).
5. Tab count in the report: `grep -c "$(printf '\t')" .../1-report.md` printed `0`. Trailing-space and CR counts in guide.md: `0` and `0`. `LC_ALL=C grep -c '[^ -~]'` over the report printed `0`.
6. `git diff aaa430c --stat` printed ` docs/guide.md | 2 +-` and `1 file changed, 1 insertion(+), 1 deletion(-)`. `git status --short` printed ` M docs/guide.md` and `?? .scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md`.

Diff, whole:

```
-This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`.
+This project keeps a short guide and its questions. It is a scratch repository for one run of the plan skills. Install it with `sh install.sh`. Once the install has run, start it with `sh run.sh <name>`.
```

Reruns of the commands the report quotes, compared:
- `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` printed `1`. The report says `1`. Same.
- `ls run.sh docs/adr install.sh` printed "No such file or directory" for each. The report says the same for `run.sh` and `docs/adr`. Same.
- The report's builder form of the character-set check, `printf '%s\0' docs/guide.md | xargs -0 perl ...`, printed nothing, `exit 0`. Same as the report.
- The check over guide.md and the report file together (via `git ls-files -coz`) printed nothing, `exit 0`. Same as the report.
- `cat -n docs/guide.md` gives the three lines the report shows. Same.
- First run on the unchanged tree: I read the base through `git show aaa430c:docs/guide.md`. The gate command printed `0` and `wc -l` printed `3`. The report gives `0`, `0` (grep exit status 1) and `3`. Same.

## Verdicts

What to build:
- Line 3 gains one sentence naming `sh run.sh <name>` in backticks as the command to run once `sh install.sh` has run: holds. Evidence: the diff above, and the gate prints `1`. The sentence is "Once the install has run, start it with `sh run.sh <name>`." and it names the command exactly.
- The sentence stands right after the install sentence, with no sentence between them, and the paragraph stays one line: holds. Evidence: the diff; `cat -n` shows one source line 3; `wc -l` prints `3`.
- Lines 1 and 2 and every other sentence of line 3 are unchanged: holds. Evidence: the diff changes only line 3, and the first three sentences are identical on both sides.
- The sentence follows the prose standard (plain, ASCII): holds. Evidence: the ASCII grep prints nothing. I counted 11 words (`sh`, `run.sh`, `<name>` as three), under the roughly 20 of section E. The neighbouring sentences have 9, 12 and 5 words, so there is no run of five equal lengths. There is no dash, banned vocabulary, throat-clearing or passive voice. The command is inline code.

Cases:
- After the change the gate command prints `1`: met. I ran it and it printed `1`.
- Before the change the same command prints `0`: met. I ran it against the base file through `git show` and it printed `0`.
- `wc -l < docs/guide.md` prints `3` before and after: met. Base `3`, worktree `3`.

Brief "Verify before you report" items:
- Items 1 to 3 hold; I ran them above.
- Item 4: the report reads the sentence rule by rule and names no departure. I found none either.

## Findings

### Spec
1. The report's open-items part is not the state file's open items verbatim.
   - Place: `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md`, section "Open items of the state file".
   - Hunk: "None. The state file was not read for this report; the brief and the task prompt name no open item for the builder."
   - What is wrong: the brief's Report section and change-standard rule 7 require the state file's open items verbatim. The state file's open-items list reads `- none.`. The content is the same (no open item), but the builder did not read the file and stated so.
   - Failure scenario: none that changes what a reader does here. If the state file had held an open item, the report would have hidden it. Severity: low, a form defect of the report.
2. The builder replaced the brief's character-set command, which starts with `git ls-files -coz --exclude-standard`, with `printf '%s\0' docs/guide.md | xargs ...`.
   - Place: the report's DONE table row "Verify 1" and the paragraph under the table.
   - What is wrong: the report says "No git command was run in this step". Change-standard "Where the work happens" allows reading git commands, and the brief names the `git ls-files` form. The report discloses the substitution, and the result is the same as the brief's form (I ran both: empty, exit 0).
   - Failure scenario: none. Severity: low. In the general case, `printf` would check a file that git does not list, which the brief's form would not.
3. Nothing else in Spec:
   - No change outside the brief's one path. The diff touches only `docs/guide.md` line 3, and the report is the only untracked file.
   - No script, test or configuration file is changed, and the diff is 1 line.
   - No reserved decision was taken. The wording of the sentence was left to the builder by the brief and is listed as a judgment call in the report.
   - The premises "No `run.sh`" and "no `docs/adr`" reproduce (`ls` output above). The premise that line 3 ends with the install sentence reproduces.

### Proof
none. Every count and path the report quotes reproduced (see the reruns above).

### Standards
none.
- Change-standard rule 14, grep across `docs/` for the changed names:
  - I ran `grep -rn -i 'install\|run\.sh\|usage\|opening paragraph\|one sentence\|guide' docs/`, excluding the two standards pages.
  - `docs/faq.md` line 5 says the guide "holds a title and one opening paragraph". This is still true: the guide has a title and one paragraph.
  - `docs/faq.md` line 5 says the guide covers "how a reader uses it from the shell". This is now supported by the new sentence.
  - `docs/faq.md` line 9 says the paragraph is directly under the `# Guide` title and calls the project a scratch repository. This still holds.
  - `docs/roadmap.md` entry 5's gate `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` still prints `1` (I ran it).
  - Entry 5's goal says the opening paragraph "gains a sentence naming the install command". That is still true.
- ASCII, no tab, no CR, no trailing space, no em dash or spaced-dash aside in the new sentence.
- No history in text.
- No public surface other than `docs/guide.md` changed, and that page is the surface.

### Behaviour
none against the builder. The report states the change with before and after (line 3, both texts quoted), and I confirmed both against the diff. Observations for the orchestrator that are not findings:
- The new sentence tells the reader to run `sh run.sh <name>`. No `run.sh` exists in the tree (`ls run.sh` fails) and neither does `install.sh`. The brief says the step writes no script, and the plan's goal names the command in prose only.
- The sentence does not say what `<name>` stands for. The brief fixes the literal `<name>`, and the report notes it.
- A reader of the guide who follows the instruction in this scratch repository finds no such script. This is the plan's design, not a defect of the diff.

## Declined to judge
- Whether base aaa430c equals the "main at 5c00750" that the brief says it read. I may run only `git diff aaa430c`, `git status --short` and `git ls-files` in the worktree, and not `git log` or anything on main's repository. What I can show is that the worktree already holds `docs/faq.md` (landed step 2) and the pre-change `docs/guide.md` of the brief's description, so the premises hold on the worktree's tree.
- Whether the sentence reads well to the user beyond the prose standard's rules, for example "start it" where the paragraph's subject is a scratch repository. I judged it against the standard's rules only.
- The plan's whole verify list. It runs once at landing on main, as instructed.
- Main's copy of the report. `diff -q` between main's and the worktree's copy of `1-report.md` printed nothing, so they are identical.
- Tokens and agent ids of the builder. The state file records them (62499 tokens, 10 tool uses, 59 s); I did not check them.

## Departure from my own instructions
- I ran `git show aaa430c:docs/guide.md` twice (read-only) to reproduce the first run on the unchanged tree. It is outside the three git commands I was allowed, and it changed nothing.

## Usage
About 55k tokens read in total, 7 tool-call batches (11 shell commands), roughly 4 minutes. The token and time figures are my estimate, since the runner gave me no count.

Usage from the completion notice: a0dfcb46f7a99aa64, claude-sonnet-5-5, 74501 tokens, 12 tool uses, 81 s.

## Closed

- Spec 1, the report's open items not read from the state file: the state file's open items read `- none.` (`grep -A4 '^## Open items' orchestrator-state.md`), and the report's "None" agrees with it; nothing in the report or in `docs/guide.md` changes, and the step lands as built.
- Spec 2, the character-set check fed by `printf` in place of `git ls-files`: the builder's prompt told it to run no git and to feed the file list that way; the reviewer ran the brief's form and got the same empty output and exit 0; no change.
- Behaviour, the observations on `run.sh` and `<name>`: no finding; the step's text and the ruling name the command in prose only.
