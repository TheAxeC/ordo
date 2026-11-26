# Step 6 refuter report (on .agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-6, base 1966241)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ test -f of the six files (README.md, docs/dev/working-on-ordo.md, docs/dev/change-standard.md, docs/glossary.md, docs/adr/0044-...md, .scratch/.../agents/reviews/6-report.md)
test -f: 0 for each of the six
$ printf '%s\0' README.md docs/dev/working-on-ordo.md docs/dev/change-standard.md docs/glossary.md docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md .scratch/27-.../agents/reviews/6-report.md | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0
$ LC_ALL=C grep -c '[^ -~]' README.md
0
$ LC_ALL=C grep -c '[^ -~]' docs/dev/working-on-ordo.md
0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ grep -o '!\[[^]]*\]([^)]*)' README.md | sed 's/.*](//; s/)$//'   (each with test -f)
docs/figures/orchestration/plan-loop.svg        test -f: 0
docs/figures/academic/paper/lifecycle.svg       test -f: 0
docs/figures/academic/researcher/lifecycle.svg  test -f: 0
$ grep -o '!\[[^]]*\]([^)]*)' README.md | wc -l
       3
$ git grep -ohE 'docs/figures/[A-Za-z0-9_/.-]*\.(svg|py)' -- README.md docs skills ':!docs/roadmap.md' | sort -u | while read -r f; do test -f "$f" || echo "MISSING $f"; done
(nothing printed)
$ git grep -n --untracked 'Working on Ordo' -- ':!.scratch'
docs/dev/working-on-ordo.md:1:# Working on Ordo
$ grep -n 'working-on-ordo.md' docs/dev/change-standard.md docs/glossary.md docs/adr/0044-*.md README.md
docs/dev/change-standard.md:96:..., docs/glossary.md:181:..., README.md:145:..., docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md:7:...
$ awk '/^```/{c=!c;next} !c && NF && !/^#/ && !/^\|/ && !/[.:)]$/' README.md docs/dev/working-on-ordo.md
(nothing printed)
$ awk 'prev=="" && $0=="" {print FILENAME": "FNR} {prev=$0}' README.md docs/dev/working-on-ordo.md
(nothing printed)
$ grep -n ' - \| -- ' README.md docs/dev/working-on-ordo.md   (bullets left out)
(nothing, rc 1)
$ git status --short --untracked-files=all
 M README.md
 M docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md
 M docs/dev/change-standard.md
 M docs/glossary.md
?? .scratch/27-.../agents/reviews/6-report.md
?? docs/dev/working-on-ordo.md
$ git diff 1966241 --stat
 README.md | 285 ++++------; ...0044...md | 2 +-; docs/dev/change-standard.md | 2 +-; docs/glossary.md | 2 +-; 4 files changed, 85 insertions(+), 206 deletions(-)
