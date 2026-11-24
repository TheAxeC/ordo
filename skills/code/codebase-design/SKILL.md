---
name: codebase-design
description: "Hold a repository's code to written standards pages, in two modes, and give the vocabulary of deep modules for work that designs or changes a module. The standards mode shows the rules of default pages that the repository's standards pages lack as a draft in groups, a rule the code already follows in one line with its count, and writes what the user approves. The review mode has a fresh agent that changes nothing read the code against those pages, writes the candidates as one HTML report outside the repository, each with the page and the rule it breaks, its files and lines, the problem, the fix, the benefit and how strongly it is recommended, and turns the candidate the user picks into a roadmap entry. Triggers on: /codebase-design, /codebase-design standards, /codebase-design review, fill the standards pages of a repository, review the code against the standards pages, find shallow modules, find deepening opportunities, design a module's interface, decide where a seam goes, make this code more testable."
metadata:
  version: "1.0.0"
---

# Codebase design

`/codebase-design` holds a repository's code to written standards pages in two modes, and with no mode gives the vocabulary of deep modules for work that designs or changes a module, which leaves nothing behind. The mode `standards` compares the repository's standards pages with the default pages, shows the rules they lack as a short draft in groups, and leaves behind the additions the user approved and, outside the repository, an audit file and the drafted text of each new page. The mode `review` reads the code against those pages for friction that makes the code hard to understand and to test, and leaves behind an HTML report of candidates outside the repository and a roadmap entry for the candidate the user picks.

## Quick start

```
/codebase-design standards        fill the repository's standards pages: the rules the pages lack, shown as a short draft in groups, written after approval
/codebase-design review [area]    read the code, or the area named, against the standards pages; write the candidates as an HTML report; turn the picked one into a roadmap entry
/codebase-design                  the vocabulary of deep modules, for work that designs or changes a module; writes no file
```

## Use instead

| When | Use |
|---|---|
| A new repository is to be set up with its standards pages | `/ordo-init` |
| A roadmap entry's design is to be settled | `/grill <entry>` |
| The comments of a diff are to be reviewed | `/code-comments` |

## What it reads

1. The mode, from the call: `standards`, `review` with an optional area, or none.
2. The `ordo-init` skill's folder, which stands beside this skill's folder, in both modes.
   - Its `templates/docs/dev/` holds the default pages: `change-standard.md`, `design-principles.md`, `prose-standard.md`, `ui-standard.md` and `coding-standards/` with `common.md` and one page per language.
   - Its `templates/docs/adr/README.md` and `templates/docs/adr/template.md` are read for an ADR folder the repository lacks, as "Steps / review" 12 says.
   - A default page marks what a repository fills in with a placeholder in angle brackets, such as `<the layers, top down>`.
   - The folder missing is the refusal "No ordo-init folder", which names the folder.
3. The repository's `plan.yaml`, when it has one: the first found in `.scratch/`, `docs/` and `.agents/` at the repository root, in that order, as `/plan`'s "What it reads" 1 finds it for a call that names no folder.
   - Each path it holds is read relative to the folder that holds the file.
   - In the `projects:` form, the `rules` and `standards` of every project are read.
   - A repository without one is read by places 2 and 3 of item 4.
4. The standards pages, by subject: the change standard, the design principles, the common page of the coding standards, the page of the coding standards of each language, the UI standard and the prose standard. The coding standards are held page by page, so the common page is one subject and each language's page is a subject of its own. The pages of each subject are found in this order, and no place of the order refuses a repository:
   1. The pages the repository's `plan.yaml` names under `rules` and `standards`, when the repository has one.
   2. The fixed names under `docs/dev/`: `docs/dev/change-standard.md`, `docs/dev/design-principles.md`, `docs/dev/coding-standards/common.md`, `docs/dev/coding-standards/<language>.md`, `docs/dev/ui-standard.md` and `docs/dev/prose-standard.md`.
   3. The default pages of item 2.
   - A subject is present in a repository when a page found at place 1 or 2 holds rules of that subject, wherever they stand, such as a section of another page.
   - A subject the repository lacks is one that applies ("What it reads" 7) and that no page of place 1 or 2 holds.
   - A language's page of the coding standards is present only when a page found at place 1 or 2 is a page for that language or holds a section for it, whatever the common page holds.
   - A sentence about that language's files inside a rule of another subject, such as a size limit that also counts `.py` files, does not make the page present. The example is made up.
   - A subject that does not apply is never named as one the repository lacks: a repository with no user interface does not lack the UI standard.
   - Which subject a page or a section holds is judged by reading it.
