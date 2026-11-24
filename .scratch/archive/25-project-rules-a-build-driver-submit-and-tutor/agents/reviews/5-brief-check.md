# Brief check of step 5 (the skill `tutor` and the group folder `skills/explain/`)

All commands were run read-only from `/Users/axelfaes/workspace/ordo`. Main is now at `bacb674`, not at `ed4e961`, the base the brief names (`git log --oneline -5` printed `bacb674 Prepare step 2 ...`, `1a99aed Land step 1 ...`, `ed4e961 ...`). `git diff --stat ed4e961 bacb674` shows that the step's files did not change between the two. Of the pages the brief points at, only `docs/dev/change-standard.md` changed: rules 6 and 16 gained the "every target in scope" and "YAML loaded after every write" sentences. The brief's base line should name `bacb674`.

## 1. Names

The commands were:
- `grep -rn 'wait-what' --exclude-dir=.git --exclude-dir=.scratch . | grep -v '^./docs/adr/\|^./docs/roadmap.md'`
- `grep -rnE 'skills/ordo\b|skills/ordo/|four group|twenty-one|21 skills|group folder' ... README.md utils docs/dev docs/figures docs/glossary.md docs/plan.yaml skills agents CLAUDE.md`
- `grep -rniE 'twenty|\b2[0-2] skills|four groups|four folders|group folders' ...`
- `grep -rn 'tutor\|skills/explain\|explain/' --exclude-dir=.git --exclude-dir=.scratch --exclude-dir=.agents .`

Hits outside "Paths this step writes":

- `docs/figures/gen_figures.py:2296` (and the generated `docs/figures/pipeline.svg:108`): "These start no agent: /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro, /wizard, and /wait-what and /ordo-help, which have no stop."
  - The move does not make it false, because it names commands, not paths.
  - The list holds exactly the skills that start no agent. `tutor` starts no agent and has stops, so after the step the sentence is incomplete, and so false.
  - The brief covers this only in general terms (item 8, "Doc text"). It does not say that this note is made false or what label to write, for example "/session-retro, /wizard, /tutor, and /wait-what and /ordo-help, ...".
- `README.md:171`: "The loop copies each of the twenty-one skills ...". The step makes this false.
  - Item 6 says "the count of skills raised by one", in the singular.
  - The premise names "twenty-one" only as the count beside the group sentence, but the brief's own grep prints it on two lines, 35 and 171.
  - Item 8's grep for `twenty-one` would find it, but the brief does not name line 171.
- `README.md:25`, `:35` and `:160`: all made false. The brief names them (items 6 and 8).
- `docs/roadmap.md:80`, `docs/adr/0045-*`, `docs/adr/0048-*` and `docs/adr/README.md:54`: left as they are, as the brief says. Their history holds.
- Not made false (each checked):
  - `utils/pin.sh` is generic over `skills/<group>/<name>` (header lines 21-28; `ln -sfn` at 472). It names no real group and no count.
  - `utils/pin.test.sh` uses only scratch groups. `grep -nE 'ordo|wait-what|explain|orchestration|academic' utils/pin.test.sh` hits only `ordo-stable`, `ordo-a` and `ordo-b`, which are fixtures.
  - `docs/dev/*`: only generic `skills/<group>/<name>` text and `skills/ordo/ordo-init` paths, which do not move.
  - `skills/ordo/ordo-help/SKILL.md`: the `skills` mode walks the group folders at run time (line 39). Its tables name no `wait-what`.
  - `skills/ordo/ordo-init/`: the hits are the "group folder beside this skill's group folder" search and the `skills/ordo/ordo-init` paths, which do not move.
  - `agents/`: no hit.
  - `docs/figures`: no other hit.
- The brief's item 8 names `skills/ordo/session-retro/` and "other skills that name wait-what under Use instead". No such skill exists: the grep finds `wait-what` in no `SKILL.md` other than its own. The brief's Read item 4 also says `session-retro` shows "the form of a skill only the user invokes", but `grep -rln 'disable-model-invocation' skills` prints only `skills/ordo/wait-what/SKILL.md`. That premise is wrong.
- `tutor`, `skills/explain` and `explain/` appear today only in `docs/roadmap.md`, ADR 0048 and `docs/adr/README.md`. None of these is false after the step.
- The count of group folders, "four group folders", appears only in `README.md:35`, which the brief names. `ls skills` prints `academic code orchestration ordo`.
- Outside the main checkout, `ls -la ~/.claude/skills/wait-what` prints a link to `~/.local/share/ordo-stable/skills/ordo/wait-what`. `pin.sh` replaces it on the next pin ("A link into the pinned worktree at a skill's place in another layout is replaced"), so no file in the tree changes for it.

