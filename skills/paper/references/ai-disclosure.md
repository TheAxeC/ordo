# AI disclosure

The draft writer reads this page to write the AI disclosure statement of a paper, in disclosure mode and as one of the six statements of full mode. The statement is written as a patch as `references/patch-file.md` gives, at the place the venue's policy gives.

## Inputs

- The manuscript, which shows what the AI did.
- The AI use row of `config.md`: each category marked used, not used or uncertain, the tools with their versions, and the user's answer on whether any AI was used.
- The venue and, for a venue this page does not list, the policy text the user pasted.
- In full mode, the model the runner served the agents already started in the run, which the session gives in the prompt.
- In disclosure mode no served model exists when the agent starts, so the agent writes the model identifier its runtime states for itself. The session compares it with the model the runner served the agent, and gives the served model in the prompt only when it starts the agent again after a mismatch.

## Categories of AI use

| Category | Examples |
|---|---|
| Research assistance | Literature search, annotated bibliography, claim verification. |
| Drafting assistance | Section drafting, paraphrasing, outline generation. |
| Revision assistance | Reviewer response drafting, tracked changes, consistency checking. |
| Editing assistance | Grammar, style, formatting, citation format conversion. |
| Analysis assistance | Computations or analysis results the AI produced; flagged when the paper reports any. |
| Peer review simulation | A review of the draft by an AI tool before submission. |

- Each category is marked used, not used or uncertain at intake, and the user confirms every uncertain category there.
- A category still uncertain at drafting is never written as used: the statement carries "[GAP: AI use category <category> not confirmed]" after the place that category would fill, and the report lists it.

## What the statement says

- The user's answer and the categories decide the output, and the first of these rules that matches applies.
- An answer of no AI together with a category marked used is a contradiction: no text is written and the report names both.
- An answer of no AI with every category not used and none uncertain gives the sentence "No AI was used in preparing this paper."
- An answer of no AI with a category uncertain and none used: no text is written and the report names the category.
- An answer of AI used with no category marked used: no text is written and the report asks for the categories.
- An answer of AI used, or a category marked used, gives the full statement below, in which each used category stands at full strength and each uncertain category carries the gap placeholder.
- No answer with a category uncertain and none used: no text is written and the report names the category.
- No answer with every category not used and none uncertain: no statement is written, since silence is correct when no AI was used.
- No answer and no category supplied: no text is written and the report says the AI use is not supplied.

## The full statement

- The venue's policy is looked up in "Venue policies" below. An unlisted venue's policy is the text the user pasted, used for this run only and not added to this page.
- Without a listed venue and without pasted text, the statement uses one of the two generic forms below, and `disclosure.md` says the venue's policy was not checked.
- The categories are matched against the venue's requirements. A category the venue requires disclosed but the answer marks uncertain is a mismatch, and the report names it.
- The statement is one paragraph in the venue's preferred voice (person and tense) with the venue's required phrasing elements, such as "the authors take full responsibility for the content".
- The paragraph names the tool and the version, never "AI tools" alone, and names the categories marked used.
- The model identifier is the one the runner served, never one written from memory. In disclosure mode the agent writes the identifier its runtime states for itself, and the session checks it against the runner's record of the model it served.
- It describes the human oversight: who reviewed what, and at which stages.
- It states the limits of the tool that matter for the content, such as a possible hallucination.
- Where the policy asks for the statement in more than one place, such as the Methods and the cover letter, each place gets its own text.
- Analysis assistance gets a separate paragraph, placed where the venue's policy puts the disclosure of analysis, such as a Code Availability section.
- Text that would list an AI tool as an author is not written. The statement says the tool is not an author.
- The placement is written as "Placement: <place> (<venue> policy, accessed <date> from <URL>)", and `disclosure.md` repeats it.
- The user verifies the placement against the venue's current page before submission, since policies change.

Generic form, minimal:

```
AI Disclosure: AI-assisted tools were used during the preparation of this manuscript. The authors reviewed and take full responsibility for the content.
```

Generic form, detailed:

```
AI Disclosure: The authors used <tool name> during the preparation of this work. Specifically, <tool name> was used for <specific tasks, such as literature search assistance, language editing, data visualization>. After using this tool, the authors reviewed and edited the content as needed and take full responsibility for the content of the published article.
```

## Attribution and labelling

- A statement states which AI tools were used and how, in the Methods or the Acknowledgments, or where the venue puts it.
- The authors take full responsibility for all AI-assisted content.
- AI-produced text is not presented as original research results.
- Material quoted from an AI tool is attributed with a full citation of the quoted material.
- AI-generated material is never cited as a primary source.
- AI-generated data is labelled as AI-generated.
- A claim is never supported by AI-generated content cited as its source.

## The line of a review

The literature strategist writes one line at the end of `review.md`, under the heading "AI disclosure". It writes the line from the AI use row of `config.md` and the categories above.

