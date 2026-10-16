# Brief check of step 2 of plan 3, the known cases

I read the brief `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/briefs/2.md` (193 lines, untracked) on main at 6f97b05. I read it against the working-tree `plan.md`: that file is modified and not yet committed, and its Rulings hold "Step 2, the case files" and the rewritten lines of steps 2 and 3 (`git diff .scratch/3-the-writing-base/plan.md`). I changed nothing.

## 1. Names

The command used: `grep -rn -i 'character.set\|ASCII check\|x{2705}\|printable ASCII\|ls-files -co' skills docs utils agents README.md CLAUDE.md .agents/plan.yaml`, then `grep -rn -i "only its report\|beyond the builder's report\|except the report\|only the report" skills docs README.md agents`, then `grep -n '\*\*ledger\*\*' skills/repo-setup/templates/plan-terms.md docs/glossary.md`. The hits outside "Paths this step writes":

1. `docs/dev/change-standard.md:61`, "Where the work happens": "Nothing under the ledger folder is edited except the report the brief names." Item 1 makes this false. The brief has the builder write `cases/` into the worktree's copy of the ledger. The rules file's line 3 says "nothing in a brief overrides anything here", and brief line 5 says the rules file "govern[s] this step unchanged". The brief never names this clash or the ruling that sets the bullet aside for `cases/`. So a builder that follows "Read before changing anything" 1 stops on the disagreement, or the reviewer files the case files as a breach of the rules file. The same bullet stands in `skills/repo-setup/templates/docs/dev/change-standard.md:59`, a template for other repositories, which the step does not make false.
2. `skills/plan-orchestration/SKILL.md:94` ("What is never touched: the ledger beyond the builder's report") and `:102` ("In the ledger it writes only its report"). These two lines dictate the builder's prompt, and the prompt they produce contradicts item 1. The brief says nothing that lets the orchestrator's prompt carry the exception, so the dispatched prompt forbids what the brief asks.
3. `docs/glossary.md:63` and `skills/repo-setup/templates/plan-terms.md:58`, the term **ledger**: "holding `plan.md`, `orchestrator-state.md`, `agents/briefs/` and `agents/reviews/` ... a copy in which the builder writes only its report". After this step the entry is false for this plan's ledger. The new building.md line 25 that item 4 asks for ("a ledger's `cases/` folder") also uses the term in a sense the entry does not define. The brief's Report asks for "the terms", but the brief neither foresees this hit nor puts the glossary in its paths.
4. The new line 25 (item 4, brief line 93) is to say the check skips files that "hold the case drafts of `/writing`". The glossary's **case** is "an example under a brief's 'Cases'", or "a real instance from the tree on which a format or rule decision of a brief is run". A known case of `/writing`'s gate is neither. A docs/dev page would then use a glossary term in a sense the glossary does not give (glossary preamble, line 3).
5. `.scratch/3-the-writing-base/orchestrator-state.md:13`, the verify list's sixth command. It differs from the page once the step lands. The brief covers this correctly: `/land` Steps 2 rewrites the copy, as ADR 0010 says.
6. `.scratch/3-the-writing-base/orchestrator-state.md:64`, "Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new". This becomes false for step 2: the landing commit adds case files that hold the non-ASCII break characters. The file is the orchestrator's and the brief does not name it, so step 2's landing would read as breaking its own plan's per-step check.
7. These hits stay true: `README.md:69` (perl for the ASCII check); `docs/dev/change-standard.md:34` (rule 6), `:67` and `:80`; `skills/refute/SKILL.md:82` and `:107`; `skills/spec/SKILL.md:176` and `:433`; `skills/plan-orchestration/SKILL.md:118`; `skills/land/SKILL.md:94`; `skills/spec/templates/brief.md:78` and `:100`; `skills/land/SKILL.md` Steps 5 and the `land.sh` head comment, lines 10 and 11 (an uncommitted ledger file never reaches main from the worktree, which the session copy does not change); `skills/repo-setup/templates/docs/dev/coding-standards/common.md:9` (a template). Only building.md:11 and change-standard.md:75 hold the command.
8. Name check for `cases`: `git ls-files -co --exclude-standard | grep -n 'cases'` lists 9 tracked cases-ruling files named `agents/briefs/<n>-cases.md` in the archive, such as `.scratch/archive/2-e-a-self-rule/agents/briefs/1-cases.md`. The new pattern keeps them. Of 948 listed files, none matches `.scratch/*/cases/*` today (`... | wc -l` printed 0), so no existing file is newly skipped.

