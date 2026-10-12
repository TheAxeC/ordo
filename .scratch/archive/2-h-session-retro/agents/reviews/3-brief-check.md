# Step 3 brief check (on main at 0379c38)

This is the report of the brief-check agent from the `spec` skill's "Steps / The brief check", run on `.scratch/2-h-session-retro/agents/briefs/3.md` (uncommitted, in the working tree). I ran every command myself and changed no file in the repository: `git status --short` still prints only ` M .scratch/2-h-session-retro/plan.md` and `?? .scratch/2-h-session-retro/agents/briefs/3.md`. I ran `gen_figures.py` only on a copy under `$TMPDIR`, and that copy has been removed.

## 1. Names

- **The new terms.** Command: `git grep -n -i -e 'working folder' -e 'keep point' -e 'change point' -e 'sessions report' -- skills docs utils README.md`, with `skills/session-retro/` left out. It prints nothing. `grep -n -i -w window` over `skills/*/SKILL.md docs/dev/*.md`, with session-retro left out, also prints nothing. The glossary uses "place" in its ordinary sense (**finding** "with its place", **Step 0** "the place under a step", **worktree** "only place to work") and "point" inside **resume point** and in **Declined to judge**. The qualified headwords **place, of a point** and **window, of the transcripts** make none of these false.
- **The skill lists.** Command: `git grep -n -e 'plan-retro' -- skills docs utils README.md`, leaving out `skills/plan-retro/` and `docs/roadmap.md`. The hits outside the brief's paths are:
  - `skills/refute/SKILL.md:26`, `| What the reviews keep finding across plans | `/plan-retro` |`, in a Use instead table that also holds `/diagnose` at line 23.
  - `skills/plan-orchestration/SKILL.md:29`, the same row, in a Use instead table that also holds `/diagnose` at line 28.
  - The glossary entries **kind**, **retro**, **reviewer** and **standards**. They are about `plan-retro` alone, and the change does not make them false.

Findings:

1. **Two Use instead tables list `/plan-retro` beside `/diagnose` and are not in the paths.** They are `skills/refute/SKILL.md` (lines 23 and 26) and `skills/plan-orchestration/SKILL.md` (lines 28 and 29). The ruling "Step 3, the places the skill is named" states its scope as the places where "the tree lists the skills beside `plan-retro` and `diagnose`", but its own list of places leaves these two out, and so does the brief. There is a precedent: when 2.F step 2 wired in `diagnose` (`git show bdfa5e8 --stat`), it added rows to the Use instead tables of `refute`, `plan-orchestration` and `land`.
   - Close it one of two ways. Either add a row for `/session-retro` to both tables and add both files to "Paths this step writes", or have the brief say why these two tables stay unchanged.
   - Adding the two files widens the paths past the places the ruling lists. If the session judges that a change of scope, it is a stop.
2. **The skill uses "point" on its own, and the brief defines no entry for it.** `git grep -n -w -i point -- skills/session-retro | wc -l` prints 20. In the skill, a bare "point" means a keep point or a change point (for example Steps 6, "A behaviour seen again in a later part is a further place of its point"). `docs/dev/skill-layout.md`, "Writing for an agent", requires every term used in a sense of its own to have a glossary entry. The brief's premise lists **point** among the absent headwords, but item 5 adds no entry for it, and **place, of a point** then leans on a term the glossary does not define.
   - Close it one of two ways. Add **point, of a sessions report** ("a keep point or a change point"), or word the other entries so that none of them uses "point" on its own.

## 2. The step line