## 2. The step line

The parts of the plan's line for step 5, each with the brief's requirement:
- "`skills/explain/tutor/` holds a copy of mattpocock's `teach`" -> items 1 and 2.
- "with the differences of ADR 0048 and rulings D2, D7 and D11 (the name, `/tutor explain <concept>` and `--page`)" -> items 1, 3 and 4.
  - Ruling D7 does not exist. The Rulings section holds D1, D2, D3, D4, D6, D9, D10, D11, D12, D13, D14, D15 and D16. `grep -rn '\bD7\b' .scratch/25-.../ docs/roadmap.md docs/adr/0048*` hits only the step line and the brief.
  - The brief repeats "D7" under "What is on the tree" with no content. No requirement can serve that part, and a reader cannot tell what ruling was meant. The orchestrator should correct the reference in the plan and the brief, or find the ruling.
- "`skills/ordo/wait-what/` is moved to `skills/explain/wait-what/`" -> item 5.
- "`README.md` names both and the group folder" -> item 6.
- "`deviations.md` in this ledger lists every deviation ..., each with its reason and the ruling that approved it" -> item 7.
- "check: `deviations.md` is read against both skills and nothing else differs" -> Verify 6 and the first case.
- "and `grep -rn 'skills/ordo/wait-what' ...` prints no line outside `docs/roadmap.md` and `docs/adr/`" -> a case and Verify 4.
- "(1 commit)" -> no requirement. This is the orchestrator's part.

Item 7 cannot be delivered as briefed, because the builder writes `deviations.md` under the ledger:
- `docs/dev/change-standard.md`, "Where the work happens", says "Nothing under the ledger folder is edited except the report the brief names".
- `skills/orchestration/plan-orchestration/SKILL.md` Steps 4, "The builder", says "In the ledger it writes only its report".
- `skills/orchestration/land/templates/land.sh`, lines 10-11, says "A ledger file left uncommitted in the worktree (a builder's report, any other ledger copy) never reaches main". The worktree is then removed with `--force` (`land` SKILL.md line 225).
- So `deviations.md` would be lost at landing, unless the orchestrator copies it into the main ledger. The brief says neither that the orchestrator copies it nor that the rules file is set aside for it, and its opening sentence says the rules file governs "unchanged".

## 3. Premises

Each command of "What is on the tree", rerun:
- `ls -R .scratch/25-.../sources/teach`: the seven files the brief lists. Holds.
  - `LC_ALL=C grep -n '[^ -~]'` over the copies prints nothing, so the copies are ASCII.
  - That the originals held the two characters cannot be checked without the web. See "Declined to judge".
- `grep -n '^#' .../sources/teach/SKILL.md`: lines 10, 22, 34 `### Fluency vs Storage Strength`, 47, 63, 71, 81, 91, 99, 112, 122 and 138.
  - The brief's list leaves out the subsection `### Fluency vs Storage Strength`. The premise is incomplete, and since the first case is "each heading", the builder should be told about it.
  - Frontmatter (`sed -n '1,6p'`): `name: teach`, `description: Teach the user a new skill or concept, within this workspace.`, `disable-model-invocation: true` and `argument-hint: "What would you like to learn about?"`. Holds.
- `ls skills skills/ordo skills/ordo/wait-what`: `academic code orchestration ordo`; `ordo-help ordo-init session-retro wait-what`; `SKILL.md`. Holds.
  - `grep -n 'version' skills/ordo/wait-what/SKILL.md` prints `5:  version: "1.0.0"`.
- `grep -n 'wait-what\|four group folders\|twenty-one' README.md`: lines 25, 35, 160 and 171.
  - The brief describes 25, 35 and 160 and "the count", but the count is on both 35 and 171. Partly holds.
