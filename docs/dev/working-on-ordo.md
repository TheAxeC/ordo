# Working on Ordo

While Ordo is being changed, the installed skills and agents must not change with it: the plan skills run the change, so they stay at a fixed version until the change is done. The installed skills and agents are links into a pinned checkout, a detached git worktree of the clone at a tag, and the clone's `main` is where the work happens.

```sh
git clone https://github.com/TheAxeC/ordo.git ~/workspace/ordo
cd ~/workspace/ordo
utils/pin.sh v1.1.0      # the worktree ~/.local/share/ordo-stable at v1.1.0, every skill and every agent linked from it
utils/pin.sh             # checks that every link points into the pinned worktree; changes nothing
```

`pin.sh` links the skills into `~/.claude/skills`, into the `skills` folder of each `~/.claude-*` folder that holds one, and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`, each folder once. Each entry in those folders is a link into the pinned worktree, and no folder is linked to another. A skill is linked under its own name to its folder in the pinned worktree, which is `skills/<group>/<name>` in a tag that groups its skills, `skills/<name>` in an earlier tag and `<name>` in `v1.0.0`. A tag that holds two skills of one name is refused, and nothing changes. `ORDO_SKILL_DIRS` replaces that list of folders. `pin.sh` links the agents into these `agents` folders, each once: `~/.claude/agents`, the `agents` folder of each `~/.claude-*` folder that holds a `skills` folder (one whose `skills` folder is a link to another skills folder included), and `$CLAUDE_CONFIG_DIR/agents` when that variable is set. With `ORDO_SKILL_DIRS` set it links the `agents` folder beside each folder the variable names instead. A `~/.claude-*` folder with no `skills` folder gets no `agents` folder. `ORDO_STABLE` moves the pinned worktree to another path.

Check mode, `utils/pin.sh` with no tag, changes nothing and fails on each link into the clone and on each link into the pinned worktree for a skill or an agent the pinned tag lacks. Pin mode, `utils/pin.sh <tag>`, checks the links first and refuses, changing nothing, a link into the clone for a skill or an agent the tag lacks. It then links every skill and every agent of the tag, replaces each link into the clone, and removes each link into the pinned worktree for a skill or an agent the tag lacks.

Moving to a new version is a tag on `main` and `utils/pin.sh <tag>`; going back is `utils/pin.sh <older tag>`. The pinned worktree is never edited, and `pin.sh` refuses to move one that has local changes. A pinned worktree deleted by hand is created again at the next `utils/pin.sh <tag>`, through `git worktree add --force`, which leaves the registration of every other worktree of the clone as it is.

`pin.sh` also removes the links into Ordo that it finds in `~/.agents/skills`. The head comment of `utils/pin.sh` states the rest: the layouts of a tag, the format of `ORDO_SKILL_DIRS`, what an agent of a tag is, the refusals, the rules for `~/.agents/skills` and the lines each mode prints.

`docs/dev/building.md` lists the tests and checks to run before a change is committed.
