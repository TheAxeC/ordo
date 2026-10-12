# Step 2 brief check (on main at 918a85e)

This report is from the fresh agent run under the `spec` skill's "Steps / The brief check". It checks `.scratch/2-h-session-retro/agents/briefs/2.md` (uncommitted, 17960 bytes) against `plan.md` in the working copy, which has the ruling "Step 2, the skill's shape" added but not yet committed (`git diff --stat` shows 2 insertions and 1 deletion). I changed no file. The reader's output was written under `$TMPDIR/bc2h` and then removed (`ls` afterwards: "No such file or directory"). Only counts are quoted below.

## 1. Names

- `skills/session-retro/SKILL.md` and `templates/sessions.md`: `git grep -n 'skills/session-retro' -- . ':!.scratch'` finds only `docs/dev/building.md:11` and `docs/dev/change-standard.md:72`, the reader's test line. The change makes neither one false.
- `session-retro`: the only hits outside the paths are `docs/roadmap.md:42` and `:45` (the entry and its Goal). Neither is made false.
- "sessions report" and `sessions-<`: `git grep -n -i 'sessions report\|sessions-<' -- . ':!.scratch'` finds no hit.
- The new file at `<ledger_root>/retros/sessions-<YYYY-MM-DD>.md`: `git grep -n 'retros/' -- skills docs README.md utils .agents` finds:
  - `skills/plan-retro/SKILL.md:31`: "3. The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list." Once `sessions-2026-..md` exists, it is the newest file by name ("s" sorts after "2") and also by modification time. `plan-retro`'s Steps 1 then refuses ("has no `## Reports read` heading"), so every later `/plan-retro` stops. This change makes that line false. `plan-retro`'s `SKILL.md` is not in "Paths this step writes".
  - `docs/glossary.md:83` and `skills/repo-setup/templates/plan-terms.md:78` (**retro**, "the report `/plan-retro` writes at `<ledger_root>/retros/<YYYY-MM-DD>.md`") are still true.
  - `docs/roadmap.md:220` is history and is not affected.

Findings:

1. `skills/plan-retro/SKILL.md` "What it reads" 3 ("The newest file under `<ledger_root>/retros/`") becomes wrong as soon as the first sessions report is written. After that, `/plan-retro` refuses on every run. Steps 1 and Stops row 3 of that file inherit the defect. The fix is to have `plan-retro` read the newest `<YYYY-MM-DD>.md` retro, or the newest file that is not `sessions-*`. That puts `skills/plan-retro/SKILL.md` into "Paths this step writes". No step in flight writes that file: 2.F step 2's list and 2.G step 2's list both leave it out, checked with `sed -n '/^## Paths this step writes/,/^## /p'` on both briefs. D2 (a) ruled the report path, so this fix stays inside the rulings.

## 2. The step line

The step line is plan.md line 28 (`grep -n '^- 2 The'`). The brief quotes it character for character apart from the leading "2 " (checked with a difflib comparison).

- "the window from a plan's ledger (its opening and closing commits) or from a session id": item 1, Steps 1, extended by ruling (1) and (2).
- "the reader of step 1": item 1, Steps 3 and the reference section "The reader".
- "points of two kinds, each quoting its place by id, line and timestamp": item 1, Steps 5 and 6.
- "each wrong point with the change it proposes to a named rule, skill or brief, as a sentence to add or change": item 1, Steps 7. The step line and the Goal say "a brief". Steps 7 says "the brief template". A brief (glossary: `agents/briefs/<step>.md`) of a step not yet landed is not covered.
- "the report at `<ledger_root>/retros/sessions-<YYYY-MM-DD>.md`": item 1, Steps 8, and item 2.
- "Axel's ruling written beside each proposal": item 1, Steps 10 and 11, and item 2's `- Ruling:`.
- "check: the skill read by Axel against `docs/dev/skill-layout.md` and the goal": this is the orchestrator's check, not an item to build. The brief does not say the check is pending Axel's reading. Under the ruling "Overnight work" the step lands unticked with that reading pending. That is not an item, so there is no finding here.

Findings:

