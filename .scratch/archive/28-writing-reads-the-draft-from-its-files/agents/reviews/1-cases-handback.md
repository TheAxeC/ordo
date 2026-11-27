HAND-BACK, step 1 of entry 28: I changed nothing. One case shows the brief's rule on when the folder is removed cannot be followed. I wrote no report file, since no change has been made.

Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/28-writing-reads-the-draft-from-its-files-1. `git status --short` printed nothing, so the tree is unchanged.

## The case the brief's rules get wrong

Case: "A run that ends normally: the report and the token line are shown, then the folder is removed; no file is left anywhere."

Rule: "What to build" item 5 says the folder is removed with `rm -r '<the folder>'` "after the report and the token line are shown (Steps 7 and 8)". The plan's Rulings, Open item A (the user), says the folder "is deleted after the report is shown".

What the unchanged tree says, from `cat -n skills/academic/writing/SKILL.md`:
- Line 73, Steps 7: "show its final message, the report, whole as the message that ends the turn."
- Line 76, Steps 8: "After the report, in the same message, give on one line the tokens of the four agents".
- Line 10: "their report is shown to the user as the message that ends the turn."
- `skills/ordo/ordo-init/templates/shared-rules.md:9` states the same rule: the answer is given "in the message that ends the turn".

Result: the report and the token line form the message that ends the turn. A session can run no command after that message, so the `rm -r` that item 5 places after it never runs in the run, and the folder is left behind. The other way round is no better. If the session shows the report, runs `rm -r`, and then writes another message to end the turn, the report is no longer the message that ends the turn. That breaks Steps 7, line 10 and the shared rule: text written between tool calls reaches the user only as a summary. This is my judgment of how Claude Code runs a turn. The skill's own text (lines 10, 73 and 76) makes the conflict whatever the runner does. Items 1 to 4, 6 and 7 do not depend on this point. Item 5's removal on every refusal raised after the folder is made (such as "No facts") is not affected either.

The options for the orchestrator's ruling:
- (a) Remove the folder after the runner reports that the checking agent has ended and before the report is shown. That would be a new item between Steps 6 and 7, or the start of Steps 7. All four agents have ended by then, so no reader of the folder is left, and the report and token line stay the message that ends the turn. Nothing is left behind. It moves the removal before the report, which differs from the words "after the report is shown" in item 5 and in Open item A. Open item A's goal (agents read from the folder, nothing is kept afterwards) holds. Recommended (my judgment): it is the only order in which the folder is removed and the report is still the message that ends the turn.
- (b) Keep "after the report is shown" and let the report stop being the message that ends the turn. This contradicts Steps 7, line 10 and the shared rule, and the report reaches the user only as a summary. Not recommended.
- (c) Leave the removal to the next turn. No next turn is certain, so the folder can be left behind, and every refusal's "leaves nothing" (glossary **refusal**) and "no file is left anywhere" fail. This is the lazy option.

The wording of Open item A ("after the report is shown") is the user's. If the orchestrator judges that (a) changes the user's ruling and not only how it is carried out, the decision goes to the user.

## The cases' first read, on the unchanged tree (reading `skills/academic/writing/SKILL.md` in full with `cat -n`)

- A `.tex` main file with one `\input{sections/intro}`: not met. Line 85 puts "the text of each file with its line numbers as `cat -n` prints them, under the file's path from the main file's folder" into the prompt, and line 86 puts "The output of `prose_facts.py`" there. No prompt holds a path, and line 127 tells every finding agent to "read no file". Steps 3 (lines 51 to 59) lists the main file and then the input file as absolute paths, which the new prompt can use.
- A `.docx` draft: not met. Line 84 puts "the output of `docx_paragraphs.py`" into the prompt. The place `paragraph <n>`, with the part in square brackets for a paragraph outside the body, is at line 122 and holds already.
- A `.md` draft of one file: not met. Line 85 puts its text into the prompt as `cat -n` prints it, and no path is given.
- A file longer than one read: not met. No agent reads a file (lines 127 and 263), and no text says how a long file is read.
- `prose_facts.py` exits non-zero: the refusal "No facts" shows the line the script printed (line 63, and Stops line 283). No temporary folder exists, so there is nothing to remove. This holds on the unchanged tree, and after the change the removal has to be added.
- `docx_paragraphs.py` exits non-zero on a `.docx`: the same refusal (line 63), with no folder. The same holds as for the case above.
- A draft path holding a space and a single quote, such as `my draft's/main.tex` (made up): partly met. Steps 4 (line 60) quotes each script argument in single quotes, a single quote written as `'\''`. There is no redirect, no folder and no `rm -r` yet. In the prompts, the path from the main file's folder is a heading over the text (line 85) and no absolute path is given. A prompt path is text the agent passes to its read tool, not a shell word. After the change it is given whole on a line of its own and does not need shell quoting.
- `/writing a.pdf`: met. "What it reads" 3 (line 39) and Stops "Draft refused" (line 282) refuse the extension. No Steps item names the check, and it comes before Steps 3 lists the files. Nothing is made, and nothing is left.
- A run that ends normally: met on the unchanged tree. Steps 7 shows the report as the message that ends the turn, Steps 8 adds the token line to that message, and Steps 7 says "Write no file" (line 74), so no file is left. After the change, this is the case the hand-back is about.
- The checking agent: not met. Line 95 gives it "The draft's text and the output of `prose_facts.py`, as for a finding agent", and line 263 says "read no file".

## Facts read for the coming change, which need no ruling

- Figure condition: `sed -n 840,862p docs/figures/gen_figures.py` shows that `writing()` holds the four agent nodes, "The end: the numbered report", and the note "The three finding agents start at once; the checking agent starts after they end." None of them names what a prompt holds, so the figure does not change, and ADR 0060 does not apply.
- ADR form: the highest ADR is 0060 (`ls docs/adr`). The form for a part superseded is `Status: proposed; superseded by 0030 in the \`standards\` key` (`sed -n 3p docs/adr/0001-*.md`).
- Glossary: no entry is needed. The term "working folder" (glossary entry) belongs to `session-retro`, so I will not use it. I will write "temporary folder", the plain words that `paper` Steps 7 also uses.

When the ruling arrives I will build items 1 to 7, ADR 0061, the status line of 0013 and the index row, run the checks of "Verify before you report", and write the report to `.scratch/28-writing-reads-the-draft-from-its-files/agents/reviews/1-report.md` with the ruling in it.