5. The languages of the repository, from the extensions of the files git tracks, as `git ls-files` lists them.
   - C++ is read from `.cpp`, `.cc`, `.cxx`, `.h`, `.hpp` and `.hh`, Python from `.py`, and TypeScript from `.ts`, `.tsx` and `.svelte`.
   - A file under a folder named `third_party`, `vendor` or `node_modules` is left out, as vendored third-party code.
   - A file under the `ledger_root` or the `archive_root` of the repository's `plan.yaml` is left out.
6. Whether the repository has a user interface, settled after the repository's pages at places 1 and 2 of item 4 are read.
   - A repository whose pages hold a UI standard has one.
   - A repository that tracks a `.svelte` file uses Svelte or SvelteKit, and has one.
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

1. Find the `ordo-init` skill's folder as "What it reads" 2 says.
   - Done when the folder is found, or the refusal is raised before anything is drafted.
2. Find the languages of the repository, as "What it reads" 5 says.
   - Done when the languages are listed.
3. Find the repository's pages at places 1 and 2 of "What it reads" 4, and judge which subject each page and each section holds.
   - Each language of the repository is judged on its own, as "What it reads" 4 says of a language's page.
   - Only these pages are compared, so a rule that stands on another page of the repository counts as missing.
   - Each other page of the repository that holds rules, such as a contribution guide, is noted by its path for the draft.
   - Done when each page found has its subjects, and each other page of rules is noted.
4. Settle whether the repository has a user interface, as "What it reads" 6 says.
   - Done when the answer is known, and each subject that applies is present, with the page or section that holds it, or is a subject the repository lacks.
5. Sort each rule of each default page of a subject that applies, the prose standard left out, as present or into one of five groups.
   - One rule is one numbered item, one bullet, or one paragraph or block outside any list that states a requirement, such as a section that gives the commands to run.
   - A conditional rule, such as one that opens "Where the repository uses", is left out and never shown when the code shows its condition to be false.
   - A default rule that names a tool (a formatter, a linter, a type checker) for which the tree holds no configuration is split by requirement, and each requirement is sorted on its own.
   - A requirement the code shows without the tool is sorted like any other rule, even when its sentence names the tool or speaks of it by a pronoun.
   - Only what cannot be met without the tool goes to group 5: that the tool runs, its configuration file, and a requirement that only the tool can check.
   - Each rule gets the first of these that fits, tried in this order:
     - Present: the repository's pages hold a rule that asks the same on the same requirement, wherever it stands.
     - Group 1, a difference: the repository's pages hold a rule on the same requirement that asks something else, such as a different limit, a different order or a different check, whether or not the two can both be followed.
     - Group 2, a rule on how work is done: the pages hold nothing on the requirement, and whether the rule is followed cannot be read from the code, as with a rule of the change standard.
     - Group 3, a rule the code already follows: the pages hold nothing on the requirement, and the code follows the rule in more than half of the places it applies to.
     - Group 4, a rule the code does not follow: the pages hold nothing on the requirement, and the code follows the rule in half of the places it applies to, or in fewer.
     - Group 5, a rule about a tool the repository lacks: a requirement that cannot be met without a tool for which the tree holds no configuration, as the bullets on a tool above say.
   - A default rule that holds more than the repository's rule, and asks nothing else on what both cover, is present, and the sentences it holds beyond the repository's are neither drafted nor asked about.
   - A rule that is present is left as written.
   - For groups 3 and 4, a command counts the places the rule applies to and the places that follow it, over the files of "What it reads" 5.
   - A rule whose following could be read from the code, and that applies in no place of the code, is left out.
   - Done when each such default rule is present, with the page, the section and the line where it stands, or is in one group, or is left out.
6. Draft each rule of groups 1 to 4 in the concrete form it takes in the repository, read from the code.
   - Each placeholder of the default page is filled from what the code shows.
   - The check that enforces the rule is named where the repository has one.
   - A placeholder the code does not settle stays a question: one plain sentence that says what is not known and what each answer would write.
   - A sentence that points at something the repository lacks, such as a glossary page, is drafted without that pointer.
   - An example that names a thing the repository has none of is replaced by an example from the repository's own pages or code.
   - Done when each rule of groups 1 to 4 is drafted, with its question where it has one.
