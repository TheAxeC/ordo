# Step 1 brief check (on main at a39f650)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## 1. Names

Commands: `git grep -n -i -e "draft's text" -e 'read no file' -e 'cat -n' -- skills`; `git grep -n -i -e 'writing' -- README.md docs skills/academic/paper skills/academic/grant skills/academic/researcher skills/academic/referee skills/ordo ':!docs/adr' | grep -i -e '/writing' -e '`writing`' -e 'writing skill' -e 'writing agent'`; `git grep -n -i -e 'leaves* no file' -e 'leaves* nothing' -e 'in their prompts*' -e 'in its prompt' -e 'into four prompts' -e 'whole draft' -e "draft.s text" -- README.md docs skills utils ':!docs/roadmap.md' ':!skills/academic/writing'`; `git grep -n -i -e 'prose_facts' -e 'docx_paragraphs' -- ':!skills/academic/writing' ':!docs/roadmap.md' ':!.scratch'`; `git grep -n -i -e 'change nothing' -e 'changes nothing' -- README.md docs/dev docs/figures/gen_figures.py skills/academic skills/ordo | grep -i -e writing -e 'four fresh'`.

Hits outside "Paths this step writes", each with whether the change makes it false:

- `skills/academic/paper/agents/citation_compliance_agent.md:728` ("the draft's text and its list differ"): another skill's own sense; stays true.
- `skills/academic/researcher/SKILL.md:430` ("Read no file of another tool"): unrelated; stays true.
- `skills/code/code-comments/SKILL.md:139,178,181` (`cat -n`): code-comments' own prompts; stays true.
- `skills/academic/writing/templates/prose_facts.py:100` ("so the numbers match `cat -n`"): a code comment about line numbering; stays true, since the read tool numbers lines the same way. Not in the path list, and no change is needed.
- `README.md:9` and `README.md:62` ("`writing` reviews its prose"; "with a script and four fresh agents that change nothing"): stay true.
- `docs/dev/scripts.md:37,38`: say what the scripts print, not who reads it; stay true (this matches the brief's premise).
- `docs/dev/building.md:41`, `docs/dev/scripts.md:9`: list `academic/writing.svg`; stay true.
- `docs/figures/gen_figures.py:308,449` and `docs/figures/academic/paper/full.svg:132`, `revision.svg:72,106` ("/writing review, unless you said no"; "a /writing report as the comments"): stay true.
- `docs/figures/gen_figures.py:18` and `docs/figures/academic/writing.svg:1,2` (boxes: the four agents and the report): stay true. No label names the prompt's content.
- `skills/academic/grant/SKILL.md:18,30,36,239,240,245,246,250,278,287,298,317,377,380,392,405`, `grant/agents/criteria_reviewer_agent.md:55`, `grant/references/intake.md:27,89,115`: they invoke `/writing` on a file (`main.tex`, `section.tex` in `review/`, a copy of the field's text) and show its report. None says what the agents get in their prompt or that `/writing` leaves no file. They stay true.
- `skills/academic/paper/SKILL.md:15,23,71,77,78,80,96,295-307,442,461,970,977,983,999,1055`, `paper/agents/draft_writer_agent.md:46,59,67,78,630,711,713`, `paper/agents/intake_agent.md:254,256,261`, `paper/references/revision_patch_protocol.md:91,92`, `paper/references/anti_leakage_protocol.md:72`: same as grant; they stay true. `paper/SKILL.md:80` relies on the `writing` skill's Steps 3 (the file list), which the step keeps.
- `skills/ordo/ordo-init/templates/docs/glossary.md:3`: lists `writing` among skills with terms; stays true.
- `docs/glossary.md:102` and `skills/ordo/ordo-init/templates/plan-terms.md:97`, **refusal** ("It names its cause and leaves nothing"): this stays true only if the folder is removed on every refusal after it is made. Item 5 and item 6 (Stops) require that.
- `docs/adr/0003-...md:11` ("reads the whole draft"): the record is wholly superseded (`Status: superseded by 0013`); not in force.
- `docs/adr/0013-...md:7,11,15`: in the path list (line 3 only). Its Decision sentence "each given in its prompt the draft's text, the script's facts" becomes false, and the brief supersedes it through the status line.
- `docs/roadmap.md:26-28`: entry 28's own text; stays true.

I found no page outside `skills/academic/writing/` that states the writing agents get the draft's text in their prompt, read no file, or that /writing leaves no file. The only such statement outside the skill is ADR 0013's Decision, which the brief handles.

Inside `skills/academic/writing/SKILL.md` (in the path list), these sentences become false and are named by no item of "What to build". Item 6 lists the places to change by name, and these are not among them:

- `skills/academic/writing/SKILL.md:115`, "Take a count from the facts in the prompt, and give it only inside the finding it shows." After the change the facts are in a file, not in the prompt.
- `skills/academic/writing/SKILL.md:294`, Rules, "The session passes the outputs of the scripts and the agents' findings on, and judges nothing of the draft." After the change the session passes the paths of the outputs, not the outputs.
- `skills/academic/writing/SKILL.md:64`, Steps 4's completion criterion, "Done when the output of each script is held, or the refusal is raised." Item 2 implies a new criterion (each output written to its file) but does not name it.

Findings: three sentences of the page under change become false and are not named in "What to build": line 115 (Finding agent prompt), line 294 (Rules, first bullet) and line 64 (Steps 4's Done line). Item 6 should name them, or say that every sentence naming "the prompt" as the place of the draft or the facts is rewritten. The change standard's rules 14 and 19 would oblige the builder to catch them anyway, but the brief's list reads as exhaustive.

## 2. The step line

Command: `cat -n .scratch/28-writing-reads-the-draft-from-its-files/plan.md` (step 1's line) against the brief's "What to build".

- "the session makes the temporary folder with `mktemp -d` once the draft's file list is known and before the scripts run": item 1.
- "writes the output of `prose_facts.py` and, for a `.docx`, of `docx_paragraphs.py` to files in it": item 2.
- "gives each of the four agents the absolute paths of the draft's files, of the paragraphs file for a `.docx`, and of the facts file in place of their text": item 3.
- "every agent is told to read each of those files whole and no other file": item 4.
- "the folder is removed after the report is shown, and on every refusal raised after it was made": item 5.
- "'What it reads', Steps, 'Agent prompts', the agents' bullets, Stops, Anti-patterns, Rules and the description say the same": item 6, with Steps, Agent prompts and the bullets also covered by items 1 to 5.
- "`metadata.version` goes to 2.3.0": item 7.
- "ADR 0061 records the decision, ADR 0013's status names the part 0061 supersedes, and `docs/adr/README.md` lists 0061": the 0061, 0013 and README items.
- "`gen_figures.py` and `writing.svg` change only if a label or the note of `writing()` no longer holds": the figures item.
- Check, "the reviewer quotes, for each of the four parts of the gate, the lines of the diff that hold it": this is the reviewer's task. The brief does not repeat it, and does not need to.
- Check, "`grep -n -e 'read no file' -e 'cat -n' ...` prints nothing": Verify 2.
- Check, "`python3 docs/figures/gen_figures.py` exits 0 and `git status --short docs/figures` prints nothing after it": Verify 5. The brief allows the two figure files to be listed when the figure condition held. The step line says "prints nothing", but that line also allows the figures to change on the same condition, so the two are consistent.
- Check, "the verify list exits 0": the brief's Verify 1 sub-bullet ("The plan's whole verify list runs once, at landing on main").

Two requirements serve no named part of the line:

- The line 10 opening paragraph in item 6 serves the change standard's rule 14 (a sentence the change makes false), not a section the line names.
- The Anti-patterns row's content, in item 6.

Both are legitimate.

Findings: none. Every part of the step line has a requirement.

## 3. Premises

- 298 lines and version "2.2.0" at line 5. `wc -l skills/academic/writing/SKILL.md` printed `298 skills/academic/writing/SKILL.md`, and `sed -n 5p` printed `  version: "2.2.0"`. Holds.
- Lines 84, 85, 86 and 95 give the draft's text and the facts in the prompt. `git grep -n -i -e "draft's text" -e 'read no file' -e 'cat -n' -- skills` printed `skills/academic/writing/SKILL.md:84`, `:85`, `:95`, `:127`, `:246`, `:263`, `:295` among its hits, and `cat -n` showed line 86 as "- The output of `prose_facts.py`." Holds.
- Lines 127 and 263 hold "Work from this prompt alone: edit no file, start no agent, invoke no skill, run no command and read no file." The same grep shows both. Holds.
- Line 74 holds "Write no file and add no finding.", line 10 holds "...The agents change nothing and leave no file...", and line 295 holds the Rules sentence. `cat -n` confirms all three. Holds.
- Steps 4 spans lines 60 to 64 and gives the refusal "No facts". `cat -n` confirms. Both scripts print to standard output: `prose_facts.py`'s head comment (lines 1 to 30) says "Prints these sections", and `sed -n 25p .../docx_paragraphs.py` printed "Prints each other paragraph on one line as ...". Both print errors on standard error: `grep -n -i -e 'standard error' -e 'stderr' .../prose_facts.py` printed `36:Errors, each printed as one line on standard error:`, `454:` and `460:` with `file=sys.stderr`. Holds.
- The temporary folder in `paper`: `grep -n -e 'mktemp -d' -e 'rm -r' skills/academic/paper/SKILL.md skills/academic/grant/SKILL.md` printed `paper/SKILL.md:180: - It is made with \`mktemp -d\` before the first compile, ...`, `paper/SKILL.md:185: - It is removed with \`rm -r\` on every path that ends the run: delivery, or the user ending the run at a stop.`, and `grant/SKILL.md:95: - Make the temporary folder with \`mktemp -d\` before the run's first compile, and remove it when the run ends, as the \`paper\` skill's Steps 7 says.` Holds.
- ADR 0013: `cat -n docs/adr/0013-*.md` shows `3 Status: proposed`, and the Decision holds the quoted sentence word for word. Holds.
- ADR 0003 is superseded by 0013: `head -5 docs/adr/0003-*.md` printed `Status: superseded by 0013`. Holds. ADRs 0030 and 0035 say `writing` starts its agents on the runner's default agent with the runner's defaults (Decision sections read with `awk`). Holds.
- The highest ADR is 0060: `ls docs/adr | tail -5` lists 0058, 0059, 0060, README.md and template.md. The README's row form is `| [0060](0060-...md) | ... |` (`grep -n -e '0060' docs/adr/README.md`). The partial-supersede form is in `docs/adr/0001-...md:3`, `Status: proposed; superseded by 0030 in the \`standards\` key`. Holds.
- `gen_figures.py` `writing()` spans lines 845 to 860. `grep -n` printed `845:def writing() -> str:` and `860:    return _single("academic/writing.svg", ...)`, and the note is "The three finding agents start at once; the checking agent starts after they end." No label names the prompt's content. Holds.
- `docs/dev/scripts.md` lines 37 and 38 are the two scripts' rows (grep output above). Holds.
- Rulings A and B: `plan.md` Rulings, lines 31 and 32. Holds.
- The verify list has 16 commands equal to the documented list. A Python comparison of the state file's `verify` with the fenced list of `docs/dev/change-standard.md`, "Commands and their filters", printed `16`, `16 True`. I compared against the change standard's filtered list, not against `docs/dev/building.md` itself. Holds.

Findings: none. Every premise reproduces.

## 4. Cases and checks

The cases were read against `docs/dev/change-standard.md` and the three standards.

- Case ".tex main file with one \input": consistent. It cites "line 85", a page cited by line number. The rules file, "Where the work happens", says a ledger file cites a page by its section, never by a line number. The same holds for item 6 ("Line 10's opening paragraph", "Rules line 295"), item 7 (`docs/dev/skill-layout.md` line 24), Conventions (`docs/dev/skill-layout.md` line 23), and "What is on the tree" (`grant` "its `SKILL.md` line 95", `docs/dev/scripts.md` lines 37 and 38). The grep-hit quotes of `writing/SKILL.md` lines in "What is on the tree" carry their quoted text, and may count as grep hits. The pure page references (`skill-layout.md` line 23, line 24; Rules line 295; grant line 95) should name their sections: "Frontmatter" of the skill layout, "Rules" of the writing skill, and Steps 7 of `grant`'s draft.
- Case ".docx draft": consistent.
- Case ".md draft of one file": consistent.
- Case "A file longer than one read": consistent with item 4. It covers a file with more lines than one read takes. It does not cover a line longer than the read tool returns whole. That matters for a `.md` written one paragraph per line, as the prose standard's "Source formatting" asks, and for `paragraphs.txt`, where `docx_paragraphs.py` prints each paragraph on one line. I have not verified whether the runner's read tool cuts long lines; see section 5.
- Case "`prose_facts.py` exits non-zero": consistent. There is no case for `docx_paragraphs.py` exiting non-zero after the folder is made, although item 2 covers it ("A non-zero exit stays the refusal").
- Case "`/writing a.pdf`": consistent with the placement of item 1 (after Steps 3). It asks the builder to check a place the step does not change: "What it reads" 3, where the extension refusal is stated. That read is needed to show the order, so it is legitimate. Name the Steps item where the refusal is raised, since no Steps item now names the extension check.
- Case "A run that ends normally": consistent.
- Case "The checking agent": consistent.
- Missing cases under the rules file, rule 15 ("Each place where a supplied value reaches a command, a path or generated text is a case"):
  - The folder's path and the two output paths reach commands: the redirect of each script's output, and `rm -r`. Item 2 asks for quoting ("each path quoted as Steps 4 already quotes paths"). Item 5 asks for no quoting of the `rm -r` argument, and no case names it.
  - The draft's absolute paths reach the agents' prompts as generated text.
  - A case should cover a draft path with a space or a single quote, through the redirect, the prompt and `rm -r '<folder>'`. Another should check that `rm -r` names only the folder `mktemp -d` printed.
- The brief does not ask the builder to check, quote or explain any place outside the step's paths, apart from the `/writing a.pdf` case above and the reads of "Read, with sections or line ranges", which are reads, not cases.

Findings:

- (a) The rules file's rule 15 is not met. No case covers the folder path and the output paths where they reach the redirect and `rm -r`, and item 5 does not require the `rm -r` path to be quoted.
- (b) Several page citations by line number go against the rules file, "Where the work happens".
- (c) The case "A file longer than one read" does not cover a long line.
- (d) There is no case for `docx_paragraphs.py` failing after the folder is made.

## 5. The question

- Case ".tex": No. Reading the changed text for absolute paths, no line of either file in the prompt, and the read-whole instruction checks the goal directly.
- Case ".docx": No, for the same reason, for the paragraphs file.
- Case ".md": No.
- Case "A file longer than one read": Yes. My judgment, not verified on the runner: a text can say "read in consecutive parts to its last line" while a line longer than the read tool returns is cut. The agent then has not read the file whole, and finds no break in the cut part. What would settle it is the read tool's documented line limit. If there is one, item 4 should say that a line cut short in the read is read in full.
- Case "`prose_facts.py` exits non-zero": No.
- Case "`/writing a.pdf`": No; it bears on the folder's lifetime only.
- Case "A run that ends normally": No.
- Case "The checking agent": No.
- The check on the step's line: No, taken whole, because the reviewer quotes the diff's lines for each of the four gate parts. The grep part alone could pass with the goal unreached: Yes. `grep -n -e 'read no file' -e 'cat -n'` does not match line 84 ("- The draft's text for a `.docx`: the output of `docx_paragraphs.py`."), line 95 ("- The draft's text and the output of `prose_facts.py`, as for a finding agent."), line 86 or line 115. Any of these could stay while the grep prints nothing. Adding `-e "^- The draft's text" -e 'facts in the prompt' -e '^- The output of'` to Verify 2 would close that. A bare "draft's text" cannot be grepped, since it stays rightly at lines 111, 113, 245, 246 and 249 ("read from the draft's own text").
- Verify 1, ASCII: No; it checks a fact the goal does not rest on.
- Verify 2: Yes, as above.
- Verify 3, the `mktemp -d` and `rm -r` greps: Yes. One line each would pass with the folder made after the scripts run, or removed on the normal path only. The ordering (item 1) and the removal on refusal (item 5) are checked only by reading. Name that reading in Verify 6, or the cases already cover it: cases 5, 6 and 7 do.
- Verify 4, the description length: No; it does not bear on the goal.
- Verify 5, the figures: No; it does not bear on the goal.
- Verify 6, reading list items and sentence length: No; a style check.
- Items 1 to 7 and the ADR items have no check of their own apart from the above. Items 1, 3, 4 and 5 are checked by the cases' reading, with the exceptions named.

## 6. Implied inputs

This is a text step: a skill's text, an ADR, a status line and an index row. It is not a code step. It changes no script. `prose_facts.py` and `docx_paragraphs.py` stay unchanged, since the redirect to a file is written in the skill's Steps 4. `docs/figures/gen_figures.py` is a script and changes only under the figure condition, which (as read in section 3) should not hold. The verify list needs no change. The agents need a read tool: the runner's general-purpose agent, which ADRs 0030 and 0035 name, has one.

## 7. ADRs

Command: `grep -l -i -e 'writing' docs/adr/*.md`, then the status line and Decision section of each hit, read with `sed -n 3p` and `awk`.

- ADR 0013 (Status: proposed). It is touched. The sentence the step is under is "It then starts four fresh agents that change nothing, each given in its prompt the draft's text, the script's facts and only its own rules". The brief names it and supersedes that part. The rest is not contradicted: "The session shows the one report ... and changes nothing" still holds, since the temporary folder is outside the draft and is removed.
- ADR 0030 (proposed; superseded in parts that concern `paper` only). Its `writing` part is in force and is touched: "`writing` starts each of its agents on the runner's default agent with the runner's defaults, and its prompts set no model and no effort", together with "`paper` and `writing` read no `plan.yaml`". The brief does not contradict it. The new read instruction ("no other file") keeps the agents off `plan.yaml`. The brief names it.
- ADR 0035 (proposed; superseded in `paper` parts). Its `writing` part is in force and touched: "`writing` starts each of its agents on the runner's default agent with the runner's defaults in every setup". It is not contradicted, and the brief names it.
- ADR 0003 is superseded whole by 0013 and is not in force.
- ADRs 0001 and 0002/0026 (the prose standard's location and precedence; the manuscript differences) govern "What it reads" 1 and the rule lists, which the step does not change. Not touched.
- ADRs 0021 (superseded), 0023, 0031, 0029 and 0043 govern `paper`'s use of the `/writing` report. The step does not change the report. Not touched.
- ADR 0014 (code-comments) names `/writing` only in its rejected alternatives. Not touched.
- ADR 0060 ("One standard-library drawing engine, kept in handbook, draws every figure") would touch the step only if `gen_figures.py` changed under the figure condition. "What is on the tree" does not name it. That is acceptable while the condition does not hold (section 3), and it should be named if the builder finds the condition holds.
- No part of the brief contradicts an ADR in force. `docs/adr/README.md` says "A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`". Decision 1 of the brief follows it.

Findings: none that block. ADR 0060 is conditionally touched and unnamed.

## 8. Dictated text

Commands: `grep -n -e 'bullets that say' -e 'superseded by 0061' -e 'why it fails' -e 'facts.txt' .scratch/28-writing-reads-the-draft-from-its-files/agents/briefs/1.md`, and `LC_ALL=C grep -n '[^ -~]'` on the brief, which printed nothing and exited 1.

- Brief line 51 (`grep -n 'superseded by 0061'`): `Status: proposed; superseded by 0061 in ...`, naming the part "each given in its prompt the draft's text, the script's facts". Holds. It is the form of `docs/adr/0001-...md:3` and of `docs/adr/README.md`'s supersede rule.
- Brief line 39 (`grep -n 'bullets that say'`), the words given after a colon for the new bullets: "read each file the prompt names, whole, before the review, and no other file; a file longer than one read is read in consecutive parts up to its last line; edit no file, start no agent, invoke no skill and run no command." The brief says "bullets", so the builder splits at the semicolons. That meets `docs/dev/skill-layout.md`, "Lists and tables" (one rule per bullet). The third part breaks `docs/dev/skill-layout.md`, "Writing for an agent", first bullet ("a rule written as a prohibition names the behaviour to do instead, in the same bullet"). Split into its own bullet, "edit no file, start no agent, invoke no skill and run no command" names no behaviour to do instead. The old bullet carried "Work from this prompt alone" as its positive half. The fix is to give that bullet its positive, for example "Report the findings in the final message, and edit no file, start no agent, invoke no skill and run no command" (made up), or to keep it joined to the read bullet.
- Brief line 41 (`grep -n 'why it fails'`), the Anti-patterns row's cells: "why it fails: the session copies the draft four times and the prompts grow with it; do instead: give the paths". Holds. It is plain, ASCII, has no contrast or dash, and gives the do-instead the skill layout's Anti-patterns table form asks for. The semicolon separates the brief's two cells and is not cell text.
- Brief line 32 (`grep -n 'facts.txt'`): "such as `facts.txt`" and "such as `paragraphs.txt`". These are examples, not dictated words.
- The ADR 0061 bullets (Context, Decision, Alternatives rejected, Consequences) say what each section must say without giving its words. Not dictated.

## Declined to judge

- Whether the runner's read tool cuts lines longer than a fixed length. I did not verify it. It decides whether the case "A file longer than one read" needs a long-line clause (section 5).
- Whether 2.3.0 (minor) is the right version part. My judgment is that it fits `docs/dev/skill-layout.md`, "Frontmatter" (the minor part: the skill does something it did not do, and every run that worked before still works), since the report is unchanged. The plan raises the version once.

Agent usage: a92c188eb9f947915, claude-opus-5-5, 135741 tokens, 22 tool uses, 4.0 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1. Names, the three sentences of the page that become false (the bullet "Take a count from the facts in the prompt", the Rules bullet "The session passes the outputs of the scripts ...", Steps 4's "Done when" line): "What to build" item 6 now names the first two and every other sentence that names the prompt as the place of the draft or of a script's output; item 2 names the third.
- 4. (a) The folder path and the output paths reaching the redirect and `rm -r`: item 2 requires every path, the folder's included, quoted in single quotes with `'\''` for a quote inside; item 5 requires `rm -r '<the folder>'`, naming only the path `mktemp -d` printed; a case was added for a draft path holding a space and a single quote.
- 4. (b) Page citations by line number: "What is on the tree" (grant, `docs/dev/scripts.md`), item 6 (the opening paragraph, the Rules bullet), item 7 and Conventions (`docs/dev/skill-layout.md`, "Frontmatter") and the first case ("Agent prompts") now name sections; the quoted grep hits of `skills/academic/writing/SKILL.md` keep their line numbers.
- 4. (c) and 5. A long line: the session read a 16,915-byte file whose second line holds 3,000 words and a closing marker, and the read returned the line whole to the marker; "What is on the tree" records the measurement, so no long-line clause is added.
- 4. (d) No case for `docx_paragraphs.py` failing after the folder is made: the case was added, and item 2 says a non-zero exit of either script is the refusal.
- 4. The `/writing a.pdf` case names no Steps item: the case now says the refusal is raised before Steps 3 lists the files.
- 5. Verify 2 could pass with lines 84, 86, 95 or 115 kept: Verify 2 now also matches `^- The draft's text`, `facts in the prompt` and `^- The output of`.
- 5. Verify 3 alone does not check the order or the removal on a refusal: the cases on the refusals and the normal end check both by reading; no change.
- 7. ADR 0060 touched under the figure condition: "What is on the tree" names it.
- 8. The split bullet "edit no file, start no agent, invoke no skill and run no command" names no behaviour to do instead: item 4 now gives the third bullet as "work from the prompt and those files alone, editing no file, starting no agent, invoking no skill and running no command", and requires each prohibition to stand in a bullet that names what to do instead. This is a requirement on the bullet's content, not dictated words.
- The made-up path `my draft's/main.tex` added to the cases: an example input, marked made up; holds.
