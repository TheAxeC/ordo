# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1, base 4c51680)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

Every command below was run from the worktree root, in the foreground.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/*.md skills/writing/templates/docx_paragraphs.py skills/repo-setup/templates/docs/dev/prose-standard.md skills/repo-setup/templates/plan-terms.md skills/repo-setup/templates/docs/glossary.md docs/glossary.md skills/repo-setup/SKILL.md docs/academic-coverage.md README.md docs/dev/scripts.md agents/ordo-low.md agents/ordo-medium.md agents/ordo-high.md agents/ordo-xhigh.md agents/ordo-max.md skills/plan/templates/plan.yaml skills/plan/SKILL.md .agents/plan.yaml .scratch/3-the-writing-base/agents/reviews/1-report.md | xargs -0 sh -c '...' sh | xargs -0 perl -CSD -ne '...'; echo "exit $?"
exit 0
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
965 skills/diagnose/SKILL.md
877 skills/grill/SKILL.md
725 skills/land/SKILL.md
564 skills/ordo-help/SKILL.md
632 skills/ordo-init/SKILL.md
1018 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
989 skills/refute/SKILL.md
783 skills/repo-setup/SKILL.md
1022 skills/roadmap/SKILL.md
831 skills/session-retro/SKILL.md
1003 skills/spec/SKILL.md
612 skills/writing/SKILL.md
$ python3 -m py_compile skills/writing/templates/docx_paragraphs.py; echo "py_compile exit $?"
py_compile exit 0
$ git grep -n 'session-retro' -- ':!.scratch' | cut -d: -f1-2 | tr '\n' ' '
README.md:7 README.md:25 README.md:52 README.md:60 README.md:104 docs/dev/scripts.md:22 docs/figures/gen_figures.py:6 docs/figures/gen_figures.py:421 docs/figures/gen_figures.py:527 docs/figures/pipeline.svg:1 docs/figures/pipeline.svg:2 docs/figures/pipeline.svg:129 docs/glossary.md:24 docs/glossary.md:57 docs/glossary.md:75 docs/glossary.md:78 docs/glossary.md:83 docs/glossary.md:93 docs/glossary.md:116 docs/glossary.md:135 docs/glossary.md:138 docs/roadmap.md:171 docs/roadmap.md:172 docs/roadmap.md:173 docs/roadmap.md:206 skills/ordo-help/SKILL.md:27 skills/ordo-help/SKILL.md:109 skills/plan-orchestration/SKILL.md:31 skills/plan-retro/SKILL.md:25 skills/refute/SKILL.md:27 skills/repo-setup/templates/docs/glossary.md:3 skills/repo-setup/templates/plan-terms.md:19 ... :133 skills/session-retro/SKILL.md:2 ... :186
$ grep -n 'never chosen\|launch' agents/*.md | cut -c1-120
agents/ordo-high.md:3:description: Ordo's agent at high effort. The plan skills and `writing` launch it by name for a bu
agents/ordo-high.md:6:You are an agent that Ordo's plan skills and `writing` launch: a builder, a reviewer, a brief-chec
(the same two lines for ordo-medium, ordo-low, ordo-max and ordo-xhigh)
$ git grep -n -e 'lookups of /grill' -e 'lookup agent of /grill' -e 'lookup agents of .grill' -- ':!.scratch' | cut -c1-120
.agents/plan.yaml:10:reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief chec
docs/glossary.md:104:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its
skills/plan/templates/orchestrator-state.md:14:reviewer: claude:<model>     # the model the first run of /refute, the br
skills/plan/templates/orchestrator-state.md:26:reviewer_effort: high        # the effort a reviewer, a brief-check agent
skills/plan/templates/plan.yaml:12:reviewer: claude:opus                     # required. claude:<model> the first run of
skills/plan/templates/plan.yaml:27:reviewer_effort: high                     # optional, default high. The effort a revi
skills/repo-setup/templates/plan-terms.md:99:- **reviewer**: the fresh session or agent that refutes a built step withou
```

The two `sh -c` and `perl` bodies of the character-set command are shortened above with `'...'` only in this quote; the command was run exactly as the brief writes it. The session-retro grep's list is shortened with `...` in the quote; the full list printed matches the builder's.

Commands the builder's report quotes as evidence, rerun:

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ git diff --numstat
3<tab>3<tab>.agents/plan.yaml
4<tab>3<tab>README.md
2<tab>2<tab>agents/ordo-high.md
2<tab>2<tab>agents/ordo-low.md
2<tab>2<tab>agents/ordo-max.md
2<tab>2<tab>agents/ordo-medium.md
2<tab>2<tab>agents/ordo-xhigh.md
3<tab>3<tab>docs/academic-coverage.md
1<tab>0<tab>docs/dev/scripts.md
4<tab>4<tab>docs/glossary.md
1<tab>1<tab>skills/plan/SKILL.md
3<tab>3<tab>skills/plan/templates/plan.yaml
1<tab>1<tab>skills/repo-setup/SKILL.md
1<tab>1<tab>skills/repo-setup/templates/docs/dev/prose-standard.md
1<tab>1<tab>skills/repo-setup/templates/docs/glossary.md
4<tab>4<tab>skills/repo-setup/templates/plan-terms.md
$ git diff -U0 -- docs/glossary.md | grep '^@@'
@@ -44 +44 @@ ...
@@ -46 +46 @@ ...
@@ -104 +104 @@ ...
@@ -122 +122 @@ ...
$ (exact comparison of .agents/plan.yaml lines 1, 10, 13 with item 13, and of the two openers, in python3 -I)
1 True
10 True
13 True
True True
```

The code cases, each on a scratch `.docx` the reviewer built with Python's `zipfile` under `$TMPDIR/refute-3-1-cases` (builder script in the session's scratchpad, outside the worktree), `S=skills/writing/templates/docx_paragraphs.py`:

```
# C9    1: One / 2: / 3: Two                 exit 0
# C10   1: kept added                        exit 0
# C11   1: commented                         exit 0; output grep -c 'COMMENT TEXT' 0; comments.xml grep -c 1
# C12   1: (Faes, 2024)                      exit 0
# C13   1: Before / 2: A / 3: B / 4: After   exit 0
# C14   sh -c "python3 '<abs skill>/templates/docx_paragraphs.py' '<dir>/my grant.docx'"   1: One / 2: / 3: Two   exit 0
#       sh -c "python3 '<abs skill>/templates/docx_paragraphs.py' '<dir>/a\$b.docx'"       1: One / 2: / 3: Two   exit 0
# C15   error: /var/folders/.../refute-3-1-cases/~$x.docx is not a zip file                exit 1
#       error: /var/folders/.../refute-3-1-cases/nodoc.docx has no word/document.xml       exit 1
#       (no argument) Usage: docx_paragraphs.py <file.docx>   exit 2, 0 bytes on stdout; (two arguments) the same, exit 2
# C19   1: See the call.                     exit 0
# C20   1: Name: Jane                        exit 0
# C21   1: A1 / 2: A2 / 3: N                 exit 0
# C22   1: a b c                             exit 0
# C23   1: (Faes 2024) / 2: xy               exit 0
# C24   LC_ALL=C ... | od -An -tx1
           31  3a  20  43  61  66  c3  a9  20  e2  80  93  20  c3  bc  62
           65  72  0a
        exit 0
# C25   1: Body / [word/footnotes.xml] / 2: Note text / [word/footer1.xml] / 3: Footer   exit 0
# order of parts: 1: Body / [word/endnotes.xml] / 2: End / [word/header2.xml] / 3: H2 / [word/header10.xml] / 4: H10 / [word/footer1.xml] / 5: F1
# block-level w:sdt: 1: In block sdt
```

Read-only runs on the user's grants under `/Users/axelfaes/workspace/research-hub/funding/`:

```
$ python3 $S ".../2024-fwo-postdoc-fbttr/~\$nal_version.docx"; echo "exit $?"
error: /Users/axelfaes/workspace/research-hub/funding/2024-fwo-postdoc-fbttr/~$nal_version.docx is not a zip file
exit 1
$ python3 $S ".../veni2026-preproposal-FILLED.docx" > veni.txt         exit 0, 302 lines; parts [word/footnotes.xml] [word/endnotes.xml] [word/footer1.xml]
$ python3 $S ".../Statbel-Intego-koppeling-voorstel.docx" > statbel.txt exit 0, 94 lines; parts footnotes, endnotes, header1, footer1
$ for f in .../2026-nwo-enw-xs/*/*.docx; do python3 $S "$f" | grep -A1 'footer1' | tail -1; done
96: NWO OC ENW-XS v250303NWO OC ENW-XS v2503033 / 4
38: NWO-ENW v251027NWO-ENW v2510271 / 2
66: NWO OC ENW-XS v250303NWO OC ENW-XS v2503033 / 4
38: NWO-ENW v251027NWO-ENW v2510271 / 2
```

Read against the documents: the veni and Statbel outputs are the documents' text (headings, body paragraphs, table cells one per line, citation field results such as "(IMA, 2024)" with no field code; no `ADDIN`, `ZOTERO` or `HYPERLINK` code text; the only grep hits for `ADDIN` were the word "Adding"). The NWO forms' footer lines are not the document's text (finding S3).

The LaTeX listing of `SKILL.md` Steps 3, run on a scratch project and on the gate's manuscript:

```
$ grep -n -e '\\input{' -e '\\include{' main.tex     (scratch)
3:\input{sections/intro}
4:% \input{sections/old}
5:Cost is 5\% \include{sections/b}
$ (resolution of Steps 3 applied to research-hub/projects/manuscripts/hccnet-revision/manuscript/main.tex, python3 -I)
33 files; missing: []
```

`\includegraphics{x.png}` is not matched; every one of the manuscript's 32 include commands is a braced `\input{...}`.

## Verdicts

Items of the brief's "What to build":

- 1: violated, Spec S2 (the venue rule stated twice with different conditions); Standards St1 also sits here. Everything else of item 1 holds: layout sections in order, version "1.0.0", both invocations, the reads, the refusals, the effort checks, the served-model stop, the prompt's bullets, Stops rows with what each shows and resumes, the three anti-patterns, Use instead naming `paper`, `grant` and `/refute`.
- 2: violated, Spec S1 ("Direct quotations" carries the source's quotation exception, widened to every rule). The other rules of D4, D13, D14, D15, D19, D20, D21 stand as the rulings carry them; no proposed replacement is a flagged word or a vague qualifier of the prose standard's section A (read row by row).
- 3: holds. Four registers with register, terminology, example, voice as D18 rules it, and the D22 pairing as the source table pairs it. Read against D22: the line "In Medicine and Health, a methods section that names no reporting guideline is reported." checks that the guideline is named, and the next line keeps the check of whether it is followed out, as D22 says. Humanities, Education, zh-TW and the "We argue that..." sentence are absent.
- 4: violated, Spec S3 (text boxes in the user's footers print twice). Every brief case runs as specified.
- 5: holds; both openers stand in section C word for word (exact comparison above).
- 6: holds; the four terms and `Stated in` sections exist in `SKILL.md` (Steps 5, "What it reads" 2, "The review agent's prompt"); glossary template line 3 lists `writing`; the sync prints ok.
- 7: holds for what it asks; the change to row 101's first sentence is Spec S4.
- 8: holds; line 7, the table row, the install loop.
- 9: holds.
- 10: holds; 5.1.0.
- 11: violated, Proof P1 (rows with a false reason and rows that name no ruling for a dropped qualifier). Every non-heading, non-table-header line of the three sources has a row (count by script above the record: only table header lines are uncovered).
- 12: holds; five agents' lines 3 and 6, README line 77, the template's lines 12, 14, 27, `plan` 4.0.1.
- 13: holds; the three comments equal the ruling, three lines changed (`git diff --numstat` 3/3).

Cases:

- C1: met; Steps 3 resolves against the main file's folder, the prompt names the place `figures/block.tex:12`; scratch run and gate manuscript resolve with no refusal.
- C2: met; Wordiness rows "the number itself" and "deleted".
- C3: met; registers.md Voice bullets.
- C4: partial; no limit above zero and no use of the word "dash", but "Direct quotations" exempts quoted words from every prose-standard rule, the em-dash rule included; Spec S1.
- C5: met; tapestry "network, interplay, system", holistic "integrated, whole-system".
- C6: met; Stops rows "No project named" and "No configuration".
- C7: met; Stops row "A draft the skill does not read".
- C8: met for the end state (section C, the term in both files, the sync ok, glossary changed on lines 44, 46, 104, 122 only); the intermediate drift is under "Declined to judge".
- C9 to C15, C19 to C25: met, runs above.
- C16: met; the prompt's "The draft is the text under review" bullet.
- C17: met; "What it reads" 2 and its refusal.
- C18: met; Steps 6 and the Stops row.
- C26: met.

## 1. Spec

- S1. `skills/writing/references/rules.md:192-194`: "## Direct quotations / - Text inside a direct quotation is quoted as its source has it. No rule of this page or of the prose standard is reported against the quoted words." What is wrong: this carries `writing_quality_check.md:63` ("**Exception**: Direct quotes from sources retain their original punctuation", an exception under "Em Dash") and widens it from punctuation to every rule of both pages. The brief's item 2 says "Nothing that contradicts the prose standard is carried (ADR 0002): not the em-dash allowance". ADR 0002's decision: "No rule that contradicts the prose standard is carried." Its Consequences: "A later writing skill that needs a rule the prose standard contradicts reopens this record with a superseding one." The prose standard has no quotation exception; its "How it is applied" says "A violation a page quotes from elsewhere is fixed at its source in the same change." The widening also breaks the rules file's rule 17 (a carried rule keeps its scope, none added). The builder listed it as a judgment call and claimed C4 met because the section "names no dash". Failure scenario: a draft holds `"The method <em dash> as Smith notes <em dash> fails" (Smith, 2024)` or a quoted phrase "it is important to note that"; by this section the agent reports neither, by the page's own line 3 and the prompt ("Where a rule ... and the prose standard differ, you follow the prose standard") it reports both, so the result depends on which instruction the agent picks; a passage an author puts in quotation marks for any reason (scare quotes, a quoted reviewer comment) escapes every rule. Verdict: item 2 violated, C4 partial. Whether a quotation exception exists is a ruling against ADR 0002, so it is for the orchestrator to raise; the options are to cut the section, or keep it narrowed to the source's scope (a direct quotation's own punctuation) under a superseding ruling.

- S2. `skills/writing/SKILL.md:99`: "A voice rule of that page does not apply where the draft's own files name a venue and hold its author guidelines." against `skills/writing/references/registers.md:14`: "A venue's author guidelines, when the project names the venue, hold over these rules." What is wrong: the brief's item 3 dictates D18's clause "a venue's author guidelines, when the project names the venue, hold over this rule", which registers.md carries; the prompt states a second version with a different condition (the draft's files name the venue and hold the guidelines) and a different effect (the rule "does not apply" instead of the guidelines holding over it). Rules file rule 19 (no two statements that contradict each other) and rule 4 (a rewrite of dictated text is the orchestrator's, reported as a stop); the builder decided it as a judgment call ("The venue clause of D18 is worded as ..."). Failure scenario: a manuscript whose `main.tex` loads a venue class such as `\documentclass{IEEEtran}`, with no guidelines in its files, and the sentence "The authors chose a learning rate of 0.01.": the prompt says the voice rule applies and the sentence is reported; registers.md says the venue's guidelines hold over the rule, which the agent cannot read, so it must guess which of its two instructions wins. Verdict: item 1 violated. Fix: one statement in one place, worded as the agent can apply it; the wording is the orchestrator's, since D18 says "when the project names the venue" and `/writing` reads no venue from `.agents/plan.yaml`.

- S3. `skills/writing/templates/docx_paragraphs.py:74-93` (`visit` recurses into every child of a paragraph) and the brief's premise "`w:fldSimple`, `w:moveFrom`, `w:txbxContent` and block-level `w:sdt` occur in none": the premise holds for `word/document.xml`, which the brief check counted, but not for the parts Decision 3 added after the check. Four of the user's grant files hold a text box in `word/footer1.xml` inside `mc:AlternateContent`, whose `mc:Choice Requires="wps"` and `mc:Fallback` both hold the text; `visit` reads both and folds them into the anchor paragraph. Printed: "96: NWO OC ENW-XS v250303NWO OC ENW-XS v2503033 / 4" for `Application-form-ENW-XS-26-3-LS.docx` (and the same for the three other ENW-XS forms); the footer reads "NWO OC ENW-XS v250303" once, in its own text box, and the page field "3 / 4". Item 4 asks for "every character as the document has it"; the change standard says a script handles a case that has happened, and this one has, in the user's files. The builder's report says "No real grant `.docx` of the user's was opened" and "no premise failed". Failure scenario: step 2 takes an ENW-XS form as its grant `.docx`; a finding on its footer quotes a passage the document does not hold, and its paragraph numbers after the anchor shift nothing but its quote is wrong. Verdict: item 4 violated. Fix: read one branch of `mc:AlternateContent` only; whether a text box's paragraphs print as their own numbered lines (D16 approved "the text of each paragraph") is the orchestrator's choice.

- S4. `docs/academic-coverage.md:101`: "The writing base checks anti-patterns, among them filler terms, dashes, throat-clearing openers, ..." (base: "... filler terms, over three dashes, throat-clearing openers, ..."). What is wrong: a change no item asks for (item 7 replaces the row's last sentence only). The builder reported it under its judgment calls with the reason that the built base has no limit of three. The coverage page's rule says "Each claim in a reason is one the file's lines make, with the file's own numbers and conditions: a reason does not round a number"; the file's number is `writing_quality_check.md:60` ("<less-than or equal to> 3 per paper total, recommend 0-1"), and the new second sentence already states the destination's limit ("holds these checks with a limit of no dashes"). Failure scenario: a reader of row 101 (the plan of a later writing entry, or an audit of the row against its file) learns that the file checks "dashes" and cannot tell that it allowed three per paper, the difference ADR 0002 rules on. Verdict: none (item 7 holds). Fix at landing: the first sentence carries the file's number again, for example "more than three dashes per paper", with the second sentence kept; the exact words are the orchestrator's.

## 2. Proof

- P1. The record of item 11 in `.scratch/3-the-writing-base/agents/reviews/1-report.md`, "The record of item 11", table `writing_quality_check.md`:
  - The rows for source lines 72, 111, 116, 121, 126 and 131 read "states a reason with a claim about AI-generated text, not a rule; the brief's conventions keep such claims out of the academic pages". The source lines hold no such claim: line 72 is "- **Why**: Creates a monotonous enumerate-everything pattern", line 111 "Real analysis doesn't always decompose into trios. Two strong points beat three padded ones", line 121 "In academic writing, consistent terminology is a virtue ...". Lines 61 and 67 do carry the claim.
  - The rows for lines 87 ("Replace with direct claim: "This demonstrates..." or just state the evidence"), 92 ("Replace with the subject directly: "X shows..."") and 94 ("Delete or use "However" if a contrast is intended") name the prose standard's section C line as the place that states the rule. That line says "Delete the opener rather than rewriting it", which contradicts the replacement half; the row names no ruling (D4, ADR 0002) for leaving it out, while rule 18 asks the named place to state the rule whole with its qualifiers.
  - The row for line 63 names `rules.md:194`, which states a wider rule than line 63 (Spec S1).
  - The report's C4 result ("met (no match for `dash`; the references hold no limit above zero and no allowance)") rests on `grep -n -i 'dash'`, which cannot show the absence of an allowance worded without that word.
  What rests on it: the gate's condition "the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, apart from what the entry's rulings leave out". Failure scenario: the gate's reader checks row 94 against section C, finds the "However" half nowhere and no ruling named, and cannot tell whether it was left out on purpose; reading rows 72 to 131 they are told a reason was dropped for an AI claim the line does not make. Verdict: item 11 violated.

## 3. Standards

- St1. `skills/writing/SKILL.md:138-142`: "- The skill writes no file. / - The skill applies no finding. / ... / - The review agent is a fresh agent every run, and it is never the session." against the Anti-patterns rows at `:131-132` ("The session reviews the draft itself", "The session applies a finding") and Steps 7 ("The session changes nothing and adds no finding of its own"). What is wrong: `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in."; its Anti-patterns row "The same rule written in two sections"; and "Writing for an agent": a rule written as a prohibition names the behaviour to do instead, which the two Rules bullets do not. `skills/session-retro/SKILL.md`'s Rules repeat none of its anti-patterns. Failure scenario: when `paper` or `grant` later has `/writing` hand accepted findings over, an editor changes the Anti-patterns row and leaves "The skill applies no finding" in Rules, and the reader finds two rules that disagree. Verdict: none beyond item 1's.

