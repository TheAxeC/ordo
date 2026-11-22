# 0026. A manuscript is held to the prose standard with the differences the manuscript prose standard lists

Status: proposed

## Context

ADR 0002 decides that the prose standard holds for every text the writing skills write or review, and that no rule contradicting it is carried. Two rulings of plan 5 contradict it for a manuscript (`.scratch/5-paper/plan.md`, Rulings). Ruling AV6 lets a paragraph of a manuscript run 120 to 200 words and past four sentences, as academic-paper 3.2.0 writes it. The prose standard keeps paragraphs under roughly four sentences (`skills/ordo/repo-setup/templates/docs/dev/prose-standard.md:48`). Ruling AW keeps file names, paths, code identifiers and software-operations wording out of the manuscript text. The prose standard asks for inline code for paths and identifiers (`:70`) and for saying what the code does (`:57`). Other rules of the prose standard concern software documentation, a terminal or Markdown source, and have no object in a manuscript. They are ASCII throughout (`:35`), personified artifacts (`:61`) and source formatting (`:71`). The rule on arrows outside code (`:19`) does not fit a paper, which uses arrows in mathematics. ADR 0001 decides that the writing base reads the prose standard where it is, so a repository's own prose page is read in place of the template.

## Decision

The prose of a manuscript is the text of a paper, its abstract, its statements and its cover letter. It is held to the prose standard, read where ADR 0001 says, with the differences `skills/academic/writing/references/manuscript-prose-standard.md` lists. That page holds no copy of the prose standard's rules. It lists the rules left out for a manuscript and the two rules it replaces. One replaced rule keeps arrows inside mathematics. The other sets paragraphs of one idea at about 120 to 200 words, each sentence keeping the sentence-length limit. The page's own section G keeps the project's software wording out of the text. A rule the page does not name holds for a manuscript as the prose standard states it. This record supersedes ADR 0002 in the part those differences touch. For every other text, and for every rule the page does not name, ADR 0002 stands. ADR 0001 stands whole.

## Alternatives rejected

- A full manuscript prose standard that copies the prose standard's rules and edits them: it ignores a repository's own prose page, which ADR 0001 requires reading. Two copies of the same rules also drift apart.
- The ADRs left as they are, with the rulings built against them: a reviewer then finds the clash in every step that touches the writing skills. The records would no longer say which rule holds.

## Consequences

`/writing` and `paper` read the prose standard where it is and apply the listed differences when the draft is a manuscript. A change to the prose standard reaches a manuscript at once, unless the page lists the rule it changes. A new difference for manuscripts is added to the page and to this record's Decision, never as a separate rule set.