7. Give each drafted rule its place.
   - A drafted rule goes where the repository keeps that subject of rule: the page, or the section of another page, that Steps / standards 3 found.
   - A subject the repository lacks gets a new page.
   - In a repository with a `plan.yaml` and pages of its own, a new page stands beside those pages, under the file name of its fixed name, such as `python.md`.
   - In a repository without a `plan.yaml`, or with no page of its own, a new page takes the fixed name place 2 of "What it reads" 4 gives its subject.
   - A new page is added to the `standards` list of the repository's `plan.yaml` when it has one, as part of the draft.
   - In the `projects:` form, a new page is added to the `standards` list of the project whose pages it stands beside, and the draft names that project.
   - A new page holds its rules of groups 2 and 3, and a rule of group 4 enters it only when the user names it.
   - The prose standard is copied as it is when the repository has none, and left alone when it has one.
   - Done when each drafted rule has its file and its place in it, and each new page its path.
8. Write the audit file and the drafted text of each new page to the operating system's temporary folder, as "Steps / review" 8 finds it.
   - The audit file is one Markdown file named `standards-audit-<timestamp>.md`, so that each run writes a new file.
   - It holds each default rule found present, with the page, the section and the line where it stands.
   - It holds each rule of groups 3 and 4 with its count and the command that produced the count.
   - It holds the place each addition will go to.
   - It holds each rule left out because it applies in no place of the code.
   - The user is not asked to open it.
   - The drafted text of each new page is one file beside the audit file, named `standards-page-<subject>-<timestamp>.md`, for a user who wants to read the page first.
   - Done when the files are written and nothing is written in the repository.
9. When no rule is in groups 1 to 4 and no page is new, end here with one message and no stop.
   - The message says that the repository's pages hold every default rule that applies, and how many were found present.
   - It gives the audit file's absolute path.
   - It names the tools of group 5 in one line, when there are any.
   - Done when that message ends the run, or a rule or a new page is left to show.
10. Show the draft (the stop "The draft"), in the order and the form below, with nothing else of the comparison.
    - A group with no rule is left out.
    - Group 1 shows each difference in full, lettered: the repository's rule quoted, its page and its section named in words, the default's rule quoted, what goes wrong under each in one plain sentence, and the choice.
    - Each quote of a difference is the sentence or the sentences that differ, never a whole item of several sentences.
    - The words of group 1 say that the two pages state the rule differently.
    - Group 2 takes one line per default page, with one yes or no for the whole group.
    - That line names the rules by their titles or opening words as the default page has them, and reprints none.
    - Group 3 takes one numbered line per rule: the rule in the words it would be added in, then its count as "<n> of <m>".
    - Group 4 takes one numbered line per rule: the rule in a few words, then what adopting it would break, with its count.
    - The numbers run on through groups 3 and 4, so that each number names one rule.
    - Group 5 takes one line for all its rules, which names the tools.
    - Each new page follows in one line, lettered on after the differences, or from A when there is no difference, with a yes or no of its own, and its text is not printed.
    - That line gives the page's subject, the path it would be written at, how many rules it would hold, those rules by their titles or opening words, and the absolute path of the file that holds its drafted text.
    - The line of the prose standard says that the page is the default page unchanged, and names its sections in place of rules.
    - A rule of group 2 or 3 that belongs to a new page stands in that page's line only: the yes or no of group 2 and the numbers of group 3 cover only rules added to pages that exist.
    - A rule of group 4 that belongs to a new page stays a numbered line of group 4, and its line names the page.
    - Each change to `plan.yaml` follows the new pages, one line each.
    - A question stands directly under the line of its rule, or under the line of the new page that holds its rule.
    - When Steps / standards 3 noted other pages of rules, one sentence names them and says that they were not compared, so a rule standing only there counts as missing.
    - One sentence then gives how many default rules were found present, and the audit file's absolute path.
    - The last line says how to answer.
    - A place is named by its page and its section in words. A line number may follow that name and never stands alone.
    - No line says where a rule added to a page that exists will be placed.
    - The last line gives the form of the answer, and says that whatever is left unanswered counts as no.
    - The draft of a made-up C++ and Python repository that lacks the Python page, every rule, quote, count and path in it made up:

      ```
      The draft. Nothing is written until you answer.

      Your page and the default page state a rule differently. Choose one.

      A. Which checks a builder runs before landing
         Your change standard, section "Verification", says: "The builder runs the whole verify list on the whole tree before it reports."
         The default says: "The whole verify list runs once, at landing. Before that, the builder runs only the checks of the files the step changes."
         Under yours: every step waits for the whole list, also a step that changes one page.
         Under the default: a failure outside the changed files shows only at landing.
         Keep yours, or take the default's?

      Rules on how work is done that your pages lack. Add them all, yes or no?

         From the default change standard: "A rewrite keeps the meaning of every rule it carries", "A change leaves no two statements that contradict each other", "Nothing is changed that no brief item asks for", "A secret in quoted command output is written `<REDACTED>`", "No breakage testing".

      Rules your code already follows. Each is added unless you strike its number.

         1. A pointer binds to its type: `T* p`, never `T *p`. 1,180 of 1,204 declarations.

      Rules your code does not follow. None is added unless you name its number.

         2. Every Python function annotates its parameters and its return type. 3 of 240 functions do, so adopting it leaves 237 breaking it. It belongs to the new page B below.

      Rules about tools the repository lacks, none added: clang-format, clang-tidy.

      New pages. Yes or no to each?

      B. The Python coding standards, at docs/dev/coding-standards/python.md, with 4 rules: "The code runs on Python 3.11 or newer", "Modules and functions are `snake_case`", "A handler names the exception class it catches", "A path is a `pathlib.Path`". Its text is in /tmp/standards-page-python-20260101-120000.md.

      61 default rules already stand in your pages. They are listed in /tmp/standards-audit-20260101-120000.md.

      Answer with: yours or the default's for A, yes or no for the rules on how work is done, the numbers to strike, the numbers to add, yes or no for B. Whatever you leave unanswered counts as no.
      ```

    - Done when the user has answered or corrected the draft.
