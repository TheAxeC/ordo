# Step 7 refuter report (on .agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-7, base ada4e20)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
# Verify 1, from the Ordo step worktree root
$ printf '%s\0' .scratch/27-.../agents/reviews/7-report.md | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0

# Verify 2, from /Users/axelfaes/workspace/research-hub
$ git diff -U0 README.md | grep '^+' | LC_ALL=C grep -c '[^ -~]'
0

# Verify 3, from /Users/axelfaes/workspace/research-hub
$ git diff --stat
 .oculus/notes/session.md                           |  2 -
 README.md                                          | 47 ++++++++++++++--------
 projects/active/sandpile-operator/README.md        |  4 +-
 projects/active/sandpile-operator/code/README.md   |  2 +
 .../code/theory/check_learnability.py              | 29 ++++++-------
 projects/active/sandpile-operator/project.yml      |  6 +--
 .../conformal-tensor-factors/project.yml           |  8 ++--
 7 files changed, 57 insertions(+), 41 deletions(-)
$ git status --short
 M .oculus/notes/session.md
 M README.md
 M projects/active/sandpile-operator/README.md
 M projects/active/sandpile-operator/code/README.md
 M projects/active/sandpile-operator/code/theory/check_learnability.py
 M projects/active/sandpile-operator/project.yml
 M projects/manuscripts/conformal-tensor-factors/project.yml
?? projects/active/sandpile-operator/code/theory/check_continuum.py
?? projects/active/sandpile-operator/code/theory/check_proofs.py
?? projects/active/sandpile-operator/notes/
?? projects/manuscripts/conformal-tensor-factors/code/results/hpc/refit_ll1_K4L1_n30.json
?? projects/manuscripts/hccnet-revision/code/hpc/wholecohort_tiny.slurm
(identical to the report's quotes)

# Verify 4: read by the reviewer; see Verdicts item 5 and the Standards heading.

# Commands the report quotes, rerun
$ git diff --numstat README.md            (research-hub)
31<tab>16<tab>README.md
$ grep -rl --include=README.md -e '^## Method and related work' -e '^## Dead-ends (do not retry)' projects side-projects | grep -v '/code/' | wc -l
      51
$ grep -rl --include=README.md '^## Working state' projects side-projects | wc -l
       0
$ readlink -f ~/.claude/skills/researcher
/Users/axelfaes/.local/share/ordo-stable/skills/academic/researcher
$ grep -c readme <that path>/SKILL.md
0
$ grep -n 'run_all\|paper.py' README.md    (after the change)
lines 19, 101, 102, 112, 113, 124
$ headings before (git show HEAD:README.md) and after, compared with diff after cut -d: -f2-
no output; 8 headings each
$ LC_ALL=C grep -n '[^ -~]' README.md     (research-hub)
no output
$ git status --short                       (Ordo step worktree root)
?? .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/7-report.md
$ the report's ~~~diff block extracted and compared with `git diff README.md`
diff printed nothing: the quoted diff is the whole diff, byte for byte
$ line numbers the report cites (61, 63-75, 77, 79, 81, 83, 85, 93, 99, 101, 102, 108, 112, 113, 124)
each holds the text the report names
```

Hunks of the diff against the brief's "Paths this step writes" (numbered at the base): base lines 32, 38, 61, 64-69, 71, 79, 85, 87 (plus one inserted line before it), 93, 97, 98. Every changed line is inside a range the brief lists; no line outside them changed.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `### The private README.md` (lines 61 to 85) names researcher's layout and its source (ADR 0057, `project_layout.md` "The README"); items 2 to 13 list every `##` and `###` of ADR 0057's first Decision bullet in its order, `## Constraints and limits` right after `## Method`. Each kept rule of the old section is in the new text, checked line by line against base lines 61 to 71 (the report's coverage list rows 1 to 24 reproduce). The hub details named by the brief are kept: the private-only status note (item 1), the compute (item 9), the cache recipe as a code block and the registry key (item 5), the paths, script names and open decisions of `## Next` (item 12). The layout's rules replace the too-long rule (200 lines, `notes/<slug>.md`, slug rule stated correctly with the layout's own example), add `None yet.`, and move `NOVELTY*.md` out of the folded list; the report names each replaced rule (coverage rows 9, 11, 17, 18). Line 85 states the `readme` mode as `researcher`'s SKILL.md "readme" states it (drafts the README, the code folder's README and `.depositignore` whole, shows where each fact went, writes after approval).
- 2: holds. Line 32 names the twelve sections in order in the hub's short form; line 38 adds `notes/<slug>.md` sections and novelty pages.
- 3: holds. Line 93 (base 79), line 99 (base 85, `data/` added), line 101 (new `run_all.sh` line), line 102 (base 87), line 108 (base 93), line 112 (base 97, rest of the bullet kept) and line 113 (base 98, eight parts in order, every own rule kept verbatim) do what the item says. See Spec 1 for a difference from the layout the wording leaves.
- 4: violated, Spec 1. Nothing else of `README.md` changed and line 124 (base 109) stays; the report lists `CLAUDE.md` line 88, `.oculus/config.yml` lines 41-44 and line 124 with the words to fix each, but it leaves out at least one place where the hub's text and the layout still differ.
- 5: holds. Verify 2 prints 0; each added paragraph and item is one line; no ` - `, `--` or `->` in an added line (grep over the added lines); the hits of " was " and "the old " in added lines are "was chosen", "was set", "the old file", "the old text", none of them history.
- 6: holds. Nothing is committed in research-hub: `git diff README.md` against HEAD shows the whole change, so it is in the working tree only. The approval itself is the user's at landing.

Cases of the brief's "Cases":

- `git status --short README.md` prints nothing before the change: not verifiable by rerun (the file is changed now); the report quotes an empty first run, and `git show HEAD:README.md` matches the base text the brief quotes, which is consistent with it.
- Headings the same before and after: met, the reviewer's own diff of the heading lists printed nothing (8 headings).
- The changed section against ADR 0057's first two Decision bullets: met, by reading lines 63 to 79.
- Each rule of the old section kept or replaced, with a coverage list: met, the report's 24 rows read against base lines 61 to 71; each named place states its rule whole.
- Line 85 and line 93 against ADR 0057's fourth bullet: met, lines 99 and 108 name `data/`, `attic/`, `results/`, `figures/`, caches and secrets as left out.
- Line 32 and line 38: met, by reading.
- The bullet `code/README.md` against the third bullet: met, eight parts in order, every kept rule there.
- The tree and the bullet `paper.py` against line 19 and ADR 0053: met, both scripts named with what each rebuilds, as line 19 says.
- The sentence on `/researcher readme <project folder>`: met, line 85.
- `git diff --stat` and `git status --short`: met, the rerun equals the report's quote; the other six files keep their counts and only ` M README.md` is new against the brief's list.
- No non-ASCII line added: met, `LC_ALL=C grep -n '[^ -~]' README.md` prints nothing.
- Ordo worktree status shows only the report: met.

## 1. Spec

- research-hub `README.md` lines 101 and 112, and the report's section "Anything in the brief that was wrong or impossible": "run_all.sh         the one documented command: rebuilds the results in results/ from the raw inputs ..." and "`run_all.sh` rebuilds the results in `results/` from the raw inputs, and `paper.py` rebuilds every figure and table from those results."; what is wrong: `project_layout.md`, "The tree", gives `run_all.sh` as "the one command: every reported number, table and figure from the raw inputs, then paper.py", that is `run_all.sh` ends by running `paper.py`. The hub's text makes `run_all.sh` rebuild the results only, so the "one documented command" of line 93 does not, by the hub's text, rebuild the figures and tables. The wording follows the brief's item 3, but item 4 asks the report to list each place where the hub's text and the layout still differ, and this one is not listed. A second unlisted difference of the same kind: the hub's project tree (lines 30 to 39) has no `logs/` and keeps proofs in `theory/`, while `project_layout.md` "The tree" and ADR 0053's default layout have `logs/` and put proofs under `notes/`. Fix at landing: either add "then runs `paper.py`" to line 101 and line 112 (inside the brief's ranges), or add both places to the report's item-4 list with the words that would bring them in line; failure scenario: the user writes a new project's `code/run_all.sh` from the hub's README, it stops after `results/`, and a stranger who runs the one documented command gets no figures; later `researcher` (whose layout expects `run_all.sh` to call `paper.py`) and the hub disagree about what the one command does, and the user, told by the report that the listed places are all of them, does not look; verdict: item 4 violated.

