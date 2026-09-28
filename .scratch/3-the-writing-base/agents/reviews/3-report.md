Everything in the brief, and in the cases ruling `agents/briefs/3-cases.md`, is done

## Open items of the state file, verbatim

- Open item C (step 2, raised 2026-09-28): the review over step 2's last repair round left work that is not small enough to fix at landing, and the round cap allows no further round. (1) Twelve branches of `check_prose.py` have no test case, so removing any of them leaves the test green: among them the floor at 0 of the LaTeX list and table depth (a stray `\end{itemize}` would make every later line a list item), the guard for a stray `\end{abstract}` (without it the script would crash), the `\item` label read as text, and inline `$...$` not spanning a blank line (also missing from the head docstring). (2) LaTeX data rows reach beyond data: a line that is one command with its arguments, such as `\footnote{...}` or `\emph{...}`, and the brace groups after a lone command such as `{\small ...}` after `\noindent`, are left out of the semicolon count; the reviewer's probe hid ten semicolons. (3) The contrast window runs across a removed Markdown code span, which gives a false contrast in `skills/plan-retro/SKILL.md` line 41. (a) A new step 2a, before step 4: a builder gives each of the twelve branches a case, or removes the branch where no input reaches it; narrows the LaTeX data row to a line of one command whose argument text holds no sentence and drops the argument-line reading except for lines that continue that command; and makes a removed code span end the contrast window; with its own review. Step 4 runs this script, so it waits for 2a. Pro: `/writing` is built on a script whose every rule is proven. Con: one more build and review. (b) Land step 2 as it is and leave the three points. This is the lazy option: the script keeps untested branches and hides semicolons in footnotes. Recommendation: (a).

## The cases' first run, on the unchanged tree

Each case was written as a check before any page, in `cases.py` in the builder's scratchpad outside the worktree (`/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/cases.py`), run from the worktree root as `python3 -B <cases.py> <case>`:

- Case 1 runs `check_prose.py` on the three pages, requires exit 0 or 1, and marks each flag QUOTED (the trigger is inside a double-quoted example on that page line) or OWN-PROSE.
- Case 2 reads each row of `3-rows.md`, resolves every `<file>, line N` it names and prints that line, and marks a row with no line or a missing line BAD.
- Case 3 requires the three records in coverage order, every non-blank source line (fence markers, table separator rows and thematic breaks excluded) in exactly one row, the row count equal to the record's "Rule-bearing lines listed", and prints each source heading with the row that covers it.
- Case 4 lists each "prose standard, section X" naming on the pages and refuses a line that holds one of 18 phrases of the prose standard's rules.
- Case 5 greps 30 key-term groups across `skills/writing/references/` and lines 1-117 of `check_prose.py`.
- Case 6 is the verify runner.

| Case | Result on the unchanged tree |
|---|---|
| 1 | exit 64, `check_prose.py: cannot read skills/writing/references/academic-prose.md: No such file or directory`, `case 1: FAILS` |
| 2 | `missing .scratch/3-the-writing-base/agents/reviews/3-rows.md`, `case 2: FAILS` |
| 3 | `missing .scratch/3-the-writing-base/agents/reviews/3-rows.md`, `case 3: FAILS` |
| 4 | the three pages missing, `case 4: FAILS`; control, a table row whose fix cell holds "the evidence decides the count (prose standard, section D)": `RESTATES ...: /the evidence decides the count/`, `case 4: FAILS`, exit 1 |
| 5 | pages missing, `case 5: FAILS`; its greps showed `prose-standard.md:26` (many on the vague list), `prose-standard.md:50` (one term per concept, no section limit) and `prose-standard.md:47` (the evidence decides the count) |
| 6 | seven `PASS:` lines, `verify: 8 commands passed`, exit 0 |

The cases the brief's text got wrong, handed back before any page was written, and the orchestrator's ruling on each (`agents/briefs/3-cases.md`):

1. The wordy table's "a large number of" to "many" contradicts prose standard A, which lists "many" as vague (case 5), and would be flagged as the page's own prose (case 1). Ruling (a): the replacement is "the number itself" naming section A. Carried at `academic-prose.md` line 88; the record's row for source line 138 says so.
2. Synonym cycling's "one term per concept per section" narrows section D's rule (case 5) or restates it (case 4). Ruling (a): the row carries the pattern, the example and why it fails, and its fix cell names section D; "per section" is recorded as not carried. Carried at `anti-patterns.md` line 11; record 3, row for source lines 119-122.
3. The fix cells of the section D rows restated D (case 4), and the source's 10-sentence paragraph example breaks D's four-sentence limit. Ruling (a): each fix cell names section D and carries only what D does not state. Carried at `anti-patterns.md` lines 9, 10 and 12; the 10-sentence example is recorded as not carried (record 3, source lines 114-117).
4. Source rules the brief left without an instruction. Ruling: (i) third person carried, `academic-prose.md` line 18; (ii) "(or clearly connected ideas)" carried, line 10; (iii) "prefer short sentences for complex ideas" not carried, section E named at line 12, recorded; (iv) the flagged-term "why" and "better alternatives" columns not carried, recorded (record 3, source lines 17-45); (v) the equal-length fixes carried in the fix cell of `anti-patterns.md` line 19; (vi) the clarity test in the source's wording with its reason, `judgment.md` line 15; (vii) the "used by" lines marked "Not a rule: the page's opening paragraph names its readers" (record 1 lines 1, 3; record 2 lines 1, 3; record 3 line 9).
5. Passive voice in the Engineering and CS register: carried beside section E's rule, `academic-prose.md` line 25; case 5's `passive` grep lists both lines.

## DONE / NOT DONE

