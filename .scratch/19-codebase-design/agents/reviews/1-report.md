Everything in the brief is done.

# Report: step 1, the `codebase-design` skill

## Open items of the state file

- none

## The cases' first run

The first read was made on the unchanged tree, before any change. `ls skills/code/codebase-design` printed `ls: skills/code/codebase-design: No such file or directory`, and `grep -c 'codebase-design' README.md docs/dev/building.md docs/figures/gen_figures.py` printed 0 for each file. No skill text existed, so no case held on the unchanged tree. Each case was also read against the brief's own rules, and none showed a rule that gives a wrong result. The second column says where the skill's text now holds the case.

| Case | First read, unchanged tree | Where the text holds it now |
|---|---|---|
| A `plan.yaml` that lists its pages in another folder than `docs/dev/` | no skill text | `SKILL.md`, "What it reads" 3 and 4 place 1; "Steps / review" 4, first bullet: "A subject that is present is read from the repository's pages, and no default page is used for it." |
| No `plan.yaml` and a `docs/dev/design-principles.md` | no skill text | "What it reads" 4, place 2, which names that path |
| No `plan.yaml` and no standards page | no skill text | "Steps / standards" 6: a subject the repository lacks gets a new page "under `docs/dev/` when it has none"; "Steps / review" 4 and 5: the default page, and "A candidate under a rule of a default page says that the rule comes from the default page." |
| A coding-standards page that holds the design principles as a section | no skill text | "What it reads" 4: "wherever they stand, such as a section of another page"; "Steps / standards" 4 and 6: a rule that stands is left as written, and a drafted rule goes to "the page, or the section of another page" |
| A default sentence that still holds a placeholder, in `review` | no skill text | "Steps / review" 4: "A sentence of a default page that still holds a placeholder is skipped: no candidate cites it." |
| A repository without a user interface | no skill text | "What it reads" 6 and 7; "Steps / standards" 4 and "Steps / review" 4 work only on a subject that applies |
| `review` in a repository with no plan configuration | no skill text | "Steps / review" 8 writes and opens the report, 9 asks for the pick, 11 invokes `/ordo-init`, then `/roadmap add` and `/grill` |
| The `repo-setup` folder missing beside the skill's folder | no skill text | "What it reads" 2; Steps 1 of each mode; Stops, "No repo-setup folder" |
| `standards` where every default rule is already present | no skill text | "Steps / standards" 7: "the draft says so, nothing is written and the skill ends here" |
| The report file opened with no network | no skill text | `references/report.md` names no address: check 3 below prints nothing |
| The frontmatter | no skill text | check 2 below: `codebase-design 1020` |
| A shipped file names nothing private | no skill text | read of the five files of the skill and of the README lines added: the names in them are public products the sources name (Postgres, PGLite, Stripe, Twilio), the public authors Feathers and Ousterhout, and made-up module names marked as made up |

No case was handed back, and no ruling of the orchestrator was needed.

## DONE / NOT DONE