## 4. Behaviour

- none. The report's "Host- or user-visible changes" table states each surface the diff changes with its before and after; the README sentences are shown in its items 8 and 12 with their removed and added lines.

## Declined to judge

- Whether a quotation exception should exist (S1), the venue clause's wording (S2), and how a text box prints (S3): each is a ruling or a choice for the orchestrator or the user; the findings give the options.
- `Use instead` naming `paper` and `grant`, which have no skill folder yet: the brief asks for it (Open item W, ADR 0003), and the brief check left it to the user.
- C8's intermediate state ("it prints a drift before the change, once `plan-terms.md` is edited"): the builder's report does not quote it, and reproducing it would need `docs/glossary.md` put back to its base text to watch the check report a drift, which this review does not do. The end state is verified.
- Whether the worktree's HEAD is 4c51680: `git rev-parse HEAD` would settle it; `git diff 4c51680 --stat` and `git diff --numstat` gave the same 16 files and counts.
- Git commands outside the three named in my brief: I ran `git grep` (the brief's "Verify before you report" 5) and `git diff --numstat` and `git diff -U0 -- docs/glossary.md` (quoted as evidence in the builder's report), as the task's instruction to rerun both requires; all are read-only.
- The brief's `python3 -m py_compile` wrote `skills/writing/templates/__pycache__/docx_paragraphs.cpython-313.pyc` (ignored by `.gitignore` line 5, `__pycache__/`); I removed that folder after the run, so `skills/writing/templates` holds `docx_paragraphs.py` only, as the builder left it (`ls -a` printed `. .. docx_paragraphs.py`).
- Coverage row 170's AI-writing indicators: outside this diff, and the brief check left it to the page's owner.
- Whether the review finds right breaks on real drafts: that is step 2's gate, by its runs and the two reviewers' marks.
- Tracked deletions holding a tab (printed as a space) and `w:noBreakHyphen` (dropped, so "non-linear" prints "nonlinear"): the scratch runs show both, but neither occurs in any of the user's 16 readable grant files (counted read-only), so by the change standard's rule on cases they are no finding.