- `grep -n 'wait-what' docs/figures/gen_figures.py`: `2296: "/session-retro, /wizard, and /wait-what and /ordo-help, which have no stop. ..."`. Holds.
- `grep -n 'disable-model-invocation' docs/dev/skill-layout.md`: line 22. Holds.
- ADR 0048: the quoted decision matches the file. Holds.
- Rulings D2, D11, D12 and D13 exist and match. D7 does not exist (see check 2).
- The Read list's claim that `session-retro` shows the form of a user-only skill is wrong (see check 1).

## 4. Cases and checks

The command cases, run on the unchanged tree:
- `grep -rn 'skills/ordo/wait-what' README.md docs skills utils agents` prints only `docs/roadmap.md:80:- [x] 18. wait-what and wizard: ...`. The case's expected result already holds on the unchanged tree (see check 5).
- `sh utils/pin.test.sh 2>&1 | tail -1` prints `PASS: pin.sh scratch tests`.
  - This case asks the builder to check a place the step does not change. The test builds a scratch repository (`repo=$test_root/ordo`, line 103) and never reads this tree.
  - Verify 1 is the same check.
- `diff <(git show HEAD:skills/ordo/wait-what/SKILL.md) skills/explain/wait-what/SKILL.md` prints `diff: skills/explain/wait-what/SKILL.md: No such file or directory` and exits 2, as expected before the step.

Verify commands run as written:
- `test ! -e skills/ordo/wait-what; echo "exit $?"` prints `exit 1`.
- `grep -c 'explain/tutor' README.md` prints `0`; `grep -c 'explain/wait-what' README.md` prints `0`.
- The yaml command prints `FileNotFoundError: ... 'skills/explain/tutor/SKILL.md'`.
- The character-set check (Verify 2) fails as worded on the step's removed file. With a missing path in its list it prints `Can't open skills/ordo/nonexistent.md: No such file or directory.` and exits 0. "The files the step changes" includes the removed `skills/ordo/wait-what/SKILL.md`, so the check will print a line. It should be given the files that exist after the change, as `docs/dev/building.md` filters them.

Reading cases held against the rules file and the standards:
- Missing case under `docs/dev/change-standard.md` rule 15: "Each place where a supplied value reaches a command, a path or generated text is a case". `<concept>` reaches the file name of the page under `reference/`, and a path the user gives reaches a write. The brief has no case for either: no concept with a `/` or `..`, and no case for a given path.
- Missing case for the source's call with no topic. The source carries `argument-hint`, and in "Zone Of Proximal Development" it says "The user may specify an exact thing they want to learn. If they don't, figure out their zone of proximal development by reading their learning-records".
  - The brief lists only `/tutor <topic>` and has no case for `/tutor` with no topic, or "next lesson", in a workspace that has learning records.
  - That run is the part of the goal "learning records from which the next lesson is chosen".
- Missing cases on how the argument is read:
  - `/tutor explain` with no concept;
  - `--page` without `explain`;
  - `/tutor explain <concept> --page` outside a workspace with a path given.
- No case reads the README install loop against the tree. A wrong path there breaks an installation, which `docs/dev/change-standard.md` "Scripts compute facts" names as a cost. A command such as `for s in <loop list>; do test -f skills/$s/SKILL.md || echo $s; done` would compute that fact. Its absence is a gap in the cases, not a contradiction of the rules.
- Item 8 asks the builder to check `utils/pin.sh` and its test, `ordo-help` and `session-retro` for group lists and counts. None of them is changed by the step (check 1). This is a check of places the step does not change, and harmless.
- The stops. The layout (`docs/dev/skill-layout.md`, "Sections, in order" row 7) requires a Stops table, and a stop is "any point in a skill's Stops table where it waits on the user" (`docs/glossary.md`, "stop"). Item 3's "writes it only on the user's yes" and item 4's "asked for" are both such stops. The brief names only the source's two stops and has no case that the Stops table holds the offer of a learning record and the question for the path.
- No other case is inconsistent with the rules file or the standards.

## 5. The question

Could each case and check pass without the goal being reached (the goal here being a copy of `teach` as `tutor`, with the explain mode and its page, the move, and every deviation listed)?

- The step line's grep: yes. It already passes on the unchanged tree (check 4 output). It also never matches README's loop entry `ordo/wait-what`, which is written without `skills/`.
- The step line's reading of `deviations.md` against both skills: no, as a text check. The plan already records that the step check cannot show that a lesson is written and the next one chosen; step 6 does that.
- `pin.test.sh` (case and Verify 1): yes. It never reads this tree.
- The `diff` case: no for the move, since it fails until the file exists in `skills/explain/wait-what/`. Alone, it does not show that the old folder is gone; Verify 4's `test ! -e` does.
- Item 1, the yaml check (Verify 3): yes. It passes with the right frontmatter and any body. The content rests on the first case, "each heading", which reads both texts. Against that case: no, provided the case also covers the `###` subsection and the frontmatter key `argument-hint`.
- Item 2, the format pages: only the first case reads them. Yes for the glossary format page, which the source's `SKILL.md` never links (see check 6). A reader can find its content copied while the skill never uses it.
- Item 3 (explain mode) and item 4 (`--page`): the reading cases. No for the text, though the path and concept cases of rule 15 are missing.
- Item 5: no, by `test ! -e` together with `diff`.
- Item 6, `grep -c 'explain/tutor'` and `grep -c 'explain/wait-what'` printing 1 or more: yes. A mention in the group sentence alone satisfies both without the install loop entry, and nothing checks the count on line 171.
- Item 7, `deviations.md` read against both skills: no as a reading. But the file never reaches main under the current landing (check 2), so the plan's goal ("the plan's ledger lists every deviation") is not reached even if the check passes in the worktree.
- Item 8: no check of its own beyond the grep, and the grep passes already.

