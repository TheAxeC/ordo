# AI disclosure

The draft writer reads this page to write the AI disclosure statement of a paper, in disclosure mode and as one of the six statements of full mode. The statement stands at the place the venue's policy gives, or at the policy anchor's place when the Policy anchor row names one. It stands in the first draft of full mode, and in disclosure mode it is written as a patch as `references/patch-file.md` gives.

## Inputs

- The manuscript, which shows what the AI did.
- The AI use row of `config.md`: each category marked used, not used or uncertain, the tools with their versions, and the user's answer on whether any AI was used. In disclosure mode the session pre-marks the categories from the records of earlier runs, as `references/intake.md` gives under "Disclosure records", and the user confirms the marks.
- The venue and, for a venue this page does not list, the policy text the user pasted.
- The Policy anchor row of `config.md`, in disclosure mode: one of `prisma-trAIce`, `icmje`, `nature`, `ieee`, or "none".
- The model identifier that the session gives in the prompt, in full mode and in disclosure mode alike. It is the identifier that the runner's model list gives for opus, the model the skill's roles run on, at the run's start, such as `claude-opus-5-5`. When the list gives none, it is the model the runner served to the first agent of the run. The session first checks that this model is an opus model.
- When the runner served the draft writer that wrote the statement an identifier other than the listed one, the identifier is that served one, which the session gives in a start with the id `disclosure`.

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
- A category still uncertain at drafting is never written as used. The statement is written without it, and the list after the statement holds one line "[GAP: AI use category <category> not confirmed]" for each such category. The report lists them.
- No gap stands inside a sentence of the statement. The list of gaps follows the statement, one line for each gap.

## What the statement says

- The user's answer and the categories decide the output, and the first of these rules that matches applies.
- An answer of no AI together with a category marked used is a contradiction: no text is written and the report names both.
- An answer of no AI with every category not used and none uncertain gives the sentence "No AI was used in preparing this paper."
- An answer of no AI with a category uncertain and none used: no text is written and the report names the category.
- An answer of AI used with no category marked used: no text is written and the report asks for the categories.
- An answer of AI used, or a category marked used, gives the full statement below, in which each used category stands at full strength and each uncertain category stands in the list of gaps after the statement.
- No answer with a category uncertain and none used: no text is written and the report names the category.
- No answer with every category not used and none uncertain: no statement is written, since silence is correct when no AI was used.
- No answer and no category supplied: no text is written and the report says the AI use is not supplied.

## The full statement

- A Policy anchor row that names an anchor takes the track of "Policy anchors" below in place of this section's venue lookup. The rest of this section applies to it as it stands. A row "none" takes the venue track.
- The venue's policy is looked up in "Venue policies" below. An unlisted venue's policy is the text the user pasted at intake, used for this run only and not added to this page.
- The answer "no venue yet" at intake, and a venue that is unlisted with no pasted text, give one of the two generic forms below. `disclosure.md` says the venue's policy was not checked.
- The categories are matched against the venue's requirements. A category the venue requires disclosed but the answer marks uncertain is a mismatch, and the report names it.
- The statement is one paragraph in the venue's preferred voice (person and tense) with the venue's required phrasing elements, such as "the authors take full responsibility for the content".
- The paragraph names the tool and the version, never "AI tools" alone, and names the categories marked used.
- The model identifier is the one the prompt gives, written in full, never one written from memory or from the agent's runtime. Without one the statement is written without it, and the list of gaps after the statement holds the line `[GAP: model identifier]`. The report lists it. When the draft writer is the first agent of the run and the list gave none, the session starts it again with the id `disclosure` and the served model. That start writes the identifier into the statement and removes the line. The line stays only when the runner gives no served model. When the draft writer was served an identifier other than the one its prompt gave, the session starts it again with the id `disclosure` and the served identifier, and that start writes the served identifier into the statement in place of the listed one.
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

## Policy anchors

A policy anchor is a policy framework that many journals follow, and an author who targets one rather than a single venue gets a statement written to it. The Policy anchor row of `config.md` holds one anchor or "none".

