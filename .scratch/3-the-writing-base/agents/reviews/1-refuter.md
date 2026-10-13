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