| Item | Status | Command | Output |
|---|---|---|---|
| `academic-prose.md` with the rules of brief item 1 and rulings 1, 4(i)-(iii), 5 | DONE | case 2 below | every row of record 1 resolves to the line quoted |
| `judgment.md` with the rules of brief item 2 and ruling 4(vi) | DONE | case 2 below | every row of record 2 resolves |
| `anti-patterns.md` with the rows and lists of brief item 3 and rulings 2, 3, 4(v) | DONE | case 2 below | every row of record 3 resolves |
| `3-rows.md`, three records, one row per rule | DONE | case 3 below | `case 3: HOLDS` |
| Case 1 | DONE | `python3 -B <cases.py> 1` | below |
| Case 2 | DONE | `python3 -B <cases.py> 2` | below |
| Case 3 | DONE | `python3 -B <cases.py> 3` | below |
| Case 4 | DONE | `python3 -B <cases.py> 4` | below |
| Case 5 | DONE | `python3 -B <cases.py> 5` | below |
| Case 6, the verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md` | below, exit 0 |
| Pages ASCII | DONE | `LC_ALL=C grep -n '[^ -~]' skills/writing/references/*.md .scratch/3-the-writing-base/agents/reviews/3-rows.md` | no output, exit 1 |
| No history on the pages | DONE | `grep -n -i 'academic_writing_style\|writing_judgment\|writing_quality\|research-hub\|moved from\|source' <the three pages>` | three hits, each about citing sources: `academic-prose.md:106`, `academic-prose.md:121`, `judgment.md:34`; no source file named |
| Only the brief's paths written | DONE | `git status --short --untracked-files=all` | below |

### The verify list

```text
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
verify exit 0
```

### Case 1

Every printed line is a quoted example of what it names: "in order to" quoted as a throat-clearing opener that section C covers (`academic-prose.md` line 96), "many" in the quoted vague form "many studies" (line 102), and the four flagged words inside the quoted exemption examples "paradigm shift", "landscape", "robust estimator" and "navigate" (`anti-patterns.md` line 18).

```text
exit 1
QUOTED skills/writing/references/academic-prose.md:96: throat-clearing: "in order to": a throat-clearing opener, to be cut
QUOTED skills/writing/references/academic-prose.md:102: vague: "many": a vague qualifier, to be checked against section A of the prose standard
QUOTED skills/writing/references/anti-patterns.md:18: flagged: "landscape": a flagged word, to be checked against section A of the prose standard
QUOTED skills/writing/references/anti-patterns.md:18: flagged: "navigate": a flagged word, to be checked against section A of the prose standard
QUOTED skills/writing/references/anti-patterns.md:18: flagged: "paradigm": a flagged word, to be checked against section A of the prose standard
QUOTED skills/writing/references/anti-patterns.md:18: flagged: "robust": a flagged word, to be checked against section A of the prose standard
case 1: HOLDS
```

### Case 2

Each line gives the row's line in `3-rows.md`, the rule, its source lines and each destination line as read. Read row by row, each destination states the rule of its source lines with its qualifiers, or the row is "Not carried" or "Not a rule" with its reason.

```text
== academic_writing_style.md
row 13 [The file's title and the agents that use it] src 1, 3 -> Not a rule: the page's opening paragraph names its readers (ruling 4(vii)), `academic-prose.md`, line 3
row 13 [The file's title and the agents that use it] src 1, 3 -> skills/writing/references/academic-prose.md:3: This page holds the prose rules for academic text: the core principles, the Engineering and CS register, the hedging scale, transition words, the shape of a paragraph, the wordy and vague forms with their replacements, the tense of each section and the punctuation of quotations. The `writing` skill reads a text against it, and so do the writing skills built on `writing`. A rule the prose standard (`references/prose-standard.md`) already states is named here by its section.
row 14 [The most specific term] src 5, 7, 8 -> skills/writing/references/academic-prose.md:7: - **Specific terms.** Use the most specific term available.
row 15 [Technical terms defined at first use] src 9 -> skills/writing/references/academic-prose.md:8: - **Definitions.** Define each technical term at its first use.
row 16 [A pronoun only with a clear antecedent] src 10 -> skills/writing/references/academic-prose.md:9: - **Antecedents.** Use a pronoun such as "this" or "it" only where its antecedent is clear.
row 17 [Filler words and redundant phrases cut] src 12, 13 -> skills/writing/references/academic-prose.md:11: - **Filler.** Prose standard, section A, holds the filler words, and the wordy forms below are the redundant phrases to cut.
row 17 [Filler words and redundant phrases cut] src 12, 13 -> skills/writing/references/prose-standard.md:24: Banned as filler; cut or replace with the concrete fact: easy, simple, quick, very, really, just (as a softener; temporal "just" and genuine minimality claims stay), simply.
row 18 [One idea per sentence, or clearly connected ideas] src 14 -> skills/writing/references/academic-prose.md:10: - **One idea per sentence.** Give each sentence one idea, or ideas that are clearly connected.
row 19 [Short sentences preferred for complex ideas] src 15 -> Not carried as its own rule (ruling 4(iii)): section E's limit is kept, `prose-standard.md`, line 64, named at `academic-prose.md`, line 12
row 19 [Short sentences preferred for complex ideas] src 15 -> skills/writing/references/prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell of a coverage table, which lists what a file holds, may run to about 35 words.
row 19 [Short sentences preferred for complex ideas] src 15 -> skills/writing/references/academic-prose.md:12: - **Sentence length.** Prose standard, section E, holds the sentence-length rule.
row 20 [Claims based on evidence, not opinion] src 17, 18 -> skills/writing/references/academic-prose.md:13: - **Evidence.** Base each claim on evidence rather than opinion.
row 21 [Hedging for uncertain claims] src 19 -> skills/writing/references/academic-prose.md:14: - **Hedging.** Hedge an uncertain claim, on the scale under Hedging.
row 22 [Limitations and alternative interpretations acknowledged] src 20 -> skills/writing/references/academic-prose.md:15: - **Limitations.** Acknowledge the limitations of a claim and the alternative interpretations of its evidence.
row 23 [Full forms] src 22, 23 -> skills/writing/references/academic-prose.md:16: - **Full forms.** Write the full form: "do not" rather than "don't".
row 24 [Formal academic vocabulary, colloquialisms and slang kept for informal writing] src 24 -> skills/writing/references/academic-prose.md:17: - **Formal vocabulary.** Use formal academic vocabulary, and keep colloquialisms and slang for informal writing.
row 25 [Third person unless discipline conventions allow first person] src 25 -> skills/writing/references/academic-prose.md:18: - **Person.** Write in the third person unless the discipline's conventions allow the first person.
row 26 [Sciences register] src 29, 31, 32, 33, 34 -> Not carried: the coverage row keeps Engineering and CS of the six registers
row 27 [Social sciences register] src 37, 39, 40, 41, 42 -> Not carried: the coverage row keeps Engineering and CS of the six registers
row 28 [Humanities register] src 45, 47, 48, 49, 50 -> Not carried: the coverage row keeps Engineering and CS of the six registers
row 29 [Engineering and CS register: formal, problem and solution, specification-precise] src 27, 53, 55 -> skills/writing/references/academic-prose.md:24: - **Register.** Formal, oriented to a problem and its solution, and precise to the specification.
row 30 [Engineering and CS voice: passive for methods, active for contributions] src 56 -> skills/writing/references/academic-prose.md:25: - **Voice.** Passive voice is common for methods, and active voice for contributions. In a method step the actor is usually irrelevant, which is the case prose standard, section E, allows for the passive.
row 30 [Engineering and CS voice: passive for methods, active for contributions] src 56 -> skills/writing/references/prose-standard.md:63: - **Passive voice**: rewrite unless the actor is irrelevant.
row 31 [Engineering and CS terminology: technical specifications, performance metrics] src 57 -> skills/writing/references/academic-prose.md:26: - **Terminology.** Technical specifications and performance metrics.
row 32 [Engineering and CS example sentence] src 58 -> skills/writing/references/academic-prose.md:27: - **Example.** "The proposed algorithm achieves O(n log n) complexity, outperforming the baseline by 34% on the benchmark dataset."
row 33 [Education register] src 61, 63, 64, 65, 66 -> Not carried: the coverage row keeps Engineering and CS of the six registers
row 34 [Medicine and health register] src 69, 71, 72, 73, 74 -> Not carried: the coverage row keeps Engineering and CS of the six registers
row 35 [Hedging scale, weak: may, might, could, possibly] src 77, 79, 80, 82 -> skills/writing/references/academic-prose.md:35: | Weak | may, might, could, possibly | "This may suggest a correlation." |
row 36 [Hedging scale, moderate: suggests, indicates, appears] src 83 -> skills/writing/references/academic-prose.md:36: | Moderate | suggests, indicates, appears | "The data suggest a positive trend." |
row 37 [Hedging scale, strong: demonstrates, establishes, confirms] src 84 -> skills/writing/references/academic-prose.md:37: | Strong | demonstrates, establishes, confirms | "The evidence demonstrates a clear link." |
row 38 [Hedge results that need replication] src 86, 87 -> skills/writing/references/academic-prose.md:43: - A result that needs replication.
row 39 [Hedge causal claims from correlational data] src 88 -> skills/writing/references/academic-prose.md:44: - A causal claim from correlational data.
row 40 [Hedge generalizations from limited samples] src 89 -> skills/writing/references/academic-prose.md:45: - A generalization from a limited sample.
row 41 [Hedge interpretations with alternative explanations] src 90 -> skills/writing/references/academic-prose.md:46: - An interpretation that has alternative explanations.
row 42 [Do not hedge reported data] src 92, 93 -> skills/writing/references/academic-prose.md:52: - **Reported data.** "The response rate was 78%." rather than "appeared to be".
row 43 [Do not hedge a method] src 94 -> skills/writing/references/academic-prose.md:53: - **Method.** "We used thematic analysis." rather than "we attempted to use".
row 44 [Do not hedge established facts] src 95 -> skills/writing/references/academic-prose.md:54: - **Established facts.** "Earth orbits the Sun." rather than "may orbit".
row 45 [Transitions of addition] src 97, 99, 100 -> skills/writing/references/academic-prose.md:62: | Addition | moreover, furthermore, in addition, additionally, similarly, likewise |
row 46 [Transitions of contrast] src 102, 103 -> skills/writing/references/academic-prose.md:63: | Contrast | however, nevertheless, in contrast, on the other hand, conversely, whereas |
row 47 [Transitions of cause and effect] src 105, 106 -> skills/writing/references/academic-prose.md:64: | Cause and effect | therefore, consequently, as a result, thus, hence, accordingly |
row 48 [Transitions of example] src 108, 109 -> skills/writing/references/academic-prose.md:65: | Example | for example, for instance, specifically, in particular, such as, namely |
row 49 [Transitions of sequence] src 111, 112 -> skills/writing/references/academic-prose.md:66: | Sequence | first, second, third, subsequently, finally, meanwhile |
row 50 [Transitions of summary] src 114, 115 -> skills/writing/references/academic-prose.md:67: | Summary | in summary, to conclude, overall, taken together, in short |
row 51 [Transitions of concession] src 117, 118 -> skills/writing/references/academic-prose.md:68: | Concession | although, despite, while, granted that, notwithstanding |
row 52 [Paragraph shape: topic sentence first] src 120, 122, 123 -> skills/writing/references/academic-prose.md:74: 1. **Topic sentence.** It states the paragraph's main point.
row 53 [Paragraph shape: evidence] src 124 -> skills/writing/references/academic-prose.md:75: 2. **Evidence.** Data, citations and examples that support the point.
row 54 [Paragraph shape: explanation] src 125 -> skills/writing/references/academic-prose.md:76: 3. **Explanation.** It interprets the evidence and connects it to the argument.
row 55 [Paragraph shape: link] src 126 -> skills/writing/references/academic-prose.md:77: 4. **Link.** It connects to the next paragraph or back to the thesis.
row 56 [Paragraph shape example, in ASCII (kappa, no em dashes)] src 128, 129 -> skills/writing/references/academic-prose.md:81: > [T] AI-assisted quality assurance has shown promise in improving evaluation consistency across institutions. [E] Smith (2024) found that institutions using AI tools reported a 23% reduction in inter-rater variance, while Chen and Wang (2023) documented improved agreement on scoring rubrics (kappa = 0.82 against 0.64). [E] These findings suggest that algorithmic assistance can mitigate the subjective biases inherent in human evaluation, particularly when assessors have varying levels of experience. [L] However, the reliance on AI tools also raises concerns about the loss of contextual judgment, which the following section addresses.
row 57 [Wordy: "in order to"] src 136 -> skills/writing/references/academic-prose.md:96: Prose standard, section C, covers the two wordy openers "in order to" and "it is important to note that".
row 57 [Wordy: "in order to"] src 136 -> skills/writing/references/prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".
row 58 [Wordy: "due to the fact that" to "because"] src 131, 133, 134, 137 -> skills/writing/references/academic-prose.md:87: | due to the fact that | because |
row 59 [Wordy: "a large number of" to "many"] src 138 -> skills/writing/references/academic-prose.md:88: | a large number of | the number itself (prose standard, section A) |
row 59 [Wordy: "a large number of" to "many"] src 138 -> skills/writing/references/prose-standard.md:26: Vague qualifiers are replaced with the number or the specific claim: significantly, many, often, typically, generally, near-zero, sub-second, most requests.
row 60 [Wordy: "at the present time" to "currently" or "now"] src 139 -> skills/writing/references/academic-prose.md:89: | at the present time | currently, or now |
row 61 [Wordy: "it is important to note that" to "notably"] src 140 -> skills/writing/references/academic-prose.md:96: Prose standard, section C, covers the two wordy openers "in order to" and "it is important to note that".
row 61 [Wordy: "it is important to note that" to "notably"] src 140 -> skills/writing/references/prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".
row 62 [Wordy: "in the event that" to "if"] src 141 -> skills/writing/references/academic-prose.md:90: | in the event that | if |
row 63 [Wordy: "has the ability to" to "can"] src 142 -> skills/writing/references/academic-prose.md:91: | has the ability to | can |
row 64 [Wordy: "with regard to" to "regarding" or "about"] src 143 -> skills/writing/references/academic-prose.md:92: | with regard to | regarding, or about |
row 65 [Wordy: "in spite of the fact that" to "despite" or "although"] src 144 -> skills/writing/references/academic-prose.md:93: | in spite of the fact that | despite, or although |
row 66 [Wordy: "conduct an investigation of" to "investigate"] src 145 -> skills/writing/references/academic-prose.md:94: | conduct an investigation of | investigate |
row 67 [Vague: "many studies" to named, cited studies] src 147, 148, 150 -> skills/writing/references/academic-prose.md:102: | "many studies" | the studies named and cited, such as "several studies (e.g., Chen, 2023; Smith, 2024)" |
row 68 [Vague: "a significant impact" to the measured figure] src 151 -> skills/writing/references/academic-prose.md:103: | "a significant impact" | the measured figure, such as "a 23% increase in retention rates" |
row 69 [Vague: "in recent years" to the year or span] src 152 -> skills/writing/references/academic-prose.md:104: | "in recent years" | the year or the span, such as "since 2020" or "over the past five years" |
row 70 [Vague: "some researchers" to names with citations] src 153 -> skills/writing/references/academic-prose.md:105: | "some researchers" | the researchers named, with citations |
row 71 [Vague: "it is well known that" to a citation or nothing] src 154 -> skills/writing/references/academic-prose.md:106: | "it is well known that" | a citation of the source, or nothing |
row 72 [Tense: literature review findings, past] src 156, 157, 159 -> skills/writing/references/academic-prose.md:112: | Literature review, reporting findings | Past | "Smith (2024) found that..." |
row 73 [Tense: literature review ongoing state, present] src 160 -> skills/writing/references/academic-prose.md:113: | Literature review, the ongoing state | Present | "The theory posits that..." |
row 74 [Tense: method, past] src 161 -> skills/writing/references/academic-prose.md:114: | Method | Past | "Data were collected through..." |
row 75 [Tense: results, past] src 162 -> skills/writing/references/academic-prose.md:115: | Results | Past | "The analysis revealed..." |
row 76 [Tense: discussion, present] src 163 -> skills/writing/references/academic-prose.md:116: | Discussion, interpreting | Present | "These findings suggest..." |
row 77 [Tense: conclusion, present or future] src 164 -> skills/writing/references/academic-prose.md:117: | Conclusion, implications | Present or future | "This has implications for..." or "Future research should..." |
row 78 [zh-TW register: written language] src 166, 168, 169 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 79 [zh-TW register: active voice] src 170 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 80 [zh-TW register: short sentences] src 171 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 81 [zh-TW register: "this study" rather than "we"] src 172 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 82 [zh-TW academic expressions] src 174, 175, 177, 178, 179, 180, 181, 182 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 83 [zh-TW translationese: "was found to be"] src 184, 185 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 84 [zh-TW translationese: "This is because"] src 186 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 85 [zh-TW translationese: "In the aspect of"] src 187 -> Not carried: the coverage row keeps "not zh-TW conventions"
row 86 [zh-TW translationese: "It is worth being pointed out that"] src 188 -> Not carried: the coverage row keeps "not zh-TW conventions"
== writing_judgment_framework.md
row 96 [The file's title and what it complements] src 1, 3 -> Not a rule: the page's opening paragraph names its readers (ruling 4(vii)), `judgment.md`, line 3
row 96 [The file's title and what it complements] src 1, 3 -> skills/writing/references/judgment.md:3: This page holds the judgment calls on a text that no word list settles: the clarity test for each paragraph, the four questions a reader must be able to answer, the voice each discipline trusts and the "so what" each section owes its reader. The `writing` skill reads a text against it, and so do the writing skills built on `writing`.
row 97 [The clarity test: does the text make sense without the paragraph] src 5, 7 -> skills/writing/references/judgment.md:7: For each paragraph, ask whether the text still makes sense without it. The answer decides the paragraph's fate:
row 98 [Nothing lost: delete the paragraph] src 9 -> skills/writing/references/judgment.md:11: | Yes, and nothing is lost | Not needed | Delete it |
row 99 [Context lost: a supporting paragraph, kept short] src 10 -> skills/writing/references/judgment.md:12: | Yes, but context is lost | Supporting | Keep it, and keep it short |
row 100 [The argument breaks: a load-bearing paragraph, the most careful writing] src 11 -> skills/writing/references/judgment.md:13: | No, the argument breaks | Load-bearing | Give it the most careful writing |
row 101 [Load-bearing paragraphs get several drafts, supporting ones one, since equal weight fails the test] src 13 -> skills/writing/references/judgment.md:15: A load-bearing paragraph gets several drafts and a supporting paragraph gets one. A text that gives every paragraph equal weight fails the test.
row 102 [The reader's four questions, answerable at any point of a guided text] src 15, 17 -> skills/writing/references/judgment.md:19: The text guides its reader, and at any point the reader can answer four questions:
row 103 [Where am I (section structure, signposting)] src 19 -> skills/writing/references/judgment.md:21: 1. **Where am I?** The section structure and its signposts.
row 104 [Why am I here (connection to the research question)] src 20 -> skills/writing/references/judgment.md:22: 2. **Why am I here?** The connection to the research question.
row 105 [What should I take away (the point of the section)] src 21 -> skills/writing/references/judgment.md:23: 3. **What should I take away?** The point of the section.
row 106 [Where am I going next (transition logic)] src 22 -> skills/writing/references/judgment.md:24: 4. **Where am I going next?** The logic of the transition.
row 107 [A text failing any question is revised, however accurate] src 24 -> skills/writing/references/judgment.md:26: A text where any of the four is unclear is revised, however accurate its content.
row 108 [Hard sciences voice and credibility] src 26, 28, 30 -> skills/writing/references/judgment.md:32: | Hard sciences | Impersonal, passive, hedged | Precision of measurement and method |
row 109 [Social sciences voice and credibility] src 31 -> skills/writing/references/judgment.md:33: | Social sciences | Semi-personal, active, qualified | Transparency about limitations |
row 110 [Humanities voice and credibility] src 32 -> skills/writing/references/judgment.md:34: | Humanities | Personal, argumentative, interpretive | Depth of engagement with sources |
row 111 [Engineering voice and credibility] src 33 -> skills/writing/references/judgment.md:35: | Engineering | Direct, oriented to the specification | Reproducibility of results |
row 112 [Medical voice and credibility] src 34 -> skills/writing/references/judgment.md:36: | Medicine | Structured, focused on the protocol | Adherence to reporting guidelines |
row 113 [The wrong-voice test] src 36 -> skills/writing/references/judgment.md:38: A voice taken from another discipline is the wrong voice for the text, as with "We argue that" in a physics paper or "The data indicates" in a humanities essay.
row 114 [Introduction: why care, hook with a consequence or gap] src 38, 40, 42 -> skills/writing/references/judgment.md:44: | Introduction | Why should I care about this topic? | Open with a real-world consequence or a gap in knowledge |
row 115 [Literature review: what is missing, build to the gap] src 43 -> skills/writing/references/judgment.md:45: | Literature review | What is missing from what we know? | Build to the gap rather than only summarising the literature |
row 116 [Method: can I trust the results, show rigour and limitations] src 44 -> skills/writing/references/judgment.md:46: | Method | Can I trust these results? | Show rigour, and acknowledge limitations up front |
row 117 [Results: what was found, lead with the finding] src 45 -> skills/writing/references/judgment.md:47: | Results | What did you find? | Lead with the finding, then the statistical test |
row 118 [Discussion: what it means, connect to the gap and state the delta] src 46 -> skills/writing/references/judgment.md:48: | Discussion | What does this mean for the field? | Connect back to the gap, and state the delta clearly |
row 119 [Conclusion: what to remember, one sentence of contribution] src 47 -> skills/writing/references/judgment.md:49: | Conclusion | What should I remember? | One sentence that captures the contribution |
row 120 [Revision matrix: "Unclear"] src 49, 51, 53, 55 -> Not carried: the coverage row gives the revision decision matrix to `rebuttal`
row 121 [Revision matrix: "Missing reference"] src 56 -> Not carried: the coverage row gives the revision decision matrix to `rebuttal`
row 122 [Revision matrix: "Wrong method"] src 57 -> Not carried: the coverage row gives the revision decision matrix to `rebuttal`
row 123 [Revision matrix: "Not novel enough"] src 58 -> Not carried: the coverage row gives the revision decision matrix to `rebuttal`
row 124 [Revision matrix: "Too long"] src 59 -> Not carried: the coverage row gives the revision decision matrix to `rebuttal`
== writing_quality_check.md
row 134 [The file's title and purpose: rules for good prose whoever wrote it] src 1, 3, 5 -> Not a rule: the page's opening paragraph states its scope, which names no author, `anti-patterns.md`, line 3
row 134 [The file's title and purpose: rules for good prose whoever wrote it] src 1, 3, 5 -> skills/writing/references/anti-patterns.md:3: This page holds the anti-patterns of academic prose that `templates/check_prose.py` does not find, with the reason each fails and its fix, and names the ones the script does find by their check. The `writing` skill reads a text against it, and so do the writing skills built on `writing`.
row 135 [Design boundary: better prose, not detector evasion] src 7 -> Not a rule: it states the source skill's aim, and no page carries a detector rule
row 136 [The drafting steps that use the checklist] src 9 -> Not a rule: the page's opening paragraph names its readers (ruling 4(vii)), `anti-patterns.md`, line 3
row 136 [The drafting steps that use the checklist] src 9 -> skills/writing/references/anti-patterns.md:3: This page holds the anti-patterns of academic prose that `templates/check_prose.py` does not find, with the reason each fails and its fix, and names the ones the script does find by their check. The `writing` skill reads a text against it, and so do the writing skills built on `writing`.
row 137 [Flagged terms: not banned, each checked as the most precise word] src 13, 15 -> skills/writing/references/prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament, navigate, leverage, realm, embark, underscore, multifaceted, nuanced, comprehensive, robust, intricate, cornerstone, paradigm, synergy, holistic, streamline, cutting-edge, groundbreaking.
row 137 [Flagged terms: not banned, each checked as the most precise word] src 13, 15 -> skills/writing/templates/check_prose.py:90: - filler, vague and flagged: in prose, case-insensitive, each entry of FILLER_WORDS,
row 137 [Flagged terms: not banned, each checked as the most precise word] src 13, 15 -> skills/writing/references/anti-patterns.md:38: - **Filler, vague and flagged words.** The checks `filler`, `vague` and `flagged`, prose standard, section A.
row 138 [The flagged-term list] src 17, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45 -> skills/writing/references/prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament, navigate, leverage, realm, embark, underscore, multifaceted, nuanced, comprehensive, robust, intricate, cornerstone, paradigm, synergy, holistic, streamline, cutting-edge, groundbreaking.
row 138 [The flagged-term list] src 17, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45 -> skills/writing/references/anti-patterns.md:18: | A flagged word that is standard terminology in the text's discipline: "paradigm shift" in philosophy of science, "landscape" used literally in ecology or geography, "robust estimator" in statistics, "navigate" used literally in wayfinding research | A `flagged` report on it is a false alarm under the exemption in prose standard, section A | Keep the word |
row 139 [Standard terminology of the discipline is exempt] src 47, 49 -> skills/writing/references/prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament, navigate, leverage, realm, embark, underscore, multifaceted, nuanced, comprehensive, robust, intricate, cornerstone, paradigm, synergy, holistic, streamline, cutting-edge, groundbreaking.
row 140 [The exemption's four examples] src 50, 51, 52, 53 -> skills/writing/references/anti-patterns.md:18: | A flagged word that is standard terminology in the text's discipline: "paradigm shift" in philosophy of science, "landscape" used literally in ecology or geography, "robust estimator" in statistics, "navigate" used literally in wayfinding research | A `flagged` report on it is a false alarm under the exemption in prose standard, section A | Keep the word |
row 141 [Em dash limit of 3 per paper, with its reason] src 57, 59, 60, 61 -> Not carried: the prose standard's zero is stricter (brief item 3), `prose-standard.md`, line 13
row 141 [Em dash limit of 3 per paper, with its reason] src 57, 59, 60, 61 -> skills/writing/references/prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same construction respelled and is equally banned; a hyphen inside a compound word or a number range is not a dash.
row 142 [Em dash fix: commas, parentheses or separate sentences] src 62 -> skills/writing/references/prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same construction respelled and is equally banned; a hyphen inside a compound word or a number range is not a dash.
row 142 [Em dash fix: commas, parentheses or separate sentences] src 62 -> skills/writing/templates/check_prose.py:70: - dash-aside: in prose, an em dash or en dash, and a spaced hyphen " - " inside a line (the
row 143 [Quotations keep their original punctuation] src 63 -> skills/writing/references/academic-prose.md:121: A quotation from a source keeps its original punctuation, so a dash inside a quotation is left for the reader to judge.
row 144 [Semicolons at most 2 per 1000 words, a full stop instead] src 65, 66, 67, 68 -> skills/writing/references/prose-standard.md:33: - Semicolons: at most 2 per 1000 words of running prose. A full stop is usually clearer. Table cells and one-line data rows are not running prose.
row 144 [Semicolons at most 2 per 1000 words, a full stop instead] src 65, 66, 67, 68 -> skills/writing/templates/check_prose.py:85: - semicolons: over running prose, when the semicolons times 1000 are more than 2 times the
row 145 [No two consecutive colon-and-list paragraphs] src 70, 71, 72, 73 -> skills/writing/references/prose-standard.md:34: - Never two or more consecutive paragraphs that each open with a colon and a list.
row 145 [No two consecutive colon-and-list paragraphs] src 70, 71, 72, 73 -> skills/writing/templates/check_prose.py:104: - colon-lists: two consecutive paragraphs that each end with a colon and are each followed by
row 146 [Throat-clearing openers deleted] src 77, 79, 81 -> skills/writing/references/prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".
row 147 [The throat-clearing phrases the script's list holds] src 83, 84, 85, 87, 88, 89, 90, 92, 93, 94 -> skills/writing/references/prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".
row 147 [The throat-clearing phrases the script's list holds] src 83, 84, 85, 87, 88, 89, 90, 92, 93, 94 -> skills/writing/templates/check_prose.py:88: - throat-clearing: in prose, case-insensitive, each phrase of THROAT_PHRASES, across any run of
row 148 ["In today's rapidly evolving"] src 86 -> skills/writing/references/anti-patterns.md:13: | "In today's rapidly evolving..." | A timestamped cliche adds no information | Delete it |
row 149 ["As a matter of fact"] src 91 -> skills/writing/references/anti-patterns.md:14: | "As a matter of fact..." | It announces the fact instead of stating it | Delete it and state the fact |
row 150 [Meta-commentary: no sentence describing what the text does] src 96, 98 -> skills/writing/references/prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
row 151 ["This section will discuss"] src 99 -> skills/writing/references/anti-patterns.md:16: | "This section will discuss..." | Meta-commentary, which prose standard, section C, bans | Discuss the subject |
row 152 ["The following paragraph examines"] src 100 -> skills/writing/references/anti-patterns.md:17: | "The following paragraph examines..." | Meta-commentary, which prose standard, section C, bans | Examine the subject |
row 153 ["We now turn our attention to"] src 101 -> skills/writing/references/anti-patterns.md:15: | "We now turn our attention to..." | Meta-commentary, which prose standard, section C, bans | Turn to the subject |
row 154 [The Introduction's roadmap sentence is kept] src 103 -> skills/writing/references/anti-patterns.md:32: An introduction's roadmap sentence, such as "Section 2 reviews the literature, and Section 3 describes the method", is kept. It names the other sections of the text rather than describing the section it stands in, which is what prose standard, section C, bans.
row 155 [Forced groups of three] src 107, 109, 110, 111, 112 -> skills/writing/references/anti-patterns.md:9: | Forced groups of three: every argument has three sub-points and every list has three items | Real analysis does not always come in threes, and two strong points carry more than three padded ones | Prose standard, section D. Two points are fine, and so are five |
row 155 [Forced groups of three] src 107, 109, 110, 111, 112 -> skills/writing/references/prose-standard.md:47: - **No rule of three.** Do not pad a list to three items and do not decompose every argument into three parts. The evidence decides the count.
row 156 [Uniform paragraph length] src 114, 115, 116, 117 -> skills/writing/references/anti-patterns.md:10: | Uniform paragraph length: every paragraph about the same length, such as 150 to 200 words each | Natural writing varies its paragraphs, with short ones for emphasis and longer ones for complex arguments | Prose standard, section D |
row 156 [Uniform paragraph length] src 114, 115, 116, 117 -> skills/writing/references/prose-standard.md:49: - **Vary paragraph length.** Uniform blocks are a template.
row 157 [Synonym cycling] src 119, 120, 121, 122 -> skills/writing/references/anti-patterns.md:11: | Synonym cycling: three or more synonyms for one concept within a paragraph, such as "students", "learners", "participants" and "subjects" | Consistent terminology is a virtue in academic writing, and the swapped terms confuse the reader | Prose standard, section D |
row 157 [Synonym cycling] src 119, 120, 121, 122 -> skills/writing/references/prose-standard.md:50: - **No synonym cycling.** One term per concept, repeated. Technical repetition is clarity.
row 158 [Binary contrast at most 2 per paper] src 124, 125, 126, 127 -> skills/writing/references/prose-standard.md:51: - **Binary contrast ("not X, Y") at most twice per page**, and only where the contrast is the actual point.
row 158 [Binary contrast at most 2 per paper] src 124, 125, 126, 127 -> skills/writing/templates/check_prose.py:98: - contrast: in prose, list items, headings and table cells included, a sentence holding "not
row 158 [Binary contrast at most 2 per paper] src 124, 125, 126, 127 -> skills/writing/references/anti-patterns.md:43: - **Binary contrasts.** The check `contrast`, prose standard, section D.
row 159 [Mirror structure] src 129, 130, 131, 132 -> skills/writing/references/anti-patterns.md:12: | Mirror structure: every section with the same internal structure, such as a topic sentence, three evidence points and a synthesis sentence | Sections serve different purposes and need different internal rhythms, and the repeated structure reads as a template | Prose standard, section D. Methods can be procedural, and a discussion can be exploratory |
row 159 [Mirror structure] src 129, 130, 131, 132 -> skills/writing/references/prose-standard.md:52: - **No mirror structure.** Each section takes the shape its content needs.
row 160 [Sentence length varies] src 136, 138, 139 -> skills/writing/references/prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell of a coverage table, which lists what a file holds, may run to about 35 words.
row 161 [Five or more consecutive sentences of a narrow length range flagged] src 141, 142 -> skills/writing/templates/check_prose.py:94: - equal-length: five or more consecutive sentences of running prose whose word counts lie
row 161 [Five or more consecutive sentences of a narrow length range flagged] src 141, 142 -> skills/writing/references/prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell of a coverage table, which lists what a file holds, may run to about 35 words.
row 162 [Fixes for a run of equal-length sentences] src 144, 145, 146, 147 -> skills/writing/references/anti-patterns.md:19: | A run of sentences of equal length in a section whose content calls for variation in length | The variation a section needs depends on the section, as the list below gives it | Insert a sentence of 10 words or fewer, combine two short sentences into one, or read the paragraph aloud and vary what sounds metronomic |
row 163 [Abstract: moderate variation] src 149, 150 -> skills/writing/references/anti-patterns.md:23: - **Abstract.** Moderate, at a factual and steady pace.
row 164 [Introduction: high variation] src 151 -> skills/writing/references/anti-patterns.md:24: - **Introduction.** High: short sentences for the hook, long ones to build.
row 165 [Literature review: moderate variation] src 152 -> skills/writing/references/anti-patterns.md:25: - **Literature review.** Moderate, at a steady analytical pace with an occasional short synthesis.
row 166 [Methods: low variation acceptable] src 153 -> skills/writing/references/anti-patterns.md:26: - **Method.** Low variation is acceptable, since procedural sections run to a uniform length.
row 167 [Results: moderate variation] src 154 -> skills/writing/references/anti-patterns.md:27: - **Results.** Moderate: short sentences for key findings, longer ones for detailed descriptions.
row 168 [Discussion: highest variation] src 155 -> skills/writing/references/anti-patterns.md:28: - **Discussion.** The highest: short for emphasis, long for interpretation, and the shortest for conclusions.
row 169 [Apply the checklist while drafting each section] src 159, 161, 162 -> Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2)
row 170 [A full-paper sweep before handoff as the fallback] src 164, 165 -> Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2)
row 171 [Violations scored per category] src 167, 168, 169, 170, 171 -> Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2)
row 172 [Scores not reported, issues fixed silently] src 173 -> Not carried: `/writing` reports each problem with its line (brief item 3, plan ruling, question 2)
case 2: HOLDS
```

### Case 3

The rule-bearing lines of each source file are the source lines column of its record (74, 29 and 39 rows, each record's "Rule-bearing lines listed"). `grep -c '^| ' .scratch/3-the-writing-base/agents/reviews/3-rows.md` prints 145: 142 rows and 3 header rows. Every source heading with the row (its line in `3-rows.md`) that covers it:

```text
== academic_writing_style.md: rows 74, listed 74, non-blank lines 135
heading 1 '# Academic Writing Style Guide' -> rows [13]
heading 5 '## Core Principles' -> rows [14]
heading 7 '### 1. Precision' -> rows [14]
heading 12 '### 2. Conciseness' -> rows [17]
heading 17 '### 3. Objectivity' -> rows [20]
heading 22 '### 4. Formality' -> rows [23]
heading 27 '## Register Adjustment by Discipline' -> rows [29]
heading 29 '### Sciences (Natural, Applied)' -> rows [26]
heading 37 '### Social Sciences' -> rows [27]
heading 45 '### Humanities' -> rows [28]
heading 53 '### Engineering / CS' -> rows [29]
heading 61 '### Education' -> rows [33]
heading 69 '### Medicine / Health' -> rows [34]
heading 77 '## Hedging and Strength Language' -> rows [35]
heading 79 '### Hedging (for uncertain or qualified claims)' -> rows [35]
heading 86 '### When to Hedge' -> rows [38]
heading 92 '### When NOT to Hedge' -> rows [42]
heading 97 '## Transition Words and Phrases' -> rows [45]
heading 99 '### Addition' -> rows [45]
heading 102 '### Contrast' -> rows [46]
heading 105 '### Cause/Effect' -> rows [47]
heading 108 '### Example' -> rows [48]
heading 111 '### Sequence' -> rows [49]
heading 114 '### Summary' -> rows [50]
heading 117 '### Concession' -> rows [51]
heading 120 '## Paragraph Construction' -> rows [52]
heading 122 '### Standard Academic Paragraph (TEEL)' -> rows [52]
heading 128 '### Example' -> rows [56]
heading 131 '## Common Style Errors' -> rows [58]
heading 133 '### Wordiness' -> rows [58]
heading 147 '### Vague Language' -> rows [67]
heading 156 '### Tense Usage' -> rows [72]
heading 166 '## Chinese Academic Writing (zh-TW) Conventions' -> rows [78]
heading 168 '### Register' -> rows [78]
heading 174 '### Common Academic Expressions' -> rows [82]
heading 184 '### Avoiding Translationese' -> rows [83]
== writing_judgment_framework.md: rows 29, listed 29, non-blank lines 39
heading 1 '# Writing Judgment Framework' -> rows [96]
heading 5 '## The Clarity Test' -> rows [97]
heading 15 "## The Reader's Journey" -> rows [102]
heading 26 '## Discipline-Specific Voice' -> rows [108]
heading 38 '## The "So What" Hierarchy for Sections' -> rows [114]
heading 49 '## Revision Decision Matrix' -> rows [120]
== writing_quality_check.md: rows 39, listed 39, non-blank lines 123
heading 1 '# Writing Quality Check' -> rows [134]
heading 3 '## Purpose' -> rows [134]
heading 13 '## A. High-Frequency Term Warnings' -> rows [137]
heading 17 '### Flagged Terms' -> rows [138]
heading 47 '### Exception Rule' -> rows [139]
heading 57 '## B. Punctuation Pattern Control' -> rows [141]
heading 59 '### Em Dash (<em dash character>)' -> rows [141]
heading 65 '### Semicolons' -> rows [144]
heading 70 '### Colon-List Sequences' -> rows [145]
heading 77 '## C. Throat-Clearing Openers' -> rows [146]
heading 96 '### Meta-Commentary to Avoid' -> rows [150]
heading 107 '## D. Structure Pattern Warnings' -> rows [155]
heading 109 '### Rule of Three Compulsion' -> rows [155]
heading 114 '### Uniform Paragraph Length' -> rows [156]
heading 119 '### Synonym Cycling' -> rows [157]
heading 124 '### Binary Contrast Overuse' -> rows [158]
heading 129 '### Mirror Structure' -> rows [159]
heading 136 '## E. Burstiness (Sentence Length Variation)' -> rows [160]
heading 138 '### What to Check' -> rows [160]
heading 141 '### Detection Rule' -> rows [161]
heading 144 '### How to Fix' -> rows [162]
heading 149 '### Burstiness Targets (by section)' -> rows [163]
heading 159 '## How to Use This Checklist' -> rows [169]
heading 161 '### During Drafting (Preferred)' -> rows [169]
heading 164 '### During Final Review (Fallback)' -> rows [170]
heading 167 '### Scoring (Internal, Not Reported to User)' -> rows [171]
case 3: HOLDS
```

### Case 4

Each naming of a prose-standard section, with its line; no line holds a restatement from the check's list, and a reading of the pages found none beyond it. The control from the first run shows the check refuses a restatement.

```text
NAMES skills/writing/references/academic-prose.md:11: Prose standard, section A
NAMES skills/writing/references/academic-prose.md:12: Prose standard, section E
NAMES skills/writing/references/academic-prose.md:25: prose standard, section E, a
NAMES skills/writing/references/academic-prose.md:79: prose standard, section D
NAMES skills/writing/references/academic-prose.md:88: prose standard, section A
NAMES skills/writing/references/academic-prose.md:96: Prose standard, section C, c
NAMES skills/writing/references/anti-patterns.md:9: Prose standard, section D
NAMES skills/writing/references/anti-patterns.md:10: Prose standard, section D
NAMES skills/writing/references/anti-patterns.md:11: Prose standard, section D
NAMES skills/writing/references/anti-patterns.md:12: Prose standard, section D
NAMES skills/writing/references/anti-patterns.md:15: prose standard, section C, b
NAMES skills/writing/references/anti-patterns.md:16: prose standard, section C, b
NAMES skills/writing/references/anti-patterns.md:17: prose standard, section C, b
NAMES skills/writing/references/anti-patterns.md:18: prose standard, section A
NAMES skills/writing/references/anti-patterns.md:32: prose standard, section C, b
NAMES skills/writing/references/anti-patterns.md:38: prose standard, section A
NAMES skills/writing/references/anti-patterns.md:39: prose standard, sections 0 and B
NAMES skills/writing/references/anti-patterns.md:40: prose standard, section B
NAMES skills/writing/references/anti-patterns.md:41: prose standard, section B
NAMES skills/writing/references/anti-patterns.md:42: prose standard, section C
NAMES skills/writing/references/anti-patterns.md:43: prose standard, section D
NAMES skills/writing/references/anti-patterns.md:44: prose standard, section E
case 4: HOLDS
```

### Case 5

```text
== hedging: /\bmay\b|\bmight\b|hedg/
skills/writing/references/academic-prose.md:3: This page holds the prose rules for academic text: the core principles, the Engineering and CS register, the hedging scale, transition words, the shape of a paragraph, the wordy and vague forms with t
skills/writing/references/academic-prose.md:14: - **Hedging.** Hedge an uncertain claim, on the scale under Hedging.
skills/writing/references/academic-prose.md:29: ## Hedging
skills/writing/references/academic-prose.md:31: A hedge marks how strongly the evidence supports a claim, from weak to strong.
skills/writing/references/academic-prose.md:33: | Strength | Hedging devices | Example |
skills/writing/references/academic-prose.md:35: | Weak | may, might, could, possibly | "This may suggest a correlation." |
skills/writing/references/academic-prose.md:39: ### When to hedge
skills/writing/references/academic-prose.md:41: Hedge a claim in these cases:
skills/writing/references/academic-prose.md:48: ### When not to hedge
skills/writing/references/academic-prose.md:50: Do not hedge in these cases:
skills/writing/references/academic-prose.md:54: - **Established facts.** "Earth orbits the Sun." rather than "may orbit".
skills/writing/references/judgment.md:32: | Hard sciences | Impersonal, passive, hedged | Precision of measurement and method |
skills/writing/references/prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell o
skills/writing/templates/check_prose.py:11: whitespace ignored. A --limit may appear anywhere among the arguments and more than once.
skills/writing/templates/check_prose.py:57: end with ".", "!", "?" or ":" (a closing quote, parenthesis or bracket may follow), and a
skills/writing/templates/check_prose.py:63: or "?" (a closing quote, parenthesis or bracket may follow) followed by white space or the
== tense: /\btense\b|past tense|present tense/
skills/writing/references/academic-prose.md:3: This page holds the prose rules for academic text: the core principles, the Engineering and CS register, the hedging scale, transition words, the shape of a paragraph, the wordy and vague forms with t
skills/writing/references/academic-prose.md:108: ## Tense per section
skills/writing/references/academic-prose.md:110: | Section | Tense | Example |
== many: /\bmany\b/
skills/writing/references/academic-prose.md:102: | "many studies" | the studies named and cited, such as "several studies (e.g., Chen, 2023; Smith, 2024)" |
skills/writing/references/prose-standard.md:26: Vague qualifiers are replaced with the number or the specific claim: significantly, many, often, typically, generally, near-zero, sub-second, most requests.
skills/writing/templates/check_prose.py:24: backtick), and closes at a line of only the same character, at least as many, at any
== per section: /per section|one term per concept/
skills/writing/references/academic-prose.md:108: ## Tense per section
skills/writing/references/anti-patterns.md:21: The variation in sentence length expected per section, for judging an `equal-length` report:
skills/writing/references/prose-standard.md:50: - **No synonym cycling.** One term per concept, repeated. Technical repetition is clarity.
== short sentences: /short sentence|sentence length|20 words/
skills/writing/references/academic-prose.md:12: - **Sentence length.** Prose standard, section E, holds the sentence-length rule.
skills/writing/references/anti-patterns.md:19: | A run of sentences of equal length in a section whose content calls for variation in length | The variation a section needs depends on the section, as the list below gives it | Insert a sentence of 
skills/writing/references/anti-patterns.md:21: The variation in sentence length expected per section, for judging an `equal-length` report:
skills/writing/references/anti-patterns.md:24: - **Introduction.** High: short sentences for the hook, long ones to build.
skills/writing/references/anti-patterns.md:27: - **Results.** Moderate: short sentences for key findings, longer ones for detailed descriptions.
skills/writing/references/prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell o
== paragraph: /one idea|four sentences|topic sentence/
skills/writing/references/academic-prose.md:10: - **One idea per sentence.** Give each sentence one idea, or ideas that are clearly connected.
skills/writing/references/academic-prose.md:74: 1. **Topic sentence.** It states the paragraph's main point.
skills/writing/references/academic-prose.md:79: The paragraph holds one idea and stays within the length that prose standard, section D, sets. An example, with each part marked:
skills/writing/references/anti-patterns.md:12: | Mirror structure: every section with the same internal structure, such as a topic sentence, three evidence points and a synthesis sentence | Sections serve different purposes and need different inte
skills/writing/references/prose-standard.md:48: - **Paragraphs cover one idea and stay under roughly four sentences**; split anything longer or covering two.
skills/writing/references/prose-standard.md:75: Per page, in order: read the whole page; recompose at sentence level against 0 and A-F; restructure every paragraph covering two ideas or running past four sentences; scan for non-ASCII (`LC_ALL=C gre
== roadmap: /roadmap|this section|section 2/
skills/writing/references/anti-patterns.md:16: | "This section will discuss..." | Meta-commentary, which prose standard, section C, bans | Discuss the subject |
skills/writing/references/anti-patterns.md:30: ## Roadmap sentence
skills/writing/references/anti-patterns.md:32: An introduction's roadmap sentence, such as "Section 2 reviews the literature, and Section 3 describes the method", is kept. It names the other sections of the text rather than describing the section 
skills/writing/references/prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
== quotation: /quot/
skills/writing/references/academic-prose.md:3: This page holds the prose rules for academic text: the core principles, the Engineering and CS register, the hedging scale, transition words, the shape of a paragraph, the wordy and vague forms with t
skills/writing/references/academic-prose.md:119: ## Quotations
skills/writing/references/academic-prose.md:121: A quotation from a source keeps its original punctuation, so a dash inside a quotation is left for the reader to judge.
skills/writing/references/prose-standard.md:35: - ASCII throughout: straight quotes, three dots, `+/-`, `~`, `->` only in code. Accented letters in names stay.
skills/writing/references/prose-standard.md:75: Per page, in order: read the whole page; recompose at sentence level against 0 and A-F; restructure every paragraph covering two ideas or running past four sentences; scan for non-ASCII (`LC_ALL=C gre
skills/writing/templates/check_prose.py:15: opens with at most 60 characters of the text that triggered the flag, in double quotes, with
skills/writing/templates/check_prose.py:26: blockquote line, nested ones too, are stripped before any check, and the rest is read as
skills/writing/templates/check_prose.py:27: the line it quotes. Headings (# to ######) are prose for every check except semicolons and
skills/writing/templates/check_prose.py:57: end with ".", "!", "?" or ":" (a closing quote, parenthesis or bracket may follow), and a
skills/writing/templates/check_prose.py:63: or "?" (a closing quote, parenthesis or bracket may follow) followed by white space or the
skills/writing/templates/check_prose.py:103: SUBORDINATORS, after any opening quote or bracket. A sentence counts once. When a file holds more than 2, each is flagged.
== dash: /em dash|dash/
skills/writing/references/academic-prose.md:121: A quotation from a source keeps its original punctuation, so a dash inside a quotation is left for the reader to judge.
skills/writing/references/anti-patterns.md:39: - **Em dashes and dash asides.** The check `dash-aside`, prose standard, sections 0 and B.
skills/writing/references/prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same constr
skills/writing/references/prose-standard.md:32: - Em dash and dash-as-aside: zero (see 0).
skills/writing/references/prose-standard.md:75: Per page, in order: read the whole page; recompose at sentence level against 0 and A-F; restructure every paragraph covering two ideas or running past four sentences; scan for non-ASCII (`LC_ALL=C gre
skills/writing/templates/check_prose.py:70: - dash-aside: in prose, an em dash or en dash, and a spaced hyphen " - " inside a line (the
== three: /rule of three|groups of three|three items/
skills/writing/references/anti-patterns.md:9: | Forced groups of three: every argument has three sub-points and every list has three items | Real analysis does not always come in threes, and two strong points carry more than three padded ones | P
skills/writing/references/prose-standard.md:47: - **No rule of three.** Do not pad a list to three items and do not decompose every argument into three parts. The evidence decides the count.
== passive: /passive/
skills/writing/references/academic-prose.md:25: - **Voice.** Passive voice is common for methods, and active voice for contributions. In a method step the actor is usually irrelevant, which is the case prose standard, section E, allows for the pass
skills/writing/references/judgment.md:32: | Hard sciences | Impersonal, passive, hedged | Precision of measurement and method |
skills/writing/references/prose-standard.md:63: - **Passive voice**: rewrite unless the actor is irrelevant.
== first person: /first person|third person/
skills/writing/references/academic-prose.md:18: - **Person.** Write in the third person unless the discipline's conventions allow the first person.
== load-bearing: /load-bearing|draft/
skills/writing/references/judgment.md:13: | No, the argument breaks | Load-bearing | Give it the most careful writing |
skills/writing/references/judgment.md:15: A load-bearing paragraph gets several drafts and a supporting paragraph gets one. A text that gives every paragraph equal weight fails the test.
== voice: /\bvoice\b/
skills/writing/references/academic-prose.md:25: - **Voice.** Passive voice is common for methods, and active voice for contributions. In a method step the actor is usually irrelevant, which is the case prose standard, section E, allows for the pass
skills/writing/references/judgment.md:3: This page holds the judgment calls on a text that no word list settles: the clarity test for each paragraph, the four questions a reader must be able to answer, the voice each discipline trusts and th
skills/writing/references/judgment.md:28: ## Voice by discipline
skills/writing/references/judgment.md:30: | Discipline | Voice | What makes it credible |
skills/writing/references/judgment.md:38: A voice taken from another discipline is the wrong voice for the text, as with "We argue that" in a physics paper or "The data indicates" in a humanities essay.
skills/writing/references/prose-standard.md:57: - **Spec-sheet voice**: "provides", "supports", "allows you to", "is configurable". Say what the code does. External capabilities are the exception ("the library provides").
skills/writing/references/prose-standard.md:63: - **Passive voice**: rewrite unless the actor is irrelevant.
== equal-length: /equal-length|same length/
skills/writing/references/anti-patterns.md:10: | Uniform paragraph length: every paragraph about the same length, such as 150 to 200 words each | Natural writing varies its paragraphs, with short ones for emphasis and longer ones for complex argum
skills/writing/references/anti-patterns.md:21: The variation in sentence length expected per section, for judging an `equal-length` report:
skills/writing/references/anti-patterns.md:44: - **Runs of equal-length sentences.** The check `equal-length`, prose standard, section E.
skills/writing/references/prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell o
skills/writing/templates/check_prose.py:28: equal-length. A table row (a line starting with "|") is split at each "|" not preceded by a
skills/writing/templates/check_prose.py:30: and equal-length, and no sentence runs across a cell boundary.
skills/writing/templates/check_prose.py:60: are LaTeX data rows are left out when its lines are counted. Equal-length reads
skills/writing/templates/check_prose.py:94: - equal-length: five or more consecutive sentences of running prose whose word counts lie
== flagged exemption: /domain terminology|standard terminology|exemption/
skills/writing/references/anti-patterns.md:18: | A flagged word that is standard terminology in the text's discipline: "paradigm shift" in philosophy of science, "landscape" used literally in ecology or geography, "robust estimator" in statistics,
skills/writing/references/prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament,
== throat: /throat|in order to|important to note/
skills/writing/references/academic-prose.md:96: Prose standard, section C, covers the two wordy openers "in order to" and "it is important to note that".
skills/writing/references/anti-patterns.md:42: - **Throat-clearing openers and meta-commentary in the script's list.** The check `throat-clearing`, prose standard, section C.
skills/writing/references/prose-standard.md:37: ## C. Throat-clearing and meta-commentary
skills/writing/references/prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order t
skills/writing/templates/check_prose.py:88: - throat-clearing: in prose, case-insensitive, each phrase of THROAT_PHRASES, across any run of
== antecedent: /antecedent|pronoun/
skills/writing/references/academic-prose.md:9: - **Antecedents.** Use a pronoun such as "this" or "it" only where its antecedent is clear.
skills/writing/references/prose-standard.md:59: - **Cold opens**: a body paragraph whose first sentence has no antecedent, so "this" is a guess. Carry the prior subject forward.
== full forms: /full form|contraction|don't/
skills/writing/references/academic-prose.md:16: - **Full forms.** Write the full form: "do not" rather than "don't".
== definition: /first use|define/
skills/writing/references/academic-prose.md:8: - **Definitions.** Define each technical term at its first use.
skills/writing/references/prose-standard.md:61: - **Personified artifacts** for colour are banned; personification that is the project's defined vocabulary is not.
skills/writing/references/prose-standard.md:68: - **Bold** only for a term at first use, a critical fact or warning, or a list-item label (`- **Term**: ...`). Bold reached for tone means the sentence is weak.
== transition: /transition/
skills/writing/references/academic-prose.md:3: This page holds the prose rules for academic text: the core principles, the Engineering and CS register, the hedging scale, transition words, the shape of a paragraph, the wordy and vague forms with t
skills/writing/references/academic-prose.md:56: ## Transition words
skills/writing/references/academic-prose.md:58: A transition names the relation between two sentences or paragraphs. Choose the word by the relation.
skills/writing/references/judgment.md:24: 4. **Where am I going next?** The logic of the transition.
== person: /third person|first person|\bwe\b/
skills/writing/references/academic-prose.md:18: - **Person.** Write in the third person unless the discipline's conventions allow the first person.
skills/writing/references/academic-prose.md:53: - **Method.** "We used thematic analysis." rather than "we attempted to use".
skills/writing/references/anti-patterns.md:15: | "We now turn our attention to..." | Meta-commentary, which prose standard, section C, bans | Turn to the subject |
skills/writing/references/judgment.md:38: A voice taken from another discipline is the wrong voice for the text, as with "We argue that" in a physics paper or "The data indicates" in a humanities essay.
skills/writing/references/judgment.md:45: | Literature review | What is missing from what we know? | Build to the gap rather than only summarising the literature |
skills/writing/references/prose-standard.md:43: Never open a paragraph by recapping the prior one ("With this setup complete", "Now that we've explored"). Pivot directly.
== specific term: /specific term|precise/
skills/writing/references/academic-prose.md:7: - **Specific terms.** Use the most specific term available.
skills/writing/references/academic-prose.md:24: - **Register.** Formal, oriented to a problem and its solution, and precise to the specification.
skills/writing/references/academic-prose.md:100: | Vague | Precise |
skills/writing/references/prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament,
== evidence: /evidence/
skills/writing/references/academic-prose.md:13: - **Evidence.** Base each claim on evidence rather than opinion.
skills/writing/references/academic-prose.md:15: - **Limitations.** Acknowledge the limitations of a claim and the alternative interpretations of its evidence.
skills/writing/references/academic-prose.md:31: A hedge marks how strongly the evidence supports a claim, from weak to strong.
skills/writing/references/academic-prose.md:37: | Strong | demonstrates, establishes, confirms | "The evidence demonstrates a clear link." |
skills/writing/references/academic-prose.md:75: 2. **Evidence.** Data, citations and examples that support the point.
skills/writing/references/academic-prose.md:76: 3. **Explanation.** It interprets the evidence and connects it to the argument.
skills/writing/references/anti-patterns.md:12: | Mirror structure: every section with the same internal structure, such as a topic sentence, three evidence points and a synthesis sentence | Sections serve different purposes and need different inte
skills/writing/references/prose-standard.md:47: - **No rule of three.** Do not pad a list to three items and do not decompose every argument into three parts. The evidence decides the count.
== meta-commentary: /meta-commentary|what the page is about to do|describ/
skills/writing/references/anti-patterns.md:15: | "We now turn our attention to..." | Meta-commentary, which prose standard, section C, bans | Turn to the subject |
skills/writing/references/anti-patterns.md:16: | "This section will discuss..." | Meta-commentary, which prose standard, section C, bans | Discuss the subject |
skills/writing/references/anti-patterns.md:17: | "The following paragraph examines..." | Meta-commentary, which prose standard, section C, bans | Examine the subject |
skills/writing/references/anti-patterns.md:32: An introduction's roadmap sentence, such as "Section 2 reviews the literature, and Section 3 describes the method", is kept. It names the other sections of the text rather than describing the section 
skills/writing/references/anti-patterns.md:42: - **Throat-clearing openers and meta-commentary in the script's list.** The check `throat-clearing`, prose standard, section C.
skills/writing/references/prose-standard.md:37: ## C. Throat-clearing and meta-commentary
skills/writing/references/prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
== paragraph length: /paragraph length|uniform|vary/
skills/writing/references/academic-prose.md:81: > [T] AI-assisted quality assurance has shown promise in improving evaluation consistency across institutions. [E] Smith (2024) found that institutions using AI tools reported a 23% reduction in inter
skills/writing/references/anti-patterns.md:10: | Uniform paragraph length: every paragraph about the same length, such as 150 to 200 words each | Natural writing varies its paragraphs, with short ones for emphasis and longer ones for complex argum
skills/writing/references/anti-patterns.md:19: | A run of sentences of equal length in a section whose content calls for variation in length | The variation a section needs depends on the section, as the list below gives it | Insert a sentence of 
skills/writing/references/anti-patterns.md:26: - **Method.** Low variation is acceptable, since procedural sections run to a uniform length.
skills/writing/references/prose-standard.md:49: - **Vary paragraph length.** Uniform blocks are a template.
== contrast: /binary contrast|\bcontrast\b/
skills/writing/references/academic-prose.md:63: | Contrast | however, nevertheless, in contrast, on the other hand, conversely, whereas |
skills/writing/references/anti-patterns.md:43: - **Binary contrasts.** The check `contrast`, prose standard, section D.
skills/writing/references/prose-standard.md:51: - **Binary contrast ("not X, Y") at most twice per page**, and only where the contrast is the actual point.
skills/writing/templates/check_prose.py:98: - contrast: in prose, list items, headings and table cells included, a sentence holding "not
== semicolon: /semicolon/
skills/writing/references/anti-patterns.md:40: - **Semicolons.** The check `semicolons`, prose standard, section B.
skills/writing/references/prose-standard.md:33: - Semicolons: at most 2 per 1000 words of running prose. A full stop is usually clearer. Table cells and one-line data rows are not running prose.
skills/writing/templates/check_prose.py:27: the line it quotes. Headings (# to ######) are prose for every check except semicolons and
skills/writing/templates/check_prose.py:29: backslash, and each cell is its own unit: it is prose for every check except semicolons
skills/writing/templates/check_prose.py:55: - Running prose, which semicolons reads, is the prose outside headings and table cells, list
skills/writing/templates/check_prose.py:85: - semicolons: over running prose, when the semicolons times 1000 are more than 2 times the
skills/writing/templates/check_prose.py:86: words, every line of running prose holding a semicolon is flagged with the count and the
== colon list: /colon/
skills/writing/references/anti-patterns.md:40: - **Semicolons.** The check `semicolons`, prose standard, section B.
skills/writing/references/anti-patterns.md:41: - **Colon-and-list paragraphs in a row.** The check `colon-lists`, prose standard, section B.
skills/writing/references/prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same constr
skills/writing/references/prose-standard.md:33: - Semicolons: at most 2 per 1000 words of running prose. A full stop is usually clearer. Table cells and one-line data rows are not running prose.
skills/writing/references/prose-standard.md:34: - Never two or more consecutive paragraphs that each open with a colon and a list.
skills/writing/references/prose-standard.md:53: - Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon.
skills/writing/templates/check_prose.py:27: the line it quotes. Headings (# to ######) are prose for every check except semicolons and
skills/writing/templates/check_prose.py:29: backslash, and each cell is its own unit: it is prose for every check except semicolons
skills/writing/templates/check_prose.py:55: - Running prose, which semicolons reads, is the prose outside headings and table cells, list
skills/writing/templates/check_prose.py:85: - semicolons: over running prose, when the semicolons times 1000 are more than 2 times the
skills/writing/templates/check_prose.py:86: words, every line of running prose holding a semicolon is flagged with the count and the
skills/writing/templates/check_prose.py:104: - colon-lists: two consecutive paragraphs that each end with a colon and are each followed by
case 5: HOLDS
```

Read against each other, the greps show no two statements that contradict, with two pairs the brief and the ruling put side by side on purpose:

- `anti-patterns.md:26` (method sections: low variation in sentence length is acceptable) beside `prose-standard.md:64` (five or more consecutive sentences of the same length are rewritten). Brief item 3 dictates the per-section list "for the reader to judge an equal-length report"; the prose standard is written for this tree's pages (brief decision 3) and the list judges a manuscript's report.
- `academic-prose.md:25` (passive common for methods) beside `prose-standard.md:63` (passive rewritten unless the actor is irrelevant), stated together on line 25 as ruling 5 asks.
- `academic-prose.md:18` (third person unless the discipline allows first person) beside the quoted example "We used thematic analysis." on line 53: the example sits under the exception, since Engineering and CS takes active voice for contributions.

### git status

```text
?? .scratch/3-the-writing-base/agents/reviews/3-report.md
?? .scratch/3-the-writing-base/agents/reviews/3-rows.md
?? skills/writing/references/academic-prose.md
?? skills/writing/references/anti-patterns.md
?? skills/writing/references/judgment.md
```

The five paths are the five the brief names.

## Files

| File | Lines |
|---|---|
| `skills/writing/references/academic-prose.md` | 121 (new) |
| `skills/writing/references/judgment.md` | 49 (new) |
| `skills/writing/references/anti-patterns.md` | 44 (new) |
| `.scratch/3-the-writing-base/agents/reviews/3-rows.md` | 172 (new) |

## Judgment calls the brief left open

- The source's quoted roadmap sentence ("Section 2 reviews the literature; Section 3 describes the methodology") is written on `anti-patterns.md` line 32 as "Section 2 reviews the literature, and Section 3 describes the method", so the page holds no semicolon inside running prose, which `check_prose.py` counts even inside quotes on a page of 262 words.
- The source's "very short for conclusions" (discussion row) is written "the shortest for conclusions" (`anti-patterns.md` line 28), since "very" is on section A's filler list.
- In the "so what" table, "Build to the gap, don't just summarize" is written "Build to the gap rather than only summarising the literature", and "Lead with the finding, not the statistical test" is written "Lead with the finding, then the statistical test" (`judgment.md` lines 45 and 47), keeping each rule without a contraction, the filler "just" or a binary contrast.
- Rows that the source groups under one heading and that are not carried are split one rule per row where the source gives one rule per line (the zh-TW register and translationese lines, the revision matrix rows), and kept as one row where the lines form one unit with no separate rule (each non-carried discipline register block, the zh-TW expressions table).
- The purpose and design-boundary lines of `writing_quality_check.md` (lines 1, 3, 5 and 7) are marked "Not a rule" with the reason in their row, in the form ruling 4(vii) gives for the "used by" lines.
- Record 3's row for source lines 141-142 records that the source's example range for a run of sentences (20 to 25 words) is wider than the `equal-length` check's spread of 2 words; the script is step 2's and this step writes no code (brief decision 4).
- The records file is ledger text and is not held to the prose standard; `check_prose.py` on it flags the quoted forms it names and the phrase "not carried" the brief dictates.

## Anything in the brief wrong or impossible

The five cases above, found by the first run and ruled in `agents/briefs/3-cases.md`. Nothing else.
