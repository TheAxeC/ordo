---
name: tutor
description: "Teach the user one topic over several sessions, in the folder it is run in as a teaching workspace: a mission written from an interview, short self-contained HTML lessons tied to the mission, each with a task that gives feedback, reference documents, a list of trusted resources, and learning records from which the next lesson is chosen; or explain one concept in the conversation, tied to the work at hand, from sources fetched in the run and named in the answer, with --page also as one HTML page in the lesson's form. Triggers on: /tutor, /tutor <topic>, /tutor explain <concept>, /tutor explain <concept> --page, teach me a topic, I want to learn a topic over several sessions, next lesson, explain this concept, explain the method you just offered."
metadata:
  version: "1.0.0"
---

# Tutor

`/tutor <topic>` teaches the user one topic over several sessions, from the files of the folder it is run in, the teaching workspace. It leaves behind the workspace's mission, resources, lessons, reference documents, learning records, components and notes. `/tutor explain <concept>` explains one concept in the conversation and writes no file, except the page of `--page` and a learning record the user says yes to.

## Quick start

```
/tutor <topic>                     start or continue teaching a topic in this folder, the teaching workspace
/tutor                             the next lesson of this workspace, chosen from its learning records
/tutor explain <concept>           explain one concept in the conversation, tied to the work at hand
/tutor explain <concept> --page    the same, and write the explanation as one HTML page in the lesson's form
```

## Use instead

| When | Use |
|---|---|
| The last message did not land and is to be said again | `/wait-what` |

## What it reads

1. The call: `/tutor` with a topic or none, or `explain` with a concept and with or without `--page`.
2. The folder the skill is run in, as "The teaching workspace" lists its files.
   - Its paths resolve from the folder `/tutor` was run in; only the paths under `references/` resolve from this skill's folder.
   - In the explain mode, the folder is a teaching workspace when it holds `MISSION.md`.
3. The format pages, each read by the step that writes its file: `references/mission-format.md`, `references/resources-format.md`, `references/learning-record-format.md` and `references/glossary-format.md`.
4. In the explain mode, the conversation so far, for the work at hand.
5. The sources the run fetches.

## Steps

### The call

1. Refuse a call that holds `--page` without `explain` (Stops, "`--page` without `explain`"), naming the three calls: `/tutor [<topic>]`, `/tutor explain <concept>` and `/tutor explain <concept> --page`.
   - Done when the refusal stands in the conversation, or the call holds `explain` or no `--page`.
2. Ask the user for the concept when the call holds `explain` with no concept (Stops, "No concept").
   - Done when the concept is named.
3. Run "Teaching" for a call without `explain`, and "Explaining" for a call with it.
   - Done when the mode is chosen.

### Teaching

1. Read `MISSION.md`, the learning records in `learning-records/` and `NOTES.md`, each that exists.
   - `RESOURCES.md` is read by items 4 and 6, and `assets/` by item 7, before the lesson is written.
   - No lesson and no reference document is read whole unless a step needs it.
   - Done when each of the three that exists is read.
2. Interview the user on why they want to learn the topic, when `MISSION.md` is missing or not populated, or the user is unclear about the mission (Stops, "The mission interview").
   - This is the first job of the run, before any lesson.
   - Without the mission, knowledge is not grounded in real-world aims, lessons feel too abstract, and nothing judges what the user should do next.
   - Write `MISSION.md` in the format of `references/mission-format.md`.
   - Done when `MISSION.md` holds the mission.
3. Confirm with the user before changing the mission, when the request or what the user has learned would change it (Stops, "The confirmation before the mission is changed").
   - Missions change as the user develops more skills and knowledge.
   - On the user's yes, update `MISSION.md` and add a learning record that captures the change.
   - Done when the user has answered, and after a yes `MISSION.md` and the learning record are written.
4. While `RESOURCES.md` is not well populated, focus on finding high-quality, high-trust resources that help the user acquire knowledge, and record them there in the format of `references/resources-format.md`.
   - Done when `RESOURCES.md` lists the resources the lesson draws on.
5. Choose what the lesson teaches: the exact thing the user names, or else the most relevant thing in the user's zone of proximal development.
   - In each lesson the user always feels challenged "just enough".
   - Find it from the learning records and from the mission, which says what the right thing to teach is.
   - Done when the one tightly scoped thing the lesson teaches is named.
6. Design the lesson around a skill the user is going to learn, as "Knowledge, skills and wisdom" describes the two.
   - The knowledge in the lesson is only what that skill requires.
   - Teach the knowledge first, then have the user practise the skill through an interactive feedback loop.
   - Draw the knowledge from the trusted resources of `RESOURCES.md`.
   - Keep the knowledge free of difficulty, which eats the working memory the user needs for understanding.
   - Make the practice of the skill effortful, so that the knowledge sticks, since effortful retrieval builds storage strength.
   - Build storage strength by desirable difficulty: retrieval practice (recall from memory), spacing (practice spread over time) and, for skills practice only, interleaving (different but related topics mixed in practice).
   - Teach a skill through an interactive lesson: quizzes and light tasks in the browser, or a guide through a list of real-world actions, such as yoga poses.
   - Give the user feedback on their performance in a feedback loop as tight as possible: at once and, ideally, automatically.
   - Give every answer of a quiz question the same number of words, and of characters where possible.
   - Vary which position holds the correct answer across the questions.
   - Give the user no clue to the answer through formatting or order.
   - Done when the lesson's knowledge, its task and the task's feedback are set.