| Item | State | Command | Output as printed |
|---|---|---|---|
| Check 1, the character set | DONE | the `printf ... | xargs -0 perl ...` command of the brief, followed by `echo "exit status $?"` | it printed no line; `exit status 0` |
| Check 2, the frontmatter | DONE | `python3 -c 'import yaml; d=yaml.safe_load(open("skills/code/codebase-design/SKILL.md").read().split("---")[1]); print(d["name"], len(d["description"]))'` | `codebase-design 1020` |
| Check 3, no address in the report page | DONE | `grep -n 'https\?://' skills/code/codebase-design/references/report.md`; `grep -c 'xmlns=' skills/code/codebase-design/references/report.md` | the first printed no line; the second printed `0` |
| Check 4, the README counts | DONE | `grep -c 'code/codebase-design' README.md`; `grep -c 'twenty-two' README.md`; `grep -c 'twenty-one' README.md`; `grep -c '^| .codebase-design. |' README.md`; `grep -c 'diagnose., .wizard. and .codebase-design.' README.md` | `1`, `2`, `0`, `1`, `1` |
| Check 5, the headings | DONE | `grep -n '^## ' skills/code/codebase-design/SKILL.md` | `12:## Quick start`, `20:## Use instead`, `28:## What it reads`, `58:## Steps`, `167:## Stops`, `180:## Anti-patterns`, `193:## Rules` |
| Check 6, the figure | DONE | `python3 docs/figures/gen_figures.py | grep codebase-design`; `python3 docs/figures/gen_figures.py >/dev/null; echo "exit status $?"`; `git status --short docs/figures` | `wrote docs/figures/codebase-design.svg (10013 bytes)`; `exit status 0`; ` M docs/figures/gen_figures.py` and `?? docs/figures/codebase-design.svg` |
| Check 7, list items and sentence length | DONE | read of each new or changed item and sentence | the departures are listed under "Departures from the rules on list items and sentence length" |
| The eight files of "What to build" | DONE | `git status --short` | ` M README.md`, ` M docs/dev/building.md`, ` M docs/figures/gen_figures.py`, `?? docs/figures/codebase-design.svg`, `?? skills/code/codebase-design/` |
| The change carried to every place that names the skills of `skills/code/` (rule 14) | DONE | `grep -rn 'twenty-one\|twenty one' docs/dev skills utils README.md`; `grep -rn "code-comments., .diagnose. and .wizard\|code/wizard" docs/dev skills utils README.md` | the first printed no line; the second printed the paths of the `wizard` template and its test in `docs/dev/scripts.md`, `docs/dev/change-standard.md` and `docs/dev/building.md`, which name a file and no list of skills, and README.md line 162, the install loop, which now holds `code/codebase-design` |

The plan's whole verify list was not run: it runs once, at landing on main.

### Departures from the rules on list items and sentence length

- `SKILL.md`, the frontmatter `description` and the introduction: sentences over 20 words. The layout asks for one paragraph that says what each mode does and leaves behind, and each sentence lists the parts of one mode.
- `SKILL.md`, "What it reads" 4: the item holds the five subjects and the sentence on the order ahead of its numbered places. The search order is one rule with three places, kept in one item so that the steps cite one place.
- `SKILL.md`, "Steps / review" 2 and 5: item 2 carries the reason of the source ("Deepening a module pays off ...") as a second sentence, and item 5 lists what the agent's prompt holds in its first bullet. Each is one rule with its reason or its parts.
- `SKILL.md`, "Steps / review" 5, the bullet on the glossary: it carries the made-up Order example and the sentence that says it is made up.
- `README.md`, the row of `codebase-design`: sentences over 20 words in one table cell, in the manner of the rows of `code-comments` and `wizard` beside it.
- The four reference pages keep the sources' sentences, bold labels, contrasts ("not substance", "not a menu") and fragments ("What hurts.", "Straight into the candidates."). The brief asks that their content and order are kept and their wording changed only where the prose standard, the character set or the brief asks. The wording changes made are listed under "Differences from the two sources".

## The terms

Each glossary term the diff uses in a new place, read against its entry in `docs/glossary.md`:

- **runner**: "the runner's general-purpose agent with the runner's defaults" in `SKILL.md` (Rules) and `references/design-it-twice.md`. The entry's sense, the program that runs the sessions and agents.
- **session, the**: "the session has read" in "Steps / review" 6. The entry's sense, the Claude Code session that runs the skill.
- **stop**: the Stops table and the stops "The draft", "The candidates" and "The user interface". The entry's second sense, a point in a skill's Stops table where it waits on the user.
- **refusal**: "No repo-setup folder". The entry's sense: it names its cause and leaves nothing.
- **plan configuration**, **`projects:` form**: "What it reads" 3 and Rules. The entries' senses.
- **standards**: "the standards pages". The entry's second sense, the standard pages `/repo-setup` writes.
- **ADR**: "Steps / review" 3, 7 and 12. The entry's sense.
- **roadmap entry**, **goal**: "Steps / review" 11. The entries' senses.
- **step**: cited as "Steps / review 4", an item of a skill's Steps, the entry's second sense.
- **plan skills**, **brief**, **case**, **tiers**, **reviewer**, **finding**: not used in the files of the skill. Three wordings of the sources were changed to keep them out, listed below.
- No term is added to or changed in `docs/glossary.md` or `plan-terms.md`. The design terms (module, interface, implementation, depth, seam, adapter, leverage, locality) are defined in `references/vocabulary.md` only, as Deviation 17 rules. The word "candidate" is the sources' word for one proposal of the review; the skill's text says what a candidate holds in "Steps / review" 5, and it has no glossary entry.

## The files with line counts

`wc -l` and `git diff --numstat`:

- `skills/code/codebase-design/SKILL.md`: 200 lines, new
- `skills/code/codebase-design/references/vocabulary.md`: 111 lines, new
- `skills/code/codebase-design/references/deepening.md`: 37 lines, new
- `skills/code/codebase-design/references/design-it-twice.md`: 44 lines, new
- `skills/code/codebase-design/references/report.md`: 164 lines, new
- `docs/figures/codebase-design.svg`: 49 lines, new, written by the script
- `docs/figures/gen_figures.py`: 45 lines added, 0 removed
- `README.md`: 7 lines added, 4 removed
- `docs/dev/building.md`: 1 line added, 1 removed
- `.scratch/19-codebase-design/agents/reviews/1-report.md`: this report

## Differences from the two sources that `deviations.md` does not list

1. `references/vocabulary.md`: "tier-spanning slice" reads "a slice that crosses several layers of an application". Reason: the glossary gives "tiers" a sense of its own.
2. `references/design-it-twice.md`: "technical brief" reads "a prompt of its own with the technical facts", "use cases" reads "uses", "the default case" reads "the default call", and "proceed to Step 2" reads "go on to section 2". Reason: the glossary gives "brief", "case" and "step" senses of their own.
3. A sentence says that an example is made up, in three places: `references/vocabulary.md` after the two code examples, `references/report.md` in its first paragraph, and `SKILL.md`, "Steps / review" 5. Reason: the brief's convention that an example says whether it is made up or public.
4. Wording changed for the prose standard's hard rules, the content kept: "Consistent language is the whole point." reads "The vocabulary works only when every text uses the same term for the same thing."; "Fix once, fixed everywhere." reads "A fix made once holds for every caller."; "they just aren't part of the interface" reads "they are not part of the interface"; "Just passes through" reads "Passes calls through"; "is just indirection" reads "is only indirection"; "just because tests use them" reads "because tests use them"; "Variety is part of the point." reads "a report of one repeated pattern reads as generic"; "That's it." reads "It holds nothing else."
5. `references/report.md`, "Header": one line names each subject of standards page the repository lacks and `/codebase-design standards`. The brief asks that the report names them; the source's header has no such line.
6. `references/report.md`, "Diagram patterns": the source's first pattern, the Mermaid graph, is an inline SVG graph with a worked example of the same four modules, and the heading of the second pattern reads "when an SVG graph does not carry the weight" in place of "when Mermaid's layout fights you". This follows deviation 7 and is named here because it replaces a whole pattern. "Style guidance" gains two bullets: an inline `<svg>` carries no `xmlns` attribute, and a style the scaffold lacks is added to the one `<style>` element.
7. `SKILL.md`, "Steps / review" 5: the agent's questions hold one more, "Where does the code break a rule of a standards page?". It follows deviation 3 and is named here because it is a sixth question beside the source's five.
8. `SKILL.md`, "Steps / review" 9: the user may pick no candidate, and items 10 and 11 are then left out. The source asks only which candidate to explore. Reason: item 12, the ADR for a rejected candidate, needs a way to reject.
9. The source's list of what its grilling walks through ("constraints, dependencies, the shape of the deepened module, what sits behind the seam, what tests survive") is not restated: `/grill` settles the entry's decisions by its own text, as deviations 6 and 9 rule.
10. The introduction of `SKILL.md` gives the aim of the review as "friction that makes the code hard to understand and to test"; the source says "The aim is testability and AI-navigability."

