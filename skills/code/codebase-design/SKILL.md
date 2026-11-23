---
name: codebase-design
description: "Hold a repository's code to written standards pages, in two modes, and give the vocabulary of deep modules for work that designs or changes a module. The standards mode fills the repository's standards pages from default pages: each missing rule is drafted in the form it takes in that repository and written after approval, and nothing that exists is rewritten. The review mode has a fresh agent that changes nothing read the code against those pages, writes the candidates as one HTML report outside the repository, each with the page and the rule it breaks, its files and lines, the problem, the fix, the benefit and how strongly it is recommended, and turns the candidate the user picks into a roadmap entry. Triggers on: /codebase-design, /codebase-design standards, /codebase-design review, fill the standards pages of a repository, review the code against the standards pages, find shallow modules, find deepening opportunities, design a module's interface, decide where a seam goes, make this code more testable."
metadata:
  version: "1.0.0"
---

# Codebase design

`/codebase-design` holds a repository's code to written standards pages in two modes, and with no mode gives the vocabulary of deep modules for work that designs or changes a module, which leaves nothing behind. The mode `standards` fills the repository's standards pages from the default pages and leaves behind the additions the user approved. The mode `review` reads the code against those pages for friction that makes the code hard to understand and to test, and leaves behind an HTML report of candidates outside the repository and a roadmap entry for the candidate the user picks.

## Quick start

```
/codebase-design standards        fill the repository's standards pages: each rule the pages lack, drafted in the form it takes here, written after approval
/codebase-design review [area]    read the code, or the area named, against the standards pages; write the candidates as an HTML report; turn the picked one into a roadmap entry
/codebase-design                  the vocabulary of deep modules, for work that designs or changes a module; writes no file
```

## Use instead

| When | Use |
|---|---|
| A new repository is to be set up with its standards pages | `/repo-setup` |
| A roadmap entry's design is to be settled | `/grill <entry>` |
| The comments of a diff are to be reviewed | `/code-comments` |

## What it reads

1. The mode, from the call: `standards`, `review` with an optional area, or none.
2. The `repo-setup` skill's folder, which stands beside this skill's folder, in both modes.
   - Its `templates/docs/dev/` holds the default pages: `change-standard.md`, `design-principles.md`, `prose-standard.md`, `ui-standard.md` and `coding-standards/` with `common.md` and one page per language.
   - Its `templates/docs/adr/README.md` and `templates/docs/adr/template.md` are read for an ADR folder the repository lacks, as "Steps / review" 12 says.
   - A default page marks what a repository fills in with a placeholder in angle brackets, such as `<the layers, top down>`.
   - The folder missing is the refusal "No repo-setup folder", which names the folder.
3. The repository's `plan.yaml`, when it has one: the first found in `.scratch/`, `docs/` and `.agents/` at the repository root, in that order, as `/plan`'s "What it reads" 1 finds it for a call that names no folder.
   - Each path it holds is read relative to the folder that holds the file.
   - In the `projects:` form, the `rules` and `standards` of every project are read.
   - A repository without one is read by places 2 and 3 of item 4.
4. The standards pages, by subject: the change standard, the design principles, the common page of the coding standards, the page of the coding standards of each language, the UI standard and the prose standard. The coding standards are held page by page, so the common page is one subject and each language's page is a subject of its own. The pages of each subject are found in this order, and no place of the order refuses a repository:
   1. The pages the repository's `plan.yaml` names under `rules` and `standards`, when the repository has one.
   2. The fixed names under `docs/dev/` that the `repo-setup` skill's "The tree" gives each subject: `docs/dev/change-standard.md`, `docs/dev/design-principles.md`, `docs/dev/coding-standards/common.md`, `docs/dev/coding-standards/<language>.md`, `docs/dev/ui-standard.md` and `docs/dev/prose-standard.md`.
   3. The default pages of item 2.
   - A subject is present in a repository when a page found at place 1 or 2 holds rules of that subject, wherever they stand, such as a section of another page.
   - A subject the repository lacks is one that applies ("What it reads" 7) and that no page of place 1 or 2 holds.
   - A repository that uses a language and has no rules for that language in its pages lacks that language's page, whatever its common page holds.
   - A subject that does not apply is never named as one the repository lacks: a repository with no user interface does not lack the UI standard.
   - Which subject a page or a section holds is judged by reading it.
