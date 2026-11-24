Final report: the run of `/tutor explain git worktree --page` has ended.

**Invocation**
I invoked the skill through the Skill tool with `skill: tutor` and `args: explain git worktree --page`. The tool accepted the call and loaded the skill from /Users/axelfaes/.claude/skills/tutor. Because the call held `explain`, the skill ran "Explaining". The working folder was empty when I checked it with `ls -la`, so it holds no MISSION.md and is not a teaching workspace.

**Stops**
1. "The page's path" (the page, item 2). The folder is not a teaching workspace and the call gives no path, so the skill had me ask for one. The coordinator answered with the working folder, /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/explain. That folder exists, so the page took the name from the page, item 1: `git-worktree.html`.
- The page, item 3, did not stop the run: no file stood at that path (`ls -la` showed the folder empty).
- Explaining, item 5, finished without an offer, because the folder is not a teaching workspace.

**Sources fetched**
- https://git-scm.com/docs/git-worktree, with WebFetch, and with curl to check the anchors the page links to.
- https://git-scm.com/docs/git-cherry-pick, the same way.

**The explanation, exactly as the skill had me give it**

---
I fetched two sources: the git-worktree manual page (https://git-scm.com/docs/git-worktree) and the git-cherry-pick manual page (https://git-scm.com/docs/git-cherry-pick).

**git worktree, as it applies to a plan step built in its own worktree and landed on main by a cherry-pick**

A git worktree is a second working folder attached to the same repository, so you can have more than one branch checked out at a time. The manual says: "A git repository can support multiple working trees, allowing you to check out more than one branch at a time." The folder you got from `git init` or `git clone` is the "main worktree". Each folder made with `git worktree add` is a "linked worktree", and a repository has "one main worktree ... and zero or more linked worktrees" (git-worktree, DESCRIPTION).

What the worktrees share and what each keeps for itself:
- A linked worktree shares everything with the repository "except per-worktree files such as `HEAD`, `index`, etc." (git-worktree, COMMANDS, `add`). Each folder therefore has its own checked-out commit and its own staging area. The commits and branches are shared: "all refs starting with `refs/` are shared" (git-worktree, REFS).
- So a commit made in the step's worktree is in the main repository as soon as it is made. Nothing has to be pushed or copied between the two folders.
- Git checks out a branch in only one worktree at a time. `add` "refuses to create a new worktree when <commit-ish> is a branch name and is already checked out by another worktree" unless `--force` is given (git-worktree, OPTIONS). That is why a step gets a branch of its own and does not check out `main`.

How a step uses this:
1. The worktree is created with a new branch that starts at main's head. `git worktree add -b <new-branch> <path> <commit-ish>` will "create a new branch named <new-branch> starting at <commit-ish>, and check out <new-branch> into the new worktree", and <commit-ish> "defaults to `HEAD`" when it is left out (git-worktree, OPTIONS, `-b`). The manual's own example is `git worktree add -b emergency-fix ../temp master`.
2. The builder works and commits in that folder. The main folder and its checkout of `main` stay as they were.
3. Landing brings the step's commits onto main by a cherry-pick. Cherry-pick takes "one or more existing commits, apply the change each one introduces, recording a new commit for each" (git-cherry-pick, DESCRIPTION). The commits on main are therefore new commits that carry the same changes, not the step branch's own commits. A range such as `main..<step-branch>` passes every commit on the step branch that `main` does not already have (git-cherry-pick, OPTIONS and EXAMPLES, the `master..next` example).
4. The worktree is then removed with `git worktree remove <path>`. Only a clean worktree can be removed without `--force`, and "the main worktree cannot be removed" (git-worktree, COMMANDS, `remove`). If the folder was deleted by hand instead, `git worktree prune` removes the information git kept about it (git-worktree, COMMANDS, `prune`). The step's branch is separate from the folder and is deleted with its own command; neither page fetched covers that command.

Sources fetched in this run:
- git-worktree manual page, https://git-scm.com/docs/git-worktree
- git-cherry-pick manual page, https://git-scm.com/docs/git-cherry-pick
---

**The page**
- Path: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/explain/git-worktree.html
- Size: 9075 bytes (`wc -c`).
- `LC_ALL=C grep -c '[^ -~]'` on the page gives 0. It exits with status 1, which grep does when it finds no match.
- What it holds. It is one self-contained HTML file with inline CSS and JS and no external scripts or fonts. It has serif typography in a Tufte-like style, a 40rem column, a dark-mode palette and print styles. Its sections are:
  - "What a worktree is", with the quote from the Description section.
  - "What is shared and what is not", a two-column table: HEAD and index per worktree, against the commits and refs under refs/ shared by all.
  - The one-branch-one-worktree rule.
  - "The life of a step", a four-command block (`git worktree add -b step-3 ../step-3 main`, `git cherry-pick main..step-3`, `git worktree remove ../step-3`) with a numbered explanation of each command.
  - A box that recommends one primary source, the git-worktree manual page.
  - "Check yourself", three quiz questions with 3 to 4 answers each. The answers are 4 words each and 18 to 25 characters long. The correct answer is at position 3, 4 and 1 in turn. Clicking an answer gives feedback at once.
  - A footer that reminds the reader to ask the agent follow-up questions, and lists the two sources.
- Citations. Each claim links to a section anchor on git-scm.com. I checked each anchor id with `grep -c 'id="..."'` against the pages fetched with curl. All are present, and the add-command link points to `#Documentation/git-worktree.txt-addpathcommit-ish`.
- The page links to no other lessons or reference documents, because none exist in this folder.

**Places where the skill's text left me without an instruction, disagreed with itself, or produced something wrong**
1. "The page", item 4, says "in the lesson's form that 'Teaching' item 8, 'The lesson', gives". Item 8's list does not include a task or a feedback loop, which belong to item 6. The frontmatter description says each lesson has "a task that gives feedback", and item 8 asks for "one tangible win". Whether the page should have a task is left open. I took the reading that it should and added a three-question quiz built to item 6's quiz rules.
2. Item 8, "The lesson", requires "It is directly tied to the mission." and "It is in the user's zone of proximal development." Outside a teaching workspace there is no mission and no learning records, and "The page" gives nothing in their place. I tied the page to the work at hand, a plan step built in a worktree and landed by cherry-pick.
3. Item 8 says "It links to other lessons and to reference documents with HTML anchors." Outside a workspace no such documents exist, and the skill does not say this bullet then lapses. I linked within the page and to section anchors of the sources.
4. "The page", item 2, says "elsewhere the path the user gives, or the path the user names when asked". The Quick start and "The call" define no way to give a path in the call; `/tutor explain <concept> --page` takes no path argument. "The path the user gives" has no defined channel, so every run outside a workspace reaches the stop. I took the stop.
5. The order of Explaining items 3 and 4 puts the path question after the full explanation. So the stop comes in the same message as the explanation, and the skill does not say whether the question may come first. I asked after the explanation, as the order says.
6. The Rules say "Never trust the model's parametric knowledge, in either mode." The page needed a concrete command sequence for a step. `step-3`, `../step-3` and running the cherry-pick from the main worktree on main are my own composition, not quotes. Each command's behaviour is cited, but the sequence as a whole has no source. Deleting the branch after landing is not covered by either source, and both the answer and the page say so. The skill does not say how far such composition is allowed.
7. "Use instead" names `/wait-what` for "The last message did not land and is to be said again". No skill by that name is in this session's list of available skills, so that row points to something that does not exist here.
8. "What it reads", item 3, lists the format pages for the mission, resources, learning record and glossary. There is no format page for a lesson or for the page, and the design details come only from item 8's prose. I gave no colour tokens, dark mode or phone width; those choices are mine.