## 6. ADRs

The ADRs were listed with `for f in [0-9]*.md; do head -1; grep -m1 -i '^Status'; done`. Then `grep -ln 'group folder\|install loop\|for skill in\|skills/ordo\b\|disable-model-invocation\|copy is a copy\|skill-layout' docs/adr/[0-9]*.md` found 0002, 0026, 0038, 0043, 0045, 0047, 0048 and 0051, each read at its matching lines.

ADRs the step touches:
- ADR 0048 (proposed, in force), named by the brief. "`tutor` is a copy of the source's `teach`: its workspace files, its format pages, its lesson form and its two stops are the source's."
- ADR 0045 (proposed; superseded by 0046 only for `wizard`). The step moves `wait-what`, and the decision it is under is "Only the user invokes `wait-what`: its frontmatter holds `disable-model-invocation: true`" together with the Consequence "A change that adds an instruction to `wait-what` ... contradicts this record". The brief does not name ADR 0045. Item 5 is consistent with it.
- ADR 0012 (proposed). "The landing commit takes its paths from `git diff --cached --name-only --no-renames`, so a rename's old path is named too." This covers the move at landing. The brief lists both paths, which is consistent, and the ADR is a landing concern.
- No other record touches the step. 0002 and 0026 govern the writing skills and manuscripts; 0038, 0043, 0047 and 0051 match only on generic layout or group-folder text.

The brief held against ADR 0048 point by point:
- "Only the user invokes it": item 1 and a case. Holds.
- "the sections and the frontmatter of skill-layout, ASCII, the prose standard applied to the skill text, and no `agents/openai.yaml`": item 1, and the paths leave `openai.yaml` out. Two gaps:
  - **`argument-hint`.** The layout's frontmatter block (`docs/dev/skill-layout.md`, "Frontmatter") has no `argument-hint`, and the brief does not say whether the key is dropped as forced by that point or kept. Dropping it changes what the user sees when typing `/tutor`.
  - **The format pages and the prose standard.** The prose standard holds "Every prose surface in this tree" (prose-standard.md, first paragraph), and ADR 0048 applies it to "the skill text". Item 2 keeps the format pages' content unchanged apart from ASCII. Those pages carry text the standard bans, for example GLOSSARY-FORMAT.md "Define what the term IS, not what it does" (F, no ALL-CAPS emphasis; D, binary contrast). The brief takes one reading of "skill text" without stating it as a decision or routing it to `deviations.md`.