5. The languages of the repository, from the file extensions as the `repo-setup` skill's "What it reads" 3 names them.
6. Whether the repository has a user interface.
   - A repository that uses Svelte or SvelteKit has one.
   - Otherwise the user is asked once (the stop "The user interface").
7. The subjects that apply: the UI standard only in a repository with a user interface, a language's page of the coding standards only for a language the repository has, and every other subject always.
8. For `review`, and wherever `references/design-it-twice.md` is followed, the call with no mode included, the repository's glossary and its ADRs in the area.
   - They are the glossary and the `adr` folder the repository's `plan.yaml` names when it has one, and otherwise `docs/glossary.md` and `docs/adr/` when they exist.
   - With neither, the skill still runs.
9. For `review` with no area named, the commit history, as `git log --oneline` prints it.
10. The reference pages of this skill, each read at the step that names it: `references/vocabulary.md`, `references/deepening.md`, `references/design-it-twice.md` and `references/report.md`.

## Steps

### The call with no mode

1. Read `references/vocabulary.md` whole, then use its terms and principles in the work that designs or changes a module.
   - Done when the page is read and no file is written.
2. For a cluster of modules that is to be deepened, classify its dependencies as `references/deepening.md` says.
   - Done when each dependency has its category.
3. When the user wants to see other interfaces, read the repository's glossary and its ADRs in the area, as "What it reads" 8 says, then follow `references/design-it-twice.md`.
   - The glossary read is the one whose vocabulary the agents' prompts include.
   - Done when the designs are compared and one is recommended.

### standards

1. Find the `repo-setup` skill's folder as "What it reads" 2 says.
   - Done when the folder is found, or the refusal is raised before anything is drafted.
2. Find the languages of the repository and whether it has a user interface, as "What it reads" 5 and 6 say.
   - Done when the languages are listed and the answer on the user interface is known.
3. Find the repository's pages at places 1 and 2 of "What it reads" 4, and judge which subject each page and each section holds.
   - Each language of the repository is judged on its own: its page is present only when a page or a section holds rules for that language.
   - Done when each subject that applies is present, with the page or section that holds it, or is a subject the repository lacks.
4. For each rule of each default page of a subject that applies, the prose standard left out, look for the same rule in the repository's pages.
   - A rule that already stands there, wherever it stands, is left as written.
   - Done when each such default rule is present, with where it stands, or missing.
5. Draft each missing rule in the concrete form it takes in the repository, read from the code.
   - Each placeholder of the default page is filled from what the code shows.
   - The check that enforces the rule is named where the repository has one.
   - A placeholder the code does not settle is put to the user as a question in the draft.
   - Done when each missing rule is drafted, with its question where it has one.
6. Give each drafted rule its place.
   - A drafted rule goes where the repository keeps that subject of rule: the page, or the section of another page, that Steps / standards 3 found.
   - A subject the repository lacks gets a new page, beside the pages the repository already has, and under `docs/dev/` when it has none.
   - A new page takes the file name place 2 of "What it reads" 4 gives its subject, so that a later run finds it.
   - The prose standard is copied as it is when the repository has none, and left alone when it has one.
   - A new page is added to the `standards` list of the repository's `plan.yaml` when it has one, as part of the draft.
   - In the `projects:` form, a new page is added to the `standards` list of the project whose pages it stands beside, and the draft names that project.
   - Done when each drafted rule has its file and its place in it, and each new page its path.
7. Show the whole draft before anything is written (the stop "The draft").
   - It shows each addition with the file and the place it goes to.
   - It shows each new page whole.
   - It shows each change to `plan.yaml`.
   - It shows each default rule found already present, with where it stands.
   - When every default rule is already present, the draft says so, nothing is written and the skill ends here.
   - Done when the user has approved or corrected the draft.
8. Write the additions as approved or corrected, and name every file written.
   - Done when each addition stands in its file, the message names every file written and no commit is made.

### review

1. Find the `repo-setup` skill's folder as "What it reads" 2 says.
   - Done when the folder is found, or the refusal is raised.
