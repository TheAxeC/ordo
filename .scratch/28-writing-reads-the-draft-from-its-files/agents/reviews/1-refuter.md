# Step 1 refuter report (on .agents/worktrees/28-writing-reads-the-draft-from-its-files-1, base 2d4005a)

The diff does what the brief asks. Every item of "What to build" holds and every case is met. I found three findings, all small, and none sends the step back:
- S1: Steps 10's two bullets fall outside the numbered list when the page is rendered.
- P1: ADR 0061 cites ADRs 0030 and 0035 for a fact that neither of them states.
- P2: the builder's report does not quote the grep that the change standard's rule 14 asks for, though my grep reaches the same result.
Each can be fixed at landing.

## Verification (rerun by the reviewer)

All commands were run from the worktree root.

1. Character-set check over `skills/academic/writing/SKILL.md`, the new ADR 0061, `docs/adr/0013-...md`, `docs/adr/README.md` and the report: it printed nothing. `exit 0`.
2. `grep -n -e 'read no file' -e 'cat -n' -e "^- The draft's text" -e 'facts in the prompt' -e '^- The output of' skills/academic/writing/SKILL.md`: it printed nothing. `exit 1`.
3. The `mktemp -d` and `rm -r` greps printed:
   - `60:4. Make the temporary folder with `mktemp -d`, which holds the outputs of the scripts that the agents read.`
   - `67:   - Before that refusal is shown, remove the temporary folder with `rm -r '<the folder>'`, naming only the path `mktemp -d` printed.`
   - `77:8. When the runner reports that the checking agent ended, remove the temporary folder with `rm -r '<the folder>'`, naming only the path `mktemp -d` printed.`
   - The `rm -r` grep printed lines 67 and 77 again.
4. The description-length check printed `779`, which is at most 1024.
5. `python3 docs/figures/gen_figures.py` gave `exit 0`. `git status --short docs/figures` then printed nothing (`exit 0`).

I reran the commands the builder's report quotes. Every output matches the report:
- `sed -n 5p skills/academic/writing/SKILL.md` printed `  version: "2.3.0"`.
- `wc -l` gives 28 lines for ADR 0061, 21 for ADR 0013, 70 for `docs/adr/README.md` and 313 for `SKILL.md`.
- `sed -n 3p` of ADR 0013 prints the status line the report quotes, verbatim.
- `tail -1 docs/adr/README.md` prints the 0061 row the report quotes, verbatim.
- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, `exit 0`.
- The `+42 -27` for `SKILL.md` is the count of added and removed lines in `git diff 2d4005a -- skills/academic/writing/SKILL.md`, which I counted with awk.
- The stderr claim:
  - `prose_facts.py "/nonexistent/my draft's/nope.md" <prose standard> > /dev/null` printed `error: /nonexistent/my draft's/nope.md: No such file or directory`, `exit=1`.
  - `docx_paragraphs.py README.md > /dev/null` printed `error: README.md: not a zip file`, `exit=1`.
  - So both errors go to standard error. The sources agree: `prose_facts.py:454` and `:460`, and `docx_paragraphs.py:125` and `:130`, print with `file=sys.stderr`.

The premises of "What is on the tree" reproduce on the base (`git show 2d4005a:...`):
- `SKILL.md` had 298 lines and version "2.2.0" at line 5.
- Lines 84, 85, 86 and 95 held the draft's text and the facts.
- Lines 127 and 263 held "read no file".
- Line 74 held "Write no file and add no finding."
- Line 295 held "Every agent gets the whole draft's text".
- Steps 4 was at lines 60 to 64.
- The note of `gen_figures.py` `writing()` is as quoted, and the highest ADR before this step was 0060.
- `paper` Steps 7 holds `mktemp -d` and "removed with `rm -r` on every path that ends the run", and `grant` line 95 holds its `mktemp -d` sentence.

## Verdicts

| Item | Verdict | Evidence |
|---|---|---|
| 1. The temporary folder | holds | `SKILL.md:60-62`, a new Steps 4 after the file list (Steps 3) and before the scripts (Steps 5) |
| 2. The scripts write into it | holds | `SKILL.md:63-68`: the redirects `> '<the folder>/facts.txt'` and `> '<the folder>/paragraphs.txt'`, the quoting rule "the folder's included", "No facts" "with the line the script printed on standard error", and "Done when each output is written to its file in the folder" |
| 3. The prompts give paths | holds | `SKILL.md:92-94` and `:105`. Line 101 puts each path on a line of its own, in backticks |
| 4. The agents read the files whole | holds | `SKILL.md:137-139` and `:275-277`. The place bullet at `:131` holds "the line number the read shows" |
| 5. The folder is removed | holds | `SKILL.md:77-80` comes before Steps 9 and 10. `:67` removes it on "No facts". The Stops intro is at `:291`. Steps 9's "Write no file outside the temporary folder" is at `:82` |
| 6. The rest of the page | holds | Opening paragraph `:10`. "What it reads" 3 and 4 at `:38` and `:41`. Stops `:291` and `:297`. New Anti-patterns row `:304`. Rules `:309-310`. Facts bullet `:125`. The description is unchanged and none of its sentences is false |
| 7. The version | holds | `:5` `version: "2.3.0"` |
| ADR 0061 file | holds, with finding P1 | Context, Decision, Alternatives and Consequences are as the brief asks. The Decision's removal bullet follows the Open item C ruling. It names nothing private |
| ADR 0013's status line | holds | Same form as other partial supersessions, such as 0058 and 0020 (`grep -n '^Status' docs/adr/*.md`) |
| The README row | holds | It follows the row for 0060 and has the table's form |
| The figures | not applicable | The condition does not hold: the note and labels of `writing()` still hold. `gen_figures.py` exits 0 and leaves `docs/figures` unchanged |

