The run of `/tutor explain git worktree --page` has ended. The page is at /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/explain/git-worktree.html. `wc -c` gives 10708 bytes, and `LC_ALL=C grep -c '[^ -~]'` on the page prints `0`.

**Invocation.** I invoked the skill through the Skill tool with `skill: tutor` and `args: explain git worktree --page`, and it loaded. Every command ran in /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/explain. Before the run, `ls -la` showed the folder empty, and `test -f MISSION.md` printed `no-mission`, so it is no teaching workspace.

**Stops**
1. "The page's path" ("The page" item 2). The folder is no teaching workspace and the call gave no path. The answer was: the folder I am running in, so the page is `git-worktree.html` inside it.
   - "The page" item 3: `test -e git-worktree.html` printed `absent`, so the replace-file stop did not come up.
   - "Explaining" item 5: no learning record was offered, because the folder is no teaching workspace.

No other stop came up: the call held `explain` and a concept.

**Sources fetched** (both with WebFetch, nothing else sent out)
1. git-worktree manual, https://git-scm.com/docs/git-worktree
2. git-cherry-pick manual, https://git-scm.com/docs/git-cherry-pick

**The explanation, exactly as the skill had me give it**

## git worktree, as it bears on building a plan step in its own worktree

**What it is.** One git repository can have several working trees at once, so more than one branch can be checked out at the same time. `git worktree add` attaches a new working tree to the repository, together with some metadata that tells it apart from the others. The working tree and that metadata together are called a "worktree" [1].

**Main and linked worktrees.** The working tree made by `git init` or `git clone` is the "main worktree". Every worktree added afterwards is a "linked worktree". A repository has one main worktree and zero or more linked ones [1]. In a plan, the main checkout sits on `main`, and each step's worktree is a linked worktree.

**What is shared and what is separate.** A new worktree shares everything with the repository except per-worktree files such as `HEAD` and `index` [1]. Refs under `refs/`, which include every branch, are shared across all worktrees. Pseudo refs like `HEAD` are kept separately for each worktree [1]. So:
- a commit the builder makes in the step's worktree goes into the same repository the main checkout uses;
- the step's branch can be seen from `main` straight away, with no push or fetch;
- each worktree has its own checked-out commit (`HEAD`) and its own staging area (`index`), so work in the step's worktree does not change the files or the staging area of the main checkout.

**Creating one.** `git worktree add <path> [<commit-ish>]` creates a worktree at `<path>` and checks out `<commit-ish>` there [1]. If no commit is given, git uses a branch named after the last part of the path, and creates that branch from `HEAD` if it does not exist yet [1]. For example, `git worktree add ../hotfix` creates the branch `hotfix` and checks it out at `../hotfix` [1]. This is how a step's worktree can be made "at main's head": the new branch starts at the commit `main` points to.

**One branch, one worktree.** By default `add` refuses to create a worktree for a branch that another worktree already has checked out, unless `--force` is given [1]. As a result, `main` stays checked out only in the main checkout, and each step works on its own branch.

**Landing the step on main by cherry-pick.** `git cherry-pick` takes existing commits, applies the change each one introduces, and records a new commit for each. It needs a clean working tree, meaning no changes from the `HEAD` commit [2]. A range can be given: `git cherry-pick ..master` applies the changes of every commit that is an ancestor of `master` but not of `HEAD` [2]. Run on `main` with the step's branch as the range, it copies the step's commits onto `main` as new commits. Because branches are shared across worktrees [1], those commits are available on `main` without any transfer. If a change does not apply cleanly, the branch stays at the last commit that succeeded, `CHERRY_PICK_HEAD` points at the commit that failed, and the conflicting files get the usual `<<<<<<<` / `>>>>>>>` markers [2].

**Removing it after landing.** `git worktree remove` removes a worktree. It works only on a clean worktree, one with no untracked files and no changes to tracked files, unless `--force` is used. The main worktree cannot be removed [1]. If a worktree folder is deleted by hand, `git worktree prune` clears the administrative files left in `$GIT_DIR/worktrees` [1]. `git worktree list` shows the main worktree first, then each linked worktree with its checked-out revision and branch [1].

Sources fetched in this run:
1. git-worktree manual, https://git-scm.com/docs/git-worktree
2. git-cherry-pick manual, https://git-scm.com/docs/git-cherry-pick

(This was followed by the path request quoted in my earlier handback: the name `git-worktree.html`, the reason it cannot go to `reference/`, and the question for a path.)

**The page**
- Path: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/explain/git-worktree.html
- Size: 10708 bytes (`wc -c`).
- `LC_ALL=C grep -c '[^ -~]' git-worktree.html` prints `0`.
- It is the only file in the folder (`ls -la`), and nothing was written anywhere else.

What the page holds:
- **Form.** One self-contained HTML file with inline CSS and JS and no external scripts or fonts. It uses a serif, Tufte-like single column, colour tokens on `:root` with a dark mode, and a print style that hides the quiz.
- **Title and subtitle.** The title is "git worktree". The subtitle ties the page to the work at hand: a plan step built in its own worktree and landed on main by a cherry-pick.
- **Body.** The same six sections as the explanation, with each claim carrying a superscript link to source 1 or 2.
- **Command sequence.** A short sequence: `git worktree add ../step-3`, `git cherry-pick ..step-3`, `git worktree remove ../step-3`. Under it, a note says it is put together from the commands of the two manuals and that the name `step-3` is made up.
- **Primary source.** A boxed "Read next" recommends the git-worktree manual as the one primary source.
- **Quiz.** A four-question quiz with feedback the moment an option is chosen; a right answer also shows a one-sentence reason taken from the sources. The options within a question have equal word counts and close character counts. The correct answer is at positions 2, 3, 1 and 2.
- **Follow-up line.** A line reminding the user to ask the agent follow-up questions.
- **Sources.** A numbered list of both sources, with anchors.

**Places where the skill's text left me without an instruction, disagreed with itself, or produced something wrong**

1. "The page" item 4 and "Explaining" item 3 disagree. "The page" item 4 asks for the page "in the lesson's form that 'Teaching' item 8 gives". Item 8 requires the page to be "directly tied to the mission" and "in the user's zone of proximal development", and outside a teaching workspace there is neither a mission nor a learning record.
   - My reading: I tied the page to the work at hand instead, and skipped the zone of proximal development.
2. "The page" item 4 says nothing on whether a page needs a task with feedback. Item 8 asks for "one tangible win", but the task and its feedback belong to "Teaching" item 6, which "The page" does not point to. Item 8 alone does not say whether the page needs a task.
   - My reading: I added the short quiz as the win, following item 6's rules for quiz answers.
3. "Explaining" item 3 says the knowledge comes "from the sources of item 2 alone". "The page" item 4 adds nothing on this, yet the lesson form invites a worked example.
   - My reading: I kept the example to commands found in the two manuals and labelled the made-up name.
4. "The page's path" stop (Stops table, "When" column: "outside a teaching workspace with no path given"). "The page" item 2 speaks of "the path the user gives", but the call syntax in Quick start and "The call", `/tutor explain <concept> --page`, has no place for a path. Outside a workspace this stop is therefore always reached.
5. "Explaining" items 3 and 4 do not say whether the path stop comes before or after the explanation is given.
   - My reading: I took the item order, the explanation first and then the stop, so the stop message carried the whole explanation.
6. The "Use instead" table names `/wait-what`, which is not among the skills installed in this session.
7. "Teaching" item 10 opens the lesson with a command, but "The page" has no step that opens the page or gives its path.
   - My reading: as the brief said, I opened nothing and give the path here.