2. Decide where to look before looking. Deepening a module pays off by making future changes to it easier, so the parts of the code that changed lately weigh more.
   - An area the user names (a module, a subsystem, a pain point) is taken, and the commit history is not read for it.
   - Otherwise the commit history, read a good stretch back, shows the files and areas that keep coming up, and those are read first.
   - When the changes are scattered with no clear area, the whole repository is read.
   - Done when the scope is named: an area, the paths to read first, or the whole repository.
3. Read the repository's glossary and its ADRs in the area, as "What it reads" 8 says.
   - The glossary's terms give names to good seams, and an ADR records a decision the review does not reopen without cause (Steps / review 7).
   - Done when both are read, or the repository has neither.
4. Find the standards pages as "What it reads" 4 says, with the languages and the answer on the user interface of "What it reads" 5 and 6.
   - A subject that is present is read from the repository's pages, and no default page is used for it.
   - For a subject the repository lacks, the code is held to the default page of that subject.
   - A language the repository has, with no rules for it in the repository's pages, is such a subject: the code in that language is held to the default page of that language.
   - A sentence of a default page that still holds a placeholder is skipped: no candidate cites it.
   - Done when each subject that applies has its pages, the repository's or the default one, and each subject the repository lacks is listed.
5. Start one fresh agent that changes nothing to walk the code, started as Rules says for every agent.
   - Its prompt gives the paths of the pages of Steps / review 4, each default page marked as a default page, the path of `references/vocabulary.md`, the scope, the glossary and the ADRs read, and the bullets below.
   - The agent follows no rigid heuristic: it explores and notes where it meets friction.
   - Where does understanding one concept require bouncing between many small modules?
   - Where are modules shallow, with an interface nearly as complex as the implementation?
   - Where have pure functions been extracted for testability alone, while the real bugs hide in how they are called (no locality)?
   - Where do tightly coupled modules leak across their seams?
   - Which parts of the code are untested, or hard to test through their current interface?
   - Where does the code break a rule of a standards page?
   - The deletion test is applied to anything suspected of being shallow: would deleting it concentrate complexity, or only move it? "It concentrates" is the signal wanted.
   - Each candidate names the standards page and the rule it breaks, its files and lines, the problem, the fix, the benefit and how strongly it is recommended: `Strong`, `Worth exploring` or `Speculative`.
   - A candidate under a rule of a default page says that the rule comes from the default page.
   - The benefit is given in terms of locality and leverage, and of how the tests would improve.
   - The text uses the repository's glossary for the domain and the terms of `references/vocabulary.md` for the design: where the glossary defines "Order", it says "the Order intake module", neither "the FooBarHandler" nor "the Order service". The example is made up.
   - A candidate proposes no interface.
   - The agent edits no file, starts no agent and invokes no skill, and its final message lists the candidates.
   - Done when the runner reports that the agent ended.
6. Read the files and lines of each candidate.
   - A candidate whose lines do not show what it says is dropped.
   - Done when each candidate left is one the session has read at its lines.
7. Hold each candidate against the ADRs read.
   - A candidate that contradicts an ADR is shown only when the friction warrants reopening that ADR, and its card then carries a warning that names the ADR and why it is worth reopening.
   - A refactor that an ADR forbids and no friction calls for is left out.
   - Done when each candidate that contradicts an ADR is marked or left out.
8. Write the report as `references/report.md` gives it: one HTML file with a card per candidate, each with its before and after picture.
   - The file is written to the operating system's temporary folder, so that nothing lands in the repository: `$TMPDIR`, or `/tmp` when it is not set, or `%TEMP%` on Windows.
   - It is named `architecture-review-<timestamp>.html`, so that each run writes a new file.
   - The report names each subject the repository lacks, and `/codebase-design standards` as the way to fill it.
   - It ends with the top recommendation: the candidate to take first and why.
   - Open it for the user (`xdg-open <path>` on Linux, `open <path>` on macOS, `start <path>` on Windows) and give its absolute path.
   - Done when the file is written and opened and the message gives its absolute path.
9. Ask the user which candidate to explore (the stop "The candidates").
   - With no candidate picked, Steps / review 10 and 11 are left out.
   - Done when the user has picked a candidate, or has picked none.
10. For the picked candidate, when the user wants to see other interfaces, follow `references/design-it-twice.md`, and classify the dependencies as `references/deepening.md` says.
    - Done when the designs are compared and one is recommended, or the user asked for none.