| Case | Verdict | Evidence |
|---|---|---|
| A `.tex` main file with one `\input{sections/intro}` | met | `:92` and `:94`. No prompt piece holds text (Verify 2). The read bullets are at `:137-138` |
| A `.docx` draft | met | `:93`. The place `paragraph <n>` with the part in square brackets is unchanged at `:132` |
| A `.md` draft of one file | met | Steps 3 `:52` makes the list the one file, and `:92` and `:94` follow from it |
| A file longer than one read | met | `:138` and `:276` |
| `prose_facts.py` exits non-zero | met | `:66-67` |
| `docx_paragraphs.py` exits non-zero after the folder is made | met | `:66-67` ("either script") |
| A path with a space and a single quote | met | `:63` (quoting, "the folder's included"), `:64-65`, `:67`, `:77` and `:101` |
| `/writing a.pdf` | met | The refusal comes from "What it reads" 3 or Steps 3, and the folder is made only at Steps 4 (`:60`) |
| A run that ends normally | met (under the cases ruling) | `:77-86`: removal at Steps 8, then the report and the token line at Steps 9 and 10 |
| The checking agent | met | `:105` and `:275-277` |

The builder's report gives the first run of every case on the unchanged tree. The one case the brief's rules got wrong ("A run that ends normally") is carried with its ruling from `agents/briefs/1-cases.md`.

## The gate's four parts in the diff

1. The prompts give paths in place of text:
   - `+- For a `.tex`, `.md` or `.txt` draft, the absolute path of each file of Steps 3's list, in that order, each paired with its path from the main file's folder, which is the name a finding's place uses.`
   - `+- For a `.docx` draft, the absolute path of `paragraphs.txt` in the temporary folder, in place of the path of the `.docx`, since a finding's place is a paragraph number of that file.`
   - `+- The absolute path of `facts.txt` in the temporary folder.`
   - `+- The paths of the draft's files, or of `paragraphs.txt` for a `.docx`, and of `facts.txt`, as for a finding agent.`
2. Every agent reads each of those files whole and no other file. These three lines appear in "Finding agent prompt", and again in "Checking agent" with "Before the check" in place of "Before the review":
   - `+- Before the review, read each file this prompt names, whole, and read no other file.`
   - `+- Read a file longer than one read in consecutive parts, each starting at the line after the last one read, up to its last line.`
   - `+- Work from this prompt and those files alone, editing no file, starting no agent, invoking no skill and running no command.`
3. No agent prompt still holds the draft's text or either script's output:
   - Removed: `-- The draft's text for a `.docx`: the output of `docx_paragraphs.py`.`, `-- The draft's text for a `.tex`, `.md` or `.txt` draft: the text of each file with its line numbers as `cat -n` prints them, ...`, `-- The output of `prose_facts.py`.` and `-- The draft's text and the output of `prose_facts.py`, as for a finding agent.`
   - Added: `+Each path stands whole on a line of its own, in backticks, so a space or a quote in it stays part of the path. The agents read the draft and the outputs of the scripts from the files these paths name.`
   - Verify 2 prints nothing.
4. The folder is made before the first agent starts, and deleted once the last agent has ended and before the report is shown:
   - `+4. Make the temporary folder with `mktemp -d`, which holds the outputs of the scripts that the agents read.` This comes before `+6. Start three fresh agents in the background, at once: ...`.
   - `+8. When the runner reports that the checking agent ended, remove the temporary folder with `rm -r '<the folder>'`, naming only the path `mktemp -d` printed.`
   - `+   - The removal comes before the report, since the report is the message that ends the turn and no command runs after it.`
   - `+9. Show the checking agent's final message, the report, whole as the message that ends the turn.`
   - On a refusal: `+   - Before that refusal is shown, remove the temporary folder with `rm -r '<the folder>'`, naming only the path `mktemp -d` printed.`

## 1. Spec

No findings.
- No new dependency, and no script was written.
- The changed paths are within "Paths this step writes": `git status --short` lists `SKILL.md`, ADR 0013, `docs/adr/README.md`, ADR 0061 and the report.
- The brief and the cases ruling also show as changed in the worktree. They are the orchestrator's replacement, and they are identical to main's copies (`diff` of both pairs printed nothing).
- No ADR in force is contradicted:
  - ADRs 0030 and 0035 (default agent, no model and no effort) are kept at `SKILL.md:70`.
  - ADR 0060 is untouched, since the figure did not change.
  - The rest of ADR 0013 stands.