## Judgment calls the brief left open

1. Where the search order stands: in "What it reads" 4 of `SKILL.md`, with no reference section, since the call with no mode does not read it and a reference section holds only what every run reads.
2. Where the scan agent's questions and the form of a candidate stand: in "Steps / review" 5 as bullets. They are read by one mode only, and the brief fixes the reference pages at four, so no fifth page was written.
3. How `review` learns the languages and whether the repository has a user interface: as `standards` does ("What it reads" 5 to 7). The brief states it for `standards` and asks, in the case of a repository without a user interface, that no candidate cites a UI standard.
4. The file name of a new page in `standards`: the name place 2 of the search order gives its subject, so that a later run finds the page. The brief gives the folder and no file name.
5. The Stops table has the four rows the brief names. Two bullets under it say that the invoked skills stop by their own tables and that the ADR offer of "Steps / review" 12 waits on the user's yes or no.
6. The figure has two panels, one per mode, built with the script's `compose` and `Panel` as `paper/run-folder.svg` is. Each mode ends in a box "The end: ...", as `code-comments.svg` does. `/ordo-init` and the question on the user interface are in the figure's note.
7. `README.md`: the image line of the skill follows the blank line after the image line of `code-comments`, so `git diff -U0 README.md` places the insertion after base line 88, one line past the brief's range 73-87.
8. The `projects:` form: the brief says which `rules` and `standards` are read (every project's) and does not say to which project's `standards` list a new page is added. The skill's text says "the `standards` list of the repository's `plan.yaml`", as the brief does, and the draft shows the change to the user.

## Host- and user-visible changes

- A new skill, `/codebase-design`, with the calls `/codebase-design standards`, `/codebase-design review [area]` and `/codebase-design`. Before: no such skill.
- `README.md`, the table of skills: before, the row of `wizard` was the last of its group; after, a row `codebase-design` follows it.
- `README.md`: before "`skills/code/` holds `code-comments`, `diagnose` and `wizard`", after "`skills/code/` holds `code-comments`, `diagnose`, `wizard` and `codebase-design`"; before "twenty-one" on two lines, after "twenty-two"; the install loop holds `code/codebase-design` after `code/wizard`.
- `README.md`, the sentence on the skills that launch agents: before it ended "and `code-comments` a finding agent, a checking agent and a rewrite agent."; after it ends "`code-comments` a finding agent, a checking agent and a rewrite agent, and `codebase-design` a scan agent and, when you ask for other interfaces, three or more design agents." The image line of `docs/figures/codebase-design.svg` follows the one of `code-comments`.
- `docs/dev/building.md`: before "`grant.svg`, `code-comments.svg` and the fourteen figures", after "`grant.svg`, `code-comments.svg`, `codebase-design.svg` and the fourteen figures".
- `docs/figures/gen_figures.py`: a function `codebase_design()`, its entry in `figures()` after `code-comments.svg`, and a line for `codebase-design.svg` in the head comment. The script now writes 23 files; the other 22 are unchanged, as `git status --short docs/figures` shows.

## Anything in the brief that was wrong or impossible

Nothing was wrong or impossible.

Not verified by a run: the three commands the skill names for opening the report (`xdg-open <path>`, `open <path>`, `start <path>`) and the `%TEMP%` folder on Windows. They are the source's sentences, kept as written, and running one opens a window on the user's machine. `git log --oneline` was run in the worktree and prints one line per commit.