7. Read `assets/` and build the lesson from the components already there.
   - Reuse of components is the default.
   - Write anything new that a second lesson could reuse as a component in `assets/`, and link the lesson to it, so that no lesson inlines code a later lesson would duplicate.
   - A shared stylesheet is the first component every workspace gets, and every lesson links it, so that the lessons look like one course.
   - The component library grows with the workspace.
   - Done when each component the lesson uses stands in `assets/`.
8. Write the lesson as one self-contained HTML file in `lessons/`, named `0001-<dash-case-name>.html`, the number one higher than the last lesson's.
   - It is beautiful, with clean, readable typography and layout in the manner of Edward Tufte, since the user returns to the lessons later to review.
   - It is short and fast to complete, since a learner's working memory is small and the lesson stays within it.
   - It gives the user one tangible win to build on.
   - It is tied to the mission.
   - It is in the user's zone of proximal development.
   - It links to other lessons and to reference documents with HTML anchors.
   - It recommends one primary source to read or watch: the highest-quality, highest-trust resource found on the topic.
   - It backs each claim with a citation, a link to an external resource, which makes the lesson more trustworthy.
   - It reminds the user to ask the agent follow-up questions, since the agent is their teacher and helps with anything unclear.
   - Done when the file stands in `lessons/`.
9. Write the reference documents of the lesson in `reference/`, as HTML files except the glossary, the compressed essence of the lesson in a form made for reference at a glance.
   - Lessons are rarely revisited and reference documents are, so the reference documents track the units of knowledge used across lessons, and lessons link to them.
   - They are beautiful documents that print well.
   - Reference documents suit these topics: syntax and code snippets for programming, algorithms and flowcharts for processes, poses and sequences for yoga, exercises and routines for fitness, and a glossary for any topic with its own nomenclature.
   - Glossaries, in particular, are an essential reference.
   - Write the glossary as the Markdown file `reference/GLOSSARY.md` of the teaching workspace, in the structure that `references/glossary-format.md` gives.
   - Once a glossary exists, every lesson adheres to it.
   - Done when each reference document the lesson needs stands in `reference/`.
10. Open the lesson for the user with a command-line command, where one is available.
    - Done when the lesson is open, or the user is given its path.

### Explaining

1. Read the conversation for the work at hand: what the session is doing, and where the concept came up, such as a method `/grill` offered as an option of a decision.
   - Done when the work at hand and the concept's place in it are known.
2. Fetch sources on the concept in this run: high-quality, high-trust resources.
   - Done when the sources the explanation rests on are fetched and read.
3. Explain the concept in the conversation, tied to the work at hand, from the sources of item 2 alone, as a lesson draws its knowledge from its resources.
   - Each claim cites the source it rests on.
   - The answer names each source fetched.
   - Done when the explanation stands in the conversation.
4. With `--page`, write the page as "The page" says.
   - Done when the page stands at its path, or the call holds no `--page`.
5. In a teaching workspace, offer a learning record for what the user showed they understand (Stops, "The offer of a learning record"), and write it in `learning-records/` in the format of `references/learning-record-format.md` only on the user's yes.
   - Make the offer once the user has shown in the conversation that they understand the concept, as `references/learning-record-format.md`, "When to write a learning record", says.
   - Done at once, with nothing offered, when the folder is no teaching workspace or the user has not shown that they understand the concept; otherwise done when the user has answered, and after a yes the record stands in `learning-records/`.

### The page

1. Name the page from the words of the concept: each run of letters and digits in lower case, joined by hyphens, followed by `.html`.
   - Every other character separates words, `/` and `.` among them, so the name holds no `/` and no `..`.
   - A made-up example: the concept `a/b ../c` gives `a-b-c.html`.
   - Done when the name is formed.
2. Choose the page's path: `reference/<name>` in a teaching workspace, and elsewhere the path the user gives, or the path the user names when asked (Stops, "The page's path").
   - A path that names a folder that exists holds the page under the name of item 1.
   - Done when the path is known.
3. Ask the user before a file that stands at the page's path is replaced (Stops, "The page's path").
   - Done when no file stands at the path, the user has said yes, or the user has named another path.
4. Write the explanation as one self-contained HTML page at the path, in the lesson's form that "Teaching" item 8 gives, and in a teaching workspace with the components of `assets/` as "Teaching" item 7 says.
   - Done when the page stands at the path.

## The teaching workspace