11. Write the additions the answer approves, each at its place.
    - A rule of group 1 is added only where the user chose the default's rule.
    - The repository's rule of such a difference is left as written, and the last message says that it needs the user's own rewrite, which this mode does not make.
    - The rules of group 2 that go to pages that exist are added on the user's yes to group 2.
    - A rule of group 3 that goes to a page that exists is added unless the user struck its number.
    - A rule of group 4 is added only when the user named its number, and one that belongs to a new page only when that page also has its yes.
    - No rule of group 5 is added.
    - A new page is written on its own yes and on nothing else, with every rule its line named, and its change to `plan.yaml` is written with it.
    - A difference left without a choice, a yes or no left unanswered and a question left unanswered each count as no: nothing is written for it, and the last message names it.
    - An unanswered question drops its rule alone: a question under the line of a new page leaves the page, on its yes, written without that rule.
    - A page or a rule the user corrected is written as corrected.
    - The last message names every file written and, for each addition, the page and the section it now stands in.
    - Done when each approved addition stands in its file, the last message names them and no commit is made.

### review

1. Find the `ordo-init` skill's folder as "What it reads" 2 says.
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
   - A language the repository has, and whose page it lacks, is such a subject: the code in that language is held to the default page of that language.
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
    - A repository with no ADR folder gets one first, from the `ordo-init` skill's `templates/docs/adr/README.md` and `templates/docs/adr/template.md`.
    - The new folder stands at the path the `adr` key of the repository's `plan.yaml` names when it has one, and otherwise at `docs/adr/`.
    - Done when the record is written, or the user said no, or no rejection had such a reason.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No ordo-init folder | Either mode, at its Steps 1, when the `ordo-init` skill's folder does not stand beside this skill's folder | A refusal that names the folder | The `ordo-init` skill installed beside this skill, then the call again |
| The user interface | Either mode, after the repository's pages are read, when no page holds a UI standard and the repository tracks no `.svelte` file | The question whether the repository has a user interface a reader sees and operates, asked once | The user's answer |
| The draft | Steps / standards 10, before anything is written into the repository, when a rule is in groups 1 to 4 or a page is new | Each difference in full, the rules on how work is done named in one line per default page, one numbered line per rule the code follows and per rule it does not, the tools the repository lacks in one line, one line per new page, each change to `plan.yaml`, the draft's questions, how many rules were found present and the audit file's path | The user's answer or correction: a choice per difference, yes or no for group 2 and for each new page, the numbers struck and named, each question's answer |
| The candidates | Steps / review 9, after the report is written and opened | The report's absolute path and the question which candidate to explore | The user's pick, or the user's word that none is picked |
| The ADR offer | Steps / review 12, only when the user rejects a candidate for a reason a later review would need | The candidate, the reason and the offer to record it as an ADR | The user's yes or no |

- The first row is a refusal: it names its cause and writes nothing.
- The skills that `review` invokes, `/ordo-init`, `/roadmap add` and `/grill`, stop as their own Stops tables say.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A page that exists rewritten into the default page's structure | It rewrites rules the user already approved, and every record that cites a line of them goes stale | Leave each rule that stands as written, and draft only the rules the pages lack (Steps / standards 5 to 7) |
| A default rule written with its placeholder still in it | The page then states something nobody filled in | Fill it from the code, or put it to the user as a question in the draft |
| A draft that lists placements and line numbers in place of what each rule says | The user cannot judge a rule without opening the pages | Show each rule in its own words, in the form of its group, and keep the places for the audit file and the last message (Steps / standards 8, 10 and 11) |
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