The parts of step 3's line (plan.md line 29), each with the item of "What to build" that serves it:
- The README skill table, Quick start and install loop: item 1.
- The `ordo-help` sequence and "Use instead": item 3.
- `plan-retro`'s "Use instead": item 4.
- The new terms in `plan-terms.md`, synced into `docs/glossary.md`: item 5.
- The check: "Cases", item 4 of "Verify before you report".
- The places the ruling adds (README line 7, the figure, the alt text, the template glossary's line 3): items 1, 2 and 5.

Every part has an item. Below are the items that cannot be built as written.

Findings:

3. **The window draft is wrong for an open plan.** The draft in `2-report.md` says the window ends "one second after its last commit". `skills/session-retro/SKILL.md` Steps 1 says something different:
   - The end is one second after the latest commit that touches the folder under either root, or the time of the run when the folder is still under `<ledger_root>/`.
   - For `session <session id>` "there is no window".
   - The reader's head comment (`transcript_window.py:10`, `start <= its timestamp < end`) makes the window half-open.
   - The brief hands the builder the draft and asks it to "check" it. The entry's final text should be written in the brief. A suggested text: **window, of the transcripts**: "the two times the reader takes, the start included and the end left out; for a plan, from the committer time of the commit that added its `plan.md` to one second after the latest commit that touches its folder, or to the time of the run while the plan is open. A run for one Claude Code session has none. Stated in: `session-retro`, Steps 1 and "The reader"."
4. **Other drafts in "Terms for step 3" miss parts of the skill as it landed.**
   - **keep point**: the draft says "the proposal that makes it repeat". Steps 9 says a keep point "names the text that produced the behaviour, or, when no text did, gives the sentence that would make the behaviour repeat". The draft leaves out the first branch.
   - **place, of a point**: the draft leaves out that a place is identified by the reader's id and line. Steps 6 notes a place as `<id> <line>`, and Steps 7 matches places to earlier decisions by id and line. It also leaves out that Steps 8 cuts a long text at a sentence end and marks it `...`. Its "Stated in" should name Steps 6 to 8.
   - **sessions report**: the draft holds up against Steps 5 and `templates/sessions.md`. Other entries already use the form "Stated in: `<skill>`, `templates/<file>`" (for example **brief** and **configuration block**).
   - **working folder**: the draft holds up against Steps 3 and 12 (`mktemp -d "${TMPDIR:-/tmp}/session-retro.XXXXXX"`). The folder also holds the `.err` files and the folded `line-<n>.txt` files of Steps 6.
   - The Steps numbers in the drafts (1, 3, 5, 6, 8, 9, 12) match the skill as it stands.
   - The brief's parenthesis "(the part bound is 30,000 bytes ...)" applies to none of the six drafts.
   - Writing the six entries is choosing a vocabulary. The brief should give their exact texts rather than have the builder write them.
   - Alphabetical positions in `plan-terms.md`: **change point** goes between **cause not found** and **Closed**; **keep point** before **kind**; **place, of a point** between **pause** and **plan**; **sessions report** after **session, the**; **window, of the transcripts** after **wip**; **working folder** between **worker** and **worktree**.
5. **The figure change does not fit as the brief describes it.** The row is 990 px wide (x 25 to 1015). The box height 150 is hard-coded three times in `pipeline_svg`: the boxes (`Rect(..., 150)`), the canvas height (`side_top + 150 + 68`) and the legend's position (`side_top + 176`). The brief allows the canvas to grow only "if a second row is needed".
   - **Arithmetic from `draw_box`.** The body budget is `int((w - 20) / 6.9)` characters, and the names sit on a 14 px leading. The new body is 88 characters. It takes 2 lines only when the budget is at least 46 characters, which needs w >= 338. In 2 lines the last stop name's baseline reaches y+140, just inside the y+142 limit. At 3 lines the second stop sits at y+155, which is past y+142.
   - **Width.** The other three boxes need about 200 (`/plan-retro`, 3 body lines), about 172 (`/ordo-help`) and about 276 (`/diagnose`, 2 body lines) at height 150. With the 80 px of gaps, 338 + 200 + 172 + 276 + 80 = 1066, which is more than 990. At equal widths, a 3-line body forces a box height of at least 178.
   - **Run on a `$TMPDIR` copy.** Four boxes at x 25, 272.5, 540 and 787.5, width 227.5 and height 150, exit 1 with `error: pipeline.svg: box '/session-retro': the label 'A large output' does not fit the box`. The same four boxes at height 180, with the canvas at `side_top + 180 + 68` and the legend at `side_top + 206`, exit 0. The unequal widths 200/338/172/280 end at x 1095, past the canvas.
   - **Fix.** Write the layout into the brief: one row of four boxes at those x positions, width 227.5 and height 180, the canvas height and the legend's y derived from the box height, and the "AT ANY POINT" caption moved to x 540. Or have the brief choose a second row. As it stands, the builder has to pick the layout.
6. **The "only when" mark for "The proposals" does not follow from the skill's Stops table.** `session-retro`'s Stops table gives the row's When as "Steps 10, each proposal", with no condition. The glossary's **mark, of a figure** says "only when" is for a stop that waits "only when its condition occurs", and "every run" is for one that waits "each time the skill runs". `plan-retro`'s row does carry a condition ("Every retro with a recurring kind, at Steps 10"), which is why its figure box marks it "only when".
   - Close it one of two ways. Mark the new box's stop "every run" (and "A large output" "only when"), or state the condition that makes it "only when" (a run with at least one point).
7. **Three texts are narrower than the skill.**
   - README line 7, as the brief words it: "proposes rule changes". The skill proposes a change to "a named rule, skill or brief", and it also proposes for keep points (description, Steps 9).
   - The Quick start and sequence text "after a plan has run", and the figure caption "AFTER PLANS HAVE RUN" over the new box: the `<entry>` form also runs on an open plan, whose end is "the time of the run" (Steps 1).
   - The brief should give wording that matches the skill, for example "for a plan, open or closed: what went well and what went wrong in its Claude Code sessions, each with a proposed change". It should also say whether the box stays under the "AFTER PLANS HAVE RUN" caption.
8. **The brief's own decisions are not booked in plan.md.** "Decisions taken in this brief" 1 (the Quick start names only the `<entry>` form) and 2 (no version change) are choices the user would see. The ruling "Overnight work applies to this plan" says such a decision is "taken as the recommended option and booked here", meaning in plan.md's Rulings. `grep -n "Quick start" .scratch/2-h-session-retro/plan.md` finds no ruling for either. The same goes for the choices findings 1, 5 and 6 lead to, once they are made.

## 3. Premises

Each premise of "What is on the tree", with the command I ran and whether its output matches the brief:
- **Step 3's line.** `sed -n 29p .scratch/2-h-session-retro/plan.md` matches the brief's quote. The ruling "Step 3, the places the skill is named" is present in the working tree's plan.md.
- **`skills/session-retro/SKILL.md`.** `cat -n`: the Quick start is at lines 15 to 17 with the three forms, and the Use instead table is at lines 24 to 26 (`/plan-retro`, `/diagnose`, `/ordo-help`). Matches.
- **README.** `grep -n "plan-retro\|diagnose" README.md` prints line 7, line 24 (the last row of the table, confirmed by `sed -n 11,25p`), lines 46 and 47, line 54 (the alt text, which contains "with the optional /plan-retro, /diagnose and /ordo-help beside them") and line 98 (`... repo-setup roadmap spec; do`). The fence scan puts the text column at 31 on lines 29 to 47. Matches.
- **`gen_figures.py`.** `grep -n "def pipeline_svg"` gives line 400. The side row is `Rect(25, side_top, 330, 150)` `/plan-retro`, `Rect(395, side_top, 300, 150)` `/ordo-help` and `Rect(715, side_top, 300, 150)` `/diagnose`, with the captions at x 25 and 395. The description runs over lines 410 to 413, and the phrase with `/plan-retro` is on line 412. The docstring names the side row at lines 5 and 6.
  - On a `$TMPDIR` copy, the script run under `python3` (3.13.4) and under `/usr/bin/python3` (3.9.6) exits 0 both times, and `cmp` shows both SVGs byte-identical to the repository's.
  - The ruff check and format commands of Verify 2 print `All checks passed!` and `1 file already formatted`.
  - `rsvg-convert` is at `/opt/homebrew/bin/rsvg-convert`.
- **`ordo-help`.** Its description (line 3) lists "open, spec, build, refute, diagnose, close, land" and does not name `/plan-retro`. The Use instead table ends with `/plan-retro` at line 26. The sequence has `/plan-retro` at line 84 and `/diagnose <symptom>` at line 85, with the text at column 31. Matches.
- **`plan-retro` Use instead.** It has two rows, `/refute <entry> <step>`, then `/land`, and `plan-orchestration`'s recurring-findings pass. Matches.
- **`plan-terms.md` and the glossaries.** `wc -l` prints 109 for `plan-terms.md`. The entries are alphabetical, ignoring case and punctuation, and **case, of a diagnosis** is at line 15. `sed -n 3p` of the template glossary names "the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `repo-setup` and `ordo-init`". `docs/glossary.md` line 3 names no skill. Matches.
- **The absent terms.** `grep -n "\*\*<term>"` for each of the seven headwords, over both files, prints nothing. **session, the** is at `plan-terms.md:89`. Matches.

Findings: none.

## 4. Cases and checks

Each case of "Cases", read against the rules file and the standards:
- **README grep and column 31.** Consistent with change-standard rules 7 and 14, but its command is not given (finding 10).
- **Figures.** Consistent with rules 6 and 14.
- **Use instead rows.** Consistent with `docs/dev/skill-layout.md`, "Sections, in order", row 3.
- **Sync and "Stated in".** Consistent with "Writing for an agent".
- **Descriptions.** Consistent with "Frontmatter", whose command I reran: it prints 396, 616 and 779 for `ordo-help`, `plan-retro` and `session-retro`.
- **ASCII.** Consistent with rule 10. `LC_ALL=C grep -c '[^ -~]'` prints 0 for all nine paths.

Findings:

9. **The brief says every case fails on the unchanged tree, and several do not.** The Cases introduction says each case's "first run on the unchanged tree shows it does not yet hold". On the unchanged tree:
   - `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, rc=0.
   - The generator exits 0 with the same bytes under both Pythons, `plan-loop.svg` compares equal, and the title equals the alt text.
   - The three descriptions are all at most 1,024 characters.
   - The ASCII grep prints nothing.
   - The existing Use instead rows already differ from one another.

   Change-standard rule 13 expects checks of a preserved property to pass on the unchanged tree. The brief's "When the first run finds a case the brief's own rules get wrong, the builder stops there" can therefore send the builder back at its first run for no reason. The fix is for the brief to name, for each case, the part that fails now and the parts that hold throughout.
10. **The column-31 case gives no command, and a scan "over each fence" catches other fences.** A scan over every fence also finds the README fence at line 133, whose text column is 67, and `ordo-help`'s Quick start fence, whose text column is 23 (my awk over each file's fences). The brief should give the command, limited to the README fence at lines 28 to 48 and `ordo-help`'s sequence fence at lines 48 to 86.

## 5. The question

"The goal" here is the part of plan.md's Goal that step 3 delivers: a reader of the README, the figure, `ordo-help`, `plan-retro` and the glossary learns that `session-retro` exists and what its terms mean.

- **The step line's check, `sync_rules.py ... --only glossary` exits 0.** Yes, it could pass without the goal: it passes now, before any term is added.
- **Case 4's second half ("each new entry's Stated in ...").** It fails only when an expected entry is missing, and it states no count.
- **The Use instead case.** Yes, it holds now, before any row is added.
- **The figure case.** No: reading the render tells whether the box is there.
- **The README grep case.** No: it prints nothing now.
- **Items 1 to 4.** No: each is checked by reading the text in place, with the greps.

Findings:

11. **The glossary check and the Use instead case can pass with nothing added.**
    - Add to the glossary case that each of the six headwords (seven, if finding 2 adds **point**) prints exactly one line from `grep -n '^- \*\*<term>\*\*'` in `skills/repo-setup/templates/plan-terms.md` and in `docs/glossary.md`. That count fails on the unchanged tree.
    - Add to the Use instead case that the `session-retro` row exists in both tables: `grep -n 'session-retro' skills/ordo-help/SKILL.md skills/plan-retro/SKILL.md`.

## 6. Implied inputs

This is not a code step. The change to `gen_figures.py` is labels and coordinates; its inputs, its errors and its exit statuses stay the same.

Findings: none.

## Declined to judge

- Whether leaving the `ordo-help` and `plan-retro` versions unchanged (the brief's Decision 2) is right. `docs/dev/skill-layout.md` says only where the version lives and sets no rule for when it is raised. The precedent the brief cites holds: `bdfa5e8` changed `skills/ordo-help/SKILL.md` and left `version: "1.8.3"`. The call is the user's.
- Whether the qualified headwords **place, of a point** and **window, of the transcripts** count as a vocabulary choice the user owns. The step line approves "new terms" but does not name them.
- How the new README row and line 7 read as prose once written. That is judged by reading the result, not the brief.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1: item 4 adds a `/session-retro <entry>` row after the `/plan-retro` row of the "Use instead" tables of `refute` and `plan-orchestration`; both files are in the paths, and the ruling "Step 3, the places the skill is named" names them.
- 2: item 6 adds **point, of a sessions report** ("a keep point or a change point").
- 3: item 6 gives the entry **window, of the transcripts** word for word: half-open, the plan's end one second after the latest commit or the time of the run while the plan is open, none for one Claude Code session.
- 4: item 6 gives all seven entries word for word, each with its alphabetical place: **keep point** with both branches of Steps 9, **place, of a point** with the id and line, the cut at a sentence end and the leaving-out of Steps 7, stated in Steps 6 to 8; **working folder** with the error files and the folded lines; the parenthesis on the part bound is gone.
- 5: item 2 gives the layout: one row of four boxes of width 228 and height 180, 26 apart, at x 25, 279, 533 and 787, the height one name that the canvas height and the legend's y are written from; the premise quotes the brief check's run at 150 and at 180.
- 6: the `/session-retro` box marks "The proposals" every run and "A large output" only when, as its Stops table gives them (Decision 4).
- 7: README line 7 and the Quick start and sequence text say what the skill does for a plan open or closed and that it proposes a change to a named rule, skill or brief; the box stands under "AT ANY POINT", which moves to x 279.
- 8: the brief's decisions are booked in `plan.md` as the ruling "Step 3, the brief's choices".
- 9: each case says which part fails on the unchanged tree and which parts hold throughout.
- 10: the column case gives its `awk` command over the README's first fence and `ordo-help`'s second, run on the unchanged tree, where it prints nothing.
- 11: the glossary case counts each of the seven headwords in both files (0 now, 1 after), and the Use instead case greps the four tables for `session-retro`.

Brief-check agent usage (from its completion notice and transcript): claude-opus-5-5, 150427 tokens, 35 tool uses, 395 s, $1.34 to $3.86.

Agent usage: about 33 tool uses. I do not know my own token count or elapsed time; the session fills them from the completion notice.