## 2. The step line

How each part of the plan's step 2 line maps to "What to build":

- "a builder other than step 1's": no requirement anywhere in the brief (`grep -n 'other than step 1' briefs/2.md` finds nothing). It binds the dispatch, not the builder, but nothing carries it to whoever dispatches.
- "writes into this folder's `cases/`": item 1 and "Paths this step writes".
- "for each rule of `skills/writing/references/` and of the prose standard, one passage that breaks it and one that does not, each with its expected result": items 1 to 3, with the exceptions of item 3.
- "in four case drafts ...": item 1.
- "each draft as a `.tex` with an `\input` file and as a `.docx` made with `textutil -convert docx`": item 1.
- "the character-set check in building.md and change-standard.md skips `.scratch/*/cases/` and `.scratch/archive/*/cases/`": item 4.
- "the session copies `cases/` from the worktree to main at landing, as it copies the builder's report": only in the premises (line 22) and line 126.
- The check: C1, C2, C5, C8 and verify items 1, 3 and 4.

Findings:

1. "a builder other than step 1's" has no requirement (see the mapping above).
2. The session's copy of `cases/` has no order. `land.sh` runs `checks.sh` on main right after its cherry-pick (head comment, lines 18 to 20), and `/land` Steps 13 removes the worktree. The step line's check, "run from the repository root with the case files in place, exits 0", is mapped only to a worktree run (C8). The brief never says the copy is made before `land.sh` runs, so the check on main runs without the case files in place. Nor does it say the copy is made before Steps 13, after which an uncommitted `cases/` is gone. "As it copies the builder's report" is also not a time: `plan-orchestration` Steps 6 copies the report when it arrives, before `/refute`, not at landing.
3. The ruling's Question 2 has the state file's verify list skip the cases too. The brief leaves that to `/land` Steps 2 (line 27). That is consistent with ADR 0010 and has no requirement gap.

## 3. Premises

Commands run on main at 6f97b05, with the result against what the brief says:

1. `ls .scratch/3-the-writing-base` printed `agents orchestrator-state.md plan.md`, and `ls docs/dev` printed `blind-comparison.md building.md change-standard.md scripts.md skill-layout.md`. Holds.
2. `wc -l` printed 75, 220 and 77 for the prose standard, rules.md and registers.md. Holds. Reading the prose standard gives bullets 13 to 20 (8), paragraphs 24, 26 and 28, bullets 32 to 35, paragraphs 39, 41 and 43, bullets 47 to 53 (7), 57 to 64 (8) and 68 to 71 (4): 37 in all. Holds.
3. `grep -n '^## \|^### '` gives the rules.md group counts the brief states, and registers.md has 16 `###` headings, 4 of each of the four names. Holds.
4. `cat -n skills/writing/SKILL.md`: line 89 is "Apply the register of the draft's discipline.", and lines 91, 93 and 100 say what the brief says. Holds. `grep -n '"""' docx_paragraphs.py` printed 2 and 33. Holds.
5. Line 13's reason is inaccurate, with no effect on the build. `/writing` reads `skills/repo-setup/templates/docs/dev/prose-standard.md` because `.agents/plan.yaml`'s `standards` lists it, the first place of "What it reads" 2 (`grep standards .agents/plan.yaml`). It is not because `docs/dev/prose-standard.md` is missing. The file is the same either way.
6. textutil, repeated in `mktemp -d $TMPDIR/bc2.XXXXXX` on my own `draft.html`: `textutil -convert docx` exited 0, and `docx_paragraphs.py` printed `11: Em <em dash> dash and en <en dash> dash and <horizontal ellipsis> and <rightwards arrow> and <left double quotation mark>curly<right double quotation mark>.` and exited 0. Straight quotes, `--`, `...` and `->` came through unchanged. The brief's claim holds. The same run shows three things the brief does not state:
   - (a) `<ul><li>` items print as `9: <space><bullet><space>First item`. textutil writes a literal U+2022 into a `w:t` (`unzip -p draft.docx word/document.xml` shows `<w:t xml:space="preserve"><bullet></w:t>`), and `... | LC_ALL=C grep -n '[^ -~]'` flags every list item. `<ol>` and `list-style-type: none` print ASCII; disc, square and hyphen print U+2022, U+25AA and U+2043.
   - (b) Each table cell prints as its own numbered paragraph with no mark that it is a cell (`6: Cell a; b; c`).
   - (c) A paragraph holding `&nbsp;` prints as `12: <no-break space>` and is flagged, since the script drops only paragraphs of plain spaces.
