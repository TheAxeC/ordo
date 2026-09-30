# Repair round 1 of step 14b

The review is `.scratch/2-e-grill/agents/reviews/14b-refuter.md`. Items 1 and 2 hold as dictated; C5 is partial; the findings are on the dictated text. Each finding below is sent back with its ruling. Work in the same worktree under the same brief, the rules file and the standards; change nothing else. Each text below is written exactly as given, with the indent its place states. Line numbers are those of the worktree now.

1. Spec 1, Spec 2, Spec 3, Spec 4, Spec 5, Standards 1 and Behaviour 1, all in item 4's sub-bullets: the process refuses every fetch and every read outside its folder; `modelUsage` holds a helper model's key once a fetch runs; the input's own ledger holds the gate, the skill names and "wins or ties", and a diff with the whole skill text; the process loads the user's global instructions; several bullets join rules; copying a whole sources repository costs 26G per judge. Lines 9 to 16 (the eight sub-bullets under item 4) are replaced by these lines, at three spaces:

   ```
      - The judge receives no file of either skill being compared.
      - A file of a skill is each file of its folder, and each other file that holds the skill's text whole or in most part, such as a diff that adds it or a copy under another name.
      - The orchestrator removes the files of both skills from the judge's copy of the input.
      - The orchestrator removes from the judge's copy the ledger of each plan that builds or changes either skill.
      - The orchestrator keeps, in a file of its own in that ledger's place, the bullets of its Rulings that name the input's entry.
      - The orchestrator removes from the judge's copy every other line that states the comparison's gate, names the comparison, or says which output is expected to win.
      - The orchestrator copies into the judge's copy each file or folder the input names as a source.
      - A repository is copied whole only when the input names the repository and no path inside it.
      - The orchestrator copies into the judge's copy each file an output cites that is outside the copy, except a file of either skill.
      - The orchestrator removes the files of both skills from each copied source and cited file.
      - The judge runs as its own process, not as an agent the orchestrator's runner starts.
      - The judge's process starts in its copy of the input.
      - The judge's process lists and loads no skill.
      - The judge's process may fetch a URL, and has no other permission beyond reading its copy.
      - The judge's process runs on the model the configuration's `reviewer` names, such as `claude -p --disable-slash-commands --allowedTools WebFetch --model opus --output-format json`.
      - The judge's served model is the key of the process's `modelUsage` with the most output tokens.
      - The judge's process loads the user's global instructions, which are part of what the user needs.
      - The orchestrator tells the judge to judge each output by what the input and its user need.
      - The orchestrator tells the judge that no skill's text, wherever the input quotes it, is the standard.
      - Neither instruction names a skill or says which output is expected to win.
      - The judge may fetch a URL an output cites, to check that it resolves and says what the output claims.
      - The judge opens no file outside its copy of the input.
   ```

2. Standards 2, item 7 against the judge now being a process: in line 19, `A fresh agent makes each judgment, so the second judge has no memory of the first.` becomes `A fresh judge process (item 4) makes each judgment, so the second judge has no memory of the first.`; the rest of the line is unchanged.

3. Item 9's record, to match: lines 23 and 24 are replaced by these lines, at three spaces:

   ```
      - each path removed from the judge's copy, and each line removed from a file of it (item 4), or "none";
      - each file and folder copied into the judge's copy (item 4), or "none";
      - each judge's command, every key of its `modelUsage`, and the global instruction files it loaded (item 4);
   ```

## Cases

Walk each on the changed page, each step with the line it follows as `grep -n` prints it; inputs read from the main checkout with `git show`-free reads (the builder runs no git command: the tree at 833e2e8 is described below from the review).

- C1 again: step 14's input, the Ordo tree at 833e2e8. Removed: `skills/grill/`; the ledger `.scratch/2-e-grill/` (the plan that builds `grill`), with the bullets of its Rulings that name entry 3 kept in a file of their own (among them "Entry 3 and step 13"); the gate line of entry 2.E in `docs/roadmap.md` ("a blind comparison ... against mattpocock's `grill-with-docs` on the same entry, wins or ties"). `12-round-0.diff`, `12-report.md` and `9a-report.md` go with the ledger. The judge is not told the gate, and reads no whole copy of grill's text.
- C5 again: side 1 cites `https://docs.vale.sh/topics/styles.md`: the judge fetches it. An output cites `research-hub/projects/manuscripts/bttn-incident-af/main.tex`: the orchestrator copies that file into the judge's copy.
- C7: step 14's input names research-hub paths as entry 3's sources: those paths are copied, not the 26G repository.
- C8: a run that fetches a URL: `modelUsage` holds the reviewer model and a helper model; the served model is the key with the most output tokens, and the record lists both keys.
- C9: the judge's process loads `~/.claude/CLAUDE.md` and the files under `~/.claude/rules/`: they are part of what the user needs, and the record names them.

## Checks

Run from the worktree's root and quote each with its output. You run no git command and start no `claude` process.

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` ends `checks: 10 commands passed`, exit 0.
2. Each new or changed line above is in the file once (`grep -c -F -x -f` over a scratch file holding the line under `$TMPDIR`), and none of the lines replaced is left.
3. `diff -U2 /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md docs/dev/blind-comparison.md` shows only the changes of the step and this round, at their indents.
4. `LC_ALL=C grep -n '[^ -~]' docs/dev/blind-comparison.md` prints nothing.
5. The walk of C1 to C9 on the changed page.

## Report

Append a section "Repair round 1" to `.scratch/2-e-grill/agents/reviews/14b-report.md` in the worktree: per ruling, the change made with its before and after, then each check with its command and output verbatim, then anything not done. Quote a grep as it printed, whole.
