# The novelty page

`novelty` writes one page in this form at its item 6, to `notes/novelty-<YYYY-MM-DD>.md` of the project folder, with the `.bib` of its confirmed works beside it as `notes/novelty-<YYYY-MM-DD>.bib`, and `idea` writes one for each round of the interview that has a candidate claim. A reader of the page is the user; `paper`'s literature strategist reads the `.bib` when the user names it in the Existing Materials row at `paper`'s intake.

## The form

```markdown
# Novelty check: <the idea in a few words>

Date: <YYYY-MM-DD>. Made by `/researcher novelty`, or by round <n> of the interview of `/researcher idea`, progress file `notes/idea-<YYYY-MM-DD>.md`.

## The idea

> <the idea or the candidate claims as the user gave them, each line quoted>

## The claims

- C1. <the claim, one sentence>
- C2. <the claim, one sentence>

## C1. <the claim>

Verdict: `<new | partly done | done>`. <the reason>

| Work | What it already does | What the idea adds beyond it |
|---|---|---|
| <authors>, <year>, "<title>", <venue>, doi <DOI> or arXiv <ID>, as `resolve` printed them | <what the work does, from the abstract or passage read in the run> | <what the claim holds that the work does not> |

## C2. <the claim>

<the same parts as C1>

## Works found and not confirmed

- <the claim> | <the title as found> | <where it was found> | <what `resolve` printed for it>

## Works with no entry in the .bib

- <the work> | <what `bibtex` printed, or that it has no DOI and no arXiv ID>

## The searches

| Claim | Query | Where it ran | Records | Indexes left out |
|---|---|---|---|---|
| C1 | `<terms>` | `lookup.py search`: Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed | <count> | <index>: <the reason `lookup.py` printed>, or none |
| C1 | `<terms>` | web search | <count> | |

## For paper

Name `notes/novelty-<YYYY-MM-DD>.bib` in the Existing Materials row at `paper`'s intake, as a starting point, and keep `paper`'s literature search in the run.
```

- Each claim has at most five works in its table, each one confirmed as `SKILL.md`'s Rules bullet on `lookup.py resolve` says.
- A claim with no confirmed work has no table, and its reason says so.
- The reason of `new` says, in the same sentence, that no closer work was found by these searches, and names each index a search of the claim left out.
- The reason of `new` or `partly done` names each work found and not confirmed for that claim.
- The reason of `partly done` names the part of the claim no confirmed work does.
- The reason of `done` names the confirmed work that already does what the claim says.
- The section "Works found and not confirmed" is written with "none" when every work was confirmed, and no verdict rests on a work it lists.
- The section "Works with no entry in the .bib" is written with "none" when the `.bib` holds an entry for every confirmed work.
- A claim at the stop "The searches did not run" has no verdict line; its section gives the reasons the searches printed.
- The searches list every query of `SKILL.md`'s "novelty" item 2, three per claim, each with the indexes it left out.

## An example

The idea, the claims, the works, their authors, titles, venues and DOIs below are made up for this example. None of them is a real publication, and the prefix `10.0000` is not a registered DOI prefix.

```markdown
# Novelty check: pruning speech model heads by gradient variance

Date: 2031-03-02. Made by `/researcher novelty`.

## The idea

> Pruning the attention heads of a speech recognition model by the variance of their gradients halves the inference cost with no loss in word error rate.

## The claims

- C1. Ranking the attention heads of a speech recognition model by the variance of their gradients gives a pruning order.
- C2. Pruning half of the heads in that order keeps the word error rate within 0.2 points of the full model.

## C1. Ranking the attention heads of a speech recognition model by the variance of their gradients gives a pruning order.

Verdict: `partly done`. A confirmed work ranks the heads of a text model by gradient variance, and the idea adds the ranking for a speech recognition model; no work was found and not confirmed for this claim.

| Work | What it already does | What the idea adds beyond it |
|---|---|---|
| A. Example, B. Sample, 2029, "Gradient variance as a head importance score", Journal of Made-Up Results, doi 10.0000/made-up.1 | Ranks the attention heads of a text classifier by the variance of their gradients over one epoch, from its abstract | The ranking for the heads of a speech recognition model |

## C2. Pruning half of the heads in that order keeps the word error rate within 0.2 points of the full model.

Verdict: `new`. No closer work was found by these searches, which left out no index; the work found and not confirmed, "Head pruning for speech models", is to be checked by the reader.

## Works found and not confirmed

- C2 | "Head pruning for speech models" | the web search for C2 | `resolve` printed "not found" on Crossref, OpenAlex and Semantic Scholar, and arXiv was left out

## Works with no entry in the .bib

- none

## The searches

| Claim | Query | Where it ran | Records | Indexes left out |
|---|---|---|---|---|
| C1 | `attention heads gradient variance speech` | `lookup.py search`: Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed | 41 | none |
| C1 | `head importance score pruning` | `lookup.py search`: Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed | 63 | none |
| C1 | `gradient variance attention head pruning speech recognition` | web search | 10 | |
| C2 | `pruning attention heads word error rate` | `lookup.py search`: Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed | 38 | none |
| C2 | `structured pruning speech transformer inference cost` | `lookup.py search`: Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed | 55 | none |
| C2 | `half of attention heads pruned speech recognition accuracy` | web search | 10 | |

## For paper

Name `notes/novelty-2031-03-02.bib` in the Existing Materials row at `paper`'s intake, as a starting point, and keep `paper`'s literature search in the run.
```