7. The NWO XS `.docx`: `printf '%s\0' <docx> | xargs -0 perl ...; echo $?` printed `xargs exit 1`. Holds. perl alone exits 25 after `Malformed UTF-8 character (fatal)`.
8. The six-path run: the loop printed `.scratch/3-the-writing-base/plan.md`, `docs/dev/building.md`, `skills/writing/references/rules.md` and `README.md`, then `exit 0`. The table holds. Its sample paths use a draft folder `full/`, while item 1 names `engineering/`. The paths are samples, but the mismatch can mislead.
9. The whole changed command, run on main, printed nothing and `exit 0`. Holds. `diff` of the command against building.md:11 shows the inserted `case ... esac;` clause as the only change.
10. `diff <(sed -n 11p docs/dev/building.md) <(sed -n 75p docs/dev/change-standard.md)` printed nothing, exit 0. Holds. The state file's verify list has 6 items, and the sixth equals the page's command (python yaml compare printed `[False, False, False, True, False, True]`; the Falses are the copied `2>&1 | tail -1` filters). Holds.
11. Standards finding. Brief lines 17, 20, 54, 93 and 105 cite a skill's text or a page by line number: "`skills/writing/SKILL.md` line 89/91/93/100", "line 100 says", "`README.md` line 69", "line 25". `docs/dev/change-standard.md` "Where the work happens" bullet 4 says a ledger file cites a page by its section, never by a line number. Only "Paths this step writes" and the template's "Read, with sections or line ranges" may keep line numbers (`grep -n -o '... line [0-9]...' briefs/2.md`). Item 2's "as `skills/writing/SKILL.md` line 100 says" is an instruction the builder follows, and it points by line.

## 4. Cases and checks

1. C4, brief line 100: "Checked with `grep -n '\\input' cases/*/main.tex`". Verify runs from the worktree root, where `cases/*/main.tex` matches no file and grep errors. The path is `.scratch/3-the-writing-base/cases/*/main.tex`.
2. Item 1 and line 126 against `docs/dev/change-standard.md:61` and `plan-orchestration` Steps 4: the builder writes outside its report in the ledger (finding 1.1). The brief's own hand-back paragraph (line 116) then makes the builder stop at its first run on "a case the brief's own rules get wrong".
3. C1 and C2 are judged on rows existing, a break row and a clean row per rule. No case reads each listed passage against its rule's own words: that a break passage breaks its rule (`skills/writing/SKILL.md:86`, "only where the rule's own words describe the break"), that it breaks no other rule unless its row says so, and that a clean passage keeps the rule. Item 3 requires all three (line 65), and no case checks them. A row with a passage that does not break its rule passes C1 and turns step 3's right "nothing reported" into a counted miss.
4. Missing cases for item 1's requirements: that each draft states its discipline in its own text (line 38) and that each is a research manuscript (line 34). If either fails, `/writing` applies no register or none of the (manuscripts and grants) rules, every row for those rules fails at step 3, and no case at step 2 would have caught it.
5. No case or verify item runs `python3 skills/writing/templates/docx_paragraphs.py <draft.docx> | LC_ALL=C grep -n '[^ -~]'`, the second command `/writing`'s review agent runs on a `.docx` (`SKILL.md:84`). Verify 5 checks only the `.tex` files. The bullet characters textutil adds (premise 3.6a) and any NBSP would reach step 3 unchecked.
6. No case asks the builder to check, quote or explain a place the step does not change. C3 runs `docx_paragraphs.py` and C8 runs `git ls-files`, both read-only tools.
7. Rule 13's third bullet ("a case asserting that a rule stays silent carries a control") holds in form for C7, with kept and skipped paths, and for the break and clean pairs.

