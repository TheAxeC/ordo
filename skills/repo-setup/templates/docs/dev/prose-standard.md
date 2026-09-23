# The prose standard

Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.

Provenance: the vercel-labs/writing-guidelines ruleset (the published list that names AI tells as a category), minus its publishing-pipeline rules, with its typography rules inverted (this tree requires the ASCII forms, because its prose is read in a terminal, a diff and a grep), plus the hardening below.

Calibration exemplar: <the first page the user approves as the register, named here once it exists>.

Excluded from style rewrites: vendored and generated trees, and installed skill packages. They stay inside the ASCII rule.

## 0. Hard rules

- **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same construction respelled and is equally banned; a hyphen inside a compound word or a number range is not a dash.
- **Plain prose only.** No quips, no punchy one-line summaries, no dramatic sentence fragments, no cute contrasts ("not a lint, a compiler"), no headline-style headings that editorialise. State the fact and stop.
- **No performative asides**, in any variant: "which is exactly when you want to know", "it could not be otherwise", "that is the whole point", "worth noting", "worth remembering".
- **No dramatic bolded closers**, no grandiose self-assessment, no cutesy section titles.
- **Headings are labels, not sentences.** "Cost", "After a restart". Not "Why it is separate at all".
- **No repeated construction.** A sentence shape that recurs across entries or sections is a template and is rewritten once noticed.
- **Arrows (`->`) only inside code and code comments**, never as prose punctuation. Rewrite as a sentence.
- **No chatbot framing.** No "Great question", "Here's what I found", "Would you like me to", and no closing offer of further help.

## A. Vocabulary

Banned as filler; cut or replace with the concrete fact: easy, simple, quick, very, really, just (as a softener; temporal "just" and genuine minimality claims stay), simply.

Vague qualifiers are replaced with the number or the specific claim: significantly, many, often, typically, generally, near-zero, sub-second, most requests.

Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament, navigate, leverage, realm, embark, underscore, multifaceted, nuanced, comprehensive, robust, intricate, cornerstone, paradigm, synergy, holistic, streamline, cutting-edge, groundbreaking.

## B. Punctuation

- Em dash and dash-as-aside: zero (see 0).
- Semicolons: at most 2 per 1000 words of running prose. A full stop is usually clearer. Table cells and one-line data rows are not running prose.
- Never two or more consecutive paragraphs that each open with a colon and a list.
- ASCII throughout: straight quotes, three dots, `+/-`, `~`, `->` only in code. Accented letters in names stay.

## C. Throat-clearing and meta-commentary

Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".

Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.

Never open a paragraph by recapping the prior one ("With this setup complete", "Now that we've explored"). Pivot directly.

## D. Structure

- **No rule of three.** Do not pad a list to three items and do not decompose every argument into three parts. The evidence decides the count.
- **Paragraphs cover one idea and stay under roughly four sentences**; split anything longer or covering two.
- **Vary paragraph length.** Uniform blocks are a template.
- **No synonym cycling.** One term per concept, repeated. Technical repetition is clarity.
- **Binary contrast ("not X, Y") at most twice per page**, and only where the contrast is the actual point.
- **No mirror structure.** Each section takes the shape its content needs.
- Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon.

## E. Sentence shapes

- **Spec-sheet voice**: "provides", "supports", "allows you to", "is configurable". Say what the code does. External capabilities are the exception ("the library provides").
- **Stop-start fragments**: one dependent idea split into fragments ("Previously manual. Now automatic."). Join them.
- **Cold opens**: a body paragraph whose first sentence has no antecedent, so "this" is a guess. Carry the prior subject forward.
- **Restating closes**: a final sentence that says the paragraph again in shorter words. Cut it.
- **Personified artifacts** for colour are banned; personification that is the project's defined vocabulary is not.
- **Rhetorical questions**: avoided, except a question a section answers as its subject.
- **Passive voice**: rewrite unless the actor is irrelevant.
- **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten.

## F. Emphasis and formatting

- **Bold** only for a term at first use, a critical fact or warning, or a list-item label (`- **Term**: ...`). Bold reached for tone means the sentence is weak.
- No ALL-CAPS emphasis in prose.
- Inline code for paths, identifiers, literals, and anything that would look wrong without monospace.
- Source formatting: one paragraph or bullet per source line, no hard wrapping; one blank line before headings and around code fences; code fences carry a language tag.

## How it is applied

Per page, in order: read the whole page; recompose at sentence level against 0 and A-F; restructure every paragraph covering two ideas or running past four sentences; scan for non-ASCII (`LC_ALL=C grep -n '[^ -~]' <file>`) and for spaced-dash asides until both report nothing; deliver the page whole. A violation a page quotes from elsewhere is fixed at its source in the same change. New prose is checked against 0 and A-F as it is written.