- The track is chosen by the Policy anchor row. A row that names an anchor and a Venue row that names a venue are compatible only when the venue belongs to the Nature Portfolio and the anchor is `nature`. Any other pair is refused: the report names the conflict, and the user drops the venue or the anchor at the stop for the confirmation of the record. Neither the venue nor the anchor takes precedence silently.
- A statement for an anchor follows "What the statement says" and "The full statement" above for the answer of the AI use row and the categories. The first-match rules, the list of gaps for an uncertain category, the model identifier and the tool names are the same.
- The cells below carry the anchor's wording as recorded from its page on the snapshot date of its heading. The user verifies the wording and the placement against the anchor's current page before submission, since policies change.
- A field an anchor does not address is not written for that anchor. When a category marked used would be served by such a field, the report says the anchor leaves that detail to the journal's own policy and names the venue track.
- A statement for an anchor is not built from a quote alone. It states the tool, its version, the tasks and the human oversight under the fields the anchor addresses. It uses an anchor's wording only where a cell below gives it.

Each table lists the fields the anchor addresses, with the strength of its wording. The strengths are mandate (the policy says shall, must or should require) and recommend (should, describe, report). The third is implied: the policy does not name the field, and the cell says what it implies.

### PRISMA-trAIce

- Snapshot date: 2026-05-13. The framework is a proposal from before a consensus process, and no item is a mandate. It applies only when the paper reports a systematic literature review and AI was used as a method in it. The track is refused for any other paper, and the report says so.
- The prompt disclosure of the third row applies only for a language model or a generative tool used as a method of the review, in the stages the first row lists. It never applies for editing alone. A review whose only AI use is editing takes the editing rule of "Editing only" below.

| Field | Strength | Wording of the framework | Place |
|---|---|---|---|
| Tool name, version, developer | recommend | "Specify the name, version number (if applicable), and developer/provider." | Table 1, M2.a |
| Stage of the review | recommend | "The specific SLR stage(s) where it was applied (e.g., search, screening, data extraction, Risk of Bias assessment, synthesis, drafting)." | Table 1, M3.a |
| Task within the stage | recommend | "The precise task(s) the AI was intended to perform at each stage." | Table 1, M3.b |
| Prompts | recommend | "The full prompt(s) employed for each specific task. If prompts are extensive, provide a detailed description of their structure, key instructions, context provided..." | Table 1, M6.a |
| Human oversight | recommend | "Describe the process of human interaction with and oversight of the AI tool(s) at each stage": how many reviewers checked the output, and whether they worked independently | Table 1, M8.a to M8.g |
| Performance evaluation method | recommend | "Describe methods used to evaluate the AI tool(s) performance for the specific tasks within the review (if applicable and feasible)", with the reference standard and the metrics | Table 1, M9 |
| Performance evaluation results | recommend | "Report the results of any performance evaluations of the AI tool(s) for the specific tasks within the review", with the agreement between the AI and the human reviewers when assessed | Table 1, R2 |
| Limitations | recommend | "Discuss any limitations encountered in using the AI tool(s) (eg, technical issues, biases identified, challenges in prompt engineering, unexpected outputs, limitations in AI performance for specific sub-tasks)." | Table 1, D1 |
| Affected sections | implied | Each item of Table 1 names the manuscript section it belongs to, and the framework has no field for the sections an AI task touched | Table 1 |
| Place of the disclosure | implied | Each item of Table 1 sits under Title, Abstract, Introduction, Methods, Results or Discussion | Table 1 |
| Rights of AI-generated content | implied | "Describe how data handled by AI tools (input, output, intermediate data) was managed and stored, and any measures taken to ensure data privacy, security, and compliance with copyright or terms of service, especially when using third-party cloud-based AI tools." | Table 1, M10 |

- The framework does not address the dates of use, the human responsibility statement or an exemption for editing.
- The statement is written per section of Table 1, and not as one paragraph. It has one fragment for each of the sections Title, Abstract, Introduction, Methods, Results and Discussion that an item belongs to.
- A record is written for each pair of a tool and a stage. A pair the user did not supply gets "not supplied" on its own line, and a tool is never given a record for the pairs of another.