## 5. The question

The goal is known cases that let step 3 judge whether `/writing` finds each break at its place under its rule and reports nothing in the clean passages.

1. C1 and C2: yes, they could pass without the goal. Rows can exist whose passages do not break or keep their rule (finding 4.3).
2. C3: partly. The places check out for passages on one line, but no single `file:line` exists for a break that spans lines or is an absence (points 11 and 12 below). C3 passes with whatever line the builder picks, and step 3 cannot tell a right report from a wrong one there.
3. C4: no, but as written the check does not run (finding 4.1).
4. C5: yes. It passes while the `.docx` text holds characters the `.tex` text lacks: textutil's U+2022 on every `<ul>` item and NBSP from `&nbsp;`. `/writing`'s grep flags them in clean passages, and step 3 then reads a right ASCII finding as a false alarm, or a wrong expected.md as right. C5 also says "checked by the run" without naming the run. A fresh conversion cannot be compared byte for byte, so the only check is comparing the printed paragraphs of a new conversion with the committed one, and the brief does not say so.
5. C6: yes, it could pass, because the case design makes a clean draft hard to meet in several places:
   - (a) Near-miss pairs. A clean passage "is the nearest text that keeps the rule: for a flagged term, the same sentence without it" (line 65). Two near-identical sentences in one draft break "Reader's path / Clarity test" (a paragraph whose removal loses nothing) and 0 "No repeated construction". They can also break E "Restating closes". A right report then names "clean" passages, and expected.md, read as written, counts them as false alarms. The clean passage needs the same rule kept with different content, and the brief says the opposite.
   - (b) One idea per paragraph and the first sentence stating the point (D bullet 2; "Paragraphs / First sentence states the point"). These hold for every paragraph, so cases cannot be packed into paragraphs. The brief does not say so, and roughly 128 passages in the engineering draft make packing the likely path.
6. The check on the step's line: yes, it could pass without the goal. "Finds each rule with its two passages and their expected results" checks presence (point 1). "`docx_paragraphs.py` prints the passages" passes with the list artifacts (point 4). "The changed check exits 0" passes with a pattern wider than the ruling (6.1).
7. Item 1: yes. It could pass with discipline or genre unstated (4.4) and with register drafts that cannot be built as "only that register's cases", because several register breaks are forced double breaks (point 13).
8. Item 2: yes. The rule-name form ("the bullet's bold label or ... its first words") is stated to be "as `/writing` names it". `SKILL.md:92` and `:97` have the agent name a prose-standard rule "by its page and section" and head a group by page and section. A report that groups section D's breaks under one heading is right by the skill's text and does not match a table that names bullets. The reader can map the two, but the brief's premise is wrong. Also, for a passage breaking two rules of the same page, the order comes from `SKILL.md:98` ("Order the groups as the rules stand"), which the brief does not cite. Line 17 cites only the page order of line 100, so the builder can put the passage in the wrong group.
9. Item 3, formatting rules in the `.docx` form: yes, it could pass. The dictated row "nothing reported: the formatting does not reach the text the script prints" is wrong or unsettled for several rules:
   - (a) 0 "Headings are labels, not sentences". The heading's words do reach the output; only its style does not. The reviewer sees the sentence as a short paragraph and may report it under this rule or another.
   - (b) 0 "No dramatic bolded closers". The closer's text, which reaches the output, is a punchy summary under 0 "Plain prose only" or E "Restating closes", so the `.docx` report names a rule and the row expects nothing.
   - (c) F "Inline code for paths". In the `.docx` every path, the clean ones included, shows without monospace, and the rule's words describe that text, so a report by `SKILL.md:86` may name each one. The brief's Decision 4 decides that the right report says nothing, but the skill's text does not say a `.docx` review sets formatting aside. Step 3 would then judge `/writing` against a behaviour its text never asks for.
   - (d) F "code fences carry a language tag" and "one blank line ... around code fences": neither form has a code fence. Item 3 lists "a code fence" as a break to place in the `.tex`, where a Markdown fence is just characters.