- The line says the review was produced with AI-assisted research tools, and names the tool and the version the AI use row gives.
- It names the categories the review involved that the row marks used: research assistance for the search and the annotated bibliography, and drafting assistance for the synthesis.
- It says a person oversaw the process and the authors take responsibility for the content.
- It claims no check, no audit and no verification. The integrity record holds the checks the run made.
- An answer of no AI in the AI use row contradicts a review the strategist wrote. No line is written then, and the report names the contradiction.
- The venues' policies below govern the statement of a manuscript. They do not govern this line.

```
AI disclosure: This review was produced with AI-assisted research tools (<tool and version>). The AI took part in <the categories involved>. A person oversaw the process, and the authors take responsibility for the content.
```

## Venue policies

Each entry gives the policy as recorded on the access date. The user verifies it against the venue's page before submission.

### ICLR

- Source URL: https://iclr.cc/public/AuthorGuide
- Access date: 2026-04-09
- Policy: authors may use LLMs and AI assistants for writing and code. Authors must disclose AI use and are fully responsible for all content.
- Required phrasing: state the specific tools and the specific tasks assisted, and include "the authors take full responsibility for the content".
- Placement: a dedicated paragraph in the paper body, typically at the end of the Introduction or in the Acknowledgements.
- Prohibited: none explicitly, but fabricated citations or results violate general scientific integrity policies.
- Authorship: AI tools cannot be listed as authors.

### NeurIPS

- Source URL: https://neurips.cc/public/EthicsGuidelines
- Access date: 2026-04-09
- Policy: authors must disclose any use of generative AI or LLMs during manuscript preparation, including writing, coding and data analysis. Full responsibility lies with the human authors.
- Required phrasing: specify the tool name, the version if known and the specific tasks, and state that the authors reviewed all AI-generated content.
- Placement: the Acknowledgements section, or a separate "Use of AI Tools" subsection before the References.
- Prohibited: using AI to fabricate or falsify data, and listing AI as an author.
- Authorship: AI tools cannot be listed as authors.

### Nature

- Source URL: https://www.nature.com/nature/editorial-policies/ai
- Access date: 2026-04-09
- Policy: authors who use AI tools, including LLMs, in the writing of a manuscript, the production of images or other elements of the research must document this use transparently in the Methods or Acknowledgements section. Authors are responsible for the accuracy of AI-generated content.
- Required phrasing: name the tool and describe how it was used, and state that the authors verified and take responsibility for all content. Nature encourages detailed descriptions.
- Placement: the Methods section, which Nature recommends, or the Acknowledgements. Mention it also in the cover letter.
- Prohibited: presenting AI-generated text or images as original human work without disclosure, and fabricating references or data.
- Authorship: AI tools cannot meet the accountability requirement of authorship and must not be listed as authors.

### Science

- Source URL: https://www.science.org/content/page/science-journals-editorial-policies
- Access date: 2026-04-09
- Policy: authors must disclose any use of AI-generated text, figures or data in the manuscript. The use of AI writing tools must be documented in the Acknowledgements section or in Materials and Methods.
- Required phrasing: identify the AI tool by name, indicate which parts of the manuscript it aided and affirm that the authors verified the accuracy of all AI-generated content.
- Placement: the Acknowledgements, which are preferred, or Materials and Methods.
- Prohibited: AI-generated text submitted without disclosure, and fabricated figures or data.
- Authorship: AI tools cannot be listed as authors, and all listed authors must meet the ICMJE criteria.

### ACL

- Source URL: https://www.aclweb.org/adminwiki/index.php/ACL_Policy_on_Publication_Ethics#Guidelines_for_Generative_Assistance_in_Authorship
- Access date: 2026-06-07
- Policy: use of generative AI to create content must be fully disclosed in the Acknowledgements section. The policy's own example is "Section 3 was written with inputs from ChatGPT". Disclosure depends on the use: language-only assistance such as paraphrasing or polishing, and short-form input assistance such as predictive keyboards, need no disclosure, while low-novelty text generation and AI-suggested new ideas do. AI literature-search tools need no special disclosure, but the usual requirements of citation accuracy and thoroughness apply. Authors are fully responsible for all submitted content.
- Required phrasing: name the tool and the specific content it produced. For low-novelty generated text, also affirm that the output was checked for accuracy and carries appropriate citations for both the source text and the source ideas.
- Placement: the Acknowledgements section.
- Prohibited: listing a generative AI tool as an author, and using automated tools that rephrase existing work as one's own without attribution, which is treated as plagiarism. Generated text that copies existing work falls under the plagiarism policy.
- Authorship: AI tools cannot be listed as authors, since ACL does not consider a generative model an entity that can fulfil co-authorship requirements.

### EMNLP

- Source URL: https://2026.emnlp.org/paper-integrity-policy/
- Access date: 2026-06-07
- Policy: EMNLP refers authors to ACL's generative-authorship guidelines, and the same requirements apply. The canonical text is the ACL entry above.
- Required phrasing, placement, prohibited uses and authorship: the same as ACL.