Reviewer usage: ad97ac04e6f24c9ae, claude-opus-5-5, 288794 tokens, 70 tool uses, 12.0 minutes.

## Repair round 1, refuted

Reviewer: fresh read-only session. Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1`, base `4c51680`, snapshot `/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1-round-1/`. I read the brief, the rules file, the standards, the plan's Rulings, the first refuter report, the round brief, the dispatch block, ADRs 0001 to 0003, the delta (`diff -u` snapshot against worktree for each path of `files.txt`; no path changed that `files.txt` does not list), the whole diff since the base, and the builder's report last. The report is written in the rules file's character set; a character outside it is written by its name in angle brackets.

### Verification (rerun by the reviewer, from the worktree root, in the foreground)

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/*.md skills/writing/templates/docx_paragraphs.py skills/repo-setup/templates/docs/dev/prose-standard.md skills/repo-setup/templates/plan-terms.md skills/repo-setup/templates/docs/glossary.md docs/glossary.md skills/repo-setup/SKILL.md docs/academic-coverage.md README.md docs/dev/scripts.md agents/ordo-low.md agents/ordo-medium.md agents/ordo-high.md agents/ordo-xhigh.md agents/ordo-max.md skills/plan/templates/plan.yaml skills/plan/SKILL.md .agents/plan.yaml .scratch/3-the-writing-base/agents/reviews/1-report.md | xargs -0 sh -c '<the existence filter of the brief>' sh | xargs -0 perl -CSD -ne '<the character-set check of the brief>'; echo "exit $?"
exit 0
```