- "the name `tutor`": Holds.
- "the mode `/tutor explain <concept>` ... from sources fetched in the run and named in the answer ... writes no file ... offers a learning record": item 3. Holds.
  - The brief adds "writes it only on the user's yes" and the recognition of a teaching workspace by `MISSION.md` (decision 2). Both are readings of the ADR, not additions.
- "`--page` ... to `reference/` in a teaching workspace and elsewhere to a path the user gives or is asked for": item 4. Holds.
- "`tutor` and `wait-what` stand in the group folder `skills/explain/`": items 5 and 6. Holds.

The brief held against the rulings:
- D2: holds.
- D7: does not exist (check 2).
- D11: holds.
- D12: holds. Item 6 keeps `session-retro` in `skills/ordo/`.
- D13: holds.

Parts of the source the brief drops or leaves undecided, from reading the source's `SKILL.md` heading by heading:
- **The call with no topic.** The source's invocation `/teach` takes an optional request: `argument-hint`, and "The user may specify an exact thing they want to learn. If they don't, ...". The source page `docs-teach.md` adds "re-invoking `/teach` in a new session", with "next lesson" as common use. The brief's call list, `/tutor <topic>`, makes the topic look required and names no call that continues a workspace. That would drop a part of the source.
- **The glossary format page.** The source's `SKILL.md` never links `GLOSSARY-FORMAT.md`. Its workspace list has no `GLOSSARY.md`, and glossaries appear only as `reference/*.html` and under "Reference Documents". The source's own page says so ("ships a `GLOSSARY-FORMAT.md` that `SKILL.md` no longer links to").
  - Item 1 lists "the glossary" among the source's workspace files, which is wrong for `SKILL.md`.
  - Item 2 asks for "the links to the other pages".
  - Linking `glossary-format.md` from a step adds a behaviour beyond ADR 0048's points, since a `GLOSSARY.md` would be written in the workspace root. Shipping it unlinked breaks `docs/dev/skill-layout.md` "Writing for an agent": "Material a step needs only in some runs ... goes in a file `references/<name>.md` ..., named by its path from the step that reads it".
  - Either way this is a choice the brief does not make and no ruling covers. It is for the orchestrator or the user, before the builder starts.
- **The subsection `### Fluency vs Storage Strength`.** Missing from the brief's premise list (check 3). It is not dropped by the brief, but the builder is not told about it.
- **The two stops:**
  - The mission interview: "If the user is unclear about the mission, or the `MISSION.md` is not populated, your first job should be to question the user". Carried by item 1 and a case.
  - The confirmation: "Confirm with the user before changing the mission". Carried by item 1 and a case.
- **The workspace files** (`MISSION.md`, `reference/`, `RESOURCES.md`, `learning-records/`, `lessons/`, `assets/` and `NOTES.md`): carried by item 1.
- **The rules on sources of a lesson** are carried by item 1:
  - "Never trust your parametric knowledge";
  - "Lessons should be littered with citations";
  - "recommend a primary source";
  - RESOURCES.md as the record of trusted sources.
- **The source's page `docs-teach.md`** is in the Read list, but the brief does not say what it is used for, for example as the basis of the "Use instead" table. That is not a contradiction.

## 7. Dictated text

The brief dictates no text word for word for any file. Item 6 describes README changes and gives no text. The "Doc text" entry is left to the builder.

## 8. The layout

What `docs/dev/skill-layout.md` (read whole) requires of a new skill that the brief does not ask for explicitly:
- **The nine sections in order.** The title and a paragraph, Quick start, Use instead, What it reads, Steps with a `### <name>` subsection per mode, the optional reference sections, Stops, Anti-patterns and Rules. Item 1 says only "in the sections ... of the layout" and does not name the explain mode's subsection.
- **The Stops table rows** for the explain mode's offer of a learning record and for the question for the path. See check 4.
- **"A step that can refuse or stop comes before every step that writes"** ("Lists and tables"). This bears on the mission interview before the first lesson, and on the offer before the record is written.
- **"Each item of Steps ends on its completion criterion".**
- **Each format page under `references/`** must be "named by its path from the step that reads it" ("Writing for an agent"). This is the glossary-format problem in check 6.
- **New terms.** "A skill that needs a new term ... adds or changes its entry in `skills/ordo/ordo-init/templates/plan-terms.md` first, and `docs/glossary.md`'s block is synced from it."
  - Other skills put their own terms in `docs/glossary.md`, "Ordo's own terms": `grep -n '^## ' docs/glossary.md` shows that section at line 145, holding for example "funder config" and "referee review".
  - `tutor` brings "teaching workspace", "lesson", "learning record" and "mission".
  - `docs/glossary.md` "loop" is defined only as the plan's loop, while the source uses "feedback loop".
  - The brief asks only that the report list the terms. Its paths name neither `docs/glossary.md` nor `plan-terms.md`, and it does not decide whether the terms enter the glossary.