### ICMJE

- Snapshot date: 2026-05-13. The recommendations are adopted by many journals as a baseline. The page on AI use by authors is two short paragraphs, and it leaves the detail to each journal.

| Field | Strength | Wording of the recommendations | Place |
|---|---|---|---|
| Tool name | implied | "the journal should require authors to disclose at submission whether they used AI-assisted technologies (such as LLMs, chatbots, or image creators)." | Section V.A, paragraph 1 |
| Stage and task | implied | "Authors who use such technology should describe... how they used it." | Section V.A, paragraph 1 |
| Human oversight | recommend | "Authors should carefully review and edit the AI-generated content as the output can be incorrect, incomplete, or biased." | Section V.A, paragraph 1 |
| Human responsibility | mandate | "Therefore, humans are responsible for any submitted material that included the use of AI-assisted technologies." | Section V.A, paragraph 1 |
| Place of the disclosure | recommend | "Authors who use such technology should describe, in both the cover letter and the submitted work in the appropriate section if applicable, how they used it" | Section V.A, paragraph 1 |
| Attribution and rights | mandate | "Humans must ensure there is appropriate attribution of all quoted material, including full citations." and "Referencing AI-generated material as the primary source is not acceptable." | Section V.A, paragraph 1 |

- The framework does not address the version, the developer, the affected sections, the dates of use, the prompts, the performance of the tool, its limitations or an exemption for editing.
- The statement has two texts: one for the cover letter, in the framework's wording, and one for the section of the manuscript the venue's own policy gives. They are not one paragraph copied twice.
- The sentence of human responsibility is written whenever a category is marked used, in the framework's wording.
- A paragraph on attribution is written whenever a category is marked used, even when no figure or image is involved. Material quoted from an AI tool carries its full citation, and AI-generated material is not cited as a primary source.
- Editing has no exemption in this framework, and the statement for editing alone is written as for any other use.

### Nature

- Snapshot date: 2026-05-13. The policy applies to all Nature Portfolio journals. It covers AI authorship and generative AI images on the author's side. Its wording about text is a framework, and its wording about images is a prohibition with exceptions.

| Field | Strength | Wording of the policy | Place |
|---|---|---|---|
| Tool, stage and task | implied | "Use of an LLM should be properly documented in the Methods section (and if a Methods section is not available, in a suitable alternative part) of the manuscript." | AI authorship |
| Affected sections | implied | "in the relevant caption upon submission" for a tool that is not generative and acts on an image, and the Methods section for a language model | Generative AI images, AI authorship |
| Human oversight | mandate | "In all cases, there must be human accountability for the final version of the text and agreement from the authors that the edits reflect their original work." | AI authorship |
| Human responsibility | mandate | "an attribution of authorship carries with it accountability for the work, which cannot be effectively applied to LLMs", and "there must be human accountability for the final version of the text" | AI authorship |
| Place of the disclosure | recommend | The Methods section, "and if a Methods section is not available, in a suitable alternative part", and for a tool that is not generative and acts on an image, "should be disclosed in the relevant caption upon submission" | AI authorship, Generative AI images |
| Exemption for editing | recommend | "The use of an LLM (or other AI-tool) for 'AI assisted copy editing' purposes does not need to be declared." Such editing means "AI-assisted improvements to human-generated texts for readability and style" and does not include "generative editorial work and autonomous content creation" | AI authorship |
| Images and other content | mandate | "Springer Nature journals are unable to permit its use for publication." and "All exceptions must be labelled clearly as generated by AI within the image field." | Generative AI images |

- The policy does not address the version, the developer, the dates of use, the prompts, the performance of the tool or its limitations.
- The statement stands in the Methods section, or in the suitable alternative part when the manuscript type has no Methods section. The placement line quotes the policy's own words.
- Use for editing alone gives no statement. The report holds a line that says the use was editing and was not declared.
- For each figure, the report lists which exception of the policy applies, or that none applies and the policy forbids the image. It also lists the label text the image field takes. The draft writer changes no caption or figure for this. It writes the list into `disclosure.md` for the author to apply.