The state of the user's learning is captured in these files of the folder:

- **`MISSION.md`.** The reason the user is interested in the topic, which grounds all teaching, in the format of `references/mission-format.md`.
- **`RESOURCES.md`.** The resources explored to ground the teaching in contextual knowledge, or to acquire knowledge and wisdom, in the format of `references/resources-format.md`.
- **`reference/*.html` and `reference/GLOSSARY.md`.** The reference documents: the compressed learnings from the lessons, which are the raw units of learning, such as cheat sheets, reference algorithms, syntax and yoga poses as HTML files, and the glossary as a Markdown file in the structure of `references/glossary-format.md`.
- **`learning-records/*.md`.** The learning records, which capture what the user has learned and from which the zone of proximal development is worked out.
  - Loosely like architectural decision records in software development, they capture non-obvious lessons and key insights that may be revised later or drive later sessions.
  - Each is named `0001-<dash-case-name>.md`, the number one higher each time, in the format of `references/learning-record-format.md`.
- **`lessons/*.html`.** The lessons: a lesson is one self-contained HTML file that teaches one tightly scoped thing tied to the mission, and it is the primary unit of teaching, in which knowledge and skills reach the user.
- **`assets/*`.** The reusable components shared across lessons: stylesheets, quiz widgets, simulators, diagram helpers and anything else a second lesson could reuse.
- **`NOTES.md`.** A scratchpad for the user's preferences and for working notes.

## Knowledge, skills and wisdom

To learn at a deep level, the user needs three things:

- **Knowledge.** Captured from high-quality, high-trust resources, and acquired best without difficulty.
- **Skills.** Acquired through highly relevant interactive lessons devised from the knowledge, and made durable and flexible by difficulty, which is the tool here.
- **Wisdom.** Gained from interaction with other learners and practitioners: testing the skills in the real world, outside the learning environment.

Some topics need more skills than knowledge: theoretical physics leans on knowledge, and yoga on skills.

Lessons tell two strengths apart:

- **Fluency strength.** The retrieval of knowledge in the moment, which can give the user an illusory sense of mastery.
- **Storage strength.** The retention of knowledge over the long term, which is the real aim the lessons build towards.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| `--page` without `explain` | "The call" item 1: the call holds `--page` and no `explain` | A refusal that names the three calls `/tutor [<topic>]`, `/tutor explain <concept>` and `/tutor explain <concept> --page` | The call typed again |
| No concept | "The call" item 2: the call holds `explain` with no concept | The request for the concept | The concept from the user |
| The mission interview | "Teaching" item 2: `MISSION.md` is missing or not populated, or the user is unclear about the mission, before any lesson | The questions on why the user wants to learn the topic | The user's answers, until the mission is concrete enough to write |
| The confirmation before the mission is changed | "Teaching" item 3: the request, or what the user has learned, would change the mission | The change to `MISSION.md` | The user's yes, which updates `MISSION.md` and adds a learning record, or a no, which keeps the mission |
| The offer of a learning record | "Explaining" item 5, in a teaching workspace, once the user has shown they understand the concept | The learning record to write | The user's yes, which writes it, or a no, which writes nothing |
| The page's path | "The page" items 2 and 3: outside a teaching workspace with no path given, or a file stands at the page's path | The request for a path, or the path of the file that stands there | A path from the user, or the user's yes to replace the file |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A lesson taught from the model's own knowledge | It can teach what is made up, and the user has nothing to check it against | Draw the knowledge from the resources of `RESOURCES.md` and cite them in the lesson, as "Teaching" items 4 and 8 say |
| A lesson before the mission is known | The lesson is abstract, and nothing decides what comes next | Interview the user first, as "Teaching" item 2 says |
| Code inlined in a lesson that a later lesson would repeat | The lessons drift apart and stop looking like one course | Write it as a component in `assets/` and link it, as "Teaching" item 7 says |
| A quiz whose answer lengths, formatting or order point to the correct answer | The user answers from the clue, with no retrieval from memory | Equal answers and a varied position, as "Teaching" item 6 says |
| An explanation written to a file without `--page` | It stops the work the user was in to produce a page for an answer of a few paragraphs | Answer in the conversation, and write a page only for `--page` |

## Rules

- Every lesson is tied to the mission, the reason the user is interested in the topic.
- Never trust the model's parametric knowledge: every lesson and every explanation draws its knowledge from high-quality, high-trust resources.
- In the teaching mode, write a learning record whenever `references/learning-record-format.md`, "When to write a learning record", says one is due.
- When the user states a preference for how they want to be taught, or something to keep in mind, record it in `NOTES.md` and refer back to it when designing lessons or working with the user.
- When the user asks a question that appears to need wisdom, attempt an answer and then delegate the question to a community: a place, online or offline, where the user tests the skills in the real world, such as a forum, a subreddit, a real-world class when the budget allows, or a local interest group.
- Find high-reputation communities the user can join, and respect the user's preference when they do not want to join one.
