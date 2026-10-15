# 0013. A script and four fresh read-only agents review a draft

Status: proposed

## Context

`/writing <file>` reviews a draft against the prose standard, `references/rules.md` and `references/registers.md`, and reports each finding with its place, the quoted passage and the rule it breaks, with no proposed replacement. ADR 0003 gave the review to one fresh agent that changes nothing and reads the whole draft. Two runs of that design on the plan's known cases (`.scratch/3-the-writing-base/agents/reviews/3-gate-reading.md` and `3-gate-reading-run-2.md`) found the sentence rules reliably and missed rules judged over a section or the whole draft, such as tense per section, a reporting guideline in a methods section, varied paragraph length and mirror structure, in six of the eight case reports. The same text in its `.tex` and `.docx` form gave different results on four such rules. One run on the NWO XS application cost 97,352 and 119,858 tokens.

## Decision

`/writing` first runs a script, `templates/prose_facts.py`, that computes the facts with one right answer: words per sentence, sentences and words per paragraph, semicolons per 1000 words, runs of five or more consecutive sentences of equal length, non-ASCII characters, the words of the prose standard's banned and flagged lists, and contractions. It then starts four fresh agents that change nothing, each given in its prompt the draft's text, the script's facts and only its own rules: a sentence agent for the rules a single sentence can break, a section agent that goes through the sections one after another for each section's job, its tense, the first sentence of each paragraph and what the register asks of that kind of section, a whole-draft agent for the rules that span sections, and a checking agent that keeps a finding only where its quote stands at its place and the rule's own words describe the break. Each rule of the three pages is given to one agent. The session shows the one report, grouped by rule, and changes nothing. A run on a draft the size of the NWO XS application costs at most 300,000 tokens.

## Alternatives rejected

- One fresh agent with every rule (ADR 0003): it misses the rules judged over a section or the whole draft, as the two runs above show.
- One agent per section of the draft: rules that span sections are lost between agents, and a draft of twelve sections costs about 700,000 tokens.
- The session that runs `/writing` reads the draft itself: when it wrote the draft, it reviews its own work.

## Consequences

Each review costs four agent runs and one script run. Counts no longer depend on an agent's reading. Every rule added to the three pages must be given to one of the four agents. The script is listed on `docs/dev/scripts.md` as a user script.