11. Make the picked candidate a roadmap entry.
    - In a repository with no `plan.yaml` in the three folders of "What it reads" 3, invoke `/ordo-init` first, which has its own draft and approval.
    - When the user declines `/ordo-init`, the skill ends with the report as its result and says that no roadmap entry was written.
    - Invoke `/roadmap add` with the candidate as the goal, which has its own approval.
    - The goal names, for the picked candidate, its constraints, its dependencies with their categories as `references/deepening.md` gives them, the shape of the deepened module, what sits behind the seam and which tests survive.
    - Then invoke `/grill` on that entry, which settles each of those, with the entry's other decisions, its glossary terms and its ADRs.
    - Done when `/grill` has ended on the entry, or the message says that no roadmap entry was written.
12. Offer an ADR for a candidate the user rejects for a reason a later review would need in order not to propose it again.
    - A reason that holds only for now, such as "not worth it right now", and a reason that is plain from the code get no offer.
    - On the user's yes, the record is written in the repository's ADR folder, from its `template.md` or, with none, in the form of its latest record, with status `proposed` and numbered after the folder's highest.
    - A repository with no ADR folder gets one first, from the `repo-setup` skill's `templates/docs/adr/README.md` and `templates/docs/adr/template.md`.
    - The new folder stands at the path the `adr` key of the repository's `plan.yaml` names when it has one, and otherwise at `docs/adr/`.
    - Done when the record is written, or the user said no, or no rejection had such a reason.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No repo-setup folder | Either mode, at its Steps 1, when the `repo-setup` skill's folder does not stand beside this skill's folder | A refusal that names the folder | The `repo-setup` skill installed beside this skill, then the call again |
| The user interface | Either mode, when the repository uses neither Svelte nor SvelteKit | The question whether the repository has a user interface a reader sees and operates, asked once | The user's answer |
| The draft | Steps / standards 7, before anything is written | Each addition with its file and place, each new page whole, each change to `plan.yaml`, each default rule already present with where it stands, and the draft's questions | The user's approval or correction |
| The candidates | Steps / review 9, after the report is written and opened | The report's absolute path and the question which candidate to explore | The user's pick, or the user's word that none is picked |
| The ADR offer | Steps / review 12, only when the user rejects a candidate for a reason a later review would need | The candidate, the reason and the offer to record it as an ADR | The user's yes or no |

- The first row is a refusal: it names its cause and writes nothing.
- The skills that `review` invokes, `/ordo-init`, `/roadmap add` and `/grill`, stop as their own Stops tables say.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A page that exists rewritten into the default page's structure | It rewrites rules the user already approved, and every record that cites a line of them goes stale | Leave each rule that stands as written, and draft only the rules the pages lack (Steps / standards 4 to 6) |
| A default rule written with its placeholder still in it | The page then states something nobody filled in | Fill it from the code, or put it to the user as a question in the draft |
| A candidate passed into the report unread | The agent's return is a lead, and its lines may not show what it says | Read each candidate's files and lines, and drop one they do not show (Steps / review 6) |
| A candidate under a default sentence that still holds a placeholder | The sentence states no rule for this repository | Skip the sentence (Steps / review 4) |
| An interface proposed in the report | The user has not picked a candidate, and a design nobody asked for hides the choice | Propose interfaces after the pick, as Steps / review 10 says |
| Every refactor an ADR forbids listed as a candidate | The report reopens decisions the repository has made | Show such a candidate only when the friction warrants reopening the ADR (Steps / review 7) |
| "Component", "service", "API" or "boundary" in a candidate | The reader cannot tell whether a new thing is meant | Use the terms of `references/vocabulary.md` exactly |
| A report that loads a style or a script from the network | It shows nothing where there is no network | Keep every style and diagram in the file, as `references/report.md` says |

## Rules

- The skill reads no standards page from a path outside the repository it runs in and its own skills folder.
- The mode `standards` adds, and rewrites nothing that exists.
- The mode `review` changes the repository only through `/ordo-init`, `/roadmap add` and `/grill`, and through an ADR the user said yes to.
- The skill makes no commit in either mode, and `/ordo-init`, `/roadmap add` and `/grill` make their own.
- Every agent the skill starts is a fresh agent on the runner's general-purpose agent with the runner's defaults, its prompt setting no model and no effort.
- The skill reads no plan configuration for a model.