10. Item 3, rules counted over a page: yes, it could pass.
   - (a) "Binary contrast ... at most twice per page" has no exemption in its words. A draft that breaks the count cannot also hold a clean passage the count keeps, and the short drafts hold only register rows. So the clean row the brief requires cannot be written, and line 67's "a clean passage the rule's own words exempt or keep" has nothing to point at. "Vary paragraph length", "No repeated construction" and E's "five or more consecutive sentences of the same length" are the same kind of rule.
   - (b) "Per page" in a source that is never compiled is undefined. The brief silently reads it as "the draft as a whole".
   - (c) The semicolon break has no single place: which semicolon is the break, the third or every one? Step 3 cannot judge "found at its place".
   - (d) The semicolon clean passage (table cells) works in the `.tex`. In the `.docx` each cell prints as an unmarked paragraph (premise 3.6b), so the exemption cannot be seen, and a right review may count the cell's semicolons as running prose.
11. Item 3, rules judged per section: in part. Two studies give "Tense per section" and "So what per section" a break and a clean section. Every other section of the kind must then do its job by its row, the methods sections included: "Shows rigor and acknowledges limitations upfront". The place of a whole-section break (a section in the wrong tense) is many lines, and the brief gives no rule for which line the row names: the heading, the first sentence, or each sentence.
12. Rules whose break is an absence and cannot be confined to one passage. "Objectivity / Limitations and alternative interpretations" ("The text acknowledges ..."), the register headings "What the reader looks for" ("A methods or results section gives it") and "Reader's path / Reader's four questions" have no passage to quote. `SKILL.md:92` requires "the passage quoted as the draft has it", and item 2 requires a quoted passage and a place. The brief gives no form for these rows, so step 3 cannot judge "at its place". The two kinds also collide. A study whose limitations go unacknowledged breaks the Limitations rule and also "So what per section" (Methodology "acknowledges limitations upfront"), and the reverse holds too. So the Limitations break is always a double break, and a draft that keeps the rule in one study may not break it in the other at all, since "the text" is the whole draft.
13. Passages that break two rules, in the register drafts:
   - Social Sciences "What the reader looks for" (transparency about limitations): a methods section that leaves limitations out also breaks "So what per section", a rules.md rule. By `SKILL.md:100` it stands in the rules.md group, with the register named only on the "other rule" line.
   - Sciences "Register" (formal, impersonal): an informal break also breaks "Formality / No colloquial words", which applies to every manuscript.
   - Engineering "Register" and "Terminology", and Medicine "Register" (evidence hierarchy): their breaks overlap "Most specific term", "Vague phrase" or "Hedge where a claim is uncertain".
   Item 1 says the short drafts hold "only its register's cases". The builder either writes a register break that is not a break, to keep it single, or adds rules.md rows the item forbids. The brief should state that these rows name the second rule and are allowed in the short drafts.
14. The answer key beside the drafts: yes, step 3 could pass without the goal. `expected.md` sits in `cases/`, the parent of every draft folder. `/writing`'s agent is told which files to read but can open the key with its Read tool. Step 3's transcript check ("one fresh agent that edits no file") would not show a review that read the answers.
15. Naming a venue: line 38 has the draft state its discipline by "its venue". `registers.md:5` says a venue's author guidelines hold over a voice rule "when the project names the venue". A reviewer that reads a named venue that way may hold back on Voice breaks, so the Voice rows fail for a reason outside `/writing`'s rules.
16. Item 4: yes, it could pass. C7 passes on the six paths while the pattern also skips paths that are not a ledger's `cases/` folder (6.1).
17. Rule granularity, for the orchestrator to rule on. One passage per bullet tests one of a bullet's several banned forms. Section 0's dash bullet bans the em dash, the en dash, ` - ` and `--`; A lists 7 filler words, 8 qualifiers and 25 flagged terms; C lists 12 openers. Item 3 has the dash breaks use the Unicode characters only. In LaTeX source the em and en dashes are normally written `---` and `--`, which are ASCII, so the review's grep never catches them and only reading finds them. These are the forms `/writing` will meet in a real `.tex`, and no case holds them.