2. "a named rule, skill or brief" became "the rule, the skill or the brief template" in item 1, Steps 7, with no ruling behind the narrowing. Either say "a brief template, or the brief of a step not yet landed", or state that a brief is proposed against through its template (the `spec` skill's `templates/brief.md`).

## 3. Premises

- Step line command `sed -n 20p .scratch/2-h-session-retro/plan.md`: it now prints an empty line. `grep -n '^- 2 The'` puts the step line at line 28, both in the working copy and in `git show HEAD:`. **Differs.**
- Reader docstring "lines 1 to 96": `grep -n '^"""'` prints `1:` and `95:`, so the docstring is lines 1 to 95. It differs by one line and nothing rests on it.
- The reader's interface (both invocation forms, the `<id> <line> <timestamp> <kind>:` prefix, the kinds `user`, `text` and `tool <name>`, the two-space continuation, `<REDACTED>`, `skipped <n> lines of <file>` on stderr, exit 2 for usage errors and exit 1 for an unreadable file): `sed -n 1,95p` matches. The docstring also says exit 1 means "the output lacks it" (partial output). The brief leaves that out (see finding 10).
- `ls skills/session-retro` prints `templates`. Matches.
- `CLAUDE_CONFIG_DIR`: `echo "CCD=${CLAUDE_CONFIG_DIR-unset}"` printed `CCD=unset`. Matches.
- Folder naming rule: `re.sub(r"[^A-Za-z0-9-]", "-", path)` on the three paths gives the three names, and each exists under `~/.claude/projects` (`os.path.isdir` True for all three). Matches. `ls ~/.claude/projects | wc -l` gives 19 folders. The worktree folders are `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7` (5 `.jsonl` files) and `...-2b-7a` (2 files).
- 2.C commits:
  - `git log --diff-filter=A --format='%h %cI' -- .scratch/2-c-.../plan.md` printed `ab2cb50 2026-09-28T22:51:46+02:00`. Matches.
  - `git log -1 --format='%h %cI' -- <both paths>` printed `75c987f 2026-09-29T12:04:41+02:00`. Matches.
  - The same `--diff-filter=A` on the archive path prints `d016bf6 2026-09-29T11:55:34+02:00`, the archiving move. The skill must therefore take the add under `<ledger_root>/<slug>/`, as Steps 1 says.
- Reader run over `-Users-axelfaes-workspace-ordo` from 22:51:00+02:00 to 12:05:00+02:00: rc=0, `wc -l -c` gives `3808 744064`, stderr is empty, 458 lines start with the main session id, 1415 are `tool` items, and 1666 are items in all. Matches. Time: about 2 s (whole-second clock), where the brief says 4.7 s. Nothing rests on the time. The case's exact window (22:51:46 to 12:04:42) prints `3738 730556`.
- `.agents/plan.yaml` keys (`grep -n`): `ledger_root: .scratch`, `archive_root: .scratch/archive`, `worktree_root: .agents/worktrees`. Matches.
- `.scratch/retros/`: `ls` prints `2026-09-26` (a folder of helper scripts) and `2026-09-26.md`. Matches.
- `docs/glossary.md:83` **retro**: matches.
- `ls docs/adr`: `README.md template.md`. Matches.
- `/ordo-help` and `/diagnose` exist (`ls skills` lists both). Matches the "Use instead" item.
- Verify count: the state file's `verify:` list has 10 entries. Matches "checks: 10 commands passed".

Findings:

3. The premise command `sed -n 20p` prints a blank line. The step line is at `sed -n 28p` (`grep -n '^- 2 The' .scratch/2-h-session-retro/plan.md` prints `28:`).
4. The docstring is lines 1 to 95, not 1 to 96. The brief's "Read" item 1 carries the same range.

## 4. Cases and checks

- Case "sections in order, no other `##` heading than 'The reader', `name`, `metadata.version`, description of at most 1,024 characters naming no neighbouring skill, `Triggers on:` with a phrase for each invocation": this follows skill-layout "Frontmatter" and "Sections, in order". It leaves out the rule "A phrase for a case a neighbouring skill is for goes in that skill's `Triggers on:`". `plan-retro`'s triggers already hold `retro` and `run a retro`, so a trigger phrase such as "retro of the session" takes a request away from plan-retro unless the case forbids it.
- Case "each item of What to build 1 is in the skill": consistent, but see finding 6.
- Case "the window of Steps 1 for 2.C": consistent. Its output goes under `$TMPDIR` and is removed.
- Case "the folder rule lists ... and nothing else": consistent.
- Case "`session 6266a558...` finds `-Users-axelfaes-workspace-ordo` (`ls` of the file)": consistent.
- Case "report name `sessions-2026-09-30.md`": consistent.
- Case "`templates/sessions.md` has every part, with a worked example in the report": consistent with the change standard's rule 21 as long as the quotes are the reader's redacted lines. See finding 8 on non-ASCII.
- Case "the skill read against 'Where a rule goes', 'Lists and tables', 'Writing for an agent' ... every glossary term in its glossary sense, the word 'retro' used only for `/plan-retro`'s report": two parts fail against the brief's own items (findings 5 and 6), and one part cannot be met as written (finding 7).
- Case "`LC_ALL=C grep -n '[^ -~]'` over both files": consistent.

Findings:

5. The glossary sense of terms. Item 1 makes the skill use terms of `docs/glossary.md` in senses the glossary does not define, while Decision 3 says "the skill uses no term of `docs/glossary.md` in another sense":
   - **kind** (glossary line 50: "a sentence that states a defect in general terms ... under which `/plan-retro` groups findings"). Item 1 Steps 5 says "Assign each point its kind: keep ... change". The reader's docstring also calls `user`, `text` and `tool <name>` "kinds", so the skill would use "kind" in two senses of its own.
   - **ruling** (line 90: "the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session"). A proposal's approved/corrected/declined is not an open item of a state file, and `plan-retro` calls the same act a "decision".
   - **session, the** (line 94: the session that runs a skill). The skill also uses "session" for a transcript's Claude Code session, as in "the sessions of a plan", "one session with its subagents" and "a behaviour of the session", and Steps 3 uses "the session's scratch folder" in the glossary sense.

   Decision 3's term list (sessions report, point, keep and change, place) leaves out window, proposal, "kind" (or its replacement), the new sense of ruling, and session in the transcript sense. The fix is to name the replacement word for "kind" in item 1 Steps 5 (for example "each point is a keep point or a change point") and to add the missing terms to Decision 3's list for step 3.
6. "A rule is written once." The brief asks for Rules bullets that repeat what item 1 already places elsewhere:
   - "every place is one the reader printed" repeats Steps 6 ("exactly as the reader printed it").
   - "the skill reads a transcript only through the reader" repeats the Anti-pattern "a quote taken from a `.jsonl` file".
   - "the counts in the report come from the reader's output" repeats Steps 3.
   - "it writes only the sessions report" repeats the Anti-pattern "an edit to a rule, skill or brief the report names".

   The case "each rule written once" then fails for the builder whichever way it writes the skill. The brief should say, for each of these, which one place holds it. The Rules bullet "it writes only the sessions report" is also false against Steps 3 (the reader's output file) and Steps 4 (the draft report).
7. The case "the word 'retro' used only for `/plan-retro`'s report" cannot hold as written. The skill's own `name`, its invocations `/session-retro ...` and its Use instead line for `/plan-retro` all contain the word. The case needs to exempt the skill's name and the name `plan-retro`, and should read "the noun 'retro' is used only for `/plan-retro`'s report".

## 5. The question

The goal here is the part of the plan's Goal that step 2 delivers: the skill text that, when run, reads the transcripts, reports keep and change points with quoted places and proposals, and takes the user's ruling on each.

- Case "sections in order, frontmatter": could pass without the goal. It checks structure only, and the next case and Axel's reading carry the content.
- Case "each item of What to build 1 is in the skill": no, as long as items 1 and 2 are correct. The findings below show places where a skill written exactly to the items would fail a real run.
- Case "the 2.C window": no. It runs the skill's own commands and compares the results with the known commit times.
- Case "the folder rule": no. The listed set is compared with an independent `ls | grep`.
- Case "`session <id>`, `ls` of the file": yes. `ls` shows that the file exists on disk. It does not show that Steps 2's rule selects that folder over the worktree folders. The case should say "the rule of Steps 2, applied by reading, selects `-Users-axelfaes-workspace-ordo`, and `ls` shows the file is there".
- Case "report name": no.
- Case "template with worked example": no. The example fills each part.
- Case "read against the layout sections": no, but see findings 5 to 7.
- Case "ASCII grep": could pass without the goal. It is a fact check.
- Step line check (Axel's reading): no.

Findings where the design passes every case but fails in a real run:

8. Non-ASCII in quoted places. The 2.C window's output has 16 lines with a non-ASCII character, 6 of them with an em dash (`LC_ALL=C grep -c '[^ -~]'` gave 16, and the em dash count gave 6), all in assistant or tool items. Steps 6 quotes "exactly as the reader printed it". The sessions report is tracked (`git check-ignore` on `.scratch/retros/x.md` gives rc=1, so it is not ignored). The verify list's perl check fails on any tracked `.md` with a non-ASCII character other than U+2705. So step 4's commit of a report quoting one of those lines turns every plan's verify list red, and the same holds for the worked example in `2-report.md`. The fix needs a rule for rendering a non-ASCII character in a quote. That is a visible choice about the report's form (transliterate, mark as `<U+2014>`, or cut the quote before it), so it is either a stop or needs a named recommended option booked under the ruling "Overnight work".
9. Reading in parts. There is no part size and no record of position.
   - Item 1 Steps 4 says "consecutive parts" without a bound.
   - The 2.C output is 744064 bytes in 3808 lines. Split into 500-line parts, the eight parts measured 140454, 114214, 118710, 58539, 73972, 95716, 92013 and 50446 bytes.
   - One line is 2573 characters long (`awk` max length; 1 line over 2000).
   - A part is only safe when it is bounded in bytes. The file-reading tool's per-call size limit and its truncation of lines over 2000 characters come from its behaviour as I know it: not verified here.
   - "So a compaction loses none" also needs the draft to record the last line read. Without it, a session after compaction cannot tell where to resume, and it re-reads or skips parts.
   - The fix is for Steps 4 to name a part as a line range of at most a stated number of bytes, with a line longer than that bound read on its own, and for the draft to record each range read.
10. The session form and exit status 1.
    - `/session-retro session 6266a558-ed92-43a1-ac08-9bf8f4bc78a8` makes the reader print 38105 lines, 7021754 bytes (16983 items) in about 4.6 s. That is 9.4 times the 2.C window. Reading it whole in parts means several compactions. The brief says nothing about this size. A threshold or a question to the user before Steps 4 would be a user-visible choice, and no ruling covers one.
    - Separately, the reader exits 1 with partial output when a file or folder cannot be read (docstring, "Exit statuses"). Item 1 names only the usage error as a refusal, so a run on exit 1 would report counts and points from a partial output without saying so. The fix is for Steps 3 to treat exit 1 as a refusal that shows the `error: cannot read` lines, or to record them in the report. Refusal is the choice that matches "every place is one the reader printed" and the counts rule.
11. The empty-output refusal is per folder. Item 1 Steps 3 says "Run the reader over each folder ... An output with no item is a refusal." For the 2.C window, both worktree folders print 0 lines (`wc -l` gave `0` and `0`), so a literal reading refuses the gate's own run. It should say "when the outputs of all folders together hold no item".
12. The draft report: its path, the order of steps, and the refusal leaving nothing.
    - Steps 1 ("The window is written into the report") and Steps 3 ("go into the report") write to a report before Steps 3's refusal, while skill-layout says "A step that can refuse or stop comes before every step that writes".
    - The glossary's **refusal** "leaves nothing".
    - Steps 4's "draft report on disk" has no path. If it is written at `sessions-<date>.md`, Steps 8's rule "when that file exists, `-2`" names the final report after its own draft.
    - The fix is to name one path for the draft, chosen at the first write and kept through Steps 8, and to move the recording of the window and counts after the last refusal.
13. A second run: "the same window" is never the same. "What it reads" and Decision 2 skip points "already ruled in an earlier sessions report of the same window". For an open plan the end is the time of the run, so two runs never share a window. A `session <id>` run and an `<entry>` run overlap without being equal. The rule needs a criterion a reader can apply, such as "a point whose places are all places of a ruled point in an earlier sessions report". Decision 2 also changes what the user is shown and is not covered by the ruling "Step 2, the skill's shape" or booked in plan.md's Rulings. The ruling "Overnight work" requires such a decision to be booked there.
14. The `-2`, `-3` suffix. Item 1 Steps 8's name for a second run on the same day is a file-name choice beyond D2 (a), which ruled `sessions-<YYYY-MM-DD>.md`. It is reasonable, but it is a user-visible name no ruling covers. It should be booked in plan.md's Rulings with Decision 2 (finding 13).
15. Secrets the reader does not redact. The reader leaves out a YAML value on the line after its name (plan.md ruling "Step 1, the redaction forms", last sentence). The skill commits quoted lines into a tracked file in a repository with a remote (`git remote -v`: `origin https://github.com/TheAxeC/ordo.git`). Item 1 has no step or rule telling the session to write `<REDACTED>` for a secret it sees in a line it quotes, as the change standard's rule 21 does for command output. It should be added to Steps 6.
16. Rulings taken one at a time are written only at the end. Steps 10 takes every ruling and Steps 11 then writes them. With a long report, a compaction between the two loses rulings already given. Steps 10 and 11 should say that each ruling is written beside its proposal as soon as it is given.
17. Folder names come from an unresolved path. Steps 2 builds the names from "the repository's absolute path" and `<repository>/<worktree_root>/`. On this machine, the scratchpad folders show that Claude Code names a folder after the resolved path: `/tmp/...` became `-private-tmp-...` (`ls ~/.claude/projects`). A repository reached through a symlink, or a `worktree_root` holding `..`, would therefore give names that match nothing, and the run refuses with "no transcript folder". Steps 2 should build the names from the resolved path (`git rev-parse --show-toplevel` and the resolved worktree root).
18. "The session's scratch folder" (Steps 3) is not a term this repository defines. The reader's output of a user's transcripts is also left on disk after the run. Name the folder (`mktemp -d` under `$TMPDIR`), and say whether it is removed after Steps 12.

## 6. Implied inputs

- Not a code step. The skill's inputs are covered in section 5 (findings 10, 11, 13, 17).

Findings: none.

## Declined to judge

- Whether Claude Code writes transcripts under `$CLAUDE_CONFIG_DIR/projects` when that variable is set, and whether it shortens a long folder name (for example over 200 characters) with a hash. Neither can be verified from this machine, and no folder here has such a name. This would be settled by the Claude Code documentation or by a run with the variable set.
- Whether quoting the user's typed words into a tracked report that may be pushed to `origin` is acceptable. D2 (a) ruled the path. Whether the repository is public was not checked, and the point is Axel's.
- The size limit of the file-reading tool behind finding 9, from memory: not verified.
- Whether `git log --diff-filter=A` for a plan whose `plan.md` was added more than once should take the earliest add. No plan on this tree shows it. The 2.C command prints one line.

Agent usage: about 30 tool uses. The tokens and time are to be filled by the session from the completion notice.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1: `plan-retro` "What it reads" 3 reads the newest `<YYYY-MM-DD>.md`; `skills/plan-retro/SKILL.md` joins the paths (What to build 3, a case), booked as part (5) of the ruling "Step 2, the report's form and the run's size".
- 2: Steps 9 names a rule, a skill, or a brief (the `spec` skill's `templates/brief.md`, or the brief of a step not yet landed).
- 3: the step line's command reads `sed -n 28p`.
- 4: the docstring is lines 1 to 95, in the premise and in "Read" 1.
- 5: item 1 sets the words: "a Claude Code session", "a keep point" and "a change point", "the decision"; Decision 1 lists the terms for step 3, the window and the working folder among them.
- 6: the Rules hold two bullets (the quoted line's form, and the one write in the repository); the reading through the reader and the edit of a named text are Anti-patterns only; the counts are in Steps 3 and 5. The case reads "each rule in one place".
- 7: the case says the noun "retro" is used only for `/plan-retro`'s report, the names apart.
- 8: the Rules bullet writes a non-ASCII character as `<U+XXXX>`, ruling part (1).
- 9: Steps 6 bounds a part at 50,000 bytes by an `awk` command, reads a cut line in full, and records each range read in the report; a case checks the ranges over the 2.C output.
- 10: Steps 4 stops above 1,000,000 bytes (ruling part (2)), with a case on both outputs; Steps 3 refuses the reader's exit 1 with its `error: cannot read` lines.
- 11: Steps 3 refuses when the outputs of all folders together hold no item.
- 12: every refusal (Steps 1 to 4) comes before the first write; Steps 5 chooses the report's path once and the report is the draft from then on; the window and counts are written there at Steps 5.
- 13: Steps 7 leaves out a point whose places are all places of a decided point, ruling part (3).
- 14: the `-2` suffix is ruling part (4), with a case.
- 15: the Rules bullet writes a secret the reader left as `<REDACTED>`.
- 16: Steps 10 writes each decision before the next proposal is shown.
- 17: Steps 2 names the folders from `cd "$(git rev-parse --show-toplevel)" && pwd -P` and the resolved worktree root.
- 18: Steps 3 makes the working folder with `mktemp -d` under `$TMPDIR`; its path is in the report, and Steps 12 removes it after the commit (Decision 2).
- The session case now applies the rule of Steps 2 and checks each folder with `ls`; the premise's figures are the case's exact window (3738 lines, 730556 bytes).

Brief-check agent usage (from its completion notice and transcript): claude-opus-5-5, 120502 tokens, 33 tool uses, 402 s, $0.98 to $2.88.
