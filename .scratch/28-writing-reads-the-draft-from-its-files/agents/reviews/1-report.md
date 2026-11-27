# Step 1 report

Everything in the brief is done.

## Open items of the state file, verbatim

- none.

## The cases' first run

Each case was checked by reading `skills/academic/writing/SKILL.md` with `cat -n` on the unchanged tree (base 2d4005a), and again after the change.

- A `.tex` main file with one `\input{sections/intro}`. Unchanged tree: not met. "Agent prompts" put "the text of each file with its line numbers as `cat -n` prints them" and "The output of `prose_facts.py`" into the prompt, and every agent was told to "read no file". After: met. "Agent prompts" gives the absolute path of each file of Steps 3's list, each paired with its path from the main file's folder, and the path of `facts.txt`. The bullets of "Finding agent prompt" say "Before the review, read each file this prompt names, whole, and read no other file."
- A `.docx` draft. Unchanged tree: not met. The prompt held "the output of `docx_paragraphs.py`". After: met. The prompt holds the path of `paragraphs.txt` "in place of the path of the `.docx`", and the path of `facts.txt`. The place `paragraph <n>`, with the part in square brackets, is unchanged in "Finding agent prompt".
- A `.md` draft of one file. Unchanged tree: not met, since its text was given as `cat -n` prints it. After: met. Steps 3's list is the one file, so the prompt holds its one path and the path of `facts.txt`.
- A file longer than one read. Unchanged tree: not met, since no agent read a file. After: met. Both bullet lists say "Read a file longer than one read in consecutive parts, each starting at the line after the last one read, up to its last line."
- `prose_facts.py` exits non-zero. Unchanged tree: the refusal "No facts" with the line printed, and no folder. After: met. Steps 5 says the line is the one "printed on standard error", and that before the refusal is shown the folder is removed with `rm -r '<the folder>'`. The Stops intro points there.
- `docx_paragraphs.py` exits non-zero after the folder is made. Unchanged tree: the same as the case above. After: met by the same Steps 5 bullets, which cover "either script".
- A draft path holding a space and a single quote, such as `my draft's/main.tex` (made up). Unchanged tree: the script arguments were quoted, and there was no redirect, no folder and no `rm -r`. After: met. Steps 5 quotes each path in single quotes, "the folder's included", with `'\''` for a quote inside. Both redirects and both `rm -r` commands take `'<the folder>'`, naming only the path `mktemp -d` printed. "Agent prompts" says each path "stands whole on a line of its own, in backticks, so a space or a quote in it stays part of the path".
- The call `/writing a.pdf`. Unchanged tree and after: met. The extension refusal of "What it reads" 3 is raised before Steps 3 lists the files, and the folder is made at Steps 4, so nothing is made and nothing is left.
- A run that ends normally. Unchanged tree: the report and the token line were shown, and no file was written. After: met under the ruling below. Steps 8 removes the folder once the checking agent has ended, Steps 9 shows the report as the message that ends the turn, and Steps 10 adds the token line in the same message.
- The checking agent. Unchanged tree: not met, since it got "The draft's text and the output of `prose_facts.py`" and was told to read no file. After: met. Its prompt holds "The paths of the draft's files, or of `paragraphs.txt` for a `.docx`, and of `facts.txt`, as for a finding agent", plus the findings. Its bullets carry the same three reading bullets.

The case the brief's rules got wrong:
- Case "A run that ends normally". The rule was item 5's "after the report and the token line are shown". On the tree, Steps 7 showed the report "as the message that ends the turn", and Steps 8 added the token line "in the same message", so no command can run after them and the folder would be left behind.
- The orchestrator's ruling, `agents/briefs/1-cases.md`, from Open item C of `plan.md` (the user), option (a): the folder is removed with `rm -r '<the folder>'` once the runner reports that the checking agent has ended, and before the report and the token line are shown. It is also removed on every refusal raised after it was made. The built text follows this ruling (Steps 8).

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. The temporary folder | DONE | `grep -n 'mktemp -d' skills/academic/writing/SKILL.md` printed `60:4. Make the temporary folder with \`mktemp -d\`, which holds the outputs of the scripts that the agents read.` and lines 67 and 77 |
| 2. The scripts write into it | DONE | Read: Steps 5, with the redirects `> '<the folder>/facts.txt'` and `> '<the folder>/paragraphs.txt'`. The run below shows each script prints its error on standard error |
| 3. The prompts give paths | DONE | Read: "Agent prompts"; Verify 2 below |
| 4. The agents read the files whole | DONE | Read: the three bullets in "Finding agent prompt" and in "Checking agent"; Verify 2 below |
| 5. The folder is removed | DONE | `grep -n 'rm -r' skills/academic/writing/SKILL.md` printed `67:   - Before that refusal is shown, remove the temporary folder with \`rm -r '<the folder>'\`, naming only the path \`mktemp -d\` printed.` and `77:8. When the runner reports that the checking agent ended, remove the temporary folder with \`rm -r '<the folder>'\`, naming only the path \`mktemp -d\` printed.` |
| 6. The rest of the page | DONE | Read: the opening paragraph, "What it reads" 3 and 4, Stops, Anti-patterns, Rules, and the facts bullet of "Finding agent prompt". The description is unchanged, since none of its sentences became false |
| 7. Version 2.3.0 | DONE | `sed -n 5p skills/academic/writing/SKILL.md` gives `  version: "2.3.0"` (diff line `+  version: "2.3.0"`) |
| ADR 0061 | DONE | `docs/adr/0061-each-writing-agent-reads-the-draft-and-the-script-outputs-from-their-files.md`, 28 lines (`wc -l`) |
| ADR 0013 status line | DONE | `sed -n 3p`: `Status: proposed; superseded by 0061 in the part "each given in its prompt the draft's text, the script's facts", now each agent given the paths of the draft's files and of the script outputs, which it reads itself` |
| ADR index row | DONE | `tail -1 docs/adr/README.md`: `\| [0061](0061-each-writing-agent-reads-the-draft-and-the-script-outputs-from-their-files.md) \| Each writing agent reads the draft and the script outputs from their files \|` |
| Figure condition | DONE, no change | `writing()` names no prompt content |
| Verify 1, character set | DONE | The check over the four changed files printed nothing; `exit=0` |
| Verify 2 | DONE | `grep -n -e 'read no file' -e 'cat -n' -e "^- The draft's text" -e 'facts in the prompt' -e '^- The output of' skills/academic/writing/SKILL.md` printed nothing; `exit=1` |
| Verify 3 | DONE | The `mktemp -d` and `rm -r` lines quoted above |
| Verify 4 | DONE | The description length check printed `779` |
| Verify 5 | DONE | `python3 docs/figures/gen_figures.py` gave `exit=0`; then `git status --short docs/figures` printed nothing |
| Verify 6 | DONE | See "Sentence length and list items" below |
| Glossary sync | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |

Runs behind item 2 and the quoting, in a scratch folder under the session scratchpad:
- `prose_facts.py` on a missing file, with output redirected into a `mktemp -d` folder, printed `error: .../my draft's/nope.md: No such file or directory`. The result was `exit=1 stdout-bytes=0`, so the line went to standard error.
- `docx_paragraphs.py` on a `.md`, redirected the same way, printed `error: .../my draft's/main.md: not a zip file`. The result was `exit=1 stdout-bytes=0`.
- `prose_facts.py` with the draft path written `'.../my draft'\''s/main.md'` gave `exit=0`, and the facts file began `## Paragraphs` and `main.md:1: 2 sentences, 6 words`.
- After `rm -r` of the `mktemp -d` folder, `ls -d` printed `No such file or directory`.

## Sentence length and list items

These new sentences run past roughly 20 words. Each states one rule with its qualifiers, which `docs/dev/skill-layout.md`, "Lists and tables", keeps in the same bullet:
- The opening paragraph's first and third sentences. They state the run's two scripts-then-agents phases, and the order of removal and report.
- The Steps 5 head. It carries the quoting rule for every path, unchanged in form from the old Steps 4.
- The two `.tex` and `.docx` bullets of "Agent prompts", each with the reason for its form.
- The place bullet of "Finding agent prompt".
- The Stops intro.
- The new Anti-patterns row.

Steps 8 and 9 each carry one action. Every new prohibition ("read no other file", "editing no file, starting no agent, invoking no skill and running no command") stands in a bullet that names what to do instead.

## The terms

- **refusal** ("names its cause and leaves nothing") is used in the Stops intro in its glossary sense. The intro now says how a refusal after Steps 4 leaves nothing: the folder is removed first.
- **finding**, **runner** and **completion notice** are used as before.
- "Temporary folder" is no glossary term. It is used in plain words, as `paper` Steps 7 uses it. The `session-retro` term **working folder** is not used.
- No entry was added or changed.

## Files

- `skills/academic/writing/SKILL.md`: 313 lines, +42 -27 (`git diff --numstat`).
- `docs/adr/0061-each-writing-agent-reads-the-draft-and-the-script-outputs-from-their-files.md`: new, 28 lines.
- `docs/adr/0013-a-script-and-four-fresh-read-only-agents-review-a-draft.md`: 21 lines, +1 -1 (line 3).
- `docs/adr/README.md`: 70 lines, +1.
- `.scratch/28-writing-reads-the-draft-from-its-files/agents/briefs/1.md` and `1-cases.md` show in `git status` as the orchestrator's replacement of the brief. I did not write them.

## Judgment calls

- The folder is made in a new Steps 4, and removed in a new Steps 8. The later items are renumbered, 4 to 10, so each item holds one action. Every in-page reference was carried over: "What it reads" 3 and 4 (Steps 5), Steps 7 ("as Steps 6 starts"), the Stops intro, the No facts row (Steps 5), and Anti-patterns (Steps 6 and 7). `git grep` found only one reference to this skill's Steps outside it: `paper` "What it reads" 3, which cites Steps 3, and that item is unchanged.
- The file names are `facts.txt` and `paragraphs.txt`, as the brief's examples give them.
- Paths in a prompt stand in backticks, on a line of their own, since an agent passes them to its read tool and not to a shell.
- The reading bullets in "Checking agent" say "Before the check" where the finding agents' bullets say "Before the review".

## Host- or user-visible changes

- Before: the session copied each draft file, as `cat -n` prints it, or the `.docx` paragraphs, and the facts into all four prompts, and the agents read no file.
- After: the session makes a `mktemp -d` folder holding `facts.txt` and, for a `.docx`, `paragraphs.txt`. The agents get the paths and read the files whole themselves. The folder is removed once the checking agent ends, or before a "No facts" refusal. The report and the token line are unchanged.

## Wrong or impossible in the brief

- Item 5 as first written, with the removal "after the report and the token line are shown", could not be followed, as the hand-back above showed. It was ruled by Open item C, option (a), and the built text follows the ruling.