## 6. Implied inputs

Each input was run through the brief's loop (`printf '%s\0' ... | xargs -0 sh -c 'for f; do case "$f" in .scratch/*/cases/*) printf "skipped: %s\n" ...'`):

1. A `cases/` folder nested deeper under `.scratch/`, such as `.scratch/3-the-writing-base/agents/reviews/cases/x.md` or `.scratch/archive/2-i-x/agents/reviews/2-run/.scratch/3-y/cases/z.md`: skipped. In a `case` pattern `*` crosses `/`, so the pattern skips any `cases/` at any depth under `.scratch/`. The ruling names two places, `.scratch/*/cases/` and `.scratch/archive/*/cases/`; naming the second only makes sense if `*` stands for one folder. Nested ledger copies have happened: `git ls-files | grep -c 'agents/reviews/.*-run/'` printed 72 tracked files under `.scratch/archive/2-i-several-plans-in-one-session/agents/reviews/2-run/.scratch/...`. A wrong answer costs a ledger report or snapshot under such a folder escaping the check. Expected per the ruling: kept. This is missing from C7. Line 93's sentence ("the files under a ledger's `cases/` folder") would also be false of the pattern, so C9 cannot hold.
2. A file named `<n>-cases.md`, the cases-ruling file `plan-orchestration` Steps 6 writes (`agents/briefs/<step>-cases.md`): kept. 9 such files are tracked in the archive (4.8 above), and this step's own hand-back would write `.scratch/3-the-writing-base/agents/briefs/2-cases.md`. Expected: kept. Missing from C7.
3. A `cases/` folder outside `.scratch/`, such as `skills/writing/cases/x.tex`, `docs/cases/x.md` or `cases/x.md`: kept. None exists today, but a wrong answer leaves product files unchecked. Expected: kept. Missing from C7.
4. A file named `cases` rather than a folder, `.scratch/3-the-writing-base/cases`: kept. It has not happened, and the cost is low. Expected: kept. Not required.
5. A path with spaces, `.scratch/my plan/cases/a b.tex`: skipped, correctly, since paths are NUL-separated and `"$f"` is quoted. It has not happened (slugs have no spaces). Not required.
6. A deleted case file: skipped before the `-e` test, the same result. Not required.
7. An empty list after the skip: `printf '' | xargs -0 perl ...; echo $?` printed `exit 0` without running perl. It has not happened. Not required.
8. A run from a subfolder: `git ls-files` prints paths relative to the current folder, so from `.scratch/` the case files lose their `.scratch/` prefix and are not skipped. building.md line 3 sets the repository root. Not required.
9. A `.docx` input made from hand-written HTML: a `<ul>` list or `&nbsp;` puts non-ASCII into `docx_paragraphs.py`'s output (3.6). It happened in my run, and the cost is a false alarm at step 3. Expected: the `.html` uses only constructs that print ASCII, or the rows name the characters. Missing from the brief.

## 7. ADRs

I read every `docs/adr/00*.md`'s opening lines and Decision section (`awk '/^## Decision/...'`, `grep -n -i supersed`). No record is superseded.

1. 0001 touches the step. Its Decision: "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`." The brief names it and does not contradict it, apart from the reason noted in 3.5.
2. 0002 touches the step. Its Decision: "The prose standard holds for every text the writing skills write or review." Named, and it holds.
3. 0003 touches the step. Its Decision: "`/writing` starts one fresh agent that changes nothing ... which reads the whole draft and reports only breaks of a named rule." Named, and it holds. The brief's summary quotes the Context, not the Decision.
4. 0010 touches the step. Its Decision: "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands". Named, and it holds.
5. 0012 touches the step, and the brief says it does not (line 28). Its Decision: "Every commit a skill makes on main names its paths in the commit command ... The landing commit takes its paths from `git diff --cached --name-only --no-renames`." The case files the session copies to main are untracked, so they are not in `git diff --cached`. They reach the landing commit only as "files of this plan's ledger that the session wrote" (`/land` Steps 12), each named in `git add -- <path> ...`, about 17 paths. The step's landing of `cases/` is governed by this record, so the brief should name it.
6. 0004 to 0009 and 0011 do not touch the step.

## 8. Dictated text

1. `grep -n 'case "\$f" in .scratch' briefs/2.md` finds line 77, the fenced `sh` command for building.md:11 and change-standard.md:75. Read whole: ASCII (`LC_ALL=C grep -c '[^ -~]'` printed 0), the fence carries a tag, and it has no comment. Holds against change-standard rule 10 and prose standard F. Its substance is wider than the ruling (6.1).
2. `grep -n 'two sentences:' briefs/2.md` finds line 56: "every passage of a draft that the table does not list is expected to be reported under no rule; the expected results are read against the reports of step 3, never changed after them." Holds: plain, ASCII, one semicolon. It is called "two sentences" but written as one joined by a semicolon, so the builder must split it or write it as one, and the brief does not say which.
3. `grep -n 'nothing reported: the formatting' briefs/2.md` finds line 68: "nothing reported: the formatting does not reach the text the script prints". Its prose holds. Its claim is false for the headings, dramatic-closer and inline-code rows (5.9).
4. `grep -n '"nothing reported"' briefs/2.md` finds line 54. Holds.
5. `grep -n 'Everything in the brief is done' briefs/2.md` finds line 183. Holds.
6. `grep -n 'Precision / Term defined' briefs/2.md` finds line 49, with the examples "Precision / Term defined at first use" and "Sciences (Natural, Applied) / Voice". Both hold and match `rules.md:3` and `registers.md:5`.
7. `grep -n 'Em dash and dash-as-aside' briefs/2.md` finds line 64, quoting "Em dash and dash-as-aside: zero (see 0)". It matches the prose standard, line 32. Holds.
8. Line 93, the new building.md line 25, is given "in the builder's words", so it is not dictated. Its required content ("a ledger's `cases/` folder", "the case drafts") is covered in 1.3, 1.4 and 6.1.
9. The brief dictates nothing else. The commands under "Verify before you report" are run, not written.

## Declined to judge

- Whether the formatting rows of the `.docx` form should expect "nothing reported" or a finding (5.9c), and how fine-grained a "rule" is (5.17). Both are rulings for the orchestrator, or for Axel if they change the gate. My report gives the evidence only.
- Whether `/writing` actually names prose-standard rules by section or by bullet, and whether it reads files beside the draft. Only step 3's runs settle these.
- Whether a full engineering manuscript of about 128 passages can be written with every other sentence clean. I checked whether the brief's rules allow it, not whether it can be done; only the drafts, read whole, settle that.
- I did not repeat the brief's exact `c.html` run. I ran my own HTML holding the same characters and more constructs, in `$TMPDIR/bc2.4TgEz4`.

Usage: a0a40444046c6ffdc, claude-opus-5-5, 221286 tokens, 43 tool uses, 13 min 16 s.

## Closed

The step stopped on findings 1.1, 1.2 and 1.3 (the builder writing into the ledger) and on 5.10a, 5.12 and the Limitations part of 5.11 (rules judged on a whole draft), raised as the open item "Step 2, the brief check". The brief was taken back out of the tree at the stop (`spec`, "The brief check" 4). Each other finding is closed in the brief that `/spec 3 2` writes after the ruling, as follows:

- 1.4: the new `docs/dev/building.md` sentence says the check skips the drafts the `/writing` gate runs on and their expected results, without the term **case**.
- 1.6: the state file's "Verification, every step" bullet now says the grep finds nothing new outside a ledger's `cases/` folder.
- 2.1: the brief says its builder is a fresh agent, not step 1's builder.
- 2.2: the session copies the case files to main before `land.sh` runs, so the check on main runs with them in place, and before the worktree is removed.
- 3.5: the reason `/writing` reads the template prose standard is that `.agents/plan.yaml`'s `standards` lists it.
- 3.6 and 6.9: the `.html` uses no `<ul>`, no `&nbsp;` and no table; a new verify item runs `docx_paragraphs.py <draft.docx> | LC_ALL=C grep -n '[^ -~]'` and expects only the ASCII-rule breaks.
- 3.8: the sample paths use the draft folder names of item 1.
- 3.11: the brief cites `skills/writing/SKILL.md` and the other pages by section.
- 4.1: C4's command uses `.scratch/3-the-writing-base/cases/*/main.tex`, or the builder's scratch folder under Question 1 (a).
- 4.3: a new case reads each listed passage against its rule's own words: the break breaks its rule and no other unless its row names it, and the clean passage keeps the rule.
- 4.4: new cases check that each draft states its discipline in its own text and is a research manuscript.
- 4.5: the new verify item of 3.6.
- 5.5a: a clean passage keeps the rule with content of its own, never the break sentence with the fault removed, so no two passages repeat each other.
- 5.5b: the brief states that every paragraph keeps one idea and opens with its point, so the passages are spread over paragraphs.
- 5.8: the rows name a prose-standard rule by its section and the bullet's label, and the expected group of a passage that breaks two rules follows `skills/writing/SKILL.md` "Review agent prompt", where the groups stand in the order the rules stand.
- 5.9: a rule whose break lives only in formatting the script does not print (bold, monospace, a heading's style, hard-wrapped source lines) has its case in the `.tex` form only and is left out of the `.html`; the drafts hold no path or identifier outside the inline-code case; the code-fence rules get no case, since neither form holds a code fence, named with that reason.
- 5.10b and 5.10c: a page is the draft as a whole; the place of a count break is the line of the paragraph that holds the construction, and a report placing it anywhere in that paragraph is at its place.
- 5.11: the place of a break judged on a section is the section's heading line, and a report placing it at any line of that section is at its place.
- 5.12, the other rules with no passage (the registers' "What the reader looks for", "Reader's four questions"): the row names the section and quotes its heading.
- 5.13: a register break that also breaks a rule of `references/rules.md` is allowed in a short draft, its row naming both, in the group the skill's order gives.
- 5.14: the session reading step 3's transcripts also checks that the agent read only the files its prompt names, so a read of `expected.md` is seen.
- 5.15: no draft names a venue.
- 5.17: the dash rule of section 0 gets one break per form a `.tex` holds: `---`, `--`, a spaced hyphen, and the em and en dash characters.
- 6.1, 6.2, 6.3: the pattern is `.scratch/archive/*/*/cases/*) ;; .scratch/archive/*/cases/*) continue ;; .scratch/*/*/cases/*) ;; .scratch/*/cases/*) continue ;;`, tried on eleven paths: the two ruled places skipped, a nested `cases/`, `2-cases.md` and a `cases/` outside `.scratch/` kept; C7 names these paths.
- 7.5: ADR 0012 is named, and the landing commit names each case file.
- 8.2: the sentence is given as two sentences.

After the ruling "Step 2, the brief check" (a), (a), `/spec 3 2` wrote the brief with each closure above in it. Findings 1.1, 1.2 and 1.3 are closed by Question 1 (a): the builder writes the case files in the scratch folder `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases` and only its report in the ledger, so the rules file, the builder's prompt and the term **ledger** stay true. Findings 5.10a, 5.12 (Limitations) and 5.11 (Limitations) are closed by Question 2 (a): the clean rows of the rules judged on a whole draft stand in the short drafts. Finding 4.1 is closed with the path `<cases>/*/main.tex`.

Dictated lines added after the check, held line by line against the rules file and the standards pages:

- `grep -n 'Every passage of a draft that a table' briefs/2.md`: "Every passage of a draft that a table does not list is expected to be reported under no rule." Holds: 19 words, ASCII, the passive kept because the actor (whoever reads the report) is irrelevant.
- `grep -n 'never changed after them' briefs/2.md`: "The expected results are read against the reports of step 3 and are never changed after them." Holds: 17 words, ASCII, the passive kept for the same reason.
- `grep -n 'archive/\*/\*/cases' briefs/2.md`: the fenced `sh` command of item 4. Holds: ASCII, the fence carries a tag, no comment.