Where the layout puts a format page such as the source's four: in `references/<name>.md` beside `SKILL.md`. "Reference material goes in `references/`, never in `templates/`", and a reference section in `SKILL.md` "holds only material every run reads". The brief's `references/` with lower-case names agrees with the layout's naming of reference files. The renaming is a deviation forced by the layout, to be listed in `deviations.md`.

Whether a skill moved to a new group folder needs anything the brief does not name: no.
- The layout says only `skills/<group>/<name>/SKILL.md` ("Every `skills/<group>/<name>/SKILL.md` follows this layout"). No list of groups exists in `docs/dev/` (check 1 grep).
- Raising `metadata.version` is due only when the skill's behaviour or wording changes ("A plan that changes a skill raises one part ..."; the patch part "when only the wording changes"). `wait-what`'s text names no folder or group, since `grep -n 'ordo' skills/ordo/wait-what/SKILL.md` prints nothing, so no raise is due.
- `pin.sh` and the `ordo-help` skills mode find skills in any group folder (check 1).

## Declined to judge

- Whether the originals of `GLOSSARY-FORMAT.md` and `MISSION-FORMAT.md` held an en dash and an ellipsis character. That cannot be checked without fetching the source, which this check may not do.
- Whether the repository's rule that a copy carries no credit or licence text for the source fits the source's licence. This is a ruling outside the brief's scope.

Agent usage: a80a3d262da646252, claude-opus-5-5, 165019 tokens, 50 tool uses, 9 min 5 s.

## Closed

- Names, the note of `pipeline()` that lists the skills starting no agent: item 8 has the step change the label in `docs/figures/gen_figures.py`, write the figure again and change its alt text; the paths name them.
- Names, the count on both lines of `README.md`: item 6 names both.
- Names and premises, `session-retro` as a user-only skill and as a page that names `wait-what`: both taken out.
- The step line, ruling D7: no such ruling stands; the plan's line and the brief name D2 and D11.
- The step line, `deviations.md` under the ledger: the builder writes the deviations as a section of its report, and the orchestrator writes `deviations.md` in the main ledger from it at landing.
- Premises, the subsection "Fluency vs Storage Strength": named.
- Cases, the two values that reach a path: cases added for a concept that holds `/` or `..` and for a path the user gives.
- Cases, the call with no topic, `/tutor explain` with no concept, `--page` without `explain`: the call is `/tutor [<topic>]` as the source's, and three cases are added.
- Cases, the install loop: a command case reads each path of the loop against the tree.
- Cases, the Stops table: item 1 names the four rows.
- Cases, the character-set check on a removed file: verify 2 is given the files that exist after the change.
- Cases, `pin.test.sh` as a case: taken out of the cases; it stays in the verify list, which the landing runs anyway.
- ADRs, 0045 unnamed: named.
- ADRs, `argument-hint`: dropped, as the layout's frontmatter forces; listed in the deviations.
- ADRs, the format pages and the prose standard: a decision of the brief, stated: the format pages are the source's format, kept word for word apart from ASCII, and the prose standard is applied to `SKILL.md`.
- ADRs, the glossary format page the source ships and does not link: a decision of the brief, stated: the page is shipped, and the step of `tutor` that writes a glossary among the reference documents names it, as the layout asks of a reference page; no `GLOSSARY.md` is added to the workspace. Listed in the deviations.
- The layout, the sections, the subsection of the explain mode, the order of a stop before a write: named in item 1.
- The layout, new terms: item 9 adds the skill's terms to "Ordo's own terms" of `docs/glossary.md`.
- The base: the brief names main's head at its preparation.