## 2. Proof

none. Every command the report quotes reproduces (see Verification), and the report's quoted diff is byte-identical to `git diff README.md`.

## 3. Standards

none. The hub's "Writing docs" rules govern (brief, Verify 4): one line per paragraph and item, ASCII only, no dash aside, no history word. The long sentences and list items the report names under its judgment calls are each a list of one section's contents or a rule carried verbatim, and the reviewer agrees with their form.

## 4. Behaviour

none. The report gives each user-visible change with its before and after (lines 112 and 113 by the whole diff, which it quotes).

## Declined to judge

- Whether the hub's own tree (`theory/`, no `logs/`) and `data/` "small public inputs only" should follow researcher's layout: the user's call; named in Spec 1 only as an unlisted difference.
- Whether research-hub's HEAD is the commit the report names (e77501837) and whether no commit was made there during the step: `git rev-parse HEAD` and `git log` are outside the three permitted git commands. The working-tree diff against HEAD holding the whole change is consistent with no commit.
- Whether a novelty page that a project keeps at its root (not in `notes/`) is covered by line 81's "a novelty page stays a file of `notes/`": no such file exists now (`find projects -name 'NOVELTY*' -not -path '*/notes/*'` printed nothing), so no reader is misled today; left to the user's reading at item 6.
- The user's approval of the section against ADR 0057 (item 6): the step's check, the user's.

Reviewer usage: aff4b9ac101cacafe, claude-opus-5-5, 143431 tokens, 19 tool uses, 3 min 8 s.