(The two quoted bodies, the filter and the perl program, are abbreviated in angle brackets in this quote only; the command was run exactly as the brief's "Verify before you report" 1 writes it, and printed nothing before `exit 0`.)

```
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
965 skills/diagnose/SKILL.md
877 skills/grill/SKILL.md
725 skills/land/SKILL.md
564 skills/ordo-help/SKILL.md
632 skills/ordo-init/SKILL.md
1018 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
989 skills/refute/SKILL.md
783 skills/repo-setup/SKILL.md
1022 skills/roadmap/SKILL.md
831 skills/session-retro/SKILL.md
1003 skills/spec/SKILL.md
612 skills/writing/SKILL.md
$ python3 -m py_compile skills/writing/templates/docx_paragraphs.py; echo "py_compile exit $?"
py_compile exit 0
```

The compile wrote `skills/writing/templates/__pycache__`; I removed it, and `ls -a skills/writing/templates` prints `. .. docx_paragraphs.py`. Every later run of the script used `PYTHONDONTWRITEBYTECODE=1`.

```
$ git grep -n 'session-retro' -- ':!.scratch' | cut -d: -f1-2 | tr '\n' ' '
README.md:7 README.md:25 README.md:52 README.md:60 README.md:104 docs/dev/scripts.md:22 docs/figures/gen_figures.py:6 docs/figures/gen_figures.py:421 docs/figures/gen_figures.py:527 docs/figures/pipeline.svg:1 docs/figures/pipeline.svg:2 docs/figures/pipeline.svg:129 docs/glossary.md:24 docs/glossary.md:57 docs/glossary.md:75 docs/glossary.md:78 docs/glossary.md:83 docs/glossary.md:93 docs/glossary.md:116 docs/glossary.md:135 docs/glossary.md:138 docs/roadmap.md:171 docs/roadmap.md:172 docs/roadmap.md:173 docs/roadmap.md:206 skills/ordo-help/SKILL.md:27 skills/ordo-help/SKILL.md:109 skills/plan-orchestration/SKILL.md:31 skills/plan-retro/SKILL.md:25 skills/refute/SKILL.md:27 skills/repo-setup/templates/docs/glossary.md:3 skills/repo-setup/templates/plan-terms.md:19 skills/repo-setup/templates/plan-terms.md:52 skills/repo-setup/templates/plan-terms.md:70 skills/repo-setup/templates/plan-terms.md:73 skills/repo-setup/templates/plan-terms.md:78 skills/repo-setup/templates/plan-terms.md:88 skills/repo-setup/templates/plan-terms.md:111 skills/repo-setup/templates/plan-terms.md:130 skills/repo-setup/templates/plan-terms.md:133 skills/session-retro/SKILL.md:2 ... skills/session-retro/SKILL.md:186
$ grep -n 'never chosen\|launch' agents/*.md | cut -c1-260
agents/ordo-medium.md:3:description: Ordo's agent at medium effort. The plan skills and `writing` launch it by name for a builder, a reviewer, a brief-check agent or the review agent of `writing`; it is never chosen for other work.
agents/ordo-medium.md:6:You are an agent that Ordo's plan skills and `writing` launch: a builder, a reviewer, a brief-check agent or the review agent of `writing`. ...
(the same two lines, with the same wording, for ordo-high, ordo-max, ordo-low and ordo-xhigh)
$ git grep -n -e 'lookups of /grill' -e 'lookup agent of /grill' -e 'lookup agents of .grill' -- ':!.scratch' | cut -c1-400
.agents/plan.yaml:10:reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review of /writing run on.
docs/glossary.md:104:- **reviewer**: ... The brief-check agent, the diagnosis agent, the lookup agents of `grill` and the review agent of `writing` run on `reviewer:`. ...
skills/plan/templates/orchestrator-state.md:14:reviewer: claude:<model>     # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
skills/plan/templates/orchestrator-state.md:26:reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
skills/plan/templates/plan.yaml:12:reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review of /writing run on.
skills/plan/templates/plan.yaml:27:reviewer_effort: high                     # optional, default high. The effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill and the review agent of /writing run at: low, medium, high, xhigh or max.
skills/repo-setup/templates/plan-terms.md:99:- **reviewer**: ... the lookup agents of `grill` and the review agent of `writing` run on `reviewer:`. ...
```

(`...` marks my cut of a long printed line, so those lines are not verbatim to the end. The `orchestrator-state.md` lines are the plan skills' own configuration block comments, which the brief's "What is on the tree" leaves unchanged. `plan.yaml:27` is shown as printed except that I wrote "a diagnosis agent, a lookup agent of /grill and the review agent of /writing" from the file's exact text; the file reads "a diagnosis agent, a lookup agent of /grill and the review agent of /writing run at".)

Commands the builder's report quotes as evidence, rerun:

```
$ git diff 4c51680 --numstat -- .agents/plan.yaml
3<tab>3<tab>.agents/plan.yaml
$ (python3 -I: line 1 equals item 13's line 1; line 10's comment and line 13's comment equal item 13's text)
True True True True
$ (python3 -I: "In today's rapidly evolving" and "As a matter of fact" in section C)
True True
$ git show 4c51680:skills/writing/templates/docx_paragraphs.py
fatal: path 'skills/writing/templates/docx_paragraphs.py' exists on disk, but not in '4c51680'
$ grep -rn -i 'quot' skills/writing
skills/writing/SKILL.md:3:description: ...
skills/writing/SKILL.md:43:     - Both paths are in single quotes. A `'` inside a path is written `'\''`, so a name with spaces or a `$` reaches the script whole.
skills/writing/SKILL.md:106:  - the passage, quoted as the draft has it;
$ grep -n -i 'venue' skills/writing/SKILL.md skills/writing/references/*.md
skills/writing/references/registers.md:14:- A venue's author guidelines, when the project names the venue, hold over these rules.
$ grep -n -i 'dash\|exempt\|except\|unless\|allow\| may \|permit\|hold over' skills/writing/references/*.md skills/writing/SKILL.md   (the hits: rules.md 24, 37, 42, 190 and registers.md 14, SKILL.md 131; none concerns a dash, a punctuation mark or a rule of the prose standard)
$ sh skills/land/... not run (the plan's whole verify list runs at landing)
```

The record's quoted lines: a Python run over the builder's report matched every `skills/...:N` plus quoted line pair (221 pairs) against the files; the 62 non-matches were table rows whose quote writes `\|` for `|`, and each of those lines read the same in the file (159 plain matches, 62 pipe-escaped).

Scratch `.docx` files built by me with Python's `zipfile` under the session scratchpad; `S=skills/writing/templates/docx_paragraphs.py`:

```
# C9    1: One / 2: / 3: Two                    exit 0
# C10   1: kept added                           exit 0
# C11   1: commented                            exit 0; grep -c 'COMMENT TEXT' on the output prints 0
# C12   1: (Faes, 2024)                         exit 0
# C13   1: Before / 2: A / 3: B / 4: After      exit 0
# C14   sh -c "python3 '<S>' '<dir>/my grant.docx'"   1: One / 2: / 3: Two   exit 0
#       sh -c "python3 '<S>' '<dir>/a\$b.docx'"       1: One / 2: / 3: Two   exit 0
# C15   error: ~$x.docx is not a zip file                 exit 1
#       error: nodoc.docx has no word/document.xml        exit 1
#       Usage: docx_paragraphs.py <file.docx>              exit 2
# C19   1: See the call.                        exit 0
# C20   1: Name: Jane                           exit 0
# C21   1: A1 / 2: A2 / 3: N                    exit 0
# C22   1: a b c                                exit 0
# C23   1: (Faes 2024) / 2: xy                  exit 0
# C24   LC_ALL=C ... | od -An -tx1:  31 3a 20 43 61 66 c3 a9 20 e2 80 93 20 c3 bc 62 65 72 0a   exit 0
# C25   1: Body / [word/footnotes.xml] / 2: Note text / [word/footer1.xml] / 3: Footer   exit 0
# C27   1: Anchor / 2: Box                      exit 0
# C27 on the snapshot script (before the round): 1: AnchorBoxBox   exit 0
# extra: choice with two box paragraphs and a different fallback: 1: Before after / 2: Box one / 3: Box two / 4: Next
#        legacy w:pict text box with no mc:AlternateContent: 1: Prepost / 2: Legacy
#        box in a table cell: 1: Cell  / 2: InCell / 3: Z
#        box inside a box: 1: Outer / 2: L1 / 3: L2 / 4: L1b
#        box inside a field result: 1: 3 / 4 / 2: BoxF
#        mc:AlternateContent with a mc:Fallback and no mc:Choice: 1: AB   (the fallback's text is dropped)
```

The four ENW-XS forms (read only), tails from the first part after the body:

```
Application-form-ENW-XS-26-3.docx (103 lines)
[word/footnotes.xml]
[word/endnotes.xml]
[word/header1.xml]
94: Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026
95:
[word/footer1.xml]
96: 3 / 4
97: NWO OC ENW-XS v250303
98:
99:
Application-form-ENW-XS-26-3-LS.docx: the same with numbers 64, 65, 66 to 69
Information-form-ENW-XS-2026-2.docx and Information-form-ENW-XS-26-3-LS.docx (43 lines each):
[word/header1.xml]
36: Information Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026
37:
[word/footer1.xml]
38: 1 / 2
39: NWO-ENW v251027
```

I read the footer XML of `Application-form-ENW-XS-26-3-LS.docx` and `Information-form-ENW-XS-26-3-LS.docx` as a tree: the first run holds `mc:AlternateContent` with a `mc:Choice` text box (`NWO OC ENW-XS v250303` and two empty paragraphs, or `NWO-ENW v251027`) and a `mc:Fallback` text box with the same text; a second `mc:AlternateContent` holds a shape without text; the page fields `PAGE` and `NUMPAGES` are results in the anchor paragraph. The output is the footer's text, once. `veni2026-preproposal-FILLED.docx`: exit 0, 302 lines, the same output as the snapshot script (headings, body paragraphs, table cells one per line, citation field results, `[word/footnotes.xml]` with "To avoid gender effects, please do not state your first name.", `[word/footer1.xml]` with the page number); no field code text. Across the 16 readable `.docx` files under `research-hub/funding/`, the new script differs from the snapshot script on five: the four ENW-XS forms and `Project proposal unremunerated or clinical PhD - HexC V 2-2-25.docx`, whose `word/header1.xml` holds a text box containing only a picture, which now prints one more empty numbered line (`334:`) at the end.

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. Layout sections in order, version "1.0.0", both invocations, the reads with their refusals, Steps 4 to 6 (effort checks, served-model stop), the prompt's bullets (C16 text), the Stops rows, the three anti-patterns, "Use instead" naming `paper`, `grant` and `/refute`. S2 and St1 are closed (see the rulings below).
- 2: holds. The section "Direct quotations" is gone (`grep -rn -i 'quot' skills/writing` above); D4, D13, D14, D15, D19, D20, D21 stand; no replacement is a flagged or vague word of the prose standard's section A (read table by table).
- 3: holds. Four registers with register, terminology, voice as D18, the D22 line; no Humanities, Education, zh-TW or "We argue that" sentence.
- 4: holds. Every case runs as the brief says (C9 to C15, C19 to C25 above); S3 is closed.
- 5: holds. Both openers stand in section C (`True True`).
- 6: holds. The four terms and their "Stated in" sections exist in `SKILL.md` (Steps 5, "What it reads" 2, "The review agent's prompt"); template glossary line 3 lists `writing`; the sync prints `ok`.
- 7: holds. Rows 76, 100 and 101 name the destinations; row 101's first sentence is "more than three dashes per paper"; `check_coverage.py` prints `ok: docs/academic-coverage.md`; the longest sentence of row 101 is about 29 words.
- 8: holds. Line 7, the table row, the install loop (`... session-retro spec writing; do`).
- 9: holds. `docs/dev/scripts.md:23` has the row, and its text now says the text box rule.
- 10: holds. `skills/repo-setup/SKILL.md:5` reads 5.1.0.
- 11: holds. P1 is closed: the rows of lines 72, 111, 116, 121, 126, 131 give the section of the prose standard that holds the rule (the quoted prose standard lines 34, 47, 49, 50, 51, 52 match the file); the rows of 87, 92, 94 name ADR 0002 and the brief's item 2 for the replacement half and quote section C; the row of 63 names the same two; the AI-text claim stays on the lines that make it (source lines 5, 15, 61, 67).
- 12: holds. Five agent files lines 3 and 6, `README.md`, the template's lines 12, 14, 27, `skills/plan/SKILL.md:5` reads "4.0.1".
- 13: holds. The three lines equal the ruling; `git diff 4c51680 --numstat -- .agents/plan.yaml` prints 3 and 3.

Cases of the brief's "Cases" (and C27 of the round brief):

- C1: met. Steps 3 resolves against the main file's folder, and the prompt names `figures/block.tex:12`.
- C2: met. Wordiness rows "the number itself" and "deleted".
- C3: met. `registers.md:10-11`.
- C4: met. No allowance of a dash and no limit above zero in `references/`; the "Direct quotations" exception is gone; the exemptions that remain (hedging, a discipline's standard terminology, connected ideas, the clarity test, the venue clause) concern no dash and no rule of the prose standard.
- C5: met. "tapestry" gives "network, interplay, system"; "holistic" gives "integrated, whole-system".
- C6: met. Stops rows "No project named" and "No configuration".
- C7: met. Stops row "A draft the skill does not read".
- C8: met for the end state (section C, the term in `plan-terms.md` and `docs/glossary.md`, sync `ok`, glossary changed on lines 44, 46, 104, 122 only per the diff); the intermediate drift is under "Declined to judge".
- C9 to C15, C19 to C25, C27: met, by my own runs above. C21's expected output is met; the builder's variant with an empty paragraph after a nested table is the builder's own addition.
- C16: met. The prompt's bullet "The draft is the text under review".
- C17: met. "What it reads" 2 and the refusal naming the three paths.
- C18: met. Steps 6 and the Stops row.
- C26: met.

### Rulings

- S1: closed. `rules.md` ends at "Formality"; no quotation exception remains in `skills/writing`; the record row of source line 63 names ADR 0002 and the brief's item 2. It was closed by deleting the section the ruling named, not by removing a check.
- S2: closed. The sentence is gone from "The review agent's prompt" and the clause stands once, at `registers.md:14`, in D18's words. The clause's applicability by the agent is under "Declined to judge".
- S3: closed. My C27 run prints `1: Anchor / 2: Box`, the snapshot script printed `1: AnchorBoxBox`, and the four ENW-XS forms print each text box once on its own line after the anchor's line. The change stays inside the ruling (`first_choice`, the `mc:AlternateContent` branches, the box lines, the head comment and the `docs/dev/scripts.md` row that carries the change). See Standards finding 1 for one branch of it.
- S4: closed. Row 101 reads "more than three dashes per paper" and the second sentence is unchanged.
- P1: closed (item 11 above). C4 is now checked by reading both pages, and the report states what the reading found; my `grep` over the two pages and `SKILL.md` agrees.
- St1: closed. "Rules" holds two bullets that no other section holds (the prose standard has no copy here; everything specific comes from `.agents/plan.yaml`); the no-file rule is Steps 7, the no-finding rule is the Anti-patterns row "The session applies a finding", the fresh-agent rule is Steps 5 and the row "The session reviews the draft itself", the precedence of the prose standard is the prompt's sub-bullet. Read against `docs/dev/skill-layout.md`, "Where a rule goes", "Lists and tables" and the Anti-patterns table. Two sentences outside "Rules" were reworded with it: the introduction ("It leaves behind nothing: the report is the message that ends the turn") and Steps 7 ("The session writes no file and adds no finding of its own"). Both serve the ruling.

No finding was closed by removing a check that guarded something; no fix reaches beyond its ruling (the only changes outside the six named files are `docs/dev/scripts.md`, which carries S3's behaviour to the page that lists the script, and the SKILL.md sentences named above); every closure the builder claims reproduces in my reruns.

### 1. Spec

- S1. Round brief, "Report" and ruling 3 / `.scratch/3-the-writing-base/agents/reviews/1-report.md`, "Repair round 1", the table and "Ruling 3": "Case C27, a paragraph "Anchor" ... prints `1: Anchor` and `2: Box`, exit 0". What is wrong: the round brief asks for one row per ruling "with what changed (file and line)", and rows 1, 3 and 6 name a section or a function, with line numbers only in some rulings' check output; the report gives no first run of C27 on the unchanged tree (the base has no script, as `git show 4c51680:skills/writing/templates/docx_paragraphs.py` shows, and the pre-round script prints `1: AnchorBoxBox`). Failure scenario: a reader who follows the table to `rules.md` or `docx_paragraphs.py` finds the section or function but not the line, and cannot see that C27 fails before the round. Verdict: none (items hold, C27 met).

### 2. Proof

- none. Every closure claim reproduces: the greps of Rulings 1, 2, 4 and 6, the C27 and ENW-XS runs of Ruling 3, the P1 rows against the sources' lines 63, 72, 87, 92, 94, 111, 116, 121, 126, 131 (`sed -n` of `writing_quality_check.md`) and the prose standard's lines.

### 3. Standards

- S1. `skills/writing/templates/docx_paragraphs.py:59-64, 74-77, 96-99`: "def first_choice(alternate): ... return None" and "choice = first_choice(child) / if choice is not None: yield from paragraphs(choice)"; what is wrong: the two `is not None` branches handle an `mc:AlternateContent` with no `mc:Choice`, an input that has not happened (a scan of all `word/*.xml` parts of the 16 readable `.docx` files under `research-hub/funding/` finds 16 `mc:AlternateContent` and none without a `mc:Choice`) and that the markup-compatibility schema does not allow; `docs/dev/change-standard.md` rule 2 ("A guard that silently skips work is a silent partial result and is forbidden") and "Scripts compute facts; judgment is read" ("A script handles a case only when that case has happened or when a wrong answer on it costs something"); `refute`'s Standards heading ("code larger than its job: a branch ... for an input that has not happened"). The head comment says only that "the first mc:Choice is read and mc:Fallback is never read" and does not state what happens with no Choice. Failure scenario: a `.docx` whose `mc:AlternateContent` holds only a `mc:Fallback` (my scratch case: `1: AB`) prints none of the fallback's text and no error, so a finding on that document is made from text with a silent gap; without the guard the script would end with Python's traceback and exit 1, as the head comment already says of other malformed parts. Verdict: none (item 4 holds). Fix at landing, if the orchestrator takes it: read `next(child for child in alternate if child.tag == MC + "Choice")` and let a missing Choice end with the traceback the head comment already describes for malformed parts, or state the no-Choice case in the head comment; the choice is the orchestrator's.

### 4. Behaviour

- none. The one visible effect the round adds beyond the ruled text is that a text box holding no text (the picture-only box in the header of `Project proposal unremunerated or clinical PhD - HexC V 2-2-25.docx`) now prints one extra empty numbered line at the end; that follows from the ruling "each paragraph inside a text box prints as its own numbered line" and changes no text. The report's table of visible changes compares with the base, where the script did not exist.

### Declined to judge

- Whether the venue clause at `registers.md:14` ("when the project names the venue") can be applied by the agent: `/writing` reads no venue from `.agents/plan.yaml` and the prompt gives the agent no source for it, so the agent applies it only if the draft's text says it. The round brief ruled that D18's words stay as they stand; whether that wording or a source for the venue is wanted is the orchestrator's or the user's call.
- C8's intermediate state (a drift reported before `docs/glossary.md` is synced): `git show 4c51680:docs/glossary.md` put back into a scratch copy and `python3 skills/repo-setup/templates/sync_rules.py` run on it would settle it; this review runs no write and no git command beyond the three named, so I did not.
- Whether the worktree's HEAD is `4c51680`: `git rev-parse HEAD` would settle it; `git diff 4c51680 --stat` printed 16 files changed, 36 insertions, 34 deletions.
- Git commands outside the three named: I ran `git grep` (the brief's "Verify before you report" 5), `git diff 4c51680 --numstat`, `--stat` and `--name-only`; all are read only.
- `Use instead` naming `paper` and `grant`, which have no skill folder yet: the brief asks for it (Open item W, ADR 0003) and the brief check left it to the user.
- Whether the review finds right breaks on real drafts: step 2's runs and the two reviewers' marks.
- Coverage row 170's AI-writing indicators and the figures' lists: outside this diff, as the brief says.
- Tracked deletions holding a tab and `w:noBreakHyphen`: neither occurs in the 16 readable grant files, so by the change standard's rule on cases they are no finding.

Reviewer usage: a15e1830c0fcc52fe, claude-sonnet-5-5, 221572 tokens, 51 tool uses, 8.9 minutes.

## Closed

- First run, Spec S1, S2, S3 and S4, Proof P1 and Standards St1: closed in repair round 1 (`agents/briefs/1-round-1.md`, rulings 1 to 6), each closure reproduced by the run over round 1 above.
- Round 1, Spec S1 (the round's report rows name sections rather than lines, and no first run of C27 before the round): no change to the step. The first run of C27 before the round is the reviewer's run on the snapshot script, `1: AnchorBoxBox`, quoted above; the landing booking quotes it beside the round.
- Round 1, Standards S1 (the `is not None` guards of `first_choice` in `docx_paragraphs.py`): fixed at landing. `first_choice` takes the first `mc:Choice` with `next(...)`, the two guards are removed, so an `mc:AlternateContent` with no `mc:Choice` ends with Python's traceback and exit status 1, and the head comment says so.
- Declined to judge, the venue clause of `registers.md`: it stands in the words of ruling D18, which the round kept as they stand; no change.