$ git diff 1966241 --word-diff=porcelain -- <each of the three citation files> | grep '^[-+][^-+]'
ADR 0044:          -(`README.md`, "Working on Ordo").   +(`docs/dev/working-on-ordo.md`).
change-standard:   -(`README.md`, Working on Ordo).     +(`docs/dev/working-on-ordo.md`).
glossary:          -`README.md`, "Working on Ordo";     +`docs/dev/working-on-ordo.md`;
$ diff <(git show 1966241:README.md | sed -n 249,266p) <(sed -n 3,20p docs/dev/working-on-ordo.md) && echo IDENTICAL
IDENTICAL
$ wc -l -c (old README, new README, new page)
270 76528 old README.md; 149 17746 README.md; 20 3125 docs/dev/working-on-ordo.md
$ grep -n 'By copying the folders\|for skill in orchestration/' README.md
(nothing, rc 1)
$ grep -n '^## Configuring a repository\|^## The landing script\|^## Working on Ordo' README.md
(nothing, rc 1)
$ grep -n '^#### `plan.yaml`$' README.md
93:#### `plan.yaml`
$ python3 -I (each ![...] against the old alt text and html.unescape of the SVG aria-label; rows per ### group heading with word counts)
docs/figures/orchestration/plan-loop.svg eq old: True eq aria: False 1142
docs/figures/academic/paper/lifecycle.svg eq old: True eq aria: True 1446
docs/figures/academic/researcher/lifecycle.svg eq old: False eq aria: True 1606
orchestration 8, ordo 3, code 5 (handbook among them), academic 7, explain 2; highest word count 25 (plan, codebase-design, diagnose, wizard); no cell holds ". " or "; "
$ ls -d skills/*/*/
25 folders, each one row of the tables
$ sed -n 95,103p README.md | wc -w -c ; ... | fold -w 100 | grep -c .
     398    2685
30
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated, Spec 1 (the `plan.yaml` subheading is about twice the length the brief sets) and Spec 2 (a false statement about `templates/plan.projects.yaml`); Spec 3, Spec 4 and Standards 1 also bear on it.
- 2: holds. `diff` of old lines 249 to 266 against new lines 3 to 20 printed nothing; line 1 is `# Working on Ordo`; line 8 holds `utils/pin.sh v1.1.0` and line 9 `utils/pin.sh` with no tag; the last line is the sentence on `docs/dev/building.md`.
- 3: holds. The word diff changes only the citation.
- 4: holds. The word diff changes only the "Stated in" citation.
- 5: holds. The word diff changes only the citation.
- 6: holds. `git diff 1966241 --stat` and `git status --short --untracked-files=all` list only the paths of "Paths this step writes".

Cases of the brief's "Cases":

- The README's images: met, 3 images at the three paths, each `test -f` 0.
- Every figure path: met, the loop printed nothing.
- "Working on Ordo": met, the one line `docs/dev/working-on-ordo.md:1:# Working on Ordo`.
- The new page: met, `IDENTICAL`, and both `pin.sh` lines are in its code block.
- The citations: met, lines 96, 181 and 7, and `README.md:145`.
- The skills tables: met, five tables under `` ### `skills/<group>/` ``, 8+3+5+7+2 = 25 rows, each folder of `ls -d skills/*/*/` once, `handbook` in the code table.
- Each row's text: met, each row is one sentence of at most 25 words (read, and the word count above). Whether the sentences are correct is covered under Spec 3.
- The first paragraph: met. README line 3 states that the skills carry no project name and no path and that everything specific to a repository comes from its `plan.yaml`. That keeps `docs/dev/change-standard.md`'s "Rules this repository already states" and ADRs 0001, 0014 and 0044 true.
- The other citations of the README: met. Line 3 holds the C++ engine, the TypeScript tool and the research project (ADR 0058). Line 5 holds the fresh reviewer that changes nothing (ADR 0003). Line 11 names the five group folders (ADR 0048).
- The loop: met. Line 5 states the loop that the glossary entry **loop, in the README** defines: a roadmap entry becomes a plan in a ledger folder, each step gets a brief and is built in its own worktree, a fresh reviewer reviews it, and it is cherry-picked onto `main` after its checks pass.
- The install: met. The grep prints nothing, `npx skills add TheAxeC/ordo --skill '*' -g -a claude-code` is at line 129, and the four agent commands are at lines 137 to 140.
- The sections removed: met, nothing printed and `93:#### `plan.yaml``.
- The facts kept: partial, Standards 2.
- A newcomer's reading: partial, Standards 1 and Spec 3; the user's own reading is under "Declined to judge".
- The README's length: met, 149 lines and 17746 bytes, against 270 and 76528.
- The glossary: met, `ok: the plan-terms block equals the template`.

## 1. Spec

- README.md:93-103, `` #### `plan.yaml` ``: four paragraphs of 398 words and 2685 characters, about 30 lines at 100 columns. The report's judgment call reads: "The brief's "at most about 15 lines of text" is met as source lines; rendered at about 100 characters a line it is about 27 lines."
  - What is wrong: the brief sets "The whole subheading is at most about 15 lines of text". The file has no hard wraps, so a paragraph is one source line, and a count of source lines would pass a subheading of any length. Read as text, the subheading is twice the limit. The report re-reads a limit the brief set and decides that reading as a judgment call. Under the rules file's rule 4, a reading of brief text of that kind is reported as a stop and not decided by the builder.
  - Where the length is: the cost-script paragraph (line 101, about 110 words in two sentences) and the `.agents/plan.yaml` note (line 97) are the longest parts.
  - Failure scenario: a newcomer reaches a block of about 30 lines of configuration detail in the middle of "How to use", which the goal asks to keep short. The user, reading the README for the step's check, then has to rule on a length the brief had already set.
  - Verdict: item 1 violated.
- README.md:99: "To write the file by hand, copy the `plan` skill's `templates/plan.yaml` (one project) or `templates/plan.projects.yaml` (several projects, a plan then named `<project>/<entry>`) to `docs/plan.yaml`; each describes every key and the default of each optional one."
  - What is wrong: `skills/orchestration/plan/templates/plan.projects.yaml` (read whole) has three comment lines and no comment on any key. It states no default and refers to `plan.yaml` instead: "Each project takes the keys of plan.yaml, with the same required keys and the same defaults." The old README said this of `plan.yaml` alone ("The example `plan.yaml` describes every key").
  - Failure scenario: someone setting up a repository with several projects copies `plan.projects.yaml` and looks in it for the meaning and the default of each key. They find none, and may take its sample values (`review: earned`, `worker_effort: high`, `self_rule: off`) for the defaults.
  - Verdict: item 1 violated.
- Four statements about skills that their own pages do not support:
  - README.md:20 (`spec` row): "has a fresh agent check it". README.md:74 (the order of use): "/spec <entry> <step>          writes the brief, has a fresh agent check it, makes the worktree". The `spec` skill's description says "run for a full step the brief check by a fresh read-only agent". The old line said "once per full step (the brief check; a small text step has none)".
  - README.md:77: "close them" is described as "a repair round: the findings are fixed in the same worktree". The old line's "up to repair_rounds times; a small text step has none" is dropped. The glossary entry **repair round** says "a small text step gets none".
  - README.md:89: "The plan skills, `plan`, `spec`, `refute`, `land`, `ordo-help` and `plan-orchestration`, run each step through the loop below". `ordo-help` only prints. The figure that follows says "/ordo-help starts no agent and has no stop".
  - README.md:7: "Other skills do work outside a plan: the code skills find the cause of a defect, ...". README.md:40 says `diagnose` works "in a plan or on its own", so the README states both.
  - Failure scenario: a newcomer expects a brief check on every `/spec` and a repair round after every `/refute`. On a small text step, neither happens, and they take that for a fault.
  - Verdict: item 1 partial for these sentences; the case "A newcomer's reading" is partial.
- README.md:103: "It cherry-picks the step onto `main`, runs the plan's verify list (the commands that must pass) there through `checks.sh`, and copies nothing into the ledger."
  - What is wrong: the old fact (old line 241) was "It runs from the `land` skill itself, and nothing is copied into the ledger", meaning the script is not copied into the ledger folder. The new sentence turns that into a claim about what `land.sh` writes. The `land` skill's Steps item 5 says a ledger file that a commit of the range holds does reach main. The rewrite changes the meaning, which the rules file's rule 17 forbids.
  - Failure scenario: a reader takes the sentence to mean that no ledger file committed in a step's worktree reaches main's ledger. They commit a ledger file there, expecting it to be left out.
  - Verdict: item 1 partial for this sentence.

## 2. Proof

- none. Every check and count the report quotes reproduced as stated: the line and byte counts, the three images, the alt-text equalities, 25 rows with at most 25 words each, the greps, `IDENTICAL`, and `git status`.

## 3. Standards

- README.md, terms that a newcomer meets before any explanation, against the brief's Conventions ("each term the README uses is explained where it first appears, or is one a Claude Code user knows"):
  - line 20: "checks the step's premises against the tree"
  - line 39: "Holds a repository's code to standards pages: fills the pages"
  - line 85: "a task of a resumed agent"
  - line 95: "the shared rules for `CLAUDE.md`, the plan terms for the glossary", and "keeps the shared rules and the plan terms equal to their templates"
  - line 101: "prices each agent role", and "When a plan that started an agent closes"
  - The old README explained the shared rules and the plan terms by their markers and their template files (old lines 189 to 191). The new README neither explains them nor names a page that does.
  - Failure scenario: a reader who has never seen Ordo cannot tell what `/ordo-init` will insert into their `CLAUDE.md` and glossary, or what "the tree" and a "premise" are. They approve the draft without knowing what it changes.
  - Verdict: the case "A newcomer's reading" is partial.
- The report's list of where each old fact stands, against `docs/dev/change-standard.md` rule 18 ("each row covers one rule of the old text, and the place the row names states that rule whole ... the report quotes, for each row, the line of the named place that states it"):
  - The rows quote no line. They give section names, line numbers or `grep -c` counts of a phrase, and many rows bundle several facts.
  - Rows checked against their named places:
    - The row for old line 70 names `references/self-rule.md`, "The six kinds left open and its bullets on `/roadmap` and `/ordo-init`". The `/roadmap` and `/ordo-init` bullets are under that file's section "A skill with its own approval stop".
    - The row "The example describes every key, its paths written for a file in `docs/`: new README third paragraph" names a sentence that now extends the claim to `plan.projects.yaml`, which is false (Spec 2).
  - Failure scenario: the orchestrator, landing on the list, cannot check by reading that each named place states its fact. The list has already passed one named place that states the fact wrongly.
  - Verdict: the case "The facts kept" is partial.

## 4. Behaviour

- none. The report's "Host- or user-visible changes" gives the before and after of the README (sections, tables, images, the removed install by copying, the new link), of the new page, and of each of the three citations.

## Declined to judge

- The user's own reading and approval of the README, the step's check on its step line in `plan.md`. That reading is the user's.
- ADR 0044 line 7, which the step rewrites, still names `research-hub/funding/2026-fwo-senior-transplant/...` paths. The brief check's Closed section ruled `docs/adr/` outside `CLAUDE.md`'s "A shipped file names nothing private", so whether to strip the paths is the user's call.
- ADRs 0036 (Consequences, "the README and the figures carry the change"), 0037, 0039, 0040 and 0042, now that the README shows none of `paper`'s mode figures and its `paper` row has 24 words. The brief check's Closed section treats them as records of where a change was carried. Whether they remain true is a reading of what a record's Consequences assert, which is the orchestrator's or the user's.
- The sentence-length and paragraph-length departures the report names (lines 7, 11, 85, 97, 99, 101 and 143). Each follows a form the brief dictates (one sentence, one paragraph, or one or two sentences). Whether that justifies the length against the prose standard's "Sentence length" and "Paragraphs cover one idea" is a judgment for the user's reading.

Reviewer usage: a42e8ad1b4355625a, claude-opus-5-5, 218158 tokens, 34 tool uses, 6 min 18 s.