### IEEE

- Snapshot date: 2026-05-13. The guideline page is two short paragraphs. Its policy has no statement of human responsibility, no requirement of oversight, and no rule for images apart from the rule for text.

| Field | Strength | Wording of the guideline | Place |
|---|---|---|---|
| Tool name | mandate | "The AI system used shall be identified" | Paragraph 1, sentence 2 |
| Level of involvement | implied | "accompanied by a brief explanation regarding the level at which the AI system was used to generate the content" | Paragraph 1, sentence 2 |
| Task and section | mandate | "specific sections of the article that use AI-generated content shall be identified and accompanied by a brief explanation regarding the level at which the AI system was used to generate the content" | Paragraph 1, sentence 2 |
| Place of the disclosure | mandate | "shall be disclosed in the acknowledgments section of any article submitted to an IEEE publication" | Paragraph 1, sentence 1 |
| Editing | recommend | "The use of AI systems for editing and grammar enhancement is common practice and, as such, is generally outside the intent of the above policy. In this case, disclosure as noted above is recommended." | Paragraph 2 |
| Images, figures and code | implied | "The use of content generated by artificial intelligence (AI) in an article (including but not limited to text, figures, images, and code) shall be disclosed in the acknowledgments section" | Paragraph 1, sentence 1 |

- The guideline does not address the version, the developer, the dates of use, the prompts, human oversight, human responsibility, the performance of the tool or its limitations.
- The statement stands in the acknowledgments section and nowhere else, and it has no cover-letter text.
- The sections the AI-generated content touches and the level of involvement are written together. The statement gives a list of sections, such as Introduction, Methods, Results, Discussion, Abstract or Title, and a sentence on how far the AI generated the content. One is never written without the other.
- Use for editing alone still gives a statement, at the acknowledgments, in the wording of a recommendation ("is recommended") and not of a requirement ("shall be disclosed").
- Text, figures, images and code fall under the one acknowledgments paragraph, and no separate rule for images is applied.

### Editing only

- The anchors treat use for editing alone in four ways. Nature gives no statement, and IEEE gives a statement worded as a recommendation. PRISMA-trAIce leaves editing outside its scope. ICMJE does not address it, and gets the statement of any other use.
- The session never turns the four into one rule such as "editing is exempt". The track of the anchor the Policy anchor row names applies.

## Attribution and labelling

- A statement states which AI tools were used and how, in the Methods or the Acknowledgments, or where the venue puts it.
- The authors take full responsibility for all AI-assisted content.
- AI-produced text is not presented as original research results.
- Material quoted from an AI tool is attributed with a full citation of the quoted material.
- AI-generated material is never cited as a primary source.
- AI-generated data is labelled as AI-generated.
- A claim is never supported by AI-generated content cited as its source.

## The line of a review

The literature strategist writes one line at the end of `review.md`, under the heading "AI disclosure". It writes the line from the AI use row of `config.md`, the categories above and the line of `config.md` "Decisions" on the stop "The sources' review".

- The line says the review was produced with AI-assisted research tools, and names the tool and the version the AI use row gives.
- It names the categories the review involved that the row marks used: research assistance for the search and the annotated bibliography, and drafting assistance for the synthesis.
- It says that a person reviewed the sources the review includes only when the line of "Decisions" says that the user answered the stop "The sources' review" in the run.
- Otherwise it says that no person has reviewed the review: before that stop, and when the stop was taken as a recorded decision under the user's instruction not to stop.
- It says that the authors who use the review are responsible for what they take from it.
- It claims no oversight, no check, no audit and no verification that did not take place in the run.
- An answer of no AI in the AI use row contradicts a review the strategist wrote. No line is written then, and the report names the contradiction.
- The venues' policies below govern the statement of a manuscript. They do not govern this line.

```
AI disclosure: This review was produced with AI-assisted research tools (<tool and version>). The AI took part in <the categories involved>. <A person reviewed the sources the review includes. | No person has reviewed the review.> The authors who use this review are responsible for what they take from it.
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