## 2. Proof

- **P1. ADR 0061 cites ADRs 0030 and 0035 for a fact they do not record** (`docs/adr/0061-...md`, Consequences).
  - Hunk: `Each agent needs a read tool, which the runner's general-purpose agent has (ADRs 0030 and 0035).`
  - What is wrong: the Decisions of 0030 and 0035 say only that `writing` "starts each of its agents on the runner's default agent with the runner's defaults". Neither says anything about the agent's tools.
  - Failure scenario: a maintainer who changes the agent type reads 0030 and 0035 to learn whether the read tool is guaranteed, and finds nothing there.
  - Fix: cite the ADRs only for the agent type, for example "which the runner's general-purpose agent, the one ADRs 0030 and 0035 name, has". The alternative is to drop the parenthesis.
- **P2. The report does not quote the grep of the change standard's rule 14** (report, "Judgment calls", first bullet).
  - Hunk: "`git grep` found only one reference to this skill's Steps outside it: `paper` "What it reads" 3".
  - What is wrong: the report gives neither the command nor its output. Rule 14 says "the report quotes that grep".
  - My grep (`git grep -n -E "writing.{0,120}Steps [4-9]|..."` and `git grep -n -E "\`?writing\`? skill's (Steps|...)"` over `skills`, `docs`, `README.md` and `utils`) reproduces the conclusion: the only outside reference is `skills/academic/paper/SKILL.md:80`, which cites Steps 3, and Steps 3 is unchanged. No decision rests on a wrong value.

## 3. Standards

- **S1. Steps 10's bullets are not nested under it** (`skills/academic/writing/SKILL.md:84-86`).
  - Hunk: `+10. After the report, in the same message, give on one line ...` followed by the unchanged `   - The checking agent's report above it stays whole and unchanged.` and `   - Done when the line follows the report.`, indented 3 spaces.
  - What is wrong: after the marker `10. ` an item's content starts at column 4, so a bullet indented 3 spaces starts a new list.
    - A CommonMark render (`markdown_it`, commonmark) closes the ordered list after item 10 and prints the two bullets as a separate `<ul>`.
    - The rendered item 10 therefore has no completion criterion, against `docs/dev/skill-layout.md`, "Writing for an agent": "Each item of Steps ends on its completion criterion".
    - The `paper` skill indents the bullets of its items 10 and 11 by 4 spaces (`skills/academic/paper/SKILL.md:214`).
  - Failure scenario: a reader of the rendered page sees "Done when the line follows the report" as a loose list after the Steps, detached from item 10.
  - Fix: indent both bullets by 4 spaces.
- No other breaks:
  - No non-ASCII characters (Verify 1).
  - No history in the skill text.
  - Nothing private is named in `SKILL.md` or ADR 0061.
  - I grepped the changed phrases across `skills`, `docs`, `README.md`, `utils` and `agents`: "read no file", "leaves no file" or "leave no file", "draft's text", "cat -n", "prompt alone", "No facts", the renumbered Steps 4 to 10, the glossary's **finding** "Stated in", the README row of `writing` and the `docs/dev/scripts.md` rows. None of them is made false.
    - The hits outside the skill belong to other skills' own Steps (`grant` Steps 5, 7 and 8; `code-comments`).
    - `prose_facts.py:100` names `cat -n` only as the numbering its lines match, which still holds.
    - `paper` Steps 13 and `grant` Steps 9 and 5 invoke `/writing` without citing its Steps.

## 4. Behaviour

- **B1 (minor). A host-visible change is not stated** (report, "Host- or user-visible changes").
  - Before: each of the four agents ran from its prompt alone.
  - After: each agent makes read tool calls on the draft's files and on the files in the temporary folder, and the session writes that folder under the system's temporary directory for the run.
  - The report states the folder and the removal. It does not state that each agent now makes read tool calls, which changes each agent's tool uses and its tokens.
  - Failure scenario: someone comparing an agent's tool uses or tokens with an earlier run takes the new read calls for a fault.
  - Fix: one sentence in the report.
- The other user-visible changes are stated with their before and after: the folder, its removal before the report or before a "No facts" refusal, and the report and token line unchanged.

## Declined to judge

- The builder's run of `prose_facts.py` on a draft path written `'.../my draft'\''s/main.md'` (exit 0, and the facts file beginning `## Paragraphs`). Rerunning it means creating a file whose path holds a space and a quote, and my brief says to write no file. What settles it is that run in a scratch folder.
- Whether main's history already tracks `agents/briefs/1.md` and `1-cases.md` in the form the worktree shows, so that the landing cherry-pick applies cleanly. What settles it is `git log --oneline -- .scratch/28-writing-reads-the-draft-from-its-files/agents/briefs/` on main.

Reviewer usage: ad51bb4d543e67209, claude-opus-5-5, 148152 tokens, 32 tool uses, 4.8 minutes.
